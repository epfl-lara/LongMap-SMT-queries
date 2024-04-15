; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36442 () Bool)

(assert start!36442)

(declare-fun b!364244 () Bool)

(declare-fun res!203551 () Bool)

(declare-fun e!222962 () Bool)

(assert (=> b!364244 (=> (not res!203551) (not e!222962))))

(declare-fun k0!2974 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364244 (= res!203551 (validKeyInArray!0 k0!2974))))

(declare-fun b!364245 () Bool)

(declare-fun e!222963 () Bool)

(assert (=> b!364245 (= e!222962 e!222963)))

(declare-fun res!203548 () Bool)

(assert (=> b!364245 (=> (not res!203548) (not e!222963))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun lt!168298 () (_ BitVec 32))

(declare-fun lt!168295 () (_ BitVec 32))

(assert (=> b!364245 (= res!203548 (and (= lt!168298 (bvadd #b00000000000000000000000000000001 lt!168295)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(declare-datatypes ((array!20718 0))(
  ( (array!20719 (arr!9838 (Array (_ BitVec 32) (_ BitVec 64))) (size!10191 (_ BitVec 32))) )
))
(declare-fun lt!168297 () array!20718)

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20718 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364245 (= lt!168298 (arrayCountValidKeys!0 lt!168297 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun a!4289 () array!20718)

(assert (=> b!364245 (= lt!168295 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364245 (= lt!168297 (array!20719 (store (arr!9838 a!4289) i!1472 k0!2974) (size!10191 a!4289)))))

(declare-fun b!364246 () Bool)

(declare-fun res!203547 () Bool)

(assert (=> b!364246 (=> (not res!203547) (not e!222962))))

(assert (=> b!364246 (= res!203547 (and (bvslt (size!10191 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10191 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!364247 () Bool)

(declare-fun res!203549 () Bool)

(assert (=> b!364247 (=> (not res!203549) (not e!222962))))

(assert (=> b!364247 (= res!203549 (not (validKeyInArray!0 (select (arr!9838 a!4289) i!1472))))))

(declare-fun res!203550 () Bool)

(assert (=> start!36442 (=> (not res!203550) (not e!222962))))

(assert (=> start!36442 (= res!203550 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10191 a!4289))))))

(assert (=> start!36442 e!222962))

(assert (=> start!36442 true))

(declare-fun array_inv!7287 (array!20718) Bool)

(assert (=> start!36442 (array_inv!7287 a!4289)))

(declare-fun b!364248 () Bool)

(assert (=> b!364248 (= e!222963 (not true))))

(assert (=> b!364248 (= (bvadd (arrayCountValidKeys!0 lt!168297 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168298) (arrayCountValidKeys!0 lt!168297 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11306 0))(
  ( (Unit!11307) )
))
(declare-fun lt!168294 () Unit!11306)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20718 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11306)

(assert (=> b!364248 (= lt!168294 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168297 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(assert (=> b!364248 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168295) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!168296 () Unit!11306)

(assert (=> b!364248 (= lt!168296 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(assert (= (and start!36442 res!203550) b!364247))

(assert (= (and b!364247 res!203549) b!364244))

(assert (= (and b!364244 res!203551) b!364246))

(assert (= (and b!364246 res!203547) b!364245))

(assert (= (and b!364245 res!203548) b!364248))

(declare-fun m!361309 () Bool)

(assert (=> start!36442 m!361309))

(declare-fun m!361311 () Bool)

(assert (=> b!364248 m!361311))

(declare-fun m!361313 () Bool)

(assert (=> b!364248 m!361313))

(declare-fun m!361315 () Bool)

(assert (=> b!364248 m!361315))

(declare-fun m!361317 () Bool)

(assert (=> b!364248 m!361317))

(declare-fun m!361319 () Bool)

(assert (=> b!364248 m!361319))

(declare-fun m!361321 () Bool)

(assert (=> b!364248 m!361321))

(declare-fun m!361323 () Bool)

(assert (=> b!364247 m!361323))

(assert (=> b!364247 m!361323))

(declare-fun m!361325 () Bool)

(assert (=> b!364247 m!361325))

(declare-fun m!361327 () Bool)

(assert (=> b!364245 m!361327))

(declare-fun m!361329 () Bool)

(assert (=> b!364245 m!361329))

(declare-fun m!361331 () Bool)

(assert (=> b!364245 m!361331))

(declare-fun m!361333 () Bool)

(assert (=> b!364244 m!361333))

(check-sat (not b!364244) (not b!364248) (not b!364247) (not start!36442) (not b!364245))
(check-sat)
