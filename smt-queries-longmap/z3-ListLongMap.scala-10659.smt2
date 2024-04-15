; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125062 () Bool)

(assert start!125062)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!819430 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1456485 () Bool)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98488 0))(
  ( (array!98489 (arr!47533 (Array (_ BitVec 32) (_ BitVec 64))) (size!48085 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98488)

(assert (=> b!1456485 (= e!819430 (and (or (= (select (arr!47533 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47533 a!2862) intermediateBeforeIndex!19) (select (arr!47533 a!2862) j!93))) (let ((bdg!53269 (select (store (arr!47533 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47533 a!2862) index!646) bdg!53269) (= (select (arr!47533 a!2862) index!646) (select (arr!47533 a!2862) j!93))) (= (select (arr!47533 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53269 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!638171 () (_ BitVec 64))

(declare-fun lt!638174 () array!98488)

(declare-fun b!1456486 () Bool)

(declare-datatypes ((SeekEntryResult!11810 0))(
  ( (MissingZero!11810 (index!49632 (_ BitVec 32))) (Found!11810 (index!49633 (_ BitVec 32))) (Intermediate!11810 (undefined!12622 Bool) (index!49634 (_ BitVec 32)) (x!131254 (_ BitVec 32))) (Undefined!11810) (MissingVacant!11810 (index!49635 (_ BitVec 32))) )
))
(declare-fun lt!638173 () SeekEntryResult!11810)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun e!819432 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98488 (_ BitVec 32)) SeekEntryResult!11810)

(assert (=> b!1456486 (= e!819432 (= lt!638173 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638171 lt!638174 mask!2687)))))

(declare-fun b!1456487 () Bool)

(declare-fun res!987046 () Bool)

(declare-fun e!819429 () Bool)

(assert (=> b!1456487 (=> (not res!987046) (not e!819429))))

(assert (=> b!1456487 (= res!987046 (and (= (size!48085 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48085 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48085 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1456488 () Bool)

(declare-fun e!819431 () Bool)

(declare-fun e!819434 () Bool)

(assert (=> b!1456488 (= e!819431 e!819434)))

(declare-fun res!987053 () Bool)

(assert (=> b!1456488 (=> (not res!987053) (not e!819434))))

(declare-fun lt!638168 () SeekEntryResult!11810)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1456488 (= res!987053 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47533 a!2862) j!93) mask!2687) (select (arr!47533 a!2862) j!93) a!2862 mask!2687) lt!638168))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1456488 (= lt!638168 (Intermediate!11810 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1456489 () Bool)

(declare-fun e!819426 () Bool)

(assert (=> b!1456489 (= e!819426 true)))

(declare-fun lt!638175 () Bool)

(declare-fun e!819427 () Bool)

(assert (=> b!1456489 (= lt!638175 e!819427)))

(declare-fun c!134236 () Bool)

(assert (=> b!1456489 (= c!134236 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1456490 () Bool)

(declare-fun res!987042 () Bool)

(assert (=> b!1456490 (=> (not res!987042) (not e!819429))))

(declare-datatypes ((List!34112 0))(
  ( (Nil!34109) (Cons!34108 (h!35458 (_ BitVec 64)) (t!48798 List!34112)) )
))
(declare-fun arrayNoDuplicates!0 (array!98488 (_ BitVec 32) List!34112) Bool)

(assert (=> b!1456490 (= res!987042 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34109))))

(declare-fun b!1456491 () Bool)

(declare-fun res!987052 () Bool)

(assert (=> b!1456491 (=> (not res!987052) (not e!819430))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98488 (_ BitVec 32)) SeekEntryResult!11810)

(assert (=> b!1456491 (= res!987052 (= (seekEntryOrOpen!0 (select (arr!47533 a!2862) j!93) a!2862 mask!2687) (Found!11810 j!93)))))

(declare-fun b!1456492 () Bool)

(declare-fun res!987055 () Bool)

(assert (=> b!1456492 (=> (not res!987055) (not e!819429))))

(assert (=> b!1456492 (= res!987055 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48085 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48085 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48085 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1456493 () Bool)

(declare-fun res!987045 () Bool)

(assert (=> b!1456493 (=> (not res!987045) (not e!819434))))

(assert (=> b!1456493 (= res!987045 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47533 a!2862) j!93) a!2862 mask!2687) lt!638168))))

(declare-fun b!1456494 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98488 (_ BitVec 32)) SeekEntryResult!11810)

(assert (=> b!1456494 (= e!819432 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638171 lt!638174 mask!2687) (seekEntryOrOpen!0 lt!638171 lt!638174 mask!2687)))))

(declare-fun lt!638170 () (_ BitVec 32))

(declare-fun b!1456495 () Bool)

(assert (=> b!1456495 (= e!819427 (not (= lt!638173 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638170 lt!638171 lt!638174 mask!2687))))))

(declare-fun b!1456496 () Bool)

(declare-fun e!819435 () Bool)

(assert (=> b!1456496 (= e!819434 e!819435)))

(declare-fun res!987041 () Bool)

(assert (=> b!1456496 (=> (not res!987041) (not e!819435))))

(assert (=> b!1456496 (= res!987041 (= lt!638173 (Intermediate!11810 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1456496 (= lt!638173 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638171 mask!2687) lt!638171 lt!638174 mask!2687))))

(assert (=> b!1456496 (= lt!638171 (select (store (arr!47533 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1456497 () Bool)

(declare-fun e!819433 () Bool)

(assert (=> b!1456497 (= e!819433 e!819426)))

(declare-fun res!987044 () Bool)

(assert (=> b!1456497 (=> res!987044 e!819426)))

(assert (=> b!1456497 (= res!987044 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638170 #b00000000000000000000000000000000) (bvsge lt!638170 (size!48085 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1456497 (= lt!638170 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!638169 () SeekEntryResult!11810)

(assert (=> b!1456497 (= lt!638169 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638171 lt!638174 mask!2687))))

(assert (=> b!1456497 (= lt!638169 (seekEntryOrOpen!0 lt!638171 lt!638174 mask!2687))))

(declare-fun b!1456498 () Bool)

(assert (=> b!1456498 (= e!819435 (not e!819433))))

(declare-fun res!987043 () Bool)

(assert (=> b!1456498 (=> res!987043 e!819433)))

(assert (=> b!1456498 (= res!987043 (or (and (= (select (arr!47533 a!2862) index!646) (select (store (arr!47533 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47533 a!2862) index!646) (select (arr!47533 a!2862) j!93))) (= (select (arr!47533 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1456498 e!819430))

(declare-fun res!987056 () Bool)

(assert (=> b!1456498 (=> (not res!987056) (not e!819430))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98488 (_ BitVec 32)) Bool)

(assert (=> b!1456498 (= res!987056 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48957 0))(
  ( (Unit!48958) )
))
(declare-fun lt!638172 () Unit!48957)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98488 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48957)

(assert (=> b!1456498 (= lt!638172 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1456499 () Bool)

(declare-fun res!987057 () Bool)

(assert (=> b!1456499 (=> (not res!987057) (not e!819435))))

(assert (=> b!1456499 (= res!987057 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1456500 () Bool)

(declare-fun res!987047 () Bool)

(assert (=> b!1456500 (=> (not res!987047) (not e!819435))))

(assert (=> b!1456500 (= res!987047 e!819432)))

(declare-fun c!134235 () Bool)

(assert (=> b!1456500 (= c!134235 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1456501 () Bool)

(declare-fun res!987051 () Bool)

(assert (=> b!1456501 (=> (not res!987051) (not e!819429))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1456501 (= res!987051 (validKeyInArray!0 (select (arr!47533 a!2862) j!93)))))

(declare-fun b!1456502 () Bool)

(assert (=> b!1456502 (= e!819427 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638170 intermediateAfterIndex!19 lt!638171 lt!638174 mask!2687) lt!638169)))))

(declare-fun b!1456503 () Bool)

(declare-fun res!987058 () Bool)

(assert (=> b!1456503 (=> (not res!987058) (not e!819429))))

(assert (=> b!1456503 (= res!987058 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1456504 () Bool)

(assert (=> b!1456504 (= e!819429 e!819431)))

(declare-fun res!987050 () Bool)

(assert (=> b!1456504 (=> (not res!987050) (not e!819431))))

(assert (=> b!1456504 (= res!987050 (= (select (store (arr!47533 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1456504 (= lt!638174 (array!98489 (store (arr!47533 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48085 a!2862)))))

(declare-fun b!1456505 () Bool)

(declare-fun res!987054 () Bool)

(assert (=> b!1456505 (=> (not res!987054) (not e!819429))))

(assert (=> b!1456505 (= res!987054 (validKeyInArray!0 (select (arr!47533 a!2862) i!1006)))))

(declare-fun res!987049 () Bool)

(assert (=> start!125062 (=> (not res!987049) (not e!819429))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125062 (= res!987049 (validMask!0 mask!2687))))

(assert (=> start!125062 e!819429))

(assert (=> start!125062 true))

(declare-fun array_inv!36766 (array!98488) Bool)

(assert (=> start!125062 (array_inv!36766 a!2862)))

(declare-fun b!1456506 () Bool)

(declare-fun res!987048 () Bool)

(assert (=> b!1456506 (=> res!987048 e!819426)))

(assert (=> b!1456506 (= res!987048 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638170 (select (arr!47533 a!2862) j!93) a!2862 mask!2687) lt!638168)))))

(assert (= (and start!125062 res!987049) b!1456487))

(assert (= (and b!1456487 res!987046) b!1456505))

(assert (= (and b!1456505 res!987054) b!1456501))

(assert (= (and b!1456501 res!987051) b!1456503))

(assert (= (and b!1456503 res!987058) b!1456490))

(assert (= (and b!1456490 res!987042) b!1456492))

(assert (= (and b!1456492 res!987055) b!1456504))

(assert (= (and b!1456504 res!987050) b!1456488))

(assert (= (and b!1456488 res!987053) b!1456493))

(assert (= (and b!1456493 res!987045) b!1456496))

(assert (= (and b!1456496 res!987041) b!1456500))

(assert (= (and b!1456500 c!134235) b!1456486))

(assert (= (and b!1456500 (not c!134235)) b!1456494))

(assert (= (and b!1456500 res!987047) b!1456499))

(assert (= (and b!1456499 res!987057) b!1456498))

(assert (= (and b!1456498 res!987056) b!1456491))

(assert (= (and b!1456491 res!987052) b!1456485))

(assert (= (and b!1456498 (not res!987043)) b!1456497))

(assert (= (and b!1456497 (not res!987044)) b!1456506))

(assert (= (and b!1456506 (not res!987048)) b!1456489))

(assert (= (and b!1456489 c!134236) b!1456495))

(assert (= (and b!1456489 (not c!134236)) b!1456502))

(declare-fun m!1344075 () Bool)

(assert (=> b!1456486 m!1344075))

(declare-fun m!1344077 () Bool)

(assert (=> b!1456504 m!1344077))

(declare-fun m!1344079 () Bool)

(assert (=> b!1456504 m!1344079))

(declare-fun m!1344081 () Bool)

(assert (=> b!1456501 m!1344081))

(assert (=> b!1456501 m!1344081))

(declare-fun m!1344083 () Bool)

(assert (=> b!1456501 m!1344083))

(declare-fun m!1344085 () Bool)

(assert (=> b!1456494 m!1344085))

(declare-fun m!1344087 () Bool)

(assert (=> b!1456494 m!1344087))

(declare-fun m!1344089 () Bool)

(assert (=> b!1456498 m!1344089))

(assert (=> b!1456498 m!1344077))

(declare-fun m!1344091 () Bool)

(assert (=> b!1456498 m!1344091))

(declare-fun m!1344093 () Bool)

(assert (=> b!1456498 m!1344093))

(declare-fun m!1344095 () Bool)

(assert (=> b!1456498 m!1344095))

(assert (=> b!1456498 m!1344081))

(declare-fun m!1344097 () Bool)

(assert (=> b!1456502 m!1344097))

(assert (=> b!1456488 m!1344081))

(assert (=> b!1456488 m!1344081))

(declare-fun m!1344099 () Bool)

(assert (=> b!1456488 m!1344099))

(assert (=> b!1456488 m!1344099))

(assert (=> b!1456488 m!1344081))

(declare-fun m!1344101 () Bool)

(assert (=> b!1456488 m!1344101))

(declare-fun m!1344103 () Bool)

(assert (=> b!1456496 m!1344103))

(assert (=> b!1456496 m!1344103))

(declare-fun m!1344105 () Bool)

(assert (=> b!1456496 m!1344105))

(assert (=> b!1456496 m!1344077))

(declare-fun m!1344107 () Bool)

(assert (=> b!1456496 m!1344107))

(declare-fun m!1344109 () Bool)

(assert (=> b!1456490 m!1344109))

(assert (=> b!1456491 m!1344081))

(assert (=> b!1456491 m!1344081))

(declare-fun m!1344111 () Bool)

(assert (=> b!1456491 m!1344111))

(assert (=> b!1456485 m!1344077))

(declare-fun m!1344113 () Bool)

(assert (=> b!1456485 m!1344113))

(assert (=> b!1456485 m!1344091))

(assert (=> b!1456485 m!1344093))

(assert (=> b!1456485 m!1344081))

(assert (=> b!1456506 m!1344081))

(assert (=> b!1456506 m!1344081))

(declare-fun m!1344115 () Bool)

(assert (=> b!1456506 m!1344115))

(declare-fun m!1344117 () Bool)

(assert (=> b!1456495 m!1344117))

(declare-fun m!1344119 () Bool)

(assert (=> b!1456503 m!1344119))

(declare-fun m!1344121 () Bool)

(assert (=> start!125062 m!1344121))

(declare-fun m!1344123 () Bool)

(assert (=> start!125062 m!1344123))

(declare-fun m!1344125 () Bool)

(assert (=> b!1456497 m!1344125))

(assert (=> b!1456497 m!1344085))

(assert (=> b!1456497 m!1344087))

(declare-fun m!1344127 () Bool)

(assert (=> b!1456505 m!1344127))

(assert (=> b!1456505 m!1344127))

(declare-fun m!1344129 () Bool)

(assert (=> b!1456505 m!1344129))

(assert (=> b!1456493 m!1344081))

(assert (=> b!1456493 m!1344081))

(declare-fun m!1344131 () Bool)

(assert (=> b!1456493 m!1344131))

(check-sat (not b!1456501) (not b!1456488) (not b!1456490) (not b!1456491) (not b!1456506) (not b!1456494) (not b!1456497) (not b!1456505) (not b!1456486) (not b!1456503) (not b!1456502) (not b!1456498) (not b!1456493) (not b!1456496) (not b!1456495) (not start!125062))
(check-sat)
