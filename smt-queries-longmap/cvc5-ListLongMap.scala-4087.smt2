; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56020 () Bool)

(assert start!56020)

(declare-fun b!616080 () Bool)

(declare-datatypes ((Unit!20038 0))(
  ( (Unit!20039) )
))
(declare-fun e!353243 () Unit!20038)

(declare-fun Unit!20040 () Unit!20038)

(assert (=> b!616080 (= e!353243 Unit!20040)))

(declare-fun b!616081 () Bool)

(declare-fun e!353248 () Bool)

(declare-fun e!353242 () Bool)

(assert (=> b!616081 (= e!353248 e!353242)))

(declare-fun res!396857 () Bool)

(assert (=> b!616081 (=> (not res!396857) (not e!353242))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!37490 0))(
  ( (array!37491 (arr!17991 (Array (_ BitVec 32) (_ BitVec 64))) (size!18355 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37490)

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!616081 (= res!396857 (= (select (store (arr!17991 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!283221 () array!37490)

(assert (=> b!616081 (= lt!283221 (array!37491 (store (arr!17991 a!2986) i!1108 k!1786) (size!18355 a!2986)))))

(declare-fun b!616082 () Bool)

(declare-fun res!396850 () Bool)

(declare-fun e!353246 () Bool)

(assert (=> b!616082 (=> (not res!396850) (not e!353246))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!616082 (= res!396850 (validKeyInArray!0 k!1786))))

(declare-fun b!616084 () Bool)

(declare-fun e!353245 () Unit!20038)

(declare-fun Unit!20041 () Unit!20038)

(assert (=> b!616084 (= e!353245 Unit!20041)))

(assert (=> b!616084 false))

(declare-fun b!616085 () Bool)

(declare-fun res!396849 () Bool)

(assert (=> b!616085 (=> (not res!396849) (not e!353246))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!616085 (= res!396849 (validKeyInArray!0 (select (arr!17991 a!2986) j!136)))))

(declare-fun b!616086 () Bool)

(declare-fun res!396842 () Bool)

(assert (=> b!616086 (=> (not res!396842) (not e!353246))))

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!616086 (= res!396842 (and (= (size!18355 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18355 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18355 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!616087 () Bool)

(declare-fun Unit!20042 () Unit!20038)

(assert (=> b!616087 (= e!353245 Unit!20042)))

(declare-fun b!616088 () Bool)

(declare-fun e!353244 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!37490 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!616088 (= e!353244 (arrayContainsKey!0 lt!283221 (select (arr!17991 a!2986) j!136) index!984))))

(declare-fun b!616089 () Bool)

(declare-fun e!353240 () Bool)

(assert (=> b!616089 (= e!353242 e!353240)))

(declare-fun res!396845 () Bool)

(assert (=> b!616089 (=> (not res!396845) (not e!353240))))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6431 0))(
  ( (MissingZero!6431 (index!28008 (_ BitVec 32))) (Found!6431 (index!28009 (_ BitVec 32))) (Intermediate!6431 (undefined!7243 Bool) (index!28010 (_ BitVec 32)) (x!56807 (_ BitVec 32))) (Undefined!6431) (MissingVacant!6431 (index!28011 (_ BitVec 32))) )
))
(declare-fun lt!283218 () SeekEntryResult!6431)

(assert (=> b!616089 (= res!396845 (and (= lt!283218 (Found!6431 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17991 a!2986) index!984) (select (arr!17991 a!2986) j!136))) (not (= (select (arr!17991 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37490 (_ BitVec 32)) SeekEntryResult!6431)

(assert (=> b!616089 (= lt!283218 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17991 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!616090 () Bool)

(declare-fun res!396856 () Bool)

(assert (=> b!616090 (=> (not res!396856) (not e!353248))))

(declare-datatypes ((List!12032 0))(
  ( (Nil!12029) (Cons!12028 (h!13073 (_ BitVec 64)) (t!18260 List!12032)) )
))
(declare-fun arrayNoDuplicates!0 (array!37490 (_ BitVec 32) List!12032) Bool)

(assert (=> b!616090 (= res!396856 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12029))))

(declare-fun b!616091 () Bool)

(declare-fun res!396843 () Bool)

(assert (=> b!616091 (= res!396843 (bvsge j!136 index!984))))

(declare-fun e!353251 () Bool)

(assert (=> b!616091 (=> res!396843 e!353251)))

(declare-fun e!353250 () Bool)

(assert (=> b!616091 (= e!353250 e!353251)))

(declare-fun b!616092 () Bool)

(declare-fun e!353247 () Unit!20038)

(declare-fun Unit!20043 () Unit!20038)

(assert (=> b!616092 (= e!353247 Unit!20043)))

(declare-fun res!396855 () Bool)

(assert (=> b!616092 (= res!396855 (= (select (store (arr!17991 a!2986) i!1108 k!1786) index!984) (select (arr!17991 a!2986) j!136)))))

(assert (=> b!616092 (=> (not res!396855) (not e!353250))))

(assert (=> b!616092 e!353250))

(declare-fun c!69988 () Bool)

(assert (=> b!616092 (= c!69988 (bvslt j!136 index!984))))

(declare-fun lt!283230 () Unit!20038)

(assert (=> b!616092 (= lt!283230 e!353243)))

(declare-fun c!69986 () Bool)

(assert (=> b!616092 (= c!69986 (bvslt index!984 j!136))))

(declare-fun lt!283231 () Unit!20038)

(declare-fun e!353249 () Unit!20038)

(assert (=> b!616092 (= lt!283231 e!353249)))

(assert (=> b!616092 false))

(declare-fun b!616093 () Bool)

(assert (=> b!616093 (= e!353240 (not true))))

(declare-fun lt!283232 () Unit!20038)

(assert (=> b!616093 (= lt!283232 e!353247)))

(declare-fun c!69989 () Bool)

(declare-fun lt!283228 () SeekEntryResult!6431)

(assert (=> b!616093 (= c!69989 (= lt!283228 (Found!6431 index!984)))))

(declare-fun lt!283225 () Unit!20038)

(assert (=> b!616093 (= lt!283225 e!353245)))

(declare-fun c!69987 () Bool)

(assert (=> b!616093 (= c!69987 (= lt!283228 Undefined!6431))))

(declare-fun lt!283235 () (_ BitVec 64))

(assert (=> b!616093 (= lt!283228 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!283235 lt!283221 mask!3053))))

(declare-fun e!353252 () Bool)

(assert (=> b!616093 e!353252))

(declare-fun res!396846 () Bool)

(assert (=> b!616093 (=> (not res!396846) (not e!353252))))

(declare-fun lt!283233 () SeekEntryResult!6431)

(declare-fun lt!283237 () (_ BitVec 32))

(assert (=> b!616093 (= res!396846 (= lt!283233 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!283237 vacantSpotIndex!68 lt!283235 lt!283221 mask!3053)))))

(assert (=> b!616093 (= lt!283233 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!283237 vacantSpotIndex!68 (select (arr!17991 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!616093 (= lt!283235 (select (store (arr!17991 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!283234 () Unit!20038)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37490 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20038)

(assert (=> b!616093 (= lt!283234 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!283237 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!616093 (= lt!283237 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!616094 () Bool)

(declare-fun Unit!20044 () Unit!20038)

(assert (=> b!616094 (= e!353249 Unit!20044)))

(declare-fun b!616095 () Bool)

(declare-fun res!396853 () Bool)

(assert (=> b!616095 (= res!396853 (arrayContainsKey!0 lt!283221 (select (arr!17991 a!2986) j!136) j!136))))

(declare-fun e!353253 () Bool)

(assert (=> b!616095 (=> (not res!396853) (not e!353253))))

(assert (=> b!616095 (= e!353251 e!353253)))

(declare-fun b!616083 () Bool)

(assert (=> b!616083 (= e!353253 (arrayContainsKey!0 lt!283221 (select (arr!17991 a!2986) j!136) index!984))))

(declare-fun res!396844 () Bool)

(assert (=> start!56020 (=> (not res!396844) (not e!353246))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56020 (= res!396844 (validMask!0 mask!3053))))

(assert (=> start!56020 e!353246))

(assert (=> start!56020 true))

(declare-fun array_inv!13787 (array!37490) Bool)

(assert (=> start!56020 (array_inv!13787 a!2986)))

(declare-fun b!616096 () Bool)

(assert (=> b!616096 false))

(declare-fun lt!283222 () Unit!20038)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37490 (_ BitVec 64) (_ BitVec 32) List!12032) Unit!20038)

(assert (=> b!616096 (= lt!283222 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!283221 (select (arr!17991 a!2986) j!136) index!984 Nil!12029))))

(assert (=> b!616096 (arrayNoDuplicates!0 lt!283221 index!984 Nil!12029)))

(declare-fun lt!283220 () Unit!20038)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37490 (_ BitVec 32) (_ BitVec 32)) Unit!20038)

(assert (=> b!616096 (= lt!283220 (lemmaNoDuplicateFromThenFromBigger!0 lt!283221 #b00000000000000000000000000000000 index!984))))

(assert (=> b!616096 (arrayNoDuplicates!0 lt!283221 #b00000000000000000000000000000000 Nil!12029)))

(declare-fun lt!283219 () Unit!20038)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37490 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12032) Unit!20038)

(assert (=> b!616096 (= lt!283219 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12029))))

(assert (=> b!616096 (arrayContainsKey!0 lt!283221 (select (arr!17991 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!283236 () Unit!20038)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37490 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20038)

(assert (=> b!616096 (= lt!283236 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!283221 (select (arr!17991 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!616096 e!353244))

(declare-fun res!396847 () Bool)

(assert (=> b!616096 (=> (not res!396847) (not e!353244))))

(assert (=> b!616096 (= res!396847 (arrayContainsKey!0 lt!283221 (select (arr!17991 a!2986) j!136) j!136))))

(declare-fun Unit!20045 () Unit!20038)

(assert (=> b!616096 (= e!353249 Unit!20045)))

(declare-fun b!616097 () Bool)

(assert (=> b!616097 (= e!353246 e!353248)))

(declare-fun res!396852 () Bool)

(assert (=> b!616097 (=> (not res!396852) (not e!353248))))

(declare-fun lt!283227 () SeekEntryResult!6431)

(assert (=> b!616097 (= res!396852 (or (= lt!283227 (MissingZero!6431 i!1108)) (= lt!283227 (MissingVacant!6431 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37490 (_ BitVec 32)) SeekEntryResult!6431)

(assert (=> b!616097 (= lt!283227 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!616098 () Bool)

(declare-fun Unit!20046 () Unit!20038)

(assert (=> b!616098 (= e!353247 Unit!20046)))

(declare-fun b!616099 () Bool)

(declare-fun res!396848 () Bool)

(assert (=> b!616099 (=> (not res!396848) (not e!353248))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37490 (_ BitVec 32)) Bool)

(assert (=> b!616099 (= res!396848 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!616100 () Bool)

(assert (=> b!616100 (= e!353252 (= lt!283218 lt!283233))))

(declare-fun b!616101 () Bool)

(assert (=> b!616101 false))

(declare-fun lt!283226 () Unit!20038)

(assert (=> b!616101 (= lt!283226 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!283221 (select (arr!17991 a!2986) j!136) j!136 Nil!12029))))

(assert (=> b!616101 (arrayNoDuplicates!0 lt!283221 j!136 Nil!12029)))

(declare-fun lt!283224 () Unit!20038)

(assert (=> b!616101 (= lt!283224 (lemmaNoDuplicateFromThenFromBigger!0 lt!283221 #b00000000000000000000000000000000 j!136))))

(assert (=> b!616101 (arrayNoDuplicates!0 lt!283221 #b00000000000000000000000000000000 Nil!12029)))

(declare-fun lt!283229 () Unit!20038)

(assert (=> b!616101 (= lt!283229 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12029))))

(assert (=> b!616101 (arrayContainsKey!0 lt!283221 (select (arr!17991 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!283223 () Unit!20038)

(assert (=> b!616101 (= lt!283223 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!283221 (select (arr!17991 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20047 () Unit!20038)

(assert (=> b!616101 (= e!353243 Unit!20047)))

(declare-fun b!616102 () Bool)

(declare-fun res!396851 () Bool)

(assert (=> b!616102 (=> (not res!396851) (not e!353248))))

(assert (=> b!616102 (= res!396851 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17991 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!616103 () Bool)

(declare-fun res!396854 () Bool)

(assert (=> b!616103 (=> (not res!396854) (not e!353246))))

(assert (=> b!616103 (= res!396854 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!56020 res!396844) b!616086))

(assert (= (and b!616086 res!396842) b!616085))

(assert (= (and b!616085 res!396849) b!616082))

(assert (= (and b!616082 res!396850) b!616103))

(assert (= (and b!616103 res!396854) b!616097))

(assert (= (and b!616097 res!396852) b!616099))

(assert (= (and b!616099 res!396848) b!616090))

(assert (= (and b!616090 res!396856) b!616102))

(assert (= (and b!616102 res!396851) b!616081))

(assert (= (and b!616081 res!396857) b!616089))

(assert (= (and b!616089 res!396845) b!616093))

(assert (= (and b!616093 res!396846) b!616100))

(assert (= (and b!616093 c!69987) b!616084))

(assert (= (and b!616093 (not c!69987)) b!616087))

(assert (= (and b!616093 c!69989) b!616092))

(assert (= (and b!616093 (not c!69989)) b!616098))

(assert (= (and b!616092 res!396855) b!616091))

(assert (= (and b!616091 (not res!396843)) b!616095))

(assert (= (and b!616095 res!396853) b!616083))

(assert (= (and b!616092 c!69988) b!616101))

(assert (= (and b!616092 (not c!69988)) b!616080))

(assert (= (and b!616092 c!69986) b!616096))

(assert (= (and b!616092 (not c!69986)) b!616094))

(assert (= (and b!616096 res!396847) b!616088))

(declare-fun m!592265 () Bool)

(assert (=> b!616099 m!592265))

(declare-fun m!592267 () Bool)

(assert (=> b!616088 m!592267))

(assert (=> b!616088 m!592267))

(declare-fun m!592269 () Bool)

(assert (=> b!616088 m!592269))

(declare-fun m!592271 () Bool)

(assert (=> b!616092 m!592271))

(declare-fun m!592273 () Bool)

(assert (=> b!616092 m!592273))

(assert (=> b!616092 m!592267))

(declare-fun m!592275 () Bool)

(assert (=> start!56020 m!592275))

(declare-fun m!592277 () Bool)

(assert (=> start!56020 m!592277))

(declare-fun m!592279 () Bool)

(assert (=> b!616097 m!592279))

(assert (=> b!616083 m!592267))

(assert (=> b!616083 m!592267))

(assert (=> b!616083 m!592269))

(declare-fun m!592281 () Bool)

(assert (=> b!616093 m!592281))

(declare-fun m!592283 () Bool)

(assert (=> b!616093 m!592283))

(assert (=> b!616093 m!592267))

(assert (=> b!616093 m!592271))

(assert (=> b!616093 m!592267))

(declare-fun m!592285 () Bool)

(assert (=> b!616093 m!592285))

(declare-fun m!592287 () Bool)

(assert (=> b!616093 m!592287))

(declare-fun m!592289 () Bool)

(assert (=> b!616093 m!592289))

(declare-fun m!592291 () Bool)

(assert (=> b!616093 m!592291))

(assert (=> b!616095 m!592267))

(assert (=> b!616095 m!592267))

(declare-fun m!592293 () Bool)

(assert (=> b!616095 m!592293))

(assert (=> b!616096 m!592267))

(assert (=> b!616096 m!592293))

(declare-fun m!592295 () Bool)

(assert (=> b!616096 m!592295))

(assert (=> b!616096 m!592267))

(declare-fun m!592297 () Bool)

(assert (=> b!616096 m!592297))

(assert (=> b!616096 m!592267))

(declare-fun m!592299 () Bool)

(assert (=> b!616096 m!592299))

(declare-fun m!592301 () Bool)

(assert (=> b!616096 m!592301))

(declare-fun m!592303 () Bool)

(assert (=> b!616096 m!592303))

(declare-fun m!592305 () Bool)

(assert (=> b!616096 m!592305))

(assert (=> b!616096 m!592267))

(declare-fun m!592307 () Bool)

(assert (=> b!616096 m!592307))

(assert (=> b!616096 m!592267))

(assert (=> b!616101 m!592267))

(declare-fun m!592309 () Bool)

(assert (=> b!616101 m!592309))

(assert (=> b!616101 m!592267))

(declare-fun m!592311 () Bool)

(assert (=> b!616101 m!592311))

(assert (=> b!616101 m!592295))

(declare-fun m!592313 () Bool)

(assert (=> b!616101 m!592313))

(assert (=> b!616101 m!592267))

(declare-fun m!592315 () Bool)

(assert (=> b!616101 m!592315))

(assert (=> b!616101 m!592305))

(assert (=> b!616101 m!592267))

(declare-fun m!592317 () Bool)

(assert (=> b!616101 m!592317))

(declare-fun m!592319 () Bool)

(assert (=> b!616089 m!592319))

(assert (=> b!616089 m!592267))

(assert (=> b!616089 m!592267))

(declare-fun m!592321 () Bool)

(assert (=> b!616089 m!592321))

(assert (=> b!616085 m!592267))

(assert (=> b!616085 m!592267))

(declare-fun m!592323 () Bool)

(assert (=> b!616085 m!592323))

(declare-fun m!592325 () Bool)

(assert (=> b!616082 m!592325))

(declare-fun m!592327 () Bool)

(assert (=> b!616103 m!592327))

(declare-fun m!592329 () Bool)

(assert (=> b!616090 m!592329))

(declare-fun m!592331 () Bool)

(assert (=> b!616102 m!592331))

(assert (=> b!616081 m!592271))

(declare-fun m!592333 () Bool)

(assert (=> b!616081 m!592333))

(push 1)

