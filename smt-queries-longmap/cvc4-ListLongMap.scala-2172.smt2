; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36370 () Bool)

(assert start!36370)

(declare-fun b!363843 () Bool)

(declare-fun res!203007 () Bool)

(declare-fun e!222768 () Bool)

(assert (=> b!363843 (=> (not res!203007) (not e!222768))))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20650 0))(
  ( (array!20651 (arr!9804 (Array (_ BitVec 32) (_ BitVec 64))) (size!10156 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20650)

(declare-fun from!3650 () (_ BitVec 32))

(assert (=> b!363843 (= res!203007 (and (bvslt (size!10156 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10156 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun res!203006 () Bool)

(assert (=> start!36370 (=> (not res!203006) (not e!222768))))

(assert (=> start!36370 (= res!203006 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10156 a!4289))))))

(assert (=> start!36370 e!222768))

(assert (=> start!36370 true))

(declare-fun array_inv!7246 (array!20650) Bool)

(assert (=> start!36370 (array_inv!7246 a!4289)))

(declare-fun b!363844 () Bool)

(declare-fun res!203004 () Bool)

(assert (=> b!363844 (=> (not res!203004) (not e!222768))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363844 (= res!203004 (not (validKeyInArray!0 (select (arr!9804 a!4289) i!1472))))))

(declare-fun b!363845 () Bool)

(declare-fun e!222767 () Bool)

(assert (=> b!363845 (= e!222767 (not true))))

(declare-fun lt!167975 () (_ BitVec 32))

(declare-fun lt!167973 () array!20650)

(declare-fun arrayCountValidKeys!0 (array!20650 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363845 (= (bvadd (arrayCountValidKeys!0 lt!167973 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!167975) (arrayCountValidKeys!0 lt!167973 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11278 0))(
  ( (Unit!11279) )
))
(declare-fun lt!167977 () Unit!11278)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20650 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11278)

(assert (=> b!363845 (= lt!167977 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!167973 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!167976 () (_ BitVec 32))

(assert (=> b!363845 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!167976) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!167974 () Unit!11278)

(assert (=> b!363845 (= lt!167974 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!363846 () Bool)

(declare-fun res!203008 () Bool)

(assert (=> b!363846 (=> (not res!203008) (not e!222768))))

(declare-fun k!2974 () (_ BitVec 64))

(assert (=> b!363846 (= res!203008 (validKeyInArray!0 k!2974))))

(declare-fun b!363847 () Bool)

(assert (=> b!363847 (= e!222768 e!222767)))

(declare-fun res!203005 () Bool)

(assert (=> b!363847 (=> (not res!203005) (not e!222767))))

(assert (=> b!363847 (= res!203005 (and (= lt!167975 (bvadd #b00000000000000000000000000000001 lt!167976)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(assert (=> b!363847 (= lt!167975 (arrayCountValidKeys!0 lt!167973 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363847 (= lt!167976 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363847 (= lt!167973 (array!20651 (store (arr!9804 a!4289) i!1472 k!2974) (size!10156 a!4289)))))

(assert (= (and start!36370 res!203006) b!363844))

(assert (= (and b!363844 res!203004) b!363846))

(assert (= (and b!363846 res!203008) b!363843))

(assert (= (and b!363843 res!203007) b!363847))

(assert (= (and b!363847 res!203005) b!363845))

(declare-fun m!361095 () Bool)

(assert (=> b!363847 m!361095))

(declare-fun m!361097 () Bool)

(assert (=> b!363847 m!361097))

(declare-fun m!361099 () Bool)

(assert (=> b!363847 m!361099))

(declare-fun m!361101 () Bool)

(assert (=> start!36370 m!361101))

(declare-fun m!361103 () Bool)

(assert (=> b!363844 m!361103))

(assert (=> b!363844 m!361103))

(declare-fun m!361105 () Bool)

(assert (=> b!363844 m!361105))

(declare-fun m!361107 () Bool)

(assert (=> b!363846 m!361107))

(declare-fun m!361109 () Bool)

(assert (=> b!363845 m!361109))

(declare-fun m!361111 () Bool)

(assert (=> b!363845 m!361111))

(declare-fun m!361113 () Bool)

(assert (=> b!363845 m!361113))

(declare-fun m!361115 () Bool)

(assert (=> b!363845 m!361115))

(declare-fun m!361117 () Bool)

(assert (=> b!363845 m!361117))

(declare-fun m!361119 () Bool)

(assert (=> b!363845 m!361119))

(push 1)

(assert (not b!363845))

(assert (not b!363846))

(assert (not b!363847))

(assert (not start!36370))

(assert (not b!363844))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

