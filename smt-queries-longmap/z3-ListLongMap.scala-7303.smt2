; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93368 () Bool)

(assert start!93368)

(declare-fun b!1057929 () Bool)

(declare-fun e!601764 () Bool)

(declare-datatypes ((List!22393 0))(
  ( (Nil!22390) (Cons!22389 (h!23598 (_ BitVec 64)) (t!31700 List!22393)) )
))
(declare-fun contains!6205 (List!22393 (_ BitVec 64)) Bool)

(assert (=> b!1057929 (= e!601764 (not (contains!6205 Nil!22390 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1057930 () Bool)

(declare-fun e!601767 () Bool)

(declare-fun e!601770 () Bool)

(assert (=> b!1057930 (= e!601767 (not e!601770))))

(declare-fun res!706553 () Bool)

(assert (=> b!1057930 (=> res!706553 e!601770)))

(declare-fun lt!466659 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1057930 (= res!706553 (or (bvsgt lt!466659 i!1381) (bvsle i!1381 lt!466659)))))

(declare-fun e!601766 () Bool)

(assert (=> b!1057930 e!601766))

(declare-fun res!706554 () Bool)

(assert (=> b!1057930 (=> (not res!706554) (not e!601766))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-datatypes ((array!66722 0))(
  ( (array!66723 (arr!32081 (Array (_ BitVec 32) (_ BitVec 64))) (size!32617 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66722)

(assert (=> b!1057930 (= res!706554 (= (select (store (arr!32081 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466659) k0!2747))))

(declare-fun e!601771 () Bool)

(declare-fun b!1057931 () Bool)

(declare-fun arrayContainsKey!0 (array!66722 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1057931 (= e!601771 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun res!706551 () Bool)

(declare-fun e!601768 () Bool)

(assert (=> start!93368 (=> (not res!706551) (not e!601768))))

(assert (=> start!93368 (= res!706551 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32617 a!3488)) (bvslt (size!32617 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93368 e!601768))

(assert (=> start!93368 true))

(declare-fun array_inv!24861 (array!66722) Bool)

(assert (=> start!93368 (array_inv!24861 a!3488)))

(declare-fun b!1057932 () Bool)

(declare-fun res!706555 () Bool)

(assert (=> b!1057932 (=> (not res!706555) (not e!601768))))

(declare-fun arrayNoDuplicates!0 (array!66722 (_ BitVec 32) List!22393) Bool)

(assert (=> b!1057932 (= res!706555 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22390))))

(declare-fun b!1057933 () Bool)

(declare-fun res!706548 () Bool)

(assert (=> b!1057933 (=> (not res!706548) (not e!601768))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1057933 (= res!706548 (validKeyInArray!0 k0!2747))))

(declare-fun b!1057934 () Bool)

(declare-fun e!601763 () Bool)

(assert (=> b!1057934 (= e!601770 e!601763)))

(declare-fun res!706550 () Bool)

(assert (=> b!1057934 (=> res!706550 e!601763)))

(declare-fun lt!466658 () (_ BitVec 32))

(assert (=> b!1057934 (= res!706550 (or (bvslt lt!466659 #b00000000000000000000000000000000) (bvsge lt!466658 (size!32617 a!3488)) (bvsge lt!466659 (size!32617 a!3488))))))

(assert (=> b!1057934 (arrayContainsKey!0 a!3488 k0!2747 lt!466658)))

(declare-datatypes ((Unit!34684 0))(
  ( (Unit!34685) )
))
(declare-fun lt!466662 () Unit!34684)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66722 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34684)

(assert (=> b!1057934 (= lt!466662 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!466658))))

(assert (=> b!1057934 (= lt!466658 (bvadd #b00000000000000000000000000000001 lt!466659))))

(assert (=> b!1057934 (arrayNoDuplicates!0 a!3488 lt!466659 Nil!22390)))

(declare-fun lt!466660 () Unit!34684)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66722 (_ BitVec 32) (_ BitVec 32)) Unit!34684)

(assert (=> b!1057934 (= lt!466660 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466659))))

(declare-fun b!1057935 () Bool)

(assert (=> b!1057935 (= e!601766 e!601771)))

(declare-fun res!706545 () Bool)

(assert (=> b!1057935 (=> res!706545 e!601771)))

(assert (=> b!1057935 (= res!706545 (or (bvsgt lt!466659 i!1381) (bvsle i!1381 lt!466659)))))

(declare-fun b!1057936 () Bool)

(declare-fun e!601765 () Bool)

(assert (=> b!1057936 (= e!601765 e!601767)))

(declare-fun res!706552 () Bool)

(assert (=> b!1057936 (=> (not res!706552) (not e!601767))))

(assert (=> b!1057936 (= res!706552 (not (= lt!466659 i!1381)))))

(declare-fun lt!466661 () array!66722)

(declare-fun arrayScanForKey!0 (array!66722 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1057936 (= lt!466659 (arrayScanForKey!0 lt!466661 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1057937 () Bool)

(declare-fun res!706546 () Bool)

(assert (=> b!1057937 (=> res!706546 e!601763)))

(declare-fun noDuplicate!1561 (List!22393) Bool)

(assert (=> b!1057937 (= res!706546 (not (noDuplicate!1561 Nil!22390)))))

(declare-fun b!1057938 () Bool)

(declare-fun res!706547 () Bool)

(assert (=> b!1057938 (=> (not res!706547) (not e!601768))))

(assert (=> b!1057938 (= res!706547 (= (select (arr!32081 a!3488) i!1381) k0!2747))))

(declare-fun b!1057939 () Bool)

(assert (=> b!1057939 (= e!601768 e!601765)))

(declare-fun res!706556 () Bool)

(assert (=> b!1057939 (=> (not res!706556) (not e!601765))))

(assert (=> b!1057939 (= res!706556 (arrayContainsKey!0 lt!466661 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1057939 (= lt!466661 (array!66723 (store (arr!32081 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32617 a!3488)))))

(declare-fun b!1057940 () Bool)

(assert (=> b!1057940 (= e!601763 e!601764)))

(declare-fun res!706549 () Bool)

(assert (=> b!1057940 (=> (not res!706549) (not e!601764))))

(assert (=> b!1057940 (= res!706549 (not (contains!6205 Nil!22390 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!93368 res!706551) b!1057932))

(assert (= (and b!1057932 res!706555) b!1057933))

(assert (= (and b!1057933 res!706548) b!1057938))

(assert (= (and b!1057938 res!706547) b!1057939))

(assert (= (and b!1057939 res!706556) b!1057936))

(assert (= (and b!1057936 res!706552) b!1057930))

(assert (= (and b!1057930 res!706554) b!1057935))

(assert (= (and b!1057935 (not res!706545)) b!1057931))

(assert (= (and b!1057930 (not res!706553)) b!1057934))

(assert (= (and b!1057934 (not res!706550)) b!1057937))

(assert (= (and b!1057937 (not res!706546)) b!1057940))

(assert (= (and b!1057940 res!706549) b!1057929))

(declare-fun m!977587 () Bool)

(assert (=> b!1057936 m!977587))

(declare-fun m!977589 () Bool)

(assert (=> b!1057931 m!977589))

(declare-fun m!977591 () Bool)

(assert (=> b!1057929 m!977591))

(declare-fun m!977593 () Bool)

(assert (=> b!1057939 m!977593))

(declare-fun m!977595 () Bool)

(assert (=> b!1057939 m!977595))

(declare-fun m!977597 () Bool)

(assert (=> start!93368 m!977597))

(declare-fun m!977599 () Bool)

(assert (=> b!1057940 m!977599))

(declare-fun m!977601 () Bool)

(assert (=> b!1057932 m!977601))

(declare-fun m!977603 () Bool)

(assert (=> b!1057937 m!977603))

(declare-fun m!977605 () Bool)

(assert (=> b!1057938 m!977605))

(assert (=> b!1057930 m!977595))

(declare-fun m!977607 () Bool)

(assert (=> b!1057930 m!977607))

(declare-fun m!977609 () Bool)

(assert (=> b!1057934 m!977609))

(declare-fun m!977611 () Bool)

(assert (=> b!1057934 m!977611))

(declare-fun m!977613 () Bool)

(assert (=> b!1057934 m!977613))

(declare-fun m!977615 () Bool)

(assert (=> b!1057934 m!977615))

(declare-fun m!977617 () Bool)

(assert (=> b!1057933 m!977617))

(check-sat (not b!1057929) (not b!1057933) (not start!93368) (not b!1057934) (not b!1057931) (not b!1057936) (not b!1057937) (not b!1057932) (not b!1057939) (not b!1057940))
(check-sat)
(get-model)

(declare-fun d!128521 () Bool)

(declare-fun lt!466680 () (_ BitVec 32))

(assert (=> d!128521 (and (or (bvslt lt!466680 #b00000000000000000000000000000000) (bvsge lt!466680 (size!32617 lt!466661)) (and (bvsge lt!466680 #b00000000000000000000000000000000) (bvslt lt!466680 (size!32617 lt!466661)))) (bvsge lt!466680 #b00000000000000000000000000000000) (bvslt lt!466680 (size!32617 lt!466661)) (= (select (arr!32081 lt!466661) lt!466680) k0!2747))))

(declare-fun e!601801 () (_ BitVec 32))

(assert (=> d!128521 (= lt!466680 e!601801)))

(declare-fun c!107154 () Bool)

(assert (=> d!128521 (= c!107154 (= (select (arr!32081 lt!466661) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!128521 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32617 lt!466661)) (bvslt (size!32617 lt!466661) #b01111111111111111111111111111111))))

(assert (=> d!128521 (= (arrayScanForKey!0 lt!466661 k0!2747 #b00000000000000000000000000000000) lt!466680)))

(declare-fun b!1057981 () Bool)

(assert (=> b!1057981 (= e!601801 #b00000000000000000000000000000000)))

(declare-fun b!1057982 () Bool)

(assert (=> b!1057982 (= e!601801 (arrayScanForKey!0 lt!466661 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128521 c!107154) b!1057981))

(assert (= (and d!128521 (not c!107154)) b!1057982))

(declare-fun m!977651 () Bool)

(assert (=> d!128521 m!977651))

(declare-fun m!977653 () Bool)

(assert (=> d!128521 m!977653))

(declare-fun m!977655 () Bool)

(assert (=> b!1057982 m!977655))

(assert (=> b!1057936 d!128521))

(declare-fun d!128523 () Bool)

(declare-fun res!706597 () Bool)

(declare-fun e!601806 () Bool)

(assert (=> d!128523 (=> res!706597 e!601806)))

(assert (=> d!128523 (= res!706597 (= (select (arr!32081 a!3488) i!1381) k0!2747))))

(assert (=> d!128523 (= (arrayContainsKey!0 a!3488 k0!2747 i!1381) e!601806)))

(declare-fun b!1057987 () Bool)

(declare-fun e!601807 () Bool)

(assert (=> b!1057987 (= e!601806 e!601807)))

(declare-fun res!706598 () Bool)

(assert (=> b!1057987 (=> (not res!706598) (not e!601807))))

(assert (=> b!1057987 (= res!706598 (bvslt (bvadd i!1381 #b00000000000000000000000000000001) (size!32617 a!3488)))))

(declare-fun b!1057988 () Bool)

(assert (=> b!1057988 (= e!601807 (arrayContainsKey!0 a!3488 k0!2747 (bvadd i!1381 #b00000000000000000000000000000001)))))

(assert (= (and d!128523 (not res!706597)) b!1057987))

(assert (= (and b!1057987 res!706598) b!1057988))

(assert (=> d!128523 m!977605))

(declare-fun m!977657 () Bool)

(assert (=> b!1057988 m!977657))

(assert (=> b!1057931 d!128523))

(declare-fun b!1057999 () Bool)

(declare-fun e!601819 () Bool)

(declare-fun e!601817 () Bool)

(assert (=> b!1057999 (= e!601819 e!601817)))

(declare-fun c!107157 () Bool)

(assert (=> b!1057999 (= c!107157 (validKeyInArray!0 (select (arr!32081 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1058000 () Bool)

(declare-fun call!44863 () Bool)

(assert (=> b!1058000 (= e!601817 call!44863)))

(declare-fun b!1058001 () Bool)

(declare-fun e!601818 () Bool)

(assert (=> b!1058001 (= e!601818 e!601819)))

(declare-fun res!706606 () Bool)

(assert (=> b!1058001 (=> (not res!706606) (not e!601819))))

(declare-fun e!601816 () Bool)

(assert (=> b!1058001 (= res!706606 (not e!601816))))

(declare-fun res!706607 () Bool)

(assert (=> b!1058001 (=> (not res!706607) (not e!601816))))

(assert (=> b!1058001 (= res!706607 (validKeyInArray!0 (select (arr!32081 a!3488) #b00000000000000000000000000000000)))))

(declare-fun bm!44860 () Bool)

(assert (=> bm!44860 (= call!44863 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107157 (Cons!22389 (select (arr!32081 a!3488) #b00000000000000000000000000000000) Nil!22390) Nil!22390)))))

(declare-fun b!1058002 () Bool)

(assert (=> b!1058002 (= e!601816 (contains!6205 Nil!22390 (select (arr!32081 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1058003 () Bool)

(assert (=> b!1058003 (= e!601817 call!44863)))

(declare-fun d!128525 () Bool)

(declare-fun res!706605 () Bool)

(assert (=> d!128525 (=> res!706605 e!601818)))

(assert (=> d!128525 (= res!706605 (bvsge #b00000000000000000000000000000000 (size!32617 a!3488)))))

(assert (=> d!128525 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22390) e!601818)))

(assert (= (and d!128525 (not res!706605)) b!1058001))

(assert (= (and b!1058001 res!706607) b!1058002))

(assert (= (and b!1058001 res!706606) b!1057999))

(assert (= (and b!1057999 c!107157) b!1058000))

(assert (= (and b!1057999 (not c!107157)) b!1058003))

(assert (= (or b!1058000 b!1058003) bm!44860))

(declare-fun m!977659 () Bool)

(assert (=> b!1057999 m!977659))

(assert (=> b!1057999 m!977659))

(declare-fun m!977661 () Bool)

(assert (=> b!1057999 m!977661))

(assert (=> b!1058001 m!977659))

(assert (=> b!1058001 m!977659))

(assert (=> b!1058001 m!977661))

(assert (=> bm!44860 m!977659))

(declare-fun m!977663 () Bool)

(assert (=> bm!44860 m!977663))

(assert (=> b!1058002 m!977659))

(assert (=> b!1058002 m!977659))

(declare-fun m!977665 () Bool)

(assert (=> b!1058002 m!977665))

(assert (=> b!1057932 d!128525))

(declare-fun d!128527 () Bool)

(declare-fun res!706612 () Bool)

(declare-fun e!601824 () Bool)

(assert (=> d!128527 (=> res!706612 e!601824)))

(get-info :version)

(assert (=> d!128527 (= res!706612 ((_ is Nil!22390) Nil!22390))))

(assert (=> d!128527 (= (noDuplicate!1561 Nil!22390) e!601824)))

(declare-fun b!1058008 () Bool)

(declare-fun e!601825 () Bool)

(assert (=> b!1058008 (= e!601824 e!601825)))

(declare-fun res!706613 () Bool)

(assert (=> b!1058008 (=> (not res!706613) (not e!601825))))

(assert (=> b!1058008 (= res!706613 (not (contains!6205 (t!31700 Nil!22390) (h!23598 Nil!22390))))))

(declare-fun b!1058009 () Bool)

(assert (=> b!1058009 (= e!601825 (noDuplicate!1561 (t!31700 Nil!22390)))))

(assert (= (and d!128527 (not res!706612)) b!1058008))

(assert (= (and b!1058008 res!706613) b!1058009))

(declare-fun m!977667 () Bool)

(assert (=> b!1058008 m!977667))

(declare-fun m!977669 () Bool)

(assert (=> b!1058009 m!977669))

(assert (=> b!1057937 d!128527))

(declare-fun d!128533 () Bool)

(declare-fun res!706614 () Bool)

(declare-fun e!601826 () Bool)

(assert (=> d!128533 (=> res!706614 e!601826)))

(assert (=> d!128533 (= res!706614 (= (select (arr!32081 lt!466661) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!128533 (= (arrayContainsKey!0 lt!466661 k0!2747 #b00000000000000000000000000000000) e!601826)))

(declare-fun b!1058010 () Bool)

(declare-fun e!601827 () Bool)

(assert (=> b!1058010 (= e!601826 e!601827)))

(declare-fun res!706615 () Bool)

(assert (=> b!1058010 (=> (not res!706615) (not e!601827))))

(assert (=> b!1058010 (= res!706615 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32617 lt!466661)))))

(declare-fun b!1058011 () Bool)

(assert (=> b!1058011 (= e!601827 (arrayContainsKey!0 lt!466661 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128533 (not res!706614)) b!1058010))

(assert (= (and b!1058010 res!706615) b!1058011))

(assert (=> d!128533 m!977653))

(declare-fun m!977671 () Bool)

(assert (=> b!1058011 m!977671))

(assert (=> b!1057939 d!128533))

(declare-fun d!128535 () Bool)

(assert (=> d!128535 (= (array_inv!24861 a!3488) (bvsge (size!32617 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!93368 d!128535))

(declare-fun d!128537 () Bool)

(assert (=> d!128537 (= (validKeyInArray!0 k0!2747) (and (not (= k0!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1057933 d!128537))

(declare-fun d!128539 () Bool)

(declare-fun lt!466686 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!531 (List!22393) (InoxSet (_ BitVec 64)))

(assert (=> d!128539 (= lt!466686 (select (content!531 Nil!22390) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!601836 () Bool)

(assert (=> d!128539 (= lt!466686 e!601836)))

(declare-fun res!706620 () Bool)

(assert (=> d!128539 (=> (not res!706620) (not e!601836))))

(assert (=> d!128539 (= res!706620 ((_ is Cons!22389) Nil!22390))))

(assert (=> d!128539 (= (contains!6205 Nil!22390 #b0000000000000000000000000000000000000000000000000000000000000000) lt!466686)))

(declare-fun b!1058022 () Bool)

(declare-fun e!601835 () Bool)

(assert (=> b!1058022 (= e!601836 e!601835)))

(declare-fun res!706621 () Bool)

(assert (=> b!1058022 (=> res!706621 e!601835)))

(assert (=> b!1058022 (= res!706621 (= (h!23598 Nil!22390) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1058023 () Bool)

(assert (=> b!1058023 (= e!601835 (contains!6205 (t!31700 Nil!22390) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!128539 res!706620) b!1058022))

(assert (= (and b!1058022 (not res!706621)) b!1058023))

(declare-fun m!977679 () Bool)

(assert (=> d!128539 m!977679))

(declare-fun m!977681 () Bool)

(assert (=> d!128539 m!977681))

(declare-fun m!977683 () Bool)

(assert (=> b!1058023 m!977683))

(assert (=> b!1057940 d!128539))

(declare-fun d!128543 () Bool)

(declare-fun res!706622 () Bool)

(declare-fun e!601837 () Bool)

(assert (=> d!128543 (=> res!706622 e!601837)))

(assert (=> d!128543 (= res!706622 (= (select (arr!32081 a!3488) lt!466658) k0!2747))))

(assert (=> d!128543 (= (arrayContainsKey!0 a!3488 k0!2747 lt!466658) e!601837)))

(declare-fun b!1058024 () Bool)

(declare-fun e!601838 () Bool)

(assert (=> b!1058024 (= e!601837 e!601838)))

(declare-fun res!706623 () Bool)

(assert (=> b!1058024 (=> (not res!706623) (not e!601838))))

(assert (=> b!1058024 (= res!706623 (bvslt (bvadd lt!466658 #b00000000000000000000000000000001) (size!32617 a!3488)))))

(declare-fun b!1058025 () Bool)

(assert (=> b!1058025 (= e!601838 (arrayContainsKey!0 a!3488 k0!2747 (bvadd lt!466658 #b00000000000000000000000000000001)))))

(assert (= (and d!128543 (not res!706622)) b!1058024))

(assert (= (and b!1058024 res!706623) b!1058025))

(declare-fun m!977685 () Bool)

(assert (=> d!128543 m!977685))

(declare-fun m!977687 () Bool)

(assert (=> b!1058025 m!977687))

(assert (=> b!1057934 d!128543))

(declare-fun d!128547 () Bool)

(assert (=> d!128547 (arrayContainsKey!0 a!3488 k0!2747 lt!466658)))

(declare-fun lt!466689 () Unit!34684)

(declare-fun choose!114 (array!66722 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34684)

(assert (=> d!128547 (= lt!466689 (choose!114 a!3488 k0!2747 i!1381 lt!466658))))

(assert (=> d!128547 (bvsge i!1381 #b00000000000000000000000000000000)))

(assert (=> d!128547 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!466658) lt!466689)))

(declare-fun bs!31027 () Bool)

(assert (= bs!31027 d!128547))

(assert (=> bs!31027 m!977609))

(declare-fun m!977689 () Bool)

(assert (=> bs!31027 m!977689))

(assert (=> b!1057934 d!128547))

(declare-fun b!1058026 () Bool)

(declare-fun e!601842 () Bool)

(declare-fun e!601840 () Bool)

(assert (=> b!1058026 (= e!601842 e!601840)))

(declare-fun c!107161 () Bool)

(assert (=> b!1058026 (= c!107161 (validKeyInArray!0 (select (arr!32081 a!3488) lt!466659)))))

(declare-fun b!1058027 () Bool)

(declare-fun call!44864 () Bool)

(assert (=> b!1058027 (= e!601840 call!44864)))

(declare-fun b!1058028 () Bool)

(declare-fun e!601841 () Bool)

(assert (=> b!1058028 (= e!601841 e!601842)))

(declare-fun res!706625 () Bool)

(assert (=> b!1058028 (=> (not res!706625) (not e!601842))))

(declare-fun e!601839 () Bool)

(assert (=> b!1058028 (= res!706625 (not e!601839))))

(declare-fun res!706626 () Bool)

(assert (=> b!1058028 (=> (not res!706626) (not e!601839))))

(assert (=> b!1058028 (= res!706626 (validKeyInArray!0 (select (arr!32081 a!3488) lt!466659)))))

(declare-fun bm!44861 () Bool)

(assert (=> bm!44861 (= call!44864 (arrayNoDuplicates!0 a!3488 (bvadd lt!466659 #b00000000000000000000000000000001) (ite c!107161 (Cons!22389 (select (arr!32081 a!3488) lt!466659) Nil!22390) Nil!22390)))))

(declare-fun b!1058029 () Bool)

(assert (=> b!1058029 (= e!601839 (contains!6205 Nil!22390 (select (arr!32081 a!3488) lt!466659)))))

(declare-fun b!1058030 () Bool)

(assert (=> b!1058030 (= e!601840 call!44864)))

(declare-fun d!128553 () Bool)

(declare-fun res!706624 () Bool)

(assert (=> d!128553 (=> res!706624 e!601841)))

(assert (=> d!128553 (= res!706624 (bvsge lt!466659 (size!32617 a!3488)))))

(assert (=> d!128553 (= (arrayNoDuplicates!0 a!3488 lt!466659 Nil!22390) e!601841)))

(assert (= (and d!128553 (not res!706624)) b!1058028))

(assert (= (and b!1058028 res!706626) b!1058029))

(assert (= (and b!1058028 res!706625) b!1058026))

(assert (= (and b!1058026 c!107161) b!1058027))

(assert (= (and b!1058026 (not c!107161)) b!1058030))

(assert (= (or b!1058027 b!1058030) bm!44861))

(declare-fun m!977691 () Bool)

(assert (=> b!1058026 m!977691))

(assert (=> b!1058026 m!977691))

(declare-fun m!977693 () Bool)

(assert (=> b!1058026 m!977693))

(assert (=> b!1058028 m!977691))

(assert (=> b!1058028 m!977691))

(assert (=> b!1058028 m!977693))

(assert (=> bm!44861 m!977691))

(declare-fun m!977695 () Bool)

(assert (=> bm!44861 m!977695))

(assert (=> b!1058029 m!977691))

(assert (=> b!1058029 m!977691))

(declare-fun m!977697 () Bool)

(assert (=> b!1058029 m!977697))

(assert (=> b!1057934 d!128553))

(declare-fun d!128555 () Bool)

(assert (=> d!128555 (arrayNoDuplicates!0 a!3488 lt!466659 Nil!22390)))

(declare-fun lt!466698 () Unit!34684)

(declare-fun choose!39 (array!66722 (_ BitVec 32) (_ BitVec 32)) Unit!34684)

(assert (=> d!128555 (= lt!466698 (choose!39 a!3488 #b00000000000000000000000000000000 lt!466659))))

(assert (=> d!128555 (bvslt (size!32617 a!3488) #b01111111111111111111111111111111)))

(assert (=> d!128555 (= (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466659) lt!466698)))

(declare-fun bs!31028 () Bool)

(assert (= bs!31028 d!128555))

(assert (=> bs!31028 m!977613))

(declare-fun m!977711 () Bool)

(assert (=> bs!31028 m!977711))

(assert (=> b!1057934 d!128555))

(declare-fun d!128561 () Bool)

(declare-fun lt!466699 () Bool)

(assert (=> d!128561 (= lt!466699 (select (content!531 Nil!22390) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!601864 () Bool)

(assert (=> d!128561 (= lt!466699 e!601864)))

(declare-fun res!706647 () Bool)

(assert (=> d!128561 (=> (not res!706647) (not e!601864))))

(assert (=> d!128561 (= res!706647 ((_ is Cons!22389) Nil!22390))))

(assert (=> d!128561 (= (contains!6205 Nil!22390 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466699)))

(declare-fun b!1058051 () Bool)

(declare-fun e!601863 () Bool)

(assert (=> b!1058051 (= e!601864 e!601863)))

(declare-fun res!706648 () Bool)

(assert (=> b!1058051 (=> res!706648 e!601863)))

(assert (=> b!1058051 (= res!706648 (= (h!23598 Nil!22390) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1058052 () Bool)

(assert (=> b!1058052 (= e!601863 (contains!6205 (t!31700 Nil!22390) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!128561 res!706647) b!1058051))

(assert (= (and b!1058051 (not res!706648)) b!1058052))

(assert (=> d!128561 m!977679))

(declare-fun m!977713 () Bool)

(assert (=> d!128561 m!977713))

(declare-fun m!977715 () Bool)

(assert (=> b!1058052 m!977715))

(assert (=> b!1057929 d!128561))

(check-sat (not b!1058052) (not b!1058026) (not bm!44861) (not d!128561) (not d!128547) (not b!1058002) (not b!1058008) (not b!1058023) (not b!1058011) (not b!1057999) (not b!1057982) (not d!128555) (not b!1058029) (not b!1057988) (not b!1058001) (not bm!44860) (not d!128539) (not b!1058009) (not b!1058025) (not b!1058028))
(check-sat)
