; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117712 () Bool)

(assert start!117712)

(declare-fun res!923024 () Bool)

(declare-fun e!782945 () Bool)

(assert (=> start!117712 (=> (not res!923024) (not e!782945))))

(declare-fun from!3339 () (_ BitVec 32))

(declare-fun pivot!34 () (_ BitVec 32))

(declare-datatypes ((array!94147 0))(
  ( (array!94148 (arr!45463 (Array (_ BitVec 32) (_ BitVec 64))) (size!46014 (_ BitVec 32))) )
))
(declare-fun a!3961 () array!94147)

(declare-fun to!135 () (_ BitVec 32))

(assert (=> start!117712 (= res!923024 (and (bvslt (size!46014 a!3961) #b01111111111111111111111111111111) (bvsge from!3339 #b00000000000000000000000000000000) (bvsgt to!135 from!3339) (bvsle to!135 (size!46014 a!3961)) (bvsge pivot!34 from!3339) (bvslt pivot!34 (bvsub to!135 #b00000000000000000000000000000001))))))

(assert (=> start!117712 e!782945))

(declare-fun array_inv!34744 (array!94147) Bool)

(assert (=> start!117712 (array_inv!34744 a!3961)))

(assert (=> start!117712 true))

(declare-fun b!1381561 () Bool)

(declare-fun res!923025 () Bool)

(assert (=> b!1381561 (=> (not res!923025) (not e!782945))))

(declare-fun isPivot!0 (array!94147 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1381561 (= res!923025 (isPivot!0 a!3961 from!3339 to!135 pivot!34))))

(declare-fun b!1381562 () Bool)

(assert (=> b!1381562 (= e!782945 (bvsgt (bvadd #b00000000000000000000000000000001 pivot!34) (size!46014 a!3961)))))

(assert (= (and start!117712 res!923024) b!1381561))

(assert (= (and b!1381561 res!923025) b!1381562))

(declare-fun m!1267087 () Bool)

(assert (=> start!117712 m!1267087))

(declare-fun m!1267089 () Bool)

(assert (=> b!1381561 m!1267089))

(check-sat (not start!117712) (not b!1381561))
(check-sat)
