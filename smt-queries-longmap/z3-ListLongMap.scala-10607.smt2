; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124782 () Bool)

(assert start!124782)

(declare-fun b!1447515 () Bool)

(declare-fun e!815228 () Bool)

(declare-fun e!815234 () Bool)

(assert (=> b!1447515 (= e!815228 (not e!815234))))

(declare-fun res!979168 () Bool)

(assert (=> b!1447515 (=> res!979168 e!815234)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98230 0))(
  ( (array!98231 (arr!47403 (Array (_ BitVec 32) (_ BitVec 64))) (size!47953 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98230)

(assert (=> b!1447515 (= res!979168 (or (and (= (select (arr!47403 a!2862) index!646) (select (store (arr!47403 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47403 a!2862) index!646) (select (arr!47403 a!2862) j!93))) (not (= (select (arr!47403 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47403 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!815231 () Bool)

(assert (=> b!1447515 e!815231))

(declare-fun res!979174 () Bool)

(assert (=> b!1447515 (=> (not res!979174) (not e!815231))))

(declare-datatypes ((SeekEntryResult!11655 0))(
  ( (MissingZero!11655 (index!49012 (_ BitVec 32))) (Found!11655 (index!49013 (_ BitVec 32))) (Intermediate!11655 (undefined!12467 Bool) (index!49014 (_ BitVec 32)) (x!130688 (_ BitVec 32))) (Undefined!11655) (MissingVacant!11655 (index!49015 (_ BitVec 32))) )
))
(declare-fun lt!635190 () SeekEntryResult!11655)

(assert (=> b!1447515 (= res!979174 (and (= lt!635190 (Found!11655 j!93)) (or (= (select (arr!47403 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47403 a!2862) intermediateBeforeIndex!19) (select (arr!47403 a!2862) j!93)))))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98230 (_ BitVec 32)) SeekEntryResult!11655)

(assert (=> b!1447515 (= lt!635190 (seekEntryOrOpen!0 (select (arr!47403 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98230 (_ BitVec 32)) Bool)

(assert (=> b!1447515 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48806 0))(
  ( (Unit!48807) )
))
(declare-fun lt!635192 () Unit!48806)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98230 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48806)

(assert (=> b!1447515 (= lt!635192 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1447517 () Bool)

(declare-fun e!815229 () Bool)

(assert (=> b!1447517 (= e!815231 e!815229)))

(declare-fun res!979167 () Bool)

(assert (=> b!1447517 (=> res!979167 e!815229)))

(assert (=> b!1447517 (= res!979167 (or (and (= (select (arr!47403 a!2862) index!646) (select (store (arr!47403 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47403 a!2862) index!646) (select (arr!47403 a!2862) j!93))) (not (= (select (arr!47403 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1447518 () Bool)

(declare-fun res!979169 () Bool)

(declare-fun e!815226 () Bool)

(assert (=> b!1447518 (=> (not res!979169) (not e!815226))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1447518 (= res!979169 (validKeyInArray!0 (select (arr!47403 a!2862) i!1006)))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!635191 () (_ BitVec 64))

(declare-fun e!815233 () Bool)

(declare-fun lt!635195 () array!98230)

(declare-fun lt!635196 () SeekEntryResult!11655)

(declare-fun b!1447519 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98230 (_ BitVec 32)) SeekEntryResult!11655)

(assert (=> b!1447519 (= e!815233 (= lt!635196 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635191 lt!635195 mask!2687)))))

(declare-fun b!1447520 () Bool)

(declare-fun res!979170 () Bool)

(assert (=> b!1447520 (=> (not res!979170) (not e!815226))))

(declare-datatypes ((List!33904 0))(
  ( (Nil!33901) (Cons!33900 (h!35250 (_ BitVec 64)) (t!48598 List!33904)) )
))
(declare-fun arrayNoDuplicates!0 (array!98230 (_ BitVec 32) List!33904) Bool)

(assert (=> b!1447520 (= res!979170 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33901))))

(declare-fun b!1447521 () Bool)

(assert (=> b!1447521 (= e!815234 true)))

(declare-fun lt!635193 () SeekEntryResult!11655)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98230 (_ BitVec 32)) SeekEntryResult!11655)

(assert (=> b!1447521 (= lt!635193 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47403 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1447522 () Bool)

(declare-fun res!979166 () Bool)

(assert (=> b!1447522 (=> (not res!979166) (not e!815228))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1447522 (= res!979166 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1447523 () Bool)

(declare-fun res!979165 () Bool)

(declare-fun e!815232 () Bool)

(assert (=> b!1447523 (=> (not res!979165) (not e!815232))))

(declare-fun lt!635194 () SeekEntryResult!11655)

(assert (=> b!1447523 (= res!979165 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47403 a!2862) j!93) a!2862 mask!2687) lt!635194))))

(declare-fun b!1447524 () Bool)

(declare-fun e!815227 () Bool)

(assert (=> b!1447524 (= e!815227 e!815232)))

(declare-fun res!979159 () Bool)

(assert (=> b!1447524 (=> (not res!979159) (not e!815232))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1447524 (= res!979159 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47403 a!2862) j!93) mask!2687) (select (arr!47403 a!2862) j!93) a!2862 mask!2687) lt!635194))))

(assert (=> b!1447524 (= lt!635194 (Intermediate!11655 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1447525 () Bool)

(declare-fun e!815225 () Bool)

(assert (=> b!1447525 (= e!815225 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1447526 () Bool)

(declare-fun res!979162 () Bool)

(assert (=> b!1447526 (=> (not res!979162) (not e!815228))))

(assert (=> b!1447526 (= res!979162 e!815233)))

(declare-fun c!133689 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1447526 (= c!133689 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1447527 () Bool)

(assert (=> b!1447527 (= e!815229 e!815225)))

(declare-fun res!979172 () Bool)

(assert (=> b!1447527 (=> (not res!979172) (not e!815225))))

(assert (=> b!1447527 (= res!979172 (= lt!635190 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47403 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun res!979164 () Bool)

(assert (=> start!124782 (=> (not res!979164) (not e!815226))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124782 (= res!979164 (validMask!0 mask!2687))))

(assert (=> start!124782 e!815226))

(assert (=> start!124782 true))

(declare-fun array_inv!36431 (array!98230) Bool)

(assert (=> start!124782 (array_inv!36431 a!2862)))

(declare-fun b!1447516 () Bool)

(assert (=> b!1447516 (= e!815233 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635191 lt!635195 mask!2687) (seekEntryOrOpen!0 lt!635191 lt!635195 mask!2687)))))

(declare-fun b!1447528 () Bool)

(declare-fun res!979171 () Bool)

(assert (=> b!1447528 (=> (not res!979171) (not e!815226))))

(assert (=> b!1447528 (= res!979171 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1447529 () Bool)

(declare-fun res!979160 () Bool)

(assert (=> b!1447529 (=> (not res!979160) (not e!815226))))

(assert (=> b!1447529 (= res!979160 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47953 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47953 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47953 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1447530 () Bool)

(assert (=> b!1447530 (= e!815232 e!815228)))

(declare-fun res!979163 () Bool)

(assert (=> b!1447530 (=> (not res!979163) (not e!815228))))

(assert (=> b!1447530 (= res!979163 (= lt!635196 (Intermediate!11655 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1447530 (= lt!635196 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635191 mask!2687) lt!635191 lt!635195 mask!2687))))

(assert (=> b!1447530 (= lt!635191 (select (store (arr!47403 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1447531 () Bool)

(declare-fun res!979173 () Bool)

(assert (=> b!1447531 (=> (not res!979173) (not e!815226))))

(assert (=> b!1447531 (= res!979173 (validKeyInArray!0 (select (arr!47403 a!2862) j!93)))))

(declare-fun b!1447532 () Bool)

(declare-fun res!979161 () Bool)

(assert (=> b!1447532 (=> (not res!979161) (not e!815226))))

(assert (=> b!1447532 (= res!979161 (and (= (size!47953 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47953 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47953 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1447533 () Bool)

(assert (=> b!1447533 (= e!815226 e!815227)))

(declare-fun res!979158 () Bool)

(assert (=> b!1447533 (=> (not res!979158) (not e!815227))))

(assert (=> b!1447533 (= res!979158 (= (select (store (arr!47403 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1447533 (= lt!635195 (array!98231 (store (arr!47403 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47953 a!2862)))))

(assert (= (and start!124782 res!979164) b!1447532))

(assert (= (and b!1447532 res!979161) b!1447518))

(assert (= (and b!1447518 res!979169) b!1447531))

(assert (= (and b!1447531 res!979173) b!1447528))

(assert (= (and b!1447528 res!979171) b!1447520))

(assert (= (and b!1447520 res!979170) b!1447529))

(assert (= (and b!1447529 res!979160) b!1447533))

(assert (= (and b!1447533 res!979158) b!1447524))

(assert (= (and b!1447524 res!979159) b!1447523))

(assert (= (and b!1447523 res!979165) b!1447530))

(assert (= (and b!1447530 res!979163) b!1447526))

(assert (= (and b!1447526 c!133689) b!1447519))

(assert (= (and b!1447526 (not c!133689)) b!1447516))

(assert (= (and b!1447526 res!979162) b!1447522))

(assert (= (and b!1447522 res!979166) b!1447515))

(assert (= (and b!1447515 res!979174) b!1447517))

(assert (= (and b!1447517 (not res!979167)) b!1447527))

(assert (= (and b!1447527 res!979172) b!1447525))

(assert (= (and b!1447515 (not res!979168)) b!1447521))

(declare-fun m!1336327 () Bool)

(assert (=> b!1447531 m!1336327))

(assert (=> b!1447531 m!1336327))

(declare-fun m!1336329 () Bool)

(assert (=> b!1447531 m!1336329))

(assert (=> b!1447523 m!1336327))

(assert (=> b!1447523 m!1336327))

(declare-fun m!1336331 () Bool)

(assert (=> b!1447523 m!1336331))

(declare-fun m!1336333 () Bool)

(assert (=> start!124782 m!1336333))

(declare-fun m!1336335 () Bool)

(assert (=> start!124782 m!1336335))

(declare-fun m!1336337 () Bool)

(assert (=> b!1447530 m!1336337))

(assert (=> b!1447530 m!1336337))

(declare-fun m!1336339 () Bool)

(assert (=> b!1447530 m!1336339))

(declare-fun m!1336341 () Bool)

(assert (=> b!1447530 m!1336341))

(declare-fun m!1336343 () Bool)

(assert (=> b!1447530 m!1336343))

(declare-fun m!1336345 () Bool)

(assert (=> b!1447520 m!1336345))

(assert (=> b!1447521 m!1336327))

(assert (=> b!1447521 m!1336327))

(declare-fun m!1336347 () Bool)

(assert (=> b!1447521 m!1336347))

(declare-fun m!1336349 () Bool)

(assert (=> b!1447515 m!1336349))

(assert (=> b!1447515 m!1336341))

(declare-fun m!1336351 () Bool)

(assert (=> b!1447515 m!1336351))

(declare-fun m!1336353 () Bool)

(assert (=> b!1447515 m!1336353))

(declare-fun m!1336355 () Bool)

(assert (=> b!1447515 m!1336355))

(assert (=> b!1447515 m!1336327))

(declare-fun m!1336357 () Bool)

(assert (=> b!1447515 m!1336357))

(declare-fun m!1336359 () Bool)

(assert (=> b!1447515 m!1336359))

(assert (=> b!1447515 m!1336327))

(assert (=> b!1447527 m!1336327))

(assert (=> b!1447527 m!1336327))

(declare-fun m!1336361 () Bool)

(assert (=> b!1447527 m!1336361))

(assert (=> b!1447517 m!1336355))

(assert (=> b!1447517 m!1336341))

(assert (=> b!1447517 m!1336353))

(assert (=> b!1447517 m!1336327))

(declare-fun m!1336363 () Bool)

(assert (=> b!1447518 m!1336363))

(assert (=> b!1447518 m!1336363))

(declare-fun m!1336365 () Bool)

(assert (=> b!1447518 m!1336365))

(declare-fun m!1336367 () Bool)

(assert (=> b!1447528 m!1336367))

(declare-fun m!1336369 () Bool)

(assert (=> b!1447519 m!1336369))

(assert (=> b!1447524 m!1336327))

(assert (=> b!1447524 m!1336327))

(declare-fun m!1336371 () Bool)

(assert (=> b!1447524 m!1336371))

(assert (=> b!1447524 m!1336371))

(assert (=> b!1447524 m!1336327))

(declare-fun m!1336373 () Bool)

(assert (=> b!1447524 m!1336373))

(declare-fun m!1336375 () Bool)

(assert (=> b!1447516 m!1336375))

(declare-fun m!1336377 () Bool)

(assert (=> b!1447516 m!1336377))

(assert (=> b!1447533 m!1336341))

(declare-fun m!1336379 () Bool)

(assert (=> b!1447533 m!1336379))

(check-sat (not start!124782) (not b!1447515) (not b!1447518) (not b!1447521) (not b!1447519) (not b!1447520) (not b!1447530) (not b!1447516) (not b!1447528) (not b!1447531) (not b!1447524) (not b!1447523) (not b!1447527))
(check-sat)
