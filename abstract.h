#ifndef ABSTRACT_H
#define ABSTRACT_H

#include <QObject>

#include <qdjango/db/QDjangoModel.h>

class Abstract: public QDjangoModel
{
    Q_OBJECT

public:
    explicit Abstract(QObject *parent = 0);

    Q_INVOKABLE inline bool save() { return QDjangoModel::save(); }
    Q_INVOKABLE inline int id() { return pk().toInt(); }

};

#endif // ABSTRACT_H

