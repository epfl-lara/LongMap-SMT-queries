; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93366 () Bool)

(assert start!93366)

(declare-fun res!706510 () Bool)

(declare-fun e!601741 () Bool)

(assert (=> start!93366 (=> (not res!706510) (not e!601741))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66720 0))(
  ( (array!66721 (arr!32080 (Array (_ BitVec 32) (_ BitVec 64))) (size!32616 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66720)

(assert (=> start!93366 (= res!706510 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32616 a!3488)) (bvslt (size!32616 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93366 e!601741))

(assert (=> start!93366 true))

(declare-fun array_inv!24860 (array!66720) Bool)

(assert (=> start!93366 (array_inv!24860 a!3488)))

(declare-fun b!1057893 () Bool)

(declare-fun e!601744 () Bool)

(assert (=> b!1057893 (= e!601741 e!601744)))

(declare-fun res!706515 () Bool)

(assert (=> b!1057893 (=> (not res!706515) (not e!601744))))

(declare-fun lt!466643 () array!66720)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66720 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1057893 (= res!706515 (arrayContainsKey!0 lt!466643 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1057893 (= lt!466643 (array!66721 (store (arr!32080 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32616 a!3488)))))

(declare-fun b!1057894 () Bool)

(declare-fun e!601736 () Bool)

(declare-fun e!601737 () Bool)

(assert (=> b!1057894 (= e!601736 e!601737)))

(declare-fun res!706512 () Bool)

(assert (=> b!1057894 (=> res!706512 e!601737)))

(declare-fun lt!466646 () (_ BitVec 32))

(declare-fun lt!466647 () (_ BitVec 32))

(assert (=> b!1057894 (= res!706512 (or (bvslt lt!466646 #b00000000000000000000000000000000) (bvsge lt!466647 (size!32616 a!3488)) (bvsge lt!466646 (size!32616 a!3488))))))

(assert (=> b!1057894 (arrayContainsKey!0 a!3488 k!2747 lt!466647)))

(declare-datatypes ((Unit!34682 0))(
  ( (Unit!34683) )
))
(declare-fun lt!466644 () Unit!34682)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66720 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34682)

(assert (=> b!1057894 (= lt!466644 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 i!1381 lt!466647))))

(assert (=> b!1057894 (= lt!466647 (bvadd #b00000000000000000000000000000001 lt!466646))))

(declare-datatypes ((List!22392 0))(
  ( (Nil!22389) (Cons!22388 (h!23597 (_ BitVec 64)) (t!31699 List!22392)) )
))
(declare-fun arrayNoDuplicates!0 (array!66720 (_ BitVec 32) List!22392) Bool)

(assert (=> b!1057894 (arrayNoDuplicates!0 a!3488 lt!466646 Nil!22389)))

(declare-fun lt!466645 () Unit!34682)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66720 (_ BitVec 32) (_ BitVec 32)) Unit!34682)

(assert (=> b!1057894 (= lt!466645 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466646))))

(declare-fun b!1057895 () Bool)

(declare-fun res!706519 () Bool)

(assert (=> b!1057895 (=> (not res!706519) (not e!601741))))

(assert (=> b!1057895 (= res!706519 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22389))))

(declare-fun b!1057896 () Bool)

(declare-fun e!601740 () Bool)

(declare-fun e!601739 () Bool)

(assert (=> b!1057896 (= e!601740 e!601739)))

(declare-fun res!706518 () Bool)

(assert (=> b!1057896 (=> res!706518 e!601739)))

(assert (=> b!1057896 (= res!706518 (or (bvsgt lt!466646 i!1381) (bvsle i!1381 lt!466646)))))

(declare-fun b!1057897 () Bool)

(declare-fun res!706516 () Bool)

(assert (=> b!1057897 (=> (not res!706516) (not e!601741))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1057897 (= res!706516 (validKeyInArray!0 k!2747))))

(declare-fun b!1057898 () Bool)

(declare-fun e!601738 () Bool)

(declare-fun contains!6204 (List!22392 (_ BitVec 64)) Bool)

(assert (=> b!1057898 (= e!601738 (not (contains!6204 Nil!22389 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1057899 () Bool)

(assert (=> b!1057899 (= e!601739 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1057900 () Bool)

(assert (=> b!1057900 (= e!601737 e!601738)))

(declare-fun res!706520 () Bool)

(assert (=> b!1057900 (=> (not res!706520) (not e!601738))))

(assert (=> b!1057900 (= res!706520 (not (contains!6204 Nil!22389 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1057901 () Bool)

(declare-fun res!706513 () Bool)

(assert (=> b!1057901 (=> res!706513 e!601737)))

(declare-fun noDuplicate!1560 (List!22392) Bool)

(assert (=> b!1057901 (= res!706513 (not (noDuplicate!1560 Nil!22389)))))

(declare-fun b!1057902 () Bool)

(declare-fun e!601742 () Bool)

(assert (=> b!1057902 (= e!601744 e!601742)))

(declare-fun res!706511 () Bool)

(assert (=> b!1057902 (=> (not res!706511) (not e!601742))))

(assert (=> b!1057902 (= res!706511 (not (= lt!466646 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66720 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1057902 (= lt!466646 (arrayScanForKey!0 lt!466643 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1057903 () Bool)

(assert (=> b!1057903 (= e!601742 (not e!601736))))

(declare-fun res!706514 () Bool)

(assert (=> b!1057903 (=> res!706514 e!601736)))

(assert (=> b!1057903 (= res!706514 (or (bvsgt lt!466646 i!1381) (bvsle i!1381 lt!466646)))))

(assert (=> b!1057903 e!601740))

(declare-fun res!706509 () Bool)

(assert (=> b!1057903 (=> (not res!706509) (not e!601740))))

(assert (=> b!1057903 (= res!706509 (= (select (store (arr!32080 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466646) k!2747))))

(declare-fun b!1057904 () Bool)

(declare-fun res!706517 () Bool)

(assert (=> b!1057904 (=> (not res!706517) (not e!601741))))

(assert (=> b!1057904 (= res!706517 (= (select (arr!32080 a!3488) i!1381) k!2747))))

(assert (= (and start!93366 res!706510) b!1057895))

(assert (= (and b!1057895 res!706519) b!1057897))

(assert (= (and b!1057897 res!706516) b!1057904))

(assert (= (and b!1057904 res!706517) b!1057893))

(assert (= (and b!1057893 res!706515) b!1057902))

(assert (= (and b!1057902 res!706511) b!1057903))

(assert (= (and b!1057903 res!706509) b!1057896))

(assert (= (and b!1057896 (not res!706518)) b!1057899))

(assert (= (and b!1057903 (not res!706514)) b!1057894))

(assert (= (and b!1057894 (not res!706512)) b!1057901))

(assert (= (and b!1057901 (not res!706513)) b!1057900))

(assert (= (and b!1057900 res!706520) b!1057898))

(declare-fun m!977555 () Bool)

(assert (=> b!1057897 m!977555))

(declare-fun m!977557 () Bool)

(assert (=> b!1057904 m!977557))

(declare-fun m!977559 () Bool)

(assert (=> b!1057895 m!977559))

(declare-fun m!977561 () Bool)

(assert (=> b!1057893 m!977561))

(declare-fun m!977563 () Bool)

(assert (=> b!1057893 m!977563))

(declare-fun m!977565 () Bool)

(assert (=> b!1057901 m!977565))

(declare-fun m!977567 () Bool)

(assert (=> b!1057894 m!977567))

(declare-fun m!977569 () Bool)

(assert (=> b!1057894 m!977569))

(declare-fun m!977571 () Bool)

(assert (=> b!1057894 m!977571))

(declare-fun m!977573 () Bool)

(assert (=> b!1057894 m!977573))

(assert (=> b!1057903 m!977563))

(declare-fun m!977575 () Bool)

(assert (=> b!1057903 m!977575))

(declare-fun m!977577 () Bool)

(assert (=> b!1057899 m!977577))

(declare-fun m!977579 () Bool)

(assert (=> b!1057898 m!977579))

(declare-fun m!977581 () Bool)

(assert (=> b!1057900 m!977581))

(declare-fun m!977583 () Bool)

(assert (=> b!1057902 m!977583))

(declare-fun m!977585 () Bool)

(assert (=> start!93366 m!977585))

(push 1)

(assert (not b!1057893))

(assert (not b!1057898))

(assert (not b!1057901))

(assert (not start!93366))

(assert (not b!1057902))

(assert (not b!1057900))

(assert (not b!1057897))

(assert (not b!1057899))

(assert (not b!1057895))

(assert (not b!1057894))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!128529 () Bool)

(assert (=> d!128529 (= (array_inv!24860 a!3488) (bvsge (size!32616 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!93366 d!128529))

(declare-fun d!128531 () Bool)

(declare-fun lt!466685 () (_ BitVec 32))

(assert (=> d!128531 (and (or (bvslt lt!466685 #b00000000000000000000000000000000) (bvsge lt!466685 (size!32616 lt!466643)) (and (bvsge lt!466685 #b00000000000000000000000000000000) (bvslt lt!466685 (size!32616 lt!466643)))) (bvsge lt!466685 #b00000000000000000000000000000000) (bvslt lt!466685 (size!32616 lt!466643)) (= (select (arr!32080 lt!466643) lt!466685) k!2747))))

(declare-fun e!601834 () (_ BitVec 32))

(assert (=> d!128531 (= lt!466685 e!601834)))

(declare-fun c!107160 () Bool)

(assert (=> d!128531 (= c!107160 (= (select (arr!32080 lt!466643) #b00000000000000000000000000000000) k!2747))))

(assert (=> d!128531 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32616 lt!466643)) (bvslt (size!32616 lt!466643) #b01111111111111111111111111111111))))

(assert (=> d!128531 (= (arrayScanForKey!0 lt!466643 k!2747 #b00000000000000000000000000000000) lt!466685)))

(declare-fun b!1058020 () Bool)

(assert (=> b!1058020 (= e!601834 #b00000000000000000000000000000000)))

(declare-fun b!1058021 () Bool)

(assert (=> b!1058021 (= e!601834 (arrayScanForKey!0 lt!466643 k!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128531 c!107160) b!1058020))

(assert (= (and d!128531 (not c!107160)) b!1058021))

(declare-fun m!977673 () Bool)

(assert (=> d!128531 m!977673))

(declare-fun m!977675 () Bool)

(assert (=> d!128531 m!977675))

(declare-fun m!977677 () Bool)

(assert (=> b!1058021 m!977677))

(assert (=> b!1057902 d!128531))

(declare-fun d!128541 () Bool)

(assert (=> d!128541 (= (validKeyInArray!0 k!2747) (and (not (= k!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1057897 d!128541))

(declare-fun d!128549 () Bool)

(declare-fun lt!466694 () Bool)

(declare-fun content!532 (List!22392) (Set (_ BitVec 64)))

(assert (=> d!128549 (= lt!466694 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!532 Nil!22389)))))

(declare-fun e!601852 () Bool)

(assert (=> d!128549 (= lt!466694 e!601852)))

(declare-fun res!706635 () Bool)

(assert (=> d!128549 (=> (not res!706635) (not e!601852))))

(assert (=> d!128549 (= res!706635 (is-Cons!22388 Nil!22389))))

(assert (=> d!128549 (= (contains!6204 Nil!22389 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466694)))

(declare-fun b!1058039 () Bool)

(declare-fun e!601851 () Bool)

(assert (=> b!1058039 (= e!601852 e!601851)))

(declare-fun res!706636 () Bool)

(assert (=> b!1058039 (=> res!706636 e!601851)))

(assert (=> b!1058039 (= res!706636 (= (h!23597 Nil!22389) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1058040 () Bool)

(assert (=> b!1058040 (= e!601851 (contains!6204 (t!31699 Nil!22389) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!128549 res!706635) b!1058039))

(assert (= (and b!1058039 (not res!706636)) b!1058040))

(declare-fun m!977699 () Bool)

(assert (=> d!128549 m!977699))

(declare-fun m!977701 () Bool)

(assert (=> d!128549 m!977701))

(declare-fun m!977703 () Bool)

(assert (=> b!1058040 m!977703))

(assert (=> b!1057898 d!128549))

(declare-fun d!128557 () Bool)

(declare-fun res!706649 () Bool)

(declare-fun e!601865 () Bool)

(assert (=> d!128557 (=> res!706649 e!601865)))

(assert (=> d!128557 (= res!706649 (= (select (arr!32080 lt!466643) #b00000000000000000000000000000000) k!2747))))

(assert (=> d!128557 (= (arrayContainsKey!0 lt!466643 k!2747 #b00000000000000000000000000000000) e!601865)))

(declare-fun b!1058053 () Bool)

(declare-fun e!601866 () Bool)

(assert (=> b!1058053 (= e!601865 e!601866)))

(declare-fun res!706650 () Bool)

(assert (=> b!1058053 (=> (not res!706650) (not e!601866))))

(assert (=> b!1058053 (= res!706650 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32616 lt!466643)))))

(declare-fun b!1058054 () Bool)

(assert (=> b!1058054 (= e!601866 (arrayContainsKey!0 lt!466643 k!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128557 (not res!706649)) b!1058053))

(assert (= (and b!1058053 res!706650) b!1058054))

(assert (=> d!128557 m!977675))

(declare-fun m!977717 () Bool)

(assert (=> b!1058054 m!977717))

(assert (=> b!1057893 d!128557))

(declare-fun d!128563 () Bool)

(declare-fun res!706651 () Bool)

(declare-fun e!601867 () Bool)

(assert (=> d!128563 (=> res!706651 e!601867)))

(assert (=> d!128563 (= res!706651 (= (select (arr!32080 a!3488) lt!466647) k!2747))))

(assert (=> d!128563 (= (arrayContainsKey!0 a!3488 k!2747 lt!466647) e!601867)))

(declare-fun b!1058055 () Bool)

(declare-fun e!601868 () Bool)

(assert (=> b!1058055 (= e!601867 e!601868)))

(declare-fun res!706652 () Bool)

(assert (=> b!1058055 (=> (not res!706652) (not e!601868))))

(assert (=> b!1058055 (= res!706652 (bvslt (bvadd lt!466647 #b00000000000000000000000000000001) (size!32616 a!3488)))))

(declare-fun b!1058056 () Bool)

(assert (=> b!1058056 (= e!601868 (arrayContainsKey!0 a!3488 k!2747 (bvadd lt!466647 #b00000000000000000000000000000001)))))

(assert (= (and d!128563 (not res!706651)) b!1058055))

(assert (= (and b!1058055 res!706652) b!1058056))

(declare-fun m!977719 () Bool)

(assert (=> d!128563 m!977719))

(declare-fun m!977721 () Bool)

(assert (=> b!1058056 m!977721))

(assert (=> b!1057894 d!128563))

(declare-fun d!128565 () Bool)

(assert (=> d!128565 (arrayContainsKey!0 a!3488 k!2747 lt!466647)))

(declare-fun lt!466703 () Unit!34682)

(declare-fun choose!114 (array!66720 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34682)

(assert (=> d!128565 (= lt!466703 (choose!114 a!3488 k!2747 i!1381 lt!466647))))

(assert (=> d!128565 (bvsge i!1381 #b00000000000000000000000000000000)))

(assert (=> d!128565 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 i!1381 lt!466647) lt!466703)))

(declare-fun bs!31029 () Bool)

(assert (= bs!31029 d!128565))

(assert (=> bs!31029 m!977567))

(declare-fun m!977733 () Bool)

(assert (=> bs!31029 m!977733))

(assert (=> b!1057894 d!128565))

(declare-fun b!1058079 () Bool)

(declare-fun e!601888 () Bool)

(declare-fun e!601889 () Bool)

(assert (=> b!1058079 (= e!601888 e!601889)))

(declare-fun c!107167 () Bool)

(assert (=> b!1058079 (= c!107167 (validKeyInArray!0 (select (arr!32080 a!3488) lt!466646)))))

(declare-fun d!128573 () Bool)

(declare-fun res!706667 () Bool)

(declare-fun e!601886 () Bool)

(assert (=> d!128573 (=> res!706667 e!601886)))

(assert (=> d!128573 (= res!706667 (bvsge lt!466646 (size!32616 a!3488)))))

(assert (=> d!128573 (= (arrayNoDuplicates!0 a!3488 lt!466646 Nil!22389) e!601886)))

(declare-fun b!1058080 () Bool)

(assert (=> b!1058080 (= e!601886 e!601888)))

(declare-fun res!706666 () Bool)

(assert (=> b!1058080 (=> (not res!706666) (not e!601888))))

(declare-fun e!601887 () Bool)

(assert (=> b!1058080 (= res!706666 (not e!601887))))

(declare-fun res!706665 () Bool)

(assert (=> b!1058080 (=> (not res!706665) (not e!601887))))

(assert (=> b!1058080 (= res!706665 (validKeyInArray!0 (select (arr!32080 a!3488) lt!466646)))))

(declare-fun b!1058081 () Bool)

(declare-fun call!44867 () Bool)

(assert (=> b!1058081 (= e!601889 call!44867)))

(declare-fun b!1058082 () Bool)

(assert (=> b!1058082 (= e!601889 call!44867)))

(declare-fun bm!44864 () Bool)

(assert (=> bm!44864 (= call!44867 (arrayNoDuplicates!0 a!3488 (bvadd lt!466646 #b00000000000000000000000000000001) (ite c!107167 (Cons!22388 (select (arr!32080 a!3488) lt!466646) Nil!22389) Nil!22389)))))

(declare-fun b!1058083 () Bool)

(assert (=> b!1058083 (= e!601887 (contains!6204 Nil!22389 (select (arr!32080 a!3488) lt!466646)))))

(assert (= (and d!128573 (not res!706667)) b!1058080))

(assert (= (and b!1058080 res!706665) b!1058083))

(assert (= (and b!1058080 res!706666) b!1058079))

(assert (= (and b!1058079 c!107167) b!1058081))

(assert (= (and b!1058079 (not c!107167)) b!1058082))

(assert (= (or b!1058081 b!1058082) bm!44864))

(declare-fun m!977739 () Bool)

(assert (=> b!1058079 m!977739))

(assert (=> b!1058079 m!977739))

(declare-fun m!977741 () Bool)

(assert (=> b!1058079 m!977741))

(assert (=> b!1058080 m!977739))

(assert (=> b!1058080 m!977739))

(assert (=> b!1058080 m!977741))

(assert (=> bm!44864 m!977739))

(declare-fun m!977743 () Bool)

(assert (=> bm!44864 m!977743))

(assert (=> b!1058083 m!977739))

(assert (=> b!1058083 m!977739))

(declare-fun m!977745 () Bool)

(assert (=> b!1058083 m!977745))

(assert (=> b!1057894 d!128573))

(declare-fun d!128577 () Bool)

(assert (=> d!128577 (arrayNoDuplicates!0 a!3488 lt!466646 Nil!22389)))

(declare-fun lt!466709 () Unit!34682)

(declare-fun choose!39 (array!66720 (_ BitVec 32) (_ BitVec 32)) Unit!34682)

(assert (=> d!128577 (= lt!466709 (choose!39 a!3488 #b00000000000000000000000000000000 lt!466646))))

(assert (=> d!128577 (bvslt (size!32616 a!3488) #b01111111111111111111111111111111)))

(assert (=> d!128577 (= (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466646) lt!466709)))

(declare-fun bs!31030 () Bool)

(assert (= bs!31030 d!128577))

(assert (=> bs!31030 m!977571))

(declare-fun m!977755 () Bool)

(assert (=> bs!31030 m!977755))

(assert (=> b!1057894 d!128577))

(declare-fun d!128585 () Bool)

(declare-fun res!706676 () Bool)

(declare-fun e!601898 () Bool)

(assert (=> d!128585 (=> res!706676 e!601898)))

(assert (=> d!128585 (= res!706676 (= (select (arr!32080 a!3488) i!1381) k!2747))))

(assert (=> d!128585 (= (arrayContainsKey!0 a!3488 k!2747 i!1381) e!601898)))

(declare-fun b!1058092 () Bool)

(declare-fun e!601899 () Bool)

(assert (=> b!1058092 (= e!601898 e!601899)))

(declare-fun res!706677 () Bool)

(assert (=> b!1058092 (=> (not res!706677) (not e!601899))))

(assert (=> b!1058092 (= res!706677 (bvslt (bvadd i!1381 #b00000000000000000000000000000001) (size!32616 a!3488)))))

