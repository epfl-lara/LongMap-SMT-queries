; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103064 () Bool)

(assert start!103064)

(declare-fun b!1237813 () Bool)

(declare-fun res!825615 () Bool)

(declare-fun e!701534 () Bool)

(assert (=> b!1237813 (=> (not res!825615) (not e!701534))))

(declare-datatypes ((List!27275 0))(
  ( (Nil!27272) (Cons!27271 (h!28480 (_ BitVec 64)) (t!40738 List!27275)) )
))
(declare-fun acc!846 () List!27275)

(declare-fun noDuplicate!1934 (List!27275) Bool)

(assert (=> b!1237813 (= res!825615 (noDuplicate!1934 acc!846))))

(declare-fun b!1237814 () Bool)

(declare-fun res!825611 () Bool)

(assert (=> b!1237814 (=> (not res!825611) (not e!701534))))

(declare-datatypes ((array!79795 0))(
  ( (array!79796 (arr!38502 (Array (_ BitVec 32) (_ BitVec 64))) (size!39038 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79795)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1237814 (= res!825611 (validKeyInArray!0 (select (arr!38502 a!3835) from!3213)))))

(declare-fun b!1237815 () Bool)

(declare-fun res!825614 () Bool)

(assert (=> b!1237815 (=> (not res!825614) (not e!701534))))

(declare-fun contains!7337 (List!27275 (_ BitVec 64)) Bool)

(assert (=> b!1237815 (= res!825614 (not (contains!7337 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1237816 () Bool)

(declare-fun res!825619 () Bool)

(assert (=> b!1237816 (=> (not res!825619) (not e!701534))))

(assert (=> b!1237816 (= res!825619 (not (= from!3213 (bvsub (size!39038 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1237817 () Bool)

(declare-fun res!825612 () Bool)

(declare-fun e!701535 () Bool)

(assert (=> b!1237817 (=> res!825612 e!701535)))

(declare-fun lt!561136 () List!27275)

(assert (=> b!1237817 (= res!825612 (not (noDuplicate!1934 lt!561136)))))

(declare-fun b!1237818 () Bool)

(declare-fun res!825618 () Bool)

(assert (=> b!1237818 (=> (not res!825618) (not e!701534))))

(assert (=> b!1237818 (= res!825618 (not (contains!7337 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1237819 () Bool)

(assert (=> b!1237819 (= e!701534 (not e!701535))))

(declare-fun res!825610 () Bool)

(assert (=> b!1237819 (=> res!825610 e!701535)))

(assert (=> b!1237819 (= res!825610 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-fun subseq!591 (List!27275 List!27275) Bool)

(assert (=> b!1237819 (subseq!591 acc!846 lt!561136)))

(declare-datatypes ((Unit!41084 0))(
  ( (Unit!41085) )
))
(declare-fun lt!561135 () Unit!41084)

(declare-fun subseqTail!78 (List!27275 List!27275) Unit!41084)

(assert (=> b!1237819 (= lt!561135 (subseqTail!78 lt!561136 lt!561136))))

(assert (=> b!1237819 (subseq!591 lt!561136 lt!561136)))

(declare-fun lt!561137 () Unit!41084)

(declare-fun lemmaListSubSeqRefl!0 (List!27275) Unit!41084)

(assert (=> b!1237819 (= lt!561137 (lemmaListSubSeqRefl!0 lt!561136))))

(assert (=> b!1237819 (= lt!561136 (Cons!27271 (select (arr!38502 a!3835) from!3213) acc!846))))

(declare-fun b!1237820 () Bool)

(declare-fun e!701532 () Bool)

(assert (=> b!1237820 (= e!701532 (not (contains!7337 lt!561136 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!825613 () Bool)

(assert (=> start!103064 (=> (not res!825613) (not e!701534))))

(assert (=> start!103064 (= res!825613 (and (bvslt (size!39038 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39038 a!3835))))))

(assert (=> start!103064 e!701534))

(declare-fun array_inv!29350 (array!79795) Bool)

(assert (=> start!103064 (array_inv!29350 a!3835)))

(assert (=> start!103064 true))

(declare-fun b!1237821 () Bool)

(declare-fun res!825617 () Bool)

(assert (=> b!1237821 (=> (not res!825617) (not e!701534))))

(declare-fun arrayNoDuplicates!0 (array!79795 (_ BitVec 32) List!27275) Bool)

(assert (=> b!1237821 (= res!825617 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1237822 () Bool)

(assert (=> b!1237822 (= e!701535 e!701532)))

(declare-fun res!825609 () Bool)

(assert (=> b!1237822 (=> (not res!825609) (not e!701532))))

(assert (=> b!1237822 (= res!825609 (not (contains!7337 lt!561136 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1237823 () Bool)

(declare-fun res!825616 () Bool)

(assert (=> b!1237823 (=> (not res!825616) (not e!701534))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1237823 (= res!825616 (contains!7337 acc!846 k0!2925))))

(assert (= (and start!103064 res!825613) b!1237813))

(assert (= (and b!1237813 res!825615) b!1237818))

(assert (= (and b!1237818 res!825618) b!1237815))

(assert (= (and b!1237815 res!825614) b!1237821))

(assert (= (and b!1237821 res!825617) b!1237823))

(assert (= (and b!1237823 res!825616) b!1237816))

(assert (= (and b!1237816 res!825619) b!1237814))

(assert (= (and b!1237814 res!825611) b!1237819))

(assert (= (and b!1237819 (not res!825610)) b!1237817))

(assert (= (and b!1237817 (not res!825612)) b!1237822))

(assert (= (and b!1237822 res!825609) b!1237820))

(declare-fun m!1141447 () Bool)

(assert (=> b!1237817 m!1141447))

(declare-fun m!1141449 () Bool)

(assert (=> b!1237822 m!1141449))

(declare-fun m!1141451 () Bool)

(assert (=> start!103064 m!1141451))

(declare-fun m!1141453 () Bool)

(assert (=> b!1237814 m!1141453))

(assert (=> b!1237814 m!1141453))

(declare-fun m!1141455 () Bool)

(assert (=> b!1237814 m!1141455))

(declare-fun m!1141457 () Bool)

(assert (=> b!1237819 m!1141457))

(declare-fun m!1141459 () Bool)

(assert (=> b!1237819 m!1141459))

(declare-fun m!1141461 () Bool)

(assert (=> b!1237819 m!1141461))

(declare-fun m!1141463 () Bool)

(assert (=> b!1237819 m!1141463))

(assert (=> b!1237819 m!1141453))

(declare-fun m!1141465 () Bool)

(assert (=> b!1237820 m!1141465))

(declare-fun m!1141467 () Bool)

(assert (=> b!1237823 m!1141467))

(declare-fun m!1141469 () Bool)

(assert (=> b!1237821 m!1141469))

(declare-fun m!1141471 () Bool)

(assert (=> b!1237813 m!1141471))

(declare-fun m!1141473 () Bool)

(assert (=> b!1237818 m!1141473))

(declare-fun m!1141475 () Bool)

(assert (=> b!1237815 m!1141475))

(check-sat (not start!103064) (not b!1237823) (not b!1237814) (not b!1237815) (not b!1237813) (not b!1237821) (not b!1237817) (not b!1237819) (not b!1237818) (not b!1237822) (not b!1237820))
(check-sat)
(get-model)

(declare-fun d!135761 () Bool)

(declare-fun res!825657 () Bool)

(declare-fun e!701552 () Bool)

(assert (=> d!135761 (=> res!825657 e!701552)))

(get-info :version)

(assert (=> d!135761 (= res!825657 ((_ is Nil!27272) acc!846))))

(assert (=> d!135761 (= (noDuplicate!1934 acc!846) e!701552)))

(declare-fun b!1237861 () Bool)

(declare-fun e!701553 () Bool)

(assert (=> b!1237861 (= e!701552 e!701553)))

(declare-fun res!825658 () Bool)

(assert (=> b!1237861 (=> (not res!825658) (not e!701553))))

(assert (=> b!1237861 (= res!825658 (not (contains!7337 (t!40738 acc!846) (h!28480 acc!846))))))

(declare-fun b!1237862 () Bool)

(assert (=> b!1237862 (= e!701553 (noDuplicate!1934 (t!40738 acc!846)))))

(assert (= (and d!135761 (not res!825657)) b!1237861))

(assert (= (and b!1237861 res!825658) b!1237862))

(declare-fun m!1141507 () Bool)

(assert (=> b!1237861 m!1141507))

(declare-fun m!1141509 () Bool)

(assert (=> b!1237862 m!1141509))

(assert (=> b!1237813 d!135761))

(declare-fun b!1237872 () Bool)

(declare-fun e!701562 () Bool)

(declare-fun e!701563 () Bool)

(assert (=> b!1237872 (= e!701562 e!701563)))

(declare-fun res!825667 () Bool)

(assert (=> b!1237872 (=> res!825667 e!701563)))

(declare-fun e!701565 () Bool)

(assert (=> b!1237872 (= res!825667 e!701565)))

(declare-fun res!825669 () Bool)

(assert (=> b!1237872 (=> (not res!825669) (not e!701565))))

(assert (=> b!1237872 (= res!825669 (= (h!28480 acc!846) (h!28480 lt!561136)))))

(declare-fun d!135763 () Bool)

(declare-fun res!825670 () Bool)

(declare-fun e!701564 () Bool)

(assert (=> d!135763 (=> res!825670 e!701564)))

(assert (=> d!135763 (= res!825670 ((_ is Nil!27272) acc!846))))

(assert (=> d!135763 (= (subseq!591 acc!846 lt!561136) e!701564)))

(declare-fun b!1237873 () Bool)

(assert (=> b!1237873 (= e!701565 (subseq!591 (t!40738 acc!846) (t!40738 lt!561136)))))

(declare-fun b!1237874 () Bool)

(assert (=> b!1237874 (= e!701563 (subseq!591 acc!846 (t!40738 lt!561136)))))

(declare-fun b!1237871 () Bool)

(assert (=> b!1237871 (= e!701564 e!701562)))

(declare-fun res!825668 () Bool)

(assert (=> b!1237871 (=> (not res!825668) (not e!701562))))

(assert (=> b!1237871 (= res!825668 ((_ is Cons!27271) lt!561136))))

(assert (= (and d!135763 (not res!825670)) b!1237871))

(assert (= (and b!1237871 res!825668) b!1237872))

(assert (= (and b!1237872 res!825669) b!1237873))

(assert (= (and b!1237872 (not res!825667)) b!1237874))

(declare-fun m!1141511 () Bool)

(assert (=> b!1237873 m!1141511))

(declare-fun m!1141513 () Bool)

(assert (=> b!1237874 m!1141513))

(assert (=> b!1237819 d!135763))

(declare-fun bm!61036 () Bool)

(declare-fun call!61039 () Unit!41084)

(declare-fun c!120970 () Bool)

(assert (=> bm!61036 (= call!61039 (subseqTail!78 (ite c!120970 lt!561136 (t!40738 lt!561136)) (t!40738 lt!561136)))))

(declare-fun b!1237909 () Bool)

(declare-fun e!701594 () Unit!41084)

(assert (=> b!1237909 (= e!701594 call!61039)))

(declare-fun b!1237910 () Bool)

(declare-fun e!701597 () Unit!41084)

(declare-fun Unit!41088 () Unit!41084)

(assert (=> b!1237910 (= e!701597 Unit!41088)))

(declare-fun b!1237911 () Bool)

(declare-fun e!701595 () Bool)

(assert (=> b!1237911 (= e!701595 (subseq!591 lt!561136 lt!561136))))

(declare-fun b!1237912 () Bool)

(declare-fun e!701596 () Unit!41084)

(assert (=> b!1237912 (= e!701596 call!61039)))

(declare-fun d!135765 () Bool)

(declare-fun tail!163 (List!27275) List!27275)

(assert (=> d!135765 (subseq!591 (tail!163 lt!561136) lt!561136)))

(declare-fun lt!561153 () Unit!41084)

(assert (=> d!135765 (= lt!561153 e!701597)))

(declare-fun c!120969 () Bool)

(assert (=> d!135765 (= c!120969 (and ((_ is Cons!27271) lt!561136) ((_ is Cons!27271) lt!561136)))))

(assert (=> d!135765 e!701595))

(declare-fun res!825693 () Bool)

(assert (=> d!135765 (=> (not res!825693) (not e!701595))))

(declare-fun isEmpty!1011 (List!27275) Bool)

(assert (=> d!135765 (= res!825693 (not (isEmpty!1011 lt!561136)))))

(assert (=> d!135765 (= (subseqTail!78 lt!561136 lt!561136) lt!561153)))

(declare-fun b!1237913 () Bool)

(assert (=> b!1237913 (= e!701597 e!701594)))

(assert (=> b!1237913 (= c!120970 (subseq!591 lt!561136 (t!40738 lt!561136)))))

(declare-fun b!1237914 () Bool)

(declare-fun c!120968 () Bool)

(assert (=> b!1237914 (= c!120968 (not (isEmpty!1011 (t!40738 lt!561136))))))

(assert (=> b!1237914 (= e!701594 e!701596)))

(declare-fun b!1237915 () Bool)

(declare-fun Unit!41089 () Unit!41084)

(assert (=> b!1237915 (= e!701596 Unit!41089)))

(assert (= (and d!135765 res!825693) b!1237911))

(assert (= (and d!135765 c!120969) b!1237913))

(assert (= (and d!135765 (not c!120969)) b!1237910))

(assert (= (and b!1237913 c!120970) b!1237909))

(assert (= (and b!1237913 (not c!120970)) b!1237914))

(assert (= (and b!1237914 c!120968) b!1237912))

(assert (= (and b!1237914 (not c!120968)) b!1237915))

(assert (= (or b!1237909 b!1237912) bm!61036))

(declare-fun m!1141529 () Bool)

(assert (=> b!1237914 m!1141529))

(assert (=> b!1237911 m!1141459))

(declare-fun m!1141531 () Bool)

(assert (=> bm!61036 m!1141531))

(declare-fun m!1141533 () Bool)

(assert (=> b!1237913 m!1141533))

(declare-fun m!1141535 () Bool)

(assert (=> d!135765 m!1141535))

(assert (=> d!135765 m!1141535))

(declare-fun m!1141537 () Bool)

(assert (=> d!135765 m!1141537))

(declare-fun m!1141539 () Bool)

(assert (=> d!135765 m!1141539))

(assert (=> b!1237819 d!135765))

(declare-fun b!1237917 () Bool)

(declare-fun e!701598 () Bool)

(declare-fun e!701599 () Bool)

(assert (=> b!1237917 (= e!701598 e!701599)))

(declare-fun res!825694 () Bool)

(assert (=> b!1237917 (=> res!825694 e!701599)))

(declare-fun e!701601 () Bool)

(assert (=> b!1237917 (= res!825694 e!701601)))

(declare-fun res!825696 () Bool)

(assert (=> b!1237917 (=> (not res!825696) (not e!701601))))

(assert (=> b!1237917 (= res!825696 (= (h!28480 lt!561136) (h!28480 lt!561136)))))

(declare-fun d!135777 () Bool)

(declare-fun res!825697 () Bool)

(declare-fun e!701600 () Bool)

(assert (=> d!135777 (=> res!825697 e!701600)))

(assert (=> d!135777 (= res!825697 ((_ is Nil!27272) lt!561136))))

(assert (=> d!135777 (= (subseq!591 lt!561136 lt!561136) e!701600)))

(declare-fun b!1237918 () Bool)

(assert (=> b!1237918 (= e!701601 (subseq!591 (t!40738 lt!561136) (t!40738 lt!561136)))))

(declare-fun b!1237919 () Bool)

(assert (=> b!1237919 (= e!701599 (subseq!591 lt!561136 (t!40738 lt!561136)))))

(declare-fun b!1237916 () Bool)

(assert (=> b!1237916 (= e!701600 e!701598)))

(declare-fun res!825695 () Bool)

(assert (=> b!1237916 (=> (not res!825695) (not e!701598))))

(assert (=> b!1237916 (= res!825695 ((_ is Cons!27271) lt!561136))))

(assert (= (and d!135777 (not res!825697)) b!1237916))

(assert (= (and b!1237916 res!825695) b!1237917))

(assert (= (and b!1237917 res!825696) b!1237918))

(assert (= (and b!1237917 (not res!825694)) b!1237919))

(declare-fun m!1141541 () Bool)

(assert (=> b!1237918 m!1141541))

(assert (=> b!1237919 m!1141533))

(assert (=> b!1237819 d!135777))

(declare-fun d!135779 () Bool)

(assert (=> d!135779 (subseq!591 lt!561136 lt!561136)))

(declare-fun lt!561156 () Unit!41084)

(declare-fun choose!36 (List!27275) Unit!41084)

(assert (=> d!135779 (= lt!561156 (choose!36 lt!561136))))

(assert (=> d!135779 (= (lemmaListSubSeqRefl!0 lt!561136) lt!561156)))

(declare-fun bs!34808 () Bool)

(assert (= bs!34808 d!135779))

(assert (=> bs!34808 m!1141459))

(declare-fun m!1141543 () Bool)

(assert (=> bs!34808 m!1141543))

(assert (=> b!1237819 d!135779))

(declare-fun d!135781 () Bool)

(assert (=> d!135781 (= (validKeyInArray!0 (select (arr!38502 a!3835) from!3213)) (and (not (= (select (arr!38502 a!3835) from!3213) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38502 a!3835) from!3213) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1237814 d!135781))

(declare-fun d!135783 () Bool)

(declare-fun lt!561161 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!588 (List!27275) (InoxSet (_ BitVec 64)))

(assert (=> d!135783 (= lt!561161 (select (content!588 lt!561136) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!701626 () Bool)

(assert (=> d!135783 (= lt!561161 e!701626)))

(declare-fun res!825716 () Bool)

(assert (=> d!135783 (=> (not res!825716) (not e!701626))))

(assert (=> d!135783 (= res!825716 ((_ is Cons!27271) lt!561136))))

(assert (=> d!135783 (= (contains!7337 lt!561136 #b1000000000000000000000000000000000000000000000000000000000000000) lt!561161)))

(declare-fun b!1237950 () Bool)

(declare-fun e!701627 () Bool)

(assert (=> b!1237950 (= e!701626 e!701627)))

(declare-fun res!825717 () Bool)

(assert (=> b!1237950 (=> res!825717 e!701627)))

(assert (=> b!1237950 (= res!825717 (= (h!28480 lt!561136) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1237951 () Bool)

(assert (=> b!1237951 (= e!701627 (contains!7337 (t!40738 lt!561136) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135783 res!825716) b!1237950))

(assert (= (and b!1237950 (not res!825717)) b!1237951))

(declare-fun m!1141549 () Bool)

(assert (=> d!135783 m!1141549))

(declare-fun m!1141551 () Bool)

(assert (=> d!135783 m!1141551))

(declare-fun m!1141553 () Bool)

(assert (=> b!1237951 m!1141553))

(assert (=> b!1237820 d!135783))

(declare-fun d!135787 () Bool)

(declare-fun lt!561163 () Bool)

(assert (=> d!135787 (= lt!561163 (select (content!588 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!701632 () Bool)

(assert (=> d!135787 (= lt!561163 e!701632)))

(declare-fun res!825719 () Bool)

(assert (=> d!135787 (=> (not res!825719) (not e!701632))))

(assert (=> d!135787 (= res!825719 ((_ is Cons!27271) acc!846))))

(assert (=> d!135787 (= (contains!7337 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000) lt!561163)))

(declare-fun b!1237959 () Bool)

(declare-fun e!701633 () Bool)

(assert (=> b!1237959 (= e!701632 e!701633)))

(declare-fun res!825720 () Bool)

(assert (=> b!1237959 (=> res!825720 e!701633)))

(assert (=> b!1237959 (= res!825720 (= (h!28480 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1237960 () Bool)

(assert (=> b!1237960 (= e!701633 (contains!7337 (t!40738 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135787 res!825719) b!1237959))

(assert (= (and b!1237959 (not res!825720)) b!1237960))

(declare-fun m!1141555 () Bool)

(assert (=> d!135787 m!1141555))

(declare-fun m!1141557 () Bool)

(assert (=> d!135787 m!1141557))

(declare-fun m!1141559 () Bool)

(assert (=> b!1237960 m!1141559))

(assert (=> b!1237815 d!135787))

(declare-fun b!1238006 () Bool)

(declare-fun e!701669 () Bool)

(declare-fun e!701671 () Bool)

(assert (=> b!1238006 (= e!701669 e!701671)))

(declare-fun c!120991 () Bool)

(assert (=> b!1238006 (= c!120991 (validKeyInArray!0 (select (arr!38502 a!3835) from!3213)))))

(declare-fun b!1238007 () Bool)

(declare-fun call!61048 () Bool)

(assert (=> b!1238007 (= e!701671 call!61048)))

(declare-fun bm!61045 () Bool)

(assert (=> bm!61045 (= call!61048 (arrayNoDuplicates!0 a!3835 (bvadd from!3213 #b00000000000000000000000000000001) (ite c!120991 (Cons!27271 (select (arr!38502 a!3835) from!3213) acc!846) acc!846)))))

(declare-fun b!1238008 () Bool)

(assert (=> b!1238008 (= e!701671 call!61048)))

(declare-fun b!1238009 () Bool)

(declare-fun e!701670 () Bool)

(assert (=> b!1238009 (= e!701670 e!701669)))

(declare-fun res!825746 () Bool)

(assert (=> b!1238009 (=> (not res!825746) (not e!701669))))

(declare-fun e!701668 () Bool)

(assert (=> b!1238009 (= res!825746 (not e!701668))))

(declare-fun res!825745 () Bool)

(assert (=> b!1238009 (=> (not res!825745) (not e!701668))))

(assert (=> b!1238009 (= res!825745 (validKeyInArray!0 (select (arr!38502 a!3835) from!3213)))))

(declare-fun b!1238010 () Bool)

(assert (=> b!1238010 (= e!701668 (contains!7337 acc!846 (select (arr!38502 a!3835) from!3213)))))

(declare-fun d!135789 () Bool)

(declare-fun res!825744 () Bool)

(assert (=> d!135789 (=> res!825744 e!701670)))

(assert (=> d!135789 (= res!825744 (bvsge from!3213 (size!39038 a!3835)))))

(assert (=> d!135789 (= (arrayNoDuplicates!0 a!3835 from!3213 acc!846) e!701670)))

(assert (= (and d!135789 (not res!825744)) b!1238009))

(assert (= (and b!1238009 res!825745) b!1238010))

(assert (= (and b!1238009 res!825746) b!1238006))

(assert (= (and b!1238006 c!120991) b!1238007))

(assert (= (and b!1238006 (not c!120991)) b!1238008))

(assert (= (or b!1238007 b!1238008) bm!61045))

(assert (=> b!1238006 m!1141453))

(assert (=> b!1238006 m!1141453))

(assert (=> b!1238006 m!1141455))

(assert (=> bm!61045 m!1141453))

(declare-fun m!1141595 () Bool)

(assert (=> bm!61045 m!1141595))

(assert (=> b!1238009 m!1141453))

(assert (=> b!1238009 m!1141453))

(assert (=> b!1238009 m!1141455))

(assert (=> b!1238010 m!1141453))

(assert (=> b!1238010 m!1141453))

(declare-fun m!1141597 () Bool)

(assert (=> b!1238010 m!1141597))

(assert (=> b!1237821 d!135789))

(declare-fun d!135805 () Bool)

(assert (=> d!135805 (= (array_inv!29350 a!3835) (bvsge (size!39038 a!3835) #b00000000000000000000000000000000))))

(assert (=> start!103064 d!135805))

(declare-fun d!135809 () Bool)

(declare-fun lt!561175 () Bool)

(assert (=> d!135809 (= lt!561175 (select (content!588 lt!561136) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!701676 () Bool)

(assert (=> d!135809 (= lt!561175 e!701676)))

(declare-fun res!825751 () Bool)

(assert (=> d!135809 (=> (not res!825751) (not e!701676))))

(assert (=> d!135809 (= res!825751 ((_ is Cons!27271) lt!561136))))

(assert (=> d!135809 (= (contains!7337 lt!561136 #b0000000000000000000000000000000000000000000000000000000000000000) lt!561175)))

(declare-fun b!1238015 () Bool)

(declare-fun e!701677 () Bool)

(assert (=> b!1238015 (= e!701676 e!701677)))

(declare-fun res!825752 () Bool)

(assert (=> b!1238015 (=> res!825752 e!701677)))

(assert (=> b!1238015 (= res!825752 (= (h!28480 lt!561136) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1238016 () Bool)

(assert (=> b!1238016 (= e!701677 (contains!7337 (t!40738 lt!561136) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135809 res!825751) b!1238015))

(assert (= (and b!1238015 (not res!825752)) b!1238016))

(assert (=> d!135809 m!1141549))

(declare-fun m!1141601 () Bool)

(assert (=> d!135809 m!1141601))

(declare-fun m!1141603 () Bool)

(assert (=> b!1238016 m!1141603))

(assert (=> b!1237822 d!135809))

(declare-fun d!135811 () Bool)

(declare-fun res!825753 () Bool)

(declare-fun e!701678 () Bool)

(assert (=> d!135811 (=> res!825753 e!701678)))

(assert (=> d!135811 (= res!825753 ((_ is Nil!27272) lt!561136))))

(assert (=> d!135811 (= (noDuplicate!1934 lt!561136) e!701678)))

(declare-fun b!1238017 () Bool)

(declare-fun e!701679 () Bool)

(assert (=> b!1238017 (= e!701678 e!701679)))

(declare-fun res!825754 () Bool)

(assert (=> b!1238017 (=> (not res!825754) (not e!701679))))

(assert (=> b!1238017 (= res!825754 (not (contains!7337 (t!40738 lt!561136) (h!28480 lt!561136))))))

(declare-fun b!1238018 () Bool)

(assert (=> b!1238018 (= e!701679 (noDuplicate!1934 (t!40738 lt!561136)))))

(assert (= (and d!135811 (not res!825753)) b!1238017))

(assert (= (and b!1238017 res!825754) b!1238018))

(declare-fun m!1141605 () Bool)

(assert (=> b!1238017 m!1141605))

(declare-fun m!1141607 () Bool)

(assert (=> b!1238018 m!1141607))

(assert (=> b!1237817 d!135811))

(declare-fun d!135815 () Bool)

(declare-fun lt!561177 () Bool)

(assert (=> d!135815 (= lt!561177 (select (content!588 acc!846) k0!2925))))

(declare-fun e!701682 () Bool)

(assert (=> d!135815 (= lt!561177 e!701682)))

(declare-fun res!825757 () Bool)

(assert (=> d!135815 (=> (not res!825757) (not e!701682))))

(assert (=> d!135815 (= res!825757 ((_ is Cons!27271) acc!846))))

(assert (=> d!135815 (= (contains!7337 acc!846 k0!2925) lt!561177)))

(declare-fun b!1238021 () Bool)

(declare-fun e!701683 () Bool)

(assert (=> b!1238021 (= e!701682 e!701683)))

(declare-fun res!825758 () Bool)

(assert (=> b!1238021 (=> res!825758 e!701683)))

(assert (=> b!1238021 (= res!825758 (= (h!28480 acc!846) k0!2925))))

(declare-fun b!1238022 () Bool)

(assert (=> b!1238022 (= e!701683 (contains!7337 (t!40738 acc!846) k0!2925))))

(assert (= (and d!135815 res!825757) b!1238021))

(assert (= (and b!1238021 (not res!825758)) b!1238022))

(assert (=> d!135815 m!1141555))

(declare-fun m!1141615 () Bool)

(assert (=> d!135815 m!1141615))

(declare-fun m!1141617 () Bool)

(assert (=> b!1238022 m!1141617))

(assert (=> b!1237823 d!135815))

(declare-fun d!135819 () Bool)

(declare-fun lt!561179 () Bool)

(assert (=> d!135819 (= lt!561179 (select (content!588 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!701686 () Bool)

(assert (=> d!135819 (= lt!561179 e!701686)))

(declare-fun res!825761 () Bool)

(assert (=> d!135819 (=> (not res!825761) (not e!701686))))

(assert (=> d!135819 (= res!825761 ((_ is Cons!27271) acc!846))))

(assert (=> d!135819 (= (contains!7337 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000) lt!561179)))

(declare-fun b!1238025 () Bool)

(declare-fun e!701687 () Bool)

(assert (=> b!1238025 (= e!701686 e!701687)))

(declare-fun res!825762 () Bool)

(assert (=> b!1238025 (=> res!825762 e!701687)))

(assert (=> b!1238025 (= res!825762 (= (h!28480 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1238026 () Bool)

(assert (=> b!1238026 (= e!701687 (contains!7337 (t!40738 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135819 res!825761) b!1238025))

(assert (= (and b!1238025 (not res!825762)) b!1238026))

(assert (=> d!135819 m!1141555))

(declare-fun m!1141623 () Bool)

(assert (=> d!135819 m!1141623))

(declare-fun m!1141625 () Bool)

(assert (=> b!1238026 m!1141625))

(assert (=> b!1237818 d!135819))

(check-sat (not d!135819) (not b!1237918) (not b!1238018) (not b!1238022) (not b!1237960) (not b!1237874) (not b!1238010) (not d!135787) (not b!1237873) (not d!135783) (not bm!61036) (not b!1238016) (not d!135809) (not b!1238017) (not b!1238009) (not b!1238006) (not b!1237951) (not b!1238026) (not b!1237913) (not d!135765) (not d!135779) (not b!1237862) (not b!1237919) (not b!1237861) (not b!1237914) (not d!135815) (not bm!61045) (not b!1237911))
(check-sat)
