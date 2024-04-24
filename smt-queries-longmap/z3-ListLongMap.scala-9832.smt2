; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116908 () Bool)

(assert start!116908)

(declare-fun res!918843 () Bool)

(declare-fun e!779931 () Bool)

(assert (=> start!116908 (=> (not res!918843) (not e!779931))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93463 0))(
  ( (array!93464 (arr!45130 (Array (_ BitVec 32) (_ BitVec 64))) (size!45681 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93463)

(assert (=> start!116908 (= res!918843 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45681 a!4032))))))

(assert (=> start!116908 e!779931))

(assert (=> start!116908 true))

(declare-fun array_inv!34411 (array!93463) Bool)

(assert (=> start!116908 (array_inv!34411 a!4032)))

(declare-fun b!1376570 () Bool)

(declare-fun res!918841 () Bool)

(assert (=> b!1376570 (=> (not res!918841) (not e!779931))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376570 (= res!918841 (validKeyInArray!0 (select (arr!45130 a!4032) i!1445)))))

(declare-fun b!1376571 () Bool)

(declare-fun res!918842 () Bool)

(assert (=> b!1376571 (=> (not res!918842) (not e!779931))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1376571 (= res!918842 (not (validKeyInArray!0 k0!2947)))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun b!1376572 () Bool)

(assert (=> b!1376572 (= e!779931 (and (bvslt (size!45681 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45681 a!4032)) (bvsgt to!206 i!1445) (bvslt (bvadd #b00000000000000000000000000000001 i!1445) #b00000000000000000000000000000000)))))

(assert (= (and start!116908 res!918843) b!1376570))

(assert (= (and b!1376570 res!918841) b!1376571))

(assert (= (and b!1376571 res!918842) b!1376572))

(declare-fun m!1260695 () Bool)

(assert (=> start!116908 m!1260695))

(declare-fun m!1260697 () Bool)

(assert (=> b!1376570 m!1260697))

(assert (=> b!1376570 m!1260697))

(declare-fun m!1260699 () Bool)

(assert (=> b!1376570 m!1260699))

(declare-fun m!1260701 () Bool)

(assert (=> b!1376571 m!1260701))

(check-sat (not start!116908) (not b!1376571) (not b!1376570))
(check-sat)
