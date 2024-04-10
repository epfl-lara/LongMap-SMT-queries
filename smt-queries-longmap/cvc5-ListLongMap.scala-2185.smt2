; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36444 () Bool)

(assert start!36444)

(declare-fun b!364409 () Bool)

(declare-fun res!203573 () Bool)

(declare-fun e!223082 () Bool)

(assert (=> b!364409 (=> (not res!203573) (not e!223082))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20724 0))(
  ( (array!20725 (arr!9841 (Array (_ BitVec 32) (_ BitVec 64))) (size!10193 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20724)

(assert (=> b!364409 (= res!203573 (and (bvslt (size!10193 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10193 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!364410 () Bool)

(declare-fun e!223084 () Bool)

(assert (=> b!364410 (= e!223084 (not true))))

(declare-fun lt!168486 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20724 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364410 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168486) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11316 0))(
  ( (Unit!11317) )
))
(declare-fun lt!168487 () Unit!11316)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20724 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11316)

(assert (=> b!364410 (= lt!168487 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!364411 () Bool)

(declare-fun res!203571 () Bool)

(assert (=> b!364411 (=> (not res!203571) (not e!223082))))

(declare-fun k!2974 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364411 (= res!203571 (validKeyInArray!0 k!2974))))

(declare-fun b!364412 () Bool)

(declare-fun res!203575 () Bool)

(assert (=> b!364412 (=> (not res!203575) (not e!223082))))

(assert (=> b!364412 (= res!203575 (not (validKeyInArray!0 (select (arr!9841 a!4289) i!1472))))))

(declare-fun b!364413 () Bool)

(declare-fun res!203572 () Bool)

(assert (=> b!364413 (=> (not res!203572) (not e!223084))))

(assert (=> b!364413 (= res!203572 (bvsgt from!3650 #b00000000000000000000000000000000))))

(declare-fun res!203570 () Bool)

(assert (=> start!36444 (=> (not res!203570) (not e!223082))))

(assert (=> start!36444 (= res!203570 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10193 a!4289))))))

(assert (=> start!36444 e!223082))

(assert (=> start!36444 true))

(declare-fun array_inv!7283 (array!20724) Bool)

(assert (=> start!36444 (array_inv!7283 a!4289)))

(declare-fun b!364414 () Bool)

(assert (=> b!364414 (= e!223082 e!223084)))

(declare-fun res!203574 () Bool)

(assert (=> b!364414 (=> (not res!203574) (not e!223084))))

(assert (=> b!364414 (= res!203574 (= (arrayCountValidKeys!0 (array!20725 (store (arr!9841 a!4289) i!1472 k!2974) (size!10193 a!4289)) from!3650 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 lt!168486)))))

(assert (=> b!364414 (= lt!168486 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (= (and start!36444 res!203570) b!364412))

(assert (= (and b!364412 res!203575) b!364411))

(assert (= (and b!364411 res!203571) b!364409))

(assert (= (and b!364409 res!203573) b!364414))

(assert (= (and b!364414 res!203574) b!364413))

(assert (= (and b!364413 res!203572) b!364410))

(declare-fun m!361913 () Bool)

(assert (=> b!364414 m!361913))

(declare-fun m!361915 () Bool)

(assert (=> b!364414 m!361915))

(declare-fun m!361917 () Bool)

(assert (=> b!364414 m!361917))

(declare-fun m!361919 () Bool)

(assert (=> start!36444 m!361919))

(declare-fun m!361921 () Bool)

(assert (=> b!364411 m!361921))

(declare-fun m!361923 () Bool)

(assert (=> b!364410 m!361923))

(declare-fun m!361925 () Bool)

(assert (=> b!364410 m!361925))

(declare-fun m!361927 () Bool)

(assert (=> b!364410 m!361927))

(declare-fun m!361929 () Bool)

(assert (=> b!364412 m!361929))

(assert (=> b!364412 m!361929))

(declare-fun m!361931 () Bool)

(assert (=> b!364412 m!361931))

(push 1)

(assert (not b!364410))

(assert (not b!364412))

(assert (not b!364414))

(assert (not b!364411))

(assert (not start!36444))

(check-sat)

(pop 1)

