; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116918 () Bool)

(assert start!116918)

(declare-fun res!920329 () Bool)

(declare-fun e!780348 () Bool)

(assert (=> start!116918 (=> (not res!920329) (not e!780348))))

(declare-fun to!375 () (_ BitVec 32))

(declare-fun from!3579 () (_ BitVec 32))

(declare-datatypes ((array!93587 0))(
  ( (array!93588 (arr!45197 (Array (_ BitVec 32) (_ BitVec 64))) (size!45747 (_ BitVec 32))) )
))
(declare-fun a!4212 () array!93587)

(assert (=> start!116918 (= res!920329 (and (bvslt (size!45747 a!4212) #b01111111111111111111111111111111) (bvsge from!3579 #b00000000000000000000000000000000) (bvsge to!375 from!3579) (bvslt to!375 (size!45747 a!4212))))))

(assert (=> start!116918 e!780348))

(declare-fun array_inv!34225 (array!93587) Bool)

(assert (=> start!116918 (array_inv!34225 a!4212)))

(assert (=> start!116918 true))

(declare-fun b!1377605 () Bool)

(declare-fun res!920328 () Bool)

(assert (=> b!1377605 (=> (not res!920328) (not e!780348))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377605 (= res!920328 (not (validKeyInArray!0 (select (arr!45197 a!4212) to!375))))))

(declare-fun b!1377606 () Bool)

(declare-fun res!920327 () Bool)

(assert (=> b!1377606 (=> (not res!920327) (not e!780348))))

(assert (=> b!1377606 (= res!920327 (and (bvsge (bvadd #b00000000000000000000000000000001 to!375) from!3579) (bvsle to!375 (bvadd #b00000000000000000000000000000001 to!375))))))

(declare-fun b!1377607 () Bool)

(assert (=> b!1377607 (= e!780348 (not (bvsle to!375 (size!45747 a!4212))))))

(declare-fun arrayCountValidKeys!0 (array!93587 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377607 (= (bvadd (arrayCountValidKeys!0 a!4212 from!3579 to!375) (arrayCountValidKeys!0 a!4212 to!375 (bvadd #b00000000000000000000000000000001 to!375))) (arrayCountValidKeys!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375)))))

(declare-datatypes ((Unit!45699 0))(
  ( (Unit!45700) )
))
(declare-fun lt!606106 () Unit!45699)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93587 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45699)

(assert (=> b!1377607 (= lt!606106 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375) to!375))))

(assert (= (and start!116918 res!920329) b!1377605))

(assert (= (and b!1377605 res!920328) b!1377606))

(assert (= (and b!1377606 res!920327) b!1377607))

(declare-fun m!1261961 () Bool)

(assert (=> start!116918 m!1261961))

(declare-fun m!1261963 () Bool)

(assert (=> b!1377605 m!1261963))

(assert (=> b!1377605 m!1261963))

(declare-fun m!1261965 () Bool)

(assert (=> b!1377605 m!1261965))

(declare-fun m!1261967 () Bool)

(assert (=> b!1377607 m!1261967))

(declare-fun m!1261969 () Bool)

(assert (=> b!1377607 m!1261969))

(declare-fun m!1261971 () Bool)

(assert (=> b!1377607 m!1261971))

(declare-fun m!1261973 () Bool)

(assert (=> b!1377607 m!1261973))

(push 1)

(assert (not b!1377605))

(assert (not start!116918))

(assert (not b!1377607))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

