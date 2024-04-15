; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93178 () Bool)

(assert start!93178)

(declare-fun b!1056581 () Bool)

(declare-fun res!705411 () Bool)

(declare-fun e!600730 () Bool)

(assert (=> b!1056581 (=> (not res!705411) (not e!600730))))

(declare-datatypes ((array!66590 0))(
  ( (array!66591 (arr!32019 (Array (_ BitVec 32) (_ BitVec 64))) (size!32557 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66590)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1056581 (= res!705411 (= (select (arr!32019 a!3488) i!1381) k0!2747))))

(declare-fun b!1056582 () Bool)

(declare-fun res!705415 () Bool)

(assert (=> b!1056582 (=> (not res!705415) (not e!600730))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1056582 (= res!705415 (validKeyInArray!0 k0!2747))))

(declare-fun b!1056583 () Bool)

(declare-fun e!600733 () Bool)

(declare-fun e!600734 () Bool)

(assert (=> b!1056583 (= e!600733 e!600734)))

(declare-fun res!705407 () Bool)

(assert (=> b!1056583 (=> res!705407 e!600734)))

(declare-fun lt!465990 () (_ BitVec 32))

(assert (=> b!1056583 (= res!705407 (or (bvsgt lt!465990 i!1381) (bvsle i!1381 lt!465990)))))

(declare-fun res!705412 () Bool)

(assert (=> start!93178 (=> (not res!705412) (not e!600730))))

(assert (=> start!93178 (= res!705412 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32557 a!3488)) (bvslt (size!32557 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93178 e!600730))

(assert (=> start!93178 true))

(declare-fun array_inv!24802 (array!66590) Bool)

(assert (=> start!93178 (array_inv!24802 a!3488)))

(declare-fun b!1056584 () Bool)

(declare-fun e!600731 () Bool)

(assert (=> b!1056584 (= e!600730 e!600731)))

(declare-fun res!705408 () Bool)

(assert (=> b!1056584 (=> (not res!705408) (not e!600731))))

(declare-fun lt!465991 () array!66590)

(declare-fun arrayContainsKey!0 (array!66590 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1056584 (= res!705408 (arrayContainsKey!0 lt!465991 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1056584 (= lt!465991 (array!66591 (store (arr!32019 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32557 a!3488)))))

(declare-fun b!1056585 () Bool)

(declare-fun e!600735 () Bool)

(assert (=> b!1056585 (= e!600735 (bvsge (bvadd #b00000000000000000000000000000001 lt!465990) #b00000000000000000000000000000000))))

(declare-datatypes ((List!22390 0))(
  ( (Nil!22387) (Cons!22386 (h!23595 (_ BitVec 64)) (t!31688 List!22390)) )
))
(declare-fun arrayNoDuplicates!0 (array!66590 (_ BitVec 32) List!22390) Bool)

(assert (=> b!1056585 (arrayNoDuplicates!0 a!3488 lt!465990 Nil!22387)))

(declare-datatypes ((Unit!34493 0))(
  ( (Unit!34494) )
))
(declare-fun lt!465989 () Unit!34493)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66590 (_ BitVec 32) (_ BitVec 32)) Unit!34493)

(assert (=> b!1056585 (= lt!465989 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!465990))))

(declare-fun b!1056586 () Bool)

(assert (=> b!1056586 (= e!600734 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1056587 () Bool)

(declare-fun e!600732 () Bool)

(assert (=> b!1056587 (= e!600732 (not e!600735))))

(declare-fun res!705409 () Bool)

(assert (=> b!1056587 (=> res!705409 e!600735)))

(assert (=> b!1056587 (= res!705409 (or (bvsgt lt!465990 i!1381) (bvsle i!1381 lt!465990)))))

(assert (=> b!1056587 e!600733))

(declare-fun res!705410 () Bool)

(assert (=> b!1056587 (=> (not res!705410) (not e!600733))))

(assert (=> b!1056587 (= res!705410 (= (select (store (arr!32019 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465990) k0!2747))))

(declare-fun b!1056588 () Bool)

(declare-fun res!705413 () Bool)

(assert (=> b!1056588 (=> (not res!705413) (not e!600730))))

(assert (=> b!1056588 (= res!705413 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22387))))

(declare-fun b!1056589 () Bool)

(assert (=> b!1056589 (= e!600731 e!600732)))

(declare-fun res!705414 () Bool)

(assert (=> b!1056589 (=> (not res!705414) (not e!600732))))

(assert (=> b!1056589 (= res!705414 (not (= lt!465990 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66590 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1056589 (= lt!465990 (arrayScanForKey!0 lt!465991 k0!2747 #b00000000000000000000000000000000))))

(assert (= (and start!93178 res!705412) b!1056588))

(assert (= (and b!1056588 res!705413) b!1056582))

(assert (= (and b!1056582 res!705415) b!1056581))

(assert (= (and b!1056581 res!705411) b!1056584))

(assert (= (and b!1056584 res!705408) b!1056589))

(assert (= (and b!1056589 res!705414) b!1056587))

(assert (= (and b!1056587 res!705410) b!1056583))

(assert (= (and b!1056583 (not res!705407)) b!1056586))

(assert (= (and b!1056587 (not res!705409)) b!1056585))

(declare-fun m!975893 () Bool)

(assert (=> start!93178 m!975893))

(declare-fun m!975895 () Bool)

(assert (=> b!1056589 m!975895))

(declare-fun m!975897 () Bool)

(assert (=> b!1056584 m!975897))

(declare-fun m!975899 () Bool)

(assert (=> b!1056584 m!975899))

(declare-fun m!975901 () Bool)

(assert (=> b!1056582 m!975901))

(declare-fun m!975903 () Bool)

(assert (=> b!1056581 m!975903))

(declare-fun m!975905 () Bool)

(assert (=> b!1056585 m!975905))

(declare-fun m!975907 () Bool)

(assert (=> b!1056585 m!975907))

(declare-fun m!975909 () Bool)

(assert (=> b!1056588 m!975909))

(assert (=> b!1056587 m!975899))

(declare-fun m!975911 () Bool)

(assert (=> b!1056587 m!975911))

(declare-fun m!975913 () Bool)

(assert (=> b!1056586 m!975913))

(check-sat (not b!1056584) (not b!1056585) (not b!1056586) (not b!1056589) (not b!1056588) (not b!1056582) (not start!93178))
(check-sat)
(get-model)

(declare-fun d!128177 () Bool)

(assert (=> d!128177 (= (array_inv!24802 a!3488) (bvsge (size!32557 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!93178 d!128177))

(declare-fun call!44804 () Bool)

(declare-fun bm!44801 () Bool)

(declare-fun c!107052 () Bool)

(assert (=> bm!44801 (= call!44804 (arrayNoDuplicates!0 a!3488 (bvadd lt!465990 #b00000000000000000000000000000001) (ite c!107052 (Cons!22386 (select (arr!32019 a!3488) lt!465990) Nil!22387) Nil!22387)))))

(declare-fun b!1056654 () Bool)

(declare-fun e!600786 () Bool)

(declare-fun e!600787 () Bool)

(assert (=> b!1056654 (= e!600786 e!600787)))

(declare-fun res!705478 () Bool)

(assert (=> b!1056654 (=> (not res!705478) (not e!600787))))

(declare-fun e!600788 () Bool)

(assert (=> b!1056654 (= res!705478 (not e!600788))))

(declare-fun res!705477 () Bool)

(assert (=> b!1056654 (=> (not res!705477) (not e!600788))))

(assert (=> b!1056654 (= res!705477 (validKeyInArray!0 (select (arr!32019 a!3488) lt!465990)))))

(declare-fun b!1056655 () Bool)

(declare-fun e!600789 () Bool)

(assert (=> b!1056655 (= e!600787 e!600789)))

(assert (=> b!1056655 (= c!107052 (validKeyInArray!0 (select (arr!32019 a!3488) lt!465990)))))

(declare-fun b!1056657 () Bool)

(assert (=> b!1056657 (= e!600789 call!44804)))

(declare-fun b!1056658 () Bool)

(assert (=> b!1056658 (= e!600789 call!44804)))

(declare-fun d!128179 () Bool)

(declare-fun res!705476 () Bool)

(assert (=> d!128179 (=> res!705476 e!600786)))

(assert (=> d!128179 (= res!705476 (bvsge lt!465990 (size!32557 a!3488)))))

(assert (=> d!128179 (= (arrayNoDuplicates!0 a!3488 lt!465990 Nil!22387) e!600786)))

(declare-fun b!1056656 () Bool)

(declare-fun contains!6165 (List!22390 (_ BitVec 64)) Bool)

(assert (=> b!1056656 (= e!600788 (contains!6165 Nil!22387 (select (arr!32019 a!3488) lt!465990)))))

(assert (= (and d!128179 (not res!705476)) b!1056654))

(assert (= (and b!1056654 res!705477) b!1056656))

(assert (= (and b!1056654 res!705478) b!1056655))

(assert (= (and b!1056655 c!107052) b!1056658))

(assert (= (and b!1056655 (not c!107052)) b!1056657))

(assert (= (or b!1056658 b!1056657) bm!44801))

(declare-fun m!975959 () Bool)

(assert (=> bm!44801 m!975959))

(declare-fun m!975961 () Bool)

(assert (=> bm!44801 m!975961))

(assert (=> b!1056654 m!975959))

(assert (=> b!1056654 m!975959))

(declare-fun m!975963 () Bool)

(assert (=> b!1056654 m!975963))

(assert (=> b!1056655 m!975959))

(assert (=> b!1056655 m!975959))

(assert (=> b!1056655 m!975963))

(assert (=> b!1056656 m!975959))

(assert (=> b!1056656 m!975959))

(declare-fun m!975965 () Bool)

(assert (=> b!1056656 m!975965))

(assert (=> b!1056585 d!128179))

(declare-fun d!128181 () Bool)

(assert (=> d!128181 (arrayNoDuplicates!0 a!3488 lt!465990 Nil!22387)))

(declare-fun lt!466012 () Unit!34493)

(declare-fun choose!39 (array!66590 (_ BitVec 32) (_ BitVec 32)) Unit!34493)

(assert (=> d!128181 (= lt!466012 (choose!39 a!3488 #b00000000000000000000000000000000 lt!465990))))

(assert (=> d!128181 (bvslt (size!32557 a!3488) #b01111111111111111111111111111111)))

(assert (=> d!128181 (= (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!465990) lt!466012)))

(declare-fun bs!30953 () Bool)

(assert (= bs!30953 d!128181))

(assert (=> bs!30953 m!975905))

(declare-fun m!975967 () Bool)

(assert (=> bs!30953 m!975967))

(assert (=> b!1056585 d!128181))

(declare-fun d!128187 () Bool)

(declare-fun res!705489 () Bool)

(declare-fun e!600800 () Bool)

(assert (=> d!128187 (=> res!705489 e!600800)))

(assert (=> d!128187 (= res!705489 (= (select (arr!32019 lt!465991) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!128187 (= (arrayContainsKey!0 lt!465991 k0!2747 #b00000000000000000000000000000000) e!600800)))

(declare-fun b!1056671 () Bool)

(declare-fun e!600801 () Bool)

(assert (=> b!1056671 (= e!600800 e!600801)))

(declare-fun res!705490 () Bool)

(assert (=> b!1056671 (=> (not res!705490) (not e!600801))))

(assert (=> b!1056671 (= res!705490 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32557 lt!465991)))))

(declare-fun b!1056672 () Bool)

(assert (=> b!1056672 (= e!600801 (arrayContainsKey!0 lt!465991 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128187 (not res!705489)) b!1056671))

(assert (= (and b!1056671 res!705490) b!1056672))

(declare-fun m!975969 () Bool)

(assert (=> d!128187 m!975969))

(declare-fun m!975971 () Bool)

(assert (=> b!1056672 m!975971))

(assert (=> b!1056584 d!128187))

(declare-fun d!128189 () Bool)

(declare-fun res!705491 () Bool)

(declare-fun e!600804 () Bool)

(assert (=> d!128189 (=> res!705491 e!600804)))

(assert (=> d!128189 (= res!705491 (= (select (arr!32019 a!3488) i!1381) k0!2747))))

(assert (=> d!128189 (= (arrayContainsKey!0 a!3488 k0!2747 i!1381) e!600804)))

(declare-fun b!1056675 () Bool)

(declare-fun e!600805 () Bool)

(assert (=> b!1056675 (= e!600804 e!600805)))

(declare-fun res!705492 () Bool)

(assert (=> b!1056675 (=> (not res!705492) (not e!600805))))

(assert (=> b!1056675 (= res!705492 (bvslt (bvadd i!1381 #b00000000000000000000000000000001) (size!32557 a!3488)))))

(declare-fun b!1056676 () Bool)

(assert (=> b!1056676 (= e!600805 (arrayContainsKey!0 a!3488 k0!2747 (bvadd i!1381 #b00000000000000000000000000000001)))))

(assert (= (and d!128189 (not res!705491)) b!1056675))

(assert (= (and b!1056675 res!705492) b!1056676))

(assert (=> d!128189 m!975903))

(declare-fun m!975973 () Bool)

(assert (=> b!1056676 m!975973))

(assert (=> b!1056586 d!128189))

(declare-fun d!128191 () Bool)

(assert (=> d!128191 (= (validKeyInArray!0 k0!2747) (and (not (= k0!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1056582 d!128191))

(declare-fun d!128193 () Bool)

(declare-fun lt!466020 () (_ BitVec 32))

(assert (=> d!128193 (and (or (bvslt lt!466020 #b00000000000000000000000000000000) (bvsge lt!466020 (size!32557 lt!465991)) (and (bvsge lt!466020 #b00000000000000000000000000000000) (bvslt lt!466020 (size!32557 lt!465991)))) (bvsge lt!466020 #b00000000000000000000000000000000) (bvslt lt!466020 (size!32557 lt!465991)) (= (select (arr!32019 lt!465991) lt!466020) k0!2747))))

(declare-fun e!600820 () (_ BitVec 32))

(assert (=> d!128193 (= lt!466020 e!600820)))

(declare-fun c!107060 () Bool)

(assert (=> d!128193 (= c!107060 (= (select (arr!32019 lt!465991) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!128193 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32557 lt!465991)) (bvslt (size!32557 lt!465991) #b01111111111111111111111111111111))))

(assert (=> d!128193 (= (arrayScanForKey!0 lt!465991 k0!2747 #b00000000000000000000000000000000) lt!466020)))

(declare-fun b!1056697 () Bool)

(assert (=> b!1056697 (= e!600820 #b00000000000000000000000000000000)))

(declare-fun b!1056699 () Bool)

(assert (=> b!1056699 (= e!600820 (arrayScanForKey!0 lt!465991 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128193 c!107060) b!1056697))

(assert (= (and d!128193 (not c!107060)) b!1056699))

(declare-fun m!975990 () Bool)

(assert (=> d!128193 m!975990))

(assert (=> d!128193 m!975969))

(declare-fun m!975996 () Bool)

(assert (=> b!1056699 m!975996))

(assert (=> b!1056589 d!128193))

(declare-fun bm!44805 () Bool)

(declare-fun call!44808 () Bool)

(declare-fun c!107062 () Bool)

(assert (=> bm!44805 (= call!44808 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107062 (Cons!22386 (select (arr!32019 a!3488) #b00000000000000000000000000000000) Nil!22387) Nil!22387)))))

(declare-fun b!1056700 () Bool)

(declare-fun e!600822 () Bool)

(declare-fun e!600823 () Bool)

(assert (=> b!1056700 (= e!600822 e!600823)))

(declare-fun res!705504 () Bool)

(assert (=> b!1056700 (=> (not res!705504) (not e!600823))))

(declare-fun e!600824 () Bool)

(assert (=> b!1056700 (= res!705504 (not e!600824))))

(declare-fun res!705503 () Bool)

(assert (=> b!1056700 (=> (not res!705503) (not e!600824))))

(assert (=> b!1056700 (= res!705503 (validKeyInArray!0 (select (arr!32019 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1056701 () Bool)

(declare-fun e!600825 () Bool)

(assert (=> b!1056701 (= e!600823 e!600825)))

(assert (=> b!1056701 (= c!107062 (validKeyInArray!0 (select (arr!32019 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1056703 () Bool)

(assert (=> b!1056703 (= e!600825 call!44808)))

(declare-fun b!1056704 () Bool)

(assert (=> b!1056704 (= e!600825 call!44808)))

(declare-fun d!128205 () Bool)

(declare-fun res!705502 () Bool)

(assert (=> d!128205 (=> res!705502 e!600822)))

(assert (=> d!128205 (= res!705502 (bvsge #b00000000000000000000000000000000 (size!32557 a!3488)))))

(assert (=> d!128205 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22387) e!600822)))

(declare-fun b!1056702 () Bool)

(assert (=> b!1056702 (= e!600824 (contains!6165 Nil!22387 (select (arr!32019 a!3488) #b00000000000000000000000000000000)))))

(assert (= (and d!128205 (not res!705502)) b!1056700))

(assert (= (and b!1056700 res!705503) b!1056702))

(assert (= (and b!1056700 res!705504) b!1056701))

(assert (= (and b!1056701 c!107062) b!1056704))

(assert (= (and b!1056701 (not c!107062)) b!1056703))

(assert (= (or b!1056704 b!1056703) bm!44805))

(declare-fun m!975999 () Bool)

(assert (=> bm!44805 m!975999))

(declare-fun m!976001 () Bool)

(assert (=> bm!44805 m!976001))

(assert (=> b!1056700 m!975999))

(assert (=> b!1056700 m!975999))

(declare-fun m!976003 () Bool)

(assert (=> b!1056700 m!976003))

(assert (=> b!1056701 m!975999))

(assert (=> b!1056701 m!975999))

(assert (=> b!1056701 m!976003))

(assert (=> b!1056702 m!975999))

(assert (=> b!1056702 m!975999))

(declare-fun m!976005 () Bool)

(assert (=> b!1056702 m!976005))

(assert (=> b!1056588 d!128205))

(check-sat (not bm!44805) (not b!1056699) (not d!128181) (not b!1056676) (not b!1056655) (not b!1056654) (not b!1056672) (not b!1056702) (not b!1056701) (not bm!44801) (not b!1056656) (not b!1056700))
(check-sat)
