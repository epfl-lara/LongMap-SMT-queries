; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129254 () Bool)

(assert start!129254)

(declare-fun b!1518402 () Bool)

(declare-fun e!847014 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101110 0))(
  ( (array!101111 (arr!48793 (Array (_ BitVec 32) (_ BitVec 64))) (size!49345 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101110)

(declare-datatypes ((SeekEntryResult!12987 0))(
  ( (MissingZero!12987 (index!54343 (_ BitVec 32))) (Found!12987 (index!54344 (_ BitVec 32))) (Intermediate!12987 (undefined!13799 Bool) (index!54345 (_ BitVec 32)) (x!136019 (_ BitVec 32))) (Undefined!12987) (MissingVacant!12987 (index!54346 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101110 (_ BitVec 32)) SeekEntryResult!12987)

(assert (=> b!1518402 (= e!847014 (= (seekEntry!0 (select (arr!48793 a!2804) j!70) a!2804 mask!2512) (Found!12987 j!70)))))

(declare-fun b!1518403 () Bool)

(declare-fun e!847012 () Bool)

(declare-fun e!847016 () Bool)

(assert (=> b!1518403 (= e!847012 e!847016)))

(declare-fun res!1038522 () Bool)

(assert (=> b!1518403 (=> (not res!1038522) (not e!847016))))

(declare-fun lt!658027 () SeekEntryResult!12987)

(declare-fun lt!658023 () SeekEntryResult!12987)

(assert (=> b!1518403 (= res!1038522 (= lt!658027 lt!658023))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1518403 (= lt!658023 (Intermediate!12987 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101110 (_ BitVec 32)) SeekEntryResult!12987)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518403 (= lt!658027 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48793 a!2804) j!70) mask!2512) (select (arr!48793 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1518404 () Bool)

(declare-fun res!1038515 () Bool)

(assert (=> b!1518404 (=> (not res!1038515) (not e!847012))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1518404 (= res!1038515 (and (= (size!49345 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49345 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49345 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1518405 () Bool)

(declare-fun res!1038511 () Bool)

(assert (=> b!1518405 (=> (not res!1038511) (not e!847012))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101110 (_ BitVec 32)) Bool)

(assert (=> b!1518405 (= res!1038511 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1518406 () Bool)

(declare-fun e!847013 () Bool)

(assert (=> b!1518406 (= e!847016 e!847013)))

(declare-fun res!1038519 () Bool)

(assert (=> b!1518406 (=> (not res!1038519) (not e!847013))))

(declare-fun lt!658028 () array!101110)

(declare-fun lt!658029 () (_ BitVec 64))

(assert (=> b!1518406 (= res!1038519 (= lt!658027 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!658029 mask!2512) lt!658029 lt!658028 mask!2512)))))

(assert (=> b!1518406 (= lt!658029 (select (store (arr!48793 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1518406 (= lt!658028 (array!101111 (store (arr!48793 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49345 a!2804)))))

(declare-fun b!1518408 () Bool)

(declare-fun e!847017 () Bool)

(assert (=> b!1518408 (= e!847013 (not e!847017))))

(declare-fun res!1038524 () Bool)

(assert (=> b!1518408 (=> res!1038524 e!847017)))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1518408 (= res!1038524 (or (not (= (select (arr!48793 a!2804) j!70) lt!658029)) (= x!534 resX!21)))))

(assert (=> b!1518408 e!847014))

(declare-fun res!1038521 () Bool)

(assert (=> b!1518408 (=> (not res!1038521) (not e!847014))))

(assert (=> b!1518408 (= res!1038521 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50681 0))(
  ( (Unit!50682) )
))
(declare-fun lt!658025 () Unit!50681)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101110 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50681)

(assert (=> b!1518408 (= lt!658025 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1518409 () Bool)

(declare-fun e!847015 () Bool)

(assert (=> b!1518409 (= e!847017 e!847015)))

(declare-fun res!1038517 () Bool)

(assert (=> b!1518409 (=> res!1038517 e!847015)))

(declare-fun lt!658026 () (_ BitVec 32))

(assert (=> b!1518409 (= res!1038517 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!658026 #b00000000000000000000000000000000) (bvsge lt!658026 (size!49345 a!2804))))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518409 (= lt!658026 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1518410 () Bool)

(declare-fun res!1038516 () Bool)

(assert (=> b!1518410 (=> (not res!1038516) (not e!847012))))

(declare-datatypes ((List!35354 0))(
  ( (Nil!35351) (Cons!35350 (h!36763 (_ BitVec 64)) (t!50040 List!35354)) )
))
(declare-fun arrayNoDuplicates!0 (array!101110 (_ BitVec 32) List!35354) Bool)

(assert (=> b!1518410 (= res!1038516 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35351))))

(declare-fun b!1518411 () Bool)

(declare-fun res!1038520 () Bool)

(assert (=> b!1518411 (=> (not res!1038520) (not e!847012))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1518411 (= res!1038520 (validKeyInArray!0 (select (arr!48793 a!2804) j!70)))))

(declare-fun b!1518412 () Bool)

(declare-fun res!1038512 () Bool)

(assert (=> b!1518412 (=> (not res!1038512) (not e!847012))))

(assert (=> b!1518412 (= res!1038512 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49345 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49345 a!2804))))))

(declare-fun b!1518413 () Bool)

(declare-fun res!1038514 () Bool)

(assert (=> b!1518413 (=> (not res!1038514) (not e!847012))))

(assert (=> b!1518413 (= res!1038514 (validKeyInArray!0 (select (arr!48793 a!2804) i!961)))))

(declare-fun b!1518407 () Bool)

(declare-fun res!1038518 () Bool)

(assert (=> b!1518407 (=> res!1038518 e!847015)))

(assert (=> b!1518407 (= res!1038518 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!658026 (select (arr!48793 a!2804) j!70) a!2804 mask!2512) lt!658023)))))

(declare-fun res!1038513 () Bool)

(assert (=> start!129254 (=> (not res!1038513) (not e!847012))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129254 (= res!1038513 (validMask!0 mask!2512))))

(assert (=> start!129254 e!847012))

(assert (=> start!129254 true))

(declare-fun array_inv!38026 (array!101110) Bool)

(assert (=> start!129254 (array_inv!38026 a!2804)))

(declare-fun b!1518414 () Bool)

(declare-fun res!1038523 () Bool)

(assert (=> b!1518414 (=> (not res!1038523) (not e!847016))))

(assert (=> b!1518414 (= res!1038523 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48793 a!2804) j!70) a!2804 mask!2512) lt!658023))))

(declare-fun b!1518415 () Bool)

(assert (=> b!1518415 (= e!847015 true)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101110 (_ BitVec 32)) SeekEntryResult!12987)

(assert (=> b!1518415 (= (seekEntryOrOpen!0 (select (arr!48793 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!658029 lt!658028 mask!2512))))

(declare-fun lt!658024 () Unit!50681)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101110 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50681)

(assert (=> b!1518415 (= lt!658024 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!658026 resX!21 resIndex!21 mask!2512))))

(assert (= (and start!129254 res!1038513) b!1518404))

(assert (= (and b!1518404 res!1038515) b!1518413))

(assert (= (and b!1518413 res!1038514) b!1518411))

(assert (= (and b!1518411 res!1038520) b!1518405))

(assert (= (and b!1518405 res!1038511) b!1518410))

(assert (= (and b!1518410 res!1038516) b!1518412))

(assert (= (and b!1518412 res!1038512) b!1518403))

(assert (= (and b!1518403 res!1038522) b!1518414))

(assert (= (and b!1518414 res!1038523) b!1518406))

(assert (= (and b!1518406 res!1038519) b!1518408))

(assert (= (and b!1518408 res!1038521) b!1518402))

(assert (= (and b!1518408 (not res!1038524)) b!1518409))

(assert (= (and b!1518409 (not res!1038517)) b!1518407))

(assert (= (and b!1518407 (not res!1038518)) b!1518415))

(declare-fun m!1401173 () Bool)

(assert (=> b!1518409 m!1401173))

(declare-fun m!1401175 () Bool)

(assert (=> b!1518405 m!1401175))

(declare-fun m!1401177 () Bool)

(assert (=> b!1518406 m!1401177))

(assert (=> b!1518406 m!1401177))

(declare-fun m!1401179 () Bool)

(assert (=> b!1518406 m!1401179))

(declare-fun m!1401181 () Bool)

(assert (=> b!1518406 m!1401181))

(declare-fun m!1401183 () Bool)

(assert (=> b!1518406 m!1401183))

(declare-fun m!1401185 () Bool)

(assert (=> b!1518415 m!1401185))

(assert (=> b!1518415 m!1401185))

(declare-fun m!1401187 () Bool)

(assert (=> b!1518415 m!1401187))

(declare-fun m!1401189 () Bool)

(assert (=> b!1518415 m!1401189))

(declare-fun m!1401191 () Bool)

(assert (=> b!1518415 m!1401191))

(declare-fun m!1401193 () Bool)

(assert (=> start!129254 m!1401193))

(declare-fun m!1401195 () Bool)

(assert (=> start!129254 m!1401195))

(declare-fun m!1401197 () Bool)

(assert (=> b!1518410 m!1401197))

(assert (=> b!1518414 m!1401185))

(assert (=> b!1518414 m!1401185))

(declare-fun m!1401199 () Bool)

(assert (=> b!1518414 m!1401199))

(assert (=> b!1518402 m!1401185))

(assert (=> b!1518402 m!1401185))

(declare-fun m!1401201 () Bool)

(assert (=> b!1518402 m!1401201))

(assert (=> b!1518403 m!1401185))

(assert (=> b!1518403 m!1401185))

(declare-fun m!1401203 () Bool)

(assert (=> b!1518403 m!1401203))

(assert (=> b!1518403 m!1401203))

(assert (=> b!1518403 m!1401185))

(declare-fun m!1401205 () Bool)

(assert (=> b!1518403 m!1401205))

(assert (=> b!1518407 m!1401185))

(assert (=> b!1518407 m!1401185))

(declare-fun m!1401207 () Bool)

(assert (=> b!1518407 m!1401207))

(assert (=> b!1518411 m!1401185))

(assert (=> b!1518411 m!1401185))

(declare-fun m!1401209 () Bool)

(assert (=> b!1518411 m!1401209))

(declare-fun m!1401211 () Bool)

(assert (=> b!1518413 m!1401211))

(assert (=> b!1518413 m!1401211))

(declare-fun m!1401213 () Bool)

(assert (=> b!1518413 m!1401213))

(assert (=> b!1518408 m!1401185))

(declare-fun m!1401215 () Bool)

(assert (=> b!1518408 m!1401215))

(declare-fun m!1401217 () Bool)

(assert (=> b!1518408 m!1401217))

(check-sat (not start!129254) (not b!1518405) (not b!1518406) (not b!1518408) (not b!1518403) (not b!1518410) (not b!1518411) (not b!1518415) (not b!1518407) (not b!1518402) (not b!1518413) (not b!1518409) (not b!1518414))
(check-sat)
