; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93024 () Bool)

(assert start!93024)

(declare-fun b!1055335 () Bool)

(declare-fun e!599567 () Bool)

(declare-fun e!599568 () Bool)

(assert (=> b!1055335 (= e!599567 e!599568)))

(declare-fun res!703514 () Bool)

(assert (=> b!1055335 (=> res!703514 e!599568)))

(declare-fun lt!465802 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1055335 (= res!703514 (bvsle lt!465802 i!1381))))

(declare-fun b!1055336 () Bool)

(declare-fun e!599572 () Bool)

(declare-datatypes ((array!66532 0))(
  ( (array!66533 (arr!31993 (Array (_ BitVec 32) (_ BitVec 64))) (size!32530 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66532)

(assert (=> b!1055336 (= e!599572 (or (bvslt lt!465802 #b00000000000000000000000000000000) (bvslt lt!465802 (size!32530 a!3488))))))

(declare-datatypes ((List!22275 0))(
  ( (Nil!22272) (Cons!22271 (h!23489 (_ BitVec 64)) (t!31574 List!22275)) )
))
(declare-fun arrayNoDuplicates!0 (array!66532 (_ BitVec 32) List!22275) Bool)

(assert (=> b!1055336 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22272)))

(declare-datatypes ((Unit!34513 0))(
  ( (Unit!34514) )
))
(declare-fun lt!465801 () Unit!34513)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66532 (_ BitVec 32) (_ BitVec 32)) Unit!34513)

(assert (=> b!1055336 (= lt!465801 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1055337 () Bool)

(declare-fun res!703517 () Bool)

(declare-fun e!599566 () Bool)

(assert (=> b!1055337 (=> (not res!703517) (not e!599566))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1055337 (= res!703517 (validKeyInArray!0 k0!2747))))

(declare-fun b!1055338 () Bool)

(declare-fun e!599570 () Bool)

(assert (=> b!1055338 (= e!599570 (not e!599572))))

(declare-fun res!703518 () Bool)

(assert (=> b!1055338 (=> res!703518 e!599572)))

(assert (=> b!1055338 (= res!703518 (bvsle lt!465802 i!1381))))

(assert (=> b!1055338 e!599567))

(declare-fun res!703513 () Bool)

(assert (=> b!1055338 (=> (not res!703513) (not e!599567))))

(assert (=> b!1055338 (= res!703513 (= (select (store (arr!31993 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465802) k0!2747))))

(declare-fun b!1055339 () Bool)

(declare-fun e!599569 () Bool)

(assert (=> b!1055339 (= e!599569 e!599570)))

(declare-fun res!703516 () Bool)

(assert (=> b!1055339 (=> (not res!703516) (not e!599570))))

(assert (=> b!1055339 (= res!703516 (not (= lt!465802 i!1381)))))

(declare-fun lt!465803 () array!66532)

(declare-fun arrayScanForKey!0 (array!66532 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1055339 (= lt!465802 (arrayScanForKey!0 lt!465803 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1055340 () Bool)

(declare-fun res!703519 () Bool)

(assert (=> b!1055340 (=> (not res!703519) (not e!599566))))

(assert (=> b!1055340 (= res!703519 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22272))))

(declare-fun b!1055342 () Bool)

(declare-fun arrayContainsKey!0 (array!66532 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1055342 (= e!599568 (arrayContainsKey!0 a!3488 k0!2747 lt!465802))))

(declare-fun b!1055343 () Bool)

(declare-fun res!703515 () Bool)

(assert (=> b!1055343 (=> (not res!703515) (not e!599566))))

(assert (=> b!1055343 (= res!703515 (= (select (arr!31993 a!3488) i!1381) k0!2747))))

(declare-fun b!1055341 () Bool)

(assert (=> b!1055341 (= e!599566 e!599569)))

(declare-fun res!703520 () Bool)

(assert (=> b!1055341 (=> (not res!703520) (not e!599569))))

(assert (=> b!1055341 (= res!703520 (arrayContainsKey!0 lt!465803 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1055341 (= lt!465803 (array!66533 (store (arr!31993 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32530 a!3488)))))

(declare-fun res!703512 () Bool)

(assert (=> start!93024 (=> (not res!703512) (not e!599566))))

(assert (=> start!93024 (= res!703512 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32530 a!3488)) (bvslt (size!32530 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93024 e!599566))

(assert (=> start!93024 true))

(declare-fun array_inv!24775 (array!66532) Bool)

(assert (=> start!93024 (array_inv!24775 a!3488)))

(assert (= (and start!93024 res!703512) b!1055340))

(assert (= (and b!1055340 res!703519) b!1055337))

(assert (= (and b!1055337 res!703517) b!1055343))

(assert (= (and b!1055343 res!703515) b!1055341))

(assert (= (and b!1055341 res!703520) b!1055339))

(assert (= (and b!1055339 res!703516) b!1055338))

(assert (= (and b!1055338 res!703513) b!1055335))

(assert (= (and b!1055335 (not res!703514)) b!1055342))

(assert (= (and b!1055338 (not res!703518)) b!1055336))

(declare-fun m!975833 () Bool)

(assert (=> b!1055338 m!975833))

(declare-fun m!975835 () Bool)

(assert (=> b!1055338 m!975835))

(declare-fun m!975837 () Bool)

(assert (=> b!1055337 m!975837))

(declare-fun m!975839 () Bool)

(assert (=> b!1055343 m!975839))

(declare-fun m!975841 () Bool)

(assert (=> b!1055341 m!975841))

(assert (=> b!1055341 m!975833))

(declare-fun m!975843 () Bool)

(assert (=> b!1055342 m!975843))

(declare-fun m!975845 () Bool)

(assert (=> b!1055336 m!975845))

(declare-fun m!975847 () Bool)

(assert (=> b!1055336 m!975847))

(declare-fun m!975849 () Bool)

(assert (=> start!93024 m!975849))

(declare-fun m!975851 () Bool)

(assert (=> b!1055339 m!975851))

(declare-fun m!975853 () Bool)

(assert (=> b!1055340 m!975853))

(check-sat (not b!1055336) (not b!1055339) (not b!1055340) (not b!1055341) (not start!93024) (not b!1055337) (not b!1055342))
(check-sat)
(get-model)

(declare-fun d!128415 () Bool)

(declare-fun res!703579 () Bool)

(declare-fun e!599619 () Bool)

(assert (=> d!128415 (=> res!703579 e!599619)))

(assert (=> d!128415 (= res!703579 (= (select (arr!31993 a!3488) lt!465802) k0!2747))))

(assert (=> d!128415 (= (arrayContainsKey!0 a!3488 k0!2747 lt!465802) e!599619)))

(declare-fun b!1055402 () Bool)

(declare-fun e!599620 () Bool)

(assert (=> b!1055402 (= e!599619 e!599620)))

(declare-fun res!703580 () Bool)

(assert (=> b!1055402 (=> (not res!703580) (not e!599620))))

(assert (=> b!1055402 (= res!703580 (bvslt (bvadd lt!465802 #b00000000000000000000000000000001) (size!32530 a!3488)))))

(declare-fun b!1055403 () Bool)

(assert (=> b!1055403 (= e!599620 (arrayContainsKey!0 a!3488 k0!2747 (bvadd lt!465802 #b00000000000000000000000000000001)))))

(assert (= (and d!128415 (not res!703579)) b!1055402))

(assert (= (and b!1055402 res!703580) b!1055403))

(declare-fun m!975899 () Bool)

(assert (=> d!128415 m!975899))

(declare-fun m!975901 () Bool)

(assert (=> b!1055403 m!975901))

(assert (=> b!1055342 d!128415))

(declare-fun d!128417 () Bool)

(assert (=> d!128417 (= (validKeyInArray!0 k0!2747) (and (not (= k0!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1055337 d!128417))

(declare-fun call!44828 () Bool)

(declare-fun c!107381 () Bool)

(declare-fun bm!44825 () Bool)

(assert (=> bm!44825 (= call!44828 (arrayNoDuplicates!0 a!3488 (bvadd i!1381 #b00000000000000000000000000000001) (ite c!107381 (Cons!22271 (select (arr!31993 a!3488) i!1381) Nil!22272) Nil!22272)))))

(declare-fun d!128419 () Bool)

(declare-fun res!703588 () Bool)

(declare-fun e!599631 () Bool)

(assert (=> d!128419 (=> res!703588 e!599631)))

(assert (=> d!128419 (= res!703588 (bvsge i!1381 (size!32530 a!3488)))))

(assert (=> d!128419 (= (arrayNoDuplicates!0 a!3488 i!1381 Nil!22272) e!599631)))

(declare-fun b!1055414 () Bool)

(declare-fun e!599632 () Bool)

(declare-fun e!599629 () Bool)

(assert (=> b!1055414 (= e!599632 e!599629)))

(assert (=> b!1055414 (= c!107381 (validKeyInArray!0 (select (arr!31993 a!3488) i!1381)))))

(declare-fun b!1055415 () Bool)

(assert (=> b!1055415 (= e!599629 call!44828)))

(declare-fun b!1055416 () Bool)

(assert (=> b!1055416 (= e!599629 call!44828)))

(declare-fun b!1055417 () Bool)

(assert (=> b!1055417 (= e!599631 e!599632)))

(declare-fun res!703589 () Bool)

(assert (=> b!1055417 (=> (not res!703589) (not e!599632))))

(declare-fun e!599630 () Bool)

(assert (=> b!1055417 (= res!703589 (not e!599630))))

(declare-fun res!703587 () Bool)

(assert (=> b!1055417 (=> (not res!703587) (not e!599630))))

(assert (=> b!1055417 (= res!703587 (validKeyInArray!0 (select (arr!31993 a!3488) i!1381)))))

(declare-fun b!1055418 () Bool)

(declare-fun contains!6197 (List!22275 (_ BitVec 64)) Bool)

(assert (=> b!1055418 (= e!599630 (contains!6197 Nil!22272 (select (arr!31993 a!3488) i!1381)))))

(assert (= (and d!128419 (not res!703588)) b!1055417))

(assert (= (and b!1055417 res!703587) b!1055418))

(assert (= (and b!1055417 res!703589) b!1055414))

(assert (= (and b!1055414 c!107381) b!1055416))

(assert (= (and b!1055414 (not c!107381)) b!1055415))

(assert (= (or b!1055416 b!1055415) bm!44825))

(assert (=> bm!44825 m!975839))

(declare-fun m!975903 () Bool)

(assert (=> bm!44825 m!975903))

(assert (=> b!1055414 m!975839))

(assert (=> b!1055414 m!975839))

(declare-fun m!975905 () Bool)

(assert (=> b!1055414 m!975905))

(assert (=> b!1055417 m!975839))

(assert (=> b!1055417 m!975839))

(assert (=> b!1055417 m!975905))

(assert (=> b!1055418 m!975839))

(assert (=> b!1055418 m!975839))

(declare-fun m!975907 () Bool)

(assert (=> b!1055418 m!975907))

(assert (=> b!1055336 d!128419))

(declare-fun d!128423 () Bool)

(assert (=> d!128423 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22272)))

(declare-fun lt!465824 () Unit!34513)

(declare-fun choose!39 (array!66532 (_ BitVec 32) (_ BitVec 32)) Unit!34513)

(assert (=> d!128423 (= lt!465824 (choose!39 a!3488 #b00000000000000000000000000000000 i!1381))))

(assert (=> d!128423 (bvslt (size!32530 a!3488) #b01111111111111111111111111111111)))

(assert (=> d!128423 (= (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381) lt!465824)))

(declare-fun bs!30906 () Bool)

(assert (= bs!30906 d!128423))

(assert (=> bs!30906 m!975845))

(declare-fun m!975909 () Bool)

(assert (=> bs!30906 m!975909))

(assert (=> b!1055336 d!128423))

(declare-fun d!128427 () Bool)

(assert (=> d!128427 (= (array_inv!24775 a!3488) (bvsge (size!32530 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!93024 d!128427))

(declare-fun d!128431 () Bool)

(declare-fun lt!465830 () (_ BitVec 32))

(assert (=> d!128431 (and (or (bvslt lt!465830 #b00000000000000000000000000000000) (bvsge lt!465830 (size!32530 lt!465803)) (and (bvsge lt!465830 #b00000000000000000000000000000000) (bvslt lt!465830 (size!32530 lt!465803)))) (bvsge lt!465830 #b00000000000000000000000000000000) (bvslt lt!465830 (size!32530 lt!465803)) (= (select (arr!31993 lt!465803) lt!465830) k0!2747))))

(declare-fun e!599663 () (_ BitVec 32))

(assert (=> d!128431 (= lt!465830 e!599663)))

(declare-fun c!107390 () Bool)

(assert (=> d!128431 (= c!107390 (= (select (arr!31993 lt!465803) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!128431 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32530 lt!465803)) (bvslt (size!32530 lt!465803) #b01111111111111111111111111111111))))

(assert (=> d!128431 (= (arrayScanForKey!0 lt!465803 k0!2747 #b00000000000000000000000000000000) lt!465830)))

(declare-fun b!1055457 () Bool)

(assert (=> b!1055457 (= e!599663 #b00000000000000000000000000000000)))

(declare-fun b!1055458 () Bool)

(assert (=> b!1055458 (= e!599663 (arrayScanForKey!0 lt!465803 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128431 c!107390) b!1055457))

(assert (= (and d!128431 (not c!107390)) b!1055458))

(declare-fun m!975919 () Bool)

(assert (=> d!128431 m!975919))

(declare-fun m!975921 () Bool)

(assert (=> d!128431 m!975921))

(declare-fun m!975923 () Bool)

(assert (=> b!1055458 m!975923))

(assert (=> b!1055339 d!128431))

(declare-fun d!128437 () Bool)

(declare-fun res!703612 () Bool)

(declare-fun e!599664 () Bool)

(assert (=> d!128437 (=> res!703612 e!599664)))

(assert (=> d!128437 (= res!703612 (= (select (arr!31993 lt!465803) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!128437 (= (arrayContainsKey!0 lt!465803 k0!2747 #b00000000000000000000000000000000) e!599664)))

(declare-fun b!1055459 () Bool)

(declare-fun e!599665 () Bool)

(assert (=> b!1055459 (= e!599664 e!599665)))

(declare-fun res!703613 () Bool)

(assert (=> b!1055459 (=> (not res!703613) (not e!599665))))

(assert (=> b!1055459 (= res!703613 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32530 lt!465803)))))

(declare-fun b!1055460 () Bool)

(assert (=> b!1055460 (= e!599665 (arrayContainsKey!0 lt!465803 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128437 (not res!703612)) b!1055459))

(assert (= (and b!1055459 res!703613) b!1055460))

(assert (=> d!128437 m!975921))

(declare-fun m!975931 () Bool)

(assert (=> b!1055460 m!975931))

(assert (=> b!1055341 d!128437))

(declare-fun bm!44832 () Bool)

(declare-fun call!44835 () Bool)

(declare-fun c!107391 () Bool)

(assert (=> bm!44832 (= call!44835 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107391 (Cons!22271 (select (arr!31993 a!3488) #b00000000000000000000000000000000) Nil!22272) Nil!22272)))))

(declare-fun d!128441 () Bool)

(declare-fun res!703615 () Bool)

(declare-fun e!599668 () Bool)

(assert (=> d!128441 (=> res!703615 e!599668)))

(assert (=> d!128441 (= res!703615 (bvsge #b00000000000000000000000000000000 (size!32530 a!3488)))))

(assert (=> d!128441 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22272) e!599668)))

(declare-fun b!1055461 () Bool)

(declare-fun e!599669 () Bool)

(declare-fun e!599666 () Bool)

(assert (=> b!1055461 (= e!599669 e!599666)))

(assert (=> b!1055461 (= c!107391 (validKeyInArray!0 (select (arr!31993 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1055462 () Bool)

(assert (=> b!1055462 (= e!599666 call!44835)))

(declare-fun b!1055463 () Bool)

(assert (=> b!1055463 (= e!599666 call!44835)))

(declare-fun b!1055464 () Bool)

(assert (=> b!1055464 (= e!599668 e!599669)))

(declare-fun res!703616 () Bool)

(assert (=> b!1055464 (=> (not res!703616) (not e!599669))))

(declare-fun e!599667 () Bool)

(assert (=> b!1055464 (= res!703616 (not e!599667))))

(declare-fun res!703614 () Bool)

(assert (=> b!1055464 (=> (not res!703614) (not e!599667))))

(assert (=> b!1055464 (= res!703614 (validKeyInArray!0 (select (arr!31993 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1055465 () Bool)

(assert (=> b!1055465 (= e!599667 (contains!6197 Nil!22272 (select (arr!31993 a!3488) #b00000000000000000000000000000000)))))

(assert (= (and d!128441 (not res!703615)) b!1055464))

(assert (= (and b!1055464 res!703614) b!1055465))

(assert (= (and b!1055464 res!703616) b!1055461))

(assert (= (and b!1055461 c!107391) b!1055463))

(assert (= (and b!1055461 (not c!107391)) b!1055462))

(assert (= (or b!1055463 b!1055462) bm!44832))

(declare-fun m!975937 () Bool)

(assert (=> bm!44832 m!975937))

(declare-fun m!975939 () Bool)

(assert (=> bm!44832 m!975939))

(assert (=> b!1055461 m!975937))

(assert (=> b!1055461 m!975937))

(declare-fun m!975941 () Bool)

(assert (=> b!1055461 m!975941))

(assert (=> b!1055464 m!975937))

(assert (=> b!1055464 m!975937))

(assert (=> b!1055464 m!975941))

(assert (=> b!1055465 m!975937))

(assert (=> b!1055465 m!975937))

(declare-fun m!975947 () Bool)

(assert (=> b!1055465 m!975947))

(assert (=> b!1055340 d!128441))

(check-sat (not b!1055464) (not b!1055418) (not b!1055461) (not bm!44832) (not bm!44825) (not b!1055460) (not d!128423) (not b!1055458) (not b!1055414) (not b!1055465) (not b!1055403) (not b!1055417))
(check-sat)
