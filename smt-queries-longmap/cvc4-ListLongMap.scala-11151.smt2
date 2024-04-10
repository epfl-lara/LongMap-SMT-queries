; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130272 () Bool)

(assert start!130272)

(declare-fun b!1529460 () Bool)

(declare-fun res!1047172 () Bool)

(declare-fun e!852341 () Bool)

(assert (=> b!1529460 (=> (not res!1047172) (not e!852341))))

(declare-datatypes ((SeekEntryResult!13201 0))(
  ( (MissingZero!13201 (index!55199 (_ BitVec 32))) (Found!13201 (index!55200 (_ BitVec 32))) (Intermediate!13201 (undefined!14013 Bool) (index!55201 (_ BitVec 32)) (x!136880 (_ BitVec 32))) (Undefined!13201) (MissingVacant!13201 (index!55202 (_ BitVec 32))) )
))
(declare-fun lt!662441 () SeekEntryResult!13201)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((array!101622 0))(
  ( (array!101623 (arr!49036 (Array (_ BitVec 32) (_ BitVec 64))) (size!49586 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101622)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101622 (_ BitVec 32)) SeekEntryResult!13201)

(assert (=> b!1529460 (= res!1047172 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49036 a!2804) j!70) a!2804 mask!2512) lt!662441))))

(declare-fun b!1529461 () Bool)

(declare-fun res!1047167 () Bool)

(assert (=> b!1529461 (=> (not res!1047167) (not e!852341))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun lt!662443 () SeekEntryResult!13201)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529461 (= res!1047167 (= lt!662443 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49036 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49036 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101623 (store (arr!49036 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49586 a!2804)) mask!2512)))))

(declare-fun res!1047178 () Bool)

(declare-fun e!852339 () Bool)

(assert (=> start!130272 (=> (not res!1047178) (not e!852339))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130272 (= res!1047178 (validMask!0 mask!2512))))

(assert (=> start!130272 e!852339))

(assert (=> start!130272 true))

(declare-fun array_inv!38064 (array!101622) Bool)

(assert (=> start!130272 (array_inv!38064 a!2804)))

(declare-fun b!1529462 () Bool)

(declare-fun res!1047170 () Bool)

(assert (=> b!1529462 (=> (not res!1047170) (not e!852339))))

(declare-datatypes ((List!35519 0))(
  ( (Nil!35516) (Cons!35515 (h!36951 (_ BitVec 64)) (t!50213 List!35519)) )
))
(declare-fun arrayNoDuplicates!0 (array!101622 (_ BitVec 32) List!35519) Bool)

(assert (=> b!1529462 (= res!1047170 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35516))))

(declare-fun b!1529463 () Bool)

(assert (=> b!1529463 (= e!852339 e!852341)))

(declare-fun res!1047177 () Bool)

(assert (=> b!1529463 (=> (not res!1047177) (not e!852341))))

(assert (=> b!1529463 (= res!1047177 (= lt!662443 lt!662441))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1529463 (= lt!662441 (Intermediate!13201 false resIndex!21 resX!21))))

(assert (=> b!1529463 (= lt!662443 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49036 a!2804) j!70) mask!2512) (select (arr!49036 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1529464 () Bool)

(declare-fun res!1047169 () Bool)

(assert (=> b!1529464 (=> (not res!1047169) (not e!852339))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1529464 (= res!1047169 (validKeyInArray!0 (select (arr!49036 a!2804) i!961)))))

(declare-fun e!852340 () Bool)

(declare-fun b!1529465 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101622 (_ BitVec 32)) SeekEntryResult!13201)

(assert (=> b!1529465 (= e!852340 (= (seekEntry!0 (select (arr!49036 a!2804) j!70) a!2804 mask!2512) (Found!13201 j!70)))))

(declare-fun b!1529466 () Bool)

(declare-fun res!1047176 () Bool)

(assert (=> b!1529466 (=> (not res!1047176) (not e!852339))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101622 (_ BitVec 32)) Bool)

(assert (=> b!1529466 (= res!1047176 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1529467 () Bool)

(declare-fun e!852343 () Bool)

(assert (=> b!1529467 (= e!852341 (not e!852343))))

(declare-fun res!1047171 () Bool)

(assert (=> b!1529467 (=> res!1047171 e!852343)))

(assert (=> b!1529467 (= res!1047171 (or (not (= (select (arr!49036 a!2804) j!70) (select (store (arr!49036 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1529467 e!852340))

(declare-fun res!1047174 () Bool)

(assert (=> b!1529467 (=> (not res!1047174) (not e!852340))))

(assert (=> b!1529467 (= res!1047174 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51186 0))(
  ( (Unit!51187) )
))
(declare-fun lt!662440 () Unit!51186)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101622 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51186)

(assert (=> b!1529467 (= lt!662440 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1529468 () Bool)

(declare-fun res!1047175 () Bool)

(assert (=> b!1529468 (=> (not res!1047175) (not e!852339))))

(assert (=> b!1529468 (= res!1047175 (and (= (size!49586 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49586 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49586 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1529469 () Bool)

(declare-fun res!1047173 () Bool)

(assert (=> b!1529469 (=> (not res!1047173) (not e!852339))))

(assert (=> b!1529469 (= res!1047173 (validKeyInArray!0 (select (arr!49036 a!2804) j!70)))))

(declare-fun b!1529470 () Bool)

(declare-fun res!1047168 () Bool)

(assert (=> b!1529470 (=> (not res!1047168) (not e!852339))))

(assert (=> b!1529470 (= res!1047168 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49586 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49586 a!2804))))))

(declare-fun b!1529471 () Bool)

(assert (=> b!1529471 (= e!852343 true)))

(declare-fun lt!662442 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529471 (= lt!662442 (nextIndex!0 index!487 x!534 mask!2512))))

(assert (= (and start!130272 res!1047178) b!1529468))

(assert (= (and b!1529468 res!1047175) b!1529464))

(assert (= (and b!1529464 res!1047169) b!1529469))

(assert (= (and b!1529469 res!1047173) b!1529466))

(assert (= (and b!1529466 res!1047176) b!1529462))

(assert (= (and b!1529462 res!1047170) b!1529470))

(assert (= (and b!1529470 res!1047168) b!1529463))

(assert (= (and b!1529463 res!1047177) b!1529460))

(assert (= (and b!1529460 res!1047172) b!1529461))

(assert (= (and b!1529461 res!1047167) b!1529467))

(assert (= (and b!1529467 res!1047174) b!1529465))

(assert (= (and b!1529467 (not res!1047171)) b!1529471))

(declare-fun m!1412407 () Bool)

(assert (=> b!1529471 m!1412407))

(declare-fun m!1412409 () Bool)

(assert (=> b!1529461 m!1412409))

(declare-fun m!1412411 () Bool)

(assert (=> b!1529461 m!1412411))

(assert (=> b!1529461 m!1412411))

(declare-fun m!1412413 () Bool)

(assert (=> b!1529461 m!1412413))

(assert (=> b!1529461 m!1412413))

(assert (=> b!1529461 m!1412411))

(declare-fun m!1412415 () Bool)

(assert (=> b!1529461 m!1412415))

(declare-fun m!1412417 () Bool)

(assert (=> b!1529469 m!1412417))

(assert (=> b!1529469 m!1412417))

(declare-fun m!1412419 () Bool)

(assert (=> b!1529469 m!1412419))

(assert (=> b!1529465 m!1412417))

(assert (=> b!1529465 m!1412417))

(declare-fun m!1412421 () Bool)

(assert (=> b!1529465 m!1412421))

(declare-fun m!1412423 () Bool)

(assert (=> b!1529466 m!1412423))

(declare-fun m!1412425 () Bool)

(assert (=> b!1529464 m!1412425))

(assert (=> b!1529464 m!1412425))

(declare-fun m!1412427 () Bool)

(assert (=> b!1529464 m!1412427))

(declare-fun m!1412429 () Bool)

(assert (=> start!130272 m!1412429))

(declare-fun m!1412431 () Bool)

(assert (=> start!130272 m!1412431))

(declare-fun m!1412433 () Bool)

(assert (=> b!1529462 m!1412433))

(assert (=> b!1529463 m!1412417))

(assert (=> b!1529463 m!1412417))

(declare-fun m!1412435 () Bool)

(assert (=> b!1529463 m!1412435))

(assert (=> b!1529463 m!1412435))

(assert (=> b!1529463 m!1412417))

(declare-fun m!1412437 () Bool)

(assert (=> b!1529463 m!1412437))

(assert (=> b!1529460 m!1412417))

(assert (=> b!1529460 m!1412417))

(declare-fun m!1412439 () Bool)

(assert (=> b!1529460 m!1412439))

(assert (=> b!1529467 m!1412417))

(declare-fun m!1412441 () Bool)

(assert (=> b!1529467 m!1412441))

(assert (=> b!1529467 m!1412409))

(assert (=> b!1529467 m!1412411))

(declare-fun m!1412443 () Bool)

(assert (=> b!1529467 m!1412443))

(push 1)

