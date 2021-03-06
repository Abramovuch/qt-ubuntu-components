/*
 * Copyright 2012 Canonical Ltd.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * Author: Florian Boucault <florian.boucault@canonical.com>
 */

#include "ucscalingimageprovider.h"

#include <QtCore/QFile>
#include <QtGui/QImageReader>

/*!
    \internal

    The UCScalingImageProvider class loads and scales images.
    It responds to URLs of the form "image://scaling/scale/path" where:
    - 'scale' is the scaling factor applied to the image
    - 'path' is the full path of the image on the filesystem

    Example:
     * image://scaling/0.5/arrow.png
*/
UCScalingImageProvider::UCScalingImageProvider() : QQuickImageProvider(QQuickImageProvider::Image)
{
}

QImage UCScalingImageProvider::requestImage(const QString &id, QSize *size, const QSize &requestedSize)
{
    Q_UNUSED(requestedSize);

    int separatorPosition = id.indexOf("/");
    float scaleFactor = id.left(separatorPosition).toFloat();
    QString path = id.mid(separatorPosition+1);
    QFile file(path);

    if (file.open(QIODevice::ReadOnly)) {
        QImage image;
        QImageReader imageReader(&file);
        if (!qFuzzyCompare(scaleFactor, (float)1.0)) {
            QSize realSize = imageReader.size();
            imageReader.setScaledSize(realSize * scaleFactor);
        }
        imageReader.read(&image);
        *size = image.size();
        return image;
    } else {
        return QImage();
    }
}
