; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127994 () Bool)

(assert start!127994)

(declare-fun b!1503687 () Bool)

(declare-fun res!1024572 () Bool)

(declare-fun e!840666 () Bool)

(assert (=> b!1503687 (=> (not res!1024572) (not e!840666))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100309 0))(
  ( (array!100310 (arr!48411 (Array (_ BitVec 32) (_ BitVec 64))) (size!48961 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100309)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1503687 (= res!1024572 (and (= (size!48961 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48961 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48961 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1503688 () Bool)

(declare-fun res!1024567 () Bool)

(assert (=> b!1503688 (=> (not res!1024567) (not e!840666))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1503688 (= res!1024567 (validKeyInArray!0 (select (arr!48411 a!2850) j!87)))))

(declare-fun res!1024566 () Bool)

(assert (=> start!127994 (=> (not res!1024566) (not e!840666))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127994 (= res!1024566 (validMask!0 mask!2661))))

(assert (=> start!127994 e!840666))

(assert (=> start!127994 true))

(declare-fun array_inv!37439 (array!100309) Bool)

(assert (=> start!127994 (array_inv!37439 a!2850)))

(declare-fun b!1503689 () Bool)

(declare-fun res!1024565 () Bool)

(assert (=> b!1503689 (=> (not res!1024565) (not e!840666))))

(declare-fun index!625 () (_ BitVec 32))

(assert (=> b!1503689 (= res!1024565 (not (= (select (arr!48411 a!2850) index!625) (select (arr!48411 a!2850) j!87))))))

(declare-fun b!1503690 () Bool)

(declare-fun res!1024571 () Bool)

(assert (=> b!1503690 (=> (not res!1024571) (not e!840666))))

(assert (=> b!1503690 (= res!1024571 (validKeyInArray!0 (select (arr!48411 a!2850) i!996)))))

(declare-fun b!1503691 () Bool)

(declare-fun x!647 () (_ BitVec 32))

(assert (=> b!1503691 (= e!840666 (or (bvslt (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110)))))

(declare-fun lt!653554 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1503691 (= lt!653554 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1503692 () Bool)

(declare-fun res!1024573 () Bool)

(assert (=> b!1503692 (=> (not res!1024573) (not e!840666))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100309 (_ BitVec 32)) Bool)

(assert (=> b!1503692 (= res!1024573 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1503693 () Bool)

(declare-fun res!1024568 () Bool)

(assert (=> b!1503693 (=> (not res!1024568) (not e!840666))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1503693 (= res!1024568 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48961 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48961 a!2850)) (= (select (arr!48411 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48411 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48961 a!2850))))))

(declare-fun b!1503694 () Bool)

(declare-fun res!1024570 () Bool)

(assert (=> b!1503694 (=> (not res!1024570) (not e!840666))))

(declare-datatypes ((SeekEntryResult!12609 0))(
  ( (MissingZero!12609 (index!52828 (_ BitVec 32))) (Found!12609 (index!52829 (_ BitVec 32))) (Intermediate!12609 (undefined!13421 Bool) (index!52830 (_ BitVec 32)) (x!134505 (_ BitVec 32))) (Undefined!12609) (MissingVacant!12609 (index!52831 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100309 (_ BitVec 32)) SeekEntryResult!12609)

(assert (=> b!1503694 (= res!1024570 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48411 a!2850) j!87) a!2850 mask!2661) (Found!12609 j!87)))))

(declare-fun b!1503695 () Bool)

(declare-fun res!1024569 () Bool)

(assert (=> b!1503695 (=> (not res!1024569) (not e!840666))))

(declare-datatypes ((List!34903 0))(
  ( (Nil!34900) (Cons!34899 (h!36296 (_ BitVec 64)) (t!49597 List!34903)) )
))
(declare-fun arrayNoDuplicates!0 (array!100309 (_ BitVec 32) List!34903) Bool)

(assert (=> b!1503695 (= res!1024569 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34900))))

(assert (= (and start!127994 res!1024566) b!1503687))

(assert (= (and b!1503687 res!1024572) b!1503690))

(assert (= (and b!1503690 res!1024571) b!1503688))

(assert (= (and b!1503688 res!1024567) b!1503692))

(assert (= (and b!1503692 res!1024573) b!1503695))

(assert (= (and b!1503695 res!1024569) b!1503693))

(assert (= (and b!1503693 res!1024568) b!1503694))

(assert (= (and b!1503694 res!1024570) b!1503689))

(assert (= (and b!1503689 res!1024565) b!1503691))

(declare-fun m!1386947 () Bool)

(assert (=> b!1503691 m!1386947))

(declare-fun m!1386949 () Bool)

(assert (=> b!1503689 m!1386949))

(declare-fun m!1386951 () Bool)

(assert (=> b!1503689 m!1386951))

(declare-fun m!1386953 () Bool)

(assert (=> b!1503690 m!1386953))

(assert (=> b!1503690 m!1386953))

(declare-fun m!1386955 () Bool)

(assert (=> b!1503690 m!1386955))

(declare-fun m!1386957 () Bool)

(assert (=> b!1503692 m!1386957))

(assert (=> b!1503688 m!1386951))

(assert (=> b!1503688 m!1386951))

(declare-fun m!1386959 () Bool)

(assert (=> b!1503688 m!1386959))

(assert (=> b!1503694 m!1386951))

(assert (=> b!1503694 m!1386951))

(declare-fun m!1386961 () Bool)

(assert (=> b!1503694 m!1386961))

(declare-fun m!1386963 () Bool)

(assert (=> start!127994 m!1386963))

(declare-fun m!1386965 () Bool)

(assert (=> start!127994 m!1386965))

(declare-fun m!1386967 () Bool)

(assert (=> b!1503693 m!1386967))

(declare-fun m!1386969 () Bool)

(assert (=> b!1503693 m!1386969))

(declare-fun m!1386971 () Bool)

(assert (=> b!1503693 m!1386971))

(declare-fun m!1386973 () Bool)

(assert (=> b!1503695 m!1386973))

(check-sat (not b!1503692) (not b!1503688) (not b!1503690) (not b!1503695) (not b!1503691) (not start!127994) (not b!1503694))
(check-sat)
(get-model)

(declare-fun b!1503731 () Bool)

(declare-fun e!840680 () Bool)

(declare-fun e!840681 () Bool)

(assert (=> b!1503731 (= e!840680 e!840681)))

(declare-fun lt!653565 () (_ BitVec 64))

(assert (=> b!1503731 (= lt!653565 (select (arr!48411 a!2850) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50262 0))(
  ( (Unit!50263) )
))
(declare-fun lt!653564 () Unit!50262)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100309 (_ BitVec 64) (_ BitVec 32)) Unit!50262)

(assert (=> b!1503731 (= lt!653564 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2850 lt!653565 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100309 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1503731 (arrayContainsKey!0 a!2850 lt!653565 #b00000000000000000000000000000000)))

(declare-fun lt!653566 () Unit!50262)

(assert (=> b!1503731 (= lt!653566 lt!653564)))

(declare-fun res!1024606 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100309 (_ BitVec 32)) SeekEntryResult!12609)

(assert (=> b!1503731 (= res!1024606 (= (seekEntryOrOpen!0 (select (arr!48411 a!2850) #b00000000000000000000000000000000) a!2850 mask!2661) (Found!12609 #b00000000000000000000000000000000)))))

(assert (=> b!1503731 (=> (not res!1024606) (not e!840681))))

(declare-fun b!1503732 () Bool)

(declare-fun call!68106 () Bool)

(assert (=> b!1503732 (= e!840681 call!68106)))

(declare-fun b!1503733 () Bool)

(declare-fun e!840682 () Bool)

(assert (=> b!1503733 (= e!840682 e!840680)))

(declare-fun c!139097 () Bool)

(assert (=> b!1503733 (= c!139097 (validKeyInArray!0 (select (arr!48411 a!2850) #b00000000000000000000000000000000)))))

(declare-fun d!157779 () Bool)

(declare-fun res!1024605 () Bool)

(assert (=> d!157779 (=> res!1024605 e!840682)))

(assert (=> d!157779 (= res!1024605 (bvsge #b00000000000000000000000000000000 (size!48961 a!2850)))))

(assert (=> d!157779 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661) e!840682)))

(declare-fun b!1503734 () Bool)

(assert (=> b!1503734 (= e!840680 call!68106)))

(declare-fun bm!68103 () Bool)

(assert (=> bm!68103 (= call!68106 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2850 mask!2661))))

(assert (= (and d!157779 (not res!1024605)) b!1503733))

(assert (= (and b!1503733 c!139097) b!1503731))

(assert (= (and b!1503733 (not c!139097)) b!1503734))

(assert (= (and b!1503731 res!1024606) b!1503732))

(assert (= (or b!1503732 b!1503734) bm!68103))

(declare-fun m!1387003 () Bool)

(assert (=> b!1503731 m!1387003))

(declare-fun m!1387005 () Bool)

(assert (=> b!1503731 m!1387005))

(declare-fun m!1387007 () Bool)

(assert (=> b!1503731 m!1387007))

(assert (=> b!1503731 m!1387003))

(declare-fun m!1387009 () Bool)

(assert (=> b!1503731 m!1387009))

(assert (=> b!1503733 m!1387003))

(assert (=> b!1503733 m!1387003))

(declare-fun m!1387011 () Bool)

(assert (=> b!1503733 m!1387011))

(declare-fun m!1387013 () Bool)

(assert (=> bm!68103 m!1387013))

(assert (=> b!1503692 d!157779))

(declare-fun d!157781 () Bool)

(assert (=> d!157781 (= (validKeyInArray!0 (select (arr!48411 a!2850) j!87)) (and (not (= (select (arr!48411 a!2850) j!87) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48411 a!2850) j!87) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1503688 d!157781))

(declare-fun b!1503747 () Bool)

(declare-fun e!840691 () SeekEntryResult!12609)

(declare-fun e!840690 () SeekEntryResult!12609)

(assert (=> b!1503747 (= e!840691 e!840690)))

(declare-fun lt!653574 () (_ BitVec 64))

(declare-fun c!139104 () Bool)

(assert (=> b!1503747 (= c!139104 (= lt!653574 (select (arr!48411 a!2850) j!87)))))

(declare-fun lt!653575 () SeekEntryResult!12609)

(declare-fun d!157783 () Bool)

(get-info :version)

(assert (=> d!157783 (and (or ((_ is Undefined!12609) lt!653575) (not ((_ is Found!12609) lt!653575)) (and (bvsge (index!52829 lt!653575) #b00000000000000000000000000000000) (bvslt (index!52829 lt!653575) (size!48961 a!2850)))) (or ((_ is Undefined!12609) lt!653575) ((_ is Found!12609) lt!653575) (not ((_ is MissingVacant!12609) lt!653575)) (not (= (index!52831 lt!653575) vacantBefore!10)) (and (bvsge (index!52831 lt!653575) #b00000000000000000000000000000000) (bvslt (index!52831 lt!653575) (size!48961 a!2850)))) (or ((_ is Undefined!12609) lt!653575) (ite ((_ is Found!12609) lt!653575) (= (select (arr!48411 a!2850) (index!52829 lt!653575)) (select (arr!48411 a!2850) j!87)) (and ((_ is MissingVacant!12609) lt!653575) (= (index!52831 lt!653575) vacantBefore!10) (= (select (arr!48411 a!2850) (index!52831 lt!653575)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!157783 (= lt!653575 e!840691)))

(declare-fun c!139106 () Bool)

(assert (=> d!157783 (= c!139106 (bvsge x!647 #b01111111111111111111111111111110))))

(assert (=> d!157783 (= lt!653574 (select (arr!48411 a!2850) index!625))))

(assert (=> d!157783 (validMask!0 mask!2661)))

(assert (=> d!157783 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48411 a!2850) j!87) a!2850 mask!2661) lt!653575)))

(declare-fun e!840689 () SeekEntryResult!12609)

(declare-fun b!1503748 () Bool)

(assert (=> b!1503748 (= e!840689 (seekKeyOrZeroReturnVacant!0 (bvadd x!647 #b00000000000000000000000000000001) (nextIndex!0 index!625 x!647 mask!2661) vacantBefore!10 (select (arr!48411 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1503749 () Bool)

(declare-fun c!139105 () Bool)

(assert (=> b!1503749 (= c!139105 (= lt!653574 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1503749 (= e!840690 e!840689)))

(declare-fun b!1503750 () Bool)

(assert (=> b!1503750 (= e!840689 (MissingVacant!12609 vacantBefore!10))))

(declare-fun b!1503751 () Bool)

(assert (=> b!1503751 (= e!840690 (Found!12609 index!625))))

(declare-fun b!1503752 () Bool)

(assert (=> b!1503752 (= e!840691 Undefined!12609)))

(assert (= (and d!157783 c!139106) b!1503752))

(assert (= (and d!157783 (not c!139106)) b!1503747))

(assert (= (and b!1503747 c!139104) b!1503751))

(assert (= (and b!1503747 (not c!139104)) b!1503749))

(assert (= (and b!1503749 c!139105) b!1503750))

(assert (= (and b!1503749 (not c!139105)) b!1503748))

(declare-fun m!1387017 () Bool)

(assert (=> d!157783 m!1387017))

(declare-fun m!1387019 () Bool)

(assert (=> d!157783 m!1387019))

(assert (=> d!157783 m!1386949))

(assert (=> d!157783 m!1386963))

(assert (=> b!1503748 m!1386947))

(assert (=> b!1503748 m!1386947))

(assert (=> b!1503748 m!1386951))

(declare-fun m!1387021 () Bool)

(assert (=> b!1503748 m!1387021))

(assert (=> b!1503694 d!157783))

(declare-fun b!1503763 () Bool)

(declare-fun e!840702 () Bool)

(declare-fun call!68109 () Bool)

(assert (=> b!1503763 (= e!840702 call!68109)))

(declare-fun b!1503764 () Bool)

(declare-fun e!840700 () Bool)

(declare-fun e!840703 () Bool)

(assert (=> b!1503764 (= e!840700 e!840703)))

(declare-fun res!1024615 () Bool)

(assert (=> b!1503764 (=> (not res!1024615) (not e!840703))))

(declare-fun e!840701 () Bool)

(assert (=> b!1503764 (= res!1024615 (not e!840701))))

(declare-fun res!1024614 () Bool)

(assert (=> b!1503764 (=> (not res!1024614) (not e!840701))))

(assert (=> b!1503764 (= res!1024614 (validKeyInArray!0 (select (arr!48411 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1503765 () Bool)

(assert (=> b!1503765 (= e!840703 e!840702)))

(declare-fun c!139109 () Bool)

(assert (=> b!1503765 (= c!139109 (validKeyInArray!0 (select (arr!48411 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1503766 () Bool)

(assert (=> b!1503766 (= e!840702 call!68109)))

(declare-fun b!1503767 () Bool)

(declare-fun contains!9947 (List!34903 (_ BitVec 64)) Bool)

(assert (=> b!1503767 (= e!840701 (contains!9947 Nil!34900 (select (arr!48411 a!2850) #b00000000000000000000000000000000)))))

(declare-fun bm!68106 () Bool)

(assert (=> bm!68106 (= call!68109 (arrayNoDuplicates!0 a!2850 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139109 (Cons!34899 (select (arr!48411 a!2850) #b00000000000000000000000000000000) Nil!34900) Nil!34900)))))

(declare-fun d!157793 () Bool)

(declare-fun res!1024613 () Bool)

(assert (=> d!157793 (=> res!1024613 e!840700)))

(assert (=> d!157793 (= res!1024613 (bvsge #b00000000000000000000000000000000 (size!48961 a!2850)))))

(assert (=> d!157793 (= (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34900) e!840700)))

(assert (= (and d!157793 (not res!1024613)) b!1503764))

(assert (= (and b!1503764 res!1024614) b!1503767))

(assert (= (and b!1503764 res!1024615) b!1503765))

(assert (= (and b!1503765 c!139109) b!1503763))

(assert (= (and b!1503765 (not c!139109)) b!1503766))

(assert (= (or b!1503763 b!1503766) bm!68106))

(assert (=> b!1503764 m!1387003))

(assert (=> b!1503764 m!1387003))

(assert (=> b!1503764 m!1387011))

(assert (=> b!1503765 m!1387003))

(assert (=> b!1503765 m!1387003))

(assert (=> b!1503765 m!1387011))

(assert (=> b!1503767 m!1387003))

(assert (=> b!1503767 m!1387003))

(declare-fun m!1387023 () Bool)

(assert (=> b!1503767 m!1387023))

(assert (=> bm!68106 m!1387003))

(declare-fun m!1387025 () Bool)

(assert (=> bm!68106 m!1387025))

(assert (=> b!1503695 d!157793))

(declare-fun d!157803 () Bool)

(assert (=> d!157803 (= (validKeyInArray!0 (select (arr!48411 a!2850) i!996)) (and (not (= (select (arr!48411 a!2850) i!996) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48411 a!2850) i!996) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1503690 d!157803))

(declare-fun d!157805 () Bool)

(assert (=> d!157805 (= (validMask!0 mask!2661) (and (or (= mask!2661 #b00000000000000000000000000000111) (= mask!2661 #b00000000000000000000000000001111) (= mask!2661 #b00000000000000000000000000011111) (= mask!2661 #b00000000000000000000000000111111) (= mask!2661 #b00000000000000000000000001111111) (= mask!2661 #b00000000000000000000000011111111) (= mask!2661 #b00000000000000000000000111111111) (= mask!2661 #b00000000000000000000001111111111) (= mask!2661 #b00000000000000000000011111111111) (= mask!2661 #b00000000000000000000111111111111) (= mask!2661 #b00000000000000000001111111111111) (= mask!2661 #b00000000000000000011111111111111) (= mask!2661 #b00000000000000000111111111111111) (= mask!2661 #b00000000000000001111111111111111) (= mask!2661 #b00000000000000011111111111111111) (= mask!2661 #b00000000000000111111111111111111) (= mask!2661 #b00000000000001111111111111111111) (= mask!2661 #b00000000000011111111111111111111) (= mask!2661 #b00000000000111111111111111111111) (= mask!2661 #b00000000001111111111111111111111) (= mask!2661 #b00000000011111111111111111111111) (= mask!2661 #b00000000111111111111111111111111) (= mask!2661 #b00000001111111111111111111111111) (= mask!2661 #b00000011111111111111111111111111) (= mask!2661 #b00000111111111111111111111111111) (= mask!2661 #b00001111111111111111111111111111) (= mask!2661 #b00011111111111111111111111111111) (= mask!2661 #b00111111111111111111111111111111)) (bvsle mask!2661 #b00111111111111111111111111111111)))))

(assert (=> start!127994 d!157805))

(declare-fun d!157807 () Bool)

(assert (=> d!157807 (= (array_inv!37439 a!2850) (bvsge (size!48961 a!2850) #b00000000000000000000000000000000))))

(assert (=> start!127994 d!157807))

(declare-fun d!157809 () Bool)

(declare-fun lt!653590 () (_ BitVec 32))

(assert (=> d!157809 (and (bvsge lt!653590 #b00000000000000000000000000000000) (bvslt lt!653590 (bvadd mask!2661 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!157809 (= lt!653590 (choose!52 index!625 x!647 mask!2661))))

(assert (=> d!157809 (validMask!0 mask!2661)))

(assert (=> d!157809 (= (nextIndex!0 index!625 x!647 mask!2661) lt!653590)))

(declare-fun bs!43175 () Bool)

(assert (= bs!43175 d!157809))

(declare-fun m!1387033 () Bool)

(assert (=> bs!43175 m!1387033))

(assert (=> bs!43175 m!1386963))

(assert (=> b!1503691 d!157809))

(check-sat (not b!1503764) (not bm!68106) (not d!157809) (not b!1503731) (not b!1503748) (not b!1503733) (not d!157783) (not b!1503767) (not b!1503765) (not bm!68103))
(check-sat)
