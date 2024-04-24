; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117148 () Bool)

(assert start!117148)

(declare-fun res!920849 () Bool)

(declare-fun e!781200 () Bool)

(assert (=> start!117148 (=> (not res!920849) (not e!781200))))

(declare-fun to!375 () (_ BitVec 32))

(declare-fun from!3579 () (_ BitVec 32))

(declare-datatypes ((array!93703 0))(
  ( (array!93704 (arr!45250 (Array (_ BitVec 32) (_ BitVec 64))) (size!45801 (_ BitVec 32))) )
))
(declare-fun a!4212 () array!93703)

(assert (=> start!117148 (= res!920849 (and (bvslt (size!45801 a!4212) #b01111111111111111111111111111111) (bvsge from!3579 #b00000000000000000000000000000000) (bvsge to!375 from!3579) (bvslt to!375 (size!45801 a!4212))))))

(assert (=> start!117148 e!781200))

(declare-fun array_inv!34531 (array!93703) Bool)

(assert (=> start!117148 (array_inv!34531 a!4212)))

(assert (=> start!117148 true))

(declare-fun b!1378919 () Bool)

(declare-fun res!920848 () Bool)

(assert (=> b!1378919 (=> (not res!920848) (not e!781200))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378919 (= res!920848 (not (validKeyInArray!0 (select (arr!45250 a!4212) to!375))))))

(declare-fun b!1378920 () Bool)

(declare-fun res!920850 () Bool)

(assert (=> b!1378920 (=> (not res!920850) (not e!781200))))

(assert (=> b!1378920 (= res!920850 (and (bvsge (bvadd #b00000000000000000000000000000001 to!375) from!3579) (bvsle to!375 (bvadd #b00000000000000000000000000000001 to!375))))))

(declare-fun b!1378921 () Bool)

(assert (=> b!1378921 (= e!781200 (not (bvsle to!375 (size!45801 a!4212))))))

(declare-fun arrayCountValidKeys!0 (array!93703 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378921 (= (bvadd (arrayCountValidKeys!0 a!4212 from!3579 to!375) (arrayCountValidKeys!0 a!4212 to!375 (bvadd #b00000000000000000000000000000001 to!375))) (arrayCountValidKeys!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375)))))

(declare-datatypes ((Unit!45638 0))(
  ( (Unit!45639) )
))
(declare-fun lt!606588 () Unit!45638)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93703 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45638)

(assert (=> b!1378921 (= lt!606588 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375) to!375))))

(assert (= (and start!117148 res!920849) b!1378919))

(assert (= (and b!1378919 res!920848) b!1378920))

(assert (= (and b!1378920 res!920850) b!1378921))

(declare-fun m!1263597 () Bool)

(assert (=> start!117148 m!1263597))

(declare-fun m!1263599 () Bool)

(assert (=> b!1378919 m!1263599))

(assert (=> b!1378919 m!1263599))

(declare-fun m!1263601 () Bool)

(assert (=> b!1378919 m!1263601))

(declare-fun m!1263603 () Bool)

(assert (=> b!1378921 m!1263603))

(declare-fun m!1263605 () Bool)

(assert (=> b!1378921 m!1263605))

(declare-fun m!1263607 () Bool)

(assert (=> b!1378921 m!1263607))

(declare-fun m!1263609 () Bool)

(assert (=> b!1378921 m!1263609))

(check-sat (not b!1378919) (not b!1378921) (not start!117148))
(check-sat)
