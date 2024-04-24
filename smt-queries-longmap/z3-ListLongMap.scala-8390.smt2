; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102252 () Bool)

(assert start!102252)

(declare-fun b!1229704 () Bool)

(declare-fun res!817537 () Bool)

(declare-fun e!698042 () Bool)

(assert (=> b!1229704 (=> (not res!817537) (not e!698042))))

(declare-datatypes ((array!79325 0))(
  ( (array!79326 (arr!38279 (Array (_ BitVec 32) (_ BitVec 64))) (size!38816 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79325)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1229704 (= res!817537 (validKeyInArray!0 (select (arr!38279 a!3806) from!3184)))))

(declare-fun b!1229705 () Bool)

(declare-fun res!817536 () Bool)

(assert (=> b!1229705 (=> (not res!817536) (not e!698042))))

(declare-datatypes ((List!27065 0))(
  ( (Nil!27062) (Cons!27061 (h!28279 (_ BitVec 64)) (t!40520 List!27065)) )
))
(declare-fun acc!823 () List!27065)

(declare-fun arrayNoDuplicates!0 (array!79325 (_ BitVec 32) List!27065) Bool)

(assert (=> b!1229705 (= res!817536 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1229706 () Bool)

(declare-fun res!817542 () Bool)

(assert (=> b!1229706 (=> (not res!817542) (not e!698042))))

(assert (=> b!1229706 (= res!817542 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38816 a!3806)) (bvslt from!3184 (size!38816 a!3806))))))

(declare-fun b!1229707 () Bool)

(declare-fun res!817544 () Bool)

(assert (=> b!1229707 (=> (not res!817544) (not e!698042))))

(declare-fun noDuplicate!1717 (List!27065) Bool)

(assert (=> b!1229707 (= res!817544 (noDuplicate!1717 acc!823))))

(declare-fun b!1229708 () Bool)

(declare-fun res!817539 () Bool)

(assert (=> b!1229708 (=> (not res!817539) (not e!698042))))

(declare-fun contains!7136 (List!27065 (_ BitVec 64)) Bool)

(assert (=> b!1229708 (= res!817539 (not (contains!7136 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229709 () Bool)

(declare-fun res!817540 () Bool)

(assert (=> b!1229709 (=> (not res!817540) (not e!698042))))

(declare-fun k0!2913 () (_ BitVec 64))

(assert (=> b!1229709 (= res!817540 (validKeyInArray!0 k0!2913))))

(declare-fun b!1229710 () Bool)

(declare-fun res!817538 () Bool)

(assert (=> b!1229710 (=> (not res!817538) (not e!698042))))

(assert (=> b!1229710 (= res!817538 (not (contains!7136 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229711 () Bool)

(declare-fun e!698040 () Bool)

(assert (=> b!1229711 (= e!698042 (not e!698040))))

(declare-fun res!817541 () Bool)

(assert (=> b!1229711 (=> res!817541 e!698040)))

(assert (=> b!1229711 (= res!817541 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(assert (=> b!1229711 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27062)))

(declare-datatypes ((Unit!40673 0))(
  ( (Unit!40674) )
))
(declare-fun lt!559476 () Unit!40673)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79325 List!27065 List!27065 (_ BitVec 32)) Unit!40673)

(assert (=> b!1229711 (= lt!559476 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27062 from!3184))))

(assert (=> b!1229711 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27061 (select (arr!38279 a!3806) from!3184) acc!823))))

(declare-fun b!1229712 () Bool)

(assert (=> b!1229712 (= e!698040 (noDuplicate!1717 (Cons!27061 (select (arr!38279 a!3806) from!3184) Nil!27062)))))

(declare-fun b!1229713 () Bool)

(declare-fun res!817535 () Bool)

(assert (=> b!1229713 (=> (not res!817535) (not e!698042))))

(declare-fun arrayContainsKey!0 (array!79325 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1229713 (= res!817535 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun res!817543 () Bool)

(assert (=> start!102252 (=> (not res!817543) (not e!698042))))

(assert (=> start!102252 (= res!817543 (bvslt (size!38816 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102252 e!698042))

(declare-fun array_inv!29217 (array!79325) Bool)

(assert (=> start!102252 (array_inv!29217 a!3806)))

(assert (=> start!102252 true))

(assert (= (and start!102252 res!817543) b!1229709))

(assert (= (and b!1229709 res!817540) b!1229706))

(assert (= (and b!1229706 res!817542) b!1229707))

(assert (= (and b!1229707 res!817544) b!1229708))

(assert (= (and b!1229708 res!817539) b!1229710))

(assert (= (and b!1229710 res!817538) b!1229713))

(assert (= (and b!1229713 res!817535) b!1229705))

(assert (= (and b!1229705 res!817536) b!1229704))

(assert (= (and b!1229704 res!817537) b!1229711))

(assert (= (and b!1229711 (not res!817541)) b!1229712))

(declare-fun m!1134549 () Bool)

(assert (=> b!1229710 m!1134549))

(declare-fun m!1134551 () Bool)

(assert (=> b!1229712 m!1134551))

(declare-fun m!1134553 () Bool)

(assert (=> b!1229712 m!1134553))

(assert (=> b!1229704 m!1134551))

(assert (=> b!1229704 m!1134551))

(declare-fun m!1134555 () Bool)

(assert (=> b!1229704 m!1134555))

(declare-fun m!1134557 () Bool)

(assert (=> b!1229711 m!1134557))

(declare-fun m!1134559 () Bool)

(assert (=> b!1229711 m!1134559))

(assert (=> b!1229711 m!1134551))

(declare-fun m!1134561 () Bool)

(assert (=> b!1229711 m!1134561))

(declare-fun m!1134563 () Bool)

(assert (=> b!1229708 m!1134563))

(declare-fun m!1134565 () Bool)

(assert (=> start!102252 m!1134565))

(declare-fun m!1134567 () Bool)

(assert (=> b!1229709 m!1134567))

(declare-fun m!1134569 () Bool)

(assert (=> b!1229707 m!1134569))

(declare-fun m!1134571 () Bool)

(assert (=> b!1229705 m!1134571))

(declare-fun m!1134573 () Bool)

(assert (=> b!1229713 m!1134573))

(check-sat (not b!1229711) (not b!1229707) (not start!102252) (not b!1229705) (not b!1229712) (not b!1229708) (not b!1229710) (not b!1229704) (not b!1229713) (not b!1229709))
(check-sat)
(get-model)

(declare-fun d!134643 () Bool)

(declare-fun res!817609 () Bool)

(declare-fun e!698065 () Bool)

(assert (=> d!134643 (=> res!817609 e!698065)))

(get-info :version)

(assert (=> d!134643 (= res!817609 ((_ is Nil!27062) (Cons!27061 (select (arr!38279 a!3806) from!3184) Nil!27062)))))

(assert (=> d!134643 (= (noDuplicate!1717 (Cons!27061 (select (arr!38279 a!3806) from!3184) Nil!27062)) e!698065)))

(declare-fun b!1229778 () Bool)

(declare-fun e!698066 () Bool)

(assert (=> b!1229778 (= e!698065 e!698066)))

(declare-fun res!817610 () Bool)

(assert (=> b!1229778 (=> (not res!817610) (not e!698066))))

(assert (=> b!1229778 (= res!817610 (not (contains!7136 (t!40520 (Cons!27061 (select (arr!38279 a!3806) from!3184) Nil!27062)) (h!28279 (Cons!27061 (select (arr!38279 a!3806) from!3184) Nil!27062)))))))

(declare-fun b!1229779 () Bool)

(assert (=> b!1229779 (= e!698066 (noDuplicate!1717 (t!40520 (Cons!27061 (select (arr!38279 a!3806) from!3184) Nil!27062))))))

(assert (= (and d!134643 (not res!817609)) b!1229778))

(assert (= (and b!1229778 res!817610) b!1229779))

(declare-fun m!1134627 () Bool)

(assert (=> b!1229778 m!1134627))

(declare-fun m!1134629 () Bool)

(assert (=> b!1229779 m!1134629))

(assert (=> b!1229712 d!134643))

(declare-fun d!134645 () Bool)

(declare-fun res!817611 () Bool)

(declare-fun e!698067 () Bool)

(assert (=> d!134645 (=> res!817611 e!698067)))

(assert (=> d!134645 (= res!817611 ((_ is Nil!27062) acc!823))))

(assert (=> d!134645 (= (noDuplicate!1717 acc!823) e!698067)))

(declare-fun b!1229780 () Bool)

(declare-fun e!698068 () Bool)

(assert (=> b!1229780 (= e!698067 e!698068)))

(declare-fun res!817612 () Bool)

(assert (=> b!1229780 (=> (not res!817612) (not e!698068))))

(assert (=> b!1229780 (= res!817612 (not (contains!7136 (t!40520 acc!823) (h!28279 acc!823))))))

(declare-fun b!1229781 () Bool)

(assert (=> b!1229781 (= e!698068 (noDuplicate!1717 (t!40520 acc!823)))))

(assert (= (and d!134645 (not res!817611)) b!1229780))

(assert (= (and b!1229780 res!817612) b!1229781))

(declare-fun m!1134631 () Bool)

(assert (=> b!1229780 m!1134631))

(declare-fun m!1134633 () Bool)

(assert (=> b!1229781 m!1134633))

(assert (=> b!1229707 d!134645))

(declare-fun d!134647 () Bool)

(declare-fun lt!559485 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!556 (List!27065) (InoxSet (_ BitVec 64)))

(assert (=> d!134647 (= lt!559485 (select (content!556 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!698073 () Bool)

(assert (=> d!134647 (= lt!559485 e!698073)))

(declare-fun res!817618 () Bool)

(assert (=> d!134647 (=> (not res!817618) (not e!698073))))

(assert (=> d!134647 (= res!817618 ((_ is Cons!27061) acc!823))))

(assert (=> d!134647 (= (contains!7136 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000) lt!559485)))

(declare-fun b!1229786 () Bool)

(declare-fun e!698074 () Bool)

(assert (=> b!1229786 (= e!698073 e!698074)))

(declare-fun res!817617 () Bool)

(assert (=> b!1229786 (=> res!817617 e!698074)))

(assert (=> b!1229786 (= res!817617 (= (h!28279 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1229787 () Bool)

(assert (=> b!1229787 (= e!698074 (contains!7136 (t!40520 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134647 res!817618) b!1229786))

(assert (= (and b!1229786 (not res!817617)) b!1229787))

(declare-fun m!1134635 () Bool)

(assert (=> d!134647 m!1134635))

(declare-fun m!1134637 () Bool)

(assert (=> d!134647 m!1134637))

(declare-fun m!1134639 () Bool)

(assert (=> b!1229787 m!1134639))

(assert (=> b!1229708 d!134647))

(declare-fun d!134651 () Bool)

(declare-fun res!817627 () Bool)

(declare-fun e!698083 () Bool)

(assert (=> d!134651 (=> res!817627 e!698083)))

(assert (=> d!134651 (= res!817627 (= (select (arr!38279 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) k0!2913))))

(assert (=> d!134651 (= (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)) e!698083)))

(declare-fun b!1229796 () Bool)

(declare-fun e!698084 () Bool)

(assert (=> b!1229796 (= e!698083 e!698084)))

(declare-fun res!817628 () Bool)

(assert (=> b!1229796 (=> (not res!817628) (not e!698084))))

(assert (=> b!1229796 (= res!817628 (bvslt (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (size!38816 a!3806)))))

(declare-fun b!1229797 () Bool)

(assert (=> b!1229797 (= e!698084 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)))))

(assert (= (and d!134651 (not res!817627)) b!1229796))

(assert (= (and b!1229796 res!817628) b!1229797))

(declare-fun m!1134641 () Bool)

(assert (=> d!134651 m!1134641))

(declare-fun m!1134647 () Bool)

(assert (=> b!1229797 m!1134647))

(assert (=> b!1229713 d!134651))

(declare-fun d!134657 () Bool)

(assert (=> d!134657 (= (validKeyInArray!0 (select (arr!38279 a!3806) from!3184)) (and (not (= (select (arr!38279 a!3806) from!3184) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38279 a!3806) from!3184) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1229704 d!134657))

(declare-fun d!134661 () Bool)

(assert (=> d!134661 (= (validKeyInArray!0 k0!2913) (and (not (= k0!2913 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2913 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1229709 d!134661))

(declare-fun d!134663 () Bool)

(declare-fun lt!559486 () Bool)

(assert (=> d!134663 (= lt!559486 (select (content!556 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!698095 () Bool)

(assert (=> d!134663 (= lt!559486 e!698095)))

(declare-fun res!817638 () Bool)

(assert (=> d!134663 (=> (not res!817638) (not e!698095))))

(assert (=> d!134663 (= res!817638 ((_ is Cons!27061) acc!823))))

(assert (=> d!134663 (= (contains!7136 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000) lt!559486)))

(declare-fun b!1229810 () Bool)

(declare-fun e!698096 () Bool)

(assert (=> b!1229810 (= e!698095 e!698096)))

(declare-fun res!817637 () Bool)

(assert (=> b!1229810 (=> res!817637 e!698096)))

(assert (=> b!1229810 (= res!817637 (= (h!28279 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1229811 () Bool)

(assert (=> b!1229811 (= e!698096 (contains!7136 (t!40520 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134663 res!817638) b!1229810))

(assert (= (and b!1229810 (not res!817637)) b!1229811))

(assert (=> d!134663 m!1134635))

(declare-fun m!1134649 () Bool)

(assert (=> d!134663 m!1134649))

(declare-fun m!1134651 () Bool)

(assert (=> b!1229811 m!1134651))

(assert (=> b!1229710 d!134663))

(declare-fun b!1229847 () Bool)

(declare-fun e!698127 () Bool)

(declare-fun e!698126 () Bool)

(assert (=> b!1229847 (= e!698127 e!698126)))

(declare-fun c!120961 () Bool)

(assert (=> b!1229847 (= c!120961 (validKeyInArray!0 (select (arr!38279 a!3806) from!3184)))))

(declare-fun b!1229848 () Bool)

(declare-fun e!698128 () Bool)

(assert (=> b!1229848 (= e!698128 e!698127)))

(declare-fun res!817661 () Bool)

(assert (=> b!1229848 (=> (not res!817661) (not e!698127))))

(declare-fun e!698125 () Bool)

(assert (=> b!1229848 (= res!817661 (not e!698125))))

(declare-fun res!817662 () Bool)

(assert (=> b!1229848 (=> (not res!817662) (not e!698125))))

(assert (=> b!1229848 (= res!817662 (validKeyInArray!0 (select (arr!38279 a!3806) from!3184)))))

(declare-fun b!1229849 () Bool)

(assert (=> b!1229849 (= e!698125 (contains!7136 acc!823 (select (arr!38279 a!3806) from!3184)))))

(declare-fun b!1229850 () Bool)

(declare-fun call!60883 () Bool)

(assert (=> b!1229850 (= e!698126 call!60883)))

(declare-fun b!1229851 () Bool)

(assert (=> b!1229851 (= e!698126 call!60883)))

(declare-fun bm!60880 () Bool)

(assert (=> bm!60880 (= call!60883 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120961 (Cons!27061 (select (arr!38279 a!3806) from!3184) acc!823) acc!823)))))

(declare-fun d!134665 () Bool)

(declare-fun res!817660 () Bool)

(assert (=> d!134665 (=> res!817660 e!698128)))

(assert (=> d!134665 (= res!817660 (bvsge from!3184 (size!38816 a!3806)))))

(assert (=> d!134665 (= (arrayNoDuplicates!0 a!3806 from!3184 acc!823) e!698128)))

(assert (= (and d!134665 (not res!817660)) b!1229848))

(assert (= (and b!1229848 res!817662) b!1229849))

(assert (= (and b!1229848 res!817661) b!1229847))

(assert (= (and b!1229847 c!120961) b!1229850))

(assert (= (and b!1229847 (not c!120961)) b!1229851))

(assert (= (or b!1229850 b!1229851) bm!60880))

(assert (=> b!1229847 m!1134551))

(assert (=> b!1229847 m!1134551))

(assert (=> b!1229847 m!1134555))

(assert (=> b!1229848 m!1134551))

(assert (=> b!1229848 m!1134551))

(assert (=> b!1229848 m!1134555))

(assert (=> b!1229849 m!1134551))

(assert (=> b!1229849 m!1134551))

(declare-fun m!1134671 () Bool)

(assert (=> b!1229849 m!1134671))

(assert (=> bm!60880 m!1134551))

(declare-fun m!1134673 () Bool)

(assert (=> bm!60880 m!1134673))

(assert (=> b!1229705 d!134665))

(declare-fun d!134677 () Bool)

(assert (=> d!134677 (= (array_inv!29217 a!3806) (bvsge (size!38816 a!3806) #b00000000000000000000000000000000))))

(assert (=> start!102252 d!134677))

(declare-fun b!1229852 () Bool)

(declare-fun e!698131 () Bool)

(declare-fun e!698130 () Bool)

(assert (=> b!1229852 (= e!698131 e!698130)))

(declare-fun c!120962 () Bool)

(assert (=> b!1229852 (= c!120962 (validKeyInArray!0 (select (arr!38279 a!3806) from!3184)))))

(declare-fun b!1229853 () Bool)

(declare-fun e!698132 () Bool)

(assert (=> b!1229853 (= e!698132 e!698131)))

(declare-fun res!817664 () Bool)

(assert (=> b!1229853 (=> (not res!817664) (not e!698131))))

(declare-fun e!698129 () Bool)

(assert (=> b!1229853 (= res!817664 (not e!698129))))

(declare-fun res!817665 () Bool)

(assert (=> b!1229853 (=> (not res!817665) (not e!698129))))

(assert (=> b!1229853 (= res!817665 (validKeyInArray!0 (select (arr!38279 a!3806) from!3184)))))

(declare-fun b!1229854 () Bool)

(assert (=> b!1229854 (= e!698129 (contains!7136 Nil!27062 (select (arr!38279 a!3806) from!3184)))))

(declare-fun b!1229855 () Bool)

(declare-fun call!60884 () Bool)

(assert (=> b!1229855 (= e!698130 call!60884)))

(declare-fun b!1229856 () Bool)

(assert (=> b!1229856 (= e!698130 call!60884)))

(declare-fun bm!60881 () Bool)

(assert (=> bm!60881 (= call!60884 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120962 (Cons!27061 (select (arr!38279 a!3806) from!3184) Nil!27062) Nil!27062)))))

(declare-fun d!134681 () Bool)

(declare-fun res!817663 () Bool)

(assert (=> d!134681 (=> res!817663 e!698132)))

(assert (=> d!134681 (= res!817663 (bvsge from!3184 (size!38816 a!3806)))))

(assert (=> d!134681 (= (arrayNoDuplicates!0 a!3806 from!3184 Nil!27062) e!698132)))

(assert (= (and d!134681 (not res!817663)) b!1229853))

(assert (= (and b!1229853 res!817665) b!1229854))

(assert (= (and b!1229853 res!817664) b!1229852))

(assert (= (and b!1229852 c!120962) b!1229855))

(assert (= (and b!1229852 (not c!120962)) b!1229856))

(assert (= (or b!1229855 b!1229856) bm!60881))

(assert (=> b!1229852 m!1134551))

(assert (=> b!1229852 m!1134551))

(assert (=> b!1229852 m!1134555))

(assert (=> b!1229853 m!1134551))

(assert (=> b!1229853 m!1134551))

(assert (=> b!1229853 m!1134555))

(assert (=> b!1229854 m!1134551))

(assert (=> b!1229854 m!1134551))

(declare-fun m!1134675 () Bool)

(assert (=> b!1229854 m!1134675))

(assert (=> bm!60881 m!1134551))

(declare-fun m!1134677 () Bool)

(assert (=> bm!60881 m!1134677))

(assert (=> b!1229711 d!134681))

(declare-fun d!134683 () Bool)

(assert (=> d!134683 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27062)))

(declare-fun lt!559492 () Unit!40673)

(declare-fun choose!80 (array!79325 List!27065 List!27065 (_ BitVec 32)) Unit!40673)

(assert (=> d!134683 (= lt!559492 (choose!80 a!3806 acc!823 Nil!27062 from!3184))))

(assert (=> d!134683 (bvslt (size!38816 a!3806) #b01111111111111111111111111111111)))

(assert (=> d!134683 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27062 from!3184) lt!559492)))

(declare-fun bs!34552 () Bool)

(assert (= bs!34552 d!134683))

(assert (=> bs!34552 m!1134557))

(declare-fun m!1134687 () Bool)

(assert (=> bs!34552 m!1134687))

(assert (=> b!1229711 d!134683))

(declare-fun b!1229869 () Bool)

(declare-fun e!698147 () Bool)

(declare-fun e!698146 () Bool)

(assert (=> b!1229869 (= e!698147 e!698146)))

(declare-fun c!120963 () Bool)

(assert (=> b!1229869 (= c!120963 (validKeyInArray!0 (select (arr!38279 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1229870 () Bool)

(declare-fun e!698148 () Bool)

(assert (=> b!1229870 (= e!698148 e!698147)))

(declare-fun res!817679 () Bool)

(assert (=> b!1229870 (=> (not res!817679) (not e!698147))))

(declare-fun e!698145 () Bool)

(assert (=> b!1229870 (= res!817679 (not e!698145))))

(declare-fun res!817680 () Bool)

(assert (=> b!1229870 (=> (not res!817680) (not e!698145))))

(assert (=> b!1229870 (= res!817680 (validKeyInArray!0 (select (arr!38279 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1229871 () Bool)

(assert (=> b!1229871 (= e!698145 (contains!7136 (Cons!27061 (select (arr!38279 a!3806) from!3184) acc!823) (select (arr!38279 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1229872 () Bool)

(declare-fun call!60885 () Bool)

(assert (=> b!1229872 (= e!698146 call!60885)))

(declare-fun b!1229873 () Bool)

(assert (=> b!1229873 (= e!698146 call!60885)))

(declare-fun bm!60882 () Bool)

(assert (=> bm!60882 (= call!60885 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!120963 (Cons!27061 (select (arr!38279 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27061 (select (arr!38279 a!3806) from!3184) acc!823)) (Cons!27061 (select (arr!38279 a!3806) from!3184) acc!823))))))

(declare-fun d!134693 () Bool)

(declare-fun res!817678 () Bool)

(assert (=> d!134693 (=> res!817678 e!698148)))

(assert (=> d!134693 (= res!817678 (bvsge (bvadd #b00000000000000000000000000000001 from!3184) (size!38816 a!3806)))))

(assert (=> d!134693 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27061 (select (arr!38279 a!3806) from!3184) acc!823)) e!698148)))

(assert (= (and d!134693 (not res!817678)) b!1229870))

(assert (= (and b!1229870 res!817680) b!1229871))

(assert (= (and b!1229870 res!817679) b!1229869))

(assert (= (and b!1229869 c!120963) b!1229872))

(assert (= (and b!1229869 (not c!120963)) b!1229873))

(assert (= (or b!1229872 b!1229873) bm!60882))

(assert (=> b!1229869 m!1134641))

(assert (=> b!1229869 m!1134641))

(declare-fun m!1134689 () Bool)

(assert (=> b!1229869 m!1134689))

(assert (=> b!1229870 m!1134641))

(assert (=> b!1229870 m!1134641))

(assert (=> b!1229870 m!1134689))

(assert (=> b!1229871 m!1134641))

(assert (=> b!1229871 m!1134641))

(declare-fun m!1134691 () Bool)

(assert (=> b!1229871 m!1134691))

(assert (=> bm!60882 m!1134641))

(declare-fun m!1134693 () Bool)

(assert (=> bm!60882 m!1134693))

(assert (=> b!1229711 d!134693))

(check-sat (not b!1229787) (not b!1229849) (not b!1229797) (not b!1229853) (not b!1229869) (not b!1229854) (not b!1229778) (not b!1229852) (not b!1229780) (not b!1229779) (not b!1229811) (not b!1229871) (not b!1229847) (not b!1229781) (not d!134663) (not bm!60880) (not bm!60881) (not bm!60882) (not d!134683) (not b!1229848) (not d!134647) (not b!1229870))
(check-sat)
(get-model)

(assert (=> b!1229852 d!134657))

(declare-fun d!134715 () Bool)

(declare-fun c!120969 () Bool)

(assert (=> d!134715 (= c!120969 ((_ is Nil!27062) acc!823))))

(declare-fun e!698189 () (InoxSet (_ BitVec 64)))

(assert (=> d!134715 (= (content!556 acc!823) e!698189)))

(declare-fun b!1229919 () Bool)

(assert (=> b!1229919 (= e!698189 ((as const (Array (_ BitVec 64) Bool)) false))))

(declare-fun b!1229920 () Bool)

(assert (=> b!1229920 (= e!698189 ((_ map or) (store ((as const (Array (_ BitVec 64) Bool)) false) (h!28279 acc!823) true) (content!556 (t!40520 acc!823))))))

(assert (= (and d!134715 c!120969) b!1229919))

(assert (= (and d!134715 (not c!120969)) b!1229920))

(declare-fun m!1134741 () Bool)

(assert (=> b!1229920 m!1134741))

(declare-fun m!1134743 () Bool)

(assert (=> b!1229920 m!1134743))

(assert (=> d!134647 d!134715))

(assert (=> b!1229853 d!134657))

(declare-fun b!1229921 () Bool)

(declare-fun e!698192 () Bool)

(declare-fun e!698191 () Bool)

(assert (=> b!1229921 (= e!698192 e!698191)))

(declare-fun c!120970 () Bool)

(assert (=> b!1229921 (= c!120970 (validKeyInArray!0 (select (arr!38279 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1229922 () Bool)

(declare-fun e!698193 () Bool)

(assert (=> b!1229922 (= e!698193 e!698192)))

(declare-fun res!817717 () Bool)

(assert (=> b!1229922 (=> (not res!817717) (not e!698192))))

(declare-fun e!698190 () Bool)

(assert (=> b!1229922 (= res!817717 (not e!698190))))

(declare-fun res!817718 () Bool)

(assert (=> b!1229922 (=> (not res!817718) (not e!698190))))

(assert (=> b!1229922 (= res!817718 (validKeyInArray!0 (select (arr!38279 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1229923 () Bool)

(assert (=> b!1229923 (= e!698190 (contains!7136 (ite c!120963 (Cons!27061 (select (arr!38279 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27061 (select (arr!38279 a!3806) from!3184) acc!823)) (Cons!27061 (select (arr!38279 a!3806) from!3184) acc!823)) (select (arr!38279 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1229924 () Bool)

(declare-fun call!60889 () Bool)

(assert (=> b!1229924 (= e!698191 call!60889)))

(declare-fun b!1229925 () Bool)

(assert (=> b!1229925 (= e!698191 call!60889)))

(declare-fun bm!60886 () Bool)

(assert (=> bm!60886 (= call!60889 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!120970 (Cons!27061 (select (arr!38279 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)) (ite c!120963 (Cons!27061 (select (arr!38279 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27061 (select (arr!38279 a!3806) from!3184) acc!823)) (Cons!27061 (select (arr!38279 a!3806) from!3184) acc!823))) (ite c!120963 (Cons!27061 (select (arr!38279 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27061 (select (arr!38279 a!3806) from!3184) acc!823)) (Cons!27061 (select (arr!38279 a!3806) from!3184) acc!823)))))))

(declare-fun d!134717 () Bool)

(declare-fun res!817716 () Bool)

(assert (=> d!134717 (=> res!817716 e!698193)))

(assert (=> d!134717 (= res!817716 (bvsge (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (size!38816 a!3806)))))

(assert (=> d!134717 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!120963 (Cons!27061 (select (arr!38279 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27061 (select (arr!38279 a!3806) from!3184) acc!823)) (Cons!27061 (select (arr!38279 a!3806) from!3184) acc!823))) e!698193)))

(assert (= (and d!134717 (not res!817716)) b!1229922))

(assert (= (and b!1229922 res!817718) b!1229923))

(assert (= (and b!1229922 res!817717) b!1229921))

(assert (= (and b!1229921 c!120970) b!1229924))

(assert (= (and b!1229921 (not c!120970)) b!1229925))

(assert (= (or b!1229924 b!1229925) bm!60886))

(declare-fun m!1134745 () Bool)

(assert (=> b!1229921 m!1134745))

(assert (=> b!1229921 m!1134745))

(declare-fun m!1134747 () Bool)

(assert (=> b!1229921 m!1134747))

(assert (=> b!1229922 m!1134745))

(assert (=> b!1229922 m!1134745))

(assert (=> b!1229922 m!1134747))

(assert (=> b!1229923 m!1134745))

(assert (=> b!1229923 m!1134745))

(declare-fun m!1134749 () Bool)

(assert (=> b!1229923 m!1134749))

(assert (=> bm!60886 m!1134745))

(declare-fun m!1134751 () Bool)

(assert (=> bm!60886 m!1134751))

(assert (=> bm!60882 d!134717))

(declare-fun lt!559504 () Bool)

(declare-fun d!134719 () Bool)

(assert (=> d!134719 (= lt!559504 (select (content!556 acc!823) (select (arr!38279 a!3806) from!3184)))))

(declare-fun e!698194 () Bool)

(assert (=> d!134719 (= lt!559504 e!698194)))

(declare-fun res!817720 () Bool)

(assert (=> d!134719 (=> (not res!817720) (not e!698194))))

(assert (=> d!134719 (= res!817720 ((_ is Cons!27061) acc!823))))

(assert (=> d!134719 (= (contains!7136 acc!823 (select (arr!38279 a!3806) from!3184)) lt!559504)))

(declare-fun b!1229926 () Bool)

(declare-fun e!698195 () Bool)

(assert (=> b!1229926 (= e!698194 e!698195)))

(declare-fun res!817719 () Bool)

(assert (=> b!1229926 (=> res!817719 e!698195)))

(assert (=> b!1229926 (= res!817719 (= (h!28279 acc!823) (select (arr!38279 a!3806) from!3184)))))

(declare-fun b!1229927 () Bool)

(assert (=> b!1229927 (= e!698195 (contains!7136 (t!40520 acc!823) (select (arr!38279 a!3806) from!3184)))))

(assert (= (and d!134719 res!817720) b!1229926))

(assert (= (and b!1229926 (not res!817719)) b!1229927))

(assert (=> d!134719 m!1134635))

(assert (=> d!134719 m!1134551))

(declare-fun m!1134753 () Bool)

(assert (=> d!134719 m!1134753))

(assert (=> b!1229927 m!1134551))

(declare-fun m!1134755 () Bool)

(assert (=> b!1229927 m!1134755))

(assert (=> b!1229849 d!134719))

(declare-fun d!134721 () Bool)

(declare-fun res!817721 () Bool)

(declare-fun e!698196 () Bool)

(assert (=> d!134721 (=> res!817721 e!698196)))

(assert (=> d!134721 (= res!817721 (= (select (arr!38279 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)) k0!2913))))

(assert (=> d!134721 (= (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)) e!698196)))

(declare-fun b!1229928 () Bool)

(declare-fun e!698197 () Bool)

(assert (=> b!1229928 (= e!698196 e!698197)))

(declare-fun res!817722 () Bool)

(assert (=> b!1229928 (=> (not res!817722) (not e!698197))))

(assert (=> b!1229928 (= res!817722 (bvslt (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!38816 a!3806)))))

(declare-fun b!1229929 () Bool)

(assert (=> b!1229929 (= e!698197 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!134721 (not res!817721)) b!1229928))

(assert (= (and b!1229928 res!817722) b!1229929))

(assert (=> d!134721 m!1134745))

(declare-fun m!1134757 () Bool)

(assert (=> b!1229929 m!1134757))

(assert (=> b!1229797 d!134721))

(assert (=> d!134663 d!134715))

(declare-fun d!134723 () Bool)

(declare-fun lt!559505 () Bool)

(assert (=> d!134723 (= lt!559505 (select (content!556 Nil!27062) (select (arr!38279 a!3806) from!3184)))))

(declare-fun e!698198 () Bool)

(assert (=> d!134723 (= lt!559505 e!698198)))

(declare-fun res!817724 () Bool)

(assert (=> d!134723 (=> (not res!817724) (not e!698198))))

(assert (=> d!134723 (= res!817724 ((_ is Cons!27061) Nil!27062))))

(assert (=> d!134723 (= (contains!7136 Nil!27062 (select (arr!38279 a!3806) from!3184)) lt!559505)))

(declare-fun b!1229930 () Bool)

(declare-fun e!698199 () Bool)

(assert (=> b!1229930 (= e!698198 e!698199)))

(declare-fun res!817723 () Bool)

(assert (=> b!1229930 (=> res!817723 e!698199)))

(assert (=> b!1229930 (= res!817723 (= (h!28279 Nil!27062) (select (arr!38279 a!3806) from!3184)))))

(declare-fun b!1229931 () Bool)

(assert (=> b!1229931 (= e!698199 (contains!7136 (t!40520 Nil!27062) (select (arr!38279 a!3806) from!3184)))))

(assert (= (and d!134723 res!817724) b!1229930))

(assert (= (and b!1229930 (not res!817723)) b!1229931))

(declare-fun m!1134759 () Bool)

(assert (=> d!134723 m!1134759))

(assert (=> d!134723 m!1134551))

(declare-fun m!1134761 () Bool)

(assert (=> d!134723 m!1134761))

(assert (=> b!1229931 m!1134551))

(declare-fun m!1134763 () Bool)

(assert (=> b!1229931 m!1134763))

(assert (=> b!1229854 d!134723))

(declare-fun d!134725 () Bool)

(assert (=> d!134725 (= (validKeyInArray!0 (select (arr!38279 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))) (and (not (= (select (arr!38279 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38279 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1229869 d!134725))

(assert (=> b!1229870 d!134725))

(declare-fun d!134727 () Bool)

(declare-fun lt!559506 () Bool)

(assert (=> d!134727 (= lt!559506 (select (content!556 (t!40520 (Cons!27061 (select (arr!38279 a!3806) from!3184) Nil!27062))) (h!28279 (Cons!27061 (select (arr!38279 a!3806) from!3184) Nil!27062))))))

(declare-fun e!698200 () Bool)

(assert (=> d!134727 (= lt!559506 e!698200)))

(declare-fun res!817726 () Bool)

(assert (=> d!134727 (=> (not res!817726) (not e!698200))))

(assert (=> d!134727 (= res!817726 ((_ is Cons!27061) (t!40520 (Cons!27061 (select (arr!38279 a!3806) from!3184) Nil!27062))))))

(assert (=> d!134727 (= (contains!7136 (t!40520 (Cons!27061 (select (arr!38279 a!3806) from!3184) Nil!27062)) (h!28279 (Cons!27061 (select (arr!38279 a!3806) from!3184) Nil!27062))) lt!559506)))

(declare-fun b!1229932 () Bool)

(declare-fun e!698201 () Bool)

(assert (=> b!1229932 (= e!698200 e!698201)))

(declare-fun res!817725 () Bool)

(assert (=> b!1229932 (=> res!817725 e!698201)))

(assert (=> b!1229932 (= res!817725 (= (h!28279 (t!40520 (Cons!27061 (select (arr!38279 a!3806) from!3184) Nil!27062))) (h!28279 (Cons!27061 (select (arr!38279 a!3806) from!3184) Nil!27062))))))

(declare-fun b!1229933 () Bool)

(assert (=> b!1229933 (= e!698201 (contains!7136 (t!40520 (t!40520 (Cons!27061 (select (arr!38279 a!3806) from!3184) Nil!27062))) (h!28279 (Cons!27061 (select (arr!38279 a!3806) from!3184) Nil!27062))))))

(assert (= (and d!134727 res!817726) b!1229932))

(assert (= (and b!1229932 (not res!817725)) b!1229933))

(declare-fun m!1134765 () Bool)

(assert (=> d!134727 m!1134765))

(declare-fun m!1134767 () Bool)

(assert (=> d!134727 m!1134767))

(declare-fun m!1134769 () Bool)

(assert (=> b!1229933 m!1134769))

(assert (=> b!1229778 d!134727))

(declare-fun d!134729 () Bool)

(declare-fun res!817727 () Bool)

(declare-fun e!698202 () Bool)

(assert (=> d!134729 (=> res!817727 e!698202)))

(assert (=> d!134729 (= res!817727 ((_ is Nil!27062) (t!40520 (Cons!27061 (select (arr!38279 a!3806) from!3184) Nil!27062))))))

(assert (=> d!134729 (= (noDuplicate!1717 (t!40520 (Cons!27061 (select (arr!38279 a!3806) from!3184) Nil!27062))) e!698202)))

(declare-fun b!1229934 () Bool)

(declare-fun e!698203 () Bool)

(assert (=> b!1229934 (= e!698202 e!698203)))

(declare-fun res!817728 () Bool)

(assert (=> b!1229934 (=> (not res!817728) (not e!698203))))

(assert (=> b!1229934 (= res!817728 (not (contains!7136 (t!40520 (t!40520 (Cons!27061 (select (arr!38279 a!3806) from!3184) Nil!27062))) (h!28279 (t!40520 (Cons!27061 (select (arr!38279 a!3806) from!3184) Nil!27062))))))))

(declare-fun b!1229935 () Bool)

(assert (=> b!1229935 (= e!698203 (noDuplicate!1717 (t!40520 (t!40520 (Cons!27061 (select (arr!38279 a!3806) from!3184) Nil!27062)))))))

(assert (= (and d!134729 (not res!817727)) b!1229934))

(assert (= (and b!1229934 res!817728) b!1229935))

(declare-fun m!1134771 () Bool)

(assert (=> b!1229934 m!1134771))

(declare-fun m!1134773 () Bool)

(assert (=> b!1229935 m!1134773))

(assert (=> b!1229779 d!134729))

(declare-fun lt!559507 () Bool)

(declare-fun d!134731 () Bool)

(assert (=> d!134731 (= lt!559507 (select (content!556 (Cons!27061 (select (arr!38279 a!3806) from!3184) acc!823)) (select (arr!38279 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun e!698204 () Bool)

(assert (=> d!134731 (= lt!559507 e!698204)))

(declare-fun res!817730 () Bool)

(assert (=> d!134731 (=> (not res!817730) (not e!698204))))

(assert (=> d!134731 (= res!817730 ((_ is Cons!27061) (Cons!27061 (select (arr!38279 a!3806) from!3184) acc!823)))))

(assert (=> d!134731 (= (contains!7136 (Cons!27061 (select (arr!38279 a!3806) from!3184) acc!823) (select (arr!38279 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))) lt!559507)))

(declare-fun b!1229936 () Bool)

(declare-fun e!698205 () Bool)

(assert (=> b!1229936 (= e!698204 e!698205)))

(declare-fun res!817729 () Bool)

(assert (=> b!1229936 (=> res!817729 e!698205)))

(assert (=> b!1229936 (= res!817729 (= (h!28279 (Cons!27061 (select (arr!38279 a!3806) from!3184) acc!823)) (select (arr!38279 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1229937 () Bool)

(assert (=> b!1229937 (= e!698205 (contains!7136 (t!40520 (Cons!27061 (select (arr!38279 a!3806) from!3184) acc!823)) (select (arr!38279 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(assert (= (and d!134731 res!817730) b!1229936))

(assert (= (and b!1229936 (not res!817729)) b!1229937))

(declare-fun m!1134775 () Bool)

(assert (=> d!134731 m!1134775))

(assert (=> d!134731 m!1134641))

(declare-fun m!1134777 () Bool)

(assert (=> d!134731 m!1134777))

(assert (=> b!1229937 m!1134641))

(declare-fun m!1134779 () Bool)

(assert (=> b!1229937 m!1134779))

(assert (=> b!1229871 d!134731))

(declare-fun d!134733 () Bool)

(declare-fun lt!559508 () Bool)

(assert (=> d!134733 (= lt!559508 (select (content!556 (t!40520 acc!823)) (h!28279 acc!823)))))

(declare-fun e!698206 () Bool)

(assert (=> d!134733 (= lt!559508 e!698206)))

(declare-fun res!817732 () Bool)

(assert (=> d!134733 (=> (not res!817732) (not e!698206))))

(assert (=> d!134733 (= res!817732 ((_ is Cons!27061) (t!40520 acc!823)))))

(assert (=> d!134733 (= (contains!7136 (t!40520 acc!823) (h!28279 acc!823)) lt!559508)))

(declare-fun b!1229938 () Bool)

(declare-fun e!698207 () Bool)

(assert (=> b!1229938 (= e!698206 e!698207)))

(declare-fun res!817731 () Bool)

(assert (=> b!1229938 (=> res!817731 e!698207)))

(assert (=> b!1229938 (= res!817731 (= (h!28279 (t!40520 acc!823)) (h!28279 acc!823)))))

(declare-fun b!1229939 () Bool)

(assert (=> b!1229939 (= e!698207 (contains!7136 (t!40520 (t!40520 acc!823)) (h!28279 acc!823)))))

(assert (= (and d!134733 res!817732) b!1229938))

(assert (= (and b!1229938 (not res!817731)) b!1229939))

(assert (=> d!134733 m!1134743))

(declare-fun m!1134781 () Bool)

(assert (=> d!134733 m!1134781))

(declare-fun m!1134783 () Bool)

(assert (=> b!1229939 m!1134783))

(assert (=> b!1229780 d!134733))

(declare-fun d!134735 () Bool)

(declare-fun lt!559509 () Bool)

(assert (=> d!134735 (= lt!559509 (select (content!556 (t!40520 acc!823)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!698208 () Bool)

(assert (=> d!134735 (= lt!559509 e!698208)))

(declare-fun res!817734 () Bool)

(assert (=> d!134735 (=> (not res!817734) (not e!698208))))

(assert (=> d!134735 (= res!817734 ((_ is Cons!27061) (t!40520 acc!823)))))

(assert (=> d!134735 (= (contains!7136 (t!40520 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000) lt!559509)))

(declare-fun b!1229940 () Bool)

(declare-fun e!698209 () Bool)

(assert (=> b!1229940 (= e!698208 e!698209)))

(declare-fun res!817733 () Bool)

(assert (=> b!1229940 (=> res!817733 e!698209)))

(assert (=> b!1229940 (= res!817733 (= (h!28279 (t!40520 acc!823)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1229941 () Bool)

(assert (=> b!1229941 (= e!698209 (contains!7136 (t!40520 (t!40520 acc!823)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134735 res!817734) b!1229940))

(assert (= (and b!1229940 (not res!817733)) b!1229941))

(assert (=> d!134735 m!1134743))

(declare-fun m!1134785 () Bool)

(assert (=> d!134735 m!1134785))

(declare-fun m!1134787 () Bool)

(assert (=> b!1229941 m!1134787))

(assert (=> b!1229787 d!134735))

(declare-fun d!134737 () Bool)

(declare-fun res!817735 () Bool)

(declare-fun e!698210 () Bool)

(assert (=> d!134737 (=> res!817735 e!698210)))

(assert (=> d!134737 (= res!817735 ((_ is Nil!27062) (t!40520 acc!823)))))

(assert (=> d!134737 (= (noDuplicate!1717 (t!40520 acc!823)) e!698210)))

(declare-fun b!1229942 () Bool)

(declare-fun e!698211 () Bool)

(assert (=> b!1229942 (= e!698210 e!698211)))

(declare-fun res!817736 () Bool)

(assert (=> b!1229942 (=> (not res!817736) (not e!698211))))

(assert (=> b!1229942 (= res!817736 (not (contains!7136 (t!40520 (t!40520 acc!823)) (h!28279 (t!40520 acc!823)))))))

(declare-fun b!1229943 () Bool)

(assert (=> b!1229943 (= e!698211 (noDuplicate!1717 (t!40520 (t!40520 acc!823))))))

(assert (= (and d!134737 (not res!817735)) b!1229942))

(assert (= (and b!1229942 res!817736) b!1229943))

(declare-fun m!1134789 () Bool)

(assert (=> b!1229942 m!1134789))

(declare-fun m!1134791 () Bool)

(assert (=> b!1229943 m!1134791))

(assert (=> b!1229781 d!134737))

(declare-fun b!1229944 () Bool)

(declare-fun e!698214 () Bool)

(declare-fun e!698213 () Bool)

(assert (=> b!1229944 (= e!698214 e!698213)))

(declare-fun c!120971 () Bool)

(assert (=> b!1229944 (= c!120971 (validKeyInArray!0 (select (arr!38279 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1229945 () Bool)

(declare-fun e!698215 () Bool)

(assert (=> b!1229945 (= e!698215 e!698214)))

(declare-fun res!817738 () Bool)

(assert (=> b!1229945 (=> (not res!817738) (not e!698214))))

(declare-fun e!698212 () Bool)

(assert (=> b!1229945 (= res!817738 (not e!698212))))

(declare-fun res!817739 () Bool)

(assert (=> b!1229945 (=> (not res!817739) (not e!698212))))

(assert (=> b!1229945 (= res!817739 (validKeyInArray!0 (select (arr!38279 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1229946 () Bool)

(assert (=> b!1229946 (= e!698212 (contains!7136 (ite c!120961 (Cons!27061 (select (arr!38279 a!3806) from!3184) acc!823) acc!823) (select (arr!38279 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1229947 () Bool)

(declare-fun call!60890 () Bool)

(assert (=> b!1229947 (= e!698213 call!60890)))

(declare-fun b!1229948 () Bool)

(assert (=> b!1229948 (= e!698213 call!60890)))

(declare-fun bm!60887 () Bool)

(assert (=> bm!60887 (= call!60890 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!120971 (Cons!27061 (select (arr!38279 a!3806) (bvadd from!3184 #b00000000000000000000000000000001)) (ite c!120961 (Cons!27061 (select (arr!38279 a!3806) from!3184) acc!823) acc!823)) (ite c!120961 (Cons!27061 (select (arr!38279 a!3806) from!3184) acc!823) acc!823))))))

(declare-fun d!134739 () Bool)

(declare-fun res!817737 () Bool)

(assert (=> d!134739 (=> res!817737 e!698215)))

(assert (=> d!134739 (= res!817737 (bvsge (bvadd from!3184 #b00000000000000000000000000000001) (size!38816 a!3806)))))

(assert (=> d!134739 (= (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120961 (Cons!27061 (select (arr!38279 a!3806) from!3184) acc!823) acc!823)) e!698215)))

(assert (= (and d!134739 (not res!817737)) b!1229945))

(assert (= (and b!1229945 res!817739) b!1229946))

(assert (= (and b!1229945 res!817738) b!1229944))

(assert (= (and b!1229944 c!120971) b!1229947))

(assert (= (and b!1229944 (not c!120971)) b!1229948))

(assert (= (or b!1229947 b!1229948) bm!60887))

(declare-fun m!1134793 () Bool)

(assert (=> b!1229944 m!1134793))

(assert (=> b!1229944 m!1134793))

(declare-fun m!1134795 () Bool)

(assert (=> b!1229944 m!1134795))

(assert (=> b!1229945 m!1134793))

(assert (=> b!1229945 m!1134793))

(assert (=> b!1229945 m!1134795))

(assert (=> b!1229946 m!1134793))

(assert (=> b!1229946 m!1134793))

(declare-fun m!1134797 () Bool)

(assert (=> b!1229946 m!1134797))

(assert (=> bm!60887 m!1134793))

(declare-fun m!1134799 () Bool)

(assert (=> bm!60887 m!1134799))

(assert (=> bm!60880 d!134739))

(declare-fun b!1229949 () Bool)

(declare-fun e!698218 () Bool)

(declare-fun e!698217 () Bool)

(assert (=> b!1229949 (= e!698218 e!698217)))

(declare-fun c!120972 () Bool)

(assert (=> b!1229949 (= c!120972 (validKeyInArray!0 (select (arr!38279 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1229950 () Bool)

(declare-fun e!698219 () Bool)

(assert (=> b!1229950 (= e!698219 e!698218)))

(declare-fun res!817741 () Bool)

(assert (=> b!1229950 (=> (not res!817741) (not e!698218))))

(declare-fun e!698216 () Bool)

(assert (=> b!1229950 (= res!817741 (not e!698216))))

(declare-fun res!817742 () Bool)

(assert (=> b!1229950 (=> (not res!817742) (not e!698216))))

(assert (=> b!1229950 (= res!817742 (validKeyInArray!0 (select (arr!38279 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1229951 () Bool)

(assert (=> b!1229951 (= e!698216 (contains!7136 (ite c!120962 (Cons!27061 (select (arr!38279 a!3806) from!3184) Nil!27062) Nil!27062) (select (arr!38279 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1229952 () Bool)

(declare-fun call!60891 () Bool)

(assert (=> b!1229952 (= e!698217 call!60891)))

(declare-fun b!1229953 () Bool)

(assert (=> b!1229953 (= e!698217 call!60891)))

(declare-fun bm!60888 () Bool)

(assert (=> bm!60888 (= call!60891 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!120972 (Cons!27061 (select (arr!38279 a!3806) (bvadd from!3184 #b00000000000000000000000000000001)) (ite c!120962 (Cons!27061 (select (arr!38279 a!3806) from!3184) Nil!27062) Nil!27062)) (ite c!120962 (Cons!27061 (select (arr!38279 a!3806) from!3184) Nil!27062) Nil!27062))))))

(declare-fun d!134741 () Bool)

(declare-fun res!817740 () Bool)

(assert (=> d!134741 (=> res!817740 e!698219)))

(assert (=> d!134741 (= res!817740 (bvsge (bvadd from!3184 #b00000000000000000000000000000001) (size!38816 a!3806)))))

(assert (=> d!134741 (= (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120962 (Cons!27061 (select (arr!38279 a!3806) from!3184) Nil!27062) Nil!27062)) e!698219)))

(assert (= (and d!134741 (not res!817740)) b!1229950))

(assert (= (and b!1229950 res!817742) b!1229951))

(assert (= (and b!1229950 res!817741) b!1229949))

(assert (= (and b!1229949 c!120972) b!1229952))

(assert (= (and b!1229949 (not c!120972)) b!1229953))

(assert (= (or b!1229952 b!1229953) bm!60888))

(assert (=> b!1229949 m!1134793))

(assert (=> b!1229949 m!1134793))

(assert (=> b!1229949 m!1134795))

(assert (=> b!1229950 m!1134793))

(assert (=> b!1229950 m!1134793))

(assert (=> b!1229950 m!1134795))

(assert (=> b!1229951 m!1134793))

(assert (=> b!1229951 m!1134793))

(declare-fun m!1134801 () Bool)

(assert (=> b!1229951 m!1134801))

(assert (=> bm!60888 m!1134793))

(declare-fun m!1134803 () Bool)

(assert (=> bm!60888 m!1134803))

(assert (=> bm!60881 d!134741))

(declare-fun d!134743 () Bool)

(declare-fun lt!559510 () Bool)

(assert (=> d!134743 (= lt!559510 (select (content!556 (t!40520 acc!823)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!698220 () Bool)

(assert (=> d!134743 (= lt!559510 e!698220)))

(declare-fun res!817744 () Bool)

(assert (=> d!134743 (=> (not res!817744) (not e!698220))))

(assert (=> d!134743 (= res!817744 ((_ is Cons!27061) (t!40520 acc!823)))))

(assert (=> d!134743 (= (contains!7136 (t!40520 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000) lt!559510)))

(declare-fun b!1229954 () Bool)

(declare-fun e!698221 () Bool)

(assert (=> b!1229954 (= e!698220 e!698221)))

(declare-fun res!817743 () Bool)

(assert (=> b!1229954 (=> res!817743 e!698221)))

(assert (=> b!1229954 (= res!817743 (= (h!28279 (t!40520 acc!823)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1229955 () Bool)

(assert (=> b!1229955 (= e!698221 (contains!7136 (t!40520 (t!40520 acc!823)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134743 res!817744) b!1229954))

(assert (= (and b!1229954 (not res!817743)) b!1229955))

(assert (=> d!134743 m!1134743))

(declare-fun m!1134805 () Bool)

(assert (=> d!134743 m!1134805))

(declare-fun m!1134807 () Bool)

(assert (=> b!1229955 m!1134807))

(assert (=> b!1229811 d!134743))

(assert (=> b!1229847 d!134657))

(assert (=> b!1229848 d!134657))

(assert (=> d!134683 d!134681))

(declare-fun d!134745 () Bool)

(assert (=> d!134745 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27062)))

(assert (=> d!134745 true))

(declare-fun _$70!74 () Unit!40673)

(assert (=> d!134745 (= (choose!80 a!3806 acc!823 Nil!27062 from!3184) _$70!74)))

(declare-fun bs!34554 () Bool)

(assert (= bs!34554 d!134745))

(assert (=> bs!34554 m!1134557))

(assert (=> d!134683 d!134745))

(check-sat (not b!1229920) (not d!134731) (not b!1229927) (not b!1229937) (not b!1229935) (not b!1229950) (not bm!60888) (not b!1229955) (not b!1229939) (not b!1229929) (not d!134733) (not d!134719) (not b!1229944) (not b!1229923) (not b!1229943) (not b!1229934) (not b!1229951) (not b!1229933) (not b!1229942) (not b!1229949) (not b!1229946) (not b!1229931) (not d!134745) (not d!134743) (not d!134727) (not d!134735) (not b!1229922) (not b!1229945) (not bm!60887) (not d!134723) (not b!1229921) (not b!1229941) (not bm!60886))
(check-sat)
