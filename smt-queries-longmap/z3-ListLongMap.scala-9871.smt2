; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116914 () Bool)

(assert start!116914)

(declare-fun res!920309 () Bool)

(declare-fun e!780336 () Bool)

(assert (=> start!116914 (=> (not res!920309) (not e!780336))))

(declare-fun to!375 () (_ BitVec 32))

(declare-fun from!3579 () (_ BitVec 32))

(declare-datatypes ((array!93583 0))(
  ( (array!93584 (arr!45195 (Array (_ BitVec 32) (_ BitVec 64))) (size!45745 (_ BitVec 32))) )
))
(declare-fun a!4212 () array!93583)

(assert (=> start!116914 (= res!920309 (and (bvslt (size!45745 a!4212) #b01111111111111111111111111111111) (bvsge from!3579 #b00000000000000000000000000000000) (bvsge to!375 from!3579) (bvslt to!375 (size!45745 a!4212))))))

(assert (=> start!116914 e!780336))

(declare-fun array_inv!34223 (array!93583) Bool)

(assert (=> start!116914 (array_inv!34223 a!4212)))

(assert (=> start!116914 true))

(declare-fun b!1377587 () Bool)

(declare-fun res!920310 () Bool)

(assert (=> b!1377587 (=> (not res!920310) (not e!780336))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377587 (= res!920310 (not (validKeyInArray!0 (select (arr!45195 a!4212) to!375))))))

(declare-fun b!1377588 () Bool)

(declare-fun res!920311 () Bool)

(assert (=> b!1377588 (=> (not res!920311) (not e!780336))))

(assert (=> b!1377588 (= res!920311 (and (bvsge (bvadd #b00000000000000000000000000000001 to!375) from!3579) (bvsle to!375 (bvadd #b00000000000000000000000000000001 to!375))))))

(declare-fun b!1377589 () Bool)

(assert (=> b!1377589 (= e!780336 (not true))))

(declare-fun arrayCountValidKeys!0 (array!93583 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377589 (= (bvadd (arrayCountValidKeys!0 a!4212 from!3579 to!375) (arrayCountValidKeys!0 a!4212 to!375 (bvadd #b00000000000000000000000000000001 to!375))) (arrayCountValidKeys!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375)))))

(declare-datatypes ((Unit!45695 0))(
  ( (Unit!45696) )
))
(declare-fun lt!606100 () Unit!45695)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93583 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45695)

(assert (=> b!1377589 (= lt!606100 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375) to!375))))

(assert (= (and start!116914 res!920309) b!1377587))

(assert (= (and b!1377587 res!920310) b!1377588))

(assert (= (and b!1377588 res!920311) b!1377589))

(declare-fun m!1261933 () Bool)

(assert (=> start!116914 m!1261933))

(declare-fun m!1261935 () Bool)

(assert (=> b!1377587 m!1261935))

(assert (=> b!1377587 m!1261935))

(declare-fun m!1261937 () Bool)

(assert (=> b!1377587 m!1261937))

(declare-fun m!1261939 () Bool)

(assert (=> b!1377589 m!1261939))

(declare-fun m!1261941 () Bool)

(assert (=> b!1377589 m!1261941))

(declare-fun m!1261943 () Bool)

(assert (=> b!1377589 m!1261943))

(declare-fun m!1261945 () Bool)

(assert (=> b!1377589 m!1261945))

(check-sat (not b!1377587) (not b!1377589) (not start!116914))
