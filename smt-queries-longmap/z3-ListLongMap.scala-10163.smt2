; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119930 () Bool)

(assert start!119930)

(declare-fun b!1396075 () Bool)

(declare-fun e!790467 () Bool)

(declare-fun mask!2840 () (_ BitVec 32))

(assert (=> b!1396075 (= e!790467 (or (bvslt mask!2840 #b00000000000000000000000000000000) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(declare-fun b!1396076 () Bool)

(declare-fun e!790468 () Bool)

(assert (=> b!1396076 (= e!790468 (not e!790467))))

(declare-fun res!934803 () Bool)

(assert (=> b!1396076 (=> res!934803 e!790467)))

(declare-datatypes ((SeekEntryResult!10343 0))(
  ( (MissingZero!10343 (index!43743 (_ BitVec 32))) (Found!10343 (index!43744 (_ BitVec 32))) (Intermediate!10343 (undefined!11155 Bool) (index!43745 (_ BitVec 32)) (x!125558 (_ BitVec 32))) (Undefined!10343) (MissingVacant!10343 (index!43746 (_ BitVec 32))) )
))
(declare-fun lt!613193 () SeekEntryResult!10343)

(get-info :version)

(assert (=> b!1396076 (= res!934803 (or (not ((_ is Intermediate!10343) lt!613193)) (undefined!11155 lt!613193)))))

(declare-fun e!790469 () Bool)

(assert (=> b!1396076 e!790469))

(declare-fun res!934804 () Bool)

(assert (=> b!1396076 (=> (not res!934804) (not e!790469))))

(declare-datatypes ((array!95534 0))(
  ( (array!95535 (arr!46123 (Array (_ BitVec 32) (_ BitVec 64))) (size!46674 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95534)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95534 (_ BitVec 32)) Bool)

(assert (=> b!1396076 (= res!934804 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46717 0))(
  ( (Unit!46718) )
))
(declare-fun lt!613192 () Unit!46717)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95534 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46717)

(assert (=> b!1396076 (= lt!613192 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95534 (_ BitVec 32)) SeekEntryResult!10343)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1396076 (= lt!613193 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46123 a!2901) j!112) mask!2840) (select (arr!46123 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1396077 () Bool)

(declare-fun res!934807 () Bool)

(assert (=> b!1396077 (=> (not res!934807) (not e!790468))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1396077 (= res!934807 (validKeyInArray!0 (select (arr!46123 a!2901) j!112)))))

(declare-fun b!1396078 () Bool)

(declare-fun res!934806 () Bool)

(assert (=> b!1396078 (=> (not res!934806) (not e!790468))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1396078 (= res!934806 (validKeyInArray!0 (select (arr!46123 a!2901) i!1037)))))

(declare-fun b!1396079 () Bool)

(declare-fun res!934801 () Bool)

(assert (=> b!1396079 (=> res!934801 e!790467)))

(assert (=> b!1396079 (= res!934801 (= lt!613193 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46123 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46123 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95535 (store (arr!46123 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46674 a!2901)) mask!2840)))))

(declare-fun b!1396080 () Bool)

(declare-fun res!934802 () Bool)

(assert (=> b!1396080 (=> (not res!934802) (not e!790468))))

(declare-datatypes ((List!32629 0))(
  ( (Nil!32626) (Cons!32625 (h!33866 (_ BitVec 64)) (t!47315 List!32629)) )
))
(declare-fun arrayNoDuplicates!0 (array!95534 (_ BitVec 32) List!32629) Bool)

(assert (=> b!1396080 (= res!934802 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32626))))

(declare-fun res!934799 () Bool)

(assert (=> start!119930 (=> (not res!934799) (not e!790468))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119930 (= res!934799 (validMask!0 mask!2840))))

(assert (=> start!119930 e!790468))

(assert (=> start!119930 true))

(declare-fun array_inv!35404 (array!95534) Bool)

(assert (=> start!119930 (array_inv!35404 a!2901)))

(declare-fun b!1396081 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95534 (_ BitVec 32)) SeekEntryResult!10343)

(assert (=> b!1396081 (= e!790469 (= (seekEntryOrOpen!0 (select (arr!46123 a!2901) j!112) a!2901 mask!2840) (Found!10343 j!112)))))

(declare-fun b!1396082 () Bool)

(declare-fun res!934805 () Bool)

(assert (=> b!1396082 (=> (not res!934805) (not e!790468))))

(assert (=> b!1396082 (= res!934805 (and (= (size!46674 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46674 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46674 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1396083 () Bool)

(declare-fun res!934800 () Bool)

(assert (=> b!1396083 (=> (not res!934800) (not e!790468))))

(assert (=> b!1396083 (= res!934800 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!119930 res!934799) b!1396082))

(assert (= (and b!1396082 res!934805) b!1396078))

(assert (= (and b!1396078 res!934806) b!1396077))

(assert (= (and b!1396077 res!934807) b!1396083))

(assert (= (and b!1396083 res!934800) b!1396080))

(assert (= (and b!1396080 res!934802) b!1396076))

(assert (= (and b!1396076 res!934804) b!1396081))

(assert (= (and b!1396076 (not res!934803)) b!1396079))

(assert (= (and b!1396079 (not res!934801)) b!1396075))

(declare-fun m!1282813 () Bool)

(assert (=> b!1396079 m!1282813))

(declare-fun m!1282815 () Bool)

(assert (=> b!1396079 m!1282815))

(assert (=> b!1396079 m!1282815))

(declare-fun m!1282817 () Bool)

(assert (=> b!1396079 m!1282817))

(assert (=> b!1396079 m!1282817))

(assert (=> b!1396079 m!1282815))

(declare-fun m!1282819 () Bool)

(assert (=> b!1396079 m!1282819))

(declare-fun m!1282821 () Bool)

(assert (=> b!1396077 m!1282821))

(assert (=> b!1396077 m!1282821))

(declare-fun m!1282823 () Bool)

(assert (=> b!1396077 m!1282823))

(assert (=> b!1396081 m!1282821))

(assert (=> b!1396081 m!1282821))

(declare-fun m!1282825 () Bool)

(assert (=> b!1396081 m!1282825))

(declare-fun m!1282827 () Bool)

(assert (=> b!1396078 m!1282827))

(assert (=> b!1396078 m!1282827))

(declare-fun m!1282829 () Bool)

(assert (=> b!1396078 m!1282829))

(declare-fun m!1282831 () Bool)

(assert (=> b!1396083 m!1282831))

(declare-fun m!1282833 () Bool)

(assert (=> b!1396080 m!1282833))

(declare-fun m!1282835 () Bool)

(assert (=> start!119930 m!1282835))

(declare-fun m!1282837 () Bool)

(assert (=> start!119930 m!1282837))

(assert (=> b!1396076 m!1282821))

(declare-fun m!1282839 () Bool)

(assert (=> b!1396076 m!1282839))

(assert (=> b!1396076 m!1282821))

(declare-fun m!1282841 () Bool)

(assert (=> b!1396076 m!1282841))

(assert (=> b!1396076 m!1282839))

(assert (=> b!1396076 m!1282821))

(declare-fun m!1282843 () Bool)

(assert (=> b!1396076 m!1282843))

(declare-fun m!1282845 () Bool)

(assert (=> b!1396076 m!1282845))

(check-sat (not start!119930) (not b!1396083) (not b!1396078) (not b!1396076) (not b!1396077) (not b!1396080) (not b!1396081) (not b!1396079))
(check-sat)
(get-model)

(declare-fun e!790505 () SeekEntryResult!10343)

(declare-fun b!1396156 () Bool)

(assert (=> b!1396156 (= e!790505 (Intermediate!10343 true (toIndex!0 (select (store (arr!46123 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1396157 () Bool)

(declare-fun e!790507 () Bool)

(declare-fun lt!613210 () SeekEntryResult!10343)

(assert (=> b!1396157 (= e!790507 (bvsge (x!125558 lt!613210) #b01111111111111111111111111111110))))

(declare-fun e!790504 () SeekEntryResult!10343)

(declare-fun b!1396158 () Bool)

(assert (=> b!1396158 (= e!790504 (Intermediate!10343 false (toIndex!0 (select (store (arr!46123 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1396159 () Bool)

(assert (=> b!1396159 (and (bvsge (index!43745 lt!613210) #b00000000000000000000000000000000) (bvslt (index!43745 lt!613210) (size!46674 (array!95535 (store (arr!46123 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46674 a!2901)))))))

(declare-fun res!934870 () Bool)

(assert (=> b!1396159 (= res!934870 (= (select (arr!46123 (array!95535 (store (arr!46123 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46674 a!2901))) (index!43745 lt!613210)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!790508 () Bool)

(assert (=> b!1396159 (=> res!934870 e!790508)))

(declare-fun b!1396160 () Bool)

(assert (=> b!1396160 (= e!790505 e!790504)))

(declare-fun c!130105 () Bool)

(declare-fun lt!613211 () (_ BitVec 64))

(assert (=> b!1396160 (= c!130105 (or (= lt!613211 (select (store (arr!46123 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)) (= (bvadd lt!613211 lt!613211) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!150979 () Bool)

(assert (=> d!150979 e!790507))

(declare-fun c!130104 () Bool)

(assert (=> d!150979 (= c!130104 (and ((_ is Intermediate!10343) lt!613210) (undefined!11155 lt!613210)))))

(assert (=> d!150979 (= lt!613210 e!790505)))

(declare-fun c!130103 () Bool)

(assert (=> d!150979 (= c!130103 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!150979 (= lt!613211 (select (arr!46123 (array!95535 (store (arr!46123 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46674 a!2901))) (toIndex!0 (select (store (arr!46123 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840)))))

(assert (=> d!150979 (validMask!0 mask!2840)))

(assert (=> d!150979 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46123 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46123 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95535 (store (arr!46123 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46674 a!2901)) mask!2840) lt!613210)))

(declare-fun b!1396161 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1396161 (= e!790504 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!46123 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2840) (select (store (arr!46123 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95535 (store (arr!46123 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46674 a!2901)) mask!2840))))

(declare-fun b!1396162 () Bool)

(declare-fun e!790506 () Bool)

(assert (=> b!1396162 (= e!790507 e!790506)))

(declare-fun res!934868 () Bool)

(assert (=> b!1396162 (= res!934868 (and ((_ is Intermediate!10343) lt!613210) (not (undefined!11155 lt!613210)) (bvslt (x!125558 lt!613210) #b01111111111111111111111111111110) (bvsge (x!125558 lt!613210) #b00000000000000000000000000000000) (bvsge (x!125558 lt!613210) #b00000000000000000000000000000000)))))

(assert (=> b!1396162 (=> (not res!934868) (not e!790506))))

(declare-fun b!1396163 () Bool)

(assert (=> b!1396163 (and (bvsge (index!43745 lt!613210) #b00000000000000000000000000000000) (bvslt (index!43745 lt!613210) (size!46674 (array!95535 (store (arr!46123 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46674 a!2901)))))))

(declare-fun res!934869 () Bool)

(assert (=> b!1396163 (= res!934869 (= (select (arr!46123 (array!95535 (store (arr!46123 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46674 a!2901))) (index!43745 lt!613210)) (select (store (arr!46123 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(assert (=> b!1396163 (=> res!934869 e!790508)))

(assert (=> b!1396163 (= e!790506 e!790508)))

(declare-fun b!1396164 () Bool)

(assert (=> b!1396164 (and (bvsge (index!43745 lt!613210) #b00000000000000000000000000000000) (bvslt (index!43745 lt!613210) (size!46674 (array!95535 (store (arr!46123 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46674 a!2901)))))))

(assert (=> b!1396164 (= e!790508 (= (select (arr!46123 (array!95535 (store (arr!46123 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46674 a!2901))) (index!43745 lt!613210)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!150979 c!130103) b!1396156))

(assert (= (and d!150979 (not c!130103)) b!1396160))

(assert (= (and b!1396160 c!130105) b!1396158))

(assert (= (and b!1396160 (not c!130105)) b!1396161))

(assert (= (and d!150979 c!130104) b!1396157))

(assert (= (and d!150979 (not c!130104)) b!1396162))

(assert (= (and b!1396162 res!934868) b!1396163))

(assert (= (and b!1396163 (not res!934869)) b!1396159))

(assert (= (and b!1396159 (not res!934870)) b!1396164))

(assert (=> b!1396161 m!1282817))

(declare-fun m!1282915 () Bool)

(assert (=> b!1396161 m!1282915))

(assert (=> b!1396161 m!1282915))

(assert (=> b!1396161 m!1282815))

(declare-fun m!1282917 () Bool)

(assert (=> b!1396161 m!1282917))

(declare-fun m!1282919 () Bool)

(assert (=> b!1396163 m!1282919))

(assert (=> b!1396159 m!1282919))

(assert (=> d!150979 m!1282817))

(declare-fun m!1282921 () Bool)

(assert (=> d!150979 m!1282921))

(assert (=> d!150979 m!1282835))

(assert (=> b!1396164 m!1282919))

(assert (=> b!1396079 d!150979))

(declare-fun d!150985 () Bool)

(declare-fun lt!613217 () (_ BitVec 32))

(declare-fun lt!613216 () (_ BitVec 32))

(assert (=> d!150985 (= lt!613217 (bvmul (bvxor lt!613216 (bvlshr lt!613216 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150985 (= lt!613216 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46123 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46123 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150985 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!934871 (let ((h!33869 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46123 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46123 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!125562 (bvmul (bvxor h!33869 (bvlshr h!33869 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!125562 (bvlshr x!125562 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!934871 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!934871 #b00000000000000000000000000000000))))))

(assert (=> d!150985 (= (toIndex!0 (select (store (arr!46123 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvand (bvxor lt!613217 (bvlshr lt!613217 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1396079 d!150985))

(declare-fun d!150987 () Bool)

(assert (=> d!150987 (= (validKeyInArray!0 (select (arr!46123 a!2901) i!1037)) (and (not (= (select (arr!46123 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46123 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1396078 d!150987))

(declare-fun d!150989 () Bool)

(assert (=> d!150989 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!119930 d!150989))

(declare-fun d!150999 () Bool)

(assert (=> d!150999 (= (array_inv!35404 a!2901) (bvsge (size!46674 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!119930 d!150999))

(declare-fun d!151001 () Bool)

(declare-fun res!934896 () Bool)

(declare-fun e!790540 () Bool)

(assert (=> d!151001 (=> res!934896 e!790540)))

(assert (=> d!151001 (= res!934896 (bvsge #b00000000000000000000000000000000 (size!46674 a!2901)))))

(assert (=> d!151001 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32626) e!790540)))

(declare-fun b!1396212 () Bool)

(declare-fun e!790541 () Bool)

(assert (=> b!1396212 (= e!790540 e!790541)))

(declare-fun res!934895 () Bool)

(assert (=> b!1396212 (=> (not res!934895) (not e!790541))))

(declare-fun e!790543 () Bool)

(assert (=> b!1396212 (= res!934895 (not e!790543))))

(declare-fun res!934894 () Bool)

(assert (=> b!1396212 (=> (not res!934894) (not e!790543))))

(assert (=> b!1396212 (= res!934894 (validKeyInArray!0 (select (arr!46123 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1396213 () Bool)

(declare-fun e!790542 () Bool)

(assert (=> b!1396213 (= e!790541 e!790542)))

(declare-fun c!130119 () Bool)

(assert (=> b!1396213 (= c!130119 (validKeyInArray!0 (select (arr!46123 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1396214 () Bool)

(declare-fun call!66866 () Bool)

(assert (=> b!1396214 (= e!790542 call!66866)))

(declare-fun b!1396215 () Bool)

(assert (=> b!1396215 (= e!790542 call!66866)))

(declare-fun bm!66863 () Bool)

(assert (=> bm!66863 (= call!66866 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!130119 (Cons!32625 (select (arr!46123 a!2901) #b00000000000000000000000000000000) Nil!32626) Nil!32626)))))

(declare-fun b!1396216 () Bool)

(declare-fun contains!9816 (List!32629 (_ BitVec 64)) Bool)

(assert (=> b!1396216 (= e!790543 (contains!9816 Nil!32626 (select (arr!46123 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!151001 (not res!934896)) b!1396212))

(assert (= (and b!1396212 res!934894) b!1396216))

(assert (= (and b!1396212 res!934895) b!1396213))

(assert (= (and b!1396213 c!130119) b!1396215))

(assert (= (and b!1396213 (not c!130119)) b!1396214))

(assert (= (or b!1396215 b!1396214) bm!66863))

(declare-fun m!1282931 () Bool)

(assert (=> b!1396212 m!1282931))

(assert (=> b!1396212 m!1282931))

(declare-fun m!1282933 () Bool)

(assert (=> b!1396212 m!1282933))

(assert (=> b!1396213 m!1282931))

(assert (=> b!1396213 m!1282931))

(assert (=> b!1396213 m!1282933))

(assert (=> bm!66863 m!1282931))

(declare-fun m!1282935 () Bool)

(assert (=> bm!66863 m!1282935))

(assert (=> b!1396216 m!1282931))

(assert (=> b!1396216 m!1282931))

(declare-fun m!1282937 () Bool)

(assert (=> b!1396216 m!1282937))

(assert (=> b!1396080 d!151001))

(declare-fun b!1396265 () Bool)

(declare-fun e!790575 () Bool)

(declare-fun e!790577 () Bool)

(assert (=> b!1396265 (= e!790575 e!790577)))

(declare-fun lt!613248 () (_ BitVec 64))

(assert (=> b!1396265 (= lt!613248 (select (arr!46123 a!2901) j!112))))

(declare-fun lt!613249 () Unit!46717)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!95534 (_ BitVec 64) (_ BitVec 32)) Unit!46717)

(assert (=> b!1396265 (= lt!613249 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!613248 j!112))))

(declare-fun arrayContainsKey!0 (array!95534 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1396265 (arrayContainsKey!0 a!2901 lt!613248 #b00000000000000000000000000000000)))

(declare-fun lt!613250 () Unit!46717)

(assert (=> b!1396265 (= lt!613250 lt!613249)))

(declare-fun res!934918 () Bool)

(assert (=> b!1396265 (= res!934918 (= (seekEntryOrOpen!0 (select (arr!46123 a!2901) j!112) a!2901 mask!2840) (Found!10343 j!112)))))

(assert (=> b!1396265 (=> (not res!934918) (not e!790577))))

(declare-fun b!1396266 () Bool)

(declare-fun e!790576 () Bool)

(assert (=> b!1396266 (= e!790576 e!790575)))

(declare-fun c!130134 () Bool)

(assert (=> b!1396266 (= c!130134 (validKeyInArray!0 (select (arr!46123 a!2901) j!112)))))

(declare-fun bm!66869 () Bool)

(declare-fun call!66872 () Bool)

(assert (=> bm!66869 (= call!66872 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1396268 () Bool)

(assert (=> b!1396268 (= e!790575 call!66872)))

(declare-fun b!1396267 () Bool)

(assert (=> b!1396267 (= e!790577 call!66872)))

(declare-fun d!151005 () Bool)

(declare-fun res!934919 () Bool)

(assert (=> d!151005 (=> res!934919 e!790576)))

(assert (=> d!151005 (= res!934919 (bvsge j!112 (size!46674 a!2901)))))

(assert (=> d!151005 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!790576)))

(assert (= (and d!151005 (not res!934919)) b!1396266))

(assert (= (and b!1396266 c!130134) b!1396265))

(assert (= (and b!1396266 (not c!130134)) b!1396268))

(assert (= (and b!1396265 res!934918) b!1396267))

(assert (= (or b!1396267 b!1396268) bm!66869))

(assert (=> b!1396265 m!1282821))

(declare-fun m!1282955 () Bool)

(assert (=> b!1396265 m!1282955))

(declare-fun m!1282957 () Bool)

(assert (=> b!1396265 m!1282957))

(assert (=> b!1396265 m!1282821))

(assert (=> b!1396265 m!1282825))

(assert (=> b!1396266 m!1282821))

(assert (=> b!1396266 m!1282821))

(assert (=> b!1396266 m!1282823))

(declare-fun m!1282959 () Bool)

(assert (=> bm!66869 m!1282959))

(assert (=> b!1396076 d!151005))

(declare-fun d!151013 () Bool)

(assert (=> d!151013 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!613265 () Unit!46717)

(declare-fun choose!38 (array!95534 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46717)

(assert (=> d!151013 (= lt!613265 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!151013 (validMask!0 mask!2840)))

(assert (=> d!151013 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!613265)))

(declare-fun bs!40606 () Bool)

(assert (= bs!40606 d!151013))

(assert (=> bs!40606 m!1282845))

(declare-fun m!1282975 () Bool)

(assert (=> bs!40606 m!1282975))

(assert (=> bs!40606 m!1282835))

(assert (=> b!1396076 d!151013))

(declare-fun b!1396277 () Bool)

(declare-fun e!790585 () SeekEntryResult!10343)

(assert (=> b!1396277 (= e!790585 (Intermediate!10343 true (toIndex!0 (select (arr!46123 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1396278 () Bool)

(declare-fun e!790587 () Bool)

(declare-fun lt!613266 () SeekEntryResult!10343)

(assert (=> b!1396278 (= e!790587 (bvsge (x!125558 lt!613266) #b01111111111111111111111111111110))))

(declare-fun e!790584 () SeekEntryResult!10343)

(declare-fun b!1396279 () Bool)

(assert (=> b!1396279 (= e!790584 (Intermediate!10343 false (toIndex!0 (select (arr!46123 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1396280 () Bool)

(assert (=> b!1396280 (and (bvsge (index!43745 lt!613266) #b00000000000000000000000000000000) (bvslt (index!43745 lt!613266) (size!46674 a!2901)))))

(declare-fun res!934926 () Bool)

(assert (=> b!1396280 (= res!934926 (= (select (arr!46123 a!2901) (index!43745 lt!613266)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!790588 () Bool)

(assert (=> b!1396280 (=> res!934926 e!790588)))

(declare-fun b!1396281 () Bool)

(assert (=> b!1396281 (= e!790585 e!790584)))

(declare-fun lt!613267 () (_ BitVec 64))

(declare-fun c!130139 () Bool)

(assert (=> b!1396281 (= c!130139 (or (= lt!613267 (select (arr!46123 a!2901) j!112)) (= (bvadd lt!613267 lt!613267) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!151021 () Bool)

(assert (=> d!151021 e!790587))

(declare-fun c!130138 () Bool)

(assert (=> d!151021 (= c!130138 (and ((_ is Intermediate!10343) lt!613266) (undefined!11155 lt!613266)))))

(assert (=> d!151021 (= lt!613266 e!790585)))

(declare-fun c!130137 () Bool)

(assert (=> d!151021 (= c!130137 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!151021 (= lt!613267 (select (arr!46123 a!2901) (toIndex!0 (select (arr!46123 a!2901) j!112) mask!2840)))))

(assert (=> d!151021 (validMask!0 mask!2840)))

(assert (=> d!151021 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46123 a!2901) j!112) mask!2840) (select (arr!46123 a!2901) j!112) a!2901 mask!2840) lt!613266)))

(declare-fun b!1396282 () Bool)

(assert (=> b!1396282 (= e!790584 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46123 a!2901) j!112) mask!2840) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2840) (select (arr!46123 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1396283 () Bool)

(declare-fun e!790586 () Bool)

(assert (=> b!1396283 (= e!790587 e!790586)))

(declare-fun res!934924 () Bool)

(assert (=> b!1396283 (= res!934924 (and ((_ is Intermediate!10343) lt!613266) (not (undefined!11155 lt!613266)) (bvslt (x!125558 lt!613266) #b01111111111111111111111111111110) (bvsge (x!125558 lt!613266) #b00000000000000000000000000000000) (bvsge (x!125558 lt!613266) #b00000000000000000000000000000000)))))

(assert (=> b!1396283 (=> (not res!934924) (not e!790586))))

(declare-fun b!1396284 () Bool)

(assert (=> b!1396284 (and (bvsge (index!43745 lt!613266) #b00000000000000000000000000000000) (bvslt (index!43745 lt!613266) (size!46674 a!2901)))))

(declare-fun res!934925 () Bool)

(assert (=> b!1396284 (= res!934925 (= (select (arr!46123 a!2901) (index!43745 lt!613266)) (select (arr!46123 a!2901) j!112)))))

(assert (=> b!1396284 (=> res!934925 e!790588)))

(assert (=> b!1396284 (= e!790586 e!790588)))

(declare-fun b!1396285 () Bool)

(assert (=> b!1396285 (and (bvsge (index!43745 lt!613266) #b00000000000000000000000000000000) (bvslt (index!43745 lt!613266) (size!46674 a!2901)))))

(assert (=> b!1396285 (= e!790588 (= (select (arr!46123 a!2901) (index!43745 lt!613266)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!151021 c!130137) b!1396277))

(assert (= (and d!151021 (not c!130137)) b!1396281))

(assert (= (and b!1396281 c!130139) b!1396279))

(assert (= (and b!1396281 (not c!130139)) b!1396282))

(assert (= (and d!151021 c!130138) b!1396278))

(assert (= (and d!151021 (not c!130138)) b!1396283))

(assert (= (and b!1396283 res!934924) b!1396284))

(assert (= (and b!1396284 (not res!934925)) b!1396280))

(assert (= (and b!1396280 (not res!934926)) b!1396285))

(assert (=> b!1396282 m!1282839))

(declare-fun m!1282977 () Bool)

(assert (=> b!1396282 m!1282977))

(assert (=> b!1396282 m!1282977))

(assert (=> b!1396282 m!1282821))

(declare-fun m!1282979 () Bool)

(assert (=> b!1396282 m!1282979))

(declare-fun m!1282981 () Bool)

(assert (=> b!1396284 m!1282981))

(assert (=> b!1396280 m!1282981))

(assert (=> d!151021 m!1282839))

(declare-fun m!1282983 () Bool)

(assert (=> d!151021 m!1282983))

(assert (=> d!151021 m!1282835))

(assert (=> b!1396285 m!1282981))

(assert (=> b!1396076 d!151021))

(declare-fun d!151023 () Bool)

(declare-fun lt!613269 () (_ BitVec 32))

(declare-fun lt!613268 () (_ BitVec 32))

(assert (=> d!151023 (= lt!613269 (bvmul (bvxor lt!613268 (bvlshr lt!613268 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151023 (= lt!613268 ((_ extract 31 0) (bvand (bvxor (select (arr!46123 a!2901) j!112) (bvlshr (select (arr!46123 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151023 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!934871 (let ((h!33869 ((_ extract 31 0) (bvand (bvxor (select (arr!46123 a!2901) j!112) (bvlshr (select (arr!46123 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!125562 (bvmul (bvxor h!33869 (bvlshr h!33869 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!125562 (bvlshr x!125562 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!934871 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!934871 #b00000000000000000000000000000000))))))

(assert (=> d!151023 (= (toIndex!0 (select (arr!46123 a!2901) j!112) mask!2840) (bvand (bvxor lt!613269 (bvlshr lt!613269 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1396076 d!151023))

(declare-fun b!1396334 () Bool)

(declare-fun e!790620 () SeekEntryResult!10343)

(declare-fun lt!613290 () SeekEntryResult!10343)

(assert (=> b!1396334 (= e!790620 (MissingZero!10343 (index!43745 lt!613290)))))

(declare-fun d!151025 () Bool)

(declare-fun lt!613289 () SeekEntryResult!10343)

(assert (=> d!151025 (and (or ((_ is Undefined!10343) lt!613289) (not ((_ is Found!10343) lt!613289)) (and (bvsge (index!43744 lt!613289) #b00000000000000000000000000000000) (bvslt (index!43744 lt!613289) (size!46674 a!2901)))) (or ((_ is Undefined!10343) lt!613289) ((_ is Found!10343) lt!613289) (not ((_ is MissingZero!10343) lt!613289)) (and (bvsge (index!43743 lt!613289) #b00000000000000000000000000000000) (bvslt (index!43743 lt!613289) (size!46674 a!2901)))) (or ((_ is Undefined!10343) lt!613289) ((_ is Found!10343) lt!613289) ((_ is MissingZero!10343) lt!613289) (not ((_ is MissingVacant!10343) lt!613289)) (and (bvsge (index!43746 lt!613289) #b00000000000000000000000000000000) (bvslt (index!43746 lt!613289) (size!46674 a!2901)))) (or ((_ is Undefined!10343) lt!613289) (ite ((_ is Found!10343) lt!613289) (= (select (arr!46123 a!2901) (index!43744 lt!613289)) (select (arr!46123 a!2901) j!112)) (ite ((_ is MissingZero!10343) lt!613289) (= (select (arr!46123 a!2901) (index!43743 lt!613289)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10343) lt!613289) (= (select (arr!46123 a!2901) (index!43746 lt!613289)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!790618 () SeekEntryResult!10343)

(assert (=> d!151025 (= lt!613289 e!790618)))

(declare-fun c!130159 () Bool)

(assert (=> d!151025 (= c!130159 (and ((_ is Intermediate!10343) lt!613290) (undefined!11155 lt!613290)))))

(assert (=> d!151025 (= lt!613290 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46123 a!2901) j!112) mask!2840) (select (arr!46123 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!151025 (validMask!0 mask!2840)))

(assert (=> d!151025 (= (seekEntryOrOpen!0 (select (arr!46123 a!2901) j!112) a!2901 mask!2840) lt!613289)))

(declare-fun b!1396335 () Bool)

(declare-fun c!130160 () Bool)

(declare-fun lt!613291 () (_ BitVec 64))

(assert (=> b!1396335 (= c!130160 (= lt!613291 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!790619 () SeekEntryResult!10343)

(assert (=> b!1396335 (= e!790619 e!790620)))

(declare-fun b!1396336 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95534 (_ BitVec 32)) SeekEntryResult!10343)

(assert (=> b!1396336 (= e!790620 (seekKeyOrZeroReturnVacant!0 (x!125558 lt!613290) (index!43745 lt!613290) (index!43745 lt!613290) (select (arr!46123 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1396337 () Bool)

(assert (=> b!1396337 (= e!790618 Undefined!10343)))

(declare-fun b!1396338 () Bool)

(assert (=> b!1396338 (= e!790619 (Found!10343 (index!43745 lt!613290)))))

(declare-fun b!1396339 () Bool)

(assert (=> b!1396339 (= e!790618 e!790619)))

(assert (=> b!1396339 (= lt!613291 (select (arr!46123 a!2901) (index!43745 lt!613290)))))

(declare-fun c!130158 () Bool)

(assert (=> b!1396339 (= c!130158 (= lt!613291 (select (arr!46123 a!2901) j!112)))))

(assert (= (and d!151025 c!130159) b!1396337))

(assert (= (and d!151025 (not c!130159)) b!1396339))

(assert (= (and b!1396339 c!130158) b!1396338))

(assert (= (and b!1396339 (not c!130158)) b!1396335))

(assert (= (and b!1396335 c!130160) b!1396334))

(assert (= (and b!1396335 (not c!130160)) b!1396336))

(declare-fun m!1283003 () Bool)

(assert (=> d!151025 m!1283003))

(declare-fun m!1283005 () Bool)

(assert (=> d!151025 m!1283005))

(assert (=> d!151025 m!1282839))

(assert (=> d!151025 m!1282821))

(assert (=> d!151025 m!1282843))

(assert (=> d!151025 m!1282821))

(assert (=> d!151025 m!1282839))

(assert (=> d!151025 m!1282835))

(declare-fun m!1283007 () Bool)

(assert (=> d!151025 m!1283007))

(assert (=> b!1396336 m!1282821))

(declare-fun m!1283009 () Bool)

(assert (=> b!1396336 m!1283009))

(declare-fun m!1283011 () Bool)

(assert (=> b!1396339 m!1283011))

(assert (=> b!1396081 d!151025))

(declare-fun b!1396340 () Bool)

(declare-fun e!790621 () Bool)

(declare-fun e!790623 () Bool)

(assert (=> b!1396340 (= e!790621 e!790623)))

(declare-fun lt!613292 () (_ BitVec 64))

(assert (=> b!1396340 (= lt!613292 (select (arr!46123 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!613293 () Unit!46717)

(assert (=> b!1396340 (= lt!613293 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!613292 #b00000000000000000000000000000000))))

(assert (=> b!1396340 (arrayContainsKey!0 a!2901 lt!613292 #b00000000000000000000000000000000)))

(declare-fun lt!613294 () Unit!46717)

(assert (=> b!1396340 (= lt!613294 lt!613293)))

(declare-fun res!934939 () Bool)

(assert (=> b!1396340 (= res!934939 (= (seekEntryOrOpen!0 (select (arr!46123 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10343 #b00000000000000000000000000000000)))))

(assert (=> b!1396340 (=> (not res!934939) (not e!790623))))

(declare-fun b!1396341 () Bool)

(declare-fun e!790622 () Bool)

(assert (=> b!1396341 (= e!790622 e!790621)))

(declare-fun c!130161 () Bool)

(assert (=> b!1396341 (= c!130161 (validKeyInArray!0 (select (arr!46123 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!66875 () Bool)

(declare-fun call!66878 () Bool)

(assert (=> bm!66875 (= call!66878 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1396343 () Bool)

(assert (=> b!1396343 (= e!790621 call!66878)))

(declare-fun b!1396342 () Bool)

(assert (=> b!1396342 (= e!790623 call!66878)))

(declare-fun d!151041 () Bool)

(declare-fun res!934940 () Bool)

(assert (=> d!151041 (=> res!934940 e!790622)))

(assert (=> d!151041 (= res!934940 (bvsge #b00000000000000000000000000000000 (size!46674 a!2901)))))

(assert (=> d!151041 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!790622)))

(assert (= (and d!151041 (not res!934940)) b!1396341))

(assert (= (and b!1396341 c!130161) b!1396340))

(assert (= (and b!1396341 (not c!130161)) b!1396343))

(assert (= (and b!1396340 res!934939) b!1396342))

(assert (= (or b!1396342 b!1396343) bm!66875))

(assert (=> b!1396340 m!1282931))

(declare-fun m!1283013 () Bool)

(assert (=> b!1396340 m!1283013))

(declare-fun m!1283015 () Bool)

(assert (=> b!1396340 m!1283015))

(assert (=> b!1396340 m!1282931))

(declare-fun m!1283017 () Bool)

(assert (=> b!1396340 m!1283017))

(assert (=> b!1396341 m!1282931))

(assert (=> b!1396341 m!1282931))

(assert (=> b!1396341 m!1282933))

(declare-fun m!1283019 () Bool)

(assert (=> bm!66875 m!1283019))

(assert (=> b!1396083 d!151041))

(declare-fun d!151043 () Bool)

(assert (=> d!151043 (= (validKeyInArray!0 (select (arr!46123 a!2901) j!112)) (and (not (= (select (arr!46123 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46123 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1396077 d!151043))

(check-sat (not d!150979) (not bm!66875) (not b!1396341) (not b!1396266) (not b!1396213) (not b!1396265) (not bm!66863) (not bm!66869) (not d!151021) (not b!1396282) (not b!1396161) (not d!151025) (not b!1396340) (not b!1396336) (not d!151013) (not b!1396216) (not b!1396212))
(check-sat)
