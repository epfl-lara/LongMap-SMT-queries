; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115744 () Bool)

(assert start!115744)

(declare-fun res!912345 () Bool)

(declare-fun e!775434 () Bool)

(assert (=> start!115744 (=> (not res!912345) (not e!775434))))

(declare-datatypes ((array!92936 0))(
  ( (array!92937 (arr!44892 (Array (_ BitVec 32) (_ BitVec 64))) (size!45442 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92936)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115744 (= res!912345 (and (bvslt (size!45442 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45442 a!3861))))))

(assert (=> start!115744 e!775434))

(declare-fun array_inv!33920 (array!92936) Bool)

(assert (=> start!115744 (array_inv!33920 a!3861)))

(assert (=> start!115744 true))

(declare-fun b!1368830 () Bool)

(declare-fun res!912340 () Bool)

(assert (=> b!1368830 (=> (not res!912340) (not e!775434))))

(declare-datatypes ((List!31960 0))(
  ( (Nil!31957) (Cons!31956 (h!33165 (_ BitVec 64)) (t!46654 List!31960)) )
))
(declare-fun newAcc!98 () List!31960)

(declare-fun contains!9642 (List!31960 (_ BitVec 64)) Bool)

(assert (=> b!1368830 (= res!912340 (not (contains!9642 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368831 () Bool)

(declare-fun res!912347 () Bool)

(declare-fun e!775435 () Bool)

(assert (=> b!1368831 (=> (not res!912347) (not e!775435))))

(declare-fun acc!866 () List!31960)

(declare-fun arrayNoDuplicates!0 (array!92936 (_ BitVec 32) List!31960) Bool)

(assert (=> b!1368831 (= res!912347 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun b!1368832 () Bool)

(declare-fun res!912342 () Bool)

(assert (=> b!1368832 (=> (not res!912342) (not e!775435))))

(assert (=> b!1368832 (= res!912342 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1368833 () Bool)

(declare-fun res!912341 () Bool)

(assert (=> b!1368833 (=> (not res!912341) (not e!775434))))

(assert (=> b!1368833 (= res!912341 (not (contains!9642 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368834 () Bool)

(assert (=> b!1368834 (= e!775434 e!775435)))

(declare-fun res!912348 () Bool)

(assert (=> b!1368834 (=> (not res!912348) (not e!775435))))

(assert (=> b!1368834 (= res!912348 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45221 0))(
  ( (Unit!45222) )
))
(declare-fun lt!602133 () Unit!45221)

(declare-fun noDuplicateSubseq!231 (List!31960 List!31960) Unit!45221)

(assert (=> b!1368834 (= lt!602133 (noDuplicateSubseq!231 newAcc!98 acc!866))))

(declare-fun b!1368835 () Bool)

(declare-fun res!912339 () Bool)

(assert (=> b!1368835 (=> (not res!912339) (not e!775434))))

(declare-fun subseq!1044 (List!31960 List!31960) Bool)

(assert (=> b!1368835 (= res!912339 (subseq!1044 newAcc!98 acc!866))))

(declare-fun b!1368836 () Bool)

(declare-fun res!912349 () Bool)

(assert (=> b!1368836 (=> (not res!912349) (not e!775435))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1368836 (= res!912349 (not (validKeyInArray!0 (select (arr!44892 a!3861) from!3239))))))

(declare-fun b!1368837 () Bool)

(declare-fun res!912343 () Bool)

(assert (=> b!1368837 (=> (not res!912343) (not e!775434))))

(assert (=> b!1368837 (= res!912343 (not (contains!9642 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368838 () Bool)

(declare-fun res!912346 () Bool)

(assert (=> b!1368838 (=> (not res!912346) (not e!775434))))

(assert (=> b!1368838 (= res!912346 (not (contains!9642 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368839 () Bool)

(declare-fun res!912344 () Bool)

(assert (=> b!1368839 (=> (not res!912344) (not e!775435))))

(assert (=> b!1368839 (= res!912344 (bvslt from!3239 (size!45442 a!3861)))))

(declare-fun b!1368840 () Bool)

(declare-fun noDuplicate!2499 (List!31960) Bool)

(assert (=> b!1368840 (= e!775435 (not (noDuplicate!2499 newAcc!98)))))

(assert (=> b!1368840 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) newAcc!98)))

(declare-fun lt!602134 () Unit!45221)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92936 List!31960 List!31960 (_ BitVec 32)) Unit!45221)

(assert (=> b!1368840 (= lt!602134 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 acc!866 newAcc!98 (bvadd #b00000000000000000000000000000001 from!3239)))))

(declare-fun b!1368841 () Bool)

(declare-fun res!912338 () Bool)

(assert (=> b!1368841 (=> (not res!912338) (not e!775434))))

(assert (=> b!1368841 (= res!912338 (noDuplicate!2499 acc!866))))

(assert (= (and start!115744 res!912345) b!1368841))

(assert (= (and b!1368841 res!912338) b!1368838))

(assert (= (and b!1368838 res!912346) b!1368833))

(assert (= (and b!1368833 res!912341) b!1368830))

(assert (= (and b!1368830 res!912340) b!1368837))

(assert (= (and b!1368837 res!912343) b!1368835))

(assert (= (and b!1368835 res!912339) b!1368834))

(assert (= (and b!1368834 res!912348) b!1368839))

(assert (= (and b!1368839 res!912344) b!1368836))

(assert (= (and b!1368836 res!912349) b!1368832))

(assert (= (and b!1368832 res!912342) b!1368831))

(assert (= (and b!1368831 res!912347) b!1368840))

(declare-fun m!1252705 () Bool)

(assert (=> b!1368833 m!1252705))

(declare-fun m!1252707 () Bool)

(assert (=> b!1368835 m!1252707))

(declare-fun m!1252709 () Bool)

(assert (=> b!1368831 m!1252709))

(declare-fun m!1252711 () Bool)

(assert (=> b!1368834 m!1252711))

(declare-fun m!1252713 () Bool)

(assert (=> b!1368834 m!1252713))

(declare-fun m!1252715 () Bool)

(assert (=> b!1368836 m!1252715))

(assert (=> b!1368836 m!1252715))

(declare-fun m!1252717 () Bool)

(assert (=> b!1368836 m!1252717))

(declare-fun m!1252719 () Bool)

(assert (=> b!1368830 m!1252719))

(declare-fun m!1252721 () Bool)

(assert (=> b!1368838 m!1252721))

(declare-fun m!1252723 () Bool)

(assert (=> b!1368841 m!1252723))

(declare-fun m!1252725 () Bool)

(assert (=> b!1368840 m!1252725))

(declare-fun m!1252727 () Bool)

(assert (=> b!1368840 m!1252727))

(declare-fun m!1252729 () Bool)

(assert (=> b!1368840 m!1252729))

(declare-fun m!1252731 () Bool)

(assert (=> start!115744 m!1252731))

(declare-fun m!1252733 () Bool)

(assert (=> b!1368837 m!1252733))

(check-sat (not b!1368833) (not b!1368838) (not start!115744) (not b!1368836) (not b!1368834) (not b!1368830) (not b!1368841) (not b!1368840) (not b!1368831) (not b!1368835) (not b!1368837))
(check-sat)
(get-model)

(declare-fun b!1368892 () Bool)

(declare-fun e!775459 () Bool)

(declare-fun e!775457 () Bool)

(assert (=> b!1368892 (= e!775459 e!775457)))

(declare-fun c!127688 () Bool)

(assert (=> b!1368892 (= c!127688 (validKeyInArray!0 (select (arr!44892 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1368893 () Bool)

(declare-fun e!775460 () Bool)

(assert (=> b!1368893 (= e!775460 e!775459)))

(declare-fun res!912398 () Bool)

(assert (=> b!1368893 (=> (not res!912398) (not e!775459))))

(declare-fun e!775458 () Bool)

(assert (=> b!1368893 (= res!912398 (not e!775458))))

(declare-fun res!912396 () Bool)

(assert (=> b!1368893 (=> (not res!912396) (not e!775458))))

(assert (=> b!1368893 (= res!912396 (validKeyInArray!0 (select (arr!44892 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1368894 () Bool)

(assert (=> b!1368894 (= e!775458 (contains!9642 acc!866 (select (arr!44892 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1368895 () Bool)

(declare-fun call!65495 () Bool)

(assert (=> b!1368895 (= e!775457 call!65495)))

(declare-fun bm!65492 () Bool)

(assert (=> bm!65492 (= call!65495 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239 #b00000000000000000000000000000001) (ite c!127688 (Cons!31956 (select (arr!44892 a!3861) (bvadd #b00000000000000000000000000000001 from!3239)) acc!866) acc!866)))))

(declare-fun d!146915 () Bool)

(declare-fun res!912397 () Bool)

(assert (=> d!146915 (=> res!912397 e!775460)))

(assert (=> d!146915 (= res!912397 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) (size!45442 a!3861)))))

(assert (=> d!146915 (= (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866) e!775460)))

(declare-fun b!1368896 () Bool)

(assert (=> b!1368896 (= e!775457 call!65495)))

(assert (= (and d!146915 (not res!912397)) b!1368893))

(assert (= (and b!1368893 res!912396) b!1368894))

(assert (= (and b!1368893 res!912398) b!1368892))

(assert (= (and b!1368892 c!127688) b!1368896))

(assert (= (and b!1368892 (not c!127688)) b!1368895))

(assert (= (or b!1368896 b!1368895) bm!65492))

(declare-fun m!1252771 () Bool)

(assert (=> b!1368892 m!1252771))

(assert (=> b!1368892 m!1252771))

(declare-fun m!1252773 () Bool)

(assert (=> b!1368892 m!1252773))

(assert (=> b!1368893 m!1252771))

(assert (=> b!1368893 m!1252771))

(assert (=> b!1368893 m!1252773))

(assert (=> b!1368894 m!1252771))

(assert (=> b!1368894 m!1252771))

(declare-fun m!1252781 () Bool)

(assert (=> b!1368894 m!1252781))

(assert (=> bm!65492 m!1252771))

(declare-fun m!1252783 () Bool)

(assert (=> bm!65492 m!1252783))

(assert (=> b!1368831 d!146915))

(declare-fun d!146925 () Bool)

(declare-fun lt!602147 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!721 (List!31960) (InoxSet (_ BitVec 64)))

(assert (=> d!146925 (= lt!602147 (select (content!721 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!775475 () Bool)

(assert (=> d!146925 (= lt!602147 e!775475)))

(declare-fun res!912413 () Bool)

(assert (=> d!146925 (=> (not res!912413) (not e!775475))))

(get-info :version)

(assert (=> d!146925 (= res!912413 ((_ is Cons!31956) newAcc!98))))

(assert (=> d!146925 (= (contains!9642 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602147)))

(declare-fun b!1368911 () Bool)

(declare-fun e!775476 () Bool)

(assert (=> b!1368911 (= e!775475 e!775476)))

(declare-fun res!912414 () Bool)

(assert (=> b!1368911 (=> res!912414 e!775476)))

(assert (=> b!1368911 (= res!912414 (= (h!33165 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1368912 () Bool)

(assert (=> b!1368912 (= e!775476 (contains!9642 (t!46654 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146925 res!912413) b!1368911))

(assert (= (and b!1368911 (not res!912414)) b!1368912))

(declare-fun m!1252789 () Bool)

(assert (=> d!146925 m!1252789))

(declare-fun m!1252791 () Bool)

(assert (=> d!146925 m!1252791))

(declare-fun m!1252793 () Bool)

(assert (=> b!1368912 m!1252793))

(assert (=> b!1368837 d!146925))

(declare-fun d!146931 () Bool)

(declare-fun lt!602148 () Bool)

(assert (=> d!146931 (= lt!602148 (select (content!721 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!775485 () Bool)

(assert (=> d!146931 (= lt!602148 e!775485)))

(declare-fun res!912423 () Bool)

(assert (=> d!146931 (=> (not res!912423) (not e!775485))))

(assert (=> d!146931 (= res!912423 ((_ is Cons!31956) newAcc!98))))

(assert (=> d!146931 (= (contains!9642 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602148)))

(declare-fun b!1368921 () Bool)

(declare-fun e!775486 () Bool)

(assert (=> b!1368921 (= e!775485 e!775486)))

(declare-fun res!912424 () Bool)

(assert (=> b!1368921 (=> res!912424 e!775486)))

(assert (=> b!1368921 (= res!912424 (= (h!33165 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1368922 () Bool)

(assert (=> b!1368922 (= e!775486 (contains!9642 (t!46654 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146931 res!912423) b!1368921))

(assert (= (and b!1368921 (not res!912424)) b!1368922))

(assert (=> d!146931 m!1252789))

(declare-fun m!1252795 () Bool)

(assert (=> d!146931 m!1252795))

(declare-fun m!1252797 () Bool)

(assert (=> b!1368922 m!1252797))

(assert (=> b!1368830 d!146931))

(declare-fun d!146933 () Bool)

(declare-fun res!912450 () Bool)

(declare-fun e!775515 () Bool)

(assert (=> d!146933 (=> res!912450 e!775515)))

(assert (=> d!146933 (= res!912450 ((_ is Nil!31957) newAcc!98))))

(assert (=> d!146933 (= (subseq!1044 newAcc!98 acc!866) e!775515)))

(declare-fun b!1368951 () Bool)

(declare-fun e!775516 () Bool)

(assert (=> b!1368951 (= e!775515 e!775516)))

(declare-fun res!912451 () Bool)

(assert (=> b!1368951 (=> (not res!912451) (not e!775516))))

(assert (=> b!1368951 (= res!912451 ((_ is Cons!31956) acc!866))))

(declare-fun b!1368952 () Bool)

(declare-fun e!775513 () Bool)

(assert (=> b!1368952 (= e!775516 e!775513)))

(declare-fun res!912449 () Bool)

(assert (=> b!1368952 (=> res!912449 e!775513)))

(declare-fun e!775514 () Bool)

(assert (=> b!1368952 (= res!912449 e!775514)))

(declare-fun res!912452 () Bool)

(assert (=> b!1368952 (=> (not res!912452) (not e!775514))))

(assert (=> b!1368952 (= res!912452 (= (h!33165 newAcc!98) (h!33165 acc!866)))))

(declare-fun b!1368954 () Bool)

(assert (=> b!1368954 (= e!775513 (subseq!1044 newAcc!98 (t!46654 acc!866)))))

(declare-fun b!1368953 () Bool)

(assert (=> b!1368953 (= e!775514 (subseq!1044 (t!46654 newAcc!98) (t!46654 acc!866)))))

(assert (= (and d!146933 (not res!912450)) b!1368951))

(assert (= (and b!1368951 res!912451) b!1368952))

(assert (= (and b!1368952 res!912452) b!1368953))

(assert (= (and b!1368952 (not res!912449)) b!1368954))

(declare-fun m!1252807 () Bool)

(assert (=> b!1368954 m!1252807))

(declare-fun m!1252809 () Bool)

(assert (=> b!1368953 m!1252809))

(assert (=> b!1368835 d!146933))

(declare-fun d!146939 () Bool)

(assert (=> d!146939 (= (validKeyInArray!0 (select (arr!44892 a!3861) from!3239)) (and (not (= (select (arr!44892 a!3861) from!3239) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44892 a!3861) from!3239) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1368836 d!146939))

(declare-fun d!146943 () Bool)

(declare-fun res!912466 () Bool)

(declare-fun e!775531 () Bool)

(assert (=> d!146943 (=> res!912466 e!775531)))

(assert (=> d!146943 (= res!912466 ((_ is Nil!31957) acc!866))))

(assert (=> d!146943 (= (noDuplicate!2499 acc!866) e!775531)))

(declare-fun b!1368970 () Bool)

(declare-fun e!775532 () Bool)

(assert (=> b!1368970 (= e!775531 e!775532)))

(declare-fun res!912467 () Bool)

(assert (=> b!1368970 (=> (not res!912467) (not e!775532))))

(assert (=> b!1368970 (= res!912467 (not (contains!9642 (t!46654 acc!866) (h!33165 acc!866))))))

(declare-fun b!1368971 () Bool)

(assert (=> b!1368971 (= e!775532 (noDuplicate!2499 (t!46654 acc!866)))))

(assert (= (and d!146943 (not res!912466)) b!1368970))

(assert (= (and b!1368970 res!912467) b!1368971))

(declare-fun m!1252825 () Bool)

(assert (=> b!1368970 m!1252825))

(declare-fun m!1252829 () Bool)

(assert (=> b!1368971 m!1252829))

(assert (=> b!1368841 d!146943))

(declare-fun d!146949 () Bool)

(assert (=> d!146949 (= (array_inv!33920 a!3861) (bvsge (size!45442 a!3861) #b00000000000000000000000000000000))))

(assert (=> start!115744 d!146949))

(declare-fun b!1368972 () Bool)

(declare-fun e!775535 () Bool)

(declare-fun e!775533 () Bool)

(assert (=> b!1368972 (= e!775535 e!775533)))

(declare-fun c!127692 () Bool)

(assert (=> b!1368972 (= c!127692 (validKeyInArray!0 (select (arr!44892 a!3861) from!3239)))))

(declare-fun b!1368973 () Bool)

(declare-fun e!775536 () Bool)

(assert (=> b!1368973 (= e!775536 e!775535)))

(declare-fun res!912470 () Bool)

(assert (=> b!1368973 (=> (not res!912470) (not e!775535))))

(declare-fun e!775534 () Bool)

(assert (=> b!1368973 (= res!912470 (not e!775534))))

(declare-fun res!912468 () Bool)

(assert (=> b!1368973 (=> (not res!912468) (not e!775534))))

(assert (=> b!1368973 (= res!912468 (validKeyInArray!0 (select (arr!44892 a!3861) from!3239)))))

(declare-fun b!1368974 () Bool)

(assert (=> b!1368974 (= e!775534 (contains!9642 acc!866 (select (arr!44892 a!3861) from!3239)))))

(declare-fun b!1368975 () Bool)

(declare-fun call!65499 () Bool)

(assert (=> b!1368975 (= e!775533 call!65499)))

(declare-fun bm!65496 () Bool)

(assert (=> bm!65496 (= call!65499 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!127692 (Cons!31956 (select (arr!44892 a!3861) from!3239) acc!866) acc!866)))))

(declare-fun d!146951 () Bool)

(declare-fun res!912469 () Bool)

(assert (=> d!146951 (=> res!912469 e!775536)))

(assert (=> d!146951 (= res!912469 (bvsge from!3239 (size!45442 a!3861)))))

(assert (=> d!146951 (= (arrayNoDuplicates!0 a!3861 from!3239 acc!866) e!775536)))

(declare-fun b!1368976 () Bool)

(assert (=> b!1368976 (= e!775533 call!65499)))

(assert (= (and d!146951 (not res!912469)) b!1368973))

(assert (= (and b!1368973 res!912468) b!1368974))

(assert (= (and b!1368973 res!912470) b!1368972))

(assert (= (and b!1368972 c!127692) b!1368976))

(assert (= (and b!1368972 (not c!127692)) b!1368975))

(assert (= (or b!1368976 b!1368975) bm!65496))

(assert (=> b!1368972 m!1252715))

(assert (=> b!1368972 m!1252715))

(assert (=> b!1368972 m!1252717))

(assert (=> b!1368973 m!1252715))

(assert (=> b!1368973 m!1252715))

(assert (=> b!1368973 m!1252717))

(assert (=> b!1368974 m!1252715))

(assert (=> b!1368974 m!1252715))

(declare-fun m!1252831 () Bool)

(assert (=> b!1368974 m!1252831))

(assert (=> bm!65496 m!1252715))

(declare-fun m!1252833 () Bool)

(assert (=> bm!65496 m!1252833))

(assert (=> b!1368834 d!146951))

(declare-fun d!146953 () Bool)

(assert (=> d!146953 (noDuplicate!2499 newAcc!98)))

(declare-fun lt!602157 () Unit!45221)

(declare-fun choose!1999 (List!31960 List!31960) Unit!45221)

(assert (=> d!146953 (= lt!602157 (choose!1999 newAcc!98 acc!866))))

(declare-fun e!775559 () Bool)

(assert (=> d!146953 e!775559))

(declare-fun res!912491 () Bool)

(assert (=> d!146953 (=> (not res!912491) (not e!775559))))

(assert (=> d!146953 (= res!912491 (subseq!1044 newAcc!98 acc!866))))

(assert (=> d!146953 (= (noDuplicateSubseq!231 newAcc!98 acc!866) lt!602157)))

(declare-fun b!1369001 () Bool)

(assert (=> b!1369001 (= e!775559 (noDuplicate!2499 acc!866))))

(assert (= (and d!146953 res!912491) b!1369001))

(assert (=> d!146953 m!1252725))

(declare-fun m!1252839 () Bool)

(assert (=> d!146953 m!1252839))

(assert (=> d!146953 m!1252707))

(assert (=> b!1369001 m!1252723))

(assert (=> b!1368834 d!146953))

(declare-fun d!146957 () Bool)

(declare-fun res!912492 () Bool)

(declare-fun e!775560 () Bool)

(assert (=> d!146957 (=> res!912492 e!775560)))

(assert (=> d!146957 (= res!912492 ((_ is Nil!31957) newAcc!98))))

(assert (=> d!146957 (= (noDuplicate!2499 newAcc!98) e!775560)))

(declare-fun b!1369002 () Bool)

(declare-fun e!775561 () Bool)

(assert (=> b!1369002 (= e!775560 e!775561)))

(declare-fun res!912493 () Bool)

(assert (=> b!1369002 (=> (not res!912493) (not e!775561))))

(assert (=> b!1369002 (= res!912493 (not (contains!9642 (t!46654 newAcc!98) (h!33165 newAcc!98))))))

(declare-fun b!1369003 () Bool)

(assert (=> b!1369003 (= e!775561 (noDuplicate!2499 (t!46654 newAcc!98)))))

(assert (= (and d!146957 (not res!912492)) b!1369002))

(assert (= (and b!1369002 res!912493) b!1369003))

(declare-fun m!1252841 () Bool)

(assert (=> b!1369002 m!1252841))

(declare-fun m!1252843 () Bool)

(assert (=> b!1369003 m!1252843))

(assert (=> b!1368840 d!146957))

(declare-fun b!1369009 () Bool)

(declare-fun e!775568 () Bool)

(declare-fun e!775566 () Bool)

(assert (=> b!1369009 (= e!775568 e!775566)))

(declare-fun c!127696 () Bool)

(assert (=> b!1369009 (= c!127696 (validKeyInArray!0 (select (arr!44892 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1369010 () Bool)

(declare-fun e!775569 () Bool)

(assert (=> b!1369010 (= e!775569 e!775568)))

(declare-fun res!912499 () Bool)

(assert (=> b!1369010 (=> (not res!912499) (not e!775568))))

(declare-fun e!775567 () Bool)

(assert (=> b!1369010 (= res!912499 (not e!775567))))

(declare-fun res!912497 () Bool)

(assert (=> b!1369010 (=> (not res!912497) (not e!775567))))

(assert (=> b!1369010 (= res!912497 (validKeyInArray!0 (select (arr!44892 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1369011 () Bool)

(assert (=> b!1369011 (= e!775567 (contains!9642 newAcc!98 (select (arr!44892 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1369012 () Bool)

(declare-fun call!65503 () Bool)

(assert (=> b!1369012 (= e!775566 call!65503)))

(declare-fun bm!65500 () Bool)

(assert (=> bm!65500 (= call!65503 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239 #b00000000000000000000000000000001) (ite c!127696 (Cons!31956 (select (arr!44892 a!3861) (bvadd #b00000000000000000000000000000001 from!3239)) newAcc!98) newAcc!98)))))

(declare-fun d!146961 () Bool)

(declare-fun res!912498 () Bool)

(assert (=> d!146961 (=> res!912498 e!775569)))

(assert (=> d!146961 (= res!912498 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) (size!45442 a!3861)))))

(assert (=> d!146961 (= (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) newAcc!98) e!775569)))

(declare-fun b!1369013 () Bool)

(assert (=> b!1369013 (= e!775566 call!65503)))

(assert (= (and d!146961 (not res!912498)) b!1369010))

(assert (= (and b!1369010 res!912497) b!1369011))

(assert (= (and b!1369010 res!912499) b!1369009))

(assert (= (and b!1369009 c!127696) b!1369013))

(assert (= (and b!1369009 (not c!127696)) b!1369012))

(assert (= (or b!1369013 b!1369012) bm!65500))

(assert (=> b!1369009 m!1252771))

(assert (=> b!1369009 m!1252771))

(assert (=> b!1369009 m!1252773))

(assert (=> b!1369010 m!1252771))

(assert (=> b!1369010 m!1252771))

(assert (=> b!1369010 m!1252773))

(assert (=> b!1369011 m!1252771))

(assert (=> b!1369011 m!1252771))

(declare-fun m!1252847 () Bool)

(assert (=> b!1369011 m!1252847))

(assert (=> bm!65500 m!1252771))

(declare-fun m!1252851 () Bool)

(assert (=> bm!65500 m!1252851))

(assert (=> b!1368840 d!146961))

(declare-fun d!146965 () Bool)

(assert (=> d!146965 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) newAcc!98)))

(declare-fun lt!602160 () Unit!45221)

(declare-fun choose!80 (array!92936 List!31960 List!31960 (_ BitVec 32)) Unit!45221)

(assert (=> d!146965 (= lt!602160 (choose!80 a!3861 acc!866 newAcc!98 (bvadd #b00000000000000000000000000000001 from!3239)))))

(assert (=> d!146965 (bvslt (size!45442 a!3861) #b01111111111111111111111111111111)))

(assert (=> d!146965 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 acc!866 newAcc!98 (bvadd #b00000000000000000000000000000001 from!3239)) lt!602160)))

(declare-fun bs!39268 () Bool)

(assert (= bs!39268 d!146965))

(assert (=> bs!39268 m!1252727))

(declare-fun m!1252861 () Bool)

(assert (=> bs!39268 m!1252861))

(assert (=> b!1368840 d!146965))

(declare-fun d!146971 () Bool)

(declare-fun lt!602161 () Bool)

(assert (=> d!146971 (= lt!602161 (select (content!721 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!775580 () Bool)

(assert (=> d!146971 (= lt!602161 e!775580)))

(declare-fun res!912508 () Bool)

(assert (=> d!146971 (=> (not res!912508) (not e!775580))))

(assert (=> d!146971 (= res!912508 ((_ is Cons!31956) acc!866))))

(assert (=> d!146971 (= (contains!9642 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602161)))

(declare-fun b!1369026 () Bool)

(declare-fun e!775581 () Bool)

(assert (=> b!1369026 (= e!775580 e!775581)))

(declare-fun res!912509 () Bool)

(assert (=> b!1369026 (=> res!912509 e!775581)))

(assert (=> b!1369026 (= res!912509 (= (h!33165 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1369027 () Bool)

(assert (=> b!1369027 (= e!775581 (contains!9642 (t!46654 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146971 res!912508) b!1369026))

(assert (= (and b!1369026 (not res!912509)) b!1369027))

(declare-fun m!1252863 () Bool)

(assert (=> d!146971 m!1252863))

(declare-fun m!1252865 () Bool)

(assert (=> d!146971 m!1252865))

(declare-fun m!1252867 () Bool)

(assert (=> b!1369027 m!1252867))

(assert (=> b!1368838 d!146971))

(declare-fun d!146973 () Bool)

(declare-fun lt!602166 () Bool)

(assert (=> d!146973 (= lt!602166 (select (content!721 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!775584 () Bool)

(assert (=> d!146973 (= lt!602166 e!775584)))

(declare-fun res!912512 () Bool)

(assert (=> d!146973 (=> (not res!912512) (not e!775584))))

(assert (=> d!146973 (= res!912512 ((_ is Cons!31956) acc!866))))

(assert (=> d!146973 (= (contains!9642 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602166)))

(declare-fun b!1369030 () Bool)

(declare-fun e!775585 () Bool)

(assert (=> b!1369030 (= e!775584 e!775585)))

(declare-fun res!912513 () Bool)

(assert (=> b!1369030 (=> res!912513 e!775585)))

(assert (=> b!1369030 (= res!912513 (= (h!33165 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1369031 () Bool)

(assert (=> b!1369031 (= e!775585 (contains!9642 (t!46654 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146973 res!912512) b!1369030))

(assert (= (and b!1369030 (not res!912513)) b!1369031))

(assert (=> d!146973 m!1252863))

(declare-fun m!1252869 () Bool)

(assert (=> d!146973 m!1252869))

(declare-fun m!1252871 () Bool)

(assert (=> b!1369031 m!1252871))

(assert (=> b!1368833 d!146973))

(check-sat (not b!1369010) (not b!1369003) (not b!1368922) (not d!146971) (not b!1368971) (not d!146925) (not b!1368954) (not b!1368912) (not b!1368970) (not b!1368972) (not b!1369031) (not d!146953) (not b!1369002) (not d!146973) (not b!1368973) (not b!1368893) (not b!1369011) (not b!1369009) (not bm!65492) (not b!1369001) (not b!1368894) (not d!146965) (not b!1368974) (not bm!65496) (not b!1369027) (not b!1368953) (not b!1368892) (not bm!65500) (not d!146931))
(check-sat)
