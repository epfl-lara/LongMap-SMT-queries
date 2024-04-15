; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36366 () Bool)

(assert start!36366)

(declare-fun b!363647 () Bool)

(declare-fun res!202954 () Bool)

(declare-fun e!222638 () Bool)

(assert (=> b!363647 (=> (not res!202954) (not e!222638))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20642 0))(
  ( (array!20643 (arr!9800 (Array (_ BitVec 32) (_ BitVec 64))) (size!10153 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20642)

(assert (=> b!363647 (= res!202954 (and (bvslt (size!10153 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10153 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!363648 () Bool)

(declare-fun e!222639 () Bool)

(assert (=> b!363648 (= e!222639 (not true))))

(declare-fun lt!167818 () array!20642)

(declare-fun lt!167815 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20642 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363648 (= (bvadd (arrayCountValidKeys!0 lt!167818 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!167815) (arrayCountValidKeys!0 lt!167818 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11266 0))(
  ( (Unit!11267) )
))
(declare-fun lt!167814 () Unit!11266)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20642 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11266)

(assert (=> b!363648 (= lt!167814 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!167818 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!167816 () (_ BitVec 32))

(assert (=> b!363648 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!167816) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!167817 () Unit!11266)

(assert (=> b!363648 (= lt!167817 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun res!202952 () Bool)

(assert (=> start!36366 (=> (not res!202952) (not e!222638))))

(assert (=> start!36366 (= res!202952 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10153 a!4289))))))

(assert (=> start!36366 e!222638))

(assert (=> start!36366 true))

(declare-fun array_inv!7249 (array!20642) Bool)

(assert (=> start!36366 (array_inv!7249 a!4289)))

(declare-fun b!363649 () Bool)

(declare-fun res!202950 () Bool)

(assert (=> b!363649 (=> (not res!202950) (not e!222638))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363649 (= res!202950 (not (validKeyInArray!0 (select (arr!9800 a!4289) i!1472))))))

(declare-fun b!363650 () Bool)

(assert (=> b!363650 (= e!222638 e!222639)))

(declare-fun res!202953 () Bool)

(assert (=> b!363650 (=> (not res!202953) (not e!222639))))

(assert (=> b!363650 (= res!202953 (and (= lt!167815 (bvadd #b00000000000000000000000000000001 lt!167816)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(assert (=> b!363650 (= lt!167815 (arrayCountValidKeys!0 lt!167818 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363650 (= lt!167816 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun k!2974 () (_ BitVec 64))

(assert (=> b!363650 (= lt!167818 (array!20643 (store (arr!9800 a!4289) i!1472 k!2974) (size!10153 a!4289)))))

(declare-fun b!363651 () Bool)

(declare-fun res!202951 () Bool)

(assert (=> b!363651 (=> (not res!202951) (not e!222638))))

(assert (=> b!363651 (= res!202951 (validKeyInArray!0 k!2974))))

(assert (= (and start!36366 res!202952) b!363649))

(assert (= (and b!363649 res!202950) b!363651))

(assert (= (and b!363651 res!202951) b!363647))

(assert (= (and b!363647 res!202954) b!363650))

(assert (= (and b!363650 res!202953) b!363648))

(declare-fun m!360501 () Bool)

(assert (=> b!363650 m!360501))

(declare-fun m!360503 () Bool)

(assert (=> b!363650 m!360503))

(declare-fun m!360505 () Bool)

(assert (=> b!363650 m!360505))

(declare-fun m!360507 () Bool)

(assert (=> b!363648 m!360507))

(declare-fun m!360509 () Bool)

(assert (=> b!363648 m!360509))

(declare-fun m!360511 () Bool)

(assert (=> b!363648 m!360511))

(declare-fun m!360513 () Bool)

(assert (=> b!363648 m!360513))

(declare-fun m!360515 () Bool)

(assert (=> b!363648 m!360515))

(declare-fun m!360517 () Bool)

(assert (=> b!363648 m!360517))

(declare-fun m!360519 () Bool)

(assert (=> start!36366 m!360519))

(declare-fun m!360521 () Bool)

(assert (=> b!363649 m!360521))

(assert (=> b!363649 m!360521))

(declare-fun m!360523 () Bool)

(assert (=> b!363649 m!360523))

(declare-fun m!360525 () Bool)

(assert (=> b!363651 m!360525))

(push 1)

(assert (not b!363651))

(assert (not b!363650))

(assert (not b!363649))

(assert (not b!363648))

(assert (not start!36366))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

