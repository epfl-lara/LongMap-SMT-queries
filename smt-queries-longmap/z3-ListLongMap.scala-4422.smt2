; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61236 () Bool)

(assert start!61236)

(declare-fun b!685906 () Bool)

(declare-fun res!451097 () Bool)

(declare-fun e!390626 () Bool)

(assert (=> b!685906 (=> res!451097 e!390626)))

(declare-datatypes ((List!12939 0))(
  ( (Nil!12936) (Cons!12935 (h!13983 (_ BitVec 64)) (t!19183 List!12939)) )
))
(declare-fun lt!314859 () List!12939)

(declare-fun noDuplicate!865 (List!12939) Bool)

(assert (=> b!685906 (= res!451097 (not (noDuplicate!865 lt!314859)))))

(declare-fun b!685907 () Bool)

(declare-fun res!451101 () Bool)

(assert (=> b!685907 (=> res!451101 e!390626)))

(declare-fun acc!681 () List!12939)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3591 (List!12939 (_ BitVec 64)) Bool)

(assert (=> b!685907 (= res!451101 (contains!3591 acc!681 k0!2843))))

(declare-fun b!685908 () Bool)

(declare-datatypes ((Unit!24126 0))(
  ( (Unit!24127) )
))
(declare-fun e!390629 () Unit!24126)

(declare-fun Unit!24128 () Unit!24126)

(assert (=> b!685908 (= e!390629 Unit!24128)))

(declare-fun b!685909 () Bool)

(declare-fun e!390622 () Bool)

(assert (=> b!685909 (= e!390622 (not e!390626))))

(declare-fun res!451107 () Bool)

(assert (=> b!685909 (=> res!451107 e!390626)))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!685909 (= res!451107 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!164 (List!12939 (_ BitVec 64)) List!12939)

(assert (=> b!685909 (= (-!164 lt!314859 k0!2843) acc!681)))

(declare-fun $colon$colon!362 (List!12939 (_ BitVec 64)) List!12939)

(assert (=> b!685909 (= lt!314859 ($colon$colon!362 acc!681 k0!2843))))

(declare-fun lt!314855 () Unit!24126)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12939) Unit!24126)

(assert (=> b!685909 (= lt!314855 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(declare-fun subseq!200 (List!12939 List!12939) Bool)

(assert (=> b!685909 (subseq!200 acc!681 acc!681)))

(declare-fun lt!314852 () Unit!24126)

(declare-fun lemmaListSubSeqRefl!0 (List!12939) Unit!24126)

(assert (=> b!685909 (= lt!314852 (lemmaListSubSeqRefl!0 acc!681))))

(declare-datatypes ((array!39633 0))(
  ( (array!39634 (arr!18991 (Array (_ BitVec 32) (_ BitVec 64))) (size!19363 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39633)

(declare-fun arrayNoDuplicates!0 (array!39633 (_ BitVec 32) List!12939) Bool)

(assert (=> b!685909 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!314856 () Unit!24126)

(declare-fun e!390630 () Unit!24126)

(assert (=> b!685909 (= lt!314856 e!390630)))

(declare-fun c!77774 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!685909 (= c!77774 (validKeyInArray!0 (select (arr!18991 a!3626) from!3004)))))

(declare-fun lt!314854 () Unit!24126)

(assert (=> b!685909 (= lt!314854 e!390629)))

(declare-fun c!77773 () Bool)

(declare-fun lt!314858 () Bool)

(assert (=> b!685909 (= c!77773 lt!314858)))

(declare-fun arrayContainsKey!0 (array!39633 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!685909 (= lt!314858 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!685909 (arrayContainsKey!0 (array!39634 (store (arr!18991 a!3626) i!1382 k0!2843) (size!19363 a!3626)) k0!2843 from!3004)))

(declare-fun b!685910 () Bool)

(declare-fun res!451100 () Bool)

(assert (=> b!685910 (=> res!451100 e!390626)))

(assert (=> b!685910 (= res!451100 (not (subseq!200 acc!681 lt!314859)))))

(declare-fun b!685911 () Bool)

(declare-fun res!451112 () Bool)

(assert (=> b!685911 (=> (not res!451112) (not e!390622))))

(declare-fun e!390625 () Bool)

(assert (=> b!685911 (= res!451112 e!390625)))

(declare-fun res!451114 () Bool)

(assert (=> b!685911 (=> res!451114 e!390625)))

(declare-fun e!390627 () Bool)

(assert (=> b!685911 (= res!451114 e!390627)))

(declare-fun res!451110 () Bool)

(assert (=> b!685911 (=> (not res!451110) (not e!390627))))

(assert (=> b!685911 (= res!451110 (bvsgt from!3004 i!1382))))

(declare-fun b!685912 () Bool)

(declare-fun Unit!24129 () Unit!24126)

(assert (=> b!685912 (= e!390629 Unit!24129)))

(declare-fun lt!314860 () Unit!24126)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39633 (_ BitVec 64) (_ BitVec 32)) Unit!24126)

(assert (=> b!685912 (= lt!314860 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!685912 false))

(declare-fun b!685913 () Bool)

(declare-fun e!390628 () Bool)

(assert (=> b!685913 (= e!390626 e!390628)))

(declare-fun res!451105 () Bool)

(assert (=> b!685913 (=> (not res!451105) (not e!390628))))

(assert (=> b!685913 (= res!451105 (not (contains!3591 lt!314859 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!685914 () Bool)

(declare-fun res!451103 () Bool)

(assert (=> b!685914 (=> (not res!451103) (not e!390622))))

(assert (=> b!685914 (= res!451103 (validKeyInArray!0 k0!2843))))

(declare-fun res!451109 () Bool)

(assert (=> start!61236 (=> (not res!451109) (not e!390622))))

(assert (=> start!61236 (= res!451109 (and (bvslt (size!19363 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19363 a!3626))))))

(assert (=> start!61236 e!390622))

(assert (=> start!61236 true))

(declare-fun array_inv!14850 (array!39633) Bool)

(assert (=> start!61236 (array_inv!14850 a!3626)))

(declare-fun b!685915 () Bool)

(declare-fun res!451113 () Bool)

(assert (=> b!685915 (=> (not res!451113) (not e!390622))))

(assert (=> b!685915 (= res!451113 (not (contains!3591 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!685916 () Bool)

(declare-fun Unit!24130 () Unit!24126)

(assert (=> b!685916 (= e!390630 Unit!24130)))

(declare-fun b!685917 () Bool)

(declare-fun res!451099 () Bool)

(assert (=> b!685917 (=> (not res!451099) (not e!390622))))

(assert (=> b!685917 (= res!451099 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!685918 () Bool)

(declare-fun e!390624 () Bool)

(assert (=> b!685918 (= e!390625 e!390624)))

(declare-fun res!451108 () Bool)

(assert (=> b!685918 (=> (not res!451108) (not e!390624))))

(assert (=> b!685918 (= res!451108 (bvsle from!3004 i!1382))))

(declare-fun b!685919 () Bool)

(declare-fun res!451104 () Bool)

(assert (=> b!685919 (=> (not res!451104) (not e!390622))))

(assert (=> b!685919 (= res!451104 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19363 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!685920 () Bool)

(declare-fun res!451106 () Bool)

(assert (=> b!685920 (=> res!451106 e!390626)))

(assert (=> b!685920 (= res!451106 (not (contains!3591 lt!314859 k0!2843)))))

(declare-fun b!685921 () Bool)

(assert (=> b!685921 (= e!390628 (not (contains!3591 lt!314859 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!685922 () Bool)

(declare-fun lt!314857 () Unit!24126)

(assert (=> b!685922 (= e!390630 lt!314857)))

(declare-fun lt!314853 () Unit!24126)

(assert (=> b!685922 (= lt!314853 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!685922 (subseq!200 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39633 List!12939 List!12939 (_ BitVec 32)) Unit!24126)

(assert (=> b!685922 (= lt!314857 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!362 acc!681 (select (arr!18991 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!685922 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!685923 () Bool)

(assert (=> b!685923 (= e!390627 (contains!3591 acc!681 k0!2843))))

(declare-fun b!685924 () Bool)

(declare-fun res!451102 () Bool)

(assert (=> b!685924 (=> (not res!451102) (not e!390622))))

(assert (=> b!685924 (= res!451102 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!685925 () Bool)

(declare-fun res!451115 () Bool)

(assert (=> b!685925 (=> (not res!451115) (not e!390622))))

(assert (=> b!685925 (= res!451115 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12936))))

(declare-fun b!685926 () Bool)

(declare-fun res!451117 () Bool)

(assert (=> b!685926 (=> (not res!451117) (not e!390622))))

(assert (=> b!685926 (= res!451117 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19363 a!3626))))))

(declare-fun b!685927 () Bool)

(declare-fun res!451116 () Bool)

(assert (=> b!685927 (=> (not res!451116) (not e!390622))))

(assert (=> b!685927 (= res!451116 (not (contains!3591 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!685928 () Bool)

(declare-fun res!451098 () Bool)

(assert (=> b!685928 (=> res!451098 e!390626)))

(assert (=> b!685928 (= res!451098 lt!314858)))

(declare-fun b!685929 () Bool)

(assert (=> b!685929 (= e!390624 (not (contains!3591 acc!681 k0!2843)))))

(declare-fun b!685930 () Bool)

(declare-fun res!451111 () Bool)

(assert (=> b!685930 (=> (not res!451111) (not e!390622))))

(assert (=> b!685930 (= res!451111 (noDuplicate!865 acc!681))))

(assert (= (and start!61236 res!451109) b!685930))

(assert (= (and b!685930 res!451111) b!685915))

(assert (= (and b!685915 res!451113) b!685927))

(assert (= (and b!685927 res!451116) b!685911))

(assert (= (and b!685911 res!451110) b!685923))

(assert (= (and b!685911 (not res!451114)) b!685918))

(assert (= (and b!685918 res!451108) b!685929))

(assert (= (and b!685911 res!451112) b!685925))

(assert (= (and b!685925 res!451115) b!685924))

(assert (= (and b!685924 res!451102) b!685926))

(assert (= (and b!685926 res!451117) b!685914))

(assert (= (and b!685914 res!451103) b!685917))

(assert (= (and b!685917 res!451099) b!685919))

(assert (= (and b!685919 res!451104) b!685909))

(assert (= (and b!685909 c!77773) b!685912))

(assert (= (and b!685909 (not c!77773)) b!685908))

(assert (= (and b!685909 c!77774) b!685922))

(assert (= (and b!685909 (not c!77774)) b!685916))

(assert (= (and b!685909 (not res!451107)) b!685906))

(assert (= (and b!685906 (not res!451097)) b!685928))

(assert (= (and b!685928 (not res!451098)) b!685907))

(assert (= (and b!685907 (not res!451101)) b!685910))

(assert (= (and b!685910 (not res!451100)) b!685920))

(assert (= (and b!685920 (not res!451106)) b!685913))

(assert (= (and b!685913 res!451105) b!685921))

(declare-fun m!650533 () Bool)

(assert (=> b!685909 m!650533))

(declare-fun m!650535 () Bool)

(assert (=> b!685909 m!650535))

(declare-fun m!650537 () Bool)

(assert (=> b!685909 m!650537))

(declare-fun m!650539 () Bool)

(assert (=> b!685909 m!650539))

(declare-fun m!650541 () Bool)

(assert (=> b!685909 m!650541))

(declare-fun m!650543 () Bool)

(assert (=> b!685909 m!650543))

(declare-fun m!650545 () Bool)

(assert (=> b!685909 m!650545))

(assert (=> b!685909 m!650535))

(declare-fun m!650547 () Bool)

(assert (=> b!685909 m!650547))

(declare-fun m!650549 () Bool)

(assert (=> b!685909 m!650549))

(declare-fun m!650551 () Bool)

(assert (=> b!685909 m!650551))

(declare-fun m!650553 () Bool)

(assert (=> b!685909 m!650553))

(declare-fun m!650555 () Bool)

(assert (=> b!685907 m!650555))

(declare-fun m!650557 () Bool)

(assert (=> b!685915 m!650557))

(assert (=> b!685923 m!650555))

(declare-fun m!650559 () Bool)

(assert (=> b!685914 m!650559))

(declare-fun m!650561 () Bool)

(assert (=> b!685930 m!650561))

(declare-fun m!650563 () Bool)

(assert (=> b!685921 m!650563))

(assert (=> b!685929 m!650555))

(declare-fun m!650565 () Bool)

(assert (=> b!685913 m!650565))

(assert (=> b!685922 m!650533))

(assert (=> b!685922 m!650535))

(declare-fun m!650567 () Bool)

(assert (=> b!685922 m!650567))

(declare-fun m!650569 () Bool)

(assert (=> b!685922 m!650569))

(assert (=> b!685922 m!650535))

(assert (=> b!685922 m!650567))

(assert (=> b!685922 m!650541))

(assert (=> b!685922 m!650553))

(declare-fun m!650571 () Bool)

(assert (=> b!685917 m!650571))

(declare-fun m!650573 () Bool)

(assert (=> b!685925 m!650573))

(declare-fun m!650575 () Bool)

(assert (=> b!685910 m!650575))

(declare-fun m!650577 () Bool)

(assert (=> b!685906 m!650577))

(declare-fun m!650579 () Bool)

(assert (=> b!685927 m!650579))

(declare-fun m!650581 () Bool)

(assert (=> b!685924 m!650581))

(declare-fun m!650583 () Bool)

(assert (=> start!61236 m!650583))

(declare-fun m!650585 () Bool)

(assert (=> b!685920 m!650585))

(declare-fun m!650587 () Bool)

(assert (=> b!685912 m!650587))

(check-sat (not b!685921) (not start!61236) (not b!685923) (not b!685914) (not b!685915) (not b!685907) (not b!685906) (not b!685922) (not b!685909) (not b!685912) (not b!685924) (not b!685927) (not b!685920) (not b!685913) (not b!685925) (not b!685929) (not b!685930) (not b!685910) (not b!685917))
(check-sat)
(get-model)

(declare-fun d!94725 () Bool)

(declare-fun lt!314917 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!291 (List!12939) (InoxSet (_ BitVec 64)))

(assert (=> d!94725 (= lt!314917 (select (content!291 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!390690 () Bool)

(assert (=> d!94725 (= lt!314917 e!390690)))

(declare-fun res!451248 () Bool)

(assert (=> d!94725 (=> (not res!451248) (not e!390690))))

(get-info :version)

(assert (=> d!94725 (= res!451248 ((_ is Cons!12935) acc!681))))

(assert (=> d!94725 (= (contains!3591 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!314917)))

(declare-fun b!686085 () Bool)

(declare-fun e!390689 () Bool)

(assert (=> b!686085 (= e!390690 e!390689)))

(declare-fun res!451249 () Bool)

(assert (=> b!686085 (=> res!451249 e!390689)))

(assert (=> b!686085 (= res!451249 (= (h!13983 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!686086 () Bool)

(assert (=> b!686086 (= e!390689 (contains!3591 (t!19183 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94725 res!451248) b!686085))

(assert (= (and b!686085 (not res!451249)) b!686086))

(declare-fun m!650701 () Bool)

(assert (=> d!94725 m!650701))

(declare-fun m!650703 () Bool)

(assert (=> d!94725 m!650703))

(declare-fun m!650705 () Bool)

(assert (=> b!686086 m!650705))

(assert (=> b!685927 d!94725))

(declare-fun d!94727 () Bool)

(declare-fun res!451254 () Bool)

(declare-fun e!390695 () Bool)

(assert (=> d!94727 (=> res!451254 e!390695)))

(assert (=> d!94727 (= res!451254 ((_ is Nil!12936) lt!314859))))

(assert (=> d!94727 (= (noDuplicate!865 lt!314859) e!390695)))

(declare-fun b!686091 () Bool)

(declare-fun e!390696 () Bool)

(assert (=> b!686091 (= e!390695 e!390696)))

(declare-fun res!451255 () Bool)

(assert (=> b!686091 (=> (not res!451255) (not e!390696))))

(assert (=> b!686091 (= res!451255 (not (contains!3591 (t!19183 lt!314859) (h!13983 lt!314859))))))

(declare-fun b!686092 () Bool)

(assert (=> b!686092 (= e!390696 (noDuplicate!865 (t!19183 lt!314859)))))

(assert (= (and d!94727 (not res!451254)) b!686091))

(assert (= (and b!686091 res!451255) b!686092))

(declare-fun m!650707 () Bool)

(assert (=> b!686091 m!650707))

(declare-fun m!650709 () Bool)

(assert (=> b!686092 m!650709))

(assert (=> b!685906 d!94727))

(declare-fun d!94729 () Bool)

(declare-fun lt!314918 () Bool)

(assert (=> d!94729 (= lt!314918 (select (content!291 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!390698 () Bool)

(assert (=> d!94729 (= lt!314918 e!390698)))

(declare-fun res!451256 () Bool)

(assert (=> d!94729 (=> (not res!451256) (not e!390698))))

(assert (=> d!94729 (= res!451256 ((_ is Cons!12935) acc!681))))

(assert (=> d!94729 (= (contains!3591 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!314918)))

(declare-fun b!686093 () Bool)

(declare-fun e!390697 () Bool)

(assert (=> b!686093 (= e!390698 e!390697)))

(declare-fun res!451257 () Bool)

(assert (=> b!686093 (=> res!451257 e!390697)))

(assert (=> b!686093 (= res!451257 (= (h!13983 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!686094 () Bool)

(assert (=> b!686094 (= e!390697 (contains!3591 (t!19183 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94729 res!451256) b!686093))

(assert (= (and b!686093 (not res!451257)) b!686094))

(assert (=> d!94729 m!650701))

(declare-fun m!650711 () Bool)

(assert (=> d!94729 m!650711))

(declare-fun m!650713 () Bool)

(assert (=> b!686094 m!650713))

(assert (=> b!685915 d!94729))

(declare-fun b!686105 () Bool)

(declare-fun e!390710 () Bool)

(declare-fun e!390707 () Bool)

(assert (=> b!686105 (= e!390710 e!390707)))

(declare-fun c!77789 () Bool)

(assert (=> b!686105 (= c!77789 (validKeyInArray!0 (select (arr!18991 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!686106 () Bool)

(declare-fun e!390709 () Bool)

(assert (=> b!686106 (= e!390709 e!390710)))

(declare-fun res!451264 () Bool)

(assert (=> b!686106 (=> (not res!451264) (not e!390710))))

(declare-fun e!390708 () Bool)

(assert (=> b!686106 (= res!451264 (not e!390708))))

(declare-fun res!451265 () Bool)

(assert (=> b!686106 (=> (not res!451265) (not e!390708))))

(assert (=> b!686106 (= res!451265 (validKeyInArray!0 (select (arr!18991 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!686107 () Bool)

(declare-fun call!34086 () Bool)

(assert (=> b!686107 (= e!390707 call!34086)))

(declare-fun b!686108 () Bool)

(assert (=> b!686108 (= e!390708 (contains!3591 Nil!12936 (select (arr!18991 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!686109 () Bool)

(assert (=> b!686109 (= e!390707 call!34086)))

(declare-fun d!94731 () Bool)

(declare-fun res!451266 () Bool)

(assert (=> d!94731 (=> res!451266 e!390709)))

(assert (=> d!94731 (= res!451266 (bvsge #b00000000000000000000000000000000 (size!19363 a!3626)))))

(assert (=> d!94731 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12936) e!390709)))

(declare-fun bm!34083 () Bool)

(assert (=> bm!34083 (= call!34086 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!77789 (Cons!12935 (select (arr!18991 a!3626) #b00000000000000000000000000000000) Nil!12936) Nil!12936)))))

(assert (= (and d!94731 (not res!451266)) b!686106))

(assert (= (and b!686106 res!451265) b!686108))

(assert (= (and b!686106 res!451264) b!686105))

(assert (= (and b!686105 c!77789) b!686107))

(assert (= (and b!686105 (not c!77789)) b!686109))

(assert (= (or b!686107 b!686109) bm!34083))

(declare-fun m!650715 () Bool)

(assert (=> b!686105 m!650715))

(assert (=> b!686105 m!650715))

(declare-fun m!650717 () Bool)

(assert (=> b!686105 m!650717))

(assert (=> b!686106 m!650715))

(assert (=> b!686106 m!650715))

(assert (=> b!686106 m!650717))

(assert (=> b!686108 m!650715))

(assert (=> b!686108 m!650715))

(declare-fun m!650719 () Bool)

(assert (=> b!686108 m!650719))

(assert (=> bm!34083 m!650715))

(declare-fun m!650721 () Bool)

(assert (=> bm!34083 m!650721))

(assert (=> b!685925 d!94731))

(declare-fun d!94733 () Bool)

(assert (=> d!94733 (= (validKeyInArray!0 k0!2843) (and (not (= k0!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!685914 d!94733))

(declare-fun d!94735 () Bool)

(declare-fun lt!314919 () Bool)

(assert (=> d!94735 (= lt!314919 (select (content!291 lt!314859) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!390712 () Bool)

(assert (=> d!94735 (= lt!314919 e!390712)))

(declare-fun res!451267 () Bool)

(assert (=> d!94735 (=> (not res!451267) (not e!390712))))

(assert (=> d!94735 (= res!451267 ((_ is Cons!12935) lt!314859))))

(assert (=> d!94735 (= (contains!3591 lt!314859 #b0000000000000000000000000000000000000000000000000000000000000000) lt!314919)))

(declare-fun b!686110 () Bool)

(declare-fun e!390711 () Bool)

(assert (=> b!686110 (= e!390712 e!390711)))

(declare-fun res!451268 () Bool)

(assert (=> b!686110 (=> res!451268 e!390711)))

(assert (=> b!686110 (= res!451268 (= (h!13983 lt!314859) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!686111 () Bool)

(assert (=> b!686111 (= e!390711 (contains!3591 (t!19183 lt!314859) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94735 res!451267) b!686110))

(assert (= (and b!686110 (not res!451268)) b!686111))

(declare-fun m!650723 () Bool)

(assert (=> d!94735 m!650723))

(declare-fun m!650725 () Bool)

(assert (=> d!94735 m!650725))

(declare-fun m!650727 () Bool)

(assert (=> b!686111 m!650727))

(assert (=> b!685913 d!94735))

(declare-fun b!686112 () Bool)

(declare-fun e!390716 () Bool)

(declare-fun e!390713 () Bool)

(assert (=> b!686112 (= e!390716 e!390713)))

(declare-fun c!77790 () Bool)

(assert (=> b!686112 (= c!77790 (validKeyInArray!0 (select (arr!18991 a!3626) from!3004)))))

(declare-fun b!686113 () Bool)

(declare-fun e!390715 () Bool)

(assert (=> b!686113 (= e!390715 e!390716)))

(declare-fun res!451269 () Bool)

(assert (=> b!686113 (=> (not res!451269) (not e!390716))))

(declare-fun e!390714 () Bool)

(assert (=> b!686113 (= res!451269 (not e!390714))))

(declare-fun res!451270 () Bool)

(assert (=> b!686113 (=> (not res!451270) (not e!390714))))

(assert (=> b!686113 (= res!451270 (validKeyInArray!0 (select (arr!18991 a!3626) from!3004)))))

(declare-fun b!686114 () Bool)

(declare-fun call!34087 () Bool)

(assert (=> b!686114 (= e!390713 call!34087)))

(declare-fun b!686115 () Bool)

(assert (=> b!686115 (= e!390714 (contains!3591 acc!681 (select (arr!18991 a!3626) from!3004)))))

(declare-fun b!686116 () Bool)

(assert (=> b!686116 (= e!390713 call!34087)))

(declare-fun d!94737 () Bool)

(declare-fun res!451271 () Bool)

(assert (=> d!94737 (=> res!451271 e!390715)))

(assert (=> d!94737 (= res!451271 (bvsge from!3004 (size!19363 a!3626)))))

(assert (=> d!94737 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!390715)))

(declare-fun bm!34084 () Bool)

(assert (=> bm!34084 (= call!34087 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!77790 (Cons!12935 (select (arr!18991 a!3626) from!3004) acc!681) acc!681)))))

(assert (= (and d!94737 (not res!451271)) b!686113))

(assert (= (and b!686113 res!451270) b!686115))

(assert (= (and b!686113 res!451269) b!686112))

(assert (= (and b!686112 c!77790) b!686114))

(assert (= (and b!686112 (not c!77790)) b!686116))

(assert (= (or b!686114 b!686116) bm!34084))

(assert (=> b!686112 m!650535))

(assert (=> b!686112 m!650535))

(assert (=> b!686112 m!650547))

(assert (=> b!686113 m!650535))

(assert (=> b!686113 m!650535))

(assert (=> b!686113 m!650547))

(assert (=> b!686115 m!650535))

(assert (=> b!686115 m!650535))

(declare-fun m!650729 () Bool)

(assert (=> b!686115 m!650729))

(assert (=> bm!34084 m!650535))

(declare-fun m!650731 () Bool)

(assert (=> bm!34084 m!650731))

(assert (=> b!685924 d!94737))

(declare-fun d!94739 () Bool)

(assert (=> d!94739 (= (array_inv!14850 a!3626) (bvsge (size!19363 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!61236 d!94739))

(declare-fun d!94741 () Bool)

(declare-fun lt!314920 () Bool)

(assert (=> d!94741 (= lt!314920 (select (content!291 acc!681) k0!2843))))

(declare-fun e!390718 () Bool)

(assert (=> d!94741 (= lt!314920 e!390718)))

(declare-fun res!451272 () Bool)

(assert (=> d!94741 (=> (not res!451272) (not e!390718))))

(assert (=> d!94741 (= res!451272 ((_ is Cons!12935) acc!681))))

(assert (=> d!94741 (= (contains!3591 acc!681 k0!2843) lt!314920)))

(declare-fun b!686117 () Bool)

(declare-fun e!390717 () Bool)

(assert (=> b!686117 (= e!390718 e!390717)))

(declare-fun res!451273 () Bool)

(assert (=> b!686117 (=> res!451273 e!390717)))

(assert (=> b!686117 (= res!451273 (= (h!13983 acc!681) k0!2843))))

(declare-fun b!686118 () Bool)

(assert (=> b!686118 (= e!390717 (contains!3591 (t!19183 acc!681) k0!2843))))

(assert (= (and d!94741 res!451272) b!686117))

(assert (= (and b!686117 (not res!451273)) b!686118))

(assert (=> d!94741 m!650701))

(declare-fun m!650733 () Bool)

(assert (=> d!94741 m!650733))

(declare-fun m!650735 () Bool)

(assert (=> b!686118 m!650735))

(assert (=> b!685923 d!94741))

(declare-fun d!94743 () Bool)

(assert (=> d!94743 (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))

(declare-fun lt!314923 () Unit!24126)

(declare-fun choose!13 (array!39633 (_ BitVec 64) (_ BitVec 32)) Unit!24126)

(assert (=> d!94743 (= lt!314923 (choose!13 a!3626 k0!2843 from!3004))))

(assert (=> d!94743 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!94743 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004) lt!314923)))

(declare-fun bs!20126 () Bool)

(assert (= bs!20126 d!94743))

(assert (=> bs!20126 m!650571))

(declare-fun m!650737 () Bool)

(assert (=> bs!20126 m!650737))

(assert (=> b!685912 d!94743))

(declare-fun d!94745 () Bool)

(assert (=> d!94745 (= ($colon$colon!362 acc!681 (select (arr!18991 a!3626) from!3004)) (Cons!12935 (select (arr!18991 a!3626) from!3004) acc!681))))

(assert (=> b!685922 d!94745))

(declare-fun b!686130 () Bool)

(declare-fun e!390728 () Bool)

(assert (=> b!686130 (= e!390728 (subseq!200 acc!681 (t!19183 acc!681)))))

(declare-fun d!94747 () Bool)

(declare-fun res!451283 () Bool)

(declare-fun e!390727 () Bool)

(assert (=> d!94747 (=> res!451283 e!390727)))

(assert (=> d!94747 (= res!451283 ((_ is Nil!12936) acc!681))))

(assert (=> d!94747 (= (subseq!200 acc!681 acc!681) e!390727)))

(declare-fun b!686128 () Bool)

(declare-fun e!390730 () Bool)

(assert (=> b!686128 (= e!390730 e!390728)))

(declare-fun res!451284 () Bool)

(assert (=> b!686128 (=> res!451284 e!390728)))

(declare-fun e!390729 () Bool)

(assert (=> b!686128 (= res!451284 e!390729)))

(declare-fun res!451285 () Bool)

(assert (=> b!686128 (=> (not res!451285) (not e!390729))))

(assert (=> b!686128 (= res!451285 (= (h!13983 acc!681) (h!13983 acc!681)))))

(declare-fun b!686129 () Bool)

(assert (=> b!686129 (= e!390729 (subseq!200 (t!19183 acc!681) (t!19183 acc!681)))))

(declare-fun b!686127 () Bool)

(assert (=> b!686127 (= e!390727 e!390730)))

(declare-fun res!451282 () Bool)

(assert (=> b!686127 (=> (not res!451282) (not e!390730))))

(assert (=> b!686127 (= res!451282 ((_ is Cons!12935) acc!681))))

(assert (= (and d!94747 (not res!451283)) b!686127))

(assert (= (and b!686127 res!451282) b!686128))

(assert (= (and b!686128 res!451285) b!686129))

(assert (= (and b!686128 (not res!451284)) b!686130))

(declare-fun m!650739 () Bool)

(assert (=> b!686130 m!650739))

(declare-fun m!650741 () Bool)

(assert (=> b!686129 m!650741))

(assert (=> b!685922 d!94747))

(declare-fun d!94751 () Bool)

(assert (=> d!94751 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!314929 () Unit!24126)

(declare-fun choose!80 (array!39633 List!12939 List!12939 (_ BitVec 32)) Unit!24126)

(assert (=> d!94751 (= lt!314929 (choose!80 a!3626 ($colon$colon!362 acc!681 (select (arr!18991 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> d!94751 (bvslt (size!19363 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!94751 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!362 acc!681 (select (arr!18991 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)) lt!314929)))

(declare-fun bs!20128 () Bool)

(assert (= bs!20128 d!94751))

(assert (=> bs!20128 m!650533))

(assert (=> bs!20128 m!650567))

(declare-fun m!650745 () Bool)

(assert (=> bs!20128 m!650745))

(assert (=> b!685922 d!94751))

(declare-fun d!94757 () Bool)

(assert (=> d!94757 (subseq!200 acc!681 acc!681)))

(declare-fun lt!314934 () Unit!24126)

(declare-fun choose!36 (List!12939) Unit!24126)

(assert (=> d!94757 (= lt!314934 (choose!36 acc!681))))

(assert (=> d!94757 (= (lemmaListSubSeqRefl!0 acc!681) lt!314934)))

(declare-fun bs!20129 () Bool)

(assert (= bs!20129 d!94757))

(assert (=> bs!20129 m!650553))

(declare-fun m!650747 () Bool)

(assert (=> bs!20129 m!650747))

(assert (=> b!685922 d!94757))

(declare-fun b!686135 () Bool)

(declare-fun e!390738 () Bool)

(declare-fun e!390735 () Bool)

(assert (=> b!686135 (= e!390738 e!390735)))

(declare-fun c!77791 () Bool)

(assert (=> b!686135 (= c!77791 (validKeyInArray!0 (select (arr!18991 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!686136 () Bool)

(declare-fun e!390737 () Bool)

(assert (=> b!686136 (= e!390737 e!390738)))

(declare-fun res!451290 () Bool)

(assert (=> b!686136 (=> (not res!451290) (not e!390738))))

(declare-fun e!390736 () Bool)

(assert (=> b!686136 (= res!451290 (not e!390736))))

(declare-fun res!451291 () Bool)

(assert (=> b!686136 (=> (not res!451291) (not e!390736))))

(assert (=> b!686136 (= res!451291 (validKeyInArray!0 (select (arr!18991 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!686137 () Bool)

(declare-fun call!34088 () Bool)

(assert (=> b!686137 (= e!390735 call!34088)))

(declare-fun b!686138 () Bool)

(assert (=> b!686138 (= e!390736 (contains!3591 acc!681 (select (arr!18991 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!686139 () Bool)

(assert (=> b!686139 (= e!390735 call!34088)))

(declare-fun d!94759 () Bool)

(declare-fun res!451292 () Bool)

(assert (=> d!94759 (=> res!451292 e!390737)))

(assert (=> d!94759 (= res!451292 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19363 a!3626)))))

(assert (=> d!94759 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681) e!390737)))

(declare-fun bm!34085 () Bool)

(assert (=> bm!34085 (= call!34088 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!77791 (Cons!12935 (select (arr!18991 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) acc!681) acc!681)))))

(assert (= (and d!94759 (not res!451292)) b!686136))

(assert (= (and b!686136 res!451291) b!686138))

(assert (= (and b!686136 res!451290) b!686135))

(assert (= (and b!686135 c!77791) b!686137))

(assert (= (and b!686135 (not c!77791)) b!686139))

(assert (= (or b!686137 b!686139) bm!34085))

(declare-fun m!650749 () Bool)

(assert (=> b!686135 m!650749))

(assert (=> b!686135 m!650749))

(declare-fun m!650751 () Bool)

(assert (=> b!686135 m!650751))

(assert (=> b!686136 m!650749))

(assert (=> b!686136 m!650749))

(assert (=> b!686136 m!650751))

(assert (=> b!686138 m!650749))

(assert (=> b!686138 m!650749))

(declare-fun m!650753 () Bool)

(assert (=> b!686138 m!650753))

(assert (=> bm!34085 m!650749))

(declare-fun m!650755 () Bool)

(assert (=> bm!34085 m!650755))

(assert (=> b!685922 d!94759))

(declare-fun d!94761 () Bool)

(declare-fun lt!314938 () Bool)

(assert (=> d!94761 (= lt!314938 (select (content!291 lt!314859) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!390744 () Bool)

(assert (=> d!94761 (= lt!314938 e!390744)))

(declare-fun res!451297 () Bool)

(assert (=> d!94761 (=> (not res!451297) (not e!390744))))

(assert (=> d!94761 (= res!451297 ((_ is Cons!12935) lt!314859))))

(assert (=> d!94761 (= (contains!3591 lt!314859 #b1000000000000000000000000000000000000000000000000000000000000000) lt!314938)))

(declare-fun b!686144 () Bool)

(declare-fun e!390743 () Bool)

(assert (=> b!686144 (= e!390744 e!390743)))

(declare-fun res!451298 () Bool)

(assert (=> b!686144 (=> res!451298 e!390743)))

(assert (=> b!686144 (= res!451298 (= (h!13983 lt!314859) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!686145 () Bool)

(assert (=> b!686145 (= e!390743 (contains!3591 (t!19183 lt!314859) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94761 res!451297) b!686144))

(assert (= (and b!686144 (not res!451298)) b!686145))

(assert (=> d!94761 m!650723))

(declare-fun m!650763 () Bool)

(assert (=> d!94761 m!650763))

(declare-fun m!650765 () Bool)

(assert (=> b!686145 m!650765))

(assert (=> b!685921 d!94761))

(declare-fun b!686153 () Bool)

(declare-fun e!390750 () Bool)

(assert (=> b!686153 (= e!390750 (subseq!200 acc!681 (t!19183 lt!314859)))))

(declare-fun d!94765 () Bool)

(declare-fun res!451304 () Bool)

(declare-fun e!390749 () Bool)

(assert (=> d!94765 (=> res!451304 e!390749)))

(assert (=> d!94765 (= res!451304 ((_ is Nil!12936) acc!681))))

(assert (=> d!94765 (= (subseq!200 acc!681 lt!314859) e!390749)))

(declare-fun b!686151 () Bool)

(declare-fun e!390752 () Bool)

(assert (=> b!686151 (= e!390752 e!390750)))

(declare-fun res!451305 () Bool)

(assert (=> b!686151 (=> res!451305 e!390750)))

(declare-fun e!390751 () Bool)

(assert (=> b!686151 (= res!451305 e!390751)))

(declare-fun res!451306 () Bool)

(assert (=> b!686151 (=> (not res!451306) (not e!390751))))

(assert (=> b!686151 (= res!451306 (= (h!13983 acc!681) (h!13983 lt!314859)))))

(declare-fun b!686152 () Bool)

(assert (=> b!686152 (= e!390751 (subseq!200 (t!19183 acc!681) (t!19183 lt!314859)))))

(declare-fun b!686150 () Bool)

(assert (=> b!686150 (= e!390749 e!390752)))

(declare-fun res!451303 () Bool)

(assert (=> b!686150 (=> (not res!451303) (not e!390752))))

(assert (=> b!686150 (= res!451303 ((_ is Cons!12935) lt!314859))))

(assert (= (and d!94765 (not res!451304)) b!686150))

(assert (= (and b!686150 res!451303) b!686151))

(assert (= (and b!686151 res!451306) b!686152))

(assert (= (and b!686151 (not res!451305)) b!686153))

(declare-fun m!650771 () Bool)

(assert (=> b!686153 m!650771))

(declare-fun m!650773 () Bool)

(assert (=> b!686152 m!650773))

(assert (=> b!685910 d!94765))

(assert (=> b!685909 d!94747))

(declare-fun d!94769 () Bool)

(declare-fun res!451319 () Bool)

(declare-fun e!390765 () Bool)

(assert (=> d!94769 (=> res!451319 e!390765)))

(assert (=> d!94769 (= res!451319 (= (select (arr!18991 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k0!2843))))

(assert (=> d!94769 (= (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!390765)))

(declare-fun b!686166 () Bool)

(declare-fun e!390766 () Bool)

(assert (=> b!686166 (= e!390765 e!390766)))

(declare-fun res!451320 () Bool)

(assert (=> b!686166 (=> (not res!451320) (not e!390766))))

(assert (=> b!686166 (= res!451320 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19363 a!3626)))))

(declare-fun b!686167 () Bool)

(assert (=> b!686167 (= e!390766 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94769 (not res!451319)) b!686166))

(assert (= (and b!686166 res!451320) b!686167))

(assert (=> d!94769 m!650749))

(declare-fun m!650785 () Bool)

(assert (=> b!686167 m!650785))

(assert (=> b!685909 d!94769))

(declare-fun bm!34090 () Bool)

(declare-fun call!34093 () List!12939)

(assert (=> bm!34090 (= call!34093 (-!164 (t!19183 lt!314859) k0!2843))))

(declare-fun b!686204 () Bool)

(declare-fun e!390798 () List!12939)

(declare-fun e!390800 () List!12939)

(assert (=> b!686204 (= e!390798 e!390800)))

(declare-fun c!77799 () Bool)

(assert (=> b!686204 (= c!77799 (= k0!2843 (h!13983 lt!314859)))))

(declare-fun d!94775 () Bool)

(declare-fun e!390799 () Bool)

(assert (=> d!94775 e!390799))

(declare-fun res!451345 () Bool)

(assert (=> d!94775 (=> (not res!451345) (not e!390799))))

(declare-fun lt!314943 () List!12939)

(declare-fun size!19367 (List!12939) Int)

(assert (=> d!94775 (= res!451345 (<= (size!19367 lt!314943) (size!19367 lt!314859)))))

(assert (=> d!94775 (= lt!314943 e!390798)))

(declare-fun c!77798 () Bool)

(assert (=> d!94775 (= c!77798 ((_ is Cons!12935) lt!314859))))

(assert (=> d!94775 (= (-!164 lt!314859 k0!2843) lt!314943)))

(declare-fun b!686205 () Bool)

(assert (=> b!686205 (= e!390799 (= (content!291 lt!314943) ((_ map and) (content!291 lt!314859) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2843 true)))))))

(declare-fun b!686206 () Bool)

(assert (=> b!686206 (= e!390800 call!34093)))

(declare-fun b!686207 () Bool)

(assert (=> b!686207 (= e!390798 Nil!12936)))

(declare-fun b!686208 () Bool)

(assert (=> b!686208 (= e!390800 (Cons!12935 (h!13983 lt!314859) call!34093))))

(assert (= (and d!94775 c!77798) b!686204))

(assert (= (and d!94775 (not c!77798)) b!686207))

(assert (= (and b!686204 c!77799) b!686206))

(assert (= (and b!686204 (not c!77799)) b!686208))

(assert (= (or b!686206 b!686208) bm!34090))

(assert (= (and d!94775 res!451345) b!686205))

(declare-fun m!650795 () Bool)

(assert (=> bm!34090 m!650795))

(declare-fun m!650797 () Bool)

(assert (=> d!94775 m!650797))

(declare-fun m!650799 () Bool)

(assert (=> d!94775 m!650799))

(declare-fun m!650801 () Bool)

(assert (=> b!686205 m!650801))

(assert (=> b!686205 m!650723))

(declare-fun m!650803 () Bool)

(assert (=> b!686205 m!650803))

(assert (=> b!685909 d!94775))

(declare-fun d!94781 () Bool)

(assert (=> d!94781 (= (-!164 ($colon$colon!362 acc!681 k0!2843) k0!2843) acc!681)))

(declare-fun lt!314949 () Unit!24126)

(declare-fun choose!16 ((_ BitVec 64) List!12939) Unit!24126)

(assert (=> d!94781 (= lt!314949 (choose!16 k0!2843 acc!681))))

(assert (=> d!94781 (not (contains!3591 acc!681 k0!2843))))

(assert (=> d!94781 (= (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681) lt!314949)))

(declare-fun bs!20131 () Bool)

(assert (= bs!20131 d!94781))

(assert (=> bs!20131 m!650545))

(assert (=> bs!20131 m!650545))

(declare-fun m!650809 () Bool)

(assert (=> bs!20131 m!650809))

(declare-fun m!650811 () Bool)

(assert (=> bs!20131 m!650811))

(assert (=> bs!20131 m!650555))

(assert (=> b!685909 d!94781))

(declare-fun d!94785 () Bool)

(declare-fun res!451351 () Bool)

(declare-fun e!390807 () Bool)

(assert (=> d!94785 (=> res!451351 e!390807)))

(assert (=> d!94785 (= res!451351 (= (select (arr!18991 (array!39634 (store (arr!18991 a!3626) i!1382 k0!2843) (size!19363 a!3626))) from!3004) k0!2843))))

(assert (=> d!94785 (= (arrayContainsKey!0 (array!39634 (store (arr!18991 a!3626) i!1382 k0!2843) (size!19363 a!3626)) k0!2843 from!3004) e!390807)))

(declare-fun b!686216 () Bool)

(declare-fun e!390808 () Bool)

(assert (=> b!686216 (= e!390807 e!390808)))

(declare-fun res!451352 () Bool)

(assert (=> b!686216 (=> (not res!451352) (not e!390808))))

(assert (=> b!686216 (= res!451352 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19363 (array!39634 (store (arr!18991 a!3626) i!1382 k0!2843) (size!19363 a!3626)))))))

(declare-fun b!686217 () Bool)

(assert (=> b!686217 (= e!390808 (arrayContainsKey!0 (array!39634 (store (arr!18991 a!3626) i!1382 k0!2843) (size!19363 a!3626)) k0!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94785 (not res!451351)) b!686216))

(assert (= (and b!686216 res!451352) b!686217))

(declare-fun m!650813 () Bool)

(assert (=> d!94785 m!650813))

(declare-fun m!650815 () Bool)

(assert (=> b!686217 m!650815))

(assert (=> b!685909 d!94785))

(assert (=> b!685909 d!94757))

(declare-fun d!94787 () Bool)

(assert (=> d!94787 (= (validKeyInArray!0 (select (arr!18991 a!3626) from!3004)) (and (not (= (select (arr!18991 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18991 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!685909 d!94787))

(declare-fun d!94789 () Bool)

(assert (=> d!94789 (= ($colon$colon!362 acc!681 k0!2843) (Cons!12935 k0!2843 acc!681))))

(assert (=> b!685909 d!94789))

(assert (=> b!685909 d!94759))

(declare-fun d!94791 () Bool)

(declare-fun lt!314950 () Bool)

(assert (=> d!94791 (= lt!314950 (select (content!291 lt!314859) k0!2843))))

(declare-fun e!390810 () Bool)

(assert (=> d!94791 (= lt!314950 e!390810)))

(declare-fun res!451353 () Bool)

(assert (=> d!94791 (=> (not res!451353) (not e!390810))))

(assert (=> d!94791 (= res!451353 ((_ is Cons!12935) lt!314859))))

(assert (=> d!94791 (= (contains!3591 lt!314859 k0!2843) lt!314950)))

(declare-fun b!686218 () Bool)

(declare-fun e!390809 () Bool)

(assert (=> b!686218 (= e!390810 e!390809)))

(declare-fun res!451354 () Bool)

(assert (=> b!686218 (=> res!451354 e!390809)))

(assert (=> b!686218 (= res!451354 (= (h!13983 lt!314859) k0!2843))))

(declare-fun b!686219 () Bool)

(assert (=> b!686219 (= e!390809 (contains!3591 (t!19183 lt!314859) k0!2843))))

(assert (= (and d!94791 res!451353) b!686218))

(assert (= (and b!686218 (not res!451354)) b!686219))

(assert (=> d!94791 m!650723))

(declare-fun m!650821 () Bool)

(assert (=> d!94791 m!650821))

(declare-fun m!650823 () Bool)

(assert (=> b!686219 m!650823))

(assert (=> b!685920 d!94791))

(declare-fun d!94795 () Bool)

(declare-fun res!451357 () Bool)

(declare-fun e!390813 () Bool)

(assert (=> d!94795 (=> res!451357 e!390813)))

(assert (=> d!94795 (= res!451357 ((_ is Nil!12936) acc!681))))

(assert (=> d!94795 (= (noDuplicate!865 acc!681) e!390813)))

(declare-fun b!686222 () Bool)

(declare-fun e!390814 () Bool)

(assert (=> b!686222 (= e!390813 e!390814)))

(declare-fun res!451358 () Bool)

(assert (=> b!686222 (=> (not res!451358) (not e!390814))))

(assert (=> b!686222 (= res!451358 (not (contains!3591 (t!19183 acc!681) (h!13983 acc!681))))))

(declare-fun b!686223 () Bool)

(assert (=> b!686223 (= e!390814 (noDuplicate!865 (t!19183 acc!681)))))

(assert (= (and d!94795 (not res!451357)) b!686222))

(assert (= (and b!686222 res!451358) b!686223))

(declare-fun m!650827 () Bool)

(assert (=> b!686222 m!650827))

(declare-fun m!650829 () Bool)

(assert (=> b!686223 m!650829))

(assert (=> b!685930 d!94795))

(assert (=> b!685929 d!94741))

(assert (=> b!685907 d!94741))

(declare-fun d!94797 () Bool)

(declare-fun res!451359 () Bool)

(declare-fun e!390815 () Bool)

(assert (=> d!94797 (=> res!451359 e!390815)))

(assert (=> d!94797 (= res!451359 (= (select (arr!18991 a!3626) #b00000000000000000000000000000000) k0!2843))))

(assert (=> d!94797 (= (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000) e!390815)))

(declare-fun b!686224 () Bool)

(declare-fun e!390816 () Bool)

(assert (=> b!686224 (= e!390815 e!390816)))

(declare-fun res!451360 () Bool)

(assert (=> b!686224 (=> (not res!451360) (not e!390816))))

(assert (=> b!686224 (= res!451360 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19363 a!3626)))))

(declare-fun b!686225 () Bool)

(assert (=> b!686225 (= e!390816 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!94797 (not res!451359)) b!686224))

(assert (= (and b!686224 res!451360) b!686225))

(assert (=> d!94797 m!650715))

(declare-fun m!650835 () Bool)

(assert (=> b!686225 m!650835))

(assert (=> b!685917 d!94797))

(check-sat (not b!686111) (not b!686152) (not b!686135) (not b!686112) (not b!686205) (not b!686225) (not b!686136) (not b!686167) (not b!686115) (not d!94791) (not b!686129) (not d!94781) (not b!686222) (not d!94775) (not d!94757) (not b!686105) (not bm!34085) (not b!686217) (not bm!34090) (not b!686223) (not b!686145) (not b!686106) (not b!686092) (not b!686138) (not bm!34084) (not d!94751) (not b!686130) (not b!686086) (not b!686113) (not d!94743) (not b!686219) (not d!94725) (not bm!34083) (not d!94729) (not b!686153) (not d!94761) (not b!686094) (not b!686108) (not b!686118) (not b!686091) (not d!94741) (not d!94735))
(check-sat)
