; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115746 () Bool)

(assert start!115746)

(declare-fun b!1368866 () Bool)

(declare-fun e!775443 () Bool)

(declare-fun e!775442 () Bool)

(assert (=> b!1368866 (= e!775443 e!775442)))

(declare-fun res!912377 () Bool)

(assert (=> b!1368866 (=> (not res!912377) (not e!775442))))

(declare-datatypes ((array!92938 0))(
  ( (array!92939 (arr!44893 (Array (_ BitVec 32) (_ BitVec 64))) (size!45443 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92938)

(declare-fun from!3239 () (_ BitVec 32))

(declare-datatypes ((List!31961 0))(
  ( (Nil!31958) (Cons!31957 (h!33166 (_ BitVec 64)) (t!46655 List!31961)) )
))
(declare-fun acc!866 () List!31961)

(declare-fun arrayNoDuplicates!0 (array!92938 (_ BitVec 32) List!31961) Bool)

(assert (=> b!1368866 (= res!912377 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45223 0))(
  ( (Unit!45224) )
))
(declare-fun lt!602140 () Unit!45223)

(declare-fun newAcc!98 () List!31961)

(declare-fun noDuplicateSubseq!232 (List!31961 List!31961) Unit!45223)

(assert (=> b!1368866 (= lt!602140 (noDuplicateSubseq!232 newAcc!98 acc!866))))

(declare-fun res!912378 () Bool)

(assert (=> start!115746 (=> (not res!912378) (not e!775443))))

(assert (=> start!115746 (= res!912378 (and (bvslt (size!45443 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45443 a!3861))))))

(assert (=> start!115746 e!775443))

(declare-fun array_inv!33921 (array!92938) Bool)

(assert (=> start!115746 (array_inv!33921 a!3861)))

(assert (=> start!115746 true))

(declare-fun b!1368867 () Bool)

(declare-fun noDuplicate!2500 (List!31961) Bool)

(assert (=> b!1368867 (= e!775442 (not (noDuplicate!2500 newAcc!98)))))

(assert (=> b!1368867 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) newAcc!98)))

(declare-fun lt!602139 () Unit!45223)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92938 List!31961 List!31961 (_ BitVec 32)) Unit!45223)

(assert (=> b!1368867 (= lt!602139 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 acc!866 newAcc!98 (bvadd #b00000000000000000000000000000001 from!3239)))))

(declare-fun b!1368868 () Bool)

(declare-fun res!912384 () Bool)

(assert (=> b!1368868 (=> (not res!912384) (not e!775442))))

(assert (=> b!1368868 (= res!912384 (bvslt from!3239 (size!45443 a!3861)))))

(declare-fun b!1368869 () Bool)

(declare-fun res!912376 () Bool)

(assert (=> b!1368869 (=> (not res!912376) (not e!775443))))

(declare-fun contains!9643 (List!31961 (_ BitVec 64)) Bool)

(assert (=> b!1368869 (= res!912376 (not (contains!9643 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368870 () Bool)

(declare-fun res!912382 () Bool)

(assert (=> b!1368870 (=> (not res!912382) (not e!775442))))

(assert (=> b!1368870 (= res!912382 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1368871 () Bool)

(declare-fun res!912383 () Bool)

(assert (=> b!1368871 (=> (not res!912383) (not e!775443))))

(declare-fun subseq!1045 (List!31961 List!31961) Bool)

(assert (=> b!1368871 (= res!912383 (subseq!1045 newAcc!98 acc!866))))

(declare-fun b!1368872 () Bool)

(declare-fun res!912374 () Bool)

(assert (=> b!1368872 (=> (not res!912374) (not e!775442))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1368872 (= res!912374 (not (validKeyInArray!0 (select (arr!44893 a!3861) from!3239))))))

(declare-fun b!1368873 () Bool)

(declare-fun res!912385 () Bool)

(assert (=> b!1368873 (=> (not res!912385) (not e!775443))))

(assert (=> b!1368873 (= res!912385 (not (contains!9643 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368874 () Bool)

(declare-fun res!912375 () Bool)

(assert (=> b!1368874 (=> (not res!912375) (not e!775443))))

(assert (=> b!1368874 (= res!912375 (not (contains!9643 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368875 () Bool)

(declare-fun res!912379 () Bool)

(assert (=> b!1368875 (=> (not res!912379) (not e!775442))))

(assert (=> b!1368875 (= res!912379 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun b!1368876 () Bool)

(declare-fun res!912381 () Bool)

(assert (=> b!1368876 (=> (not res!912381) (not e!775443))))

(assert (=> b!1368876 (= res!912381 (noDuplicate!2500 acc!866))))

(declare-fun b!1368877 () Bool)

(declare-fun res!912380 () Bool)

(assert (=> b!1368877 (=> (not res!912380) (not e!775443))))

(assert (=> b!1368877 (= res!912380 (not (contains!9643 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115746 res!912378) b!1368876))

(assert (= (and b!1368876 res!912381) b!1368877))

(assert (= (and b!1368877 res!912380) b!1368869))

(assert (= (and b!1368869 res!912376) b!1368874))

(assert (= (and b!1368874 res!912375) b!1368873))

(assert (= (and b!1368873 res!912385) b!1368871))

(assert (= (and b!1368871 res!912383) b!1368866))

(assert (= (and b!1368866 res!912377) b!1368868))

(assert (= (and b!1368868 res!912384) b!1368872))

(assert (= (and b!1368872 res!912374) b!1368870))

(assert (= (and b!1368870 res!912382) b!1368875))

(assert (= (and b!1368875 res!912379) b!1368867))

(declare-fun m!1252735 () Bool)

(assert (=> start!115746 m!1252735))

(declare-fun m!1252737 () Bool)

(assert (=> b!1368869 m!1252737))

(declare-fun m!1252739 () Bool)

(assert (=> b!1368867 m!1252739))

(declare-fun m!1252741 () Bool)

(assert (=> b!1368867 m!1252741))

(declare-fun m!1252743 () Bool)

(assert (=> b!1368867 m!1252743))

(declare-fun m!1252745 () Bool)

(assert (=> b!1368871 m!1252745))

(declare-fun m!1252747 () Bool)

(assert (=> b!1368876 m!1252747))

(declare-fun m!1252749 () Bool)

(assert (=> b!1368877 m!1252749))

(declare-fun m!1252751 () Bool)

(assert (=> b!1368872 m!1252751))

(assert (=> b!1368872 m!1252751))

(declare-fun m!1252753 () Bool)

(assert (=> b!1368872 m!1252753))

(declare-fun m!1252755 () Bool)

(assert (=> b!1368874 m!1252755))

(declare-fun m!1252757 () Bool)

(assert (=> b!1368875 m!1252757))

(declare-fun m!1252759 () Bool)

(assert (=> b!1368873 m!1252759))

(declare-fun m!1252761 () Bool)

(assert (=> b!1368866 m!1252761))

(declare-fun m!1252763 () Bool)

(assert (=> b!1368866 m!1252763))

(push 1)

(assert (not b!1368872))

(assert (not b!1368877))

(assert (not b!1368869))

(assert (not b!1368873))

(assert (not b!1368866))

(assert (not b!1368871))

(assert (not b!1368876))

(assert (not start!115746))

(assert (not b!1368867))

(assert (not b!1368875))

(assert (not b!1368874))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!146927 () Bool)

(declare-fun res!912429 () Bool)

(declare-fun e!775487 () Bool)

(assert (=> d!146927 (=> res!912429 e!775487)))

(assert (=> d!146927 (= res!912429 (is-Nil!31958 newAcc!98))))

(assert (=> d!146927 (= (subseq!1045 newAcc!98 acc!866) e!775487)))

(declare-fun b!1368925 () Bool)

(declare-fun e!775488 () Bool)

(assert (=> b!1368925 (= e!775488 (subseq!1045 (t!46655 newAcc!98) (t!46655 acc!866)))))

(declare-fun b!1368923 () Bool)

(declare-fun e!775490 () Bool)

(assert (=> b!1368923 (= e!775487 e!775490)))

(declare-fun res!912430 () Bool)

(assert (=> b!1368923 (=> (not res!912430) (not e!775490))))

(assert (=> b!1368923 (= res!912430 (is-Cons!31957 acc!866))))

(declare-fun b!1368926 () Bool)

(declare-fun e!775492 () Bool)

(assert (=> b!1368926 (= e!775492 (subseq!1045 newAcc!98 (t!46655 acc!866)))))

(declare-fun b!1368924 () Bool)

(assert (=> b!1368924 (= e!775490 e!775492)))

(declare-fun res!912426 () Bool)

(assert (=> b!1368924 (=> res!912426 e!775492)))

(assert (=> b!1368924 (= res!912426 e!775488)))

(declare-fun res!912425 () Bool)

(assert (=> b!1368924 (=> (not res!912425) (not e!775488))))

(assert (=> b!1368924 (= res!912425 (= (h!33166 newAcc!98) (h!33166 acc!866)))))

(assert (= (and d!146927 (not res!912429)) b!1368923))

(assert (= (and b!1368923 res!912430) b!1368924))

(assert (= (and b!1368924 res!912425) b!1368925))

(assert (= (and b!1368924 (not res!912426)) b!1368926))

(declare-fun m!1252799 () Bool)

(assert (=> b!1368925 m!1252799))

(declare-fun m!1252801 () Bool)

(assert (=> b!1368926 m!1252801))

(assert (=> b!1368871 d!146927))

(declare-fun d!146935 () Bool)

(declare-fun res!912447 () Bool)

(declare-fun e!775511 () Bool)

(assert (=> d!146935 (=> res!912447 e!775511)))

(assert (=> d!146935 (= res!912447 (is-Nil!31958 acc!866))))

(assert (=> d!146935 (= (noDuplicate!2500 acc!866) e!775511)))

(declare-fun b!1368949 () Bool)

(declare-fun e!775512 () Bool)

(assert (=> b!1368949 (= e!775511 e!775512)))

(declare-fun res!912448 () Bool)

(assert (=> b!1368949 (=> (not res!912448) (not e!775512))))

(assert (=> b!1368949 (= res!912448 (not (contains!9643 (t!46655 acc!866) (h!33166 acc!866))))))

(declare-fun b!1368950 () Bool)

(assert (=> b!1368950 (= e!775512 (noDuplicate!2500 (t!46655 acc!866)))))

(assert (= (and d!146935 (not res!912447)) b!1368949))

(assert (= (and b!1368949 res!912448) b!1368950))

(declare-fun m!1252803 () Bool)

(assert (=> b!1368949 m!1252803))

(declare-fun m!1252805 () Bool)

(assert (=> b!1368950 m!1252805))

(assert (=> b!1368876 d!146935))

(declare-fun d!146937 () Bool)

(declare-fun lt!602153 () Bool)

(declare-fun content!722 (List!31961) (Set (_ BitVec 64)))

(assert (=> d!146937 (= lt!602153 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!722 acc!866)))))

(declare-fun e!775529 () Bool)

(assert (=> d!146937 (= lt!602153 e!775529)))

(declare-fun res!912464 () Bool)

(assert (=> d!146937 (=> (not res!912464) (not e!775529))))

(assert (=> d!146937 (= res!912464 (is-Cons!31957 acc!866))))

(assert (=> d!146937 (= (contains!9643 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602153)))

(declare-fun b!1368968 () Bool)

(declare-fun e!775530 () Bool)

(assert (=> b!1368968 (= e!775529 e!775530)))

(declare-fun res!912465 () Bool)

(assert (=> b!1368968 (=> res!912465 e!775530)))

(assert (=> b!1368968 (= res!912465 (= (h!33166 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1368969 () Bool)

(assert (=> b!1368969 (= e!775530 (contains!9643 (t!46655 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146937 res!912464) b!1368968))

(assert (= (and b!1368968 (not res!912465)) b!1368969))

(declare-fun m!1252819 () Bool)

(assert (=> d!146937 m!1252819))

(declare-fun m!1252821 () Bool)

(assert (=> d!146937 m!1252821))

(declare-fun m!1252823 () Bool)

(assert (=> b!1368969 m!1252823))

(assert (=> b!1368877 d!146937))

(declare-fun b!1369014 () Bool)

(declare-fun e!775570 () Bool)

(declare-fun call!65504 () Bool)

(assert (=> b!1369014 (= e!775570 call!65504)))

(declare-fun b!1369016 () Bool)

(assert (=> b!1369016 (= e!775570 call!65504)))

(declare-fun c!127697 () Bool)

(declare-fun bm!65501 () Bool)

(assert (=> bm!65501 (= call!65504 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!127697 (Cons!31957 (select (arr!44893 a!3861) from!3239) acc!866) acc!866)))))

(declare-fun b!1369017 () Bool)

(declare-fun e!775572 () Bool)

(declare-fun e!775573 () Bool)

(assert (=> b!1369017 (= e!775572 e!775573)))

(declare-fun res!912500 () Bool)

(assert (=> b!1369017 (=> (not res!912500) (not e!775573))))

(declare-fun e!775571 () Bool)

(assert (=> b!1369017 (= res!912500 (not e!775571))))

(declare-fun res!912501 () Bool)

(assert (=> b!1369017 (=> (not res!912501) (not e!775571))))

(assert (=> b!1369017 (= res!912501 (validKeyInArray!0 (select (arr!44893 a!3861) from!3239)))))

(declare-fun b!1369018 () Bool)

(assert (=> b!1369018 (= e!775571 (contains!9643 acc!866 (select (arr!44893 a!3861) from!3239)))))

(declare-fun b!1369015 () Bool)

(assert (=> b!1369015 (= e!775573 e!775570)))

(assert (=> b!1369015 (= c!127697 (validKeyInArray!0 (select (arr!44893 a!3861) from!3239)))))

(declare-fun d!146945 () Bool)

(declare-fun res!912502 () Bool)

(assert (=> d!146945 (=> res!912502 e!775572)))

(assert (=> d!146945 (= res!912502 (bvsge from!3239 (size!45443 a!3861)))))

(assert (=> d!146945 (= (arrayNoDuplicates!0 a!3861 from!3239 acc!866) e!775572)))

(assert (= (and d!146945 (not res!912502)) b!1369017))

(assert (= (and b!1369017 res!912501) b!1369018))

(assert (= (and b!1369017 res!912500) b!1369015))

(assert (= (and b!1369015 c!127697) b!1369014))

(assert (= (and b!1369015 (not c!127697)) b!1369016))

(assert (= (or b!1369014 b!1369016) bm!65501))

(assert (=> bm!65501 m!1252751))

(declare-fun m!1252853 () Bool)

(assert (=> bm!65501 m!1252853))

(assert (=> b!1369017 m!1252751))

(assert (=> b!1369017 m!1252751))

(assert (=> b!1369017 m!1252753))

(assert (=> b!1369018 m!1252751))

(assert (=> b!1369018 m!1252751))

(declare-fun m!1252855 () Bool)

(assert (=> b!1369018 m!1252855))

(assert (=> b!1369015 m!1252751))

(assert (=> b!1369015 m!1252751))

(assert (=> b!1369015 m!1252753))

(assert (=> b!1368866 d!146945))

(declare-fun d!146967 () Bool)

(assert (=> d!146967 (noDuplicate!2500 newAcc!98)))

(declare-fun lt!602167 () Unit!45223)

(declare-fun choose!2001 (List!31961 List!31961) Unit!45223)

(assert (=> d!146967 (= lt!602167 (choose!2001 newAcc!98 acc!866))))

(declare-fun e!775586 () Bool)

(assert (=> d!146967 e!775586))

(declare-fun res!912514 () Bool)

(assert (=> d!146967 (=> (not res!912514) (not e!775586))))

(assert (=> d!146967 (= res!912514 (subseq!1045 newAcc!98 acc!866))))

(assert (=> d!146967 (= (noDuplicateSubseq!232 newAcc!98 acc!866) lt!602167)))

(declare-fun b!1369032 () Bool)

(assert (=> b!1369032 (= e!775586 (noDuplicate!2500 acc!866))))

(assert (= (and d!146967 res!912514) b!1369032))

(assert (=> d!146967 m!1252739))

(declare-fun m!1252873 () Bool)

(assert (=> d!146967 m!1252873))

(assert (=> d!146967 m!1252745))

(assert (=> b!1369032 m!1252747))

(assert (=> b!1368866 d!146967))

(declare-fun b!1369036 () Bool)

(declare-fun e!775589 () Bool)

(declare-fun call!65506 () Bool)

(assert (=> b!1369036 (= e!775589 call!65506)))

(declare-fun b!1369038 () Bool)

(assert (=> b!1369038 (= e!775589 call!65506)))

(declare-fun c!127699 () Bool)

(declare-fun bm!65503 () Bool)

(assert (=> bm!65503 (= call!65506 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239 #b00000000000000000000000000000001) (ite c!127699 (Cons!31957 (select (arr!44893 a!3861) (bvadd #b00000000000000000000000000000001 from!3239)) acc!866) acc!866)))))

(declare-fun b!1369039 () Bool)

(declare-fun e!775592 () Bool)

(declare-fun e!775593 () Bool)

(assert (=> b!1369039 (= e!775592 e!775593)))

(declare-fun res!912516 () Bool)

(assert (=> b!1369039 (=> (not res!912516) (not e!775593))))

(declare-fun e!775590 () Bool)

(assert (=> b!1369039 (= res!912516 (not e!775590))))

(declare-fun res!912518 () Bool)

(assert (=> b!1369039 (=> (not res!912518) (not e!775590))))

(assert (=> b!1369039 (= res!912518 (validKeyInArray!0 (select (arr!44893 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1369040 () Bool)

(assert (=> b!1369040 (= e!775590 (contains!9643 acc!866 (select (arr!44893 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1369037 () Bool)

(assert (=> b!1369037 (= e!775593 e!775589)))

(assert (=> b!1369037 (= c!127699 (validKeyInArray!0 (select (arr!44893 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun d!146975 () Bool)

(declare-fun res!912520 () Bool)

(assert (=> d!146975 (=> res!912520 e!775592)))

(assert (=> d!146975 (= res!912520 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) (size!45443 a!3861)))))

(assert (=> d!146975 (= (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866) e!775592)))

(assert (= (and d!146975 (not res!912520)) b!1369039))

(assert (= (and b!1369039 res!912518) b!1369040))

(assert (= (and b!1369039 res!912516) b!1369037))

(assert (= (and b!1369037 c!127699) b!1369036))

