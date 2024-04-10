; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36406 () Bool)

(assert start!36406)

(declare-fun b!364148 () Bool)

(declare-fun res!203310 () Bool)

(declare-fun e!222966 () Bool)

(assert (=> b!364148 (=> (not res!203310) (not e!222966))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20686 0))(
  ( (array!20687 (arr!9822 (Array (_ BitVec 32) (_ BitVec 64))) (size!10174 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20686)

(assert (=> b!364148 (= res!203310 (and (bvslt (size!10174 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10174 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!364149 () Bool)

(declare-fun e!222964 () Bool)

(assert (=> b!364149 (= e!222964 true)))

(declare-fun lt!168422 () array!20686)

(declare-fun arrayCountValidKeys!0 (array!20686 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364149 (= (arrayCountValidKeys!0 lt!168422 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4289 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472))))))

(declare-datatypes ((Unit!11314 0))(
  ( (Unit!11315) )
))
(declare-fun lt!168420 () Unit!11314)

(declare-fun k!2974 () (_ BitVec 64))

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20686 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11314)

(assert (=> b!364149 (= lt!168420 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4289 i!1472 k!2974 (bvsub from!3650 #b00000000000000000000000000000001)))))

(declare-fun res!203309 () Bool)

(assert (=> start!36406 (=> (not res!203309) (not e!222966))))

(assert (=> start!36406 (= res!203309 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10174 a!4289))))))

(assert (=> start!36406 e!222966))

(assert (=> start!36406 true))

(declare-fun array_inv!7264 (array!20686) Bool)

(assert (=> start!36406 (array_inv!7264 a!4289)))

(declare-fun b!364150 () Bool)

(declare-fun e!222967 () Bool)

(assert (=> b!364150 (= e!222966 e!222967)))

(declare-fun res!203311 () Bool)

(assert (=> b!364150 (=> (not res!203311) (not e!222967))))

(declare-fun lt!168418 () (_ BitVec 32))

(declare-fun lt!168425 () (_ BitVec 32))

(assert (=> b!364150 (= res!203311 (and (= lt!168425 (bvadd #b00000000000000000000000000000001 lt!168418)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(assert (=> b!364150 (= lt!168425 (arrayCountValidKeys!0 lt!168422 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364150 (= lt!168418 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364150 (= lt!168422 (array!20687 (store (arr!9822 a!4289) i!1472 k!2974) (size!10174 a!4289)))))

(declare-fun b!364151 () Bool)

(assert (=> b!364151 (= e!222967 (not e!222964))))

(declare-fun res!203314 () Bool)

(assert (=> b!364151 (=> res!203314 e!222964)))

(declare-fun lt!168419 () (_ BitVec 32))

(declare-fun lt!168421 () (_ BitVec 32))

(assert (=> b!364151 (= res!203314 (or (bvsgt (bvsub from!3650 #b00000000000000000000000000000001) (size!10174 a!4289)) (bvslt i!1472 (bvsub from!3650 #b00000000000000000000000000000001)) (not (= lt!168419 (bvadd #b00000000000000000000000000000001 lt!168421)))))))

(declare-fun lt!168424 () (_ BitVec 32))

(assert (=> b!364151 (= (bvadd lt!168424 lt!168425) lt!168419)))

(assert (=> b!364151 (= lt!168419 (arrayCountValidKeys!0 lt!168422 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364151 (= lt!168424 (arrayCountValidKeys!0 lt!168422 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-fun lt!168427 () Unit!11314)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20686 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11314)

(assert (=> b!364151 (= lt!168427 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168422 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!168423 () (_ BitVec 32))

(assert (=> b!364151 (= (bvadd lt!168423 lt!168418) lt!168421)))

(assert (=> b!364151 (= lt!168421 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364151 (= lt!168423 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-fun lt!168426 () Unit!11314)

(assert (=> b!364151 (= lt!168426 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!364152 () Bool)

(declare-fun res!203312 () Bool)

(assert (=> b!364152 (=> (not res!203312) (not e!222966))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364152 (= res!203312 (not (validKeyInArray!0 (select (arr!9822 a!4289) i!1472))))))

(declare-fun b!364153 () Bool)

(declare-fun res!203313 () Bool)

(assert (=> b!364153 (=> (not res!203313) (not e!222966))))

(assert (=> b!364153 (= res!203313 (validKeyInArray!0 k!2974))))

(assert (= (and start!36406 res!203309) b!364152))

(assert (= (and b!364152 res!203312) b!364153))

(assert (= (and b!364153 res!203313) b!364148))

(assert (= (and b!364148 res!203310) b!364150))

(assert (= (and b!364150 res!203311) b!364151))

(assert (= (and b!364151 (not res!203314)) b!364149))

(declare-fun m!361629 () Bool)

(assert (=> b!364153 m!361629))

(declare-fun m!361631 () Bool)

(assert (=> b!364149 m!361631))

(declare-fun m!361633 () Bool)

(assert (=> b!364149 m!361633))

(declare-fun m!361635 () Bool)

(assert (=> b!364149 m!361635))

(declare-fun m!361637 () Bool)

(assert (=> b!364151 m!361637))

(declare-fun m!361639 () Bool)

(assert (=> b!364151 m!361639))

(declare-fun m!361641 () Bool)

(assert (=> b!364151 m!361641))

(declare-fun m!361643 () Bool)

(assert (=> b!364151 m!361643))

(declare-fun m!361645 () Bool)

(assert (=> b!364151 m!361645))

(declare-fun m!361647 () Bool)

(assert (=> b!364151 m!361647))

(declare-fun m!361649 () Bool)

(assert (=> b!364152 m!361649))

(assert (=> b!364152 m!361649))

(declare-fun m!361651 () Bool)

(assert (=> b!364152 m!361651))

(declare-fun m!361653 () Bool)

(assert (=> b!364150 m!361653))

(declare-fun m!361655 () Bool)

(assert (=> b!364150 m!361655))

(declare-fun m!361657 () Bool)

(assert (=> b!364150 m!361657))

(declare-fun m!361659 () Bool)

(assert (=> start!36406 m!361659))

(push 1)

(assert (not b!364150))

(assert (not b!364152))

(assert (not b!364151))

(assert (not b!364149))

(assert (not start!36406))

(assert (not b!364153))

(check-sat)

(pop 1)

