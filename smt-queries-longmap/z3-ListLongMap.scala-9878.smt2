; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116986 () Bool)

(assert start!116986)

(declare-fun res!920464 () Bool)

(declare-fun e!780501 () Bool)

(assert (=> start!116986 (=> (not res!920464) (not e!780501))))

(declare-datatypes ((array!93628 0))(
  ( (array!93629 (arr!45216 (Array (_ BitVec 32) (_ BitVec 64))) (size!45766 (_ BitVec 32))) )
))
(declare-fun a!4197 () array!93628)

(declare-fun from!3564 () (_ BitVec 32))

(declare-fun to!360 () (_ BitVec 32))

(assert (=> start!116986 (= res!920464 (and (bvslt (size!45766 a!4197) #b01111111111111111111111111111111) (bvsge from!3564 #b00000000000000000000000000000000) (bvsge to!360 from!3564) (bvslt to!360 (size!45766 a!4197))))))

(assert (=> start!116986 e!780501))

(declare-fun array_inv!34244 (array!93628) Bool)

(assert (=> start!116986 (array_inv!34244 a!4197)))

(assert (=> start!116986 true))

(declare-fun b!1377836 () Bool)

(declare-fun res!920462 () Bool)

(assert (=> b!1377836 (=> (not res!920462) (not e!780501))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377836 (= res!920462 (validKeyInArray!0 (select (arr!45216 a!4197) to!360)))))

(declare-fun b!1377837 () Bool)

(declare-fun res!920463 () Bool)

(assert (=> b!1377837 (=> (not res!920463) (not e!780501))))

(assert (=> b!1377837 (= res!920463 (and (bvsge (bvadd #b00000000000000000000000000000001 to!360) from!3564) (bvsle to!360 (bvadd #b00000000000000000000000000000001 to!360))))))

(declare-fun b!1377838 () Bool)

(assert (=> b!1377838 (= e!780501 (not true))))

(declare-fun arrayCountValidKeys!0 (array!93628 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377838 (= (bvadd (arrayCountValidKeys!0 a!4197 from!3564 to!360) (arrayCountValidKeys!0 a!4197 to!360 (bvadd #b00000000000000000000000000000001 to!360))) (arrayCountValidKeys!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360)))))

(declare-datatypes ((Unit!45725 0))(
  ( (Unit!45726) )
))
(declare-fun lt!606205 () Unit!45725)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93628 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45725)

(assert (=> b!1377838 (= lt!606205 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360) to!360))))

(assert (= (and start!116986 res!920464) b!1377836))

(assert (= (and b!1377836 res!920462) b!1377837))

(assert (= (and b!1377837 res!920463) b!1377838))

(declare-fun m!1262245 () Bool)

(assert (=> start!116986 m!1262245))

(declare-fun m!1262247 () Bool)

(assert (=> b!1377836 m!1262247))

(assert (=> b!1377836 m!1262247))

(declare-fun m!1262249 () Bool)

(assert (=> b!1377836 m!1262249))

(declare-fun m!1262251 () Bool)

(assert (=> b!1377838 m!1262251))

(declare-fun m!1262253 () Bool)

(assert (=> b!1377838 m!1262253))

(declare-fun m!1262255 () Bool)

(assert (=> b!1377838 m!1262255))

(declare-fun m!1262257 () Bool)

(assert (=> b!1377838 m!1262257))

(check-sat (not b!1377838) (not start!116986) (not b!1377836))
