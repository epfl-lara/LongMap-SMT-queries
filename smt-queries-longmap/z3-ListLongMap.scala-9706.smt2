; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114910 () Bool)

(assert start!114910)

(declare-fun b!1361865 () Bool)

(declare-fun res!905356 () Bool)

(declare-fun e!772693 () Bool)

(assert (=> b!1361865 (=> (not res!905356) (not e!772693))))

(declare-datatypes ((List!31807 0))(
  ( (Nil!31804) (Cons!31803 (h!33021 (_ BitVec 64)) (t!46475 List!31807)) )
))
(declare-fun acc!759 () List!31807)

(declare-fun noDuplicate!2350 (List!31807) Bool)

(assert (=> b!1361865 (= res!905356 (noDuplicate!2350 acc!759))))

(declare-fun b!1361866 () Bool)

(declare-fun res!905361 () Bool)

(assert (=> b!1361866 (=> (not res!905361) (not e!772693))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92689 0))(
  ( (array!92690 (arr!44779 (Array (_ BitVec 32) (_ BitVec 64))) (size!45330 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92689)

(assert (=> b!1361866 (= res!905361 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45330 a!3742))))))

(declare-fun b!1361867 () Bool)

(declare-datatypes ((Unit!44777 0))(
  ( (Unit!44778) )
))
(declare-fun e!772692 () Unit!44777)

(declare-fun Unit!44779 () Unit!44777)

(assert (=> b!1361867 (= e!772692 Unit!44779)))

(declare-fun b!1361868 () Bool)

(declare-fun res!905355 () Bool)

(assert (=> b!1361868 (=> (not res!905355) (not e!772693))))

(declare-fun contains!9519 (List!31807 (_ BitVec 64)) Bool)

(assert (=> b!1361868 (= res!905355 (not (contains!9519 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361869 () Bool)

(declare-fun res!905362 () Bool)

(assert (=> b!1361869 (=> (not res!905362) (not e!772693))))

(assert (=> b!1361869 (= res!905362 (not (contains!9519 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361870 () Bool)

(declare-fun lt!600404 () Unit!44777)

(assert (=> b!1361870 (= e!772692 lt!600404)))

(declare-fun lt!600402 () Unit!44777)

(declare-fun lemmaListSubSeqRefl!0 (List!31807) Unit!44777)

(assert (=> b!1361870 (= lt!600402 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!878 (List!31807 List!31807) Bool)

(assert (=> b!1361870 (subseq!878 acc!759 acc!759)))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92689 List!31807 List!31807 (_ BitVec 32)) Unit!44777)

(declare-fun $colon$colon!880 (List!31807 (_ BitVec 64)) List!31807)

(assert (=> b!1361870 (= lt!600404 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!880 acc!759 (select (arr!44779 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92689 (_ BitVec 32) List!31807) Bool)

(assert (=> b!1361870 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1361871 () Bool)

(declare-fun e!772690 () Bool)

(assert (=> b!1361871 (= e!772693 e!772690)))

(declare-fun res!905357 () Bool)

(assert (=> b!1361871 (=> (not res!905357) (not e!772690))))

(declare-fun lt!600405 () Bool)

(assert (=> b!1361871 (= res!905357 (and (not (= from!3120 i!1404)) lt!600405 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!600403 () Unit!44777)

(assert (=> b!1361871 (= lt!600403 e!772692)))

(declare-fun c!127702 () Bool)

(assert (=> b!1361871 (= c!127702 lt!600405)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1361871 (= lt!600405 (validKeyInArray!0 (select (arr!44779 a!3742) from!3120)))))

(declare-fun b!1361872 () Bool)

(assert (=> b!1361872 (= e!772690 (not (noDuplicate!2350 ($colon$colon!880 acc!759 (select (arr!44779 a!3742) from!3120)))))))

(declare-fun b!1361873 () Bool)

(declare-fun res!905360 () Bool)

(assert (=> b!1361873 (=> (not res!905360) (not e!772693))))

(assert (=> b!1361873 (= res!905360 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1361864 () Bool)

(declare-fun res!905359 () Bool)

(assert (=> b!1361864 (=> (not res!905359) (not e!772693))))

(assert (=> b!1361864 (= res!905359 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31804))))

(declare-fun res!905358 () Bool)

(assert (=> start!114910 (=> (not res!905358) (not e!772693))))

(assert (=> start!114910 (= res!905358 (and (bvslt (size!45330 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45330 a!3742))))))

(assert (=> start!114910 e!772693))

(assert (=> start!114910 true))

(declare-fun array_inv!34060 (array!92689) Bool)

(assert (=> start!114910 (array_inv!34060 a!3742)))

(declare-fun b!1361874 () Bool)

(declare-fun res!905364 () Bool)

(assert (=> b!1361874 (=> (not res!905364) (not e!772693))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1361874 (= res!905364 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1361875 () Bool)

(declare-fun res!905363 () Bool)

(assert (=> b!1361875 (=> (not res!905363) (not e!772693))))

(assert (=> b!1361875 (= res!905363 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45330 a!3742)))))

(assert (= (and start!114910 res!905358) b!1361865))

(assert (= (and b!1361865 res!905356) b!1361868))

(assert (= (and b!1361868 res!905355) b!1361869))

(assert (= (and b!1361869 res!905362) b!1361864))

(assert (= (and b!1361864 res!905359) b!1361873))

(assert (= (and b!1361873 res!905360) b!1361866))

(assert (= (and b!1361866 res!905361) b!1361874))

(assert (= (and b!1361874 res!905364) b!1361875))

(assert (= (and b!1361875 res!905363) b!1361871))

(assert (= (and b!1361871 c!127702) b!1361870))

(assert (= (and b!1361871 (not c!127702)) b!1361867))

(assert (= (and b!1361871 res!905357) b!1361872))

(declare-fun m!1247413 () Bool)

(assert (=> b!1361872 m!1247413))

(assert (=> b!1361872 m!1247413))

(declare-fun m!1247415 () Bool)

(assert (=> b!1361872 m!1247415))

(assert (=> b!1361872 m!1247415))

(declare-fun m!1247417 () Bool)

(assert (=> b!1361872 m!1247417))

(declare-fun m!1247419 () Bool)

(assert (=> b!1361868 m!1247419))

(declare-fun m!1247421 () Bool)

(assert (=> b!1361865 m!1247421))

(declare-fun m!1247423 () Bool)

(assert (=> b!1361873 m!1247423))

(declare-fun m!1247425 () Bool)

(assert (=> b!1361870 m!1247425))

(assert (=> b!1361870 m!1247413))

(assert (=> b!1361870 m!1247415))

(declare-fun m!1247427 () Bool)

(assert (=> b!1361870 m!1247427))

(declare-fun m!1247429 () Bool)

(assert (=> b!1361870 m!1247429))

(assert (=> b!1361870 m!1247413))

(assert (=> b!1361870 m!1247415))

(declare-fun m!1247431 () Bool)

(assert (=> b!1361870 m!1247431))

(assert (=> b!1361871 m!1247413))

(assert (=> b!1361871 m!1247413))

(declare-fun m!1247433 () Bool)

(assert (=> b!1361871 m!1247433))

(declare-fun m!1247435 () Bool)

(assert (=> b!1361869 m!1247435))

(declare-fun m!1247437 () Bool)

(assert (=> b!1361864 m!1247437))

(declare-fun m!1247439 () Bool)

(assert (=> start!114910 m!1247439))

(declare-fun m!1247441 () Bool)

(assert (=> b!1361874 m!1247441))

(check-sat (not start!114910) (not b!1361874) (not b!1361865) (not b!1361868) (not b!1361870) (not b!1361871) (not b!1361872) (not b!1361873) (not b!1361869) (not b!1361864))
(check-sat)
(get-model)

(declare-fun d!146097 () Bool)

(declare-fun res!905429 () Bool)

(declare-fun e!772722 () Bool)

(assert (=> d!146097 (=> res!905429 e!772722)))

(get-info :version)

(assert (=> d!146097 (= res!905429 ((_ is Nil!31804) ($colon$colon!880 acc!759 (select (arr!44779 a!3742) from!3120))))))

(assert (=> d!146097 (= (noDuplicate!2350 ($colon$colon!880 acc!759 (select (arr!44779 a!3742) from!3120))) e!772722)))

(declare-fun b!1361952 () Bool)

(declare-fun e!772723 () Bool)

(assert (=> b!1361952 (= e!772722 e!772723)))

(declare-fun res!905430 () Bool)

(assert (=> b!1361952 (=> (not res!905430) (not e!772723))))

(assert (=> b!1361952 (= res!905430 (not (contains!9519 (t!46475 ($colon$colon!880 acc!759 (select (arr!44779 a!3742) from!3120))) (h!33021 ($colon$colon!880 acc!759 (select (arr!44779 a!3742) from!3120))))))))

(declare-fun b!1361953 () Bool)

(assert (=> b!1361953 (= e!772723 (noDuplicate!2350 (t!46475 ($colon$colon!880 acc!759 (select (arr!44779 a!3742) from!3120)))))))

(assert (= (and d!146097 (not res!905429)) b!1361952))

(assert (= (and b!1361952 res!905430) b!1361953))

(declare-fun m!1247503 () Bool)

(assert (=> b!1361952 m!1247503))

(declare-fun m!1247505 () Bool)

(assert (=> b!1361953 m!1247505))

(assert (=> b!1361872 d!146097))

(declare-fun d!146099 () Bool)

(assert (=> d!146099 (= ($colon$colon!880 acc!759 (select (arr!44779 a!3742) from!3120)) (Cons!31803 (select (arr!44779 a!3742) from!3120) acc!759))))

(assert (=> b!1361872 d!146099))

(declare-fun d!146101 () Bool)

(assert (=> d!146101 (= (array_inv!34060 a!3742) (bvsge (size!45330 a!3742) #b00000000000000000000000000000000))))

(assert (=> start!114910 d!146101))

(declare-fun b!1361964 () Bool)

(declare-fun e!772734 () Bool)

(assert (=> b!1361964 (= e!772734 (contains!9519 acc!759 (select (arr!44779 a!3742) from!3120)))))

(declare-fun d!146103 () Bool)

(declare-fun res!905437 () Bool)

(declare-fun e!772735 () Bool)

(assert (=> d!146103 (=> res!905437 e!772735)))

(assert (=> d!146103 (= res!905437 (bvsge from!3120 (size!45330 a!3742)))))

(assert (=> d!146103 (= (arrayNoDuplicates!0 a!3742 from!3120 acc!759) e!772735)))

(declare-fun b!1361965 () Bool)

(declare-fun e!772733 () Bool)

(declare-fun e!772732 () Bool)

(assert (=> b!1361965 (= e!772733 e!772732)))

(declare-fun c!127711 () Bool)

(assert (=> b!1361965 (= c!127711 (validKeyInArray!0 (select (arr!44779 a!3742) from!3120)))))

(declare-fun b!1361966 () Bool)

(declare-fun call!65395 () Bool)

(assert (=> b!1361966 (= e!772732 call!65395)))

(declare-fun b!1361967 () Bool)

(assert (=> b!1361967 (= e!772732 call!65395)))

(declare-fun bm!65392 () Bool)

(assert (=> bm!65392 (= call!65395 (arrayNoDuplicates!0 a!3742 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127711 (Cons!31803 (select (arr!44779 a!3742) from!3120) acc!759) acc!759)))))

(declare-fun b!1361968 () Bool)

(assert (=> b!1361968 (= e!772735 e!772733)))

(declare-fun res!905439 () Bool)

(assert (=> b!1361968 (=> (not res!905439) (not e!772733))))

(assert (=> b!1361968 (= res!905439 (not e!772734))))

(declare-fun res!905438 () Bool)

(assert (=> b!1361968 (=> (not res!905438) (not e!772734))))

(assert (=> b!1361968 (= res!905438 (validKeyInArray!0 (select (arr!44779 a!3742) from!3120)))))

(assert (= (and d!146103 (not res!905437)) b!1361968))

(assert (= (and b!1361968 res!905438) b!1361964))

(assert (= (and b!1361968 res!905439) b!1361965))

(assert (= (and b!1361965 c!127711) b!1361967))

(assert (= (and b!1361965 (not c!127711)) b!1361966))

(assert (= (or b!1361967 b!1361966) bm!65392))

(assert (=> b!1361964 m!1247413))

(assert (=> b!1361964 m!1247413))

(declare-fun m!1247507 () Bool)

(assert (=> b!1361964 m!1247507))

(assert (=> b!1361965 m!1247413))

(assert (=> b!1361965 m!1247413))

(assert (=> b!1361965 m!1247433))

(assert (=> bm!65392 m!1247413))

(declare-fun m!1247509 () Bool)

(assert (=> bm!65392 m!1247509))

(assert (=> b!1361968 m!1247413))

(assert (=> b!1361968 m!1247413))

(assert (=> b!1361968 m!1247433))

(assert (=> b!1361873 d!146103))

(declare-fun d!146105 () Bool)

(declare-fun lt!600432 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!690 (List!31807) (InoxSet (_ BitVec 64)))

(assert (=> d!146105 (= lt!600432 (select (content!690 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!772741 () Bool)

(assert (=> d!146105 (= lt!600432 e!772741)))

(declare-fun res!905445 () Bool)

(assert (=> d!146105 (=> (not res!905445) (not e!772741))))

(assert (=> d!146105 (= res!905445 ((_ is Cons!31803) acc!759))))

(assert (=> d!146105 (= (contains!9519 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000) lt!600432)))

(declare-fun b!1361973 () Bool)

(declare-fun e!772740 () Bool)

(assert (=> b!1361973 (= e!772741 e!772740)))

(declare-fun res!905444 () Bool)

(assert (=> b!1361973 (=> res!905444 e!772740)))

(assert (=> b!1361973 (= res!905444 (= (h!33021 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1361974 () Bool)

(assert (=> b!1361974 (= e!772740 (contains!9519 (t!46475 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146105 res!905445) b!1361973))

(assert (= (and b!1361973 (not res!905444)) b!1361974))

(declare-fun m!1247511 () Bool)

(assert (=> d!146105 m!1247511))

(declare-fun m!1247513 () Bool)

(assert (=> d!146105 m!1247513))

(declare-fun m!1247515 () Bool)

(assert (=> b!1361974 m!1247515))

(assert (=> b!1361868 d!146105))

(declare-fun d!146111 () Bool)

(assert (=> d!146111 (= (validKeyInArray!0 l!3587) (and (not (= l!3587 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= l!3587 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1361874 d!146111))

(declare-fun d!146113 () Bool)

(declare-fun lt!600433 () Bool)

(assert (=> d!146113 (= lt!600433 (select (content!690 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!772743 () Bool)

(assert (=> d!146113 (= lt!600433 e!772743)))

(declare-fun res!905447 () Bool)

(assert (=> d!146113 (=> (not res!905447) (not e!772743))))

(assert (=> d!146113 (= res!905447 ((_ is Cons!31803) acc!759))))

(assert (=> d!146113 (= (contains!9519 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000) lt!600433)))

(declare-fun b!1361975 () Bool)

(declare-fun e!772742 () Bool)

(assert (=> b!1361975 (= e!772743 e!772742)))

(declare-fun res!905446 () Bool)

(assert (=> b!1361975 (=> res!905446 e!772742)))

(assert (=> b!1361975 (= res!905446 (= (h!33021 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1361976 () Bool)

(assert (=> b!1361976 (= e!772742 (contains!9519 (t!46475 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146113 res!905447) b!1361975))

(assert (= (and b!1361975 (not res!905446)) b!1361976))

(assert (=> d!146113 m!1247511))

(declare-fun m!1247517 () Bool)

(assert (=> d!146113 m!1247517))

(declare-fun m!1247519 () Bool)

(assert (=> b!1361976 m!1247519))

(assert (=> b!1361869 d!146113))

(declare-fun b!1361977 () Bool)

(declare-fun e!772746 () Bool)

(assert (=> b!1361977 (= e!772746 (contains!9519 Nil!31804 (select (arr!44779 a!3742) #b00000000000000000000000000000000)))))

(declare-fun d!146117 () Bool)

(declare-fun res!905448 () Bool)

(declare-fun e!772747 () Bool)

(assert (=> d!146117 (=> res!905448 e!772747)))

(assert (=> d!146117 (= res!905448 (bvsge #b00000000000000000000000000000000 (size!45330 a!3742)))))

(assert (=> d!146117 (= (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31804) e!772747)))

(declare-fun b!1361978 () Bool)

(declare-fun e!772745 () Bool)

(declare-fun e!772744 () Bool)

(assert (=> b!1361978 (= e!772745 e!772744)))

(declare-fun c!127712 () Bool)

(assert (=> b!1361978 (= c!127712 (validKeyInArray!0 (select (arr!44779 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1361979 () Bool)

(declare-fun call!65396 () Bool)

(assert (=> b!1361979 (= e!772744 call!65396)))

(declare-fun b!1361980 () Bool)

(assert (=> b!1361980 (= e!772744 call!65396)))

(declare-fun bm!65393 () Bool)

(assert (=> bm!65393 (= call!65396 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!127712 (Cons!31803 (select (arr!44779 a!3742) #b00000000000000000000000000000000) Nil!31804) Nil!31804)))))

(declare-fun b!1361981 () Bool)

(assert (=> b!1361981 (= e!772747 e!772745)))

(declare-fun res!905450 () Bool)

(assert (=> b!1361981 (=> (not res!905450) (not e!772745))))

(assert (=> b!1361981 (= res!905450 (not e!772746))))

(declare-fun res!905449 () Bool)

(assert (=> b!1361981 (=> (not res!905449) (not e!772746))))

(assert (=> b!1361981 (= res!905449 (validKeyInArray!0 (select (arr!44779 a!3742) #b00000000000000000000000000000000)))))

(assert (= (and d!146117 (not res!905448)) b!1361981))

(assert (= (and b!1361981 res!905449) b!1361977))

(assert (= (and b!1361981 res!905450) b!1361978))

(assert (= (and b!1361978 c!127712) b!1361980))

(assert (= (and b!1361978 (not c!127712)) b!1361979))

(assert (= (or b!1361980 b!1361979) bm!65393))

(declare-fun m!1247521 () Bool)

(assert (=> b!1361977 m!1247521))

(assert (=> b!1361977 m!1247521))

(declare-fun m!1247523 () Bool)

(assert (=> b!1361977 m!1247523))

(assert (=> b!1361978 m!1247521))

(assert (=> b!1361978 m!1247521))

(declare-fun m!1247525 () Bool)

(assert (=> b!1361978 m!1247525))

(assert (=> bm!65393 m!1247521))

(declare-fun m!1247527 () Bool)

(assert (=> bm!65393 m!1247527))

(assert (=> b!1361981 m!1247521))

(assert (=> b!1361981 m!1247521))

(assert (=> b!1361981 m!1247525))

(assert (=> b!1361864 d!146117))

(declare-fun d!146119 () Bool)

(assert (=> d!146119 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!600436 () Unit!44777)

(declare-fun choose!80 (array!92689 List!31807 List!31807 (_ BitVec 32)) Unit!44777)

(assert (=> d!146119 (= lt!600436 (choose!80 a!3742 ($colon$colon!880 acc!759 (select (arr!44779 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> d!146119 (bvslt (size!45330 a!3742) #b01111111111111111111111111111111)))

(assert (=> d!146119 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!880 acc!759 (select (arr!44779 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)) lt!600436)))

(declare-fun bs!39034 () Bool)

(assert (= bs!39034 d!146119))

(assert (=> bs!39034 m!1247429))

(assert (=> bs!39034 m!1247415))

(declare-fun m!1247529 () Bool)

(assert (=> bs!39034 m!1247529))

(assert (=> b!1361870 d!146119))

(declare-fun b!1362018 () Bool)

(declare-fun e!772778 () Bool)

(assert (=> b!1362018 (= e!772778 (subseq!878 acc!759 (t!46475 acc!759)))))

(declare-fun d!146121 () Bool)

(declare-fun res!905474 () Bool)

(declare-fun e!772779 () Bool)

(assert (=> d!146121 (=> res!905474 e!772779)))

(assert (=> d!146121 (= res!905474 ((_ is Nil!31804) acc!759))))

(assert (=> d!146121 (= (subseq!878 acc!759 acc!759) e!772779)))

(declare-fun b!1362017 () Bool)

(declare-fun e!772777 () Bool)

(assert (=> b!1362017 (= e!772777 (subseq!878 (t!46475 acc!759) (t!46475 acc!759)))))

(declare-fun b!1362015 () Bool)

(declare-fun e!772776 () Bool)

(assert (=> b!1362015 (= e!772779 e!772776)))

(declare-fun res!905476 () Bool)

(assert (=> b!1362015 (=> (not res!905476) (not e!772776))))

(assert (=> b!1362015 (= res!905476 ((_ is Cons!31803) acc!759))))

(declare-fun b!1362016 () Bool)

(assert (=> b!1362016 (= e!772776 e!772778)))

(declare-fun res!905475 () Bool)

(assert (=> b!1362016 (=> res!905475 e!772778)))

(assert (=> b!1362016 (= res!905475 e!772777)))

(declare-fun res!905477 () Bool)

(assert (=> b!1362016 (=> (not res!905477) (not e!772777))))

(assert (=> b!1362016 (= res!905477 (= (h!33021 acc!759) (h!33021 acc!759)))))

(assert (= (and d!146121 (not res!905474)) b!1362015))

(assert (= (and b!1362015 res!905476) b!1362016))

(assert (= (and b!1362016 res!905477) b!1362017))

(assert (= (and b!1362016 (not res!905475)) b!1362018))

(declare-fun m!1247539 () Bool)

(assert (=> b!1362018 m!1247539))

(declare-fun m!1247541 () Bool)

(assert (=> b!1362017 m!1247541))

(assert (=> b!1361870 d!146121))

(declare-fun e!772782 () Bool)

(declare-fun b!1362019 () Bool)

(assert (=> b!1362019 (= e!772782 (contains!9519 acc!759 (select (arr!44779 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun d!146125 () Bool)

(declare-fun res!905478 () Bool)

(declare-fun e!772783 () Bool)

(assert (=> d!146125 (=> res!905478 e!772783)))

(assert (=> d!146125 (= res!905478 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45330 a!3742)))))

(assert (=> d!146125 (= (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759) e!772783)))

(declare-fun b!1362020 () Bool)

(declare-fun e!772781 () Bool)

(declare-fun e!772780 () Bool)

(assert (=> b!1362020 (= e!772781 e!772780)))

(declare-fun c!127718 () Bool)

(assert (=> b!1362020 (= c!127718 (validKeyInArray!0 (select (arr!44779 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1362021 () Bool)

(declare-fun call!65402 () Bool)

(assert (=> b!1362021 (= e!772780 call!65402)))

(declare-fun b!1362022 () Bool)

(assert (=> b!1362022 (= e!772780 call!65402)))

(declare-fun bm!65399 () Bool)

(assert (=> bm!65399 (= call!65402 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120 #b00000000000000000000000000000001) (ite c!127718 (Cons!31803 (select (arr!44779 a!3742) (bvadd #b00000000000000000000000000000001 from!3120)) acc!759) acc!759)))))

(declare-fun b!1362023 () Bool)

(assert (=> b!1362023 (= e!772783 e!772781)))

(declare-fun res!905480 () Bool)

(assert (=> b!1362023 (=> (not res!905480) (not e!772781))))

(assert (=> b!1362023 (= res!905480 (not e!772782))))

(declare-fun res!905479 () Bool)

(assert (=> b!1362023 (=> (not res!905479) (not e!772782))))

(assert (=> b!1362023 (= res!905479 (validKeyInArray!0 (select (arr!44779 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(assert (= (and d!146125 (not res!905478)) b!1362023))

(assert (= (and b!1362023 res!905479) b!1362019))

(assert (= (and b!1362023 res!905480) b!1362020))

(assert (= (and b!1362020 c!127718) b!1362022))

(assert (= (and b!1362020 (not c!127718)) b!1362021))

(assert (= (or b!1362022 b!1362021) bm!65399))

(declare-fun m!1247543 () Bool)

(assert (=> b!1362019 m!1247543))

(assert (=> b!1362019 m!1247543))

(declare-fun m!1247545 () Bool)

(assert (=> b!1362019 m!1247545))

(assert (=> b!1362020 m!1247543))

(assert (=> b!1362020 m!1247543))

(declare-fun m!1247547 () Bool)

(assert (=> b!1362020 m!1247547))

(assert (=> bm!65399 m!1247543))

(declare-fun m!1247549 () Bool)

(assert (=> bm!65399 m!1247549))

(assert (=> b!1362023 m!1247543))

(assert (=> b!1362023 m!1247543))

(assert (=> b!1362023 m!1247547))

(assert (=> b!1361870 d!146125))

(assert (=> b!1361870 d!146099))

(declare-fun d!146127 () Bool)

(assert (=> d!146127 (subseq!878 acc!759 acc!759)))

(declare-fun lt!600439 () Unit!44777)

(declare-fun choose!36 (List!31807) Unit!44777)

(assert (=> d!146127 (= lt!600439 (choose!36 acc!759))))

(assert (=> d!146127 (= (lemmaListSubSeqRefl!0 acc!759) lt!600439)))

(declare-fun bs!39035 () Bool)

(assert (= bs!39035 d!146127))

(assert (=> bs!39035 m!1247431))

(declare-fun m!1247553 () Bool)

(assert (=> bs!39035 m!1247553))

(assert (=> b!1361870 d!146127))

(declare-fun d!146129 () Bool)

(declare-fun res!905484 () Bool)

(declare-fun e!772788 () Bool)

(assert (=> d!146129 (=> res!905484 e!772788)))

(assert (=> d!146129 (= res!905484 ((_ is Nil!31804) acc!759))))

(assert (=> d!146129 (= (noDuplicate!2350 acc!759) e!772788)))

(declare-fun b!1362029 () Bool)

(declare-fun e!772789 () Bool)

(assert (=> b!1362029 (= e!772788 e!772789)))

(declare-fun res!905485 () Bool)

(assert (=> b!1362029 (=> (not res!905485) (not e!772789))))

(assert (=> b!1362029 (= res!905485 (not (contains!9519 (t!46475 acc!759) (h!33021 acc!759))))))

(declare-fun b!1362030 () Bool)

(assert (=> b!1362030 (= e!772789 (noDuplicate!2350 (t!46475 acc!759)))))

(assert (= (and d!146129 (not res!905484)) b!1362029))

(assert (= (and b!1362029 res!905485) b!1362030))

(declare-fun m!1247559 () Bool)

(assert (=> b!1362029 m!1247559))

(declare-fun m!1247561 () Bool)

(assert (=> b!1362030 m!1247561))

(assert (=> b!1361865 d!146129))

(declare-fun d!146131 () Bool)

(assert (=> d!146131 (= (validKeyInArray!0 (select (arr!44779 a!3742) from!3120)) (and (not (= (select (arr!44779 a!3742) from!3120) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44779 a!3742) from!3120) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1361871 d!146131))

(check-sat (not d!146119) (not b!1361953) (not b!1362020) (not b!1361978) (not b!1361976) (not b!1361968) (not b!1361964) (not b!1362019) (not b!1362017) (not bm!65392) (not d!146105) (not d!146127) (not b!1361974) (not bm!65393) (not b!1361965) (not d!146113) (not bm!65399) (not b!1362023) (not b!1362030) (not b!1362018) (not b!1361952) (not b!1361981) (not b!1362029) (not b!1361977))
(check-sat)
