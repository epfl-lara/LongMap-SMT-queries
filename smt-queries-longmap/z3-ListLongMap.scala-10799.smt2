; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126332 () Bool)

(assert start!126332)

(declare-fun b!1481198 () Bool)

(declare-fun res!1006743 () Bool)

(declare-fun e!830701 () Bool)

(assert (=> b!1481198 (=> (not res!1006743) (not e!830701))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99349 0))(
  ( (array!99350 (arr!47953 (Array (_ BitVec 32) (_ BitVec 64))) (size!48505 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99349)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1481198 (= res!1006743 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48505 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48505 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48505 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!1006739 () Bool)

(assert (=> start!126332 (=> (not res!1006739) (not e!830701))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126332 (= res!1006739 (validMask!0 mask!2687))))

(assert (=> start!126332 e!830701))

(assert (=> start!126332 true))

(declare-fun array_inv!37186 (array!99349) Bool)

(assert (=> start!126332 (array_inv!37186 a!2862)))

(declare-fun b!1481199 () Bool)

(declare-fun res!1006747 () Bool)

(declare-fun e!830704 () Bool)

(assert (=> b!1481199 (=> (not res!1006747) (not e!830704))))

(declare-fun e!830705 () Bool)

(assert (=> b!1481199 (= res!1006747 e!830705)))

(declare-fun c!136756 () Bool)

(assert (=> b!1481199 (= c!136756 (bvsle x!665 intermediateAfterX!19))))

(declare-datatypes ((SeekEntryResult!12218 0))(
  ( (MissingZero!12218 (index!51264 (_ BitVec 32))) (Found!12218 (index!51265 (_ BitVec 32))) (Intermediate!12218 (undefined!13030 Bool) (index!51266 (_ BitVec 32)) (x!132846 (_ BitVec 32))) (Undefined!12218) (MissingVacant!12218 (index!51267 (_ BitVec 32))) )
))
(declare-fun lt!646514 () SeekEntryResult!12218)

(declare-fun lt!646510 () array!99349)

(declare-fun b!1481200 () Bool)

(declare-fun lt!646513 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99349 (_ BitVec 32)) SeekEntryResult!12218)

(assert (=> b!1481200 (= e!830705 (= lt!646514 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646513 lt!646510 mask!2687)))))

(declare-fun b!1481201 () Bool)

(declare-fun res!1006736 () Bool)

(assert (=> b!1481201 (=> (not res!1006736) (not e!830701))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99349 (_ BitVec 32)) Bool)

(assert (=> b!1481201 (= res!1006736 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1481202 () Bool)

(declare-fun res!1006734 () Bool)

(assert (=> b!1481202 (=> (not res!1006734) (not e!830701))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1481202 (= res!1006734 (validKeyInArray!0 (select (arr!47953 a!2862) i!1006)))))

(declare-fun b!1481203 () Bool)

(declare-fun res!1006742 () Bool)

(assert (=> b!1481203 (=> (not res!1006742) (not e!830701))))

(declare-datatypes ((List!34532 0))(
  ( (Nil!34529) (Cons!34528 (h!35899 (_ BitVec 64)) (t!49218 List!34532)) )
))
(declare-fun arrayNoDuplicates!0 (array!99349 (_ BitVec 32) List!34532) Bool)

(assert (=> b!1481203 (= res!1006742 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34529))))

(declare-fun b!1481204 () Bool)

(declare-fun e!830699 () Bool)

(assert (=> b!1481204 (= e!830701 e!830699)))

(declare-fun res!1006741 () Bool)

(assert (=> b!1481204 (=> (not res!1006741) (not e!830699))))

(assert (=> b!1481204 (= res!1006741 (= (select (store (arr!47953 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1481204 (= lt!646510 (array!99350 (store (arr!47953 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48505 a!2862)))))

(declare-fun b!1481205 () Bool)

(declare-fun res!1006740 () Bool)

(declare-fun e!830700 () Bool)

(assert (=> b!1481205 (=> (not res!1006740) (not e!830700))))

(declare-fun lt!646511 () SeekEntryResult!12218)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1481205 (= res!1006740 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47953 a!2862) j!93) a!2862 mask!2687) lt!646511))))

(declare-fun b!1481206 () Bool)

(declare-fun res!1006733 () Bool)

(declare-fun e!830702 () Bool)

(assert (=> b!1481206 (=> (not res!1006733) (not e!830702))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99349 (_ BitVec 32)) SeekEntryResult!12218)

(assert (=> b!1481206 (= res!1006733 (= (seekEntryOrOpen!0 (select (arr!47953 a!2862) j!93) a!2862 mask!2687) (Found!12218 j!93)))))

(declare-fun b!1481207 () Bool)

(declare-fun res!1006744 () Bool)

(assert (=> b!1481207 (=> (not res!1006744) (not e!830701))))

(assert (=> b!1481207 (= res!1006744 (validKeyInArray!0 (select (arr!47953 a!2862) j!93)))))

(declare-fun b!1481208 () Bool)

(declare-fun res!1006746 () Bool)

(assert (=> b!1481208 (=> (not res!1006746) (not e!830704))))

(assert (=> b!1481208 (= res!1006746 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1481209 () Bool)

(assert (=> b!1481209 (= e!830700 e!830704)))

(declare-fun res!1006738 () Bool)

(assert (=> b!1481209 (=> (not res!1006738) (not e!830704))))

(assert (=> b!1481209 (= res!1006738 (= lt!646514 (Intermediate!12218 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1481209 (= lt!646514 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646513 mask!2687) lt!646513 lt!646510 mask!2687))))

(assert (=> b!1481209 (= lt!646513 (select (store (arr!47953 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1481210 () Bool)

(declare-fun res!1006735 () Bool)

(assert (=> b!1481210 (=> (not res!1006735) (not e!830701))))

(assert (=> b!1481210 (= res!1006735 (and (= (size!48505 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48505 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48505 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1481211 () Bool)

(assert (=> b!1481211 (= e!830699 e!830700)))

(declare-fun res!1006745 () Bool)

(assert (=> b!1481211 (=> (not res!1006745) (not e!830700))))

(assert (=> b!1481211 (= res!1006745 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47953 a!2862) j!93) mask!2687) (select (arr!47953 a!2862) j!93) a!2862 mask!2687) lt!646511))))

(assert (=> b!1481211 (= lt!646511 (Intermediate!12218 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1481212 () Bool)

(assert (=> b!1481212 (= e!830704 (not true))))

(assert (=> b!1481212 e!830702))

(declare-fun res!1006737 () Bool)

(assert (=> b!1481212 (=> (not res!1006737) (not e!830702))))

(assert (=> b!1481212 (= res!1006737 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49617 0))(
  ( (Unit!49618) )
))
(declare-fun lt!646512 () Unit!49617)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99349 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49617)

(assert (=> b!1481212 (= lt!646512 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1481213 () Bool)

(assert (=> b!1481213 (= e!830702 (and (or (= (select (arr!47953 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47953 a!2862) intermediateBeforeIndex!19) (select (arr!47953 a!2862) j!93))) (or (and (= (select (arr!47953 a!2862) index!646) (select (store (arr!47953 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47953 a!2862) index!646) (select (arr!47953 a!2862) j!93))) (= (select (arr!47953 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47953 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1481214 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99349 (_ BitVec 32)) SeekEntryResult!12218)

(assert (=> b!1481214 (= e!830705 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646513 lt!646510 mask!2687) (seekEntryOrOpen!0 lt!646513 lt!646510 mask!2687)))))

(assert (= (and start!126332 res!1006739) b!1481210))

(assert (= (and b!1481210 res!1006735) b!1481202))

(assert (= (and b!1481202 res!1006734) b!1481207))

(assert (= (and b!1481207 res!1006744) b!1481201))

(assert (= (and b!1481201 res!1006736) b!1481203))

(assert (= (and b!1481203 res!1006742) b!1481198))

(assert (= (and b!1481198 res!1006743) b!1481204))

(assert (= (and b!1481204 res!1006741) b!1481211))

(assert (= (and b!1481211 res!1006745) b!1481205))

(assert (= (and b!1481205 res!1006740) b!1481209))

(assert (= (and b!1481209 res!1006738) b!1481199))

(assert (= (and b!1481199 c!136756) b!1481200))

(assert (= (and b!1481199 (not c!136756)) b!1481214))

(assert (= (and b!1481199 res!1006747) b!1481208))

(assert (= (and b!1481208 res!1006746) b!1481212))

(assert (= (and b!1481212 res!1006737) b!1481206))

(assert (= (and b!1481206 res!1006733) b!1481213))

(declare-fun m!1366401 () Bool)

(assert (=> b!1481206 m!1366401))

(assert (=> b!1481206 m!1366401))

(declare-fun m!1366403 () Bool)

(assert (=> b!1481206 m!1366403))

(declare-fun m!1366405 () Bool)

(assert (=> b!1481213 m!1366405))

(declare-fun m!1366407 () Bool)

(assert (=> b!1481213 m!1366407))

(declare-fun m!1366409 () Bool)

(assert (=> b!1481213 m!1366409))

(declare-fun m!1366411 () Bool)

(assert (=> b!1481213 m!1366411))

(assert (=> b!1481213 m!1366401))

(assert (=> b!1481205 m!1366401))

(assert (=> b!1481205 m!1366401))

(declare-fun m!1366413 () Bool)

(assert (=> b!1481205 m!1366413))

(assert (=> b!1481207 m!1366401))

(assert (=> b!1481207 m!1366401))

(declare-fun m!1366415 () Bool)

(assert (=> b!1481207 m!1366415))

(declare-fun m!1366417 () Bool)

(assert (=> b!1481201 m!1366417))

(declare-fun m!1366419 () Bool)

(assert (=> b!1481212 m!1366419))

(declare-fun m!1366421 () Bool)

(assert (=> b!1481212 m!1366421))

(declare-fun m!1366423 () Bool)

(assert (=> b!1481202 m!1366423))

(assert (=> b!1481202 m!1366423))

(declare-fun m!1366425 () Bool)

(assert (=> b!1481202 m!1366425))

(declare-fun m!1366427 () Bool)

(assert (=> b!1481200 m!1366427))

(declare-fun m!1366429 () Bool)

(assert (=> start!126332 m!1366429))

(declare-fun m!1366431 () Bool)

(assert (=> start!126332 m!1366431))

(assert (=> b!1481204 m!1366405))

(declare-fun m!1366433 () Bool)

(assert (=> b!1481204 m!1366433))

(declare-fun m!1366435 () Bool)

(assert (=> b!1481214 m!1366435))

(declare-fun m!1366437 () Bool)

(assert (=> b!1481214 m!1366437))

(assert (=> b!1481211 m!1366401))

(assert (=> b!1481211 m!1366401))

(declare-fun m!1366439 () Bool)

(assert (=> b!1481211 m!1366439))

(assert (=> b!1481211 m!1366439))

(assert (=> b!1481211 m!1366401))

(declare-fun m!1366441 () Bool)

(assert (=> b!1481211 m!1366441))

(declare-fun m!1366443 () Bool)

(assert (=> b!1481203 m!1366443))

(declare-fun m!1366445 () Bool)

(assert (=> b!1481209 m!1366445))

(assert (=> b!1481209 m!1366445))

(declare-fun m!1366447 () Bool)

(assert (=> b!1481209 m!1366447))

(assert (=> b!1481209 m!1366405))

(declare-fun m!1366449 () Bool)

(assert (=> b!1481209 m!1366449))

(check-sat (not b!1481202) (not b!1481211) (not b!1481201) (not b!1481205) (not b!1481214) (not b!1481200) (not start!126332) (not b!1481212) (not b!1481207) (not b!1481206) (not b!1481203) (not b!1481209))
(check-sat)
