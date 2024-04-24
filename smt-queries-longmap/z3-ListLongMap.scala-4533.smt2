; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62842 () Bool)

(assert start!62842)

(declare-fun b!708612 () Bool)

(declare-fun res!472151 () Bool)

(declare-fun e!398827 () Bool)

(assert (=> b!708612 (=> (not res!472151) (not e!398827))))

(declare-datatypes ((List!13272 0))(
  ( (Nil!13269) (Cons!13268 (h!14316 (_ BitVec 64)) (t!19552 List!13272)) )
))
(declare-fun acc!652 () List!13272)

(declare-fun newAcc!49 () List!13272)

(declare-fun subseq!392 (List!13272 List!13272) Bool)

(assert (=> b!708612 (= res!472151 (subseq!392 acc!652 newAcc!49))))

(declare-fun b!708613 () Bool)

(declare-fun res!472160 () Bool)

(assert (=> b!708613 (=> (not res!472160) (not e!398827))))

(declare-fun contains!3924 (List!13272 (_ BitVec 64)) Bool)

(assert (=> b!708613 (= res!472160 (not (contains!3924 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!708614 () Bool)

(declare-fun res!472150 () Bool)

(assert (=> b!708614 (=> (not res!472150) (not e!398827))))

(assert (=> b!708614 (= res!472150 (not (contains!3924 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!708615 () Bool)

(declare-fun res!472155 () Bool)

(declare-fun e!398826 () Bool)

(assert (=> b!708615 (=> (not res!472155) (not e!398826))))

(declare-fun lt!318219 () List!13272)

(declare-fun noDuplicate!1198 (List!13272) Bool)

(assert (=> b!708615 (= res!472155 (noDuplicate!1198 lt!318219))))

(declare-fun res!472146 () Bool)

(assert (=> start!62842 (=> (not res!472146) (not e!398827))))

(declare-datatypes ((array!40347 0))(
  ( (array!40348 (arr!19324 (Array (_ BitVec 32) (_ BitVec 64))) (size!19713 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40347)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62842 (= res!472146 (and (bvslt (size!19713 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19713 a!3591))))))

(assert (=> start!62842 e!398827))

(assert (=> start!62842 true))

(declare-fun array_inv!15183 (array!40347) Bool)

(assert (=> start!62842 (array_inv!15183 a!3591)))

(declare-fun b!708616 () Bool)

(declare-fun res!472143 () Bool)

(assert (=> b!708616 (=> (not res!472143) (not e!398827))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!708616 (= res!472143 (validKeyInArray!0 k0!2824))))

(declare-fun b!708617 () Bool)

(declare-fun res!472159 () Bool)

(assert (=> b!708617 (=> (not res!472159) (not e!398827))))

(assert (=> b!708617 (= res!472159 (noDuplicate!1198 acc!652))))

(declare-fun b!708618 () Bool)

(declare-fun res!472162 () Bool)

(assert (=> b!708618 (=> (not res!472162) (not e!398827))))

(assert (=> b!708618 (= res!472162 (not (contains!3924 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!708619 () Bool)

(declare-fun e!398828 () Bool)

(assert (=> b!708619 (= e!398826 e!398828)))

(declare-fun res!472144 () Bool)

(assert (=> b!708619 (=> res!472144 e!398828)))

(assert (=> b!708619 (= res!472144 (contains!3924 lt!318219 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708620 () Bool)

(declare-fun res!472161 () Bool)

(assert (=> b!708620 (=> (not res!472161) (not e!398827))))

(assert (=> b!708620 (= res!472161 (not (contains!3924 acc!652 k0!2824)))))

(declare-fun b!708621 () Bool)

(declare-fun res!472156 () Bool)

(assert (=> b!708621 (=> (not res!472156) (not e!398827))))

(declare-fun arrayNoDuplicates!0 (array!40347 (_ BitVec 32) List!13272) Bool)

(assert (=> b!708621 (= res!472156 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!708622 () Bool)

(declare-fun res!472153 () Bool)

(assert (=> b!708622 (=> (not res!472153) (not e!398827))))

(assert (=> b!708622 (= res!472153 (noDuplicate!1198 newAcc!49))))

(declare-fun b!708623 () Bool)

(declare-fun res!472147 () Bool)

(assert (=> b!708623 (=> (not res!472147) (not e!398827))))

(declare-fun -!356 (List!13272 (_ BitVec 64)) List!13272)

(assert (=> b!708623 (= res!472147 (= (-!356 newAcc!49 k0!2824) acc!652))))

(declare-fun b!708624 () Bool)

(declare-fun res!472148 () Bool)

(assert (=> b!708624 (=> (not res!472148) (not e!398826))))

(declare-fun $colon$colon!500 (List!13272 (_ BitVec 64)) List!13272)

(assert (=> b!708624 (= res!472148 (noDuplicate!1198 ($colon$colon!500 newAcc!49 (select (arr!19324 a!3591) from!2969))))))

(declare-fun b!708625 () Bool)

(declare-fun res!472145 () Bool)

(assert (=> b!708625 (=> (not res!472145) (not e!398827))))

(declare-fun arrayContainsKey!0 (array!40347 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!708625 (= res!472145 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!708626 () Bool)

(assert (=> b!708626 (= e!398827 e!398826)))

(declare-fun res!472154 () Bool)

(assert (=> b!708626 (=> (not res!472154) (not e!398826))))

(assert (=> b!708626 (= res!472154 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(assert (=> b!708626 (= lt!318219 ($colon$colon!500 acc!652 (select (arr!19324 a!3591) from!2969)))))

(declare-fun b!708627 () Bool)

(declare-fun res!472158 () Bool)

(assert (=> b!708627 (=> (not res!472158) (not e!398827))))

(assert (=> b!708627 (= res!472158 (validKeyInArray!0 (select (arr!19324 a!3591) from!2969)))))

(declare-fun b!708628 () Bool)

(assert (=> b!708628 (= e!398828 (contains!3924 lt!318219 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708629 () Bool)

(declare-fun res!472149 () Bool)

(assert (=> b!708629 (=> (not res!472149) (not e!398827))))

(assert (=> b!708629 (= res!472149 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19713 a!3591)))))

(declare-fun b!708630 () Bool)

(declare-fun res!472157 () Bool)

(assert (=> b!708630 (=> (not res!472157) (not e!398827))))

(assert (=> b!708630 (= res!472157 (contains!3924 newAcc!49 k0!2824))))

(declare-fun b!708631 () Bool)

(declare-fun res!472152 () Bool)

(assert (=> b!708631 (=> (not res!472152) (not e!398827))))

(assert (=> b!708631 (= res!472152 (not (contains!3924 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!62842 res!472146) b!708617))

(assert (= (and b!708617 res!472159) b!708622))

(assert (= (and b!708622 res!472153) b!708618))

(assert (= (and b!708618 res!472162) b!708614))

(assert (= (and b!708614 res!472150) b!708625))

(assert (= (and b!708625 res!472145) b!708620))

(assert (= (and b!708620 res!472161) b!708616))

(assert (= (and b!708616 res!472143) b!708621))

(assert (= (and b!708621 res!472156) b!708612))

(assert (= (and b!708612 res!472151) b!708630))

(assert (= (and b!708630 res!472157) b!708623))

(assert (= (and b!708623 res!472147) b!708613))

(assert (= (and b!708613 res!472160) b!708631))

(assert (= (and b!708631 res!472152) b!708629))

(assert (= (and b!708629 res!472149) b!708627))

(assert (= (and b!708627 res!472158) b!708626))

(assert (= (and b!708626 res!472154) b!708615))

(assert (= (and b!708615 res!472155) b!708624))

(assert (= (and b!708624 res!472148) b!708619))

(assert (= (and b!708619 (not res!472144)) b!708628))

(declare-fun m!666573 () Bool)

(assert (=> b!708625 m!666573))

(declare-fun m!666575 () Bool)

(assert (=> b!708617 m!666575))

(declare-fun m!666577 () Bool)

(assert (=> b!708621 m!666577))

(declare-fun m!666579 () Bool)

(assert (=> b!708623 m!666579))

(declare-fun m!666581 () Bool)

(assert (=> b!708614 m!666581))

(declare-fun m!666583 () Bool)

(assert (=> b!708620 m!666583))

(declare-fun m!666585 () Bool)

(assert (=> b!708616 m!666585))

(declare-fun m!666587 () Bool)

(assert (=> b!708615 m!666587))

(declare-fun m!666589 () Bool)

(assert (=> b!708628 m!666589))

(declare-fun m!666591 () Bool)

(assert (=> b!708619 m!666591))

(declare-fun m!666593 () Bool)

(assert (=> b!708627 m!666593))

(assert (=> b!708627 m!666593))

(declare-fun m!666595 () Bool)

(assert (=> b!708627 m!666595))

(declare-fun m!666597 () Bool)

(assert (=> b!708631 m!666597))

(declare-fun m!666599 () Bool)

(assert (=> b!708612 m!666599))

(declare-fun m!666601 () Bool)

(assert (=> b!708618 m!666601))

(declare-fun m!666603 () Bool)

(assert (=> b!708630 m!666603))

(declare-fun m!666605 () Bool)

(assert (=> b!708622 m!666605))

(assert (=> b!708624 m!666593))

(assert (=> b!708624 m!666593))

(declare-fun m!666607 () Bool)

(assert (=> b!708624 m!666607))

(assert (=> b!708624 m!666607))

(declare-fun m!666609 () Bool)

(assert (=> b!708624 m!666609))

(assert (=> b!708626 m!666593))

(assert (=> b!708626 m!666593))

(declare-fun m!666611 () Bool)

(assert (=> b!708626 m!666611))

(declare-fun m!666613 () Bool)

(assert (=> start!62842 m!666613))

(declare-fun m!666615 () Bool)

(assert (=> b!708613 m!666615))

(check-sat (not b!708619) (not b!708618) (not b!708628) (not b!708617) (not b!708623) (not b!708612) (not b!708625) (not b!708631) (not start!62842) (not b!708630) (not b!708614) (not b!708613) (not b!708615) (not b!708622) (not b!708624) (not b!708620) (not b!708621) (not b!708627) (not b!708626) (not b!708616))
(check-sat)
(get-model)

(declare-fun d!96967 () Bool)

(declare-fun lt!318228 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!338 (List!13272) (InoxSet (_ BitVec 64)))

(assert (=> d!96967 (= lt!318228 (select (content!338 lt!318219) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398858 () Bool)

(assert (=> d!96967 (= lt!318228 e!398858)))

(declare-fun res!472288 () Bool)

(assert (=> d!96967 (=> (not res!472288) (not e!398858))))

(get-info :version)

(assert (=> d!96967 (= res!472288 ((_ is Cons!13268) lt!318219))))

(assert (=> d!96967 (= (contains!3924 lt!318219 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318228)))

(declare-fun b!708756 () Bool)

(declare-fun e!398859 () Bool)

(assert (=> b!708756 (= e!398858 e!398859)))

(declare-fun res!472287 () Bool)

(assert (=> b!708756 (=> res!472287 e!398859)))

(assert (=> b!708756 (= res!472287 (= (h!14316 lt!318219) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708757 () Bool)

(assert (=> b!708757 (= e!398859 (contains!3924 (t!19552 lt!318219) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96967 res!472288) b!708756))

(assert (= (and b!708756 (not res!472287)) b!708757))

(declare-fun m!666705 () Bool)

(assert (=> d!96967 m!666705))

(declare-fun m!666707 () Bool)

(assert (=> d!96967 m!666707))

(declare-fun m!666709 () Bool)

(assert (=> b!708757 m!666709))

(assert (=> b!708628 d!96967))

(declare-fun d!96969 () Bool)

(declare-fun res!472293 () Bool)

(declare-fun e!398864 () Bool)

(assert (=> d!96969 (=> res!472293 e!398864)))

(assert (=> d!96969 (= res!472293 ((_ is Nil!13269) acc!652))))

(assert (=> d!96969 (= (noDuplicate!1198 acc!652) e!398864)))

(declare-fun b!708762 () Bool)

(declare-fun e!398865 () Bool)

(assert (=> b!708762 (= e!398864 e!398865)))

(declare-fun res!472294 () Bool)

(assert (=> b!708762 (=> (not res!472294) (not e!398865))))

(assert (=> b!708762 (= res!472294 (not (contains!3924 (t!19552 acc!652) (h!14316 acc!652))))))

(declare-fun b!708763 () Bool)

(assert (=> b!708763 (= e!398865 (noDuplicate!1198 (t!19552 acc!652)))))

(assert (= (and d!96969 (not res!472293)) b!708762))

(assert (= (and b!708762 res!472294) b!708763))

(declare-fun m!666711 () Bool)

(assert (=> b!708762 m!666711))

(declare-fun m!666713 () Bool)

(assert (=> b!708763 m!666713))

(assert (=> b!708617 d!96969))

(declare-fun d!96971 () Bool)

(assert (=> d!96971 (= (validKeyInArray!0 (select (arr!19324 a!3591) from!2969)) (and (not (= (select (arr!19324 a!3591) from!2969) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19324 a!3591) from!2969) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!708627 d!96971))

(declare-fun d!96973 () Bool)

(declare-fun lt!318229 () Bool)

(assert (=> d!96973 (= lt!318229 (select (content!338 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398866 () Bool)

(assert (=> d!96973 (= lt!318229 e!398866)))

(declare-fun res!472296 () Bool)

(assert (=> d!96973 (=> (not res!472296) (not e!398866))))

(assert (=> d!96973 (= res!472296 ((_ is Cons!13268) acc!652))))

(assert (=> d!96973 (= (contains!3924 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318229)))

(declare-fun b!708764 () Bool)

(declare-fun e!398867 () Bool)

(assert (=> b!708764 (= e!398866 e!398867)))

(declare-fun res!472295 () Bool)

(assert (=> b!708764 (=> res!472295 e!398867)))

(assert (=> b!708764 (= res!472295 (= (h!14316 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708765 () Bool)

(assert (=> b!708765 (= e!398867 (contains!3924 (t!19552 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96973 res!472296) b!708764))

(assert (= (and b!708764 (not res!472295)) b!708765))

(declare-fun m!666715 () Bool)

(assert (=> d!96973 m!666715))

(declare-fun m!666717 () Bool)

(assert (=> d!96973 m!666717))

(declare-fun m!666719 () Bool)

(assert (=> b!708765 m!666719))

(assert (=> b!708618 d!96973))

(declare-fun d!96975 () Bool)

(declare-fun lt!318230 () Bool)

(assert (=> d!96975 (= lt!318230 (select (content!338 acc!652) k0!2824))))

(declare-fun e!398868 () Bool)

(assert (=> d!96975 (= lt!318230 e!398868)))

(declare-fun res!472298 () Bool)

(assert (=> d!96975 (=> (not res!472298) (not e!398868))))

(assert (=> d!96975 (= res!472298 ((_ is Cons!13268) acc!652))))

(assert (=> d!96975 (= (contains!3924 acc!652 k0!2824) lt!318230)))

(declare-fun b!708766 () Bool)

(declare-fun e!398869 () Bool)

(assert (=> b!708766 (= e!398868 e!398869)))

(declare-fun res!472297 () Bool)

(assert (=> b!708766 (=> res!472297 e!398869)))

(assert (=> b!708766 (= res!472297 (= (h!14316 acc!652) k0!2824))))

(declare-fun b!708767 () Bool)

(assert (=> b!708767 (= e!398869 (contains!3924 (t!19552 acc!652) k0!2824))))

(assert (= (and d!96975 res!472298) b!708766))

(assert (= (and b!708766 (not res!472297)) b!708767))

(assert (=> d!96975 m!666715))

(declare-fun m!666721 () Bool)

(assert (=> d!96975 m!666721))

(declare-fun m!666723 () Bool)

(assert (=> b!708767 m!666723))

(assert (=> b!708620 d!96975))

(declare-fun d!96977 () Bool)

(declare-fun lt!318231 () Bool)

(assert (=> d!96977 (= lt!318231 (select (content!338 newAcc!49) k0!2824))))

(declare-fun e!398870 () Bool)

(assert (=> d!96977 (= lt!318231 e!398870)))

(declare-fun res!472300 () Bool)

(assert (=> d!96977 (=> (not res!472300) (not e!398870))))

(assert (=> d!96977 (= res!472300 ((_ is Cons!13268) newAcc!49))))

(assert (=> d!96977 (= (contains!3924 newAcc!49 k0!2824) lt!318231)))

(declare-fun b!708768 () Bool)

(declare-fun e!398871 () Bool)

(assert (=> b!708768 (= e!398870 e!398871)))

(declare-fun res!472299 () Bool)

(assert (=> b!708768 (=> res!472299 e!398871)))

(assert (=> b!708768 (= res!472299 (= (h!14316 newAcc!49) k0!2824))))

(declare-fun b!708769 () Bool)

(assert (=> b!708769 (= e!398871 (contains!3924 (t!19552 newAcc!49) k0!2824))))

(assert (= (and d!96977 res!472300) b!708768))

(assert (= (and b!708768 (not res!472299)) b!708769))

(declare-fun m!666725 () Bool)

(assert (=> d!96977 m!666725))

(declare-fun m!666727 () Bool)

(assert (=> d!96977 m!666727))

(declare-fun m!666729 () Bool)

(assert (=> b!708769 m!666729))

(assert (=> b!708630 d!96977))

(declare-fun d!96979 () Bool)

(declare-fun lt!318232 () Bool)

(assert (=> d!96979 (= lt!318232 (select (content!338 lt!318219) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398872 () Bool)

(assert (=> d!96979 (= lt!318232 e!398872)))

(declare-fun res!472302 () Bool)

(assert (=> d!96979 (=> (not res!472302) (not e!398872))))

(assert (=> d!96979 (= res!472302 ((_ is Cons!13268) lt!318219))))

(assert (=> d!96979 (= (contains!3924 lt!318219 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318232)))

(declare-fun b!708770 () Bool)

(declare-fun e!398873 () Bool)

(assert (=> b!708770 (= e!398872 e!398873)))

(declare-fun res!472301 () Bool)

(assert (=> b!708770 (=> res!472301 e!398873)))

(assert (=> b!708770 (= res!472301 (= (h!14316 lt!318219) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708771 () Bool)

(assert (=> b!708771 (= e!398873 (contains!3924 (t!19552 lt!318219) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96979 res!472302) b!708770))

(assert (= (and b!708770 (not res!472301)) b!708771))

(assert (=> d!96979 m!666705))

(declare-fun m!666731 () Bool)

(assert (=> d!96979 m!666731))

(declare-fun m!666733 () Bool)

(assert (=> b!708771 m!666733))

(assert (=> b!708619 d!96979))

(declare-fun bm!34404 () Bool)

(declare-fun call!34407 () Bool)

(declare-fun c!78605 () Bool)

(assert (=> bm!34404 (= call!34407 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78605 (Cons!13268 (select (arr!19324 a!3591) from!2969) acc!652) acc!652)))))

(declare-fun b!708782 () Bool)

(declare-fun e!398885 () Bool)

(assert (=> b!708782 (= e!398885 (contains!3924 acc!652 (select (arr!19324 a!3591) from!2969)))))

(declare-fun d!96981 () Bool)

(declare-fun res!472311 () Bool)

(declare-fun e!398883 () Bool)

(assert (=> d!96981 (=> res!472311 e!398883)))

(assert (=> d!96981 (= res!472311 (bvsge from!2969 (size!19713 a!3591)))))

(assert (=> d!96981 (= (arrayNoDuplicates!0 a!3591 from!2969 acc!652) e!398883)))

(declare-fun b!708783 () Bool)

(declare-fun e!398882 () Bool)

(assert (=> b!708783 (= e!398882 call!34407)))

(declare-fun b!708784 () Bool)

(declare-fun e!398884 () Bool)

(assert (=> b!708784 (= e!398883 e!398884)))

(declare-fun res!472310 () Bool)

(assert (=> b!708784 (=> (not res!472310) (not e!398884))))

(assert (=> b!708784 (= res!472310 (not e!398885))))

(declare-fun res!472309 () Bool)

(assert (=> b!708784 (=> (not res!472309) (not e!398885))))

(assert (=> b!708784 (= res!472309 (validKeyInArray!0 (select (arr!19324 a!3591) from!2969)))))

(declare-fun b!708785 () Bool)

(assert (=> b!708785 (= e!398882 call!34407)))

(declare-fun b!708786 () Bool)

(assert (=> b!708786 (= e!398884 e!398882)))

(assert (=> b!708786 (= c!78605 (validKeyInArray!0 (select (arr!19324 a!3591) from!2969)))))

(assert (= (and d!96981 (not res!472311)) b!708784))

(assert (= (and b!708784 res!472309) b!708782))

(assert (= (and b!708784 res!472310) b!708786))

(assert (= (and b!708786 c!78605) b!708785))

(assert (= (and b!708786 (not c!78605)) b!708783))

(assert (= (or b!708785 b!708783) bm!34404))

(assert (=> bm!34404 m!666593))

(declare-fun m!666735 () Bool)

(assert (=> bm!34404 m!666735))

(assert (=> b!708782 m!666593))

(assert (=> b!708782 m!666593))

(declare-fun m!666737 () Bool)

(assert (=> b!708782 m!666737))

(assert (=> b!708784 m!666593))

(assert (=> b!708784 m!666593))

(assert (=> b!708784 m!666595))

(assert (=> b!708786 m!666593))

(assert (=> b!708786 m!666593))

(assert (=> b!708786 m!666595))

(assert (=> b!708621 d!96981))

(declare-fun d!96987 () Bool)

(declare-fun lt!318233 () Bool)

(assert (=> d!96987 (= lt!318233 (select (content!338 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398886 () Bool)

(assert (=> d!96987 (= lt!318233 e!398886)))

(declare-fun res!472313 () Bool)

(assert (=> d!96987 (=> (not res!472313) (not e!398886))))

(assert (=> d!96987 (= res!472313 ((_ is Cons!13268) newAcc!49))))

(assert (=> d!96987 (= (contains!3924 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318233)))

(declare-fun b!708787 () Bool)

(declare-fun e!398887 () Bool)

(assert (=> b!708787 (= e!398886 e!398887)))

(declare-fun res!472312 () Bool)

(assert (=> b!708787 (=> res!472312 e!398887)))

(assert (=> b!708787 (= res!472312 (= (h!14316 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708788 () Bool)

(assert (=> b!708788 (= e!398887 (contains!3924 (t!19552 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96987 res!472313) b!708787))

(assert (= (and b!708787 (not res!472312)) b!708788))

(assert (=> d!96987 m!666725))

(declare-fun m!666739 () Bool)

(assert (=> d!96987 m!666739))

(declare-fun m!666741 () Bool)

(assert (=> b!708788 m!666741))

(assert (=> b!708631 d!96987))

(declare-fun b!708815 () Bool)

(declare-fun e!398917 () Bool)

(declare-fun e!398914 () Bool)

(assert (=> b!708815 (= e!398917 e!398914)))

(declare-fun res!472342 () Bool)

(assert (=> b!708815 (=> (not res!472342) (not e!398914))))

(assert (=> b!708815 (= res!472342 ((_ is Cons!13268) newAcc!49))))

(declare-fun b!708818 () Bool)

(declare-fun e!398916 () Bool)

(assert (=> b!708818 (= e!398916 (subseq!392 acc!652 (t!19552 newAcc!49)))))

(declare-fun d!96989 () Bool)

(declare-fun res!472341 () Bool)

(assert (=> d!96989 (=> res!472341 e!398917)))

(assert (=> d!96989 (= res!472341 ((_ is Nil!13269) acc!652))))

(assert (=> d!96989 (= (subseq!392 acc!652 newAcc!49) e!398917)))

(declare-fun b!708817 () Bool)

(declare-fun e!398915 () Bool)

(assert (=> b!708817 (= e!398915 (subseq!392 (t!19552 acc!652) (t!19552 newAcc!49)))))

(declare-fun b!708816 () Bool)

(assert (=> b!708816 (= e!398914 e!398916)))

(declare-fun res!472340 () Bool)

(assert (=> b!708816 (=> res!472340 e!398916)))

(assert (=> b!708816 (= res!472340 e!398915)))

(declare-fun res!472343 () Bool)

(assert (=> b!708816 (=> (not res!472343) (not e!398915))))

(assert (=> b!708816 (= res!472343 (= (h!14316 acc!652) (h!14316 newAcc!49)))))

(assert (= (and d!96989 (not res!472341)) b!708815))

(assert (= (and b!708815 res!472342) b!708816))

(assert (= (and b!708816 res!472343) b!708817))

(assert (= (and b!708816 (not res!472340)) b!708818))

(declare-fun m!666755 () Bool)

(assert (=> b!708818 m!666755))

(declare-fun m!666757 () Bool)

(assert (=> b!708817 m!666757))

(assert (=> b!708612 d!96989))

(declare-fun d!97001 () Bool)

(declare-fun res!472344 () Bool)

(declare-fun e!398918 () Bool)

(assert (=> d!97001 (=> res!472344 e!398918)))

(assert (=> d!97001 (= res!472344 ((_ is Nil!13269) newAcc!49))))

(assert (=> d!97001 (= (noDuplicate!1198 newAcc!49) e!398918)))

(declare-fun b!708819 () Bool)

(declare-fun e!398919 () Bool)

(assert (=> b!708819 (= e!398918 e!398919)))

(declare-fun res!472345 () Bool)

(assert (=> b!708819 (=> (not res!472345) (not e!398919))))

(assert (=> b!708819 (= res!472345 (not (contains!3924 (t!19552 newAcc!49) (h!14316 newAcc!49))))))

(declare-fun b!708820 () Bool)

(assert (=> b!708820 (= e!398919 (noDuplicate!1198 (t!19552 newAcc!49)))))

(assert (= (and d!97001 (not res!472344)) b!708819))

(assert (= (and b!708819 res!472345) b!708820))

(declare-fun m!666759 () Bool)

(assert (=> b!708819 m!666759))

(declare-fun m!666761 () Bool)

(assert (=> b!708820 m!666761))

(assert (=> b!708622 d!97001))

(declare-fun d!97003 () Bool)

(declare-fun res!472346 () Bool)

(declare-fun e!398920 () Bool)

(assert (=> d!97003 (=> res!472346 e!398920)))

(assert (=> d!97003 (= res!472346 ((_ is Nil!13269) ($colon$colon!500 newAcc!49 (select (arr!19324 a!3591) from!2969))))))

(assert (=> d!97003 (= (noDuplicate!1198 ($colon$colon!500 newAcc!49 (select (arr!19324 a!3591) from!2969))) e!398920)))

(declare-fun b!708821 () Bool)

(declare-fun e!398921 () Bool)

(assert (=> b!708821 (= e!398920 e!398921)))

(declare-fun res!472347 () Bool)

(assert (=> b!708821 (=> (not res!472347) (not e!398921))))

(assert (=> b!708821 (= res!472347 (not (contains!3924 (t!19552 ($colon$colon!500 newAcc!49 (select (arr!19324 a!3591) from!2969))) (h!14316 ($colon$colon!500 newAcc!49 (select (arr!19324 a!3591) from!2969))))))))

(declare-fun b!708822 () Bool)

(assert (=> b!708822 (= e!398921 (noDuplicate!1198 (t!19552 ($colon$colon!500 newAcc!49 (select (arr!19324 a!3591) from!2969)))))))

(assert (= (and d!97003 (not res!472346)) b!708821))

(assert (= (and b!708821 res!472347) b!708822))

(declare-fun m!666763 () Bool)

(assert (=> b!708821 m!666763))

(declare-fun m!666765 () Bool)

(assert (=> b!708822 m!666765))

(assert (=> b!708624 d!97003))

(declare-fun d!97005 () Bool)

(assert (=> d!97005 (= ($colon$colon!500 newAcc!49 (select (arr!19324 a!3591) from!2969)) (Cons!13268 (select (arr!19324 a!3591) from!2969) newAcc!49))))

(assert (=> b!708624 d!97005))

(declare-fun d!97007 () Bool)

(assert (=> d!97007 (= (array_inv!15183 a!3591) (bvsge (size!19713 a!3591) #b00000000000000000000000000000000))))

(assert (=> start!62842 d!97007))

(declare-fun d!97009 () Bool)

(declare-fun lt!318237 () Bool)

(assert (=> d!97009 (= lt!318237 (select (content!338 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398924 () Bool)

(assert (=> d!97009 (= lt!318237 e!398924)))

(declare-fun res!472351 () Bool)

(assert (=> d!97009 (=> (not res!472351) (not e!398924))))

(assert (=> d!97009 (= res!472351 ((_ is Cons!13268) newAcc!49))))

(assert (=> d!97009 (= (contains!3924 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318237)))

(declare-fun b!708825 () Bool)

(declare-fun e!398925 () Bool)

(assert (=> b!708825 (= e!398924 e!398925)))

(declare-fun res!472350 () Bool)

(assert (=> b!708825 (=> res!472350 e!398925)))

(assert (=> b!708825 (= res!472350 (= (h!14316 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708826 () Bool)

(assert (=> b!708826 (= e!398925 (contains!3924 (t!19552 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97009 res!472351) b!708825))

(assert (= (and b!708825 (not res!472350)) b!708826))

(assert (=> d!97009 m!666725))

(declare-fun m!666767 () Bool)

(assert (=> d!97009 m!666767))

(declare-fun m!666769 () Bool)

(assert (=> b!708826 m!666769))

(assert (=> b!708613 d!97009))

(declare-fun b!708874 () Bool)

(declare-fun lt!318246 () List!13272)

(declare-fun e!398965 () Bool)

(assert (=> b!708874 (= e!398965 (= (content!338 lt!318246) ((_ map and) (content!338 newAcc!49) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2824 true)))))))

(declare-fun b!708875 () Bool)

(declare-fun e!398966 () List!13272)

(assert (=> b!708875 (= e!398966 Nil!13269)))

(declare-fun bm!34410 () Bool)

(declare-fun call!34413 () List!13272)

(assert (=> bm!34410 (= call!34413 (-!356 (t!19552 newAcc!49) k0!2824))))

(declare-fun d!97011 () Bool)

(assert (=> d!97011 e!398965))

(declare-fun res!472379 () Bool)

(assert (=> d!97011 (=> (not res!472379) (not e!398965))))

(declare-fun size!19717 (List!13272) Int)

(assert (=> d!97011 (= res!472379 (<= (size!19717 lt!318246) (size!19717 newAcc!49)))))

(assert (=> d!97011 (= lt!318246 e!398966)))

(declare-fun c!78617 () Bool)

(assert (=> d!97011 (= c!78617 ((_ is Cons!13268) newAcc!49))))

(assert (=> d!97011 (= (-!356 newAcc!49 k0!2824) lt!318246)))

(declare-fun b!708876 () Bool)

(declare-fun e!398967 () List!13272)

(assert (=> b!708876 (= e!398967 call!34413)))

(declare-fun b!708877 () Bool)

(assert (=> b!708877 (= e!398967 (Cons!13268 (h!14316 newAcc!49) call!34413))))

(declare-fun b!708878 () Bool)

(assert (=> b!708878 (= e!398966 e!398967)))

(declare-fun c!78616 () Bool)

(assert (=> b!708878 (= c!78616 (= k0!2824 (h!14316 newAcc!49)))))

(assert (= (and d!97011 c!78617) b!708878))

(assert (= (and d!97011 (not c!78617)) b!708875))

(assert (= (and b!708878 c!78616) b!708876))

(assert (= (and b!708878 (not c!78616)) b!708877))

(assert (= (or b!708876 b!708877) bm!34410))

(assert (= (and d!97011 res!472379) b!708874))

(declare-fun m!666805 () Bool)

(assert (=> b!708874 m!666805))

(assert (=> b!708874 m!666725))

(declare-fun m!666811 () Bool)

(assert (=> b!708874 m!666811))

(declare-fun m!666813 () Bool)

(assert (=> bm!34410 m!666813))

(declare-fun m!666815 () Bool)

(assert (=> d!97011 m!666815))

(declare-fun m!666817 () Bool)

(assert (=> d!97011 m!666817))

(assert (=> b!708623 d!97011))

(declare-fun d!97035 () Bool)

(declare-fun res!472400 () Bool)

(declare-fun e!398988 () Bool)

(assert (=> d!97035 (=> res!472400 e!398988)))

(assert (=> d!97035 (= res!472400 (= (select (arr!19324 a!3591) from!2969) k0!2824))))

(assert (=> d!97035 (= (arrayContainsKey!0 a!3591 k0!2824 from!2969) e!398988)))

(declare-fun b!708899 () Bool)

(declare-fun e!398989 () Bool)

(assert (=> b!708899 (= e!398988 e!398989)))

(declare-fun res!472401 () Bool)

(assert (=> b!708899 (=> (not res!472401) (not e!398989))))

(assert (=> b!708899 (= res!472401 (bvslt (bvadd from!2969 #b00000000000000000000000000000001) (size!19713 a!3591)))))

(declare-fun b!708900 () Bool)

(assert (=> b!708900 (= e!398989 (arrayContainsKey!0 a!3591 k0!2824 (bvadd from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!97035 (not res!472400)) b!708899))

(assert (= (and b!708899 res!472401) b!708900))

(assert (=> d!97035 m!666593))

(declare-fun m!666829 () Bool)

(assert (=> b!708900 m!666829))

(assert (=> b!708625 d!97035))

(declare-fun d!97045 () Bool)

(declare-fun lt!318253 () Bool)

(assert (=> d!97045 (= lt!318253 (select (content!338 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398994 () Bool)

(assert (=> d!97045 (= lt!318253 e!398994)))

(declare-fun res!472407 () Bool)

(assert (=> d!97045 (=> (not res!472407) (not e!398994))))

(assert (=> d!97045 (= res!472407 ((_ is Cons!13268) acc!652))))

(assert (=> d!97045 (= (contains!3924 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318253)))

(declare-fun b!708905 () Bool)

(declare-fun e!398995 () Bool)

(assert (=> b!708905 (= e!398994 e!398995)))

(declare-fun res!472406 () Bool)

(assert (=> b!708905 (=> res!472406 e!398995)))

(assert (=> b!708905 (= res!472406 (= (h!14316 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708906 () Bool)

(assert (=> b!708906 (= e!398995 (contains!3924 (t!19552 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97045 res!472407) b!708905))

(assert (= (and b!708905 (not res!472406)) b!708906))

(assert (=> d!97045 m!666715))

(declare-fun m!666843 () Bool)

(assert (=> d!97045 m!666843))

(declare-fun m!666845 () Bool)

(assert (=> b!708906 m!666845))

(assert (=> b!708614 d!97045))

(declare-fun d!97051 () Bool)

(assert (=> d!97051 (= (validKeyInArray!0 k0!2824) (and (not (= k0!2824 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2824 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!708616 d!97051))

(declare-fun d!97053 () Bool)

(assert (=> d!97053 (= ($colon$colon!500 acc!652 (select (arr!19324 a!3591) from!2969)) (Cons!13268 (select (arr!19324 a!3591) from!2969) acc!652))))

(assert (=> b!708626 d!97053))

(declare-fun d!97055 () Bool)

(declare-fun res!472408 () Bool)

(declare-fun e!398996 () Bool)

(assert (=> d!97055 (=> res!472408 e!398996)))

(assert (=> d!97055 (= res!472408 ((_ is Nil!13269) lt!318219))))

(assert (=> d!97055 (= (noDuplicate!1198 lt!318219) e!398996)))

(declare-fun b!708907 () Bool)

(declare-fun e!398997 () Bool)

(assert (=> b!708907 (= e!398996 e!398997)))

(declare-fun res!472409 () Bool)

(assert (=> b!708907 (=> (not res!472409) (not e!398997))))

(assert (=> b!708907 (= res!472409 (not (contains!3924 (t!19552 lt!318219) (h!14316 lt!318219))))))

(declare-fun b!708908 () Bool)

(assert (=> b!708908 (= e!398997 (noDuplicate!1198 (t!19552 lt!318219)))))

(assert (= (and d!97055 (not res!472408)) b!708907))

(assert (= (and b!708907 res!472409) b!708908))

(declare-fun m!666847 () Bool)

(assert (=> b!708907 m!666847))

(declare-fun m!666849 () Bool)

(assert (=> b!708908 m!666849))

(assert (=> b!708615 d!97055))

(check-sat (not d!97009) (not b!708788) (not b!708826) (not b!708907) (not b!708782) (not d!96967) (not b!708900) (not b!708874) (not bm!34410) (not d!97011) (not b!708771) (not d!97045) (not d!96973) (not b!708765) (not b!708784) (not d!96987) (not b!708820) (not b!708817) (not b!708769) (not b!708762) (not b!708822) (not d!96979) (not b!708818) (not b!708906) (not b!708757) (not b!708908) (not b!708767) (not b!708819) (not bm!34404) (not d!96977) (not d!96975) (not b!708821) (not b!708763) (not b!708786))
(check-sat)
