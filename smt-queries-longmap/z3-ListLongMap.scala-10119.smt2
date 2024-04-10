; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119210 () Bool)

(assert start!119210)

(declare-fun b!1390581 () Bool)

(declare-fun e!787481 () Bool)

(declare-datatypes ((SeekEntryResult!10256 0))(
  ( (MissingZero!10256 (index!43395 (_ BitVec 32))) (Found!10256 (index!43396 (_ BitVec 32))) (Intermediate!10256 (undefined!11068 Bool) (index!43397 (_ BitVec 32)) (x!125070 (_ BitVec 32))) (Undefined!10256) (MissingVacant!10256 (index!43398 (_ BitVec 32))) )
))
(declare-fun lt!610865 () SeekEntryResult!10256)

(declare-fun mask!2840 () (_ BitVec 32))

(get-info :version)

(assert (=> b!1390581 (= e!787481 (not (or (not ((_ is Intermediate!10256) lt!610865)) (undefined!11068 lt!610865) (bvslt mask!2840 #b00000000000000000000000000000000) (bvsle mask!2840 #b00111111111111111111111111111111))))))

(declare-fun e!787479 () Bool)

(assert (=> b!1390581 e!787479))

(declare-fun res!930748 () Bool)

(assert (=> b!1390581 (=> (not res!930748) (not e!787479))))

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((array!95147 0))(
  ( (array!95148 (arr!45939 (Array (_ BitVec 32) (_ BitVec 64))) (size!46489 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95147)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95147 (_ BitVec 32)) Bool)

(assert (=> b!1390581 (= res!930748 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46516 0))(
  ( (Unit!46517) )
))
(declare-fun lt!610866 () Unit!46516)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95147 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46516)

(assert (=> b!1390581 (= lt!610866 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95147 (_ BitVec 32)) SeekEntryResult!10256)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390581 (= lt!610865 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45939 a!2901) j!112) mask!2840) (select (arr!45939 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1390582 () Bool)

(declare-fun res!930745 () Bool)

(assert (=> b!1390582 (=> (not res!930745) (not e!787481))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390582 (= res!930745 (validKeyInArray!0 (select (arr!45939 a!2901) i!1037)))))

(declare-fun b!1390583 () Bool)

(declare-fun res!930746 () Bool)

(assert (=> b!1390583 (=> (not res!930746) (not e!787481))))

(assert (=> b!1390583 (= res!930746 (validKeyInArray!0 (select (arr!45939 a!2901) j!112)))))

(declare-fun res!930747 () Bool)

(assert (=> start!119210 (=> (not res!930747) (not e!787481))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119210 (= res!930747 (validMask!0 mask!2840))))

(assert (=> start!119210 e!787481))

(assert (=> start!119210 true))

(declare-fun array_inv!34967 (array!95147) Bool)

(assert (=> start!119210 (array_inv!34967 a!2901)))

(declare-fun b!1390584 () Bool)

(declare-fun res!930744 () Bool)

(assert (=> b!1390584 (=> (not res!930744) (not e!787481))))

(declare-datatypes ((List!32458 0))(
  ( (Nil!32455) (Cons!32454 (h!33672 (_ BitVec 64)) (t!47152 List!32458)) )
))
(declare-fun arrayNoDuplicates!0 (array!95147 (_ BitVec 32) List!32458) Bool)

(assert (=> b!1390584 (= res!930744 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32455))))

(declare-fun b!1390585 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95147 (_ BitVec 32)) SeekEntryResult!10256)

(assert (=> b!1390585 (= e!787479 (= (seekEntryOrOpen!0 (select (arr!45939 a!2901) j!112) a!2901 mask!2840) (Found!10256 j!112)))))

(declare-fun b!1390586 () Bool)

(declare-fun res!930742 () Bool)

(assert (=> b!1390586 (=> (not res!930742) (not e!787481))))

(assert (=> b!1390586 (= res!930742 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1390587 () Bool)

(declare-fun res!930743 () Bool)

(assert (=> b!1390587 (=> (not res!930743) (not e!787481))))

(assert (=> b!1390587 (= res!930743 (and (= (size!46489 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46489 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46489 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!119210 res!930747) b!1390587))

(assert (= (and b!1390587 res!930743) b!1390582))

(assert (= (and b!1390582 res!930745) b!1390583))

(assert (= (and b!1390583 res!930746) b!1390586))

(assert (= (and b!1390586 res!930742) b!1390584))

(assert (= (and b!1390584 res!930744) b!1390581))

(assert (= (and b!1390581 res!930748) b!1390585))

(declare-fun m!1276463 () Bool)

(assert (=> b!1390586 m!1276463))

(declare-fun m!1276465 () Bool)

(assert (=> b!1390584 m!1276465))

(declare-fun m!1276467 () Bool)

(assert (=> b!1390585 m!1276467))

(assert (=> b!1390585 m!1276467))

(declare-fun m!1276469 () Bool)

(assert (=> b!1390585 m!1276469))

(declare-fun m!1276471 () Bool)

(assert (=> b!1390582 m!1276471))

(assert (=> b!1390582 m!1276471))

(declare-fun m!1276473 () Bool)

(assert (=> b!1390582 m!1276473))

(assert (=> b!1390581 m!1276467))

(declare-fun m!1276475 () Bool)

(assert (=> b!1390581 m!1276475))

(assert (=> b!1390581 m!1276467))

(declare-fun m!1276477 () Bool)

(assert (=> b!1390581 m!1276477))

(assert (=> b!1390581 m!1276475))

(assert (=> b!1390581 m!1276467))

(declare-fun m!1276479 () Bool)

(assert (=> b!1390581 m!1276479))

(declare-fun m!1276481 () Bool)

(assert (=> b!1390581 m!1276481))

(assert (=> b!1390583 m!1276467))

(assert (=> b!1390583 m!1276467))

(declare-fun m!1276483 () Bool)

(assert (=> b!1390583 m!1276483))

(declare-fun m!1276485 () Bool)

(assert (=> start!119210 m!1276485))

(declare-fun m!1276487 () Bool)

(assert (=> start!119210 m!1276487))

(check-sat (not b!1390584) (not start!119210) (not b!1390582) (not b!1390586) (not b!1390583) (not b!1390585) (not b!1390581))
(check-sat)
(get-model)

(declare-fun b!1390619 () Bool)

(declare-fun e!787501 () Bool)

(declare-fun contains!9762 (List!32458 (_ BitVec 64)) Bool)

(assert (=> b!1390619 (= e!787501 (contains!9762 Nil!32455 (select (arr!45939 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1390620 () Bool)

(declare-fun e!787500 () Bool)

(declare-fun e!787502 () Bool)

(assert (=> b!1390620 (= e!787500 e!787502)))

(declare-fun c!129366 () Bool)

(assert (=> b!1390620 (= c!129366 (validKeyInArray!0 (select (arr!45939 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!150199 () Bool)

(declare-fun res!930778 () Bool)

(declare-fun e!787499 () Bool)

(assert (=> d!150199 (=> res!930778 e!787499)))

(assert (=> d!150199 (= res!930778 (bvsge #b00000000000000000000000000000000 (size!46489 a!2901)))))

(assert (=> d!150199 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32455) e!787499)))

(declare-fun b!1390621 () Bool)

(declare-fun call!66700 () Bool)

(assert (=> b!1390621 (= e!787502 call!66700)))

(declare-fun bm!66697 () Bool)

(assert (=> bm!66697 (= call!66700 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!129366 (Cons!32454 (select (arr!45939 a!2901) #b00000000000000000000000000000000) Nil!32455) Nil!32455)))))

(declare-fun b!1390622 () Bool)

(assert (=> b!1390622 (= e!787499 e!787500)))

(declare-fun res!930776 () Bool)

(assert (=> b!1390622 (=> (not res!930776) (not e!787500))))

(assert (=> b!1390622 (= res!930776 (not e!787501))))

(declare-fun res!930777 () Bool)

(assert (=> b!1390622 (=> (not res!930777) (not e!787501))))

(assert (=> b!1390622 (= res!930777 (validKeyInArray!0 (select (arr!45939 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1390623 () Bool)

(assert (=> b!1390623 (= e!787502 call!66700)))

(assert (= (and d!150199 (not res!930778)) b!1390622))

(assert (= (and b!1390622 res!930777) b!1390619))

(assert (= (and b!1390622 res!930776) b!1390620))

(assert (= (and b!1390620 c!129366) b!1390623))

(assert (= (and b!1390620 (not c!129366)) b!1390621))

(assert (= (or b!1390623 b!1390621) bm!66697))

(declare-fun m!1276515 () Bool)

(assert (=> b!1390619 m!1276515))

(assert (=> b!1390619 m!1276515))

(declare-fun m!1276517 () Bool)

(assert (=> b!1390619 m!1276517))

(assert (=> b!1390620 m!1276515))

(assert (=> b!1390620 m!1276515))

(declare-fun m!1276519 () Bool)

(assert (=> b!1390620 m!1276519))

(assert (=> bm!66697 m!1276515))

(declare-fun m!1276521 () Bool)

(assert (=> bm!66697 m!1276521))

(assert (=> b!1390622 m!1276515))

(assert (=> b!1390622 m!1276515))

(assert (=> b!1390622 m!1276519))

(assert (=> b!1390584 d!150199))

(declare-fun d!150205 () Bool)

(assert (=> d!150205 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!119210 d!150205))

(declare-fun d!150211 () Bool)

(assert (=> d!150211 (= (array_inv!34967 a!2901) (bvsge (size!46489 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!119210 d!150211))

(declare-fun b!1390700 () Bool)

(declare-fun lt!610905 () SeekEntryResult!10256)

(declare-fun e!787550 () SeekEntryResult!10256)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95147 (_ BitVec 32)) SeekEntryResult!10256)

(assert (=> b!1390700 (= e!787550 (seekKeyOrZeroReturnVacant!0 (x!125070 lt!610905) (index!43397 lt!610905) (index!43397 lt!610905) (select (arr!45939 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1390701 () Bool)

(declare-fun e!787549 () SeekEntryResult!10256)

(assert (=> b!1390701 (= e!787549 Undefined!10256)))

(declare-fun b!1390702 () Bool)

(declare-fun c!129395 () Bool)

(declare-fun lt!610904 () (_ BitVec 64))

(assert (=> b!1390702 (= c!129395 (= lt!610904 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!787551 () SeekEntryResult!10256)

(assert (=> b!1390702 (= e!787551 e!787550)))

(declare-fun b!1390703 () Bool)

(assert (=> b!1390703 (= e!787549 e!787551)))

(assert (=> b!1390703 (= lt!610904 (select (arr!45939 a!2901) (index!43397 lt!610905)))))

(declare-fun c!129396 () Bool)

(assert (=> b!1390703 (= c!129396 (= lt!610904 (select (arr!45939 a!2901) j!112)))))

(declare-fun b!1390704 () Bool)

(assert (=> b!1390704 (= e!787551 (Found!10256 (index!43397 lt!610905)))))

(declare-fun d!150213 () Bool)

(declare-fun lt!610906 () SeekEntryResult!10256)

(assert (=> d!150213 (and (or ((_ is Undefined!10256) lt!610906) (not ((_ is Found!10256) lt!610906)) (and (bvsge (index!43396 lt!610906) #b00000000000000000000000000000000) (bvslt (index!43396 lt!610906) (size!46489 a!2901)))) (or ((_ is Undefined!10256) lt!610906) ((_ is Found!10256) lt!610906) (not ((_ is MissingZero!10256) lt!610906)) (and (bvsge (index!43395 lt!610906) #b00000000000000000000000000000000) (bvslt (index!43395 lt!610906) (size!46489 a!2901)))) (or ((_ is Undefined!10256) lt!610906) ((_ is Found!10256) lt!610906) ((_ is MissingZero!10256) lt!610906) (not ((_ is MissingVacant!10256) lt!610906)) (and (bvsge (index!43398 lt!610906) #b00000000000000000000000000000000) (bvslt (index!43398 lt!610906) (size!46489 a!2901)))) (or ((_ is Undefined!10256) lt!610906) (ite ((_ is Found!10256) lt!610906) (= (select (arr!45939 a!2901) (index!43396 lt!610906)) (select (arr!45939 a!2901) j!112)) (ite ((_ is MissingZero!10256) lt!610906) (= (select (arr!45939 a!2901) (index!43395 lt!610906)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10256) lt!610906) (= (select (arr!45939 a!2901) (index!43398 lt!610906)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!150213 (= lt!610906 e!787549)))

(declare-fun c!129394 () Bool)

(assert (=> d!150213 (= c!129394 (and ((_ is Intermediate!10256) lt!610905) (undefined!11068 lt!610905)))))

(assert (=> d!150213 (= lt!610905 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45939 a!2901) j!112) mask!2840) (select (arr!45939 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!150213 (validMask!0 mask!2840)))

(assert (=> d!150213 (= (seekEntryOrOpen!0 (select (arr!45939 a!2901) j!112) a!2901 mask!2840) lt!610906)))

(declare-fun b!1390699 () Bool)

(assert (=> b!1390699 (= e!787550 (MissingZero!10256 (index!43397 lt!610905)))))

(assert (= (and d!150213 c!129394) b!1390701))

(assert (= (and d!150213 (not c!129394)) b!1390703))

(assert (= (and b!1390703 c!129396) b!1390704))

(assert (= (and b!1390703 (not c!129396)) b!1390702))

(assert (= (and b!1390702 c!129395) b!1390699))

(assert (= (and b!1390702 (not c!129395)) b!1390700))

(assert (=> b!1390700 m!1276467))

(declare-fun m!1276549 () Bool)

(assert (=> b!1390700 m!1276549))

(declare-fun m!1276551 () Bool)

(assert (=> b!1390703 m!1276551))

(assert (=> d!150213 m!1276485))

(assert (=> d!150213 m!1276475))

(assert (=> d!150213 m!1276467))

(assert (=> d!150213 m!1276479))

(declare-fun m!1276553 () Bool)

(assert (=> d!150213 m!1276553))

(declare-fun m!1276555 () Bool)

(assert (=> d!150213 m!1276555))

(assert (=> d!150213 m!1276467))

(assert (=> d!150213 m!1276475))

(declare-fun m!1276557 () Bool)

(assert (=> d!150213 m!1276557))

(assert (=> b!1390585 d!150213))

(declare-fun d!150219 () Bool)

(declare-fun res!930817 () Bool)

(declare-fun e!787577 () Bool)

(assert (=> d!150219 (=> res!930817 e!787577)))

(assert (=> d!150219 (= res!930817 (bvsge j!112 (size!46489 a!2901)))))

(assert (=> d!150219 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!787577)))

(declare-fun bm!66710 () Bool)

(declare-fun call!66713 () Bool)

(assert (=> bm!66710 (= call!66713 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1390738 () Bool)

(declare-fun e!787575 () Bool)

(assert (=> b!1390738 (= e!787575 call!66713)))

(declare-fun b!1390739 () Bool)

(declare-fun e!787576 () Bool)

(assert (=> b!1390739 (= e!787576 e!787575)))

(declare-fun lt!610938 () (_ BitVec 64))

(assert (=> b!1390739 (= lt!610938 (select (arr!45939 a!2901) j!112))))

(declare-fun lt!610937 () Unit!46516)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!95147 (_ BitVec 64) (_ BitVec 32)) Unit!46516)

(assert (=> b!1390739 (= lt!610937 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!610938 j!112))))

(declare-fun arrayContainsKey!0 (array!95147 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1390739 (arrayContainsKey!0 a!2901 lt!610938 #b00000000000000000000000000000000)))

(declare-fun lt!610936 () Unit!46516)

(assert (=> b!1390739 (= lt!610936 lt!610937)))

(declare-fun res!930816 () Bool)

(assert (=> b!1390739 (= res!930816 (= (seekEntryOrOpen!0 (select (arr!45939 a!2901) j!112) a!2901 mask!2840) (Found!10256 j!112)))))

(assert (=> b!1390739 (=> (not res!930816) (not e!787575))))

(declare-fun b!1390740 () Bool)

(assert (=> b!1390740 (= e!787576 call!66713)))

(declare-fun b!1390741 () Bool)

(assert (=> b!1390741 (= e!787577 e!787576)))

(declare-fun c!129406 () Bool)

(assert (=> b!1390741 (= c!129406 (validKeyInArray!0 (select (arr!45939 a!2901) j!112)))))

(assert (= (and d!150219 (not res!930817)) b!1390741))

(assert (= (and b!1390741 c!129406) b!1390739))

(assert (= (and b!1390741 (not c!129406)) b!1390740))

(assert (= (and b!1390739 res!930816) b!1390738))

(assert (= (or b!1390738 b!1390740) bm!66710))

(declare-fun m!1276583 () Bool)

(assert (=> bm!66710 m!1276583))

(assert (=> b!1390739 m!1276467))

(declare-fun m!1276585 () Bool)

(assert (=> b!1390739 m!1276585))

(declare-fun m!1276587 () Bool)

(assert (=> b!1390739 m!1276587))

(assert (=> b!1390739 m!1276467))

(assert (=> b!1390739 m!1276469))

(assert (=> b!1390741 m!1276467))

(assert (=> b!1390741 m!1276467))

(assert (=> b!1390741 m!1276483))

(assert (=> b!1390581 d!150219))

(declare-fun d!150231 () Bool)

(assert (=> d!150231 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!610941 () Unit!46516)

(declare-fun choose!38 (array!95147 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46516)

(assert (=> d!150231 (= lt!610941 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!150231 (validMask!0 mask!2840)))

(assert (=> d!150231 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!610941)))

(declare-fun bs!40456 () Bool)

(assert (= bs!40456 d!150231))

(assert (=> bs!40456 m!1276481))

(declare-fun m!1276589 () Bool)

(assert (=> bs!40456 m!1276589))

(assert (=> bs!40456 m!1276485))

(assert (=> b!1390581 d!150231))

(declare-fun b!1390805 () Bool)

(declare-fun lt!610965 () SeekEntryResult!10256)

(assert (=> b!1390805 (and (bvsge (index!43397 lt!610965) #b00000000000000000000000000000000) (bvslt (index!43397 lt!610965) (size!46489 a!2901)))))

(declare-fun res!930836 () Bool)

(assert (=> b!1390805 (= res!930836 (= (select (arr!45939 a!2901) (index!43397 lt!610965)) (select (arr!45939 a!2901) j!112)))))

(declare-fun e!787612 () Bool)

(assert (=> b!1390805 (=> res!930836 e!787612)))

(declare-fun e!787613 () Bool)

(assert (=> b!1390805 (= e!787613 e!787612)))

(declare-fun b!1390806 () Bool)

(declare-fun e!787615 () SeekEntryResult!10256)

(declare-fun e!787616 () SeekEntryResult!10256)

(assert (=> b!1390806 (= e!787615 e!787616)))

(declare-fun lt!610966 () (_ BitVec 64))

(declare-fun c!129433 () Bool)

(assert (=> b!1390806 (= c!129433 (or (= lt!610966 (select (arr!45939 a!2901) j!112)) (= (bvadd lt!610966 lt!610966) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1390807 () Bool)

(declare-fun e!787614 () Bool)

(assert (=> b!1390807 (= e!787614 (bvsge (x!125070 lt!610965) #b01111111111111111111111111111110))))

(declare-fun b!1390808 () Bool)

(assert (=> b!1390808 (= e!787614 e!787613)))

(declare-fun res!930834 () Bool)

(assert (=> b!1390808 (= res!930834 (and ((_ is Intermediate!10256) lt!610965) (not (undefined!11068 lt!610965)) (bvslt (x!125070 lt!610965) #b01111111111111111111111111111110) (bvsge (x!125070 lt!610965) #b00000000000000000000000000000000) (bvsge (x!125070 lt!610965) #b00000000000000000000000000000000)))))

(assert (=> b!1390808 (=> (not res!930834) (not e!787613))))

(declare-fun b!1390809 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390809 (= e!787616 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!45939 a!2901) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (arr!45939 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1390810 () Bool)

(assert (=> b!1390810 (and (bvsge (index!43397 lt!610965) #b00000000000000000000000000000000) (bvslt (index!43397 lt!610965) (size!46489 a!2901)))))

(assert (=> b!1390810 (= e!787612 (= (select (arr!45939 a!2901) (index!43397 lt!610965)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!150233 () Bool)

(assert (=> d!150233 e!787614))

(declare-fun c!129431 () Bool)

(assert (=> d!150233 (= c!129431 (and ((_ is Intermediate!10256) lt!610965) (undefined!11068 lt!610965)))))

(assert (=> d!150233 (= lt!610965 e!787615)))

(declare-fun c!129432 () Bool)

(assert (=> d!150233 (= c!129432 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!150233 (= lt!610966 (select (arr!45939 a!2901) (toIndex!0 (select (arr!45939 a!2901) j!112) mask!2840)))))

(assert (=> d!150233 (validMask!0 mask!2840)))

(assert (=> d!150233 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45939 a!2901) j!112) mask!2840) (select (arr!45939 a!2901) j!112) a!2901 mask!2840) lt!610965)))

(declare-fun b!1390811 () Bool)

(assert (=> b!1390811 (= e!787615 (Intermediate!10256 true (toIndex!0 (select (arr!45939 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1390812 () Bool)

(assert (=> b!1390812 (and (bvsge (index!43397 lt!610965) #b00000000000000000000000000000000) (bvslt (index!43397 lt!610965) (size!46489 a!2901)))))

(declare-fun res!930835 () Bool)

(assert (=> b!1390812 (= res!930835 (= (select (arr!45939 a!2901) (index!43397 lt!610965)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1390812 (=> res!930835 e!787612)))

(declare-fun b!1390813 () Bool)

(assert (=> b!1390813 (= e!787616 (Intermediate!10256 false (toIndex!0 (select (arr!45939 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(assert (= (and d!150233 c!129432) b!1390811))

(assert (= (and d!150233 (not c!129432)) b!1390806))

(assert (= (and b!1390806 c!129433) b!1390813))

(assert (= (and b!1390806 (not c!129433)) b!1390809))

(assert (= (and d!150233 c!129431) b!1390807))

(assert (= (and d!150233 (not c!129431)) b!1390808))

(assert (= (and b!1390808 res!930834) b!1390805))

(assert (= (and b!1390805 (not res!930836)) b!1390812))

(assert (= (and b!1390812 (not res!930835)) b!1390810))

(declare-fun m!1276609 () Bool)

(assert (=> b!1390805 m!1276609))

(assert (=> b!1390810 m!1276609))

(assert (=> b!1390812 m!1276609))

(assert (=> b!1390809 m!1276475))

(declare-fun m!1276611 () Bool)

(assert (=> b!1390809 m!1276611))

(assert (=> b!1390809 m!1276611))

(assert (=> b!1390809 m!1276467))

(declare-fun m!1276613 () Bool)

(assert (=> b!1390809 m!1276613))

(assert (=> d!150233 m!1276475))

(declare-fun m!1276615 () Bool)

(assert (=> d!150233 m!1276615))

(assert (=> d!150233 m!1276485))

(assert (=> b!1390581 d!150233))

(declare-fun d!150243 () Bool)

(declare-fun lt!610974 () (_ BitVec 32))

(declare-fun lt!610973 () (_ BitVec 32))

(assert (=> d!150243 (= lt!610974 (bvmul (bvxor lt!610973 (bvlshr lt!610973 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150243 (= lt!610973 ((_ extract 31 0) (bvand (bvxor (select (arr!45939 a!2901) j!112) (bvlshr (select (arr!45939 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150243 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!930837 (let ((h!33676 ((_ extract 31 0) (bvand (bvxor (select (arr!45939 a!2901) j!112) (bvlshr (select (arr!45939 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!125077 (bvmul (bvxor h!33676 (bvlshr h!33676 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!125077 (bvlshr x!125077 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!930837 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!930837 #b00000000000000000000000000000000))))))

(assert (=> d!150243 (= (toIndex!0 (select (arr!45939 a!2901) j!112) mask!2840) (bvand (bvxor lt!610974 (bvlshr lt!610974 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1390581 d!150243))

(declare-fun d!150249 () Bool)

(declare-fun res!930839 () Bool)

(declare-fun e!787619 () Bool)

(assert (=> d!150249 (=> res!930839 e!787619)))

(assert (=> d!150249 (= res!930839 (bvsge #b00000000000000000000000000000000 (size!46489 a!2901)))))

(assert (=> d!150249 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!787619)))

(declare-fun bm!66711 () Bool)

(declare-fun call!66714 () Bool)

(assert (=> bm!66711 (= call!66714 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1390814 () Bool)

(declare-fun e!787617 () Bool)

(assert (=> b!1390814 (= e!787617 call!66714)))

(declare-fun b!1390815 () Bool)

(declare-fun e!787618 () Bool)

(assert (=> b!1390815 (= e!787618 e!787617)))

(declare-fun lt!610977 () (_ BitVec 64))

(assert (=> b!1390815 (= lt!610977 (select (arr!45939 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!610976 () Unit!46516)

(assert (=> b!1390815 (= lt!610976 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!610977 #b00000000000000000000000000000000))))

(assert (=> b!1390815 (arrayContainsKey!0 a!2901 lt!610977 #b00000000000000000000000000000000)))

(declare-fun lt!610975 () Unit!46516)

(assert (=> b!1390815 (= lt!610975 lt!610976)))

(declare-fun res!930838 () Bool)

(assert (=> b!1390815 (= res!930838 (= (seekEntryOrOpen!0 (select (arr!45939 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10256 #b00000000000000000000000000000000)))))

(assert (=> b!1390815 (=> (not res!930838) (not e!787617))))

(declare-fun b!1390816 () Bool)

(assert (=> b!1390816 (= e!787618 call!66714)))

(declare-fun b!1390817 () Bool)

(assert (=> b!1390817 (= e!787619 e!787618)))

(declare-fun c!129434 () Bool)

(assert (=> b!1390817 (= c!129434 (validKeyInArray!0 (select (arr!45939 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!150249 (not res!930839)) b!1390817))

(assert (= (and b!1390817 c!129434) b!1390815))

(assert (= (and b!1390817 (not c!129434)) b!1390816))

(assert (= (and b!1390815 res!930838) b!1390814))

(assert (= (or b!1390814 b!1390816) bm!66711))

(declare-fun m!1276617 () Bool)

(assert (=> bm!66711 m!1276617))

(assert (=> b!1390815 m!1276515))

(declare-fun m!1276619 () Bool)

(assert (=> b!1390815 m!1276619))

(declare-fun m!1276621 () Bool)

(assert (=> b!1390815 m!1276621))

(assert (=> b!1390815 m!1276515))

(declare-fun m!1276623 () Bool)

(assert (=> b!1390815 m!1276623))

(assert (=> b!1390817 m!1276515))

(assert (=> b!1390817 m!1276515))

(assert (=> b!1390817 m!1276519))

(assert (=> b!1390586 d!150249))

(declare-fun d!150251 () Bool)

(assert (=> d!150251 (= (validKeyInArray!0 (select (arr!45939 a!2901) j!112)) (and (not (= (select (arr!45939 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45939 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1390583 d!150251))

(declare-fun d!150253 () Bool)

(assert (=> d!150253 (= (validKeyInArray!0 (select (arr!45939 a!2901) i!1037)) (and (not (= (select (arr!45939 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45939 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1390582 d!150253))

(check-sat (not b!1390620) (not bm!66711) (not bm!66710) (not b!1390815) (not b!1390622) (not d!150231) (not bm!66697) (not b!1390619) (not b!1390739) (not b!1390809) (not b!1390817) (not d!150233) (not b!1390700) (not b!1390741) (not d!150213))
(check-sat)
