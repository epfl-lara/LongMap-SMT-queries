; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126154 () Bool)

(assert start!126154)

(declare-fun b!1477753 () Bool)

(declare-fun e!828989 () Bool)

(declare-fun e!828984 () Bool)

(assert (=> b!1477753 (= e!828989 e!828984)))

(declare-fun res!1003945 () Bool)

(assert (=> b!1477753 (=> (not res!1003945) (not e!828984))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((array!99238 0))(
  ( (array!99239 (arr!47899 (Array (_ BitVec 32) (_ BitVec 64))) (size!48451 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99238)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12164 0))(
  ( (MissingZero!12164 (index!51048 (_ BitVec 32))) (Found!12164 (index!51049 (_ BitVec 32))) (Intermediate!12164 (undefined!12976 Bool) (index!51050 (_ BitVec 32)) (x!132638 (_ BitVec 32))) (Undefined!12164) (MissingVacant!12164 (index!51051 (_ BitVec 32))) )
))
(declare-fun lt!645283 () SeekEntryResult!12164)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99238 (_ BitVec 32)) SeekEntryResult!12164)

(assert (=> b!1477753 (= res!1003945 (= lt!645283 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47899 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun res!1003948 () Bool)

(declare-fun e!828982 () Bool)

(assert (=> start!126154 (=> (not res!1003948) (not e!828982))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126154 (= res!1003948 (validMask!0 mask!2687))))

(assert (=> start!126154 e!828982))

(assert (=> start!126154 true))

(declare-fun array_inv!37132 (array!99238) Bool)

(assert (=> start!126154 (array_inv!37132 a!2862)))

(declare-fun b!1477754 () Bool)

(declare-fun e!828985 () Bool)

(assert (=> b!1477754 (= e!828985 e!828989)))

(declare-fun res!1003939 () Bool)

(assert (=> b!1477754 (=> res!1003939 e!828989)))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1477754 (= res!1003939 (or (and (= (select (arr!47899 a!2862) index!646) (select (store (arr!47899 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47899 a!2862) index!646) (select (arr!47899 a!2862) j!93))) (not (= (select (arr!47899 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1477755 () Bool)

(declare-fun lt!645288 () (_ BitVec 64))

(declare-fun lt!645284 () array!99238)

(declare-fun e!828983 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99238 (_ BitVec 32)) SeekEntryResult!12164)

(assert (=> b!1477755 (= e!828983 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645288 lt!645284 mask!2687) (seekEntryOrOpen!0 lt!645288 lt!645284 mask!2687)))))

(declare-fun b!1477756 () Bool)

(declare-fun res!1003952 () Bool)

(assert (=> b!1477756 (=> (not res!1003952) (not e!828982))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1477756 (= res!1003952 (validKeyInArray!0 (select (arr!47899 a!2862) j!93)))))

(declare-fun b!1477757 () Bool)

(declare-fun res!1003954 () Bool)

(assert (=> b!1477757 (=> (not res!1003954) (not e!828982))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1477757 (= res!1003954 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48451 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48451 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48451 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1477758 () Bool)

(declare-fun res!1003951 () Bool)

(assert (=> b!1477758 (=> (not res!1003951) (not e!828982))))

(assert (=> b!1477758 (= res!1003951 (and (= (size!48451 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48451 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48451 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1477759 () Bool)

(declare-fun res!1003946 () Bool)

(declare-fun e!828988 () Bool)

(assert (=> b!1477759 (=> (not res!1003946) (not e!828988))))

(assert (=> b!1477759 (= res!1003946 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1477760 () Bool)

(assert (=> b!1477760 (= e!828984 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1477761 () Bool)

(declare-fun res!1003950 () Bool)

(declare-fun e!828986 () Bool)

(assert (=> b!1477761 (=> (not res!1003950) (not e!828986))))

(declare-fun lt!645287 () SeekEntryResult!12164)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99238 (_ BitVec 32)) SeekEntryResult!12164)

(assert (=> b!1477761 (= res!1003950 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47899 a!2862) j!93) a!2862 mask!2687) lt!645287))))

(declare-fun b!1477762 () Bool)

(declare-fun res!1003944 () Bool)

(assert (=> b!1477762 (=> (not res!1003944) (not e!828988))))

(assert (=> b!1477762 (= res!1003944 e!828983)))

(declare-fun c!136429 () Bool)

(assert (=> b!1477762 (= c!136429 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1477763 () Bool)

(declare-fun e!828990 () Bool)

(assert (=> b!1477763 (= e!828982 e!828990)))

(declare-fun res!1003943 () Bool)

(assert (=> b!1477763 (=> (not res!1003943) (not e!828990))))

(assert (=> b!1477763 (= res!1003943 (= (select (store (arr!47899 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1477763 (= lt!645284 (array!99239 (store (arr!47899 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48451 a!2862)))))

(declare-fun b!1477764 () Bool)

(declare-fun res!1003941 () Bool)

(assert (=> b!1477764 (=> (not res!1003941) (not e!828982))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99238 (_ BitVec 32)) Bool)

(assert (=> b!1477764 (= res!1003941 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1477765 () Bool)

(assert (=> b!1477765 (= e!828986 e!828988)))

(declare-fun res!1003940 () Bool)

(assert (=> b!1477765 (=> (not res!1003940) (not e!828988))))

(declare-fun lt!645285 () SeekEntryResult!12164)

(assert (=> b!1477765 (= res!1003940 (= lt!645285 (Intermediate!12164 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1477765 (= lt!645285 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645288 mask!2687) lt!645288 lt!645284 mask!2687))))

(assert (=> b!1477765 (= lt!645288 (select (store (arr!47899 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1477766 () Bool)

(assert (=> b!1477766 (= e!828988 (not true))))

(assert (=> b!1477766 e!828985))

(declare-fun res!1003947 () Bool)

(assert (=> b!1477766 (=> (not res!1003947) (not e!828985))))

(assert (=> b!1477766 (= res!1003947 (and (= lt!645283 (Found!12164 j!93)) (or (= (select (arr!47899 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47899 a!2862) intermediateBeforeIndex!19) (select (arr!47899 a!2862) j!93)))))))

(assert (=> b!1477766 (= lt!645283 (seekEntryOrOpen!0 (select (arr!47899 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1477766 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49509 0))(
  ( (Unit!49510) )
))
(declare-fun lt!645286 () Unit!49509)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99238 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49509)

(assert (=> b!1477766 (= lt!645286 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1477767 () Bool)

(declare-fun res!1003949 () Bool)

(assert (=> b!1477767 (=> (not res!1003949) (not e!828982))))

(assert (=> b!1477767 (= res!1003949 (validKeyInArray!0 (select (arr!47899 a!2862) i!1006)))))

(declare-fun b!1477768 () Bool)

(declare-fun res!1003953 () Bool)

(assert (=> b!1477768 (=> (not res!1003953) (not e!828982))))

(declare-datatypes ((List!34478 0))(
  ( (Nil!34475) (Cons!34474 (h!35842 (_ BitVec 64)) (t!49164 List!34478)) )
))
(declare-fun arrayNoDuplicates!0 (array!99238 (_ BitVec 32) List!34478) Bool)

(assert (=> b!1477768 (= res!1003953 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34475))))

(declare-fun b!1477769 () Bool)

(assert (=> b!1477769 (= e!828983 (= lt!645285 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645288 lt!645284 mask!2687)))))

(declare-fun b!1477770 () Bool)

(assert (=> b!1477770 (= e!828990 e!828986)))

(declare-fun res!1003942 () Bool)

(assert (=> b!1477770 (=> (not res!1003942) (not e!828986))))

(assert (=> b!1477770 (= res!1003942 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47899 a!2862) j!93) mask!2687) (select (arr!47899 a!2862) j!93) a!2862 mask!2687) lt!645287))))

(assert (=> b!1477770 (= lt!645287 (Intermediate!12164 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!126154 res!1003948) b!1477758))

(assert (= (and b!1477758 res!1003951) b!1477767))

(assert (= (and b!1477767 res!1003949) b!1477756))

(assert (= (and b!1477756 res!1003952) b!1477764))

(assert (= (and b!1477764 res!1003941) b!1477768))

(assert (= (and b!1477768 res!1003953) b!1477757))

(assert (= (and b!1477757 res!1003954) b!1477763))

(assert (= (and b!1477763 res!1003943) b!1477770))

(assert (= (and b!1477770 res!1003942) b!1477761))

(assert (= (and b!1477761 res!1003950) b!1477765))

(assert (= (and b!1477765 res!1003940) b!1477762))

(assert (= (and b!1477762 c!136429) b!1477769))

(assert (= (and b!1477762 (not c!136429)) b!1477755))

(assert (= (and b!1477762 res!1003944) b!1477759))

(assert (= (and b!1477759 res!1003946) b!1477766))

(assert (= (and b!1477766 res!1003947) b!1477754))

(assert (= (and b!1477754 (not res!1003939)) b!1477753))

(assert (= (and b!1477753 res!1003945) b!1477760))

(declare-fun m!1363203 () Bool)

(assert (=> b!1477765 m!1363203))

(assert (=> b!1477765 m!1363203))

(declare-fun m!1363205 () Bool)

(assert (=> b!1477765 m!1363205))

(declare-fun m!1363207 () Bool)

(assert (=> b!1477765 m!1363207))

(declare-fun m!1363209 () Bool)

(assert (=> b!1477765 m!1363209))

(declare-fun m!1363211 () Bool)

(assert (=> b!1477770 m!1363211))

(assert (=> b!1477770 m!1363211))

(declare-fun m!1363213 () Bool)

(assert (=> b!1477770 m!1363213))

(assert (=> b!1477770 m!1363213))

(assert (=> b!1477770 m!1363211))

(declare-fun m!1363215 () Bool)

(assert (=> b!1477770 m!1363215))

(declare-fun m!1363217 () Bool)

(assert (=> b!1477768 m!1363217))

(declare-fun m!1363219 () Bool)

(assert (=> b!1477754 m!1363219))

(assert (=> b!1477754 m!1363207))

(declare-fun m!1363221 () Bool)

(assert (=> b!1477754 m!1363221))

(assert (=> b!1477754 m!1363211))

(declare-fun m!1363223 () Bool)

(assert (=> b!1477767 m!1363223))

(assert (=> b!1477767 m!1363223))

(declare-fun m!1363225 () Bool)

(assert (=> b!1477767 m!1363225))

(assert (=> b!1477763 m!1363207))

(declare-fun m!1363227 () Bool)

(assert (=> b!1477763 m!1363227))

(assert (=> b!1477761 m!1363211))

(assert (=> b!1477761 m!1363211))

(declare-fun m!1363229 () Bool)

(assert (=> b!1477761 m!1363229))

(declare-fun m!1363231 () Bool)

(assert (=> b!1477769 m!1363231))

(declare-fun m!1363233 () Bool)

(assert (=> b!1477755 m!1363233))

(declare-fun m!1363235 () Bool)

(assert (=> b!1477755 m!1363235))

(declare-fun m!1363237 () Bool)

(assert (=> start!126154 m!1363237))

(declare-fun m!1363239 () Bool)

(assert (=> start!126154 m!1363239))

(assert (=> b!1477756 m!1363211))

(assert (=> b!1477756 m!1363211))

(declare-fun m!1363241 () Bool)

(assert (=> b!1477756 m!1363241))

(assert (=> b!1477753 m!1363211))

(assert (=> b!1477753 m!1363211))

(declare-fun m!1363243 () Bool)

(assert (=> b!1477753 m!1363243))

(declare-fun m!1363245 () Bool)

(assert (=> b!1477766 m!1363245))

(declare-fun m!1363247 () Bool)

(assert (=> b!1477766 m!1363247))

(assert (=> b!1477766 m!1363211))

(declare-fun m!1363249 () Bool)

(assert (=> b!1477766 m!1363249))

(declare-fun m!1363251 () Bool)

(assert (=> b!1477766 m!1363251))

(assert (=> b!1477766 m!1363211))

(declare-fun m!1363253 () Bool)

(assert (=> b!1477764 m!1363253))

(check-sat (not b!1477768) (not b!1477765) (not b!1477769) (not b!1477756) (not b!1477755) (not b!1477767) (not b!1477770) (not b!1477753) (not b!1477766) (not b!1477761) (not b!1477764) (not start!126154))
(check-sat)
