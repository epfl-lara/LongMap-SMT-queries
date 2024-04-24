; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117644 () Bool)

(assert start!117644)

(declare-fun res!922783 () Bool)

(declare-fun e!782724 () Bool)

(assert (=> start!117644 (=> (not res!922783) (not e!782724))))

(declare-fun knownPivot!5 () (_ BitVec 32))

(declare-fun pivot!40 () (_ BitVec 32))

(declare-datatypes ((array!94079 0))(
  ( (array!94080 (arr!45429 (Array (_ BitVec 32) (_ BitVec 64))) (size!45980 (_ BitVec 32))) )
))
(declare-fun a!3985 () array!94079)

(declare-fun from!3363 () (_ BitVec 32))

(declare-fun to!159 () (_ BitVec 32))

(assert (=> start!117644 (= res!922783 (and (bvslt (size!45980 a!3985) #b01111111111111111111111111111111) (bvsge from!3363 #b00000000000000000000000000000000) (bvsge to!159 from!3363) (bvsle to!159 (size!45980 a!3985)) (bvsge pivot!40 from!3363) (bvslt pivot!40 to!159) (bvsle knownPivot!5 pivot!40) (bvsge knownPivot!5 from!3363)))))

(assert (=> start!117644 e!782724))

(assert (=> start!117644 true))

(declare-fun array_inv!34710 (array!94079) Bool)

(assert (=> start!117644 (array_inv!34710 a!3985)))

(declare-fun b!1381302 () Bool)

(declare-fun res!922784 () Bool)

(assert (=> b!1381302 (=> (not res!922784) (not e!782724))))

(declare-fun isPivot!0 (array!94079 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1381302 (= res!922784 (isPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(declare-fun b!1381303 () Bool)

(declare-fun res!922785 () Bool)

(assert (=> b!1381303 (=> (not res!922785) (not e!782724))))

(assert (=> b!1381303 (= res!922785 (not (= knownPivot!5 pivot!40)))))

(declare-fun b!1381304 () Bool)

(assert (=> b!1381304 (= e!782724 (not true))))

(assert (=> b!1381304 (isPivot!0 a!3985 from!3363 to!159 (bvadd #b00000000000000000000000000000001 knownPivot!5))))

(declare-datatypes ((Unit!45864 0))(
  ( (Unit!45865) )
))
(declare-fun lt!608302 () Unit!45864)

(declare-fun lemmaKnownPivotPlusOneIsPivot!0 (array!94079 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45864)

(assert (=> b!1381304 (= lt!608302 (lemmaKnownPivotPlusOneIsPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(assert (= (and start!117644 res!922783) b!1381302))

(assert (= (and b!1381302 res!922784) b!1381303))

(assert (= (and b!1381303 res!922785) b!1381304))

(declare-fun m!1266845 () Bool)

(assert (=> start!117644 m!1266845))

(declare-fun m!1266847 () Bool)

(assert (=> b!1381302 m!1266847))

(declare-fun m!1266849 () Bool)

(assert (=> b!1381304 m!1266849))

(declare-fun m!1266851 () Bool)

(assert (=> b!1381304 m!1266851))

(push 1)

(assert (not start!117644))

(assert (not b!1381304))

(assert (not b!1381302))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

