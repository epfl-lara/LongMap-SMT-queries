; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119822 () Bool)

(assert start!119822)

(declare-fun res!934773 () Bool)

(declare-fun e!790051 () Bool)

(assert (=> start!119822 (=> (not res!934773) (not e!790051))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119822 (= res!934773 (validMask!0 mask!2840))))

(assert (=> start!119822 e!790051))

(assert (=> start!119822 true))

(declare-datatypes ((array!95453 0))(
  ( (array!95454 (arr!46083 (Array (_ BitVec 32) (_ BitVec 64))) (size!46633 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95453)

(declare-fun array_inv!35111 (array!95453) Bool)

(assert (=> start!119822 (array_inv!35111 a!2901)))

(declare-fun b!1395523 () Bool)

(declare-fun res!934766 () Bool)

(assert (=> b!1395523 (=> (not res!934766) (not e!790051))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95453 (_ BitVec 32)) Bool)

(assert (=> b!1395523 (= res!934766 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1395524 () Bool)

(declare-fun e!790048 () Bool)

(assert (=> b!1395524 (= e!790051 (not e!790048))))

(declare-fun res!934767 () Bool)

(assert (=> b!1395524 (=> res!934767 e!790048)))

(declare-datatypes ((SeekEntryResult!10400 0))(
  ( (MissingZero!10400 (index!43971 (_ BitVec 32))) (Found!10400 (index!43972 (_ BitVec 32))) (Intermediate!10400 (undefined!11212 Bool) (index!43973 (_ BitVec 32)) (x!125634 (_ BitVec 32))) (Undefined!10400) (MissingVacant!10400 (index!43974 (_ BitVec 32))) )
))
(declare-fun lt!613016 () SeekEntryResult!10400)

(get-info :version)

(assert (=> b!1395524 (= res!934767 (or (not ((_ is Intermediate!10400) lt!613016)) (undefined!11212 lt!613016)))))

(declare-fun e!790050 () Bool)

(assert (=> b!1395524 e!790050))

(declare-fun res!934769 () Bool)

(assert (=> b!1395524 (=> (not res!934769) (not e!790050))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1395524 (= res!934769 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46804 0))(
  ( (Unit!46805) )
))
(declare-fun lt!613015 () Unit!46804)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95453 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46804)

(assert (=> b!1395524 (= lt!613015 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95453 (_ BitVec 32)) SeekEntryResult!10400)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1395524 (= lt!613016 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46083 a!2901) j!112) mask!2840) (select (arr!46083 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1395525 () Bool)

(declare-fun e!790049 () Bool)

(assert (=> b!1395525 (= e!790048 e!790049)))

(declare-fun res!934772 () Bool)

(assert (=> b!1395525 (=> res!934772 e!790049)))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!613017 () (_ BitVec 32))

(assert (=> b!1395525 (= res!934772 (= lt!613016 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613017 (select (store (arr!46083 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95454 (store (arr!46083 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46633 a!2901)) mask!2840)))))

(assert (=> b!1395525 (= lt!613017 (toIndex!0 (select (store (arr!46083 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840))))

(declare-fun b!1395526 () Bool)

(assert (=> b!1395526 (= e!790049 (or (bvslt mask!2840 #b00000000000000000000000000000000) (and (bvsge lt!613017 #b00000000000000000000000000000000) (bvslt lt!613017 (bvadd #b00000000000000000000000000000001 mask!2840)))))))

(declare-fun b!1395527 () Bool)

(declare-fun res!934768 () Bool)

(assert (=> b!1395527 (=> (not res!934768) (not e!790051))))

(declare-datatypes ((List!32602 0))(
  ( (Nil!32599) (Cons!32598 (h!33834 (_ BitVec 64)) (t!47296 List!32602)) )
))
(declare-fun arrayNoDuplicates!0 (array!95453 (_ BitVec 32) List!32602) Bool)

(assert (=> b!1395527 (= res!934768 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32599))))

(declare-fun b!1395528 () Bool)

(declare-fun res!934774 () Bool)

(assert (=> b!1395528 (=> (not res!934774) (not e!790051))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1395528 (= res!934774 (validKeyInArray!0 (select (arr!46083 a!2901) j!112)))))

(declare-fun b!1395529 () Bool)

(declare-fun res!934771 () Bool)

(assert (=> b!1395529 (=> (not res!934771) (not e!790051))))

(assert (=> b!1395529 (= res!934771 (validKeyInArray!0 (select (arr!46083 a!2901) i!1037)))))

(declare-fun b!1395530 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95453 (_ BitVec 32)) SeekEntryResult!10400)

(assert (=> b!1395530 (= e!790050 (= (seekEntryOrOpen!0 (select (arr!46083 a!2901) j!112) a!2901 mask!2840) (Found!10400 j!112)))))

(declare-fun b!1395531 () Bool)

(declare-fun res!934770 () Bool)

(assert (=> b!1395531 (=> (not res!934770) (not e!790051))))

(assert (=> b!1395531 (= res!934770 (and (= (size!46633 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46633 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46633 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!119822 res!934773) b!1395531))

(assert (= (and b!1395531 res!934770) b!1395529))

(assert (= (and b!1395529 res!934771) b!1395528))

(assert (= (and b!1395528 res!934774) b!1395523))

(assert (= (and b!1395523 res!934766) b!1395527))

(assert (= (and b!1395527 res!934768) b!1395524))

(assert (= (and b!1395524 res!934769) b!1395530))

(assert (= (and b!1395524 (not res!934767)) b!1395525))

(assert (= (and b!1395525 (not res!934772)) b!1395526))

(declare-fun m!1282033 () Bool)

(assert (=> b!1395527 m!1282033))

(declare-fun m!1282035 () Bool)

(assert (=> b!1395528 m!1282035))

(assert (=> b!1395528 m!1282035))

(declare-fun m!1282037 () Bool)

(assert (=> b!1395528 m!1282037))

(assert (=> b!1395530 m!1282035))

(assert (=> b!1395530 m!1282035))

(declare-fun m!1282039 () Bool)

(assert (=> b!1395530 m!1282039))

(declare-fun m!1282041 () Bool)

(assert (=> start!119822 m!1282041))

(declare-fun m!1282043 () Bool)

(assert (=> start!119822 m!1282043))

(declare-fun m!1282045 () Bool)

(assert (=> b!1395523 m!1282045))

(declare-fun m!1282047 () Bool)

(assert (=> b!1395529 m!1282047))

(assert (=> b!1395529 m!1282047))

(declare-fun m!1282049 () Bool)

(assert (=> b!1395529 m!1282049))

(declare-fun m!1282051 () Bool)

(assert (=> b!1395525 m!1282051))

(declare-fun m!1282053 () Bool)

(assert (=> b!1395525 m!1282053))

(assert (=> b!1395525 m!1282053))

(declare-fun m!1282055 () Bool)

(assert (=> b!1395525 m!1282055))

(assert (=> b!1395525 m!1282053))

(declare-fun m!1282057 () Bool)

(assert (=> b!1395525 m!1282057))

(assert (=> b!1395524 m!1282035))

(declare-fun m!1282059 () Bool)

(assert (=> b!1395524 m!1282059))

(assert (=> b!1395524 m!1282035))

(declare-fun m!1282061 () Bool)

(assert (=> b!1395524 m!1282061))

(assert (=> b!1395524 m!1282059))

(assert (=> b!1395524 m!1282035))

(declare-fun m!1282063 () Bool)

(assert (=> b!1395524 m!1282063))

(declare-fun m!1282065 () Bool)

(assert (=> b!1395524 m!1282065))

(check-sat (not start!119822) (not b!1395524) (not b!1395529) (not b!1395527) (not b!1395530) (not b!1395525) (not b!1395523) (not b!1395528))
(check-sat)
(get-model)

(declare-fun d!150721 () Bool)

(assert (=> d!150721 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!119822 d!150721))

(declare-fun d!150723 () Bool)

(assert (=> d!150723 (= (array_inv!35111 a!2901) (bvsge (size!46633 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!119822 d!150723))

(declare-fun b!1395567 () Bool)

(declare-fun e!790074 () Bool)

(declare-fun call!66826 () Bool)

(assert (=> b!1395567 (= e!790074 call!66826)))

(declare-fun b!1395568 () Bool)

(declare-fun e!790075 () Bool)

(assert (=> b!1395568 (= e!790075 e!790074)))

(declare-fun lt!613033 () (_ BitVec 64))

(assert (=> b!1395568 (= lt!613033 (select (arr!46083 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!613035 () Unit!46804)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!95453 (_ BitVec 64) (_ BitVec 32)) Unit!46804)

(assert (=> b!1395568 (= lt!613035 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!613033 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!95453 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1395568 (arrayContainsKey!0 a!2901 lt!613033 #b00000000000000000000000000000000)))

(declare-fun lt!613034 () Unit!46804)

(assert (=> b!1395568 (= lt!613034 lt!613035)))

(declare-fun res!934807 () Bool)

(assert (=> b!1395568 (= res!934807 (= (seekEntryOrOpen!0 (select (arr!46083 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10400 #b00000000000000000000000000000000)))))

(assert (=> b!1395568 (=> (not res!934807) (not e!790074))))

(declare-fun bm!66823 () Bool)

(assert (=> bm!66823 (= call!66826 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1395570 () Bool)

(declare-fun e!790076 () Bool)

(assert (=> b!1395570 (= e!790076 e!790075)))

(declare-fun c!129834 () Bool)

(assert (=> b!1395570 (= c!129834 (validKeyInArray!0 (select (arr!46083 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1395569 () Bool)

(assert (=> b!1395569 (= e!790075 call!66826)))

(declare-fun d!150725 () Bool)

(declare-fun res!934806 () Bool)

(assert (=> d!150725 (=> res!934806 e!790076)))

(assert (=> d!150725 (= res!934806 (bvsge #b00000000000000000000000000000000 (size!46633 a!2901)))))

(assert (=> d!150725 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!790076)))

(assert (= (and d!150725 (not res!934806)) b!1395570))

(assert (= (and b!1395570 c!129834) b!1395568))

(assert (= (and b!1395570 (not c!129834)) b!1395569))

(assert (= (and b!1395568 res!934807) b!1395567))

(assert (= (or b!1395567 b!1395569) bm!66823))

(declare-fun m!1282101 () Bool)

(assert (=> b!1395568 m!1282101))

(declare-fun m!1282103 () Bool)

(assert (=> b!1395568 m!1282103))

(declare-fun m!1282105 () Bool)

(assert (=> b!1395568 m!1282105))

(assert (=> b!1395568 m!1282101))

(declare-fun m!1282107 () Bool)

(assert (=> b!1395568 m!1282107))

(declare-fun m!1282109 () Bool)

(assert (=> bm!66823 m!1282109))

(assert (=> b!1395570 m!1282101))

(assert (=> b!1395570 m!1282101))

(declare-fun m!1282111 () Bool)

(assert (=> b!1395570 m!1282111))

(assert (=> b!1395523 d!150725))

(declare-fun d!150729 () Bool)

(assert (=> d!150729 (= (validKeyInArray!0 (select (arr!46083 a!2901) j!112)) (and (not (= (select (arr!46083 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46083 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1395528 d!150729))

(declare-fun b!1395589 () Bool)

(declare-fun e!790093 () Bool)

(declare-fun call!66831 () Bool)

(assert (=> b!1395589 (= e!790093 call!66831)))

(declare-fun b!1395590 () Bool)

(declare-fun e!790094 () Bool)

(declare-fun e!790092 () Bool)

(assert (=> b!1395590 (= e!790094 e!790092)))

(declare-fun res!934820 () Bool)

(assert (=> b!1395590 (=> (not res!934820) (not e!790092))))

(declare-fun e!790091 () Bool)

(assert (=> b!1395590 (= res!934820 (not e!790091))))

(declare-fun res!934819 () Bool)

(assert (=> b!1395590 (=> (not res!934819) (not e!790091))))

(assert (=> b!1395590 (= res!934819 (validKeyInArray!0 (select (arr!46083 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1395591 () Bool)

(assert (=> b!1395591 (= e!790092 e!790093)))

(declare-fun c!129839 () Bool)

(assert (=> b!1395591 (= c!129839 (validKeyInArray!0 (select (arr!46083 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1395592 () Bool)

(declare-fun contains!9777 (List!32602 (_ BitVec 64)) Bool)

(assert (=> b!1395592 (= e!790091 (contains!9777 Nil!32599 (select (arr!46083 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!150731 () Bool)

(declare-fun res!934818 () Bool)

(assert (=> d!150731 (=> res!934818 e!790094)))

(assert (=> d!150731 (= res!934818 (bvsge #b00000000000000000000000000000000 (size!46633 a!2901)))))

(assert (=> d!150731 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32599) e!790094)))

(declare-fun bm!66828 () Bool)

(assert (=> bm!66828 (= call!66831 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!129839 (Cons!32598 (select (arr!46083 a!2901) #b00000000000000000000000000000000) Nil!32599) Nil!32599)))))

(declare-fun b!1395593 () Bool)

(assert (=> b!1395593 (= e!790093 call!66831)))

(assert (= (and d!150731 (not res!934818)) b!1395590))

(assert (= (and b!1395590 res!934819) b!1395592))

(assert (= (and b!1395590 res!934820) b!1395591))

(assert (= (and b!1395591 c!129839) b!1395589))

(assert (= (and b!1395591 (not c!129839)) b!1395593))

(assert (= (or b!1395589 b!1395593) bm!66828))

(assert (=> b!1395590 m!1282101))

(assert (=> b!1395590 m!1282101))

(assert (=> b!1395590 m!1282111))

(assert (=> b!1395591 m!1282101))

(assert (=> b!1395591 m!1282101))

(assert (=> b!1395591 m!1282111))

(assert (=> b!1395592 m!1282101))

(assert (=> b!1395592 m!1282101))

(declare-fun m!1282113 () Bool)

(assert (=> b!1395592 m!1282113))

(assert (=> bm!66828 m!1282101))

(declare-fun m!1282117 () Bool)

(assert (=> bm!66828 m!1282117))

(assert (=> b!1395527 d!150731))

(declare-fun b!1395636 () Bool)

(declare-fun e!790125 () Bool)

(declare-fun lt!613068 () SeekEntryResult!10400)

(assert (=> b!1395636 (= e!790125 (bvsge (x!125634 lt!613068) #b01111111111111111111111111111110))))

(declare-fun e!790124 () SeekEntryResult!10400)

(declare-fun b!1395637 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1395637 (= e!790124 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!613017 #b00000000000000000000000000000000 mask!2840) (select (store (arr!46083 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95454 (store (arr!46083 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46633 a!2901)) mask!2840))))

(declare-fun b!1395638 () Bool)

(assert (=> b!1395638 (and (bvsge (index!43973 lt!613068) #b00000000000000000000000000000000) (bvslt (index!43973 lt!613068) (size!46633 (array!95454 (store (arr!46083 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46633 a!2901)))))))

(declare-fun res!934836 () Bool)

(assert (=> b!1395638 (= res!934836 (= (select (arr!46083 (array!95454 (store (arr!46083 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46633 a!2901))) (index!43973 lt!613068)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!790121 () Bool)

(assert (=> b!1395638 (=> res!934836 e!790121)))

(declare-fun b!1395639 () Bool)

(declare-fun e!790122 () SeekEntryResult!10400)

(assert (=> b!1395639 (= e!790122 e!790124)))

(declare-fun c!129854 () Bool)

(declare-fun lt!613069 () (_ BitVec 64))

(assert (=> b!1395639 (= c!129854 (or (= lt!613069 (select (store (arr!46083 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)) (= (bvadd lt!613069 lt!613069) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!150735 () Bool)

(assert (=> d!150735 e!790125))

(declare-fun c!129856 () Bool)

(assert (=> d!150735 (= c!129856 (and ((_ is Intermediate!10400) lt!613068) (undefined!11212 lt!613068)))))

(assert (=> d!150735 (= lt!613068 e!790122)))

(declare-fun c!129855 () Bool)

(assert (=> d!150735 (= c!129855 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!150735 (= lt!613069 (select (arr!46083 (array!95454 (store (arr!46083 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46633 a!2901))) lt!613017))))

(assert (=> d!150735 (validMask!0 mask!2840)))

(assert (=> d!150735 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613017 (select (store (arr!46083 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95454 (store (arr!46083 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46633 a!2901)) mask!2840) lt!613068)))

(declare-fun b!1395640 () Bool)

(assert (=> b!1395640 (and (bvsge (index!43973 lt!613068) #b00000000000000000000000000000000) (bvslt (index!43973 lt!613068) (size!46633 (array!95454 (store (arr!46083 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46633 a!2901)))))))

(declare-fun res!934835 () Bool)

(assert (=> b!1395640 (= res!934835 (= (select (arr!46083 (array!95454 (store (arr!46083 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46633 a!2901))) (index!43973 lt!613068)) (select (store (arr!46083 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(assert (=> b!1395640 (=> res!934835 e!790121)))

(declare-fun e!790123 () Bool)

(assert (=> b!1395640 (= e!790123 e!790121)))

(declare-fun b!1395641 () Bool)

(assert (=> b!1395641 (and (bvsge (index!43973 lt!613068) #b00000000000000000000000000000000) (bvslt (index!43973 lt!613068) (size!46633 (array!95454 (store (arr!46083 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46633 a!2901)))))))

(assert (=> b!1395641 (= e!790121 (= (select (arr!46083 (array!95454 (store (arr!46083 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46633 a!2901))) (index!43973 lt!613068)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1395642 () Bool)

(assert (=> b!1395642 (= e!790122 (Intermediate!10400 true lt!613017 #b00000000000000000000000000000000))))

(declare-fun b!1395643 () Bool)

(assert (=> b!1395643 (= e!790124 (Intermediate!10400 false lt!613017 #b00000000000000000000000000000000))))

(declare-fun b!1395644 () Bool)

(assert (=> b!1395644 (= e!790125 e!790123)))

(declare-fun res!934837 () Bool)

(assert (=> b!1395644 (= res!934837 (and ((_ is Intermediate!10400) lt!613068) (not (undefined!11212 lt!613068)) (bvslt (x!125634 lt!613068) #b01111111111111111111111111111110) (bvsge (x!125634 lt!613068) #b00000000000000000000000000000000) (bvsge (x!125634 lt!613068) #b00000000000000000000000000000000)))))

(assert (=> b!1395644 (=> (not res!934837) (not e!790123))))

(assert (= (and d!150735 c!129855) b!1395642))

(assert (= (and d!150735 (not c!129855)) b!1395639))

(assert (= (and b!1395639 c!129854) b!1395643))

(assert (= (and b!1395639 (not c!129854)) b!1395637))

(assert (= (and d!150735 c!129856) b!1395636))

(assert (= (and d!150735 (not c!129856)) b!1395644))

(assert (= (and b!1395644 res!934837) b!1395640))

(assert (= (and b!1395640 (not res!934835)) b!1395638))

(assert (= (and b!1395638 (not res!934836)) b!1395641))

(declare-fun m!1282133 () Bool)

(assert (=> b!1395637 m!1282133))

(assert (=> b!1395637 m!1282133))

(assert (=> b!1395637 m!1282053))

(declare-fun m!1282135 () Bool)

(assert (=> b!1395637 m!1282135))

(declare-fun m!1282137 () Bool)

(assert (=> b!1395640 m!1282137))

(assert (=> b!1395638 m!1282137))

(declare-fun m!1282139 () Bool)

(assert (=> d!150735 m!1282139))

(assert (=> d!150735 m!1282041))

(assert (=> b!1395641 m!1282137))

(assert (=> b!1395525 d!150735))

(declare-fun d!150745 () Bool)

(declare-fun lt!613081 () (_ BitVec 32))

(declare-fun lt!613080 () (_ BitVec 32))

(assert (=> d!150745 (= lt!613081 (bvmul (bvxor lt!613080 (bvlshr lt!613080 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150745 (= lt!613080 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46083 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46083 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150745 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!934844 (let ((h!33836 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46083 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46083 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!125638 (bvmul (bvxor h!33836 (bvlshr h!33836 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!125638 (bvlshr x!125638 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!934844 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!934844 #b00000000000000000000000000000000))))))

(assert (=> d!150745 (= (toIndex!0 (select (store (arr!46083 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvand (bvxor lt!613081 (bvlshr lt!613081 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1395525 d!150745))

(declare-fun b!1395703 () Bool)

(declare-fun e!790160 () SeekEntryResult!10400)

(declare-fun lt!613106 () SeekEntryResult!10400)

(assert (=> b!1395703 (= e!790160 (Found!10400 (index!43973 lt!613106)))))

(declare-fun e!790158 () SeekEntryResult!10400)

(declare-fun b!1395704 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95453 (_ BitVec 32)) SeekEntryResult!10400)

(assert (=> b!1395704 (= e!790158 (seekKeyOrZeroReturnVacant!0 (x!125634 lt!613106) (index!43973 lt!613106) (index!43973 lt!613106) (select (arr!46083 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1395705 () Bool)

(declare-fun e!790159 () SeekEntryResult!10400)

(assert (=> b!1395705 (= e!790159 e!790160)))

(declare-fun lt!613107 () (_ BitVec 64))

(assert (=> b!1395705 (= lt!613107 (select (arr!46083 a!2901) (index!43973 lt!613106)))))

(declare-fun c!129878 () Bool)

(assert (=> b!1395705 (= c!129878 (= lt!613107 (select (arr!46083 a!2901) j!112)))))

(declare-fun d!150749 () Bool)

(declare-fun lt!613108 () SeekEntryResult!10400)

(assert (=> d!150749 (and (or ((_ is Undefined!10400) lt!613108) (not ((_ is Found!10400) lt!613108)) (and (bvsge (index!43972 lt!613108) #b00000000000000000000000000000000) (bvslt (index!43972 lt!613108) (size!46633 a!2901)))) (or ((_ is Undefined!10400) lt!613108) ((_ is Found!10400) lt!613108) (not ((_ is MissingZero!10400) lt!613108)) (and (bvsge (index!43971 lt!613108) #b00000000000000000000000000000000) (bvslt (index!43971 lt!613108) (size!46633 a!2901)))) (or ((_ is Undefined!10400) lt!613108) ((_ is Found!10400) lt!613108) ((_ is MissingZero!10400) lt!613108) (not ((_ is MissingVacant!10400) lt!613108)) (and (bvsge (index!43974 lt!613108) #b00000000000000000000000000000000) (bvslt (index!43974 lt!613108) (size!46633 a!2901)))) (or ((_ is Undefined!10400) lt!613108) (ite ((_ is Found!10400) lt!613108) (= (select (arr!46083 a!2901) (index!43972 lt!613108)) (select (arr!46083 a!2901) j!112)) (ite ((_ is MissingZero!10400) lt!613108) (= (select (arr!46083 a!2901) (index!43971 lt!613108)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10400) lt!613108) (= (select (arr!46083 a!2901) (index!43974 lt!613108)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!150749 (= lt!613108 e!790159)))

(declare-fun c!129879 () Bool)

(assert (=> d!150749 (= c!129879 (and ((_ is Intermediate!10400) lt!613106) (undefined!11212 lt!613106)))))

(assert (=> d!150749 (= lt!613106 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46083 a!2901) j!112) mask!2840) (select (arr!46083 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!150749 (validMask!0 mask!2840)))

(assert (=> d!150749 (= (seekEntryOrOpen!0 (select (arr!46083 a!2901) j!112) a!2901 mask!2840) lt!613108)))

(declare-fun b!1395706 () Bool)

(assert (=> b!1395706 (= e!790159 Undefined!10400)))

(declare-fun b!1395707 () Bool)

(declare-fun c!129877 () Bool)

(assert (=> b!1395707 (= c!129877 (= lt!613107 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1395707 (= e!790160 e!790158)))

(declare-fun b!1395708 () Bool)

(assert (=> b!1395708 (= e!790158 (MissingZero!10400 (index!43973 lt!613106)))))

(assert (= (and d!150749 c!129879) b!1395706))

(assert (= (and d!150749 (not c!129879)) b!1395705))

(assert (= (and b!1395705 c!129878) b!1395703))

(assert (= (and b!1395705 (not c!129878)) b!1395707))

(assert (= (and b!1395707 c!129877) b!1395708))

(assert (= (and b!1395707 (not c!129877)) b!1395704))

(assert (=> b!1395704 m!1282035))

(declare-fun m!1282157 () Bool)

(assert (=> b!1395704 m!1282157))

(declare-fun m!1282159 () Bool)

(assert (=> b!1395705 m!1282159))

(assert (=> d!150749 m!1282059))

(assert (=> d!150749 m!1282035))

(assert (=> d!150749 m!1282063))

(assert (=> d!150749 m!1282041))

(declare-fun m!1282161 () Bool)

(assert (=> d!150749 m!1282161))

(declare-fun m!1282163 () Bool)

(assert (=> d!150749 m!1282163))

(assert (=> d!150749 m!1282035))

(assert (=> d!150749 m!1282059))

(declare-fun m!1282165 () Bool)

(assert (=> d!150749 m!1282165))

(assert (=> b!1395530 d!150749))

(declare-fun d!150763 () Bool)

(assert (=> d!150763 (= (validKeyInArray!0 (select (arr!46083 a!2901) i!1037)) (and (not (= (select (arr!46083 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46083 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1395529 d!150763))

(declare-fun b!1395721 () Bool)

(declare-fun e!790167 () Bool)

(declare-fun call!66836 () Bool)

(assert (=> b!1395721 (= e!790167 call!66836)))

(declare-fun b!1395722 () Bool)

(declare-fun e!790168 () Bool)

(assert (=> b!1395722 (= e!790168 e!790167)))

(declare-fun lt!613111 () (_ BitVec 64))

(assert (=> b!1395722 (= lt!613111 (select (arr!46083 a!2901) j!112))))

(declare-fun lt!613113 () Unit!46804)

(assert (=> b!1395722 (= lt!613113 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!613111 j!112))))

(assert (=> b!1395722 (arrayContainsKey!0 a!2901 lt!613111 #b00000000000000000000000000000000)))

(declare-fun lt!613112 () Unit!46804)

(assert (=> b!1395722 (= lt!613112 lt!613113)))

(declare-fun res!934860 () Bool)

(assert (=> b!1395722 (= res!934860 (= (seekEntryOrOpen!0 (select (arr!46083 a!2901) j!112) a!2901 mask!2840) (Found!10400 j!112)))))

(assert (=> b!1395722 (=> (not res!934860) (not e!790167))))

(declare-fun bm!66833 () Bool)

(assert (=> bm!66833 (= call!66836 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1395724 () Bool)

(declare-fun e!790169 () Bool)

(assert (=> b!1395724 (= e!790169 e!790168)))

(declare-fun c!129886 () Bool)

(assert (=> b!1395724 (= c!129886 (validKeyInArray!0 (select (arr!46083 a!2901) j!112)))))

(declare-fun b!1395723 () Bool)

(assert (=> b!1395723 (= e!790168 call!66836)))

(declare-fun d!150765 () Bool)

(declare-fun res!934859 () Bool)

(assert (=> d!150765 (=> res!934859 e!790169)))

(assert (=> d!150765 (= res!934859 (bvsge j!112 (size!46633 a!2901)))))

(assert (=> d!150765 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!790169)))

(assert (= (and d!150765 (not res!934859)) b!1395724))

(assert (= (and b!1395724 c!129886) b!1395722))

(assert (= (and b!1395724 (not c!129886)) b!1395723))

(assert (= (and b!1395722 res!934860) b!1395721))

(assert (= (or b!1395721 b!1395723) bm!66833))

(assert (=> b!1395722 m!1282035))

(declare-fun m!1282167 () Bool)

(assert (=> b!1395722 m!1282167))

(declare-fun m!1282169 () Bool)

(assert (=> b!1395722 m!1282169))

(assert (=> b!1395722 m!1282035))

(assert (=> b!1395722 m!1282039))

(declare-fun m!1282171 () Bool)

(assert (=> bm!66833 m!1282171))

(assert (=> b!1395724 m!1282035))

(assert (=> b!1395724 m!1282035))

(assert (=> b!1395724 m!1282037))

(assert (=> b!1395524 d!150765))

(declare-fun d!150767 () Bool)

(assert (=> d!150767 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!613119 () Unit!46804)

(declare-fun choose!38 (array!95453 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46804)

(assert (=> d!150767 (= lt!613119 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!150767 (validMask!0 mask!2840)))

(assert (=> d!150767 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!613119)))

(declare-fun bs!40618 () Bool)

(assert (= bs!40618 d!150767))

(assert (=> bs!40618 m!1282065))

(declare-fun m!1282183 () Bool)

(assert (=> bs!40618 m!1282183))

(assert (=> bs!40618 m!1282041))

(assert (=> b!1395524 d!150767))

(declare-fun b!1395731 () Bool)

(declare-fun e!790177 () Bool)

(declare-fun lt!613120 () SeekEntryResult!10400)

(assert (=> b!1395731 (= e!790177 (bvsge (x!125634 lt!613120) #b01111111111111111111111111111110))))

(declare-fun e!790176 () SeekEntryResult!10400)

(declare-fun b!1395732 () Bool)

(assert (=> b!1395732 (= e!790176 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46083 a!2901) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (arr!46083 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1395733 () Bool)

(assert (=> b!1395733 (and (bvsge (index!43973 lt!613120) #b00000000000000000000000000000000) (bvslt (index!43973 lt!613120) (size!46633 a!2901)))))

(declare-fun res!934862 () Bool)

(assert (=> b!1395733 (= res!934862 (= (select (arr!46083 a!2901) (index!43973 lt!613120)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!790173 () Bool)

(assert (=> b!1395733 (=> res!934862 e!790173)))

(declare-fun b!1395734 () Bool)

(declare-fun e!790174 () SeekEntryResult!10400)

(assert (=> b!1395734 (= e!790174 e!790176)))

(declare-fun lt!613121 () (_ BitVec 64))

(declare-fun c!129890 () Bool)

(assert (=> b!1395734 (= c!129890 (or (= lt!613121 (select (arr!46083 a!2901) j!112)) (= (bvadd lt!613121 lt!613121) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!150771 () Bool)

(assert (=> d!150771 e!790177))

(declare-fun c!129892 () Bool)

(assert (=> d!150771 (= c!129892 (and ((_ is Intermediate!10400) lt!613120) (undefined!11212 lt!613120)))))

(assert (=> d!150771 (= lt!613120 e!790174)))

(declare-fun c!129891 () Bool)

(assert (=> d!150771 (= c!129891 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!150771 (= lt!613121 (select (arr!46083 a!2901) (toIndex!0 (select (arr!46083 a!2901) j!112) mask!2840)))))

(assert (=> d!150771 (validMask!0 mask!2840)))

(assert (=> d!150771 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46083 a!2901) j!112) mask!2840) (select (arr!46083 a!2901) j!112) a!2901 mask!2840) lt!613120)))

(declare-fun b!1395735 () Bool)

(assert (=> b!1395735 (and (bvsge (index!43973 lt!613120) #b00000000000000000000000000000000) (bvslt (index!43973 lt!613120) (size!46633 a!2901)))))

(declare-fun res!934861 () Bool)

(assert (=> b!1395735 (= res!934861 (= (select (arr!46083 a!2901) (index!43973 lt!613120)) (select (arr!46083 a!2901) j!112)))))

(assert (=> b!1395735 (=> res!934861 e!790173)))

(declare-fun e!790175 () Bool)

(assert (=> b!1395735 (= e!790175 e!790173)))

(declare-fun b!1395736 () Bool)

(assert (=> b!1395736 (and (bvsge (index!43973 lt!613120) #b00000000000000000000000000000000) (bvslt (index!43973 lt!613120) (size!46633 a!2901)))))

(assert (=> b!1395736 (= e!790173 (= (select (arr!46083 a!2901) (index!43973 lt!613120)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1395737 () Bool)

(assert (=> b!1395737 (= e!790174 (Intermediate!10400 true (toIndex!0 (select (arr!46083 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1395738 () Bool)

(assert (=> b!1395738 (= e!790176 (Intermediate!10400 false (toIndex!0 (select (arr!46083 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1395739 () Bool)

(assert (=> b!1395739 (= e!790177 e!790175)))

(declare-fun res!934863 () Bool)

(assert (=> b!1395739 (= res!934863 (and ((_ is Intermediate!10400) lt!613120) (not (undefined!11212 lt!613120)) (bvslt (x!125634 lt!613120) #b01111111111111111111111111111110) (bvsge (x!125634 lt!613120) #b00000000000000000000000000000000) (bvsge (x!125634 lt!613120) #b00000000000000000000000000000000)))))

(assert (=> b!1395739 (=> (not res!934863) (not e!790175))))

(assert (= (and d!150771 c!129891) b!1395737))

(assert (= (and d!150771 (not c!129891)) b!1395734))

(assert (= (and b!1395734 c!129890) b!1395738))

(assert (= (and b!1395734 (not c!129890)) b!1395732))

(assert (= (and d!150771 c!129892) b!1395731))

(assert (= (and d!150771 (not c!129892)) b!1395739))

(assert (= (and b!1395739 res!934863) b!1395735))

(assert (= (and b!1395735 (not res!934861)) b!1395733))

(assert (= (and b!1395733 (not res!934862)) b!1395736))

(assert (=> b!1395732 m!1282059))

(declare-fun m!1282185 () Bool)

(assert (=> b!1395732 m!1282185))

(assert (=> b!1395732 m!1282185))

(assert (=> b!1395732 m!1282035))

(declare-fun m!1282187 () Bool)

(assert (=> b!1395732 m!1282187))

(declare-fun m!1282189 () Bool)

(assert (=> b!1395735 m!1282189))

(assert (=> b!1395733 m!1282189))

(assert (=> d!150771 m!1282059))

(declare-fun m!1282191 () Bool)

(assert (=> d!150771 m!1282191))

(assert (=> d!150771 m!1282041))

(assert (=> b!1395736 m!1282189))

(assert (=> b!1395524 d!150771))

(declare-fun d!150773 () Bool)

(declare-fun lt!613123 () (_ BitVec 32))

(declare-fun lt!613122 () (_ BitVec 32))

(assert (=> d!150773 (= lt!613123 (bvmul (bvxor lt!613122 (bvlshr lt!613122 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150773 (= lt!613122 ((_ extract 31 0) (bvand (bvxor (select (arr!46083 a!2901) j!112) (bvlshr (select (arr!46083 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150773 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!934844 (let ((h!33836 ((_ extract 31 0) (bvand (bvxor (select (arr!46083 a!2901) j!112) (bvlshr (select (arr!46083 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!125638 (bvmul (bvxor h!33836 (bvlshr h!33836 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!125638 (bvlshr x!125638 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!934844 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!934844 #b00000000000000000000000000000000))))))

(assert (=> d!150773 (= (toIndex!0 (select (arr!46083 a!2901) j!112) mask!2840) (bvand (bvxor lt!613123 (bvlshr lt!613123 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1395524 d!150773))

(check-sat (not d!150749) (not b!1395637) (not b!1395568) (not b!1395590) (not bm!66833) (not b!1395732) (not d!150767) (not b!1395570) (not d!150735) (not bm!66823) (not b!1395592) (not b!1395724) (not d!150771) (not b!1395722) (not b!1395591) (not b!1395704) (not bm!66828))
(check-sat)
