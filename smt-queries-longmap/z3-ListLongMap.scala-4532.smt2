; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62702 () Bool)

(assert start!62702)

(declare-fun b!707533 () Bool)

(declare-fun res!471451 () Bool)

(declare-fun e!398135 () Bool)

(assert (=> b!707533 (=> (not res!471451) (not e!398135))))

(declare-datatypes ((List!13405 0))(
  ( (Nil!13402) (Cons!13401 (h!14446 (_ BitVec 64)) (t!19681 List!13405)) )
))
(declare-fun newAcc!49 () List!13405)

(declare-fun contains!3927 (List!13405 (_ BitVec 64)) Bool)

(assert (=> b!707533 (= res!471451 (not (contains!3927 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707534 () Bool)

(declare-fun res!471453 () Bool)

(assert (=> b!707534 (=> (not res!471453) (not e!398135))))

(declare-datatypes ((array!40341 0))(
  ( (array!40342 (arr!19325 (Array (_ BitVec 32) (_ BitVec 64))) (size!19710 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40341)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40341 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!707534 (= res!471453 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun res!471454 () Bool)

(assert (=> start!62702 (=> (not res!471454) (not e!398135))))

(assert (=> start!62702 (= res!471454 (and (bvslt (size!19710 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19710 a!3591))))))

(assert (=> start!62702 e!398135))

(assert (=> start!62702 true))

(declare-fun array_inv!15208 (array!40341) Bool)

(assert (=> start!62702 (array_inv!15208 a!3591)))

(declare-fun b!707535 () Bool)

(declare-fun res!471455 () Bool)

(assert (=> b!707535 (=> (not res!471455) (not e!398135))))

(declare-fun acc!652 () List!13405)

(assert (=> b!707535 (= res!471455 (not (contains!3927 acc!652 k0!2824)))))

(declare-fun b!707536 () Bool)

(declare-fun res!471449 () Bool)

(assert (=> b!707536 (=> (not res!471449) (not e!398135))))

(declare-fun subseq!389 (List!13405 List!13405) Bool)

(assert (=> b!707536 (= res!471449 (subseq!389 acc!652 newAcc!49))))

(declare-fun b!707537 () Bool)

(declare-fun res!471457 () Bool)

(assert (=> b!707537 (=> (not res!471457) (not e!398135))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!707537 (= res!471457 (validKeyInArray!0 (select (arr!19325 a!3591) from!2969)))))

(declare-fun b!707538 () Bool)

(declare-fun res!471456 () Bool)

(assert (=> b!707538 (=> (not res!471456) (not e!398135))))

(declare-fun noDuplicate!1196 (List!13405) Bool)

(assert (=> b!707538 (= res!471456 (noDuplicate!1196 acc!652))))

(declare-fun b!707539 () Bool)

(declare-fun res!471460 () Bool)

(assert (=> b!707539 (=> (not res!471460) (not e!398135))))

(assert (=> b!707539 (= res!471460 (contains!3927 newAcc!49 k0!2824))))

(declare-fun b!707540 () Bool)

(declare-fun res!471464 () Bool)

(assert (=> b!707540 (=> (not res!471464) (not e!398135))))

(assert (=> b!707540 (= res!471464 (not (contains!3927 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707541 () Bool)

(declare-fun res!471458 () Bool)

(assert (=> b!707541 (=> (not res!471458) (not e!398135))))

(assert (=> b!707541 (= res!471458 (validKeyInArray!0 k0!2824))))

(declare-fun b!707542 () Bool)

(declare-fun res!471452 () Bool)

(assert (=> b!707542 (=> (not res!471452) (not e!398135))))

(declare-fun arrayNoDuplicates!0 (array!40341 (_ BitVec 32) List!13405) Bool)

(assert (=> b!707542 (= res!471452 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!707543 () Bool)

(declare-fun res!471461 () Bool)

(assert (=> b!707543 (=> (not res!471461) (not e!398135))))

(assert (=> b!707543 (= res!471461 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!707544 () Bool)

(declare-fun res!471465 () Bool)

(assert (=> b!707544 (=> (not res!471465) (not e!398135))))

(assert (=> b!707544 (= res!471465 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19710 a!3591)))))

(declare-fun b!707545 () Bool)

(declare-fun res!471466 () Bool)

(assert (=> b!707545 (=> (not res!471466) (not e!398135))))

(assert (=> b!707545 (= res!471466 (not (contains!3927 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707546 () Bool)

(declare-fun res!471459 () Bool)

(assert (=> b!707546 (=> (not res!471459) (not e!398135))))

(assert (=> b!707546 (= res!471459 (not (contains!3927 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707547 () Bool)

(declare-fun res!471450 () Bool)

(assert (=> b!707547 (=> (not res!471450) (not e!398135))))

(declare-fun -!354 (List!13405 (_ BitVec 64)) List!13405)

(assert (=> b!707547 (= res!471450 (= (-!354 newAcc!49 k0!2824) acc!652))))

(declare-fun b!707548 () Bool)

(declare-fun res!471462 () Bool)

(assert (=> b!707548 (=> (not res!471462) (not e!398135))))

(assert (=> b!707548 (= res!471462 (noDuplicate!1196 newAcc!49))))

(declare-fun b!707549 () Bool)

(declare-fun res!471463 () Bool)

(assert (=> b!707549 (=> (not res!471463) (not e!398135))))

(declare-fun $colon$colon!499 (List!13405 (_ BitVec 64)) List!13405)

(assert (=> b!707549 (= res!471463 (noDuplicate!1196 ($colon$colon!499 acc!652 (select (arr!19325 a!3591) from!2969))))))

(declare-fun b!707550 () Bool)

(assert (=> b!707550 (= e!398135 (not (noDuplicate!1196 ($colon$colon!499 newAcc!49 (select (arr!19325 a!3591) from!2969)))))))

(assert (= (and start!62702 res!471454) b!707538))

(assert (= (and b!707538 res!471456) b!707548))

(assert (= (and b!707548 res!471462) b!707545))

(assert (= (and b!707545 res!471466) b!707540))

(assert (= (and b!707540 res!471464) b!707534))

(assert (= (and b!707534 res!471453) b!707535))

(assert (= (and b!707535 res!471455) b!707541))

(assert (= (and b!707541 res!471458) b!707542))

(assert (= (and b!707542 res!471452) b!707536))

(assert (= (and b!707536 res!471449) b!707539))

(assert (= (and b!707539 res!471460) b!707547))

(assert (= (and b!707547 res!471450) b!707533))

(assert (= (and b!707533 res!471451) b!707546))

(assert (= (and b!707546 res!471459) b!707544))

(assert (= (and b!707544 res!471465) b!707537))

(assert (= (and b!707537 res!471457) b!707543))

(assert (= (and b!707543 res!471461) b!707549))

(assert (= (and b!707549 res!471463) b!707550))

(declare-fun m!664539 () Bool)

(assert (=> b!707542 m!664539))

(declare-fun m!664541 () Bool)

(assert (=> b!707539 m!664541))

(declare-fun m!664543 () Bool)

(assert (=> b!707536 m!664543))

(declare-fun m!664545 () Bool)

(assert (=> b!707533 m!664545))

(declare-fun m!664547 () Bool)

(assert (=> b!707541 m!664547))

(declare-fun m!664549 () Bool)

(assert (=> b!707548 m!664549))

(declare-fun m!664551 () Bool)

(assert (=> b!707549 m!664551))

(assert (=> b!707549 m!664551))

(declare-fun m!664553 () Bool)

(assert (=> b!707549 m!664553))

(assert (=> b!707549 m!664553))

(declare-fun m!664555 () Bool)

(assert (=> b!707549 m!664555))

(assert (=> b!707537 m!664551))

(assert (=> b!707537 m!664551))

(declare-fun m!664557 () Bool)

(assert (=> b!707537 m!664557))

(assert (=> b!707550 m!664551))

(assert (=> b!707550 m!664551))

(declare-fun m!664559 () Bool)

(assert (=> b!707550 m!664559))

(assert (=> b!707550 m!664559))

(declare-fun m!664561 () Bool)

(assert (=> b!707550 m!664561))

(declare-fun m!664563 () Bool)

(assert (=> b!707546 m!664563))

(declare-fun m!664565 () Bool)

(assert (=> b!707538 m!664565))

(declare-fun m!664567 () Bool)

(assert (=> b!707534 m!664567))

(declare-fun m!664569 () Bool)

(assert (=> b!707547 m!664569))

(declare-fun m!664571 () Bool)

(assert (=> b!707540 m!664571))

(declare-fun m!664573 () Bool)

(assert (=> start!62702 m!664573))

(declare-fun m!664575 () Bool)

(assert (=> b!707545 m!664575))

(declare-fun m!664577 () Bool)

(assert (=> b!707535 m!664577))

(check-sat (not start!62702) (not b!707540) (not b!707537) (not b!707550) (not b!707536) (not b!707548) (not b!707535) (not b!707545) (not b!707541) (not b!707546) (not b!707533) (not b!707547) (not b!707542) (not b!707538) (not b!707534) (not b!707539) (not b!707549))
(check-sat)
(get-model)

(declare-fun d!96395 () Bool)

(declare-fun res!471579 () Bool)

(declare-fun e!398152 () Bool)

(assert (=> d!96395 (=> res!471579 e!398152)))

(get-info :version)

(assert (=> d!96395 (= res!471579 ((_ is Nil!13402) newAcc!49))))

(assert (=> d!96395 (= (noDuplicate!1196 newAcc!49) e!398152)))

(declare-fun b!707663 () Bool)

(declare-fun e!398153 () Bool)

(assert (=> b!707663 (= e!398152 e!398153)))

(declare-fun res!471580 () Bool)

(assert (=> b!707663 (=> (not res!471580) (not e!398153))))

(assert (=> b!707663 (= res!471580 (not (contains!3927 (t!19681 newAcc!49) (h!14446 newAcc!49))))))

(declare-fun b!707664 () Bool)

(assert (=> b!707664 (= e!398153 (noDuplicate!1196 (t!19681 newAcc!49)))))

(assert (= (and d!96395 (not res!471579)) b!707663))

(assert (= (and b!707663 res!471580) b!707664))

(declare-fun m!664659 () Bool)

(assert (=> b!707663 m!664659))

(declare-fun m!664661 () Bool)

(assert (=> b!707664 m!664661))

(assert (=> b!707548 d!96395))

(declare-fun d!96397 () Bool)

(assert (=> d!96397 (= (validKeyInArray!0 (select (arr!19325 a!3591) from!2969)) (and (not (= (select (arr!19325 a!3591) from!2969) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19325 a!3591) from!2969) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!707537 d!96397))

(declare-fun b!707675 () Bool)

(declare-fun e!398162 () List!13405)

(assert (=> b!707675 (= e!398162 Nil!13402)))

(declare-fun bm!34348 () Bool)

(declare-fun call!34351 () List!13405)

(assert (=> bm!34348 (= call!34351 (-!354 (t!19681 newAcc!49) k0!2824))))

(declare-fun d!96399 () Bool)

(declare-fun e!398163 () Bool)

(assert (=> d!96399 e!398163))

(declare-fun res!471583 () Bool)

(assert (=> d!96399 (=> (not res!471583) (not e!398163))))

(declare-fun lt!317787 () List!13405)

(declare-fun size!19713 (List!13405) Int)

(assert (=> d!96399 (= res!471583 (<= (size!19713 lt!317787) (size!19713 newAcc!49)))))

(assert (=> d!96399 (= lt!317787 e!398162)))

(declare-fun c!78414 () Bool)

(assert (=> d!96399 (= c!78414 ((_ is Cons!13401) newAcc!49))))

(assert (=> d!96399 (= (-!354 newAcc!49 k0!2824) lt!317787)))

(declare-fun b!707676 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!334 (List!13405) (InoxSet (_ BitVec 64)))

(assert (=> b!707676 (= e!398163 (= (content!334 lt!317787) ((_ map and) (content!334 newAcc!49) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2824 true)))))))

(declare-fun b!707677 () Bool)

(declare-fun e!398161 () List!13405)

(assert (=> b!707677 (= e!398162 e!398161)))

(declare-fun c!78413 () Bool)

(assert (=> b!707677 (= c!78413 (= k0!2824 (h!14446 newAcc!49)))))

(declare-fun b!707678 () Bool)

(assert (=> b!707678 (= e!398161 (Cons!13401 (h!14446 newAcc!49) call!34351))))

(declare-fun b!707679 () Bool)

(assert (=> b!707679 (= e!398161 call!34351)))

(assert (= (and d!96399 c!78414) b!707677))

(assert (= (and d!96399 (not c!78414)) b!707675))

(assert (= (and b!707677 c!78413) b!707679))

(assert (= (and b!707677 (not c!78413)) b!707678))

(assert (= (or b!707679 b!707678) bm!34348))

(assert (= (and d!96399 res!471583) b!707676))

(declare-fun m!664663 () Bool)

(assert (=> bm!34348 m!664663))

(declare-fun m!664665 () Bool)

(assert (=> d!96399 m!664665))

(declare-fun m!664667 () Bool)

(assert (=> d!96399 m!664667))

(declare-fun m!664669 () Bool)

(assert (=> b!707676 m!664669))

(declare-fun m!664671 () Bool)

(assert (=> b!707676 m!664671))

(declare-fun m!664673 () Bool)

(assert (=> b!707676 m!664673))

(assert (=> b!707547 d!96399))

(declare-fun b!707690 () Bool)

(declare-fun e!398175 () Bool)

(assert (=> b!707690 (= e!398175 (subseq!389 (t!19681 acc!652) (t!19681 newAcc!49)))))

(declare-fun b!707688 () Bool)

(declare-fun e!398174 () Bool)

(declare-fun e!398173 () Bool)

(assert (=> b!707688 (= e!398174 e!398173)))

(declare-fun res!471592 () Bool)

(assert (=> b!707688 (=> (not res!471592) (not e!398173))))

(assert (=> b!707688 (= res!471592 ((_ is Cons!13401) newAcc!49))))

(declare-fun b!707689 () Bool)

(declare-fun e!398172 () Bool)

(assert (=> b!707689 (= e!398173 e!398172)))

(declare-fun res!471593 () Bool)

(assert (=> b!707689 (=> res!471593 e!398172)))

(assert (=> b!707689 (= res!471593 e!398175)))

(declare-fun res!471594 () Bool)

(assert (=> b!707689 (=> (not res!471594) (not e!398175))))

(assert (=> b!707689 (= res!471594 (= (h!14446 acc!652) (h!14446 newAcc!49)))))

(declare-fun b!707691 () Bool)

(assert (=> b!707691 (= e!398172 (subseq!389 acc!652 (t!19681 newAcc!49)))))

(declare-fun d!96401 () Bool)

(declare-fun res!471595 () Bool)

(assert (=> d!96401 (=> res!471595 e!398174)))

(assert (=> d!96401 (= res!471595 ((_ is Nil!13402) acc!652))))

(assert (=> d!96401 (= (subseq!389 acc!652 newAcc!49) e!398174)))

(assert (= (and d!96401 (not res!471595)) b!707688))

(assert (= (and b!707688 res!471592) b!707689))

(assert (= (and b!707689 res!471594) b!707690))

(assert (= (and b!707689 (not res!471593)) b!707691))

(declare-fun m!664675 () Bool)

(assert (=> b!707690 m!664675))

(declare-fun m!664677 () Bool)

(assert (=> b!707691 m!664677))

(assert (=> b!707536 d!96401))

(declare-fun d!96403 () Bool)

(declare-fun lt!317790 () Bool)

(assert (=> d!96403 (= lt!317790 (select (content!334 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398181 () Bool)

(assert (=> d!96403 (= lt!317790 e!398181)))

(declare-fun res!471600 () Bool)

(assert (=> d!96403 (=> (not res!471600) (not e!398181))))

(assert (=> d!96403 (= res!471600 ((_ is Cons!13401) newAcc!49))))

(assert (=> d!96403 (= (contains!3927 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000) lt!317790)))

(declare-fun b!707696 () Bool)

(declare-fun e!398180 () Bool)

(assert (=> b!707696 (= e!398181 e!398180)))

(declare-fun res!471601 () Bool)

(assert (=> b!707696 (=> res!471601 e!398180)))

(assert (=> b!707696 (= res!471601 (= (h!14446 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!707697 () Bool)

(assert (=> b!707697 (= e!398180 (contains!3927 (t!19681 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96403 res!471600) b!707696))

(assert (= (and b!707696 (not res!471601)) b!707697))

(assert (=> d!96403 m!664671))

(declare-fun m!664679 () Bool)

(assert (=> d!96403 m!664679))

(declare-fun m!664681 () Bool)

(assert (=> b!707697 m!664681))

(assert (=> b!707546 d!96403))

(declare-fun d!96405 () Bool)

(declare-fun lt!317791 () Bool)

(assert (=> d!96405 (= lt!317791 (select (content!334 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398183 () Bool)

(assert (=> d!96405 (= lt!317791 e!398183)))

(declare-fun res!471602 () Bool)

(assert (=> d!96405 (=> (not res!471602) (not e!398183))))

(assert (=> d!96405 (= res!471602 ((_ is Cons!13401) acc!652))))

(assert (=> d!96405 (= (contains!3927 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000) lt!317791)))

(declare-fun b!707698 () Bool)

(declare-fun e!398182 () Bool)

(assert (=> b!707698 (= e!398183 e!398182)))

(declare-fun res!471603 () Bool)

(assert (=> b!707698 (=> res!471603 e!398182)))

(assert (=> b!707698 (= res!471603 (= (h!14446 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!707699 () Bool)

(assert (=> b!707699 (= e!398182 (contains!3927 (t!19681 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96405 res!471602) b!707698))

(assert (= (and b!707698 (not res!471603)) b!707699))

(declare-fun m!664683 () Bool)

(assert (=> d!96405 m!664683))

(declare-fun m!664685 () Bool)

(assert (=> d!96405 m!664685))

(declare-fun m!664687 () Bool)

(assert (=> b!707699 m!664687))

(assert (=> b!707540 d!96405))

(declare-fun d!96407 () Bool)

(declare-fun res!471604 () Bool)

(declare-fun e!398184 () Bool)

(assert (=> d!96407 (=> res!471604 e!398184)))

(assert (=> d!96407 (= res!471604 ((_ is Nil!13402) ($colon$colon!499 newAcc!49 (select (arr!19325 a!3591) from!2969))))))

(assert (=> d!96407 (= (noDuplicate!1196 ($colon$colon!499 newAcc!49 (select (arr!19325 a!3591) from!2969))) e!398184)))

(declare-fun b!707700 () Bool)

(declare-fun e!398185 () Bool)

(assert (=> b!707700 (= e!398184 e!398185)))

(declare-fun res!471605 () Bool)

(assert (=> b!707700 (=> (not res!471605) (not e!398185))))

(assert (=> b!707700 (= res!471605 (not (contains!3927 (t!19681 ($colon$colon!499 newAcc!49 (select (arr!19325 a!3591) from!2969))) (h!14446 ($colon$colon!499 newAcc!49 (select (arr!19325 a!3591) from!2969))))))))

(declare-fun b!707701 () Bool)

(assert (=> b!707701 (= e!398185 (noDuplicate!1196 (t!19681 ($colon$colon!499 newAcc!49 (select (arr!19325 a!3591) from!2969)))))))

(assert (= (and d!96407 (not res!471604)) b!707700))

(assert (= (and b!707700 res!471605) b!707701))

(declare-fun m!664689 () Bool)

(assert (=> b!707700 m!664689))

(declare-fun m!664691 () Bool)

(assert (=> b!707701 m!664691))

(assert (=> b!707550 d!96407))

(declare-fun d!96409 () Bool)

(assert (=> d!96409 (= ($colon$colon!499 newAcc!49 (select (arr!19325 a!3591) from!2969)) (Cons!13401 (select (arr!19325 a!3591) from!2969) newAcc!49))))

(assert (=> b!707550 d!96409))

(declare-fun d!96411 () Bool)

(declare-fun lt!317792 () Bool)

(assert (=> d!96411 (= lt!317792 (select (content!334 newAcc!49) k0!2824))))

(declare-fun e!398187 () Bool)

(assert (=> d!96411 (= lt!317792 e!398187)))

(declare-fun res!471606 () Bool)

(assert (=> d!96411 (=> (not res!471606) (not e!398187))))

(assert (=> d!96411 (= res!471606 ((_ is Cons!13401) newAcc!49))))

(assert (=> d!96411 (= (contains!3927 newAcc!49 k0!2824) lt!317792)))

(declare-fun b!707702 () Bool)

(declare-fun e!398186 () Bool)

(assert (=> b!707702 (= e!398187 e!398186)))

(declare-fun res!471607 () Bool)

(assert (=> b!707702 (=> res!471607 e!398186)))

(assert (=> b!707702 (= res!471607 (= (h!14446 newAcc!49) k0!2824))))

(declare-fun b!707703 () Bool)

(assert (=> b!707703 (= e!398186 (contains!3927 (t!19681 newAcc!49) k0!2824))))

(assert (= (and d!96411 res!471606) b!707702))

(assert (= (and b!707702 (not res!471607)) b!707703))

(assert (=> d!96411 m!664671))

(declare-fun m!664693 () Bool)

(assert (=> d!96411 m!664693))

(declare-fun m!664695 () Bool)

(assert (=> b!707703 m!664695))

(assert (=> b!707539 d!96411))

(declare-fun d!96413 () Bool)

(declare-fun res!471608 () Bool)

(declare-fun e!398188 () Bool)

(assert (=> d!96413 (=> res!471608 e!398188)))

(assert (=> d!96413 (= res!471608 ((_ is Nil!13402) ($colon$colon!499 acc!652 (select (arr!19325 a!3591) from!2969))))))

(assert (=> d!96413 (= (noDuplicate!1196 ($colon$colon!499 acc!652 (select (arr!19325 a!3591) from!2969))) e!398188)))

(declare-fun b!707704 () Bool)

(declare-fun e!398189 () Bool)

(assert (=> b!707704 (= e!398188 e!398189)))

(declare-fun res!471609 () Bool)

(assert (=> b!707704 (=> (not res!471609) (not e!398189))))

(assert (=> b!707704 (= res!471609 (not (contains!3927 (t!19681 ($colon$colon!499 acc!652 (select (arr!19325 a!3591) from!2969))) (h!14446 ($colon$colon!499 acc!652 (select (arr!19325 a!3591) from!2969))))))))

(declare-fun b!707705 () Bool)

(assert (=> b!707705 (= e!398189 (noDuplicate!1196 (t!19681 ($colon$colon!499 acc!652 (select (arr!19325 a!3591) from!2969)))))))

(assert (= (and d!96413 (not res!471608)) b!707704))

(assert (= (and b!707704 res!471609) b!707705))

(declare-fun m!664697 () Bool)

(assert (=> b!707704 m!664697))

(declare-fun m!664699 () Bool)

(assert (=> b!707705 m!664699))

(assert (=> b!707549 d!96413))

(declare-fun d!96415 () Bool)

(assert (=> d!96415 (= ($colon$colon!499 acc!652 (select (arr!19325 a!3591) from!2969)) (Cons!13401 (select (arr!19325 a!3591) from!2969) acc!652))))

(assert (=> b!707549 d!96415))

(declare-fun d!96417 () Bool)

(declare-fun res!471610 () Bool)

(declare-fun e!398190 () Bool)

(assert (=> d!96417 (=> res!471610 e!398190)))

(assert (=> d!96417 (= res!471610 ((_ is Nil!13402) acc!652))))

(assert (=> d!96417 (= (noDuplicate!1196 acc!652) e!398190)))

(declare-fun b!707706 () Bool)

(declare-fun e!398191 () Bool)

(assert (=> b!707706 (= e!398190 e!398191)))

(declare-fun res!471611 () Bool)

(assert (=> b!707706 (=> (not res!471611) (not e!398191))))

(assert (=> b!707706 (= res!471611 (not (contains!3927 (t!19681 acc!652) (h!14446 acc!652))))))

(declare-fun b!707707 () Bool)

(assert (=> b!707707 (= e!398191 (noDuplicate!1196 (t!19681 acc!652)))))

(assert (= (and d!96417 (not res!471610)) b!707706))

(assert (= (and b!707706 res!471611) b!707707))

(declare-fun m!664701 () Bool)

(assert (=> b!707706 m!664701))

(declare-fun m!664703 () Bool)

(assert (=> b!707707 m!664703))

(assert (=> b!707538 d!96417))

(declare-fun d!96419 () Bool)

(assert (=> d!96419 (= (array_inv!15208 a!3591) (bvsge (size!19710 a!3591) #b00000000000000000000000000000000))))

(assert (=> start!62702 d!96419))

(declare-fun b!707730 () Bool)

(declare-fun e!398213 () Bool)

(declare-fun call!34354 () Bool)

(assert (=> b!707730 (= e!398213 call!34354)))

(declare-fun d!96421 () Bool)

(declare-fun res!471631 () Bool)

(declare-fun e!398214 () Bool)

(assert (=> d!96421 (=> res!471631 e!398214)))

(assert (=> d!96421 (= res!471631 (bvsge from!2969 (size!19710 a!3591)))))

(assert (=> d!96421 (= (arrayNoDuplicates!0 a!3591 from!2969 acc!652) e!398214)))

(declare-fun c!78417 () Bool)

(declare-fun bm!34351 () Bool)

(assert (=> bm!34351 (= call!34354 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78417 (Cons!13401 (select (arr!19325 a!3591) from!2969) acc!652) acc!652)))))

(declare-fun b!707731 () Bool)

(declare-fun e!398212 () Bool)

(assert (=> b!707731 (= e!398212 e!398213)))

(assert (=> b!707731 (= c!78417 (validKeyInArray!0 (select (arr!19325 a!3591) from!2969)))))

(declare-fun b!707732 () Bool)

(assert (=> b!707732 (= e!398213 call!34354)))

(declare-fun e!398215 () Bool)

(declare-fun b!707733 () Bool)

(assert (=> b!707733 (= e!398215 (contains!3927 acc!652 (select (arr!19325 a!3591) from!2969)))))

(declare-fun b!707734 () Bool)

(assert (=> b!707734 (= e!398214 e!398212)))

(declare-fun res!471630 () Bool)

(assert (=> b!707734 (=> (not res!471630) (not e!398212))))

(assert (=> b!707734 (= res!471630 (not e!398215))))

(declare-fun res!471632 () Bool)

(assert (=> b!707734 (=> (not res!471632) (not e!398215))))

(assert (=> b!707734 (= res!471632 (validKeyInArray!0 (select (arr!19325 a!3591) from!2969)))))

(assert (= (and d!96421 (not res!471631)) b!707734))

(assert (= (and b!707734 res!471632) b!707733))

(assert (= (and b!707734 res!471630) b!707731))

(assert (= (and b!707731 c!78417) b!707732))

(assert (= (and b!707731 (not c!78417)) b!707730))

(assert (= (or b!707732 b!707730) bm!34351))

(assert (=> bm!34351 m!664551))

(declare-fun m!664715 () Bool)

(assert (=> bm!34351 m!664715))

(assert (=> b!707731 m!664551))

(assert (=> b!707731 m!664551))

(assert (=> b!707731 m!664557))

(assert (=> b!707733 m!664551))

(assert (=> b!707733 m!664551))

(declare-fun m!664717 () Bool)

(assert (=> b!707733 m!664717))

(assert (=> b!707734 m!664551))

(assert (=> b!707734 m!664551))

(assert (=> b!707734 m!664557))

(assert (=> b!707542 d!96421))

(declare-fun d!96433 () Bool)

(assert (=> d!96433 (= (validKeyInArray!0 k0!2824) (and (not (= k0!2824 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2824 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!707541 d!96433))

(declare-fun d!96435 () Bool)

(declare-fun lt!317796 () Bool)

(assert (=> d!96435 (= lt!317796 (select (content!334 acc!652) k0!2824))))

(declare-fun e!398221 () Bool)

(assert (=> d!96435 (= lt!317796 e!398221)))

(declare-fun res!471637 () Bool)

(assert (=> d!96435 (=> (not res!471637) (not e!398221))))

(assert (=> d!96435 (= res!471637 ((_ is Cons!13401) acc!652))))

(assert (=> d!96435 (= (contains!3927 acc!652 k0!2824) lt!317796)))

(declare-fun b!707739 () Bool)

(declare-fun e!398220 () Bool)

(assert (=> b!707739 (= e!398221 e!398220)))

(declare-fun res!471638 () Bool)

(assert (=> b!707739 (=> res!471638 e!398220)))

(assert (=> b!707739 (= res!471638 (= (h!14446 acc!652) k0!2824))))

(declare-fun b!707740 () Bool)

(assert (=> b!707740 (= e!398220 (contains!3927 (t!19681 acc!652) k0!2824))))

(assert (= (and d!96435 res!471637) b!707739))

(assert (= (and b!707739 (not res!471638)) b!707740))

(assert (=> d!96435 m!664683))

(declare-fun m!664719 () Bool)

(assert (=> d!96435 m!664719))

(declare-fun m!664721 () Bool)

(assert (=> b!707740 m!664721))

(assert (=> b!707535 d!96435))

(declare-fun d!96437 () Bool)

(declare-fun lt!317797 () Bool)

(assert (=> d!96437 (= lt!317797 (select (content!334 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398225 () Bool)

(assert (=> d!96437 (= lt!317797 e!398225)))

(declare-fun res!471641 () Bool)

(assert (=> d!96437 (=> (not res!471641) (not e!398225))))

(assert (=> d!96437 (= res!471641 ((_ is Cons!13401) acc!652))))

(assert (=> d!96437 (= (contains!3927 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000) lt!317797)))

(declare-fun b!707743 () Bool)

(declare-fun e!398224 () Bool)

(assert (=> b!707743 (= e!398225 e!398224)))

(declare-fun res!471642 () Bool)

(assert (=> b!707743 (=> res!471642 e!398224)))

(assert (=> b!707743 (= res!471642 (= (h!14446 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!707744 () Bool)

(assert (=> b!707744 (= e!398224 (contains!3927 (t!19681 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96437 res!471641) b!707743))

(assert (= (and b!707743 (not res!471642)) b!707744))

(assert (=> d!96437 m!664683))

(declare-fun m!664725 () Bool)

(assert (=> d!96437 m!664725))

(declare-fun m!664729 () Bool)

(assert (=> b!707744 m!664729))

(assert (=> b!707545 d!96437))

(declare-fun d!96441 () Bool)

(declare-fun res!471657 () Bool)

(declare-fun e!398242 () Bool)

(assert (=> d!96441 (=> res!471657 e!398242)))

(assert (=> d!96441 (= res!471657 (= (select (arr!19325 a!3591) from!2969) k0!2824))))

(assert (=> d!96441 (= (arrayContainsKey!0 a!3591 k0!2824 from!2969) e!398242)))

(declare-fun b!707763 () Bool)

(declare-fun e!398243 () Bool)

(assert (=> b!707763 (= e!398242 e!398243)))

(declare-fun res!471658 () Bool)

(assert (=> b!707763 (=> (not res!471658) (not e!398243))))

(assert (=> b!707763 (= res!471658 (bvslt (bvadd from!2969 #b00000000000000000000000000000001) (size!19710 a!3591)))))

(declare-fun b!707764 () Bool)

(assert (=> b!707764 (= e!398243 (arrayContainsKey!0 a!3591 k0!2824 (bvadd from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!96441 (not res!471657)) b!707763))

(assert (= (and b!707763 res!471658) b!707764))

(assert (=> d!96441 m!664551))

(declare-fun m!664741 () Bool)

(assert (=> b!707764 m!664741))

(assert (=> b!707534 d!96441))

(declare-fun d!96453 () Bool)

(declare-fun lt!317799 () Bool)

(assert (=> d!96453 (= lt!317799 (select (content!334 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398245 () Bool)

(assert (=> d!96453 (= lt!317799 e!398245)))

(declare-fun res!471659 () Bool)

(assert (=> d!96453 (=> (not res!471659) (not e!398245))))

(assert (=> d!96453 (= res!471659 ((_ is Cons!13401) newAcc!49))))

(assert (=> d!96453 (= (contains!3927 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000) lt!317799)))

(declare-fun b!707765 () Bool)

(declare-fun e!398244 () Bool)

(assert (=> b!707765 (= e!398245 e!398244)))

(declare-fun res!471660 () Bool)

(assert (=> b!707765 (=> res!471660 e!398244)))

(assert (=> b!707765 (= res!471660 (= (h!14446 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!707766 () Bool)

(assert (=> b!707766 (= e!398244 (contains!3927 (t!19681 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96453 res!471659) b!707765))

(assert (= (and b!707765 (not res!471660)) b!707766))

(assert (=> d!96453 m!664671))

(declare-fun m!664743 () Bool)

(assert (=> d!96453 m!664743))

(declare-fun m!664745 () Bool)

(assert (=> b!707766 m!664745))

(assert (=> b!707533 d!96453))

(check-sat (not b!707744) (not bm!34351) (not b!707699) (not b!707691) (not d!96453) (not b!707705) (not b!707766) (not b!707734) (not b!707697) (not b!707764) (not b!707733) (not b!707700) (not d!96437) (not b!707676) (not b!707663) (not d!96411) (not b!707703) (not d!96399) (not d!96403) (not b!707707) (not b!707706) (not d!96435) (not b!707704) (not b!707740) (not d!96405) (not b!707690) (not b!707664) (not b!707731) (not bm!34348) (not b!707701))
(check-sat)
(get-model)

(declare-fun d!96509 () Bool)

(declare-fun lt!317818 () Bool)

(assert (=> d!96509 (= lt!317818 (select (content!334 (t!19681 newAcc!49)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398353 () Bool)

(assert (=> d!96509 (= lt!317818 e!398353)))

(declare-fun res!471749 () Bool)

(assert (=> d!96509 (=> (not res!471749) (not e!398353))))

(assert (=> d!96509 (= res!471749 ((_ is Cons!13401) (t!19681 newAcc!49)))))

(assert (=> d!96509 (= (contains!3927 (t!19681 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000) lt!317818)))

(declare-fun b!707887 () Bool)

(declare-fun e!398352 () Bool)

(assert (=> b!707887 (= e!398353 e!398352)))

(declare-fun res!471750 () Bool)

(assert (=> b!707887 (=> res!471750 e!398352)))

(assert (=> b!707887 (= res!471750 (= (h!14446 (t!19681 newAcc!49)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!707888 () Bool)

(assert (=> b!707888 (= e!398352 (contains!3927 (t!19681 (t!19681 newAcc!49)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96509 res!471749) b!707887))

(assert (= (and b!707887 (not res!471750)) b!707888))

(declare-fun m!664851 () Bool)

(assert (=> d!96509 m!664851))

(declare-fun m!664853 () Bool)

(assert (=> d!96509 m!664853))

(declare-fun m!664855 () Bool)

(assert (=> b!707888 m!664855))

(assert (=> b!707697 d!96509))

(declare-fun d!96511 () Bool)

(declare-fun res!471751 () Bool)

(declare-fun e!398354 () Bool)

(assert (=> d!96511 (=> res!471751 e!398354)))

(assert (=> d!96511 (= res!471751 (= (select (arr!19325 a!3591) (bvadd from!2969 #b00000000000000000000000000000001)) k0!2824))))

(assert (=> d!96511 (= (arrayContainsKey!0 a!3591 k0!2824 (bvadd from!2969 #b00000000000000000000000000000001)) e!398354)))

(declare-fun b!707889 () Bool)

(declare-fun e!398355 () Bool)

(assert (=> b!707889 (= e!398354 e!398355)))

(declare-fun res!471752 () Bool)

(assert (=> b!707889 (=> (not res!471752) (not e!398355))))

(assert (=> b!707889 (= res!471752 (bvslt (bvadd from!2969 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!19710 a!3591)))))

(declare-fun b!707890 () Bool)

(assert (=> b!707890 (= e!398355 (arrayContainsKey!0 a!3591 k0!2824 (bvadd from!2969 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!96511 (not res!471751)) b!707889))

(assert (= (and b!707889 res!471752) b!707890))

(declare-fun m!664857 () Bool)

(assert (=> d!96511 m!664857))

(declare-fun m!664859 () Bool)

(assert (=> b!707890 m!664859))

(assert (=> b!707764 d!96511))

(declare-fun d!96513 () Bool)

(declare-fun c!78438 () Bool)

(assert (=> d!96513 (= c!78438 ((_ is Nil!13402) acc!652))))

(declare-fun e!398358 () (InoxSet (_ BitVec 64)))

(assert (=> d!96513 (= (content!334 acc!652) e!398358)))

(declare-fun b!707895 () Bool)

(assert (=> b!707895 (= e!398358 ((as const (Array (_ BitVec 64) Bool)) false))))

(declare-fun b!707896 () Bool)

(assert (=> b!707896 (= e!398358 ((_ map or) (store ((as const (Array (_ BitVec 64) Bool)) false) (h!14446 acc!652) true) (content!334 (t!19681 acc!652))))))

(assert (= (and d!96513 c!78438) b!707895))

(assert (= (and d!96513 (not c!78438)) b!707896))

(declare-fun m!664861 () Bool)

(assert (=> b!707896 m!664861))

(declare-fun m!664863 () Bool)

(assert (=> b!707896 m!664863))

(assert (=> d!96437 d!96513))

(declare-fun d!96515 () Bool)

(declare-fun c!78439 () Bool)

(assert (=> d!96515 (= c!78439 ((_ is Nil!13402) newAcc!49))))

(declare-fun e!398359 () (InoxSet (_ BitVec 64)))

(assert (=> d!96515 (= (content!334 newAcc!49) e!398359)))

(declare-fun b!707897 () Bool)

(assert (=> b!707897 (= e!398359 ((as const (Array (_ BitVec 64) Bool)) false))))

(declare-fun b!707898 () Bool)

(assert (=> b!707898 (= e!398359 ((_ map or) (store ((as const (Array (_ BitVec 64) Bool)) false) (h!14446 newAcc!49) true) (content!334 (t!19681 newAcc!49))))))

(assert (= (and d!96515 c!78439) b!707897))

(assert (= (and d!96515 (not c!78439)) b!707898))

(declare-fun m!664865 () Bool)

(assert (=> b!707898 m!664865))

(assert (=> b!707898 m!664851))

(assert (=> d!96453 d!96515))

(declare-fun d!96517 () Bool)

(declare-fun lt!317819 () Bool)

(assert (=> d!96517 (= lt!317819 (select (content!334 (t!19681 newAcc!49)) k0!2824))))

(declare-fun e!398361 () Bool)

(assert (=> d!96517 (= lt!317819 e!398361)))

(declare-fun res!471753 () Bool)

(assert (=> d!96517 (=> (not res!471753) (not e!398361))))

(assert (=> d!96517 (= res!471753 ((_ is Cons!13401) (t!19681 newAcc!49)))))

(assert (=> d!96517 (= (contains!3927 (t!19681 newAcc!49) k0!2824) lt!317819)))

(declare-fun b!707899 () Bool)

(declare-fun e!398360 () Bool)

(assert (=> b!707899 (= e!398361 e!398360)))

(declare-fun res!471754 () Bool)

(assert (=> b!707899 (=> res!471754 e!398360)))

(assert (=> b!707899 (= res!471754 (= (h!14446 (t!19681 newAcc!49)) k0!2824))))

(declare-fun b!707900 () Bool)

(assert (=> b!707900 (= e!398360 (contains!3927 (t!19681 (t!19681 newAcc!49)) k0!2824))))

(assert (= (and d!96517 res!471753) b!707899))

(assert (= (and b!707899 (not res!471754)) b!707900))

(assert (=> d!96517 m!664851))

(declare-fun m!664867 () Bool)

(assert (=> d!96517 m!664867))

(declare-fun m!664869 () Bool)

(assert (=> b!707900 m!664869))

(assert (=> b!707703 d!96517))

(declare-fun d!96519 () Bool)

(declare-fun lt!317820 () Bool)

(assert (=> d!96519 (= lt!317820 (select (content!334 (t!19681 acc!652)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398363 () Bool)

(assert (=> d!96519 (= lt!317820 e!398363)))

(declare-fun res!471755 () Bool)

(assert (=> d!96519 (=> (not res!471755) (not e!398363))))

(assert (=> d!96519 (= res!471755 ((_ is Cons!13401) (t!19681 acc!652)))))

(assert (=> d!96519 (= (contains!3927 (t!19681 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000) lt!317820)))

(declare-fun b!707901 () Bool)

(declare-fun e!398362 () Bool)

(assert (=> b!707901 (= e!398363 e!398362)))

(declare-fun res!471756 () Bool)

(assert (=> b!707901 (=> res!471756 e!398362)))

(assert (=> b!707901 (= res!471756 (= (h!14446 (t!19681 acc!652)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!707902 () Bool)

(assert (=> b!707902 (= e!398362 (contains!3927 (t!19681 (t!19681 acc!652)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96519 res!471755) b!707901))

(assert (= (and b!707901 (not res!471756)) b!707902))

(assert (=> d!96519 m!664863))

(declare-fun m!664871 () Bool)

(assert (=> d!96519 m!664871))

(declare-fun m!664873 () Bool)

(assert (=> b!707902 m!664873))

(assert (=> b!707744 d!96519))

(assert (=> d!96411 d!96515))

(assert (=> d!96403 d!96515))

(declare-fun b!707903 () Bool)

(declare-fun e!398365 () List!13405)

(assert (=> b!707903 (= e!398365 Nil!13402)))

(declare-fun bm!34364 () Bool)

(declare-fun call!34367 () List!13405)

(assert (=> bm!34364 (= call!34367 (-!354 (t!19681 (t!19681 newAcc!49)) k0!2824))))

(declare-fun d!96521 () Bool)

(declare-fun e!398366 () Bool)

(assert (=> d!96521 e!398366))

(declare-fun res!471757 () Bool)

(assert (=> d!96521 (=> (not res!471757) (not e!398366))))

(declare-fun lt!317821 () List!13405)

(assert (=> d!96521 (= res!471757 (<= (size!19713 lt!317821) (size!19713 (t!19681 newAcc!49))))))

(assert (=> d!96521 (= lt!317821 e!398365)))

(declare-fun c!78441 () Bool)

(assert (=> d!96521 (= c!78441 ((_ is Cons!13401) (t!19681 newAcc!49)))))

(assert (=> d!96521 (= (-!354 (t!19681 newAcc!49) k0!2824) lt!317821)))

(declare-fun b!707904 () Bool)

(assert (=> b!707904 (= e!398366 (= (content!334 lt!317821) ((_ map and) (content!334 (t!19681 newAcc!49)) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2824 true)))))))

(declare-fun b!707905 () Bool)

(declare-fun e!398364 () List!13405)

(assert (=> b!707905 (= e!398365 e!398364)))

(declare-fun c!78440 () Bool)

(assert (=> b!707905 (= c!78440 (= k0!2824 (h!14446 (t!19681 newAcc!49))))))

(declare-fun b!707906 () Bool)

(assert (=> b!707906 (= e!398364 (Cons!13401 (h!14446 (t!19681 newAcc!49)) call!34367))))

(declare-fun b!707907 () Bool)

(assert (=> b!707907 (= e!398364 call!34367)))

(assert (= (and d!96521 c!78441) b!707905))

(assert (= (and d!96521 (not c!78441)) b!707903))

(assert (= (and b!707905 c!78440) b!707907))

(assert (= (and b!707905 (not c!78440)) b!707906))

(assert (= (or b!707907 b!707906) bm!34364))

(assert (= (and d!96521 res!471757) b!707904))

(declare-fun m!664875 () Bool)

(assert (=> bm!34364 m!664875))

(declare-fun m!664877 () Bool)

(assert (=> d!96521 m!664877))

(declare-fun m!664879 () Bool)

(assert (=> d!96521 m!664879))

(declare-fun m!664881 () Bool)

(assert (=> b!707904 m!664881))

(assert (=> b!707904 m!664851))

(assert (=> b!707904 m!664673))

(assert (=> bm!34348 d!96521))

(declare-fun d!96523 () Bool)

(declare-fun res!471758 () Bool)

(declare-fun e!398367 () Bool)

(assert (=> d!96523 (=> res!471758 e!398367)))

(assert (=> d!96523 (= res!471758 ((_ is Nil!13402) (t!19681 ($colon$colon!499 acc!652 (select (arr!19325 a!3591) from!2969)))))))

(assert (=> d!96523 (= (noDuplicate!1196 (t!19681 ($colon$colon!499 acc!652 (select (arr!19325 a!3591) from!2969)))) e!398367)))

(declare-fun b!707908 () Bool)

(declare-fun e!398368 () Bool)

(assert (=> b!707908 (= e!398367 e!398368)))

(declare-fun res!471759 () Bool)

(assert (=> b!707908 (=> (not res!471759) (not e!398368))))

(assert (=> b!707908 (= res!471759 (not (contains!3927 (t!19681 (t!19681 ($colon$colon!499 acc!652 (select (arr!19325 a!3591) from!2969)))) (h!14446 (t!19681 ($colon$colon!499 acc!652 (select (arr!19325 a!3591) from!2969)))))))))

(declare-fun b!707909 () Bool)

(assert (=> b!707909 (= e!398368 (noDuplicate!1196 (t!19681 (t!19681 ($colon$colon!499 acc!652 (select (arr!19325 a!3591) from!2969))))))))

(assert (= (and d!96523 (not res!471758)) b!707908))

(assert (= (and b!707908 res!471759) b!707909))

(declare-fun m!664883 () Bool)

(assert (=> b!707908 m!664883))

(declare-fun m!664885 () Bool)

(assert (=> b!707909 m!664885))

(assert (=> b!707705 d!96523))

(declare-fun d!96525 () Bool)

(declare-fun lt!317822 () Bool)

(assert (=> d!96525 (= lt!317822 (select (content!334 (t!19681 acc!652)) k0!2824))))

(declare-fun e!398370 () Bool)

(assert (=> d!96525 (= lt!317822 e!398370)))

(declare-fun res!471760 () Bool)

(assert (=> d!96525 (=> (not res!471760) (not e!398370))))

(assert (=> d!96525 (= res!471760 ((_ is Cons!13401) (t!19681 acc!652)))))

(assert (=> d!96525 (= (contains!3927 (t!19681 acc!652) k0!2824) lt!317822)))

(declare-fun b!707910 () Bool)

(declare-fun e!398369 () Bool)

(assert (=> b!707910 (= e!398370 e!398369)))

(declare-fun res!471761 () Bool)

(assert (=> b!707910 (=> res!471761 e!398369)))

(assert (=> b!707910 (= res!471761 (= (h!14446 (t!19681 acc!652)) k0!2824))))

(declare-fun b!707911 () Bool)

(assert (=> b!707911 (= e!398369 (contains!3927 (t!19681 (t!19681 acc!652)) k0!2824))))

(assert (= (and d!96525 res!471760) b!707910))

(assert (= (and b!707910 (not res!471761)) b!707911))

(assert (=> d!96525 m!664863))

(declare-fun m!664887 () Bool)

(assert (=> d!96525 m!664887))

(declare-fun m!664889 () Bool)

(assert (=> b!707911 m!664889))

(assert (=> b!707740 d!96525))

(declare-fun d!96527 () Bool)

(declare-fun c!78442 () Bool)

(assert (=> d!96527 (= c!78442 ((_ is Nil!13402) lt!317787))))

(declare-fun e!398371 () (InoxSet (_ BitVec 64)))

(assert (=> d!96527 (= (content!334 lt!317787) e!398371)))

(declare-fun b!707912 () Bool)

(assert (=> b!707912 (= e!398371 ((as const (Array (_ BitVec 64) Bool)) false))))

(declare-fun b!707913 () Bool)

(assert (=> b!707913 (= e!398371 ((_ map or) (store ((as const (Array (_ BitVec 64) Bool)) false) (h!14446 lt!317787) true) (content!334 (t!19681 lt!317787))))))

(assert (= (and d!96527 c!78442) b!707912))

(assert (= (and d!96527 (not c!78442)) b!707913))

(declare-fun m!664891 () Bool)

(assert (=> b!707913 m!664891))

(declare-fun m!664893 () Bool)

(assert (=> b!707913 m!664893))

(assert (=> b!707676 d!96527))

(assert (=> b!707676 d!96515))

(declare-fun d!96529 () Bool)

(declare-fun lt!317825 () Int)

(assert (=> d!96529 (>= lt!317825 0)))

(declare-fun e!398374 () Int)

(assert (=> d!96529 (= lt!317825 e!398374)))

(declare-fun c!78445 () Bool)

(assert (=> d!96529 (= c!78445 ((_ is Nil!13402) lt!317787))))

(assert (=> d!96529 (= (size!19713 lt!317787) lt!317825)))

(declare-fun b!707918 () Bool)

(assert (=> b!707918 (= e!398374 0)))

(declare-fun b!707919 () Bool)

(assert (=> b!707919 (= e!398374 (+ 1 (size!19713 (t!19681 lt!317787))))))

(assert (= (and d!96529 c!78445) b!707918))

(assert (= (and d!96529 (not c!78445)) b!707919))

(declare-fun m!664895 () Bool)

(assert (=> b!707919 m!664895))

(assert (=> d!96399 d!96529))

(declare-fun d!96531 () Bool)

(declare-fun lt!317826 () Int)

(assert (=> d!96531 (>= lt!317826 0)))

(declare-fun e!398375 () Int)

(assert (=> d!96531 (= lt!317826 e!398375)))

(declare-fun c!78446 () Bool)

(assert (=> d!96531 (= c!78446 ((_ is Nil!13402) newAcc!49))))

(assert (=> d!96531 (= (size!19713 newAcc!49) lt!317826)))

(declare-fun b!707920 () Bool)

(assert (=> b!707920 (= e!398375 0)))

(declare-fun b!707921 () Bool)

(assert (=> b!707921 (= e!398375 (+ 1 (size!19713 (t!19681 newAcc!49))))))

(assert (= (and d!96531 c!78446) b!707920))

(assert (= (and d!96531 (not c!78446)) b!707921))

(assert (=> b!707921 m!664879))

(assert (=> d!96399 d!96531))

(declare-fun b!707924 () Bool)

(declare-fun e!398379 () Bool)

(assert (=> b!707924 (= e!398379 (subseq!389 (t!19681 acc!652) (t!19681 (t!19681 newAcc!49))))))

(declare-fun b!707922 () Bool)

(declare-fun e!398378 () Bool)

(declare-fun e!398377 () Bool)

(assert (=> b!707922 (= e!398378 e!398377)))

(declare-fun res!471762 () Bool)

(assert (=> b!707922 (=> (not res!471762) (not e!398377))))

(assert (=> b!707922 (= res!471762 ((_ is Cons!13401) (t!19681 newAcc!49)))))

(declare-fun b!707923 () Bool)

(declare-fun e!398376 () Bool)

(assert (=> b!707923 (= e!398377 e!398376)))

(declare-fun res!471763 () Bool)

(assert (=> b!707923 (=> res!471763 e!398376)))

(assert (=> b!707923 (= res!471763 e!398379)))

(declare-fun res!471764 () Bool)

(assert (=> b!707923 (=> (not res!471764) (not e!398379))))

(assert (=> b!707923 (= res!471764 (= (h!14446 acc!652) (h!14446 (t!19681 newAcc!49))))))

(declare-fun b!707925 () Bool)

(assert (=> b!707925 (= e!398376 (subseq!389 acc!652 (t!19681 (t!19681 newAcc!49))))))

(declare-fun d!96533 () Bool)

(declare-fun res!471765 () Bool)

(assert (=> d!96533 (=> res!471765 e!398378)))

(assert (=> d!96533 (= res!471765 ((_ is Nil!13402) acc!652))))

(assert (=> d!96533 (= (subseq!389 acc!652 (t!19681 newAcc!49)) e!398378)))

(assert (= (and d!96533 (not res!471765)) b!707922))

(assert (= (and b!707922 res!471762) b!707923))

(assert (= (and b!707923 res!471764) b!707924))

(assert (= (and b!707923 (not res!471763)) b!707925))

(declare-fun m!664897 () Bool)

(assert (=> b!707924 m!664897))

(declare-fun m!664899 () Bool)

(assert (=> b!707925 m!664899))

(assert (=> b!707691 d!96533))

(declare-fun b!707928 () Bool)

(declare-fun e!398383 () Bool)

(assert (=> b!707928 (= e!398383 (subseq!389 (t!19681 (t!19681 acc!652)) (t!19681 (t!19681 newAcc!49))))))

(declare-fun b!707926 () Bool)

(declare-fun e!398382 () Bool)

(declare-fun e!398381 () Bool)

(assert (=> b!707926 (= e!398382 e!398381)))

(declare-fun res!471766 () Bool)

(assert (=> b!707926 (=> (not res!471766) (not e!398381))))

(assert (=> b!707926 (= res!471766 ((_ is Cons!13401) (t!19681 newAcc!49)))))

(declare-fun b!707927 () Bool)

(declare-fun e!398380 () Bool)

(assert (=> b!707927 (= e!398381 e!398380)))

(declare-fun res!471767 () Bool)

(assert (=> b!707927 (=> res!471767 e!398380)))

(assert (=> b!707927 (= res!471767 e!398383)))

(declare-fun res!471768 () Bool)

(assert (=> b!707927 (=> (not res!471768) (not e!398383))))

(assert (=> b!707927 (= res!471768 (= (h!14446 (t!19681 acc!652)) (h!14446 (t!19681 newAcc!49))))))

(declare-fun b!707929 () Bool)

(assert (=> b!707929 (= e!398380 (subseq!389 (t!19681 acc!652) (t!19681 (t!19681 newAcc!49))))))

(declare-fun d!96535 () Bool)

(declare-fun res!471769 () Bool)

(assert (=> d!96535 (=> res!471769 e!398382)))

(assert (=> d!96535 (= res!471769 ((_ is Nil!13402) (t!19681 acc!652)))))

(assert (=> d!96535 (= (subseq!389 (t!19681 acc!652) (t!19681 newAcc!49)) e!398382)))

(assert (= (and d!96535 (not res!471769)) b!707926))

(assert (= (and b!707926 res!471766) b!707927))

(assert (= (and b!707927 res!471768) b!707928))

(assert (= (and b!707927 (not res!471767)) b!707929))

(declare-fun m!664901 () Bool)

(assert (=> b!707928 m!664901))

(assert (=> b!707929 m!664897))

(assert (=> b!707690 d!96535))

(assert (=> b!707734 d!96397))

(declare-fun lt!317827 () Bool)

(declare-fun d!96537 () Bool)

(assert (=> d!96537 (= lt!317827 (select (content!334 acc!652) (select (arr!19325 a!3591) from!2969)))))

(declare-fun e!398385 () Bool)

(assert (=> d!96537 (= lt!317827 e!398385)))

(declare-fun res!471770 () Bool)

(assert (=> d!96537 (=> (not res!471770) (not e!398385))))

(assert (=> d!96537 (= res!471770 ((_ is Cons!13401) acc!652))))

(assert (=> d!96537 (= (contains!3927 acc!652 (select (arr!19325 a!3591) from!2969)) lt!317827)))

(declare-fun b!707930 () Bool)

(declare-fun e!398384 () Bool)

(assert (=> b!707930 (= e!398385 e!398384)))

(declare-fun res!471771 () Bool)

(assert (=> b!707930 (=> res!471771 e!398384)))

(assert (=> b!707930 (= res!471771 (= (h!14446 acc!652) (select (arr!19325 a!3591) from!2969)))))

(declare-fun b!707931 () Bool)

(assert (=> b!707931 (= e!398384 (contains!3927 (t!19681 acc!652) (select (arr!19325 a!3591) from!2969)))))

(assert (= (and d!96537 res!471770) b!707930))

(assert (= (and b!707930 (not res!471771)) b!707931))

(assert (=> d!96537 m!664683))

(assert (=> d!96537 m!664551))

(declare-fun m!664903 () Bool)

(assert (=> d!96537 m!664903))

(assert (=> b!707931 m!664551))

(declare-fun m!664905 () Bool)

(assert (=> b!707931 m!664905))

(assert (=> b!707733 d!96537))

(declare-fun d!96539 () Bool)

(declare-fun lt!317828 () Bool)

(assert (=> d!96539 (= lt!317828 (select (content!334 (t!19681 newAcc!49)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398387 () Bool)

(assert (=> d!96539 (= lt!317828 e!398387)))

(declare-fun res!471772 () Bool)

(assert (=> d!96539 (=> (not res!471772) (not e!398387))))

(assert (=> d!96539 (= res!471772 ((_ is Cons!13401) (t!19681 newAcc!49)))))

(assert (=> d!96539 (= (contains!3927 (t!19681 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000) lt!317828)))

(declare-fun b!707932 () Bool)

(declare-fun e!398386 () Bool)

(assert (=> b!707932 (= e!398387 e!398386)))

(declare-fun res!471773 () Bool)

(assert (=> b!707932 (=> res!471773 e!398386)))

(assert (=> b!707932 (= res!471773 (= (h!14446 (t!19681 newAcc!49)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!707933 () Bool)

(assert (=> b!707933 (= e!398386 (contains!3927 (t!19681 (t!19681 newAcc!49)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96539 res!471772) b!707932))

(assert (= (and b!707932 (not res!471773)) b!707933))

(assert (=> d!96539 m!664851))

(declare-fun m!664907 () Bool)

(assert (=> d!96539 m!664907))

(declare-fun m!664909 () Bool)

(assert (=> b!707933 m!664909))

(assert (=> b!707766 d!96539))

(declare-fun lt!317829 () Bool)

(declare-fun d!96541 () Bool)

(assert (=> d!96541 (= lt!317829 (select (content!334 (t!19681 ($colon$colon!499 acc!652 (select (arr!19325 a!3591) from!2969)))) (h!14446 ($colon$colon!499 acc!652 (select (arr!19325 a!3591) from!2969)))))))

(declare-fun e!398389 () Bool)

(assert (=> d!96541 (= lt!317829 e!398389)))

(declare-fun res!471774 () Bool)

(assert (=> d!96541 (=> (not res!471774) (not e!398389))))

(assert (=> d!96541 (= res!471774 ((_ is Cons!13401) (t!19681 ($colon$colon!499 acc!652 (select (arr!19325 a!3591) from!2969)))))))

(assert (=> d!96541 (= (contains!3927 (t!19681 ($colon$colon!499 acc!652 (select (arr!19325 a!3591) from!2969))) (h!14446 ($colon$colon!499 acc!652 (select (arr!19325 a!3591) from!2969)))) lt!317829)))

(declare-fun b!707934 () Bool)

(declare-fun e!398388 () Bool)

(assert (=> b!707934 (= e!398389 e!398388)))

(declare-fun res!471775 () Bool)

(assert (=> b!707934 (=> res!471775 e!398388)))

(assert (=> b!707934 (= res!471775 (= (h!14446 (t!19681 ($colon$colon!499 acc!652 (select (arr!19325 a!3591) from!2969)))) (h!14446 ($colon$colon!499 acc!652 (select (arr!19325 a!3591) from!2969)))))))

(declare-fun b!707935 () Bool)

(assert (=> b!707935 (= e!398388 (contains!3927 (t!19681 (t!19681 ($colon$colon!499 acc!652 (select (arr!19325 a!3591) from!2969)))) (h!14446 ($colon$colon!499 acc!652 (select (arr!19325 a!3591) from!2969)))))))

(assert (= (and d!96541 res!471774) b!707934))

(assert (= (and b!707934 (not res!471775)) b!707935))

(declare-fun m!664911 () Bool)

(assert (=> d!96541 m!664911))

(declare-fun m!664913 () Bool)

(assert (=> d!96541 m!664913))

(declare-fun m!664915 () Bool)

(assert (=> b!707935 m!664915))

(assert (=> b!707704 d!96541))

(assert (=> d!96435 d!96513))

(declare-fun d!96543 () Bool)

(declare-fun lt!317830 () Bool)

(assert (=> d!96543 (= lt!317830 (select (content!334 (t!19681 acc!652)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398391 () Bool)

(assert (=> d!96543 (= lt!317830 e!398391)))

(declare-fun res!471776 () Bool)

(assert (=> d!96543 (=> (not res!471776) (not e!398391))))

(assert (=> d!96543 (= res!471776 ((_ is Cons!13401) (t!19681 acc!652)))))

(assert (=> d!96543 (= (contains!3927 (t!19681 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000) lt!317830)))

(declare-fun b!707936 () Bool)

(declare-fun e!398390 () Bool)

(assert (=> b!707936 (= e!398391 e!398390)))

(declare-fun res!471777 () Bool)

(assert (=> b!707936 (=> res!471777 e!398390)))

(assert (=> b!707936 (= res!471777 (= (h!14446 (t!19681 acc!652)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!707937 () Bool)

(assert (=> b!707937 (= e!398390 (contains!3927 (t!19681 (t!19681 acc!652)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96543 res!471776) b!707936))

(assert (= (and b!707936 (not res!471777)) b!707937))

(assert (=> d!96543 m!664863))

(declare-fun m!664917 () Bool)

(assert (=> d!96543 m!664917))

(declare-fun m!664919 () Bool)

(assert (=> b!707937 m!664919))

(assert (=> b!707699 d!96543))

(declare-fun b!707938 () Bool)

(declare-fun e!398393 () Bool)

(declare-fun call!34368 () Bool)

(assert (=> b!707938 (= e!398393 call!34368)))

(declare-fun d!96545 () Bool)

(declare-fun res!471779 () Bool)

(declare-fun e!398394 () Bool)

(assert (=> d!96545 (=> res!471779 e!398394)))

(assert (=> d!96545 (= res!471779 (bvsge (bvadd from!2969 #b00000000000000000000000000000001) (size!19710 a!3591)))))

(assert (=> d!96545 (= (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78417 (Cons!13401 (select (arr!19325 a!3591) from!2969) acc!652) acc!652)) e!398394)))

(declare-fun bm!34365 () Bool)

(declare-fun c!78447 () Bool)

(assert (=> bm!34365 (= call!34368 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!78447 (Cons!13401 (select (arr!19325 a!3591) (bvadd from!2969 #b00000000000000000000000000000001)) (ite c!78417 (Cons!13401 (select (arr!19325 a!3591) from!2969) acc!652) acc!652)) (ite c!78417 (Cons!13401 (select (arr!19325 a!3591) from!2969) acc!652) acc!652))))))

(declare-fun b!707939 () Bool)

(declare-fun e!398392 () Bool)

(assert (=> b!707939 (= e!398392 e!398393)))

(assert (=> b!707939 (= c!78447 (validKeyInArray!0 (select (arr!19325 a!3591) (bvadd from!2969 #b00000000000000000000000000000001))))))

(declare-fun b!707940 () Bool)

(assert (=> b!707940 (= e!398393 call!34368)))

(declare-fun e!398395 () Bool)

(declare-fun b!707941 () Bool)

(assert (=> b!707941 (= e!398395 (contains!3927 (ite c!78417 (Cons!13401 (select (arr!19325 a!3591) from!2969) acc!652) acc!652) (select (arr!19325 a!3591) (bvadd from!2969 #b00000000000000000000000000000001))))))

(declare-fun b!707942 () Bool)

(assert (=> b!707942 (= e!398394 e!398392)))

(declare-fun res!471778 () Bool)

(assert (=> b!707942 (=> (not res!471778) (not e!398392))))

(assert (=> b!707942 (= res!471778 (not e!398395))))

(declare-fun res!471780 () Bool)

(assert (=> b!707942 (=> (not res!471780) (not e!398395))))

(assert (=> b!707942 (= res!471780 (validKeyInArray!0 (select (arr!19325 a!3591) (bvadd from!2969 #b00000000000000000000000000000001))))))

(assert (= (and d!96545 (not res!471779)) b!707942))

(assert (= (and b!707942 res!471780) b!707941))

(assert (= (and b!707942 res!471778) b!707939))

(assert (= (and b!707939 c!78447) b!707940))

(assert (= (and b!707939 (not c!78447)) b!707938))

(assert (= (or b!707940 b!707938) bm!34365))

(assert (=> bm!34365 m!664857))

(declare-fun m!664921 () Bool)

(assert (=> bm!34365 m!664921))

(assert (=> b!707939 m!664857))

(assert (=> b!707939 m!664857))

(declare-fun m!664923 () Bool)

(assert (=> b!707939 m!664923))

(assert (=> b!707941 m!664857))

(assert (=> b!707941 m!664857))

(declare-fun m!664925 () Bool)

(assert (=> b!707941 m!664925))

(assert (=> b!707942 m!664857))

(assert (=> b!707942 m!664857))

(assert (=> b!707942 m!664923))

(assert (=> bm!34351 d!96545))

(declare-fun d!96547 () Bool)

(declare-fun lt!317831 () Bool)

(assert (=> d!96547 (= lt!317831 (select (content!334 (t!19681 acc!652)) (h!14446 acc!652)))))

(declare-fun e!398397 () Bool)

(assert (=> d!96547 (= lt!317831 e!398397)))

(declare-fun res!471781 () Bool)

(assert (=> d!96547 (=> (not res!471781) (not e!398397))))

(assert (=> d!96547 (= res!471781 ((_ is Cons!13401) (t!19681 acc!652)))))

(assert (=> d!96547 (= (contains!3927 (t!19681 acc!652) (h!14446 acc!652)) lt!317831)))

(declare-fun b!707943 () Bool)

(declare-fun e!398396 () Bool)

(assert (=> b!707943 (= e!398397 e!398396)))

(declare-fun res!471782 () Bool)

(assert (=> b!707943 (=> res!471782 e!398396)))

(assert (=> b!707943 (= res!471782 (= (h!14446 (t!19681 acc!652)) (h!14446 acc!652)))))

(declare-fun b!707944 () Bool)

(assert (=> b!707944 (= e!398396 (contains!3927 (t!19681 (t!19681 acc!652)) (h!14446 acc!652)))))

(assert (= (and d!96547 res!471781) b!707943))

(assert (= (and b!707943 (not res!471782)) b!707944))

(assert (=> d!96547 m!664863))

(declare-fun m!664927 () Bool)

(assert (=> d!96547 m!664927))

(declare-fun m!664929 () Bool)

(assert (=> b!707944 m!664929))

(assert (=> b!707706 d!96547))

(assert (=> d!96405 d!96513))

(declare-fun d!96549 () Bool)

(declare-fun lt!317832 () Bool)

(assert (=> d!96549 (= lt!317832 (select (content!334 (t!19681 newAcc!49)) (h!14446 newAcc!49)))))

(declare-fun e!398399 () Bool)

(assert (=> d!96549 (= lt!317832 e!398399)))

(declare-fun res!471783 () Bool)

(assert (=> d!96549 (=> (not res!471783) (not e!398399))))

(assert (=> d!96549 (= res!471783 ((_ is Cons!13401) (t!19681 newAcc!49)))))

(assert (=> d!96549 (= (contains!3927 (t!19681 newAcc!49) (h!14446 newAcc!49)) lt!317832)))

(declare-fun b!707945 () Bool)

(declare-fun e!398398 () Bool)

(assert (=> b!707945 (= e!398399 e!398398)))

(declare-fun res!471784 () Bool)

(assert (=> b!707945 (=> res!471784 e!398398)))

(assert (=> b!707945 (= res!471784 (= (h!14446 (t!19681 newAcc!49)) (h!14446 newAcc!49)))))

(declare-fun b!707946 () Bool)

(assert (=> b!707946 (= e!398398 (contains!3927 (t!19681 (t!19681 newAcc!49)) (h!14446 newAcc!49)))))

(assert (= (and d!96549 res!471783) b!707945))

(assert (= (and b!707945 (not res!471784)) b!707946))

(assert (=> d!96549 m!664851))

(declare-fun m!664931 () Bool)

(assert (=> d!96549 m!664931))

(declare-fun m!664933 () Bool)

(assert (=> b!707946 m!664933))

(assert (=> b!707663 d!96549))

(declare-fun d!96551 () Bool)

(declare-fun res!471785 () Bool)

(declare-fun e!398400 () Bool)

(assert (=> d!96551 (=> res!471785 e!398400)))

(assert (=> d!96551 (= res!471785 ((_ is Nil!13402) (t!19681 ($colon$colon!499 newAcc!49 (select (arr!19325 a!3591) from!2969)))))))

(assert (=> d!96551 (= (noDuplicate!1196 (t!19681 ($colon$colon!499 newAcc!49 (select (arr!19325 a!3591) from!2969)))) e!398400)))

(declare-fun b!707947 () Bool)

(declare-fun e!398401 () Bool)

(assert (=> b!707947 (= e!398400 e!398401)))

(declare-fun res!471786 () Bool)

(assert (=> b!707947 (=> (not res!471786) (not e!398401))))

(assert (=> b!707947 (= res!471786 (not (contains!3927 (t!19681 (t!19681 ($colon$colon!499 newAcc!49 (select (arr!19325 a!3591) from!2969)))) (h!14446 (t!19681 ($colon$colon!499 newAcc!49 (select (arr!19325 a!3591) from!2969)))))))))

(declare-fun b!707948 () Bool)

(assert (=> b!707948 (= e!398401 (noDuplicate!1196 (t!19681 (t!19681 ($colon$colon!499 newAcc!49 (select (arr!19325 a!3591) from!2969))))))))

(assert (= (and d!96551 (not res!471785)) b!707947))

(assert (= (and b!707947 res!471786) b!707948))

(declare-fun m!664935 () Bool)

(assert (=> b!707947 m!664935))

(declare-fun m!664937 () Bool)

(assert (=> b!707948 m!664937))

(assert (=> b!707701 d!96551))

(declare-fun d!96553 () Bool)

(declare-fun lt!317833 () Bool)

(assert (=> d!96553 (= lt!317833 (select (content!334 (t!19681 ($colon$colon!499 newAcc!49 (select (arr!19325 a!3591) from!2969)))) (h!14446 ($colon$colon!499 newAcc!49 (select (arr!19325 a!3591) from!2969)))))))

(declare-fun e!398403 () Bool)

(assert (=> d!96553 (= lt!317833 e!398403)))

(declare-fun res!471787 () Bool)

(assert (=> d!96553 (=> (not res!471787) (not e!398403))))

(assert (=> d!96553 (= res!471787 ((_ is Cons!13401) (t!19681 ($colon$colon!499 newAcc!49 (select (arr!19325 a!3591) from!2969)))))))

(assert (=> d!96553 (= (contains!3927 (t!19681 ($colon$colon!499 newAcc!49 (select (arr!19325 a!3591) from!2969))) (h!14446 ($colon$colon!499 newAcc!49 (select (arr!19325 a!3591) from!2969)))) lt!317833)))

(declare-fun b!707949 () Bool)

(declare-fun e!398402 () Bool)

(assert (=> b!707949 (= e!398403 e!398402)))

(declare-fun res!471788 () Bool)

(assert (=> b!707949 (=> res!471788 e!398402)))

(assert (=> b!707949 (= res!471788 (= (h!14446 (t!19681 ($colon$colon!499 newAcc!49 (select (arr!19325 a!3591) from!2969)))) (h!14446 ($colon$colon!499 newAcc!49 (select (arr!19325 a!3591) from!2969)))))))

(declare-fun b!707950 () Bool)

(assert (=> b!707950 (= e!398402 (contains!3927 (t!19681 (t!19681 ($colon$colon!499 newAcc!49 (select (arr!19325 a!3591) from!2969)))) (h!14446 ($colon$colon!499 newAcc!49 (select (arr!19325 a!3591) from!2969)))))))

(assert (= (and d!96553 res!471787) b!707949))

(assert (= (and b!707949 (not res!471788)) b!707950))

(declare-fun m!664939 () Bool)

(assert (=> d!96553 m!664939))

(declare-fun m!664941 () Bool)

(assert (=> d!96553 m!664941))

(declare-fun m!664943 () Bool)

(assert (=> b!707950 m!664943))

(assert (=> b!707700 d!96553))

(assert (=> b!707731 d!96397))

(declare-fun d!96555 () Bool)

(declare-fun res!471789 () Bool)

(declare-fun e!398404 () Bool)

(assert (=> d!96555 (=> res!471789 e!398404)))

(assert (=> d!96555 (= res!471789 ((_ is Nil!13402) (t!19681 acc!652)))))

(assert (=> d!96555 (= (noDuplicate!1196 (t!19681 acc!652)) e!398404)))

(declare-fun b!707951 () Bool)

(declare-fun e!398405 () Bool)

(assert (=> b!707951 (= e!398404 e!398405)))

(declare-fun res!471790 () Bool)

(assert (=> b!707951 (=> (not res!471790) (not e!398405))))

(assert (=> b!707951 (= res!471790 (not (contains!3927 (t!19681 (t!19681 acc!652)) (h!14446 (t!19681 acc!652)))))))

(declare-fun b!707952 () Bool)

(assert (=> b!707952 (= e!398405 (noDuplicate!1196 (t!19681 (t!19681 acc!652))))))

(assert (= (and d!96555 (not res!471789)) b!707951))

(assert (= (and b!707951 res!471790) b!707952))

(declare-fun m!664945 () Bool)

(assert (=> b!707951 m!664945))

(declare-fun m!664947 () Bool)

(assert (=> b!707952 m!664947))

(assert (=> b!707707 d!96555))

(declare-fun d!96557 () Bool)

(declare-fun res!471791 () Bool)

(declare-fun e!398406 () Bool)

(assert (=> d!96557 (=> res!471791 e!398406)))

(assert (=> d!96557 (= res!471791 ((_ is Nil!13402) (t!19681 newAcc!49)))))

(assert (=> d!96557 (= (noDuplicate!1196 (t!19681 newAcc!49)) e!398406)))

(declare-fun b!707953 () Bool)

(declare-fun e!398407 () Bool)

(assert (=> b!707953 (= e!398406 e!398407)))

(declare-fun res!471792 () Bool)

(assert (=> b!707953 (=> (not res!471792) (not e!398407))))

(assert (=> b!707953 (= res!471792 (not (contains!3927 (t!19681 (t!19681 newAcc!49)) (h!14446 (t!19681 newAcc!49)))))))

(declare-fun b!707954 () Bool)

(assert (=> b!707954 (= e!398407 (noDuplicate!1196 (t!19681 (t!19681 newAcc!49))))))

(assert (= (and d!96557 (not res!471791)) b!707953))

(assert (= (and b!707953 res!471792) b!707954))

(declare-fun m!664949 () Bool)

(assert (=> b!707953 m!664949))

(declare-fun m!664951 () Bool)

(assert (=> b!707954 m!664951))

(assert (=> b!707664 d!96557))

(check-sat (not b!707900) (not d!96521) (not b!707908) (not d!96509) (not d!96541) (not b!707925) (not d!96525) (not b!707947) (not b!707952) (not b!707902) (not b!707953) (not b!707898) (not b!707937) (not b!707939) (not b!707950) (not b!707890) (not d!96553) (not b!707896) (not b!707954) (not b!707913) (not d!96549) (not b!707929) (not b!707921) (not b!707931) (not d!96537) (not b!707935) (not bm!34365) (not b!707942) (not b!707948) (not d!96517) (not b!707951) (not b!707946) (not b!707911) (not d!96519) (not b!707933) (not b!707941) (not d!96539) (not b!707888) (not b!707919) (not b!707944) (not d!96543) (not bm!34364) (not b!707924) (not b!707904) (not b!707909) (not b!707928) (not d!96547))
(check-sat)
