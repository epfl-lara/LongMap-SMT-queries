; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61062 () Bool)

(assert start!61062)

(declare-fun b!684778 () Bool)

(declare-fun res!450214 () Bool)

(declare-fun e!389960 () Bool)

(assert (=> b!684778 (=> (not res!450214) (not e!389960))))

(declare-datatypes ((array!39609 0))(
  ( (array!39610 (arr!18982 (Array (_ BitVec 32) (_ BitVec 64))) (size!19349 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39609)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!12930 0))(
  ( (Nil!12927) (Cons!12926 (h!13974 (_ BitVec 64)) (t!19168 List!12930)) )
))
(declare-fun acc!681 () List!12930)

(declare-fun arrayNoDuplicates!0 (array!39609 (_ BitVec 32) List!12930) Bool)

(assert (=> b!684778 (= res!450214 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!684779 () Bool)

(declare-fun res!450209 () Bool)

(assert (=> b!684779 (=> (not res!450209) (not e!389960))))

(declare-fun noDuplicate!856 (List!12930) Bool)

(assert (=> b!684779 (= res!450209 (noDuplicate!856 acc!681))))

(declare-fun b!684780 () Bool)

(declare-fun e!389956 () Bool)

(declare-fun lt!314477 () List!12930)

(declare-fun subseq!191 (List!12930 List!12930) Bool)

(assert (=> b!684780 (= e!389956 (subseq!191 acc!681 lt!314477))))

(declare-fun b!684781 () Bool)

(declare-fun res!450225 () Bool)

(assert (=> b!684781 (=> (not res!450225) (not e!389960))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!684781 (= res!450225 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19349 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!684782 () Bool)

(declare-fun res!450212 () Bool)

(assert (=> b!684782 (=> (not res!450212) (not e!389960))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!684782 (= res!450212 (validKeyInArray!0 k0!2843))))

(declare-fun res!450213 () Bool)

(assert (=> start!61062 (=> (not res!450213) (not e!389960))))

(assert (=> start!61062 (= res!450213 (and (bvslt (size!19349 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19349 a!3626))))))

(assert (=> start!61062 e!389960))

(assert (=> start!61062 true))

(declare-fun array_inv!14841 (array!39609) Bool)

(assert (=> start!61062 (array_inv!14841 a!3626)))

(declare-fun b!684783 () Bool)

(declare-fun e!389954 () Bool)

(declare-fun contains!3582 (List!12930 (_ BitVec 64)) Bool)

(assert (=> b!684783 (= e!389954 (contains!3582 acc!681 k0!2843))))

(declare-fun b!684784 () Bool)

(declare-datatypes ((Unit!24081 0))(
  ( (Unit!24082) )
))
(declare-fun e!389961 () Unit!24081)

(declare-fun Unit!24083 () Unit!24081)

(assert (=> b!684784 (= e!389961 Unit!24083)))

(declare-fun lt!314482 () Unit!24081)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39609 (_ BitVec 64) (_ BitVec 32)) Unit!24081)

(assert (=> b!684784 (= lt!314482 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!684784 false))

(declare-fun b!684785 () Bool)

(declare-fun res!450219 () Bool)

(assert (=> b!684785 (=> (not res!450219) (not e!389960))))

(declare-fun arrayContainsKey!0 (array!39609 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!684785 (= res!450219 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!684786 () Bool)

(assert (=> b!684786 (= e!389960 (not e!389956))))

(declare-fun res!450211 () Bool)

(assert (=> b!684786 (=> res!450211 e!389956)))

(assert (=> b!684786 (= res!450211 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!155 (List!12930 (_ BitVec 64)) List!12930)

(assert (=> b!684786 (= (-!155 lt!314477 k0!2843) acc!681)))

(declare-fun $colon$colon!353 (List!12930 (_ BitVec 64)) List!12930)

(assert (=> b!684786 (= lt!314477 ($colon$colon!353 acc!681 k0!2843))))

(declare-fun lt!314483 () Unit!24081)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12930) Unit!24081)

(assert (=> b!684786 (= lt!314483 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!684786 (subseq!191 acc!681 acc!681)))

(declare-fun lt!314479 () Unit!24081)

(declare-fun lemmaListSubSeqRefl!0 (List!12930) Unit!24081)

(assert (=> b!684786 (= lt!314479 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!684786 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!314478 () Unit!24081)

(declare-fun e!389958 () Unit!24081)

(assert (=> b!684786 (= lt!314478 e!389958)))

(declare-fun c!77653 () Bool)

(assert (=> b!684786 (= c!77653 (validKeyInArray!0 (select (arr!18982 a!3626) from!3004)))))

(declare-fun lt!314485 () Unit!24081)

(assert (=> b!684786 (= lt!314485 e!389961)))

(declare-fun c!77654 () Bool)

(declare-fun lt!314480 () Bool)

(assert (=> b!684786 (= c!77654 lt!314480)))

(assert (=> b!684786 (= lt!314480 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!684786 (arrayContainsKey!0 (array!39610 (store (arr!18982 a!3626) i!1382 k0!2843) (size!19349 a!3626)) k0!2843 from!3004)))

(declare-fun b!684787 () Bool)

(declare-fun res!450223 () Bool)

(assert (=> b!684787 (=> (not res!450223) (not e!389960))))

(assert (=> b!684787 (= res!450223 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19349 a!3626))))))

(declare-fun b!684788 () Bool)

(declare-fun res!450216 () Bool)

(assert (=> b!684788 (=> (not res!450216) (not e!389960))))

(assert (=> b!684788 (= res!450216 (not (contains!3582 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!684789 () Bool)

(declare-fun res!450224 () Bool)

(assert (=> b!684789 (=> res!450224 e!389956)))

(assert (=> b!684789 (= res!450224 lt!314480)))

(declare-fun b!684790 () Bool)

(declare-fun res!450220 () Bool)

(assert (=> b!684790 (=> (not res!450220) (not e!389960))))

(assert (=> b!684790 (= res!450220 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12927))))

(declare-fun b!684791 () Bool)

(declare-fun Unit!24084 () Unit!24081)

(assert (=> b!684791 (= e!389958 Unit!24084)))

(declare-fun b!684792 () Bool)

(declare-fun e!389957 () Bool)

(assert (=> b!684792 (= e!389957 (not (contains!3582 acc!681 k0!2843)))))

(declare-fun b!684793 () Bool)

(declare-fun lt!314481 () Unit!24081)

(assert (=> b!684793 (= e!389958 lt!314481)))

(declare-fun lt!314484 () Unit!24081)

(assert (=> b!684793 (= lt!314484 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!684793 (subseq!191 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39609 List!12930 List!12930 (_ BitVec 32)) Unit!24081)

(assert (=> b!684793 (= lt!314481 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!353 acc!681 (select (arr!18982 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!684793 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!684794 () Bool)

(declare-fun Unit!24085 () Unit!24081)

(assert (=> b!684794 (= e!389961 Unit!24085)))

(declare-fun b!684795 () Bool)

(declare-fun res!450210 () Bool)

(assert (=> b!684795 (=> res!450210 e!389956)))

(assert (=> b!684795 (= res!450210 (contains!3582 acc!681 k0!2843))))

(declare-fun b!684796 () Bool)

(declare-fun res!450226 () Bool)

(assert (=> b!684796 (=> (not res!450226) (not e!389960))))

(assert (=> b!684796 (= res!450226 (not (contains!3582 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!684797 () Bool)

(declare-fun res!450218 () Bool)

(assert (=> b!684797 (=> (not res!450218) (not e!389960))))

(declare-fun e!389955 () Bool)

(assert (=> b!684797 (= res!450218 e!389955)))

(declare-fun res!450215 () Bool)

(assert (=> b!684797 (=> res!450215 e!389955)))

(assert (=> b!684797 (= res!450215 e!389954)))

(declare-fun res!450217 () Bool)

(assert (=> b!684797 (=> (not res!450217) (not e!389954))))

(assert (=> b!684797 (= res!450217 (bvsgt from!3004 i!1382))))

(declare-fun b!684798 () Bool)

(declare-fun res!450222 () Bool)

(assert (=> b!684798 (=> res!450222 e!389956)))

(assert (=> b!684798 (= res!450222 (not (noDuplicate!856 lt!314477)))))

(declare-fun b!684799 () Bool)

(assert (=> b!684799 (= e!389955 e!389957)))

(declare-fun res!450221 () Bool)

(assert (=> b!684799 (=> (not res!450221) (not e!389957))))

(assert (=> b!684799 (= res!450221 (bvsle from!3004 i!1382))))

(assert (= (and start!61062 res!450213) b!684779))

(assert (= (and b!684779 res!450209) b!684788))

(assert (= (and b!684788 res!450216) b!684796))

(assert (= (and b!684796 res!450226) b!684797))

(assert (= (and b!684797 res!450217) b!684783))

(assert (= (and b!684797 (not res!450215)) b!684799))

(assert (= (and b!684799 res!450221) b!684792))

(assert (= (and b!684797 res!450218) b!684790))

(assert (= (and b!684790 res!450220) b!684778))

(assert (= (and b!684778 res!450214) b!684787))

(assert (= (and b!684787 res!450223) b!684782))

(assert (= (and b!684782 res!450212) b!684785))

(assert (= (and b!684785 res!450219) b!684781))

(assert (= (and b!684781 res!450225) b!684786))

(assert (= (and b!684786 c!77654) b!684784))

(assert (= (and b!684786 (not c!77654)) b!684794))

(assert (= (and b!684786 c!77653) b!684793))

(assert (= (and b!684786 (not c!77653)) b!684791))

(assert (= (and b!684786 (not res!450211)) b!684798))

(assert (= (and b!684798 (not res!450222)) b!684789))

(assert (= (and b!684789 (not res!450224)) b!684795))

(assert (= (and b!684795 (not res!450210)) b!684780))

(declare-fun m!649579 () Bool)

(assert (=> b!684793 m!649579))

(declare-fun m!649581 () Bool)

(assert (=> b!684793 m!649581))

(declare-fun m!649583 () Bool)

(assert (=> b!684793 m!649583))

(declare-fun m!649585 () Bool)

(assert (=> b!684793 m!649585))

(assert (=> b!684793 m!649581))

(assert (=> b!684793 m!649583))

(declare-fun m!649587 () Bool)

(assert (=> b!684793 m!649587))

(declare-fun m!649589 () Bool)

(assert (=> b!684793 m!649589))

(declare-fun m!649591 () Bool)

(assert (=> b!684792 m!649591))

(assert (=> b!684795 m!649591))

(declare-fun m!649593 () Bool)

(assert (=> b!684779 m!649593))

(assert (=> b!684783 m!649591))

(declare-fun m!649595 () Bool)

(assert (=> start!61062 m!649595))

(declare-fun m!649597 () Bool)

(assert (=> b!684785 m!649597))

(declare-fun m!649599 () Bool)

(assert (=> b!684778 m!649599))

(declare-fun m!649601 () Bool)

(assert (=> b!684796 m!649601))

(declare-fun m!649603 () Bool)

(assert (=> b!684782 m!649603))

(declare-fun m!649605 () Bool)

(assert (=> b!684784 m!649605))

(assert (=> b!684786 m!649579))

(assert (=> b!684786 m!649581))

(declare-fun m!649607 () Bool)

(assert (=> b!684786 m!649607))

(declare-fun m!649609 () Bool)

(assert (=> b!684786 m!649609))

(assert (=> b!684786 m!649587))

(declare-fun m!649611 () Bool)

(assert (=> b!684786 m!649611))

(declare-fun m!649613 () Bool)

(assert (=> b!684786 m!649613))

(assert (=> b!684786 m!649581))

(declare-fun m!649615 () Bool)

(assert (=> b!684786 m!649615))

(declare-fun m!649617 () Bool)

(assert (=> b!684786 m!649617))

(declare-fun m!649619 () Bool)

(assert (=> b!684786 m!649619))

(assert (=> b!684786 m!649589))

(declare-fun m!649621 () Bool)

(assert (=> b!684780 m!649621))

(declare-fun m!649623 () Bool)

(assert (=> b!684788 m!649623))

(declare-fun m!649625 () Bool)

(assert (=> b!684790 m!649625))

(declare-fun m!649627 () Bool)

(assert (=> b!684798 m!649627))

(check-sat (not b!684786) (not b!684783) (not b!684798) (not b!684790) (not b!684792) (not b!684780) (not b!684778) (not b!684796) (not b!684782) (not b!684784) (not b!684788) (not b!684779) (not b!684793) (not start!61062) (not b!684785) (not b!684795))
(check-sat)
(get-model)

(declare-fun d!94437 () Bool)

(declare-fun lt!314542 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!285 (List!12930) (InoxSet (_ BitVec 64)))

(assert (=> d!94437 (= lt!314542 (select (content!285 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!390015 () Bool)

(assert (=> d!94437 (= lt!314542 e!390015)))

(declare-fun res!450339 () Bool)

(assert (=> d!94437 (=> (not res!450339) (not e!390015))))

(get-info :version)

(assert (=> d!94437 (= res!450339 ((_ is Cons!12926) acc!681))))

(assert (=> d!94437 (= (contains!3582 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!314542)))

(declare-fun b!684936 () Bool)

(declare-fun e!390014 () Bool)

(assert (=> b!684936 (= e!390015 e!390014)))

(declare-fun res!450340 () Bool)

(assert (=> b!684936 (=> res!450340 e!390014)))

(assert (=> b!684936 (= res!450340 (= (h!13974 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!684937 () Bool)

(assert (=> b!684937 (= e!390014 (contains!3582 (t!19168 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94437 res!450339) b!684936))

(assert (= (and b!684936 (not res!450340)) b!684937))

(declare-fun m!649729 () Bool)

(assert (=> d!94437 m!649729))

(declare-fun m!649731 () Bool)

(assert (=> d!94437 m!649731))

(declare-fun m!649733 () Bool)

(assert (=> b!684937 m!649733))

(assert (=> b!684788 d!94437))

(declare-fun d!94439 () Bool)

(declare-fun res!450345 () Bool)

(declare-fun e!390020 () Bool)

(assert (=> d!94439 (=> res!450345 e!390020)))

(assert (=> d!94439 (= res!450345 ((_ is Nil!12927) lt!314477))))

(assert (=> d!94439 (= (noDuplicate!856 lt!314477) e!390020)))

(declare-fun b!684942 () Bool)

(declare-fun e!390021 () Bool)

(assert (=> b!684942 (= e!390020 e!390021)))

(declare-fun res!450346 () Bool)

(assert (=> b!684942 (=> (not res!450346) (not e!390021))))

(assert (=> b!684942 (= res!450346 (not (contains!3582 (t!19168 lt!314477) (h!13974 lt!314477))))))

(declare-fun b!684943 () Bool)

(assert (=> b!684943 (= e!390021 (noDuplicate!856 (t!19168 lt!314477)))))

(assert (= (and d!94439 (not res!450345)) b!684942))

(assert (= (and b!684942 res!450346) b!684943))

(declare-fun m!649735 () Bool)

(assert (=> b!684942 m!649735))

(declare-fun m!649737 () Bool)

(assert (=> b!684943 m!649737))

(assert (=> b!684798 d!94439))

(declare-fun b!684964 () Bool)

(declare-fun e!390042 () Bool)

(declare-fun e!390041 () Bool)

(assert (=> b!684964 (= e!390042 e!390041)))

(declare-fun c!77669 () Bool)

(assert (=> b!684964 (= c!77669 (validKeyInArray!0 (select (arr!18982 a!3626) from!3004)))))

(declare-fun e!390040 () Bool)

(declare-fun b!684965 () Bool)

(assert (=> b!684965 (= e!390040 (contains!3582 acc!681 (select (arr!18982 a!3626) from!3004)))))

(declare-fun b!684966 () Bool)

(declare-fun call!34038 () Bool)

(assert (=> b!684966 (= e!390041 call!34038)))

(declare-fun b!684967 () Bool)

(assert (=> b!684967 (= e!390041 call!34038)))

(declare-fun d!94443 () Bool)

(declare-fun res!450365 () Bool)

(declare-fun e!390043 () Bool)

(assert (=> d!94443 (=> res!450365 e!390043)))

(assert (=> d!94443 (= res!450365 (bvsge from!3004 (size!19349 a!3626)))))

(assert (=> d!94443 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!390043)))

(declare-fun b!684968 () Bool)

(assert (=> b!684968 (= e!390043 e!390042)))

(declare-fun res!450364 () Bool)

(assert (=> b!684968 (=> (not res!450364) (not e!390042))))

(assert (=> b!684968 (= res!450364 (not e!390040))))

(declare-fun res!450363 () Bool)

(assert (=> b!684968 (=> (not res!450363) (not e!390040))))

(assert (=> b!684968 (= res!450363 (validKeyInArray!0 (select (arr!18982 a!3626) from!3004)))))

(declare-fun bm!34035 () Bool)

(assert (=> bm!34035 (= call!34038 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!77669 (Cons!12926 (select (arr!18982 a!3626) from!3004) acc!681) acc!681)))))

(assert (= (and d!94443 (not res!450365)) b!684968))

(assert (= (and b!684968 res!450363) b!684965))

(assert (= (and b!684968 res!450364) b!684964))

(assert (= (and b!684964 c!77669) b!684966))

(assert (= (and b!684964 (not c!77669)) b!684967))

(assert (= (or b!684966 b!684967) bm!34035))

(assert (=> b!684964 m!649581))

(assert (=> b!684964 m!649581))

(assert (=> b!684964 m!649615))

(assert (=> b!684965 m!649581))

(assert (=> b!684965 m!649581))

(declare-fun m!649745 () Bool)

(assert (=> b!684965 m!649745))

(assert (=> b!684968 m!649581))

(assert (=> b!684968 m!649581))

(assert (=> b!684968 m!649615))

(assert (=> bm!34035 m!649581))

(declare-fun m!649747 () Bool)

(assert (=> bm!34035 m!649747))

(assert (=> b!684778 d!94443))

(declare-fun b!684992 () Bool)

(declare-fun e!390062 () Bool)

(assert (=> b!684992 (= e!390062 (subseq!191 acc!681 (t!19168 lt!314477)))))

(declare-fun b!684990 () Bool)

(declare-fun e!390064 () Bool)

(assert (=> b!684990 (= e!390064 e!390062)))

(declare-fun res!450382 () Bool)

(assert (=> b!684990 (=> res!450382 e!390062)))

(declare-fun e!390063 () Bool)

(assert (=> b!684990 (= res!450382 e!390063)))

(declare-fun res!450384 () Bool)

(assert (=> b!684990 (=> (not res!450384) (not e!390063))))

(assert (=> b!684990 (= res!450384 (= (h!13974 acc!681) (h!13974 lt!314477)))))

(declare-fun d!94451 () Bool)

(declare-fun res!450385 () Bool)

(declare-fun e!390065 () Bool)

(assert (=> d!94451 (=> res!450385 e!390065)))

(assert (=> d!94451 (= res!450385 ((_ is Nil!12927) acc!681))))

(assert (=> d!94451 (= (subseq!191 acc!681 lt!314477) e!390065)))

(declare-fun b!684991 () Bool)

(assert (=> b!684991 (= e!390063 (subseq!191 (t!19168 acc!681) (t!19168 lt!314477)))))

(declare-fun b!684989 () Bool)

(assert (=> b!684989 (= e!390065 e!390064)))

(declare-fun res!450383 () Bool)

(assert (=> b!684989 (=> (not res!450383) (not e!390064))))

(assert (=> b!684989 (= res!450383 ((_ is Cons!12926) lt!314477))))

(assert (= (and d!94451 (not res!450385)) b!684989))

(assert (= (and b!684989 res!450383) b!684990))

(assert (= (and b!684990 res!450384) b!684991))

(assert (= (and b!684990 (not res!450382)) b!684992))

(declare-fun m!649755 () Bool)

(assert (=> b!684992 m!649755))

(declare-fun m!649757 () Bool)

(assert (=> b!684991 m!649757))

(assert (=> b!684780 d!94451))

(declare-fun b!684993 () Bool)

(declare-fun e!390068 () Bool)

(declare-fun e!390067 () Bool)

(assert (=> b!684993 (= e!390068 e!390067)))

(declare-fun c!77672 () Bool)

(assert (=> b!684993 (= c!77672 (validKeyInArray!0 (select (arr!18982 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!684994 () Bool)

(declare-fun e!390066 () Bool)

(assert (=> b!684994 (= e!390066 (contains!3582 Nil!12927 (select (arr!18982 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!684995 () Bool)

(declare-fun call!34041 () Bool)

(assert (=> b!684995 (= e!390067 call!34041)))

(declare-fun b!684996 () Bool)

(assert (=> b!684996 (= e!390067 call!34041)))

(declare-fun d!94457 () Bool)

(declare-fun res!450388 () Bool)

(declare-fun e!390069 () Bool)

(assert (=> d!94457 (=> res!450388 e!390069)))

(assert (=> d!94457 (= res!450388 (bvsge #b00000000000000000000000000000000 (size!19349 a!3626)))))

(assert (=> d!94457 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12927) e!390069)))

(declare-fun b!684997 () Bool)

(assert (=> b!684997 (= e!390069 e!390068)))

(declare-fun res!450387 () Bool)

(assert (=> b!684997 (=> (not res!450387) (not e!390068))))

(assert (=> b!684997 (= res!450387 (not e!390066))))

(declare-fun res!450386 () Bool)

(assert (=> b!684997 (=> (not res!450386) (not e!390066))))

(assert (=> b!684997 (= res!450386 (validKeyInArray!0 (select (arr!18982 a!3626) #b00000000000000000000000000000000)))))

(declare-fun bm!34038 () Bool)

(assert (=> bm!34038 (= call!34041 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!77672 (Cons!12926 (select (arr!18982 a!3626) #b00000000000000000000000000000000) Nil!12927) Nil!12927)))))

(assert (= (and d!94457 (not res!450388)) b!684997))

(assert (= (and b!684997 res!450386) b!684994))

(assert (= (and b!684997 res!450387) b!684993))

(assert (= (and b!684993 c!77672) b!684995))

(assert (= (and b!684993 (not c!77672)) b!684996))

(assert (= (or b!684995 b!684996) bm!34038))

(declare-fun m!649759 () Bool)

(assert (=> b!684993 m!649759))

(assert (=> b!684993 m!649759))

(declare-fun m!649761 () Bool)

(assert (=> b!684993 m!649761))

(assert (=> b!684994 m!649759))

(assert (=> b!684994 m!649759))

(declare-fun m!649763 () Bool)

(assert (=> b!684994 m!649763))

(assert (=> b!684997 m!649759))

(assert (=> b!684997 m!649759))

(assert (=> b!684997 m!649761))

(assert (=> bm!34038 m!649759))

(declare-fun m!649765 () Bool)

(assert (=> bm!34038 m!649765))

(assert (=> b!684790 d!94457))

(declare-fun d!94461 () Bool)

(declare-fun res!450389 () Bool)

(declare-fun e!390070 () Bool)

(assert (=> d!94461 (=> res!450389 e!390070)))

(assert (=> d!94461 (= res!450389 ((_ is Nil!12927) acc!681))))

(assert (=> d!94461 (= (noDuplicate!856 acc!681) e!390070)))

(declare-fun b!684998 () Bool)

(declare-fun e!390071 () Bool)

(assert (=> b!684998 (= e!390070 e!390071)))

(declare-fun res!450390 () Bool)

(assert (=> b!684998 (=> (not res!450390) (not e!390071))))

(assert (=> b!684998 (= res!450390 (not (contains!3582 (t!19168 acc!681) (h!13974 acc!681))))))

(declare-fun b!684999 () Bool)

(assert (=> b!684999 (= e!390071 (noDuplicate!856 (t!19168 acc!681)))))

(assert (= (and d!94461 (not res!450389)) b!684998))

(assert (= (and b!684998 res!450390) b!684999))

(declare-fun m!649767 () Bool)

(assert (=> b!684998 m!649767))

(declare-fun m!649769 () Bool)

(assert (=> b!684999 m!649769))

(assert (=> b!684779 d!94461))

(declare-fun d!94463 () Bool)

(declare-fun lt!314549 () Bool)

(assert (=> d!94463 (= lt!314549 (select (content!285 acc!681) k0!2843))))

(declare-fun e!390073 () Bool)

(assert (=> d!94463 (= lt!314549 e!390073)))

(declare-fun res!450391 () Bool)

(assert (=> d!94463 (=> (not res!450391) (not e!390073))))

(assert (=> d!94463 (= res!450391 ((_ is Cons!12926) acc!681))))

(assert (=> d!94463 (= (contains!3582 acc!681 k0!2843) lt!314549)))

(declare-fun b!685000 () Bool)

(declare-fun e!390072 () Bool)

(assert (=> b!685000 (= e!390073 e!390072)))

(declare-fun res!450392 () Bool)

(assert (=> b!685000 (=> res!450392 e!390072)))

(assert (=> b!685000 (= res!450392 (= (h!13974 acc!681) k0!2843))))

(declare-fun b!685001 () Bool)

(assert (=> b!685001 (= e!390072 (contains!3582 (t!19168 acc!681) k0!2843))))

(assert (= (and d!94463 res!450391) b!685000))

(assert (= (and b!685000 (not res!450392)) b!685001))

(assert (=> d!94463 m!649729))

(declare-fun m!649771 () Bool)

(assert (=> d!94463 m!649771))

(declare-fun m!649773 () Bool)

(assert (=> b!685001 m!649773))

(assert (=> b!684792 d!94463))

(declare-fun d!94465 () Bool)

(assert (=> d!94465 (= ($colon$colon!353 acc!681 (select (arr!18982 a!3626) from!3004)) (Cons!12926 (select (arr!18982 a!3626) from!3004) acc!681))))

(assert (=> b!684793 d!94465))

(declare-fun b!685010 () Bool)

(declare-fun e!390078 () Bool)

(assert (=> b!685010 (= e!390078 (subseq!191 acc!681 (t!19168 acc!681)))))

(declare-fun b!685008 () Bool)

(declare-fun e!390080 () Bool)

(assert (=> b!685008 (= e!390080 e!390078)))

(declare-fun res!450396 () Bool)

(assert (=> b!685008 (=> res!450396 e!390078)))

(declare-fun e!390079 () Bool)

(assert (=> b!685008 (= res!450396 e!390079)))

(declare-fun res!450398 () Bool)

(assert (=> b!685008 (=> (not res!450398) (not e!390079))))

(assert (=> b!685008 (= res!450398 (= (h!13974 acc!681) (h!13974 acc!681)))))

(declare-fun d!94467 () Bool)

(declare-fun res!450399 () Bool)

(declare-fun e!390081 () Bool)

(assert (=> d!94467 (=> res!450399 e!390081)))

(assert (=> d!94467 (= res!450399 ((_ is Nil!12927) acc!681))))

(assert (=> d!94467 (= (subseq!191 acc!681 acc!681) e!390081)))

(declare-fun b!685009 () Bool)

(assert (=> b!685009 (= e!390079 (subseq!191 (t!19168 acc!681) (t!19168 acc!681)))))

(declare-fun b!685007 () Bool)

(assert (=> b!685007 (= e!390081 e!390080)))

(declare-fun res!450397 () Bool)

(assert (=> b!685007 (=> (not res!450397) (not e!390080))))

(assert (=> b!685007 (= res!450397 ((_ is Cons!12926) acc!681))))

(assert (= (and d!94467 (not res!450399)) b!685007))

(assert (= (and b!685007 res!450397) b!685008))

(assert (= (and b!685008 res!450398) b!685009))

(assert (= (and b!685008 (not res!450396)) b!685010))

(declare-fun m!649783 () Bool)

(assert (=> b!685010 m!649783))

(declare-fun m!649785 () Bool)

(assert (=> b!685009 m!649785))

(assert (=> b!684793 d!94467))

(declare-fun d!94469 () Bool)

(assert (=> d!94469 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!314553 () Unit!24081)

(declare-fun choose!80 (array!39609 List!12930 List!12930 (_ BitVec 32)) Unit!24081)

(assert (=> d!94469 (= lt!314553 (choose!80 a!3626 ($colon$colon!353 acc!681 (select (arr!18982 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> d!94469 (bvslt (size!19349 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!94469 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!353 acc!681 (select (arr!18982 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)) lt!314553)))

(declare-fun bs!20094 () Bool)

(assert (= bs!20094 d!94469))

(assert (=> bs!20094 m!649579))

(assert (=> bs!20094 m!649583))

(declare-fun m!649791 () Bool)

(assert (=> bs!20094 m!649791))

(assert (=> b!684793 d!94469))

(declare-fun d!94475 () Bool)

(assert (=> d!94475 (subseq!191 acc!681 acc!681)))

(declare-fun lt!314556 () Unit!24081)

(declare-fun choose!36 (List!12930) Unit!24081)

(assert (=> d!94475 (= lt!314556 (choose!36 acc!681))))

(assert (=> d!94475 (= (lemmaListSubSeqRefl!0 acc!681) lt!314556)))

(declare-fun bs!20095 () Bool)

(assert (= bs!20095 d!94475))

(assert (=> bs!20095 m!649589))

(declare-fun m!649797 () Bool)

(assert (=> bs!20095 m!649797))

(assert (=> b!684793 d!94475))

(declare-fun b!685033 () Bool)

(declare-fun e!390106 () Bool)

(declare-fun e!390105 () Bool)

(assert (=> b!685033 (= e!390106 e!390105)))

(declare-fun c!77674 () Bool)

(assert (=> b!685033 (= c!77674 (validKeyInArray!0 (select (arr!18982 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!685034 () Bool)

(declare-fun e!390104 () Bool)

(assert (=> b!685034 (= e!390104 (contains!3582 acc!681 (select (arr!18982 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!685035 () Bool)

(declare-fun call!34043 () Bool)

(assert (=> b!685035 (= e!390105 call!34043)))

(declare-fun b!685036 () Bool)

(assert (=> b!685036 (= e!390105 call!34043)))

(declare-fun d!94479 () Bool)

(declare-fun res!450424 () Bool)

(declare-fun e!390107 () Bool)

(assert (=> d!94479 (=> res!450424 e!390107)))

(assert (=> d!94479 (= res!450424 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19349 a!3626)))))

(assert (=> d!94479 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681) e!390107)))

(declare-fun b!685037 () Bool)

(assert (=> b!685037 (= e!390107 e!390106)))

(declare-fun res!450423 () Bool)

(assert (=> b!685037 (=> (not res!450423) (not e!390106))))

(assert (=> b!685037 (= res!450423 (not e!390104))))

(declare-fun res!450422 () Bool)

(assert (=> b!685037 (=> (not res!450422) (not e!390104))))

(assert (=> b!685037 (= res!450422 (validKeyInArray!0 (select (arr!18982 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun bm!34040 () Bool)

(assert (=> bm!34040 (= call!34043 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!77674 (Cons!12926 (select (arr!18982 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) acc!681) acc!681)))))

(assert (= (and d!94479 (not res!450424)) b!685037))

(assert (= (and b!685037 res!450422) b!685034))

(assert (= (and b!685037 res!450423) b!685033))

(assert (= (and b!685033 c!77674) b!685035))

(assert (= (and b!685033 (not c!77674)) b!685036))

(assert (= (or b!685035 b!685036) bm!34040))

(declare-fun m!649803 () Bool)

(assert (=> b!685033 m!649803))

(assert (=> b!685033 m!649803))

(declare-fun m!649805 () Bool)

(assert (=> b!685033 m!649805))

(assert (=> b!685034 m!649803))

(assert (=> b!685034 m!649803))

(declare-fun m!649807 () Bool)

(assert (=> b!685034 m!649807))

(assert (=> b!685037 m!649803))

(assert (=> b!685037 m!649803))

(assert (=> b!685037 m!649805))

(assert (=> bm!34040 m!649803))

(declare-fun m!649809 () Bool)

(assert (=> bm!34040 m!649809))

(assert (=> b!684793 d!94479))

(declare-fun d!94483 () Bool)

(assert (=> d!94483 (= (validKeyInArray!0 k0!2843) (and (not (= k0!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!684782 d!94483))

(declare-fun d!94485 () Bool)

(assert (=> d!94485 (= (array_inv!14841 a!3626) (bvsge (size!19349 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!61062 d!94485))

(declare-fun d!94487 () Bool)

(assert (=> d!94487 (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))

(declare-fun lt!314564 () Unit!24081)

(declare-fun choose!13 (array!39609 (_ BitVec 64) (_ BitVec 32)) Unit!24081)

(assert (=> d!94487 (= lt!314564 (choose!13 a!3626 k0!2843 from!3004))))

(assert (=> d!94487 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!94487 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004) lt!314564)))

(declare-fun bs!20097 () Bool)

(assert (= bs!20097 d!94487))

(assert (=> bs!20097 m!649597))

(declare-fun m!649813 () Bool)

(assert (=> bs!20097 m!649813))

(assert (=> b!684784 d!94487))

(assert (=> b!684783 d!94463))

(declare-fun d!94491 () Bool)

(declare-fun lt!314565 () Bool)

(assert (=> d!94491 (= lt!314565 (select (content!285 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!390118 () Bool)

(assert (=> d!94491 (= lt!314565 e!390118)))

(declare-fun res!450429 () Bool)

(assert (=> d!94491 (=> (not res!450429) (not e!390118))))

(assert (=> d!94491 (= res!450429 ((_ is Cons!12926) acc!681))))

(assert (=> d!94491 (= (contains!3582 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!314565)))

(declare-fun b!685050 () Bool)

(declare-fun e!390117 () Bool)

(assert (=> b!685050 (= e!390118 e!390117)))

(declare-fun res!450430 () Bool)

(assert (=> b!685050 (=> res!450430 e!390117)))

(assert (=> b!685050 (= res!450430 (= (h!13974 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!685051 () Bool)

(assert (=> b!685051 (= e!390117 (contains!3582 (t!19168 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94491 res!450429) b!685050))

(assert (= (and b!685050 (not res!450430)) b!685051))

(assert (=> d!94491 m!649729))

(declare-fun m!649815 () Bool)

(assert (=> d!94491 m!649815))

(declare-fun m!649817 () Bool)

(assert (=> b!685051 m!649817))

(assert (=> b!684796 d!94491))

(declare-fun d!94493 () Bool)

(declare-fun res!450438 () Bool)

(declare-fun e!390128 () Bool)

(assert (=> d!94493 (=> res!450438 e!390128)))

(assert (=> d!94493 (= res!450438 (= (select (arr!18982 a!3626) #b00000000000000000000000000000000) k0!2843))))

(assert (=> d!94493 (= (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000) e!390128)))

(declare-fun b!685063 () Bool)

(declare-fun e!390129 () Bool)

(assert (=> b!685063 (= e!390128 e!390129)))

(declare-fun res!450439 () Bool)

(assert (=> b!685063 (=> (not res!450439) (not e!390129))))

(assert (=> b!685063 (= res!450439 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19349 a!3626)))))

(declare-fun b!685064 () Bool)

(assert (=> b!685064 (= e!390129 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!94493 (not res!450438)) b!685063))

(assert (= (and b!685063 res!450439) b!685064))

(assert (=> d!94493 m!649759))

(declare-fun m!649833 () Bool)

(assert (=> b!685064 m!649833))

(assert (=> b!684785 d!94493))

(assert (=> b!684795 d!94463))

(assert (=> b!684786 d!94467))

(declare-fun d!94499 () Bool)

(declare-fun res!450440 () Bool)

(declare-fun e!390130 () Bool)

(assert (=> d!94499 (=> res!450440 e!390130)))

(assert (=> d!94499 (= res!450440 (= (select (arr!18982 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k0!2843))))

(assert (=> d!94499 (= (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!390130)))

(declare-fun b!685065 () Bool)

(declare-fun e!390131 () Bool)

(assert (=> b!685065 (= e!390130 e!390131)))

(declare-fun res!450441 () Bool)

(assert (=> b!685065 (=> (not res!450441) (not e!390131))))

(assert (=> b!685065 (= res!450441 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19349 a!3626)))))

(declare-fun b!685066 () Bool)

(assert (=> b!685066 (= e!390131 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94499 (not res!450440)) b!685065))

(assert (= (and b!685065 res!450441) b!685066))

(assert (=> d!94499 m!649803))

(declare-fun m!649835 () Bool)

(assert (=> b!685066 m!649835))

(assert (=> b!684786 d!94499))

(declare-fun d!94501 () Bool)

(assert (=> d!94501 (= (-!155 ($colon$colon!353 acc!681 k0!2843) k0!2843) acc!681)))

(declare-fun lt!314572 () Unit!24081)

(declare-fun choose!16 ((_ BitVec 64) List!12930) Unit!24081)

(assert (=> d!94501 (= lt!314572 (choose!16 k0!2843 acc!681))))

(assert (=> d!94501 (not (contains!3582 acc!681 k0!2843))))

(assert (=> d!94501 (= (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681) lt!314572)))

(declare-fun bs!20099 () Bool)

(assert (= bs!20099 d!94501))

(assert (=> bs!20099 m!649613))

(assert (=> bs!20099 m!649613))

(declare-fun m!649841 () Bool)

(assert (=> bs!20099 m!649841))

(declare-fun m!649843 () Bool)

(assert (=> bs!20099 m!649843))

(assert (=> bs!20099 m!649591))

(assert (=> b!684786 d!94501))

(declare-fun lt!314581 () List!12930)

(declare-fun b!685105 () Bool)

(declare-fun e!390165 () Bool)

(assert (=> b!685105 (= e!390165 (= (content!285 lt!314581) ((_ map and) (content!285 lt!314477) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2843 true)))))))

(declare-fun b!685106 () Bool)

(declare-fun e!390164 () List!12930)

(declare-fun e!390163 () List!12930)

(assert (=> b!685106 (= e!390164 e!390163)))

(declare-fun c!77689 () Bool)

(assert (=> b!685106 (= c!77689 (= k0!2843 (h!13974 lt!314477)))))

(declare-fun d!94505 () Bool)

(assert (=> d!94505 e!390165))

(declare-fun res!450464 () Bool)

(assert (=> d!94505 (=> (not res!450464) (not e!390165))))

(declare-fun size!19353 (List!12930) Int)

(assert (=> d!94505 (= res!450464 (<= (size!19353 lt!314581) (size!19353 lt!314477)))))

(assert (=> d!94505 (= lt!314581 e!390164)))

(declare-fun c!77690 () Bool)

(assert (=> d!94505 (= c!77690 ((_ is Cons!12926) lt!314477))))

(assert (=> d!94505 (= (-!155 lt!314477 k0!2843) lt!314581)))

(declare-fun b!685107 () Bool)

(assert (=> b!685107 (= e!390164 Nil!12927)))

(declare-fun bm!34050 () Bool)

(declare-fun call!34053 () List!12930)

(assert (=> bm!34050 (= call!34053 (-!155 (t!19168 lt!314477) k0!2843))))

(declare-fun b!685108 () Bool)

(assert (=> b!685108 (= e!390163 call!34053)))

(declare-fun b!685109 () Bool)

(assert (=> b!685109 (= e!390163 (Cons!12926 (h!13974 lt!314477) call!34053))))

(assert (= (and d!94505 c!77690) b!685106))

(assert (= (and d!94505 (not c!77690)) b!685107))

(assert (= (and b!685106 c!77689) b!685108))

(assert (= (and b!685106 (not c!77689)) b!685109))

(assert (= (or b!685108 b!685109) bm!34050))

(assert (= (and d!94505 res!450464) b!685105))

(declare-fun m!649865 () Bool)

(assert (=> b!685105 m!649865))

(declare-fun m!649869 () Bool)

(assert (=> b!685105 m!649869))

(declare-fun m!649871 () Bool)

(assert (=> b!685105 m!649871))

(declare-fun m!649873 () Bool)

(assert (=> d!94505 m!649873))

(declare-fun m!649877 () Bool)

(assert (=> d!94505 m!649877))

(declare-fun m!649879 () Bool)

(assert (=> bm!34050 m!649879))

(assert (=> b!684786 d!94505))

(declare-fun d!94521 () Bool)

(declare-fun res!450471 () Bool)

(declare-fun e!390172 () Bool)

(assert (=> d!94521 (=> res!450471 e!390172)))

(assert (=> d!94521 (= res!450471 (= (select (arr!18982 (array!39610 (store (arr!18982 a!3626) i!1382 k0!2843) (size!19349 a!3626))) from!3004) k0!2843))))

(assert (=> d!94521 (= (arrayContainsKey!0 (array!39610 (store (arr!18982 a!3626) i!1382 k0!2843) (size!19349 a!3626)) k0!2843 from!3004) e!390172)))

(declare-fun b!685116 () Bool)

(declare-fun e!390173 () Bool)

(assert (=> b!685116 (= e!390172 e!390173)))

(declare-fun res!450472 () Bool)

(assert (=> b!685116 (=> (not res!450472) (not e!390173))))

(assert (=> b!685116 (= res!450472 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19349 (array!39610 (store (arr!18982 a!3626) i!1382 k0!2843) (size!19349 a!3626)))))))

(declare-fun b!685117 () Bool)

(assert (=> b!685117 (= e!390173 (arrayContainsKey!0 (array!39610 (store (arr!18982 a!3626) i!1382 k0!2843) (size!19349 a!3626)) k0!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94521 (not res!450471)) b!685116))

(assert (= (and b!685116 res!450472) b!685117))

(declare-fun m!649889 () Bool)

(assert (=> d!94521 m!649889))

(declare-fun m!649891 () Bool)

(assert (=> b!685117 m!649891))

(assert (=> b!684786 d!94521))

(assert (=> b!684786 d!94475))

(declare-fun d!94527 () Bool)

(assert (=> d!94527 (= (validKeyInArray!0 (select (arr!18982 a!3626) from!3004)) (and (not (= (select (arr!18982 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18982 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!684786 d!94527))

(declare-fun d!94529 () Bool)

(assert (=> d!94529 (= ($colon$colon!353 acc!681 k0!2843) (Cons!12926 k0!2843 acc!681))))

(assert (=> b!684786 d!94529))

(assert (=> b!684786 d!94479))

(check-sat (not b!685066) (not b!685034) (not d!94437) (not b!685001) (not b!684999) (not bm!34038) (not bm!34035) (not d!94469) (not b!684994) (not b!685117) (not b!684965) (not b!684993) (not b!684942) (not b!685037) (not d!94505) (not b!685033) (not d!94463) (not b!684998) (not b!684937) (not d!94491) (not d!94487) (not d!94475) (not b!685010) (not b!685064) (not bm!34040) (not b!684991) (not b!684992) (not b!684943) (not b!685051) (not bm!34050) (not b!685105) (not b!684968) (not b!685009) (not b!684964) (not b!684997) (not d!94501))
(check-sat)
