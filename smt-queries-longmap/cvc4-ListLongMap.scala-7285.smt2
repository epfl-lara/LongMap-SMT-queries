; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93076 () Bool)

(assert start!93076)

(declare-fun b!1056011 () Bool)

(declare-fun res!704827 () Bool)

(declare-fun e!600270 () Bool)

(assert (=> b!1056011 (=> (not res!704827) (not e!600270))))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1056011 (= res!704827 (validKeyInArray!0 k!2747))))

(declare-fun res!704829 () Bool)

(assert (=> start!93076 (=> (not res!704829) (not e!600270))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66601 0))(
  ( (array!66602 (arr!32028 (Array (_ BitVec 32) (_ BitVec 64))) (size!32564 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66601)

(assert (=> start!93076 (= res!704829 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32564 a!3488)) (bvslt (size!32564 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93076 e!600270))

(assert (=> start!93076 true))

(declare-fun array_inv!24808 (array!66601) Bool)

(assert (=> start!93076 (array_inv!24808 a!3488)))

(declare-fun b!1056012 () Bool)

(declare-fun e!600267 () Bool)

(assert (=> b!1056012 (= e!600270 e!600267)))

(declare-fun res!704825 () Bool)

(assert (=> b!1056012 (=> (not res!704825) (not e!600267))))

(declare-fun lt!466020 () array!66601)

(declare-fun arrayContainsKey!0 (array!66601 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1056012 (= res!704825 (arrayContainsKey!0 lt!466020 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1056012 (= lt!466020 (array!66602 (store (arr!32028 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32564 a!3488)))))

(declare-fun b!1056013 () Bool)

(declare-fun e!600269 () Bool)

(declare-fun e!600268 () Bool)

(assert (=> b!1056013 (= e!600269 (not e!600268))))

(declare-fun res!704830 () Bool)

(assert (=> b!1056013 (=> res!704830 e!600268)))

(declare-fun lt!466019 () (_ BitVec 32))

(assert (=> b!1056013 (= res!704830 (or (bvsgt lt!466019 i!1381) (bvsle i!1381 lt!466019)))))

(assert (=> b!1056013 (= (select (store (arr!32028 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466019) k!2747)))

(declare-fun b!1056014 () Bool)

(declare-fun res!704826 () Bool)

(assert (=> b!1056014 (=> (not res!704826) (not e!600270))))

(declare-datatypes ((List!22340 0))(
  ( (Nil!22337) (Cons!22336 (h!23545 (_ BitVec 64)) (t!31647 List!22340)) )
))
(declare-fun arrayNoDuplicates!0 (array!66601 (_ BitVec 32) List!22340) Bool)

(assert (=> b!1056014 (= res!704826 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22337))))

(declare-fun b!1056015 () Bool)

(assert (=> b!1056015 (= e!600268 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1056016 () Bool)

(assert (=> b!1056016 (= e!600267 e!600269)))

(declare-fun res!704828 () Bool)

(assert (=> b!1056016 (=> (not res!704828) (not e!600269))))

(assert (=> b!1056016 (= res!704828 (not (= lt!466019 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66601 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1056016 (= lt!466019 (arrayScanForKey!0 lt!466020 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1056017 () Bool)

(declare-fun res!704831 () Bool)

(assert (=> b!1056017 (=> (not res!704831) (not e!600270))))

(assert (=> b!1056017 (= res!704831 (= (select (arr!32028 a!3488) i!1381) k!2747))))

(assert (= (and start!93076 res!704829) b!1056014))

(assert (= (and b!1056014 res!704826) b!1056011))

(assert (= (and b!1056011 res!704827) b!1056017))

(assert (= (and b!1056017 res!704831) b!1056012))

(assert (= (and b!1056012 res!704825) b!1056016))

(assert (= (and b!1056016 res!704828) b!1056013))

(assert (= (and b!1056013 (not res!704830)) b!1056015))

(declare-fun m!975989 () Bool)

(assert (=> start!93076 m!975989))

(declare-fun m!975991 () Bool)

(assert (=> b!1056017 m!975991))

(declare-fun m!975993 () Bool)

(assert (=> b!1056016 m!975993))

(declare-fun m!975995 () Bool)

(assert (=> b!1056014 m!975995))

(declare-fun m!975997 () Bool)

(assert (=> b!1056013 m!975997))

(declare-fun m!975999 () Bool)

(assert (=> b!1056013 m!975999))

(declare-fun m!976001 () Bool)

(assert (=> b!1056011 m!976001))

(declare-fun m!976003 () Bool)

(assert (=> b!1056012 m!976003))

(assert (=> b!1056012 m!975997))

(declare-fun m!976005 () Bool)

(assert (=> b!1056015 m!976005))

(push 1)

(assert (not b!1056012))

(assert (not b!1056011))

(assert (not b!1056015))

(assert (not b!1056016))

(assert (not b!1056014))

(assert (not start!93076))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1056065 () Bool)

(declare-fun e!600308 () Bool)

(declare-fun call!44812 () Bool)

(assert (=> b!1056065 (= e!600308 call!44812)))

(declare-fun d!128249 () Bool)

(declare-fun res!704857 () Bool)

(declare-fun e!600309 () Bool)

(assert (=> d!128249 (=> res!704857 e!600309)))

(assert (=> d!128249 (= res!704857 (bvsge #b00000000000000000000000000000000 (size!32564 a!3488)))))

(assert (=> d!128249 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22337) e!600309)))

(declare-fun bm!44809 () Bool)

(declare-fun c!107064 () Bool)

(assert (=> bm!44809 (= call!44812 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107064 (Cons!22336 (select (arr!32028 a!3488) #b00000000000000000000000000000000) Nil!22337) Nil!22337)))))

(declare-fun b!1056066 () Bool)

(assert (=> b!1056066 (= e!600308 call!44812)))

(declare-fun b!1056067 () Bool)

(declare-fun e!600311 () Bool)

(assert (=> b!1056067 (= e!600311 e!600308)))

(assert (=> b!1056067 (= c!107064 (validKeyInArray!0 (select (arr!32028 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1056068 () Bool)

(assert (=> b!1056068 (= e!600309 e!600311)))

(declare-fun res!704858 () Bool)

(assert (=> b!1056068 (=> (not res!704858) (not e!600311))))

(declare-fun e!600310 () Bool)

(assert (=> b!1056068 (= res!704858 (not e!600310))))

(declare-fun res!704859 () Bool)

(assert (=> b!1056068 (=> (not res!704859) (not e!600310))))

(assert (=> b!1056068 (= res!704859 (validKeyInArray!0 (select (arr!32028 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1056069 () Bool)

(declare-fun contains!6190 (List!22340 (_ BitVec 64)) Bool)

(assert (=> b!1056069 (= e!600310 (contains!6190 Nil!22337 (select (arr!32028 a!3488) #b00000000000000000000000000000000)))))

(assert (= (and d!128249 (not res!704857)) b!1056068))

(assert (= (and b!1056068 res!704859) b!1056069))

(assert (= (and b!1056068 res!704858) b!1056067))

(assert (= (and b!1056067 c!107064) b!1056066))

(assert (= (and b!1056067 (not c!107064)) b!1056065))

(assert (= (or b!1056066 b!1056065) bm!44809))

(declare-fun m!976033 () Bool)

(assert (=> bm!44809 m!976033))

(declare-fun m!976035 () Bool)

(assert (=> bm!44809 m!976035))

(assert (=> b!1056067 m!976033))

(assert (=> b!1056067 m!976033))

(declare-fun m!976037 () Bool)

(assert (=> b!1056067 m!976037))

(assert (=> b!1056068 m!976033))

(assert (=> b!1056068 m!976033))

(assert (=> b!1056068 m!976037))

(assert (=> b!1056069 m!976033))

(assert (=> b!1056069 m!976033))

(declare-fun m!976039 () Bool)

(assert (=> b!1056069 m!976039))

(assert (=> b!1056014 d!128249))

