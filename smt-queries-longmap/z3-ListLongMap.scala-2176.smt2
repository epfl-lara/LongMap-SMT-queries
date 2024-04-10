; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36392 () Bool)

(assert start!36392)

(declare-fun res!203188 () Bool)

(declare-fun e!222882 () Bool)

(assert (=> start!36392 (=> (not res!203188) (not e!222882))))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20672 0))(
  ( (array!20673 (arr!9815 (Array (_ BitVec 32) (_ BitVec 64))) (size!10167 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20672)

(assert (=> start!36392 (= res!203188 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10167 a!4289))))))

(assert (=> start!36392 e!222882))

(assert (=> start!36392 true))

(declare-fun array_inv!7257 (array!20672) Bool)

(assert (=> start!36392 (array_inv!7257 a!4289)))

(declare-fun b!364022 () Bool)

(declare-fun e!222883 () Bool)

(declare-fun e!222880 () Bool)

(assert (=> b!364022 (= e!222883 (not e!222880))))

(declare-fun res!203187 () Bool)

(assert (=> b!364022 (=> res!203187 e!222880)))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun lt!168208 () (_ BitVec 32))

(declare-fun lt!168215 () (_ BitVec 32))

(assert (=> b!364022 (= res!203187 (or (bvsgt (bvsub from!3650 #b00000000000000000000000000000001) (size!10167 a!4289)) (bvslt i!1472 (bvsub from!3650 #b00000000000000000000000000000001)) (not (= lt!168208 (bvadd #b00000000000000000000000000000001 lt!168215)))))))

(declare-fun lt!168216 () (_ BitVec 32))

(declare-fun lt!168212 () (_ BitVec 32))

(assert (=> b!364022 (= (bvadd lt!168216 lt!168212) lt!168208)))

(declare-fun lt!168213 () array!20672)

(declare-fun arrayCountValidKeys!0 (array!20672 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364022 (= lt!168208 (arrayCountValidKeys!0 lt!168213 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364022 (= lt!168216 (arrayCountValidKeys!0 lt!168213 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-datatypes ((Unit!11300 0))(
  ( (Unit!11301) )
))
(declare-fun lt!168209 () Unit!11300)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20672 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11300)

(assert (=> b!364022 (= lt!168209 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168213 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!168211 () (_ BitVec 32))

(declare-fun lt!168214 () (_ BitVec 32))

(assert (=> b!364022 (= (bvadd lt!168211 lt!168214) lt!168215)))

(assert (=> b!364022 (= lt!168215 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364022 (= lt!168211 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-fun lt!168210 () Unit!11300)

(assert (=> b!364022 (= lt!168210 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!364023 () Bool)

(assert (=> b!364023 (= e!222882 e!222883)))

(declare-fun res!203186 () Bool)

(assert (=> b!364023 (=> (not res!203186) (not e!222883))))

(assert (=> b!364023 (= res!203186 (and (= lt!168212 (bvadd #b00000000000000000000000000000001 lt!168214)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(assert (=> b!364023 (= lt!168212 (arrayCountValidKeys!0 lt!168213 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364023 (= lt!168214 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun k0!2974 () (_ BitVec 64))

(assert (=> b!364023 (= lt!168213 (array!20673 (store (arr!9815 a!4289) i!1472 k0!2974) (size!10167 a!4289)))))

(declare-fun b!364024 () Bool)

(declare-fun res!203185 () Bool)

(assert (=> b!364024 (=> (not res!203185) (not e!222882))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364024 (= res!203185 (validKeyInArray!0 k0!2974))))

(declare-fun b!364025 () Bool)

(assert (=> b!364025 (= e!222880 true)))

(assert (=> b!364025 (= (arrayCountValidKeys!0 lt!168213 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4289 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472))))))

(declare-fun lt!168217 () Unit!11300)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20672 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11300)

(assert (=> b!364025 (= lt!168217 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4289 i!1472 k0!2974 (bvsub from!3650 #b00000000000000000000000000000001)))))

(declare-fun b!364026 () Bool)

(declare-fun res!203183 () Bool)

(assert (=> b!364026 (=> (not res!203183) (not e!222882))))

(assert (=> b!364026 (= res!203183 (and (bvslt (size!10167 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10167 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!364027 () Bool)

(declare-fun res!203184 () Bool)

(assert (=> b!364027 (=> (not res!203184) (not e!222882))))

(assert (=> b!364027 (= res!203184 (not (validKeyInArray!0 (select (arr!9815 a!4289) i!1472))))))

(assert (= (and start!36392 res!203188) b!364027))

(assert (= (and b!364027 res!203184) b!364024))

(assert (= (and b!364024 res!203185) b!364026))

(assert (= (and b!364026 res!203183) b!364023))

(assert (= (and b!364023 res!203186) b!364022))

(assert (= (and b!364022 (not res!203187)) b!364025))

(declare-fun m!361405 () Bool)

(assert (=> b!364025 m!361405))

(declare-fun m!361407 () Bool)

(assert (=> b!364025 m!361407))

(declare-fun m!361409 () Bool)

(assert (=> b!364025 m!361409))

(declare-fun m!361411 () Bool)

(assert (=> b!364023 m!361411))

(declare-fun m!361413 () Bool)

(assert (=> b!364023 m!361413))

(declare-fun m!361415 () Bool)

(assert (=> b!364023 m!361415))

(declare-fun m!361417 () Bool)

(assert (=> b!364024 m!361417))

(declare-fun m!361419 () Bool)

(assert (=> b!364027 m!361419))

(assert (=> b!364027 m!361419))

(declare-fun m!361421 () Bool)

(assert (=> b!364027 m!361421))

(declare-fun m!361423 () Bool)

(assert (=> start!36392 m!361423))

(declare-fun m!361425 () Bool)

(assert (=> b!364022 m!361425))

(declare-fun m!361427 () Bool)

(assert (=> b!364022 m!361427))

(declare-fun m!361429 () Bool)

(assert (=> b!364022 m!361429))

(declare-fun m!361431 () Bool)

(assert (=> b!364022 m!361431))

(declare-fun m!361433 () Bool)

(assert (=> b!364022 m!361433))

(declare-fun m!361435 () Bool)

(assert (=> b!364022 m!361435))

(check-sat (not b!364025) (not b!364023) (not b!364024) (not b!364022) (not start!36392) (not b!364027))
