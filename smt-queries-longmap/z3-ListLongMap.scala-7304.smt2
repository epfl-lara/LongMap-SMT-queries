; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93424 () Bool)

(assert start!93424)

(declare-datatypes ((array!66668 0))(
  ( (array!66669 (arr!32052 (Array (_ BitVec 32) (_ BitVec 64))) (size!32590 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66668)

(declare-fun b!1058000 () Bool)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun e!601853 () Bool)

(declare-fun i!1381 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!66668 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058000 (= e!601853 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun res!706663 () Bool)

(declare-fun e!601859 () Bool)

(assert (=> start!93424 (=> (not res!706663) (not e!601859))))

(assert (=> start!93424 (= res!706663 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32590 a!3488)) (bvslt (size!32590 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93424 e!601859))

(assert (=> start!93424 true))

(declare-fun array_inv!24835 (array!66668) Bool)

(assert (=> start!93424 (array_inv!24835 a!3488)))

(declare-fun b!1058001 () Bool)

(declare-fun res!706658 () Bool)

(assert (=> b!1058001 (=> (not res!706658) (not e!601859))))

(declare-datatypes ((List!22423 0))(
  ( (Nil!22420) (Cons!22419 (h!23628 (_ BitVec 64)) (t!31721 List!22423)) )
))
(declare-fun arrayNoDuplicates!0 (array!66668 (_ BitVec 32) List!22423) Bool)

(assert (=> b!1058001 (= res!706658 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22420))))

(declare-fun b!1058002 () Bool)

(declare-fun res!706664 () Bool)

(declare-fun e!601860 () Bool)

(assert (=> b!1058002 (=> res!706664 e!601860)))

(declare-fun contains!6175 (List!22423 (_ BitVec 64)) Bool)

(assert (=> b!1058002 (= res!706664 (contains!6175 Nil!22420 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1058003 () Bool)

(assert (=> b!1058003 (= e!601860 true)))

(declare-fun lt!466532 () Bool)

(assert (=> b!1058003 (= lt!466532 (contains!6175 Nil!22420 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1058004 () Bool)

(declare-fun res!706659 () Bool)

(assert (=> b!1058004 (=> (not res!706659) (not e!601859))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1058004 (= res!706659 (validKeyInArray!0 k0!2747))))

(declare-fun b!1058005 () Bool)

(declare-fun e!601857 () Bool)

(declare-fun e!601856 () Bool)

(assert (=> b!1058005 (= e!601857 (not e!601856))))

(declare-fun res!706662 () Bool)

(assert (=> b!1058005 (=> res!706662 e!601856)))

(declare-fun lt!466534 () (_ BitVec 32))

(assert (=> b!1058005 (= res!706662 (or (bvsgt lt!466534 i!1381) (bvsle i!1381 lt!466534)))))

(declare-fun e!601855 () Bool)

(assert (=> b!1058005 e!601855))

(declare-fun res!706665 () Bool)

(assert (=> b!1058005 (=> (not res!706665) (not e!601855))))

(assert (=> b!1058005 (= res!706665 (= (select (store (arr!32052 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466534) k0!2747))))

(declare-fun b!1058006 () Bool)

(declare-fun e!601854 () Bool)

(assert (=> b!1058006 (= e!601854 e!601857)))

(declare-fun res!706668 () Bool)

(assert (=> b!1058006 (=> (not res!706668) (not e!601857))))

(assert (=> b!1058006 (= res!706668 (not (= lt!466534 i!1381)))))

(declare-fun lt!466533 () array!66668)

(declare-fun arrayScanForKey!0 (array!66668 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1058006 (= lt!466534 (arrayScanForKey!0 lt!466533 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1058007 () Bool)

(assert (=> b!1058007 (= e!601856 e!601860)))

(declare-fun res!706666 () Bool)

(assert (=> b!1058007 (=> res!706666 e!601860)))

(declare-fun lt!466529 () (_ BitVec 32))

(assert (=> b!1058007 (= res!706666 (or (bvslt lt!466534 #b00000000000000000000000000000000) (bvsge lt!466529 (size!32590 a!3488)) (bvsge lt!466534 (size!32590 a!3488))))))

(assert (=> b!1058007 (arrayContainsKey!0 a!3488 k0!2747 lt!466529)))

(declare-datatypes ((Unit!34559 0))(
  ( (Unit!34560) )
))
(declare-fun lt!466531 () Unit!34559)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66668 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34559)

(assert (=> b!1058007 (= lt!466531 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!466529))))

(assert (=> b!1058007 (= lt!466529 (bvadd #b00000000000000000000000000000001 lt!466534))))

(assert (=> b!1058007 (arrayNoDuplicates!0 a!3488 lt!466534 Nil!22420)))

(declare-fun lt!466530 () Unit!34559)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66668 (_ BitVec 32) (_ BitVec 32)) Unit!34559)

(assert (=> b!1058007 (= lt!466530 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466534))))

(declare-fun b!1058008 () Bool)

(declare-fun res!706661 () Bool)

(assert (=> b!1058008 (=> res!706661 e!601860)))

(declare-fun noDuplicate!1576 (List!22423) Bool)

(assert (=> b!1058008 (= res!706661 (not (noDuplicate!1576 Nil!22420)))))

(declare-fun b!1058009 () Bool)

(assert (=> b!1058009 (= e!601855 e!601853)))

(declare-fun res!706669 () Bool)

(assert (=> b!1058009 (=> res!706669 e!601853)))

(assert (=> b!1058009 (= res!706669 (or (bvsgt lt!466534 i!1381) (bvsle i!1381 lt!466534)))))

(declare-fun b!1058010 () Bool)

(declare-fun res!706667 () Bool)

(assert (=> b!1058010 (=> (not res!706667) (not e!601859))))

(assert (=> b!1058010 (= res!706667 (= (select (arr!32052 a!3488) i!1381) k0!2747))))

(declare-fun b!1058011 () Bool)

(assert (=> b!1058011 (= e!601859 e!601854)))

(declare-fun res!706660 () Bool)

(assert (=> b!1058011 (=> (not res!706660) (not e!601854))))

(assert (=> b!1058011 (= res!706660 (arrayContainsKey!0 lt!466533 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1058011 (= lt!466533 (array!66669 (store (arr!32052 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32590 a!3488)))))

(assert (= (and start!93424 res!706663) b!1058001))

(assert (= (and b!1058001 res!706658) b!1058004))

(assert (= (and b!1058004 res!706659) b!1058010))

(assert (= (and b!1058010 res!706667) b!1058011))

(assert (= (and b!1058011 res!706660) b!1058006))

(assert (= (and b!1058006 res!706668) b!1058005))

(assert (= (and b!1058005 res!706665) b!1058009))

(assert (= (and b!1058009 (not res!706669)) b!1058000))

(assert (= (and b!1058005 (not res!706662)) b!1058007))

(assert (= (and b!1058007 (not res!706666)) b!1058008))

(assert (= (and b!1058008 (not res!706661)) b!1058002))

(assert (= (and b!1058002 (not res!706664)) b!1058003))

(declare-fun m!977171 () Bool)

(assert (=> b!1058004 m!977171))

(declare-fun m!977173 () Bool)

(assert (=> b!1058011 m!977173))

(declare-fun m!977175 () Bool)

(assert (=> b!1058011 m!977175))

(declare-fun m!977177 () Bool)

(assert (=> b!1058000 m!977177))

(declare-fun m!977179 () Bool)

(assert (=> b!1058006 m!977179))

(declare-fun m!977181 () Bool)

(assert (=> b!1058010 m!977181))

(declare-fun m!977183 () Bool)

(assert (=> b!1058008 m!977183))

(declare-fun m!977185 () Bool)

(assert (=> b!1058002 m!977185))

(declare-fun m!977187 () Bool)

(assert (=> b!1058003 m!977187))

(declare-fun m!977189 () Bool)

(assert (=> b!1058007 m!977189))

(declare-fun m!977191 () Bool)

(assert (=> b!1058007 m!977191))

(declare-fun m!977193 () Bool)

(assert (=> b!1058007 m!977193))

(declare-fun m!977195 () Bool)

(assert (=> b!1058007 m!977195))

(assert (=> b!1058005 m!977175))

(declare-fun m!977197 () Bool)

(assert (=> b!1058005 m!977197))

(declare-fun m!977199 () Bool)

(assert (=> b!1058001 m!977199))

(declare-fun m!977201 () Bool)

(assert (=> start!93424 m!977201))

(check-sat (not b!1058006) (not b!1058007) (not b!1058011) (not b!1058008) (not start!93424) (not b!1058001) (not b!1058004) (not b!1058003) (not b!1058000) (not b!1058002))
(check-sat)
