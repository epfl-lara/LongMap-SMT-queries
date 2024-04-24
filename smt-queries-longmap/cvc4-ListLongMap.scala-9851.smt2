; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117024 () Bool)

(assert start!117024)

(declare-fun b!1377714 () Bool)

(declare-fun res!919805 () Bool)

(declare-fun e!780568 () Bool)

(assert (=> b!1377714 (=> (not res!919805) (not e!780568))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93579 0))(
  ( (array!93580 (arr!45188 (Array (_ BitVec 32) (_ BitVec 64))) (size!45739 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93579)

(assert (=> b!1377714 (= res!919805 (and (bvslt (size!45739 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45739 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1377715 () Bool)

(declare-fun res!919809 () Bool)

(assert (=> b!1377715 (=> (not res!919809) (not e!780568))))

(declare-fun k!2947 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377715 (= res!919809 (not (validKeyInArray!0 k!2947)))))

(declare-fun res!919807 () Bool)

(assert (=> start!117024 (=> (not res!919807) (not e!780568))))

(assert (=> start!117024 (= res!919807 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45739 a!4032))))))

(assert (=> start!117024 e!780568))

(assert (=> start!117024 true))

(declare-fun array_inv!34469 (array!93579) Bool)

(assert (=> start!117024 (array_inv!34469 a!4032)))

(declare-fun b!1377716 () Bool)

(assert (=> b!1377716 (= e!780568 (bvslt (bvsub (bvadd #b00000000000000000000000000000001 (size!45739 a!4032)) to!206) #b00000000000000000000000000000000))))

(declare-fun b!1377717 () Bool)

(declare-fun res!919806 () Bool)

(assert (=> b!1377717 (=> (not res!919806) (not e!780568))))

(assert (=> b!1377717 (= res!919806 (validKeyInArray!0 (select (arr!45188 a!4032) i!1445)))))

(declare-fun b!1377718 () Bool)

(declare-fun res!919808 () Bool)

(assert (=> b!1377718 (=> (not res!919808) (not e!780568))))

(declare-fun arrayCountValidKeys!0 (array!93579 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377718 (= res!919808 (= (arrayCountValidKeys!0 (array!93580 (store (arr!45188 a!4032) i!1445 k!2947) (size!45739 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206)))))

(assert (= (and start!117024 res!919807) b!1377717))

(assert (= (and b!1377717 res!919806) b!1377715))

(assert (= (and b!1377715 res!919809) b!1377714))

(assert (= (and b!1377714 res!919805) b!1377718))

(assert (= (and b!1377718 res!919808) b!1377716))

(declare-fun m!1262105 () Bool)

(assert (=> b!1377715 m!1262105))

(declare-fun m!1262107 () Bool)

(assert (=> start!117024 m!1262107))

(declare-fun m!1262109 () Bool)

(assert (=> b!1377717 m!1262109))

(assert (=> b!1377717 m!1262109))

(declare-fun m!1262111 () Bool)

(assert (=> b!1377717 m!1262111))

(declare-fun m!1262113 () Bool)

(assert (=> b!1377718 m!1262113))

(declare-fun m!1262115 () Bool)

(assert (=> b!1377718 m!1262115))

(declare-fun m!1262117 () Bool)

(assert (=> b!1377718 m!1262117))

(push 1)

(assert (not start!117024))

(assert (not b!1377715))

(assert (not b!1377717))

(assert (not b!1377718))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

