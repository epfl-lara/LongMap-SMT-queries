; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125100 () Bool)

(assert start!125100)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11814 0))(
  ( (MissingZero!11814 (index!49648 (_ BitVec 32))) (Found!11814 (index!49649 (_ BitVec 32))) (Intermediate!11814 (undefined!12626 Bool) (index!49650 (_ BitVec 32)) (x!131271 (_ BitVec 32))) (Undefined!11814) (MissingVacant!11814 (index!49651 (_ BitVec 32))) )
))
(declare-fun lt!638503 () SeekEntryResult!11814)

(declare-fun lt!638500 () (_ BitVec 64))

(declare-fun e!819663 () Bool)

(declare-fun b!1456944 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!638501 () (_ BitVec 32))

(declare-datatypes ((array!98548 0))(
  ( (array!98549 (arr!47562 (Array (_ BitVec 32) (_ BitVec 64))) (size!48112 (_ BitVec 32))) )
))
(declare-fun lt!638505 () array!98548)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98548 (_ BitVec 32)) SeekEntryResult!11814)

(assert (=> b!1456944 (= e!819663 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638501 intermediateAfterIndex!19 lt!638500 lt!638505 mask!2687) lt!638503)))))

(declare-fun b!1456945 () Bool)

(declare-fun e!819670 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!638504 () SeekEntryResult!11814)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98548 (_ BitVec 32)) SeekEntryResult!11814)

(assert (=> b!1456945 (= e!819670 (= lt!638504 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638500 lt!638505 mask!2687)))))

(declare-fun b!1456946 () Bool)

(declare-fun res!987344 () Bool)

(declare-fun e!819668 () Bool)

(assert (=> b!1456946 (=> (not res!987344) (not e!819668))))

(assert (=> b!1456946 (= res!987344 e!819670)))

(declare-fun c!134315 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1456946 (= c!134315 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1456947 () Bool)

(declare-fun res!987348 () Bool)

(declare-fun e!819662 () Bool)

(assert (=> b!1456947 (=> (not res!987348) (not e!819662))))

(declare-fun a!2862 () array!98548)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98548 (_ BitVec 32)) Bool)

(assert (=> b!1456947 (= res!987348 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1456948 () Bool)

(assert (=> b!1456948 (= e!819663 (not (= lt!638504 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638501 lt!638500 lt!638505 mask!2687))))))

(declare-fun b!1456949 () Bool)

(declare-fun res!987350 () Bool)

(assert (=> b!1456949 (=> (not res!987350) (not e!819662))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1456949 (= res!987350 (and (= (size!48112 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48112 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48112 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1456951 () Bool)

(declare-fun res!987349 () Bool)

(declare-fun e!819666 () Bool)

(assert (=> b!1456951 (=> (not res!987349) (not e!819666))))

(declare-fun lt!638499 () SeekEntryResult!11814)

(assert (=> b!1456951 (= res!987349 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47562 a!2862) j!93) a!2862 mask!2687) lt!638499))))

(declare-fun b!1456952 () Bool)

(declare-fun res!987340 () Bool)

(declare-fun e!819664 () Bool)

(assert (=> b!1456952 (=> res!987340 e!819664)))

(assert (=> b!1456952 (= res!987340 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638501 (select (arr!47562 a!2862) j!93) a!2862 mask!2687) lt!638499)))))

(declare-fun b!1456953 () Bool)

(declare-fun res!987336 () Bool)

(assert (=> b!1456953 (=> (not res!987336) (not e!819662))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1456953 (= res!987336 (validKeyInArray!0 (select (arr!47562 a!2862) j!93)))))

(declare-fun b!1456954 () Bool)

(declare-fun res!987342 () Bool)

(assert (=> b!1456954 (=> (not res!987342) (not e!819668))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1456954 (= res!987342 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1456955 () Bool)

(declare-fun e!819667 () Bool)

(assert (=> b!1456955 (= e!819668 (not e!819667))))

(declare-fun res!987346 () Bool)

(assert (=> b!1456955 (=> res!987346 e!819667)))

(assert (=> b!1456955 (= res!987346 (or (and (= (select (arr!47562 a!2862) index!646) (select (store (arr!47562 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47562 a!2862) index!646) (select (arr!47562 a!2862) j!93))) (= (select (arr!47562 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!819671 () Bool)

(assert (=> b!1456955 e!819671))

(declare-fun res!987343 () Bool)

(assert (=> b!1456955 (=> (not res!987343) (not e!819671))))

(assert (=> b!1456955 (= res!987343 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49124 0))(
  ( (Unit!49125) )
))
(declare-fun lt!638498 () Unit!49124)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98548 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49124)

(assert (=> b!1456955 (= lt!638498 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1456956 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98548 (_ BitVec 32)) SeekEntryResult!11814)

(assert (=> b!1456956 (= e!819670 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638500 lt!638505 mask!2687) (seekEntryOrOpen!0 lt!638500 lt!638505 mask!2687)))))

(declare-fun b!1456957 () Bool)

(declare-fun res!987351 () Bool)

(assert (=> b!1456957 (=> (not res!987351) (not e!819671))))

(assert (=> b!1456957 (= res!987351 (= (seekEntryOrOpen!0 (select (arr!47562 a!2862) j!93) a!2862 mask!2687) (Found!11814 j!93)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1456958 () Bool)

(assert (=> b!1456958 (= e!819671 (and (or (= (select (arr!47562 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47562 a!2862) intermediateBeforeIndex!19) (select (arr!47562 a!2862) j!93))) (let ((bdg!53290 (select (store (arr!47562 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47562 a!2862) index!646) bdg!53290) (= (select (arr!47562 a!2862) index!646) (select (arr!47562 a!2862) j!93))) (= (select (arr!47562 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53290 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1456959 () Bool)

(declare-fun res!987335 () Bool)

(assert (=> b!1456959 (=> (not res!987335) (not e!819662))))

(declare-datatypes ((List!34063 0))(
  ( (Nil!34060) (Cons!34059 (h!35409 (_ BitVec 64)) (t!48757 List!34063)) )
))
(declare-fun arrayNoDuplicates!0 (array!98548 (_ BitVec 32) List!34063) Bool)

(assert (=> b!1456959 (= res!987335 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34060))))

(declare-fun b!1456960 () Bool)

(assert (=> b!1456960 (= e!819667 e!819664)))

(declare-fun res!987347 () Bool)

(assert (=> b!1456960 (=> res!987347 e!819664)))

(assert (=> b!1456960 (= res!987347 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638501 #b00000000000000000000000000000000) (bvsge lt!638501 (size!48112 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1456960 (= lt!638501 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1456960 (= lt!638503 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638500 lt!638505 mask!2687))))

(assert (=> b!1456960 (= lt!638503 (seekEntryOrOpen!0 lt!638500 lt!638505 mask!2687))))

(declare-fun b!1456961 () Bool)

(assert (=> b!1456961 (= e!819664 true)))

(declare-fun lt!638502 () Bool)

(assert (=> b!1456961 (= lt!638502 e!819663)))

(declare-fun c!134316 () Bool)

(assert (=> b!1456961 (= c!134316 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun res!987338 () Bool)

(assert (=> start!125100 (=> (not res!987338) (not e!819662))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125100 (= res!987338 (validMask!0 mask!2687))))

(assert (=> start!125100 e!819662))

(assert (=> start!125100 true))

(declare-fun array_inv!36590 (array!98548) Bool)

(assert (=> start!125100 (array_inv!36590 a!2862)))

(declare-fun b!1456950 () Bool)

(assert (=> b!1456950 (= e!819666 e!819668)))

(declare-fun res!987352 () Bool)

(assert (=> b!1456950 (=> (not res!987352) (not e!819668))))

(assert (=> b!1456950 (= res!987352 (= lt!638504 (Intermediate!11814 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1456950 (= lt!638504 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638500 mask!2687) lt!638500 lt!638505 mask!2687))))

(assert (=> b!1456950 (= lt!638500 (select (store (arr!47562 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1456962 () Bool)

(declare-fun e!819669 () Bool)

(assert (=> b!1456962 (= e!819662 e!819669)))

(declare-fun res!987339 () Bool)

(assert (=> b!1456962 (=> (not res!987339) (not e!819669))))

(assert (=> b!1456962 (= res!987339 (= (select (store (arr!47562 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1456962 (= lt!638505 (array!98549 (store (arr!47562 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48112 a!2862)))))

(declare-fun b!1456963 () Bool)

(assert (=> b!1456963 (= e!819669 e!819666)))

(declare-fun res!987337 () Bool)

(assert (=> b!1456963 (=> (not res!987337) (not e!819666))))

(assert (=> b!1456963 (= res!987337 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47562 a!2862) j!93) mask!2687) (select (arr!47562 a!2862) j!93) a!2862 mask!2687) lt!638499))))

(assert (=> b!1456963 (= lt!638499 (Intermediate!11814 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1456964 () Bool)

(declare-fun res!987345 () Bool)

(assert (=> b!1456964 (=> (not res!987345) (not e!819662))))

(assert (=> b!1456964 (= res!987345 (validKeyInArray!0 (select (arr!47562 a!2862) i!1006)))))

(declare-fun b!1456965 () Bool)

(declare-fun res!987341 () Bool)

(assert (=> b!1456965 (=> (not res!987341) (not e!819662))))

(assert (=> b!1456965 (= res!987341 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48112 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48112 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48112 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!125100 res!987338) b!1456949))

(assert (= (and b!1456949 res!987350) b!1456964))

(assert (= (and b!1456964 res!987345) b!1456953))

(assert (= (and b!1456953 res!987336) b!1456947))

(assert (= (and b!1456947 res!987348) b!1456959))

(assert (= (and b!1456959 res!987335) b!1456965))

(assert (= (and b!1456965 res!987341) b!1456962))

(assert (= (and b!1456962 res!987339) b!1456963))

(assert (= (and b!1456963 res!987337) b!1456951))

(assert (= (and b!1456951 res!987349) b!1456950))

(assert (= (and b!1456950 res!987352) b!1456946))

(assert (= (and b!1456946 c!134315) b!1456945))

(assert (= (and b!1456946 (not c!134315)) b!1456956))

(assert (= (and b!1456946 res!987344) b!1456954))

(assert (= (and b!1456954 res!987342) b!1456955))

(assert (= (and b!1456955 res!987343) b!1456957))

(assert (= (and b!1456957 res!987351) b!1456958))

(assert (= (and b!1456955 (not res!987346)) b!1456960))

(assert (= (and b!1456960 (not res!987347)) b!1456952))

(assert (= (and b!1456952 (not res!987340)) b!1456961))

(assert (= (and b!1456961 c!134316) b!1456948))

(assert (= (and b!1456961 (not c!134316)) b!1456944))

(declare-fun m!1344983 () Bool)

(assert (=> b!1456962 m!1344983))

(declare-fun m!1344985 () Bool)

(assert (=> b!1456962 m!1344985))

(declare-fun m!1344987 () Bool)

(assert (=> b!1456952 m!1344987))

(assert (=> b!1456952 m!1344987))

(declare-fun m!1344989 () Bool)

(assert (=> b!1456952 m!1344989))

(assert (=> b!1456951 m!1344987))

(assert (=> b!1456951 m!1344987))

(declare-fun m!1344991 () Bool)

(assert (=> b!1456951 m!1344991))

(assert (=> b!1456953 m!1344987))

(assert (=> b!1456953 m!1344987))

(declare-fun m!1344993 () Bool)

(assert (=> b!1456953 m!1344993))

(declare-fun m!1344995 () Bool)

(assert (=> b!1456948 m!1344995))

(declare-fun m!1344997 () Bool)

(assert (=> b!1456956 m!1344997))

(declare-fun m!1344999 () Bool)

(assert (=> b!1456956 m!1344999))

(declare-fun m!1345001 () Bool)

(assert (=> b!1456955 m!1345001))

(assert (=> b!1456955 m!1344983))

(declare-fun m!1345003 () Bool)

(assert (=> b!1456955 m!1345003))

(declare-fun m!1345005 () Bool)

(assert (=> b!1456955 m!1345005))

(declare-fun m!1345007 () Bool)

(assert (=> b!1456955 m!1345007))

(assert (=> b!1456955 m!1344987))

(declare-fun m!1345009 () Bool)

(assert (=> b!1456964 m!1345009))

(assert (=> b!1456964 m!1345009))

(declare-fun m!1345011 () Bool)

(assert (=> b!1456964 m!1345011))

(declare-fun m!1345013 () Bool)

(assert (=> b!1456950 m!1345013))

(assert (=> b!1456950 m!1345013))

(declare-fun m!1345015 () Bool)

(assert (=> b!1456950 m!1345015))

(assert (=> b!1456950 m!1344983))

(declare-fun m!1345017 () Bool)

(assert (=> b!1456950 m!1345017))

(assert (=> b!1456958 m!1344983))

(declare-fun m!1345019 () Bool)

(assert (=> b!1456958 m!1345019))

(assert (=> b!1456958 m!1345003))

(assert (=> b!1456958 m!1345005))

(assert (=> b!1456958 m!1344987))

(declare-fun m!1345021 () Bool)

(assert (=> b!1456960 m!1345021))

(assert (=> b!1456960 m!1344997))

(assert (=> b!1456960 m!1344999))

(assert (=> b!1456963 m!1344987))

(assert (=> b!1456963 m!1344987))

(declare-fun m!1345023 () Bool)

(assert (=> b!1456963 m!1345023))

(assert (=> b!1456963 m!1345023))

(assert (=> b!1456963 m!1344987))

(declare-fun m!1345025 () Bool)

(assert (=> b!1456963 m!1345025))

(declare-fun m!1345027 () Bool)

(assert (=> b!1456944 m!1345027))

(declare-fun m!1345029 () Bool)

(assert (=> b!1456947 m!1345029))

(declare-fun m!1345031 () Bool)

(assert (=> b!1456945 m!1345031))

(declare-fun m!1345033 () Bool)

(assert (=> b!1456959 m!1345033))

(assert (=> b!1456957 m!1344987))

(assert (=> b!1456957 m!1344987))

(declare-fun m!1345035 () Bool)

(assert (=> b!1456957 m!1345035))

(declare-fun m!1345037 () Bool)

(assert (=> start!125100 m!1345037))

(declare-fun m!1345039 () Bool)

(assert (=> start!125100 m!1345039))

(check-sat (not b!1456964) (not b!1456947) (not b!1456963) (not b!1456944) (not b!1456948) (not b!1456960) (not b!1456959) (not b!1456955) (not start!125100) (not b!1456957) (not b!1456953) (not b!1456951) (not b!1456945) (not b!1456952) (not b!1456950) (not b!1456956))
