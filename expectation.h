#ifndef EXPECTATION_H
#define EXPECTATION_H

#include "abstract.h"

class Expectation : public Abstract
{
    Q_OBJECT

    Q_PROPERTY(QString description READ description WRITE setDescription NOTIFY descriptionChanged)

public:
    explicit Expectation(QObject *parent = 0);

    inline QString description() const { return m_description; }
    void setDescription(const QString &description);

signals:
    void descriptionChanged();

public slots:

private:
    QString m_description;
};

#endif // EXPECTATION_H
