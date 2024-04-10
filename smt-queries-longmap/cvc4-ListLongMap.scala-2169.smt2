; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36352 () Bool)

(assert start!36352)

(declare-fun b!363708 () Bool)

(declare-fun res!202869 () Bool)

(declare-fun e!222688 () Bool)

(assert (=> b!363708 (=> (not res!202869) (not e!222688))))

(declare-datatypes ((array!20632 0))(
  ( (array!20633 (arr!9795 (Array (_ BitVec 32) (_ BitVec 64))) (size!10147 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20632)

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363708 (= res!202869 (not (validKeyInArray!0 (select (arr!9795 a!4289) i!1472))))))

(declare-fun b!363709 () Bool)

(declare-fun e!222687 () Bool)

(assert (=> b!363709 (= e!222688 e!222687)))

(declare-fun res!202870 () Bool)

(assert (=> b!363709 (=> (not res!202870) (not e!222687))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun lt!167841 () (_ BitVec 32))

(declare-fun lt!167838 () (_ BitVec 32))

(assert (=> b!363709 (= res!202870 (and (= lt!167841 (bvadd #b00000000000000000000000000000001 lt!167838)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(declare-fun lt!167839 () array!20632)

(declare-fun arrayCountValidKeys!0 (array!20632 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363709 (= lt!167841 (arrayCountValidKeys!0 lt!167839 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363709 (= lt!167838 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun k!2974 () (_ BitVec 64))

(assert (=> b!363709 (= lt!167839 (array!20633 (store (arr!9795 a!4289) i!1472 k!2974) (size!10147 a!4289)))))

(declare-fun b!363710 () Bool)

(declare-fun res!202873 () Bool)

(assert (=> b!363710 (=> (not res!202873) (not e!222688))))

(assert (=> b!363710 (= res!202873 (and (bvslt (size!10147 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10147 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!363711 () Bool)

(assert (=> b!363711 (= e!222687 (not true))))

(assert (=> b!363711 (= (bvadd (arrayCountValidKeys!0 lt!167839 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!167841) (arrayCountValidKeys!0 lt!167839 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11260 0))(
  ( (Unit!11261) )
))
(declare-fun lt!167840 () Unit!11260)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20632 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11260)

(assert (=> b!363711 (= lt!167840 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!167839 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(assert (=> b!363711 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!167838) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!167842 () Unit!11260)

(assert (=> b!363711 (= lt!167842 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!363712 () Bool)

(declare-fun res!202871 () Bool)

(assert (=> b!363712 (=> (not res!202871) (not e!222688))))

(assert (=> b!363712 (= res!202871 (validKeyInArray!0 k!2974))))

(declare-fun res!202872 () Bool)

(assert (=> start!36352 (=> (not res!202872) (not e!222688))))

(assert (=> start!36352 (= res!202872 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10147 a!4289))))))

(assert (=> start!36352 e!222688))

(assert (=> start!36352 true))

(declare-fun array_inv!7237 (array!20632) Bool)

(assert (=> start!36352 (array_inv!7237 a!4289)))

(assert (= (and start!36352 res!202872) b!363708))

(assert (= (and b!363708 res!202869) b!363712))

(assert (= (and b!363712 res!202871) b!363710))

(assert (= (and b!363710 res!202873) b!363709))

(assert (= (and b!363709 res!202870) b!363711))

(declare-fun m!360861 () Bool)

(assert (=> b!363708 m!360861))

(assert (=> b!363708 m!360861))

(declare-fun m!360863 () Bool)

(assert (=> b!363708 m!360863))

(declare-fun m!360865 () Bool)

(assert (=> b!363711 m!360865))

(declare-fun m!360867 () Bool)

(assert (=> b!363711 m!360867))

(declare-fun m!360869 () Bool)

(assert (=> b!363711 m!360869))

(declare-fun m!360871 () Bool)

(assert (=> b!363711 m!360871))

(declare-fun m!360873 () Bool)

(assert (=> b!363711 m!360873))

(declare-fun m!360875 () Bool)

(assert (=> b!363711 m!360875))

(declare-fun m!360877 () Bool)

(assert (=> start!36352 m!360877))

(declare-fun m!360879 () Bool)

(assert (=> b!363709 m!360879))

(declare-fun m!360881 () Bool)

(assert (=> b!363709 m!360881))

(declare-fun m!360883 () Bool)

(assert (=> b!363709 m!360883))

(declare-fun m!360885 () Bool)

(assert (=> b!363712 m!360885))

(push 1)

(assert (not b!363709))

(assert (not b!363708))

(assert (not b!363711))

(assert (not b!363712))

(assert (not start!36352))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

