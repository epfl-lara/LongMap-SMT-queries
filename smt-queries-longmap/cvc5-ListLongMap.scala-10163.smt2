; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119742 () Bool)

(assert start!119742)

(declare-fun b!1394935 () Bool)

(declare-fun e!789731 () Bool)

(declare-fun mask!2840 () (_ BitVec 32))

(assert (=> b!1394935 (= e!789731 (or (bvslt mask!2840 #b00000000000000000000000000000000) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(declare-fun b!1394936 () Bool)

(declare-fun e!789728 () Bool)

(assert (=> b!1394936 (= e!789728 (not e!789731))))

(declare-fun res!934346 () Bool)

(assert (=> b!1394936 (=> res!934346 e!789731)))

(declare-datatypes ((SeekEntryResult!10387 0))(
  ( (MissingZero!10387 (index!43919 (_ BitVec 32))) (Found!10387 (index!43920 (_ BitVec 32))) (Intermediate!10387 (undefined!11199 Bool) (index!43921 (_ BitVec 32)) (x!125583 (_ BitVec 32))) (Undefined!10387) (MissingVacant!10387 (index!43922 (_ BitVec 32))) )
))
(declare-fun lt!612794 () SeekEntryResult!10387)

(assert (=> b!1394936 (= res!934346 (or (not (is-Intermediate!10387 lt!612794)) (undefined!11199 lt!612794)))))

(declare-fun e!789730 () Bool)

(assert (=> b!1394936 e!789730))

(declare-fun res!934351 () Bool)

(assert (=> b!1394936 (=> (not res!934351) (not e!789730))))

(declare-datatypes ((array!95424 0))(
  ( (array!95425 (arr!46070 (Array (_ BitVec 32) (_ BitVec 64))) (size!46620 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95424)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95424 (_ BitVec 32)) Bool)

(assert (=> b!1394936 (= res!934351 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46778 0))(
  ( (Unit!46779) )
))
(declare-fun lt!612795 () Unit!46778)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95424 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46778)

(assert (=> b!1394936 (= lt!612795 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95424 (_ BitVec 32)) SeekEntryResult!10387)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394936 (= lt!612794 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46070 a!2901) j!112) mask!2840) (select (arr!46070 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1394937 () Bool)

(declare-fun res!934349 () Bool)

(assert (=> b!1394937 (=> res!934349 e!789731)))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1394937 (= res!934349 (= lt!612794 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46070 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46070 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95425 (store (arr!46070 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46620 a!2901)) mask!2840)))))

(declare-fun b!1394938 () Bool)

(declare-fun res!934348 () Bool)

(assert (=> b!1394938 (=> (not res!934348) (not e!789728))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394938 (= res!934348 (validKeyInArray!0 (select (arr!46070 a!2901) i!1037)))))

(declare-fun b!1394939 () Bool)

(declare-fun res!934347 () Bool)

(assert (=> b!1394939 (=> (not res!934347) (not e!789728))))

(assert (=> b!1394939 (= res!934347 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1394940 () Bool)

(declare-fun res!934344 () Bool)

(assert (=> b!1394940 (=> (not res!934344) (not e!789728))))

(declare-datatypes ((List!32589 0))(
  ( (Nil!32586) (Cons!32585 (h!33818 (_ BitVec 64)) (t!47283 List!32589)) )
))
(declare-fun arrayNoDuplicates!0 (array!95424 (_ BitVec 32) List!32589) Bool)

(assert (=> b!1394940 (= res!934344 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32586))))

(declare-fun res!934343 () Bool)

(assert (=> start!119742 (=> (not res!934343) (not e!789728))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119742 (= res!934343 (validMask!0 mask!2840))))

(assert (=> start!119742 e!789728))

(assert (=> start!119742 true))

(declare-fun array_inv!35098 (array!95424) Bool)

(assert (=> start!119742 (array_inv!35098 a!2901)))

(declare-fun b!1394941 () Bool)

(declare-fun res!934350 () Bool)

(assert (=> b!1394941 (=> (not res!934350) (not e!789728))))

(assert (=> b!1394941 (= res!934350 (validKeyInArray!0 (select (arr!46070 a!2901) j!112)))))

(declare-fun b!1394942 () Bool)

(declare-fun res!934345 () Bool)

(assert (=> b!1394942 (=> (not res!934345) (not e!789728))))

(assert (=> b!1394942 (= res!934345 (and (= (size!46620 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46620 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46620 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1394943 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95424 (_ BitVec 32)) SeekEntryResult!10387)

(assert (=> b!1394943 (= e!789730 (= (seekEntryOrOpen!0 (select (arr!46070 a!2901) j!112) a!2901 mask!2840) (Found!10387 j!112)))))

(assert (= (and start!119742 res!934343) b!1394942))

(assert (= (and b!1394942 res!934345) b!1394938))

(assert (= (and b!1394938 res!934348) b!1394941))

(assert (= (and b!1394941 res!934350) b!1394939))

(assert (= (and b!1394939 res!934347) b!1394940))

(assert (= (and b!1394940 res!934344) b!1394936))

(assert (= (and b!1394936 res!934351) b!1394943))

(assert (= (and b!1394936 (not res!934346)) b!1394937))

(assert (= (and b!1394937 (not res!934349)) b!1394935))

(declare-fun m!1281441 () Bool)

(assert (=> b!1394941 m!1281441))

(assert (=> b!1394941 m!1281441))

(declare-fun m!1281443 () Bool)

(assert (=> b!1394941 m!1281443))

(declare-fun m!1281445 () Bool)

(assert (=> b!1394937 m!1281445))

(declare-fun m!1281447 () Bool)

(assert (=> b!1394937 m!1281447))

(assert (=> b!1394937 m!1281447))

(declare-fun m!1281449 () Bool)

(assert (=> b!1394937 m!1281449))

(assert (=> b!1394937 m!1281449))

(assert (=> b!1394937 m!1281447))

(declare-fun m!1281451 () Bool)

(assert (=> b!1394937 m!1281451))

(declare-fun m!1281453 () Bool)

(assert (=> start!119742 m!1281453))

(declare-fun m!1281455 () Bool)

(assert (=> start!119742 m!1281455))

(declare-fun m!1281457 () Bool)

(assert (=> b!1394939 m!1281457))

(declare-fun m!1281459 () Bool)

(assert (=> b!1394940 m!1281459))

(assert (=> b!1394936 m!1281441))

(declare-fun m!1281461 () Bool)

(assert (=> b!1394936 m!1281461))

(assert (=> b!1394936 m!1281441))

(declare-fun m!1281463 () Bool)

(assert (=> b!1394936 m!1281463))

(assert (=> b!1394936 m!1281461))

(assert (=> b!1394936 m!1281441))

(declare-fun m!1281465 () Bool)

(assert (=> b!1394936 m!1281465))

(declare-fun m!1281467 () Bool)

(assert (=> b!1394936 m!1281467))

(declare-fun m!1281469 () Bool)

(assert (=> b!1394938 m!1281469))

(assert (=> b!1394938 m!1281469))

(declare-fun m!1281471 () Bool)

(assert (=> b!1394938 m!1281471))

(assert (=> b!1394943 m!1281441))

(assert (=> b!1394943 m!1281441))

(declare-fun m!1281473 () Bool)

(assert (=> b!1394943 m!1281473))

(push 1)

(assert (not b!1394943))

(assert (not b!1394939))

(assert (not b!1394937))

(assert (not b!1394936))

(assert (not b!1394938))

(assert (not b!1394941))

(assert (not start!119742))

(assert (not b!1394940))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1395073 () Bool)

(declare-fun e!789804 () Bool)

(declare-fun e!789802 () Bool)

(assert (=> b!1395073 (= e!789804 e!789802)))

(declare-fun res!934436 () Bool)

(declare-fun lt!612831 () SeekEntryResult!10387)

(assert (=> b!1395073 (= res!934436 (and (is-Intermediate!10387 lt!612831) (not (undefined!11199 lt!612831)) (bvslt (x!125583 lt!612831) #b01111111111111111111111111111110) (bvsge (x!125583 lt!612831) #b00000000000000000000000000000000) (bvsge (x!125583 lt!612831) #b00000000000000000000000000000000)))))

(assert (=> b!1395073 (=> (not res!934436) (not e!789802))))

(declare-fun b!1395074 () Bool)

(declare-fun e!789803 () SeekEntryResult!10387)

(declare-fun e!789801 () SeekEntryResult!10387)

(assert (=> b!1395074 (= e!789803 e!789801)))

(declare-fun c!129772 () Bool)

(declare-fun lt!612832 () (_ BitVec 64))

(assert (=> b!1395074 (= c!129772 (or (= lt!612832 (select (store (arr!46070 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)) (= (bvadd lt!612832 lt!612832) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1395075 () Bool)

(assert (=> b!1395075 (and (bvsge (index!43921 lt!612831) #b00000000000000000000000000000000) (bvslt (index!43921 lt!612831) (size!46620 (array!95425 (store (arr!46070 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46620 a!2901)))))))

(declare-fun res!934434 () Bool)

(assert (=> b!1395075 (= res!934434 (= (select (arr!46070 (array!95425 (store (arr!46070 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46620 a!2901))) (index!43921 lt!612831)) (select (store (arr!46070 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(declare-fun e!789800 () Bool)

(assert (=> b!1395075 (=> res!934434 e!789800)))

(assert (=> b!1395075 (= e!789802 e!789800)))

(declare-fun b!1395076 () Bool)

(assert (=> b!1395076 (= e!789801 (Intermediate!10387 false (toIndex!0 (select (store (arr!46070 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1395077 () Bool)

(assert (=> b!1395077 (= e!789804 (bvsge (x!125583 lt!612831) #b01111111111111111111111111111110))))

(declare-fun b!1395078 () Bool)

(assert (=> b!1395078 (and (bvsge (index!43921 lt!612831) #b00000000000000000000000000000000) (bvslt (index!43921 lt!612831) (size!46620 (array!95425 (store (arr!46070 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46620 a!2901)))))))

(assert (=> b!1395078 (= e!789800 (= (select (arr!46070 (array!95425 (store (arr!46070 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46620 a!2901))) (index!43921 lt!612831)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1395080 () Bool)

(assert (=> b!1395080 (= e!789803 (Intermediate!10387 true (toIndex!0 (select (store (arr!46070 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1395081 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1395081 (= e!789801 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!46070 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (store (arr!46070 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95425 (store (arr!46070 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46620 a!2901)) mask!2840))))

(declare-fun b!1395079 () Bool)

(assert (=> b!1395079 (and (bvsge (index!43921 lt!612831) #b00000000000000000000000000000000) (bvslt (index!43921 lt!612831) (size!46620 (array!95425 (store (arr!46070 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46620 a!2901)))))))

(declare-fun res!934435 () Bool)

(assert (=> b!1395079 (= res!934435 (= (select (arr!46070 (array!95425 (store (arr!46070 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46620 a!2901))) (index!43921 lt!612831)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1395079 (=> res!934435 e!789800)))

(declare-fun d!150639 () Bool)

(assert (=> d!150639 e!789804))

(declare-fun c!129774 () Bool)

(assert (=> d!150639 (= c!129774 (and (is-Intermediate!10387 lt!612831) (undefined!11199 lt!612831)))))

(assert (=> d!150639 (= lt!612831 e!789803)))

(declare-fun c!129773 () Bool)

(assert (=> d!150639 (= c!129773 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!150639 (= lt!612832 (select (arr!46070 (array!95425 (store (arr!46070 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46620 a!2901))) (toIndex!0 (select (store (arr!46070 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840)))))

(assert (=> d!150639 (validMask!0 mask!2840)))

(assert (=> d!150639 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46070 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46070 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95425 (store (arr!46070 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46620 a!2901)) mask!2840) lt!612831)))

(assert (= (and d!150639 c!129773) b!1395080))

(assert (= (and d!150639 (not c!129773)) b!1395074))

(assert (= (and b!1395074 c!129772) b!1395076))

(assert (= (and b!1395074 (not c!129772)) b!1395081))

(assert (= (and d!150639 c!129774) b!1395077))

(assert (= (and d!150639 (not c!129774)) b!1395073))

(assert (= (and b!1395073 res!934436) b!1395075))

(assert (= (and b!1395075 (not res!934434)) b!1395079))

(assert (= (and b!1395079 (not res!934435)) b!1395078))

(assert (=> b!1395081 m!1281449))

(declare-fun m!1281563 () Bool)

(assert (=> b!1395081 m!1281563))

(assert (=> b!1395081 m!1281563))

(assert (=> b!1395081 m!1281447))

(declare-fun m!1281565 () Bool)

(assert (=> b!1395081 m!1281565))

(assert (=> d!150639 m!1281449))

(declare-fun m!1281567 () Bool)

(assert (=> d!150639 m!1281567))

(assert (=> d!150639 m!1281453))

(declare-fun m!1281569 () Bool)

(assert (=> b!1395078 m!1281569))

(assert (=> b!1395079 m!1281569))

(assert (=> b!1395075 m!1281569))

(assert (=> b!1394937 d!150639))

(declare-fun d!150645 () Bool)

(declare-fun lt!612846 () (_ BitVec 32))

(declare-fun lt!612845 () (_ BitVec 32))

(assert (=> d!150645 (= lt!612846 (bvmul (bvxor lt!612845 (bvlshr lt!612845 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150645 (= lt!612845 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46070 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46070 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150645 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!934437 (let ((h!33822 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46070 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46070 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!125590 (bvmul (bvxor h!33822 (bvlshr h!33822 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!125590 (bvlshr x!125590 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!934437 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!934437 #b00000000000000000000000000000000))))))

(assert (=> d!150645 (= (toIndex!0 (select (store (arr!46070 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvand (bvxor lt!612846 (bvlshr lt!612846 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1394937 d!150645))

(declare-fun b!1395138 () Bool)

(declare-fun lt!612880 () SeekEntryResult!10387)

(declare-fun e!789841 () SeekEntryResult!10387)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95424 (_ BitVec 32)) SeekEntryResult!10387)

(assert (=> b!1395138 (= e!789841 (seekKeyOrZeroReturnVacant!0 (x!125583 lt!612880) (index!43921 lt!612880) (index!43921 lt!612880) (select (arr!46070 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1395139 () Bool)

(declare-fun e!789843 () SeekEntryResult!10387)

(assert (=> b!1395139 (= e!789843 Undefined!10387)))

(declare-fun b!1395140 () Bool)

(assert (=> b!1395140 (= e!789841 (MissingZero!10387 (index!43921 lt!612880)))))

(declare-fun d!150651 () Bool)

(declare-fun lt!612878 () SeekEntryResult!10387)

(assert (=> d!150651 (and (or (is-Undefined!10387 lt!612878) (not (is-Found!10387 lt!612878)) (and (bvsge (index!43920 lt!612878) #b00000000000000000000000000000000) (bvslt (index!43920 lt!612878) (size!46620 a!2901)))) (or (is-Undefined!10387 lt!612878) (is-Found!10387 lt!612878) (not (is-MissingZero!10387 lt!612878)) (and (bvsge (index!43919 lt!612878) #b00000000000000000000000000000000) (bvslt (index!43919 lt!612878) (size!46620 a!2901)))) (or (is-Undefined!10387 lt!612878) (is-Found!10387 lt!612878) (is-MissingZero!10387 lt!612878) (not (is-MissingVacant!10387 lt!612878)) (and (bvsge (index!43922 lt!612878) #b00000000000000000000000000000000) (bvslt (index!43922 lt!612878) (size!46620 a!2901)))) (or (is-Undefined!10387 lt!612878) (ite (is-Found!10387 lt!612878) (= (select (arr!46070 a!2901) (index!43920 lt!612878)) (select (arr!46070 a!2901) j!112)) (ite (is-MissingZero!10387 lt!612878) (= (select (arr!46070 a!2901) (index!43919 lt!612878)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10387 lt!612878) (= (select (arr!46070 a!2901) (index!43922 lt!612878)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!150651 (= lt!612878 e!789843)))

(declare-fun c!129794 () Bool)

(assert (=> d!150651 (= c!129794 (and (is-Intermediate!10387 lt!612880) (undefined!11199 lt!612880)))))

(assert (=> d!150651 (= lt!612880 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46070 a!2901) j!112) mask!2840) (select (arr!46070 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!150651 (validMask!0 mask!2840)))

(assert (=> d!150651 (= (seekEntryOrOpen!0 (select (arr!46070 a!2901) j!112) a!2901 mask!2840) lt!612878)))

(declare-fun b!1395141 () Bool)

(declare-fun c!129795 () Bool)

(declare-fun lt!612879 () (_ BitVec 64))

(assert (=> b!1395141 (= c!129795 (= lt!612879 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!789842 () SeekEntryResult!10387)

(assert (=> b!1395141 (= e!789842 e!789841)))

(declare-fun b!1395142 () Bool)

(assert (=> b!1395142 (= e!789842 (Found!10387 (index!43921 lt!612880)))))

(declare-fun b!1395143 () Bool)

(assert (=> b!1395143 (= e!789843 e!789842)))

(assert (=> b!1395143 (= lt!612879 (select (arr!46070 a!2901) (index!43921 lt!612880)))))

(declare-fun c!129793 () Bool)

(assert (=> b!1395143 (= c!129793 (= lt!612879 (select (arr!46070 a!2901) j!112)))))

(assert (= (and d!150651 c!129794) b!1395139))

(assert (= (and d!150651 (not c!129794)) b!1395143))

(assert (= (and b!1395143 c!129793) b!1395142))

(assert (= (and b!1395143 (not c!129793)) b!1395141))

(assert (= (and b!1395141 c!129795) b!1395140))

(assert (= (and b!1395141 (not c!129795)) b!1395138))

(assert (=> b!1395138 m!1281441))

(declare-fun m!1281607 () Bool)

(assert (=> b!1395138 m!1281607))

(assert (=> d!150651 m!1281441))

(assert (=> d!150651 m!1281461))

(assert (=> d!150651 m!1281461))

(assert (=> d!150651 m!1281441))

(assert (=> d!150651 m!1281465))

(assert (=> d!150651 m!1281453))

(declare-fun m!1281611 () Bool)

(assert (=> d!150651 m!1281611))

(declare-fun m!1281615 () Bool)

(assert (=> d!150651 m!1281615))

(declare-fun m!1281617 () Bool)

(assert (=> d!150651 m!1281617))

(declare-fun m!1281619 () Bool)

(assert (=> b!1395143 m!1281619))

(assert (=> b!1394943 d!150651))

(declare-fun d!150673 () Bool)

(assert (=> d!150673 (= (validKeyInArray!0 (select (arr!46070 a!2901) i!1037)) (and (not (= (select (arr!46070 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46070 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1394938 d!150673))

(declare-fun b!1395157 () Bool)

(declare-fun e!789855 () Bool)

(declare-fun call!66815 () Bool)

(assert (=> b!1395157 (= e!789855 call!66815)))

(declare-fun b!1395158 () Bool)

(declare-fun e!789856 () Bool)

(assert (=> b!1395158 (= e!789856 call!66815)))

(declare-fun d!150679 () Bool)

(declare-fun res!934466 () Bool)

(declare-fun e!789854 () Bool)

(assert (=> d!150679 (=> res!934466 e!789854)))

(assert (=> d!150679 (= res!934466 (bvsge #b00000000000000000000000000000000 (size!46620 a!2901)))))

(assert (=> d!150679 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!789854)))

(declare-fun b!1395159 () Bool)

(assert (=> b!1395159 (= e!789854 e!789855)))

(declare-fun c!129799 () Bool)

(assert (=> b!1395159 (= c!129799 (validKeyInArray!0 (select (arr!46070 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!66812 () Bool)

(assert (=> bm!66812 (= call!66815 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1395160 () Bool)

(assert (=> b!1395160 (= e!789855 e!789856)))

(declare-fun lt!612887 () (_ BitVec 64))

(assert (=> b!1395160 (= lt!612887 (select (arr!46070 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!612888 () Unit!46778)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!95424 (_ BitVec 64) (_ BitVec 32)) Unit!46778)

(assert (=> b!1395160 (= lt!612888 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!612887 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!95424 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1395160 (arrayContainsKey!0 a!2901 lt!612887 #b00000000000000000000000000000000)))

(declare-fun lt!612889 () Unit!46778)

(assert (=> b!1395160 (= lt!612889 lt!612888)))

(declare-fun res!934467 () Bool)

(assert (=> b!1395160 (= res!934467 (= (seekEntryOrOpen!0 (select (arr!46070 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10387 #b00000000000000000000000000000000)))))

(assert (=> b!1395160 (=> (not res!934467) (not e!789856))))

(assert (= (and d!150679 (not res!934466)) b!1395159))

(assert (= (and b!1395159 c!129799) b!1395160))

(assert (= (and b!1395159 (not c!129799)) b!1395157))

(assert (= (and b!1395160 res!934467) b!1395158))

(assert (= (or b!1395158 b!1395157) bm!66812))

(declare-fun m!1281621 () Bool)

(assert (=> b!1395159 m!1281621))

(assert (=> b!1395159 m!1281621))

(declare-fun m!1281623 () Bool)

(assert (=> b!1395159 m!1281623))

(declare-fun m!1281625 () Bool)

(assert (=> bm!66812 m!1281625))

(assert (=> b!1395160 m!1281621))

(declare-fun m!1281627 () Bool)

(assert (=> b!1395160 m!1281627))

(declare-fun m!1281629 () Bool)

(assert (=> b!1395160 m!1281629))

(assert (=> b!1395160 m!1281621))

(declare-fun m!1281631 () Bool)

(assert (=> b!1395160 m!1281631))

(assert (=> b!1394939 d!150679))

(declare-fun b!1395185 () Bool)

(declare-fun e!789872 () Bool)

(declare-fun e!789871 () Bool)

(assert (=> b!1395185 (= e!789872 e!789871)))

(declare-fun c!129808 () Bool)

(assert (=> b!1395185 (= c!129808 (validKeyInArray!0 (select (arr!46070 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!150683 () Bool)

(declare-fun res!934474 () Bool)

(declare-fun e!789874 () Bool)

(assert (=> d!150683 (=> res!934474 e!789874)))

(assert (=> d!150683 (= res!934474 (bvsge #b00000000000000000000000000000000 (size!46620 a!2901)))))

(assert (=> d!150683 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32586) e!789874)))

(declare-fun b!1395186 () Bool)

(declare-fun call!66818 () Bool)

(assert (=> b!1395186 (= e!789871 call!66818)))

(declare-fun b!1395187 () Bool)

(assert (=> b!1395187 (= e!789874 e!789872)))

(declare-fun res!934475 () Bool)

(assert (=> b!1395187 (=> (not res!934475) (not e!789872))))

(declare-fun e!789873 () Bool)

(assert (=> b!1395187 (= res!934475 (not e!789873))))

(declare-fun res!934476 () Bool)

(assert (=> b!1395187 (=> (not res!934476) (not e!789873))))

(assert (=> b!1395187 (= res!934476 (validKeyInArray!0 (select (arr!46070 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!66815 () Bool)

(assert (=> bm!66815 (= call!66818 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!129808 (Cons!32585 (select (arr!46070 a!2901) #b00000000000000000000000000000000) Nil!32586) Nil!32586)))))

(declare-fun b!1395188 () Bool)

(declare-fun contains!9775 (List!32589 (_ BitVec 64)) Bool)

(assert (=> b!1395188 (= e!789873 (contains!9775 Nil!32586 (select (arr!46070 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1395189 () Bool)

(assert (=> b!1395189 (= e!789871 call!66818)))

(assert (= (and d!150683 (not res!934474)) b!1395187))

(assert (= (and b!1395187 res!934476) b!1395188))

(assert (= (and b!1395187 res!934475) b!1395185))

(assert (= (and b!1395185 c!129808) b!1395189))

(assert (= (and b!1395185 (not c!129808)) b!1395186))

(assert (= (or b!1395189 b!1395186) bm!66815))

(assert (=> b!1395185 m!1281621))

(assert (=> b!1395185 m!1281621))

(assert (=> b!1395185 m!1281623))

(assert (=> b!1395187 m!1281621))

(assert (=> b!1395187 m!1281621))

(assert (=> b!1395187 m!1281623))

(assert (=> bm!66815 m!1281621))

(declare-fun m!1281633 () Bool)

(assert (=> bm!66815 m!1281633))

(assert (=> b!1395188 m!1281621))

(assert (=> b!1395188 m!1281621))

(declare-fun m!1281635 () Bool)

(assert (=> b!1395188 m!1281635))

(assert (=> b!1394940 d!150683))

(declare-fun d!150685 () Bool)

(assert (=> d!150685 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!119742 d!150685))

(declare-fun d!150689 () Bool)

(assert (=> d!150689 (= (array_inv!35098 a!2901) (bvsge (size!46620 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!119742 d!150689))

(declare-fun d!150691 () Bool)

(assert (=> d!150691 (= (validKeyInArray!0 (select (arr!46070 a!2901) j!112)) (and (not (= (select (arr!46070 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46070 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1394941 d!150691))

(declare-fun b!1395222 () Bool)

(declare-fun e!789896 () Bool)

(declare-fun call!66821 () Bool)

(assert (=> b!1395222 (= e!789896 call!66821)))

(declare-fun b!1395223 () Bool)

(declare-fun e!789897 () Bool)

(assert (=> b!1395223 (= e!789897 call!66821)))

(declare-fun d!150693 () Bool)

(declare-fun res!934483 () Bool)

(declare-fun e!789895 () Bool)

(assert (=> d!150693 (=> res!934483 e!789895)))

(assert (=> d!150693 (= res!934483 (bvsge j!112 (size!46620 a!2901)))))

(assert (=> d!150693 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!789895)))

(declare-fun b!1395224 () Bool)

(assert (=> b!1395224 (= e!789895 e!789896)))

(declare-fun c!129823 () Bool)

(assert (=> b!1395224 (= c!129823 (validKeyInArray!0 (select (arr!46070 a!2901) j!112)))))

(declare-fun bm!66818 () Bool)

(assert (=> bm!66818 (= call!66821 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1395225 () Bool)

(assert (=> b!1395225 (= e!789896 e!789897)))

(declare-fun lt!612908 () (_ BitVec 64))

(assert (=> b!1395225 (= lt!612908 (select (arr!46070 a!2901) j!112))))

(declare-fun lt!612909 () Unit!46778)

(assert (=> b!1395225 (= lt!612909 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!612908 j!112))))

(assert (=> b!1395225 (arrayContainsKey!0 a!2901 lt!612908 #b00000000000000000000000000000000)))

(declare-fun lt!612910 () Unit!46778)

(assert (=> b!1395225 (= lt!612910 lt!612909)))

(declare-fun res!934484 () Bool)

(assert (=> b!1395225 (= res!934484 (= (seekEntryOrOpen!0 (select (arr!46070 a!2901) j!112) a!2901 mask!2840) (Found!10387 j!112)))))

(assert (=> b!1395225 (=> (not res!934484) (not e!789897))))

(assert (= (and d!150693 (not res!934483)) b!1395224))

(assert (= (and b!1395224 c!129823) b!1395225))

(assert (= (and b!1395224 (not c!129823)) b!1395222))

(assert (= (and b!1395225 res!934484) b!1395223))

(assert (= (or b!1395223 b!1395222) bm!66818))

(assert (=> b!1395224 m!1281441))

(assert (=> b!1395224 m!1281441))

(assert (=> b!1395224 m!1281443))

(declare-fun m!1281657 () Bool)

(assert (=> bm!66818 m!1281657))

(assert (=> b!1395225 m!1281441))

(declare-fun m!1281659 () Bool)

(assert (=> b!1395225 m!1281659))

(declare-fun m!1281661 () Bool)

(assert (=> b!1395225 m!1281661))

(assert (=> b!1395225 m!1281441))

(assert (=> b!1395225 m!1281473))

(assert (=> b!1394936 d!150693))

(declare-fun d!150695 () Bool)

(assert (=> d!150695 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!612916 () Unit!46778)

(declare-fun choose!38 (array!95424 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46778)

(assert (=> d!150695 (= lt!612916 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!150695 (validMask!0 mask!2840)))

(assert (=> d!150695 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!612916)))

(declare-fun bs!40602 () Bool)

(assert (= bs!40602 d!150695))

(assert (=> bs!40602 m!1281467))

(declare-fun m!1281673 () Bool)

(assert (=> bs!40602 m!1281673))

(assert (=> bs!40602 m!1281453))

(assert (=> b!1394936 d!150695))

(declare-fun b!1395235 () Bool)

(declare-fun e!789909 () Bool)

(declare-fun e!789907 () Bool)

(assert (=> b!1395235 (= e!789909 e!789907)))

(declare-fun res!934492 () Bool)

(declare-fun lt!612917 () SeekEntryResult!10387)

(assert (=> b!1395235 (= res!934492 (and (is-Intermediate!10387 lt!612917) (not (undefined!11199 lt!612917)) (bvslt (x!125583 lt!612917) #b01111111111111111111111111111110) (bvsge (x!125583 lt!612917) #b00000000000000000000000000000000) (bvsge (x!125583 lt!612917) #b00000000000000000000000000000000)))))

(assert (=> b!1395235 (=> (not res!934492) (not e!789907))))

(declare-fun b!1395236 () Bool)

(declare-fun e!789908 () SeekEntryResult!10387)

(declare-fun e!789906 () SeekEntryResult!10387)

(assert (=> b!1395236 (= e!789908 e!789906)))

(declare-fun c!129826 () Bool)

(declare-fun lt!612918 () (_ BitVec 64))

(assert (=> b!1395236 (= c!129826 (or (= lt!612918 (select (arr!46070 a!2901) j!112)) (= (bvadd lt!612918 lt!612918) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1395237 () Bool)

(assert (=> b!1395237 (and (bvsge (index!43921 lt!612917) #b00000000000000000000000000000000) (bvslt (index!43921 lt!612917) (size!46620 a!2901)))))

(declare-fun res!934490 () Bool)

(assert (=> b!1395237 (= res!934490 (= (select (arr!46070 a!2901) (index!43921 lt!612917)) (select (arr!46070 a!2901) j!112)))))

(declare-fun e!789905 () Bool)

(assert (=> b!1395237 (=> res!934490 e!789905)))

(assert (=> b!1395237 (= e!789907 e!789905)))

(declare-fun b!1395238 () Bool)

(assert (=> b!1395238 (= e!789906 (Intermediate!10387 false (toIndex!0 (select (arr!46070 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1395239 () Bool)

(assert (=> b!1395239 (= e!789909 (bvsge (x!125583 lt!612917) #b01111111111111111111111111111110))))

(declare-fun b!1395240 () Bool)

(assert (=> b!1395240 (and (bvsge (index!43921 lt!612917) #b00000000000000000000000000000000) (bvslt (index!43921 lt!612917) (size!46620 a!2901)))))

(assert (=> b!1395240 (= e!789905 (= (select (arr!46070 a!2901) (index!43921 lt!612917)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1395242 () Bool)

(assert (=> b!1395242 (= e!789908 (Intermediate!10387 true (toIndex!0 (select (arr!46070 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1395243 () Bool)

(assert (=> b!1395243 (= e!789906 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46070 a!2901) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (arr!46070 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1395241 () Bool)

(assert (=> b!1395241 (and (bvsge (index!43921 lt!612917) #b00000000000000000000000000000000) (bvslt (index!43921 lt!612917) (size!46620 a!2901)))))

(declare-fun res!934491 () Bool)

(assert (=> b!1395241 (= res!934491 (= (select (arr!46070 a!2901) (index!43921 lt!612917)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1395241 (=> res!934491 e!789905)))

(declare-fun d!150705 () Bool)

(assert (=> d!150705 e!789909))

(declare-fun c!129828 () Bool)

(assert (=> d!150705 (= c!129828 (and (is-Intermediate!10387 lt!612917) (undefined!11199 lt!612917)))))

(assert (=> d!150705 (= lt!612917 e!789908)))

(declare-fun c!129827 () Bool)

(assert (=> d!150705 (= c!129827 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!150705 (= lt!612918 (select (arr!46070 a!2901) (toIndex!0 (select (arr!46070 a!2901) j!112) mask!2840)))))

(assert (=> d!150705 (validMask!0 mask!2840)))

(assert (=> d!150705 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46070 a!2901) j!112) mask!2840) (select (arr!46070 a!2901) j!112) a!2901 mask!2840) lt!612917)))

(assert (= (and d!150705 c!129827) b!1395242))

(assert (= (and d!150705 (not c!129827)) b!1395236))

(assert (= (and b!1395236 c!129826) b!1395238))

(assert (= (and b!1395236 (not c!129826)) b!1395243))

(assert (= (and d!150705 c!129828) b!1395239))

(assert (= (and d!150705 (not c!129828)) b!1395235))

(assert (= (and b!1395235 res!934492) b!1395237))

(assert (= (and b!1395237 (not res!934490)) b!1395241))

(assert (= (and b!1395241 (not res!934491)) b!1395240))

(assert (=> b!1395243 m!1281461))

(declare-fun m!1281675 () Bool)

(assert (=> b!1395243 m!1281675))

(assert (=> b!1395243 m!1281675))

(assert (=> b!1395243 m!1281441))

(declare-fun m!1281677 () Bool)

(assert (=> b!1395243 m!1281677))

(assert (=> d!150705 m!1281461))

(declare-fun m!1281679 () Bool)

(assert (=> d!150705 m!1281679))

(assert (=> d!150705 m!1281453))

(declare-fun m!1281681 () Bool)

(assert (=> b!1395240 m!1281681))

(assert (=> b!1395241 m!1281681))

(assert (=> b!1395237 m!1281681))

(assert (=> b!1394936 d!150705))

(declare-fun d!150707 () Bool)

(declare-fun lt!612920 () (_ BitVec 32))

(declare-fun lt!612919 () (_ BitVec 32))

(assert (=> d!150707 (= lt!612920 (bvmul (bvxor lt!612919 (bvlshr lt!612919 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150707 (= lt!612919 ((_ extract 31 0) (bvand (bvxor (select (arr!46070 a!2901) j!112) (bvlshr (select (arr!46070 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150707 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!934437 (let ((h!33822 ((_ extract 31 0) (bvand (bvxor (select (arr!46070 a!2901) j!112) (bvlshr (select (arr!46070 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!125590 (bvmul (bvxor h!33822 (bvlshr h!33822 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!125590 (bvlshr x!125590 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!934437 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!934437 #b00000000000000000000000000000000))))))

(assert (=> d!150707 (= (toIndex!0 (select (arr!46070 a!2901) j!112) mask!2840) (bvand (bvxor lt!612920 (bvlshr lt!612920 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1394936 d!150707))

(push 1)

