; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116902 () Bool)

(assert start!116902)

(declare-fun res!918816 () Bool)

(declare-fun e!779913 () Bool)

(assert (=> start!116902 (=> (not res!918816) (not e!779913))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93457 0))(
  ( (array!93458 (arr!45127 (Array (_ BitVec 32) (_ BitVec 64))) (size!45678 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93457)

(assert (=> start!116902 (= res!918816 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45678 a!4032))))))

(assert (=> start!116902 e!779913))

(assert (=> start!116902 true))

(declare-fun array_inv!34408 (array!93457) Bool)

(assert (=> start!116902 (array_inv!34408 a!4032)))

(declare-fun b!1376543 () Bool)

(declare-fun res!918815 () Bool)

(assert (=> b!1376543 (=> (not res!918815) (not e!779913))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376543 (= res!918815 (validKeyInArray!0 (select (arr!45127 a!4032) i!1445)))))

(declare-fun b!1376544 () Bool)

(declare-fun res!918814 () Bool)

(assert (=> b!1376544 (=> (not res!918814) (not e!779913))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1376544 (= res!918814 (not (validKeyInArray!0 k0!2947)))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun b!1376545 () Bool)

(assert (=> b!1376545 (= e!779913 (and (bvslt (size!45678 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45678 a!4032)) (bvsgt to!206 i!1445) (bvslt (bvadd #b00000000000000000000000000000001 i!1445) #b00000000000000000000000000000000)))))

(assert (= (and start!116902 res!918816) b!1376543))

(assert (= (and b!1376543 res!918815) b!1376544))

(assert (= (and b!1376544 res!918814) b!1376545))

(declare-fun m!1260671 () Bool)

(assert (=> start!116902 m!1260671))

(declare-fun m!1260673 () Bool)

(assert (=> b!1376543 m!1260673))

(assert (=> b!1376543 m!1260673))

(declare-fun m!1260675 () Bool)

(assert (=> b!1376543 m!1260675))

(declare-fun m!1260677 () Bool)

(assert (=> b!1376544 m!1260677))

(check-sat (not b!1376543) (not start!116902) (not b!1376544))
(check-sat)
