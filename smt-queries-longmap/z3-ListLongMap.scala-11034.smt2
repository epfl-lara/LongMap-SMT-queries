; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129038 () Bool)

(assert start!129038)

(declare-fun b!1513447 () Bool)

(declare-fun res!1033360 () Bool)

(declare-fun e!844672 () Bool)

(assert (=> b!1513447 (=> (not res!1033360) (not e!844672))))

(declare-datatypes ((array!100894 0))(
  ( (array!100895 (arr!48684 (Array (_ BitVec 32) (_ BitVec 64))) (size!49234 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100894)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100894 (_ BitVec 32)) Bool)

(assert (=> b!1513447 (= res!1033360 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1513448 () Bool)

(declare-fun res!1033362 () Bool)

(assert (=> b!1513448 (=> (not res!1033362) (not e!844672))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1513448 (= res!1033362 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49234 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49234 a!2804))))))

(declare-fun res!1033353 () Bool)

(assert (=> start!129038 (=> (not res!1033353) (not e!844672))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129038 (= res!1033353 (validMask!0 mask!2512))))

(assert (=> start!129038 e!844672))

(assert (=> start!129038 true))

(declare-fun array_inv!37712 (array!100894) Bool)

(assert (=> start!129038 (array_inv!37712 a!2804)))

(declare-fun b!1513449 () Bool)

(declare-fun res!1033355 () Bool)

(assert (=> b!1513449 (=> (not res!1033355) (not e!844672))))

(declare-datatypes ((List!35167 0))(
  ( (Nil!35164) (Cons!35163 (h!36575 (_ BitVec 64)) (t!49861 List!35167)) )
))
(declare-fun arrayNoDuplicates!0 (array!100894 (_ BitVec 32) List!35167) Bool)

(assert (=> b!1513449 (= res!1033355 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35164))))

(declare-fun b!1513450 () Bool)

(declare-fun e!844675 () Bool)

(declare-fun e!844677 () Bool)

(assert (=> b!1513450 (= e!844675 e!844677)))

(declare-fun res!1033356 () Bool)

(assert (=> b!1513450 (=> (not res!1033356) (not e!844677))))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12855 0))(
  ( (MissingZero!12855 (index!53815 (_ BitVec 32))) (Found!12855 (index!53816 (_ BitVec 32))) (Intermediate!12855 (undefined!13667 Bool) (index!53817 (_ BitVec 32)) (x!135533 (_ BitVec 32))) (Undefined!12855) (MissingVacant!12855 (index!53818 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100894 (_ BitVec 32)) SeekEntryResult!12855)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100894 (_ BitVec 32)) SeekEntryResult!12855)

(assert (=> b!1513450 (= res!1033356 (= (seekEntryOrOpen!0 (select (arr!48684 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48684 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1513451 () Bool)

(declare-fun res!1033352 () Bool)

(assert (=> b!1513451 (=> (not res!1033352) (not e!844672))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1513451 (= res!1033352 (and (= (size!49234 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49234 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49234 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1513452 () Bool)

(declare-fun res!1033357 () Bool)

(assert (=> b!1513452 (=> (not res!1033357) (not e!844672))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1513452 (= res!1033357 (validKeyInArray!0 (select (arr!48684 a!2804) j!70)))))

(declare-fun b!1513453 () Bool)

(declare-fun e!844676 () Bool)

(assert (=> b!1513453 (= e!844676 (not true))))

(declare-fun e!844673 () Bool)

(assert (=> b!1513453 e!844673))

(declare-fun res!1033361 () Bool)

(assert (=> b!1513453 (=> (not res!1033361) (not e!844673))))

(assert (=> b!1513453 (= res!1033361 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50578 0))(
  ( (Unit!50579) )
))
(declare-fun lt!655983 () Unit!50578)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100894 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50578)

(assert (=> b!1513453 (= lt!655983 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1513454 () Bool)

(declare-fun e!844674 () Bool)

(assert (=> b!1513454 (= e!844672 e!844674)))

(declare-fun res!1033363 () Bool)

(assert (=> b!1513454 (=> (not res!1033363) (not e!844674))))

(declare-fun lt!655981 () SeekEntryResult!12855)

(declare-fun lt!655982 () SeekEntryResult!12855)

(assert (=> b!1513454 (= res!1033363 (= lt!655981 lt!655982))))

(assert (=> b!1513454 (= lt!655982 (Intermediate!12855 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100894 (_ BitVec 32)) SeekEntryResult!12855)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1513454 (= lt!655981 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48684 a!2804) j!70) mask!2512) (select (arr!48684 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1513455 () Bool)

(declare-fun res!1033359 () Bool)

(assert (=> b!1513455 (=> (not res!1033359) (not e!844672))))

(assert (=> b!1513455 (= res!1033359 (validKeyInArray!0 (select (arr!48684 a!2804) i!961)))))

(declare-fun b!1513456 () Bool)

(declare-fun res!1033351 () Bool)

(assert (=> b!1513456 (=> (not res!1033351) (not e!844673))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100894 (_ BitVec 32)) SeekEntryResult!12855)

(assert (=> b!1513456 (= res!1033351 (= (seekEntry!0 (select (arr!48684 a!2804) j!70) a!2804 mask!2512) (Found!12855 j!70)))))

(declare-fun b!1513457 () Bool)

(declare-fun res!1033350 () Bool)

(assert (=> b!1513457 (=> (not res!1033350) (not e!844674))))

(assert (=> b!1513457 (= res!1033350 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48684 a!2804) j!70) a!2804 mask!2512) lt!655982))))

(declare-fun b!1513458 () Bool)

(assert (=> b!1513458 (= e!844673 e!844675)))

(declare-fun res!1033358 () Bool)

(assert (=> b!1513458 (=> res!1033358 e!844675)))

(declare-fun lt!655980 () (_ BitVec 64))

(assert (=> b!1513458 (= res!1033358 (or (not (= (select (arr!48684 a!2804) j!70) lt!655980)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48684 a!2804) index!487) (select (arr!48684 a!2804) j!70)) (not (= (select (arr!48684 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1513459 () Bool)

(assert (=> b!1513459 (= e!844674 e!844676)))

(declare-fun res!1033354 () Bool)

(assert (=> b!1513459 (=> (not res!1033354) (not e!844676))))

(declare-fun lt!655984 () array!100894)

(assert (=> b!1513459 (= res!1033354 (= lt!655981 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!655980 mask!2512) lt!655980 lt!655984 mask!2512)))))

(assert (=> b!1513459 (= lt!655980 (select (store (arr!48684 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1513459 (= lt!655984 (array!100895 (store (arr!48684 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49234 a!2804)))))

(declare-fun b!1513460 () Bool)

(assert (=> b!1513460 (= e!844677 (= (seekEntryOrOpen!0 lt!655980 lt!655984 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!655980 lt!655984 mask!2512)))))

(assert (= (and start!129038 res!1033353) b!1513451))

(assert (= (and b!1513451 res!1033352) b!1513455))

(assert (= (and b!1513455 res!1033359) b!1513452))

(assert (= (and b!1513452 res!1033357) b!1513447))

(assert (= (and b!1513447 res!1033360) b!1513449))

(assert (= (and b!1513449 res!1033355) b!1513448))

(assert (= (and b!1513448 res!1033362) b!1513454))

(assert (= (and b!1513454 res!1033363) b!1513457))

(assert (= (and b!1513457 res!1033350) b!1513459))

(assert (= (and b!1513459 res!1033354) b!1513453))

(assert (= (and b!1513453 res!1033361) b!1513456))

(assert (= (and b!1513456 res!1033351) b!1513458))

(assert (= (and b!1513458 (not res!1033358)) b!1513450))

(assert (= (and b!1513450 res!1033356) b!1513460))

(declare-fun m!1396307 () Bool)

(assert (=> b!1513453 m!1396307))

(declare-fun m!1396309 () Bool)

(assert (=> b!1513453 m!1396309))

(declare-fun m!1396311 () Bool)

(assert (=> b!1513447 m!1396311))

(declare-fun m!1396313 () Bool)

(assert (=> b!1513449 m!1396313))

(declare-fun m!1396315 () Bool)

(assert (=> b!1513452 m!1396315))

(assert (=> b!1513452 m!1396315))

(declare-fun m!1396317 () Bool)

(assert (=> b!1513452 m!1396317))

(assert (=> b!1513458 m!1396315))

(declare-fun m!1396319 () Bool)

(assert (=> b!1513458 m!1396319))

(declare-fun m!1396321 () Bool)

(assert (=> b!1513455 m!1396321))

(assert (=> b!1513455 m!1396321))

(declare-fun m!1396323 () Bool)

(assert (=> b!1513455 m!1396323))

(declare-fun m!1396325 () Bool)

(assert (=> b!1513460 m!1396325))

(declare-fun m!1396327 () Bool)

(assert (=> b!1513460 m!1396327))

(declare-fun m!1396329 () Bool)

(assert (=> start!129038 m!1396329))

(declare-fun m!1396331 () Bool)

(assert (=> start!129038 m!1396331))

(assert (=> b!1513454 m!1396315))

(assert (=> b!1513454 m!1396315))

(declare-fun m!1396333 () Bool)

(assert (=> b!1513454 m!1396333))

(assert (=> b!1513454 m!1396333))

(assert (=> b!1513454 m!1396315))

(declare-fun m!1396335 () Bool)

(assert (=> b!1513454 m!1396335))

(assert (=> b!1513456 m!1396315))

(assert (=> b!1513456 m!1396315))

(declare-fun m!1396337 () Bool)

(assert (=> b!1513456 m!1396337))

(assert (=> b!1513450 m!1396315))

(assert (=> b!1513450 m!1396315))

(declare-fun m!1396339 () Bool)

(assert (=> b!1513450 m!1396339))

(assert (=> b!1513450 m!1396315))

(declare-fun m!1396341 () Bool)

(assert (=> b!1513450 m!1396341))

(assert (=> b!1513457 m!1396315))

(assert (=> b!1513457 m!1396315))

(declare-fun m!1396343 () Bool)

(assert (=> b!1513457 m!1396343))

(declare-fun m!1396345 () Bool)

(assert (=> b!1513459 m!1396345))

(assert (=> b!1513459 m!1396345))

(declare-fun m!1396347 () Bool)

(assert (=> b!1513459 m!1396347))

(declare-fun m!1396349 () Bool)

(assert (=> b!1513459 m!1396349))

(declare-fun m!1396351 () Bool)

(assert (=> b!1513459 m!1396351))

(check-sat (not b!1513456) (not b!1513447) (not b!1513455) (not b!1513457) (not b!1513459) (not b!1513460) (not b!1513450) (not b!1513449) (not b!1513453) (not start!129038) (not b!1513452) (not b!1513454))
(check-sat)
