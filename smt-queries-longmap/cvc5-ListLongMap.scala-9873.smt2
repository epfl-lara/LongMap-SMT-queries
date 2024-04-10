; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116924 () Bool)

(assert start!116924)

(declare-fun res!920356 () Bool)

(declare-fun e!780366 () Bool)

(assert (=> start!116924 (=> (not res!920356) (not e!780366))))

(declare-fun to!375 () (_ BitVec 32))

(declare-fun from!3579 () (_ BitVec 32))

(declare-datatypes ((array!93593 0))(
  ( (array!93594 (arr!45200 (Array (_ BitVec 32) (_ BitVec 64))) (size!45750 (_ BitVec 32))) )
))
(declare-fun a!4212 () array!93593)

(assert (=> start!116924 (= res!920356 (and (bvslt (size!45750 a!4212) #b01111111111111111111111111111111) (bvsge from!3579 #b00000000000000000000000000000000) (bvsge to!375 from!3579) (bvslt to!375 (size!45750 a!4212))))))

(assert (=> start!116924 e!780366))

(declare-fun array_inv!34228 (array!93593) Bool)

(assert (=> start!116924 (array_inv!34228 a!4212)))

(assert (=> start!116924 true))

(declare-fun b!1377632 () Bool)

(declare-fun res!920354 () Bool)

(assert (=> b!1377632 (=> (not res!920354) (not e!780366))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377632 (= res!920354 (not (validKeyInArray!0 (select (arr!45200 a!4212) to!375))))))

(declare-fun b!1377633 () Bool)

(declare-fun res!920355 () Bool)

(assert (=> b!1377633 (=> (not res!920355) (not e!780366))))

(assert (=> b!1377633 (= res!920355 (and (bvsge (bvadd #b00000000000000000000000000000001 to!375) from!3579) (bvsle to!375 (bvadd #b00000000000000000000000000000001 to!375))))))

(declare-fun b!1377634 () Bool)

(assert (=> b!1377634 (= e!780366 (not true))))

(declare-fun arrayCountValidKeys!0 (array!93593 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377634 (= (bvadd (arrayCountValidKeys!0 a!4212 from!3579 to!375) (arrayCountValidKeys!0 a!4212 to!375 (bvadd #b00000000000000000000000000000001 to!375))) (arrayCountValidKeys!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375)))))

(declare-datatypes ((Unit!45705 0))(
  ( (Unit!45706) )
))
(declare-fun lt!606115 () Unit!45705)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93593 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45705)

(assert (=> b!1377634 (= lt!606115 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375) to!375))))

(assert (= (and start!116924 res!920356) b!1377632))

(assert (= (and b!1377632 res!920354) b!1377633))

(assert (= (and b!1377633 res!920355) b!1377634))

(declare-fun m!1262003 () Bool)

(assert (=> start!116924 m!1262003))

(declare-fun m!1262005 () Bool)

(assert (=> b!1377632 m!1262005))

(assert (=> b!1377632 m!1262005))

(declare-fun m!1262007 () Bool)

(assert (=> b!1377632 m!1262007))

(declare-fun m!1262009 () Bool)

(assert (=> b!1377634 m!1262009))

(declare-fun m!1262011 () Bool)

(assert (=> b!1377634 m!1262011))

(declare-fun m!1262013 () Bool)

(assert (=> b!1377634 m!1262013))

(declare-fun m!1262015 () Bool)

(assert (=> b!1377634 m!1262015))

(push 1)

(assert (not b!1377632))

(assert (not start!116924))

(assert (not b!1377634))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

