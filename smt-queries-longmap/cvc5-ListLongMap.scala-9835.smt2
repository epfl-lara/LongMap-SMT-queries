; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116930 () Bool)

(assert start!116930)

(declare-fun b!1376713 () Bool)

(declare-fun res!918987 () Bool)

(declare-fun e!780006 () Bool)

(assert (=> b!1376713 (=> (not res!918987) (not e!780006))))

(declare-datatypes ((array!93485 0))(
  ( (array!93486 (arr!45141 (Array (_ BitVec 32) (_ BitVec 64))) (size!45692 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93485)

(declare-fun i!1445 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376713 (= res!918987 (validKeyInArray!0 (select (arr!45141 a!4032) i!1445)))))

(declare-fun b!1376715 () Bool)

(declare-fun res!918984 () Bool)

(assert (=> b!1376715 (=> (not res!918984) (not e!780006))))

(declare-fun to!206 () (_ BitVec 32))

(assert (=> b!1376715 (= res!918984 (and (bvslt (size!45692 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45692 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1376716 () Bool)

(assert (=> b!1376716 (= e!780006 false)))

(declare-fun lt!604839 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93485 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376716 (= lt!604839 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k!2947 () (_ BitVec 64))

(declare-fun lt!604838 () (_ BitVec 32))

(assert (=> b!1376716 (= lt!604838 (arrayCountValidKeys!0 (array!93486 (store (arr!45141 a!4032) i!1445 k!2947) (size!45692 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun res!918985 () Bool)

(assert (=> start!116930 (=> (not res!918985) (not e!780006))))

(assert (=> start!116930 (= res!918985 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45692 a!4032))))))

(assert (=> start!116930 e!780006))

(assert (=> start!116930 true))

(declare-fun array_inv!34422 (array!93485) Bool)

(assert (=> start!116930 (array_inv!34422 a!4032)))

(declare-fun b!1376714 () Bool)

(declare-fun res!918986 () Bool)

(assert (=> b!1376714 (=> (not res!918986) (not e!780006))))

(assert (=> b!1376714 (= res!918986 (not (validKeyInArray!0 k!2947)))))

(assert (= (and start!116930 res!918985) b!1376713))

(assert (= (and b!1376713 res!918987) b!1376714))

(assert (= (and b!1376714 res!918986) b!1376715))

(assert (= (and b!1376715 res!918984) b!1376716))

(declare-fun m!1260855 () Bool)

(assert (=> b!1376713 m!1260855))

(assert (=> b!1376713 m!1260855))

(declare-fun m!1260857 () Bool)

(assert (=> b!1376713 m!1260857))

(declare-fun m!1260859 () Bool)

(assert (=> b!1376716 m!1260859))

(declare-fun m!1260861 () Bool)

(assert (=> b!1376716 m!1260861))

(declare-fun m!1260863 () Bool)

(assert (=> b!1376716 m!1260863))

(declare-fun m!1260865 () Bool)

(assert (=> start!116930 m!1260865))

(declare-fun m!1260867 () Bool)

(assert (=> b!1376714 m!1260867))

(push 1)

(assert (not b!1376716))

(assert (not b!1376713))

(assert (not start!116930))

(assert (not b!1376714))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

