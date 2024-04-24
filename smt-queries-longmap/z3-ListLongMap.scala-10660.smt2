; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125316 () Bool)

(assert start!125316)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1458205 () Bool)

(declare-fun lt!638959 () (_ BitVec 64))

(declare-fun e!820474 () Bool)

(declare-fun lt!638956 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11763 0))(
  ( (MissingZero!11763 (index!49444 (_ BitVec 32))) (Found!11763 (index!49445 (_ BitVec 32))) (Intermediate!11763 (undefined!12575 Bool) (index!49446 (_ BitVec 32)) (x!131244 (_ BitVec 32))) (Undefined!11763) (MissingVacant!11763 (index!49447 (_ BitVec 32))) )
))
(declare-fun lt!638953 () SeekEntryResult!11763)

(declare-datatypes ((array!98659 0))(
  ( (array!98660 (arr!47614 (Array (_ BitVec 32) (_ BitVec 64))) (size!48165 (_ BitVec 32))) )
))
(declare-fun lt!638955 () array!98659)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98659 (_ BitVec 32)) SeekEntryResult!11763)

(assert (=> b!1458205 (= e!820474 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638956 intermediateAfterIndex!19 lt!638959 lt!638955 mask!2687) lt!638953)))))

(declare-fun e!820478 () Bool)

(declare-fun b!1458206 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!638954 () SeekEntryResult!11763)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98659 (_ BitVec 32)) SeekEntryResult!11763)

(assert (=> b!1458206 (= e!820478 (= lt!638954 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638959 lt!638955 mask!2687)))))

(declare-fun b!1458207 () Bool)

(declare-fun e!820476 () Bool)

(declare-fun e!820479 () Bool)

(assert (=> b!1458207 (= e!820476 e!820479)))

(declare-fun res!987787 () Bool)

(assert (=> b!1458207 (=> (not res!987787) (not e!820479))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1458207 (= res!987787 (= lt!638954 (Intermediate!11763 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1458207 (= lt!638954 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638959 mask!2687) lt!638959 lt!638955 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!98659)

(assert (=> b!1458207 (= lt!638959 (select (store (arr!47614 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1458208 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98659 (_ BitVec 32)) SeekEntryResult!11763)

(assert (=> b!1458208 (= e!820478 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638959 lt!638955 mask!2687) (seekEntryOrOpen!0 lt!638959 lt!638955 mask!2687)))))

(declare-fun b!1458209 () Bool)

(declare-fun e!820470 () Bool)

(assert (=> b!1458209 (= e!820470 e!820476)))

(declare-fun res!987792 () Bool)

(assert (=> b!1458209 (=> (not res!987792) (not e!820476))))

(declare-fun lt!638957 () SeekEntryResult!11763)

(assert (=> b!1458209 (= res!987792 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47614 a!2862) j!93) mask!2687) (select (arr!47614 a!2862) j!93) a!2862 mask!2687) lt!638957))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1458209 (= lt!638957 (Intermediate!11763 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1458210 () Bool)

(declare-fun res!987783 () Bool)

(declare-fun e!820471 () Bool)

(assert (=> b!1458210 (=> (not res!987783) (not e!820471))))

(assert (=> b!1458210 (= res!987783 (= (seekEntryOrOpen!0 (select (arr!47614 a!2862) j!93) a!2862 mask!2687) (Found!11763 j!93)))))

(declare-fun b!1458211 () Bool)

(declare-fun e!820472 () Bool)

(assert (=> b!1458211 (= e!820479 (not e!820472))))

(declare-fun res!987798 () Bool)

(assert (=> b!1458211 (=> res!987798 e!820472)))

(assert (=> b!1458211 (= res!987798 (or (and (= (select (arr!47614 a!2862) index!646) (select (store (arr!47614 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47614 a!2862) index!646) (select (arr!47614 a!2862) j!93))) (= (select (arr!47614 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1458211 e!820471))

(declare-fun res!987797 () Bool)

(assert (=> b!1458211 (=> (not res!987797) (not e!820471))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98659 (_ BitVec 32)) Bool)

(assert (=> b!1458211 (= res!987797 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49055 0))(
  ( (Unit!49056) )
))
(declare-fun lt!638952 () Unit!49055)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98659 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49055)

(assert (=> b!1458211 (= lt!638952 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1458212 () Bool)

(declare-fun res!987794 () Bool)

(declare-fun e!820475 () Bool)

(assert (=> b!1458212 (=> (not res!987794) (not e!820475))))

(assert (=> b!1458212 (= res!987794 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48165 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48165 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48165 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1458213 () Bool)

(assert (=> b!1458213 (= e!820471 (and (or (= (select (arr!47614 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47614 a!2862) intermediateBeforeIndex!19) (select (arr!47614 a!2862) j!93))) (let ((bdg!53288 (select (store (arr!47614 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47614 a!2862) index!646) bdg!53288) (= (select (arr!47614 a!2862) index!646) (select (arr!47614 a!2862) j!93))) (= (select (arr!47614 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53288 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun res!987793 () Bool)

(assert (=> start!125316 (=> (not res!987793) (not e!820475))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125316 (= res!987793 (validMask!0 mask!2687))))

(assert (=> start!125316 e!820475))

(assert (=> start!125316 true))

(declare-fun array_inv!36895 (array!98659) Bool)

(assert (=> start!125316 (array_inv!36895 a!2862)))

(declare-fun b!1458214 () Bool)

(declare-fun res!987785 () Bool)

(declare-fun e!820477 () Bool)

(assert (=> b!1458214 (=> res!987785 e!820477)))

(assert (=> b!1458214 (= res!987785 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638956 (select (arr!47614 a!2862) j!93) a!2862 mask!2687) lt!638957)))))

(declare-fun b!1458215 () Bool)

(declare-fun res!987791 () Bool)

(assert (=> b!1458215 (=> (not res!987791) (not e!820475))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1458215 (= res!987791 (validKeyInArray!0 (select (arr!47614 a!2862) j!93)))))

(declare-fun b!1458216 () Bool)

(declare-fun res!987784 () Bool)

(assert (=> b!1458216 (=> (not res!987784) (not e!820475))))

(assert (=> b!1458216 (= res!987784 (validKeyInArray!0 (select (arr!47614 a!2862) i!1006)))))

(declare-fun b!1458217 () Bool)

(declare-fun res!987800 () Bool)

(assert (=> b!1458217 (=> (not res!987800) (not e!820476))))

(assert (=> b!1458217 (= res!987800 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47614 a!2862) j!93) a!2862 mask!2687) lt!638957))))

(declare-fun b!1458218 () Bool)

(assert (=> b!1458218 (= e!820472 e!820477)))

(declare-fun res!987796 () Bool)

(assert (=> b!1458218 (=> res!987796 e!820477)))

(assert (=> b!1458218 (= res!987796 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638956 #b00000000000000000000000000000000) (bvsge lt!638956 (size!48165 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1458218 (= lt!638956 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(assert (=> b!1458218 (= lt!638953 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638959 lt!638955 mask!2687))))

(assert (=> b!1458218 (= lt!638953 (seekEntryOrOpen!0 lt!638959 lt!638955 mask!2687))))

(declare-fun b!1458219 () Bool)

(declare-fun res!987790 () Bool)

(assert (=> b!1458219 (=> (not res!987790) (not e!820479))))

(assert (=> b!1458219 (= res!987790 e!820478)))

(declare-fun c!134731 () Bool)

(assert (=> b!1458219 (= c!134731 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1458220 () Bool)

(assert (=> b!1458220 (= e!820475 e!820470)))

(declare-fun res!987786 () Bool)

(assert (=> b!1458220 (=> (not res!987786) (not e!820470))))

(assert (=> b!1458220 (= res!987786 (= (select (store (arr!47614 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1458220 (= lt!638955 (array!98660 (store (arr!47614 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48165 a!2862)))))

(declare-fun b!1458221 () Bool)

(declare-fun res!987795 () Bool)

(assert (=> b!1458221 (=> (not res!987795) (not e!820479))))

(assert (=> b!1458221 (= res!987795 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1458222 () Bool)

(assert (=> b!1458222 (= e!820477 true)))

(declare-fun lt!638958 () Bool)

(assert (=> b!1458222 (= lt!638958 e!820474)))

(declare-fun c!134730 () Bool)

(assert (=> b!1458222 (= c!134730 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1458223 () Bool)

(assert (=> b!1458223 (= e!820474 (not (= lt!638954 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638956 lt!638959 lt!638955 mask!2687))))))

(declare-fun b!1458224 () Bool)

(declare-fun res!987788 () Bool)

(assert (=> b!1458224 (=> (not res!987788) (not e!820475))))

(declare-datatypes ((List!34102 0))(
  ( (Nil!34099) (Cons!34098 (h!35459 (_ BitVec 64)) (t!48788 List!34102)) )
))
(declare-fun arrayNoDuplicates!0 (array!98659 (_ BitVec 32) List!34102) Bool)

(assert (=> b!1458224 (= res!987788 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34099))))

(declare-fun b!1458225 () Bool)

(declare-fun res!987799 () Bool)

(assert (=> b!1458225 (=> (not res!987799) (not e!820475))))

(assert (=> b!1458225 (= res!987799 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1458226 () Bool)

(declare-fun res!987789 () Bool)

(assert (=> b!1458226 (=> (not res!987789) (not e!820475))))

(assert (=> b!1458226 (= res!987789 (and (= (size!48165 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48165 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48165 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!125316 res!987793) b!1458226))

(assert (= (and b!1458226 res!987789) b!1458216))

(assert (= (and b!1458216 res!987784) b!1458215))

(assert (= (and b!1458215 res!987791) b!1458225))

(assert (= (and b!1458225 res!987799) b!1458224))

(assert (= (and b!1458224 res!987788) b!1458212))

(assert (= (and b!1458212 res!987794) b!1458220))

(assert (= (and b!1458220 res!987786) b!1458209))

(assert (= (and b!1458209 res!987792) b!1458217))

(assert (= (and b!1458217 res!987800) b!1458207))

(assert (= (and b!1458207 res!987787) b!1458219))

(assert (= (and b!1458219 c!134731) b!1458206))

(assert (= (and b!1458219 (not c!134731)) b!1458208))

(assert (= (and b!1458219 res!987790) b!1458221))

(assert (= (and b!1458221 res!987795) b!1458211))

(assert (= (and b!1458211 res!987797) b!1458210))

(assert (= (and b!1458210 res!987783) b!1458213))

(assert (= (and b!1458211 (not res!987798)) b!1458218))

(assert (= (and b!1458218 (not res!987796)) b!1458214))

(assert (= (and b!1458214 (not res!987785)) b!1458222))

(assert (= (and b!1458222 c!134730) b!1458223))

(assert (= (and b!1458222 (not c!134730)) b!1458205))

(declare-fun m!1346365 () Bool)

(assert (=> b!1458220 m!1346365))

(declare-fun m!1346367 () Bool)

(assert (=> b!1458220 m!1346367))

(declare-fun m!1346369 () Bool)

(assert (=> b!1458211 m!1346369))

(assert (=> b!1458211 m!1346365))

(declare-fun m!1346371 () Bool)

(assert (=> b!1458211 m!1346371))

(declare-fun m!1346373 () Bool)

(assert (=> b!1458211 m!1346373))

(declare-fun m!1346375 () Bool)

(assert (=> b!1458211 m!1346375))

(declare-fun m!1346377 () Bool)

(assert (=> b!1458211 m!1346377))

(assert (=> b!1458215 m!1346377))

(assert (=> b!1458215 m!1346377))

(declare-fun m!1346379 () Bool)

(assert (=> b!1458215 m!1346379))

(declare-fun m!1346381 () Bool)

(assert (=> b!1458205 m!1346381))

(declare-fun m!1346383 () Bool)

(assert (=> b!1458216 m!1346383))

(assert (=> b!1458216 m!1346383))

(declare-fun m!1346385 () Bool)

(assert (=> b!1458216 m!1346385))

(assert (=> b!1458210 m!1346377))

(assert (=> b!1458210 m!1346377))

(declare-fun m!1346387 () Bool)

(assert (=> b!1458210 m!1346387))

(declare-fun m!1346389 () Bool)

(assert (=> b!1458208 m!1346389))

(declare-fun m!1346391 () Bool)

(assert (=> b!1458208 m!1346391))

(declare-fun m!1346393 () Bool)

(assert (=> b!1458207 m!1346393))

(assert (=> b!1458207 m!1346393))

(declare-fun m!1346395 () Bool)

(assert (=> b!1458207 m!1346395))

(assert (=> b!1458207 m!1346365))

(declare-fun m!1346397 () Bool)

(assert (=> b!1458207 m!1346397))

(assert (=> b!1458214 m!1346377))

(assert (=> b!1458214 m!1346377))

(declare-fun m!1346399 () Bool)

(assert (=> b!1458214 m!1346399))

(assert (=> b!1458217 m!1346377))

(assert (=> b!1458217 m!1346377))

(declare-fun m!1346401 () Bool)

(assert (=> b!1458217 m!1346401))

(assert (=> b!1458209 m!1346377))

(assert (=> b!1458209 m!1346377))

(declare-fun m!1346403 () Bool)

(assert (=> b!1458209 m!1346403))

(assert (=> b!1458209 m!1346403))

(assert (=> b!1458209 m!1346377))

(declare-fun m!1346405 () Bool)

(assert (=> b!1458209 m!1346405))

(declare-fun m!1346407 () Bool)

(assert (=> b!1458218 m!1346407))

(assert (=> b!1458218 m!1346389))

(assert (=> b!1458218 m!1346391))

(declare-fun m!1346409 () Bool)

(assert (=> b!1458206 m!1346409))

(declare-fun m!1346411 () Bool)

(assert (=> b!1458224 m!1346411))

(declare-fun m!1346413 () Bool)

(assert (=> b!1458225 m!1346413))

(declare-fun m!1346415 () Bool)

(assert (=> b!1458223 m!1346415))

(declare-fun m!1346417 () Bool)

(assert (=> start!125316 m!1346417))

(declare-fun m!1346419 () Bool)

(assert (=> start!125316 m!1346419))

(assert (=> b!1458213 m!1346365))

(declare-fun m!1346421 () Bool)

(assert (=> b!1458213 m!1346421))

(assert (=> b!1458213 m!1346371))

(assert (=> b!1458213 m!1346373))

(assert (=> b!1458213 m!1346377))

(check-sat (not b!1458218) (not b!1458223) (not b!1458208) (not b!1458214) (not b!1458210) (not b!1458224) (not b!1458225) (not b!1458216) (not b!1458205) (not b!1458211) (not b!1458206) (not b!1458217) (not b!1458215) (not b!1458207) (not b!1458209) (not start!125316))
(check-sat)
