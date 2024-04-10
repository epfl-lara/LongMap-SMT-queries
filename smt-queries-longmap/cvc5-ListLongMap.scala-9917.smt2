; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117270 () Bool)

(assert start!117270)

(declare-fun res!922069 () Bool)

(declare-fun e!781543 () Bool)

(assert (=> start!117270 (=> (not res!922069) (not e!781543))))

(declare-fun from!3388 () (_ BitVec 32))

(declare-datatypes ((array!93866 0))(
  ( (array!93867 (arr!45332 (Array (_ BitVec 32) (_ BitVec 64))) (size!45882 (_ BitVec 32))) )
))
(declare-fun a!4010 () array!93866)

(declare-fun to!184 () (_ BitVec 32))

(declare-fun pivot!64 () (_ BitVec 32))

(assert (=> start!117270 (= res!922069 (and (bvslt (size!45882 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45882 a!4010)) (bvsge pivot!64 from!3388) (bvsle pivot!64 to!184) (bvslt pivot!64 to!184)))))

(assert (=> start!117270 e!781543))

(declare-fun array_inv!34360 (array!93866) Bool)

(assert (=> start!117270 (array_inv!34360 a!4010)))

(assert (=> start!117270 true))

(declare-fun b!1379631 () Bool)

(assert (=> b!1379631 (= e!781543 false)))

(declare-fun lt!607683 () Bool)

(declare-fun isPivot!0 (array!93866 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1379631 (= lt!607683 (isPivot!0 a!4010 from!3388 to!184 from!3388))))

(assert (= (and start!117270 res!922069) b!1379631))

(declare-fun m!1264797 () Bool)

(assert (=> start!117270 m!1264797))

(declare-fun m!1264799 () Bool)

(assert (=> b!1379631 m!1264799))

(push 1)

(assert (not b!1379631))

(assert (not start!117270))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

