; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117458 () Bool)

(assert start!117458)

(declare-fun res!922451 () Bool)

(declare-fun e!782029 () Bool)

(assert (=> start!117458 (=> (not res!922451) (not e!782029))))

(declare-fun knownPivot!5 () (_ BitVec 32))

(declare-fun pivot!40 () (_ BitVec 32))

(declare-datatypes ((array!94009 0))(
  ( (array!94010 (arr!45399 (Array (_ BitVec 32) (_ BitVec 64))) (size!45949 (_ BitVec 32))) )
))
(declare-fun a!3985 () array!94009)

(declare-fun from!3363 () (_ BitVec 32))

(declare-fun to!159 () (_ BitVec 32))

(assert (=> start!117458 (= res!922451 (and (bvslt (size!45949 a!3985) #b01111111111111111111111111111111) (bvsge from!3363 #b00000000000000000000000000000000) (bvsge to!159 from!3363) (bvsle to!159 (size!45949 a!3985)) (bvsge pivot!40 from!3363) (bvslt pivot!40 to!159) (bvsle knownPivot!5 pivot!40) (bvsge knownPivot!5 from!3363)))))

(assert (=> start!117458 e!782029))

(assert (=> start!117458 true))

(declare-fun array_inv!34427 (array!94009) Bool)

(assert (=> start!117458 (array_inv!34427 a!3985)))

(declare-fun b!1380181 () Bool)

(declare-fun res!922453 () Bool)

(assert (=> b!1380181 (=> (not res!922453) (not e!782029))))

(declare-fun isPivot!0 (array!94009 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1380181 (= res!922453 (isPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(declare-fun b!1380182 () Bool)

(declare-fun res!922452 () Bool)

(assert (=> b!1380182 (=> (not res!922452) (not e!782029))))

(assert (=> b!1380182 (= res!922452 (= knownPivot!5 pivot!40))))

(declare-fun b!1380183 () Bool)

(assert (=> b!1380183 (= e!782029 (not (isPivot!0 a!3985 from!3363 to!159 pivot!40)))))

(assert (= (and start!117458 res!922451) b!1380181))

(assert (= (and b!1380181 res!922453) b!1380182))

(assert (= (and b!1380182 res!922452) b!1380183))

(declare-fun m!1265379 () Bool)

(assert (=> start!117458 m!1265379))

(declare-fun m!1265381 () Bool)

(assert (=> b!1380181 m!1265381))

(declare-fun m!1265383 () Bool)

(assert (=> b!1380183 m!1265383))

(check-sat (not b!1380183) (not b!1380181) (not start!117458))
(check-sat)
