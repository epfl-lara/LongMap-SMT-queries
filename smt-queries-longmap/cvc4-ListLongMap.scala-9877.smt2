; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116982 () Bool)

(assert start!116982)

(declare-fun res!920446 () Bool)

(declare-fun e!780489 () Bool)

(assert (=> start!116982 (=> (not res!920446) (not e!780489))))

(declare-fun to!360 () (_ BitVec 32))

(declare-datatypes ((array!93624 0))(
  ( (array!93625 (arr!45214 (Array (_ BitVec 32) (_ BitVec 64))) (size!45764 (_ BitVec 32))) )
))
(declare-fun a!4197 () array!93624)

(declare-fun from!3564 () (_ BitVec 32))

(assert (=> start!116982 (= res!920446 (and (bvslt (size!45764 a!4197) #b01111111111111111111111111111111) (bvsge from!3564 #b00000000000000000000000000000000) (bvsge to!360 from!3564) (bvslt to!360 (size!45764 a!4197))))))

(assert (=> start!116982 e!780489))

(declare-fun array_inv!34242 (array!93624) Bool)

(assert (=> start!116982 (array_inv!34242 a!4197)))

(assert (=> start!116982 true))

(declare-fun b!1377818 () Bool)

(declare-fun res!920444 () Bool)

(assert (=> b!1377818 (=> (not res!920444) (not e!780489))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377818 (= res!920444 (validKeyInArray!0 (select (arr!45214 a!4197) to!360)))))

(declare-fun b!1377819 () Bool)

(declare-fun res!920445 () Bool)

(assert (=> b!1377819 (=> (not res!920445) (not e!780489))))

(assert (=> b!1377819 (= res!920445 (and (bvsge (bvadd #b00000000000000000000000000000001 to!360) from!3564) (bvsle to!360 (bvadd #b00000000000000000000000000000001 to!360))))))

(declare-fun b!1377820 () Bool)

(assert (=> b!1377820 (= e!780489 (not true))))

(declare-fun arrayCountValidKeys!0 (array!93624 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377820 (= (bvadd (arrayCountValidKeys!0 a!4197 from!3564 to!360) (arrayCountValidKeys!0 a!4197 to!360 (bvadd #b00000000000000000000000000000001 to!360))) (arrayCountValidKeys!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360)))))

(declare-datatypes ((Unit!45721 0))(
  ( (Unit!45722) )
))
(declare-fun lt!606199 () Unit!45721)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93624 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45721)

(assert (=> b!1377820 (= lt!606199 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360) to!360))))

(assert (= (and start!116982 res!920446) b!1377818))

(assert (= (and b!1377818 res!920444) b!1377819))

(assert (= (and b!1377819 res!920445) b!1377820))

(declare-fun m!1262217 () Bool)

(assert (=> start!116982 m!1262217))

(declare-fun m!1262219 () Bool)

(assert (=> b!1377818 m!1262219))

(assert (=> b!1377818 m!1262219))

(declare-fun m!1262221 () Bool)

(assert (=> b!1377818 m!1262221))

(declare-fun m!1262223 () Bool)

(assert (=> b!1377820 m!1262223))

(declare-fun m!1262225 () Bool)

(assert (=> b!1377820 m!1262225))

(declare-fun m!1262227 () Bool)

(assert (=> b!1377820 m!1262227))

(declare-fun m!1262229 () Bool)

(assert (=> b!1377820 m!1262229))

(push 1)

(assert (not b!1377820))

(assert (not start!116982))

(assert (not b!1377818))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

