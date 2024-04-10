; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117482 () Bool)

(assert start!117482)

(declare-fun res!922509 () Bool)

(declare-fun e!782101 () Bool)

(assert (=> start!117482 (=> (not res!922509) (not e!782101))))

(declare-fun from!3339 () (_ BitVec 32))

(declare-fun pivot!34 () (_ BitVec 32))

(declare-datatypes ((array!94033 0))(
  ( (array!94034 (arr!45411 (Array (_ BitVec 32) (_ BitVec 64))) (size!45961 (_ BitVec 32))) )
))
(declare-fun a!3961 () array!94033)

(declare-fun to!135 () (_ BitVec 32))

(assert (=> start!117482 (= res!922509 (and (bvslt (size!45961 a!3961) #b01111111111111111111111111111111) (bvsge from!3339 #b00000000000000000000000000000000) (bvsgt to!135 from!3339) (bvsle to!135 (size!45961 a!3961)) (bvsge pivot!34 from!3339) (bvslt pivot!34 (bvsub to!135 #b00000000000000000000000000000001))))))

(assert (=> start!117482 e!782101))

(declare-fun array_inv!34439 (array!94033) Bool)

(assert (=> start!117482 (array_inv!34439 a!3961)))

(assert (=> start!117482 true))

(declare-fun b!1380257 () Bool)

(declare-fun res!922510 () Bool)

(assert (=> b!1380257 (=> (not res!922510) (not e!782101))))

(declare-fun isPivot!0 (array!94033 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1380257 (= res!922510 (isPivot!0 a!3961 from!3339 to!135 pivot!34))))

(declare-fun b!1380258 () Bool)

(assert (=> b!1380258 (= e!782101 (bvsgt (bvadd #b00000000000000000000000000000001 pivot!34) (size!45961 a!3961)))))

(assert (= (and start!117482 res!922509) b!1380257))

(assert (= (and b!1380257 res!922510) b!1380258))

(declare-fun m!1265455 () Bool)

(assert (=> start!117482 m!1265455))

(declare-fun m!1265457 () Bool)

(assert (=> b!1380257 m!1265457))

(check-sat (not start!117482) (not b!1380257))
(check-sat)
