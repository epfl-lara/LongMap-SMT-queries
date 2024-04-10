; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128252 () Bool)

(assert start!128252)

(declare-fun b!1505485 () Bool)

(declare-fun res!1025934 () Bool)

(declare-fun e!841440 () Bool)

(assert (=> b!1505485 (=> (not res!1025934) (not e!841440))))

(declare-datatypes ((array!100405 0))(
  ( (array!100406 (arr!48453 (Array (_ BitVec 32) (_ BitVec 64))) (size!49003 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100405)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1505485 (= res!1025934 (validKeyInArray!0 (select (arr!48453 a!2804) i!961)))))

(declare-fun b!1505486 () Bool)

(declare-fun res!1025932 () Bool)

(assert (=> b!1505486 (=> (not res!1025932) (not e!841440))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100405 (_ BitVec 32)) Bool)

(assert (=> b!1505486 (= res!1025932 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1505487 () Bool)

(assert (=> b!1505487 (= e!841440 (bvsgt #b00000000000000000000000000000000 (size!49003 a!2804)))))

(declare-fun b!1505488 () Bool)

(declare-fun res!1025935 () Bool)

(assert (=> b!1505488 (=> (not res!1025935) (not e!841440))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1505488 (= res!1025935 (and (= (size!49003 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49003 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49003 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1505489 () Bool)

(declare-fun res!1025931 () Bool)

(assert (=> b!1505489 (=> (not res!1025931) (not e!841440))))

(assert (=> b!1505489 (= res!1025931 (validKeyInArray!0 (select (arr!48453 a!2804) j!70)))))

(declare-fun res!1025933 () Bool)

(assert (=> start!128252 (=> (not res!1025933) (not e!841440))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128252 (= res!1025933 (validMask!0 mask!2512))))

(assert (=> start!128252 e!841440))

(assert (=> start!128252 true))

(declare-fun array_inv!37481 (array!100405) Bool)

(assert (=> start!128252 (array_inv!37481 a!2804)))

(assert (= (and start!128252 res!1025933) b!1505488))

(assert (= (and b!1505488 res!1025935) b!1505485))

(assert (= (and b!1505485 res!1025934) b!1505489))

(assert (= (and b!1505489 res!1025931) b!1505486))

(assert (= (and b!1505486 res!1025932) b!1505487))

(declare-fun m!1388583 () Bool)

(assert (=> b!1505485 m!1388583))

(assert (=> b!1505485 m!1388583))

(declare-fun m!1388585 () Bool)

(assert (=> b!1505485 m!1388585))

(declare-fun m!1388587 () Bool)

(assert (=> b!1505486 m!1388587))

(declare-fun m!1388589 () Bool)

(assert (=> b!1505489 m!1388589))

(assert (=> b!1505489 m!1388589))

(declare-fun m!1388591 () Bool)

(assert (=> b!1505489 m!1388591))

(declare-fun m!1388593 () Bool)

(assert (=> start!128252 m!1388593))

(declare-fun m!1388595 () Bool)

(assert (=> start!128252 m!1388595))

(check-sat (not start!128252) (not b!1505485) (not b!1505489) (not b!1505486))
(check-sat)
