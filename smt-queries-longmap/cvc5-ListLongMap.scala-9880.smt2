; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116994 () Bool)

(assert start!116994)

(declare-fun res!920500 () Bool)

(declare-fun e!780511 () Bool)

(assert (=> start!116994 (=> (not res!920500) (not e!780511))))

(declare-fun to!360 () (_ BitVec 32))

(declare-datatypes ((array!93592 0))(
  ( (array!93593 (arr!45198 (Array (_ BitVec 32) (_ BitVec 64))) (size!45750 (_ BitVec 32))) )
))
(declare-fun a!4197 () array!93592)

(declare-fun from!3564 () (_ BitVec 32))

(assert (=> start!116994 (= res!920500 (and (bvslt (size!45750 a!4197) #b01111111111111111111111111111111) (bvsge from!3564 #b00000000000000000000000000000000) (bvsge to!360 from!3564) (bvslt to!360 (size!45750 a!4197))))))

(assert (=> start!116994 e!780511))

(declare-fun array_inv!34431 (array!93592) Bool)

(assert (=> start!116994 (array_inv!34431 a!4197)))

(assert (=> start!116994 true))

(declare-fun b!1377826 () Bool)

(declare-fun res!920499 () Bool)

(assert (=> b!1377826 (=> (not res!920499) (not e!780511))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377826 (= res!920499 (validKeyInArray!0 (select (arr!45198 a!4197) to!360)))))

(declare-fun b!1377827 () Bool)

(declare-fun res!920501 () Bool)

(assert (=> b!1377827 (=> (not res!920501) (not e!780511))))

(assert (=> b!1377827 (= res!920501 (and (bvsge (bvadd #b00000000000000000000000000000001 to!360) from!3564) (bvsle to!360 (bvadd #b00000000000000000000000000000001 to!360))))))

(declare-fun b!1377828 () Bool)

(assert (=> b!1377828 (= e!780511 (not true))))

(declare-fun arrayCountValidKeys!0 (array!93592 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377828 (= (bvadd (arrayCountValidKeys!0 a!4197 from!3564 to!360) (arrayCountValidKeys!0 a!4197 to!360 (bvadd #b00000000000000000000000000000001 to!360))) (arrayCountValidKeys!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360)))))

(declare-datatypes ((Unit!45580 0))(
  ( (Unit!45581) )
))
(declare-fun lt!606041 () Unit!45580)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93592 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45580)

(assert (=> b!1377828 (= lt!606041 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360) to!360))))

(assert (= (and start!116994 res!920500) b!1377826))

(assert (= (and b!1377826 res!920499) b!1377827))

(assert (= (and b!1377827 res!920501) b!1377828))

(declare-fun m!1261831 () Bool)

(assert (=> start!116994 m!1261831))

(declare-fun m!1261833 () Bool)

(assert (=> b!1377826 m!1261833))

(assert (=> b!1377826 m!1261833))

(declare-fun m!1261835 () Bool)

(assert (=> b!1377826 m!1261835))

(declare-fun m!1261837 () Bool)

(assert (=> b!1377828 m!1261837))

(declare-fun m!1261839 () Bool)

(assert (=> b!1377828 m!1261839))

(declare-fun m!1261841 () Bool)

(assert (=> b!1377828 m!1261841))

(declare-fun m!1261843 () Bool)

(assert (=> b!1377828 m!1261843))

(push 1)

(assert (not b!1377826))

(assert (not b!1377828))

(assert (not start!116994))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

