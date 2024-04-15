; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104340 () Bool)

(assert start!104340)

(declare-fun b!1245854 () Bool)

(declare-fun res!831306 () Bool)

(declare-fun e!706525 () Bool)

(assert (=> b!1245854 (=> (not res!831306) (not e!706525))))

(declare-datatypes ((array!80129 0))(
  ( (array!80130 (arr!38645 (Array (_ BitVec 32) (_ BitVec 64))) (size!39183 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80129)

(declare-fun from!3270 () (_ BitVec 32))

(declare-datatypes ((List!27549 0))(
  ( (Nil!27546) (Cons!27545 (h!28754 (_ BitVec 64)) (t!41009 List!27549)) )
))
(declare-fun arrayNoDuplicates!0 (array!80129 (_ BitVec 32) List!27549) Bool)

(assert (=> b!1245854 (= res!831306 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27546))))

(declare-fun b!1245855 () Bool)

(declare-fun res!831311 () Bool)

(assert (=> b!1245855 (=> (not res!831311) (not e!706525))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1245855 (= res!831311 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39183 a!3892)) (not (= newFrom!287 (size!39183 a!3892)))))))

(declare-fun b!1245856 () Bool)

(declare-fun res!831305 () Bool)

(declare-fun e!706524 () Bool)

(assert (=> b!1245856 (=> (not res!831305) (not e!706524))))

(declare-fun contains!7425 (List!27549 (_ BitVec 64)) Bool)

(assert (=> b!1245856 (= res!831305 (not (contains!7425 Nil!27546 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1245857 () Bool)

(declare-fun res!831307 () Bool)

(assert (=> b!1245857 (=> (not res!831307) (not e!706525))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1245857 (= res!831307 (validKeyInArray!0 (select (arr!38645 a!3892) from!3270)))))

(declare-fun b!1245859 () Bool)

(declare-fun lt!562816 () List!27549)

(declare-fun subseq!653 (List!27549 List!27549) Bool)

(assert (=> b!1245859 (= e!706524 (not (subseq!653 Nil!27546 lt!562816)))))

(declare-fun b!1245860 () Bool)

(declare-fun res!831310 () Bool)

(assert (=> b!1245860 (=> (not res!831310) (not e!706524))))

(declare-fun noDuplicate!2050 (List!27549) Bool)

(assert (=> b!1245860 (= res!831310 (noDuplicate!2050 lt!562816))))

(declare-fun b!1245861 () Bool)

(declare-fun res!831309 () Bool)

(assert (=> b!1245861 (=> (not res!831309) (not e!706524))))

(assert (=> b!1245861 (= res!831309 (not (contains!7425 lt!562816 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1245862 () Bool)

(declare-fun res!831304 () Bool)

(assert (=> b!1245862 (=> (not res!831304) (not e!706524))))

(assert (=> b!1245862 (= res!831304 (not (contains!7425 Nil!27546 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1245863 () Bool)

(declare-fun res!831308 () Bool)

(assert (=> b!1245863 (=> (not res!831308) (not e!706524))))

(assert (=> b!1245863 (= res!831308 (not (contains!7425 lt!562816 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!831312 () Bool)

(assert (=> start!104340 (=> (not res!831312) (not e!706525))))

(assert (=> start!104340 (= res!831312 (and (bvslt (size!39183 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39183 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39183 a!3892))))))

(assert (=> start!104340 e!706525))

(declare-fun array_inv!29628 (array!80129) Bool)

(assert (=> start!104340 (array_inv!29628 a!3892)))

(assert (=> start!104340 true))

(declare-fun b!1245858 () Bool)

(assert (=> b!1245858 (= e!706525 e!706524)))

(declare-fun res!831303 () Bool)

(assert (=> b!1245858 (=> (not res!831303) (not e!706524))))

(assert (=> b!1245858 (= res!831303 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(assert (=> b!1245858 (= lt!562816 (Cons!27545 (select (arr!38645 a!3892) from!3270) Nil!27546))))

(assert (= (and start!104340 res!831312) b!1245854))

(assert (= (and b!1245854 res!831306) b!1245855))

(assert (= (and b!1245855 res!831311) b!1245857))

(assert (= (and b!1245857 res!831307) b!1245858))

(assert (= (and b!1245858 res!831303) b!1245860))

(assert (= (and b!1245860 res!831310) b!1245863))

(assert (= (and b!1245863 res!831308) b!1245861))

(assert (= (and b!1245861 res!831309) b!1245856))

(assert (= (and b!1245856 res!831305) b!1245862))

(assert (= (and b!1245862 res!831304) b!1245859))

(declare-fun m!1147369 () Bool)

(assert (=> b!1245854 m!1147369))

(declare-fun m!1147371 () Bool)

(assert (=> b!1245862 m!1147371))

(declare-fun m!1147373 () Bool)

(assert (=> b!1245860 m!1147373))

(declare-fun m!1147375 () Bool)

(assert (=> b!1245859 m!1147375))

(declare-fun m!1147377 () Bool)

(assert (=> b!1245861 m!1147377))

(declare-fun m!1147379 () Bool)

(assert (=> b!1245858 m!1147379))

(declare-fun m!1147381 () Bool)

(assert (=> start!104340 m!1147381))

(declare-fun m!1147383 () Bool)

(assert (=> b!1245863 m!1147383))

(declare-fun m!1147385 () Bool)

(assert (=> b!1245856 m!1147385))

(assert (=> b!1245857 m!1147379))

(assert (=> b!1245857 m!1147379))

(declare-fun m!1147387 () Bool)

(assert (=> b!1245857 m!1147387))

(check-sat (not start!104340) (not b!1245859) (not b!1245854) (not b!1245863) (not b!1245861) (not b!1245862) (not b!1245860) (not b!1245856) (not b!1245857))
(check-sat)
(get-model)

(declare-fun d!137389 () Bool)

(declare-fun res!831377 () Bool)

(declare-fun e!706549 () Bool)

(assert (=> d!137389 (=> res!831377 e!706549)))

(get-info :version)

(assert (=> d!137389 (= res!831377 ((_ is Nil!27546) lt!562816))))

(assert (=> d!137389 (= (noDuplicate!2050 lt!562816) e!706549)))

(declare-fun b!1245928 () Bool)

(declare-fun e!706550 () Bool)

(assert (=> b!1245928 (= e!706549 e!706550)))

(declare-fun res!831378 () Bool)

(assert (=> b!1245928 (=> (not res!831378) (not e!706550))))

(assert (=> b!1245928 (= res!831378 (not (contains!7425 (t!41009 lt!562816) (h!28754 lt!562816))))))

(declare-fun b!1245929 () Bool)

(assert (=> b!1245929 (= e!706550 (noDuplicate!2050 (t!41009 lt!562816)))))

(assert (= (and d!137389 (not res!831377)) b!1245928))

(assert (= (and b!1245928 res!831378) b!1245929))

(declare-fun m!1147429 () Bool)

(assert (=> b!1245928 m!1147429))

(declare-fun m!1147431 () Bool)

(assert (=> b!1245929 m!1147431))

(assert (=> b!1245860 d!137389))

(declare-fun d!137391 () Bool)

(assert (=> d!137391 (= (array_inv!29628 a!3892) (bvsge (size!39183 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!104340 d!137391))

(declare-fun b!1245938 () Bool)

(declare-fun e!706561 () Bool)

(declare-fun e!706562 () Bool)

(assert (=> b!1245938 (= e!706561 e!706562)))

(declare-fun res!831389 () Bool)

(assert (=> b!1245938 (=> (not res!831389) (not e!706562))))

(assert (=> b!1245938 (= res!831389 ((_ is Cons!27545) lt!562816))))

(declare-fun b!1245940 () Bool)

(declare-fun e!706559 () Bool)

(assert (=> b!1245940 (= e!706559 (subseq!653 (t!41009 Nil!27546) (t!41009 lt!562816)))))

(declare-fun b!1245941 () Bool)

(declare-fun e!706560 () Bool)

(assert (=> b!1245941 (= e!706560 (subseq!653 Nil!27546 (t!41009 lt!562816)))))

(declare-fun d!137393 () Bool)

(declare-fun res!831390 () Bool)

(assert (=> d!137393 (=> res!831390 e!706561)))

(assert (=> d!137393 (= res!831390 ((_ is Nil!27546) Nil!27546))))

(assert (=> d!137393 (= (subseq!653 Nil!27546 lt!562816) e!706561)))

(declare-fun b!1245939 () Bool)

(assert (=> b!1245939 (= e!706562 e!706560)))

(declare-fun res!831387 () Bool)

(assert (=> b!1245939 (=> res!831387 e!706560)))

(assert (=> b!1245939 (= res!831387 e!706559)))

(declare-fun res!831388 () Bool)

(assert (=> b!1245939 (=> (not res!831388) (not e!706559))))

(assert (=> b!1245939 (= res!831388 (= (h!28754 Nil!27546) (h!28754 lt!562816)))))

(assert (= (and d!137393 (not res!831390)) b!1245938))

(assert (= (and b!1245938 res!831389) b!1245939))

(assert (= (and b!1245939 res!831388) b!1245940))

(assert (= (and b!1245939 (not res!831387)) b!1245941))

(declare-fun m!1147433 () Bool)

(assert (=> b!1245940 m!1147433))

(declare-fun m!1147435 () Bool)

(assert (=> b!1245941 m!1147435))

(assert (=> b!1245859 d!137393))

(declare-fun b!1245956 () Bool)

(declare-fun e!706577 () Bool)

(declare-fun call!61490 () Bool)

(assert (=> b!1245956 (= e!706577 call!61490)))

(declare-fun b!1245957 () Bool)

(declare-fun e!706578 () Bool)

(assert (=> b!1245957 (= e!706578 e!706577)))

(declare-fun c!121965 () Bool)

(assert (=> b!1245957 (= c!121965 (validKeyInArray!0 (select (arr!38645 a!3892) from!3270)))))

(declare-fun b!1245958 () Bool)

(assert (=> b!1245958 (= e!706577 call!61490)))

(declare-fun bm!61487 () Bool)

(assert (=> bm!61487 (= call!61490 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!121965 (Cons!27545 (select (arr!38645 a!3892) from!3270) Nil!27546) Nil!27546)))))

(declare-fun b!1245959 () Bool)

(declare-fun e!706576 () Bool)

(assert (=> b!1245959 (= e!706576 (contains!7425 Nil!27546 (select (arr!38645 a!3892) from!3270)))))

(declare-fun d!137395 () Bool)

(declare-fun res!831402 () Bool)

(declare-fun e!706575 () Bool)

(assert (=> d!137395 (=> res!831402 e!706575)))

(assert (=> d!137395 (= res!831402 (bvsge from!3270 (size!39183 a!3892)))))

(assert (=> d!137395 (= (arrayNoDuplicates!0 a!3892 from!3270 Nil!27546) e!706575)))

(declare-fun b!1245960 () Bool)

(assert (=> b!1245960 (= e!706575 e!706578)))

(declare-fun res!831403 () Bool)

(assert (=> b!1245960 (=> (not res!831403) (not e!706578))))

(assert (=> b!1245960 (= res!831403 (not e!706576))))

(declare-fun res!831401 () Bool)

(assert (=> b!1245960 (=> (not res!831401) (not e!706576))))

(assert (=> b!1245960 (= res!831401 (validKeyInArray!0 (select (arr!38645 a!3892) from!3270)))))

(assert (= (and d!137395 (not res!831402)) b!1245960))

(assert (= (and b!1245960 res!831401) b!1245959))

(assert (= (and b!1245960 res!831403) b!1245957))

(assert (= (and b!1245957 c!121965) b!1245956))

(assert (= (and b!1245957 (not c!121965)) b!1245958))

(assert (= (or b!1245956 b!1245958) bm!61487))

(assert (=> b!1245957 m!1147379))

(assert (=> b!1245957 m!1147379))

(assert (=> b!1245957 m!1147387))

(assert (=> bm!61487 m!1147379))

(declare-fun m!1147437 () Bool)

(assert (=> bm!61487 m!1147437))

(assert (=> b!1245959 m!1147379))

(assert (=> b!1245959 m!1147379))

(declare-fun m!1147439 () Bool)

(assert (=> b!1245959 m!1147439))

(assert (=> b!1245960 m!1147379))

(assert (=> b!1245960 m!1147379))

(assert (=> b!1245960 m!1147387))

(assert (=> b!1245854 d!137395))

(declare-fun d!137407 () Bool)

(assert (=> d!137407 (= (validKeyInArray!0 (select (arr!38645 a!3892) from!3270)) (and (not (= (select (arr!38645 a!3892) from!3270) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38645 a!3892) from!3270) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1245857 d!137407))

(declare-fun d!137411 () Bool)

(declare-fun lt!562828 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!626 (List!27549) (InoxSet (_ BitVec 64)))

(assert (=> d!137411 (= lt!562828 (select (content!626 lt!562816) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!706606 () Bool)

(assert (=> d!137411 (= lt!562828 e!706606)))

(declare-fun res!831429 () Bool)

(assert (=> d!137411 (=> (not res!831429) (not e!706606))))

(assert (=> d!137411 (= res!831429 ((_ is Cons!27545) lt!562816))))

(assert (=> d!137411 (= (contains!7425 lt!562816 #b0000000000000000000000000000000000000000000000000000000000000000) lt!562828)))

(declare-fun b!1245989 () Bool)

(declare-fun e!706605 () Bool)

(assert (=> b!1245989 (= e!706606 e!706605)))

(declare-fun res!831428 () Bool)

(assert (=> b!1245989 (=> res!831428 e!706605)))

(assert (=> b!1245989 (= res!831428 (= (h!28754 lt!562816) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1245990 () Bool)

(assert (=> b!1245990 (= e!706605 (contains!7425 (t!41009 lt!562816) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137411 res!831429) b!1245989))

(assert (= (and b!1245989 (not res!831428)) b!1245990))

(declare-fun m!1147451 () Bool)

(assert (=> d!137411 m!1147451))

(declare-fun m!1147453 () Bool)

(assert (=> d!137411 m!1147453))

(declare-fun m!1147455 () Bool)

(assert (=> b!1245990 m!1147455))

(assert (=> b!1245863 d!137411))

(declare-fun d!137415 () Bool)

(declare-fun lt!562829 () Bool)

(assert (=> d!137415 (= lt!562829 (select (content!626 lt!562816) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!706608 () Bool)

(assert (=> d!137415 (= lt!562829 e!706608)))

(declare-fun res!831431 () Bool)

(assert (=> d!137415 (=> (not res!831431) (not e!706608))))

(assert (=> d!137415 (= res!831431 ((_ is Cons!27545) lt!562816))))

(assert (=> d!137415 (= (contains!7425 lt!562816 #b1000000000000000000000000000000000000000000000000000000000000000) lt!562829)))

(declare-fun b!1245991 () Bool)

(declare-fun e!706607 () Bool)

(assert (=> b!1245991 (= e!706608 e!706607)))

(declare-fun res!831430 () Bool)

(assert (=> b!1245991 (=> res!831430 e!706607)))

(assert (=> b!1245991 (= res!831430 (= (h!28754 lt!562816) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1245992 () Bool)

(assert (=> b!1245992 (= e!706607 (contains!7425 (t!41009 lt!562816) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137415 res!831431) b!1245991))

(assert (= (and b!1245991 (not res!831430)) b!1245992))

(assert (=> d!137415 m!1147451))

(declare-fun m!1147457 () Bool)

(assert (=> d!137415 m!1147457))

(declare-fun m!1147459 () Bool)

(assert (=> b!1245992 m!1147459))

(assert (=> b!1245861 d!137415))

(declare-fun d!137417 () Bool)

(declare-fun lt!562830 () Bool)

(assert (=> d!137417 (= lt!562830 (select (content!626 Nil!27546) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!706610 () Bool)

(assert (=> d!137417 (= lt!562830 e!706610)))

(declare-fun res!831433 () Bool)

(assert (=> d!137417 (=> (not res!831433) (not e!706610))))

(assert (=> d!137417 (= res!831433 ((_ is Cons!27545) Nil!27546))))

(assert (=> d!137417 (= (contains!7425 Nil!27546 #b0000000000000000000000000000000000000000000000000000000000000000) lt!562830)))

(declare-fun b!1245993 () Bool)

(declare-fun e!706609 () Bool)

(assert (=> b!1245993 (= e!706610 e!706609)))

(declare-fun res!831432 () Bool)

(assert (=> b!1245993 (=> res!831432 e!706609)))

(assert (=> b!1245993 (= res!831432 (= (h!28754 Nil!27546) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1245994 () Bool)

(assert (=> b!1245994 (= e!706609 (contains!7425 (t!41009 Nil!27546) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137417 res!831433) b!1245993))

(assert (= (and b!1245993 (not res!831432)) b!1245994))

(declare-fun m!1147461 () Bool)

(assert (=> d!137417 m!1147461))

(declare-fun m!1147463 () Bool)

(assert (=> d!137417 m!1147463))

(declare-fun m!1147465 () Bool)

(assert (=> b!1245994 m!1147465))

(assert (=> b!1245856 d!137417))

(declare-fun d!137419 () Bool)

(declare-fun lt!562833 () Bool)

(assert (=> d!137419 (= lt!562833 (select (content!626 Nil!27546) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!706616 () Bool)

(assert (=> d!137419 (= lt!562833 e!706616)))

(declare-fun res!831439 () Bool)

(assert (=> d!137419 (=> (not res!831439) (not e!706616))))

(assert (=> d!137419 (= res!831439 ((_ is Cons!27545) Nil!27546))))

(assert (=> d!137419 (= (contains!7425 Nil!27546 #b1000000000000000000000000000000000000000000000000000000000000000) lt!562833)))

(declare-fun b!1245999 () Bool)

(declare-fun e!706615 () Bool)

(assert (=> b!1245999 (= e!706616 e!706615)))

(declare-fun res!831438 () Bool)

(assert (=> b!1245999 (=> res!831438 e!706615)))

(assert (=> b!1245999 (= res!831438 (= (h!28754 Nil!27546) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1246000 () Bool)

(assert (=> b!1246000 (= e!706615 (contains!7425 (t!41009 Nil!27546) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137419 res!831439) b!1245999))

(assert (= (and b!1245999 (not res!831438)) b!1246000))

(assert (=> d!137419 m!1147461))

(declare-fun m!1147467 () Bool)

(assert (=> d!137419 m!1147467))

(declare-fun m!1147469 () Bool)

(assert (=> b!1246000 m!1147469))

(assert (=> b!1245862 d!137419))

(check-sat (not b!1245994) (not b!1245957) (not bm!61487) (not b!1246000) (not b!1245928) (not b!1245941) (not d!137417) (not b!1245992) (not b!1245959) (not d!137415) (not b!1245990) (not b!1245929) (not b!1245940) (not b!1245960) (not d!137411) (not d!137419))
(check-sat)
