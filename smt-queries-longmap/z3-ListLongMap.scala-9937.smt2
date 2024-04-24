; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117676 () Bool)

(assert start!117676)

(declare-fun res!922902 () Bool)

(declare-fun e!782829 () Bool)

(assert (=> start!117676 (=> (not res!922902) (not e!782829))))

(declare-fun knownPivot!5 () (_ BitVec 32))

(declare-fun pivot!40 () (_ BitVec 32))

(declare-datatypes ((array!94111 0))(
  ( (array!94112 (arr!45445 (Array (_ BitVec 32) (_ BitVec 64))) (size!45996 (_ BitVec 32))) )
))
(declare-fun a!3985 () array!94111)

(declare-fun from!3363 () (_ BitVec 32))

(declare-fun to!159 () (_ BitVec 32))

(assert (=> start!117676 (= res!922902 (and (bvslt (size!45996 a!3985) #b01111111111111111111111111111111) (bvsge from!3363 #b00000000000000000000000000000000) (bvsge to!159 from!3363) (bvsle to!159 (size!45996 a!3985)) (bvsge pivot!40 from!3363) (bvslt pivot!40 to!159) (bvsle knownPivot!5 pivot!40) (bvsge knownPivot!5 from!3363)))))

(assert (=> start!117676 e!782829))

(assert (=> start!117676 true))

(declare-fun array_inv!34726 (array!94111) Bool)

(assert (=> start!117676 (array_inv!34726 a!3985)))

(declare-fun b!1381419 () Bool)

(declare-fun res!922900 () Bool)

(assert (=> b!1381419 (=> (not res!922900) (not e!782829))))

(declare-fun isPivot!0 (array!94111 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1381419 (= res!922900 (isPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(declare-fun b!1381420 () Bool)

(declare-fun res!922901 () Bool)

(assert (=> b!1381420 (=> (not res!922901) (not e!782829))))

(assert (=> b!1381420 (= res!922901 (not (= knownPivot!5 pivot!40)))))

(declare-fun b!1381421 () Bool)

(assert (=> b!1381421 (= e!782829 (not (or (bvsgt (bvadd #b00000000000000000000000000000001 knownPivot!5) pivot!40) (bvslt (bvadd #b00000000000000000000000000000001 knownPivot!5) from!3363) (bvslt (bvsub pivot!40 (bvadd #b00000000000000000000000000000001 knownPivot!5)) (bvsub pivot!40 knownPivot!5)))))))

(assert (=> b!1381421 (isPivot!0 a!3985 from!3363 to!159 (bvadd #b00000000000000000000000000000001 knownPivot!5))))

(declare-datatypes ((Unit!45878 0))(
  ( (Unit!45879) )
))
(declare-fun lt!608341 () Unit!45878)

(declare-fun lemmaKnownPivotPlusOneIsPivot!0 (array!94111 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45878)

(assert (=> b!1381421 (= lt!608341 (lemmaKnownPivotPlusOneIsPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(assert (= (and start!117676 res!922902) b!1381419))

(assert (= (and b!1381419 res!922900) b!1381420))

(assert (= (and b!1381420 res!922901) b!1381421))

(declare-fun m!1266949 () Bool)

(assert (=> start!117676 m!1266949))

(declare-fun m!1266951 () Bool)

(assert (=> b!1381419 m!1266951))

(declare-fun m!1266953 () Bool)

(assert (=> b!1381421 m!1266953))

(declare-fun m!1266955 () Bool)

(assert (=> b!1381421 m!1266955))

(check-sat (not b!1381419) (not start!117676) (not b!1381421))
(check-sat)
