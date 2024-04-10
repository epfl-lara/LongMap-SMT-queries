; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103290 () Bool)

(assert start!103290)

(declare-fun b!1239556 () Bool)

(declare-fun res!826980 () Bool)

(declare-fun e!702454 () Bool)

(assert (=> b!1239556 (=> (not res!826980) (not e!702454))))

(declare-datatypes ((List!27310 0))(
  ( (Nil!27307) (Cons!27306 (h!28515 (_ BitVec 64)) (t!40773 List!27310)) )
))
(declare-fun acc!846 () List!27310)

(declare-fun contains!7372 (List!27310 (_ BitVec 64)) Bool)

(assert (=> b!1239556 (= res!826980 (not (contains!7372 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1239557 () Bool)

(declare-fun res!826979 () Bool)

(assert (=> b!1239557 (=> (not res!826979) (not e!702454))))

(declare-datatypes ((array!79874 0))(
  ( (array!79875 (arr!38537 (Array (_ BitVec 32) (_ BitVec 64))) (size!39073 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79874)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79874 (_ BitVec 32) List!27310) Bool)

(assert (=> b!1239557 (= res!826979 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1239558 () Bool)

(declare-fun e!702456 () Bool)

(assert (=> b!1239558 (= e!702454 e!702456)))

(declare-fun res!826976 () Bool)

(assert (=> b!1239558 (=> (not res!826976) (not e!702456))))

(assert (=> b!1239558 (= res!826976 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!39073 a!3835))))))

(declare-datatypes ((Unit!41192 0))(
  ( (Unit!41193) )
))
(declare-fun lt!561767 () Unit!41192)

(declare-fun e!702453 () Unit!41192)

(assert (=> b!1239558 (= lt!561767 e!702453)))

(declare-fun c!121150 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1239558 (= c!121150 (validKeyInArray!0 (select (arr!38537 a!3835) from!3213)))))

(declare-fun b!1239559 () Bool)

(declare-fun res!826984 () Bool)

(assert (=> b!1239559 (=> (not res!826984) (not e!702454))))

(declare-fun noDuplicate!1969 (List!27310) Bool)

(assert (=> b!1239559 (= res!826984 (noDuplicate!1969 acc!846))))

(declare-fun b!1239560 () Bool)

(declare-fun Unit!41194 () Unit!41192)

(assert (=> b!1239560 (= e!702453 Unit!41194)))

(declare-fun b!1239561 () Bool)

(declare-fun k!2925 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79874 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1239561 (= e!702456 (not (not (arrayContainsKey!0 a!3835 k!2925 from!3213))))))

(assert (=> b!1239561 (not (arrayContainsKey!0 a!3835 k!2925 (bvadd #b00000000000000000000000000000001 from!3213)))))

(declare-fun lt!561766 () Unit!41192)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!79874 (_ BitVec 32) (_ BitVec 64) List!27310) Unit!41192)

(assert (=> b!1239561 (= lt!561766 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) k!2925 acc!846))))

(declare-fun res!826981 () Bool)

(assert (=> start!103290 (=> (not res!826981) (not e!702454))))

(assert (=> start!103290 (= res!826981 (and (bvslt (size!39073 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39073 a!3835))))))

(assert (=> start!103290 e!702454))

(declare-fun array_inv!29385 (array!79874) Bool)

(assert (=> start!103290 (array_inv!29385 a!3835)))

(assert (=> start!103290 true))

(declare-fun b!1239562 () Bool)

(declare-fun res!826978 () Bool)

(assert (=> b!1239562 (=> (not res!826978) (not e!702454))))

(assert (=> b!1239562 (= res!826978 (not (contains!7372 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1239563 () Bool)

(declare-fun res!826982 () Bool)

(assert (=> b!1239563 (=> (not res!826982) (not e!702456))))

(assert (=> b!1239563 (= res!826982 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(declare-fun b!1239564 () Bool)

(declare-fun res!826977 () Bool)

(assert (=> b!1239564 (=> (not res!826977) (not e!702454))))

(assert (=> b!1239564 (= res!826977 (not (= from!3213 (bvsub (size!39073 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1239565 () Bool)

(declare-fun lt!561765 () Unit!41192)

(assert (=> b!1239565 (= e!702453 lt!561765)))

(declare-fun lt!561768 () List!27310)

(assert (=> b!1239565 (= lt!561768 (Cons!27306 (select (arr!38537 a!3835) from!3213) acc!846))))

(declare-fun lt!561770 () Unit!41192)

(declare-fun lemmaListSubSeqRefl!0 (List!27310) Unit!41192)

(assert (=> b!1239565 (= lt!561770 (lemmaListSubSeqRefl!0 lt!561768))))

(declare-fun subseq!626 (List!27310 List!27310) Bool)

(assert (=> b!1239565 (subseq!626 lt!561768 lt!561768)))

(declare-fun lt!561769 () Unit!41192)

(declare-fun subseqTail!113 (List!27310 List!27310) Unit!41192)

(assert (=> b!1239565 (= lt!561769 (subseqTail!113 lt!561768 lt!561768))))

(assert (=> b!1239565 (subseq!626 acc!846 lt!561768)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79874 List!27310 List!27310 (_ BitVec 32)) Unit!41192)

(assert (=> b!1239565 (= lt!561765 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!561768 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> b!1239565 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1239566 () Bool)

(declare-fun res!826983 () Bool)

(assert (=> b!1239566 (=> (not res!826983) (not e!702454))))

(assert (=> b!1239566 (= res!826983 (contains!7372 acc!846 k!2925))))

(assert (= (and start!103290 res!826981) b!1239559))

(assert (= (and b!1239559 res!826984) b!1239562))

(assert (= (and b!1239562 res!826978) b!1239556))

(assert (= (and b!1239556 res!826980) b!1239557))

(assert (= (and b!1239557 res!826979) b!1239566))

(assert (= (and b!1239566 res!826983) b!1239564))

(assert (= (and b!1239564 res!826977) b!1239558))

(assert (= (and b!1239558 c!121150) b!1239565))

(assert (= (and b!1239558 (not c!121150)) b!1239560))

(assert (= (and b!1239558 res!826976) b!1239563))

(assert (= (and b!1239563 res!826982) b!1239561))

(declare-fun m!1142983 () Bool)

(assert (=> b!1239559 m!1142983))

(declare-fun m!1142985 () Bool)

(assert (=> b!1239563 m!1142985))

(declare-fun m!1142987 () Bool)

(assert (=> b!1239561 m!1142987))

(declare-fun m!1142989 () Bool)

(assert (=> b!1239561 m!1142989))

(declare-fun m!1142991 () Bool)

(assert (=> b!1239561 m!1142991))

(declare-fun m!1142993 () Bool)

(assert (=> b!1239558 m!1142993))

(assert (=> b!1239558 m!1142993))

(declare-fun m!1142995 () Bool)

(assert (=> b!1239558 m!1142995))

(declare-fun m!1142997 () Bool)

(assert (=> b!1239565 m!1142997))

(assert (=> b!1239565 m!1142985))

(declare-fun m!1142999 () Bool)

(assert (=> b!1239565 m!1142999))

(assert (=> b!1239565 m!1142993))

(declare-fun m!1143001 () Bool)

(assert (=> b!1239565 m!1143001))

(declare-fun m!1143003 () Bool)

(assert (=> b!1239565 m!1143003))

(declare-fun m!1143005 () Bool)

(assert (=> b!1239565 m!1143005))

(declare-fun m!1143007 () Bool)

(assert (=> b!1239562 m!1143007))

(declare-fun m!1143009 () Bool)

(assert (=> start!103290 m!1143009))

(declare-fun m!1143011 () Bool)

(assert (=> b!1239556 m!1143011))

(declare-fun m!1143013 () Bool)

(assert (=> b!1239557 m!1143013))

(declare-fun m!1143015 () Bool)

(assert (=> b!1239566 m!1143015))

(push 1)

(assert (not b!1239557))

(assert (not b!1239562))

(assert (not b!1239565))

(assert (not b!1239559))

(assert (not b!1239558))

(assert (not start!103290))

(assert (not b!1239566))

(assert (not b!1239563))

(assert (not b!1239561))

(assert (not b!1239556))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!136057 () Bool)

(declare-fun lt!561816 () Bool)

(declare-fun content!597 (List!27310) (Set (_ BitVec 64)))

(assert (=> d!136057 (= lt!561816 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!597 acc!846)))))

(declare-fun e!702518 () Bool)

(assert (=> d!136057 (= lt!561816 e!702518)))

(declare-fun res!827074 () Bool)

(assert (=> d!136057 (=> (not res!827074) (not e!702518))))

(assert (=> d!136057 (= res!827074 (is-Cons!27306 acc!846))))

(assert (=> d!136057 (= (contains!7372 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000) lt!561816)))

(declare-fun b!1239671 () Bool)

(declare-fun e!702517 () Bool)

(assert (=> b!1239671 (= e!702518 e!702517)))

(declare-fun res!827073 () Bool)

(assert (=> b!1239671 (=> res!827073 e!702517)))

(assert (=> b!1239671 (= res!827073 (= (h!28515 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1239672 () Bool)

(assert (=> b!1239672 (= e!702517 (contains!7372 (t!40773 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!136057 res!827074) b!1239671))

(assert (= (and b!1239671 (not res!827073)) b!1239672))

(declare-fun m!1143109 () Bool)

(assert (=> d!136057 m!1143109))

(declare-fun m!1143111 () Bool)

(assert (=> d!136057 m!1143111))

(declare-fun m!1143113 () Bool)

(assert (=> b!1239672 m!1143113))

(assert (=> b!1239562 d!136057))

(declare-fun d!136065 () Bool)

(declare-fun lt!561819 () Bool)

(assert (=> d!136065 (= lt!561819 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!597 acc!846)))))

(declare-fun e!702520 () Bool)

(assert (=> d!136065 (= lt!561819 e!702520)))

(declare-fun res!827076 () Bool)

(assert (=> d!136065 (=> (not res!827076) (not e!702520))))

(assert (=> d!136065 (= res!827076 (is-Cons!27306 acc!846))))

(assert (=> d!136065 (= (contains!7372 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000) lt!561819)))

(declare-fun b!1239673 () Bool)

(declare-fun e!702519 () Bool)

(assert (=> b!1239673 (= e!702520 e!702519)))

(declare-fun res!827075 () Bool)

(assert (=> b!1239673 (=> res!827075 e!702519)))

(assert (=> b!1239673 (= res!827075 (= (h!28515 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1239674 () Bool)

(assert (=> b!1239674 (= e!702519 (contains!7372 (t!40773 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!136065 res!827076) b!1239673))

(assert (= (and b!1239673 (not res!827075)) b!1239674))

(assert (=> d!136065 m!1143109))

(declare-fun m!1143115 () Bool)

(assert (=> d!136065 m!1143115))

(declare-fun m!1143119 () Bool)

(assert (=> b!1239674 m!1143119))

(assert (=> b!1239556 d!136065))

(declare-fun d!136069 () Bool)

(declare-fun res!827089 () Bool)

(declare-fun e!702535 () Bool)

(assert (=> d!136069 (=> res!827089 e!702535)))

(assert (=> d!136069 (= res!827089 (= (select (arr!38537 a!3835) from!3213) k!2925))))

(assert (=> d!136069 (= (arrayContainsKey!0 a!3835 k!2925 from!3213) e!702535)))

(declare-fun b!1239691 () Bool)

(declare-fun e!702536 () Bool)

(assert (=> b!1239691 (= e!702535 e!702536)))

(declare-fun res!827090 () Bool)

(assert (=> b!1239691 (=> (not res!827090) (not e!702536))))

(assert (=> b!1239691 (= res!827090 (bvslt (bvadd from!3213 #b00000000000000000000000000000001) (size!39073 a!3835)))))

(declare-fun b!1239692 () Bool)

(assert (=> b!1239692 (= e!702536 (arrayContainsKey!0 a!3835 k!2925 (bvadd from!3213 #b00000000000000000000000000000001)))))

(assert (= (and d!136069 (not res!827089)) b!1239691))

(assert (= (and b!1239691 res!827090) b!1239692))

(assert (=> d!136069 m!1142993))

(declare-fun m!1143135 () Bool)

(assert (=> b!1239692 m!1143135))

(assert (=> b!1239561 d!136069))

(declare-fun d!136077 () Bool)

(declare-fun res!827093 () Bool)

(declare-fun e!702539 () Bool)

(assert (=> d!136077 (=> res!827093 e!702539)))

(assert (=> d!136077 (= res!827093 (= (select (arr!38537 a!3835) (bvadd #b00000000000000000000000000000001 from!3213)) k!2925))))

(assert (=> d!136077 (= (arrayContainsKey!0 a!3835 k!2925 (bvadd #b00000000000000000000000000000001 from!3213)) e!702539)))

(declare-fun b!1239697 () Bool)

(declare-fun e!702540 () Bool)

(assert (=> b!1239697 (= e!702539 e!702540)))

(declare-fun res!827094 () Bool)

(assert (=> b!1239697 (=> (not res!827094) (not e!702540))))

(assert (=> b!1239697 (= res!827094 (bvslt (bvadd #b00000000000000000000000000000001 from!3213 #b00000000000000000000000000000001) (size!39073 a!3835)))))

(declare-fun b!1239698 () Bool)

(assert (=> b!1239698 (= e!702540 (arrayContainsKey!0 a!3835 k!2925 (bvadd #b00000000000000000000000000000001 from!3213 #b00000000000000000000000000000001)))))

(assert (= (and d!136077 (not res!827093)) b!1239697))

(assert (= (and b!1239697 res!827094) b!1239698))

(declare-fun m!1143137 () Bool)

(assert (=> d!136077 m!1143137))

(declare-fun m!1143139 () Bool)

(assert (=> b!1239698 m!1143139))

(assert (=> b!1239561 d!136077))

(declare-fun d!136081 () Bool)

(assert (=> d!136081 (not (arrayContainsKey!0 a!3835 k!2925 (bvadd #b00000000000000000000000000000001 from!3213)))))

(declare-fun lt!561829 () Unit!41192)

(declare-fun choose!68 (array!79874 (_ BitVec 32) (_ BitVec 64) List!27310) Unit!41192)

(assert (=> d!136081 (= lt!561829 (choose!68 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) k!2925 acc!846))))

(assert (=> d!136081 (bvslt (size!39073 a!3835) #b01111111111111111111111111111111)))

(assert (=> d!136081 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) k!2925 acc!846) lt!561829)))

(declare-fun bs!34859 () Bool)

(assert (= bs!34859 d!136081))

(assert (=> bs!34859 m!1142989))

(declare-fun m!1143143 () Bool)

(assert (=> bs!34859 m!1143143))

(assert (=> b!1239561 d!136081))

(declare-fun d!136085 () Bool)

(declare-fun lt!561831 () Bool)

(assert (=> d!136085 (= lt!561831 (set.member k!2925 (content!597 acc!846)))))

(declare-fun e!702552 () Bool)

(assert (=> d!136085 (= lt!561831 e!702552)))

(declare-fun res!827097 () Bool)

(assert (=> d!136085 (=> (not res!827097) (not e!702552))))

(assert (=> d!136085 (= res!827097 (is-Cons!27306 acc!846))))

(assert (=> d!136085 (= (contains!7372 acc!846 k!2925) lt!561831)))

(declare-fun b!1239716 () Bool)

(declare-fun e!702551 () Bool)

(assert (=> b!1239716 (= e!702552 e!702551)))

(declare-fun res!827096 () Bool)

(assert (=> b!1239716 (=> res!827096 e!702551)))

(assert (=> b!1239716 (= res!827096 (= (h!28515 acc!846) k!2925))))

(declare-fun b!1239717 () Bool)

(assert (=> b!1239717 (= e!702551 (contains!7372 (t!40773 acc!846) k!2925))))

(assert (= (and d!136085 res!827097) b!1239716))

(assert (= (and b!1239716 (not res!827096)) b!1239717))

(assert (=> d!136085 m!1143109))

(declare-fun m!1143157 () Bool)

(assert (=> d!136085 m!1143157))

(declare-fun m!1143159 () Bool)

(assert (=> b!1239717 m!1143159))

(assert (=> b!1239566 d!136085))

(declare-fun b!1239757 () Bool)

(declare-fun e!702583 () Bool)

(assert (=> b!1239757 (= e!702583 (contains!7372 acc!846 (select (arr!38537 a!3835) (bvadd #b00000000000000000000000000000001 from!3213))))))

(declare-fun b!1239759 () Bool)

(declare-fun e!702582 () Bool)

(declare-fun e!702581 () Bool)

(assert (=> b!1239759 (= e!702582 e!702581)))

(declare-fun res!827116 () Bool)

(assert (=> b!1239759 (=> (not res!827116) (not e!702581))))

(assert (=> b!1239759 (= res!827116 (not e!702583))))

(declare-fun res!827115 () Bool)

(assert (=> b!1239759 (=> (not res!827115) (not e!702583))))

(assert (=> b!1239759 (= res!827115 (validKeyInArray!0 (select (arr!38537 a!3835) (bvadd #b00000000000000000000000000000001 from!3213))))))

(declare-fun bm!61108 () Bool)

(declare-fun c!121181 () Bool)

(declare-fun call!61111 () Bool)

(assert (=> bm!61108 (= call!61111 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213 #b00000000000000000000000000000001) (ite c!121181 (Cons!27306 (select (arr!38537 a!3835) (bvadd #b00000000000000000000000000000001 from!3213)) acc!846) acc!846)))))

(declare-fun b!1239760 () Bool)

(declare-fun e!702584 () Bool)

(assert (=> b!1239760 (= e!702584 call!61111)))

(declare-fun b!1239761 () Bool)

(assert (=> b!1239761 (= e!702581 e!702584)))

(assert (=> b!1239761 (= c!121181 (validKeyInArray!0 (select (arr!38537 a!3835) (bvadd #b00000000000000000000000000000001 from!3213))))))

(declare-fun d!136089 () Bool)

(declare-fun res!827117 () Bool)

(assert (=> d!136089 (=> res!827117 e!702582)))

(assert (=> d!136089 (= res!827117 (bvsge (bvadd #b00000000000000000000000000000001 from!3213) (size!39073 a!3835)))))

(assert (=> d!136089 (= (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846) e!702582)))

(declare-fun b!1239758 () Bool)

(assert (=> b!1239758 (= e!702584 call!61111)))

(assert (= (and d!136089 (not res!827117)) b!1239759))

(assert (= (and b!1239759 res!827115) b!1239757))

(assert (= (and b!1239759 res!827116) b!1239761))

(assert (= (and b!1239761 c!121181) b!1239758))

(assert (= (and b!1239761 (not c!121181)) b!1239760))

(assert (= (or b!1239758 b!1239760) bm!61108))

(assert (=> b!1239757 m!1143137))

(assert (=> b!1239757 m!1143137))

(declare-fun m!1143169 () Bool)

(assert (=> b!1239757 m!1143169))

(assert (=> b!1239759 m!1143137))

(assert (=> b!1239759 m!1143137))

(declare-fun m!1143171 () Bool)

(assert (=> b!1239759 m!1143171))

(assert (=> bm!61108 m!1143137))

(declare-fun m!1143173 () Bool)

(assert (=> bm!61108 m!1143173))

(assert (=> b!1239761 m!1143137))

(assert (=> b!1239761 m!1143137))

(assert (=> b!1239761 m!1143171))

(assert (=> b!1239565 d!136089))

(declare-fun d!136097 () Bool)

(assert (=> d!136097 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun lt!561845 () Unit!41192)

(declare-fun choose!80 (array!79874 List!27310 List!27310 (_ BitVec 32)) Unit!41192)

(assert (=> d!136097 (= lt!561845 (choose!80 a!3835 lt!561768 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> d!136097 (bvslt (size!39073 a!3835) #b01111111111111111111111111111111)))

(assert (=> d!136097 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!561768 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)) lt!561845)))

(declare-fun bs!34862 () Bool)

(assert (= bs!34862 d!136097))

(assert (=> bs!34862 m!1142985))

(declare-fun m!1143189 () Bool)

(assert (=> bs!34862 m!1143189))

(assert (=> b!1239565 d!136097))

(declare-fun b!1239842 () Bool)

(declare-fun e!702657 () Unit!41192)

(declare-fun Unit!41205 () Unit!41192)

(assert (=> b!1239842 (= e!702657 Unit!41205)))

(declare-fun b!1239843 () Bool)

(declare-fun c!121192 () Bool)

(declare-fun isEmpty!1020 (List!27310) Bool)

(assert (=> b!1239843 (= c!121192 (not (isEmpty!1020 (t!40773 lt!561768))))))

(declare-fun e!702658 () Unit!41192)

(assert (=> b!1239843 (= e!702658 e!702657)))

(declare-fun b!1239844 () Bool)

(declare-fun e!702656 () Unit!41192)

(assert (=> b!1239844 (= e!702656 e!702658)))

(declare-fun c!121194 () Bool)

(assert (=> b!1239844 (= c!121194 (subseq!626 lt!561768 (t!40773 lt!561768)))))

(declare-fun b!1239845 () Bool)

(declare-fun call!61116 () Unit!41192)

(assert (=> b!1239845 (= e!702658 call!61116)))

(declare-fun b!1239846 () Bool)

(declare-fun e!702655 () Bool)

(assert (=> b!1239846 (= e!702655 (subseq!626 lt!561768 lt!561768))))

(declare-fun bm!61113 () Bool)

(assert (=> bm!61113 (= call!61116 (subseqTail!113 (ite c!121194 lt!561768 (t!40773 lt!561768)) (t!40773 lt!561768)))))

(declare-fun d!136101 () Bool)

(declare-fun tail!172 (List!27310) List!27310)

(assert (=> d!136101 (subseq!626 (tail!172 lt!561768) lt!561768)))

(declare-fun lt!561854 () Unit!41192)

(assert (=> d!136101 (= lt!561854 e!702656)))

(declare-fun c!121193 () Bool)

(assert (=> d!136101 (= c!121193 (and (is-Cons!27306 lt!561768) (is-Cons!27306 lt!561768)))))

(assert (=> d!136101 e!702655))

(declare-fun res!827178 () Bool)

(assert (=> d!136101 (=> (not res!827178) (not e!702655))))

(assert (=> d!136101 (= res!827178 (not (isEmpty!1020 lt!561768)))))

(assert (=> d!136101 (= (subseqTail!113 lt!561768 lt!561768) lt!561854)))

(declare-fun b!1239847 () Bool)

(assert (=> b!1239847 (= e!702657 call!61116)))

(declare-fun b!1239848 () Bool)

(declare-fun Unit!41206 () Unit!41192)

(assert (=> b!1239848 (= e!702656 Unit!41206)))

(assert (= (and d!136101 res!827178) b!1239846))

(assert (= (and d!136101 c!121193) b!1239844))

(assert (= (and d!136101 (not c!121193)) b!1239848))

(assert (= (and b!1239844 c!121194) b!1239845))

(assert (= (and b!1239844 (not c!121194)) b!1239843))

(assert (= (and b!1239843 c!121192) b!1239847))

(assert (= (and b!1239843 (not c!121192)) b!1239842))

(assert (= (or b!1239845 b!1239847) bm!61113))

(declare-fun m!1143231 () Bool)

(assert (=> b!1239844 m!1143231))

(declare-fun m!1143233 () Bool)

(assert (=> d!136101 m!1143233))

(assert (=> d!136101 m!1143233))

(declare-fun m!1143235 () Bool)

(assert (=> d!136101 m!1143235))

(declare-fun m!1143237 () Bool)

(assert (=> d!136101 m!1143237))

(declare-fun m!1143239 () Bool)

(assert (=> bm!61113 m!1143239))

(declare-fun m!1143241 () Bool)

(assert (=> b!1239843 m!1143241))

(assert (=> b!1239846 m!1143001))

(assert (=> b!1239565 d!136101))

(declare-fun d!136125 () Bool)

(assert (=> d!136125 (subseq!626 lt!561768 lt!561768)))

(declare-fun lt!561857 () Unit!41192)

(declare-fun choose!36 (List!27310) Unit!41192)

(assert (=> d!136125 (= lt!561857 (choose!36 lt!561768))))

(assert (=> d!136125 (= (lemmaListSubSeqRefl!0 lt!561768) lt!561857)))

(declare-fun bs!34864 () Bool)

(assert (= bs!34864 d!136125))

(assert (=> bs!34864 m!1143001))

(declare-fun m!1143243 () Bool)

(assert (=> bs!34864 m!1143243))

(assert (=> b!1239565 d!136125))

(declare-fun b!1239858 () Bool)

(declare-fun e!702670 () Bool)

(declare-fun e!702668 () Bool)

(assert (=> b!1239858 (= e!702670 e!702668)))

(declare-fun res!827188 () Bool)

(assert (=> b!1239858 (=> res!827188 e!702668)))

(declare-fun e!702669 () Bool)

(assert (=> b!1239858 (= res!827188 e!702669)))

(declare-fun res!827189 () Bool)

(assert (=> b!1239858 (=> (not res!827189) (not e!702669))))

(assert (=> b!1239858 (= res!827189 (= (h!28515 lt!561768) (h!28515 lt!561768)))))

(declare-fun b!1239860 () Bool)

(assert (=> b!1239860 (= e!702668 (subseq!626 lt!561768 (t!40773 lt!561768)))))

(declare-fun b!1239859 () Bool)

(assert (=> b!1239859 (= e!702669 (subseq!626 (t!40773 lt!561768) (t!40773 lt!561768)))))

(declare-fun b!1239857 () Bool)

(declare-fun e!702667 () Bool)

(assert (=> b!1239857 (= e!702667 e!702670)))

(declare-fun res!827190 () Bool)

(assert (=> b!1239857 (=> (not res!827190) (not e!702670))))

(assert (=> b!1239857 (= res!827190 (is-Cons!27306 lt!561768))))

(declare-fun d!136127 () Bool)

(declare-fun res!827187 () Bool)

(assert (=> d!136127 (=> res!827187 e!702667)))

(assert (=> d!136127 (= res!827187 (is-Nil!27307 lt!561768))))

(assert (=> d!136127 (= (subseq!626 lt!561768 lt!561768) e!702667)))

(assert (= (and d!136127 (not res!827187)) b!1239857))

(assert (= (and b!1239857 res!827190) b!1239858))

(assert (= (and b!1239858 res!827189) b!1239859))

(assert (= (and b!1239858 (not res!827188)) b!1239860))

(assert (=> b!1239860 m!1143231))

(declare-fun m!1143245 () Bool)

(assert (=> b!1239859 m!1143245))

(assert (=> b!1239565 d!136127))

(declare-fun b!1239862 () Bool)

(declare-fun e!702674 () Bool)

(declare-fun e!702672 () Bool)

(assert (=> b!1239862 (= e!702674 e!702672)))

(declare-fun res!827192 () Bool)

(assert (=> b!1239862 (=> res!827192 e!702672)))

(declare-fun e!702673 () Bool)

(assert (=> b!1239862 (= res!827192 e!702673)))

(declare-fun res!827193 () Bool)

(assert (=> b!1239862 (=> (not res!827193) (not e!702673))))

(assert (=> b!1239862 (= res!827193 (= (h!28515 acc!846) (h!28515 lt!561768)))))

(declare-fun b!1239864 () Bool)

(assert (=> b!1239864 (= e!702672 (subseq!626 acc!846 (t!40773 lt!561768)))))

(declare-fun b!1239863 () Bool)

(assert (=> b!1239863 (= e!702673 (subseq!626 (t!40773 acc!846) (t!40773 lt!561768)))))

(declare-fun b!1239861 () Bool)

(declare-fun e!702671 () Bool)

(assert (=> b!1239861 (= e!702671 e!702674)))

(declare-fun res!827194 () Bool)

(assert (=> b!1239861 (=> (not res!827194) (not e!702674))))

(assert (=> b!1239861 (= res!827194 (is-Cons!27306 lt!561768))))

(declare-fun d!136129 () Bool)

(declare-fun res!827191 () Bool)

(assert (=> d!136129 (=> res!827191 e!702671)))

(assert (=> d!136129 (= res!827191 (is-Nil!27307 acc!846))))

(assert (=> d!136129 (= (subseq!626 acc!846 lt!561768) e!702671)))

(assert (= (and d!136129 (not res!827191)) b!1239861))

(assert (= (and b!1239861 res!827194) b!1239862))

