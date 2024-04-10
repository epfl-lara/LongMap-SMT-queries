; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36368 () Bool)

(assert start!36368)

(declare-fun b!363828 () Bool)

(declare-fun e!222758 () Bool)

(declare-fun e!222759 () Bool)

(assert (=> b!363828 (= e!222758 e!222759)))

(declare-fun res!202993 () Bool)

(assert (=> b!363828 (=> (not res!202993) (not e!222759))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun lt!167958 () (_ BitVec 32))

(declare-fun lt!167961 () (_ BitVec 32))

(assert (=> b!363828 (= res!202993 (and (= lt!167961 (bvadd #b00000000000000000000000000000001 lt!167958)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(declare-datatypes ((array!20648 0))(
  ( (array!20649 (arr!9803 (Array (_ BitVec 32) (_ BitVec 64))) (size!10155 (_ BitVec 32))) )
))
(declare-fun lt!167962 () array!20648)

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20648 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363828 (= lt!167961 (arrayCountValidKeys!0 lt!167962 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun a!4289 () array!20648)

(assert (=> b!363828 (= lt!167958 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun k0!2974 () (_ BitVec 64))

(assert (=> b!363828 (= lt!167962 (array!20649 (store (arr!9803 a!4289) i!1472 k0!2974) (size!10155 a!4289)))))

(declare-fun b!363829 () Bool)

(assert (=> b!363829 (= e!222759 (not true))))

(assert (=> b!363829 (= (bvadd (arrayCountValidKeys!0 lt!167962 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!167961) (arrayCountValidKeys!0 lt!167962 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11276 0))(
  ( (Unit!11277) )
))
(declare-fun lt!167960 () Unit!11276)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20648 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11276)

(assert (=> b!363829 (= lt!167960 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!167962 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(assert (=> b!363829 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!167958) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!167959 () Unit!11276)

(assert (=> b!363829 (= lt!167959 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun res!202990 () Bool)

(assert (=> start!36368 (=> (not res!202990) (not e!222758))))

(assert (=> start!36368 (= res!202990 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10155 a!4289))))))

(assert (=> start!36368 e!222758))

(assert (=> start!36368 true))

(declare-fun array_inv!7245 (array!20648) Bool)

(assert (=> start!36368 (array_inv!7245 a!4289)))

(declare-fun b!363830 () Bool)

(declare-fun res!202992 () Bool)

(assert (=> b!363830 (=> (not res!202992) (not e!222758))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363830 (= res!202992 (not (validKeyInArray!0 (select (arr!9803 a!4289) i!1472))))))

(declare-fun b!363831 () Bool)

(declare-fun res!202989 () Bool)

(assert (=> b!363831 (=> (not res!202989) (not e!222758))))

(assert (=> b!363831 (= res!202989 (and (bvslt (size!10155 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10155 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!363832 () Bool)

(declare-fun res!202991 () Bool)

(assert (=> b!363832 (=> (not res!202991) (not e!222758))))

(assert (=> b!363832 (= res!202991 (validKeyInArray!0 k0!2974))))

(assert (= (and start!36368 res!202990) b!363830))

(assert (= (and b!363830 res!202992) b!363832))

(assert (= (and b!363832 res!202991) b!363831))

(assert (= (and b!363831 res!202989) b!363828))

(assert (= (and b!363828 res!202993) b!363829))

(declare-fun m!361069 () Bool)

(assert (=> start!36368 m!361069))

(declare-fun m!361071 () Bool)

(assert (=> b!363828 m!361071))

(declare-fun m!361073 () Bool)

(assert (=> b!363828 m!361073))

(declare-fun m!361075 () Bool)

(assert (=> b!363828 m!361075))

(declare-fun m!361077 () Bool)

(assert (=> b!363830 m!361077))

(assert (=> b!363830 m!361077))

(declare-fun m!361079 () Bool)

(assert (=> b!363830 m!361079))

(declare-fun m!361081 () Bool)

(assert (=> b!363829 m!361081))

(declare-fun m!361083 () Bool)

(assert (=> b!363829 m!361083))

(declare-fun m!361085 () Bool)

(assert (=> b!363829 m!361085))

(declare-fun m!361087 () Bool)

(assert (=> b!363829 m!361087))

(declare-fun m!361089 () Bool)

(assert (=> b!363829 m!361089))

(declare-fun m!361091 () Bool)

(assert (=> b!363829 m!361091))

(declare-fun m!361093 () Bool)

(assert (=> b!363832 m!361093))

(check-sat (not b!363829) (not b!363830) (not b!363832) (not b!363828) (not start!36368))
(check-sat)
