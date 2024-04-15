; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62770 () Bool)

(assert start!62770)

(declare-fun b!708046 () Bool)

(declare-fun res!471878 () Bool)

(declare-fun e!398461 () Bool)

(assert (=> b!708046 (=> (not res!471878) (not e!398461))))

(declare-datatypes ((List!13408 0))(
  ( (Nil!13405) (Cons!13404 (h!14449 (_ BitVec 64)) (t!19687 List!13408)) )
))
(declare-fun acc!652 () List!13408)

(declare-fun contains!3930 (List!13408 (_ BitVec 64)) Bool)

(assert (=> b!708046 (= res!471878 (not (contains!3930 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!708047 () Bool)

(declare-fun res!471877 () Bool)

(assert (=> b!708047 (=> (not res!471877) (not e!398461))))

(declare-fun newAcc!49 () List!13408)

(assert (=> b!708047 (= res!471877 (not (contains!3930 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!708048 () Bool)

(declare-fun e!398458 () Bool)

(declare-fun lt!317849 () List!13408)

(assert (=> b!708048 (= e!398458 (contains!3930 lt!317849 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708049 () Bool)

(declare-fun res!471872 () Bool)

(assert (=> b!708049 (=> (not res!471872) (not e!398461))))

(declare-fun k0!2824 () (_ BitVec 64))

(assert (=> b!708049 (= res!471872 (not (contains!3930 acc!652 k0!2824)))))

(declare-fun b!708050 () Bool)

(declare-fun res!471883 () Bool)

(assert (=> b!708050 (=> (not res!471883) (not e!398461))))

(assert (=> b!708050 (= res!471883 (not (contains!3930 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!708051 () Bool)

(declare-fun res!471884 () Bool)

(assert (=> b!708051 (=> (not res!471884) (not e!398461))))

(declare-fun noDuplicate!1199 (List!13408) Bool)

(assert (=> b!708051 (= res!471884 (noDuplicate!1199 acc!652))))

(declare-fun b!708052 () Bool)

(declare-fun res!471870 () Bool)

(assert (=> b!708052 (=> (not res!471870) (not e!398461))))

(declare-fun subseq!392 (List!13408 List!13408) Bool)

(assert (=> b!708052 (= res!471870 (subseq!392 acc!652 newAcc!49))))

(declare-fun res!471874 () Bool)

(assert (=> start!62770 (=> (not res!471874) (not e!398461))))

(declare-datatypes ((array!40350 0))(
  ( (array!40351 (arr!19328 (Array (_ BitVec 32) (_ BitVec 64))) (size!19716 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40350)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62770 (= res!471874 (and (bvslt (size!19716 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19716 a!3591))))))

(assert (=> start!62770 e!398461))

(assert (=> start!62770 true))

(declare-fun array_inv!15211 (array!40350) Bool)

(assert (=> start!62770 (array_inv!15211 a!3591)))

(declare-fun b!708053 () Bool)

(declare-fun res!471869 () Bool)

(assert (=> b!708053 (=> (not res!471869) (not e!398461))))

(assert (=> b!708053 (= res!471869 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19716 a!3591)))))

(declare-fun b!708054 () Bool)

(declare-fun res!471873 () Bool)

(declare-fun e!398459 () Bool)

(assert (=> b!708054 (=> (not res!471873) (not e!398459))))

(assert (=> b!708054 (= res!471873 (noDuplicate!1199 lt!317849))))

(declare-fun b!708055 () Bool)

(declare-fun res!471882 () Bool)

(assert (=> b!708055 (=> (not res!471882) (not e!398461))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!708055 (= res!471882 (validKeyInArray!0 k0!2824))))

(declare-fun b!708056 () Bool)

(assert (=> b!708056 (= e!398461 e!398459)))

(declare-fun res!471885 () Bool)

(assert (=> b!708056 (=> (not res!471885) (not e!398459))))

(assert (=> b!708056 (= res!471885 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!502 (List!13408 (_ BitVec 64)) List!13408)

(assert (=> b!708056 (= lt!317849 ($colon$colon!502 acc!652 (select (arr!19328 a!3591) from!2969)))))

(declare-fun b!708057 () Bool)

(declare-fun res!471867 () Bool)

(assert (=> b!708057 (=> (not res!471867) (not e!398459))))

(assert (=> b!708057 (= res!471867 (noDuplicate!1199 ($colon$colon!502 newAcc!49 (select (arr!19328 a!3591) from!2969))))))

(declare-fun b!708058 () Bool)

(declare-fun res!471868 () Bool)

(assert (=> b!708058 (=> (not res!471868) (not e!398461))))

(assert (=> b!708058 (= res!471868 (not (contains!3930 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!708059 () Bool)

(declare-fun res!471881 () Bool)

(assert (=> b!708059 (=> (not res!471881) (not e!398461))))

(assert (=> b!708059 (= res!471881 (contains!3930 newAcc!49 k0!2824))))

(declare-fun b!708060 () Bool)

(assert (=> b!708060 (= e!398459 e!398458)))

(declare-fun res!471875 () Bool)

(assert (=> b!708060 (=> res!471875 e!398458)))

(assert (=> b!708060 (= res!471875 (contains!3930 lt!317849 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708061 () Bool)

(declare-fun res!471880 () Bool)

(assert (=> b!708061 (=> (not res!471880) (not e!398461))))

(assert (=> b!708061 (= res!471880 (noDuplicate!1199 newAcc!49))))

(declare-fun b!708062 () Bool)

(declare-fun res!471876 () Bool)

(assert (=> b!708062 (=> (not res!471876) (not e!398461))))

(declare-fun arrayNoDuplicates!0 (array!40350 (_ BitVec 32) List!13408) Bool)

(assert (=> b!708062 (= res!471876 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!708063 () Bool)

(declare-fun res!471879 () Bool)

(assert (=> b!708063 (=> (not res!471879) (not e!398461))))

(declare-fun -!357 (List!13408 (_ BitVec 64)) List!13408)

(assert (=> b!708063 (= res!471879 (= (-!357 newAcc!49 k0!2824) acc!652))))

(declare-fun b!708064 () Bool)

(declare-fun res!471871 () Bool)

(assert (=> b!708064 (=> (not res!471871) (not e!398461))))

(assert (=> b!708064 (= res!471871 (validKeyInArray!0 (select (arr!19328 a!3591) from!2969)))))

(declare-fun b!708065 () Bool)

(declare-fun res!471866 () Bool)

(assert (=> b!708065 (=> (not res!471866) (not e!398461))))

(declare-fun arrayContainsKey!0 (array!40350 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!708065 (= res!471866 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(assert (= (and start!62770 res!471874) b!708051))

(assert (= (and b!708051 res!471884) b!708061))

(assert (= (and b!708061 res!471880) b!708050))

(assert (= (and b!708050 res!471883) b!708046))

(assert (= (and b!708046 res!471878) b!708065))

(assert (= (and b!708065 res!471866) b!708049))

(assert (= (and b!708049 res!471872) b!708055))

(assert (= (and b!708055 res!471882) b!708062))

(assert (= (and b!708062 res!471876) b!708052))

(assert (= (and b!708052 res!471870) b!708059))

(assert (= (and b!708059 res!471881) b!708063))

(assert (= (and b!708063 res!471879) b!708047))

(assert (= (and b!708047 res!471877) b!708058))

(assert (= (and b!708058 res!471868) b!708053))

(assert (= (and b!708053 res!471869) b!708064))

(assert (= (and b!708064 res!471871) b!708056))

(assert (= (and b!708056 res!471885) b!708054))

(assert (= (and b!708054 res!471873) b!708057))

(assert (= (and b!708057 res!471867) b!708060))

(assert (= (and b!708060 (not res!471875)) b!708048))

(declare-fun m!665025 () Bool)

(assert (=> b!708060 m!665025))

(declare-fun m!665027 () Bool)

(assert (=> b!708049 m!665027))

(declare-fun m!665029 () Bool)

(assert (=> b!708058 m!665029))

(declare-fun m!665031 () Bool)

(assert (=> b!708050 m!665031))

(declare-fun m!665033 () Bool)

(assert (=> b!708062 m!665033))

(declare-fun m!665035 () Bool)

(assert (=> b!708047 m!665035))

(declare-fun m!665037 () Bool)

(assert (=> b!708048 m!665037))

(declare-fun m!665039 () Bool)

(assert (=> b!708064 m!665039))

(assert (=> b!708064 m!665039))

(declare-fun m!665041 () Bool)

(assert (=> b!708064 m!665041))

(declare-fun m!665043 () Bool)

(assert (=> b!708055 m!665043))

(declare-fun m!665045 () Bool)

(assert (=> start!62770 m!665045))

(assert (=> b!708056 m!665039))

(assert (=> b!708056 m!665039))

(declare-fun m!665047 () Bool)

(assert (=> b!708056 m!665047))

(declare-fun m!665049 () Bool)

(assert (=> b!708059 m!665049))

(declare-fun m!665051 () Bool)

(assert (=> b!708046 m!665051))

(declare-fun m!665053 () Bool)

(assert (=> b!708054 m!665053))

(declare-fun m!665055 () Bool)

(assert (=> b!708065 m!665055))

(assert (=> b!708057 m!665039))

(assert (=> b!708057 m!665039))

(declare-fun m!665057 () Bool)

(assert (=> b!708057 m!665057))

(assert (=> b!708057 m!665057))

(declare-fun m!665059 () Bool)

(assert (=> b!708057 m!665059))

(declare-fun m!665061 () Bool)

(assert (=> b!708061 m!665061))

(declare-fun m!665063 () Bool)

(assert (=> b!708063 m!665063))

(declare-fun m!665065 () Bool)

(assert (=> b!708052 m!665065))

(declare-fun m!665067 () Bool)

(assert (=> b!708051 m!665067))

(check-sat (not b!708057) (not b!708061) (not b!708052) (not b!708059) (not b!708049) (not b!708064) (not start!62770) (not b!708048) (not b!708051) (not b!708050) (not b!708060) (not b!708055) (not b!708047) (not b!708058) (not b!708056) (not b!708054) (not b!708065) (not b!708063) (not b!708046) (not b!708062))
(check-sat)
(get-model)

(declare-fun b!708196 () Bool)

(declare-fun e!398497 () Bool)

(declare-fun e!398494 () Bool)

(assert (=> b!708196 (= e!398497 e!398494)))

(declare-fun res!472014 () Bool)

(assert (=> b!708196 (=> (not res!472014) (not e!398494))))

(declare-fun e!398496 () Bool)

(assert (=> b!708196 (= res!472014 (not e!398496))))

(declare-fun res!472013 () Bool)

(assert (=> b!708196 (=> (not res!472013) (not e!398496))))

(assert (=> b!708196 (= res!472013 (validKeyInArray!0 (select (arr!19328 a!3591) from!2969)))))

(declare-fun d!96597 () Bool)

(declare-fun res!472012 () Bool)

(assert (=> d!96597 (=> res!472012 e!398497)))

(assert (=> d!96597 (= res!472012 (bvsge from!2969 (size!19716 a!3591)))))

(assert (=> d!96597 (= (arrayNoDuplicates!0 a!3591 from!2969 acc!652) e!398497)))

(declare-fun b!708197 () Bool)

(declare-fun e!398495 () Bool)

(declare-fun call!34372 () Bool)

(assert (=> b!708197 (= e!398495 call!34372)))

(declare-fun bm!34369 () Bool)

(declare-fun c!78459 () Bool)

(assert (=> bm!34369 (= call!34372 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78459 (Cons!13404 (select (arr!19328 a!3591) from!2969) acc!652) acc!652)))))

(declare-fun b!708198 () Bool)

(assert (=> b!708198 (= e!398496 (contains!3930 acc!652 (select (arr!19328 a!3591) from!2969)))))

(declare-fun b!708199 () Bool)

(assert (=> b!708199 (= e!398495 call!34372)))

(declare-fun b!708200 () Bool)

(assert (=> b!708200 (= e!398494 e!398495)))

(assert (=> b!708200 (= c!78459 (validKeyInArray!0 (select (arr!19328 a!3591) from!2969)))))

(assert (= (and d!96597 (not res!472012)) b!708196))

(assert (= (and b!708196 res!472013) b!708198))

(assert (= (and b!708196 res!472014) b!708200))

(assert (= (and b!708200 c!78459) b!708197))

(assert (= (and b!708200 (not c!78459)) b!708199))

(assert (= (or b!708197 b!708199) bm!34369))

(assert (=> b!708196 m!665039))

(assert (=> b!708196 m!665039))

(assert (=> b!708196 m!665041))

(assert (=> bm!34369 m!665039))

(declare-fun m!665157 () Bool)

(assert (=> bm!34369 m!665157))

(assert (=> b!708198 m!665039))

(assert (=> b!708198 m!665039))

(declare-fun m!665159 () Bool)

(assert (=> b!708198 m!665159))

(assert (=> b!708200 m!665039))

(assert (=> b!708200 m!665039))

(assert (=> b!708200 m!665041))

(assert (=> b!708062 d!96597))

(declare-fun b!708211 () Bool)

(declare-fun e!398506 () List!13408)

(declare-fun call!34375 () List!13408)

(assert (=> b!708211 (= e!398506 call!34375)))

(declare-fun d!96599 () Bool)

(declare-fun e!398507 () Bool)

(assert (=> d!96599 e!398507))

(declare-fun res!472017 () Bool)

(assert (=> d!96599 (=> (not res!472017) (not e!398507))))

(declare-fun lt!317858 () List!13408)

(declare-fun size!19719 (List!13408) Int)

(assert (=> d!96599 (= res!472017 (<= (size!19719 lt!317858) (size!19719 newAcc!49)))))

(declare-fun e!398505 () List!13408)

(assert (=> d!96599 (= lt!317858 e!398505)))

(declare-fun c!78465 () Bool)

(get-info :version)

(assert (=> d!96599 (= c!78465 ((_ is Cons!13404) newAcc!49))))

(assert (=> d!96599 (= (-!357 newAcc!49 k0!2824) lt!317858)))

(declare-fun b!708212 () Bool)

(assert (=> b!708212 (= e!398505 e!398506)))

(declare-fun c!78464 () Bool)

(assert (=> b!708212 (= c!78464 (= k0!2824 (h!14449 newAcc!49)))))

(declare-fun b!708213 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!337 (List!13408) (InoxSet (_ BitVec 64)))

(assert (=> b!708213 (= e!398507 (= (content!337 lt!317858) ((_ map and) (content!337 newAcc!49) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2824 true)))))))

(declare-fun b!708214 () Bool)

(assert (=> b!708214 (= e!398505 Nil!13405)))

(declare-fun bm!34372 () Bool)

(assert (=> bm!34372 (= call!34375 (-!357 (t!19687 newAcc!49) k0!2824))))

(declare-fun b!708215 () Bool)

(assert (=> b!708215 (= e!398506 (Cons!13404 (h!14449 newAcc!49) call!34375))))

(assert (= (and d!96599 c!78465) b!708212))

(assert (= (and d!96599 (not c!78465)) b!708214))

(assert (= (and b!708212 c!78464) b!708211))

(assert (= (and b!708212 (not c!78464)) b!708215))

(assert (= (or b!708211 b!708215) bm!34372))

(assert (= (and d!96599 res!472017) b!708213))

(declare-fun m!665161 () Bool)

(assert (=> d!96599 m!665161))

(declare-fun m!665163 () Bool)

(assert (=> d!96599 m!665163))

(declare-fun m!665165 () Bool)

(assert (=> b!708213 m!665165))

(declare-fun m!665167 () Bool)

(assert (=> b!708213 m!665167))

(declare-fun m!665169 () Bool)

(assert (=> b!708213 m!665169))

(declare-fun m!665171 () Bool)

(assert (=> bm!34372 m!665171))

(assert (=> b!708063 d!96599))

(declare-fun b!708226 () Bool)

(declare-fun e!398518 () Bool)

(assert (=> b!708226 (= e!398518 (subseq!392 (t!19687 acc!652) (t!19687 newAcc!49)))))

(declare-fun b!708225 () Bool)

(declare-fun e!398519 () Bool)

(declare-fun e!398517 () Bool)

(assert (=> b!708225 (= e!398519 e!398517)))

(declare-fun res!472026 () Bool)

(assert (=> b!708225 (=> res!472026 e!398517)))

(assert (=> b!708225 (= res!472026 e!398518)))

(declare-fun res!472028 () Bool)

(assert (=> b!708225 (=> (not res!472028) (not e!398518))))

(assert (=> b!708225 (= res!472028 (= (h!14449 acc!652) (h!14449 newAcc!49)))))

(declare-fun b!708227 () Bool)

(assert (=> b!708227 (= e!398517 (subseq!392 acc!652 (t!19687 newAcc!49)))))

(declare-fun b!708224 () Bool)

(declare-fun e!398516 () Bool)

(assert (=> b!708224 (= e!398516 e!398519)))

(declare-fun res!472029 () Bool)

(assert (=> b!708224 (=> (not res!472029) (not e!398519))))

(assert (=> b!708224 (= res!472029 ((_ is Cons!13404) newAcc!49))))

(declare-fun d!96601 () Bool)

(declare-fun res!472027 () Bool)

(assert (=> d!96601 (=> res!472027 e!398516)))

(assert (=> d!96601 (= res!472027 ((_ is Nil!13405) acc!652))))

(assert (=> d!96601 (= (subseq!392 acc!652 newAcc!49) e!398516)))

(assert (= (and d!96601 (not res!472027)) b!708224))

(assert (= (and b!708224 res!472029) b!708225))

(assert (= (and b!708225 res!472028) b!708226))

(assert (= (and b!708225 (not res!472026)) b!708227))

(declare-fun m!665173 () Bool)

(assert (=> b!708226 m!665173))

(declare-fun m!665175 () Bool)

(assert (=> b!708227 m!665175))

(assert (=> b!708052 d!96601))

(declare-fun d!96603 () Bool)

(declare-fun res!472034 () Bool)

(declare-fun e!398524 () Bool)

(assert (=> d!96603 (=> res!472034 e!398524)))

(assert (=> d!96603 (= res!472034 ((_ is Nil!13405) newAcc!49))))

(assert (=> d!96603 (= (noDuplicate!1199 newAcc!49) e!398524)))

(declare-fun b!708232 () Bool)

(declare-fun e!398525 () Bool)

(assert (=> b!708232 (= e!398524 e!398525)))

(declare-fun res!472035 () Bool)

(assert (=> b!708232 (=> (not res!472035) (not e!398525))))

(assert (=> b!708232 (= res!472035 (not (contains!3930 (t!19687 newAcc!49) (h!14449 newAcc!49))))))

(declare-fun b!708233 () Bool)

(assert (=> b!708233 (= e!398525 (noDuplicate!1199 (t!19687 newAcc!49)))))

(assert (= (and d!96603 (not res!472034)) b!708232))

(assert (= (and b!708232 res!472035) b!708233))

(declare-fun m!665177 () Bool)

(assert (=> b!708232 m!665177))

(declare-fun m!665179 () Bool)

(assert (=> b!708233 m!665179))

(assert (=> b!708061 d!96603))

(declare-fun d!96605 () Bool)

(declare-fun lt!317861 () Bool)

(assert (=> d!96605 (= lt!317861 (select (content!337 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398530 () Bool)

(assert (=> d!96605 (= lt!317861 e!398530)))

(declare-fun res!472040 () Bool)

(assert (=> d!96605 (=> (not res!472040) (not e!398530))))

(assert (=> d!96605 (= res!472040 ((_ is Cons!13404) acc!652))))

(assert (=> d!96605 (= (contains!3930 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000) lt!317861)))

(declare-fun b!708238 () Bool)

(declare-fun e!398531 () Bool)

(assert (=> b!708238 (= e!398530 e!398531)))

(declare-fun res!472041 () Bool)

(assert (=> b!708238 (=> res!472041 e!398531)))

(assert (=> b!708238 (= res!472041 (= (h!14449 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708239 () Bool)

(assert (=> b!708239 (= e!398531 (contains!3930 (t!19687 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96605 res!472040) b!708238))

(assert (= (and b!708238 (not res!472041)) b!708239))

(declare-fun m!665181 () Bool)

(assert (=> d!96605 m!665181))

(declare-fun m!665183 () Bool)

(assert (=> d!96605 m!665183))

(declare-fun m!665185 () Bool)

(assert (=> b!708239 m!665185))

(assert (=> b!708050 d!96605))

(declare-fun d!96607 () Bool)

(declare-fun res!472042 () Bool)

(declare-fun e!398532 () Bool)

(assert (=> d!96607 (=> res!472042 e!398532)))

(assert (=> d!96607 (= res!472042 ((_ is Nil!13405) acc!652))))

(assert (=> d!96607 (= (noDuplicate!1199 acc!652) e!398532)))

(declare-fun b!708240 () Bool)

(declare-fun e!398533 () Bool)

(assert (=> b!708240 (= e!398532 e!398533)))

(declare-fun res!472043 () Bool)

(assert (=> b!708240 (=> (not res!472043) (not e!398533))))

(assert (=> b!708240 (= res!472043 (not (contains!3930 (t!19687 acc!652) (h!14449 acc!652))))))

(declare-fun b!708241 () Bool)

(assert (=> b!708241 (= e!398533 (noDuplicate!1199 (t!19687 acc!652)))))

(assert (= (and d!96607 (not res!472042)) b!708240))

(assert (= (and b!708240 res!472043) b!708241))

(declare-fun m!665187 () Bool)

(assert (=> b!708240 m!665187))

(declare-fun m!665189 () Bool)

(assert (=> b!708241 m!665189))

(assert (=> b!708051 d!96607))

(declare-fun d!96609 () Bool)

(declare-fun res!472048 () Bool)

(declare-fun e!398538 () Bool)

(assert (=> d!96609 (=> res!472048 e!398538)))

(assert (=> d!96609 (= res!472048 (= (select (arr!19328 a!3591) from!2969) k0!2824))))

(assert (=> d!96609 (= (arrayContainsKey!0 a!3591 k0!2824 from!2969) e!398538)))

(declare-fun b!708246 () Bool)

(declare-fun e!398539 () Bool)

(assert (=> b!708246 (= e!398538 e!398539)))

(declare-fun res!472049 () Bool)

(assert (=> b!708246 (=> (not res!472049) (not e!398539))))

(assert (=> b!708246 (= res!472049 (bvslt (bvadd from!2969 #b00000000000000000000000000000001) (size!19716 a!3591)))))

(declare-fun b!708247 () Bool)

(assert (=> b!708247 (= e!398539 (arrayContainsKey!0 a!3591 k0!2824 (bvadd from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!96609 (not res!472048)) b!708246))

(assert (= (and b!708246 res!472049) b!708247))

(assert (=> d!96609 m!665039))

(declare-fun m!665191 () Bool)

(assert (=> b!708247 m!665191))

(assert (=> b!708065 d!96609))

(declare-fun d!96611 () Bool)

(declare-fun res!472050 () Bool)

(declare-fun e!398540 () Bool)

(assert (=> d!96611 (=> res!472050 e!398540)))

(assert (=> d!96611 (= res!472050 ((_ is Nil!13405) lt!317849))))

(assert (=> d!96611 (= (noDuplicate!1199 lt!317849) e!398540)))

(declare-fun b!708248 () Bool)

(declare-fun e!398541 () Bool)

(assert (=> b!708248 (= e!398540 e!398541)))

(declare-fun res!472051 () Bool)

(assert (=> b!708248 (=> (not res!472051) (not e!398541))))

(assert (=> b!708248 (= res!472051 (not (contains!3930 (t!19687 lt!317849) (h!14449 lt!317849))))))

(declare-fun b!708249 () Bool)

(assert (=> b!708249 (= e!398541 (noDuplicate!1199 (t!19687 lt!317849)))))

(assert (= (and d!96611 (not res!472050)) b!708248))

(assert (= (and b!708248 res!472051) b!708249))

(declare-fun m!665193 () Bool)

(assert (=> b!708248 m!665193))

(declare-fun m!665195 () Bool)

(assert (=> b!708249 m!665195))

(assert (=> b!708054 d!96611))

(declare-fun d!96615 () Bool)

(assert (=> d!96615 (= (validKeyInArray!0 k0!2824) (and (not (= k0!2824 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2824 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!708055 d!96615))

(declare-fun d!96619 () Bool)

(assert (=> d!96619 (= (validKeyInArray!0 (select (arr!19328 a!3591) from!2969)) (and (not (= (select (arr!19328 a!3591) from!2969) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19328 a!3591) from!2969) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!708064 d!96619))

(declare-fun d!96621 () Bool)

(declare-fun res!472052 () Bool)

(declare-fun e!398542 () Bool)

(assert (=> d!96621 (=> res!472052 e!398542)))

(assert (=> d!96621 (= res!472052 ((_ is Nil!13405) ($colon$colon!502 newAcc!49 (select (arr!19328 a!3591) from!2969))))))

(assert (=> d!96621 (= (noDuplicate!1199 ($colon$colon!502 newAcc!49 (select (arr!19328 a!3591) from!2969))) e!398542)))

(declare-fun b!708250 () Bool)

(declare-fun e!398543 () Bool)

(assert (=> b!708250 (= e!398542 e!398543)))

(declare-fun res!472053 () Bool)

(assert (=> b!708250 (=> (not res!472053) (not e!398543))))

(assert (=> b!708250 (= res!472053 (not (contains!3930 (t!19687 ($colon$colon!502 newAcc!49 (select (arr!19328 a!3591) from!2969))) (h!14449 ($colon$colon!502 newAcc!49 (select (arr!19328 a!3591) from!2969))))))))

(declare-fun b!708251 () Bool)

(assert (=> b!708251 (= e!398543 (noDuplicate!1199 (t!19687 ($colon$colon!502 newAcc!49 (select (arr!19328 a!3591) from!2969)))))))

(assert (= (and d!96621 (not res!472052)) b!708250))

(assert (= (and b!708250 res!472053) b!708251))

(declare-fun m!665197 () Bool)

(assert (=> b!708250 m!665197))

(declare-fun m!665199 () Bool)

(assert (=> b!708251 m!665199))

(assert (=> b!708057 d!96621))

(declare-fun d!96623 () Bool)

(assert (=> d!96623 (= ($colon$colon!502 newAcc!49 (select (arr!19328 a!3591) from!2969)) (Cons!13404 (select (arr!19328 a!3591) from!2969) newAcc!49))))

(assert (=> b!708057 d!96623))

(declare-fun d!96625 () Bool)

(declare-fun lt!317864 () Bool)

(assert (=> d!96625 (= lt!317864 (select (content!337 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398546 () Bool)

(assert (=> d!96625 (= lt!317864 e!398546)))

(declare-fun res!472056 () Bool)

(assert (=> d!96625 (=> (not res!472056) (not e!398546))))

(assert (=> d!96625 (= res!472056 ((_ is Cons!13404) acc!652))))

(assert (=> d!96625 (= (contains!3930 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000) lt!317864)))

(declare-fun b!708254 () Bool)

(declare-fun e!398548 () Bool)

(assert (=> b!708254 (= e!398546 e!398548)))

(declare-fun res!472057 () Bool)

(assert (=> b!708254 (=> res!472057 e!398548)))

(assert (=> b!708254 (= res!472057 (= (h!14449 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708255 () Bool)

(assert (=> b!708255 (= e!398548 (contains!3930 (t!19687 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96625 res!472056) b!708254))

(assert (= (and b!708254 (not res!472057)) b!708255))

(assert (=> d!96625 m!665181))

(declare-fun m!665201 () Bool)

(assert (=> d!96625 m!665201))

(declare-fun m!665203 () Bool)

(assert (=> b!708255 m!665203))

(assert (=> b!708046 d!96625))

(declare-fun d!96627 () Bool)

(declare-fun lt!317867 () Bool)

(assert (=> d!96627 (= lt!317867 (select (content!337 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398554 () Bool)

(assert (=> d!96627 (= lt!317867 e!398554)))

(declare-fun res!472064 () Bool)

(assert (=> d!96627 (=> (not res!472064) (not e!398554))))

(assert (=> d!96627 (= res!472064 ((_ is Cons!13404) newAcc!49))))

(assert (=> d!96627 (= (contains!3930 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000) lt!317867)))

(declare-fun b!708260 () Bool)

(declare-fun e!398555 () Bool)

(assert (=> b!708260 (= e!398554 e!398555)))

(declare-fun res!472065 () Bool)

(assert (=> b!708260 (=> res!472065 e!398555)))

(assert (=> b!708260 (= res!472065 (= (h!14449 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708261 () Bool)

(assert (=> b!708261 (= e!398555 (contains!3930 (t!19687 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96627 res!472064) b!708260))

(assert (= (and b!708260 (not res!472065)) b!708261))

(assert (=> d!96627 m!665167))

(declare-fun m!665205 () Bool)

(assert (=> d!96627 m!665205))

(declare-fun m!665207 () Bool)

(assert (=> b!708261 m!665207))

(assert (=> b!708047 d!96627))

(declare-fun d!96629 () Bool)

(assert (=> d!96629 (= ($colon$colon!502 acc!652 (select (arr!19328 a!3591) from!2969)) (Cons!13404 (select (arr!19328 a!3591) from!2969) acc!652))))

(assert (=> b!708056 d!96629))

(declare-fun d!96631 () Bool)

(declare-fun lt!317868 () Bool)

(assert (=> d!96631 (= lt!317868 (select (content!337 acc!652) k0!2824))))

(declare-fun e!398556 () Bool)

(assert (=> d!96631 (= lt!317868 e!398556)))

(declare-fun res!472066 () Bool)

(assert (=> d!96631 (=> (not res!472066) (not e!398556))))

(assert (=> d!96631 (= res!472066 ((_ is Cons!13404) acc!652))))

(assert (=> d!96631 (= (contains!3930 acc!652 k0!2824) lt!317868)))

(declare-fun b!708264 () Bool)

(declare-fun e!398557 () Bool)

(assert (=> b!708264 (= e!398556 e!398557)))

(declare-fun res!472067 () Bool)

(assert (=> b!708264 (=> res!472067 e!398557)))

(assert (=> b!708264 (= res!472067 (= (h!14449 acc!652) k0!2824))))

(declare-fun b!708265 () Bool)

(assert (=> b!708265 (= e!398557 (contains!3930 (t!19687 acc!652) k0!2824))))

(assert (= (and d!96631 res!472066) b!708264))

(assert (= (and b!708264 (not res!472067)) b!708265))

(assert (=> d!96631 m!665181))

(declare-fun m!665209 () Bool)

(assert (=> d!96631 m!665209))

(declare-fun m!665211 () Bool)

(assert (=> b!708265 m!665211))

(assert (=> b!708049 d!96631))

(declare-fun d!96633 () Bool)

(declare-fun lt!317870 () Bool)

(assert (=> d!96633 (= lt!317870 (select (content!337 lt!317849) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398560 () Bool)

(assert (=> d!96633 (= lt!317870 e!398560)))

(declare-fun res!472070 () Bool)

(assert (=> d!96633 (=> (not res!472070) (not e!398560))))

(assert (=> d!96633 (= res!472070 ((_ is Cons!13404) lt!317849))))

(assert (=> d!96633 (= (contains!3930 lt!317849 #b0000000000000000000000000000000000000000000000000000000000000000) lt!317870)))

(declare-fun b!708268 () Bool)

(declare-fun e!398561 () Bool)

(assert (=> b!708268 (= e!398560 e!398561)))

(declare-fun res!472071 () Bool)

(assert (=> b!708268 (=> res!472071 e!398561)))

(assert (=> b!708268 (= res!472071 (= (h!14449 lt!317849) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708269 () Bool)

(assert (=> b!708269 (= e!398561 (contains!3930 (t!19687 lt!317849) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96633 res!472070) b!708268))

(assert (= (and b!708268 (not res!472071)) b!708269))

(declare-fun m!665217 () Bool)

(assert (=> d!96633 m!665217))

(declare-fun m!665221 () Bool)

(assert (=> d!96633 m!665221))

(declare-fun m!665223 () Bool)

(assert (=> b!708269 m!665223))

(assert (=> b!708060 d!96633))

(declare-fun d!96637 () Bool)

(declare-fun lt!317872 () Bool)

(assert (=> d!96637 (= lt!317872 (select (content!337 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398564 () Bool)

(assert (=> d!96637 (= lt!317872 e!398564)))

(declare-fun res!472074 () Bool)

(assert (=> d!96637 (=> (not res!472074) (not e!398564))))

(assert (=> d!96637 (= res!472074 ((_ is Cons!13404) newAcc!49))))

(assert (=> d!96637 (= (contains!3930 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000) lt!317872)))

(declare-fun b!708272 () Bool)

(declare-fun e!398565 () Bool)

(assert (=> b!708272 (= e!398564 e!398565)))

(declare-fun res!472075 () Bool)

(assert (=> b!708272 (=> res!472075 e!398565)))

(assert (=> b!708272 (= res!472075 (= (h!14449 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708273 () Bool)

(assert (=> b!708273 (= e!398565 (contains!3930 (t!19687 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96637 res!472074) b!708272))

(assert (= (and b!708272 (not res!472075)) b!708273))

(assert (=> d!96637 m!665167))

(declare-fun m!665229 () Bool)

(assert (=> d!96637 m!665229))

(declare-fun m!665233 () Bool)

(assert (=> b!708273 m!665233))

(assert (=> b!708058 d!96637))

(declare-fun d!96641 () Bool)

(assert (=> d!96641 (= (array_inv!15211 a!3591) (bvsge (size!19716 a!3591) #b00000000000000000000000000000000))))

(assert (=> start!62770 d!96641))

(declare-fun d!96645 () Bool)

(declare-fun lt!317873 () Bool)

(assert (=> d!96645 (= lt!317873 (select (content!337 newAcc!49) k0!2824))))

(declare-fun e!398566 () Bool)

(assert (=> d!96645 (= lt!317873 e!398566)))

(declare-fun res!472076 () Bool)

(assert (=> d!96645 (=> (not res!472076) (not e!398566))))

(assert (=> d!96645 (= res!472076 ((_ is Cons!13404) newAcc!49))))

(assert (=> d!96645 (= (contains!3930 newAcc!49 k0!2824) lt!317873)))

(declare-fun b!708274 () Bool)

(declare-fun e!398567 () Bool)

(assert (=> b!708274 (= e!398566 e!398567)))

(declare-fun res!472077 () Bool)

(assert (=> b!708274 (=> res!472077 e!398567)))

(assert (=> b!708274 (= res!472077 (= (h!14449 newAcc!49) k0!2824))))

(declare-fun b!708275 () Bool)

(assert (=> b!708275 (= e!398567 (contains!3930 (t!19687 newAcc!49) k0!2824))))

(assert (= (and d!96645 res!472076) b!708274))

(assert (= (and b!708274 (not res!472077)) b!708275))

(assert (=> d!96645 m!665167))

(declare-fun m!665235 () Bool)

(assert (=> d!96645 m!665235))

(declare-fun m!665237 () Bool)

(assert (=> b!708275 m!665237))

(assert (=> b!708059 d!96645))

(declare-fun d!96647 () Bool)

(declare-fun lt!317874 () Bool)

(assert (=> d!96647 (= lt!317874 (select (content!337 lt!317849) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398568 () Bool)

(assert (=> d!96647 (= lt!317874 e!398568)))

(declare-fun res!472078 () Bool)

(assert (=> d!96647 (=> (not res!472078) (not e!398568))))

(assert (=> d!96647 (= res!472078 ((_ is Cons!13404) lt!317849))))

(assert (=> d!96647 (= (contains!3930 lt!317849 #b1000000000000000000000000000000000000000000000000000000000000000) lt!317874)))

(declare-fun b!708276 () Bool)

(declare-fun e!398569 () Bool)

(assert (=> b!708276 (= e!398568 e!398569)))

(declare-fun res!472079 () Bool)

(assert (=> b!708276 (=> res!472079 e!398569)))

(assert (=> b!708276 (= res!472079 (= (h!14449 lt!317849) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708277 () Bool)

(assert (=> b!708277 (= e!398569 (contains!3930 (t!19687 lt!317849) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96647 res!472078) b!708276))

(assert (= (and b!708276 (not res!472079)) b!708277))

(assert (=> d!96647 m!665217))

(declare-fun m!665239 () Bool)

(assert (=> d!96647 m!665239))

(declare-fun m!665241 () Bool)

(assert (=> b!708277 m!665241))

(assert (=> b!708048 d!96647))

(check-sat (not b!708249) (not b!708200) (not d!96599) (not d!96633) (not b!708273) (not b!708251) (not b!708255) (not b!708248) (not b!708198) (not b!708275) (not b!708277) (not bm!34369) (not b!708240) (not b!708247) (not d!96627) (not b!708227) (not d!96637) (not bm!34372) (not b!708213) (not d!96605) (not d!96645) (not b!708233) (not b!708269) (not b!708232) (not b!708241) (not b!708196) (not b!708250) (not b!708261) (not d!96625) (not d!96647) (not b!708265) (not d!96631) (not b!708239) (not b!708226))
(check-sat)
