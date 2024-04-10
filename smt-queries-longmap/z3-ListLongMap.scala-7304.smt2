; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93428 () Bool)

(assert start!93428)

(declare-fun b!1058187 () Bool)

(declare-fun res!706771 () Bool)

(declare-fun e!601974 () Bool)

(assert (=> b!1058187 (=> (not res!706771) (not e!601974))))

(declare-datatypes ((array!66731 0))(
  ( (array!66732 (arr!32084 (Array (_ BitVec 32) (_ BitVec 64))) (size!32620 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66731)

(declare-datatypes ((List!22396 0))(
  ( (Nil!22393) (Cons!22392 (h!23601 (_ BitVec 64)) (t!31703 List!22396)) )
))
(declare-fun arrayNoDuplicates!0 (array!66731 (_ BitVec 32) List!22396) Bool)

(assert (=> b!1058187 (= res!706771 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22393))))

(declare-fun res!706763 () Bool)

(assert (=> start!93428 (=> (not res!706763) (not e!601974))))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> start!93428 (= res!706763 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32620 a!3488)) (bvslt (size!32620 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93428 e!601974))

(assert (=> start!93428 true))

(declare-fun array_inv!24864 (array!66731) Bool)

(assert (=> start!93428 (array_inv!24864 a!3488)))

(declare-fun b!1058188 () Bool)

(declare-fun res!706768 () Bool)

(declare-fun e!601972 () Bool)

(assert (=> b!1058188 (=> res!706768 e!601972)))

(declare-fun contains!6208 (List!22396 (_ BitVec 64)) Bool)

(assert (=> b!1058188 (= res!706768 (contains!6208 Nil!22393 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1058189 () Bool)

(declare-fun res!706766 () Bool)

(assert (=> b!1058189 (=> (not res!706766) (not e!601974))))

(declare-fun k0!2747 () (_ BitVec 64))

(assert (=> b!1058189 (= res!706766 (= (select (arr!32084 a!3488) i!1381) k0!2747))))

(declare-fun b!1058190 () Bool)

(declare-fun e!601968 () Bool)

(declare-fun e!601971 () Bool)

(assert (=> b!1058190 (= e!601968 e!601971)))

(declare-fun res!706769 () Bool)

(assert (=> b!1058190 (=> res!706769 e!601971)))

(declare-fun lt!466749 () (_ BitVec 32))

(assert (=> b!1058190 (= res!706769 (or (bvsgt lt!466749 i!1381) (bvsle i!1381 lt!466749)))))

(declare-fun b!1058191 () Bool)

(declare-fun e!601970 () Bool)

(declare-fun e!601969 () Bool)

(assert (=> b!1058191 (= e!601970 (not e!601969))))

(declare-fun res!706762 () Bool)

(assert (=> b!1058191 (=> res!706762 e!601969)))

(assert (=> b!1058191 (= res!706762 (or (bvsgt lt!466749 i!1381) (bvsle i!1381 lt!466749)))))

(assert (=> b!1058191 e!601968))

(declare-fun res!706764 () Bool)

(assert (=> b!1058191 (=> (not res!706764) (not e!601968))))

(assert (=> b!1058191 (= res!706764 (= (select (store (arr!32084 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466749) k0!2747))))

(declare-fun b!1058192 () Bool)

(declare-fun res!706770 () Bool)

(assert (=> b!1058192 (=> (not res!706770) (not e!601974))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1058192 (= res!706770 (validKeyInArray!0 k0!2747))))

(declare-fun b!1058193 () Bool)

(declare-fun arrayContainsKey!0 (array!66731 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058193 (= e!601971 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1058194 () Bool)

(declare-fun res!706765 () Bool)

(assert (=> b!1058194 (=> res!706765 e!601972)))

(declare-fun noDuplicate!1564 (List!22396) Bool)

(assert (=> b!1058194 (= res!706765 (not (noDuplicate!1564 Nil!22393)))))

(declare-fun b!1058195 () Bool)

(declare-fun e!601973 () Bool)

(assert (=> b!1058195 (= e!601973 e!601970)))

(declare-fun res!706767 () Bool)

(assert (=> b!1058195 (=> (not res!706767) (not e!601970))))

(assert (=> b!1058195 (= res!706767 (not (= lt!466749 i!1381)))))

(declare-fun lt!466750 () array!66731)

(declare-fun arrayScanForKey!0 (array!66731 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1058195 (= lt!466749 (arrayScanForKey!0 lt!466750 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1058196 () Bool)

(assert (=> b!1058196 (= e!601969 e!601972)))

(declare-fun res!706761 () Bool)

(assert (=> b!1058196 (=> res!706761 e!601972)))

(declare-fun lt!466748 () (_ BitVec 32))

(assert (=> b!1058196 (= res!706761 (or (bvslt lt!466749 #b00000000000000000000000000000000) (bvsge lt!466748 (size!32620 a!3488)) (bvsge lt!466749 (size!32620 a!3488))))))

(assert (=> b!1058196 (arrayContainsKey!0 a!3488 k0!2747 lt!466748)))

(declare-datatypes ((Unit!34690 0))(
  ( (Unit!34691) )
))
(declare-fun lt!466751 () Unit!34690)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66731 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34690)

(assert (=> b!1058196 (= lt!466751 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!466748))))

(assert (=> b!1058196 (= lt!466748 (bvadd #b00000000000000000000000000000001 lt!466749))))

(assert (=> b!1058196 (arrayNoDuplicates!0 a!3488 lt!466749 Nil!22393)))

(declare-fun lt!466752 () Unit!34690)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66731 (_ BitVec 32) (_ BitVec 32)) Unit!34690)

(assert (=> b!1058196 (= lt!466752 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466749))))

(declare-fun b!1058197 () Bool)

(assert (=> b!1058197 (= e!601972 true)))

(declare-fun lt!466747 () Bool)

(assert (=> b!1058197 (= lt!466747 (contains!6208 Nil!22393 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1058198 () Bool)

(assert (=> b!1058198 (= e!601974 e!601973)))

(declare-fun res!706772 () Bool)

(assert (=> b!1058198 (=> (not res!706772) (not e!601973))))

(assert (=> b!1058198 (= res!706772 (arrayContainsKey!0 lt!466750 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1058198 (= lt!466750 (array!66732 (store (arr!32084 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32620 a!3488)))))

(assert (= (and start!93428 res!706763) b!1058187))

(assert (= (and b!1058187 res!706771) b!1058192))

(assert (= (and b!1058192 res!706770) b!1058189))

(assert (= (and b!1058189 res!706766) b!1058198))

(assert (= (and b!1058198 res!706772) b!1058195))

(assert (= (and b!1058195 res!706767) b!1058191))

(assert (= (and b!1058191 res!706764) b!1058190))

(assert (= (and b!1058190 (not res!706769)) b!1058193))

(assert (= (and b!1058191 (not res!706762)) b!1058196))

(assert (= (and b!1058196 (not res!706761)) b!1058194))

(assert (= (and b!1058194 (not res!706765)) b!1058188))

(assert (= (and b!1058188 (not res!706768)) b!1058197))

(declare-fun m!977827 () Bool)

(assert (=> b!1058191 m!977827))

(declare-fun m!977829 () Bool)

(assert (=> b!1058191 m!977829))

(declare-fun m!977831 () Bool)

(assert (=> b!1058193 m!977831))

(declare-fun m!977833 () Bool)

(assert (=> b!1058197 m!977833))

(declare-fun m!977835 () Bool)

(assert (=> b!1058195 m!977835))

(declare-fun m!977837 () Bool)

(assert (=> start!93428 m!977837))

(declare-fun m!977839 () Bool)

(assert (=> b!1058194 m!977839))

(declare-fun m!977841 () Bool)

(assert (=> b!1058187 m!977841))

(declare-fun m!977843 () Bool)

(assert (=> b!1058196 m!977843))

(declare-fun m!977845 () Bool)

(assert (=> b!1058196 m!977845))

(declare-fun m!977847 () Bool)

(assert (=> b!1058196 m!977847))

(declare-fun m!977849 () Bool)

(assert (=> b!1058196 m!977849))

(declare-fun m!977851 () Bool)

(assert (=> b!1058192 m!977851))

(declare-fun m!977853 () Bool)

(assert (=> b!1058189 m!977853))

(declare-fun m!977855 () Bool)

(assert (=> b!1058188 m!977855))

(declare-fun m!977857 () Bool)

(assert (=> b!1058198 m!977857))

(assert (=> b!1058198 m!977827))

(check-sat (not b!1058188) (not b!1058198) (not start!93428) (not b!1058197) (not b!1058187) (not b!1058194) (not b!1058195) (not b!1058196) (not b!1058193) (not b!1058192))
(check-sat)
