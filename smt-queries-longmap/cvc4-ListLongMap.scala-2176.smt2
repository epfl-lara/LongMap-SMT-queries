; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36378 () Bool)

(assert start!36378)

(declare-fun b!363973 () Bool)

(declare-fun res!203182 () Bool)

(declare-fun e!222849 () Bool)

(assert (=> b!363973 (=> (not res!203182) (not e!222849))))

(declare-datatypes ((array!20653 0))(
  ( (array!20654 (arr!9805 (Array (_ BitVec 32) (_ BitVec 64))) (size!10157 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20653)

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363973 (= res!203182 (not (validKeyInArray!0 (select (arr!9805 a!4289) i!1472))))))

(declare-fun b!363974 () Bool)

(declare-fun e!222851 () Bool)

(assert (=> b!363974 (= e!222851 true)))

(declare-fun lt!168236 () array!20653)

(declare-fun arrayCountValidKeys!0 (array!20653 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363974 (= (arrayCountValidKeys!0 lt!168236 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4289 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472))))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-datatypes ((Unit!11289 0))(
  ( (Unit!11290) )
))
(declare-fun lt!168228 () Unit!11289)

(declare-fun k!2974 () (_ BitVec 64))

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20653 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11289)

(assert (=> b!363974 (= lt!168228 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4289 i!1472 k!2974 (bvsub from!3650 #b00000000000000000000000000000001)))))

(declare-fun b!363975 () Bool)

(declare-fun e!222848 () Bool)

(assert (=> b!363975 (= e!222848 (not e!222851))))

(declare-fun res!203183 () Bool)

(assert (=> b!363975 (=> res!203183 e!222851)))

(declare-fun lt!168235 () (_ BitVec 32))

(declare-fun lt!168229 () (_ BitVec 32))

(assert (=> b!363975 (= res!203183 (or (bvsgt (bvsub from!3650 #b00000000000000000000000000000001) (size!10157 a!4289)) (bvslt i!1472 (bvsub from!3650 #b00000000000000000000000000000001)) (not (= lt!168235 (bvadd #b00000000000000000000000000000001 lt!168229)))))))

(declare-fun lt!168230 () (_ BitVec 32))

(declare-fun lt!168227 () (_ BitVec 32))

(assert (=> b!363975 (= (bvadd lt!168230 lt!168227) lt!168235)))

(assert (=> b!363975 (= lt!168235 (arrayCountValidKeys!0 lt!168236 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363975 (= lt!168230 (arrayCountValidKeys!0 lt!168236 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-fun lt!168234 () Unit!11289)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20653 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11289)

(assert (=> b!363975 (= lt!168234 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168236 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!168231 () (_ BitVec 32))

(declare-fun lt!168233 () (_ BitVec 32))

(assert (=> b!363975 (= (bvadd lt!168231 lt!168233) lt!168229)))

(assert (=> b!363975 (= lt!168229 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363975 (= lt!168231 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-fun lt!168232 () Unit!11289)

(assert (=> b!363975 (= lt!168232 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!363976 () Bool)

(assert (=> b!363976 (= e!222849 e!222848)))

(declare-fun res!203181 () Bool)

(assert (=> b!363976 (=> (not res!203181) (not e!222848))))

(assert (=> b!363976 (= res!203181 (and (= lt!168227 (bvadd #b00000000000000000000000000000001 lt!168233)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(assert (=> b!363976 (= lt!168227 (arrayCountValidKeys!0 lt!168236 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363976 (= lt!168233 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363976 (= lt!168236 (array!20654 (store (arr!9805 a!4289) i!1472 k!2974) (size!10157 a!4289)))))

(declare-fun res!203185 () Bool)

(assert (=> start!36378 (=> (not res!203185) (not e!222849))))

(assert (=> start!36378 (= res!203185 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10157 a!4289))))))

(assert (=> start!36378 e!222849))

(assert (=> start!36378 true))

(declare-fun array_inv!7277 (array!20653) Bool)

(assert (=> start!36378 (array_inv!7277 a!4289)))

(declare-fun b!363977 () Bool)

(declare-fun res!203180 () Bool)

(assert (=> b!363977 (=> (not res!203180) (not e!222849))))

(assert (=> b!363977 (= res!203180 (validKeyInArray!0 k!2974))))

(declare-fun b!363978 () Bool)

(declare-fun res!203184 () Bool)

(assert (=> b!363978 (=> (not res!203184) (not e!222849))))

(assert (=> b!363978 (= res!203184 (and (bvslt (size!10157 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10157 a!4289)) (bvsge i!1472 from!3650)))))

(assert (= (and start!36378 res!203185) b!363973))

(assert (= (and b!363973 res!203182) b!363977))

(assert (= (and b!363977 res!203180) b!363978))

(assert (= (and b!363978 res!203184) b!363976))

(assert (= (and b!363976 res!203181) b!363975))

(assert (= (and b!363975 (not res!203183)) b!363974))

(declare-fun m!361635 () Bool)

(assert (=> b!363975 m!361635))

(declare-fun m!361637 () Bool)

(assert (=> b!363975 m!361637))

(declare-fun m!361639 () Bool)

(assert (=> b!363975 m!361639))

(declare-fun m!361641 () Bool)

(assert (=> b!363975 m!361641))

(declare-fun m!361643 () Bool)

(assert (=> b!363975 m!361643))

(declare-fun m!361645 () Bool)

(assert (=> b!363975 m!361645))

(declare-fun m!361647 () Bool)

(assert (=> b!363974 m!361647))

(declare-fun m!361649 () Bool)

(assert (=> b!363974 m!361649))

(declare-fun m!361651 () Bool)

(assert (=> b!363974 m!361651))

(declare-fun m!361653 () Bool)

(assert (=> b!363976 m!361653))

(declare-fun m!361655 () Bool)

(assert (=> b!363976 m!361655))

(declare-fun m!361657 () Bool)

(assert (=> b!363976 m!361657))

(declare-fun m!361659 () Bool)

(assert (=> b!363977 m!361659))

(declare-fun m!361661 () Bool)

(assert (=> b!363973 m!361661))

(assert (=> b!363973 m!361661))

(declare-fun m!361663 () Bool)

(assert (=> b!363973 m!361663))

(declare-fun m!361665 () Bool)

(assert (=> start!36378 m!361665))

(push 1)

(assert (not b!363976))

(assert (not b!363974))

(assert (not b!363973))

(assert (not b!363977))

(assert (not b!363975))

(assert (not start!36378))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

