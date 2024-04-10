; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116920 () Bool)

(assert start!116920)

(declare-fun res!920336 () Bool)

(declare-fun e!780355 () Bool)

(assert (=> start!116920 (=> (not res!920336) (not e!780355))))

(declare-fun to!375 () (_ BitVec 32))

(declare-fun from!3579 () (_ BitVec 32))

(declare-datatypes ((array!93589 0))(
  ( (array!93590 (arr!45198 (Array (_ BitVec 32) (_ BitVec 64))) (size!45748 (_ BitVec 32))) )
))
(declare-fun a!4212 () array!93589)

(assert (=> start!116920 (= res!920336 (and (bvslt (size!45748 a!4212) #b01111111111111111111111111111111) (bvsge from!3579 #b00000000000000000000000000000000) (bvsge to!375 from!3579) (bvslt to!375 (size!45748 a!4212))))))

(assert (=> start!116920 e!780355))

(declare-fun array_inv!34226 (array!93589) Bool)

(assert (=> start!116920 (array_inv!34226 a!4212)))

(assert (=> start!116920 true))

(declare-fun b!1377614 () Bool)

(declare-fun res!920337 () Bool)

(assert (=> b!1377614 (=> (not res!920337) (not e!780355))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377614 (= res!920337 (not (validKeyInArray!0 (select (arr!45198 a!4212) to!375))))))

(declare-fun b!1377615 () Bool)

(declare-fun res!920338 () Bool)

(assert (=> b!1377615 (=> (not res!920338) (not e!780355))))

(assert (=> b!1377615 (= res!920338 (and (bvsge (bvadd #b00000000000000000000000000000001 to!375) from!3579) (bvsle to!375 (bvadd #b00000000000000000000000000000001 to!375))))))

(declare-fun b!1377616 () Bool)

(assert (=> b!1377616 (= e!780355 (not (bvsle to!375 (size!45748 a!4212))))))

(declare-fun arrayCountValidKeys!0 (array!93589 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377616 (= (bvadd (arrayCountValidKeys!0 a!4212 from!3579 to!375) (arrayCountValidKeys!0 a!4212 to!375 (bvadd #b00000000000000000000000000000001 to!375))) (arrayCountValidKeys!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375)))))

(declare-datatypes ((Unit!45701 0))(
  ( (Unit!45702) )
))
(declare-fun lt!606109 () Unit!45701)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93589 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45701)

(assert (=> b!1377616 (= lt!606109 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375) to!375))))

(assert (= (and start!116920 res!920336) b!1377614))

(assert (= (and b!1377614 res!920337) b!1377615))

(assert (= (and b!1377615 res!920338) b!1377616))

(declare-fun m!1261975 () Bool)

(assert (=> start!116920 m!1261975))

(declare-fun m!1261977 () Bool)

(assert (=> b!1377614 m!1261977))

(assert (=> b!1377614 m!1261977))

(declare-fun m!1261979 () Bool)

(assert (=> b!1377614 m!1261979))

(declare-fun m!1261981 () Bool)

(assert (=> b!1377616 m!1261981))

(declare-fun m!1261983 () Bool)

(assert (=> b!1377616 m!1261983))

(declare-fun m!1261985 () Bool)

(assert (=> b!1377616 m!1261985))

(declare-fun m!1261987 () Bool)

(assert (=> b!1377616 m!1261987))

(check-sat (not b!1377614) (not start!116920) (not b!1377616))
(check-sat)
