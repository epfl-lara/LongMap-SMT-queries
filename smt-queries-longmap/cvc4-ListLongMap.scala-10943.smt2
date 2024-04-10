; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127996 () Bool)

(assert start!127996)

(declare-fun res!1024597 () Bool)

(declare-fun e!840672 () Bool)

(assert (=> start!127996 (=> (not res!1024597) (not e!840672))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127996 (= res!1024597 (validMask!0 mask!2661))))

(assert (=> start!127996 e!840672))

(assert (=> start!127996 true))

(declare-datatypes ((array!100311 0))(
  ( (array!100312 (arr!48412 (Array (_ BitVec 32) (_ BitVec 64))) (size!48962 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100311)

(declare-fun array_inv!37440 (array!100311) Bool)

(assert (=> start!127996 (array_inv!37440 a!2850)))

(declare-fun b!1503714 () Bool)

(declare-fun res!1024600 () Bool)

(assert (=> b!1503714 (=> (not res!1024600) (not e!840672))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1503714 (= res!1024600 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48962 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48962 a!2850)) (= (select (arr!48412 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48412 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48962 a!2850))))))

(declare-fun b!1503715 () Bool)

(declare-fun res!1024595 () Bool)

(assert (=> b!1503715 (=> (not res!1024595) (not e!840672))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1503715 (= res!1024595 (not (= (select (arr!48412 a!2850) index!625) (select (arr!48412 a!2850) j!87))))))

(declare-fun b!1503716 () Bool)

(assert (=> b!1503716 (= e!840672 (or (bvslt (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110)))))

(declare-fun lt!653557 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1503716 (= lt!653557 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1503717 () Bool)

(declare-fun res!1024599 () Bool)

(assert (=> b!1503717 (=> (not res!1024599) (not e!840672))))

(assert (=> b!1503717 (= res!1024599 (and (= (size!48962 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48962 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48962 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1503718 () Bool)

(declare-fun res!1024594 () Bool)

(assert (=> b!1503718 (=> (not res!1024594) (not e!840672))))

(declare-datatypes ((SeekEntryResult!12610 0))(
  ( (MissingZero!12610 (index!52832 (_ BitVec 32))) (Found!12610 (index!52833 (_ BitVec 32))) (Intermediate!12610 (undefined!13422 Bool) (index!52834 (_ BitVec 32)) (x!134506 (_ BitVec 32))) (Undefined!12610) (MissingVacant!12610 (index!52835 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100311 (_ BitVec 32)) SeekEntryResult!12610)

(assert (=> b!1503718 (= res!1024594 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48412 a!2850) j!87) a!2850 mask!2661) (Found!12610 j!87)))))

(declare-fun b!1503719 () Bool)

(declare-fun res!1024593 () Bool)

(assert (=> b!1503719 (=> (not res!1024593) (not e!840672))))

(declare-datatypes ((List!34904 0))(
  ( (Nil!34901) (Cons!34900 (h!36297 (_ BitVec 64)) (t!49598 List!34904)) )
))
(declare-fun arrayNoDuplicates!0 (array!100311 (_ BitVec 32) List!34904) Bool)

(assert (=> b!1503719 (= res!1024593 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34901))))

(declare-fun b!1503720 () Bool)

(declare-fun res!1024592 () Bool)

(assert (=> b!1503720 (=> (not res!1024592) (not e!840672))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1503720 (= res!1024592 (validKeyInArray!0 (select (arr!48412 a!2850) j!87)))))

(declare-fun b!1503721 () Bool)

(declare-fun res!1024596 () Bool)

(assert (=> b!1503721 (=> (not res!1024596) (not e!840672))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100311 (_ BitVec 32)) Bool)

(assert (=> b!1503721 (= res!1024596 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1503722 () Bool)

(declare-fun res!1024598 () Bool)

(assert (=> b!1503722 (=> (not res!1024598) (not e!840672))))

(assert (=> b!1503722 (= res!1024598 (validKeyInArray!0 (select (arr!48412 a!2850) i!996)))))

(assert (= (and start!127996 res!1024597) b!1503717))

(assert (= (and b!1503717 res!1024599) b!1503722))

(assert (= (and b!1503722 res!1024598) b!1503720))

(assert (= (and b!1503720 res!1024592) b!1503721))

(assert (= (and b!1503721 res!1024596) b!1503719))

(assert (= (and b!1503719 res!1024593) b!1503714))

(assert (= (and b!1503714 res!1024600) b!1503718))

(assert (= (and b!1503718 res!1024594) b!1503715))

(assert (= (and b!1503715 res!1024595) b!1503716))

(declare-fun m!1386975 () Bool)

(assert (=> b!1503716 m!1386975))

(declare-fun m!1386977 () Bool)

(assert (=> b!1503720 m!1386977))

(assert (=> b!1503720 m!1386977))

(declare-fun m!1386979 () Bool)

(assert (=> b!1503720 m!1386979))

(declare-fun m!1386981 () Bool)

(assert (=> b!1503721 m!1386981))

(declare-fun m!1386983 () Bool)

(assert (=> b!1503722 m!1386983))

(assert (=> b!1503722 m!1386983))

(declare-fun m!1386985 () Bool)

(assert (=> b!1503722 m!1386985))

(declare-fun m!1386987 () Bool)

(assert (=> b!1503719 m!1386987))

(declare-fun m!1386989 () Bool)

(assert (=> start!127996 m!1386989))

(declare-fun m!1386991 () Bool)

(assert (=> start!127996 m!1386991))

(declare-fun m!1386993 () Bool)

(assert (=> b!1503714 m!1386993))

(declare-fun m!1386995 () Bool)

(assert (=> b!1503714 m!1386995))

(declare-fun m!1386997 () Bool)

(assert (=> b!1503714 m!1386997))

(assert (=> b!1503718 m!1386977))

(assert (=> b!1503718 m!1386977))

(declare-fun m!1386999 () Bool)

(assert (=> b!1503718 m!1386999))

(declare-fun m!1387001 () Bool)

(assert (=> b!1503715 m!1387001))

(assert (=> b!1503715 m!1386977))

(push 1)

(assert (not b!1503716))

(assert (not start!127996))

(assert (not b!1503719))

(assert (not b!1503721))

(assert (not b!1503722))

(assert (not b!1503720))

(assert (not b!1503718))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!157785 () Bool)

(declare-fun lt!653569 () (_ BitVec 32))

(assert (=> d!157785 (and (bvsge lt!653569 #b00000000000000000000000000000000) (bvslt lt!653569 (bvadd mask!2661 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!157785 (= lt!653569 (choose!52 index!625 x!647 mask!2661))))

(assert (=> d!157785 (validMask!0 mask!2661)))

(assert (=> d!157785 (= (nextIndex!0 index!625 x!647 mask!2661) lt!653569)))

(declare-fun bs!43174 () Bool)

(assert (= bs!43174 d!157785))

(declare-fun m!1387015 () Bool)

(assert (=> bs!43174 m!1387015))

(assert (=> bs!43174 m!1386989))

(assert (=> b!1503716 d!157785))

(declare-fun d!157789 () Bool)

(assert (=> d!157789 (= (validKeyInArray!0 (select (arr!48412 a!2850) i!996)) (and (not (= (select (arr!48412 a!2850) i!996) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48412 a!2850) i!996) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1503722 d!157789))

(declare-fun d!157791 () Bool)

(assert (=> d!157791 (= (validMask!0 mask!2661) (and (or (= mask!2661 #b00000000000000000000000000000111) (= mask!2661 #b00000000000000000000000000001111) (= mask!2661 #b00000000000000000000000000011111) (= mask!2661 #b00000000000000000000000000111111) (= mask!2661 #b00000000000000000000000001111111) (= mask!2661 #b00000000000000000000000011111111) (= mask!2661 #b00000000000000000000000111111111) (= mask!2661 #b00000000000000000000001111111111) (= mask!2661 #b00000000000000000000011111111111) (= mask!2661 #b00000000000000000000111111111111) (= mask!2661 #b00000000000000000001111111111111) (= mask!2661 #b00000000000000000011111111111111) (= mask!2661 #b00000000000000000111111111111111) (= mask!2661 #b00000000000000001111111111111111) (= mask!2661 #b00000000000000011111111111111111) (= mask!2661 #b00000000000000111111111111111111) (= mask!2661 #b00000000000001111111111111111111) (= mask!2661 #b00000000000011111111111111111111) (= mask!2661 #b00000000000111111111111111111111) (= mask!2661 #b00000000001111111111111111111111) (= mask!2661 #b00000000011111111111111111111111) (= mask!2661 #b00000000111111111111111111111111) (= mask!2661 #b00000001111111111111111111111111) (= mask!2661 #b00000011111111111111111111111111) (= mask!2661 #b00000111111111111111111111111111) (= mask!2661 #b00001111111111111111111111111111) (= mask!2661 #b00011111111111111111111111111111) (= mask!2661 #b00111111111111111111111111111111)) (bvsle mask!2661 #b00111111111111111111111111111111)))))

(assert (=> start!127996 d!157791))

(declare-fun d!157799 () Bool)

(assert (=> d!157799 (= (array_inv!37440 a!2850) (bvsge (size!48962 a!2850) #b00000000000000000000000000000000))))

(assert (=> start!127996 d!157799))

(declare-fun b!1503799 () Bool)

(declare-fun e!840721 () SeekEntryResult!12610)

(assert (=> b!1503799 (= e!840721 (MissingVacant!12610 vacantBefore!10))))

(declare-fun b!1503800 () Bool)

(declare-fun e!840720 () SeekEntryResult!12610)

(declare-fun e!840719 () SeekEntryResult!12610)

(assert (=> b!1503800 (= e!840720 e!840719)))

(declare-fun c!139125 () Bool)

(declare-fun lt!653588 () (_ BitVec 64))

(assert (=> b!1503800 (= c!139125 (= lt!653588 (select (arr!48412 a!2850) j!87)))))

(declare-fun b!1503801 () Bool)

(assert (=> b!1503801 (= e!840721 (seekKeyOrZeroReturnVacant!0 (bvadd x!647 #b00000000000000000000000000000001) (nextIndex!0 index!625 x!647 mask!2661) vacantBefore!10 (select (arr!48412 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1503798 () Bool)

(assert (=> b!1503798 (= e!840719 (Found!12610 index!625))))

(declare-fun lt!653589 () SeekEntryResult!12610)

(declare-fun d!157801 () Bool)

(assert (=> d!157801 (and (or (is-Undefined!12610 lt!653589) (not (is-Found!12610 lt!653589)) (and (bvsge (index!52833 lt!653589) #b00000000000000000000000000000000) (bvslt (index!52833 lt!653589) (size!48962 a!2850)))) (or (is-Undefined!12610 lt!653589) (is-Found!12610 lt!653589) (not (is-MissingVacant!12610 lt!653589)) (not (= (index!52835 lt!653589) vacantBefore!10)) (and (bvsge (index!52835 lt!653589) #b00000000000000000000000000000000) (bvslt (index!52835 lt!653589) (size!48962 a!2850)))) (or (is-Undefined!12610 lt!653589) (ite (is-Found!12610 lt!653589) (= (select (arr!48412 a!2850) (index!52833 lt!653589)) (select (arr!48412 a!2850) j!87)) (and (is-MissingVacant!12610 lt!653589) (= (index!52835 lt!653589) vacantBefore!10) (= (select (arr!48412 a!2850) (index!52835 lt!653589)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!157801 (= lt!653589 e!840720)))

(declare-fun c!139126 () Bool)

(assert (=> d!157801 (= c!139126 (bvsge x!647 #b01111111111111111111111111111110))))

(assert (=> d!157801 (= lt!653588 (select (arr!48412 a!2850) index!625))))

(assert (=> d!157801 (validMask!0 mask!2661)))

(assert (=> d!157801 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48412 a!2850) j!87) a!2850 mask!2661) lt!653589)))

(declare-fun b!1503802 () Bool)

(declare-fun c!139127 () Bool)

(assert (=> b!1503802 (= c!139127 (= lt!653588 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1503802 (= e!840719 e!840721)))

(declare-fun b!1503803 () Bool)

(assert (=> b!1503803 (= e!840720 Undefined!12610)))

(assert (= (and d!157801 c!139126) b!1503803))

(assert (= (and d!157801 (not c!139126)) b!1503800))

(assert (= (and b!1503800 c!139125) b!1503798))

(assert (= (and b!1503800 (not c!139125)) b!1503802))

(assert (= (and b!1503802 c!139127) b!1503799))

(assert (= (and b!1503802 (not c!139127)) b!1503801))

(assert (=> b!1503801 m!1386975))

(assert (=> b!1503801 m!1386975))

(assert (=> b!1503801 m!1386977))

(declare-fun m!1387035 () Bool)

(assert (=> b!1503801 m!1387035))

(declare-fun m!1387037 () Bool)

(assert (=> d!157801 m!1387037))

(declare-fun m!1387039 () Bool)

(assert (=> d!157801 m!1387039))

(assert (=> d!157801 m!1387001))

(assert (=> d!157801 m!1386989))

(assert (=> b!1503718 d!157801))

(declare-fun b!1503822 () Bool)

(declare-fun e!840739 () Bool)

(declare-fun e!840738 () Bool)

(assert (=> b!1503822 (= e!840739 e!840738)))

(declare-fun res!1024628 () Bool)

(assert (=> b!1503822 (=> (not res!1024628) (not e!840738))))

(declare-fun e!840736 () Bool)

(assert (=> b!1503822 (= res!1024628 (not e!840736))))

(declare-fun res!1024627 () Bool)

(assert (=> b!1503822 (=> (not res!1024627) (not e!840736))))

(assert (=> b!1503822 (= res!1024627 (validKeyInArray!0 (select (arr!48412 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1503823 () Bool)

(declare-fun e!840737 () Bool)

(assert (=> b!1503823 (= e!840738 e!840737)))

(declare-fun c!139132 () Bool)

(assert (=> b!1503823 (= c!139132 (validKeyInArray!0 (select (arr!48412 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1503824 () Bool)

(declare-fun contains!9948 (List!34904 (_ BitVec 64)) Bool)

(assert (=> b!1503824 (= e!840736 (contains!9948 Nil!34901 (select (arr!48412 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1503826 () Bool)

(declare-fun call!68114 () Bool)

(assert (=> b!1503826 (= e!840737 call!68114)))

(declare-fun bm!68111 () Bool)

(assert (=> bm!68111 (= call!68114 (arrayNoDuplicates!0 a!2850 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139132 (Cons!34900 (select (arr!48412 a!2850) #b00000000000000000000000000000000) Nil!34901) Nil!34901)))))

(declare-fun d!157813 () Bool)

(declare-fun res!1024626 () Bool)

(assert (=> d!157813 (=> res!1024626 e!840739)))

(assert (=> d!157813 (= res!1024626 (bvsge #b00000000000000000000000000000000 (size!48962 a!2850)))))

(assert (=> d!157813 (= (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34901) e!840739)))

(declare-fun b!1503825 () Bool)

(assert (=> b!1503825 (= e!840737 call!68114)))

(assert (= (and d!157813 (not res!1024626)) b!1503822))

(assert (= (and b!1503822 res!1024627) b!1503824))

(assert (= (and b!1503822 res!1024628) b!1503823))

(assert (= (and b!1503823 c!139132) b!1503825))

(assert (= (and b!1503823 (not c!139132)) b!1503826))

(assert (= (or b!1503825 b!1503826) bm!68111))

(declare-fun m!1387041 () Bool)

(assert (=> b!1503822 m!1387041))

(assert (=> b!1503822 m!1387041))

(declare-fun m!1387043 () Bool)

(assert (=> b!1503822 m!1387043))

(assert (=> b!1503823 m!1387041))

