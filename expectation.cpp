#include "expectation.h"

Expectation::Expectation(QObject *parent) :
    Abstract(parent)
  , m_whites(0)
  , m_blacks(0)
{

}

void Expectation::setDescription(const QString &description) {
    if (m_description != description) {
        m_description = description;
        emit descriptionChanged();
    }
}

Q_DECLARE_METATYPE(Expectation*)
