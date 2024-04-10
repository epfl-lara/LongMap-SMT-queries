; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62784 () Bool)

(assert start!62784)

(declare-fun b!708411 () Bool)

(declare-fun res!472083 () Bool)

(declare-fun e!398669 () Bool)

(assert (=> b!708411 (=> (not res!472083) (not e!398669))))

(declare-datatypes ((List!13371 0))(
  ( (Nil!13368) (Cons!13367 (h!14412 (_ BitVec 64)) (t!19659 List!13371)) )
))
(declare-fun acc!652 () List!13371)

(declare-fun contains!3948 (List!13371 (_ BitVec 64)) Bool)

(assert (=> b!708411 (= res!472083 (not (contains!3948 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!708412 () Bool)

(declare-fun res!472068 () Bool)

(declare-fun e!398666 () Bool)

(assert (=> b!708412 (=> (not res!472068) (not e!398666))))

(declare-fun lt!318107 () List!13371)

(declare-fun noDuplicate!1195 (List!13371) Bool)

(assert (=> b!708412 (= res!472068 (noDuplicate!1195 lt!318107))))

(declare-fun b!708413 () Bool)

(declare-fun res!472081 () Bool)

(assert (=> b!708413 (=> (not res!472081) (not e!398669))))

(declare-fun k0!2824 () (_ BitVec 64))

(assert (=> b!708413 (= res!472081 (not (contains!3948 acc!652 k0!2824)))))

(declare-fun res!472076 () Bool)

(assert (=> start!62784 (=> (not res!472076) (not e!398669))))

(declare-datatypes ((array!40353 0))(
  ( (array!40354 (arr!19330 (Array (_ BitVec 32) (_ BitVec 64))) (size!19720 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40353)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62784 (= res!472076 (and (bvslt (size!19720 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19720 a!3591))))))

(assert (=> start!62784 e!398669))

(assert (=> start!62784 true))

(declare-fun array_inv!15126 (array!40353) Bool)

(assert (=> start!62784 (array_inv!15126 a!3591)))

(declare-fun b!708414 () Bool)

(declare-fun res!472074 () Bool)

(assert (=> b!708414 (=> (not res!472074) (not e!398666))))

(declare-fun newAcc!49 () List!13371)

(declare-fun $colon$colon!504 (List!13371 (_ BitVec 64)) List!13371)

(assert (=> b!708414 (= res!472074 (noDuplicate!1195 ($colon$colon!504 newAcc!49 (select (arr!19330 a!3591) from!2969))))))

(declare-fun b!708415 () Bool)

(declare-fun res!472073 () Bool)

(assert (=> b!708415 (=> (not res!472073) (not e!398669))))

(declare-fun subseq!393 (List!13371 List!13371) Bool)

(assert (=> b!708415 (= res!472073 (subseq!393 acc!652 newAcc!49))))

(declare-fun b!708416 () Bool)

(declare-fun res!472066 () Bool)

(assert (=> b!708416 (=> (not res!472066) (not e!398669))))

(assert (=> b!708416 (= res!472066 (contains!3948 newAcc!49 k0!2824))))

(declare-fun b!708417 () Bool)

(declare-fun e!398667 () Bool)

(assert (=> b!708417 (= e!398666 e!398667)))

(declare-fun res!472082 () Bool)

(assert (=> b!708417 (=> res!472082 e!398667)))

(assert (=> b!708417 (= res!472082 (contains!3948 lt!318107 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708418 () Bool)

(declare-fun res!472080 () Bool)

(assert (=> b!708418 (=> (not res!472080) (not e!398669))))

(declare-fun arrayNoDuplicates!0 (array!40353 (_ BitVec 32) List!13371) Bool)

(assert (=> b!708418 (= res!472080 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!708419 () Bool)

(declare-fun res!472078 () Bool)

(assert (=> b!708419 (=> (not res!472078) (not e!398669))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!708419 (= res!472078 (validKeyInArray!0 (select (arr!19330 a!3591) from!2969)))))

(declare-fun b!708420 () Bool)

(assert (=> b!708420 (= e!398667 (contains!3948 lt!318107 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708421 () Bool)

(declare-fun res!472072 () Bool)

(assert (=> b!708421 (=> (not res!472072) (not e!398669))))

(assert (=> b!708421 (= res!472072 (not (contains!3948 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!708422 () Bool)

(declare-fun res!472075 () Bool)

(assert (=> b!708422 (=> (not res!472075) (not e!398669))))

(assert (=> b!708422 (= res!472075 (noDuplicate!1195 newAcc!49))))

(declare-fun b!708423 () Bool)

(declare-fun res!472077 () Bool)

(assert (=> b!708423 (=> (not res!472077) (not e!398669))))

(assert (=> b!708423 (= res!472077 (noDuplicate!1195 acc!652))))

(declare-fun b!708424 () Bool)

(declare-fun res!472069 () Bool)

(assert (=> b!708424 (=> (not res!472069) (not e!398669))))

(assert (=> b!708424 (= res!472069 (not (contains!3948 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!708425 () Bool)

(declare-fun res!472065 () Bool)

(assert (=> b!708425 (=> (not res!472065) (not e!398669))))

(assert (=> b!708425 (= res!472065 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19720 a!3591)))))

(declare-fun b!708426 () Bool)

(declare-fun res!472071 () Bool)

(assert (=> b!708426 (=> (not res!472071) (not e!398669))))

(declare-fun arrayContainsKey!0 (array!40353 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!708426 (= res!472071 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!708427 () Bool)

(declare-fun res!472067 () Bool)

(assert (=> b!708427 (=> (not res!472067) (not e!398669))))

(assert (=> b!708427 (= res!472067 (validKeyInArray!0 k0!2824))))

(declare-fun b!708428 () Bool)

(declare-fun res!472084 () Bool)

(assert (=> b!708428 (=> (not res!472084) (not e!398669))))

(assert (=> b!708428 (= res!472084 (not (contains!3948 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!708429 () Bool)

(assert (=> b!708429 (= e!398669 e!398666)))

(declare-fun res!472070 () Bool)

(assert (=> b!708429 (=> (not res!472070) (not e!398666))))

(assert (=> b!708429 (= res!472070 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(assert (=> b!708429 (= lt!318107 ($colon$colon!504 acc!652 (select (arr!19330 a!3591) from!2969)))))

(declare-fun b!708430 () Bool)

(declare-fun res!472079 () Bool)

(assert (=> b!708430 (=> (not res!472079) (not e!398669))))

(declare-fun -!358 (List!13371 (_ BitVec 64)) List!13371)

(assert (=> b!708430 (= res!472079 (= (-!358 newAcc!49 k0!2824) acc!652))))

(assert (= (and start!62784 res!472076) b!708423))

(assert (= (and b!708423 res!472077) b!708422))

(assert (= (and b!708422 res!472075) b!708411))

(assert (= (and b!708411 res!472083) b!708421))

(assert (= (and b!708421 res!472072) b!708426))

(assert (= (and b!708426 res!472071) b!708413))

(assert (= (and b!708413 res!472081) b!708427))

(assert (= (and b!708427 res!472067) b!708418))

(assert (= (and b!708418 res!472080) b!708415))

(assert (= (and b!708415 res!472073) b!708416))

(assert (= (and b!708416 res!472066) b!708430))

(assert (= (and b!708430 res!472079) b!708424))

(assert (= (and b!708424 res!472069) b!708428))

(assert (= (and b!708428 res!472084) b!708425))

(assert (= (and b!708425 res!472065) b!708419))

(assert (= (and b!708419 res!472078) b!708429))

(assert (= (and b!708429 res!472070) b!708412))

(assert (= (and b!708412 res!472068) b!708414))

(assert (= (and b!708414 res!472074) b!708417))

(assert (= (and b!708417 (not res!472082)) b!708420))

(declare-fun m!665859 () Bool)

(assert (=> b!708415 m!665859))

(declare-fun m!665861 () Bool)

(assert (=> b!708426 m!665861))

(declare-fun m!665863 () Bool)

(assert (=> b!708421 m!665863))

(declare-fun m!665865 () Bool)

(assert (=> b!708416 m!665865))

(declare-fun m!665867 () Bool)

(assert (=> b!708413 m!665867))

(declare-fun m!665869 () Bool)

(assert (=> b!708414 m!665869))

(assert (=> b!708414 m!665869))

(declare-fun m!665871 () Bool)

(assert (=> b!708414 m!665871))

(assert (=> b!708414 m!665871))

(declare-fun m!665873 () Bool)

(assert (=> b!708414 m!665873))

(declare-fun m!665875 () Bool)

(assert (=> b!708423 m!665875))

(declare-fun m!665877 () Bool)

(assert (=> b!708422 m!665877))

(declare-fun m!665879 () Bool)

(assert (=> b!708420 m!665879))

(declare-fun m!665881 () Bool)

(assert (=> b!708418 m!665881))

(declare-fun m!665883 () Bool)

(assert (=> start!62784 m!665883))

(declare-fun m!665885 () Bool)

(assert (=> b!708411 m!665885))

(declare-fun m!665887 () Bool)

(assert (=> b!708430 m!665887))

(assert (=> b!708419 m!665869))

(assert (=> b!708419 m!665869))

(declare-fun m!665889 () Bool)

(assert (=> b!708419 m!665889))

(declare-fun m!665891 () Bool)

(assert (=> b!708412 m!665891))

(declare-fun m!665893 () Bool)

(assert (=> b!708417 m!665893))

(declare-fun m!665895 () Bool)

(assert (=> b!708424 m!665895))

(declare-fun m!665897 () Bool)

(assert (=> b!708427 m!665897))

(declare-fun m!665899 () Bool)

(assert (=> b!708428 m!665899))

(assert (=> b!708429 m!665869))

(assert (=> b!708429 m!665869))

(declare-fun m!665901 () Bool)

(assert (=> b!708429 m!665901))

(check-sat (not start!62784) (not b!708417) (not b!708422) (not b!708411) (not b!708412) (not b!708421) (not b!708419) (not b!708429) (not b!708413) (not b!708418) (not b!708430) (not b!708416) (not b!708427) (not b!708426) (not b!708424) (not b!708414) (not b!708420) (not b!708428) (not b!708415) (not b!708423))
(check-sat)
(get-model)

(declare-fun d!96819 () Bool)

(declare-fun lt!318113 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!338 (List!13371) (InoxSet (_ BitVec 64)))

(assert (=> d!96819 (= lt!318113 (select (content!338 acc!652) k0!2824))))

(declare-fun e!398686 () Bool)

(assert (=> d!96819 (= lt!318113 e!398686)))

(declare-fun res!472150 () Bool)

(assert (=> d!96819 (=> (not res!472150) (not e!398686))))

(get-info :version)

(assert (=> d!96819 (= res!472150 ((_ is Cons!13367) acc!652))))

(assert (=> d!96819 (= (contains!3948 acc!652 k0!2824) lt!318113)))

(declare-fun b!708495 () Bool)

(declare-fun e!398687 () Bool)

(assert (=> b!708495 (= e!398686 e!398687)))

(declare-fun res!472149 () Bool)

(assert (=> b!708495 (=> res!472149 e!398687)))

(assert (=> b!708495 (= res!472149 (= (h!14412 acc!652) k0!2824))))

(declare-fun b!708496 () Bool)

(assert (=> b!708496 (= e!398687 (contains!3948 (t!19659 acc!652) k0!2824))))

(assert (= (and d!96819 res!472150) b!708495))

(assert (= (and b!708495 (not res!472149)) b!708496))

(declare-fun m!665947 () Bool)

(assert (=> d!96819 m!665947))

(declare-fun m!665949 () Bool)

(assert (=> d!96819 m!665949))

(declare-fun m!665951 () Bool)

(assert (=> b!708496 m!665951))

(assert (=> b!708413 d!96819))

(declare-fun d!96821 () Bool)

(declare-fun res!472155 () Bool)

(declare-fun e!398692 () Bool)

(assert (=> d!96821 (=> res!472155 e!398692)))

(assert (=> d!96821 (= res!472155 ((_ is Nil!13368) acc!652))))

(assert (=> d!96821 (= (noDuplicate!1195 acc!652) e!398692)))

(declare-fun b!708501 () Bool)

(declare-fun e!398693 () Bool)

(assert (=> b!708501 (= e!398692 e!398693)))

(declare-fun res!472156 () Bool)

(assert (=> b!708501 (=> (not res!472156) (not e!398693))))

(assert (=> b!708501 (= res!472156 (not (contains!3948 (t!19659 acc!652) (h!14412 acc!652))))))

(declare-fun b!708502 () Bool)

(assert (=> b!708502 (= e!398693 (noDuplicate!1195 (t!19659 acc!652)))))

(assert (= (and d!96821 (not res!472155)) b!708501))

(assert (= (and b!708501 res!472156) b!708502))

(declare-fun m!665953 () Bool)

(assert (=> b!708501 m!665953))

(declare-fun m!665955 () Bool)

(assert (=> b!708502 m!665955))

(assert (=> b!708423 d!96821))

(declare-fun d!96823 () Bool)

(assert (=> d!96823 (= (array_inv!15126 a!3591) (bvsge (size!19720 a!3591) #b00000000000000000000000000000000))))

(assert (=> start!62784 d!96823))

(declare-fun d!96825 () Bool)

(declare-fun res!472157 () Bool)

(declare-fun e!398694 () Bool)

(assert (=> d!96825 (=> res!472157 e!398694)))

(assert (=> d!96825 (= res!472157 ((_ is Nil!13368) lt!318107))))

(assert (=> d!96825 (= (noDuplicate!1195 lt!318107) e!398694)))

(declare-fun b!708503 () Bool)

(declare-fun e!398695 () Bool)

(assert (=> b!708503 (= e!398694 e!398695)))

(declare-fun res!472158 () Bool)

(assert (=> b!708503 (=> (not res!472158) (not e!398695))))

(assert (=> b!708503 (= res!472158 (not (contains!3948 (t!19659 lt!318107) (h!14412 lt!318107))))))

(declare-fun b!708504 () Bool)

(assert (=> b!708504 (= e!398695 (noDuplicate!1195 (t!19659 lt!318107)))))

(assert (= (and d!96825 (not res!472157)) b!708503))

(assert (= (and b!708503 res!472158) b!708504))

(declare-fun m!665957 () Bool)

(assert (=> b!708503 m!665957))

(declare-fun m!665959 () Bool)

(assert (=> b!708504 m!665959))

(assert (=> b!708412 d!96825))

(declare-fun d!96827 () Bool)

(declare-fun res!472159 () Bool)

(declare-fun e!398696 () Bool)

(assert (=> d!96827 (=> res!472159 e!398696)))

(assert (=> d!96827 (= res!472159 ((_ is Nil!13368) ($colon$colon!504 newAcc!49 (select (arr!19330 a!3591) from!2969))))))

(assert (=> d!96827 (= (noDuplicate!1195 ($colon$colon!504 newAcc!49 (select (arr!19330 a!3591) from!2969))) e!398696)))

(declare-fun b!708505 () Bool)

(declare-fun e!398697 () Bool)

(assert (=> b!708505 (= e!398696 e!398697)))

(declare-fun res!472160 () Bool)

(assert (=> b!708505 (=> (not res!472160) (not e!398697))))

(assert (=> b!708505 (= res!472160 (not (contains!3948 (t!19659 ($colon$colon!504 newAcc!49 (select (arr!19330 a!3591) from!2969))) (h!14412 ($colon$colon!504 newAcc!49 (select (arr!19330 a!3591) from!2969))))))))

(declare-fun b!708506 () Bool)

(assert (=> b!708506 (= e!398697 (noDuplicate!1195 (t!19659 ($colon$colon!504 newAcc!49 (select (arr!19330 a!3591) from!2969)))))))

(assert (= (and d!96827 (not res!472159)) b!708505))

(assert (= (and b!708505 res!472160) b!708506))

(declare-fun m!665961 () Bool)

(assert (=> b!708505 m!665961))

(declare-fun m!665963 () Bool)

(assert (=> b!708506 m!665963))

(assert (=> b!708414 d!96827))

(declare-fun d!96829 () Bool)

(assert (=> d!96829 (= ($colon$colon!504 newAcc!49 (select (arr!19330 a!3591) from!2969)) (Cons!13367 (select (arr!19330 a!3591) from!2969) newAcc!49))))

(assert (=> b!708414 d!96829))

(declare-fun d!96831 () Bool)

(declare-fun lt!318114 () Bool)

(assert (=> d!96831 (= lt!318114 (select (content!338 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398698 () Bool)

(assert (=> d!96831 (= lt!318114 e!398698)))

(declare-fun res!472162 () Bool)

(assert (=> d!96831 (=> (not res!472162) (not e!398698))))

(assert (=> d!96831 (= res!472162 ((_ is Cons!13367) newAcc!49))))

(assert (=> d!96831 (= (contains!3948 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318114)))

(declare-fun b!708507 () Bool)

(declare-fun e!398699 () Bool)

(assert (=> b!708507 (= e!398698 e!398699)))

(declare-fun res!472161 () Bool)

(assert (=> b!708507 (=> res!472161 e!398699)))

(assert (=> b!708507 (= res!472161 (= (h!14412 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708508 () Bool)

(assert (=> b!708508 (= e!398699 (contains!3948 (t!19659 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96831 res!472162) b!708507))

(assert (= (and b!708507 (not res!472161)) b!708508))

(declare-fun m!665965 () Bool)

(assert (=> d!96831 m!665965))

(declare-fun m!665967 () Bool)

(assert (=> d!96831 m!665967))

(declare-fun m!665969 () Bool)

(assert (=> b!708508 m!665969))

(assert (=> b!708424 d!96831))

(declare-fun d!96833 () Bool)

(declare-fun res!472167 () Bool)

(declare-fun e!398704 () Bool)

(assert (=> d!96833 (=> res!472167 e!398704)))

(assert (=> d!96833 (= res!472167 (= (select (arr!19330 a!3591) from!2969) k0!2824))))

(assert (=> d!96833 (= (arrayContainsKey!0 a!3591 k0!2824 from!2969) e!398704)))

(declare-fun b!708513 () Bool)

(declare-fun e!398705 () Bool)

(assert (=> b!708513 (= e!398704 e!398705)))

(declare-fun res!472168 () Bool)

(assert (=> b!708513 (=> (not res!472168) (not e!398705))))

(assert (=> b!708513 (= res!472168 (bvslt (bvadd from!2969 #b00000000000000000000000000000001) (size!19720 a!3591)))))

(declare-fun b!708514 () Bool)

(assert (=> b!708514 (= e!398705 (arrayContainsKey!0 a!3591 k0!2824 (bvadd from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!96833 (not res!472167)) b!708513))

(assert (= (and b!708513 res!472168) b!708514))

(assert (=> d!96833 m!665869))

(declare-fun m!665971 () Bool)

(assert (=> b!708514 m!665971))

(assert (=> b!708426 d!96833))

(declare-fun d!96835 () Bool)

(declare-fun res!472180 () Bool)

(declare-fun e!398714 () Bool)

(assert (=> d!96835 (=> res!472180 e!398714)))

(assert (=> d!96835 (= res!472180 ((_ is Nil!13368) acc!652))))

(assert (=> d!96835 (= (subseq!393 acc!652 newAcc!49) e!398714)))

(declare-fun b!708524 () Bool)

(declare-fun e!398717 () Bool)

(declare-fun e!398715 () Bool)

(assert (=> b!708524 (= e!398717 e!398715)))

(declare-fun res!472177 () Bool)

(assert (=> b!708524 (=> res!472177 e!398715)))

(declare-fun e!398716 () Bool)

(assert (=> b!708524 (= res!472177 e!398716)))

(declare-fun res!472179 () Bool)

(assert (=> b!708524 (=> (not res!472179) (not e!398716))))

(assert (=> b!708524 (= res!472179 (= (h!14412 acc!652) (h!14412 newAcc!49)))))

(declare-fun b!708523 () Bool)

(assert (=> b!708523 (= e!398714 e!398717)))

(declare-fun res!472178 () Bool)

(assert (=> b!708523 (=> (not res!472178) (not e!398717))))

(assert (=> b!708523 (= res!472178 ((_ is Cons!13367) newAcc!49))))

(declare-fun b!708526 () Bool)

(assert (=> b!708526 (= e!398715 (subseq!393 acc!652 (t!19659 newAcc!49)))))

(declare-fun b!708525 () Bool)

(assert (=> b!708525 (= e!398716 (subseq!393 (t!19659 acc!652) (t!19659 newAcc!49)))))

(assert (= (and d!96835 (not res!472180)) b!708523))

(assert (= (and b!708523 res!472178) b!708524))

(assert (= (and b!708524 res!472179) b!708525))

(assert (= (and b!708524 (not res!472177)) b!708526))

(declare-fun m!665973 () Bool)

(assert (=> b!708526 m!665973))

(declare-fun m!665975 () Bool)

(assert (=> b!708525 m!665975))

(assert (=> b!708415 d!96835))

(declare-fun d!96837 () Bool)

(declare-fun lt!318115 () Bool)

(assert (=> d!96837 (= lt!318115 (select (content!338 lt!318107) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398718 () Bool)

(assert (=> d!96837 (= lt!318115 e!398718)))

(declare-fun res!472182 () Bool)

(assert (=> d!96837 (=> (not res!472182) (not e!398718))))

(assert (=> d!96837 (= res!472182 ((_ is Cons!13367) lt!318107))))

(assert (=> d!96837 (= (contains!3948 lt!318107 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318115)))

(declare-fun b!708527 () Bool)

(declare-fun e!398719 () Bool)

(assert (=> b!708527 (= e!398718 e!398719)))

(declare-fun res!472181 () Bool)

(assert (=> b!708527 (=> res!472181 e!398719)))

(assert (=> b!708527 (= res!472181 (= (h!14412 lt!318107) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708528 () Bool)

(assert (=> b!708528 (= e!398719 (contains!3948 (t!19659 lt!318107) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96837 res!472182) b!708527))

(assert (= (and b!708527 (not res!472181)) b!708528))

(declare-fun m!665977 () Bool)

(assert (=> d!96837 m!665977))

(declare-fun m!665979 () Bool)

(assert (=> d!96837 m!665979))

(declare-fun m!665981 () Bool)

(assert (=> b!708528 m!665981))

(assert (=> b!708417 d!96837))

(declare-fun d!96839 () Bool)

(assert (=> d!96839 (= (validKeyInArray!0 k0!2824) (and (not (= k0!2824 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2824 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!708427 d!96839))

(declare-fun d!96841 () Bool)

(declare-fun lt!318116 () Bool)

(assert (=> d!96841 (= lt!318116 (select (content!338 newAcc!49) k0!2824))))

(declare-fun e!398720 () Bool)

(assert (=> d!96841 (= lt!318116 e!398720)))

(declare-fun res!472184 () Bool)

(assert (=> d!96841 (=> (not res!472184) (not e!398720))))

(assert (=> d!96841 (= res!472184 ((_ is Cons!13367) newAcc!49))))

(assert (=> d!96841 (= (contains!3948 newAcc!49 k0!2824) lt!318116)))

(declare-fun b!708529 () Bool)

(declare-fun e!398721 () Bool)

(assert (=> b!708529 (= e!398720 e!398721)))

(declare-fun res!472183 () Bool)

(assert (=> b!708529 (=> res!472183 e!398721)))

(assert (=> b!708529 (= res!472183 (= (h!14412 newAcc!49) k0!2824))))

(declare-fun b!708530 () Bool)

(assert (=> b!708530 (= e!398721 (contains!3948 (t!19659 newAcc!49) k0!2824))))

(assert (= (and d!96841 res!472184) b!708529))

(assert (= (and b!708529 (not res!472183)) b!708530))

(assert (=> d!96841 m!665965))

(declare-fun m!665983 () Bool)

(assert (=> d!96841 m!665983))

(declare-fun m!665985 () Bool)

(assert (=> b!708530 m!665985))

(assert (=> b!708416 d!96841))

(declare-fun d!96843 () Bool)

(assert (=> d!96843 (= ($colon$colon!504 acc!652 (select (arr!19330 a!3591) from!2969)) (Cons!13367 (select (arr!19330 a!3591) from!2969) acc!652))))

(assert (=> b!708429 d!96843))

(declare-fun call!34401 () Bool)

(declare-fun c!78542 () Bool)

(declare-fun bm!34398 () Bool)

(assert (=> bm!34398 (= call!34401 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78542 (Cons!13367 (select (arr!19330 a!3591) from!2969) acc!652) acc!652)))))

(declare-fun b!708541 () Bool)

(declare-fun e!398732 () Bool)

(assert (=> b!708541 (= e!398732 (contains!3948 acc!652 (select (arr!19330 a!3591) from!2969)))))

(declare-fun b!708542 () Bool)

(declare-fun e!398730 () Bool)

(declare-fun e!398733 () Bool)

(assert (=> b!708542 (= e!398730 e!398733)))

(assert (=> b!708542 (= c!78542 (validKeyInArray!0 (select (arr!19330 a!3591) from!2969)))))

(declare-fun b!708543 () Bool)

(declare-fun e!398731 () Bool)

(assert (=> b!708543 (= e!398731 e!398730)))

(declare-fun res!472191 () Bool)

(assert (=> b!708543 (=> (not res!472191) (not e!398730))))

(assert (=> b!708543 (= res!472191 (not e!398732))))

(declare-fun res!472192 () Bool)

(assert (=> b!708543 (=> (not res!472192) (not e!398732))))

(assert (=> b!708543 (= res!472192 (validKeyInArray!0 (select (arr!19330 a!3591) from!2969)))))

(declare-fun b!708544 () Bool)

(assert (=> b!708544 (= e!398733 call!34401)))

(declare-fun d!96845 () Bool)

(declare-fun res!472193 () Bool)

(assert (=> d!96845 (=> res!472193 e!398731)))

(assert (=> d!96845 (= res!472193 (bvsge from!2969 (size!19720 a!3591)))))

(assert (=> d!96845 (= (arrayNoDuplicates!0 a!3591 from!2969 acc!652) e!398731)))

(declare-fun b!708545 () Bool)

(assert (=> b!708545 (= e!398733 call!34401)))

(assert (= (and d!96845 (not res!472193)) b!708543))

(assert (= (and b!708543 res!472192) b!708541))

(assert (= (and b!708543 res!472191) b!708542))

(assert (= (and b!708542 c!78542) b!708544))

(assert (= (and b!708542 (not c!78542)) b!708545))

(assert (= (or b!708544 b!708545) bm!34398))

(assert (=> bm!34398 m!665869))

(declare-fun m!665987 () Bool)

(assert (=> bm!34398 m!665987))

(assert (=> b!708541 m!665869))

(assert (=> b!708541 m!665869))

(declare-fun m!665989 () Bool)

(assert (=> b!708541 m!665989))

(assert (=> b!708542 m!665869))

(assert (=> b!708542 m!665869))

(assert (=> b!708542 m!665889))

(assert (=> b!708543 m!665869))

(assert (=> b!708543 m!665869))

(assert (=> b!708543 m!665889))

(assert (=> b!708418 d!96845))

(declare-fun d!96847 () Bool)

(declare-fun lt!318117 () Bool)

(assert (=> d!96847 (= lt!318117 (select (content!338 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398734 () Bool)

(assert (=> d!96847 (= lt!318117 e!398734)))

(declare-fun res!472195 () Bool)

(assert (=> d!96847 (=> (not res!472195) (not e!398734))))

(assert (=> d!96847 (= res!472195 ((_ is Cons!13367) newAcc!49))))

(assert (=> d!96847 (= (contains!3948 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318117)))

(declare-fun b!708546 () Bool)

(declare-fun e!398735 () Bool)

(assert (=> b!708546 (= e!398734 e!398735)))

(declare-fun res!472194 () Bool)

(assert (=> b!708546 (=> res!472194 e!398735)))

(assert (=> b!708546 (= res!472194 (= (h!14412 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708547 () Bool)

(assert (=> b!708547 (= e!398735 (contains!3948 (t!19659 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96847 res!472195) b!708546))

(assert (= (and b!708546 (not res!472194)) b!708547))

(assert (=> d!96847 m!665965))

(declare-fun m!665991 () Bool)

(assert (=> d!96847 m!665991))

(declare-fun m!665993 () Bool)

(assert (=> b!708547 m!665993))

(assert (=> b!708428 d!96847))

(declare-fun b!708564 () Bool)

(declare-fun e!398751 () List!13371)

(declare-fun e!398750 () List!13371)

(assert (=> b!708564 (= e!398751 e!398750)))

(declare-fun c!78547 () Bool)

(assert (=> b!708564 (= c!78547 (= k0!2824 (h!14412 newAcc!49)))))

(declare-fun bm!34401 () Bool)

(declare-fun call!34404 () List!13371)

(assert (=> bm!34401 (= call!34404 (-!358 (t!19659 newAcc!49) k0!2824))))

(declare-fun d!96849 () Bool)

(declare-fun e!398749 () Bool)

(assert (=> d!96849 e!398749))

(declare-fun res!472204 () Bool)

(assert (=> d!96849 (=> (not res!472204) (not e!398749))))

(declare-fun lt!318120 () List!13371)

(declare-fun size!19722 (List!13371) Int)

(assert (=> d!96849 (= res!472204 (<= (size!19722 lt!318120) (size!19722 newAcc!49)))))

(assert (=> d!96849 (= lt!318120 e!398751)))

(declare-fun c!78548 () Bool)

(assert (=> d!96849 (= c!78548 ((_ is Cons!13367) newAcc!49))))

(assert (=> d!96849 (= (-!358 newAcc!49 k0!2824) lt!318120)))

(declare-fun b!708565 () Bool)

(assert (=> b!708565 (= e!398750 call!34404)))

(declare-fun b!708566 () Bool)

(assert (=> b!708566 (= e!398751 Nil!13368)))

(declare-fun b!708567 () Bool)

(assert (=> b!708567 (= e!398749 (= (content!338 lt!318120) ((_ map and) (content!338 newAcc!49) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2824 true)))))))

(declare-fun b!708568 () Bool)

(assert (=> b!708568 (= e!398750 (Cons!13367 (h!14412 newAcc!49) call!34404))))

(assert (= (and d!96849 c!78548) b!708564))

(assert (= (and d!96849 (not c!78548)) b!708566))

(assert (= (and b!708564 c!78547) b!708565))

(assert (= (and b!708564 (not c!78547)) b!708568))

(assert (= (or b!708565 b!708568) bm!34401))

(assert (= (and d!96849 res!472204) b!708567))

(declare-fun m!665999 () Bool)

(assert (=> bm!34401 m!665999))

(declare-fun m!666001 () Bool)

(assert (=> d!96849 m!666001))

(declare-fun m!666003 () Bool)

(assert (=> d!96849 m!666003))

(declare-fun m!666005 () Bool)

(assert (=> b!708567 m!666005))

(assert (=> b!708567 m!665965))

(declare-fun m!666007 () Bool)

(assert (=> b!708567 m!666007))

(assert (=> b!708430 d!96849))

(declare-fun d!96857 () Bool)

(assert (=> d!96857 (= (validKeyInArray!0 (select (arr!19330 a!3591) from!2969)) (and (not (= (select (arr!19330 a!3591) from!2969) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19330 a!3591) from!2969) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!708419 d!96857))

(declare-fun d!96859 () Bool)

(declare-fun lt!318121 () Bool)

(assert (=> d!96859 (= lt!318121 (select (content!338 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398752 () Bool)

(assert (=> d!96859 (= lt!318121 e!398752)))

(declare-fun res!472206 () Bool)

(assert (=> d!96859 (=> (not res!472206) (not e!398752))))

(assert (=> d!96859 (= res!472206 ((_ is Cons!13367) acc!652))))

(assert (=> d!96859 (= (contains!3948 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318121)))

(declare-fun b!708569 () Bool)

(declare-fun e!398753 () Bool)

(assert (=> b!708569 (= e!398752 e!398753)))

(declare-fun res!472205 () Bool)

(assert (=> b!708569 (=> res!472205 e!398753)))

(assert (=> b!708569 (= res!472205 (= (h!14412 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708570 () Bool)

(assert (=> b!708570 (= e!398753 (contains!3948 (t!19659 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96859 res!472206) b!708569))

(assert (= (and b!708569 (not res!472205)) b!708570))

(assert (=> d!96859 m!665947))

(declare-fun m!666009 () Bool)

(assert (=> d!96859 m!666009))

(declare-fun m!666011 () Bool)

(assert (=> b!708570 m!666011))

(assert (=> b!708421 d!96859))

(declare-fun d!96863 () Bool)

(declare-fun lt!318122 () Bool)

(assert (=> d!96863 (= lt!318122 (select (content!338 lt!318107) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398754 () Bool)

(assert (=> d!96863 (= lt!318122 e!398754)))

(declare-fun res!472208 () Bool)

(assert (=> d!96863 (=> (not res!472208) (not e!398754))))

(assert (=> d!96863 (= res!472208 ((_ is Cons!13367) lt!318107))))

(assert (=> d!96863 (= (contains!3948 lt!318107 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318122)))

(declare-fun b!708571 () Bool)

(declare-fun e!398755 () Bool)

(assert (=> b!708571 (= e!398754 e!398755)))

(declare-fun res!472207 () Bool)

(assert (=> b!708571 (=> res!472207 e!398755)))

(assert (=> b!708571 (= res!472207 (= (h!14412 lt!318107) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708572 () Bool)

(assert (=> b!708572 (= e!398755 (contains!3948 (t!19659 lt!318107) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96863 res!472208) b!708571))

(assert (= (and b!708571 (not res!472207)) b!708572))

(assert (=> d!96863 m!665977))

(declare-fun m!666013 () Bool)

(assert (=> d!96863 m!666013))

(declare-fun m!666015 () Bool)

(assert (=> b!708572 m!666015))

(assert (=> b!708420 d!96863))

(declare-fun d!96865 () Bool)

(declare-fun res!472209 () Bool)

(declare-fun e!398756 () Bool)

(assert (=> d!96865 (=> res!472209 e!398756)))

(assert (=> d!96865 (= res!472209 ((_ is Nil!13368) newAcc!49))))

(assert (=> d!96865 (= (noDuplicate!1195 newAcc!49) e!398756)))

(declare-fun b!708573 () Bool)

(declare-fun e!398757 () Bool)

(assert (=> b!708573 (= e!398756 e!398757)))

(declare-fun res!472210 () Bool)

(assert (=> b!708573 (=> (not res!472210) (not e!398757))))

(assert (=> b!708573 (= res!472210 (not (contains!3948 (t!19659 newAcc!49) (h!14412 newAcc!49))))))

(declare-fun b!708574 () Bool)

(assert (=> b!708574 (= e!398757 (noDuplicate!1195 (t!19659 newAcc!49)))))

(assert (= (and d!96865 (not res!472209)) b!708573))

(assert (= (and b!708573 res!472210) b!708574))

(declare-fun m!666017 () Bool)

(assert (=> b!708573 m!666017))

(declare-fun m!666019 () Bool)

(assert (=> b!708574 m!666019))

(assert (=> b!708422 d!96865))

(declare-fun d!96867 () Bool)

(declare-fun lt!318123 () Bool)

(assert (=> d!96867 (= lt!318123 (select (content!338 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398758 () Bool)

(assert (=> d!96867 (= lt!318123 e!398758)))

(declare-fun res!472212 () Bool)

(assert (=> d!96867 (=> (not res!472212) (not e!398758))))

(assert (=> d!96867 (= res!472212 ((_ is Cons!13367) acc!652))))

(assert (=> d!96867 (= (contains!3948 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318123)))

(declare-fun b!708575 () Bool)

(declare-fun e!398759 () Bool)

(assert (=> b!708575 (= e!398758 e!398759)))

(declare-fun res!472211 () Bool)

(assert (=> b!708575 (=> res!472211 e!398759)))

(assert (=> b!708575 (= res!472211 (= (h!14412 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708576 () Bool)

(assert (=> b!708576 (= e!398759 (contains!3948 (t!19659 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96867 res!472212) b!708575))

(assert (= (and b!708575 (not res!472211)) b!708576))

(assert (=> d!96867 m!665947))

(declare-fun m!666021 () Bool)

(assert (=> d!96867 m!666021))

(declare-fun m!666023 () Bool)

(assert (=> b!708576 m!666023))

(assert (=> b!708411 d!96867))

(check-sat (not b!708506) (not d!96831) (not b!708547) (not d!96867) (not bm!34401) (not b!708572) (not b!708526) (not d!96863) (not b!708496) (not b!708573) (not d!96847) (not d!96837) (not b!708570) (not b!708530) (not b!708525) (not b!708501) (not b!708567) (not d!96841) (not b!708502) (not d!96819) (not b!708541) (not d!96859) (not b!708542) (not d!96849) (not b!708503) (not b!708528) (not bm!34398) (not b!708543) (not b!708574) (not b!708514) (not b!708505) (not b!708508) (not b!708576) (not b!708504))
(check-sat)
