; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130350 () Bool)

(assert start!130350)

(declare-fun b!1527466 () Bool)

(declare-fun res!1044344 () Bool)

(declare-fun e!851588 () Bool)

(assert (=> b!1527466 (=> (not res!1044344) (not e!851588))))

(declare-datatypes ((array!101563 0))(
  ( (array!101564 (arr!49003 (Array (_ BitVec 32) (_ BitVec 64))) (size!49554 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101563)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1527466 (= res!1044344 (validKeyInArray!0 (select (arr!49003 a!2804) i!961)))))

(declare-fun e!851590 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun b!1527467 () Bool)

(declare-datatypes ((SeekEntryResult!13061 0))(
  ( (MissingZero!13061 (index!54639 (_ BitVec 32))) (Found!13061 (index!54640 (_ BitVec 32))) (Intermediate!13061 (undefined!13873 Bool) (index!54641 (_ BitVec 32)) (x!136545 (_ BitVec 32))) (Undefined!13061) (MissingVacant!13061 (index!54642 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101563 (_ BitVec 32)) SeekEntryResult!13061)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101563 (_ BitVec 32)) SeekEntryResult!13061)

(assert (=> b!1527467 (= e!851590 (= (seekEntryOrOpen!0 (select (arr!49003 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!49003 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1527468 () Bool)

(declare-fun res!1044348 () Bool)

(assert (=> b!1527468 (=> (not res!1044348) (not e!851588))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1527468 (= res!1044348 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49554 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49554 a!2804))))))

(declare-fun b!1527469 () Bool)

(declare-fun e!851587 () Bool)

(declare-fun e!851586 () Bool)

(assert (=> b!1527469 (= e!851587 (not e!851586))))

(declare-fun res!1044353 () Bool)

(assert (=> b!1527469 (=> res!1044353 e!851586)))

(declare-fun lt!661456 () (_ BitVec 64))

(assert (=> b!1527469 (= res!1044353 (or (not (= (select (arr!49003 a!2804) j!70) lt!661456)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!49003 a!2804) index!487) (select (arr!49003 a!2804) j!70)) (not (= (select (arr!49003 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!851585 () Bool)

(assert (=> b!1527469 e!851585))

(declare-fun res!1044349 () Bool)

(assert (=> b!1527469 (=> (not res!1044349) (not e!851585))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101563 (_ BitVec 32)) Bool)

(assert (=> b!1527469 (= res!1044349 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50941 0))(
  ( (Unit!50942) )
))
(declare-fun lt!661454 () Unit!50941)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101563 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50941)

(assert (=> b!1527469 (= lt!661454 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1527470 () Bool)

(declare-fun res!1044342 () Bool)

(assert (=> b!1527470 (=> (not res!1044342) (not e!851585))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101563 (_ BitVec 32)) SeekEntryResult!13061)

(assert (=> b!1527470 (= res!1044342 (= (seekEntry!0 (select (arr!49003 a!2804) j!70) a!2804 mask!2512) (Found!13061 j!70)))))

(declare-fun b!1527471 () Bool)

(declare-fun lt!661458 () array!101563)

(assert (=> b!1527471 (= e!851586 (= (seekEntryOrOpen!0 lt!661456 lt!661458 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661456 lt!661458 mask!2512)))))

(declare-fun b!1527472 () Bool)

(declare-fun e!851584 () Bool)

(assert (=> b!1527472 (= e!851584 e!851587)))

(declare-fun res!1044341 () Bool)

(assert (=> b!1527472 (=> (not res!1044341) (not e!851587))))

(declare-fun lt!661455 () SeekEntryResult!13061)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101563 (_ BitVec 32)) SeekEntryResult!13061)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1527472 (= res!1044341 (= lt!661455 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661456 mask!2512) lt!661456 lt!661458 mask!2512)))))

(assert (=> b!1527472 (= lt!661456 (select (store (arr!49003 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1527472 (= lt!661458 (array!101564 (store (arr!49003 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49554 a!2804)))))

(declare-fun b!1527473 () Bool)

(declare-fun res!1044347 () Bool)

(assert (=> b!1527473 (=> (not res!1044347) (not e!851588))))

(declare-datatypes ((List!35473 0))(
  ( (Nil!35470) (Cons!35469 (h!36917 (_ BitVec 64)) (t!50159 List!35473)) )
))
(declare-fun arrayNoDuplicates!0 (array!101563 (_ BitVec 32) List!35473) Bool)

(assert (=> b!1527473 (= res!1044347 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35470))))

(declare-fun res!1044345 () Bool)

(assert (=> start!130350 (=> (not res!1044345) (not e!851588))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130350 (= res!1044345 (validMask!0 mask!2512))))

(assert (=> start!130350 e!851588))

(assert (=> start!130350 true))

(declare-fun array_inv!38284 (array!101563) Bool)

(assert (=> start!130350 (array_inv!38284 a!2804)))

(declare-fun b!1527474 () Bool)

(assert (=> b!1527474 (= e!851585 e!851590)))

(declare-fun res!1044351 () Bool)

(assert (=> b!1527474 (=> res!1044351 e!851590)))

(assert (=> b!1527474 (= res!1044351 (or (not (= (select (arr!49003 a!2804) j!70) lt!661456)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!49003 a!2804) index!487) (select (arr!49003 a!2804) j!70)) (not (= (select (arr!49003 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1527475 () Bool)

(declare-fun res!1044343 () Bool)

(assert (=> b!1527475 (=> (not res!1044343) (not e!851584))))

(declare-fun lt!661457 () SeekEntryResult!13061)

(assert (=> b!1527475 (= res!1044343 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49003 a!2804) j!70) a!2804 mask!2512) lt!661457))))

(declare-fun b!1527476 () Bool)

(declare-fun res!1044350 () Bool)

(assert (=> b!1527476 (=> (not res!1044350) (not e!851588))))

(assert (=> b!1527476 (= res!1044350 (validKeyInArray!0 (select (arr!49003 a!2804) j!70)))))

(declare-fun b!1527477 () Bool)

(declare-fun res!1044354 () Bool)

(assert (=> b!1527477 (=> (not res!1044354) (not e!851588))))

(assert (=> b!1527477 (= res!1044354 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1527478 () Bool)

(assert (=> b!1527478 (= e!851588 e!851584)))

(declare-fun res!1044346 () Bool)

(assert (=> b!1527478 (=> (not res!1044346) (not e!851584))))

(assert (=> b!1527478 (= res!1044346 (= lt!661455 lt!661457))))

(assert (=> b!1527478 (= lt!661457 (Intermediate!13061 false resIndex!21 resX!21))))

(assert (=> b!1527478 (= lt!661455 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49003 a!2804) j!70) mask!2512) (select (arr!49003 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1527479 () Bool)

(declare-fun res!1044352 () Bool)

(assert (=> b!1527479 (=> (not res!1044352) (not e!851588))))

(assert (=> b!1527479 (= res!1044352 (and (= (size!49554 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49554 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49554 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!130350 res!1044345) b!1527479))

(assert (= (and b!1527479 res!1044352) b!1527466))

(assert (= (and b!1527466 res!1044344) b!1527476))

(assert (= (and b!1527476 res!1044350) b!1527477))

(assert (= (and b!1527477 res!1044354) b!1527473))

(assert (= (and b!1527473 res!1044347) b!1527468))

(assert (= (and b!1527468 res!1044348) b!1527478))

(assert (= (and b!1527478 res!1044346) b!1527475))

(assert (= (and b!1527475 res!1044343) b!1527472))

(assert (= (and b!1527472 res!1044341) b!1527469))

(assert (= (and b!1527469 res!1044349) b!1527470))

(assert (= (and b!1527470 res!1044342) b!1527474))

(assert (= (and b!1527474 (not res!1044351)) b!1527467))

(assert (= (and b!1527469 (not res!1044353)) b!1527471))

(declare-fun m!1410205 () Bool)

(assert (=> b!1527466 m!1410205))

(assert (=> b!1527466 m!1410205))

(declare-fun m!1410207 () Bool)

(assert (=> b!1527466 m!1410207))

(declare-fun m!1410209 () Bool)

(assert (=> b!1527473 m!1410209))

(declare-fun m!1410211 () Bool)

(assert (=> start!130350 m!1410211))

(declare-fun m!1410213 () Bool)

(assert (=> start!130350 m!1410213))

(declare-fun m!1410215 () Bool)

(assert (=> b!1527470 m!1410215))

(assert (=> b!1527470 m!1410215))

(declare-fun m!1410217 () Bool)

(assert (=> b!1527470 m!1410217))

(declare-fun m!1410219 () Bool)

(assert (=> b!1527477 m!1410219))

(assert (=> b!1527476 m!1410215))

(assert (=> b!1527476 m!1410215))

(declare-fun m!1410221 () Bool)

(assert (=> b!1527476 m!1410221))

(assert (=> b!1527469 m!1410215))

(declare-fun m!1410223 () Bool)

(assert (=> b!1527469 m!1410223))

(declare-fun m!1410225 () Bool)

(assert (=> b!1527469 m!1410225))

(declare-fun m!1410227 () Bool)

(assert (=> b!1527469 m!1410227))

(assert (=> b!1527475 m!1410215))

(assert (=> b!1527475 m!1410215))

(declare-fun m!1410229 () Bool)

(assert (=> b!1527475 m!1410229))

(declare-fun m!1410231 () Bool)

(assert (=> b!1527471 m!1410231))

(declare-fun m!1410233 () Bool)

(assert (=> b!1527471 m!1410233))

(assert (=> b!1527467 m!1410215))

(assert (=> b!1527467 m!1410215))

(declare-fun m!1410235 () Bool)

(assert (=> b!1527467 m!1410235))

(assert (=> b!1527467 m!1410215))

(declare-fun m!1410237 () Bool)

(assert (=> b!1527467 m!1410237))

(assert (=> b!1527474 m!1410215))

(assert (=> b!1527474 m!1410223))

(assert (=> b!1527478 m!1410215))

(assert (=> b!1527478 m!1410215))

(declare-fun m!1410239 () Bool)

(assert (=> b!1527478 m!1410239))

(assert (=> b!1527478 m!1410239))

(assert (=> b!1527478 m!1410215))

(declare-fun m!1410241 () Bool)

(assert (=> b!1527478 m!1410241))

(declare-fun m!1410243 () Bool)

(assert (=> b!1527472 m!1410243))

(assert (=> b!1527472 m!1410243))

(declare-fun m!1410245 () Bool)

(assert (=> b!1527472 m!1410245))

(declare-fun m!1410247 () Bool)

(assert (=> b!1527472 m!1410247))

(declare-fun m!1410249 () Bool)

(assert (=> b!1527472 m!1410249))

(check-sat (not b!1527478) (not b!1527476) (not b!1527477) (not start!130350) (not b!1527473) (not b!1527472) (not b!1527470) (not b!1527471) (not b!1527466) (not b!1527469) (not b!1527467) (not b!1527475))
(check-sat)
(get-model)

(declare-fun b!1527576 () Bool)

(declare-fun e!851640 () SeekEntryResult!13061)

(declare-fun lt!661495 () SeekEntryResult!13061)

(assert (=> b!1527576 (= e!851640 (Found!13061 (index!54641 lt!661495)))))

(declare-fun b!1527577 () Bool)

(declare-fun e!851641 () SeekEntryResult!13061)

(assert (=> b!1527577 (= e!851641 Undefined!13061)))

(declare-fun b!1527578 () Bool)

(assert (=> b!1527578 (= e!851641 e!851640)))

(declare-fun lt!661496 () (_ BitVec 64))

(assert (=> b!1527578 (= lt!661496 (select (arr!49003 lt!661458) (index!54641 lt!661495)))))

(declare-fun c!141131 () Bool)

(assert (=> b!1527578 (= c!141131 (= lt!661496 lt!661456))))

(declare-fun d!160121 () Bool)

(declare-fun lt!661497 () SeekEntryResult!13061)

(get-info :version)

(assert (=> d!160121 (and (or ((_ is Undefined!13061) lt!661497) (not ((_ is Found!13061) lt!661497)) (and (bvsge (index!54640 lt!661497) #b00000000000000000000000000000000) (bvslt (index!54640 lt!661497) (size!49554 lt!661458)))) (or ((_ is Undefined!13061) lt!661497) ((_ is Found!13061) lt!661497) (not ((_ is MissingZero!13061) lt!661497)) (and (bvsge (index!54639 lt!661497) #b00000000000000000000000000000000) (bvslt (index!54639 lt!661497) (size!49554 lt!661458)))) (or ((_ is Undefined!13061) lt!661497) ((_ is Found!13061) lt!661497) ((_ is MissingZero!13061) lt!661497) (not ((_ is MissingVacant!13061) lt!661497)) (and (bvsge (index!54642 lt!661497) #b00000000000000000000000000000000) (bvslt (index!54642 lt!661497) (size!49554 lt!661458)))) (or ((_ is Undefined!13061) lt!661497) (ite ((_ is Found!13061) lt!661497) (= (select (arr!49003 lt!661458) (index!54640 lt!661497)) lt!661456) (ite ((_ is MissingZero!13061) lt!661497) (= (select (arr!49003 lt!661458) (index!54639 lt!661497)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!13061) lt!661497) (= (select (arr!49003 lt!661458) (index!54642 lt!661497)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!160121 (= lt!661497 e!851641)))

(declare-fun c!141133 () Bool)

(assert (=> d!160121 (= c!141133 (and ((_ is Intermediate!13061) lt!661495) (undefined!13873 lt!661495)))))

(assert (=> d!160121 (= lt!661495 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661456 mask!2512) lt!661456 lt!661458 mask!2512))))

(assert (=> d!160121 (validMask!0 mask!2512)))

(assert (=> d!160121 (= (seekEntryOrOpen!0 lt!661456 lt!661458 mask!2512) lt!661497)))

(declare-fun b!1527579 () Bool)

(declare-fun c!141132 () Bool)

(assert (=> b!1527579 (= c!141132 (= lt!661496 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!851639 () SeekEntryResult!13061)

(assert (=> b!1527579 (= e!851640 e!851639)))

(declare-fun b!1527580 () Bool)

(assert (=> b!1527580 (= e!851639 (MissingZero!13061 (index!54641 lt!661495)))))

(declare-fun b!1527581 () Bool)

(assert (=> b!1527581 (= e!851639 (seekKeyOrZeroReturnVacant!0 (x!136545 lt!661495) (index!54641 lt!661495) (index!54641 lt!661495) lt!661456 lt!661458 mask!2512))))

(assert (= (and d!160121 c!141133) b!1527577))

(assert (= (and d!160121 (not c!141133)) b!1527578))

(assert (= (and b!1527578 c!141131) b!1527576))

(assert (= (and b!1527578 (not c!141131)) b!1527579))

(assert (= (and b!1527579 c!141132) b!1527580))

(assert (= (and b!1527579 (not c!141132)) b!1527581))

(declare-fun m!1410343 () Bool)

(assert (=> b!1527578 m!1410343))

(assert (=> d!160121 m!1410211))

(declare-fun m!1410345 () Bool)

(assert (=> d!160121 m!1410345))

(declare-fun m!1410347 () Bool)

(assert (=> d!160121 m!1410347))

(declare-fun m!1410349 () Bool)

(assert (=> d!160121 m!1410349))

(assert (=> d!160121 m!1410243))

(assert (=> d!160121 m!1410243))

(assert (=> d!160121 m!1410245))

(declare-fun m!1410351 () Bool)

(assert (=> b!1527581 m!1410351))

(assert (=> b!1527471 d!160121))

(declare-fun b!1527594 () Bool)

(declare-fun e!851649 () SeekEntryResult!13061)

(declare-fun e!851650 () SeekEntryResult!13061)

(assert (=> b!1527594 (= e!851649 e!851650)))

(declare-fun c!141141 () Bool)

(declare-fun lt!661502 () (_ BitVec 64))

(assert (=> b!1527594 (= c!141141 (= lt!661502 lt!661456))))

(declare-fun d!160123 () Bool)

(declare-fun lt!661503 () SeekEntryResult!13061)

(assert (=> d!160123 (and (or ((_ is Undefined!13061) lt!661503) (not ((_ is Found!13061) lt!661503)) (and (bvsge (index!54640 lt!661503) #b00000000000000000000000000000000) (bvslt (index!54640 lt!661503) (size!49554 lt!661458)))) (or ((_ is Undefined!13061) lt!661503) ((_ is Found!13061) lt!661503) (not ((_ is MissingVacant!13061) lt!661503)) (not (= (index!54642 lt!661503) index!487)) (and (bvsge (index!54642 lt!661503) #b00000000000000000000000000000000) (bvslt (index!54642 lt!661503) (size!49554 lt!661458)))) (or ((_ is Undefined!13061) lt!661503) (ite ((_ is Found!13061) lt!661503) (= (select (arr!49003 lt!661458) (index!54640 lt!661503)) lt!661456) (and ((_ is MissingVacant!13061) lt!661503) (= (index!54642 lt!661503) index!487) (= (select (arr!49003 lt!661458) (index!54642 lt!661503)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!160123 (= lt!661503 e!851649)))

(declare-fun c!141140 () Bool)

(assert (=> d!160123 (= c!141140 (bvsge x!534 #b01111111111111111111111111111110))))

(assert (=> d!160123 (= lt!661502 (select (arr!49003 lt!661458) index!487))))

(assert (=> d!160123 (validMask!0 mask!2512)))

(assert (=> d!160123 (= (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661456 lt!661458 mask!2512) lt!661503)))

(declare-fun b!1527595 () Bool)

(declare-fun c!141142 () Bool)

(assert (=> b!1527595 (= c!141142 (= lt!661502 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!851648 () SeekEntryResult!13061)

(assert (=> b!1527595 (= e!851650 e!851648)))

(declare-fun b!1527596 () Bool)

(assert (=> b!1527596 (= e!851648 (MissingVacant!13061 index!487))))

(declare-fun b!1527597 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1527597 (= e!851648 (seekKeyOrZeroReturnVacant!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 (bvadd x!534 #b00000000000000000000000000000001) mask!2512) index!487 lt!661456 lt!661458 mask!2512))))

(declare-fun b!1527598 () Bool)

(assert (=> b!1527598 (= e!851649 Undefined!13061)))

(declare-fun b!1527599 () Bool)

(assert (=> b!1527599 (= e!851650 (Found!13061 index!487))))

(assert (= (and d!160123 c!141140) b!1527598))

(assert (= (and d!160123 (not c!141140)) b!1527594))

(assert (= (and b!1527594 c!141141) b!1527599))

(assert (= (and b!1527594 (not c!141141)) b!1527595))

(assert (= (and b!1527595 c!141142) b!1527596))

(assert (= (and b!1527595 (not c!141142)) b!1527597))

(declare-fun m!1410353 () Bool)

(assert (=> d!160123 m!1410353))

(declare-fun m!1410355 () Bool)

(assert (=> d!160123 m!1410355))

(declare-fun m!1410357 () Bool)

(assert (=> d!160123 m!1410357))

(assert (=> d!160123 m!1410211))

(declare-fun m!1410359 () Bool)

(assert (=> b!1527597 m!1410359))

(assert (=> b!1527597 m!1410359))

(declare-fun m!1410361 () Bool)

(assert (=> b!1527597 m!1410361))

(assert (=> b!1527471 d!160123))

(declare-fun b!1527657 () Bool)

(declare-fun e!851683 () SeekEntryResult!13061)

(declare-fun e!851681 () SeekEntryResult!13061)

(assert (=> b!1527657 (= e!851683 e!851681)))

(declare-fun lt!661527 () (_ BitVec 64))

(declare-fun lt!661529 () SeekEntryResult!13061)

(assert (=> b!1527657 (= lt!661527 (select (arr!49003 a!2804) (index!54641 lt!661529)))))

(declare-fun c!141168 () Bool)

(assert (=> b!1527657 (= c!141168 (= lt!661527 (select (arr!49003 a!2804) j!70)))))

(declare-fun b!1527658 () Bool)

(declare-fun c!141167 () Bool)

(assert (=> b!1527658 (= c!141167 (= lt!661527 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!851682 () SeekEntryResult!13061)

(assert (=> b!1527658 (= e!851681 e!851682)))

(declare-fun d!160129 () Bool)

(declare-fun lt!661528 () SeekEntryResult!13061)

(assert (=> d!160129 (and (or ((_ is MissingVacant!13061) lt!661528) (not ((_ is Found!13061) lt!661528)) (and (bvsge (index!54640 lt!661528) #b00000000000000000000000000000000) (bvslt (index!54640 lt!661528) (size!49554 a!2804)))) (not ((_ is MissingVacant!13061) lt!661528)) (or (not ((_ is Found!13061) lt!661528)) (= (select (arr!49003 a!2804) (index!54640 lt!661528)) (select (arr!49003 a!2804) j!70))))))

(assert (=> d!160129 (= lt!661528 e!851683)))

(declare-fun c!141169 () Bool)

(assert (=> d!160129 (= c!141169 (and ((_ is Intermediate!13061) lt!661529) (undefined!13873 lt!661529)))))

(assert (=> d!160129 (= lt!661529 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49003 a!2804) j!70) mask!2512) (select (arr!49003 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!160129 (validMask!0 mask!2512)))

(assert (=> d!160129 (= (seekEntry!0 (select (arr!49003 a!2804) j!70) a!2804 mask!2512) lt!661528)))

(declare-fun b!1527659 () Bool)

(assert (=> b!1527659 (= e!851681 (Found!13061 (index!54641 lt!661529)))))

(declare-fun b!1527660 () Bool)

(declare-fun lt!661530 () SeekEntryResult!13061)

(assert (=> b!1527660 (= e!851682 (ite ((_ is MissingVacant!13061) lt!661530) (MissingZero!13061 (index!54642 lt!661530)) lt!661530))))

(assert (=> b!1527660 (= lt!661530 (seekKeyOrZeroReturnVacant!0 (x!136545 lt!661529) (index!54641 lt!661529) (index!54641 lt!661529) (select (arr!49003 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1527661 () Bool)

(assert (=> b!1527661 (= e!851683 Undefined!13061)))

(declare-fun b!1527662 () Bool)

(assert (=> b!1527662 (= e!851682 (MissingZero!13061 (index!54641 lt!661529)))))

(assert (= (and d!160129 c!141169) b!1527661))

(assert (= (and d!160129 (not c!141169)) b!1527657))

(assert (= (and b!1527657 c!141168) b!1527659))

(assert (= (and b!1527657 (not c!141168)) b!1527658))

(assert (= (and b!1527658 c!141167) b!1527662))

(assert (= (and b!1527658 (not c!141167)) b!1527660))

(declare-fun m!1410381 () Bool)

(assert (=> b!1527657 m!1410381))

(declare-fun m!1410383 () Bool)

(assert (=> d!160129 m!1410383))

(assert (=> d!160129 m!1410215))

(assert (=> d!160129 m!1410239))

(assert (=> d!160129 m!1410239))

(assert (=> d!160129 m!1410215))

(assert (=> d!160129 m!1410241))

(assert (=> d!160129 m!1410211))

(assert (=> b!1527660 m!1410215))

(declare-fun m!1410385 () Bool)

(assert (=> b!1527660 m!1410385))

(assert (=> b!1527470 d!160129))

(declare-fun b!1527683 () Bool)

(declare-fun e!851696 () Bool)

(declare-fun e!851698 () Bool)

(assert (=> b!1527683 (= e!851696 e!851698)))

(declare-fun lt!661549 () (_ BitVec 64))

(assert (=> b!1527683 (= lt!661549 (select (arr!49003 a!2804) j!70))))

(declare-fun lt!661548 () Unit!50941)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101563 (_ BitVec 64) (_ BitVec 32)) Unit!50941)

(assert (=> b!1527683 (= lt!661548 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!661549 j!70))))

(declare-fun arrayContainsKey!0 (array!101563 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1527683 (arrayContainsKey!0 a!2804 lt!661549 #b00000000000000000000000000000000)))

(declare-fun lt!661547 () Unit!50941)

(assert (=> b!1527683 (= lt!661547 lt!661548)))

(declare-fun res!1044454 () Bool)

(assert (=> b!1527683 (= res!1044454 (= (seekEntryOrOpen!0 (select (arr!49003 a!2804) j!70) a!2804 mask!2512) (Found!13061 j!70)))))

(assert (=> b!1527683 (=> (not res!1044454) (not e!851698))))

(declare-fun d!160135 () Bool)

(declare-fun res!1044453 () Bool)

(declare-fun e!851697 () Bool)

(assert (=> d!160135 (=> res!1044453 e!851697)))

(assert (=> d!160135 (= res!1044453 (bvsge j!70 (size!49554 a!2804)))))

(assert (=> d!160135 (= (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512) e!851697)))

(declare-fun b!1527684 () Bool)

(declare-fun call!68583 () Bool)

(assert (=> b!1527684 (= e!851696 call!68583)))

(declare-fun b!1527685 () Bool)

(assert (=> b!1527685 (= e!851697 e!851696)))

(declare-fun c!141178 () Bool)

(assert (=> b!1527685 (= c!141178 (validKeyInArray!0 (select (arr!49003 a!2804) j!70)))))

(declare-fun b!1527686 () Bool)

(assert (=> b!1527686 (= e!851698 call!68583)))

(declare-fun bm!68580 () Bool)

(assert (=> bm!68580 (= call!68583 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001) a!2804 mask!2512))))

(assert (= (and d!160135 (not res!1044453)) b!1527685))

(assert (= (and b!1527685 c!141178) b!1527683))

(assert (= (and b!1527685 (not c!141178)) b!1527684))

(assert (= (and b!1527683 res!1044454) b!1527686))

(assert (= (or b!1527686 b!1527684) bm!68580))

(assert (=> b!1527683 m!1410215))

(declare-fun m!1410387 () Bool)

(assert (=> b!1527683 m!1410387))

(declare-fun m!1410389 () Bool)

(assert (=> b!1527683 m!1410389))

(assert (=> b!1527683 m!1410215))

(assert (=> b!1527683 m!1410235))

(assert (=> b!1527685 m!1410215))

(assert (=> b!1527685 m!1410215))

(assert (=> b!1527685 m!1410221))

(declare-fun m!1410391 () Bool)

(assert (=> bm!68580 m!1410391))

(assert (=> b!1527469 d!160135))

(declare-fun d!160143 () Bool)

(assert (=> d!160143 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-fun lt!661554 () Unit!50941)

(declare-fun choose!38 (array!101563 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50941)

(assert (=> d!160143 (= lt!661554 (choose!38 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (=> d!160143 (validMask!0 mask!2512)))

(assert (=> d!160143 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70) lt!661554)))

(declare-fun bs!43787 () Bool)

(assert (= bs!43787 d!160143))

(assert (=> bs!43787 m!1410225))

(declare-fun m!1410401 () Bool)

(assert (=> bs!43787 m!1410401))

(assert (=> bs!43787 m!1410211))

(assert (=> b!1527469 d!160143))

(declare-fun b!1527693 () Bool)

(declare-fun e!851703 () SeekEntryResult!13061)

(declare-fun lt!661555 () SeekEntryResult!13061)

(assert (=> b!1527693 (= e!851703 (Found!13061 (index!54641 lt!661555)))))

(declare-fun b!1527694 () Bool)

(declare-fun e!851704 () SeekEntryResult!13061)

(assert (=> b!1527694 (= e!851704 Undefined!13061)))

(declare-fun b!1527695 () Bool)

(assert (=> b!1527695 (= e!851704 e!851703)))

(declare-fun lt!661556 () (_ BitVec 64))

(assert (=> b!1527695 (= lt!661556 (select (arr!49003 a!2804) (index!54641 lt!661555)))))

(declare-fun c!141182 () Bool)

(assert (=> b!1527695 (= c!141182 (= lt!661556 (select (arr!49003 a!2804) j!70)))))

(declare-fun d!160147 () Bool)

(declare-fun lt!661557 () SeekEntryResult!13061)

(assert (=> d!160147 (and (or ((_ is Undefined!13061) lt!661557) (not ((_ is Found!13061) lt!661557)) (and (bvsge (index!54640 lt!661557) #b00000000000000000000000000000000) (bvslt (index!54640 lt!661557) (size!49554 a!2804)))) (or ((_ is Undefined!13061) lt!661557) ((_ is Found!13061) lt!661557) (not ((_ is MissingZero!13061) lt!661557)) (and (bvsge (index!54639 lt!661557) #b00000000000000000000000000000000) (bvslt (index!54639 lt!661557) (size!49554 a!2804)))) (or ((_ is Undefined!13061) lt!661557) ((_ is Found!13061) lt!661557) ((_ is MissingZero!13061) lt!661557) (not ((_ is MissingVacant!13061) lt!661557)) (and (bvsge (index!54642 lt!661557) #b00000000000000000000000000000000) (bvslt (index!54642 lt!661557) (size!49554 a!2804)))) (or ((_ is Undefined!13061) lt!661557) (ite ((_ is Found!13061) lt!661557) (= (select (arr!49003 a!2804) (index!54640 lt!661557)) (select (arr!49003 a!2804) j!70)) (ite ((_ is MissingZero!13061) lt!661557) (= (select (arr!49003 a!2804) (index!54639 lt!661557)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!13061) lt!661557) (= (select (arr!49003 a!2804) (index!54642 lt!661557)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!160147 (= lt!661557 e!851704)))

(declare-fun c!141184 () Bool)

(assert (=> d!160147 (= c!141184 (and ((_ is Intermediate!13061) lt!661555) (undefined!13873 lt!661555)))))

(assert (=> d!160147 (= lt!661555 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49003 a!2804) j!70) mask!2512) (select (arr!49003 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!160147 (validMask!0 mask!2512)))

(assert (=> d!160147 (= (seekEntryOrOpen!0 (select (arr!49003 a!2804) j!70) a!2804 mask!2512) lt!661557)))

(declare-fun b!1527696 () Bool)

(declare-fun c!141183 () Bool)

(assert (=> b!1527696 (= c!141183 (= lt!661556 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!851702 () SeekEntryResult!13061)

(assert (=> b!1527696 (= e!851703 e!851702)))

(declare-fun b!1527697 () Bool)

(assert (=> b!1527697 (= e!851702 (MissingZero!13061 (index!54641 lt!661555)))))

(declare-fun b!1527698 () Bool)

(assert (=> b!1527698 (= e!851702 (seekKeyOrZeroReturnVacant!0 (x!136545 lt!661555) (index!54641 lt!661555) (index!54641 lt!661555) (select (arr!49003 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and d!160147 c!141184) b!1527694))

(assert (= (and d!160147 (not c!141184)) b!1527695))

(assert (= (and b!1527695 c!141182) b!1527693))

(assert (= (and b!1527695 (not c!141182)) b!1527696))

(assert (= (and b!1527696 c!141183) b!1527697))

(assert (= (and b!1527696 (not c!141183)) b!1527698))

(declare-fun m!1410403 () Bool)

(assert (=> b!1527695 m!1410403))

(assert (=> d!160147 m!1410211))

(declare-fun m!1410405 () Bool)

(assert (=> d!160147 m!1410405))

(declare-fun m!1410407 () Bool)

(assert (=> d!160147 m!1410407))

(declare-fun m!1410409 () Bool)

(assert (=> d!160147 m!1410409))

(assert (=> d!160147 m!1410215))

(assert (=> d!160147 m!1410239))

(assert (=> d!160147 m!1410239))

(assert (=> d!160147 m!1410215))

(assert (=> d!160147 m!1410241))

(assert (=> b!1527698 m!1410215))

(declare-fun m!1410411 () Bool)

(assert (=> b!1527698 m!1410411))

(assert (=> b!1527467 d!160147))

(declare-fun b!1527699 () Bool)

(declare-fun e!851706 () SeekEntryResult!13061)

(declare-fun e!851707 () SeekEntryResult!13061)

(assert (=> b!1527699 (= e!851706 e!851707)))

(declare-fun lt!661558 () (_ BitVec 64))

(declare-fun c!141186 () Bool)

(assert (=> b!1527699 (= c!141186 (= lt!661558 (select (arr!49003 a!2804) j!70)))))

(declare-fun lt!661559 () SeekEntryResult!13061)

(declare-fun d!160149 () Bool)

(assert (=> d!160149 (and (or ((_ is Undefined!13061) lt!661559) (not ((_ is Found!13061) lt!661559)) (and (bvsge (index!54640 lt!661559) #b00000000000000000000000000000000) (bvslt (index!54640 lt!661559) (size!49554 a!2804)))) (or ((_ is Undefined!13061) lt!661559) ((_ is Found!13061) lt!661559) (not ((_ is MissingVacant!13061) lt!661559)) (not (= (index!54642 lt!661559) index!487)) (and (bvsge (index!54642 lt!661559) #b00000000000000000000000000000000) (bvslt (index!54642 lt!661559) (size!49554 a!2804)))) (or ((_ is Undefined!13061) lt!661559) (ite ((_ is Found!13061) lt!661559) (= (select (arr!49003 a!2804) (index!54640 lt!661559)) (select (arr!49003 a!2804) j!70)) (and ((_ is MissingVacant!13061) lt!661559) (= (index!54642 lt!661559) index!487) (= (select (arr!49003 a!2804) (index!54642 lt!661559)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!160149 (= lt!661559 e!851706)))

(declare-fun c!141185 () Bool)

(assert (=> d!160149 (= c!141185 (bvsge x!534 #b01111111111111111111111111111110))))

(assert (=> d!160149 (= lt!661558 (select (arr!49003 a!2804) index!487))))

(assert (=> d!160149 (validMask!0 mask!2512)))

(assert (=> d!160149 (= (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!49003 a!2804) j!70) a!2804 mask!2512) lt!661559)))

(declare-fun b!1527700 () Bool)

(declare-fun c!141187 () Bool)

(assert (=> b!1527700 (= c!141187 (= lt!661558 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!851705 () SeekEntryResult!13061)

(assert (=> b!1527700 (= e!851707 e!851705)))

(declare-fun b!1527701 () Bool)

(assert (=> b!1527701 (= e!851705 (MissingVacant!13061 index!487))))

(declare-fun b!1527702 () Bool)

(assert (=> b!1527702 (= e!851705 (seekKeyOrZeroReturnVacant!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 (bvadd x!534 #b00000000000000000000000000000001) mask!2512) index!487 (select (arr!49003 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1527703 () Bool)

(assert (=> b!1527703 (= e!851706 Undefined!13061)))

(declare-fun b!1527704 () Bool)

(assert (=> b!1527704 (= e!851707 (Found!13061 index!487))))

(assert (= (and d!160149 c!141185) b!1527703))

(assert (= (and d!160149 (not c!141185)) b!1527699))

(assert (= (and b!1527699 c!141186) b!1527704))

(assert (= (and b!1527699 (not c!141186)) b!1527700))

(assert (= (and b!1527700 c!141187) b!1527701))

(assert (= (and b!1527700 (not c!141187)) b!1527702))

(declare-fun m!1410413 () Bool)

(assert (=> d!160149 m!1410413))

(declare-fun m!1410415 () Bool)

(assert (=> d!160149 m!1410415))

(assert (=> d!160149 m!1410223))

(assert (=> d!160149 m!1410211))

(assert (=> b!1527702 m!1410359))

(assert (=> b!1527702 m!1410359))

(assert (=> b!1527702 m!1410215))

(declare-fun m!1410417 () Bool)

(assert (=> b!1527702 m!1410417))

(assert (=> b!1527467 d!160149))

(declare-fun e!851759 () SeekEntryResult!13061)

(declare-fun b!1527784 () Bool)

(assert (=> b!1527784 (= e!851759 (Intermediate!13061 true (toIndex!0 (select (arr!49003 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun d!160151 () Bool)

(declare-fun e!851760 () Bool)

(assert (=> d!160151 e!851760))

(declare-fun c!141217 () Bool)

(declare-fun lt!661593 () SeekEntryResult!13061)

(assert (=> d!160151 (= c!141217 (and ((_ is Intermediate!13061) lt!661593) (undefined!13873 lt!661593)))))

(assert (=> d!160151 (= lt!661593 e!851759)))

(declare-fun c!141216 () Bool)

(assert (=> d!160151 (= c!141216 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!661594 () (_ BitVec 64))

(assert (=> d!160151 (= lt!661594 (select (arr!49003 a!2804) (toIndex!0 (select (arr!49003 a!2804) j!70) mask!2512)))))

(assert (=> d!160151 (validMask!0 mask!2512)))

(assert (=> d!160151 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49003 a!2804) j!70) mask!2512) (select (arr!49003 a!2804) j!70) a!2804 mask!2512) lt!661593)))

(declare-fun b!1527785 () Bool)

(declare-fun e!851758 () SeekEntryResult!13061)

(assert (=> b!1527785 (= e!851759 e!851758)))

(declare-fun c!141218 () Bool)

(assert (=> b!1527785 (= c!141218 (or (= lt!661594 (select (arr!49003 a!2804) j!70)) (= (bvadd lt!661594 lt!661594) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1527786 () Bool)

(assert (=> b!1527786 (and (bvsge (index!54641 lt!661593) #b00000000000000000000000000000000) (bvslt (index!54641 lt!661593) (size!49554 a!2804)))))

(declare-fun res!1044479 () Bool)

(assert (=> b!1527786 (= res!1044479 (= (select (arr!49003 a!2804) (index!54641 lt!661593)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!851761 () Bool)

(assert (=> b!1527786 (=> res!1044479 e!851761)))

(declare-fun b!1527787 () Bool)

(declare-fun e!851757 () Bool)

(assert (=> b!1527787 (= e!851760 e!851757)))

(declare-fun res!1044480 () Bool)

(assert (=> b!1527787 (= res!1044480 (and ((_ is Intermediate!13061) lt!661593) (not (undefined!13873 lt!661593)) (bvslt (x!136545 lt!661593) #b01111111111111111111111111111110) (bvsge (x!136545 lt!661593) #b00000000000000000000000000000000) (bvsge (x!136545 lt!661593) #b00000000000000000000000000000000)))))

(assert (=> b!1527787 (=> (not res!1044480) (not e!851757))))

(declare-fun b!1527788 () Bool)

(assert (=> b!1527788 (and (bvsge (index!54641 lt!661593) #b00000000000000000000000000000000) (bvslt (index!54641 lt!661593) (size!49554 a!2804)))))

(declare-fun res!1044478 () Bool)

(assert (=> b!1527788 (= res!1044478 (= (select (arr!49003 a!2804) (index!54641 lt!661593)) (select (arr!49003 a!2804) j!70)))))

(assert (=> b!1527788 (=> res!1044478 e!851761)))

(assert (=> b!1527788 (= e!851757 e!851761)))

(declare-fun b!1527789 () Bool)

(assert (=> b!1527789 (= e!851758 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!49003 a!2804) j!70) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512) (select (arr!49003 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1527790 () Bool)

(assert (=> b!1527790 (= e!851760 (bvsge (x!136545 lt!661593) #b01111111111111111111111111111110))))

(declare-fun b!1527791 () Bool)

(assert (=> b!1527791 (= e!851758 (Intermediate!13061 false (toIndex!0 (select (arr!49003 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1527792 () Bool)

(assert (=> b!1527792 (and (bvsge (index!54641 lt!661593) #b00000000000000000000000000000000) (bvslt (index!54641 lt!661593) (size!49554 a!2804)))))

(assert (=> b!1527792 (= e!851761 (= (select (arr!49003 a!2804) (index!54641 lt!661593)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!160151 c!141216) b!1527784))

(assert (= (and d!160151 (not c!141216)) b!1527785))

(assert (= (and b!1527785 c!141218) b!1527791))

(assert (= (and b!1527785 (not c!141218)) b!1527789))

(assert (= (and d!160151 c!141217) b!1527790))

(assert (= (and d!160151 (not c!141217)) b!1527787))

(assert (= (and b!1527787 res!1044480) b!1527788))

(assert (= (and b!1527788 (not res!1044478)) b!1527786))

(assert (= (and b!1527786 (not res!1044479)) b!1527792))

(declare-fun m!1410471 () Bool)

(assert (=> b!1527786 m!1410471))

(assert (=> b!1527789 m!1410239))

(declare-fun m!1410473 () Bool)

(assert (=> b!1527789 m!1410473))

(assert (=> b!1527789 m!1410473))

(assert (=> b!1527789 m!1410215))

(declare-fun m!1410475 () Bool)

(assert (=> b!1527789 m!1410475))

(assert (=> b!1527792 m!1410471))

(assert (=> d!160151 m!1410239))

(declare-fun m!1410477 () Bool)

(assert (=> d!160151 m!1410477))

(assert (=> d!160151 m!1410211))

(assert (=> b!1527788 m!1410471))

(assert (=> b!1527478 d!160151))

(declare-fun d!160167 () Bool)

(declare-fun lt!661604 () (_ BitVec 32))

(declare-fun lt!661603 () (_ BitVec 32))

(assert (=> d!160167 (= lt!661604 (bvmul (bvxor lt!661603 (bvlshr lt!661603 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!160167 (= lt!661603 ((_ extract 31 0) (bvand (bvxor (select (arr!49003 a!2804) j!70) (bvlshr (select (arr!49003 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!160167 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1044481 (let ((h!36921 ((_ extract 31 0) (bvand (bvxor (select (arr!49003 a!2804) j!70) (bvlshr (select (arr!49003 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136553 (bvmul (bvxor h!36921 (bvlshr h!36921 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136553 (bvlshr x!136553 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1044481 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1044481 #b00000000000000000000000000000000))))))

(assert (=> d!160167 (= (toIndex!0 (select (arr!49003 a!2804) j!70) mask!2512) (bvand (bvxor lt!661604 (bvlshr lt!661604 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1527478 d!160167))

(declare-fun d!160169 () Bool)

(assert (=> d!160169 (= (validKeyInArray!0 (select (arr!49003 a!2804) j!70)) (and (not (= (select (arr!49003 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49003 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1527476 d!160169))

(declare-fun d!160173 () Bool)

(assert (=> d!160173 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!130350 d!160173))

(declare-fun d!160181 () Bool)

(assert (=> d!160181 (= (array_inv!38284 a!2804) (bvsge (size!49554 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!130350 d!160181))

(declare-fun d!160183 () Bool)

(assert (=> d!160183 (= (validKeyInArray!0 (select (arr!49003 a!2804) i!961)) (and (not (= (select (arr!49003 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49003 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1527466 d!160183))

(declare-fun b!1527853 () Bool)

(declare-fun e!851798 () Bool)

(declare-fun e!851800 () Bool)

(assert (=> b!1527853 (= e!851798 e!851800)))

(declare-fun lt!661617 () (_ BitVec 64))

(assert (=> b!1527853 (= lt!661617 (select (arr!49003 a!2804) #b00000000000000000000000000000000))))

(declare-fun lt!661616 () Unit!50941)

(assert (=> b!1527853 (= lt!661616 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!661617 #b00000000000000000000000000000000))))

(assert (=> b!1527853 (arrayContainsKey!0 a!2804 lt!661617 #b00000000000000000000000000000000)))

(declare-fun lt!661615 () Unit!50941)

(assert (=> b!1527853 (= lt!661615 lt!661616)))

(declare-fun res!1044501 () Bool)

(assert (=> b!1527853 (= res!1044501 (= (seekEntryOrOpen!0 (select (arr!49003 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!13061 #b00000000000000000000000000000000)))))

(assert (=> b!1527853 (=> (not res!1044501) (not e!851800))))

(declare-fun d!160185 () Bool)

(declare-fun res!1044500 () Bool)

(declare-fun e!851799 () Bool)

(assert (=> d!160185 (=> res!1044500 e!851799)))

(assert (=> d!160185 (= res!1044500 (bvsge #b00000000000000000000000000000000 (size!49554 a!2804)))))

(assert (=> d!160185 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!851799)))

(declare-fun b!1527854 () Bool)

(declare-fun call!68594 () Bool)

(assert (=> b!1527854 (= e!851798 call!68594)))

(declare-fun b!1527855 () Bool)

(assert (=> b!1527855 (= e!851799 e!851798)))

(declare-fun c!141240 () Bool)

(assert (=> b!1527855 (= c!141240 (validKeyInArray!0 (select (arr!49003 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1527856 () Bool)

(assert (=> b!1527856 (= e!851800 call!68594)))

(declare-fun bm!68591 () Bool)

(assert (=> bm!68591 (= call!68594 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(assert (= (and d!160185 (not res!1044500)) b!1527855))

(assert (= (and b!1527855 c!141240) b!1527853))

(assert (= (and b!1527855 (not c!141240)) b!1527854))

(assert (= (and b!1527853 res!1044501) b!1527856))

(assert (= (or b!1527856 b!1527854) bm!68591))

(declare-fun m!1410505 () Bool)

(assert (=> b!1527853 m!1410505))

(declare-fun m!1410507 () Bool)

(assert (=> b!1527853 m!1410507))

(declare-fun m!1410509 () Bool)

(assert (=> b!1527853 m!1410509))

(assert (=> b!1527853 m!1410505))

(declare-fun m!1410511 () Bool)

(assert (=> b!1527853 m!1410511))

(assert (=> b!1527855 m!1410505))

(assert (=> b!1527855 m!1410505))

(declare-fun m!1410513 () Bool)

(assert (=> b!1527855 m!1410513))

(declare-fun m!1410515 () Bool)

(assert (=> bm!68591 m!1410515))

(assert (=> b!1527477 d!160185))

(declare-fun b!1527866 () Bool)

(declare-fun e!851808 () SeekEntryResult!13061)

(assert (=> b!1527866 (= e!851808 (Intermediate!13061 true index!487 x!534))))

(declare-fun d!160187 () Bool)

(declare-fun e!851809 () Bool)

(assert (=> d!160187 e!851809))

(declare-fun c!141245 () Bool)

(declare-fun lt!661620 () SeekEntryResult!13061)

(assert (=> d!160187 (= c!141245 (and ((_ is Intermediate!13061) lt!661620) (undefined!13873 lt!661620)))))

(assert (=> d!160187 (= lt!661620 e!851808)))

(declare-fun c!141244 () Bool)

(assert (=> d!160187 (= c!141244 (bvsge x!534 #b01111111111111111111111111111110))))

(declare-fun lt!661621 () (_ BitVec 64))

(assert (=> d!160187 (= lt!661621 (select (arr!49003 a!2804) index!487))))

(assert (=> d!160187 (validMask!0 mask!2512)))

(assert (=> d!160187 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49003 a!2804) j!70) a!2804 mask!2512) lt!661620)))

(declare-fun b!1527867 () Bool)

(declare-fun e!851807 () SeekEntryResult!13061)

(assert (=> b!1527867 (= e!851808 e!851807)))

(declare-fun c!141246 () Bool)

(assert (=> b!1527867 (= c!141246 (or (= lt!661621 (select (arr!49003 a!2804) j!70)) (= (bvadd lt!661621 lt!661621) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1527868 () Bool)

(assert (=> b!1527868 (and (bvsge (index!54641 lt!661620) #b00000000000000000000000000000000) (bvslt (index!54641 lt!661620) (size!49554 a!2804)))))

(declare-fun res!1044506 () Bool)

(assert (=> b!1527868 (= res!1044506 (= (select (arr!49003 a!2804) (index!54641 lt!661620)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!851810 () Bool)

(assert (=> b!1527868 (=> res!1044506 e!851810)))

(declare-fun b!1527869 () Bool)

(declare-fun e!851806 () Bool)

(assert (=> b!1527869 (= e!851809 e!851806)))

(declare-fun res!1044507 () Bool)

(assert (=> b!1527869 (= res!1044507 (and ((_ is Intermediate!13061) lt!661620) (not (undefined!13873 lt!661620)) (bvslt (x!136545 lt!661620) #b01111111111111111111111111111110) (bvsge (x!136545 lt!661620) #b00000000000000000000000000000000) (bvsge (x!136545 lt!661620) x!534)))))

(assert (=> b!1527869 (=> (not res!1044507) (not e!851806))))

(declare-fun b!1527870 () Bool)

(assert (=> b!1527870 (and (bvsge (index!54641 lt!661620) #b00000000000000000000000000000000) (bvslt (index!54641 lt!661620) (size!49554 a!2804)))))

(declare-fun res!1044505 () Bool)

(assert (=> b!1527870 (= res!1044505 (= (select (arr!49003 a!2804) (index!54641 lt!661620)) (select (arr!49003 a!2804) j!70)))))

(assert (=> b!1527870 (=> res!1044505 e!851810)))

(assert (=> b!1527870 (= e!851806 e!851810)))

(declare-fun b!1527871 () Bool)

(assert (=> b!1527871 (= e!851807 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 (bvadd x!534 #b00000000000000000000000000000001) mask!2512) (select (arr!49003 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1527872 () Bool)

(assert (=> b!1527872 (= e!851809 (bvsge (x!136545 lt!661620) #b01111111111111111111111111111110))))

(declare-fun b!1527873 () Bool)

(assert (=> b!1527873 (= e!851807 (Intermediate!13061 false index!487 x!534))))

(declare-fun b!1527874 () Bool)

(assert (=> b!1527874 (and (bvsge (index!54641 lt!661620) #b00000000000000000000000000000000) (bvslt (index!54641 lt!661620) (size!49554 a!2804)))))

(assert (=> b!1527874 (= e!851810 (= (select (arr!49003 a!2804) (index!54641 lt!661620)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!160187 c!141244) b!1527866))

(assert (= (and d!160187 (not c!141244)) b!1527867))

(assert (= (and b!1527867 c!141246) b!1527873))

(assert (= (and b!1527867 (not c!141246)) b!1527871))

(assert (= (and d!160187 c!141245) b!1527872))

(assert (= (and d!160187 (not c!141245)) b!1527869))

(assert (= (and b!1527869 res!1044507) b!1527870))

(assert (= (and b!1527870 (not res!1044505)) b!1527868))

(assert (= (and b!1527868 (not res!1044506)) b!1527874))

(declare-fun m!1410525 () Bool)

(assert (=> b!1527868 m!1410525))

(assert (=> b!1527871 m!1410359))

(assert (=> b!1527871 m!1410359))

(assert (=> b!1527871 m!1410215))

(declare-fun m!1410527 () Bool)

(assert (=> b!1527871 m!1410527))

(assert (=> b!1527874 m!1410525))

(assert (=> d!160187 m!1410223))

(assert (=> d!160187 m!1410211))

(assert (=> b!1527870 m!1410525))

(assert (=> b!1527475 d!160187))

(declare-fun b!1527875 () Bool)

(declare-fun e!851813 () SeekEntryResult!13061)

(assert (=> b!1527875 (= e!851813 (Intermediate!13061 true (toIndex!0 lt!661456 mask!2512) #b00000000000000000000000000000000))))

(declare-fun d!160191 () Bool)

(declare-fun e!851814 () Bool)

(assert (=> d!160191 e!851814))

(declare-fun c!141248 () Bool)

(declare-fun lt!661622 () SeekEntryResult!13061)

(assert (=> d!160191 (= c!141248 (and ((_ is Intermediate!13061) lt!661622) (undefined!13873 lt!661622)))))

(assert (=> d!160191 (= lt!661622 e!851813)))

(declare-fun c!141247 () Bool)

(assert (=> d!160191 (= c!141247 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!661623 () (_ BitVec 64))

(assert (=> d!160191 (= lt!661623 (select (arr!49003 lt!661458) (toIndex!0 lt!661456 mask!2512)))))

(assert (=> d!160191 (validMask!0 mask!2512)))

(assert (=> d!160191 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661456 mask!2512) lt!661456 lt!661458 mask!2512) lt!661622)))

(declare-fun b!1527876 () Bool)

(declare-fun e!851812 () SeekEntryResult!13061)

(assert (=> b!1527876 (= e!851813 e!851812)))

(declare-fun c!141249 () Bool)

(assert (=> b!1527876 (= c!141249 (or (= lt!661623 lt!661456) (= (bvadd lt!661623 lt!661623) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1527877 () Bool)

(assert (=> b!1527877 (and (bvsge (index!54641 lt!661622) #b00000000000000000000000000000000) (bvslt (index!54641 lt!661622) (size!49554 lt!661458)))))

(declare-fun res!1044509 () Bool)

(assert (=> b!1527877 (= res!1044509 (= (select (arr!49003 lt!661458) (index!54641 lt!661622)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!851815 () Bool)

(assert (=> b!1527877 (=> res!1044509 e!851815)))

(declare-fun b!1527878 () Bool)

(declare-fun e!851811 () Bool)

(assert (=> b!1527878 (= e!851814 e!851811)))

(declare-fun res!1044510 () Bool)

(assert (=> b!1527878 (= res!1044510 (and ((_ is Intermediate!13061) lt!661622) (not (undefined!13873 lt!661622)) (bvslt (x!136545 lt!661622) #b01111111111111111111111111111110) (bvsge (x!136545 lt!661622) #b00000000000000000000000000000000) (bvsge (x!136545 lt!661622) #b00000000000000000000000000000000)))))

(assert (=> b!1527878 (=> (not res!1044510) (not e!851811))))

(declare-fun b!1527879 () Bool)

(assert (=> b!1527879 (and (bvsge (index!54641 lt!661622) #b00000000000000000000000000000000) (bvslt (index!54641 lt!661622) (size!49554 lt!661458)))))

(declare-fun res!1044508 () Bool)

(assert (=> b!1527879 (= res!1044508 (= (select (arr!49003 lt!661458) (index!54641 lt!661622)) lt!661456))))

(assert (=> b!1527879 (=> res!1044508 e!851815)))

(assert (=> b!1527879 (= e!851811 e!851815)))

(declare-fun b!1527880 () Bool)

(assert (=> b!1527880 (= e!851812 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!661456 mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512) lt!661456 lt!661458 mask!2512))))

(declare-fun b!1527881 () Bool)

(assert (=> b!1527881 (= e!851814 (bvsge (x!136545 lt!661622) #b01111111111111111111111111111110))))

(declare-fun b!1527882 () Bool)

(assert (=> b!1527882 (= e!851812 (Intermediate!13061 false (toIndex!0 lt!661456 mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1527883 () Bool)

(assert (=> b!1527883 (and (bvsge (index!54641 lt!661622) #b00000000000000000000000000000000) (bvslt (index!54641 lt!661622) (size!49554 lt!661458)))))

(assert (=> b!1527883 (= e!851815 (= (select (arr!49003 lt!661458) (index!54641 lt!661622)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!160191 c!141247) b!1527875))

(assert (= (and d!160191 (not c!141247)) b!1527876))

(assert (= (and b!1527876 c!141249) b!1527882))

(assert (= (and b!1527876 (not c!141249)) b!1527880))

(assert (= (and d!160191 c!141248) b!1527881))

(assert (= (and d!160191 (not c!141248)) b!1527878))

(assert (= (and b!1527878 res!1044510) b!1527879))

(assert (= (and b!1527879 (not res!1044508)) b!1527877))

(assert (= (and b!1527877 (not res!1044509)) b!1527883))

(declare-fun m!1410529 () Bool)

(assert (=> b!1527877 m!1410529))

(assert (=> b!1527880 m!1410243))

(declare-fun m!1410531 () Bool)

(assert (=> b!1527880 m!1410531))

(assert (=> b!1527880 m!1410531))

(declare-fun m!1410533 () Bool)

(assert (=> b!1527880 m!1410533))

(assert (=> b!1527883 m!1410529))

(assert (=> d!160191 m!1410243))

(declare-fun m!1410535 () Bool)

(assert (=> d!160191 m!1410535))

(assert (=> d!160191 m!1410211))

(assert (=> b!1527879 m!1410529))

(assert (=> b!1527472 d!160191))

(declare-fun d!160193 () Bool)

(declare-fun lt!661625 () (_ BitVec 32))

(declare-fun lt!661624 () (_ BitVec 32))

(assert (=> d!160193 (= lt!661625 (bvmul (bvxor lt!661624 (bvlshr lt!661624 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!160193 (= lt!661624 ((_ extract 31 0) (bvand (bvxor lt!661456 (bvlshr lt!661456 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!160193 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1044481 (let ((h!36921 ((_ extract 31 0) (bvand (bvxor lt!661456 (bvlshr lt!661456 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136553 (bvmul (bvxor h!36921 (bvlshr h!36921 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136553 (bvlshr x!136553 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1044481 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1044481 #b00000000000000000000000000000000))))))

(assert (=> d!160193 (= (toIndex!0 lt!661456 mask!2512) (bvand (bvxor lt!661625 (bvlshr lt!661625 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1527472 d!160193))

(declare-fun b!1527894 () Bool)

(declare-fun e!851827 () Bool)

(declare-fun e!851825 () Bool)

(assert (=> b!1527894 (= e!851827 e!851825)))

(declare-fun c!141252 () Bool)

(assert (=> b!1527894 (= c!141252 (validKeyInArray!0 (select (arr!49003 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1527895 () Bool)

(declare-fun call!68597 () Bool)

(assert (=> b!1527895 (= e!851825 call!68597)))

(declare-fun bm!68594 () Bool)

(assert (=> bm!68594 (= call!68597 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!141252 (Cons!35469 (select (arr!49003 a!2804) #b00000000000000000000000000000000) Nil!35470) Nil!35470)))))

(declare-fun d!160195 () Bool)

(declare-fun res!1044520 () Bool)

(declare-fun e!851826 () Bool)

(assert (=> d!160195 (=> res!1044520 e!851826)))

(assert (=> d!160195 (= res!1044520 (bvsge #b00000000000000000000000000000000 (size!49554 a!2804)))))

(assert (=> d!160195 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35470) e!851826)))

(declare-fun b!1527896 () Bool)

(assert (=> b!1527896 (= e!851825 call!68597)))

(declare-fun b!1527897 () Bool)

(declare-fun e!851824 () Bool)

(declare-fun contains!10043 (List!35473 (_ BitVec 64)) Bool)

(assert (=> b!1527897 (= e!851824 (contains!10043 Nil!35470 (select (arr!49003 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1527898 () Bool)

(assert (=> b!1527898 (= e!851826 e!851827)))

(declare-fun res!1044519 () Bool)

(assert (=> b!1527898 (=> (not res!1044519) (not e!851827))))

(assert (=> b!1527898 (= res!1044519 (not e!851824))))

(declare-fun res!1044518 () Bool)

(assert (=> b!1527898 (=> (not res!1044518) (not e!851824))))

(assert (=> b!1527898 (= res!1044518 (validKeyInArray!0 (select (arr!49003 a!2804) #b00000000000000000000000000000000)))))

(assert (= (and d!160195 (not res!1044520)) b!1527898))

(assert (= (and b!1527898 res!1044518) b!1527897))

(assert (= (and b!1527898 res!1044519) b!1527894))

(assert (= (and b!1527894 c!141252) b!1527896))

(assert (= (and b!1527894 (not c!141252)) b!1527895))

(assert (= (or b!1527896 b!1527895) bm!68594))

(assert (=> b!1527894 m!1410505))

(assert (=> b!1527894 m!1410505))

(assert (=> b!1527894 m!1410513))

(assert (=> bm!68594 m!1410505))

(declare-fun m!1410537 () Bool)

(assert (=> bm!68594 m!1410537))

(assert (=> b!1527897 m!1410505))

(assert (=> b!1527897 m!1410505))

(declare-fun m!1410539 () Bool)

(assert (=> b!1527897 m!1410539))

(assert (=> b!1527898 m!1410505))

(assert (=> b!1527898 m!1410505))

(assert (=> b!1527898 m!1410513))

(assert (=> b!1527473 d!160195))

(check-sat (not d!160151) (not bm!68594) (not d!160129) (not b!1527698) (not b!1527702) (not b!1527597) (not b!1527789) (not d!160143) (not d!160149) (not bm!68580) (not b!1527685) (not b!1527853) (not d!160147) (not b!1527897) (not bm!68591) (not d!160121) (not b!1527898) (not b!1527581) (not b!1527894) (not b!1527855) (not b!1527880) (not d!160191) (not b!1527660) (not b!1527871) (not b!1527683) (not d!160187) (not d!160123))
(check-sat)
