; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60054 () Bool)

(assert start!60054)

(declare-fun b!668757 () Bool)

(declare-fun res!435879 () Bool)

(declare-fun e!382545 () Bool)

(assert (=> b!668757 (=> res!435879 e!382545)))

(declare-datatypes ((List!12828 0))(
  ( (Nil!12825) (Cons!12824 (h!13869 (_ BitVec 64)) (t!19047 List!12828)) )
))
(declare-fun lt!311210 () List!12828)

(declare-fun noDuplicate!619 (List!12828) Bool)

(assert (=> b!668757 (= res!435879 (not (noDuplicate!619 lt!311210)))))

(declare-fun b!668758 () Bool)

(declare-fun res!435871 () Bool)

(declare-fun e!382542 () Bool)

(assert (=> b!668758 (=> (not res!435871) (not e!382542))))

(declare-datatypes ((array!39112 0))(
  ( (array!39113 (arr!18748 (Array (_ BitVec 32) (_ BitVec 64))) (size!19113 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39112)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39112 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!668758 (= res!435871 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!668759 () Bool)

(declare-fun e!382538 () Bool)

(declare-fun e!382546 () Bool)

(assert (=> b!668759 (= e!382538 e!382546)))

(declare-fun res!435885 () Bool)

(assert (=> b!668759 (=> (not res!435885) (not e!382546))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!668759 (= res!435885 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!668760 () Bool)

(declare-fun e!382537 () Bool)

(declare-fun acc!681 () List!12828)

(declare-fun contains!3350 (List!12828 (_ BitVec 64)) Bool)

(assert (=> b!668760 (= e!382537 (contains!3350 acc!681 k!2843))))

(declare-fun b!668761 () Bool)

(declare-fun res!435886 () Bool)

(assert (=> b!668761 (=> (not res!435886) (not e!382542))))

(assert (=> b!668761 (= res!435886 (noDuplicate!619 acc!681))))

(declare-fun b!668762 () Bool)

(declare-fun res!435880 () Bool)

(assert (=> b!668762 (=> res!435880 e!382545)))

(assert (=> b!668762 (= res!435880 (contains!3350 lt!311210 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!668763 () Bool)

(assert (=> b!668763 (= e!382545 true)))

(declare-fun lt!311215 () Bool)

(assert (=> b!668763 (= lt!311215 e!382538)))

(declare-fun res!435887 () Bool)

(assert (=> b!668763 (=> res!435887 e!382538)))

(declare-fun e!382539 () Bool)

(assert (=> b!668763 (= res!435887 e!382539)))

(declare-fun res!435881 () Bool)

(assert (=> b!668763 (=> (not res!435881) (not e!382539))))

(assert (=> b!668763 (= res!435881 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!668764 () Bool)

(declare-datatypes ((Unit!23448 0))(
  ( (Unit!23449) )
))
(declare-fun e!382541 () Unit!23448)

(declare-fun lt!311217 () Unit!23448)

(assert (=> b!668764 (= e!382541 lt!311217)))

(declare-fun lt!311216 () Unit!23448)

(declare-fun lemmaListSubSeqRefl!0 (List!12828) Unit!23448)

(assert (=> b!668764 (= lt!311216 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!106 (List!12828 List!12828) Bool)

(assert (=> b!668764 (subseq!106 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39112 List!12828 List!12828 (_ BitVec 32)) Unit!23448)

(declare-fun $colon$colon!237 (List!12828 (_ BitVec 64)) List!12828)

(assert (=> b!668764 (= lt!311217 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!237 acc!681 (select (arr!18748 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!39112 (_ BitVec 32) List!12828) Bool)

(assert (=> b!668764 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!668765 () Bool)

(declare-fun e!382544 () Unit!23448)

(declare-fun Unit!23450 () Unit!23448)

(assert (=> b!668765 (= e!382544 Unit!23450)))

(declare-fun lt!311214 () Unit!23448)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39112 (_ BitVec 64) (_ BitVec 32)) Unit!23448)

(assert (=> b!668765 (= lt!311214 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!668765 false))

(declare-fun b!668766 () Bool)

(declare-fun res!435875 () Bool)

(assert (=> b!668766 (=> (not res!435875) (not e!382542))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!668766 (= res!435875 (validKeyInArray!0 k!2843))))

(declare-fun b!668767 () Bool)

(assert (=> b!668767 (= e!382542 (not e!382545))))

(declare-fun res!435874 () Bool)

(assert (=> b!668767 (=> res!435874 e!382545)))

(assert (=> b!668767 (= res!435874 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!668767 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!311210)))

(declare-fun lt!311208 () Unit!23448)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39112 (_ BitVec 64) (_ BitVec 32) List!12828 List!12828) Unit!23448)

(assert (=> b!668767 (= lt!311208 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!311210))))

(declare-fun -!104 (List!12828 (_ BitVec 64)) List!12828)

(assert (=> b!668767 (= (-!104 lt!311210 k!2843) acc!681)))

(assert (=> b!668767 (= lt!311210 ($colon$colon!237 acc!681 k!2843))))

(declare-fun lt!311212 () Unit!23448)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12828) Unit!23448)

(assert (=> b!668767 (= lt!311212 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!668767 (subseq!106 acc!681 acc!681)))

(declare-fun lt!311209 () Unit!23448)

(assert (=> b!668767 (= lt!311209 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!668767 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!311211 () Unit!23448)

(assert (=> b!668767 (= lt!311211 e!382541)))

(declare-fun c!76811 () Bool)

(assert (=> b!668767 (= c!76811 (validKeyInArray!0 (select (arr!18748 a!3626) from!3004)))))

(declare-fun lt!311213 () Unit!23448)

(assert (=> b!668767 (= lt!311213 e!382544)))

(declare-fun c!76812 () Bool)

(assert (=> b!668767 (= c!76812 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!668767 (arrayContainsKey!0 (array!39113 (store (arr!18748 a!3626) i!1382 k!2843) (size!19113 a!3626)) k!2843 from!3004)))

(declare-fun b!668768 () Bool)

(declare-fun Unit!23451 () Unit!23448)

(assert (=> b!668768 (= e!382544 Unit!23451)))

(declare-fun b!668769 () Bool)

(assert (=> b!668769 (= e!382546 (not (contains!3350 lt!311210 k!2843)))))

(declare-fun b!668770 () Bool)

(assert (=> b!668770 (= e!382539 (contains!3350 lt!311210 k!2843))))

(declare-fun b!668771 () Bool)

(declare-fun e!382547 () Bool)

(declare-fun e!382543 () Bool)

(assert (=> b!668771 (= e!382547 e!382543)))

(declare-fun res!435878 () Bool)

(assert (=> b!668771 (=> (not res!435878) (not e!382543))))

(assert (=> b!668771 (= res!435878 (bvsle from!3004 i!1382))))

(declare-fun b!668772 () Bool)

(assert (=> b!668772 (= e!382543 (not (contains!3350 acc!681 k!2843)))))

(declare-fun b!668773 () Bool)

(declare-fun Unit!23452 () Unit!23448)

(assert (=> b!668773 (= e!382541 Unit!23452)))

(declare-fun b!668774 () Bool)

(declare-fun res!435884 () Bool)

(assert (=> b!668774 (=> (not res!435884) (not e!382542))))

(assert (=> b!668774 (= res!435884 (not (contains!3350 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!668775 () Bool)

(declare-fun res!435869 () Bool)

(assert (=> b!668775 (=> (not res!435869) (not e!382542))))

(assert (=> b!668775 (= res!435869 (not (contains!3350 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!668776 () Bool)

(declare-fun res!435882 () Bool)

(assert (=> b!668776 (=> (not res!435882) (not e!382542))))

(assert (=> b!668776 (= res!435882 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!668777 () Bool)

(declare-fun res!435877 () Bool)

(assert (=> b!668777 (=> (not res!435877) (not e!382542))))

(assert (=> b!668777 (= res!435877 e!382547)))

(declare-fun res!435872 () Bool)

(assert (=> b!668777 (=> res!435872 e!382547)))

(assert (=> b!668777 (= res!435872 e!382537)))

(declare-fun res!435873 () Bool)

(assert (=> b!668777 (=> (not res!435873) (not e!382537))))

(assert (=> b!668777 (= res!435873 (bvsgt from!3004 i!1382))))

(declare-fun b!668778 () Bool)

(declare-fun res!435888 () Bool)

(assert (=> b!668778 (=> (not res!435888) (not e!382542))))

(assert (=> b!668778 (= res!435888 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12825))))

(declare-fun b!668779 () Bool)

(declare-fun res!435870 () Bool)

(assert (=> b!668779 (=> (not res!435870) (not e!382542))))

(assert (=> b!668779 (= res!435870 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19113 a!3626))))))

(declare-fun b!668780 () Bool)

(declare-fun res!435889 () Bool)

(assert (=> b!668780 (=> (not res!435889) (not e!382542))))

(assert (=> b!668780 (= res!435889 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19113 a!3626)) (= from!3004 i!1382)))))

(declare-fun res!435883 () Bool)

(assert (=> start!60054 (=> (not res!435883) (not e!382542))))

(assert (=> start!60054 (= res!435883 (and (bvslt (size!19113 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19113 a!3626))))))

(assert (=> start!60054 e!382542))

(assert (=> start!60054 true))

(declare-fun array_inv!14631 (array!39112) Bool)

(assert (=> start!60054 (array_inv!14631 a!3626)))

(declare-fun b!668781 () Bool)

(declare-fun res!435876 () Bool)

(assert (=> b!668781 (=> res!435876 e!382545)))

(assert (=> b!668781 (= res!435876 (contains!3350 lt!311210 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!60054 res!435883) b!668761))

(assert (= (and b!668761 res!435886) b!668774))

(assert (= (and b!668774 res!435884) b!668775))

(assert (= (and b!668775 res!435869) b!668777))

(assert (= (and b!668777 res!435873) b!668760))

(assert (= (and b!668777 (not res!435872)) b!668771))

(assert (= (and b!668771 res!435878) b!668772))

(assert (= (and b!668777 res!435877) b!668778))

(assert (= (and b!668778 res!435888) b!668776))

(assert (= (and b!668776 res!435882) b!668779))

(assert (= (and b!668779 res!435870) b!668766))

(assert (= (and b!668766 res!435875) b!668758))

(assert (= (and b!668758 res!435871) b!668780))

(assert (= (and b!668780 res!435889) b!668767))

(assert (= (and b!668767 c!76812) b!668765))

(assert (= (and b!668767 (not c!76812)) b!668768))

(assert (= (and b!668767 c!76811) b!668764))

(assert (= (and b!668767 (not c!76811)) b!668773))

(assert (= (and b!668767 (not res!435874)) b!668757))

(assert (= (and b!668757 (not res!435879)) b!668781))

(assert (= (and b!668781 (not res!435876)) b!668762))

(assert (= (and b!668762 (not res!435880)) b!668763))

(assert (= (and b!668763 res!435881) b!668770))

(assert (= (and b!668763 (not res!435887)) b!668759))

(assert (= (and b!668759 res!435885) b!668769))

(declare-fun m!638453 () Bool)

(assert (=> b!668778 m!638453))

(declare-fun m!638455 () Bool)

(assert (=> b!668781 m!638455))

(declare-fun m!638457 () Bool)

(assert (=> b!668769 m!638457))

(declare-fun m!638459 () Bool)

(assert (=> b!668775 m!638459))

(declare-fun m!638461 () Bool)

(assert (=> b!668757 m!638461))

(declare-fun m!638463 () Bool)

(assert (=> b!668758 m!638463))

(declare-fun m!638465 () Bool)

(assert (=> b!668772 m!638465))

(declare-fun m!638467 () Bool)

(assert (=> b!668776 m!638467))

(assert (=> b!668760 m!638465))

(declare-fun m!638469 () Bool)

(assert (=> b!668764 m!638469))

(declare-fun m!638471 () Bool)

(assert (=> b!668764 m!638471))

(declare-fun m!638473 () Bool)

(assert (=> b!668764 m!638473))

(declare-fun m!638475 () Bool)

(assert (=> b!668764 m!638475))

(assert (=> b!668764 m!638471))

(assert (=> b!668764 m!638473))

(declare-fun m!638477 () Bool)

(assert (=> b!668764 m!638477))

(declare-fun m!638479 () Bool)

(assert (=> b!668764 m!638479))

(declare-fun m!638481 () Bool)

(assert (=> b!668774 m!638481))

(declare-fun m!638483 () Bool)

(assert (=> b!668765 m!638483))

(assert (=> b!668770 m!638457))

(declare-fun m!638485 () Bool)

(assert (=> b!668761 m!638485))

(assert (=> b!668767 m!638469))

(assert (=> b!668767 m!638471))

(declare-fun m!638487 () Bool)

(assert (=> b!668767 m!638487))

(declare-fun m!638489 () Bool)

(assert (=> b!668767 m!638489))

(declare-fun m!638491 () Bool)

(assert (=> b!668767 m!638491))

(declare-fun m!638493 () Bool)

(assert (=> b!668767 m!638493))

(assert (=> b!668767 m!638477))

(declare-fun m!638495 () Bool)

(assert (=> b!668767 m!638495))

(declare-fun m!638497 () Bool)

(assert (=> b!668767 m!638497))

(declare-fun m!638499 () Bool)

(assert (=> b!668767 m!638499))

(assert (=> b!668767 m!638471))

(declare-fun m!638501 () Bool)

(assert (=> b!668767 m!638501))

(declare-fun m!638503 () Bool)

(assert (=> b!668767 m!638503))

(assert (=> b!668767 m!638479))

(declare-fun m!638505 () Bool)

(assert (=> b!668766 m!638505))

(declare-fun m!638507 () Bool)

(assert (=> b!668762 m!638507))

(declare-fun m!638509 () Bool)

(assert (=> start!60054 m!638509))

(push 1)

(assert (not b!668778))

(assert (not b!668770))

(assert (not b!668765))

(assert (not b!668774))

(assert (not b!668772))

(assert (not b!668762))

(assert (not b!668766))

(assert (not b!668775))

(assert (not b!668781))

(assert (not b!668758))

(assert (not b!668760))

(assert (not b!668757))

(assert (not start!60054))

(assert (not b!668769))

(assert (not b!668764))

(assert (not b!668776))

(assert (not b!668761))

(assert (not b!668767))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

