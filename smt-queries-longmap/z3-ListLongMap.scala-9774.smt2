; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115816 () Bool)

(assert start!115816)

(declare-fun b!1369337 () Bool)

(declare-fun res!912818 () Bool)

(declare-fun e!775688 () Bool)

(assert (=> b!1369337 (=> (not res!912818) (not e!775688))))

(declare-datatypes ((List!31972 0))(
  ( (Nil!31969) (Cons!31968 (h!33177 (_ BitVec 64)) (t!46666 List!31972)) )
))
(declare-fun newAcc!98 () List!31972)

(declare-fun acc!866 () List!31972)

(declare-fun subseq!1056 (List!31972 List!31972) Bool)

(assert (=> b!1369337 (= res!912818 (subseq!1056 newAcc!98 acc!866))))

(declare-fun b!1369338 () Bool)

(declare-fun res!912822 () Bool)

(assert (=> b!1369338 (=> (not res!912822) (not e!775688))))

(declare-fun contains!9654 (List!31972 (_ BitVec 64)) Bool)

(assert (=> b!1369338 (= res!912822 (not (contains!9654 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!912815 () Bool)

(assert (=> start!115816 (=> (not res!912815) (not e!775688))))

(declare-datatypes ((array!92963 0))(
  ( (array!92964 (arr!44904 (Array (_ BitVec 32) (_ BitVec 64))) (size!45454 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92963)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115816 (= res!912815 (and (bvslt (size!45454 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45454 a!3861))))))

(assert (=> start!115816 e!775688))

(declare-fun array_inv!33932 (array!92963) Bool)

(assert (=> start!115816 (array_inv!33932 a!3861)))

(assert (=> start!115816 true))

(declare-fun b!1369339 () Bool)

(declare-fun res!912817 () Bool)

(assert (=> b!1369339 (=> (not res!912817) (not e!775688))))

(assert (=> b!1369339 (= res!912817 (not (contains!9654 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369340 () Bool)

(declare-fun e!775689 () Bool)

(declare-fun noDuplicate!2511 (List!31972) Bool)

(assert (=> b!1369340 (= e!775689 (not (noDuplicate!2511 newAcc!98)))))

(declare-fun b!1369341 () Bool)

(assert (=> b!1369341 (= e!775688 e!775689)))

(declare-fun res!912819 () Bool)

(assert (=> b!1369341 (=> (not res!912819) (not e!775689))))

(declare-fun arrayNoDuplicates!0 (array!92963 (_ BitVec 32) List!31972) Bool)

(assert (=> b!1369341 (= res!912819 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45245 0))(
  ( (Unit!45246) )
))
(declare-fun lt!602245 () Unit!45245)

(declare-fun noDuplicateSubseq!243 (List!31972 List!31972) Unit!45245)

(assert (=> b!1369341 (= lt!602245 (noDuplicateSubseq!243 newAcc!98 acc!866))))

(declare-fun b!1369342 () Bool)

(declare-fun res!912816 () Bool)

(assert (=> b!1369342 (=> (not res!912816) (not e!775688))))

(assert (=> b!1369342 (= res!912816 (not (contains!9654 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369343 () Bool)

(declare-fun res!912821 () Bool)

(assert (=> b!1369343 (=> (not res!912821) (not e!775689))))

(assert (=> b!1369343 (= res!912821 (bvsge from!3239 (size!45454 a!3861)))))

(declare-fun b!1369344 () Bool)

(declare-fun res!912823 () Bool)

(assert (=> b!1369344 (=> (not res!912823) (not e!775688))))

(assert (=> b!1369344 (= res!912823 (noDuplicate!2511 acc!866))))

(declare-fun b!1369345 () Bool)

(declare-fun res!912820 () Bool)

(assert (=> b!1369345 (=> (not res!912820) (not e!775688))))

(assert (=> b!1369345 (= res!912820 (not (contains!9654 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115816 res!912815) b!1369344))

(assert (= (and b!1369344 res!912823) b!1369342))

(assert (= (and b!1369342 res!912816) b!1369339))

(assert (= (and b!1369339 res!912817) b!1369338))

(assert (= (and b!1369338 res!912822) b!1369345))

(assert (= (and b!1369345 res!912820) b!1369337))

(assert (= (and b!1369337 res!912818) b!1369341))

(assert (= (and b!1369341 res!912819) b!1369343))

(assert (= (and b!1369343 res!912821) b!1369340))

(declare-fun m!1253139 () Bool)

(assert (=> b!1369341 m!1253139))

(declare-fun m!1253141 () Bool)

(assert (=> b!1369341 m!1253141))

(declare-fun m!1253143 () Bool)

(assert (=> b!1369337 m!1253143))

(declare-fun m!1253145 () Bool)

(assert (=> b!1369345 m!1253145))

(declare-fun m!1253147 () Bool)

(assert (=> b!1369340 m!1253147))

(declare-fun m!1253149 () Bool)

(assert (=> b!1369342 m!1253149))

(declare-fun m!1253151 () Bool)

(assert (=> b!1369338 m!1253151))

(declare-fun m!1253153 () Bool)

(assert (=> b!1369339 m!1253153))

(declare-fun m!1253155 () Bool)

(assert (=> start!115816 m!1253155))

(declare-fun m!1253157 () Bool)

(assert (=> b!1369344 m!1253157))

(check-sat (not b!1369345) (not start!115816) (not b!1369342) (not b!1369338) (not b!1369339) (not b!1369340) (not b!1369341) (not b!1369337) (not b!1369344))
(check-sat)
(get-model)

(declare-fun call!65510 () Bool)

(declare-fun c!127703 () Bool)

(declare-fun bm!65507 () Bool)

(assert (=> bm!65507 (= call!65510 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!127703 (Cons!31968 (select (arr!44904 a!3861) from!3239) acc!866) acc!866)))))

(declare-fun b!1369395 () Bool)

(declare-fun e!775722 () Bool)

(assert (=> b!1369395 (= e!775722 call!65510)))

(declare-fun d!147007 () Bool)

(declare-fun res!912871 () Bool)

(declare-fun e!775720 () Bool)

(assert (=> d!147007 (=> res!912871 e!775720)))

(assert (=> d!147007 (= res!912871 (bvsge from!3239 (size!45454 a!3861)))))

(assert (=> d!147007 (= (arrayNoDuplicates!0 a!3861 from!3239 acc!866) e!775720)))

(declare-fun b!1369396 () Bool)

(declare-fun e!775723 () Bool)

(assert (=> b!1369396 (= e!775723 e!775722)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1369396 (= c!127703 (validKeyInArray!0 (select (arr!44904 a!3861) from!3239)))))

(declare-fun e!775721 () Bool)

(declare-fun b!1369397 () Bool)

(assert (=> b!1369397 (= e!775721 (contains!9654 acc!866 (select (arr!44904 a!3861) from!3239)))))

(declare-fun b!1369398 () Bool)

(assert (=> b!1369398 (= e!775722 call!65510)))

(declare-fun b!1369399 () Bool)

(assert (=> b!1369399 (= e!775720 e!775723)))

(declare-fun res!912870 () Bool)

(assert (=> b!1369399 (=> (not res!912870) (not e!775723))))

(assert (=> b!1369399 (= res!912870 (not e!775721))))

(declare-fun res!912869 () Bool)

(assert (=> b!1369399 (=> (not res!912869) (not e!775721))))

(assert (=> b!1369399 (= res!912869 (validKeyInArray!0 (select (arr!44904 a!3861) from!3239)))))

(assert (= (and d!147007 (not res!912871)) b!1369399))

(assert (= (and b!1369399 res!912869) b!1369397))

(assert (= (and b!1369399 res!912870) b!1369396))

(assert (= (and b!1369396 c!127703) b!1369398))

(assert (= (and b!1369396 (not c!127703)) b!1369395))

(assert (= (or b!1369398 b!1369395) bm!65507))

(declare-fun m!1253187 () Bool)

(assert (=> bm!65507 m!1253187))

(declare-fun m!1253189 () Bool)

(assert (=> bm!65507 m!1253189))

(assert (=> b!1369396 m!1253187))

(assert (=> b!1369396 m!1253187))

(declare-fun m!1253193 () Bool)

(assert (=> b!1369396 m!1253193))

(assert (=> b!1369397 m!1253187))

(assert (=> b!1369397 m!1253187))

(declare-fun m!1253197 () Bool)

(assert (=> b!1369397 m!1253197))

(assert (=> b!1369399 m!1253187))

(assert (=> b!1369399 m!1253187))

(assert (=> b!1369399 m!1253193))

(assert (=> b!1369341 d!147007))

(declare-fun d!147021 () Bool)

(assert (=> d!147021 (noDuplicate!2511 newAcc!98)))

(declare-fun lt!602253 () Unit!45245)

(declare-fun choose!2002 (List!31972 List!31972) Unit!45245)

(assert (=> d!147021 (= lt!602253 (choose!2002 newAcc!98 acc!866))))

(declare-fun e!775732 () Bool)

(assert (=> d!147021 e!775732))

(declare-fun res!912880 () Bool)

(assert (=> d!147021 (=> (not res!912880) (not e!775732))))

(assert (=> d!147021 (= res!912880 (subseq!1056 newAcc!98 acc!866))))

(assert (=> d!147021 (= (noDuplicateSubseq!243 newAcc!98 acc!866) lt!602253)))

(declare-fun b!1369408 () Bool)

(assert (=> b!1369408 (= e!775732 (noDuplicate!2511 acc!866))))

(assert (= (and d!147021 res!912880) b!1369408))

(assert (=> d!147021 m!1253147))

(declare-fun m!1253199 () Bool)

(assert (=> d!147021 m!1253199))

(assert (=> d!147021 m!1253143))

(assert (=> b!1369408 m!1253157))

(assert (=> b!1369341 d!147021))

(declare-fun b!1369447 () Bool)

(declare-fun e!775763 () Bool)

(assert (=> b!1369447 (= e!775763 (subseq!1056 newAcc!98 (t!46666 acc!866)))))

(declare-fun b!1369446 () Bool)

(declare-fun e!775764 () Bool)

(assert (=> b!1369446 (= e!775764 (subseq!1056 (t!46666 newAcc!98) (t!46666 acc!866)))))

(declare-fun b!1369444 () Bool)

(declare-fun e!775765 () Bool)

(declare-fun e!775766 () Bool)

(assert (=> b!1369444 (= e!775765 e!775766)))

(declare-fun res!912908 () Bool)

(assert (=> b!1369444 (=> (not res!912908) (not e!775766))))

(get-info :version)

(assert (=> b!1369444 (= res!912908 ((_ is Cons!31968) acc!866))))

(declare-fun b!1369445 () Bool)

(assert (=> b!1369445 (= e!775766 e!775763)))

(declare-fun res!912909 () Bool)

(assert (=> b!1369445 (=> res!912909 e!775763)))

(assert (=> b!1369445 (= res!912909 e!775764)))

(declare-fun res!912907 () Bool)

(assert (=> b!1369445 (=> (not res!912907) (not e!775764))))

(assert (=> b!1369445 (= res!912907 (= (h!33177 newAcc!98) (h!33177 acc!866)))))

(declare-fun d!147023 () Bool)

(declare-fun res!912906 () Bool)

(assert (=> d!147023 (=> res!912906 e!775765)))

(assert (=> d!147023 (= res!912906 ((_ is Nil!31969) newAcc!98))))

(assert (=> d!147023 (= (subseq!1056 newAcc!98 acc!866) e!775765)))

(assert (= (and d!147023 (not res!912906)) b!1369444))

(assert (= (and b!1369444 res!912908) b!1369445))

(assert (= (and b!1369445 res!912907) b!1369446))

(assert (= (and b!1369445 (not res!912909)) b!1369447))

(declare-fun m!1253215 () Bool)

(assert (=> b!1369447 m!1253215))

(declare-fun m!1253217 () Bool)

(assert (=> b!1369446 m!1253217))

(assert (=> b!1369337 d!147023))

(declare-fun d!147029 () Bool)

(declare-fun lt!602260 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!724 (List!31972) (InoxSet (_ BitVec 64)))

(assert (=> d!147029 (= lt!602260 (select (content!724 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!775779 () Bool)

(assert (=> d!147029 (= lt!602260 e!775779)))

(declare-fun res!912921 () Bool)

(assert (=> d!147029 (=> (not res!912921) (not e!775779))))

(assert (=> d!147029 (= res!912921 ((_ is Cons!31968) acc!866))))

(assert (=> d!147029 (= (contains!9654 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602260)))

(declare-fun b!1369460 () Bool)

(declare-fun e!775778 () Bool)

(assert (=> b!1369460 (= e!775779 e!775778)))

(declare-fun res!912920 () Bool)

(assert (=> b!1369460 (=> res!912920 e!775778)))

(assert (=> b!1369460 (= res!912920 (= (h!33177 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1369461 () Bool)

(assert (=> b!1369461 (= e!775778 (contains!9654 (t!46666 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147029 res!912921) b!1369460))

(assert (= (and b!1369460 (not res!912920)) b!1369461))

(declare-fun m!1253229 () Bool)

(assert (=> d!147029 m!1253229))

(declare-fun m!1253231 () Bool)

(assert (=> d!147029 m!1253231))

(declare-fun m!1253233 () Bool)

(assert (=> b!1369461 m!1253233))

(assert (=> b!1369342 d!147029))

(declare-fun d!147037 () Bool)

(declare-fun res!912932 () Bool)

(declare-fun e!775790 () Bool)

(assert (=> d!147037 (=> res!912932 e!775790)))

(assert (=> d!147037 (= res!912932 ((_ is Nil!31969) acc!866))))

(assert (=> d!147037 (= (noDuplicate!2511 acc!866) e!775790)))

(declare-fun b!1369472 () Bool)

(declare-fun e!775791 () Bool)

(assert (=> b!1369472 (= e!775790 e!775791)))

(declare-fun res!912933 () Bool)

(assert (=> b!1369472 (=> (not res!912933) (not e!775791))))

(assert (=> b!1369472 (= res!912933 (not (contains!9654 (t!46666 acc!866) (h!33177 acc!866))))))

(declare-fun b!1369473 () Bool)

(assert (=> b!1369473 (= e!775791 (noDuplicate!2511 (t!46666 acc!866)))))

(assert (= (and d!147037 (not res!912932)) b!1369472))

(assert (= (and b!1369472 res!912933) b!1369473))

(declare-fun m!1253235 () Bool)

(assert (=> b!1369472 m!1253235))

(declare-fun m!1253237 () Bool)

(assert (=> b!1369473 m!1253237))

(assert (=> b!1369344 d!147037))

(declare-fun d!147039 () Bool)

(declare-fun lt!602266 () Bool)

(assert (=> d!147039 (= lt!602266 (select (content!724 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!775794 () Bool)

(assert (=> d!147039 (= lt!602266 e!775794)))

(declare-fun res!912936 () Bool)

(assert (=> d!147039 (=> (not res!912936) (not e!775794))))

(assert (=> d!147039 (= res!912936 ((_ is Cons!31968) newAcc!98))))

(assert (=> d!147039 (= (contains!9654 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602266)))

(declare-fun b!1369475 () Bool)

(declare-fun e!775793 () Bool)

(assert (=> b!1369475 (= e!775794 e!775793)))

(declare-fun res!912935 () Bool)

(assert (=> b!1369475 (=> res!912935 e!775793)))

(assert (=> b!1369475 (= res!912935 (= (h!33177 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1369476 () Bool)

(assert (=> b!1369476 (= e!775793 (contains!9654 (t!46666 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147039 res!912936) b!1369475))

(assert (= (and b!1369475 (not res!912935)) b!1369476))

(declare-fun m!1253241 () Bool)

(assert (=> d!147039 m!1253241))

(declare-fun m!1253243 () Bool)

(assert (=> d!147039 m!1253243))

(declare-fun m!1253245 () Bool)

(assert (=> b!1369476 m!1253245))

(assert (=> b!1369338 d!147039))

(declare-fun d!147043 () Bool)

(assert (=> d!147043 (= (array_inv!33932 a!3861) (bvsge (size!45454 a!3861) #b00000000000000000000000000000000))))

(assert (=> start!115816 d!147043))

(declare-fun d!147049 () Bool)

(declare-fun res!912943 () Bool)

(declare-fun e!775801 () Bool)

(assert (=> d!147049 (=> res!912943 e!775801)))

(assert (=> d!147049 (= res!912943 ((_ is Nil!31969) newAcc!98))))

(assert (=> d!147049 (= (noDuplicate!2511 newAcc!98) e!775801)))

(declare-fun b!1369483 () Bool)

(declare-fun e!775802 () Bool)

(assert (=> b!1369483 (= e!775801 e!775802)))

(declare-fun res!912944 () Bool)

(assert (=> b!1369483 (=> (not res!912944) (not e!775802))))

(assert (=> b!1369483 (= res!912944 (not (contains!9654 (t!46666 newAcc!98) (h!33177 newAcc!98))))))

(declare-fun b!1369484 () Bool)

(assert (=> b!1369484 (= e!775802 (noDuplicate!2511 (t!46666 newAcc!98)))))

(assert (= (and d!147049 (not res!912943)) b!1369483))

(assert (= (and b!1369483 res!912944) b!1369484))

(declare-fun m!1253263 () Bool)

(assert (=> b!1369483 m!1253263))

(declare-fun m!1253265 () Bool)

(assert (=> b!1369484 m!1253265))

(assert (=> b!1369340 d!147049))

(declare-fun d!147053 () Bool)

(declare-fun lt!602270 () Bool)

(assert (=> d!147053 (= lt!602270 (select (content!724 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!775804 () Bool)

(assert (=> d!147053 (= lt!602270 e!775804)))

(declare-fun res!912946 () Bool)

(assert (=> d!147053 (=> (not res!912946) (not e!775804))))

(assert (=> d!147053 (= res!912946 ((_ is Cons!31968) newAcc!98))))

(assert (=> d!147053 (= (contains!9654 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602270)))

(declare-fun b!1369485 () Bool)

(declare-fun e!775803 () Bool)

(assert (=> b!1369485 (= e!775804 e!775803)))

(declare-fun res!912945 () Bool)

(assert (=> b!1369485 (=> res!912945 e!775803)))

(assert (=> b!1369485 (= res!912945 (= (h!33177 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1369486 () Bool)

(assert (=> b!1369486 (= e!775803 (contains!9654 (t!46666 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147053 res!912946) b!1369485))

(assert (= (and b!1369485 (not res!912945)) b!1369486))

(assert (=> d!147053 m!1253241))

(declare-fun m!1253267 () Bool)

(assert (=> d!147053 m!1253267))

(declare-fun m!1253269 () Bool)

(assert (=> b!1369486 m!1253269))

(assert (=> b!1369345 d!147053))

(declare-fun d!147055 () Bool)

(declare-fun lt!602271 () Bool)

(assert (=> d!147055 (= lt!602271 (select (content!724 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!775806 () Bool)

(assert (=> d!147055 (= lt!602271 e!775806)))

(declare-fun res!912948 () Bool)

(assert (=> d!147055 (=> (not res!912948) (not e!775806))))

(assert (=> d!147055 (= res!912948 ((_ is Cons!31968) acc!866))))

(assert (=> d!147055 (= (contains!9654 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602271)))

(declare-fun b!1369487 () Bool)

(declare-fun e!775805 () Bool)

(assert (=> b!1369487 (= e!775806 e!775805)))

(declare-fun res!912947 () Bool)

(assert (=> b!1369487 (=> res!912947 e!775805)))

(assert (=> b!1369487 (= res!912947 (= (h!33177 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1369488 () Bool)

(assert (=> b!1369488 (= e!775805 (contains!9654 (t!46666 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147055 res!912948) b!1369487))

(assert (= (and b!1369487 (not res!912947)) b!1369488))

(assert (=> d!147055 m!1253229))

(declare-fun m!1253271 () Bool)

(assert (=> d!147055 m!1253271))

(declare-fun m!1253273 () Bool)

(assert (=> b!1369488 m!1253273))

(assert (=> b!1369339 d!147055))

(check-sat (not b!1369408) (not b!1369483) (not b!1369397) (not b!1369488) (not b!1369476) (not b!1369486) (not b!1369484) (not b!1369473) (not bm!65507) (not b!1369472) (not b!1369399) (not d!147055) (not d!147039) (not b!1369461) (not b!1369446) (not d!147029) (not b!1369447) (not b!1369396) (not d!147053) (not d!147021))
(check-sat)
