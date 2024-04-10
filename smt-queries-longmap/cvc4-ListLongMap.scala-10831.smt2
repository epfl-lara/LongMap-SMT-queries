; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126836 () Bool)

(assert start!126836)

(declare-fun b!1489199 () Bool)

(declare-fun e!834672 () Bool)

(declare-fun e!834669 () Bool)

(assert (=> b!1489199 (= e!834672 (not e!834669))))

(declare-fun res!1012694 () Bool)

(assert (=> b!1489199 (=> res!1012694 e!834669)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99609 0))(
  ( (array!99610 (arr!48076 (Array (_ BitVec 32) (_ BitVec 64))) (size!48626 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99609)

(assert (=> b!1489199 (= res!1012694 (or (and (= (select (arr!48076 a!2862) index!646) (select (store (arr!48076 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48076 a!2862) index!646) (select (arr!48076 a!2862) j!93))) (= (select (arr!48076 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!834665 () Bool)

(assert (=> b!1489199 e!834665))

(declare-fun res!1012704 () Bool)

(assert (=> b!1489199 (=> (not res!1012704) (not e!834665))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99609 (_ BitVec 32)) Bool)

(assert (=> b!1489199 (= res!1012704 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49972 0))(
  ( (Unit!49973) )
))
(declare-fun lt!649459 () Unit!49972)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99609 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49972)

(assert (=> b!1489199 (= lt!649459 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1489200 () Bool)

(declare-fun e!834666 () Bool)

(assert (=> b!1489200 (= e!834666 e!834672)))

(declare-fun res!1012700 () Bool)

(assert (=> b!1489200 (=> (not res!1012700) (not e!834672))))

(declare-datatypes ((SeekEntryResult!12316 0))(
  ( (MissingZero!12316 (index!51656 (_ BitVec 32))) (Found!12316 (index!51657 (_ BitVec 32))) (Intermediate!12316 (undefined!13128 Bool) (index!51658 (_ BitVec 32)) (x!133252 (_ BitVec 32))) (Undefined!12316) (MissingVacant!12316 (index!51659 (_ BitVec 32))) )
))
(declare-fun lt!649456 () SeekEntryResult!12316)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1489200 (= res!1012700 (= lt!649456 (Intermediate!12316 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!649458 () (_ BitVec 64))

(declare-fun lt!649460 () array!99609)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99609 (_ BitVec 32)) SeekEntryResult!12316)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1489200 (= lt!649456 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649458 mask!2687) lt!649458 lt!649460 mask!2687))))

(assert (=> b!1489200 (= lt!649458 (select (store (arr!48076 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1489201 () Bool)

(declare-fun res!1012695 () Bool)

(assert (=> b!1489201 (=> (not res!1012695) (not e!834665))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99609 (_ BitVec 32)) SeekEntryResult!12316)

(assert (=> b!1489201 (= res!1012695 (= (seekEntryOrOpen!0 (select (arr!48076 a!2862) j!93) a!2862 mask!2687) (Found!12316 j!93)))))

(declare-fun b!1489202 () Bool)

(declare-fun res!1012688 () Bool)

(declare-fun e!834668 () Bool)

(assert (=> b!1489202 (=> (not res!1012688) (not e!834668))))

(declare-datatypes ((List!34577 0))(
  ( (Nil!34574) (Cons!34573 (h!35956 (_ BitVec 64)) (t!49271 List!34577)) )
))
(declare-fun arrayNoDuplicates!0 (array!99609 (_ BitVec 32) List!34577) Bool)

(assert (=> b!1489202 (= res!1012688 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34574))))

(declare-fun b!1489203 () Bool)

(declare-fun res!1012692 () Bool)

(assert (=> b!1489203 (=> (not res!1012692) (not e!834668))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1489203 (= res!1012692 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48626 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48626 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48626 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1489204 () Bool)

(declare-fun res!1012698 () Bool)

(assert (=> b!1489204 (=> (not res!1012698) (not e!834668))))

(assert (=> b!1489204 (= res!1012698 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1489205 () Bool)

(declare-fun res!1012693 () Bool)

(declare-fun e!834670 () Bool)

(assert (=> b!1489205 (=> res!1012693 e!834670)))

(declare-fun lt!649457 () (_ BitVec 32))

(declare-fun lt!649455 () SeekEntryResult!12316)

(assert (=> b!1489205 (= res!1012693 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649457 (select (arr!48076 a!2862) j!93) a!2862 mask!2687) lt!649455)))))

(declare-fun res!1012687 () Bool)

(assert (=> start!126836 (=> (not res!1012687) (not e!834668))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126836 (= res!1012687 (validMask!0 mask!2687))))

(assert (=> start!126836 e!834668))

(assert (=> start!126836 true))

(declare-fun array_inv!37104 (array!99609) Bool)

(assert (=> start!126836 (array_inv!37104 a!2862)))

(declare-fun b!1489206 () Bool)

(declare-fun res!1012697 () Bool)

(assert (=> b!1489206 (=> (not res!1012697) (not e!834668))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1489206 (= res!1012697 (validKeyInArray!0 (select (arr!48076 a!2862) i!1006)))))

(declare-fun b!1489207 () Bool)

(declare-fun e!834674 () Bool)

(assert (=> b!1489207 (= e!834674 (= lt!649456 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649458 lt!649460 mask!2687)))))

(declare-fun b!1489208 () Bool)

(declare-fun e!834667 () Bool)

(assert (=> b!1489208 (= e!834667 (not (= lt!649456 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649457 lt!649458 lt!649460 mask!2687))))))

(declare-fun b!1489209 () Bool)

(assert (=> b!1489209 (= e!834665 (and (or (= (select (arr!48076 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48076 a!2862) intermediateBeforeIndex!19) (select (arr!48076 a!2862) j!93))) (let ((bdg!54694 (select (store (arr!48076 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!48076 a!2862) index!646) bdg!54694) (= (select (arr!48076 a!2862) index!646) (select (arr!48076 a!2862) j!93))) (= (select (arr!48076 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!54694 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1489210 () Bool)

(declare-fun res!1012702 () Bool)

(assert (=> b!1489210 (=> (not res!1012702) (not e!834666))))

(assert (=> b!1489210 (= res!1012702 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48076 a!2862) j!93) a!2862 mask!2687) lt!649455))))

(declare-fun b!1489211 () Bool)

(declare-fun res!1012689 () Bool)

(assert (=> b!1489211 (=> (not res!1012689) (not e!834672))))

(assert (=> b!1489211 (= res!1012689 e!834674)))

(declare-fun c!137784 () Bool)

(assert (=> b!1489211 (= c!137784 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1489212 () Bool)

(assert (=> b!1489212 (= e!834670 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19) (bvslt (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!665)) (bvsub #b01111111111111111111111111111110 x!665))))))

(declare-fun b!1489213 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99609 (_ BitVec 32)) SeekEntryResult!12316)

(assert (=> b!1489213 (= e!834674 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649458 lt!649460 mask!2687) (seekEntryOrOpen!0 lt!649458 lt!649460 mask!2687)))))

(declare-fun b!1489214 () Bool)

(declare-fun e!834673 () Bool)

(assert (=> b!1489214 (= e!834673 e!834666)))

(declare-fun res!1012690 () Bool)

(assert (=> b!1489214 (=> (not res!1012690) (not e!834666))))

(assert (=> b!1489214 (= res!1012690 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48076 a!2862) j!93) mask!2687) (select (arr!48076 a!2862) j!93) a!2862 mask!2687) lt!649455))))

(assert (=> b!1489214 (= lt!649455 (Intermediate!12316 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1489215 () Bool)

(declare-fun res!1012705 () Bool)

(assert (=> b!1489215 (=> (not res!1012705) (not e!834668))))

(assert (=> b!1489215 (= res!1012705 (validKeyInArray!0 (select (arr!48076 a!2862) j!93)))))

(declare-fun b!1489216 () Bool)

(declare-fun res!1012696 () Bool)

(assert (=> b!1489216 (=> (not res!1012696) (not e!834672))))

(assert (=> b!1489216 (= res!1012696 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1489217 () Bool)

(assert (=> b!1489217 (= e!834669 e!834670)))

(declare-fun res!1012691 () Bool)

(assert (=> b!1489217 (=> res!1012691 e!834670)))

(assert (=> b!1489217 (= res!1012691 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!649457 #b00000000000000000000000000000000) (bvsge lt!649457 (size!48626 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1489217 (= lt!649457 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!649461 () SeekEntryResult!12316)

(assert (=> b!1489217 (= lt!649461 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649458 lt!649460 mask!2687))))

(assert (=> b!1489217 (= lt!649461 (seekEntryOrOpen!0 lt!649458 lt!649460 mask!2687))))

(declare-fun b!1489218 () Bool)

(declare-fun res!1012703 () Bool)

(assert (=> b!1489218 (=> res!1012703 e!834670)))

(assert (=> b!1489218 (= res!1012703 e!834667)))

(declare-fun c!137783 () Bool)

(assert (=> b!1489218 (= c!137783 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1489219 () Bool)

(assert (=> b!1489219 (= e!834668 e!834673)))

(declare-fun res!1012701 () Bool)

(assert (=> b!1489219 (=> (not res!1012701) (not e!834673))))

(assert (=> b!1489219 (= res!1012701 (= (select (store (arr!48076 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1489219 (= lt!649460 (array!99610 (store (arr!48076 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48626 a!2862)))))

(declare-fun b!1489220 () Bool)

(declare-fun res!1012699 () Bool)

(assert (=> b!1489220 (=> (not res!1012699) (not e!834668))))

(assert (=> b!1489220 (= res!1012699 (and (= (size!48626 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48626 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48626 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1489221 () Bool)

(assert (=> b!1489221 (= e!834667 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649457 intermediateAfterIndex!19 lt!649458 lt!649460 mask!2687) lt!649461)))))

(assert (= (and start!126836 res!1012687) b!1489220))

(assert (= (and b!1489220 res!1012699) b!1489206))

(assert (= (and b!1489206 res!1012697) b!1489215))

(assert (= (and b!1489215 res!1012705) b!1489204))

(assert (= (and b!1489204 res!1012698) b!1489202))

(assert (= (and b!1489202 res!1012688) b!1489203))

(assert (= (and b!1489203 res!1012692) b!1489219))

(assert (= (and b!1489219 res!1012701) b!1489214))

(assert (= (and b!1489214 res!1012690) b!1489210))

(assert (= (and b!1489210 res!1012702) b!1489200))

(assert (= (and b!1489200 res!1012700) b!1489211))

(assert (= (and b!1489211 c!137784) b!1489207))

(assert (= (and b!1489211 (not c!137784)) b!1489213))

(assert (= (and b!1489211 res!1012689) b!1489216))

(assert (= (and b!1489216 res!1012696) b!1489199))

(assert (= (and b!1489199 res!1012704) b!1489201))

(assert (= (and b!1489201 res!1012695) b!1489209))

(assert (= (and b!1489199 (not res!1012694)) b!1489217))

(assert (= (and b!1489217 (not res!1012691)) b!1489205))

(assert (= (and b!1489205 (not res!1012693)) b!1489218))

(assert (= (and b!1489218 c!137783) b!1489208))

(assert (= (and b!1489218 (not c!137783)) b!1489221))

(assert (= (and b!1489218 (not res!1012703)) b!1489212))

(declare-fun m!1373457 () Bool)

(assert (=> b!1489213 m!1373457))

(declare-fun m!1373459 () Bool)

(assert (=> b!1489213 m!1373459))

(declare-fun m!1373461 () Bool)

(assert (=> b!1489210 m!1373461))

(assert (=> b!1489210 m!1373461))

(declare-fun m!1373463 () Bool)

(assert (=> b!1489210 m!1373463))

(declare-fun m!1373465 () Bool)

(assert (=> b!1489207 m!1373465))

(declare-fun m!1373467 () Bool)

(assert (=> b!1489202 m!1373467))

(declare-fun m!1373469 () Bool)

(assert (=> b!1489199 m!1373469))

(declare-fun m!1373471 () Bool)

(assert (=> b!1489199 m!1373471))

(declare-fun m!1373473 () Bool)

(assert (=> b!1489199 m!1373473))

(declare-fun m!1373475 () Bool)

(assert (=> b!1489199 m!1373475))

(declare-fun m!1373477 () Bool)

(assert (=> b!1489199 m!1373477))

(assert (=> b!1489199 m!1373461))

(declare-fun m!1373479 () Bool)

(assert (=> b!1489204 m!1373479))

(assert (=> b!1489201 m!1373461))

(assert (=> b!1489201 m!1373461))

(declare-fun m!1373481 () Bool)

(assert (=> b!1489201 m!1373481))

(declare-fun m!1373483 () Bool)

(assert (=> b!1489221 m!1373483))

(declare-fun m!1373485 () Bool)

(assert (=> b!1489217 m!1373485))

(assert (=> b!1489217 m!1373457))

(assert (=> b!1489217 m!1373459))

(declare-fun m!1373487 () Bool)

(assert (=> b!1489200 m!1373487))

(assert (=> b!1489200 m!1373487))

(declare-fun m!1373489 () Bool)

(assert (=> b!1489200 m!1373489))

(assert (=> b!1489200 m!1373471))

(declare-fun m!1373491 () Bool)

(assert (=> b!1489200 m!1373491))

(assert (=> b!1489205 m!1373461))

(assert (=> b!1489205 m!1373461))

(declare-fun m!1373493 () Bool)

(assert (=> b!1489205 m!1373493))

(assert (=> b!1489214 m!1373461))

(assert (=> b!1489214 m!1373461))

(declare-fun m!1373495 () Bool)

(assert (=> b!1489214 m!1373495))

(assert (=> b!1489214 m!1373495))

(assert (=> b!1489214 m!1373461))

(declare-fun m!1373497 () Bool)

(assert (=> b!1489214 m!1373497))

(declare-fun m!1373499 () Bool)

(assert (=> start!126836 m!1373499))

(declare-fun m!1373501 () Bool)

(assert (=> start!126836 m!1373501))

(assert (=> b!1489209 m!1373471))

(declare-fun m!1373503 () Bool)

(assert (=> b!1489209 m!1373503))

(assert (=> b!1489209 m!1373473))

(assert (=> b!1489209 m!1373475))

(assert (=> b!1489209 m!1373461))

(assert (=> b!1489219 m!1373471))

(declare-fun m!1373505 () Bool)

(assert (=> b!1489219 m!1373505))

(declare-fun m!1373507 () Bool)

(assert (=> b!1489208 m!1373507))

(assert (=> b!1489215 m!1373461))

(assert (=> b!1489215 m!1373461))

(declare-fun m!1373509 () Bool)

(assert (=> b!1489215 m!1373509))

(declare-fun m!1373511 () Bool)

(assert (=> b!1489206 m!1373511))

(assert (=> b!1489206 m!1373511))

(declare-fun m!1373513 () Bool)

(assert (=> b!1489206 m!1373513))

(push 1)

(assert (not b!1489199))

(assert (not b!1489202))

(assert (not b!1489208))

(assert (not b!1489204))

(assert (not b!1489215))

(assert (not b!1489201))

(assert (not b!1489214))

(assert (not b!1489217))

(assert (not b!1489205))

(assert (not b!1489210))

(assert (not b!1489200))

(assert (not b!1489207))

(assert (not start!126836))

(assert (not b!1489213))

(assert (not b!1489206))

(assert (not b!1489221))

(check-sat)

(pop 1)

(push 1)

(check-sat)

