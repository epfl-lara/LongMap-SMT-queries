; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116910 () Bool)

(assert start!116910)

(declare-fun res!920292 () Bool)

(declare-fun e!780324 () Bool)

(assert (=> start!116910 (=> (not res!920292) (not e!780324))))

(declare-fun to!375 () (_ BitVec 32))

(declare-datatypes ((array!93579 0))(
  ( (array!93580 (arr!45193 (Array (_ BitVec 32) (_ BitVec 64))) (size!45743 (_ BitVec 32))) )
))
(declare-fun a!4212 () array!93579)

(declare-fun from!3579 () (_ BitVec 32))

(assert (=> start!116910 (= res!920292 (and (bvslt (size!45743 a!4212) #b01111111111111111111111111111111) (bvsge from!3579 #b00000000000000000000000000000000) (bvsge to!375 from!3579) (bvslt to!375 (size!45743 a!4212))))))

(assert (=> start!116910 e!780324))

(declare-fun array_inv!34221 (array!93579) Bool)

(assert (=> start!116910 (array_inv!34221 a!4212)))

(assert (=> start!116910 true))

(declare-fun b!1377569 () Bool)

(declare-fun res!920291 () Bool)

(assert (=> b!1377569 (=> (not res!920291) (not e!780324))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377569 (= res!920291 (not (validKeyInArray!0 (select (arr!45193 a!4212) to!375))))))

(declare-fun b!1377570 () Bool)

(declare-fun res!920293 () Bool)

(assert (=> b!1377570 (=> (not res!920293) (not e!780324))))

(assert (=> b!1377570 (= res!920293 (and (bvsge (bvadd #b00000000000000000000000000000001 to!375) from!3579) (bvsle to!375 (bvadd #b00000000000000000000000000000001 to!375))))))

(declare-fun b!1377571 () Bool)

(assert (=> b!1377571 (= e!780324 (not true))))

(declare-fun arrayCountValidKeys!0 (array!93579 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377571 (= (bvadd (arrayCountValidKeys!0 a!4212 from!3579 to!375) (arrayCountValidKeys!0 a!4212 to!375 (bvadd #b00000000000000000000000000000001 to!375))) (arrayCountValidKeys!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375)))))

(declare-datatypes ((Unit!45691 0))(
  ( (Unit!45692) )
))
(declare-fun lt!606094 () Unit!45691)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93579 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45691)

(assert (=> b!1377571 (= lt!606094 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375) to!375))))

(assert (= (and start!116910 res!920292) b!1377569))

(assert (= (and b!1377569 res!920291) b!1377570))

(assert (= (and b!1377570 res!920293) b!1377571))

(declare-fun m!1261905 () Bool)

(assert (=> start!116910 m!1261905))

(declare-fun m!1261907 () Bool)

(assert (=> b!1377569 m!1261907))

(assert (=> b!1377569 m!1261907))

(declare-fun m!1261909 () Bool)

(assert (=> b!1377569 m!1261909))

(declare-fun m!1261911 () Bool)

(assert (=> b!1377571 m!1261911))

(declare-fun m!1261913 () Bool)

(assert (=> b!1377571 m!1261913))

(declare-fun m!1261915 () Bool)

(assert (=> b!1377571 m!1261915))

(declare-fun m!1261917 () Bool)

(assert (=> b!1377571 m!1261917))

(push 1)

(assert (not b!1377569))

(assert (not start!116910))

(assert (not b!1377571))

(check-sat)

