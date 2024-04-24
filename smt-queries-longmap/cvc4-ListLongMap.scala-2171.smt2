; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36348 () Bool)

(assert start!36348)

(declare-fun res!202942 () Bool)

(declare-fun e!222699 () Bool)

(assert (=> start!36348 (=> (not res!202942) (not e!222699))))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20623 0))(
  ( (array!20624 (arr!9790 (Array (_ BitVec 32) (_ BitVec 64))) (size!10142 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20623)

(assert (=> start!36348 (= res!202942 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10142 a!4289))))))

(assert (=> start!36348 e!222699))

(assert (=> start!36348 true))

(declare-fun array_inv!7262 (array!20623) Bool)

(assert (=> start!36348 (array_inv!7262 a!4289)))

(declare-fun b!363734 () Bool)

(declare-fun e!222701 () Bool)

(assert (=> b!363734 (= e!222701 (not true))))

(declare-fun lt!167936 () array!20623)

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun lt!167934 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20623 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363734 (= (bvadd (arrayCountValidKeys!0 lt!167936 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!167934) (arrayCountValidKeys!0 lt!167936 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11259 0))(
  ( (Unit!11260) )
))
(declare-fun lt!167935 () Unit!11259)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20623 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11259)

(assert (=> b!363734 (= lt!167935 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!167936 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!167933 () (_ BitVec 32))

(assert (=> b!363734 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!167933) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!167932 () Unit!11259)

(assert (=> b!363734 (= lt!167932 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!363735 () Bool)

(declare-fun res!202943 () Bool)

(assert (=> b!363735 (=> (not res!202943) (not e!222699))))

(assert (=> b!363735 (= res!202943 (and (bvslt (size!10142 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10142 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!363736 () Bool)

(declare-fun res!202944 () Bool)

(assert (=> b!363736 (=> (not res!202944) (not e!222699))))

(declare-fun k!2974 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363736 (= res!202944 (validKeyInArray!0 k!2974))))

(declare-fun b!363737 () Bool)

(declare-fun res!202941 () Bool)

(assert (=> b!363737 (=> (not res!202941) (not e!222699))))

(assert (=> b!363737 (= res!202941 (not (validKeyInArray!0 (select (arr!9790 a!4289) i!1472))))))

(declare-fun b!363738 () Bool)

(assert (=> b!363738 (= e!222699 e!222701)))

(declare-fun res!202945 () Bool)

(assert (=> b!363738 (=> (not res!202945) (not e!222701))))

(assert (=> b!363738 (= res!202945 (and (= lt!167934 (bvadd #b00000000000000000000000000000001 lt!167933)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(assert (=> b!363738 (= lt!167934 (arrayCountValidKeys!0 lt!167936 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363738 (= lt!167933 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363738 (= lt!167936 (array!20624 (store (arr!9790 a!4289) i!1472 k!2974) (size!10142 a!4289)))))

(assert (= (and start!36348 res!202942) b!363737))

(assert (= (and b!363737 res!202941) b!363736))

(assert (= (and b!363736 res!202944) b!363735))

(assert (= (and b!363735 res!202943) b!363738))

(assert (= (and b!363738 res!202945) b!363734))

(declare-fun m!361221 () Bool)

(assert (=> b!363736 m!361221))

(declare-fun m!361223 () Bool)

(assert (=> start!36348 m!361223))

(declare-fun m!361225 () Bool)

(assert (=> b!363737 m!361225))

(assert (=> b!363737 m!361225))

(declare-fun m!361227 () Bool)

(assert (=> b!363737 m!361227))

(declare-fun m!361229 () Bool)

(assert (=> b!363738 m!361229))

(declare-fun m!361231 () Bool)

(assert (=> b!363738 m!361231))

(declare-fun m!361233 () Bool)

(assert (=> b!363738 m!361233))

(declare-fun m!361235 () Bool)

(assert (=> b!363734 m!361235))

(declare-fun m!361237 () Bool)

(assert (=> b!363734 m!361237))

(declare-fun m!361239 () Bool)

(assert (=> b!363734 m!361239))

(declare-fun m!361241 () Bool)

(assert (=> b!363734 m!361241))

(declare-fun m!361243 () Bool)

(assert (=> b!363734 m!361243))

(declare-fun m!361245 () Bool)

(assert (=> b!363734 m!361245))

(push 1)

(assert (not b!363736))

(assert (not start!36348))

(assert (not b!363734))

(assert (not b!363738))

(assert (not b!363737))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

