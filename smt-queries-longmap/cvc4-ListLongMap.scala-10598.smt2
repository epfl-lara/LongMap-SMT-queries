; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124730 () Bool)

(assert start!124730)

(declare-fun b!1446071 () Bool)

(declare-fun res!977884 () Bool)

(declare-fun e!814507 () Bool)

(assert (=> b!1446071 (=> (not res!977884) (not e!814507))))

(declare-datatypes ((array!98178 0))(
  ( (array!98179 (arr!47377 (Array (_ BitVec 32) (_ BitVec 64))) (size!47927 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98178)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98178 (_ BitVec 32)) Bool)

(assert (=> b!1446071 (= res!977884 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1446072 () Bool)

(declare-fun res!977877 () Bool)

(declare-fun e!814502 () Bool)

(assert (=> b!1446072 (=> (not res!977877) (not e!814502))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1446072 (= res!977877 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1446073 () Bool)

(declare-fun res!977871 () Bool)

(assert (=> b!1446073 (=> (not res!977871) (not e!814502))))

(declare-fun e!814506 () Bool)

(assert (=> b!1446073 (= res!977871 e!814506)))

(declare-fun c!133611 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1446073 (= c!133611 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1446074 () Bool)

(declare-fun res!977878 () Bool)

(assert (=> b!1446074 (=> (not res!977878) (not e!814507))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1446074 (= res!977878 (validKeyInArray!0 (select (arr!47377 a!2862) i!1006)))))

(declare-fun b!1446075 () Bool)

(declare-fun e!814508 () Bool)

(assert (=> b!1446075 (= e!814508 e!814502)))

(declare-fun res!977883 () Bool)

(assert (=> b!1446075 (=> (not res!977883) (not e!814502))))

(declare-datatypes ((SeekEntryResult!11629 0))(
  ( (MissingZero!11629 (index!48908 (_ BitVec 32))) (Found!11629 (index!48909 (_ BitVec 32))) (Intermediate!11629 (undefined!12441 Bool) (index!48910 (_ BitVec 32)) (x!130590 (_ BitVec 32))) (Undefined!11629) (MissingVacant!11629 (index!48911 (_ BitVec 32))) )
))
(declare-fun lt!634682 () SeekEntryResult!11629)

(assert (=> b!1446075 (= res!977883 (= lt!634682 (Intermediate!11629 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!634684 () (_ BitVec 64))

(declare-fun lt!634686 () array!98178)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98178 (_ BitVec 32)) SeekEntryResult!11629)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1446075 (= lt!634682 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634684 mask!2687) lt!634684 lt!634686 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1446075 (= lt!634684 (select (store (arr!47377 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1446076 () Bool)

(assert (=> b!1446076 (= e!814502 (not true))))

(declare-fun e!814505 () Bool)

(assert (=> b!1446076 e!814505))

(declare-fun res!977870 () Bool)

(assert (=> b!1446076 (=> (not res!977870) (not e!814505))))

(assert (=> b!1446076 (= res!977870 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48754 0))(
  ( (Unit!48755) )
))
(declare-fun lt!634683 () Unit!48754)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98178 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48754)

(assert (=> b!1446076 (= lt!634683 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1446077 () Bool)

(declare-fun e!814503 () Bool)

(assert (=> b!1446077 (= e!814507 e!814503)))

(declare-fun res!977874 () Bool)

(assert (=> b!1446077 (=> (not res!977874) (not e!814503))))

(assert (=> b!1446077 (= res!977874 (= (select (store (arr!47377 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1446077 (= lt!634686 (array!98179 (store (arr!47377 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47927 a!2862)))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1446079 () Bool)

(assert (=> b!1446079 (= e!814506 (= lt!634682 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634684 lt!634686 mask!2687)))))

(declare-fun b!1446080 () Bool)

(declare-fun res!977876 () Bool)

(assert (=> b!1446080 (=> (not res!977876) (not e!814507))))

(assert (=> b!1446080 (= res!977876 (validKeyInArray!0 (select (arr!47377 a!2862) j!93)))))

(declare-fun b!1446081 () Bool)

(declare-fun res!977881 () Bool)

(assert (=> b!1446081 (=> (not res!977881) (not e!814505))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98178 (_ BitVec 32)) SeekEntryResult!11629)

(assert (=> b!1446081 (= res!977881 (= (seekEntryOrOpen!0 (select (arr!47377 a!2862) j!93) a!2862 mask!2687) (Found!11629 j!93)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1446082 () Bool)

(assert (=> b!1446082 (= e!814505 (or (= (select (arr!47377 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47377 a!2862) intermediateBeforeIndex!19) (select (arr!47377 a!2862) j!93))))))

(declare-fun b!1446083 () Bool)

(declare-fun res!977879 () Bool)

(assert (=> b!1446083 (=> (not res!977879) (not e!814508))))

(declare-fun lt!634685 () SeekEntryResult!11629)

(assert (=> b!1446083 (= res!977879 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47377 a!2862) j!93) a!2862 mask!2687) lt!634685))))

(declare-fun b!1446084 () Bool)

(declare-fun res!977873 () Bool)

(assert (=> b!1446084 (=> (not res!977873) (not e!814507))))

(declare-datatypes ((List!33878 0))(
  ( (Nil!33875) (Cons!33874 (h!35224 (_ BitVec 64)) (t!48572 List!33878)) )
))
(declare-fun arrayNoDuplicates!0 (array!98178 (_ BitVec 32) List!33878) Bool)

(assert (=> b!1446084 (= res!977873 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33875))))

(declare-fun b!1446085 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98178 (_ BitVec 32)) SeekEntryResult!11629)

(assert (=> b!1446085 (= e!814506 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634684 lt!634686 mask!2687) (seekEntryOrOpen!0 lt!634684 lt!634686 mask!2687)))))

(declare-fun b!1446086 () Bool)

(assert (=> b!1446086 (= e!814503 e!814508)))

(declare-fun res!977882 () Bool)

(assert (=> b!1446086 (=> (not res!977882) (not e!814508))))

(assert (=> b!1446086 (= res!977882 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47377 a!2862) j!93) mask!2687) (select (arr!47377 a!2862) j!93) a!2862 mask!2687) lt!634685))))

(assert (=> b!1446086 (= lt!634685 (Intermediate!11629 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1446087 () Bool)

(declare-fun res!977880 () Bool)

(assert (=> b!1446087 (=> (not res!977880) (not e!814507))))

(assert (=> b!1446087 (= res!977880 (and (= (size!47927 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47927 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47927 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!977875 () Bool)

(assert (=> start!124730 (=> (not res!977875) (not e!814507))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124730 (= res!977875 (validMask!0 mask!2687))))

(assert (=> start!124730 e!814507))

(assert (=> start!124730 true))

(declare-fun array_inv!36405 (array!98178) Bool)

(assert (=> start!124730 (array_inv!36405 a!2862)))

(declare-fun b!1446078 () Bool)

(declare-fun res!977872 () Bool)

(assert (=> b!1446078 (=> (not res!977872) (not e!814507))))

(assert (=> b!1446078 (= res!977872 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47927 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47927 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47927 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!124730 res!977875) b!1446087))

(assert (= (and b!1446087 res!977880) b!1446074))

(assert (= (and b!1446074 res!977878) b!1446080))

(assert (= (and b!1446080 res!977876) b!1446071))

(assert (= (and b!1446071 res!977884) b!1446084))

(assert (= (and b!1446084 res!977873) b!1446078))

(assert (= (and b!1446078 res!977872) b!1446077))

(assert (= (and b!1446077 res!977874) b!1446086))

(assert (= (and b!1446086 res!977882) b!1446083))

(assert (= (and b!1446083 res!977879) b!1446075))

(assert (= (and b!1446075 res!977883) b!1446073))

(assert (= (and b!1446073 c!133611) b!1446079))

(assert (= (and b!1446073 (not c!133611)) b!1446085))

(assert (= (and b!1446073 res!977871) b!1446072))

(assert (= (and b!1446072 res!977877) b!1446076))

(assert (= (and b!1446076 res!977870) b!1446081))

(assert (= (and b!1446081 res!977881) b!1446082))

(declare-fun m!1334979 () Bool)

(assert (=> b!1446075 m!1334979))

(assert (=> b!1446075 m!1334979))

(declare-fun m!1334981 () Bool)

(assert (=> b!1446075 m!1334981))

(declare-fun m!1334983 () Bool)

(assert (=> b!1446075 m!1334983))

(declare-fun m!1334985 () Bool)

(assert (=> b!1446075 m!1334985))

(declare-fun m!1334987 () Bool)

(assert (=> b!1446079 m!1334987))

(declare-fun m!1334989 () Bool)

(assert (=> b!1446086 m!1334989))

(assert (=> b!1446086 m!1334989))

(declare-fun m!1334991 () Bool)

(assert (=> b!1446086 m!1334991))

(assert (=> b!1446086 m!1334991))

(assert (=> b!1446086 m!1334989))

(declare-fun m!1334993 () Bool)

(assert (=> b!1446086 m!1334993))

(assert (=> b!1446080 m!1334989))

(assert (=> b!1446080 m!1334989))

(declare-fun m!1334995 () Bool)

(assert (=> b!1446080 m!1334995))

(declare-fun m!1334997 () Bool)

(assert (=> b!1446074 m!1334997))

(assert (=> b!1446074 m!1334997))

(declare-fun m!1334999 () Bool)

(assert (=> b!1446074 m!1334999))

(declare-fun m!1335001 () Bool)

(assert (=> b!1446076 m!1335001))

(declare-fun m!1335003 () Bool)

(assert (=> b!1446076 m!1335003))

(declare-fun m!1335005 () Bool)

(assert (=> b!1446071 m!1335005))

(assert (=> b!1446077 m!1334983))

(declare-fun m!1335007 () Bool)

(assert (=> b!1446077 m!1335007))

(declare-fun m!1335009 () Bool)

(assert (=> b!1446084 m!1335009))

(declare-fun m!1335011 () Bool)

(assert (=> b!1446085 m!1335011))

(declare-fun m!1335013 () Bool)

(assert (=> b!1446085 m!1335013))

(declare-fun m!1335015 () Bool)

(assert (=> b!1446082 m!1335015))

(assert (=> b!1446082 m!1334989))

(assert (=> b!1446083 m!1334989))

(assert (=> b!1446083 m!1334989))

(declare-fun m!1335017 () Bool)

(assert (=> b!1446083 m!1335017))

(assert (=> b!1446081 m!1334989))

(assert (=> b!1446081 m!1334989))

(declare-fun m!1335019 () Bool)

(assert (=> b!1446081 m!1335019))

(declare-fun m!1335021 () Bool)

(assert (=> start!124730 m!1335021))

(declare-fun m!1335023 () Bool)

(assert (=> start!124730 m!1335023))

(push 1)

