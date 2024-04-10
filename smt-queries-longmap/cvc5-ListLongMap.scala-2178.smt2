; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36402 () Bool)

(assert start!36402)

(declare-fun b!364112 () Bool)

(declare-fun e!222940 () Bool)

(assert (=> b!364112 (= e!222940 true)))

(declare-datatypes ((array!20682 0))(
  ( (array!20683 (arr!9820 (Array (_ BitVec 32) (_ BitVec 64))) (size!10172 (_ BitVec 32))) )
))
(declare-fun lt!168363 () array!20682)

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun a!4289 () array!20682)

(declare-fun arrayCountValidKeys!0 (array!20682 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364112 (= (arrayCountValidKeys!0 lt!168363 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4289 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472))))))

(declare-datatypes ((Unit!11310 0))(
  ( (Unit!11311) )
))
(declare-fun lt!168366 () Unit!11310)

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun k!2974 () (_ BitVec 64))

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20682 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11310)

(assert (=> b!364112 (= lt!168366 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4289 i!1472 k!2974 (bvsub from!3650 #b00000000000000000000000000000001)))))

(declare-fun b!364113 () Bool)

(declare-fun e!222942 () Bool)

(assert (=> b!364113 (= e!222942 (not e!222940))))

(declare-fun res!203278 () Bool)

(assert (=> b!364113 (=> res!203278 e!222940)))

(declare-fun lt!168365 () (_ BitVec 32))

(declare-fun lt!168359 () (_ BitVec 32))

(assert (=> b!364113 (= res!203278 (or (bvsgt (bvsub from!3650 #b00000000000000000000000000000001) (size!10172 a!4289)) (bvslt i!1472 (bvsub from!3650 #b00000000000000000000000000000001)) (not (= lt!168365 (bvadd #b00000000000000000000000000000001 lt!168359)))))))

(declare-fun lt!168360 () (_ BitVec 32))

(declare-fun lt!168362 () (_ BitVec 32))

(assert (=> b!364113 (= (bvadd lt!168360 lt!168362) lt!168365)))

(assert (=> b!364113 (= lt!168365 (arrayCountValidKeys!0 lt!168363 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364113 (= lt!168360 (arrayCountValidKeys!0 lt!168363 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-fun lt!168358 () Unit!11310)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20682 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11310)

(assert (=> b!364113 (= lt!168358 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168363 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!168364 () (_ BitVec 32))

(declare-fun lt!168367 () (_ BitVec 32))

(assert (=> b!364113 (= (bvadd lt!168364 lt!168367) lt!168359)))

(assert (=> b!364113 (= lt!168359 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364113 (= lt!168364 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-fun lt!168361 () Unit!11310)

(assert (=> b!364113 (= lt!168361 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun res!203273 () Bool)

(declare-fun e!222943 () Bool)

(assert (=> start!36402 (=> (not res!203273) (not e!222943))))

(assert (=> start!36402 (= res!203273 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10172 a!4289))))))

(assert (=> start!36402 e!222943))

(assert (=> start!36402 true))

(declare-fun array_inv!7262 (array!20682) Bool)

(assert (=> start!36402 (array_inv!7262 a!4289)))

(declare-fun b!364114 () Bool)

(declare-fun res!203275 () Bool)

(assert (=> b!364114 (=> (not res!203275) (not e!222943))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364114 (= res!203275 (not (validKeyInArray!0 (select (arr!9820 a!4289) i!1472))))))

(declare-fun b!364115 () Bool)

(assert (=> b!364115 (= e!222943 e!222942)))

(declare-fun res!203277 () Bool)

(assert (=> b!364115 (=> (not res!203277) (not e!222942))))

(assert (=> b!364115 (= res!203277 (and (= lt!168362 (bvadd #b00000000000000000000000000000001 lt!168367)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(assert (=> b!364115 (= lt!168362 (arrayCountValidKeys!0 lt!168363 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364115 (= lt!168367 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364115 (= lt!168363 (array!20683 (store (arr!9820 a!4289) i!1472 k!2974) (size!10172 a!4289)))))

(declare-fun b!364116 () Bool)

(declare-fun res!203274 () Bool)

(assert (=> b!364116 (=> (not res!203274) (not e!222943))))

(assert (=> b!364116 (= res!203274 (and (bvslt (size!10172 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10172 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!364117 () Bool)

(declare-fun res!203276 () Bool)

(assert (=> b!364117 (=> (not res!203276) (not e!222943))))

(assert (=> b!364117 (= res!203276 (validKeyInArray!0 k!2974))))

(assert (= (and start!36402 res!203273) b!364114))

(assert (= (and b!364114 res!203275) b!364117))

(assert (= (and b!364117 res!203276) b!364116))

(assert (= (and b!364116 res!203274) b!364115))

(assert (= (and b!364115 res!203277) b!364113))

(assert (= (and b!364113 (not res!203278)) b!364112))

(declare-fun m!361565 () Bool)

(assert (=> b!364115 m!361565))

(declare-fun m!361567 () Bool)

(assert (=> b!364115 m!361567))

(declare-fun m!361569 () Bool)

(assert (=> b!364115 m!361569))

(declare-fun m!361571 () Bool)

(assert (=> b!364112 m!361571))

(declare-fun m!361573 () Bool)

(assert (=> b!364112 m!361573))

(declare-fun m!361575 () Bool)

(assert (=> b!364112 m!361575))

(declare-fun m!361577 () Bool)

(assert (=> b!364113 m!361577))

(declare-fun m!361579 () Bool)

(assert (=> b!364113 m!361579))

(declare-fun m!361581 () Bool)

(assert (=> b!364113 m!361581))

(declare-fun m!361583 () Bool)

(assert (=> b!364113 m!361583))

(declare-fun m!361585 () Bool)

(assert (=> b!364113 m!361585))

(declare-fun m!361587 () Bool)

(assert (=> b!364113 m!361587))

(declare-fun m!361589 () Bool)

(assert (=> start!36402 m!361589))

(declare-fun m!361591 () Bool)

(assert (=> b!364117 m!361591))

(declare-fun m!361593 () Bool)

(assert (=> b!364114 m!361593))

(assert (=> b!364114 m!361593))

(declare-fun m!361595 () Bool)

(assert (=> b!364114 m!361595))

(push 1)

(assert (not b!364117))

(assert (not b!364115))

(assert (not b!364112))

(assert (not b!364114))

(assert (not b!364113))

(assert (not start!36402))

(check-sat)

