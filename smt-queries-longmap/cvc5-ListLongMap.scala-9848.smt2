; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116774 () Bool)

(assert start!116774)

(declare-fun b!1376231 () Bool)

(declare-fun res!919148 () Bool)

(declare-fun e!779640 () Bool)

(assert (=> b!1376231 (=> (not res!919148) (not e!779640))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93397 0))(
  ( (array!93398 (arr!45102 (Array (_ BitVec 32) (_ BitVec 64))) (size!45654 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93397)

(assert (=> b!1376231 (= res!919148 (and (bvslt (size!45654 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45654 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun res!919150 () Bool)

(assert (=> start!116774 (=> (not res!919150) (not e!779640))))

(assert (=> start!116774 (= res!919150 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45654 a!4032))))))

(assert (=> start!116774 e!779640))

(assert (=> start!116774 true))

(declare-fun array_inv!34335 (array!93397) Bool)

(assert (=> start!116774 (array_inv!34335 a!4032)))

(declare-fun b!1376232 () Bool)

(assert (=> b!1376232 (= e!779640 false)))

(declare-fun lt!605084 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93397 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376232 (= lt!605084 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k!2947 () (_ BitVec 64))

(declare-fun lt!605083 () (_ BitVec 32))

(assert (=> b!1376232 (= lt!605083 (arrayCountValidKeys!0 (array!93398 (store (arr!45102 a!4032) i!1445 k!2947) (size!45654 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1376229 () Bool)

(declare-fun res!919149 () Bool)

(assert (=> b!1376229 (=> (not res!919149) (not e!779640))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376229 (= res!919149 (validKeyInArray!0 (select (arr!45102 a!4032) i!1445)))))

(declare-fun b!1376230 () Bool)

(declare-fun res!919151 () Bool)

(assert (=> b!1376230 (=> (not res!919151) (not e!779640))))

(assert (=> b!1376230 (= res!919151 (not (validKeyInArray!0 k!2947)))))

(assert (= (and start!116774 res!919150) b!1376229))

(assert (= (and b!1376229 res!919149) b!1376230))

(assert (= (and b!1376230 res!919151) b!1376231))

(assert (= (and b!1376231 res!919148) b!1376232))

(declare-fun m!1259859 () Bool)

(assert (=> start!116774 m!1259859))

(declare-fun m!1259861 () Bool)

(assert (=> b!1376232 m!1259861))

(declare-fun m!1259863 () Bool)

(assert (=> b!1376232 m!1259863))

(declare-fun m!1259865 () Bool)

(assert (=> b!1376232 m!1259865))

(declare-fun m!1259867 () Bool)

(assert (=> b!1376229 m!1259867))

(assert (=> b!1376229 m!1259867))

(declare-fun m!1259869 () Bool)

(assert (=> b!1376229 m!1259869))

(declare-fun m!1259871 () Bool)

(assert (=> b!1376230 m!1259871))

(push 1)

(assert (not b!1376230))

(assert (not b!1376232))

(assert (not start!116774))

(assert (not b!1376229))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

