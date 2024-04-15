; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117270 () Bool)

(assert start!117270)

(declare-fun res!922049 () Bool)

(declare-fun e!781524 () Bool)

(assert (=> start!117270 (=> (not res!922049) (not e!781524))))

(declare-fun from!3388 () (_ BitVec 32))

(declare-fun to!184 () (_ BitVec 32))

(declare-fun pivot!64 () (_ BitVec 32))

(declare-datatypes ((array!93820 0))(
  ( (array!93821 (arr!45309 (Array (_ BitVec 32) (_ BitVec 64))) (size!45861 (_ BitVec 32))) )
))
(declare-fun a!4010 () array!93820)

(assert (=> start!117270 (= res!922049 (and (bvslt (size!45861 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45861 a!4010)) (bvsge pivot!64 from!3388) (bvsle pivot!64 to!184) (bvslt pivot!64 to!184)))))

(assert (=> start!117270 e!781524))

(declare-fun array_inv!34542 (array!93820) Bool)

(assert (=> start!117270 (array_inv!34542 a!4010)))

(assert (=> start!117270 true))

(declare-fun b!1379568 () Bool)

(assert (=> b!1379568 (= e!781524 false)))

(declare-fun lt!607505 () Bool)

(declare-fun isPivot!0 (array!93820 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1379568 (= lt!607505 (isPivot!0 a!4010 from!3388 to!184 from!3388))))

(assert (= (and start!117270 res!922049) b!1379568))

(declare-fun m!1264301 () Bool)

(assert (=> start!117270 m!1264301))

(declare-fun m!1264303 () Bool)

(assert (=> b!1379568 m!1264303))

(push 1)

(assert (not b!1379568))

(assert (not start!117270))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

