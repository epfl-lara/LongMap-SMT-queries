; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128468 () Bool)

(assert start!128468)

(declare-fun b!1506401 () Bool)

(declare-fun res!1026727 () Bool)

(declare-fun e!841896 () Bool)

(assert (=> b!1506401 (=> (not res!1026727) (not e!841896))))

(declare-datatypes ((array!100480 0))(
  ( (array!100481 (arr!48483 (Array (_ BitVec 32) (_ BitVec 64))) (size!49033 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100480)

(declare-datatypes ((List!34966 0))(
  ( (Nil!34963) (Cons!34962 (h!36362 (_ BitVec 64)) (t!49660 List!34966)) )
))
(declare-fun arrayNoDuplicates!0 (array!100480 (_ BitVec 32) List!34966) Bool)

(assert (=> b!1506401 (= res!1026727 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34963))))

(declare-fun b!1506402 () Bool)

(declare-fun res!1026728 () Bool)

(assert (=> b!1506402 (=> (not res!1026728) (not e!841896))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1506402 (= res!1026728 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49033 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49033 a!2804))))))

(declare-fun res!1026730 () Bool)

(assert (=> start!128468 (=> (not res!1026730) (not e!841896))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128468 (= res!1026730 (validMask!0 mask!2512))))

(assert (=> start!128468 e!841896))

(assert (=> start!128468 true))

(declare-fun array_inv!37511 (array!100480) Bool)

(assert (=> start!128468 (array_inv!37511 a!2804)))

(declare-fun b!1506403 () Bool)

(declare-fun res!1026724 () Bool)

(assert (=> b!1506403 (=> (not res!1026724) (not e!841896))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1506403 (= res!1026724 (validKeyInArray!0 (select (arr!48483 a!2804) i!961)))))

(declare-fun b!1506404 () Bool)

(assert (=> b!1506404 (= e!841896 false)))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun lt!654229 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1506404 (= lt!654229 (toIndex!0 (select (arr!48483 a!2804) j!70) mask!2512))))

(declare-fun b!1506405 () Bool)

(declare-fun res!1026725 () Bool)

(assert (=> b!1506405 (=> (not res!1026725) (not e!841896))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100480 (_ BitVec 32)) Bool)

(assert (=> b!1506405 (= res!1026725 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1506406 () Bool)

(declare-fun res!1026726 () Bool)

(assert (=> b!1506406 (=> (not res!1026726) (not e!841896))))

(assert (=> b!1506406 (= res!1026726 (validKeyInArray!0 (select (arr!48483 a!2804) j!70)))))

(declare-fun b!1506407 () Bool)

(declare-fun res!1026729 () Bool)

(assert (=> b!1506407 (=> (not res!1026729) (not e!841896))))

(assert (=> b!1506407 (= res!1026729 (and (= (size!49033 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49033 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49033 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!128468 res!1026730) b!1506407))

(assert (= (and b!1506407 res!1026729) b!1506403))

(assert (= (and b!1506403 res!1026724) b!1506406))

(assert (= (and b!1506406 res!1026726) b!1506405))

(assert (= (and b!1506405 res!1026725) b!1506401))

(assert (= (and b!1506401 res!1026727) b!1506402))

(assert (= (and b!1506402 res!1026728) b!1506404))

(declare-fun m!1389349 () Bool)

(assert (=> b!1506404 m!1389349))

(assert (=> b!1506404 m!1389349))

(declare-fun m!1389351 () Bool)

(assert (=> b!1506404 m!1389351))

(declare-fun m!1389353 () Bool)

(assert (=> b!1506401 m!1389353))

(assert (=> b!1506406 m!1389349))

(assert (=> b!1506406 m!1389349))

(declare-fun m!1389355 () Bool)

(assert (=> b!1506406 m!1389355))

(declare-fun m!1389357 () Bool)

(assert (=> b!1506403 m!1389357))

(assert (=> b!1506403 m!1389357))

(declare-fun m!1389359 () Bool)

(assert (=> b!1506403 m!1389359))

(declare-fun m!1389361 () Bool)

(assert (=> start!128468 m!1389361))

(declare-fun m!1389363 () Bool)

(assert (=> start!128468 m!1389363))

(declare-fun m!1389365 () Bool)

(assert (=> b!1506405 m!1389365))

(check-sat (not start!128468) (not b!1506401) (not b!1506405) (not b!1506404) (not b!1506406) (not b!1506403))
