; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117274 () Bool)

(assert start!117274)

(declare-fun res!922075 () Bool)

(declare-fun e!781555 () Bool)

(assert (=> start!117274 (=> (not res!922075) (not e!781555))))

(declare-fun from!3388 () (_ BitVec 32))

(declare-datatypes ((array!93870 0))(
  ( (array!93871 (arr!45334 (Array (_ BitVec 32) (_ BitVec 64))) (size!45884 (_ BitVec 32))) )
))
(declare-fun a!4010 () array!93870)

(declare-fun to!184 () (_ BitVec 32))

(declare-fun pivot!64 () (_ BitVec 32))

(assert (=> start!117274 (= res!922075 (and (bvslt (size!45884 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45884 a!4010)) (bvsge pivot!64 from!3388) (bvsle pivot!64 to!184) (bvslt pivot!64 to!184)))))

(assert (=> start!117274 e!781555))

(declare-fun array_inv!34362 (array!93870) Bool)

(assert (=> start!117274 (array_inv!34362 a!4010)))

(assert (=> start!117274 true))

(declare-fun b!1379637 () Bool)

(assert (=> b!1379637 (= e!781555 false)))

(declare-fun lt!607689 () Bool)

(declare-fun isPivot!0 (array!93870 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1379637 (= lt!607689 (isPivot!0 a!4010 from!3388 to!184 from!3388))))

(assert (= (and start!117274 res!922075) b!1379637))

(declare-fun m!1264805 () Bool)

(assert (=> start!117274 m!1264805))

(declare-fun m!1264807 () Bool)

(assert (=> b!1379637 m!1264807))

(push 1)

(assert (not b!1379637))

(assert (not start!117274))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

