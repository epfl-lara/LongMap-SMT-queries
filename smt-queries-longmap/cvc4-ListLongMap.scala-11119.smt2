; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129882 () Bool)

(assert start!129882)

(declare-fun b!1524403 () Bool)

(declare-fun e!849787 () Bool)

(declare-fun e!849786 () Bool)

(assert (=> b!1524403 (= e!849787 e!849786)))

(declare-fun res!1043061 () Bool)

(assert (=> b!1524403 (=> (not res!1043061) (not e!849786))))

(declare-datatypes ((SeekEntryResult!13105 0))(
  ( (MissingZero!13105 (index!54815 (_ BitVec 32))) (Found!13105 (index!54816 (_ BitVec 32))) (Intermediate!13105 (undefined!13917 Bool) (index!54817 (_ BitVec 32)) (x!136501 (_ BitVec 32))) (Undefined!13105) (MissingVacant!13105 (index!54818 (_ BitVec 32))) )
))
(declare-fun lt!660307 () SeekEntryResult!13105)

(declare-fun lt!660306 () SeekEntryResult!13105)

(assert (=> b!1524403 (= res!1043061 (= lt!660307 lt!660306))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1524403 (= lt!660306 (Intermediate!13105 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101421 0))(
  ( (array!101422 (arr!48940 (Array (_ BitVec 32) (_ BitVec 64))) (size!49490 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101421)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101421 (_ BitVec 32)) SeekEntryResult!13105)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1524403 (= lt!660307 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48940 a!2804) j!70) mask!2512) (select (arr!48940 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1524404 () Bool)

(declare-fun res!1043060 () Bool)

(assert (=> b!1524404 (=> (not res!1043060) (not e!849787))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1524404 (= res!1043060 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49490 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49490 a!2804))))))

(declare-fun b!1524405 () Bool)

(declare-fun res!1043062 () Bool)

(assert (=> b!1524405 (=> (not res!1043062) (not e!849787))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1524405 (= res!1043062 (validKeyInArray!0 (select (arr!48940 a!2804) j!70)))))

(declare-fun b!1524406 () Bool)

(declare-fun res!1043055 () Bool)

(assert (=> b!1524406 (=> (not res!1043055) (not e!849786))))

(assert (=> b!1524406 (= res!1043055 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48940 a!2804) j!70) a!2804 mask!2512) lt!660306))))

(declare-fun b!1524407 () Bool)

(declare-fun e!849785 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101421 (_ BitVec 32)) SeekEntryResult!13105)

(assert (=> b!1524407 (= e!849785 (= (seekEntry!0 (select (arr!48940 a!2804) j!70) a!2804 mask!2512) (Found!13105 j!70)))))

(declare-fun res!1043063 () Bool)

(assert (=> start!129882 (=> (not res!1043063) (not e!849787))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129882 (= res!1043063 (validMask!0 mask!2512))))

(assert (=> start!129882 e!849787))

(assert (=> start!129882 true))

(declare-fun array_inv!37968 (array!101421) Bool)

(assert (=> start!129882 (array_inv!37968 a!2804)))

(declare-fun b!1524408 () Bool)

(declare-fun res!1043056 () Bool)

(assert (=> b!1524408 (=> (not res!1043056) (not e!849786))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1524408 (= res!1043056 (= lt!660307 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48940 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48940 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101422 (store (arr!48940 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49490 a!2804)) mask!2512)))))

(declare-fun b!1524409 () Bool)

(declare-fun res!1043057 () Bool)

(assert (=> b!1524409 (=> (not res!1043057) (not e!849787))))

(declare-datatypes ((List!35423 0))(
  ( (Nil!35420) (Cons!35419 (h!36846 (_ BitVec 64)) (t!50117 List!35423)) )
))
(declare-fun arrayNoDuplicates!0 (array!101421 (_ BitVec 32) List!35423) Bool)

(assert (=> b!1524409 (= res!1043057 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35420))))

(declare-fun b!1524410 () Bool)

(assert (=> b!1524410 (= e!849786 (not true))))

(assert (=> b!1524410 e!849785))

(declare-fun res!1043065 () Bool)

(assert (=> b!1524410 (=> (not res!1043065) (not e!849785))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101421 (_ BitVec 32)) Bool)

(assert (=> b!1524410 (= res!1043065 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50994 0))(
  ( (Unit!50995) )
))
(declare-fun lt!660305 () Unit!50994)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101421 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50994)

(assert (=> b!1524410 (= lt!660305 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1524411 () Bool)

(declare-fun res!1043064 () Bool)

(assert (=> b!1524411 (=> (not res!1043064) (not e!849787))))

(assert (=> b!1524411 (= res!1043064 (and (= (size!49490 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49490 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49490 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1524412 () Bool)

(declare-fun res!1043059 () Bool)

(assert (=> b!1524412 (=> (not res!1043059) (not e!849787))))

(assert (=> b!1524412 (= res!1043059 (validKeyInArray!0 (select (arr!48940 a!2804) i!961)))))

(declare-fun b!1524413 () Bool)

(declare-fun res!1043058 () Bool)

(assert (=> b!1524413 (=> (not res!1043058) (not e!849787))))

(assert (=> b!1524413 (= res!1043058 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!129882 res!1043063) b!1524411))

(assert (= (and b!1524411 res!1043064) b!1524412))

(assert (= (and b!1524412 res!1043059) b!1524405))

(assert (= (and b!1524405 res!1043062) b!1524413))

(assert (= (and b!1524413 res!1043058) b!1524409))

(assert (= (and b!1524409 res!1043057) b!1524404))

(assert (= (and b!1524404 res!1043060) b!1524403))

(assert (= (and b!1524403 res!1043061) b!1524406))

(assert (= (and b!1524406 res!1043055) b!1524408))

(assert (= (and b!1524408 res!1043056) b!1524410))

(assert (= (and b!1524410 res!1043065) b!1524407))

(declare-fun m!1407447 () Bool)

(assert (=> b!1524412 m!1407447))

(assert (=> b!1524412 m!1407447))

(declare-fun m!1407449 () Bool)

(assert (=> b!1524412 m!1407449))

(declare-fun m!1407451 () Bool)

(assert (=> b!1524413 m!1407451))

(declare-fun m!1407453 () Bool)

(assert (=> b!1524407 m!1407453))

(assert (=> b!1524407 m!1407453))

(declare-fun m!1407455 () Bool)

(assert (=> b!1524407 m!1407455))

(assert (=> b!1524406 m!1407453))

(assert (=> b!1524406 m!1407453))

(declare-fun m!1407457 () Bool)

(assert (=> b!1524406 m!1407457))

(declare-fun m!1407459 () Bool)

(assert (=> b!1524410 m!1407459))

(declare-fun m!1407461 () Bool)

(assert (=> b!1524410 m!1407461))

(declare-fun m!1407463 () Bool)

(assert (=> start!129882 m!1407463))

(declare-fun m!1407465 () Bool)

(assert (=> start!129882 m!1407465))

(declare-fun m!1407467 () Bool)

(assert (=> b!1524409 m!1407467))

(assert (=> b!1524403 m!1407453))

(assert (=> b!1524403 m!1407453))

(declare-fun m!1407469 () Bool)

(assert (=> b!1524403 m!1407469))

(assert (=> b!1524403 m!1407469))

(assert (=> b!1524403 m!1407453))

(declare-fun m!1407471 () Bool)

(assert (=> b!1524403 m!1407471))

(assert (=> b!1524405 m!1407453))

(assert (=> b!1524405 m!1407453))

(declare-fun m!1407473 () Bool)

(assert (=> b!1524405 m!1407473))

(declare-fun m!1407475 () Bool)

(assert (=> b!1524408 m!1407475))

(declare-fun m!1407477 () Bool)

(assert (=> b!1524408 m!1407477))

(assert (=> b!1524408 m!1407477))

(declare-fun m!1407479 () Bool)

(assert (=> b!1524408 m!1407479))

(assert (=> b!1524408 m!1407479))

(assert (=> b!1524408 m!1407477))

(declare-fun m!1407481 () Bool)

(assert (=> b!1524408 m!1407481))

(push 1)

(assert (not b!1524409))

(assert (not b!1524410))

(assert (not b!1524413))

(assert (not b!1524405))

(assert (not b!1524412))

