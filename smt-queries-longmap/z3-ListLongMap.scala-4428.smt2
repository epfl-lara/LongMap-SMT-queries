; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61518 () Bool)

(assert start!61518)

(declare-fun b!687769 () Bool)

(declare-fun e!391749 () Bool)

(declare-datatypes ((List!12957 0))(
  ( (Nil!12954) (Cons!12953 (h!14001 (_ BitVec 64)) (t!19210 List!12957)) )
))
(declare-fun lt!315559 () List!12957)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3609 (List!12957 (_ BitVec 64)) Bool)

(assert (=> b!687769 (= e!391749 (contains!3609 lt!315559 k0!2843))))

(declare-fun b!687770 () Bool)

(declare-fun res!452553 () Bool)

(declare-fun e!391750 () Bool)

(assert (=> b!687770 (=> res!452553 e!391750)))

(assert (=> b!687770 (= res!452553 e!391749)))

(declare-fun res!452552 () Bool)

(assert (=> b!687770 (=> (not res!452552) (not e!391749))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!687770 (= res!452552 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!687771 () Bool)

(declare-fun res!452548 () Bool)

(declare-fun e!391744 () Bool)

(assert (=> b!687771 (=> (not res!452548) (not e!391744))))

(declare-datatypes ((array!39678 0))(
  ( (array!39679 (arr!19009 (Array (_ BitVec 32) (_ BitVec 64))) (size!19386 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39678)

(declare-fun arrayNoDuplicates!0 (array!39678 (_ BitVec 32) List!12957) Bool)

(assert (=> b!687771 (= res!452548 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12954))))

(declare-fun b!687772 () Bool)

(declare-fun res!452537 () Bool)

(assert (=> b!687772 (=> res!452537 e!391750)))

(declare-fun noDuplicate!883 (List!12957) Bool)

(assert (=> b!687772 (= res!452537 (not (noDuplicate!883 lt!315559)))))

(declare-fun b!687773 () Bool)

(declare-fun res!452538 () Bool)

(assert (=> b!687773 (=> res!452538 e!391750)))

(assert (=> b!687773 (= res!452538 (contains!3609 lt!315559 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!687774 () Bool)

(declare-fun res!452554 () Bool)

(assert (=> b!687774 (=> (not res!452554) (not e!391744))))

(declare-fun e!391743 () Bool)

(assert (=> b!687774 (= res!452554 e!391743)))

(declare-fun res!452549 () Bool)

(assert (=> b!687774 (=> res!452549 e!391743)))

(declare-fun e!391752 () Bool)

(assert (=> b!687774 (= res!452549 e!391752)))

(declare-fun res!452544 () Bool)

(assert (=> b!687774 (=> (not res!452544) (not e!391752))))

(assert (=> b!687774 (= res!452544 (bvsgt from!3004 i!1382))))

(declare-fun b!687776 () Bool)

(declare-fun res!452536 () Bool)

(assert (=> b!687776 (=> (not res!452536) (not e!391744))))

(declare-fun arrayContainsKey!0 (array!39678 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!687776 (= res!452536 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!687777 () Bool)

(declare-fun e!391751 () Bool)

(assert (=> b!687777 (= e!391750 e!391751)))

(declare-fun res!452539 () Bool)

(assert (=> b!687777 (=> (not res!452539) (not e!391751))))

(assert (=> b!687777 (= res!452539 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!687778 () Bool)

(declare-fun res!452535 () Bool)

(assert (=> b!687778 (=> (not res!452535) (not e!391744))))

(declare-fun acc!681 () List!12957)

(assert (=> b!687778 (= res!452535 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!687779 () Bool)

(declare-fun res!452540 () Bool)

(assert (=> b!687779 (=> res!452540 e!391750)))

(assert (=> b!687779 (= res!452540 (contains!3609 lt!315559 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!687780 () Bool)

(declare-fun e!391746 () Bool)

(assert (=> b!687780 (= e!391743 e!391746)))

(declare-fun res!452541 () Bool)

(assert (=> b!687780 (=> (not res!452541) (not e!391746))))

(assert (=> b!687780 (= res!452541 (bvsle from!3004 i!1382))))

(declare-fun b!687781 () Bool)

(assert (=> b!687781 (= e!391746 (not (contains!3609 acc!681 k0!2843)))))

(declare-fun b!687782 () Bool)

(declare-fun res!452550 () Bool)

(assert (=> b!687782 (=> (not res!452550) (not e!391744))))

(assert (=> b!687782 (= res!452550 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19386 a!3626))))))

(declare-fun b!687783 () Bool)

(declare-datatypes ((Unit!24216 0))(
  ( (Unit!24217) )
))
(declare-fun e!391747 () Unit!24216)

(declare-fun lt!315554 () Unit!24216)

(assert (=> b!687783 (= e!391747 lt!315554)))

(declare-fun lt!315557 () Unit!24216)

(declare-fun lemmaListSubSeqRefl!0 (List!12957) Unit!24216)

(assert (=> b!687783 (= lt!315557 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!218 (List!12957 List!12957) Bool)

(assert (=> b!687783 (subseq!218 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39678 List!12957 List!12957 (_ BitVec 32)) Unit!24216)

(declare-fun $colon$colon!380 (List!12957 (_ BitVec 64)) List!12957)

(assert (=> b!687783 (= lt!315554 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!380 acc!681 (select (arr!19009 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!687783 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!687784 () Bool)

(declare-fun e!391745 () Unit!24216)

(declare-fun Unit!24218 () Unit!24216)

(assert (=> b!687784 (= e!391745 Unit!24218)))

(declare-fun lt!315553 () Unit!24216)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39678 (_ BitVec 64) (_ BitVec 32)) Unit!24216)

(assert (=> b!687784 (= lt!315553 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!687784 false))

(declare-fun b!687785 () Bool)

(declare-fun res!452543 () Bool)

(assert (=> b!687785 (=> (not res!452543) (not e!391744))))

(assert (=> b!687785 (= res!452543 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19386 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!687786 () Bool)

(declare-fun Unit!24219 () Unit!24216)

(assert (=> b!687786 (= e!391745 Unit!24219)))

(declare-fun b!687787 () Bool)

(declare-fun res!452551 () Bool)

(assert (=> b!687787 (=> (not res!452551) (not e!391744))))

(assert (=> b!687787 (= res!452551 (not (contains!3609 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!687788 () Bool)

(declare-fun res!452542 () Bool)

(assert (=> b!687788 (=> (not res!452542) (not e!391744))))

(assert (=> b!687788 (= res!452542 (not (contains!3609 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!687789 () Bool)

(declare-fun res!452546 () Bool)

(assert (=> b!687789 (=> (not res!452546) (not e!391744))))

(assert (=> b!687789 (= res!452546 (noDuplicate!883 acc!681))))

(declare-fun b!687790 () Bool)

(declare-fun Unit!24220 () Unit!24216)

(assert (=> b!687790 (= e!391747 Unit!24220)))

(declare-fun b!687791 () Bool)

(assert (=> b!687791 (= e!391751 (not (contains!3609 lt!315559 k0!2843)))))

(declare-fun b!687792 () Bool)

(declare-fun res!452545 () Bool)

(assert (=> b!687792 (=> (not res!452545) (not e!391744))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!687792 (= res!452545 (validKeyInArray!0 k0!2843))))

(declare-fun b!687793 () Bool)

(assert (=> b!687793 (= e!391744 (not e!391750))))

(declare-fun res!452534 () Bool)

(assert (=> b!687793 (=> res!452534 e!391750)))

(assert (=> b!687793 (= res!452534 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!687793 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315559)))

(declare-fun lt!315556 () Unit!24216)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39678 (_ BitVec 64) (_ BitVec 32) List!12957 List!12957) Unit!24216)

(assert (=> b!687793 (= lt!315556 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315559))))

(declare-fun -!182 (List!12957 (_ BitVec 64)) List!12957)

(assert (=> b!687793 (= (-!182 lt!315559 k0!2843) acc!681)))

(assert (=> b!687793 (= lt!315559 ($colon$colon!380 acc!681 k0!2843))))

(declare-fun lt!315555 () Unit!24216)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12957) Unit!24216)

(assert (=> b!687793 (= lt!315555 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!687793 (subseq!218 acc!681 acc!681)))

(declare-fun lt!315551 () Unit!24216)

(assert (=> b!687793 (= lt!315551 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!687793 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!315558 () Unit!24216)

(assert (=> b!687793 (= lt!315558 e!391747)))

(declare-fun c!77986 () Bool)

(assert (=> b!687793 (= c!77986 (validKeyInArray!0 (select (arr!19009 a!3626) from!3004)))))

(declare-fun lt!315552 () Unit!24216)

(assert (=> b!687793 (= lt!315552 e!391745)))

(declare-fun c!77987 () Bool)

(assert (=> b!687793 (= c!77987 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!687793 (arrayContainsKey!0 (array!39679 (store (arr!19009 a!3626) i!1382 k0!2843) (size!19386 a!3626)) k0!2843 from!3004)))

(declare-fun res!452547 () Bool)

(assert (=> start!61518 (=> (not res!452547) (not e!391744))))

(assert (=> start!61518 (= res!452547 (and (bvslt (size!19386 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19386 a!3626))))))

(assert (=> start!61518 e!391744))

(assert (=> start!61518 true))

(declare-fun array_inv!14868 (array!39678) Bool)

(assert (=> start!61518 (array_inv!14868 a!3626)))

(declare-fun b!687775 () Bool)

(assert (=> b!687775 (= e!391752 (contains!3609 acc!681 k0!2843))))

(assert (= (and start!61518 res!452547) b!687789))

(assert (= (and b!687789 res!452546) b!687788))

(assert (= (and b!687788 res!452542) b!687787))

(assert (= (and b!687787 res!452551) b!687774))

(assert (= (and b!687774 res!452544) b!687775))

(assert (= (and b!687774 (not res!452549)) b!687780))

(assert (= (and b!687780 res!452541) b!687781))

(assert (= (and b!687774 res!452554) b!687771))

(assert (= (and b!687771 res!452548) b!687778))

(assert (= (and b!687778 res!452535) b!687782))

(assert (= (and b!687782 res!452550) b!687792))

(assert (= (and b!687792 res!452545) b!687776))

(assert (= (and b!687776 res!452536) b!687785))

(assert (= (and b!687785 res!452543) b!687793))

(assert (= (and b!687793 c!77987) b!687784))

(assert (= (and b!687793 (not c!77987)) b!687786))

(assert (= (and b!687793 c!77986) b!687783))

(assert (= (and b!687793 (not c!77986)) b!687790))

(assert (= (and b!687793 (not res!452534)) b!687772))

(assert (= (and b!687772 (not res!452537)) b!687779))

(assert (= (and b!687779 (not res!452540)) b!687773))

(assert (= (and b!687773 (not res!452538)) b!687770))

(assert (= (and b!687770 res!452552) b!687769))

(assert (= (and b!687770 (not res!452553)) b!687777))

(assert (= (and b!687777 res!452539) b!687791))

(declare-fun m!652267 () Bool)

(assert (=> b!687776 m!652267))

(declare-fun m!652269 () Bool)

(assert (=> b!687783 m!652269))

(declare-fun m!652271 () Bool)

(assert (=> b!687783 m!652271))

(declare-fun m!652273 () Bool)

(assert (=> b!687783 m!652273))

(declare-fun m!652275 () Bool)

(assert (=> b!687783 m!652275))

(assert (=> b!687783 m!652271))

(assert (=> b!687783 m!652273))

(declare-fun m!652277 () Bool)

(assert (=> b!687783 m!652277))

(declare-fun m!652279 () Bool)

(assert (=> b!687783 m!652279))

(declare-fun m!652281 () Bool)

(assert (=> b!687792 m!652281))

(declare-fun m!652283 () Bool)

(assert (=> b!687788 m!652283))

(declare-fun m!652285 () Bool)

(assert (=> start!61518 m!652285))

(declare-fun m!652287 () Bool)

(assert (=> b!687787 m!652287))

(declare-fun m!652289 () Bool)

(assert (=> b!687769 m!652289))

(declare-fun m!652291 () Bool)

(assert (=> b!687775 m!652291))

(assert (=> b!687781 m!652291))

(declare-fun m!652293 () Bool)

(assert (=> b!687771 m!652293))

(declare-fun m!652295 () Bool)

(assert (=> b!687773 m!652295))

(declare-fun m!652297 () Bool)

(assert (=> b!687779 m!652297))

(declare-fun m!652299 () Bool)

(assert (=> b!687793 m!652299))

(declare-fun m!652301 () Bool)

(assert (=> b!687793 m!652301))

(assert (=> b!687793 m!652271))

(declare-fun m!652303 () Bool)

(assert (=> b!687793 m!652303))

(declare-fun m!652305 () Bool)

(assert (=> b!687793 m!652305))

(assert (=> b!687793 m!652277))

(declare-fun m!652307 () Bool)

(assert (=> b!687793 m!652307))

(declare-fun m!652309 () Bool)

(assert (=> b!687793 m!652309))

(assert (=> b!687793 m!652271))

(declare-fun m!652311 () Bool)

(assert (=> b!687793 m!652311))

(declare-fun m!652313 () Bool)

(assert (=> b!687793 m!652313))

(assert (=> b!687793 m!652269))

(declare-fun m!652315 () Bool)

(assert (=> b!687793 m!652315))

(assert (=> b!687793 m!652279))

(assert (=> b!687791 m!652289))

(declare-fun m!652317 () Bool)

(assert (=> b!687778 m!652317))

(declare-fun m!652319 () Bool)

(assert (=> b!687772 m!652319))

(declare-fun m!652321 () Bool)

(assert (=> b!687789 m!652321))

(declare-fun m!652323 () Bool)

(assert (=> b!687784 m!652323))

(check-sat (not b!687791) (not b!687783) (not start!61518) (not b!687784) (not b!687779) (not b!687792) (not b!687788) (not b!687787) (not b!687781) (not b!687769) (not b!687773) (not b!687789) (not b!687778) (not b!687775) (not b!687772) (not b!687793) (not b!687776) (not b!687771))
(check-sat)
(get-model)

(declare-fun d!95193 () Bool)

(declare-fun lt!315616 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!300 (List!12957) (InoxSet (_ BitVec 64)))

(assert (=> d!95193 (= lt!315616 (select (content!300 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!391818 () Bool)

(assert (=> d!95193 (= lt!315616 e!391818)))

(declare-fun res!452686 () Bool)

(assert (=> d!95193 (=> (not res!452686) (not e!391818))))

(get-info :version)

(assert (=> d!95193 (= res!452686 ((_ is Cons!12953) acc!681))))

(assert (=> d!95193 (= (contains!3609 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!315616)))

(declare-fun b!687948 () Bool)

(declare-fun e!391817 () Bool)

(assert (=> b!687948 (= e!391818 e!391817)))

(declare-fun res!452685 () Bool)

(assert (=> b!687948 (=> res!452685 e!391817)))

(assert (=> b!687948 (= res!452685 (= (h!14001 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!687949 () Bool)

(assert (=> b!687949 (= e!391817 (contains!3609 (t!19210 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95193 res!452686) b!687948))

(assert (= (and b!687948 (not res!452685)) b!687949))

(declare-fun m!652441 () Bool)

(assert (=> d!95193 m!652441))

(declare-fun m!652443 () Bool)

(assert (=> d!95193 m!652443))

(declare-fun m!652445 () Bool)

(assert (=> b!687949 m!652445))

(assert (=> b!687788 d!95193))

(declare-fun d!95195 () Bool)

(declare-fun res!452691 () Bool)

(declare-fun e!391823 () Bool)

(assert (=> d!95195 (=> res!452691 e!391823)))

(assert (=> d!95195 (= res!452691 ((_ is Nil!12954) acc!681))))

(assert (=> d!95195 (= (noDuplicate!883 acc!681) e!391823)))

(declare-fun b!687954 () Bool)

(declare-fun e!391824 () Bool)

(assert (=> b!687954 (= e!391823 e!391824)))

(declare-fun res!452692 () Bool)

(assert (=> b!687954 (=> (not res!452692) (not e!391824))))

(assert (=> b!687954 (= res!452692 (not (contains!3609 (t!19210 acc!681) (h!14001 acc!681))))))

(declare-fun b!687955 () Bool)

(assert (=> b!687955 (= e!391824 (noDuplicate!883 (t!19210 acc!681)))))

(assert (= (and d!95195 (not res!452691)) b!687954))

(assert (= (and b!687954 res!452692) b!687955))

(declare-fun m!652447 () Bool)

(assert (=> b!687954 m!652447))

(declare-fun m!652449 () Bool)

(assert (=> b!687955 m!652449))

(assert (=> b!687789 d!95195))

(declare-fun b!687972 () Bool)

(declare-fun e!391839 () Bool)

(declare-fun e!391840 () Bool)

(assert (=> b!687972 (= e!391839 e!391840)))

(declare-fun res!452706 () Bool)

(assert (=> b!687972 (=> (not res!452706) (not e!391840))))

(declare-fun e!391841 () Bool)

(assert (=> b!687972 (= res!452706 (not e!391841))))

(declare-fun res!452707 () Bool)

(assert (=> b!687972 (=> (not res!452707) (not e!391841))))

(assert (=> b!687972 (= res!452707 (validKeyInArray!0 (select (arr!19009 a!3626) from!3004)))))

(declare-fun c!78002 () Bool)

(declare-fun call!34164 () Bool)

(declare-fun bm!34161 () Bool)

(assert (=> bm!34161 (= call!34164 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!78002 (Cons!12953 (select (arr!19009 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun d!95197 () Bool)

(declare-fun res!452705 () Bool)

(assert (=> d!95197 (=> res!452705 e!391839)))

(assert (=> d!95197 (= res!452705 (bvsge from!3004 (size!19386 a!3626)))))

(assert (=> d!95197 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!391839)))

(declare-fun b!687973 () Bool)

(declare-fun e!391842 () Bool)

(assert (=> b!687973 (= e!391842 call!34164)))

(declare-fun b!687974 () Bool)

(assert (=> b!687974 (= e!391840 e!391842)))

(assert (=> b!687974 (= c!78002 (validKeyInArray!0 (select (arr!19009 a!3626) from!3004)))))

(declare-fun b!687975 () Bool)

(assert (=> b!687975 (= e!391841 (contains!3609 acc!681 (select (arr!19009 a!3626) from!3004)))))

(declare-fun b!687976 () Bool)

(assert (=> b!687976 (= e!391842 call!34164)))

(assert (= (and d!95197 (not res!452705)) b!687972))

(assert (= (and b!687972 res!452707) b!687975))

(assert (= (and b!687972 res!452706) b!687974))

(assert (= (and b!687974 c!78002) b!687973))

(assert (= (and b!687974 (not c!78002)) b!687976))

(assert (= (or b!687973 b!687976) bm!34161))

(assert (=> b!687972 m!652271))

(assert (=> b!687972 m!652271))

(assert (=> b!687972 m!652311))

(assert (=> bm!34161 m!652271))

(declare-fun m!652455 () Bool)

(assert (=> bm!34161 m!652455))

(assert (=> b!687974 m!652271))

(assert (=> b!687974 m!652271))

(assert (=> b!687974 m!652311))

(assert (=> b!687975 m!652271))

(assert (=> b!687975 m!652271))

(declare-fun m!652457 () Bool)

(assert (=> b!687975 m!652457))

(assert (=> b!687778 d!95197))

(declare-fun d!95203 () Bool)

(declare-fun lt!315617 () Bool)

(assert (=> d!95203 (= lt!315617 (select (content!300 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!391844 () Bool)

(assert (=> d!95203 (= lt!315617 e!391844)))

(declare-fun res!452709 () Bool)

(assert (=> d!95203 (=> (not res!452709) (not e!391844))))

(assert (=> d!95203 (= res!452709 ((_ is Cons!12953) acc!681))))

(assert (=> d!95203 (= (contains!3609 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!315617)))

(declare-fun b!687977 () Bool)

(declare-fun e!391843 () Bool)

(assert (=> b!687977 (= e!391844 e!391843)))

(declare-fun res!452708 () Bool)

(assert (=> b!687977 (=> res!452708 e!391843)))

(assert (=> b!687977 (= res!452708 (= (h!14001 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!687978 () Bool)

(assert (=> b!687978 (= e!391843 (contains!3609 (t!19210 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95203 res!452709) b!687977))

(assert (= (and b!687977 (not res!452708)) b!687978))

(assert (=> d!95203 m!652441))

(declare-fun m!652459 () Bool)

(assert (=> d!95203 m!652459))

(declare-fun m!652461 () Bool)

(assert (=> b!687978 m!652461))

(assert (=> b!687787 d!95203))

(declare-fun d!95205 () Bool)

(declare-fun res!452720 () Bool)

(declare-fun e!391857 () Bool)

(assert (=> d!95205 (=> res!452720 e!391857)))

(assert (=> d!95205 (= res!452720 (= (select (arr!19009 a!3626) #b00000000000000000000000000000000) k0!2843))))

(assert (=> d!95205 (= (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000) e!391857)))

(declare-fun b!687993 () Bool)

(declare-fun e!391858 () Bool)

(assert (=> b!687993 (= e!391857 e!391858)))

(declare-fun res!452721 () Bool)

(assert (=> b!687993 (=> (not res!452721) (not e!391858))))

(assert (=> b!687993 (= res!452721 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19386 a!3626)))))

(declare-fun b!687994 () Bool)

(assert (=> b!687994 (= e!391858 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!95205 (not res!452720)) b!687993))

(assert (= (and b!687993 res!452721) b!687994))

(declare-fun m!652463 () Bool)

(assert (=> d!95205 m!652463))

(declare-fun m!652465 () Bool)

(assert (=> b!687994 m!652465))

(assert (=> b!687776 d!95205))

(declare-fun d!95209 () Bool)

(declare-fun lt!315618 () Bool)

(assert (=> d!95209 (= lt!315618 (select (content!300 lt!315559) k0!2843))))

(declare-fun e!391860 () Bool)

(assert (=> d!95209 (= lt!315618 e!391860)))

(declare-fun res!452723 () Bool)

(assert (=> d!95209 (=> (not res!452723) (not e!391860))))

(assert (=> d!95209 (= res!452723 ((_ is Cons!12953) lt!315559))))

(assert (=> d!95209 (= (contains!3609 lt!315559 k0!2843) lt!315618)))

(declare-fun b!687995 () Bool)

(declare-fun e!391859 () Bool)

(assert (=> b!687995 (= e!391860 e!391859)))

(declare-fun res!452722 () Bool)

(assert (=> b!687995 (=> res!452722 e!391859)))

(assert (=> b!687995 (= res!452722 (= (h!14001 lt!315559) k0!2843))))

(declare-fun b!687996 () Bool)

(assert (=> b!687996 (= e!391859 (contains!3609 (t!19210 lt!315559) k0!2843))))

(assert (= (and d!95209 res!452723) b!687995))

(assert (= (and b!687995 (not res!452722)) b!687996))

(declare-fun m!652467 () Bool)

(assert (=> d!95209 m!652467))

(declare-fun m!652469 () Bool)

(assert (=> d!95209 m!652469))

(declare-fun m!652471 () Bool)

(assert (=> b!687996 m!652471))

(assert (=> b!687791 d!95209))

(declare-fun d!95211 () Bool)

(declare-fun lt!315619 () Bool)

(assert (=> d!95211 (= lt!315619 (select (content!300 acc!681) k0!2843))))

(declare-fun e!391862 () Bool)

(assert (=> d!95211 (= lt!315619 e!391862)))

(declare-fun res!452725 () Bool)

(assert (=> d!95211 (=> (not res!452725) (not e!391862))))

(assert (=> d!95211 (= res!452725 ((_ is Cons!12953) acc!681))))

(assert (=> d!95211 (= (contains!3609 acc!681 k0!2843) lt!315619)))

(declare-fun b!687997 () Bool)

(declare-fun e!391861 () Bool)

(assert (=> b!687997 (= e!391862 e!391861)))

(declare-fun res!452724 () Bool)

(assert (=> b!687997 (=> res!452724 e!391861)))

(assert (=> b!687997 (= res!452724 (= (h!14001 acc!681) k0!2843))))

(declare-fun b!687998 () Bool)

(assert (=> b!687998 (= e!391861 (contains!3609 (t!19210 acc!681) k0!2843))))

(assert (= (and d!95211 res!452725) b!687997))

(assert (= (and b!687997 (not res!452724)) b!687998))

(assert (=> d!95211 m!652441))

(declare-fun m!652473 () Bool)

(assert (=> d!95211 m!652473))

(declare-fun m!652475 () Bool)

(assert (=> b!687998 m!652475))

(assert (=> b!687781 d!95211))

(declare-fun d!95213 () Bool)

(declare-fun lt!315620 () Bool)

(assert (=> d!95213 (= lt!315620 (select (content!300 lt!315559) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!391868 () Bool)

(assert (=> d!95213 (= lt!315620 e!391868)))

(declare-fun res!452730 () Bool)

(assert (=> d!95213 (=> (not res!452730) (not e!391868))))

(assert (=> d!95213 (= res!452730 ((_ is Cons!12953) lt!315559))))

(assert (=> d!95213 (= (contains!3609 lt!315559 #b0000000000000000000000000000000000000000000000000000000000000000) lt!315620)))

(declare-fun b!688004 () Bool)

(declare-fun e!391867 () Bool)

(assert (=> b!688004 (= e!391868 e!391867)))

(declare-fun res!452729 () Bool)

(assert (=> b!688004 (=> res!452729 e!391867)))

(assert (=> b!688004 (= res!452729 (= (h!14001 lt!315559) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!688005 () Bool)

(assert (=> b!688005 (= e!391867 (contains!3609 (t!19210 lt!315559) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95213 res!452730) b!688004))

(assert (= (and b!688004 (not res!452729)) b!688005))

(assert (=> d!95213 m!652467))

(declare-fun m!652477 () Bool)

(assert (=> d!95213 m!652477))

(declare-fun m!652479 () Bool)

(assert (=> b!688005 m!652479))

(assert (=> b!687779 d!95213))

(assert (=> b!687769 d!95209))

(declare-fun d!95215 () Bool)

(assert (=> d!95215 (= ($colon$colon!380 acc!681 (select (arr!19009 a!3626) from!3004)) (Cons!12953 (select (arr!19009 a!3626) from!3004) acc!681))))

(assert (=> b!687783 d!95215))

(declare-fun b!688029 () Bool)

(declare-fun e!391889 () Bool)

(declare-fun e!391892 () Bool)

(assert (=> b!688029 (= e!391889 e!391892)))

(declare-fun res!452750 () Bool)

(assert (=> b!688029 (=> (not res!452750) (not e!391892))))

(assert (=> b!688029 (= res!452750 ((_ is Cons!12953) acc!681))))

(declare-fun b!688031 () Bool)

(declare-fun e!391891 () Bool)

(assert (=> b!688031 (= e!391891 (subseq!218 (t!19210 acc!681) (t!19210 acc!681)))))

(declare-fun b!688032 () Bool)

(declare-fun e!391890 () Bool)

(assert (=> b!688032 (= e!391890 (subseq!218 acc!681 (t!19210 acc!681)))))

(declare-fun d!95219 () Bool)

(declare-fun res!452749 () Bool)

(assert (=> d!95219 (=> res!452749 e!391889)))

(assert (=> d!95219 (= res!452749 ((_ is Nil!12954) acc!681))))

(assert (=> d!95219 (= (subseq!218 acc!681 acc!681) e!391889)))

(declare-fun b!688030 () Bool)

(assert (=> b!688030 (= e!391892 e!391890)))

(declare-fun res!452748 () Bool)

(assert (=> b!688030 (=> res!452748 e!391890)))

(assert (=> b!688030 (= res!452748 e!391891)))

(declare-fun res!452751 () Bool)

(assert (=> b!688030 (=> (not res!452751) (not e!391891))))

(assert (=> b!688030 (= res!452751 (= (h!14001 acc!681) (h!14001 acc!681)))))

(assert (= (and d!95219 (not res!452749)) b!688029))

(assert (= (and b!688029 res!452750) b!688030))

(assert (= (and b!688030 res!452751) b!688031))

(assert (= (and b!688030 (not res!452748)) b!688032))

(declare-fun m!652491 () Bool)

(assert (=> b!688031 m!652491))

(declare-fun m!652493 () Bool)

(assert (=> b!688032 m!652493))

(assert (=> b!687783 d!95219))

(declare-fun d!95225 () Bool)

(assert (=> d!95225 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!315629 () Unit!24216)

(declare-fun choose!80 (array!39678 List!12957 List!12957 (_ BitVec 32)) Unit!24216)

(assert (=> d!95225 (= lt!315629 (choose!80 a!3626 ($colon$colon!380 acc!681 (select (arr!19009 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> d!95225 (bvslt (size!19386 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!95225 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!380 acc!681 (select (arr!19009 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)) lt!315629)))

(declare-fun bs!20187 () Bool)

(assert (= bs!20187 d!95225))

(assert (=> bs!20187 m!652269))

(assert (=> bs!20187 m!652273))

(declare-fun m!652505 () Bool)

(assert (=> bs!20187 m!652505))

(assert (=> b!687783 d!95225))

(declare-fun d!95231 () Bool)

(assert (=> d!95231 (subseq!218 acc!681 acc!681)))

(declare-fun lt!315637 () Unit!24216)

(declare-fun choose!36 (List!12957) Unit!24216)

(assert (=> d!95231 (= lt!315637 (choose!36 acc!681))))

(assert (=> d!95231 (= (lemmaListSubSeqRefl!0 acc!681) lt!315637)))

(declare-fun bs!20188 () Bool)

(assert (= bs!20188 d!95231))

(assert (=> bs!20188 m!652279))

(declare-fun m!652507 () Bool)

(assert (=> bs!20188 m!652507))

(assert (=> b!687783 d!95231))

(declare-fun b!688049 () Bool)

(declare-fun e!391909 () Bool)

(declare-fun e!391910 () Bool)

(assert (=> b!688049 (= e!391909 e!391910)))

(declare-fun res!452769 () Bool)

(assert (=> b!688049 (=> (not res!452769) (not e!391910))))

(declare-fun e!391911 () Bool)

(assert (=> b!688049 (= res!452769 (not e!391911))))

(declare-fun res!452770 () Bool)

(assert (=> b!688049 (=> (not res!452770) (not e!391911))))

(assert (=> b!688049 (= res!452770 (validKeyInArray!0 (select (arr!19009 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun call!34171 () Bool)

(declare-fun bm!34168 () Bool)

(declare-fun c!78009 () Bool)

(assert (=> bm!34168 (= call!34171 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!78009 (Cons!12953 (select (arr!19009 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) acc!681) acc!681)))))

(declare-fun d!95233 () Bool)

(declare-fun res!452768 () Bool)

(assert (=> d!95233 (=> res!452768 e!391909)))

(assert (=> d!95233 (= res!452768 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19386 a!3626)))))

(assert (=> d!95233 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681) e!391909)))

(declare-fun b!688050 () Bool)

(declare-fun e!391912 () Bool)

(assert (=> b!688050 (= e!391912 call!34171)))

(declare-fun b!688051 () Bool)

(assert (=> b!688051 (= e!391910 e!391912)))

(assert (=> b!688051 (= c!78009 (validKeyInArray!0 (select (arr!19009 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!688052 () Bool)

(assert (=> b!688052 (= e!391911 (contains!3609 acc!681 (select (arr!19009 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!688053 () Bool)

(assert (=> b!688053 (= e!391912 call!34171)))

(assert (= (and d!95233 (not res!452768)) b!688049))

(assert (= (and b!688049 res!452770) b!688052))

(assert (= (and b!688049 res!452769) b!688051))

(assert (= (and b!688051 c!78009) b!688050))

(assert (= (and b!688051 (not c!78009)) b!688053))

(assert (= (or b!688050 b!688053) bm!34168))

(declare-fun m!652511 () Bool)

(assert (=> b!688049 m!652511))

(assert (=> b!688049 m!652511))

(declare-fun m!652513 () Bool)

(assert (=> b!688049 m!652513))

(assert (=> bm!34168 m!652511))

(declare-fun m!652515 () Bool)

(assert (=> bm!34168 m!652515))

(assert (=> b!688051 m!652511))

(assert (=> b!688051 m!652511))

(assert (=> b!688051 m!652513))

(assert (=> b!688052 m!652511))

(assert (=> b!688052 m!652511))

(declare-fun m!652517 () Bool)

(assert (=> b!688052 m!652517))

(assert (=> b!687783 d!95233))

(declare-fun d!95237 () Bool)

(declare-fun res!452773 () Bool)

(declare-fun e!391915 () Bool)

(assert (=> d!95237 (=> res!452773 e!391915)))

(assert (=> d!95237 (= res!452773 ((_ is Nil!12954) lt!315559))))

(assert (=> d!95237 (= (noDuplicate!883 lt!315559) e!391915)))

(declare-fun b!688056 () Bool)

(declare-fun e!391916 () Bool)

(assert (=> b!688056 (= e!391915 e!391916)))

(declare-fun res!452774 () Bool)

(assert (=> b!688056 (=> (not res!452774) (not e!391916))))

(assert (=> b!688056 (= res!452774 (not (contains!3609 (t!19210 lt!315559) (h!14001 lt!315559))))))

(declare-fun b!688057 () Bool)

(assert (=> b!688057 (= e!391916 (noDuplicate!883 (t!19210 lt!315559)))))

(assert (= (and d!95237 (not res!452773)) b!688056))

(assert (= (and b!688056 res!452774) b!688057))

(declare-fun m!652525 () Bool)

(assert (=> b!688056 m!652525))

(declare-fun m!652527 () Bool)

(assert (=> b!688057 m!652527))

(assert (=> b!687772 d!95237))

(declare-fun d!95241 () Bool)

(declare-fun lt!315639 () Bool)

(assert (=> d!95241 (= lt!315639 (select (content!300 lt!315559) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!391918 () Bool)

(assert (=> d!95241 (= lt!315639 e!391918)))

(declare-fun res!452776 () Bool)

(assert (=> d!95241 (=> (not res!452776) (not e!391918))))

(assert (=> d!95241 (= res!452776 ((_ is Cons!12953) lt!315559))))

(assert (=> d!95241 (= (contains!3609 lt!315559 #b1000000000000000000000000000000000000000000000000000000000000000) lt!315639)))

(declare-fun b!688058 () Bool)

(declare-fun e!391917 () Bool)

(assert (=> b!688058 (= e!391918 e!391917)))

(declare-fun res!452775 () Bool)

(assert (=> b!688058 (=> res!452775 e!391917)))

(assert (=> b!688058 (= res!452775 (= (h!14001 lt!315559) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!688059 () Bool)

(assert (=> b!688059 (= e!391917 (contains!3609 (t!19210 lt!315559) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95241 res!452776) b!688058))

(assert (= (and b!688058 (not res!452775)) b!688059))

(assert (=> d!95241 m!652467))

(declare-fun m!652529 () Bool)

(assert (=> d!95241 m!652529))

(declare-fun m!652531 () Bool)

(assert (=> b!688059 m!652531))

(assert (=> b!687773 d!95241))

(declare-fun b!688062 () Bool)

(declare-fun e!391921 () Bool)

(declare-fun e!391922 () Bool)

(assert (=> b!688062 (= e!391921 e!391922)))

(declare-fun res!452780 () Bool)

(assert (=> b!688062 (=> (not res!452780) (not e!391922))))

(declare-fun e!391923 () Bool)

(assert (=> b!688062 (= res!452780 (not e!391923))))

(declare-fun res!452781 () Bool)

(assert (=> b!688062 (=> (not res!452781) (not e!391923))))

(assert (=> b!688062 (= res!452781 (validKeyInArray!0 (select (arr!19009 a!3626) #b00000000000000000000000000000000)))))

(declare-fun bm!34169 () Bool)

(declare-fun call!34172 () Bool)

(declare-fun c!78010 () Bool)

(assert (=> bm!34169 (= call!34172 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!78010 (Cons!12953 (select (arr!19009 a!3626) #b00000000000000000000000000000000) Nil!12954) Nil!12954)))))

(declare-fun d!95245 () Bool)

(declare-fun res!452779 () Bool)

(assert (=> d!95245 (=> res!452779 e!391921)))

(assert (=> d!95245 (= res!452779 (bvsge #b00000000000000000000000000000000 (size!19386 a!3626)))))

(assert (=> d!95245 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12954) e!391921)))

(declare-fun b!688063 () Bool)

(declare-fun e!391924 () Bool)

(assert (=> b!688063 (= e!391924 call!34172)))

(declare-fun b!688064 () Bool)

(assert (=> b!688064 (= e!391922 e!391924)))

(assert (=> b!688064 (= c!78010 (validKeyInArray!0 (select (arr!19009 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!688065 () Bool)

(assert (=> b!688065 (= e!391923 (contains!3609 Nil!12954 (select (arr!19009 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!688066 () Bool)

(assert (=> b!688066 (= e!391924 call!34172)))

(assert (= (and d!95245 (not res!452779)) b!688062))

(assert (= (and b!688062 res!452781) b!688065))

(assert (= (and b!688062 res!452780) b!688064))

(assert (= (and b!688064 c!78010) b!688063))

(assert (= (and b!688064 (not c!78010)) b!688066))

(assert (= (or b!688063 b!688066) bm!34169))

(assert (=> b!688062 m!652463))

(assert (=> b!688062 m!652463))

(declare-fun m!652539 () Bool)

(assert (=> b!688062 m!652539))

(assert (=> bm!34169 m!652463))

(declare-fun m!652541 () Bool)

(assert (=> bm!34169 m!652541))

(assert (=> b!688064 m!652463))

(assert (=> b!688064 m!652463))

(assert (=> b!688064 m!652539))

(assert (=> b!688065 m!652463))

(assert (=> b!688065 m!652463))

(declare-fun m!652543 () Bool)

(assert (=> b!688065 m!652543))

(assert (=> b!687771 d!95245))

(declare-fun d!95249 () Bool)

(assert (=> d!95249 (= (validKeyInArray!0 k0!2843) (and (not (= k0!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!687792 d!95249))

(declare-fun b!688118 () Bool)

(declare-fun e!391969 () List!12957)

(declare-fun call!34178 () List!12957)

(assert (=> b!688118 (= e!391969 call!34178)))

(declare-fun lt!315646 () List!12957)

(declare-fun e!391970 () Bool)

(declare-fun b!688119 () Bool)

(assert (=> b!688119 (= e!391970 (= (content!300 lt!315646) ((_ map and) (content!300 lt!315559) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2843 true)))))))

(declare-fun b!688120 () Bool)

(assert (=> b!688120 (= e!391969 (Cons!12953 (h!14001 lt!315559) call!34178))))

(declare-fun bm!34175 () Bool)

(assert (=> bm!34175 (= call!34178 (-!182 (t!19210 lt!315559) k0!2843))))

(declare-fun b!688122 () Bool)

(declare-fun e!391968 () List!12957)

(assert (=> b!688122 (= e!391968 e!391969)))

(declare-fun c!78022 () Bool)

(assert (=> b!688122 (= c!78022 (= k0!2843 (h!14001 lt!315559)))))

(declare-fun b!688121 () Bool)

(assert (=> b!688121 (= e!391968 Nil!12954)))

(declare-fun d!95251 () Bool)

(assert (=> d!95251 e!391970))

(declare-fun res!452813 () Bool)

(assert (=> d!95251 (=> (not res!452813) (not e!391970))))

(declare-fun size!19391 (List!12957) Int)

(assert (=> d!95251 (= res!452813 (<= (size!19391 lt!315646) (size!19391 lt!315559)))))

(assert (=> d!95251 (= lt!315646 e!391968)))

(declare-fun c!78021 () Bool)

(assert (=> d!95251 (= c!78021 ((_ is Cons!12953) lt!315559))))

(assert (=> d!95251 (= (-!182 lt!315559 k0!2843) lt!315646)))

(assert (= (and d!95251 c!78021) b!688122))

(assert (= (and d!95251 (not c!78021)) b!688121))

(assert (= (and b!688122 c!78022) b!688118))

(assert (= (and b!688122 (not c!78022)) b!688120))

(assert (= (or b!688118 b!688120) bm!34175))

(assert (= (and d!95251 res!452813) b!688119))

(declare-fun m!652563 () Bool)

(assert (=> b!688119 m!652563))

(assert (=> b!688119 m!652467))

(declare-fun m!652565 () Bool)

(assert (=> b!688119 m!652565))

(declare-fun m!652567 () Bool)

(assert (=> bm!34175 m!652567))

(declare-fun m!652569 () Bool)

(assert (=> d!95251 m!652569))

(declare-fun m!652571 () Bool)

(assert (=> d!95251 m!652571))

(assert (=> b!687793 d!95251))

(declare-fun d!95259 () Bool)

(declare-fun res!452814 () Bool)

(declare-fun e!391971 () Bool)

(assert (=> d!95259 (=> res!452814 e!391971)))

(assert (=> d!95259 (= res!452814 (= (select (arr!19009 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k0!2843))))

(assert (=> d!95259 (= (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!391971)))

(declare-fun b!688123 () Bool)

(declare-fun e!391972 () Bool)

(assert (=> b!688123 (= e!391971 e!391972)))

(declare-fun res!452815 () Bool)

(assert (=> b!688123 (=> (not res!452815) (not e!391972))))

(assert (=> b!688123 (= res!452815 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19386 a!3626)))))

(declare-fun b!688124 () Bool)

(assert (=> b!688124 (= e!391972 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!95259 (not res!452814)) b!688123))

(assert (= (and b!688123 res!452815) b!688124))

(assert (=> d!95259 m!652511))

(declare-fun m!652573 () Bool)

(assert (=> b!688124 m!652573))

(assert (=> b!687793 d!95259))

(declare-fun b!688129 () Bool)

(declare-fun e!391977 () Bool)

(declare-fun e!391978 () Bool)

(assert (=> b!688129 (= e!391977 e!391978)))

(declare-fun res!452821 () Bool)

(assert (=> b!688129 (=> (not res!452821) (not e!391978))))

(declare-fun e!391979 () Bool)

(assert (=> b!688129 (= res!452821 (not e!391979))))

(declare-fun res!452822 () Bool)

(assert (=> b!688129 (=> (not res!452822) (not e!391979))))

(assert (=> b!688129 (= res!452822 (validKeyInArray!0 (select (arr!19009 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun bm!34176 () Bool)

(declare-fun c!78023 () Bool)

(declare-fun call!34179 () Bool)

(assert (=> bm!34176 (= call!34179 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!78023 (Cons!12953 (select (arr!19009 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) lt!315559) lt!315559)))))

(declare-fun d!95261 () Bool)

(declare-fun res!452820 () Bool)

(assert (=> d!95261 (=> res!452820 e!391977)))

(assert (=> d!95261 (= res!452820 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19386 a!3626)))))

(assert (=> d!95261 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315559) e!391977)))

(declare-fun b!688130 () Bool)

(declare-fun e!391980 () Bool)

(assert (=> b!688130 (= e!391980 call!34179)))

(declare-fun b!688131 () Bool)

(assert (=> b!688131 (= e!391978 e!391980)))

(assert (=> b!688131 (= c!78023 (validKeyInArray!0 (select (arr!19009 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!688132 () Bool)

(assert (=> b!688132 (= e!391979 (contains!3609 lt!315559 (select (arr!19009 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!688133 () Bool)

(assert (=> b!688133 (= e!391980 call!34179)))

(assert (= (and d!95261 (not res!452820)) b!688129))

(assert (= (and b!688129 res!452822) b!688132))

(assert (= (and b!688129 res!452821) b!688131))

(assert (= (and b!688131 c!78023) b!688130))

(assert (= (and b!688131 (not c!78023)) b!688133))

(assert (= (or b!688130 b!688133) bm!34176))

(assert (=> b!688129 m!652511))

(assert (=> b!688129 m!652511))

(assert (=> b!688129 m!652513))

(assert (=> bm!34176 m!652511))

(declare-fun m!652579 () Bool)

(assert (=> bm!34176 m!652579))

(assert (=> b!688131 m!652511))

(assert (=> b!688131 m!652511))

(assert (=> b!688131 m!652513))

(assert (=> b!688132 m!652511))

(assert (=> b!688132 m!652511))

(declare-fun m!652581 () Bool)

(assert (=> b!688132 m!652581))

(assert (=> b!687793 d!95261))

(declare-fun d!95265 () Bool)

(assert (=> d!95265 (= (-!182 ($colon$colon!380 acc!681 k0!2843) k0!2843) acc!681)))

(declare-fun lt!315654 () Unit!24216)

(declare-fun choose!16 ((_ BitVec 64) List!12957) Unit!24216)

(assert (=> d!95265 (= lt!315654 (choose!16 k0!2843 acc!681))))

(assert (=> d!95265 (not (contains!3609 acc!681 k0!2843))))

(assert (=> d!95265 (= (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681) lt!315654)))

(declare-fun bs!20191 () Bool)

(assert (= bs!20191 d!95265))

(assert (=> bs!20191 m!652309))

(assert (=> bs!20191 m!652309))

(declare-fun m!652589 () Bool)

(assert (=> bs!20191 m!652589))

(declare-fun m!652591 () Bool)

(assert (=> bs!20191 m!652591))

(assert (=> bs!20191 m!652291))

(assert (=> b!687793 d!95265))

(declare-fun d!95271 () Bool)

(declare-fun res!452832 () Bool)

(declare-fun e!391991 () Bool)

(assert (=> d!95271 (=> res!452832 e!391991)))

(assert (=> d!95271 (= res!452832 (= (select (arr!19009 (array!39679 (store (arr!19009 a!3626) i!1382 k0!2843) (size!19386 a!3626))) from!3004) k0!2843))))

(assert (=> d!95271 (= (arrayContainsKey!0 (array!39679 (store (arr!19009 a!3626) i!1382 k0!2843) (size!19386 a!3626)) k0!2843 from!3004) e!391991)))

(declare-fun b!688145 () Bool)

(declare-fun e!391992 () Bool)

(assert (=> b!688145 (= e!391991 e!391992)))

(declare-fun res!452833 () Bool)

(assert (=> b!688145 (=> (not res!452833) (not e!391992))))

(assert (=> b!688145 (= res!452833 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19386 (array!39679 (store (arr!19009 a!3626) i!1382 k0!2843) (size!19386 a!3626)))))))

(declare-fun b!688146 () Bool)

(assert (=> b!688146 (= e!391992 (arrayContainsKey!0 (array!39679 (store (arr!19009 a!3626) i!1382 k0!2843) (size!19386 a!3626)) k0!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!95271 (not res!452832)) b!688145))

(assert (= (and b!688145 res!452833) b!688146))

(declare-fun m!652601 () Bool)

(assert (=> d!95271 m!652601))

(declare-fun m!652603 () Bool)

(assert (=> b!688146 m!652603))

(assert (=> b!687793 d!95271))

(declare-fun d!95275 () Bool)

(assert (=> d!95275 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315559)))

(declare-fun lt!315660 () Unit!24216)

(declare-fun choose!66 (array!39678 (_ BitVec 64) (_ BitVec 32) List!12957 List!12957) Unit!24216)

(assert (=> d!95275 (= lt!315660 (choose!66 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315559))))

(assert (=> d!95275 (bvslt (size!19386 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!95275 (= (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315559) lt!315660)))

(declare-fun bs!20194 () Bool)

(assert (= bs!20194 d!95275))

(assert (=> bs!20194 m!652313))

(declare-fun m!652614 () Bool)

(assert (=> bs!20194 m!652614))

(assert (=> b!687793 d!95275))

(assert (=> b!687793 d!95219))

(assert (=> b!687793 d!95231))

(declare-fun d!95281 () Bool)

(assert (=> d!95281 (= (validKeyInArray!0 (select (arr!19009 a!3626) from!3004)) (and (not (= (select (arr!19009 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19009 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!687793 d!95281))

(declare-fun d!95285 () Bool)

(assert (=> d!95285 (= ($colon$colon!380 acc!681 k0!2843) (Cons!12953 k0!2843 acc!681))))

(assert (=> b!687793 d!95285))

(assert (=> b!687793 d!95233))

(assert (=> b!687775 d!95211))

(declare-fun d!95287 () Bool)

(assert (=> d!95287 (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))

(declare-fun lt!315669 () Unit!24216)

(declare-fun choose!13 (array!39678 (_ BitVec 64) (_ BitVec 32)) Unit!24216)

(assert (=> d!95287 (= lt!315669 (choose!13 a!3626 k0!2843 from!3004))))

(assert (=> d!95287 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!95287 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004) lt!315669)))

(declare-fun bs!20196 () Bool)

(assert (= bs!20196 d!95287))

(assert (=> bs!20196 m!652267))

(declare-fun m!652623 () Bool)

(assert (=> bs!20196 m!652623))

(assert (=> b!687784 d!95287))

(declare-fun d!95293 () Bool)

(assert (=> d!95293 (= (array_inv!14868 a!3626) (bvsge (size!19386 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!61518 d!95293))

(check-sat (not b!687998) (not b!688059) (not b!688129) (not d!95211) (not b!688052) (not b!688146) (not b!688119) (not b!688049) (not d!95225) (not b!687954) (not b!688056) (not b!687975) (not d!95251) (not d!95287) (not b!687955) (not bm!34175) (not d!95241) (not d!95275) (not b!687996) (not b!688005) (not bm!34161) (not d!95213) (not b!687978) (not d!95193) (not b!688064) (not d!95265) (not b!688131) (not b!688132) (not d!95231) (not bm!34176) (not b!687972) (not b!688031) (not b!688062) (not b!687994) (not b!688065) (not b!688051) (not b!687974) (not d!95209) (not b!688057) (not b!688124) (not bm!34168) (not d!95203) (not bm!34169) (not b!688032) (not b!687949))
(check-sat)
