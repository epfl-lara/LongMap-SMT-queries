; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62902 () Bool)

(assert start!62902)

(declare-fun b!709210 () Bool)

(declare-fun res!472771 () Bool)

(declare-fun e!399153 () Bool)

(assert (=> b!709210 (=> (not res!472771) (not e!399153))))

(declare-datatypes ((List!13376 0))(
  ( (Nil!13373) (Cons!13372 (h!14417 (_ BitVec 64)) (t!19670 List!13376)) )
))
(declare-fun acc!652 () List!13376)

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun contains!3953 (List!13376 (_ BitVec 64)) Bool)

(assert (=> b!709210 (= res!472771 (not (contains!3953 acc!652 k!2824)))))

(declare-fun b!709211 () Bool)

(declare-fun res!472767 () Bool)

(declare-fun e!399155 () Bool)

(assert (=> b!709211 (=> (not res!472767) (not e!399155))))

(declare-fun lt!318200 () List!13376)

(assert (=> b!709211 (= res!472767 (not (contains!3953 lt!318200 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!472758 () Bool)

(assert (=> start!62902 (=> (not res!472758) (not e!399153))))

(declare-datatypes ((array!40369 0))(
  ( (array!40370 (arr!19335 (Array (_ BitVec 32) (_ BitVec 64))) (size!19728 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40369)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62902 (= res!472758 (and (bvslt (size!19728 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19728 a!3591))))))

(assert (=> start!62902 e!399153))

(assert (=> start!62902 true))

(declare-fun array_inv!15131 (array!40369) Bool)

(assert (=> start!62902 (array_inv!15131 a!3591)))

(declare-fun b!709212 () Bool)

(declare-fun res!472761 () Bool)

(assert (=> b!709212 (=> (not res!472761) (not e!399153))))

(declare-fun newAcc!49 () List!13376)

(assert (=> b!709212 (= res!472761 (contains!3953 newAcc!49 k!2824))))

(declare-fun b!709213 () Bool)

(declare-fun res!472775 () Bool)

(assert (=> b!709213 (=> (not res!472775) (not e!399153))))

(assert (=> b!709213 (= res!472775 (not (contains!3953 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709214 () Bool)

(assert (=> b!709214 (= e!399155 (contains!3953 lt!318200 k!2824))))

(declare-fun b!709215 () Bool)

(declare-fun res!472770 () Bool)

(assert (=> b!709215 (=> (not res!472770) (not e!399153))))

(declare-fun -!363 (List!13376 (_ BitVec 64)) List!13376)

(assert (=> b!709215 (= res!472770 (= (-!363 newAcc!49 k!2824) acc!652))))

(declare-fun b!709216 () Bool)

(declare-fun res!472765 () Bool)

(assert (=> b!709216 (=> (not res!472765) (not e!399153))))

(declare-fun noDuplicate!1200 (List!13376) Bool)

(assert (=> b!709216 (= res!472765 (noDuplicate!1200 newAcc!49))))

(declare-fun b!709217 () Bool)

(declare-fun res!472777 () Bool)

(assert (=> b!709217 (=> (not res!472777) (not e!399153))))

(assert (=> b!709217 (= res!472777 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19728 a!3591)))))

(declare-fun b!709218 () Bool)

(declare-fun res!472773 () Bool)

(assert (=> b!709218 (=> (not res!472773) (not e!399153))))

(assert (=> b!709218 (= res!472773 (noDuplicate!1200 acc!652))))

(declare-fun b!709219 () Bool)

(declare-fun res!472764 () Bool)

(assert (=> b!709219 (=> (not res!472764) (not e!399153))))

(declare-fun subseq!398 (List!13376 List!13376) Bool)

(assert (=> b!709219 (= res!472764 (subseq!398 acc!652 newAcc!49))))

(declare-fun b!709220 () Bool)

(declare-fun res!472762 () Bool)

(assert (=> b!709220 (=> (not res!472762) (not e!399153))))

(declare-fun arrayContainsKey!0 (array!40369 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!709220 (= res!472762 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!709221 () Bool)

(assert (=> b!709221 (= e!399153 e!399155)))

(declare-fun res!472759 () Bool)

(assert (=> b!709221 (=> (not res!472759) (not e!399155))))

(assert (=> b!709221 (= res!472759 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!509 (List!13376 (_ BitVec 64)) List!13376)

(assert (=> b!709221 (= lt!318200 ($colon$colon!509 acc!652 (select (arr!19335 a!3591) from!2969)))))

(declare-fun b!709222 () Bool)

(declare-fun res!472763 () Bool)

(assert (=> b!709222 (=> (not res!472763) (not e!399153))))

(assert (=> b!709222 (= res!472763 (not (contains!3953 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709223 () Bool)

(declare-fun res!472776 () Bool)

(assert (=> b!709223 (=> (not res!472776) (not e!399153))))

(assert (=> b!709223 (= res!472776 (not (contains!3953 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709224 () Bool)

(declare-fun res!472772 () Bool)

(assert (=> b!709224 (=> (not res!472772) (not e!399155))))

(assert (=> b!709224 (= res!472772 (noDuplicate!1200 lt!318200))))

(declare-fun b!709225 () Bool)

(declare-fun res!472760 () Bool)

(assert (=> b!709225 (=> (not res!472760) (not e!399155))))

(assert (=> b!709225 (= res!472760 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!709226 () Bool)

(declare-fun res!472756 () Bool)

(assert (=> b!709226 (=> (not res!472756) (not e!399153))))

(assert (=> b!709226 (= res!472756 (not (contains!3953 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709227 () Bool)

(declare-fun res!472757 () Bool)

(assert (=> b!709227 (=> (not res!472757) (not e!399153))))

(declare-fun arrayNoDuplicates!0 (array!40369 (_ BitVec 32) List!13376) Bool)

(assert (=> b!709227 (= res!472757 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!709228 () Bool)

(declare-fun res!472774 () Bool)

(assert (=> b!709228 (=> (not res!472774) (not e!399153))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!709228 (= res!472774 (validKeyInArray!0 (select (arr!19335 a!3591) from!2969)))))

(declare-fun b!709229 () Bool)

(declare-fun res!472769 () Bool)

(assert (=> b!709229 (=> (not res!472769) (not e!399155))))

(assert (=> b!709229 (= res!472769 (noDuplicate!1200 ($colon$colon!509 newAcc!49 (select (arr!19335 a!3591) from!2969))))))

(declare-fun b!709230 () Bool)

(declare-fun res!472768 () Bool)

(assert (=> b!709230 (=> (not res!472768) (not e!399153))))

(assert (=> b!709230 (= res!472768 (validKeyInArray!0 k!2824))))

(declare-fun b!709231 () Bool)

(declare-fun res!472766 () Bool)

(assert (=> b!709231 (=> (not res!472766) (not e!399155))))

(assert (=> b!709231 (= res!472766 (not (contains!3953 lt!318200 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!62902 res!472758) b!709218))

(assert (= (and b!709218 res!472773) b!709216))

(assert (= (and b!709216 res!472765) b!709223))

(assert (= (and b!709223 res!472776) b!709226))

(assert (= (and b!709226 res!472756) b!709220))

(assert (= (and b!709220 res!472762) b!709210))

(assert (= (and b!709210 res!472771) b!709230))

(assert (= (and b!709230 res!472768) b!709227))

(assert (= (and b!709227 res!472757) b!709219))

(assert (= (and b!709219 res!472764) b!709212))

(assert (= (and b!709212 res!472761) b!709215))

(assert (= (and b!709215 res!472770) b!709213))

(assert (= (and b!709213 res!472775) b!709222))

(assert (= (and b!709222 res!472763) b!709217))

(assert (= (and b!709217 res!472777) b!709228))

(assert (= (and b!709228 res!472774) b!709221))

(assert (= (and b!709221 res!472759) b!709224))

(assert (= (and b!709224 res!472772) b!709229))

(assert (= (and b!709229 res!472769) b!709211))

(assert (= (and b!709211 res!472767) b!709231))

(assert (= (and b!709231 res!472766) b!709225))

(assert (= (and b!709225 res!472760) b!709214))

(declare-fun m!666541 () Bool)

(assert (=> b!709211 m!666541))

(declare-fun m!666543 () Bool)

(assert (=> b!709219 m!666543))

(declare-fun m!666545 () Bool)

(assert (=> b!709220 m!666545))

(declare-fun m!666547 () Bool)

(assert (=> b!709223 m!666547))

(declare-fun m!666549 () Bool)

(assert (=> b!709215 m!666549))

(declare-fun m!666551 () Bool)

(assert (=> b!709218 m!666551))

(declare-fun m!666553 () Bool)

(assert (=> b!709230 m!666553))

(declare-fun m!666555 () Bool)

(assert (=> b!709212 m!666555))

(declare-fun m!666557 () Bool)

(assert (=> b!709210 m!666557))

(declare-fun m!666559 () Bool)

(assert (=> b!709227 m!666559))

(declare-fun m!666561 () Bool)

(assert (=> b!709226 m!666561))

(declare-fun m!666563 () Bool)

(assert (=> b!709213 m!666563))

(declare-fun m!666565 () Bool)

(assert (=> b!709224 m!666565))

(declare-fun m!666567 () Bool)

(assert (=> b!709225 m!666567))

(declare-fun m!666569 () Bool)

(assert (=> b!709222 m!666569))

(declare-fun m!666571 () Bool)

(assert (=> b!709214 m!666571))

(declare-fun m!666573 () Bool)

(assert (=> b!709228 m!666573))

(assert (=> b!709228 m!666573))

(declare-fun m!666575 () Bool)

(assert (=> b!709228 m!666575))

(assert (=> b!709221 m!666573))

(assert (=> b!709221 m!666573))

(declare-fun m!666577 () Bool)

(assert (=> b!709221 m!666577))

(declare-fun m!666579 () Bool)

(assert (=> b!709231 m!666579))

(declare-fun m!666581 () Bool)

(assert (=> start!62902 m!666581))

(declare-fun m!666583 () Bool)

(assert (=> b!709216 m!666583))

(assert (=> b!709229 m!666573))

(assert (=> b!709229 m!666573))

(declare-fun m!666585 () Bool)

(assert (=> b!709229 m!666585))

(assert (=> b!709229 m!666585))

(declare-fun m!666587 () Bool)

(assert (=> b!709229 m!666587))

(push 1)

(assert (not b!709221))

(assert (not b!709215))

(assert (not b!709226))

(assert (not b!709213))

(assert (not b!709229))

(assert (not start!62902))

(assert (not b!709228))

(assert (not b!709227))

(assert (not b!709212))

(assert (not b!709224))

(assert (not b!709230))

(assert (not b!709219))

(assert (not b!709223))

(assert (not b!709211))

(assert (not b!709220))

(assert (not b!709225))

(assert (not b!709222))

(assert (not b!709218))

(assert (not b!709231))

(assert (not b!709216))

(assert (not b!709214))

(assert (not b!709210))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97105 () Bool)

(assert (=> d!97105 (= ($colon$colon!509 acc!652 (select (arr!19335 a!3591) from!2969)) (Cons!13372 (select (arr!19335 a!3591) from!2969) acc!652))))

(assert (=> b!709221 d!97105))

(declare-fun d!97107 () Bool)

(declare-fun lt!318215 () Bool)

(declare-fun content!344 (List!13376) (Set (_ BitVec 64)))

(assert (=> d!97107 (= lt!318215 (set.member k!2824 (content!344 acc!652)))))

(declare-fun e!399230 () Bool)

(assert (=> d!97107 (= lt!318215 e!399230)))

(declare-fun res!472958 () Bool)

(assert (=> d!97107 (=> (not res!472958) (not e!399230))))

(assert (=> d!97107 (= res!472958 (is-Cons!13372 acc!652))))

(assert (=> d!97107 (= (contains!3953 acc!652 k!2824) lt!318215)))

(declare-fun b!709424 () Bool)

(declare-fun e!399229 () Bool)

(assert (=> b!709424 (= e!399230 e!399229)))

(declare-fun res!472959 () Bool)

(assert (=> b!709424 (=> res!472959 e!399229)))

(assert (=> b!709424 (= res!472959 (= (h!14417 acc!652) k!2824))))

(declare-fun b!709425 () Bool)

(assert (=> b!709425 (= e!399229 (contains!3953 (t!19670 acc!652) k!2824))))

(assert (= (and d!97107 res!472958) b!709424))

(assert (= (and b!709424 (not res!472959)) b!709425))

(declare-fun m!666715 () Bool)

(assert (=> d!97107 m!666715))

(declare-fun m!666717 () Bool)

(assert (=> d!97107 m!666717))

(declare-fun m!666719 () Bool)

(assert (=> b!709425 m!666719))

(assert (=> b!709210 d!97107))

(declare-fun d!97109 () Bool)

(declare-fun lt!318217 () Bool)

(assert (=> d!97109 (= lt!318217 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!344 lt!318200)))))

(declare-fun e!399235 () Bool)

(assert (=> d!97109 (= lt!318217 e!399235)))

(declare-fun res!472961 () Bool)

(assert (=> d!97109 (=> (not res!472961) (not e!399235))))

(assert (=> d!97109 (= res!472961 (is-Cons!13372 lt!318200))))

(assert (=> d!97109 (= (contains!3953 lt!318200 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318217)))

(declare-fun b!709431 () Bool)

(declare-fun e!399234 () Bool)

(assert (=> b!709431 (= e!399235 e!399234)))

(declare-fun res!472962 () Bool)

(assert (=> b!709431 (=> res!472962 e!399234)))

(assert (=> b!709431 (= res!472962 (= (h!14417 lt!318200) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!709432 () Bool)

(assert (=> b!709432 (= e!399234 (contains!3953 (t!19670 lt!318200) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97109 res!472961) b!709431))

(assert (= (and b!709431 (not res!472962)) b!709432))

(declare-fun m!666733 () Bool)

(assert (=> d!97109 m!666733))

(declare-fun m!666735 () Bool)

(assert (=> d!97109 m!666735))

(declare-fun m!666737 () Bool)

(assert (=> b!709432 m!666737))

(assert (=> b!709231 d!97109))

(declare-fun d!97113 () Bool)

(declare-fun res!472978 () Bool)

(declare-fun e!399252 () Bool)

(assert (=> d!97113 (=> res!472978 e!399252)))

(assert (=> d!97113 (= res!472978 (= (select (arr!19335 a!3591) from!2969) k!2824))))

(assert (=> d!97113 (= (arrayContainsKey!0 a!3591 k!2824 from!2969) e!399252)))

(declare-fun b!709450 () Bool)

(declare-fun e!399253 () Bool)

(assert (=> b!709450 (= e!399252 e!399253)))

(declare-fun res!472979 () Bool)

(assert (=> b!709450 (=> (not res!472979) (not e!399253))))

(assert (=> b!709450 (= res!472979 (bvslt (bvadd from!2969 #b00000000000000000000000000000001) (size!19728 a!3591)))))

(declare-fun b!709451 () Bool)

(assert (=> b!709451 (= e!399253 (arrayContainsKey!0 a!3591 k!2824 (bvadd from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!97113 (not res!472978)) b!709450))

(assert (= (and b!709450 res!472979) b!709451))

(assert (=> d!97113 m!666573))

(declare-fun m!666753 () Bool)

(assert (=> b!709451 m!666753))

(assert (=> b!709220 d!97113))

(declare-fun d!97121 () Bool)

(assert (=> d!97121 (= (validKeyInArray!0 k!2824) (and (not (= k!2824 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2824 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!709230 d!97121))

(declare-fun b!709486 () Bool)

(declare-fun e!399286 () Bool)

(declare-fun e!399289 () Bool)

(assert (=> b!709486 (= e!399286 e!399289)))

(declare-fun res!473011 () Bool)

(assert (=> b!709486 (=> (not res!473011) (not e!399289))))

(assert (=> b!709486 (= res!473011 (is-Cons!13372 newAcc!49))))

(declare-fun b!709487 () Bool)

(declare-fun e!399287 () Bool)

(assert (=> b!709487 (= e!399289 e!399287)))

(declare-fun res!473012 () Bool)

(assert (=> b!709487 (=> res!473012 e!399287)))

(declare-fun e!399288 () Bool)

(assert (=> b!709487 (= res!473012 e!399288)))

(declare-fun res!473013 () Bool)

(assert (=> b!709487 (=> (not res!473013) (not e!399288))))

(assert (=> b!709487 (= res!473013 (= (h!14417 acc!652) (h!14417 newAcc!49)))))

(declare-fun b!709488 () Bool)

(assert (=> b!709488 (= e!399288 (subseq!398 (t!19670 acc!652) (t!19670 newAcc!49)))))

(declare-fun d!97127 () Bool)

(declare-fun res!473010 () Bool)

(assert (=> d!97127 (=> res!473010 e!399286)))

(assert (=> d!97127 (= res!473010 (is-Nil!13373 acc!652))))

(assert (=> d!97127 (= (subseq!398 acc!652 newAcc!49) e!399286)))

(declare-fun b!709489 () Bool)

(assert (=> b!709489 (= e!399287 (subseq!398 acc!652 (t!19670 newAcc!49)))))

(assert (= (and d!97127 (not res!473010)) b!709486))

(assert (= (and b!709486 res!473011) b!709487))

(assert (= (and b!709487 res!473013) b!709488))

(assert (= (and b!709487 (not res!473012)) b!709489))

(declare-fun m!666789 () Bool)

(assert (=> b!709488 m!666789))

(declare-fun m!666791 () Bool)

(assert (=> b!709489 m!666791))

(assert (=> b!709219 d!97127))

(declare-fun d!97145 () Bool)

(declare-fun res!473037 () Bool)

(declare-fun e!399314 () Bool)

(assert (=> d!97145 (=> res!473037 e!399314)))

(assert (=> d!97145 (= res!473037 (is-Nil!13373 ($colon$colon!509 newAcc!49 (select (arr!19335 a!3591) from!2969))))))

(assert (=> d!97145 (= (noDuplicate!1200 ($colon$colon!509 newAcc!49 (select (arr!19335 a!3591) from!2969))) e!399314)))

(declare-fun b!709515 () Bool)

(declare-fun e!399315 () Bool)

(assert (=> b!709515 (= e!399314 e!399315)))

(declare-fun res!473038 () Bool)

(assert (=> b!709515 (=> (not res!473038) (not e!399315))))

(assert (=> b!709515 (= res!473038 (not (contains!3953 (t!19670 ($colon$colon!509 newAcc!49 (select (arr!19335 a!3591) from!2969))) (h!14417 ($colon$colon!509 newAcc!49 (select (arr!19335 a!3591) from!2969))))))))

(declare-fun b!709516 () Bool)

(assert (=> b!709516 (= e!399315 (noDuplicate!1200 (t!19670 ($colon$colon!509 newAcc!49 (select (arr!19335 a!3591) from!2969)))))))

(assert (= (and d!97145 (not res!473037)) b!709515))

(assert (= (and b!709515 res!473038) b!709516))

(declare-fun m!666807 () Bool)

(assert (=> b!709515 m!666807))

(declare-fun m!666811 () Bool)

(assert (=> b!709516 m!666811))

(assert (=> b!709229 d!97145))

(declare-fun d!97153 () Bool)

(assert (=> d!97153 (= ($colon$colon!509 newAcc!49 (select (arr!19335 a!3591) from!2969)) (Cons!13372 (select (arr!19335 a!3591) from!2969) newAcc!49))))

(assert (=> b!709229 d!97153))

(declare-fun d!97157 () Bool)

(declare-fun res!473039 () Bool)

(declare-fun e!399316 () Bool)

(assert (=> d!97157 (=> res!473039 e!399316)))

(assert (=> d!97157 (= res!473039 (is-Nil!13373 acc!652))))

(assert (=> d!97157 (= (noDuplicate!1200 acc!652) e!399316)))

(declare-fun b!709517 () Bool)

(declare-fun e!399317 () Bool)

(assert (=> b!709517 (= e!399316 e!399317)))

(declare-fun res!473040 () Bool)

(assert (=> b!709517 (=> (not res!473040) (not e!399317))))

(assert (=> b!709517 (= res!473040 (not (contains!3953 (t!19670 acc!652) (h!14417 acc!652))))))

(declare-fun b!709518 () Bool)

(assert (=> b!709518 (= e!399317 (noDuplicate!1200 (t!19670 acc!652)))))

(assert (= (and d!97157 (not res!473039)) b!709517))

(assert (= (and b!709517 res!473040) b!709518))

(declare-fun m!666815 () Bool)

(assert (=> b!709517 m!666815))

(declare-fun m!666817 () Bool)

(assert (=> b!709518 m!666817))

(assert (=> b!709218 d!97157))

(declare-fun d!97159 () Bool)

(assert (=> d!97159 (= (validKeyInArray!0 (select (arr!19335 a!3591) from!2969)) (and (not (= (select (arr!19335 a!3591) from!2969) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19335 a!3591) from!2969) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!709228 d!97159))

(declare-fun b!709560 () Bool)

(declare-fun e!399354 () Bool)

(declare-fun e!399353 () Bool)

(assert (=> b!709560 (= e!399354 e!399353)))

(declare-fun res!473066 () Bool)

(assert (=> b!709560 (=> (not res!473066) (not e!399353))))

(declare-fun e!399355 () Bool)

(assert (=> b!709560 (= res!473066 (not e!399355))))

(declare-fun res!473067 () Bool)

(assert (=> b!709560 (=> (not res!473067) (not e!399355))))

(assert (=> b!709560 (= res!473067 (validKeyInArray!0 (select (arr!19335 a!3591) from!2969)))))

(declare-fun b!709561 () Bool)

(assert (=> b!709561 (= e!399355 (contains!3953 acc!652 (select (arr!19335 a!3591) from!2969)))))

(declare-fun b!709562 () Bool)

(declare-fun e!399352 () Bool)

(declare-fun call!34449 () Bool)

(assert (=> b!709562 (= e!399352 call!34449)))

(declare-fun d!97161 () Bool)

(declare-fun res!473068 () Bool)

(assert (=> d!97161 (=> res!473068 e!399354)))

(assert (=> d!97161 (= res!473068 (bvsge from!2969 (size!19728 a!3591)))))

(assert (=> d!97161 (= (arrayNoDuplicates!0 a!3591 from!2969 acc!652) e!399354)))

(declare-fun b!709563 () Bool)

(assert (=> b!709563 (= e!399353 e!399352)))

(declare-fun c!78614 () Bool)

(assert (=> b!709563 (= c!78614 (validKeyInArray!0 (select (arr!19335 a!3591) from!2969)))))

(declare-fun b!709564 () Bool)

(assert (=> b!709564 (= e!399352 call!34449)))

(declare-fun bm!34446 () Bool)

(assert (=> bm!34446 (= call!34449 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78614 (Cons!13372 (select (arr!19335 a!3591) from!2969) acc!652) acc!652)))))

(assert (= (and d!97161 (not res!473068)) b!709560))

(assert (= (and b!709560 res!473067) b!709561))

(assert (= (and b!709560 res!473066) b!709563))

(assert (= (and b!709563 c!78614) b!709562))

(assert (= (and b!709563 (not c!78614)) b!709564))

(assert (= (or b!709562 b!709564) bm!34446))

(assert (=> b!709560 m!666573))

(assert (=> b!709560 m!666573))

(assert (=> b!709560 m!666575))

(assert (=> b!709561 m!666573))

(assert (=> b!709561 m!666573))

(declare-fun m!666853 () Bool)

(assert (=> b!709561 m!666853))

(assert (=> b!709563 m!666573))

(assert (=> b!709563 m!666573))

(assert (=> b!709563 m!666575))

(assert (=> bm!34446 m!666573))

(declare-fun m!666855 () Bool)

(assert (=> bm!34446 m!666855))

(assert (=> b!709227 d!97161))

(declare-fun d!97179 () Bool)

(declare-fun res!473073 () Bool)

(declare-fun e!399360 () Bool)

(assert (=> d!97179 (=> res!473073 e!399360)))

(assert (=> d!97179 (= res!473073 (is-Nil!13373 newAcc!49))))

(assert (=> d!97179 (= (noDuplicate!1200 newAcc!49) e!399360)))

(declare-fun b!709569 () Bool)

(declare-fun e!399361 () Bool)

(assert (=> b!709569 (= e!399360 e!399361)))

(declare-fun res!473074 () Bool)

(assert (=> b!709569 (=> (not res!473074) (not e!399361))))

(assert (=> b!709569 (= res!473074 (not (contains!3953 (t!19670 newAcc!49) (h!14417 newAcc!49))))))

(declare-fun b!709570 () Bool)

(assert (=> b!709570 (= e!399361 (noDuplicate!1200 (t!19670 newAcc!49)))))

(assert (= (and d!97179 (not res!473073)) b!709569))

(assert (= (and b!709569 res!473074) b!709570))

(declare-fun m!666857 () Bool)

(assert (=> b!709569 m!666857))

(declare-fun m!666859 () Bool)

(assert (=> b!709570 m!666859))

(assert (=> b!709216 d!97179))

(declare-fun d!97181 () Bool)

(declare-fun lt!318237 () Bool)

(assert (=> d!97181 (= lt!318237 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!344 acc!652)))))

(declare-fun e!399365 () Bool)

(assert (=> d!97181 (= lt!318237 e!399365)))

(declare-fun res!473077 () Bool)

(assert (=> d!97181 (=> (not res!473077) (not e!399365))))

(assert (=> d!97181 (= res!473077 (is-Cons!13372 acc!652))))

(assert (=> d!97181 (= (contains!3953 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318237)))

(declare-fun b!709573 () Bool)

(declare-fun e!399364 () Bool)

(assert (=> b!709573 (= e!399365 e!399364)))

(declare-fun res!473078 () Bool)

(assert (=> b!709573 (=> res!473078 e!399364)))

(assert (=> b!709573 (= res!473078 (= (h!14417 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!709574 () Bool)

(assert (=> b!709574 (= e!399364 (contains!3953 (t!19670 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97181 res!473077) b!709573))

(assert (= (and b!709573 (not res!473078)) b!709574))

(assert (=> d!97181 m!666715))

(declare-fun m!666865 () Bool)

(assert (=> d!97181 m!666865))

(declare-fun m!666867 () Bool)

(assert (=> b!709574 m!666867))

(assert (=> b!709226 d!97181))

(declare-fun b!709595 () Bool)

(declare-fun e!399383 () List!13376)

(declare-fun call!34452 () List!13376)

(assert (=> b!709595 (= e!399383 call!34452)))

(declare-fun b!709596 () Bool)

(declare-fun e!399385 () List!13376)

(assert (=> b!709596 (= e!399385 e!399383)))

(declare-fun c!78619 () Bool)

(assert (=> b!709596 (= c!78619 (= k!2824 (h!14417 newAcc!49)))))

(declare-fun lt!318242 () List!13376)

(declare-fun b!709598 () Bool)

(declare-fun e!399384 () Bool)

(assert (=> b!709598 (= e!399384 (= (content!344 lt!318242) (set.minus (content!344 newAcc!49) (set.insert k!2824 (as set.empty (Set (_ BitVec 64)))))))))

(declare-fun b!709599 () Bool)

(assert (=> b!709599 (= e!399385 Nil!13373)))

(declare-fun bm!34449 () Bool)

(assert (=> bm!34449 (= call!34452 (-!363 (t!19670 newAcc!49) k!2824))))

(declare-fun b!709597 () Bool)

(assert (=> b!709597 (= e!399383 (Cons!13372 (h!14417 newAcc!49) call!34452))))

(declare-fun d!97185 () Bool)

(assert (=> d!97185 e!399384))

(declare-fun res!473091 () Bool)

(assert (=> d!97185 (=> (not res!473091) (not e!399384))))

(declare-fun size!19732 (List!13376) Int)

(assert (=> d!97185 (= res!473091 (<= (size!19732 lt!318242) (size!19732 newAcc!49)))))

(assert (=> d!97185 (= lt!318242 e!399385)))

(declare-fun c!78620 () Bool)

(assert (=> d!97185 (= c!78620 (is-Cons!13372 newAcc!49))))

(assert (=> d!97185 (= (-!363 newAcc!49 k!2824) lt!318242)))

(assert (= (and d!97185 c!78620) b!709596))

(assert (= (and d!97185 (not c!78620)) b!709599))

(assert (= (and b!709596 c!78619) b!709595))

(assert (= (and b!709596 (not c!78619)) b!709597))

(assert (= (or b!709595 b!709597) bm!34449))

(assert (= (and d!97185 res!473091) b!709598))

(declare-fun m!666887 () Bool)

(assert (=> b!709598 m!666887))

(declare-fun m!666889 () Bool)

(assert (=> b!709598 m!666889))

(declare-fun m!666891 () Bool)

(assert (=> b!709598 m!666891))

(declare-fun m!666893 () Bool)

(assert (=> bm!34449 m!666893))

(declare-fun m!666895 () Bool)

(assert (=> d!97185 m!666895))

(declare-fun m!666897 () Bool)

(assert (=> d!97185 m!666897))

(assert (=> b!709215 d!97185))

(declare-fun d!97201 () Bool)

(assert (=> d!97201 (= (array_inv!15131 a!3591) (bvsge (size!19728 a!3591) #b00000000000000000000000000000000))))

(assert (=> start!62902 d!97201))

(declare-fun d!97203 () Bool)

(declare-fun res!473092 () Bool)

(declare-fun e!399386 () Bool)

(assert (=> d!97203 (=> res!473092 e!399386)))

(assert (=> d!97203 (= res!473092 (= (select (arr!19335 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) k!2824))))

(assert (=> d!97203 (= (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969)) e!399386)))

(declare-fun b!709600 () Bool)

(declare-fun e!399387 () Bool)

(assert (=> b!709600 (= e!399386 e!399387)))

(declare-fun res!473093 () Bool)

(assert (=> b!709600 (=> (not res!473093) (not e!399387))))

(assert (=> b!709600 (= res!473093 (bvslt (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (size!19728 a!3591)))))

(declare-fun b!709601 () Bool)

(assert (=> b!709601 (= e!399387 (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!97203 (not res!473092)) b!709600))

(assert (= (and b!709600 res!473093) b!709601))

(declare-fun m!666899 () Bool)

(assert (=> d!97203 m!666899))

(declare-fun m!666901 () Bool)

(assert (=> b!709601 m!666901))

(assert (=> b!709225 d!97203))

(declare-fun d!97205 () Bool)

(declare-fun lt!318243 () Bool)

(assert (=> d!97205 (= lt!318243 (set.member k!2824 (content!344 lt!318200)))))

(declare-fun e!399389 () Bool)

(assert (=> d!97205 (= lt!318243 e!399389)))

(declare-fun res!473094 () Bool)

(assert (=> d!97205 (=> (not res!473094) (not e!399389))))

(assert (=> d!97205 (= res!473094 (is-Cons!13372 lt!318200))))

(assert (=> d!97205 (= (contains!3953 lt!318200 k!2824) lt!318243)))

(declare-fun b!709602 () Bool)

(declare-fun e!399388 () Bool)

(assert (=> b!709602 (= e!399389 e!399388)))

(declare-fun res!473095 () Bool)

(assert (=> b!709602 (=> res!473095 e!399388)))

(assert (=> b!709602 (= res!473095 (= (h!14417 lt!318200) k!2824))))

(declare-fun b!709603 () Bool)

(assert (=> b!709603 (= e!399388 (contains!3953 (t!19670 lt!318200) k!2824))))

(assert (= (and d!97205 res!473094) b!709602))

(assert (= (and b!709602 (not res!473095)) b!709603))

(assert (=> d!97205 m!666733))

(declare-fun m!666903 () Bool)

(assert (=> d!97205 m!666903))

(declare-fun m!666905 () Bool)

(assert (=> b!709603 m!666905))

(assert (=> b!709214 d!97205))

(declare-fun d!97207 () Bool)

(declare-fun res!473096 () Bool)

(declare-fun e!399390 () Bool)

(assert (=> d!97207 (=> res!473096 e!399390)))

(assert (=> d!97207 (= res!473096 (is-Nil!13373 lt!318200))))

(assert (=> d!97207 (= (noDuplicate!1200 lt!318200) e!399390)))

(declare-fun b!709604 () Bool)

(declare-fun e!399391 () Bool)

(assert (=> b!709604 (= e!399390 e!399391)))

(declare-fun res!473097 () Bool)

(assert (=> b!709604 (=> (not res!473097) (not e!399391))))

(assert (=> b!709604 (= res!473097 (not (contains!3953 (t!19670 lt!318200) (h!14417 lt!318200))))))

(declare-fun b!709605 () Bool)

(assert (=> b!709605 (= e!399391 (noDuplicate!1200 (t!19670 lt!318200)))))

(assert (= (and d!97207 (not res!473096)) b!709604))

(assert (= (and b!709604 res!473097) b!709605))

(declare-fun m!666907 () Bool)

(assert (=> b!709604 m!666907))

(declare-fun m!666909 () Bool)

(assert (=> b!709605 m!666909))

(assert (=> b!709224 d!97207))

(declare-fun d!97209 () Bool)

(declare-fun lt!318244 () Bool)

(assert (=> d!97209 (= lt!318244 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!344 newAcc!49)))))

(declare-fun e!399393 () Bool)

(assert (=> d!97209 (= lt!318244 e!399393)))

(declare-fun res!473098 () Bool)

(assert (=> d!97209 (=> (not res!473098) (not e!399393))))

(assert (=> d!97209 (= res!473098 (is-Cons!13372 newAcc!49))))

(assert (=> d!97209 (= (contains!3953 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318244)))

(declare-fun b!709606 () Bool)

(declare-fun e!399392 () Bool)

(assert (=> b!709606 (= e!399393 e!399392)))

(declare-fun res!473099 () Bool)

(assert (=> b!709606 (=> res!473099 e!399392)))

(assert (=> b!709606 (= res!473099 (= (h!14417 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!709607 () Bool)

(assert (=> b!709607 (= e!399392 (contains!3953 (t!19670 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97209 res!473098) b!709606))

(assert (= (and b!709606 (not res!473099)) b!709607))

(assert (=> d!97209 m!666889))

(declare-fun m!666911 () Bool)

(assert (=> d!97209 m!666911))

(declare-fun m!666913 () Bool)

(assert (=> b!709607 m!666913))

(assert (=> b!709213 d!97209))

(declare-fun d!97211 () Bool)

(declare-fun lt!318245 () Bool)

(assert (=> d!97211 (= lt!318245 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!344 acc!652)))))

(declare-fun e!399395 () Bool)

(assert (=> d!97211 (= lt!318245 e!399395)))

(declare-fun res!473100 () Bool)

(assert (=> d!97211 (=> (not res!473100) (not e!399395))))

(assert (=> d!97211 (= res!473100 (is-Cons!13372 acc!652))))

(assert (=> d!97211 (= (contains!3953 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318245)))

(declare-fun b!709608 () Bool)

(declare-fun e!399394 () Bool)

(assert (=> b!709608 (= e!399395 e!399394)))

(declare-fun res!473101 () Bool)

(assert (=> b!709608 (=> res!473101 e!399394)))

(assert (=> b!709608 (= res!473101 (= (h!14417 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!709609 () Bool)

(assert (=> b!709609 (= e!399394 (contains!3953 (t!19670 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97211 res!473100) b!709608))

(assert (= (and b!709608 (not res!473101)) b!709609))

(assert (=> d!97211 m!666715))

(declare-fun m!666915 () Bool)

(assert (=> d!97211 m!666915))

(declare-fun m!666917 () Bool)

(assert (=> b!709609 m!666917))

(assert (=> b!709223 d!97211))

(declare-fun d!97213 () Bool)

(declare-fun lt!318246 () Bool)

(assert (=> d!97213 (= lt!318246 (set.member k!2824 (content!344 newAcc!49)))))

(declare-fun e!399397 () Bool)

(assert (=> d!97213 (= lt!318246 e!399397)))

(declare-fun res!473102 () Bool)

(assert (=> d!97213 (=> (not res!473102) (not e!399397))))

(assert (=> d!97213 (= res!473102 (is-Cons!13372 newAcc!49))))

(assert (=> d!97213 (= (contains!3953 newAcc!49 k!2824) lt!318246)))

(declare-fun b!709610 () Bool)

(declare-fun e!399396 () Bool)

