; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103060 () Bool)

(assert start!103060)

(declare-fun b!1237712 () Bool)

(declare-fun res!825547 () Bool)

(declare-fun e!701489 () Bool)

(assert (=> b!1237712 (=> (not res!825547) (not e!701489))))

(declare-datatypes ((List!27336 0))(
  ( (Nil!27333) (Cons!27332 (h!28541 (_ BitVec 64)) (t!40790 List!27336)) )
))
(declare-fun acc!846 () List!27336)

(declare-fun k0!2925 () (_ BitVec 64))

(declare-fun contains!7308 (List!27336 (_ BitVec 64)) Bool)

(assert (=> b!1237712 (= res!825547 (contains!7308 acc!846 k0!2925))))

(declare-fun b!1237713 () Bool)

(declare-fun res!825550 () Bool)

(declare-fun e!701488 () Bool)

(assert (=> b!1237713 (=> res!825550 e!701488)))

(declare-fun lt!560954 () List!27336)

(declare-fun noDuplicate!1951 (List!27336) Bool)

(assert (=> b!1237713 (= res!825550 (not (noDuplicate!1951 lt!560954)))))

(declare-fun res!825549 () Bool)

(assert (=> start!103060 (=> (not res!825549) (not e!701489))))

(declare-datatypes ((array!79714 0))(
  ( (array!79715 (arr!38462 (Array (_ BitVec 32) (_ BitVec 64))) (size!39000 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79714)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!103060 (= res!825549 (and (bvslt (size!39000 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39000 a!3835))))))

(assert (=> start!103060 e!701489))

(declare-fun array_inv!29445 (array!79714) Bool)

(assert (=> start!103060 (array_inv!29445 a!3835)))

(assert (=> start!103060 true))

(declare-fun b!1237714 () Bool)

(declare-fun res!825551 () Bool)

(assert (=> b!1237714 (=> (not res!825551) (not e!701489))))

(assert (=> b!1237714 (= res!825551 (not (= from!3213 (bvsub (size!39000 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1237715 () Bool)

(declare-fun res!825552 () Bool)

(assert (=> b!1237715 (=> (not res!825552) (not e!701489))))

(declare-fun arrayNoDuplicates!0 (array!79714 (_ BitVec 32) List!27336) Bool)

(assert (=> b!1237715 (= res!825552 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1237716 () Bool)

(declare-fun res!825553 () Bool)

(assert (=> b!1237716 (=> (not res!825553) (not e!701489))))

(assert (=> b!1237716 (= res!825553 (noDuplicate!1951 acc!846))))

(declare-fun b!1237717 () Bool)

(declare-fun e!701486 () Bool)

(assert (=> b!1237717 (= e!701486 (not (contains!7308 lt!560954 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1237718 () Bool)

(declare-fun res!825544 () Bool)

(assert (=> b!1237718 (=> (not res!825544) (not e!701489))))

(assert (=> b!1237718 (= res!825544 (not (contains!7308 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1237719 () Bool)

(assert (=> b!1237719 (= e!701488 e!701486)))

(declare-fun res!825545 () Bool)

(assert (=> b!1237719 (=> (not res!825545) (not e!701486))))

(assert (=> b!1237719 (= res!825545 (not (contains!7308 lt!560954 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1237720 () Bool)

(assert (=> b!1237720 (= e!701489 (not e!701488))))

(declare-fun res!825548 () Bool)

(assert (=> b!1237720 (=> res!825548 e!701488)))

(assert (=> b!1237720 (= res!825548 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-fun subseq!590 (List!27336 List!27336) Bool)

(assert (=> b!1237720 (subseq!590 acc!846 lt!560954)))

(declare-datatypes ((Unit!40929 0))(
  ( (Unit!40930) )
))
(declare-fun lt!560952 () Unit!40929)

(declare-fun subseqTail!77 (List!27336 List!27336) Unit!40929)

(assert (=> b!1237720 (= lt!560952 (subseqTail!77 lt!560954 lt!560954))))

(assert (=> b!1237720 (subseq!590 lt!560954 lt!560954)))

(declare-fun lt!560953 () Unit!40929)

(declare-fun lemmaListSubSeqRefl!0 (List!27336) Unit!40929)

(assert (=> b!1237720 (= lt!560953 (lemmaListSubSeqRefl!0 lt!560954))))

(assert (=> b!1237720 (= lt!560954 (Cons!27332 (select (arr!38462 a!3835) from!3213) acc!846))))

(declare-fun b!1237721 () Bool)

(declare-fun res!825554 () Bool)

(assert (=> b!1237721 (=> (not res!825554) (not e!701489))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1237721 (= res!825554 (validKeyInArray!0 (select (arr!38462 a!3835) from!3213)))))

(declare-fun b!1237722 () Bool)

(declare-fun res!825546 () Bool)

(assert (=> b!1237722 (=> (not res!825546) (not e!701489))))

(assert (=> b!1237722 (= res!825546 (not (contains!7308 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!103060 res!825549) b!1237716))

(assert (= (and b!1237716 res!825553) b!1237722))

(assert (= (and b!1237722 res!825546) b!1237718))

(assert (= (and b!1237718 res!825544) b!1237715))

(assert (= (and b!1237715 res!825552) b!1237712))

(assert (= (and b!1237712 res!825547) b!1237714))

(assert (= (and b!1237714 res!825551) b!1237721))

(assert (= (and b!1237721 res!825554) b!1237720))

(assert (= (and b!1237720 (not res!825548)) b!1237713))

(assert (= (and b!1237713 (not res!825550)) b!1237719))

(assert (= (and b!1237719 res!825545) b!1237717))

(declare-fun m!1140921 () Bool)

(assert (=> b!1237717 m!1140921))

(declare-fun m!1140923 () Bool)

(assert (=> start!103060 m!1140923))

(declare-fun m!1140925 () Bool)

(assert (=> b!1237719 m!1140925))

(declare-fun m!1140927 () Bool)

(assert (=> b!1237715 m!1140927))

(declare-fun m!1140929 () Bool)

(assert (=> b!1237716 m!1140929))

(declare-fun m!1140931 () Bool)

(assert (=> b!1237713 m!1140931))

(declare-fun m!1140933 () Bool)

(assert (=> b!1237718 m!1140933))

(declare-fun m!1140935 () Bool)

(assert (=> b!1237722 m!1140935))

(declare-fun m!1140937 () Bool)

(assert (=> b!1237712 m!1140937))

(declare-fun m!1140939 () Bool)

(assert (=> b!1237720 m!1140939))

(declare-fun m!1140941 () Bool)

(assert (=> b!1237720 m!1140941))

(declare-fun m!1140943 () Bool)

(assert (=> b!1237720 m!1140943))

(declare-fun m!1140945 () Bool)

(assert (=> b!1237720 m!1140945))

(declare-fun m!1140947 () Bool)

(assert (=> b!1237720 m!1140947))

(assert (=> b!1237721 m!1140947))

(assert (=> b!1237721 m!1140947))

(declare-fun m!1140949 () Bool)

(assert (=> b!1237721 m!1140949))

(check-sat (not b!1237719) (not b!1237718) (not b!1237713) (not b!1237720) (not b!1237716) (not b!1237722) (not start!103060) (not b!1237717) (not b!1237715) (not b!1237712) (not b!1237721))
(check-sat)
(get-model)

(declare-fun d!135645 () Bool)

(declare-fun res!825625 () Bool)

(declare-fun e!701518 () Bool)

(assert (=> d!135645 (=> res!825625 e!701518)))

(get-info :version)

(assert (=> d!135645 (= res!825625 ((_ is Nil!27333) acc!846))))

(assert (=> d!135645 (= (noDuplicate!1951 acc!846) e!701518)))

(declare-fun b!1237793 () Bool)

(declare-fun e!701519 () Bool)

(assert (=> b!1237793 (= e!701518 e!701519)))

(declare-fun res!825626 () Bool)

(assert (=> b!1237793 (=> (not res!825626) (not e!701519))))

(assert (=> b!1237793 (= res!825626 (not (contains!7308 (t!40790 acc!846) (h!28541 acc!846))))))

(declare-fun b!1237794 () Bool)

(assert (=> b!1237794 (= e!701519 (noDuplicate!1951 (t!40790 acc!846)))))

(assert (= (and d!135645 (not res!825625)) b!1237793))

(assert (= (and b!1237793 res!825626) b!1237794))

(declare-fun m!1141011 () Bool)

(assert (=> b!1237793 m!1141011))

(declare-fun m!1141013 () Bool)

(assert (=> b!1237794 m!1141013))

(assert (=> b!1237716 d!135645))

(declare-fun d!135647 () Bool)

(declare-fun lt!560975 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!587 (List!27336) (InoxSet (_ BitVec 64)))

(assert (=> d!135647 (= lt!560975 (select (content!587 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!701525 () Bool)

(assert (=> d!135647 (= lt!560975 e!701525)))

(declare-fun res!825632 () Bool)

(assert (=> d!135647 (=> (not res!825632) (not e!701525))))

(assert (=> d!135647 (= res!825632 ((_ is Cons!27332) acc!846))))

(assert (=> d!135647 (= (contains!7308 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000) lt!560975)))

(declare-fun b!1237799 () Bool)

(declare-fun e!701524 () Bool)

(assert (=> b!1237799 (= e!701525 e!701524)))

(declare-fun res!825631 () Bool)

(assert (=> b!1237799 (=> res!825631 e!701524)))

(assert (=> b!1237799 (= res!825631 (= (h!28541 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1237800 () Bool)

(assert (=> b!1237800 (= e!701524 (contains!7308 (t!40790 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135647 res!825632) b!1237799))

(assert (= (and b!1237799 (not res!825631)) b!1237800))

(declare-fun m!1141015 () Bool)

(assert (=> d!135647 m!1141015))

(declare-fun m!1141017 () Bool)

(assert (=> d!135647 m!1141017))

(declare-fun m!1141019 () Bool)

(assert (=> b!1237800 m!1141019))

(assert (=> b!1237722 d!135647))

(declare-fun d!135651 () Bool)

(declare-fun lt!560976 () Bool)

(assert (=> d!135651 (= lt!560976 (select (content!587 lt!560954) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!701527 () Bool)

(assert (=> d!135651 (= lt!560976 e!701527)))

(declare-fun res!825634 () Bool)

(assert (=> d!135651 (=> (not res!825634) (not e!701527))))

(assert (=> d!135651 (= res!825634 ((_ is Cons!27332) lt!560954))))

(assert (=> d!135651 (= (contains!7308 lt!560954 #b1000000000000000000000000000000000000000000000000000000000000000) lt!560976)))

(declare-fun b!1237801 () Bool)

(declare-fun e!701526 () Bool)

(assert (=> b!1237801 (= e!701527 e!701526)))

(declare-fun res!825633 () Bool)

(assert (=> b!1237801 (=> res!825633 e!701526)))

(assert (=> b!1237801 (= res!825633 (= (h!28541 lt!560954) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1237802 () Bool)

(assert (=> b!1237802 (= e!701526 (contains!7308 (t!40790 lt!560954) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135651 res!825634) b!1237801))

(assert (= (and b!1237801 (not res!825633)) b!1237802))

(declare-fun m!1141021 () Bool)

(assert (=> d!135651 m!1141021))

(declare-fun m!1141023 () Bool)

(assert (=> d!135651 m!1141023))

(declare-fun m!1141025 () Bool)

(assert (=> b!1237802 m!1141025))

(assert (=> b!1237717 d!135651))

(declare-fun d!135653 () Bool)

(declare-fun lt!560979 () Bool)

(assert (=> d!135653 (= lt!560979 (select (content!587 acc!846) k0!2925))))

(declare-fun e!701533 () Bool)

(assert (=> d!135653 (= lt!560979 e!701533)))

(declare-fun res!825640 () Bool)

(assert (=> d!135653 (=> (not res!825640) (not e!701533))))

(assert (=> d!135653 (= res!825640 ((_ is Cons!27332) acc!846))))

(assert (=> d!135653 (= (contains!7308 acc!846 k0!2925) lt!560979)))

(declare-fun b!1237805 () Bool)

(declare-fun e!701532 () Bool)

(assert (=> b!1237805 (= e!701533 e!701532)))

(declare-fun res!825639 () Bool)

(assert (=> b!1237805 (=> res!825639 e!701532)))

(assert (=> b!1237805 (= res!825639 (= (h!28541 acc!846) k0!2925))))

(declare-fun b!1237806 () Bool)

(assert (=> b!1237806 (= e!701532 (contains!7308 (t!40790 acc!846) k0!2925))))

(assert (= (and d!135653 res!825640) b!1237805))

(assert (= (and b!1237805 (not res!825639)) b!1237806))

(assert (=> d!135653 m!1141015))

(declare-fun m!1141027 () Bool)

(assert (=> d!135653 m!1141027))

(declare-fun m!1141029 () Bool)

(assert (=> b!1237806 m!1141029))

(assert (=> b!1237712 d!135653))

(declare-fun d!135655 () Bool)

(declare-fun lt!560980 () Bool)

(assert (=> d!135655 (= lt!560980 (select (content!587 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!701535 () Bool)

(assert (=> d!135655 (= lt!560980 e!701535)))

(declare-fun res!825642 () Bool)

(assert (=> d!135655 (=> (not res!825642) (not e!701535))))

(assert (=> d!135655 (= res!825642 ((_ is Cons!27332) acc!846))))

(assert (=> d!135655 (= (contains!7308 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000) lt!560980)))

(declare-fun b!1237809 () Bool)

(declare-fun e!701534 () Bool)

(assert (=> b!1237809 (= e!701535 e!701534)))

(declare-fun res!825641 () Bool)

(assert (=> b!1237809 (=> res!825641 e!701534)))

(assert (=> b!1237809 (= res!825641 (= (h!28541 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1237810 () Bool)

(assert (=> b!1237810 (= e!701534 (contains!7308 (t!40790 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135655 res!825642) b!1237809))

(assert (= (and b!1237809 (not res!825641)) b!1237810))

(assert (=> d!135655 m!1141015))

(declare-fun m!1141031 () Bool)

(assert (=> d!135655 m!1141031))

(declare-fun m!1141033 () Bool)

(assert (=> b!1237810 m!1141033))

(assert (=> b!1237718 d!135655))

(declare-fun d!135657 () Bool)

(declare-fun res!825645 () Bool)

(declare-fun e!701538 () Bool)

(assert (=> d!135657 (=> res!825645 e!701538)))

(assert (=> d!135657 (= res!825645 ((_ is Nil!27333) lt!560954))))

(assert (=> d!135657 (= (noDuplicate!1951 lt!560954) e!701538)))

(declare-fun b!1237813 () Bool)

(declare-fun e!701539 () Bool)

(assert (=> b!1237813 (= e!701538 e!701539)))

(declare-fun res!825646 () Bool)

(assert (=> b!1237813 (=> (not res!825646) (not e!701539))))

(assert (=> b!1237813 (= res!825646 (not (contains!7308 (t!40790 lt!560954) (h!28541 lt!560954))))))

(declare-fun b!1237814 () Bool)

(assert (=> b!1237814 (= e!701539 (noDuplicate!1951 (t!40790 lt!560954)))))

(assert (= (and d!135657 (not res!825645)) b!1237813))

(assert (= (and b!1237813 res!825646) b!1237814))

(declare-fun m!1141037 () Bool)

(assert (=> b!1237813 m!1141037))

(declare-fun m!1141041 () Bool)

(assert (=> b!1237814 m!1141041))

(assert (=> b!1237713 d!135657))

(declare-fun d!135659 () Bool)

(declare-fun lt!560982 () Bool)

(assert (=> d!135659 (= lt!560982 (select (content!587 lt!560954) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!701541 () Bool)

(assert (=> d!135659 (= lt!560982 e!701541)))

(declare-fun res!825648 () Bool)

(assert (=> d!135659 (=> (not res!825648) (not e!701541))))

(assert (=> d!135659 (= res!825648 ((_ is Cons!27332) lt!560954))))

(assert (=> d!135659 (= (contains!7308 lt!560954 #b0000000000000000000000000000000000000000000000000000000000000000) lt!560982)))

(declare-fun b!1237815 () Bool)

(declare-fun e!701540 () Bool)

(assert (=> b!1237815 (= e!701541 e!701540)))

(declare-fun res!825647 () Bool)

(assert (=> b!1237815 (=> res!825647 e!701540)))

(assert (=> b!1237815 (= res!825647 (= (h!28541 lt!560954) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1237816 () Bool)

(assert (=> b!1237816 (= e!701540 (contains!7308 (t!40790 lt!560954) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135659 res!825648) b!1237815))

(assert (= (and b!1237815 (not res!825647)) b!1237816))

(assert (=> d!135659 m!1141021))

(declare-fun m!1141045 () Bool)

(assert (=> d!135659 m!1141045))

(declare-fun m!1141047 () Bool)

(assert (=> b!1237816 m!1141047))

(assert (=> b!1237719 d!135659))

(declare-fun b!1237833 () Bool)

(declare-fun e!701558 () Bool)

(assert (=> b!1237833 (= e!701558 (subseq!590 (t!40790 acc!846) (t!40790 lt!560954)))))

(declare-fun b!1237831 () Bool)

(declare-fun e!701556 () Bool)

(declare-fun e!701559 () Bool)

(assert (=> b!1237831 (= e!701556 e!701559)))

(declare-fun res!825666 () Bool)

(assert (=> b!1237831 (=> (not res!825666) (not e!701559))))

(assert (=> b!1237831 (= res!825666 ((_ is Cons!27332) lt!560954))))

(declare-fun b!1237832 () Bool)

(declare-fun e!701557 () Bool)

(assert (=> b!1237832 (= e!701559 e!701557)))

(declare-fun res!825664 () Bool)

(assert (=> b!1237832 (=> res!825664 e!701557)))

(assert (=> b!1237832 (= res!825664 e!701558)))

(declare-fun res!825663 () Bool)

(assert (=> b!1237832 (=> (not res!825663) (not e!701558))))

(assert (=> b!1237832 (= res!825663 (= (h!28541 acc!846) (h!28541 lt!560954)))))

(declare-fun d!135663 () Bool)

(declare-fun res!825665 () Bool)

(assert (=> d!135663 (=> res!825665 e!701556)))

(assert (=> d!135663 (= res!825665 ((_ is Nil!27333) acc!846))))

(assert (=> d!135663 (= (subseq!590 acc!846 lt!560954) e!701556)))

(declare-fun b!1237834 () Bool)

(assert (=> b!1237834 (= e!701557 (subseq!590 acc!846 (t!40790 lt!560954)))))

(assert (= (and d!135663 (not res!825665)) b!1237831))

(assert (= (and b!1237831 res!825666) b!1237832))

(assert (= (and b!1237832 res!825663) b!1237833))

(assert (= (and b!1237832 (not res!825664)) b!1237834))

(declare-fun m!1141053 () Bool)

(assert (=> b!1237833 m!1141053))

(declare-fun m!1141055 () Bool)

(assert (=> b!1237834 m!1141055))

(assert (=> b!1237720 d!135663))

(declare-fun bm!61020 () Bool)

(declare-fun call!61023 () Unit!40929)

(declare-fun c!120957 () Bool)

(assert (=> bm!61020 (= call!61023 (subseqTail!77 (ite c!120957 lt!560954 (t!40790 lt!560954)) (t!40790 lt!560954)))))

(declare-fun b!1237900 () Bool)

(declare-fun c!120956 () Bool)

(declare-fun isEmpty!1018 (List!27336) Bool)

(assert (=> b!1237900 (= c!120956 (not (isEmpty!1018 (t!40790 lt!560954))))))

(declare-fun e!701616 () Unit!40929)

(declare-fun e!701617 () Unit!40929)

(assert (=> b!1237900 (= e!701616 e!701617)))

(declare-fun b!1237901 () Bool)

(declare-fun e!701619 () Unit!40929)

(assert (=> b!1237901 (= e!701619 e!701616)))

(assert (=> b!1237901 (= c!120957 (subseq!590 lt!560954 (t!40790 lt!560954)))))

(declare-fun b!1237902 () Bool)

(assert (=> b!1237902 (= e!701616 call!61023)))

(declare-fun b!1237903 () Bool)

(declare-fun Unit!40936 () Unit!40929)

(assert (=> b!1237903 (= e!701617 Unit!40936)))

(declare-fun b!1237904 () Bool)

(declare-fun e!701618 () Bool)

(assert (=> b!1237904 (= e!701618 (subseq!590 lt!560954 lt!560954))))

(declare-fun d!135673 () Bool)

(declare-fun tail!164 (List!27336) List!27336)

(assert (=> d!135673 (subseq!590 (tail!164 lt!560954) lt!560954)))

(declare-fun lt!560993 () Unit!40929)

(assert (=> d!135673 (= lt!560993 e!701619)))

(declare-fun c!120958 () Bool)

(assert (=> d!135673 (= c!120958 (and ((_ is Cons!27332) lt!560954) ((_ is Cons!27332) lt!560954)))))

(assert (=> d!135673 e!701618))

(declare-fun res!825714 () Bool)

(assert (=> d!135673 (=> (not res!825714) (not e!701618))))

(assert (=> d!135673 (= res!825714 (not (isEmpty!1018 lt!560954)))))

(assert (=> d!135673 (= (subseqTail!77 lt!560954 lt!560954) lt!560993)))

(declare-fun b!1237905 () Bool)

(declare-fun Unit!40938 () Unit!40929)

(assert (=> b!1237905 (= e!701619 Unit!40938)))

(declare-fun b!1237906 () Bool)

(assert (=> b!1237906 (= e!701617 call!61023)))

(assert (= (and d!135673 res!825714) b!1237904))

(assert (= (and d!135673 c!120958) b!1237901))

(assert (= (and d!135673 (not c!120958)) b!1237905))

(assert (= (and b!1237901 c!120957) b!1237902))

(assert (= (and b!1237901 (not c!120957)) b!1237900))

(assert (= (and b!1237900 c!120956) b!1237906))

(assert (= (and b!1237900 (not c!120956)) b!1237903))

(assert (= (or b!1237902 b!1237906) bm!61020))

(assert (=> b!1237904 m!1140939))

(declare-fun m!1141103 () Bool)

(assert (=> bm!61020 m!1141103))

(declare-fun m!1141105 () Bool)

(assert (=> b!1237901 m!1141105))

(declare-fun m!1141107 () Bool)

(assert (=> b!1237900 m!1141107))

(declare-fun m!1141109 () Bool)

(assert (=> d!135673 m!1141109))

(assert (=> d!135673 m!1141109))

(declare-fun m!1141111 () Bool)

(assert (=> d!135673 m!1141111))

(declare-fun m!1141113 () Bool)

(assert (=> d!135673 m!1141113))

(assert (=> b!1237720 d!135673))

(declare-fun b!1237909 () Bool)

(declare-fun e!701622 () Bool)

(assert (=> b!1237909 (= e!701622 (subseq!590 (t!40790 lt!560954) (t!40790 lt!560954)))))

(declare-fun b!1237907 () Bool)

(declare-fun e!701620 () Bool)

(declare-fun e!701623 () Bool)

(assert (=> b!1237907 (= e!701620 e!701623)))

(declare-fun res!825718 () Bool)

(assert (=> b!1237907 (=> (not res!825718) (not e!701623))))

(assert (=> b!1237907 (= res!825718 ((_ is Cons!27332) lt!560954))))

(declare-fun b!1237908 () Bool)

(declare-fun e!701621 () Bool)

(assert (=> b!1237908 (= e!701623 e!701621)))

(declare-fun res!825716 () Bool)

(assert (=> b!1237908 (=> res!825716 e!701621)))

(assert (=> b!1237908 (= res!825716 e!701622)))

(declare-fun res!825715 () Bool)

(assert (=> b!1237908 (=> (not res!825715) (not e!701622))))

(assert (=> b!1237908 (= res!825715 (= (h!28541 lt!560954) (h!28541 lt!560954)))))

(declare-fun d!135695 () Bool)

(declare-fun res!825717 () Bool)

(assert (=> d!135695 (=> res!825717 e!701620)))

(assert (=> d!135695 (= res!825717 ((_ is Nil!27333) lt!560954))))

(assert (=> d!135695 (= (subseq!590 lt!560954 lt!560954) e!701620)))

(declare-fun b!1237910 () Bool)

(assert (=> b!1237910 (= e!701621 (subseq!590 lt!560954 (t!40790 lt!560954)))))

(assert (= (and d!135695 (not res!825717)) b!1237907))

(assert (= (and b!1237907 res!825718) b!1237908))

(assert (= (and b!1237908 res!825715) b!1237909))

(assert (= (and b!1237908 (not res!825716)) b!1237910))

(declare-fun m!1141115 () Bool)

(assert (=> b!1237909 m!1141115))

(assert (=> b!1237910 m!1141105))

(assert (=> b!1237720 d!135695))

(declare-fun d!135697 () Bool)

(assert (=> d!135697 (subseq!590 lt!560954 lt!560954)))

(declare-fun lt!560996 () Unit!40929)

(declare-fun choose!36 (List!27336) Unit!40929)

(assert (=> d!135697 (= lt!560996 (choose!36 lt!560954))))

(assert (=> d!135697 (= (lemmaListSubSeqRefl!0 lt!560954) lt!560996)))

(declare-fun bs!34780 () Bool)

(assert (= bs!34780 d!135697))

(assert (=> bs!34780 m!1140939))

(declare-fun m!1141117 () Bool)

(assert (=> bs!34780 m!1141117))

(assert (=> b!1237720 d!135697))

(declare-fun d!135699 () Bool)

(assert (=> d!135699 (= (array_inv!29445 a!3835) (bvsge (size!39000 a!3835) #b00000000000000000000000000000000))))

(assert (=> start!103060 d!135699))

(declare-fun b!1237972 () Bool)

(declare-fun e!701669 () Bool)

(declare-fun e!701668 () Bool)

(assert (=> b!1237972 (= e!701669 e!701668)))

(declare-fun c!120976 () Bool)

(assert (=> b!1237972 (= c!120976 (validKeyInArray!0 (select (arr!38462 a!3835) from!3213)))))

(declare-fun b!1237973 () Bool)

(declare-fun e!701670 () Bool)

(assert (=> b!1237973 (= e!701670 e!701669)))

(declare-fun res!825748 () Bool)

(assert (=> b!1237973 (=> (not res!825748) (not e!701669))))

(declare-fun e!701671 () Bool)

(assert (=> b!1237973 (= res!825748 (not e!701671))))

(declare-fun res!825747 () Bool)

(assert (=> b!1237973 (=> (not res!825747) (not e!701671))))

(assert (=> b!1237973 (= res!825747 (validKeyInArray!0 (select (arr!38462 a!3835) from!3213)))))

(declare-fun d!135701 () Bool)

(declare-fun res!825746 () Bool)

(assert (=> d!135701 (=> res!825746 e!701670)))

(assert (=> d!135701 (= res!825746 (bvsge from!3213 (size!39000 a!3835)))))

(assert (=> d!135701 (= (arrayNoDuplicates!0 a!3835 from!3213 acc!846) e!701670)))

(declare-fun b!1237974 () Bool)

(declare-fun call!61029 () Bool)

(assert (=> b!1237974 (= e!701668 call!61029)))

(declare-fun b!1237975 () Bool)

(assert (=> b!1237975 (= e!701668 call!61029)))

(declare-fun bm!61026 () Bool)

(assert (=> bm!61026 (= call!61029 (arrayNoDuplicates!0 a!3835 (bvadd from!3213 #b00000000000000000000000000000001) (ite c!120976 (Cons!27332 (select (arr!38462 a!3835) from!3213) acc!846) acc!846)))))

(declare-fun b!1237976 () Bool)

(assert (=> b!1237976 (= e!701671 (contains!7308 acc!846 (select (arr!38462 a!3835) from!3213)))))

(assert (= (and d!135701 (not res!825746)) b!1237973))

(assert (= (and b!1237973 res!825747) b!1237976))

(assert (= (and b!1237973 res!825748) b!1237972))

(assert (= (and b!1237972 c!120976) b!1237975))

(assert (= (and b!1237972 (not c!120976)) b!1237974))

(assert (= (or b!1237975 b!1237974) bm!61026))

(assert (=> b!1237972 m!1140947))

(assert (=> b!1237972 m!1140947))

(assert (=> b!1237972 m!1140949))

(assert (=> b!1237973 m!1140947))

(assert (=> b!1237973 m!1140947))

(assert (=> b!1237973 m!1140949))

(assert (=> bm!61026 m!1140947))

(declare-fun m!1141137 () Bool)

(assert (=> bm!61026 m!1141137))

(assert (=> b!1237976 m!1140947))

(assert (=> b!1237976 m!1140947))

(declare-fun m!1141139 () Bool)

(assert (=> b!1237976 m!1141139))

(assert (=> b!1237715 d!135701))

(declare-fun d!135709 () Bool)

(assert (=> d!135709 (= (validKeyInArray!0 (select (arr!38462 a!3835) from!3213)) (and (not (= (select (arr!38462 a!3835) from!3213) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38462 a!3835) from!3213) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1237721 d!135709))

(check-sat (not d!135653) (not b!1237793) (not b!1237800) (not b!1237910) (not b!1237900) (not b!1237904) (not d!135655) (not bm!61020) (not b!1237814) (not b!1237972) (not b!1237802) (not d!135673) (not b!1237810) (not b!1237794) (not b!1237833) (not d!135659) (not d!135697) (not d!135651) (not b!1237976) (not b!1237973) (not b!1237909) (not b!1237806) (not b!1237834) (not d!135647) (not b!1237816) (not b!1237901) (not b!1237813) (not bm!61026))
(check-sat)
