; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116916 () Bool)

(assert start!116916)

(declare-fun res!920320 () Bool)

(declare-fun e!780343 () Bool)

(assert (=> start!116916 (=> (not res!920320) (not e!780343))))

(declare-fun to!375 () (_ BitVec 32))

(declare-fun from!3579 () (_ BitVec 32))

(declare-datatypes ((array!93585 0))(
  ( (array!93586 (arr!45196 (Array (_ BitVec 32) (_ BitVec 64))) (size!45746 (_ BitVec 32))) )
))
(declare-fun a!4212 () array!93585)

(assert (=> start!116916 (= res!920320 (and (bvslt (size!45746 a!4212) #b01111111111111111111111111111111) (bvsge from!3579 #b00000000000000000000000000000000) (bvsge to!375 from!3579) (bvslt to!375 (size!45746 a!4212))))))

(assert (=> start!116916 e!780343))

(declare-fun array_inv!34224 (array!93585) Bool)

(assert (=> start!116916 (array_inv!34224 a!4212)))

(assert (=> start!116916 true))

(declare-fun b!1377596 () Bool)

(declare-fun res!920319 () Bool)

(assert (=> b!1377596 (=> (not res!920319) (not e!780343))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377596 (= res!920319 (not (validKeyInArray!0 (select (arr!45196 a!4212) to!375))))))

(declare-fun b!1377597 () Bool)

(declare-fun res!920318 () Bool)

(assert (=> b!1377597 (=> (not res!920318) (not e!780343))))

(assert (=> b!1377597 (= res!920318 (and (bvsge (bvadd #b00000000000000000000000000000001 to!375) from!3579) (bvsle to!375 (bvadd #b00000000000000000000000000000001 to!375))))))

(declare-fun b!1377598 () Bool)

(assert (=> b!1377598 (= e!780343 (not true))))

(declare-fun arrayCountValidKeys!0 (array!93585 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377598 (= (bvadd (arrayCountValidKeys!0 a!4212 from!3579 to!375) (arrayCountValidKeys!0 a!4212 to!375 (bvadd #b00000000000000000000000000000001 to!375))) (arrayCountValidKeys!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375)))))

(declare-datatypes ((Unit!45697 0))(
  ( (Unit!45698) )
))
(declare-fun lt!606103 () Unit!45697)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93585 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45697)

(assert (=> b!1377598 (= lt!606103 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375) to!375))))

(assert (= (and start!116916 res!920320) b!1377596))

(assert (= (and b!1377596 res!920319) b!1377597))

(assert (= (and b!1377597 res!920318) b!1377598))

(declare-fun m!1261947 () Bool)

(assert (=> start!116916 m!1261947))

(declare-fun m!1261949 () Bool)

(assert (=> b!1377596 m!1261949))

(assert (=> b!1377596 m!1261949))

(declare-fun m!1261951 () Bool)

(assert (=> b!1377596 m!1261951))

(declare-fun m!1261953 () Bool)

(assert (=> b!1377598 m!1261953))

(declare-fun m!1261955 () Bool)

(assert (=> b!1377598 m!1261955))

(declare-fun m!1261957 () Bool)

(assert (=> b!1377598 m!1261957))

(declare-fun m!1261959 () Bool)

(assert (=> b!1377598 m!1261959))

(push 1)

(assert (not b!1377598))

(assert (not start!116916))

(assert (not b!1377596))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

