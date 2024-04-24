; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36336 () Bool)

(assert start!36336)

(declare-fun b!363644 () Bool)

(declare-fun res!202854 () Bool)

(declare-fun e!222645 () Bool)

(assert (=> b!363644 (=> (not res!202854) (not e!222645))))

(declare-datatypes ((array!20611 0))(
  ( (array!20612 (arr!9784 (Array (_ BitVec 32) (_ BitVec 64))) (size!10136 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20611)

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363644 (= res!202854 (not (validKeyInArray!0 (select (arr!9784 a!4289) i!1472))))))

(declare-fun b!363645 () Bool)

(declare-fun e!222646 () Bool)

(assert (=> b!363645 (= e!222645 e!222646)))

(declare-fun res!202851 () Bool)

(assert (=> b!363645 (=> (not res!202851) (not e!222646))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun lt!167846 () (_ BitVec 32))

(declare-fun lt!167843 () (_ BitVec 32))

(assert (=> b!363645 (= res!202851 (and (= lt!167843 (bvadd #b00000000000000000000000000000001 lt!167846)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(declare-fun lt!167845 () array!20611)

(declare-fun arrayCountValidKeys!0 (array!20611 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363645 (= lt!167843 (arrayCountValidKeys!0 lt!167845 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363645 (= lt!167846 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun k!2974 () (_ BitVec 64))

(assert (=> b!363645 (= lt!167845 (array!20612 (store (arr!9784 a!4289) i!1472 k!2974) (size!10136 a!4289)))))

(declare-fun b!363646 () Bool)

(declare-fun res!202853 () Bool)

(assert (=> b!363646 (=> (not res!202853) (not e!222645))))

(assert (=> b!363646 (= res!202853 (validKeyInArray!0 k!2974))))

(declare-fun res!202852 () Bool)

(assert (=> start!36336 (=> (not res!202852) (not e!222645))))

(assert (=> start!36336 (= res!202852 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10136 a!4289))))))

(assert (=> start!36336 e!222645))

(assert (=> start!36336 true))

(declare-fun array_inv!7256 (array!20611) Bool)

(assert (=> start!36336 (array_inv!7256 a!4289)))

(declare-fun b!363647 () Bool)

(assert (=> b!363647 (= e!222646 (not true))))

(assert (=> b!363647 (= (bvadd (arrayCountValidKeys!0 lt!167845 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!167843) (arrayCountValidKeys!0 lt!167845 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11247 0))(
  ( (Unit!11248) )
))
(declare-fun lt!167844 () Unit!11247)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20611 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11247)

(assert (=> b!363647 (= lt!167844 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!167845 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(assert (=> b!363647 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!167846) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!167842 () Unit!11247)

(assert (=> b!363647 (= lt!167842 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!363648 () Bool)

(declare-fun res!202855 () Bool)

(assert (=> b!363648 (=> (not res!202855) (not e!222645))))

(assert (=> b!363648 (= res!202855 (and (bvslt (size!10136 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10136 a!4289)) (bvsge i!1472 from!3650)))))

(assert (= (and start!36336 res!202852) b!363644))

(assert (= (and b!363644 res!202854) b!363646))

(assert (= (and b!363646 res!202853) b!363648))

(assert (= (and b!363648 res!202855) b!363645))

(assert (= (and b!363645 res!202851) b!363647))

(declare-fun m!361065 () Bool)

(assert (=> start!36336 m!361065))

(declare-fun m!361067 () Bool)

(assert (=> b!363646 m!361067))

(declare-fun m!361069 () Bool)

(assert (=> b!363647 m!361069))

(declare-fun m!361071 () Bool)

(assert (=> b!363647 m!361071))

(declare-fun m!361073 () Bool)

(assert (=> b!363647 m!361073))

(declare-fun m!361075 () Bool)

(assert (=> b!363647 m!361075))

(declare-fun m!361077 () Bool)

(assert (=> b!363647 m!361077))

(declare-fun m!361079 () Bool)

(assert (=> b!363647 m!361079))

(declare-fun m!361081 () Bool)

(assert (=> b!363645 m!361081))

(declare-fun m!361083 () Bool)

(assert (=> b!363645 m!361083))

(declare-fun m!361085 () Bool)

(assert (=> b!363645 m!361085))

(declare-fun m!361087 () Bool)

(assert (=> b!363644 m!361087))

(assert (=> b!363644 m!361087))

(declare-fun m!361089 () Bool)

(assert (=> b!363644 m!361089))

(push 1)

(assert (not b!363646))

(assert (not start!36336))

(assert (not b!363645))

(assert (not b!363644))

(assert (not b!363647))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

