; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36378 () Bool)

(assert start!36378)

(declare-fun b!363903 () Bool)

(declare-fun res!203064 () Bool)

(declare-fun e!222803 () Bool)

(assert (=> b!363903 (=> (not res!203064) (not e!222803))))

(declare-datatypes ((array!20658 0))(
  ( (array!20659 (arr!9808 (Array (_ BitVec 32) (_ BitVec 64))) (size!10160 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20658)

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363903 (= res!203064 (not (validKeyInArray!0 (select (arr!9808 a!4289) i!1472))))))

(declare-fun b!363905 () Bool)

(declare-fun e!222805 () Bool)

(assert (=> b!363905 (= e!222805 (not true))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun lt!168033 () (_ BitVec 32))

(declare-fun lt!168037 () array!20658)

(declare-fun arrayCountValidKeys!0 (array!20658 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363905 (= (bvadd (arrayCountValidKeys!0 lt!168037 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168033) (arrayCountValidKeys!0 lt!168037 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11286 0))(
  ( (Unit!11287) )
))
(declare-fun lt!168035 () Unit!11286)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20658 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11286)

(assert (=> b!363905 (= lt!168035 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168037 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!168036 () (_ BitVec 32))

(assert (=> b!363905 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168036) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!168034 () Unit!11286)

(assert (=> b!363905 (= lt!168034 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!363906 () Bool)

(declare-fun res!203068 () Bool)

(assert (=> b!363906 (=> (not res!203068) (not e!222803))))

(declare-fun k!2974 () (_ BitVec 64))

(assert (=> b!363906 (= res!203068 (validKeyInArray!0 k!2974))))

(declare-fun b!363907 () Bool)

(assert (=> b!363907 (= e!222803 e!222805)))

(declare-fun res!203067 () Bool)

(assert (=> b!363907 (=> (not res!203067) (not e!222805))))

(assert (=> b!363907 (= res!203067 (and (= lt!168033 (bvadd #b00000000000000000000000000000001 lt!168036)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(assert (=> b!363907 (= lt!168033 (arrayCountValidKeys!0 lt!168037 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363907 (= lt!168036 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363907 (= lt!168037 (array!20659 (store (arr!9808 a!4289) i!1472 k!2974) (size!10160 a!4289)))))

(declare-fun b!363904 () Bool)

(declare-fun res!203066 () Bool)

(assert (=> b!363904 (=> (not res!203066) (not e!222803))))

(assert (=> b!363904 (= res!203066 (and (bvslt (size!10160 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10160 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun res!203065 () Bool)

(assert (=> start!36378 (=> (not res!203065) (not e!222803))))

(assert (=> start!36378 (= res!203065 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10160 a!4289))))))

(assert (=> start!36378 e!222803))

(assert (=> start!36378 true))

(declare-fun array_inv!7250 (array!20658) Bool)

(assert (=> start!36378 (array_inv!7250 a!4289)))

(assert (= (and start!36378 res!203065) b!363903))

(assert (= (and b!363903 res!203064) b!363906))

(assert (= (and b!363906 res!203068) b!363904))

(assert (= (and b!363904 res!203066) b!363907))

(assert (= (and b!363907 res!203067) b!363905))

(declare-fun m!361199 () Bool)

(assert (=> b!363906 m!361199))

(declare-fun m!361201 () Bool)

(assert (=> b!363905 m!361201))

(declare-fun m!361203 () Bool)

(assert (=> b!363905 m!361203))

(declare-fun m!361205 () Bool)

(assert (=> b!363905 m!361205))

(declare-fun m!361207 () Bool)

(assert (=> b!363905 m!361207))

(declare-fun m!361209 () Bool)

(assert (=> b!363905 m!361209))

(declare-fun m!361211 () Bool)

(assert (=> b!363905 m!361211))

(declare-fun m!361213 () Bool)

(assert (=> start!36378 m!361213))

(declare-fun m!361215 () Bool)

(assert (=> b!363907 m!361215))

(declare-fun m!361217 () Bool)

(assert (=> b!363907 m!361217))

(declare-fun m!361219 () Bool)

(assert (=> b!363907 m!361219))

(declare-fun m!361221 () Bool)

(assert (=> b!363903 m!361221))

(assert (=> b!363903 m!361221))

(declare-fun m!361223 () Bool)

(assert (=> b!363903 m!361223))

(push 1)

(assert (not b!363906))

(assert (not b!363903))

(assert (not b!363907))

(assert (not start!36378))

(assert (not b!363905))

(check-sat)

(pop 1)

