; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136788 () Bool)

(assert start!136788)

(declare-fun res!1078641 () Bool)

(declare-fun e!880565 () Bool)

(assert (=> start!136788 (=> (not res!1078641) (not e!880565))))

(declare-fun from!2937 () (_ BitVec 32))

(declare-datatypes ((array!105786 0))(
  ( (array!105787 (arr!51003 (Array (_ BitVec 32) (_ BitVec 64))) (size!51553 (_ BitVec 32))) )
))
(declare-fun a!3559 () array!105786)

(assert (=> start!136788 (= res!1078641 (and (bvsge from!2937 #b00000000000000000000000000000000) (bvslt from!2937 (size!51553 a!3559)) (bvslt (size!51553 a!3559) #b01111111111111111111111111111111)))))

(assert (=> start!136788 e!880565))

(assert (=> start!136788 true))

(declare-fun array_inv!39730 (array!105786) Bool)

(assert (=> start!136788 (array_inv!39730 a!3559)))

(declare-fun b!1578700 () Bool)

(declare-fun res!1078639 () Bool)

(assert (=> b!1578700 (=> (not res!1078639) (not e!880565))))

(declare-fun k!2792 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!105786 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1578700 (= res!1078639 (arrayContainsKey!0 a!3559 k!2792 from!2937))))

(declare-fun b!1578701 () Bool)

(declare-fun res!1078640 () Bool)

(assert (=> b!1578701 (=> (not res!1078640) (not e!880565))))

(assert (=> b!1578701 (= res!1078640 (and (bvsgt from!2937 #b00000000000000000000000000000000) (bvslt (bvsub from!2937 #b00000000000000000000000000000001) (size!51553 a!3559))))))

(declare-fun b!1578702 () Bool)

(assert (=> b!1578702 (= e!880565 (not (arrayContainsKey!0 a!3559 k!2792 (bvsub from!2937 #b00000000000000000000000000000001))))))

(assert (= (and start!136788 res!1078641) b!1578700))

(assert (= (and b!1578700 res!1078639) b!1578701))

(assert (= (and b!1578701 res!1078640) b!1578702))

(declare-fun m!1450747 () Bool)

(assert (=> start!136788 m!1450747))

(declare-fun m!1450749 () Bool)

(assert (=> b!1578700 m!1450749))

(declare-fun m!1450751 () Bool)

(assert (=> b!1578702 m!1450751))

(push 1)

(assert (not b!1578700))

(assert (not b!1578702))

(assert (not start!136788))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!166129 () Bool)

(declare-fun res!1078658 () Bool)

(declare-fun e!880582 () Bool)

(assert (=> d!166129 (=> res!1078658 e!880582)))

(assert (=> d!166129 (= res!1078658 (= (select (arr!51003 a!3559) from!2937) k!2792))))

(assert (=> d!166129 (= (arrayContainsKey!0 a!3559 k!2792 from!2937) e!880582)))

(declare-fun b!1578719 () Bool)

(declare-fun e!880583 () Bool)

(assert (=> b!1578719 (= e!880582 e!880583)))

(declare-fun res!1078659 () Bool)

(assert (=> b!1578719 (=> (not res!1078659) (not e!880583))))

