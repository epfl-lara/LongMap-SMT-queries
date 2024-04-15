; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134166 () Bool)

(assert start!134166)

(declare-fun b!1567570 () Bool)

(declare-fun e!873823 () Bool)

(declare-fun e!873827 () Bool)

(assert (=> b!1567570 (= e!873823 e!873827)))

(declare-fun res!1071448 () Bool)

(assert (=> b!1567570 (=> (not res!1071448) (not e!873827))))

(declare-fun from!2856 () (_ BitVec 32))

(assert (=> b!1567570 (= res!1071448 (bvsge (bvadd #b00000000000000000000000000000001 from!2856) #b00000000000000000000000000000000))))

(declare-datatypes ((array!104655 0))(
  ( (array!104656 (arr!50510 (Array (_ BitVec 32) (_ BitVec 64))) (size!51062 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104655)

(declare-datatypes ((List!36718 0))(
  ( (Nil!36715) (Cons!36714 (h!38162 (_ BitVec 64)) (t!51618 List!36718)) )
))
(declare-fun acc!619 () List!36718)

(declare-fun lt!672783 () List!36718)

(assert (=> b!1567570 (= lt!672783 (Cons!36714 (select (arr!50510 a!3481) from!2856) acc!619))))

(declare-fun b!1567571 () Bool)

(declare-fun e!873824 () Bool)

(assert (=> b!1567571 (= e!873824 e!873823)))

(declare-fun res!1071441 () Bool)

(assert (=> b!1567571 (=> (not res!1071441) (not e!873823))))

(declare-fun e!873826 () Bool)

(assert (=> b!1567571 (= res!1071441 e!873826)))

(declare-fun res!1071447 () Bool)

(assert (=> b!1567571 (=> res!1071447 e!873826)))

(declare-fun lt!672782 () Bool)

(assert (=> b!1567571 (= res!1071447 lt!672782)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1567571 (= lt!672782 (not (validKeyInArray!0 (select (arr!50510 a!3481) from!2856))))))

(declare-fun b!1567572 () Bool)

(declare-fun e!873822 () Bool)

(declare-fun contains!10334 (List!36718 (_ BitVec 64)) Bool)

(assert (=> b!1567572 (= e!873822 (contains!10334 lt!672783 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1567573 () Bool)

(declare-fun res!1071446 () Bool)

(assert (=> b!1567573 (=> (not res!1071446) (not e!873823))))

(assert (=> b!1567573 (= res!1071446 (not lt!672782))))

(declare-fun b!1567574 () Bool)

(assert (=> b!1567574 (= e!873827 e!873822)))

(declare-fun res!1071450 () Bool)

(assert (=> b!1567574 (=> res!1071450 e!873822)))

(assert (=> b!1567574 (= res!1071450 (contains!10334 lt!672783 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!1071445 () Bool)

(assert (=> start!134166 (=> (not res!1071445) (not e!873824))))

(assert (=> start!134166 (= res!1071445 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51062 a!3481)) (bvslt (size!51062 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134166 e!873824))

(assert (=> start!134166 true))

(declare-fun array_inv!39446 (array!104655) Bool)

(assert (=> start!134166 (array_inv!39446 a!3481)))

(declare-fun b!1567575 () Bool)

(declare-fun res!1071443 () Bool)

(assert (=> b!1567575 (=> (not res!1071443) (not e!873827))))

(declare-fun noDuplicate!2675 (List!36718) Bool)

(assert (=> b!1567575 (= res!1071443 (noDuplicate!2675 lt!672783))))

(declare-fun b!1567576 () Bool)

(declare-fun res!1071444 () Bool)

(assert (=> b!1567576 (=> (not res!1071444) (not e!873824))))

(assert (=> b!1567576 (= res!1071444 (not (contains!10334 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1567577 () Bool)

(declare-fun res!1071449 () Bool)

(assert (=> b!1567577 (=> (not res!1071449) (not e!873824))))

(assert (=> b!1567577 (= res!1071449 (bvslt from!2856 (size!51062 a!3481)))))

(declare-fun b!1567578 () Bool)

(declare-fun res!1071442 () Bool)

(assert (=> b!1567578 (=> (not res!1071442) (not e!873824))))

(assert (=> b!1567578 (= res!1071442 (not (contains!10334 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1567579 () Bool)

(assert (=> b!1567579 (= e!873826 (not (contains!10334 acc!619 (select (arr!50510 a!3481) from!2856))))))

(declare-fun b!1567580 () Bool)

(declare-fun res!1071440 () Bool)

(assert (=> b!1567580 (=> (not res!1071440) (not e!873824))))

(assert (=> b!1567580 (= res!1071440 (noDuplicate!2675 acc!619))))

(assert (= (and start!134166 res!1071445) b!1567580))

(assert (= (and b!1567580 res!1071440) b!1567578))

(assert (= (and b!1567578 res!1071442) b!1567576))

(assert (= (and b!1567576 res!1071444) b!1567577))

(assert (= (and b!1567577 res!1071449) b!1567571))

(assert (= (and b!1567571 (not res!1071447)) b!1567579))

(assert (= (and b!1567571 res!1071441) b!1567573))

(assert (= (and b!1567573 res!1071446) b!1567570))

(assert (= (and b!1567570 res!1071448) b!1567575))

(assert (= (and b!1567575 res!1071443) b!1567574))

(assert (= (and b!1567574 (not res!1071450)) b!1567572))

(declare-fun m!1441743 () Bool)

(assert (=> b!1567576 m!1441743))

(declare-fun m!1441745 () Bool)

(assert (=> b!1567571 m!1441745))

(assert (=> b!1567571 m!1441745))

(declare-fun m!1441747 () Bool)

(assert (=> b!1567571 m!1441747))

(assert (=> b!1567579 m!1441745))

(assert (=> b!1567579 m!1441745))

(declare-fun m!1441749 () Bool)

(assert (=> b!1567579 m!1441749))

(declare-fun m!1441751 () Bool)

(assert (=> b!1567574 m!1441751))

(declare-fun m!1441753 () Bool)

(assert (=> b!1567580 m!1441753))

(assert (=> b!1567570 m!1441745))

(declare-fun m!1441755 () Bool)

(assert (=> b!1567578 m!1441755))

(declare-fun m!1441757 () Bool)

(assert (=> b!1567572 m!1441757))

(declare-fun m!1441759 () Bool)

(assert (=> start!134166 m!1441759))

(declare-fun m!1441761 () Bool)

(assert (=> b!1567575 m!1441761))

(check-sat (not start!134166) (not b!1567571) (not b!1567576) (not b!1567578) (not b!1567579) (not b!1567572) (not b!1567580) (not b!1567574) (not b!1567575))
(check-sat)
(get-model)

(declare-fun d!163421 () Bool)

(declare-fun lt!672798 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!803 (List!36718) (InoxSet (_ BitVec 64)))

(assert (=> d!163421 (= lt!672798 (select (content!803 lt!672783) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!873868 () Bool)

(assert (=> d!163421 (= lt!672798 e!873868)))

(declare-fun res!1071521 () Bool)

(assert (=> d!163421 (=> (not res!1071521) (not e!873868))))

(get-info :version)

(assert (=> d!163421 (= res!1071521 ((_ is Cons!36714) lt!672783))))

(assert (=> d!163421 (= (contains!10334 lt!672783 #b1000000000000000000000000000000000000000000000000000000000000000) lt!672798)))

(declare-fun b!1567651 () Bool)

(declare-fun e!873869 () Bool)

(assert (=> b!1567651 (= e!873868 e!873869)))

(declare-fun res!1071522 () Bool)

(assert (=> b!1567651 (=> res!1071522 e!873869)))

(assert (=> b!1567651 (= res!1071522 (= (h!38162 lt!672783) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1567652 () Bool)

(assert (=> b!1567652 (= e!873869 (contains!10334 (t!51618 lt!672783) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163421 res!1071521) b!1567651))

(assert (= (and b!1567651 (not res!1071522)) b!1567652))

(declare-fun m!1441803 () Bool)

(assert (=> d!163421 m!1441803))

(declare-fun m!1441805 () Bool)

(assert (=> d!163421 m!1441805))

(declare-fun m!1441807 () Bool)

(assert (=> b!1567652 m!1441807))

(assert (=> b!1567572 d!163421))

(declare-fun lt!672799 () Bool)

(declare-fun d!163425 () Bool)

(assert (=> d!163425 (= lt!672799 (select (content!803 acc!619) (select (arr!50510 a!3481) from!2856)))))

(declare-fun e!873870 () Bool)

(assert (=> d!163425 (= lt!672799 e!873870)))

(declare-fun res!1071523 () Bool)

(assert (=> d!163425 (=> (not res!1071523) (not e!873870))))

(assert (=> d!163425 (= res!1071523 ((_ is Cons!36714) acc!619))))

(assert (=> d!163425 (= (contains!10334 acc!619 (select (arr!50510 a!3481) from!2856)) lt!672799)))

(declare-fun b!1567653 () Bool)

(declare-fun e!873871 () Bool)

(assert (=> b!1567653 (= e!873870 e!873871)))

(declare-fun res!1071524 () Bool)

(assert (=> b!1567653 (=> res!1071524 e!873871)))

(assert (=> b!1567653 (= res!1071524 (= (h!38162 acc!619) (select (arr!50510 a!3481) from!2856)))))

(declare-fun b!1567654 () Bool)

(assert (=> b!1567654 (= e!873871 (contains!10334 (t!51618 acc!619) (select (arr!50510 a!3481) from!2856)))))

(assert (= (and d!163425 res!1071523) b!1567653))

(assert (= (and b!1567653 (not res!1071524)) b!1567654))

(declare-fun m!1441809 () Bool)

(assert (=> d!163425 m!1441809))

(assert (=> d!163425 m!1441745))

(declare-fun m!1441811 () Bool)

(assert (=> d!163425 m!1441811))

(assert (=> b!1567654 m!1441745))

(declare-fun m!1441813 () Bool)

(assert (=> b!1567654 m!1441813))

(assert (=> b!1567579 d!163425))

(declare-fun d!163429 () Bool)

(declare-fun lt!672800 () Bool)

(assert (=> d!163429 (= lt!672800 (select (content!803 acc!619) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!873872 () Bool)

(assert (=> d!163429 (= lt!672800 e!873872)))

(declare-fun res!1071525 () Bool)

(assert (=> d!163429 (=> (not res!1071525) (not e!873872))))

(assert (=> d!163429 (= res!1071525 ((_ is Cons!36714) acc!619))))

(assert (=> d!163429 (= (contains!10334 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000) lt!672800)))

(declare-fun b!1567655 () Bool)

(declare-fun e!873873 () Bool)

(assert (=> b!1567655 (= e!873872 e!873873)))

(declare-fun res!1071526 () Bool)

(assert (=> b!1567655 (=> res!1071526 e!873873)))

(assert (=> b!1567655 (= res!1071526 (= (h!38162 acc!619) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1567656 () Bool)

(assert (=> b!1567656 (= e!873873 (contains!10334 (t!51618 acc!619) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163429 res!1071525) b!1567655))

(assert (= (and b!1567655 (not res!1071526)) b!1567656))

(assert (=> d!163429 m!1441809))

(declare-fun m!1441815 () Bool)

(assert (=> d!163429 m!1441815))

(declare-fun m!1441817 () Bool)

(assert (=> b!1567656 m!1441817))

(assert (=> b!1567578 d!163429))

(declare-fun d!163431 () Bool)

(declare-fun res!1071543 () Bool)

(declare-fun e!873890 () Bool)

(assert (=> d!163431 (=> res!1071543 e!873890)))

(assert (=> d!163431 (= res!1071543 ((_ is Nil!36715) lt!672783))))

(assert (=> d!163431 (= (noDuplicate!2675 lt!672783) e!873890)))

(declare-fun b!1567673 () Bool)

(declare-fun e!873891 () Bool)

(assert (=> b!1567673 (= e!873890 e!873891)))

(declare-fun res!1071544 () Bool)

(assert (=> b!1567673 (=> (not res!1071544) (not e!873891))))

(assert (=> b!1567673 (= res!1071544 (not (contains!10334 (t!51618 lt!672783) (h!38162 lt!672783))))))

(declare-fun b!1567674 () Bool)

(assert (=> b!1567674 (= e!873891 (noDuplicate!2675 (t!51618 lt!672783)))))

(assert (= (and d!163431 (not res!1071543)) b!1567673))

(assert (= (and b!1567673 res!1071544) b!1567674))

(declare-fun m!1441829 () Bool)

(assert (=> b!1567673 m!1441829))

(declare-fun m!1441831 () Bool)

(assert (=> b!1567674 m!1441831))

(assert (=> b!1567575 d!163431))

(declare-fun d!163437 () Bool)

(declare-fun res!1071547 () Bool)

(declare-fun e!873894 () Bool)

(assert (=> d!163437 (=> res!1071547 e!873894)))

(assert (=> d!163437 (= res!1071547 ((_ is Nil!36715) acc!619))))

(assert (=> d!163437 (= (noDuplicate!2675 acc!619) e!873894)))

(declare-fun b!1567677 () Bool)

(declare-fun e!873895 () Bool)

(assert (=> b!1567677 (= e!873894 e!873895)))

(declare-fun res!1071548 () Bool)

(assert (=> b!1567677 (=> (not res!1071548) (not e!873895))))

(assert (=> b!1567677 (= res!1071548 (not (contains!10334 (t!51618 acc!619) (h!38162 acc!619))))))

(declare-fun b!1567678 () Bool)

(assert (=> b!1567678 (= e!873895 (noDuplicate!2675 (t!51618 acc!619)))))

(assert (= (and d!163437 (not res!1071547)) b!1567677))

(assert (= (and b!1567677 res!1071548) b!1567678))

(declare-fun m!1441839 () Bool)

(assert (=> b!1567677 m!1441839))

(declare-fun m!1441841 () Bool)

(assert (=> b!1567678 m!1441841))

(assert (=> b!1567580 d!163437))

(declare-fun d!163443 () Bool)

(declare-fun lt!672806 () Bool)

(assert (=> d!163443 (= lt!672806 (select (content!803 lt!672783) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!873900 () Bool)

(assert (=> d!163443 (= lt!672806 e!873900)))

(declare-fun res!1071553 () Bool)

(assert (=> d!163443 (=> (not res!1071553) (not e!873900))))

(assert (=> d!163443 (= res!1071553 ((_ is Cons!36714) lt!672783))))

(assert (=> d!163443 (= (contains!10334 lt!672783 #b0000000000000000000000000000000000000000000000000000000000000000) lt!672806)))

(declare-fun b!1567683 () Bool)

(declare-fun e!873901 () Bool)

(assert (=> b!1567683 (= e!873900 e!873901)))

(declare-fun res!1071554 () Bool)

(assert (=> b!1567683 (=> res!1071554 e!873901)))

(assert (=> b!1567683 (= res!1071554 (= (h!38162 lt!672783) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1567684 () Bool)

(assert (=> b!1567684 (= e!873901 (contains!10334 (t!51618 lt!672783) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163443 res!1071553) b!1567683))

(assert (= (and b!1567683 (not res!1071554)) b!1567684))

(assert (=> d!163443 m!1441803))

(declare-fun m!1441851 () Bool)

(assert (=> d!163443 m!1441851))

(declare-fun m!1441853 () Bool)

(assert (=> b!1567684 m!1441853))

(assert (=> b!1567574 d!163443))

(declare-fun d!163449 () Bool)

(assert (=> d!163449 (= (validKeyInArray!0 (select (arr!50510 a!3481) from!2856)) (and (not (= (select (arr!50510 a!3481) from!2856) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50510 a!3481) from!2856) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1567571 d!163449))

(declare-fun d!163453 () Bool)

(declare-fun lt!672807 () Bool)

(assert (=> d!163453 (= lt!672807 (select (content!803 acc!619) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!873902 () Bool)

(assert (=> d!163453 (= lt!672807 e!873902)))

(declare-fun res!1071555 () Bool)

(assert (=> d!163453 (=> (not res!1071555) (not e!873902))))

(assert (=> d!163453 (= res!1071555 ((_ is Cons!36714) acc!619))))

(assert (=> d!163453 (= (contains!10334 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000) lt!672807)))

(declare-fun b!1567685 () Bool)

(declare-fun e!873903 () Bool)

(assert (=> b!1567685 (= e!873902 e!873903)))

(declare-fun res!1071556 () Bool)

(assert (=> b!1567685 (=> res!1071556 e!873903)))

(assert (=> b!1567685 (= res!1071556 (= (h!38162 acc!619) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1567686 () Bool)

(assert (=> b!1567686 (= e!873903 (contains!10334 (t!51618 acc!619) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163453 res!1071555) b!1567685))

(assert (= (and b!1567685 (not res!1071556)) b!1567686))

(assert (=> d!163453 m!1441809))

(declare-fun m!1441855 () Bool)

(assert (=> d!163453 m!1441855))

(declare-fun m!1441857 () Bool)

(assert (=> b!1567686 m!1441857))

(assert (=> b!1567576 d!163453))

(declare-fun d!163455 () Bool)

(assert (=> d!163455 (= (array_inv!39446 a!3481) (bvsge (size!51062 a!3481) #b00000000000000000000000000000000))))

(assert (=> start!134166 d!163455))

(check-sat (not d!163429) (not b!1567677) (not d!163453) (not d!163443) (not b!1567674) (not b!1567652) (not b!1567656) (not d!163421) (not b!1567654) (not b!1567673) (not b!1567684) (not b!1567686) (not d!163425) (not b!1567678))
(check-sat)
