; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117470 () Bool)

(assert start!117470)

(declare-fun res!922468 () Bool)

(declare-fun e!782056 () Bool)

(assert (=> start!117470 (=> (not res!922468) (not e!782056))))

(declare-fun from!3339 () (_ BitVec 32))

(declare-fun pivot!34 () (_ BitVec 32))

(declare-datatypes ((array!94021 0))(
  ( (array!94022 (arr!45405 (Array (_ BitVec 32) (_ BitVec 64))) (size!45955 (_ BitVec 32))) )
))
(declare-fun a!3961 () array!94021)

(declare-fun to!135 () (_ BitVec 32))

(assert (=> start!117470 (= res!922468 (and (bvslt (size!45955 a!3961) #b01111111111111111111111111111111) (bvsge from!3339 #b00000000000000000000000000000000) (bvsgt to!135 from!3339) (bvsle to!135 (size!45955 a!3961)) (bvsge pivot!34 from!3339) (bvslt pivot!34 (bvsub to!135 #b00000000000000000000000000000001))))))

(assert (=> start!117470 e!782056))

(declare-fun array_inv!34433 (array!94021) Bool)

(assert (=> start!117470 (array_inv!34433 a!3961)))

(assert (=> start!117470 true))

(declare-fun b!1380198 () Bool)

(assert (=> b!1380198 (= e!782056 false)))

(declare-fun lt!607890 () Bool)

(declare-fun isPivot!0 (array!94021 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1380198 (= lt!607890 (isPivot!0 a!3961 from!3339 to!135 pivot!34))))

(assert (= (and start!117470 res!922468) b!1380198))

(declare-fun m!1265401 () Bool)

(assert (=> start!117470 m!1265401))

(declare-fun m!1265403 () Bool)

(assert (=> b!1380198 m!1265403))

(check-sat (not b!1380198) (not start!117470))
