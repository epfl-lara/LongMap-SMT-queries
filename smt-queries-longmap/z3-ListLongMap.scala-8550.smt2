; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104382 () Bool)

(assert start!104382)

(declare-fun b!1246081 () Bool)

(declare-fun res!831517 () Bool)

(declare-fun e!706677 () Bool)

(assert (=> b!1246081 (=> (not res!831517) (not e!706677))))

(declare-datatypes ((List!27552 0))(
  ( (Nil!27549) (Cons!27548 (h!28757 (_ BitVec 64)) (t!41012 List!27552)) )
))
(declare-fun lt!562846 () List!27552)

(declare-fun contains!7428 (List!27552 (_ BitVec 64)) Bool)

(assert (=> b!1246081 (= res!831517 (not (contains!7428 lt!562846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1246082 () Bool)

(declare-fun res!831520 () Bool)

(declare-fun e!706678 () Bool)

(assert (=> b!1246082 (=> (not res!831520) (not e!706678))))

(declare-datatypes ((array!80138 0))(
  ( (array!80139 (arr!38648 (Array (_ BitVec 32) (_ BitVec 64))) (size!39186 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80138)

(declare-fun from!3270 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!80138 (_ BitVec 32) List!27552) Bool)

(assert (=> b!1246082 (= res!831520 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27549))))

(declare-fun b!1246083 () Bool)

(declare-fun res!831515 () Bool)

(assert (=> b!1246083 (=> (not res!831515) (not e!706678))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1246083 (= res!831515 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39186 a!3892)) (not (= newFrom!287 (size!39186 a!3892)))))))

(declare-fun b!1246084 () Bool)

(declare-fun res!831516 () Bool)

(assert (=> b!1246084 (=> (not res!831516) (not e!706677))))

(assert (=> b!1246084 (= res!831516 (not (contains!7428 Nil!27549 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!831514 () Bool)

(assert (=> start!104382 (=> (not res!831514) (not e!706678))))

(assert (=> start!104382 (= res!831514 (and (bvslt (size!39186 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39186 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39186 a!3892))))))

(assert (=> start!104382 e!706678))

(declare-fun array_inv!29631 (array!80138) Bool)

(assert (=> start!104382 (array_inv!29631 a!3892)))

(assert (=> start!104382 true))

(declare-fun b!1246085 () Bool)

(assert (=> b!1246085 (= e!706678 e!706677)))

(declare-fun res!831518 () Bool)

(assert (=> b!1246085 (=> (not res!831518) (not e!706677))))

(assert (=> b!1246085 (= res!831518 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(assert (=> b!1246085 (= lt!562846 (Cons!27548 (select (arr!38648 a!3892) from!3270) Nil!27549))))

(declare-fun b!1246086 () Bool)

(declare-fun res!831513 () Bool)

(assert (=> b!1246086 (=> (not res!831513) (not e!706677))))

(declare-fun subseq!656 (List!27552 List!27552) Bool)

(assert (=> b!1246086 (= res!831513 (subseq!656 Nil!27549 lt!562846))))

(declare-fun b!1246087 () Bool)

(declare-fun res!831512 () Bool)

(assert (=> b!1246087 (=> (not res!831512) (not e!706678))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1246087 (= res!831512 (validKeyInArray!0 (select (arr!38648 a!3892) from!3270)))))

(declare-fun b!1246088 () Bool)

(declare-fun res!831519 () Bool)

(assert (=> b!1246088 (=> (not res!831519) (not e!706677))))

(declare-fun noDuplicate!2053 (List!27552) Bool)

(assert (=> b!1246088 (= res!831519 (noDuplicate!2053 lt!562846))))

(declare-fun b!1246089 () Bool)

(declare-fun res!831521 () Bool)

(assert (=> b!1246089 (=> (not res!831521) (not e!706677))))

(assert (=> b!1246089 (= res!831521 (not (contains!7428 lt!562846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1246090 () Bool)

(assert (=> b!1246090 (= e!706677 (not (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) lt!562846)))))

(declare-datatypes ((Unit!41241 0))(
  ( (Unit!41242) )
))
(declare-fun lt!562845 () Unit!41241)

(declare-fun noDuplicateSubseq!107 (List!27552 List!27552) Unit!41241)

(assert (=> b!1246090 (= lt!562845 (noDuplicateSubseq!107 Nil!27549 lt!562846))))

(declare-fun b!1246091 () Bool)

(declare-fun res!831522 () Bool)

(assert (=> b!1246091 (=> (not res!831522) (not e!706677))))

(assert (=> b!1246091 (= res!831522 (not (contains!7428 Nil!27549 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!104382 res!831514) b!1246082))

(assert (= (and b!1246082 res!831520) b!1246083))

(assert (= (and b!1246083 res!831515) b!1246087))

(assert (= (and b!1246087 res!831512) b!1246085))

(assert (= (and b!1246085 res!831518) b!1246088))

(assert (= (and b!1246088 res!831519) b!1246081))

(assert (= (and b!1246081 res!831517) b!1246089))

(assert (= (and b!1246089 res!831521) b!1246091))

(assert (= (and b!1246091 res!831522) b!1246084))

(assert (= (and b!1246084 res!831516) b!1246086))

(assert (= (and b!1246086 res!831513) b!1246090))

(declare-fun m!1147525 () Bool)

(assert (=> b!1246085 m!1147525))

(declare-fun m!1147527 () Bool)

(assert (=> start!104382 m!1147527))

(declare-fun m!1147529 () Bool)

(assert (=> b!1246081 m!1147529))

(declare-fun m!1147531 () Bool)

(assert (=> b!1246090 m!1147531))

(declare-fun m!1147533 () Bool)

(assert (=> b!1246090 m!1147533))

(declare-fun m!1147535 () Bool)

(assert (=> b!1246088 m!1147535))

(declare-fun m!1147537 () Bool)

(assert (=> b!1246089 m!1147537))

(declare-fun m!1147539 () Bool)

(assert (=> b!1246091 m!1147539))

(declare-fun m!1147541 () Bool)

(assert (=> b!1246082 m!1147541))

(declare-fun m!1147543 () Bool)

(assert (=> b!1246084 m!1147543))

(declare-fun m!1147545 () Bool)

(assert (=> b!1246086 m!1147545))

(assert (=> b!1246087 m!1147525))

(assert (=> b!1246087 m!1147525))

(declare-fun m!1147547 () Bool)

(assert (=> b!1246087 m!1147547))

(check-sat (not b!1246090) (not b!1246084) (not b!1246088) (not start!104382) (not b!1246081) (not b!1246082) (not b!1246089) (not b!1246087) (not b!1246086) (not b!1246091))
(check-sat)
(get-model)

(declare-fun d!137445 () Bool)

(assert (=> d!137445 (= (array_inv!29631 a!3892) (bvsge (size!39186 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!104382 d!137445))

(declare-fun call!61499 () Bool)

(declare-fun c!121974 () Bool)

(declare-fun bm!61496 () Bool)

(assert (=> bm!61496 (= call!61499 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270 #b00000000000000000000000000000001) (ite c!121974 (Cons!27548 (select (arr!38648 a!3892) (bvadd #b00000000000000000000000000000001 from!3270)) lt!562846) lt!562846)))))

(declare-fun b!1246168 () Bool)

(declare-fun e!706706 () Bool)

(assert (=> b!1246168 (= e!706706 call!61499)))

(declare-fun b!1246169 () Bool)

(declare-fun e!706708 () Bool)

(declare-fun e!706709 () Bool)

(assert (=> b!1246169 (= e!706708 e!706709)))

(declare-fun res!831596 () Bool)

(assert (=> b!1246169 (=> (not res!831596) (not e!706709))))

(declare-fun e!706707 () Bool)

(assert (=> b!1246169 (= res!831596 (not e!706707))))

(declare-fun res!831597 () Bool)

(assert (=> b!1246169 (=> (not res!831597) (not e!706707))))

(assert (=> b!1246169 (= res!831597 (validKeyInArray!0 (select (arr!38648 a!3892) (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun b!1246170 () Bool)

(assert (=> b!1246170 (= e!706707 (contains!7428 lt!562846 (select (arr!38648 a!3892) (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun b!1246171 () Bool)

(assert (=> b!1246171 (= e!706709 e!706706)))

(assert (=> b!1246171 (= c!121974 (validKeyInArray!0 (select (arr!38648 a!3892) (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun b!1246172 () Bool)

(assert (=> b!1246172 (= e!706706 call!61499)))

(declare-fun d!137447 () Bool)

(declare-fun res!831595 () Bool)

(assert (=> d!137447 (=> res!831595 e!706708)))

(assert (=> d!137447 (= res!831595 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) (size!39186 a!3892)))))

(assert (=> d!137447 (= (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) lt!562846) e!706708)))

(assert (= (and d!137447 (not res!831595)) b!1246169))

(assert (= (and b!1246169 res!831597) b!1246170))

(assert (= (and b!1246169 res!831596) b!1246171))

(assert (= (and b!1246171 c!121974) b!1246172))

(assert (= (and b!1246171 (not c!121974)) b!1246168))

(assert (= (or b!1246172 b!1246168) bm!61496))

(declare-fun m!1147597 () Bool)

(assert (=> bm!61496 m!1147597))

(declare-fun m!1147599 () Bool)

(assert (=> bm!61496 m!1147599))

(assert (=> b!1246169 m!1147597))

(assert (=> b!1246169 m!1147597))

(declare-fun m!1147601 () Bool)

(assert (=> b!1246169 m!1147601))

(assert (=> b!1246170 m!1147597))

(assert (=> b!1246170 m!1147597))

(declare-fun m!1147603 () Bool)

(assert (=> b!1246170 m!1147603))

(assert (=> b!1246171 m!1147597))

(assert (=> b!1246171 m!1147597))

(assert (=> b!1246171 m!1147601))

(assert (=> b!1246090 d!137447))

(declare-fun d!137449 () Bool)

(assert (=> d!137449 (noDuplicate!2053 Nil!27549)))

(declare-fun lt!562861 () Unit!41241)

(declare-fun choose!1853 (List!27552 List!27552) Unit!41241)

(assert (=> d!137449 (= lt!562861 (choose!1853 Nil!27549 lt!562846))))

(declare-fun e!706712 () Bool)

(assert (=> d!137449 e!706712))

(declare-fun res!831600 () Bool)

(assert (=> d!137449 (=> (not res!831600) (not e!706712))))

(assert (=> d!137449 (= res!831600 (subseq!656 Nil!27549 lt!562846))))

(assert (=> d!137449 (= (noDuplicateSubseq!107 Nil!27549 lt!562846) lt!562861)))

(declare-fun b!1246175 () Bool)

(assert (=> b!1246175 (= e!706712 (noDuplicate!2053 lt!562846))))

(assert (= (and d!137449 res!831600) b!1246175))

(declare-fun m!1147605 () Bool)

(assert (=> d!137449 m!1147605))

(declare-fun m!1147607 () Bool)

(assert (=> d!137449 m!1147607))

(assert (=> d!137449 m!1147545))

(assert (=> b!1246175 m!1147535))

(assert (=> b!1246090 d!137449))

(declare-fun d!137453 () Bool)

(declare-fun lt!562866 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!628 (List!27552) (InoxSet (_ BitVec 64)))

(assert (=> d!137453 (= lt!562866 (select (content!628 Nil!27549) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!706729 () Bool)

(assert (=> d!137453 (= lt!562866 e!706729)))

(declare-fun res!831615 () Bool)

(assert (=> d!137453 (=> (not res!831615) (not e!706729))))

(get-info :version)

(assert (=> d!137453 (= res!831615 ((_ is Cons!27548) Nil!27549))))

(assert (=> d!137453 (= (contains!7428 Nil!27549 #b1000000000000000000000000000000000000000000000000000000000000000) lt!562866)))

(declare-fun b!1246194 () Bool)

(declare-fun e!706730 () Bool)

(assert (=> b!1246194 (= e!706729 e!706730)))

(declare-fun res!831616 () Bool)

(assert (=> b!1246194 (=> res!831616 e!706730)))

(assert (=> b!1246194 (= res!831616 (= (h!28757 Nil!27549) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1246195 () Bool)

(assert (=> b!1246195 (= e!706730 (contains!7428 (t!41012 Nil!27549) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137453 res!831615) b!1246194))

(assert (= (and b!1246194 (not res!831616)) b!1246195))

(declare-fun m!1147609 () Bool)

(assert (=> d!137453 m!1147609))

(declare-fun m!1147611 () Bool)

(assert (=> d!137453 m!1147611))

(declare-fun m!1147615 () Bool)

(assert (=> b!1246195 m!1147615))

(assert (=> b!1246084 d!137453))

(declare-fun d!137457 () Bool)

(declare-fun lt!562868 () Bool)

(assert (=> d!137457 (= lt!562868 (select (content!628 lt!562846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!706733 () Bool)

(assert (=> d!137457 (= lt!562868 e!706733)))

(declare-fun res!831619 () Bool)

(assert (=> d!137457 (=> (not res!831619) (not e!706733))))

(assert (=> d!137457 (= res!831619 ((_ is Cons!27548) lt!562846))))

(assert (=> d!137457 (= (contains!7428 lt!562846 #b1000000000000000000000000000000000000000000000000000000000000000) lt!562868)))

(declare-fun b!1246198 () Bool)

(declare-fun e!706734 () Bool)

(assert (=> b!1246198 (= e!706733 e!706734)))

(declare-fun res!831620 () Bool)

(assert (=> b!1246198 (=> res!831620 e!706734)))

(assert (=> b!1246198 (= res!831620 (= (h!28757 lt!562846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1246199 () Bool)

(assert (=> b!1246199 (= e!706734 (contains!7428 (t!41012 lt!562846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137457 res!831619) b!1246198))

(assert (= (and b!1246198 (not res!831620)) b!1246199))

(declare-fun m!1147621 () Bool)

(assert (=> d!137457 m!1147621))

(declare-fun m!1147623 () Bool)

(assert (=> d!137457 m!1147623))

(declare-fun m!1147625 () Bool)

(assert (=> b!1246199 m!1147625))

(assert (=> b!1246089 d!137457))

(declare-fun b!1246228 () Bool)

(declare-fun e!706761 () Bool)

(declare-fun e!706763 () Bool)

(assert (=> b!1246228 (= e!706761 e!706763)))

(declare-fun res!831646 () Bool)

(assert (=> b!1246228 (=> res!831646 e!706763)))

(declare-fun e!706762 () Bool)

(assert (=> b!1246228 (= res!831646 e!706762)))

(declare-fun res!831648 () Bool)

(assert (=> b!1246228 (=> (not res!831648) (not e!706762))))

(assert (=> b!1246228 (= res!831648 (= (h!28757 Nil!27549) (h!28757 lt!562846)))))

(declare-fun b!1246229 () Bool)

(assert (=> b!1246229 (= e!706762 (subseq!656 (t!41012 Nil!27549) (t!41012 lt!562846)))))

(declare-fun b!1246227 () Bool)

(declare-fun e!706764 () Bool)

(assert (=> b!1246227 (= e!706764 e!706761)))

(declare-fun res!831647 () Bool)

(assert (=> b!1246227 (=> (not res!831647) (not e!706761))))

(assert (=> b!1246227 (= res!831647 ((_ is Cons!27548) lt!562846))))

(declare-fun d!137461 () Bool)

(declare-fun res!831649 () Bool)

(assert (=> d!137461 (=> res!831649 e!706764)))

(assert (=> d!137461 (= res!831649 ((_ is Nil!27549) Nil!27549))))

(assert (=> d!137461 (= (subseq!656 Nil!27549 lt!562846) e!706764)))

(declare-fun b!1246230 () Bool)

(assert (=> b!1246230 (= e!706763 (subseq!656 Nil!27549 (t!41012 lt!562846)))))

(assert (= (and d!137461 (not res!831649)) b!1246227))

(assert (= (and b!1246227 res!831647) b!1246228))

(assert (= (and b!1246228 res!831648) b!1246229))

(assert (= (and b!1246228 (not res!831646)) b!1246230))

(declare-fun m!1147653 () Bool)

(assert (=> b!1246229 m!1147653))

(declare-fun m!1147655 () Bool)

(assert (=> b!1246230 m!1147655))

(assert (=> b!1246086 d!137461))

(declare-fun d!137475 () Bool)

(declare-fun lt!562875 () Bool)

(assert (=> d!137475 (= lt!562875 (select (content!628 Nil!27549) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!706766 () Bool)

(assert (=> d!137475 (= lt!562875 e!706766)))

(declare-fun res!831651 () Bool)

(assert (=> d!137475 (=> (not res!831651) (not e!706766))))

(assert (=> d!137475 (= res!831651 ((_ is Cons!27548) Nil!27549))))

(assert (=> d!137475 (= (contains!7428 Nil!27549 #b0000000000000000000000000000000000000000000000000000000000000000) lt!562875)))

(declare-fun b!1246232 () Bool)

(declare-fun e!706767 () Bool)

(assert (=> b!1246232 (= e!706766 e!706767)))

(declare-fun res!831652 () Bool)

(assert (=> b!1246232 (=> res!831652 e!706767)))

(assert (=> b!1246232 (= res!831652 (= (h!28757 Nil!27549) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1246233 () Bool)

(assert (=> b!1246233 (= e!706767 (contains!7428 (t!41012 Nil!27549) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137475 res!831651) b!1246232))

(assert (= (and b!1246232 (not res!831652)) b!1246233))

(assert (=> d!137475 m!1147609))

(declare-fun m!1147661 () Bool)

(assert (=> d!137475 m!1147661))

(declare-fun m!1147663 () Bool)

(assert (=> b!1246233 m!1147663))

(assert (=> b!1246091 d!137475))

(declare-fun c!121979 () Bool)

(declare-fun call!61504 () Bool)

(declare-fun bm!61501 () Bool)

(assert (=> bm!61501 (= call!61504 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!121979 (Cons!27548 (select (arr!38648 a!3892) from!3270) Nil!27549) Nil!27549)))))

(declare-fun b!1246239 () Bool)

(declare-fun e!706772 () Bool)

(assert (=> b!1246239 (= e!706772 call!61504)))

(declare-fun b!1246240 () Bool)

(declare-fun e!706774 () Bool)

(declare-fun e!706775 () Bool)

(assert (=> b!1246240 (= e!706774 e!706775)))

(declare-fun res!831657 () Bool)

(assert (=> b!1246240 (=> (not res!831657) (not e!706775))))

(declare-fun e!706773 () Bool)

(assert (=> b!1246240 (= res!831657 (not e!706773))))

(declare-fun res!831658 () Bool)

(assert (=> b!1246240 (=> (not res!831658) (not e!706773))))

(assert (=> b!1246240 (= res!831658 (validKeyInArray!0 (select (arr!38648 a!3892) from!3270)))))

(declare-fun b!1246241 () Bool)

(assert (=> b!1246241 (= e!706773 (contains!7428 Nil!27549 (select (arr!38648 a!3892) from!3270)))))

(declare-fun b!1246242 () Bool)

(assert (=> b!1246242 (= e!706775 e!706772)))

(assert (=> b!1246242 (= c!121979 (validKeyInArray!0 (select (arr!38648 a!3892) from!3270)))))

(declare-fun b!1246243 () Bool)

(assert (=> b!1246243 (= e!706772 call!61504)))

(declare-fun d!137479 () Bool)

(declare-fun res!831656 () Bool)

(assert (=> d!137479 (=> res!831656 e!706774)))

(assert (=> d!137479 (= res!831656 (bvsge from!3270 (size!39186 a!3892)))))

(assert (=> d!137479 (= (arrayNoDuplicates!0 a!3892 from!3270 Nil!27549) e!706774)))

(assert (= (and d!137479 (not res!831656)) b!1246240))

(assert (= (and b!1246240 res!831658) b!1246241))

(assert (= (and b!1246240 res!831657) b!1246242))

(assert (= (and b!1246242 c!121979) b!1246243))

(assert (= (and b!1246242 (not c!121979)) b!1246239))

(assert (= (or b!1246243 b!1246239) bm!61501))

(assert (=> bm!61501 m!1147525))

(declare-fun m!1147667 () Bool)

(assert (=> bm!61501 m!1147667))

(assert (=> b!1246240 m!1147525))

(assert (=> b!1246240 m!1147525))

(assert (=> b!1246240 m!1147547))

(assert (=> b!1246241 m!1147525))

(assert (=> b!1246241 m!1147525))

(declare-fun m!1147671 () Bool)

(assert (=> b!1246241 m!1147671))

(assert (=> b!1246242 m!1147525))

(assert (=> b!1246242 m!1147525))

(assert (=> b!1246242 m!1147547))

(assert (=> b!1246082 d!137479))

(declare-fun d!137483 () Bool)

(assert (=> d!137483 (= (validKeyInArray!0 (select (arr!38648 a!3892) from!3270)) (and (not (= (select (arr!38648 a!3892) from!3270) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38648 a!3892) from!3270) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1246087 d!137483))

(declare-fun d!137487 () Bool)

(declare-fun lt!562876 () Bool)

(assert (=> d!137487 (= lt!562876 (select (content!628 lt!562846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!706776 () Bool)

(assert (=> d!137487 (= lt!562876 e!706776)))

(declare-fun res!831659 () Bool)

(assert (=> d!137487 (=> (not res!831659) (not e!706776))))

(assert (=> d!137487 (= res!831659 ((_ is Cons!27548) lt!562846))))

(assert (=> d!137487 (= (contains!7428 lt!562846 #b0000000000000000000000000000000000000000000000000000000000000000) lt!562876)))

(declare-fun b!1246244 () Bool)

(declare-fun e!706777 () Bool)

(assert (=> b!1246244 (= e!706776 e!706777)))

(declare-fun res!831660 () Bool)

(assert (=> b!1246244 (=> res!831660 e!706777)))

(assert (=> b!1246244 (= res!831660 (= (h!28757 lt!562846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1246245 () Bool)

(assert (=> b!1246245 (= e!706777 (contains!7428 (t!41012 lt!562846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137487 res!831659) b!1246244))

(assert (= (and b!1246244 (not res!831660)) b!1246245))

(assert (=> d!137487 m!1147621))

(declare-fun m!1147673 () Bool)

(assert (=> d!137487 m!1147673))

(declare-fun m!1147675 () Bool)

(assert (=> b!1246245 m!1147675))

(assert (=> b!1246081 d!137487))

(declare-fun d!137489 () Bool)

(declare-fun res!831677 () Bool)

(declare-fun e!706796 () Bool)

(assert (=> d!137489 (=> res!831677 e!706796)))

(assert (=> d!137489 (= res!831677 ((_ is Nil!27549) lt!562846))))

(assert (=> d!137489 (= (noDuplicate!2053 lt!562846) e!706796)))

(declare-fun b!1246266 () Bool)

(declare-fun e!706797 () Bool)

(assert (=> b!1246266 (= e!706796 e!706797)))

(declare-fun res!831678 () Bool)

(assert (=> b!1246266 (=> (not res!831678) (not e!706797))))

(assert (=> b!1246266 (= res!831678 (not (contains!7428 (t!41012 lt!562846) (h!28757 lt!562846))))))

(declare-fun b!1246267 () Bool)

(assert (=> b!1246267 (= e!706797 (noDuplicate!2053 (t!41012 lt!562846)))))

(assert (= (and d!137489 (not res!831677)) b!1246266))

(assert (= (and b!1246266 res!831678) b!1246267))

(declare-fun m!1147681 () Bool)

(assert (=> b!1246266 m!1147681))

(declare-fun m!1147683 () Bool)

(assert (=> b!1246267 m!1147683))

(assert (=> b!1246088 d!137489))

(check-sat (not b!1246266) (not b!1246169) (not b!1246230) (not b!1246199) (not bm!61501) (not b!1246170) (not b!1246245) (not b!1246267) (not bm!61496) (not b!1246195) (not b!1246233) (not d!137449) (not d!137453) (not b!1246171) (not d!137487) (not b!1246240) (not b!1246229) (not b!1246175) (not b!1246241) (not b!1246242) (not d!137457) (not d!137475))
(check-sat)
