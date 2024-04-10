; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114746 () Bool)

(assert start!114746)

(declare-fun b!1360838 () Bool)

(declare-fun res!905065 () Bool)

(declare-fun e!772035 () Bool)

(assert (=> b!1360838 (=> (not res!905065) (not e!772035))))

(declare-datatypes ((array!92583 0))(
  ( (array!92584 (arr!44729 (Array (_ BitVec 32) (_ BitVec 64))) (size!45279 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92583)

(declare-datatypes ((List!31770 0))(
  ( (Nil!31767) (Cons!31766 (h!32975 (_ BitVec 64)) (t!46449 List!31770)) )
))
(declare-fun arrayNoDuplicates!0 (array!92583 (_ BitVec 32) List!31770) Bool)

(assert (=> b!1360838 (= res!905065 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31767))))

(declare-fun b!1360839 () Bool)

(declare-datatypes ((Unit!44847 0))(
  ( (Unit!44848) )
))
(declare-fun e!772031 () Unit!44847)

(declare-fun lt!599997 () Unit!44847)

(assert (=> b!1360839 (= e!772031 lt!599997)))

(declare-fun lt!599996 () Unit!44847)

(declare-fun acc!759 () List!31770)

(declare-fun lemmaListSubSeqRefl!0 (List!31770) Unit!44847)

(assert (=> b!1360839 (= lt!599996 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!881 (List!31770 List!31770) Bool)

(assert (=> b!1360839 (subseq!881 acc!759 acc!759)))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92583 List!31770 List!31770 (_ BitVec 32)) Unit!44847)

(declare-fun $colon$colon!884 (List!31770 (_ BitVec 64)) List!31770)

(assert (=> b!1360839 (= lt!599997 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!884 acc!759 (select (arr!44729 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1360839 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1360840 () Bool)

(declare-fun res!905074 () Bool)

(assert (=> b!1360840 (=> (not res!905074) (not e!772035))))

(declare-fun contains!9479 (List!31770 (_ BitVec 64)) Bool)

(assert (=> b!1360840 (= res!905074 (not (contains!9479 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360841 () Bool)

(declare-fun e!772036 () Bool)

(declare-fun e!772032 () Bool)

(assert (=> b!1360841 (= e!772036 e!772032)))

(declare-fun res!905068 () Bool)

(assert (=> b!1360841 (=> res!905068 e!772032)))

(declare-fun lt!599994 () List!31770)

(assert (=> b!1360841 (= res!905068 (contains!9479 lt!599994 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1360842 () Bool)

(declare-fun res!905071 () Bool)

(assert (=> b!1360842 (=> (not res!905071) (not e!772035))))

(assert (=> b!1360842 (= res!905071 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1360843 () Bool)

(declare-fun res!905067 () Bool)

(assert (=> b!1360843 (=> (not res!905067) (not e!772035))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1360843 (= res!905067 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45279 a!3742))))))

(declare-fun b!1360844 () Bool)

(declare-fun res!905066 () Bool)

(assert (=> b!1360844 (=> (not res!905066) (not e!772035))))

(assert (=> b!1360844 (= res!905066 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45279 a!3742)))))

(declare-fun b!1360845 () Bool)

(declare-fun Unit!44849 () Unit!44847)

(assert (=> b!1360845 (= e!772031 Unit!44849)))

(declare-fun b!1360847 () Bool)

(assert (=> b!1360847 (= e!772032 (contains!9479 lt!599994 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1360848 () Bool)

(declare-fun e!772033 () Bool)

(assert (=> b!1360848 (= e!772033 e!772036)))

(declare-fun res!905070 () Bool)

(assert (=> b!1360848 (=> (not res!905070) (not e!772036))))

(assert (=> b!1360848 (= res!905070 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(assert (=> b!1360848 (= lt!599994 ($colon$colon!884 acc!759 (select (arr!44729 a!3742) from!3120)))))

(declare-fun b!1360849 () Bool)

(declare-fun res!905063 () Bool)

(assert (=> b!1360849 (=> (not res!905063) (not e!772036))))

(declare-fun noDuplicate!2336 (List!31770) Bool)

(assert (=> b!1360849 (= res!905063 (noDuplicate!2336 lt!599994))))

(declare-fun b!1360850 () Bool)

(declare-fun res!905064 () Bool)

(assert (=> b!1360850 (=> (not res!905064) (not e!772035))))

(assert (=> b!1360850 (= res!905064 (not (contains!9479 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360851 () Bool)

(declare-fun res!905072 () Bool)

(assert (=> b!1360851 (=> (not res!905072) (not e!772035))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1360851 (= res!905072 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1360852 () Bool)

(assert (=> b!1360852 (= e!772035 e!772033)))

(declare-fun res!905062 () Bool)

(assert (=> b!1360852 (=> (not res!905062) (not e!772033))))

(declare-fun lt!599995 () Bool)

(assert (=> b!1360852 (= res!905062 (and (not (= from!3120 i!1404)) lt!599995))))

(declare-fun lt!599998 () Unit!44847)

(assert (=> b!1360852 (= lt!599998 e!772031)))

(declare-fun c!127328 () Bool)

(assert (=> b!1360852 (= c!127328 lt!599995)))

(assert (=> b!1360852 (= lt!599995 (validKeyInArray!0 (select (arr!44729 a!3742) from!3120)))))

(declare-fun res!905069 () Bool)

(assert (=> start!114746 (=> (not res!905069) (not e!772035))))

(assert (=> start!114746 (= res!905069 (and (bvslt (size!45279 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45279 a!3742))))))

(assert (=> start!114746 e!772035))

(assert (=> start!114746 true))

(declare-fun array_inv!33757 (array!92583) Bool)

(assert (=> start!114746 (array_inv!33757 a!3742)))

(declare-fun b!1360846 () Bool)

(declare-fun res!905073 () Bool)

(assert (=> b!1360846 (=> (not res!905073) (not e!772035))))

(assert (=> b!1360846 (= res!905073 (noDuplicate!2336 acc!759))))

(assert (= (and start!114746 res!905069) b!1360846))

(assert (= (and b!1360846 res!905073) b!1360840))

(assert (= (and b!1360840 res!905074) b!1360850))

(assert (= (and b!1360850 res!905064) b!1360838))

(assert (= (and b!1360838 res!905065) b!1360842))

(assert (= (and b!1360842 res!905071) b!1360843))

(assert (= (and b!1360843 res!905067) b!1360851))

(assert (= (and b!1360851 res!905072) b!1360844))

(assert (= (and b!1360844 res!905066) b!1360852))

(assert (= (and b!1360852 c!127328) b!1360839))

(assert (= (and b!1360852 (not c!127328)) b!1360845))

(assert (= (and b!1360852 res!905062) b!1360848))

(assert (= (and b!1360848 res!905070) b!1360849))

(assert (= (and b!1360849 res!905063) b!1360841))

(assert (= (and b!1360841 (not res!905068)) b!1360847))

(declare-fun m!1246045 () Bool)

(assert (=> b!1360852 m!1246045))

(assert (=> b!1360852 m!1246045))

(declare-fun m!1246047 () Bool)

(assert (=> b!1360852 m!1246047))

(declare-fun m!1246049 () Bool)

(assert (=> b!1360851 m!1246049))

(declare-fun m!1246051 () Bool)

(assert (=> b!1360847 m!1246051))

(declare-fun m!1246053 () Bool)

(assert (=> b!1360842 m!1246053))

(declare-fun m!1246055 () Bool)

(assert (=> b!1360841 m!1246055))

(declare-fun m!1246057 () Bool)

(assert (=> b!1360840 m!1246057))

(declare-fun m!1246059 () Bool)

(assert (=> b!1360846 m!1246059))

(declare-fun m!1246061 () Bool)

(assert (=> b!1360838 m!1246061))

(declare-fun m!1246063 () Bool)

(assert (=> b!1360839 m!1246063))

(assert (=> b!1360839 m!1246045))

(declare-fun m!1246065 () Bool)

(assert (=> b!1360839 m!1246065))

(declare-fun m!1246067 () Bool)

(assert (=> b!1360839 m!1246067))

(declare-fun m!1246069 () Bool)

(assert (=> b!1360839 m!1246069))

(assert (=> b!1360839 m!1246045))

(assert (=> b!1360839 m!1246065))

(declare-fun m!1246071 () Bool)

(assert (=> b!1360839 m!1246071))

(declare-fun m!1246073 () Bool)

(assert (=> b!1360850 m!1246073))

(declare-fun m!1246075 () Bool)

(assert (=> b!1360849 m!1246075))

(declare-fun m!1246077 () Bool)

(assert (=> start!114746 m!1246077))

(assert (=> b!1360848 m!1246045))

(assert (=> b!1360848 m!1246045))

(assert (=> b!1360848 m!1246065))

(push 1)

(assert (not b!1360849))

(assert (not b!1360846))

(assert (not b!1360841))

(assert (not b!1360840))

(assert (not b!1360838))

(assert (not start!114746))

(assert (not b!1360842))

(assert (not b!1360839))

(assert (not b!1360848))

(assert (not b!1360850))

(assert (not b!1360851))

(assert (not b!1360852))

(assert (not b!1360847))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!145759 () Bool)

(declare-fun lt!600042 () Bool)

(declare-fun content!695 (List!31770) (Set (_ BitVec 64)))

(assert (=> d!145759 (= lt!600042 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!695 lt!599994)))))

(declare-fun e!772115 () Bool)

(assert (=> d!145759 (= lt!600042 e!772115)))

(declare-fun res!905192 () Bool)

(assert (=> d!145759 (=> (not res!905192) (not e!772115))))

(assert (=> d!145759 (= res!905192 (is-Cons!31766 lt!599994))))

(assert (=> d!145759 (= (contains!9479 lt!599994 #b1000000000000000000000000000000000000000000000000000000000000000) lt!600042)))

(declare-fun b!1360988 () Bool)

(declare-fun e!772116 () Bool)

(assert (=> b!1360988 (= e!772115 e!772116)))

(declare-fun res!905193 () Bool)

(assert (=> b!1360988 (=> res!905193 e!772116)))

(assert (=> b!1360988 (= res!905193 (= (h!32975 lt!599994) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1360989 () Bool)

(assert (=> b!1360989 (= e!772116 (contains!9479 (t!46449 lt!599994) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145759 res!905192) b!1360988))

(assert (= (and b!1360988 (not res!905193)) b!1360989))

(declare-fun m!1246185 () Bool)

(assert (=> d!145759 m!1246185))

(declare-fun m!1246190 () Bool)

(assert (=> d!145759 m!1246190))

(declare-fun m!1246195 () Bool)

(assert (=> b!1360989 m!1246195))

(assert (=> b!1360847 d!145759))

(declare-fun d!145769 () Bool)

(assert (=> d!145769 (= ($colon$colon!884 acc!759 (select (arr!44729 a!3742) from!3120)) (Cons!31766 (select (arr!44729 a!3742) from!3120) acc!759))))

(assert (=> b!1360848 d!145769))

(declare-fun d!145771 () Bool)

(declare-fun res!905206 () Bool)

(declare-fun e!772129 () Bool)

(assert (=> d!145771 (=> res!905206 e!772129)))

(assert (=> d!145771 (= res!905206 (is-Nil!31767 acc!759))))

(assert (=> d!145771 (= (noDuplicate!2336 acc!759) e!772129)))

(declare-fun b!1361002 () Bool)

(declare-fun e!772130 () Bool)

(assert (=> b!1361002 (= e!772129 e!772130)))

(declare-fun res!905207 () Bool)

(assert (=> b!1361002 (=> (not res!905207) (not e!772130))))

(assert (=> b!1361002 (= res!905207 (not (contains!9479 (t!46449 acc!759) (h!32975 acc!759))))))

(declare-fun b!1361003 () Bool)

(assert (=> b!1361003 (= e!772130 (noDuplicate!2336 (t!46449 acc!759)))))

(assert (= (and d!145771 (not res!905206)) b!1361002))

(assert (= (and b!1361002 res!905207) b!1361003))

(declare-fun m!1246197 () Bool)

(assert (=> b!1361002 m!1246197))

(declare-fun m!1246199 () Bool)

(assert (=> b!1361003 m!1246199))

(assert (=> b!1360846 d!145771))

(declare-fun d!145773 () Bool)

(declare-fun lt!600044 () Bool)

(assert (=> d!145773 (= lt!600044 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!695 acc!759)))))

(declare-fun e!772137 () Bool)

(assert (=> d!145773 (= lt!600044 e!772137)))

(declare-fun res!905214 () Bool)

(assert (=> d!145773 (=> (not res!905214) (not e!772137))))

(assert (=> d!145773 (= res!905214 (is-Cons!31766 acc!759))))

(assert (=> d!145773 (= (contains!9479 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000) lt!600044)))

(declare-fun b!1361008 () Bool)

(declare-fun e!772138 () Bool)

(assert (=> b!1361008 (= e!772137 e!772138)))

(declare-fun res!905215 () Bool)

(assert (=> b!1361008 (=> res!905215 e!772138)))

(assert (=> b!1361008 (= res!905215 (= (h!32975 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1361009 () Bool)

(assert (=> b!1361009 (= e!772138 (contains!9479 (t!46449 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145773 res!905214) b!1361008))

(assert (= (and b!1361008 (not res!905215)) b!1361009))

(declare-fun m!1246201 () Bool)

(assert (=> d!145773 m!1246201))

(declare-fun m!1246203 () Bool)

(assert (=> d!145773 m!1246203))

(declare-fun m!1246205 () Bool)

(assert (=> b!1361009 m!1246205))

(assert (=> b!1360850 d!145773))

(declare-fun d!145775 () Bool)

(assert (=> d!145775 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!600047 () Unit!44847)

(declare-fun choose!80 (array!92583 List!31770 List!31770 (_ BitVec 32)) Unit!44847)

(assert (=> d!145775 (= lt!600047 (choose!80 a!3742 ($colon$colon!884 acc!759 (select (arr!44729 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> d!145775 (bvslt (size!45279 a!3742) #b01111111111111111111111111111111)))

(assert (=> d!145775 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!884 acc!759 (select (arr!44729 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)) lt!600047)))

(declare-fun bs!39028 () Bool)

(assert (= bs!39028 d!145775))

(assert (=> bs!39028 m!1246069))

(assert (=> bs!39028 m!1246065))

(declare-fun m!1246219 () Bool)

(assert (=> bs!39028 m!1246219))

(assert (=> b!1360839 d!145775))

(declare-fun b!1361046 () Bool)

(declare-fun e!772167 () Bool)

(declare-fun e!772168 () Bool)

(assert (=> b!1361046 (= e!772167 e!772168)))

(declare-fun res!905240 () Bool)

(assert (=> b!1361046 (=> res!905240 e!772168)))

(declare-fun e!772169 () Bool)

(assert (=> b!1361046 (= res!905240 e!772169)))

(declare-fun res!905241 () Bool)

(assert (=> b!1361046 (=> (not res!905241) (not e!772169))))

(assert (=> b!1361046 (= res!905241 (= (h!32975 acc!759) (h!32975 acc!759)))))

(declare-fun b!1361045 () Bool)

(declare-fun e!772170 () Bool)

(assert (=> b!1361045 (= e!772170 e!772167)))

(declare-fun res!905239 () Bool)

(assert (=> b!1361045 (=> (not res!905239) (not e!772167))))

(assert (=> b!1361045 (= res!905239 (is-Cons!31766 acc!759))))

(declare-fun b!1361048 () Bool)

(assert (=> b!1361048 (= e!772168 (subseq!881 acc!759 (t!46449 acc!759)))))

(declare-fun b!1361047 () Bool)

(assert (=> b!1361047 (= e!772169 (subseq!881 (t!46449 acc!759) (t!46449 acc!759)))))

(declare-fun d!145781 () Bool)

(declare-fun res!905242 () Bool)

(assert (=> d!145781 (=> res!905242 e!772170)))

(assert (=> d!145781 (= res!905242 (is-Nil!31767 acc!759))))

(assert (=> d!145781 (= (subseq!881 acc!759 acc!759) e!772170)))

(assert (= (and d!145781 (not res!905242)) b!1361045))

(assert (= (and b!1361045 res!905239) b!1361046))

(assert (= (and b!1361046 res!905241) b!1361047))

(assert (= (and b!1361046 (not res!905240)) b!1361048))

(declare-fun m!1246243 () Bool)

(assert (=> b!1361048 m!1246243))

(declare-fun m!1246245 () Bool)

(assert (=> b!1361047 m!1246245))

(assert (=> b!1360839 d!145781))

(declare-fun e!772195 () Bool)

(declare-fun b!1361076 () Bool)

(assert (=> b!1361076 (= e!772195 (contains!9479 acc!759 (select (arr!44729 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1361077 () Bool)

(declare-fun e!772198 () Bool)

(declare-fun call!65354 () Bool)

(assert (=> b!1361077 (= e!772198 call!65354)))

(declare-fun b!1361078 () Bool)

(declare-fun e!772197 () Bool)

(assert (=> b!1361078 (= e!772197 e!772198)))

(declare-fun c!127346 () Bool)

(assert (=> b!1361078 (= c!127346 (validKeyInArray!0 (select (arr!44729 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1361079 () Bool)

(assert (=> b!1361079 (= e!772198 call!65354)))

(declare-fun d!145793 () Bool)

(declare-fun res!905265 () Bool)

(declare-fun e!772196 () Bool)

(assert (=> d!145793 (=> res!905265 e!772196)))

(assert (=> d!145793 (= res!905265 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45279 a!3742)))))

(assert (=> d!145793 (= (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759) e!772196)))

(declare-fun bm!65351 () Bool)

(assert (=> bm!65351 (= call!65354 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120 #b00000000000000000000000000000001) (ite c!127346 (Cons!31766 (select (arr!44729 a!3742) (bvadd #b00000000000000000000000000000001 from!3120)) acc!759) acc!759)))))

(declare-fun b!1361080 () Bool)

(assert (=> b!1361080 (= e!772196 e!772197)))

(declare-fun res!905264 () Bool)

(assert (=> b!1361080 (=> (not res!905264) (not e!772197))))

(assert (=> b!1361080 (= res!905264 (not e!772195))))

(declare-fun res!905266 () Bool)

(assert (=> b!1361080 (=> (not res!905266) (not e!772195))))

(assert (=> b!1361080 (= res!905266 (validKeyInArray!0 (select (arr!44729 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(assert (= (and d!145793 (not res!905265)) b!1361080))

(assert (= (and b!1361080 res!905266) b!1361076))

(assert (= (and b!1361080 res!905264) b!1361078))

(assert (= (and b!1361078 c!127346) b!1361077))

(assert (= (and b!1361078 (not c!127346)) b!1361079))

(assert (= (or b!1361077 b!1361079) bm!65351))

(declare-fun m!1246259 () Bool)

(assert (=> b!1361076 m!1246259))

(assert (=> b!1361076 m!1246259))

(declare-fun m!1246261 () Bool)

(assert (=> b!1361076 m!1246261))

(assert (=> b!1361078 m!1246259))

(assert (=> b!1361078 m!1246259))

(declare-fun m!1246265 () Bool)

(assert (=> b!1361078 m!1246265))

(assert (=> bm!65351 m!1246259))

(declare-fun m!1246267 () Bool)

(assert (=> bm!65351 m!1246267))

(assert (=> b!1361080 m!1246259))

(assert (=> b!1361080 m!1246259))

(assert (=> b!1361080 m!1246265))

(assert (=> b!1360839 d!145793))

(assert (=> b!1360839 d!145769))

(declare-fun d!145803 () Bool)

(assert (=> d!145803 (subseq!881 acc!759 acc!759)))

(declare-fun lt!600061 () Unit!44847)

(declare-fun choose!36 (List!31770) Unit!44847)

(assert (=> d!145803 (= lt!600061 (choose!36 acc!759))))

(assert (=> d!145803 (= (lemmaListSubSeqRefl!0 acc!759) lt!600061)))

(declare-fun bs!39032 () Bool)

(assert (= bs!39032 d!145803))

(assert (=> bs!39032 m!1246071))

(declare-fun m!1246273 () Bool)

(assert (=> bs!39032 m!1246273))

(assert (=> b!1360839 d!145803))

(declare-fun d!145809 () Bool)

(declare-fun lt!600062 () Bool)

(assert (=> d!145809 (= lt!600062 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!695 acc!759)))))

(declare-fun e!772201 () Bool)

(assert (=> d!145809 (= lt!600062 e!772201)))

(declare-fun res!905269 () Bool)

(assert (=> d!145809 (=> (not res!905269) (not e!772201))))

(assert (=> d!145809 (= res!905269 (is-Cons!31766 acc!759))))

(assert (=> d!145809 (= (contains!9479 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000) lt!600062)))

(declare-fun b!1361083 () Bool)

(declare-fun e!772202 () Bool)

(assert (=> b!1361083 (= e!772201 e!772202)))

(declare-fun res!905270 () Bool)

(assert (=> b!1361083 (=> res!905270 e!772202)))

(assert (=> b!1361083 (= res!905270 (= (h!32975 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1361084 () Bool)

(assert (=> b!1361084 (= e!772202 (contains!9479 (t!46449 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145809 res!905269) b!1361083))

(assert (= (and b!1361083 (not res!905270)) b!1361084))

(assert (=> d!145809 m!1246201))

(declare-fun m!1246275 () Bool)

(assert (=> d!145809 m!1246275))

(declare-fun m!1246277 () Bool)

(assert (=> b!1361084 m!1246277))

(assert (=> b!1360840 d!145809))

(declare-fun b!1361085 () Bool)

(declare-fun e!772203 () Bool)

(assert (=> b!1361085 (= e!772203 (contains!9479 Nil!31767 (select (arr!44729 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1361086 () Bool)

(declare-fun e!772206 () Bool)

(declare-fun call!65355 () Bool)

(assert (=> b!1361086 (= e!772206 call!65355)))

(declare-fun b!1361087 () Bool)

(declare-fun e!772205 () Bool)

(assert (=> b!1361087 (= e!772205 e!772206)))

(declare-fun c!127347 () Bool)

(assert (=> b!1361087 (= c!127347 (validKeyInArray!0 (select (arr!44729 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1361088 () Bool)

(assert (=> b!1361088 (= e!772206 call!65355)))

(declare-fun d!145811 () Bool)

(declare-fun res!905272 () Bool)

(declare-fun e!772204 () Bool)

(assert (=> d!145811 (=> res!905272 e!772204)))

(assert (=> d!145811 (= res!905272 (bvsge #b00000000000000000000000000000000 (size!45279 a!3742)))))

(assert (=> d!145811 (= (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31767) e!772204)))

(declare-fun bm!65352 () Bool)

(assert (=> bm!65352 (= call!65355 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!127347 (Cons!31766 (select (arr!44729 a!3742) #b00000000000000000000000000000000) Nil!31767) Nil!31767)))))

(declare-fun b!1361089 () Bool)

(assert (=> b!1361089 (= e!772204 e!772205)))

(declare-fun res!905271 () Bool)

(assert (=> b!1361089 (=> (not res!905271) (not e!772205))))

(assert (=> b!1361089 (= res!905271 (not e!772203))))

(declare-fun res!905273 () Bool)

(assert (=> b!1361089 (=> (not res!905273) (not e!772203))))

(assert (=> b!1361089 (= res!905273 (validKeyInArray!0 (select (arr!44729 a!3742) #b00000000000000000000000000000000)))))

(assert (= (and d!145811 (not res!905272)) b!1361089))

(assert (= (and b!1361089 res!905273) b!1361085))

(assert (= (and b!1361089 res!905271) b!1361087))

(assert (= (and b!1361087 c!127347) b!1361086))

(assert (= (and b!1361087 (not c!127347)) b!1361088))

(assert (= (or b!1361086 b!1361088) bm!65352))

(declare-fun m!1246279 () Bool)

(assert (=> b!1361085 m!1246279))

(assert (=> b!1361085 m!1246279))

(declare-fun m!1246281 () Bool)

(assert (=> b!1361085 m!1246281))

(assert (=> b!1361087 m!1246279))

(assert (=> b!1361087 m!1246279))

(declare-fun m!1246283 () Bool)

(assert (=> b!1361087 m!1246283))

(assert (=> bm!65352 m!1246279))

(declare-fun m!1246285 () Bool)

(assert (=> bm!65352 m!1246285))

(assert (=> b!1361089 m!1246279))

(assert (=> b!1361089 m!1246279))

(assert (=> b!1361089 m!1246283))

(assert (=> b!1360838 d!145811))

(declare-fun d!145813 () Bool)

(assert (=> d!145813 (= (array_inv!33757 a!3742) (bvsge (size!45279 a!3742) #b00000000000000000000000000000000))))

(assert (=> start!114746 d!145813))

(declare-fun d!145815 () Bool)

(declare-fun res!905280 () Bool)

(declare-fun e!772213 () Bool)

(assert (=> d!145815 (=> res!905280 e!772213)))

(assert (=> d!145815 (= res!905280 (is-Nil!31767 lt!599994))))

(assert (=> d!145815 (= (noDuplicate!2336 lt!599994) e!772213)))

(declare-fun b!1361096 () Bool)

(declare-fun e!772214 () Bool)

(assert (=> b!1361096 (= e!772213 e!772214)))

(declare-fun res!905281 () Bool)

(assert (=> b!1361096 (=> (not res!905281) (not e!772214))))

(assert (=> b!1361096 (= res!905281 (not (contains!9479 (t!46449 lt!599994) (h!32975 lt!599994))))))

