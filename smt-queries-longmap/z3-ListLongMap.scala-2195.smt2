; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36514 () Bool)

(assert start!36514)

(declare-fun b!364711 () Bool)

(declare-fun e!223237 () Bool)

(assert (=> b!364711 (= e!223237 true)))

(declare-datatypes ((array!20769 0))(
  ( (array!20770 (arr!9862 (Array (_ BitVec 32) (_ BitVec 64))) (size!10215 (_ BitVec 32))) )
))
(declare-fun lt!168824 () array!20769)

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun a!4289 () array!20769)

(declare-fun arrayCountValidKeys!0 (array!20769 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364711 (= (arrayCountValidKeys!0 lt!168824 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4289 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472))))))

(declare-datatypes ((Unit!11354 0))(
  ( (Unit!11355) )
))
(declare-fun lt!168821 () Unit!11354)

(declare-fun k0!2974 () (_ BitVec 64))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20769 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11354)

(assert (=> b!364711 (= lt!168821 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4289 i!1472 k0!2974 (bvsub from!3650 #b00000000000000000000000000000001)))))

(declare-fun b!364712 () Bool)

(declare-fun res!203918 () Bool)

(declare-fun e!223240 () Bool)

(assert (=> b!364712 (=> (not res!203918) (not e!223240))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364712 (= res!203918 (not (validKeyInArray!0 (select (arr!9862 a!4289) i!1472))))))

(declare-fun b!364713 () Bool)

(declare-fun res!203919 () Bool)

(assert (=> b!364713 (=> (not res!203919) (not e!223240))))

(assert (=> b!364713 (= res!203919 (and (bvslt (size!10215 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10215 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!364714 () Bool)

(declare-fun e!223239 () Bool)

(assert (=> b!364714 (= e!223239 (not e!223237))))

(declare-fun res!203922 () Bool)

(assert (=> b!364714 (=> res!203922 e!223237)))

(declare-fun lt!168818 () (_ BitVec 32))

(declare-fun lt!168826 () (_ BitVec 32))

(assert (=> b!364714 (= res!203922 (or (bvsgt (bvsub from!3650 #b00000000000000000000000000000001) (size!10215 a!4289)) (bvslt i!1472 (bvsub from!3650 #b00000000000000000000000000000001)) (not (= lt!168826 (bvadd #b00000000000000000000000000000001 lt!168818)))))))

(declare-fun lt!168825 () (_ BitVec 32))

(declare-fun lt!168823 () (_ BitVec 32))

(assert (=> b!364714 (= (bvadd lt!168825 lt!168823) lt!168826)))

(assert (=> b!364714 (= lt!168826 (arrayCountValidKeys!0 lt!168824 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364714 (= lt!168825 (arrayCountValidKeys!0 lt!168824 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-fun lt!168822 () Unit!11354)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20769 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11354)

(assert (=> b!364714 (= lt!168822 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168824 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!168819 () (_ BitVec 32))

(declare-fun lt!168820 () (_ BitVec 32))

(assert (=> b!364714 (= (bvadd lt!168819 lt!168820) lt!168818)))

(assert (=> b!364714 (= lt!168818 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364714 (= lt!168819 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-fun lt!168817 () Unit!11354)

(assert (=> b!364714 (= lt!168817 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun res!203921 () Bool)

(assert (=> start!36514 (=> (not res!203921) (not e!223240))))

(assert (=> start!36514 (= res!203921 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10215 a!4289))))))

(assert (=> start!36514 e!223240))

(assert (=> start!36514 true))

(declare-fun array_inv!7311 (array!20769) Bool)

(assert (=> start!36514 (array_inv!7311 a!4289)))

(declare-fun b!364715 () Bool)

(declare-fun res!203920 () Bool)

(assert (=> b!364715 (=> (not res!203920) (not e!223240))))

(assert (=> b!364715 (= res!203920 (validKeyInArray!0 k0!2974))))

(declare-fun b!364716 () Bool)

(assert (=> b!364716 (= e!223240 e!223239)))

(declare-fun res!203923 () Bool)

(assert (=> b!364716 (=> (not res!203923) (not e!223239))))

(assert (=> b!364716 (= res!203923 (and (= lt!168823 (bvadd #b00000000000000000000000000000001 lt!168820)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(assert (=> b!364716 (= lt!168823 (arrayCountValidKeys!0 lt!168824 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364716 (= lt!168820 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364716 (= lt!168824 (array!20770 (store (arr!9862 a!4289) i!1472 k0!2974) (size!10215 a!4289)))))

(assert (= (and start!36514 res!203921) b!364712))

(assert (= (and b!364712 res!203918) b!364715))

(assert (= (and b!364715 res!203920) b!364713))

(assert (= (and b!364713 res!203919) b!364716))

(assert (= (and b!364716 res!203923) b!364714))

(assert (= (and b!364714 (not res!203922)) b!364711))

(declare-fun m!362047 () Bool)

(assert (=> b!364712 m!362047))

(assert (=> b!364712 m!362047))

(declare-fun m!362049 () Bool)

(assert (=> b!364712 m!362049))

(declare-fun m!362051 () Bool)

(assert (=> b!364715 m!362051))

(declare-fun m!362053 () Bool)

(assert (=> b!364716 m!362053))

(declare-fun m!362055 () Bool)

(assert (=> b!364716 m!362055))

(declare-fun m!362057 () Bool)

(assert (=> b!364716 m!362057))

(declare-fun m!362059 () Bool)

(assert (=> b!364714 m!362059))

(declare-fun m!362061 () Bool)

(assert (=> b!364714 m!362061))

(declare-fun m!362063 () Bool)

(assert (=> b!364714 m!362063))

(declare-fun m!362065 () Bool)

(assert (=> b!364714 m!362065))

(declare-fun m!362067 () Bool)

(assert (=> b!364714 m!362067))

(declare-fun m!362069 () Bool)

(assert (=> b!364714 m!362069))

(declare-fun m!362071 () Bool)

(assert (=> start!36514 m!362071))

(declare-fun m!362073 () Bool)

(assert (=> b!364711 m!362073))

(declare-fun m!362075 () Bool)

(assert (=> b!364711 m!362075))

(declare-fun m!362077 () Bool)

(assert (=> b!364711 m!362077))

(check-sat (not b!364711) (not b!364712) (not b!364716) (not b!364715) (not start!36514) (not b!364714))
(check-sat)
