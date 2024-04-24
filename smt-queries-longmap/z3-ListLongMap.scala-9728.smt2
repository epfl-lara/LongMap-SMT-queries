; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115378 () Bool)

(assert start!115378)

(declare-fun b!1365527 () Bool)

(declare-fun res!908428 () Bool)

(declare-fun e!774465 () Bool)

(assert (=> b!1365527 (=> (not res!908428) (not e!774465))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92839 0))(
  ( (array!92840 (arr!44845 (Array (_ BitVec 32) (_ BitVec 64))) (size!45396 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92839)

(assert (=> b!1365527 (= res!908428 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45396 a!3742))))))

(declare-fun b!1365528 () Bool)

(declare-fun res!908431 () Bool)

(assert (=> b!1365528 (=> (not res!908431) (not e!774465))))

(declare-datatypes ((List!31873 0))(
  ( (Nil!31870) (Cons!31869 (h!33087 (_ BitVec 64)) (t!46559 List!31873)) )
))
(declare-fun acc!759 () List!31873)

(declare-fun noDuplicate!2416 (List!31873) Bool)

(assert (=> b!1365528 (= res!908431 (noDuplicate!2416 acc!759))))

(declare-fun b!1365529 () Bool)

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92839 (_ BitVec 32) List!31873) Bool)

(assert (=> b!1365529 (= e!774465 (not (arrayNoDuplicates!0 (array!92840 (store (arr!44845 a!3742) i!1404 l!3587) (size!45396 a!3742)) from!3120 acc!759)))))

(declare-fun b!1365530 () Bool)

(declare-fun res!908436 () Bool)

(assert (=> b!1365530 (=> (not res!908436) (not e!774465))))

(assert (=> b!1365530 (= res!908436 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun res!908435 () Bool)

(assert (=> start!115378 (=> (not res!908435) (not e!774465))))

(assert (=> start!115378 (= res!908435 (and (bvslt (size!45396 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45396 a!3742))))))

(assert (=> start!115378 e!774465))

(assert (=> start!115378 true))

(declare-fun array_inv!34126 (array!92839) Bool)

(assert (=> start!115378 (array_inv!34126 a!3742)))

(declare-fun b!1365531 () Bool)

(declare-fun res!908433 () Bool)

(assert (=> b!1365531 (=> (not res!908433) (not e!774465))))

(assert (=> b!1365531 (= res!908433 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31870))))

(declare-fun b!1365532 () Bool)

(declare-fun res!908429 () Bool)

(assert (=> b!1365532 (=> (not res!908429) (not e!774465))))

(assert (=> b!1365532 (= res!908429 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45396 a!3742)))))

(declare-fun b!1365533 () Bool)

(declare-fun res!908432 () Bool)

(assert (=> b!1365533 (=> (not res!908432) (not e!774465))))

(declare-fun contains!9585 (List!31873 (_ BitVec 64)) Bool)

(assert (=> b!1365533 (= res!908432 (not (contains!9585 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365534 () Bool)

(declare-fun res!908434 () Bool)

(assert (=> b!1365534 (=> (not res!908434) (not e!774465))))

(assert (=> b!1365534 (= res!908434 (not (contains!9585 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365535 () Bool)

(declare-fun res!908430 () Bool)

(assert (=> b!1365535 (=> (not res!908430) (not e!774465))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1365535 (= res!908430 (not (validKeyInArray!0 l!3587)))))

(assert (= (and start!115378 res!908435) b!1365528))

(assert (= (and b!1365528 res!908431) b!1365534))

(assert (= (and b!1365534 res!908434) b!1365533))

(assert (= (and b!1365533 res!908432) b!1365531))

(assert (= (and b!1365531 res!908433) b!1365530))

(assert (= (and b!1365530 res!908436) b!1365527))

(assert (= (and b!1365527 res!908428) b!1365535))

(assert (= (and b!1365535 res!908430) b!1365532))

(assert (= (and b!1365532 res!908429) b!1365529))

(declare-fun m!1250521 () Bool)

(assert (=> b!1365534 m!1250521))

(declare-fun m!1250523 () Bool)

(assert (=> b!1365528 m!1250523))

(declare-fun m!1250525 () Bool)

(assert (=> start!115378 m!1250525))

(declare-fun m!1250527 () Bool)

(assert (=> b!1365531 m!1250527))

(declare-fun m!1250529 () Bool)

(assert (=> b!1365533 m!1250529))

(declare-fun m!1250531 () Bool)

(assert (=> b!1365529 m!1250531))

(declare-fun m!1250533 () Bool)

(assert (=> b!1365529 m!1250533))

(declare-fun m!1250535 () Bool)

(assert (=> b!1365530 m!1250535))

(declare-fun m!1250537 () Bool)

(assert (=> b!1365535 m!1250537))

(check-sat (not b!1365530) (not b!1365528) (not b!1365529) (not b!1365531) (not start!115378) (not b!1365533) (not b!1365534) (not b!1365535))
(check-sat)
(get-model)

(declare-fun b!1365600 () Bool)

(declare-fun e!774487 () Bool)

(declare-fun call!65503 () Bool)

(assert (=> b!1365600 (= e!774487 call!65503)))

(declare-fun d!146717 () Bool)

(declare-fun res!908498 () Bool)

(declare-fun e!774489 () Bool)

(assert (=> d!146717 (=> res!908498 e!774489)))

(assert (=> d!146717 (= res!908498 (bvsge from!3120 (size!45396 a!3742)))))

(assert (=> d!146717 (= (arrayNoDuplicates!0 a!3742 from!3120 acc!759) e!774489)))

(declare-fun b!1365601 () Bool)

(assert (=> b!1365601 (= e!774487 call!65503)))

(declare-fun c!127999 () Bool)

(declare-fun bm!65500 () Bool)

(assert (=> bm!65500 (= call!65503 (arrayNoDuplicates!0 a!3742 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127999 (Cons!31869 (select (arr!44845 a!3742) from!3120) acc!759) acc!759)))))

(declare-fun b!1365602 () Bool)

(declare-fun e!774490 () Bool)

(assert (=> b!1365602 (= e!774490 e!774487)))

(assert (=> b!1365602 (= c!127999 (validKeyInArray!0 (select (arr!44845 a!3742) from!3120)))))

(declare-fun b!1365603 () Bool)

(declare-fun e!774488 () Bool)

(assert (=> b!1365603 (= e!774488 (contains!9585 acc!759 (select (arr!44845 a!3742) from!3120)))))

(declare-fun b!1365604 () Bool)

(assert (=> b!1365604 (= e!774489 e!774490)))

(declare-fun res!908497 () Bool)

(assert (=> b!1365604 (=> (not res!908497) (not e!774490))))

(assert (=> b!1365604 (= res!908497 (not e!774488))))

(declare-fun res!908499 () Bool)

(assert (=> b!1365604 (=> (not res!908499) (not e!774488))))

(assert (=> b!1365604 (= res!908499 (validKeyInArray!0 (select (arr!44845 a!3742) from!3120)))))

(assert (= (and d!146717 (not res!908498)) b!1365604))

(assert (= (and b!1365604 res!908499) b!1365603))

(assert (= (and b!1365604 res!908497) b!1365602))

(assert (= (and b!1365602 c!127999) b!1365601))

(assert (= (and b!1365602 (not c!127999)) b!1365600))

(assert (= (or b!1365601 b!1365600) bm!65500))

(declare-fun m!1250575 () Bool)

(assert (=> bm!65500 m!1250575))

(declare-fun m!1250577 () Bool)

(assert (=> bm!65500 m!1250577))

(assert (=> b!1365602 m!1250575))

(assert (=> b!1365602 m!1250575))

(declare-fun m!1250579 () Bool)

(assert (=> b!1365602 m!1250579))

(assert (=> b!1365603 m!1250575))

(assert (=> b!1365603 m!1250575))

(declare-fun m!1250581 () Bool)

(assert (=> b!1365603 m!1250581))

(assert (=> b!1365604 m!1250575))

(assert (=> b!1365604 m!1250575))

(assert (=> b!1365604 m!1250579))

(assert (=> b!1365530 d!146717))

(declare-fun d!146719 () Bool)

(assert (=> d!146719 (= (validKeyInArray!0 l!3587) (and (not (= l!3587 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= l!3587 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1365535 d!146719))

(declare-fun b!1365605 () Bool)

(declare-fun e!774491 () Bool)

(declare-fun call!65504 () Bool)

(assert (=> b!1365605 (= e!774491 call!65504)))

(declare-fun d!146721 () Bool)

(declare-fun res!908501 () Bool)

(declare-fun e!774493 () Bool)

(assert (=> d!146721 (=> res!908501 e!774493)))

(assert (=> d!146721 (= res!908501 (bvsge from!3120 (size!45396 (array!92840 (store (arr!44845 a!3742) i!1404 l!3587) (size!45396 a!3742)))))))

(assert (=> d!146721 (= (arrayNoDuplicates!0 (array!92840 (store (arr!44845 a!3742) i!1404 l!3587) (size!45396 a!3742)) from!3120 acc!759) e!774493)))

(declare-fun b!1365606 () Bool)

(assert (=> b!1365606 (= e!774491 call!65504)))

(declare-fun c!128000 () Bool)

(declare-fun bm!65501 () Bool)

(assert (=> bm!65501 (= call!65504 (arrayNoDuplicates!0 (array!92840 (store (arr!44845 a!3742) i!1404 l!3587) (size!45396 a!3742)) (bvadd from!3120 #b00000000000000000000000000000001) (ite c!128000 (Cons!31869 (select (arr!44845 (array!92840 (store (arr!44845 a!3742) i!1404 l!3587) (size!45396 a!3742))) from!3120) acc!759) acc!759)))))

(declare-fun b!1365607 () Bool)

(declare-fun e!774494 () Bool)

(assert (=> b!1365607 (= e!774494 e!774491)))

(assert (=> b!1365607 (= c!128000 (validKeyInArray!0 (select (arr!44845 (array!92840 (store (arr!44845 a!3742) i!1404 l!3587) (size!45396 a!3742))) from!3120)))))

(declare-fun b!1365608 () Bool)

(declare-fun e!774492 () Bool)

(assert (=> b!1365608 (= e!774492 (contains!9585 acc!759 (select (arr!44845 (array!92840 (store (arr!44845 a!3742) i!1404 l!3587) (size!45396 a!3742))) from!3120)))))

(declare-fun b!1365609 () Bool)

(assert (=> b!1365609 (= e!774493 e!774494)))

(declare-fun res!908500 () Bool)

(assert (=> b!1365609 (=> (not res!908500) (not e!774494))))

(assert (=> b!1365609 (= res!908500 (not e!774492))))

(declare-fun res!908502 () Bool)

(assert (=> b!1365609 (=> (not res!908502) (not e!774492))))

(assert (=> b!1365609 (= res!908502 (validKeyInArray!0 (select (arr!44845 (array!92840 (store (arr!44845 a!3742) i!1404 l!3587) (size!45396 a!3742))) from!3120)))))

(assert (= (and d!146721 (not res!908501)) b!1365609))

(assert (= (and b!1365609 res!908502) b!1365608))

(assert (= (and b!1365609 res!908500) b!1365607))

(assert (= (and b!1365607 c!128000) b!1365606))

(assert (= (and b!1365607 (not c!128000)) b!1365605))

(assert (= (or b!1365606 b!1365605) bm!65501))

(declare-fun m!1250583 () Bool)

(assert (=> bm!65501 m!1250583))

(declare-fun m!1250585 () Bool)

(assert (=> bm!65501 m!1250585))

(assert (=> b!1365607 m!1250583))

(assert (=> b!1365607 m!1250583))

(declare-fun m!1250587 () Bool)

(assert (=> b!1365607 m!1250587))

(assert (=> b!1365608 m!1250583))

(assert (=> b!1365608 m!1250583))

(declare-fun m!1250589 () Bool)

(assert (=> b!1365608 m!1250589))

(assert (=> b!1365609 m!1250583))

(assert (=> b!1365609 m!1250583))

(assert (=> b!1365609 m!1250587))

(assert (=> b!1365529 d!146721))

(declare-fun d!146725 () Bool)

(declare-fun lt!601503 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!704 (List!31873) (InoxSet (_ BitVec 64)))

(assert (=> d!146725 (= lt!601503 (select (content!704 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!774506 () Bool)

(assert (=> d!146725 (= lt!601503 e!774506)))

(declare-fun res!908513 () Bool)

(assert (=> d!146725 (=> (not res!908513) (not e!774506))))

(get-info :version)

(assert (=> d!146725 (= res!908513 ((_ is Cons!31869) acc!759))))

(assert (=> d!146725 (= (contains!9585 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000) lt!601503)))

(declare-fun b!1365620 () Bool)

(declare-fun e!774505 () Bool)

(assert (=> b!1365620 (= e!774506 e!774505)))

(declare-fun res!908514 () Bool)

(assert (=> b!1365620 (=> res!908514 e!774505)))

(assert (=> b!1365620 (= res!908514 (= (h!33087 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1365621 () Bool)

(assert (=> b!1365621 (= e!774505 (contains!9585 (t!46559 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146725 res!908513) b!1365620))

(assert (= (and b!1365620 (not res!908514)) b!1365621))

(declare-fun m!1250595 () Bool)

(assert (=> d!146725 m!1250595))

(declare-fun m!1250597 () Bool)

(assert (=> d!146725 m!1250597))

(declare-fun m!1250599 () Bool)

(assert (=> b!1365621 m!1250599))

(assert (=> b!1365534 d!146725))

(declare-fun d!146733 () Bool)

(assert (=> d!146733 (= (array_inv!34126 a!3742) (bvsge (size!45396 a!3742) #b00000000000000000000000000000000))))

(assert (=> start!115378 d!146733))

(declare-fun d!146735 () Bool)

(declare-fun res!908534 () Bool)

(declare-fun e!774529 () Bool)

(assert (=> d!146735 (=> res!908534 e!774529)))

(assert (=> d!146735 (= res!908534 ((_ is Nil!31870) acc!759))))

(assert (=> d!146735 (= (noDuplicate!2416 acc!759) e!774529)))

(declare-fun b!1365647 () Bool)

(declare-fun e!774530 () Bool)

(assert (=> b!1365647 (= e!774529 e!774530)))

(declare-fun res!908535 () Bool)

(assert (=> b!1365647 (=> (not res!908535) (not e!774530))))

(assert (=> b!1365647 (= res!908535 (not (contains!9585 (t!46559 acc!759) (h!33087 acc!759))))))

(declare-fun b!1365648 () Bool)

(assert (=> b!1365648 (= e!774530 (noDuplicate!2416 (t!46559 acc!759)))))

(assert (= (and d!146735 (not res!908534)) b!1365647))

(assert (= (and b!1365647 res!908535) b!1365648))

(declare-fun m!1250615 () Bool)

(assert (=> b!1365647 m!1250615))

(declare-fun m!1250617 () Bool)

(assert (=> b!1365648 m!1250617))

(assert (=> b!1365528 d!146735))

(declare-fun d!146741 () Bool)

(declare-fun lt!601507 () Bool)

(assert (=> d!146741 (= lt!601507 (select (content!704 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!774532 () Bool)

(assert (=> d!146741 (= lt!601507 e!774532)))

(declare-fun res!908536 () Bool)

(assert (=> d!146741 (=> (not res!908536) (not e!774532))))

(assert (=> d!146741 (= res!908536 ((_ is Cons!31869) acc!759))))

(assert (=> d!146741 (= (contains!9585 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000) lt!601507)))

(declare-fun b!1365649 () Bool)

(declare-fun e!774531 () Bool)

(assert (=> b!1365649 (= e!774532 e!774531)))

(declare-fun res!908537 () Bool)

(assert (=> b!1365649 (=> res!908537 e!774531)))

(assert (=> b!1365649 (= res!908537 (= (h!33087 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1365650 () Bool)

(assert (=> b!1365650 (= e!774531 (contains!9585 (t!46559 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146741 res!908536) b!1365649))

(assert (= (and b!1365649 (not res!908537)) b!1365650))

(assert (=> d!146741 m!1250595))

(declare-fun m!1250619 () Bool)

(assert (=> d!146741 m!1250619))

(declare-fun m!1250621 () Bool)

(assert (=> b!1365650 m!1250621))

(assert (=> b!1365533 d!146741))

(declare-fun b!1365656 () Bool)

(declare-fun e!774537 () Bool)

(declare-fun call!65509 () Bool)

(assert (=> b!1365656 (= e!774537 call!65509)))

(declare-fun d!146743 () Bool)

(declare-fun res!908542 () Bool)

(declare-fun e!774539 () Bool)

(assert (=> d!146743 (=> res!908542 e!774539)))

(assert (=> d!146743 (= res!908542 (bvsge #b00000000000000000000000000000000 (size!45396 a!3742)))))

(assert (=> d!146743 (= (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31870) e!774539)))

(declare-fun b!1365657 () Bool)

(assert (=> b!1365657 (= e!774537 call!65509)))

(declare-fun bm!65506 () Bool)

(declare-fun c!128005 () Bool)

(assert (=> bm!65506 (= call!65509 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!128005 (Cons!31869 (select (arr!44845 a!3742) #b00000000000000000000000000000000) Nil!31870) Nil!31870)))))

(declare-fun b!1365658 () Bool)

(declare-fun e!774540 () Bool)

(assert (=> b!1365658 (= e!774540 e!774537)))

(assert (=> b!1365658 (= c!128005 (validKeyInArray!0 (select (arr!44845 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1365659 () Bool)

(declare-fun e!774538 () Bool)

(assert (=> b!1365659 (= e!774538 (contains!9585 Nil!31870 (select (arr!44845 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1365660 () Bool)

(assert (=> b!1365660 (= e!774539 e!774540)))

(declare-fun res!908541 () Bool)

(assert (=> b!1365660 (=> (not res!908541) (not e!774540))))

(assert (=> b!1365660 (= res!908541 (not e!774538))))

(declare-fun res!908543 () Bool)

(assert (=> b!1365660 (=> (not res!908543) (not e!774538))))

(assert (=> b!1365660 (= res!908543 (validKeyInArray!0 (select (arr!44845 a!3742) #b00000000000000000000000000000000)))))

(assert (= (and d!146743 (not res!908542)) b!1365660))

(assert (= (and b!1365660 res!908543) b!1365659))

(assert (= (and b!1365660 res!908541) b!1365658))

(assert (= (and b!1365658 c!128005) b!1365657))

(assert (= (and b!1365658 (not c!128005)) b!1365656))

(assert (= (or b!1365657 b!1365656) bm!65506))

(declare-fun m!1250631 () Bool)

(assert (=> bm!65506 m!1250631))

(declare-fun m!1250633 () Bool)

(assert (=> bm!65506 m!1250633))

(assert (=> b!1365658 m!1250631))

(assert (=> b!1365658 m!1250631))

(declare-fun m!1250635 () Bool)

(assert (=> b!1365658 m!1250635))

(assert (=> b!1365659 m!1250631))

(assert (=> b!1365659 m!1250631))

(declare-fun m!1250637 () Bool)

(assert (=> b!1365659 m!1250637))

(assert (=> b!1365660 m!1250631))

(assert (=> b!1365660 m!1250631))

(assert (=> b!1365660 m!1250635))

(assert (=> b!1365531 d!146743))

(check-sat (not b!1365647) (not b!1365608) (not d!146741) (not b!1365648) (not b!1365603) (not b!1365604) (not bm!65500) (not b!1365602) (not b!1365650) (not bm!65501) (not b!1365659) (not d!146725) (not bm!65506) (not b!1365607) (not b!1365609) (not b!1365621) (not b!1365660) (not b!1365658))
(check-sat)
(get-model)

(declare-fun d!146765 () Bool)

(assert (=> d!146765 (= (validKeyInArray!0 (select (arr!44845 a!3742) from!3120)) (and (not (= (select (arr!44845 a!3742) from!3120) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44845 a!3742) from!3120) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1365604 d!146765))

(declare-fun d!146767 () Bool)

(declare-fun lt!601513 () Bool)

(assert (=> d!146767 (= lt!601513 (select (content!704 acc!759) (select (arr!44845 a!3742) from!3120)))))

(declare-fun e!774582 () Bool)

(assert (=> d!146767 (= lt!601513 e!774582)))

(declare-fun res!908578 () Bool)

(assert (=> d!146767 (=> (not res!908578) (not e!774582))))

(assert (=> d!146767 (= res!908578 ((_ is Cons!31869) acc!759))))

(assert (=> d!146767 (= (contains!9585 acc!759 (select (arr!44845 a!3742) from!3120)) lt!601513)))

(declare-fun b!1365707 () Bool)

(declare-fun e!774581 () Bool)

(assert (=> b!1365707 (= e!774582 e!774581)))

(declare-fun res!908579 () Bool)

(assert (=> b!1365707 (=> res!908579 e!774581)))

(assert (=> b!1365707 (= res!908579 (= (h!33087 acc!759) (select (arr!44845 a!3742) from!3120)))))

(declare-fun b!1365708 () Bool)

(assert (=> b!1365708 (= e!774581 (contains!9585 (t!46559 acc!759) (select (arr!44845 a!3742) from!3120)))))

(assert (= (and d!146767 res!908578) b!1365707))

(assert (= (and b!1365707 (not res!908579)) b!1365708))

(assert (=> d!146767 m!1250595))

(assert (=> d!146767 m!1250575))

(declare-fun m!1250689 () Bool)

(assert (=> d!146767 m!1250689))

(assert (=> b!1365708 m!1250575))

(declare-fun m!1250691 () Bool)

(assert (=> b!1365708 m!1250691))

(assert (=> b!1365603 d!146767))

(declare-fun d!146769 () Bool)

(declare-fun c!128014 () Bool)

(assert (=> d!146769 (= c!128014 ((_ is Nil!31870) acc!759))))

(declare-fun e!774585 () (InoxSet (_ BitVec 64)))

(assert (=> d!146769 (= (content!704 acc!759) e!774585)))

(declare-fun b!1365713 () Bool)

(assert (=> b!1365713 (= e!774585 ((as const (Array (_ BitVec 64) Bool)) false))))

(declare-fun b!1365714 () Bool)

(assert (=> b!1365714 (= e!774585 ((_ map or) (store ((as const (Array (_ BitVec 64) Bool)) false) (h!33087 acc!759) true) (content!704 (t!46559 acc!759))))))

(assert (= (and d!146769 c!128014) b!1365713))

(assert (= (and d!146769 (not c!128014)) b!1365714))

(declare-fun m!1250693 () Bool)

(assert (=> b!1365714 m!1250693))

(declare-fun m!1250695 () Bool)

(assert (=> b!1365714 m!1250695))

(assert (=> d!146725 d!146769))

(assert (=> d!146741 d!146769))

(assert (=> b!1365602 d!146765))

(declare-fun d!146771 () Bool)

(assert (=> d!146771 (= (validKeyInArray!0 (select (arr!44845 (array!92840 (store (arr!44845 a!3742) i!1404 l!3587) (size!45396 a!3742))) from!3120)) (and (not (= (select (arr!44845 (array!92840 (store (arr!44845 a!3742) i!1404 l!3587) (size!45396 a!3742))) from!3120) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44845 (array!92840 (store (arr!44845 a!3742) i!1404 l!3587) (size!45396 a!3742))) from!3120) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1365609 d!146771))

(declare-fun b!1365715 () Bool)

(declare-fun e!774586 () Bool)

(declare-fun call!65516 () Bool)

(assert (=> b!1365715 (= e!774586 call!65516)))

(declare-fun d!146773 () Bool)

(declare-fun res!908581 () Bool)

(declare-fun e!774588 () Bool)

(assert (=> d!146773 (=> res!908581 e!774588)))

(assert (=> d!146773 (= res!908581 (bvsge (bvadd from!3120 #b00000000000000000000000000000001) (size!45396 a!3742)))))

(assert (=> d!146773 (= (arrayNoDuplicates!0 a!3742 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127999 (Cons!31869 (select (arr!44845 a!3742) from!3120) acc!759) acc!759)) e!774588)))

(declare-fun b!1365716 () Bool)

(assert (=> b!1365716 (= e!774586 call!65516)))

(declare-fun c!128015 () Bool)

(declare-fun bm!65513 () Bool)

(assert (=> bm!65513 (= call!65516 (arrayNoDuplicates!0 a!3742 (bvadd from!3120 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!128015 (Cons!31869 (select (arr!44845 a!3742) (bvadd from!3120 #b00000000000000000000000000000001)) (ite c!127999 (Cons!31869 (select (arr!44845 a!3742) from!3120) acc!759) acc!759)) (ite c!127999 (Cons!31869 (select (arr!44845 a!3742) from!3120) acc!759) acc!759))))))

(declare-fun b!1365717 () Bool)

(declare-fun e!774589 () Bool)

(assert (=> b!1365717 (= e!774589 e!774586)))

(assert (=> b!1365717 (= c!128015 (validKeyInArray!0 (select (arr!44845 a!3742) (bvadd from!3120 #b00000000000000000000000000000001))))))

(declare-fun e!774587 () Bool)

(declare-fun b!1365718 () Bool)

(assert (=> b!1365718 (= e!774587 (contains!9585 (ite c!127999 (Cons!31869 (select (arr!44845 a!3742) from!3120) acc!759) acc!759) (select (arr!44845 a!3742) (bvadd from!3120 #b00000000000000000000000000000001))))))

(declare-fun b!1365719 () Bool)

(assert (=> b!1365719 (= e!774588 e!774589)))

(declare-fun res!908580 () Bool)

(assert (=> b!1365719 (=> (not res!908580) (not e!774589))))

(assert (=> b!1365719 (= res!908580 (not e!774587))))

(declare-fun res!908582 () Bool)

(assert (=> b!1365719 (=> (not res!908582) (not e!774587))))

(assert (=> b!1365719 (= res!908582 (validKeyInArray!0 (select (arr!44845 a!3742) (bvadd from!3120 #b00000000000000000000000000000001))))))

(assert (= (and d!146773 (not res!908581)) b!1365719))

(assert (= (and b!1365719 res!908582) b!1365718))

(assert (= (and b!1365719 res!908580) b!1365717))

(assert (= (and b!1365717 c!128015) b!1365716))

(assert (= (and b!1365717 (not c!128015)) b!1365715))

(assert (= (or b!1365716 b!1365715) bm!65513))

(declare-fun m!1250697 () Bool)

(assert (=> bm!65513 m!1250697))

(declare-fun m!1250699 () Bool)

(assert (=> bm!65513 m!1250699))

(assert (=> b!1365717 m!1250697))

(assert (=> b!1365717 m!1250697))

(declare-fun m!1250701 () Bool)

(assert (=> b!1365717 m!1250701))

(assert (=> b!1365718 m!1250697))

(assert (=> b!1365718 m!1250697))

(declare-fun m!1250703 () Bool)

(assert (=> b!1365718 m!1250703))

(assert (=> b!1365719 m!1250697))

(assert (=> b!1365719 m!1250697))

(assert (=> b!1365719 m!1250701))

(assert (=> bm!65500 d!146773))

(declare-fun d!146775 () Bool)

(declare-fun lt!601514 () Bool)

(assert (=> d!146775 (= lt!601514 (select (content!704 acc!759) (select (arr!44845 (array!92840 (store (arr!44845 a!3742) i!1404 l!3587) (size!45396 a!3742))) from!3120)))))

(declare-fun e!774591 () Bool)

(assert (=> d!146775 (= lt!601514 e!774591)))

(declare-fun res!908583 () Bool)

(assert (=> d!146775 (=> (not res!908583) (not e!774591))))

(assert (=> d!146775 (= res!908583 ((_ is Cons!31869) acc!759))))

(assert (=> d!146775 (= (contains!9585 acc!759 (select (arr!44845 (array!92840 (store (arr!44845 a!3742) i!1404 l!3587) (size!45396 a!3742))) from!3120)) lt!601514)))

(declare-fun b!1365720 () Bool)

(declare-fun e!774590 () Bool)

(assert (=> b!1365720 (= e!774591 e!774590)))

(declare-fun res!908584 () Bool)

(assert (=> b!1365720 (=> res!908584 e!774590)))

(assert (=> b!1365720 (= res!908584 (= (h!33087 acc!759) (select (arr!44845 (array!92840 (store (arr!44845 a!3742) i!1404 l!3587) (size!45396 a!3742))) from!3120)))))

(declare-fun b!1365721 () Bool)

(assert (=> b!1365721 (= e!774590 (contains!9585 (t!46559 acc!759) (select (arr!44845 (array!92840 (store (arr!44845 a!3742) i!1404 l!3587) (size!45396 a!3742))) from!3120)))))

(assert (= (and d!146775 res!908583) b!1365720))

(assert (= (and b!1365720 (not res!908584)) b!1365721))

(assert (=> d!146775 m!1250595))

(assert (=> d!146775 m!1250583))

(declare-fun m!1250705 () Bool)

(assert (=> d!146775 m!1250705))

(assert (=> b!1365721 m!1250583))

(declare-fun m!1250707 () Bool)

(assert (=> b!1365721 m!1250707))

(assert (=> b!1365608 d!146775))

(declare-fun d!146777 () Bool)

(declare-fun lt!601515 () Bool)

(assert (=> d!146777 (= lt!601515 (select (content!704 (t!46559 acc!759)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!774593 () Bool)

(assert (=> d!146777 (= lt!601515 e!774593)))

(declare-fun res!908585 () Bool)

(assert (=> d!146777 (=> (not res!908585) (not e!774593))))

(assert (=> d!146777 (= res!908585 ((_ is Cons!31869) (t!46559 acc!759)))))

(assert (=> d!146777 (= (contains!9585 (t!46559 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000) lt!601515)))

(declare-fun b!1365722 () Bool)

(declare-fun e!774592 () Bool)

(assert (=> b!1365722 (= e!774593 e!774592)))

(declare-fun res!908586 () Bool)

(assert (=> b!1365722 (=> res!908586 e!774592)))

(assert (=> b!1365722 (= res!908586 (= (h!33087 (t!46559 acc!759)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1365723 () Bool)

(assert (=> b!1365723 (= e!774592 (contains!9585 (t!46559 (t!46559 acc!759)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146777 res!908585) b!1365722))

(assert (= (and b!1365722 (not res!908586)) b!1365723))

(assert (=> d!146777 m!1250695))

(declare-fun m!1250709 () Bool)

(assert (=> d!146777 m!1250709))

(declare-fun m!1250711 () Bool)

(assert (=> b!1365723 m!1250711))

(assert (=> b!1365650 d!146777))

(assert (=> b!1365607 d!146771))

(declare-fun b!1365724 () Bool)

(declare-fun e!774594 () Bool)

(declare-fun call!65517 () Bool)

(assert (=> b!1365724 (= e!774594 call!65517)))

(declare-fun d!146779 () Bool)

(declare-fun res!908588 () Bool)

(declare-fun e!774596 () Bool)

(assert (=> d!146779 (=> res!908588 e!774596)))

(assert (=> d!146779 (= res!908588 (bvsge (bvadd from!3120 #b00000000000000000000000000000001) (size!45396 (array!92840 (store (arr!44845 a!3742) i!1404 l!3587) (size!45396 a!3742)))))))

(assert (=> d!146779 (= (arrayNoDuplicates!0 (array!92840 (store (arr!44845 a!3742) i!1404 l!3587) (size!45396 a!3742)) (bvadd from!3120 #b00000000000000000000000000000001) (ite c!128000 (Cons!31869 (select (arr!44845 (array!92840 (store (arr!44845 a!3742) i!1404 l!3587) (size!45396 a!3742))) from!3120) acc!759) acc!759)) e!774596)))

(declare-fun b!1365725 () Bool)

(assert (=> b!1365725 (= e!774594 call!65517)))

(declare-fun c!128016 () Bool)

(declare-fun bm!65514 () Bool)

(assert (=> bm!65514 (= call!65517 (arrayNoDuplicates!0 (array!92840 (store (arr!44845 a!3742) i!1404 l!3587) (size!45396 a!3742)) (bvadd from!3120 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!128016 (Cons!31869 (select (arr!44845 (array!92840 (store (arr!44845 a!3742) i!1404 l!3587) (size!45396 a!3742))) (bvadd from!3120 #b00000000000000000000000000000001)) (ite c!128000 (Cons!31869 (select (arr!44845 (array!92840 (store (arr!44845 a!3742) i!1404 l!3587) (size!45396 a!3742))) from!3120) acc!759) acc!759)) (ite c!128000 (Cons!31869 (select (arr!44845 (array!92840 (store (arr!44845 a!3742) i!1404 l!3587) (size!45396 a!3742))) from!3120) acc!759) acc!759))))))

(declare-fun b!1365726 () Bool)

(declare-fun e!774597 () Bool)

(assert (=> b!1365726 (= e!774597 e!774594)))

(assert (=> b!1365726 (= c!128016 (validKeyInArray!0 (select (arr!44845 (array!92840 (store (arr!44845 a!3742) i!1404 l!3587) (size!45396 a!3742))) (bvadd from!3120 #b00000000000000000000000000000001))))))

(declare-fun b!1365727 () Bool)

(declare-fun e!774595 () Bool)

(assert (=> b!1365727 (= e!774595 (contains!9585 (ite c!128000 (Cons!31869 (select (arr!44845 (array!92840 (store (arr!44845 a!3742) i!1404 l!3587) (size!45396 a!3742))) from!3120) acc!759) acc!759) (select (arr!44845 (array!92840 (store (arr!44845 a!3742) i!1404 l!3587) (size!45396 a!3742))) (bvadd from!3120 #b00000000000000000000000000000001))))))

(declare-fun b!1365728 () Bool)

(assert (=> b!1365728 (= e!774596 e!774597)))

(declare-fun res!908587 () Bool)

(assert (=> b!1365728 (=> (not res!908587) (not e!774597))))

(assert (=> b!1365728 (= res!908587 (not e!774595))))

(declare-fun res!908589 () Bool)

(assert (=> b!1365728 (=> (not res!908589) (not e!774595))))

(assert (=> b!1365728 (= res!908589 (validKeyInArray!0 (select (arr!44845 (array!92840 (store (arr!44845 a!3742) i!1404 l!3587) (size!45396 a!3742))) (bvadd from!3120 #b00000000000000000000000000000001))))))

(assert (= (and d!146779 (not res!908588)) b!1365728))

(assert (= (and b!1365728 res!908589) b!1365727))

(assert (= (and b!1365728 res!908587) b!1365726))

(assert (= (and b!1365726 c!128016) b!1365725))

(assert (= (and b!1365726 (not c!128016)) b!1365724))

(assert (= (or b!1365725 b!1365724) bm!65514))

(declare-fun m!1250713 () Bool)

(assert (=> bm!65514 m!1250713))

(declare-fun m!1250715 () Bool)

(assert (=> bm!65514 m!1250715))

(assert (=> b!1365726 m!1250713))

(assert (=> b!1365726 m!1250713))

(declare-fun m!1250717 () Bool)

(assert (=> b!1365726 m!1250717))

(assert (=> b!1365727 m!1250713))

(assert (=> b!1365727 m!1250713))

(declare-fun m!1250719 () Bool)

(assert (=> b!1365727 m!1250719))

(assert (=> b!1365728 m!1250713))

(assert (=> b!1365728 m!1250713))

(assert (=> b!1365728 m!1250717))

(assert (=> bm!65501 d!146779))

(declare-fun d!146781 () Bool)

(assert (=> d!146781 (= (validKeyInArray!0 (select (arr!44845 a!3742) #b00000000000000000000000000000000)) (and (not (= (select (arr!44845 a!3742) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44845 a!3742) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1365660 d!146781))

(declare-fun d!146783 () Bool)

(declare-fun lt!601516 () Bool)

(assert (=> d!146783 (= lt!601516 (select (content!704 (t!46559 acc!759)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!774599 () Bool)

(assert (=> d!146783 (= lt!601516 e!774599)))

(declare-fun res!908590 () Bool)

(assert (=> d!146783 (=> (not res!908590) (not e!774599))))

(assert (=> d!146783 (= res!908590 ((_ is Cons!31869) (t!46559 acc!759)))))

(assert (=> d!146783 (= (contains!9585 (t!46559 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000) lt!601516)))

(declare-fun b!1365729 () Bool)

(declare-fun e!774598 () Bool)

(assert (=> b!1365729 (= e!774599 e!774598)))

(declare-fun res!908591 () Bool)

(assert (=> b!1365729 (=> res!908591 e!774598)))

(assert (=> b!1365729 (= res!908591 (= (h!33087 (t!46559 acc!759)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1365730 () Bool)

(assert (=> b!1365730 (= e!774598 (contains!9585 (t!46559 (t!46559 acc!759)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146783 res!908590) b!1365729))

(assert (= (and b!1365729 (not res!908591)) b!1365730))

(assert (=> d!146783 m!1250695))

(declare-fun m!1250721 () Bool)

(assert (=> d!146783 m!1250721))

(declare-fun m!1250723 () Bool)

(assert (=> b!1365730 m!1250723))

(assert (=> b!1365621 d!146783))

(declare-fun d!146785 () Bool)

(declare-fun res!908592 () Bool)

(declare-fun e!774600 () Bool)

(assert (=> d!146785 (=> res!908592 e!774600)))

(assert (=> d!146785 (= res!908592 ((_ is Nil!31870) (t!46559 acc!759)))))

(assert (=> d!146785 (= (noDuplicate!2416 (t!46559 acc!759)) e!774600)))

(declare-fun b!1365731 () Bool)

(declare-fun e!774601 () Bool)

(assert (=> b!1365731 (= e!774600 e!774601)))

(declare-fun res!908593 () Bool)

(assert (=> b!1365731 (=> (not res!908593) (not e!774601))))

(assert (=> b!1365731 (= res!908593 (not (contains!9585 (t!46559 (t!46559 acc!759)) (h!33087 (t!46559 acc!759)))))))

(declare-fun b!1365732 () Bool)

(assert (=> b!1365732 (= e!774601 (noDuplicate!2416 (t!46559 (t!46559 acc!759))))))

(assert (= (and d!146785 (not res!908592)) b!1365731))

(assert (= (and b!1365731 res!908593) b!1365732))

(declare-fun m!1250725 () Bool)

(assert (=> b!1365731 m!1250725))

(declare-fun m!1250727 () Bool)

(assert (=> b!1365732 m!1250727))

(assert (=> b!1365648 d!146785))

(declare-fun d!146787 () Bool)

(declare-fun lt!601517 () Bool)

(assert (=> d!146787 (= lt!601517 (select (content!704 Nil!31870) (select (arr!44845 a!3742) #b00000000000000000000000000000000)))))

(declare-fun e!774603 () Bool)

(assert (=> d!146787 (= lt!601517 e!774603)))

(declare-fun res!908594 () Bool)

(assert (=> d!146787 (=> (not res!908594) (not e!774603))))

(assert (=> d!146787 (= res!908594 ((_ is Cons!31869) Nil!31870))))

(assert (=> d!146787 (= (contains!9585 Nil!31870 (select (arr!44845 a!3742) #b00000000000000000000000000000000)) lt!601517)))

(declare-fun b!1365733 () Bool)

(declare-fun e!774602 () Bool)

(assert (=> b!1365733 (= e!774603 e!774602)))

(declare-fun res!908595 () Bool)

(assert (=> b!1365733 (=> res!908595 e!774602)))

(assert (=> b!1365733 (= res!908595 (= (h!33087 Nil!31870) (select (arr!44845 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1365734 () Bool)

(assert (=> b!1365734 (= e!774602 (contains!9585 (t!46559 Nil!31870) (select (arr!44845 a!3742) #b00000000000000000000000000000000)))))

(assert (= (and d!146787 res!908594) b!1365733))

(assert (= (and b!1365733 (not res!908595)) b!1365734))

(declare-fun m!1250729 () Bool)

(assert (=> d!146787 m!1250729))

(assert (=> d!146787 m!1250631))

(declare-fun m!1250731 () Bool)

(assert (=> d!146787 m!1250731))

(assert (=> b!1365734 m!1250631))

(declare-fun m!1250733 () Bool)

(assert (=> b!1365734 m!1250733))

(assert (=> b!1365659 d!146787))

(declare-fun d!146789 () Bool)

(declare-fun lt!601518 () Bool)

(assert (=> d!146789 (= lt!601518 (select (content!704 (t!46559 acc!759)) (h!33087 acc!759)))))

(declare-fun e!774605 () Bool)

(assert (=> d!146789 (= lt!601518 e!774605)))

(declare-fun res!908596 () Bool)

(assert (=> d!146789 (=> (not res!908596) (not e!774605))))

(assert (=> d!146789 (= res!908596 ((_ is Cons!31869) (t!46559 acc!759)))))

(assert (=> d!146789 (= (contains!9585 (t!46559 acc!759) (h!33087 acc!759)) lt!601518)))

(declare-fun b!1365735 () Bool)

(declare-fun e!774604 () Bool)

(assert (=> b!1365735 (= e!774605 e!774604)))

(declare-fun res!908597 () Bool)

(assert (=> b!1365735 (=> res!908597 e!774604)))

(assert (=> b!1365735 (= res!908597 (= (h!33087 (t!46559 acc!759)) (h!33087 acc!759)))))

(declare-fun b!1365736 () Bool)

(assert (=> b!1365736 (= e!774604 (contains!9585 (t!46559 (t!46559 acc!759)) (h!33087 acc!759)))))

(assert (= (and d!146789 res!908596) b!1365735))

(assert (= (and b!1365735 (not res!908597)) b!1365736))

(assert (=> d!146789 m!1250695))

(declare-fun m!1250735 () Bool)

(assert (=> d!146789 m!1250735))

(declare-fun m!1250737 () Bool)

(assert (=> b!1365736 m!1250737))

(assert (=> b!1365647 d!146789))

(assert (=> b!1365658 d!146781))

(declare-fun b!1365737 () Bool)

(declare-fun e!774606 () Bool)

(declare-fun call!65518 () Bool)

(assert (=> b!1365737 (= e!774606 call!65518)))

(declare-fun d!146791 () Bool)

(declare-fun res!908599 () Bool)

(declare-fun e!774608 () Bool)

(assert (=> d!146791 (=> res!908599 e!774608)))

(assert (=> d!146791 (= res!908599 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!45396 a!3742)))))

(assert (=> d!146791 (= (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!128005 (Cons!31869 (select (arr!44845 a!3742) #b00000000000000000000000000000000) Nil!31870) Nil!31870)) e!774608)))

(declare-fun b!1365738 () Bool)

(assert (=> b!1365738 (= e!774606 call!65518)))

(declare-fun bm!65515 () Bool)

(declare-fun c!128017 () Bool)

(assert (=> bm!65515 (= call!65518 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!128017 (Cons!31869 (select (arr!44845 a!3742) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!128005 (Cons!31869 (select (arr!44845 a!3742) #b00000000000000000000000000000000) Nil!31870) Nil!31870)) (ite c!128005 (Cons!31869 (select (arr!44845 a!3742) #b00000000000000000000000000000000) Nil!31870) Nil!31870))))))

(declare-fun b!1365739 () Bool)

(declare-fun e!774609 () Bool)

(assert (=> b!1365739 (= e!774609 e!774606)))

(assert (=> b!1365739 (= c!128017 (validKeyInArray!0 (select (arr!44845 a!3742) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1365740 () Bool)

(declare-fun e!774607 () Bool)

(assert (=> b!1365740 (= e!774607 (contains!9585 (ite c!128005 (Cons!31869 (select (arr!44845 a!3742) #b00000000000000000000000000000000) Nil!31870) Nil!31870) (select (arr!44845 a!3742) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1365741 () Bool)

(assert (=> b!1365741 (= e!774608 e!774609)))

(declare-fun res!908598 () Bool)

(assert (=> b!1365741 (=> (not res!908598) (not e!774609))))

(assert (=> b!1365741 (= res!908598 (not e!774607))))

(declare-fun res!908600 () Bool)

(assert (=> b!1365741 (=> (not res!908600) (not e!774607))))

(assert (=> b!1365741 (= res!908600 (validKeyInArray!0 (select (arr!44845 a!3742) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!146791 (not res!908599)) b!1365741))

(assert (= (and b!1365741 res!908600) b!1365740))

(assert (= (and b!1365741 res!908598) b!1365739))

(assert (= (and b!1365739 c!128017) b!1365738))

(assert (= (and b!1365739 (not c!128017)) b!1365737))

(assert (= (or b!1365738 b!1365737) bm!65515))

(declare-fun m!1250739 () Bool)

(assert (=> bm!65515 m!1250739))

(declare-fun m!1250741 () Bool)

(assert (=> bm!65515 m!1250741))

(assert (=> b!1365739 m!1250739))

(assert (=> b!1365739 m!1250739))

(declare-fun m!1250743 () Bool)

(assert (=> b!1365739 m!1250743))

(assert (=> b!1365740 m!1250739))

(assert (=> b!1365740 m!1250739))

(declare-fun m!1250745 () Bool)

(assert (=> b!1365740 m!1250745))

(assert (=> b!1365741 m!1250739))

(assert (=> b!1365741 m!1250739))

(assert (=> b!1365741 m!1250743))

(assert (=> bm!65506 d!146791))

(check-sat (not b!1365717) (not b!1365734) (not b!1365721) (not bm!65514) (not b!1365736) (not b!1365727) (not d!146783) (not b!1365731) (not b!1365740) (not bm!65513) (not b!1365726) (not b!1365718) (not b!1365708) (not d!146767) (not d!146777) (not b!1365739) (not b!1365728) (not b!1365723) (not d!146789) (not b!1365730) (not b!1365732) (not bm!65515) (not d!146787) (not b!1365719) (not d!146775) (not b!1365714) (not b!1365741))
(check-sat)
