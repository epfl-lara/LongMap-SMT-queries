; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117032 () Bool)

(assert start!117032)

(declare-fun b!1377774 () Bool)

(declare-fun res!919865 () Bool)

(declare-fun e!780592 () Bool)

(assert (=> b!1377774 (=> (not res!919865) (not e!780592))))

(declare-fun k!2947 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377774 (= res!919865 (not (validKeyInArray!0 k!2947)))))

(declare-fun b!1377775 () Bool)

(declare-fun res!919867 () Bool)

(assert (=> b!1377775 (=> (not res!919867) (not e!780592))))

(declare-datatypes ((array!93587 0))(
  ( (array!93588 (arr!45192 (Array (_ BitVec 32) (_ BitVec 64))) (size!45743 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93587)

(declare-fun i!1445 () (_ BitVec 32))

(assert (=> b!1377775 (= res!919867 (validKeyInArray!0 (select (arr!45192 a!4032) i!1445)))))

(declare-fun b!1377776 () Bool)

(declare-fun to!206 () (_ BitVec 32))

(assert (=> b!1377776 (= e!780592 (and (not (= to!206 (size!45743 a!4032))) (bvsge to!206 (size!45743 a!4032))))))

(declare-fun b!1377777 () Bool)

(declare-fun res!919866 () Bool)

(assert (=> b!1377777 (=> (not res!919866) (not e!780592))))

(declare-fun arrayCountValidKeys!0 (array!93587 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377777 (= res!919866 (= (arrayCountValidKeys!0 (array!93588 (store (arr!45192 a!4032) i!1445 k!2947) (size!45743 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206)))))

(declare-fun b!1377778 () Bool)

(declare-fun res!919869 () Bool)

(assert (=> b!1377778 (=> (not res!919869) (not e!780592))))

(assert (=> b!1377778 (= res!919869 (and (bvslt (size!45743 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45743 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun res!919868 () Bool)

(assert (=> start!117032 (=> (not res!919868) (not e!780592))))

(assert (=> start!117032 (= res!919868 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45743 a!4032))))))

(assert (=> start!117032 e!780592))

(assert (=> start!117032 true))

(declare-fun array_inv!34473 (array!93587) Bool)

(assert (=> start!117032 (array_inv!34473 a!4032)))

(assert (= (and start!117032 res!919868) b!1377775))

(assert (= (and b!1377775 res!919867) b!1377774))

(assert (= (and b!1377774 res!919865) b!1377778))

(assert (= (and b!1377778 res!919869) b!1377777))

(assert (= (and b!1377777 res!919866) b!1377776))

(declare-fun m!1262161 () Bool)

(assert (=> b!1377774 m!1262161))

(declare-fun m!1262163 () Bool)

(assert (=> b!1377775 m!1262163))

(assert (=> b!1377775 m!1262163))

(declare-fun m!1262165 () Bool)

(assert (=> b!1377775 m!1262165))

(declare-fun m!1262167 () Bool)

(assert (=> b!1377777 m!1262167))

(declare-fun m!1262169 () Bool)

(assert (=> b!1377777 m!1262169))

(declare-fun m!1262171 () Bool)

(assert (=> b!1377777 m!1262171))

(declare-fun m!1262173 () Bool)

(assert (=> start!117032 m!1262173))

(push 1)

(assert (not b!1377777))

(assert (not b!1377775))

(assert (not b!1377774))

(assert (not start!117032))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

