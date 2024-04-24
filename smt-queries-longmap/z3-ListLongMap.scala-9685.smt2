; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114520 () Bool)

(assert start!114520)

(declare-fun b!1358746 () Bool)

(declare-fun res!902702 () Bool)

(declare-fun e!771276 () Bool)

(assert (=> b!1358746 (=> (not res!902702) (not e!771276))))

(declare-datatypes ((List!31744 0))(
  ( (Nil!31741) (Cons!31740 (h!32958 (_ BitVec 64)) (t!46397 List!31744)) )
))
(declare-fun acc!759 () List!31744)

(declare-fun contains!9456 (List!31744 (_ BitVec 64)) Bool)

(assert (=> b!1358746 (= res!902702 (not (contains!9456 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358747 () Bool)

(declare-fun res!902705 () Bool)

(assert (=> b!1358747 (=> (not res!902705) (not e!771276))))

(declare-fun noDuplicate!2287 (List!31744) Bool)

(assert (=> b!1358747 (= res!902705 (noDuplicate!2287 acc!759))))

(declare-fun b!1358748 () Bool)

(declare-fun res!902699 () Bool)

(assert (=> b!1358748 (=> (not res!902699) (not e!771276))))

(declare-datatypes ((array!92548 0))(
  ( (array!92549 (arr!44716 (Array (_ BitVec 32) (_ BitVec 64))) (size!45267 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92548)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1358748 (= res!902699 (validKeyInArray!0 (select (arr!44716 a!3742) from!3120)))))

(declare-fun b!1358749 () Bool)

(declare-fun res!902700 () Bool)

(declare-fun e!771274 () Bool)

(assert (=> b!1358749 (=> res!902700 e!771274)))

(declare-fun lt!599637 () List!31744)

(assert (=> b!1358749 (= res!902700 (not (noDuplicate!2287 lt!599637)))))

(declare-fun b!1358750 () Bool)

(declare-fun res!902704 () Bool)

(assert (=> b!1358750 (=> (not res!902704) (not e!771276))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1358750 (= res!902704 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1358751 () Bool)

(declare-fun res!902708 () Bool)

(assert (=> b!1358751 (=> (not res!902708) (not e!771276))))

(declare-fun arrayNoDuplicates!0 (array!92548 (_ BitVec 32) List!31744) Bool)

(assert (=> b!1358751 (= res!902708 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1358752 () Bool)

(declare-fun e!771275 () Bool)

(assert (=> b!1358752 (= e!771274 e!771275)))

(declare-fun res!902697 () Bool)

(assert (=> b!1358752 (=> (not res!902697) (not e!771275))))

(assert (=> b!1358752 (= res!902697 (not (contains!9456 lt!599637 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358753 () Bool)

(assert (=> b!1358753 (= e!771276 (not e!771274))))

(declare-fun res!902703 () Bool)

(assert (=> b!1358753 (=> res!902703 e!771274)))

(assert (=> b!1358753 (= res!902703 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!817 (List!31744 (_ BitVec 64)) List!31744)

(assert (=> b!1358753 (= lt!599637 ($colon$colon!817 acc!759 (select (arr!44716 a!3742) from!3120)))))

(declare-fun subseq!815 (List!31744 List!31744) Bool)

(assert (=> b!1358753 (subseq!815 acc!759 acc!759)))

(declare-datatypes ((Unit!44600 0))(
  ( (Unit!44601) )
))
(declare-fun lt!599636 () Unit!44600)

(declare-fun lemmaListSubSeqRefl!0 (List!31744) Unit!44600)

(assert (=> b!1358753 (= lt!599636 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1358754 () Bool)

(declare-fun res!902706 () Bool)

(assert (=> b!1358754 (=> (not res!902706) (not e!771276))))

(assert (=> b!1358754 (= res!902706 (not (contains!9456 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358755 () Bool)

(assert (=> b!1358755 (= e!771275 (not (contains!9456 lt!599637 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!902707 () Bool)

(assert (=> start!114520 (=> (not res!902707) (not e!771276))))

(assert (=> start!114520 (= res!902707 (and (bvslt (size!45267 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45267 a!3742))))))

(assert (=> start!114520 e!771276))

(assert (=> start!114520 true))

(declare-fun array_inv!33997 (array!92548) Bool)

(assert (=> start!114520 (array_inv!33997 a!3742)))

(declare-fun b!1358756 () Bool)

(declare-fun res!902709 () Bool)

(assert (=> b!1358756 (=> (not res!902709) (not e!771276))))

(assert (=> b!1358756 (= res!902709 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45267 a!3742)))))

(declare-fun b!1358757 () Bool)

(declare-fun res!902701 () Bool)

(assert (=> b!1358757 (=> (not res!902701) (not e!771276))))

(assert (=> b!1358757 (= res!902701 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31741))))

(declare-fun b!1358758 () Bool)

(declare-fun res!902698 () Bool)

(assert (=> b!1358758 (=> (not res!902698) (not e!771276))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1358758 (= res!902698 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45267 a!3742))))))

(assert (= (and start!114520 res!902707) b!1358747))

(assert (= (and b!1358747 res!902705) b!1358754))

(assert (= (and b!1358754 res!902706) b!1358746))

(assert (= (and b!1358746 res!902702) b!1358757))

(assert (= (and b!1358757 res!902701) b!1358751))

(assert (= (and b!1358751 res!902708) b!1358758))

(assert (= (and b!1358758 res!902698) b!1358750))

(assert (= (and b!1358750 res!902704) b!1358756))

(assert (= (and b!1358756 res!902709) b!1358748))

(assert (= (and b!1358748 res!902699) b!1358753))

(assert (= (and b!1358753 (not res!902703)) b!1358749))

(assert (= (and b!1358749 (not res!902700)) b!1358752))

(assert (= (and b!1358752 res!902697) b!1358755))

(declare-fun m!1244779 () Bool)

(assert (=> b!1358747 m!1244779))

(declare-fun m!1244781 () Bool)

(assert (=> b!1358755 m!1244781))

(declare-fun m!1244783 () Bool)

(assert (=> b!1358757 m!1244783))

(declare-fun m!1244785 () Bool)

(assert (=> b!1358752 m!1244785))

(declare-fun m!1244787 () Bool)

(assert (=> b!1358746 m!1244787))

(declare-fun m!1244789 () Bool)

(assert (=> b!1358749 m!1244789))

(declare-fun m!1244791 () Bool)

(assert (=> b!1358751 m!1244791))

(declare-fun m!1244793 () Bool)

(assert (=> start!114520 m!1244793))

(declare-fun m!1244795 () Bool)

(assert (=> b!1358750 m!1244795))

(declare-fun m!1244797 () Bool)

(assert (=> b!1358748 m!1244797))

(assert (=> b!1358748 m!1244797))

(declare-fun m!1244799 () Bool)

(assert (=> b!1358748 m!1244799))

(declare-fun m!1244801 () Bool)

(assert (=> b!1358754 m!1244801))

(assert (=> b!1358753 m!1244797))

(assert (=> b!1358753 m!1244797))

(declare-fun m!1244803 () Bool)

(assert (=> b!1358753 m!1244803))

(declare-fun m!1244805 () Bool)

(assert (=> b!1358753 m!1244805))

(declare-fun m!1244807 () Bool)

(assert (=> b!1358753 m!1244807))

(check-sat (not b!1358754) (not b!1358751) (not b!1358748) (not b!1358749) (not b!1358753) (not b!1358747) (not b!1358746) (not start!114520) (not b!1358750) (not b!1358757) (not b!1358755) (not b!1358752))
(check-sat)
(get-model)

(declare-fun d!145605 () Bool)

(assert (=> d!145605 (= ($colon$colon!817 acc!759 (select (arr!44716 a!3742) from!3120)) (Cons!31740 (select (arr!44716 a!3742) from!3120) acc!759))))

(assert (=> b!1358753 d!145605))

(declare-fun b!1358848 () Bool)

(declare-fun e!771313 () Bool)

(assert (=> b!1358848 (= e!771313 (subseq!815 acc!759 (t!46397 acc!759)))))

(declare-fun b!1358845 () Bool)

(declare-fun e!771311 () Bool)

(declare-fun e!771312 () Bool)

(assert (=> b!1358845 (= e!771311 e!771312)))

(declare-fun res!902798 () Bool)

(assert (=> b!1358845 (=> (not res!902798) (not e!771312))))

(get-info :version)

(assert (=> b!1358845 (= res!902798 ((_ is Cons!31740) acc!759))))

(declare-fun b!1358847 () Bool)

(declare-fun e!771310 () Bool)

(assert (=> b!1358847 (= e!771310 (subseq!815 (t!46397 acc!759) (t!46397 acc!759)))))

(declare-fun b!1358846 () Bool)

(assert (=> b!1358846 (= e!771312 e!771313)))

(declare-fun res!902799 () Bool)

(assert (=> b!1358846 (=> res!902799 e!771313)))

(assert (=> b!1358846 (= res!902799 e!771310)))

(declare-fun res!902796 () Bool)

(assert (=> b!1358846 (=> (not res!902796) (not e!771310))))

(assert (=> b!1358846 (= res!902796 (= (h!32958 acc!759) (h!32958 acc!759)))))

(declare-fun d!145607 () Bool)

(declare-fun res!902797 () Bool)

(assert (=> d!145607 (=> res!902797 e!771311)))

(assert (=> d!145607 (= res!902797 ((_ is Nil!31741) acc!759))))

(assert (=> d!145607 (= (subseq!815 acc!759 acc!759) e!771311)))

(assert (= (and d!145607 (not res!902797)) b!1358845))

(assert (= (and b!1358845 res!902798) b!1358846))

(assert (= (and b!1358846 res!902796) b!1358847))

(assert (= (and b!1358846 (not res!902799)) b!1358848))

(declare-fun m!1244869 () Bool)

(assert (=> b!1358848 m!1244869))

(declare-fun m!1244871 () Bool)

(assert (=> b!1358847 m!1244871))

(assert (=> b!1358753 d!145607))

(declare-fun d!145609 () Bool)

(assert (=> d!145609 (subseq!815 acc!759 acc!759)))

(declare-fun lt!599652 () Unit!44600)

(declare-fun choose!36 (List!31744) Unit!44600)

(assert (=> d!145609 (= lt!599652 (choose!36 acc!759))))

(assert (=> d!145609 (= (lemmaListSubSeqRefl!0 acc!759) lt!599652)))

(declare-fun bs!38950 () Bool)

(assert (= bs!38950 d!145609))

(assert (=> bs!38950 m!1244805))

(declare-fun m!1244873 () Bool)

(assert (=> bs!38950 m!1244873))

(assert (=> b!1358753 d!145609))

(declare-fun d!145611 () Bool)

(declare-fun lt!599655 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!676 (List!31744) (InoxSet (_ BitVec 64)))

(assert (=> d!145611 (= lt!599655 (select (content!676 lt!599637) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!771318 () Bool)

(assert (=> d!145611 (= lt!599655 e!771318)))

(declare-fun res!902804 () Bool)

(assert (=> d!145611 (=> (not res!902804) (not e!771318))))

(assert (=> d!145611 (= res!902804 ((_ is Cons!31740) lt!599637))))

(assert (=> d!145611 (= (contains!9456 lt!599637 #b0000000000000000000000000000000000000000000000000000000000000000) lt!599655)))

(declare-fun b!1358853 () Bool)

(declare-fun e!771319 () Bool)

(assert (=> b!1358853 (= e!771318 e!771319)))

(declare-fun res!902805 () Bool)

(assert (=> b!1358853 (=> res!902805 e!771319)))

(assert (=> b!1358853 (= res!902805 (= (h!32958 lt!599637) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1358854 () Bool)

(assert (=> b!1358854 (= e!771319 (contains!9456 (t!46397 lt!599637) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145611 res!902804) b!1358853))

(assert (= (and b!1358853 (not res!902805)) b!1358854))

(declare-fun m!1244875 () Bool)

(assert (=> d!145611 m!1244875))

(declare-fun m!1244877 () Bool)

(assert (=> d!145611 m!1244877))

(declare-fun m!1244879 () Bool)

(assert (=> b!1358854 m!1244879))

(assert (=> b!1358752 d!145611))

(declare-fun b!1358871 () Bool)

(declare-fun e!771336 () Bool)

(declare-fun call!65320 () Bool)

(assert (=> b!1358871 (= e!771336 call!65320)))

(declare-fun b!1358872 () Bool)

(declare-fun e!771337 () Bool)

(declare-fun e!771335 () Bool)

(assert (=> b!1358872 (= e!771337 e!771335)))

(declare-fun res!902818 () Bool)

(assert (=> b!1358872 (=> (not res!902818) (not e!771335))))

(declare-fun e!771333 () Bool)

(assert (=> b!1358872 (= res!902818 (not e!771333))))

(declare-fun res!902820 () Bool)

(assert (=> b!1358872 (=> (not res!902820) (not e!771333))))

(assert (=> b!1358872 (= res!902820 (validKeyInArray!0 (select (arr!44716 a!3742) from!3120)))))

(declare-fun b!1358873 () Bool)

(assert (=> b!1358873 (= e!771336 call!65320)))

(declare-fun b!1358874 () Bool)

(assert (=> b!1358874 (= e!771335 e!771336)))

(declare-fun c!127474 () Bool)

(assert (=> b!1358874 (= c!127474 (validKeyInArray!0 (select (arr!44716 a!3742) from!3120)))))

(declare-fun b!1358875 () Bool)

(assert (=> b!1358875 (= e!771333 (contains!9456 acc!759 (select (arr!44716 a!3742) from!3120)))))

(declare-fun bm!65317 () Bool)

(assert (=> bm!65317 (= call!65320 (arrayNoDuplicates!0 a!3742 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127474 (Cons!31740 (select (arr!44716 a!3742) from!3120) acc!759) acc!759)))))

(declare-fun d!145613 () Bool)

(declare-fun res!902819 () Bool)

(assert (=> d!145613 (=> res!902819 e!771337)))

(assert (=> d!145613 (= res!902819 (bvsge from!3120 (size!45267 a!3742)))))

(assert (=> d!145613 (= (arrayNoDuplicates!0 a!3742 from!3120 acc!759) e!771337)))

(assert (= (and d!145613 (not res!902819)) b!1358872))

(assert (= (and b!1358872 res!902820) b!1358875))

(assert (= (and b!1358872 res!902818) b!1358874))

(assert (= (and b!1358874 c!127474) b!1358873))

(assert (= (and b!1358874 (not c!127474)) b!1358871))

(assert (= (or b!1358873 b!1358871) bm!65317))

(assert (=> b!1358872 m!1244797))

(assert (=> b!1358872 m!1244797))

(assert (=> b!1358872 m!1244799))

(assert (=> b!1358874 m!1244797))

(assert (=> b!1358874 m!1244797))

(assert (=> b!1358874 m!1244799))

(assert (=> b!1358875 m!1244797))

(assert (=> b!1358875 m!1244797))

(declare-fun m!1244885 () Bool)

(assert (=> b!1358875 m!1244885))

(assert (=> bm!65317 m!1244797))

(declare-fun m!1244887 () Bool)

(assert (=> bm!65317 m!1244887))

(assert (=> b!1358751 d!145613))

(declare-fun d!145625 () Bool)

(assert (=> d!145625 (= (validKeyInArray!0 l!3587) (and (not (= l!3587 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= l!3587 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1358750 d!145625))

(declare-fun d!145627 () Bool)

(declare-fun res!902833 () Bool)

(declare-fun e!771350 () Bool)

(assert (=> d!145627 (=> res!902833 e!771350)))

(assert (=> d!145627 (= res!902833 ((_ is Nil!31741) lt!599637))))

(assert (=> d!145627 (= (noDuplicate!2287 lt!599637) e!771350)))

(declare-fun b!1358888 () Bool)

(declare-fun e!771352 () Bool)

(assert (=> b!1358888 (= e!771350 e!771352)))

(declare-fun res!902834 () Bool)

(assert (=> b!1358888 (=> (not res!902834) (not e!771352))))

(assert (=> b!1358888 (= res!902834 (not (contains!9456 (t!46397 lt!599637) (h!32958 lt!599637))))))

(declare-fun b!1358889 () Bool)

(assert (=> b!1358889 (= e!771352 (noDuplicate!2287 (t!46397 lt!599637)))))

(assert (= (and d!145627 (not res!902833)) b!1358888))

(assert (= (and b!1358888 res!902834) b!1358889))

(declare-fun m!1244895 () Bool)

(assert (=> b!1358888 m!1244895))

(declare-fun m!1244899 () Bool)

(assert (=> b!1358889 m!1244899))

(assert (=> b!1358749 d!145627))

(declare-fun d!145631 () Bool)

(assert (=> d!145631 (= (validKeyInArray!0 (select (arr!44716 a!3742) from!3120)) (and (not (= (select (arr!44716 a!3742) from!3120) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44716 a!3742) from!3120) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1358748 d!145631))

(declare-fun d!145635 () Bool)

(assert (=> d!145635 (= (array_inv!33997 a!3742) (bvsge (size!45267 a!3742) #b00000000000000000000000000000000))))

(assert (=> start!114520 d!145635))

(declare-fun d!145637 () Bool)

(declare-fun res!902841 () Bool)

(declare-fun e!771360 () Bool)

(assert (=> d!145637 (=> res!902841 e!771360)))

(assert (=> d!145637 (= res!902841 ((_ is Nil!31741) acc!759))))

(assert (=> d!145637 (= (noDuplicate!2287 acc!759) e!771360)))

(declare-fun b!1358900 () Bool)

(declare-fun e!771361 () Bool)

(assert (=> b!1358900 (= e!771360 e!771361)))

(declare-fun res!902842 () Bool)

(assert (=> b!1358900 (=> (not res!902842) (not e!771361))))

(assert (=> b!1358900 (= res!902842 (not (contains!9456 (t!46397 acc!759) (h!32958 acc!759))))))

(declare-fun b!1358901 () Bool)

(assert (=> b!1358901 (= e!771361 (noDuplicate!2287 (t!46397 acc!759)))))

(assert (= (and d!145637 (not res!902841)) b!1358900))

(assert (= (and b!1358900 res!902842) b!1358901))

(declare-fun m!1244905 () Bool)

(assert (=> b!1358900 m!1244905))

(declare-fun m!1244907 () Bool)

(assert (=> b!1358901 m!1244907))

(assert (=> b!1358747 d!145637))

(declare-fun b!1358904 () Bool)

(declare-fun e!771366 () Bool)

(declare-fun call!65323 () Bool)

(assert (=> b!1358904 (= e!771366 call!65323)))

(declare-fun b!1358905 () Bool)

(declare-fun e!771367 () Bool)

(declare-fun e!771365 () Bool)

(assert (=> b!1358905 (= e!771367 e!771365)))

(declare-fun res!902845 () Bool)

(assert (=> b!1358905 (=> (not res!902845) (not e!771365))))

(declare-fun e!771364 () Bool)

(assert (=> b!1358905 (= res!902845 (not e!771364))))

(declare-fun res!902847 () Bool)

(assert (=> b!1358905 (=> (not res!902847) (not e!771364))))

(assert (=> b!1358905 (= res!902847 (validKeyInArray!0 (select (arr!44716 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1358906 () Bool)

(assert (=> b!1358906 (= e!771366 call!65323)))

(declare-fun b!1358907 () Bool)

(assert (=> b!1358907 (= e!771365 e!771366)))

(declare-fun c!127477 () Bool)

(assert (=> b!1358907 (= c!127477 (validKeyInArray!0 (select (arr!44716 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1358908 () Bool)

(assert (=> b!1358908 (= e!771364 (contains!9456 Nil!31741 (select (arr!44716 a!3742) #b00000000000000000000000000000000)))))

(declare-fun bm!65320 () Bool)

(assert (=> bm!65320 (= call!65323 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!127477 (Cons!31740 (select (arr!44716 a!3742) #b00000000000000000000000000000000) Nil!31741) Nil!31741)))))

(declare-fun d!145641 () Bool)

(declare-fun res!902846 () Bool)

(assert (=> d!145641 (=> res!902846 e!771367)))

(assert (=> d!145641 (= res!902846 (bvsge #b00000000000000000000000000000000 (size!45267 a!3742)))))

(assert (=> d!145641 (= (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31741) e!771367)))

(assert (= (and d!145641 (not res!902846)) b!1358905))

(assert (= (and b!1358905 res!902847) b!1358908))

(assert (= (and b!1358905 res!902845) b!1358907))

(assert (= (and b!1358907 c!127477) b!1358906))

(assert (= (and b!1358907 (not c!127477)) b!1358904))

(assert (= (or b!1358906 b!1358904) bm!65320))

(declare-fun m!1244913 () Bool)

(assert (=> b!1358905 m!1244913))

(assert (=> b!1358905 m!1244913))

(declare-fun m!1244915 () Bool)

(assert (=> b!1358905 m!1244915))

(assert (=> b!1358907 m!1244913))

(assert (=> b!1358907 m!1244913))

(assert (=> b!1358907 m!1244915))

(assert (=> b!1358908 m!1244913))

(assert (=> b!1358908 m!1244913))

(declare-fun m!1244917 () Bool)

(assert (=> b!1358908 m!1244917))

(assert (=> bm!65320 m!1244913))

(declare-fun m!1244919 () Bool)

(assert (=> bm!65320 m!1244919))

(assert (=> b!1358757 d!145641))

(declare-fun d!145647 () Bool)

(declare-fun lt!599661 () Bool)

(assert (=> d!145647 (= lt!599661 (select (content!676 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!771368 () Bool)

(assert (=> d!145647 (= lt!599661 e!771368)))

(declare-fun res!902848 () Bool)

(assert (=> d!145647 (=> (not res!902848) (not e!771368))))

(assert (=> d!145647 (= res!902848 ((_ is Cons!31740) acc!759))))

(assert (=> d!145647 (= (contains!9456 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000) lt!599661)))

(declare-fun b!1358909 () Bool)

(declare-fun e!771369 () Bool)

(assert (=> b!1358909 (= e!771368 e!771369)))

(declare-fun res!902849 () Bool)

(assert (=> b!1358909 (=> res!902849 e!771369)))

(assert (=> b!1358909 (= res!902849 (= (h!32958 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1358910 () Bool)

(assert (=> b!1358910 (= e!771369 (contains!9456 (t!46397 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145647 res!902848) b!1358909))

(assert (= (and b!1358909 (not res!902849)) b!1358910))

(declare-fun m!1244921 () Bool)

(assert (=> d!145647 m!1244921))

(declare-fun m!1244923 () Bool)

(assert (=> d!145647 m!1244923))

(declare-fun m!1244925 () Bool)

(assert (=> b!1358910 m!1244925))

(assert (=> b!1358746 d!145647))

(declare-fun d!145649 () Bool)

(declare-fun lt!599662 () Bool)

(assert (=> d!145649 (= lt!599662 (select (content!676 lt!599637) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!771370 () Bool)

(assert (=> d!145649 (= lt!599662 e!771370)))

(declare-fun res!902850 () Bool)

(assert (=> d!145649 (=> (not res!902850) (not e!771370))))

(assert (=> d!145649 (= res!902850 ((_ is Cons!31740) lt!599637))))

(assert (=> d!145649 (= (contains!9456 lt!599637 #b1000000000000000000000000000000000000000000000000000000000000000) lt!599662)))

(declare-fun b!1358911 () Bool)

(declare-fun e!771371 () Bool)

(assert (=> b!1358911 (= e!771370 e!771371)))

(declare-fun res!902851 () Bool)

(assert (=> b!1358911 (=> res!902851 e!771371)))

(assert (=> b!1358911 (= res!902851 (= (h!32958 lt!599637) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1358912 () Bool)

(assert (=> b!1358912 (= e!771371 (contains!9456 (t!46397 lt!599637) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145649 res!902850) b!1358911))

(assert (= (and b!1358911 (not res!902851)) b!1358912))

(assert (=> d!145649 m!1244875))

(declare-fun m!1244927 () Bool)

(assert (=> d!145649 m!1244927))

(declare-fun m!1244929 () Bool)

(assert (=> b!1358912 m!1244929))

(assert (=> b!1358755 d!145649))

(declare-fun d!145651 () Bool)

(declare-fun lt!599663 () Bool)

(assert (=> d!145651 (= lt!599663 (select (content!676 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!771376 () Bool)

(assert (=> d!145651 (= lt!599663 e!771376)))

(declare-fun res!902855 () Bool)

(assert (=> d!145651 (=> (not res!902855) (not e!771376))))

(assert (=> d!145651 (= res!902855 ((_ is Cons!31740) acc!759))))

(assert (=> d!145651 (= (contains!9456 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000) lt!599663)))

(declare-fun b!1358918 () Bool)

(declare-fun e!771377 () Bool)

(assert (=> b!1358918 (= e!771376 e!771377)))

(declare-fun res!902856 () Bool)

(assert (=> b!1358918 (=> res!902856 e!771377)))

(assert (=> b!1358918 (= res!902856 (= (h!32958 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1358919 () Bool)

(assert (=> b!1358919 (= e!771377 (contains!9456 (t!46397 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145651 res!902855) b!1358918))

(assert (= (and b!1358918 (not res!902856)) b!1358919))

(assert (=> d!145651 m!1244921))

(declare-fun m!1244931 () Bool)

(assert (=> d!145651 m!1244931))

(declare-fun m!1244933 () Bool)

(assert (=> b!1358919 m!1244933))

(assert (=> b!1358754 d!145651))

(check-sat (not b!1358875) (not bm!65317) (not bm!65320) (not b!1358910) (not d!145651) (not b!1358912) (not d!145609) (not b!1358848) (not b!1358900) (not b!1358905) (not b!1358872) (not b!1358854) (not b!1358847) (not b!1358901) (not d!145649) (not b!1358919) (not b!1358908) (not d!145647) (not b!1358888) (not b!1358889) (not b!1358907) (not d!145611) (not b!1358874))
(check-sat)
