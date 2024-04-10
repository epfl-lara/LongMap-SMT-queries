; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117286 () Bool)

(assert start!117286)

(declare-fun res!922110 () Bool)

(declare-fun e!781591 () Bool)

(assert (=> start!117286 (=> (not res!922110) (not e!781591))))

(declare-fun from!3388 () (_ BitVec 32))

(declare-datatypes ((array!93882 0))(
  ( (array!93883 (arr!45340 (Array (_ BitVec 32) (_ BitVec 64))) (size!45890 (_ BitVec 32))) )
))
(declare-fun a!4010 () array!93882)

(declare-fun to!184 () (_ BitVec 32))

(declare-fun pivot!64 () (_ BitVec 32))

(assert (=> start!117286 (= res!922110 (and (bvslt (size!45890 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45890 a!4010)) (bvsge pivot!64 from!3388) (bvsle pivot!64 to!184) (bvslt pivot!64 to!184)))))

(assert (=> start!117286 e!781591))

(declare-fun array_inv!34368 (array!93882) Bool)

(assert (=> start!117286 (array_inv!34368 a!4010)))

(assert (=> start!117286 true))

(declare-fun b!1379672 () Bool)

(declare-fun res!922111 () Bool)

(assert (=> b!1379672 (=> (not res!922111) (not e!781591))))

(declare-fun isPivot!0 (array!93882 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1379672 (= res!922111 (isPivot!0 a!4010 from!3388 to!184 from!3388))))

(declare-fun b!1379673 () Bool)

(assert (=> b!1379673 (= e!781591 (not true))))

(assert (=> b!1379673 (isPivot!0 a!4010 from!3388 to!184 pivot!64)))

(declare-datatypes ((Unit!45889 0))(
  ( (Unit!45890) )
))
(declare-fun lt!607707 () Unit!45889)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 (array!93882 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45889)

(assert (=> b!1379673 (= lt!607707 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 a!4010 from!3388 to!184 pivot!64 from!3388))))

(assert (= (and start!117286 res!922110) b!1379672))

(assert (= (and b!1379672 res!922111) b!1379673))

(declare-fun m!1264849 () Bool)

(assert (=> start!117286 m!1264849))

(declare-fun m!1264851 () Bool)

(assert (=> b!1379672 m!1264851))

(declare-fun m!1264853 () Bool)

(assert (=> b!1379673 m!1264853))

(declare-fun m!1264855 () Bool)

(assert (=> b!1379673 m!1264855))

(push 1)

(assert (not b!1379673))

(assert (not start!117286))

(assert (not b!1379672))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

