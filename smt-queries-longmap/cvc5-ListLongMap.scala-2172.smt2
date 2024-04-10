; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36366 () Bool)

(assert start!36366)

(declare-fun b!363813 () Bool)

(declare-fun res!202975 () Bool)

(declare-fun e!222750 () Bool)

(assert (=> b!363813 (=> (not res!202975) (not e!222750))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20646 0))(
  ( (array!20647 (arr!9802 (Array (_ BitVec 32) (_ BitVec 64))) (size!10154 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20646)

(assert (=> b!363813 (= res!202975 (and (bvslt (size!10154 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10154 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!363814 () Bool)

(declare-fun e!222749 () Bool)

(assert (=> b!363814 (= e!222749 (not true))))

(declare-fun lt!167947 () (_ BitVec 32))

(declare-fun lt!167946 () array!20646)

(declare-fun arrayCountValidKeys!0 (array!20646 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363814 (= (bvadd (arrayCountValidKeys!0 lt!167946 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!167947) (arrayCountValidKeys!0 lt!167946 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11274 0))(
  ( (Unit!11275) )
))
(declare-fun lt!167944 () Unit!11274)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20646 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11274)

(assert (=> b!363814 (= lt!167944 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!167946 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!167945 () (_ BitVec 32))

(assert (=> b!363814 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!167945) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!167943 () Unit!11274)

(assert (=> b!363814 (= lt!167943 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!363815 () Bool)

(declare-fun res!202978 () Bool)

(assert (=> b!363815 (=> (not res!202978) (not e!222750))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363815 (= res!202978 (not (validKeyInArray!0 (select (arr!9802 a!4289) i!1472))))))

(declare-fun b!363816 () Bool)

(assert (=> b!363816 (= e!222750 e!222749)))

(declare-fun res!202977 () Bool)

(assert (=> b!363816 (=> (not res!202977) (not e!222749))))

(assert (=> b!363816 (= res!202977 (and (= lt!167947 (bvadd #b00000000000000000000000000000001 lt!167945)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(assert (=> b!363816 (= lt!167947 (arrayCountValidKeys!0 lt!167946 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363816 (= lt!167945 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun k!2974 () (_ BitVec 64))

(assert (=> b!363816 (= lt!167946 (array!20647 (store (arr!9802 a!4289) i!1472 k!2974) (size!10154 a!4289)))))

(declare-fun res!202976 () Bool)

(assert (=> start!36366 (=> (not res!202976) (not e!222750))))

(assert (=> start!36366 (= res!202976 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10154 a!4289))))))

(assert (=> start!36366 e!222750))

(assert (=> start!36366 true))

(declare-fun array_inv!7244 (array!20646) Bool)

(assert (=> start!36366 (array_inv!7244 a!4289)))

(declare-fun b!363817 () Bool)

(declare-fun res!202974 () Bool)

(assert (=> b!363817 (=> (not res!202974) (not e!222750))))

(assert (=> b!363817 (= res!202974 (validKeyInArray!0 k!2974))))

(assert (= (and start!36366 res!202976) b!363815))

(assert (= (and b!363815 res!202978) b!363817))

(assert (= (and b!363817 res!202974) b!363813))

(assert (= (and b!363813 res!202975) b!363816))

(assert (= (and b!363816 res!202977) b!363814))

(declare-fun m!361043 () Bool)

(assert (=> b!363815 m!361043))

(assert (=> b!363815 m!361043))

(declare-fun m!361045 () Bool)

(assert (=> b!363815 m!361045))

(declare-fun m!361047 () Bool)

(assert (=> b!363816 m!361047))

(declare-fun m!361049 () Bool)

(assert (=> b!363816 m!361049))

(declare-fun m!361051 () Bool)

(assert (=> b!363816 m!361051))

(declare-fun m!361053 () Bool)

(assert (=> b!363817 m!361053))

(declare-fun m!361055 () Bool)

(assert (=> start!36366 m!361055))

(declare-fun m!361057 () Bool)

(assert (=> b!363814 m!361057))

(declare-fun m!361059 () Bool)

(assert (=> b!363814 m!361059))

(declare-fun m!361061 () Bool)

(assert (=> b!363814 m!361061))

(declare-fun m!361063 () Bool)

(assert (=> b!363814 m!361063))

(declare-fun m!361065 () Bool)

(assert (=> b!363814 m!361065))

(declare-fun m!361067 () Bool)

(assert (=> b!363814 m!361067))

(push 1)

(assert (not b!363815))

(assert (not start!36366))

(assert (not b!363816))

(assert (not b!363817))

(assert (not b!363814))

(check-sat)

(pop 1)

