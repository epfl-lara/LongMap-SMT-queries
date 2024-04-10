; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124768 () Bool)

(assert start!124768)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!815023 () Bool)

(declare-fun b!1447116 () Bool)

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1447116 (= e!815023 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1447117 () Bool)

(declare-fun e!815022 () Bool)

(declare-fun e!815019 () Bool)

(assert (=> b!1447117 (= e!815022 e!815019)))

(declare-fun res!978805 () Bool)

(assert (=> b!1447117 (=> (not res!978805) (not e!815019))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98216 0))(
  ( (array!98217 (arr!47396 (Array (_ BitVec 32) (_ BitVec 64))) (size!47946 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98216)

(assert (=> b!1447117 (= res!978805 (= (select (store (arr!47396 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!635044 () array!98216)

(assert (=> b!1447117 (= lt!635044 (array!98217 (store (arr!47396 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47946 a!2862)))))

(declare-fun e!815017 () Bool)

(declare-fun lt!635046 () (_ BitVec 64))

(declare-fun b!1447118 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11648 0))(
  ( (MissingZero!11648 (index!48984 (_ BitVec 32))) (Found!11648 (index!48985 (_ BitVec 32))) (Intermediate!11648 (undefined!12460 Bool) (index!48986 (_ BitVec 32)) (x!130665 (_ BitVec 32))) (Undefined!11648) (MissingVacant!11648 (index!48987 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98216 (_ BitVec 32)) SeekEntryResult!11648)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98216 (_ BitVec 32)) SeekEntryResult!11648)

(assert (=> b!1447118 (= e!815017 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635046 lt!635044 mask!2687) (seekEntryOrOpen!0 lt!635046 lt!635044 mask!2687)))))

(declare-fun res!978803 () Bool)

(assert (=> start!124768 (=> (not res!978803) (not e!815022))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124768 (= res!978803 (validMask!0 mask!2687))))

(assert (=> start!124768 e!815022))

(assert (=> start!124768 true))

(declare-fun array_inv!36424 (array!98216) Bool)

(assert (=> start!124768 (array_inv!36424 a!2862)))

(declare-fun b!1447119 () Bool)

(declare-fun e!815018 () Bool)

(assert (=> b!1447119 (= e!815018 e!815023)))

(declare-fun res!978802 () Bool)

(assert (=> b!1447119 (=> (not res!978802) (not e!815023))))

(declare-fun lt!635049 () SeekEntryResult!11648)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1447119 (= res!978802 (= lt!635049 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47396 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1447120 () Bool)

(declare-fun res!978817 () Bool)

(assert (=> b!1447120 (=> (not res!978817) (not e!815022))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1447120 (= res!978817 (validKeyInArray!0 (select (arr!47396 a!2862) j!93)))))

(declare-fun b!1447121 () Bool)

(declare-fun res!978816 () Bool)

(declare-fun e!815021 () Bool)

(assert (=> b!1447121 (=> (not res!978816) (not e!815021))))

(assert (=> b!1447121 (= res!978816 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1447122 () Bool)

(declare-fun res!978815 () Bool)

(assert (=> b!1447122 (=> (not res!978815) (not e!815021))))

(assert (=> b!1447122 (= res!978815 e!815017)))

(declare-fun c!133668 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1447122 (= c!133668 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1447123 () Bool)

(declare-fun e!815016 () Bool)

(assert (=> b!1447123 (= e!815016 e!815018)))

(declare-fun res!978811 () Bool)

(assert (=> b!1447123 (=> res!978811 e!815018)))

(assert (=> b!1447123 (= res!978811 (or (and (= (select (arr!47396 a!2862) index!646) (select (store (arr!47396 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47396 a!2862) index!646) (select (arr!47396 a!2862) j!93))) (not (= (select (arr!47396 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1447124 () Bool)

(declare-fun res!978814 () Bool)

(assert (=> b!1447124 (=> (not res!978814) (not e!815022))))

(declare-datatypes ((List!33897 0))(
  ( (Nil!33894) (Cons!33893 (h!35243 (_ BitVec 64)) (t!48591 List!33897)) )
))
(declare-fun arrayNoDuplicates!0 (array!98216 (_ BitVec 32) List!33897) Bool)

(assert (=> b!1447124 (= res!978814 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33894))))

(declare-fun b!1447125 () Bool)

(declare-fun e!815015 () Bool)

(assert (=> b!1447125 (= e!815021 (not e!815015))))

(declare-fun res!978807 () Bool)

(assert (=> b!1447125 (=> res!978807 e!815015)))

(assert (=> b!1447125 (= res!978807 (or (and (= (select (arr!47396 a!2862) index!646) (select (store (arr!47396 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47396 a!2862) index!646) (select (arr!47396 a!2862) j!93))) (not (= (select (arr!47396 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47396 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1447125 e!815016))

(declare-fun res!978808 () Bool)

(assert (=> b!1447125 (=> (not res!978808) (not e!815016))))

(assert (=> b!1447125 (= res!978808 (and (= lt!635049 (Found!11648 j!93)) (or (= (select (arr!47396 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47396 a!2862) intermediateBeforeIndex!19) (select (arr!47396 a!2862) j!93)))))))

(assert (=> b!1447125 (= lt!635049 (seekEntryOrOpen!0 (select (arr!47396 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98216 (_ BitVec 32)) Bool)

(assert (=> b!1447125 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48792 0))(
  ( (Unit!48793) )
))
(declare-fun lt!635048 () Unit!48792)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98216 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48792)

(assert (=> b!1447125 (= lt!635048 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1447126 () Bool)

(declare-fun e!815020 () Bool)

(assert (=> b!1447126 (= e!815020 e!815021)))

(declare-fun res!978810 () Bool)

(assert (=> b!1447126 (=> (not res!978810) (not e!815021))))

(declare-fun lt!635043 () SeekEntryResult!11648)

(assert (=> b!1447126 (= res!978810 (= lt!635043 (Intermediate!11648 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98216 (_ BitVec 32)) SeekEntryResult!11648)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1447126 (= lt!635043 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635046 mask!2687) lt!635046 lt!635044 mask!2687))))

(assert (=> b!1447126 (= lt!635046 (select (store (arr!47396 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1447127 () Bool)

(declare-fun res!978804 () Bool)

(assert (=> b!1447127 (=> (not res!978804) (not e!815020))))

(declare-fun lt!635045 () SeekEntryResult!11648)

(assert (=> b!1447127 (= res!978804 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47396 a!2862) j!93) a!2862 mask!2687) lt!635045))))

(declare-fun b!1447128 () Bool)

(declare-fun res!978809 () Bool)

(assert (=> b!1447128 (=> (not res!978809) (not e!815022))))

(assert (=> b!1447128 (= res!978809 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1447129 () Bool)

(declare-fun res!978813 () Bool)

(assert (=> b!1447129 (=> (not res!978813) (not e!815022))))

(assert (=> b!1447129 (= res!978813 (validKeyInArray!0 (select (arr!47396 a!2862) i!1006)))))

(declare-fun b!1447130 () Bool)

(declare-fun res!978801 () Bool)

(assert (=> b!1447130 (=> (not res!978801) (not e!815022))))

(assert (=> b!1447130 (= res!978801 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47946 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47946 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47946 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1447131 () Bool)

(assert (=> b!1447131 (= e!815015 true)))

(declare-fun lt!635047 () SeekEntryResult!11648)

(assert (=> b!1447131 (= lt!635047 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47396 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1447132 () Bool)

(declare-fun res!978806 () Bool)

(assert (=> b!1447132 (=> (not res!978806) (not e!815022))))

(assert (=> b!1447132 (= res!978806 (and (= (size!47946 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47946 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47946 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1447133 () Bool)

(assert (=> b!1447133 (= e!815019 e!815020)))

(declare-fun res!978812 () Bool)

(assert (=> b!1447133 (=> (not res!978812) (not e!815020))))

(assert (=> b!1447133 (= res!978812 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47396 a!2862) j!93) mask!2687) (select (arr!47396 a!2862) j!93) a!2862 mask!2687) lt!635045))))

(assert (=> b!1447133 (= lt!635045 (Intermediate!11648 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1447134 () Bool)

(assert (=> b!1447134 (= e!815017 (= lt!635043 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635046 lt!635044 mask!2687)))))

(assert (= (and start!124768 res!978803) b!1447132))

(assert (= (and b!1447132 res!978806) b!1447129))

(assert (= (and b!1447129 res!978813) b!1447120))

(assert (= (and b!1447120 res!978817) b!1447128))

(assert (= (and b!1447128 res!978809) b!1447124))

(assert (= (and b!1447124 res!978814) b!1447130))

(assert (= (and b!1447130 res!978801) b!1447117))

(assert (= (and b!1447117 res!978805) b!1447133))

(assert (= (and b!1447133 res!978812) b!1447127))

(assert (= (and b!1447127 res!978804) b!1447126))

(assert (= (and b!1447126 res!978810) b!1447122))

(assert (= (and b!1447122 c!133668) b!1447134))

(assert (= (and b!1447122 (not c!133668)) b!1447118))

(assert (= (and b!1447122 res!978815) b!1447121))

(assert (= (and b!1447121 res!978816) b!1447125))

(assert (= (and b!1447125 res!978808) b!1447123))

(assert (= (and b!1447123 (not res!978811)) b!1447119))

(assert (= (and b!1447119 res!978802) b!1447116))

(assert (= (and b!1447125 (not res!978807)) b!1447131))

(declare-fun m!1335949 () Bool)

(assert (=> b!1447119 m!1335949))

(assert (=> b!1447119 m!1335949))

(declare-fun m!1335951 () Bool)

(assert (=> b!1447119 m!1335951))

(assert (=> b!1447120 m!1335949))

(assert (=> b!1447120 m!1335949))

(declare-fun m!1335953 () Bool)

(assert (=> b!1447120 m!1335953))

(declare-fun m!1335955 () Bool)

(assert (=> b!1447134 m!1335955))

(declare-fun m!1335957 () Bool)

(assert (=> b!1447129 m!1335957))

(assert (=> b!1447129 m!1335957))

(declare-fun m!1335959 () Bool)

(assert (=> b!1447129 m!1335959))

(declare-fun m!1335961 () Bool)

(assert (=> b!1447126 m!1335961))

(assert (=> b!1447126 m!1335961))

(declare-fun m!1335963 () Bool)

(assert (=> b!1447126 m!1335963))

(declare-fun m!1335965 () Bool)

(assert (=> b!1447126 m!1335965))

(declare-fun m!1335967 () Bool)

(assert (=> b!1447126 m!1335967))

(assert (=> b!1447131 m!1335949))

(assert (=> b!1447131 m!1335949))

(declare-fun m!1335969 () Bool)

(assert (=> b!1447131 m!1335969))

(assert (=> b!1447117 m!1335965))

(declare-fun m!1335971 () Bool)

(assert (=> b!1447117 m!1335971))

(assert (=> b!1447127 m!1335949))

(assert (=> b!1447127 m!1335949))

(declare-fun m!1335973 () Bool)

(assert (=> b!1447127 m!1335973))

(declare-fun m!1335975 () Bool)

(assert (=> b!1447124 m!1335975))

(declare-fun m!1335977 () Bool)

(assert (=> b!1447125 m!1335977))

(assert (=> b!1447125 m!1335965))

(declare-fun m!1335979 () Bool)

(assert (=> b!1447125 m!1335979))

(declare-fun m!1335981 () Bool)

(assert (=> b!1447125 m!1335981))

(declare-fun m!1335983 () Bool)

(assert (=> b!1447125 m!1335983))

(assert (=> b!1447125 m!1335949))

(declare-fun m!1335985 () Bool)

(assert (=> b!1447125 m!1335985))

(declare-fun m!1335987 () Bool)

(assert (=> b!1447125 m!1335987))

(assert (=> b!1447125 m!1335949))

(declare-fun m!1335989 () Bool)

(assert (=> b!1447128 m!1335989))

(assert (=> b!1447123 m!1335983))

(assert (=> b!1447123 m!1335965))

(assert (=> b!1447123 m!1335981))

(assert (=> b!1447123 m!1335949))

(declare-fun m!1335991 () Bool)

(assert (=> start!124768 m!1335991))

(declare-fun m!1335993 () Bool)

(assert (=> start!124768 m!1335993))

(assert (=> b!1447133 m!1335949))

(assert (=> b!1447133 m!1335949))

(declare-fun m!1335995 () Bool)

(assert (=> b!1447133 m!1335995))

(assert (=> b!1447133 m!1335995))

(assert (=> b!1447133 m!1335949))

(declare-fun m!1335997 () Bool)

(assert (=> b!1447133 m!1335997))

(declare-fun m!1335999 () Bool)

(assert (=> b!1447118 m!1335999))

(declare-fun m!1336001 () Bool)

(assert (=> b!1447118 m!1336001))

(push 1)

