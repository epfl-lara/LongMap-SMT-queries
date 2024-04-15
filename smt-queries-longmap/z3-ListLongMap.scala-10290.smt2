; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120896 () Bool)

(assert start!120896)

(declare-fun b!1406666 () Bool)

(declare-fun res!944937 () Bool)

(declare-fun e!796157 () Bool)

(assert (=> b!1406666 (=> res!944937 e!796157)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96156 0))(
  ( (array!96157 (arr!46426 (Array (_ BitVec 32) (_ BitVec 64))) (size!46978 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96156)

(declare-datatypes ((SeekEntryResult!10763 0))(
  ( (MissingZero!10763 (index!45429 (_ BitVec 32))) (Found!10763 (index!45430 (_ BitVec 32))) (Intermediate!10763 (undefined!11575 Bool) (index!45431 (_ BitVec 32)) (x!127023 (_ BitVec 32))) (Undefined!10763) (MissingVacant!10763 (index!45432 (_ BitVec 32))) )
))
(declare-fun lt!619306 () SeekEntryResult!10763)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96156 (_ BitVec 32)) SeekEntryResult!10763)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1406666 (= res!944937 (not (= lt!619306 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46426 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46426 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96157 (store (arr!46426 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46978 a!2901)) mask!2840))))))

(declare-fun b!1406667 () Bool)

(declare-fun e!796154 () Bool)

(assert (=> b!1406667 (= e!796154 (not e!796157))))

(declare-fun res!944941 () Bool)

(assert (=> b!1406667 (=> res!944941 e!796157)))

(get-info :version)

(assert (=> b!1406667 (= res!944941 (or (not ((_ is Intermediate!10763) lt!619306)) (undefined!11575 lt!619306)))))

(declare-fun e!796156 () Bool)

(assert (=> b!1406667 e!796156))

(declare-fun res!944940 () Bool)

(assert (=> b!1406667 (=> (not res!944940) (not e!796156))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96156 (_ BitVec 32)) Bool)

(assert (=> b!1406667 (= res!944940 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47343 0))(
  ( (Unit!47344) )
))
(declare-fun lt!619307 () Unit!47343)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96156 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47343)

(assert (=> b!1406667 (= lt!619307 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1406667 (= lt!619306 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46426 a!2901) j!112) mask!2840) (select (arr!46426 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1406668 () Bool)

(declare-fun res!944933 () Bool)

(assert (=> b!1406668 (=> (not res!944933) (not e!796154))))

(declare-datatypes ((List!33023 0))(
  ( (Nil!33020) (Cons!33019 (h!34273 (_ BitVec 64)) (t!47709 List!33023)) )
))
(declare-fun arrayNoDuplicates!0 (array!96156 (_ BitVec 32) List!33023) Bool)

(assert (=> b!1406668 (= res!944933 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33020))))

(declare-fun b!1406669 () Bool)

(declare-fun res!944939 () Bool)

(assert (=> b!1406669 (=> (not res!944939) (not e!796154))))

(assert (=> b!1406669 (= res!944939 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1406670 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96156 (_ BitVec 32)) SeekEntryResult!10763)

(assert (=> b!1406670 (= e!796156 (= (seekEntryOrOpen!0 (select (arr!46426 a!2901) j!112) a!2901 mask!2840) (Found!10763 j!112)))))

(declare-fun b!1406671 () Bool)

(declare-fun res!944934 () Bool)

(assert (=> b!1406671 (=> (not res!944934) (not e!796154))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1406671 (= res!944934 (validKeyInArray!0 (select (arr!46426 a!2901) j!112)))))

(declare-fun b!1406672 () Bool)

(assert (=> b!1406672 (= e!796157 (and (bvsge (x!127023 lt!619306) #b00000000000000000000000000000000) (bvsle (x!127023 lt!619306) #b01111111111111111111111111111110)))))

(declare-fun b!1406673 () Bool)

(declare-fun res!944938 () Bool)

(assert (=> b!1406673 (=> (not res!944938) (not e!796154))))

(assert (=> b!1406673 (= res!944938 (validKeyInArray!0 (select (arr!46426 a!2901) i!1037)))))

(declare-fun res!944935 () Bool)

(assert (=> start!120896 (=> (not res!944935) (not e!796154))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120896 (= res!944935 (validMask!0 mask!2840))))

(assert (=> start!120896 e!796154))

(assert (=> start!120896 true))

(declare-fun array_inv!35659 (array!96156) Bool)

(assert (=> start!120896 (array_inv!35659 a!2901)))

(declare-fun b!1406665 () Bool)

(declare-fun res!944936 () Bool)

(assert (=> b!1406665 (=> (not res!944936) (not e!796154))))

(assert (=> b!1406665 (= res!944936 (and (= (size!46978 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46978 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46978 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!120896 res!944935) b!1406665))

(assert (= (and b!1406665 res!944936) b!1406673))

(assert (= (and b!1406673 res!944938) b!1406671))

(assert (= (and b!1406671 res!944934) b!1406669))

(assert (= (and b!1406669 res!944939) b!1406668))

(assert (= (and b!1406668 res!944933) b!1406667))

(assert (= (and b!1406667 res!944940) b!1406670))

(assert (= (and b!1406667 (not res!944941)) b!1406666))

(assert (= (and b!1406666 (not res!944937)) b!1406672))

(declare-fun m!1295479 () Bool)

(assert (=> b!1406667 m!1295479))

(declare-fun m!1295481 () Bool)

(assert (=> b!1406667 m!1295481))

(assert (=> b!1406667 m!1295479))

(declare-fun m!1295483 () Bool)

(assert (=> b!1406667 m!1295483))

(assert (=> b!1406667 m!1295481))

(assert (=> b!1406667 m!1295479))

(declare-fun m!1295485 () Bool)

(assert (=> b!1406667 m!1295485))

(declare-fun m!1295487 () Bool)

(assert (=> b!1406667 m!1295487))

(declare-fun m!1295489 () Bool)

(assert (=> b!1406669 m!1295489))

(declare-fun m!1295491 () Bool)

(assert (=> b!1406673 m!1295491))

(assert (=> b!1406673 m!1295491))

(declare-fun m!1295493 () Bool)

(assert (=> b!1406673 m!1295493))

(declare-fun m!1295495 () Bool)

(assert (=> b!1406666 m!1295495))

(declare-fun m!1295497 () Bool)

(assert (=> b!1406666 m!1295497))

(assert (=> b!1406666 m!1295497))

(declare-fun m!1295499 () Bool)

(assert (=> b!1406666 m!1295499))

(assert (=> b!1406666 m!1295499))

(assert (=> b!1406666 m!1295497))

(declare-fun m!1295501 () Bool)

(assert (=> b!1406666 m!1295501))

(declare-fun m!1295503 () Bool)

(assert (=> start!120896 m!1295503))

(declare-fun m!1295505 () Bool)

(assert (=> start!120896 m!1295505))

(declare-fun m!1295507 () Bool)

(assert (=> b!1406668 m!1295507))

(assert (=> b!1406671 m!1295479))

(assert (=> b!1406671 m!1295479))

(declare-fun m!1295509 () Bool)

(assert (=> b!1406671 m!1295509))

(assert (=> b!1406670 m!1295479))

(assert (=> b!1406670 m!1295479))

(declare-fun m!1295511 () Bool)

(assert (=> b!1406670 m!1295511))

(check-sat (not b!1406666) (not b!1406667) (not b!1406670) (not b!1406671) (not b!1406668) (not b!1406669) (not start!120896) (not b!1406673))
(check-sat)
(get-model)

(declare-fun bm!66929 () Bool)

(declare-fun call!66932 () Bool)

(assert (=> bm!66929 (= call!66932 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1406736 () Bool)

(declare-fun e!796190 () Bool)

(assert (=> b!1406736 (= e!796190 call!66932)))

(declare-fun d!151309 () Bool)

(declare-fun res!945001 () Bool)

(declare-fun e!796188 () Bool)

(assert (=> d!151309 (=> res!945001 e!796188)))

(assert (=> d!151309 (= res!945001 (bvsge #b00000000000000000000000000000000 (size!46978 a!2901)))))

(assert (=> d!151309 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!796188)))

(declare-fun b!1406737 () Bool)

(declare-fun e!796189 () Bool)

(assert (=> b!1406737 (= e!796190 e!796189)))

(declare-fun lt!619327 () (_ BitVec 64))

(assert (=> b!1406737 (= lt!619327 (select (arr!46426 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!619326 () Unit!47343)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96156 (_ BitVec 64) (_ BitVec 32)) Unit!47343)

(assert (=> b!1406737 (= lt!619326 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!619327 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96156 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1406737 (arrayContainsKey!0 a!2901 lt!619327 #b00000000000000000000000000000000)))

(declare-fun lt!619328 () Unit!47343)

(assert (=> b!1406737 (= lt!619328 lt!619326)))

(declare-fun res!945000 () Bool)

(assert (=> b!1406737 (= res!945000 (= (seekEntryOrOpen!0 (select (arr!46426 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10763 #b00000000000000000000000000000000)))))

(assert (=> b!1406737 (=> (not res!945000) (not e!796189))))

(declare-fun b!1406738 () Bool)

(assert (=> b!1406738 (= e!796189 call!66932)))

(declare-fun b!1406739 () Bool)

(assert (=> b!1406739 (= e!796188 e!796190)))

(declare-fun c!130333 () Bool)

(assert (=> b!1406739 (= c!130333 (validKeyInArray!0 (select (arr!46426 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!151309 (not res!945001)) b!1406739))

(assert (= (and b!1406739 c!130333) b!1406737))

(assert (= (and b!1406739 (not c!130333)) b!1406736))

(assert (= (and b!1406737 res!945000) b!1406738))

(assert (= (or b!1406738 b!1406736) bm!66929))

(declare-fun m!1295581 () Bool)

(assert (=> bm!66929 m!1295581))

(declare-fun m!1295583 () Bool)

(assert (=> b!1406737 m!1295583))

(declare-fun m!1295585 () Bool)

(assert (=> b!1406737 m!1295585))

(declare-fun m!1295587 () Bool)

(assert (=> b!1406737 m!1295587))

(assert (=> b!1406737 m!1295583))

(declare-fun m!1295589 () Bool)

(assert (=> b!1406737 m!1295589))

(assert (=> b!1406739 m!1295583))

(assert (=> b!1406739 m!1295583))

(declare-fun m!1295591 () Bool)

(assert (=> b!1406739 m!1295591))

(assert (=> b!1406669 d!151309))

(declare-fun b!1406750 () Bool)

(declare-fun e!796199 () Bool)

(declare-fun call!66935 () Bool)

(assert (=> b!1406750 (= e!796199 call!66935)))

(declare-fun b!1406751 () Bool)

(assert (=> b!1406751 (= e!796199 call!66935)))

(declare-fun d!151311 () Bool)

(declare-fun res!945008 () Bool)

(declare-fun e!796200 () Bool)

(assert (=> d!151311 (=> res!945008 e!796200)))

(assert (=> d!151311 (= res!945008 (bvsge #b00000000000000000000000000000000 (size!46978 a!2901)))))

(assert (=> d!151311 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33020) e!796200)))

(declare-fun bm!66932 () Bool)

(declare-fun c!130336 () Bool)

(assert (=> bm!66932 (= call!66935 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!130336 (Cons!33019 (select (arr!46426 a!2901) #b00000000000000000000000000000000) Nil!33020) Nil!33020)))))

(declare-fun b!1406752 () Bool)

(declare-fun e!796201 () Bool)

(declare-fun contains!9757 (List!33023 (_ BitVec 64)) Bool)

(assert (=> b!1406752 (= e!796201 (contains!9757 Nil!33020 (select (arr!46426 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1406753 () Bool)

(declare-fun e!796202 () Bool)

(assert (=> b!1406753 (= e!796200 e!796202)))

(declare-fun res!945009 () Bool)

(assert (=> b!1406753 (=> (not res!945009) (not e!796202))))

(assert (=> b!1406753 (= res!945009 (not e!796201))))

(declare-fun res!945010 () Bool)

(assert (=> b!1406753 (=> (not res!945010) (not e!796201))))

(assert (=> b!1406753 (= res!945010 (validKeyInArray!0 (select (arr!46426 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1406754 () Bool)

(assert (=> b!1406754 (= e!796202 e!796199)))

(assert (=> b!1406754 (= c!130336 (validKeyInArray!0 (select (arr!46426 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!151311 (not res!945008)) b!1406753))

(assert (= (and b!1406753 res!945010) b!1406752))

(assert (= (and b!1406753 res!945009) b!1406754))

(assert (= (and b!1406754 c!130336) b!1406751))

(assert (= (and b!1406754 (not c!130336)) b!1406750))

(assert (= (or b!1406751 b!1406750) bm!66932))

(assert (=> bm!66932 m!1295583))

(declare-fun m!1295593 () Bool)

(assert (=> bm!66932 m!1295593))

(assert (=> b!1406752 m!1295583))

(assert (=> b!1406752 m!1295583))

(declare-fun m!1295595 () Bool)

(assert (=> b!1406752 m!1295595))

(assert (=> b!1406753 m!1295583))

(assert (=> b!1406753 m!1295583))

(assert (=> b!1406753 m!1295591))

(assert (=> b!1406754 m!1295583))

(assert (=> b!1406754 m!1295583))

(assert (=> b!1406754 m!1295591))

(assert (=> b!1406668 d!151311))

(declare-fun d!151313 () Bool)

(assert (=> d!151313 (= (validKeyInArray!0 (select (arr!46426 a!2901) i!1037)) (and (not (= (select (arr!46426 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46426 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1406673 d!151313))

(declare-fun bm!66933 () Bool)

(declare-fun call!66936 () Bool)

(assert (=> bm!66933 (= call!66936 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1406755 () Bool)

(declare-fun e!796205 () Bool)

(assert (=> b!1406755 (= e!796205 call!66936)))

(declare-fun d!151315 () Bool)

(declare-fun res!945012 () Bool)

(declare-fun e!796203 () Bool)

(assert (=> d!151315 (=> res!945012 e!796203)))

(assert (=> d!151315 (= res!945012 (bvsge j!112 (size!46978 a!2901)))))

(assert (=> d!151315 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!796203)))

(declare-fun b!1406756 () Bool)

(declare-fun e!796204 () Bool)

(assert (=> b!1406756 (= e!796205 e!796204)))

(declare-fun lt!619330 () (_ BitVec 64))

(assert (=> b!1406756 (= lt!619330 (select (arr!46426 a!2901) j!112))))

(declare-fun lt!619329 () Unit!47343)

(assert (=> b!1406756 (= lt!619329 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!619330 j!112))))

(assert (=> b!1406756 (arrayContainsKey!0 a!2901 lt!619330 #b00000000000000000000000000000000)))

(declare-fun lt!619331 () Unit!47343)

(assert (=> b!1406756 (= lt!619331 lt!619329)))

(declare-fun res!945011 () Bool)

(assert (=> b!1406756 (= res!945011 (= (seekEntryOrOpen!0 (select (arr!46426 a!2901) j!112) a!2901 mask!2840) (Found!10763 j!112)))))

(assert (=> b!1406756 (=> (not res!945011) (not e!796204))))

(declare-fun b!1406757 () Bool)

(assert (=> b!1406757 (= e!796204 call!66936)))

(declare-fun b!1406758 () Bool)

(assert (=> b!1406758 (= e!796203 e!796205)))

(declare-fun c!130337 () Bool)

(assert (=> b!1406758 (= c!130337 (validKeyInArray!0 (select (arr!46426 a!2901) j!112)))))

(assert (= (and d!151315 (not res!945012)) b!1406758))

(assert (= (and b!1406758 c!130337) b!1406756))

(assert (= (and b!1406758 (not c!130337)) b!1406755))

(assert (= (and b!1406756 res!945011) b!1406757))

(assert (= (or b!1406757 b!1406755) bm!66933))

(declare-fun m!1295597 () Bool)

(assert (=> bm!66933 m!1295597))

(assert (=> b!1406756 m!1295479))

(declare-fun m!1295599 () Bool)

(assert (=> b!1406756 m!1295599))

(declare-fun m!1295601 () Bool)

(assert (=> b!1406756 m!1295601))

(assert (=> b!1406756 m!1295479))

(assert (=> b!1406756 m!1295511))

(assert (=> b!1406758 m!1295479))

(assert (=> b!1406758 m!1295479))

(assert (=> b!1406758 m!1295509))

(assert (=> b!1406667 d!151315))

(declare-fun d!151317 () Bool)

(assert (=> d!151317 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!619334 () Unit!47343)

(declare-fun choose!38 (array!96156 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47343)

(assert (=> d!151317 (= lt!619334 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!151317 (validMask!0 mask!2840)))

(assert (=> d!151317 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!619334)))

(declare-fun bs!40981 () Bool)

(assert (= bs!40981 d!151317))

(assert (=> bs!40981 m!1295487))

(declare-fun m!1295603 () Bool)

(assert (=> bs!40981 m!1295603))

(assert (=> bs!40981 m!1295503))

(assert (=> b!1406667 d!151317))

(declare-fun b!1406789 () Bool)

(declare-fun e!796227 () SeekEntryResult!10763)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1406789 (= e!796227 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46426 a!2901) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (arr!46426 a!2901) j!112) a!2901 mask!2840))))

(declare-fun e!796226 () SeekEntryResult!10763)

(declare-fun b!1406790 () Bool)

(assert (=> b!1406790 (= e!796226 (Intermediate!10763 true (toIndex!0 (select (arr!46426 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1406791 () Bool)

(declare-fun lt!619352 () SeekEntryResult!10763)

(assert (=> b!1406791 (and (bvsge (index!45431 lt!619352) #b00000000000000000000000000000000) (bvslt (index!45431 lt!619352) (size!46978 a!2901)))))

(declare-fun res!945026 () Bool)

(assert (=> b!1406791 (= res!945026 (= (select (arr!46426 a!2901) (index!45431 lt!619352)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!796225 () Bool)

(assert (=> b!1406791 (=> res!945026 e!796225)))

(declare-fun d!151319 () Bool)

(declare-fun e!796228 () Bool)

(assert (=> d!151319 e!796228))

(declare-fun c!130347 () Bool)

(assert (=> d!151319 (= c!130347 (and ((_ is Intermediate!10763) lt!619352) (undefined!11575 lt!619352)))))

(assert (=> d!151319 (= lt!619352 e!796226)))

(declare-fun c!130349 () Bool)

(assert (=> d!151319 (= c!130349 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!619351 () (_ BitVec 64))

(assert (=> d!151319 (= lt!619351 (select (arr!46426 a!2901) (toIndex!0 (select (arr!46426 a!2901) j!112) mask!2840)))))

(assert (=> d!151319 (validMask!0 mask!2840)))

(assert (=> d!151319 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46426 a!2901) j!112) mask!2840) (select (arr!46426 a!2901) j!112) a!2901 mask!2840) lt!619352)))

(declare-fun b!1406792 () Bool)

(assert (=> b!1406792 (and (bvsge (index!45431 lt!619352) #b00000000000000000000000000000000) (bvslt (index!45431 lt!619352) (size!46978 a!2901)))))

(declare-fun res!945025 () Bool)

(assert (=> b!1406792 (= res!945025 (= (select (arr!46426 a!2901) (index!45431 lt!619352)) (select (arr!46426 a!2901) j!112)))))

(assert (=> b!1406792 (=> res!945025 e!796225)))

(declare-fun e!796229 () Bool)

(assert (=> b!1406792 (= e!796229 e!796225)))

(declare-fun b!1406793 () Bool)

(assert (=> b!1406793 (= e!796227 (Intermediate!10763 false (toIndex!0 (select (arr!46426 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1406794 () Bool)

(assert (=> b!1406794 (= e!796228 (bvsge (x!127023 lt!619352) #b01111111111111111111111111111110))))

(declare-fun b!1406795 () Bool)

(assert (=> b!1406795 (= e!796228 e!796229)))

(declare-fun res!945027 () Bool)

(assert (=> b!1406795 (= res!945027 (and ((_ is Intermediate!10763) lt!619352) (not (undefined!11575 lt!619352)) (bvslt (x!127023 lt!619352) #b01111111111111111111111111111110) (bvsge (x!127023 lt!619352) #b00000000000000000000000000000000) (bvsge (x!127023 lt!619352) #b00000000000000000000000000000000)))))

(assert (=> b!1406795 (=> (not res!945027) (not e!796229))))

(declare-fun b!1406796 () Bool)

(assert (=> b!1406796 (and (bvsge (index!45431 lt!619352) #b00000000000000000000000000000000) (bvslt (index!45431 lt!619352) (size!46978 a!2901)))))

(assert (=> b!1406796 (= e!796225 (= (select (arr!46426 a!2901) (index!45431 lt!619352)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1406797 () Bool)

(assert (=> b!1406797 (= e!796226 e!796227)))

(declare-fun c!130348 () Bool)

(assert (=> b!1406797 (= c!130348 (or (= lt!619351 (select (arr!46426 a!2901) j!112)) (= (bvadd lt!619351 lt!619351) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!151319 c!130349) b!1406790))

(assert (= (and d!151319 (not c!130349)) b!1406797))

(assert (= (and b!1406797 c!130348) b!1406793))

(assert (= (and b!1406797 (not c!130348)) b!1406789))

(assert (= (and d!151319 c!130347) b!1406794))

(assert (= (and d!151319 (not c!130347)) b!1406795))

(assert (= (and b!1406795 res!945027) b!1406792))

(assert (= (and b!1406792 (not res!945025)) b!1406791))

(assert (= (and b!1406791 (not res!945026)) b!1406796))

(declare-fun m!1295613 () Bool)

(assert (=> b!1406796 m!1295613))

(assert (=> b!1406792 m!1295613))

(assert (=> b!1406789 m!1295481))

(declare-fun m!1295615 () Bool)

(assert (=> b!1406789 m!1295615))

(assert (=> b!1406789 m!1295615))

(assert (=> b!1406789 m!1295479))

(declare-fun m!1295617 () Bool)

(assert (=> b!1406789 m!1295617))

(assert (=> d!151319 m!1295481))

(declare-fun m!1295619 () Bool)

(assert (=> d!151319 m!1295619))

(assert (=> d!151319 m!1295503))

(assert (=> b!1406791 m!1295613))

(assert (=> b!1406667 d!151319))

(declare-fun d!151333 () Bool)

(declare-fun lt!619362 () (_ BitVec 32))

(declare-fun lt!619361 () (_ BitVec 32))

(assert (=> d!151333 (= lt!619362 (bvmul (bvxor lt!619361 (bvlshr lt!619361 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151333 (= lt!619361 ((_ extract 31 0) (bvand (bvxor (select (arr!46426 a!2901) j!112) (bvlshr (select (arr!46426 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151333 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!945028 (let ((h!34276 ((_ extract 31 0) (bvand (bvxor (select (arr!46426 a!2901) j!112) (bvlshr (select (arr!46426 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127027 (bvmul (bvxor h!34276 (bvlshr h!34276 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127027 (bvlshr x!127027 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!945028 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!945028 #b00000000000000000000000000000000))))))

(assert (=> d!151333 (= (toIndex!0 (select (arr!46426 a!2901) j!112) mask!2840) (bvand (bvxor lt!619362 (bvlshr lt!619362 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1406667 d!151333))

(declare-fun b!1406816 () Bool)

(declare-fun e!796242 () SeekEntryResult!10763)

(assert (=> b!1406816 (= e!796242 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!46426 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (store (arr!46426 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96157 (store (arr!46426 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46978 a!2901)) mask!2840))))

(declare-fun b!1406817 () Bool)

(declare-fun e!796241 () SeekEntryResult!10763)

(assert (=> b!1406817 (= e!796241 (Intermediate!10763 true (toIndex!0 (select (store (arr!46426 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1406818 () Bool)

(declare-fun lt!619364 () SeekEntryResult!10763)

(assert (=> b!1406818 (and (bvsge (index!45431 lt!619364) #b00000000000000000000000000000000) (bvslt (index!45431 lt!619364) (size!46978 (array!96157 (store (arr!46426 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46978 a!2901)))))))

(declare-fun res!945036 () Bool)

(assert (=> b!1406818 (= res!945036 (= (select (arr!46426 (array!96157 (store (arr!46426 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46978 a!2901))) (index!45431 lt!619364)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!796240 () Bool)

(assert (=> b!1406818 (=> res!945036 e!796240)))

(declare-fun d!151335 () Bool)

(declare-fun e!796243 () Bool)

(assert (=> d!151335 e!796243))

(declare-fun c!130356 () Bool)

(assert (=> d!151335 (= c!130356 (and ((_ is Intermediate!10763) lt!619364) (undefined!11575 lt!619364)))))

(assert (=> d!151335 (= lt!619364 e!796241)))

(declare-fun c!130358 () Bool)

(assert (=> d!151335 (= c!130358 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!619363 () (_ BitVec 64))

(assert (=> d!151335 (= lt!619363 (select (arr!46426 (array!96157 (store (arr!46426 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46978 a!2901))) (toIndex!0 (select (store (arr!46426 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840)))))

(assert (=> d!151335 (validMask!0 mask!2840)))

(assert (=> d!151335 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46426 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46426 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96157 (store (arr!46426 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46978 a!2901)) mask!2840) lt!619364)))

(declare-fun b!1406819 () Bool)

(assert (=> b!1406819 (and (bvsge (index!45431 lt!619364) #b00000000000000000000000000000000) (bvslt (index!45431 lt!619364) (size!46978 (array!96157 (store (arr!46426 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46978 a!2901)))))))

(declare-fun res!945035 () Bool)

(assert (=> b!1406819 (= res!945035 (= (select (arr!46426 (array!96157 (store (arr!46426 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46978 a!2901))) (index!45431 lt!619364)) (select (store (arr!46426 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(assert (=> b!1406819 (=> res!945035 e!796240)))

(declare-fun e!796244 () Bool)

(assert (=> b!1406819 (= e!796244 e!796240)))

(declare-fun b!1406820 () Bool)

(assert (=> b!1406820 (= e!796242 (Intermediate!10763 false (toIndex!0 (select (store (arr!46426 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1406821 () Bool)

(assert (=> b!1406821 (= e!796243 (bvsge (x!127023 lt!619364) #b01111111111111111111111111111110))))

(declare-fun b!1406822 () Bool)

(assert (=> b!1406822 (= e!796243 e!796244)))

(declare-fun res!945037 () Bool)

(assert (=> b!1406822 (= res!945037 (and ((_ is Intermediate!10763) lt!619364) (not (undefined!11575 lt!619364)) (bvslt (x!127023 lt!619364) #b01111111111111111111111111111110) (bvsge (x!127023 lt!619364) #b00000000000000000000000000000000) (bvsge (x!127023 lt!619364) #b00000000000000000000000000000000)))))

(assert (=> b!1406822 (=> (not res!945037) (not e!796244))))

(declare-fun b!1406823 () Bool)

(assert (=> b!1406823 (and (bvsge (index!45431 lt!619364) #b00000000000000000000000000000000) (bvslt (index!45431 lt!619364) (size!46978 (array!96157 (store (arr!46426 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46978 a!2901)))))))

(assert (=> b!1406823 (= e!796240 (= (select (arr!46426 (array!96157 (store (arr!46426 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46978 a!2901))) (index!45431 lt!619364)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1406824 () Bool)

(assert (=> b!1406824 (= e!796241 e!796242)))

(declare-fun c!130357 () Bool)

(assert (=> b!1406824 (= c!130357 (or (= lt!619363 (select (store (arr!46426 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)) (= (bvadd lt!619363 lt!619363) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!151335 c!130358) b!1406817))

(assert (= (and d!151335 (not c!130358)) b!1406824))

(assert (= (and b!1406824 c!130357) b!1406820))

(assert (= (and b!1406824 (not c!130357)) b!1406816))

(assert (= (and d!151335 c!130356) b!1406821))

(assert (= (and d!151335 (not c!130356)) b!1406822))

(assert (= (and b!1406822 res!945037) b!1406819))

(assert (= (and b!1406819 (not res!945035)) b!1406818))

(assert (= (and b!1406818 (not res!945036)) b!1406823))

(declare-fun m!1295621 () Bool)

(assert (=> b!1406823 m!1295621))

(assert (=> b!1406819 m!1295621))

(assert (=> b!1406816 m!1295499))

(declare-fun m!1295623 () Bool)

(assert (=> b!1406816 m!1295623))

(assert (=> b!1406816 m!1295623))

(assert (=> b!1406816 m!1295497))

(declare-fun m!1295625 () Bool)

(assert (=> b!1406816 m!1295625))

(assert (=> d!151335 m!1295499))

(declare-fun m!1295627 () Bool)

(assert (=> d!151335 m!1295627))

(assert (=> d!151335 m!1295503))

(assert (=> b!1406818 m!1295621))

(assert (=> b!1406666 d!151335))

(declare-fun d!151337 () Bool)

(declare-fun lt!619366 () (_ BitVec 32))

(declare-fun lt!619365 () (_ BitVec 32))

(assert (=> d!151337 (= lt!619366 (bvmul (bvxor lt!619365 (bvlshr lt!619365 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151337 (= lt!619365 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46426 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46426 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151337 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!945028 (let ((h!34276 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46426 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46426 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127027 (bvmul (bvxor h!34276 (bvlshr h!34276 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127027 (bvlshr x!127027 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!945028 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!945028 #b00000000000000000000000000000000))))))

(assert (=> d!151337 (= (toIndex!0 (select (store (arr!46426 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvand (bvxor lt!619366 (bvlshr lt!619366 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1406666 d!151337))

(declare-fun d!151339 () Bool)

(assert (=> d!151339 (= (validKeyInArray!0 (select (arr!46426 a!2901) j!112)) (and (not (= (select (arr!46426 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46426 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1406671 d!151339))

(declare-fun b!1406889 () Bool)

(declare-fun c!130382 () Bool)

(declare-fun lt!619407 () (_ BitVec 64))

(assert (=> b!1406889 (= c!130382 (= lt!619407 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!796283 () SeekEntryResult!10763)

(declare-fun e!796284 () SeekEntryResult!10763)

(assert (=> b!1406889 (= e!796283 e!796284)))

(declare-fun d!151341 () Bool)

(declare-fun lt!619409 () SeekEntryResult!10763)

(assert (=> d!151341 (and (or ((_ is Undefined!10763) lt!619409) (not ((_ is Found!10763) lt!619409)) (and (bvsge (index!45430 lt!619409) #b00000000000000000000000000000000) (bvslt (index!45430 lt!619409) (size!46978 a!2901)))) (or ((_ is Undefined!10763) lt!619409) ((_ is Found!10763) lt!619409) (not ((_ is MissingZero!10763) lt!619409)) (and (bvsge (index!45429 lt!619409) #b00000000000000000000000000000000) (bvslt (index!45429 lt!619409) (size!46978 a!2901)))) (or ((_ is Undefined!10763) lt!619409) ((_ is Found!10763) lt!619409) ((_ is MissingZero!10763) lt!619409) (not ((_ is MissingVacant!10763) lt!619409)) (and (bvsge (index!45432 lt!619409) #b00000000000000000000000000000000) (bvslt (index!45432 lt!619409) (size!46978 a!2901)))) (or ((_ is Undefined!10763) lt!619409) (ite ((_ is Found!10763) lt!619409) (= (select (arr!46426 a!2901) (index!45430 lt!619409)) (select (arr!46426 a!2901) j!112)) (ite ((_ is MissingZero!10763) lt!619409) (= (select (arr!46426 a!2901) (index!45429 lt!619409)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10763) lt!619409) (= (select (arr!46426 a!2901) (index!45432 lt!619409)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!796285 () SeekEntryResult!10763)

(assert (=> d!151341 (= lt!619409 e!796285)))

(declare-fun c!130383 () Bool)

(declare-fun lt!619408 () SeekEntryResult!10763)

(assert (=> d!151341 (= c!130383 (and ((_ is Intermediate!10763) lt!619408) (undefined!11575 lt!619408)))))

(assert (=> d!151341 (= lt!619408 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46426 a!2901) j!112) mask!2840) (select (arr!46426 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!151341 (validMask!0 mask!2840)))

(assert (=> d!151341 (= (seekEntryOrOpen!0 (select (arr!46426 a!2901) j!112) a!2901 mask!2840) lt!619409)))

(declare-fun b!1406890 () Bool)

(assert (=> b!1406890 (= e!796283 (Found!10763 (index!45431 lt!619408)))))

(declare-fun b!1406891 () Bool)

(assert (=> b!1406891 (= e!796285 e!796283)))

(assert (=> b!1406891 (= lt!619407 (select (arr!46426 a!2901) (index!45431 lt!619408)))))

(declare-fun c!130381 () Bool)

(assert (=> b!1406891 (= c!130381 (= lt!619407 (select (arr!46426 a!2901) j!112)))))

(declare-fun b!1406892 () Bool)

(assert (=> b!1406892 (= e!796284 (MissingZero!10763 (index!45431 lt!619408)))))

(declare-fun b!1406893 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96156 (_ BitVec 32)) SeekEntryResult!10763)

(assert (=> b!1406893 (= e!796284 (seekKeyOrZeroReturnVacant!0 (x!127023 lt!619408) (index!45431 lt!619408) (index!45431 lt!619408) (select (arr!46426 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1406894 () Bool)

(assert (=> b!1406894 (= e!796285 Undefined!10763)))

(assert (= (and d!151341 c!130383) b!1406894))

(assert (= (and d!151341 (not c!130383)) b!1406891))

(assert (= (and b!1406891 c!130381) b!1406890))

(assert (= (and b!1406891 (not c!130381)) b!1406889))

(assert (= (and b!1406889 c!130382) b!1406892))

(assert (= (and b!1406889 (not c!130382)) b!1406893))

(assert (=> d!151341 m!1295503))

(declare-fun m!1295663 () Bool)

(assert (=> d!151341 m!1295663))

(assert (=> d!151341 m!1295479))

(assert (=> d!151341 m!1295481))

(declare-fun m!1295667 () Bool)

(assert (=> d!151341 m!1295667))

(declare-fun m!1295669 () Bool)

(assert (=> d!151341 m!1295669))

(assert (=> d!151341 m!1295481))

(assert (=> d!151341 m!1295479))

(assert (=> d!151341 m!1295485))

(declare-fun m!1295671 () Bool)

(assert (=> b!1406891 m!1295671))

(assert (=> b!1406893 m!1295479))

(declare-fun m!1295673 () Bool)

(assert (=> b!1406893 m!1295673))

(assert (=> b!1406670 d!151341))

(declare-fun d!151357 () Bool)

(assert (=> d!151357 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!120896 d!151357))

(declare-fun d!151367 () Bool)

(assert (=> d!151367 (= (array_inv!35659 a!2901) (bvsge (size!46978 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!120896 d!151367))

(check-sat (not b!1406893) (not b!1406758) (not d!151341) (not b!1406739) (not b!1406753) (not b!1406754) (not bm!66932) (not bm!66933) (not b!1406816) (not bm!66929) (not d!151335) (not b!1406789) (not d!151319) (not b!1406737) (not d!151317) (not b!1406756) (not b!1406752))
(check-sat)
