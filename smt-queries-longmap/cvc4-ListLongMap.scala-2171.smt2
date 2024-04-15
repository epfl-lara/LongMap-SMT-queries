; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36348 () Bool)

(assert start!36348)

(declare-fun b!363512 () Bool)

(declare-fun res!202816 () Bool)

(declare-fun e!222559 () Bool)

(assert (=> b!363512 (=> (not res!202816) (not e!222559))))

(declare-datatypes ((array!20624 0))(
  ( (array!20625 (arr!9791 (Array (_ BitVec 32) (_ BitVec 64))) (size!10144 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20624)

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363512 (= res!202816 (not (validKeyInArray!0 (select (arr!9791 a!4289) i!1472))))))

(declare-fun res!202819 () Bool)

(assert (=> start!36348 (=> (not res!202819) (not e!222559))))

(assert (=> start!36348 (= res!202819 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10144 a!4289))))))

(assert (=> start!36348 e!222559))

(assert (=> start!36348 true))

(declare-fun array_inv!7240 (array!20624) Bool)

(assert (=> start!36348 (array_inv!7240 a!4289)))

(declare-fun b!363513 () Bool)

(declare-fun e!222558 () Bool)

(assert (=> b!363513 (= e!222559 e!222558)))

(declare-fun res!202815 () Bool)

(assert (=> b!363513 (=> (not res!202815) (not e!222558))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun lt!167679 () (_ BitVec 32))

(declare-fun lt!167682 () (_ BitVec 32))

(assert (=> b!363513 (= res!202815 (and (= lt!167682 (bvadd #b00000000000000000000000000000001 lt!167679)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(declare-fun lt!167681 () array!20624)

(declare-fun arrayCountValidKeys!0 (array!20624 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363513 (= lt!167682 (arrayCountValidKeys!0 lt!167681 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363513 (= lt!167679 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun k!2974 () (_ BitVec 64))

(assert (=> b!363513 (= lt!167681 (array!20625 (store (arr!9791 a!4289) i!1472 k!2974) (size!10144 a!4289)))))

(declare-fun b!363514 () Bool)

(declare-fun res!202818 () Bool)

(assert (=> b!363514 (=> (not res!202818) (not e!222559))))

(assert (=> b!363514 (= res!202818 (validKeyInArray!0 k!2974))))

(declare-fun b!363515 () Bool)

(assert (=> b!363515 (= e!222558 (not true))))

(assert (=> b!363515 (= (bvadd (arrayCountValidKeys!0 lt!167681 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!167682) (arrayCountValidKeys!0 lt!167681 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11248 0))(
  ( (Unit!11249) )
))
(declare-fun lt!167680 () Unit!11248)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20624 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11248)

(assert (=> b!363515 (= lt!167680 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!167681 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(assert (=> b!363515 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!167679) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!167683 () Unit!11248)

(assert (=> b!363515 (= lt!167683 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!363516 () Bool)

(declare-fun res!202817 () Bool)

(assert (=> b!363516 (=> (not res!202817) (not e!222559))))

(assert (=> b!363516 (= res!202817 (and (bvslt (size!10144 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10144 a!4289)) (bvsge i!1472 from!3650)))))

(assert (= (and start!36348 res!202819) b!363512))

(assert (= (and b!363512 res!202816) b!363514))

(assert (= (and b!363514 res!202818) b!363516))

(assert (= (and b!363516 res!202817) b!363513))

(assert (= (and b!363513 res!202815) b!363515))

(declare-fun m!360267 () Bool)

(assert (=> b!363513 m!360267))

(declare-fun m!360269 () Bool)

(assert (=> b!363513 m!360269))

(declare-fun m!360271 () Bool)

(assert (=> b!363513 m!360271))

(declare-fun m!360273 () Bool)

(assert (=> b!363515 m!360273))

(declare-fun m!360275 () Bool)

(assert (=> b!363515 m!360275))

(declare-fun m!360277 () Bool)

(assert (=> b!363515 m!360277))

(declare-fun m!360279 () Bool)

(assert (=> b!363515 m!360279))

(declare-fun m!360281 () Bool)

(assert (=> b!363515 m!360281))

(declare-fun m!360283 () Bool)

(assert (=> b!363515 m!360283))

(declare-fun m!360285 () Bool)

(assert (=> start!36348 m!360285))

(declare-fun m!360287 () Bool)

(assert (=> b!363514 m!360287))

(declare-fun m!360289 () Bool)

(assert (=> b!363512 m!360289))

(assert (=> b!363512 m!360289))

(declare-fun m!360291 () Bool)

(assert (=> b!363512 m!360291))

(push 1)

(assert (not b!363514))

(assert (not b!363513))

(assert (not b!363512))

(assert (not b!363515))

(assert (not start!36348))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

