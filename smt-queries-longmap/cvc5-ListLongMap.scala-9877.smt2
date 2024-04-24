; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117212 () Bool)

(assert start!117212)

(declare-fun res!920966 () Bool)

(declare-fun e!781337 () Bool)

(assert (=> start!117212 (=> (not res!920966) (not e!781337))))

(declare-fun to!360 () (_ BitVec 32))

(declare-datatypes ((array!93740 0))(
  ( (array!93741 (arr!45267 (Array (_ BitVec 32) (_ BitVec 64))) (size!45818 (_ BitVec 32))) )
))
(declare-fun a!4197 () array!93740)

(declare-fun from!3564 () (_ BitVec 32))

(assert (=> start!117212 (= res!920966 (and (bvslt (size!45818 a!4197) #b01111111111111111111111111111111) (bvsge from!3564 #b00000000000000000000000000000000) (bvsge to!360 from!3564) (bvslt to!360 (size!45818 a!4197))))))

(assert (=> start!117212 e!781337))

(declare-fun array_inv!34548 (array!93740) Bool)

(assert (=> start!117212 (array_inv!34548 a!4197)))

(assert (=> start!117212 true))

(declare-fun b!1379124 () Bool)

(declare-fun res!920967 () Bool)

(assert (=> b!1379124 (=> (not res!920967) (not e!781337))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379124 (= res!920967 (validKeyInArray!0 (select (arr!45267 a!4197) to!360)))))

(declare-fun b!1379125 () Bool)

(declare-fun res!920965 () Bool)

(assert (=> b!1379125 (=> (not res!920965) (not e!781337))))

(assert (=> b!1379125 (= res!920965 (and (bvsge (bvadd #b00000000000000000000000000000001 to!360) from!3564) (bvsle to!360 (bvadd #b00000000000000000000000000000001 to!360))))))

(declare-fun b!1379126 () Bool)

(assert (=> b!1379126 (= e!781337 (not true))))

(declare-fun arrayCountValidKeys!0 (array!93740 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379126 (= (bvadd (arrayCountValidKeys!0 a!4197 from!3564 to!360) (arrayCountValidKeys!0 a!4197 to!360 (bvadd #b00000000000000000000000000000001 to!360))) (arrayCountValidKeys!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360)))))

(declare-datatypes ((Unit!45660 0))(
  ( (Unit!45661) )
))
(declare-fun lt!606679 () Unit!45660)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93740 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45660)

(assert (=> b!1379126 (= lt!606679 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360) to!360))))

(assert (= (and start!117212 res!920966) b!1379124))

(assert (= (and b!1379124 res!920967) b!1379125))

(assert (= (and b!1379125 res!920965) b!1379126))

(declare-fun m!1263845 () Bool)

(assert (=> start!117212 m!1263845))

(declare-fun m!1263847 () Bool)

(assert (=> b!1379124 m!1263847))

(assert (=> b!1379124 m!1263847))

(declare-fun m!1263849 () Bool)

(assert (=> b!1379124 m!1263849))

(declare-fun m!1263851 () Bool)

(assert (=> b!1379126 m!1263851))

(declare-fun m!1263853 () Bool)

(assert (=> b!1379126 m!1263853))

(declare-fun m!1263855 () Bool)

(assert (=> b!1379126 m!1263855))

(declare-fun m!1263857 () Bool)

(assert (=> b!1379126 m!1263857))

(push 1)

(assert (not b!1379124))

(assert (not start!117212))

(assert (not b!1379126))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

