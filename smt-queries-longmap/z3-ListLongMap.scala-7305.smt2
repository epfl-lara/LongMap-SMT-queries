; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93430 () Bool)

(assert start!93430)

(declare-fun b!1058108 () Bool)

(declare-fun res!706773 () Bool)

(declare-fun e!601932 () Bool)

(assert (=> b!1058108 (=> res!706773 e!601932)))

(declare-datatypes ((List!22426 0))(
  ( (Nil!22423) (Cons!22422 (h!23631 (_ BitVec 64)) (t!31724 List!22426)) )
))
(declare-fun contains!6178 (List!22426 (_ BitVec 64)) Bool)

(assert (=> b!1058108 (= res!706773 (contains!6178 Nil!22423 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1058109 () Bool)

(declare-fun e!601927 () Bool)

(declare-fun e!601928 () Bool)

(assert (=> b!1058109 (= e!601927 e!601928)))

(declare-fun res!706772 () Bool)

(assert (=> b!1058109 (=> (not res!706772) (not e!601928))))

(declare-fun lt!466588 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1058109 (= res!706772 (not (= lt!466588 i!1381)))))

(declare-datatypes ((array!66674 0))(
  ( (array!66675 (arr!32055 (Array (_ BitVec 32) (_ BitVec 64))) (size!32593 (_ BitVec 32))) )
))
(declare-fun lt!466584 () array!66674)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66674 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1058109 (= lt!466588 (arrayScanForKey!0 lt!466584 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1058110 () Bool)

(declare-fun res!706768 () Bool)

(assert (=> b!1058110 (=> res!706768 e!601932)))

(declare-fun noDuplicate!1579 (List!22426) Bool)

(assert (=> b!1058110 (= res!706768 (not (noDuplicate!1579 Nil!22423)))))

(declare-fun b!1058111 () Bool)

(declare-fun e!601926 () Bool)

(declare-fun e!601931 () Bool)

(assert (=> b!1058111 (= e!601926 e!601931)))

(declare-fun res!706776 () Bool)

(assert (=> b!1058111 (=> res!706776 e!601931)))

(assert (=> b!1058111 (= res!706776 (or (bvsgt lt!466588 i!1381) (bvsle i!1381 lt!466588)))))

(declare-fun b!1058112 () Bool)

(declare-fun res!706766 () Bool)

(declare-fun e!601930 () Bool)

(assert (=> b!1058112 (=> (not res!706766) (not e!601930))))

(declare-fun a!3488 () array!66674)

(declare-fun arrayNoDuplicates!0 (array!66674 (_ BitVec 32) List!22426) Bool)

(assert (=> b!1058112 (= res!706766 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22423))))

(declare-fun b!1058113 () Bool)

(declare-fun arrayContainsKey!0 (array!66674 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058113 (= e!601931 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1058114 () Bool)

(declare-fun e!601929 () Bool)

(assert (=> b!1058114 (= e!601928 (not e!601929))))

(declare-fun res!706774 () Bool)

(assert (=> b!1058114 (=> res!706774 e!601929)))

(assert (=> b!1058114 (= res!706774 (or (bvsgt lt!466588 i!1381) (bvsle i!1381 lt!466588)))))

(assert (=> b!1058114 e!601926))

(declare-fun res!706777 () Bool)

(assert (=> b!1058114 (=> (not res!706777) (not e!601926))))

(assert (=> b!1058114 (= res!706777 (= (select (store (arr!32055 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466588) k0!2747))))

(declare-fun b!1058115 () Bool)

(declare-fun res!706769 () Bool)

(assert (=> b!1058115 (=> (not res!706769) (not e!601930))))

(assert (=> b!1058115 (= res!706769 (= (select (arr!32055 a!3488) i!1381) k0!2747))))

(declare-fun b!1058116 () Bool)

(assert (=> b!1058116 (= e!601932 true)))

(declare-fun lt!466587 () Bool)

(assert (=> b!1058116 (= lt!466587 (contains!6178 Nil!22423 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1058117 () Bool)

(assert (=> b!1058117 (= e!601930 e!601927)))

(declare-fun res!706775 () Bool)

(assert (=> b!1058117 (=> (not res!706775) (not e!601927))))

(assert (=> b!1058117 (= res!706775 (arrayContainsKey!0 lt!466584 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1058117 (= lt!466584 (array!66675 (store (arr!32055 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32593 a!3488)))))

(declare-fun res!706771 () Bool)

(assert (=> start!93430 (=> (not res!706771) (not e!601930))))

(assert (=> start!93430 (= res!706771 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32593 a!3488)) (bvslt (size!32593 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93430 e!601930))

(assert (=> start!93430 true))

(declare-fun array_inv!24838 (array!66674) Bool)

(assert (=> start!93430 (array_inv!24838 a!3488)))

(declare-fun b!1058118 () Bool)

(assert (=> b!1058118 (= e!601929 e!601932)))

(declare-fun res!706770 () Bool)

(assert (=> b!1058118 (=> res!706770 e!601932)))

(declare-fun lt!466585 () (_ BitVec 32))

(assert (=> b!1058118 (= res!706770 (or (bvslt lt!466588 #b00000000000000000000000000000000) (bvsge lt!466585 (size!32593 a!3488)) (bvsge lt!466588 (size!32593 a!3488))))))

(assert (=> b!1058118 (arrayContainsKey!0 a!3488 k0!2747 lt!466585)))

(declare-datatypes ((Unit!34565 0))(
  ( (Unit!34566) )
))
(declare-fun lt!466583 () Unit!34565)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66674 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34565)

(assert (=> b!1058118 (= lt!466583 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!466585))))

(assert (=> b!1058118 (= lt!466585 (bvadd #b00000000000000000000000000000001 lt!466588))))

(assert (=> b!1058118 (arrayNoDuplicates!0 a!3488 lt!466588 Nil!22423)))

(declare-fun lt!466586 () Unit!34565)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66674 (_ BitVec 32) (_ BitVec 32)) Unit!34565)

(assert (=> b!1058118 (= lt!466586 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466588))))

(declare-fun b!1058119 () Bool)

(declare-fun res!706767 () Bool)

(assert (=> b!1058119 (=> (not res!706767) (not e!601930))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1058119 (= res!706767 (validKeyInArray!0 k0!2747))))

(assert (= (and start!93430 res!706771) b!1058112))

(assert (= (and b!1058112 res!706766) b!1058119))

(assert (= (and b!1058119 res!706767) b!1058115))

(assert (= (and b!1058115 res!706769) b!1058117))

(assert (= (and b!1058117 res!706775) b!1058109))

(assert (= (and b!1058109 res!706772) b!1058114))

(assert (= (and b!1058114 res!706777) b!1058111))

(assert (= (and b!1058111 (not res!706776)) b!1058113))

(assert (= (and b!1058114 (not res!706774)) b!1058118))

(assert (= (and b!1058118 (not res!706770)) b!1058110))

(assert (= (and b!1058110 (not res!706768)) b!1058108))

(assert (= (and b!1058108 (not res!706773)) b!1058116))

(declare-fun m!977267 () Bool)

(assert (=> b!1058114 m!977267))

(declare-fun m!977269 () Bool)

(assert (=> b!1058114 m!977269))

(declare-fun m!977271 () Bool)

(assert (=> start!93430 m!977271))

(declare-fun m!977273 () Bool)

(assert (=> b!1058113 m!977273))

(declare-fun m!977275 () Bool)

(assert (=> b!1058108 m!977275))

(declare-fun m!977277 () Bool)

(assert (=> b!1058116 m!977277))

(declare-fun m!977279 () Bool)

(assert (=> b!1058115 m!977279))

(declare-fun m!977281 () Bool)

(assert (=> b!1058109 m!977281))

(declare-fun m!977283 () Bool)

(assert (=> b!1058112 m!977283))

(declare-fun m!977285 () Bool)

(assert (=> b!1058118 m!977285))

(declare-fun m!977287 () Bool)

(assert (=> b!1058118 m!977287))

(declare-fun m!977289 () Bool)

(assert (=> b!1058118 m!977289))

(declare-fun m!977291 () Bool)

(assert (=> b!1058118 m!977291))

(declare-fun m!977293 () Bool)

(assert (=> b!1058117 m!977293))

(assert (=> b!1058117 m!977267))

(declare-fun m!977295 () Bool)

(assert (=> b!1058110 m!977295))

(declare-fun m!977297 () Bool)

(assert (=> b!1058119 m!977297))

(check-sat (not b!1058112) (not b!1058110) (not b!1058118) (not b!1058113) (not b!1058109) (not b!1058108) (not b!1058116) (not b!1058119) (not b!1058117) (not start!93430))
(check-sat)
