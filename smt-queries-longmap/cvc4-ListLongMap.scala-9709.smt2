; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114816 () Bool)

(assert start!114816)

(declare-fun b!1361377 () Bool)

(declare-fun res!905528 () Bool)

(declare-fun e!772317 () Bool)

(assert (=> b!1361377 (=> (not res!905528) (not e!772317))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92602 0))(
  ( (array!92603 (arr!44737 (Array (_ BitVec 32) (_ BitVec 64))) (size!45287 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92602)

(assert (=> b!1361377 (= res!905528 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45287 a!3742))))))

(declare-fun b!1361378 () Bool)

(declare-datatypes ((Unit!44871 0))(
  ( (Unit!44872) )
))
(declare-fun e!772316 () Unit!44871)

(declare-fun Unit!44873 () Unit!44871)

(assert (=> b!1361378 (= e!772316 Unit!44873)))

(declare-fun b!1361379 () Bool)

(declare-fun res!905525 () Bool)

(declare-fun e!772314 () Bool)

(assert (=> b!1361379 (=> (not res!905525) (not e!772314))))

(declare-datatypes ((List!31778 0))(
  ( (Nil!31775) (Cons!31774 (h!32983 (_ BitVec 64)) (t!46460 List!31778)) )
))
(declare-fun lt!600161 () List!31778)

(declare-fun contains!9487 (List!31778 (_ BitVec 64)) Bool)

(assert (=> b!1361379 (= res!905525 (not (contains!9487 lt!600161 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361380 () Bool)

(declare-fun res!905536 () Bool)

(assert (=> b!1361380 (=> (not res!905536) (not e!772317))))

(declare-fun acc!759 () List!31778)

(assert (=> b!1361380 (= res!905536 (not (contains!9487 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361381 () Bool)

(declare-fun res!905535 () Bool)

(assert (=> b!1361381 (=> (not res!905535) (not e!772317))))

(declare-fun noDuplicate!2344 (List!31778) Bool)

(assert (=> b!1361381 (= res!905535 (noDuplicate!2344 acc!759))))

(declare-fun b!1361382 () Bool)

(declare-fun e!772315 () Bool)

(assert (=> b!1361382 (= e!772315 e!772314)))

(declare-fun res!905532 () Bool)

(assert (=> b!1361382 (=> (not res!905532) (not e!772314))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1361382 (= res!905532 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!892 (List!31778 (_ BitVec 64)) List!31778)

(assert (=> b!1361382 (= lt!600161 ($colon$colon!892 acc!759 (select (arr!44737 a!3742) from!3120)))))

(declare-fun b!1361383 () Bool)

(declare-fun res!905534 () Bool)

(assert (=> b!1361383 (=> (not res!905534) (not e!772317))))

(assert (=> b!1361383 (= res!905534 (not (contains!9487 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361384 () Bool)

(declare-fun res!905529 () Bool)

(assert (=> b!1361384 (=> (not res!905529) (not e!772314))))

(assert (=> b!1361384 (= res!905529 (not (contains!9487 lt!600161 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!905523 () Bool)

(assert (=> start!114816 (=> (not res!905523) (not e!772317))))

(assert (=> start!114816 (= res!905523 (and (bvslt (size!45287 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45287 a!3742))))))

(assert (=> start!114816 e!772317))

(assert (=> start!114816 true))

(declare-fun array_inv!33765 (array!92602) Bool)

(assert (=> start!114816 (array_inv!33765 a!3742)))

(declare-fun b!1361385 () Bool)

(declare-fun res!905531 () Bool)

(assert (=> b!1361385 (=> (not res!905531) (not e!772317))))

(declare-fun arrayNoDuplicates!0 (array!92602 (_ BitVec 32) List!31778) Bool)

(assert (=> b!1361385 (= res!905531 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1361386 () Bool)

(declare-fun res!905530 () Bool)

(assert (=> b!1361386 (=> (not res!905530) (not e!772317))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1361386 (= res!905530 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1361387 () Bool)

(declare-fun res!905524 () Bool)

(assert (=> b!1361387 (=> (not res!905524) (not e!772317))))

(assert (=> b!1361387 (= res!905524 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45287 a!3742)))))

(declare-fun b!1361388 () Bool)

(declare-fun res!905533 () Bool)

(assert (=> b!1361388 (=> (not res!905533) (not e!772317))))

(assert (=> b!1361388 (= res!905533 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31775))))

(declare-fun b!1361389 () Bool)

(assert (=> b!1361389 (= e!772314 (not (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!600161)))))

(declare-fun b!1361390 () Bool)

(declare-fun res!905526 () Bool)

(assert (=> b!1361390 (=> (not res!905526) (not e!772314))))

(assert (=> b!1361390 (= res!905526 (noDuplicate!2344 lt!600161))))

(declare-fun b!1361391 () Bool)

(assert (=> b!1361391 (= e!772317 e!772315)))

(declare-fun res!905527 () Bool)

(assert (=> b!1361391 (=> (not res!905527) (not e!772315))))

(declare-fun lt!600160 () Bool)

(assert (=> b!1361391 (= res!905527 (and (not (= from!3120 i!1404)) lt!600160))))

(declare-fun lt!600162 () Unit!44871)

(assert (=> b!1361391 (= lt!600162 e!772316)))

(declare-fun c!127367 () Bool)

(assert (=> b!1361391 (= c!127367 lt!600160)))

(assert (=> b!1361391 (= lt!600160 (validKeyInArray!0 (select (arr!44737 a!3742) from!3120)))))

(declare-fun b!1361392 () Bool)

(declare-fun lt!600163 () Unit!44871)

(assert (=> b!1361392 (= e!772316 lt!600163)))

(declare-fun lt!600159 () Unit!44871)

(declare-fun lemmaListSubSeqRefl!0 (List!31778) Unit!44871)

(assert (=> b!1361392 (= lt!600159 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!889 (List!31778 List!31778) Bool)

(assert (=> b!1361392 (subseq!889 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92602 List!31778 List!31778 (_ BitVec 32)) Unit!44871)

(assert (=> b!1361392 (= lt!600163 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!892 acc!759 (select (arr!44737 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1361392 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(assert (= (and start!114816 res!905523) b!1361381))

(assert (= (and b!1361381 res!905535) b!1361380))

(assert (= (and b!1361380 res!905536) b!1361383))

(assert (= (and b!1361383 res!905534) b!1361388))

(assert (= (and b!1361388 res!905533) b!1361385))

(assert (= (and b!1361385 res!905531) b!1361377))

(assert (= (and b!1361377 res!905528) b!1361386))

(assert (= (and b!1361386 res!905530) b!1361387))

(assert (= (and b!1361387 res!905524) b!1361391))

(assert (= (and b!1361391 c!127367) b!1361392))

(assert (= (and b!1361391 (not c!127367)) b!1361378))

(assert (= (and b!1361391 res!905527) b!1361382))

(assert (= (and b!1361382 res!905532) b!1361390))

(assert (= (and b!1361390 res!905526) b!1361379))

(assert (= (and b!1361379 res!905525) b!1361384))

(assert (= (and b!1361384 res!905529) b!1361389))

(declare-fun m!1246489 () Bool)

(assert (=> b!1361380 m!1246489))

(declare-fun m!1246491 () Bool)

(assert (=> b!1361389 m!1246491))

(declare-fun m!1246493 () Bool)

(assert (=> b!1361386 m!1246493))

(declare-fun m!1246495 () Bool)

(assert (=> start!114816 m!1246495))

(declare-fun m!1246497 () Bool)

(assert (=> b!1361388 m!1246497))

(declare-fun m!1246499 () Bool)

(assert (=> b!1361379 m!1246499))

(declare-fun m!1246501 () Bool)

(assert (=> b!1361384 m!1246501))

(declare-fun m!1246503 () Bool)

(assert (=> b!1361390 m!1246503))

(declare-fun m!1246505 () Bool)

(assert (=> b!1361382 m!1246505))

(assert (=> b!1361382 m!1246505))

(declare-fun m!1246507 () Bool)

(assert (=> b!1361382 m!1246507))

(declare-fun m!1246509 () Bool)

(assert (=> b!1361385 m!1246509))

(declare-fun m!1246511 () Bool)

(assert (=> b!1361381 m!1246511))

(assert (=> b!1361391 m!1246505))

(assert (=> b!1361391 m!1246505))

(declare-fun m!1246513 () Bool)

(assert (=> b!1361391 m!1246513))

(declare-fun m!1246515 () Bool)

(assert (=> b!1361392 m!1246515))

(assert (=> b!1361392 m!1246505))

(assert (=> b!1361392 m!1246507))

(declare-fun m!1246517 () Bool)

(assert (=> b!1361392 m!1246517))

(declare-fun m!1246519 () Bool)

(assert (=> b!1361392 m!1246519))

(assert (=> b!1361392 m!1246505))

(assert (=> b!1361392 m!1246507))

(declare-fun m!1246521 () Bool)

(assert (=> b!1361392 m!1246521))

(declare-fun m!1246523 () Bool)

(assert (=> b!1361383 m!1246523))

(push 1)

(assert (not b!1361392))

(assert (not b!1361380))

(assert (not b!1361389))

(assert (not b!1361391))

(assert (not b!1361384))

(assert (not b!1361385))

(assert (not b!1361382))

(assert (not b!1361381))

(assert (not b!1361390))

(assert (not b!1361379))

(assert (not b!1361386))

(assert (not start!114816))

(assert (not b!1361388))

(assert (not b!1361383))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun e!772365 () Bool)

(declare-fun b!1361447 () Bool)

(assert (=> b!1361447 (= e!772365 (contains!9487 lt!600161 (select (arr!44737 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1361448 () Bool)

(declare-fun e!772368 () Bool)

(declare-fun call!65366 () Bool)

(assert (=> b!1361448 (= e!772368 call!65366)))

(declare-fun d!145853 () Bool)

(declare-fun res!905575 () Bool)

(declare-fun e!772366 () Bool)

(assert (=> d!145853 (=> res!905575 e!772366)))

(assert (=> d!145853 (= res!905575 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45287 a!3742)))))

(assert (=> d!145853 (= (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!600161) e!772366)))

(declare-fun b!1361449 () Bool)

(assert (=> b!1361449 (= e!772368 call!65366)))

(declare-fun b!1361450 () Bool)

(declare-fun e!772367 () Bool)

(assert (=> b!1361450 (= e!772366 e!772367)))

(declare-fun res!905577 () Bool)

(assert (=> b!1361450 (=> (not res!905577) (not e!772367))))

(assert (=> b!1361450 (= res!905577 (not e!772365))))

(declare-fun res!905576 () Bool)

(assert (=> b!1361450 (=> (not res!905576) (not e!772365))))

(assert (=> b!1361450 (= res!905576 (validKeyInArray!0 (select (arr!44737 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun c!127376 () Bool)

(declare-fun bm!65363 () Bool)

(assert (=> bm!65363 (= call!65366 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120 #b00000000000000000000000000000001) (ite c!127376 (Cons!31774 (select (arr!44737 a!3742) (bvadd #b00000000000000000000000000000001 from!3120)) lt!600161) lt!600161)))))

(declare-fun b!1361451 () Bool)

(assert (=> b!1361451 (= e!772367 e!772368)))

(assert (=> b!1361451 (= c!127376 (validKeyInArray!0 (select (arr!44737 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(assert (= (and d!145853 (not res!905575)) b!1361450))

(assert (= (and b!1361450 res!905576) b!1361447))

(assert (= (and b!1361450 res!905577) b!1361451))

(assert (= (and b!1361451 c!127376) b!1361448))

(assert (= (and b!1361451 (not c!127376)) b!1361449))

(assert (= (or b!1361448 b!1361449) bm!65363))

(declare-fun m!1246557 () Bool)

(assert (=> b!1361447 m!1246557))

(assert (=> b!1361447 m!1246557))

(declare-fun m!1246559 () Bool)

(assert (=> b!1361447 m!1246559))

(assert (=> b!1361450 m!1246557))

(assert (=> b!1361450 m!1246557))

(declare-fun m!1246561 () Bool)

(assert (=> b!1361450 m!1246561))

(assert (=> bm!65363 m!1246557))

(declare-fun m!1246563 () Bool)

(assert (=> bm!65363 m!1246563))

(assert (=> b!1361451 m!1246557))

(assert (=> b!1361451 m!1246557))

(assert (=> b!1361451 m!1246561))

(assert (=> b!1361389 d!145853))

(declare-fun b!1361452 () Bool)

(declare-fun e!772369 () Bool)

(assert (=> b!1361452 (= e!772369 (contains!9487 Nil!31775 (select (arr!44737 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1361453 () Bool)

(declare-fun e!772372 () Bool)

(declare-fun call!65367 () Bool)

(assert (=> b!1361453 (= e!772372 call!65367)))

(declare-fun d!145863 () Bool)

(declare-fun res!905578 () Bool)

(declare-fun e!772370 () Bool)

(assert (=> d!145863 (=> res!905578 e!772370)))

(assert (=> d!145863 (= res!905578 (bvsge #b00000000000000000000000000000000 (size!45287 a!3742)))))

(assert (=> d!145863 (= (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31775) e!772370)))

(declare-fun b!1361454 () Bool)

(assert (=> b!1361454 (= e!772372 call!65367)))

(declare-fun b!1361455 () Bool)

(declare-fun e!772371 () Bool)

(assert (=> b!1361455 (= e!772370 e!772371)))

(declare-fun res!905580 () Bool)

(assert (=> b!1361455 (=> (not res!905580) (not e!772371))))

(assert (=> b!1361455 (= res!905580 (not e!772369))))

(declare-fun res!905579 () Bool)

(assert (=> b!1361455 (=> (not res!905579) (not e!772369))))

(assert (=> b!1361455 (= res!905579 (validKeyInArray!0 (select (arr!44737 a!3742) #b00000000000000000000000000000000)))))

(declare-fun bm!65364 () Bool)

(declare-fun c!127377 () Bool)

(assert (=> bm!65364 (= call!65367 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!127377 (Cons!31774 (select (arr!44737 a!3742) #b00000000000000000000000000000000) Nil!31775) Nil!31775)))))

(declare-fun b!1361456 () Bool)

(assert (=> b!1361456 (= e!772371 e!772372)))

(assert (=> b!1361456 (= c!127377 (validKeyInArray!0 (select (arr!44737 a!3742) #b00000000000000000000000000000000)))))

(assert (= (and d!145863 (not res!905578)) b!1361455))

(assert (= (and b!1361455 res!905579) b!1361452))

(assert (= (and b!1361455 res!905580) b!1361456))

(assert (= (and b!1361456 c!127377) b!1361453))

(assert (= (and b!1361456 (not c!127377)) b!1361454))

(assert (= (or b!1361453 b!1361454) bm!65364))

(declare-fun m!1246567 () Bool)

(assert (=> b!1361452 m!1246567))

(assert (=> b!1361452 m!1246567))

(declare-fun m!1246569 () Bool)

(assert (=> b!1361452 m!1246569))

(assert (=> b!1361455 m!1246567))

(assert (=> b!1361455 m!1246567))

(declare-fun m!1246573 () Bool)

(assert (=> b!1361455 m!1246573))

(assert (=> bm!65364 m!1246567))

(declare-fun m!1246575 () Bool)

(assert (=> bm!65364 m!1246575))

(assert (=> b!1361456 m!1246567))

(assert (=> b!1361456 m!1246567))

(assert (=> b!1361456 m!1246573))

(assert (=> b!1361388 d!145863))

(declare-fun d!145867 () Bool)

(declare-fun res!905605 () Bool)

(declare-fun e!772397 () Bool)

(assert (=> d!145867 (=> res!905605 e!772397)))

(assert (=> d!145867 (= res!905605 (is-Nil!31775 lt!600161))))

(assert (=> d!145867 (= (noDuplicate!2344 lt!600161) e!772397)))

(declare-fun b!1361481 () Bool)

(declare-fun e!772398 () Bool)

(assert (=> b!1361481 (= e!772397 e!772398)))

(declare-fun res!905606 () Bool)

(assert (=> b!1361481 (=> (not res!905606) (not e!772398))))

(assert (=> b!1361481 (= res!905606 (not (contains!9487 (t!46460 lt!600161) (h!32983 lt!600161))))))

(declare-fun b!1361482 () Bool)

(assert (=> b!1361482 (= e!772398 (noDuplicate!2344 (t!46460 lt!600161)))))

(assert (= (and d!145867 (not res!905605)) b!1361481))

(assert (= (and b!1361481 res!905606) b!1361482))

(declare-fun m!1246581 () Bool)

(assert (=> b!1361481 m!1246581))

(declare-fun m!1246583 () Bool)

(assert (=> b!1361482 m!1246583))

(assert (=> b!1361390 d!145867))

(declare-fun d!145871 () Bool)

(declare-fun lt!600181 () Bool)

(declare-fun content!698 (List!31778) (Set (_ BitVec 64)))

(assert (=> d!145871 (= lt!600181 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!698 lt!600161)))))

(declare-fun e!772421 () Bool)

(assert (=> d!145871 (= lt!600181 e!772421)))

(declare-fun res!905627 () Bool)

(assert (=> d!145871 (=> (not res!905627) (not e!772421))))

(assert (=> d!145871 (= res!905627 (is-Cons!31774 lt!600161))))

(assert (=> d!145871 (= (contains!9487 lt!600161 #b0000000000000000000000000000000000000000000000000000000000000000) lt!600181)))

(declare-fun b!1361508 () Bool)

(declare-fun e!772422 () Bool)

(assert (=> b!1361508 (= e!772421 e!772422)))

(declare-fun res!905626 () Bool)

(assert (=> b!1361508 (=> res!905626 e!772422)))

(assert (=> b!1361508 (= res!905626 (= (h!32983 lt!600161) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1361509 () Bool)

(assert (=> b!1361509 (= e!772422 (contains!9487 (t!46460 lt!600161) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145871 res!905627) b!1361508))

(assert (= (and b!1361508 (not res!905626)) b!1361509))

(declare-fun m!1246605 () Bool)

(assert (=> d!145871 m!1246605))

(declare-fun m!1246607 () Bool)

(assert (=> d!145871 m!1246607))

(declare-fun m!1246609 () Bool)

(assert (=> b!1361509 m!1246609))

(assert (=> b!1361379 d!145871))

(declare-fun d!145887 () Bool)

(declare-fun res!905628 () Bool)

(declare-fun e!772423 () Bool)

(assert (=> d!145887 (=> res!905628 e!772423)))

(assert (=> d!145887 (= res!905628 (is-Nil!31775 acc!759))))

(assert (=> d!145887 (= (noDuplicate!2344 acc!759) e!772423)))

(declare-fun b!1361510 () Bool)

(declare-fun e!772424 () Bool)

(assert (=> b!1361510 (= e!772423 e!772424)))

(declare-fun res!905629 () Bool)

(assert (=> b!1361510 (=> (not res!905629) (not e!772424))))

(assert (=> b!1361510 (= res!905629 (not (contains!9487 (t!46460 acc!759) (h!32983 acc!759))))))

(declare-fun b!1361511 () Bool)

(assert (=> b!1361511 (= e!772424 (noDuplicate!2344 (t!46460 acc!759)))))

(assert (= (and d!145887 (not res!905628)) b!1361510))

(assert (= (and b!1361510 res!905629) b!1361511))

(declare-fun m!1246615 () Bool)

(assert (=> b!1361510 m!1246615))

(declare-fun m!1246617 () Bool)

