; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129398 () Bool)

(assert start!129398)

(declare-fun b!1516497 () Bool)

(declare-fun e!846419 () Bool)

(assert (=> b!1516497 (= e!846419 (not true))))

(declare-fun e!846420 () Bool)

(assert (=> b!1516497 e!846420))

(declare-fun res!1035235 () Bool)

(assert (=> b!1516497 (=> (not res!1035235) (not e!846420))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101068 0))(
  ( (array!101069 (arr!48766 (Array (_ BitVec 32) (_ BitVec 64))) (size!49317 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101068)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101068 (_ BitVec 32)) Bool)

(assert (=> b!1516497 (= res!1035235 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50563 0))(
  ( (Unit!50564) )
))
(declare-fun lt!657079 () Unit!50563)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101068 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50563)

(assert (=> b!1516497 (= lt!657079 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1516499 () Bool)

(declare-fun res!1035234 () Bool)

(declare-fun e!846423 () Bool)

(assert (=> b!1516499 (=> (not res!1035234) (not e!846423))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1516499 (= res!1035234 (and (= (size!49317 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49317 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49317 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1516500 () Bool)

(declare-fun res!1035223 () Bool)

(assert (=> b!1516500 (=> (not res!1035223) (not e!846420))))

(declare-datatypes ((SeekEntryResult!12830 0))(
  ( (MissingZero!12830 (index!53715 (_ BitVec 32))) (Found!12830 (index!53716 (_ BitVec 32))) (Intermediate!12830 (undefined!13642 Bool) (index!53717 (_ BitVec 32)) (x!135625 (_ BitVec 32))) (Undefined!12830) (MissingVacant!12830 (index!53718 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101068 (_ BitVec 32)) SeekEntryResult!12830)

(assert (=> b!1516500 (= res!1035223 (= (seekEntry!0 (select (arr!48766 a!2804) j!70) a!2804 mask!2512) (Found!12830 j!70)))))

(declare-fun b!1516501 () Bool)

(declare-fun e!846417 () Bool)

(assert (=> b!1516501 (= e!846420 e!846417)))

(declare-fun res!1035233 () Bool)

(assert (=> b!1516501 (=> res!1035233 e!846417)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun lt!657080 () (_ BitVec 64))

(assert (=> b!1516501 (= res!1035233 (or (not (= (select (arr!48766 a!2804) j!70) lt!657080)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48766 a!2804) index!487) (select (arr!48766 a!2804) j!70)) (not (= (select (arr!48766 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1516502 () Bool)

(declare-fun res!1035224 () Bool)

(assert (=> b!1516502 (=> (not res!1035224) (not e!846423))))

(declare-datatypes ((List!35236 0))(
  ( (Nil!35233) (Cons!35232 (h!36659 (_ BitVec 64)) (t!49922 List!35236)) )
))
(declare-fun arrayNoDuplicates!0 (array!101068 (_ BitVec 32) List!35236) Bool)

(assert (=> b!1516502 (= res!1035224 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35233))))

(declare-fun b!1516503 () Bool)

(declare-fun res!1035229 () Bool)

(assert (=> b!1516503 (=> (not res!1035229) (not e!846423))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1516503 (= res!1035229 (validKeyInArray!0 (select (arr!48766 a!2804) j!70)))))

(declare-fun b!1516504 () Bool)

(declare-fun res!1035230 () Bool)

(declare-fun e!846421 () Bool)

(assert (=> b!1516504 (=> (not res!1035230) (not e!846421))))

(declare-fun lt!657078 () SeekEntryResult!12830)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101068 (_ BitVec 32)) SeekEntryResult!12830)

(assert (=> b!1516504 (= res!1035230 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48766 a!2804) j!70) a!2804 mask!2512) lt!657078))))

(declare-fun lt!657082 () array!101068)

(declare-fun e!846422 () Bool)

(declare-fun b!1516505 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101068 (_ BitVec 32)) SeekEntryResult!12830)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101068 (_ BitVec 32)) SeekEntryResult!12830)

(assert (=> b!1516505 (= e!846422 (= (seekEntryOrOpen!0 lt!657080 lt!657082 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!657080 lt!657082 mask!2512)))))

(declare-fun b!1516506 () Bool)

(assert (=> b!1516506 (= e!846423 e!846421)))

(declare-fun res!1035236 () Bool)

(assert (=> b!1516506 (=> (not res!1035236) (not e!846421))))

(declare-fun lt!657081 () SeekEntryResult!12830)

(assert (=> b!1516506 (= res!1035236 (= lt!657081 lt!657078))))

(assert (=> b!1516506 (= lt!657078 (Intermediate!12830 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516506 (= lt!657081 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48766 a!2804) j!70) mask!2512) (select (arr!48766 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1516498 () Bool)

(declare-fun res!1035227 () Bool)

(assert (=> b!1516498 (=> (not res!1035227) (not e!846423))))

(assert (=> b!1516498 (= res!1035227 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1035231 () Bool)

(assert (=> start!129398 (=> (not res!1035231) (not e!846423))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129398 (= res!1035231 (validMask!0 mask!2512))))

(assert (=> start!129398 e!846423))

(assert (=> start!129398 true))

(declare-fun array_inv!38047 (array!101068) Bool)

(assert (=> start!129398 (array_inv!38047 a!2804)))

(declare-fun b!1516507 () Bool)

(assert (=> b!1516507 (= e!846417 e!846422)))

(declare-fun res!1035226 () Bool)

(assert (=> b!1516507 (=> (not res!1035226) (not e!846422))))

(assert (=> b!1516507 (= res!1035226 (= (seekEntryOrOpen!0 (select (arr!48766 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48766 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1516508 () Bool)

(assert (=> b!1516508 (= e!846421 e!846419)))

(declare-fun res!1035228 () Bool)

(assert (=> b!1516508 (=> (not res!1035228) (not e!846419))))

(assert (=> b!1516508 (= res!1035228 (= lt!657081 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!657080 mask!2512) lt!657080 lt!657082 mask!2512)))))

(assert (=> b!1516508 (= lt!657080 (select (store (arr!48766 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1516508 (= lt!657082 (array!101069 (store (arr!48766 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49317 a!2804)))))

(declare-fun b!1516509 () Bool)

(declare-fun res!1035232 () Bool)

(assert (=> b!1516509 (=> (not res!1035232) (not e!846423))))

(assert (=> b!1516509 (= res!1035232 (validKeyInArray!0 (select (arr!48766 a!2804) i!961)))))

(declare-fun b!1516510 () Bool)

(declare-fun res!1035225 () Bool)

(assert (=> b!1516510 (=> (not res!1035225) (not e!846423))))

(assert (=> b!1516510 (= res!1035225 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49317 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49317 a!2804))))))

(assert (= (and start!129398 res!1035231) b!1516499))

(assert (= (and b!1516499 res!1035234) b!1516509))

(assert (= (and b!1516509 res!1035232) b!1516503))

(assert (= (and b!1516503 res!1035229) b!1516498))

(assert (= (and b!1516498 res!1035227) b!1516502))

(assert (= (and b!1516502 res!1035224) b!1516510))

(assert (= (and b!1516510 res!1035225) b!1516506))

(assert (= (and b!1516506 res!1035236) b!1516504))

(assert (= (and b!1516504 res!1035230) b!1516508))

(assert (= (and b!1516508 res!1035228) b!1516497))

(assert (= (and b!1516497 res!1035235) b!1516500))

(assert (= (and b!1516500 res!1035223) b!1516501))

(assert (= (and b!1516501 (not res!1035233)) b!1516507))

(assert (= (and b!1516507 res!1035226) b!1516505))

(declare-fun m!1399437 () Bool)

(assert (=> b!1516506 m!1399437))

(assert (=> b!1516506 m!1399437))

(declare-fun m!1399439 () Bool)

(assert (=> b!1516506 m!1399439))

(assert (=> b!1516506 m!1399439))

(assert (=> b!1516506 m!1399437))

(declare-fun m!1399441 () Bool)

(assert (=> b!1516506 m!1399441))

(declare-fun m!1399443 () Bool)

(assert (=> start!129398 m!1399443))

(declare-fun m!1399445 () Bool)

(assert (=> start!129398 m!1399445))

(declare-fun m!1399447 () Bool)

(assert (=> b!1516509 m!1399447))

(assert (=> b!1516509 m!1399447))

(declare-fun m!1399449 () Bool)

(assert (=> b!1516509 m!1399449))

(declare-fun m!1399451 () Bool)

(assert (=> b!1516497 m!1399451))

(declare-fun m!1399453 () Bool)

(assert (=> b!1516497 m!1399453))

(declare-fun m!1399455 () Bool)

(assert (=> b!1516505 m!1399455))

(declare-fun m!1399457 () Bool)

(assert (=> b!1516505 m!1399457))

(assert (=> b!1516500 m!1399437))

(assert (=> b!1516500 m!1399437))

(declare-fun m!1399459 () Bool)

(assert (=> b!1516500 m!1399459))

(declare-fun m!1399461 () Bool)

(assert (=> b!1516508 m!1399461))

(assert (=> b!1516508 m!1399461))

(declare-fun m!1399463 () Bool)

(assert (=> b!1516508 m!1399463))

(declare-fun m!1399465 () Bool)

(assert (=> b!1516508 m!1399465))

(declare-fun m!1399467 () Bool)

(assert (=> b!1516508 m!1399467))

(declare-fun m!1399469 () Bool)

(assert (=> b!1516502 m!1399469))

(assert (=> b!1516504 m!1399437))

(assert (=> b!1516504 m!1399437))

(declare-fun m!1399471 () Bool)

(assert (=> b!1516504 m!1399471))

(assert (=> b!1516503 m!1399437))

(assert (=> b!1516503 m!1399437))

(declare-fun m!1399473 () Bool)

(assert (=> b!1516503 m!1399473))

(assert (=> b!1516507 m!1399437))

(assert (=> b!1516507 m!1399437))

(declare-fun m!1399475 () Bool)

(assert (=> b!1516507 m!1399475))

(assert (=> b!1516507 m!1399437))

(declare-fun m!1399477 () Bool)

(assert (=> b!1516507 m!1399477))

(declare-fun m!1399479 () Bool)

(assert (=> b!1516498 m!1399479))

(assert (=> b!1516501 m!1399437))

(declare-fun m!1399481 () Bool)

(assert (=> b!1516501 m!1399481))

(check-sat (not b!1516503) (not b!1516498) (not b!1516497) (not b!1516509) (not b!1516508) (not b!1516504) (not b!1516505) (not b!1516506) (not b!1516500) (not b!1516502) (not start!129398) (not b!1516507))
(check-sat)
