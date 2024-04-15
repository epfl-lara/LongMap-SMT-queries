; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60422 () Bool)

(assert start!60422)

(declare-fun b!678871 () Bool)

(declare-fun res!445419 () Bool)

(declare-fun e!386760 () Bool)

(assert (=> b!678871 (=> (not res!445419) (not e!386760))))

(declare-datatypes ((List!12994 0))(
  ( (Nil!12991) (Cons!12990 (h!14035 (_ BitVec 64)) (t!19213 List!12994)) )
))
(declare-fun acc!681 () List!12994)

(declare-fun noDuplicate!785 (List!12994) Bool)

(assert (=> b!678871 (= res!445419 (noDuplicate!785 acc!681))))

(declare-fun b!678872 () Bool)

(declare-fun res!445426 () Bool)

(assert (=> b!678872 (=> (not res!445426) (not e!386760))))

(declare-fun e!386758 () Bool)

(assert (=> b!678872 (= res!445426 e!386758)))

(declare-fun res!445421 () Bool)

(assert (=> b!678872 (=> res!445421 e!386758)))

(declare-fun e!386757 () Bool)

(assert (=> b!678872 (= res!445421 e!386757)))

(declare-fun res!445418 () Bool)

(assert (=> b!678872 (=> (not res!445418) (not e!386757))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!678872 (= res!445418 (bvsgt from!3004 i!1382))))

(declare-fun b!678873 () Bool)

(declare-fun res!445427 () Bool)

(assert (=> b!678873 (=> (not res!445427) (not e!386760))))

(declare-datatypes ((array!39447 0))(
  ( (array!39448 (arr!18914 (Array (_ BitVec 32) (_ BitVec 64))) (size!19279 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39447)

(assert (=> b!678873 (= res!445427 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19279 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!678874 () Bool)

(declare-fun e!386759 () Bool)

(assert (=> b!678874 (= e!386758 e!386759)))

(declare-fun res!445416 () Bool)

(assert (=> b!678874 (=> (not res!445416) (not e!386759))))

(assert (=> b!678874 (= res!445416 (bvsle from!3004 i!1382))))

(declare-fun b!678875 () Bool)

(declare-fun res!445423 () Bool)

(assert (=> b!678875 (=> (not res!445423) (not e!386760))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!678875 (= res!445423 (validKeyInArray!0 k0!2843))))

(declare-fun b!678876 () Bool)

(declare-fun res!445428 () Bool)

(assert (=> b!678876 (=> (not res!445428) (not e!386760))))

(declare-fun contains!3516 (List!12994 (_ BitVec 64)) Bool)

(assert (=> b!678876 (= res!445428 (not (contains!3516 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!678877 () Bool)

(assert (=> b!678877 (= e!386757 (contains!3516 acc!681 k0!2843))))

(declare-fun b!678878 () Bool)

(declare-fun res!445417 () Bool)

(assert (=> b!678878 (=> (not res!445417) (not e!386760))))

(declare-fun arrayContainsKey!0 (array!39447 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!678878 (= res!445417 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!678879 () Bool)

(declare-fun res!445415 () Bool)

(assert (=> b!678879 (=> (not res!445415) (not e!386760))))

(assert (=> b!678879 (= res!445415 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19279 a!3626))))))

(declare-fun res!445425 () Bool)

(assert (=> start!60422 (=> (not res!445425) (not e!386760))))

(assert (=> start!60422 (= res!445425 (and (bvslt (size!19279 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19279 a!3626))))))

(assert (=> start!60422 e!386760))

(assert (=> start!60422 true))

(declare-fun array_inv!14797 (array!39447) Bool)

(assert (=> start!60422 (array_inv!14797 a!3626)))

(declare-fun b!678880 () Bool)

(assert (=> b!678880 (= e!386759 (not (contains!3516 acc!681 k0!2843)))))

(declare-fun e!386761 () Bool)

(declare-fun b!678881 () Bool)

(assert (=> b!678881 (= e!386761 (arrayContainsKey!0 a!3626 k0!2843 from!3004))))

(declare-fun b!678882 () Bool)

(assert (=> b!678882 (= e!386760 (not e!386761))))

(declare-fun res!445424 () Bool)

(assert (=> b!678882 (=> res!445424 e!386761)))

(assert (=> b!678882 (= res!445424 (not (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004))))))

(assert (=> b!678882 (arrayContainsKey!0 (array!39448 (store (arr!18914 a!3626) i!1382 k0!2843) (size!19279 a!3626)) k0!2843 from!3004)))

(declare-fun b!678883 () Bool)

(declare-fun res!445422 () Bool)

(assert (=> b!678883 (=> (not res!445422) (not e!386760))))

(declare-fun arrayNoDuplicates!0 (array!39447 (_ BitVec 32) List!12994) Bool)

(assert (=> b!678883 (= res!445422 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!678884 () Bool)

(declare-fun res!445420 () Bool)

(assert (=> b!678884 (=> (not res!445420) (not e!386760))))

(assert (=> b!678884 (= res!445420 (not (contains!3516 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!678885 () Bool)

(declare-fun res!445429 () Bool)

(assert (=> b!678885 (=> (not res!445429) (not e!386760))))

(assert (=> b!678885 (= res!445429 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12991))))

(assert (= (and start!60422 res!445425) b!678871))

(assert (= (and b!678871 res!445419) b!678876))

(assert (= (and b!678876 res!445428) b!678884))

(assert (= (and b!678884 res!445420) b!678872))

(assert (= (and b!678872 res!445418) b!678877))

(assert (= (and b!678872 (not res!445421)) b!678874))

(assert (= (and b!678874 res!445416) b!678880))

(assert (= (and b!678872 res!445426) b!678885))

(assert (= (and b!678885 res!445429) b!678883))

(assert (= (and b!678883 res!445422) b!678879))

(assert (= (and b!678879 res!445415) b!678875))

(assert (= (and b!678875 res!445423) b!678878))

(assert (= (and b!678878 res!445417) b!678873))

(assert (= (and b!678873 res!445427) b!678882))

(assert (= (and b!678882 (not res!445424)) b!678881))

(declare-fun m!643863 () Bool)

(assert (=> b!678884 m!643863))

(declare-fun m!643865 () Bool)

(assert (=> b!678883 m!643865))

(declare-fun m!643867 () Bool)

(assert (=> b!678885 m!643867))

(declare-fun m!643869 () Bool)

(assert (=> b!678877 m!643869))

(declare-fun m!643871 () Bool)

(assert (=> b!678871 m!643871))

(declare-fun m!643873 () Bool)

(assert (=> b!678881 m!643873))

(declare-fun m!643875 () Bool)

(assert (=> b!678876 m!643875))

(declare-fun m!643877 () Bool)

(assert (=> b!678875 m!643877))

(declare-fun m!643879 () Bool)

(assert (=> start!60422 m!643879))

(declare-fun m!643881 () Bool)

(assert (=> b!678882 m!643881))

(declare-fun m!643883 () Bool)

(assert (=> b!678882 m!643883))

(declare-fun m!643885 () Bool)

(assert (=> b!678882 m!643885))

(assert (=> b!678880 m!643869))

(declare-fun m!643887 () Bool)

(assert (=> b!678878 m!643887))

(check-sat (not b!678871) (not b!678882) (not b!678876) (not b!678875) (not b!678881) (not b!678880) (not b!678883) (not b!678884) (not start!60422) (not b!678885) (not b!678878) (not b!678877))
(check-sat)
(get-model)

(declare-fun d!93271 () Bool)

(declare-fun lt!312657 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!264 (List!12994) (InoxSet (_ BitVec 64)))

(assert (=> d!93271 (= lt!312657 (select (content!264 acc!681) k0!2843))))

(declare-fun e!386803 () Bool)

(assert (=> d!93271 (= lt!312657 e!386803)))

(declare-fun res!445525 () Bool)

(assert (=> d!93271 (=> (not res!445525) (not e!386803))))

(get-info :version)

(assert (=> d!93271 (= res!445525 ((_ is Cons!12990) acc!681))))

(assert (=> d!93271 (= (contains!3516 acc!681 k0!2843) lt!312657)))

(declare-fun b!678980 () Bool)

(declare-fun e!386804 () Bool)

(assert (=> b!678980 (= e!386803 e!386804)))

(declare-fun res!445524 () Bool)

(assert (=> b!678980 (=> res!445524 e!386804)))

(assert (=> b!678980 (= res!445524 (= (h!14035 acc!681) k0!2843))))

(declare-fun b!678981 () Bool)

(assert (=> b!678981 (= e!386804 (contains!3516 (t!19213 acc!681) k0!2843))))

(assert (= (and d!93271 res!445525) b!678980))

(assert (= (and b!678980 (not res!445524)) b!678981))

(declare-fun m!643941 () Bool)

(assert (=> d!93271 m!643941))

(declare-fun m!643943 () Bool)

(assert (=> d!93271 m!643943))

(declare-fun m!643945 () Bool)

(assert (=> b!678981 m!643945))

(assert (=> b!678880 d!93271))

(declare-fun d!93273 () Bool)

(declare-fun res!445530 () Bool)

(declare-fun e!386809 () Bool)

(assert (=> d!93273 (=> res!445530 e!386809)))

(assert (=> d!93273 (= res!445530 (= (select (arr!18914 a!3626) #b00000000000000000000000000000000) k0!2843))))

(assert (=> d!93273 (= (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000) e!386809)))

(declare-fun b!678986 () Bool)

(declare-fun e!386810 () Bool)

(assert (=> b!678986 (= e!386809 e!386810)))

(declare-fun res!445531 () Bool)

(assert (=> b!678986 (=> (not res!445531) (not e!386810))))

(assert (=> b!678986 (= res!445531 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19279 a!3626)))))

(declare-fun b!678987 () Bool)

(assert (=> b!678987 (= e!386810 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!93273 (not res!445530)) b!678986))

(assert (= (and b!678986 res!445531) b!678987))

(declare-fun m!643947 () Bool)

(assert (=> d!93273 m!643947))

(declare-fun m!643949 () Bool)

(assert (=> b!678987 m!643949))

(assert (=> b!678878 d!93273))

(assert (=> b!678877 d!93271))

(declare-fun d!93275 () Bool)

(declare-fun lt!312658 () Bool)

(assert (=> d!93275 (= lt!312658 (select (content!264 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!386811 () Bool)

(assert (=> d!93275 (= lt!312658 e!386811)))

(declare-fun res!445533 () Bool)

(assert (=> d!93275 (=> (not res!445533) (not e!386811))))

(assert (=> d!93275 (= res!445533 ((_ is Cons!12990) acc!681))))

(assert (=> d!93275 (= (contains!3516 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!312658)))

(declare-fun b!678988 () Bool)

(declare-fun e!386812 () Bool)

(assert (=> b!678988 (= e!386811 e!386812)))

(declare-fun res!445532 () Bool)

(assert (=> b!678988 (=> res!445532 e!386812)))

(assert (=> b!678988 (= res!445532 (= (h!14035 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!678989 () Bool)

(assert (=> b!678989 (= e!386812 (contains!3516 (t!19213 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93275 res!445533) b!678988))

(assert (= (and b!678988 (not res!445532)) b!678989))

(assert (=> d!93275 m!643941))

(declare-fun m!643951 () Bool)

(assert (=> d!93275 m!643951))

(declare-fun m!643953 () Bool)

(assert (=> b!678989 m!643953))

(assert (=> b!678876 d!93275))

(declare-fun b!679001 () Bool)

(declare-fun e!386821 () Bool)

(declare-fun call!33901 () Bool)

(assert (=> b!679001 (= e!386821 call!33901)))

(declare-fun b!679002 () Bool)

(declare-fun e!386822 () Bool)

(declare-fun e!386824 () Bool)

(assert (=> b!679002 (= e!386822 e!386824)))

(declare-fun res!445541 () Bool)

(assert (=> b!679002 (=> (not res!445541) (not e!386824))))

(declare-fun e!386823 () Bool)

(assert (=> b!679002 (= res!445541 (not e!386823))))

(declare-fun res!445540 () Bool)

(assert (=> b!679002 (=> (not res!445540) (not e!386823))))

(assert (=> b!679002 (= res!445540 (validKeyInArray!0 (select (arr!18914 a!3626) #b00000000000000000000000000000000)))))

(declare-fun bm!33898 () Bool)

(declare-fun c!77097 () Bool)

(assert (=> bm!33898 (= call!33901 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!77097 (Cons!12990 (select (arr!18914 a!3626) #b00000000000000000000000000000000) Nil!12991) Nil!12991)))))

(declare-fun b!679003 () Bool)

(assert (=> b!679003 (= e!386823 (contains!3516 Nil!12991 (select (arr!18914 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!679004 () Bool)

(assert (=> b!679004 (= e!386821 call!33901)))

(declare-fun b!679000 () Bool)

(assert (=> b!679000 (= e!386824 e!386821)))

(assert (=> b!679000 (= c!77097 (validKeyInArray!0 (select (arr!18914 a!3626) #b00000000000000000000000000000000)))))

(declare-fun d!93277 () Bool)

(declare-fun res!445542 () Bool)

(assert (=> d!93277 (=> res!445542 e!386822)))

(assert (=> d!93277 (= res!445542 (bvsge #b00000000000000000000000000000000 (size!19279 a!3626)))))

(assert (=> d!93277 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12991) e!386822)))

(assert (= (and d!93277 (not res!445542)) b!679002))

(assert (= (and b!679002 res!445540) b!679003))

(assert (= (and b!679002 res!445541) b!679000))

(assert (= (and b!679000 c!77097) b!679004))

(assert (= (and b!679000 (not c!77097)) b!679001))

(assert (= (or b!679004 b!679001) bm!33898))

(assert (=> b!679002 m!643947))

(assert (=> b!679002 m!643947))

(declare-fun m!643955 () Bool)

(assert (=> b!679002 m!643955))

(assert (=> bm!33898 m!643947))

(declare-fun m!643957 () Bool)

(assert (=> bm!33898 m!643957))

(assert (=> b!679003 m!643947))

(assert (=> b!679003 m!643947))

(declare-fun m!643959 () Bool)

(assert (=> b!679003 m!643959))

(assert (=> b!679000 m!643947))

(assert (=> b!679000 m!643947))

(assert (=> b!679000 m!643955))

(assert (=> b!678885 d!93277))

(declare-fun d!93281 () Bool)

(assert (=> d!93281 (= (validKeyInArray!0 k0!2843) (and (not (= k0!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!678875 d!93281))

(declare-fun d!93285 () Bool)

(assert (=> d!93285 (= (array_inv!14797 a!3626) (bvsge (size!19279 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!60422 d!93285))

(declare-fun d!93289 () Bool)

(declare-fun lt!312659 () Bool)

(assert (=> d!93289 (= lt!312659 (select (content!264 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!386831 () Bool)

(assert (=> d!93289 (= lt!312659 e!386831)))

(declare-fun res!445550 () Bool)

(assert (=> d!93289 (=> (not res!445550) (not e!386831))))

(assert (=> d!93289 (= res!445550 ((_ is Cons!12990) acc!681))))

(assert (=> d!93289 (= (contains!3516 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!312659)))

(declare-fun b!679011 () Bool)

(declare-fun e!386832 () Bool)

(assert (=> b!679011 (= e!386831 e!386832)))

(declare-fun res!445549 () Bool)

(assert (=> b!679011 (=> res!445549 e!386832)))

(assert (=> b!679011 (= res!445549 (= (h!14035 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!679012 () Bool)

(assert (=> b!679012 (= e!386832 (contains!3516 (t!19213 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93289 res!445550) b!679011))

(assert (= (and b!679011 (not res!445549)) b!679012))

(assert (=> d!93289 m!643941))

(declare-fun m!643965 () Bool)

(assert (=> d!93289 m!643965))

(declare-fun m!643967 () Bool)

(assert (=> b!679012 m!643967))

(assert (=> b!678884 d!93289))

(declare-fun d!93291 () Bool)

(declare-fun res!445555 () Bool)

(declare-fun e!386837 () Bool)

(assert (=> d!93291 (=> res!445555 e!386837)))

(assert (=> d!93291 (= res!445555 (= (select (arr!18914 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k0!2843))))

(assert (=> d!93291 (= (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!386837)))

(declare-fun b!679017 () Bool)

(declare-fun e!386838 () Bool)

(assert (=> b!679017 (= e!386837 e!386838)))

(declare-fun res!445556 () Bool)

(assert (=> b!679017 (=> (not res!445556) (not e!386838))))

(assert (=> b!679017 (= res!445556 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19279 a!3626)))))

(declare-fun b!679018 () Bool)

(assert (=> b!679018 (= e!386838 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!93291 (not res!445555)) b!679017))

(assert (= (and b!679017 res!445556) b!679018))

(declare-fun m!643969 () Bool)

(assert (=> d!93291 m!643969))

(declare-fun m!643971 () Bool)

(assert (=> b!679018 m!643971))

(assert (=> b!678882 d!93291))

(declare-fun d!93293 () Bool)

(declare-fun res!445557 () Bool)

(declare-fun e!386839 () Bool)

(assert (=> d!93293 (=> res!445557 e!386839)))

(assert (=> d!93293 (= res!445557 (= (select (arr!18914 (array!39448 (store (arr!18914 a!3626) i!1382 k0!2843) (size!19279 a!3626))) from!3004) k0!2843))))

(assert (=> d!93293 (= (arrayContainsKey!0 (array!39448 (store (arr!18914 a!3626) i!1382 k0!2843) (size!19279 a!3626)) k0!2843 from!3004) e!386839)))

(declare-fun b!679019 () Bool)

(declare-fun e!386840 () Bool)

(assert (=> b!679019 (= e!386839 e!386840)))

(declare-fun res!445558 () Bool)

(assert (=> b!679019 (=> (not res!445558) (not e!386840))))

(assert (=> b!679019 (= res!445558 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19279 (array!39448 (store (arr!18914 a!3626) i!1382 k0!2843) (size!19279 a!3626)))))))

(declare-fun b!679020 () Bool)

(assert (=> b!679020 (= e!386840 (arrayContainsKey!0 (array!39448 (store (arr!18914 a!3626) i!1382 k0!2843) (size!19279 a!3626)) k0!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!93293 (not res!445557)) b!679019))

(assert (= (and b!679019 res!445558) b!679020))

(declare-fun m!643973 () Bool)

(assert (=> d!93293 m!643973))

(declare-fun m!643975 () Bool)

(assert (=> b!679020 m!643975))

(assert (=> b!678882 d!93293))

(declare-fun b!679022 () Bool)

(declare-fun e!386841 () Bool)

(declare-fun call!33902 () Bool)

(assert (=> b!679022 (= e!386841 call!33902)))

(declare-fun b!679023 () Bool)

(declare-fun e!386842 () Bool)

(declare-fun e!386844 () Bool)

(assert (=> b!679023 (= e!386842 e!386844)))

(declare-fun res!445560 () Bool)

(assert (=> b!679023 (=> (not res!445560) (not e!386844))))

(declare-fun e!386843 () Bool)

(assert (=> b!679023 (= res!445560 (not e!386843))))

(declare-fun res!445559 () Bool)

(assert (=> b!679023 (=> (not res!445559) (not e!386843))))

(assert (=> b!679023 (= res!445559 (validKeyInArray!0 (select (arr!18914 a!3626) from!3004)))))

(declare-fun bm!33899 () Bool)

(declare-fun c!77098 () Bool)

(assert (=> bm!33899 (= call!33902 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!77098 (Cons!12990 (select (arr!18914 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun b!679024 () Bool)

(assert (=> b!679024 (= e!386843 (contains!3516 acc!681 (select (arr!18914 a!3626) from!3004)))))

(declare-fun b!679025 () Bool)

(assert (=> b!679025 (= e!386841 call!33902)))

(declare-fun b!679021 () Bool)

(assert (=> b!679021 (= e!386844 e!386841)))

(assert (=> b!679021 (= c!77098 (validKeyInArray!0 (select (arr!18914 a!3626) from!3004)))))

(declare-fun d!93295 () Bool)

(declare-fun res!445561 () Bool)

(assert (=> d!93295 (=> res!445561 e!386842)))

(assert (=> d!93295 (= res!445561 (bvsge from!3004 (size!19279 a!3626)))))

(assert (=> d!93295 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!386842)))

(assert (= (and d!93295 (not res!445561)) b!679023))

(assert (= (and b!679023 res!445559) b!679024))

(assert (= (and b!679023 res!445560) b!679021))

(assert (= (and b!679021 c!77098) b!679025))

(assert (= (and b!679021 (not c!77098)) b!679022))

(assert (= (or b!679025 b!679022) bm!33899))

(declare-fun m!643981 () Bool)

(assert (=> b!679023 m!643981))

(assert (=> b!679023 m!643981))

(declare-fun m!643983 () Bool)

(assert (=> b!679023 m!643983))

(assert (=> bm!33899 m!643981))

(declare-fun m!643985 () Bool)

(assert (=> bm!33899 m!643985))

(assert (=> b!679024 m!643981))

(assert (=> b!679024 m!643981))

(declare-fun m!643987 () Bool)

(assert (=> b!679024 m!643987))

(assert (=> b!679021 m!643981))

(assert (=> b!679021 m!643981))

(assert (=> b!679021 m!643983))

(assert (=> b!678883 d!93295))

(declare-fun d!93299 () Bool)

(declare-fun res!445564 () Bool)

(declare-fun e!386847 () Bool)

(assert (=> d!93299 (=> res!445564 e!386847)))

(assert (=> d!93299 (= res!445564 (= (select (arr!18914 a!3626) from!3004) k0!2843))))

(assert (=> d!93299 (= (arrayContainsKey!0 a!3626 k0!2843 from!3004) e!386847)))

(declare-fun b!679028 () Bool)

(declare-fun e!386848 () Bool)

(assert (=> b!679028 (= e!386847 e!386848)))

(declare-fun res!445565 () Bool)

(assert (=> b!679028 (=> (not res!445565) (not e!386848))))

(assert (=> b!679028 (= res!445565 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19279 a!3626)))))

(declare-fun b!679029 () Bool)

(assert (=> b!679029 (= e!386848 (arrayContainsKey!0 a!3626 k0!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!93299 (not res!445564)) b!679028))

(assert (= (and b!679028 res!445565) b!679029))

(assert (=> d!93299 m!643981))

(declare-fun m!643989 () Bool)

(assert (=> b!679029 m!643989))

(assert (=> b!678881 d!93299))

(declare-fun d!93301 () Bool)

(declare-fun res!445576 () Bool)

(declare-fun e!386859 () Bool)

(assert (=> d!93301 (=> res!445576 e!386859)))

(assert (=> d!93301 (= res!445576 ((_ is Nil!12991) acc!681))))

(assert (=> d!93301 (= (noDuplicate!785 acc!681) e!386859)))

(declare-fun b!679038 () Bool)

(declare-fun e!386860 () Bool)

(assert (=> b!679038 (= e!386859 e!386860)))

(declare-fun res!445577 () Bool)

(assert (=> b!679038 (=> (not res!445577) (not e!386860))))

(assert (=> b!679038 (= res!445577 (not (contains!3516 (t!19213 acc!681) (h!14035 acc!681))))))

(declare-fun b!679039 () Bool)

(assert (=> b!679039 (= e!386860 (noDuplicate!785 (t!19213 acc!681)))))

(assert (= (and d!93301 (not res!445576)) b!679038))

(assert (= (and b!679038 res!445577) b!679039))

(declare-fun m!643991 () Bool)

(assert (=> b!679038 m!643991))

(declare-fun m!643993 () Bool)

(assert (=> b!679039 m!643993))

(assert (=> b!678871 d!93301))

(check-sat (not b!679018) (not b!679000) (not b!679021) (not b!678981) (not b!679038) (not b!679002) (not bm!33898) (not b!679039) (not b!679024) (not b!678989) (not d!93289) (not b!679029) (not bm!33899) (not b!679003) (not b!679020) (not d!93275) (not d!93271) (not b!679012) (not b!679023) (not b!678987))
(check-sat)
