; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103964 () Bool)

(assert start!103964)

(declare-fun b!1244358 () Bool)

(declare-fun e!705314 () Bool)

(declare-datatypes ((List!27489 0))(
  ( (Nil!27486) (Cons!27485 (h!28694 (_ BitVec 64)) (t!40949 List!27489)) )
))
(declare-fun noDuplicate!2023 (List!27489) Bool)

(assert (=> b!1244358 (= e!705314 (noDuplicate!2023 Nil!27486))))

(declare-fun b!1244359 () Bool)

(declare-fun res!830049 () Bool)

(declare-fun e!705312 () Bool)

(assert (=> b!1244359 (=> (not res!830049) (not e!705312))))

(declare-datatypes ((array!79982 0))(
  ( (array!79983 (arr!38585 (Array (_ BitVec 32) (_ BitVec 64))) (size!39123 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!79982)

(declare-fun from!3270 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79982 (_ BitVec 32) List!27489) Bool)

(assert (=> b!1244359 (= res!830049 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27486))))

(declare-fun b!1244360 () Bool)

(declare-datatypes ((Unit!41223 0))(
  ( (Unit!41224) )
))
(declare-fun e!705311 () Unit!41223)

(declare-fun lt!562565 () Unit!41223)

(assert (=> b!1244360 (= e!705311 lt!562565)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79982 List!27489 List!27489 (_ BitVec 32)) Unit!41223)

(assert (=> b!1244360 (= lt!562565 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27485 (select (arr!38585 a!3892) from!3270) Nil!27486) Nil!27486 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> b!1244360 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27486)))

(declare-fun b!1244361 () Bool)

(declare-fun e!705315 () Bool)

(assert (=> b!1244361 (= e!705315 (not e!705314))))

(declare-fun res!830047 () Bool)

(assert (=> b!1244361 (=> res!830047 e!705314)))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1244361 (= res!830047 (bvslt newFrom!287 #b00000000000000000000000000000000))))

(assert (=> b!1244361 (arrayNoDuplicates!0 a!3892 newFrom!287 Nil!27486)))

(declare-fun lt!562564 () Unit!41223)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!79982 (_ BitVec 32) (_ BitVec 32)) Unit!41223)

(assert (=> b!1244361 (= lt!562564 (lemmaNoDuplicateFromThenFromBigger!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) newFrom!287))))

(declare-fun b!1244362 () Bool)

(declare-fun res!830050 () Bool)

(assert (=> b!1244362 (=> (not res!830050) (not e!705315))))

(assert (=> b!1244362 (= res!830050 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27486))))

(declare-fun res!830052 () Bool)

(assert (=> start!103964 (=> (not res!830052) (not e!705312))))

(assert (=> start!103964 (= res!830052 (and (bvslt (size!39123 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39123 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39123 a!3892))))))

(assert (=> start!103964 e!705312))

(declare-fun array_inv!29568 (array!79982) Bool)

(assert (=> start!103964 (array_inv!29568 a!3892)))

(assert (=> start!103964 true))

(declare-fun b!1244363 () Bool)

(declare-fun Unit!41225 () Unit!41223)

(assert (=> b!1244363 (= e!705311 Unit!41225)))

(declare-fun b!1244364 () Bool)

(assert (=> b!1244364 (= e!705312 e!705315)))

(declare-fun res!830051 () Bool)

(assert (=> b!1244364 (=> (not res!830051) (not e!705315))))

(assert (=> b!1244364 (= res!830051 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvsge newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun lt!562566 () Unit!41223)

(assert (=> b!1244364 (= lt!562566 e!705311)))

(declare-fun c!121843 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1244364 (= c!121843 (validKeyInArray!0 (select (arr!38585 a!3892) from!3270)))))

(declare-fun b!1244365 () Bool)

(declare-fun res!830048 () Bool)

(assert (=> b!1244365 (=> (not res!830048) (not e!705312))))

(assert (=> b!1244365 (= res!830048 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39123 a!3892)) (not (= newFrom!287 (size!39123 a!3892)))))))

(assert (= (and start!103964 res!830052) b!1244359))

(assert (= (and b!1244359 res!830049) b!1244365))

(assert (= (and b!1244365 res!830048) b!1244364))

(assert (= (and b!1244364 c!121843) b!1244360))

(assert (= (and b!1244364 (not c!121843)) b!1244363))

(assert (= (and b!1244364 res!830051) b!1244362))

(assert (= (and b!1244362 res!830050) b!1244361))

(assert (= (and b!1244361 (not res!830047)) b!1244358))

(declare-fun m!1146189 () Bool)

(assert (=> b!1244364 m!1146189))

(assert (=> b!1244364 m!1146189))

(declare-fun m!1146191 () Bool)

(assert (=> b!1244364 m!1146191))

(declare-fun m!1146193 () Bool)

(assert (=> b!1244359 m!1146193))

(declare-fun m!1146195 () Bool)

(assert (=> start!103964 m!1146195))

(assert (=> b!1244360 m!1146189))

(declare-fun m!1146197 () Bool)

(assert (=> b!1244360 m!1146197))

(declare-fun m!1146199 () Bool)

(assert (=> b!1244360 m!1146199))

(declare-fun m!1146201 () Bool)

(assert (=> b!1244361 m!1146201))

(declare-fun m!1146203 () Bool)

(assert (=> b!1244361 m!1146203))

(declare-fun m!1146205 () Bool)

(assert (=> b!1244358 m!1146205))

(assert (=> b!1244362 m!1146199))

(check-sat (not b!1244358) (not b!1244359) (not b!1244360) (not b!1244364) (not start!103964) (not b!1244361) (not b!1244362))
(check-sat)
(get-model)

(declare-fun d!136987 () Bool)

(assert (=> d!136987 (= (validKeyInArray!0 (select (arr!38585 a!3892) from!3270)) (and (not (= (select (arr!38585 a!3892) from!3270) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38585 a!3892) from!3270) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1244364 d!136987))

(declare-fun call!61392 () Bool)

(declare-fun c!121852 () Bool)

(declare-fun bm!61389 () Bool)

(assert (=> bm!61389 (= call!61392 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!121852 (Cons!27485 (select (arr!38585 a!3892) from!3270) Nil!27486) Nil!27486)))))

(declare-fun b!1244424 () Bool)

(declare-fun e!705355 () Bool)

(assert (=> b!1244424 (= e!705355 call!61392)))

(declare-fun b!1244425 () Bool)

(assert (=> b!1244425 (= e!705355 call!61392)))

(declare-fun d!136989 () Bool)

(declare-fun res!830097 () Bool)

(declare-fun e!705357 () Bool)

(assert (=> d!136989 (=> res!830097 e!705357)))

(assert (=> d!136989 (= res!830097 (bvsge from!3270 (size!39123 a!3892)))))

(assert (=> d!136989 (= (arrayNoDuplicates!0 a!3892 from!3270 Nil!27486) e!705357)))

(declare-fun b!1244426 () Bool)

(declare-fun e!705356 () Bool)

(assert (=> b!1244426 (= e!705357 e!705356)))

(declare-fun res!830096 () Bool)

(assert (=> b!1244426 (=> (not res!830096) (not e!705356))))

(declare-fun e!705354 () Bool)

(assert (=> b!1244426 (= res!830096 (not e!705354))))

(declare-fun res!830095 () Bool)

(assert (=> b!1244426 (=> (not res!830095) (not e!705354))))

(assert (=> b!1244426 (= res!830095 (validKeyInArray!0 (select (arr!38585 a!3892) from!3270)))))

(declare-fun b!1244427 () Bool)

(declare-fun contains!7398 (List!27489 (_ BitVec 64)) Bool)

(assert (=> b!1244427 (= e!705354 (contains!7398 Nil!27486 (select (arr!38585 a!3892) from!3270)))))

(declare-fun b!1244428 () Bool)

(assert (=> b!1244428 (= e!705356 e!705355)))

(assert (=> b!1244428 (= c!121852 (validKeyInArray!0 (select (arr!38585 a!3892) from!3270)))))

(assert (= (and d!136989 (not res!830097)) b!1244426))

(assert (= (and b!1244426 res!830095) b!1244427))

(assert (= (and b!1244426 res!830096) b!1244428))

(assert (= (and b!1244428 c!121852) b!1244425))

(assert (= (and b!1244428 (not c!121852)) b!1244424))

(assert (= (or b!1244425 b!1244424) bm!61389))

(assert (=> bm!61389 m!1146189))

(declare-fun m!1146243 () Bool)

(assert (=> bm!61389 m!1146243))

(assert (=> b!1244426 m!1146189))

(assert (=> b!1244426 m!1146189))

(assert (=> b!1244426 m!1146191))

(assert (=> b!1244427 m!1146189))

(assert (=> b!1244427 m!1146189))

(declare-fun m!1146245 () Bool)

(assert (=> b!1244427 m!1146245))

(assert (=> b!1244428 m!1146189))

(assert (=> b!1244428 m!1146189))

(assert (=> b!1244428 m!1146191))

(assert (=> b!1244359 d!136989))

(declare-fun d!136991 () Bool)

(declare-fun res!830102 () Bool)

(declare-fun e!705362 () Bool)

(assert (=> d!136991 (=> res!830102 e!705362)))

(get-info :version)

(assert (=> d!136991 (= res!830102 ((_ is Nil!27486) Nil!27486))))

(assert (=> d!136991 (= (noDuplicate!2023 Nil!27486) e!705362)))

(declare-fun b!1244433 () Bool)

(declare-fun e!705363 () Bool)

(assert (=> b!1244433 (= e!705362 e!705363)))

(declare-fun res!830103 () Bool)

(assert (=> b!1244433 (=> (not res!830103) (not e!705363))))

(assert (=> b!1244433 (= res!830103 (not (contains!7398 (t!40949 Nil!27486) (h!28694 Nil!27486))))))

(declare-fun b!1244434 () Bool)

(assert (=> b!1244434 (= e!705363 (noDuplicate!2023 (t!40949 Nil!27486)))))

(assert (= (and d!136991 (not res!830102)) b!1244433))

(assert (= (and b!1244433 res!830103) b!1244434))

(declare-fun m!1146247 () Bool)

(assert (=> b!1244433 m!1146247))

(declare-fun m!1146249 () Bool)

(assert (=> b!1244434 m!1146249))

(assert (=> b!1244358 d!136991))

(declare-fun call!61393 () Bool)

(declare-fun c!121853 () Bool)

(declare-fun bm!61390 () Bool)

(assert (=> bm!61390 (= call!61393 (arrayNoDuplicates!0 a!3892 (bvadd newFrom!287 #b00000000000000000000000000000001) (ite c!121853 (Cons!27485 (select (arr!38585 a!3892) newFrom!287) Nil!27486) Nil!27486)))))

(declare-fun b!1244439 () Bool)

(declare-fun e!705369 () Bool)

(assert (=> b!1244439 (= e!705369 call!61393)))

(declare-fun b!1244440 () Bool)

(assert (=> b!1244440 (= e!705369 call!61393)))

(declare-fun d!136995 () Bool)

(declare-fun res!830110 () Bool)

(declare-fun e!705371 () Bool)

(assert (=> d!136995 (=> res!830110 e!705371)))

(assert (=> d!136995 (= res!830110 (bvsge newFrom!287 (size!39123 a!3892)))))

(assert (=> d!136995 (= (arrayNoDuplicates!0 a!3892 newFrom!287 Nil!27486) e!705371)))

(declare-fun b!1244441 () Bool)

(declare-fun e!705370 () Bool)

(assert (=> b!1244441 (= e!705371 e!705370)))

(declare-fun res!830109 () Bool)

(assert (=> b!1244441 (=> (not res!830109) (not e!705370))))

(declare-fun e!705368 () Bool)

(assert (=> b!1244441 (= res!830109 (not e!705368))))

(declare-fun res!830108 () Bool)

(assert (=> b!1244441 (=> (not res!830108) (not e!705368))))

(assert (=> b!1244441 (= res!830108 (validKeyInArray!0 (select (arr!38585 a!3892) newFrom!287)))))

(declare-fun b!1244442 () Bool)

(assert (=> b!1244442 (= e!705368 (contains!7398 Nil!27486 (select (arr!38585 a!3892) newFrom!287)))))

(declare-fun b!1244443 () Bool)

(assert (=> b!1244443 (= e!705370 e!705369)))

(assert (=> b!1244443 (= c!121853 (validKeyInArray!0 (select (arr!38585 a!3892) newFrom!287)))))

(assert (= (and d!136995 (not res!830110)) b!1244441))

(assert (= (and b!1244441 res!830108) b!1244442))

(assert (= (and b!1244441 res!830109) b!1244443))

(assert (= (and b!1244443 c!121853) b!1244440))

(assert (= (and b!1244443 (not c!121853)) b!1244439))

(assert (= (or b!1244440 b!1244439) bm!61390))

(declare-fun m!1146251 () Bool)

(assert (=> bm!61390 m!1146251))

(declare-fun m!1146253 () Bool)

(assert (=> bm!61390 m!1146253))

(assert (=> b!1244441 m!1146251))

(assert (=> b!1244441 m!1146251))

(declare-fun m!1146255 () Bool)

(assert (=> b!1244441 m!1146255))

(assert (=> b!1244442 m!1146251))

(assert (=> b!1244442 m!1146251))

(declare-fun m!1146257 () Bool)

(assert (=> b!1244442 m!1146257))

(assert (=> b!1244443 m!1146251))

(assert (=> b!1244443 m!1146251))

(assert (=> b!1244443 m!1146255))

(assert (=> b!1244361 d!136995))

(declare-fun d!136997 () Bool)

(assert (=> d!136997 (arrayNoDuplicates!0 a!3892 newFrom!287 Nil!27486)))

(declare-fun lt!562587 () Unit!41223)

(declare-fun choose!39 (array!79982 (_ BitVec 32) (_ BitVec 32)) Unit!41223)

(assert (=> d!136997 (= lt!562587 (choose!39 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) newFrom!287))))

(assert (=> d!136997 (bvslt (size!39123 a!3892) #b01111111111111111111111111111111)))

(assert (=> d!136997 (= (lemmaNoDuplicateFromThenFromBigger!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) newFrom!287) lt!562587)))

(declare-fun bs!35011 () Bool)

(assert (= bs!35011 d!136997))

(assert (=> bs!35011 m!1146201))

(declare-fun m!1146263 () Bool)

(assert (=> bs!35011 m!1146263))

(assert (=> b!1244361 d!136997))

(declare-fun c!121854 () Bool)

(declare-fun bm!61391 () Bool)

(declare-fun call!61394 () Bool)

(assert (=> bm!61391 (= call!61394 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270 #b00000000000000000000000000000001) (ite c!121854 (Cons!27485 (select (arr!38585 a!3892) (bvadd #b00000000000000000000000000000001 from!3270)) Nil!27486) Nil!27486)))))

(declare-fun b!1244446 () Bool)

(declare-fun e!705375 () Bool)

(assert (=> b!1244446 (= e!705375 call!61394)))

(declare-fun b!1244447 () Bool)

(assert (=> b!1244447 (= e!705375 call!61394)))

(declare-fun d!137007 () Bool)

(declare-fun res!830115 () Bool)

(declare-fun e!705377 () Bool)

(assert (=> d!137007 (=> res!830115 e!705377)))

(assert (=> d!137007 (= res!830115 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) (size!39123 a!3892)))))

(assert (=> d!137007 (= (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27486) e!705377)))

(declare-fun b!1244448 () Bool)

(declare-fun e!705376 () Bool)

(assert (=> b!1244448 (= e!705377 e!705376)))

(declare-fun res!830114 () Bool)

(assert (=> b!1244448 (=> (not res!830114) (not e!705376))))

(declare-fun e!705374 () Bool)

(assert (=> b!1244448 (= res!830114 (not e!705374))))

(declare-fun res!830113 () Bool)

(assert (=> b!1244448 (=> (not res!830113) (not e!705374))))

(assert (=> b!1244448 (= res!830113 (validKeyInArray!0 (select (arr!38585 a!3892) (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun b!1244449 () Bool)

(assert (=> b!1244449 (= e!705374 (contains!7398 Nil!27486 (select (arr!38585 a!3892) (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun b!1244450 () Bool)

(assert (=> b!1244450 (= e!705376 e!705375)))

(assert (=> b!1244450 (= c!121854 (validKeyInArray!0 (select (arr!38585 a!3892) (bvadd #b00000000000000000000000000000001 from!3270))))))

(assert (= (and d!137007 (not res!830115)) b!1244448))

(assert (= (and b!1244448 res!830113) b!1244449))

(assert (= (and b!1244448 res!830114) b!1244450))

(assert (= (and b!1244450 c!121854) b!1244447))

(assert (= (and b!1244450 (not c!121854)) b!1244446))

(assert (= (or b!1244447 b!1244446) bm!61391))

(declare-fun m!1146265 () Bool)

(assert (=> bm!61391 m!1146265))

(declare-fun m!1146267 () Bool)

(assert (=> bm!61391 m!1146267))

(assert (=> b!1244448 m!1146265))

(assert (=> b!1244448 m!1146265))

(declare-fun m!1146269 () Bool)

(assert (=> b!1244448 m!1146269))

(assert (=> b!1244449 m!1146265))

(assert (=> b!1244449 m!1146265))

(declare-fun m!1146271 () Bool)

(assert (=> b!1244449 m!1146271))

(assert (=> b!1244450 m!1146265))

(assert (=> b!1244450 m!1146265))

(assert (=> b!1244450 m!1146269))

(assert (=> b!1244362 d!137007))

(declare-fun d!137011 () Bool)

(assert (=> d!137011 (= (array_inv!29568 a!3892) (bvsge (size!39123 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!103964 d!137011))

(declare-fun d!137013 () Bool)

(assert (=> d!137013 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27486)))

(declare-fun lt!562590 () Unit!41223)

(declare-fun choose!80 (array!79982 List!27489 List!27489 (_ BitVec 32)) Unit!41223)

(assert (=> d!137013 (= lt!562590 (choose!80 a!3892 (Cons!27485 (select (arr!38585 a!3892) from!3270) Nil!27486) Nil!27486 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> d!137013 (bvslt (size!39123 a!3892) #b01111111111111111111111111111111)))

(assert (=> d!137013 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27485 (select (arr!38585 a!3892) from!3270) Nil!27486) Nil!27486 (bvadd #b00000000000000000000000000000001 from!3270)) lt!562590)))

(declare-fun bs!35012 () Bool)

(assert (= bs!35012 d!137013))

(assert (=> bs!35012 m!1146199))

(declare-fun m!1146273 () Bool)

(assert (=> bs!35012 m!1146273))

(assert (=> b!1244360 d!137013))

(assert (=> b!1244360 d!137007))

(check-sat (not b!1244450) (not b!1244433) (not b!1244442) (not b!1244443) (not d!137013) (not bm!61390) (not b!1244434) (not d!136997) (not b!1244441) (not b!1244428) (not b!1244448) (not b!1244426) (not b!1244449) (not bm!61391) (not bm!61389) (not b!1244427))
(check-sat)
