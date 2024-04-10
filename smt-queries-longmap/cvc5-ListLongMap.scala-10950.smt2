; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128118 () Bool)

(assert start!128118)

(declare-fun b!1504499 () Bool)

(declare-fun e!840973 () Bool)

(declare-fun e!840972 () Bool)

(assert (=> b!1504499 (= e!840973 e!840972)))

(declare-fun res!1025203 () Bool)

(assert (=> b!1504499 (=> (not res!1025203) (not e!840972))))

(declare-datatypes ((array!100355 0))(
  ( (array!100356 (arr!48431 (Array (_ BitVec 32) (_ BitVec 64))) (size!48981 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100355)

(declare-fun lt!653724 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(assert (=> b!1504499 (= res!1025203 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653724 #b00000000000000000000000000000000) (bvslt lt!653724 (size!48981 a!2850))))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1504499 (= lt!653724 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1504500 () Bool)

(declare-fun res!1025197 () Bool)

(declare-fun e!840970 () Bool)

(assert (=> b!1504500 (=> (not res!1025197) (not e!840970))))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1504500 (= res!1025197 (validKeyInArray!0 (select (arr!48431 a!2850) j!87)))))

(declare-datatypes ((SeekEntryResult!12629 0))(
  ( (MissingZero!12629 (index!52908 (_ BitVec 32))) (Found!12629 (index!52909 (_ BitVec 32))) (Intermediate!12629 (undefined!13441 Bool) (index!52910 (_ BitVec 32)) (x!134593 (_ BitVec 32))) (Undefined!12629) (MissingVacant!12629 (index!52911 (_ BitVec 32))) )
))
(declare-fun lt!653725 () SeekEntryResult!12629)

(declare-fun b!1504501 () Bool)

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100355 (_ BitVec 32)) SeekEntryResult!12629)

(assert (=> b!1504501 (= e!840972 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653724 vacantBefore!10 (select (arr!48431 a!2850) j!87) a!2850 mask!2661) lt!653725)))))

(declare-fun b!1504502 () Bool)

(declare-fun res!1025202 () Bool)

(assert (=> b!1504502 (=> (not res!1025202) (not e!840973))))

(assert (=> b!1504502 (= res!1025202 (not (= (select (arr!48431 a!2850) index!625) (select (arr!48431 a!2850) j!87))))))

(declare-fun b!1504503 () Bool)

(declare-fun res!1025206 () Bool)

(assert (=> b!1504503 (=> (not res!1025206) (not e!840970))))

(declare-datatypes ((List!34923 0))(
  ( (Nil!34920) (Cons!34919 (h!36316 (_ BitVec 64)) (t!49617 List!34923)) )
))
(declare-fun arrayNoDuplicates!0 (array!100355 (_ BitVec 32) List!34923) Bool)

(assert (=> b!1504503 (= res!1025206 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34920))))

(declare-fun b!1504504 () Bool)

(declare-fun res!1025199 () Bool)

(assert (=> b!1504504 (=> (not res!1025199) (not e!840970))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1504504 (= res!1025199 (and (= (size!48981 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48981 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48981 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1504505 () Bool)

(assert (=> b!1504505 (= e!840970 e!840973)))

(declare-fun res!1025200 () Bool)

(assert (=> b!1504505 (=> (not res!1025200) (not e!840973))))

(assert (=> b!1504505 (= res!1025200 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48431 a!2850) j!87) a!2850 mask!2661) lt!653725))))

(assert (=> b!1504505 (= lt!653725 (Found!12629 j!87))))

(declare-fun res!1025198 () Bool)

(assert (=> start!128118 (=> (not res!1025198) (not e!840970))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128118 (= res!1025198 (validMask!0 mask!2661))))

(assert (=> start!128118 e!840970))

(assert (=> start!128118 true))

(declare-fun array_inv!37459 (array!100355) Bool)

(assert (=> start!128118 (array_inv!37459 a!2850)))

(declare-fun b!1504506 () Bool)

(declare-fun res!1025205 () Bool)

(assert (=> b!1504506 (=> (not res!1025205) (not e!840970))))

(assert (=> b!1504506 (= res!1025205 (validKeyInArray!0 (select (arr!48431 a!2850) i!996)))))

(declare-fun b!1504507 () Bool)

(declare-fun res!1025204 () Bool)

(assert (=> b!1504507 (=> (not res!1025204) (not e!840970))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100355 (_ BitVec 32)) Bool)

(assert (=> b!1504507 (= res!1025204 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1504508 () Bool)

(declare-fun res!1025201 () Bool)

(assert (=> b!1504508 (=> (not res!1025201) (not e!840970))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1504508 (= res!1025201 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48981 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48981 a!2850)) (= (select (arr!48431 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48431 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48981 a!2850))))))

(assert (= (and start!128118 res!1025198) b!1504504))

(assert (= (and b!1504504 res!1025199) b!1504506))

(assert (= (and b!1504506 res!1025205) b!1504500))

(assert (= (and b!1504500 res!1025197) b!1504507))

(assert (= (and b!1504507 res!1025204) b!1504503))

(assert (= (and b!1504503 res!1025206) b!1504508))

(assert (= (and b!1504508 res!1025201) b!1504505))

(assert (= (and b!1504505 res!1025200) b!1504502))

(assert (= (and b!1504502 res!1025202) b!1504499))

(assert (= (and b!1504499 res!1025203) b!1504501))

(declare-fun m!1387651 () Bool)

(assert (=> b!1504501 m!1387651))

(assert (=> b!1504501 m!1387651))

(declare-fun m!1387653 () Bool)

(assert (=> b!1504501 m!1387653))

(declare-fun m!1387655 () Bool)

(assert (=> b!1504502 m!1387655))

(assert (=> b!1504502 m!1387651))

(declare-fun m!1387657 () Bool)

(assert (=> b!1504503 m!1387657))

(declare-fun m!1387659 () Bool)

(assert (=> b!1504507 m!1387659))

(declare-fun m!1387661 () Bool)

(assert (=> b!1504508 m!1387661))

(declare-fun m!1387663 () Bool)

(assert (=> b!1504508 m!1387663))

(declare-fun m!1387665 () Bool)

(assert (=> b!1504508 m!1387665))

(assert (=> b!1504505 m!1387651))

(assert (=> b!1504505 m!1387651))

(declare-fun m!1387667 () Bool)

(assert (=> b!1504505 m!1387667))

(declare-fun m!1387669 () Bool)

(assert (=> start!128118 m!1387669))

(declare-fun m!1387671 () Bool)

(assert (=> start!128118 m!1387671))

(declare-fun m!1387673 () Bool)

(assert (=> b!1504499 m!1387673))

(declare-fun m!1387675 () Bool)

(assert (=> b!1504506 m!1387675))

(assert (=> b!1504506 m!1387675))

(declare-fun m!1387677 () Bool)

(assert (=> b!1504506 m!1387677))

(assert (=> b!1504500 m!1387651))

(assert (=> b!1504500 m!1387651))

(declare-fun m!1387679 () Bool)

(assert (=> b!1504500 m!1387679))

(push 1)

(assert (not start!128118))

(assert (not b!1504500))

(assert (not b!1504499))

(assert (not b!1504501))

(assert (not b!1504507))

(assert (not b!1504505))

(assert (not b!1504503))

(assert (not b!1504506))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!157895 () Bool)

(declare-fun lt!653749 () (_ BitVec 32))

(assert (=> d!157895 (and (bvsge lt!653749 #b00000000000000000000000000000000) (bvslt lt!653749 (bvadd mask!2661 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!157895 (= lt!653749 (choose!52 index!625 x!647 mask!2661))))

(assert (=> d!157895 (validMask!0 mask!2661)))

(assert (=> d!157895 (= (nextIndex!0 index!625 x!647 mask!2661) lt!653749)))

(declare-fun bs!43202 () Bool)

(assert (= bs!43202 d!157895))

(declare-fun m!1387749 () Bool)

(assert (=> bs!43202 m!1387749))

(assert (=> bs!43202 m!1387669))

(assert (=> b!1504499 d!157895))

(declare-fun d!157899 () Bool)

(assert (=> d!157899 (= (validKeyInArray!0 (select (arr!48431 a!2850) i!996)) (and (not (= (select (arr!48431 a!2850) i!996) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48431 a!2850) i!996) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1504506 d!157899))

(declare-fun d!157905 () Bool)

(assert (=> d!157905 (= (validKeyInArray!0 (select (arr!48431 a!2850) j!87)) (and (not (= (select (arr!48431 a!2850) j!87) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48431 a!2850) j!87) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1504500 d!157905))

(declare-fun d!157907 () Bool)

(assert (=> d!157907 (= (validMask!0 mask!2661) (and (or (= mask!2661 #b00000000000000000000000000000111) (= mask!2661 #b00000000000000000000000000001111) (= mask!2661 #b00000000000000000000000000011111) (= mask!2661 #b00000000000000000000000000111111) (= mask!2661 #b00000000000000000000000001111111) (= mask!2661 #b00000000000000000000000011111111) (= mask!2661 #b00000000000000000000000111111111) (= mask!2661 #b00000000000000000000001111111111) (= mask!2661 #b00000000000000000000011111111111) (= mask!2661 #b00000000000000000000111111111111) (= mask!2661 #b00000000000000000001111111111111) (= mask!2661 #b00000000000000000011111111111111) (= mask!2661 #b00000000000000000111111111111111) (= mask!2661 #b00000000000000001111111111111111) (= mask!2661 #b00000000000000011111111111111111) (= mask!2661 #b00000000000000111111111111111111) (= mask!2661 #b00000000000001111111111111111111) (= mask!2661 #b00000000000011111111111111111111) (= mask!2661 #b00000000000111111111111111111111) (= mask!2661 #b00000000001111111111111111111111) (= mask!2661 #b00000000011111111111111111111111) (= mask!2661 #b00000000111111111111111111111111) (= mask!2661 #b00000001111111111111111111111111) (= mask!2661 #b00000011111111111111111111111111) (= mask!2661 #b00000111111111111111111111111111) (= mask!2661 #b00001111111111111111111111111111) (= mask!2661 #b00011111111111111111111111111111) (= mask!2661 #b00111111111111111111111111111111)) (bvsle mask!2661 #b00111111111111111111111111111111)))))

(assert (=> start!128118 d!157907))

(declare-fun d!157917 () Bool)

(assert (=> d!157917 (= (array_inv!37459 a!2850) (bvsge (size!48981 a!2850) #b00000000000000000000000000000000))))

(assert (=> start!128118 d!157917))

(declare-fun e!841058 () SeekEntryResult!12629)

(declare-fun b!1504665 () Bool)

(assert (=> b!1504665 (= e!841058 (seekKeyOrZeroReturnVacant!0 (bvadd x!647 #b00000000000000000000000000000001) (nextIndex!0 index!625 x!647 mask!2661) vacantBefore!10 (select (arr!48431 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1504666 () Bool)

(assert (=> b!1504666 (= e!841058 (MissingVacant!12629 vacantBefore!10))))

(declare-fun b!1504667 () Bool)

(declare-fun c!139222 () Bool)

(declare-fun lt!653771 () (_ BitVec 64))

(assert (=> b!1504667 (= c!139222 (= lt!653771 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!841059 () SeekEntryResult!12629)

(assert (=> b!1504667 (= e!841059 e!841058)))

(declare-fun d!157919 () Bool)

(declare-fun lt!653772 () SeekEntryResult!12629)

(assert (=> d!157919 (and (or (is-Undefined!12629 lt!653772) (not (is-Found!12629 lt!653772)) (and (bvsge (index!52909 lt!653772) #b00000000000000000000000000000000) (bvslt (index!52909 lt!653772) (size!48981 a!2850)))) (or (is-Undefined!12629 lt!653772) (is-Found!12629 lt!653772) (not (is-MissingVacant!12629 lt!653772)) (not (= (index!52911 lt!653772) vacantBefore!10)) (and (bvsge (index!52911 lt!653772) #b00000000000000000000000000000000) (bvslt (index!52911 lt!653772) (size!48981 a!2850)))) (or (is-Undefined!12629 lt!653772) (ite (is-Found!12629 lt!653772) (= (select (arr!48431 a!2850) (index!52909 lt!653772)) (select (arr!48431 a!2850) j!87)) (and (is-MissingVacant!12629 lt!653772) (= (index!52911 lt!653772) vacantBefore!10) (= (select (arr!48431 a!2850) (index!52911 lt!653772)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!841060 () SeekEntryResult!12629)

(assert (=> d!157919 (= lt!653772 e!841060)))

(declare-fun c!139221 () Bool)

(assert (=> d!157919 (= c!139221 (bvsge x!647 #b01111111111111111111111111111110))))

(assert (=> d!157919 (= lt!653771 (select (arr!48431 a!2850) index!625))))

(assert (=> d!157919 (validMask!0 mask!2661)))

(assert (=> d!157919 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48431 a!2850) j!87) a!2850 mask!2661) lt!653772)))

(declare-fun b!1504668 () Bool)

(assert (=> b!1504668 (= e!841060 Undefined!12629)))

(declare-fun b!1504669 () Bool)

(assert (=> b!1504669 (= e!841059 (Found!12629 index!625))))

(declare-fun b!1504670 () Bool)

(assert (=> b!1504670 (= e!841060 e!841059)))

(declare-fun c!139223 () Bool)

(assert (=> b!1504670 (= c!139223 (= lt!653771 (select (arr!48431 a!2850) j!87)))))

(assert (= (and d!157919 c!139221) b!1504668))

(assert (= (and d!157919 (not c!139221)) b!1504670))

(assert (= (and b!1504670 c!139223) b!1504669))

(assert (= (and b!1504670 (not c!139223)) b!1504667))

(assert (= (and b!1504667 c!139222) b!1504666))

(assert (= (and b!1504667 (not c!139222)) b!1504665))

(assert (=> b!1504665 m!1387673))

(assert (=> b!1504665 m!1387673))

(assert (=> b!1504665 m!1387651))

(declare-fun m!1387795 () Bool)

(assert (=> b!1504665 m!1387795))

(declare-fun m!1387797 () Bool)

(assert (=> d!157919 m!1387797))

(declare-fun m!1387799 () Bool)

(assert (=> d!157919 m!1387799))

(assert (=> d!157919 m!1387655))

(assert (=> d!157919 m!1387669))

(assert (=> b!1504505 d!157919))

(declare-fun d!157929 () Bool)

(declare-fun res!1025295 () Bool)

(declare-fun e!841071 () Bool)

(assert (=> d!157929 (=> res!1025295 e!841071)))

(assert (=> d!157929 (= res!1025295 (bvsge #b00000000000000000000000000000000 (size!48981 a!2850)))))

(assert (=> d!157929 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661) e!841071)))

(declare-fun b!1504685 () Bool)

(declare-fun e!841072 () Bool)

(declare-fun e!841070 () Bool)

(assert (=> b!1504685 (= e!841072 e!841070)))

(declare-fun lt!653783 () (_ BitVec 64))

(assert (=> b!1504685 (= lt!653783 (select (arr!48431 a!2850) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50274 0))(
  ( (Unit!50275) )
))
(declare-fun lt!653781 () Unit!50274)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100355 (_ BitVec 64) (_ BitVec 32)) Unit!50274)

(assert (=> b!1504685 (= lt!653781 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2850 lt!653783 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100355 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1504685 (arrayContainsKey!0 a!2850 lt!653783 #b00000000000000000000000000000000)))

(declare-fun lt!653782 () Unit!50274)

(assert (=> b!1504685 (= lt!653782 lt!653781)))

(declare-fun res!1025296 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100355 (_ BitVec 32)) SeekEntryResult!12629)

(assert (=> b!1504685 (= res!1025296 (= (seekEntryOrOpen!0 (select (arr!48431 a!2850) #b00000000000000000000000000000000) a!2850 mask!2661) (Found!12629 #b00000000000000000000000000000000)))))

(assert (=> b!1504685 (=> (not res!1025296) (not e!841070))))

(declare-fun b!1504686 () Bool)

(declare-fun call!68151 () Bool)

(assert (=> b!1504686 (= e!841072 call!68151)))

(declare-fun b!1504687 () Bool)

(assert (=> b!1504687 (= e!841071 e!841072)))

(declare-fun c!139229 () Bool)

(assert (=> b!1504687 (= c!139229 (validKeyInArray!0 (select (arr!48431 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1504688 () Bool)

(assert (=> b!1504688 (= e!841070 call!68151)))

(declare-fun bm!68148 () Bool)

(assert (=> bm!68148 (= call!68151 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2850 mask!2661))))

(assert (= (and d!157929 (not res!1025295)) b!1504687))

(assert (= (and b!1504687 c!139229) b!1504685))

(assert (= (and b!1504687 (not c!139229)) b!1504686))

(assert (= (and b!1504685 res!1025296) b!1504688))

(assert (= (or b!1504688 b!1504686) bm!68148))

(declare-fun m!1387807 () Bool)

(assert (=> b!1504685 m!1387807))

(declare-fun m!1387809 () Bool)

(assert (=> b!1504685 m!1387809))

(declare-fun m!1387811 () Bool)

(assert (=> b!1504685 m!1387811))

(assert (=> b!1504685 m!1387807))

(declare-fun m!1387813 () Bool)

(assert (=> b!1504685 m!1387813))

(assert (=> b!1504687 m!1387807))

(assert (=> b!1504687 m!1387807))

(declare-fun m!1387815 () Bool)

(assert (=> b!1504687 m!1387815))

(declare-fun m!1387817 () Bool)

(assert (=> bm!68148 m!1387817))

(assert (=> b!1504507 d!157929))

(declare-fun b!1504689 () Bool)

(declare-fun e!841073 () SeekEntryResult!12629)

(assert (=> b!1504689 (= e!841073 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647 #b00000000000000000000000000000001) (nextIndex!0 lt!653724 (bvadd #b00000000000000000000000000000001 x!647) mask!2661) vacantBefore!10 (select (arr!48431 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1504690 () Bool)

(assert (=> b!1504690 (= e!841073 (MissingVacant!12629 vacantBefore!10))))

(declare-fun b!1504691 () Bool)

(declare-fun c!139231 () Bool)

(declare-fun lt!653784 () (_ BitVec 64))

(assert (=> b!1504691 (= c!139231 (= lt!653784 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!841074 () SeekEntryResult!12629)

(assert (=> b!1504691 (= e!841074 e!841073)))

(declare-fun lt!653785 () SeekEntryResult!12629)

(declare-fun d!157937 () Bool)

(assert (=> d!157937 (and (or (is-Undefined!12629 lt!653785) (not (is-Found!12629 lt!653785)) (and (bvsge (index!52909 lt!653785) #b00000000000000000000000000000000) (bvslt (index!52909 lt!653785) (size!48981 a!2850)))) (or (is-Undefined!12629 lt!653785) (is-Found!12629 lt!653785) (not (is-MissingVacant!12629 lt!653785)) (not (= (index!52911 lt!653785) vacantBefore!10)) (and (bvsge (index!52911 lt!653785) #b00000000000000000000000000000000) (bvslt (index!52911 lt!653785) (size!48981 a!2850)))) (or (is-Undefined!12629 lt!653785) (ite (is-Found!12629 lt!653785) (= (select (arr!48431 a!2850) (index!52909 lt!653785)) (select (arr!48431 a!2850) j!87)) (and (is-MissingVacant!12629 lt!653785) (= (index!52911 lt!653785) vacantBefore!10) (= (select (arr!48431 a!2850) (index!52911 lt!653785)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!841075 () SeekEntryResult!12629)

(assert (=> d!157937 (= lt!653785 e!841075)))

(declare-fun c!139230 () Bool)

(assert (=> d!157937 (= c!139230 (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110))))

(assert (=> d!157937 (= lt!653784 (select (arr!48431 a!2850) lt!653724))))

(assert (=> d!157937 (validMask!0 mask!2661)))

(assert (=> d!157937 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653724 vacantBefore!10 (select (arr!48431 a!2850) j!87) a!2850 mask!2661) lt!653785)))

(declare-fun b!1504692 () Bool)

(assert (=> b!1504692 (= e!841075 Undefined!12629)))

(declare-fun b!1504693 () Bool)

(assert (=> b!1504693 (= e!841074 (Found!12629 lt!653724))))

(declare-fun b!1504694 () Bool)

(assert (=> b!1504694 (= e!841075 e!841074)))

(declare-fun c!139232 () Bool)

(assert (=> b!1504694 (= c!139232 (= lt!653784 (select (arr!48431 a!2850) j!87)))))

(assert (= (and d!157937 c!139230) b!1504692))

(assert (= (and d!157937 (not c!139230)) b!1504694))

(assert (= (and b!1504694 c!139232) b!1504693))

(assert (= (and b!1504694 (not c!139232)) b!1504691))

(assert (= (and b!1504691 c!139231) b!1504690))

(assert (= (and b!1504691 (not c!139231)) b!1504689))

(declare-fun m!1387819 () Bool)

(assert (=> b!1504689 m!1387819))

(assert (=> b!1504689 m!1387819))

(assert (=> b!1504689 m!1387651))

(declare-fun m!1387821 () Bool)

(assert (=> b!1504689 m!1387821))

(declare-fun m!1387823 () Bool)

(assert (=> d!157937 m!1387823))

(declare-fun m!1387825 () Bool)

(assert (=> d!157937 m!1387825))

(declare-fun m!1387827 () Bool)

(assert (=> d!157937 m!1387827))

(assert (=> d!157937 m!1387669))

(assert (=> b!1504501 d!157937))

