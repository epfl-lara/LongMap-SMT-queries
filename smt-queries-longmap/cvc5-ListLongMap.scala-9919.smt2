; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117282 () Bool)

(assert start!117282)

(declare-fun res!922099 () Bool)

(declare-fun e!781580 () Bool)

(assert (=> start!117282 (=> (not res!922099) (not e!781580))))

(declare-fun from!3388 () (_ BitVec 32))

(declare-datatypes ((array!93878 0))(
  ( (array!93879 (arr!45338 (Array (_ BitVec 32) (_ BitVec 64))) (size!45888 (_ BitVec 32))) )
))
(declare-fun a!4010 () array!93878)

(declare-fun to!184 () (_ BitVec 32))

(declare-fun pivot!64 () (_ BitVec 32))

(assert (=> start!117282 (= res!922099 (and (bvslt (size!45888 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45888 a!4010)) (bvsge pivot!64 from!3388) (bvsle pivot!64 to!184) (bvslt pivot!64 to!184)))))

(assert (=> start!117282 e!781580))

(declare-fun array_inv!34366 (array!93878) Bool)

(assert (=> start!117282 (array_inv!34366 a!4010)))

(assert (=> start!117282 true))

(declare-fun b!1379660 () Bool)

(declare-fun res!922098 () Bool)

(assert (=> b!1379660 (=> (not res!922098) (not e!781580))))

(declare-fun isPivot!0 (array!93878 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1379660 (= res!922098 (isPivot!0 a!4010 from!3388 to!184 from!3388))))

(declare-fun b!1379661 () Bool)

(assert (=> b!1379661 (= e!781580 (not true))))

(assert (=> b!1379661 (isPivot!0 a!4010 from!3388 to!184 pivot!64)))

(declare-datatypes ((Unit!45885 0))(
  ( (Unit!45886) )
))
(declare-fun lt!607701 () Unit!45885)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 (array!93878 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45885)

(assert (=> b!1379661 (= lt!607701 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 a!4010 from!3388 to!184 pivot!64 from!3388))))

(assert (= (and start!117282 res!922099) b!1379660))

(assert (= (and b!1379660 res!922098) b!1379661))

(declare-fun m!1264833 () Bool)

(assert (=> start!117282 m!1264833))

(declare-fun m!1264835 () Bool)

(assert (=> b!1379660 m!1264835))

(declare-fun m!1264837 () Bool)

(assert (=> b!1379661 m!1264837))

(declare-fun m!1264839 () Bool)

(assert (=> b!1379661 m!1264839))

(push 1)

(assert (not b!1379660))

(assert (not b!1379661))

(assert (not start!117282))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

