; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114296 () Bool)

(assert start!114296)

(declare-fun b!1357377 () Bool)

(declare-fun res!902150 () Bool)

(declare-fun e!770398 () Bool)

(assert (=> b!1357377 (=> res!902150 e!770398)))

(declare-datatypes ((List!31757 0))(
  ( (Nil!31754) (Cons!31753 (h!32962 (_ BitVec 64)) (t!46410 List!31757)) )
))
(declare-fun lt!598975 () List!31757)

(declare-fun noDuplicate!2292 (List!31757) Bool)

(assert (=> b!1357377 (= res!902150 (not (noDuplicate!2292 lt!598975)))))

(declare-fun b!1357378 () Bool)

(declare-fun res!902158 () Bool)

(declare-fun e!770399 () Bool)

(assert (=> b!1357378 (=> (not res!902158) (not e!770399))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92382 0))(
  ( (array!92383 (arr!44638 (Array (_ BitVec 32) (_ BitVec 64))) (size!45190 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92382)

(assert (=> b!1357378 (= res!902158 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45190 a!3742))))))

(declare-fun b!1357379 () Bool)

(declare-fun e!770401 () Bool)

(declare-fun contains!9377 (List!31757 (_ BitVec 64)) Bool)

(assert (=> b!1357379 (= e!770401 (not (contains!9377 lt!598975 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357380 () Bool)

(declare-fun res!902160 () Bool)

(assert (=> b!1357380 (=> (not res!902160) (not e!770399))))

(declare-fun acc!759 () List!31757)

(assert (=> b!1357380 (= res!902160 (not (contains!9377 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!902161 () Bool)

(assert (=> start!114296 (=> (not res!902161) (not e!770399))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114296 (= res!902161 (and (bvslt (size!45190 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45190 a!3742))))))

(assert (=> start!114296 e!770399))

(assert (=> start!114296 true))

(declare-fun array_inv!33871 (array!92382) Bool)

(assert (=> start!114296 (array_inv!33871 a!3742)))

(declare-fun b!1357381 () Bool)

(declare-fun res!902156 () Bool)

(assert (=> b!1357381 (=> (not res!902156) (not e!770399))))

(declare-fun arrayNoDuplicates!0 (array!92382 (_ BitVec 32) List!31757) Bool)

(assert (=> b!1357381 (= res!902156 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1357382 () Bool)

(declare-fun res!902153 () Bool)

(assert (=> b!1357382 (=> (not res!902153) (not e!770399))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1357382 (= res!902153 (validKeyInArray!0 (select (arr!44638 a!3742) from!3120)))))

(declare-fun b!1357383 () Bool)

(declare-fun res!902154 () Bool)

(assert (=> b!1357383 (=> (not res!902154) (not e!770399))))

(assert (=> b!1357383 (= res!902154 (noDuplicate!2292 acc!759))))

(declare-fun b!1357384 () Bool)

(assert (=> b!1357384 (= e!770398 e!770401)))

(declare-fun res!902159 () Bool)

(assert (=> b!1357384 (=> (not res!902159) (not e!770401))))

(assert (=> b!1357384 (= res!902159 (not (contains!9377 lt!598975 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357385 () Bool)

(declare-fun res!902152 () Bool)

(assert (=> b!1357385 (=> (not res!902152) (not e!770399))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1357385 (= res!902152 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1357386 () Bool)

(assert (=> b!1357386 (= e!770399 (not e!770398))))

(declare-fun res!902155 () Bool)

(assert (=> b!1357386 (=> res!902155 e!770398)))

(assert (=> b!1357386 (= res!902155 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!820 (List!31757 (_ BitVec 64)) List!31757)

(assert (=> b!1357386 (= lt!598975 ($colon$colon!820 acc!759 (select (arr!44638 a!3742) from!3120)))))

(declare-fun subseq!815 (List!31757 List!31757) Bool)

(assert (=> b!1357386 (subseq!815 acc!759 acc!759)))

(declare-datatypes ((Unit!44502 0))(
  ( (Unit!44503) )
))
(declare-fun lt!598974 () Unit!44502)

(declare-fun lemmaListSubSeqRefl!0 (List!31757) Unit!44502)

(assert (=> b!1357386 (= lt!598974 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1357387 () Bool)

(declare-fun res!902162 () Bool)

(assert (=> b!1357387 (=> (not res!902162) (not e!770399))))

(assert (=> b!1357387 (= res!902162 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45190 a!3742)))))

(declare-fun b!1357388 () Bool)

(declare-fun res!902151 () Bool)

(assert (=> b!1357388 (=> (not res!902151) (not e!770399))))

(assert (=> b!1357388 (= res!902151 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31754))))

(declare-fun b!1357389 () Bool)

(declare-fun res!902157 () Bool)

(assert (=> b!1357389 (=> (not res!902157) (not e!770399))))

(assert (=> b!1357389 (= res!902157 (not (contains!9377 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114296 res!902161) b!1357383))

(assert (= (and b!1357383 res!902154) b!1357380))

(assert (= (and b!1357380 res!902160) b!1357389))

(assert (= (and b!1357389 res!902157) b!1357388))

(assert (= (and b!1357388 res!902151) b!1357381))

(assert (= (and b!1357381 res!902156) b!1357378))

(assert (= (and b!1357378 res!902158) b!1357385))

(assert (= (and b!1357385 res!902152) b!1357387))

(assert (= (and b!1357387 res!902162) b!1357382))

(assert (= (and b!1357382 res!902153) b!1357386))

(assert (= (and b!1357386 (not res!902155)) b!1357377))

(assert (= (and b!1357377 (not res!902150)) b!1357384))

(assert (= (and b!1357384 res!902159) b!1357379))

(declare-fun m!1242667 () Bool)

(assert (=> start!114296 m!1242667))

(declare-fun m!1242669 () Bool)

(assert (=> b!1357386 m!1242669))

(assert (=> b!1357386 m!1242669))

(declare-fun m!1242671 () Bool)

(assert (=> b!1357386 m!1242671))

(declare-fun m!1242673 () Bool)

(assert (=> b!1357386 m!1242673))

(declare-fun m!1242675 () Bool)

(assert (=> b!1357386 m!1242675))

(declare-fun m!1242677 () Bool)

(assert (=> b!1357377 m!1242677))

(declare-fun m!1242679 () Bool)

(assert (=> b!1357389 m!1242679))

(declare-fun m!1242681 () Bool)

(assert (=> b!1357383 m!1242681))

(declare-fun m!1242683 () Bool)

(assert (=> b!1357381 m!1242683))

(declare-fun m!1242685 () Bool)

(assert (=> b!1357385 m!1242685))

(declare-fun m!1242687 () Bool)

(assert (=> b!1357384 m!1242687))

(declare-fun m!1242689 () Bool)

(assert (=> b!1357380 m!1242689))

(declare-fun m!1242691 () Bool)

(assert (=> b!1357379 m!1242691))

(declare-fun m!1242693 () Bool)

(assert (=> b!1357388 m!1242693))

(assert (=> b!1357382 m!1242669))

(assert (=> b!1357382 m!1242669))

(declare-fun m!1242695 () Bool)

(assert (=> b!1357382 m!1242695))

(check-sat (not b!1357380) (not b!1357377) (not start!114296) (not b!1357383) (not b!1357382) (not b!1357386) (not b!1357388) (not b!1357381) (not b!1357379) (not b!1357385) (not b!1357384) (not b!1357389))
(check-sat)
(get-model)

(declare-fun d!145045 () Bool)

(declare-fun res!902245 () Bool)

(declare-fun e!770430 () Bool)

(assert (=> d!145045 (=> res!902245 e!770430)))

(get-info :version)

(assert (=> d!145045 (= res!902245 ((_ is Nil!31754) acc!759))))

(assert (=> d!145045 (= (noDuplicate!2292 acc!759) e!770430)))

(declare-fun b!1357472 () Bool)

(declare-fun e!770431 () Bool)

(assert (=> b!1357472 (= e!770430 e!770431)))

(declare-fun res!902246 () Bool)

(assert (=> b!1357472 (=> (not res!902246) (not e!770431))))

(assert (=> b!1357472 (= res!902246 (not (contains!9377 (t!46410 acc!759) (h!32962 acc!759))))))

(declare-fun b!1357473 () Bool)

(assert (=> b!1357473 (= e!770431 (noDuplicate!2292 (t!46410 acc!759)))))

(assert (= (and d!145045 (not res!902245)) b!1357472))

(assert (= (and b!1357472 res!902246) b!1357473))

(declare-fun m!1242757 () Bool)

(assert (=> b!1357472 m!1242757))

(declare-fun m!1242759 () Bool)

(assert (=> b!1357473 m!1242759))

(assert (=> b!1357383 d!145045))

(declare-fun d!145047 () Bool)

(assert (=> d!145047 (= (validKeyInArray!0 (select (arr!44638 a!3742) from!3120)) (and (not (= (select (arr!44638 a!3742) from!3120) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44638 a!3742) from!3120) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1357382 d!145047))

(declare-fun e!770441 () Bool)

(declare-fun b!1357484 () Bool)

(assert (=> b!1357484 (= e!770441 (contains!9377 acc!759 (select (arr!44638 a!3742) from!3120)))))

(declare-fun d!145049 () Bool)

(declare-fun res!902254 () Bool)

(declare-fun e!770440 () Bool)

(assert (=> d!145049 (=> res!902254 e!770440)))

(assert (=> d!145049 (= res!902254 (bvsge from!3120 (size!45190 a!3742)))))

(assert (=> d!145049 (= (arrayNoDuplicates!0 a!3742 from!3120 acc!759) e!770440)))

(declare-fun b!1357485 () Bool)

(declare-fun e!770442 () Bool)

(declare-fun call!65236 () Bool)

(assert (=> b!1357485 (= e!770442 call!65236)))

(declare-fun b!1357486 () Bool)

(declare-fun e!770443 () Bool)

(assert (=> b!1357486 (= e!770443 e!770442)))

(declare-fun c!127058 () Bool)

(assert (=> b!1357486 (= c!127058 (validKeyInArray!0 (select (arr!44638 a!3742) from!3120)))))

(declare-fun b!1357487 () Bool)

(assert (=> b!1357487 (= e!770442 call!65236)))

(declare-fun bm!65233 () Bool)

(assert (=> bm!65233 (= call!65236 (arrayNoDuplicates!0 a!3742 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127058 (Cons!31753 (select (arr!44638 a!3742) from!3120) acc!759) acc!759)))))

(declare-fun b!1357488 () Bool)

(assert (=> b!1357488 (= e!770440 e!770443)))

(declare-fun res!902255 () Bool)

(assert (=> b!1357488 (=> (not res!902255) (not e!770443))))

(assert (=> b!1357488 (= res!902255 (not e!770441))))

(declare-fun res!902253 () Bool)

(assert (=> b!1357488 (=> (not res!902253) (not e!770441))))

(assert (=> b!1357488 (= res!902253 (validKeyInArray!0 (select (arr!44638 a!3742) from!3120)))))

(assert (= (and d!145049 (not res!902254)) b!1357488))

(assert (= (and b!1357488 res!902253) b!1357484))

(assert (= (and b!1357488 res!902255) b!1357486))

(assert (= (and b!1357486 c!127058) b!1357487))

(assert (= (and b!1357486 (not c!127058)) b!1357485))

(assert (= (or b!1357487 b!1357485) bm!65233))

(assert (=> b!1357484 m!1242669))

(assert (=> b!1357484 m!1242669))

(declare-fun m!1242761 () Bool)

(assert (=> b!1357484 m!1242761))

(assert (=> b!1357486 m!1242669))

(assert (=> b!1357486 m!1242669))

(assert (=> b!1357486 m!1242695))

(assert (=> bm!65233 m!1242669))

(declare-fun m!1242763 () Bool)

(assert (=> bm!65233 m!1242763))

(assert (=> b!1357488 m!1242669))

(assert (=> b!1357488 m!1242669))

(assert (=> b!1357488 m!1242695))

(assert (=> b!1357381 d!145049))

(declare-fun d!145051 () Bool)

(assert (=> d!145051 (= (validKeyInArray!0 l!3587) (and (not (= l!3587 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= l!3587 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1357385 d!145051))

(declare-fun d!145053 () Bool)

(declare-fun lt!598990 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!675 (List!31757) (InoxSet (_ BitVec 64)))

(assert (=> d!145053 (= lt!598990 (select (content!675 lt!598975) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!770449 () Bool)

(assert (=> d!145053 (= lt!598990 e!770449)))

(declare-fun res!902260 () Bool)

(assert (=> d!145053 (=> (not res!902260) (not e!770449))))

(assert (=> d!145053 (= res!902260 ((_ is Cons!31753) lt!598975))))

(assert (=> d!145053 (= (contains!9377 lt!598975 #b0000000000000000000000000000000000000000000000000000000000000000) lt!598990)))

(declare-fun b!1357493 () Bool)

(declare-fun e!770448 () Bool)

(assert (=> b!1357493 (= e!770449 e!770448)))

(declare-fun res!902261 () Bool)

(assert (=> b!1357493 (=> res!902261 e!770448)))

(assert (=> b!1357493 (= res!902261 (= (h!32962 lt!598975) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1357494 () Bool)

(assert (=> b!1357494 (= e!770448 (contains!9377 (t!46410 lt!598975) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145053 res!902260) b!1357493))

(assert (= (and b!1357493 (not res!902261)) b!1357494))

(declare-fun m!1242765 () Bool)

(assert (=> d!145053 m!1242765))

(declare-fun m!1242767 () Bool)

(assert (=> d!145053 m!1242767))

(declare-fun m!1242769 () Bool)

(assert (=> b!1357494 m!1242769))

(assert (=> b!1357384 d!145053))

(declare-fun b!1357495 () Bool)

(declare-fun e!770451 () Bool)

(assert (=> b!1357495 (= e!770451 (contains!9377 Nil!31754 (select (arr!44638 a!3742) #b00000000000000000000000000000000)))))

(declare-fun d!145055 () Bool)

(declare-fun res!902263 () Bool)

(declare-fun e!770450 () Bool)

(assert (=> d!145055 (=> res!902263 e!770450)))

(assert (=> d!145055 (= res!902263 (bvsge #b00000000000000000000000000000000 (size!45190 a!3742)))))

(assert (=> d!145055 (= (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31754) e!770450)))

(declare-fun b!1357496 () Bool)

(declare-fun e!770452 () Bool)

(declare-fun call!65237 () Bool)

(assert (=> b!1357496 (= e!770452 call!65237)))

(declare-fun b!1357497 () Bool)

(declare-fun e!770453 () Bool)

(assert (=> b!1357497 (= e!770453 e!770452)))

(declare-fun c!127059 () Bool)

(assert (=> b!1357497 (= c!127059 (validKeyInArray!0 (select (arr!44638 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1357498 () Bool)

(assert (=> b!1357498 (= e!770452 call!65237)))

(declare-fun bm!65234 () Bool)

(assert (=> bm!65234 (= call!65237 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!127059 (Cons!31753 (select (arr!44638 a!3742) #b00000000000000000000000000000000) Nil!31754) Nil!31754)))))

(declare-fun b!1357499 () Bool)

(assert (=> b!1357499 (= e!770450 e!770453)))

(declare-fun res!902264 () Bool)

(assert (=> b!1357499 (=> (not res!902264) (not e!770453))))

(assert (=> b!1357499 (= res!902264 (not e!770451))))

(declare-fun res!902262 () Bool)

(assert (=> b!1357499 (=> (not res!902262) (not e!770451))))

(assert (=> b!1357499 (= res!902262 (validKeyInArray!0 (select (arr!44638 a!3742) #b00000000000000000000000000000000)))))

(assert (= (and d!145055 (not res!902263)) b!1357499))

(assert (= (and b!1357499 res!902262) b!1357495))

(assert (= (and b!1357499 res!902264) b!1357497))

(assert (= (and b!1357497 c!127059) b!1357498))

(assert (= (and b!1357497 (not c!127059)) b!1357496))

(assert (= (or b!1357498 b!1357496) bm!65234))

(declare-fun m!1242771 () Bool)

(assert (=> b!1357495 m!1242771))

(assert (=> b!1357495 m!1242771))

(declare-fun m!1242773 () Bool)

(assert (=> b!1357495 m!1242773))

(assert (=> b!1357497 m!1242771))

(assert (=> b!1357497 m!1242771))

(declare-fun m!1242775 () Bool)

(assert (=> b!1357497 m!1242775))

(assert (=> bm!65234 m!1242771))

(declare-fun m!1242777 () Bool)

(assert (=> bm!65234 m!1242777))

(assert (=> b!1357499 m!1242771))

(assert (=> b!1357499 m!1242771))

(assert (=> b!1357499 m!1242775))

(assert (=> b!1357388 d!145055))

(declare-fun d!145057 () Bool)

(declare-fun res!902265 () Bool)

(declare-fun e!770454 () Bool)

(assert (=> d!145057 (=> res!902265 e!770454)))

(assert (=> d!145057 (= res!902265 ((_ is Nil!31754) lt!598975))))

(assert (=> d!145057 (= (noDuplicate!2292 lt!598975) e!770454)))

(declare-fun b!1357500 () Bool)

(declare-fun e!770455 () Bool)

(assert (=> b!1357500 (= e!770454 e!770455)))

(declare-fun res!902266 () Bool)

(assert (=> b!1357500 (=> (not res!902266) (not e!770455))))

(assert (=> b!1357500 (= res!902266 (not (contains!9377 (t!46410 lt!598975) (h!32962 lt!598975))))))

(declare-fun b!1357501 () Bool)

(assert (=> b!1357501 (= e!770455 (noDuplicate!2292 (t!46410 lt!598975)))))

(assert (= (and d!145057 (not res!902265)) b!1357500))

(assert (= (and b!1357500 res!902266) b!1357501))

(declare-fun m!1242779 () Bool)

(assert (=> b!1357500 m!1242779))

(declare-fun m!1242781 () Bool)

(assert (=> b!1357501 m!1242781))

(assert (=> b!1357377 d!145057))

(declare-fun d!145059 () Bool)

(assert (=> d!145059 (= ($colon$colon!820 acc!759 (select (arr!44638 a!3742) from!3120)) (Cons!31753 (select (arr!44638 a!3742) from!3120) acc!759))))

(assert (=> b!1357386 d!145059))

(declare-fun b!1357511 () Bool)

(declare-fun e!770466 () Bool)

(declare-fun e!770465 () Bool)

(assert (=> b!1357511 (= e!770466 e!770465)))

(declare-fun res!902278 () Bool)

(assert (=> b!1357511 (=> res!902278 e!770465)))

(declare-fun e!770467 () Bool)

(assert (=> b!1357511 (= res!902278 e!770467)))

(declare-fun res!902275 () Bool)

(assert (=> b!1357511 (=> (not res!902275) (not e!770467))))

(assert (=> b!1357511 (= res!902275 (= (h!32962 acc!759) (h!32962 acc!759)))))

(declare-fun b!1357512 () Bool)

(assert (=> b!1357512 (= e!770467 (subseq!815 (t!46410 acc!759) (t!46410 acc!759)))))

(declare-fun d!145061 () Bool)

(declare-fun res!902276 () Bool)

(declare-fun e!770464 () Bool)

(assert (=> d!145061 (=> res!902276 e!770464)))

(assert (=> d!145061 (= res!902276 ((_ is Nil!31754) acc!759))))

(assert (=> d!145061 (= (subseq!815 acc!759 acc!759) e!770464)))

(declare-fun b!1357513 () Bool)

(assert (=> b!1357513 (= e!770465 (subseq!815 acc!759 (t!46410 acc!759)))))

(declare-fun b!1357510 () Bool)

(assert (=> b!1357510 (= e!770464 e!770466)))

(declare-fun res!902277 () Bool)

(assert (=> b!1357510 (=> (not res!902277) (not e!770466))))

(assert (=> b!1357510 (= res!902277 ((_ is Cons!31753) acc!759))))

(assert (= (and d!145061 (not res!902276)) b!1357510))

(assert (= (and b!1357510 res!902277) b!1357511))

(assert (= (and b!1357511 res!902275) b!1357512))

(assert (= (and b!1357511 (not res!902278)) b!1357513))

(declare-fun m!1242783 () Bool)

(assert (=> b!1357512 m!1242783))

(declare-fun m!1242785 () Bool)

(assert (=> b!1357513 m!1242785))

(assert (=> b!1357386 d!145061))

(declare-fun d!145065 () Bool)

(assert (=> d!145065 (subseq!815 acc!759 acc!759)))

(declare-fun lt!598993 () Unit!44502)

(declare-fun choose!36 (List!31757) Unit!44502)

(assert (=> d!145065 (= lt!598993 (choose!36 acc!759))))

(assert (=> d!145065 (= (lemmaListSubSeqRefl!0 acc!759) lt!598993)))

(declare-fun bs!38907 () Bool)

(assert (= bs!38907 d!145065))

(assert (=> bs!38907 m!1242673))

(declare-fun m!1242787 () Bool)

(assert (=> bs!38907 m!1242787))

(assert (=> b!1357386 d!145065))

(declare-fun d!145069 () Bool)

(declare-fun lt!598994 () Bool)

(assert (=> d!145069 (= lt!598994 (select (content!675 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!770473 () Bool)

(assert (=> d!145069 (= lt!598994 e!770473)))

(declare-fun res!902283 () Bool)

(assert (=> d!145069 (=> (not res!902283) (not e!770473))))

(assert (=> d!145069 (= res!902283 ((_ is Cons!31753) acc!759))))

(assert (=> d!145069 (= (contains!9377 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000) lt!598994)))

(declare-fun b!1357518 () Bool)

(declare-fun e!770472 () Bool)

(assert (=> b!1357518 (= e!770473 e!770472)))

(declare-fun res!902284 () Bool)

(assert (=> b!1357518 (=> res!902284 e!770472)))

(assert (=> b!1357518 (= res!902284 (= (h!32962 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1357519 () Bool)

(assert (=> b!1357519 (= e!770472 (contains!9377 (t!46410 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145069 res!902283) b!1357518))

(assert (= (and b!1357518 (not res!902284)) b!1357519))

(declare-fun m!1242789 () Bool)

(assert (=> d!145069 m!1242789))

(declare-fun m!1242791 () Bool)

(assert (=> d!145069 m!1242791))

(declare-fun m!1242793 () Bool)

(assert (=> b!1357519 m!1242793))

(assert (=> b!1357380 d!145069))

(declare-fun d!145071 () Bool)

(declare-fun lt!598995 () Bool)

(assert (=> d!145071 (= lt!598995 (select (content!675 lt!598975) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!770475 () Bool)

(assert (=> d!145071 (= lt!598995 e!770475)))

(declare-fun res!902285 () Bool)

(assert (=> d!145071 (=> (not res!902285) (not e!770475))))

(assert (=> d!145071 (= res!902285 ((_ is Cons!31753) lt!598975))))

(assert (=> d!145071 (= (contains!9377 lt!598975 #b1000000000000000000000000000000000000000000000000000000000000000) lt!598995)))

(declare-fun b!1357520 () Bool)

(declare-fun e!770474 () Bool)

(assert (=> b!1357520 (= e!770475 e!770474)))

(declare-fun res!902286 () Bool)

(assert (=> b!1357520 (=> res!902286 e!770474)))

(assert (=> b!1357520 (= res!902286 (= (h!32962 lt!598975) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1357521 () Bool)

(assert (=> b!1357521 (= e!770474 (contains!9377 (t!46410 lt!598975) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145071 res!902285) b!1357520))

(assert (= (and b!1357520 (not res!902286)) b!1357521))

(assert (=> d!145071 m!1242765))

(declare-fun m!1242795 () Bool)

(assert (=> d!145071 m!1242795))

(declare-fun m!1242797 () Bool)

(assert (=> b!1357521 m!1242797))

(assert (=> b!1357379 d!145071))

(declare-fun d!145073 () Bool)

(assert (=> d!145073 (= (array_inv!33871 a!3742) (bvsge (size!45190 a!3742) #b00000000000000000000000000000000))))

(assert (=> start!114296 d!145073))

(declare-fun d!145077 () Bool)

(declare-fun lt!598996 () Bool)

(assert (=> d!145077 (= lt!598996 (select (content!675 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!770479 () Bool)

(assert (=> d!145077 (= lt!598996 e!770479)))

(declare-fun res!902289 () Bool)

(assert (=> d!145077 (=> (not res!902289) (not e!770479))))

(assert (=> d!145077 (= res!902289 ((_ is Cons!31753) acc!759))))

(assert (=> d!145077 (= (contains!9377 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000) lt!598996)))

(declare-fun b!1357524 () Bool)

(declare-fun e!770478 () Bool)

(assert (=> b!1357524 (= e!770479 e!770478)))

(declare-fun res!902290 () Bool)

(assert (=> b!1357524 (=> res!902290 e!770478)))

(assert (=> b!1357524 (= res!902290 (= (h!32962 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1357525 () Bool)

(assert (=> b!1357525 (= e!770478 (contains!9377 (t!46410 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145077 res!902289) b!1357524))

(assert (= (and b!1357524 (not res!902290)) b!1357525))

(assert (=> d!145077 m!1242789))

(declare-fun m!1242803 () Bool)

(assert (=> d!145077 m!1242803))

(declare-fun m!1242805 () Bool)

(assert (=> b!1357525 m!1242805))

(assert (=> b!1357389 d!145077))

(check-sat (not b!1357499) (not b!1357473) (not b!1357521) (not bm!65234) (not b!1357519) (not b!1357472) (not b!1357513) (not d!145053) (not b!1357512) (not b!1357488) (not b!1357484) (not b!1357525) (not b!1357495) (not b!1357501) (not b!1357497) (not d!145077) (not b!1357486) (not b!1357500) (not d!145069) (not bm!65233) (not d!145071) (not b!1357494) (not d!145065))
(check-sat)
