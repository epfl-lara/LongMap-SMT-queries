; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116922 () Bool)

(assert start!116922)

(declare-fun res!920346 () Bool)

(declare-fun e!780360 () Bool)

(assert (=> start!116922 (=> (not res!920346) (not e!780360))))

(declare-fun from!3579 () (_ BitVec 32))

(declare-datatypes ((array!93591 0))(
  ( (array!93592 (arr!45199 (Array (_ BitVec 32) (_ BitVec 64))) (size!45749 (_ BitVec 32))) )
))
(declare-fun a!4212 () array!93591)

(declare-fun to!375 () (_ BitVec 32))

(assert (=> start!116922 (= res!920346 (and (bvslt (size!45749 a!4212) #b01111111111111111111111111111111) (bvsge from!3579 #b00000000000000000000000000000000) (bvsge to!375 from!3579) (bvslt to!375 (size!45749 a!4212))))))

(assert (=> start!116922 e!780360))

(declare-fun array_inv!34227 (array!93591) Bool)

(assert (=> start!116922 (array_inv!34227 a!4212)))

(assert (=> start!116922 true))

(declare-fun b!1377623 () Bool)

(declare-fun res!920345 () Bool)

(assert (=> b!1377623 (=> (not res!920345) (not e!780360))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377623 (= res!920345 (not (validKeyInArray!0 (select (arr!45199 a!4212) to!375))))))

(declare-fun b!1377624 () Bool)

(declare-fun res!920347 () Bool)

(assert (=> b!1377624 (=> (not res!920347) (not e!780360))))

(assert (=> b!1377624 (= res!920347 (and (bvsge (bvadd #b00000000000000000000000000000001 to!375) from!3579) (bvsle to!375 (bvadd #b00000000000000000000000000000001 to!375))))))

(declare-fun b!1377625 () Bool)

(assert (=> b!1377625 (= e!780360 (not (bvsle to!375 (size!45749 a!4212))))))

(declare-fun arrayCountValidKeys!0 (array!93591 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377625 (= (bvadd (arrayCountValidKeys!0 a!4212 from!3579 to!375) (arrayCountValidKeys!0 a!4212 to!375 (bvadd #b00000000000000000000000000000001 to!375))) (arrayCountValidKeys!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375)))))

(declare-datatypes ((Unit!45703 0))(
  ( (Unit!45704) )
))
(declare-fun lt!606112 () Unit!45703)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93591 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45703)

(assert (=> b!1377625 (= lt!606112 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375) to!375))))

(assert (= (and start!116922 res!920346) b!1377623))

(assert (= (and b!1377623 res!920345) b!1377624))

(assert (= (and b!1377624 res!920347) b!1377625))

(declare-fun m!1261989 () Bool)

(assert (=> start!116922 m!1261989))

(declare-fun m!1261991 () Bool)

(assert (=> b!1377623 m!1261991))

(assert (=> b!1377623 m!1261991))

(declare-fun m!1261993 () Bool)

(assert (=> b!1377623 m!1261993))

(declare-fun m!1261995 () Bool)

(assert (=> b!1377625 m!1261995))

(declare-fun m!1261997 () Bool)

(assert (=> b!1377625 m!1261997))

(declare-fun m!1261999 () Bool)

(assert (=> b!1377625 m!1261999))

(declare-fun m!1262001 () Bool)

(assert (=> b!1377625 m!1262001))

(push 1)

(assert (not start!116922))

(assert (not b!1377625))

(assert (not b!1377623))

(check-sat)

(pop 1)

(push 1)

(check-sat)

