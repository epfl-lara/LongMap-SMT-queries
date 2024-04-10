; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36390 () Bool)

(assert start!36390)

(declare-fun b!364004 () Bool)

(declare-fun e!222869 () Bool)

(assert (=> b!364004 (= e!222869 true)))

(declare-datatypes ((array!20670 0))(
  ( (array!20671 (arr!9814 (Array (_ BitVec 32) (_ BitVec 64))) (size!10166 (_ BitVec 32))) )
))
(declare-fun lt!168186 () array!20670)

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun a!4289 () array!20670)

(declare-fun arrayCountValidKeys!0 (array!20670 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364004 (= (arrayCountValidKeys!0 lt!168186 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4289 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472))))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-datatypes ((Unit!11298 0))(
  ( (Unit!11299) )
))
(declare-fun lt!168183 () Unit!11298)

(declare-fun k!2974 () (_ BitVec 64))

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20670 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11298)

(assert (=> b!364004 (= lt!168183 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4289 i!1472 k!2974 (bvsub from!3650 #b00000000000000000000000000000001)))))

(declare-fun b!364005 () Bool)

(declare-fun res!203165 () Bool)

(declare-fun e!222871 () Bool)

(assert (=> b!364005 (=> (not res!203165) (not e!222871))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364005 (= res!203165 (validKeyInArray!0 k!2974))))

(declare-fun res!203168 () Bool)

(assert (=> start!36390 (=> (not res!203168) (not e!222871))))

(assert (=> start!36390 (= res!203168 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10166 a!4289))))))

(assert (=> start!36390 e!222871))

(assert (=> start!36390 true))

(declare-fun array_inv!7256 (array!20670) Bool)

(assert (=> start!36390 (array_inv!7256 a!4289)))

(declare-fun b!364006 () Bool)

(declare-fun res!203166 () Bool)

(assert (=> b!364006 (=> (not res!203166) (not e!222871))))

(assert (=> b!364006 (= res!203166 (not (validKeyInArray!0 (select (arr!9814 a!4289) i!1472))))))

(declare-fun b!364007 () Bool)

(declare-fun res!203169 () Bool)

(assert (=> b!364007 (=> (not res!203169) (not e!222871))))

(assert (=> b!364007 (= res!203169 (and (bvslt (size!10166 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10166 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!364008 () Bool)

(declare-fun e!222870 () Bool)

(assert (=> b!364008 (= e!222871 e!222870)))

(declare-fun res!203167 () Bool)

(assert (=> b!364008 (=> (not res!203167) (not e!222870))))

(declare-fun lt!168178 () (_ BitVec 32))

(declare-fun lt!168187 () (_ BitVec 32))

(assert (=> b!364008 (= res!203167 (and (= lt!168178 (bvadd #b00000000000000000000000000000001 lt!168187)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(assert (=> b!364008 (= lt!168178 (arrayCountValidKeys!0 lt!168186 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364008 (= lt!168187 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364008 (= lt!168186 (array!20671 (store (arr!9814 a!4289) i!1472 k!2974) (size!10166 a!4289)))))

(declare-fun b!364009 () Bool)

(assert (=> b!364009 (= e!222870 (not e!222869))))

(declare-fun res!203170 () Bool)

(assert (=> b!364009 (=> res!203170 e!222869)))

(declare-fun lt!168179 () (_ BitVec 32))

(declare-fun lt!168180 () (_ BitVec 32))

(assert (=> b!364009 (= res!203170 (or (bvsgt (bvsub from!3650 #b00000000000000000000000000000001) (size!10166 a!4289)) (bvslt i!1472 (bvsub from!3650 #b00000000000000000000000000000001)) (not (= lt!168179 (bvadd #b00000000000000000000000000000001 lt!168180)))))))

(declare-fun lt!168181 () (_ BitVec 32))

(assert (=> b!364009 (= (bvadd lt!168181 lt!168178) lt!168179)))

(assert (=> b!364009 (= lt!168179 (arrayCountValidKeys!0 lt!168186 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364009 (= lt!168181 (arrayCountValidKeys!0 lt!168186 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-fun lt!168185 () Unit!11298)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20670 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11298)

(assert (=> b!364009 (= lt!168185 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168186 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!168184 () (_ BitVec 32))

(assert (=> b!364009 (= (bvadd lt!168184 lt!168187) lt!168180)))

(assert (=> b!364009 (= lt!168180 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364009 (= lt!168184 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-fun lt!168182 () Unit!11298)

(assert (=> b!364009 (= lt!168182 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(assert (= (and start!36390 res!203168) b!364006))

(assert (= (and b!364006 res!203166) b!364005))

(assert (= (and b!364005 res!203165) b!364007))

(assert (= (and b!364007 res!203169) b!364008))

(assert (= (and b!364008 res!203167) b!364009))

(assert (= (and b!364009 (not res!203170)) b!364004))

(declare-fun m!361373 () Bool)

(assert (=> b!364009 m!361373))

(declare-fun m!361375 () Bool)

(assert (=> b!364009 m!361375))

(declare-fun m!361377 () Bool)

(assert (=> b!364009 m!361377))

(declare-fun m!361379 () Bool)

(assert (=> b!364009 m!361379))

(declare-fun m!361381 () Bool)

(assert (=> b!364009 m!361381))

(declare-fun m!361383 () Bool)

(assert (=> b!364009 m!361383))

(declare-fun m!361385 () Bool)

(assert (=> b!364006 m!361385))

(assert (=> b!364006 m!361385))

(declare-fun m!361387 () Bool)

(assert (=> b!364006 m!361387))

(declare-fun m!361389 () Bool)

(assert (=> start!36390 m!361389))

(declare-fun m!361391 () Bool)

(assert (=> b!364005 m!361391))

(declare-fun m!361393 () Bool)

(assert (=> b!364008 m!361393))

(declare-fun m!361395 () Bool)

(assert (=> b!364008 m!361395))

(declare-fun m!361397 () Bool)

(assert (=> b!364008 m!361397))

(declare-fun m!361399 () Bool)

(assert (=> b!364004 m!361399))

(declare-fun m!361401 () Bool)

(assert (=> b!364004 m!361401))

(declare-fun m!361403 () Bool)

(assert (=> b!364004 m!361403))

(push 1)

(assert (not b!364004))

(assert (not b!364005))

(assert (not start!36390))

(assert (not b!364008))

(assert (not b!364009))

