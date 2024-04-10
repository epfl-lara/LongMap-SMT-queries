; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85588 () Bool)

(assert start!85588)

(declare-fun b!994071 () Bool)

(declare-fun res!664638 () Bool)

(declare-fun e!560951 () Bool)

(assert (=> b!994071 (=> (not res!664638) (not e!560951))))

(declare-datatypes ((List!20991 0))(
  ( (Nil!20988) (Cons!20987 (h!22149 (_ BitVec 64)) (t!29992 List!20991)) )
))
(declare-fun acc!919 () List!20991)

(declare-fun contains!5852 (List!20991 (_ BitVec 64)) Bool)

(assert (=> b!994071 (= res!664638 (not (contains!5852 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!994072 () Bool)

(declare-fun res!664635 () Bool)

(assert (=> b!994072 (=> (not res!664635) (not e!560951))))

(declare-datatypes ((array!62867 0))(
  ( (array!62868 (arr!30276 (Array (_ BitVec 32) (_ BitVec 64))) (size!30773 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62867)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> b!994072 (= res!664635 (and (bvslt from!3778 size!36) (bvsge (bvadd #b00000000000000000000000000000001 from!3778) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3778) (size!30773 a!4424))))))

(declare-fun b!994073 () Bool)

(declare-fun res!664637 () Bool)

(assert (=> b!994073 (=> (not res!664637) (not e!560951))))

(declare-fun noDuplicate!1450 (List!20991) Bool)

(assert (=> b!994073 (= res!664637 (noDuplicate!1450 acc!919))))

(declare-fun b!994074 () Bool)

(declare-fun arrayNoDuplicates!0 (array!62867 (_ BitVec 32) List!20991) Bool)

(assert (=> b!994074 (= e!560951 (not (arrayNoDuplicates!0 a!4424 from!3778 acc!919)))))

(assert (=> b!994074 (arrayNoDuplicates!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) acc!919)))

(declare-datatypes ((Unit!32944 0))(
  ( (Unit!32945) )
))
(declare-fun lt!440671 () Unit!32944)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!62867 (_ BitVec 32) (_ BitVec 32) List!20991) Unit!32944)

(assert (=> b!994074 (= lt!440671 (lemmaArrayNoDuplicatesInAll0Array!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) size!36 acc!919))))

(declare-fun res!664634 () Bool)

(assert (=> start!85588 (=> (not res!664634) (not e!560951))))

(assert (=> start!85588 (= res!664634 (and (= (size!30773 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62868 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30773 a!4424))))))

(assert (=> start!85588 e!560951))

(declare-fun array_inv!23400 (array!62867) Bool)

(assert (=> start!85588 (array_inv!23400 a!4424)))

(assert (=> start!85588 true))

(declare-fun b!994075 () Bool)

(declare-fun res!664636 () Bool)

(assert (=> b!994075 (=> (not res!664636) (not e!560951))))

(assert (=> b!994075 (= res!664636 (not (contains!5852 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!85588 res!664634) b!994071))

(assert (= (and b!994071 res!664638) b!994075))

(assert (= (and b!994075 res!664636) b!994073))

(assert (= (and b!994073 res!664637) b!994072))

(assert (= (and b!994072 res!664635) b!994074))

(declare-fun m!921677 () Bool)

(assert (=> b!994075 m!921677))

(declare-fun m!921679 () Bool)

(assert (=> b!994073 m!921679))

(declare-fun m!921681 () Bool)

(assert (=> b!994071 m!921681))

(declare-fun m!921683 () Bool)

(assert (=> b!994074 m!921683))

(declare-fun m!921685 () Bool)

(assert (=> b!994074 m!921685))

(declare-fun m!921687 () Bool)

(assert (=> b!994074 m!921687))

(declare-fun m!921689 () Bool)

(assert (=> start!85588 m!921689))

(push 1)

(assert (not b!994074))

(assert (not b!994073))

(assert (not b!994075))

(assert (not b!994071))

(assert (not start!85588))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!118585 () Bool)

(declare-fun res!664667 () Bool)

(declare-fun e!560983 () Bool)

(assert (=> d!118585 (=> res!664667 e!560983)))

(assert (=> d!118585 (= res!664667 (is-Nil!20988 acc!919))))

(assert (=> d!118585 (= (noDuplicate!1450 acc!919) e!560983)))

(declare-fun b!994108 () Bool)

(declare-fun e!560984 () Bool)

(assert (=> b!994108 (= e!560983 e!560984)))

(declare-fun res!664668 () Bool)

(assert (=> b!994108 (=> (not res!664668) (not e!560984))))

(assert (=> b!994108 (= res!664668 (not (contains!5852 (t!29992 acc!919) (h!22149 acc!919))))))

(declare-fun b!994109 () Bool)

(assert (=> b!994109 (= e!560984 (noDuplicate!1450 (t!29992 acc!919)))))

(assert (= (and d!118585 (not res!664667)) b!994108))

(assert (= (and b!994108 res!664668) b!994109))

(declare-fun m!921707 () Bool)

(assert (=> b!994108 m!921707))

(declare-fun m!921709 () Bool)

(assert (=> b!994109 m!921709))

(assert (=> b!994073 d!118585))

(declare-fun d!118589 () Bool)

(declare-fun lt!440680 () Bool)

(declare-fun content!477 (List!20991) (Set (_ BitVec 64)))

(assert (=> d!118589 (= lt!440680 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!477 acc!919)))))

(declare-fun e!561005 () Bool)

(assert (=> d!118589 (= lt!440680 e!561005)))

(declare-fun res!664685 () Bool)

(assert (=> d!118589 (=> (not res!664685) (not e!561005))))

(assert (=> d!118589 (= res!664685 (is-Cons!20987 acc!919))))

(assert (=> d!118589 (= (contains!5852 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000) lt!440680)))

(declare-fun b!994134 () Bool)

(declare-fun e!561006 () Bool)

(assert (=> b!994134 (= e!561005 e!561006)))

(declare-fun res!664686 () Bool)

(assert (=> b!994134 (=> res!664686 e!561006)))

(assert (=> b!994134 (= res!664686 (= (h!22149 acc!919) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!994135 () Bool)

(assert (=> b!994135 (= e!561006 (contains!5852 (t!29992 acc!919) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!118589 res!664685) b!994134))

(assert (= (and b!994134 (not res!664686)) b!994135))

(declare-fun m!921727 () Bool)

(assert (=> d!118589 m!921727))

(declare-fun m!921729 () Bool)

(assert (=> d!118589 m!921729))

(declare-fun m!921731 () Bool)

(assert (=> b!994135 m!921731))

(assert (=> b!994071 d!118589))

(declare-fun d!118595 () Bool)

(declare-fun lt!440683 () Bool)

(assert (=> d!118595 (= lt!440683 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!477 acc!919)))))

(declare-fun e!561007 () Bool)

(assert (=> d!118595 (= lt!440683 e!561007)))

(declare-fun res!664687 () Bool)

(assert (=> d!118595 (=> (not res!664687) (not e!561007))))

(assert (=> d!118595 (= res!664687 (is-Cons!20987 acc!919))))

(assert (=> d!118595 (= (contains!5852 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000) lt!440683)))

(declare-fun b!994136 () Bool)

(declare-fun e!561008 () Bool)

(assert (=> b!994136 (= e!561007 e!561008)))

(declare-fun res!664688 () Bool)

(assert (=> b!994136 (=> res!664688 e!561008)))

(assert (=> b!994136 (= res!664688 (= (h!22149 acc!919) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!994137 () Bool)

(assert (=> b!994137 (= e!561008 (contains!5852 (t!29992 acc!919) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!118595 res!664687) b!994136))

(assert (= (and b!994136 (not res!664688)) b!994137))

(assert (=> d!118595 m!921727))

(declare-fun m!921733 () Bool)

(assert (=> d!118595 m!921733))

(declare-fun m!921735 () Bool)

(assert (=> b!994137 m!921735))

(assert (=> b!994075 d!118595))

(declare-fun call!42162 () Bool)

(declare-fun c!100866 () Bool)

(declare-fun bm!42159 () Bool)

(assert (=> bm!42159 (= call!42162 (arrayNoDuplicates!0 a!4424 (bvadd from!3778 #b00000000000000000000000000000001) (ite c!100866 (Cons!20987 (select (arr!30276 a!4424) from!3778) acc!919) acc!919)))))

(declare-fun b!994162 () Bool)

(declare-fun e!561031 () Bool)

(declare-fun e!561030 () Bool)

(assert (=> b!994162 (= e!561031 e!561030)))

(declare-fun res!664707 () Bool)

(assert (=> b!994162 (=> (not res!664707) (not e!561030))))

(declare-fun e!561032 () Bool)

(assert (=> b!994162 (= res!664707 (not e!561032))))

(declare-fun res!664705 () Bool)

(assert (=> b!994162 (=> (not res!664705) (not e!561032))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!994162 (= res!664705 (validKeyInArray!0 (select (arr!30276 a!4424) from!3778)))))

(declare-fun b!994163 () Bool)

(declare-fun e!561029 () Bool)

(assert (=> b!994163 (= e!561030 e!561029)))

(assert (=> b!994163 (= c!100866 (validKeyInArray!0 (select (arr!30276 a!4424) from!3778)))))

(declare-fun d!118597 () Bool)

(declare-fun res!664706 () Bool)

(assert (=> d!118597 (=> res!664706 e!561031)))

(assert (=> d!118597 (= res!664706 (bvsge from!3778 (size!30773 a!4424)))))

(assert (=> d!118597 (= (arrayNoDuplicates!0 a!4424 from!3778 acc!919) e!561031)))

(declare-fun b!994164 () Bool)

(assert (=> b!994164 (= e!561029 call!42162)))

(declare-fun b!994165 () Bool)

(assert (=> b!994165 (= e!561032 (contains!5852 acc!919 (select (arr!30276 a!4424) from!3778)))))

(declare-fun b!994166 () Bool)

(assert (=> b!994166 (= e!561029 call!42162)))

(assert (= (and d!118597 (not res!664706)) b!994162))

(assert (= (and b!994162 res!664705) b!994165))

(assert (= (and b!994162 res!664707) b!994163))

(assert (= (and b!994163 c!100866) b!994164))

(assert (= (and b!994163 (not c!100866)) b!994166))

(assert (= (or b!994164 b!994166) bm!42159))

(declare-fun m!921765 () Bool)

(assert (=> bm!42159 m!921765))

(declare-fun m!921767 () Bool)

(assert (=> bm!42159 m!921767))

(assert (=> b!994162 m!921765))

(assert (=> b!994162 m!921765))

(declare-fun m!921769 () Bool)

(assert (=> b!994162 m!921769))

(assert (=> b!994163 m!921765))

(assert (=> b!994163 m!921765))

(assert (=> b!994163 m!921769))

(assert (=> b!994165 m!921765))

(assert (=> b!994165 m!921765))

(declare-fun m!921771 () Bool)

(assert (=> b!994165 m!921771))

(assert (=> b!994074 d!118597))

(declare-fun call!42163 () Bool)

(declare-fun bm!42160 () Bool)

(declare-fun c!100867 () Bool)

(assert (=> bm!42160 (= call!42163 (arrayNoDuplicates!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778 #b00000000000000000000000000000001) (ite c!100867 (Cons!20987 (select (arr!30276 a!4424) (bvadd #b00000000000000000000000000000001 from!3778)) acc!919) acc!919)))))

(declare-fun b!994167 () Bool)

(declare-fun e!561035 () Bool)

(declare-fun e!561034 () Bool)

(assert (=> b!994167 (= e!561035 e!561034)))

(declare-fun res!664710 () Bool)

(assert (=> b!994167 (=> (not res!664710) (not e!561034))))

(declare-fun e!561036 () Bool)

(assert (=> b!994167 (= res!664710 (not e!561036))))

(declare-fun res!664708 () Bool)

(assert (=> b!994167 (=> (not res!664708) (not e!561036))))

(assert (=> b!994167 (= res!664708 (validKeyInArray!0 (select (arr!30276 a!4424) (bvadd #b00000000000000000000000000000001 from!3778))))))

(declare-fun b!994168 () Bool)

(declare-fun e!561033 () Bool)

(assert (=> b!994168 (= e!561034 e!561033)))

(assert (=> b!994168 (= c!100867 (validKeyInArray!0 (select (arr!30276 a!4424) (bvadd #b00000000000000000000000000000001 from!3778))))))

(declare-fun d!118611 () Bool)

(declare-fun res!664709 () Bool)

(assert (=> d!118611 (=> res!664709 e!561035)))

(assert (=> d!118611 (= res!664709 (bvsge (bvadd #b00000000000000000000000000000001 from!3778) (size!30773 a!4424)))))

(assert (=> d!118611 (= (arrayNoDuplicates!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) acc!919) e!561035)))

(declare-fun b!994169 () Bool)

(assert (=> b!994169 (= e!561033 call!42163)))

(declare-fun b!994170 () Bool)

(assert (=> b!994170 (= e!561036 (contains!5852 acc!919 (select (arr!30276 a!4424) (bvadd #b00000000000000000000000000000001 from!3778))))))

(declare-fun b!994171 () Bool)

(assert (=> b!994171 (= e!561033 call!42163)))

(assert (= (and d!118611 (not res!664709)) b!994167))

(assert (= (and b!994167 res!664708) b!994170))

(assert (= (and b!994167 res!664710) b!994168))

(assert (= (and b!994168 c!100867) b!994169))

(assert (= (and b!994168 (not c!100867)) b!994171))

(assert (= (or b!994169 b!994171) bm!42160))

(declare-fun m!921773 () Bool)

(assert (=> bm!42160 m!921773))

(declare-fun m!921775 () Bool)

(assert (=> bm!42160 m!921775))

(assert (=> b!994167 m!921773))

(assert (=> b!994167 m!921773))

(declare-fun m!921777 () Bool)

(assert (=> b!994167 m!921777))

(assert (=> b!994168 m!921773))

(assert (=> b!994168 m!921773))

(assert (=> b!994168 m!921777))

(assert (=> b!994170 m!921773))

(assert (=> b!994170 m!921773))

(declare-fun m!921779 () Bool)

(assert (=> b!994170 m!921779))

(assert (=> b!994074 d!118611))

(declare-fun d!118613 () Bool)

(assert (=> d!118613 (arrayNoDuplicates!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) acc!919)))

(declare-fun lt!440692 () Unit!32944)

(declare-fun choose!111 (array!62867 (_ BitVec 32) (_ BitVec 32) List!20991) Unit!32944)

(assert (=> d!118613 (= lt!440692 (choose!111 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) size!36 acc!919))))

(assert (=> d!118613 (= (size!30773 a!4424) size!36)))

(assert (=> d!118613 (= (lemmaArrayNoDuplicatesInAll0Array!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) size!36 acc!919) lt!440692)))

(declare-fun bs!28344 () Bool)

(assert (= bs!28344 d!118613))

(assert (=> bs!28344 m!921685))

(declare-fun m!921785 () Bool)

(assert (=> bs!28344 m!921785))

(assert (=> b!994074 d!118613))

(declare-fun d!118617 () Bool)

(assert (=> d!118617 (= (array_inv!23400 a!4424) (bvsge (size!30773 a!4424) #b00000000000000000000000000000000))))

(assert (=> start!85588 d!118617))

(push 1)

(assert (not d!118589))

(assert (not b!994109))

(assert (not b!994165))

(assert (not b!994108))

(assert (not b!994163))

(assert (not b!994162))

(assert (not b!994137))

(assert (not bm!42159))

(assert (not b!994168))

(assert (not d!118595))

(assert (not d!118613))

(assert (not b!994135))

(assert (not b!994170))

(assert (not b!994167))

(assert (not bm!42160))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

