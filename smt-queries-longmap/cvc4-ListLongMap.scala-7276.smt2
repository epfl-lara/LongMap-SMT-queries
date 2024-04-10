; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92878 () Bool)

(assert start!92878)

(declare-fun b!1054824 () Bool)

(declare-fun res!703766 () Bool)

(declare-fun e!599355 () Bool)

(assert (=> b!1054824 (=> (not res!703766) (not e!599355))))

(declare-datatypes ((array!66538 0))(
  ( (array!66539 (arr!32001 (Array (_ BitVec 32) (_ BitVec 64))) (size!32537 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66538)

(declare-datatypes ((List!22313 0))(
  ( (Nil!22310) (Cons!22309 (h!23518 (_ BitVec 64)) (t!31620 List!22313)) )
))
(declare-fun arrayNoDuplicates!0 (array!66538 (_ BitVec 32) List!22313) Bool)

(assert (=> b!1054824 (= res!703766 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22310))))

(declare-fun b!1054825 () Bool)

(declare-fun e!599353 () Bool)

(declare-fun e!599356 () Bool)

(assert (=> b!1054825 (= e!599353 (not e!599356))))

(declare-fun res!703772 () Bool)

(assert (=> b!1054825 (=> res!703772 e!599356)))

(declare-fun lt!465574 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1054825 (= res!703772 (bvsle lt!465574 i!1381))))

(declare-fun e!599352 () Bool)

(assert (=> b!1054825 e!599352))

(declare-fun res!703770 () Bool)

(assert (=> b!1054825 (=> (not res!703770) (not e!599352))))

(declare-fun k!2747 () (_ BitVec 64))

(assert (=> b!1054825 (= res!703770 (= (select (store (arr!32001 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465574) k!2747))))

(declare-fun e!599354 () Bool)

(declare-fun b!1054826 () Bool)

(declare-fun arrayContainsKey!0 (array!66538 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1054826 (= e!599354 (arrayContainsKey!0 a!3488 k!2747 lt!465574))))

(declare-fun b!1054827 () Bool)

(declare-fun res!703764 () Bool)

(assert (=> b!1054827 (=> (not res!703764) (not e!599355))))

(assert (=> b!1054827 (= res!703764 (= (select (arr!32001 a!3488) i!1381) k!2747))))

(declare-fun b!1054828 () Bool)

(declare-fun res!703771 () Bool)

(assert (=> b!1054828 (=> (not res!703771) (not e!599355))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1054828 (= res!703771 (validKeyInArray!0 k!2747))))

(declare-fun b!1054830 () Bool)

(assert (=> b!1054830 (= e!599352 e!599354)))

(declare-fun res!703769 () Bool)

(assert (=> b!1054830 (=> res!703769 e!599354)))

(assert (=> b!1054830 (= res!703769 (bvsle lt!465574 i!1381))))

(declare-fun b!1054831 () Bool)

(declare-fun e!599351 () Bool)

(assert (=> b!1054831 (= e!599351 e!599353)))

(declare-fun res!703765 () Bool)

(assert (=> b!1054831 (=> (not res!703765) (not e!599353))))

(assert (=> b!1054831 (= res!703765 (not (= lt!465574 i!1381)))))

(declare-fun lt!465573 () array!66538)

(declare-fun arrayScanForKey!0 (array!66538 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1054831 (= lt!465574 (arrayScanForKey!0 lt!465573 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1054832 () Bool)

(assert (=> b!1054832 (= e!599355 e!599351)))

(declare-fun res!703768 () Bool)

(assert (=> b!1054832 (=> (not res!703768) (not e!599351))))

(assert (=> b!1054832 (= res!703768 (arrayContainsKey!0 lt!465573 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1054832 (= lt!465573 (array!66539 (store (arr!32001 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32537 a!3488)))))

(declare-fun b!1054829 () Bool)

(assert (=> b!1054829 (= e!599356 (bvslt (bvadd #b00000000000000000000000000000001 i!1381) (size!32537 a!3488)))))

(assert (=> b!1054829 (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34560 0))(
  ( (Unit!34561) )
))
(declare-fun lt!465576 () Unit!34560)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66538 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34560)

(assert (=> b!1054829 (= lt!465576 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 lt!465574 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1054829 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22310)))

(declare-fun lt!465575 () Unit!34560)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66538 (_ BitVec 32) (_ BitVec 32)) Unit!34560)

(assert (=> b!1054829 (= lt!465575 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun res!703767 () Bool)

(assert (=> start!92878 (=> (not res!703767) (not e!599355))))

(assert (=> start!92878 (= res!703767 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32537 a!3488)) (bvslt (size!32537 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92878 e!599355))

(assert (=> start!92878 true))

(declare-fun array_inv!24781 (array!66538) Bool)

(assert (=> start!92878 (array_inv!24781 a!3488)))

(assert (= (and start!92878 res!703767) b!1054824))

(assert (= (and b!1054824 res!703766) b!1054828))

(assert (= (and b!1054828 res!703771) b!1054827))

(assert (= (and b!1054827 res!703764) b!1054832))

(assert (= (and b!1054832 res!703768) b!1054831))

(assert (= (and b!1054831 res!703765) b!1054825))

(assert (= (and b!1054825 res!703770) b!1054830))

(assert (= (and b!1054830 (not res!703769)) b!1054826))

(assert (= (and b!1054825 (not res!703772)) b!1054829))

(declare-fun m!974865 () Bool)

(assert (=> b!1054831 m!974865))

(declare-fun m!974867 () Bool)

(assert (=> b!1054828 m!974867))

(declare-fun m!974869 () Bool)

(assert (=> start!92878 m!974869))

(declare-fun m!974871 () Bool)

(assert (=> b!1054826 m!974871))

(declare-fun m!974873 () Bool)

(assert (=> b!1054827 m!974873))

(declare-fun m!974875 () Bool)

(assert (=> b!1054824 m!974875))

(declare-fun m!974877 () Bool)

(assert (=> b!1054829 m!974877))

(declare-fun m!974879 () Bool)

(assert (=> b!1054829 m!974879))

(declare-fun m!974881 () Bool)

(assert (=> b!1054829 m!974881))

(declare-fun m!974883 () Bool)

(assert (=> b!1054829 m!974883))

(declare-fun m!974885 () Bool)

(assert (=> b!1054825 m!974885))

(declare-fun m!974887 () Bool)

(assert (=> b!1054825 m!974887))

(declare-fun m!974889 () Bool)

(assert (=> b!1054832 m!974889))

(assert (=> b!1054832 m!974885))

(push 1)

(assert (not start!92878))

(assert (not b!1054832))

(assert (not b!1054826))

(assert (not b!1054829))

(assert (not b!1054831))

(assert (not b!1054828))

(assert (not b!1054824))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!128035 () Bool)

(assert (=> d!128035 (= (validKeyInArray!0 k!2747) (and (not (= k!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1054828 d!128035))

(declare-fun bm!44776 () Bool)

(declare-fun call!44779 () Bool)

(declare-fun c!107000 () Bool)

(assert (=> bm!44776 (= call!44779 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107000 (Cons!22309 (select (arr!32001 a!3488) #b00000000000000000000000000000000) Nil!22310) Nil!22310)))))

(declare-fun b!1054891 () Bool)

(declare-fun e!599406 () Bool)

(declare-fun e!599408 () Bool)

(assert (=> b!1054891 (= e!599406 e!599408)))

(assert (=> b!1054891 (= c!107000 (validKeyInArray!0 (select (arr!32001 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1054892 () Bool)

(declare-fun e!599405 () Bool)

(declare-fun contains!6175 (List!22313 (_ BitVec 64)) Bool)

(assert (=> b!1054892 (= e!599405 (contains!6175 Nil!22310 (select (arr!32001 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1054893 () Bool)

(declare-fun e!599407 () Bool)

(assert (=> b!1054893 (= e!599407 e!599406)))

(declare-fun res!703813 () Bool)

(assert (=> b!1054893 (=> (not res!703813) (not e!599406))))

(assert (=> b!1054893 (= res!703813 (not e!599405))))

(declare-fun res!703812 () Bool)

(assert (=> b!1054893 (=> (not res!703812) (not e!599405))))

(assert (=> b!1054893 (= res!703812 (validKeyInArray!0 (select (arr!32001 a!3488) #b00000000000000000000000000000000)))))

(declare-fun d!128037 () Bool)

(declare-fun res!703811 () Bool)

(assert (=> d!128037 (=> res!703811 e!599407)))

(assert (=> d!128037 (= res!703811 (bvsge #b00000000000000000000000000000000 (size!32537 a!3488)))))

(assert (=> d!128037 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22310) e!599407)))

(declare-fun b!1054894 () Bool)

(assert (=> b!1054894 (= e!599408 call!44779)))

(declare-fun b!1054895 () Bool)

(assert (=> b!1054895 (= e!599408 call!44779)))

(assert (= (and d!128037 (not res!703811)) b!1054893))

(assert (= (and b!1054893 res!703812) b!1054892))

(assert (= (and b!1054893 res!703813) b!1054891))

(assert (= (and b!1054891 c!107000) b!1054895))

(assert (= (and b!1054891 (not c!107000)) b!1054894))

(assert (= (or b!1054895 b!1054894) bm!44776))

(declare-fun m!974923 () Bool)

(assert (=> bm!44776 m!974923))

(declare-fun m!974925 () Bool)

(assert (=> bm!44776 m!974925))

(assert (=> b!1054891 m!974923))

(assert (=> b!1054891 m!974923))

(declare-fun m!974927 () Bool)

(assert (=> b!1054891 m!974927))

(assert (=> b!1054892 m!974923))

(assert (=> b!1054892 m!974923))

(declare-fun m!974933 () Bool)

(assert (=> b!1054892 m!974933))

(assert (=> b!1054893 m!974923))

(assert (=> b!1054893 m!974923))

(assert (=> b!1054893 m!974927))

(assert (=> b!1054824 d!128037))

(declare-fun d!128045 () Bool)

(declare-fun res!703825 () Bool)

(declare-fun e!599422 () Bool)

(assert (=> d!128045 (=> res!703825 e!599422)))

(assert (=> d!128045 (= res!703825 (= (select (arr!32001 a!3488) (bvadd #b00000000000000000000000000000001 i!1381)) k!2747))))

(assert (=> d!128045 (= (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381)) e!599422)))

(declare-fun b!1054911 () Bool)

(declare-fun e!599423 () Bool)

(assert (=> b!1054911 (= e!599422 e!599423)))

(declare-fun res!703826 () Bool)

(assert (=> b!1054911 (=> (not res!703826) (not e!599423))))

(assert (=> b!1054911 (= res!703826 (bvslt (bvadd #b00000000000000000000000000000001 i!1381 #b00000000000000000000000000000001) (size!32537 a!3488)))))

(declare-fun b!1054912 () Bool)

(assert (=> b!1054912 (= e!599423 (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381 #b00000000000000000000000000000001)))))

(assert (= (and d!128045 (not res!703825)) b!1054911))

(assert (= (and b!1054911 res!703826) b!1054912))

(declare-fun m!974949 () Bool)

(assert (=> d!128045 m!974949))

(declare-fun m!974951 () Bool)

(assert (=> b!1054912 m!974951))

(assert (=> b!1054829 d!128045))

(declare-fun d!128053 () Bool)

(assert (=> d!128053 (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-fun lt!465594 () Unit!34560)

(declare-fun choose!114 (array!66538 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34560)

(assert (=> d!128053 (= lt!465594 (choose!114 a!3488 k!2747 lt!465574 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> d!128053 (bvsge lt!465574 #b00000000000000000000000000000000)))

(assert (=> d!128053 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 lt!465574 (bvadd #b00000000000000000000000000000001 i!1381)) lt!465594)))

(declare-fun bs!30917 () Bool)

(assert (= bs!30917 d!128053))

(assert (=> bs!30917 m!974877))

(declare-fun m!974967 () Bool)

(assert (=> bs!30917 m!974967))

(assert (=> b!1054829 d!128053))

(declare-fun bm!44779 () Bool)

(declare-fun call!44782 () Bool)

(declare-fun c!107004 () Bool)

(assert (=> bm!44779 (= call!44782 (arrayNoDuplicates!0 a!3488 (bvadd i!1381 #b00000000000000000000000000000001) (ite c!107004 (Cons!22309 (select (arr!32001 a!3488) i!1381) Nil!22310) Nil!22310)))))

(declare-fun b!1054920 () Bool)

(declare-fun e!599431 () Bool)

(declare-fun e!599433 () Bool)

(assert (=> b!1054920 (= e!599431 e!599433)))

(assert (=> b!1054920 (= c!107004 (validKeyInArray!0 (select (arr!32001 a!3488) i!1381)))))

(declare-fun b!1054921 () Bool)

(declare-fun e!599430 () Bool)

(assert (=> b!1054921 (= e!599430 (contains!6175 Nil!22310 (select (arr!32001 a!3488) i!1381)))))

(declare-fun b!1054922 () Bool)

(declare-fun e!599432 () Bool)

(assert (=> b!1054922 (= e!599432 e!599431)))

(declare-fun res!703834 () Bool)

(assert (=> b!1054922 (=> (not res!703834) (not e!599431))))

(assert (=> b!1054922 (= res!703834 (not e!599430))))

(declare-fun res!703833 () Bool)

(assert (=> b!1054922 (=> (not res!703833) (not e!599430))))

(assert (=> b!1054922 (= res!703833 (validKeyInArray!0 (select (arr!32001 a!3488) i!1381)))))

(declare-fun d!128061 () Bool)

(declare-fun res!703832 () Bool)

(assert (=> d!128061 (=> res!703832 e!599432)))

(assert (=> d!128061 (= res!703832 (bvsge i!1381 (size!32537 a!3488)))))

(assert (=> d!128061 (= (arrayNoDuplicates!0 a!3488 i!1381 Nil!22310) e!599432)))

(declare-fun b!1054923 () Bool)

(assert (=> b!1054923 (= e!599433 call!44782)))

(declare-fun b!1054924 () Bool)

(assert (=> b!1054924 (= e!599433 call!44782)))

(assert (= (and d!128061 (not res!703832)) b!1054922))

(assert (= (and b!1054922 res!703833) b!1054921))

(assert (= (and b!1054922 res!703834) b!1054920))

(assert (= (and b!1054920 c!107004) b!1054924))

(assert (= (and b!1054920 (not c!107004)) b!1054923))

(assert (= (or b!1054924 b!1054923) bm!44779))

(assert (=> bm!44779 m!974873))

(declare-fun m!974969 () Bool)

(assert (=> bm!44779 m!974969))

(assert (=> b!1054920 m!974873))

(assert (=> b!1054920 m!974873))

(declare-fun m!974971 () Bool)

(assert (=> b!1054920 m!974971))

(assert (=> b!1054921 m!974873))

(assert (=> b!1054921 m!974873))

(declare-fun m!974973 () Bool)

(assert (=> b!1054921 m!974973))

(assert (=> b!1054922 m!974873))

(assert (=> b!1054922 m!974873))

(assert (=> b!1054922 m!974971))

(assert (=> b!1054829 d!128061))

(declare-fun d!128065 () Bool)

(assert (=> d!128065 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22310)))

(declare-fun lt!465597 () Unit!34560)

(declare-fun choose!39 (array!66538 (_ BitVec 32) (_ BitVec 32)) Unit!34560)

(assert (=> d!128065 (= lt!465597 (choose!39 a!3488 #b00000000000000000000000000000000 i!1381))))

(assert (=> d!128065 (bvslt (size!32537 a!3488) #b01111111111111111111111111111111)))

(assert (=> d!128065 (= (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381) lt!465597)))

(declare-fun bs!30918 () Bool)

(assert (= bs!30918 d!128065))

(assert (=> bs!30918 m!974881))

(declare-fun m!974975 () Bool)

(assert (=> bs!30918 m!974975))

(assert (=> b!1054829 d!128065))

(declare-fun d!128069 () Bool)

(declare-fun lt!465603 () (_ BitVec 32))

(assert (=> d!128069 (and (or (bvslt lt!465603 #b00000000000000000000000000000000) (bvsge lt!465603 (size!32537 lt!465573)) (and (bvsge lt!465603 #b00000000000000000000000000000000) (bvslt lt!465603 (size!32537 lt!465573)))) (bvsge lt!465603 #b00000000000000000000000000000000) (bvslt lt!465603 (size!32537 lt!465573)) (= (select (arr!32001 lt!465573) lt!465603) k!2747))))

(declare-fun e!599439 () (_ BitVec 32))

(assert (=> d!128069 (= lt!465603 e!599439)))

(declare-fun c!107010 () Bool)

(assert (=> d!128069 (= c!107010 (= (select (arr!32001 lt!465573) #b00000000000000000000000000000000) k!2747))))

(assert (=> d!128069 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32537 lt!465573)) (bvslt (size!32537 lt!465573) #b01111111111111111111111111111111))))

(assert (=> d!128069 (= (arrayScanForKey!0 lt!465573 k!2747 #b00000000000000000000000000000000) lt!465603)))

(declare-fun b!1054935 () Bool)

(assert (=> b!1054935 (= e!599439 #b00000000000000000000000000000000)))

(declare-fun b!1054936 () Bool)

(assert (=> b!1054936 (= e!599439 (arrayScanForKey!0 lt!465573 k!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128069 c!107010) b!1054935))

(assert (= (and d!128069 (not c!107010)) b!1054936))

(declare-fun m!974981 () Bool)

(assert (=> d!128069 m!974981))

(declare-fun m!974983 () Bool)

(assert (=> d!128069 m!974983))

(declare-fun m!974985 () Bool)

(assert (=> b!1054936 m!974985))

(assert (=> b!1054831 d!128069))

(declare-fun d!128071 () Bool)

(assert (=> d!128071 (= (array_inv!24781 a!3488) (bvsge (size!32537 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!92878 d!128071))

(declare-fun d!128073 () Bool)

(declare-fun res!703835 () Bool)

(declare-fun e!599440 () Bool)

(assert (=> d!128073 (=> res!703835 e!599440)))

(assert (=> d!128073 (= res!703835 (= (select (arr!32001 lt!465573) #b00000000000000000000000000000000) k!2747))))

(assert (=> d!128073 (= (arrayContainsKey!0 lt!465573 k!2747 #b00000000000000000000000000000000) e!599440)))

(declare-fun b!1054937 () Bool)

(declare-fun e!599441 () Bool)

(assert (=> b!1054937 (= e!599440 e!599441)))

(declare-fun res!703836 () Bool)

(assert (=> b!1054937 (=> (not res!703836) (not e!599441))))

(assert (=> b!1054937 (= res!703836 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32537 lt!465573)))))

(declare-fun b!1054938 () Bool)

(assert (=> b!1054938 (= e!599441 (arrayContainsKey!0 lt!465573 k!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128073 (not res!703835)) b!1054937))

(assert (= (and b!1054937 res!703836) b!1054938))

(assert (=> d!128073 m!974983))

(declare-fun m!974987 () Bool)

(assert (=> b!1054938 m!974987))

(assert (=> b!1054832 d!128073))

(declare-fun d!128075 () Bool)

(declare-fun res!703837 () Bool)

(declare-fun e!599442 () Bool)

(assert (=> d!128075 (=> res!703837 e!599442)))

(assert (=> d!128075 (= res!703837 (= (select (arr!32001 a!3488) lt!465574) k!2747))))

(assert (=> d!128075 (= (arrayContainsKey!0 a!3488 k!2747 lt!465574) e!599442)))

(declare-fun b!1054939 () Bool)

(declare-fun e!599443 () Bool)

(assert (=> b!1054939 (= e!599442 e!599443)))

(declare-fun res!703838 () Bool)

(assert (=> b!1054939 (=> (not res!703838) (not e!599443))))

(assert (=> b!1054939 (= res!703838 (bvslt (bvadd lt!465574 #b00000000000000000000000000000001) (size!32537 a!3488)))))

(declare-fun b!1054940 () Bool)

(assert (=> b!1054940 (= e!599443 (arrayContainsKey!0 a!3488 k!2747 (bvadd lt!465574 #b00000000000000000000000000000001)))))

(assert (= (and d!128075 (not res!703837)) b!1054939))

(assert (= (and b!1054939 res!703838) b!1054940))

(declare-fun m!974989 () Bool)

(assert (=> d!128075 m!974989))

(declare-fun m!974991 () Bool)

(assert (=> b!1054940 m!974991))

(assert (=> b!1054826 d!128075))

(push 1)

(assert (not d!128053))

(assert (not b!1054891))

(assert (not b!1054938))

(assert (not bm!44776))

(assert (not b!1054912))

(assert (not d!128065))

(assert (not b!1054922))

(assert (not b!1054893))

(assert (not b!1054940))

(assert (not b!1054921))

(assert (not bm!44779))

(assert (not b!1054920))

(assert (not b!1054892))

(assert (not b!1054936))

(check-sat)

(pop 1)

(push 1)

(check-sat)

