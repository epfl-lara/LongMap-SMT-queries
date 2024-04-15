; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117170 () Bool)

(assert start!117170)

(declare-fun b!1378909 () Bool)

(declare-fun res!921487 () Bool)

(declare-fun e!781134 () Bool)

(assert (=> b!1378909 (=> (not res!921487) (not e!781134))))

(declare-datatypes ((array!93741 0))(
  ( (array!93742 (arr!45271 (Array (_ BitVec 32) (_ BitVec 64))) (size!45823 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93741)

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun i!1451 () (_ BitVec 32))

(assert (=> b!1378909 (= res!921487 (and (bvslt (size!45823 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45823 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1378910 () Bool)

(declare-fun res!921490 () Bool)

(declare-fun e!781135 () Bool)

(assert (=> b!1378910 (=> (not res!921490) (not e!781135))))

(assert (=> b!1378910 (= res!921490 (bvsgt from!3466 #b00000000000000000000000000000000))))

(declare-fun b!1378911 () Bool)

(assert (=> b!1378911 (= e!781134 e!781135)))

(declare-fun res!921486 () Bool)

(assert (=> b!1378911 (=> (not res!921486) (not e!781135))))

(declare-fun lt!606854 () (_ BitVec 32))

(declare-fun k0!2953 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!93741 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378911 (= res!921486 (= (arrayCountValidKeys!0 (array!93742 (store (arr!45271 a!4094) i!1451 k0!2953) (size!45823 a!4094)) from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub lt!606854 #b00000000000000000000000000000001)))))

(assert (=> b!1378911 (= lt!606854 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun b!1378912 () Bool)

(declare-fun res!921491 () Bool)

(assert (=> b!1378912 (=> (not res!921491) (not e!781134))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378912 (= res!921491 (validKeyInArray!0 (select (arr!45271 a!4094) i!1451)))))

(declare-fun b!1378913 () Bool)

(assert (=> b!1378913 (= e!781135 (not (and (bvsge (bvadd #b00000000000000000000000000000001 i!1451) (bvsub from!3466 #b00000000000000000000000000000001)) (bvsge from!3466 (bvsub from!3466 #b00000000000000000000000000000001)) (bvsle from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))))

(assert (=> b!1378913 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606854) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45660 0))(
  ( (Unit!45661) )
))
(declare-fun lt!606853 () Unit!45660)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93741 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45660)

(assert (=> b!1378913 (= lt!606853 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun res!921488 () Bool)

(assert (=> start!117170 (=> (not res!921488) (not e!781134))))

(assert (=> start!117170 (= res!921488 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45823 a!4094))))))

(assert (=> start!117170 e!781134))

(assert (=> start!117170 true))

(declare-fun array_inv!34504 (array!93741) Bool)

(assert (=> start!117170 (array_inv!34504 a!4094)))

(declare-fun b!1378914 () Bool)

(declare-fun res!921489 () Bool)

(assert (=> b!1378914 (=> (not res!921489) (not e!781134))))

(assert (=> b!1378914 (= res!921489 (not (validKeyInArray!0 k0!2953)))))

(assert (= (and start!117170 res!921488) b!1378912))

(assert (= (and b!1378912 res!921491) b!1378914))

(assert (= (and b!1378914 res!921489) b!1378909))

(assert (= (and b!1378909 res!921487) b!1378911))

(assert (= (and b!1378911 res!921486) b!1378910))

(assert (= (and b!1378910 res!921490) b!1378913))

(declare-fun m!1263303 () Bool)

(assert (=> b!1378914 m!1263303))

(declare-fun m!1263305 () Bool)

(assert (=> start!117170 m!1263305))

(declare-fun m!1263307 () Bool)

(assert (=> b!1378911 m!1263307))

(declare-fun m!1263309 () Bool)

(assert (=> b!1378911 m!1263309))

(declare-fun m!1263311 () Bool)

(assert (=> b!1378911 m!1263311))

(declare-fun m!1263313 () Bool)

(assert (=> b!1378913 m!1263313))

(declare-fun m!1263315 () Bool)

(assert (=> b!1378913 m!1263315))

(declare-fun m!1263317 () Bool)

(assert (=> b!1378913 m!1263317))

(declare-fun m!1263319 () Bool)

(assert (=> b!1378912 m!1263319))

(assert (=> b!1378912 m!1263319))

(declare-fun m!1263321 () Bool)

(assert (=> b!1378912 m!1263321))

(check-sat (not b!1378914) (not start!117170) (not b!1378913) (not b!1378911) (not b!1378912))
(check-sat)
