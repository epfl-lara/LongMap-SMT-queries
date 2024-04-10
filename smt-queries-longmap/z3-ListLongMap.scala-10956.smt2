; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128246 () Bool)

(assert start!128246)

(declare-fun b!1505444 () Bool)

(declare-fun res!1025892 () Bool)

(declare-fun e!841423 () Bool)

(assert (=> b!1505444 (=> (not res!1025892) (not e!841423))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100399 0))(
  ( (array!100400 (arr!48450 (Array (_ BitVec 32) (_ BitVec 64))) (size!49000 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100399)

(assert (=> b!1505444 (= res!1025892 (and (= (size!49000 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49000 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49000 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1505447 () Bool)

(assert (=> b!1505447 (= e!841423 (bvsgt #b00000000000000000000000000000000 (size!49000 a!2804)))))

(declare-fun b!1505446 () Bool)

(declare-fun res!1025891 () Bool)

(assert (=> b!1505446 (=> (not res!1025891) (not e!841423))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1505446 (= res!1025891 (validKeyInArray!0 (select (arr!48450 a!2804) j!70)))))

(declare-fun b!1505445 () Bool)

(declare-fun res!1025893 () Bool)

(assert (=> b!1505445 (=> (not res!1025893) (not e!841423))))

(assert (=> b!1505445 (= res!1025893 (validKeyInArray!0 (select (arr!48450 a!2804) i!961)))))

(declare-fun res!1025890 () Bool)

(assert (=> start!128246 (=> (not res!1025890) (not e!841423))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128246 (= res!1025890 (validMask!0 mask!2512))))

(assert (=> start!128246 e!841423))

(assert (=> start!128246 true))

(declare-fun array_inv!37478 (array!100399) Bool)

(assert (=> start!128246 (array_inv!37478 a!2804)))

(assert (= (and start!128246 res!1025890) b!1505444))

(assert (= (and b!1505444 res!1025892) b!1505445))

(assert (= (and b!1505445 res!1025893) b!1505446))

(assert (= (and b!1505446 res!1025891) b!1505447))

(declare-fun m!1388545 () Bool)

(assert (=> b!1505446 m!1388545))

(assert (=> b!1505446 m!1388545))

(declare-fun m!1388547 () Bool)

(assert (=> b!1505446 m!1388547))

(declare-fun m!1388549 () Bool)

(assert (=> b!1505445 m!1388549))

(assert (=> b!1505445 m!1388549))

(declare-fun m!1388551 () Bool)

(assert (=> b!1505445 m!1388551))

(declare-fun m!1388553 () Bool)

(assert (=> start!128246 m!1388553))

(declare-fun m!1388555 () Bool)

(assert (=> start!128246 m!1388555))

(check-sat (not start!128246) (not b!1505446) (not b!1505445))
(check-sat)
