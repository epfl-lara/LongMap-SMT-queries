; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56186 () Bool)

(assert start!56186)

(declare-fun b!622209 () Bool)

(declare-datatypes ((Unit!20868 0))(
  ( (Unit!20869) )
))
(declare-fun e!356885 () Unit!20868)

(declare-fun Unit!20870 () Unit!20868)

(assert (=> b!622209 (= e!356885 Unit!20870)))

(assert (=> b!622209 false))

(declare-fun res!400980 () Bool)

(declare-fun e!356879 () Bool)

(assert (=> start!56186 (=> (not res!400980) (not e!356879))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56186 (= res!400980 (validMask!0 mask!3053))))

(assert (=> start!56186 e!356879))

(assert (=> start!56186 true))

(declare-datatypes ((array!37656 0))(
  ( (array!37657 (arr!18074 (Array (_ BitVec 32) (_ BitVec 64))) (size!18438 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37656)

(declare-fun array_inv!13870 (array!37656) Bool)

(assert (=> start!56186 (array_inv!13870 a!2986)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun b!622210 () Bool)

(declare-fun lt!288203 () array!37656)

(declare-fun e!356890 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!37656 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!622210 (= e!356890 (arrayContainsKey!0 lt!288203 (select (arr!18074 a!2986) j!136) index!984))))

(declare-fun b!622211 () Bool)

(declare-fun e!356887 () Bool)

(declare-datatypes ((SeekEntryResult!6514 0))(
  ( (MissingZero!6514 (index!28340 (_ BitVec 32))) (Found!6514 (index!28341 (_ BitVec 32))) (Intermediate!6514 (undefined!7326 Bool) (index!28342 (_ BitVec 32)) (x!57106 (_ BitVec 32))) (Undefined!6514) (MissingVacant!6514 (index!28343 (_ BitVec 32))) )
))
(declare-fun lt!288200 () SeekEntryResult!6514)

(declare-fun lt!288198 () SeekEntryResult!6514)

(assert (=> b!622211 (= e!356887 (= lt!288200 lt!288198))))

(declare-fun b!622212 () Bool)

(declare-fun e!356888 () Unit!20868)

(declare-fun Unit!20871 () Unit!20868)

(assert (=> b!622212 (= e!356888 Unit!20871)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun res!400987 () Bool)

(assert (=> b!622212 (= res!400987 (= (select (store (arr!18074 a!2986) i!1108 k!1786) index!984) (select (arr!18074 a!2986) j!136)))))

(declare-fun e!356883 () Bool)

(assert (=> b!622212 (=> (not res!400987) (not e!356883))))

(assert (=> b!622212 e!356883))

(declare-fun c!70985 () Bool)

(assert (=> b!622212 (= c!70985 (bvslt j!136 index!984))))

(declare-fun lt!288199 () Unit!20868)

(declare-fun e!356880 () Unit!20868)

(assert (=> b!622212 (= lt!288199 e!356880)))

(declare-fun c!70984 () Bool)

(assert (=> b!622212 (= c!70984 (bvslt index!984 j!136))))

(declare-fun lt!288206 () Unit!20868)

(declare-fun e!356892 () Unit!20868)

(assert (=> b!622212 (= lt!288206 e!356892)))

(assert (=> b!622212 false))

(declare-fun res!400992 () Bool)

(declare-fun b!622213 () Bool)

(assert (=> b!622213 (= res!400992 (arrayContainsKey!0 lt!288203 (select (arr!18074 a!2986) j!136) j!136))))

(declare-fun e!356891 () Bool)

(assert (=> b!622213 (=> (not res!400992) (not e!356891))))

(declare-fun e!356889 () Bool)

(assert (=> b!622213 (= e!356889 e!356891)))

(declare-fun b!622214 () Bool)

(declare-fun Unit!20872 () Unit!20868)

(assert (=> b!622214 (= e!356888 Unit!20872)))

(declare-fun b!622215 () Bool)

(declare-fun Unit!20873 () Unit!20868)

(assert (=> b!622215 (= e!356885 Unit!20873)))

(declare-fun b!622216 () Bool)

(declare-fun res!400994 () Bool)

(assert (=> b!622216 (=> (not res!400994) (not e!356879))))

(assert (=> b!622216 (= res!400994 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!622217 () Bool)

(assert (=> b!622217 (= e!356891 (arrayContainsKey!0 lt!288203 (select (arr!18074 a!2986) j!136) index!984))))

(declare-fun b!622218 () Bool)

(assert (=> b!622218 false))

(declare-fun lt!288207 () Unit!20868)

(declare-datatypes ((List!12115 0))(
  ( (Nil!12112) (Cons!12111 (h!13156 (_ BitVec 64)) (t!18343 List!12115)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37656 (_ BitVec 64) (_ BitVec 32) List!12115) Unit!20868)

(assert (=> b!622218 (= lt!288207 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!288203 (select (arr!18074 a!2986) j!136) index!984 Nil!12112))))

(declare-fun arrayNoDuplicates!0 (array!37656 (_ BitVec 32) List!12115) Bool)

(assert (=> b!622218 (arrayNoDuplicates!0 lt!288203 index!984 Nil!12112)))

(declare-fun lt!288215 () Unit!20868)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37656 (_ BitVec 32) (_ BitVec 32)) Unit!20868)

(assert (=> b!622218 (= lt!288215 (lemmaNoDuplicateFromThenFromBigger!0 lt!288203 #b00000000000000000000000000000000 index!984))))

(assert (=> b!622218 (arrayNoDuplicates!0 lt!288203 #b00000000000000000000000000000000 Nil!12112)))

(declare-fun lt!288202 () Unit!20868)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37656 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12115) Unit!20868)

(assert (=> b!622218 (= lt!288202 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12112))))

(assert (=> b!622218 (arrayContainsKey!0 lt!288203 (select (arr!18074 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!288208 () Unit!20868)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37656 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20868)

(assert (=> b!622218 (= lt!288208 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!288203 (select (arr!18074 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!622218 e!356890))

(declare-fun res!400989 () Bool)

(assert (=> b!622218 (=> (not res!400989) (not e!356890))))

(assert (=> b!622218 (= res!400989 (arrayContainsKey!0 lt!288203 (select (arr!18074 a!2986) j!136) j!136))))

(declare-fun Unit!20874 () Unit!20868)

(assert (=> b!622218 (= e!356892 Unit!20874)))

(declare-fun b!622219 () Bool)

(declare-fun e!356882 () Bool)

(declare-fun e!356886 () Bool)

(assert (=> b!622219 (= e!356882 e!356886)))

(declare-fun res!400984 () Bool)

(assert (=> b!622219 (=> (not res!400984) (not e!356886))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!622219 (= res!400984 (and (= lt!288200 (Found!6514 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18074 a!2986) index!984) (select (arr!18074 a!2986) j!136))) (not (= (select (arr!18074 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37656 (_ BitVec 32)) SeekEntryResult!6514)

(assert (=> b!622219 (= lt!288200 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18074 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!622220 () Bool)

(declare-fun res!400983 () Bool)

(declare-fun e!356881 () Bool)

(assert (=> b!622220 (=> (not res!400983) (not e!356881))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37656 (_ BitVec 32)) Bool)

(assert (=> b!622220 (= res!400983 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun lt!288201 () SeekEntryResult!6514)

(declare-fun b!622221 () Bool)

(assert (=> b!622221 (= e!356886 (not (or (= lt!288201 (MissingVacant!6514 vacantSpotIndex!68)) (bvsge mask!3053 #b00000000000000000000000000000000))))))

(declare-fun lt!288211 () Unit!20868)

(assert (=> b!622221 (= lt!288211 e!356888)))

(declare-fun c!70983 () Bool)

(assert (=> b!622221 (= c!70983 (= lt!288201 (Found!6514 index!984)))))

(declare-fun lt!288209 () Unit!20868)

(assert (=> b!622221 (= lt!288209 e!356885)))

(declare-fun c!70982 () Bool)

(assert (=> b!622221 (= c!70982 (= lt!288201 Undefined!6514))))

(declare-fun lt!288210 () (_ BitVec 64))

(assert (=> b!622221 (= lt!288201 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!288210 lt!288203 mask!3053))))

(assert (=> b!622221 e!356887))

(declare-fun res!400988 () Bool)

(assert (=> b!622221 (=> (not res!400988) (not e!356887))))

(declare-fun lt!288213 () (_ BitVec 32))

(assert (=> b!622221 (= res!400988 (= lt!288198 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!288213 vacantSpotIndex!68 lt!288210 lt!288203 mask!3053)))))

(assert (=> b!622221 (= lt!288198 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!288213 vacantSpotIndex!68 (select (arr!18074 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!622221 (= lt!288210 (select (store (arr!18074 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!288217 () Unit!20868)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37656 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20868)

(assert (=> b!622221 (= lt!288217 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!288213 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!622221 (= lt!288213 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!622222 () Bool)

(assert (=> b!622222 false))

(declare-fun lt!288205 () Unit!20868)

(assert (=> b!622222 (= lt!288205 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!288203 (select (arr!18074 a!2986) j!136) j!136 Nil!12112))))

(assert (=> b!622222 (arrayNoDuplicates!0 lt!288203 j!136 Nil!12112)))

(declare-fun lt!288214 () Unit!20868)

(assert (=> b!622222 (= lt!288214 (lemmaNoDuplicateFromThenFromBigger!0 lt!288203 #b00000000000000000000000000000000 j!136))))

(assert (=> b!622222 (arrayNoDuplicates!0 lt!288203 #b00000000000000000000000000000000 Nil!12112)))

(declare-fun lt!288204 () Unit!20868)

(assert (=> b!622222 (= lt!288204 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12112))))

(assert (=> b!622222 (arrayContainsKey!0 lt!288203 (select (arr!18074 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!288216 () Unit!20868)

(assert (=> b!622222 (= lt!288216 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!288203 (select (arr!18074 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20875 () Unit!20868)

(assert (=> b!622222 (= e!356880 Unit!20875)))

(declare-fun b!622223 () Bool)

(declare-fun res!400993 () Bool)

(assert (=> b!622223 (=> (not res!400993) (not e!356879))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!622223 (= res!400993 (validKeyInArray!0 k!1786))))

(declare-fun b!622224 () Bool)

(declare-fun res!400981 () Bool)

(assert (=> b!622224 (= res!400981 (bvsge j!136 index!984))))

(assert (=> b!622224 (=> res!400981 e!356889)))

(assert (=> b!622224 (= e!356883 e!356889)))

(declare-fun b!622225 () Bool)

(declare-fun res!400982 () Bool)

(assert (=> b!622225 (=> (not res!400982) (not e!356879))))

(assert (=> b!622225 (= res!400982 (validKeyInArray!0 (select (arr!18074 a!2986) j!136)))))

(declare-fun b!622226 () Bool)

(assert (=> b!622226 (= e!356879 e!356881)))

(declare-fun res!400991 () Bool)

(assert (=> b!622226 (=> (not res!400991) (not e!356881))))

(declare-fun lt!288212 () SeekEntryResult!6514)

(assert (=> b!622226 (= res!400991 (or (= lt!288212 (MissingZero!6514 i!1108)) (= lt!288212 (MissingVacant!6514 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37656 (_ BitVec 32)) SeekEntryResult!6514)

(assert (=> b!622226 (= lt!288212 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!622227 () Bool)

(assert (=> b!622227 (= e!356881 e!356882)))

(declare-fun res!400985 () Bool)

(assert (=> b!622227 (=> (not res!400985) (not e!356882))))

(assert (=> b!622227 (= res!400985 (= (select (store (arr!18074 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!622227 (= lt!288203 (array!37657 (store (arr!18074 a!2986) i!1108 k!1786) (size!18438 a!2986)))))

(declare-fun b!622228 () Bool)

(declare-fun Unit!20876 () Unit!20868)

(assert (=> b!622228 (= e!356880 Unit!20876)))

(declare-fun b!622229 () Bool)

(declare-fun res!400990 () Bool)

(assert (=> b!622229 (=> (not res!400990) (not e!356881))))

(assert (=> b!622229 (= res!400990 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12112))))

(declare-fun b!622230 () Bool)

(declare-fun Unit!20877 () Unit!20868)

(assert (=> b!622230 (= e!356892 Unit!20877)))

(declare-fun b!622231 () Bool)

(declare-fun res!400979 () Bool)

(assert (=> b!622231 (=> (not res!400979) (not e!356881))))

(assert (=> b!622231 (= res!400979 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18074 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!622232 () Bool)

(declare-fun res!400986 () Bool)

(assert (=> b!622232 (=> (not res!400986) (not e!356879))))

(assert (=> b!622232 (= res!400986 (and (= (size!18438 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18438 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18438 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!56186 res!400980) b!622232))

(assert (= (and b!622232 res!400986) b!622225))

(assert (= (and b!622225 res!400982) b!622223))

(assert (= (and b!622223 res!400993) b!622216))

(assert (= (and b!622216 res!400994) b!622226))

(assert (= (and b!622226 res!400991) b!622220))

(assert (= (and b!622220 res!400983) b!622229))

(assert (= (and b!622229 res!400990) b!622231))

(assert (= (and b!622231 res!400979) b!622227))

(assert (= (and b!622227 res!400985) b!622219))

(assert (= (and b!622219 res!400984) b!622221))

(assert (= (and b!622221 res!400988) b!622211))

(assert (= (and b!622221 c!70982) b!622209))

(assert (= (and b!622221 (not c!70982)) b!622215))

(assert (= (and b!622221 c!70983) b!622212))

(assert (= (and b!622221 (not c!70983)) b!622214))

(assert (= (and b!622212 res!400987) b!622224))

(assert (= (and b!622224 (not res!400981)) b!622213))

(assert (= (and b!622213 res!400992) b!622217))

(assert (= (and b!622212 c!70985) b!622222))

(assert (= (and b!622212 (not c!70985)) b!622228))

(assert (= (and b!622212 c!70984) b!622218))

(assert (= (and b!622212 (not c!70984)) b!622230))

(assert (= (and b!622218 res!400989) b!622210))

(declare-fun m!598081 () Bool)

(assert (=> start!56186 m!598081))

(declare-fun m!598083 () Bool)

(assert (=> start!56186 m!598083))

(declare-fun m!598085 () Bool)

(assert (=> b!622220 m!598085))

(declare-fun m!598087 () Bool)

(assert (=> b!622216 m!598087))

(declare-fun m!598089 () Bool)

(assert (=> b!622229 m!598089))

(declare-fun m!598091 () Bool)

(assert (=> b!622227 m!598091))

(declare-fun m!598093 () Bool)

(assert (=> b!622227 m!598093))

(declare-fun m!598095 () Bool)

(assert (=> b!622223 m!598095))

(declare-fun m!598097 () Bool)

(assert (=> b!622231 m!598097))

(declare-fun m!598099 () Bool)

(assert (=> b!622226 m!598099))

(declare-fun m!598101 () Bool)

(assert (=> b!622225 m!598101))

(assert (=> b!622225 m!598101))

(declare-fun m!598103 () Bool)

(assert (=> b!622225 m!598103))

(assert (=> b!622222 m!598101))

(assert (=> b!622222 m!598101))

(declare-fun m!598105 () Bool)

(assert (=> b!622222 m!598105))

(declare-fun m!598107 () Bool)

(assert (=> b!622222 m!598107))

(declare-fun m!598109 () Bool)

(assert (=> b!622222 m!598109))

(declare-fun m!598111 () Bool)

(assert (=> b!622222 m!598111))

(assert (=> b!622222 m!598101))

(declare-fun m!598113 () Bool)

(assert (=> b!622222 m!598113))

(assert (=> b!622222 m!598101))

(declare-fun m!598115 () Bool)

(assert (=> b!622222 m!598115))

(declare-fun m!598117 () Bool)

(assert (=> b!622222 m!598117))

(declare-fun m!598119 () Bool)

(assert (=> b!622219 m!598119))

(assert (=> b!622219 m!598101))

(assert (=> b!622219 m!598101))

(declare-fun m!598121 () Bool)

(assert (=> b!622219 m!598121))

(assert (=> b!622217 m!598101))

(assert (=> b!622217 m!598101))

(declare-fun m!598123 () Bool)

(assert (=> b!622217 m!598123))

(assert (=> b!622218 m!598101))

(declare-fun m!598125 () Bool)

(assert (=> b!622218 m!598125))

(assert (=> b!622218 m!598101))

(declare-fun m!598127 () Bool)

(assert (=> b!622218 m!598127))

(declare-fun m!598129 () Bool)

(assert (=> b!622218 m!598129))

(assert (=> b!622218 m!598101))

(assert (=> b!622218 m!598101))

(declare-fun m!598131 () Bool)

(assert (=> b!622218 m!598131))

(assert (=> b!622218 m!598101))

(declare-fun m!598133 () Bool)

(assert (=> b!622218 m!598133))

(assert (=> b!622218 m!598111))

(declare-fun m!598135 () Bool)

(assert (=> b!622218 m!598135))

(assert (=> b!622218 m!598117))

(assert (=> b!622212 m!598091))

(declare-fun m!598137 () Bool)

(assert (=> b!622212 m!598137))

(assert (=> b!622212 m!598101))

(assert (=> b!622210 m!598101))

(assert (=> b!622210 m!598101))

(assert (=> b!622210 m!598123))

(declare-fun m!598139 () Bool)

(assert (=> b!622221 m!598139))

(declare-fun m!598141 () Bool)

(assert (=> b!622221 m!598141))

(assert (=> b!622221 m!598101))

(assert (=> b!622221 m!598091))

(declare-fun m!598143 () Bool)

(assert (=> b!622221 m!598143))

(declare-fun m!598145 () Bool)

(assert (=> b!622221 m!598145))

(declare-fun m!598147 () Bool)

(assert (=> b!622221 m!598147))

(assert (=> b!622221 m!598101))

(declare-fun m!598149 () Bool)

(assert (=> b!622221 m!598149))

(assert (=> b!622213 m!598101))

(assert (=> b!622213 m!598101))

(assert (=> b!622213 m!598133))

(push 1)

