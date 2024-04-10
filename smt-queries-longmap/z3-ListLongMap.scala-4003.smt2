; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54414 () Bool)

(assert start!54414)

(declare-fun b!594017 () Bool)

(declare-fun e!339349 () Bool)

(declare-fun e!339352 () Bool)

(assert (=> b!594017 (= e!339349 e!339352)))

(declare-fun res!380193 () Bool)

(assert (=> b!594017 (=> (not res!380193) (not e!339352))))

(declare-datatypes ((SeekEntryResult!6180 0))(
  ( (MissingZero!6180 (index!26965 (_ BitVec 32))) (Found!6180 (index!26966 (_ BitVec 32))) (Intermediate!6180 (undefined!6992 Bool) (index!26967 (_ BitVec 32)) (x!55767 (_ BitVec 32))) (Undefined!6180) (MissingVacant!6180 (index!26968 (_ BitVec 32))) )
))
(declare-fun lt!269678 () SeekEntryResult!6180)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!594017 (= res!380193 (or (= lt!269678 (MissingZero!6180 i!1108)) (= lt!269678 (MissingVacant!6180 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!36949 0))(
  ( (array!36950 (arr!17740 (Array (_ BitVec 32) (_ BitVec 64))) (size!18104 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36949)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36949 (_ BitVec 32)) SeekEntryResult!6180)

(assert (=> b!594017 (= lt!269678 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!594018 () Bool)

(declare-fun res!380200 () Bool)

(assert (=> b!594018 (=> (not res!380200) (not e!339349))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!594018 (= res!380200 (and (= (size!18104 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18104 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18104 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!594019 () Bool)

(declare-fun e!339347 () Bool)

(declare-fun e!339353 () Bool)

(assert (=> b!594019 (= e!339347 e!339353)))

(declare-fun res!380198 () Bool)

(assert (=> b!594019 (=> (not res!380198) (not e!339353))))

(declare-fun lt!269673 () array!36949)

(declare-fun arrayContainsKey!0 (array!36949 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!594019 (= res!380198 (arrayContainsKey!0 lt!269673 (select (arr!17740 a!2986) j!136) j!136))))

(declare-fun b!594020 () Bool)

(declare-datatypes ((Unit!18638 0))(
  ( (Unit!18639) )
))
(declare-fun e!339348 () Unit!18638)

(declare-fun Unit!18640 () Unit!18638)

(assert (=> b!594020 (= e!339348 Unit!18640)))

(declare-fun b!594021 () Bool)

(declare-fun e!339351 () Bool)

(declare-fun e!339359 () Bool)

(assert (=> b!594021 (= e!339351 e!339359)))

(declare-fun res!380199 () Bool)

(assert (=> b!594021 (=> res!380199 e!339359)))

(declare-fun lt!269683 () (_ BitVec 64))

(declare-fun lt!269682 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!594021 (= res!380199 (or (not (= (select (arr!17740 a!2986) j!136) lt!269683)) (not (= (select (arr!17740 a!2986) j!136) lt!269682)) (bvsge j!136 index!984)))))

(declare-fun e!339357 () Bool)

(assert (=> b!594021 e!339357))

(declare-fun res!380186 () Bool)

(assert (=> b!594021 (=> (not res!380186) (not e!339357))))

(assert (=> b!594021 (= res!380186 (= lt!269682 (select (arr!17740 a!2986) j!136)))))

(assert (=> b!594021 (= lt!269682 (select (store (arr!17740 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!594022 () Bool)

(declare-fun res!380191 () Bool)

(assert (=> b!594022 (=> (not res!380191) (not e!339352))))

(declare-datatypes ((List!11781 0))(
  ( (Nil!11778) (Cons!11777 (h!12822 (_ BitVec 64)) (t!18009 List!11781)) )
))
(declare-fun arrayNoDuplicates!0 (array!36949 (_ BitVec 32) List!11781) Bool)

(assert (=> b!594022 (= res!380191 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11778))))

(declare-fun b!594023 () Bool)

(declare-fun e!339356 () Bool)

(declare-fun e!339355 () Bool)

(assert (=> b!594023 (= e!339356 e!339355)))

(declare-fun res!380189 () Bool)

(assert (=> b!594023 (=> (not res!380189) (not e!339355))))

(declare-fun lt!269677 () SeekEntryResult!6180)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!594023 (= res!380189 (and (= lt!269677 (Found!6180 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17740 a!2986) index!984) (select (arr!17740 a!2986) j!136))) (not (= (select (arr!17740 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36949 (_ BitVec 32)) SeekEntryResult!6180)

(assert (=> b!594023 (= lt!269677 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17740 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!594024 () Bool)

(declare-fun e!339358 () Bool)

(declare-fun lt!269674 () SeekEntryResult!6180)

(assert (=> b!594024 (= e!339358 (= lt!269677 lt!269674))))

(declare-fun b!594025 () Bool)

(declare-fun res!380195 () Bool)

(assert (=> b!594025 (=> (not res!380195) (not e!339349))))

(assert (=> b!594025 (= res!380195 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!380194 () Bool)

(assert (=> start!54414 (=> (not res!380194) (not e!339349))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54414 (= res!380194 (validMask!0 mask!3053))))

(assert (=> start!54414 e!339349))

(assert (=> start!54414 true))

(declare-fun array_inv!13536 (array!36949) Bool)

(assert (=> start!54414 (array_inv!13536 a!2986)))

(declare-fun b!594026 () Bool)

(declare-fun res!380204 () Bool)

(declare-fun e!339354 () Bool)

(assert (=> b!594026 (=> res!380204 e!339354)))

(declare-fun noDuplicate!235 (List!11781) Bool)

(assert (=> b!594026 (= res!380204 (not (noDuplicate!235 Nil!11778)))))

(declare-fun b!594027 () Bool)

(assert (=> b!594027 (= e!339355 (not e!339351))))

(declare-fun res!380196 () Bool)

(assert (=> b!594027 (=> res!380196 e!339351)))

(declare-fun lt!269679 () SeekEntryResult!6180)

(assert (=> b!594027 (= res!380196 (not (= lt!269679 (Found!6180 index!984))))))

(declare-fun lt!269680 () Unit!18638)

(assert (=> b!594027 (= lt!269680 e!339348)))

(declare-fun c!67283 () Bool)

(assert (=> b!594027 (= c!67283 (= lt!269679 Undefined!6180))))

(assert (=> b!594027 (= lt!269679 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!269683 lt!269673 mask!3053))))

(assert (=> b!594027 e!339358))

(declare-fun res!380192 () Bool)

(assert (=> b!594027 (=> (not res!380192) (not e!339358))))

(declare-fun lt!269676 () (_ BitVec 32))

(assert (=> b!594027 (= res!380192 (= lt!269674 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269676 vacantSpotIndex!68 lt!269683 lt!269673 mask!3053)))))

(assert (=> b!594027 (= lt!269674 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269676 vacantSpotIndex!68 (select (arr!17740 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!594027 (= lt!269683 (select (store (arr!17740 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!269675 () Unit!18638)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36949 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18638)

(assert (=> b!594027 (= lt!269675 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!269676 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!594027 (= lt!269676 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!594028 () Bool)

(assert (=> b!594028 (= e!339353 (arrayContainsKey!0 lt!269673 (select (arr!17740 a!2986) j!136) index!984))))

(declare-fun b!594029 () Bool)

(declare-fun e!339360 () Bool)

(assert (=> b!594029 (= e!339354 e!339360)))

(declare-fun res!380201 () Bool)

(assert (=> b!594029 (=> (not res!380201) (not e!339360))))

(declare-fun contains!2916 (List!11781 (_ BitVec 64)) Bool)

(assert (=> b!594029 (= res!380201 (not (contains!2916 Nil!11778 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!594030 () Bool)

(declare-fun res!380203 () Bool)

(assert (=> b!594030 (=> (not res!380203) (not e!339349))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!594030 (= res!380203 (validKeyInArray!0 k0!1786))))

(declare-fun b!594031 () Bool)

(declare-fun res!380190 () Bool)

(assert (=> b!594031 (=> (not res!380190) (not e!339352))))

(assert (=> b!594031 (= res!380190 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17740 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!594032 () Bool)

(assert (=> b!594032 (= e!339359 e!339354)))

(declare-fun res!380187 () Bool)

(assert (=> b!594032 (=> res!380187 e!339354)))

(assert (=> b!594032 (= res!380187 (or (bvsgt #b00000000000000000000000000000000 (size!18104 a!2986)) (bvsge (size!18104 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!594032 (arrayContainsKey!0 lt!269673 (select (arr!17740 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!269681 () Unit!18638)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36949 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18638)

(assert (=> b!594032 (= lt!269681 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!269673 (select (arr!17740 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!594033 () Bool)

(assert (=> b!594033 (= e!339357 e!339347)))

(declare-fun res!380188 () Bool)

(assert (=> b!594033 (=> res!380188 e!339347)))

(assert (=> b!594033 (= res!380188 (or (not (= (select (arr!17740 a!2986) j!136) lt!269683)) (not (= (select (arr!17740 a!2986) j!136) lt!269682)) (bvsge j!136 index!984)))))

(declare-fun b!594034 () Bool)

(declare-fun res!380202 () Bool)

(assert (=> b!594034 (=> (not res!380202) (not e!339352))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36949 (_ BitVec 32)) Bool)

(assert (=> b!594034 (= res!380202 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!594035 () Bool)

(assert (=> b!594035 (= e!339352 e!339356)))

(declare-fun res!380185 () Bool)

(assert (=> b!594035 (=> (not res!380185) (not e!339356))))

(assert (=> b!594035 (= res!380185 (= (select (store (arr!17740 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!594035 (= lt!269673 (array!36950 (store (arr!17740 a!2986) i!1108 k0!1786) (size!18104 a!2986)))))

(declare-fun b!594036 () Bool)

(assert (=> b!594036 (= e!339360 (not (contains!2916 Nil!11778 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!594037 () Bool)

(declare-fun res!380197 () Bool)

(assert (=> b!594037 (=> (not res!380197) (not e!339349))))

(assert (=> b!594037 (= res!380197 (validKeyInArray!0 (select (arr!17740 a!2986) j!136)))))

(declare-fun b!594038 () Bool)

(declare-fun Unit!18641 () Unit!18638)

(assert (=> b!594038 (= e!339348 Unit!18641)))

(assert (=> b!594038 false))

(assert (= (and start!54414 res!380194) b!594018))

(assert (= (and b!594018 res!380200) b!594037))

(assert (= (and b!594037 res!380197) b!594030))

(assert (= (and b!594030 res!380203) b!594025))

(assert (= (and b!594025 res!380195) b!594017))

(assert (= (and b!594017 res!380193) b!594034))

(assert (= (and b!594034 res!380202) b!594022))

(assert (= (and b!594022 res!380191) b!594031))

(assert (= (and b!594031 res!380190) b!594035))

(assert (= (and b!594035 res!380185) b!594023))

(assert (= (and b!594023 res!380189) b!594027))

(assert (= (and b!594027 res!380192) b!594024))

(assert (= (and b!594027 c!67283) b!594038))

(assert (= (and b!594027 (not c!67283)) b!594020))

(assert (= (and b!594027 (not res!380196)) b!594021))

(assert (= (and b!594021 res!380186) b!594033))

(assert (= (and b!594033 (not res!380188)) b!594019))

(assert (= (and b!594019 res!380198) b!594028))

(assert (= (and b!594021 (not res!380199)) b!594032))

(assert (= (and b!594032 (not res!380187)) b!594026))

(assert (= (and b!594026 (not res!380204)) b!594029))

(assert (= (and b!594029 res!380201) b!594036))

(declare-fun m!571885 () Bool)

(assert (=> b!594027 m!571885))

(declare-fun m!571887 () Bool)

(assert (=> b!594027 m!571887))

(declare-fun m!571889 () Bool)

(assert (=> b!594027 m!571889))

(declare-fun m!571891 () Bool)

(assert (=> b!594027 m!571891))

(assert (=> b!594027 m!571889))

(declare-fun m!571893 () Bool)

(assert (=> b!594027 m!571893))

(declare-fun m!571895 () Bool)

(assert (=> b!594027 m!571895))

(declare-fun m!571897 () Bool)

(assert (=> b!594027 m!571897))

(declare-fun m!571899 () Bool)

(assert (=> b!594027 m!571899))

(declare-fun m!571901 () Bool)

(assert (=> b!594023 m!571901))

(assert (=> b!594023 m!571889))

(assert (=> b!594023 m!571889))

(declare-fun m!571903 () Bool)

(assert (=> b!594023 m!571903))

(assert (=> b!594035 m!571891))

(declare-fun m!571905 () Bool)

(assert (=> b!594035 m!571905))

(assert (=> b!594028 m!571889))

(assert (=> b!594028 m!571889))

(declare-fun m!571907 () Bool)

(assert (=> b!594028 m!571907))

(declare-fun m!571909 () Bool)

(assert (=> b!594030 m!571909))

(assert (=> b!594021 m!571889))

(assert (=> b!594021 m!571891))

(declare-fun m!571911 () Bool)

(assert (=> b!594021 m!571911))

(declare-fun m!571913 () Bool)

(assert (=> start!54414 m!571913))

(declare-fun m!571915 () Bool)

(assert (=> start!54414 m!571915))

(declare-fun m!571917 () Bool)

(assert (=> b!594034 m!571917))

(declare-fun m!571919 () Bool)

(assert (=> b!594029 m!571919))

(declare-fun m!571921 () Bool)

(assert (=> b!594031 m!571921))

(declare-fun m!571923 () Bool)

(assert (=> b!594025 m!571923))

(declare-fun m!571925 () Bool)

(assert (=> b!594036 m!571925))

(assert (=> b!594037 m!571889))

(assert (=> b!594037 m!571889))

(declare-fun m!571927 () Bool)

(assert (=> b!594037 m!571927))

(assert (=> b!594019 m!571889))

(assert (=> b!594019 m!571889))

(declare-fun m!571929 () Bool)

(assert (=> b!594019 m!571929))

(declare-fun m!571931 () Bool)

(assert (=> b!594022 m!571931))

(assert (=> b!594033 m!571889))

(declare-fun m!571933 () Bool)

(assert (=> b!594026 m!571933))

(declare-fun m!571935 () Bool)

(assert (=> b!594017 m!571935))

(assert (=> b!594032 m!571889))

(assert (=> b!594032 m!571889))

(declare-fun m!571937 () Bool)

(assert (=> b!594032 m!571937))

(assert (=> b!594032 m!571889))

(declare-fun m!571939 () Bool)

(assert (=> b!594032 m!571939))

(check-sat (not b!594019) (not b!594028) (not b!594029) (not b!594034) (not b!594027) (not b!594026) (not b!594036) (not b!594023) (not b!594030) (not b!594022) (not b!594032) (not b!594037) (not start!54414) (not b!594025) (not b!594017))
(check-sat)
(get-model)

(declare-fun d!86563 () Bool)

(declare-fun res!380269 () Bool)

(declare-fun e!339407 () Bool)

(assert (=> d!86563 (=> res!380269 e!339407)))

(assert (=> d!86563 (= res!380269 (= (select (arr!17740 lt!269673) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17740 a!2986) j!136)))))

(assert (=> d!86563 (= (arrayContainsKey!0 lt!269673 (select (arr!17740 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!339407)))

(declare-fun b!594109 () Bool)

(declare-fun e!339408 () Bool)

(assert (=> b!594109 (= e!339407 e!339408)))

(declare-fun res!380270 () Bool)

(assert (=> b!594109 (=> (not res!380270) (not e!339408))))

(assert (=> b!594109 (= res!380270 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18104 lt!269673)))))

(declare-fun b!594110 () Bool)

(assert (=> b!594110 (= e!339408 (arrayContainsKey!0 lt!269673 (select (arr!17740 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!86563 (not res!380269)) b!594109))

(assert (= (and b!594109 res!380270) b!594110))

(declare-fun m!571997 () Bool)

(assert (=> d!86563 m!571997))

(assert (=> b!594110 m!571889))

(declare-fun m!571999 () Bool)

(assert (=> b!594110 m!571999))

(assert (=> b!594032 d!86563))

(declare-fun d!86565 () Bool)

(assert (=> d!86565 (arrayContainsKey!0 lt!269673 (select (arr!17740 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!269719 () Unit!18638)

(declare-fun choose!114 (array!36949 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18638)

(assert (=> d!86565 (= lt!269719 (choose!114 lt!269673 (select (arr!17740 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!86565 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!86565 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!269673 (select (arr!17740 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!269719)))

(declare-fun bs!18319 () Bool)

(assert (= bs!18319 d!86565))

(assert (=> bs!18319 m!571889))

(assert (=> bs!18319 m!571937))

(assert (=> bs!18319 m!571889))

(declare-fun m!572001 () Bool)

(assert (=> bs!18319 m!572001))

(assert (=> b!594032 d!86565))

(declare-fun d!86567 () Bool)

(assert (=> d!86567 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!594030 d!86567))

(declare-fun d!86569 () Bool)

(declare-fun res!380271 () Bool)

(declare-fun e!339409 () Bool)

(assert (=> d!86569 (=> res!380271 e!339409)))

(assert (=> d!86569 (= res!380271 (= (select (arr!17740 lt!269673) j!136) (select (arr!17740 a!2986) j!136)))))

(assert (=> d!86569 (= (arrayContainsKey!0 lt!269673 (select (arr!17740 a!2986) j!136) j!136) e!339409)))

(declare-fun b!594111 () Bool)

(declare-fun e!339410 () Bool)

(assert (=> b!594111 (= e!339409 e!339410)))

(declare-fun res!380272 () Bool)

(assert (=> b!594111 (=> (not res!380272) (not e!339410))))

(assert (=> b!594111 (= res!380272 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18104 lt!269673)))))

(declare-fun b!594112 () Bool)

(assert (=> b!594112 (= e!339410 (arrayContainsKey!0 lt!269673 (select (arr!17740 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!86569 (not res!380271)) b!594111))

(assert (= (and b!594111 res!380272) b!594112))

(declare-fun m!572003 () Bool)

(assert (=> d!86569 m!572003))

(assert (=> b!594112 m!571889))

(declare-fun m!572005 () Bool)

(assert (=> b!594112 m!572005))

(assert (=> b!594019 d!86569))

(declare-fun d!86571 () Bool)

(declare-fun lt!269722 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!234 (List!11781) (InoxSet (_ BitVec 64)))

(assert (=> d!86571 (= lt!269722 (select (content!234 Nil!11778) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!339416 () Bool)

(assert (=> d!86571 (= lt!269722 e!339416)))

(declare-fun res!380277 () Bool)

(assert (=> d!86571 (=> (not res!380277) (not e!339416))))

(get-info :version)

(assert (=> d!86571 (= res!380277 ((_ is Cons!11777) Nil!11778))))

(assert (=> d!86571 (= (contains!2916 Nil!11778 #b0000000000000000000000000000000000000000000000000000000000000000) lt!269722)))

(declare-fun b!594117 () Bool)

(declare-fun e!339415 () Bool)

(assert (=> b!594117 (= e!339416 e!339415)))

(declare-fun res!380278 () Bool)

(assert (=> b!594117 (=> res!380278 e!339415)))

(assert (=> b!594117 (= res!380278 (= (h!12822 Nil!11778) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!594118 () Bool)

(assert (=> b!594118 (= e!339415 (contains!2916 (t!18009 Nil!11778) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!86571 res!380277) b!594117))

(assert (= (and b!594117 (not res!380278)) b!594118))

(declare-fun m!572007 () Bool)

(assert (=> d!86571 m!572007))

(declare-fun m!572009 () Bool)

(assert (=> d!86571 m!572009))

(declare-fun m!572011 () Bool)

(assert (=> b!594118 m!572011))

(assert (=> b!594029 d!86571))

(declare-fun d!86573 () Bool)

(declare-fun res!380279 () Bool)

(declare-fun e!339417 () Bool)

(assert (=> d!86573 (=> res!380279 e!339417)))

(assert (=> d!86573 (= res!380279 (= (select (arr!17740 lt!269673) index!984) (select (arr!17740 a!2986) j!136)))))

(assert (=> d!86573 (= (arrayContainsKey!0 lt!269673 (select (arr!17740 a!2986) j!136) index!984) e!339417)))

(declare-fun b!594119 () Bool)

(declare-fun e!339418 () Bool)

(assert (=> b!594119 (= e!339417 e!339418)))

(declare-fun res!380280 () Bool)

(assert (=> b!594119 (=> (not res!380280) (not e!339418))))

(assert (=> b!594119 (= res!380280 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18104 lt!269673)))))

(declare-fun b!594120 () Bool)

(assert (=> b!594120 (= e!339418 (arrayContainsKey!0 lt!269673 (select (arr!17740 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!86573 (not res!380279)) b!594119))

(assert (= (and b!594119 res!380280) b!594120))

(declare-fun m!572013 () Bool)

(assert (=> d!86573 m!572013))

(assert (=> b!594120 m!571889))

(declare-fun m!572015 () Bool)

(assert (=> b!594120 m!572015))

(assert (=> b!594028 d!86573))

(declare-fun lt!269729 () SeekEntryResult!6180)

(declare-fun e!339425 () SeekEntryResult!6180)

(declare-fun b!594133 () Bool)

(assert (=> b!594133 (= e!339425 (seekKeyOrZeroReturnVacant!0 (x!55767 lt!269729) (index!26967 lt!269729) (index!26967 lt!269729) k0!1786 a!2986 mask!3053))))

(declare-fun b!594134 () Bool)

(declare-fun e!339426 () SeekEntryResult!6180)

(declare-fun e!339427 () SeekEntryResult!6180)

(assert (=> b!594134 (= e!339426 e!339427)))

(declare-fun lt!269730 () (_ BitVec 64))

(assert (=> b!594134 (= lt!269730 (select (arr!17740 a!2986) (index!26967 lt!269729)))))

(declare-fun c!67294 () Bool)

(assert (=> b!594134 (= c!67294 (= lt!269730 k0!1786))))

(declare-fun b!594135 () Bool)

(assert (=> b!594135 (= e!339426 Undefined!6180)))

(declare-fun b!594136 () Bool)

(assert (=> b!594136 (= e!339425 (MissingZero!6180 (index!26967 lt!269729)))))

(declare-fun b!594138 () Bool)

(declare-fun c!67293 () Bool)

(assert (=> b!594138 (= c!67293 (= lt!269730 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!594138 (= e!339427 e!339425)))

(declare-fun b!594137 () Bool)

(assert (=> b!594137 (= e!339427 (Found!6180 (index!26967 lt!269729)))))

(declare-fun d!86575 () Bool)

(declare-fun lt!269731 () SeekEntryResult!6180)

(assert (=> d!86575 (and (or ((_ is Undefined!6180) lt!269731) (not ((_ is Found!6180) lt!269731)) (and (bvsge (index!26966 lt!269731) #b00000000000000000000000000000000) (bvslt (index!26966 lt!269731) (size!18104 a!2986)))) (or ((_ is Undefined!6180) lt!269731) ((_ is Found!6180) lt!269731) (not ((_ is MissingZero!6180) lt!269731)) (and (bvsge (index!26965 lt!269731) #b00000000000000000000000000000000) (bvslt (index!26965 lt!269731) (size!18104 a!2986)))) (or ((_ is Undefined!6180) lt!269731) ((_ is Found!6180) lt!269731) ((_ is MissingZero!6180) lt!269731) (not ((_ is MissingVacant!6180) lt!269731)) (and (bvsge (index!26968 lt!269731) #b00000000000000000000000000000000) (bvslt (index!26968 lt!269731) (size!18104 a!2986)))) (or ((_ is Undefined!6180) lt!269731) (ite ((_ is Found!6180) lt!269731) (= (select (arr!17740 a!2986) (index!26966 lt!269731)) k0!1786) (ite ((_ is MissingZero!6180) lt!269731) (= (select (arr!17740 a!2986) (index!26965 lt!269731)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6180) lt!269731) (= (select (arr!17740 a!2986) (index!26968 lt!269731)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!86575 (= lt!269731 e!339426)))

(declare-fun c!67295 () Bool)

(assert (=> d!86575 (= c!67295 (and ((_ is Intermediate!6180) lt!269729) (undefined!6992 lt!269729)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36949 (_ BitVec 32)) SeekEntryResult!6180)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86575 (= lt!269729 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!86575 (validMask!0 mask!3053)))

(assert (=> d!86575 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!269731)))

(assert (= (and d!86575 c!67295) b!594135))

(assert (= (and d!86575 (not c!67295)) b!594134))

(assert (= (and b!594134 c!67294) b!594137))

(assert (= (and b!594134 (not c!67294)) b!594138))

(assert (= (and b!594138 c!67293) b!594136))

(assert (= (and b!594138 (not c!67293)) b!594133))

(declare-fun m!572017 () Bool)

(assert (=> b!594133 m!572017))

(declare-fun m!572019 () Bool)

(assert (=> b!594134 m!572019))

(declare-fun m!572021 () Bool)

(assert (=> d!86575 m!572021))

(declare-fun m!572023 () Bool)

(assert (=> d!86575 m!572023))

(declare-fun m!572025 () Bool)

(assert (=> d!86575 m!572025))

(assert (=> d!86575 m!571913))

(declare-fun m!572027 () Bool)

(assert (=> d!86575 m!572027))

(assert (=> d!86575 m!572023))

(declare-fun m!572029 () Bool)

(assert (=> d!86575 m!572029))

(assert (=> b!594017 d!86575))

(declare-fun d!86577 () Bool)

(declare-fun e!339430 () Bool)

(assert (=> d!86577 e!339430))

(declare-fun res!380283 () Bool)

(assert (=> d!86577 (=> (not res!380283) (not e!339430))))

(assert (=> d!86577 (= res!380283 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18104 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18104 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18104 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18104 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18104 a!2986))))))

(declare-fun lt!269734 () Unit!18638)

(declare-fun choose!9 (array!36949 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18638)

(assert (=> d!86577 (= lt!269734 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!269676 vacantSpotIndex!68 mask!3053))))

(assert (=> d!86577 (validMask!0 mask!3053)))

(assert (=> d!86577 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!269676 vacantSpotIndex!68 mask!3053) lt!269734)))

(declare-fun b!594141 () Bool)

(assert (=> b!594141 (= e!339430 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269676 vacantSpotIndex!68 (select (arr!17740 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269676 vacantSpotIndex!68 (select (store (arr!17740 a!2986) i!1108 k0!1786) j!136) (array!36950 (store (arr!17740 a!2986) i!1108 k0!1786) (size!18104 a!2986)) mask!3053)))))

(assert (= (and d!86577 res!380283) b!594141))

(declare-fun m!572031 () Bool)

(assert (=> d!86577 m!572031))

(assert (=> d!86577 m!571913))

(assert (=> b!594141 m!571887))

(assert (=> b!594141 m!571887))

(declare-fun m!572033 () Bool)

(assert (=> b!594141 m!572033))

(assert (=> b!594141 m!571889))

(assert (=> b!594141 m!571891))

(assert (=> b!594141 m!571889))

(assert (=> b!594141 m!571893))

(assert (=> b!594027 d!86577))

(declare-fun b!594190 () Bool)

(declare-fun e!339473 () SeekEntryResult!6180)

(assert (=> b!594190 (= e!339473 (Found!6180 lt!269676))))

(declare-fun b!594191 () Bool)

(declare-fun e!339471 () SeekEntryResult!6180)

(assert (=> b!594191 (= e!339471 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!269676 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!17740 a!2986) j!136) a!2986 mask!3053))))

(declare-fun d!86581 () Bool)

(declare-fun lt!269753 () SeekEntryResult!6180)

(assert (=> d!86581 (and (or ((_ is Undefined!6180) lt!269753) (not ((_ is Found!6180) lt!269753)) (and (bvsge (index!26966 lt!269753) #b00000000000000000000000000000000) (bvslt (index!26966 lt!269753) (size!18104 a!2986)))) (or ((_ is Undefined!6180) lt!269753) ((_ is Found!6180) lt!269753) (not ((_ is MissingVacant!6180) lt!269753)) (not (= (index!26968 lt!269753) vacantSpotIndex!68)) (and (bvsge (index!26968 lt!269753) #b00000000000000000000000000000000) (bvslt (index!26968 lt!269753) (size!18104 a!2986)))) (or ((_ is Undefined!6180) lt!269753) (ite ((_ is Found!6180) lt!269753) (= (select (arr!17740 a!2986) (index!26966 lt!269753)) (select (arr!17740 a!2986) j!136)) (and ((_ is MissingVacant!6180) lt!269753) (= (index!26968 lt!269753) vacantSpotIndex!68) (= (select (arr!17740 a!2986) (index!26968 lt!269753)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!339472 () SeekEntryResult!6180)

(assert (=> d!86581 (= lt!269753 e!339472)))

(declare-fun c!67304 () Bool)

(assert (=> d!86581 (= c!67304 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!269754 () (_ BitVec 64))

(assert (=> d!86581 (= lt!269754 (select (arr!17740 a!2986) lt!269676))))

(assert (=> d!86581 (validMask!0 mask!3053)))

(assert (=> d!86581 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269676 vacantSpotIndex!68 (select (arr!17740 a!2986) j!136) a!2986 mask!3053) lt!269753)))

(declare-fun b!594192 () Bool)

(declare-fun c!67306 () Bool)

(assert (=> b!594192 (= c!67306 (= lt!269754 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!594192 (= e!339473 e!339471)))

(declare-fun b!594193 () Bool)

(assert (=> b!594193 (= e!339471 (MissingVacant!6180 vacantSpotIndex!68))))

(declare-fun b!594194 () Bool)

(assert (=> b!594194 (= e!339472 e!339473)))

(declare-fun c!67305 () Bool)

(assert (=> b!594194 (= c!67305 (= lt!269754 (select (arr!17740 a!2986) j!136)))))

(declare-fun b!594195 () Bool)

(assert (=> b!594195 (= e!339472 Undefined!6180)))

(assert (= (and d!86581 c!67304) b!594195))

(assert (= (and d!86581 (not c!67304)) b!594194))

(assert (= (and b!594194 c!67305) b!594190))

(assert (= (and b!594194 (not c!67305)) b!594192))

(assert (= (and b!594192 c!67306) b!594193))

(assert (= (and b!594192 (not c!67306)) b!594191))

(declare-fun m!572063 () Bool)

(assert (=> b!594191 m!572063))

(assert (=> b!594191 m!572063))

(assert (=> b!594191 m!571889))

(declare-fun m!572065 () Bool)

(assert (=> b!594191 m!572065))

(declare-fun m!572067 () Bool)

(assert (=> d!86581 m!572067))

(declare-fun m!572069 () Bool)

(assert (=> d!86581 m!572069))

(declare-fun m!572071 () Bool)

(assert (=> d!86581 m!572071))

(assert (=> d!86581 m!571913))

(assert (=> b!594027 d!86581))

(declare-fun d!86599 () Bool)

(declare-fun lt!269760 () (_ BitVec 32))

(assert (=> d!86599 (and (bvsge lt!269760 #b00000000000000000000000000000000) (bvslt lt!269760 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86599 (= lt!269760 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!86599 (validMask!0 mask!3053)))

(assert (=> d!86599 (= (nextIndex!0 index!984 x!910 mask!3053) lt!269760)))

(declare-fun bs!18320 () Bool)

(assert (= bs!18320 d!86599))

(declare-fun m!572089 () Bool)

(assert (=> bs!18320 m!572089))

(assert (=> bs!18320 m!571913))

(assert (=> b!594027 d!86599))

(declare-fun b!594206 () Bool)

(declare-fun e!339485 () SeekEntryResult!6180)

(assert (=> b!594206 (= e!339485 (Found!6180 lt!269676))))

(declare-fun b!594207 () Bool)

(declare-fun e!339483 () SeekEntryResult!6180)

(assert (=> b!594207 (= e!339483 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!269676 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!269683 lt!269673 mask!3053))))

(declare-fun lt!269761 () SeekEntryResult!6180)

(declare-fun d!86605 () Bool)

(assert (=> d!86605 (and (or ((_ is Undefined!6180) lt!269761) (not ((_ is Found!6180) lt!269761)) (and (bvsge (index!26966 lt!269761) #b00000000000000000000000000000000) (bvslt (index!26966 lt!269761) (size!18104 lt!269673)))) (or ((_ is Undefined!6180) lt!269761) ((_ is Found!6180) lt!269761) (not ((_ is MissingVacant!6180) lt!269761)) (not (= (index!26968 lt!269761) vacantSpotIndex!68)) (and (bvsge (index!26968 lt!269761) #b00000000000000000000000000000000) (bvslt (index!26968 lt!269761) (size!18104 lt!269673)))) (or ((_ is Undefined!6180) lt!269761) (ite ((_ is Found!6180) lt!269761) (= (select (arr!17740 lt!269673) (index!26966 lt!269761)) lt!269683) (and ((_ is MissingVacant!6180) lt!269761) (= (index!26968 lt!269761) vacantSpotIndex!68) (= (select (arr!17740 lt!269673) (index!26968 lt!269761)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!339484 () SeekEntryResult!6180)

(assert (=> d!86605 (= lt!269761 e!339484)))

(declare-fun c!67308 () Bool)

(assert (=> d!86605 (= c!67308 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!269762 () (_ BitVec 64))

(assert (=> d!86605 (= lt!269762 (select (arr!17740 lt!269673) lt!269676))))

(assert (=> d!86605 (validMask!0 mask!3053)))

(assert (=> d!86605 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269676 vacantSpotIndex!68 lt!269683 lt!269673 mask!3053) lt!269761)))

(declare-fun b!594208 () Bool)

(declare-fun c!67310 () Bool)

(assert (=> b!594208 (= c!67310 (= lt!269762 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!594208 (= e!339485 e!339483)))

(declare-fun b!594209 () Bool)

(assert (=> b!594209 (= e!339483 (MissingVacant!6180 vacantSpotIndex!68))))

(declare-fun b!594210 () Bool)

(assert (=> b!594210 (= e!339484 e!339485)))

(declare-fun c!67309 () Bool)

(assert (=> b!594210 (= c!67309 (= lt!269762 lt!269683))))

(declare-fun b!594211 () Bool)

(assert (=> b!594211 (= e!339484 Undefined!6180)))

(assert (= (and d!86605 c!67308) b!594211))

(assert (= (and d!86605 (not c!67308)) b!594210))

(assert (= (and b!594210 c!67309) b!594206))

(assert (= (and b!594210 (not c!67309)) b!594208))

(assert (= (and b!594208 c!67310) b!594209))

(assert (= (and b!594208 (not c!67310)) b!594207))

(assert (=> b!594207 m!572063))

(assert (=> b!594207 m!572063))

(declare-fun m!572091 () Bool)

(assert (=> b!594207 m!572091))

(declare-fun m!572093 () Bool)

(assert (=> d!86605 m!572093))

(declare-fun m!572095 () Bool)

(assert (=> d!86605 m!572095))

(declare-fun m!572099 () Bool)

(assert (=> d!86605 m!572099))

(assert (=> d!86605 m!571913))

(assert (=> b!594027 d!86605))

(declare-fun b!594214 () Bool)

(declare-fun e!339490 () SeekEntryResult!6180)

(assert (=> b!594214 (= e!339490 (Found!6180 index!984))))

(declare-fun b!594215 () Bool)

(declare-fun e!339488 () SeekEntryResult!6180)

(assert (=> b!594215 (= e!339488 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!269683 lt!269673 mask!3053))))

(declare-fun lt!269763 () SeekEntryResult!6180)

(declare-fun d!86607 () Bool)

(assert (=> d!86607 (and (or ((_ is Undefined!6180) lt!269763) (not ((_ is Found!6180) lt!269763)) (and (bvsge (index!26966 lt!269763) #b00000000000000000000000000000000) (bvslt (index!26966 lt!269763) (size!18104 lt!269673)))) (or ((_ is Undefined!6180) lt!269763) ((_ is Found!6180) lt!269763) (not ((_ is MissingVacant!6180) lt!269763)) (not (= (index!26968 lt!269763) vacantSpotIndex!68)) (and (bvsge (index!26968 lt!269763) #b00000000000000000000000000000000) (bvslt (index!26968 lt!269763) (size!18104 lt!269673)))) (or ((_ is Undefined!6180) lt!269763) (ite ((_ is Found!6180) lt!269763) (= (select (arr!17740 lt!269673) (index!26966 lt!269763)) lt!269683) (and ((_ is MissingVacant!6180) lt!269763) (= (index!26968 lt!269763) vacantSpotIndex!68) (= (select (arr!17740 lt!269673) (index!26968 lt!269763)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!339489 () SeekEntryResult!6180)

(assert (=> d!86607 (= lt!269763 e!339489)))

(declare-fun c!67311 () Bool)

(assert (=> d!86607 (= c!67311 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!269764 () (_ BitVec 64))

(assert (=> d!86607 (= lt!269764 (select (arr!17740 lt!269673) index!984))))

(assert (=> d!86607 (validMask!0 mask!3053)))

(assert (=> d!86607 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!269683 lt!269673 mask!3053) lt!269763)))

(declare-fun b!594216 () Bool)

(declare-fun c!67313 () Bool)

(assert (=> b!594216 (= c!67313 (= lt!269764 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!594216 (= e!339490 e!339488)))

(declare-fun b!594217 () Bool)

(assert (=> b!594217 (= e!339488 (MissingVacant!6180 vacantSpotIndex!68))))

(declare-fun b!594218 () Bool)

(assert (=> b!594218 (= e!339489 e!339490)))

(declare-fun c!67312 () Bool)

(assert (=> b!594218 (= c!67312 (= lt!269764 lt!269683))))

(declare-fun b!594219 () Bool)

(assert (=> b!594219 (= e!339489 Undefined!6180)))

(assert (= (and d!86607 c!67311) b!594219))

(assert (= (and d!86607 (not c!67311)) b!594218))

(assert (= (and b!594218 c!67312) b!594214))

(assert (= (and b!594218 (not c!67312)) b!594216))

(assert (= (and b!594216 c!67313) b!594217))

(assert (= (and b!594216 (not c!67313)) b!594215))

(assert (=> b!594215 m!571885))

(assert (=> b!594215 m!571885))

(declare-fun m!572103 () Bool)

(assert (=> b!594215 m!572103))

(declare-fun m!572105 () Bool)

(assert (=> d!86607 m!572105))

(declare-fun m!572107 () Bool)

(assert (=> d!86607 m!572107))

(assert (=> d!86607 m!572013))

(assert (=> d!86607 m!571913))

(assert (=> b!594027 d!86607))

(declare-fun d!86611 () Bool)

(declare-fun res!380330 () Bool)

(declare-fun e!339495 () Bool)

(assert (=> d!86611 (=> res!380330 e!339495)))

(assert (=> d!86611 (= res!380330 ((_ is Nil!11778) Nil!11778))))

(assert (=> d!86611 (= (noDuplicate!235 Nil!11778) e!339495)))

(declare-fun b!594224 () Bool)

(declare-fun e!339496 () Bool)

(assert (=> b!594224 (= e!339495 e!339496)))

(declare-fun res!380331 () Bool)

(assert (=> b!594224 (=> (not res!380331) (not e!339496))))

(assert (=> b!594224 (= res!380331 (not (contains!2916 (t!18009 Nil!11778) (h!12822 Nil!11778))))))

(declare-fun b!594225 () Bool)

(assert (=> b!594225 (= e!339496 (noDuplicate!235 (t!18009 Nil!11778)))))

(assert (= (and d!86611 (not res!380330)) b!594224))

(assert (= (and b!594224 res!380331) b!594225))

(declare-fun m!572111 () Bool)

(assert (=> b!594224 m!572111))

(declare-fun m!572113 () Bool)

(assert (=> b!594225 m!572113))

(assert (=> b!594026 d!86611))

(declare-fun d!86615 () Bool)

(assert (=> d!86615 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!54414 d!86615))

(declare-fun d!86623 () Bool)

(assert (=> d!86623 (= (array_inv!13536 a!2986) (bvsge (size!18104 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!54414 d!86623))

(declare-fun d!86625 () Bool)

(assert (=> d!86625 (= (validKeyInArray!0 (select (arr!17740 a!2986) j!136)) (and (not (= (select (arr!17740 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17740 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!594037 d!86625))

(declare-fun d!86627 () Bool)

(declare-fun lt!269777 () Bool)

(assert (=> d!86627 (= lt!269777 (select (content!234 Nil!11778) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!339507 () Bool)

(assert (=> d!86627 (= lt!269777 e!339507)))

(declare-fun res!380338 () Bool)

(assert (=> d!86627 (=> (not res!380338) (not e!339507))))

(assert (=> d!86627 (= res!380338 ((_ is Cons!11777) Nil!11778))))

(assert (=> d!86627 (= (contains!2916 Nil!11778 #b1000000000000000000000000000000000000000000000000000000000000000) lt!269777)))

(declare-fun b!594238 () Bool)

(declare-fun e!339506 () Bool)

(assert (=> b!594238 (= e!339507 e!339506)))

(declare-fun res!380339 () Bool)

(assert (=> b!594238 (=> res!380339 e!339506)))

(assert (=> b!594238 (= res!380339 (= (h!12822 Nil!11778) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!594239 () Bool)

(assert (=> b!594239 (= e!339506 (contains!2916 (t!18009 Nil!11778) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!86627 res!380338) b!594238))

(assert (= (and b!594238 (not res!380339)) b!594239))

(assert (=> d!86627 m!572007))

(declare-fun m!572125 () Bool)

(assert (=> d!86627 m!572125))

(declare-fun m!572127 () Bool)

(assert (=> b!594239 m!572127))

(assert (=> b!594036 d!86627))

(declare-fun d!86629 () Bool)

(declare-fun res!380340 () Bool)

(declare-fun e!339508 () Bool)

(assert (=> d!86629 (=> res!380340 e!339508)))

(assert (=> d!86629 (= res!380340 (= (select (arr!17740 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!86629 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!339508)))

(declare-fun b!594240 () Bool)

(declare-fun e!339509 () Bool)

(assert (=> b!594240 (= e!339508 e!339509)))

(declare-fun res!380341 () Bool)

(assert (=> b!594240 (=> (not res!380341) (not e!339509))))

(assert (=> b!594240 (= res!380341 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18104 a!2986)))))

(declare-fun b!594241 () Bool)

(assert (=> b!594241 (= e!339509 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!86629 (not res!380340)) b!594240))

(assert (= (and b!594240 res!380341) b!594241))

(declare-fun m!572129 () Bool)

(assert (=> d!86629 m!572129))

(declare-fun m!572131 () Bool)

(assert (=> b!594241 m!572131))

(assert (=> b!594025 d!86629))

(declare-fun b!594262 () Bool)

(declare-fun e!339523 () Bool)

(declare-fun e!339522 () Bool)

(assert (=> b!594262 (= e!339523 e!339522)))

(declare-fun c!67325 () Bool)

(assert (=> b!594262 (= c!67325 (validKeyInArray!0 (select (arr!17740 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!594263 () Bool)

(declare-fun e!339524 () Bool)

(declare-fun call!32894 () Bool)

(assert (=> b!594263 (= e!339524 call!32894)))

(declare-fun b!594264 () Bool)

(assert (=> b!594264 (= e!339522 call!32894)))

(declare-fun d!86631 () Bool)

(declare-fun res!380347 () Bool)

(assert (=> d!86631 (=> res!380347 e!339523)))

(assert (=> d!86631 (= res!380347 (bvsge #b00000000000000000000000000000000 (size!18104 a!2986)))))

(assert (=> d!86631 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!339523)))

(declare-fun b!594265 () Bool)

(assert (=> b!594265 (= e!339522 e!339524)))

(declare-fun lt!269789 () (_ BitVec 64))

(assert (=> b!594265 (= lt!269789 (select (arr!17740 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!269788 () Unit!18638)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!36949 (_ BitVec 64) (_ BitVec 32)) Unit!18638)

(assert (=> b!594265 (= lt!269788 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!269789 #b00000000000000000000000000000000))))

(assert (=> b!594265 (arrayContainsKey!0 a!2986 lt!269789 #b00000000000000000000000000000000)))

(declare-fun lt!269790 () Unit!18638)

(assert (=> b!594265 (= lt!269790 lt!269788)))

(declare-fun res!380346 () Bool)

(assert (=> b!594265 (= res!380346 (= (seekEntryOrOpen!0 (select (arr!17740 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6180 #b00000000000000000000000000000000)))))

(assert (=> b!594265 (=> (not res!380346) (not e!339524))))

(declare-fun bm!32891 () Bool)

(assert (=> bm!32891 (= call!32894 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(assert (= (and d!86631 (not res!380347)) b!594262))

(assert (= (and b!594262 c!67325) b!594265))

(assert (= (and b!594262 (not c!67325)) b!594264))

(assert (= (and b!594265 res!380346) b!594263))

(assert (= (or b!594263 b!594264) bm!32891))

(assert (=> b!594262 m!572129))

(assert (=> b!594262 m!572129))

(declare-fun m!572133 () Bool)

(assert (=> b!594262 m!572133))

(assert (=> b!594265 m!572129))

(declare-fun m!572135 () Bool)

(assert (=> b!594265 m!572135))

(declare-fun m!572137 () Bool)

(assert (=> b!594265 m!572137))

(assert (=> b!594265 m!572129))

(declare-fun m!572139 () Bool)

(assert (=> b!594265 m!572139))

(declare-fun m!572141 () Bool)

(assert (=> bm!32891 m!572141))

(assert (=> b!594034 d!86631))

(declare-fun b!594266 () Bool)

(declare-fun e!339527 () SeekEntryResult!6180)

(assert (=> b!594266 (= e!339527 (Found!6180 index!984))))

(declare-fun b!594267 () Bool)

(declare-fun e!339525 () SeekEntryResult!6180)

(assert (=> b!594267 (= e!339525 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!17740 a!2986) j!136) a!2986 mask!3053))))

(declare-fun lt!269791 () SeekEntryResult!6180)

(declare-fun d!86633 () Bool)

(assert (=> d!86633 (and (or ((_ is Undefined!6180) lt!269791) (not ((_ is Found!6180) lt!269791)) (and (bvsge (index!26966 lt!269791) #b00000000000000000000000000000000) (bvslt (index!26966 lt!269791) (size!18104 a!2986)))) (or ((_ is Undefined!6180) lt!269791) ((_ is Found!6180) lt!269791) (not ((_ is MissingVacant!6180) lt!269791)) (not (= (index!26968 lt!269791) vacantSpotIndex!68)) (and (bvsge (index!26968 lt!269791) #b00000000000000000000000000000000) (bvslt (index!26968 lt!269791) (size!18104 a!2986)))) (or ((_ is Undefined!6180) lt!269791) (ite ((_ is Found!6180) lt!269791) (= (select (arr!17740 a!2986) (index!26966 lt!269791)) (select (arr!17740 a!2986) j!136)) (and ((_ is MissingVacant!6180) lt!269791) (= (index!26968 lt!269791) vacantSpotIndex!68) (= (select (arr!17740 a!2986) (index!26968 lt!269791)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!339526 () SeekEntryResult!6180)

(assert (=> d!86633 (= lt!269791 e!339526)))

(declare-fun c!67326 () Bool)

(assert (=> d!86633 (= c!67326 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!269792 () (_ BitVec 64))

(assert (=> d!86633 (= lt!269792 (select (arr!17740 a!2986) index!984))))

(assert (=> d!86633 (validMask!0 mask!3053)))

(assert (=> d!86633 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17740 a!2986) j!136) a!2986 mask!3053) lt!269791)))

(declare-fun b!594268 () Bool)

(declare-fun c!67328 () Bool)

(assert (=> b!594268 (= c!67328 (= lt!269792 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!594268 (= e!339527 e!339525)))

(declare-fun b!594269 () Bool)

(assert (=> b!594269 (= e!339525 (MissingVacant!6180 vacantSpotIndex!68))))

(declare-fun b!594270 () Bool)

(assert (=> b!594270 (= e!339526 e!339527)))

(declare-fun c!67327 () Bool)

(assert (=> b!594270 (= c!67327 (= lt!269792 (select (arr!17740 a!2986) j!136)))))

(declare-fun b!594271 () Bool)

(assert (=> b!594271 (= e!339526 Undefined!6180)))

(assert (= (and d!86633 c!67326) b!594271))

(assert (= (and d!86633 (not c!67326)) b!594270))

(assert (= (and b!594270 c!67327) b!594266))

(assert (= (and b!594270 (not c!67327)) b!594268))

(assert (= (and b!594268 c!67328) b!594269))

(assert (= (and b!594268 (not c!67328)) b!594267))

(assert (=> b!594267 m!571885))

(assert (=> b!594267 m!571885))

(assert (=> b!594267 m!571889))

(declare-fun m!572143 () Bool)

(assert (=> b!594267 m!572143))

(declare-fun m!572145 () Bool)

(assert (=> d!86633 m!572145))

(declare-fun m!572147 () Bool)

(assert (=> d!86633 m!572147))

(assert (=> d!86633 m!571901))

(assert (=> d!86633 m!571913))

(assert (=> b!594023 d!86633))

(declare-fun b!594304 () Bool)

(declare-fun e!339554 () Bool)

(assert (=> b!594304 (= e!339554 (contains!2916 Nil!11778 (select (arr!17740 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!594305 () Bool)

(declare-fun e!339552 () Bool)

(declare-fun call!32897 () Bool)

(assert (=> b!594305 (= e!339552 call!32897)))

(declare-fun b!594306 () Bool)

(declare-fun e!339555 () Bool)

(assert (=> b!594306 (= e!339555 e!339552)))

(declare-fun c!67337 () Bool)

(assert (=> b!594306 (= c!67337 (validKeyInArray!0 (select (arr!17740 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!594307 () Bool)

(assert (=> b!594307 (= e!339552 call!32897)))

(declare-fun d!86635 () Bool)

(declare-fun res!380366 () Bool)

(declare-fun e!339553 () Bool)

(assert (=> d!86635 (=> res!380366 e!339553)))

(assert (=> d!86635 (= res!380366 (bvsge #b00000000000000000000000000000000 (size!18104 a!2986)))))

(assert (=> d!86635 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11778) e!339553)))

(declare-fun b!594308 () Bool)

(assert (=> b!594308 (= e!339553 e!339555)))

(declare-fun res!380365 () Bool)

(assert (=> b!594308 (=> (not res!380365) (not e!339555))))

(assert (=> b!594308 (= res!380365 (not e!339554))))

(declare-fun res!380364 () Bool)

(assert (=> b!594308 (=> (not res!380364) (not e!339554))))

(assert (=> b!594308 (= res!380364 (validKeyInArray!0 (select (arr!17740 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!32894 () Bool)

(assert (=> bm!32894 (= call!32897 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!67337 (Cons!11777 (select (arr!17740 a!2986) #b00000000000000000000000000000000) Nil!11778) Nil!11778)))))

(assert (= (and d!86635 (not res!380366)) b!594308))

(assert (= (and b!594308 res!380364) b!594304))

(assert (= (and b!594308 res!380365) b!594306))

(assert (= (and b!594306 c!67337) b!594307))

(assert (= (and b!594306 (not c!67337)) b!594305))

(assert (= (or b!594307 b!594305) bm!32894))

(assert (=> b!594304 m!572129))

(assert (=> b!594304 m!572129))

(declare-fun m!572169 () Bool)

(assert (=> b!594304 m!572169))

(assert (=> b!594306 m!572129))

(assert (=> b!594306 m!572129))

(assert (=> b!594306 m!572133))

(assert (=> b!594308 m!572129))

(assert (=> b!594308 m!572129))

(assert (=> b!594308 m!572133))

(assert (=> bm!32894 m!572129))

(declare-fun m!572177 () Bool)

(assert (=> bm!32894 m!572177))

(assert (=> b!594022 d!86635))

(check-sat (not b!594191) (not b!594308) (not d!86607) (not b!594225) (not b!594110) (not d!86575) (not d!86581) (not b!594120) (not b!594267) (not b!594239) (not d!86633) (not b!594306) (not b!594215) (not b!594141) (not b!594118) (not d!86627) (not d!86571) (not d!86577) (not d!86599) (not b!594262) (not d!86565) (not d!86605) (not b!594133) (not b!594265) (not b!594224) (not b!594112) (not bm!32891) (not b!594207) (not bm!32894) (not b!594241) (not b!594304))
(check-sat)
