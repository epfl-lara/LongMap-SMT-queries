; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59952 () Bool)

(assert start!59952)

(declare-fun b!664778 () Bool)

(declare-fun res!432417 () Bool)

(declare-fun e!381153 () Bool)

(assert (=> b!664778 (=> (not res!432417) (not e!381153))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!38999 0))(
  ( (array!39000 (arr!18692 (Array (_ BitVec 32) (_ BitVec 64))) (size!19056 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38999)

(assert (=> b!664778 (= res!432417 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19056 a!3626))))))

(declare-fun b!664779 () Bool)

(declare-datatypes ((Unit!23185 0))(
  ( (Unit!23186) )
))
(declare-fun e!381147 () Unit!23185)

(declare-fun Unit!23187 () Unit!23185)

(assert (=> b!664779 (= e!381147 Unit!23187)))

(declare-fun b!664780 () Bool)

(declare-fun res!432422 () Bool)

(assert (=> b!664780 (=> (not res!432422) (not e!381153))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!664780 (= res!432422 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19056 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!664781 () Bool)

(declare-fun e!381150 () Unit!23185)

(declare-fun Unit!23188 () Unit!23185)

(assert (=> b!664781 (= e!381150 Unit!23188)))

(declare-fun lt!309754 () Unit!23185)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38999 (_ BitVec 64) (_ BitVec 32)) Unit!23185)

(assert (=> b!664781 (= lt!309754 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!664781 false))

(declare-fun b!664782 () Bool)

(declare-fun res!432415 () Bool)

(declare-fun e!381146 () Bool)

(assert (=> b!664782 (=> res!432415 e!381146)))

(declare-datatypes ((List!12733 0))(
  ( (Nil!12730) (Cons!12729 (h!13774 (_ BitVec 64)) (t!18961 List!12733)) )
))
(declare-fun lt!309759 () List!12733)

(declare-fun contains!3310 (List!12733 (_ BitVec 64)) Bool)

(assert (=> b!664782 (= res!432415 (not (contains!3310 lt!309759 k!2843)))))

(declare-fun b!664783 () Bool)

(declare-fun res!432418 () Bool)

(assert (=> b!664783 (=> (not res!432418) (not e!381153))))

(declare-fun arrayContainsKey!0 (array!38999 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!664783 (= res!432418 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!664784 () Bool)

(declare-fun res!432433 () Bool)

(assert (=> b!664784 (=> res!432433 e!381146)))

(assert (=> b!664784 (= res!432433 (contains!3310 lt!309759 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!664785 () Bool)

(declare-fun res!432423 () Bool)

(assert (=> b!664785 (=> res!432423 e!381146)))

(declare-fun lt!309761 () Bool)

(assert (=> b!664785 (= res!432423 lt!309761)))

(declare-fun b!664786 () Bool)

(declare-fun res!432419 () Bool)

(assert (=> b!664786 (=> (not res!432419) (not e!381153))))

(declare-fun e!381148 () Bool)

(assert (=> b!664786 (= res!432419 e!381148)))

(declare-fun res!432431 () Bool)

(assert (=> b!664786 (=> res!432431 e!381148)))

(declare-fun e!381151 () Bool)

(assert (=> b!664786 (= res!432431 e!381151)))

(declare-fun res!432424 () Bool)

(assert (=> b!664786 (=> (not res!432424) (not e!381151))))

(assert (=> b!664786 (= res!432424 (bvsgt from!3004 i!1382))))

(declare-fun b!664787 () Bool)

(declare-fun lt!309756 () Unit!23185)

(assert (=> b!664787 (= e!381147 lt!309756)))

(declare-fun lt!309762 () Unit!23185)

(declare-fun acc!681 () List!12733)

(declare-fun lemmaListSubSeqRefl!0 (List!12733) Unit!23185)

(assert (=> b!664787 (= lt!309762 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!49 (List!12733 List!12733) Bool)

(assert (=> b!664787 (subseq!49 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!38999 List!12733 List!12733 (_ BitVec 32)) Unit!23185)

(declare-fun $colon$colon!181 (List!12733 (_ BitVec 64)) List!12733)

(assert (=> b!664787 (= lt!309756 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!181 acc!681 (select (arr!18692 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!38999 (_ BitVec 32) List!12733) Bool)

(assert (=> b!664787 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!664788 () Bool)

(declare-fun res!432427 () Bool)

(assert (=> b!664788 (=> (not res!432427) (not e!381153))))

(assert (=> b!664788 (= res!432427 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!664789 () Bool)

(declare-fun res!432429 () Bool)

(assert (=> b!664789 (=> (not res!432429) (not e!381153))))

(assert (=> b!664789 (= res!432429 (not (contains!3310 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!664790 () Bool)

(declare-fun res!432416 () Bool)

(assert (=> b!664790 (=> (not res!432416) (not e!381153))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!664790 (= res!432416 (validKeyInArray!0 k!2843))))

(declare-fun b!664791 () Bool)

(assert (=> b!664791 (= e!381146 true)))

(declare-fun lt!309763 () Bool)

(assert (=> b!664791 (= lt!309763 (contains!3310 lt!309759 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!664793 () Bool)

(declare-fun res!432414 () Bool)

(assert (=> b!664793 (=> res!432414 e!381146)))

(assert (=> b!664793 (= res!432414 (contains!3310 acc!681 k!2843))))

(declare-fun b!664794 () Bool)

(declare-fun e!381149 () Bool)

(assert (=> b!664794 (= e!381149 (not (contains!3310 acc!681 k!2843)))))

(declare-fun b!664795 () Bool)

(declare-fun res!432420 () Bool)

(assert (=> b!664795 (=> (not res!432420) (not e!381153))))

(declare-fun noDuplicate!557 (List!12733) Bool)

(assert (=> b!664795 (= res!432420 (noDuplicate!557 acc!681))))

(declare-fun res!432421 () Bool)

(assert (=> start!59952 (=> (not res!432421) (not e!381153))))

(assert (=> start!59952 (= res!432421 (and (bvslt (size!19056 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19056 a!3626))))))

(assert (=> start!59952 e!381153))

(assert (=> start!59952 true))

(declare-fun array_inv!14488 (array!38999) Bool)

(assert (=> start!59952 (array_inv!14488 a!3626)))

(declare-fun b!664792 () Bool)

(assert (=> b!664792 (= e!381151 (contains!3310 acc!681 k!2843))))

(declare-fun b!664796 () Bool)

(declare-fun res!432426 () Bool)

(assert (=> b!664796 (=> (not res!432426) (not e!381153))))

(assert (=> b!664796 (= res!432426 (not (contains!3310 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!664797 () Bool)

(declare-fun res!432432 () Bool)

(assert (=> b!664797 (=> (not res!432432) (not e!381153))))

(assert (=> b!664797 (= res!432432 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12730))))

(declare-fun b!664798 () Bool)

(declare-fun Unit!23189 () Unit!23185)

(assert (=> b!664798 (= e!381150 Unit!23189)))

(declare-fun b!664799 () Bool)

(assert (=> b!664799 (= e!381148 e!381149)))

(declare-fun res!432425 () Bool)

(assert (=> b!664799 (=> (not res!432425) (not e!381149))))

(assert (=> b!664799 (= res!432425 (bvsle from!3004 i!1382))))

(declare-fun b!664800 () Bool)

(declare-fun res!432434 () Bool)

(assert (=> b!664800 (=> res!432434 e!381146)))

(assert (=> b!664800 (= res!432434 (not (noDuplicate!557 lt!309759)))))

(declare-fun b!664801 () Bool)

(assert (=> b!664801 (= e!381153 (not e!381146))))

(declare-fun res!432428 () Bool)

(assert (=> b!664801 (=> res!432428 e!381146)))

(assert (=> b!664801 (= res!432428 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!47 (List!12733 (_ BitVec 64)) List!12733)

(assert (=> b!664801 (= (-!47 lt!309759 k!2843) acc!681)))

(assert (=> b!664801 (= lt!309759 ($colon$colon!181 acc!681 k!2843))))

(declare-fun lt!309757 () Unit!23185)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12733) Unit!23185)

(assert (=> b!664801 (= lt!309757 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!664801 (subseq!49 acc!681 acc!681)))

(declare-fun lt!309755 () Unit!23185)

(assert (=> b!664801 (= lt!309755 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!664801 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!309760 () Unit!23185)

(assert (=> b!664801 (= lt!309760 e!381147)))

(declare-fun c!76550 () Bool)

(assert (=> b!664801 (= c!76550 (validKeyInArray!0 (select (arr!18692 a!3626) from!3004)))))

(declare-fun lt!309758 () Unit!23185)

(assert (=> b!664801 (= lt!309758 e!381150)))

(declare-fun c!76549 () Bool)

(assert (=> b!664801 (= c!76549 lt!309761)))

(assert (=> b!664801 (= lt!309761 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!664801 (arrayContainsKey!0 (array!39000 (store (arr!18692 a!3626) i!1382 k!2843) (size!19056 a!3626)) k!2843 from!3004)))

(declare-fun b!664802 () Bool)

(declare-fun res!432430 () Bool)

(assert (=> b!664802 (=> res!432430 e!381146)))

(assert (=> b!664802 (= res!432430 (not (subseq!49 acc!681 lt!309759)))))

(assert (= (and start!59952 res!432421) b!664795))

(assert (= (and b!664795 res!432420) b!664796))

(assert (= (and b!664796 res!432426) b!664789))

(assert (= (and b!664789 res!432429) b!664786))

(assert (= (and b!664786 res!432424) b!664792))

(assert (= (and b!664786 (not res!432431)) b!664799))

(assert (= (and b!664799 res!432425) b!664794))

(assert (= (and b!664786 res!432419) b!664797))

(assert (= (and b!664797 res!432432) b!664788))

(assert (= (and b!664788 res!432427) b!664778))

(assert (= (and b!664778 res!432417) b!664790))

(assert (= (and b!664790 res!432416) b!664783))

(assert (= (and b!664783 res!432418) b!664780))

(assert (= (and b!664780 res!432422) b!664801))

(assert (= (and b!664801 c!76549) b!664781))

(assert (= (and b!664801 (not c!76549)) b!664798))

(assert (= (and b!664801 c!76550) b!664787))

(assert (= (and b!664801 (not c!76550)) b!664779))

(assert (= (and b!664801 (not res!432428)) b!664800))

(assert (= (and b!664800 (not res!432434)) b!664785))

(assert (= (and b!664785 (not res!432423)) b!664793))

(assert (= (and b!664793 (not res!432414)) b!664802))

(assert (= (and b!664802 (not res!432430)) b!664782))

(assert (= (and b!664782 (not res!432415)) b!664784))

(assert (= (and b!664784 (not res!432433)) b!664791))

(declare-fun m!635997 () Bool)

(assert (=> start!59952 m!635997))

(declare-fun m!635999 () Bool)

(assert (=> b!664782 m!635999))

(declare-fun m!636001 () Bool)

(assert (=> b!664795 m!636001))

(declare-fun m!636003 () Bool)

(assert (=> b!664797 m!636003))

(declare-fun m!636005 () Bool)

(assert (=> b!664789 m!636005))

(declare-fun m!636007 () Bool)

(assert (=> b!664800 m!636007))

(declare-fun m!636009 () Bool)

(assert (=> b!664794 m!636009))

(declare-fun m!636011 () Bool)

(assert (=> b!664801 m!636011))

(declare-fun m!636013 () Bool)

(assert (=> b!664801 m!636013))

(declare-fun m!636015 () Bool)

(assert (=> b!664801 m!636015))

(declare-fun m!636017 () Bool)

(assert (=> b!664801 m!636017))

(declare-fun m!636019 () Bool)

(assert (=> b!664801 m!636019))

(declare-fun m!636021 () Bool)

(assert (=> b!664801 m!636021))

(declare-fun m!636023 () Bool)

(assert (=> b!664801 m!636023))

(declare-fun m!636025 () Bool)

(assert (=> b!664801 m!636025))

(assert (=> b!664801 m!636013))

(declare-fun m!636027 () Bool)

(assert (=> b!664801 m!636027))

(declare-fun m!636029 () Bool)

(assert (=> b!664801 m!636029))

(declare-fun m!636031 () Bool)

(assert (=> b!664801 m!636031))

(declare-fun m!636033 () Bool)

(assert (=> b!664788 m!636033))

(declare-fun m!636035 () Bool)

(assert (=> b!664796 m!636035))

(declare-fun m!636037 () Bool)

(assert (=> b!664791 m!636037))

(declare-fun m!636039 () Bool)

(assert (=> b!664781 m!636039))

(assert (=> b!664793 m!636009))

(assert (=> b!664787 m!636011))

(assert (=> b!664787 m!636013))

(declare-fun m!636041 () Bool)

(assert (=> b!664787 m!636041))

(declare-fun m!636043 () Bool)

(assert (=> b!664787 m!636043))

(assert (=> b!664787 m!636013))

(assert (=> b!664787 m!636041))

(assert (=> b!664787 m!636021))

(assert (=> b!664787 m!636031))

(declare-fun m!636045 () Bool)

(assert (=> b!664790 m!636045))

(declare-fun m!636047 () Bool)

(assert (=> b!664802 m!636047))

(assert (=> b!664792 m!636009))

(declare-fun m!636049 () Bool)

(assert (=> b!664784 m!636049))

(declare-fun m!636051 () Bool)

(assert (=> b!664783 m!636051))

(push 1)

(assert (not b!664795))

(assert (not b!664781))

(assert (not start!59952))

(assert (not b!664790))

(assert (not b!664801))

(assert (not b!664789))

(assert (not b!664784))

(assert (not b!664797))

(assert (not b!664796))

(assert (not b!664793))

(assert (not b!664782))

(assert (not b!664783))

(assert (not b!664802))

(assert (not b!664792))

(assert (not b!664800))

(assert (not b!664794))

(assert (not b!664791))

(assert (not b!664787))

(assert (not b!664788))

(check-sat)

(pop 1)

