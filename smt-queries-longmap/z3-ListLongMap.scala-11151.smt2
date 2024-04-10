; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130270 () Bool)

(assert start!130270)

(declare-fun b!1529424 () Bool)

(declare-fun e!852327 () Bool)

(assert (=> b!1529424 (= e!852327 true)))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun lt!662429 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529424 (= lt!662429 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1529425 () Bool)

(declare-fun e!852325 () Bool)

(assert (=> b!1529425 (= e!852325 (not e!852327))))

(declare-fun res!1047141 () Bool)

(assert (=> b!1529425 (=> res!1047141 e!852327)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((array!101620 0))(
  ( (array!101621 (arr!49035 (Array (_ BitVec 32) (_ BitVec 64))) (size!49585 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101620)

(assert (=> b!1529425 (= res!1047141 (or (not (= (select (arr!49035 a!2804) j!70) (select (store (arr!49035 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!852326 () Bool)

(assert (=> b!1529425 e!852326))

(declare-fun res!1047132 () Bool)

(assert (=> b!1529425 (=> (not res!1047132) (not e!852326))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101620 (_ BitVec 32)) Bool)

(assert (=> b!1529425 (= res!1047132 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51184 0))(
  ( (Unit!51185) )
))
(declare-fun lt!662428 () Unit!51184)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101620 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51184)

(assert (=> b!1529425 (= lt!662428 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1529426 () Bool)

(declare-fun res!1047133 () Bool)

(declare-fun e!852328 () Bool)

(assert (=> b!1529426 (=> (not res!1047133) (not e!852328))))

(declare-datatypes ((List!35518 0))(
  ( (Nil!35515) (Cons!35514 (h!36950 (_ BitVec 64)) (t!50212 List!35518)) )
))
(declare-fun arrayNoDuplicates!0 (array!101620 (_ BitVec 32) List!35518) Bool)

(assert (=> b!1529426 (= res!1047133 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35515))))

(declare-fun b!1529427 () Bool)

(assert (=> b!1529427 (= e!852328 e!852325)))

(declare-fun res!1047142 () Bool)

(assert (=> b!1529427 (=> (not res!1047142) (not e!852325))))

(declare-datatypes ((SeekEntryResult!13200 0))(
  ( (MissingZero!13200 (index!55195 (_ BitVec 32))) (Found!13200 (index!55196 (_ BitVec 32))) (Intermediate!13200 (undefined!14012 Bool) (index!55197 (_ BitVec 32)) (x!136879 (_ BitVec 32))) (Undefined!13200) (MissingVacant!13200 (index!55198 (_ BitVec 32))) )
))
(declare-fun lt!662431 () SeekEntryResult!13200)

(declare-fun lt!662430 () SeekEntryResult!13200)

(assert (=> b!1529427 (= res!1047142 (= lt!662431 lt!662430))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1529427 (= lt!662430 (Intermediate!13200 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101620 (_ BitVec 32)) SeekEntryResult!13200)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529427 (= lt!662431 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49035 a!2804) j!70) mask!2512) (select (arr!49035 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1047138 () Bool)

(assert (=> start!130270 (=> (not res!1047138) (not e!852328))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130270 (= res!1047138 (validMask!0 mask!2512))))

(assert (=> start!130270 e!852328))

(assert (=> start!130270 true))

(declare-fun array_inv!38063 (array!101620) Bool)

(assert (=> start!130270 (array_inv!38063 a!2804)))

(declare-fun b!1529428 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101620 (_ BitVec 32)) SeekEntryResult!13200)

(assert (=> b!1529428 (= e!852326 (= (seekEntry!0 (select (arr!49035 a!2804) j!70) a!2804 mask!2512) (Found!13200 j!70)))))

(declare-fun b!1529429 () Bool)

(declare-fun res!1047135 () Bool)

(assert (=> b!1529429 (=> (not res!1047135) (not e!852328))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1529429 (= res!1047135 (validKeyInArray!0 (select (arr!49035 a!2804) i!961)))))

(declare-fun b!1529430 () Bool)

(declare-fun res!1047136 () Bool)

(assert (=> b!1529430 (=> (not res!1047136) (not e!852328))))

(assert (=> b!1529430 (= res!1047136 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1529431 () Bool)

(declare-fun res!1047139 () Bool)

(assert (=> b!1529431 (=> (not res!1047139) (not e!852328))))

(assert (=> b!1529431 (= res!1047139 (validKeyInArray!0 (select (arr!49035 a!2804) j!70)))))

(declare-fun b!1529432 () Bool)

(declare-fun res!1047140 () Bool)

(assert (=> b!1529432 (=> (not res!1047140) (not e!852325))))

(assert (=> b!1529432 (= res!1047140 (= lt!662431 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49035 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49035 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101621 (store (arr!49035 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49585 a!2804)) mask!2512)))))

(declare-fun b!1529433 () Bool)

(declare-fun res!1047134 () Bool)

(assert (=> b!1529433 (=> (not res!1047134) (not e!852328))))

(assert (=> b!1529433 (= res!1047134 (and (= (size!49585 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49585 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49585 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1529434 () Bool)

(declare-fun res!1047137 () Bool)

(assert (=> b!1529434 (=> (not res!1047137) (not e!852325))))

(assert (=> b!1529434 (= res!1047137 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49035 a!2804) j!70) a!2804 mask!2512) lt!662430))))

(declare-fun b!1529435 () Bool)

(declare-fun res!1047131 () Bool)

(assert (=> b!1529435 (=> (not res!1047131) (not e!852328))))

(assert (=> b!1529435 (= res!1047131 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49585 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49585 a!2804))))))

(assert (= (and start!130270 res!1047138) b!1529433))

(assert (= (and b!1529433 res!1047134) b!1529429))

(assert (= (and b!1529429 res!1047135) b!1529431))

(assert (= (and b!1529431 res!1047139) b!1529430))

(assert (= (and b!1529430 res!1047136) b!1529426))

(assert (= (and b!1529426 res!1047133) b!1529435))

(assert (= (and b!1529435 res!1047131) b!1529427))

(assert (= (and b!1529427 res!1047142) b!1529434))

(assert (= (and b!1529434 res!1047137) b!1529432))

(assert (= (and b!1529432 res!1047140) b!1529425))

(assert (= (and b!1529425 res!1047132) b!1529428))

(assert (= (and b!1529425 (not res!1047141)) b!1529424))

(declare-fun m!1412369 () Bool)

(assert (=> b!1529428 m!1412369))

(assert (=> b!1529428 m!1412369))

(declare-fun m!1412371 () Bool)

(assert (=> b!1529428 m!1412371))

(declare-fun m!1412373 () Bool)

(assert (=> b!1529424 m!1412373))

(assert (=> b!1529431 m!1412369))

(assert (=> b!1529431 m!1412369))

(declare-fun m!1412375 () Bool)

(assert (=> b!1529431 m!1412375))

(declare-fun m!1412377 () Bool)

(assert (=> b!1529430 m!1412377))

(assert (=> b!1529434 m!1412369))

(assert (=> b!1529434 m!1412369))

(declare-fun m!1412379 () Bool)

(assert (=> b!1529434 m!1412379))

(assert (=> b!1529427 m!1412369))

(assert (=> b!1529427 m!1412369))

(declare-fun m!1412381 () Bool)

(assert (=> b!1529427 m!1412381))

(assert (=> b!1529427 m!1412381))

(assert (=> b!1529427 m!1412369))

(declare-fun m!1412383 () Bool)

(assert (=> b!1529427 m!1412383))

(declare-fun m!1412385 () Bool)

(assert (=> b!1529429 m!1412385))

(assert (=> b!1529429 m!1412385))

(declare-fun m!1412387 () Bool)

(assert (=> b!1529429 m!1412387))

(assert (=> b!1529425 m!1412369))

(declare-fun m!1412389 () Bool)

(assert (=> b!1529425 m!1412389))

(declare-fun m!1412391 () Bool)

(assert (=> b!1529425 m!1412391))

(declare-fun m!1412393 () Bool)

(assert (=> b!1529425 m!1412393))

(declare-fun m!1412395 () Bool)

(assert (=> b!1529425 m!1412395))

(assert (=> b!1529432 m!1412391))

(assert (=> b!1529432 m!1412393))

(assert (=> b!1529432 m!1412393))

(declare-fun m!1412397 () Bool)

(assert (=> b!1529432 m!1412397))

(assert (=> b!1529432 m!1412397))

(assert (=> b!1529432 m!1412393))

(declare-fun m!1412399 () Bool)

(assert (=> b!1529432 m!1412399))

(declare-fun m!1412401 () Bool)

(assert (=> b!1529426 m!1412401))

(declare-fun m!1412403 () Bool)

(assert (=> start!130270 m!1412403))

(declare-fun m!1412405 () Bool)

(assert (=> start!130270 m!1412405))

(check-sat (not b!1529427) (not start!130270) (not b!1529430) (not b!1529425) (not b!1529431) (not b!1529428) (not b!1529426) (not b!1529432) (not b!1529424) (not b!1529429) (not b!1529434))
(check-sat)
