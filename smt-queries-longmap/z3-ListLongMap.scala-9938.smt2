; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117452 () Bool)

(assert start!117452)

(declare-fun b!1380150 () Bool)

(declare-fun res!922421 () Bool)

(declare-fun e!782007 () Bool)

(assert (=> b!1380150 (=> (not res!922421) (not e!782007))))

(declare-fun knownPivot!5 () (_ BitVec 32))

(declare-datatypes ((array!94003 0))(
  ( (array!94004 (arr!45396 (Array (_ BitVec 32) (_ BitVec 64))) (size!45946 (_ BitVec 32))) )
))
(declare-fun a!3985 () array!94003)

(declare-fun from!3363 () (_ BitVec 32))

(declare-fun to!159 () (_ BitVec 32))

(declare-fun isPivot!0 (array!94003 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1380150 (= res!922421 (isPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(declare-fun b!1380153 () Bool)

(declare-fun e!782008 () Bool)

(assert (=> b!1380153 (= e!782008 true)))

(declare-fun pivot!40 () (_ BitVec 32))

(assert (=> b!1380153 (isPivot!0 a!3985 from!3363 to!159 pivot!40)))

(declare-datatypes ((Unit!45947 0))(
  ( (Unit!45948) )
))
(declare-fun lt!607877 () Unit!45947)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 (array!94003 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45947)

(assert (=> b!1380153 (= lt!607877 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 a!3985 from!3363 to!159 pivot!40 (bvadd #b00000000000000000000000000000001 knownPivot!5)))))

(declare-fun b!1380151 () Bool)

(declare-fun res!922423 () Bool)

(assert (=> b!1380151 (=> (not res!922423) (not e!782007))))

(assert (=> b!1380151 (= res!922423 (not (= knownPivot!5 pivot!40)))))

(declare-fun b!1380152 () Bool)

(assert (=> b!1380152 (= e!782007 (not e!782008))))

(declare-fun res!922420 () Bool)

(assert (=> b!1380152 (=> res!922420 e!782008)))

(assert (=> b!1380152 (= res!922420 (or (bvsgt (bvadd #b00000000000000000000000000000001 knownPivot!5) pivot!40) (bvslt (bvadd #b00000000000000000000000000000001 knownPivot!5) from!3363)))))

(assert (=> b!1380152 (isPivot!0 a!3985 from!3363 to!159 (bvadd #b00000000000000000000000000000001 knownPivot!5))))

(declare-fun lt!607878 () Unit!45947)

(declare-fun lemmaKnownPivotPlusOneIsPivot!0 (array!94003 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45947)

(assert (=> b!1380152 (= lt!607878 (lemmaKnownPivotPlusOneIsPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(declare-fun res!922422 () Bool)

(assert (=> start!117452 (=> (not res!922422) (not e!782007))))

(assert (=> start!117452 (= res!922422 (and (bvslt (size!45946 a!3985) #b01111111111111111111111111111111) (bvsge from!3363 #b00000000000000000000000000000000) (bvsge to!159 from!3363) (bvsle to!159 (size!45946 a!3985)) (bvsge pivot!40 from!3363) (bvslt pivot!40 to!159) (bvsle knownPivot!5 pivot!40) (bvsge knownPivot!5 from!3363)))))

(assert (=> start!117452 e!782007))

(assert (=> start!117452 true))

(declare-fun array_inv!34424 (array!94003) Bool)

(assert (=> start!117452 (array_inv!34424 a!3985)))

(assert (= (and start!117452 res!922422) b!1380150))

(assert (= (and b!1380150 res!922421) b!1380151))

(assert (= (and b!1380151 res!922423) b!1380152))

(assert (= (and b!1380152 (not res!922420)) b!1380153))

(declare-fun m!1265349 () Bool)

(assert (=> b!1380150 m!1265349))

(declare-fun m!1265351 () Bool)

(assert (=> b!1380153 m!1265351))

(declare-fun m!1265353 () Bool)

(assert (=> b!1380153 m!1265353))

(declare-fun m!1265355 () Bool)

(assert (=> b!1380152 m!1265355))

(declare-fun m!1265357 () Bool)

(assert (=> b!1380152 m!1265357))

(declare-fun m!1265359 () Bool)

(assert (=> start!117452 m!1265359))

(check-sat (not b!1380150) (not b!1380152) (not start!117452) (not b!1380153))
