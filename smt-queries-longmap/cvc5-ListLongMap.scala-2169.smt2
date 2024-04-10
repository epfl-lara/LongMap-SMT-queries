; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36348 () Bool)

(assert start!36348)

(declare-fun b!363678 () Bool)

(declare-fun res!202841 () Bool)

(declare-fun e!222670 () Bool)

(assert (=> b!363678 (=> (not res!202841) (not e!222670))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20628 0))(
  ( (array!20629 (arr!9793 (Array (_ BitVec 32) (_ BitVec 64))) (size!10145 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20628)

(assert (=> b!363678 (= res!202841 (and (bvslt (size!10145 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10145 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!363679 () Bool)

(declare-fun e!222668 () Bool)

(assert (=> b!363679 (= e!222670 e!222668)))

(declare-fun res!202842 () Bool)

(assert (=> b!363679 (=> (not res!202842) (not e!222668))))

(declare-fun lt!167811 () (_ BitVec 32))

(declare-fun lt!167808 () (_ BitVec 32))

(assert (=> b!363679 (= res!202842 (and (= lt!167811 (bvadd #b00000000000000000000000000000001 lt!167808)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(declare-fun lt!167809 () array!20628)

(declare-fun arrayCountValidKeys!0 (array!20628 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363679 (= lt!167811 (arrayCountValidKeys!0 lt!167809 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363679 (= lt!167808 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun k!2974 () (_ BitVec 64))

(assert (=> b!363679 (= lt!167809 (array!20629 (store (arr!9793 a!4289) i!1472 k!2974) (size!10145 a!4289)))))

(declare-fun b!363680 () Bool)

(assert (=> b!363680 (= e!222668 (not true))))

(assert (=> b!363680 (= (bvadd (arrayCountValidKeys!0 lt!167809 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!167811) (arrayCountValidKeys!0 lt!167809 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11256 0))(
  ( (Unit!11257) )
))
(declare-fun lt!167812 () Unit!11256)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20628 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11256)

(assert (=> b!363680 (= lt!167812 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!167809 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(assert (=> b!363680 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!167808) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!167810 () Unit!11256)

(assert (=> b!363680 (= lt!167810 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!363681 () Bool)

(declare-fun res!202843 () Bool)

(assert (=> b!363681 (=> (not res!202843) (not e!222670))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363681 (= res!202843 (not (validKeyInArray!0 (select (arr!9793 a!4289) i!1472))))))

(declare-fun res!202839 () Bool)

(assert (=> start!36348 (=> (not res!202839) (not e!222670))))

(assert (=> start!36348 (= res!202839 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10145 a!4289))))))

(assert (=> start!36348 e!222670))

(assert (=> start!36348 true))

(declare-fun array_inv!7235 (array!20628) Bool)

(assert (=> start!36348 (array_inv!7235 a!4289)))

(declare-fun b!363682 () Bool)

(declare-fun res!202840 () Bool)

(assert (=> b!363682 (=> (not res!202840) (not e!222670))))

(assert (=> b!363682 (= res!202840 (validKeyInArray!0 k!2974))))

(assert (= (and start!36348 res!202839) b!363681))

(assert (= (and b!363681 res!202843) b!363682))

(assert (= (and b!363682 res!202840) b!363678))

(assert (= (and b!363678 res!202841) b!363679))

(assert (= (and b!363679 res!202842) b!363680))

(declare-fun m!360809 () Bool)

(assert (=> b!363681 m!360809))

(assert (=> b!363681 m!360809))

(declare-fun m!360811 () Bool)

(assert (=> b!363681 m!360811))

(declare-fun m!360813 () Bool)

(assert (=> start!36348 m!360813))

(declare-fun m!360815 () Bool)

(assert (=> b!363682 m!360815))

(declare-fun m!360817 () Bool)

(assert (=> b!363680 m!360817))

(declare-fun m!360819 () Bool)

(assert (=> b!363680 m!360819))

(declare-fun m!360821 () Bool)

(assert (=> b!363680 m!360821))

(declare-fun m!360823 () Bool)

(assert (=> b!363680 m!360823))

(declare-fun m!360825 () Bool)

(assert (=> b!363680 m!360825))

(declare-fun m!360827 () Bool)

(assert (=> b!363680 m!360827))

(declare-fun m!360829 () Bool)

(assert (=> b!363679 m!360829))

(declare-fun m!360831 () Bool)

(assert (=> b!363679 m!360831))

(declare-fun m!360833 () Bool)

(assert (=> b!363679 m!360833))

(push 1)

(assert (not b!363682))

(assert (not start!36348))

(assert (not b!363681))

(assert (not b!363680))

(assert (not b!363679))

(check-sat)

