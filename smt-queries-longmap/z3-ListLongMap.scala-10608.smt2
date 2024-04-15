; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124756 () Bool)

(assert start!124756)

(declare-fun b!1447434 () Bool)

(declare-fun e!815175 () Bool)

(declare-fun e!815172 () Bool)

(assert (=> b!1447434 (= e!815175 e!815172)))

(declare-fun res!979194 () Bool)

(assert (=> b!1447434 (=> (not res!979194) (not e!815172))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98182 0))(
  ( (array!98183 (arr!47380 (Array (_ BitVec 32) (_ BitVec 64))) (size!47932 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98182)

(assert (=> b!1447434 (= res!979194 (= (select (store (arr!47380 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!635003 () array!98182)

(assert (=> b!1447434 (= lt!635003 (array!98183 (store (arr!47380 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47932 a!2862)))))

(declare-fun b!1447435 () Bool)

(declare-fun res!979190 () Bool)

(assert (=> b!1447435 (=> (not res!979190) (not e!815175))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1447435 (= res!979190 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47932 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47932 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47932 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!979182 () Bool)

(assert (=> start!124756 (=> (not res!979182) (not e!815175))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124756 (= res!979182 (validMask!0 mask!2687))))

(assert (=> start!124756 e!815175))

(assert (=> start!124756 true))

(declare-fun array_inv!36613 (array!98182) Bool)

(assert (=> start!124756 (array_inv!36613 a!2862)))

(declare-fun b!1447436 () Bool)

(declare-fun e!815177 () Bool)

(assert (=> b!1447436 (= e!815177 true)))

(declare-datatypes ((SeekEntryResult!11657 0))(
  ( (MissingZero!11657 (index!49020 (_ BitVec 32))) (Found!11657 (index!49021 (_ BitVec 32))) (Intermediate!11657 (undefined!12469 Bool) (index!49022 (_ BitVec 32)) (x!130693 (_ BitVec 32))) (Undefined!11657) (MissingVacant!11657 (index!49023 (_ BitVec 32))) )
))
(declare-fun lt!635002 () SeekEntryResult!11657)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98182 (_ BitVec 32)) SeekEntryResult!11657)

(assert (=> b!1447436 (= lt!635002 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47380 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1447437 () Bool)

(declare-fun res!979189 () Bool)

(assert (=> b!1447437 (=> (not res!979189) (not e!815175))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98182 (_ BitVec 32)) Bool)

(assert (=> b!1447437 (= res!979189 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun lt!634998 () SeekEntryResult!11657)

(declare-fun b!1447438 () Bool)

(declare-fun lt!634999 () (_ BitVec 64))

(declare-fun e!815178 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98182 (_ BitVec 32)) SeekEntryResult!11657)

(assert (=> b!1447438 (= e!815178 (= lt!634998 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634999 lt!635003 mask!2687)))))

(declare-fun b!1447439 () Bool)

(declare-fun e!815176 () Bool)

(assert (=> b!1447439 (= e!815176 (not e!815177))))

(declare-fun res!979188 () Bool)

(assert (=> b!1447439 (=> res!979188 e!815177)))

(assert (=> b!1447439 (= res!979188 (or (and (= (select (arr!47380 a!2862) index!646) (select (store (arr!47380 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47380 a!2862) index!646) (select (arr!47380 a!2862) j!93))) (not (= (select (arr!47380 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47380 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!815174 () Bool)

(assert (=> b!1447439 e!815174))

(declare-fun res!979183 () Bool)

(assert (=> b!1447439 (=> (not res!979183) (not e!815174))))

(declare-fun lt!635001 () SeekEntryResult!11657)

(assert (=> b!1447439 (= res!979183 (and (= lt!635001 (Found!11657 j!93)) (or (= (select (arr!47380 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47380 a!2862) intermediateBeforeIndex!19) (select (arr!47380 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98182 (_ BitVec 32)) SeekEntryResult!11657)

(assert (=> b!1447439 (= lt!635001 (seekEntryOrOpen!0 (select (arr!47380 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1447439 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48651 0))(
  ( (Unit!48652) )
))
(declare-fun lt!635004 () Unit!48651)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98182 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48651)

(assert (=> b!1447439 (= lt!635004 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1447440 () Bool)

(declare-fun e!815171 () Bool)

(declare-fun e!815170 () Bool)

(assert (=> b!1447440 (= e!815171 e!815170)))

(declare-fun res!979191 () Bool)

(assert (=> b!1447440 (=> (not res!979191) (not e!815170))))

(assert (=> b!1447440 (= res!979191 (= lt!635001 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47380 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1447441 () Bool)

(assert (=> b!1447441 (= e!815178 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634999 lt!635003 mask!2687) (seekEntryOrOpen!0 lt!634999 lt!635003 mask!2687)))))

(declare-fun b!1447442 () Bool)

(declare-fun e!815169 () Bool)

(assert (=> b!1447442 (= e!815172 e!815169)))

(declare-fun res!979187 () Bool)

(assert (=> b!1447442 (=> (not res!979187) (not e!815169))))

(declare-fun lt!635000 () SeekEntryResult!11657)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1447442 (= res!979187 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47380 a!2862) j!93) mask!2687) (select (arr!47380 a!2862) j!93) a!2862 mask!2687) lt!635000))))

(assert (=> b!1447442 (= lt!635000 (Intermediate!11657 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1447443 () Bool)

(assert (=> b!1447443 (= e!815170 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1447444 () Bool)

(assert (=> b!1447444 (= e!815174 e!815171)))

(declare-fun res!979193 () Bool)

(assert (=> b!1447444 (=> res!979193 e!815171)))

(assert (=> b!1447444 (= res!979193 (or (and (= (select (arr!47380 a!2862) index!646) (select (store (arr!47380 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47380 a!2862) index!646) (select (arr!47380 a!2862) j!93))) (not (= (select (arr!47380 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1447445 () Bool)

(declare-fun res!979195 () Bool)

(assert (=> b!1447445 (=> (not res!979195) (not e!815175))))

(assert (=> b!1447445 (= res!979195 (and (= (size!47932 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47932 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47932 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1447446 () Bool)

(declare-fun res!979196 () Bool)

(assert (=> b!1447446 (=> (not res!979196) (not e!815176))))

(assert (=> b!1447446 (= res!979196 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1447447 () Bool)

(declare-fun res!979198 () Bool)

(assert (=> b!1447447 (=> (not res!979198) (not e!815176))))

(assert (=> b!1447447 (= res!979198 e!815178)))

(declare-fun c!133639 () Bool)

(assert (=> b!1447447 (= c!133639 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1447448 () Bool)

(declare-fun res!979192 () Bool)

(assert (=> b!1447448 (=> (not res!979192) (not e!815175))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1447448 (= res!979192 (validKeyInArray!0 (select (arr!47380 a!2862) j!93)))))

(declare-fun b!1447449 () Bool)

(declare-fun res!979197 () Bool)

(assert (=> b!1447449 (=> (not res!979197) (not e!815175))))

(assert (=> b!1447449 (= res!979197 (validKeyInArray!0 (select (arr!47380 a!2862) i!1006)))))

(declare-fun b!1447450 () Bool)

(assert (=> b!1447450 (= e!815169 e!815176)))

(declare-fun res!979185 () Bool)

(assert (=> b!1447450 (=> (not res!979185) (not e!815176))))

(assert (=> b!1447450 (= res!979185 (= lt!634998 (Intermediate!11657 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1447450 (= lt!634998 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634999 mask!2687) lt!634999 lt!635003 mask!2687))))

(assert (=> b!1447450 (= lt!634999 (select (store (arr!47380 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1447451 () Bool)

(declare-fun res!979184 () Bool)

(assert (=> b!1447451 (=> (not res!979184) (not e!815169))))

(assert (=> b!1447451 (= res!979184 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47380 a!2862) j!93) a!2862 mask!2687) lt!635000))))

(declare-fun b!1447452 () Bool)

(declare-fun res!979186 () Bool)

(assert (=> b!1447452 (=> (not res!979186) (not e!815175))))

(declare-datatypes ((List!33959 0))(
  ( (Nil!33956) (Cons!33955 (h!35305 (_ BitVec 64)) (t!48645 List!33959)) )
))
(declare-fun arrayNoDuplicates!0 (array!98182 (_ BitVec 32) List!33959) Bool)

(assert (=> b!1447452 (= res!979186 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33956))))

(assert (= (and start!124756 res!979182) b!1447445))

(assert (= (and b!1447445 res!979195) b!1447449))

(assert (= (and b!1447449 res!979197) b!1447448))

(assert (= (and b!1447448 res!979192) b!1447437))

(assert (= (and b!1447437 res!979189) b!1447452))

(assert (= (and b!1447452 res!979186) b!1447435))

(assert (= (and b!1447435 res!979190) b!1447434))

(assert (= (and b!1447434 res!979194) b!1447442))

(assert (= (and b!1447442 res!979187) b!1447451))

(assert (= (and b!1447451 res!979184) b!1447450))

(assert (= (and b!1447450 res!979185) b!1447447))

(assert (= (and b!1447447 c!133639) b!1447438))

(assert (= (and b!1447447 (not c!133639)) b!1447441))

(assert (= (and b!1447447 res!979198) b!1447446))

(assert (= (and b!1447446 res!979196) b!1447439))

(assert (= (and b!1447439 res!979183) b!1447444))

(assert (= (and b!1447444 (not res!979193)) b!1447440))

(assert (= (and b!1447440 res!979191) b!1447443))

(assert (= (and b!1447439 (not res!979188)) b!1447436))

(declare-fun m!1335759 () Bool)

(assert (=> b!1447451 m!1335759))

(assert (=> b!1447451 m!1335759))

(declare-fun m!1335761 () Bool)

(assert (=> b!1447451 m!1335761))

(assert (=> b!1447440 m!1335759))

(assert (=> b!1447440 m!1335759))

(declare-fun m!1335763 () Bool)

(assert (=> b!1447440 m!1335763))

(declare-fun m!1335765 () Bool)

(assert (=> b!1447439 m!1335765))

(declare-fun m!1335767 () Bool)

(assert (=> b!1447439 m!1335767))

(declare-fun m!1335769 () Bool)

(assert (=> b!1447439 m!1335769))

(declare-fun m!1335771 () Bool)

(assert (=> b!1447439 m!1335771))

(declare-fun m!1335773 () Bool)

(assert (=> b!1447439 m!1335773))

(assert (=> b!1447439 m!1335759))

(declare-fun m!1335775 () Bool)

(assert (=> b!1447439 m!1335775))

(declare-fun m!1335777 () Bool)

(assert (=> b!1447439 m!1335777))

(assert (=> b!1447439 m!1335759))

(declare-fun m!1335779 () Bool)

(assert (=> b!1447438 m!1335779))

(declare-fun m!1335781 () Bool)

(assert (=> b!1447437 m!1335781))

(declare-fun m!1335783 () Bool)

(assert (=> b!1447450 m!1335783))

(assert (=> b!1447450 m!1335783))

(declare-fun m!1335785 () Bool)

(assert (=> b!1447450 m!1335785))

(assert (=> b!1447450 m!1335767))

(declare-fun m!1335787 () Bool)

(assert (=> b!1447450 m!1335787))

(declare-fun m!1335789 () Bool)

(assert (=> b!1447452 m!1335789))

(assert (=> b!1447442 m!1335759))

(assert (=> b!1447442 m!1335759))

(declare-fun m!1335791 () Bool)

(assert (=> b!1447442 m!1335791))

(assert (=> b!1447442 m!1335791))

(assert (=> b!1447442 m!1335759))

(declare-fun m!1335793 () Bool)

(assert (=> b!1447442 m!1335793))

(assert (=> b!1447444 m!1335773))

(assert (=> b!1447444 m!1335767))

(assert (=> b!1447444 m!1335771))

(assert (=> b!1447444 m!1335759))

(declare-fun m!1335795 () Bool)

(assert (=> b!1447441 m!1335795))

(declare-fun m!1335797 () Bool)

(assert (=> b!1447441 m!1335797))

(assert (=> b!1447436 m!1335759))

(assert (=> b!1447436 m!1335759))

(declare-fun m!1335799 () Bool)

(assert (=> b!1447436 m!1335799))

(assert (=> b!1447434 m!1335767))

(declare-fun m!1335801 () Bool)

(assert (=> b!1447434 m!1335801))

(declare-fun m!1335803 () Bool)

(assert (=> b!1447449 m!1335803))

(assert (=> b!1447449 m!1335803))

(declare-fun m!1335805 () Bool)

(assert (=> b!1447449 m!1335805))

(declare-fun m!1335807 () Bool)

(assert (=> start!124756 m!1335807))

(declare-fun m!1335809 () Bool)

(assert (=> start!124756 m!1335809))

(assert (=> b!1447448 m!1335759))

(assert (=> b!1447448 m!1335759))

(declare-fun m!1335811 () Bool)

(assert (=> b!1447448 m!1335811))

(check-sat (not b!1447439) (not b!1447440) (not b!1447450) (not b!1447448) (not b!1447451) (not b!1447436) (not b!1447452) (not b!1447437) (not b!1447438) (not b!1447442) (not start!124756) (not b!1447449) (not b!1447441))
(check-sat)
