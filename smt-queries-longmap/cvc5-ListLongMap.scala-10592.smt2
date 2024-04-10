; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124690 () Bool)

(assert start!124690)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1445051 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!634383 () (_ BitVec 64))

(declare-fun e!814088 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((array!98138 0))(
  ( (array!98139 (arr!47357 (Array (_ BitVec 32) (_ BitVec 64))) (size!47907 (_ BitVec 32))) )
))
(declare-fun lt!634386 () array!98138)

(declare-datatypes ((SeekEntryResult!11609 0))(
  ( (MissingZero!11609 (index!48828 (_ BitVec 32))) (Found!11609 (index!48829 (_ BitVec 32))) (Intermediate!11609 (undefined!12421 Bool) (index!48830 (_ BitVec 32)) (x!130522 (_ BitVec 32))) (Undefined!11609) (MissingVacant!11609 (index!48831 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98138 (_ BitVec 32)) SeekEntryResult!11609)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98138 (_ BitVec 32)) SeekEntryResult!11609)

(assert (=> b!1445051 (= e!814088 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634383 lt!634386 mask!2687) (seekEntryOrOpen!0 lt!634383 lt!634386 mask!2687)))))

(declare-fun b!1445052 () Bool)

(declare-fun res!976977 () Bool)

(declare-fun e!814087 () Bool)

(assert (=> b!1445052 (=> (not res!976977) (not e!814087))))

(declare-fun a!2862 () array!98138)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1445052 (= res!976977 (= (seekEntryOrOpen!0 (select (arr!47357 a!2862) j!93) a!2862 mask!2687) (Found!11609 j!93)))))

(declare-fun b!1445053 () Bool)

(declare-fun res!976972 () Bool)

(declare-fun e!814085 () Bool)

(assert (=> b!1445053 (=> (not res!976972) (not e!814085))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1445053 (= res!976972 (and (= (size!47907 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47907 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47907 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1445054 () Bool)

(declare-fun res!976980 () Bool)

(declare-fun e!814086 () Bool)

(assert (=> b!1445054 (=> (not res!976980) (not e!814086))))

(declare-fun lt!634385 () SeekEntryResult!11609)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98138 (_ BitVec 32)) SeekEntryResult!11609)

(assert (=> b!1445054 (= res!976980 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47357 a!2862) j!93) a!2862 mask!2687) lt!634385))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1445055 () Bool)

(assert (=> b!1445055 (= e!814087 (or (= (select (arr!47357 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47357 a!2862) intermediateBeforeIndex!19) (select (arr!47357 a!2862) j!93))))))

(declare-fun b!1445056 () Bool)

(declare-fun e!814083 () Bool)

(assert (=> b!1445056 (= e!814085 e!814083)))

(declare-fun res!976979 () Bool)

(assert (=> b!1445056 (=> (not res!976979) (not e!814083))))

(assert (=> b!1445056 (= res!976979 (= (select (store (arr!47357 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1445056 (= lt!634386 (array!98139 (store (arr!47357 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47907 a!2862)))))

(declare-fun b!1445057 () Bool)

(declare-fun res!976973 () Bool)

(assert (=> b!1445057 (=> (not res!976973) (not e!814085))))

(declare-datatypes ((List!33858 0))(
  ( (Nil!33855) (Cons!33854 (h!35204 (_ BitVec 64)) (t!48552 List!33858)) )
))
(declare-fun arrayNoDuplicates!0 (array!98138 (_ BitVec 32) List!33858) Bool)

(assert (=> b!1445057 (= res!976973 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33855))))

(declare-fun res!976974 () Bool)

(assert (=> start!124690 (=> (not res!976974) (not e!814085))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124690 (= res!976974 (validMask!0 mask!2687))))

(assert (=> start!124690 e!814085))

(assert (=> start!124690 true))

(declare-fun array_inv!36385 (array!98138) Bool)

(assert (=> start!124690 (array_inv!36385 a!2862)))

(declare-fun b!1445058 () Bool)

(declare-fun res!976976 () Bool)

(declare-fun e!814084 () Bool)

(assert (=> b!1445058 (=> (not res!976976) (not e!814084))))

(assert (=> b!1445058 (= res!976976 e!814088)))

(declare-fun c!133551 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1445058 (= c!133551 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1445059 () Bool)

(assert (=> b!1445059 (= e!814083 e!814086)))

(declare-fun res!976975 () Bool)

(assert (=> b!1445059 (=> (not res!976975) (not e!814086))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1445059 (= res!976975 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47357 a!2862) j!93) mask!2687) (select (arr!47357 a!2862) j!93) a!2862 mask!2687) lt!634385))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1445059 (= lt!634385 (Intermediate!11609 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1445060 () Bool)

(declare-fun res!976983 () Bool)

(assert (=> b!1445060 (=> (not res!976983) (not e!814084))))

(assert (=> b!1445060 (= res!976983 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun lt!634384 () SeekEntryResult!11609)

(declare-fun b!1445061 () Bool)

(assert (=> b!1445061 (= e!814088 (= lt!634384 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634383 lt!634386 mask!2687)))))

(declare-fun b!1445062 () Bool)

(declare-fun res!976984 () Bool)

(assert (=> b!1445062 (=> (not res!976984) (not e!814085))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98138 (_ BitVec 32)) Bool)

(assert (=> b!1445062 (= res!976984 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1445063 () Bool)

(declare-fun res!976978 () Bool)

(assert (=> b!1445063 (=> (not res!976978) (not e!814085))))

(assert (=> b!1445063 (= res!976978 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47907 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47907 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47907 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1445064 () Bool)

(declare-fun res!976982 () Bool)

(assert (=> b!1445064 (=> (not res!976982) (not e!814085))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1445064 (= res!976982 (validKeyInArray!0 (select (arr!47357 a!2862) j!93)))))

(declare-fun b!1445065 () Bool)

(assert (=> b!1445065 (= e!814084 (not true))))

(assert (=> b!1445065 e!814087))

(declare-fun res!976981 () Bool)

(assert (=> b!1445065 (=> (not res!976981) (not e!814087))))

(assert (=> b!1445065 (= res!976981 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48714 0))(
  ( (Unit!48715) )
))
(declare-fun lt!634382 () Unit!48714)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98138 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48714)

(assert (=> b!1445065 (= lt!634382 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1445066 () Bool)

(assert (=> b!1445066 (= e!814086 e!814084)))

(declare-fun res!976971 () Bool)

(assert (=> b!1445066 (=> (not res!976971) (not e!814084))))

(assert (=> b!1445066 (= res!976971 (= lt!634384 (Intermediate!11609 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1445066 (= lt!634384 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634383 mask!2687) lt!634383 lt!634386 mask!2687))))

(assert (=> b!1445066 (= lt!634383 (select (store (arr!47357 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1445067 () Bool)

(declare-fun res!976970 () Bool)

(assert (=> b!1445067 (=> (not res!976970) (not e!814085))))

(assert (=> b!1445067 (= res!976970 (validKeyInArray!0 (select (arr!47357 a!2862) i!1006)))))

(assert (= (and start!124690 res!976974) b!1445053))

(assert (= (and b!1445053 res!976972) b!1445067))

(assert (= (and b!1445067 res!976970) b!1445064))

(assert (= (and b!1445064 res!976982) b!1445062))

(assert (= (and b!1445062 res!976984) b!1445057))

(assert (= (and b!1445057 res!976973) b!1445063))

(assert (= (and b!1445063 res!976978) b!1445056))

(assert (= (and b!1445056 res!976979) b!1445059))

(assert (= (and b!1445059 res!976975) b!1445054))

(assert (= (and b!1445054 res!976980) b!1445066))

(assert (= (and b!1445066 res!976971) b!1445058))

(assert (= (and b!1445058 c!133551) b!1445061))

(assert (= (and b!1445058 (not c!133551)) b!1445051))

(assert (= (and b!1445058 res!976976) b!1445060))

(assert (= (and b!1445060 res!976983) b!1445065))

(assert (= (and b!1445065 res!976981) b!1445052))

(assert (= (and b!1445052 res!976977) b!1445055))

(declare-fun m!1334035 () Bool)

(assert (=> start!124690 m!1334035))

(declare-fun m!1334037 () Bool)

(assert (=> start!124690 m!1334037))

(declare-fun m!1334039 () Bool)

(assert (=> b!1445056 m!1334039))

(declare-fun m!1334041 () Bool)

(assert (=> b!1445056 m!1334041))

(declare-fun m!1334043 () Bool)

(assert (=> b!1445052 m!1334043))

(assert (=> b!1445052 m!1334043))

(declare-fun m!1334045 () Bool)

(assert (=> b!1445052 m!1334045))

(declare-fun m!1334047 () Bool)

(assert (=> b!1445061 m!1334047))

(declare-fun m!1334049 () Bool)

(assert (=> b!1445065 m!1334049))

(declare-fun m!1334051 () Bool)

(assert (=> b!1445065 m!1334051))

(declare-fun m!1334053 () Bool)

(assert (=> b!1445066 m!1334053))

(assert (=> b!1445066 m!1334053))

(declare-fun m!1334055 () Bool)

(assert (=> b!1445066 m!1334055))

(assert (=> b!1445066 m!1334039))

(declare-fun m!1334057 () Bool)

(assert (=> b!1445066 m!1334057))

(declare-fun m!1334059 () Bool)

(assert (=> b!1445067 m!1334059))

(assert (=> b!1445067 m!1334059))

(declare-fun m!1334061 () Bool)

(assert (=> b!1445067 m!1334061))

(declare-fun m!1334063 () Bool)

(assert (=> b!1445055 m!1334063))

(assert (=> b!1445055 m!1334043))

(declare-fun m!1334065 () Bool)

(assert (=> b!1445062 m!1334065))

(declare-fun m!1334067 () Bool)

(assert (=> b!1445051 m!1334067))

(declare-fun m!1334069 () Bool)

(assert (=> b!1445051 m!1334069))

(assert (=> b!1445064 m!1334043))

(assert (=> b!1445064 m!1334043))

(declare-fun m!1334071 () Bool)

(assert (=> b!1445064 m!1334071))

(assert (=> b!1445054 m!1334043))

(assert (=> b!1445054 m!1334043))

(declare-fun m!1334073 () Bool)

(assert (=> b!1445054 m!1334073))

(declare-fun m!1334075 () Bool)

(assert (=> b!1445057 m!1334075))

(assert (=> b!1445059 m!1334043))

(assert (=> b!1445059 m!1334043))

(declare-fun m!1334077 () Bool)

(assert (=> b!1445059 m!1334077))

(assert (=> b!1445059 m!1334077))

(assert (=> b!1445059 m!1334043))

(declare-fun m!1334079 () Bool)

(assert (=> b!1445059 m!1334079))

(push 1)

