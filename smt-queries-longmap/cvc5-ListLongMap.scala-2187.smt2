; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36456 () Bool)

(assert start!36456)

(declare-fun b!364515 () Bool)

(declare-fun e!223136 () Bool)

(assert (=> b!364515 (= e!223136 (not true))))

(declare-datatypes ((array!20736 0))(
  ( (array!20737 (arr!9847 (Array (_ BitVec 32) (_ BitVec 64))) (size!10199 (_ BitVec 32))) )
))
(declare-fun lt!168532 () array!20736)

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun lt!168529 () (_ BitVec 32))

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20736 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364515 (= (bvadd (arrayCountValidKeys!0 lt!168532 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168529) (arrayCountValidKeys!0 lt!168532 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11328 0))(
  ( (Unit!11329) )
))
(declare-fun lt!168531 () Unit!11328)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20736 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11328)

(assert (=> b!364515 (= lt!168531 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168532 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun a!4289 () array!20736)

(declare-fun lt!168528 () (_ BitVec 32))

(assert (=> b!364515 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168528) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!168530 () Unit!11328)

(assert (=> b!364515 (= lt!168530 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!364516 () Bool)

(declare-fun res!203680 () Bool)

(declare-fun e!223137 () Bool)

(assert (=> b!364516 (=> (not res!203680) (not e!223137))))

(declare-fun k!2974 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364516 (= res!203680 (validKeyInArray!0 k!2974))))

(declare-fun b!364517 () Bool)

(declare-fun res!203676 () Bool)

(assert (=> b!364517 (=> (not res!203676) (not e!223137))))

(assert (=> b!364517 (= res!203676 (and (bvslt (size!10199 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10199 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun res!203678 () Bool)

(assert (=> start!36456 (=> (not res!203678) (not e!223137))))

(assert (=> start!36456 (= res!203678 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10199 a!4289))))))

(assert (=> start!36456 e!223137))

(assert (=> start!36456 true))

(declare-fun array_inv!7289 (array!20736) Bool)

(assert (=> start!36456 (array_inv!7289 a!4289)))

(declare-fun b!364518 () Bool)

(declare-fun res!203677 () Bool)

(assert (=> b!364518 (=> (not res!203677) (not e!223137))))

(assert (=> b!364518 (= res!203677 (not (validKeyInArray!0 (select (arr!9847 a!4289) i!1472))))))

(declare-fun b!364519 () Bool)

(assert (=> b!364519 (= e!223137 e!223136)))

(declare-fun res!203679 () Bool)

(assert (=> b!364519 (=> (not res!203679) (not e!223136))))

(assert (=> b!364519 (= res!203679 (and (= lt!168529 (bvadd #b00000000000000000000000000000001 lt!168528)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(assert (=> b!364519 (= lt!168529 (arrayCountValidKeys!0 lt!168532 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364519 (= lt!168528 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364519 (= lt!168532 (array!20737 (store (arr!9847 a!4289) i!1472 k!2974) (size!10199 a!4289)))))

(assert (= (and start!36456 res!203678) b!364518))

(assert (= (and b!364518 res!203677) b!364516))

(assert (= (and b!364516 res!203680) b!364517))

(assert (= (and b!364517 res!203676) b!364519))

(assert (= (and b!364519 res!203679) b!364515))

(declare-fun m!362033 () Bool)

(assert (=> b!364515 m!362033))

(declare-fun m!362035 () Bool)

(assert (=> b!364515 m!362035))

(declare-fun m!362037 () Bool)

(assert (=> b!364515 m!362037))

(declare-fun m!362039 () Bool)

(assert (=> b!364515 m!362039))

(declare-fun m!362041 () Bool)

(assert (=> b!364515 m!362041))

(declare-fun m!362043 () Bool)

(assert (=> b!364515 m!362043))

(declare-fun m!362045 () Bool)

(assert (=> b!364519 m!362045))

(declare-fun m!362047 () Bool)

(assert (=> b!364519 m!362047))

(declare-fun m!362049 () Bool)

(assert (=> b!364519 m!362049))

(declare-fun m!362051 () Bool)

(assert (=> b!364516 m!362051))

(declare-fun m!362053 () Bool)

(assert (=> b!364518 m!362053))

(assert (=> b!364518 m!362053))

(declare-fun m!362055 () Bool)

(assert (=> b!364518 m!362055))

(declare-fun m!362057 () Bool)

(assert (=> start!36456 m!362057))

(push 1)

(assert (not b!364515))

(assert (not b!364519))

(assert (not start!36456))

(assert (not b!364516))

(assert (not b!364518))

(check-sat)

