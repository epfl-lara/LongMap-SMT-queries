; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127726 () Bool)

(assert start!127726)

(declare-fun b!1499607 () Bool)

(declare-fun res!1019602 () Bool)

(declare-fun e!839843 () Bool)

(assert (=> b!1499607 (=> (not res!1019602) (not e!839843))))

(declare-datatypes ((List!34729 0))(
  ( (Nil!34726) (Cons!34725 (h!36137 (_ BitVec 64)) (t!49415 List!34729)) )
))
(declare-fun noDuplicate!2638 (List!34729) Bool)

(assert (=> b!1499607 (= res!1019602 (noDuplicate!2638 Nil!34726))))

(declare-fun b!1499608 () Bool)

(declare-fun res!1019604 () Bool)

(assert (=> b!1499608 (=> (not res!1019604) (not e!839843))))

(declare-datatypes ((array!99985 0))(
  ( (array!99986 (arr!48250 (Array (_ BitVec 32) (_ BitVec 64))) (size!48801 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99985)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99985 (_ BitVec 32)) Bool)

(assert (=> b!1499608 (= res!1019604 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1499610 () Bool)

(declare-fun e!839844 () Bool)

(assert (=> b!1499610 (= e!839843 e!839844)))

(declare-fun res!1019609 () Bool)

(assert (=> b!1499610 (=> res!1019609 e!839844)))

(declare-fun contains!9985 (List!34729 (_ BitVec 64)) Bool)

(assert (=> b!1499610 (= res!1019609 (contains!9985 Nil!34726 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1499611 () Bool)

(assert (=> b!1499611 (= e!839844 (contains!9985 Nil!34726 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1499612 () Bool)

(declare-fun res!1019606 () Bool)

(assert (=> b!1499612 (=> (not res!1019606) (not e!839843))))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1499612 (= res!1019606 (validKeyInArray!0 (select (arr!48250 a!2850) j!87)))))

(declare-fun b!1499613 () Bool)

(declare-fun res!1019605 () Bool)

(assert (=> b!1499613 (=> (not res!1019605) (not e!839843))))

(assert (=> b!1499613 (= res!1019605 (and (bvsle #b00000000000000000000000000000000 (size!48801 a!2850)) (bvslt (size!48801 a!2850) #b01111111111111111111111111111111)))))

(declare-fun b!1499614 () Bool)

(declare-fun res!1019603 () Bool)

(assert (=> b!1499614 (=> (not res!1019603) (not e!839843))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1499614 (= res!1019603 (and (= (size!48801 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48801 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48801 a!2850)) (not (= i!996 j!87))))))

(declare-fun res!1019607 () Bool)

(assert (=> start!127726 (=> (not res!1019607) (not e!839843))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127726 (= res!1019607 (validMask!0 mask!2661))))

(assert (=> start!127726 e!839843))

(assert (=> start!127726 true))

(declare-fun array_inv!37531 (array!99985) Bool)

(assert (=> start!127726 (array_inv!37531 a!2850)))

(declare-fun b!1499609 () Bool)

(declare-fun res!1019608 () Bool)

(assert (=> b!1499609 (=> (not res!1019608) (not e!839843))))

(assert (=> b!1499609 (= res!1019608 (validKeyInArray!0 (select (arr!48250 a!2850) i!996)))))

(assert (= (and start!127726 res!1019607) b!1499614))

(assert (= (and b!1499614 res!1019603) b!1499609))

(assert (= (and b!1499609 res!1019608) b!1499612))

(assert (= (and b!1499612 res!1019606) b!1499608))

(assert (= (and b!1499608 res!1019604) b!1499613))

(assert (= (and b!1499613 res!1019605) b!1499607))

(assert (= (and b!1499607 res!1019602) b!1499610))

(assert (= (and b!1499610 (not res!1019609)) b!1499611))

(declare-fun m!1382693 () Bool)

(assert (=> b!1499608 m!1382693))

(declare-fun m!1382695 () Bool)

(assert (=> b!1499612 m!1382695))

(assert (=> b!1499612 m!1382695))

(declare-fun m!1382697 () Bool)

(assert (=> b!1499612 m!1382697))

(declare-fun m!1382699 () Bool)

(assert (=> b!1499610 m!1382699))

(declare-fun m!1382701 () Bool)

(assert (=> start!127726 m!1382701))

(declare-fun m!1382703 () Bool)

(assert (=> start!127726 m!1382703))

(declare-fun m!1382705 () Bool)

(assert (=> b!1499607 m!1382705))

(declare-fun m!1382707 () Bool)

(assert (=> b!1499609 m!1382707))

(assert (=> b!1499609 m!1382707))

(declare-fun m!1382709 () Bool)

(assert (=> b!1499609 m!1382709))

(declare-fun m!1382711 () Bool)

(assert (=> b!1499611 m!1382711))

(check-sat (not start!127726) (not b!1499609) (not b!1499611) (not b!1499612) (not b!1499608) (not b!1499607) (not b!1499610))
(check-sat)
(get-model)

(declare-fun d!157975 () Bool)

(assert (=> d!157975 (= (validKeyInArray!0 (select (arr!48250 a!2850) i!996)) (and (not (= (select (arr!48250 a!2850) i!996) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48250 a!2850) i!996) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1499609 d!157975))

(declare-fun d!157977 () Bool)

(declare-fun lt!653201 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!771 (List!34729) (InoxSet (_ BitVec 64)))

(assert (=> d!157977 (= lt!653201 (select (content!771 Nil!34726) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!839871 () Bool)

(assert (=> d!157977 (= lt!653201 e!839871)))

(declare-fun res!1019667 () Bool)

(assert (=> d!157977 (=> (not res!1019667) (not e!839871))))

(get-info :version)

(assert (=> d!157977 (= res!1019667 ((_ is Cons!34725) Nil!34726))))

(assert (=> d!157977 (= (contains!9985 Nil!34726 #b0000000000000000000000000000000000000000000000000000000000000000) lt!653201)))

(declare-fun b!1499669 () Bool)

(declare-fun e!839872 () Bool)

(assert (=> b!1499669 (= e!839871 e!839872)))

(declare-fun res!1019666 () Bool)

(assert (=> b!1499669 (=> res!1019666 e!839872)))

(assert (=> b!1499669 (= res!1019666 (= (h!36137 Nil!34726) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1499670 () Bool)

(assert (=> b!1499670 (= e!839872 (contains!9985 (t!49415 Nil!34726) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!157977 res!1019667) b!1499669))

(assert (= (and b!1499669 (not res!1019666)) b!1499670))

(declare-fun m!1382753 () Bool)

(assert (=> d!157977 m!1382753))

(declare-fun m!1382755 () Bool)

(assert (=> d!157977 m!1382755))

(declare-fun m!1382757 () Bool)

(assert (=> b!1499670 m!1382757))

(assert (=> b!1499610 d!157977))

(declare-fun d!157981 () Bool)

(assert (=> d!157981 (= (validMask!0 mask!2661) (and (or (= mask!2661 #b00000000000000000000000000000111) (= mask!2661 #b00000000000000000000000000001111) (= mask!2661 #b00000000000000000000000000011111) (= mask!2661 #b00000000000000000000000000111111) (= mask!2661 #b00000000000000000000000001111111) (= mask!2661 #b00000000000000000000000011111111) (= mask!2661 #b00000000000000000000000111111111) (= mask!2661 #b00000000000000000000001111111111) (= mask!2661 #b00000000000000000000011111111111) (= mask!2661 #b00000000000000000000111111111111) (= mask!2661 #b00000000000000000001111111111111) (= mask!2661 #b00000000000000000011111111111111) (= mask!2661 #b00000000000000000111111111111111) (= mask!2661 #b00000000000000001111111111111111) (= mask!2661 #b00000000000000011111111111111111) (= mask!2661 #b00000000000000111111111111111111) (= mask!2661 #b00000000000001111111111111111111) (= mask!2661 #b00000000000011111111111111111111) (= mask!2661 #b00000000000111111111111111111111) (= mask!2661 #b00000000001111111111111111111111) (= mask!2661 #b00000000011111111111111111111111) (= mask!2661 #b00000000111111111111111111111111) (= mask!2661 #b00000001111111111111111111111111) (= mask!2661 #b00000011111111111111111111111111) (= mask!2661 #b00000111111111111111111111111111) (= mask!2661 #b00001111111111111111111111111111) (= mask!2661 #b00011111111111111111111111111111) (= mask!2661 #b00111111111111111111111111111111)) (bvsle mask!2661 #b00111111111111111111111111111111)))))

(assert (=> start!127726 d!157981))

(declare-fun d!157993 () Bool)

(assert (=> d!157993 (= (array_inv!37531 a!2850) (bvsge (size!48801 a!2850) #b00000000000000000000000000000000))))

(assert (=> start!127726 d!157993))

(declare-fun d!157995 () Bool)

(declare-fun lt!653203 () Bool)

(assert (=> d!157995 (= lt!653203 (select (content!771 Nil!34726) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!839887 () Bool)

(assert (=> d!157995 (= lt!653203 e!839887)))

(declare-fun res!1019683 () Bool)

(assert (=> d!157995 (=> (not res!1019683) (not e!839887))))

(assert (=> d!157995 (= res!1019683 ((_ is Cons!34725) Nil!34726))))

(assert (=> d!157995 (= (contains!9985 Nil!34726 #b1000000000000000000000000000000000000000000000000000000000000000) lt!653203)))

(declare-fun b!1499687 () Bool)

(declare-fun e!839888 () Bool)

(assert (=> b!1499687 (= e!839887 e!839888)))

(declare-fun res!1019682 () Bool)

(assert (=> b!1499687 (=> res!1019682 e!839888)))

(assert (=> b!1499687 (= res!1019682 (= (h!36137 Nil!34726) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1499688 () Bool)

(assert (=> b!1499688 (= e!839888 (contains!9985 (t!49415 Nil!34726) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!157995 res!1019683) b!1499687))

(assert (= (and b!1499687 (not res!1019682)) b!1499688))

(assert (=> d!157995 m!1382753))

(declare-fun m!1382773 () Bool)

(assert (=> d!157995 m!1382773))

(declare-fun m!1382775 () Bool)

(assert (=> b!1499688 m!1382775))

(assert (=> b!1499611 d!157995))

(declare-fun d!157997 () Bool)

(assert (=> d!157997 (= (validKeyInArray!0 (select (arr!48250 a!2850) j!87)) (and (not (= (select (arr!48250 a!2850) j!87) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48250 a!2850) j!87) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1499612 d!157997))

(declare-fun d!157999 () Bool)

(declare-fun res!1019692 () Bool)

(declare-fun e!839897 () Bool)

(assert (=> d!157999 (=> res!1019692 e!839897)))

(assert (=> d!157999 (= res!1019692 ((_ is Nil!34726) Nil!34726))))

(assert (=> d!157999 (= (noDuplicate!2638 Nil!34726) e!839897)))

(declare-fun b!1499697 () Bool)

(declare-fun e!839898 () Bool)

(assert (=> b!1499697 (= e!839897 e!839898)))

(declare-fun res!1019693 () Bool)

(assert (=> b!1499697 (=> (not res!1019693) (not e!839898))))

(assert (=> b!1499697 (= res!1019693 (not (contains!9985 (t!49415 Nil!34726) (h!36137 Nil!34726))))))

(declare-fun b!1499698 () Bool)

(assert (=> b!1499698 (= e!839898 (noDuplicate!2638 (t!49415 Nil!34726)))))

(assert (= (and d!157999 (not res!1019692)) b!1499697))

(assert (= (and b!1499697 res!1019693) b!1499698))

(declare-fun m!1382777 () Bool)

(assert (=> b!1499697 m!1382777))

(declare-fun m!1382779 () Bool)

(assert (=> b!1499698 m!1382779))

(assert (=> b!1499607 d!157999))

(declare-fun bm!68150 () Bool)

(declare-fun call!68153 () Bool)

(assert (=> bm!68150 (= call!68153 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2850 mask!2661))))

(declare-fun b!1499717 () Bool)

(declare-fun e!839915 () Bool)

(assert (=> b!1499717 (= e!839915 call!68153)))

(declare-fun b!1499718 () Bool)

(declare-fun e!839913 () Bool)

(assert (=> b!1499718 (= e!839913 e!839915)))

(declare-fun lt!653220 () (_ BitVec 64))

(assert (=> b!1499718 (= lt!653220 (select (arr!48250 a!2850) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50129 0))(
  ( (Unit!50130) )
))
(declare-fun lt!653219 () Unit!50129)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99985 (_ BitVec 64) (_ BitVec 32)) Unit!50129)

(assert (=> b!1499718 (= lt!653219 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2850 lt!653220 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!99985 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1499718 (arrayContainsKey!0 a!2850 lt!653220 #b00000000000000000000000000000000)))

(declare-fun lt!653221 () Unit!50129)

(assert (=> b!1499718 (= lt!653221 lt!653219)))

(declare-fun res!1019704 () Bool)

(declare-datatypes ((SeekEntryResult!12378 0))(
  ( (MissingZero!12378 (index!51904 (_ BitVec 32))) (Found!12378 (index!51905 (_ BitVec 32))) (Intermediate!12378 (undefined!13190 Bool) (index!51906 (_ BitVec 32)) (x!133734 (_ BitVec 32))) (Undefined!12378) (MissingVacant!12378 (index!51907 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99985 (_ BitVec 32)) SeekEntryResult!12378)

(assert (=> b!1499718 (= res!1019704 (= (seekEntryOrOpen!0 (select (arr!48250 a!2850) #b00000000000000000000000000000000) a!2850 mask!2661) (Found!12378 #b00000000000000000000000000000000)))))

(assert (=> b!1499718 (=> (not res!1019704) (not e!839915))))

(declare-fun b!1499719 () Bool)

(assert (=> b!1499719 (= e!839913 call!68153)))

(declare-fun d!158001 () Bool)

(declare-fun res!1019705 () Bool)

(declare-fun e!839914 () Bool)

(assert (=> d!158001 (=> res!1019705 e!839914)))

(assert (=> d!158001 (= res!1019705 (bvsge #b00000000000000000000000000000000 (size!48801 a!2850)))))

(assert (=> d!158001 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661) e!839914)))

(declare-fun b!1499720 () Bool)

(assert (=> b!1499720 (= e!839914 e!839913)))

(declare-fun c!139551 () Bool)

(assert (=> b!1499720 (= c!139551 (validKeyInArray!0 (select (arr!48250 a!2850) #b00000000000000000000000000000000)))))

(assert (= (and d!158001 (not res!1019705)) b!1499720))

(assert (= (and b!1499720 c!139551) b!1499718))

(assert (= (and b!1499720 (not c!139551)) b!1499719))

(assert (= (and b!1499718 res!1019704) b!1499717))

(assert (= (or b!1499717 b!1499719) bm!68150))

(declare-fun m!1382787 () Bool)

(assert (=> bm!68150 m!1382787))

(declare-fun m!1382789 () Bool)

(assert (=> b!1499718 m!1382789))

(declare-fun m!1382791 () Bool)

(assert (=> b!1499718 m!1382791))

(declare-fun m!1382793 () Bool)

(assert (=> b!1499718 m!1382793))

(assert (=> b!1499718 m!1382789))

(declare-fun m!1382795 () Bool)

(assert (=> b!1499718 m!1382795))

(assert (=> b!1499720 m!1382789))

(assert (=> b!1499720 m!1382789))

(declare-fun m!1382797 () Bool)

(assert (=> b!1499720 m!1382797))

(assert (=> b!1499608 d!158001))

(check-sat (not b!1499718) (not d!157995) (not b!1499670) (not bm!68150) (not b!1499698) (not d!157977) (not b!1499720) (not b!1499697) (not b!1499688))
(check-sat)
