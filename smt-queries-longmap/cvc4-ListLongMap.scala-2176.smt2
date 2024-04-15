; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36378 () Bool)

(assert start!36378)

(declare-fun b!363751 () Bool)

(declare-fun e!222706 () Bool)

(declare-fun e!222709 () Bool)

(assert (=> b!363751 (= e!222706 (not e!222709))))

(declare-fun res!203059 () Bool)

(assert (=> b!363751 (=> res!203059 e!222709)))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun lt!167981 () (_ BitVec 32))

(declare-fun lt!167974 () (_ BitVec 32))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20654 0))(
  ( (array!20655 (arr!9806 (Array (_ BitVec 32) (_ BitVec 64))) (size!10159 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20654)

(assert (=> b!363751 (= res!203059 (or (bvsgt (bvsub from!3650 #b00000000000000000000000000000001) (size!10159 a!4289)) (bvslt i!1472 (bvsub from!3650 #b00000000000000000000000000000001)) (not (= lt!167981 (bvadd #b00000000000000000000000000000001 lt!167974)))))))

(declare-fun lt!167979 () (_ BitVec 32))

(declare-fun lt!167978 () (_ BitVec 32))

(assert (=> b!363751 (= (bvadd lt!167979 lt!167978) lt!167981)))

(declare-fun lt!167977 () array!20654)

(declare-fun arrayCountValidKeys!0 (array!20654 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363751 (= lt!167981 (arrayCountValidKeys!0 lt!167977 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363751 (= lt!167979 (arrayCountValidKeys!0 lt!167977 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-datatypes ((Unit!11278 0))(
  ( (Unit!11279) )
))
(declare-fun lt!167980 () Unit!11278)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20654 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11278)

(assert (=> b!363751 (= lt!167980 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!167977 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!167976 () (_ BitVec 32))

(declare-fun lt!167975 () (_ BitVec 32))

(assert (=> b!363751 (= (bvadd lt!167976 lt!167975) lt!167974)))

(assert (=> b!363751 (= lt!167974 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363751 (= lt!167976 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-fun lt!167983 () Unit!11278)

(assert (=> b!363751 (= lt!167983 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!363752 () Bool)

(declare-fun res!203054 () Bool)

(declare-fun e!222708 () Bool)

(assert (=> b!363752 (=> (not res!203054) (not e!222708))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363752 (= res!203054 (not (validKeyInArray!0 (select (arr!9806 a!4289) i!1472))))))

(declare-fun b!363753 () Bool)

(assert (=> b!363753 (= e!222709 true)))

(assert (=> b!363753 (= (arrayCountValidKeys!0 lt!167977 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4289 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472))))))

(declare-fun lt!167982 () Unit!11278)

(declare-fun k!2974 () (_ BitVec 64))

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20654 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11278)

(assert (=> b!363753 (= lt!167982 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4289 i!1472 k!2974 (bvsub from!3650 #b00000000000000000000000000000001)))))

(declare-fun res!203058 () Bool)

(assert (=> start!36378 (=> (not res!203058) (not e!222708))))

(assert (=> start!36378 (= res!203058 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10159 a!4289))))))

(assert (=> start!36378 e!222708))

(assert (=> start!36378 true))

(declare-fun array_inv!7255 (array!20654) Bool)

(assert (=> start!36378 (array_inv!7255 a!4289)))

(declare-fun b!363754 () Bool)

(declare-fun res!203055 () Bool)

(assert (=> b!363754 (=> (not res!203055) (not e!222708))))

(assert (=> b!363754 (= res!203055 (and (bvslt (size!10159 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10159 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!363755 () Bool)

(declare-fun res!203056 () Bool)

(assert (=> b!363755 (=> (not res!203056) (not e!222708))))

(assert (=> b!363755 (= res!203056 (validKeyInArray!0 k!2974))))

(declare-fun b!363756 () Bool)

(assert (=> b!363756 (= e!222708 e!222706)))

(declare-fun res!203057 () Bool)

(assert (=> b!363756 (=> (not res!203057) (not e!222706))))

(assert (=> b!363756 (= res!203057 (and (= lt!167978 (bvadd #b00000000000000000000000000000001 lt!167975)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(assert (=> b!363756 (= lt!167978 (arrayCountValidKeys!0 lt!167977 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363756 (= lt!167975 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363756 (= lt!167977 (array!20655 (store (arr!9806 a!4289) i!1472 k!2974) (size!10159 a!4289)))))

(assert (= (and start!36378 res!203058) b!363752))

(assert (= (and b!363752 res!203054) b!363755))

(assert (= (and b!363755 res!203056) b!363754))

(assert (= (and b!363754 res!203055) b!363756))

(assert (= (and b!363756 res!203057) b!363751))

(assert (= (and b!363751 (not res!203059)) b!363753))

(declare-fun m!360681 () Bool)

(assert (=> b!363756 m!360681))

(declare-fun m!360683 () Bool)

(assert (=> b!363756 m!360683))

(declare-fun m!360685 () Bool)

(assert (=> b!363756 m!360685))

(declare-fun m!360687 () Bool)

(assert (=> b!363752 m!360687))

(assert (=> b!363752 m!360687))

(declare-fun m!360689 () Bool)

(assert (=> b!363752 m!360689))

(declare-fun m!360691 () Bool)

(assert (=> b!363751 m!360691))

(declare-fun m!360693 () Bool)

(assert (=> b!363751 m!360693))

(declare-fun m!360695 () Bool)

(assert (=> b!363751 m!360695))

(declare-fun m!360697 () Bool)

(assert (=> b!363751 m!360697))

(declare-fun m!360699 () Bool)

(assert (=> b!363751 m!360699))

(declare-fun m!360701 () Bool)

(assert (=> b!363751 m!360701))

(declare-fun m!360703 () Bool)

(assert (=> start!36378 m!360703))

(declare-fun m!360705 () Bool)

(assert (=> b!363753 m!360705))

(declare-fun m!360707 () Bool)

(assert (=> b!363753 m!360707))

(declare-fun m!360709 () Bool)

(assert (=> b!363753 m!360709))

(declare-fun m!360711 () Bool)

(assert (=> b!363755 m!360711))

(push 1)

(assert (not b!363756))

(assert (not b!363755))

(assert (not b!363752))

(assert (not start!36378))

(assert (not b!363751))

(assert (not b!363753))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

