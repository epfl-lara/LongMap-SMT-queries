; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93064 () Bool)

(assert start!93064)

(declare-fun b!1055742 () Bool)

(declare-fun e!600089 () Bool)

(declare-fun e!600090 () Bool)

(assert (=> b!1055742 (= e!600089 e!600090)))

(declare-fun res!704647 () Bool)

(assert (=> b!1055742 (=> (not res!704647) (not e!600090))))

(declare-datatypes ((array!66530 0))(
  ( (array!66531 (arr!31992 (Array (_ BitVec 32) (_ BitVec 64))) (size!32530 (_ BitVec 32))) )
))
(declare-fun lt!465771 () array!66530)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66530 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1055742 (= res!704647 (arrayContainsKey!0 lt!465771 k0!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66530)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1055742 (= lt!465771 (array!66531 (store (arr!31992 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32530 a!3488)))))

(declare-fun b!1055743 () Bool)

(declare-fun res!704640 () Bool)

(assert (=> b!1055743 (=> (not res!704640) (not e!600089))))

(assert (=> b!1055743 (= res!704640 (= (select (arr!31992 a!3488) i!1381) k0!2747))))

(declare-fun b!1055744 () Bool)

(declare-fun res!704642 () Bool)

(assert (=> b!1055744 (=> (not res!704642) (not e!600089))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1055744 (= res!704642 (validKeyInArray!0 k0!2747))))

(declare-fun b!1055745 () Bool)

(declare-fun e!600092 () Bool)

(assert (=> b!1055745 (= e!600092 true)))

(assert (=> b!1055745 false))

(declare-datatypes ((Unit!34475 0))(
  ( (Unit!34476) )
))
(declare-fun lt!465772 () Unit!34475)

(declare-datatypes ((List!22363 0))(
  ( (Nil!22360) (Cons!22359 (h!23568 (_ BitVec 64)) (t!31661 List!22363)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!66530 (_ BitVec 64) (_ BitVec 32) List!22363) Unit!34475)

(assert (=> b!1055745 (= lt!465772 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 a!3488 k0!2747 i!1381 Nil!22360))))

(assert (=> b!1055745 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-fun lt!465768 () (_ BitVec 32))

(declare-fun lt!465770 () Unit!34475)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66530 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34475)

(assert (=> b!1055745 (= lt!465770 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!465768 (bvadd #b00000000000000000000000000000001 i!1381)))))

(declare-fun arrayNoDuplicates!0 (array!66530 (_ BitVec 32) List!22363) Bool)

(assert (=> b!1055745 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22360)))

(declare-fun lt!465769 () Unit!34475)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66530 (_ BitVec 32) (_ BitVec 32)) Unit!34475)

(assert (=> b!1055745 (= lt!465769 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1055741 () Bool)

(declare-fun e!600087 () Bool)

(assert (=> b!1055741 (= e!600087 (not e!600092))))

(declare-fun res!704646 () Bool)

(assert (=> b!1055741 (=> res!704646 e!600092)))

(assert (=> b!1055741 (= res!704646 (bvsle lt!465768 i!1381))))

(declare-fun e!600088 () Bool)

(assert (=> b!1055741 e!600088))

(declare-fun res!704639 () Bool)

(assert (=> b!1055741 (=> (not res!704639) (not e!600088))))

(assert (=> b!1055741 (= res!704639 (= (select (store (arr!31992 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465768) k0!2747))))

(declare-fun res!704641 () Bool)

(assert (=> start!93064 (=> (not res!704641) (not e!600089))))

(assert (=> start!93064 (= res!704641 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32530 a!3488)) (bvslt (size!32530 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93064 e!600089))

(assert (=> start!93064 true))

(declare-fun array_inv!24775 (array!66530) Bool)

(assert (=> start!93064 (array_inv!24775 a!3488)))

(declare-fun b!1055746 () Bool)

(declare-fun res!704643 () Bool)

(assert (=> b!1055746 (=> (not res!704643) (not e!600089))))

(assert (=> b!1055746 (= res!704643 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22360))))

(declare-fun b!1055747 () Bool)

(declare-fun e!600091 () Bool)

(assert (=> b!1055747 (= e!600088 e!600091)))

(declare-fun res!704644 () Bool)

(assert (=> b!1055747 (=> res!704644 e!600091)))

(assert (=> b!1055747 (= res!704644 (bvsle lt!465768 i!1381))))

(declare-fun b!1055748 () Bool)

(assert (=> b!1055748 (= e!600090 e!600087)))

(declare-fun res!704645 () Bool)

(assert (=> b!1055748 (=> (not res!704645) (not e!600087))))

(assert (=> b!1055748 (= res!704645 (not (= lt!465768 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66530 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1055748 (= lt!465768 (arrayScanForKey!0 lt!465771 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1055749 () Bool)

(assert (=> b!1055749 (= e!600091 (arrayContainsKey!0 a!3488 k0!2747 lt!465768))))

(assert (= (and start!93064 res!704641) b!1055746))

(assert (= (and b!1055746 res!704643) b!1055744))

(assert (= (and b!1055744 res!704642) b!1055743))

(assert (= (and b!1055743 res!704640) b!1055742))

(assert (= (and b!1055742 res!704647) b!1055748))

(assert (= (and b!1055748 res!704645) b!1055741))

(assert (= (and b!1055741 res!704639) b!1055747))

(assert (= (and b!1055747 (not res!704644)) b!1055749))

(assert (= (and b!1055741 (not res!704646)) b!1055745))

(declare-fun m!975253 () Bool)

(assert (=> b!1055744 m!975253))

(declare-fun m!975255 () Bool)

(assert (=> b!1055742 m!975255))

(declare-fun m!975257 () Bool)

(assert (=> b!1055742 m!975257))

(declare-fun m!975259 () Bool)

(assert (=> b!1055746 m!975259))

(declare-fun m!975261 () Bool)

(assert (=> b!1055745 m!975261))

(declare-fun m!975263 () Bool)

(assert (=> b!1055745 m!975263))

(declare-fun m!975265 () Bool)

(assert (=> b!1055745 m!975265))

(declare-fun m!975267 () Bool)

(assert (=> b!1055745 m!975267))

(declare-fun m!975269 () Bool)

(assert (=> b!1055745 m!975269))

(assert (=> b!1055741 m!975257))

(declare-fun m!975271 () Bool)

(assert (=> b!1055741 m!975271))

(declare-fun m!975273 () Bool)

(assert (=> b!1055748 m!975273))

(declare-fun m!975275 () Bool)

(assert (=> b!1055743 m!975275))

(declare-fun m!975277 () Bool)

(assert (=> start!93064 m!975277))

(declare-fun m!975279 () Bool)

(assert (=> b!1055749 m!975279))

(check-sat (not b!1055745) (not b!1055742) (not b!1055748) (not b!1055749) (not b!1055744) (not start!93064) (not b!1055746))
(check-sat)
