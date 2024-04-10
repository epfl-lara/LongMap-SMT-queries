; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127884 () Bool)

(assert start!127884)

(declare-fun b!1502535 () Bool)

(declare-fun res!1023526 () Bool)

(declare-fun e!840340 () Bool)

(assert (=> b!1502535 (=> (not res!1023526) (not e!840340))))

(declare-datatypes ((array!100232 0))(
  ( (array!100233 (arr!48374 (Array (_ BitVec 32) (_ BitVec 64))) (size!48924 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100232)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1502535 (= res!1023526 (and (= (select (arr!48374 a!2850) index!625) (select (arr!48374 a!2850) j!87)) (= j!87 index!625)))))

(declare-fun res!1023523 () Bool)

(declare-fun e!840339 () Bool)

(assert (=> start!127884 (=> (not res!1023523) (not e!840339))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127884 (= res!1023523 (validMask!0 mask!2661))))

(assert (=> start!127884 e!840339))

(assert (=> start!127884 true))

(declare-fun array_inv!37402 (array!100232) Bool)

(assert (=> start!127884 (array_inv!37402 a!2850)))

(declare-fun b!1502536 () Bool)

(declare-fun res!1023522 () Bool)

(assert (=> b!1502536 (=> (not res!1023522) (not e!840339))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(assert (=> b!1502536 (= res!1023522 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48924 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48924 a!2850)) (= (select (arr!48374 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48374 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48924 a!2850))))))

(declare-fun b!1502537 () Bool)

(declare-fun res!1023527 () Bool)

(assert (=> b!1502537 (=> (not res!1023527) (not e!840339))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1502537 (= res!1023527 (validKeyInArray!0 (select (arr!48374 a!2850) i!996)))))

(declare-fun b!1502538 () Bool)

(declare-fun res!1023529 () Bool)

(assert (=> b!1502538 (=> (not res!1023529) (not e!840339))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100232 (_ BitVec 32)) Bool)

(assert (=> b!1502538 (= res!1023529 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1502539 () Bool)

(declare-fun res!1023521 () Bool)

(assert (=> b!1502539 (=> (not res!1023521) (not e!840339))))

(assert (=> b!1502539 (= res!1023521 (validKeyInArray!0 (select (arr!48374 a!2850) j!87)))))

(declare-fun b!1502540 () Bool)

(declare-fun res!1023525 () Bool)

(assert (=> b!1502540 (=> (not res!1023525) (not e!840339))))

(declare-datatypes ((List!34866 0))(
  ( (Nil!34863) (Cons!34862 (h!36259 (_ BitVec 64)) (t!49560 List!34866)) )
))
(declare-fun arrayNoDuplicates!0 (array!100232 (_ BitVec 32) List!34866) Bool)

(assert (=> b!1502540 (= res!1023525 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34863))))

(declare-fun b!1502541 () Bool)

(assert (=> b!1502541 (= e!840339 e!840340)))

(declare-fun res!1023524 () Bool)

(assert (=> b!1502541 (=> (not res!1023524) (not e!840340))))

(declare-datatypes ((SeekEntryResult!12572 0))(
  ( (MissingZero!12572 (index!52680 (_ BitVec 32))) (Found!12572 (index!52681 (_ BitVec 32))) (Intermediate!12572 (undefined!13384 Bool) (index!52682 (_ BitVec 32)) (x!134369 (_ BitVec 32))) (Undefined!12572) (MissingVacant!12572 (index!52683 (_ BitVec 32))) )
))
(declare-fun lt!653392 () SeekEntryResult!12572)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100232 (_ BitVec 32)) SeekEntryResult!12572)

(assert (=> b!1502541 (= res!1023524 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48374 a!2850) j!87) a!2850 mask!2661) lt!653392))))

(assert (=> b!1502541 (= lt!653392 (Found!12572 j!87))))

(declare-fun b!1502542 () Bool)

(assert (=> b!1502542 (= e!840340 (not (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantAfter!10 (select (store (arr!48374 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100233 (store (arr!48374 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48924 a!2850)) mask!2661) lt!653392)))))

(declare-fun b!1502543 () Bool)

(declare-fun res!1023528 () Bool)

(assert (=> b!1502543 (=> (not res!1023528) (not e!840339))))

(assert (=> b!1502543 (= res!1023528 (and (= (size!48924 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48924 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48924 a!2850)) (not (= i!996 j!87))))))

(assert (= (and start!127884 res!1023523) b!1502543))

(assert (= (and b!1502543 res!1023528) b!1502537))

(assert (= (and b!1502537 res!1023527) b!1502539))

(assert (= (and b!1502539 res!1023521) b!1502538))

(assert (= (and b!1502538 res!1023529) b!1502540))

(assert (= (and b!1502540 res!1023525) b!1502536))

(assert (= (and b!1502536 res!1023522) b!1502541))

(assert (= (and b!1502541 res!1023524) b!1502535))

(assert (= (and b!1502535 res!1023526) b!1502542))

(declare-fun m!1385809 () Bool)

(assert (=> start!127884 m!1385809))

(declare-fun m!1385811 () Bool)

(assert (=> start!127884 m!1385811))

(declare-fun m!1385813 () Bool)

(assert (=> b!1502536 m!1385813))

(declare-fun m!1385815 () Bool)

(assert (=> b!1502536 m!1385815))

(declare-fun m!1385817 () Bool)

(assert (=> b!1502536 m!1385817))

(declare-fun m!1385819 () Bool)

(assert (=> b!1502537 m!1385819))

(assert (=> b!1502537 m!1385819))

(declare-fun m!1385821 () Bool)

(assert (=> b!1502537 m!1385821))

(declare-fun m!1385823 () Bool)

(assert (=> b!1502538 m!1385823))

(assert (=> b!1502542 m!1385815))

(declare-fun m!1385825 () Bool)

(assert (=> b!1502542 m!1385825))

(assert (=> b!1502542 m!1385825))

(declare-fun m!1385827 () Bool)

(assert (=> b!1502542 m!1385827))

(declare-fun m!1385829 () Bool)

(assert (=> b!1502539 m!1385829))

(assert (=> b!1502539 m!1385829))

(declare-fun m!1385831 () Bool)

(assert (=> b!1502539 m!1385831))

(declare-fun m!1385833 () Bool)

(assert (=> b!1502535 m!1385833))

(assert (=> b!1502535 m!1385829))

(declare-fun m!1385835 () Bool)

(assert (=> b!1502540 m!1385835))

(assert (=> b!1502541 m!1385829))

(assert (=> b!1502541 m!1385829))

(declare-fun m!1385837 () Bool)

(assert (=> b!1502541 m!1385837))

(push 1)

(assert (not start!127884))

(assert (not b!1502539))

(assert (not b!1502538))

(assert (not b!1502537))

(assert (not b!1502541))

(assert (not b!1502542))

(assert (not b!1502540))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun bm!68090 () Bool)

(declare-fun call!68093 () Bool)

(declare-fun c!139057 () Bool)

(assert (=> bm!68090 (= call!68093 (arrayNoDuplicates!0 a!2850 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139057 (Cons!34862 (select (arr!48374 a!2850) #b00000000000000000000000000000000) Nil!34863) Nil!34863)))))

(declare-fun d!157719 () Bool)

(declare-fun res!1023606 () Bool)

(declare-fun e!840396 () Bool)

(assert (=> d!157719 (=> res!1023606 e!840396)))

(assert (=> d!157719 (= res!1023606 (bvsge #b00000000000000000000000000000000 (size!48924 a!2850)))))

(assert (=> d!157719 (= (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34863) e!840396)))

(declare-fun b!1502651 () Bool)

(declare-fun e!840399 () Bool)

(assert (=> b!1502651 (= e!840399 call!68093)))

(declare-fun b!1502652 () Bool)

(assert (=> b!1502652 (= e!840399 call!68093)))

(declare-fun b!1502653 () Bool)

(declare-fun e!840398 () Bool)

(assert (=> b!1502653 (= e!840398 e!840399)))

(assert (=> b!1502653 (= c!139057 (validKeyInArray!0 (select (arr!48374 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1502654 () Bool)

(declare-fun e!840397 () Bool)

(declare-fun contains!9946 (List!34866 (_ BitVec 64)) Bool)

(assert (=> b!1502654 (= e!840397 (contains!9946 Nil!34863 (select (arr!48374 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1502655 () Bool)

(assert (=> b!1502655 (= e!840396 e!840398)))

(declare-fun res!1023607 () Bool)

(assert (=> b!1502655 (=> (not res!1023607) (not e!840398))))

(assert (=> b!1502655 (= res!1023607 (not e!840397))))

(declare-fun res!1023605 () Bool)

(assert (=> b!1502655 (=> (not res!1023605) (not e!840397))))

(assert (=> b!1502655 (= res!1023605 (validKeyInArray!0 (select (arr!48374 a!2850) #b00000000000000000000000000000000)))))

(assert (= (and d!157719 (not res!1023606)) b!1502655))

(assert (= (and b!1502655 res!1023605) b!1502654))

(assert (= (and b!1502655 res!1023607) b!1502653))

(assert (= (and b!1502653 c!139057) b!1502652))

(assert (= (and b!1502653 (not c!139057)) b!1502651))

(assert (= (or b!1502652 b!1502651) bm!68090))

(declare-fun m!1385917 () Bool)

(assert (=> bm!68090 m!1385917))

(declare-fun m!1385919 () Bool)

(assert (=> bm!68090 m!1385919))

(assert (=> b!1502653 m!1385917))

(assert (=> b!1502653 m!1385917))

(declare-fun m!1385921 () Bool)

(assert (=> b!1502653 m!1385921))

(assert (=> b!1502654 m!1385917))

(assert (=> b!1502654 m!1385917))

(declare-fun m!1385923 () Bool)

(assert (=> b!1502654 m!1385923))

(assert (=> b!1502655 m!1385917))

(assert (=> b!1502655 m!1385917))

(assert (=> b!1502655 m!1385921))

(assert (=> b!1502540 d!157719))

(declare-fun d!157727 () Bool)

(assert (=> d!157727 (= (validKeyInArray!0 (select (arr!48374 a!2850) j!87)) (and (not (= (select (arr!48374 a!2850) j!87) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48374 a!2850) j!87) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1502539 d!157727))

(declare-fun b!1502687 () Bool)

(declare-fun e!840423 () Bool)

(declare-fun call!68099 () Bool)

(assert (=> b!1502687 (= e!840423 call!68099)))

(declare-fun b!1502688 () Bool)

(declare-fun e!840421 () Bool)

(assert (=> b!1502688 (= e!840421 call!68099)))

(declare-fun d!157729 () Bool)

(declare-fun res!1023620 () Bool)

(declare-fun e!840422 () Bool)

(assert (=> d!157729 (=> res!1023620 e!840422)))

(assert (=> d!157729 (= res!1023620 (bvsge #b00000000000000000000000000000000 (size!48924 a!2850)))))

(assert (=> d!157729 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661) e!840422)))

(declare-fun bm!68096 () Bool)

(assert (=> bm!68096 (= call!68099 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2850 mask!2661))))

(declare-fun b!1502689 () Bool)

(assert (=> b!1502689 (= e!840422 e!840421)))

(declare-fun c!139068 () Bool)

(assert (=> b!1502689 (= c!139068 (validKeyInArray!0 (select (arr!48374 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1502690 () Bool)

(assert (=> b!1502690 (= e!840421 e!840423)))

(declare-fun lt!653423 () (_ BitVec 64))

(assert (=> b!1502690 (= lt!653423 (select (arr!48374 a!2850) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50260 0))(
  ( (Unit!50261) )
))
(declare-fun lt!653424 () Unit!50260)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100232 (_ BitVec 64) (_ BitVec 32)) Unit!50260)

(assert (=> b!1502690 (= lt!653424 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2850 lt!653423 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100232 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1502690 (arrayContainsKey!0 a!2850 lt!653423 #b00000000000000000000000000000000)))

(declare-fun lt!653425 () Unit!50260)

(assert (=> b!1502690 (= lt!653425 lt!653424)))

(declare-fun res!1023619 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100232 (_ BitVec 32)) SeekEntryResult!12572)

(assert (=> b!1502690 (= res!1023619 (= (seekEntryOrOpen!0 (select (arr!48374 a!2850) #b00000000000000000000000000000000) a!2850 mask!2661) (Found!12572 #b00000000000000000000000000000000)))))

(assert (=> b!1502690 (=> (not res!1023619) (not e!840423))))

(assert (= (and d!157729 (not res!1023620)) b!1502689))

(assert (= (and b!1502689 c!139068) b!1502690))

(assert (= (and b!1502689 (not c!139068)) b!1502688))

(assert (= (and b!1502690 res!1023619) b!1502687))

(assert (= (or b!1502687 b!1502688) bm!68096))

(declare-fun m!1385939 () Bool)

(assert (=> bm!68096 m!1385939))

(assert (=> b!1502689 m!1385917))

(assert (=> b!1502689 m!1385917))

(assert (=> b!1502689 m!1385921))

(assert (=> b!1502690 m!1385917))

(declare-fun m!1385941 () Bool)

(assert (=> b!1502690 m!1385941))

(declare-fun m!1385943 () Bool)

(assert (=> b!1502690 m!1385943))

(assert (=> b!1502690 m!1385917))

(declare-fun m!1385945 () Bool)

(assert (=> b!1502690 m!1385945))

(assert (=> b!1502538 d!157729))

(declare-fun d!157735 () Bool)

