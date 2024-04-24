; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36390 () Bool)

(assert start!36390)

(declare-fun b!364081 () Bool)

(declare-fun res!203291 () Bool)

(declare-fun e!222922 () Bool)

(assert (=> b!364081 (=> (not res!203291) (not e!222922))))

(declare-datatypes ((array!20665 0))(
  ( (array!20666 (arr!9811 (Array (_ BitVec 32) (_ BitVec 64))) (size!10163 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20665)

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364081 (= res!203291 (not (validKeyInArray!0 (select (arr!9811 a!4289) i!1472))))))

(declare-fun b!364082 () Bool)

(declare-fun e!222921 () Bool)

(assert (=> b!364082 (= e!222921 true)))

(declare-fun lt!168408 () array!20665)

(declare-fun arrayCountValidKeys!0 (array!20665 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364082 (= (arrayCountValidKeys!0 lt!168408 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4289 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472))))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun k!2974 () (_ BitVec 64))

(declare-datatypes ((Unit!11301 0))(
  ( (Unit!11302) )
))
(declare-fun lt!168407 () Unit!11301)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20665 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11301)

(assert (=> b!364082 (= lt!168407 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4289 i!1472 k!2974 (bvsub from!3650 #b00000000000000000000000000000001)))))

(declare-fun res!203288 () Bool)

(assert (=> start!36390 (=> (not res!203288) (not e!222922))))

(assert (=> start!36390 (= res!203288 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10163 a!4289))))))

(assert (=> start!36390 e!222922))

(assert (=> start!36390 true))

(declare-fun array_inv!7283 (array!20665) Bool)

(assert (=> start!36390 (array_inv!7283 a!4289)))

(declare-fun b!364083 () Bool)

(declare-fun e!222923 () Bool)

(assert (=> b!364083 (= e!222922 e!222923)))

(declare-fun res!203289 () Bool)

(assert (=> b!364083 (=> (not res!203289) (not e!222923))))

(declare-fun lt!168416 () (_ BitVec 32))

(declare-fun lt!168415 () (_ BitVec 32))

(assert (=> b!364083 (= res!203289 (and (= lt!168416 (bvadd #b00000000000000000000000000000001 lt!168415)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(assert (=> b!364083 (= lt!168416 (arrayCountValidKeys!0 lt!168408 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364083 (= lt!168415 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364083 (= lt!168408 (array!20666 (store (arr!9811 a!4289) i!1472 k!2974) (size!10163 a!4289)))))

(declare-fun b!364084 () Bool)

(declare-fun res!203290 () Bool)

(assert (=> b!364084 (=> (not res!203290) (not e!222922))))

(assert (=> b!364084 (= res!203290 (validKeyInArray!0 k!2974))))

(declare-fun b!364085 () Bool)

(assert (=> b!364085 (= e!222923 (not e!222921))))

(declare-fun res!203293 () Bool)

(assert (=> b!364085 (=> res!203293 e!222921)))

(declare-fun lt!168410 () (_ BitVec 32))

(declare-fun lt!168413 () (_ BitVec 32))

(assert (=> b!364085 (= res!203293 (or (bvsgt (bvsub from!3650 #b00000000000000000000000000000001) (size!10163 a!4289)) (bvslt i!1472 (bvsub from!3650 #b00000000000000000000000000000001)) (not (= lt!168413 (bvadd #b00000000000000000000000000000001 lt!168410)))))))

(declare-fun lt!168409 () (_ BitVec 32))

(assert (=> b!364085 (= (bvadd lt!168409 lt!168416) lt!168413)))

(assert (=> b!364085 (= lt!168413 (arrayCountValidKeys!0 lt!168408 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364085 (= lt!168409 (arrayCountValidKeys!0 lt!168408 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-fun lt!168411 () Unit!11301)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20665 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11301)

(assert (=> b!364085 (= lt!168411 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168408 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!168412 () (_ BitVec 32))

(assert (=> b!364085 (= (bvadd lt!168412 lt!168415) lt!168410)))

(assert (=> b!364085 (= lt!168410 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364085 (= lt!168412 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-fun lt!168414 () Unit!11301)

(assert (=> b!364085 (= lt!168414 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!364086 () Bool)

(declare-fun res!203292 () Bool)

(assert (=> b!364086 (=> (not res!203292) (not e!222922))))

(assert (=> b!364086 (= res!203292 (and (bvslt (size!10163 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10163 a!4289)) (bvsge i!1472 from!3650)))))

(assert (= (and start!36390 res!203288) b!364081))

(assert (= (and b!364081 res!203291) b!364084))

(assert (= (and b!364084 res!203290) b!364086))

(assert (= (and b!364086 res!203292) b!364083))

(assert (= (and b!364083 res!203289) b!364085))

(assert (= (and b!364085 (not res!203293)) b!364082))

(declare-fun m!361827 () Bool)

(assert (=> b!364081 m!361827))

(assert (=> b!364081 m!361827))

(declare-fun m!361829 () Bool)

(assert (=> b!364081 m!361829))

(declare-fun m!361831 () Bool)

(assert (=> start!36390 m!361831))

(declare-fun m!361833 () Bool)

(assert (=> b!364082 m!361833))

(declare-fun m!361835 () Bool)

(assert (=> b!364082 m!361835))

(declare-fun m!361837 () Bool)

(assert (=> b!364082 m!361837))

(declare-fun m!361839 () Bool)

(assert (=> b!364085 m!361839))

(declare-fun m!361841 () Bool)

(assert (=> b!364085 m!361841))

(declare-fun m!361843 () Bool)

(assert (=> b!364085 m!361843))

(declare-fun m!361845 () Bool)

(assert (=> b!364085 m!361845))

(declare-fun m!361847 () Bool)

(assert (=> b!364085 m!361847))

(declare-fun m!361849 () Bool)

(assert (=> b!364085 m!361849))

(declare-fun m!361851 () Bool)

(assert (=> b!364084 m!361851))

(declare-fun m!361853 () Bool)

(assert (=> b!364083 m!361853))

(declare-fun m!361855 () Bool)

(assert (=> b!364083 m!361855))

(declare-fun m!361857 () Bool)

(assert (=> b!364083 m!361857))

(push 1)

(assert (not b!364083))

(assert (not b!364081))

(assert (not b!364084))

(assert (not start!36390))

(assert (not b!364085))

(assert (not b!364082))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

