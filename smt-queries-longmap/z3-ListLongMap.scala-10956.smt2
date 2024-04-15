; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128192 () Bool)

(assert start!128192)

(declare-fun b!1505093 () Bool)

(declare-fun res!1025745 () Bool)

(declare-fun e!841202 () Bool)

(assert (=> b!1505093 (=> (not res!1025745) (not e!841202))))

(declare-datatypes ((array!100345 0))(
  ( (array!100346 (arr!48424 (Array (_ BitVec 32) (_ BitVec 64))) (size!48976 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100345)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1505093 (= res!1025745 (validKeyInArray!0 (select (arr!48424 a!2804) i!961)))))

(declare-fun b!1505095 () Bool)

(assert (=> b!1505095 (= e!841202 (bvsgt #b00000000000000000000000000000000 (size!48976 a!2804)))))

(declare-fun res!1025746 () Bool)

(assert (=> start!128192 (=> (not res!1025746) (not e!841202))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128192 (= res!1025746 (validMask!0 mask!2512))))

(assert (=> start!128192 e!841202))

(assert (=> start!128192 true))

(declare-fun array_inv!37657 (array!100345) Bool)

(assert (=> start!128192 (array_inv!37657 a!2804)))

(declare-fun b!1505092 () Bool)

(declare-fun res!1025744 () Bool)

(assert (=> b!1505092 (=> (not res!1025744) (not e!841202))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1505092 (= res!1025744 (and (= (size!48976 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!48976 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!48976 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1505094 () Bool)

(declare-fun res!1025747 () Bool)

(assert (=> b!1505094 (=> (not res!1025747) (not e!841202))))

(assert (=> b!1505094 (= res!1025747 (validKeyInArray!0 (select (arr!48424 a!2804) j!70)))))

(assert (= (and start!128192 res!1025746) b!1505092))

(assert (= (and b!1505092 res!1025744) b!1505093))

(assert (= (and b!1505093 res!1025745) b!1505094))

(assert (= (and b!1505094 res!1025747) b!1505095))

(declare-fun m!1387625 () Bool)

(assert (=> b!1505093 m!1387625))

(assert (=> b!1505093 m!1387625))

(declare-fun m!1387627 () Bool)

(assert (=> b!1505093 m!1387627))

(declare-fun m!1387629 () Bool)

(assert (=> start!128192 m!1387629))

(declare-fun m!1387631 () Bool)

(assert (=> start!128192 m!1387631))

(declare-fun m!1387633 () Bool)

(assert (=> b!1505094 m!1387633))

(assert (=> b!1505094 m!1387633))

(declare-fun m!1387635 () Bool)

(assert (=> b!1505094 m!1387635))

(check-sat (not b!1505093) (not b!1505094) (not start!128192))
(check-sat)
