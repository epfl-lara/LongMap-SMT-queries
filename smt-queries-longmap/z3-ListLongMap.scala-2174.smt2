; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36380 () Bool)

(assert start!36380)

(declare-fun b!363918 () Bool)

(declare-fun res!203080 () Bool)

(declare-fun e!222814 () Bool)

(assert (=> b!363918 (=> (not res!203080) (not e!222814))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20660 0))(
  ( (array!20661 (arr!9809 (Array (_ BitVec 32) (_ BitVec 64))) (size!10161 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20660)

(assert (=> b!363918 (= res!203080 (and (bvslt (size!10161 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10161 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!363919 () Bool)

(declare-fun e!222813 () Bool)

(assert (=> b!363919 (= e!222813 (not true))))

(declare-fun lt!168048 () (_ BitVec 32))

(declare-fun lt!168050 () array!20660)

(declare-fun arrayCountValidKeys!0 (array!20660 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363919 (= (bvadd (arrayCountValidKeys!0 lt!168050 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168048) (arrayCountValidKeys!0 lt!168050 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11288 0))(
  ( (Unit!11289) )
))
(declare-fun lt!168049 () Unit!11288)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20660 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11288)

(assert (=> b!363919 (= lt!168049 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168050 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!168052 () (_ BitVec 32))

(assert (=> b!363919 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168052) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!168051 () Unit!11288)

(assert (=> b!363919 (= lt!168051 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!363920 () Bool)

(declare-fun res!203083 () Bool)

(assert (=> b!363920 (=> (not res!203083) (not e!222814))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363920 (= res!203083 (not (validKeyInArray!0 (select (arr!9809 a!4289) i!1472))))))

(declare-fun b!363921 () Bool)

(assert (=> b!363921 (= e!222814 e!222813)))

(declare-fun res!203082 () Bool)

(assert (=> b!363921 (=> (not res!203082) (not e!222813))))

(assert (=> b!363921 (= res!203082 (and (= lt!168048 (bvadd #b00000000000000000000000000000001 lt!168052)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(assert (=> b!363921 (= lt!168048 (arrayCountValidKeys!0 lt!168050 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363921 (= lt!168052 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun k0!2974 () (_ BitVec 64))

(assert (=> b!363921 (= lt!168050 (array!20661 (store (arr!9809 a!4289) i!1472 k0!2974) (size!10161 a!4289)))))

(declare-fun b!363922 () Bool)

(declare-fun res!203079 () Bool)

(assert (=> b!363922 (=> (not res!203079) (not e!222814))))

(assert (=> b!363922 (= res!203079 (validKeyInArray!0 k0!2974))))

(declare-fun res!203081 () Bool)

(assert (=> start!36380 (=> (not res!203081) (not e!222814))))

(assert (=> start!36380 (= res!203081 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10161 a!4289))))))

(assert (=> start!36380 e!222814))

(assert (=> start!36380 true))

(declare-fun array_inv!7251 (array!20660) Bool)

(assert (=> start!36380 (array_inv!7251 a!4289)))

(assert (= (and start!36380 res!203081) b!363920))

(assert (= (and b!363920 res!203083) b!363922))

(assert (= (and b!363922 res!203079) b!363918))

(assert (= (and b!363918 res!203080) b!363921))

(assert (= (and b!363921 res!203082) b!363919))

(declare-fun m!361225 () Bool)

(assert (=> b!363919 m!361225))

(declare-fun m!361227 () Bool)

(assert (=> b!363919 m!361227))

(declare-fun m!361229 () Bool)

(assert (=> b!363919 m!361229))

(declare-fun m!361231 () Bool)

(assert (=> b!363919 m!361231))

(declare-fun m!361233 () Bool)

(assert (=> b!363919 m!361233))

(declare-fun m!361235 () Bool)

(assert (=> b!363919 m!361235))

(declare-fun m!361237 () Bool)

(assert (=> b!363922 m!361237))

(declare-fun m!361239 () Bool)

(assert (=> start!36380 m!361239))

(declare-fun m!361241 () Bool)

(assert (=> b!363920 m!361241))

(assert (=> b!363920 m!361241))

(declare-fun m!361243 () Bool)

(assert (=> b!363920 m!361243))

(declare-fun m!361245 () Bool)

(assert (=> b!363921 m!361245))

(declare-fun m!361247 () Bool)

(assert (=> b!363921 m!361247))

(declare-fun m!361249 () Bool)

(assert (=> b!363921 m!361249))

(check-sat (not b!363922) (not b!363921) (not b!363919) (not start!36380) (not b!363920))
(check-sat)
