; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117074 () Bool)

(assert start!117074)

(declare-fun b!1378208 () Bool)

(declare-fun res!920746 () Bool)

(declare-fun e!780732 () Bool)

(assert (=> b!1378208 (=> (not res!920746) (not e!780732))))

(declare-datatypes ((array!93691 0))(
  ( (array!93692 (arr!45246 (Array (_ BitVec 32) (_ BitVec 64))) (size!45796 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93691)

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun i!1451 () (_ BitVec 32))

(assert (=> b!1378208 (= res!920746 (and (bvslt (size!45796 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45796 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1378209 () Bool)

(declare-fun res!920744 () Bool)

(assert (=> b!1378209 (=> (not res!920744) (not e!780732))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378209 (= res!920744 (validKeyInArray!0 (select (arr!45246 a!4094) i!1451)))))

(declare-fun b!1378210 () Bool)

(declare-fun res!920742 () Bool)

(assert (=> b!1378210 (=> (not res!920742) (not e!780732))))

(declare-fun k0!2953 () (_ BitVec 64))

(assert (=> b!1378210 (= res!920742 (not (validKeyInArray!0 k0!2953)))))

(declare-fun b!1378211 () Bool)

(declare-fun e!780734 () Bool)

(assert (=> b!1378211 (= e!780734 (not true))))

(declare-fun lt!606360 () (_ BitVec 32))

(declare-fun lt!606357 () array!93691)

(declare-fun arrayCountValidKeys!0 (array!93691 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378211 (= (bvadd (arrayCountValidKeys!0 lt!606357 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606360) (arrayCountValidKeys!0 lt!606357 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45755 0))(
  ( (Unit!45756) )
))
(declare-fun lt!606358 () Unit!45755)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93691 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45755)

(assert (=> b!1378211 (= lt!606358 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!606357 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun lt!606359 () (_ BitVec 32))

(assert (=> b!1378211 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606359) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!606356 () Unit!45755)

(assert (=> b!1378211 (= lt!606356 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1378212 () Bool)

(assert (=> b!1378212 (= e!780732 e!780734)))

(declare-fun res!920745 () Bool)

(assert (=> b!1378212 (=> (not res!920745) (not e!780734))))

(assert (=> b!1378212 (= res!920745 (and (= lt!606360 (bvsub lt!606359 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(assert (=> b!1378212 (= lt!606360 (arrayCountValidKeys!0 lt!606357 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378212 (= lt!606359 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378212 (= lt!606357 (array!93692 (store (arr!45246 a!4094) i!1451 k0!2953) (size!45796 a!4094)))))

(declare-fun res!920743 () Bool)

(assert (=> start!117074 (=> (not res!920743) (not e!780732))))

(assert (=> start!117074 (= res!920743 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45796 a!4094))))))

(assert (=> start!117074 e!780732))

(assert (=> start!117074 true))

(declare-fun array_inv!34274 (array!93691) Bool)

(assert (=> start!117074 (array_inv!34274 a!4094)))

(assert (= (and start!117074 res!920743) b!1378209))

(assert (= (and b!1378209 res!920744) b!1378210))

(assert (= (and b!1378210 res!920742) b!1378208))

(assert (= (and b!1378208 res!920746) b!1378212))

(assert (= (and b!1378212 res!920745) b!1378211))

(declare-fun m!1262669 () Bool)

(assert (=> b!1378210 m!1262669))

(declare-fun m!1262671 () Bool)

(assert (=> b!1378209 m!1262671))

(assert (=> b!1378209 m!1262671))

(declare-fun m!1262673 () Bool)

(assert (=> b!1378209 m!1262673))

(declare-fun m!1262675 () Bool)

(assert (=> start!117074 m!1262675))

(declare-fun m!1262677 () Bool)

(assert (=> b!1378211 m!1262677))

(declare-fun m!1262679 () Bool)

(assert (=> b!1378211 m!1262679))

(declare-fun m!1262681 () Bool)

(assert (=> b!1378211 m!1262681))

(declare-fun m!1262683 () Bool)

(assert (=> b!1378211 m!1262683))

(declare-fun m!1262685 () Bool)

(assert (=> b!1378211 m!1262685))

(declare-fun m!1262687 () Bool)

(assert (=> b!1378211 m!1262687))

(declare-fun m!1262689 () Bool)

(assert (=> b!1378212 m!1262689))

(declare-fun m!1262691 () Bool)

(assert (=> b!1378212 m!1262691))

(declare-fun m!1262693 () Bool)

(assert (=> b!1378212 m!1262693))

(check-sat (not b!1378212) (not b!1378211) (not b!1378210) (not start!117074) (not b!1378209))
(check-sat)
