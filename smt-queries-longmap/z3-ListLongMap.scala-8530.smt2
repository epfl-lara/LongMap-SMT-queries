; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104014 () Bool)

(assert start!104014)

(declare-fun b!1244639 () Bool)

(declare-datatypes ((Unit!41390 0))(
  ( (Unit!41391) )
))
(declare-fun e!705504 () Unit!41390)

(declare-fun Unit!41392 () Unit!41390)

(assert (=> b!1244639 (= e!705504 Unit!41392)))

(declare-fun b!1244640 () Bool)

(declare-fun e!705503 () Bool)

(declare-fun e!705500 () Bool)

(assert (=> b!1244640 (= e!705503 e!705500)))

(declare-fun res!830232 () Bool)

(assert (=> b!1244640 (=> (not res!830232) (not e!705500))))

(declare-datatypes ((List!27431 0))(
  ( (Nil!27428) (Cons!27427 (h!28636 (_ BitVec 64)) (t!40900 List!27431)) )
))
(declare-fun contains!7431 (List!27431 (_ BitVec 64)) Bool)

(assert (=> b!1244640 (= res!830232 (not (contains!7431 Nil!27428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1244641 () Bool)

(declare-fun res!830237 () Bool)

(assert (=> b!1244641 (=> res!830237 e!705503)))

(declare-fun noDuplicate!2009 (List!27431) Bool)

(assert (=> b!1244641 (= res!830237 (not (noDuplicate!2009 Nil!27428)))))

(declare-fun res!830238 () Bool)

(declare-fun e!705499 () Bool)

(assert (=> start!104014 (=> (not res!830238) (not e!705499))))

(declare-datatypes ((array!80073 0))(
  ( (array!80074 (arr!38628 (Array (_ BitVec 32) (_ BitVec 64))) (size!39164 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80073)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104014 (= res!830238 (and (bvslt (size!39164 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39164 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39164 a!3892))))))

(assert (=> start!104014 e!705499))

(declare-fun array_inv!29476 (array!80073) Bool)

(assert (=> start!104014 (array_inv!29476 a!3892)))

(assert (=> start!104014 true))

(declare-fun b!1244642 () Bool)

(declare-fun e!705501 () Bool)

(assert (=> b!1244642 (= e!705501 (not e!705503))))

(declare-fun res!830239 () Bool)

(assert (=> b!1244642 (=> res!830239 e!705503)))

(assert (=> b!1244642 (= res!830239 (bvslt newFrom!287 #b00000000000000000000000000000000))))

(declare-fun arrayNoDuplicates!0 (array!80073 (_ BitVec 32) List!27431) Bool)

(assert (=> b!1244642 (arrayNoDuplicates!0 a!3892 newFrom!287 Nil!27428)))

(declare-fun lt!562797 () Unit!41390)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!80073 (_ BitVec 32) (_ BitVec 32)) Unit!41390)

(assert (=> b!1244642 (= lt!562797 (lemmaNoDuplicateFromThenFromBigger!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) newFrom!287))))

(declare-fun b!1244643 () Bool)

(declare-fun lt!562798 () Unit!41390)

(assert (=> b!1244643 (= e!705504 lt!562798)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80073 List!27431 List!27431 (_ BitVec 32)) Unit!41390)

(assert (=> b!1244643 (= lt!562798 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27427 (select (arr!38628 a!3892) from!3270) Nil!27428) Nil!27428 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> b!1244643 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27428)))

(declare-fun b!1244644 () Bool)

(assert (=> b!1244644 (= e!705499 e!705501)))

(declare-fun res!830234 () Bool)

(assert (=> b!1244644 (=> (not res!830234) (not e!705501))))

(assert (=> b!1244644 (= res!830234 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvsge newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun lt!562799 () Unit!41390)

(assert (=> b!1244644 (= lt!562799 e!705504)))

(declare-fun c!121888 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1244644 (= c!121888 (validKeyInArray!0 (select (arr!38628 a!3892) from!3270)))))

(declare-fun b!1244645 () Bool)

(declare-fun res!830236 () Bool)

(assert (=> b!1244645 (=> (not res!830236) (not e!705501))))

(assert (=> b!1244645 (= res!830236 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27428))))

(declare-fun b!1244646 () Bool)

(assert (=> b!1244646 (= e!705500 (not (contains!7431 Nil!27428 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1244647 () Bool)

(declare-fun res!830233 () Bool)

(assert (=> b!1244647 (=> (not res!830233) (not e!705499))))

(assert (=> b!1244647 (= res!830233 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39164 a!3892)) (not (= newFrom!287 (size!39164 a!3892)))))))

(declare-fun b!1244648 () Bool)

(declare-fun res!830235 () Bool)

(assert (=> b!1244648 (=> (not res!830235) (not e!705499))))

(assert (=> b!1244648 (= res!830235 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27428))))

(assert (= (and start!104014 res!830238) b!1244648))

(assert (= (and b!1244648 res!830235) b!1244647))

(assert (= (and b!1244647 res!830233) b!1244644))

(assert (= (and b!1244644 c!121888) b!1244643))

(assert (= (and b!1244644 (not c!121888)) b!1244639))

(assert (= (and b!1244644 res!830234) b!1244645))

(assert (= (and b!1244645 res!830236) b!1244642))

(assert (= (and b!1244642 (not res!830239)) b!1244641))

(assert (= (and b!1244641 (not res!830237)) b!1244640))

(assert (= (and b!1244640 res!830232) b!1244646))

(declare-fun m!1146879 () Bool)

(assert (=> b!1244642 m!1146879))

(declare-fun m!1146881 () Bool)

(assert (=> b!1244642 m!1146881))

(declare-fun m!1146883 () Bool)

(assert (=> b!1244645 m!1146883))

(declare-fun m!1146885 () Bool)

(assert (=> start!104014 m!1146885))

(declare-fun m!1146887 () Bool)

(assert (=> b!1244646 m!1146887))

(declare-fun m!1146889 () Bool)

(assert (=> b!1244640 m!1146889))

(declare-fun m!1146891 () Bool)

(assert (=> b!1244643 m!1146891))

(declare-fun m!1146893 () Bool)

(assert (=> b!1244643 m!1146893))

(assert (=> b!1244643 m!1146883))

(declare-fun m!1146895 () Bool)

(assert (=> b!1244648 m!1146895))

(assert (=> b!1244644 m!1146891))

(assert (=> b!1244644 m!1146891))

(declare-fun m!1146897 () Bool)

(assert (=> b!1244644 m!1146897))

(declare-fun m!1146899 () Bool)

(assert (=> b!1244641 m!1146899))

(check-sat (not start!104014) (not b!1244642) (not b!1244646) (not b!1244648) (not b!1244643) (not b!1244644) (not b!1244645) (not b!1244640) (not b!1244641))
(check-sat)
(get-model)

(declare-fun d!137171 () Bool)

(assert (=> d!137171 (= (array_inv!29476 a!3892) (bvsge (size!39164 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!104014 d!137171))

(declare-fun d!137173 () Bool)

(assert (=> d!137173 (= (validKeyInArray!0 (select (arr!38628 a!3892) from!3270)) (and (not (= (select (arr!38628 a!3892) from!3270) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38628 a!3892) from!3270) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1244644 d!137173))

(declare-fun d!137175 () Bool)

(declare-fun lt!562811 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!611 (List!27431) (InoxSet (_ BitVec 64)))

(assert (=> d!137175 (= lt!562811 (select (content!611 Nil!27428) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!705528 () Bool)

(assert (=> d!137175 (= lt!562811 e!705528)))

(declare-fun res!830269 () Bool)

(assert (=> d!137175 (=> (not res!830269) (not e!705528))))

(get-info :version)

(assert (=> d!137175 (= res!830269 ((_ is Cons!27427) Nil!27428))))

(assert (=> d!137175 (= (contains!7431 Nil!27428 #b0000000000000000000000000000000000000000000000000000000000000000) lt!562811)))

(declare-fun b!1244683 () Bool)

(declare-fun e!705527 () Bool)

(assert (=> b!1244683 (= e!705528 e!705527)))

(declare-fun res!830268 () Bool)

(assert (=> b!1244683 (=> res!830268 e!705527)))

(assert (=> b!1244683 (= res!830268 (= (h!28636 Nil!27428) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1244684 () Bool)

(assert (=> b!1244684 (= e!705527 (contains!7431 (t!40900 Nil!27428) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137175 res!830269) b!1244683))

(assert (= (and b!1244683 (not res!830268)) b!1244684))

(declare-fun m!1146923 () Bool)

(assert (=> d!137175 m!1146923))

(declare-fun m!1146925 () Bool)

(assert (=> d!137175 m!1146925))

(declare-fun m!1146927 () Bool)

(assert (=> b!1244684 m!1146927))

(assert (=> b!1244640 d!137175))

(declare-fun b!1244701 () Bool)

(declare-fun e!705544 () Bool)

(declare-fun e!705543 () Bool)

(assert (=> b!1244701 (= e!705544 e!705543)))

(declare-fun c!121894 () Bool)

(assert (=> b!1244701 (= c!121894 (validKeyInArray!0 (select (arr!38628 a!3892) (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun b!1244702 () Bool)

(declare-fun call!61426 () Bool)

(assert (=> b!1244702 (= e!705543 call!61426)))

(declare-fun d!137177 () Bool)

(declare-fun res!830283 () Bool)

(declare-fun e!705545 () Bool)

(assert (=> d!137177 (=> res!830283 e!705545)))

(assert (=> d!137177 (= res!830283 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) (size!39164 a!3892)))))

(assert (=> d!137177 (= (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27428) e!705545)))

(declare-fun b!1244703 () Bool)

(assert (=> b!1244703 (= e!705545 e!705544)))

(declare-fun res!830282 () Bool)

(assert (=> b!1244703 (=> (not res!830282) (not e!705544))))

(declare-fun e!705546 () Bool)

(assert (=> b!1244703 (= res!830282 (not e!705546))))

(declare-fun res!830284 () Bool)

(assert (=> b!1244703 (=> (not res!830284) (not e!705546))))

(assert (=> b!1244703 (= res!830284 (validKeyInArray!0 (select (arr!38628 a!3892) (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun b!1244704 () Bool)

(assert (=> b!1244704 (= e!705543 call!61426)))

(declare-fun bm!61423 () Bool)

(assert (=> bm!61423 (= call!61426 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270 #b00000000000000000000000000000001) (ite c!121894 (Cons!27427 (select (arr!38628 a!3892) (bvadd #b00000000000000000000000000000001 from!3270)) Nil!27428) Nil!27428)))))

(declare-fun b!1244705 () Bool)

(assert (=> b!1244705 (= e!705546 (contains!7431 Nil!27428 (select (arr!38628 a!3892) (bvadd #b00000000000000000000000000000001 from!3270))))))

(assert (= (and d!137177 (not res!830283)) b!1244703))

(assert (= (and b!1244703 res!830284) b!1244705))

(assert (= (and b!1244703 res!830282) b!1244701))

(assert (= (and b!1244701 c!121894) b!1244702))

(assert (= (and b!1244701 (not c!121894)) b!1244704))

(assert (= (or b!1244702 b!1244704) bm!61423))

(declare-fun m!1146935 () Bool)

(assert (=> b!1244701 m!1146935))

(assert (=> b!1244701 m!1146935))

(declare-fun m!1146937 () Bool)

(assert (=> b!1244701 m!1146937))

(assert (=> b!1244703 m!1146935))

(assert (=> b!1244703 m!1146935))

(assert (=> b!1244703 m!1146937))

(assert (=> bm!61423 m!1146935))

(declare-fun m!1146941 () Bool)

(assert (=> bm!61423 m!1146941))

(assert (=> b!1244705 m!1146935))

(assert (=> b!1244705 m!1146935))

(declare-fun m!1146945 () Bool)

(assert (=> b!1244705 m!1146945))

(assert (=> b!1244645 d!137177))

(declare-fun d!137191 () Bool)

(declare-fun res!830295 () Bool)

(declare-fun e!705557 () Bool)

(assert (=> d!137191 (=> res!830295 e!705557)))

(assert (=> d!137191 (= res!830295 ((_ is Nil!27428) Nil!27428))))

(assert (=> d!137191 (= (noDuplicate!2009 Nil!27428) e!705557)))

(declare-fun b!1244716 () Bool)

(declare-fun e!705558 () Bool)

(assert (=> b!1244716 (= e!705557 e!705558)))

(declare-fun res!830296 () Bool)

(assert (=> b!1244716 (=> (not res!830296) (not e!705558))))

(assert (=> b!1244716 (= res!830296 (not (contains!7431 (t!40900 Nil!27428) (h!28636 Nil!27428))))))

(declare-fun b!1244717 () Bool)

(assert (=> b!1244717 (= e!705558 (noDuplicate!2009 (t!40900 Nil!27428)))))

(assert (= (and d!137191 (not res!830295)) b!1244716))

(assert (= (and b!1244716 res!830296) b!1244717))

(declare-fun m!1146947 () Bool)

(assert (=> b!1244716 m!1146947))

(declare-fun m!1146949 () Bool)

(assert (=> b!1244717 m!1146949))

(assert (=> b!1244641 d!137191))

(declare-fun d!137193 () Bool)

(declare-fun lt!562822 () Bool)

(assert (=> d!137193 (= lt!562822 (select (content!611 Nil!27428) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!705562 () Bool)

(assert (=> d!137193 (= lt!562822 e!705562)))

(declare-fun res!830300 () Bool)

(assert (=> d!137193 (=> (not res!830300) (not e!705562))))

(assert (=> d!137193 (= res!830300 ((_ is Cons!27427) Nil!27428))))

(assert (=> d!137193 (= (contains!7431 Nil!27428 #b1000000000000000000000000000000000000000000000000000000000000000) lt!562822)))

(declare-fun b!1244720 () Bool)

(declare-fun e!705561 () Bool)

(assert (=> b!1244720 (= e!705562 e!705561)))

(declare-fun res!830299 () Bool)

(assert (=> b!1244720 (=> res!830299 e!705561)))

(assert (=> b!1244720 (= res!830299 (= (h!28636 Nil!27428) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1244721 () Bool)

(assert (=> b!1244721 (= e!705561 (contains!7431 (t!40900 Nil!27428) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137193 res!830300) b!1244720))

(assert (= (and b!1244720 (not res!830299)) b!1244721))

(assert (=> d!137193 m!1146923))

(declare-fun m!1146959 () Bool)

(assert (=> d!137193 m!1146959))

(declare-fun m!1146961 () Bool)

(assert (=> b!1244721 m!1146961))

(assert (=> b!1244646 d!137193))

(declare-fun d!137199 () Bool)

(assert (=> d!137199 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27428)))

(declare-fun lt!562825 () Unit!41390)

(declare-fun choose!80 (array!80073 List!27431 List!27431 (_ BitVec 32)) Unit!41390)

(assert (=> d!137199 (= lt!562825 (choose!80 a!3892 (Cons!27427 (select (arr!38628 a!3892) from!3270) Nil!27428) Nil!27428 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> d!137199 (bvslt (size!39164 a!3892) #b01111111111111111111111111111111)))

(assert (=> d!137199 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27427 (select (arr!38628 a!3892) from!3270) Nil!27428) Nil!27428 (bvadd #b00000000000000000000000000000001 from!3270)) lt!562825)))

(declare-fun bs!35049 () Bool)

(assert (= bs!35049 d!137199))

(assert (=> bs!35049 m!1146883))

(declare-fun m!1146963 () Bool)

(assert (=> bs!35049 m!1146963))

(assert (=> b!1244643 d!137199))

(assert (=> b!1244643 d!137177))

(declare-fun b!1244730 () Bool)

(declare-fun e!705574 () Bool)

(declare-fun e!705573 () Bool)

(assert (=> b!1244730 (= e!705574 e!705573)))

(declare-fun c!121895 () Bool)

(assert (=> b!1244730 (= c!121895 (validKeyInArray!0 (select (arr!38628 a!3892) from!3270)))))

(declare-fun b!1244731 () Bool)

(declare-fun call!61427 () Bool)

(assert (=> b!1244731 (= e!705573 call!61427)))

(declare-fun d!137201 () Bool)

(declare-fun res!830312 () Bool)

(declare-fun e!705575 () Bool)

(assert (=> d!137201 (=> res!830312 e!705575)))

(assert (=> d!137201 (= res!830312 (bvsge from!3270 (size!39164 a!3892)))))

(assert (=> d!137201 (= (arrayNoDuplicates!0 a!3892 from!3270 Nil!27428) e!705575)))

(declare-fun b!1244733 () Bool)

(assert (=> b!1244733 (= e!705575 e!705574)))

(declare-fun res!830311 () Bool)

(assert (=> b!1244733 (=> (not res!830311) (not e!705574))))

(declare-fun e!705576 () Bool)

(assert (=> b!1244733 (= res!830311 (not e!705576))))

(declare-fun res!830313 () Bool)

(assert (=> b!1244733 (=> (not res!830313) (not e!705576))))

(assert (=> b!1244733 (= res!830313 (validKeyInArray!0 (select (arr!38628 a!3892) from!3270)))))

(declare-fun b!1244734 () Bool)

(assert (=> b!1244734 (= e!705573 call!61427)))

(declare-fun bm!61424 () Bool)

(assert (=> bm!61424 (= call!61427 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!121895 (Cons!27427 (select (arr!38628 a!3892) from!3270) Nil!27428) Nil!27428)))))

(declare-fun b!1244735 () Bool)

(assert (=> b!1244735 (= e!705576 (contains!7431 Nil!27428 (select (arr!38628 a!3892) from!3270)))))

(assert (= (and d!137201 (not res!830312)) b!1244733))

(assert (= (and b!1244733 res!830313) b!1244735))

(assert (= (and b!1244733 res!830311) b!1244730))

(assert (= (and b!1244730 c!121895) b!1244731))

(assert (= (and b!1244730 (not c!121895)) b!1244734))

(assert (= (or b!1244731 b!1244734) bm!61424))

(assert (=> b!1244730 m!1146891))

(assert (=> b!1244730 m!1146891))

(assert (=> b!1244730 m!1146897))

(assert (=> b!1244733 m!1146891))

(assert (=> b!1244733 m!1146891))

(assert (=> b!1244733 m!1146897))

(assert (=> bm!61424 m!1146891))

(declare-fun m!1146965 () Bool)

(assert (=> bm!61424 m!1146965))

(assert (=> b!1244735 m!1146891))

(assert (=> b!1244735 m!1146891))

(declare-fun m!1146967 () Bool)

(assert (=> b!1244735 m!1146967))

(assert (=> b!1244648 d!137201))

(declare-fun b!1244747 () Bool)

(declare-fun e!705584 () Bool)

(declare-fun e!705583 () Bool)

(assert (=> b!1244747 (= e!705584 e!705583)))

(declare-fun c!121900 () Bool)

(assert (=> b!1244747 (= c!121900 (validKeyInArray!0 (select (arr!38628 a!3892) newFrom!287)))))

(declare-fun b!1244748 () Bool)

(declare-fun call!61432 () Bool)

(assert (=> b!1244748 (= e!705583 call!61432)))

(declare-fun d!137203 () Bool)

(declare-fun res!830317 () Bool)

(declare-fun e!705585 () Bool)

(assert (=> d!137203 (=> res!830317 e!705585)))

(assert (=> d!137203 (= res!830317 (bvsge newFrom!287 (size!39164 a!3892)))))

(assert (=> d!137203 (= (arrayNoDuplicates!0 a!3892 newFrom!287 Nil!27428) e!705585)))

(declare-fun b!1244749 () Bool)

(assert (=> b!1244749 (= e!705585 e!705584)))

(declare-fun res!830316 () Bool)

(assert (=> b!1244749 (=> (not res!830316) (not e!705584))))

(declare-fun e!705586 () Bool)

(assert (=> b!1244749 (= res!830316 (not e!705586))))

(declare-fun res!830318 () Bool)

(assert (=> b!1244749 (=> (not res!830318) (not e!705586))))

(assert (=> b!1244749 (= res!830318 (validKeyInArray!0 (select (arr!38628 a!3892) newFrom!287)))))

(declare-fun b!1244750 () Bool)

(assert (=> b!1244750 (= e!705583 call!61432)))

(declare-fun bm!61429 () Bool)

(assert (=> bm!61429 (= call!61432 (arrayNoDuplicates!0 a!3892 (bvadd newFrom!287 #b00000000000000000000000000000001) (ite c!121900 (Cons!27427 (select (arr!38628 a!3892) newFrom!287) Nil!27428) Nil!27428)))))

(declare-fun b!1244751 () Bool)

(assert (=> b!1244751 (= e!705586 (contains!7431 Nil!27428 (select (arr!38628 a!3892) newFrom!287)))))

(assert (= (and d!137203 (not res!830317)) b!1244749))

(assert (= (and b!1244749 res!830318) b!1244751))

(assert (= (and b!1244749 res!830316) b!1244747))

(assert (= (and b!1244747 c!121900) b!1244748))

(assert (= (and b!1244747 (not c!121900)) b!1244750))

(assert (= (or b!1244748 b!1244750) bm!61429))

(declare-fun m!1146969 () Bool)

(assert (=> b!1244747 m!1146969))

(assert (=> b!1244747 m!1146969))

(declare-fun m!1146971 () Bool)

(assert (=> b!1244747 m!1146971))

(assert (=> b!1244749 m!1146969))

(assert (=> b!1244749 m!1146969))

(assert (=> b!1244749 m!1146971))

(assert (=> bm!61429 m!1146969))

(declare-fun m!1146973 () Bool)

(assert (=> bm!61429 m!1146973))

(assert (=> b!1244751 m!1146969))

(assert (=> b!1244751 m!1146969))

(declare-fun m!1146975 () Bool)

(assert (=> b!1244751 m!1146975))

(assert (=> b!1244642 d!137203))

(declare-fun d!137205 () Bool)

(assert (=> d!137205 (arrayNoDuplicates!0 a!3892 newFrom!287 Nil!27428)))

(declare-fun lt!562828 () Unit!41390)

(declare-fun choose!39 (array!80073 (_ BitVec 32) (_ BitVec 32)) Unit!41390)

(assert (=> d!137205 (= lt!562828 (choose!39 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) newFrom!287))))

(assert (=> d!137205 (bvslt (size!39164 a!3892) #b01111111111111111111111111111111)))

(assert (=> d!137205 (= (lemmaNoDuplicateFromThenFromBigger!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) newFrom!287) lt!562828)))

(declare-fun bs!35050 () Bool)

(assert (= bs!35050 d!137205))

(assert (=> bs!35050 m!1146879))

(declare-fun m!1146999 () Bool)

(assert (=> bs!35050 m!1146999))

(assert (=> b!1244642 d!137205))

(check-sat (not b!1244749) (not b!1244751) (not b!1244701) (not b!1244721) (not d!137175) (not bm!61424) (not bm!61423) (not b!1244703) (not b!1244735) (not b!1244717) (not b!1244747) (not b!1244705) (not b!1244684) (not b!1244733) (not b!1244730) (not b!1244716) (not bm!61429) (not d!137199) (not d!137205) (not d!137193))
(check-sat)
