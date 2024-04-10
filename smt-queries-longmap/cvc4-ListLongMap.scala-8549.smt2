; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104348 () Bool)

(assert start!104348)

(declare-fun res!831407 () Bool)

(declare-fun e!706588 () Bool)

(assert (=> start!104348 (=> (not res!831407) (not e!706588))))

(declare-datatypes ((array!80212 0))(
  ( (array!80213 (arr!38686 (Array (_ BitVec 32) (_ BitVec 64))) (size!39222 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80212)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104348 (= res!831407 (and (bvslt (size!39222 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39222 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39222 a!3892))))))

(assert (=> start!104348 e!706588))

(declare-fun array_inv!29534 (array!80212) Bool)

(assert (=> start!104348 (array_inv!29534 a!3892)))

(assert (=> start!104348 true))

(declare-fun b!1245996 () Bool)

(declare-fun res!831411 () Bool)

(declare-fun e!706587 () Bool)

(assert (=> b!1245996 (=> (not res!831411) (not e!706587))))

(declare-datatypes ((List!27489 0))(
  ( (Nil!27486) (Cons!27485 (h!28694 (_ BitVec 64)) (t!40958 List!27489)) )
))
(declare-fun lt!563001 () List!27489)

(declare-fun contains!7455 (List!27489 (_ BitVec 64)) Bool)

(assert (=> b!1245996 (= res!831411 (not (contains!7455 lt!563001 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1245997 () Bool)

(declare-fun res!831403 () Bool)

(assert (=> b!1245997 (=> (not res!831403) (not e!706587))))

(assert (=> b!1245997 (= res!831403 (not (contains!7455 lt!563001 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1245998 () Bool)

(declare-fun res!831406 () Bool)

(assert (=> b!1245998 (=> (not res!831406) (not e!706587))))

(assert (=> b!1245998 (= res!831406 (not (contains!7455 Nil!27486 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1245999 () Bool)

(declare-fun res!831410 () Bool)

(assert (=> b!1245999 (=> (not res!831410) (not e!706588))))

(assert (=> b!1245999 (= res!831410 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39222 a!3892)) (not (= newFrom!287 (size!39222 a!3892)))))))

(declare-fun b!1246000 () Bool)

(declare-fun res!831405 () Bool)

(assert (=> b!1246000 (=> (not res!831405) (not e!706588))))

(declare-fun arrayNoDuplicates!0 (array!80212 (_ BitVec 32) List!27489) Bool)

(assert (=> b!1246000 (= res!831405 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27486))))

(declare-fun b!1246001 () Bool)

(declare-fun res!831404 () Bool)

(assert (=> b!1246001 (=> (not res!831404) (not e!706587))))

(declare-fun noDuplicate!2034 (List!27489) Bool)

(assert (=> b!1246001 (= res!831404 (noDuplicate!2034 lt!563001))))

(declare-fun b!1246002 () Bool)

(declare-fun subseq!655 (List!27489 List!27489) Bool)

(assert (=> b!1246002 (= e!706587 (not (subseq!655 Nil!27486 lt!563001)))))

(declare-fun b!1246003 () Bool)

(declare-fun res!831408 () Bool)

(assert (=> b!1246003 (=> (not res!831408) (not e!706588))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1246003 (= res!831408 (validKeyInArray!0 (select (arr!38686 a!3892) from!3270)))))

(declare-fun b!1246004 () Bool)

(assert (=> b!1246004 (= e!706588 e!706587)))

(declare-fun res!831409 () Bool)

(assert (=> b!1246004 (=> (not res!831409) (not e!706587))))

(assert (=> b!1246004 (= res!831409 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(assert (=> b!1246004 (= lt!563001 (Cons!27485 (select (arr!38686 a!3892) from!3270) Nil!27486))))

(declare-fun b!1246005 () Bool)

(declare-fun res!831412 () Bool)

(assert (=> b!1246005 (=> (not res!831412) (not e!706587))))

(assert (=> b!1246005 (= res!831412 (not (contains!7455 Nil!27486 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!104348 res!831407) b!1246000))

(assert (= (and b!1246000 res!831405) b!1245999))

(assert (= (and b!1245999 res!831410) b!1246003))

(assert (= (and b!1246003 res!831408) b!1246004))

(assert (= (and b!1246004 res!831409) b!1246001))

(assert (= (and b!1246001 res!831404) b!1245996))

(assert (= (and b!1245996 res!831411) b!1245997))

(assert (= (and b!1245997 res!831403) b!1245998))

(assert (= (and b!1245998 res!831406) b!1246005))

(assert (= (and b!1246005 res!831412) b!1246002))

(declare-fun m!1147929 () Bool)

(assert (=> b!1245998 m!1147929))

(declare-fun m!1147931 () Bool)

(assert (=> b!1246003 m!1147931))

(assert (=> b!1246003 m!1147931))

(declare-fun m!1147933 () Bool)

(assert (=> b!1246003 m!1147933))

(declare-fun m!1147935 () Bool)

(assert (=> b!1245996 m!1147935))

(declare-fun m!1147937 () Bool)

(assert (=> b!1245997 m!1147937))

(declare-fun m!1147939 () Bool)

(assert (=> b!1246000 m!1147939))

(declare-fun m!1147941 () Bool)

(assert (=> b!1246005 m!1147941))

(assert (=> b!1246004 m!1147931))

(declare-fun m!1147943 () Bool)

(assert (=> b!1246001 m!1147943))

(declare-fun m!1147945 () Bool)

(assert (=> b!1246002 m!1147945))

(declare-fun m!1147947 () Bool)

(assert (=> start!104348 m!1147947))

(push 1)

(assert (not start!104348))

(assert (not b!1246005))

(assert (not b!1245997))

(assert (not b!1246003))

(assert (not b!1245998))

(assert (not b!1246000))

(assert (not b!1246002))

(assert (not b!1246001))

(assert (not b!1245996))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1246053 () Bool)

(declare-fun e!706632 () Bool)

(declare-fun call!61512 () Bool)

(assert (=> b!1246053 (= e!706632 call!61512)))

(declare-fun b!1246054 () Bool)

(declare-fun e!706633 () Bool)

(declare-fun e!706634 () Bool)

(assert (=> b!1246054 (= e!706633 e!706634)))

(declare-fun res!831450 () Bool)

(assert (=> b!1246054 (=> (not res!831450) (not e!706634))))

(declare-fun e!706635 () Bool)

(assert (=> b!1246054 (= res!831450 (not e!706635))))

(declare-fun res!831452 () Bool)

(assert (=> b!1246054 (=> (not res!831452) (not e!706635))))

(assert (=> b!1246054 (= res!831452 (validKeyInArray!0 (select (arr!38686 a!3892) from!3270)))))

(declare-fun b!1246055 () Bool)

(assert (=> b!1246055 (= e!706632 call!61512)))

(declare-fun b!1246056 () Bool)

(assert (=> b!1246056 (= e!706635 (contains!7455 Nil!27486 (select (arr!38686 a!3892) from!3270)))))

(declare-fun b!1246057 () Bool)

(assert (=> b!1246057 (= e!706634 e!706632)))

(declare-fun c!121986 () Bool)

(assert (=> b!1246057 (= c!121986 (validKeyInArray!0 (select (arr!38686 a!3892) from!3270)))))

(declare-fun bm!61509 () Bool)

(assert (=> bm!61509 (= call!61512 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!121986 (Cons!27485 (select (arr!38686 a!3892) from!3270) Nil!27486) Nil!27486)))))

(declare-fun d!137529 () Bool)

(declare-fun res!831451 () Bool)

(assert (=> d!137529 (=> res!831451 e!706633)))

(assert (=> d!137529 (= res!831451 (bvsge from!3270 (size!39222 a!3892)))))

(assert (=> d!137529 (= (arrayNoDuplicates!0 a!3892 from!3270 Nil!27486) e!706633)))

(assert (= (and d!137529 (not res!831451)) b!1246054))

(assert (= (and b!1246054 res!831452) b!1246056))

(assert (= (and b!1246054 res!831450) b!1246057))

(assert (= (and b!1246057 c!121986) b!1246053))

(assert (= (and b!1246057 (not c!121986)) b!1246055))

(assert (= (or b!1246053 b!1246055) bm!61509))

(assert (=> b!1246054 m!1147931))

(assert (=> b!1246054 m!1147931))

(assert (=> b!1246054 m!1147933))

(assert (=> b!1246056 m!1147931))

(assert (=> b!1246056 m!1147931))

(declare-fun m!1147979 () Bool)

(assert (=> b!1246056 m!1147979))

(assert (=> b!1246057 m!1147931))

(assert (=> b!1246057 m!1147931))

(assert (=> b!1246057 m!1147933))

(assert (=> bm!61509 m!1147931))

(declare-fun m!1147981 () Bool)

(assert (=> bm!61509 m!1147981))

(assert (=> b!1246000 d!137529))

(declare-fun d!137543 () Bool)

(declare-fun lt!563013 () Bool)

(declare-fun content!629 (List!27489) (Set (_ BitVec 64)))

(assert (=> d!137543 (= lt!563013 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!629 Nil!27486)))))

(declare-fun e!706654 () Bool)

(assert (=> d!137543 (= lt!563013 e!706654)))

(declare-fun res!831471 () Bool)

(assert (=> d!137543 (=> (not res!831471) (not e!706654))))

(assert (=> d!137543 (= res!831471 (is-Cons!27485 Nil!27486))))

(assert (=> d!137543 (= (contains!7455 Nil!27486 #b1000000000000000000000000000000000000000000000000000000000000000) lt!563013)))

(declare-fun b!1246076 () Bool)

(declare-fun e!706655 () Bool)

(assert (=> b!1246076 (= e!706654 e!706655)))

(declare-fun res!831472 () Bool)

(assert (=> b!1246076 (=> res!831472 e!706655)))

(assert (=> b!1246076 (= res!831472 (= (h!28694 Nil!27486) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1246077 () Bool)

(assert (=> b!1246077 (= e!706655 (contains!7455 (t!40958 Nil!27486) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137543 res!831471) b!1246076))

(assert (= (and b!1246076 (not res!831472)) b!1246077))

(declare-fun m!1147991 () Bool)

(assert (=> d!137543 m!1147991))

(declare-fun m!1147995 () Bool)

(assert (=> d!137543 m!1147995))

(declare-fun m!1147997 () Bool)

(assert (=> b!1246077 m!1147997))

(assert (=> b!1246005 d!137543))

(declare-fun d!137551 () Bool)

(declare-fun lt!563014 () Bool)

(assert (=> d!137551 (= lt!563014 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!629 lt!563001)))))

(declare-fun e!706664 () Bool)

(assert (=> d!137551 (= lt!563014 e!706664)))

(declare-fun res!831481 () Bool)

(assert (=> d!137551 (=> (not res!831481) (not e!706664))))

(assert (=> d!137551 (= res!831481 (is-Cons!27485 lt!563001))))

(assert (=> d!137551 (= (contains!7455 lt!563001 #b0000000000000000000000000000000000000000000000000000000000000000) lt!563014)))

(declare-fun b!1246084 () Bool)

(declare-fun e!706665 () Bool)

(assert (=> b!1246084 (= e!706664 e!706665)))

(declare-fun res!831482 () Bool)

(assert (=> b!1246084 (=> res!831482 e!706665)))

(assert (=> b!1246084 (= res!831482 (= (h!28694 lt!563001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1246085 () Bool)

(assert (=> b!1246085 (= e!706665 (contains!7455 (t!40958 lt!563001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137551 res!831481) b!1246084))

(assert (= (and b!1246084 (not res!831482)) b!1246085))

(declare-fun m!1147999 () Bool)

(assert (=> d!137551 m!1147999))

(declare-fun m!1148001 () Bool)

(assert (=> d!137551 m!1148001))

(declare-fun m!1148003 () Bool)

(assert (=> b!1246085 m!1148003))

(assert (=> b!1245996 d!137551))

(declare-fun d!137553 () Bool)

(declare-fun res!831493 () Bool)

(declare-fun e!706676 () Bool)

(assert (=> d!137553 (=> res!831493 e!706676)))

(assert (=> d!137553 (= res!831493 (is-Nil!27486 lt!563001))))

(assert (=> d!137553 (= (noDuplicate!2034 lt!563001) e!706676)))

(declare-fun b!1246098 () Bool)

(declare-fun e!706677 () Bool)

(assert (=> b!1246098 (= e!706676 e!706677)))

(declare-fun res!831494 () Bool)

(assert (=> b!1246098 (=> (not res!831494) (not e!706677))))

(assert (=> b!1246098 (= res!831494 (not (contains!7455 (t!40958 lt!563001) (h!28694 lt!563001))))))

(declare-fun b!1246099 () Bool)

(assert (=> b!1246099 (= e!706677 (noDuplicate!2034 (t!40958 lt!563001)))))

(assert (= (and d!137553 (not res!831493)) b!1246098))

(assert (= (and b!1246098 res!831494) b!1246099))

(declare-fun m!1148013 () Bool)

(assert (=> b!1246098 m!1148013))

(declare-fun m!1148015 () Bool)

(assert (=> b!1246099 m!1148015))

(assert (=> b!1246001 d!137553))

(declare-fun d!137561 () Bool)

(assert (=> d!137561 (= (array_inv!29534 a!3892) (bvsge (size!39222 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!104348 d!137561))

(declare-fun d!137563 () Bool)

(declare-fun lt!563016 () Bool)

(assert (=> d!137563 (= lt!563016 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!629 lt!563001)))))

(declare-fun e!706684 () Bool)

(assert (=> d!137563 (= lt!563016 e!706684)))

(declare-fun res!831501 () Bool)

(assert (=> d!137563 (=> (not res!831501) (not e!706684))))

(assert (=> d!137563 (= res!831501 (is-Cons!27485 lt!563001))))

(assert (=> d!137563 (= (contains!7455 lt!563001 #b1000000000000000000000000000000000000000000000000000000000000000) lt!563016)))

(declare-fun b!1246106 () Bool)

