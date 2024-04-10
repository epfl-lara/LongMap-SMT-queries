; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102584 () Bool)

(assert start!102584)

(declare-fun b!1233415 () Bool)

(declare-fun res!821639 () Bool)

(declare-fun e!699660 () Bool)

(assert (=> b!1233415 (=> res!821639 e!699660)))

(declare-datatypes ((List!27140 0))(
  ( (Nil!27137) (Cons!27136 (h!28345 (_ BitVec 64)) (t!40603 List!27140)) )
))
(declare-fun lt!559679 () List!27140)

(declare-fun noDuplicate!1799 (List!27140) Bool)

(assert (=> b!1233415 (= res!821639 (not (noDuplicate!1799 lt!559679)))))

(declare-fun b!1233416 () Bool)

(declare-fun res!821640 () Bool)

(declare-fun e!699661 () Bool)

(assert (=> b!1233416 (=> (not res!821640) (not e!699661))))

(declare-fun acc!823 () List!27140)

(declare-fun contains!7202 (List!27140 (_ BitVec 64)) Bool)

(assert (=> b!1233416 (= res!821640 (not (contains!7202 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1233417 () Bool)

(declare-fun res!821644 () Bool)

(assert (=> b!1233417 (=> res!821644 e!699660)))

(assert (=> b!1233417 (= res!821644 (contains!7202 lt!559679 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1233418 () Bool)

(declare-fun res!821631 () Bool)

(assert (=> b!1233418 (=> (not res!821631) (not e!699661))))

(assert (=> b!1233418 (= res!821631 (noDuplicate!1799 acc!823))))

(declare-fun b!1233419 () Bool)

(declare-fun res!821641 () Bool)

(assert (=> b!1233419 (=> (not res!821641) (not e!699661))))

(declare-datatypes ((array!79513 0))(
  ( (array!79514 (arr!38367 (Array (_ BitVec 32) (_ BitVec 64))) (size!38903 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79513)

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!79513 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1233419 (= res!821641 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1233420 () Bool)

(declare-fun res!821634 () Bool)

(assert (=> b!1233420 (=> (not res!821634) (not e!699661))))

(assert (=> b!1233420 (= res!821634 (not (contains!7202 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1233422 () Bool)

(assert (=> b!1233422 (= e!699661 (not e!699660))))

(declare-fun res!821643 () Bool)

(assert (=> b!1233422 (=> res!821643 e!699660)))

(assert (=> b!1233422 (= res!821643 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(assert (=> b!1233422 (= lt!559679 (Cons!27136 (select (arr!38367 a!3806) from!3184) Nil!27137))))

(declare-fun e!699662 () Bool)

(assert (=> b!1233422 e!699662))

(declare-fun res!821638 () Bool)

(assert (=> b!1233422 (=> (not res!821638) (not e!699662))))

(declare-fun arrayNoDuplicates!0 (array!79513 (_ BitVec 32) List!27140) Bool)

(assert (=> b!1233422 (= res!821638 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27137))))

(declare-datatypes ((Unit!40840 0))(
  ( (Unit!40841) )
))
(declare-fun lt!559678 () Unit!40840)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79513 List!27140 List!27140 (_ BitVec 32)) Unit!40840)

(assert (=> b!1233422 (= lt!559678 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27137 from!3184))))

(assert (=> b!1233422 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27136 (select (arr!38367 a!3806) from!3184) acc!823))))

(declare-fun b!1233423 () Bool)

(declare-fun res!821637 () Bool)

(assert (=> b!1233423 (=> (not res!821637) (not e!699661))))

(assert (=> b!1233423 (= res!821637 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38903 a!3806)) (bvslt from!3184 (size!38903 a!3806))))))

(declare-fun b!1233424 () Bool)

(declare-fun res!821635 () Bool)

(assert (=> b!1233424 (=> res!821635 e!699660)))

(assert (=> b!1233424 (= res!821635 (contains!7202 lt!559679 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1233425 () Bool)

(declare-fun res!821632 () Bool)

(assert (=> b!1233425 (=> (not res!821632) (not e!699661))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1233425 (= res!821632 (validKeyInArray!0 k0!2913))))

(declare-fun res!821642 () Bool)

(assert (=> start!102584 (=> (not res!821642) (not e!699661))))

(assert (=> start!102584 (= res!821642 (bvslt (size!38903 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102584 e!699661))

(declare-fun array_inv!29215 (array!79513) Bool)

(assert (=> start!102584 (array_inv!29215 a!3806)))

(assert (=> start!102584 true))

(declare-fun b!1233421 () Bool)

(declare-fun res!821636 () Bool)

(assert (=> b!1233421 (=> (not res!821636) (not e!699661))))

(assert (=> b!1233421 (= res!821636 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1233426 () Bool)

(assert (=> b!1233426 (= e!699662 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27136 (select (arr!38367 a!3806) from!3184) Nil!27137)))))

(declare-fun b!1233427 () Bool)

(declare-fun res!821633 () Bool)

(assert (=> b!1233427 (=> (not res!821633) (not e!699661))))

(assert (=> b!1233427 (= res!821633 (validKeyInArray!0 (select (arr!38367 a!3806) from!3184)))))

(declare-fun b!1233428 () Bool)

(assert (=> b!1233428 (= e!699660 (contains!7202 lt!559679 (select (arr!38367 a!3806) from!3184)))))

(assert (= (and start!102584 res!821642) b!1233425))

(assert (= (and b!1233425 res!821632) b!1233423))

(assert (= (and b!1233423 res!821637) b!1233418))

(assert (= (and b!1233418 res!821631) b!1233416))

(assert (= (and b!1233416 res!821640) b!1233420))

(assert (= (and b!1233420 res!821634) b!1233419))

(assert (= (and b!1233419 res!821641) b!1233421))

(assert (= (and b!1233421 res!821636) b!1233427))

(assert (= (and b!1233427 res!821633) b!1233422))

(assert (= (and b!1233422 res!821638) b!1233426))

(assert (= (and b!1233422 (not res!821643)) b!1233415))

(assert (= (and b!1233415 (not res!821639)) b!1233417))

(assert (= (and b!1233417 (not res!821644)) b!1233424))

(assert (= (and b!1233424 (not res!821635)) b!1233428))

(declare-fun m!1137485 () Bool)

(assert (=> b!1233425 m!1137485))

(declare-fun m!1137487 () Bool)

(assert (=> b!1233418 m!1137487))

(declare-fun m!1137489 () Bool)

(assert (=> b!1233421 m!1137489))

(declare-fun m!1137491 () Bool)

(assert (=> b!1233419 m!1137491))

(declare-fun m!1137493 () Bool)

(assert (=> b!1233427 m!1137493))

(assert (=> b!1233427 m!1137493))

(declare-fun m!1137495 () Bool)

(assert (=> b!1233427 m!1137495))

(assert (=> b!1233426 m!1137493))

(declare-fun m!1137497 () Bool)

(assert (=> b!1233426 m!1137497))

(declare-fun m!1137499 () Bool)

(assert (=> b!1233417 m!1137499))

(assert (=> b!1233428 m!1137493))

(assert (=> b!1233428 m!1137493))

(declare-fun m!1137501 () Bool)

(assert (=> b!1233428 m!1137501))

(declare-fun m!1137503 () Bool)

(assert (=> start!102584 m!1137503))

(declare-fun m!1137505 () Bool)

(assert (=> b!1233415 m!1137505))

(assert (=> b!1233422 m!1137493))

(declare-fun m!1137507 () Bool)

(assert (=> b!1233422 m!1137507))

(declare-fun m!1137509 () Bool)

(assert (=> b!1233422 m!1137509))

(declare-fun m!1137511 () Bool)

(assert (=> b!1233422 m!1137511))

(declare-fun m!1137513 () Bool)

(assert (=> b!1233424 m!1137513))

(declare-fun m!1137515 () Bool)

(assert (=> b!1233420 m!1137515))

(declare-fun m!1137517 () Bool)

(assert (=> b!1233416 m!1137517))

(check-sat (not b!1233425) (not b!1233422) (not b!1233415) (not b!1233416) (not b!1233428) (not b!1233421) (not start!102584) (not b!1233424) (not b!1233420) (not b!1233427) (not b!1233419) (not b!1233418) (not b!1233417) (not b!1233426))
(check-sat)
(get-model)

(declare-fun d!135269 () Bool)

(declare-fun lt!559688 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!575 (List!27140) (InoxSet (_ BitVec 64)))

(assert (=> d!135269 (= lt!559688 (select (content!575 lt!559679) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!699680 () Bool)

(assert (=> d!135269 (= lt!559688 e!699680)))

(declare-fun res!821691 () Bool)

(assert (=> d!135269 (=> (not res!821691) (not e!699680))))

(get-info :version)

(assert (=> d!135269 (= res!821691 ((_ is Cons!27136) lt!559679))))

(assert (=> d!135269 (= (contains!7202 lt!559679 #b1000000000000000000000000000000000000000000000000000000000000000) lt!559688)))

(declare-fun b!1233475 () Bool)

(declare-fun e!699681 () Bool)

(assert (=> b!1233475 (= e!699680 e!699681)))

(declare-fun res!821692 () Bool)

(assert (=> b!1233475 (=> res!821692 e!699681)))

(assert (=> b!1233475 (= res!821692 (= (h!28345 lt!559679) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1233476 () Bool)

(assert (=> b!1233476 (= e!699681 (contains!7202 (t!40603 lt!559679) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135269 res!821691) b!1233475))

(assert (= (and b!1233475 (not res!821692)) b!1233476))

(declare-fun m!1137553 () Bool)

(assert (=> d!135269 m!1137553))

(declare-fun m!1137555 () Bool)

(assert (=> d!135269 m!1137555))

(declare-fun m!1137557 () Bool)

(assert (=> b!1233476 m!1137557))

(assert (=> b!1233424 d!135269))

(declare-fun call!60970 () Bool)

(declare-fun bm!60967 () Bool)

(declare-fun c!120754 () Bool)

(assert (=> bm!60967 (= call!60970 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120754 (Cons!27136 (select (arr!38367 a!3806) from!3184) Nil!27137) Nil!27137)))))

(declare-fun b!1233497 () Bool)

(declare-fun e!699700 () Bool)

(assert (=> b!1233497 (= e!699700 call!60970)))

(declare-fun b!1233498 () Bool)

(declare-fun e!699703 () Bool)

(assert (=> b!1233498 (= e!699703 e!699700)))

(assert (=> b!1233498 (= c!120754 (validKeyInArray!0 (select (arr!38367 a!3806) from!3184)))))

(declare-fun b!1233499 () Bool)

(declare-fun e!699701 () Bool)

(assert (=> b!1233499 (= e!699701 (contains!7202 Nil!27137 (select (arr!38367 a!3806) from!3184)))))

(declare-fun b!1233500 () Bool)

(declare-fun e!699702 () Bool)

(assert (=> b!1233500 (= e!699702 e!699703)))

(declare-fun res!821711 () Bool)

(assert (=> b!1233500 (=> (not res!821711) (not e!699703))))

(assert (=> b!1233500 (= res!821711 (not e!699701))))

(declare-fun res!821710 () Bool)

(assert (=> b!1233500 (=> (not res!821710) (not e!699701))))

(assert (=> b!1233500 (= res!821710 (validKeyInArray!0 (select (arr!38367 a!3806) from!3184)))))

(declare-fun b!1233501 () Bool)

(assert (=> b!1233501 (= e!699700 call!60970)))

(declare-fun d!135271 () Bool)

(declare-fun res!821709 () Bool)

(assert (=> d!135271 (=> res!821709 e!699702)))

(assert (=> d!135271 (= res!821709 (bvsge from!3184 (size!38903 a!3806)))))

(assert (=> d!135271 (= (arrayNoDuplicates!0 a!3806 from!3184 Nil!27137) e!699702)))

(assert (= (and d!135271 (not res!821709)) b!1233500))

(assert (= (and b!1233500 res!821710) b!1233499))

(assert (= (and b!1233500 res!821711) b!1233498))

(assert (= (and b!1233498 c!120754) b!1233497))

(assert (= (and b!1233498 (not c!120754)) b!1233501))

(assert (= (or b!1233497 b!1233501) bm!60967))

(assert (=> bm!60967 m!1137493))

(declare-fun m!1137565 () Bool)

(assert (=> bm!60967 m!1137565))

(assert (=> b!1233498 m!1137493))

(assert (=> b!1233498 m!1137493))

(assert (=> b!1233498 m!1137495))

(assert (=> b!1233499 m!1137493))

(assert (=> b!1233499 m!1137493))

(declare-fun m!1137567 () Bool)

(assert (=> b!1233499 m!1137567))

(assert (=> b!1233500 m!1137493))

(assert (=> b!1233500 m!1137493))

(assert (=> b!1233500 m!1137495))

(assert (=> b!1233422 d!135271))

(declare-fun d!135281 () Bool)

(assert (=> d!135281 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27137)))

(declare-fun lt!559697 () Unit!40840)

(declare-fun choose!80 (array!79513 List!27140 List!27140 (_ BitVec 32)) Unit!40840)

(assert (=> d!135281 (= lt!559697 (choose!80 a!3806 acc!823 Nil!27137 from!3184))))

(assert (=> d!135281 (bvslt (size!38903 a!3806) #b01111111111111111111111111111111)))

(assert (=> d!135281 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27137 from!3184) lt!559697)))

(declare-fun bs!34658 () Bool)

(assert (= bs!34658 d!135281))

(assert (=> bs!34658 m!1137507))

(declare-fun m!1137575 () Bool)

(assert (=> bs!34658 m!1137575))

(assert (=> b!1233422 d!135281))

(declare-fun call!60971 () Bool)

(declare-fun c!120757 () Bool)

(declare-fun bm!60968 () Bool)

(assert (=> bm!60968 (= call!60971 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!120757 (Cons!27136 (select (arr!38367 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27136 (select (arr!38367 a!3806) from!3184) acc!823)) (Cons!27136 (select (arr!38367 a!3806) from!3184) acc!823))))))

(declare-fun b!1233520 () Bool)

(declare-fun e!699720 () Bool)

(assert (=> b!1233520 (= e!699720 call!60971)))

(declare-fun b!1233521 () Bool)

(declare-fun e!699723 () Bool)

(assert (=> b!1233521 (= e!699723 e!699720)))

(assert (=> b!1233521 (= c!120757 (validKeyInArray!0 (select (arr!38367 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun e!699721 () Bool)

(declare-fun b!1233522 () Bool)

(assert (=> b!1233522 (= e!699721 (contains!7202 (Cons!27136 (select (arr!38367 a!3806) from!3184) acc!823) (select (arr!38367 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1233523 () Bool)

(declare-fun e!699722 () Bool)

(assert (=> b!1233523 (= e!699722 e!699723)))

(declare-fun res!821728 () Bool)

(assert (=> b!1233523 (=> (not res!821728) (not e!699723))))

(assert (=> b!1233523 (= res!821728 (not e!699721))))

(declare-fun res!821727 () Bool)

(assert (=> b!1233523 (=> (not res!821727) (not e!699721))))

(assert (=> b!1233523 (= res!821727 (validKeyInArray!0 (select (arr!38367 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1233524 () Bool)

(assert (=> b!1233524 (= e!699720 call!60971)))

(declare-fun d!135285 () Bool)

(declare-fun res!821726 () Bool)

(assert (=> d!135285 (=> res!821726 e!699722)))

(assert (=> d!135285 (= res!821726 (bvsge (bvadd #b00000000000000000000000000000001 from!3184) (size!38903 a!3806)))))

(assert (=> d!135285 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27136 (select (arr!38367 a!3806) from!3184) acc!823)) e!699722)))

(assert (= (and d!135285 (not res!821726)) b!1233523))

(assert (= (and b!1233523 res!821727) b!1233522))

(assert (= (and b!1233523 res!821728) b!1233521))

(assert (= (and b!1233521 c!120757) b!1233520))

(assert (= (and b!1233521 (not c!120757)) b!1233524))

(assert (= (or b!1233520 b!1233524) bm!60968))

(declare-fun m!1137581 () Bool)

(assert (=> bm!60968 m!1137581))

(declare-fun m!1137583 () Bool)

(assert (=> bm!60968 m!1137583))

(assert (=> b!1233521 m!1137581))

(assert (=> b!1233521 m!1137581))

(declare-fun m!1137585 () Bool)

(assert (=> b!1233521 m!1137585))

(assert (=> b!1233522 m!1137581))

(assert (=> b!1233522 m!1137581))

(declare-fun m!1137587 () Bool)

(assert (=> b!1233522 m!1137587))

(assert (=> b!1233523 m!1137581))

(assert (=> b!1233523 m!1137581))

(assert (=> b!1233523 m!1137585))

(assert (=> b!1233422 d!135285))

(declare-fun d!135289 () Bool)

(assert (=> d!135289 (= (array_inv!29215 a!3806) (bvsge (size!38903 a!3806) #b00000000000000000000000000000000))))

(assert (=> start!102584 d!135289))

(declare-fun bm!60971 () Bool)

(declare-fun call!60974 () Bool)

(declare-fun c!120758 () Bool)

(assert (=> bm!60971 (= call!60974 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120758 (Cons!27136 (select (arr!38367 a!3806) from!3184) acc!823) acc!823)))))

(declare-fun b!1233525 () Bool)

(declare-fun e!699724 () Bool)

(assert (=> b!1233525 (= e!699724 call!60974)))

(declare-fun b!1233526 () Bool)

(declare-fun e!699727 () Bool)

(assert (=> b!1233526 (= e!699727 e!699724)))

(assert (=> b!1233526 (= c!120758 (validKeyInArray!0 (select (arr!38367 a!3806) from!3184)))))

(declare-fun b!1233527 () Bool)

(declare-fun e!699725 () Bool)

(assert (=> b!1233527 (= e!699725 (contains!7202 acc!823 (select (arr!38367 a!3806) from!3184)))))

(declare-fun b!1233528 () Bool)

(declare-fun e!699726 () Bool)

(assert (=> b!1233528 (= e!699726 e!699727)))

(declare-fun res!821731 () Bool)

(assert (=> b!1233528 (=> (not res!821731) (not e!699727))))

(assert (=> b!1233528 (= res!821731 (not e!699725))))

(declare-fun res!821730 () Bool)

(assert (=> b!1233528 (=> (not res!821730) (not e!699725))))

(assert (=> b!1233528 (= res!821730 (validKeyInArray!0 (select (arr!38367 a!3806) from!3184)))))

(declare-fun b!1233529 () Bool)

(assert (=> b!1233529 (= e!699724 call!60974)))

(declare-fun d!135291 () Bool)

(declare-fun res!821729 () Bool)

(assert (=> d!135291 (=> res!821729 e!699726)))

(assert (=> d!135291 (= res!821729 (bvsge from!3184 (size!38903 a!3806)))))

(assert (=> d!135291 (= (arrayNoDuplicates!0 a!3806 from!3184 acc!823) e!699726)))

(assert (= (and d!135291 (not res!821729)) b!1233528))

(assert (= (and b!1233528 res!821730) b!1233527))

(assert (= (and b!1233528 res!821731) b!1233526))

(assert (= (and b!1233526 c!120758) b!1233525))

(assert (= (and b!1233526 (not c!120758)) b!1233529))

(assert (= (or b!1233525 b!1233529) bm!60971))

(assert (=> bm!60971 m!1137493))

(declare-fun m!1137589 () Bool)

(assert (=> bm!60971 m!1137589))

(assert (=> b!1233526 m!1137493))

(assert (=> b!1233526 m!1137493))

(assert (=> b!1233526 m!1137495))

(assert (=> b!1233527 m!1137493))

(assert (=> b!1233527 m!1137493))

(declare-fun m!1137591 () Bool)

(assert (=> b!1233527 m!1137591))

(assert (=> b!1233528 m!1137493))

(assert (=> b!1233528 m!1137493))

(assert (=> b!1233528 m!1137495))

(assert (=> b!1233421 d!135291))

(declare-fun d!135293 () Bool)

(declare-fun lt!559698 () Bool)

(assert (=> d!135293 (= lt!559698 (select (content!575 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!699728 () Bool)

(assert (=> d!135293 (= lt!559698 e!699728)))

(declare-fun res!821732 () Bool)

(assert (=> d!135293 (=> (not res!821732) (not e!699728))))

(assert (=> d!135293 (= res!821732 ((_ is Cons!27136) acc!823))))

(assert (=> d!135293 (= (contains!7202 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000) lt!559698)))

(declare-fun b!1233530 () Bool)

(declare-fun e!699729 () Bool)

(assert (=> b!1233530 (= e!699728 e!699729)))

(declare-fun res!821733 () Bool)

(assert (=> b!1233530 (=> res!821733 e!699729)))

(assert (=> b!1233530 (= res!821733 (= (h!28345 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1233531 () Bool)

(assert (=> b!1233531 (= e!699729 (contains!7202 (t!40603 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135293 res!821732) b!1233530))

(assert (= (and b!1233530 (not res!821733)) b!1233531))

(declare-fun m!1137593 () Bool)

(assert (=> d!135293 m!1137593))

(declare-fun m!1137595 () Bool)

(assert (=> d!135293 m!1137595))

(declare-fun m!1137597 () Bool)

(assert (=> b!1233531 m!1137597))

(assert (=> b!1233420 d!135293))

(declare-fun d!135295 () Bool)

(declare-fun res!821747 () Bool)

(declare-fun e!699746 () Bool)

(assert (=> d!135295 (=> res!821747 e!699746)))

(assert (=> d!135295 (= res!821747 (= (select (arr!38367 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) k0!2913))))

(assert (=> d!135295 (= (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)) e!699746)))

(declare-fun b!1233551 () Bool)

(declare-fun e!699747 () Bool)

(assert (=> b!1233551 (= e!699746 e!699747)))

(declare-fun res!821748 () Bool)

(assert (=> b!1233551 (=> (not res!821748) (not e!699747))))

(assert (=> b!1233551 (= res!821748 (bvslt (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (size!38903 a!3806)))))

(declare-fun b!1233552 () Bool)

(assert (=> b!1233552 (= e!699747 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)))))

(assert (= (and d!135295 (not res!821747)) b!1233551))

(assert (= (and b!1233551 res!821748) b!1233552))

(assert (=> d!135295 m!1137581))

(declare-fun m!1137607 () Bool)

(assert (=> b!1233552 m!1137607))

(assert (=> b!1233419 d!135295))

(declare-fun d!135301 () Bool)

(declare-fun res!821767 () Bool)

(declare-fun e!699768 () Bool)

(assert (=> d!135301 (=> res!821767 e!699768)))

(assert (=> d!135301 (= res!821767 ((_ is Nil!27137) acc!823))))

(assert (=> d!135301 (= (noDuplicate!1799 acc!823) e!699768)))

(declare-fun b!1233575 () Bool)

(declare-fun e!699769 () Bool)

(assert (=> b!1233575 (= e!699768 e!699769)))

(declare-fun res!821768 () Bool)

(assert (=> b!1233575 (=> (not res!821768) (not e!699769))))

(assert (=> b!1233575 (= res!821768 (not (contains!7202 (t!40603 acc!823) (h!28345 acc!823))))))

(declare-fun b!1233576 () Bool)

(assert (=> b!1233576 (= e!699769 (noDuplicate!1799 (t!40603 acc!823)))))

(assert (= (and d!135301 (not res!821767)) b!1233575))

(assert (= (and b!1233575 res!821768) b!1233576))

(declare-fun m!1137629 () Bool)

(assert (=> b!1233575 m!1137629))

(declare-fun m!1137631 () Bool)

(assert (=> b!1233576 m!1137631))

(assert (=> b!1233418 d!135301))

(declare-fun lt!559701 () Bool)

(declare-fun d!135313 () Bool)

(assert (=> d!135313 (= lt!559701 (select (content!575 lt!559679) (select (arr!38367 a!3806) from!3184)))))

(declare-fun e!699772 () Bool)

(assert (=> d!135313 (= lt!559701 e!699772)))

(declare-fun res!821771 () Bool)

(assert (=> d!135313 (=> (not res!821771) (not e!699772))))

(assert (=> d!135313 (= res!821771 ((_ is Cons!27136) lt!559679))))

(assert (=> d!135313 (= (contains!7202 lt!559679 (select (arr!38367 a!3806) from!3184)) lt!559701)))

(declare-fun b!1233579 () Bool)

(declare-fun e!699773 () Bool)

(assert (=> b!1233579 (= e!699772 e!699773)))

(declare-fun res!821772 () Bool)

(assert (=> b!1233579 (=> res!821772 e!699773)))

(assert (=> b!1233579 (= res!821772 (= (h!28345 lt!559679) (select (arr!38367 a!3806) from!3184)))))

(declare-fun b!1233580 () Bool)

(assert (=> b!1233580 (= e!699773 (contains!7202 (t!40603 lt!559679) (select (arr!38367 a!3806) from!3184)))))

(assert (= (and d!135313 res!821771) b!1233579))

(assert (= (and b!1233579 (not res!821772)) b!1233580))

(assert (=> d!135313 m!1137553))

(assert (=> d!135313 m!1137493))

(declare-fun m!1137643 () Bool)

(assert (=> d!135313 m!1137643))

(assert (=> b!1233580 m!1137493))

(declare-fun m!1137645 () Bool)

(assert (=> b!1233580 m!1137645))

(assert (=> b!1233428 d!135313))

(declare-fun d!135321 () Bool)

(declare-fun lt!559703 () Bool)

(assert (=> d!135321 (= lt!559703 (select (content!575 lt!559679) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!699782 () Bool)

(assert (=> d!135321 (= lt!559703 e!699782)))

(declare-fun res!821780 () Bool)

(assert (=> d!135321 (=> (not res!821780) (not e!699782))))

(assert (=> d!135321 (= res!821780 ((_ is Cons!27136) lt!559679))))

(assert (=> d!135321 (= (contains!7202 lt!559679 #b0000000000000000000000000000000000000000000000000000000000000000) lt!559703)))

(declare-fun b!1233590 () Bool)

(declare-fun e!699783 () Bool)

(assert (=> b!1233590 (= e!699782 e!699783)))

(declare-fun res!821781 () Bool)

(assert (=> b!1233590 (=> res!821781 e!699783)))

(assert (=> b!1233590 (= res!821781 (= (h!28345 lt!559679) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1233591 () Bool)

(assert (=> b!1233591 (= e!699783 (contains!7202 (t!40603 lt!559679) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135321 res!821780) b!1233590))

(assert (= (and b!1233590 (not res!821781)) b!1233591))

(assert (=> d!135321 m!1137553))

(declare-fun m!1137651 () Bool)

(assert (=> d!135321 m!1137651))

(declare-fun m!1137653 () Bool)

(assert (=> b!1233591 m!1137653))

(assert (=> b!1233417 d!135321))

(declare-fun d!135325 () Bool)

(assert (=> d!135325 (= (validKeyInArray!0 (select (arr!38367 a!3806) from!3184)) (and (not (= (select (arr!38367 a!3806) from!3184) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38367 a!3806) from!3184) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1233427 d!135325))

(declare-fun d!135335 () Bool)

(declare-fun lt!559707 () Bool)

(assert (=> d!135335 (= lt!559707 (select (content!575 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!699792 () Bool)

(assert (=> d!135335 (= lt!559707 e!699792)))

(declare-fun res!821790 () Bool)

(assert (=> d!135335 (=> (not res!821790) (not e!699792))))

(assert (=> d!135335 (= res!821790 ((_ is Cons!27136) acc!823))))

(assert (=> d!135335 (= (contains!7202 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000) lt!559707)))

(declare-fun b!1233600 () Bool)

(declare-fun e!699793 () Bool)

(assert (=> b!1233600 (= e!699792 e!699793)))

(declare-fun res!821791 () Bool)

(assert (=> b!1233600 (=> res!821791 e!699793)))

(assert (=> b!1233600 (= res!821791 (= (h!28345 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1233601 () Bool)

(assert (=> b!1233601 (= e!699793 (contains!7202 (t!40603 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135335 res!821790) b!1233600))

(assert (= (and b!1233600 (not res!821791)) b!1233601))

(assert (=> d!135335 m!1137593))

(declare-fun m!1137677 () Bool)

(assert (=> d!135335 m!1137677))

(declare-fun m!1137679 () Bool)

(assert (=> b!1233601 m!1137679))

(assert (=> b!1233416 d!135335))

(declare-fun c!120765 () Bool)

(declare-fun call!60981 () Bool)

(declare-fun bm!60978 () Bool)

(assert (=> bm!60978 (= call!60981 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!120765 (Cons!27136 (select (arr!38367 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27136 (select (arr!38367 a!3806) from!3184) Nil!27137)) (Cons!27136 (select (arr!38367 a!3806) from!3184) Nil!27137))))))

(declare-fun b!1233602 () Bool)

(declare-fun e!699794 () Bool)

(assert (=> b!1233602 (= e!699794 call!60981)))

(declare-fun b!1233603 () Bool)

(declare-fun e!699797 () Bool)

(assert (=> b!1233603 (= e!699797 e!699794)))

(assert (=> b!1233603 (= c!120765 (validKeyInArray!0 (select (arr!38367 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1233604 () Bool)

(declare-fun e!699795 () Bool)

(assert (=> b!1233604 (= e!699795 (contains!7202 (Cons!27136 (select (arr!38367 a!3806) from!3184) Nil!27137) (select (arr!38367 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1233605 () Bool)

(declare-fun e!699796 () Bool)

(assert (=> b!1233605 (= e!699796 e!699797)))

(declare-fun res!821794 () Bool)

(assert (=> b!1233605 (=> (not res!821794) (not e!699797))))

(assert (=> b!1233605 (= res!821794 (not e!699795))))

(declare-fun res!821793 () Bool)

(assert (=> b!1233605 (=> (not res!821793) (not e!699795))))

(assert (=> b!1233605 (= res!821793 (validKeyInArray!0 (select (arr!38367 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1233606 () Bool)

(assert (=> b!1233606 (= e!699794 call!60981)))

(declare-fun d!135339 () Bool)

(declare-fun res!821792 () Bool)

(assert (=> d!135339 (=> res!821792 e!699796)))

(assert (=> d!135339 (= res!821792 (bvsge (bvadd #b00000000000000000000000000000001 from!3184) (size!38903 a!3806)))))

(assert (=> d!135339 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27136 (select (arr!38367 a!3806) from!3184) Nil!27137)) e!699796)))

(assert (= (and d!135339 (not res!821792)) b!1233605))

(assert (= (and b!1233605 res!821793) b!1233604))

(assert (= (and b!1233605 res!821794) b!1233603))

(assert (= (and b!1233603 c!120765) b!1233602))

(assert (= (and b!1233603 (not c!120765)) b!1233606))

(assert (= (or b!1233602 b!1233606) bm!60978))

(assert (=> bm!60978 m!1137581))

(declare-fun m!1137683 () Bool)

(assert (=> bm!60978 m!1137683))

(assert (=> b!1233603 m!1137581))

(assert (=> b!1233603 m!1137581))

(assert (=> b!1233603 m!1137585))

(assert (=> b!1233604 m!1137581))

(assert (=> b!1233604 m!1137581))

(declare-fun m!1137687 () Bool)

(assert (=> b!1233604 m!1137687))

(assert (=> b!1233605 m!1137581))

(assert (=> b!1233605 m!1137581))

(assert (=> b!1233605 m!1137585))

(assert (=> b!1233426 d!135339))

(declare-fun d!135347 () Bool)

(declare-fun res!821802 () Bool)

(declare-fun e!699806 () Bool)

(assert (=> d!135347 (=> res!821802 e!699806)))

(assert (=> d!135347 (= res!821802 ((_ is Nil!27137) lt!559679))))

(assert (=> d!135347 (= (noDuplicate!1799 lt!559679) e!699806)))

(declare-fun b!1233616 () Bool)

(declare-fun e!699807 () Bool)

(assert (=> b!1233616 (= e!699806 e!699807)))

(declare-fun res!821803 () Bool)

(assert (=> b!1233616 (=> (not res!821803) (not e!699807))))

(assert (=> b!1233616 (= res!821803 (not (contains!7202 (t!40603 lt!559679) (h!28345 lt!559679))))))

(declare-fun b!1233617 () Bool)

(assert (=> b!1233617 (= e!699807 (noDuplicate!1799 (t!40603 lt!559679)))))

(assert (= (and d!135347 (not res!821802)) b!1233616))

(assert (= (and b!1233616 res!821803) b!1233617))

(declare-fun m!1137689 () Bool)

(assert (=> b!1233616 m!1137689))

(declare-fun m!1137691 () Bool)

(assert (=> b!1233617 m!1137691))

(assert (=> b!1233415 d!135347))

(declare-fun d!135349 () Bool)

(assert (=> d!135349 (= (validKeyInArray!0 k0!2913) (and (not (= k0!2913 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2913 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1233425 d!135349))

(check-sat (not b!1233528) (not b!1233527) (not b!1233603) (not bm!60967) (not b!1233498) (not b!1233522) (not b!1233580) (not b!1233500) (not b!1233531) (not d!135313) (not b!1233499) (not d!135335) (not b!1233616) (not b!1233604) (not b!1233552) (not b!1233605) (not b!1233526) (not d!135269) (not b!1233476) (not d!135293) (not b!1233575) (not b!1233521) (not b!1233576) (not bm!60968) (not bm!60978) (not b!1233617) (not bm!60971) (not d!135281) (not b!1233523) (not b!1233601) (not d!135321) (not b!1233591))
(check-sat)
