; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114594 () Bool)

(assert start!114594)

(declare-fun b!1359841 () Bool)

(declare-fun res!904257 () Bool)

(declare-fun e!771529 () Bool)

(assert (=> b!1359841 (=> (not res!904257) (not e!771529))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((array!92539 0))(
  ( (array!92540 (arr!44710 (Array (_ BitVec 32) (_ BitVec 64))) (size!45260 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92539)

(assert (=> b!1359841 (= res!904257 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45260 a!3742)))))

(declare-fun b!1359842 () Bool)

(declare-fun res!904261 () Bool)

(assert (=> b!1359842 (=> (not res!904261) (not e!771529))))

(declare-datatypes ((List!31751 0))(
  ( (Nil!31748) (Cons!31747 (h!32956 (_ BitVec 64)) (t!46424 List!31751)) )
))
(declare-fun acc!759 () List!31751)

(declare-fun contains!9460 (List!31751 (_ BitVec 64)) Bool)

(assert (=> b!1359842 (= res!904261 (not (contains!9460 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1359843 () Bool)

(declare-datatypes ((Unit!44790 0))(
  ( (Unit!44791) )
))
(declare-fun e!771530 () Unit!44790)

(declare-fun Unit!44792 () Unit!44790)

(assert (=> b!1359843 (= e!771530 Unit!44792)))

(declare-fun b!1359844 () Bool)

(declare-fun res!904254 () Bool)

(assert (=> b!1359844 (=> (not res!904254) (not e!771529))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1359844 (= res!904254 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45260 a!3742))))))

(declare-fun b!1359845 () Bool)

(declare-fun res!904255 () Bool)

(assert (=> b!1359845 (=> (not res!904255) (not e!771529))))

(assert (=> b!1359845 (= res!904255 (not (contains!9460 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1359846 () Bool)

(declare-fun res!904252 () Bool)

(assert (=> b!1359846 (=> (not res!904252) (not e!771529))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1359846 (= res!904252 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1359847 () Bool)

(declare-fun res!904253 () Bool)

(assert (=> b!1359847 (=> (not res!904253) (not e!771529))))

(declare-fun arrayNoDuplicates!0 (array!92539 (_ BitVec 32) List!31751) Bool)

(assert (=> b!1359847 (= res!904253 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1359848 () Bool)

(declare-fun res!904259 () Bool)

(declare-fun e!771532 () Bool)

(assert (=> b!1359848 (=> (not res!904259) (not e!771532))))

(assert (=> b!1359848 (= res!904259 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1359850 () Bool)

(declare-fun lt!599734 () Unit!44790)

(assert (=> b!1359850 (= e!771530 lt!599734)))

(declare-fun lt!599733 () Unit!44790)

(declare-fun lemmaListSubSeqRefl!0 (List!31751) Unit!44790)

(assert (=> b!1359850 (= lt!599733 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!862 (List!31751 List!31751) Bool)

(assert (=> b!1359850 (subseq!862 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92539 List!31751 List!31751 (_ BitVec 32)) Unit!44790)

(declare-fun $colon$colon!865 (List!31751 (_ BitVec 64)) List!31751)

(assert (=> b!1359850 (= lt!599734 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!865 acc!759 (select (arr!44710 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1359850 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1359851 () Bool)

(assert (=> b!1359851 (= e!771529 e!771532)))

(declare-fun res!904251 () Bool)

(assert (=> b!1359851 (=> (not res!904251) (not e!771532))))

(assert (=> b!1359851 (= res!904251 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!599732 () Unit!44790)

(assert (=> b!1359851 (= lt!599732 e!771530)))

(declare-fun c!127235 () Bool)

(assert (=> b!1359851 (= c!127235 (validKeyInArray!0 (select (arr!44710 a!3742) from!3120)))))

(declare-fun b!1359852 () Bool)

(declare-fun res!904260 () Bool)

(assert (=> b!1359852 (=> (not res!904260) (not e!771529))))

(declare-fun noDuplicate!2317 (List!31751) Bool)

(assert (=> b!1359852 (= res!904260 (noDuplicate!2317 acc!759))))

(declare-fun b!1359853 () Bool)

(declare-fun lt!599730 () array!92539)

(assert (=> b!1359853 (= e!771532 (not (arrayNoDuplicates!0 lt!599730 from!3120 acc!759)))))

(assert (=> b!1359853 (arrayNoDuplicates!0 lt!599730 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(assert (=> b!1359853 (= lt!599730 (array!92540 (store (arr!44710 a!3742) i!1404 l!3587) (size!45260 a!3742)))))

(declare-fun lt!599731 () Unit!44790)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92539 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31751) Unit!44790)

(assert (=> b!1359853 (= lt!599731 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun res!904256 () Bool)

(assert (=> start!114594 (=> (not res!904256) (not e!771529))))

(assert (=> start!114594 (= res!904256 (and (bvslt (size!45260 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45260 a!3742))))))

(assert (=> start!114594 e!771529))

(assert (=> start!114594 true))

(declare-fun array_inv!33738 (array!92539) Bool)

(assert (=> start!114594 (array_inv!33738 a!3742)))

(declare-fun b!1359849 () Bool)

(declare-fun res!904258 () Bool)

(assert (=> b!1359849 (=> (not res!904258) (not e!771529))))

(assert (=> b!1359849 (= res!904258 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31748))))

(assert (= (and start!114594 res!904256) b!1359852))

(assert (= (and b!1359852 res!904260) b!1359845))

(assert (= (and b!1359845 res!904255) b!1359842))

(assert (= (and b!1359842 res!904261) b!1359849))

(assert (= (and b!1359849 res!904258) b!1359847))

(assert (= (and b!1359847 res!904253) b!1359844))

(assert (= (and b!1359844 res!904254) b!1359846))

(assert (= (and b!1359846 res!904252) b!1359841))

(assert (= (and b!1359841 res!904257) b!1359851))

(assert (= (and b!1359851 c!127235) b!1359850))

(assert (= (and b!1359851 (not c!127235)) b!1359843))

(assert (= (and b!1359851 res!904251) b!1359848))

(assert (= (and b!1359848 res!904259) b!1359853))

(declare-fun m!1245175 () Bool)

(assert (=> b!1359848 m!1245175))

(declare-fun m!1245177 () Bool)

(assert (=> b!1359849 m!1245177))

(declare-fun m!1245179 () Bool)

(assert (=> b!1359852 m!1245179))

(declare-fun m!1245181 () Bool)

(assert (=> b!1359851 m!1245181))

(assert (=> b!1359851 m!1245181))

(declare-fun m!1245183 () Bool)

(assert (=> b!1359851 m!1245183))

(declare-fun m!1245185 () Bool)

(assert (=> b!1359850 m!1245185))

(assert (=> b!1359850 m!1245181))

(declare-fun m!1245187 () Bool)

(assert (=> b!1359850 m!1245187))

(declare-fun m!1245189 () Bool)

(assert (=> b!1359850 m!1245189))

(assert (=> b!1359850 m!1245175))

(assert (=> b!1359850 m!1245181))

(assert (=> b!1359850 m!1245187))

(declare-fun m!1245191 () Bool)

(assert (=> b!1359850 m!1245191))

(declare-fun m!1245193 () Bool)

(assert (=> b!1359853 m!1245193))

(declare-fun m!1245195 () Bool)

(assert (=> b!1359853 m!1245195))

(declare-fun m!1245197 () Bool)

(assert (=> b!1359853 m!1245197))

(declare-fun m!1245199 () Bool)

(assert (=> b!1359853 m!1245199))

(declare-fun m!1245201 () Bool)

(assert (=> b!1359842 m!1245201))

(declare-fun m!1245203 () Bool)

(assert (=> b!1359845 m!1245203))

(declare-fun m!1245205 () Bool)

(assert (=> start!114594 m!1245205))

(declare-fun m!1245207 () Bool)

(assert (=> b!1359847 m!1245207))

(declare-fun m!1245209 () Bool)

(assert (=> b!1359846 m!1245209))

(push 1)

(assert (not b!1359842))

(assert (not b!1359847))

(assert (not b!1359846))

(assert (not b!1359845))

(assert (not b!1359851))

(assert (not b!1359852))

(assert (not b!1359849))

(assert (not b!1359853))

(assert (not b!1359848))

(assert (not b!1359850))

(assert (not start!114594))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1359910 () Bool)

(declare-fun e!771581 () Bool)

(declare-fun e!771582 () Bool)

(assert (=> b!1359910 (= e!771581 e!771582)))

(declare-fun c!127245 () Bool)

(assert (=> b!1359910 (= c!127245 (validKeyInArray!0 (select (arr!44710 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1359911 () Bool)

(declare-fun e!771583 () Bool)

(assert (=> b!1359911 (= e!771583 e!771581)))

(declare-fun res!904301 () Bool)

(assert (=> b!1359911 (=> (not res!904301) (not e!771581))))

(declare-fun e!771580 () Bool)

(assert (=> b!1359911 (= res!904301 (not e!771580))))

(declare-fun res!904302 () Bool)

(assert (=> b!1359911 (=> (not res!904302) (not e!771580))))

(assert (=> b!1359911 (= res!904302 (validKeyInArray!0 (select (arr!44710 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1359912 () Bool)

(assert (=> b!1359912 (= e!771580 (contains!9460 Nil!31748 (select (arr!44710 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1359913 () Bool)

(declare-fun call!65316 () Bool)

(assert (=> b!1359913 (= e!771582 call!65316)))

(declare-fun d!145561 () Bool)

(declare-fun res!904300 () Bool)

(assert (=> d!145561 (=> res!904300 e!771583)))

(assert (=> d!145561 (= res!904300 (bvsge #b00000000000000000000000000000000 (size!45260 a!3742)))))

(assert (=> d!145561 (= (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31748) e!771583)))

(declare-fun b!1359914 () Bool)

(assert (=> b!1359914 (= e!771582 call!65316)))

(declare-fun bm!65313 () Bool)

(assert (=> bm!65313 (= call!65316 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!127245 (Cons!31747 (select (arr!44710 a!3742) #b00000000000000000000000000000000) Nil!31748) Nil!31748)))))

(assert (= (and d!145561 (not res!904300)) b!1359911))

(assert (= (and b!1359911 res!904302) b!1359912))

(assert (= (and b!1359911 res!904301) b!1359910))

(assert (= (and b!1359910 c!127245) b!1359914))

(assert (= (and b!1359910 (not c!127245)) b!1359913))

(assert (= (or b!1359914 b!1359913) bm!65313))

(declare-fun m!1245261 () Bool)

(assert (=> b!1359910 m!1245261))

(assert (=> b!1359910 m!1245261))

(declare-fun m!1245263 () Bool)

(assert (=> b!1359910 m!1245263))

(assert (=> b!1359911 m!1245261))

(assert (=> b!1359911 m!1245261))

(assert (=> b!1359911 m!1245263))

(assert (=> b!1359912 m!1245261))

(assert (=> b!1359912 m!1245261))

(declare-fun m!1245265 () Bool)

(assert (=> b!1359912 m!1245265))

(assert (=> bm!65313 m!1245261))

(declare-fun m!1245267 () Bool)

(assert (=> bm!65313 m!1245267))

(assert (=> b!1359849 d!145561))

(declare-fun b!1359919 () Bool)

(declare-fun e!771589 () Bool)

(declare-fun e!771590 () Bool)

(assert (=> b!1359919 (= e!771589 e!771590)))

(declare-fun c!127246 () Bool)

(assert (=> b!1359919 (= c!127246 (validKeyInArray!0 (select (arr!44710 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1359920 () Bool)

(declare-fun e!771591 () Bool)

(assert (=> b!1359920 (= e!771591 e!771589)))

(declare-fun res!904308 () Bool)

(assert (=> b!1359920 (=> (not res!904308) (not e!771589))))

(declare-fun e!771588 () Bool)

(assert (=> b!1359920 (= res!904308 (not e!771588))))

(declare-fun res!904309 () Bool)

(assert (=> b!1359920 (=> (not res!904309) (not e!771588))))

(assert (=> b!1359920 (= res!904309 (validKeyInArray!0 (select (arr!44710 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1359921 () Bool)

(assert (=> b!1359921 (= e!771588 (contains!9460 acc!759 (select (arr!44710 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1359922 () Bool)

(declare-fun call!65317 () Bool)

(assert (=> b!1359922 (= e!771590 call!65317)))

(declare-fun d!145571 () Bool)

(declare-fun res!904307 () Bool)

(assert (=> d!145571 (=> res!904307 e!771591)))

(assert (=> d!145571 (= res!904307 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45260 a!3742)))))

(assert (=> d!145571 (= (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759) e!771591)))

(declare-fun b!1359923 () Bool)

(assert (=> b!1359923 (= e!771590 call!65317)))

(declare-fun bm!65314 () Bool)

(assert (=> bm!65314 (= call!65317 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120 #b00000000000000000000000000000001) (ite c!127246 (Cons!31747 (select (arr!44710 a!3742) (bvadd #b00000000000000000000000000000001 from!3120)) acc!759) acc!759)))))

(assert (= (and d!145571 (not res!904307)) b!1359920))

(assert (= (and b!1359920 res!904309) b!1359921))

(assert (= (and b!1359920 res!904308) b!1359919))

(assert (= (and b!1359919 c!127246) b!1359923))

(assert (= (and b!1359919 (not c!127246)) b!1359922))

(assert (= (or b!1359923 b!1359922) bm!65314))

(declare-fun m!1245271 () Bool)

(assert (=> b!1359919 m!1245271))

(assert (=> b!1359919 m!1245271))

(declare-fun m!1245273 () Bool)

(assert (=> b!1359919 m!1245273))

(assert (=> b!1359920 m!1245271))

(assert (=> b!1359920 m!1245271))

(assert (=> b!1359920 m!1245273))

(assert (=> b!1359921 m!1245271))

(assert (=> b!1359921 m!1245271))

(declare-fun m!1245275 () Bool)

(assert (=> b!1359921 m!1245275))

(assert (=> bm!65314 m!1245271))

(declare-fun m!1245277 () Bool)

(assert (=> bm!65314 m!1245277))

(assert (=> b!1359848 d!145571))

(declare-fun d!145575 () Bool)

(assert (=> d!145575 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!599749 () Unit!44790)

(declare-fun choose!80 (array!92539 List!31751 List!31751 (_ BitVec 32)) Unit!44790)

(assert (=> d!145575 (= lt!599749 (choose!80 a!3742 ($colon$colon!865 acc!759 (select (arr!44710 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> d!145575 (bvslt (size!45260 a!3742) #b01111111111111111111111111111111)))

(assert (=> d!145575 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!865 acc!759 (select (arr!44710 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)) lt!599749)))

(declare-fun bs!38995 () Bool)

(assert (= bs!38995 d!145575))

(assert (=> bs!38995 m!1245175))

(assert (=> bs!38995 m!1245187))

(declare-fun m!1245283 () Bool)

(assert (=> bs!38995 m!1245283))

(assert (=> b!1359850 d!145575))

(declare-fun b!1359958 () Bool)

(declare-fun e!771624 () Bool)

(assert (=> b!1359958 (= e!771624 (subseq!862 (t!46424 acc!759) (t!46424 acc!759)))))

(declare-fun b!1359959 () Bool)

(declare-fun e!771626 () Bool)

(assert (=> b!1359959 (= e!771626 (subseq!862 acc!759 (t!46424 acc!759)))))

(declare-fun b!1359956 () Bool)

(declare-fun e!771625 () Bool)

(declare-fun e!771627 () Bool)

(assert (=> b!1359956 (= e!771625 e!771627)))

(declare-fun res!904345 () Bool)

(assert (=> b!1359956 (=> (not res!904345) (not e!771627))))

(assert (=> b!1359956 (= res!904345 (is-Cons!31747 acc!759))))

(declare-fun b!1359957 () Bool)

(assert (=> b!1359957 (= e!771627 e!771626)))

(declare-fun res!904342 () Bool)

(assert (=> b!1359957 (=> res!904342 e!771626)))

(assert (=> b!1359957 (= res!904342 e!771624)))

(declare-fun res!904343 () Bool)

(assert (=> b!1359957 (=> (not res!904343) (not e!771624))))

(assert (=> b!1359957 (= res!904343 (= (h!32956 acc!759) (h!32956 acc!759)))))

(declare-fun d!145579 () Bool)

(declare-fun res!904344 () Bool)

(assert (=> d!145579 (=> res!904344 e!771625)))

(assert (=> d!145579 (= res!904344 (is-Nil!31748 acc!759))))

(assert (=> d!145579 (= (subseq!862 acc!759 acc!759) e!771625)))

(assert (= (and d!145579 (not res!904344)) b!1359956))

(assert (= (and b!1359956 res!904345) b!1359957))

(assert (= (and b!1359957 res!904343) b!1359958))

(assert (= (and b!1359957 (not res!904342)) b!1359959))

(declare-fun m!1245301 () Bool)

(assert (=> b!1359958 m!1245301))

(declare-fun m!1245303 () Bool)

(assert (=> b!1359959 m!1245303))

(assert (=> b!1359850 d!145579))

(assert (=> b!1359850 d!145571))

(declare-fun d!145593 () Bool)

(assert (=> d!145593 (= ($colon$colon!865 acc!759 (select (arr!44710 a!3742) from!3120)) (Cons!31747 (select (arr!44710 a!3742) from!3120) acc!759))))

(assert (=> b!1359850 d!145593))

(declare-fun d!145595 () Bool)

(assert (=> d!145595 (subseq!862 acc!759 acc!759)))

(declare-fun lt!599757 () Unit!44790)

(declare-fun choose!36 (List!31751) Unit!44790)

(assert (=> d!145595 (= lt!599757 (choose!36 acc!759))))

(assert (=> d!145595 (= (lemmaListSubSeqRefl!0 acc!759) lt!599757)))

(declare-fun bs!38997 () Bool)

(assert (= bs!38997 d!145595))

(assert (=> bs!38997 m!1245191))

(declare-fun m!1245309 () Bool)

(assert (=> bs!38997 m!1245309))

(assert (=> b!1359850 d!145595))

(declare-fun d!145597 () Bool)

(assert (=> d!145597 (= (validKeyInArray!0 l!3587) (and (not (= l!3587 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= l!3587 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1359846 d!145597))

(declare-fun d!145599 () Bool)

(assert (=> d!145599 (= (array_inv!33738 a!3742) (bvsge (size!45260 a!3742) #b00000000000000000000000000000000))))

(assert (=> start!114594 d!145599))

(declare-fun b!1359979 () Bool)

(declare-fun e!771645 () Bool)

(declare-fun e!771646 () Bool)

(assert (=> b!1359979 (= e!771645 e!771646)))

(declare-fun c!127250 () Bool)

(assert (=> b!1359979 (= c!127250 (validKeyInArray!0 (select (arr!44710 a!3742) from!3120)))))

(declare-fun b!1359980 () Bool)

(declare-fun e!771647 () Bool)

(assert (=> b!1359980 (= e!771647 e!771645)))

(declare-fun res!904360 () Bool)

(assert (=> b!1359980 (=> (not res!904360) (not e!771645))))

(declare-fun e!771644 () Bool)

(assert (=> b!1359980 (= res!904360 (not e!771644))))

(declare-fun res!904361 () Bool)

(assert (=> b!1359980 (=> (not res!904361) (not e!771644))))

(assert (=> b!1359980 (= res!904361 (validKeyInArray!0 (select (arr!44710 a!3742) from!3120)))))

(declare-fun b!1359981 () Bool)

(assert (=> b!1359981 (= e!771644 (contains!9460 acc!759 (select (arr!44710 a!3742) from!3120)))))

(declare-fun b!1359982 () Bool)

(declare-fun call!65321 () Bool)

(assert (=> b!1359982 (= e!771646 call!65321)))

(declare-fun d!145601 () Bool)

(declare-fun res!904359 () Bool)

(assert (=> d!145601 (=> res!904359 e!771647)))

(assert (=> d!145601 (= res!904359 (bvsge from!3120 (size!45260 a!3742)))))

(assert (=> d!145601 (= (arrayNoDuplicates!0 a!3742 from!3120 acc!759) e!771647)))

(declare-fun b!1359983 () Bool)

(assert (=> b!1359983 (= e!771646 call!65321)))

(declare-fun bm!65318 () Bool)

(assert (=> bm!65318 (= call!65321 (arrayNoDuplicates!0 a!3742 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127250 (Cons!31747 (select (arr!44710 a!3742) from!3120) acc!759) acc!759)))))

(assert (= (and d!145601 (not res!904359)) b!1359980))

(assert (= (and b!1359980 res!904361) b!1359981))

(assert (= (and b!1359980 res!904360) b!1359979))

(assert (= (and b!1359979 c!127250) b!1359983))

(assert (= (and b!1359979 (not c!127250)) b!1359982))

(assert (= (or b!1359983 b!1359982) bm!65318))

(assert (=> b!1359979 m!1245181))

(assert (=> b!1359979 m!1245181))

(assert (=> b!1359979 m!1245183))

(assert (=> b!1359980 m!1245181))

(assert (=> b!1359980 m!1245181))

(assert (=> b!1359980 m!1245183))

(assert (=> b!1359981 m!1245181))

(assert (=> b!1359981 m!1245181))

(declare-fun m!1245319 () Bool)

(assert (=> b!1359981 m!1245319))

(assert (=> bm!65318 m!1245181))

(declare-fun m!1245321 () Bool)

(assert (=> bm!65318 m!1245321))

(assert (=> b!1359847 d!145601))

(declare-fun d!145605 () Bool)

(declare-fun lt!599760 () Bool)

(declare-fun content!689 (List!31751) (Set (_ BitVec 64)))

(assert (=> d!145605 (= lt!599760 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!689 acc!759)))))

(declare-fun e!771656 () Bool)

(assert (=> d!145605 (= lt!599760 e!771656)))

(declare-fun res!904370 () Bool)

(assert (=> d!145605 (=> (not res!904370) (not e!771656))))

(assert (=> d!145605 (= res!904370 (is-Cons!31747 acc!759))))

(assert (=> d!145605 (= (contains!9460 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000) lt!599760)))

(declare-fun b!1359993 () Bool)

(declare-fun e!771657 () Bool)

(assert (=> b!1359993 (= e!771656 e!771657)))

(declare-fun res!904369 () Bool)

(assert (=> b!1359993 (=> res!904369 e!771657)))

(assert (=> b!1359993 (= res!904369 (= (h!32956 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1359994 () Bool)

(assert (=> b!1359994 (= e!771657 (contains!9460 (t!46424 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145605 res!904370) b!1359993))

(assert (= (and b!1359993 (not res!904369)) b!1359994))

(declare-fun m!1245331 () Bool)

(assert (=> d!145605 m!1245331))

(declare-fun m!1245333 () Bool)

(assert (=> d!145605 m!1245333))

(declare-fun m!1245335 () Bool)

(assert (=> b!1359994 m!1245335))

(assert (=> b!1359845 d!145605))

(declare-fun d!145609 () Bool)

(assert (=> d!145609 (= (validKeyInArray!0 (select (arr!44710 a!3742) from!3120)) (and (not (= (select (arr!44710 a!3742) from!3120) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44710 a!3742) from!3120) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1359851 d!145609))

(declare-fun d!145611 () Bool)

(declare-fun lt!599761 () Bool)

(assert (=> d!145611 (= lt!599761 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!689 acc!759)))))

(declare-fun e!771658 () Bool)

(assert (=> d!145611 (= lt!599761 e!771658)))

(declare-fun res!904372 () Bool)

(assert (=> d!145611 (=> (not res!904372) (not e!771658))))

(assert (=> d!145611 (= res!904372 (is-Cons!31747 acc!759))))

(assert (=> d!145611 (= (contains!9460 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000) lt!599761)))

(declare-fun b!1359995 () Bool)

(declare-fun e!771659 () Bool)

(assert (=> b!1359995 (= e!771658 e!771659)))

(declare-fun res!904371 () Bool)

(assert (=> b!1359995 (=> res!904371 e!771659)))

(assert (=> b!1359995 (= res!904371 (= (h!32956 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1359996 () Bool)

(assert (=> b!1359996 (= e!771659 (contains!9460 (t!46424 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145611 res!904372) b!1359995))

(assert (= (and b!1359995 (not res!904371)) b!1359996))

(assert (=> d!145611 m!1245331))

(declare-fun m!1245337 () Bool)

(assert (=> d!145611 m!1245337))

(declare-fun m!1245339 () Bool)

(assert (=> b!1359996 m!1245339))

(assert (=> b!1359842 d!145611))

(declare-fun b!1359997 () Bool)

(declare-fun e!771661 () Bool)

(declare-fun e!771662 () Bool)

(assert (=> b!1359997 (= e!771661 e!771662)))

(declare-fun c!127252 () Bool)

(assert (=> b!1359997 (= c!127252 (validKeyInArray!0 (select (arr!44710 lt!599730) from!3120)))))

(declare-fun b!1359998 () Bool)

(declare-fun e!771663 () Bool)

(assert (=> b!1359998 (= e!771663 e!771661)))

(declare-fun res!904374 () Bool)

(assert (=> b!1359998 (=> (not res!904374) (not e!771661))))

(declare-fun e!771660 () Bool)

(assert (=> b!1359998 (= res!904374 (not e!771660))))

(declare-fun res!904375 () Bool)

(assert (=> b!1359998 (=> (not res!904375) (not e!771660))))

(assert (=> b!1359998 (= res!904375 (validKeyInArray!0 (select (arr!44710 lt!599730) from!3120)))))

(declare-fun b!1359999 () Bool)

(assert (=> b!1359999 (= e!771660 (contains!9460 acc!759 (select (arr!44710 lt!599730) from!3120)))))

(declare-fun b!1360000 () Bool)

(declare-fun call!65323 () Bool)

(assert (=> b!1360000 (= e!771662 call!65323)))

(declare-fun d!145613 () Bool)

(declare-fun res!904373 () Bool)

(assert (=> d!145613 (=> res!904373 e!771663)))

(assert (=> d!145613 (= res!904373 (bvsge from!3120 (size!45260 lt!599730)))))

