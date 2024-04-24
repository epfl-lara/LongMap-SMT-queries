; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103366 () Bool)

(assert start!103366)

(declare-fun b!1239625 () Bool)

(declare-fun res!826563 () Bool)

(declare-fun e!702658 () Bool)

(assert (=> b!1239625 (=> (not res!826563) (not e!702658))))

(declare-datatypes ((List!27308 0))(
  ( (Nil!27305) (Cons!27304 (h!28522 (_ BitVec 64)) (t!40763 List!27308)) )
))
(declare-fun acc!846 () List!27308)

(declare-fun contains!7379 (List!27308 (_ BitVec 64)) Bool)

(assert (=> b!1239625 (= res!826563 (not (contains!7379 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1239627 () Bool)

(declare-fun res!826565 () Bool)

(declare-fun e!702657 () Bool)

(assert (=> b!1239627 (=> res!826565 e!702657)))

(declare-fun lt!561752 () List!27308)

(declare-fun noDuplicate!1960 (List!27308) Bool)

(assert (=> b!1239627 (= res!826565 (not (noDuplicate!1960 lt!561752)))))

(declare-fun b!1239628 () Bool)

(declare-fun res!826568 () Bool)

(assert (=> b!1239628 (=> res!826568 e!702657)))

(assert (=> b!1239628 (= res!826568 (contains!7379 lt!561752 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1239629 () Bool)

(declare-fun res!826564 () Bool)

(assert (=> b!1239629 (=> (not res!826564) (not e!702658))))

(assert (=> b!1239629 (= res!826564 (noDuplicate!1960 acc!846))))

(declare-fun b!1239630 () Bool)

(declare-fun res!826562 () Bool)

(assert (=> b!1239630 (=> (not res!826562) (not e!702658))))

(declare-datatypes ((array!79850 0))(
  ( (array!79851 (arr!38522 (Array (_ BitVec 32) (_ BitVec 64))) (size!39059 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79850)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79850 (_ BitVec 32) List!27308) Bool)

(assert (=> b!1239630 (= res!826562 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1239631 () Bool)

(declare-fun res!826567 () Bool)

(assert (=> b!1239631 (=> (not res!826567) (not e!702658))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1239631 (= res!826567 (validKeyInArray!0 (select (arr!38522 a!3835) from!3213)))))

(declare-fun b!1239632 () Bool)

(declare-fun res!826558 () Bool)

(assert (=> b!1239632 (=> (not res!826558) (not e!702658))))

(assert (=> b!1239632 (= res!826558 (not (contains!7379 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1239633 () Bool)

(declare-fun res!826569 () Bool)

(assert (=> b!1239633 (=> (not res!826569) (not e!702658))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1239633 (= res!826569 (contains!7379 acc!846 k0!2925))))

(declare-fun b!1239634 () Bool)

(declare-fun res!826566 () Bool)

(assert (=> b!1239634 (=> res!826566 e!702657)))

(assert (=> b!1239634 (= res!826566 (contains!7379 lt!561752 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1239626 () Bool)

(declare-fun res!826559 () Bool)

(assert (=> b!1239626 (=> (not res!826559) (not e!702658))))

(assert (=> b!1239626 (= res!826559 (not (= from!3213 (bvsub (size!39059 a!3835) #b00000000000000000000000000000001))))))

(declare-fun res!826560 () Bool)

(assert (=> start!103366 (=> (not res!826560) (not e!702658))))

(assert (=> start!103366 (= res!826560 (and (bvslt (size!39059 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39059 a!3835))))))

(assert (=> start!103366 e!702658))

(declare-fun array_inv!29460 (array!79850) Bool)

(assert (=> start!103366 (array_inv!29460 a!3835)))

(assert (=> start!103366 true))

(declare-fun b!1239635 () Bool)

(assert (=> b!1239635 (= e!702658 (not e!702657))))

(declare-fun res!826561 () Bool)

(assert (=> b!1239635 (=> res!826561 e!702657)))

(assert (=> b!1239635 (= res!826561 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-fun subseq!599 (List!27308 List!27308) Bool)

(assert (=> b!1239635 (subseq!599 acc!846 lt!561752)))

(declare-datatypes ((Unit!41077 0))(
  ( (Unit!41078) )
))
(declare-fun lt!561755 () Unit!41077)

(declare-fun subseqTail!86 (List!27308 List!27308) Unit!41077)

(assert (=> b!1239635 (= lt!561755 (subseqTail!86 lt!561752 lt!561752))))

(assert (=> b!1239635 (subseq!599 lt!561752 lt!561752)))

(declare-fun lt!561754 () Unit!41077)

(declare-fun lemmaListSubSeqRefl!0 (List!27308) Unit!41077)

(assert (=> b!1239635 (= lt!561754 (lemmaListSubSeqRefl!0 lt!561752))))

(assert (=> b!1239635 (= lt!561752 (Cons!27304 (select (arr!38522 a!3835) from!3213) acc!846))))

(declare-fun b!1239636 () Bool)

(assert (=> b!1239636 (= e!702657 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) lt!561752))))

(declare-fun lt!561753 () Unit!41077)

(declare-fun noDuplicateSubseq!80 (List!27308 List!27308) Unit!41077)

(assert (=> b!1239636 (= lt!561753 (noDuplicateSubseq!80 acc!846 lt!561752))))

(assert (= (and start!103366 res!826560) b!1239629))

(assert (= (and b!1239629 res!826564) b!1239625))

(assert (= (and b!1239625 res!826563) b!1239632))

(assert (= (and b!1239632 res!826558) b!1239630))

(assert (= (and b!1239630 res!826562) b!1239633))

(assert (= (and b!1239633 res!826569) b!1239626))

(assert (= (and b!1239626 res!826559) b!1239631))

(assert (= (and b!1239631 res!826567) b!1239635))

(assert (= (and b!1239635 (not res!826561)) b!1239627))

(assert (= (and b!1239627 (not res!826565)) b!1239634))

(assert (= (and b!1239634 (not res!826566)) b!1239628))

(assert (= (and b!1239628 (not res!826568)) b!1239636))

(declare-fun m!1143503 () Bool)

(assert (=> b!1239630 m!1143503))

(declare-fun m!1143505 () Bool)

(assert (=> b!1239628 m!1143505))

(declare-fun m!1143507 () Bool)

(assert (=> start!103366 m!1143507))

(declare-fun m!1143509 () Bool)

(assert (=> b!1239636 m!1143509))

(declare-fun m!1143511 () Bool)

(assert (=> b!1239636 m!1143511))

(declare-fun m!1143513 () Bool)

(assert (=> b!1239632 m!1143513))

(declare-fun m!1143515 () Bool)

(assert (=> b!1239627 m!1143515))

(declare-fun m!1143517 () Bool)

(assert (=> b!1239634 m!1143517))

(declare-fun m!1143519 () Bool)

(assert (=> b!1239635 m!1143519))

(declare-fun m!1143521 () Bool)

(assert (=> b!1239635 m!1143521))

(declare-fun m!1143523 () Bool)

(assert (=> b!1239635 m!1143523))

(declare-fun m!1143525 () Bool)

(assert (=> b!1239635 m!1143525))

(declare-fun m!1143527 () Bool)

(assert (=> b!1239635 m!1143527))

(declare-fun m!1143529 () Bool)

(assert (=> b!1239625 m!1143529))

(declare-fun m!1143531 () Bool)

(assert (=> b!1239633 m!1143531))

(assert (=> b!1239631 m!1143527))

(assert (=> b!1239631 m!1143527))

(declare-fun m!1143533 () Bool)

(assert (=> b!1239631 m!1143533))

(declare-fun m!1143535 () Bool)

(assert (=> b!1239629 m!1143535))

(check-sat (not b!1239633) (not b!1239635) (not b!1239630) (not b!1239634) (not b!1239632) (not b!1239631) (not start!103366) (not b!1239636) (not b!1239625) (not b!1239628) (not b!1239627) (not b!1239629))
(check-sat)
(get-model)

(declare-fun d!136317 () Bool)

(declare-fun lt!561782 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!589 (List!27308) (InoxSet (_ BitVec 64)))

(assert (=> d!136317 (= lt!561782 (select (content!589 lt!561752) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!702682 () Bool)

(assert (=> d!136317 (= lt!561782 e!702682)))

(declare-fun res!826646 () Bool)

(assert (=> d!136317 (=> (not res!826646) (not e!702682))))

(get-info :version)

(assert (=> d!136317 (= res!826646 ((_ is Cons!27304) lt!561752))))

(assert (=> d!136317 (= (contains!7379 lt!561752 #b1000000000000000000000000000000000000000000000000000000000000000) lt!561782)))

(declare-fun b!1239713 () Bool)

(declare-fun e!702683 () Bool)

(assert (=> b!1239713 (= e!702682 e!702683)))

(declare-fun res!826647 () Bool)

(assert (=> b!1239713 (=> res!826647 e!702683)))

(assert (=> b!1239713 (= res!826647 (= (h!28522 lt!561752) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1239714 () Bool)

(assert (=> b!1239714 (= e!702683 (contains!7379 (t!40763 lt!561752) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!136317 res!826646) b!1239713))

(assert (= (and b!1239713 (not res!826647)) b!1239714))

(declare-fun m!1143605 () Bool)

(assert (=> d!136317 m!1143605))

(declare-fun m!1143607 () Bool)

(assert (=> d!136317 m!1143607))

(declare-fun m!1143609 () Bool)

(assert (=> b!1239714 m!1143609))

(assert (=> b!1239628 d!136317))

(declare-fun d!136319 () Bool)

(declare-fun res!826652 () Bool)

(declare-fun e!702688 () Bool)

(assert (=> d!136319 (=> res!826652 e!702688)))

(assert (=> d!136319 (= res!826652 ((_ is Nil!27305) lt!561752))))

(assert (=> d!136319 (= (noDuplicate!1960 lt!561752) e!702688)))

(declare-fun b!1239719 () Bool)

(declare-fun e!702689 () Bool)

(assert (=> b!1239719 (= e!702688 e!702689)))

(declare-fun res!826653 () Bool)

(assert (=> b!1239719 (=> (not res!826653) (not e!702689))))

(assert (=> b!1239719 (= res!826653 (not (contains!7379 (t!40763 lt!561752) (h!28522 lt!561752))))))

(declare-fun b!1239720 () Bool)

(assert (=> b!1239720 (= e!702689 (noDuplicate!1960 (t!40763 lt!561752)))))

(assert (= (and d!136319 (not res!826652)) b!1239719))

(assert (= (and b!1239719 res!826653) b!1239720))

(declare-fun m!1143611 () Bool)

(assert (=> b!1239719 m!1143611))

(declare-fun m!1143613 () Bool)

(assert (=> b!1239720 m!1143613))

(assert (=> b!1239627 d!136319))

(declare-fun b!1239741 () Bool)

(declare-fun e!702706 () Bool)

(declare-fun e!702707 () Bool)

(assert (=> b!1239741 (= e!702706 e!702707)))

(declare-fun res!826666 () Bool)

(assert (=> b!1239741 (=> (not res!826666) (not e!702707))))

(declare-fun e!702709 () Bool)

(assert (=> b!1239741 (= res!826666 (not e!702709))))

(declare-fun res!826668 () Bool)

(assert (=> b!1239741 (=> (not res!826668) (not e!702709))))

(assert (=> b!1239741 (= res!826668 (validKeyInArray!0 (select (arr!38522 a!3835) (bvadd #b00000000000000000000000000000001 from!3213))))))

(declare-fun b!1239742 () Bool)

(declare-fun e!702708 () Bool)

(assert (=> b!1239742 (= e!702707 e!702708)))

(declare-fun c!121405 () Bool)

(assert (=> b!1239742 (= c!121405 (validKeyInArray!0 (select (arr!38522 a!3835) (bvadd #b00000000000000000000000000000001 from!3213))))))

(declare-fun b!1239743 () Bool)

(declare-fun call!61127 () Bool)

(assert (=> b!1239743 (= e!702708 call!61127)))

(declare-fun bm!61124 () Bool)

(assert (=> bm!61124 (= call!61127 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213 #b00000000000000000000000000000001) (ite c!121405 (Cons!27304 (select (arr!38522 a!3835) (bvadd #b00000000000000000000000000000001 from!3213)) lt!561752) lt!561752)))))

(declare-fun d!136321 () Bool)

(declare-fun res!826667 () Bool)

(assert (=> d!136321 (=> res!826667 e!702706)))

(assert (=> d!136321 (= res!826667 (bvsge (bvadd #b00000000000000000000000000000001 from!3213) (size!39059 a!3835)))))

(assert (=> d!136321 (= (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) lt!561752) e!702706)))

(declare-fun b!1239744 () Bool)

(assert (=> b!1239744 (= e!702708 call!61127)))

(declare-fun b!1239745 () Bool)

(assert (=> b!1239745 (= e!702709 (contains!7379 lt!561752 (select (arr!38522 a!3835) (bvadd #b00000000000000000000000000000001 from!3213))))))

(assert (= (and d!136321 (not res!826667)) b!1239741))

(assert (= (and b!1239741 res!826668) b!1239745))

(assert (= (and b!1239741 res!826666) b!1239742))

(assert (= (and b!1239742 c!121405) b!1239744))

(assert (= (and b!1239742 (not c!121405)) b!1239743))

(assert (= (or b!1239744 b!1239743) bm!61124))

(declare-fun m!1143615 () Bool)

(assert (=> b!1239741 m!1143615))

(assert (=> b!1239741 m!1143615))

(declare-fun m!1143617 () Bool)

(assert (=> b!1239741 m!1143617))

(assert (=> b!1239742 m!1143615))

(assert (=> b!1239742 m!1143615))

(assert (=> b!1239742 m!1143617))

(assert (=> bm!61124 m!1143615))

(declare-fun m!1143619 () Bool)

(assert (=> bm!61124 m!1143619))

(assert (=> b!1239745 m!1143615))

(assert (=> b!1239745 m!1143615))

(declare-fun m!1143621 () Bool)

(assert (=> b!1239745 m!1143621))

(assert (=> b!1239636 d!136321))

(declare-fun d!136325 () Bool)

(assert (=> d!136325 (noDuplicate!1960 acc!846)))

(declare-fun lt!561785 () Unit!41077)

(declare-fun choose!1835 (List!27308 List!27308) Unit!41077)

(assert (=> d!136325 (= lt!561785 (choose!1835 acc!846 lt!561752))))

(declare-fun e!702716 () Bool)

(assert (=> d!136325 e!702716))

(declare-fun res!826674 () Bool)

(assert (=> d!136325 (=> (not res!826674) (not e!702716))))

(assert (=> d!136325 (= res!826674 (subseq!599 acc!846 lt!561752))))

(assert (=> d!136325 (= (noDuplicateSubseq!80 acc!846 lt!561752) lt!561785)))

(declare-fun b!1239753 () Bool)

(assert (=> b!1239753 (= e!702716 (noDuplicate!1960 lt!561752))))

(assert (= (and d!136325 res!826674) b!1239753))

(assert (=> d!136325 m!1143535))

(declare-fun m!1143627 () Bool)

(assert (=> d!136325 m!1143627))

(assert (=> d!136325 m!1143519))

(assert (=> b!1239753 m!1143515))

(assert (=> b!1239636 d!136325))

(declare-fun d!136329 () Bool)

(declare-fun lt!561786 () Bool)

(assert (=> d!136329 (= lt!561786 (select (content!589 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!702717 () Bool)

(assert (=> d!136329 (= lt!561786 e!702717)))

(declare-fun res!826675 () Bool)

(assert (=> d!136329 (=> (not res!826675) (not e!702717))))

(assert (=> d!136329 (= res!826675 ((_ is Cons!27304) acc!846))))

(assert (=> d!136329 (= (contains!7379 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000) lt!561786)))

(declare-fun b!1239754 () Bool)

(declare-fun e!702718 () Bool)

(assert (=> b!1239754 (= e!702717 e!702718)))

(declare-fun res!826676 () Bool)

(assert (=> b!1239754 (=> res!826676 e!702718)))

(assert (=> b!1239754 (= res!826676 (= (h!28522 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1239755 () Bool)

(assert (=> b!1239755 (= e!702718 (contains!7379 (t!40763 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!136329 res!826675) b!1239754))

(assert (= (and b!1239754 (not res!826676)) b!1239755))

(declare-fun m!1143629 () Bool)

(assert (=> d!136329 m!1143629))

(declare-fun m!1143631 () Bool)

(assert (=> d!136329 m!1143631))

(declare-fun m!1143633 () Bool)

(assert (=> b!1239755 m!1143633))

(assert (=> b!1239625 d!136329))

(declare-fun b!1239777 () Bool)

(declare-fun e!702740 () Bool)

(declare-fun e!702741 () Bool)

(assert (=> b!1239777 (= e!702740 e!702741)))

(declare-fun res!826698 () Bool)

(assert (=> b!1239777 (=> res!826698 e!702741)))

(declare-fun e!702742 () Bool)

(assert (=> b!1239777 (= res!826698 e!702742)))

(declare-fun res!826699 () Bool)

(assert (=> b!1239777 (=> (not res!826699) (not e!702742))))

(assert (=> b!1239777 (= res!826699 (= (h!28522 acc!846) (h!28522 lt!561752)))))

(declare-fun b!1239778 () Bool)

(assert (=> b!1239778 (= e!702742 (subseq!599 (t!40763 acc!846) (t!40763 lt!561752)))))

(declare-fun b!1239776 () Bool)

(declare-fun e!702739 () Bool)

(assert (=> b!1239776 (= e!702739 e!702740)))

(declare-fun res!826697 () Bool)

(assert (=> b!1239776 (=> (not res!826697) (not e!702740))))

(assert (=> b!1239776 (= res!826697 ((_ is Cons!27304) lt!561752))))

(declare-fun b!1239779 () Bool)

(assert (=> b!1239779 (= e!702741 (subseq!599 acc!846 (t!40763 lt!561752)))))

(declare-fun d!136331 () Bool)

(declare-fun res!826700 () Bool)

(assert (=> d!136331 (=> res!826700 e!702739)))

(assert (=> d!136331 (= res!826700 ((_ is Nil!27305) acc!846))))

(assert (=> d!136331 (= (subseq!599 acc!846 lt!561752) e!702739)))

(assert (= (and d!136331 (not res!826700)) b!1239776))

(assert (= (and b!1239776 res!826697) b!1239777))

(assert (= (and b!1239777 res!826699) b!1239778))

(assert (= (and b!1239777 (not res!826698)) b!1239779))

(declare-fun m!1143639 () Bool)

(assert (=> b!1239778 m!1143639))

(declare-fun m!1143641 () Bool)

(assert (=> b!1239779 m!1143641))

(assert (=> b!1239635 d!136331))

(declare-fun b!1239834 () Bool)

(declare-fun e!702782 () Unit!41077)

(declare-fun Unit!41085 () Unit!41077)

(assert (=> b!1239834 (= e!702782 Unit!41085)))

(declare-fun b!1239835 () Bool)

(declare-fun c!121422 () Bool)

(declare-fun isEmpty!1018 (List!27308) Bool)

(assert (=> b!1239835 (= c!121422 (not (isEmpty!1018 (t!40763 lt!561752))))))

(declare-fun e!702781 () Unit!41077)

(assert (=> b!1239835 (= e!702781 e!702782)))

(declare-fun b!1239836 () Bool)

(declare-fun call!61134 () Unit!41077)

(assert (=> b!1239836 (= e!702781 call!61134)))

(declare-fun b!1239837 () Bool)

(assert (=> b!1239837 (= e!702782 call!61134)))

(declare-fun bm!61131 () Bool)

(declare-fun c!121424 () Bool)

(assert (=> bm!61131 (= call!61134 (subseqTail!86 (ite c!121424 lt!561752 (t!40763 lt!561752)) (t!40763 lt!561752)))))

(declare-fun b!1239838 () Bool)

(declare-fun e!702783 () Unit!41077)

(assert (=> b!1239838 (= e!702783 e!702781)))

(assert (=> b!1239838 (= c!121424 (subseq!599 lt!561752 (t!40763 lt!561752)))))

(declare-fun b!1239839 () Bool)

(declare-fun Unit!41086 () Unit!41077)

(assert (=> b!1239839 (= e!702783 Unit!41086)))

(declare-fun b!1239833 () Bool)

(declare-fun e!702784 () Bool)

(assert (=> b!1239833 (= e!702784 (subseq!599 lt!561752 lt!561752))))

(declare-fun d!136337 () Bool)

(declare-fun tail!167 (List!27308) List!27308)

(assert (=> d!136337 (subseq!599 (tail!167 lt!561752) lt!561752)))

(declare-fun lt!561795 () Unit!41077)

(assert (=> d!136337 (= lt!561795 e!702783)))

(declare-fun c!121423 () Bool)

(assert (=> d!136337 (= c!121423 (and ((_ is Cons!27304) lt!561752) ((_ is Cons!27304) lt!561752)))))

(assert (=> d!136337 e!702784))

(declare-fun res!826724 () Bool)

(assert (=> d!136337 (=> (not res!826724) (not e!702784))))

(assert (=> d!136337 (= res!826724 (not (isEmpty!1018 lt!561752)))))

(assert (=> d!136337 (= (subseqTail!86 lt!561752 lt!561752) lt!561795)))

(assert (= (and d!136337 res!826724) b!1239833))

(assert (= (and d!136337 c!121423) b!1239838))

(assert (= (and d!136337 (not c!121423)) b!1239839))

(assert (= (and b!1239838 c!121424) b!1239836))

(assert (= (and b!1239838 (not c!121424)) b!1239835))

(assert (= (and b!1239835 c!121422) b!1239837))

(assert (= (and b!1239835 (not c!121422)) b!1239834))

(assert (= (or b!1239836 b!1239837) bm!61131))

(declare-fun m!1143663 () Bool)

(assert (=> b!1239835 m!1143663))

(declare-fun m!1143665 () Bool)

(assert (=> b!1239838 m!1143665))

(declare-fun m!1143667 () Bool)

(assert (=> d!136337 m!1143667))

(assert (=> d!136337 m!1143667))

(declare-fun m!1143669 () Bool)

(assert (=> d!136337 m!1143669))

(declare-fun m!1143671 () Bool)

(assert (=> d!136337 m!1143671))

(assert (=> b!1239833 m!1143523))

(declare-fun m!1143673 () Bool)

(assert (=> bm!61131 m!1143673))

(assert (=> b!1239635 d!136337))

(declare-fun b!1239841 () Bool)

(declare-fun e!702786 () Bool)

(declare-fun e!702787 () Bool)

(assert (=> b!1239841 (= e!702786 e!702787)))

(declare-fun res!826726 () Bool)

(assert (=> b!1239841 (=> res!826726 e!702787)))

(declare-fun e!702788 () Bool)

(assert (=> b!1239841 (= res!826726 e!702788)))

(declare-fun res!826727 () Bool)

(assert (=> b!1239841 (=> (not res!826727) (not e!702788))))

(assert (=> b!1239841 (= res!826727 (= (h!28522 lt!561752) (h!28522 lt!561752)))))

(declare-fun b!1239842 () Bool)

(assert (=> b!1239842 (= e!702788 (subseq!599 (t!40763 lt!561752) (t!40763 lt!561752)))))

(declare-fun b!1239840 () Bool)

(declare-fun e!702785 () Bool)

(assert (=> b!1239840 (= e!702785 e!702786)))

(declare-fun res!826725 () Bool)

(assert (=> b!1239840 (=> (not res!826725) (not e!702786))))

(assert (=> b!1239840 (= res!826725 ((_ is Cons!27304) lt!561752))))

(declare-fun b!1239843 () Bool)

(assert (=> b!1239843 (= e!702787 (subseq!599 lt!561752 (t!40763 lt!561752)))))

(declare-fun d!136345 () Bool)

(declare-fun res!826728 () Bool)

(assert (=> d!136345 (=> res!826728 e!702785)))

(assert (=> d!136345 (= res!826728 ((_ is Nil!27305) lt!561752))))

(assert (=> d!136345 (= (subseq!599 lt!561752 lt!561752) e!702785)))

(assert (= (and d!136345 (not res!826728)) b!1239840))

(assert (= (and b!1239840 res!826725) b!1239841))

(assert (= (and b!1239841 res!826727) b!1239842))

(assert (= (and b!1239841 (not res!826726)) b!1239843))

(declare-fun m!1143677 () Bool)

(assert (=> b!1239842 m!1143677))

(assert (=> b!1239843 m!1143665))

(assert (=> b!1239635 d!136345))

(declare-fun d!136349 () Bool)

(assert (=> d!136349 (subseq!599 lt!561752 lt!561752)))

(declare-fun lt!561801 () Unit!41077)

(declare-fun choose!36 (List!27308) Unit!41077)

(assert (=> d!136349 (= lt!561801 (choose!36 lt!561752))))

(assert (=> d!136349 (= (lemmaListSubSeqRefl!0 lt!561752) lt!561801)))

(declare-fun bs!34839 () Bool)

(assert (= bs!34839 d!136349))

(assert (=> bs!34839 m!1143523))

(declare-fun m!1143683 () Bool)

(assert (=> bs!34839 m!1143683))

(assert (=> b!1239635 d!136349))

(declare-fun d!136353 () Bool)

(declare-fun lt!561802 () Bool)

(assert (=> d!136353 (= lt!561802 (select (content!589 lt!561752) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!702795 () Bool)

(assert (=> d!136353 (= lt!561802 e!702795)))

(declare-fun res!826734 () Bool)

(assert (=> d!136353 (=> (not res!826734) (not e!702795))))

(assert (=> d!136353 (= res!826734 ((_ is Cons!27304) lt!561752))))

(assert (=> d!136353 (= (contains!7379 lt!561752 #b0000000000000000000000000000000000000000000000000000000000000000) lt!561802)))

(declare-fun b!1239852 () Bool)

(declare-fun e!702798 () Bool)

(assert (=> b!1239852 (= e!702795 e!702798)))

(declare-fun res!826736 () Bool)

(assert (=> b!1239852 (=> res!826736 e!702798)))

(assert (=> b!1239852 (= res!826736 (= (h!28522 lt!561752) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1239854 () Bool)

(assert (=> b!1239854 (= e!702798 (contains!7379 (t!40763 lt!561752) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!136353 res!826734) b!1239852))

(assert (= (and b!1239852 (not res!826736)) b!1239854))

(assert (=> d!136353 m!1143605))

(declare-fun m!1143689 () Bool)

(assert (=> d!136353 m!1143689))

(declare-fun m!1143691 () Bool)

(assert (=> b!1239854 m!1143691))

(assert (=> b!1239634 d!136353))

(declare-fun d!136357 () Bool)

(declare-fun lt!561803 () Bool)

(assert (=> d!136357 (= lt!561803 (select (content!589 acc!846) k0!2925))))

(declare-fun e!702799 () Bool)

(assert (=> d!136357 (= lt!561803 e!702799)))

(declare-fun res!826738 () Bool)

(assert (=> d!136357 (=> (not res!826738) (not e!702799))))

(assert (=> d!136357 (= res!826738 ((_ is Cons!27304) acc!846))))

(assert (=> d!136357 (= (contains!7379 acc!846 k0!2925) lt!561803)))

(declare-fun b!1239855 () Bool)

(declare-fun e!702800 () Bool)

(assert (=> b!1239855 (= e!702799 e!702800)))

(declare-fun res!826739 () Bool)

(assert (=> b!1239855 (=> res!826739 e!702800)))

(assert (=> b!1239855 (= res!826739 (= (h!28522 acc!846) k0!2925))))

(declare-fun b!1239856 () Bool)

(assert (=> b!1239856 (= e!702800 (contains!7379 (t!40763 acc!846) k0!2925))))

(assert (= (and d!136357 res!826738) b!1239855))

(assert (= (and b!1239855 (not res!826739)) b!1239856))

(assert (=> d!136357 m!1143629))

(declare-fun m!1143693 () Bool)

(assert (=> d!136357 m!1143693))

(declare-fun m!1143696 () Bool)

(assert (=> b!1239856 m!1143696))

(assert (=> b!1239633 d!136357))

(declare-fun d!136359 () Bool)

(declare-fun lt!561804 () Bool)

(assert (=> d!136359 (= lt!561804 (select (content!589 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!702801 () Bool)

(assert (=> d!136359 (= lt!561804 e!702801)))

(declare-fun res!826740 () Bool)

(assert (=> d!136359 (=> (not res!826740) (not e!702801))))

(assert (=> d!136359 (= res!826740 ((_ is Cons!27304) acc!846))))

(assert (=> d!136359 (= (contains!7379 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000) lt!561804)))

(declare-fun b!1239857 () Bool)

(declare-fun e!702802 () Bool)

(assert (=> b!1239857 (= e!702801 e!702802)))

(declare-fun res!826741 () Bool)

(assert (=> b!1239857 (=> res!826741 e!702802)))

(assert (=> b!1239857 (= res!826741 (= (h!28522 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1239858 () Bool)

(assert (=> b!1239858 (= e!702802 (contains!7379 (t!40763 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!136359 res!826740) b!1239857))

(assert (= (and b!1239857 (not res!826741)) b!1239858))

(assert (=> d!136359 m!1143629))

(declare-fun m!1143701 () Bool)

(assert (=> d!136359 m!1143701))

(declare-fun m!1143703 () Bool)

(assert (=> b!1239858 m!1143703))

(assert (=> b!1239632 d!136359))

(declare-fun d!136363 () Bool)

(assert (=> d!136363 (= (validKeyInArray!0 (select (arr!38522 a!3835) from!3213)) (and (not (= (select (arr!38522 a!3835) from!3213) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38522 a!3835) from!3213) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1239631 d!136363))

(declare-fun b!1239861 () Bool)

(declare-fun e!702805 () Bool)

(declare-fun e!702806 () Bool)

(assert (=> b!1239861 (= e!702805 e!702806)))

(declare-fun res!826744 () Bool)

(assert (=> b!1239861 (=> (not res!826744) (not e!702806))))

(declare-fun e!702808 () Bool)

(assert (=> b!1239861 (= res!826744 (not e!702808))))

(declare-fun res!826746 () Bool)

(assert (=> b!1239861 (=> (not res!826746) (not e!702808))))

(assert (=> b!1239861 (= res!826746 (validKeyInArray!0 (select (arr!38522 a!3835) from!3213)))))

(declare-fun b!1239862 () Bool)

(declare-fun e!702807 () Bool)

(assert (=> b!1239862 (= e!702806 e!702807)))

(declare-fun c!121426 () Bool)

(assert (=> b!1239862 (= c!121426 (validKeyInArray!0 (select (arr!38522 a!3835) from!3213)))))

(declare-fun b!1239863 () Bool)

(declare-fun call!61136 () Bool)

(assert (=> b!1239863 (= e!702807 call!61136)))

(declare-fun bm!61133 () Bool)

(assert (=> bm!61133 (= call!61136 (arrayNoDuplicates!0 a!3835 (bvadd from!3213 #b00000000000000000000000000000001) (ite c!121426 (Cons!27304 (select (arr!38522 a!3835) from!3213) acc!846) acc!846)))))

(declare-fun d!136365 () Bool)

(declare-fun res!826745 () Bool)

(assert (=> d!136365 (=> res!826745 e!702805)))

(assert (=> d!136365 (= res!826745 (bvsge from!3213 (size!39059 a!3835)))))

(assert (=> d!136365 (= (arrayNoDuplicates!0 a!3835 from!3213 acc!846) e!702805)))

(declare-fun b!1239864 () Bool)

(assert (=> b!1239864 (= e!702807 call!61136)))

(declare-fun b!1239865 () Bool)

(assert (=> b!1239865 (= e!702808 (contains!7379 acc!846 (select (arr!38522 a!3835) from!3213)))))

(assert (= (and d!136365 (not res!826745)) b!1239861))

(assert (= (and b!1239861 res!826746) b!1239865))

(assert (= (and b!1239861 res!826744) b!1239862))

(assert (= (and b!1239862 c!121426) b!1239864))

(assert (= (and b!1239862 (not c!121426)) b!1239863))

(assert (= (or b!1239864 b!1239863) bm!61133))

(assert (=> b!1239861 m!1143527))

(assert (=> b!1239861 m!1143527))

(assert (=> b!1239861 m!1143533))

(assert (=> b!1239862 m!1143527))

(assert (=> b!1239862 m!1143527))

(assert (=> b!1239862 m!1143533))

(assert (=> bm!61133 m!1143527))

(declare-fun m!1143705 () Bool)

(assert (=> bm!61133 m!1143705))

(assert (=> b!1239865 m!1143527))

(assert (=> b!1239865 m!1143527))

(declare-fun m!1143707 () Bool)

(assert (=> b!1239865 m!1143707))

(assert (=> b!1239630 d!136365))

(declare-fun d!136367 () Bool)

(declare-fun res!826748 () Bool)

(declare-fun e!702810 () Bool)

(assert (=> d!136367 (=> res!826748 e!702810)))

(assert (=> d!136367 (= res!826748 ((_ is Nil!27305) acc!846))))

(assert (=> d!136367 (= (noDuplicate!1960 acc!846) e!702810)))

(declare-fun b!1239867 () Bool)

(declare-fun e!702811 () Bool)

(assert (=> b!1239867 (= e!702810 e!702811)))

(declare-fun res!826749 () Bool)

(assert (=> b!1239867 (=> (not res!826749) (not e!702811))))

(assert (=> b!1239867 (= res!826749 (not (contains!7379 (t!40763 acc!846) (h!28522 acc!846))))))

(declare-fun b!1239868 () Bool)

(assert (=> b!1239868 (= e!702811 (noDuplicate!1960 (t!40763 acc!846)))))

(assert (= (and d!136367 (not res!826748)) b!1239867))

(assert (= (and b!1239867 res!826749) b!1239868))

(declare-fun m!1143711 () Bool)

(assert (=> b!1239867 m!1143711))

(declare-fun m!1143713 () Bool)

(assert (=> b!1239868 m!1143713))

(assert (=> b!1239629 d!136367))

(declare-fun d!136371 () Bool)

(assert (=> d!136371 (= (array_inv!29460 a!3835) (bvsge (size!39059 a!3835) #b00000000000000000000000000000000))))

(assert (=> start!103366 d!136371))

(check-sat (not b!1239854) (not b!1239861) (not b!1239868) (not b!1239778) (not b!1239753) (not b!1239755) (not d!136349) (not bm!61131) (not b!1239838) (not b!1239843) (not b!1239865) (not b!1239858) (not d!136353) (not d!136359) (not b!1239719) (not b!1239833) (not d!136317) (not b!1239714) (not b!1239856) (not d!136325) (not b!1239867) (not d!136337) (not b!1239742) (not d!136329) (not d!136357) (not b!1239862) (not bm!61124) (not b!1239835) (not b!1239720) (not b!1239779) (not b!1239745) (not b!1239842) (not bm!61133) (not b!1239741))
(check-sat)
