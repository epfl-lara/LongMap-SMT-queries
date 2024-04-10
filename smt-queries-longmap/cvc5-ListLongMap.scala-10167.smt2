; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119820 () Bool)

(assert start!119820)

(declare-fun b!1395496 () Bool)

(declare-fun e!790035 () Bool)

(declare-fun e!790037 () Bool)

(assert (=> b!1395496 (= e!790035 e!790037)))

(declare-fun res!934739 () Bool)

(assert (=> b!1395496 (=> res!934739 e!790037)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95451 0))(
  ( (array!95452 (arr!46082 (Array (_ BitVec 32) (_ BitVec 64))) (size!46632 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95451)

(declare-fun i!1037 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10399 0))(
  ( (MissingZero!10399 (index!43967 (_ BitVec 32))) (Found!10399 (index!43968 (_ BitVec 32))) (Intermediate!10399 (undefined!11211 Bool) (index!43969 (_ BitVec 32)) (x!125633 (_ BitVec 32))) (Undefined!10399) (MissingVacant!10399 (index!43970 (_ BitVec 32))) )
))
(declare-fun lt!613007 () SeekEntryResult!10399)

(declare-fun lt!613008 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95451 (_ BitVec 32)) SeekEntryResult!10399)

(assert (=> b!1395496 (= res!934739 (= lt!613007 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613008 (select (store (arr!46082 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95452 (store (arr!46082 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46632 a!2901)) mask!2840)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1395496 (= lt!613008 (toIndex!0 (select (store (arr!46082 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840))))

(declare-fun e!790033 () Bool)

(declare-fun b!1395497 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95451 (_ BitVec 32)) SeekEntryResult!10399)

(assert (=> b!1395497 (= e!790033 (= (seekEntryOrOpen!0 (select (arr!46082 a!2901) j!112) a!2901 mask!2840) (Found!10399 j!112)))))

(declare-fun b!1395498 () Bool)

(declare-fun res!934743 () Bool)

(declare-fun e!790036 () Bool)

(assert (=> b!1395498 (=> (not res!934743) (not e!790036))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95451 (_ BitVec 32)) Bool)

(assert (=> b!1395498 (= res!934743 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1395499 () Bool)

(assert (=> b!1395499 (= e!790037 (or (bvslt mask!2840 #b00000000000000000000000000000000) (and (bvsge lt!613008 #b00000000000000000000000000000000) (bvslt lt!613008 (bvadd #b00000000000000000000000000000001 mask!2840)))))))

(declare-fun b!1395500 () Bool)

(assert (=> b!1395500 (= e!790036 (not e!790035))))

(declare-fun res!934746 () Bool)

(assert (=> b!1395500 (=> res!934746 e!790035)))

(assert (=> b!1395500 (= res!934746 (or (not (is-Intermediate!10399 lt!613007)) (undefined!11211 lt!613007)))))

(assert (=> b!1395500 e!790033))

(declare-fun res!934747 () Bool)

(assert (=> b!1395500 (=> (not res!934747) (not e!790033))))

(assert (=> b!1395500 (= res!934747 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46802 0))(
  ( (Unit!46803) )
))
(declare-fun lt!613006 () Unit!46802)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95451 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46802)

(assert (=> b!1395500 (= lt!613006 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1395500 (= lt!613007 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46082 a!2901) j!112) mask!2840) (select (arr!46082 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!934740 () Bool)

(assert (=> start!119820 (=> (not res!934740) (not e!790036))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119820 (= res!934740 (validMask!0 mask!2840))))

(assert (=> start!119820 e!790036))

(assert (=> start!119820 true))

(declare-fun array_inv!35110 (array!95451) Bool)

(assert (=> start!119820 (array_inv!35110 a!2901)))

(declare-fun b!1395501 () Bool)

(declare-fun res!934741 () Bool)

(assert (=> b!1395501 (=> (not res!934741) (not e!790036))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1395501 (= res!934741 (validKeyInArray!0 (select (arr!46082 a!2901) j!112)))))

(declare-fun b!1395502 () Bool)

(declare-fun res!934742 () Bool)

(assert (=> b!1395502 (=> (not res!934742) (not e!790036))))

(declare-datatypes ((List!32601 0))(
  ( (Nil!32598) (Cons!32597 (h!33833 (_ BitVec 64)) (t!47295 List!32601)) )
))
(declare-fun arrayNoDuplicates!0 (array!95451 (_ BitVec 32) List!32601) Bool)

(assert (=> b!1395502 (= res!934742 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32598))))

(declare-fun b!1395503 () Bool)

(declare-fun res!934745 () Bool)

(assert (=> b!1395503 (=> (not res!934745) (not e!790036))))

(assert (=> b!1395503 (= res!934745 (and (= (size!46632 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46632 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46632 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1395504 () Bool)

(declare-fun res!934744 () Bool)

(assert (=> b!1395504 (=> (not res!934744) (not e!790036))))

(assert (=> b!1395504 (= res!934744 (validKeyInArray!0 (select (arr!46082 a!2901) i!1037)))))

(assert (= (and start!119820 res!934740) b!1395503))

(assert (= (and b!1395503 res!934745) b!1395504))

(assert (= (and b!1395504 res!934744) b!1395501))

(assert (= (and b!1395501 res!934741) b!1395498))

(assert (= (and b!1395498 res!934743) b!1395502))

(assert (= (and b!1395502 res!934742) b!1395500))

(assert (= (and b!1395500 res!934747) b!1395497))

(assert (= (and b!1395500 (not res!934746)) b!1395496))

(assert (= (and b!1395496 (not res!934739)) b!1395499))

(declare-fun m!1281999 () Bool)

(assert (=> b!1395504 m!1281999))

(assert (=> b!1395504 m!1281999))

(declare-fun m!1282001 () Bool)

(assert (=> b!1395504 m!1282001))

(declare-fun m!1282003 () Bool)

(assert (=> b!1395496 m!1282003))

(declare-fun m!1282005 () Bool)

(assert (=> b!1395496 m!1282005))

(assert (=> b!1395496 m!1282005))

(declare-fun m!1282007 () Bool)

(assert (=> b!1395496 m!1282007))

(assert (=> b!1395496 m!1282005))

(declare-fun m!1282009 () Bool)

(assert (=> b!1395496 m!1282009))

(declare-fun m!1282011 () Bool)

(assert (=> b!1395498 m!1282011))

(declare-fun m!1282013 () Bool)

(assert (=> b!1395497 m!1282013))

(assert (=> b!1395497 m!1282013))

(declare-fun m!1282015 () Bool)

(assert (=> b!1395497 m!1282015))

(declare-fun m!1282017 () Bool)

(assert (=> b!1395502 m!1282017))

(assert (=> b!1395500 m!1282013))

(declare-fun m!1282019 () Bool)

(assert (=> b!1395500 m!1282019))

(assert (=> b!1395500 m!1282013))

(declare-fun m!1282021 () Bool)

(assert (=> b!1395500 m!1282021))

(assert (=> b!1395500 m!1282019))

(assert (=> b!1395500 m!1282013))

(declare-fun m!1282023 () Bool)

(assert (=> b!1395500 m!1282023))

(declare-fun m!1282025 () Bool)

(assert (=> b!1395500 m!1282025))

(assert (=> b!1395501 m!1282013))

(assert (=> b!1395501 m!1282013))

(declare-fun m!1282027 () Bool)

(assert (=> b!1395501 m!1282027))

(declare-fun m!1282029 () Bool)

(assert (=> start!119820 m!1282029))

(declare-fun m!1282031 () Bool)

(assert (=> start!119820 m!1282031))

(push 1)

(assert (not b!1395504))

(assert (not b!1395498))

(assert (not b!1395497))

(assert (not b!1395502))

(assert (not b!1395496))

(assert (not b!1395500))

(assert (not start!119820))

(assert (not b!1395501))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun bm!66832 () Bool)

(declare-fun call!66835 () Bool)

(assert (=> bm!66832 (= call!66835 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1395607 () Bool)

(declare-fun e!790106 () Bool)

(assert (=> b!1395607 (= e!790106 call!66835)))

(declare-fun b!1395608 () Bool)

(declare-fun e!790104 () Bool)

(declare-fun e!790105 () Bool)

(assert (=> b!1395608 (= e!790104 e!790105)))

(declare-fun c!129843 () Bool)

(assert (=> b!1395608 (= c!129843 (validKeyInArray!0 (select (arr!46082 a!2901) j!112)))))

(declare-fun b!1395609 () Bool)

(assert (=> b!1395609 (= e!790105 e!790106)))

(declare-fun lt!613053 () (_ BitVec 64))

(assert (=> b!1395609 (= lt!613053 (select (arr!46082 a!2901) j!112))))

(declare-fun lt!613052 () Unit!46802)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!95451 (_ BitVec 64) (_ BitVec 32)) Unit!46802)

(assert (=> b!1395609 (= lt!613052 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!613053 j!112))))

(declare-fun arrayContainsKey!0 (array!95451 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1395609 (arrayContainsKey!0 a!2901 lt!613053 #b00000000000000000000000000000000)))

(declare-fun lt!613051 () Unit!46802)

(assert (=> b!1395609 (= lt!613051 lt!613052)))

(declare-fun res!934827 () Bool)

(assert (=> b!1395609 (= res!934827 (= (seekEntryOrOpen!0 (select (arr!46082 a!2901) j!112) a!2901 mask!2840) (Found!10399 j!112)))))

(assert (=> b!1395609 (=> (not res!934827) (not e!790106))))

(declare-fun b!1395606 () Bool)

(assert (=> b!1395606 (= e!790105 call!66835)))

(declare-fun d!150733 () Bool)

(declare-fun res!934828 () Bool)

(assert (=> d!150733 (=> res!934828 e!790104)))

(assert (=> d!150733 (= res!934828 (bvsge j!112 (size!46632 a!2901)))))

(assert (=> d!150733 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!790104)))

(assert (= (and d!150733 (not res!934828)) b!1395608))

(assert (= (and b!1395608 c!129843) b!1395609))

(assert (= (and b!1395608 (not c!129843)) b!1395606))

(assert (= (and b!1395609 res!934827) b!1395607))

(assert (= (or b!1395607 b!1395606) bm!66832))

(declare-fun m!1282123 () Bool)

(assert (=> bm!66832 m!1282123))

(assert (=> b!1395608 m!1282013))

(assert (=> b!1395608 m!1282013))

(assert (=> b!1395608 m!1282027))

(assert (=> b!1395609 m!1282013))

(declare-fun m!1282125 () Bool)

(assert (=> b!1395609 m!1282125))

(declare-fun m!1282127 () Bool)

(assert (=> b!1395609 m!1282127))

(assert (=> b!1395609 m!1282013))

(assert (=> b!1395609 m!1282015))

(assert (=> b!1395500 d!150733))

(declare-fun d!150739 () Bool)

(assert (=> d!150739 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!613059 () Unit!46802)

(declare-fun choose!38 (array!95451 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46802)

(assert (=> d!150739 (= lt!613059 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!150739 (validMask!0 mask!2840)))

(assert (=> d!150739 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!613059)))

(declare-fun bs!40617 () Bool)

(assert (= bs!40617 d!150739))

(assert (=> bs!40617 m!1282025))

(declare-fun m!1282131 () Bool)

(assert (=> bs!40617 m!1282131))

(assert (=> bs!40617 m!1282029))

(assert (=> b!1395500 d!150739))

(declare-fun e!790148 () SeekEntryResult!10399)

(declare-fun b!1395682 () Bool)

(assert (=> b!1395682 (= e!790148 (Intermediate!10399 false (toIndex!0 (select (arr!46082 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1395683 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1395683 (= e!790148 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46082 a!2901) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (arr!46082 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1395684 () Bool)

(declare-fun e!790147 () Bool)

(declare-fun e!790149 () Bool)

(assert (=> b!1395684 (= e!790147 e!790149)))

(declare-fun res!934857 () Bool)

(declare-fun lt!613082 () SeekEntryResult!10399)

(assert (=> b!1395684 (= res!934857 (and (is-Intermediate!10399 lt!613082) (not (undefined!11211 lt!613082)) (bvslt (x!125633 lt!613082) #b01111111111111111111111111111110) (bvsge (x!125633 lt!613082) #b00000000000000000000000000000000) (bvsge (x!125633 lt!613082) #b00000000000000000000000000000000)))))

(assert (=> b!1395684 (=> (not res!934857) (not e!790149))))

(declare-fun b!1395685 () Bool)

(assert (=> b!1395685 (and (bvsge (index!43969 lt!613082) #b00000000000000000000000000000000) (bvslt (index!43969 lt!613082) (size!46632 a!2901)))))

(declare-fun res!934855 () Bool)

(assert (=> b!1395685 (= res!934855 (= (select (arr!46082 a!2901) (index!43969 lt!613082)) (select (arr!46082 a!2901) j!112)))))

(declare-fun e!790151 () Bool)

(assert (=> b!1395685 (=> res!934855 e!790151)))

(assert (=> b!1395685 (= e!790149 e!790151)))

(declare-fun b!1395686 () Bool)

(assert (=> b!1395686 (= e!790147 (bvsge (x!125633 lt!613082) #b01111111111111111111111111111110))))

(declare-fun b!1395687 () Bool)

(assert (=> b!1395687 (and (bvsge (index!43969 lt!613082) #b00000000000000000000000000000000) (bvslt (index!43969 lt!613082) (size!46632 a!2901)))))

(declare-fun res!934856 () Bool)

(assert (=> b!1395687 (= res!934856 (= (select (arr!46082 a!2901) (index!43969 lt!613082)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1395687 (=> res!934856 e!790151)))

(declare-fun d!150743 () Bool)

(assert (=> d!150743 e!790147))

(declare-fun c!129869 () Bool)

(assert (=> d!150743 (= c!129869 (and (is-Intermediate!10399 lt!613082) (undefined!11211 lt!613082)))))

(declare-fun e!790150 () SeekEntryResult!10399)

(assert (=> d!150743 (= lt!613082 e!790150)))

(declare-fun c!129870 () Bool)

(assert (=> d!150743 (= c!129870 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!613083 () (_ BitVec 64))

(assert (=> d!150743 (= lt!613083 (select (arr!46082 a!2901) (toIndex!0 (select (arr!46082 a!2901) j!112) mask!2840)))))

(assert (=> d!150743 (validMask!0 mask!2840)))

(assert (=> d!150743 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46082 a!2901) j!112) mask!2840) (select (arr!46082 a!2901) j!112) a!2901 mask!2840) lt!613082)))

(declare-fun b!1395688 () Bool)

(assert (=> b!1395688 (= e!790150 e!790148)))

(declare-fun c!129868 () Bool)

(assert (=> b!1395688 (= c!129868 (or (= lt!613083 (select (arr!46082 a!2901) j!112)) (= (bvadd lt!613083 lt!613083) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1395689 () Bool)

(assert (=> b!1395689 (= e!790150 (Intermediate!10399 true (toIndex!0 (select (arr!46082 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1395690 () Bool)

(assert (=> b!1395690 (and (bvsge (index!43969 lt!613082) #b00000000000000000000000000000000) (bvslt (index!43969 lt!613082) (size!46632 a!2901)))))

(assert (=> b!1395690 (= e!790151 (= (select (arr!46082 a!2901) (index!43969 lt!613082)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!150743 c!129870) b!1395689))

(assert (= (and d!150743 (not c!129870)) b!1395688))

(assert (= (and b!1395688 c!129868) b!1395682))

(assert (= (and b!1395688 (not c!129868)) b!1395683))

(assert (= (and d!150743 c!129869) b!1395686))

(assert (= (and d!150743 (not c!129869)) b!1395684))

(assert (= (and b!1395684 res!934857) b!1395685))

(assert (= (and b!1395685 (not res!934855)) b!1395687))

(assert (= (and b!1395687 (not res!934856)) b!1395690))

(declare-fun m!1282149 () Bool)

(assert (=> b!1395687 m!1282149))

(assert (=> b!1395690 m!1282149))

(assert (=> b!1395683 m!1282019))

(declare-fun m!1282151 () Bool)

(assert (=> b!1395683 m!1282151))

(assert (=> b!1395683 m!1282151))

(assert (=> b!1395683 m!1282013))

(declare-fun m!1282153 () Bool)

(assert (=> b!1395683 m!1282153))

(assert (=> b!1395685 m!1282149))

(assert (=> d!150743 m!1282019))

(declare-fun m!1282155 () Bool)

(assert (=> d!150743 m!1282155))

(assert (=> d!150743 m!1282029))

(assert (=> b!1395500 d!150743))

(declare-fun d!150751 () Bool)

(declare-fun lt!613095 () (_ BitVec 32))

(declare-fun lt!613094 () (_ BitVec 32))

(assert (=> d!150751 (= lt!613095 (bvmul (bvxor lt!613094 (bvlshr lt!613094 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150751 (= lt!613094 ((_ extract 31 0) (bvand (bvxor (select (arr!46082 a!2901) j!112) (bvlshr (select (arr!46082 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150751 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!934858 (let ((h!33838 ((_ extract 31 0) (bvand (bvxor (select (arr!46082 a!2901) j!112) (bvlshr (select (arr!46082 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!125641 (bvmul (bvxor h!33838 (bvlshr h!33838 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!125641 (bvlshr x!125641 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!934858 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!934858 #b00000000000000000000000000000000))))))

(assert (=> d!150751 (= (toIndex!0 (select (arr!46082 a!2901) j!112) mask!2840) (bvand (bvxor lt!613095 (bvlshr lt!613095 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1395500 d!150751))

(declare-fun d!150755 () Bool)

(assert (=> d!150755 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!119820 d!150755))

(declare-fun d!150757 () Bool)

(assert (=> d!150757 (= (array_inv!35110 a!2901) (bvsge (size!46632 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!119820 d!150757))

(declare-fun d!150759 () Bool)

(assert (=> d!150759 (= (validKeyInArray!0 (select (arr!46082 a!2901) i!1037)) (and (not (= (select (arr!46082 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46082 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1395504 d!150759))

(declare-fun b!1395752 () Bool)

(declare-fun c!129900 () Bool)

(declare-fun lt!613130 () (_ BitVec 64))

(assert (=> b!1395752 (= c!129900 (= lt!613130 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!790185 () SeekEntryResult!10399)

(declare-fun e!790186 () SeekEntryResult!10399)

(assert (=> b!1395752 (= e!790185 e!790186)))

(declare-fun b!1395753 () Bool)

(declare-fun lt!613131 () SeekEntryResult!10399)

(assert (=> b!1395753 (= e!790186 (MissingZero!10399 (index!43969 lt!613131)))))

(declare-fun b!1395754 () Bool)

(declare-fun e!790184 () SeekEntryResult!10399)

(assert (=> b!1395754 (= e!790184 Undefined!10399)))

(declare-fun b!1395755 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95451 (_ BitVec 32)) SeekEntryResult!10399)

(assert (=> b!1395755 (= e!790186 (seekKeyOrZeroReturnVacant!0 (x!125633 lt!613131) (index!43969 lt!613131) (index!43969 lt!613131) (select (arr!46082 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1395756 () Bool)

(assert (=> b!1395756 (= e!790184 e!790185)))

(assert (=> b!1395756 (= lt!613130 (select (arr!46082 a!2901) (index!43969 lt!613131)))))

(declare-fun c!129899 () Bool)

(assert (=> b!1395756 (= c!129899 (= lt!613130 (select (arr!46082 a!2901) j!112)))))

(declare-fun d!150761 () Bool)

(declare-fun lt!613132 () SeekEntryResult!10399)

(assert (=> d!150761 (and (or (is-Undefined!10399 lt!613132) (not (is-Found!10399 lt!613132)) (and (bvsge (index!43968 lt!613132) #b00000000000000000000000000000000) (bvslt (index!43968 lt!613132) (size!46632 a!2901)))) (or (is-Undefined!10399 lt!613132) (is-Found!10399 lt!613132) (not (is-MissingZero!10399 lt!613132)) (and (bvsge (index!43967 lt!613132) #b00000000000000000000000000000000) (bvslt (index!43967 lt!613132) (size!46632 a!2901)))) (or (is-Undefined!10399 lt!613132) (is-Found!10399 lt!613132) (is-MissingZero!10399 lt!613132) (not (is-MissingVacant!10399 lt!613132)) (and (bvsge (index!43970 lt!613132) #b00000000000000000000000000000000) (bvslt (index!43970 lt!613132) (size!46632 a!2901)))) (or (is-Undefined!10399 lt!613132) (ite (is-Found!10399 lt!613132) (= (select (arr!46082 a!2901) (index!43968 lt!613132)) (select (arr!46082 a!2901) j!112)) (ite (is-MissingZero!10399 lt!613132) (= (select (arr!46082 a!2901) (index!43967 lt!613132)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10399 lt!613132) (= (select (arr!46082 a!2901) (index!43970 lt!613132)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!150761 (= lt!613132 e!790184)))

(declare-fun c!129901 () Bool)

(assert (=> d!150761 (= c!129901 (and (is-Intermediate!10399 lt!613131) (undefined!11211 lt!613131)))))

(assert (=> d!150761 (= lt!613131 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46082 a!2901) j!112) mask!2840) (select (arr!46082 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!150761 (validMask!0 mask!2840)))

(assert (=> d!150761 (= (seekEntryOrOpen!0 (select (arr!46082 a!2901) j!112) a!2901 mask!2840) lt!613132)))

(declare-fun b!1395757 () Bool)

(assert (=> b!1395757 (= e!790185 (Found!10399 (index!43969 lt!613131)))))

(assert (= (and d!150761 c!129901) b!1395754))

(assert (= (and d!150761 (not c!129901)) b!1395756))

(assert (= (and b!1395756 c!129899) b!1395757))

(assert (= (and b!1395756 (not c!129899)) b!1395752))

(assert (= (and b!1395752 c!129900) b!1395753))

(assert (= (and b!1395752 (not c!129900)) b!1395755))

(assert (=> b!1395755 m!1282013))

(declare-fun m!1282193 () Bool)

(assert (=> b!1395755 m!1282193))

(declare-fun m!1282195 () Bool)

(assert (=> b!1395756 m!1282195))

(assert (=> d!150761 m!1282019))

(assert (=> d!150761 m!1282013))

(assert (=> d!150761 m!1282023))

(declare-fun m!1282197 () Bool)

(assert (=> d!150761 m!1282197))

(assert (=> d!150761 m!1282013))

(assert (=> d!150761 m!1282019))

(declare-fun m!1282199 () Bool)

(assert (=> d!150761 m!1282199))

(declare-fun m!1282201 () Bool)

(assert (=> d!150761 m!1282201))

(assert (=> d!150761 m!1282029))

(assert (=> b!1395497 d!150761))

(declare-fun bm!66834 () Bool)

(declare-fun call!66837 () Bool)

(assert (=> bm!66834 (= call!66837 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1395769 () Bool)

(declare-fun e!790197 () Bool)

(assert (=> b!1395769 (= e!790197 call!66837)))

(declare-fun b!1395770 () Bool)

(declare-fun e!790195 () Bool)

(declare-fun e!790196 () Bool)

(assert (=> b!1395770 (= e!790195 e!790196)))

(declare-fun c!129904 () Bool)

(assert (=> b!1395770 (= c!129904 (validKeyInArray!0 (select (arr!46082 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1395771 () Bool)

(assert (=> b!1395771 (= e!790196 e!790197)))

(declare-fun lt!613135 () (_ BitVec 64))

(assert (=> b!1395771 (= lt!613135 (select (arr!46082 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!613134 () Unit!46802)

(assert (=> b!1395771 (= lt!613134 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!613135 #b00000000000000000000000000000000))))

(assert (=> b!1395771 (arrayContainsKey!0 a!2901 lt!613135 #b00000000000000000000000000000000)))

(declare-fun lt!613133 () Unit!46802)

(assert (=> b!1395771 (= lt!613133 lt!613134)))

(declare-fun res!934870 () Bool)

(assert (=> b!1395771 (= res!934870 (= (seekEntryOrOpen!0 (select (arr!46082 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10399 #b00000000000000000000000000000000)))))

(assert (=> b!1395771 (=> (not res!934870) (not e!790197))))

(declare-fun b!1395768 () Bool)

(assert (=> b!1395768 (= e!790196 call!66837)))

(declare-fun d!150781 () Bool)

(declare-fun res!934871 () Bool)

(assert (=> d!150781 (=> res!934871 e!790195)))

(assert (=> d!150781 (= res!934871 (bvsge #b00000000000000000000000000000000 (size!46632 a!2901)))))

(assert (=> d!150781 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!790195)))

(assert (= (and d!150781 (not res!934871)) b!1395770))

(assert (= (and b!1395770 c!129904) b!1395771))

(assert (= (and b!1395770 (not c!129904)) b!1395768))

(assert (= (and b!1395771 res!934870) b!1395769))

(assert (= (or b!1395769 b!1395768) bm!66834))

(declare-fun m!1282203 () Bool)

(assert (=> bm!66834 m!1282203))

(declare-fun m!1282205 () Bool)

(assert (=> b!1395770 m!1282205))

(assert (=> b!1395770 m!1282205))

(declare-fun m!1282207 () Bool)

(assert (=> b!1395770 m!1282207))

(assert (=> b!1395771 m!1282205))

(declare-fun m!1282209 () Bool)

(assert (=> b!1395771 m!1282209))

(declare-fun m!1282211 () Bool)

(assert (=> b!1395771 m!1282211))

(assert (=> b!1395771 m!1282205))

(declare-fun m!1282213 () Bool)

(assert (=> b!1395771 m!1282213))

(assert (=> b!1395498 d!150781))

(declare-fun b!1395772 () Bool)

(declare-fun e!790199 () SeekEntryResult!10399)

(assert (=> b!1395772 (= e!790199 (Intermediate!10399 false lt!613008 #b00000000000000000000000000000000))))

(declare-fun b!1395773 () Bool)

(assert (=> b!1395773 (= e!790199 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!613008 #b00000000000000000000000000000000 mask!2840) (select (store (arr!46082 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95452 (store (arr!46082 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46632 a!2901)) mask!2840))))

(declare-fun b!1395774 () Bool)

(declare-fun e!790198 () Bool)

(declare-fun e!790200 () Bool)

(assert (=> b!1395774 (= e!790198 e!790200)))

(declare-fun res!934874 () Bool)

(declare-fun lt!613136 () SeekEntryResult!10399)

(assert (=> b!1395774 (= res!934874 (and (is-Intermediate!10399 lt!613136) (not (undefined!11211 lt!613136)) (bvslt (x!125633 lt!613136) #b01111111111111111111111111111110) (bvsge (x!125633 lt!613136) #b00000000000000000000000000000000) (bvsge (x!125633 lt!613136) #b00000000000000000000000000000000)))))

(assert (=> b!1395774 (=> (not res!934874) (not e!790200))))

(declare-fun b!1395775 () Bool)

(assert (=> b!1395775 (and (bvsge (index!43969 lt!613136) #b00000000000000000000000000000000) (bvslt (index!43969 lt!613136) (size!46632 (array!95452 (store (arr!46082 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46632 a!2901)))))))

(declare-fun res!934872 () Bool)

(assert (=> b!1395775 (= res!934872 (= (select (arr!46082 (array!95452 (store (arr!46082 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46632 a!2901))) (index!43969 lt!613136)) (select (store (arr!46082 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(declare-fun e!790202 () Bool)

(assert (=> b!1395775 (=> res!934872 e!790202)))

(assert (=> b!1395775 (= e!790200 e!790202)))

(declare-fun b!1395776 () Bool)

(assert (=> b!1395776 (= e!790198 (bvsge (x!125633 lt!613136) #b01111111111111111111111111111110))))

(declare-fun b!1395777 () Bool)

(assert (=> b!1395777 (and (bvsge (index!43969 lt!613136) #b00000000000000000000000000000000) (bvslt (index!43969 lt!613136) (size!46632 (array!95452 (store (arr!46082 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46632 a!2901)))))))

(declare-fun res!934873 () Bool)

(assert (=> b!1395777 (= res!934873 (= (select (arr!46082 (array!95452 (store (arr!46082 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46632 a!2901))) (index!43969 lt!613136)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1395777 (=> res!934873 e!790202)))

(declare-fun d!150783 () Bool)

(assert (=> d!150783 e!790198))

(declare-fun c!129906 () Bool)

(assert (=> d!150783 (= c!129906 (and (is-Intermediate!10399 lt!613136) (undefined!11211 lt!613136)))))

(declare-fun e!790201 () SeekEntryResult!10399)

(assert (=> d!150783 (= lt!613136 e!790201)))

(declare-fun c!129907 () Bool)

(assert (=> d!150783 (= c!129907 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!613137 () (_ BitVec 64))

(assert (=> d!150783 (= lt!613137 (select (arr!46082 (array!95452 (store (arr!46082 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46632 a!2901))) lt!613008))))

(assert (=> d!150783 (validMask!0 mask!2840)))

(assert (=> d!150783 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613008 (select (store (arr!46082 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95452 (store (arr!46082 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46632 a!2901)) mask!2840) lt!613136)))

(declare-fun b!1395778 () Bool)

(assert (=> b!1395778 (= e!790201 e!790199)))

(declare-fun c!129905 () Bool)

(assert (=> b!1395778 (= c!129905 (or (= lt!613137 (select (store (arr!46082 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)) (= (bvadd lt!613137 lt!613137) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1395779 () Bool)

(assert (=> b!1395779 (= e!790201 (Intermediate!10399 true lt!613008 #b00000000000000000000000000000000))))

(declare-fun b!1395780 () Bool)

(assert (=> b!1395780 (and (bvsge (index!43969 lt!613136) #b00000000000000000000000000000000) (bvslt (index!43969 lt!613136) (size!46632 (array!95452 (store (arr!46082 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46632 a!2901)))))))

(assert (=> b!1395780 (= e!790202 (= (select (arr!46082 (array!95452 (store (arr!46082 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46632 a!2901))) (index!43969 lt!613136)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!150783 c!129907) b!1395779))

(assert (= (and d!150783 (not c!129907)) b!1395778))

(assert (= (and b!1395778 c!129905) b!1395772))

(assert (= (and b!1395778 (not c!129905)) b!1395773))

(assert (= (and d!150783 c!129906) b!1395776))

(assert (= (and d!150783 (not c!129906)) b!1395774))

(assert (= (and b!1395774 res!934874) b!1395775))

(assert (= (and b!1395775 (not res!934872)) b!1395777))

(assert (= (and b!1395777 (not res!934873)) b!1395780))

(declare-fun m!1282215 () Bool)

(assert (=> b!1395777 m!1282215))

(assert (=> b!1395780 m!1282215))

(declare-fun m!1282217 () Bool)

(assert (=> b!1395773 m!1282217))

(assert (=> b!1395773 m!1282217))

(assert (=> b!1395773 m!1282005))

(declare-fun m!1282219 () Bool)

(assert (=> b!1395773 m!1282219))

(assert (=> b!1395775 m!1282215))

(declare-fun m!1282221 () Bool)

(assert (=> d!150783 m!1282221))

(assert (=> d!150783 m!1282029))

(assert (=> b!1395496 d!150783))

(declare-fun d!150785 () Bool)

(declare-fun lt!613139 () (_ BitVec 32))

(declare-fun lt!613138 () (_ BitVec 32))

(assert (=> d!150785 (= lt!613139 (bvmul (bvxor lt!613138 (bvlshr lt!613138 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150785 (= lt!613138 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46082 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46082 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150785 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!934858 (let ((h!33838 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46082 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46082 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!125641 (bvmul (bvxor h!33838 (bvlshr h!33838 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!125641 (bvlshr x!125641 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!934858 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!934858 #b00000000000000000000000000000000))))))

(assert (=> d!150785 (= (toIndex!0 (select (store (arr!46082 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvand (bvxor lt!613139 (bvlshr lt!613139 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1395496 d!150785))

(declare-fun d!150787 () Bool)

(assert (=> d!150787 (= (validKeyInArray!0 (select (arr!46082 a!2901) j!112)) (and (not (= (select (arr!46082 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46082 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1395501 d!150787))

(declare-fun b!1395809 () Bool)

(declare-fun e!790223 () Bool)

(declare-fun contains!9779 (List!32601 (_ BitVec 64)) Bool)

(assert (=> b!1395809 (= e!790223 (contains!9779 Nil!32598 (select (arr!46082 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1395810 () Bool)

(declare-fun e!790225 () Bool)

(declare-fun call!66844 () Bool)

(assert (=> b!1395810 (= e!790225 call!66844)))

(declare-fun bm!66841 () Bool)

(declare-fun c!129915 () Bool)

(assert (=> bm!66841 (= call!66844 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!129915 (Cons!32597 (select (arr!46082 a!2901) #b00000000000000000000000000000000) Nil!32598) Nil!32598)))))

(declare-fun b!1395812 () Bool)

(declare-fun e!790226 () Bool)

(declare-fun e!790224 () Bool)

(assert (=> b!1395812 (= e!790226 e!790224)))

(declare-fun res!934891 () Bool)

(assert (=> b!1395812 (=> (not res!934891) (not e!790224))))

(assert (=> b!1395812 (= res!934891 (not e!790223))))

(declare-fun res!934890 () Bool)

(assert (=> b!1395812 (=> (not res!934890) (not e!790223))))

(assert (=> b!1395812 (= res!934890 (validKeyInArray!0 (select (arr!46082 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1395813 () Bool)

(assert (=> b!1395813 (= e!790224 e!790225)))

(assert (=> b!1395813 (= c!129915 (validKeyInArray!0 (select (arr!46082 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!150789 () Bool)

(declare-fun res!934889 () Bool)

(assert (=> d!150789 (=> res!934889 e!790226)))

(assert (=> d!150789 (= res!934889 (bvsge #b00000000000000000000000000000000 (size!46632 a!2901)))))

(assert (=> d!150789 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32598) e!790226)))

(declare-fun b!1395811 () Bool)

(assert (=> b!1395811 (= e!790225 call!66844)))

(assert (= (and d!150789 (not res!934889)) b!1395812))

(assert (= (and b!1395812 res!934890) b!1395809))

(assert (= (and b!1395812 res!934891) b!1395813))

(assert (= (and b!1395813 c!129915) b!1395811))

(assert (= (and b!1395813 (not c!129915)) b!1395810))

(assert (= (or b!1395811 b!1395810) bm!66841))

(assert (=> b!1395809 m!1282205))

(assert (=> b!1395809 m!1282205))

(declare-fun m!1282247 () Bool)

(assert (=> b!1395809 m!1282247))

(assert (=> bm!66841 m!1282205))

(declare-fun m!1282249 () Bool)

(assert (=> bm!66841 m!1282249))

(assert (=> b!1395812 m!1282205))

(assert (=> b!1395812 m!1282205))

(assert (=> b!1395812 m!1282207))

(assert (=> b!1395813 m!1282205))

(assert (=> b!1395813 m!1282205))

(assert (=> b!1395813 m!1282207))

(assert (=> b!1395502 d!150789))

(push 1)

(assert (not d!150739))

(assert (not b!1395683))

(assert (not b!1395608))

(assert (not b!1395755))

(assert (not b!1395812))

(assert (not b!1395813))

(assert (not bm!66832))

(assert (not d!150761))

(assert (not b!1395809))

(assert (not d!150743))

(assert (not d!150783))

(assert (not b!1395773))

(assert (not b!1395770))

(assert (not bm!66841))

(assert (not b!1395771))

(assert (not bm!66834))

(assert (not b!1395609))

(check-sat)

(pop 1)

(push 1)

(check-sat)

