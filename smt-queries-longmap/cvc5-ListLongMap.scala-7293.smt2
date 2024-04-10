; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93180 () Bool)

(assert start!93180)

(declare-fun b!1056732 () Bool)

(declare-fun res!705480 () Bool)

(declare-fun e!600822 () Bool)

(assert (=> b!1056732 (=> (not res!705480) (not e!600822))))

(declare-datatypes ((array!66651 0))(
  ( (array!66652 (arr!32050 (Array (_ BitVec 32) (_ BitVec 64))) (size!32586 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66651)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1056732 (= res!705480 (= (select (arr!32050 a!3488) i!1381) k!2747))))

(declare-fun b!1056733 () Bool)

(declare-fun res!705476 () Bool)

(assert (=> b!1056733 (=> (not res!705476) (not e!600822))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1056733 (= res!705476 (validKeyInArray!0 k!2747))))

(declare-fun b!1056734 () Bool)

(declare-fun e!600825 () Bool)

(assert (=> b!1056734 (= e!600822 e!600825)))

(declare-fun res!705475 () Bool)

(assert (=> b!1056734 (=> (not res!705475) (not e!600825))))

(declare-fun lt!466189 () array!66651)

(declare-fun arrayContainsKey!0 (array!66651 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1056734 (= res!705475 (arrayContainsKey!0 lt!466189 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1056734 (= lt!466189 (array!66652 (store (arr!32050 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32586 a!3488)))))

(declare-fun b!1056735 () Bool)

(declare-fun e!600826 () Bool)

(declare-fun lt!466191 () (_ BitVec 32))

(assert (=> b!1056735 (= e!600826 (bvsge (bvadd #b00000000000000000000000000000001 lt!466191) #b00000000000000000000000000000000))))

(declare-datatypes ((List!22362 0))(
  ( (Nil!22359) (Cons!22358 (h!23567 (_ BitVec 64)) (t!31669 List!22362)) )
))
(declare-fun arrayNoDuplicates!0 (array!66651 (_ BitVec 32) List!22362) Bool)

(assert (=> b!1056735 (arrayNoDuplicates!0 a!3488 lt!466191 Nil!22359)))

(declare-datatypes ((Unit!34622 0))(
  ( (Unit!34623) )
))
(declare-fun lt!466190 () Unit!34622)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66651 (_ BitVec 32) (_ BitVec 32)) Unit!34622)

(assert (=> b!1056735 (= lt!466190 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466191))))

(declare-fun b!1056736 () Bool)

(declare-fun e!600820 () Bool)

(assert (=> b!1056736 (= e!600820 (not e!600826))))

(declare-fun res!705477 () Bool)

(assert (=> b!1056736 (=> res!705477 e!600826)))

(assert (=> b!1056736 (= res!705477 (or (bvsgt lt!466191 i!1381) (bvsle i!1381 lt!466191)))))

(declare-fun e!600821 () Bool)

(assert (=> b!1056736 e!600821))

(declare-fun res!705479 () Bool)

(assert (=> b!1056736 (=> (not res!705479) (not e!600821))))

(assert (=> b!1056736 (= res!705479 (= (select (store (arr!32050 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466191) k!2747))))

(declare-fun b!1056737 () Bool)

(assert (=> b!1056737 (= e!600825 e!600820)))

(declare-fun res!705478 () Bool)

(assert (=> b!1056737 (=> (not res!705478) (not e!600820))))

(assert (=> b!1056737 (= res!705478 (not (= lt!466191 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66651 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1056737 (= lt!466191 (arrayScanForKey!0 lt!466189 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1056738 () Bool)

(declare-fun res!705481 () Bool)

(assert (=> b!1056738 (=> (not res!705481) (not e!600822))))

(assert (=> b!1056738 (= res!705481 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22359))))

(declare-fun b!1056739 () Bool)

(declare-fun e!600823 () Bool)

(assert (=> b!1056739 (= e!600823 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1056740 () Bool)

(assert (=> b!1056740 (= e!600821 e!600823)))

(declare-fun res!705482 () Bool)

(assert (=> b!1056740 (=> res!705482 e!600823)))

(assert (=> b!1056740 (= res!705482 (or (bvsgt lt!466191 i!1381) (bvsle i!1381 lt!466191)))))

(declare-fun res!705474 () Bool)

(assert (=> start!93180 (=> (not res!705474) (not e!600822))))

(assert (=> start!93180 (= res!705474 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32586 a!3488)) (bvslt (size!32586 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93180 e!600822))

(assert (=> start!93180 true))

(declare-fun array_inv!24830 (array!66651) Bool)

(assert (=> start!93180 (array_inv!24830 a!3488)))

(assert (= (and start!93180 res!705474) b!1056738))

(assert (= (and b!1056738 res!705481) b!1056733))

(assert (= (and b!1056733 res!705476) b!1056732))

(assert (= (and b!1056732 res!705480) b!1056734))

(assert (= (and b!1056734 res!705475) b!1056737))

(assert (= (and b!1056737 res!705478) b!1056736))

(assert (= (and b!1056736 res!705479) b!1056740))

(assert (= (and b!1056740 (not res!705482)) b!1056739))

(assert (= (and b!1056736 (not res!705477)) b!1056735))

(declare-fun m!976517 () Bool)

(assert (=> b!1056735 m!976517))

(declare-fun m!976519 () Bool)

(assert (=> b!1056735 m!976519))

(declare-fun m!976521 () Bool)

(assert (=> b!1056739 m!976521))

(declare-fun m!976523 () Bool)

(assert (=> b!1056738 m!976523))

(declare-fun m!976525 () Bool)

(assert (=> b!1056736 m!976525))

(declare-fun m!976527 () Bool)

(assert (=> b!1056736 m!976527))

(declare-fun m!976529 () Bool)

(assert (=> start!93180 m!976529))

(declare-fun m!976531 () Bool)

(assert (=> b!1056732 m!976531))

(declare-fun m!976533 () Bool)

(assert (=> b!1056734 m!976533))

(assert (=> b!1056734 m!976525))

(declare-fun m!976535 () Bool)

(assert (=> b!1056737 m!976535))

(declare-fun m!976537 () Bool)

(assert (=> b!1056733 m!976537))

(push 1)

(assert (not b!1056737))

(assert (not b!1056733))

(assert (not b!1056738))

(assert (not start!93180))

(assert (not b!1056735))

(assert (not b!1056734))

(assert (not b!1056739))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!128331 () Bool)

(assert (=> d!128331 (= (array_inv!24830 a!3488) (bvsge (size!32586 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!93180 d!128331))

(declare-fun d!128337 () Bool)

(declare-fun lt!466215 () (_ BitVec 32))

(assert (=> d!128337 (and (or (bvslt lt!466215 #b00000000000000000000000000000000) (bvsge lt!466215 (size!32586 lt!466189)) (and (bvsge lt!466215 #b00000000000000000000000000000000) (bvslt lt!466215 (size!32586 lt!466189)))) (bvsge lt!466215 #b00000000000000000000000000000000) (bvslt lt!466215 (size!32586 lt!466189)) (= (select (arr!32050 lt!466189) lt!466215) k!2747))))

(declare-fun e!600890 () (_ BitVec 32))

(assert (=> d!128337 (= lt!466215 e!600890)))

(declare-fun c!107096 () Bool)

(assert (=> d!128337 (= c!107096 (= (select (arr!32050 lt!466189) #b00000000000000000000000000000000) k!2747))))

(assert (=> d!128337 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32586 lt!466189)) (bvslt (size!32586 lt!466189) #b01111111111111111111111111111111))))

(assert (=> d!128337 (= (arrayScanForKey!0 lt!466189 k!2747 #b00000000000000000000000000000000) lt!466215)))

(declare-fun b!1056823 () Bool)

(assert (=> b!1056823 (= e!600890 #b00000000000000000000000000000000)))

(declare-fun b!1056824 () Bool)

(assert (=> b!1056824 (= e!600890 (arrayScanForKey!0 lt!466189 k!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128337 c!107096) b!1056823))

(assert (= (and d!128337 (not c!107096)) b!1056824))

(declare-fun m!976593 () Bool)

(assert (=> d!128337 m!976593))

(declare-fun m!976595 () Bool)

(assert (=> d!128337 m!976595))

(declare-fun m!976597 () Bool)

(assert (=> b!1056824 m!976597))

(assert (=> b!1056737 d!128337))

(declare-fun d!128345 () Bool)

(declare-fun res!705576 () Bool)

(declare-fun e!600919 () Bool)

(assert (=> d!128345 (=> res!705576 e!600919)))

(assert (=> d!128345 (= res!705576 (bvsge #b00000000000000000000000000000000 (size!32586 a!3488)))))

(assert (=> d!128345 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22359) e!600919)))

(declare-fun b!1056857 () Bool)

(declare-fun e!600922 () Bool)

(declare-fun e!600921 () Bool)

(assert (=> b!1056857 (= e!600922 e!600921)))

(declare-fun c!107101 () Bool)

(assert (=> b!1056857 (= c!107101 (validKeyInArray!0 (select (arr!32050 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1056858 () Bool)

(declare-fun call!44831 () Bool)

(assert (=> b!1056858 (= e!600921 call!44831)))

(declare-fun b!1056859 () Bool)

(assert (=> b!1056859 (= e!600921 call!44831)))

(declare-fun b!1056860 () Bool)

(declare-fun e!600920 () Bool)

(declare-fun contains!6196 (List!22362 (_ BitVec 64)) Bool)

(assert (=> b!1056860 (= e!600920 (contains!6196 Nil!22359 (select (arr!32050 a!3488) #b00000000000000000000000000000000)))))

(declare-fun bm!44828 () Bool)

(assert (=> bm!44828 (= call!44831 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107101 (Cons!22358 (select (arr!32050 a!3488) #b00000000000000000000000000000000) Nil!22359) Nil!22359)))))

(declare-fun b!1056861 () Bool)

(assert (=> b!1056861 (= e!600919 e!600922)))

(declare-fun res!705575 () Bool)

(assert (=> b!1056861 (=> (not res!705575) (not e!600922))))

(assert (=> b!1056861 (= res!705575 (not e!600920))))

(declare-fun res!705577 () Bool)

(assert (=> b!1056861 (=> (not res!705577) (not e!600920))))

(assert (=> b!1056861 (= res!705577 (validKeyInArray!0 (select (arr!32050 a!3488) #b00000000000000000000000000000000)))))

(assert (= (and d!128345 (not res!705576)) b!1056861))

(assert (= (and b!1056861 res!705577) b!1056860))

(assert (= (and b!1056861 res!705575) b!1056857))

(assert (= (and b!1056857 c!107101) b!1056859))

(assert (= (and b!1056857 (not c!107101)) b!1056858))

(assert (= (or b!1056859 b!1056858) bm!44828))

(declare-fun m!976621 () Bool)

(assert (=> b!1056857 m!976621))

(assert (=> b!1056857 m!976621))

(declare-fun m!976623 () Bool)

(assert (=> b!1056857 m!976623))

(assert (=> b!1056860 m!976621))

(assert (=> b!1056860 m!976621))

(declare-fun m!976625 () Bool)

(assert (=> b!1056860 m!976625))

(assert (=> bm!44828 m!976621))

(declare-fun m!976627 () Bool)

(assert (=> bm!44828 m!976627))

(assert (=> b!1056861 m!976621))

(assert (=> b!1056861 m!976621))

(assert (=> b!1056861 m!976623))

(assert (=> b!1056738 d!128345))

(declare-fun d!128355 () Bool)

(assert (=> d!128355 (= (validKeyInArray!0 k!2747) (and (not (= k!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1056733 d!128355))

(declare-fun d!128357 () Bool)

(declare-fun res!705585 () Bool)

(declare-fun e!600933 () Bool)

(assert (=> d!128357 (=> res!705585 e!600933)))

(assert (=> d!128357 (= res!705585 (= (select (arr!32050 lt!466189) #b00000000000000000000000000000000) k!2747))))

(assert (=> d!128357 (= (arrayContainsKey!0 lt!466189 k!2747 #b00000000000000000000000000000000) e!600933)))

(declare-fun b!1056875 () Bool)

(declare-fun e!600934 () Bool)

(assert (=> b!1056875 (= e!600933 e!600934)))

(declare-fun res!705586 () Bool)

(assert (=> b!1056875 (=> (not res!705586) (not e!600934))))

(assert (=> b!1056875 (= res!705586 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32586 lt!466189)))))

(declare-fun b!1056876 () Bool)

(assert (=> b!1056876 (= e!600934 (arrayContainsKey!0 lt!466189 k!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128357 (not res!705585)) b!1056875))

(assert (= (and b!1056875 res!705586) b!1056876))

(assert (=> d!128357 m!976595))

(declare-fun m!976637 () Bool)

(assert (=> b!1056876 m!976637))

(assert (=> b!1056734 d!128357))

(declare-fun d!128361 () Bool)

(declare-fun res!705587 () Bool)

(declare-fun e!600935 () Bool)

(assert (=> d!128361 (=> res!705587 e!600935)))

(assert (=> d!128361 (= res!705587 (= (select (arr!32050 a!3488) i!1381) k!2747))))

(assert (=> d!128361 (= (arrayContainsKey!0 a!3488 k!2747 i!1381) e!600935)))

(declare-fun b!1056877 () Bool)

(declare-fun e!600936 () Bool)

(assert (=> b!1056877 (= e!600935 e!600936)))

(declare-fun res!705588 () Bool)

(assert (=> b!1056877 (=> (not res!705588) (not e!600936))))

(assert (=> b!1056877 (= res!705588 (bvslt (bvadd i!1381 #b00000000000000000000000000000001) (size!32586 a!3488)))))

(declare-fun b!1056878 () Bool)

(assert (=> b!1056878 (= e!600936 (arrayContainsKey!0 a!3488 k!2747 (bvadd i!1381 #b00000000000000000000000000000001)))))

(assert (= (and d!128361 (not res!705587)) b!1056877))

(assert (= (and b!1056877 res!705588) b!1056878))

(assert (=> d!128361 m!976531))

(declare-fun m!976639 () Bool)

(assert (=> b!1056878 m!976639))

(assert (=> b!1056739 d!128361))

(declare-fun d!128365 () Bool)

(declare-fun res!705590 () Bool)

(declare-fun e!600937 () Bool)

(assert (=> d!128365 (=> res!705590 e!600937)))

(assert (=> d!128365 (= res!705590 (bvsge lt!466191 (size!32586 a!3488)))))

(assert (=> d!128365 (= (arrayNoDuplicates!0 a!3488 lt!466191 Nil!22359) e!600937)))

(declare-fun b!1056879 () Bool)

(declare-fun e!600940 () Bool)

(declare-fun e!600939 () Bool)

(assert (=> b!1056879 (= e!600940 e!600939)))

(declare-fun c!107105 () Bool)

(assert (=> b!1056879 (= c!107105 (validKeyInArray!0 (select (arr!32050 a!3488) lt!466191)))))

(declare-fun b!1056880 () Bool)

(declare-fun call!44835 () Bool)

(assert (=> b!1056880 (= e!600939 call!44835)))

