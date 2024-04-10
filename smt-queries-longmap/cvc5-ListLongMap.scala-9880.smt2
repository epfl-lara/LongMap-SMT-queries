; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116996 () Bool)

(assert start!116996)

(declare-fun res!920508 () Bool)

(declare-fun e!780531 () Bool)

(assert (=> start!116996 (=> (not res!920508) (not e!780531))))

(declare-fun to!360 () (_ BitVec 32))

(declare-datatypes ((array!93638 0))(
  ( (array!93639 (arr!45221 (Array (_ BitVec 32) (_ BitVec 64))) (size!45771 (_ BitVec 32))) )
))
(declare-fun a!4197 () array!93638)

(declare-fun from!3564 () (_ BitVec 32))

(assert (=> start!116996 (= res!920508 (and (bvslt (size!45771 a!4197) #b01111111111111111111111111111111) (bvsge from!3564 #b00000000000000000000000000000000) (bvsge to!360 from!3564) (bvslt to!360 (size!45771 a!4197))))))

(assert (=> start!116996 e!780531))

(declare-fun array_inv!34249 (array!93638) Bool)

(assert (=> start!116996 (array_inv!34249 a!4197)))

(assert (=> start!116996 true))

(declare-fun b!1377881 () Bool)

(declare-fun res!920507 () Bool)

(assert (=> b!1377881 (=> (not res!920507) (not e!780531))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377881 (= res!920507 (validKeyInArray!0 (select (arr!45221 a!4197) to!360)))))

(declare-fun b!1377882 () Bool)

(declare-fun res!920509 () Bool)

(assert (=> b!1377882 (=> (not res!920509) (not e!780531))))

(assert (=> b!1377882 (= res!920509 (and (bvsge (bvadd #b00000000000000000000000000000001 to!360) from!3564) (bvsle to!360 (bvadd #b00000000000000000000000000000001 to!360))))))

(declare-fun b!1377883 () Bool)

(assert (=> b!1377883 (= e!780531 (not true))))

(declare-fun arrayCountValidKeys!0 (array!93638 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377883 (= (bvadd (arrayCountValidKeys!0 a!4197 from!3564 to!360) (arrayCountValidKeys!0 a!4197 to!360 (bvadd #b00000000000000000000000000000001 to!360))) (arrayCountValidKeys!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360)))))

(declare-datatypes ((Unit!45735 0))(
  ( (Unit!45736) )
))
(declare-fun lt!606220 () Unit!45735)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93638 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45735)

(assert (=> b!1377883 (= lt!606220 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360) to!360))))

(assert (= (and start!116996 res!920508) b!1377881))

(assert (= (and b!1377881 res!920507) b!1377882))

(assert (= (and b!1377882 res!920509) b!1377883))

(declare-fun m!1262315 () Bool)

(assert (=> start!116996 m!1262315))

(declare-fun m!1262317 () Bool)

(assert (=> b!1377881 m!1262317))

(assert (=> b!1377881 m!1262317))

(declare-fun m!1262319 () Bool)

(assert (=> b!1377881 m!1262319))

(declare-fun m!1262321 () Bool)

(assert (=> b!1377883 m!1262321))

(declare-fun m!1262323 () Bool)

(assert (=> b!1377883 m!1262323))

(declare-fun m!1262325 () Bool)

(assert (=> b!1377883 m!1262325))

(declare-fun m!1262327 () Bool)

(assert (=> b!1377883 m!1262327))

(push 1)

(assert (not start!116996))

(assert (not b!1377883))

(assert (not b!1377881))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

