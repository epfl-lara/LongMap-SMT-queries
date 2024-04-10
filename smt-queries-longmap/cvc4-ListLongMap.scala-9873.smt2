; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116928 () Bool)

(assert start!116928)

(declare-fun res!920373 () Bool)

(declare-fun e!780378 () Bool)

(assert (=> start!116928 (=> (not res!920373) (not e!780378))))

(declare-fun from!3579 () (_ BitVec 32))

(declare-fun to!375 () (_ BitVec 32))

(declare-datatypes ((array!93597 0))(
  ( (array!93598 (arr!45202 (Array (_ BitVec 32) (_ BitVec 64))) (size!45752 (_ BitVec 32))) )
))
(declare-fun a!4212 () array!93597)

(assert (=> start!116928 (= res!920373 (and (bvslt (size!45752 a!4212) #b01111111111111111111111111111111) (bvsge from!3579 #b00000000000000000000000000000000) (bvsge to!375 from!3579) (bvslt to!375 (size!45752 a!4212))))))

(assert (=> start!116928 e!780378))

(declare-fun array_inv!34230 (array!93597) Bool)

(assert (=> start!116928 (array_inv!34230 a!4212)))

(assert (=> start!116928 true))

(declare-fun b!1377650 () Bool)

(declare-fun res!920372 () Bool)

(assert (=> b!1377650 (=> (not res!920372) (not e!780378))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377650 (= res!920372 (not (validKeyInArray!0 (select (arr!45202 a!4212) to!375))))))

(declare-fun b!1377651 () Bool)

(declare-fun res!920374 () Bool)

(assert (=> b!1377651 (=> (not res!920374) (not e!780378))))

(assert (=> b!1377651 (= res!920374 (and (bvsge (bvadd #b00000000000000000000000000000001 to!375) from!3579) (bvsle to!375 (bvadd #b00000000000000000000000000000001 to!375))))))

(declare-fun b!1377652 () Bool)

(assert (=> b!1377652 (= e!780378 (not true))))

(declare-fun arrayCountValidKeys!0 (array!93597 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377652 (= (bvadd (arrayCountValidKeys!0 a!4212 from!3579 to!375) (arrayCountValidKeys!0 a!4212 to!375 (bvadd #b00000000000000000000000000000001 to!375))) (arrayCountValidKeys!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375)))))

(declare-datatypes ((Unit!45709 0))(
  ( (Unit!45710) )
))
(declare-fun lt!606121 () Unit!45709)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93597 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45709)

(assert (=> b!1377652 (= lt!606121 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375) to!375))))

(assert (= (and start!116928 res!920373) b!1377650))

(assert (= (and b!1377650 res!920372) b!1377651))

(assert (= (and b!1377651 res!920374) b!1377652))

(declare-fun m!1262031 () Bool)

(assert (=> start!116928 m!1262031))

(declare-fun m!1262033 () Bool)

(assert (=> b!1377650 m!1262033))

(assert (=> b!1377650 m!1262033))

(declare-fun m!1262035 () Bool)

(assert (=> b!1377650 m!1262035))

(declare-fun m!1262037 () Bool)

(assert (=> b!1377652 m!1262037))

(declare-fun m!1262039 () Bool)

(assert (=> b!1377652 m!1262039))

(declare-fun m!1262041 () Bool)

(assert (=> b!1377652 m!1262041))

(declare-fun m!1262043 () Bool)

(assert (=> b!1377652 m!1262043))

(push 1)

(assert (not b!1377650))

(assert (not start!116928))

(assert (not b!1377652))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

