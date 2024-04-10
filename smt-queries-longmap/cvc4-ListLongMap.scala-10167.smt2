; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119824 () Bool)

(assert start!119824)

(declare-fun b!1395550 () Bool)

(declare-fun res!934795 () Bool)

(declare-fun e!790063 () Bool)

(assert (=> b!1395550 (=> (not res!934795) (not e!790063))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95455 0))(
  ( (array!95456 (arr!46084 (Array (_ BitVec 32) (_ BitVec 64))) (size!46634 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95455)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1395550 (= res!934795 (and (= (size!46634 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46634 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46634 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1395551 () Bool)

(declare-fun res!934794 () Bool)

(assert (=> b!1395551 (=> (not res!934794) (not e!790063))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95455 (_ BitVec 32)) Bool)

(assert (=> b!1395551 (= res!934794 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1395552 () Bool)

(declare-fun res!934796 () Bool)

(assert (=> b!1395552 (=> (not res!934796) (not e!790063))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1395552 (= res!934796 (validKeyInArray!0 (select (arr!46084 a!2901) i!1037)))))

(declare-fun res!934798 () Bool)

(assert (=> start!119824 (=> (not res!934798) (not e!790063))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119824 (= res!934798 (validMask!0 mask!2840))))

(assert (=> start!119824 e!790063))

(assert (=> start!119824 true))

(declare-fun array_inv!35112 (array!95455) Bool)

(assert (=> start!119824 (array_inv!35112 a!2901)))

(declare-fun b!1395553 () Bool)

(declare-fun res!934793 () Bool)

(assert (=> b!1395553 (=> (not res!934793) (not e!790063))))

(declare-datatypes ((List!32603 0))(
  ( (Nil!32600) (Cons!32599 (h!33835 (_ BitVec 64)) (t!47297 List!32603)) )
))
(declare-fun arrayNoDuplicates!0 (array!95455 (_ BitVec 32) List!32603) Bool)

(assert (=> b!1395553 (= res!934793 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32600))))

(declare-fun b!1395554 () Bool)

(declare-fun e!790067 () Bool)

(declare-datatypes ((SeekEntryResult!10401 0))(
  ( (MissingZero!10401 (index!43975 (_ BitVec 32))) (Found!10401 (index!43976 (_ BitVec 32))) (Intermediate!10401 (undefined!11213 Bool) (index!43977 (_ BitVec 32)) (x!125635 (_ BitVec 32))) (Undefined!10401) (MissingVacant!10401 (index!43978 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95455 (_ BitVec 32)) SeekEntryResult!10401)

(assert (=> b!1395554 (= e!790067 (= (seekEntryOrOpen!0 (select (arr!46084 a!2901) j!112) a!2901 mask!2840) (Found!10401 j!112)))))

(declare-fun b!1395555 () Bool)

(declare-fun e!790065 () Bool)

(declare-fun lt!613026 () (_ BitVec 32))

(assert (=> b!1395555 (= e!790065 (or (bvslt mask!2840 #b00000000000000000000000000000000) (and (bvsge lt!613026 #b00000000000000000000000000000000) (bvslt lt!613026 (bvadd #b00000000000000000000000000000001 mask!2840)))))))

(declare-fun b!1395556 () Bool)

(declare-fun e!790064 () Bool)

(assert (=> b!1395556 (= e!790063 (not e!790064))))

(declare-fun res!934800 () Bool)

(assert (=> b!1395556 (=> res!934800 e!790064)))

(declare-fun lt!613024 () SeekEntryResult!10401)

(assert (=> b!1395556 (= res!934800 (or (not (is-Intermediate!10401 lt!613024)) (undefined!11213 lt!613024)))))

(assert (=> b!1395556 e!790067))

(declare-fun res!934797 () Bool)

(assert (=> b!1395556 (=> (not res!934797) (not e!790067))))

(assert (=> b!1395556 (= res!934797 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46806 0))(
  ( (Unit!46807) )
))
(declare-fun lt!613025 () Unit!46806)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95455 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46806)

(assert (=> b!1395556 (= lt!613025 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95455 (_ BitVec 32)) SeekEntryResult!10401)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1395556 (= lt!613024 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46084 a!2901) j!112) mask!2840) (select (arr!46084 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1395557 () Bool)

(assert (=> b!1395557 (= e!790064 e!790065)))

(declare-fun res!934799 () Bool)

(assert (=> b!1395557 (=> res!934799 e!790065)))

(assert (=> b!1395557 (= res!934799 (= lt!613024 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613026 (select (store (arr!46084 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95456 (store (arr!46084 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46634 a!2901)) mask!2840)))))

(assert (=> b!1395557 (= lt!613026 (toIndex!0 (select (store (arr!46084 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840))))

(declare-fun b!1395558 () Bool)

(declare-fun res!934801 () Bool)

(assert (=> b!1395558 (=> (not res!934801) (not e!790063))))

(assert (=> b!1395558 (= res!934801 (validKeyInArray!0 (select (arr!46084 a!2901) j!112)))))

(assert (= (and start!119824 res!934798) b!1395550))

(assert (= (and b!1395550 res!934795) b!1395552))

(assert (= (and b!1395552 res!934796) b!1395558))

(assert (= (and b!1395558 res!934801) b!1395551))

(assert (= (and b!1395551 res!934794) b!1395553))

(assert (= (and b!1395553 res!934793) b!1395556))

(assert (= (and b!1395556 res!934797) b!1395554))

(assert (= (and b!1395556 (not res!934800)) b!1395557))

(assert (= (and b!1395557 (not res!934799)) b!1395555))

(declare-fun m!1282067 () Bool)

(assert (=> b!1395558 m!1282067))

(assert (=> b!1395558 m!1282067))

(declare-fun m!1282069 () Bool)

(assert (=> b!1395558 m!1282069))

(declare-fun m!1282071 () Bool)

(assert (=> b!1395551 m!1282071))

(declare-fun m!1282073 () Bool)

(assert (=> b!1395557 m!1282073))

(declare-fun m!1282075 () Bool)

(assert (=> b!1395557 m!1282075))

(assert (=> b!1395557 m!1282075))

(declare-fun m!1282077 () Bool)

(assert (=> b!1395557 m!1282077))

(assert (=> b!1395557 m!1282075))

(declare-fun m!1282079 () Bool)

(assert (=> b!1395557 m!1282079))

(declare-fun m!1282081 () Bool)

(assert (=> b!1395552 m!1282081))

(assert (=> b!1395552 m!1282081))

(declare-fun m!1282083 () Bool)

(assert (=> b!1395552 m!1282083))

(declare-fun m!1282085 () Bool)

(assert (=> start!119824 m!1282085))

(declare-fun m!1282087 () Bool)

(assert (=> start!119824 m!1282087))

(declare-fun m!1282089 () Bool)

(assert (=> b!1395553 m!1282089))

(assert (=> b!1395556 m!1282067))

(declare-fun m!1282091 () Bool)

(assert (=> b!1395556 m!1282091))

(assert (=> b!1395556 m!1282067))

(declare-fun m!1282093 () Bool)

(assert (=> b!1395556 m!1282093))

(assert (=> b!1395556 m!1282091))

(assert (=> b!1395556 m!1282067))

(declare-fun m!1282095 () Bool)

(assert (=> b!1395556 m!1282095))

(declare-fun m!1282097 () Bool)

(assert (=> b!1395556 m!1282097))

(assert (=> b!1395554 m!1282067))

(assert (=> b!1395554 m!1282067))

(declare-fun m!1282099 () Bool)

(assert (=> b!1395554 m!1282099))

(push 1)

(assert (not b!1395558))

(assert (not b!1395553))

(assert (not start!119824))

(assert (not b!1395556))

(assert (not b!1395554))

(assert (not b!1395552))

(assert (not b!1395557))

(assert (not b!1395551))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1395598 () Bool)

(declare-fun e!790097 () Bool)

(declare-fun call!66832 () Bool)

(assert (=> b!1395598 (= e!790097 call!66832)))

(declare-fun b!1395599 () Bool)

(declare-fun e!790099 () Bool)

(assert (=> b!1395599 (= e!790099 call!66832)))

(declare-fun d!150727 () Bool)

(declare-fun res!934823 () Bool)

(declare-fun e!790098 () Bool)

(assert (=> d!150727 (=> res!934823 e!790098)))

(assert (=> d!150727 (= res!934823 (bvsge j!112 (size!46634 a!2901)))))

(assert (=> d!150727 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!790098)))

(declare-fun b!1395600 () Bool)

(assert (=> b!1395600 (= e!790098 e!790097)))

(declare-fun c!129840 () Bool)

(assert (=> b!1395600 (= c!129840 (validKeyInArray!0 (select (arr!46084 a!2901) j!112)))))

(declare-fun bm!66829 () Bool)

(assert (=> bm!66829 (= call!66832 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1395601 () Bool)

(assert (=> b!1395601 (= e!790097 e!790099)))

(declare-fun lt!613044 () (_ BitVec 64))

(assert (=> b!1395601 (= lt!613044 (select (arr!46084 a!2901) j!112))))

(declare-fun lt!613042 () Unit!46806)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!95455 (_ BitVec 64) (_ BitVec 32)) Unit!46806)

(assert (=> b!1395601 (= lt!613042 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!613044 j!112))))

(declare-fun arrayContainsKey!0 (array!95455 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1395601 (arrayContainsKey!0 a!2901 lt!613044 #b00000000000000000000000000000000)))

(declare-fun lt!613043 () Unit!46806)

(assert (=> b!1395601 (= lt!613043 lt!613042)))

(declare-fun res!934824 () Bool)

(assert (=> b!1395601 (= res!934824 (= (seekEntryOrOpen!0 (select (arr!46084 a!2901) j!112) a!2901 mask!2840) (Found!10401 j!112)))))

(assert (=> b!1395601 (=> (not res!934824) (not e!790099))))

(assert (= (and d!150727 (not res!934823)) b!1395600))

(assert (= (and b!1395600 c!129840) b!1395601))

(assert (= (and b!1395600 (not c!129840)) b!1395598))

(assert (= (and b!1395601 res!934824) b!1395599))

(assert (= (or b!1395599 b!1395598) bm!66829))

(assert (=> b!1395600 m!1282067))

(assert (=> b!1395600 m!1282067))

(assert (=> b!1395600 m!1282069))

(declare-fun m!1282115 () Bool)

(assert (=> bm!66829 m!1282115))

(assert (=> b!1395601 m!1282067))

(declare-fun m!1282119 () Bool)

(assert (=> b!1395601 m!1282119))

(declare-fun m!1282121 () Bool)

(assert (=> b!1395601 m!1282121))

(assert (=> b!1395601 m!1282067))

(assert (=> b!1395601 m!1282099))

(assert (=> b!1395556 d!150727))

(declare-fun d!150737 () Bool)

(assert (=> d!150737 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!613056 () Unit!46806)

(declare-fun choose!38 (array!95455 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46806)

(assert (=> d!150737 (= lt!613056 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!150737 (validMask!0 mask!2840)))

(assert (=> d!150737 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!613056)))

(declare-fun bs!40616 () Bool)

(assert (= bs!40616 d!150737))

(assert (=> bs!40616 m!1282097))

(declare-fun m!1282129 () Bool)

(assert (=> bs!40616 m!1282129))

(assert (=> bs!40616 m!1282085))

(assert (=> b!1395556 d!150737))

(declare-fun d!150741 () Bool)

(declare-fun e!790145 () Bool)

(assert (=> d!150741 e!790145))

(declare-fun c!129865 () Bool)

(declare-fun lt!613075 () SeekEntryResult!10401)

(assert (=> d!150741 (= c!129865 (and (is-Intermediate!10401 lt!613075) (undefined!11213 lt!613075)))))

(declare-fun e!790143 () SeekEntryResult!10401)

(assert (=> d!150741 (= lt!613075 e!790143)))

(declare-fun c!129867 () Bool)

(assert (=> d!150741 (= c!129867 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!613074 () (_ BitVec 64))

(assert (=> d!150741 (= lt!613074 (select (arr!46084 a!2901) (toIndex!0 (select (arr!46084 a!2901) j!112) mask!2840)))))

(assert (=> d!150741 (validMask!0 mask!2840)))

(assert (=> d!150741 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46084 a!2901) j!112) mask!2840) (select (arr!46084 a!2901) j!112) a!2901 mask!2840) lt!613075)))

(declare-fun b!1395673 () Bool)

(assert (=> b!1395673 (= e!790143 (Intermediate!10401 true (toIndex!0 (select (arr!46084 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun e!790142 () SeekEntryResult!10401)

(declare-fun b!1395674 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1395674 (= e!790142 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46084 a!2901) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (arr!46084 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1395675 () Bool)

(assert (=> b!1395675 (= e!790145 (bvsge (x!125635 lt!613075) #b01111111111111111111111111111110))))

(declare-fun b!1395676 () Bool)

(assert (=> b!1395676 (= e!790143 e!790142)))

(declare-fun c!129866 () Bool)

(assert (=> b!1395676 (= c!129866 (or (= lt!613074 (select (arr!46084 a!2901) j!112)) (= (bvadd lt!613074 lt!613074) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1395677 () Bool)

(assert (=> b!1395677 (and (bvsge (index!43977 lt!613075) #b00000000000000000000000000000000) (bvslt (index!43977 lt!613075) (size!46634 a!2901)))))

(declare-fun e!790144 () Bool)

(assert (=> b!1395677 (= e!790144 (= (select (arr!46084 a!2901) (index!43977 lt!613075)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1395678 () Bool)

(assert (=> b!1395678 (and (bvsge (index!43977 lt!613075) #b00000000000000000000000000000000) (bvslt (index!43977 lt!613075) (size!46634 a!2901)))))

(declare-fun res!934852 () Bool)

(assert (=> b!1395678 (= res!934852 (= (select (arr!46084 a!2901) (index!43977 lt!613075)) (select (arr!46084 a!2901) j!112)))))

(assert (=> b!1395678 (=> res!934852 e!790144)))

(declare-fun e!790146 () Bool)

(assert (=> b!1395678 (= e!790146 e!790144)))

(declare-fun b!1395679 () Bool)

(assert (=> b!1395679 (= e!790142 (Intermediate!10401 false (toIndex!0 (select (arr!46084 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1395680 () Bool)

(assert (=> b!1395680 (= e!790145 e!790146)))

(declare-fun res!934853 () Bool)

(assert (=> b!1395680 (= res!934853 (and (is-Intermediate!10401 lt!613075) (not (undefined!11213 lt!613075)) (bvslt (x!125635 lt!613075) #b01111111111111111111111111111110) (bvsge (x!125635 lt!613075) #b00000000000000000000000000000000) (bvsge (x!125635 lt!613075) #b00000000000000000000000000000000)))))

(assert (=> b!1395680 (=> (not res!934853) (not e!790146))))

(declare-fun b!1395681 () Bool)

(assert (=> b!1395681 (and (bvsge (index!43977 lt!613075) #b00000000000000000000000000000000) (bvslt (index!43977 lt!613075) (size!46634 a!2901)))))

(declare-fun res!934851 () Bool)

(assert (=> b!1395681 (= res!934851 (= (select (arr!46084 a!2901) (index!43977 lt!613075)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1395681 (=> res!934851 e!790144)))

(assert (= (and d!150741 c!129867) b!1395673))

(assert (= (and d!150741 (not c!129867)) b!1395676))

(assert (= (and b!1395676 c!129866) b!1395679))

(assert (= (and b!1395676 (not c!129866)) b!1395674))

(assert (= (and d!150741 c!129865) b!1395675))

(assert (= (and d!150741 (not c!129865)) b!1395680))

(assert (= (and b!1395680 res!934853) b!1395678))

(assert (= (and b!1395678 (not res!934852)) b!1395681))

(assert (= (and b!1395681 (not res!934851)) b!1395677))

(declare-fun m!1282141 () Bool)

(assert (=> b!1395678 m!1282141))

(assert (=> b!1395674 m!1282091))

(declare-fun m!1282143 () Bool)

(assert (=> b!1395674 m!1282143))

(assert (=> b!1395674 m!1282143))

(assert (=> b!1395674 m!1282067))

(declare-fun m!1282145 () Bool)

(assert (=> b!1395674 m!1282145))

(assert (=> b!1395681 m!1282141))

(assert (=> d!150741 m!1282091))

(declare-fun m!1282147 () Bool)

(assert (=> d!150741 m!1282147))

(assert (=> d!150741 m!1282085))

(assert (=> b!1395677 m!1282141))

(assert (=> b!1395556 d!150741))

(declare-fun d!150747 () Bool)

(declare-fun lt!613089 () (_ BitVec 32))

(declare-fun lt!613088 () (_ BitVec 32))

(assert (=> d!150747 (= lt!613089 (bvmul (bvxor lt!613088 (bvlshr lt!613088 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150747 (= lt!613088 ((_ extract 31 0) (bvand (bvxor (select (arr!46084 a!2901) j!112) (bvlshr (select (arr!46084 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150747 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!934854 (let ((h!33837 ((_ extract 31 0) (bvand (bvxor (select (arr!46084 a!2901) j!112) (bvlshr (select (arr!46084 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!125640 (bvmul (bvxor h!33837 (bvlshr h!33837 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!125640 (bvlshr x!125640 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!934854 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!934854 #b00000000000000000000000000000000))))))

(assert (=> d!150747 (= (toIndex!0 (select (arr!46084 a!2901) j!112) mask!2840) (bvand (bvxor lt!613089 (bvlshr lt!613089 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1395556 d!150747))

(declare-fun e!790171 () SeekEntryResult!10401)

(declare-fun b!1395725 () Bool)

(declare-fun lt!613115 () SeekEntryResult!10401)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95455 (_ BitVec 32)) SeekEntryResult!10401)

(assert (=> b!1395725 (= e!790171 (seekKeyOrZeroReturnVacant!0 (x!125635 lt!613115) (index!43977 lt!613115) (index!43977 lt!613115) (select (arr!46084 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1395726 () Bool)

(declare-fun e!790170 () SeekEntryResult!10401)

(assert (=> b!1395726 (= e!790170 (Found!10401 (index!43977 lt!613115)))))

(declare-fun b!1395727 () Bool)

(declare-fun e!790172 () SeekEntryResult!10401)

(assert (=> b!1395727 (= e!790172 e!790170)))

(declare-fun lt!613116 () (_ BitVec 64))

(assert (=> b!1395727 (= lt!613116 (select (arr!46084 a!2901) (index!43977 lt!613115)))))

(declare-fun c!129888 () Bool)

(assert (=> b!1395727 (= c!129888 (= lt!613116 (select (arr!46084 a!2901) j!112)))))

(declare-fun b!1395729 () Bool)

(declare-fun c!129887 () Bool)

(assert (=> b!1395729 (= c!129887 (= lt!613116 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1395729 (= e!790170 e!790171)))

(declare-fun b!1395730 () Bool)

(assert (=> b!1395730 (= e!790171 (MissingZero!10401 (index!43977 lt!613115)))))

(declare-fun d!150753 () Bool)

(declare-fun lt!613114 () SeekEntryResult!10401)

(assert (=> d!150753 (and (or (is-Undefined!10401 lt!613114) (not (is-Found!10401 lt!613114)) (and (bvsge (index!43976 lt!613114) #b00000000000000000000000000000000) (bvslt (index!43976 lt!613114) (size!46634 a!2901)))) (or (is-Undefined!10401 lt!613114) (is-Found!10401 lt!613114) (not (is-MissingZero!10401 lt!613114)) (and (bvsge (index!43975 lt!613114) #b00000000000000000000000000000000) (bvslt (index!43975 lt!613114) (size!46634 a!2901)))) (or (is-Undefined!10401 lt!613114) (is-Found!10401 lt!613114) (is-MissingZero!10401 lt!613114) (not (is-MissingVacant!10401 lt!613114)) (and (bvsge (index!43978 lt!613114) #b00000000000000000000000000000000) (bvslt (index!43978 lt!613114) (size!46634 a!2901)))) (or (is-Undefined!10401 lt!613114) (ite (is-Found!10401 lt!613114) (= (select (arr!46084 a!2901) (index!43976 lt!613114)) (select (arr!46084 a!2901) j!112)) (ite (is-MissingZero!10401 lt!613114) (= (select (arr!46084 a!2901) (index!43975 lt!613114)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10401 lt!613114) (= (select (arr!46084 a!2901) (index!43978 lt!613114)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!150753 (= lt!613114 e!790172)))

(declare-fun c!129889 () Bool)

(assert (=> d!150753 (= c!129889 (and (is-Intermediate!10401 lt!613115) (undefined!11213 lt!613115)))))

(assert (=> d!150753 (= lt!613115 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46084 a!2901) j!112) mask!2840) (select (arr!46084 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!150753 (validMask!0 mask!2840)))

(assert (=> d!150753 (= (seekEntryOrOpen!0 (select (arr!46084 a!2901) j!112) a!2901 mask!2840) lt!613114)))

(declare-fun b!1395728 () Bool)

(assert (=> b!1395728 (= e!790172 Undefined!10401)))

(assert (= (and d!150753 c!129889) b!1395728))

(assert (= (and d!150753 (not c!129889)) b!1395727))

(assert (= (and b!1395727 c!129888) b!1395726))

(assert (= (and b!1395727 (not c!129888)) b!1395729))

(assert (= (and b!1395729 c!129887) b!1395730))

(assert (= (and b!1395729 (not c!129887)) b!1395725))

(assert (=> b!1395725 m!1282067))

(declare-fun m!1282173 () Bool)

(assert (=> b!1395725 m!1282173))

(declare-fun m!1282175 () Bool)

(assert (=> b!1395727 m!1282175))

(assert (=> d!150753 m!1282067))

(assert (=> d!150753 m!1282091))

(declare-fun m!1282177 () Bool)

(assert (=> d!150753 m!1282177))

(declare-fun m!1282179 () Bool)

(assert (=> d!150753 m!1282179))

(assert (=> d!150753 m!1282085))

(assert (=> d!150753 m!1282091))

(assert (=> d!150753 m!1282067))

(assert (=> d!150753 m!1282095))

(declare-fun m!1282181 () Bool)

(assert (=> d!150753 m!1282181))

(assert (=> b!1395554 d!150753))

(declare-fun d!150769 () Bool)

(assert (=> d!150769 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!119824 d!150769))

(declare-fun d!150775 () Bool)

(assert (=> d!150775 (= (array_inv!35112 a!2901) (bvsge (size!46634 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!119824 d!150775))

(declare-fun d!150777 () Bool)

(assert (=> d!150777 (= (validKeyInArray!0 (select (arr!46084 a!2901) j!112)) (and (not (= (select (arr!46084 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46084 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1395558 d!150777))

(declare-fun b!1395781 () Bool)

(declare-fun e!790205 () Bool)

(declare-fun e!790206 () Bool)

(assert (=> b!1395781 (= e!790205 e!790206)))

(declare-fun res!934875 () Bool)

(assert (=> b!1395781 (=> (not res!934875) (not e!790206))))

(declare-fun e!790203 () Bool)

(assert (=> b!1395781 (= res!934875 (not e!790203))))

(declare-fun res!934877 () Bool)

(assert (=> b!1395781 (=> (not res!934877) (not e!790203))))

(assert (=> b!1395781 (= res!934877 (validKeyInArray!0 (select (arr!46084 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1395782 () Bool)

(declare-fun e!790204 () Bool)

(declare-fun call!66840 () Bool)

(assert (=> b!1395782 (= e!790204 call!66840)))

(declare-fun b!1395783 () Bool)

(assert (=> b!1395783 (= e!790206 e!790204)))

(declare-fun c!129908 () Bool)

(assert (=> b!1395783 (= c!129908 (validKeyInArray!0 (select (arr!46084 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!66837 () Bool)

(assert (=> bm!66837 (= call!66840 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!129908 (Cons!32599 (select (arr!46084 a!2901) #b00000000000000000000000000000000) Nil!32600) Nil!32600)))))

(declare-fun d!150779 () Bool)

(declare-fun res!934876 () Bool)

(assert (=> d!150779 (=> res!934876 e!790205)))

(assert (=> d!150779 (= res!934876 (bvsge #b00000000000000000000000000000000 (size!46634 a!2901)))))

(assert (=> d!150779 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32600) e!790205)))

(declare-fun b!1395784 () Bool)

(declare-fun contains!9778 (List!32603 (_ BitVec 64)) Bool)

(assert (=> b!1395784 (= e!790203 (contains!9778 Nil!32600 (select (arr!46084 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1395785 () Bool)

(assert (=> b!1395785 (= e!790204 call!66840)))

(assert (= (and d!150779 (not res!934876)) b!1395781))

(assert (= (and b!1395781 res!934877) b!1395784))

(assert (= (and b!1395781 res!934875) b!1395783))

(assert (= (and b!1395783 c!129908) b!1395785))

(assert (= (and b!1395783 (not c!129908)) b!1395782))

(assert (= (or b!1395785 b!1395782) bm!66837))

(declare-fun m!1282223 () Bool)

(assert (=> b!1395781 m!1282223))

(assert (=> b!1395781 m!1282223))

(declare-fun m!1282225 () Bool)

(assert (=> b!1395781 m!1282225))

(assert (=> b!1395783 m!1282223))

(assert (=> b!1395783 m!1282223))

(assert (=> b!1395783 m!1282225))

(assert (=> bm!66837 m!1282223))

(declare-fun m!1282227 () Bool)

(assert (=> bm!66837 m!1282227))

(assert (=> b!1395784 m!1282223))

(assert (=> b!1395784 m!1282223))

(declare-fun m!1282229 () Bool)

(assert (=> b!1395784 m!1282229))

(assert (=> b!1395553 d!150779))

(declare-fun b!1395786 () Bool)

(declare-fun e!790207 () Bool)

(declare-fun call!66841 () Bool)

(assert (=> b!1395786 (= e!790207 call!66841)))

(declare-fun b!1395787 () Bool)

(declare-fun e!790209 () Bool)

(assert (=> b!1395787 (= e!790209 call!66841)))

(declare-fun d!150791 () Bool)

(declare-fun res!934878 () Bool)

(declare-fun e!790208 () Bool)

(assert (=> d!150791 (=> res!934878 e!790208)))

(assert (=> d!150791 (= res!934878 (bvsge #b00000000000000000000000000000000 (size!46634 a!2901)))))

(assert (=> d!150791 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!790208)))

(declare-fun b!1395788 () Bool)

(assert (=> b!1395788 (= e!790208 e!790207)))

(declare-fun c!129909 () Bool)

(assert (=> b!1395788 (= c!129909 (validKeyInArray!0 (select (arr!46084 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!66838 () Bool)

(assert (=> bm!66838 (= call!66841 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1395789 () Bool)

(assert (=> b!1395789 (= e!790207 e!790209)))

(declare-fun lt!613142 () (_ BitVec 64))

(assert (=> b!1395789 (= lt!613142 (select (arr!46084 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!613140 () Unit!46806)

(assert (=> b!1395789 (= lt!613140 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!613142 #b00000000000000000000000000000000))))

(assert (=> b!1395789 (arrayContainsKey!0 a!2901 lt!613142 #b00000000000000000000000000000000)))

(declare-fun lt!613141 () Unit!46806)

(assert (=> b!1395789 (= lt!613141 lt!613140)))

(declare-fun res!934879 () Bool)

(assert (=> b!1395789 (= res!934879 (= (seekEntryOrOpen!0 (select (arr!46084 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10401 #b00000000000000000000000000000000)))))

(assert (=> b!1395789 (=> (not res!934879) (not e!790209))))

(assert (= (and d!150791 (not res!934878)) b!1395788))

(assert (= (and b!1395788 c!129909) b!1395789))

(assert (= (and b!1395788 (not c!129909)) b!1395786))

(assert (= (and b!1395789 res!934879) b!1395787))

(assert (= (or b!1395787 b!1395786) bm!66838))

(assert (=> b!1395788 m!1282223))

(assert (=> b!1395788 m!1282223))

(assert (=> b!1395788 m!1282225))

(declare-fun m!1282231 () Bool)

(assert (=> bm!66838 m!1282231))

(assert (=> b!1395789 m!1282223))

(declare-fun m!1282233 () Bool)

(assert (=> b!1395789 m!1282233))

(declare-fun m!1282235 () Bool)

(assert (=> b!1395789 m!1282235))

(assert (=> b!1395789 m!1282223))

(declare-fun m!1282237 () Bool)

(assert (=> b!1395789 m!1282237))

(assert (=> b!1395551 d!150791))

(declare-fun d!150793 () Bool)

(assert (=> d!150793 (= (validKeyInArray!0 (select (arr!46084 a!2901) i!1037)) (and (not (= (select (arr!46084 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46084 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1395552 d!150793))

(declare-fun d!150795 () Bool)

(declare-fun e!790213 () Bool)

(assert (=> d!150795 e!790213))

(declare-fun c!129910 () Bool)

(declare-fun lt!613144 () SeekEntryResult!10401)

(assert (=> d!150795 (= c!129910 (and (is-Intermediate!10401 lt!613144) (undefined!11213 lt!613144)))))

(declare-fun e!790211 () SeekEntryResult!10401)

(assert (=> d!150795 (= lt!613144 e!790211)))

(declare-fun c!129912 () Bool)

(assert (=> d!150795 (= c!129912 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!613143 () (_ BitVec 64))

(assert (=> d!150795 (= lt!613143 (select (arr!46084 (array!95456 (store (arr!46084 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46634 a!2901))) lt!613026))))

(assert (=> d!150795 (validMask!0 mask!2840)))

(assert (=> d!150795 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613026 (select (store (arr!46084 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95456 (store (arr!46084 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46634 a!2901)) mask!2840) lt!613144)))

(declare-fun b!1395790 () Bool)

(assert (=> b!1395790 (= e!790211 (Intermediate!10401 true lt!613026 #b00000000000000000000000000000000))))

(declare-fun b!1395791 () Bool)

(declare-fun e!790210 () SeekEntryResult!10401)

(assert (=> b!1395791 (= e!790210 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!613026 #b00000000000000000000000000000000 mask!2840) (select (store (arr!46084 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95456 (store (arr!46084 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46634 a!2901)) mask!2840))))

(declare-fun b!1395792 () Bool)

(assert (=> b!1395792 (= e!790213 (bvsge (x!125635 lt!613144) #b01111111111111111111111111111110))))

(declare-fun b!1395793 () Bool)

(assert (=> b!1395793 (= e!790211 e!790210)))

(declare-fun c!129911 () Bool)

(assert (=> b!1395793 (= c!129911 (or (= lt!613143 (select (store (arr!46084 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)) (= (bvadd lt!613143 lt!613143) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1395794 () Bool)

(assert (=> b!1395794 (and (bvsge (index!43977 lt!613144) #b00000000000000000000000000000000) (bvslt (index!43977 lt!613144) (size!46634 (array!95456 (store (arr!46084 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46634 a!2901)))))))

(declare-fun e!790212 () Bool)

(assert (=> b!1395794 (= e!790212 (= (select (arr!46084 (array!95456 (store (arr!46084 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46634 a!2901))) (index!43977 lt!613144)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1395795 () Bool)

(assert (=> b!1395795 (and (bvsge (index!43977 lt!613144) #b00000000000000000000000000000000) (bvslt (index!43977 lt!613144) (size!46634 (array!95456 (store (arr!46084 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46634 a!2901)))))))

(declare-fun res!934881 () Bool)

(assert (=> b!1395795 (= res!934881 (= (select (arr!46084 (array!95456 (store (arr!46084 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46634 a!2901))) (index!43977 lt!613144)) (select (store (arr!46084 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(assert (=> b!1395795 (=> res!934881 e!790212)))

(declare-fun e!790214 () Bool)

(assert (=> b!1395795 (= e!790214 e!790212)))

(declare-fun b!1395796 () Bool)

(assert (=> b!1395796 (= e!790210 (Intermediate!10401 false lt!613026 #b00000000000000000000000000000000))))

(declare-fun b!1395797 () Bool)

(assert (=> b!1395797 (= e!790213 e!790214)))

(declare-fun res!934882 () Bool)

(assert (=> b!1395797 (= res!934882 (and (is-Intermediate!10401 lt!613144) (not (undefined!11213 lt!613144)) (bvslt (x!125635 lt!613144) #b01111111111111111111111111111110) (bvsge (x!125635 lt!613144) #b00000000000000000000000000000000) (bvsge (x!125635 lt!613144) #b00000000000000000000000000000000)))))

(assert (=> b!1395797 (=> (not res!934882) (not e!790214))))

(declare-fun b!1395798 () Bool)

(assert (=> b!1395798 (and (bvsge (index!43977 lt!613144) #b00000000000000000000000000000000) (bvslt (index!43977 lt!613144) (size!46634 (array!95456 (store (arr!46084 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46634 a!2901)))))))

(declare-fun res!934880 () Bool)

(assert (=> b!1395798 (= res!934880 (= (select (arr!46084 (array!95456 (store (arr!46084 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46634 a!2901))) (index!43977 lt!613144)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1395798 (=> res!934880 e!790212)))

(assert (= (and d!150795 c!129912) b!1395790))

(assert (= (and d!150795 (not c!129912)) b!1395793))

(assert (= (and b!1395793 c!129911) b!1395796))

(assert (= (and b!1395793 (not c!129911)) b!1395791))

(assert (= (and d!150795 c!129910) b!1395792))

(assert (= (and d!150795 (not c!129910)) b!1395797))

(assert (= (and b!1395797 res!934882) b!1395795))

(assert (= (and b!1395795 (not res!934881)) b!1395798))

(assert (= (and b!1395798 (not res!934880)) b!1395794))

(declare-fun m!1282239 () Bool)

(assert (=> b!1395795 m!1282239))

(declare-fun m!1282241 () Bool)

(assert (=> b!1395791 m!1282241))

(assert (=> b!1395791 m!1282241))

(assert (=> b!1395791 m!1282075))

(declare-fun m!1282243 () Bool)

(assert (=> b!1395791 m!1282243))

(assert (=> b!1395798 m!1282239))

(declare-fun m!1282245 () Bool)

(assert (=> d!150795 m!1282245))

(assert (=> d!150795 m!1282085))

(assert (=> b!1395794 m!1282239))

(assert (=> b!1395557 d!150795))

(declare-fun d!150797 () Bool)

(declare-fun lt!613146 () (_ BitVec 32))

(declare-fun lt!613145 () (_ BitVec 32))

(assert (=> d!150797 (= lt!613146 (bvmul (bvxor lt!613145 (bvlshr lt!613145 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150797 (= lt!613145 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46084 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46084 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150797 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!934854 (let ((h!33837 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46084 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46084 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!125640 (bvmul (bvxor h!33837 (bvlshr h!33837 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!125640 (bvlshr x!125640 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!934854 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!934854 #b00000000000000000000000000000000))))))

(assert (=> d!150797 (= (toIndex!0 (select (store (arr!46084 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvand (bvxor lt!613146 (bvlshr lt!613146 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1395557 d!150797))

(push 1)

(assert (not b!1395783))

(assert (not b!1395791))

(assert (not bm!66838))

(assert (not b!1395674))

(assert (not d!150795))

(assert (not bm!66837))

(assert (not d!150753))

(assert (not b!1395601))

(assert (not b!1395781))

(assert (not b!1395600))

(assert (not b!1395788))

(assert (not b!1395789))

(assert (not d!150741))

(assert (not b!1395784))

(assert (not d!150737))

(assert (not bm!66829))

(assert (not b!1395725))

(check-sat)

(pop 1)

(push 1)

(check-sat)

