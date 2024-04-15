; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85568 () Bool)

(assert start!85568)

(declare-fun b!993802 () Bool)

(declare-fun res!664494 () Bool)

(declare-fun e!560791 () Bool)

(assert (=> b!993802 (=> (not res!664494) (not e!560791))))

(declare-datatypes ((List!21024 0))(
  ( (Nil!21021) (Cons!21020 (h!22182 (_ BitVec 64)) (t!30016 List!21024)) )
))
(declare-fun acc!919 () List!21024)

(declare-fun contains!5823 (List!21024 (_ BitVec 64)) Bool)

(assert (=> b!993802 (= res!664494 (not (contains!5823 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!664496 () Bool)

(assert (=> start!85568 (=> (not res!664496) (not e!560791))))

(declare-datatypes ((array!62801 0))(
  ( (array!62802 (arr!30243 (Array (_ BitVec 32) (_ BitVec 64))) (size!30741 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62801)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85568 (= res!664496 (and (= (size!30741 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62802 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30741 a!4424))))))

(assert (=> start!85568 e!560791))

(declare-fun array_inv!23386 (array!62801) Bool)

(assert (=> start!85568 (array_inv!23386 a!4424)))

(assert (=> start!85568 true))

(declare-fun b!993803 () Bool)

(declare-fun res!664498 () Bool)

(assert (=> b!993803 (=> (not res!664498) (not e!560791))))

(assert (=> b!993803 (= res!664498 (not (contains!5823 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993804 () Bool)

(declare-fun arrayNoDuplicates!0 (array!62801 (_ BitVec 32) List!21024) Bool)

(assert (=> b!993804 (= e!560791 (not (arrayNoDuplicates!0 a!4424 from!3778 acc!919)))))

(assert (=> b!993804 (arrayNoDuplicates!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) acc!919)))

(declare-datatypes ((Unit!32813 0))(
  ( (Unit!32814) )
))
(declare-fun lt!440429 () Unit!32813)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!62801 (_ BitVec 32) (_ BitVec 32) List!21024) Unit!32813)

(assert (=> b!993804 (= lt!440429 (lemmaArrayNoDuplicatesInAll0Array!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) size!36 acc!919))))

(declare-fun b!993805 () Bool)

(declare-fun res!664495 () Bool)

(assert (=> b!993805 (=> (not res!664495) (not e!560791))))

(declare-fun noDuplicate!1456 (List!21024) Bool)

(assert (=> b!993805 (= res!664495 (noDuplicate!1456 acc!919))))

(declare-fun b!993806 () Bool)

(declare-fun res!664497 () Bool)

(assert (=> b!993806 (=> (not res!664497) (not e!560791))))

(assert (=> b!993806 (= res!664497 (and (bvslt from!3778 size!36) (bvsge (bvadd #b00000000000000000000000000000001 from!3778) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3778) (size!30741 a!4424))))))

(assert (= (and start!85568 res!664496) b!993803))

(assert (= (and b!993803 res!664498) b!993802))

(assert (= (and b!993802 res!664494) b!993805))

(assert (= (and b!993805 res!664495) b!993806))

(assert (= (and b!993806 res!664497) b!993804))

(declare-fun m!920891 () Bool)

(assert (=> b!993805 m!920891))

(declare-fun m!920893 () Bool)

(assert (=> b!993803 m!920893))

(declare-fun m!920895 () Bool)

(assert (=> start!85568 m!920895))

(declare-fun m!920897 () Bool)

(assert (=> b!993802 m!920897))

(declare-fun m!920899 () Bool)

(assert (=> b!993804 m!920899))

(declare-fun m!920901 () Bool)

(assert (=> b!993804 m!920901))

(declare-fun m!920903 () Bool)

(assert (=> b!993804 m!920903))

(check-sat (not b!993804) (not b!993805) (not b!993802) (not b!993803) (not start!85568))
(check-sat)
(get-model)

(declare-fun d!118381 () Bool)

(declare-fun lt!440438 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!473 (List!21024) (InoxSet (_ BitVec 64)))

(assert (=> d!118381 (= lt!440438 (select (content!473 acc!919) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!560810 () Bool)

(assert (=> d!118381 (= lt!440438 e!560810)))

(declare-fun res!664534 () Bool)

(assert (=> d!118381 (=> (not res!664534) (not e!560810))))

(get-info :version)

(assert (=> d!118381 (= res!664534 ((_ is Cons!21020) acc!919))))

(assert (=> d!118381 (= (contains!5823 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000) lt!440438)))

(declare-fun b!993841 () Bool)

(declare-fun e!560809 () Bool)

(assert (=> b!993841 (= e!560810 e!560809)))

(declare-fun res!664533 () Bool)

(assert (=> b!993841 (=> res!664533 e!560809)))

(assert (=> b!993841 (= res!664533 (= (h!22182 acc!919) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!993842 () Bool)

(assert (=> b!993842 (= e!560809 (contains!5823 (t!30016 acc!919) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!118381 res!664534) b!993841))

(assert (= (and b!993841 (not res!664533)) b!993842))

(declare-fun m!920933 () Bool)

(assert (=> d!118381 m!920933))

(declare-fun m!920935 () Bool)

(assert (=> d!118381 m!920935))

(declare-fun m!920937 () Bool)

(assert (=> b!993842 m!920937))

(assert (=> b!993803 d!118381))

(declare-fun b!993859 () Bool)

(declare-fun e!560825 () Bool)

(declare-fun call!42128 () Bool)

(assert (=> b!993859 (= e!560825 call!42128)))

(declare-fun e!560827 () Bool)

(declare-fun b!993860 () Bool)

(assert (=> b!993860 (= e!560827 (contains!5823 acc!919 (select (arr!30243 a!4424) from!3778)))))

(declare-fun d!118383 () Bool)

(declare-fun res!664547 () Bool)

(declare-fun e!560826 () Bool)

(assert (=> d!118383 (=> res!664547 e!560826)))

(assert (=> d!118383 (= res!664547 (bvsge from!3778 (size!30741 a!4424)))))

(assert (=> d!118383 (= (arrayNoDuplicates!0 a!4424 from!3778 acc!919) e!560826)))

(declare-fun bm!42125 () Bool)

(declare-fun c!100793 () Bool)

(assert (=> bm!42125 (= call!42128 (arrayNoDuplicates!0 a!4424 (bvadd from!3778 #b00000000000000000000000000000001) (ite c!100793 (Cons!21020 (select (arr!30243 a!4424) from!3778) acc!919) acc!919)))))

(declare-fun b!993861 () Bool)

(assert (=> b!993861 (= e!560825 call!42128)))

(declare-fun b!993862 () Bool)

(declare-fun e!560828 () Bool)

(assert (=> b!993862 (= e!560828 e!560825)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!993862 (= c!100793 (validKeyInArray!0 (select (arr!30243 a!4424) from!3778)))))

(declare-fun b!993863 () Bool)

(assert (=> b!993863 (= e!560826 e!560828)))

(declare-fun res!664549 () Bool)

(assert (=> b!993863 (=> (not res!664549) (not e!560828))))

(assert (=> b!993863 (= res!664549 (not e!560827))))

(declare-fun res!664548 () Bool)

(assert (=> b!993863 (=> (not res!664548) (not e!560827))))

(assert (=> b!993863 (= res!664548 (validKeyInArray!0 (select (arr!30243 a!4424) from!3778)))))

(assert (= (and d!118383 (not res!664547)) b!993863))

(assert (= (and b!993863 res!664548) b!993860))

(assert (= (and b!993863 res!664549) b!993862))

(assert (= (and b!993862 c!100793) b!993859))

(assert (= (and b!993862 (not c!100793)) b!993861))

(assert (= (or b!993859 b!993861) bm!42125))

(declare-fun m!920943 () Bool)

(assert (=> b!993860 m!920943))

(assert (=> b!993860 m!920943))

(declare-fun m!920945 () Bool)

(assert (=> b!993860 m!920945))

(assert (=> bm!42125 m!920943))

(declare-fun m!920947 () Bool)

(assert (=> bm!42125 m!920947))

(assert (=> b!993862 m!920943))

(assert (=> b!993862 m!920943))

(declare-fun m!920949 () Bool)

(assert (=> b!993862 m!920949))

(assert (=> b!993863 m!920943))

(assert (=> b!993863 m!920943))

(assert (=> b!993863 m!920949))

(assert (=> b!993804 d!118383))

(declare-fun b!993868 () Bool)

(declare-fun e!560833 () Bool)

(declare-fun call!42129 () Bool)

(assert (=> b!993868 (= e!560833 call!42129)))

(declare-fun e!560835 () Bool)

(declare-fun b!993869 () Bool)

(assert (=> b!993869 (= e!560835 (contains!5823 acc!919 (select (arr!30243 a!4424) (bvadd #b00000000000000000000000000000001 from!3778))))))

(declare-fun d!118391 () Bool)

(declare-fun res!664554 () Bool)

(declare-fun e!560834 () Bool)

(assert (=> d!118391 (=> res!664554 e!560834)))

(assert (=> d!118391 (= res!664554 (bvsge (bvadd #b00000000000000000000000000000001 from!3778) (size!30741 a!4424)))))

(assert (=> d!118391 (= (arrayNoDuplicates!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) acc!919) e!560834)))

(declare-fun c!100794 () Bool)

(declare-fun bm!42126 () Bool)

(assert (=> bm!42126 (= call!42129 (arrayNoDuplicates!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778 #b00000000000000000000000000000001) (ite c!100794 (Cons!21020 (select (arr!30243 a!4424) (bvadd #b00000000000000000000000000000001 from!3778)) acc!919) acc!919)))))

(declare-fun b!993870 () Bool)

(assert (=> b!993870 (= e!560833 call!42129)))

(declare-fun b!993871 () Bool)

(declare-fun e!560836 () Bool)

(assert (=> b!993871 (= e!560836 e!560833)))

(assert (=> b!993871 (= c!100794 (validKeyInArray!0 (select (arr!30243 a!4424) (bvadd #b00000000000000000000000000000001 from!3778))))))

(declare-fun b!993872 () Bool)

(assert (=> b!993872 (= e!560834 e!560836)))

(declare-fun res!664556 () Bool)

(assert (=> b!993872 (=> (not res!664556) (not e!560836))))

(assert (=> b!993872 (= res!664556 (not e!560835))))

(declare-fun res!664555 () Bool)

(assert (=> b!993872 (=> (not res!664555) (not e!560835))))

(assert (=> b!993872 (= res!664555 (validKeyInArray!0 (select (arr!30243 a!4424) (bvadd #b00000000000000000000000000000001 from!3778))))))

(assert (= (and d!118391 (not res!664554)) b!993872))

(assert (= (and b!993872 res!664555) b!993869))

(assert (= (and b!993872 res!664556) b!993871))

(assert (= (and b!993871 c!100794) b!993868))

(assert (= (and b!993871 (not c!100794)) b!993870))

(assert (= (or b!993868 b!993870) bm!42126))

(declare-fun m!920951 () Bool)

(assert (=> b!993869 m!920951))

(assert (=> b!993869 m!920951))

(declare-fun m!920953 () Bool)

(assert (=> b!993869 m!920953))

(assert (=> bm!42126 m!920951))

(declare-fun m!920955 () Bool)

(assert (=> bm!42126 m!920955))

(assert (=> b!993871 m!920951))

(assert (=> b!993871 m!920951))

(declare-fun m!920957 () Bool)

(assert (=> b!993871 m!920957))

(assert (=> b!993872 m!920951))

(assert (=> b!993872 m!920951))

(assert (=> b!993872 m!920957))

(assert (=> b!993804 d!118391))

(declare-fun d!118395 () Bool)

(assert (=> d!118395 (arrayNoDuplicates!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) acc!919)))

(declare-fun lt!440444 () Unit!32813)

(declare-fun choose!111 (array!62801 (_ BitVec 32) (_ BitVec 32) List!21024) Unit!32813)

(assert (=> d!118395 (= lt!440444 (choose!111 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) size!36 acc!919))))

(assert (=> d!118395 (= (size!30741 a!4424) size!36)))

(assert (=> d!118395 (= (lemmaArrayNoDuplicatesInAll0Array!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) size!36 acc!919) lt!440444)))

(declare-fun bs!28309 () Bool)

(assert (= bs!28309 d!118395))

(assert (=> bs!28309 m!920901))

(declare-fun m!920969 () Bool)

(assert (=> bs!28309 m!920969))

(assert (=> b!993804 d!118395))

(declare-fun d!118401 () Bool)

(assert (=> d!118401 (= (array_inv!23386 a!4424) (bvsge (size!30741 a!4424) #b00000000000000000000000000000000))))

(assert (=> start!85568 d!118401))

(declare-fun d!118405 () Bool)

(declare-fun res!664579 () Bool)

(declare-fun e!560861 () Bool)

(assert (=> d!118405 (=> res!664579 e!560861)))

(assert (=> d!118405 (= res!664579 ((_ is Nil!21021) acc!919))))

(assert (=> d!118405 (= (noDuplicate!1456 acc!919) e!560861)))

(declare-fun b!993899 () Bool)

(declare-fun e!560862 () Bool)

(assert (=> b!993899 (= e!560861 e!560862)))

(declare-fun res!664580 () Bool)

(assert (=> b!993899 (=> (not res!664580) (not e!560862))))

(assert (=> b!993899 (= res!664580 (not (contains!5823 (t!30016 acc!919) (h!22182 acc!919))))))

(declare-fun b!993900 () Bool)

(assert (=> b!993900 (= e!560862 (noDuplicate!1456 (t!30016 acc!919)))))

(assert (= (and d!118405 (not res!664579)) b!993899))

(assert (= (and b!993899 res!664580) b!993900))

(declare-fun m!920971 () Bool)

(assert (=> b!993899 m!920971))

(declare-fun m!920973 () Bool)

(assert (=> b!993900 m!920973))

(assert (=> b!993805 d!118405))

(declare-fun d!118407 () Bool)

(declare-fun lt!440447 () Bool)

(assert (=> d!118407 (= lt!440447 (select (content!473 acc!919) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!560864 () Bool)

(assert (=> d!118407 (= lt!440447 e!560864)))

(declare-fun res!664582 () Bool)

(assert (=> d!118407 (=> (not res!664582) (not e!560864))))

(assert (=> d!118407 (= res!664582 ((_ is Cons!21020) acc!919))))

(assert (=> d!118407 (= (contains!5823 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000) lt!440447)))

(declare-fun b!993901 () Bool)

(declare-fun e!560863 () Bool)

(assert (=> b!993901 (= e!560864 e!560863)))

(declare-fun res!664581 () Bool)

(assert (=> b!993901 (=> res!664581 e!560863)))

(assert (=> b!993901 (= res!664581 (= (h!22182 acc!919) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!993902 () Bool)

(assert (=> b!993902 (= e!560863 (contains!5823 (t!30016 acc!919) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!118407 res!664582) b!993901))

(assert (= (and b!993901 (not res!664581)) b!993902))

(assert (=> d!118407 m!920933))

(declare-fun m!920975 () Bool)

(assert (=> d!118407 m!920975))

(declare-fun m!920977 () Bool)

(assert (=> b!993902 m!920977))

(assert (=> b!993802 d!118407))

(check-sat (not d!118395) (not b!993871) (not b!993900) (not bm!42125) (not b!993842) (not d!118407) (not b!993872) (not b!993899) (not d!118381) (not b!993862) (not b!993869) (not b!993860) (not bm!42126) (not b!993863) (not b!993902))
(check-sat)
(get-model)

(declare-fun d!118423 () Bool)

(declare-fun lt!440457 () Bool)

(assert (=> d!118423 (= lt!440457 (select (content!473 (t!30016 acc!919)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!560896 () Bool)

(assert (=> d!118423 (= lt!440457 e!560896)))

(declare-fun res!664608 () Bool)

(assert (=> d!118423 (=> (not res!664608) (not e!560896))))

(assert (=> d!118423 (= res!664608 ((_ is Cons!21020) (t!30016 acc!919)))))

(assert (=> d!118423 (= (contains!5823 (t!30016 acc!919) #b1000000000000000000000000000000000000000000000000000000000000000) lt!440457)))

(declare-fun b!993939 () Bool)

(declare-fun e!560895 () Bool)

(assert (=> b!993939 (= e!560896 e!560895)))

(declare-fun res!664607 () Bool)

(assert (=> b!993939 (=> res!664607 e!560895)))

(assert (=> b!993939 (= res!664607 (= (h!22182 (t!30016 acc!919)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!993940 () Bool)

(assert (=> b!993940 (= e!560895 (contains!5823 (t!30016 (t!30016 acc!919)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!118423 res!664608) b!993939))

(assert (= (and b!993939 (not res!664607)) b!993940))

(declare-fun m!921029 () Bool)

(assert (=> d!118423 m!921029))

(declare-fun m!921031 () Bool)

(assert (=> d!118423 m!921031))

(declare-fun m!921033 () Bool)

(assert (=> b!993940 m!921033))

(assert (=> b!993902 d!118423))

(declare-fun d!118425 () Bool)

(declare-fun lt!440458 () Bool)

(assert (=> d!118425 (= lt!440458 (select (content!473 acc!919) (select (arr!30243 a!4424) from!3778)))))

(declare-fun e!560898 () Bool)

(assert (=> d!118425 (= lt!440458 e!560898)))

(declare-fun res!664610 () Bool)

(assert (=> d!118425 (=> (not res!664610) (not e!560898))))

(assert (=> d!118425 (= res!664610 ((_ is Cons!21020) acc!919))))

(assert (=> d!118425 (= (contains!5823 acc!919 (select (arr!30243 a!4424) from!3778)) lt!440458)))

(declare-fun b!993941 () Bool)

(declare-fun e!560897 () Bool)

(assert (=> b!993941 (= e!560898 e!560897)))

(declare-fun res!664609 () Bool)

(assert (=> b!993941 (=> res!664609 e!560897)))

(assert (=> b!993941 (= res!664609 (= (h!22182 acc!919) (select (arr!30243 a!4424) from!3778)))))

(declare-fun b!993942 () Bool)

(assert (=> b!993942 (= e!560897 (contains!5823 (t!30016 acc!919) (select (arr!30243 a!4424) from!3778)))))

(assert (= (and d!118425 res!664610) b!993941))

(assert (= (and b!993941 (not res!664609)) b!993942))

(assert (=> d!118425 m!920933))

(assert (=> d!118425 m!920943))

(declare-fun m!921035 () Bool)

(assert (=> d!118425 m!921035))

(assert (=> b!993942 m!920943))

(declare-fun m!921037 () Bool)

(assert (=> b!993942 m!921037))

(assert (=> b!993860 d!118425))

(declare-fun lt!440459 () Bool)

(declare-fun d!118427 () Bool)

(assert (=> d!118427 (= lt!440459 (select (content!473 acc!919) (select (arr!30243 a!4424) (bvadd #b00000000000000000000000000000001 from!3778))))))

(declare-fun e!560900 () Bool)

(assert (=> d!118427 (= lt!440459 e!560900)))

(declare-fun res!664612 () Bool)

(assert (=> d!118427 (=> (not res!664612) (not e!560900))))

(assert (=> d!118427 (= res!664612 ((_ is Cons!21020) acc!919))))

(assert (=> d!118427 (= (contains!5823 acc!919 (select (arr!30243 a!4424) (bvadd #b00000000000000000000000000000001 from!3778))) lt!440459)))

(declare-fun b!993943 () Bool)

(declare-fun e!560899 () Bool)

(assert (=> b!993943 (= e!560900 e!560899)))

(declare-fun res!664611 () Bool)

(assert (=> b!993943 (=> res!664611 e!560899)))

(assert (=> b!993943 (= res!664611 (= (h!22182 acc!919) (select (arr!30243 a!4424) (bvadd #b00000000000000000000000000000001 from!3778))))))

(declare-fun b!993944 () Bool)

(assert (=> b!993944 (= e!560899 (contains!5823 (t!30016 acc!919) (select (arr!30243 a!4424) (bvadd #b00000000000000000000000000000001 from!3778))))))

(assert (= (and d!118427 res!664612) b!993943))

(assert (= (and b!993943 (not res!664611)) b!993944))

(assert (=> d!118427 m!920933))

(assert (=> d!118427 m!920951))

(declare-fun m!921039 () Bool)

(assert (=> d!118427 m!921039))

(assert (=> b!993944 m!920951))

(declare-fun m!921041 () Bool)

(assert (=> b!993944 m!921041))

(assert (=> b!993869 d!118427))

(declare-fun b!993945 () Bool)

(declare-fun e!560901 () Bool)

(declare-fun call!42138 () Bool)

(assert (=> b!993945 (= e!560901 call!42138)))

(declare-fun e!560903 () Bool)

(declare-fun b!993946 () Bool)

(assert (=> b!993946 (= e!560903 (contains!5823 (ite c!100793 (Cons!21020 (select (arr!30243 a!4424) from!3778) acc!919) acc!919) (select (arr!30243 a!4424) (bvadd from!3778 #b00000000000000000000000000000001))))))

(declare-fun d!118429 () Bool)

(declare-fun res!664613 () Bool)

(declare-fun e!560902 () Bool)

(assert (=> d!118429 (=> res!664613 e!560902)))

(assert (=> d!118429 (= res!664613 (bvsge (bvadd from!3778 #b00000000000000000000000000000001) (size!30741 a!4424)))))

(assert (=> d!118429 (= (arrayNoDuplicates!0 a!4424 (bvadd from!3778 #b00000000000000000000000000000001) (ite c!100793 (Cons!21020 (select (arr!30243 a!4424) from!3778) acc!919) acc!919)) e!560902)))

(declare-fun bm!42135 () Bool)

(declare-fun c!100803 () Bool)

(assert (=> bm!42135 (= call!42138 (arrayNoDuplicates!0 a!4424 (bvadd from!3778 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!100803 (Cons!21020 (select (arr!30243 a!4424) (bvadd from!3778 #b00000000000000000000000000000001)) (ite c!100793 (Cons!21020 (select (arr!30243 a!4424) from!3778) acc!919) acc!919)) (ite c!100793 (Cons!21020 (select (arr!30243 a!4424) from!3778) acc!919) acc!919))))))

(declare-fun b!993947 () Bool)

(assert (=> b!993947 (= e!560901 call!42138)))

(declare-fun b!993948 () Bool)

(declare-fun e!560904 () Bool)

(assert (=> b!993948 (= e!560904 e!560901)))

(assert (=> b!993948 (= c!100803 (validKeyInArray!0 (select (arr!30243 a!4424) (bvadd from!3778 #b00000000000000000000000000000001))))))

(declare-fun b!993949 () Bool)

(assert (=> b!993949 (= e!560902 e!560904)))

(declare-fun res!664615 () Bool)

(assert (=> b!993949 (=> (not res!664615) (not e!560904))))

(assert (=> b!993949 (= res!664615 (not e!560903))))

(declare-fun res!664614 () Bool)

(assert (=> b!993949 (=> (not res!664614) (not e!560903))))

(assert (=> b!993949 (= res!664614 (validKeyInArray!0 (select (arr!30243 a!4424) (bvadd from!3778 #b00000000000000000000000000000001))))))

(assert (= (and d!118429 (not res!664613)) b!993949))

(assert (= (and b!993949 res!664614) b!993946))

(assert (= (and b!993949 res!664615) b!993948))

(assert (= (and b!993948 c!100803) b!993945))

(assert (= (and b!993948 (not c!100803)) b!993947))

(assert (= (or b!993945 b!993947) bm!42135))

(declare-fun m!921043 () Bool)

(assert (=> b!993946 m!921043))

(assert (=> b!993946 m!921043))

(declare-fun m!921045 () Bool)

(assert (=> b!993946 m!921045))

(assert (=> bm!42135 m!921043))

(declare-fun m!921047 () Bool)

(assert (=> bm!42135 m!921047))

(assert (=> b!993948 m!921043))

(assert (=> b!993948 m!921043))

(declare-fun m!921049 () Bool)

(assert (=> b!993948 m!921049))

(assert (=> b!993949 m!921043))

(assert (=> b!993949 m!921043))

(assert (=> b!993949 m!921049))

(assert (=> bm!42125 d!118429))

(declare-fun d!118431 () Bool)

(declare-fun res!664616 () Bool)

(declare-fun e!560905 () Bool)

(assert (=> d!118431 (=> res!664616 e!560905)))

(assert (=> d!118431 (= res!664616 ((_ is Nil!21021) (t!30016 acc!919)))))

(assert (=> d!118431 (= (noDuplicate!1456 (t!30016 acc!919)) e!560905)))

(declare-fun b!993950 () Bool)

(declare-fun e!560906 () Bool)

(assert (=> b!993950 (= e!560905 e!560906)))

(declare-fun res!664617 () Bool)

(assert (=> b!993950 (=> (not res!664617) (not e!560906))))

(assert (=> b!993950 (= res!664617 (not (contains!5823 (t!30016 (t!30016 acc!919)) (h!22182 (t!30016 acc!919)))))))

(declare-fun b!993951 () Bool)

(assert (=> b!993951 (= e!560906 (noDuplicate!1456 (t!30016 (t!30016 acc!919))))))

(assert (= (and d!118431 (not res!664616)) b!993950))

(assert (= (and b!993950 res!664617) b!993951))

(declare-fun m!921051 () Bool)

(assert (=> b!993950 m!921051))

(declare-fun m!921053 () Bool)

(assert (=> b!993951 m!921053))

(assert (=> b!993900 d!118431))

(declare-fun d!118433 () Bool)

(declare-fun lt!440460 () Bool)

(assert (=> d!118433 (= lt!440460 (select (content!473 (t!30016 acc!919)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!560908 () Bool)

(assert (=> d!118433 (= lt!440460 e!560908)))

(declare-fun res!664619 () Bool)

(assert (=> d!118433 (=> (not res!664619) (not e!560908))))

(assert (=> d!118433 (= res!664619 ((_ is Cons!21020) (t!30016 acc!919)))))

(assert (=> d!118433 (= (contains!5823 (t!30016 acc!919) #b0000000000000000000000000000000000000000000000000000000000000000) lt!440460)))

(declare-fun b!993952 () Bool)

(declare-fun e!560907 () Bool)

(assert (=> b!993952 (= e!560908 e!560907)))

(declare-fun res!664618 () Bool)

(assert (=> b!993952 (=> res!664618 e!560907)))

(assert (=> b!993952 (= res!664618 (= (h!22182 (t!30016 acc!919)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!993953 () Bool)

(assert (=> b!993953 (= e!560907 (contains!5823 (t!30016 (t!30016 acc!919)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!118433 res!664619) b!993952))

(assert (= (and b!993952 (not res!664618)) b!993953))

(assert (=> d!118433 m!921029))

(declare-fun m!921055 () Bool)

(assert (=> d!118433 m!921055))

(declare-fun m!921057 () Bool)

(assert (=> b!993953 m!921057))

(assert (=> b!993842 d!118433))

(declare-fun d!118435 () Bool)

(assert (=> d!118435 (= (validKeyInArray!0 (select (arr!30243 a!4424) from!3778)) (and (not (= (select (arr!30243 a!4424) from!3778) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30243 a!4424) from!3778) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!993863 d!118435))

(declare-fun d!118437 () Bool)

(assert (=> d!118437 (= (validKeyInArray!0 (select (arr!30243 a!4424) (bvadd #b00000000000000000000000000000001 from!3778))) (and (not (= (select (arr!30243 a!4424) (bvadd #b00000000000000000000000000000001 from!3778)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30243 a!4424) (bvadd #b00000000000000000000000000000001 from!3778)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!993872 d!118437))

(declare-fun d!118439 () Bool)

(declare-fun c!100806 () Bool)

(assert (=> d!118439 (= c!100806 ((_ is Nil!21021) acc!919))))

(declare-fun e!560911 () (InoxSet (_ BitVec 64)))

(assert (=> d!118439 (= (content!473 acc!919) e!560911)))

(declare-fun b!993958 () Bool)

(assert (=> b!993958 (= e!560911 ((as const (Array (_ BitVec 64) Bool)) false))))

(declare-fun b!993959 () Bool)

(assert (=> b!993959 (= e!560911 ((_ map or) (store ((as const (Array (_ BitVec 64) Bool)) false) (h!22182 acc!919) true) (content!473 (t!30016 acc!919))))))

(assert (= (and d!118439 c!100806) b!993958))

(assert (= (and d!118439 (not c!100806)) b!993959))

(declare-fun m!921059 () Bool)

(assert (=> b!993959 m!921059))

(assert (=> b!993959 m!921029))

(assert (=> d!118381 d!118439))

(declare-fun d!118441 () Bool)

(declare-fun lt!440461 () Bool)

(assert (=> d!118441 (= lt!440461 (select (content!473 (t!30016 acc!919)) (h!22182 acc!919)))))

(declare-fun e!560913 () Bool)

(assert (=> d!118441 (= lt!440461 e!560913)))

(declare-fun res!664621 () Bool)

(assert (=> d!118441 (=> (not res!664621) (not e!560913))))

(assert (=> d!118441 (= res!664621 ((_ is Cons!21020) (t!30016 acc!919)))))

(assert (=> d!118441 (= (contains!5823 (t!30016 acc!919) (h!22182 acc!919)) lt!440461)))

(declare-fun b!993960 () Bool)

(declare-fun e!560912 () Bool)

(assert (=> b!993960 (= e!560913 e!560912)))

(declare-fun res!664620 () Bool)

(assert (=> b!993960 (=> res!664620 e!560912)))

(assert (=> b!993960 (= res!664620 (= (h!22182 (t!30016 acc!919)) (h!22182 acc!919)))))

(declare-fun b!993961 () Bool)

(assert (=> b!993961 (= e!560912 (contains!5823 (t!30016 (t!30016 acc!919)) (h!22182 acc!919)))))

(assert (= (and d!118441 res!664621) b!993960))

(assert (= (and b!993960 (not res!664620)) b!993961))

(assert (=> d!118441 m!921029))

(declare-fun m!921061 () Bool)

(assert (=> d!118441 m!921061))

(declare-fun m!921063 () Bool)

(assert (=> b!993961 m!921063))

(assert (=> b!993899 d!118441))

(declare-fun b!993962 () Bool)

(declare-fun e!560914 () Bool)

(declare-fun call!42139 () Bool)

(assert (=> b!993962 (= e!560914 call!42139)))

(declare-fun b!993963 () Bool)

(declare-fun e!560916 () Bool)

(assert (=> b!993963 (= e!560916 (contains!5823 (ite c!100794 (Cons!21020 (select (arr!30243 a!4424) (bvadd #b00000000000000000000000000000001 from!3778)) acc!919) acc!919) (select (arr!30243 a!4424) (bvadd #b00000000000000000000000000000001 from!3778 #b00000000000000000000000000000001))))))

(declare-fun d!118443 () Bool)

(declare-fun res!664622 () Bool)

(declare-fun e!560915 () Bool)

(assert (=> d!118443 (=> res!664622 e!560915)))

(assert (=> d!118443 (= res!664622 (bvsge (bvadd #b00000000000000000000000000000001 from!3778 #b00000000000000000000000000000001) (size!30741 a!4424)))))

(assert (=> d!118443 (= (arrayNoDuplicates!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778 #b00000000000000000000000000000001) (ite c!100794 (Cons!21020 (select (arr!30243 a!4424) (bvadd #b00000000000000000000000000000001 from!3778)) acc!919) acc!919)) e!560915)))

(declare-fun c!100807 () Bool)

(declare-fun bm!42136 () Bool)

(assert (=> bm!42136 (= call!42139 (arrayNoDuplicates!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!100807 (Cons!21020 (select (arr!30243 a!4424) (bvadd #b00000000000000000000000000000001 from!3778 #b00000000000000000000000000000001)) (ite c!100794 (Cons!21020 (select (arr!30243 a!4424) (bvadd #b00000000000000000000000000000001 from!3778)) acc!919) acc!919)) (ite c!100794 (Cons!21020 (select (arr!30243 a!4424) (bvadd #b00000000000000000000000000000001 from!3778)) acc!919) acc!919))))))

(declare-fun b!993964 () Bool)

(assert (=> b!993964 (= e!560914 call!42139)))

(declare-fun b!993965 () Bool)

(declare-fun e!560917 () Bool)

(assert (=> b!993965 (= e!560917 e!560914)))

(assert (=> b!993965 (= c!100807 (validKeyInArray!0 (select (arr!30243 a!4424) (bvadd #b00000000000000000000000000000001 from!3778 #b00000000000000000000000000000001))))))

(declare-fun b!993966 () Bool)

(assert (=> b!993966 (= e!560915 e!560917)))

(declare-fun res!664624 () Bool)

(assert (=> b!993966 (=> (not res!664624) (not e!560917))))

(assert (=> b!993966 (= res!664624 (not e!560916))))

(declare-fun res!664623 () Bool)

(assert (=> b!993966 (=> (not res!664623) (not e!560916))))

(assert (=> b!993966 (= res!664623 (validKeyInArray!0 (select (arr!30243 a!4424) (bvadd #b00000000000000000000000000000001 from!3778 #b00000000000000000000000000000001))))))

(assert (= (and d!118443 (not res!664622)) b!993966))

(assert (= (and b!993966 res!664623) b!993963))

(assert (= (and b!993966 res!664624) b!993965))

(assert (= (and b!993965 c!100807) b!993962))

(assert (= (and b!993965 (not c!100807)) b!993964))

(assert (= (or b!993962 b!993964) bm!42136))

(declare-fun m!921065 () Bool)

(assert (=> b!993963 m!921065))

(assert (=> b!993963 m!921065))

(declare-fun m!921067 () Bool)

(assert (=> b!993963 m!921067))

(assert (=> bm!42136 m!921065))

(declare-fun m!921069 () Bool)

(assert (=> bm!42136 m!921069))

(assert (=> b!993965 m!921065))

(assert (=> b!993965 m!921065))

(declare-fun m!921071 () Bool)

(assert (=> b!993965 m!921071))

(assert (=> b!993966 m!921065))

(assert (=> b!993966 m!921065))

(assert (=> b!993966 m!921071))

(assert (=> bm!42126 d!118443))

(assert (=> d!118395 d!118391))

(declare-fun d!118445 () Bool)

(assert (=> d!118445 (arrayNoDuplicates!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) acc!919)))

(assert (=> d!118445 true))

(declare-fun res!664627 () Unit!32813)

(assert (=> d!118445 (= (choose!111 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) size!36 acc!919) res!664627)))

(declare-fun bs!28312 () Bool)

(assert (= bs!28312 d!118445))

(assert (=> bs!28312 m!920901))

(assert (=> d!118395 d!118445))

(assert (=> d!118407 d!118439))

(assert (=> b!993862 d!118435))

(assert (=> b!993871 d!118437))

(check-sat (not b!993951) (not d!118423) (not d!118427) (not d!118433) (not bm!42136) (not b!993940) (not b!993965) (not b!993944) (not b!993966) (not b!993946) (not b!993961) (not b!993948) (not b!993953) (not d!118441) (not b!993950) (not b!993942) (not b!993963) (not b!993959) (not bm!42135) (not b!993949) (not d!118445) (not d!118425))
(check-sat)
