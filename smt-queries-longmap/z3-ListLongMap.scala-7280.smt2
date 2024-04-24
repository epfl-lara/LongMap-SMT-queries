; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93276 () Bool)

(assert start!93276)

(declare-fun b!1056835 () Bool)

(declare-fun res!704855 () Bool)

(declare-fun e!600758 () Bool)

(assert (=> b!1056835 (=> (not res!704855) (not e!600758))))

(declare-datatypes ((array!66616 0))(
  ( (array!66617 (arr!32029 (Array (_ BitVec 32) (_ BitVec 64))) (size!32566 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66616)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1056835 (= res!704855 (= (select (arr!32029 a!3488) i!1381) k0!2747))))

(declare-fun e!600756 () Bool)

(declare-fun lt!466307 () (_ BitVec 32))

(declare-fun b!1056836 () Bool)

(declare-fun arrayContainsKey!0 (array!66616 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1056836 (= e!600756 (arrayContainsKey!0 a!3488 k0!2747 lt!466307))))

(declare-fun b!1056837 () Bool)

(declare-fun e!600753 () Bool)

(declare-fun e!600754 () Bool)

(assert (=> b!1056837 (= e!600753 e!600754)))

(declare-fun res!704851 () Bool)

(assert (=> b!1056837 (=> res!704851 e!600754)))

(assert (=> b!1056837 (= res!704851 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32566 a!3488)))))

(assert (=> b!1056837 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34585 0))(
  ( (Unit!34586) )
))
(declare-fun lt!466303 () Unit!34585)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66616 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34585)

(assert (=> b!1056837 (= lt!466303 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!466307 (bvadd #b00000000000000000000000000000001 i!1381)))))

(declare-datatypes ((List!22311 0))(
  ( (Nil!22308) (Cons!22307 (h!23525 (_ BitVec 64)) (t!31610 List!22311)) )
))
(declare-fun arrayNoDuplicates!0 (array!66616 (_ BitVec 32) List!22311) Bool)

(assert (=> b!1056837 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22308)))

(declare-fun lt!466304 () Unit!34585)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66616 (_ BitVec 32) (_ BitVec 32)) Unit!34585)

(assert (=> b!1056837 (= lt!466304 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1056838 () Bool)

(declare-fun e!600755 () Bool)

(assert (=> b!1056838 (= e!600755 e!600756)))

(declare-fun res!704844 () Bool)

(assert (=> b!1056838 (=> res!704844 e!600756)))

(assert (=> b!1056838 (= res!704844 (bvsle lt!466307 i!1381))))

(declare-fun b!1056839 () Bool)

(declare-fun res!704846 () Bool)

(assert (=> b!1056839 (=> res!704846 e!600754)))

(declare-fun contains!6208 (List!22311 (_ BitVec 64)) Bool)

(assert (=> b!1056839 (= res!704846 (contains!6208 Nil!22308 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1056840 () Bool)

(declare-fun res!704852 () Bool)

(assert (=> b!1056840 (=> (not res!704852) (not e!600758))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1056840 (= res!704852 (validKeyInArray!0 k0!2747))))

(declare-fun b!1056841 () Bool)

(declare-fun e!600760 () Bool)

(assert (=> b!1056841 (= e!600760 (not e!600753))))

(declare-fun res!704853 () Bool)

(assert (=> b!1056841 (=> res!704853 e!600753)))

(assert (=> b!1056841 (= res!704853 (bvsle lt!466307 i!1381))))

(assert (=> b!1056841 e!600755))

(declare-fun res!704848 () Bool)

(assert (=> b!1056841 (=> (not res!704848) (not e!600755))))

(assert (=> b!1056841 (= res!704848 (= (select (store (arr!32029 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466307) k0!2747))))

(declare-fun b!1056842 () Bool)

(declare-fun e!600759 () Bool)

(assert (=> b!1056842 (= e!600759 e!600760)))

(declare-fun res!704850 () Bool)

(assert (=> b!1056842 (=> (not res!704850) (not e!600760))))

(assert (=> b!1056842 (= res!704850 (not (= lt!466307 i!1381)))))

(declare-fun lt!466305 () array!66616)

(declare-fun arrayScanForKey!0 (array!66616 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1056842 (= lt!466307 (arrayScanForKey!0 lt!466305 k0!2747 #b00000000000000000000000000000000))))

(declare-fun res!704847 () Bool)

(assert (=> start!93276 (=> (not res!704847) (not e!600758))))

(assert (=> start!93276 (= res!704847 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32566 a!3488)) (bvslt (size!32566 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93276 e!600758))

(assert (=> start!93276 true))

(declare-fun array_inv!24811 (array!66616) Bool)

(assert (=> start!93276 (array_inv!24811 a!3488)))

(declare-fun b!1056843 () Bool)

(declare-fun res!704854 () Bool)

(assert (=> b!1056843 (=> (not res!704854) (not e!600758))))

(assert (=> b!1056843 (= res!704854 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22308))))

(declare-fun b!1056844 () Bool)

(declare-fun res!704845 () Bool)

(assert (=> b!1056844 (=> res!704845 e!600754)))

(declare-fun noDuplicate!1567 (List!22311) Bool)

(assert (=> b!1056844 (= res!704845 (not (noDuplicate!1567 Nil!22308)))))

(declare-fun b!1056845 () Bool)

(assert (=> b!1056845 (= e!600754 true)))

(declare-fun lt!466306 () Bool)

(assert (=> b!1056845 (= lt!466306 (contains!6208 Nil!22308 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1056846 () Bool)

(assert (=> b!1056846 (= e!600758 e!600759)))

(declare-fun res!704849 () Bool)

(assert (=> b!1056846 (=> (not res!704849) (not e!600759))))

(assert (=> b!1056846 (= res!704849 (arrayContainsKey!0 lt!466305 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1056846 (= lt!466305 (array!66617 (store (arr!32029 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32566 a!3488)))))

(assert (= (and start!93276 res!704847) b!1056843))

(assert (= (and b!1056843 res!704854) b!1056840))

(assert (= (and b!1056840 res!704852) b!1056835))

(assert (= (and b!1056835 res!704855) b!1056846))

(assert (= (and b!1056846 res!704849) b!1056842))

(assert (= (and b!1056842 res!704850) b!1056841))

(assert (= (and b!1056841 res!704848) b!1056838))

(assert (= (and b!1056838 (not res!704844)) b!1056836))

(assert (= (and b!1056841 (not res!704853)) b!1056837))

(assert (= (and b!1056837 (not res!704851)) b!1056844))

(assert (= (and b!1056844 (not res!704845)) b!1056839))

(assert (= (and b!1056839 (not res!704846)) b!1056845))

(declare-fun m!977177 () Bool)

(assert (=> b!1056840 m!977177))

(declare-fun m!977179 () Bool)

(assert (=> b!1056843 m!977179))

(declare-fun m!977181 () Bool)

(assert (=> start!93276 m!977181))

(declare-fun m!977183 () Bool)

(assert (=> b!1056844 m!977183))

(declare-fun m!977185 () Bool)

(assert (=> b!1056839 m!977185))

(declare-fun m!977187 () Bool)

(assert (=> b!1056837 m!977187))

(declare-fun m!977189 () Bool)

(assert (=> b!1056837 m!977189))

(declare-fun m!977191 () Bool)

(assert (=> b!1056837 m!977191))

(declare-fun m!977193 () Bool)

(assert (=> b!1056837 m!977193))

(declare-fun m!977195 () Bool)

(assert (=> b!1056836 m!977195))

(declare-fun m!977197 () Bool)

(assert (=> b!1056842 m!977197))

(declare-fun m!977199 () Bool)

(assert (=> b!1056845 m!977199))

(declare-fun m!977201 () Bool)

(assert (=> b!1056841 m!977201))

(declare-fun m!977203 () Bool)

(assert (=> b!1056841 m!977203))

(declare-fun m!977205 () Bool)

(assert (=> b!1056835 m!977205))

(declare-fun m!977207 () Bool)

(assert (=> b!1056846 m!977207))

(assert (=> b!1056846 m!977201))

(check-sat (not b!1056837) (not b!1056839) (not b!1056845) (not b!1056840) (not b!1056842) (not b!1056846) (not b!1056843) (not start!93276) (not b!1056836) (not b!1056844))
(check-sat)
