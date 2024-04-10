; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104346 () Bool)

(assert start!104346)

(declare-fun b!1245966 () Bool)

(declare-fun res!831378 () Bool)

(declare-fun e!706580 () Bool)

(assert (=> b!1245966 (=> (not res!831378) (not e!706580))))

(declare-datatypes ((List!27488 0))(
  ( (Nil!27485) (Cons!27484 (h!28693 (_ BitVec 64)) (t!40957 List!27488)) )
))
(declare-fun lt!562998 () List!27488)

(declare-fun contains!7454 (List!27488 (_ BitVec 64)) Bool)

(assert (=> b!1245966 (= res!831378 (not (contains!7454 lt!562998 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!831381 () Bool)

(declare-fun e!706579 () Bool)

(assert (=> start!104346 (=> (not res!831381) (not e!706579))))

(declare-datatypes ((array!80210 0))(
  ( (array!80211 (arr!38685 (Array (_ BitVec 32) (_ BitVec 64))) (size!39221 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80210)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104346 (= res!831381 (and (bvslt (size!39221 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39221 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39221 a!3892))))))

(assert (=> start!104346 e!706579))

(declare-fun array_inv!29533 (array!80210) Bool)

(assert (=> start!104346 (array_inv!29533 a!3892)))

(assert (=> start!104346 true))

(declare-fun b!1245967 () Bool)

(assert (=> b!1245967 (= e!706579 e!706580)))

(declare-fun res!831375 () Bool)

(assert (=> b!1245967 (=> (not res!831375) (not e!706580))))

(assert (=> b!1245967 (= res!831375 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(assert (=> b!1245967 (= lt!562998 (Cons!27484 (select (arr!38685 a!3892) from!3270) Nil!27485))))

(declare-fun b!1245968 () Bool)

(declare-fun res!831377 () Bool)

(assert (=> b!1245968 (=> (not res!831377) (not e!706580))))

(assert (=> b!1245968 (= res!831377 (not (contains!7454 Nil!27485 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1245969 () Bool)

(declare-fun subseq!654 (List!27488 List!27488) Bool)

(assert (=> b!1245969 (= e!706580 (not (subseq!654 Nil!27485 lt!562998)))))

(declare-fun b!1245970 () Bool)

(declare-fun res!831373 () Bool)

(assert (=> b!1245970 (=> (not res!831373) (not e!706579))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1245970 (= res!831373 (validKeyInArray!0 (select (arr!38685 a!3892) from!3270)))))

(declare-fun b!1245971 () Bool)

(declare-fun res!831379 () Bool)

(assert (=> b!1245971 (=> (not res!831379) (not e!706580))))

(assert (=> b!1245971 (= res!831379 (not (contains!7454 lt!562998 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1245972 () Bool)

(declare-fun res!831380 () Bool)

(assert (=> b!1245972 (=> (not res!831380) (not e!706580))))

(assert (=> b!1245972 (= res!831380 (not (contains!7454 Nil!27485 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1245973 () Bool)

(declare-fun res!831376 () Bool)

(assert (=> b!1245973 (=> (not res!831376) (not e!706579))))

(assert (=> b!1245973 (= res!831376 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39221 a!3892)) (not (= newFrom!287 (size!39221 a!3892)))))))

(declare-fun b!1245974 () Bool)

(declare-fun res!831374 () Bool)

(assert (=> b!1245974 (=> (not res!831374) (not e!706580))))

(declare-fun noDuplicate!2033 (List!27488) Bool)

(assert (=> b!1245974 (= res!831374 (noDuplicate!2033 lt!562998))))

(declare-fun b!1245975 () Bool)

(declare-fun res!831382 () Bool)

(assert (=> b!1245975 (=> (not res!831382) (not e!706579))))

(declare-fun arrayNoDuplicates!0 (array!80210 (_ BitVec 32) List!27488) Bool)

(assert (=> b!1245975 (= res!831382 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27485))))

(assert (= (and start!104346 res!831381) b!1245975))

(assert (= (and b!1245975 res!831382) b!1245973))

(assert (= (and b!1245973 res!831376) b!1245970))

(assert (= (and b!1245970 res!831373) b!1245967))

(assert (= (and b!1245967 res!831375) b!1245974))

(assert (= (and b!1245974 res!831374) b!1245971))

(assert (= (and b!1245971 res!831379) b!1245966))

(assert (= (and b!1245966 res!831378) b!1245968))

(assert (= (and b!1245968 res!831377) b!1245972))

(assert (= (and b!1245972 res!831380) b!1245969))

(declare-fun m!1147909 () Bool)

(assert (=> b!1245970 m!1147909))

(assert (=> b!1245970 m!1147909))

(declare-fun m!1147911 () Bool)

(assert (=> b!1245970 m!1147911))

(declare-fun m!1147913 () Bool)

(assert (=> b!1245968 m!1147913))

(declare-fun m!1147915 () Bool)

(assert (=> b!1245966 m!1147915))

(declare-fun m!1147917 () Bool)

(assert (=> b!1245974 m!1147917))

(declare-fun m!1147919 () Bool)

(assert (=> b!1245969 m!1147919))

(declare-fun m!1147921 () Bool)

(assert (=> b!1245972 m!1147921))

(declare-fun m!1147923 () Bool)

(assert (=> start!104346 m!1147923))

(assert (=> b!1245967 m!1147909))

(declare-fun m!1147925 () Bool)

(assert (=> b!1245975 m!1147925))

(declare-fun m!1147927 () Bool)

(assert (=> b!1245971 m!1147927))

(check-sat (not b!1245970) (not b!1245974) (not b!1245966) (not b!1245975) (not b!1245972) (not start!104346) (not b!1245968) (not b!1245971) (not b!1245969))
(check-sat)
(get-model)

(declare-fun d!137521 () Bool)

(assert (=> d!137521 (= (validKeyInArray!0 (select (arr!38685 a!3892) from!3270)) (and (not (= (select (arr!38685 a!3892) from!3270) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38685 a!3892) from!3270) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1245970 d!137521))

(declare-fun b!1246023 () Bool)

(declare-fun e!706605 () Bool)

(assert (=> b!1246023 (= e!706605 (contains!7454 Nil!27485 (select (arr!38685 a!3892) from!3270)))))

(declare-fun b!1246024 () Bool)

(declare-fun e!706606 () Bool)

(declare-fun call!61509 () Bool)

(assert (=> b!1246024 (= e!706606 call!61509)))

(declare-fun b!1246025 () Bool)

(declare-fun e!706607 () Bool)

(assert (=> b!1246025 (= e!706607 e!706606)))

(declare-fun c!121983 () Bool)

(assert (=> b!1246025 (= c!121983 (validKeyInArray!0 (select (arr!38685 a!3892) from!3270)))))

(declare-fun d!137523 () Bool)

(declare-fun res!831426 () Bool)

(declare-fun e!706604 () Bool)

(assert (=> d!137523 (=> res!831426 e!706604)))

(assert (=> d!137523 (= res!831426 (bvsge from!3270 (size!39221 a!3892)))))

(assert (=> d!137523 (= (arrayNoDuplicates!0 a!3892 from!3270 Nil!27485) e!706604)))

(declare-fun b!1246022 () Bool)

(assert (=> b!1246022 (= e!706604 e!706607)))

(declare-fun res!831427 () Bool)

(assert (=> b!1246022 (=> (not res!831427) (not e!706607))))

(assert (=> b!1246022 (= res!831427 (not e!706605))))

(declare-fun res!831425 () Bool)

(assert (=> b!1246022 (=> (not res!831425) (not e!706605))))

(assert (=> b!1246022 (= res!831425 (validKeyInArray!0 (select (arr!38685 a!3892) from!3270)))))

(declare-fun bm!61506 () Bool)

(assert (=> bm!61506 (= call!61509 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!121983 (Cons!27484 (select (arr!38685 a!3892) from!3270) Nil!27485) Nil!27485)))))

(declare-fun b!1246026 () Bool)

(assert (=> b!1246026 (= e!706606 call!61509)))

(assert (= (and d!137523 (not res!831426)) b!1246022))

(assert (= (and b!1246022 res!831425) b!1246023))

(assert (= (and b!1246022 res!831427) b!1246025))

(assert (= (and b!1246025 c!121983) b!1246024))

(assert (= (and b!1246025 (not c!121983)) b!1246026))

(assert (= (or b!1246024 b!1246026) bm!61506))

(assert (=> b!1246023 m!1147909))

(assert (=> b!1246023 m!1147909))

(declare-fun m!1147953 () Bool)

(assert (=> b!1246023 m!1147953))

(assert (=> b!1246025 m!1147909))

(assert (=> b!1246025 m!1147909))

(assert (=> b!1246025 m!1147911))

(assert (=> b!1246022 m!1147909))

(assert (=> b!1246022 m!1147909))

(assert (=> b!1246022 m!1147911))

(assert (=> bm!61506 m!1147909))

(declare-fun m!1147955 () Bool)

(assert (=> bm!61506 m!1147955))

(assert (=> b!1245975 d!137523))

(declare-fun d!137533 () Bool)

(declare-fun lt!563008 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!627 (List!27488) (InoxSet (_ BitVec 64)))

(assert (=> d!137533 (= lt!563008 (select (content!627 lt!562998) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!706629 () Bool)

(assert (=> d!137533 (= lt!563008 e!706629)))

(declare-fun res!831447 () Bool)

(assert (=> d!137533 (=> (not res!831447) (not e!706629))))

(get-info :version)

(assert (=> d!137533 (= res!831447 ((_ is Cons!27484) lt!562998))))

(assert (=> d!137533 (= (contains!7454 lt!562998 #b1000000000000000000000000000000000000000000000000000000000000000) lt!563008)))

(declare-fun b!1246049 () Bool)

(declare-fun e!706628 () Bool)

(assert (=> b!1246049 (= e!706629 e!706628)))

(declare-fun res!831446 () Bool)

(assert (=> b!1246049 (=> res!831446 e!706628)))

(assert (=> b!1246049 (= res!831446 (= (h!28693 lt!562998) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1246050 () Bool)

(assert (=> b!1246050 (= e!706628 (contains!7454 (t!40957 lt!562998) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137533 res!831447) b!1246049))

(assert (= (and b!1246049 (not res!831446)) b!1246050))

(declare-fun m!1147969 () Bool)

(assert (=> d!137533 m!1147969))

(declare-fun m!1147971 () Bool)

(assert (=> d!137533 m!1147971))

(declare-fun m!1147973 () Bool)

(assert (=> b!1246050 m!1147973))

(assert (=> b!1245966 d!137533))

(declare-fun d!137539 () Bool)

(declare-fun lt!563009 () Bool)

(assert (=> d!137539 (= lt!563009 (select (content!627 lt!562998) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!706631 () Bool)

(assert (=> d!137539 (= lt!563009 e!706631)))

(declare-fun res!831449 () Bool)

(assert (=> d!137539 (=> (not res!831449) (not e!706631))))

(assert (=> d!137539 (= res!831449 ((_ is Cons!27484) lt!562998))))

(assert (=> d!137539 (= (contains!7454 lt!562998 #b0000000000000000000000000000000000000000000000000000000000000000) lt!563009)))

(declare-fun b!1246051 () Bool)

(declare-fun e!706630 () Bool)

(assert (=> b!1246051 (= e!706631 e!706630)))

(declare-fun res!831448 () Bool)

(assert (=> b!1246051 (=> res!831448 e!706630)))

(assert (=> b!1246051 (= res!831448 (= (h!28693 lt!562998) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1246052 () Bool)

(assert (=> b!1246052 (= e!706630 (contains!7454 (t!40957 lt!562998) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137539 res!831449) b!1246051))

(assert (= (and b!1246051 (not res!831448)) b!1246052))

(assert (=> d!137539 m!1147969))

(declare-fun m!1147975 () Bool)

(assert (=> d!137539 m!1147975))

(declare-fun m!1147977 () Bool)

(assert (=> b!1246052 m!1147977))

(assert (=> b!1245971 d!137539))

(declare-fun d!137541 () Bool)

(assert (=> d!137541 (= (array_inv!29533 a!3892) (bvsge (size!39221 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!104346 d!137541))

(declare-fun d!137545 () Bool)

(declare-fun lt!563010 () Bool)

(assert (=> d!137545 (= lt!563010 (select (content!627 Nil!27485) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!706637 () Bool)

(assert (=> d!137545 (= lt!563010 e!706637)))

(declare-fun res!831454 () Bool)

(assert (=> d!137545 (=> (not res!831454) (not e!706637))))

(assert (=> d!137545 (= res!831454 ((_ is Cons!27484) Nil!27485))))

(assert (=> d!137545 (= (contains!7454 Nil!27485 #b1000000000000000000000000000000000000000000000000000000000000000) lt!563010)))

(declare-fun b!1246058 () Bool)

(declare-fun e!706636 () Bool)

(assert (=> b!1246058 (= e!706637 e!706636)))

(declare-fun res!831453 () Bool)

(assert (=> b!1246058 (=> res!831453 e!706636)))

(assert (=> b!1246058 (= res!831453 (= (h!28693 Nil!27485) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1246059 () Bool)

(assert (=> b!1246059 (= e!706636 (contains!7454 (t!40957 Nil!27485) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137545 res!831454) b!1246058))

(assert (= (and b!1246058 (not res!831453)) b!1246059))

(declare-fun m!1147983 () Bool)

(assert (=> d!137545 m!1147983))

(declare-fun m!1147985 () Bool)

(assert (=> d!137545 m!1147985))

(declare-fun m!1147987 () Bool)

(assert (=> b!1246059 m!1147987))

(assert (=> b!1245972 d!137545))

(declare-fun d!137547 () Bool)

(declare-fun res!831488 () Bool)

(declare-fun e!706669 () Bool)

(assert (=> d!137547 (=> res!831488 e!706669)))

(assert (=> d!137547 (= res!831488 ((_ is Nil!27485) Nil!27485))))

(assert (=> d!137547 (= (subseq!654 Nil!27485 lt!562998) e!706669)))

(declare-fun b!1246093 () Bool)

(declare-fun e!706671 () Bool)

(assert (=> b!1246093 (= e!706671 (subseq!654 Nil!27485 (t!40957 lt!562998)))))

(declare-fun b!1246090 () Bool)

(declare-fun e!706670 () Bool)

(assert (=> b!1246090 (= e!706669 e!706670)))

(declare-fun res!831487 () Bool)

(assert (=> b!1246090 (=> (not res!831487) (not e!706670))))

(assert (=> b!1246090 (= res!831487 ((_ is Cons!27484) lt!562998))))

(declare-fun b!1246092 () Bool)

(declare-fun e!706668 () Bool)

(assert (=> b!1246092 (= e!706668 (subseq!654 (t!40957 Nil!27485) (t!40957 lt!562998)))))

(declare-fun b!1246091 () Bool)

(assert (=> b!1246091 (= e!706670 e!706671)))

(declare-fun res!831485 () Bool)

(assert (=> b!1246091 (=> res!831485 e!706671)))

(assert (=> b!1246091 (= res!831485 e!706668)))

(declare-fun res!831486 () Bool)

(assert (=> b!1246091 (=> (not res!831486) (not e!706668))))

(assert (=> b!1246091 (= res!831486 (= (h!28693 Nil!27485) (h!28693 lt!562998)))))

(assert (= (and d!137547 (not res!831488)) b!1246090))

(assert (= (and b!1246090 res!831487) b!1246091))

(assert (= (and b!1246091 res!831486) b!1246092))

(assert (= (and b!1246091 (not res!831485)) b!1246093))

(declare-fun m!1148009 () Bool)

(assert (=> b!1246093 m!1148009))

(declare-fun m!1148011 () Bool)

(assert (=> b!1246092 m!1148011))

(assert (=> b!1245969 d!137547))

(declare-fun d!137559 () Bool)

(declare-fun res!831507 () Bool)

(declare-fun e!706690 () Bool)

(assert (=> d!137559 (=> res!831507 e!706690)))

(assert (=> d!137559 (= res!831507 ((_ is Nil!27485) lt!562998))))

(assert (=> d!137559 (= (noDuplicate!2033 lt!562998) e!706690)))

(declare-fun b!1246114 () Bool)

(declare-fun e!706691 () Bool)

(assert (=> b!1246114 (= e!706690 e!706691)))

(declare-fun res!831508 () Bool)

(assert (=> b!1246114 (=> (not res!831508) (not e!706691))))

(assert (=> b!1246114 (= res!831508 (not (contains!7454 (t!40957 lt!562998) (h!28693 lt!562998))))))

(declare-fun b!1246115 () Bool)

(assert (=> b!1246115 (= e!706691 (noDuplicate!2033 (t!40957 lt!562998)))))

(assert (= (and d!137559 (not res!831507)) b!1246114))

(assert (= (and b!1246114 res!831508) b!1246115))

(declare-fun m!1148021 () Bool)

(assert (=> b!1246114 m!1148021))

(declare-fun m!1148023 () Bool)

(assert (=> b!1246115 m!1148023))

(assert (=> b!1245974 d!137559))

(declare-fun d!137567 () Bool)

(declare-fun lt!563017 () Bool)

(assert (=> d!137567 (= lt!563017 (select (content!627 Nil!27485) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!706695 () Bool)

(assert (=> d!137567 (= lt!563017 e!706695)))

(declare-fun res!831510 () Bool)

(assert (=> d!137567 (=> (not res!831510) (not e!706695))))

(assert (=> d!137567 (= res!831510 ((_ is Cons!27484) Nil!27485))))

(assert (=> d!137567 (= (contains!7454 Nil!27485 #b0000000000000000000000000000000000000000000000000000000000000000) lt!563017)))

(declare-fun b!1246118 () Bool)

(declare-fun e!706694 () Bool)

(assert (=> b!1246118 (= e!706695 e!706694)))

(declare-fun res!831509 () Bool)

(assert (=> b!1246118 (=> res!831509 e!706694)))

(assert (=> b!1246118 (= res!831509 (= (h!28693 Nil!27485) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1246119 () Bool)

(assert (=> b!1246119 (= e!706694 (contains!7454 (t!40957 Nil!27485) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137567 res!831510) b!1246118))

(assert (= (and b!1246118 (not res!831509)) b!1246119))

(assert (=> d!137567 m!1147983))

(declare-fun m!1148025 () Bool)

(assert (=> d!137567 m!1148025))

(declare-fun m!1148027 () Bool)

(assert (=> b!1246119 m!1148027))

(assert (=> b!1245968 d!137567))

(check-sat (not d!137533) (not b!1246093) (not b!1246115) (not b!1246092) (not b!1246114) (not b!1246025) (not d!137567) (not b!1246052) (not b!1246050) (not b!1246119) (not d!137545) (not b!1246059) (not b!1246023) (not b!1246022) (not d!137539) (not bm!61506))
(check-sat)
