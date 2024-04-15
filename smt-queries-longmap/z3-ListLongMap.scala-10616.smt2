; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124804 () Bool)

(assert start!124804)

(declare-fun b!1448802 () Bool)

(declare-fun lt!635507 () (_ BitVec 64))

(declare-fun e!815896 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11681 0))(
  ( (MissingZero!11681 (index!49116 (_ BitVec 32))) (Found!11681 (index!49117 (_ BitVec 32))) (Intermediate!11681 (undefined!12493 Bool) (index!49118 (_ BitVec 32)) (x!130781 (_ BitVec 32))) (Undefined!11681) (MissingVacant!11681 (index!49119 (_ BitVec 32))) )
))
(declare-fun lt!635505 () SeekEntryResult!11681)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((array!98230 0))(
  ( (array!98231 (arr!47404 (Array (_ BitVec 32) (_ BitVec 64))) (size!47956 (_ BitVec 32))) )
))
(declare-fun lt!635504 () array!98230)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98230 (_ BitVec 32)) SeekEntryResult!11681)

(assert (=> b!1448802 (= e!815896 (= lt!635505 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635507 lt!635504 mask!2687)))))

(declare-fun b!1448803 () Bool)

(declare-fun e!815895 () Bool)

(assert (=> b!1448803 (= e!815895 true)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun lt!635503 () SeekEntryResult!11681)

(declare-fun a!2862 () array!98230)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98230 (_ BitVec 32)) SeekEntryResult!11681)

(assert (=> b!1448803 (= lt!635503 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47404 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1448804 () Bool)

(declare-fun res!980419 () Bool)

(declare-fun e!815898 () Bool)

(assert (=> b!1448804 (=> (not res!980419) (not e!815898))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1448804 (= res!980419 (validKeyInArray!0 (select (arr!47404 a!2862) j!93)))))

(declare-fun res!980406 () Bool)

(assert (=> start!124804 (=> (not res!980406) (not e!815898))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124804 (= res!980406 (validMask!0 mask!2687))))

(assert (=> start!124804 e!815898))

(assert (=> start!124804 true))

(declare-fun array_inv!36637 (array!98230) Bool)

(assert (=> start!124804 (array_inv!36637 a!2862)))

(declare-fun b!1448805 () Bool)

(declare-fun res!980413 () Bool)

(assert (=> b!1448805 (=> (not res!980413) (not e!815898))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1448805 (= res!980413 (and (= (size!47956 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47956 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47956 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1448806 () Bool)

(declare-fun e!815889 () Bool)

(declare-fun e!815897 () Bool)

(assert (=> b!1448806 (= e!815889 e!815897)))

(declare-fun res!980410 () Bool)

(assert (=> b!1448806 (=> (not res!980410) (not e!815897))))

(declare-fun lt!635508 () SeekEntryResult!11681)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1448806 (= res!980410 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47404 a!2862) j!93) mask!2687) (select (arr!47404 a!2862) j!93) a!2862 mask!2687) lt!635508))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1448806 (= lt!635508 (Intermediate!11681 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1448807 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98230 (_ BitVec 32)) SeekEntryResult!11681)

(assert (=> b!1448807 (= e!815896 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635507 lt!635504 mask!2687) (seekEntryOrOpen!0 lt!635507 lt!635504 mask!2687)))))

(declare-fun b!1448808 () Bool)

(declare-fun e!815892 () Bool)

(assert (=> b!1448808 (= e!815892 (not e!815895))))

(declare-fun res!980416 () Bool)

(assert (=> b!1448808 (=> res!980416 e!815895)))

(assert (=> b!1448808 (= res!980416 (or (and (= (select (arr!47404 a!2862) index!646) (select (store (arr!47404 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47404 a!2862) index!646) (select (arr!47404 a!2862) j!93))) (not (= (select (arr!47404 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47404 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!815893 () Bool)

(assert (=> b!1448808 e!815893))

(declare-fun res!980417 () Bool)

(assert (=> b!1448808 (=> (not res!980417) (not e!815893))))

(declare-fun lt!635506 () SeekEntryResult!11681)

(assert (=> b!1448808 (= res!980417 (and (= lt!635506 (Found!11681 j!93)) (or (= (select (arr!47404 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47404 a!2862) intermediateBeforeIndex!19) (select (arr!47404 a!2862) j!93)))))))

(assert (=> b!1448808 (= lt!635506 (seekEntryOrOpen!0 (select (arr!47404 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98230 (_ BitVec 32)) Bool)

(assert (=> b!1448808 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48699 0))(
  ( (Unit!48700) )
))
(declare-fun lt!635502 () Unit!48699)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98230 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48699)

(assert (=> b!1448808 (= lt!635502 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1448809 () Bool)

(declare-fun res!980418 () Bool)

(assert (=> b!1448809 (=> (not res!980418) (not e!815898))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1448809 (= res!980418 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47956 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47956 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47956 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1448810 () Bool)

(declare-fun e!815890 () Bool)

(assert (=> b!1448810 (= e!815893 e!815890)))

(declare-fun res!980407 () Bool)

(assert (=> b!1448810 (=> res!980407 e!815890)))

(assert (=> b!1448810 (= res!980407 (or (and (= (select (arr!47404 a!2862) index!646) (select (store (arr!47404 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47404 a!2862) index!646) (select (arr!47404 a!2862) j!93))) (not (= (select (arr!47404 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1448811 () Bool)

(declare-fun res!980421 () Bool)

(assert (=> b!1448811 (=> (not res!980421) (not e!815897))))

(assert (=> b!1448811 (= res!980421 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47404 a!2862) j!93) a!2862 mask!2687) lt!635508))))

(declare-fun b!1448812 () Bool)

(declare-fun res!980420 () Bool)

(assert (=> b!1448812 (=> (not res!980420) (not e!815892))))

(assert (=> b!1448812 (= res!980420 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1448813 () Bool)

(assert (=> b!1448813 (= e!815898 e!815889)))

(declare-fun res!980409 () Bool)

(assert (=> b!1448813 (=> (not res!980409) (not e!815889))))

(assert (=> b!1448813 (= res!980409 (= (select (store (arr!47404 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1448813 (= lt!635504 (array!98231 (store (arr!47404 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47956 a!2862)))))

(declare-fun b!1448814 () Bool)

(declare-fun res!980415 () Bool)

(assert (=> b!1448814 (=> (not res!980415) (not e!815898))))

(assert (=> b!1448814 (= res!980415 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1448815 () Bool)

(declare-fun e!815894 () Bool)

(assert (=> b!1448815 (= e!815890 e!815894)))

(declare-fun res!980414 () Bool)

(assert (=> b!1448815 (=> (not res!980414) (not e!815894))))

(assert (=> b!1448815 (= res!980414 (= lt!635506 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47404 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1448816 () Bool)

(declare-fun res!980411 () Bool)

(assert (=> b!1448816 (=> (not res!980411) (not e!815898))))

(assert (=> b!1448816 (= res!980411 (validKeyInArray!0 (select (arr!47404 a!2862) i!1006)))))

(declare-fun b!1448817 () Bool)

(assert (=> b!1448817 (= e!815897 e!815892)))

(declare-fun res!980408 () Bool)

(assert (=> b!1448817 (=> (not res!980408) (not e!815892))))

(assert (=> b!1448817 (= res!980408 (= lt!635505 (Intermediate!11681 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1448817 (= lt!635505 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635507 mask!2687) lt!635507 lt!635504 mask!2687))))

(assert (=> b!1448817 (= lt!635507 (select (store (arr!47404 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1448818 () Bool)

(declare-fun res!980422 () Bool)

(assert (=> b!1448818 (=> (not res!980422) (not e!815892))))

(assert (=> b!1448818 (= res!980422 e!815896)))

(declare-fun c!133711 () Bool)

(assert (=> b!1448818 (= c!133711 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1448819 () Bool)

(declare-fun res!980412 () Bool)

(assert (=> b!1448819 (=> (not res!980412) (not e!815898))))

(declare-datatypes ((List!33983 0))(
  ( (Nil!33980) (Cons!33979 (h!35329 (_ BitVec 64)) (t!48669 List!33983)) )
))
(declare-fun arrayNoDuplicates!0 (array!98230 (_ BitVec 32) List!33983) Bool)

(assert (=> b!1448819 (= res!980412 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33980))))

(declare-fun b!1448820 () Bool)

(assert (=> b!1448820 (= e!815894 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(assert (= (and start!124804 res!980406) b!1448805))

(assert (= (and b!1448805 res!980413) b!1448816))

(assert (= (and b!1448816 res!980411) b!1448804))

(assert (= (and b!1448804 res!980419) b!1448814))

(assert (= (and b!1448814 res!980415) b!1448819))

(assert (= (and b!1448819 res!980412) b!1448809))

(assert (= (and b!1448809 res!980418) b!1448813))

(assert (= (and b!1448813 res!980409) b!1448806))

(assert (= (and b!1448806 res!980410) b!1448811))

(assert (= (and b!1448811 res!980421) b!1448817))

(assert (= (and b!1448817 res!980408) b!1448818))

(assert (= (and b!1448818 c!133711) b!1448802))

(assert (= (and b!1448818 (not c!133711)) b!1448807))

(assert (= (and b!1448818 res!980422) b!1448812))

(assert (= (and b!1448812 res!980420) b!1448808))

(assert (= (and b!1448808 res!980417) b!1448810))

(assert (= (and b!1448810 (not res!980407)) b!1448815))

(assert (= (and b!1448815 res!980414) b!1448820))

(assert (= (and b!1448808 (not res!980416)) b!1448803))

(declare-fun m!1337055 () Bool)

(assert (=> b!1448816 m!1337055))

(assert (=> b!1448816 m!1337055))

(declare-fun m!1337057 () Bool)

(assert (=> b!1448816 m!1337057))

(declare-fun m!1337059 () Bool)

(assert (=> b!1448807 m!1337059))

(declare-fun m!1337061 () Bool)

(assert (=> b!1448807 m!1337061))

(declare-fun m!1337063 () Bool)

(assert (=> start!124804 m!1337063))

(declare-fun m!1337065 () Bool)

(assert (=> start!124804 m!1337065))

(declare-fun m!1337067 () Bool)

(assert (=> b!1448808 m!1337067))

(declare-fun m!1337069 () Bool)

(assert (=> b!1448808 m!1337069))

(declare-fun m!1337071 () Bool)

(assert (=> b!1448808 m!1337071))

(declare-fun m!1337073 () Bool)

(assert (=> b!1448808 m!1337073))

(declare-fun m!1337075 () Bool)

(assert (=> b!1448808 m!1337075))

(declare-fun m!1337077 () Bool)

(assert (=> b!1448808 m!1337077))

(declare-fun m!1337079 () Bool)

(assert (=> b!1448808 m!1337079))

(declare-fun m!1337081 () Bool)

(assert (=> b!1448808 m!1337081))

(assert (=> b!1448808 m!1337077))

(assert (=> b!1448803 m!1337077))

(assert (=> b!1448803 m!1337077))

(declare-fun m!1337083 () Bool)

(assert (=> b!1448803 m!1337083))

(assert (=> b!1448811 m!1337077))

(assert (=> b!1448811 m!1337077))

(declare-fun m!1337085 () Bool)

(assert (=> b!1448811 m!1337085))

(assert (=> b!1448815 m!1337077))

(assert (=> b!1448815 m!1337077))

(declare-fun m!1337087 () Bool)

(assert (=> b!1448815 m!1337087))

(declare-fun m!1337089 () Bool)

(assert (=> b!1448819 m!1337089))

(assert (=> b!1448810 m!1337075))

(assert (=> b!1448810 m!1337069))

(assert (=> b!1448810 m!1337073))

(assert (=> b!1448810 m!1337077))

(declare-fun m!1337091 () Bool)

(assert (=> b!1448802 m!1337091))

(assert (=> b!1448813 m!1337069))

(declare-fun m!1337093 () Bool)

(assert (=> b!1448813 m!1337093))

(assert (=> b!1448804 m!1337077))

(assert (=> b!1448804 m!1337077))

(declare-fun m!1337095 () Bool)

(assert (=> b!1448804 m!1337095))

(declare-fun m!1337097 () Bool)

(assert (=> b!1448814 m!1337097))

(assert (=> b!1448806 m!1337077))

(assert (=> b!1448806 m!1337077))

(declare-fun m!1337099 () Bool)

(assert (=> b!1448806 m!1337099))

(assert (=> b!1448806 m!1337099))

(assert (=> b!1448806 m!1337077))

(declare-fun m!1337101 () Bool)

(assert (=> b!1448806 m!1337101))

(declare-fun m!1337103 () Bool)

(assert (=> b!1448817 m!1337103))

(assert (=> b!1448817 m!1337103))

(declare-fun m!1337105 () Bool)

(assert (=> b!1448817 m!1337105))

(assert (=> b!1448817 m!1337069))

(declare-fun m!1337107 () Bool)

(assert (=> b!1448817 m!1337107))

(check-sat (not b!1448807) (not b!1448811) (not b!1448816) (not b!1448815) (not b!1448814) (not start!124804) (not b!1448808) (not b!1448806) (not b!1448803) (not b!1448817) (not b!1448819) (not b!1448804) (not b!1448802))
(check-sat)
