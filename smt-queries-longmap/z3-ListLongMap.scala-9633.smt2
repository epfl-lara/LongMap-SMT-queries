; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113938 () Bool)

(assert start!113938)

(declare-fun b!1351511 () Bool)

(declare-fun res!896979 () Bool)

(declare-fun e!768525 () Bool)

(assert (=> b!1351511 (=> (not res!896979) (not e!768525))))

(declare-datatypes ((List!31549 0))(
  ( (Nil!31546) (Cons!31545 (h!32754 (_ BitVec 64)) (t!46207 List!31549)) )
))
(declare-fun acc!759 () List!31549)

(declare-fun contains!9258 (List!31549 (_ BitVec 64)) Bool)

(assert (=> b!1351511 (= res!896979 (not (contains!9258 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351512 () Bool)

(declare-fun res!896981 () Bool)

(declare-fun e!768524 () Bool)

(assert (=> b!1351512 (=> res!896981 e!768524)))

(declare-fun lt!597250 () List!31549)

(assert (=> b!1351512 (= res!896981 (contains!9258 lt!597250 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1351513 () Bool)

(declare-fun res!896983 () Bool)

(assert (=> b!1351513 (=> res!896983 e!768524)))

(assert (=> b!1351513 (= res!896983 (contains!9258 lt!597250 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1351514 () Bool)

(declare-fun res!896974 () Bool)

(assert (=> b!1351514 (=> res!896974 e!768524)))

(declare-fun noDuplicate!2115 (List!31549) Bool)

(assert (=> b!1351514 (= res!896974 (not (noDuplicate!2115 lt!597250)))))

(declare-fun b!1351515 () Bool)

(declare-fun res!896977 () Bool)

(assert (=> b!1351515 (=> (not res!896977) (not e!768525))))

(declare-datatypes ((array!92120 0))(
  ( (array!92121 (arr!44508 (Array (_ BitVec 32) (_ BitVec 64))) (size!45058 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92120)

(declare-fun arrayNoDuplicates!0 (array!92120 (_ BitVec 32) List!31549) Bool)

(assert (=> b!1351515 (= res!896977 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31546))))

(declare-fun b!1351516 () Bool)

(declare-fun res!896971 () Bool)

(assert (=> b!1351516 (=> (not res!896971) (not e!768525))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1351516 (= res!896971 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45058 a!3742))))))

(declare-fun b!1351517 () Bool)

(assert (=> b!1351517 (= e!768524 true)))

(declare-fun lt!597249 () Bool)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1351517 (= lt!597249 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!597250))))

(declare-datatypes ((Unit!44270 0))(
  ( (Unit!44271) )
))
(declare-fun lt!597247 () Unit!44270)

(declare-fun noDuplicateSubseq!129 (List!31549 List!31549) Unit!44270)

(assert (=> b!1351517 (= lt!597247 (noDuplicateSubseq!129 acc!759 lt!597250))))

(declare-fun b!1351519 () Bool)

(declare-fun res!896972 () Bool)

(assert (=> b!1351519 (=> (not res!896972) (not e!768525))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1351519 (= res!896972 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1351520 () Bool)

(declare-fun res!896978 () Bool)

(assert (=> b!1351520 (=> (not res!896978) (not e!768525))))

(assert (=> b!1351520 (= res!896978 (noDuplicate!2115 acc!759))))

(declare-fun b!1351521 () Bool)

(assert (=> b!1351521 (= e!768525 (not e!768524))))

(declare-fun res!896975 () Bool)

(assert (=> b!1351521 (=> res!896975 e!768524)))

(assert (=> b!1351521 (= res!896975 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!693 (List!31549 (_ BitVec 64)) List!31549)

(assert (=> b!1351521 (= lt!597250 ($colon$colon!693 acc!759 (select (arr!44508 a!3742) from!3120)))))

(declare-fun subseq!678 (List!31549 List!31549) Bool)

(assert (=> b!1351521 (subseq!678 acc!759 acc!759)))

(declare-fun lt!597248 () Unit!44270)

(declare-fun lemmaListSubSeqRefl!0 (List!31549) Unit!44270)

(assert (=> b!1351521 (= lt!597248 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1351522 () Bool)

(declare-fun res!896969 () Bool)

(assert (=> b!1351522 (=> (not res!896969) (not e!768525))))

(assert (=> b!1351522 (= res!896969 (validKeyInArray!0 (select (arr!44508 a!3742) from!3120)))))

(declare-fun b!1351523 () Bool)

(declare-fun res!896973 () Bool)

(assert (=> b!1351523 (=> (not res!896973) (not e!768525))))

(assert (=> b!1351523 (= res!896973 (not (contains!9258 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351518 () Bool)

(declare-fun res!896970 () Bool)

(assert (=> b!1351518 (=> (not res!896970) (not e!768525))))

(assert (=> b!1351518 (= res!896970 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun res!896982 () Bool)

(assert (=> start!113938 (=> (not res!896982) (not e!768525))))

(assert (=> start!113938 (= res!896982 (and (bvslt (size!45058 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45058 a!3742))))))

(assert (=> start!113938 e!768525))

(assert (=> start!113938 true))

(declare-fun array_inv!33536 (array!92120) Bool)

(assert (=> start!113938 (array_inv!33536 a!3742)))

(declare-fun b!1351524 () Bool)

(declare-fun res!896976 () Bool)

(assert (=> b!1351524 (=> res!896976 e!768524)))

(assert (=> b!1351524 (= res!896976 (not (subseq!678 acc!759 lt!597250)))))

(declare-fun b!1351525 () Bool)

(declare-fun res!896980 () Bool)

(assert (=> b!1351525 (=> (not res!896980) (not e!768525))))

(assert (=> b!1351525 (= res!896980 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45058 a!3742)))))

(assert (= (and start!113938 res!896982) b!1351520))

(assert (= (and b!1351520 res!896978) b!1351511))

(assert (= (and b!1351511 res!896979) b!1351523))

(assert (= (and b!1351523 res!896973) b!1351515))

(assert (= (and b!1351515 res!896977) b!1351518))

(assert (= (and b!1351518 res!896970) b!1351516))

(assert (= (and b!1351516 res!896971) b!1351519))

(assert (= (and b!1351519 res!896972) b!1351525))

(assert (= (and b!1351525 res!896980) b!1351522))

(assert (= (and b!1351522 res!896969) b!1351521))

(assert (= (and b!1351521 (not res!896975)) b!1351514))

(assert (= (and b!1351514 (not res!896974)) b!1351513))

(assert (= (and b!1351513 (not res!896983)) b!1351512))

(assert (= (and b!1351512 (not res!896981)) b!1351524))

(assert (= (and b!1351524 (not res!896976)) b!1351517))

(declare-fun m!1238521 () Bool)

(assert (=> b!1351515 m!1238521))

(declare-fun m!1238523 () Bool)

(assert (=> b!1351522 m!1238523))

(assert (=> b!1351522 m!1238523))

(declare-fun m!1238525 () Bool)

(assert (=> b!1351522 m!1238525))

(declare-fun m!1238527 () Bool)

(assert (=> b!1351520 m!1238527))

(declare-fun m!1238529 () Bool)

(assert (=> b!1351511 m!1238529))

(assert (=> b!1351521 m!1238523))

(assert (=> b!1351521 m!1238523))

(declare-fun m!1238531 () Bool)

(assert (=> b!1351521 m!1238531))

(declare-fun m!1238533 () Bool)

(assert (=> b!1351521 m!1238533))

(declare-fun m!1238535 () Bool)

(assert (=> b!1351521 m!1238535))

(declare-fun m!1238537 () Bool)

(assert (=> b!1351524 m!1238537))

(declare-fun m!1238539 () Bool)

(assert (=> b!1351523 m!1238539))

(declare-fun m!1238541 () Bool)

(assert (=> b!1351518 m!1238541))

(declare-fun m!1238543 () Bool)

(assert (=> b!1351517 m!1238543))

(declare-fun m!1238545 () Bool)

(assert (=> b!1351517 m!1238545))

(declare-fun m!1238547 () Bool)

(assert (=> b!1351512 m!1238547))

(declare-fun m!1238549 () Bool)

(assert (=> b!1351519 m!1238549))

(declare-fun m!1238551 () Bool)

(assert (=> b!1351513 m!1238551))

(declare-fun m!1238553 () Bool)

(assert (=> start!113938 m!1238553))

(declare-fun m!1238555 () Bool)

(assert (=> b!1351514 m!1238555))

(check-sat (not start!113938) (not b!1351511) (not b!1351512) (not b!1351515) (not b!1351520) (not b!1351522) (not b!1351514) (not b!1351513) (not b!1351523) (not b!1351518) (not b!1351517) (not b!1351519) (not b!1351524) (not b!1351521))
(check-sat)
