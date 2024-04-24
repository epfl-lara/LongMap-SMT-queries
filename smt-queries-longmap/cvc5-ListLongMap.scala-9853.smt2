; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117038 () Bool)

(assert start!117038)

(declare-fun res!919929 () Bool)

(declare-fun e!780610 () Bool)

(assert (=> start!117038 (=> (not res!919929) (not e!780610))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93593 0))(
  ( (array!93594 (arr!45195 (Array (_ BitVec 32) (_ BitVec 64))) (size!45746 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93593)

(assert (=> start!117038 (= res!919929 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45746 a!4032))))))

(assert (=> start!117038 e!780610))

(assert (=> start!117038 true))

(declare-fun array_inv!34476 (array!93593) Bool)

(assert (=> start!117038 (array_inv!34476 a!4032)))

(declare-fun b!1377835 () Bool)

(declare-fun res!919928 () Bool)

(assert (=> b!1377835 (=> (not res!919928) (not e!780610))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377835 (= res!919928 (validKeyInArray!0 (select (arr!45195 a!4032) to!206)))))

(declare-fun b!1377836 () Bool)

(assert (=> b!1377836 (= e!780610 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1445) #b00000000000000000000000000000000) (bvsge to!206 (size!45746 a!4032))))))

(declare-fun b!1377837 () Bool)

(declare-fun res!919930 () Bool)

(assert (=> b!1377837 (=> (not res!919930) (not e!780610))))

(assert (=> b!1377837 (= res!919930 (and (bvslt (size!45746 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45746 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1377838 () Bool)

(declare-fun res!919927 () Bool)

(assert (=> b!1377838 (=> (not res!919927) (not e!780610))))

(declare-fun k!2947 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!93593 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377838 (= res!919927 (= (arrayCountValidKeys!0 (array!93594 (store (arr!45195 a!4032) i!1445 k!2947) (size!45746 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206)))))

(declare-fun b!1377839 () Bool)

(declare-fun res!919932 () Bool)

(assert (=> b!1377839 (=> (not res!919932) (not e!780610))))

(assert (=> b!1377839 (= res!919932 (not (= to!206 (size!45746 a!4032))))))

(declare-fun b!1377840 () Bool)

(declare-fun res!919926 () Bool)

(assert (=> b!1377840 (=> (not res!919926) (not e!780610))))

(assert (=> b!1377840 (= res!919926 (validKeyInArray!0 (select (arr!45195 a!4032) i!1445)))))

(declare-fun b!1377841 () Bool)

(declare-fun res!919931 () Bool)

(assert (=> b!1377841 (=> (not res!919931) (not e!780610))))

(assert (=> b!1377841 (= res!919931 (not (validKeyInArray!0 k!2947)))))

(assert (= (and start!117038 res!919929) b!1377840))

(assert (= (and b!1377840 res!919926) b!1377841))

(assert (= (and b!1377841 res!919931) b!1377837))

(assert (= (and b!1377837 res!919930) b!1377838))

(assert (= (and b!1377838 res!919927) b!1377839))

(assert (= (and b!1377839 res!919932) b!1377835))

(assert (= (and b!1377835 res!919928) b!1377836))

(declare-fun m!1262211 () Bool)

(assert (=> b!1377840 m!1262211))

(assert (=> b!1377840 m!1262211))

(declare-fun m!1262213 () Bool)

(assert (=> b!1377840 m!1262213))

(declare-fun m!1262215 () Bool)

(assert (=> b!1377838 m!1262215))

(declare-fun m!1262217 () Bool)

(assert (=> b!1377838 m!1262217))

(declare-fun m!1262219 () Bool)

(assert (=> b!1377838 m!1262219))

(declare-fun m!1262221 () Bool)

(assert (=> b!1377835 m!1262221))

(assert (=> b!1377835 m!1262221))

(declare-fun m!1262223 () Bool)

(assert (=> b!1377835 m!1262223))

(declare-fun m!1262225 () Bool)

(assert (=> start!117038 m!1262225))

(declare-fun m!1262227 () Bool)

(assert (=> b!1377841 m!1262227))

(push 1)

(assert (not b!1377835))

(assert (not start!117038))

(assert (not b!1377840))

(assert (not b!1377841))

(assert (not b!1377838))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

