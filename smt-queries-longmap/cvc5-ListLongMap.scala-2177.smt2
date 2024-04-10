; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36396 () Bool)

(assert start!36396)

(declare-fun b!364058 () Bool)

(declare-fun e!222906 () Bool)

(declare-fun e!222904 () Bool)

(assert (=> b!364058 (= e!222906 (not e!222904))))

(declare-fun res!203221 () Bool)

(assert (=> b!364058 (=> res!203221 e!222904)))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun lt!168277 () (_ BitVec 32))

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun lt!168269 () (_ BitVec 32))

(declare-datatypes ((array!20676 0))(
  ( (array!20677 (arr!9817 (Array (_ BitVec 32) (_ BitVec 64))) (size!10169 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20676)

(assert (=> b!364058 (= res!203221 (or (bvsgt (bvsub from!3650 #b00000000000000000000000000000001) (size!10169 a!4289)) (bvslt i!1472 (bvsub from!3650 #b00000000000000000000000000000001)) (not (= lt!168269 (bvadd #b00000000000000000000000000000001 lt!168277)))))))

(declare-fun lt!168275 () (_ BitVec 32))

(declare-fun lt!168268 () (_ BitVec 32))

(assert (=> b!364058 (= (bvadd lt!168275 lt!168268) lt!168269)))

(declare-fun lt!168274 () array!20676)

(declare-fun arrayCountValidKeys!0 (array!20676 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364058 (= lt!168269 (arrayCountValidKeys!0 lt!168274 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364058 (= lt!168275 (arrayCountValidKeys!0 lt!168274 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-datatypes ((Unit!11304 0))(
  ( (Unit!11305) )
))
(declare-fun lt!168276 () Unit!11304)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20676 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11304)

(assert (=> b!364058 (= lt!168276 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168274 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!168270 () (_ BitVec 32))

(declare-fun lt!168272 () (_ BitVec 32))

(assert (=> b!364058 (= (bvadd lt!168270 lt!168272) lt!168277)))

(assert (=> b!364058 (= lt!168277 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364058 (= lt!168270 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-fun lt!168273 () Unit!11304)

(assert (=> b!364058 (= lt!168273 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!364060 () Bool)

(declare-fun res!203224 () Bool)

(declare-fun e!222907 () Bool)

(assert (=> b!364060 (=> (not res!203224) (not e!222907))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364060 (= res!203224 (not (validKeyInArray!0 (select (arr!9817 a!4289) i!1472))))))

(declare-fun b!364061 () Bool)

(assert (=> b!364061 (= e!222904 (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364061 (= (arrayCountValidKeys!0 lt!168274 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4289 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472))))))

(declare-fun k!2974 () (_ BitVec 64))

(declare-fun lt!168271 () Unit!11304)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20676 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11304)

(assert (=> b!364061 (= lt!168271 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4289 i!1472 k!2974 (bvsub from!3650 #b00000000000000000000000000000001)))))

(declare-fun res!203220 () Bool)

(assert (=> start!36396 (=> (not res!203220) (not e!222907))))

(assert (=> start!36396 (= res!203220 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10169 a!4289))))))

(assert (=> start!36396 e!222907))

(assert (=> start!36396 true))

(declare-fun array_inv!7259 (array!20676) Bool)

(assert (=> start!36396 (array_inv!7259 a!4289)))

(declare-fun b!364059 () Bool)

(declare-fun res!203222 () Bool)

(assert (=> b!364059 (=> (not res!203222) (not e!222907))))

(assert (=> b!364059 (= res!203222 (and (bvslt (size!10169 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10169 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!364062 () Bool)

(declare-fun res!203219 () Bool)

(assert (=> b!364062 (=> (not res!203219) (not e!222907))))

(assert (=> b!364062 (= res!203219 (validKeyInArray!0 k!2974))))

(declare-fun b!364063 () Bool)

(assert (=> b!364063 (= e!222907 e!222906)))

(declare-fun res!203223 () Bool)

(assert (=> b!364063 (=> (not res!203223) (not e!222906))))

(assert (=> b!364063 (= res!203223 (and (= lt!168268 (bvadd #b00000000000000000000000000000001 lt!168272)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(assert (=> b!364063 (= lt!168268 (arrayCountValidKeys!0 lt!168274 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364063 (= lt!168272 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364063 (= lt!168274 (array!20677 (store (arr!9817 a!4289) i!1472 k!2974) (size!10169 a!4289)))))

(assert (= (and start!36396 res!203220) b!364060))

(assert (= (and b!364060 res!203224) b!364062))

(assert (= (and b!364062 res!203219) b!364059))

(assert (= (and b!364059 res!203222) b!364063))

(assert (= (and b!364063 res!203223) b!364058))

(assert (= (and b!364058 (not res!203221)) b!364061))

(declare-fun m!361469 () Bool)

(assert (=> b!364063 m!361469))

(declare-fun m!361471 () Bool)

(assert (=> b!364063 m!361471))

(declare-fun m!361473 () Bool)

(assert (=> b!364063 m!361473))

(declare-fun m!361475 () Bool)

(assert (=> b!364061 m!361475))

(declare-fun m!361477 () Bool)

(assert (=> b!364061 m!361477))

(declare-fun m!361479 () Bool)

(assert (=> b!364061 m!361479))

(declare-fun m!361481 () Bool)

(assert (=> b!364062 m!361481))

(declare-fun m!361483 () Bool)

(assert (=> b!364060 m!361483))

(assert (=> b!364060 m!361483))

(declare-fun m!361485 () Bool)

(assert (=> b!364060 m!361485))

(declare-fun m!361487 () Bool)

(assert (=> b!364058 m!361487))

(declare-fun m!361489 () Bool)

(assert (=> b!364058 m!361489))

(declare-fun m!361491 () Bool)

(assert (=> b!364058 m!361491))

(declare-fun m!361493 () Bool)

(assert (=> b!364058 m!361493))

(declare-fun m!361495 () Bool)

(assert (=> b!364058 m!361495))

(declare-fun m!361497 () Bool)

(assert (=> b!364058 m!361497))

(declare-fun m!361499 () Bool)

(assert (=> start!36396 m!361499))

(push 1)

(assert (not b!364062))

(assert (not b!364061))

(assert (not b!364063))

(assert (not b!364060))

(assert (not b!364058))

(assert (not start!36396))

(check-sat)

