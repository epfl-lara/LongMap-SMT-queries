; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62710 () Bool)

(assert start!62710)

(declare-fun b!707637 () Bool)

(declare-fun res!471355 () Bool)

(declare-fun e!398217 () Bool)

(assert (=> b!707637 (=> (not res!471355) (not e!398217))))

(declare-datatypes ((array!40329 0))(
  ( (array!40330 (arr!19318 (Array (_ BitVec 32) (_ BitVec 64))) (size!19701 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40329)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!707637 (= res!471355 (validKeyInArray!0 (select (arr!19318 a!3591) from!2969)))))

(declare-fun b!707638 () Bool)

(declare-fun res!471348 () Bool)

(assert (=> b!707638 (=> (not res!471348) (not e!398217))))

(declare-datatypes ((List!13266 0))(
  ( (Nil!13263) (Cons!13262 (h!14310 (_ BitVec 64)) (t!19540 List!13266)) )
))
(declare-fun acc!652 () List!13266)

(declare-fun contains!3918 (List!13266 (_ BitVec 64)) Bool)

(assert (=> b!707638 (= res!471348 (not (contains!3918 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707639 () Bool)

(declare-fun res!471353 () Bool)

(assert (=> b!707639 (=> (not res!471353) (not e!398217))))

(declare-fun newAcc!49 () List!13266)

(assert (=> b!707639 (= res!471353 (not (contains!3918 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707640 () Bool)

(declare-fun res!471357 () Bool)

(assert (=> b!707640 (=> (not res!471357) (not e!398217))))

(declare-fun noDuplicate!1192 (List!13266) Bool)

(assert (=> b!707640 (= res!471357 (noDuplicate!1192 acc!652))))

(declare-fun b!707641 () Bool)

(declare-fun res!471354 () Bool)

(assert (=> b!707641 (=> (not res!471354) (not e!398217))))

(declare-fun subseq!386 (List!13266 List!13266) Bool)

(assert (=> b!707641 (= res!471354 (subseq!386 acc!652 newAcc!49))))

(declare-fun res!471358 () Bool)

(assert (=> start!62710 (=> (not res!471358) (not e!398217))))

(assert (=> start!62710 (= res!471358 (and (bvslt (size!19701 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19701 a!3591))))))

(assert (=> start!62710 e!398217))

(assert (=> start!62710 true))

(declare-fun array_inv!15177 (array!40329) Bool)

(assert (=> start!62710 (array_inv!15177 a!3591)))

(declare-fun b!707642 () Bool)

(declare-fun res!471364 () Bool)

(assert (=> b!707642 (=> (not res!471364) (not e!398217))))

(assert (=> b!707642 (= res!471364 (noDuplicate!1192 newAcc!49))))

(declare-fun b!707643 () Bool)

(declare-fun res!471349 () Bool)

(assert (=> b!707643 (=> (not res!471349) (not e!398217))))

(assert (=> b!707643 (= res!471349 (not (contains!3918 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707644 () Bool)

(declare-fun res!471359 () Bool)

(assert (=> b!707644 (=> (not res!471359) (not e!398217))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun -!350 (List!13266 (_ BitVec 64)) List!13266)

(assert (=> b!707644 (= res!471359 (= (-!350 newAcc!49 k0!2824) acc!652))))

(declare-fun b!707645 () Bool)

(declare-fun res!471352 () Bool)

(assert (=> b!707645 (=> (not res!471352) (not e!398217))))

(assert (=> b!707645 (= res!471352 (contains!3918 newAcc!49 k0!2824))))

(declare-fun b!707646 () Bool)

(declare-fun res!471350 () Bool)

(assert (=> b!707646 (=> (not res!471350) (not e!398217))))

(assert (=> b!707646 (= res!471350 (validKeyInArray!0 k0!2824))))

(declare-fun b!707647 () Bool)

(declare-fun res!471363 () Bool)

(assert (=> b!707647 (=> (not res!471363) (not e!398217))))

(assert (=> b!707647 (= res!471363 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19701 a!3591)))))

(declare-fun b!707648 () Bool)

(declare-fun res!471361 () Bool)

(assert (=> b!707648 (=> (not res!471361) (not e!398217))))

(assert (=> b!707648 (= res!471361 (not (contains!3918 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707649 () Bool)

(declare-fun res!471362 () Bool)

(assert (=> b!707649 (=> (not res!471362) (not e!398217))))

(declare-fun arrayContainsKey!0 (array!40329 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!707649 (= res!471362 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!707650 () Bool)

(declare-fun res!471356 () Bool)

(assert (=> b!707650 (=> (not res!471356) (not e!398217))))

(assert (=> b!707650 (= res!471356 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!707651 () Bool)

(declare-fun res!471351 () Bool)

(assert (=> b!707651 (=> (not res!471351) (not e!398217))))

(declare-fun arrayNoDuplicates!0 (array!40329 (_ BitVec 32) List!13266) Bool)

(assert (=> b!707651 (= res!471351 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!707652 () Bool)

(declare-fun $colon$colon!494 (List!13266 (_ BitVec 64)) List!13266)

(assert (=> b!707652 (= e!398217 (not (noDuplicate!1192 ($colon$colon!494 acc!652 (select (arr!19318 a!3591) from!2969)))))))

(declare-fun b!707653 () Bool)

(declare-fun res!471360 () Bool)

(assert (=> b!707653 (=> (not res!471360) (not e!398217))))

(assert (=> b!707653 (= res!471360 (not (contains!3918 acc!652 k0!2824)))))

(assert (= (and start!62710 res!471358) b!707640))

(assert (= (and b!707640 res!471357) b!707642))

(assert (= (and b!707642 res!471364) b!707638))

(assert (= (and b!707638 res!471348) b!707648))

(assert (= (and b!707648 res!471361) b!707649))

(assert (= (and b!707649 res!471362) b!707653))

(assert (= (and b!707653 res!471360) b!707646))

(assert (= (and b!707646 res!471350) b!707651))

(assert (= (and b!707651 res!471351) b!707641))

(assert (= (and b!707641 res!471354) b!707645))

(assert (= (and b!707645 res!471352) b!707644))

(assert (= (and b!707644 res!471359) b!707639))

(assert (= (and b!707639 res!471353) b!707643))

(assert (= (and b!707643 res!471349) b!707647))

(assert (= (and b!707647 res!471363) b!707637))

(assert (= (and b!707637 res!471355) b!707650))

(assert (= (and b!707650 res!471356) b!707652))

(declare-fun m!665667 () Bool)

(assert (=> b!707640 m!665667))

(declare-fun m!665669 () Bool)

(assert (=> b!707639 m!665669))

(declare-fun m!665671 () Bool)

(assert (=> b!707641 m!665671))

(declare-fun m!665673 () Bool)

(assert (=> b!707644 m!665673))

(declare-fun m!665675 () Bool)

(assert (=> b!707646 m!665675))

(declare-fun m!665677 () Bool)

(assert (=> b!707645 m!665677))

(declare-fun m!665679 () Bool)

(assert (=> b!707643 m!665679))

(declare-fun m!665681 () Bool)

(assert (=> b!707653 m!665681))

(declare-fun m!665683 () Bool)

(assert (=> b!707642 m!665683))

(declare-fun m!665685 () Bool)

(assert (=> b!707649 m!665685))

(declare-fun m!665687 () Bool)

(assert (=> b!707652 m!665687))

(assert (=> b!707652 m!665687))

(declare-fun m!665689 () Bool)

(assert (=> b!707652 m!665689))

(assert (=> b!707652 m!665689))

(declare-fun m!665691 () Bool)

(assert (=> b!707652 m!665691))

(declare-fun m!665693 () Bool)

(assert (=> b!707648 m!665693))

(declare-fun m!665695 () Bool)

(assert (=> start!62710 m!665695))

(declare-fun m!665697 () Bool)

(assert (=> b!707651 m!665697))

(assert (=> b!707637 m!665687))

(assert (=> b!707637 m!665687))

(declare-fun m!665699 () Bool)

(assert (=> b!707637 m!665699))

(declare-fun m!665701 () Bool)

(assert (=> b!707638 m!665701))

(check-sat (not b!707645) (not b!707640) (not b!707644) (not b!707639) (not b!707649) (not b!707638) (not b!707652) (not b!707642) (not b!707646) (not b!707641) (not b!707643) (not b!707653) (not b!707637) (not b!707648) (not start!62710) (not b!707651))
(check-sat)
(get-model)

(declare-fun d!96597 () Bool)

(declare-fun lt!318105 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!332 (List!13266) (InoxSet (_ BitVec 64)))

(assert (=> d!96597 (= lt!318105 (select (content!332 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398235 () Bool)

(assert (=> d!96597 (= lt!318105 e!398235)))

(declare-fun res!471471 () Bool)

(assert (=> d!96597 (=> (not res!471471) (not e!398235))))

(get-info :version)

(assert (=> d!96597 (= res!471471 ((_ is Cons!13262) newAcc!49))))

(assert (=> d!96597 (= (contains!3918 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318105)))

(declare-fun b!707760 () Bool)

(declare-fun e!398234 () Bool)

(assert (=> b!707760 (= e!398235 e!398234)))

(declare-fun res!471472 () Bool)

(assert (=> b!707760 (=> res!471472 e!398234)))

(assert (=> b!707760 (= res!471472 (= (h!14310 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!707761 () Bool)

(assert (=> b!707761 (= e!398234 (contains!3918 (t!19540 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96597 res!471471) b!707760))

(assert (= (and b!707760 (not res!471472)) b!707761))

(declare-fun m!665775 () Bool)

(assert (=> d!96597 m!665775))

(declare-fun m!665777 () Bool)

(assert (=> d!96597 m!665777))

(declare-fun m!665779 () Bool)

(assert (=> b!707761 m!665779))

(assert (=> b!707639 d!96597))

(declare-fun d!96599 () Bool)

(declare-fun res!471477 () Bool)

(declare-fun e!398240 () Bool)

(assert (=> d!96599 (=> res!471477 e!398240)))

(assert (=> d!96599 (= res!471477 (= (select (arr!19318 a!3591) from!2969) k0!2824))))

(assert (=> d!96599 (= (arrayContainsKey!0 a!3591 k0!2824 from!2969) e!398240)))

(declare-fun b!707766 () Bool)

(declare-fun e!398241 () Bool)

(assert (=> b!707766 (= e!398240 e!398241)))

(declare-fun res!471478 () Bool)

(assert (=> b!707766 (=> (not res!471478) (not e!398241))))

(assert (=> b!707766 (= res!471478 (bvslt (bvadd from!2969 #b00000000000000000000000000000001) (size!19701 a!3591)))))

(declare-fun b!707767 () Bool)

(assert (=> b!707767 (= e!398241 (arrayContainsKey!0 a!3591 k0!2824 (bvadd from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!96599 (not res!471477)) b!707766))

(assert (= (and b!707766 res!471478) b!707767))

(assert (=> d!96599 m!665687))

(declare-fun m!665781 () Bool)

(assert (=> b!707767 m!665781))

(assert (=> b!707649 d!96599))

(declare-fun d!96601 () Bool)

(declare-fun lt!318106 () Bool)

(assert (=> d!96601 (= lt!318106 (select (content!332 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398243 () Bool)

(assert (=> d!96601 (= lt!318106 e!398243)))

(declare-fun res!471479 () Bool)

(assert (=> d!96601 (=> (not res!471479) (not e!398243))))

(assert (=> d!96601 (= res!471479 ((_ is Cons!13262) acc!652))))

(assert (=> d!96601 (= (contains!3918 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318106)))

(declare-fun b!707768 () Bool)

(declare-fun e!398242 () Bool)

(assert (=> b!707768 (= e!398243 e!398242)))

(declare-fun res!471480 () Bool)

(assert (=> b!707768 (=> res!471480 e!398242)))

(assert (=> b!707768 (= res!471480 (= (h!14310 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!707769 () Bool)

(assert (=> b!707769 (= e!398242 (contains!3918 (t!19540 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96601 res!471479) b!707768))

(assert (= (and b!707768 (not res!471480)) b!707769))

(declare-fun m!665783 () Bool)

(assert (=> d!96601 m!665783))

(declare-fun m!665785 () Bool)

(assert (=> d!96601 m!665785))

(declare-fun m!665787 () Bool)

(assert (=> b!707769 m!665787))

(assert (=> b!707638 d!96601))

(declare-fun d!96603 () Bool)

(declare-fun lt!318107 () Bool)

(assert (=> d!96603 (= lt!318107 (select (content!332 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398245 () Bool)

(assert (=> d!96603 (= lt!318107 e!398245)))

(declare-fun res!471481 () Bool)

(assert (=> d!96603 (=> (not res!471481) (not e!398245))))

(assert (=> d!96603 (= res!471481 ((_ is Cons!13262) acc!652))))

(assert (=> d!96603 (= (contains!3918 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318107)))

(declare-fun b!707770 () Bool)

(declare-fun e!398244 () Bool)

(assert (=> b!707770 (= e!398245 e!398244)))

(declare-fun res!471482 () Bool)

(assert (=> b!707770 (=> res!471482 e!398244)))

(assert (=> b!707770 (= res!471482 (= (h!14310 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!707771 () Bool)

(assert (=> b!707771 (= e!398244 (contains!3918 (t!19540 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96603 res!471481) b!707770))

(assert (= (and b!707770 (not res!471482)) b!707771))

(assert (=> d!96603 m!665783))

(declare-fun m!665789 () Bool)

(assert (=> d!96603 m!665789))

(declare-fun m!665791 () Bool)

(assert (=> b!707771 m!665791))

(assert (=> b!707648 d!96603))

(declare-fun d!96605 () Bool)

(assert (=> d!96605 (= (validKeyInArray!0 (select (arr!19318 a!3591) from!2969)) (and (not (= (select (arr!19318 a!3591) from!2969) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19318 a!3591) from!2969) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!707637 d!96605))

(declare-fun d!96607 () Bool)

(declare-fun res!471487 () Bool)

(declare-fun e!398250 () Bool)

(assert (=> d!96607 (=> res!471487 e!398250)))

(assert (=> d!96607 (= res!471487 ((_ is Nil!13263) newAcc!49))))

(assert (=> d!96607 (= (noDuplicate!1192 newAcc!49) e!398250)))

(declare-fun b!707776 () Bool)

(declare-fun e!398251 () Bool)

(assert (=> b!707776 (= e!398250 e!398251)))

(declare-fun res!471488 () Bool)

(assert (=> b!707776 (=> (not res!471488) (not e!398251))))

(assert (=> b!707776 (= res!471488 (not (contains!3918 (t!19540 newAcc!49) (h!14310 newAcc!49))))))

(declare-fun b!707777 () Bool)

(assert (=> b!707777 (= e!398251 (noDuplicate!1192 (t!19540 newAcc!49)))))

(assert (= (and d!96607 (not res!471487)) b!707776))

(assert (= (and b!707776 res!471488) b!707777))

(declare-fun m!665793 () Bool)

(assert (=> b!707776 m!665793))

(declare-fun m!665795 () Bool)

(assert (=> b!707777 m!665795))

(assert (=> b!707642 d!96607))

(declare-fun d!96613 () Bool)

(declare-fun res!471489 () Bool)

(declare-fun e!398252 () Bool)

(assert (=> d!96613 (=> res!471489 e!398252)))

(assert (=> d!96613 (= res!471489 ((_ is Nil!13263) ($colon$colon!494 acc!652 (select (arr!19318 a!3591) from!2969))))))

(assert (=> d!96613 (= (noDuplicate!1192 ($colon$colon!494 acc!652 (select (arr!19318 a!3591) from!2969))) e!398252)))

(declare-fun b!707778 () Bool)

(declare-fun e!398253 () Bool)

(assert (=> b!707778 (= e!398252 e!398253)))

(declare-fun res!471490 () Bool)

(assert (=> b!707778 (=> (not res!471490) (not e!398253))))

(assert (=> b!707778 (= res!471490 (not (contains!3918 (t!19540 ($colon$colon!494 acc!652 (select (arr!19318 a!3591) from!2969))) (h!14310 ($colon$colon!494 acc!652 (select (arr!19318 a!3591) from!2969))))))))

(declare-fun b!707779 () Bool)

(assert (=> b!707779 (= e!398253 (noDuplicate!1192 (t!19540 ($colon$colon!494 acc!652 (select (arr!19318 a!3591) from!2969)))))))

(assert (= (and d!96613 (not res!471489)) b!707778))

(assert (= (and b!707778 res!471490) b!707779))

(declare-fun m!665797 () Bool)

(assert (=> b!707778 m!665797))

(declare-fun m!665799 () Bool)

(assert (=> b!707779 m!665799))

(assert (=> b!707652 d!96613))

(declare-fun d!96615 () Bool)

(assert (=> d!96615 (= ($colon$colon!494 acc!652 (select (arr!19318 a!3591) from!2969)) (Cons!13262 (select (arr!19318 a!3591) from!2969) acc!652))))

(assert (=> b!707652 d!96615))

(declare-fun b!707811 () Bool)

(declare-fun e!398283 () Bool)

(assert (=> b!707811 (= e!398283 (subseq!386 acc!652 (t!19540 newAcc!49)))))

(declare-fun b!707810 () Bool)

(declare-fun e!398284 () Bool)

(assert (=> b!707810 (= e!398284 (subseq!386 (t!19540 acc!652) (t!19540 newAcc!49)))))

(declare-fun b!707808 () Bool)

(declare-fun e!398285 () Bool)

(declare-fun e!398282 () Bool)

(assert (=> b!707808 (= e!398285 e!398282)))

(declare-fun res!471519 () Bool)

(assert (=> b!707808 (=> (not res!471519) (not e!398282))))

(assert (=> b!707808 (= res!471519 ((_ is Cons!13262) newAcc!49))))

(declare-fun d!96617 () Bool)

(declare-fun res!471520 () Bool)

(assert (=> d!96617 (=> res!471520 e!398285)))

(assert (=> d!96617 (= res!471520 ((_ is Nil!13263) acc!652))))

(assert (=> d!96617 (= (subseq!386 acc!652 newAcc!49) e!398285)))

(declare-fun b!707809 () Bool)

(assert (=> b!707809 (= e!398282 e!398283)))

(declare-fun res!471522 () Bool)

(assert (=> b!707809 (=> res!471522 e!398283)))

(assert (=> b!707809 (= res!471522 e!398284)))

(declare-fun res!471521 () Bool)

(assert (=> b!707809 (=> (not res!471521) (not e!398284))))

(assert (=> b!707809 (= res!471521 (= (h!14310 acc!652) (h!14310 newAcc!49)))))

(assert (= (and d!96617 (not res!471520)) b!707808))

(assert (= (and b!707808 res!471519) b!707809))

(assert (= (and b!707809 res!471521) b!707810))

(assert (= (and b!707809 (not res!471522)) b!707811))

(declare-fun m!665819 () Bool)

(assert (=> b!707811 m!665819))

(declare-fun m!665821 () Bool)

(assert (=> b!707810 m!665821))

(assert (=> b!707641 d!96617))

(declare-fun d!96627 () Bool)

(assert (=> d!96627 (= (array_inv!15177 a!3591) (bvsge (size!19701 a!3591) #b00000000000000000000000000000000))))

(assert (=> start!62710 d!96627))

(declare-fun b!707845 () Bool)

(declare-fun e!398312 () Bool)

(declare-fun call!34368 () Bool)

(assert (=> b!707845 (= e!398312 call!34368)))

(declare-fun b!707846 () Bool)

(declare-fun e!398315 () Bool)

(declare-fun e!398313 () Bool)

(assert (=> b!707846 (= e!398315 e!398313)))

(declare-fun res!471540 () Bool)

(assert (=> b!707846 (=> (not res!471540) (not e!398313))))

(declare-fun e!398314 () Bool)

(assert (=> b!707846 (= res!471540 (not e!398314))))

(declare-fun res!471542 () Bool)

(assert (=> b!707846 (=> (not res!471542) (not e!398314))))

(assert (=> b!707846 (= res!471542 (validKeyInArray!0 (select (arr!19318 a!3591) from!2969)))))

(declare-fun b!707848 () Bool)

(assert (=> b!707848 (= e!398314 (contains!3918 acc!652 (select (arr!19318 a!3591) from!2969)))))

(declare-fun b!707849 () Bool)

(assert (=> b!707849 (= e!398312 call!34368)))

(declare-fun c!78521 () Bool)

(declare-fun bm!34365 () Bool)

(assert (=> bm!34365 (= call!34368 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78521 (Cons!13262 (select (arr!19318 a!3591) from!2969) acc!652) acc!652)))))

(declare-fun d!96629 () Bool)

(declare-fun res!471541 () Bool)

(assert (=> d!96629 (=> res!471541 e!398315)))

(assert (=> d!96629 (= res!471541 (bvsge from!2969 (size!19701 a!3591)))))

(assert (=> d!96629 (= (arrayNoDuplicates!0 a!3591 from!2969 acc!652) e!398315)))

(declare-fun b!707847 () Bool)

(assert (=> b!707847 (= e!398313 e!398312)))

(assert (=> b!707847 (= c!78521 (validKeyInArray!0 (select (arr!19318 a!3591) from!2969)))))

(assert (= (and d!96629 (not res!471541)) b!707846))

(assert (= (and b!707846 res!471542) b!707848))

(assert (= (and b!707846 res!471540) b!707847))

(assert (= (and b!707847 c!78521) b!707845))

(assert (= (and b!707847 (not c!78521)) b!707849))

(assert (= (or b!707845 b!707849) bm!34365))

(assert (=> b!707846 m!665687))

(assert (=> b!707846 m!665687))

(assert (=> b!707846 m!665699))

(assert (=> b!707848 m!665687))

(assert (=> b!707848 m!665687))

(declare-fun m!665843 () Bool)

(assert (=> b!707848 m!665843))

(assert (=> bm!34365 m!665687))

(declare-fun m!665845 () Bool)

(assert (=> bm!34365 m!665845))

(assert (=> b!707847 m!665687))

(assert (=> b!707847 m!665687))

(assert (=> b!707847 m!665699))

(assert (=> b!707651 d!96629))

(declare-fun d!96639 () Bool)

(declare-fun res!471547 () Bool)

(declare-fun e!398320 () Bool)

(assert (=> d!96639 (=> res!471547 e!398320)))

(assert (=> d!96639 (= res!471547 ((_ is Nil!13263) acc!652))))

(assert (=> d!96639 (= (noDuplicate!1192 acc!652) e!398320)))

(declare-fun b!707854 () Bool)

(declare-fun e!398321 () Bool)

(assert (=> b!707854 (= e!398320 e!398321)))

(declare-fun res!471548 () Bool)

(assert (=> b!707854 (=> (not res!471548) (not e!398321))))

(assert (=> b!707854 (= res!471548 (not (contains!3918 (t!19540 acc!652) (h!14310 acc!652))))))

(declare-fun b!707855 () Bool)

(assert (=> b!707855 (= e!398321 (noDuplicate!1192 (t!19540 acc!652)))))

(assert (= (and d!96639 (not res!471547)) b!707854))

(assert (= (and b!707854 res!471548) b!707855))

(declare-fun m!665847 () Bool)

(assert (=> b!707854 m!665847))

(declare-fun m!665849 () Bool)

(assert (=> b!707855 m!665849))

(assert (=> b!707640 d!96639))

(declare-fun b!707905 () Bool)

(declare-fun e!398363 () List!13266)

(assert (=> b!707905 (= e!398363 Nil!13263)))

(declare-fun bm!34371 () Bool)

(declare-fun call!34374 () List!13266)

(assert (=> bm!34371 (= call!34374 (-!350 (t!19540 newAcc!49) k0!2824))))

(declare-fun b!707907 () Bool)

(declare-fun e!398365 () List!13266)

(assert (=> b!707907 (= e!398365 (Cons!13262 (h!14310 newAcc!49) call!34374))))

(declare-fun lt!318128 () List!13266)

(declare-fun b!707908 () Bool)

(declare-fun e!398364 () Bool)

(assert (=> b!707908 (= e!398364 (= (content!332 lt!318128) ((_ map and) (content!332 newAcc!49) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2824 true)))))))

(declare-fun b!707909 () Bool)

(assert (=> b!707909 (= e!398363 e!398365)))

(declare-fun c!78532 () Bool)

(assert (=> b!707909 (= c!78532 (= k0!2824 (h!14310 newAcc!49)))))

(declare-fun d!96641 () Bool)

(assert (=> d!96641 e!398364))

(declare-fun res!471578 () Bool)

(assert (=> d!96641 (=> (not res!471578) (not e!398364))))

(declare-fun size!19706 (List!13266) Int)

(assert (=> d!96641 (= res!471578 (<= (size!19706 lt!318128) (size!19706 newAcc!49)))))

(assert (=> d!96641 (= lt!318128 e!398363)))

(declare-fun c!78533 () Bool)

(assert (=> d!96641 (= c!78533 ((_ is Cons!13262) newAcc!49))))

(assert (=> d!96641 (= (-!350 newAcc!49 k0!2824) lt!318128)))

(declare-fun b!707906 () Bool)

(assert (=> b!707906 (= e!398365 call!34374)))

(assert (= (and d!96641 c!78533) b!707909))

(assert (= (and d!96641 (not c!78533)) b!707905))

(assert (= (and b!707909 c!78532) b!707906))

(assert (= (and b!707909 (not c!78532)) b!707907))

(assert (= (or b!707906 b!707907) bm!34371))

(assert (= (and d!96641 res!471578) b!707908))

(declare-fun m!665891 () Bool)

(assert (=> bm!34371 m!665891))

(declare-fun m!665893 () Bool)

(assert (=> b!707908 m!665893))

(assert (=> b!707908 m!665775))

(declare-fun m!665895 () Bool)

(assert (=> b!707908 m!665895))

(declare-fun m!665897 () Bool)

(assert (=> d!96641 m!665897))

(declare-fun m!665899 () Bool)

(assert (=> d!96641 m!665899))

(assert (=> b!707644 d!96641))

(declare-fun d!96667 () Bool)

(declare-fun lt!318130 () Bool)

(assert (=> d!96667 (= lt!318130 (select (content!332 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398369 () Bool)

(assert (=> d!96667 (= lt!318130 e!398369)))

(declare-fun res!471581 () Bool)

(assert (=> d!96667 (=> (not res!471581) (not e!398369))))

(assert (=> d!96667 (= res!471581 ((_ is Cons!13262) newAcc!49))))

(assert (=> d!96667 (= (contains!3918 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318130)))

(declare-fun b!707912 () Bool)

(declare-fun e!398368 () Bool)

(assert (=> b!707912 (= e!398369 e!398368)))

(declare-fun res!471582 () Bool)

(assert (=> b!707912 (=> res!471582 e!398368)))

(assert (=> b!707912 (= res!471582 (= (h!14310 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!707913 () Bool)

(assert (=> b!707913 (= e!398368 (contains!3918 (t!19540 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96667 res!471581) b!707912))

(assert (= (and b!707912 (not res!471582)) b!707913))

(assert (=> d!96667 m!665775))

(declare-fun m!665905 () Bool)

(assert (=> d!96667 m!665905))

(declare-fun m!665907 () Bool)

(assert (=> b!707913 m!665907))

(assert (=> b!707643 d!96667))

(declare-fun d!96673 () Bool)

(declare-fun lt!318131 () Bool)

(assert (=> d!96673 (= lt!318131 (select (content!332 acc!652) k0!2824))))

(declare-fun e!398373 () Bool)

(assert (=> d!96673 (= lt!318131 e!398373)))

(declare-fun res!471585 () Bool)

(assert (=> d!96673 (=> (not res!471585) (not e!398373))))

(assert (=> d!96673 (= res!471585 ((_ is Cons!13262) acc!652))))

(assert (=> d!96673 (= (contains!3918 acc!652 k0!2824) lt!318131)))

(declare-fun b!707916 () Bool)

(declare-fun e!398372 () Bool)

(assert (=> b!707916 (= e!398373 e!398372)))

(declare-fun res!471586 () Bool)

(assert (=> b!707916 (=> res!471586 e!398372)))

(assert (=> b!707916 (= res!471586 (= (h!14310 acc!652) k0!2824))))

(declare-fun b!707917 () Bool)

(assert (=> b!707917 (= e!398372 (contains!3918 (t!19540 acc!652) k0!2824))))

(assert (= (and d!96673 res!471585) b!707916))

(assert (= (and b!707916 (not res!471586)) b!707917))

(assert (=> d!96673 m!665783))

(declare-fun m!665913 () Bool)

(assert (=> d!96673 m!665913))

(declare-fun m!665915 () Bool)

(assert (=> b!707917 m!665915))

(assert (=> b!707653 d!96673))

(declare-fun d!96677 () Bool)

(assert (=> d!96677 (= (validKeyInArray!0 k0!2824) (and (not (= k0!2824 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2824 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!707646 d!96677))

(declare-fun d!96679 () Bool)

(declare-fun lt!318132 () Bool)

(assert (=> d!96679 (= lt!318132 (select (content!332 newAcc!49) k0!2824))))

(declare-fun e!398375 () Bool)

(assert (=> d!96679 (= lt!318132 e!398375)))

(declare-fun res!471587 () Bool)

(assert (=> d!96679 (=> (not res!471587) (not e!398375))))

(assert (=> d!96679 (= res!471587 ((_ is Cons!13262) newAcc!49))))

(assert (=> d!96679 (= (contains!3918 newAcc!49 k0!2824) lt!318132)))

(declare-fun b!707918 () Bool)

(declare-fun e!398374 () Bool)

(assert (=> b!707918 (= e!398375 e!398374)))

(declare-fun res!471588 () Bool)

(assert (=> b!707918 (=> res!471588 e!398374)))

(assert (=> b!707918 (= res!471588 (= (h!14310 newAcc!49) k0!2824))))

(declare-fun b!707919 () Bool)

(assert (=> b!707919 (= e!398374 (contains!3918 (t!19540 newAcc!49) k0!2824))))

(assert (= (and d!96679 res!471587) b!707918))

(assert (= (and b!707918 (not res!471588)) b!707919))

(assert (=> d!96679 m!665775))

(declare-fun m!665917 () Bool)

(assert (=> d!96679 m!665917))

(declare-fun m!665919 () Bool)

(assert (=> b!707919 m!665919))

(assert (=> b!707645 d!96679))

(check-sat (not d!96673) (not b!707771) (not d!96679) (not b!707761) (not b!707776) (not b!707908) (not b!707917) (not b!707913) (not b!707778) (not b!707779) (not b!707767) (not b!707811) (not b!707847) (not b!707769) (not d!96603) (not d!96641) (not b!707777) (not b!707919) (not bm!34371) (not d!96597) (not b!707810) (not b!707846) (not bm!34365) (not b!707854) (not b!707848) (not d!96667) (not b!707855) (not d!96601))
(check-sat)
