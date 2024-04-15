; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124780 () Bool)

(assert start!124780)

(declare-fun b!1448118 () Bool)

(declare-fun res!979802 () Bool)

(declare-fun e!815532 () Bool)

(assert (=> b!1448118 (=> (not res!979802) (not e!815532))))

(declare-datatypes ((array!98206 0))(
  ( (array!98207 (arr!47392 (Array (_ BitVec 32) (_ BitVec 64))) (size!47944 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98206)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1448118 (= res!979802 (validKeyInArray!0 (select (arr!47392 a!2862) j!93)))))

(declare-fun b!1448120 () Bool)

(declare-fun res!979798 () Bool)

(assert (=> b!1448120 (=> (not res!979798) (not e!815532))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1448120 (= res!979798 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47944 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47944 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47944 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1448121 () Bool)

(declare-fun res!979803 () Bool)

(assert (=> b!1448121 (=> (not res!979803) (not e!815532))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1448121 (= res!979803 (validKeyInArray!0 (select (arr!47392 a!2862) i!1006)))))

(declare-fun b!1448122 () Bool)

(declare-fun res!979810 () Bool)

(assert (=> b!1448122 (=> (not res!979810) (not e!815532))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98206 (_ BitVec 32)) Bool)

(assert (=> b!1448122 (= res!979810 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1448123 () Bool)

(declare-fun res!979796 () Bool)

(declare-fun e!815531 () Bool)

(assert (=> b!1448123 (=> (not res!979796) (not e!815531))))

(declare-datatypes ((SeekEntryResult!11669 0))(
  ( (MissingZero!11669 (index!49068 (_ BitVec 32))) (Found!11669 (index!49069 (_ BitVec 32))) (Intermediate!11669 (undefined!12481 Bool) (index!49070 (_ BitVec 32)) (x!130737 (_ BitVec 32))) (Undefined!11669) (MissingVacant!11669 (index!49071 (_ BitVec 32))) )
))
(declare-fun lt!635251 () SeekEntryResult!11669)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98206 (_ BitVec 32)) SeekEntryResult!11669)

(assert (=> b!1448123 (= res!979796 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47392 a!2862) j!93) a!2862 mask!2687) lt!635251))))

(declare-fun e!815537 () Bool)

(declare-fun b!1448124 () Bool)

(declare-fun lt!635252 () (_ BitVec 64))

(declare-fun lt!635250 () array!98206)

(declare-fun lt!635256 () SeekEntryResult!11669)

(assert (=> b!1448124 (= e!815537 (= lt!635256 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635252 lt!635250 mask!2687)))))

(declare-fun b!1448125 () Bool)

(declare-fun res!979808 () Bool)

(assert (=> b!1448125 (=> (not res!979808) (not e!815532))))

(declare-datatypes ((List!33971 0))(
  ( (Nil!33968) (Cons!33967 (h!35317 (_ BitVec 64)) (t!48657 List!33971)) )
))
(declare-fun arrayNoDuplicates!0 (array!98206 (_ BitVec 32) List!33971) Bool)

(assert (=> b!1448125 (= res!979808 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33968))))

(declare-fun b!1448126 () Bool)

(declare-fun e!815530 () Bool)

(assert (=> b!1448126 (= e!815532 e!815530)))

(declare-fun res!979805 () Bool)

(assert (=> b!1448126 (=> (not res!979805) (not e!815530))))

(assert (=> b!1448126 (= res!979805 (= (select (store (arr!47392 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1448126 (= lt!635250 (array!98207 (store (arr!47392 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47944 a!2862)))))

(declare-fun res!979806 () Bool)

(assert (=> start!124780 (=> (not res!979806) (not e!815532))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124780 (= res!979806 (validMask!0 mask!2687))))

(assert (=> start!124780 e!815532))

(assert (=> start!124780 true))

(declare-fun array_inv!36625 (array!98206) Bool)

(assert (=> start!124780 (array_inv!36625 a!2862)))

(declare-fun b!1448119 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98206 (_ BitVec 32)) SeekEntryResult!11669)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98206 (_ BitVec 32)) SeekEntryResult!11669)

(assert (=> b!1448119 (= e!815537 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635252 lt!635250 mask!2687) (seekEntryOrOpen!0 lt!635252 lt!635250 mask!2687)))))

(declare-fun b!1448127 () Bool)

(declare-fun e!815534 () Bool)

(assert (=> b!1448127 (= e!815534 true)))

(declare-fun lt!635253 () SeekEntryResult!11669)

(assert (=> b!1448127 (= lt!635253 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47392 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1448128 () Bool)

(assert (=> b!1448128 (= e!815530 e!815531)))

(declare-fun res!979807 () Bool)

(assert (=> b!1448128 (=> (not res!979807) (not e!815531))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1448128 (= res!979807 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47392 a!2862) j!93) mask!2687) (select (arr!47392 a!2862) j!93) a!2862 mask!2687) lt!635251))))

(assert (=> b!1448128 (= lt!635251 (Intermediate!11669 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1448129 () Bool)

(declare-fun e!815535 () Bool)

(declare-fun e!815533 () Bool)

(assert (=> b!1448129 (= e!815535 e!815533)))

(declare-fun res!979794 () Bool)

(assert (=> b!1448129 (=> res!979794 e!815533)))

(assert (=> b!1448129 (= res!979794 (or (and (= (select (arr!47392 a!2862) index!646) (select (store (arr!47392 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47392 a!2862) index!646) (select (arr!47392 a!2862) j!93))) (not (= (select (arr!47392 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1448130 () Bool)

(declare-fun res!979804 () Bool)

(declare-fun e!815529 () Bool)

(assert (=> b!1448130 (=> (not res!979804) (not e!815529))))

(assert (=> b!1448130 (= res!979804 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun e!815536 () Bool)

(declare-fun b!1448131 () Bool)

(assert (=> b!1448131 (= e!815536 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1448132 () Bool)

(declare-fun res!979799 () Bool)

(assert (=> b!1448132 (=> (not res!979799) (not e!815529))))

(assert (=> b!1448132 (= res!979799 e!815537)))

(declare-fun c!133675 () Bool)

(assert (=> b!1448132 (= c!133675 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1448133 () Bool)

(assert (=> b!1448133 (= e!815531 e!815529)))

(declare-fun res!979800 () Bool)

(assert (=> b!1448133 (=> (not res!979800) (not e!815529))))

(assert (=> b!1448133 (= res!979800 (= lt!635256 (Intermediate!11669 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1448133 (= lt!635256 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635252 mask!2687) lt!635252 lt!635250 mask!2687))))

(assert (=> b!1448133 (= lt!635252 (select (store (arr!47392 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1448134 () Bool)

(declare-fun res!979797 () Bool)

(assert (=> b!1448134 (=> (not res!979797) (not e!815532))))

(assert (=> b!1448134 (= res!979797 (and (= (size!47944 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47944 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47944 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1448135 () Bool)

(assert (=> b!1448135 (= e!815533 e!815536)))

(declare-fun res!979801 () Bool)

(assert (=> b!1448135 (=> (not res!979801) (not e!815536))))

(declare-fun lt!635254 () SeekEntryResult!11669)

(assert (=> b!1448135 (= res!979801 (= lt!635254 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47392 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1448136 () Bool)

(assert (=> b!1448136 (= e!815529 (not e!815534))))

(declare-fun res!979795 () Bool)

(assert (=> b!1448136 (=> res!979795 e!815534)))

(assert (=> b!1448136 (= res!979795 (or (and (= (select (arr!47392 a!2862) index!646) (select (store (arr!47392 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47392 a!2862) index!646) (select (arr!47392 a!2862) j!93))) (not (= (select (arr!47392 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47392 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1448136 e!815535))

(declare-fun res!979809 () Bool)

(assert (=> b!1448136 (=> (not res!979809) (not e!815535))))

(assert (=> b!1448136 (= res!979809 (and (= lt!635254 (Found!11669 j!93)) (or (= (select (arr!47392 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47392 a!2862) intermediateBeforeIndex!19) (select (arr!47392 a!2862) j!93)))))))

(assert (=> b!1448136 (= lt!635254 (seekEntryOrOpen!0 (select (arr!47392 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1448136 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48675 0))(
  ( (Unit!48676) )
))
(declare-fun lt!635255 () Unit!48675)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98206 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48675)

(assert (=> b!1448136 (= lt!635255 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!124780 res!979806) b!1448134))

(assert (= (and b!1448134 res!979797) b!1448121))

(assert (= (and b!1448121 res!979803) b!1448118))

(assert (= (and b!1448118 res!979802) b!1448122))

(assert (= (and b!1448122 res!979810) b!1448125))

(assert (= (and b!1448125 res!979808) b!1448120))

(assert (= (and b!1448120 res!979798) b!1448126))

(assert (= (and b!1448126 res!979805) b!1448128))

(assert (= (and b!1448128 res!979807) b!1448123))

(assert (= (and b!1448123 res!979796) b!1448133))

(assert (= (and b!1448133 res!979800) b!1448132))

(assert (= (and b!1448132 c!133675) b!1448124))

(assert (= (and b!1448132 (not c!133675)) b!1448119))

(assert (= (and b!1448132 res!979799) b!1448130))

(assert (= (and b!1448130 res!979804) b!1448136))

(assert (= (and b!1448136 res!979809) b!1448129))

(assert (= (and b!1448129 (not res!979794)) b!1448135))

(assert (= (and b!1448135 res!979801) b!1448131))

(assert (= (and b!1448136 (not res!979795)) b!1448127))

(declare-fun m!1336407 () Bool)

(assert (=> b!1448128 m!1336407))

(assert (=> b!1448128 m!1336407))

(declare-fun m!1336409 () Bool)

(assert (=> b!1448128 m!1336409))

(assert (=> b!1448128 m!1336409))

(assert (=> b!1448128 m!1336407))

(declare-fun m!1336411 () Bool)

(assert (=> b!1448128 m!1336411))

(declare-fun m!1336413 () Bool)

(assert (=> start!124780 m!1336413))

(declare-fun m!1336415 () Bool)

(assert (=> start!124780 m!1336415))

(declare-fun m!1336417 () Bool)

(assert (=> b!1448124 m!1336417))

(assert (=> b!1448135 m!1336407))

(assert (=> b!1448135 m!1336407))

(declare-fun m!1336419 () Bool)

(assert (=> b!1448135 m!1336419))

(declare-fun m!1336421 () Bool)

(assert (=> b!1448129 m!1336421))

(declare-fun m!1336423 () Bool)

(assert (=> b!1448129 m!1336423))

(declare-fun m!1336425 () Bool)

(assert (=> b!1448129 m!1336425))

(assert (=> b!1448129 m!1336407))

(declare-fun m!1336427 () Bool)

(assert (=> b!1448119 m!1336427))

(declare-fun m!1336429 () Bool)

(assert (=> b!1448119 m!1336429))

(assert (=> b!1448127 m!1336407))

(assert (=> b!1448127 m!1336407))

(declare-fun m!1336431 () Bool)

(assert (=> b!1448127 m!1336431))

(declare-fun m!1336433 () Bool)

(assert (=> b!1448121 m!1336433))

(assert (=> b!1448121 m!1336433))

(declare-fun m!1336435 () Bool)

(assert (=> b!1448121 m!1336435))

(declare-fun m!1336437 () Bool)

(assert (=> b!1448125 m!1336437))

(assert (=> b!1448126 m!1336423))

(declare-fun m!1336439 () Bool)

(assert (=> b!1448126 m!1336439))

(declare-fun m!1336441 () Bool)

(assert (=> b!1448136 m!1336441))

(assert (=> b!1448136 m!1336423))

(declare-fun m!1336443 () Bool)

(assert (=> b!1448136 m!1336443))

(assert (=> b!1448136 m!1336425))

(assert (=> b!1448136 m!1336421))

(assert (=> b!1448136 m!1336407))

(declare-fun m!1336445 () Bool)

(assert (=> b!1448136 m!1336445))

(declare-fun m!1336447 () Bool)

(assert (=> b!1448136 m!1336447))

(assert (=> b!1448136 m!1336407))

(declare-fun m!1336449 () Bool)

(assert (=> b!1448133 m!1336449))

(assert (=> b!1448133 m!1336449))

(declare-fun m!1336451 () Bool)

(assert (=> b!1448133 m!1336451))

(assert (=> b!1448133 m!1336423))

(declare-fun m!1336453 () Bool)

(assert (=> b!1448133 m!1336453))

(assert (=> b!1448123 m!1336407))

(assert (=> b!1448123 m!1336407))

(declare-fun m!1336455 () Bool)

(assert (=> b!1448123 m!1336455))

(declare-fun m!1336457 () Bool)

(assert (=> b!1448122 m!1336457))

(assert (=> b!1448118 m!1336407))

(assert (=> b!1448118 m!1336407))

(declare-fun m!1336459 () Bool)

(assert (=> b!1448118 m!1336459))

(check-sat (not start!124780) (not b!1448119) (not b!1448124) (not b!1448118) (not b!1448133) (not b!1448123) (not b!1448125) (not b!1448128) (not b!1448122) (not b!1448127) (not b!1448136) (not b!1448121) (not b!1448135))
(check-sat)
