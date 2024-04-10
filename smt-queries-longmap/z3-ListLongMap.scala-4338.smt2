; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60058 () Bool)

(assert start!60058)

(declare-fun b!668753 () Bool)

(declare-fun res!435757 () Bool)

(declare-fun e!382603 () Bool)

(assert (=> b!668753 (=> (not res!435757) (not e!382603))))

(declare-datatypes ((array!39105 0))(
  ( (array!39106 (arr!18745 (Array (_ BitVec 32) (_ BitVec 64))) (size!19109 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39105)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!12786 0))(
  ( (Nil!12783) (Cons!12782 (h!13827 (_ BitVec 64)) (t!19014 List!12786)) )
))
(declare-fun acc!681 () List!12786)

(declare-fun arrayNoDuplicates!0 (array!39105 (_ BitVec 32) List!12786) Bool)

(assert (=> b!668753 (= res!435757 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!668754 () Bool)

(declare-fun res!435770 () Bool)

(assert (=> b!668754 (=> (not res!435770) (not e!382603))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!668754 (= res!435770 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19109 a!3626))))))

(declare-fun b!668755 () Bool)

(declare-fun res!435754 () Bool)

(assert (=> b!668755 (=> (not res!435754) (not e!382603))))

(declare-fun noDuplicate!610 (List!12786) Bool)

(assert (=> b!668755 (= res!435754 (noDuplicate!610 acc!681))))

(declare-fun b!668756 () Bool)

(declare-datatypes ((Unit!23450 0))(
  ( (Unit!23451) )
))
(declare-fun e!382596 () Unit!23450)

(declare-fun lt!311344 () Unit!23450)

(assert (=> b!668756 (= e!382596 lt!311344)))

(declare-fun lt!311345 () Unit!23450)

(declare-fun lemmaListSubSeqRefl!0 (List!12786) Unit!23450)

(assert (=> b!668756 (= lt!311345 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!102 (List!12786 List!12786) Bool)

(assert (=> b!668756 (subseq!102 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39105 List!12786 List!12786 (_ BitVec 32)) Unit!23450)

(declare-fun $colon$colon!234 (List!12786 (_ BitVec 64)) List!12786)

(assert (=> b!668756 (= lt!311344 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!234 acc!681 (select (arr!18745 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!668756 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!668757 () Bool)

(declare-fun e!382605 () Bool)

(assert (=> b!668757 (= e!382603 (not e!382605))))

(declare-fun res!435758 () Bool)

(assert (=> b!668757 (=> res!435758 e!382605)))

(assert (=> b!668757 (= res!435758 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun lt!311346 () List!12786)

(assert (=> b!668757 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!311346)))

(declare-fun lt!311349 () Unit!23450)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39105 (_ BitVec 64) (_ BitVec 32) List!12786 List!12786) Unit!23450)

(assert (=> b!668757 (= lt!311349 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!311346))))

(declare-fun -!100 (List!12786 (_ BitVec 64)) List!12786)

(assert (=> b!668757 (= (-!100 lt!311346 k0!2843) acc!681)))

(assert (=> b!668757 (= lt!311346 ($colon$colon!234 acc!681 k0!2843))))

(declare-fun lt!311353 () Unit!23450)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12786) Unit!23450)

(assert (=> b!668757 (= lt!311353 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!668757 (subseq!102 acc!681 acc!681)))

(declare-fun lt!311348 () Unit!23450)

(assert (=> b!668757 (= lt!311348 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!668757 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!311351 () Unit!23450)

(assert (=> b!668757 (= lt!311351 e!382596)))

(declare-fun c!76868 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!668757 (= c!76868 (validKeyInArray!0 (select (arr!18745 a!3626) from!3004)))))

(declare-fun lt!311350 () Unit!23450)

(declare-fun e!382604 () Unit!23450)

(assert (=> b!668757 (= lt!311350 e!382604)))

(declare-fun c!76867 () Bool)

(declare-fun arrayContainsKey!0 (array!39105 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!668757 (= c!76867 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!668757 (arrayContainsKey!0 (array!39106 (store (arr!18745 a!3626) i!1382 k0!2843) (size!19109 a!3626)) k0!2843 from!3004)))

(declare-fun b!668758 () Bool)

(declare-fun Unit!23452 () Unit!23450)

(assert (=> b!668758 (= e!382604 Unit!23452)))

(declare-fun lt!311352 () Unit!23450)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39105 (_ BitVec 64) (_ BitVec 32)) Unit!23450)

(assert (=> b!668758 (= lt!311352 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!668758 false))

(declare-fun b!668759 () Bool)

(declare-fun res!435765 () Bool)

(assert (=> b!668759 (=> (not res!435765) (not e!382603))))

(assert (=> b!668759 (= res!435765 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19109 a!3626)) (= from!3004 i!1382)))))

(declare-fun res!435761 () Bool)

(assert (=> start!60058 (=> (not res!435761) (not e!382603))))

(assert (=> start!60058 (= res!435761 (and (bvslt (size!19109 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19109 a!3626))))))

(assert (=> start!60058 e!382603))

(assert (=> start!60058 true))

(declare-fun array_inv!14541 (array!39105) Bool)

(assert (=> start!60058 (array_inv!14541 a!3626)))

(declare-fun b!668760 () Bool)

(assert (=> b!668760 (= e!382605 true)))

(declare-fun lt!311347 () Bool)

(declare-fun e!382597 () Bool)

(assert (=> b!668760 (= lt!311347 e!382597)))

(declare-fun res!435771 () Bool)

(assert (=> b!668760 (=> res!435771 e!382597)))

(declare-fun e!382595 () Bool)

(assert (=> b!668760 (= res!435771 e!382595)))

(declare-fun res!435762 () Bool)

(assert (=> b!668760 (=> (not res!435762) (not e!382595))))

(assert (=> b!668760 (= res!435762 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!668761 () Bool)

(declare-fun e!382599 () Bool)

(assert (=> b!668761 (= e!382597 e!382599)))

(declare-fun res!435753 () Bool)

(assert (=> b!668761 (=> (not res!435753) (not e!382599))))

(assert (=> b!668761 (= res!435753 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!668762 () Bool)

(declare-fun res!435763 () Bool)

(assert (=> b!668762 (=> (not res!435763) (not e!382603))))

(declare-fun contains!3363 (List!12786 (_ BitVec 64)) Bool)

(assert (=> b!668762 (= res!435763 (not (contains!3363 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!668763 () Bool)

(declare-fun Unit!23453 () Unit!23450)

(assert (=> b!668763 (= e!382596 Unit!23453)))

(declare-fun b!668764 () Bool)

(declare-fun res!435766 () Bool)

(assert (=> b!668764 (=> (not res!435766) (not e!382603))))

(declare-fun e!382600 () Bool)

(assert (=> b!668764 (= res!435766 e!382600)))

(declare-fun res!435760 () Bool)

(assert (=> b!668764 (=> res!435760 e!382600)))

(declare-fun e!382602 () Bool)

(assert (=> b!668764 (= res!435760 e!382602)))

(declare-fun res!435756 () Bool)

(assert (=> b!668764 (=> (not res!435756) (not e!382602))))

(assert (=> b!668764 (= res!435756 (bvsgt from!3004 i!1382))))

(declare-fun b!668765 () Bool)

(declare-fun res!435772 () Bool)

(assert (=> b!668765 (=> (not res!435772) (not e!382603))))

(assert (=> b!668765 (= res!435772 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12783))))

(declare-fun b!668766 () Bool)

(declare-fun Unit!23454 () Unit!23450)

(assert (=> b!668766 (= e!382604 Unit!23454)))

(declare-fun b!668767 () Bool)

(declare-fun e!382598 () Bool)

(assert (=> b!668767 (= e!382600 e!382598)))

(declare-fun res!435755 () Bool)

(assert (=> b!668767 (=> (not res!435755) (not e!382598))))

(assert (=> b!668767 (= res!435755 (bvsle from!3004 i!1382))))

(declare-fun b!668768 () Bool)

(assert (=> b!668768 (= e!382598 (not (contains!3363 acc!681 k0!2843)))))

(declare-fun b!668769 () Bool)

(declare-fun res!435768 () Bool)

(assert (=> b!668769 (=> res!435768 e!382605)))

(assert (=> b!668769 (= res!435768 (not (noDuplicate!610 lt!311346)))))

(declare-fun b!668770 () Bool)

(assert (=> b!668770 (= e!382599 (not (contains!3363 lt!311346 k0!2843)))))

(declare-fun b!668771 () Bool)

(declare-fun res!435767 () Bool)

(assert (=> b!668771 (=> (not res!435767) (not e!382603))))

(assert (=> b!668771 (= res!435767 (validKeyInArray!0 k0!2843))))

(declare-fun b!668772 () Bool)

(assert (=> b!668772 (= e!382595 (contains!3363 lt!311346 k0!2843))))

(declare-fun b!668773 () Bool)

(declare-fun res!435759 () Bool)

(assert (=> b!668773 (=> res!435759 e!382605)))

(assert (=> b!668773 (= res!435759 (contains!3363 lt!311346 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!668774 () Bool)

(assert (=> b!668774 (= e!382602 (contains!3363 acc!681 k0!2843))))

(declare-fun b!668775 () Bool)

(declare-fun res!435764 () Bool)

(assert (=> b!668775 (=> (not res!435764) (not e!382603))))

(assert (=> b!668775 (= res!435764 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!668776 () Bool)

(declare-fun res!435773 () Bool)

(assert (=> b!668776 (=> res!435773 e!382605)))

(assert (=> b!668776 (= res!435773 (contains!3363 lt!311346 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!668777 () Bool)

(declare-fun res!435769 () Bool)

(assert (=> b!668777 (=> (not res!435769) (not e!382603))))

(assert (=> b!668777 (= res!435769 (not (contains!3363 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60058 res!435761) b!668755))

(assert (= (and b!668755 res!435754) b!668777))

(assert (= (and b!668777 res!435769) b!668762))

(assert (= (and b!668762 res!435763) b!668764))

(assert (= (and b!668764 res!435756) b!668774))

(assert (= (and b!668764 (not res!435760)) b!668767))

(assert (= (and b!668767 res!435755) b!668768))

(assert (= (and b!668764 res!435766) b!668765))

(assert (= (and b!668765 res!435772) b!668753))

(assert (= (and b!668753 res!435757) b!668754))

(assert (= (and b!668754 res!435770) b!668771))

(assert (= (and b!668771 res!435767) b!668775))

(assert (= (and b!668775 res!435764) b!668759))

(assert (= (and b!668759 res!435765) b!668757))

(assert (= (and b!668757 c!76867) b!668758))

(assert (= (and b!668757 (not c!76867)) b!668766))

(assert (= (and b!668757 c!76868) b!668756))

(assert (= (and b!668757 (not c!76868)) b!668763))

(assert (= (and b!668757 (not res!435758)) b!668769))

(assert (= (and b!668769 (not res!435768)) b!668773))

(assert (= (and b!668773 (not res!435759)) b!668776))

(assert (= (and b!668776 (not res!435773)) b!668760))

(assert (= (and b!668760 res!435762) b!668772))

(assert (= (and b!668760 (not res!435771)) b!668761))

(assert (= (and b!668761 res!435753) b!668770))

(declare-fun m!639003 () Bool)

(assert (=> b!668765 m!639003))

(declare-fun m!639005 () Bool)

(assert (=> b!668753 m!639005))

(declare-fun m!639007 () Bool)

(assert (=> b!668758 m!639007))

(declare-fun m!639009 () Bool)

(assert (=> b!668772 m!639009))

(assert (=> b!668770 m!639009))

(declare-fun m!639011 () Bool)

(assert (=> b!668777 m!639011))

(declare-fun m!639013 () Bool)

(assert (=> b!668773 m!639013))

(declare-fun m!639015 () Bool)

(assert (=> start!60058 m!639015))

(declare-fun m!639017 () Bool)

(assert (=> b!668769 m!639017))

(declare-fun m!639019 () Bool)

(assert (=> b!668774 m!639019))

(declare-fun m!639021 () Bool)

(assert (=> b!668756 m!639021))

(declare-fun m!639023 () Bool)

(assert (=> b!668756 m!639023))

(declare-fun m!639025 () Bool)

(assert (=> b!668756 m!639025))

(declare-fun m!639027 () Bool)

(assert (=> b!668756 m!639027))

(assert (=> b!668756 m!639023))

(assert (=> b!668756 m!639025))

(declare-fun m!639029 () Bool)

(assert (=> b!668756 m!639029))

(declare-fun m!639031 () Bool)

(assert (=> b!668756 m!639031))

(declare-fun m!639033 () Bool)

(assert (=> b!668755 m!639033))

(assert (=> b!668768 m!639019))

(declare-fun m!639035 () Bool)

(assert (=> b!668771 m!639035))

(declare-fun m!639037 () Bool)

(assert (=> b!668762 m!639037))

(declare-fun m!639039 () Bool)

(assert (=> b!668776 m!639039))

(assert (=> b!668757 m!639021))

(assert (=> b!668757 m!639023))

(declare-fun m!639041 () Bool)

(assert (=> b!668757 m!639041))

(declare-fun m!639043 () Bool)

(assert (=> b!668757 m!639043))

(declare-fun m!639045 () Bool)

(assert (=> b!668757 m!639045))

(assert (=> b!668757 m!639029))

(declare-fun m!639047 () Bool)

(assert (=> b!668757 m!639047))

(declare-fun m!639049 () Bool)

(assert (=> b!668757 m!639049))

(assert (=> b!668757 m!639023))

(declare-fun m!639051 () Bool)

(assert (=> b!668757 m!639051))

(declare-fun m!639053 () Bool)

(assert (=> b!668757 m!639053))

(declare-fun m!639055 () Bool)

(assert (=> b!668757 m!639055))

(declare-fun m!639057 () Bool)

(assert (=> b!668757 m!639057))

(assert (=> b!668757 m!639031))

(declare-fun m!639059 () Bool)

(assert (=> b!668775 m!639059))

(check-sat (not b!668771) (not b!668772) (not start!60058) (not b!668777) (not b!668756) (not b!668768) (not b!668774) (not b!668762) (not b!668765) (not b!668773) (not b!668755) (not b!668770) (not b!668776) (not b!668758) (not b!668769) (not b!668775) (not b!668753) (not b!668757))
(check-sat)
