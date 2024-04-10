; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129086 () Bool)

(assert start!129086)

(declare-fun b!1514455 () Bool)

(declare-fun e!845177 () Bool)

(declare-fun e!845181 () Bool)

(assert (=> b!1514455 (= e!845177 e!845181)))

(declare-fun res!1034367 () Bool)

(assert (=> b!1514455 (=> (not res!1034367) (not e!845181))))

(declare-datatypes ((SeekEntryResult!12879 0))(
  ( (MissingZero!12879 (index!53911 (_ BitVec 32))) (Found!12879 (index!53912 (_ BitVec 32))) (Intermediate!12879 (undefined!13691 Bool) (index!53913 (_ BitVec 32)) (x!135621 (_ BitVec 32))) (Undefined!12879) (MissingVacant!12879 (index!53914 (_ BitVec 32))) )
))
(declare-fun lt!656343 () SeekEntryResult!12879)

(declare-fun lt!656341 () SeekEntryResult!12879)

(assert (=> b!1514455 (= res!1034367 (= lt!656343 lt!656341))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1514455 (= lt!656341 (Intermediate!12879 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100942 0))(
  ( (array!100943 (arr!48708 (Array (_ BitVec 32) (_ BitVec 64))) (size!49258 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100942)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100942 (_ BitVec 32)) SeekEntryResult!12879)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1514455 (= lt!656343 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48708 a!2804) j!70) mask!2512) (select (arr!48708 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1514456 () Bool)

(declare-fun lt!656340 () array!100942)

(declare-fun lt!656342 () (_ BitVec 64))

(declare-fun e!845179 () Bool)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100942 (_ BitVec 32)) SeekEntryResult!12879)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100942 (_ BitVec 32)) SeekEntryResult!12879)

(assert (=> b!1514456 (= e!845179 (= (seekEntryOrOpen!0 lt!656342 lt!656340 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656342 lt!656340 mask!2512)))))

(declare-fun b!1514458 () Bool)

(declare-fun res!1034371 () Bool)

(assert (=> b!1514458 (=> (not res!1034371) (not e!845177))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1514458 (= res!1034371 (validKeyInArray!0 (select (arr!48708 a!2804) i!961)))))

(declare-fun b!1514459 () Bool)

(declare-fun res!1034369 () Bool)

(assert (=> b!1514459 (=> (not res!1034369) (not e!845177))))

(assert (=> b!1514459 (= res!1034369 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49258 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49258 a!2804))))))

(declare-fun b!1514460 () Bool)

(declare-fun e!845180 () Bool)

(assert (=> b!1514460 (= e!845180 (not true))))

(declare-fun e!845176 () Bool)

(assert (=> b!1514460 e!845176))

(declare-fun res!1034361 () Bool)

(assert (=> b!1514460 (=> (not res!1034361) (not e!845176))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100942 (_ BitVec 32)) Bool)

(assert (=> b!1514460 (= res!1034361 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50626 0))(
  ( (Unit!50627) )
))
(declare-fun lt!656344 () Unit!50626)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100942 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50626)

(assert (=> b!1514460 (= lt!656344 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1514461 () Bool)

(declare-fun res!1034358 () Bool)

(assert (=> b!1514461 (=> (not res!1034358) (not e!845177))))

(assert (=> b!1514461 (= res!1034358 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1514462 () Bool)

(declare-fun res!1034366 () Bool)

(assert (=> b!1514462 (=> (not res!1034366) (not e!845181))))

(assert (=> b!1514462 (= res!1034366 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48708 a!2804) j!70) a!2804 mask!2512) lt!656341))))

(declare-fun b!1514463 () Bool)

(assert (=> b!1514463 (= e!845181 e!845180)))

(declare-fun res!1034368 () Bool)

(assert (=> b!1514463 (=> (not res!1034368) (not e!845180))))

(assert (=> b!1514463 (= res!1034368 (= lt!656343 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656342 mask!2512) lt!656342 lt!656340 mask!2512)))))

(assert (=> b!1514463 (= lt!656342 (select (store (arr!48708 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1514463 (= lt!656340 (array!100943 (store (arr!48708 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49258 a!2804)))))

(declare-fun b!1514464 () Bool)

(declare-fun res!1034365 () Bool)

(assert (=> b!1514464 (=> (not res!1034365) (not e!845177))))

(assert (=> b!1514464 (= res!1034365 (and (= (size!49258 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49258 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49258 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1514465 () Bool)

(declare-fun e!845182 () Bool)

(assert (=> b!1514465 (= e!845182 e!845179)))

(declare-fun res!1034359 () Bool)

(assert (=> b!1514465 (=> (not res!1034359) (not e!845179))))

(assert (=> b!1514465 (= res!1034359 (= (seekEntryOrOpen!0 (select (arr!48708 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48708 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1514466 () Bool)

(declare-fun res!1034362 () Bool)

(assert (=> b!1514466 (=> (not res!1034362) (not e!845177))))

(declare-datatypes ((List!35191 0))(
  ( (Nil!35188) (Cons!35187 (h!36599 (_ BitVec 64)) (t!49885 List!35191)) )
))
(declare-fun arrayNoDuplicates!0 (array!100942 (_ BitVec 32) List!35191) Bool)

(assert (=> b!1514466 (= res!1034362 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35188))))

(declare-fun b!1514467 () Bool)

(declare-fun res!1034360 () Bool)

(assert (=> b!1514467 (=> (not res!1034360) (not e!845177))))

(assert (=> b!1514467 (= res!1034360 (validKeyInArray!0 (select (arr!48708 a!2804) j!70)))))

(declare-fun b!1514468 () Bool)

(declare-fun res!1034370 () Bool)

(assert (=> b!1514468 (=> (not res!1034370) (not e!845176))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100942 (_ BitVec 32)) SeekEntryResult!12879)

(assert (=> b!1514468 (= res!1034370 (= (seekEntry!0 (select (arr!48708 a!2804) j!70) a!2804 mask!2512) (Found!12879 j!70)))))

(declare-fun res!1034364 () Bool)

(assert (=> start!129086 (=> (not res!1034364) (not e!845177))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129086 (= res!1034364 (validMask!0 mask!2512))))

(assert (=> start!129086 e!845177))

(assert (=> start!129086 true))

(declare-fun array_inv!37736 (array!100942) Bool)

(assert (=> start!129086 (array_inv!37736 a!2804)))

(declare-fun b!1514457 () Bool)

(assert (=> b!1514457 (= e!845176 e!845182)))

(declare-fun res!1034363 () Bool)

(assert (=> b!1514457 (=> res!1034363 e!845182)))

(assert (=> b!1514457 (= res!1034363 (or (not (= (select (arr!48708 a!2804) j!70) lt!656342)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48708 a!2804) index!487) (select (arr!48708 a!2804) j!70)) (not (= (select (arr!48708 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!129086 res!1034364) b!1514464))

(assert (= (and b!1514464 res!1034365) b!1514458))

(assert (= (and b!1514458 res!1034371) b!1514467))

(assert (= (and b!1514467 res!1034360) b!1514461))

(assert (= (and b!1514461 res!1034358) b!1514466))

(assert (= (and b!1514466 res!1034362) b!1514459))

(assert (= (and b!1514459 res!1034369) b!1514455))

(assert (= (and b!1514455 res!1034367) b!1514462))

(assert (= (and b!1514462 res!1034366) b!1514463))

(assert (= (and b!1514463 res!1034368) b!1514460))

(assert (= (and b!1514460 res!1034361) b!1514468))

(assert (= (and b!1514468 res!1034370) b!1514457))

(assert (= (and b!1514457 (not res!1034363)) b!1514465))

(assert (= (and b!1514465 res!1034359) b!1514456))

(declare-fun m!1397411 () Bool)

(assert (=> b!1514465 m!1397411))

(assert (=> b!1514465 m!1397411))

(declare-fun m!1397413 () Bool)

(assert (=> b!1514465 m!1397413))

(assert (=> b!1514465 m!1397411))

(declare-fun m!1397415 () Bool)

(assert (=> b!1514465 m!1397415))

(declare-fun m!1397417 () Bool)

(assert (=> b!1514458 m!1397417))

(assert (=> b!1514458 m!1397417))

(declare-fun m!1397419 () Bool)

(assert (=> b!1514458 m!1397419))

(declare-fun m!1397421 () Bool)

(assert (=> b!1514456 m!1397421))

(declare-fun m!1397423 () Bool)

(assert (=> b!1514456 m!1397423))

(declare-fun m!1397425 () Bool)

(assert (=> b!1514460 m!1397425))

(declare-fun m!1397427 () Bool)

(assert (=> b!1514460 m!1397427))

(assert (=> b!1514468 m!1397411))

(assert (=> b!1514468 m!1397411))

(declare-fun m!1397429 () Bool)

(assert (=> b!1514468 m!1397429))

(declare-fun m!1397431 () Bool)

(assert (=> b!1514463 m!1397431))

(assert (=> b!1514463 m!1397431))

(declare-fun m!1397433 () Bool)

(assert (=> b!1514463 m!1397433))

(declare-fun m!1397435 () Bool)

(assert (=> b!1514463 m!1397435))

(declare-fun m!1397437 () Bool)

(assert (=> b!1514463 m!1397437))

(declare-fun m!1397439 () Bool)

(assert (=> start!129086 m!1397439))

(declare-fun m!1397441 () Bool)

(assert (=> start!129086 m!1397441))

(declare-fun m!1397443 () Bool)

(assert (=> b!1514466 m!1397443))

(declare-fun m!1397445 () Bool)

(assert (=> b!1514461 m!1397445))

(assert (=> b!1514457 m!1397411))

(declare-fun m!1397447 () Bool)

(assert (=> b!1514457 m!1397447))

(assert (=> b!1514462 m!1397411))

(assert (=> b!1514462 m!1397411))

(declare-fun m!1397449 () Bool)

(assert (=> b!1514462 m!1397449))

(assert (=> b!1514455 m!1397411))

(assert (=> b!1514455 m!1397411))

(declare-fun m!1397451 () Bool)

(assert (=> b!1514455 m!1397451))

(assert (=> b!1514455 m!1397451))

(assert (=> b!1514455 m!1397411))

(declare-fun m!1397453 () Bool)

(assert (=> b!1514455 m!1397453))

(assert (=> b!1514467 m!1397411))

(assert (=> b!1514467 m!1397411))

(declare-fun m!1397455 () Bool)

(assert (=> b!1514467 m!1397455))

(check-sat (not b!1514455) (not b!1514456) (not b!1514468) (not b!1514458) (not b!1514462) (not b!1514461) (not start!129086) (not b!1514467) (not b!1514466) (not b!1514465) (not b!1514463) (not b!1514460))
(check-sat)
