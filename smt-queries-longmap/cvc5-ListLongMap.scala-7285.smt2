; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93072 () Bool)

(assert start!93072)

(declare-fun b!1055969 () Bool)

(declare-fun e!600239 () Bool)

(declare-fun e!600238 () Bool)

(assert (=> b!1055969 (= e!600239 e!600238)))

(declare-fun res!704785 () Bool)

(assert (=> b!1055969 (=> (not res!704785) (not e!600238))))

(declare-fun lt!466007 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1055969 (= res!704785 (not (= lt!466007 i!1381)))))

(declare-datatypes ((array!66597 0))(
  ( (array!66598 (arr!32026 (Array (_ BitVec 32) (_ BitVec 64))) (size!32562 (_ BitVec 32))) )
))
(declare-fun lt!466008 () array!66597)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66597 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1055969 (= lt!466007 (arrayScanForKey!0 lt!466008 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1055970 () Bool)

(declare-fun e!600241 () Bool)

(assert (=> b!1055970 (= e!600238 (not e!600241))))

(declare-fun res!704784 () Bool)

(assert (=> b!1055970 (=> res!704784 e!600241)))

(assert (=> b!1055970 (= res!704784 (or (bvsgt lt!466007 i!1381) (bvsle i!1381 lt!466007)))))

(declare-fun a!3488 () array!66597)

(assert (=> b!1055970 (= (select (store (arr!32026 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466007) k!2747)))

(declare-fun b!1055971 () Bool)

(declare-fun res!704788 () Bool)

(declare-fun e!600240 () Bool)

(assert (=> b!1055971 (=> (not res!704788) (not e!600240))))

(assert (=> b!1055971 (= res!704788 (= (select (arr!32026 a!3488) i!1381) k!2747))))

(declare-fun b!1055972 () Bool)

(assert (=> b!1055972 (= e!600240 e!600239)))

(declare-fun res!704787 () Bool)

(assert (=> b!1055972 (=> (not res!704787) (not e!600239))))

(declare-fun arrayContainsKey!0 (array!66597 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1055972 (= res!704787 (arrayContainsKey!0 lt!466008 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1055972 (= lt!466008 (array!66598 (store (arr!32026 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32562 a!3488)))))

(declare-fun b!1055973 () Bool)

(assert (=> b!1055973 (= e!600241 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun res!704786 () Bool)

(assert (=> start!93072 (=> (not res!704786) (not e!600240))))

(assert (=> start!93072 (= res!704786 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32562 a!3488)) (bvslt (size!32562 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93072 e!600240))

(assert (=> start!93072 true))

(declare-fun array_inv!24806 (array!66597) Bool)

(assert (=> start!93072 (array_inv!24806 a!3488)))

(declare-fun b!1055974 () Bool)

(declare-fun res!704783 () Bool)

(assert (=> b!1055974 (=> (not res!704783) (not e!600240))))

(declare-datatypes ((List!22338 0))(
  ( (Nil!22335) (Cons!22334 (h!23543 (_ BitVec 64)) (t!31645 List!22338)) )
))
(declare-fun arrayNoDuplicates!0 (array!66597 (_ BitVec 32) List!22338) Bool)

(assert (=> b!1055974 (= res!704783 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22335))))

(declare-fun b!1055975 () Bool)

(declare-fun res!704789 () Bool)

(assert (=> b!1055975 (=> (not res!704789) (not e!600240))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1055975 (= res!704789 (validKeyInArray!0 k!2747))))

(assert (= (and start!93072 res!704786) b!1055974))

(assert (= (and b!1055974 res!704783) b!1055975))

(assert (= (and b!1055975 res!704789) b!1055971))

(assert (= (and b!1055971 res!704788) b!1055972))

(assert (= (and b!1055972 res!704787) b!1055969))

(assert (= (and b!1055969 res!704785) b!1055970))

(assert (= (and b!1055970 (not res!704784)) b!1055973))

(declare-fun m!975953 () Bool)

(assert (=> b!1055971 m!975953))

(declare-fun m!975955 () Bool)

(assert (=> b!1055969 m!975955))

(declare-fun m!975957 () Bool)

(assert (=> start!93072 m!975957))

(declare-fun m!975959 () Bool)

(assert (=> b!1055974 m!975959))

(declare-fun m!975961 () Bool)

(assert (=> b!1055973 m!975961))

(declare-fun m!975963 () Bool)

(assert (=> b!1055972 m!975963))

(declare-fun m!975965 () Bool)

(assert (=> b!1055972 m!975965))

(declare-fun m!975967 () Bool)

(assert (=> b!1055975 m!975967))

(assert (=> b!1055970 m!975965))

(declare-fun m!975969 () Bool)

(assert (=> b!1055970 m!975969))

(push 1)

(assert (not b!1055969))

(assert (not b!1055975))

(assert (not b!1055972))

(assert (not start!93072))

(assert (not b!1055974))

(assert (not b!1055973))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!128241 () Bool)

(assert (=> d!128241 (= (array_inv!24806 a!3488) (bvsge (size!32562 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!93072 d!128241))

(declare-fun d!128243 () Bool)

(declare-fun lt!466023 () (_ BitVec 32))

(assert (=> d!128243 (and (or (bvslt lt!466023 #b00000000000000000000000000000000) (bvsge lt!466023 (size!32562 lt!466008)) (and (bvsge lt!466023 #b00000000000000000000000000000000) (bvslt lt!466023 (size!32562 lt!466008)))) (bvsge lt!466023 #b00000000000000000000000000000000) (bvslt lt!466023 (size!32562 lt!466008)) (= (select (arr!32026 lt!466008) lt!466023) k!2747))))

(declare-fun e!600292 () (_ BitVec 32))

(assert (=> d!128243 (= lt!466023 e!600292)))

(declare-fun c!107058 () Bool)

(assert (=> d!128243 (= c!107058 (= (select (arr!32026 lt!466008) #b00000000000000000000000000000000) k!2747))))

(assert (=> d!128243 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32562 lt!466008)) (bvslt (size!32562 lt!466008) #b01111111111111111111111111111111))))

(assert (=> d!128243 (= (arrayScanForKey!0 lt!466008 k!2747 #b00000000000000000000000000000000) lt!466023)))

(declare-fun b!1056043 () Bool)

(assert (=> b!1056043 (= e!600292 #b00000000000000000000000000000000)))

(declare-fun b!1056044 () Bool)

(assert (=> b!1056044 (= e!600292 (arrayScanForKey!0 lt!466008 k!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128243 c!107058) b!1056043))

(assert (= (and d!128243 (not c!107058)) b!1056044))

(declare-fun m!976017 () Bool)

(assert (=> d!128243 m!976017))

(declare-fun m!976019 () Bool)

(assert (=> d!128243 m!976019))

(declare-fun m!976021 () Bool)

(assert (=> b!1056044 m!976021))

(assert (=> b!1055969 d!128243))

(declare-fun d!128251 () Bool)

(assert (=> d!128251 (= (validKeyInArray!0 k!2747) (and (not (= k!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1055975 d!128251))

(declare-fun d!128253 () Bool)

(declare-fun res!704862 () Bool)

(declare-fun e!600314 () Bool)

(assert (=> d!128253 (=> res!704862 e!600314)))

(assert (=> d!128253 (= res!704862 (= (select (arr!32026 a!3488) i!1381) k!2747))))

(assert (=> d!128253 (= (arrayContainsKey!0 a!3488 k!2747 i!1381) e!600314)))

(declare-fun b!1056072 () Bool)

(declare-fun e!600315 () Bool)

(assert (=> b!1056072 (= e!600314 e!600315)))

(declare-fun res!704863 () Bool)

(assert (=> b!1056072 (=> (not res!704863) (not e!600315))))

(assert (=> b!1056072 (= res!704863 (bvslt (bvadd i!1381 #b00000000000000000000000000000001) (size!32562 a!3488)))))

(declare-fun b!1056073 () Bool)

(assert (=> b!1056073 (= e!600315 (arrayContainsKey!0 a!3488 k!2747 (bvadd i!1381 #b00000000000000000000000000000001)))))

(assert (= (and d!128253 (not res!704862)) b!1056072))

(assert (= (and b!1056072 res!704863) b!1056073))

(assert (=> d!128253 m!975953))

(declare-fun m!976032 () Bool)

(assert (=> b!1056073 m!976032))

(assert (=> b!1055973 d!128253))

(declare-fun b!1056090 () Bool)

(declare-fun e!600333 () Bool)

(declare-fun e!600330 () Bool)

(assert (=> b!1056090 (= e!600333 e!600330)))

(declare-fun res!704878 () Bool)

(assert (=> b!1056090 (=> (not res!704878) (not e!600330))))

(declare-fun e!600332 () Bool)

(assert (=> b!1056090 (= res!704878 (not e!600332))))

(declare-fun res!704876 () Bool)

(assert (=> b!1056090 (=> (not res!704876) (not e!600332))))

(assert (=> b!1056090 (= res!704876 (validKeyInArray!0 (select (arr!32026 a!3488) #b00000000000000000000000000000000)))))

(declare-fun d!128259 () Bool)

(declare-fun res!704877 () Bool)

(assert (=> d!128259 (=> res!704877 e!600333)))

(assert (=> d!128259 (= res!704877 (bvsge #b00000000000000000000000000000000 (size!32562 a!3488)))))

(assert (=> d!128259 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22335) e!600333)))

(declare-fun bm!44812 () Bool)

(declare-fun call!44815 () Bool)

(declare-fun c!107067 () Bool)

(assert (=> bm!44812 (= call!44815 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107067 (Cons!22334 (select (arr!32026 a!3488) #b00000000000000000000000000000000) Nil!22335) Nil!22335)))))

(declare-fun b!1056091 () Bool)

(declare-fun e!600331 () Bool)

(assert (=> b!1056091 (= e!600331 call!44815)))

(declare-fun b!1056092 () Bool)

(assert (=> b!1056092 (= e!600330 e!600331)))

(assert (=> b!1056092 (= c!107067 (validKeyInArray!0 (select (arr!32026 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1056093 () Bool)

(assert (=> b!1056093 (= e!600331 call!44815)))

(declare-fun b!1056094 () Bool)

(declare-fun contains!6191 (List!22338 (_ BitVec 64)) Bool)

(assert (=> b!1056094 (= e!600332 (contains!6191 Nil!22335 (select (arr!32026 a!3488) #b00000000000000000000000000000000)))))

(assert (= (and d!128259 (not res!704877)) b!1056090))

(assert (= (and b!1056090 res!704876) b!1056094))

(assert (= (and b!1056090 res!704878) b!1056092))

(assert (= (and b!1056092 c!107067) b!1056091))

(assert (= (and b!1056092 (not c!107067)) b!1056093))

(assert (= (or b!1056091 b!1056093) bm!44812))

(declare-fun m!976045 () Bool)

(assert (=> b!1056090 m!976045))

(assert (=> b!1056090 m!976045))

(declare-fun m!976047 () Bool)

(assert (=> b!1056090 m!976047))

(assert (=> bm!44812 m!976045))

(declare-fun m!976049 () Bool)

(assert (=> bm!44812 m!976049))

(assert (=> b!1056092 m!976045))

