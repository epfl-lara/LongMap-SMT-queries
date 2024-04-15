; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116982 () Bool)

(assert start!116982)

(declare-fun res!920447 () Bool)

(declare-fun e!780474 () Bool)

(assert (=> start!116982 (=> (not res!920447) (not e!780474))))

(declare-fun to!360 () (_ BitVec 32))

(declare-datatypes ((array!93580 0))(
  ( (array!93581 (arr!45192 (Array (_ BitVec 32) (_ BitVec 64))) (size!45744 (_ BitVec 32))) )
))
(declare-fun a!4197 () array!93580)

(declare-fun from!3564 () (_ BitVec 32))

(assert (=> start!116982 (= res!920447 (and (bvslt (size!45744 a!4197) #b01111111111111111111111111111111) (bvsge from!3564 #b00000000000000000000000000000000) (bvsge to!360 from!3564) (bvslt to!360 (size!45744 a!4197))))))

(assert (=> start!116982 e!780474))

(declare-fun array_inv!34425 (array!93580) Bool)

(assert (=> start!116982 (array_inv!34425 a!4197)))

(assert (=> start!116982 true))

(declare-fun b!1377772 () Bool)

(declare-fun res!920446 () Bool)

(assert (=> b!1377772 (=> (not res!920446) (not e!780474))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377772 (= res!920446 (validKeyInArray!0 (select (arr!45192 a!4197) to!360)))))

(declare-fun b!1377773 () Bool)

(declare-fun res!920445 () Bool)

(assert (=> b!1377773 (=> (not res!920445) (not e!780474))))

(assert (=> b!1377773 (= res!920445 (and (bvsge (bvadd #b00000000000000000000000000000001 to!360) from!3564) (bvsle to!360 (bvadd #b00000000000000000000000000000001 to!360))))))

(declare-fun b!1377774 () Bool)

(assert (=> b!1377774 (= e!780474 (not true))))

(declare-fun arrayCountValidKeys!0 (array!93580 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377774 (= (bvadd (arrayCountValidKeys!0 a!4197 from!3564 to!360) (arrayCountValidKeys!0 a!4197 to!360 (bvadd #b00000000000000000000000000000001 to!360))) (arrayCountValidKeys!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360)))))

(declare-datatypes ((Unit!45568 0))(
  ( (Unit!45569) )
))
(declare-fun lt!606023 () Unit!45568)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93580 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45568)

(assert (=> b!1377774 (= lt!606023 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360) to!360))))

(assert (= (and start!116982 res!920447) b!1377772))

(assert (= (and b!1377772 res!920446) b!1377773))

(assert (= (and b!1377773 res!920445) b!1377774))

(declare-fun m!1261747 () Bool)

(assert (=> start!116982 m!1261747))

(declare-fun m!1261749 () Bool)

(assert (=> b!1377772 m!1261749))

(assert (=> b!1377772 m!1261749))

(declare-fun m!1261751 () Bool)

(assert (=> b!1377772 m!1261751))

(declare-fun m!1261753 () Bool)

(assert (=> b!1377774 m!1261753))

(declare-fun m!1261755 () Bool)

(assert (=> b!1377774 m!1261755))

(declare-fun m!1261757 () Bool)

(assert (=> b!1377774 m!1261757))

(declare-fun m!1261759 () Bool)

(assert (=> b!1377774 m!1261759))

(push 1)

(assert (not b!1377772))

(assert (not start!116982))

(assert (not b!1377774))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

