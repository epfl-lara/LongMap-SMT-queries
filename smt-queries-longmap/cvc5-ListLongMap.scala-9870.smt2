; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116906 () Bool)

(assert start!116906)

(declare-fun res!920274 () Bool)

(declare-fun e!780313 () Bool)

(assert (=> start!116906 (=> (not res!920274) (not e!780313))))

(declare-fun to!375 () (_ BitVec 32))

(declare-fun from!3579 () (_ BitVec 32))

(declare-datatypes ((array!93575 0))(
  ( (array!93576 (arr!45191 (Array (_ BitVec 32) (_ BitVec 64))) (size!45741 (_ BitVec 32))) )
))
(declare-fun a!4212 () array!93575)

(assert (=> start!116906 (= res!920274 (and (bvslt (size!45741 a!4212) #b01111111111111111111111111111111) (bvsge from!3579 #b00000000000000000000000000000000) (bvsge to!375 from!3579) (bvslt to!375 (size!45741 a!4212))))))

(assert (=> start!116906 e!780313))

(declare-fun array_inv!34219 (array!93575) Bool)

(assert (=> start!116906 (array_inv!34219 a!4212)))

(assert (=> start!116906 true))

(declare-fun b!1377551 () Bool)

(declare-fun res!920275 () Bool)

(assert (=> b!1377551 (=> (not res!920275) (not e!780313))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377551 (= res!920275 (not (validKeyInArray!0 (select (arr!45191 a!4212) to!375))))))

(declare-fun b!1377552 () Bool)

(declare-fun res!920273 () Bool)

(assert (=> b!1377552 (=> (not res!920273) (not e!780313))))

(assert (=> b!1377552 (= res!920273 (and (bvsge (bvadd #b00000000000000000000000000000001 to!375) from!3579) (bvsle to!375 (bvadd #b00000000000000000000000000000001 to!375))))))

(declare-fun b!1377553 () Bool)

(assert (=> b!1377553 (= e!780313 (not true))))

(declare-fun arrayCountValidKeys!0 (array!93575 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377553 (= (bvadd (arrayCountValidKeys!0 a!4212 from!3579 to!375) (arrayCountValidKeys!0 a!4212 to!375 (bvadd #b00000000000000000000000000000001 to!375))) (arrayCountValidKeys!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375)))))

(declare-datatypes ((Unit!45687 0))(
  ( (Unit!45688) )
))
(declare-fun lt!606088 () Unit!45687)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93575 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45687)

(assert (=> b!1377553 (= lt!606088 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375) to!375))))

(assert (= (and start!116906 res!920274) b!1377551))

(assert (= (and b!1377551 res!920275) b!1377552))

(assert (= (and b!1377552 res!920273) b!1377553))

(declare-fun m!1261877 () Bool)

(assert (=> start!116906 m!1261877))

(declare-fun m!1261879 () Bool)

(assert (=> b!1377551 m!1261879))

(assert (=> b!1377551 m!1261879))

(declare-fun m!1261881 () Bool)

(assert (=> b!1377551 m!1261881))

(declare-fun m!1261883 () Bool)

(assert (=> b!1377553 m!1261883))

(declare-fun m!1261885 () Bool)

(assert (=> b!1377553 m!1261885))

(declare-fun m!1261887 () Bool)

(assert (=> b!1377553 m!1261887))

(declare-fun m!1261889 () Bool)

(assert (=> b!1377553 m!1261889))

(push 1)

(assert (not start!116906))

(assert (not b!1377553))

(assert (not b!1377551))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

