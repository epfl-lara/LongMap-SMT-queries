; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117302 () Bool)

(assert start!117302)

(declare-fun res!922158 () Bool)

(declare-fun e!781639 () Bool)

(assert (=> start!117302 (=> (not res!922158) (not e!781639))))

(declare-fun from!3388 () (_ BitVec 32))

(declare-datatypes ((array!93898 0))(
  ( (array!93899 (arr!45348 (Array (_ BitVec 32) (_ BitVec 64))) (size!45898 (_ BitVec 32))) )
))
(declare-fun a!4010 () array!93898)

(declare-fun to!184 () (_ BitVec 32))

(declare-fun pivot!64 () (_ BitVec 32))

(assert (=> start!117302 (= res!922158 (and (bvslt (size!45898 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45898 a!4010)) (bvsge pivot!64 from!3388) (bvsle pivot!64 to!184) (bvslt pivot!64 to!184)))))

(assert (=> start!117302 e!781639))

(declare-fun array_inv!34376 (array!93898) Bool)

(assert (=> start!117302 (array_inv!34376 a!4010)))

(assert (=> start!117302 true))

(declare-fun b!1379720 () Bool)

(declare-fun res!922159 () Bool)

(assert (=> b!1379720 (=> (not res!922159) (not e!781639))))

(declare-fun isPivot!0 (array!93898 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1379720 (= res!922159 (isPivot!0 a!4010 from!3388 to!184 from!3388))))

(declare-fun b!1379721 () Bool)

(assert (=> b!1379721 (= e!781639 (not true))))

(assert (=> b!1379721 (isPivot!0 a!4010 from!3388 to!184 pivot!64)))

(declare-datatypes ((Unit!45905 0))(
  ( (Unit!45906) )
))
(declare-fun lt!607731 () Unit!45905)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 (array!93898 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45905)

(assert (=> b!1379721 (= lt!607731 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 a!4010 from!3388 to!184 pivot!64 from!3388))))

(assert (= (and start!117302 res!922158) b!1379720))

(assert (= (and b!1379720 res!922159) b!1379721))

(declare-fun m!1264913 () Bool)

(assert (=> start!117302 m!1264913))

(declare-fun m!1264915 () Bool)

(assert (=> b!1379720 m!1264915))

(declare-fun m!1264917 () Bool)

(assert (=> b!1379721 m!1264917))

(declare-fun m!1264919 () Bool)

(assert (=> b!1379721 m!1264919))

(check-sat (not start!117302) (not b!1379721) (not b!1379720))
