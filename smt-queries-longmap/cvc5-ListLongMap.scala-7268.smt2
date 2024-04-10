; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92790 () Bool)

(assert start!92790)

(declare-fun b!1054020 () Bool)

(declare-fun e!598729 () Bool)

(declare-fun e!598725 () Bool)

(assert (=> b!1054020 (= e!598729 e!598725)))

(declare-fun res!703007 () Bool)

(assert (=> b!1054020 (=> res!703007 e!598725)))

(declare-fun lt!465286 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1054020 (= res!703007 (bvsle lt!465286 i!1381))))

(declare-fun b!1054021 () Bool)

(declare-fun res!703010 () Bool)

(declare-fun e!598728 () Bool)

(assert (=> b!1054021 (=> (not res!703010) (not e!598728))))

(declare-datatypes ((array!66483 0))(
  ( (array!66484 (arr!31975 (Array (_ BitVec 32) (_ BitVec 64))) (size!32511 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66483)

(declare-datatypes ((List!22287 0))(
  ( (Nil!22284) (Cons!22283 (h!23492 (_ BitVec 64)) (t!31594 List!22287)) )
))
(declare-fun arrayNoDuplicates!0 (array!66483 (_ BitVec 32) List!22287) Bool)

(assert (=> b!1054021 (= res!703010 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22284))))

(declare-fun res!703003 () Bool)

(assert (=> start!92790 (=> (not res!703003) (not e!598728))))

(assert (=> start!92790 (= res!703003 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32511 a!3488)) (bvslt (size!32511 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92790 e!598728))

(assert (=> start!92790 true))

(declare-fun array_inv!24755 (array!66483) Bool)

(assert (=> start!92790 (array_inv!24755 a!3488)))

(declare-fun b!1054022 () Bool)

(declare-fun e!598727 () Bool)

(assert (=> b!1054022 (= e!598727 (or (bvslt lt!465286 #b00000000000000000000000000000000) (bvslt lt!465286 (size!32511 a!3488))))))

(assert (=> b!1054022 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22284)))

(declare-datatypes ((Unit!34508 0))(
  ( (Unit!34509) )
))
(declare-fun lt!465287 () Unit!34508)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66483 (_ BitVec 32) (_ BitVec 32)) Unit!34508)

(assert (=> b!1054022 (= lt!465287 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1054023 () Bool)

(declare-fun e!598726 () Bool)

(assert (=> b!1054023 (= e!598728 e!598726)))

(declare-fun res!703009 () Bool)

(assert (=> b!1054023 (=> (not res!703009) (not e!598726))))

(declare-fun lt!465288 () array!66483)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66483 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1054023 (= res!703009 (arrayContainsKey!0 lt!465288 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1054023 (= lt!465288 (array!66484 (store (arr!31975 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32511 a!3488)))))

(declare-fun b!1054024 () Bool)

(declare-fun e!598723 () Bool)

(assert (=> b!1054024 (= e!598726 e!598723)))

(declare-fun res!703004 () Bool)

(assert (=> b!1054024 (=> (not res!703004) (not e!598723))))

(assert (=> b!1054024 (= res!703004 (not (= lt!465286 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66483 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1054024 (= lt!465286 (arrayScanForKey!0 lt!465288 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1054025 () Bool)

(assert (=> b!1054025 (= e!598725 (arrayContainsKey!0 a!3488 k!2747 lt!465286))))

(declare-fun b!1054026 () Bool)

(declare-fun res!703002 () Bool)

(assert (=> b!1054026 (=> (not res!703002) (not e!598728))))

(assert (=> b!1054026 (= res!703002 (= (select (arr!31975 a!3488) i!1381) k!2747))))

(declare-fun b!1054027 () Bool)

(declare-fun res!703008 () Bool)

(assert (=> b!1054027 (=> (not res!703008) (not e!598728))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1054027 (= res!703008 (validKeyInArray!0 k!2747))))

(declare-fun b!1054028 () Bool)

(assert (=> b!1054028 (= e!598723 (not e!598727))))

(declare-fun res!703006 () Bool)

(assert (=> b!1054028 (=> res!703006 e!598727)))

(assert (=> b!1054028 (= res!703006 (bvsle lt!465286 i!1381))))

(assert (=> b!1054028 e!598729))

(declare-fun res!703005 () Bool)

(assert (=> b!1054028 (=> (not res!703005) (not e!598729))))

(assert (=> b!1054028 (= res!703005 (= (select (store (arr!31975 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465286) k!2747))))

(assert (= (and start!92790 res!703003) b!1054021))

(assert (= (and b!1054021 res!703010) b!1054027))

(assert (= (and b!1054027 res!703008) b!1054026))

(assert (= (and b!1054026 res!703002) b!1054023))

(assert (= (and b!1054023 res!703009) b!1054024))

(assert (= (and b!1054024 res!703004) b!1054028))

(assert (= (and b!1054028 res!703005) b!1054020))

(assert (= (and b!1054020 (not res!703007)) b!1054025))

(assert (= (and b!1054028 (not res!703006)) b!1054022))

(declare-fun m!974165 () Bool)

(assert (=> b!1054024 m!974165))

(declare-fun m!974167 () Bool)

(assert (=> start!92790 m!974167))

(declare-fun m!974169 () Bool)

(assert (=> b!1054022 m!974169))

(declare-fun m!974171 () Bool)

(assert (=> b!1054022 m!974171))

(declare-fun m!974173 () Bool)

(assert (=> b!1054027 m!974173))

(declare-fun m!974175 () Bool)

(assert (=> b!1054021 m!974175))

(declare-fun m!974177 () Bool)

(assert (=> b!1054025 m!974177))

(declare-fun m!974179 () Bool)

(assert (=> b!1054026 m!974179))

(declare-fun m!974181 () Bool)

(assert (=> b!1054023 m!974181))

(declare-fun m!974183 () Bool)

(assert (=> b!1054023 m!974183))

(assert (=> b!1054028 m!974183))

(declare-fun m!974185 () Bool)

(assert (=> b!1054028 m!974185))

(push 1)

(assert (not b!1054022))

(assert (not start!92790))

(assert (not b!1054021))

(assert (not b!1054023))

(assert (not b!1054024))

(assert (not b!1054027))

(assert (not b!1054025))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!127959 () Bool)

(assert (=> d!127959 (= (validKeyInArray!0 k!2747) (and (not (= k!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1054027 d!127959))

(declare-fun b!1054124 () Bool)

(declare-fun e!598809 () Bool)

(declare-fun contains!6172 (List!22287 (_ BitVec 64)) Bool)

(assert (=> b!1054124 (= e!598809 (contains!6172 Nil!22284 (select (arr!31975 a!3488) i!1381)))))

(declare-fun d!127961 () Bool)

(declare-fun res!703094 () Bool)

(declare-fun e!598808 () Bool)

(assert (=> d!127961 (=> res!703094 e!598808)))

(assert (=> d!127961 (= res!703094 (bvsge i!1381 (size!32511 a!3488)))))

(assert (=> d!127961 (= (arrayNoDuplicates!0 a!3488 i!1381 Nil!22284) e!598808)))

(declare-fun bm!44761 () Bool)

(declare-fun call!44764 () Bool)

(declare-fun c!106976 () Bool)

(assert (=> bm!44761 (= call!44764 (arrayNoDuplicates!0 a!3488 (bvadd i!1381 #b00000000000000000000000000000001) (ite c!106976 (Cons!22283 (select (arr!31975 a!3488) i!1381) Nil!22284) Nil!22284)))))

(declare-fun b!1054125 () Bool)

(declare-fun e!598806 () Bool)

(declare-fun e!598807 () Bool)

(assert (=> b!1054125 (= e!598806 e!598807)))

(assert (=> b!1054125 (= c!106976 (validKeyInArray!0 (select (arr!31975 a!3488) i!1381)))))

(declare-fun b!1054126 () Bool)

(assert (=> b!1054126 (= e!598808 e!598806)))

(declare-fun res!703092 () Bool)

(assert (=> b!1054126 (=> (not res!703092) (not e!598806))))

(assert (=> b!1054126 (= res!703092 (not e!598809))))

(declare-fun res!703093 () Bool)

(assert (=> b!1054126 (=> (not res!703093) (not e!598809))))

(assert (=> b!1054126 (= res!703093 (validKeyInArray!0 (select (arr!31975 a!3488) i!1381)))))

(declare-fun b!1054127 () Bool)

(assert (=> b!1054127 (= e!598807 call!44764)))

(declare-fun b!1054128 () Bool)

(assert (=> b!1054128 (= e!598807 call!44764)))

(assert (= (and d!127961 (not res!703094)) b!1054126))

(assert (= (and b!1054126 res!703093) b!1054124))

(assert (= (and b!1054126 res!703092) b!1054125))

(assert (= (and b!1054125 c!106976) b!1054127))

(assert (= (and b!1054125 (not c!106976)) b!1054128))

(assert (= (or b!1054127 b!1054128) bm!44761))

(assert (=> b!1054124 m!974179))

(assert (=> b!1054124 m!974179))

(declare-fun m!974251 () Bool)

(assert (=> b!1054124 m!974251))

(assert (=> bm!44761 m!974179))

(declare-fun m!974253 () Bool)

(assert (=> bm!44761 m!974253))

(assert (=> b!1054125 m!974179))

(assert (=> b!1054125 m!974179))

(declare-fun m!974255 () Bool)

(assert (=> b!1054125 m!974255))

(assert (=> b!1054126 m!974179))

(assert (=> b!1054126 m!974179))

(assert (=> b!1054126 m!974255))

(assert (=> b!1054022 d!127961))

(declare-fun d!127973 () Bool)

(assert (=> d!127973 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22284)))

(declare-fun lt!465312 () Unit!34508)

(declare-fun choose!39 (array!66483 (_ BitVec 32) (_ BitVec 32)) Unit!34508)

(assert (=> d!127973 (= lt!465312 (choose!39 a!3488 #b00000000000000000000000000000000 i!1381))))

(assert (=> d!127973 (bvslt (size!32511 a!3488) #b01111111111111111111111111111111)))

(assert (=> d!127973 (= (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381) lt!465312)))

(declare-fun bs!30886 () Bool)

(assert (= bs!30886 d!127973))

(assert (=> bs!30886 m!974169))

(declare-fun m!974267 () Bool)

(assert (=> bs!30886 m!974267))

(assert (=> b!1054022 d!127973))

(declare-fun d!127977 () Bool)

(declare-fun res!703110 () Bool)

(declare-fun e!598829 () Bool)

(assert (=> d!127977 (=> res!703110 e!598829)))

(assert (=> d!127977 (= res!703110 (= (select (arr!31975 lt!465288) #b00000000000000000000000000000000) k!2747))))

(assert (=> d!127977 (= (arrayContainsKey!0 lt!465288 k!2747 #b00000000000000000000000000000000) e!598829)))

(declare-fun b!1054152 () Bool)

(declare-fun e!598830 () Bool)

(assert (=> b!1054152 (= e!598829 e!598830)))

(declare-fun res!703111 () Bool)

(assert (=> b!1054152 (=> (not res!703111) (not e!598830))))

(assert (=> b!1054152 (= res!703111 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32511 lt!465288)))))

(declare-fun b!1054153 () Bool)

(assert (=> b!1054153 (= e!598830 (arrayContainsKey!0 lt!465288 k!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!127977 (not res!703110)) b!1054152))

(assert (= (and b!1054152 res!703111) b!1054153))

(declare-fun m!974271 () Bool)

(assert (=> d!127977 m!974271))

(declare-fun m!974273 () Bool)

(assert (=> b!1054153 m!974273))

(assert (=> b!1054023 d!127977))

(declare-fun d!127981 () Bool)

(declare-fun lt!465321 () (_ BitVec 32))

(assert (=> d!127981 (and (or (bvslt lt!465321 #b00000000000000000000000000000000) (bvsge lt!465321 (size!32511 lt!465288)) (and (bvsge lt!465321 #b00000000000000000000000000000000) (bvslt lt!465321 (size!32511 lt!465288)))) (bvsge lt!465321 #b00000000000000000000000000000000) (bvslt lt!465321 (size!32511 lt!465288)) (= (select (arr!31975 lt!465288) lt!465321) k!2747))))

(declare-fun e!598837 () (_ BitVec 32))

(assert (=> d!127981 (= lt!465321 e!598837)))

(declare-fun c!106984 () Bool)

(assert (=> d!127981 (= c!106984 (= (select (arr!31975 lt!465288) #b00000000000000000000000000000000) k!2747))))

(assert (=> d!127981 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32511 lt!465288)) (bvslt (size!32511 lt!465288) #b01111111111111111111111111111111))))

(assert (=> d!127981 (= (arrayScanForKey!0 lt!465288 k!2747 #b00000000000000000000000000000000) lt!465321)))

(declare-fun b!1054163 () Bool)

(assert (=> b!1054163 (= e!598837 #b00000000000000000000000000000000)))

(declare-fun b!1054164 () Bool)

(assert (=> b!1054164 (= e!598837 (arrayScanForKey!0 lt!465288 k!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!127981 c!106984) b!1054163))

(assert (= (and d!127981 (not c!106984)) b!1054164))

(declare-fun m!974283 () Bool)

(assert (=> d!127981 m!974283))

(assert (=> d!127981 m!974271))

(declare-fun m!974285 () Bool)

(assert (=> b!1054164 m!974285))

(assert (=> b!1054024 d!127981))

(declare-fun d!127987 () Bool)

(assert (=> d!127987 (= (array_inv!24755 a!3488) (bvsge (size!32511 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!92790 d!127987))

(declare-fun d!127989 () Bool)

(declare-fun res!703115 () Bool)

(declare-fun e!598838 () Bool)

(assert (=> d!127989 (=> res!703115 e!598838)))

(assert (=> d!127989 (= res!703115 (= (select (arr!31975 a!3488) lt!465286) k!2747))))

(assert (=> d!127989 (= (arrayContainsKey!0 a!3488 k!2747 lt!465286) e!598838)))

(declare-fun b!1054165 () Bool)

(declare-fun e!598839 () Bool)

(assert (=> b!1054165 (= e!598838 e!598839)))

(declare-fun res!703116 () Bool)

(assert (=> b!1054165 (=> (not res!703116) (not e!598839))))

(assert (=> b!1054165 (= res!703116 (bvslt (bvadd lt!465286 #b00000000000000000000000000000001) (size!32511 a!3488)))))

(declare-fun b!1054166 () Bool)

(assert (=> b!1054166 (= e!598839 (arrayContainsKey!0 a!3488 k!2747 (bvadd lt!465286 #b00000000000000000000000000000001)))))

(assert (= (and d!127989 (not res!703115)) b!1054165))

(assert (= (and b!1054165 res!703116) b!1054166))

(declare-fun m!974287 () Bool)

(assert (=> d!127989 m!974287))

(declare-fun m!974289 () Bool)

(assert (=> b!1054166 m!974289))

(assert (=> b!1054025 d!127989))

(declare-fun b!1054167 () Bool)

(declare-fun e!598843 () Bool)

(assert (=> b!1054167 (= e!598843 (contains!6172 Nil!22284 (select (arr!31975 a!3488) #b00000000000000000000000000000000)))))

(declare-fun d!127991 () Bool)

(declare-fun res!703119 () Bool)

(declare-fun e!598842 () Bool)

(assert (=> d!127991 (=> res!703119 e!598842)))

(assert (=> d!127991 (= res!703119 (bvsge #b00000000000000000000000000000000 (size!32511 a!3488)))))

(assert (=> d!127991 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22284) e!598842)))

(declare-fun bm!44766 () Bool)

(declare-fun call!44769 () Bool)

(declare-fun c!106985 () Bool)

(assert (=> bm!44766 (= call!44769 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106985 (Cons!22283 (select (arr!31975 a!3488) #b00000000000000000000000000000000) Nil!22284) Nil!22284)))))

(declare-fun b!1054168 () Bool)

(declare-fun e!598840 () Bool)

(declare-fun e!598841 () Bool)

(assert (=> b!1054168 (= e!598840 e!598841)))

(assert (=> b!1054168 (= c!106985 (validKeyInArray!0 (select (arr!31975 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1054169 () Bool)

(assert (=> b!1054169 (= e!598842 e!598840)))

(declare-fun res!703117 () Bool)

(assert (=> b!1054169 (=> (not res!703117) (not e!598840))))

(assert (=> b!1054169 (= res!703117 (not e!598843))))

(declare-fun res!703118 () Bool)

(assert (=> b!1054169 (=> (not res!703118) (not e!598843))))

(assert (=> b!1054169 (= res!703118 (validKeyInArray!0 (select (arr!31975 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1054170 () Bool)

(assert (=> b!1054170 (= e!598841 call!44769)))

(declare-fun b!1054171 () Bool)

(assert (=> b!1054171 (= e!598841 call!44769)))

(assert (= (and d!127991 (not res!703119)) b!1054169))

(assert (= (and b!1054169 res!703118) b!1054167))

(assert (= (and b!1054169 res!703117) b!1054168))

(assert (= (and b!1054168 c!106985) b!1054170))

(assert (= (and b!1054168 (not c!106985)) b!1054171))

(assert (= (or b!1054170 b!1054171) bm!44766))

(declare-fun m!974291 () Bool)

(assert (=> b!1054167 m!974291))

(assert (=> b!1054167 m!974291))

(declare-fun m!974293 () Bool)

(assert (=> b!1054167 m!974293))

(assert (=> bm!44766 m!974291))

(declare-fun m!974295 () Bool)

(assert (=> bm!44766 m!974295))

(assert (=> b!1054168 m!974291))

(assert (=> b!1054168 m!974291))

(declare-fun m!974297 () Bool)

(assert (=> b!1054168 m!974297))

(assert (=> b!1054169 m!974291))

(assert (=> b!1054169 m!974291))

(assert (=> b!1054169 m!974297))

(assert (=> b!1054021 d!127991))

(push 1)

(assert (not b!1054126))

(assert (not b!1054164))

(assert (not b!1054168))

(assert (not b!1054125))

(assert (not bm!44766))

(assert (not b!1054167))

(assert (not d!127973))

(assert (not bm!44761))

(assert (not b!1054169))

(assert (not b!1054166))

(assert (not b!1054124))

(assert (not b!1054153))

(check-sat)

(pop 1)

(push 1)

(check-sat)

