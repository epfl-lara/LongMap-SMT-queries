; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115892 () Bool)

(assert start!115892)

(declare-fun b!1370033 () Bool)

(declare-fun res!913502 () Bool)

(declare-fun e!775993 () Bool)

(assert (=> b!1370033 (=> (not res!913502) (not e!775993))))

(declare-datatypes ((List!31992 0))(
  ( (Nil!31989) (Cons!31988 (h!33197 (_ BitVec 64)) (t!46686 List!31992)) )
))
(declare-fun acc!866 () List!31992)

(declare-fun contains!9674 (List!31992 (_ BitVec 64)) Bool)

(assert (=> b!1370033 (= res!913502 (not (contains!9674 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1370034 () Bool)

(declare-fun res!913493 () Bool)

(assert (=> b!1370034 (=> (not res!913493) (not e!775993))))

(declare-fun noDuplicate!2531 (List!31992) Bool)

(assert (=> b!1370034 (= res!913493 (noDuplicate!2531 acc!866))))

(declare-fun res!913504 () Bool)

(assert (=> start!115892 (=> (not res!913504) (not e!775993))))

(declare-datatypes ((array!93006 0))(
  ( (array!93007 (arr!44924 (Array (_ BitVec 32) (_ BitVec 64))) (size!45474 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93006)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115892 (= res!913504 (and (bvslt (size!45474 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45474 a!3861))))))

(assert (=> start!115892 e!775993))

(declare-fun array_inv!33952 (array!93006) Bool)

(assert (=> start!115892 (array_inv!33952 a!3861)))

(assert (=> start!115892 true))

(declare-fun b!1370035 () Bool)

(declare-fun res!913494 () Bool)

(declare-fun e!775991 () Bool)

(assert (=> b!1370035 (=> (not res!913494) (not e!775991))))

(assert (=> b!1370035 (= res!913494 (bvslt from!3239 (size!45474 a!3861)))))

(declare-fun b!1370036 () Bool)

(declare-fun res!913500 () Bool)

(assert (=> b!1370036 (=> (not res!913500) (not e!775991))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1370036 (= res!913500 (validKeyInArray!0 (select (arr!44924 a!3861) from!3239)))))

(declare-fun b!1370037 () Bool)

(declare-fun res!913499 () Bool)

(assert (=> b!1370037 (=> (not res!913499) (not e!775993))))

(declare-fun newAcc!98 () List!31992)

(assert (=> b!1370037 (= res!913499 (not (contains!9674 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1370038 () Bool)

(declare-fun res!913503 () Bool)

(assert (=> b!1370038 (=> (not res!913503) (not e!775993))))

(declare-fun subseq!1076 (List!31992 List!31992) Bool)

(assert (=> b!1370038 (= res!913503 (subseq!1076 newAcc!98 acc!866))))

(declare-fun b!1370039 () Bool)

(assert (=> b!1370039 (= e!775993 e!775991)))

(declare-fun res!913498 () Bool)

(assert (=> b!1370039 (=> (not res!913498) (not e!775991))))

(declare-fun arrayNoDuplicates!0 (array!93006 (_ BitVec 32) List!31992) Bool)

(assert (=> b!1370039 (= res!913498 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45285 0))(
  ( (Unit!45286) )
))
(declare-fun lt!602377 () Unit!45285)

(declare-fun noDuplicateSubseq!263 (List!31992 List!31992) Unit!45285)

(assert (=> b!1370039 (= lt!602377 (noDuplicateSubseq!263 newAcc!98 acc!866))))

(declare-fun b!1370040 () Bool)

(assert (=> b!1370040 (= e!775991 (not (noDuplicate!2531 (Cons!31988 (select (arr!44924 a!3861) from!3239) acc!866))))))

(declare-fun b!1370041 () Bool)

(declare-fun res!913496 () Bool)

(assert (=> b!1370041 (=> (not res!913496) (not e!775991))))

(assert (=> b!1370041 (= res!913496 (not (contains!9674 acc!866 (select (arr!44924 a!3861) from!3239))))))

(declare-fun b!1370042 () Bool)

(declare-fun res!913501 () Bool)

(assert (=> b!1370042 (=> (not res!913501) (not e!775993))))

(assert (=> b!1370042 (= res!913501 (not (contains!9674 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1370043 () Bool)

(declare-fun res!913495 () Bool)

(assert (=> b!1370043 (=> (not res!913495) (not e!775991))))

(assert (=> b!1370043 (= res!913495 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1370044 () Bool)

(declare-fun res!913497 () Bool)

(assert (=> b!1370044 (=> (not res!913497) (not e!775993))))

(assert (=> b!1370044 (= res!913497 (not (contains!9674 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115892 res!913504) b!1370034))

(assert (= (and b!1370034 res!913493) b!1370042))

(assert (= (and b!1370042 res!913501) b!1370033))

(assert (= (and b!1370033 res!913502) b!1370044))

(assert (= (and b!1370044 res!913497) b!1370037))

(assert (= (and b!1370037 res!913499) b!1370038))

(assert (= (and b!1370038 res!913503) b!1370039))

(assert (= (and b!1370039 res!913498) b!1370035))

(assert (= (and b!1370035 res!913494) b!1370036))

(assert (= (and b!1370036 res!913500) b!1370041))

(assert (= (and b!1370041 res!913496) b!1370043))

(assert (= (and b!1370043 res!913495) b!1370040))

(declare-fun m!1253689 () Bool)

(assert (=> b!1370042 m!1253689))

(declare-fun m!1253691 () Bool)

(assert (=> b!1370038 m!1253691))

(declare-fun m!1253693 () Bool)

(assert (=> b!1370034 m!1253693))

(declare-fun m!1253695 () Bool)

(assert (=> b!1370036 m!1253695))

(assert (=> b!1370036 m!1253695))

(declare-fun m!1253697 () Bool)

(assert (=> b!1370036 m!1253697))

(declare-fun m!1253699 () Bool)

(assert (=> b!1370033 m!1253699))

(declare-fun m!1253701 () Bool)

(assert (=> b!1370044 m!1253701))

(declare-fun m!1253703 () Bool)

(assert (=> b!1370037 m!1253703))

(assert (=> b!1370040 m!1253695))

(declare-fun m!1253705 () Bool)

(assert (=> b!1370040 m!1253705))

(assert (=> b!1370041 m!1253695))

(assert (=> b!1370041 m!1253695))

(declare-fun m!1253707 () Bool)

(assert (=> b!1370041 m!1253707))

(declare-fun m!1253709 () Bool)

(assert (=> start!115892 m!1253709))

(declare-fun m!1253711 () Bool)

(assert (=> b!1370039 m!1253711))

(declare-fun m!1253713 () Bool)

(assert (=> b!1370039 m!1253713))

(push 1)

(assert (not b!1370040))

(assert (not b!1370037))

(assert (not b!1370042))

(assert (not b!1370041))

(assert (not b!1370038))

(assert (not b!1370036))

(assert (not b!1370039))

(assert (not b!1370033))

(assert (not start!115892))

(assert (not b!1370034))

(assert (not b!1370044))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!147091 () Bool)

(assert (=> d!147091 (= (array_inv!33952 a!3861) (bvsge (size!45474 a!3861) #b00000000000000000000000000000000))))

(assert (=> start!115892 d!147091))

(declare-fun d!147095 () Bool)

(declare-fun res!913605 () Bool)

(declare-fun e!776040 () Bool)

(assert (=> d!147095 (=> res!913605 e!776040)))

(assert (=> d!147095 (= res!913605 (is-Nil!31989 (Cons!31988 (select (arr!44924 a!3861) from!3239) acc!866)))))

(assert (=> d!147095 (= (noDuplicate!2531 (Cons!31988 (select (arr!44924 a!3861) from!3239) acc!866)) e!776040)))

(declare-fun b!1370145 () Bool)

(declare-fun e!776041 () Bool)

(assert (=> b!1370145 (= e!776040 e!776041)))

(declare-fun res!913606 () Bool)

(assert (=> b!1370145 (=> (not res!913606) (not e!776041))))

(assert (=> b!1370145 (= res!913606 (not (contains!9674 (t!46686 (Cons!31988 (select (arr!44924 a!3861) from!3239) acc!866)) (h!33197 (Cons!31988 (select (arr!44924 a!3861) from!3239) acc!866)))))))

(declare-fun b!1370146 () Bool)

(assert (=> b!1370146 (= e!776041 (noDuplicate!2531 (t!46686 (Cons!31988 (select (arr!44924 a!3861) from!3239) acc!866))))))

(assert (= (and d!147095 (not res!913605)) b!1370145))

(assert (= (and b!1370145 res!913606) b!1370146))

(declare-fun m!1253787 () Bool)

(assert (=> b!1370145 m!1253787))

(declare-fun m!1253789 () Bool)

(assert (=> b!1370146 m!1253789))

(assert (=> b!1370040 d!147095))

(declare-fun d!147097 () Bool)

(declare-fun res!913607 () Bool)

(declare-fun e!776042 () Bool)

(assert (=> d!147097 (=> res!913607 e!776042)))

(assert (=> d!147097 (= res!913607 (is-Nil!31989 acc!866))))

(assert (=> d!147097 (= (noDuplicate!2531 acc!866) e!776042)))

(declare-fun b!1370147 () Bool)

(declare-fun e!776043 () Bool)

(assert (=> b!1370147 (= e!776042 e!776043)))

(declare-fun res!913608 () Bool)

(assert (=> b!1370147 (=> (not res!913608) (not e!776043))))

(assert (=> b!1370147 (= res!913608 (not (contains!9674 (t!46686 acc!866) (h!33197 acc!866))))))

(declare-fun b!1370148 () Bool)

(assert (=> b!1370148 (= e!776043 (noDuplicate!2531 (t!46686 acc!866)))))

(assert (= (and d!147097 (not res!913607)) b!1370147))

(assert (= (and b!1370147 res!913608) b!1370148))

(declare-fun m!1253791 () Bool)

(assert (=> b!1370147 m!1253791))

(declare-fun m!1253793 () Bool)

(assert (=> b!1370148 m!1253793))

(assert (=> b!1370034 d!147097))

(declare-fun e!776075 () Bool)

(declare-fun b!1370183 () Bool)

(assert (=> b!1370183 (= e!776075 (contains!9674 acc!866 (select (arr!44924 a!3861) from!3239)))))

(declare-fun c!127714 () Bool)

(declare-fun bm!65518 () Bool)

(declare-fun call!65521 () Bool)

(assert (=> bm!65518 (= call!65521 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!127714 (Cons!31988 (select (arr!44924 a!3861) from!3239) acc!866) acc!866)))))

(declare-fun b!1370184 () Bool)

(declare-fun e!776074 () Bool)

(assert (=> b!1370184 (= e!776074 call!65521)))

(declare-fun b!1370185 () Bool)

(declare-fun e!776076 () Bool)

(assert (=> b!1370185 (= e!776076 e!776074)))

(assert (=> b!1370185 (= c!127714 (validKeyInArray!0 (select (arr!44924 a!3861) from!3239)))))

(declare-fun d!147099 () Bool)

(declare-fun res!913637 () Bool)

(declare-fun e!776077 () Bool)

(assert (=> d!147099 (=> res!913637 e!776077)))

(assert (=> d!147099 (= res!913637 (bvsge from!3239 (size!45474 a!3861)))))

(assert (=> d!147099 (= (arrayNoDuplicates!0 a!3861 from!3239 acc!866) e!776077)))

(declare-fun b!1370186 () Bool)

(assert (=> b!1370186 (= e!776077 e!776076)))

(declare-fun res!913636 () Bool)

(assert (=> b!1370186 (=> (not res!913636) (not e!776076))))

(assert (=> b!1370186 (= res!913636 (not e!776075))))

(declare-fun res!913635 () Bool)

(assert (=> b!1370186 (=> (not res!913635) (not e!776075))))

(assert (=> b!1370186 (= res!913635 (validKeyInArray!0 (select (arr!44924 a!3861) from!3239)))))

(declare-fun b!1370187 () Bool)

(assert (=> b!1370187 (= e!776074 call!65521)))

(assert (= (and d!147099 (not res!913637)) b!1370186))

(assert (= (and b!1370186 res!913635) b!1370183))

(assert (= (and b!1370186 res!913636) b!1370185))

(assert (= (and b!1370185 c!127714) b!1370187))

(assert (= (and b!1370185 (not c!127714)) b!1370184))

(assert (= (or b!1370187 b!1370184) bm!65518))

(assert (=> b!1370183 m!1253695))

(assert (=> b!1370183 m!1253695))

(assert (=> b!1370183 m!1253707))

(assert (=> bm!65518 m!1253695))

(declare-fun m!1253813 () Bool)

(assert (=> bm!65518 m!1253813))

(assert (=> b!1370185 m!1253695))

(assert (=> b!1370185 m!1253695))

(assert (=> b!1370185 m!1253697))

(assert (=> b!1370186 m!1253695))

(assert (=> b!1370186 m!1253695))

(assert (=> b!1370186 m!1253697))

(assert (=> b!1370039 d!147099))

(declare-fun d!147117 () Bool)

(assert (=> d!147117 (noDuplicate!2531 newAcc!98)))

(declare-fun lt!602397 () Unit!45285)

(declare-fun choose!2005 (List!31992 List!31992) Unit!45285)

(assert (=> d!147117 (= lt!602397 (choose!2005 newAcc!98 acc!866))))

(declare-fun e!776094 () Bool)

(assert (=> d!147117 e!776094))

(declare-fun res!913653 () Bool)

(assert (=> d!147117 (=> (not res!913653) (not e!776094))))

(assert (=> d!147117 (= res!913653 (subseq!1076 newAcc!98 acc!866))))

(assert (=> d!147117 (= (noDuplicateSubseq!263 newAcc!98 acc!866) lt!602397)))

(declare-fun b!1370205 () Bool)

(assert (=> b!1370205 (= e!776094 (noDuplicate!2531 acc!866))))

(assert (= (and d!147117 res!913653) b!1370205))

(declare-fun m!1253831 () Bool)

(assert (=> d!147117 m!1253831))

(declare-fun m!1253833 () Bool)

(assert (=> d!147117 m!1253833))

(assert (=> d!147117 m!1253691))

(assert (=> b!1370205 m!1253693))

(assert (=> b!1370039 d!147117))

(declare-fun d!147127 () Bool)

(declare-fun lt!602404 () Bool)

(declare-fun content!728 (List!31992) (Set (_ BitVec 64)))

(assert (=> d!147127 (= lt!602404 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!728 newAcc!98)))))

(declare-fun e!776115 () Bool)

(assert (=> d!147127 (= lt!602404 e!776115)))

(declare-fun res!913673 () Bool)

(assert (=> d!147127 (=> (not res!913673) (not e!776115))))

(assert (=> d!147127 (= res!913673 (is-Cons!31988 newAcc!98))))

(assert (=> d!147127 (= (contains!9674 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602404)))

(declare-fun b!1370225 () Bool)

(declare-fun e!776114 () Bool)

(assert (=> b!1370225 (= e!776115 e!776114)))

(declare-fun res!913674 () Bool)

(assert (=> b!1370225 (=> res!913674 e!776114)))

(assert (=> b!1370225 (= res!913674 (= (h!33197 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1370226 () Bool)

(assert (=> b!1370226 (= e!776114 (contains!9674 (t!46686 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147127 res!913673) b!1370225))

(assert (= (and b!1370225 (not res!913674)) b!1370226))

(declare-fun m!1253847 () Bool)

(assert (=> d!147127 m!1253847))

(declare-fun m!1253849 () Bool)

(assert (=> d!147127 m!1253849))

(declare-fun m!1253851 () Bool)

(assert (=> b!1370226 m!1253851))

(assert (=> b!1370044 d!147127))

(declare-fun d!147133 () Bool)

(declare-fun lt!602405 () Bool)

(assert (=> d!147133 (= lt!602405 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!728 acc!866)))))

(declare-fun e!776121 () Bool)

(assert (=> d!147133 (= lt!602405 e!776121)))

(declare-fun res!913679 () Bool)

(assert (=> d!147133 (=> (not res!913679) (not e!776121))))

(assert (=> d!147133 (= res!913679 (is-Cons!31988 acc!866))))

(assert (=> d!147133 (= (contains!9674 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602405)))

(declare-fun b!1370231 () Bool)

(declare-fun e!776120 () Bool)

(assert (=> b!1370231 (= e!776121 e!776120)))

(declare-fun res!913680 () Bool)

(assert (=> b!1370231 (=> res!913680 e!776120)))

(assert (=> b!1370231 (= res!913680 (= (h!33197 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1370232 () Bool)

(assert (=> b!1370232 (= e!776120 (contains!9674 (t!46686 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147133 res!913679) b!1370231))

(assert (= (and b!1370231 (not res!913680)) b!1370232))

(declare-fun m!1253855 () Bool)

(assert (=> d!147133 m!1253855))

(declare-fun m!1253859 () Bool)

(assert (=> d!147133 m!1253859))

(declare-fun m!1253861 () Bool)

(assert (=> b!1370232 m!1253861))

(assert (=> b!1370033 d!147133))

(declare-fun b!1370251 () Bool)

(declare-fun e!776143 () Bool)

(assert (=> b!1370251 (= e!776143 (subseq!1076 (t!46686 newAcc!98) (t!46686 acc!866)))))

(declare-fun d!147137 () Bool)

(declare-fun res!913702 () Bool)

(declare-fun e!776140 () Bool)

(assert (=> d!147137 (=> res!913702 e!776140)))

(assert (=> d!147137 (= res!913702 (is-Nil!31989 newAcc!98))))

(assert (=> d!147137 (= (subseq!1076 newAcc!98 acc!866) e!776140)))

(declare-fun b!1370252 () Bool)

(declare-fun e!776141 () Bool)

(assert (=> b!1370252 (= e!776141 (subseq!1076 newAcc!98 (t!46686 acc!866)))))

(declare-fun b!1370250 () Bool)

(declare-fun e!776142 () Bool)

(assert (=> b!1370250 (= e!776142 e!776141)))

(declare-fun res!913700 () Bool)

(assert (=> b!1370250 (=> res!913700 e!776141)))

(assert (=> b!1370250 (= res!913700 e!776143)))

(declare-fun res!913701 () Bool)

(assert (=> b!1370250 (=> (not res!913701) (not e!776143))))

(assert (=> b!1370250 (= res!913701 (= (h!33197 newAcc!98) (h!33197 acc!866)))))

(declare-fun b!1370249 () Bool)

(assert (=> b!1370249 (= e!776140 e!776142)))

(declare-fun res!913699 () Bool)

(assert (=> b!1370249 (=> (not res!913699) (not e!776142))))

(assert (=> b!1370249 (= res!913699 (is-Cons!31988 acc!866))))

(assert (= (and d!147137 (not res!913702)) b!1370249))

(assert (= (and b!1370249 res!913699) b!1370250))

(assert (= (and b!1370250 res!913701) b!1370251))

(assert (= (and b!1370250 (not res!913700)) b!1370252))

(declare-fun m!1253871 () Bool)

(assert (=> b!1370251 m!1253871))

(declare-fun m!1253873 () Bool)

(assert (=> b!1370252 m!1253873))

(assert (=> b!1370038 d!147137))

(declare-fun d!147143 () Bool)

(declare-fun lt!602408 () Bool)

(assert (=> d!147143 (= lt!602408 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!728 newAcc!98)))))

(declare-fun e!776147 () Bool)

(assert (=> d!147143 (= lt!602408 e!776147)))

(declare-fun res!913703 () Bool)

(assert (=> d!147143 (=> (not res!913703) (not e!776147))))

(assert (=> d!147143 (= res!913703 (is-Cons!31988 newAcc!98))))

(assert (=> d!147143 (= (contains!9674 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602408)))

(declare-fun b!1370259 () Bool)

(declare-fun e!776146 () Bool)

(assert (=> b!1370259 (= e!776147 e!776146)))

(declare-fun res!913704 () Bool)

(assert (=> b!1370259 (=> res!913704 e!776146)))

(assert (=> b!1370259 (= res!913704 (= (h!33197 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1370260 () Bool)

(assert (=> b!1370260 (= e!776146 (contains!9674 (t!46686 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147143 res!913703) b!1370259))

(assert (= (and b!1370259 (not res!913704)) b!1370260))

(assert (=> d!147143 m!1253847))

(declare-fun m!1253875 () Bool)

(assert (=> d!147143 m!1253875))

(declare-fun m!1253877 () Bool)

(assert (=> b!1370260 m!1253877))

(assert (=> b!1370037 d!147143))

(declare-fun d!147145 () Bool)

(declare-fun lt!602409 () Bool)

(assert (=> d!147145 (= lt!602409 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!728 acc!866)))))

(declare-fun e!776149 () Bool)

