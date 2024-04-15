; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117300 () Bool)

(assert start!117300)

(declare-fun res!922139 () Bool)

(declare-fun e!781614 () Bool)

(assert (=> start!117300 (=> (not res!922139) (not e!781614))))

(declare-fun from!3388 () (_ BitVec 32))

(declare-datatypes ((array!93850 0))(
  ( (array!93851 (arr!45324 (Array (_ BitVec 32) (_ BitVec 64))) (size!45876 (_ BitVec 32))) )
))
(declare-fun a!4010 () array!93850)

(declare-fun to!184 () (_ BitVec 32))

(declare-fun pivot!64 () (_ BitVec 32))

(assert (=> start!117300 (= res!922139 (and (bvslt (size!45876 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45876 a!4010)) (bvsge pivot!64 from!3388) (bvsle pivot!64 to!184) (bvslt pivot!64 to!184)))))

(assert (=> start!117300 e!781614))

(declare-fun array_inv!34557 (array!93850) Bool)

(assert (=> start!117300 (array_inv!34557 a!4010)))

(assert (=> start!117300 true))

(declare-fun b!1379657 () Bool)

(declare-fun res!922138 () Bool)

(assert (=> b!1379657 (=> (not res!922138) (not e!781614))))

(declare-fun isPivot!0 (array!93850 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1379657 (= res!922138 (isPivot!0 a!4010 from!3388 to!184 from!3388))))

(declare-fun b!1379658 () Bool)

(assert (=> b!1379658 (= e!781614 (not true))))

(assert (=> b!1379658 (isPivot!0 a!4010 from!3388 to!184 pivot!64)))

(declare-datatypes ((Unit!45748 0))(
  ( (Unit!45749) )
))
(declare-fun lt!607550 () Unit!45748)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 (array!93850 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45748)

(assert (=> b!1379658 (= lt!607550 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 a!4010 from!3388 to!184 pivot!64 from!3388))))

(assert (= (and start!117300 res!922139) b!1379657))

(assert (= (and b!1379657 res!922138) b!1379658))

(declare-fun m!1264417 () Bool)

(assert (=> start!117300 m!1264417))

(declare-fun m!1264419 () Bool)

(assert (=> b!1379657 m!1264419))

(declare-fun m!1264421 () Bool)

(assert (=> b!1379658 m!1264421))

(declare-fun m!1264423 () Bool)

(assert (=> b!1379658 m!1264423))

(push 1)

(assert (not b!1379657))

(assert (not b!1379658))

(assert (not start!117300))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

