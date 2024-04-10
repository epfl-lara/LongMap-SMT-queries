; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62716 () Bool)

(assert start!62716)

(declare-fun b!707875 () Bool)

(declare-fun res!471647 () Bool)

(declare-fun e!398323 () Bool)

(assert (=> b!707875 (=> (not res!471647) (not e!398323))))

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> b!707875 (= res!471647 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!707876 () Bool)

(declare-fun res!471643 () Bool)

(assert (=> b!707876 (=> (not res!471643) (not e!398323))))

(declare-datatypes ((List!13368 0))(
  ( (Nil!13365) (Cons!13364 (h!14409 (_ BitVec 64)) (t!19653 List!13368)) )
))
(declare-fun acc!652 () List!13368)

(declare-fun newAcc!49 () List!13368)

(declare-fun subseq!390 (List!13368 List!13368) Bool)

(assert (=> b!707876 (= res!471643 (subseq!390 acc!652 newAcc!49))))

(declare-fun b!707877 () Bool)

(declare-fun res!471632 () Bool)

(assert (=> b!707877 (=> (not res!471632) (not e!398323))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun contains!3945 (List!13368 (_ BitVec 64)) Bool)

(assert (=> b!707877 (= res!471632 (not (contains!3945 acc!652 k0!2824)))))

(declare-fun b!707878 () Bool)

(declare-fun res!471641 () Bool)

(assert (=> b!707878 (=> (not res!471641) (not e!398323))))

(declare-datatypes ((array!40344 0))(
  ( (array!40345 (arr!19327 (Array (_ BitVec 32) (_ BitVec 64))) (size!19714 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40344)

(declare-fun arrayContainsKey!0 (array!40344 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!707878 (= res!471641 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!707879 () Bool)

(declare-fun res!471631 () Bool)

(assert (=> b!707879 (=> (not res!471631) (not e!398323))))

(declare-fun noDuplicate!1192 (List!13368) Bool)

(declare-fun $colon$colon!501 (List!13368 (_ BitVec 64)) List!13368)

(assert (=> b!707879 (= res!471631 (noDuplicate!1192 ($colon$colon!501 acc!652 (select (arr!19327 a!3591) from!2969))))))

(declare-fun b!707880 () Bool)

(declare-fun res!471640 () Bool)

(assert (=> b!707880 (=> (not res!471640) (not e!398323))))

(assert (=> b!707880 (= res!471640 (noDuplicate!1192 acc!652))))

(declare-fun b!707881 () Bool)

(declare-fun res!471646 () Bool)

(assert (=> b!707881 (=> (not res!471646) (not e!398323))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!707881 (= res!471646 (validKeyInArray!0 (select (arr!19327 a!3591) from!2969)))))

(declare-fun b!707882 () Bool)

(declare-fun res!471633 () Bool)

(assert (=> b!707882 (=> (not res!471633) (not e!398323))))

(assert (=> b!707882 (= res!471633 (validKeyInArray!0 k0!2824))))

(declare-fun b!707883 () Bool)

(declare-fun res!471637 () Bool)

(assert (=> b!707883 (=> (not res!471637) (not e!398323))))

(assert (=> b!707883 (= res!471637 (noDuplicate!1192 newAcc!49))))

(declare-fun b!707884 () Bool)

(declare-fun res!471639 () Bool)

(assert (=> b!707884 (=> (not res!471639) (not e!398323))))

(declare-fun arrayNoDuplicates!0 (array!40344 (_ BitVec 32) List!13368) Bool)

(assert (=> b!707884 (= res!471639 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!707885 () Bool)

(declare-fun res!471645 () Bool)

(assert (=> b!707885 (=> (not res!471645) (not e!398323))))

(declare-fun -!355 (List!13368 (_ BitVec 64)) List!13368)

(assert (=> b!707885 (= res!471645 (= (-!355 newAcc!49 k0!2824) acc!652))))

(declare-fun b!707886 () Bool)

(declare-fun res!471638 () Bool)

(assert (=> b!707886 (=> (not res!471638) (not e!398323))))

(assert (=> b!707886 (= res!471638 (not (contains!3945 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707888 () Bool)

(declare-fun res!471636 () Bool)

(assert (=> b!707888 (=> (not res!471636) (not e!398323))))

(assert (=> b!707888 (= res!471636 (not (contains!3945 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!471642 () Bool)

(assert (=> start!62716 (=> (not res!471642) (not e!398323))))

(assert (=> start!62716 (= res!471642 (and (bvslt (size!19714 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19714 a!3591))))))

(assert (=> start!62716 e!398323))

(assert (=> start!62716 true))

(declare-fun array_inv!15123 (array!40344) Bool)

(assert (=> start!62716 (array_inv!15123 a!3591)))

(declare-fun b!707887 () Bool)

(declare-fun res!471634 () Bool)

(assert (=> b!707887 (=> (not res!471634) (not e!398323))))

(assert (=> b!707887 (= res!471634 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19714 a!3591)))))

(declare-fun b!707889 () Bool)

(declare-fun res!471635 () Bool)

(assert (=> b!707889 (=> (not res!471635) (not e!398323))))

(assert (=> b!707889 (= res!471635 (contains!3945 newAcc!49 k0!2824))))

(declare-fun b!707890 () Bool)

(declare-fun res!471644 () Bool)

(assert (=> b!707890 (=> (not res!471644) (not e!398323))))

(assert (=> b!707890 (= res!471644 (not (contains!3945 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707891 () Bool)

(declare-fun res!471648 () Bool)

(assert (=> b!707891 (=> (not res!471648) (not e!398323))))

(assert (=> b!707891 (= res!471648 (not (contains!3945 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707892 () Bool)

(assert (=> b!707892 (= e!398323 (not (noDuplicate!1192 ($colon$colon!501 newAcc!49 (select (arr!19327 a!3591) from!2969)))))))

(assert (= (and start!62716 res!471642) b!707880))

(assert (= (and b!707880 res!471640) b!707883))

(assert (= (and b!707883 res!471637) b!707890))

(assert (= (and b!707890 res!471644) b!707886))

(assert (= (and b!707886 res!471638) b!707878))

(assert (= (and b!707878 res!471641) b!707877))

(assert (= (and b!707877 res!471632) b!707882))

(assert (= (and b!707882 res!471633) b!707884))

(assert (= (and b!707884 res!471639) b!707876))

(assert (= (and b!707876 res!471643) b!707889))

(assert (= (and b!707889 res!471635) b!707885))

(assert (= (and b!707885 res!471645) b!707891))

(assert (= (and b!707891 res!471648) b!707888))

(assert (= (and b!707888 res!471636) b!707887))

(assert (= (and b!707887 res!471634) b!707881))

(assert (= (and b!707881 res!471646) b!707875))

(assert (= (and b!707875 res!471647) b!707879))

(assert (= (and b!707879 res!471631) b!707892))

(declare-fun m!665339 () Bool)

(assert (=> b!707879 m!665339))

(assert (=> b!707879 m!665339))

(declare-fun m!665341 () Bool)

(assert (=> b!707879 m!665341))

(assert (=> b!707879 m!665341))

(declare-fun m!665343 () Bool)

(assert (=> b!707879 m!665343))

(declare-fun m!665345 () Bool)

(assert (=> b!707886 m!665345))

(assert (=> b!707881 m!665339))

(assert (=> b!707881 m!665339))

(declare-fun m!665347 () Bool)

(assert (=> b!707881 m!665347))

(declare-fun m!665349 () Bool)

(assert (=> b!707883 m!665349))

(declare-fun m!665351 () Bool)

(assert (=> b!707888 m!665351))

(declare-fun m!665353 () Bool)

(assert (=> b!707877 m!665353))

(declare-fun m!665355 () Bool)

(assert (=> b!707885 m!665355))

(declare-fun m!665357 () Bool)

(assert (=> start!62716 m!665357))

(declare-fun m!665359 () Bool)

(assert (=> b!707878 m!665359))

(declare-fun m!665361 () Bool)

(assert (=> b!707891 m!665361))

(declare-fun m!665363 () Bool)

(assert (=> b!707876 m!665363))

(declare-fun m!665365 () Bool)

(assert (=> b!707884 m!665365))

(assert (=> b!707892 m!665339))

(assert (=> b!707892 m!665339))

(declare-fun m!665367 () Bool)

(assert (=> b!707892 m!665367))

(assert (=> b!707892 m!665367))

(declare-fun m!665369 () Bool)

(assert (=> b!707892 m!665369))

(declare-fun m!665371 () Bool)

(assert (=> b!707890 m!665371))

(declare-fun m!665373 () Bool)

(assert (=> b!707880 m!665373))

(declare-fun m!665375 () Bool)

(assert (=> b!707882 m!665375))

(declare-fun m!665377 () Bool)

(assert (=> b!707889 m!665377))

(check-sat (not b!707879) (not b!707891) (not b!707888) (not b!707876) (not b!707882) (not b!707880) (not b!707892) (not b!707877) (not b!707884) (not b!707878) (not b!707889) (not b!707883) (not b!707881) (not b!707886) (not b!707890) (not start!62716) (not b!707885))
(check-sat)
(get-model)

(declare-fun d!96603 () Bool)

(declare-fun lt!318039 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!335 (List!13368) (InoxSet (_ BitVec 64)))

(assert (=> d!96603 (= lt!318039 (select (content!335 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398334 () Bool)

(assert (=> d!96603 (= lt!318039 e!398334)))

(declare-fun res!471707 () Bool)

(assert (=> d!96603 (=> (not res!471707) (not e!398334))))

(get-info :version)

(assert (=> d!96603 (= res!471707 ((_ is Cons!13364) newAcc!49))))

(assert (=> d!96603 (= (contains!3945 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318039)))

(declare-fun b!707951 () Bool)

(declare-fun e!398335 () Bool)

(assert (=> b!707951 (= e!398334 e!398335)))

(declare-fun res!471708 () Bool)

(assert (=> b!707951 (=> res!471708 e!398335)))

(assert (=> b!707951 (= res!471708 (= (h!14409 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!707952 () Bool)

(assert (=> b!707952 (= e!398335 (contains!3945 (t!19653 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96603 res!471707) b!707951))

(assert (= (and b!707951 (not res!471708)) b!707952))

(declare-fun m!665419 () Bool)

(assert (=> d!96603 m!665419))

(declare-fun m!665421 () Bool)

(assert (=> d!96603 m!665421))

(declare-fun m!665423 () Bool)

(assert (=> b!707952 m!665423))

(assert (=> b!707888 d!96603))

(declare-fun d!96605 () Bool)

(declare-fun lt!318040 () Bool)

(assert (=> d!96605 (= lt!318040 (select (content!335 newAcc!49) k0!2824))))

(declare-fun e!398336 () Bool)

(assert (=> d!96605 (= lt!318040 e!398336)))

(declare-fun res!471709 () Bool)

(assert (=> d!96605 (=> (not res!471709) (not e!398336))))

(assert (=> d!96605 (= res!471709 ((_ is Cons!13364) newAcc!49))))

(assert (=> d!96605 (= (contains!3945 newAcc!49 k0!2824) lt!318040)))

(declare-fun b!707953 () Bool)

(declare-fun e!398337 () Bool)

(assert (=> b!707953 (= e!398336 e!398337)))

(declare-fun res!471710 () Bool)

(assert (=> b!707953 (=> res!471710 e!398337)))

(assert (=> b!707953 (= res!471710 (= (h!14409 newAcc!49) k0!2824))))

(declare-fun b!707954 () Bool)

(assert (=> b!707954 (= e!398337 (contains!3945 (t!19653 newAcc!49) k0!2824))))

(assert (= (and d!96605 res!471709) b!707953))

(assert (= (and b!707953 (not res!471710)) b!707954))

(assert (=> d!96605 m!665419))

(declare-fun m!665425 () Bool)

(assert (=> d!96605 m!665425))

(declare-fun m!665427 () Bool)

(assert (=> b!707954 m!665427))

(assert (=> b!707889 d!96605))

(declare-fun d!96607 () Bool)

(declare-fun res!471715 () Bool)

(declare-fun e!398342 () Bool)

(assert (=> d!96607 (=> res!471715 e!398342)))

(assert (=> d!96607 (= res!471715 (= (select (arr!19327 a!3591) from!2969) k0!2824))))

(assert (=> d!96607 (= (arrayContainsKey!0 a!3591 k0!2824 from!2969) e!398342)))

(declare-fun b!707959 () Bool)

(declare-fun e!398343 () Bool)

(assert (=> b!707959 (= e!398342 e!398343)))

(declare-fun res!471716 () Bool)

(assert (=> b!707959 (=> (not res!471716) (not e!398343))))

(assert (=> b!707959 (= res!471716 (bvslt (bvadd from!2969 #b00000000000000000000000000000001) (size!19714 a!3591)))))

(declare-fun b!707960 () Bool)

(assert (=> b!707960 (= e!398343 (arrayContainsKey!0 a!3591 k0!2824 (bvadd from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!96607 (not res!471715)) b!707959))

(assert (= (and b!707959 res!471716) b!707960))

(assert (=> d!96607 m!665339))

(declare-fun m!665429 () Bool)

(assert (=> b!707960 m!665429))

(assert (=> b!707878 d!96607))

(declare-fun b!707972 () Bool)

(declare-fun e!398352 () Bool)

(assert (=> b!707972 (= e!398352 (subseq!390 acc!652 (t!19653 newAcc!49)))))

(declare-fun b!707970 () Bool)

(declare-fun e!398353 () Bool)

(assert (=> b!707970 (= e!398353 e!398352)))

(declare-fun res!471726 () Bool)

(assert (=> b!707970 (=> res!471726 e!398352)))

(declare-fun e!398354 () Bool)

(assert (=> b!707970 (= res!471726 e!398354)))

(declare-fun res!471727 () Bool)

(assert (=> b!707970 (=> (not res!471727) (not e!398354))))

(assert (=> b!707970 (= res!471727 (= (h!14409 acc!652) (h!14409 newAcc!49)))))

(declare-fun b!707969 () Bool)

(declare-fun e!398355 () Bool)

(assert (=> b!707969 (= e!398355 e!398353)))

(declare-fun res!471725 () Bool)

(assert (=> b!707969 (=> (not res!471725) (not e!398353))))

(assert (=> b!707969 (= res!471725 ((_ is Cons!13364) newAcc!49))))

(declare-fun d!96609 () Bool)

(declare-fun res!471728 () Bool)

(assert (=> d!96609 (=> res!471728 e!398355)))

(assert (=> d!96609 (= res!471728 ((_ is Nil!13365) acc!652))))

(assert (=> d!96609 (= (subseq!390 acc!652 newAcc!49) e!398355)))

(declare-fun b!707971 () Bool)

(assert (=> b!707971 (= e!398354 (subseq!390 (t!19653 acc!652) (t!19653 newAcc!49)))))

(assert (= (and d!96609 (not res!471728)) b!707969))

(assert (= (and b!707969 res!471725) b!707970))

(assert (= (and b!707970 res!471727) b!707971))

(assert (= (and b!707970 (not res!471726)) b!707972))

(declare-fun m!665431 () Bool)

(assert (=> b!707972 m!665431))

(declare-fun m!665433 () Bool)

(assert (=> b!707971 m!665433))

(assert (=> b!707876 d!96609))

(declare-fun d!96615 () Bool)

(declare-fun lt!318041 () Bool)

(assert (=> d!96615 (= lt!318041 (select (content!335 acc!652) k0!2824))))

(declare-fun e!398356 () Bool)

(assert (=> d!96615 (= lt!318041 e!398356)))

(declare-fun res!471729 () Bool)

(assert (=> d!96615 (=> (not res!471729) (not e!398356))))

(assert (=> d!96615 (= res!471729 ((_ is Cons!13364) acc!652))))

(assert (=> d!96615 (= (contains!3945 acc!652 k0!2824) lt!318041)))

(declare-fun b!707973 () Bool)

(declare-fun e!398357 () Bool)

(assert (=> b!707973 (= e!398356 e!398357)))

(declare-fun res!471730 () Bool)

(assert (=> b!707973 (=> res!471730 e!398357)))

(assert (=> b!707973 (= res!471730 (= (h!14409 acc!652) k0!2824))))

(declare-fun b!707974 () Bool)

(assert (=> b!707974 (= e!398357 (contains!3945 (t!19653 acc!652) k0!2824))))

(assert (= (and d!96615 res!471729) b!707973))

(assert (= (and b!707973 (not res!471730)) b!707974))

(declare-fun m!665435 () Bool)

(assert (=> d!96615 m!665435))

(declare-fun m!665437 () Bool)

(assert (=> d!96615 m!665437))

(declare-fun m!665439 () Bool)

(assert (=> b!707974 m!665439))

(assert (=> b!707877 d!96615))

(declare-fun d!96617 () Bool)

(declare-fun lt!318042 () Bool)

(assert (=> d!96617 (= lt!318042 (select (content!335 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398358 () Bool)

(assert (=> d!96617 (= lt!318042 e!398358)))

(declare-fun res!471731 () Bool)

(assert (=> d!96617 (=> (not res!471731) (not e!398358))))

(assert (=> d!96617 (= res!471731 ((_ is Cons!13364) newAcc!49))))

(assert (=> d!96617 (= (contains!3945 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318042)))

(declare-fun b!707975 () Bool)

(declare-fun e!398359 () Bool)

(assert (=> b!707975 (= e!398358 e!398359)))

(declare-fun res!471732 () Bool)

(assert (=> b!707975 (=> res!471732 e!398359)))

(assert (=> b!707975 (= res!471732 (= (h!14409 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!707976 () Bool)

(assert (=> b!707976 (= e!398359 (contains!3945 (t!19653 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96617 res!471731) b!707975))

(assert (= (and b!707975 (not res!471732)) b!707976))

(assert (=> d!96617 m!665419))

(declare-fun m!665441 () Bool)

(assert (=> d!96617 m!665441))

(declare-fun m!665443 () Bool)

(assert (=> b!707976 m!665443))

(assert (=> b!707891 d!96617))

(declare-fun d!96619 () Bool)

(declare-fun res!471749 () Bool)

(declare-fun e!398379 () Bool)

(assert (=> d!96619 (=> res!471749 e!398379)))

(assert (=> d!96619 (= res!471749 ((_ is Nil!13365) acc!652))))

(assert (=> d!96619 (= (noDuplicate!1192 acc!652) e!398379)))

(declare-fun b!707997 () Bool)

(declare-fun e!398380 () Bool)

(assert (=> b!707997 (= e!398379 e!398380)))

(declare-fun res!471750 () Bool)

(assert (=> b!707997 (=> (not res!471750) (not e!398380))))

(assert (=> b!707997 (= res!471750 (not (contains!3945 (t!19653 acc!652) (h!14409 acc!652))))))

(declare-fun b!707998 () Bool)

(assert (=> b!707998 (= e!398380 (noDuplicate!1192 (t!19653 acc!652)))))

(assert (= (and d!96619 (not res!471749)) b!707997))

(assert (= (and b!707997 res!471750) b!707998))

(declare-fun m!665449 () Bool)

(assert (=> b!707997 m!665449))

(declare-fun m!665451 () Bool)

(assert (=> b!707998 m!665451))

(assert (=> b!707880 d!96619))

(declare-fun d!96623 () Bool)

(assert (=> d!96623 (= (validKeyInArray!0 (select (arr!19327 a!3591) from!2969)) (and (not (= (select (arr!19327 a!3591) from!2969) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19327 a!3591) from!2969) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!707881 d!96623))

(declare-fun d!96625 () Bool)

(declare-fun res!471757 () Bool)

(declare-fun e!398389 () Bool)

(assert (=> d!96625 (=> res!471757 e!398389)))

(assert (=> d!96625 (= res!471757 ((_ is Nil!13365) ($colon$colon!501 acc!652 (select (arr!19327 a!3591) from!2969))))))

(assert (=> d!96625 (= (noDuplicate!1192 ($colon$colon!501 acc!652 (select (arr!19327 a!3591) from!2969))) e!398389)))

(declare-fun b!708009 () Bool)

(declare-fun e!398390 () Bool)

(assert (=> b!708009 (= e!398389 e!398390)))

(declare-fun res!471758 () Bool)

(assert (=> b!708009 (=> (not res!471758) (not e!398390))))

(assert (=> b!708009 (= res!471758 (not (contains!3945 (t!19653 ($colon$colon!501 acc!652 (select (arr!19327 a!3591) from!2969))) (h!14409 ($colon$colon!501 acc!652 (select (arr!19327 a!3591) from!2969))))))))

(declare-fun b!708010 () Bool)

(assert (=> b!708010 (= e!398390 (noDuplicate!1192 (t!19653 ($colon$colon!501 acc!652 (select (arr!19327 a!3591) from!2969)))))))

(assert (= (and d!96625 (not res!471757)) b!708009))

(assert (= (and b!708009 res!471758) b!708010))

(declare-fun m!665453 () Bool)

(assert (=> b!708009 m!665453))

(declare-fun m!665455 () Bool)

(assert (=> b!708010 m!665455))

(assert (=> b!707879 d!96625))

(declare-fun d!96627 () Bool)

(assert (=> d!96627 (= ($colon$colon!501 acc!652 (select (arr!19327 a!3591) from!2969)) (Cons!13364 (select (arr!19327 a!3591) from!2969) acc!652))))

(assert (=> b!707879 d!96627))

(declare-fun d!96629 () Bool)

(declare-fun lt!318045 () Bool)

(assert (=> d!96629 (= lt!318045 (select (content!335 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398393 () Bool)

(assert (=> d!96629 (= lt!318045 e!398393)))

(declare-fun res!471761 () Bool)

(assert (=> d!96629 (=> (not res!471761) (not e!398393))))

(assert (=> d!96629 (= res!471761 ((_ is Cons!13364) acc!652))))

(assert (=> d!96629 (= (contains!3945 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318045)))

(declare-fun b!708013 () Bool)

(declare-fun e!398394 () Bool)

(assert (=> b!708013 (= e!398393 e!398394)))

(declare-fun res!471762 () Bool)

(assert (=> b!708013 (=> res!471762 e!398394)))

(assert (=> b!708013 (= res!471762 (= (h!14409 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708014 () Bool)

(assert (=> b!708014 (= e!398394 (contains!3945 (t!19653 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96629 res!471761) b!708013))

(assert (= (and b!708013 (not res!471762)) b!708014))

(assert (=> d!96629 m!665435))

(declare-fun m!665461 () Bool)

(assert (=> d!96629 m!665461))

(declare-fun m!665463 () Bool)

(assert (=> b!708014 m!665463))

(assert (=> b!707890 d!96629))

(declare-fun d!96633 () Bool)

(declare-fun res!471763 () Bool)

(declare-fun e!398395 () Bool)

(assert (=> d!96633 (=> res!471763 e!398395)))

(assert (=> d!96633 (= res!471763 ((_ is Nil!13365) newAcc!49))))

(assert (=> d!96633 (= (noDuplicate!1192 newAcc!49) e!398395)))

(declare-fun b!708015 () Bool)

(declare-fun e!398396 () Bool)

(assert (=> b!708015 (= e!398395 e!398396)))

(declare-fun res!471764 () Bool)

(assert (=> b!708015 (=> (not res!471764) (not e!398396))))

(assert (=> b!708015 (= res!471764 (not (contains!3945 (t!19653 newAcc!49) (h!14409 newAcc!49))))))

(declare-fun b!708016 () Bool)

(assert (=> b!708016 (= e!398396 (noDuplicate!1192 (t!19653 newAcc!49)))))

(assert (= (and d!96633 (not res!471763)) b!708015))

(assert (= (and b!708015 res!471764) b!708016))

(declare-fun m!665465 () Bool)

(assert (=> b!708015 m!665465))

(declare-fun m!665467 () Bool)

(assert (=> b!708016 m!665467))

(assert (=> b!707883 d!96633))

(declare-fun d!96637 () Bool)

(declare-fun res!471766 () Bool)

(declare-fun e!398400 () Bool)

(assert (=> d!96637 (=> res!471766 e!398400)))

(assert (=> d!96637 (= res!471766 ((_ is Nil!13365) ($colon$colon!501 newAcc!49 (select (arr!19327 a!3591) from!2969))))))

(assert (=> d!96637 (= (noDuplicate!1192 ($colon$colon!501 newAcc!49 (select (arr!19327 a!3591) from!2969))) e!398400)))

(declare-fun b!708022 () Bool)

(declare-fun e!398401 () Bool)

(assert (=> b!708022 (= e!398400 e!398401)))

(declare-fun res!471767 () Bool)

(assert (=> b!708022 (=> (not res!471767) (not e!398401))))

(assert (=> b!708022 (= res!471767 (not (contains!3945 (t!19653 ($colon$colon!501 newAcc!49 (select (arr!19327 a!3591) from!2969))) (h!14409 ($colon$colon!501 newAcc!49 (select (arr!19327 a!3591) from!2969))))))))

(declare-fun b!708023 () Bool)

(assert (=> b!708023 (= e!398401 (noDuplicate!1192 (t!19653 ($colon$colon!501 newAcc!49 (select (arr!19327 a!3591) from!2969)))))))

(assert (= (and d!96637 (not res!471766)) b!708022))

(assert (= (and b!708022 res!471767) b!708023))

(declare-fun m!665469 () Bool)

(assert (=> b!708022 m!665469))

(declare-fun m!665471 () Bool)

(assert (=> b!708023 m!665471))

(assert (=> b!707892 d!96637))

(declare-fun d!96639 () Bool)

(assert (=> d!96639 (= ($colon$colon!501 newAcc!49 (select (arr!19327 a!3591) from!2969)) (Cons!13364 (select (arr!19327 a!3591) from!2969) newAcc!49))))

(assert (=> b!707892 d!96639))

(declare-fun d!96641 () Bool)

(assert (=> d!96641 (= (validKeyInArray!0 k0!2824) (and (not (= k0!2824 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2824 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!707882 d!96641))

(declare-fun d!96643 () Bool)

(declare-fun lt!318047 () Bool)

(assert (=> d!96643 (= lt!318047 (select (content!335 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398402 () Bool)

(assert (=> d!96643 (= lt!318047 e!398402)))

(declare-fun res!471768 () Bool)

(assert (=> d!96643 (=> (not res!471768) (not e!398402))))

(assert (=> d!96643 (= res!471768 ((_ is Cons!13364) acc!652))))

(assert (=> d!96643 (= (contains!3945 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318047)))

(declare-fun b!708024 () Bool)

(declare-fun e!398403 () Bool)

(assert (=> b!708024 (= e!398402 e!398403)))

(declare-fun res!471769 () Bool)

(assert (=> b!708024 (=> res!471769 e!398403)))

(assert (=> b!708024 (= res!471769 (= (h!14409 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708025 () Bool)

(assert (=> b!708025 (= e!398403 (contains!3945 (t!19653 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96643 res!471768) b!708024))

(assert (= (and b!708024 (not res!471769)) b!708025))

(assert (=> d!96643 m!665435))

(declare-fun m!665485 () Bool)

(assert (=> d!96643 m!665485))

(declare-fun m!665487 () Bool)

(assert (=> b!708025 m!665487))

(assert (=> b!707886 d!96643))

(declare-fun e!398437 () Bool)

(declare-fun b!708065 () Bool)

(assert (=> b!708065 (= e!398437 (contains!3945 acc!652 (select (arr!19327 a!3591) from!2969)))))

(declare-fun b!708066 () Bool)

(declare-fun e!398438 () Bool)

(declare-fun e!398439 () Bool)

(assert (=> b!708066 (= e!398438 e!398439)))

(declare-fun c!78503 () Bool)

(assert (=> b!708066 (= c!78503 (validKeyInArray!0 (select (arr!19327 a!3591) from!2969)))))

(declare-fun b!708067 () Bool)

(declare-fun e!398436 () Bool)

(assert (=> b!708067 (= e!398436 e!398438)))

(declare-fun res!471795 () Bool)

(assert (=> b!708067 (=> (not res!471795) (not e!398438))))

(assert (=> b!708067 (= res!471795 (not e!398437))))

(declare-fun res!471794 () Bool)

(assert (=> b!708067 (=> (not res!471794) (not e!398437))))

(assert (=> b!708067 (= res!471794 (validKeyInArray!0 (select (arr!19327 a!3591) from!2969)))))

(declare-fun d!96647 () Bool)

(declare-fun res!471793 () Bool)

(assert (=> d!96647 (=> res!471793 e!398436)))

(assert (=> d!96647 (= res!471793 (bvsge from!2969 (size!19714 a!3591)))))

(assert (=> d!96647 (= (arrayNoDuplicates!0 a!3591 from!2969 acc!652) e!398436)))

(declare-fun b!708068 () Bool)

(declare-fun call!34385 () Bool)

(assert (=> b!708068 (= e!398439 call!34385)))

(declare-fun bm!34382 () Bool)

(assert (=> bm!34382 (= call!34385 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78503 (Cons!13364 (select (arr!19327 a!3591) from!2969) acc!652) acc!652)))))

(declare-fun b!708069 () Bool)

(assert (=> b!708069 (= e!398439 call!34385)))

(assert (= (and d!96647 (not res!471793)) b!708067))

(assert (= (and b!708067 res!471794) b!708065))

(assert (= (and b!708067 res!471795) b!708066))

(assert (= (and b!708066 c!78503) b!708068))

(assert (= (and b!708066 (not c!78503)) b!708069))

(assert (= (or b!708068 b!708069) bm!34382))

(assert (=> b!708065 m!665339))

(assert (=> b!708065 m!665339))

(declare-fun m!665513 () Bool)

(assert (=> b!708065 m!665513))

(assert (=> b!708066 m!665339))

(assert (=> b!708066 m!665339))

(assert (=> b!708066 m!665347))

(assert (=> b!708067 m!665339))

(assert (=> b!708067 m!665339))

(assert (=> b!708067 m!665347))

(assert (=> bm!34382 m!665339))

(declare-fun m!665515 () Bool)

(assert (=> bm!34382 m!665515))

(assert (=> b!707884 d!96647))

(declare-fun b!708115 () Bool)

(declare-fun e!398483 () List!13368)

(declare-fun call!34388 () List!13368)

(assert (=> b!708115 (= e!398483 (Cons!13364 (h!14409 newAcc!49) call!34388))))

(declare-fun e!398482 () Bool)

(declare-fun b!708116 () Bool)

(declare-fun lt!318063 () List!13368)

(assert (=> b!708116 (= e!398482 (= (content!335 lt!318063) ((_ map and) (content!335 newAcc!49) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2824 true)))))))

(declare-fun b!708117 () Bool)

(assert (=> b!708117 (= e!398483 call!34388)))

(declare-fun bm!34385 () Bool)

(assert (=> bm!34385 (= call!34388 (-!355 (t!19653 newAcc!49) k0!2824))))

(declare-fun b!708118 () Bool)

(declare-fun e!398481 () List!13368)

(assert (=> b!708118 (= e!398481 e!398483)))

(declare-fun c!78508 () Bool)

(assert (=> b!708118 (= c!78508 (= k0!2824 (h!14409 newAcc!49)))))

(declare-fun d!96659 () Bool)

(assert (=> d!96659 e!398482))

(declare-fun res!471832 () Bool)

(assert (=> d!96659 (=> (not res!471832) (not e!398482))))

(declare-fun size!19718 (List!13368) Int)

(assert (=> d!96659 (= res!471832 (<= (size!19718 lt!318063) (size!19718 newAcc!49)))))

(assert (=> d!96659 (= lt!318063 e!398481)))

(declare-fun c!78509 () Bool)

(assert (=> d!96659 (= c!78509 ((_ is Cons!13364) newAcc!49))))

(assert (=> d!96659 (= (-!355 newAcc!49 k0!2824) lt!318063)))

(declare-fun b!708114 () Bool)

(assert (=> b!708114 (= e!398481 Nil!13365)))

(assert (= (and d!96659 c!78509) b!708118))

(assert (= (and d!96659 (not c!78509)) b!708114))

(assert (= (and b!708118 c!78508) b!708117))

(assert (= (and b!708118 (not c!78508)) b!708115))

(assert (= (or b!708117 b!708115) bm!34385))

(assert (= (and d!96659 res!471832) b!708116))

(declare-fun m!665559 () Bool)

(assert (=> b!708116 m!665559))

(assert (=> b!708116 m!665419))

(declare-fun m!665561 () Bool)

(assert (=> b!708116 m!665561))

(declare-fun m!665563 () Bool)

(assert (=> bm!34385 m!665563))

(declare-fun m!665565 () Bool)

(assert (=> d!96659 m!665565))

(declare-fun m!665567 () Bool)

(assert (=> d!96659 m!665567))

(assert (=> b!707885 d!96659))

(declare-fun d!96687 () Bool)

(assert (=> d!96687 (= (array_inv!15123 a!3591) (bvsge (size!19714 a!3591) #b00000000000000000000000000000000))))

(assert (=> start!62716 d!96687))

(check-sat (not d!96605) (not b!708014) (not bm!34385) (not d!96629) (not b!707974) (not b!708009) (not b!707954) (not d!96617) (not b!708116) (not d!96659) (not b!707997) (not b!707998) (not b!707960) (not b!708015) (not b!708022) (not b!707976) (not d!96603) (not b!708010) (not b!707971) (not b!708065) (not b!708025) (not b!708067) (not b!708023) (not d!96615) (not b!708066) (not bm!34382) (not b!708016) (not b!707952) (not d!96643) (not b!707972))
(check-sat)
(get-model)

(declare-fun b!708176 () Bool)

(declare-fun e!398536 () List!13368)

(declare-fun call!34395 () List!13368)

(assert (=> b!708176 (= e!398536 (Cons!13364 (h!14409 (t!19653 newAcc!49)) call!34395))))

(declare-fun b!708177 () Bool)

(declare-fun lt!318070 () List!13368)

(declare-fun e!398535 () Bool)

(assert (=> b!708177 (= e!398535 (= (content!335 lt!318070) ((_ map and) (content!335 (t!19653 newAcc!49)) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2824 true)))))))

(declare-fun b!708178 () Bool)

(assert (=> b!708178 (= e!398536 call!34395)))

(declare-fun bm!34392 () Bool)

(assert (=> bm!34392 (= call!34395 (-!355 (t!19653 (t!19653 newAcc!49)) k0!2824))))

(declare-fun b!708179 () Bool)

(declare-fun e!398534 () List!13368)

(assert (=> b!708179 (= e!398534 e!398536)))

(declare-fun c!78516 () Bool)

(assert (=> b!708179 (= c!78516 (= k0!2824 (h!14409 (t!19653 newAcc!49))))))

(declare-fun d!96717 () Bool)

(assert (=> d!96717 e!398535))

(declare-fun res!471877 () Bool)

(assert (=> d!96717 (=> (not res!471877) (not e!398535))))

(assert (=> d!96717 (= res!471877 (<= (size!19718 lt!318070) (size!19718 (t!19653 newAcc!49))))))

(assert (=> d!96717 (= lt!318070 e!398534)))

(declare-fun c!78517 () Bool)

(assert (=> d!96717 (= c!78517 ((_ is Cons!13364) (t!19653 newAcc!49)))))

(assert (=> d!96717 (= (-!355 (t!19653 newAcc!49) k0!2824) lt!318070)))

(declare-fun b!708175 () Bool)

(assert (=> b!708175 (= e!398534 Nil!13365)))

(assert (= (and d!96717 c!78517) b!708179))

(assert (= (and d!96717 (not c!78517)) b!708175))

(assert (= (and b!708179 c!78516) b!708178))

(assert (= (and b!708179 (not c!78516)) b!708176))

(assert (= (or b!708178 b!708176) bm!34392))

(assert (= (and d!96717 res!471877) b!708177))

(declare-fun m!665611 () Bool)

(assert (=> b!708177 m!665611))

(declare-fun m!665613 () Bool)

(assert (=> b!708177 m!665613))

(assert (=> b!708177 m!665561))

(declare-fun m!665615 () Bool)

(assert (=> bm!34392 m!665615))

(declare-fun m!665617 () Bool)

(assert (=> d!96717 m!665617))

(declare-fun m!665619 () Bool)

(assert (=> d!96717 m!665619))

(assert (=> bm!34385 d!96717))

(declare-fun d!96719 () Bool)

(declare-fun c!78520 () Bool)

(assert (=> d!96719 (= c!78520 ((_ is Nil!13365) lt!318063))))

(declare-fun e!398539 () (InoxSet (_ BitVec 64)))

(assert (=> d!96719 (= (content!335 lt!318063) e!398539)))

(declare-fun b!708184 () Bool)

(assert (=> b!708184 (= e!398539 ((as const (Array (_ BitVec 64) Bool)) false))))

(declare-fun b!708185 () Bool)

(assert (=> b!708185 (= e!398539 ((_ map or) (store ((as const (Array (_ BitVec 64) Bool)) false) (h!14409 lt!318063) true) (content!335 (t!19653 lt!318063))))))

(assert (= (and d!96719 c!78520) b!708184))

(assert (= (and d!96719 (not c!78520)) b!708185))

(declare-fun m!665621 () Bool)

(assert (=> b!708185 m!665621))

(declare-fun m!665623 () Bool)

(assert (=> b!708185 m!665623))

(assert (=> b!708116 d!96719))

(declare-fun d!96721 () Bool)

(declare-fun c!78521 () Bool)

(assert (=> d!96721 (= c!78521 ((_ is Nil!13365) newAcc!49))))

(declare-fun e!398540 () (InoxSet (_ BitVec 64)))

(assert (=> d!96721 (= (content!335 newAcc!49) e!398540)))

(declare-fun b!708186 () Bool)

(assert (=> b!708186 (= e!398540 ((as const (Array (_ BitVec 64) Bool)) false))))

(declare-fun b!708187 () Bool)

(assert (=> b!708187 (= e!398540 ((_ map or) (store ((as const (Array (_ BitVec 64) Bool)) false) (h!14409 newAcc!49) true) (content!335 (t!19653 newAcc!49))))))

(assert (= (and d!96721 c!78521) b!708186))

(assert (= (and d!96721 (not c!78521)) b!708187))

(declare-fun m!665625 () Bool)

(assert (=> b!708187 m!665625))

(assert (=> b!708187 m!665613))

(assert (=> b!708116 d!96721))

(declare-fun d!96723 () Bool)

(declare-fun c!78522 () Bool)

(assert (=> d!96723 (= c!78522 ((_ is Nil!13365) acc!652))))

(declare-fun e!398541 () (InoxSet (_ BitVec 64)))

(assert (=> d!96723 (= (content!335 acc!652) e!398541)))

(declare-fun b!708188 () Bool)

(assert (=> b!708188 (= e!398541 ((as const (Array (_ BitVec 64) Bool)) false))))

(declare-fun b!708189 () Bool)

(assert (=> b!708189 (= e!398541 ((_ map or) (store ((as const (Array (_ BitVec 64) Bool)) false) (h!14409 acc!652) true) (content!335 (t!19653 acc!652))))))

(assert (= (and d!96723 c!78522) b!708188))

(assert (= (and d!96723 (not c!78522)) b!708189))

(declare-fun m!665627 () Bool)

(assert (=> b!708189 m!665627))

(declare-fun m!665629 () Bool)

(assert (=> b!708189 m!665629))

(assert (=> d!96615 d!96723))

(assert (=> d!96643 d!96723))

(declare-fun d!96725 () Bool)

(declare-fun lt!318071 () Bool)

(assert (=> d!96725 (= lt!318071 (select (content!335 (t!19653 newAcc!49)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398542 () Bool)

(assert (=> d!96725 (= lt!318071 e!398542)))

(declare-fun res!471878 () Bool)

(assert (=> d!96725 (=> (not res!471878) (not e!398542))))

(assert (=> d!96725 (= res!471878 ((_ is Cons!13364) (t!19653 newAcc!49)))))

(assert (=> d!96725 (= (contains!3945 (t!19653 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000) lt!318071)))

(declare-fun b!708190 () Bool)

(declare-fun e!398543 () Bool)

(assert (=> b!708190 (= e!398542 e!398543)))

(declare-fun res!471879 () Bool)

(assert (=> b!708190 (=> res!471879 e!398543)))

(assert (=> b!708190 (= res!471879 (= (h!14409 (t!19653 newAcc!49)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708191 () Bool)

(assert (=> b!708191 (= e!398543 (contains!3945 (t!19653 (t!19653 newAcc!49)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96725 res!471878) b!708190))

(assert (= (and b!708190 (not res!471879)) b!708191))

(assert (=> d!96725 m!665613))

(declare-fun m!665631 () Bool)

(assert (=> d!96725 m!665631))

(declare-fun m!665633 () Bool)

(assert (=> b!708191 m!665633))

(assert (=> b!707976 d!96725))

(declare-fun d!96727 () Bool)

(declare-fun lt!318072 () Bool)

(assert (=> d!96727 (= lt!318072 (select (content!335 (t!19653 ($colon$colon!501 newAcc!49 (select (arr!19327 a!3591) from!2969)))) (h!14409 ($colon$colon!501 newAcc!49 (select (arr!19327 a!3591) from!2969)))))))

(declare-fun e!398544 () Bool)

(assert (=> d!96727 (= lt!318072 e!398544)))

(declare-fun res!471880 () Bool)

(assert (=> d!96727 (=> (not res!471880) (not e!398544))))

(assert (=> d!96727 (= res!471880 ((_ is Cons!13364) (t!19653 ($colon$colon!501 newAcc!49 (select (arr!19327 a!3591) from!2969)))))))

(assert (=> d!96727 (= (contains!3945 (t!19653 ($colon$colon!501 newAcc!49 (select (arr!19327 a!3591) from!2969))) (h!14409 ($colon$colon!501 newAcc!49 (select (arr!19327 a!3591) from!2969)))) lt!318072)))

(declare-fun b!708192 () Bool)

(declare-fun e!398545 () Bool)

(assert (=> b!708192 (= e!398544 e!398545)))

(declare-fun res!471881 () Bool)

(assert (=> b!708192 (=> res!471881 e!398545)))

(assert (=> b!708192 (= res!471881 (= (h!14409 (t!19653 ($colon$colon!501 newAcc!49 (select (arr!19327 a!3591) from!2969)))) (h!14409 ($colon$colon!501 newAcc!49 (select (arr!19327 a!3591) from!2969)))))))

(declare-fun b!708193 () Bool)

(assert (=> b!708193 (= e!398545 (contains!3945 (t!19653 (t!19653 ($colon$colon!501 newAcc!49 (select (arr!19327 a!3591) from!2969)))) (h!14409 ($colon$colon!501 newAcc!49 (select (arr!19327 a!3591) from!2969)))))))

(assert (= (and d!96727 res!471880) b!708192))

(assert (= (and b!708192 (not res!471881)) b!708193))

(declare-fun m!665635 () Bool)

(assert (=> d!96727 m!665635))

(declare-fun m!665637 () Bool)

(assert (=> d!96727 m!665637))

(declare-fun m!665639 () Bool)

(assert (=> b!708193 m!665639))

(assert (=> b!708022 d!96727))

(declare-fun d!96729 () Bool)

(declare-fun lt!318075 () Int)

(assert (=> d!96729 (>= lt!318075 0)))

(declare-fun e!398548 () Int)

(assert (=> d!96729 (= lt!318075 e!398548)))

(declare-fun c!78525 () Bool)

(assert (=> d!96729 (= c!78525 ((_ is Nil!13365) lt!318063))))

(assert (=> d!96729 (= (size!19718 lt!318063) lt!318075)))

(declare-fun b!708198 () Bool)

(assert (=> b!708198 (= e!398548 0)))

(declare-fun b!708199 () Bool)

(assert (=> b!708199 (= e!398548 (+ 1 (size!19718 (t!19653 lt!318063))))))

(assert (= (and d!96729 c!78525) b!708198))

(assert (= (and d!96729 (not c!78525)) b!708199))

(declare-fun m!665641 () Bool)

(assert (=> b!708199 m!665641))

(assert (=> d!96659 d!96729))

(declare-fun d!96731 () Bool)

(declare-fun lt!318076 () Int)

(assert (=> d!96731 (>= lt!318076 0)))

(declare-fun e!398549 () Int)

(assert (=> d!96731 (= lt!318076 e!398549)))

(declare-fun c!78526 () Bool)

(assert (=> d!96731 (= c!78526 ((_ is Nil!13365) newAcc!49))))

(assert (=> d!96731 (= (size!19718 newAcc!49) lt!318076)))

(declare-fun b!708200 () Bool)

(assert (=> b!708200 (= e!398549 0)))

(declare-fun b!708201 () Bool)

(assert (=> b!708201 (= e!398549 (+ 1 (size!19718 (t!19653 newAcc!49))))))

(assert (= (and d!96731 c!78526) b!708200))

(assert (= (and d!96731 (not c!78526)) b!708201))

(assert (=> b!708201 m!665619))

(assert (=> d!96659 d!96731))

(declare-fun d!96733 () Bool)

(declare-fun res!471882 () Bool)

(declare-fun e!398550 () Bool)

(assert (=> d!96733 (=> res!471882 e!398550)))

(assert (=> d!96733 (= res!471882 ((_ is Nil!13365) (t!19653 ($colon$colon!501 newAcc!49 (select (arr!19327 a!3591) from!2969)))))))

(assert (=> d!96733 (= (noDuplicate!1192 (t!19653 ($colon$colon!501 newAcc!49 (select (arr!19327 a!3591) from!2969)))) e!398550)))

(declare-fun b!708202 () Bool)

(declare-fun e!398551 () Bool)

(assert (=> b!708202 (= e!398550 e!398551)))

(declare-fun res!471883 () Bool)

(assert (=> b!708202 (=> (not res!471883) (not e!398551))))

(assert (=> b!708202 (= res!471883 (not (contains!3945 (t!19653 (t!19653 ($colon$colon!501 newAcc!49 (select (arr!19327 a!3591) from!2969)))) (h!14409 (t!19653 ($colon$colon!501 newAcc!49 (select (arr!19327 a!3591) from!2969)))))))))

(declare-fun b!708203 () Bool)

(assert (=> b!708203 (= e!398551 (noDuplicate!1192 (t!19653 (t!19653 ($colon$colon!501 newAcc!49 (select (arr!19327 a!3591) from!2969))))))))

(assert (= (and d!96733 (not res!471882)) b!708202))

(assert (= (and b!708202 res!471883) b!708203))

(declare-fun m!665643 () Bool)

(assert (=> b!708202 m!665643))

(declare-fun m!665645 () Bool)

(assert (=> b!708203 m!665645))

(assert (=> b!708023 d!96733))

(declare-fun d!96735 () Bool)

(declare-fun lt!318077 () Bool)

(assert (=> d!96735 (= lt!318077 (select (content!335 (t!19653 newAcc!49)) (h!14409 newAcc!49)))))

(declare-fun e!398552 () Bool)

(assert (=> d!96735 (= lt!318077 e!398552)))

(declare-fun res!471884 () Bool)

(assert (=> d!96735 (=> (not res!471884) (not e!398552))))

(assert (=> d!96735 (= res!471884 ((_ is Cons!13364) (t!19653 newAcc!49)))))

(assert (=> d!96735 (= (contains!3945 (t!19653 newAcc!49) (h!14409 newAcc!49)) lt!318077)))

(declare-fun b!708204 () Bool)

(declare-fun e!398553 () Bool)

(assert (=> b!708204 (= e!398552 e!398553)))

(declare-fun res!471885 () Bool)

(assert (=> b!708204 (=> res!471885 e!398553)))

(assert (=> b!708204 (= res!471885 (= (h!14409 (t!19653 newAcc!49)) (h!14409 newAcc!49)))))

(declare-fun b!708205 () Bool)

(assert (=> b!708205 (= e!398553 (contains!3945 (t!19653 (t!19653 newAcc!49)) (h!14409 newAcc!49)))))

(assert (= (and d!96735 res!471884) b!708204))

(assert (= (and b!708204 (not res!471885)) b!708205))

(assert (=> d!96735 m!665613))

(declare-fun m!665647 () Bool)

(assert (=> d!96735 m!665647))

(declare-fun m!665649 () Bool)

(assert (=> b!708205 m!665649))

(assert (=> b!708015 d!96735))

(declare-fun d!96737 () Bool)

(declare-fun res!471886 () Bool)

(declare-fun e!398554 () Bool)

(assert (=> d!96737 (=> res!471886 e!398554)))

(assert (=> d!96737 (= res!471886 ((_ is Nil!13365) (t!19653 newAcc!49)))))

(assert (=> d!96737 (= (noDuplicate!1192 (t!19653 newAcc!49)) e!398554)))

(declare-fun b!708206 () Bool)

(declare-fun e!398555 () Bool)

(assert (=> b!708206 (= e!398554 e!398555)))

(declare-fun res!471887 () Bool)

(assert (=> b!708206 (=> (not res!471887) (not e!398555))))

(assert (=> b!708206 (= res!471887 (not (contains!3945 (t!19653 (t!19653 newAcc!49)) (h!14409 (t!19653 newAcc!49)))))))

(declare-fun b!708207 () Bool)

(assert (=> b!708207 (= e!398555 (noDuplicate!1192 (t!19653 (t!19653 newAcc!49))))))

(assert (= (and d!96737 (not res!471886)) b!708206))

(assert (= (and b!708206 res!471887) b!708207))

(declare-fun m!665651 () Bool)

(assert (=> b!708206 m!665651))

(declare-fun m!665653 () Bool)

(assert (=> b!708207 m!665653))

(assert (=> b!708016 d!96737))

(assert (=> d!96605 d!96721))

(declare-fun b!708211 () Bool)

(declare-fun e!398556 () Bool)

(assert (=> b!708211 (= e!398556 (subseq!390 (t!19653 acc!652) (t!19653 (t!19653 newAcc!49))))))

(declare-fun b!708209 () Bool)

(declare-fun e!398557 () Bool)

(assert (=> b!708209 (= e!398557 e!398556)))

(declare-fun res!471889 () Bool)

(assert (=> b!708209 (=> res!471889 e!398556)))

(declare-fun e!398558 () Bool)

(assert (=> b!708209 (= res!471889 e!398558)))

(declare-fun res!471890 () Bool)

(assert (=> b!708209 (=> (not res!471890) (not e!398558))))

(assert (=> b!708209 (= res!471890 (= (h!14409 (t!19653 acc!652)) (h!14409 (t!19653 newAcc!49))))))

(declare-fun b!708208 () Bool)

(declare-fun e!398559 () Bool)

(assert (=> b!708208 (= e!398559 e!398557)))

(declare-fun res!471888 () Bool)

(assert (=> b!708208 (=> (not res!471888) (not e!398557))))

(assert (=> b!708208 (= res!471888 ((_ is Cons!13364) (t!19653 newAcc!49)))))

(declare-fun d!96739 () Bool)

(declare-fun res!471891 () Bool)

(assert (=> d!96739 (=> res!471891 e!398559)))

(assert (=> d!96739 (= res!471891 ((_ is Nil!13365) (t!19653 acc!652)))))

(assert (=> d!96739 (= (subseq!390 (t!19653 acc!652) (t!19653 newAcc!49)) e!398559)))

(declare-fun b!708210 () Bool)

(assert (=> b!708210 (= e!398558 (subseq!390 (t!19653 (t!19653 acc!652)) (t!19653 (t!19653 newAcc!49))))))

(assert (= (and d!96739 (not res!471891)) b!708208))

(assert (= (and b!708208 res!471888) b!708209))

(assert (= (and b!708209 res!471890) b!708210))

(assert (= (and b!708209 (not res!471889)) b!708211))

(declare-fun m!665655 () Bool)

(assert (=> b!708211 m!665655))

(declare-fun m!665657 () Bool)

(assert (=> b!708210 m!665657))

(assert (=> b!707971 d!96739))

(declare-fun d!96741 () Bool)

(declare-fun lt!318078 () Bool)

(assert (=> d!96741 (= lt!318078 (select (content!335 (t!19653 acc!652)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398560 () Bool)

(assert (=> d!96741 (= lt!318078 e!398560)))

(declare-fun res!471892 () Bool)

(assert (=> d!96741 (=> (not res!471892) (not e!398560))))

(assert (=> d!96741 (= res!471892 ((_ is Cons!13364) (t!19653 acc!652)))))

(assert (=> d!96741 (= (contains!3945 (t!19653 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000) lt!318078)))

(declare-fun b!708212 () Bool)

(declare-fun e!398561 () Bool)

(assert (=> b!708212 (= e!398560 e!398561)))

(declare-fun res!471893 () Bool)

(assert (=> b!708212 (=> res!471893 e!398561)))

(assert (=> b!708212 (= res!471893 (= (h!14409 (t!19653 acc!652)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708213 () Bool)

(assert (=> b!708213 (= e!398561 (contains!3945 (t!19653 (t!19653 acc!652)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96741 res!471892) b!708212))

(assert (= (and b!708212 (not res!471893)) b!708213))

(assert (=> d!96741 m!665629))

(declare-fun m!665659 () Bool)

(assert (=> d!96741 m!665659))

(declare-fun m!665661 () Bool)

(assert (=> b!708213 m!665661))

(assert (=> b!708014 d!96741))

(declare-fun b!708217 () Bool)

(declare-fun e!398562 () Bool)

(assert (=> b!708217 (= e!398562 (subseq!390 acc!652 (t!19653 (t!19653 newAcc!49))))))

(declare-fun b!708215 () Bool)

(declare-fun e!398563 () Bool)

(assert (=> b!708215 (= e!398563 e!398562)))

(declare-fun res!471895 () Bool)

(assert (=> b!708215 (=> res!471895 e!398562)))

(declare-fun e!398564 () Bool)

(assert (=> b!708215 (= res!471895 e!398564)))

(declare-fun res!471896 () Bool)

(assert (=> b!708215 (=> (not res!471896) (not e!398564))))

(assert (=> b!708215 (= res!471896 (= (h!14409 acc!652) (h!14409 (t!19653 newAcc!49))))))

(declare-fun b!708214 () Bool)

(declare-fun e!398565 () Bool)

(assert (=> b!708214 (= e!398565 e!398563)))

(declare-fun res!471894 () Bool)

(assert (=> b!708214 (=> (not res!471894) (not e!398563))))

(assert (=> b!708214 (= res!471894 ((_ is Cons!13364) (t!19653 newAcc!49)))))

(declare-fun d!96743 () Bool)

(declare-fun res!471897 () Bool)

(assert (=> d!96743 (=> res!471897 e!398565)))

(assert (=> d!96743 (= res!471897 ((_ is Nil!13365) acc!652))))

(assert (=> d!96743 (= (subseq!390 acc!652 (t!19653 newAcc!49)) e!398565)))

(declare-fun b!708216 () Bool)

(assert (=> b!708216 (= e!398564 (subseq!390 (t!19653 acc!652) (t!19653 (t!19653 newAcc!49))))))

(assert (= (and d!96743 (not res!471897)) b!708214))

(assert (= (and b!708214 res!471894) b!708215))

(assert (= (and b!708215 res!471896) b!708216))

(assert (= (and b!708215 (not res!471895)) b!708217))

(declare-fun m!665663 () Bool)

(assert (=> b!708217 m!665663))

(assert (=> b!708216 m!665655))

(assert (=> b!707972 d!96743))

(assert (=> d!96617 d!96721))

(declare-fun e!398567 () Bool)

(declare-fun b!708218 () Bool)

(assert (=> b!708218 (= e!398567 (contains!3945 (ite c!78503 (Cons!13364 (select (arr!19327 a!3591) from!2969) acc!652) acc!652) (select (arr!19327 a!3591) (bvadd from!2969 #b00000000000000000000000000000001))))))

(declare-fun b!708219 () Bool)

(declare-fun e!398568 () Bool)

(declare-fun e!398569 () Bool)

(assert (=> b!708219 (= e!398568 e!398569)))

(declare-fun c!78527 () Bool)

(assert (=> b!708219 (= c!78527 (validKeyInArray!0 (select (arr!19327 a!3591) (bvadd from!2969 #b00000000000000000000000000000001))))))

(declare-fun b!708220 () Bool)

(declare-fun e!398566 () Bool)

(assert (=> b!708220 (= e!398566 e!398568)))

(declare-fun res!471900 () Bool)

(assert (=> b!708220 (=> (not res!471900) (not e!398568))))

(assert (=> b!708220 (= res!471900 (not e!398567))))

(declare-fun res!471899 () Bool)

(assert (=> b!708220 (=> (not res!471899) (not e!398567))))

(assert (=> b!708220 (= res!471899 (validKeyInArray!0 (select (arr!19327 a!3591) (bvadd from!2969 #b00000000000000000000000000000001))))))

(declare-fun d!96745 () Bool)

(declare-fun res!471898 () Bool)

(assert (=> d!96745 (=> res!471898 e!398566)))

(assert (=> d!96745 (= res!471898 (bvsge (bvadd from!2969 #b00000000000000000000000000000001) (size!19714 a!3591)))))

(assert (=> d!96745 (= (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78503 (Cons!13364 (select (arr!19327 a!3591) from!2969) acc!652) acc!652)) e!398566)))

(declare-fun b!708221 () Bool)

(declare-fun call!34396 () Bool)

(assert (=> b!708221 (= e!398569 call!34396)))

(declare-fun bm!34393 () Bool)

(assert (=> bm!34393 (= call!34396 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!78527 (Cons!13364 (select (arr!19327 a!3591) (bvadd from!2969 #b00000000000000000000000000000001)) (ite c!78503 (Cons!13364 (select (arr!19327 a!3591) from!2969) acc!652) acc!652)) (ite c!78503 (Cons!13364 (select (arr!19327 a!3591) from!2969) acc!652) acc!652))))))

(declare-fun b!708222 () Bool)

(assert (=> b!708222 (= e!398569 call!34396)))

(assert (= (and d!96745 (not res!471898)) b!708220))

(assert (= (and b!708220 res!471899) b!708218))

(assert (= (and b!708220 res!471900) b!708219))

(assert (= (and b!708219 c!78527) b!708221))

(assert (= (and b!708219 (not c!78527)) b!708222))

(assert (= (or b!708221 b!708222) bm!34393))

(declare-fun m!665665 () Bool)

(assert (=> b!708218 m!665665))

(assert (=> b!708218 m!665665))

(declare-fun m!665667 () Bool)

(assert (=> b!708218 m!665667))

(assert (=> b!708219 m!665665))

(assert (=> b!708219 m!665665))

(declare-fun m!665669 () Bool)

(assert (=> b!708219 m!665669))

(assert (=> b!708220 m!665665))

(assert (=> b!708220 m!665665))

(assert (=> b!708220 m!665669))

(assert (=> bm!34393 m!665665))

(declare-fun m!665671 () Bool)

(assert (=> bm!34393 m!665671))

(assert (=> bm!34382 d!96745))

(declare-fun d!96747 () Bool)

(declare-fun lt!318079 () Bool)

(assert (=> d!96747 (= lt!318079 (select (content!335 (t!19653 ($colon$colon!501 acc!652 (select (arr!19327 a!3591) from!2969)))) (h!14409 ($colon$colon!501 acc!652 (select (arr!19327 a!3591) from!2969)))))))

(declare-fun e!398570 () Bool)

(assert (=> d!96747 (= lt!318079 e!398570)))

(declare-fun res!471901 () Bool)

(assert (=> d!96747 (=> (not res!471901) (not e!398570))))

(assert (=> d!96747 (= res!471901 ((_ is Cons!13364) (t!19653 ($colon$colon!501 acc!652 (select (arr!19327 a!3591) from!2969)))))))

(assert (=> d!96747 (= (contains!3945 (t!19653 ($colon$colon!501 acc!652 (select (arr!19327 a!3591) from!2969))) (h!14409 ($colon$colon!501 acc!652 (select (arr!19327 a!3591) from!2969)))) lt!318079)))

(declare-fun b!708223 () Bool)

(declare-fun e!398571 () Bool)

(assert (=> b!708223 (= e!398570 e!398571)))

(declare-fun res!471902 () Bool)

(assert (=> b!708223 (=> res!471902 e!398571)))

(assert (=> b!708223 (= res!471902 (= (h!14409 (t!19653 ($colon$colon!501 acc!652 (select (arr!19327 a!3591) from!2969)))) (h!14409 ($colon$colon!501 acc!652 (select (arr!19327 a!3591) from!2969)))))))

(declare-fun b!708224 () Bool)

(assert (=> b!708224 (= e!398571 (contains!3945 (t!19653 (t!19653 ($colon$colon!501 acc!652 (select (arr!19327 a!3591) from!2969)))) (h!14409 ($colon$colon!501 acc!652 (select (arr!19327 a!3591) from!2969)))))))

(assert (= (and d!96747 res!471901) b!708223))

(assert (= (and b!708223 (not res!471902)) b!708224))

(declare-fun m!665673 () Bool)

(assert (=> d!96747 m!665673))

(declare-fun m!665675 () Bool)

(assert (=> d!96747 m!665675))

(declare-fun m!665677 () Bool)

(assert (=> b!708224 m!665677))

(assert (=> b!708009 d!96747))

(declare-fun d!96749 () Bool)

(declare-fun lt!318080 () Bool)

(assert (=> d!96749 (= lt!318080 (select (content!335 (t!19653 newAcc!49)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398572 () Bool)

(assert (=> d!96749 (= lt!318080 e!398572)))

(declare-fun res!471903 () Bool)

(assert (=> d!96749 (=> (not res!471903) (not e!398572))))

(assert (=> d!96749 (= res!471903 ((_ is Cons!13364) (t!19653 newAcc!49)))))

(assert (=> d!96749 (= (contains!3945 (t!19653 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000) lt!318080)))

(declare-fun b!708225 () Bool)

(declare-fun e!398573 () Bool)

(assert (=> b!708225 (= e!398572 e!398573)))

(declare-fun res!471904 () Bool)

(assert (=> b!708225 (=> res!471904 e!398573)))

(assert (=> b!708225 (= res!471904 (= (h!14409 (t!19653 newAcc!49)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708226 () Bool)

(assert (=> b!708226 (= e!398573 (contains!3945 (t!19653 (t!19653 newAcc!49)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96749 res!471903) b!708225))

(assert (= (and b!708225 (not res!471904)) b!708226))

(assert (=> d!96749 m!665613))

(declare-fun m!665679 () Bool)

(assert (=> d!96749 m!665679))

(declare-fun m!665681 () Bool)

(assert (=> b!708226 m!665681))

(assert (=> b!707952 d!96749))

(assert (=> d!96629 d!96723))

(declare-fun d!96751 () Bool)

(declare-fun lt!318081 () Bool)

(assert (=> d!96751 (= lt!318081 (select (content!335 (t!19653 acc!652)) k0!2824))))

(declare-fun e!398574 () Bool)

(assert (=> d!96751 (= lt!318081 e!398574)))

(declare-fun res!471905 () Bool)

(assert (=> d!96751 (=> (not res!471905) (not e!398574))))

(assert (=> d!96751 (= res!471905 ((_ is Cons!13364) (t!19653 acc!652)))))

(assert (=> d!96751 (= (contains!3945 (t!19653 acc!652) k0!2824) lt!318081)))

(declare-fun b!708227 () Bool)

(declare-fun e!398575 () Bool)

(assert (=> b!708227 (= e!398574 e!398575)))

(declare-fun res!471906 () Bool)

(assert (=> b!708227 (=> res!471906 e!398575)))

(assert (=> b!708227 (= res!471906 (= (h!14409 (t!19653 acc!652)) k0!2824))))

(declare-fun b!708228 () Bool)

(assert (=> b!708228 (= e!398575 (contains!3945 (t!19653 (t!19653 acc!652)) k0!2824))))

(assert (= (and d!96751 res!471905) b!708227))

(assert (= (and b!708227 (not res!471906)) b!708228))

(assert (=> d!96751 m!665629))

(declare-fun m!665683 () Bool)

(assert (=> d!96751 m!665683))

(declare-fun m!665685 () Bool)

(assert (=> b!708228 m!665685))

(assert (=> b!707974 d!96751))

(declare-fun d!96753 () Bool)

(declare-fun lt!318082 () Bool)

(assert (=> d!96753 (= lt!318082 (select (content!335 (t!19653 acc!652)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398576 () Bool)

(assert (=> d!96753 (= lt!318082 e!398576)))

(declare-fun res!471907 () Bool)

(assert (=> d!96753 (=> (not res!471907) (not e!398576))))

(assert (=> d!96753 (= res!471907 ((_ is Cons!13364) (t!19653 acc!652)))))

(assert (=> d!96753 (= (contains!3945 (t!19653 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000) lt!318082)))

(declare-fun b!708229 () Bool)

(declare-fun e!398577 () Bool)

(assert (=> b!708229 (= e!398576 e!398577)))

(declare-fun res!471908 () Bool)

(assert (=> b!708229 (=> res!471908 e!398577)))

(assert (=> b!708229 (= res!471908 (= (h!14409 (t!19653 acc!652)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708230 () Bool)

(assert (=> b!708230 (= e!398577 (contains!3945 (t!19653 (t!19653 acc!652)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96753 res!471907) b!708229))

(assert (= (and b!708229 (not res!471908)) b!708230))

(assert (=> d!96753 m!665629))

(declare-fun m!665687 () Bool)

(assert (=> d!96753 m!665687))

(declare-fun m!665689 () Bool)

(assert (=> b!708230 m!665689))

(assert (=> b!708025 d!96753))

(declare-fun d!96755 () Bool)

(declare-fun res!471909 () Bool)

(declare-fun e!398578 () Bool)

(assert (=> d!96755 (=> res!471909 e!398578)))

(assert (=> d!96755 (= res!471909 (= (select (arr!19327 a!3591) (bvadd from!2969 #b00000000000000000000000000000001)) k0!2824))))

(assert (=> d!96755 (= (arrayContainsKey!0 a!3591 k0!2824 (bvadd from!2969 #b00000000000000000000000000000001)) e!398578)))

(declare-fun b!708231 () Bool)

(declare-fun e!398579 () Bool)

(assert (=> b!708231 (= e!398578 e!398579)))

(declare-fun res!471910 () Bool)

(assert (=> b!708231 (=> (not res!471910) (not e!398579))))

(assert (=> b!708231 (= res!471910 (bvslt (bvadd from!2969 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!19714 a!3591)))))

(declare-fun b!708232 () Bool)

(assert (=> b!708232 (= e!398579 (arrayContainsKey!0 a!3591 k0!2824 (bvadd from!2969 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!96755 (not res!471909)) b!708231))

(assert (= (and b!708231 res!471910) b!708232))

(assert (=> d!96755 m!665665))

(declare-fun m!665691 () Bool)

(assert (=> b!708232 m!665691))

(assert (=> b!707960 d!96755))

(declare-fun d!96757 () Bool)

(declare-fun res!471911 () Bool)

(declare-fun e!398580 () Bool)

(assert (=> d!96757 (=> res!471911 e!398580)))

(assert (=> d!96757 (= res!471911 ((_ is Nil!13365) (t!19653 ($colon$colon!501 acc!652 (select (arr!19327 a!3591) from!2969)))))))

(assert (=> d!96757 (= (noDuplicate!1192 (t!19653 ($colon$colon!501 acc!652 (select (arr!19327 a!3591) from!2969)))) e!398580)))

(declare-fun b!708233 () Bool)

(declare-fun e!398581 () Bool)

(assert (=> b!708233 (= e!398580 e!398581)))

(declare-fun res!471912 () Bool)

(assert (=> b!708233 (=> (not res!471912) (not e!398581))))

(assert (=> b!708233 (= res!471912 (not (contains!3945 (t!19653 (t!19653 ($colon$colon!501 acc!652 (select (arr!19327 a!3591) from!2969)))) (h!14409 (t!19653 ($colon$colon!501 acc!652 (select (arr!19327 a!3591) from!2969)))))))))

(declare-fun b!708234 () Bool)

(assert (=> b!708234 (= e!398581 (noDuplicate!1192 (t!19653 (t!19653 ($colon$colon!501 acc!652 (select (arr!19327 a!3591) from!2969))))))))

(assert (= (and d!96757 (not res!471911)) b!708233))

(assert (= (and b!708233 res!471912) b!708234))

(declare-fun m!665693 () Bool)

(assert (=> b!708233 m!665693))

(declare-fun m!665695 () Bool)

(assert (=> b!708234 m!665695))

(assert (=> b!708010 d!96757))

(declare-fun d!96759 () Bool)

(declare-fun res!471913 () Bool)

(declare-fun e!398582 () Bool)

(assert (=> d!96759 (=> res!471913 e!398582)))

(assert (=> d!96759 (= res!471913 ((_ is Nil!13365) (t!19653 acc!652)))))

(assert (=> d!96759 (= (noDuplicate!1192 (t!19653 acc!652)) e!398582)))

(declare-fun b!708235 () Bool)

(declare-fun e!398583 () Bool)

(assert (=> b!708235 (= e!398582 e!398583)))

(declare-fun res!471914 () Bool)

(assert (=> b!708235 (=> (not res!471914) (not e!398583))))

(assert (=> b!708235 (= res!471914 (not (contains!3945 (t!19653 (t!19653 acc!652)) (h!14409 (t!19653 acc!652)))))))

(declare-fun b!708236 () Bool)

(assert (=> b!708236 (= e!398583 (noDuplicate!1192 (t!19653 (t!19653 acc!652))))))

(assert (= (and d!96759 (not res!471913)) b!708235))

(assert (= (and b!708235 res!471914) b!708236))

(declare-fun m!665697 () Bool)

(assert (=> b!708235 m!665697))

(declare-fun m!665699 () Bool)

(assert (=> b!708236 m!665699))

(assert (=> b!707998 d!96759))

(declare-fun d!96761 () Bool)

(declare-fun lt!318083 () Bool)

(assert (=> d!96761 (= lt!318083 (select (content!335 (t!19653 newAcc!49)) k0!2824))))

(declare-fun e!398584 () Bool)

(assert (=> d!96761 (= lt!318083 e!398584)))

(declare-fun res!471915 () Bool)

(assert (=> d!96761 (=> (not res!471915) (not e!398584))))

(assert (=> d!96761 (= res!471915 ((_ is Cons!13364) (t!19653 newAcc!49)))))

(assert (=> d!96761 (= (contains!3945 (t!19653 newAcc!49) k0!2824) lt!318083)))

(declare-fun b!708237 () Bool)

(declare-fun e!398585 () Bool)

(assert (=> b!708237 (= e!398584 e!398585)))

(declare-fun res!471916 () Bool)

(assert (=> b!708237 (=> res!471916 e!398585)))

(assert (=> b!708237 (= res!471916 (= (h!14409 (t!19653 newAcc!49)) k0!2824))))

(declare-fun b!708238 () Bool)

(assert (=> b!708238 (= e!398585 (contains!3945 (t!19653 (t!19653 newAcc!49)) k0!2824))))

(assert (= (and d!96761 res!471915) b!708237))

(assert (= (and b!708237 (not res!471916)) b!708238))

(assert (=> d!96761 m!665613))

(declare-fun m!665701 () Bool)

(assert (=> d!96761 m!665701))

(declare-fun m!665703 () Bool)

(assert (=> b!708238 m!665703))

(assert (=> b!707954 d!96761))

(declare-fun d!96763 () Bool)

(declare-fun lt!318084 () Bool)

(assert (=> d!96763 (= lt!318084 (select (content!335 (t!19653 acc!652)) (h!14409 acc!652)))))

(declare-fun e!398586 () Bool)

(assert (=> d!96763 (= lt!318084 e!398586)))

(declare-fun res!471917 () Bool)

(assert (=> d!96763 (=> (not res!471917) (not e!398586))))

(assert (=> d!96763 (= res!471917 ((_ is Cons!13364) (t!19653 acc!652)))))

(assert (=> d!96763 (= (contains!3945 (t!19653 acc!652) (h!14409 acc!652)) lt!318084)))

(declare-fun b!708239 () Bool)

(declare-fun e!398587 () Bool)

(assert (=> b!708239 (= e!398586 e!398587)))

(declare-fun res!471918 () Bool)

(assert (=> b!708239 (=> res!471918 e!398587)))

(assert (=> b!708239 (= res!471918 (= (h!14409 (t!19653 acc!652)) (h!14409 acc!652)))))

(declare-fun b!708240 () Bool)

(assert (=> b!708240 (= e!398587 (contains!3945 (t!19653 (t!19653 acc!652)) (h!14409 acc!652)))))

(assert (= (and d!96763 res!471917) b!708239))

(assert (= (and b!708239 (not res!471918)) b!708240))

(assert (=> d!96763 m!665629))

(declare-fun m!665705 () Bool)

(assert (=> d!96763 m!665705))

(declare-fun m!665707 () Bool)

(assert (=> b!708240 m!665707))

(assert (=> b!707997 d!96763))

(assert (=> b!708066 d!96623))

(assert (=> d!96603 d!96721))

(assert (=> b!708067 d!96623))

(declare-fun lt!318085 () Bool)

(declare-fun d!96765 () Bool)

(assert (=> d!96765 (= lt!318085 (select (content!335 acc!652) (select (arr!19327 a!3591) from!2969)))))

(declare-fun e!398588 () Bool)

(assert (=> d!96765 (= lt!318085 e!398588)))

(declare-fun res!471919 () Bool)

(assert (=> d!96765 (=> (not res!471919) (not e!398588))))

(assert (=> d!96765 (= res!471919 ((_ is Cons!13364) acc!652))))

(assert (=> d!96765 (= (contains!3945 acc!652 (select (arr!19327 a!3591) from!2969)) lt!318085)))

(declare-fun b!708241 () Bool)

(declare-fun e!398589 () Bool)

(assert (=> b!708241 (= e!398588 e!398589)))

(declare-fun res!471920 () Bool)

(assert (=> b!708241 (=> res!471920 e!398589)))

(assert (=> b!708241 (= res!471920 (= (h!14409 acc!652) (select (arr!19327 a!3591) from!2969)))))

(declare-fun b!708242 () Bool)

(assert (=> b!708242 (= e!398589 (contains!3945 (t!19653 acc!652) (select (arr!19327 a!3591) from!2969)))))

(assert (= (and d!96765 res!471919) b!708241))

(assert (= (and b!708241 (not res!471920)) b!708242))

(assert (=> d!96765 m!665435))

(assert (=> d!96765 m!665339))

(declare-fun m!665709 () Bool)

(assert (=> d!96765 m!665709))

(assert (=> b!708242 m!665339))

(declare-fun m!665711 () Bool)

(assert (=> b!708242 m!665711))

(assert (=> b!708065 d!96765))

(check-sat (not d!96763) (not b!708220) (not b!708201) (not d!96717) (not b!708238) (not b!708206) (not b!708226) (not b!708232) (not d!96735) (not b!708210) (not b!708236) (not b!708185) (not b!708187) (not b!708211) (not b!708199) (not d!96765) (not b!708216) (not b!708205) (not b!708189) (not d!96751) (not b!708233) (not d!96761) (not b!708202) (not bm!34392) (not bm!34393) (not b!708228) (not d!96725) (not b!708230) (not d!96749) (not d!96747) (not d!96753) (not b!708203) (not b!708235) (not b!708177) (not b!708219) (not b!708217) (not b!708213) (not b!708191) (not b!708224) (not b!708242) (not b!708218) (not b!708234) (not d!96741) (not b!708207) (not b!708193) (not b!708240) (not d!96727))
(check-sat)
