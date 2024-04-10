; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128120 () Bool)

(assert start!128120)

(declare-fun b!1504529 () Bool)

(declare-fun res!1025230 () Bool)

(declare-fun e!840985 () Bool)

(assert (=> b!1504529 (=> (not res!1025230) (not e!840985))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100357 0))(
  ( (array!100358 (arr!48432 (Array (_ BitVec 32) (_ BitVec 64))) (size!48982 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100357)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1504529 (= res!1025230 (and (= (size!48982 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48982 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48982 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1504531 () Bool)

(declare-fun res!1025234 () Bool)

(assert (=> b!1504531 (=> (not res!1025234) (not e!840985))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1504531 (= res!1025234 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48982 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48982 a!2850)) (= (select (arr!48432 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48432 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48982 a!2850))))))

(declare-fun b!1504532 () Bool)

(declare-fun res!1025231 () Bool)

(assert (=> b!1504532 (=> (not res!1025231) (not e!840985))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1504532 (= res!1025231 (validKeyInArray!0 (select (arr!48432 a!2850) j!87)))))

(declare-fun b!1504533 () Bool)

(declare-fun res!1025233 () Bool)

(assert (=> b!1504533 (=> (not res!1025233) (not e!840985))))

(assert (=> b!1504533 (= res!1025233 (validKeyInArray!0 (select (arr!48432 a!2850) i!996)))))

(declare-fun b!1504534 () Bool)

(declare-fun res!1025228 () Bool)

(assert (=> b!1504534 (=> (not res!1025228) (not e!840985))))

(declare-datatypes ((List!34924 0))(
  ( (Nil!34921) (Cons!34920 (h!36317 (_ BitVec 64)) (t!49618 List!34924)) )
))
(declare-fun arrayNoDuplicates!0 (array!100357 (_ BitVec 32) List!34924) Bool)

(assert (=> b!1504534 (= res!1025228 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34921))))

(declare-fun b!1504535 () Bool)

(declare-fun res!1025227 () Bool)

(assert (=> b!1504535 (=> (not res!1025227) (not e!840985))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100357 (_ BitVec 32)) Bool)

(assert (=> b!1504535 (= res!1025227 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1504536 () Bool)

(declare-fun e!840982 () Bool)

(assert (=> b!1504536 (= e!840985 e!840982)))

(declare-fun res!1025236 () Bool)

(assert (=> b!1504536 (=> (not res!1025236) (not e!840982))))

(declare-datatypes ((SeekEntryResult!12630 0))(
  ( (MissingZero!12630 (index!52912 (_ BitVec 32))) (Found!12630 (index!52913 (_ BitVec 32))) (Intermediate!12630 (undefined!13442 Bool) (index!52914 (_ BitVec 32)) (x!134594 (_ BitVec 32))) (Undefined!12630) (MissingVacant!12630 (index!52915 (_ BitVec 32))) )
))
(declare-fun lt!653731 () SeekEntryResult!12630)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100357 (_ BitVec 32)) SeekEntryResult!12630)

(assert (=> b!1504536 (= res!1025236 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48432 a!2850) j!87) a!2850 mask!2661) lt!653731))))

(assert (=> b!1504536 (= lt!653731 (Found!12630 j!87))))

(declare-fun b!1504537 () Bool)

(declare-fun lt!653730 () (_ BitVec 32))

(declare-fun e!840984 () Bool)

(assert (=> b!1504537 (= e!840984 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653730 vacantBefore!10 (select (arr!48432 a!2850) j!87) a!2850 mask!2661) lt!653731)))))

(declare-fun b!1504538 () Bool)

(declare-fun res!1025229 () Bool)

(assert (=> b!1504538 (=> (not res!1025229) (not e!840982))))

(assert (=> b!1504538 (= res!1025229 (not (= (select (arr!48432 a!2850) index!625) (select (arr!48432 a!2850) j!87))))))

(declare-fun b!1504530 () Bool)

(assert (=> b!1504530 (= e!840982 e!840984)))

(declare-fun res!1025235 () Bool)

(assert (=> b!1504530 (=> (not res!1025235) (not e!840984))))

(assert (=> b!1504530 (= res!1025235 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653730 #b00000000000000000000000000000000) (bvslt lt!653730 (size!48982 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1504530 (= lt!653730 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun res!1025232 () Bool)

(assert (=> start!128120 (=> (not res!1025232) (not e!840985))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128120 (= res!1025232 (validMask!0 mask!2661))))

(assert (=> start!128120 e!840985))

(assert (=> start!128120 true))

(declare-fun array_inv!37460 (array!100357) Bool)

(assert (=> start!128120 (array_inv!37460 a!2850)))

(assert (= (and start!128120 res!1025232) b!1504529))

(assert (= (and b!1504529 res!1025230) b!1504533))

(assert (= (and b!1504533 res!1025233) b!1504532))

(assert (= (and b!1504532 res!1025231) b!1504535))

(assert (= (and b!1504535 res!1025227) b!1504534))

(assert (= (and b!1504534 res!1025228) b!1504531))

(assert (= (and b!1504531 res!1025234) b!1504536))

(assert (= (and b!1504536 res!1025236) b!1504538))

(assert (= (and b!1504538 res!1025229) b!1504530))

(assert (= (and b!1504530 res!1025235) b!1504537))

(declare-fun m!1387681 () Bool)

(assert (=> b!1504532 m!1387681))

(assert (=> b!1504532 m!1387681))

(declare-fun m!1387683 () Bool)

(assert (=> b!1504532 m!1387683))

(declare-fun m!1387685 () Bool)

(assert (=> b!1504534 m!1387685))

(assert (=> b!1504536 m!1387681))

(assert (=> b!1504536 m!1387681))

(declare-fun m!1387687 () Bool)

(assert (=> b!1504536 m!1387687))

(declare-fun m!1387689 () Bool)

(assert (=> b!1504531 m!1387689))

(declare-fun m!1387691 () Bool)

(assert (=> b!1504531 m!1387691))

(declare-fun m!1387693 () Bool)

(assert (=> b!1504531 m!1387693))

(declare-fun m!1387695 () Bool)

(assert (=> b!1504538 m!1387695))

(assert (=> b!1504538 m!1387681))

(assert (=> b!1504537 m!1387681))

(assert (=> b!1504537 m!1387681))

(declare-fun m!1387697 () Bool)

(assert (=> b!1504537 m!1387697))

(declare-fun m!1387699 () Bool)

(assert (=> b!1504533 m!1387699))

(assert (=> b!1504533 m!1387699))

(declare-fun m!1387701 () Bool)

(assert (=> b!1504533 m!1387701))

(declare-fun m!1387703 () Bool)

(assert (=> b!1504535 m!1387703))

(declare-fun m!1387705 () Bool)

(assert (=> start!128120 m!1387705))

(declare-fun m!1387707 () Bool)

(assert (=> start!128120 m!1387707))

(declare-fun m!1387709 () Bool)

(assert (=> b!1504530 m!1387709))

(check-sat (not start!128120) (not b!1504532) (not b!1504534) (not b!1504530) (not b!1504536) (not b!1504533) (not b!1504537) (not b!1504535))
(check-sat)
(get-model)

(declare-fun b!1504581 () Bool)

(declare-fun e!841005 () SeekEntryResult!12630)

(declare-fun e!841004 () SeekEntryResult!12630)

(assert (=> b!1504581 (= e!841005 e!841004)))

(declare-fun lt!653743 () (_ BitVec 64))

(declare-fun c!139192 () Bool)

(assert (=> b!1504581 (= c!139192 (= lt!653743 (select (arr!48432 a!2850) j!87)))))

(declare-fun b!1504582 () Bool)

(assert (=> b!1504582 (= e!841004 (Found!12630 index!625))))

(declare-fun b!1504583 () Bool)

(declare-fun e!841006 () SeekEntryResult!12630)

(assert (=> b!1504583 (= e!841006 (seekKeyOrZeroReturnVacant!0 (bvadd x!647 #b00000000000000000000000000000001) (nextIndex!0 index!625 x!647 mask!2661) vacantBefore!10 (select (arr!48432 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1504584 () Bool)

(assert (=> b!1504584 (= e!841006 (MissingVacant!12630 vacantBefore!10))))

(declare-fun d!157889 () Bool)

(declare-fun lt!653742 () SeekEntryResult!12630)

(get-info :version)

(assert (=> d!157889 (and (or ((_ is Undefined!12630) lt!653742) (not ((_ is Found!12630) lt!653742)) (and (bvsge (index!52913 lt!653742) #b00000000000000000000000000000000) (bvslt (index!52913 lt!653742) (size!48982 a!2850)))) (or ((_ is Undefined!12630) lt!653742) ((_ is Found!12630) lt!653742) (not ((_ is MissingVacant!12630) lt!653742)) (not (= (index!52915 lt!653742) vacantBefore!10)) (and (bvsge (index!52915 lt!653742) #b00000000000000000000000000000000) (bvslt (index!52915 lt!653742) (size!48982 a!2850)))) (or ((_ is Undefined!12630) lt!653742) (ite ((_ is Found!12630) lt!653742) (= (select (arr!48432 a!2850) (index!52913 lt!653742)) (select (arr!48432 a!2850) j!87)) (and ((_ is MissingVacant!12630) lt!653742) (= (index!52915 lt!653742) vacantBefore!10) (= (select (arr!48432 a!2850) (index!52915 lt!653742)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!157889 (= lt!653742 e!841005)))

(declare-fun c!139191 () Bool)

(assert (=> d!157889 (= c!139191 (bvsge x!647 #b01111111111111111111111111111110))))

(assert (=> d!157889 (= lt!653743 (select (arr!48432 a!2850) index!625))))

(assert (=> d!157889 (validMask!0 mask!2661)))

(assert (=> d!157889 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48432 a!2850) j!87) a!2850 mask!2661) lt!653742)))

(declare-fun b!1504585 () Bool)

(assert (=> b!1504585 (= e!841005 Undefined!12630)))

(declare-fun b!1504586 () Bool)

(declare-fun c!139193 () Bool)

(assert (=> b!1504586 (= c!139193 (= lt!653743 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1504586 (= e!841004 e!841006)))

(assert (= (and d!157889 c!139191) b!1504585))

(assert (= (and d!157889 (not c!139191)) b!1504581))

(assert (= (and b!1504581 c!139192) b!1504582))

(assert (= (and b!1504581 (not c!139192)) b!1504586))

(assert (= (and b!1504586 c!139193) b!1504584))

(assert (= (and b!1504586 (not c!139193)) b!1504583))

(assert (=> b!1504583 m!1387709))

(assert (=> b!1504583 m!1387709))

(assert (=> b!1504583 m!1387681))

(declare-fun m!1387741 () Bool)

(assert (=> b!1504583 m!1387741))

(declare-fun m!1387743 () Bool)

(assert (=> d!157889 m!1387743))

(declare-fun m!1387745 () Bool)

(assert (=> d!157889 m!1387745))

(assert (=> d!157889 m!1387695))

(assert (=> d!157889 m!1387705))

(assert (=> b!1504536 d!157889))

(declare-fun d!157891 () Bool)

(declare-fun lt!653746 () (_ BitVec 32))

(assert (=> d!157891 (and (bvsge lt!653746 #b00000000000000000000000000000000) (bvslt lt!653746 (bvadd mask!2661 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!157891 (= lt!653746 (choose!52 index!625 x!647 mask!2661))))

(assert (=> d!157891 (validMask!0 mask!2661)))

(assert (=> d!157891 (= (nextIndex!0 index!625 x!647 mask!2661) lt!653746)))

(declare-fun bs!43201 () Bool)

(assert (= bs!43201 d!157891))

(declare-fun m!1387747 () Bool)

(assert (=> bs!43201 m!1387747))

(assert (=> bs!43201 m!1387705))

(assert (=> b!1504530 d!157891))

(declare-fun d!157893 () Bool)

(declare-fun res!1025271 () Bool)

(declare-fun e!841015 () Bool)

(assert (=> d!157893 (=> res!1025271 e!841015)))

(assert (=> d!157893 (= res!1025271 (bvsge #b00000000000000000000000000000000 (size!48982 a!2850)))))

(assert (=> d!157893 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661) e!841015)))

(declare-fun b!1504595 () Bool)

(declare-fun e!841013 () Bool)

(assert (=> b!1504595 (= e!841015 e!841013)))

(declare-fun c!139196 () Bool)

(assert (=> b!1504595 (= c!139196 (validKeyInArray!0 (select (arr!48432 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1504596 () Bool)

(declare-fun call!68142 () Bool)

(assert (=> b!1504596 (= e!841013 call!68142)))

(declare-fun bm!68139 () Bool)

(assert (=> bm!68139 (= call!68142 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2850 mask!2661))))

(declare-fun b!1504597 () Bool)

(declare-fun e!841014 () Bool)

(assert (=> b!1504597 (= e!841014 call!68142)))

(declare-fun b!1504598 () Bool)

(assert (=> b!1504598 (= e!841013 e!841014)))

(declare-fun lt!653756 () (_ BitVec 64))

(assert (=> b!1504598 (= lt!653756 (select (arr!48432 a!2850) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50272 0))(
  ( (Unit!50273) )
))
(declare-fun lt!653758 () Unit!50272)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100357 (_ BitVec 64) (_ BitVec 32)) Unit!50272)

(assert (=> b!1504598 (= lt!653758 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2850 lt!653756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100357 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1504598 (arrayContainsKey!0 a!2850 lt!653756 #b00000000000000000000000000000000)))

(declare-fun lt!653757 () Unit!50272)

(assert (=> b!1504598 (= lt!653757 lt!653758)))

(declare-fun res!1025272 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100357 (_ BitVec 32)) SeekEntryResult!12630)

(assert (=> b!1504598 (= res!1025272 (= (seekEntryOrOpen!0 (select (arr!48432 a!2850) #b00000000000000000000000000000000) a!2850 mask!2661) (Found!12630 #b00000000000000000000000000000000)))))

(assert (=> b!1504598 (=> (not res!1025272) (not e!841014))))

(assert (= (and d!157893 (not res!1025271)) b!1504595))

(assert (= (and b!1504595 c!139196) b!1504598))

(assert (= (and b!1504595 (not c!139196)) b!1504596))

(assert (= (and b!1504598 res!1025272) b!1504597))

(assert (= (or b!1504597 b!1504596) bm!68139))

(declare-fun m!1387751 () Bool)

(assert (=> b!1504595 m!1387751))

(assert (=> b!1504595 m!1387751))

(declare-fun m!1387753 () Bool)

(assert (=> b!1504595 m!1387753))

(declare-fun m!1387755 () Bool)

(assert (=> bm!68139 m!1387755))

(assert (=> b!1504598 m!1387751))

(declare-fun m!1387757 () Bool)

(assert (=> b!1504598 m!1387757))

(declare-fun m!1387759 () Bool)

(assert (=> b!1504598 m!1387759))

(assert (=> b!1504598 m!1387751))

(declare-fun m!1387761 () Bool)

(assert (=> b!1504598 m!1387761))

(assert (=> b!1504535 d!157893))

(declare-fun d!157909 () Bool)

(assert (=> d!157909 (= (validKeyInArray!0 (select (arr!48432 a!2850) j!87)) (and (not (= (select (arr!48432 a!2850) j!87) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48432 a!2850) j!87) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1504532 d!157909))

(declare-fun b!1504599 () Bool)

(declare-fun e!841017 () SeekEntryResult!12630)

(declare-fun e!841016 () SeekEntryResult!12630)

(assert (=> b!1504599 (= e!841017 e!841016)))

(declare-fun lt!653760 () (_ BitVec 64))

(declare-fun c!139198 () Bool)

(assert (=> b!1504599 (= c!139198 (= lt!653760 (select (arr!48432 a!2850) j!87)))))

(declare-fun b!1504600 () Bool)

(assert (=> b!1504600 (= e!841016 (Found!12630 lt!653730))))

(declare-fun b!1504601 () Bool)

(declare-fun e!841018 () SeekEntryResult!12630)

(assert (=> b!1504601 (= e!841018 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647 #b00000000000000000000000000000001) (nextIndex!0 lt!653730 (bvadd #b00000000000000000000000000000001 x!647) mask!2661) vacantBefore!10 (select (arr!48432 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1504602 () Bool)

(assert (=> b!1504602 (= e!841018 (MissingVacant!12630 vacantBefore!10))))

(declare-fun lt!653759 () SeekEntryResult!12630)

(declare-fun d!157911 () Bool)

(assert (=> d!157911 (and (or ((_ is Undefined!12630) lt!653759) (not ((_ is Found!12630) lt!653759)) (and (bvsge (index!52913 lt!653759) #b00000000000000000000000000000000) (bvslt (index!52913 lt!653759) (size!48982 a!2850)))) (or ((_ is Undefined!12630) lt!653759) ((_ is Found!12630) lt!653759) (not ((_ is MissingVacant!12630) lt!653759)) (not (= (index!52915 lt!653759) vacantBefore!10)) (and (bvsge (index!52915 lt!653759) #b00000000000000000000000000000000) (bvslt (index!52915 lt!653759) (size!48982 a!2850)))) (or ((_ is Undefined!12630) lt!653759) (ite ((_ is Found!12630) lt!653759) (= (select (arr!48432 a!2850) (index!52913 lt!653759)) (select (arr!48432 a!2850) j!87)) (and ((_ is MissingVacant!12630) lt!653759) (= (index!52915 lt!653759) vacantBefore!10) (= (select (arr!48432 a!2850) (index!52915 lt!653759)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!157911 (= lt!653759 e!841017)))

(declare-fun c!139197 () Bool)

(assert (=> d!157911 (= c!139197 (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110))))

(assert (=> d!157911 (= lt!653760 (select (arr!48432 a!2850) lt!653730))))

(assert (=> d!157911 (validMask!0 mask!2661)))

(assert (=> d!157911 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653730 vacantBefore!10 (select (arr!48432 a!2850) j!87) a!2850 mask!2661) lt!653759)))

(declare-fun b!1504603 () Bool)

(assert (=> b!1504603 (= e!841017 Undefined!12630)))

(declare-fun b!1504604 () Bool)

(declare-fun c!139199 () Bool)

(assert (=> b!1504604 (= c!139199 (= lt!653760 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1504604 (= e!841016 e!841018)))

(assert (= (and d!157911 c!139197) b!1504603))

(assert (= (and d!157911 (not c!139197)) b!1504599))

(assert (= (and b!1504599 c!139198) b!1504600))

(assert (= (and b!1504599 (not c!139198)) b!1504604))

(assert (= (and b!1504604 c!139199) b!1504602))

(assert (= (and b!1504604 (not c!139199)) b!1504601))

(declare-fun m!1387763 () Bool)

(assert (=> b!1504601 m!1387763))

(assert (=> b!1504601 m!1387763))

(assert (=> b!1504601 m!1387681))

(declare-fun m!1387765 () Bool)

(assert (=> b!1504601 m!1387765))

(declare-fun m!1387767 () Bool)

(assert (=> d!157911 m!1387767))

(declare-fun m!1387769 () Bool)

(assert (=> d!157911 m!1387769))

(declare-fun m!1387771 () Bool)

(assert (=> d!157911 m!1387771))

(assert (=> d!157911 m!1387705))

(assert (=> b!1504537 d!157911))

(declare-fun d!157913 () Bool)

(assert (=> d!157913 (= (validKeyInArray!0 (select (arr!48432 a!2850) i!996)) (and (not (= (select (arr!48432 a!2850) i!996) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48432 a!2850) i!996) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1504533 d!157913))

(declare-fun d!157915 () Bool)

(assert (=> d!157915 (= (validMask!0 mask!2661) (and (or (= mask!2661 #b00000000000000000000000000000111) (= mask!2661 #b00000000000000000000000000001111) (= mask!2661 #b00000000000000000000000000011111) (= mask!2661 #b00000000000000000000000000111111) (= mask!2661 #b00000000000000000000000001111111) (= mask!2661 #b00000000000000000000000011111111) (= mask!2661 #b00000000000000000000000111111111) (= mask!2661 #b00000000000000000000001111111111) (= mask!2661 #b00000000000000000000011111111111) (= mask!2661 #b00000000000000000000111111111111) (= mask!2661 #b00000000000000000001111111111111) (= mask!2661 #b00000000000000000011111111111111) (= mask!2661 #b00000000000000000111111111111111) (= mask!2661 #b00000000000000001111111111111111) (= mask!2661 #b00000000000000011111111111111111) (= mask!2661 #b00000000000000111111111111111111) (= mask!2661 #b00000000000001111111111111111111) (= mask!2661 #b00000000000011111111111111111111) (= mask!2661 #b00000000000111111111111111111111) (= mask!2661 #b00000000001111111111111111111111) (= mask!2661 #b00000000011111111111111111111111) (= mask!2661 #b00000000111111111111111111111111) (= mask!2661 #b00000001111111111111111111111111) (= mask!2661 #b00000011111111111111111111111111) (= mask!2661 #b00000111111111111111111111111111) (= mask!2661 #b00001111111111111111111111111111) (= mask!2661 #b00011111111111111111111111111111) (= mask!2661 #b00111111111111111111111111111111)) (bvsle mask!2661 #b00111111111111111111111111111111)))))

(assert (=> start!128120 d!157915))

(declare-fun d!157923 () Bool)

(assert (=> d!157923 (= (array_inv!37460 a!2850) (bvsge (size!48982 a!2850) #b00000000000000000000000000000000))))

(assert (=> start!128120 d!157923))

(declare-fun b!1504660 () Bool)

(declare-fun e!841057 () Bool)

(declare-fun contains!9952 (List!34924 (_ BitVec 64)) Bool)

(assert (=> b!1504660 (= e!841057 (contains!9952 Nil!34921 (select (arr!48432 a!2850) #b00000000000000000000000000000000)))))

(declare-fun d!157925 () Bool)

(declare-fun res!1025288 () Bool)

(declare-fun e!841055 () Bool)

(assert (=> d!157925 (=> res!1025288 e!841055)))

(assert (=> d!157925 (= res!1025288 (bvsge #b00000000000000000000000000000000 (size!48982 a!2850)))))

(assert (=> d!157925 (= (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34921) e!841055)))

(declare-fun bm!68145 () Bool)

(declare-fun call!68148 () Bool)

(declare-fun c!139220 () Bool)

(assert (=> bm!68145 (= call!68148 (arrayNoDuplicates!0 a!2850 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139220 (Cons!34920 (select (arr!48432 a!2850) #b00000000000000000000000000000000) Nil!34921) Nil!34921)))))

(declare-fun b!1504661 () Bool)

(declare-fun e!841056 () Bool)

(assert (=> b!1504661 (= e!841056 call!68148)))

(declare-fun b!1504662 () Bool)

(declare-fun e!841054 () Bool)

(assert (=> b!1504662 (= e!841055 e!841054)))

(declare-fun res!1025289 () Bool)

(assert (=> b!1504662 (=> (not res!1025289) (not e!841054))))

(assert (=> b!1504662 (= res!1025289 (not e!841057))))

(declare-fun res!1025290 () Bool)

(assert (=> b!1504662 (=> (not res!1025290) (not e!841057))))

(assert (=> b!1504662 (= res!1025290 (validKeyInArray!0 (select (arr!48432 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1504663 () Bool)

(assert (=> b!1504663 (= e!841056 call!68148)))

(declare-fun b!1504664 () Bool)

(assert (=> b!1504664 (= e!841054 e!841056)))

(assert (=> b!1504664 (= c!139220 (validKeyInArray!0 (select (arr!48432 a!2850) #b00000000000000000000000000000000)))))

(assert (= (and d!157925 (not res!1025288)) b!1504662))

(assert (= (and b!1504662 res!1025290) b!1504660))

(assert (= (and b!1504662 res!1025289) b!1504664))

(assert (= (and b!1504664 c!139220) b!1504663))

(assert (= (and b!1504664 (not c!139220)) b!1504661))

(assert (= (or b!1504663 b!1504661) bm!68145))

(assert (=> b!1504660 m!1387751))

(assert (=> b!1504660 m!1387751))

(declare-fun m!1387791 () Bool)

(assert (=> b!1504660 m!1387791))

(assert (=> bm!68145 m!1387751))

(declare-fun m!1387793 () Bool)

(assert (=> bm!68145 m!1387793))

(assert (=> b!1504662 m!1387751))

(assert (=> b!1504662 m!1387751))

(assert (=> b!1504662 m!1387753))

(assert (=> b!1504664 m!1387751))

(assert (=> b!1504664 m!1387751))

(assert (=> b!1504664 m!1387753))

(assert (=> b!1504534 d!157925))

(check-sat (not d!157891) (not b!1504660) (not bm!68145) (not b!1504601) (not b!1504595) (not b!1504664) (not b!1504662) (not d!157889) (not b!1504598) (not b!1504583) (not d!157911) (not bm!68139))
(check-sat)
