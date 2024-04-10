; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115742 () Bool)

(assert start!115742)

(declare-fun b!1368794 () Bool)

(declare-fun e!775426 () Bool)

(declare-datatypes ((List!31959 0))(
  ( (Nil!31956) (Cons!31955 (h!33164 (_ BitVec 64)) (t!46653 List!31959)) )
))
(declare-fun newAcc!98 () List!31959)

(declare-fun noDuplicate!2498 (List!31959) Bool)

(assert (=> b!1368794 (= e!775426 (not (noDuplicate!2498 newAcc!98)))))

(declare-datatypes ((array!92934 0))(
  ( (array!92935 (arr!44891 (Array (_ BitVec 32) (_ BitVec 64))) (size!45441 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92934)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92934 (_ BitVec 32) List!31959) Bool)

(assert (=> b!1368794 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) newAcc!98)))

(declare-datatypes ((Unit!45219 0))(
  ( (Unit!45220) )
))
(declare-fun lt!602127 () Unit!45219)

(declare-fun acc!866 () List!31959)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92934 List!31959 List!31959 (_ BitVec 32)) Unit!45219)

(assert (=> b!1368794 (= lt!602127 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 acc!866 newAcc!98 (bvadd #b00000000000000000000000000000001 from!3239)))))

(declare-fun res!912313 () Bool)

(declare-fun e!775425 () Bool)

(assert (=> start!115742 (=> (not res!912313) (not e!775425))))

(assert (=> start!115742 (= res!912313 (and (bvslt (size!45441 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45441 a!3861))))))

(assert (=> start!115742 e!775425))

(declare-fun array_inv!33919 (array!92934) Bool)

(assert (=> start!115742 (array_inv!33919 a!3861)))

(assert (=> start!115742 true))

(declare-fun b!1368795 () Bool)

(declare-fun res!912305 () Bool)

(assert (=> b!1368795 (=> (not res!912305) (not e!775425))))

(declare-fun contains!9641 (List!31959 (_ BitVec 64)) Bool)

(assert (=> b!1368795 (= res!912305 (not (contains!9641 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368796 () Bool)

(declare-fun res!912310 () Bool)

(assert (=> b!1368796 (=> (not res!912310) (not e!775425))))

(assert (=> b!1368796 (= res!912310 (not (contains!9641 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368797 () Bool)

(declare-fun res!912308 () Bool)

(assert (=> b!1368797 (=> (not res!912308) (not e!775426))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1368797 (= res!912308 (not (validKeyInArray!0 (select (arr!44891 a!3861) from!3239))))))

(declare-fun b!1368798 () Bool)

(declare-fun res!912312 () Bool)

(assert (=> b!1368798 (=> (not res!912312) (not e!775425))))

(assert (=> b!1368798 (= res!912312 (not (contains!9641 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368799 () Bool)

(declare-fun res!912306 () Bool)

(assert (=> b!1368799 (=> (not res!912306) (not e!775425))))

(assert (=> b!1368799 (= res!912306 (noDuplicate!2498 acc!866))))

(declare-fun b!1368800 () Bool)

(declare-fun res!912307 () Bool)

(assert (=> b!1368800 (=> (not res!912307) (not e!775425))))

(assert (=> b!1368800 (= res!912307 (not (contains!9641 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368801 () Bool)

(declare-fun res!912309 () Bool)

(assert (=> b!1368801 (=> (not res!912309) (not e!775426))))

(assert (=> b!1368801 (= res!912309 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1368802 () Bool)

(assert (=> b!1368802 (= e!775425 e!775426)))

(declare-fun res!912302 () Bool)

(assert (=> b!1368802 (=> (not res!912302) (not e!775426))))

(assert (=> b!1368802 (= res!912302 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-fun lt!602128 () Unit!45219)

(declare-fun noDuplicateSubseq!230 (List!31959 List!31959) Unit!45219)

(assert (=> b!1368802 (= lt!602128 (noDuplicateSubseq!230 newAcc!98 acc!866))))

(declare-fun b!1368803 () Bool)

(declare-fun res!912311 () Bool)

(assert (=> b!1368803 (=> (not res!912311) (not e!775426))))

(assert (=> b!1368803 (= res!912311 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun b!1368804 () Bool)

(declare-fun res!912304 () Bool)

(assert (=> b!1368804 (=> (not res!912304) (not e!775426))))

(assert (=> b!1368804 (= res!912304 (bvslt from!3239 (size!45441 a!3861)))))

(declare-fun b!1368805 () Bool)

(declare-fun res!912303 () Bool)

(assert (=> b!1368805 (=> (not res!912303) (not e!775425))))

(declare-fun subseq!1043 (List!31959 List!31959) Bool)

(assert (=> b!1368805 (= res!912303 (subseq!1043 newAcc!98 acc!866))))

(assert (= (and start!115742 res!912313) b!1368799))

(assert (= (and b!1368799 res!912306) b!1368795))

(assert (= (and b!1368795 res!912305) b!1368798))

(assert (= (and b!1368798 res!912312) b!1368800))

(assert (= (and b!1368800 res!912307) b!1368796))

(assert (= (and b!1368796 res!912310) b!1368805))

(assert (= (and b!1368805 res!912303) b!1368802))

(assert (= (and b!1368802 res!912302) b!1368804))

(assert (= (and b!1368804 res!912304) b!1368797))

(assert (= (and b!1368797 res!912308) b!1368801))

(assert (= (and b!1368801 res!912309) b!1368803))

(assert (= (and b!1368803 res!912311) b!1368794))

(declare-fun m!1252675 () Bool)

(assert (=> b!1368798 m!1252675))

(declare-fun m!1252677 () Bool)

(assert (=> b!1368803 m!1252677))

(declare-fun m!1252679 () Bool)

(assert (=> b!1368800 m!1252679))

(declare-fun m!1252681 () Bool)

(assert (=> b!1368797 m!1252681))

(assert (=> b!1368797 m!1252681))

(declare-fun m!1252683 () Bool)

(assert (=> b!1368797 m!1252683))

(declare-fun m!1252685 () Bool)

(assert (=> b!1368796 m!1252685))

(declare-fun m!1252687 () Bool)

(assert (=> b!1368795 m!1252687))

(declare-fun m!1252689 () Bool)

(assert (=> b!1368802 m!1252689))

(declare-fun m!1252691 () Bool)

(assert (=> b!1368802 m!1252691))

(declare-fun m!1252693 () Bool)

(assert (=> b!1368794 m!1252693))

(declare-fun m!1252695 () Bool)

(assert (=> b!1368794 m!1252695))

(declare-fun m!1252697 () Bool)

(assert (=> b!1368794 m!1252697))

(declare-fun m!1252699 () Bool)

(assert (=> start!115742 m!1252699))

(declare-fun m!1252701 () Bool)

(assert (=> b!1368799 m!1252701))

(declare-fun m!1252703 () Bool)

(assert (=> b!1368805 m!1252703))

(push 1)

(assert (not b!1368802))

(assert (not b!1368799))

(assert (not b!1368794))

(assert (not b!1368797))

(assert (not b!1368795))

(assert (not b!1368798))

(assert (not b!1368796))

(assert (not b!1368805))

(assert (not b!1368800))

(assert (not start!115742))

(assert (not b!1368803))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!146917 () Bool)

(assert (=> d!146917 (= (validKeyInArray!0 (select (arr!44891 a!3861) from!3239)) (and (not (= (select (arr!44891 a!3861) from!3239) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44891 a!3861) from!3239) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1368797 d!146917))

(declare-fun d!146919 () Bool)

(declare-fun lt!602143 () Bool)

(declare-fun content!720 (List!31959) (Set (_ BitVec 64)))

(assert (=> d!146919 (= lt!602143 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!720 newAcc!98)))))

(declare-fun e!775461 () Bool)

(assert (=> d!146919 (= lt!602143 e!775461)))

(declare-fun res!912399 () Bool)

(assert (=> d!146919 (=> (not res!912399) (not e!775461))))

(assert (=> d!146919 (= res!912399 (is-Cons!31955 newAcc!98))))

(assert (=> d!146919 (= (contains!9641 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602143)))

(declare-fun b!1368897 () Bool)

(declare-fun e!775462 () Bool)

(assert (=> b!1368897 (= e!775461 e!775462)))

(declare-fun res!912400 () Bool)

(assert (=> b!1368897 (=> res!912400 e!775462)))

(assert (=> b!1368897 (= res!912400 (= (h!33164 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1368898 () Bool)

(assert (=> b!1368898 (= e!775462 (contains!9641 (t!46653 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146919 res!912399) b!1368897))

(assert (= (and b!1368897 (not res!912400)) b!1368898))

(declare-fun m!1252765 () Bool)

(assert (=> d!146919 m!1252765))

(declare-fun m!1252767 () Bool)

(assert (=> d!146919 m!1252767))

(declare-fun m!1252769 () Bool)

(assert (=> b!1368898 m!1252769))

(assert (=> b!1368796 d!146919))

(declare-fun d!146921 () Bool)

(declare-fun lt!602144 () Bool)

(assert (=> d!146921 (= lt!602144 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!720 acc!866)))))

(declare-fun e!775463 () Bool)

(assert (=> d!146921 (= lt!602144 e!775463)))

(declare-fun res!912401 () Bool)

(assert (=> d!146921 (=> (not res!912401) (not e!775463))))

(assert (=> d!146921 (= res!912401 (is-Cons!31955 acc!866))))

(assert (=> d!146921 (= (contains!9641 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602144)))

(declare-fun b!1368899 () Bool)

(declare-fun e!775464 () Bool)

(assert (=> b!1368899 (= e!775463 e!775464)))

(declare-fun res!912402 () Bool)

(assert (=> b!1368899 (=> res!912402 e!775464)))

(assert (=> b!1368899 (= res!912402 (= (h!33164 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1368900 () Bool)

(assert (=> b!1368900 (= e!775464 (contains!9641 (t!46653 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146921 res!912401) b!1368899))

(assert (= (and b!1368899 (not res!912402)) b!1368900))

(declare-fun m!1252775 () Bool)

(assert (=> d!146921 m!1252775))

(declare-fun m!1252777 () Bool)

(assert (=> d!146921 m!1252777))

(declare-fun m!1252779 () Bool)

(assert (=> b!1368900 m!1252779))

(assert (=> b!1368795 d!146921))

(declare-fun d!146923 () Bool)

(declare-fun res!912407 () Bool)

(declare-fun e!775469 () Bool)

(assert (=> d!146923 (=> res!912407 e!775469)))

(assert (=> d!146923 (= res!912407 (is-Nil!31956 newAcc!98))))

(assert (=> d!146923 (= (noDuplicate!2498 newAcc!98) e!775469)))

(declare-fun b!1368905 () Bool)

(declare-fun e!775470 () Bool)

(assert (=> b!1368905 (= e!775469 e!775470)))

(declare-fun res!912408 () Bool)

(assert (=> b!1368905 (=> (not res!912408) (not e!775470))))

(assert (=> b!1368905 (= res!912408 (not (contains!9641 (t!46653 newAcc!98) (h!33164 newAcc!98))))))

(declare-fun b!1368906 () Bool)

(assert (=> b!1368906 (= e!775470 (noDuplicate!2498 (t!46653 newAcc!98)))))

(assert (= (and d!146923 (not res!912407)) b!1368905))

(assert (= (and b!1368905 res!912408) b!1368906))

(declare-fun m!1252785 () Bool)

(assert (=> b!1368905 m!1252785))

(declare-fun m!1252787 () Bool)

(assert (=> b!1368906 m!1252787))

(assert (=> b!1368794 d!146923))

(declare-fun b!1368955 () Bool)

(declare-fun e!775520 () Bool)

(declare-fun call!65498 () Bool)

(assert (=> b!1368955 (= e!775520 call!65498)))

(declare-fun b!1368956 () Bool)

(assert (=> b!1368956 (= e!775520 call!65498)))

(declare-fun b!1368957 () Bool)

(declare-fun e!775519 () Bool)

(declare-fun e!775518 () Bool)

(assert (=> b!1368957 (= e!775519 e!775518)))

(declare-fun res!912454 () Bool)

(assert (=> b!1368957 (=> (not res!912454) (not e!775518))))

(declare-fun e!775517 () Bool)

(assert (=> b!1368957 (= res!912454 (not e!775517))))

(declare-fun res!912455 () Bool)

(assert (=> b!1368957 (=> (not res!912455) (not e!775517))))

(assert (=> b!1368957 (= res!912455 (validKeyInArray!0 (select (arr!44891 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1368958 () Bool)

(assert (=> b!1368958 (= e!775518 e!775520)))

(declare-fun c!127691 () Bool)

(assert (=> b!1368958 (= c!127691 (validKeyInArray!0 (select (arr!44891 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun d!146929 () Bool)

(declare-fun res!912453 () Bool)

(assert (=> d!146929 (=> res!912453 e!775519)))

(assert (=> d!146929 (= res!912453 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) (size!45441 a!3861)))))

(assert (=> d!146929 (= (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) newAcc!98) e!775519)))

(declare-fun b!1368959 () Bool)

(assert (=> b!1368959 (= e!775517 (contains!9641 newAcc!98 (select (arr!44891 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun bm!65495 () Bool)

(assert (=> bm!65495 (= call!65498 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239 #b00000000000000000000000000000001) (ite c!127691 (Cons!31955 (select (arr!44891 a!3861) (bvadd #b00000000000000000000000000000001 from!3239)) newAcc!98) newAcc!98)))))

(assert (= (and d!146929 (not res!912453)) b!1368957))

(assert (= (and b!1368957 res!912455) b!1368959))

(assert (= (and b!1368957 res!912454) b!1368958))

(assert (= (and b!1368958 c!127691) b!1368956))

(assert (= (and b!1368958 (not c!127691)) b!1368955))

(assert (= (or b!1368956 b!1368955) bm!65495))

(declare-fun m!1252811 () Bool)

(assert (=> b!1368957 m!1252811))

(assert (=> b!1368957 m!1252811))

(declare-fun m!1252813 () Bool)

(assert (=> b!1368957 m!1252813))

(assert (=> b!1368958 m!1252811))

(assert (=> b!1368958 m!1252811))

(assert (=> b!1368958 m!1252813))

(assert (=> b!1368959 m!1252811))

(assert (=> b!1368959 m!1252811))

(declare-fun m!1252815 () Bool)

(assert (=> b!1368959 m!1252815))

(assert (=> bm!65495 m!1252811))

(declare-fun m!1252817 () Bool)

(assert (=> bm!65495 m!1252817))

(assert (=> b!1368794 d!146929))

(declare-fun d!146941 () Bool)

(assert (=> d!146941 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) newAcc!98)))

(declare-fun lt!602154 () Unit!45219)

(declare-fun choose!80 (array!92934 List!31959 List!31959 (_ BitVec 32)) Unit!45219)

(assert (=> d!146941 (= lt!602154 (choose!80 a!3861 acc!866 newAcc!98 (bvadd #b00000000000000000000000000000001 from!3239)))))

(assert (=> d!146941 (bvslt (size!45441 a!3861) #b01111111111111111111111111111111)))

(assert (=> d!146941 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 acc!866 newAcc!98 (bvadd #b00000000000000000000000000000001 from!3239)) lt!602154)))

(declare-fun bs!39267 () Bool)

(assert (= bs!39267 d!146941))

(assert (=> bs!39267 m!1252695))

(declare-fun m!1252827 () Bool)

(assert (=> bs!39267 m!1252827))

(assert (=> b!1368794 d!146941))

(declare-fun b!1368998 () Bool)

(declare-fun e!775558 () Bool)

(declare-fun e!775557 () Bool)

(assert (=> b!1368998 (= e!775558 e!775557)))

(declare-fun res!912490 () Bool)

(assert (=> b!1368998 (=> res!912490 e!775557)))

(declare-fun e!775556 () Bool)

(assert (=> b!1368998 (= res!912490 e!775556)))

(declare-fun res!912489 () Bool)

(assert (=> b!1368998 (=> (not res!912489) (not e!775556))))

(assert (=> b!1368998 (= res!912489 (= (h!33164 newAcc!98) (h!33164 acc!866)))))

(declare-fun b!1369000 () Bool)

(assert (=> b!1369000 (= e!775557 (subseq!1043 newAcc!98 (t!46653 acc!866)))))

(declare-fun b!1368999 () Bool)

(assert (=> b!1368999 (= e!775556 (subseq!1043 (t!46653 newAcc!98) (t!46653 acc!866)))))

(declare-fun d!146947 () Bool)

(declare-fun res!912487 () Bool)

(declare-fun e!775555 () Bool)

(assert (=> d!146947 (=> res!912487 e!775555)))

(assert (=> d!146947 (= res!912487 (is-Nil!31956 newAcc!98))))

(assert (=> d!146947 (= (subseq!1043 newAcc!98 acc!866) e!775555)))

(declare-fun b!1368997 () Bool)

(assert (=> b!1368997 (= e!775555 e!775558)))

(declare-fun res!912488 () Bool)

(assert (=> b!1368997 (=> (not res!912488) (not e!775558))))

(assert (=> b!1368997 (= res!912488 (is-Cons!31955 acc!866))))

(assert (= (and d!146947 (not res!912487)) b!1368997))

(assert (= (and b!1368997 res!912488) b!1368998))

(assert (= (and b!1368998 res!912489) b!1368999))

(assert (= (and b!1368998 (not res!912490)) b!1369000))

(declare-fun m!1252835 () Bool)

(assert (=> b!1369000 m!1252835))

(declare-fun m!1252837 () Bool)

(assert (=> b!1368999 m!1252837))

(assert (=> b!1368805 d!146947))

(declare-fun d!146955 () Bool)

(assert (=> d!146955 (= (array_inv!33919 a!3861) (bvsge (size!45441 a!3861) #b00000000000000000000000000000000))))

(assert (=> start!115742 d!146955))

(declare-fun b!1369004 () Bool)

(declare-fun e!775565 () Bool)

(declare-fun call!65502 () Bool)

(assert (=> b!1369004 (= e!775565 call!65502)))

(declare-fun b!1369005 () Bool)

(assert (=> b!1369005 (= e!775565 call!65502)))

(declare-fun b!1369006 () Bool)

(declare-fun e!775564 () Bool)

(declare-fun e!775563 () Bool)

(assert (=> b!1369006 (= e!775564 e!775563)))

(declare-fun res!912495 () Bool)

(assert (=> b!1369006 (=> (not res!912495) (not e!775563))))

(declare-fun e!775562 () Bool)

(assert (=> b!1369006 (= res!912495 (not e!775562))))

(declare-fun res!912496 () Bool)

(assert (=> b!1369006 (=> (not res!912496) (not e!775562))))

(assert (=> b!1369006 (= res!912496 (validKeyInArray!0 (select (arr!44891 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1369007 () Bool)

(assert (=> b!1369007 (= e!775563 e!775565)))

(declare-fun c!127695 () Bool)

(assert (=> b!1369007 (= c!127695 (validKeyInArray!0 (select (arr!44891 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun d!146959 () Bool)

(declare-fun res!912494 () Bool)

(assert (=> d!146959 (=> res!912494 e!775564)))

(assert (=> d!146959 (= res!912494 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) (size!45441 a!3861)))))

(assert (=> d!146959 (= (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866) e!775564)))

(declare-fun b!1369008 () Bool)

(assert (=> b!1369008 (= e!775562 (contains!9641 acc!866 (select (arr!44891 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun bm!65499 () Bool)

(assert (=> bm!65499 (= call!65502 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239 #b00000000000000000000000000000001) (ite c!127695 (Cons!31955 (select (arr!44891 a!3861) (bvadd #b00000000000000000000000000000001 from!3239)) acc!866) acc!866)))))

(assert (= (and d!146959 (not res!912494)) b!1369006))

(assert (= (and b!1369006 res!912496) b!1369008))

(assert (= (and b!1369006 res!912495) b!1369007))

(assert (= (and b!1369007 c!127695) b!1369005))

(assert (= (and b!1369007 (not c!127695)) b!1369004))

(assert (= (or b!1369005 b!1369004) bm!65499))

(assert (=> b!1369006 m!1252811))

(assert (=> b!1369006 m!1252811))

(assert (=> b!1369006 m!1252813))

(assert (=> b!1369007 m!1252811))

(assert (=> b!1369007 m!1252811))

(assert (=> b!1369007 m!1252813))

(assert (=> b!1369008 m!1252811))

(assert (=> b!1369008 m!1252811))

(declare-fun m!1252845 () Bool)

(assert (=> b!1369008 m!1252845))

(assert (=> bm!65499 m!1252811))

(declare-fun m!1252849 () Bool)

(assert (=> bm!65499 m!1252849))

(assert (=> b!1368803 d!146959))

(declare-fun b!1369019 () Bool)

(declare-fun e!775577 () Bool)

(declare-fun call!65505 () Bool)

(assert (=> b!1369019 (= e!775577 call!65505)))

(declare-fun b!1369020 () Bool)

(assert (=> b!1369020 (= e!775577 call!65505)))

(declare-fun b!1369021 () Bool)

(declare-fun e!775576 () Bool)

(declare-fun e!775575 () Bool)

(assert (=> b!1369021 (= e!775576 e!775575)))

(declare-fun res!912504 () Bool)

(assert (=> b!1369021 (=> (not res!912504) (not e!775575))))

(declare-fun e!775574 () Bool)

(assert (=> b!1369021 (= res!912504 (not e!775574))))

(declare-fun res!912505 () Bool)

(assert (=> b!1369021 (=> (not res!912505) (not e!775574))))

(assert (=> b!1369021 (= res!912505 (validKeyInArray!0 (select (arr!44891 a!3861) from!3239)))))

(declare-fun b!1369022 () Bool)

(assert (=> b!1369022 (= e!775575 e!775577)))

(declare-fun c!127698 () Bool)

(assert (=> b!1369022 (= c!127698 (validKeyInArray!0 (select (arr!44891 a!3861) from!3239)))))

(declare-fun d!146963 () Bool)

(declare-fun res!912503 () Bool)

(assert (=> d!146963 (=> res!912503 e!775576)))

(assert (=> d!146963 (= res!912503 (bvsge from!3239 (size!45441 a!3861)))))

(assert (=> d!146963 (= (arrayNoDuplicates!0 a!3861 from!3239 acc!866) e!775576)))

(declare-fun b!1369023 () Bool)

(assert (=> b!1369023 (= e!775574 (contains!9641 acc!866 (select (arr!44891 a!3861) from!3239)))))

(declare-fun bm!65502 () Bool)

(assert (=> bm!65502 (= call!65505 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!127698 (Cons!31955 (select (arr!44891 a!3861) from!3239) acc!866) acc!866)))))

(assert (= (and d!146963 (not res!912503)) b!1369021))

(assert (= (and b!1369021 res!912505) b!1369023))

(assert (= (and b!1369021 res!912504) b!1369022))

(assert (= (and b!1369022 c!127698) b!1369020))

(assert (= (and b!1369022 (not c!127698)) b!1369019))

(assert (= (or b!1369020 b!1369019) bm!65502))

(assert (=> b!1369021 m!1252681))

(assert (=> b!1369021 m!1252681))

(assert (=> b!1369021 m!1252683))

(assert (=> b!1369022 m!1252681))

(assert (=> b!1369022 m!1252681))

(assert (=> b!1369022 m!1252683))

(assert (=> b!1369023 m!1252681))

(assert (=> b!1369023 m!1252681))

(declare-fun m!1252857 () Bool)

(assert (=> b!1369023 m!1252857))

(assert (=> bm!65502 m!1252681))

(declare-fun m!1252859 () Bool)

(assert (=> bm!65502 m!1252859))

(assert (=> b!1368802 d!146963))

(declare-fun d!146969 () Bool)

(assert (=> d!146969 (noDuplicate!2498 newAcc!98)))

(declare-fun lt!602168 () Unit!45219)

(declare-fun choose!2000 (List!31959 List!31959) Unit!45219)

(assert (=> d!146969 (= lt!602168 (choose!2000 newAcc!98 acc!866))))

(declare-fun e!775587 () Bool)

(assert (=> d!146969 e!775587))

(declare-fun res!912515 () Bool)

(assert (=> d!146969 (=> (not res!912515) (not e!775587))))

(assert (=> d!146969 (= res!912515 (subseq!1043 newAcc!98 acc!866))))

(assert (=> d!146969 (= (noDuplicateSubseq!230 newAcc!98 acc!866) lt!602168)))

(declare-fun b!1369033 () Bool)

(assert (=> b!1369033 (= e!775587 (noDuplicate!2498 acc!866))))

(assert (= (and d!146969 res!912515) b!1369033))

(assert (=> d!146969 m!1252693))

(declare-fun m!1252875 () Bool)

(assert (=> d!146969 m!1252875))

(assert (=> d!146969 m!1252703))

(assert (=> b!1369033 m!1252701))

(assert (=> b!1368802 d!146969))

(declare-fun d!146977 () Bool)

(declare-fun lt!602169 () Bool)

(assert (=> d!146977 (= lt!602169 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!720 newAcc!98)))))

(declare-fun e!775588 () Bool)

(assert (=> d!146977 (= lt!602169 e!775588)))

(declare-fun res!912517 () Bool)

(assert (=> d!146977 (=> (not res!912517) (not e!775588))))

(assert (=> d!146977 (= res!912517 (is-Cons!31955 newAcc!98))))

(assert (=> d!146977 (= (contains!9641 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602169)))

(declare-fun b!1369034 () Bool)

(declare-fun e!775591 () Bool)

(assert (=> b!1369034 (= e!775588 e!775591)))

(declare-fun res!912519 () Bool)

(assert (=> b!1369034 (=> res!912519 e!775591)))

(assert (=> b!1369034 (= res!912519 (= (h!33164 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1369035 () Bool)

(assert (=> b!1369035 (= e!775591 (contains!9641 (t!46653 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146977 res!912517) b!1369034))

(assert (= (and b!1369034 (not res!912519)) b!1369035))

(assert (=> d!146977 m!1252765))

(declare-fun m!1252877 () Bool)

(assert (=> d!146977 m!1252877))

(declare-fun m!1252879 () Bool)

(assert (=> b!1369035 m!1252879))

(assert (=> b!1368800 d!146977))

(declare-fun d!146979 () Bool)

(declare-fun res!912521 () Bool)

(declare-fun e!775594 () Bool)

(assert (=> d!146979 (=> res!912521 e!775594)))

(assert (=> d!146979 (= res!912521 (is-Nil!31956 acc!866))))

(assert (=> d!146979 (= (noDuplicate!2498 acc!866) e!775594)))

(declare-fun b!1369041 () Bool)

(declare-fun e!775595 () Bool)

(assert (=> b!1369041 (= e!775594 e!775595)))

(declare-fun res!912522 () Bool)

(assert (=> b!1369041 (=> (not res!912522) (not e!775595))))

(assert (=> b!1369041 (= res!912522 (not (contains!9641 (t!46653 acc!866) (h!33164 acc!866))))))

(declare-fun b!1369042 () Bool)

(assert (=> b!1369042 (= e!775595 (noDuplicate!2498 (t!46653 acc!866)))))

(assert (= (and d!146979 (not res!912521)) b!1369041))

(assert (= (and b!1369041 res!912522) b!1369042))

(declare-fun m!1252883 () Bool)

(assert (=> b!1369041 m!1252883))

(declare-fun m!1252885 () Bool)

(assert (=> b!1369042 m!1252885))

(assert (=> b!1368799 d!146979))

(declare-fun d!146981 () Bool)

(declare-fun lt!602170 () Bool)

(assert (=> d!146981 (= lt!602170 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!720 acc!866)))))

(declare-fun e!775596 () Bool)

(assert (=> d!146981 (= lt!602170 e!775596)))

(declare-fun res!912523 () Bool)

(assert (=> d!146981 (=> (not res!912523) (not e!775596))))

(assert (=> d!146981 (= res!912523 (is-Cons!31955 acc!866))))

(assert (=> d!146981 (= (contains!9641 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602170)))

(declare-fun b!1369043 () Bool)

(declare-fun e!775597 () Bool)

(assert (=> b!1369043 (= e!775596 e!775597)))

(declare-fun res!912524 () Bool)

(assert (=> b!1369043 (=> res!912524 e!775597)))

(assert (=> b!1369043 (= res!912524 (= (h!33164 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1369044 () Bool)

(assert (=> b!1369044 (= e!775597 (contains!9641 (t!46653 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146981 res!912523) b!1369043))

(assert (= (and b!1369043 (not res!912524)) b!1369044))

(assert (=> d!146981 m!1252775))

(declare-fun m!1252893 () Bool)

(assert (=> d!146981 m!1252893))

(declare-fun m!1252895 () Bool)

(assert (=> b!1369044 m!1252895))

(assert (=> b!1368798 d!146981))

(push 1)

