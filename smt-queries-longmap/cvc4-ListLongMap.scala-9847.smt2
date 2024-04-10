; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116772 () Bool)

(assert start!116772)

(declare-fun res!919141 () Bool)

(declare-fun e!779649 () Bool)

(assert (=> start!116772 (=> (not res!919141) (not e!779649))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93441 0))(
  ( (array!93442 (arr!45124 (Array (_ BitVec 32) (_ BitVec 64))) (size!45674 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93441)

(assert (=> start!116772 (= res!919141 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45674 a!4032))))))

(assert (=> start!116772 e!779649))

(assert (=> start!116772 true))

(declare-fun array_inv!34152 (array!93441) Bool)

(assert (=> start!116772 (array_inv!34152 a!4032)))

(declare-fun b!1376253 () Bool)

(declare-fun to!206 () (_ BitVec 32))

(assert (=> b!1376253 (= e!779649 (and (= to!206 (size!45674 a!4032)) (bvslt (bvadd #b00000000000000000000000000000001 i!1445) #b00000000000000000000000000000000)))))

(declare-fun b!1376254 () Bool)

(declare-fun res!919138 () Bool)

(assert (=> b!1376254 (=> (not res!919138) (not e!779649))))

(assert (=> b!1376254 (= res!919138 (and (bvslt (size!45674 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45674 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1376255 () Bool)

(declare-fun res!919140 () Bool)

(assert (=> b!1376255 (=> (not res!919140) (not e!779649))))

(declare-fun k!2947 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!93441 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376255 (= res!919140 (= (arrayCountValidKeys!0 (array!93442 (store (arr!45124 a!4032) i!1445 k!2947) (size!45674 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206)))))

(declare-fun b!1376256 () Bool)

(declare-fun res!919139 () Bool)

(assert (=> b!1376256 (=> (not res!919139) (not e!779649))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376256 (= res!919139 (validKeyInArray!0 (select (arr!45124 a!4032) i!1445)))))

(declare-fun b!1376257 () Bool)

(declare-fun res!919137 () Bool)

(assert (=> b!1376257 (=> (not res!919137) (not e!779649))))

(assert (=> b!1376257 (= res!919137 (not (validKeyInArray!0 k!2947)))))

(assert (= (and start!116772 res!919141) b!1376256))

(assert (= (and b!1376256 res!919139) b!1376257))

(assert (= (and b!1376257 res!919137) b!1376254))

(assert (= (and b!1376254 res!919138) b!1376255))

(assert (= (and b!1376255 res!919140) b!1376253))

(declare-fun m!1260311 () Bool)

(assert (=> start!116772 m!1260311))

(declare-fun m!1260313 () Bool)

(assert (=> b!1376255 m!1260313))

(declare-fun m!1260315 () Bool)

(assert (=> b!1376255 m!1260315))

(declare-fun m!1260317 () Bool)

(assert (=> b!1376255 m!1260317))

(declare-fun m!1260319 () Bool)

(assert (=> b!1376256 m!1260319))

(assert (=> b!1376256 m!1260319))

(declare-fun m!1260321 () Bool)

(assert (=> b!1376256 m!1260321))

(declare-fun m!1260323 () Bool)

(assert (=> b!1376257 m!1260323))

(push 1)

(assert (not start!116772))

(assert (not b!1376255))

(assert (not b!1376257))

(assert (not b!1376256))

(check-sat)

(pop 1)

(push 1)

(check-sat)

