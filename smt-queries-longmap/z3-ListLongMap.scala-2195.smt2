; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36514 () Bool)

(assert start!36514)

(declare-fun b!364933 () Bool)

(declare-fun res!204044 () Bool)

(declare-fun e!223379 () Bool)

(assert (=> b!364933 (=> (not res!204044) (not e!223379))))

(declare-fun k0!2974 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364933 (= res!204044 (validKeyInArray!0 k0!2974))))

(declare-fun b!364934 () Bool)

(declare-fun res!204048 () Bool)

(assert (=> b!364934 (=> (not res!204048) (not e!223379))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20768 0))(
  ( (array!20769 (arr!9861 (Array (_ BitVec 32) (_ BitVec 64))) (size!10213 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20768)

(assert (=> b!364934 (= res!204048 (and (bvslt (size!10213 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10213 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!364935 () Bool)

(declare-fun e!223381 () Bool)

(assert (=> b!364935 (= e!223381 true)))

(declare-fun lt!169074 () array!20768)

(declare-fun arrayCountValidKeys!0 (array!20768 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364935 (= (arrayCountValidKeys!0 lt!169074 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4289 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472))))))

(declare-datatypes ((Unit!11365 0))(
  ( (Unit!11366) )
))
(declare-fun lt!169071 () Unit!11365)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20768 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11365)

(assert (=> b!364935 (= lt!169071 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4289 i!1472 k0!2974 (bvsub from!3650 #b00000000000000000000000000000001)))))

(declare-fun b!364936 () Bool)

(declare-fun e!223382 () Bool)

(assert (=> b!364936 (= e!223382 (not e!223381))))

(declare-fun res!204045 () Bool)

(assert (=> b!364936 (=> res!204045 e!223381)))

(declare-fun lt!169073 () (_ BitVec 32))

(declare-fun lt!169072 () (_ BitVec 32))

(assert (=> b!364936 (= res!204045 (or (bvsgt (bvsub from!3650 #b00000000000000000000000000000001) (size!10213 a!4289)) (bvslt i!1472 (bvsub from!3650 #b00000000000000000000000000000001)) (not (= lt!169073 (bvadd #b00000000000000000000000000000001 lt!169072)))))))

(declare-fun lt!169078 () (_ BitVec 32))

(declare-fun lt!169079 () (_ BitVec 32))

(assert (=> b!364936 (= (bvadd lt!169078 lt!169079) lt!169073)))

(assert (=> b!364936 (= lt!169073 (arrayCountValidKeys!0 lt!169074 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364936 (= lt!169078 (arrayCountValidKeys!0 lt!169074 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-fun lt!169070 () Unit!11365)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20768 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11365)

(assert (=> b!364936 (= lt!169070 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!169074 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!169076 () (_ BitVec 32))

(declare-fun lt!169075 () (_ BitVec 32))

(assert (=> b!364936 (= (bvadd lt!169076 lt!169075) lt!169072)))

(assert (=> b!364936 (= lt!169072 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364936 (= lt!169076 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-fun lt!169077 () Unit!11365)

(assert (=> b!364936 (= lt!169077 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun res!204047 () Bool)

(assert (=> start!36514 (=> (not res!204047) (not e!223379))))

(assert (=> start!36514 (= res!204047 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10213 a!4289))))))

(assert (=> start!36514 e!223379))

(assert (=> start!36514 true))

(declare-fun array_inv!7333 (array!20768) Bool)

(assert (=> start!36514 (array_inv!7333 a!4289)))

(declare-fun b!364937 () Bool)

(assert (=> b!364937 (= e!223379 e!223382)))

(declare-fun res!204049 () Bool)

(assert (=> b!364937 (=> (not res!204049) (not e!223382))))

(assert (=> b!364937 (= res!204049 (and (= lt!169079 (bvadd #b00000000000000000000000000000001 lt!169075)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(assert (=> b!364937 (= lt!169079 (arrayCountValidKeys!0 lt!169074 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364937 (= lt!169075 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364937 (= lt!169074 (array!20769 (store (arr!9861 a!4289) i!1472 k0!2974) (size!10213 a!4289)))))

(declare-fun b!364938 () Bool)

(declare-fun res!204046 () Bool)

(assert (=> b!364938 (=> (not res!204046) (not e!223379))))

(assert (=> b!364938 (= res!204046 (not (validKeyInArray!0 (select (arr!9861 a!4289) i!1472))))))

(assert (= (and start!36514 res!204047) b!364938))

(assert (= (and b!364938 res!204046) b!364933))

(assert (= (and b!364933 res!204044) b!364934))

(assert (= (and b!364934 res!204048) b!364937))

(assert (= (and b!364937 res!204049) b!364936))

(assert (= (and b!364936 (not res!204045)) b!364935))

(declare-fun m!363001 () Bool)

(assert (=> b!364935 m!363001))

(declare-fun m!363003 () Bool)

(assert (=> b!364935 m!363003))

(declare-fun m!363005 () Bool)

(assert (=> b!364935 m!363005))

(declare-fun m!363007 () Bool)

(assert (=> b!364936 m!363007))

(declare-fun m!363009 () Bool)

(assert (=> b!364936 m!363009))

(declare-fun m!363011 () Bool)

(assert (=> b!364936 m!363011))

(declare-fun m!363013 () Bool)

(assert (=> b!364936 m!363013))

(declare-fun m!363015 () Bool)

(assert (=> b!364936 m!363015))

(declare-fun m!363017 () Bool)

(assert (=> b!364936 m!363017))

(declare-fun m!363019 () Bool)

(assert (=> b!364933 m!363019))

(declare-fun m!363021 () Bool)

(assert (=> start!36514 m!363021))

(declare-fun m!363023 () Bool)

(assert (=> b!364937 m!363023))

(declare-fun m!363025 () Bool)

(assert (=> b!364937 m!363025))

(declare-fun m!363027 () Bool)

(assert (=> b!364937 m!363027))

(declare-fun m!363029 () Bool)

(assert (=> b!364938 m!363029))

(assert (=> b!364938 m!363029))

(declare-fun m!363031 () Bool)

(assert (=> b!364938 m!363031))

(check-sat (not b!364935) (not b!364933) (not b!364938) (not start!36514) (not b!364937) (not b!364936))
(check-sat)
