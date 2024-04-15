; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119894 () Bool)

(assert start!119894)

(declare-fun b!1395983 () Bool)

(declare-fun e!790313 () Bool)

(declare-fun e!790314 () Bool)

(assert (=> b!1395983 (= e!790313 (not e!790314))))

(declare-fun res!935113 () Bool)

(assert (=> b!1395983 (=> res!935113 e!790314)))

(declare-datatypes ((SeekEntryResult!10412 0))(
  ( (MissingZero!10412 (index!44019 (_ BitVec 32))) (Found!10412 (index!44020 (_ BitVec 32))) (Intermediate!10412 (undefined!11224 Bool) (index!44021 (_ BitVec 32)) (x!125681 (_ BitVec 32))) (Undefined!10412) (MissingVacant!10412 (index!44022 (_ BitVec 32))) )
))
(declare-fun lt!613045 () SeekEntryResult!10412)

(get-info :version)

(assert (=> b!1395983 (= res!935113 (or (not ((_ is Intermediate!10412) lt!613045)) (undefined!11224 lt!613045)))))

(declare-fun e!790315 () Bool)

(assert (=> b!1395983 e!790315))

(declare-fun res!935118 () Bool)

(assert (=> b!1395983 (=> (not res!935118) (not e!790315))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95427 0))(
  ( (array!95428 (arr!46069 (Array (_ BitVec 32) (_ BitVec 64))) (size!46621 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95427)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95427 (_ BitVec 32)) Bool)

(assert (=> b!1395983 (= res!935118 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46671 0))(
  ( (Unit!46672) )
))
(declare-fun lt!613046 () Unit!46671)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95427 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46671)

(assert (=> b!1395983 (= lt!613046 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95427 (_ BitVec 32)) SeekEntryResult!10412)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1395983 (= lt!613045 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46069 a!2901) j!112) mask!2840) (select (arr!46069 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1395984 () Bool)

(declare-fun res!935119 () Bool)

(assert (=> b!1395984 (=> (not res!935119) (not e!790313))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1395984 (= res!935119 (validKeyInArray!0 (select (arr!46069 a!2901) j!112)))))

(declare-fun b!1395985 () Bool)

(declare-fun res!935117 () Bool)

(assert (=> b!1395985 (=> (not res!935117) (not e!790313))))

(assert (=> b!1395985 (= res!935117 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1395986 () Bool)

(declare-fun res!935116 () Bool)

(assert (=> b!1395986 (=> (not res!935116) (not e!790313))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1395986 (= res!935116 (validKeyInArray!0 (select (arr!46069 a!2901) i!1037)))))

(declare-fun b!1395987 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95427 (_ BitVec 32)) SeekEntryResult!10412)

(assert (=> b!1395987 (= e!790315 (= (seekEntryOrOpen!0 (select (arr!46069 a!2901) j!112) a!2901 mask!2840) (Found!10412 j!112)))))

(declare-fun res!935114 () Bool)

(assert (=> start!119894 (=> (not res!935114) (not e!790313))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119894 (= res!935114 (validMask!0 mask!2840))))

(assert (=> start!119894 e!790313))

(assert (=> start!119894 true))

(declare-fun array_inv!35302 (array!95427) Bool)

(assert (=> start!119894 (array_inv!35302 a!2901)))

(declare-fun lt!613044 () SeekEntryResult!10412)

(declare-fun b!1395988 () Bool)

(assert (=> b!1395988 (= e!790314 (or (= lt!613045 lt!613044) (not ((_ is Intermediate!10412) lt!613044)) (bvslt mask!2840 #b00000000000000000000000000000000) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> b!1395988 (= lt!613044 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46069 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46069 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95428 (store (arr!46069 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46621 a!2901)) mask!2840))))

(declare-fun b!1395989 () Bool)

(declare-fun res!935115 () Bool)

(assert (=> b!1395989 (=> (not res!935115) (not e!790313))))

(declare-datatypes ((List!32666 0))(
  ( (Nil!32663) (Cons!32662 (h!33901 (_ BitVec 64)) (t!47352 List!32666)) )
))
(declare-fun arrayNoDuplicates!0 (array!95427 (_ BitVec 32) List!32666) Bool)

(assert (=> b!1395989 (= res!935115 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32663))))

(declare-fun b!1395990 () Bool)

(declare-fun res!935112 () Bool)

(assert (=> b!1395990 (=> (not res!935112) (not e!790313))))

(assert (=> b!1395990 (= res!935112 (and (= (size!46621 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46621 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46621 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!119894 res!935114) b!1395990))

(assert (= (and b!1395990 res!935112) b!1395986))

(assert (= (and b!1395986 res!935116) b!1395984))

(assert (= (and b!1395984 res!935119) b!1395985))

(assert (= (and b!1395985 res!935117) b!1395989))

(assert (= (and b!1395989 res!935115) b!1395983))

(assert (= (and b!1395983 res!935118) b!1395987))

(assert (= (and b!1395983 (not res!935113)) b!1395988))

(declare-fun m!1282027 () Bool)

(assert (=> start!119894 m!1282027))

(declare-fun m!1282029 () Bool)

(assert (=> start!119894 m!1282029))

(declare-fun m!1282031 () Bool)

(assert (=> b!1395987 m!1282031))

(assert (=> b!1395987 m!1282031))

(declare-fun m!1282033 () Bool)

(assert (=> b!1395987 m!1282033))

(declare-fun m!1282035 () Bool)

(assert (=> b!1395986 m!1282035))

(assert (=> b!1395986 m!1282035))

(declare-fun m!1282037 () Bool)

(assert (=> b!1395986 m!1282037))

(declare-fun m!1282039 () Bool)

(assert (=> b!1395985 m!1282039))

(assert (=> b!1395984 m!1282031))

(assert (=> b!1395984 m!1282031))

(declare-fun m!1282041 () Bool)

(assert (=> b!1395984 m!1282041))

(assert (=> b!1395983 m!1282031))

(declare-fun m!1282043 () Bool)

(assert (=> b!1395983 m!1282043))

(assert (=> b!1395983 m!1282031))

(declare-fun m!1282045 () Bool)

(assert (=> b!1395983 m!1282045))

(assert (=> b!1395983 m!1282043))

(assert (=> b!1395983 m!1282031))

(declare-fun m!1282047 () Bool)

(assert (=> b!1395983 m!1282047))

(declare-fun m!1282049 () Bool)

(assert (=> b!1395983 m!1282049))

(declare-fun m!1282051 () Bool)

(assert (=> b!1395988 m!1282051))

(declare-fun m!1282053 () Bool)

(assert (=> b!1395988 m!1282053))

(assert (=> b!1395988 m!1282053))

(declare-fun m!1282055 () Bool)

(assert (=> b!1395988 m!1282055))

(assert (=> b!1395988 m!1282055))

(assert (=> b!1395988 m!1282053))

(declare-fun m!1282057 () Bool)

(assert (=> b!1395988 m!1282057))

(declare-fun m!1282059 () Bool)

(assert (=> b!1395989 m!1282059))

(check-sat (not b!1395985) (not b!1395987) (not b!1395988) (not b!1395989) (not b!1395986) (not b!1395984) (not start!119894) (not b!1395983))
(check-sat)
(get-model)

(declare-fun b!1396057 () Bool)

(declare-fun e!790354 () Bool)

(declare-fun e!790353 () Bool)

(assert (=> b!1396057 (= e!790354 e!790353)))

(declare-fun res!935176 () Bool)

(declare-fun lt!613069 () SeekEntryResult!10412)

(assert (=> b!1396057 (= res!935176 (and ((_ is Intermediate!10412) lt!613069) (not (undefined!11224 lt!613069)) (bvslt (x!125681 lt!613069) #b01111111111111111111111111111110) (bvsge (x!125681 lt!613069) #b00000000000000000000000000000000) (bvsge (x!125681 lt!613069) #b00000000000000000000000000000000)))))

(assert (=> b!1396057 (=> (not res!935176) (not e!790353))))

(declare-fun b!1396058 () Bool)

(assert (=> b!1396058 (= e!790354 (bvsge (x!125681 lt!613069) #b01111111111111111111111111111110))))

(declare-fun d!150681 () Bool)

(assert (=> d!150681 e!790354))

(declare-fun c!129899 () Bool)

(assert (=> d!150681 (= c!129899 (and ((_ is Intermediate!10412) lt!613069) (undefined!11224 lt!613069)))))

(declare-fun e!790355 () SeekEntryResult!10412)

(assert (=> d!150681 (= lt!613069 e!790355)))

(declare-fun c!129900 () Bool)

(assert (=> d!150681 (= c!129900 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!613070 () (_ BitVec 64))

(assert (=> d!150681 (= lt!613070 (select (arr!46069 (array!95428 (store (arr!46069 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46621 a!2901))) (toIndex!0 (select (store (arr!46069 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840)))))

(assert (=> d!150681 (validMask!0 mask!2840)))

(assert (=> d!150681 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46069 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46069 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95428 (store (arr!46069 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46621 a!2901)) mask!2840) lt!613069)))

(declare-fun e!790352 () SeekEntryResult!10412)

(declare-fun b!1396059 () Bool)

(assert (=> b!1396059 (= e!790352 (Intermediate!10412 false (toIndex!0 (select (store (arr!46069 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1396060 () Bool)

(assert (=> b!1396060 (= e!790355 (Intermediate!10412 true (toIndex!0 (select (store (arr!46069 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1396061 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1396061 (= e!790352 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!46069 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (store (arr!46069 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95428 (store (arr!46069 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46621 a!2901)) mask!2840))))

(declare-fun b!1396062 () Bool)

(assert (=> b!1396062 (and (bvsge (index!44021 lt!613069) #b00000000000000000000000000000000) (bvslt (index!44021 lt!613069) (size!46621 (array!95428 (store (arr!46069 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46621 a!2901)))))))

(declare-fun res!935174 () Bool)

(assert (=> b!1396062 (= res!935174 (= (select (arr!46069 (array!95428 (store (arr!46069 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46621 a!2901))) (index!44021 lt!613069)) (select (store (arr!46069 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(declare-fun e!790351 () Bool)

(assert (=> b!1396062 (=> res!935174 e!790351)))

(assert (=> b!1396062 (= e!790353 e!790351)))

(declare-fun b!1396063 () Bool)

(assert (=> b!1396063 (and (bvsge (index!44021 lt!613069) #b00000000000000000000000000000000) (bvslt (index!44021 lt!613069) (size!46621 (array!95428 (store (arr!46069 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46621 a!2901)))))))

(declare-fun res!935175 () Bool)

(assert (=> b!1396063 (= res!935175 (= (select (arr!46069 (array!95428 (store (arr!46069 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46621 a!2901))) (index!44021 lt!613069)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1396063 (=> res!935175 e!790351)))

(declare-fun b!1396064 () Bool)

(assert (=> b!1396064 (= e!790355 e!790352)))

(declare-fun c!129901 () Bool)

(assert (=> b!1396064 (= c!129901 (or (= lt!613070 (select (store (arr!46069 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)) (= (bvadd lt!613070 lt!613070) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1396065 () Bool)

(assert (=> b!1396065 (and (bvsge (index!44021 lt!613069) #b00000000000000000000000000000000) (bvslt (index!44021 lt!613069) (size!46621 (array!95428 (store (arr!46069 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46621 a!2901)))))))

(assert (=> b!1396065 (= e!790351 (= (select (arr!46069 (array!95428 (store (arr!46069 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46621 a!2901))) (index!44021 lt!613069)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!150681 c!129900) b!1396060))

(assert (= (and d!150681 (not c!129900)) b!1396064))

(assert (= (and b!1396064 c!129901) b!1396059))

(assert (= (and b!1396064 (not c!129901)) b!1396061))

(assert (= (and d!150681 c!129899) b!1396058))

(assert (= (and d!150681 (not c!129899)) b!1396057))

(assert (= (and b!1396057 res!935176) b!1396062))

(assert (= (and b!1396062 (not res!935174)) b!1396063))

(assert (= (and b!1396063 (not res!935175)) b!1396065))

(assert (=> d!150681 m!1282055))

(declare-fun m!1282129 () Bool)

(assert (=> d!150681 m!1282129))

(assert (=> d!150681 m!1282027))

(declare-fun m!1282131 () Bool)

(assert (=> b!1396065 m!1282131))

(assert (=> b!1396063 m!1282131))

(assert (=> b!1396062 m!1282131))

(assert (=> b!1396061 m!1282055))

(declare-fun m!1282133 () Bool)

(assert (=> b!1396061 m!1282133))

(assert (=> b!1396061 m!1282133))

(assert (=> b!1396061 m!1282053))

(declare-fun m!1282135 () Bool)

(assert (=> b!1396061 m!1282135))

(assert (=> b!1395988 d!150681))

(declare-fun d!150689 () Bool)

(declare-fun lt!613082 () (_ BitVec 32))

(declare-fun lt!613081 () (_ BitVec 32))

(assert (=> d!150689 (= lt!613082 (bvmul (bvxor lt!613081 (bvlshr lt!613081 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150689 (= lt!613081 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46069 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46069 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150689 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!935177 (let ((h!33904 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46069 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46069 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!125685 (bvmul (bvxor h!33904 (bvlshr h!33904 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!125685 (bvlshr x!125685 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!935177 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!935177 #b00000000000000000000000000000000))))))

(assert (=> d!150689 (= (toIndex!0 (select (store (arr!46069 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvand (bvxor lt!613082 (bvlshr lt!613082 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1395988 d!150689))

(declare-fun b!1396117 () Bool)

(declare-fun e!790386 () SeekEntryResult!10412)

(declare-fun e!790388 () SeekEntryResult!10412)

(assert (=> b!1396117 (= e!790386 e!790388)))

(declare-fun lt!613109 () (_ BitVec 64))

(declare-fun lt!613107 () SeekEntryResult!10412)

(assert (=> b!1396117 (= lt!613109 (select (arr!46069 a!2901) (index!44021 lt!613107)))))

(declare-fun c!129922 () Bool)

(assert (=> b!1396117 (= c!129922 (= lt!613109 (select (arr!46069 a!2901) j!112)))))

(declare-fun b!1396118 () Bool)

(declare-fun c!129921 () Bool)

(assert (=> b!1396118 (= c!129921 (= lt!613109 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!790387 () SeekEntryResult!10412)

(assert (=> b!1396118 (= e!790388 e!790387)))

(declare-fun b!1396119 () Bool)

(assert (=> b!1396119 (= e!790386 Undefined!10412)))

(declare-fun b!1396120 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95427 (_ BitVec 32)) SeekEntryResult!10412)

(assert (=> b!1396120 (= e!790387 (seekKeyOrZeroReturnVacant!0 (x!125681 lt!613107) (index!44021 lt!613107) (index!44021 lt!613107) (select (arr!46069 a!2901) j!112) a!2901 mask!2840))))

(declare-fun d!150691 () Bool)

(declare-fun lt!613108 () SeekEntryResult!10412)

(assert (=> d!150691 (and (or ((_ is Undefined!10412) lt!613108) (not ((_ is Found!10412) lt!613108)) (and (bvsge (index!44020 lt!613108) #b00000000000000000000000000000000) (bvslt (index!44020 lt!613108) (size!46621 a!2901)))) (or ((_ is Undefined!10412) lt!613108) ((_ is Found!10412) lt!613108) (not ((_ is MissingZero!10412) lt!613108)) (and (bvsge (index!44019 lt!613108) #b00000000000000000000000000000000) (bvslt (index!44019 lt!613108) (size!46621 a!2901)))) (or ((_ is Undefined!10412) lt!613108) ((_ is Found!10412) lt!613108) ((_ is MissingZero!10412) lt!613108) (not ((_ is MissingVacant!10412) lt!613108)) (and (bvsge (index!44022 lt!613108) #b00000000000000000000000000000000) (bvslt (index!44022 lt!613108) (size!46621 a!2901)))) (or ((_ is Undefined!10412) lt!613108) (ite ((_ is Found!10412) lt!613108) (= (select (arr!46069 a!2901) (index!44020 lt!613108)) (select (arr!46069 a!2901) j!112)) (ite ((_ is MissingZero!10412) lt!613108) (= (select (arr!46069 a!2901) (index!44019 lt!613108)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10412) lt!613108) (= (select (arr!46069 a!2901) (index!44022 lt!613108)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!150691 (= lt!613108 e!790386)))

(declare-fun c!129920 () Bool)

(assert (=> d!150691 (= c!129920 (and ((_ is Intermediate!10412) lt!613107) (undefined!11224 lt!613107)))))

(assert (=> d!150691 (= lt!613107 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46069 a!2901) j!112) mask!2840) (select (arr!46069 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!150691 (validMask!0 mask!2840)))

(assert (=> d!150691 (= (seekEntryOrOpen!0 (select (arr!46069 a!2901) j!112) a!2901 mask!2840) lt!613108)))

(declare-fun b!1396121 () Bool)

(assert (=> b!1396121 (= e!790387 (MissingZero!10412 (index!44021 lt!613107)))))

(declare-fun b!1396122 () Bool)

(assert (=> b!1396122 (= e!790388 (Found!10412 (index!44021 lt!613107)))))

(assert (= (and d!150691 c!129920) b!1396119))

(assert (= (and d!150691 (not c!129920)) b!1396117))

(assert (= (and b!1396117 c!129922) b!1396122))

(assert (= (and b!1396117 (not c!129922)) b!1396118))

(assert (= (and b!1396118 c!129921) b!1396121))

(assert (= (and b!1396118 (not c!129921)) b!1396120))

(declare-fun m!1282153 () Bool)

(assert (=> b!1396117 m!1282153))

(assert (=> b!1396120 m!1282031))

(declare-fun m!1282155 () Bool)

(assert (=> b!1396120 m!1282155))

(declare-fun m!1282157 () Bool)

(assert (=> d!150691 m!1282157))

(assert (=> d!150691 m!1282027))

(assert (=> d!150691 m!1282031))

(assert (=> d!150691 m!1282043))

(declare-fun m!1282159 () Bool)

(assert (=> d!150691 m!1282159))

(declare-fun m!1282161 () Bool)

(assert (=> d!150691 m!1282161))

(assert (=> d!150691 m!1282043))

(assert (=> d!150691 m!1282031))

(assert (=> d!150691 m!1282047))

(assert (=> b!1395987 d!150691))

(declare-fun d!150701 () Bool)

(assert (=> d!150701 (= (validKeyInArray!0 (select (arr!46069 a!2901) j!112)) (and (not (= (select (arr!46069 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46069 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1395984 d!150701))

(declare-fun d!150703 () Bool)

(declare-fun res!935209 () Bool)

(declare-fun e!790414 () Bool)

(assert (=> d!150703 (=> res!935209 e!790414)))

(assert (=> d!150703 (= res!935209 (bvsge #b00000000000000000000000000000000 (size!46621 a!2901)))))

(assert (=> d!150703 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32663) e!790414)))

(declare-fun b!1396160 () Bool)

(declare-fun e!790412 () Bool)

(declare-fun call!66830 () Bool)

(assert (=> b!1396160 (= e!790412 call!66830)))

(declare-fun b!1396161 () Bool)

(assert (=> b!1396161 (= e!790412 call!66830)))

(declare-fun b!1396162 () Bool)

(declare-fun e!790413 () Bool)

(assert (=> b!1396162 (= e!790414 e!790413)))

(declare-fun res!935211 () Bool)

(assert (=> b!1396162 (=> (not res!935211) (not e!790413))))

(declare-fun e!790415 () Bool)

(assert (=> b!1396162 (= res!935211 (not e!790415))))

(declare-fun res!935210 () Bool)

(assert (=> b!1396162 (=> (not res!935210) (not e!790415))))

(assert (=> b!1396162 (= res!935210 (validKeyInArray!0 (select (arr!46069 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1396163 () Bool)

(declare-fun contains!9742 (List!32666 (_ BitVec 64)) Bool)

(assert (=> b!1396163 (= e!790415 (contains!9742 Nil!32663 (select (arr!46069 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!66827 () Bool)

(declare-fun c!129934 () Bool)

(assert (=> bm!66827 (= call!66830 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!129934 (Cons!32662 (select (arr!46069 a!2901) #b00000000000000000000000000000000) Nil!32663) Nil!32663)))))

(declare-fun b!1396164 () Bool)

(assert (=> b!1396164 (= e!790413 e!790412)))

(assert (=> b!1396164 (= c!129934 (validKeyInArray!0 (select (arr!46069 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!150703 (not res!935209)) b!1396162))

(assert (= (and b!1396162 res!935210) b!1396163))

(assert (= (and b!1396162 res!935211) b!1396164))

(assert (= (and b!1396164 c!129934) b!1396160))

(assert (= (and b!1396164 (not c!129934)) b!1396161))

(assert (= (or b!1396160 b!1396161) bm!66827))

(declare-fun m!1282169 () Bool)

(assert (=> b!1396162 m!1282169))

(assert (=> b!1396162 m!1282169))

(declare-fun m!1282171 () Bool)

(assert (=> b!1396162 m!1282171))

(assert (=> b!1396163 m!1282169))

(assert (=> b!1396163 m!1282169))

(declare-fun m!1282175 () Bool)

(assert (=> b!1396163 m!1282175))

(assert (=> bm!66827 m!1282169))

(declare-fun m!1282177 () Bool)

(assert (=> bm!66827 m!1282177))

(assert (=> b!1396164 m!1282169))

(assert (=> b!1396164 m!1282169))

(assert (=> b!1396164 m!1282171))

(assert (=> b!1395989 d!150703))

(declare-fun b!1396191 () Bool)

(declare-fun e!790436 () Bool)

(declare-fun call!66837 () Bool)

(assert (=> b!1396191 (= e!790436 call!66837)))

(declare-fun d!150709 () Bool)

(declare-fun res!935228 () Bool)

(declare-fun e!790437 () Bool)

(assert (=> d!150709 (=> res!935228 e!790437)))

(assert (=> d!150709 (= res!935228 (bvsge j!112 (size!46621 a!2901)))))

(assert (=> d!150709 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!790437)))

(declare-fun b!1396192 () Bool)

(declare-fun e!790438 () Bool)

(assert (=> b!1396192 (= e!790436 e!790438)))

(declare-fun lt!613134 () (_ BitVec 64))

(assert (=> b!1396192 (= lt!613134 (select (arr!46069 a!2901) j!112))))

(declare-fun lt!613136 () Unit!46671)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!95427 (_ BitVec 64) (_ BitVec 32)) Unit!46671)

(assert (=> b!1396192 (= lt!613136 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!613134 j!112))))

(declare-fun arrayContainsKey!0 (array!95427 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1396192 (arrayContainsKey!0 a!2901 lt!613134 #b00000000000000000000000000000000)))

(declare-fun lt!613135 () Unit!46671)

(assert (=> b!1396192 (= lt!613135 lt!613136)))

(declare-fun res!935227 () Bool)

(assert (=> b!1396192 (= res!935227 (= (seekEntryOrOpen!0 (select (arr!46069 a!2901) j!112) a!2901 mask!2840) (Found!10412 j!112)))))

(assert (=> b!1396192 (=> (not res!935227) (not e!790438))))

(declare-fun b!1396193 () Bool)

(assert (=> b!1396193 (= e!790438 call!66837)))

(declare-fun bm!66834 () Bool)

(assert (=> bm!66834 (= call!66837 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1396194 () Bool)

(assert (=> b!1396194 (= e!790437 e!790436)))

(declare-fun c!129941 () Bool)

(assert (=> b!1396194 (= c!129941 (validKeyInArray!0 (select (arr!46069 a!2901) j!112)))))

(assert (= (and d!150709 (not res!935228)) b!1396194))

(assert (= (and b!1396194 c!129941) b!1396192))

(assert (= (and b!1396194 (not c!129941)) b!1396191))

(assert (= (and b!1396192 res!935227) b!1396193))

(assert (= (or b!1396193 b!1396191) bm!66834))

(assert (=> b!1396192 m!1282031))

(declare-fun m!1282179 () Bool)

(assert (=> b!1396192 m!1282179))

(declare-fun m!1282181 () Bool)

(assert (=> b!1396192 m!1282181))

(assert (=> b!1396192 m!1282031))

(assert (=> b!1396192 m!1282033))

(declare-fun m!1282183 () Bool)

(assert (=> bm!66834 m!1282183))

(assert (=> b!1396194 m!1282031))

(assert (=> b!1396194 m!1282031))

(assert (=> b!1396194 m!1282041))

(assert (=> b!1395983 d!150709))

(declare-fun d!150715 () Bool)

(assert (=> d!150715 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!613147 () Unit!46671)

(declare-fun choose!38 (array!95427 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46671)

(assert (=> d!150715 (= lt!613147 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!150715 (validMask!0 mask!2840)))

(assert (=> d!150715 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!613147)))

(declare-fun bs!40604 () Bool)

(assert (= bs!40604 d!150715))

(assert (=> bs!40604 m!1282049))

(declare-fun m!1282207 () Bool)

(assert (=> bs!40604 m!1282207))

(assert (=> bs!40604 m!1282027))

(assert (=> b!1395983 d!150715))

(declare-fun b!1396208 () Bool)

(declare-fun e!790452 () Bool)

(declare-fun e!790451 () Bool)

(assert (=> b!1396208 (= e!790452 e!790451)))

(declare-fun res!935238 () Bool)

(declare-fun lt!613149 () SeekEntryResult!10412)

(assert (=> b!1396208 (= res!935238 (and ((_ is Intermediate!10412) lt!613149) (not (undefined!11224 lt!613149)) (bvslt (x!125681 lt!613149) #b01111111111111111111111111111110) (bvsge (x!125681 lt!613149) #b00000000000000000000000000000000) (bvsge (x!125681 lt!613149) #b00000000000000000000000000000000)))))

(assert (=> b!1396208 (=> (not res!935238) (not e!790451))))

(declare-fun b!1396209 () Bool)

(assert (=> b!1396209 (= e!790452 (bvsge (x!125681 lt!613149) #b01111111111111111111111111111110))))

(declare-fun d!150723 () Bool)

(assert (=> d!150723 e!790452))

(declare-fun c!129945 () Bool)

(assert (=> d!150723 (= c!129945 (and ((_ is Intermediate!10412) lt!613149) (undefined!11224 lt!613149)))))

(declare-fun e!790453 () SeekEntryResult!10412)

(assert (=> d!150723 (= lt!613149 e!790453)))

(declare-fun c!129946 () Bool)

(assert (=> d!150723 (= c!129946 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!613150 () (_ BitVec 64))

(assert (=> d!150723 (= lt!613150 (select (arr!46069 a!2901) (toIndex!0 (select (arr!46069 a!2901) j!112) mask!2840)))))

(assert (=> d!150723 (validMask!0 mask!2840)))

(assert (=> d!150723 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46069 a!2901) j!112) mask!2840) (select (arr!46069 a!2901) j!112) a!2901 mask!2840) lt!613149)))

(declare-fun b!1396210 () Bool)

(declare-fun e!790450 () SeekEntryResult!10412)

(assert (=> b!1396210 (= e!790450 (Intermediate!10412 false (toIndex!0 (select (arr!46069 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1396211 () Bool)

(assert (=> b!1396211 (= e!790453 (Intermediate!10412 true (toIndex!0 (select (arr!46069 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1396212 () Bool)

(assert (=> b!1396212 (= e!790450 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46069 a!2901) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (arr!46069 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1396213 () Bool)

(assert (=> b!1396213 (and (bvsge (index!44021 lt!613149) #b00000000000000000000000000000000) (bvslt (index!44021 lt!613149) (size!46621 a!2901)))))

(declare-fun res!935236 () Bool)

(assert (=> b!1396213 (= res!935236 (= (select (arr!46069 a!2901) (index!44021 lt!613149)) (select (arr!46069 a!2901) j!112)))))

(declare-fun e!790449 () Bool)

(assert (=> b!1396213 (=> res!935236 e!790449)))

(assert (=> b!1396213 (= e!790451 e!790449)))

(declare-fun b!1396214 () Bool)

(assert (=> b!1396214 (and (bvsge (index!44021 lt!613149) #b00000000000000000000000000000000) (bvslt (index!44021 lt!613149) (size!46621 a!2901)))))

(declare-fun res!935237 () Bool)

(assert (=> b!1396214 (= res!935237 (= (select (arr!46069 a!2901) (index!44021 lt!613149)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1396214 (=> res!935237 e!790449)))

(declare-fun b!1396215 () Bool)

(assert (=> b!1396215 (= e!790453 e!790450)))

(declare-fun c!129947 () Bool)

(assert (=> b!1396215 (= c!129947 (or (= lt!613150 (select (arr!46069 a!2901) j!112)) (= (bvadd lt!613150 lt!613150) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1396216 () Bool)

(assert (=> b!1396216 (and (bvsge (index!44021 lt!613149) #b00000000000000000000000000000000) (bvslt (index!44021 lt!613149) (size!46621 a!2901)))))

(assert (=> b!1396216 (= e!790449 (= (select (arr!46069 a!2901) (index!44021 lt!613149)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!150723 c!129946) b!1396211))

(assert (= (and d!150723 (not c!129946)) b!1396215))

(assert (= (and b!1396215 c!129947) b!1396210))

(assert (= (and b!1396215 (not c!129947)) b!1396212))

(assert (= (and d!150723 c!129945) b!1396209))

(assert (= (and d!150723 (not c!129945)) b!1396208))

(assert (= (and b!1396208 res!935238) b!1396213))

(assert (= (and b!1396213 (not res!935236)) b!1396214))

(assert (= (and b!1396214 (not res!935237)) b!1396216))

(assert (=> d!150723 m!1282043))

(declare-fun m!1282211 () Bool)

(assert (=> d!150723 m!1282211))

(assert (=> d!150723 m!1282027))

(declare-fun m!1282213 () Bool)

(assert (=> b!1396216 m!1282213))

(assert (=> b!1396214 m!1282213))

(assert (=> b!1396213 m!1282213))

(assert (=> b!1396212 m!1282043))

(declare-fun m!1282215 () Bool)

(assert (=> b!1396212 m!1282215))

(assert (=> b!1396212 m!1282215))

(assert (=> b!1396212 m!1282031))

(declare-fun m!1282217 () Bool)

(assert (=> b!1396212 m!1282217))

(assert (=> b!1395983 d!150723))

(declare-fun d!150727 () Bool)

(declare-fun lt!613154 () (_ BitVec 32))

(declare-fun lt!613153 () (_ BitVec 32))

(assert (=> d!150727 (= lt!613154 (bvmul (bvxor lt!613153 (bvlshr lt!613153 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150727 (= lt!613153 ((_ extract 31 0) (bvand (bvxor (select (arr!46069 a!2901) j!112) (bvlshr (select (arr!46069 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150727 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!935177 (let ((h!33904 ((_ extract 31 0) (bvand (bvxor (select (arr!46069 a!2901) j!112) (bvlshr (select (arr!46069 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!125685 (bvmul (bvxor h!33904 (bvlshr h!33904 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!125685 (bvlshr x!125685 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!935177 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!935177 #b00000000000000000000000000000000))))))

(assert (=> d!150727 (= (toIndex!0 (select (arr!46069 a!2901) j!112) mask!2840) (bvand (bvxor lt!613154 (bvlshr lt!613154 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1395983 d!150727))

(declare-fun d!150729 () Bool)

(assert (=> d!150729 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!119894 d!150729))

(declare-fun d!150743 () Bool)

(assert (=> d!150743 (= (array_inv!35302 a!2901) (bvsge (size!46621 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!119894 d!150743))

(declare-fun b!1396245 () Bool)

(declare-fun e!790474 () Bool)

(declare-fun call!66845 () Bool)

(assert (=> b!1396245 (= e!790474 call!66845)))

(declare-fun d!150745 () Bool)

(declare-fun res!935254 () Bool)

(declare-fun e!790475 () Bool)

(assert (=> d!150745 (=> res!935254 e!790475)))

(assert (=> d!150745 (= res!935254 (bvsge #b00000000000000000000000000000000 (size!46621 a!2901)))))

(assert (=> d!150745 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!790475)))

(declare-fun b!1396246 () Bool)

(declare-fun e!790476 () Bool)

(assert (=> b!1396246 (= e!790474 e!790476)))

(declare-fun lt!613160 () (_ BitVec 64))

(assert (=> b!1396246 (= lt!613160 (select (arr!46069 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!613162 () Unit!46671)

(assert (=> b!1396246 (= lt!613162 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!613160 #b00000000000000000000000000000000))))

(assert (=> b!1396246 (arrayContainsKey!0 a!2901 lt!613160 #b00000000000000000000000000000000)))

(declare-fun lt!613161 () Unit!46671)

(assert (=> b!1396246 (= lt!613161 lt!613162)))

(declare-fun res!935253 () Bool)

(assert (=> b!1396246 (= res!935253 (= (seekEntryOrOpen!0 (select (arr!46069 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10412 #b00000000000000000000000000000000)))))

(assert (=> b!1396246 (=> (not res!935253) (not e!790476))))

(declare-fun b!1396247 () Bool)

(assert (=> b!1396247 (= e!790476 call!66845)))

(declare-fun bm!66842 () Bool)

(assert (=> bm!66842 (= call!66845 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1396248 () Bool)

(assert (=> b!1396248 (= e!790475 e!790474)))

(declare-fun c!129955 () Bool)

(assert (=> b!1396248 (= c!129955 (validKeyInArray!0 (select (arr!46069 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!150745 (not res!935254)) b!1396248))

(assert (= (and b!1396248 c!129955) b!1396246))

(assert (= (and b!1396248 (not c!129955)) b!1396245))

(assert (= (and b!1396246 res!935253) b!1396247))

(assert (= (or b!1396247 b!1396245) bm!66842))

(assert (=> b!1396246 m!1282169))

(declare-fun m!1282243 () Bool)

(assert (=> b!1396246 m!1282243))

(declare-fun m!1282245 () Bool)

(assert (=> b!1396246 m!1282245))

(assert (=> b!1396246 m!1282169))

(declare-fun m!1282247 () Bool)

(assert (=> b!1396246 m!1282247))

(declare-fun m!1282249 () Bool)

(assert (=> bm!66842 m!1282249))

(assert (=> b!1396248 m!1282169))

(assert (=> b!1396248 m!1282169))

(assert (=> b!1396248 m!1282171))

(assert (=> b!1395985 d!150745))

(declare-fun d!150747 () Bool)

(assert (=> d!150747 (= (validKeyInArray!0 (select (arr!46069 a!2901) i!1037)) (and (not (= (select (arr!46069 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46069 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1395986 d!150747))

(check-sat (not d!150691) (not b!1396194) (not bm!66834) (not b!1396246) (not d!150723) (not b!1396192) (not bm!66842) (not d!150681) (not b!1396163) (not b!1396212) (not b!1396061) (not b!1396120) (not b!1396164) (not b!1396162) (not d!150715) (not bm!66827) (not b!1396248))
(check-sat)
