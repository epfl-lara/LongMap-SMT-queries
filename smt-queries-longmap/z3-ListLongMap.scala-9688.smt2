; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114410 () Bool)

(assert start!114410)

(declare-fun b!1358065 () Bool)

(declare-fun res!902799 () Bool)

(declare-fun e!770786 () Bool)

(assert (=> b!1358065 (=> (not res!902799) (not e!770786))))

(declare-datatypes ((List!31766 0))(
  ( (Nil!31763) (Cons!31762 (h!32971 (_ BitVec 64)) (t!46425 List!31766)) )
))
(declare-fun acc!759 () List!31766)

(declare-fun contains!9386 (List!31766 (_ BitVec 64)) Bool)

(assert (=> b!1358065 (= res!902799 (not (contains!9386 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358066 () Bool)

(declare-fun res!902793 () Bool)

(declare-fun e!770787 () Bool)

(assert (=> b!1358066 (=> res!902793 e!770787)))

(declare-fun lt!599093 () List!31766)

(assert (=> b!1358066 (= res!902793 (contains!9386 lt!599093 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1358067 () Bool)

(declare-fun res!902797 () Bool)

(assert (=> b!1358067 (=> (not res!902797) (not e!770786))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1358067 (= res!902797 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1358068 () Bool)

(declare-fun res!902796 () Bool)

(assert (=> b!1358068 (=> (not res!902796) (not e!770786))))

(declare-datatypes ((array!92406 0))(
  ( (array!92407 (arr!44647 (Array (_ BitVec 32) (_ BitVec 64))) (size!45199 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92406)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92406 (_ BitVec 32) List!31766) Bool)

(assert (=> b!1358068 (= res!902796 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1358069 () Bool)

(assert (=> b!1358069 (= e!770787 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!599093))))

(declare-datatypes ((Unit!44520 0))(
  ( (Unit!44521) )
))
(declare-fun lt!599095 () Unit!44520)

(declare-fun noDuplicateSubseq!134 (List!31766 List!31766) Unit!44520)

(assert (=> b!1358069 (= lt!599095 (noDuplicateSubseq!134 acc!759 lt!599093))))

(declare-fun res!902802 () Bool)

(assert (=> start!114410 (=> (not res!902802) (not e!770786))))

(assert (=> start!114410 (= res!902802 (and (bvslt (size!45199 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45199 a!3742))))))

(assert (=> start!114410 e!770786))

(assert (=> start!114410 true))

(declare-fun array_inv!33880 (array!92406) Bool)

(assert (=> start!114410 (array_inv!33880 a!3742)))

(declare-fun b!1358070 () Bool)

(declare-fun res!902795 () Bool)

(assert (=> b!1358070 (=> res!902795 e!770787)))

(declare-fun subseq!824 (List!31766 List!31766) Bool)

(assert (=> b!1358070 (= res!902795 (not (subseq!824 acc!759 lt!599093)))))

(declare-fun b!1358071 () Bool)

(declare-fun res!902801 () Bool)

(assert (=> b!1358071 (=> (not res!902801) (not e!770786))))

(declare-fun noDuplicate!2301 (List!31766) Bool)

(assert (=> b!1358071 (= res!902801 (noDuplicate!2301 acc!759))))

(declare-fun b!1358072 () Bool)

(declare-fun res!902792 () Bool)

(assert (=> b!1358072 (=> res!902792 e!770787)))

(assert (=> b!1358072 (= res!902792 (contains!9386 lt!599093 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1358073 () Bool)

(declare-fun res!902804 () Bool)

(assert (=> b!1358073 (=> (not res!902804) (not e!770786))))

(assert (=> b!1358073 (= res!902804 (validKeyInArray!0 (select (arr!44647 a!3742) from!3120)))))

(declare-fun b!1358074 () Bool)

(declare-fun res!902791 () Bool)

(assert (=> b!1358074 (=> res!902791 e!770787)))

(assert (=> b!1358074 (= res!902791 (not (noDuplicate!2301 lt!599093)))))

(declare-fun b!1358075 () Bool)

(declare-fun res!902803 () Bool)

(assert (=> b!1358075 (=> (not res!902803) (not e!770786))))

(assert (=> b!1358075 (= res!902803 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31763))))

(declare-fun b!1358076 () Bool)

(declare-fun res!902790 () Bool)

(assert (=> b!1358076 (=> (not res!902790) (not e!770786))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1358076 (= res!902790 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45199 a!3742))))))

(declare-fun b!1358077 () Bool)

(declare-fun res!902798 () Bool)

(assert (=> b!1358077 (=> (not res!902798) (not e!770786))))

(assert (=> b!1358077 (= res!902798 (not (contains!9386 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358078 () Bool)

(declare-fun res!902800 () Bool)

(assert (=> b!1358078 (=> (not res!902800) (not e!770786))))

(assert (=> b!1358078 (= res!902800 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45199 a!3742)))))

(declare-fun b!1358079 () Bool)

(assert (=> b!1358079 (= e!770786 (not e!770787))))

(declare-fun res!902794 () Bool)

(assert (=> b!1358079 (=> res!902794 e!770787)))

(assert (=> b!1358079 (= res!902794 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!829 (List!31766 (_ BitVec 64)) List!31766)

(assert (=> b!1358079 (= lt!599093 ($colon$colon!829 acc!759 (select (arr!44647 a!3742) from!3120)))))

(assert (=> b!1358079 (subseq!824 acc!759 acc!759)))

(declare-fun lt!599094 () Unit!44520)

(declare-fun lemmaListSubSeqRefl!0 (List!31766) Unit!44520)

(assert (=> b!1358079 (= lt!599094 (lemmaListSubSeqRefl!0 acc!759))))

(assert (= (and start!114410 res!902802) b!1358071))

(assert (= (and b!1358071 res!902801) b!1358065))

(assert (= (and b!1358065 res!902799) b!1358077))

(assert (= (and b!1358077 res!902798) b!1358075))

(assert (= (and b!1358075 res!902803) b!1358068))

(assert (= (and b!1358068 res!902796) b!1358076))

(assert (= (and b!1358076 res!902790) b!1358067))

(assert (= (and b!1358067 res!902797) b!1358078))

(assert (= (and b!1358078 res!902800) b!1358073))

(assert (= (and b!1358073 res!902804) b!1358079))

(assert (= (and b!1358079 (not res!902794)) b!1358074))

(assert (= (and b!1358074 (not res!902791)) b!1358072))

(assert (= (and b!1358072 (not res!902792)) b!1358066))

(assert (= (and b!1358066 (not res!902793)) b!1358070))

(assert (= (and b!1358070 (not res!902795)) b!1358069))

(declare-fun m!1243231 () Bool)

(assert (=> b!1358069 m!1243231))

(declare-fun m!1243233 () Bool)

(assert (=> b!1358069 m!1243233))

(declare-fun m!1243235 () Bool)

(assert (=> b!1358077 m!1243235))

(declare-fun m!1243237 () Bool)

(assert (=> b!1358079 m!1243237))

(assert (=> b!1358079 m!1243237))

(declare-fun m!1243239 () Bool)

(assert (=> b!1358079 m!1243239))

(declare-fun m!1243241 () Bool)

(assert (=> b!1358079 m!1243241))

(declare-fun m!1243243 () Bool)

(assert (=> b!1358079 m!1243243))

(declare-fun m!1243245 () Bool)

(assert (=> b!1358066 m!1243245))

(declare-fun m!1243247 () Bool)

(assert (=> b!1358072 m!1243247))

(declare-fun m!1243249 () Bool)

(assert (=> b!1358065 m!1243249))

(declare-fun m!1243251 () Bool)

(assert (=> b!1358067 m!1243251))

(declare-fun m!1243253 () Bool)

(assert (=> start!114410 m!1243253))

(declare-fun m!1243255 () Bool)

(assert (=> b!1358071 m!1243255))

(assert (=> b!1358073 m!1243237))

(assert (=> b!1358073 m!1243237))

(declare-fun m!1243257 () Bool)

(assert (=> b!1358073 m!1243257))

(declare-fun m!1243259 () Bool)

(assert (=> b!1358070 m!1243259))

(declare-fun m!1243261 () Bool)

(assert (=> b!1358068 m!1243261))

(declare-fun m!1243263 () Bool)

(assert (=> b!1358075 m!1243263))

(declare-fun m!1243265 () Bool)

(assert (=> b!1358074 m!1243265))

(check-sat (not b!1358073) (not b!1358070) (not start!114410) (not b!1358071) (not b!1358067) (not b!1358072) (not b!1358069) (not b!1358065) (not b!1358074) (not b!1358077) (not b!1358075) (not b!1358066) (not b!1358068) (not b!1358079))
(check-sat)
(get-model)

(declare-fun d!145225 () Bool)

(declare-fun lt!599116 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!681 (List!31766) (InoxSet (_ BitVec 64)))

(assert (=> d!145225 (= lt!599116 (select (content!681 lt!599093) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!770811 () Bool)

(assert (=> d!145225 (= lt!599116 e!770811)))

(declare-fun res!902900 () Bool)

(assert (=> d!145225 (=> (not res!902900) (not e!770811))))

(get-info :version)

(assert (=> d!145225 (= res!902900 ((_ is Cons!31762) lt!599093))))

(assert (=> d!145225 (= (contains!9386 lt!599093 #b1000000000000000000000000000000000000000000000000000000000000000) lt!599116)))

(declare-fun b!1358174 () Bool)

(declare-fun e!770812 () Bool)

(assert (=> b!1358174 (= e!770811 e!770812)))

(declare-fun res!902899 () Bool)

(assert (=> b!1358174 (=> res!902899 e!770812)))

(assert (=> b!1358174 (= res!902899 (= (h!32971 lt!599093) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1358175 () Bool)

(assert (=> b!1358175 (= e!770812 (contains!9386 (t!46425 lt!599093) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145225 res!902900) b!1358174))

(assert (= (and b!1358174 (not res!902899)) b!1358175))

(declare-fun m!1243339 () Bool)

(assert (=> d!145225 m!1243339))

(declare-fun m!1243341 () Bool)

(assert (=> d!145225 m!1243341))

(declare-fun m!1243343 () Bool)

(assert (=> b!1358175 m!1243343))

(assert (=> b!1358066 d!145225))

(declare-fun d!145227 () Bool)

(declare-fun lt!599117 () Bool)

(assert (=> d!145227 (= lt!599117 (select (content!681 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!770813 () Bool)

(assert (=> d!145227 (= lt!599117 e!770813)))

(declare-fun res!902902 () Bool)

(assert (=> d!145227 (=> (not res!902902) (not e!770813))))

(assert (=> d!145227 (= res!902902 ((_ is Cons!31762) acc!759))))

(assert (=> d!145227 (= (contains!9386 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000) lt!599117)))

(declare-fun b!1358176 () Bool)

(declare-fun e!770814 () Bool)

(assert (=> b!1358176 (= e!770813 e!770814)))

(declare-fun res!902901 () Bool)

(assert (=> b!1358176 (=> res!902901 e!770814)))

(assert (=> b!1358176 (= res!902901 (= (h!32971 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1358177 () Bool)

(assert (=> b!1358177 (= e!770814 (contains!9386 (t!46425 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145227 res!902902) b!1358176))

(assert (= (and b!1358176 (not res!902901)) b!1358177))

(declare-fun m!1243345 () Bool)

(assert (=> d!145227 m!1243345))

(declare-fun m!1243347 () Bool)

(assert (=> d!145227 m!1243347))

(declare-fun m!1243349 () Bool)

(assert (=> b!1358177 m!1243349))

(assert (=> b!1358065 d!145227))

(declare-fun d!145229 () Bool)

(assert (=> d!145229 (= (array_inv!33880 a!3742) (bvsge (size!45199 a!3742) #b00000000000000000000000000000000))))

(assert (=> start!114410 d!145229))

(declare-fun d!145231 () Bool)

(assert (=> d!145231 (= (validKeyInArray!0 l!3587) (and (not (= l!3587 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= l!3587 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1358067 d!145231))

(declare-fun d!145233 () Bool)

(declare-fun lt!599118 () Bool)

(assert (=> d!145233 (= lt!599118 (select (content!681 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!770815 () Bool)

(assert (=> d!145233 (= lt!599118 e!770815)))

(declare-fun res!902904 () Bool)

(assert (=> d!145233 (=> (not res!902904) (not e!770815))))

(assert (=> d!145233 (= res!902904 ((_ is Cons!31762) acc!759))))

(assert (=> d!145233 (= (contains!9386 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000) lt!599118)))

(declare-fun b!1358178 () Bool)

(declare-fun e!770816 () Bool)

(assert (=> b!1358178 (= e!770815 e!770816)))

(declare-fun res!902903 () Bool)

(assert (=> b!1358178 (=> res!902903 e!770816)))

(assert (=> b!1358178 (= res!902903 (= (h!32971 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1358179 () Bool)

(assert (=> b!1358179 (= e!770816 (contains!9386 (t!46425 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145233 res!902904) b!1358178))

(assert (= (and b!1358178 (not res!902903)) b!1358179))

(assert (=> d!145233 m!1243345))

(declare-fun m!1243351 () Bool)

(assert (=> d!145233 m!1243351))

(declare-fun m!1243353 () Bool)

(assert (=> b!1358179 m!1243353))

(assert (=> b!1358077 d!145233))

(declare-fun d!145235 () Bool)

(assert (=> d!145235 (= ($colon$colon!829 acc!759 (select (arr!44647 a!3742) from!3120)) (Cons!31762 (select (arr!44647 a!3742) from!3120) acc!759))))

(assert (=> b!1358079 d!145235))

(declare-fun d!145237 () Bool)

(declare-fun res!902915 () Bool)

(declare-fun e!770828 () Bool)

(assert (=> d!145237 (=> res!902915 e!770828)))

(assert (=> d!145237 (= res!902915 ((_ is Nil!31763) acc!759))))

(assert (=> d!145237 (= (subseq!824 acc!759 acc!759) e!770828)))

(declare-fun b!1358191 () Bool)

(declare-fun e!770827 () Bool)

(assert (=> b!1358191 (= e!770827 (subseq!824 acc!759 (t!46425 acc!759)))))

(declare-fun b!1358188 () Bool)

(declare-fun e!770825 () Bool)

(assert (=> b!1358188 (= e!770828 e!770825)))

(declare-fun res!902916 () Bool)

(assert (=> b!1358188 (=> (not res!902916) (not e!770825))))

(assert (=> b!1358188 (= res!902916 ((_ is Cons!31762) acc!759))))

(declare-fun b!1358189 () Bool)

(assert (=> b!1358189 (= e!770825 e!770827)))

(declare-fun res!902914 () Bool)

(assert (=> b!1358189 (=> res!902914 e!770827)))

(declare-fun e!770826 () Bool)

(assert (=> b!1358189 (= res!902914 e!770826)))

(declare-fun res!902913 () Bool)

(assert (=> b!1358189 (=> (not res!902913) (not e!770826))))

(assert (=> b!1358189 (= res!902913 (= (h!32971 acc!759) (h!32971 acc!759)))))

(declare-fun b!1358190 () Bool)

(assert (=> b!1358190 (= e!770826 (subseq!824 (t!46425 acc!759) (t!46425 acc!759)))))

(assert (= (and d!145237 (not res!902915)) b!1358188))

(assert (= (and b!1358188 res!902916) b!1358189))

(assert (= (and b!1358189 res!902913) b!1358190))

(assert (= (and b!1358189 (not res!902914)) b!1358191))

(declare-fun m!1243355 () Bool)

(assert (=> b!1358191 m!1243355))

(declare-fun m!1243357 () Bool)

(assert (=> b!1358190 m!1243357))

(assert (=> b!1358079 d!145237))

(declare-fun d!145239 () Bool)

(assert (=> d!145239 (subseq!824 acc!759 acc!759)))

(declare-fun lt!599121 () Unit!44520)

(declare-fun choose!36 (List!31766) Unit!44520)

(assert (=> d!145239 (= lt!599121 (choose!36 acc!759))))

(assert (=> d!145239 (= (lemmaListSubSeqRefl!0 acc!759) lt!599121)))

(declare-fun bs!38922 () Bool)

(assert (= bs!38922 d!145239))

(assert (=> bs!38922 m!1243241))

(declare-fun m!1243359 () Bool)

(assert (=> bs!38922 m!1243359))

(assert (=> b!1358079 d!145239))

(declare-fun b!1358210 () Bool)

(declare-fun e!770846 () Bool)

(assert (=> b!1358210 (= e!770846 (contains!9386 acc!759 (select (arr!44647 a!3742) from!3120)))))

(declare-fun call!65260 () Bool)

(declare-fun c!127082 () Bool)

(declare-fun bm!65257 () Bool)

(assert (=> bm!65257 (= call!65260 (arrayNoDuplicates!0 a!3742 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127082 (Cons!31762 (select (arr!44647 a!3742) from!3120) acc!759) acc!759)))))

(declare-fun b!1358211 () Bool)

(declare-fun e!770848 () Bool)

(assert (=> b!1358211 (= e!770848 call!65260)))

(declare-fun b!1358212 () Bool)

(declare-fun e!770847 () Bool)

(declare-fun e!770845 () Bool)

(assert (=> b!1358212 (= e!770847 e!770845)))

(declare-fun res!902932 () Bool)

(assert (=> b!1358212 (=> (not res!902932) (not e!770845))))

(assert (=> b!1358212 (= res!902932 (not e!770846))))

(declare-fun res!902931 () Bool)

(assert (=> b!1358212 (=> (not res!902931) (not e!770846))))

(assert (=> b!1358212 (= res!902931 (validKeyInArray!0 (select (arr!44647 a!3742) from!3120)))))

(declare-fun d!145241 () Bool)

(declare-fun res!902933 () Bool)

(assert (=> d!145241 (=> res!902933 e!770847)))

(assert (=> d!145241 (= res!902933 (bvsge from!3120 (size!45199 a!3742)))))

(assert (=> d!145241 (= (arrayNoDuplicates!0 a!3742 from!3120 acc!759) e!770847)))

(declare-fun b!1358213 () Bool)

(assert (=> b!1358213 (= e!770848 call!65260)))

(declare-fun b!1358214 () Bool)

(assert (=> b!1358214 (= e!770845 e!770848)))

(assert (=> b!1358214 (= c!127082 (validKeyInArray!0 (select (arr!44647 a!3742) from!3120)))))

(assert (= (and d!145241 (not res!902933)) b!1358212))

(assert (= (and b!1358212 res!902931) b!1358210))

(assert (= (and b!1358212 res!902932) b!1358214))

(assert (= (and b!1358214 c!127082) b!1358213))

(assert (= (and b!1358214 (not c!127082)) b!1358211))

(assert (= (or b!1358213 b!1358211) bm!65257))

(assert (=> b!1358210 m!1243237))

(assert (=> b!1358210 m!1243237))

(declare-fun m!1243361 () Bool)

(assert (=> b!1358210 m!1243361))

(assert (=> bm!65257 m!1243237))

(declare-fun m!1243363 () Bool)

(assert (=> bm!65257 m!1243363))

(assert (=> b!1358212 m!1243237))

(assert (=> b!1358212 m!1243237))

(assert (=> b!1358212 m!1243257))

(assert (=> b!1358214 m!1243237))

(assert (=> b!1358214 m!1243237))

(assert (=> b!1358214 m!1243257))

(assert (=> b!1358068 d!145241))

(declare-fun d!145251 () Bool)

(declare-fun res!902940 () Bool)

(declare-fun e!770856 () Bool)

(assert (=> d!145251 (=> res!902940 e!770856)))

(assert (=> d!145251 (= res!902940 ((_ is Nil!31763) acc!759))))

(assert (=> d!145251 (= (subseq!824 acc!759 lt!599093) e!770856)))

(declare-fun b!1358222 () Bool)

(declare-fun e!770855 () Bool)

(assert (=> b!1358222 (= e!770855 (subseq!824 acc!759 (t!46425 lt!599093)))))

(declare-fun b!1358219 () Bool)

(declare-fun e!770853 () Bool)

(assert (=> b!1358219 (= e!770856 e!770853)))

(declare-fun res!902941 () Bool)

(assert (=> b!1358219 (=> (not res!902941) (not e!770853))))

(assert (=> b!1358219 (= res!902941 ((_ is Cons!31762) lt!599093))))

(declare-fun b!1358220 () Bool)

(assert (=> b!1358220 (= e!770853 e!770855)))

(declare-fun res!902939 () Bool)

(assert (=> b!1358220 (=> res!902939 e!770855)))

(declare-fun e!770854 () Bool)

(assert (=> b!1358220 (= res!902939 e!770854)))

(declare-fun res!902938 () Bool)

(assert (=> b!1358220 (=> (not res!902938) (not e!770854))))

(assert (=> b!1358220 (= res!902938 (= (h!32971 acc!759) (h!32971 lt!599093)))))

(declare-fun b!1358221 () Bool)

(assert (=> b!1358221 (= e!770854 (subseq!824 (t!46425 acc!759) (t!46425 lt!599093)))))

(assert (= (and d!145251 (not res!902940)) b!1358219))

(assert (= (and b!1358219 res!902941) b!1358220))

(assert (= (and b!1358220 res!902938) b!1358221))

(assert (= (and b!1358220 (not res!902939)) b!1358222))

(declare-fun m!1243365 () Bool)

(assert (=> b!1358222 m!1243365))

(declare-fun m!1243367 () Bool)

(assert (=> b!1358221 m!1243367))

(assert (=> b!1358070 d!145251))

(declare-fun e!770860 () Bool)

(declare-fun b!1358225 () Bool)

(assert (=> b!1358225 (= e!770860 (contains!9386 lt!599093 (select (arr!44647 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun call!65261 () Bool)

(declare-fun c!127083 () Bool)

(declare-fun bm!65258 () Bool)

(assert (=> bm!65258 (= call!65261 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120 #b00000000000000000000000000000001) (ite c!127083 (Cons!31762 (select (arr!44647 a!3742) (bvadd #b00000000000000000000000000000001 from!3120)) lt!599093) lt!599093)))))

(declare-fun b!1358226 () Bool)

(declare-fun e!770862 () Bool)

(assert (=> b!1358226 (= e!770862 call!65261)))

(declare-fun b!1358227 () Bool)

(declare-fun e!770861 () Bool)

(declare-fun e!770859 () Bool)

(assert (=> b!1358227 (= e!770861 e!770859)))

(declare-fun res!902945 () Bool)

(assert (=> b!1358227 (=> (not res!902945) (not e!770859))))

(assert (=> b!1358227 (= res!902945 (not e!770860))))

(declare-fun res!902944 () Bool)

(assert (=> b!1358227 (=> (not res!902944) (not e!770860))))

(assert (=> b!1358227 (= res!902944 (validKeyInArray!0 (select (arr!44647 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun d!145253 () Bool)

(declare-fun res!902946 () Bool)

(assert (=> d!145253 (=> res!902946 e!770861)))

(assert (=> d!145253 (= res!902946 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45199 a!3742)))))

(assert (=> d!145253 (= (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!599093) e!770861)))

(declare-fun b!1358228 () Bool)

(assert (=> b!1358228 (= e!770862 call!65261)))

(declare-fun b!1358229 () Bool)

(assert (=> b!1358229 (= e!770859 e!770862)))

(assert (=> b!1358229 (= c!127083 (validKeyInArray!0 (select (arr!44647 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(assert (= (and d!145253 (not res!902946)) b!1358227))

(assert (= (and b!1358227 res!902944) b!1358225))

(assert (= (and b!1358227 res!902945) b!1358229))

(assert (= (and b!1358229 c!127083) b!1358228))

(assert (= (and b!1358229 (not c!127083)) b!1358226))

(assert (= (or b!1358228 b!1358226) bm!65258))

(declare-fun m!1243375 () Bool)

(assert (=> b!1358225 m!1243375))

(assert (=> b!1358225 m!1243375))

(declare-fun m!1243377 () Bool)

(assert (=> b!1358225 m!1243377))

(assert (=> bm!65258 m!1243375))

(declare-fun m!1243379 () Bool)

(assert (=> bm!65258 m!1243379))

(assert (=> b!1358227 m!1243375))

(assert (=> b!1358227 m!1243375))

(declare-fun m!1243385 () Bool)

(assert (=> b!1358227 m!1243385))

(assert (=> b!1358229 m!1243375))

(assert (=> b!1358229 m!1243375))

(assert (=> b!1358229 m!1243385))

(assert (=> b!1358069 d!145253))

(declare-fun d!145259 () Bool)

(assert (=> d!145259 (noDuplicate!2301 acc!759)))

(declare-fun lt!599130 () Unit!44520)

(declare-fun choose!1999 (List!31766 List!31766) Unit!44520)

(assert (=> d!145259 (= lt!599130 (choose!1999 acc!759 lt!599093))))

(declare-fun e!770875 () Bool)

(assert (=> d!145259 e!770875))

(declare-fun res!902959 () Bool)

(assert (=> d!145259 (=> (not res!902959) (not e!770875))))

(assert (=> d!145259 (= res!902959 (subseq!824 acc!759 lt!599093))))

(assert (=> d!145259 (= (noDuplicateSubseq!134 acc!759 lt!599093) lt!599130)))

(declare-fun b!1358238 () Bool)

(assert (=> b!1358238 (= e!770875 (noDuplicate!2301 lt!599093))))

(assert (= (and d!145259 res!902959) b!1358238))

(assert (=> d!145259 m!1243255))

(declare-fun m!1243389 () Bool)

(assert (=> d!145259 m!1243389))

(assert (=> d!145259 m!1243259))

(assert (=> b!1358238 m!1243265))

(assert (=> b!1358069 d!145259))

(declare-fun d!145265 () Bool)

(declare-fun res!902972 () Bool)

(declare-fun e!770890 () Bool)

(assert (=> d!145265 (=> res!902972 e!770890)))

(assert (=> d!145265 (= res!902972 ((_ is Nil!31763) acc!759))))

(assert (=> d!145265 (= (noDuplicate!2301 acc!759) e!770890)))

(declare-fun b!1358259 () Bool)

(declare-fun e!770891 () Bool)

(assert (=> b!1358259 (= e!770890 e!770891)))

(declare-fun res!902973 () Bool)

(assert (=> b!1358259 (=> (not res!902973) (not e!770891))))

(assert (=> b!1358259 (= res!902973 (not (contains!9386 (t!46425 acc!759) (h!32971 acc!759))))))

(declare-fun b!1358260 () Bool)

(assert (=> b!1358260 (= e!770891 (noDuplicate!2301 (t!46425 acc!759)))))

(assert (= (and d!145265 (not res!902972)) b!1358259))

(assert (= (and b!1358259 res!902973) b!1358260))

(declare-fun m!1243397 () Bool)

(assert (=> b!1358259 m!1243397))

(declare-fun m!1243399 () Bool)

(assert (=> b!1358260 m!1243399))

(assert (=> b!1358071 d!145265))

(declare-fun d!145269 () Bool)

(declare-fun lt!599135 () Bool)

(assert (=> d!145269 (= lt!599135 (select (content!681 lt!599093) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!770892 () Bool)

(assert (=> d!145269 (= lt!599135 e!770892)))

(declare-fun res!902975 () Bool)

(assert (=> d!145269 (=> (not res!902975) (not e!770892))))

(assert (=> d!145269 (= res!902975 ((_ is Cons!31762) lt!599093))))

(assert (=> d!145269 (= (contains!9386 lt!599093 #b0000000000000000000000000000000000000000000000000000000000000000) lt!599135)))

(declare-fun b!1358261 () Bool)

(declare-fun e!770893 () Bool)

(assert (=> b!1358261 (= e!770892 e!770893)))

(declare-fun res!902974 () Bool)

(assert (=> b!1358261 (=> res!902974 e!770893)))

(assert (=> b!1358261 (= res!902974 (= (h!32971 lt!599093) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1358262 () Bool)

(assert (=> b!1358262 (= e!770893 (contains!9386 (t!46425 lt!599093) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145269 res!902975) b!1358261))

(assert (= (and b!1358261 (not res!902974)) b!1358262))

(assert (=> d!145269 m!1243339))

(declare-fun m!1243407 () Bool)

(assert (=> d!145269 m!1243407))

(declare-fun m!1243409 () Bool)

(assert (=> b!1358262 m!1243409))

(assert (=> b!1358072 d!145269))

(declare-fun d!145273 () Bool)

(declare-fun res!902976 () Bool)

(declare-fun e!770894 () Bool)

(assert (=> d!145273 (=> res!902976 e!770894)))

(assert (=> d!145273 (= res!902976 ((_ is Nil!31763) lt!599093))))

(assert (=> d!145273 (= (noDuplicate!2301 lt!599093) e!770894)))

(declare-fun b!1358263 () Bool)

(declare-fun e!770895 () Bool)

(assert (=> b!1358263 (= e!770894 e!770895)))

(declare-fun res!902977 () Bool)

(assert (=> b!1358263 (=> (not res!902977) (not e!770895))))

(assert (=> b!1358263 (= res!902977 (not (contains!9386 (t!46425 lt!599093) (h!32971 lt!599093))))))

(declare-fun b!1358264 () Bool)

(assert (=> b!1358264 (= e!770895 (noDuplicate!2301 (t!46425 lt!599093)))))

(assert (= (and d!145273 (not res!902976)) b!1358263))

(assert (= (and b!1358263 res!902977) b!1358264))

(declare-fun m!1243411 () Bool)

(assert (=> b!1358263 m!1243411))

(declare-fun m!1243413 () Bool)

(assert (=> b!1358264 m!1243413))

(assert (=> b!1358074 d!145273))

(declare-fun d!145275 () Bool)

(assert (=> d!145275 (= (validKeyInArray!0 (select (arr!44647 a!3742) from!3120)) (and (not (= (select (arr!44647 a!3742) from!3120) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44647 a!3742) from!3120) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1358073 d!145275))

(declare-fun b!1358270 () Bool)

(declare-fun e!770901 () Bool)

(assert (=> b!1358270 (= e!770901 (contains!9386 Nil!31763 (select (arr!44647 a!3742) #b00000000000000000000000000000000)))))

(declare-fun bm!65262 () Bool)

(declare-fun call!65265 () Bool)

(declare-fun c!127087 () Bool)

(assert (=> bm!65262 (= call!65265 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!127087 (Cons!31762 (select (arr!44647 a!3742) #b00000000000000000000000000000000) Nil!31763) Nil!31763)))))

(declare-fun b!1358271 () Bool)

(declare-fun e!770903 () Bool)

(assert (=> b!1358271 (= e!770903 call!65265)))

(declare-fun b!1358272 () Bool)

(declare-fun e!770902 () Bool)

(declare-fun e!770900 () Bool)

(assert (=> b!1358272 (= e!770902 e!770900)))

(declare-fun res!902982 () Bool)

(assert (=> b!1358272 (=> (not res!902982) (not e!770900))))

(assert (=> b!1358272 (= res!902982 (not e!770901))))

(declare-fun res!902981 () Bool)

(assert (=> b!1358272 (=> (not res!902981) (not e!770901))))

(assert (=> b!1358272 (= res!902981 (validKeyInArray!0 (select (arr!44647 a!3742) #b00000000000000000000000000000000)))))

(declare-fun d!145277 () Bool)

(declare-fun res!902983 () Bool)

(assert (=> d!145277 (=> res!902983 e!770902)))

(assert (=> d!145277 (= res!902983 (bvsge #b00000000000000000000000000000000 (size!45199 a!3742)))))

(assert (=> d!145277 (= (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31763) e!770902)))

(declare-fun b!1358273 () Bool)

(assert (=> b!1358273 (= e!770903 call!65265)))

(declare-fun b!1358274 () Bool)

(assert (=> b!1358274 (= e!770900 e!770903)))

(assert (=> b!1358274 (= c!127087 (validKeyInArray!0 (select (arr!44647 a!3742) #b00000000000000000000000000000000)))))

(assert (= (and d!145277 (not res!902983)) b!1358272))

(assert (= (and b!1358272 res!902981) b!1358270))

(assert (= (and b!1358272 res!902982) b!1358274))

(assert (= (and b!1358274 c!127087) b!1358273))

(assert (= (and b!1358274 (not c!127087)) b!1358271))

(assert (= (or b!1358273 b!1358271) bm!65262))

(declare-fun m!1243421 () Bool)

(assert (=> b!1358270 m!1243421))

(assert (=> b!1358270 m!1243421))

(declare-fun m!1243423 () Bool)

(assert (=> b!1358270 m!1243423))

(assert (=> bm!65262 m!1243421))

(declare-fun m!1243427 () Bool)

(assert (=> bm!65262 m!1243427))

(assert (=> b!1358272 m!1243421))

(assert (=> b!1358272 m!1243421))

(declare-fun m!1243429 () Bool)

(assert (=> b!1358272 m!1243429))

(assert (=> b!1358274 m!1243421))

(assert (=> b!1358274 m!1243421))

(assert (=> b!1358274 m!1243429))

(assert (=> b!1358075 d!145277))

(check-sat (not b!1358179) (not b!1358274) (not b!1358212) (not b!1358264) (not d!145227) (not b!1358177) (not bm!65257) (not b!1358210) (not b!1358262) (not d!145233) (not b!1358190) (not b!1358272) (not b!1358260) (not b!1358222) (not d!145239) (not b!1358263) (not b!1358225) (not d!145225) (not bm!65262) (not b!1358270) (not b!1358221) (not d!145269) (not b!1358175) (not b!1358238) (not b!1358229) (not b!1358214) (not b!1358191) (not b!1358259) (not b!1358227) (not bm!65258) (not d!145259))
(check-sat)
