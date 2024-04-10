; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36360 () Bool)

(assert start!36360)

(declare-fun b!363768 () Bool)

(declare-fun res!202933 () Bool)

(declare-fun e!222724 () Bool)

(assert (=> b!363768 (=> (not res!202933) (not e!222724))))

(declare-datatypes ((array!20640 0))(
  ( (array!20641 (arr!9799 (Array (_ BitVec 32) (_ BitVec 64))) (size!10151 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20640)

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363768 (= res!202933 (not (validKeyInArray!0 (select (arr!9799 a!4289) i!1472))))))

(declare-fun res!202932 () Bool)

(assert (=> start!36360 (=> (not res!202932) (not e!222724))))

(assert (=> start!36360 (= res!202932 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10151 a!4289))))))

(assert (=> start!36360 e!222724))

(assert (=> start!36360 true))

(declare-fun array_inv!7241 (array!20640) Bool)

(assert (=> start!36360 (array_inv!7241 a!4289)))

(declare-fun b!363769 () Bool)

(declare-fun e!222723 () Bool)

(assert (=> b!363769 (= e!222723 (not true))))

(declare-fun lt!167899 () array!20640)

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun lt!167898 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20640 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363769 (= (bvadd (arrayCountValidKeys!0 lt!167899 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!167898) (arrayCountValidKeys!0 lt!167899 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11268 0))(
  ( (Unit!11269) )
))
(declare-fun lt!167901 () Unit!11268)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20640 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11268)

(assert (=> b!363769 (= lt!167901 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!167899 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!167902 () (_ BitVec 32))

(assert (=> b!363769 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!167902) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!167900 () Unit!11268)

(assert (=> b!363769 (= lt!167900 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!363770 () Bool)

(assert (=> b!363770 (= e!222724 e!222723)))

(declare-fun res!202929 () Bool)

(assert (=> b!363770 (=> (not res!202929) (not e!222723))))

(assert (=> b!363770 (= res!202929 (and (= lt!167898 (bvadd #b00000000000000000000000000000001 lt!167902)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(assert (=> b!363770 (= lt!167898 (arrayCountValidKeys!0 lt!167899 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363770 (= lt!167902 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun k!2974 () (_ BitVec 64))

(assert (=> b!363770 (= lt!167899 (array!20641 (store (arr!9799 a!4289) i!1472 k!2974) (size!10151 a!4289)))))

(declare-fun b!363771 () Bool)

(declare-fun res!202931 () Bool)

(assert (=> b!363771 (=> (not res!202931) (not e!222724))))

(assert (=> b!363771 (= res!202931 (validKeyInArray!0 k!2974))))

(declare-fun b!363772 () Bool)

(declare-fun res!202930 () Bool)

(assert (=> b!363772 (=> (not res!202930) (not e!222724))))

(assert (=> b!363772 (= res!202930 (and (bvslt (size!10151 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10151 a!4289)) (bvsge i!1472 from!3650)))))

(assert (= (and start!36360 res!202932) b!363768))

(assert (= (and b!363768 res!202933) b!363771))

(assert (= (and b!363771 res!202931) b!363772))

(assert (= (and b!363772 res!202930) b!363770))

(assert (= (and b!363770 res!202929) b!363769))

(declare-fun m!360965 () Bool)

(assert (=> b!363771 m!360965))

(declare-fun m!360967 () Bool)

(assert (=> start!36360 m!360967))

(declare-fun m!360969 () Bool)

(assert (=> b!363769 m!360969))

(declare-fun m!360971 () Bool)

(assert (=> b!363769 m!360971))

(declare-fun m!360973 () Bool)

(assert (=> b!363769 m!360973))

(declare-fun m!360975 () Bool)

(assert (=> b!363769 m!360975))

(declare-fun m!360977 () Bool)

(assert (=> b!363769 m!360977))

(declare-fun m!360979 () Bool)

(assert (=> b!363769 m!360979))

(declare-fun m!360981 () Bool)

(assert (=> b!363770 m!360981))

(declare-fun m!360983 () Bool)

(assert (=> b!363770 m!360983))

(declare-fun m!360985 () Bool)

(assert (=> b!363770 m!360985))

(declare-fun m!360987 () Bool)

(assert (=> b!363768 m!360987))

(assert (=> b!363768 m!360987))

(declare-fun m!360989 () Bool)

(assert (=> b!363768 m!360989))

(push 1)

(assert (not b!363770))

(assert (not b!363771))

(assert (not start!36360))

(assert (not b!363769))

(assert (not b!363768))

(check-sat)

(pop 1)

