; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92722 () Bool)

(assert start!92722)

(declare-fun b!1053467 () Bool)

(declare-fun res!702489 () Bool)

(declare-fun e!598305 () Bool)

(assert (=> b!1053467 (=> (not res!702489) (not e!598305))))

(declare-datatypes ((array!66442 0))(
  ( (array!66443 (arr!31956 (Array (_ BitVec 32) (_ BitVec 64))) (size!32492 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66442)

(declare-datatypes ((List!22268 0))(
  ( (Nil!22265) (Cons!22264 (h!23473 (_ BitVec 64)) (t!31575 List!22268)) )
))
(declare-fun arrayNoDuplicates!0 (array!66442 (_ BitVec 32) List!22268) Bool)

(assert (=> b!1053467 (= res!702489 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22265))))

(declare-fun b!1053468 () Bool)

(declare-fun res!702491 () Bool)

(assert (=> b!1053468 (=> (not res!702491) (not e!598305))))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1053468 (= res!702491 (validKeyInArray!0 k!2747))))

(declare-fun b!1053469 () Bool)

(declare-fun e!598306 () Bool)

(declare-fun e!598303 () Bool)

(assert (=> b!1053469 (= e!598306 (not e!598303))))

(declare-fun res!702488 () Bool)

(assert (=> b!1053469 (=> res!702488 e!598303)))

(declare-fun lt!465153 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1053469 (= res!702488 (bvsle lt!465153 i!1381))))

(assert (=> b!1053469 (= (select (store (arr!31956 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465153) k!2747)))

(declare-fun b!1053470 () Bool)

(declare-fun e!598304 () Bool)

(assert (=> b!1053470 (= e!598304 e!598306)))

(declare-fun res!702490 () Bool)

(assert (=> b!1053470 (=> (not res!702490) (not e!598306))))

(assert (=> b!1053470 (= res!702490 (not (= lt!465153 i!1381)))))

(declare-fun lt!465152 () array!66442)

(declare-fun arrayScanForKey!0 (array!66442 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1053470 (= lt!465153 (arrayScanForKey!0 lt!465152 k!2747 #b00000000000000000000000000000000))))

(declare-fun res!702485 () Bool)

(assert (=> start!92722 (=> (not res!702485) (not e!598305))))

(assert (=> start!92722 (= res!702485 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32492 a!3488)) (bvslt (size!32492 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92722 e!598305))

(assert (=> start!92722 true))

(declare-fun array_inv!24736 (array!66442) Bool)

(assert (=> start!92722 (array_inv!24736 a!3488)))

(declare-fun b!1053471 () Bool)

(assert (=> b!1053471 (= e!598305 e!598304)))

(declare-fun res!702486 () Bool)

(assert (=> b!1053471 (=> (not res!702486) (not e!598304))))

(declare-fun arrayContainsKey!0 (array!66442 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1053471 (= res!702486 (arrayContainsKey!0 lt!465152 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1053471 (= lt!465152 (array!66443 (store (arr!31956 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32492 a!3488)))))

(declare-fun b!1053472 () Bool)

(declare-fun res!702487 () Bool)

(assert (=> b!1053472 (=> (not res!702487) (not e!598305))))

(assert (=> b!1053472 (= res!702487 (= (select (arr!31956 a!3488) i!1381) k!2747))))

(declare-fun b!1053473 () Bool)

(assert (=> b!1053473 (= e!598303 (arrayContainsKey!0 a!3488 k!2747 lt!465153))))

(assert (= (and start!92722 res!702485) b!1053467))

(assert (= (and b!1053467 res!702489) b!1053468))

(assert (= (and b!1053468 res!702491) b!1053472))

(assert (= (and b!1053472 res!702487) b!1053471))

(assert (= (and b!1053471 res!702486) b!1053470))

(assert (= (and b!1053470 res!702490) b!1053469))

(assert (= (and b!1053469 (not res!702488)) b!1053473))

(declare-fun m!973751 () Bool)

(assert (=> b!1053472 m!973751))

(declare-fun m!973753 () Bool)

(assert (=> b!1053471 m!973753))

(declare-fun m!973755 () Bool)

(assert (=> b!1053471 m!973755))

(declare-fun m!973757 () Bool)

(assert (=> b!1053468 m!973757))

(declare-fun m!973759 () Bool)

(assert (=> start!92722 m!973759))

(assert (=> b!1053469 m!973755))

(declare-fun m!973761 () Bool)

(assert (=> b!1053469 m!973761))

(declare-fun m!973763 () Bool)

(assert (=> b!1053473 m!973763))

(declare-fun m!973765 () Bool)

(assert (=> b!1053467 m!973765))

(declare-fun m!973767 () Bool)

(assert (=> b!1053470 m!973767))

(push 1)

(assert (not b!1053470))

(assert (not b!1053468))

(assert (not b!1053473))

(assert (not start!92722))

(assert (not b!1053471))

(assert (not b!1053467))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!127915 () Bool)

(declare-fun lt!465159 () (_ BitVec 32))

(assert (=> d!127915 (and (or (bvslt lt!465159 #b00000000000000000000000000000000) (bvsge lt!465159 (size!32492 lt!465152)) (and (bvsge lt!465159 #b00000000000000000000000000000000) (bvslt lt!465159 (size!32492 lt!465152)))) (bvsge lt!465159 #b00000000000000000000000000000000) (bvslt lt!465159 (size!32492 lt!465152)) (= (select (arr!31956 lt!465152) lt!465159) k!2747))))

(declare-fun e!598342 () (_ BitVec 32))

(assert (=> d!127915 (= lt!465159 e!598342)))

(declare-fun c!106962 () Bool)

(assert (=> d!127915 (= c!106962 (= (select (arr!31956 lt!465152) #b00000000000000000000000000000000) k!2747))))

(assert (=> d!127915 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32492 lt!465152)) (bvslt (size!32492 lt!465152) #b01111111111111111111111111111111))))

(assert (=> d!127915 (= (arrayScanForKey!0 lt!465152 k!2747 #b00000000000000000000000000000000) lt!465159)))

(declare-fun b!1053520 () Bool)

(assert (=> b!1053520 (= e!598342 #b00000000000000000000000000000000)))

(declare-fun b!1053521 () Bool)

(assert (=> b!1053521 (= e!598342 (arrayScanForKey!0 lt!465152 k!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!127915 c!106962) b!1053520))

(assert (= (and d!127915 (not c!106962)) b!1053521))

(declare-fun m!973795 () Bool)

(assert (=> d!127915 m!973795))

(declare-fun m!973797 () Bool)

(assert (=> d!127915 m!973797))

(declare-fun m!973799 () Bool)

(assert (=> b!1053521 m!973799))

(assert (=> b!1053470 d!127915))

(declare-fun d!127921 () Bool)

(declare-fun res!702530 () Bool)

(declare-fun e!598357 () Bool)

(assert (=> d!127921 (=> res!702530 e!598357)))

(assert (=> d!127921 (= res!702530 (= (select (arr!31956 lt!465152) #b00000000000000000000000000000000) k!2747))))

(assert (=> d!127921 (= (arrayContainsKey!0 lt!465152 k!2747 #b00000000000000000000000000000000) e!598357)))

(declare-fun b!1053536 () Bool)

(declare-fun e!598358 () Bool)

(assert (=> b!1053536 (= e!598357 e!598358)))

(declare-fun res!702531 () Bool)

(assert (=> b!1053536 (=> (not res!702531) (not e!598358))))

(assert (=> b!1053536 (= res!702531 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32492 lt!465152)))))

(declare-fun b!1053537 () Bool)

(assert (=> b!1053537 (= e!598358 (arrayContainsKey!0 lt!465152 k!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!127921 (not res!702530)) b!1053536))

(assert (= (and b!1053536 res!702531) b!1053537))

(assert (=> d!127921 m!973797))

(declare-fun m!973811 () Bool)

(assert (=> b!1053537 m!973811))

(assert (=> b!1053471 d!127921))

(declare-fun b!1053552 () Bool)

(declare-fun e!598371 () Bool)

(declare-fun call!44758 () Bool)

(assert (=> b!1053552 (= e!598371 call!44758)))

(declare-fun bm!44755 () Bool)

(declare-fun c!106967 () Bool)

(assert (=> bm!44755 (= call!44758 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106967 (Cons!22264 (select (arr!31956 a!3488) #b00000000000000000000000000000000) Nil!22265) Nil!22265)))))

(declare-fun b!1053553 () Bool)

(assert (=> b!1053553 (= e!598371 call!44758)))

(declare-fun b!1053554 () Bool)

(declare-fun e!598370 () Bool)

(declare-fun e!598372 () Bool)

(assert (=> b!1053554 (= e!598370 e!598372)))

(declare-fun res!702540 () Bool)

(assert (=> b!1053554 (=> (not res!702540) (not e!598372))))

(declare-fun e!598369 () Bool)

(assert (=> b!1053554 (= res!702540 (not e!598369))))

(declare-fun res!702539 () Bool)

(assert (=> b!1053554 (=> (not res!702539) (not e!598369))))

(assert (=> b!1053554 (= res!702539 (validKeyInArray!0 (select (arr!31956 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1053555 () Bool)

(declare-fun contains!6170 (List!22268 (_ BitVec 64)) Bool)

(assert (=> b!1053555 (= e!598369 (contains!6170 Nil!22265 (select (arr!31956 a!3488) #b00000000000000000000000000000000)))))

(declare-fun d!127931 () Bool)

(declare-fun res!702538 () Bool)

(assert (=> d!127931 (=> res!702538 e!598370)))

(assert (=> d!127931 (= res!702538 (bvsge #b00000000000000000000000000000000 (size!32492 a!3488)))))

(assert (=> d!127931 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22265) e!598370)))

(declare-fun b!1053556 () Bool)

(assert (=> b!1053556 (= e!598372 e!598371)))

(assert (=> b!1053556 (= c!106967 (validKeyInArray!0 (select (arr!31956 a!3488) #b00000000000000000000000000000000)))))

(assert (= (and d!127931 (not res!702538)) b!1053554))

(assert (= (and b!1053554 res!702539) b!1053555))

(assert (= (and b!1053554 res!702540) b!1053556))

