; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117422 () Bool)

(assert start!117422)

(declare-fun res!922311 () Bool)

(declare-fun e!781912 () Bool)

(assert (=> start!117422 (=> (not res!922311) (not e!781912))))

(declare-fun pivot!40 () (_ BitVec 32))

(declare-datatypes ((array!93973 0))(
  ( (array!93974 (arr!45381 (Array (_ BitVec 32) (_ BitVec 64))) (size!45931 (_ BitVec 32))) )
))
(declare-fun a!3985 () array!93973)

(declare-fun from!3363 () (_ BitVec 32))

(declare-fun to!159 () (_ BitVec 32))

(declare-fun knownPivot!5 () (_ BitVec 32))

(assert (=> start!117422 (= res!922311 (and (bvslt (size!45931 a!3985) #b01111111111111111111111111111111) (bvsge from!3363 #b00000000000000000000000000000000) (bvsge to!159 from!3363) (bvsle to!159 (size!45931 a!3985)) (bvsge pivot!40 from!3363) (bvslt pivot!40 to!159) (bvsle knownPivot!5 pivot!40) (bvsge knownPivot!5 from!3363)))))

(assert (=> start!117422 e!781912))

(assert (=> start!117422 true))

(declare-fun array_inv!34409 (array!93973) Bool)

(assert (=> start!117422 (array_inv!34409 a!3985)))

(declare-fun b!1380041 () Bool)

(declare-fun res!922312 () Bool)

(assert (=> b!1380041 (=> (not res!922312) (not e!781912))))

(declare-fun isPivot!0 (array!93973 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1380041 (= res!922312 (isPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(declare-fun b!1380042 () Bool)

(assert (=> b!1380042 (= e!781912 (and (= knownPivot!5 pivot!40) (bvsle to!159 from!3363)))))

(assert (= (and start!117422 res!922311) b!1380041))

(assert (= (and b!1380041 res!922312) b!1380042))

(declare-fun m!1265257 () Bool)

(assert (=> start!117422 m!1265257))

(declare-fun m!1265259 () Bool)

(assert (=> b!1380041 m!1265259))

(check-sat (not start!117422) (not b!1380041))
(check-sat)
