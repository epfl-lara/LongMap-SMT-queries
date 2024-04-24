; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60144 () Bool)

(assert start!60144)

(declare-fun b!670029 () Bool)

(declare-fun e!383200 () Bool)

(declare-fun e!383202 () Bool)

(assert (=> b!670029 (= e!383200 e!383202)))

(declare-fun res!436769 () Bool)

(assert (=> b!670029 (=> res!436769 e!383202)))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!670029 (= res!436769 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!670030 () Bool)

(declare-fun res!436764 () Bool)

(declare-fun e!383206 () Bool)

(assert (=> b!670030 (=> (not res!436764) (not e!383206))))

(declare-datatypes ((array!39129 0))(
  ( (array!39130 (arr!18754 (Array (_ BitVec 32) (_ BitVec 64))) (size!19118 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39129)

(declare-datatypes ((List!12702 0))(
  ( (Nil!12699) (Cons!12698 (h!13746 (_ BitVec 64)) (t!18922 List!12702)) )
))
(declare-fun arrayNoDuplicates!0 (array!39129 (_ BitVec 32) List!12702) Bool)

(assert (=> b!670030 (= res!436764 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12699))))

(declare-fun b!670031 () Bool)

(declare-fun res!436754 () Bool)

(assert (=> b!670031 (=> (not res!436754) (not e!383206))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39129 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!670031 (= res!436754 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!670032 () Bool)

(declare-fun e!383207 () Bool)

(declare-fun e!383199 () Bool)

(assert (=> b!670032 (= e!383207 e!383199)))

(declare-fun res!436757 () Bool)

(assert (=> b!670032 (=> (not res!436757) (not e!383199))))

(assert (=> b!670032 (= res!436757 (bvsle from!3004 i!1382))))

(declare-fun b!670033 () Bool)

(declare-fun res!436751 () Bool)

(assert (=> b!670033 (=> (not res!436751) (not e!383206))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!670033 (= res!436751 (validKeyInArray!0 k0!2843))))

(declare-fun b!670034 () Bool)

(declare-datatypes ((Unit!23499 0))(
  ( (Unit!23500) )
))
(declare-fun e!383201 () Unit!23499)

(declare-fun Unit!23501 () Unit!23499)

(assert (=> b!670034 (= e!383201 Unit!23501)))

(declare-fun lt!311875 () Unit!23499)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39129 (_ BitVec 64) (_ BitVec 32)) Unit!23499)

(assert (=> b!670034 (= lt!311875 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!670034 false))

(declare-fun b!670035 () Bool)

(declare-fun acc!681 () List!12702)

(declare-fun contains!3354 (List!12702 (_ BitVec 64)) Bool)

(assert (=> b!670035 (= e!383199 (not (contains!3354 acc!681 k0!2843)))))

(declare-fun b!670036 () Bool)

(declare-fun res!436770 () Bool)

(assert (=> b!670036 (=> (not res!436770) (not e!383206))))

(assert (=> b!670036 (= res!436770 (not (contains!3354 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!670038 () Bool)

(declare-fun e!383204 () Bool)

(assert (=> b!670038 (= e!383204 (bvsle from!3004 (size!19118 a!3626)))))

(declare-fun lt!311869 () array!39129)

(declare-fun lt!311871 () List!12702)

(assert (=> b!670038 (arrayNoDuplicates!0 lt!311869 (bvadd #b00000000000000000000000000000001 from!3004) lt!311871)))

(declare-fun lt!311876 () Unit!23499)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39129 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12702) Unit!23499)

(assert (=> b!670038 (= lt!311876 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k0!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!311871))))

(declare-fun b!670039 () Bool)

(declare-fun Unit!23502 () Unit!23499)

(assert (=> b!670039 (= e!383201 Unit!23502)))

(declare-fun b!670040 () Bool)

(declare-fun res!436767 () Bool)

(assert (=> b!670040 (=> (not res!436767) (not e!383206))))

(assert (=> b!670040 (= res!436767 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19118 a!3626))))))

(declare-fun b!670041 () Bool)

(declare-fun res!436771 () Bool)

(assert (=> b!670041 (=> (not res!436771) (not e!383206))))

(assert (=> b!670041 (= res!436771 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!670042 () Bool)

(declare-fun res!436763 () Bool)

(assert (=> b!670042 (=> res!436763 e!383204)))

(assert (=> b!670042 (= res!436763 (contains!3354 lt!311871 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!670043 () Bool)

(declare-fun res!436760 () Bool)

(assert (=> b!670043 (=> (not res!436760) (not e!383206))))

(assert (=> b!670043 (= res!436760 e!383207)))

(declare-fun res!436761 () Bool)

(assert (=> b!670043 (=> res!436761 e!383207)))

(declare-fun e!383203 () Bool)

(assert (=> b!670043 (= res!436761 e!383203)))

(declare-fun res!436758 () Bool)

(assert (=> b!670043 (=> (not res!436758) (not e!383203))))

(assert (=> b!670043 (= res!436758 (bvsgt from!3004 i!1382))))

(declare-fun b!670044 () Bool)

(declare-fun res!436750 () Bool)

(assert (=> b!670044 (=> res!436750 e!383204)))

(assert (=> b!670044 (= res!436750 (contains!3354 lt!311871 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!670045 () Bool)

(declare-fun e!383205 () Bool)

(assert (=> b!670045 (= e!383205 (not (contains!3354 lt!311871 k0!2843)))))

(declare-fun b!670046 () Bool)

(declare-fun res!436759 () Bool)

(assert (=> b!670046 (=> (not res!436759) (not e!383206))))

(assert (=> b!670046 (= res!436759 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19118 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!670047 () Bool)

(assert (=> b!670047 (= e!383203 (contains!3354 acc!681 k0!2843))))

(declare-fun b!670048 () Bool)

(declare-fun res!436768 () Bool)

(assert (=> b!670048 (=> res!436768 e!383204)))

(assert (=> b!670048 (= res!436768 e!383200)))

(declare-fun res!436756 () Bool)

(assert (=> b!670048 (=> (not res!436756) (not e!383200))))

(assert (=> b!670048 (= res!436756 e!383205)))

(declare-fun res!436753 () Bool)

(assert (=> b!670048 (=> res!436753 e!383205)))

(assert (=> b!670048 (= res!436753 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!670049 () Bool)

(declare-fun e!383198 () Unit!23499)

(declare-fun lt!311874 () Unit!23499)

(assert (=> b!670049 (= e!383198 lt!311874)))

(declare-fun lt!311877 () Unit!23499)

(declare-fun lemmaListSubSeqRefl!0 (List!12702) Unit!23499)

(assert (=> b!670049 (= lt!311877 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!116 (List!12702 List!12702) Bool)

(assert (=> b!670049 (subseq!116 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39129 List!12702 List!12702 (_ BitVec 32)) Unit!23499)

(declare-fun $colon$colon!245 (List!12702 (_ BitVec 64)) List!12702)

(assert (=> b!670049 (= lt!311874 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!245 acc!681 (select (arr!18754 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!670049 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!670050 () Bool)

(assert (=> b!670050 (= e!383202 (contains!3354 lt!311871 k0!2843))))

(declare-fun res!436762 () Bool)

(assert (=> start!60144 (=> (not res!436762) (not e!383206))))

(assert (=> start!60144 (= res!436762 (and (bvslt (size!19118 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19118 a!3626))))))

(assert (=> start!60144 e!383206))

(assert (=> start!60144 true))

(declare-fun array_inv!14613 (array!39129) Bool)

(assert (=> start!60144 (array_inv!14613 a!3626)))

(declare-fun b!670037 () Bool)

(assert (=> b!670037 (= e!383206 (not e!383204))))

(declare-fun res!436765 () Bool)

(assert (=> b!670037 (=> res!436765 e!383204)))

(assert (=> b!670037 (= res!436765 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!670037 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!311871)))

(declare-fun lt!311878 () Unit!23499)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39129 (_ BitVec 64) (_ BitVec 32) List!12702 List!12702) Unit!23499)

(assert (=> b!670037 (= lt!311878 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!311871))))

(declare-fun -!113 (List!12702 (_ BitVec 64)) List!12702)

(assert (=> b!670037 (= (-!113 lt!311871 k0!2843) acc!681)))

(assert (=> b!670037 (= lt!311871 ($colon$colon!245 acc!681 k0!2843))))

(declare-fun lt!311868 () Unit!23499)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12702) Unit!23499)

(assert (=> b!670037 (= lt!311868 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!670037 (subseq!116 acc!681 acc!681)))

(declare-fun lt!311872 () Unit!23499)

(assert (=> b!670037 (= lt!311872 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!670037 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!311873 () Unit!23499)

(assert (=> b!670037 (= lt!311873 e!383198)))

(declare-fun c!77008 () Bool)

(assert (=> b!670037 (= c!77008 (validKeyInArray!0 (select (arr!18754 a!3626) from!3004)))))

(declare-fun lt!311870 () Unit!23499)

(assert (=> b!670037 (= lt!311870 e!383201)))

(declare-fun c!77009 () Bool)

(assert (=> b!670037 (= c!77009 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!670037 (arrayContainsKey!0 lt!311869 k0!2843 from!3004)))

(assert (=> b!670037 (= lt!311869 (array!39130 (store (arr!18754 a!3626) i!1382 k0!2843) (size!19118 a!3626)))))

(declare-fun b!670051 () Bool)

(declare-fun res!436755 () Bool)

(assert (=> b!670051 (=> (not res!436755) (not e!383206))))

(declare-fun noDuplicate!628 (List!12702) Bool)

(assert (=> b!670051 (= res!436755 (noDuplicate!628 acc!681))))

(declare-fun b!670052 () Bool)

(declare-fun res!436752 () Bool)

(assert (=> b!670052 (=> res!436752 e!383204)))

(assert (=> b!670052 (= res!436752 (not (noDuplicate!628 lt!311871)))))

(declare-fun b!670053 () Bool)

(declare-fun res!436766 () Bool)

(assert (=> b!670053 (=> (not res!436766) (not e!383206))))

(assert (=> b!670053 (= res!436766 (not (contains!3354 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!670054 () Bool)

(declare-fun Unit!23503 () Unit!23499)

(assert (=> b!670054 (= e!383198 Unit!23503)))

(assert (= (and start!60144 res!436762) b!670051))

(assert (= (and b!670051 res!436755) b!670036))

(assert (= (and b!670036 res!436770) b!670053))

(assert (= (and b!670053 res!436766) b!670043))

(assert (= (and b!670043 res!436758) b!670047))

(assert (= (and b!670043 (not res!436761)) b!670032))

(assert (= (and b!670032 res!436757) b!670035))

(assert (= (and b!670043 res!436760) b!670030))

(assert (= (and b!670030 res!436764) b!670041))

(assert (= (and b!670041 res!436771) b!670040))

(assert (= (and b!670040 res!436767) b!670033))

(assert (= (and b!670033 res!436751) b!670031))

(assert (= (and b!670031 res!436754) b!670046))

(assert (= (and b!670046 res!436759) b!670037))

(assert (= (and b!670037 c!77009) b!670034))

(assert (= (and b!670037 (not c!77009)) b!670039))

(assert (= (and b!670037 c!77008) b!670049))

(assert (= (and b!670037 (not c!77008)) b!670054))

(assert (= (and b!670037 (not res!436765)) b!670052))

(assert (= (and b!670052 (not res!436752)) b!670042))

(assert (= (and b!670042 (not res!436763)) b!670044))

(assert (= (and b!670044 (not res!436750)) b!670048))

(assert (= (and b!670048 (not res!436753)) b!670045))

(assert (= (and b!670048 res!436756) b!670029))

(assert (= (and b!670029 (not res!436769)) b!670050))

(assert (= (and b!670048 (not res!436768)) b!670038))

(declare-fun m!640513 () Bool)

(assert (=> b!670035 m!640513))

(declare-fun m!640515 () Bool)

(assert (=> b!670038 m!640515))

(declare-fun m!640517 () Bool)

(assert (=> b!670038 m!640517))

(declare-fun m!640519 () Bool)

(assert (=> b!670031 m!640519))

(declare-fun m!640521 () Bool)

(assert (=> start!60144 m!640521))

(declare-fun m!640523 () Bool)

(assert (=> b!670045 m!640523))

(declare-fun m!640525 () Bool)

(assert (=> b!670042 m!640525))

(declare-fun m!640527 () Bool)

(assert (=> b!670036 m!640527))

(declare-fun m!640529 () Bool)

(assert (=> b!670034 m!640529))

(declare-fun m!640531 () Bool)

(assert (=> b!670051 m!640531))

(declare-fun m!640533 () Bool)

(assert (=> b!670053 m!640533))

(declare-fun m!640535 () Bool)

(assert (=> b!670033 m!640535))

(declare-fun m!640537 () Bool)

(assert (=> b!670052 m!640537))

(declare-fun m!640539 () Bool)

(assert (=> b!670041 m!640539))

(assert (=> b!670047 m!640513))

(declare-fun m!640541 () Bool)

(assert (=> b!670030 m!640541))

(declare-fun m!640543 () Bool)

(assert (=> b!670044 m!640543))

(declare-fun m!640545 () Bool)

(assert (=> b!670037 m!640545))

(declare-fun m!640547 () Bool)

(assert (=> b!670037 m!640547))

(declare-fun m!640549 () Bool)

(assert (=> b!670037 m!640549))

(declare-fun m!640551 () Bool)

(assert (=> b!670037 m!640551))

(declare-fun m!640553 () Bool)

(assert (=> b!670037 m!640553))

(declare-fun m!640555 () Bool)

(assert (=> b!670037 m!640555))

(declare-fun m!640557 () Bool)

(assert (=> b!670037 m!640557))

(declare-fun m!640559 () Bool)

(assert (=> b!670037 m!640559))

(assert (=> b!670037 m!640549))

(declare-fun m!640561 () Bool)

(assert (=> b!670037 m!640561))

(declare-fun m!640563 () Bool)

(assert (=> b!670037 m!640563))

(declare-fun m!640565 () Bool)

(assert (=> b!670037 m!640565))

(declare-fun m!640567 () Bool)

(assert (=> b!670037 m!640567))

(declare-fun m!640569 () Bool)

(assert (=> b!670037 m!640569))

(assert (=> b!670049 m!640547))

(assert (=> b!670049 m!640549))

(declare-fun m!640571 () Bool)

(assert (=> b!670049 m!640571))

(declare-fun m!640573 () Bool)

(assert (=> b!670049 m!640573))

(assert (=> b!670049 m!640549))

(assert (=> b!670049 m!640571))

(assert (=> b!670049 m!640557))

(assert (=> b!670049 m!640565))

(assert (=> b!670050 m!640523))

(check-sat (not b!670041) (not start!60144) (not b!670050) (not b!670049) (not b!670052) (not b!670037) (not b!670036) (not b!670053) (not b!670033) (not b!670035) (not b!670031) (not b!670044) (not b!670047) (not b!670038) (not b!670034) (not b!670051) (not b!670042) (not b!670030) (not b!670045))
(check-sat)
