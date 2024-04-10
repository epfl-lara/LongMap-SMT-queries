; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114358 () Bool)

(assert start!114358)

(declare-fun b!1357881 () Bool)

(declare-fun e!770646 () Bool)

(declare-fun e!770647 () Bool)

(assert (=> b!1357881 (= e!770646 (not e!770647))))

(declare-fun res!902589 () Bool)

(assert (=> b!1357881 (=> res!902589 e!770647)))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1357881 (= res!902589 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-datatypes ((List!31711 0))(
  ( (Nil!31708) (Cons!31707 (h!32916 (_ BitVec 64)) (t!46375 List!31711)) )
))
(declare-fun lt!599238 () List!31711)

(declare-fun acc!759 () List!31711)

(declare-datatypes ((array!92450 0))(
  ( (array!92451 (arr!44670 (Array (_ BitVec 32) (_ BitVec 64))) (size!45220 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92450)

(declare-fun $colon$colon!825 (List!31711 (_ BitVec 64)) List!31711)

(assert (=> b!1357881 (= lt!599238 ($colon$colon!825 acc!759 (select (arr!44670 a!3742) from!3120)))))

(declare-fun subseq!822 (List!31711 List!31711) Bool)

(assert (=> b!1357881 (subseq!822 acc!759 acc!759)))

(declare-datatypes ((Unit!44675 0))(
  ( (Unit!44676) )
))
(declare-fun lt!599239 () Unit!44675)

(declare-fun lemmaListSubSeqRefl!0 (List!31711) Unit!44675)

(assert (=> b!1357881 (= lt!599239 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1357882 () Bool)

(declare-fun res!902594 () Bool)

(assert (=> b!1357882 (=> (not res!902594) (not e!770646))))

(declare-fun arrayNoDuplicates!0 (array!92450 (_ BitVec 32) List!31711) Bool)

(assert (=> b!1357882 (= res!902594 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1357883 () Bool)

(declare-fun res!902600 () Bool)

(assert (=> b!1357883 (=> (not res!902600) (not e!770646))))

(assert (=> b!1357883 (= res!902600 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45220 a!3742)))))

(declare-fun b!1357884 () Bool)

(declare-fun res!902601 () Bool)

(assert (=> b!1357884 (=> (not res!902601) (not e!770646))))

(declare-fun noDuplicate!2277 (List!31711) Bool)

(assert (=> b!1357884 (= res!902601 (noDuplicate!2277 acc!759))))

(declare-fun b!1357886 () Bool)

(declare-fun res!902596 () Bool)

(assert (=> b!1357886 (=> (not res!902596) (not e!770646))))

(declare-fun contains!9420 (List!31711 (_ BitVec 64)) Bool)

(assert (=> b!1357886 (= res!902596 (not (contains!9420 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357887 () Bool)

(declare-fun res!902591 () Bool)

(assert (=> b!1357887 (=> res!902591 e!770647)))

(assert (=> b!1357887 (= res!902591 (contains!9420 lt!599238 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1357888 () Bool)

(declare-fun res!902597 () Bool)

(assert (=> b!1357888 (=> res!902597 e!770647)))

(assert (=> b!1357888 (= res!902597 (not (noDuplicate!2277 lt!599238)))))

(declare-fun b!1357889 () Bool)

(declare-fun res!902602 () Bool)

(assert (=> b!1357889 (=> (not res!902602) (not e!770646))))

(assert (=> b!1357889 (= res!902602 (not (contains!9420 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357890 () Bool)

(declare-fun res!902598 () Bool)

(assert (=> b!1357890 (=> res!902598 e!770647)))

(assert (=> b!1357890 (= res!902598 (contains!9420 lt!599238 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1357891 () Bool)

(declare-fun res!902592 () Bool)

(assert (=> b!1357891 (=> (not res!902592) (not e!770646))))

(assert (=> b!1357891 (= res!902592 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31708))))

(declare-fun b!1357892 () Bool)

(declare-fun res!902599 () Bool)

(assert (=> b!1357892 (=> (not res!902599) (not e!770646))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1357892 (= res!902599 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45220 a!3742))))))

(declare-fun b!1357885 () Bool)

(assert (=> b!1357885 (= e!770647 (subseq!822 acc!759 lt!599238))))

(declare-fun res!902590 () Bool)

(assert (=> start!114358 (=> (not res!902590) (not e!770646))))

(assert (=> start!114358 (= res!902590 (and (bvslt (size!45220 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45220 a!3742))))))

(assert (=> start!114358 e!770646))

(assert (=> start!114358 true))

(declare-fun array_inv!33698 (array!92450) Bool)

(assert (=> start!114358 (array_inv!33698 a!3742)))

(declare-fun b!1357893 () Bool)

(declare-fun res!902593 () Bool)

(assert (=> b!1357893 (=> (not res!902593) (not e!770646))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1357893 (= res!902593 (validKeyInArray!0 (select (arr!44670 a!3742) from!3120)))))

(declare-fun b!1357894 () Bool)

(declare-fun res!902595 () Bool)

(assert (=> b!1357894 (=> (not res!902595) (not e!770646))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1357894 (= res!902595 (not (validKeyInArray!0 l!3587)))))

(assert (= (and start!114358 res!902590) b!1357884))

(assert (= (and b!1357884 res!902601) b!1357886))

(assert (= (and b!1357886 res!902596) b!1357889))

(assert (= (and b!1357889 res!902602) b!1357891))

(assert (= (and b!1357891 res!902592) b!1357882))

(assert (= (and b!1357882 res!902594) b!1357892))

(assert (= (and b!1357892 res!902599) b!1357894))

(assert (= (and b!1357894 res!902595) b!1357883))

(assert (= (and b!1357883 res!902600) b!1357893))

(assert (= (and b!1357893 res!902593) b!1357881))

(assert (= (and b!1357881 (not res!902589)) b!1357888))

(assert (= (and b!1357888 (not res!902597)) b!1357887))

(assert (= (and b!1357887 (not res!902591)) b!1357890))

(assert (= (and b!1357890 (not res!902598)) b!1357885))

(declare-fun m!1243533 () Bool)

(assert (=> b!1357894 m!1243533))

(declare-fun m!1243535 () Bool)

(assert (=> b!1357885 m!1243535))

(declare-fun m!1243537 () Bool)

(assert (=> b!1357893 m!1243537))

(assert (=> b!1357893 m!1243537))

(declare-fun m!1243539 () Bool)

(assert (=> b!1357893 m!1243539))

(declare-fun m!1243541 () Bool)

(assert (=> b!1357882 m!1243541))

(declare-fun m!1243543 () Bool)

(assert (=> b!1357887 m!1243543))

(assert (=> b!1357881 m!1243537))

(assert (=> b!1357881 m!1243537))

(declare-fun m!1243545 () Bool)

(assert (=> b!1357881 m!1243545))

(declare-fun m!1243547 () Bool)

(assert (=> b!1357881 m!1243547))

(declare-fun m!1243549 () Bool)

(assert (=> b!1357881 m!1243549))

(declare-fun m!1243551 () Bool)

(assert (=> b!1357884 m!1243551))

(declare-fun m!1243553 () Bool)

(assert (=> start!114358 m!1243553))

(declare-fun m!1243555 () Bool)

(assert (=> b!1357888 m!1243555))

(declare-fun m!1243557 () Bool)

(assert (=> b!1357889 m!1243557))

(declare-fun m!1243559 () Bool)

(assert (=> b!1357890 m!1243559))

(declare-fun m!1243561 () Bool)

(assert (=> b!1357891 m!1243561))

(declare-fun m!1243563 () Bool)

(assert (=> b!1357886 m!1243563))

(check-sat (not b!1357884) (not b!1357881) (not b!1357890) (not b!1357887) (not b!1357893) (not b!1357894) (not b!1357885) (not b!1357882) (not b!1357891) (not b!1357888) (not start!114358) (not b!1357886) (not b!1357889))
(check-sat)
(get-model)

(declare-fun d!145249 () Bool)

(declare-fun lt!599248 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!679 (List!31711) (InoxSet (_ BitVec 64)))

(assert (=> d!145249 (= lt!599248 (select (content!679 lt!599238) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!770662 () Bool)

(assert (=> d!145249 (= lt!599248 e!770662)))

(declare-fun res!902649 () Bool)

(assert (=> d!145249 (=> (not res!902649) (not e!770662))))

(get-info :version)

(assert (=> d!145249 (= res!902649 ((_ is Cons!31707) lt!599238))))

(assert (=> d!145249 (= (contains!9420 lt!599238 #b0000000000000000000000000000000000000000000000000000000000000000) lt!599248)))

(declare-fun b!1357941 () Bool)

(declare-fun e!770661 () Bool)

(assert (=> b!1357941 (= e!770662 e!770661)))

(declare-fun res!902650 () Bool)

(assert (=> b!1357941 (=> res!902650 e!770661)))

(assert (=> b!1357941 (= res!902650 (= (h!32916 lt!599238) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1357942 () Bool)

(assert (=> b!1357942 (= e!770661 (contains!9420 (t!46375 lt!599238) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145249 res!902649) b!1357941))

(assert (= (and b!1357941 (not res!902650)) b!1357942))

(declare-fun m!1243597 () Bool)

(assert (=> d!145249 m!1243597))

(declare-fun m!1243599 () Bool)

(assert (=> d!145249 m!1243599))

(declare-fun m!1243601 () Bool)

(assert (=> b!1357942 m!1243601))

(assert (=> b!1357887 d!145249))

(declare-fun b!1357951 () Bool)

(declare-fun e!770671 () Bool)

(declare-fun e!770672 () Bool)

(assert (=> b!1357951 (= e!770671 e!770672)))

(declare-fun res!902661 () Bool)

(assert (=> b!1357951 (=> (not res!902661) (not e!770672))))

(assert (=> b!1357951 (= res!902661 ((_ is Cons!31707) lt!599238))))

(declare-fun b!1357954 () Bool)

(declare-fun e!770674 () Bool)

(assert (=> b!1357954 (= e!770674 (subseq!822 acc!759 (t!46375 lt!599238)))))

(declare-fun b!1357952 () Bool)

(assert (=> b!1357952 (= e!770672 e!770674)))

(declare-fun res!902662 () Bool)

(assert (=> b!1357952 (=> res!902662 e!770674)))

(declare-fun e!770673 () Bool)

(assert (=> b!1357952 (= res!902662 e!770673)))

(declare-fun res!902660 () Bool)

(assert (=> b!1357952 (=> (not res!902660) (not e!770673))))

(assert (=> b!1357952 (= res!902660 (= (h!32916 acc!759) (h!32916 lt!599238)))))

(declare-fun b!1357953 () Bool)

(assert (=> b!1357953 (= e!770673 (subseq!822 (t!46375 acc!759) (t!46375 lt!599238)))))

(declare-fun d!145251 () Bool)

(declare-fun res!902659 () Bool)

(assert (=> d!145251 (=> res!902659 e!770671)))

(assert (=> d!145251 (= res!902659 ((_ is Nil!31708) acc!759))))

(assert (=> d!145251 (= (subseq!822 acc!759 lt!599238) e!770671)))

(assert (= (and d!145251 (not res!902659)) b!1357951))

(assert (= (and b!1357951 res!902661) b!1357952))

(assert (= (and b!1357952 res!902660) b!1357953))

(assert (= (and b!1357952 (not res!902662)) b!1357954))

(declare-fun m!1243603 () Bool)

(assert (=> b!1357954 m!1243603))

(declare-fun m!1243605 () Bool)

(assert (=> b!1357953 m!1243605))

(assert (=> b!1357885 d!145251))

(declare-fun d!145257 () Bool)

(declare-fun lt!599249 () Bool)

(assert (=> d!145257 (= lt!599249 (select (content!679 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!770676 () Bool)

(assert (=> d!145257 (= lt!599249 e!770676)))

(declare-fun res!902663 () Bool)

(assert (=> d!145257 (=> (not res!902663) (not e!770676))))

(assert (=> d!145257 (= res!902663 ((_ is Cons!31707) acc!759))))

(assert (=> d!145257 (= (contains!9420 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000) lt!599249)))

(declare-fun b!1357955 () Bool)

(declare-fun e!770675 () Bool)

(assert (=> b!1357955 (= e!770676 e!770675)))

(declare-fun res!902664 () Bool)

(assert (=> b!1357955 (=> res!902664 e!770675)))

(assert (=> b!1357955 (= res!902664 (= (h!32916 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1357956 () Bool)

(assert (=> b!1357956 (= e!770675 (contains!9420 (t!46375 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145257 res!902663) b!1357955))

(assert (= (and b!1357955 (not res!902664)) b!1357956))

(declare-fun m!1243607 () Bool)

(assert (=> d!145257 m!1243607))

(declare-fun m!1243609 () Bool)

(assert (=> d!145257 m!1243609))

(declare-fun m!1243611 () Bool)

(assert (=> b!1357956 m!1243611))

(assert (=> b!1357886 d!145257))

(declare-fun d!145259 () Bool)

(declare-fun lt!599250 () Bool)

(assert (=> d!145259 (= lt!599250 (select (content!679 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!770680 () Bool)

(assert (=> d!145259 (= lt!599250 e!770680)))

(declare-fun res!902667 () Bool)

(assert (=> d!145259 (=> (not res!902667) (not e!770680))))

(assert (=> d!145259 (= res!902667 ((_ is Cons!31707) acc!759))))

(assert (=> d!145259 (= (contains!9420 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000) lt!599250)))

(declare-fun b!1357959 () Bool)

(declare-fun e!770679 () Bool)

(assert (=> b!1357959 (= e!770680 e!770679)))

(declare-fun res!902668 () Bool)

(assert (=> b!1357959 (=> res!902668 e!770679)))

(assert (=> b!1357959 (= res!902668 (= (h!32916 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1357960 () Bool)

(assert (=> b!1357960 (= e!770679 (contains!9420 (t!46375 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145259 res!902667) b!1357959))

(assert (= (and b!1357959 (not res!902668)) b!1357960))

(assert (=> d!145259 m!1243607))

(declare-fun m!1243613 () Bool)

(assert (=> d!145259 m!1243613))

(declare-fun m!1243615 () Bool)

(assert (=> b!1357960 m!1243615))

(assert (=> b!1357889 d!145259))

(declare-fun d!145261 () Bool)

(declare-fun lt!599251 () Bool)

(assert (=> d!145261 (= lt!599251 (select (content!679 lt!599238) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!770688 () Bool)

(assert (=> d!145261 (= lt!599251 e!770688)))

(declare-fun res!902675 () Bool)

(assert (=> d!145261 (=> (not res!902675) (not e!770688))))

(assert (=> d!145261 (= res!902675 ((_ is Cons!31707) lt!599238))))

(assert (=> d!145261 (= (contains!9420 lt!599238 #b1000000000000000000000000000000000000000000000000000000000000000) lt!599251)))

(declare-fun b!1357967 () Bool)

(declare-fun e!770687 () Bool)

(assert (=> b!1357967 (= e!770688 e!770687)))

(declare-fun res!902676 () Bool)

(assert (=> b!1357967 (=> res!902676 e!770687)))

(assert (=> b!1357967 (= res!902676 (= (h!32916 lt!599238) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1357968 () Bool)

(assert (=> b!1357968 (= e!770687 (contains!9420 (t!46375 lt!599238) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145261 res!902675) b!1357967))

(assert (= (and b!1357967 (not res!902676)) b!1357968))

(assert (=> d!145261 m!1243597))

(declare-fun m!1243617 () Bool)

(assert (=> d!145261 m!1243617))

(declare-fun m!1243619 () Bool)

(assert (=> b!1357968 m!1243619))

(assert (=> b!1357890 d!145261))

(declare-fun d!145263 () Bool)

(declare-fun res!902685 () Bool)

(declare-fun e!770697 () Bool)

(assert (=> d!145263 (=> res!902685 e!770697)))

(assert (=> d!145263 (= res!902685 ((_ is Nil!31708) lt!599238))))

(assert (=> d!145263 (= (noDuplicate!2277 lt!599238) e!770697)))

(declare-fun b!1357977 () Bool)

(declare-fun e!770698 () Bool)

(assert (=> b!1357977 (= e!770697 e!770698)))

(declare-fun res!902686 () Bool)

(assert (=> b!1357977 (=> (not res!902686) (not e!770698))))

(assert (=> b!1357977 (= res!902686 (not (contains!9420 (t!46375 lt!599238) (h!32916 lt!599238))))))

(declare-fun b!1357978 () Bool)

(assert (=> b!1357978 (= e!770698 (noDuplicate!2277 (t!46375 lt!599238)))))

(assert (= (and d!145263 (not res!902685)) b!1357977))

(assert (= (and b!1357977 res!902686) b!1357978))

(declare-fun m!1243627 () Bool)

(assert (=> b!1357977 m!1243627))

(declare-fun m!1243629 () Bool)

(assert (=> b!1357978 m!1243629))

(assert (=> b!1357888 d!145263))

(declare-fun d!145269 () Bool)

(assert (=> d!145269 (= ($colon$colon!825 acc!759 (select (arr!44670 a!3742) from!3120)) (Cons!31707 (select (arr!44670 a!3742) from!3120) acc!759))))

(assert (=> b!1357881 d!145269))

(declare-fun b!1357983 () Bool)

(declare-fun e!770703 () Bool)

(declare-fun e!770704 () Bool)

(assert (=> b!1357983 (= e!770703 e!770704)))

(declare-fun res!902693 () Bool)

(assert (=> b!1357983 (=> (not res!902693) (not e!770704))))

(assert (=> b!1357983 (= res!902693 ((_ is Cons!31707) acc!759))))

(declare-fun b!1357986 () Bool)

(declare-fun e!770706 () Bool)

(assert (=> b!1357986 (= e!770706 (subseq!822 acc!759 (t!46375 acc!759)))))

(declare-fun b!1357984 () Bool)

(assert (=> b!1357984 (= e!770704 e!770706)))

(declare-fun res!902694 () Bool)

(assert (=> b!1357984 (=> res!902694 e!770706)))

(declare-fun e!770705 () Bool)

(assert (=> b!1357984 (= res!902694 e!770705)))

(declare-fun res!902692 () Bool)

(assert (=> b!1357984 (=> (not res!902692) (not e!770705))))

(assert (=> b!1357984 (= res!902692 (= (h!32916 acc!759) (h!32916 acc!759)))))

(declare-fun b!1357985 () Bool)

(assert (=> b!1357985 (= e!770705 (subseq!822 (t!46375 acc!759) (t!46375 acc!759)))))

(declare-fun d!145271 () Bool)

(declare-fun res!902691 () Bool)

(assert (=> d!145271 (=> res!902691 e!770703)))

(assert (=> d!145271 (= res!902691 ((_ is Nil!31708) acc!759))))

(assert (=> d!145271 (= (subseq!822 acc!759 acc!759) e!770703)))

(assert (= (and d!145271 (not res!902691)) b!1357983))

(assert (= (and b!1357983 res!902693) b!1357984))

(assert (= (and b!1357984 res!902692) b!1357985))

(assert (= (and b!1357984 (not res!902694)) b!1357986))

(declare-fun m!1243631 () Bool)

(assert (=> b!1357986 m!1243631))

(declare-fun m!1243633 () Bool)

(assert (=> b!1357985 m!1243633))

(assert (=> b!1357881 d!145271))

(declare-fun d!145275 () Bool)

(assert (=> d!145275 (subseq!822 acc!759 acc!759)))

(declare-fun lt!599260 () Unit!44675)

(declare-fun choose!36 (List!31711) Unit!44675)

(assert (=> d!145275 (= lt!599260 (choose!36 acc!759))))

(assert (=> d!145275 (= (lemmaListSubSeqRefl!0 acc!759) lt!599260)))

(declare-fun bs!38944 () Bool)

(assert (= bs!38944 d!145275))

(assert (=> bs!38944 m!1243547))

(declare-fun m!1243641 () Bool)

(assert (=> bs!38944 m!1243641))

(assert (=> b!1357881 d!145275))

(declare-fun b!1358025 () Bool)

(declare-fun e!770744 () Bool)

(declare-fun e!770742 () Bool)

(assert (=> b!1358025 (= e!770744 e!770742)))

(declare-fun res!902726 () Bool)

(assert (=> b!1358025 (=> (not res!902726) (not e!770742))))

(declare-fun e!770743 () Bool)

(assert (=> b!1358025 (= res!902726 (not e!770743))))

(declare-fun res!902727 () Bool)

(assert (=> b!1358025 (=> (not res!902727) (not e!770743))))

(assert (=> b!1358025 (= res!902727 (validKeyInArray!0 (select (arr!44670 a!3742) from!3120)))))

(declare-fun c!127090 () Bool)

(declare-fun bm!65266 () Bool)

(declare-fun call!65269 () Bool)

(assert (=> bm!65266 (= call!65269 (arrayNoDuplicates!0 a!3742 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127090 (Cons!31707 (select (arr!44670 a!3742) from!3120) acc!759) acc!759)))))

(declare-fun b!1358026 () Bool)

(declare-fun e!770741 () Bool)

(assert (=> b!1358026 (= e!770742 e!770741)))

(assert (=> b!1358026 (= c!127090 (validKeyInArray!0 (select (arr!44670 a!3742) from!3120)))))

(declare-fun d!145279 () Bool)

(declare-fun res!902725 () Bool)

(assert (=> d!145279 (=> res!902725 e!770744)))

(assert (=> d!145279 (= res!902725 (bvsge from!3120 (size!45220 a!3742)))))

(assert (=> d!145279 (= (arrayNoDuplicates!0 a!3742 from!3120 acc!759) e!770744)))

(declare-fun b!1358027 () Bool)

(assert (=> b!1358027 (= e!770741 call!65269)))

(declare-fun b!1358028 () Bool)

(assert (=> b!1358028 (= e!770743 (contains!9420 acc!759 (select (arr!44670 a!3742) from!3120)))))

(declare-fun b!1358029 () Bool)

(assert (=> b!1358029 (= e!770741 call!65269)))

(assert (= (and d!145279 (not res!902725)) b!1358025))

(assert (= (and b!1358025 res!902727) b!1358028))

(assert (= (and b!1358025 res!902726) b!1358026))

(assert (= (and b!1358026 c!127090) b!1358029))

(assert (= (and b!1358026 (not c!127090)) b!1358027))

(assert (= (or b!1358029 b!1358027) bm!65266))

(assert (=> b!1358025 m!1243537))

(assert (=> b!1358025 m!1243537))

(assert (=> b!1358025 m!1243539))

(assert (=> bm!65266 m!1243537))

(declare-fun m!1243655 () Bool)

(assert (=> bm!65266 m!1243655))

(assert (=> b!1358026 m!1243537))

(assert (=> b!1358026 m!1243537))

(assert (=> b!1358026 m!1243539))

(assert (=> b!1358028 m!1243537))

(assert (=> b!1358028 m!1243537))

(declare-fun m!1243657 () Bool)

(assert (=> b!1358028 m!1243657))

(assert (=> b!1357882 d!145279))

(declare-fun d!145291 () Bool)

(assert (=> d!145291 (= (array_inv!33698 a!3742) (bvsge (size!45220 a!3742) #b00000000000000000000000000000000))))

(assert (=> start!114358 d!145291))

(declare-fun b!1358041 () Bool)

(declare-fun e!770758 () Bool)

(declare-fun e!770756 () Bool)

(assert (=> b!1358041 (= e!770758 e!770756)))

(declare-fun res!902738 () Bool)

(assert (=> b!1358041 (=> (not res!902738) (not e!770756))))

(declare-fun e!770757 () Bool)

(assert (=> b!1358041 (= res!902738 (not e!770757))))

(declare-fun res!902739 () Bool)

(assert (=> b!1358041 (=> (not res!902739) (not e!770757))))

(assert (=> b!1358041 (= res!902739 (validKeyInArray!0 (select (arr!44670 a!3742) #b00000000000000000000000000000000)))))

(declare-fun bm!65268 () Bool)

(declare-fun call!65271 () Bool)

(declare-fun c!127092 () Bool)

(assert (=> bm!65268 (= call!65271 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!127092 (Cons!31707 (select (arr!44670 a!3742) #b00000000000000000000000000000000) Nil!31708) Nil!31708)))))

(declare-fun b!1358042 () Bool)

(declare-fun e!770755 () Bool)

(assert (=> b!1358042 (= e!770756 e!770755)))

(assert (=> b!1358042 (= c!127092 (validKeyInArray!0 (select (arr!44670 a!3742) #b00000000000000000000000000000000)))))

(declare-fun d!145295 () Bool)

(declare-fun res!902737 () Bool)

(assert (=> d!145295 (=> res!902737 e!770758)))

(assert (=> d!145295 (= res!902737 (bvsge #b00000000000000000000000000000000 (size!45220 a!3742)))))

(assert (=> d!145295 (= (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31708) e!770758)))

(declare-fun b!1358043 () Bool)

(assert (=> b!1358043 (= e!770755 call!65271)))

(declare-fun b!1358044 () Bool)

(assert (=> b!1358044 (= e!770757 (contains!9420 Nil!31708 (select (arr!44670 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1358045 () Bool)

(assert (=> b!1358045 (= e!770755 call!65271)))

(assert (= (and d!145295 (not res!902737)) b!1358041))

(assert (= (and b!1358041 res!902739) b!1358044))

(assert (= (and b!1358041 res!902738) b!1358042))

(assert (= (and b!1358042 c!127092) b!1358045))

(assert (= (and b!1358042 (not c!127092)) b!1358043))

(assert (= (or b!1358045 b!1358043) bm!65268))

(declare-fun m!1243671 () Bool)

(assert (=> b!1358041 m!1243671))

(assert (=> b!1358041 m!1243671))

(declare-fun m!1243673 () Bool)

(assert (=> b!1358041 m!1243673))

(assert (=> bm!65268 m!1243671))

(declare-fun m!1243677 () Bool)

(assert (=> bm!65268 m!1243677))

(assert (=> b!1358042 m!1243671))

(assert (=> b!1358042 m!1243671))

(assert (=> b!1358042 m!1243673))

(assert (=> b!1358044 m!1243671))

(assert (=> b!1358044 m!1243671))

(declare-fun m!1243683 () Bool)

(assert (=> b!1358044 m!1243683))

(assert (=> b!1357891 d!145295))

(declare-fun d!145301 () Bool)

(declare-fun res!902743 () Bool)

(declare-fun e!770763 () Bool)

(assert (=> d!145301 (=> res!902743 e!770763)))

(assert (=> d!145301 (= res!902743 ((_ is Nil!31708) acc!759))))

(assert (=> d!145301 (= (noDuplicate!2277 acc!759) e!770763)))

(declare-fun b!1358051 () Bool)

(declare-fun e!770764 () Bool)

(assert (=> b!1358051 (= e!770763 e!770764)))

(declare-fun res!902744 () Bool)

(assert (=> b!1358051 (=> (not res!902744) (not e!770764))))

(assert (=> b!1358051 (= res!902744 (not (contains!9420 (t!46375 acc!759) (h!32916 acc!759))))))

(declare-fun b!1358052 () Bool)

(assert (=> b!1358052 (= e!770764 (noDuplicate!2277 (t!46375 acc!759)))))

(assert (= (and d!145301 (not res!902743)) b!1358051))

(assert (= (and b!1358051 res!902744) b!1358052))

(declare-fun m!1243687 () Bool)

(assert (=> b!1358051 m!1243687))

(declare-fun m!1243689 () Bool)

(assert (=> b!1358052 m!1243689))

(assert (=> b!1357884 d!145301))

(declare-fun d!145305 () Bool)

(assert (=> d!145305 (= (validKeyInArray!0 (select (arr!44670 a!3742) from!3120)) (and (not (= (select (arr!44670 a!3742) from!3120) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44670 a!3742) from!3120) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1357893 d!145305))

(declare-fun d!145309 () Bool)

(assert (=> d!145309 (= (validKeyInArray!0 l!3587) (and (not (= l!3587 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= l!3587 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1357894 d!145309))

(check-sat (not d!145249) (not d!145261) (not b!1358052) (not b!1357985) (not b!1358028) (not b!1357968) (not b!1357960) (not b!1357977) (not bm!65266) (not b!1358051) (not b!1357942) (not d!145259) (not b!1357954) (not b!1357986) (not b!1358044) (not d!145257) (not b!1357978) (not bm!65268) (not b!1358025) (not b!1358042) (not b!1357956) (not b!1358041) (not b!1358026) (not d!145275) (not b!1357953))
(check-sat)
