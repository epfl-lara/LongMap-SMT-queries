; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104006 () Bool)

(assert start!104006)

(declare-fun b!1244527 () Bool)

(declare-fun e!705437 () Bool)

(declare-fun e!705438 () Bool)

(assert (=> b!1244527 (= e!705437 (not e!705438))))

(declare-fun res!830172 () Bool)

(assert (=> b!1244527 (=> res!830172 e!705438)))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1244527 (= res!830172 (bvslt newFrom!287 #b00000000000000000000000000000000))))

(declare-datatypes ((array!79991 0))(
  ( (array!79992 (arr!38588 (Array (_ BitVec 32) (_ BitVec 64))) (size!39126 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!79991)

(declare-datatypes ((List!27492 0))(
  ( (Nil!27489) (Cons!27488 (h!28697 (_ BitVec 64)) (t!40952 List!27492)) )
))
(declare-fun arrayNoDuplicates!0 (array!79991 (_ BitVec 32) List!27492) Bool)

(assert (=> b!1244527 (arrayNoDuplicates!0 a!3892 newFrom!287 Nil!27489)))

(declare-datatypes ((Unit!41232 0))(
  ( (Unit!41233) )
))
(declare-fun lt!562609 () Unit!41232)

(declare-fun from!3270 () (_ BitVec 32))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!79991 (_ BitVec 32) (_ BitVec 32)) Unit!41232)

(assert (=> b!1244527 (= lt!562609 (lemmaNoDuplicateFromThenFromBigger!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) newFrom!287))))

(declare-fun b!1244528 () Bool)

(declare-fun e!705436 () Bool)

(assert (=> b!1244528 (= e!705436 e!705437)))

(declare-fun res!830168 () Bool)

(assert (=> b!1244528 (=> (not res!830168) (not e!705437))))

(assert (=> b!1244528 (= res!830168 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvsge newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun lt!562611 () Unit!41232)

(declare-fun e!705441 () Unit!41232)

(assert (=> b!1244528 (= lt!562611 e!705441)))

(declare-fun c!121867 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1244528 (= c!121867 (validKeyInArray!0 (select (arr!38588 a!3892) from!3270)))))

(declare-fun b!1244529 () Bool)

(declare-fun res!830169 () Bool)

(assert (=> b!1244529 (=> (not res!830169) (not e!705437))))

(assert (=> b!1244529 (= res!830169 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27489))))

(declare-fun b!1244530 () Bool)

(declare-fun res!830175 () Bool)

(assert (=> b!1244530 (=> (not res!830175) (not e!705436))))

(assert (=> b!1244530 (= res!830175 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27489))))

(declare-fun b!1244531 () Bool)

(declare-fun e!705439 () Bool)

(declare-fun contains!7401 (List!27492 (_ BitVec 64)) Bool)

(assert (=> b!1244531 (= e!705439 (not (contains!7401 Nil!27489 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1244532 () Bool)

(assert (=> b!1244532 (= e!705438 e!705439)))

(declare-fun res!830174 () Bool)

(assert (=> b!1244532 (=> (not res!830174) (not e!705439))))

(assert (=> b!1244532 (= res!830174 (not (contains!7401 Nil!27489 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1244533 () Bool)

(declare-fun res!830173 () Bool)

(assert (=> b!1244533 (=> (not res!830173) (not e!705436))))

(assert (=> b!1244533 (= res!830173 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39126 a!3892)) (not (= newFrom!287 (size!39126 a!3892)))))))

(declare-fun b!1244534 () Bool)

(declare-fun lt!562610 () Unit!41232)

(assert (=> b!1244534 (= e!705441 lt!562610)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79991 List!27492 List!27492 (_ BitVec 32)) Unit!41232)

(assert (=> b!1244534 (= lt!562610 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27488 (select (arr!38588 a!3892) from!3270) Nil!27489) Nil!27489 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> b!1244534 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27489)))

(declare-fun b!1244536 () Bool)

(declare-fun Unit!41234 () Unit!41232)

(assert (=> b!1244536 (= e!705441 Unit!41234)))

(declare-fun b!1244535 () Bool)

(declare-fun res!830170 () Bool)

(assert (=> b!1244535 (=> res!830170 e!705438)))

(declare-fun noDuplicate!2026 (List!27492) Bool)

(assert (=> b!1244535 (= res!830170 (not (noDuplicate!2026 Nil!27489)))))

(declare-fun res!830171 () Bool)

(assert (=> start!104006 (=> (not res!830171) (not e!705436))))

(assert (=> start!104006 (= res!830171 (and (bvslt (size!39126 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39126 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39126 a!3892))))))

(assert (=> start!104006 e!705436))

(declare-fun array_inv!29571 (array!79991) Bool)

(assert (=> start!104006 (array_inv!29571 a!3892)))

(assert (=> start!104006 true))

(assert (= (and start!104006 res!830171) b!1244530))

(assert (= (and b!1244530 res!830175) b!1244533))

(assert (= (and b!1244533 res!830173) b!1244528))

(assert (= (and b!1244528 c!121867) b!1244534))

(assert (= (and b!1244528 (not c!121867)) b!1244536))

(assert (= (and b!1244528 res!830168) b!1244529))

(assert (= (and b!1244529 res!830169) b!1244527))

(assert (= (and b!1244527 (not res!830172)) b!1244535))

(assert (= (and b!1244535 (not res!830170)) b!1244532))

(assert (= (and b!1244532 res!830174) b!1244531))

(declare-fun m!1146327 () Bool)

(assert (=> b!1244527 m!1146327))

(declare-fun m!1146329 () Bool)

(assert (=> b!1244527 m!1146329))

(declare-fun m!1146331 () Bool)

(assert (=> b!1244530 m!1146331))

(declare-fun m!1146333 () Bool)

(assert (=> b!1244534 m!1146333))

(declare-fun m!1146335 () Bool)

(assert (=> b!1244534 m!1146335))

(declare-fun m!1146337 () Bool)

(assert (=> b!1244534 m!1146337))

(declare-fun m!1146339 () Bool)

(assert (=> b!1244531 m!1146339))

(assert (=> b!1244529 m!1146337))

(declare-fun m!1146341 () Bool)

(assert (=> b!1244535 m!1146341))

(declare-fun m!1146343 () Bool)

(assert (=> b!1244532 m!1146343))

(assert (=> b!1244528 m!1146333))

(assert (=> b!1244528 m!1146333))

(declare-fun m!1146345 () Bool)

(assert (=> b!1244528 m!1146345))

(declare-fun m!1146347 () Bool)

(assert (=> start!104006 m!1146347))

(check-sat (not b!1244534) (not b!1244535) (not b!1244531) (not b!1244529) (not b!1244527) (not b!1244530) (not start!104006) (not b!1244532) (not b!1244528))
(check-sat)
(get-model)

(declare-fun d!137037 () Bool)

(assert (=> d!137037 (= (validKeyInArray!0 (select (arr!38588 a!3892) from!3270)) (and (not (= (select (arr!38588 a!3892) from!3270) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38588 a!3892) from!3270) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1244528 d!137037))

(declare-fun d!137039 () Bool)

(assert (=> d!137039 (= (array_inv!29571 a!3892) (bvsge (size!39126 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!104006 d!137039))

(declare-fun d!137041 () Bool)

(declare-fun lt!562632 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!610 (List!27492) (InoxSet (_ BitVec 64)))

(assert (=> d!137041 (= lt!562632 (select (content!610 Nil!27489) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!705483 () Bool)

(assert (=> d!137041 (= lt!562632 e!705483)))

(declare-fun res!830229 () Bool)

(assert (=> d!137041 (=> (not res!830229) (not e!705483))))

(get-info :version)

(assert (=> d!137041 (= res!830229 ((_ is Cons!27488) Nil!27489))))

(assert (=> d!137041 (= (contains!7401 Nil!27489 #b0000000000000000000000000000000000000000000000000000000000000000) lt!562632)))

(declare-fun b!1244601 () Bool)

(declare-fun e!705482 () Bool)

(assert (=> b!1244601 (= e!705483 e!705482)))

(declare-fun res!830228 () Bool)

(assert (=> b!1244601 (=> res!830228 e!705482)))

(assert (=> b!1244601 (= res!830228 (= (h!28697 Nil!27489) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1244602 () Bool)

(assert (=> b!1244602 (= e!705482 (contains!7401 (t!40952 Nil!27489) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137041 res!830229) b!1244601))

(assert (= (and b!1244601 (not res!830228)) b!1244602))

(declare-fun m!1146393 () Bool)

(assert (=> d!137041 m!1146393))

(declare-fun m!1146395 () Bool)

(assert (=> d!137041 m!1146395))

(declare-fun m!1146397 () Bool)

(assert (=> b!1244602 m!1146397))

(assert (=> b!1244532 d!137041))

(declare-fun d!137043 () Bool)

(declare-fun res!830236 () Bool)

(declare-fun e!705495 () Bool)

(assert (=> d!137043 (=> res!830236 e!705495)))

(assert (=> d!137043 (= res!830236 (bvsge newFrom!287 (size!39126 a!3892)))))

(assert (=> d!137043 (= (arrayNoDuplicates!0 a!3892 newFrom!287 Nil!27489) e!705495)))

(declare-fun b!1244613 () Bool)

(declare-fun e!705493 () Bool)

(declare-fun e!705492 () Bool)

(assert (=> b!1244613 (= e!705493 e!705492)))

(declare-fun c!121876 () Bool)

(assert (=> b!1244613 (= c!121876 (validKeyInArray!0 (select (arr!38588 a!3892) newFrom!287)))))

(declare-fun bm!61404 () Bool)

(declare-fun call!61407 () Bool)

(assert (=> bm!61404 (= call!61407 (arrayNoDuplicates!0 a!3892 (bvadd newFrom!287 #b00000000000000000000000000000001) (ite c!121876 (Cons!27488 (select (arr!38588 a!3892) newFrom!287) Nil!27489) Nil!27489)))))

(declare-fun b!1244614 () Bool)

(declare-fun e!705494 () Bool)

(assert (=> b!1244614 (= e!705494 (contains!7401 Nil!27489 (select (arr!38588 a!3892) newFrom!287)))))

(declare-fun b!1244615 () Bool)

(assert (=> b!1244615 (= e!705492 call!61407)))

(declare-fun b!1244616 () Bool)

(assert (=> b!1244616 (= e!705492 call!61407)))

(declare-fun b!1244617 () Bool)

(assert (=> b!1244617 (= e!705495 e!705493)))

(declare-fun res!830237 () Bool)

(assert (=> b!1244617 (=> (not res!830237) (not e!705493))))

(assert (=> b!1244617 (= res!830237 (not e!705494))))

(declare-fun res!830238 () Bool)

(assert (=> b!1244617 (=> (not res!830238) (not e!705494))))

(assert (=> b!1244617 (= res!830238 (validKeyInArray!0 (select (arr!38588 a!3892) newFrom!287)))))

(assert (= (and d!137043 (not res!830236)) b!1244617))

(assert (= (and b!1244617 res!830238) b!1244614))

(assert (= (and b!1244617 res!830237) b!1244613))

(assert (= (and b!1244613 c!121876) b!1244616))

(assert (= (and b!1244613 (not c!121876)) b!1244615))

(assert (= (or b!1244616 b!1244615) bm!61404))

(declare-fun m!1146399 () Bool)

(assert (=> b!1244613 m!1146399))

(assert (=> b!1244613 m!1146399))

(declare-fun m!1146401 () Bool)

(assert (=> b!1244613 m!1146401))

(assert (=> bm!61404 m!1146399))

(declare-fun m!1146403 () Bool)

(assert (=> bm!61404 m!1146403))

(assert (=> b!1244614 m!1146399))

(assert (=> b!1244614 m!1146399))

(declare-fun m!1146405 () Bool)

(assert (=> b!1244614 m!1146405))

(assert (=> b!1244617 m!1146399))

(assert (=> b!1244617 m!1146399))

(assert (=> b!1244617 m!1146401))

(assert (=> b!1244527 d!137043))

(declare-fun d!137049 () Bool)

(assert (=> d!137049 (arrayNoDuplicates!0 a!3892 newFrom!287 Nil!27489)))

(declare-fun lt!562635 () Unit!41232)

(declare-fun choose!39 (array!79991 (_ BitVec 32) (_ BitVec 32)) Unit!41232)

(assert (=> d!137049 (= lt!562635 (choose!39 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) newFrom!287))))

(assert (=> d!137049 (bvslt (size!39126 a!3892) #b01111111111111111111111111111111)))

(assert (=> d!137049 (= (lemmaNoDuplicateFromThenFromBigger!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) newFrom!287) lt!562635)))

(declare-fun bs!35020 () Bool)

(assert (= bs!35020 d!137049))

(assert (=> bs!35020 m!1146327))

(declare-fun m!1146407 () Bool)

(assert (=> bs!35020 m!1146407))

(assert (=> b!1244527 d!137049))

(declare-fun d!137053 () Bool)

(declare-fun res!830245 () Bool)

(declare-fun e!705507 () Bool)

(assert (=> d!137053 (=> res!830245 e!705507)))

(assert (=> d!137053 (= res!830245 (bvsge from!3270 (size!39126 a!3892)))))

(assert (=> d!137053 (= (arrayNoDuplicates!0 a!3892 from!3270 Nil!27489) e!705507)))

(declare-fun b!1244628 () Bool)

(declare-fun e!705505 () Bool)

(declare-fun e!705504 () Bool)

(assert (=> b!1244628 (= e!705505 e!705504)))

(declare-fun c!121879 () Bool)

(assert (=> b!1244628 (= c!121879 (validKeyInArray!0 (select (arr!38588 a!3892) from!3270)))))

(declare-fun call!61410 () Bool)

(declare-fun bm!61407 () Bool)

(assert (=> bm!61407 (= call!61410 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!121879 (Cons!27488 (select (arr!38588 a!3892) from!3270) Nil!27489) Nil!27489)))))

(declare-fun b!1244629 () Bool)

(declare-fun e!705506 () Bool)

(assert (=> b!1244629 (= e!705506 (contains!7401 Nil!27489 (select (arr!38588 a!3892) from!3270)))))

(declare-fun b!1244630 () Bool)

(assert (=> b!1244630 (= e!705504 call!61410)))

(declare-fun b!1244631 () Bool)

(assert (=> b!1244631 (= e!705504 call!61410)))

(declare-fun b!1244632 () Bool)

(assert (=> b!1244632 (= e!705507 e!705505)))

(declare-fun res!830246 () Bool)

(assert (=> b!1244632 (=> (not res!830246) (not e!705505))))

(assert (=> b!1244632 (= res!830246 (not e!705506))))

(declare-fun res!830247 () Bool)

(assert (=> b!1244632 (=> (not res!830247) (not e!705506))))

(assert (=> b!1244632 (= res!830247 (validKeyInArray!0 (select (arr!38588 a!3892) from!3270)))))

(assert (= (and d!137053 (not res!830245)) b!1244632))

(assert (= (and b!1244632 res!830247) b!1244629))

(assert (= (and b!1244632 res!830246) b!1244628))

(assert (= (and b!1244628 c!121879) b!1244631))

(assert (= (and b!1244628 (not c!121879)) b!1244630))

(assert (= (or b!1244631 b!1244630) bm!61407))

(assert (=> b!1244628 m!1146333))

(assert (=> b!1244628 m!1146333))

(assert (=> b!1244628 m!1146345))

(assert (=> bm!61407 m!1146333))

(declare-fun m!1146409 () Bool)

(assert (=> bm!61407 m!1146409))

(assert (=> b!1244629 m!1146333))

(assert (=> b!1244629 m!1146333))

(declare-fun m!1146411 () Bool)

(assert (=> b!1244629 m!1146411))

(assert (=> b!1244632 m!1146333))

(assert (=> b!1244632 m!1146333))

(assert (=> b!1244632 m!1146345))

(assert (=> b!1244530 d!137053))

(declare-fun d!137055 () Bool)

(declare-fun lt!562636 () Bool)

(assert (=> d!137055 (= lt!562636 (select (content!610 Nil!27489) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!705509 () Bool)

(assert (=> d!137055 (= lt!562636 e!705509)))

(declare-fun res!830249 () Bool)

(assert (=> d!137055 (=> (not res!830249) (not e!705509))))

(assert (=> d!137055 (= res!830249 ((_ is Cons!27488) Nil!27489))))

(assert (=> d!137055 (= (contains!7401 Nil!27489 #b1000000000000000000000000000000000000000000000000000000000000000) lt!562636)))

(declare-fun b!1244633 () Bool)

(declare-fun e!705508 () Bool)

(assert (=> b!1244633 (= e!705509 e!705508)))

(declare-fun res!830248 () Bool)

(assert (=> b!1244633 (=> res!830248 e!705508)))

(assert (=> b!1244633 (= res!830248 (= (h!28697 Nil!27489) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1244634 () Bool)

(assert (=> b!1244634 (= e!705508 (contains!7401 (t!40952 Nil!27489) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137055 res!830249) b!1244633))

(assert (= (and b!1244633 (not res!830248)) b!1244634))

(assert (=> d!137055 m!1146393))

(declare-fun m!1146413 () Bool)

(assert (=> d!137055 m!1146413))

(declare-fun m!1146415 () Bool)

(assert (=> b!1244634 m!1146415))

(assert (=> b!1244531 d!137055))

(declare-fun d!137057 () Bool)

(assert (=> d!137057 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27489)))

(declare-fun lt!562642 () Unit!41232)

(declare-fun choose!80 (array!79991 List!27492 List!27492 (_ BitVec 32)) Unit!41232)

(assert (=> d!137057 (= lt!562642 (choose!80 a!3892 (Cons!27488 (select (arr!38588 a!3892) from!3270) Nil!27489) Nil!27489 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> d!137057 (bvslt (size!39126 a!3892) #b01111111111111111111111111111111)))

(assert (=> d!137057 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27488 (select (arr!38588 a!3892) from!3270) Nil!27489) Nil!27489 (bvadd #b00000000000000000000000000000001 from!3270)) lt!562642)))

(declare-fun bs!35021 () Bool)

(assert (= bs!35021 d!137057))

(assert (=> bs!35021 m!1146337))

(declare-fun m!1146419 () Bool)

(assert (=> bs!35021 m!1146419))

(assert (=> b!1244534 d!137057))

(declare-fun d!137059 () Bool)

(declare-fun res!830259 () Bool)

(declare-fun e!705523 () Bool)

(assert (=> d!137059 (=> res!830259 e!705523)))

(assert (=> d!137059 (= res!830259 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) (size!39126 a!3892)))))

(assert (=> d!137059 (= (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27489) e!705523)))

(declare-fun b!1244646 () Bool)

(declare-fun e!705521 () Bool)

(declare-fun e!705520 () Bool)

(assert (=> b!1244646 (= e!705521 e!705520)))

(declare-fun c!121881 () Bool)

(assert (=> b!1244646 (= c!121881 (validKeyInArray!0 (select (arr!38588 a!3892) (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun call!61412 () Bool)

(declare-fun bm!61409 () Bool)

(assert (=> bm!61409 (= call!61412 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270 #b00000000000000000000000000000001) (ite c!121881 (Cons!27488 (select (arr!38588 a!3892) (bvadd #b00000000000000000000000000000001 from!3270)) Nil!27489) Nil!27489)))))

(declare-fun b!1244647 () Bool)

(declare-fun e!705522 () Bool)

(assert (=> b!1244647 (= e!705522 (contains!7401 Nil!27489 (select (arr!38588 a!3892) (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun b!1244648 () Bool)

(assert (=> b!1244648 (= e!705520 call!61412)))

(declare-fun b!1244649 () Bool)

(assert (=> b!1244649 (= e!705520 call!61412)))

(declare-fun b!1244650 () Bool)

(assert (=> b!1244650 (= e!705523 e!705521)))

(declare-fun res!830260 () Bool)

(assert (=> b!1244650 (=> (not res!830260) (not e!705521))))

(assert (=> b!1244650 (= res!830260 (not e!705522))))

(declare-fun res!830261 () Bool)

(assert (=> b!1244650 (=> (not res!830261) (not e!705522))))

(assert (=> b!1244650 (= res!830261 (validKeyInArray!0 (select (arr!38588 a!3892) (bvadd #b00000000000000000000000000000001 from!3270))))))

(assert (= (and d!137059 (not res!830259)) b!1244650))

(assert (= (and b!1244650 res!830261) b!1244647))

(assert (= (and b!1244650 res!830260) b!1244646))

(assert (= (and b!1244646 c!121881) b!1244649))

(assert (= (and b!1244646 (not c!121881)) b!1244648))

(assert (= (or b!1244649 b!1244648) bm!61409))

(declare-fun m!1146429 () Bool)

(assert (=> b!1244646 m!1146429))

(assert (=> b!1244646 m!1146429))

(declare-fun m!1146431 () Bool)

(assert (=> b!1244646 m!1146431))

(assert (=> bm!61409 m!1146429))

(declare-fun m!1146435 () Bool)

(assert (=> bm!61409 m!1146435))

(assert (=> b!1244647 m!1146429))

(assert (=> b!1244647 m!1146429))

(declare-fun m!1146437 () Bool)

(assert (=> b!1244647 m!1146437))

(assert (=> b!1244650 m!1146429))

(assert (=> b!1244650 m!1146429))

(assert (=> b!1244650 m!1146431))

(assert (=> b!1244534 d!137059))

(assert (=> b!1244529 d!137059))

(declare-fun d!137065 () Bool)

(declare-fun res!830266 () Bool)

(declare-fun e!705528 () Bool)

(assert (=> d!137065 (=> res!830266 e!705528)))

(assert (=> d!137065 (= res!830266 ((_ is Nil!27489) Nil!27489))))

(assert (=> d!137065 (= (noDuplicate!2026 Nil!27489) e!705528)))

(declare-fun b!1244655 () Bool)

(declare-fun e!705529 () Bool)

(assert (=> b!1244655 (= e!705528 e!705529)))

(declare-fun res!830267 () Bool)

(assert (=> b!1244655 (=> (not res!830267) (not e!705529))))

(assert (=> b!1244655 (= res!830267 (not (contains!7401 (t!40952 Nil!27489) (h!28697 Nil!27489))))))

(declare-fun b!1244656 () Bool)

(assert (=> b!1244656 (= e!705529 (noDuplicate!2026 (t!40952 Nil!27489)))))

(assert (= (and d!137065 (not res!830266)) b!1244655))

(assert (= (and b!1244655 res!830267) b!1244656))

(declare-fun m!1146441 () Bool)

(assert (=> b!1244655 m!1146441))

(declare-fun m!1146443 () Bool)

(assert (=> b!1244656 m!1146443))

(assert (=> b!1244535 d!137065))

(check-sat (not d!137055) (not d!137041) (not b!1244629) (not b!1244613) (not b!1244602) (not b!1244614) (not b!1244647) (not bm!61404) (not b!1244650) (not b!1244617) (not b!1244655) (not bm!61407) (not bm!61409) (not b!1244632) (not b!1244634) (not b!1244646) (not b!1244628) (not b!1244656) (not d!137057) (not d!137049))
(check-sat)
