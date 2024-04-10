; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126530 () Bool)

(assert start!126530)

(declare-fun b!1484486 () Bool)

(declare-fun e!832303 () Bool)

(assert (=> b!1484486 (= e!832303 true)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!647775 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1484486 (= lt!647775 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1484487 () Bool)

(declare-fun res!1009275 () Bool)

(declare-fun e!832300 () Bool)

(assert (=> b!1484487 (=> (not res!1009275) (not e!832300))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-datatypes ((array!99492 0))(
  ( (array!99493 (arr!48022 (Array (_ BitVec 32) (_ BitVec 64))) (size!48572 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99492)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1484487 (= res!1009275 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48572 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48572 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48572 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1484488 () Bool)

(declare-fun res!1009260 () Bool)

(declare-fun e!832302 () Bool)

(assert (=> b!1484488 (=> (not res!1009260) (not e!832302))))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12262 0))(
  ( (MissingZero!12262 (index!51440 (_ BitVec 32))) (Found!12262 (index!51441 (_ BitVec 32))) (Intermediate!12262 (undefined!13074 Bool) (index!51442 (_ BitVec 32)) (x!133018 (_ BitVec 32))) (Undefined!12262) (MissingVacant!12262 (index!51443 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99492 (_ BitVec 32)) SeekEntryResult!12262)

(assert (=> b!1484488 (= res!1009260 (= (seekEntryOrOpen!0 (select (arr!48022 a!2862) j!93) a!2862 mask!2687) (Found!12262 j!93)))))

(declare-fun b!1484489 () Bool)

(declare-fun e!832301 () Bool)

(assert (=> b!1484489 (= e!832300 e!832301)))

(declare-fun res!1009258 () Bool)

(assert (=> b!1484489 (=> (not res!1009258) (not e!832301))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1484489 (= res!1009258 (= (select (store (arr!48022 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!647781 () array!99492)

(assert (=> b!1484489 (= lt!647781 (array!99493 (store (arr!48022 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48572 a!2862)))))

(declare-fun b!1484490 () Bool)

(declare-fun e!832305 () Bool)

(declare-fun e!832306 () Bool)

(assert (=> b!1484490 (= e!832305 e!832306)))

(declare-fun res!1009263 () Bool)

(assert (=> b!1484490 (=> (not res!1009263) (not e!832306))))

(declare-fun lt!647779 () (_ BitVec 64))

(assert (=> b!1484490 (= res!1009263 (and (= index!646 intermediateAfterIndex!19) (= lt!647779 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1484491 () Bool)

(declare-fun res!1009266 () Bool)

(assert (=> b!1484491 (=> (not res!1009266) (not e!832300))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1484491 (= res!1009266 (validKeyInArray!0 (select (arr!48022 a!2862) j!93)))))

(declare-fun b!1484492 () Bool)

(declare-fun res!1009261 () Bool)

(declare-fun e!832298 () Bool)

(assert (=> b!1484492 (=> (not res!1009261) (not e!832298))))

(declare-fun e!832307 () Bool)

(assert (=> b!1484492 (= res!1009261 e!832307)))

(declare-fun c!137136 () Bool)

(assert (=> b!1484492 (= c!137136 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1484493 () Bool)

(declare-fun e!832304 () Bool)

(assert (=> b!1484493 (= e!832304 e!832298)))

(declare-fun res!1009262 () Bool)

(assert (=> b!1484493 (=> (not res!1009262) (not e!832298))))

(declare-fun lt!647778 () SeekEntryResult!12262)

(assert (=> b!1484493 (= res!1009262 (= lt!647778 (Intermediate!12262 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!647776 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99492 (_ BitVec 32)) SeekEntryResult!12262)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1484493 (= lt!647778 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647776 mask!2687) lt!647776 lt!647781 mask!2687))))

(assert (=> b!1484493 (= lt!647776 (select (store (arr!48022 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1484494 () Bool)

(declare-fun res!1009271 () Bool)

(assert (=> b!1484494 (=> (not res!1009271) (not e!832304))))

(declare-fun lt!647777 () SeekEntryResult!12262)

(assert (=> b!1484494 (= res!1009271 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48022 a!2862) j!93) a!2862 mask!2687) lt!647777))))

(declare-fun b!1484495 () Bool)

(declare-fun res!1009268 () Bool)

(assert (=> b!1484495 (=> (not res!1009268) (not e!832300))))

(assert (=> b!1484495 (= res!1009268 (and (= (size!48572 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48572 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48572 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1484496 () Bool)

(assert (=> b!1484496 (= e!832301 e!832304)))

(declare-fun res!1009270 () Bool)

(assert (=> b!1484496 (=> (not res!1009270) (not e!832304))))

(assert (=> b!1484496 (= res!1009270 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48022 a!2862) j!93) mask!2687) (select (arr!48022 a!2862) j!93) a!2862 mask!2687) lt!647777))))

(assert (=> b!1484496 (= lt!647777 (Intermediate!12262 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1484497 () Bool)

(assert (=> b!1484497 (= e!832298 (not e!832303))))

(declare-fun res!1009259 () Bool)

(assert (=> b!1484497 (=> res!1009259 e!832303)))

(assert (=> b!1484497 (= res!1009259 (or (and (= (select (arr!48022 a!2862) index!646) (select (store (arr!48022 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48022 a!2862) index!646) (select (arr!48022 a!2862) j!93))) (= (select (arr!48022 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1484497 e!832302))

(declare-fun res!1009267 () Bool)

(assert (=> b!1484497 (=> (not res!1009267) (not e!832302))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99492 (_ BitVec 32)) Bool)

(assert (=> b!1484497 (= res!1009267 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49864 0))(
  ( (Unit!49865) )
))
(declare-fun lt!647780 () Unit!49864)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99492 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49864)

(assert (=> b!1484497 (= lt!647780 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1484498 () Bool)

(declare-fun res!1009264 () Bool)

(assert (=> b!1484498 (=> (not res!1009264) (not e!832298))))

(assert (=> b!1484498 (= res!1009264 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1484499 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99492 (_ BitVec 32)) SeekEntryResult!12262)

(assert (=> b!1484499 (= e!832306 (= (seekEntryOrOpen!0 lt!647776 lt!647781 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647776 lt!647781 mask!2687)))))

(declare-fun b!1484485 () Bool)

(declare-fun res!1009269 () Bool)

(assert (=> b!1484485 (=> (not res!1009269) (not e!832300))))

(declare-datatypes ((List!34523 0))(
  ( (Nil!34520) (Cons!34519 (h!35893 (_ BitVec 64)) (t!49217 List!34523)) )
))
(declare-fun arrayNoDuplicates!0 (array!99492 (_ BitVec 32) List!34523) Bool)

(assert (=> b!1484485 (= res!1009269 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34520))))

(declare-fun res!1009274 () Bool)

(assert (=> start!126530 (=> (not res!1009274) (not e!832300))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126530 (= res!1009274 (validMask!0 mask!2687))))

(assert (=> start!126530 e!832300))

(assert (=> start!126530 true))

(declare-fun array_inv!37050 (array!99492) Bool)

(assert (=> start!126530 (array_inv!37050 a!2862)))

(declare-fun b!1484500 () Bool)

(declare-fun res!1009273 () Bool)

(assert (=> b!1484500 (=> (not res!1009273) (not e!832302))))

(assert (=> b!1484500 (= res!1009273 (or (= (select (arr!48022 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48022 a!2862) intermediateBeforeIndex!19) (select (arr!48022 a!2862) j!93))))))

(declare-fun b!1484501 () Bool)

(declare-fun res!1009265 () Bool)

(assert (=> b!1484501 (=> (not res!1009265) (not e!832300))))

(assert (=> b!1484501 (= res!1009265 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1484502 () Bool)

(declare-fun res!1009272 () Bool)

(assert (=> b!1484502 (=> (not res!1009272) (not e!832300))))

(assert (=> b!1484502 (= res!1009272 (validKeyInArray!0 (select (arr!48022 a!2862) i!1006)))))

(declare-fun b!1484503 () Bool)

(assert (=> b!1484503 (= e!832302 e!832305)))

(declare-fun res!1009276 () Bool)

(assert (=> b!1484503 (=> res!1009276 e!832305)))

(assert (=> b!1484503 (= res!1009276 (or (and (= (select (arr!48022 a!2862) index!646) lt!647779) (= (select (arr!48022 a!2862) index!646) (select (arr!48022 a!2862) j!93))) (= (select (arr!48022 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1484503 (= lt!647779 (select (store (arr!48022 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1484504 () Bool)

(assert (=> b!1484504 (= e!832307 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647776 lt!647781 mask!2687) (seekEntryOrOpen!0 lt!647776 lt!647781 mask!2687)))))

(declare-fun b!1484505 () Bool)

(assert (=> b!1484505 (= e!832307 (= lt!647778 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647776 lt!647781 mask!2687)))))

(assert (= (and start!126530 res!1009274) b!1484495))

(assert (= (and b!1484495 res!1009268) b!1484502))

(assert (= (and b!1484502 res!1009272) b!1484491))

(assert (= (and b!1484491 res!1009266) b!1484501))

(assert (= (and b!1484501 res!1009265) b!1484485))

(assert (= (and b!1484485 res!1009269) b!1484487))

(assert (= (and b!1484487 res!1009275) b!1484489))

(assert (= (and b!1484489 res!1009258) b!1484496))

(assert (= (and b!1484496 res!1009270) b!1484494))

(assert (= (and b!1484494 res!1009271) b!1484493))

(assert (= (and b!1484493 res!1009262) b!1484492))

(assert (= (and b!1484492 c!137136) b!1484505))

(assert (= (and b!1484492 (not c!137136)) b!1484504))

(assert (= (and b!1484492 res!1009261) b!1484498))

(assert (= (and b!1484498 res!1009264) b!1484497))

(assert (= (and b!1484497 res!1009267) b!1484488))

(assert (= (and b!1484488 res!1009260) b!1484500))

(assert (= (and b!1484500 res!1009273) b!1484503))

(assert (= (and b!1484503 (not res!1009276)) b!1484490))

(assert (= (and b!1484490 res!1009263) b!1484499))

(assert (= (and b!1484497 (not res!1009259)) b!1484486))

(declare-fun m!1369785 () Bool)

(assert (=> b!1484505 m!1369785))

(declare-fun m!1369787 () Bool)

(assert (=> b!1484486 m!1369787))

(declare-fun m!1369789 () Bool)

(assert (=> b!1484497 m!1369789))

(declare-fun m!1369791 () Bool)

(assert (=> b!1484497 m!1369791))

(declare-fun m!1369793 () Bool)

(assert (=> b!1484497 m!1369793))

(declare-fun m!1369795 () Bool)

(assert (=> b!1484497 m!1369795))

(declare-fun m!1369797 () Bool)

(assert (=> b!1484497 m!1369797))

(declare-fun m!1369799 () Bool)

(assert (=> b!1484497 m!1369799))

(declare-fun m!1369801 () Bool)

(assert (=> b!1484502 m!1369801))

(assert (=> b!1484502 m!1369801))

(declare-fun m!1369803 () Bool)

(assert (=> b!1484502 m!1369803))

(declare-fun m!1369805 () Bool)

(assert (=> b!1484493 m!1369805))

(assert (=> b!1484493 m!1369805))

(declare-fun m!1369807 () Bool)

(assert (=> b!1484493 m!1369807))

(assert (=> b!1484493 m!1369791))

(declare-fun m!1369809 () Bool)

(assert (=> b!1484493 m!1369809))

(assert (=> b!1484503 m!1369795))

(assert (=> b!1484503 m!1369799))

(assert (=> b!1484503 m!1369791))

(assert (=> b!1484503 m!1369793))

(declare-fun m!1369811 () Bool)

(assert (=> start!126530 m!1369811))

(declare-fun m!1369813 () Bool)

(assert (=> start!126530 m!1369813))

(assert (=> b!1484489 m!1369791))

(declare-fun m!1369815 () Bool)

(assert (=> b!1484489 m!1369815))

(assert (=> b!1484494 m!1369799))

(assert (=> b!1484494 m!1369799))

(declare-fun m!1369817 () Bool)

(assert (=> b!1484494 m!1369817))

(declare-fun m!1369819 () Bool)

(assert (=> b!1484485 m!1369819))

(declare-fun m!1369821 () Bool)

(assert (=> b!1484501 m!1369821))

(declare-fun m!1369823 () Bool)

(assert (=> b!1484499 m!1369823))

(declare-fun m!1369825 () Bool)

(assert (=> b!1484499 m!1369825))

(declare-fun m!1369827 () Bool)

(assert (=> b!1484500 m!1369827))

(assert (=> b!1484500 m!1369799))

(assert (=> b!1484491 m!1369799))

(assert (=> b!1484491 m!1369799))

(declare-fun m!1369829 () Bool)

(assert (=> b!1484491 m!1369829))

(assert (=> b!1484488 m!1369799))

(assert (=> b!1484488 m!1369799))

(declare-fun m!1369831 () Bool)

(assert (=> b!1484488 m!1369831))

(assert (=> b!1484504 m!1369825))

(assert (=> b!1484504 m!1369823))

(assert (=> b!1484496 m!1369799))

(assert (=> b!1484496 m!1369799))

(declare-fun m!1369833 () Bool)

(assert (=> b!1484496 m!1369833))

(assert (=> b!1484496 m!1369833))

(assert (=> b!1484496 m!1369799))

(declare-fun m!1369835 () Bool)

(assert (=> b!1484496 m!1369835))

(push 1)

