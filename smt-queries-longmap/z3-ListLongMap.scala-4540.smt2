; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63136 () Bool)

(assert start!63136)

(declare-fun b!711040 () Bool)

(declare-fun res!474518 () Bool)

(declare-fun e!400070 () Bool)

(assert (=> b!711040 (=> (not res!474518) (not e!400070))))

(declare-datatypes ((List!13429 0))(
  ( (Nil!13426) (Cons!13425 (h!14470 (_ BitVec 64)) (t!19726 List!13429)) )
))
(declare-fun lt!318191 () List!13429)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun contains!3951 (List!13429 (_ BitVec 64)) Bool)

(assert (=> b!711040 (= res!474518 (contains!3951 lt!318191 k0!2824))))

(declare-fun b!711041 () Bool)

(declare-fun res!474543 () Bool)

(declare-fun e!400072 () Bool)

(assert (=> b!711041 (=> (not res!474543) (not e!400072))))

(declare-fun acc!652 () List!13429)

(declare-fun newAcc!49 () List!13429)

(declare-fun subseq!413 (List!13429 List!13429) Bool)

(assert (=> b!711041 (= res!474543 (subseq!413 acc!652 newAcc!49))))

(declare-fun b!711042 () Bool)

(declare-fun res!474529 () Bool)

(assert (=> b!711042 (=> (not res!474529) (not e!400070))))

(declare-fun lt!318190 () List!13429)

(declare-fun noDuplicate!1220 (List!13429) Bool)

(assert (=> b!711042 (= res!474529 (noDuplicate!1220 lt!318190))))

(declare-fun b!711043 () Bool)

(declare-fun res!474530 () Bool)

(assert (=> b!711043 (=> (not res!474530) (not e!400070))))

(declare-datatypes ((array!40410 0))(
  ( (array!40411 (arr!19349 (Array (_ BitVec 32) (_ BitVec 64))) (size!19752 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40410)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!40410 (_ BitVec 32) List!13429) Bool)

(assert (=> b!711043 (= res!474530 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318190))))

(declare-fun b!711044 () Bool)

(declare-fun res!474538 () Bool)

(assert (=> b!711044 (=> (not res!474538) (not e!400072))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!711044 (= res!474538 (validKeyInArray!0 k0!2824))))

(declare-fun b!711045 () Bool)

(declare-fun res!474520 () Bool)

(assert (=> b!711045 (=> (not res!474520) (not e!400072))))

(assert (=> b!711045 (= res!474520 (noDuplicate!1220 acc!652))))

(declare-fun b!711046 () Bool)

(declare-fun res!474521 () Bool)

(assert (=> b!711046 (=> (not res!474521) (not e!400070))))

(declare-fun arrayContainsKey!0 (array!40410 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!711046 (= res!474521 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!711047 () Bool)

(declare-fun -!378 (List!13429 (_ BitVec 64)) List!13429)

(assert (=> b!711047 (= e!400070 (not (= (-!378 lt!318191 k0!2824) lt!318190)))))

(declare-fun res!474541 () Bool)

(assert (=> start!63136 (=> (not res!474541) (not e!400072))))

(assert (=> start!63136 (= res!474541 (and (bvslt (size!19752 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19752 a!3591))))))

(assert (=> start!63136 e!400072))

(assert (=> start!63136 true))

(declare-fun array_inv!15232 (array!40410) Bool)

(assert (=> start!63136 (array_inv!15232 a!3591)))

(declare-fun b!711048 () Bool)

(declare-fun res!474522 () Bool)

(assert (=> b!711048 (=> (not res!474522) (not e!400070))))

(assert (=> b!711048 (= res!474522 (not (contains!3951 lt!318190 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!711049 () Bool)

(declare-fun res!474524 () Bool)

(assert (=> b!711049 (=> (not res!474524) (not e!400070))))

(assert (=> b!711049 (= res!474524 (noDuplicate!1220 lt!318191))))

(declare-fun b!711050 () Bool)

(declare-fun res!474536 () Bool)

(assert (=> b!711050 (=> (not res!474536) (not e!400072))))

(assert (=> b!711050 (= res!474536 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19752 a!3591)))))

(declare-fun b!711051 () Bool)

(declare-fun res!474526 () Bool)

(assert (=> b!711051 (=> (not res!474526) (not e!400070))))

(assert (=> b!711051 (= res!474526 (not (contains!3951 lt!318190 k0!2824)))))

(declare-fun b!711052 () Bool)

(declare-fun res!474525 () Bool)

(assert (=> b!711052 (=> (not res!474525) (not e!400072))))

(assert (=> b!711052 (= res!474525 (not (contains!3951 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!711053 () Bool)

(declare-fun res!474528 () Bool)

(assert (=> b!711053 (=> (not res!474528) (not e!400072))))

(assert (=> b!711053 (= res!474528 (not (contains!3951 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!711054 () Bool)

(declare-fun res!474531 () Bool)

(assert (=> b!711054 (=> (not res!474531) (not e!400072))))

(assert (=> b!711054 (= res!474531 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!711055 () Bool)

(declare-fun res!474527 () Bool)

(assert (=> b!711055 (=> (not res!474527) (not e!400072))))

(assert (=> b!711055 (= res!474527 (not (contains!3951 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!711056 () Bool)

(declare-fun res!474539 () Bool)

(assert (=> b!711056 (=> (not res!474539) (not e!400070))))

(assert (=> b!711056 (= res!474539 (subseq!413 lt!318190 lt!318191))))

(declare-fun b!711057 () Bool)

(declare-fun res!474542 () Bool)

(assert (=> b!711057 (=> (not res!474542) (not e!400072))))

(assert (=> b!711057 (= res!474542 (= (-!378 newAcc!49 k0!2824) acc!652))))

(declare-fun b!711058 () Bool)

(assert (=> b!711058 (= e!400072 e!400070)))

(declare-fun res!474534 () Bool)

(assert (=> b!711058 (=> (not res!474534) (not e!400070))))

(assert (=> b!711058 (= res!474534 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!523 (List!13429 (_ BitVec 64)) List!13429)

(assert (=> b!711058 (= lt!318191 ($colon$colon!523 newAcc!49 (select (arr!19349 a!3591) from!2969)))))

(assert (=> b!711058 (= lt!318190 ($colon$colon!523 acc!652 (select (arr!19349 a!3591) from!2969)))))

(declare-fun b!711059 () Bool)

(declare-fun res!474533 () Bool)

(assert (=> b!711059 (=> (not res!474533) (not e!400072))))

(assert (=> b!711059 (= res!474533 (noDuplicate!1220 newAcc!49))))

(declare-fun b!711060 () Bool)

(declare-fun res!474537 () Bool)

(assert (=> b!711060 (=> (not res!474537) (not e!400072))))

(assert (=> b!711060 (= res!474537 (contains!3951 newAcc!49 k0!2824))))

(declare-fun b!711061 () Bool)

(declare-fun res!474540 () Bool)

(assert (=> b!711061 (=> (not res!474540) (not e!400072))))

(assert (=> b!711061 (= res!474540 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!711062 () Bool)

(declare-fun res!474535 () Bool)

(assert (=> b!711062 (=> (not res!474535) (not e!400072))))

(assert (=> b!711062 (= res!474535 (validKeyInArray!0 (select (arr!19349 a!3591) from!2969)))))

(declare-fun b!711063 () Bool)

(declare-fun res!474523 () Bool)

(assert (=> b!711063 (=> (not res!474523) (not e!400072))))

(assert (=> b!711063 (= res!474523 (not (contains!3951 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!711064 () Bool)

(declare-fun res!474519 () Bool)

(assert (=> b!711064 (=> (not res!474519) (not e!400070))))

(assert (=> b!711064 (= res!474519 (not (contains!3951 lt!318190 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!711065 () Bool)

(declare-fun res!474532 () Bool)

(assert (=> b!711065 (=> (not res!474532) (not e!400072))))

(assert (=> b!711065 (= res!474532 (not (contains!3951 acc!652 k0!2824)))))

(assert (= (and start!63136 res!474541) b!711045))

(assert (= (and b!711045 res!474520) b!711059))

(assert (= (and b!711059 res!474533) b!711063))

(assert (= (and b!711063 res!474523) b!711055))

(assert (= (and b!711055 res!474527) b!711054))

(assert (= (and b!711054 res!474531) b!711065))

(assert (= (and b!711065 res!474532) b!711044))

(assert (= (and b!711044 res!474538) b!711061))

(assert (= (and b!711061 res!474540) b!711041))

(assert (= (and b!711041 res!474543) b!711060))

(assert (= (and b!711060 res!474537) b!711057))

(assert (= (and b!711057 res!474542) b!711052))

(assert (= (and b!711052 res!474525) b!711053))

(assert (= (and b!711053 res!474528) b!711050))

(assert (= (and b!711050 res!474536) b!711062))

(assert (= (and b!711062 res!474535) b!711058))

(assert (= (and b!711058 res!474534) b!711042))

(assert (= (and b!711042 res!474529) b!711049))

(assert (= (and b!711049 res!474524) b!711048))

(assert (= (and b!711048 res!474522) b!711064))

(assert (= (and b!711064 res!474519) b!711046))

(assert (= (and b!711046 res!474521) b!711051))

(assert (= (and b!711051 res!474526) b!711043))

(assert (= (and b!711043 res!474530) b!711056))

(assert (= (and b!711056 res!474539) b!711040))

(assert (= (and b!711040 res!474518) b!711047))

(declare-fun m!667587 () Bool)

(assert (=> b!711060 m!667587))

(declare-fun m!667589 () Bool)

(assert (=> b!711047 m!667589))

(declare-fun m!667591 () Bool)

(assert (=> b!711049 m!667591))

(declare-fun m!667593 () Bool)

(assert (=> b!711046 m!667593))

(declare-fun m!667595 () Bool)

(assert (=> b!711052 m!667595))

(declare-fun m!667597 () Bool)

(assert (=> b!711064 m!667597))

(declare-fun m!667599 () Bool)

(assert (=> b!711055 m!667599))

(declare-fun m!667601 () Bool)

(assert (=> b!711040 m!667601))

(declare-fun m!667603 () Bool)

(assert (=> b!711057 m!667603))

(declare-fun m!667605 () Bool)

(assert (=> b!711059 m!667605))

(declare-fun m!667607 () Bool)

(assert (=> b!711041 m!667607))

(declare-fun m!667609 () Bool)

(assert (=> b!711051 m!667609))

(declare-fun m!667611 () Bool)

(assert (=> b!711053 m!667611))

(declare-fun m!667613 () Bool)

(assert (=> b!711062 m!667613))

(assert (=> b!711062 m!667613))

(declare-fun m!667615 () Bool)

(assert (=> b!711062 m!667615))

(assert (=> b!711058 m!667613))

(assert (=> b!711058 m!667613))

(declare-fun m!667617 () Bool)

(assert (=> b!711058 m!667617))

(assert (=> b!711058 m!667613))

(declare-fun m!667619 () Bool)

(assert (=> b!711058 m!667619))

(declare-fun m!667621 () Bool)

(assert (=> b!711061 m!667621))

(declare-fun m!667623 () Bool)

(assert (=> b!711063 m!667623))

(declare-fun m!667625 () Bool)

(assert (=> b!711048 m!667625))

(declare-fun m!667627 () Bool)

(assert (=> b!711045 m!667627))

(declare-fun m!667629 () Bool)

(assert (=> b!711054 m!667629))

(declare-fun m!667631 () Bool)

(assert (=> b!711065 m!667631))

(declare-fun m!667633 () Bool)

(assert (=> b!711044 m!667633))

(declare-fun m!667635 () Bool)

(assert (=> b!711043 m!667635))

(declare-fun m!667637 () Bool)

(assert (=> b!711042 m!667637))

(declare-fun m!667639 () Bool)

(assert (=> b!711056 m!667639))

(declare-fun m!667641 () Bool)

(assert (=> start!63136 m!667641))

(check-sat (not b!711043) (not b!711047) (not b!711060) (not b!711065) (not b!711046) (not b!711062) (not start!63136) (not b!711048) (not b!711045) (not b!711058) (not b!711061) (not b!711053) (not b!711063) (not b!711044) (not b!711041) (not b!711054) (not b!711051) (not b!711040) (not b!711049) (not b!711052) (not b!711059) (not b!711055) (not b!711056) (not b!711042) (not b!711064) (not b!711057))
(check-sat)
(get-model)

(declare-fun d!97457 () Bool)

(declare-fun lt!318206 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!355 (List!13429) (InoxSet (_ BitVec 64)))

(assert (=> d!97457 (= lt!318206 (select (content!355 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!400096 () Bool)

(assert (=> d!97457 (= lt!318206 e!400096)))

(declare-fun res!474705 () Bool)

(assert (=> d!97457 (=> (not res!474705) (not e!400096))))

(get-info :version)

(assert (=> d!97457 (= res!474705 ((_ is Cons!13425) acc!652))))

(assert (=> d!97457 (= (contains!3951 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318206)))

(declare-fun b!711226 () Bool)

(declare-fun e!400095 () Bool)

(assert (=> b!711226 (= e!400096 e!400095)))

(declare-fun res!474704 () Bool)

(assert (=> b!711226 (=> res!474704 e!400095)))

(assert (=> b!711226 (= res!474704 (= (h!14470 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!711227 () Bool)

(assert (=> b!711227 (= e!400095 (contains!3951 (t!19726 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97457 res!474705) b!711226))

(assert (= (and b!711226 (not res!474704)) b!711227))

(declare-fun m!667755 () Bool)

(assert (=> d!97457 m!667755))

(declare-fun m!667757 () Bool)

(assert (=> d!97457 m!667757))

(declare-fun m!667759 () Bool)

(assert (=> b!711227 m!667759))

(assert (=> b!711063 d!97457))

(declare-fun d!97459 () Bool)

(declare-fun res!474710 () Bool)

(declare-fun e!400101 () Bool)

(assert (=> d!97459 (=> res!474710 e!400101)))

(assert (=> d!97459 (= res!474710 ((_ is Nil!13426) lt!318190))))

(assert (=> d!97459 (= (noDuplicate!1220 lt!318190) e!400101)))

(declare-fun b!711232 () Bool)

(declare-fun e!400102 () Bool)

(assert (=> b!711232 (= e!400101 e!400102)))

(declare-fun res!474711 () Bool)

(assert (=> b!711232 (=> (not res!474711) (not e!400102))))

(assert (=> b!711232 (= res!474711 (not (contains!3951 (t!19726 lt!318190) (h!14470 lt!318190))))))

(declare-fun b!711233 () Bool)

(assert (=> b!711233 (= e!400102 (noDuplicate!1220 (t!19726 lt!318190)))))

(assert (= (and d!97459 (not res!474710)) b!711232))

(assert (= (and b!711232 res!474711) b!711233))

(declare-fun m!667761 () Bool)

(assert (=> b!711232 m!667761))

(declare-fun m!667763 () Bool)

(assert (=> b!711233 m!667763))

(assert (=> b!711042 d!97459))

(declare-fun d!97461 () Bool)

(declare-fun lt!318207 () Bool)

(assert (=> d!97461 (= lt!318207 (select (content!355 lt!318190) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!400104 () Bool)

(assert (=> d!97461 (= lt!318207 e!400104)))

(declare-fun res!474713 () Bool)

(assert (=> d!97461 (=> (not res!474713) (not e!400104))))

(assert (=> d!97461 (= res!474713 ((_ is Cons!13425) lt!318190))))

(assert (=> d!97461 (= (contains!3951 lt!318190 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318207)))

(declare-fun b!711234 () Bool)

(declare-fun e!400103 () Bool)

(assert (=> b!711234 (= e!400104 e!400103)))

(declare-fun res!474712 () Bool)

(assert (=> b!711234 (=> res!474712 e!400103)))

(assert (=> b!711234 (= res!474712 (= (h!14470 lt!318190) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!711235 () Bool)

(assert (=> b!711235 (= e!400103 (contains!3951 (t!19726 lt!318190) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97461 res!474713) b!711234))

(assert (= (and b!711234 (not res!474712)) b!711235))

(declare-fun m!667765 () Bool)

(assert (=> d!97461 m!667765))

(declare-fun m!667767 () Bool)

(assert (=> d!97461 m!667767))

(declare-fun m!667769 () Bool)

(assert (=> b!711235 m!667769))

(assert (=> b!711064 d!97461))

(declare-fun b!711246 () Bool)

(declare-fun e!400113 () Bool)

(declare-fun call!34489 () Bool)

(assert (=> b!711246 (= e!400113 call!34489)))

(declare-fun b!711247 () Bool)

(declare-fun e!400116 () Bool)

(assert (=> b!711247 (= e!400116 e!400113)))

(declare-fun c!78630 () Bool)

(assert (=> b!711247 (= c!78630 (validKeyInArray!0 (select (arr!19349 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun d!97463 () Bool)

(declare-fun res!474721 () Bool)

(declare-fun e!400115 () Bool)

(assert (=> d!97463 (=> res!474721 e!400115)))

(assert (=> d!97463 (= res!474721 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) (size!19752 a!3591)))))

(assert (=> d!97463 (= (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318190) e!400115)))

(declare-fun b!711248 () Bool)

(assert (=> b!711248 (= e!400115 e!400116)))

(declare-fun res!474720 () Bool)

(assert (=> b!711248 (=> (not res!474720) (not e!400116))))

(declare-fun e!400114 () Bool)

(assert (=> b!711248 (= res!474720 (not e!400114))))

(declare-fun res!474722 () Bool)

(assert (=> b!711248 (=> (not res!474722) (not e!400114))))

(assert (=> b!711248 (= res!474722 (validKeyInArray!0 (select (arr!19349 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun bm!34486 () Bool)

(assert (=> bm!34486 (= call!34489 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (ite c!78630 (Cons!13425 (select (arr!19349 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) lt!318190) lt!318190)))))

(declare-fun b!711249 () Bool)

(assert (=> b!711249 (= e!400114 (contains!3951 lt!318190 (select (arr!19349 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!711250 () Bool)

(assert (=> b!711250 (= e!400113 call!34489)))

(assert (= (and d!97463 (not res!474721)) b!711248))

(assert (= (and b!711248 res!474722) b!711249))

(assert (= (and b!711248 res!474720) b!711247))

(assert (= (and b!711247 c!78630) b!711250))

(assert (= (and b!711247 (not c!78630)) b!711246))

(assert (= (or b!711250 b!711246) bm!34486))

(declare-fun m!667771 () Bool)

(assert (=> b!711247 m!667771))

(assert (=> b!711247 m!667771))

(declare-fun m!667773 () Bool)

(assert (=> b!711247 m!667773))

(assert (=> b!711248 m!667771))

(assert (=> b!711248 m!667771))

(assert (=> b!711248 m!667773))

(assert (=> bm!34486 m!667771))

(declare-fun m!667775 () Bool)

(assert (=> bm!34486 m!667775))

(assert (=> b!711249 m!667771))

(assert (=> b!711249 m!667771))

(declare-fun m!667777 () Bool)

(assert (=> b!711249 m!667777))

(assert (=> b!711043 d!97463))

(declare-fun d!97467 () Bool)

(assert (=> d!97467 (= (array_inv!15232 a!3591) (bvsge (size!19752 a!3591) #b00000000000000000000000000000000))))

(assert (=> start!63136 d!97467))

(declare-fun d!97469 () Bool)

(declare-fun lt!318208 () Bool)

(assert (=> d!97469 (= lt!318208 (select (content!355 acc!652) k0!2824))))

(declare-fun e!400118 () Bool)

(assert (=> d!97469 (= lt!318208 e!400118)))

(declare-fun res!474724 () Bool)

(assert (=> d!97469 (=> (not res!474724) (not e!400118))))

(assert (=> d!97469 (= res!474724 ((_ is Cons!13425) acc!652))))

(assert (=> d!97469 (= (contains!3951 acc!652 k0!2824) lt!318208)))

(declare-fun b!711251 () Bool)

(declare-fun e!400117 () Bool)

(assert (=> b!711251 (= e!400118 e!400117)))

(declare-fun res!474723 () Bool)

(assert (=> b!711251 (=> res!474723 e!400117)))

(assert (=> b!711251 (= res!474723 (= (h!14470 acc!652) k0!2824))))

(declare-fun b!711252 () Bool)

(assert (=> b!711252 (= e!400117 (contains!3951 (t!19726 acc!652) k0!2824))))

(assert (= (and d!97469 res!474724) b!711251))

(assert (= (and b!711251 (not res!474723)) b!711252))

(assert (=> d!97469 m!667755))

(declare-fun m!667779 () Bool)

(assert (=> d!97469 m!667779))

(declare-fun m!667781 () Bool)

(assert (=> b!711252 m!667781))

(assert (=> b!711065 d!97469))

(declare-fun d!97471 () Bool)

(assert (=> d!97471 (= (validKeyInArray!0 k0!2824) (and (not (= k0!2824 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2824 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!711044 d!97471))

(declare-fun b!711259 () Bool)

(declare-fun e!400125 () Bool)

(declare-fun call!34490 () Bool)

(assert (=> b!711259 (= e!400125 call!34490)))

(declare-fun b!711260 () Bool)

(declare-fun e!400128 () Bool)

(assert (=> b!711260 (= e!400128 e!400125)))

(declare-fun c!78631 () Bool)

(assert (=> b!711260 (= c!78631 (validKeyInArray!0 (select (arr!19349 a!3591) from!2969)))))

(declare-fun d!97473 () Bool)

(declare-fun res!474732 () Bool)

(declare-fun e!400127 () Bool)

(assert (=> d!97473 (=> res!474732 e!400127)))

(assert (=> d!97473 (= res!474732 (bvsge from!2969 (size!19752 a!3591)))))

(assert (=> d!97473 (= (arrayNoDuplicates!0 a!3591 from!2969 acc!652) e!400127)))

(declare-fun b!711261 () Bool)

(assert (=> b!711261 (= e!400127 e!400128)))

(declare-fun res!474731 () Bool)

(assert (=> b!711261 (=> (not res!474731) (not e!400128))))

(declare-fun e!400126 () Bool)

(assert (=> b!711261 (= res!474731 (not e!400126))))

(declare-fun res!474733 () Bool)

(assert (=> b!711261 (=> (not res!474733) (not e!400126))))

(assert (=> b!711261 (= res!474733 (validKeyInArray!0 (select (arr!19349 a!3591) from!2969)))))

(declare-fun bm!34487 () Bool)

(assert (=> bm!34487 (= call!34490 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78631 (Cons!13425 (select (arr!19349 a!3591) from!2969) acc!652) acc!652)))))

(declare-fun b!711262 () Bool)

(assert (=> b!711262 (= e!400126 (contains!3951 acc!652 (select (arr!19349 a!3591) from!2969)))))

(declare-fun b!711263 () Bool)

(assert (=> b!711263 (= e!400125 call!34490)))

(assert (= (and d!97473 (not res!474732)) b!711261))

(assert (= (and b!711261 res!474733) b!711262))

(assert (= (and b!711261 res!474731) b!711260))

(assert (= (and b!711260 c!78631) b!711263))

(assert (= (and b!711260 (not c!78631)) b!711259))

(assert (= (or b!711263 b!711259) bm!34487))

(assert (=> b!711260 m!667613))

(assert (=> b!711260 m!667613))

(assert (=> b!711260 m!667615))

(assert (=> b!711261 m!667613))

(assert (=> b!711261 m!667613))

(assert (=> b!711261 m!667615))

(assert (=> bm!34487 m!667613))

(declare-fun m!667787 () Bool)

(assert (=> bm!34487 m!667787))

(assert (=> b!711262 m!667613))

(assert (=> b!711262 m!667613))

(declare-fun m!667789 () Bool)

(assert (=> b!711262 m!667789))

(assert (=> b!711061 d!97473))

(declare-fun d!97477 () Bool)

(declare-fun lt!318209 () Bool)

(assert (=> d!97477 (= lt!318209 (select (content!355 lt!318191) k0!2824))))

(declare-fun e!400130 () Bool)

(assert (=> d!97477 (= lt!318209 e!400130)))

(declare-fun res!474735 () Bool)

(assert (=> d!97477 (=> (not res!474735) (not e!400130))))

(assert (=> d!97477 (= res!474735 ((_ is Cons!13425) lt!318191))))

(assert (=> d!97477 (= (contains!3951 lt!318191 k0!2824) lt!318209)))

(declare-fun b!711264 () Bool)

(declare-fun e!400129 () Bool)

(assert (=> b!711264 (= e!400130 e!400129)))

(declare-fun res!474734 () Bool)

(assert (=> b!711264 (=> res!474734 e!400129)))

(assert (=> b!711264 (= res!474734 (= (h!14470 lt!318191) k0!2824))))

(declare-fun b!711265 () Bool)

(assert (=> b!711265 (= e!400129 (contains!3951 (t!19726 lt!318191) k0!2824))))

(assert (= (and d!97477 res!474735) b!711264))

(assert (= (and b!711264 (not res!474734)) b!711265))

(declare-fun m!667791 () Bool)

(assert (=> d!97477 m!667791))

(declare-fun m!667793 () Bool)

(assert (=> d!97477 m!667793))

(declare-fun m!667795 () Bool)

(assert (=> b!711265 m!667795))

(assert (=> b!711040 d!97477))

(declare-fun d!97479 () Bool)

(assert (=> d!97479 (= (validKeyInArray!0 (select (arr!19349 a!3591) from!2969)) (and (not (= (select (arr!19349 a!3591) from!2969) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19349 a!3591) from!2969) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!711062 d!97479))

(declare-fun b!711295 () Bool)

(declare-fun e!400160 () Bool)

(assert (=> b!711295 (= e!400160 (subseq!413 acc!652 (t!19726 newAcc!49)))))

(declare-fun b!711292 () Bool)

(declare-fun e!400157 () Bool)

(declare-fun e!400158 () Bool)

(assert (=> b!711292 (= e!400157 e!400158)))

(declare-fun res!474763 () Bool)

(assert (=> b!711292 (=> (not res!474763) (not e!400158))))

(assert (=> b!711292 (= res!474763 ((_ is Cons!13425) newAcc!49))))

(declare-fun d!97481 () Bool)

(declare-fun res!474764 () Bool)

(assert (=> d!97481 (=> res!474764 e!400157)))

(assert (=> d!97481 (= res!474764 ((_ is Nil!13426) acc!652))))

(assert (=> d!97481 (= (subseq!413 acc!652 newAcc!49) e!400157)))

(declare-fun b!711294 () Bool)

(declare-fun e!400159 () Bool)

(assert (=> b!711294 (= e!400159 (subseq!413 (t!19726 acc!652) (t!19726 newAcc!49)))))

(declare-fun b!711293 () Bool)

(assert (=> b!711293 (= e!400158 e!400160)))

(declare-fun res!474762 () Bool)

(assert (=> b!711293 (=> res!474762 e!400160)))

(assert (=> b!711293 (= res!474762 e!400159)))

(declare-fun res!474765 () Bool)

(assert (=> b!711293 (=> (not res!474765) (not e!400159))))

(assert (=> b!711293 (= res!474765 (= (h!14470 acc!652) (h!14470 newAcc!49)))))

(assert (= (and d!97481 (not res!474764)) b!711292))

(assert (= (and b!711292 res!474763) b!711293))

(assert (= (and b!711293 res!474765) b!711294))

(assert (= (and b!711293 (not res!474762)) b!711295))

(declare-fun m!667805 () Bool)

(assert (=> b!711295 m!667805))

(declare-fun m!667807 () Bool)

(assert (=> b!711294 m!667807))

(assert (=> b!711041 d!97481))

(declare-fun e!400201 () Bool)

(declare-fun b!711338 () Bool)

(declare-fun lt!318220 () List!13429)

(assert (=> b!711338 (= e!400201 (= (content!355 lt!318220) ((_ map and) (content!355 lt!318191) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2824 true)))))))

(declare-fun bm!34490 () Bool)

(declare-fun call!34493 () List!13429)

(assert (=> bm!34490 (= call!34493 (-!378 (t!19726 lt!318191) k0!2824))))

(declare-fun d!97493 () Bool)

(assert (=> d!97493 e!400201))

(declare-fun res!474800 () Bool)

(assert (=> d!97493 (=> (not res!474800) (not e!400201))))

(declare-fun size!19755 (List!13429) Int)

(assert (=> d!97493 (= res!474800 (<= (size!19755 lt!318220) (size!19755 lt!318191)))))

(declare-fun e!400200 () List!13429)

(assert (=> d!97493 (= lt!318220 e!400200)))

(declare-fun c!78637 () Bool)

(assert (=> d!97493 (= c!78637 ((_ is Cons!13425) lt!318191))))

(assert (=> d!97493 (= (-!378 lt!318191 k0!2824) lt!318220)))

(declare-fun b!711339 () Bool)

(declare-fun e!400202 () List!13429)

(assert (=> b!711339 (= e!400202 (Cons!13425 (h!14470 lt!318191) call!34493))))

(declare-fun b!711340 () Bool)

(assert (=> b!711340 (= e!400202 call!34493)))

(declare-fun b!711341 () Bool)

(assert (=> b!711341 (= e!400200 e!400202)))

(declare-fun c!78636 () Bool)

(assert (=> b!711341 (= c!78636 (= k0!2824 (h!14470 lt!318191)))))

(declare-fun b!711342 () Bool)

(assert (=> b!711342 (= e!400200 Nil!13426)))

(assert (= (and d!97493 c!78637) b!711341))

(assert (= (and d!97493 (not c!78637)) b!711342))

(assert (= (and b!711341 c!78636) b!711340))

(assert (= (and b!711341 (not c!78636)) b!711339))

(assert (= (or b!711340 b!711339) bm!34490))

(assert (= (and d!97493 res!474800) b!711338))

(declare-fun m!667847 () Bool)

(assert (=> b!711338 m!667847))

(assert (=> b!711338 m!667791))

(declare-fun m!667851 () Bool)

(assert (=> b!711338 m!667851))

(declare-fun m!667853 () Bool)

(assert (=> bm!34490 m!667853))

(declare-fun m!667855 () Bool)

(assert (=> d!97493 m!667855))

(declare-fun m!667857 () Bool)

(assert (=> d!97493 m!667857))

(assert (=> b!711047 d!97493))

(declare-fun d!97515 () Bool)

(declare-fun lt!318221 () Bool)

(assert (=> d!97515 (= lt!318221 (select (content!355 lt!318190) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!400208 () Bool)

(assert (=> d!97515 (= lt!318221 e!400208)))

(declare-fun res!474806 () Bool)

(assert (=> d!97515 (=> (not res!474806) (not e!400208))))

(assert (=> d!97515 (= res!474806 ((_ is Cons!13425) lt!318190))))

(assert (=> d!97515 (= (contains!3951 lt!318190 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318221)))

(declare-fun b!711347 () Bool)

(declare-fun e!400207 () Bool)

(assert (=> b!711347 (= e!400208 e!400207)))

(declare-fun res!474805 () Bool)

(assert (=> b!711347 (=> res!474805 e!400207)))

(assert (=> b!711347 (= res!474805 (= (h!14470 lt!318190) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!711348 () Bool)

(assert (=> b!711348 (= e!400207 (contains!3951 (t!19726 lt!318190) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97515 res!474806) b!711347))

(assert (= (and b!711347 (not res!474805)) b!711348))

(assert (=> d!97515 m!667765))

(declare-fun m!667859 () Bool)

(assert (=> d!97515 m!667859))

(declare-fun m!667861 () Bool)

(assert (=> b!711348 m!667861))

(assert (=> b!711048 d!97515))

(declare-fun d!97519 () Bool)

(declare-fun res!474808 () Bool)

(declare-fun e!400210 () Bool)

(assert (=> d!97519 (=> res!474808 e!400210)))

(assert (=> d!97519 (= res!474808 ((_ is Nil!13426) lt!318191))))

(assert (=> d!97519 (= (noDuplicate!1220 lt!318191) e!400210)))

(declare-fun b!711350 () Bool)

(declare-fun e!400212 () Bool)

(assert (=> b!711350 (= e!400210 e!400212)))

(declare-fun res!474810 () Bool)

(assert (=> b!711350 (=> (not res!474810) (not e!400212))))

(assert (=> b!711350 (= res!474810 (not (contains!3951 (t!19726 lt!318191) (h!14470 lt!318191))))))

(declare-fun b!711352 () Bool)

(assert (=> b!711352 (= e!400212 (noDuplicate!1220 (t!19726 lt!318191)))))

(assert (= (and d!97519 (not res!474808)) b!711350))

(assert (= (and b!711350 res!474810) b!711352))

(declare-fun m!667863 () Bool)

(assert (=> b!711350 m!667863))

(declare-fun m!667865 () Bool)

(assert (=> b!711352 m!667865))

(assert (=> b!711049 d!97519))

(declare-fun d!97521 () Bool)

(declare-fun res!474811 () Bool)

(declare-fun e!400213 () Bool)

(assert (=> d!97521 (=> res!474811 e!400213)))

(assert (=> d!97521 (= res!474811 ((_ is Nil!13426) acc!652))))

(assert (=> d!97521 (= (noDuplicate!1220 acc!652) e!400213)))

(declare-fun b!711353 () Bool)

(declare-fun e!400214 () Bool)

(assert (=> b!711353 (= e!400213 e!400214)))

(declare-fun res!474812 () Bool)

(assert (=> b!711353 (=> (not res!474812) (not e!400214))))

(assert (=> b!711353 (= res!474812 (not (contains!3951 (t!19726 acc!652) (h!14470 acc!652))))))

(declare-fun b!711354 () Bool)

(assert (=> b!711354 (= e!400214 (noDuplicate!1220 (t!19726 acc!652)))))

(assert (= (and d!97521 (not res!474811)) b!711353))

(assert (= (and b!711353 res!474812) b!711354))

(declare-fun m!667869 () Bool)

(assert (=> b!711353 m!667869))

(declare-fun m!667871 () Bool)

(assert (=> b!711354 m!667871))

(assert (=> b!711045 d!97521))

(declare-fun d!97525 () Bool)

(declare-fun res!474823 () Bool)

(declare-fun e!400227 () Bool)

(assert (=> d!97525 (=> res!474823 e!400227)))

(assert (=> d!97525 (= res!474823 (= (select (arr!19349 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) k0!2824))))

(assert (=> d!97525 (= (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969)) e!400227)))

(declare-fun b!711369 () Bool)

(declare-fun e!400228 () Bool)

(assert (=> b!711369 (= e!400227 e!400228)))

(declare-fun res!474824 () Bool)

(assert (=> b!711369 (=> (not res!474824) (not e!400228))))

(assert (=> b!711369 (= res!474824 (bvslt (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (size!19752 a!3591)))))

(declare-fun b!711370 () Bool)

(assert (=> b!711370 (= e!400228 (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!97525 (not res!474823)) b!711369))

(assert (= (and b!711369 res!474824) b!711370))

(assert (=> d!97525 m!667771))

(declare-fun m!667873 () Bool)

(assert (=> b!711370 m!667873))

(assert (=> b!711046 d!97525))

(declare-fun d!97527 () Bool)

(declare-fun lt!318222 () Bool)

(assert (=> d!97527 (= lt!318222 (select (content!355 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!400236 () Bool)

(assert (=> d!97527 (= lt!318222 e!400236)))

(declare-fun res!474832 () Bool)

(assert (=> d!97527 (=> (not res!474832) (not e!400236))))

(assert (=> d!97527 (= res!474832 ((_ is Cons!13425) newAcc!49))))

(assert (=> d!97527 (= (contains!3951 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318222)))

(declare-fun b!711375 () Bool)

(declare-fun e!400235 () Bool)

(assert (=> b!711375 (= e!400236 e!400235)))

(declare-fun res!474831 () Bool)

(assert (=> b!711375 (=> res!474831 e!400235)))

(assert (=> b!711375 (= res!474831 (= (h!14470 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!711376 () Bool)

(assert (=> b!711376 (= e!400235 (contains!3951 (t!19726 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97527 res!474832) b!711375))

(assert (= (and b!711375 (not res!474831)) b!711376))

(declare-fun m!667875 () Bool)

(assert (=> d!97527 m!667875))

(declare-fun m!667877 () Bool)

(assert (=> d!97527 m!667877))

(declare-fun m!667879 () Bool)

(assert (=> b!711376 m!667879))

(assert (=> b!711053 d!97527))

(declare-fun d!97529 () Bool)

(declare-fun res!474833 () Bool)

(declare-fun e!400239 () Bool)

(assert (=> d!97529 (=> res!474833 e!400239)))

(assert (=> d!97529 (= res!474833 (= (select (arr!19349 a!3591) from!2969) k0!2824))))

(assert (=> d!97529 (= (arrayContainsKey!0 a!3591 k0!2824 from!2969) e!400239)))

(declare-fun b!711383 () Bool)

(declare-fun e!400240 () Bool)

(assert (=> b!711383 (= e!400239 e!400240)))

(declare-fun res!474834 () Bool)

(assert (=> b!711383 (=> (not res!474834) (not e!400240))))

(assert (=> b!711383 (= res!474834 (bvslt (bvadd from!2969 #b00000000000000000000000000000001) (size!19752 a!3591)))))

(declare-fun b!711384 () Bool)

(assert (=> b!711384 (= e!400240 (arrayContainsKey!0 a!3591 k0!2824 (bvadd from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!97529 (not res!474833)) b!711383))

(assert (= (and b!711383 res!474834) b!711384))

(assert (=> d!97529 m!667613))

(declare-fun m!667881 () Bool)

(assert (=> b!711384 m!667881))

(assert (=> b!711054 d!97529))

(declare-fun d!97531 () Bool)

(declare-fun lt!318223 () Bool)

(assert (=> d!97531 (= lt!318223 (select (content!355 lt!318190) k0!2824))))

(declare-fun e!400242 () Bool)

(assert (=> d!97531 (= lt!318223 e!400242)))

(declare-fun res!474836 () Bool)

(assert (=> d!97531 (=> (not res!474836) (not e!400242))))

(assert (=> d!97531 (= res!474836 ((_ is Cons!13425) lt!318190))))

(assert (=> d!97531 (= (contains!3951 lt!318190 k0!2824) lt!318223)))

(declare-fun b!711385 () Bool)

(declare-fun e!400241 () Bool)

(assert (=> b!711385 (= e!400242 e!400241)))

(declare-fun res!474835 () Bool)

(assert (=> b!711385 (=> res!474835 e!400241)))

(assert (=> b!711385 (= res!474835 (= (h!14470 lt!318190) k0!2824))))

(declare-fun b!711386 () Bool)

(assert (=> b!711386 (= e!400241 (contains!3951 (t!19726 lt!318190) k0!2824))))

(assert (= (and d!97531 res!474836) b!711385))

(assert (= (and b!711385 (not res!474835)) b!711386))

(assert (=> d!97531 m!667765))

(declare-fun m!667883 () Bool)

(assert (=> d!97531 m!667883))

(declare-fun m!667885 () Bool)

(assert (=> b!711386 m!667885))

(assert (=> b!711051 d!97531))

(declare-fun d!97533 () Bool)

(declare-fun lt!318224 () Bool)

(assert (=> d!97533 (= lt!318224 (select (content!355 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!400244 () Bool)

(assert (=> d!97533 (= lt!318224 e!400244)))

(declare-fun res!474838 () Bool)

(assert (=> d!97533 (=> (not res!474838) (not e!400244))))

(assert (=> d!97533 (= res!474838 ((_ is Cons!13425) newAcc!49))))

(assert (=> d!97533 (= (contains!3951 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318224)))

(declare-fun b!711387 () Bool)

(declare-fun e!400243 () Bool)

(assert (=> b!711387 (= e!400244 e!400243)))

(declare-fun res!474837 () Bool)

(assert (=> b!711387 (=> res!474837 e!400243)))

(assert (=> b!711387 (= res!474837 (= (h!14470 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!711388 () Bool)

(assert (=> b!711388 (= e!400243 (contains!3951 (t!19726 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97533 res!474838) b!711387))

(assert (= (and b!711387 (not res!474837)) b!711388))

(assert (=> d!97533 m!667875))

(declare-fun m!667887 () Bool)

(assert (=> d!97533 m!667887))

(declare-fun m!667889 () Bool)

(assert (=> b!711388 m!667889))

(assert (=> b!711052 d!97533))

(declare-fun d!97535 () Bool)

(assert (=> d!97535 (= ($colon$colon!523 newAcc!49 (select (arr!19349 a!3591) from!2969)) (Cons!13425 (select (arr!19349 a!3591) from!2969) newAcc!49))))

(assert (=> b!711058 d!97535))

(declare-fun d!97537 () Bool)

(assert (=> d!97537 (= ($colon$colon!523 acc!652 (select (arr!19349 a!3591) from!2969)) (Cons!13425 (select (arr!19349 a!3591) from!2969) acc!652))))

(assert (=> b!711058 d!97537))

(declare-fun d!97539 () Bool)

(declare-fun res!474842 () Bool)

(declare-fun e!400249 () Bool)

(assert (=> d!97539 (=> res!474842 e!400249)))

(assert (=> d!97539 (= res!474842 ((_ is Nil!13426) newAcc!49))))

(assert (=> d!97539 (= (noDuplicate!1220 newAcc!49) e!400249)))

(declare-fun b!711394 () Bool)

(declare-fun e!400250 () Bool)

(assert (=> b!711394 (= e!400249 e!400250)))

(declare-fun res!474843 () Bool)

(assert (=> b!711394 (=> (not res!474843) (not e!400250))))

(assert (=> b!711394 (= res!474843 (not (contains!3951 (t!19726 newAcc!49) (h!14470 newAcc!49))))))

(declare-fun b!711395 () Bool)

(assert (=> b!711395 (= e!400250 (noDuplicate!1220 (t!19726 newAcc!49)))))

(assert (= (and d!97539 (not res!474842)) b!711394))

(assert (= (and b!711394 res!474843) b!711395))

(declare-fun m!667891 () Bool)

(assert (=> b!711394 m!667891))

(declare-fun m!667893 () Bool)

(assert (=> b!711395 m!667893))

(assert (=> b!711059 d!97539))

(declare-fun d!97541 () Bool)

(declare-fun lt!318225 () Bool)

(assert (=> d!97541 (= lt!318225 (select (content!355 newAcc!49) k0!2824))))

(declare-fun e!400252 () Bool)

(assert (=> d!97541 (= lt!318225 e!400252)))

(declare-fun res!474845 () Bool)

(assert (=> d!97541 (=> (not res!474845) (not e!400252))))

(assert (=> d!97541 (= res!474845 ((_ is Cons!13425) newAcc!49))))

(assert (=> d!97541 (= (contains!3951 newAcc!49 k0!2824) lt!318225)))

(declare-fun b!711396 () Bool)

(declare-fun e!400251 () Bool)

(assert (=> b!711396 (= e!400252 e!400251)))

(declare-fun res!474844 () Bool)

(assert (=> b!711396 (=> res!474844 e!400251)))

(assert (=> b!711396 (= res!474844 (= (h!14470 newAcc!49) k0!2824))))

(declare-fun b!711397 () Bool)

(assert (=> b!711397 (= e!400251 (contains!3951 (t!19726 newAcc!49) k0!2824))))

(assert (= (and d!97541 res!474845) b!711396))

(assert (= (and b!711396 (not res!474844)) b!711397))

(assert (=> d!97541 m!667875))

(declare-fun m!667899 () Bool)

(assert (=> d!97541 m!667899))

(declare-fun m!667901 () Bool)

(assert (=> b!711397 m!667901))

(assert (=> b!711060 d!97541))

(declare-fun d!97543 () Bool)

(declare-fun lt!318226 () Bool)

(assert (=> d!97543 (= lt!318226 (select (content!355 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!400254 () Bool)

(assert (=> d!97543 (= lt!318226 e!400254)))

(declare-fun res!474847 () Bool)

(assert (=> d!97543 (=> (not res!474847) (not e!400254))))

(assert (=> d!97543 (= res!474847 ((_ is Cons!13425) acc!652))))

(assert (=> d!97543 (= (contains!3951 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318226)))

(declare-fun b!711398 () Bool)

(declare-fun e!400253 () Bool)

(assert (=> b!711398 (= e!400254 e!400253)))

(declare-fun res!474846 () Bool)

(assert (=> b!711398 (=> res!474846 e!400253)))

(assert (=> b!711398 (= res!474846 (= (h!14470 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!711399 () Bool)

(assert (=> b!711399 (= e!400253 (contains!3951 (t!19726 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97543 res!474847) b!711398))

(assert (= (and b!711398 (not res!474846)) b!711399))

(assert (=> d!97543 m!667755))

(declare-fun m!667905 () Bool)

(assert (=> d!97543 m!667905))

(declare-fun m!667907 () Bool)

(assert (=> b!711399 m!667907))

(assert (=> b!711055 d!97543))

(declare-fun b!711410 () Bool)

(declare-fun e!400264 () Bool)

(assert (=> b!711410 (= e!400264 (subseq!413 lt!318190 (t!19726 lt!318191)))))

(declare-fun b!711407 () Bool)

(declare-fun e!400261 () Bool)

(declare-fun e!400262 () Bool)

(assert (=> b!711407 (= e!400261 e!400262)))

(declare-fun res!474854 () Bool)

(assert (=> b!711407 (=> (not res!474854) (not e!400262))))

(assert (=> b!711407 (= res!474854 ((_ is Cons!13425) lt!318191))))

(declare-fun d!97547 () Bool)

(declare-fun res!474855 () Bool)

(assert (=> d!97547 (=> res!474855 e!400261)))

(assert (=> d!97547 (= res!474855 ((_ is Nil!13426) lt!318190))))

(assert (=> d!97547 (= (subseq!413 lt!318190 lt!318191) e!400261)))

(declare-fun b!711409 () Bool)

(declare-fun e!400263 () Bool)

(assert (=> b!711409 (= e!400263 (subseq!413 (t!19726 lt!318190) (t!19726 lt!318191)))))

(declare-fun b!711408 () Bool)

(assert (=> b!711408 (= e!400262 e!400264)))

(declare-fun res!474853 () Bool)

(assert (=> b!711408 (=> res!474853 e!400264)))

(assert (=> b!711408 (= res!474853 e!400263)))

(declare-fun res!474856 () Bool)

(assert (=> b!711408 (=> (not res!474856) (not e!400263))))

(assert (=> b!711408 (= res!474856 (= (h!14470 lt!318190) (h!14470 lt!318191)))))

(assert (= (and d!97547 (not res!474855)) b!711407))

(assert (= (and b!711407 res!474854) b!711408))

(assert (= (and b!711408 res!474856) b!711409))

(assert (= (and b!711408 (not res!474853)) b!711410))

(declare-fun m!667915 () Bool)

(assert (=> b!711410 m!667915))

(declare-fun m!667919 () Bool)

(assert (=> b!711409 m!667919))

(assert (=> b!711056 d!97547))

(declare-fun lt!318227 () List!13429)

(declare-fun b!711411 () Bool)

(declare-fun e!400266 () Bool)

(assert (=> b!711411 (= e!400266 (= (content!355 lt!318227) ((_ map and) (content!355 newAcc!49) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2824 true)))))))

(declare-fun bm!34497 () Bool)

(declare-fun call!34500 () List!13429)

(assert (=> bm!34497 (= call!34500 (-!378 (t!19726 newAcc!49) k0!2824))))

(declare-fun d!97551 () Bool)

(assert (=> d!97551 e!400266))

(declare-fun res!474857 () Bool)

(assert (=> d!97551 (=> (not res!474857) (not e!400266))))

(assert (=> d!97551 (= res!474857 (<= (size!19755 lt!318227) (size!19755 newAcc!49)))))

(declare-fun e!400265 () List!13429)

(assert (=> d!97551 (= lt!318227 e!400265)))

(declare-fun c!78645 () Bool)

(assert (=> d!97551 (= c!78645 ((_ is Cons!13425) newAcc!49))))

(assert (=> d!97551 (= (-!378 newAcc!49 k0!2824) lt!318227)))

(declare-fun b!711412 () Bool)

(declare-fun e!400267 () List!13429)

(assert (=> b!711412 (= e!400267 (Cons!13425 (h!14470 newAcc!49) call!34500))))

(declare-fun b!711413 () Bool)

(assert (=> b!711413 (= e!400267 call!34500)))

(declare-fun b!711414 () Bool)

(assert (=> b!711414 (= e!400265 e!400267)))

(declare-fun c!78644 () Bool)

(assert (=> b!711414 (= c!78644 (= k0!2824 (h!14470 newAcc!49)))))

(declare-fun b!711415 () Bool)

(assert (=> b!711415 (= e!400265 Nil!13426)))

(assert (= (and d!97551 c!78645) b!711414))

(assert (= (and d!97551 (not c!78645)) b!711415))

(assert (= (and b!711414 c!78644) b!711413))

(assert (= (and b!711414 (not c!78644)) b!711412))

(assert (= (or b!711413 b!711412) bm!34497))

(assert (= (and d!97551 res!474857) b!711411))

(declare-fun m!667923 () Bool)

(assert (=> b!711411 m!667923))

(assert (=> b!711411 m!667875))

(assert (=> b!711411 m!667851))

(declare-fun m!667929 () Bool)

(assert (=> bm!34497 m!667929))

(declare-fun m!667933 () Bool)

(assert (=> d!97551 m!667933))

(declare-fun m!667935 () Bool)

(assert (=> d!97551 m!667935))

(assert (=> b!711057 d!97551))

(check-sat (not d!97469) (not d!97533) (not b!711248) (not b!711370) (not b!711295) (not b!711409) (not bm!34497) (not b!711410) (not d!97541) (not b!711394) (not d!97543) (not b!711386) (not bm!34490) (not b!711260) (not b!711227) (not b!711350) (not b!711235) (not d!97531) (not b!711262) (not bm!34487) (not b!711352) (not b!711399) (not d!97515) (not b!711249) (not b!711247) (not b!711338) (not b!711395) (not b!711232) (not d!97527) (not b!711354) (not d!97493) (not b!711261) (not b!711411) (not b!711348) (not b!711353) (not b!711384) (not d!97551) (not bm!34486) (not d!97457) (not b!711376) (not b!711294) (not b!711397) (not b!711265) (not b!711252) (not d!97477) (not b!711233) (not d!97461) (not b!711388))
(check-sat)
