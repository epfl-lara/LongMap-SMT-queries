; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117300 () Bool)

(assert start!117300)

(declare-fun res!922152 () Bool)

(declare-fun e!781634 () Bool)

(assert (=> start!117300 (=> (not res!922152) (not e!781634))))

(declare-fun from!3388 () (_ BitVec 32))

(declare-datatypes ((array!93896 0))(
  ( (array!93897 (arr!45347 (Array (_ BitVec 32) (_ BitVec 64))) (size!45897 (_ BitVec 32))) )
))
(declare-fun a!4010 () array!93896)

(declare-fun to!184 () (_ BitVec 32))

(declare-fun pivot!64 () (_ BitVec 32))

(assert (=> start!117300 (= res!922152 (and (bvslt (size!45897 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45897 a!4010)) (bvsge pivot!64 from!3388) (bvsle pivot!64 to!184) (bvslt pivot!64 to!184)))))

(assert (=> start!117300 e!781634))

(declare-fun array_inv!34375 (array!93896) Bool)

(assert (=> start!117300 (array_inv!34375 a!4010)))

(assert (=> start!117300 true))

(declare-fun b!1379714 () Bool)

(declare-fun res!922153 () Bool)

(assert (=> b!1379714 (=> (not res!922153) (not e!781634))))

(declare-fun isPivot!0 (array!93896 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1379714 (= res!922153 (isPivot!0 a!4010 from!3388 to!184 from!3388))))

(declare-fun b!1379715 () Bool)

(assert (=> b!1379715 (= e!781634 (not true))))

(assert (=> b!1379715 (isPivot!0 a!4010 from!3388 to!184 pivot!64)))

(declare-datatypes ((Unit!45903 0))(
  ( (Unit!45904) )
))
(declare-fun lt!607728 () Unit!45903)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 (array!93896 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45903)

(assert (=> b!1379715 (= lt!607728 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 a!4010 from!3388 to!184 pivot!64 from!3388))))

(assert (= (and start!117300 res!922152) b!1379714))

(assert (= (and b!1379714 res!922153) b!1379715))

(declare-fun m!1264905 () Bool)

(assert (=> start!117300 m!1264905))

(declare-fun m!1264907 () Bool)

(assert (=> b!1379714 m!1264907))

(declare-fun m!1264909 () Bool)

(assert (=> b!1379715 m!1264909))

(declare-fun m!1264911 () Bool)

(assert (=> b!1379715 m!1264911))

(push 1)

(assert (not b!1379714))

(assert (not start!117300))

(assert (not b!1379715))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

