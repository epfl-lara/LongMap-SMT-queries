; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128546 () Bool)

(assert start!128546)

(declare-fun b!1507267 () Bool)

(declare-fun e!842553 () Bool)

(declare-datatypes ((array!100513 0))(
  ( (array!100514 (arr!48502 (Array (_ BitVec 32) (_ BitVec 64))) (size!49053 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100513)

(assert (=> b!1507267 (= e!842553 (bvsgt #b00000000000000000000000000000000 (size!49053 a!2804)))))

(declare-fun b!1507264 () Bool)

(declare-fun res!1026534 () Bool)

(assert (=> b!1507264 (=> (not res!1026534) (not e!842553))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(assert (=> b!1507264 (= res!1026534 (and (= (size!49053 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49053 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49053 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1026533 () Bool)

(assert (=> start!128546 (=> (not res!1026533) (not e!842553))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128546 (= res!1026533 (validMask!0 mask!2512))))

(assert (=> start!128546 e!842553))

(assert (=> start!128546 true))

(declare-fun array_inv!37783 (array!100513) Bool)

(assert (=> start!128546 (array_inv!37783 a!2804)))

(declare-fun b!1507266 () Bool)

(declare-fun res!1026535 () Bool)

(assert (=> b!1507266 (=> (not res!1026535) (not e!842553))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1507266 (= res!1026535 (validKeyInArray!0 (select (arr!48502 a!2804) j!70)))))

(declare-fun b!1507265 () Bool)

(declare-fun res!1026536 () Bool)

(assert (=> b!1507265 (=> (not res!1026536) (not e!842553))))

(assert (=> b!1507265 (= res!1026536 (validKeyInArray!0 (select (arr!48502 a!2804) i!961)))))

(assert (= (and start!128546 res!1026533) b!1507264))

(assert (= (and b!1507264 res!1026534) b!1507265))

(assert (= (and b!1507265 res!1026536) b!1507266))

(assert (= (and b!1507266 res!1026535) b!1507267))

(declare-fun m!1390329 () Bool)

(assert (=> start!128546 m!1390329))

(declare-fun m!1390331 () Bool)

(assert (=> start!128546 m!1390331))

(declare-fun m!1390333 () Bool)

(assert (=> b!1507266 m!1390333))

(assert (=> b!1507266 m!1390333))

(declare-fun m!1390335 () Bool)

(assert (=> b!1507266 m!1390335))

(declare-fun m!1390337 () Bool)

(assert (=> b!1507265 m!1390337))

(assert (=> b!1507265 m!1390337))

(declare-fun m!1390339 () Bool)

(assert (=> b!1507265 m!1390339))

(check-sat (not b!1507266) (not b!1507265) (not start!128546))
(check-sat)
