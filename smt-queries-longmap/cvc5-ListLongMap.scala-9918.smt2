; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117276 () Bool)

(assert start!117276)

(declare-fun res!922081 () Bool)

(declare-fun e!781562 () Bool)

(assert (=> start!117276 (=> (not res!922081) (not e!781562))))

(declare-fun from!3388 () (_ BitVec 32))

(declare-datatypes ((array!93872 0))(
  ( (array!93873 (arr!45335 (Array (_ BitVec 32) (_ BitVec 64))) (size!45885 (_ BitVec 32))) )
))
(declare-fun a!4010 () array!93872)

(declare-fun to!184 () (_ BitVec 32))

(declare-fun pivot!64 () (_ BitVec 32))

(assert (=> start!117276 (= res!922081 (and (bvslt (size!45885 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45885 a!4010)) (bvsge pivot!64 from!3388) (bvsle pivot!64 to!184) (bvslt pivot!64 to!184)))))

(assert (=> start!117276 e!781562))

(declare-fun array_inv!34363 (array!93872) Bool)

(assert (=> start!117276 (array_inv!34363 a!4010)))

(assert (=> start!117276 true))

(declare-fun b!1379642 () Bool)

(declare-fun res!922080 () Bool)

(assert (=> b!1379642 (=> (not res!922080) (not e!781562))))

(declare-fun isPivot!0 (array!93872 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1379642 (= res!922080 (isPivot!0 a!4010 from!3388 to!184 from!3388))))

(declare-fun b!1379643 () Bool)

(assert (=> b!1379643 (= e!781562 (not (bvsle pivot!64 (size!45885 a!4010))))))

(assert (=> b!1379643 (isPivot!0 a!4010 from!3388 to!184 pivot!64)))

(declare-datatypes ((Unit!45879 0))(
  ( (Unit!45880) )
))
(declare-fun lt!607692 () Unit!45879)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 (array!93872 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45879)

(assert (=> b!1379643 (= lt!607692 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 a!4010 from!3388 to!184 pivot!64 from!3388))))

(assert (= (and start!117276 res!922081) b!1379642))

(assert (= (and b!1379642 res!922080) b!1379643))

(declare-fun m!1264809 () Bool)

(assert (=> start!117276 m!1264809))

(declare-fun m!1264811 () Bool)

(assert (=> b!1379642 m!1264811))

(declare-fun m!1264813 () Bool)

(assert (=> b!1379643 m!1264813))

(declare-fun m!1264815 () Bool)

(assert (=> b!1379643 m!1264815))

(push 1)

(assert (not b!1379642))

(assert (not b!1379643))

(assert (not start!117276))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

