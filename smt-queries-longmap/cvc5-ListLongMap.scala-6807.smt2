; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85584 () Bool)

(assert start!85584)

(declare-datatypes ((array!62863 0))(
  ( (array!62864 (arr!30274 (Array (_ BitVec 32) (_ BitVec 64))) (size!30771 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62863)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun b!994041 () Bool)

(declare-datatypes ((List!20989 0))(
  ( (Nil!20986) (Cons!20985 (h!22147 (_ BitVec 64)) (t!29990 List!20989)) )
))
(declare-fun acc!919 () List!20989)

(declare-fun e!560939 () Bool)

(declare-fun arrayNoDuplicates!0 (array!62863 (_ BitVec 32) List!20989) Bool)

(assert (=> b!994041 (= e!560939 (not (arrayNoDuplicates!0 a!4424 from!3778 acc!919)))))

(assert (=> b!994041 (arrayNoDuplicates!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) acc!919)))

(declare-datatypes ((Unit!32940 0))(
  ( (Unit!32941) )
))
(declare-fun lt!440665 () Unit!32940)

(declare-fun size!36 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!62863 (_ BitVec 32) (_ BitVec 32) List!20989) Unit!32940)

(assert (=> b!994041 (= lt!440665 (lemmaArrayNoDuplicatesInAll0Array!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) size!36 acc!919))))

(declare-fun b!994042 () Bool)

(declare-fun res!664605 () Bool)

(assert (=> b!994042 (=> (not res!664605) (not e!560939))))

(declare-fun contains!5850 (List!20989 (_ BitVec 64)) Bool)

(assert (=> b!994042 (= res!664605 (not (contains!5850 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!994043 () Bool)

(declare-fun res!664604 () Bool)

(assert (=> b!994043 (=> (not res!664604) (not e!560939))))

(assert (=> b!994043 (= res!664604 (and (bvslt from!3778 size!36) (bvsge (bvadd #b00000000000000000000000000000001 from!3778) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3778) (size!30771 a!4424))))))

(declare-fun b!994044 () Bool)

(declare-fun res!664606 () Bool)

(assert (=> b!994044 (=> (not res!664606) (not e!560939))))

(declare-fun noDuplicate!1448 (List!20989) Bool)

(assert (=> b!994044 (= res!664606 (noDuplicate!1448 acc!919))))

(declare-fun res!664608 () Bool)

(assert (=> start!85584 (=> (not res!664608) (not e!560939))))

(assert (=> start!85584 (= res!664608 (and (= (size!30771 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62864 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30771 a!4424))))))

(assert (=> start!85584 e!560939))

(declare-fun array_inv!23398 (array!62863) Bool)

(assert (=> start!85584 (array_inv!23398 a!4424)))

(assert (=> start!85584 true))

(declare-fun b!994045 () Bool)

(declare-fun res!664607 () Bool)

(assert (=> b!994045 (=> (not res!664607) (not e!560939))))

(assert (=> b!994045 (= res!664607 (not (contains!5850 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!85584 res!664608) b!994045))

(assert (= (and b!994045 res!664607) b!994042))

(assert (= (and b!994042 res!664605) b!994044))

(assert (= (and b!994044 res!664606) b!994043))

(assert (= (and b!994043 res!664604) b!994041))

(declare-fun m!921649 () Bool)

(assert (=> start!85584 m!921649))

(declare-fun m!921651 () Bool)

(assert (=> b!994044 m!921651))

(declare-fun m!921653 () Bool)

(assert (=> b!994042 m!921653))

(declare-fun m!921655 () Bool)

(assert (=> b!994045 m!921655))

(declare-fun m!921657 () Bool)

(assert (=> b!994041 m!921657))

(declare-fun m!921659 () Bool)

(assert (=> b!994041 m!921659))

(declare-fun m!921661 () Bool)

(assert (=> b!994041 m!921661))

(push 1)

(assert (not b!994041))

(assert (not b!994045))

(assert (not b!994042))

(assert (not start!85584))

(assert (not b!994044))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!118583 () Bool)

(declare-fun lt!440677 () Bool)

(declare-fun content!476 (List!20989) (Set (_ BitVec 64)))

(assert (=> d!118583 (= lt!440677 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!476 acc!919)))))

(declare-fun e!560982 () Bool)

(assert (=> d!118583 (= lt!440677 e!560982)))

(declare-fun res!664665 () Bool)

(assert (=> d!118583 (=> (not res!664665) (not e!560982))))

(assert (=> d!118583 (= res!664665 (is-Cons!20985 acc!919))))

(assert (=> d!118583 (= (contains!5850 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000) lt!440677)))

(declare-fun b!994106 () Bool)

(declare-fun e!560981 () Bool)

(assert (=> b!994106 (= e!560982 e!560981)))

(declare-fun res!664666 () Bool)

(assert (=> b!994106 (=> res!664666 e!560981)))

(assert (=> b!994106 (= res!664666 (= (h!22147 acc!919) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!994107 () Bool)

(assert (=> b!994107 (= e!560981 (contains!5850 (t!29990 acc!919) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!118583 res!664665) b!994106))

(assert (= (and b!994106 (not res!664666)) b!994107))

(declare-fun m!921701 () Bool)

(assert (=> d!118583 m!921701))

(declare-fun m!921703 () Bool)

(assert (=> d!118583 m!921703))

(declare-fun m!921705 () Bool)

(assert (=> b!994107 m!921705))

(assert (=> b!994042 d!118583))

(declare-fun b!994140 () Bool)

(declare-fun e!561011 () Bool)

(declare-fun e!561012 () Bool)

(assert (=> b!994140 (= e!561011 e!561012)))

(declare-fun c!100862 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!994140 (= c!100862 (validKeyInArray!0 (select (arr!30274 a!4424) from!3778)))))

(declare-fun d!118587 () Bool)

(declare-fun res!664691 () Bool)

(declare-fun e!561014 () Bool)

(assert (=> d!118587 (=> res!664691 e!561014)))

(assert (=> d!118587 (= res!664691 (bvsge from!3778 (size!30771 a!4424)))))

(assert (=> d!118587 (= (arrayNoDuplicates!0 a!4424 from!3778 acc!919) e!561014)))

(declare-fun b!994141 () Bool)

(assert (=> b!994141 (= e!561014 e!561011)))

(declare-fun res!664693 () Bool)

(assert (=> b!994141 (=> (not res!664693) (not e!561011))))

(declare-fun e!561013 () Bool)

(assert (=> b!994141 (= res!664693 (not e!561013))))

(declare-fun res!664692 () Bool)

(assert (=> b!994141 (=> (not res!664692) (not e!561013))))

(assert (=> b!994141 (= res!664692 (validKeyInArray!0 (select (arr!30274 a!4424) from!3778)))))

(declare-fun b!994142 () Bool)

(declare-fun call!42158 () Bool)

(assert (=> b!994142 (= e!561012 call!42158)))

(declare-fun b!994143 () Bool)

(assert (=> b!994143 (= e!561013 (contains!5850 acc!919 (select (arr!30274 a!4424) from!3778)))))

(declare-fun bm!42155 () Bool)

(assert (=> bm!42155 (= call!42158 (arrayNoDuplicates!0 a!4424 (bvadd from!3778 #b00000000000000000000000000000001) (ite c!100862 (Cons!20985 (select (arr!30274 a!4424) from!3778) acc!919) acc!919)))))

(declare-fun b!994144 () Bool)

(assert (=> b!994144 (= e!561012 call!42158)))

(assert (= (and d!118587 (not res!664691)) b!994141))

(assert (= (and b!994141 res!664692) b!994143))

(assert (= (and b!994141 res!664693) b!994140))

(assert (= (and b!994140 c!100862) b!994142))

(assert (= (and b!994140 (not c!100862)) b!994144))

(assert (= (or b!994142 b!994144) bm!42155))

(declare-fun m!921743 () Bool)

(assert (=> b!994140 m!921743))

(assert (=> b!994140 m!921743))

(declare-fun m!921745 () Bool)

(assert (=> b!994140 m!921745))

(assert (=> b!994141 m!921743))

(assert (=> b!994141 m!921743))

(assert (=> b!994141 m!921745))

(assert (=> b!994143 m!921743))

(assert (=> b!994143 m!921743))

(declare-fun m!921747 () Bool)

(assert (=> b!994143 m!921747))

(assert (=> bm!42155 m!921743))

(declare-fun m!921749 () Bool)

(assert (=> bm!42155 m!921749))

(assert (=> b!994041 d!118587))

(declare-fun b!994145 () Bool)

(declare-fun e!561015 () Bool)

(declare-fun e!561016 () Bool)

(assert (=> b!994145 (= e!561015 e!561016)))

(declare-fun c!100863 () Bool)

(assert (=> b!994145 (= c!100863 (validKeyInArray!0 (select (arr!30274 a!4424) (bvadd #b00000000000000000000000000000001 from!3778))))))

(declare-fun d!118603 () Bool)

(declare-fun res!664694 () Bool)

(declare-fun e!561018 () Bool)

(assert (=> d!118603 (=> res!664694 e!561018)))

(assert (=> d!118603 (= res!664694 (bvsge (bvadd #b00000000000000000000000000000001 from!3778) (size!30771 a!4424)))))

(assert (=> d!118603 (= (arrayNoDuplicates!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) acc!919) e!561018)))

(declare-fun b!994146 () Bool)

(assert (=> b!994146 (= e!561018 e!561015)))

(declare-fun res!664696 () Bool)

(assert (=> b!994146 (=> (not res!664696) (not e!561015))))

(declare-fun e!561017 () Bool)

(assert (=> b!994146 (= res!664696 (not e!561017))))

(declare-fun res!664695 () Bool)

(assert (=> b!994146 (=> (not res!664695) (not e!561017))))

(assert (=> b!994146 (= res!664695 (validKeyInArray!0 (select (arr!30274 a!4424) (bvadd #b00000000000000000000000000000001 from!3778))))))

(declare-fun b!994147 () Bool)

(declare-fun call!42159 () Bool)

(assert (=> b!994147 (= e!561016 call!42159)))

(declare-fun b!994148 () Bool)

(assert (=> b!994148 (= e!561017 (contains!5850 acc!919 (select (arr!30274 a!4424) (bvadd #b00000000000000000000000000000001 from!3778))))))

(declare-fun bm!42156 () Bool)

(assert (=> bm!42156 (= call!42159 (arrayNoDuplicates!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778 #b00000000000000000000000000000001) (ite c!100863 (Cons!20985 (select (arr!30274 a!4424) (bvadd #b00000000000000000000000000000001 from!3778)) acc!919) acc!919)))))

(declare-fun b!994149 () Bool)

(assert (=> b!994149 (= e!561016 call!42159)))

(assert (= (and d!118603 (not res!664694)) b!994146))

(assert (= (and b!994146 res!664695) b!994148))

(assert (= (and b!994146 res!664696) b!994145))

(assert (= (and b!994145 c!100863) b!994147))

(assert (= (and b!994145 (not c!100863)) b!994149))

(assert (= (or b!994147 b!994149) bm!42156))

(declare-fun m!921751 () Bool)

(assert (=> b!994145 m!921751))

(assert (=> b!994145 m!921751))

(declare-fun m!921753 () Bool)

(assert (=> b!994145 m!921753))

(assert (=> b!994146 m!921751))

(assert (=> b!994146 m!921751))

(assert (=> b!994146 m!921753))

(assert (=> b!994148 m!921751))

(assert (=> b!994148 m!921751))

(declare-fun m!921755 () Bool)

(assert (=> b!994148 m!921755))

(assert (=> bm!42156 m!921751))

(declare-fun m!921757 () Bool)

(assert (=> bm!42156 m!921757))

(assert (=> b!994041 d!118603))

(declare-fun d!118605 () Bool)

(assert (=> d!118605 (arrayNoDuplicates!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) acc!919)))

(declare-fun lt!440688 () Unit!32940)

(declare-fun choose!111 (array!62863 (_ BitVec 32) (_ BitVec 32) List!20989) Unit!32940)

(assert (=> d!118605 (= lt!440688 (choose!111 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) size!36 acc!919))))

(assert (=> d!118605 (= (size!30771 a!4424) size!36)))

(assert (=> d!118605 (= (lemmaArrayNoDuplicatesInAll0Array!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) size!36 acc!919) lt!440688)))

(declare-fun bs!28343 () Bool)

(assert (= bs!28343 d!118605))

(assert (=> bs!28343 m!921659))

(declare-fun m!921759 () Bool)

(assert (=> bs!28343 m!921759))

(assert (=> b!994041 d!118605))

(declare-fun d!118607 () Bool)

(declare-fun lt!440689 () Bool)

(assert (=> d!118607 (= lt!440689 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!476 acc!919)))))

(declare-fun e!561028 () Bool)

(assert (=> d!118607 (= lt!440689 e!561028)))

(declare-fun res!664703 () Bool)

(assert (=> d!118607 (=> (not res!664703) (not e!561028))))

(assert (=> d!118607 (= res!664703 (is-Cons!20985 acc!919))))

(assert (=> d!118607 (= (contains!5850 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000) lt!440689)))

(declare-fun b!994160 () Bool)

(declare-fun e!561027 () Bool)

(assert (=> b!994160 (= e!561028 e!561027)))

(declare-fun res!664704 () Bool)

(assert (=> b!994160 (=> res!664704 e!561027)))

(assert (=> b!994160 (= res!664704 (= (h!22147 acc!919) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!994161 () Bool)

(assert (=> b!994161 (= e!561027 (contains!5850 (t!29990 acc!919) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!118607 res!664703) b!994160))

(assert (= (and b!994160 (not res!664704)) b!994161))

(assert (=> d!118607 m!921701))

(declare-fun m!921761 () Bool)

(assert (=> d!118607 m!921761))

(declare-fun m!921763 () Bool)

(assert (=> b!994161 m!921763))

(assert (=> b!994045 d!118607))

(declare-fun d!118609 () Bool)

(declare-fun res!664715 () Bool)

(declare-fun e!561041 () Bool)

(assert (=> d!118609 (=> res!664715 e!561041)))

(assert (=> d!118609 (= res!664715 (is-Nil!20986 acc!919))))

(assert (=> d!118609 (= (noDuplicate!1448 acc!919) e!561041)))

(declare-fun b!994176 () Bool)

(declare-fun e!561042 () Bool)

(assert (=> b!994176 (= e!561041 e!561042)))

(declare-fun res!664716 () Bool)

(assert (=> b!994176 (=> (not res!664716) (not e!561042))))

(assert (=> b!994176 (= res!664716 (not (contains!5850 (t!29990 acc!919) (h!22147 acc!919))))))

(declare-fun b!994177 () Bool)

(assert (=> b!994177 (= e!561042 (noDuplicate!1448 (t!29990 acc!919)))))

(assert (= (and d!118609 (not res!664715)) b!994176))

(assert (= (and b!994176 res!664716) b!994177))

(declare-fun m!921781 () Bool)

(assert (=> b!994176 m!921781))

(declare-fun m!921783 () Bool)

(assert (=> b!994177 m!921783))

(assert (=> b!994044 d!118609))

(declare-fun d!118615 () Bool)

(assert (=> d!118615 (= (array_inv!23398 a!4424) (bvsge (size!30771 a!4424) #b00000000000000000000000000000000))))

(assert (=> start!85584 d!118615))

(push 1)

(assert (not b!994143))

(assert (not b!994141))

(assert (not bm!42155))

(assert (not d!118583))

(assert (not b!994140))

(assert (not d!118607))

(assert (not d!118605))

(assert (not b!994176))

(assert (not b!994148))

(assert (not b!994107))

(assert (not b!994145))

(assert (not b!994146))

(assert (not b!994161))

(assert (not bm!42156))

(assert (not b!994177))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!118643 () Bool)

(assert (=> d!118643 (= (validKeyInArray!0 (select (arr!30274 a!4424) from!3778)) (and (not (= (select (arr!30274 a!4424) from!3778) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30274 a!4424) from!3778) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!994140 d!118643))

(assert (=> d!118605 d!118603))

(declare-fun d!118645 () Bool)

(assert (=> d!118645 (arrayNoDuplicates!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) acc!919)))

(assert (=> d!118645 true))

(declare-fun res!664740 () Unit!32940)

(assert (=> d!118645 (= (choose!111 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) size!36 acc!919) res!664740)))

(declare-fun bs!28346 () Bool)

(assert (= bs!28346 d!118645))

(assert (=> bs!28346 m!921659))

(assert (=> d!118605 d!118645))

(declare-fun d!118647 () Bool)

(declare-fun c!100875 () Bool)

(assert (=> d!118647 (= c!100875 (is-Nil!20986 acc!919))))

(declare-fun e!561068 () (Set (_ BitVec 64)))

(assert (=> d!118647 (= (content!476 acc!919) e!561068)))

(declare-fun b!994210 () Bool)

(assert (=> b!994210 (= e!561068 (as set.empty (Set (_ BitVec 64))))))

(declare-fun b!994211 () Bool)

(assert (=> b!994211 (= e!561068 (set.union (set.insert (h!22147 acc!919) (as set.empty (Set (_ BitVec 64)))) (content!476 (t!29990 acc!919))))))

(assert (= (and d!118647 c!100875) b!994210))

(assert (= (and d!118647 (not c!100875)) b!994211))

(declare-fun m!921831 () Bool)

(assert (=> b!994211 m!921831))

(declare-fun m!921833 () Bool)

(assert (=> b!994211 m!921833))

(assert (=> d!118583 d!118647))

(declare-fun d!118649 () Bool)

(declare-fun lt!440698 () Bool)

(assert (=> d!118649 (= lt!440698 (set.member (select (arr!30274 a!4424) from!3778) (content!476 acc!919)))))

(declare-fun e!561070 () Bool)

(assert (=> d!118649 (= lt!440698 e!561070)))

(declare-fun res!664741 () Bool)

(assert (=> d!118649 (=> (not res!664741) (not e!561070))))

(assert (=> d!118649 (= res!664741 (is-Cons!20985 acc!919))))

(assert (=> d!118649 (= (contains!5850 acc!919 (select (arr!30274 a!4424) from!3778)) lt!440698)))

(declare-fun b!994212 () Bool)

(declare-fun e!561069 () Bool)

(assert (=> b!994212 (= e!561070 e!561069)))

(declare-fun res!664742 () Bool)

(assert (=> b!994212 (=> res!664742 e!561069)))

(assert (=> b!994212 (= res!664742 (= (h!22147 acc!919) (select (arr!30274 a!4424) from!3778)))))

(declare-fun b!994213 () Bool)

(assert (=> b!994213 (= e!561069 (contains!5850 (t!29990 acc!919) (select (arr!30274 a!4424) from!3778)))))

(assert (= (and d!118649 res!664741) b!994212))

(assert (= (and b!994212 (not res!664742)) b!994213))

(assert (=> d!118649 m!921701))

(assert (=> d!118649 m!921743))

(declare-fun m!921835 () Bool)

(assert (=> d!118649 m!921835))

(assert (=> b!994213 m!921743))

(declare-fun m!921837 () Bool)

(assert (=> b!994213 m!921837))

(assert (=> b!994143 d!118649))

(declare-fun d!118651 () Bool)

(declare-fun res!664743 () Bool)

(declare-fun e!561071 () Bool)

(assert (=> d!118651 (=> res!664743 e!561071)))

(assert (=> d!118651 (= res!664743 (is-Nil!20986 (t!29990 acc!919)))))

(assert (=> d!118651 (= (noDuplicate!1448 (t!29990 acc!919)) e!561071)))

(declare-fun b!994214 () Bool)

(declare-fun e!561072 () Bool)

(assert (=> b!994214 (= e!561071 e!561072)))

(declare-fun res!664744 () Bool)

(assert (=> b!994214 (=> (not res!664744) (not e!561072))))

(assert (=> b!994214 (= res!664744 (not (contains!5850 (t!29990 (t!29990 acc!919)) (h!22147 (t!29990 acc!919)))))))

(declare-fun b!994215 () Bool)

(assert (=> b!994215 (= e!561072 (noDuplicate!1448 (t!29990 (t!29990 acc!919))))))

(assert (= (and d!118651 (not res!664743)) b!994214))

(assert (= (and b!994214 res!664744) b!994215))

(declare-fun m!921839 () Bool)

(assert (=> b!994214 m!921839))

(declare-fun m!921841 () Bool)

(assert (=> b!994215 m!921841))

(assert (=> b!994177 d!118651))

(declare-fun d!118653 () Bool)

(declare-fun lt!440699 () Bool)

(assert (=> d!118653 (= lt!440699 (set.member (h!22147 acc!919) (content!476 (t!29990 acc!919))))))

(declare-fun e!561074 () Bool)

(assert (=> d!118653 (= lt!440699 e!561074)))

(declare-fun res!664745 () Bool)

(assert (=> d!118653 (=> (not res!664745) (not e!561074))))

(assert (=> d!118653 (= res!664745 (is-Cons!20985 (t!29990 acc!919)))))

(assert (=> d!118653 (= (contains!5850 (t!29990 acc!919) (h!22147 acc!919)) lt!440699)))

(declare-fun b!994216 () Bool)

(declare-fun e!561073 () Bool)

(assert (=> b!994216 (= e!561074 e!561073)))

(declare-fun res!664746 () Bool)

(assert (=> b!994216 (=> res!664746 e!561073)))

(assert (=> b!994216 (= res!664746 (= (h!22147 (t!29990 acc!919)) (h!22147 acc!919)))))

(declare-fun b!994217 () Bool)

(assert (=> b!994217 (= e!561073 (contains!5850 (t!29990 (t!29990 acc!919)) (h!22147 acc!919)))))

