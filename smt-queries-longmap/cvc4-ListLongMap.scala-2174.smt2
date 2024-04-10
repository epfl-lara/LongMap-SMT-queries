; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36382 () Bool)

(assert start!36382)

(declare-fun b!363933 () Bool)

(declare-fun res!203094 () Bool)

(declare-fun e!222822 () Bool)

(assert (=> b!363933 (=> (not res!203094) (not e!222822))))

(declare-datatypes ((array!20662 0))(
  ( (array!20663 (arr!9810 (Array (_ BitVec 32) (_ BitVec 64))) (size!10162 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20662)

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363933 (= res!203094 (not (validKeyInArray!0 (select (arr!9810 a!4289) i!1472))))))

(declare-fun b!363934 () Bool)

(declare-fun res!203097 () Bool)

(assert (=> b!363934 (=> (not res!203097) (not e!222822))))

(declare-fun k!2974 () (_ BitVec 64))

(assert (=> b!363934 (= res!203097 (validKeyInArray!0 k!2974))))

(declare-fun b!363935 () Bool)

(declare-fun res!203098 () Bool)

(assert (=> b!363935 (=> (not res!203098) (not e!222822))))

(declare-fun from!3650 () (_ BitVec 32))

(assert (=> b!363935 (= res!203098 (and (bvslt (size!10162 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10162 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun res!203095 () Bool)

(assert (=> start!36382 (=> (not res!203095) (not e!222822))))

(assert (=> start!36382 (= res!203095 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10162 a!4289))))))

(assert (=> start!36382 e!222822))

(assert (=> start!36382 true))

(declare-fun array_inv!7252 (array!20662) Bool)

(assert (=> start!36382 (array_inv!7252 a!4289)))

(declare-fun b!363936 () Bool)

(declare-fun e!222821 () Bool)

(assert (=> b!363936 (= e!222821 (not true))))

(declare-fun lt!168065 () (_ BitVec 32))

(declare-fun lt!168064 () array!20662)

(declare-fun arrayCountValidKeys!0 (array!20662 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363936 (= (bvadd (arrayCountValidKeys!0 lt!168064 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168065) (arrayCountValidKeys!0 lt!168064 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11290 0))(
  ( (Unit!11291) )
))
(declare-fun lt!168066 () Unit!11290)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20662 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11290)

(assert (=> b!363936 (= lt!168066 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168064 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!168063 () (_ BitVec 32))

(assert (=> b!363936 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168063) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!168067 () Unit!11290)

(assert (=> b!363936 (= lt!168067 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!363937 () Bool)

(assert (=> b!363937 (= e!222822 e!222821)))

(declare-fun res!203096 () Bool)

(assert (=> b!363937 (=> (not res!203096) (not e!222821))))

(assert (=> b!363937 (= res!203096 (and (= lt!168065 (bvadd #b00000000000000000000000000000001 lt!168063)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(assert (=> b!363937 (= lt!168065 (arrayCountValidKeys!0 lt!168064 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363937 (= lt!168063 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363937 (= lt!168064 (array!20663 (store (arr!9810 a!4289) i!1472 k!2974) (size!10162 a!4289)))))

(assert (= (and start!36382 res!203095) b!363933))

(assert (= (and b!363933 res!203094) b!363934))

(assert (= (and b!363934 res!203097) b!363935))

(assert (= (and b!363935 res!203098) b!363937))

(assert (= (and b!363937 res!203096) b!363936))

(declare-fun m!361251 () Bool)

(assert (=> b!363933 m!361251))

(assert (=> b!363933 m!361251))

(declare-fun m!361253 () Bool)

(assert (=> b!363933 m!361253))

(declare-fun m!361255 () Bool)

(assert (=> start!36382 m!361255))

(declare-fun m!361257 () Bool)

(assert (=> b!363937 m!361257))

(declare-fun m!361259 () Bool)

(assert (=> b!363937 m!361259))

(declare-fun m!361261 () Bool)

(assert (=> b!363937 m!361261))

(declare-fun m!361263 () Bool)

(assert (=> b!363934 m!361263))

(declare-fun m!361265 () Bool)

(assert (=> b!363936 m!361265))

(declare-fun m!361267 () Bool)

(assert (=> b!363936 m!361267))

(declare-fun m!361269 () Bool)

(assert (=> b!363936 m!361269))

(declare-fun m!361271 () Bool)

(assert (=> b!363936 m!361271))

(declare-fun m!361273 () Bool)

(assert (=> b!363936 m!361273))

(declare-fun m!361275 () Bool)

(assert (=> b!363936 m!361275))

(push 1)

(assert (not b!363936))

(assert (not b!363937))

(assert (not b!363933))

(assert (not b!363934))

(assert (not start!36382))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

