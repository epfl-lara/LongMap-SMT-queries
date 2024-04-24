; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104392 () Bool)

(assert start!104392)

(declare-fun b!1246485 () Bool)

(declare-fun e!706806 () Bool)

(declare-datatypes ((List!27479 0))(
  ( (Nil!27476) (Cons!27475 (h!28693 (_ BitVec 64)) (t!40940 List!27479)) )
))
(declare-fun contains!7474 (List!27479 (_ BitVec 64)) Bool)

(assert (=> b!1246485 (= e!706806 (contains!7474 Nil!27476 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!831197 () Bool)

(declare-fun e!706805 () Bool)

(assert (=> start!104392 (=> (not res!831197) (not e!706805))))

(declare-datatypes ((array!80164 0))(
  ( (array!80165 (arr!38663 (Array (_ BitVec 32) (_ BitVec 64))) (size!39200 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80164)

(declare-fun from!3270 () (_ BitVec 32))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> start!104392 (= res!831197 (and (bvslt (size!39200 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39200 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39200 a!3892))))))

(assert (=> start!104392 e!706805))

(declare-fun array_inv!29601 (array!80164) Bool)

(assert (=> start!104392 (array_inv!29601 a!3892)))

(assert (=> start!104392 true))

(declare-fun b!1246486 () Bool)

(declare-fun res!831200 () Bool)

(assert (=> b!1246486 (=> (not res!831200) (not e!706805))))

(declare-fun noDuplicate!2038 (List!27479) Bool)

(assert (=> b!1246486 (= res!831200 (noDuplicate!2038 Nil!27476))))

(declare-fun b!1246487 () Bool)

(declare-fun res!831199 () Bool)

(assert (=> b!1246487 (=> (not res!831199) (not e!706805))))

(declare-fun arrayNoDuplicates!0 (array!80164 (_ BitVec 32) List!27479) Bool)

(assert (=> b!1246487 (= res!831199 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27476))))

(declare-fun b!1246488 () Bool)

(assert (=> b!1246488 (= e!706805 e!706806)))

(declare-fun res!831201 () Bool)

(assert (=> b!1246488 (=> res!831201 e!706806)))

(assert (=> b!1246488 (= res!831201 (contains!7474 Nil!27476 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1246489 () Bool)

(declare-fun res!831198 () Bool)

(assert (=> b!1246489 (=> (not res!831198) (not e!706805))))

(assert (=> b!1246489 (= res!831198 (and (= from!3270 newFrom!287) (bvsge newFrom!287 #b00000000000000000000000000000000)))))

(assert (= (and start!104392 res!831197) b!1246487))

(assert (= (and b!1246487 res!831199) b!1246489))

(assert (= (and b!1246489 res!831198) b!1246486))

(assert (= (and b!1246486 res!831200) b!1246488))

(assert (= (and b!1246488 (not res!831201)) b!1246485))

(declare-fun m!1148905 () Bool)

(assert (=> start!104392 m!1148905))

(declare-fun m!1148907 () Bool)

(assert (=> b!1246488 m!1148907))

(declare-fun m!1148909 () Bool)

(assert (=> b!1246486 m!1148909))

(declare-fun m!1148911 () Bool)

(assert (=> b!1246485 m!1148911))

(declare-fun m!1148913 () Bool)

(assert (=> b!1246487 m!1148913))

(check-sat (not b!1246486) (not b!1246488) (not start!104392) (not b!1246487) (not b!1246485))
(check-sat)
(get-model)

(declare-fun d!137770 () Bool)

(declare-fun res!831236 () Bool)

(declare-fun e!706830 () Bool)

(assert (=> d!137770 (=> res!831236 e!706830)))

(get-info :version)

(assert (=> d!137770 (= res!831236 ((_ is Nil!27476) Nil!27476))))

(assert (=> d!137770 (= (noDuplicate!2038 Nil!27476) e!706830)))

(declare-fun b!1246524 () Bool)

(declare-fun e!706831 () Bool)

(assert (=> b!1246524 (= e!706830 e!706831)))

(declare-fun res!831237 () Bool)

(assert (=> b!1246524 (=> (not res!831237) (not e!706831))))

(assert (=> b!1246524 (= res!831237 (not (contains!7474 (t!40940 Nil!27476) (h!28693 Nil!27476))))))

(declare-fun b!1246525 () Bool)

(assert (=> b!1246525 (= e!706831 (noDuplicate!2038 (t!40940 Nil!27476)))))

(assert (= (and d!137770 (not res!831236)) b!1246524))

(assert (= (and b!1246524 res!831237) b!1246525))

(declare-fun m!1148935 () Bool)

(assert (=> b!1246524 m!1148935))

(declare-fun m!1148937 () Bool)

(assert (=> b!1246525 m!1148937))

(assert (=> b!1246486 d!137770))

(declare-fun d!137775 () Bool)

(declare-fun lt!563360 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!616 (List!27479) (InoxSet (_ BitVec 64)))

(assert (=> d!137775 (= lt!563360 (select (content!616 Nil!27476) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!706854 () Bool)

(assert (=> d!137775 (= lt!563360 e!706854)))

(declare-fun res!831258 () Bool)

(assert (=> d!137775 (=> (not res!831258) (not e!706854))))

(assert (=> d!137775 (= res!831258 ((_ is Cons!27475) Nil!27476))))

(assert (=> d!137775 (= (contains!7474 Nil!27476 #b1000000000000000000000000000000000000000000000000000000000000000) lt!563360)))

(declare-fun b!1246551 () Bool)

(declare-fun e!706855 () Bool)

(assert (=> b!1246551 (= e!706854 e!706855)))

(declare-fun res!831257 () Bool)

(assert (=> b!1246551 (=> res!831257 e!706855)))

(assert (=> b!1246551 (= res!831257 (= (h!28693 Nil!27476) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1246552 () Bool)

(assert (=> b!1246552 (= e!706855 (contains!7474 (t!40940 Nil!27476) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137775 res!831258) b!1246551))

(assert (= (and b!1246551 (not res!831257)) b!1246552))

(declare-fun m!1148945 () Bool)

(assert (=> d!137775 m!1148945))

(declare-fun m!1148947 () Bool)

(assert (=> d!137775 m!1148947))

(declare-fun m!1148949 () Bool)

(assert (=> b!1246552 m!1148949))

(assert (=> b!1246485 d!137775))

(declare-fun b!1246586 () Bool)

(declare-fun e!706886 () Bool)

(declare-fun e!706884 () Bool)

(assert (=> b!1246586 (= e!706886 e!706884)))

(declare-fun c!122344 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1246586 (= c!122344 (validKeyInArray!0 (select (arr!38663 a!3892) from!3270)))))

(declare-fun b!1246587 () Bool)

(declare-fun call!61541 () Bool)

(assert (=> b!1246587 (= e!706884 call!61541)))

(declare-fun b!1246588 () Bool)

(assert (=> b!1246588 (= e!706884 call!61541)))

(declare-fun bm!61538 () Bool)

(assert (=> bm!61538 (= call!61541 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!122344 (Cons!27475 (select (arr!38663 a!3892) from!3270) Nil!27476) Nil!27476)))))

(declare-fun b!1246590 () Bool)

(declare-fun e!706887 () Bool)

(assert (=> b!1246590 (= e!706887 e!706886)))

(declare-fun res!831284 () Bool)

(assert (=> b!1246590 (=> (not res!831284) (not e!706886))))

(declare-fun e!706885 () Bool)

(assert (=> b!1246590 (= res!831284 (not e!706885))))

(declare-fun res!831283 () Bool)

(assert (=> b!1246590 (=> (not res!831283) (not e!706885))))

(assert (=> b!1246590 (= res!831283 (validKeyInArray!0 (select (arr!38663 a!3892) from!3270)))))

(declare-fun d!137779 () Bool)

(declare-fun res!831282 () Bool)

(assert (=> d!137779 (=> res!831282 e!706887)))

(assert (=> d!137779 (= res!831282 (bvsge from!3270 (size!39200 a!3892)))))

(assert (=> d!137779 (= (arrayNoDuplicates!0 a!3892 from!3270 Nil!27476) e!706887)))

(declare-fun b!1246589 () Bool)

(assert (=> b!1246589 (= e!706885 (contains!7474 Nil!27476 (select (arr!38663 a!3892) from!3270)))))

(assert (= (and d!137779 (not res!831282)) b!1246590))

(assert (= (and b!1246590 res!831283) b!1246589))

(assert (= (and b!1246590 res!831284) b!1246586))

(assert (= (and b!1246586 c!122344) b!1246587))

(assert (= (and b!1246586 (not c!122344)) b!1246588))

(assert (= (or b!1246587 b!1246588) bm!61538))

(declare-fun m!1148977 () Bool)

(assert (=> b!1246586 m!1148977))

(assert (=> b!1246586 m!1148977))

(declare-fun m!1148979 () Bool)

(assert (=> b!1246586 m!1148979))

(assert (=> bm!61538 m!1148977))

(declare-fun m!1148981 () Bool)

(assert (=> bm!61538 m!1148981))

(assert (=> b!1246590 m!1148977))

(assert (=> b!1246590 m!1148977))

(assert (=> b!1246590 m!1148979))

(assert (=> b!1246589 m!1148977))

(assert (=> b!1246589 m!1148977))

(declare-fun m!1148983 () Bool)

(assert (=> b!1246589 m!1148983))

(assert (=> b!1246487 d!137779))

(declare-fun d!137791 () Bool)

(assert (=> d!137791 (= (array_inv!29601 a!3892) (bvsge (size!39200 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!104392 d!137791))

(declare-fun d!137793 () Bool)

(declare-fun lt!563365 () Bool)

(assert (=> d!137793 (= lt!563365 (select (content!616 Nil!27476) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!706898 () Bool)

(assert (=> d!137793 (= lt!563365 e!706898)))

(declare-fun res!831296 () Bool)

(assert (=> d!137793 (=> (not res!831296) (not e!706898))))

(assert (=> d!137793 (= res!831296 ((_ is Cons!27475) Nil!27476))))

(assert (=> d!137793 (= (contains!7474 Nil!27476 #b0000000000000000000000000000000000000000000000000000000000000000) lt!563365)))

(declare-fun b!1246601 () Bool)

(declare-fun e!706899 () Bool)

(assert (=> b!1246601 (= e!706898 e!706899)))

(declare-fun res!831295 () Bool)

(assert (=> b!1246601 (=> res!831295 e!706899)))

(assert (=> b!1246601 (= res!831295 (= (h!28693 Nil!27476) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1246602 () Bool)

(assert (=> b!1246602 (= e!706899 (contains!7474 (t!40940 Nil!27476) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137793 res!831296) b!1246601))

(assert (= (and b!1246601 (not res!831295)) b!1246602))

(assert (=> d!137793 m!1148945))

(declare-fun m!1148989 () Bool)

(assert (=> d!137793 m!1148989))

(declare-fun m!1148991 () Bool)

(assert (=> b!1246602 m!1148991))

(assert (=> b!1246488 d!137793))

(check-sat (not d!137793) (not b!1246590) (not b!1246552) (not b!1246589) (not b!1246602) (not b!1246586) (not d!137775) (not bm!61538) (not b!1246524) (not b!1246525))
(check-sat)
