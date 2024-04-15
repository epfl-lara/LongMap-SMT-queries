; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128024 () Bool)

(assert start!128024)

(declare-fun b!1503965 () Bool)

(declare-fun res!1024947 () Bool)

(declare-fun e!840660 () Bool)

(assert (=> b!1503965 (=> (not res!1024947) (not e!840660))))

(declare-datatypes ((array!100294 0))(
  ( (array!100295 (arr!48403 (Array (_ BitVec 32) (_ BitVec 64))) (size!48955 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100294)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1503965 (= res!1024947 (validKeyInArray!0 (select (arr!48403 a!2850) j!87)))))

(declare-fun b!1503966 () Bool)

(declare-fun res!1024945 () Bool)

(assert (=> b!1503966 (=> (not res!1024945) (not e!840660))))

(declare-fun index!625 () (_ BitVec 32))

(assert (=> b!1503966 (= res!1024945 (not (= (select (arr!48403 a!2850) index!625) (select (arr!48403 a!2850) j!87))))))

(declare-fun b!1503967 () Bool)

(declare-fun res!1024946 () Bool)

(assert (=> b!1503967 (=> (not res!1024946) (not e!840660))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100294 (_ BitVec 32)) Bool)

(assert (=> b!1503967 (= res!1024946 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1503968 () Bool)

(declare-fun res!1024944 () Bool)

(assert (=> b!1503968 (=> (not res!1024944) (not e!840660))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1503968 (= res!1024944 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48955 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48955 a!2850)) (= (select (arr!48403 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48403 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48955 a!2850))))))

(declare-fun b!1503969 () Bool)

(declare-fun res!1024943 () Bool)

(assert (=> b!1503969 (=> (not res!1024943) (not e!840660))))

(declare-datatypes ((SeekEntryResult!12622 0))(
  ( (MissingZero!12622 (index!52880 (_ BitVec 32))) (Found!12622 (index!52881 (_ BitVec 32))) (Intermediate!12622 (undefined!13434 Bool) (index!52882 (_ BitVec 32)) (x!134567 (_ BitVec 32))) (Undefined!12622) (MissingVacant!12622 (index!52883 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100294 (_ BitVec 32)) SeekEntryResult!12622)

(assert (=> b!1503969 (= res!1024943 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48403 a!2850) j!87) a!2850 mask!2661) (Found!12622 j!87)))))

(declare-fun b!1503970 () Bool)

(declare-fun res!1024941 () Bool)

(assert (=> b!1503970 (=> (not res!1024941) (not e!840660))))

(assert (=> b!1503970 (= res!1024941 (and (= (size!48955 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48955 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48955 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1503971 () Bool)

(declare-fun res!1024942 () Bool)

(assert (=> b!1503971 (=> (not res!1024942) (not e!840660))))

(assert (=> b!1503971 (= res!1024942 (validKeyInArray!0 (select (arr!48403 a!2850) i!996)))))

(declare-fun b!1503972 () Bool)

(declare-fun lt!653380 () (_ BitVec 32))

(assert (=> b!1503972 (= e!840660 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (or (bvslt lt!653380 #b00000000000000000000000000000000) (bvsge lt!653380 (size!48955 a!2850)))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1503972 (= lt!653380 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun res!1024949 () Bool)

(assert (=> start!128024 (=> (not res!1024949) (not e!840660))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128024 (= res!1024949 (validMask!0 mask!2661))))

(assert (=> start!128024 e!840660))

(assert (=> start!128024 true))

(declare-fun array_inv!37636 (array!100294) Bool)

(assert (=> start!128024 (array_inv!37636 a!2850)))

(declare-fun b!1503973 () Bool)

(declare-fun res!1024948 () Bool)

(assert (=> b!1503973 (=> (not res!1024948) (not e!840660))))

(declare-datatypes ((List!34973 0))(
  ( (Nil!34970) (Cons!34969 (h!36367 (_ BitVec 64)) (t!49659 List!34973)) )
))
(declare-fun arrayNoDuplicates!0 (array!100294 (_ BitVec 32) List!34973) Bool)

(assert (=> b!1503973 (= res!1024948 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34970))))

(assert (= (and start!128024 res!1024949) b!1503970))

(assert (= (and b!1503970 res!1024941) b!1503971))

(assert (= (and b!1503971 res!1024942) b!1503965))

(assert (= (and b!1503965 res!1024947) b!1503967))

(assert (= (and b!1503967 res!1024946) b!1503973))

(assert (= (and b!1503973 res!1024948) b!1503968))

(assert (= (and b!1503968 res!1024944) b!1503969))

(assert (= (and b!1503969 res!1024943) b!1503966))

(assert (= (and b!1503966 res!1024945) b!1503972))

(declare-fun m!1386625 () Bool)

(assert (=> b!1503967 m!1386625))

(declare-fun m!1386627 () Bool)

(assert (=> b!1503968 m!1386627))

(declare-fun m!1386629 () Bool)

(assert (=> b!1503968 m!1386629))

(declare-fun m!1386631 () Bool)

(assert (=> b!1503968 m!1386631))

(declare-fun m!1386633 () Bool)

(assert (=> b!1503969 m!1386633))

(assert (=> b!1503969 m!1386633))

(declare-fun m!1386635 () Bool)

(assert (=> b!1503969 m!1386635))

(declare-fun m!1386637 () Bool)

(assert (=> start!128024 m!1386637))

(declare-fun m!1386639 () Bool)

(assert (=> start!128024 m!1386639))

(declare-fun m!1386641 () Bool)

(assert (=> b!1503973 m!1386641))

(assert (=> b!1503965 m!1386633))

(assert (=> b!1503965 m!1386633))

(declare-fun m!1386643 () Bool)

(assert (=> b!1503965 m!1386643))

(declare-fun m!1386645 () Bool)

(assert (=> b!1503971 m!1386645))

(assert (=> b!1503971 m!1386645))

(declare-fun m!1386647 () Bool)

(assert (=> b!1503971 m!1386647))

(declare-fun m!1386649 () Bool)

(assert (=> b!1503966 m!1386649))

(assert (=> b!1503966 m!1386633))

(declare-fun m!1386651 () Bool)

(assert (=> b!1503972 m!1386651))

(check-sat (not b!1503967) (not b!1503965) (not b!1503969) (not b!1503971) (not b!1503972) (not b!1503973) (not start!128024))
(check-sat)
(get-model)

(declare-fun b!1504039 () Bool)

(declare-fun e!840682 () Bool)

(declare-fun call!68090 () Bool)

(assert (=> b!1504039 (= e!840682 call!68090)))

(declare-fun bm!68087 () Bool)

(declare-fun c!139051 () Bool)

(assert (=> bm!68087 (= call!68090 (arrayNoDuplicates!0 a!2850 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139051 (Cons!34969 (select (arr!48403 a!2850) #b00000000000000000000000000000000) Nil!34970) Nil!34970)))))

(declare-fun b!1504040 () Bool)

(declare-fun e!840684 () Bool)

(declare-fun e!840683 () Bool)

(assert (=> b!1504040 (= e!840684 e!840683)))

(declare-fun res!1025011 () Bool)

(assert (=> b!1504040 (=> (not res!1025011) (not e!840683))))

(declare-fun e!840681 () Bool)

(assert (=> b!1504040 (= res!1025011 (not e!840681))))

(declare-fun res!1025012 () Bool)

(assert (=> b!1504040 (=> (not res!1025012) (not e!840681))))

(assert (=> b!1504040 (= res!1025012 (validKeyInArray!0 (select (arr!48403 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1504041 () Bool)

(assert (=> b!1504041 (= e!840682 call!68090)))

(declare-fun b!1504042 () Bool)

(assert (=> b!1504042 (= e!840683 e!840682)))

(assert (=> b!1504042 (= c!139051 (validKeyInArray!0 (select (arr!48403 a!2850) #b00000000000000000000000000000000)))))

(declare-fun d!157591 () Bool)

(declare-fun res!1025010 () Bool)

(assert (=> d!157591 (=> res!1025010 e!840684)))

(assert (=> d!157591 (= res!1025010 (bvsge #b00000000000000000000000000000000 (size!48955 a!2850)))))

(assert (=> d!157591 (= (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34970) e!840684)))

(declare-fun b!1504038 () Bool)

(declare-fun contains!9914 (List!34973 (_ BitVec 64)) Bool)

(assert (=> b!1504038 (= e!840681 (contains!9914 Nil!34970 (select (arr!48403 a!2850) #b00000000000000000000000000000000)))))

(assert (= (and d!157591 (not res!1025010)) b!1504040))

(assert (= (and b!1504040 res!1025012) b!1504038))

(assert (= (and b!1504040 res!1025011) b!1504042))

(assert (= (and b!1504042 c!139051) b!1504041))

(assert (= (and b!1504042 (not c!139051)) b!1504039))

(assert (= (or b!1504041 b!1504039) bm!68087))

(declare-fun m!1386709 () Bool)

(assert (=> bm!68087 m!1386709))

(declare-fun m!1386711 () Bool)

(assert (=> bm!68087 m!1386711))

(assert (=> b!1504040 m!1386709))

(assert (=> b!1504040 m!1386709))

(declare-fun m!1386713 () Bool)

(assert (=> b!1504040 m!1386713))

(assert (=> b!1504042 m!1386709))

(assert (=> b!1504042 m!1386709))

(assert (=> b!1504042 m!1386713))

(assert (=> b!1504038 m!1386709))

(assert (=> b!1504038 m!1386709))

(declare-fun m!1386715 () Bool)

(assert (=> b!1504038 m!1386715))

(assert (=> b!1503973 d!157591))

(declare-fun b!1504051 () Bool)

(declare-fun e!840691 () Bool)

(declare-fun e!840692 () Bool)

(assert (=> b!1504051 (= e!840691 e!840692)))

(declare-fun lt!653395 () (_ BitVec 64))

(assert (=> b!1504051 (= lt!653395 (select (arr!48403 a!2850) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50103 0))(
  ( (Unit!50104) )
))
(declare-fun lt!653394 () Unit!50103)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100294 (_ BitVec 64) (_ BitVec 32)) Unit!50103)

(assert (=> b!1504051 (= lt!653394 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2850 lt!653395 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100294 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1504051 (arrayContainsKey!0 a!2850 lt!653395 #b00000000000000000000000000000000)))

(declare-fun lt!653393 () Unit!50103)

(assert (=> b!1504051 (= lt!653393 lt!653394)))

(declare-fun res!1025018 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100294 (_ BitVec 32)) SeekEntryResult!12622)

(assert (=> b!1504051 (= res!1025018 (= (seekEntryOrOpen!0 (select (arr!48403 a!2850) #b00000000000000000000000000000000) a!2850 mask!2661) (Found!12622 #b00000000000000000000000000000000)))))

(assert (=> b!1504051 (=> (not res!1025018) (not e!840692))))

(declare-fun b!1504052 () Bool)

(declare-fun call!68093 () Bool)

(assert (=> b!1504052 (= e!840692 call!68093)))

(declare-fun bm!68090 () Bool)

(assert (=> bm!68090 (= call!68093 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2850 mask!2661))))

(declare-fun d!157593 () Bool)

(declare-fun res!1025017 () Bool)

(declare-fun e!840693 () Bool)

(assert (=> d!157593 (=> res!1025017 e!840693)))

(assert (=> d!157593 (= res!1025017 (bvsge #b00000000000000000000000000000000 (size!48955 a!2850)))))

(assert (=> d!157593 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661) e!840693)))

(declare-fun b!1504053 () Bool)

(assert (=> b!1504053 (= e!840693 e!840691)))

(declare-fun c!139054 () Bool)

(assert (=> b!1504053 (= c!139054 (validKeyInArray!0 (select (arr!48403 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1504054 () Bool)

(assert (=> b!1504054 (= e!840691 call!68093)))

(assert (= (and d!157593 (not res!1025017)) b!1504053))

(assert (= (and b!1504053 c!139054) b!1504051))

(assert (= (and b!1504053 (not c!139054)) b!1504054))

(assert (= (and b!1504051 res!1025018) b!1504052))

(assert (= (or b!1504052 b!1504054) bm!68090))

(assert (=> b!1504051 m!1386709))

(declare-fun m!1386717 () Bool)

(assert (=> b!1504051 m!1386717))

(declare-fun m!1386719 () Bool)

(assert (=> b!1504051 m!1386719))

(assert (=> b!1504051 m!1386709))

(declare-fun m!1386721 () Bool)

(assert (=> b!1504051 m!1386721))

(declare-fun m!1386723 () Bool)

(assert (=> bm!68090 m!1386723))

(assert (=> b!1504053 m!1386709))

(assert (=> b!1504053 m!1386709))

(assert (=> b!1504053 m!1386713))

(assert (=> b!1503967 d!157593))

(declare-fun d!157597 () Bool)

(declare-fun lt!653398 () (_ BitVec 32))

(assert (=> d!157597 (and (bvsge lt!653398 #b00000000000000000000000000000000) (bvslt lt!653398 (bvadd mask!2661 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!157597 (= lt!653398 (choose!52 index!625 x!647 mask!2661))))

(assert (=> d!157597 (validMask!0 mask!2661)))

(assert (=> d!157597 (= (nextIndex!0 index!625 x!647 mask!2661) lt!653398)))

(declare-fun bs!43150 () Bool)

(assert (= bs!43150 d!157597))

(declare-fun m!1386725 () Bool)

(assert (=> bs!43150 m!1386725))

(assert (=> bs!43150 m!1386637))

(assert (=> b!1503972 d!157597))

(declare-fun d!157601 () Bool)

(assert (=> d!157601 (= (validKeyInArray!0 (select (arr!48403 a!2850) i!996)) (and (not (= (select (arr!48403 a!2850) i!996) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48403 a!2850) i!996) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1503971 d!157601))

(declare-fun d!157603 () Bool)

(assert (=> d!157603 (= (validKeyInArray!0 (select (arr!48403 a!2850) j!87)) (and (not (= (select (arr!48403 a!2850) j!87) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48403 a!2850) j!87) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1503965 d!157603))

(declare-fun b!1504118 () Bool)

(declare-fun e!840731 () SeekEntryResult!12622)

(assert (=> b!1504118 (= e!840731 (seekKeyOrZeroReturnVacant!0 (bvadd x!647 #b00000000000000000000000000000001) (nextIndex!0 index!625 x!647 mask!2661) vacantBefore!10 (select (arr!48403 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1504119 () Bool)

(declare-fun e!840730 () SeekEntryResult!12622)

(declare-fun e!840732 () SeekEntryResult!12622)

(assert (=> b!1504119 (= e!840730 e!840732)))

(declare-fun lt!653416 () (_ BitVec 64))

(declare-fun c!139083 () Bool)

(assert (=> b!1504119 (= c!139083 (= lt!653416 (select (arr!48403 a!2850) j!87)))))

(declare-fun b!1504120 () Bool)

(assert (=> b!1504120 (= e!840732 (Found!12622 index!625))))

(declare-fun b!1504121 () Bool)

(declare-fun c!139084 () Bool)

(assert (=> b!1504121 (= c!139084 (= lt!653416 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1504121 (= e!840732 e!840731)))

(declare-fun b!1504122 () Bool)

(assert (=> b!1504122 (= e!840731 (MissingVacant!12622 vacantBefore!10))))

(declare-fun b!1504123 () Bool)

(assert (=> b!1504123 (= e!840730 Undefined!12622)))

(declare-fun lt!653415 () SeekEntryResult!12622)

(declare-fun d!157605 () Bool)

(get-info :version)

(assert (=> d!157605 (and (or ((_ is Undefined!12622) lt!653415) (not ((_ is Found!12622) lt!653415)) (and (bvsge (index!52881 lt!653415) #b00000000000000000000000000000000) (bvslt (index!52881 lt!653415) (size!48955 a!2850)))) (or ((_ is Undefined!12622) lt!653415) ((_ is Found!12622) lt!653415) (not ((_ is MissingVacant!12622) lt!653415)) (not (= (index!52883 lt!653415) vacantBefore!10)) (and (bvsge (index!52883 lt!653415) #b00000000000000000000000000000000) (bvslt (index!52883 lt!653415) (size!48955 a!2850)))) (or ((_ is Undefined!12622) lt!653415) (ite ((_ is Found!12622) lt!653415) (= (select (arr!48403 a!2850) (index!52881 lt!653415)) (select (arr!48403 a!2850) j!87)) (and ((_ is MissingVacant!12622) lt!653415) (= (index!52883 lt!653415) vacantBefore!10) (= (select (arr!48403 a!2850) (index!52883 lt!653415)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!157605 (= lt!653415 e!840730)))

(declare-fun c!139082 () Bool)

(assert (=> d!157605 (= c!139082 (bvsge x!647 #b01111111111111111111111111111110))))

(assert (=> d!157605 (= lt!653416 (select (arr!48403 a!2850) index!625))))

(assert (=> d!157605 (validMask!0 mask!2661)))

(assert (=> d!157605 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48403 a!2850) j!87) a!2850 mask!2661) lt!653415)))

(assert (= (and d!157605 c!139082) b!1504123))

(assert (= (and d!157605 (not c!139082)) b!1504119))

(assert (= (and b!1504119 c!139083) b!1504120))

(assert (= (and b!1504119 (not c!139083)) b!1504121))

(assert (= (and b!1504121 c!139084) b!1504122))

(assert (= (and b!1504121 (not c!139084)) b!1504118))

(assert (=> b!1504118 m!1386651))

(assert (=> b!1504118 m!1386651))

(assert (=> b!1504118 m!1386633))

(declare-fun m!1386745 () Bool)

(assert (=> b!1504118 m!1386745))

(declare-fun m!1386749 () Bool)

(assert (=> d!157605 m!1386749))

(declare-fun m!1386751 () Bool)

(assert (=> d!157605 m!1386751))

(assert (=> d!157605 m!1386649))

(assert (=> d!157605 m!1386637))

(assert (=> b!1503969 d!157605))

(declare-fun d!157617 () Bool)

(assert (=> d!157617 (= (validMask!0 mask!2661) (and (or (= mask!2661 #b00000000000000000000000000000111) (= mask!2661 #b00000000000000000000000000001111) (= mask!2661 #b00000000000000000000000000011111) (= mask!2661 #b00000000000000000000000000111111) (= mask!2661 #b00000000000000000000000001111111) (= mask!2661 #b00000000000000000000000011111111) (= mask!2661 #b00000000000000000000000111111111) (= mask!2661 #b00000000000000000000001111111111) (= mask!2661 #b00000000000000000000011111111111) (= mask!2661 #b00000000000000000000111111111111) (= mask!2661 #b00000000000000000001111111111111) (= mask!2661 #b00000000000000000011111111111111) (= mask!2661 #b00000000000000000111111111111111) (= mask!2661 #b00000000000000001111111111111111) (= mask!2661 #b00000000000000011111111111111111) (= mask!2661 #b00000000000000111111111111111111) (= mask!2661 #b00000000000001111111111111111111) (= mask!2661 #b00000000000011111111111111111111) (= mask!2661 #b00000000000111111111111111111111) (= mask!2661 #b00000000001111111111111111111111) (= mask!2661 #b00000000011111111111111111111111) (= mask!2661 #b00000000111111111111111111111111) (= mask!2661 #b00000001111111111111111111111111) (= mask!2661 #b00000011111111111111111111111111) (= mask!2661 #b00000111111111111111111111111111) (= mask!2661 #b00001111111111111111111111111111) (= mask!2661 #b00011111111111111111111111111111) (= mask!2661 #b00111111111111111111111111111111)) (bvsle mask!2661 #b00111111111111111111111111111111)))))

(assert (=> start!128024 d!157617))

(declare-fun d!157621 () Bool)

(assert (=> d!157621 (= (array_inv!37636 a!2850) (bvsge (size!48955 a!2850) #b00000000000000000000000000000000))))

(assert (=> start!128024 d!157621))

(check-sat (not bm!68087) (not d!157597) (not b!1504053) (not b!1504051) (not bm!68090) (not d!157605) (not b!1504118) (not b!1504038) (not b!1504040) (not b!1504042))
(check-sat)
