; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36384 () Bool)

(assert start!36384)

(declare-fun b!363950 () Bool)

(declare-fun e!222832 () Bool)

(declare-fun e!222834 () Bool)

(assert (=> b!363950 (= e!222832 e!222834)))

(declare-fun res!203115 () Bool)

(assert (=> b!363950 (=> (not res!203115) (not e!222834))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun lt!168094 () (_ BitVec 32))

(declare-fun lt!168093 () (_ BitVec 32))

(assert (=> b!363950 (= res!203115 (and (= lt!168094 (bvadd #b00000000000000000000000000000001 lt!168093)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20664 0))(
  ( (array!20665 (arr!9811 (Array (_ BitVec 32) (_ BitVec 64))) (size!10163 (_ BitVec 32))) )
))
(declare-fun lt!168092 () array!20664)

(declare-fun arrayCountValidKeys!0 (array!20664 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363950 (= lt!168094 (arrayCountValidKeys!0 lt!168092 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun a!4289 () array!20664)

(assert (=> b!363950 (= lt!168093 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun k!2974 () (_ BitVec 64))

(assert (=> b!363950 (= lt!168092 (array!20665 (store (arr!9811 a!4289) i!1472 k!2974) (size!10163 a!4289)))))

(declare-fun b!363951 () Bool)

(declare-fun e!222833 () Bool)

(assert (=> b!363951 (= e!222834 (not e!222833))))

(declare-fun res!203112 () Bool)

(assert (=> b!363951 (=> res!203112 e!222833)))

(declare-fun lt!168095 () (_ BitVec 32))

(declare-fun lt!168088 () (_ BitVec 32))

(assert (=> b!363951 (= res!203112 (or (bvsgt (bvsub from!3650 #b00000000000000000000000000000001) (size!10163 a!4289)) (bvslt i!1472 (bvsub from!3650 #b00000000000000000000000000000001)) (not (= lt!168095 (bvadd #b00000000000000000000000000000001 lt!168088)))))))

(declare-fun lt!168089 () (_ BitVec 32))

(assert (=> b!363951 (= (bvadd lt!168089 lt!168094) lt!168095)))

(assert (=> b!363951 (= lt!168095 (arrayCountValidKeys!0 lt!168092 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363951 (= lt!168089 (arrayCountValidKeys!0 lt!168092 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-datatypes ((Unit!11292 0))(
  ( (Unit!11293) )
))
(declare-fun lt!168097 () Unit!11292)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20664 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11292)

(assert (=> b!363951 (= lt!168097 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168092 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!168091 () (_ BitVec 32))

(assert (=> b!363951 (= (bvadd lt!168091 lt!168093) lt!168088)))

(assert (=> b!363951 (= lt!168088 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363951 (= lt!168091 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-fun lt!168096 () Unit!11292)

(assert (=> b!363951 (= lt!168096 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!363952 () Bool)

(assert (=> b!363952 (= e!222833 (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363952 (= (arrayCountValidKeys!0 lt!168092 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4289 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472))))))

(declare-fun lt!168090 () Unit!11292)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20664 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11292)

(assert (=> b!363952 (= lt!168090 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4289 i!1472 k!2974 (bvsub from!3650 #b00000000000000000000000000000001)))))

(declare-fun b!363953 () Bool)

(declare-fun res!203116 () Bool)

(assert (=> b!363953 (=> (not res!203116) (not e!222832))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363953 (= res!203116 (validKeyInArray!0 k!2974))))

(declare-fun b!363954 () Bool)

(declare-fun res!203113 () Bool)

(assert (=> b!363954 (=> (not res!203113) (not e!222832))))

(assert (=> b!363954 (= res!203113 (not (validKeyInArray!0 (select (arr!9811 a!4289) i!1472))))))

(declare-fun b!363955 () Bool)

(declare-fun res!203111 () Bool)

(assert (=> b!363955 (=> (not res!203111) (not e!222832))))

(assert (=> b!363955 (= res!203111 (and (bvslt (size!10163 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10163 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun res!203114 () Bool)

(assert (=> start!36384 (=> (not res!203114) (not e!222832))))

(assert (=> start!36384 (= res!203114 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10163 a!4289))))))

(assert (=> start!36384 e!222832))

(assert (=> start!36384 true))

(declare-fun array_inv!7253 (array!20664) Bool)

(assert (=> start!36384 (array_inv!7253 a!4289)))

(assert (= (and start!36384 res!203114) b!363954))

(assert (= (and b!363954 res!203113) b!363953))

(assert (= (and b!363953 res!203116) b!363955))

(assert (= (and b!363955 res!203111) b!363950))

(assert (= (and b!363950 res!203115) b!363951))

(assert (= (and b!363951 (not res!203112)) b!363952))

(declare-fun m!361277 () Bool)

(assert (=> b!363954 m!361277))

(assert (=> b!363954 m!361277))

(declare-fun m!361279 () Bool)

(assert (=> b!363954 m!361279))

(declare-fun m!361281 () Bool)

(assert (=> b!363951 m!361281))

(declare-fun m!361283 () Bool)

(assert (=> b!363951 m!361283))

(declare-fun m!361285 () Bool)

(assert (=> b!363951 m!361285))

(declare-fun m!361287 () Bool)

(assert (=> b!363951 m!361287))

(declare-fun m!361289 () Bool)

(assert (=> b!363951 m!361289))

(declare-fun m!361291 () Bool)

(assert (=> b!363951 m!361291))

(declare-fun m!361293 () Bool)

(assert (=> b!363950 m!361293))

(declare-fun m!361295 () Bool)

(assert (=> b!363950 m!361295))

(declare-fun m!361297 () Bool)

(assert (=> b!363950 m!361297))

(declare-fun m!361299 () Bool)

(assert (=> b!363953 m!361299))

(declare-fun m!361301 () Bool)

(assert (=> b!363952 m!361301))

(declare-fun m!361303 () Bool)

(assert (=> b!363952 m!361303))

(declare-fun m!361305 () Bool)

(assert (=> b!363952 m!361305))

(declare-fun m!361307 () Bool)

(assert (=> start!36384 m!361307))

(push 1)

(assert (not b!363954))

(assert (not b!363953))

(assert (not b!363952))

(assert (not b!363950))

(assert (not b!363951))

(assert (not start!36384))

(check-sat)

(pop 1)

(push 1)

