; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117434 () Bool)

(assert start!117434)

(declare-fun res!922338 () Bool)

(declare-fun e!781948 () Bool)

(assert (=> start!117434 (=> (not res!922338) (not e!781948))))

(declare-fun knownPivot!5 () (_ BitVec 32))

(declare-fun pivot!40 () (_ BitVec 32))

(declare-datatypes ((array!93985 0))(
  ( (array!93986 (arr!45387 (Array (_ BitVec 32) (_ BitVec 64))) (size!45937 (_ BitVec 32))) )
))
(declare-fun a!3985 () array!93985)

(declare-fun from!3363 () (_ BitVec 32))

(declare-fun to!159 () (_ BitVec 32))

(assert (=> start!117434 (= res!922338 (and (bvslt (size!45937 a!3985) #b01111111111111111111111111111111) (bvsge from!3363 #b00000000000000000000000000000000) (bvsge to!159 from!3363) (bvsle to!159 (size!45937 a!3985)) (bvsge pivot!40 from!3363) (bvslt pivot!40 to!159) (bvsle knownPivot!5 pivot!40) (bvsge knownPivot!5 from!3363)))))

(assert (=> start!117434 e!781948))

(assert (=> start!117434 true))

(declare-fun array_inv!34415 (array!93985) Bool)

(assert (=> start!117434 (array_inv!34415 a!3985)))

(declare-fun b!1380068 () Bool)

(declare-fun res!922339 () Bool)

(assert (=> b!1380068 (=> (not res!922339) (not e!781948))))

(declare-fun isPivot!0 (array!93985 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1380068 (= res!922339 (isPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(declare-fun b!1380069 () Bool)

(assert (=> b!1380069 (= e!781948 (and (not (= knownPivot!5 pivot!40)) (or (bvsle to!159 from!3363) (bvsge knownPivot!5 (bvsub to!159 #b00000000000000000000000000000001)))))))

(assert (= (and start!117434 res!922338) b!1380068))

(assert (= (and b!1380068 res!922339) b!1380069))

(declare-fun m!1265281 () Bool)

(assert (=> start!117434 m!1265281))

(declare-fun m!1265283 () Bool)

(assert (=> b!1380068 m!1265283))

(check-sat (not start!117434) (not b!1380068))
(check-sat)
