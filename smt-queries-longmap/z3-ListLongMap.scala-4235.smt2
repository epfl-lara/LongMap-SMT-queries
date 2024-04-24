; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58488 () Bool)

(assert start!58488)

(declare-fun b!645246 () Bool)

(declare-fun e!369768 () Bool)

(declare-datatypes ((SeekEntryResult!6826 0))(
  ( (MissingZero!6826 (index!29639 (_ BitVec 32))) (Found!6826 (index!29640 (_ BitVec 32))) (Intermediate!6826 (undefined!7638 Bool) (index!29641 (_ BitVec 32)) (x!58566 (_ BitVec 32))) (Undefined!6826) (MissingVacant!6826 (index!29642 (_ BitVec 32))) )
))
(declare-fun lt!299128 () SeekEntryResult!6826)

(declare-fun lt!299117 () SeekEntryResult!6826)

(assert (=> b!645246 (= e!369768 (= lt!299128 lt!299117))))

(declare-fun b!645247 () Bool)

(declare-fun res!417956 () Bool)

(declare-fun e!369757 () Bool)

(assert (=> b!645247 (=> (not res!417956) (not e!369757))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!645247 (= res!417956 (validKeyInArray!0 k0!1786))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun b!645248 () Bool)

(declare-fun e!369764 () Bool)

(declare-datatypes ((array!38442 0))(
  ( (array!38443 (arr!18430 (Array (_ BitVec 32) (_ BitVec 64))) (size!18794 (_ BitVec 32))) )
))
(declare-fun lt!299119 () array!38442)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!38442)

(declare-fun arrayContainsKey!0 (array!38442 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!645248 (= e!369764 (arrayContainsKey!0 lt!299119 (select (arr!18430 a!2986) j!136) index!984))))

(declare-fun b!645249 () Bool)

(declare-datatypes ((Unit!21855 0))(
  ( (Unit!21856) )
))
(declare-fun e!369759 () Unit!21855)

(declare-fun Unit!21857 () Unit!21855)

(assert (=> b!645249 (= e!369759 Unit!21857)))

(declare-fun b!645250 () Bool)

(declare-fun e!369763 () Bool)

(declare-fun e!369767 () Bool)

(assert (=> b!645250 (= e!369763 e!369767)))

(declare-fun res!417955 () Bool)

(assert (=> b!645250 (=> res!417955 e!369767)))

(declare-fun lt!299125 () (_ BitVec 64))

(declare-fun lt!299124 () (_ BitVec 64))

(assert (=> b!645250 (= res!417955 (or (not (= (select (arr!18430 a!2986) j!136) lt!299125)) (not (= (select (arr!18430 a!2986) j!136) lt!299124))))))

(declare-fun e!369755 () Bool)

(assert (=> b!645250 e!369755))

(declare-fun res!417951 () Bool)

(assert (=> b!645250 (=> (not res!417951) (not e!369755))))

(assert (=> b!645250 (= res!417951 (= lt!299124 (select (arr!18430 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!645250 (= lt!299124 (select (store (arr!18430 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!645251 () Bool)

(declare-fun res!417963 () Bool)

(assert (=> b!645251 (=> (not res!417963) (not e!369757))))

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!645251 (= res!417963 (and (= (size!18794 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18794 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18794 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!417950 () Bool)

(assert (=> start!58488 (=> (not res!417950) (not e!369757))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58488 (= res!417950 (validMask!0 mask!3053))))

(assert (=> start!58488 e!369757))

(assert (=> start!58488 true))

(declare-fun array_inv!14289 (array!38442) Bool)

(assert (=> start!58488 (array_inv!14289 a!2986)))

(declare-fun b!645252 () Bool)

(declare-fun Unit!21858 () Unit!21855)

(assert (=> b!645252 (= e!369759 Unit!21858)))

(assert (=> b!645252 false))

(declare-fun b!645253 () Bool)

(declare-fun e!369762 () Unit!21855)

(declare-fun Unit!21859 () Unit!21855)

(assert (=> b!645253 (= e!369762 Unit!21859)))

(declare-fun lt!299122 () Unit!21855)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38442 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21855)

(assert (=> b!645253 (= lt!299122 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299119 (select (arr!18430 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!645253 (arrayContainsKey!0 lt!299119 (select (arr!18430 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!299115 () Unit!21855)

(declare-datatypes ((List!12378 0))(
  ( (Nil!12375) (Cons!12374 (h!13422 (_ BitVec 64)) (t!18598 List!12378)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38442 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12378) Unit!21855)

(assert (=> b!645253 (= lt!299115 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12375))))

(declare-fun arrayNoDuplicates!0 (array!38442 (_ BitVec 32) List!12378) Bool)

(assert (=> b!645253 (arrayNoDuplicates!0 lt!299119 #b00000000000000000000000000000000 Nil!12375)))

(declare-fun lt!299126 () Unit!21855)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38442 (_ BitVec 32) (_ BitVec 32)) Unit!21855)

(assert (=> b!645253 (= lt!299126 (lemmaNoDuplicateFromThenFromBigger!0 lt!299119 #b00000000000000000000000000000000 j!136))))

(assert (=> b!645253 (arrayNoDuplicates!0 lt!299119 j!136 Nil!12375)))

(declare-fun lt!299116 () Unit!21855)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38442 (_ BitVec 64) (_ BitVec 32) List!12378) Unit!21855)

(assert (=> b!645253 (= lt!299116 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!299119 (select (arr!18430 a!2986) j!136) j!136 Nil!12375))))

(assert (=> b!645253 false))

(declare-fun b!645254 () Bool)

(declare-fun e!369758 () Bool)

(assert (=> b!645254 (= e!369767 e!369758)))

(declare-fun res!417966 () Bool)

(assert (=> b!645254 (=> res!417966 e!369758)))

(assert (=> b!645254 (= res!417966 (bvsge index!984 j!136))))

(declare-fun lt!299123 () Unit!21855)

(assert (=> b!645254 (= lt!299123 e!369762)))

(declare-fun c!74018 () Bool)

(assert (=> b!645254 (= c!74018 (bvslt j!136 index!984))))

(declare-fun e!369766 () Bool)

(declare-fun b!645255 () Bool)

(assert (=> b!645255 (= e!369766 (arrayContainsKey!0 lt!299119 (select (arr!18430 a!2986) j!136) index!984))))

(declare-fun b!645256 () Bool)

(declare-fun e!369761 () Bool)

(assert (=> b!645256 (= e!369761 (not e!369763))))

(declare-fun res!417954 () Bool)

(assert (=> b!645256 (=> res!417954 e!369763)))

(declare-fun lt!299121 () SeekEntryResult!6826)

(assert (=> b!645256 (= res!417954 (not (= lt!299121 (Found!6826 index!984))))))

(declare-fun lt!299127 () Unit!21855)

(assert (=> b!645256 (= lt!299127 e!369759)))

(declare-fun c!74017 () Bool)

(assert (=> b!645256 (= c!74017 (= lt!299121 Undefined!6826))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38442 (_ BitVec 32)) SeekEntryResult!6826)

(assert (=> b!645256 (= lt!299121 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!299125 lt!299119 mask!3053))))

(assert (=> b!645256 e!369768))

(declare-fun res!417965 () Bool)

(assert (=> b!645256 (=> (not res!417965) (not e!369768))))

(declare-fun lt!299120 () (_ BitVec 32))

(assert (=> b!645256 (= res!417965 (= lt!299117 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299120 vacantSpotIndex!68 lt!299125 lt!299119 mask!3053)))))

(assert (=> b!645256 (= lt!299117 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299120 vacantSpotIndex!68 (select (arr!18430 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!645256 (= lt!299125 (select (store (arr!18430 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!299118 () Unit!21855)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38442 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21855)

(assert (=> b!645256 (= lt!299118 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!299120 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!645256 (= lt!299120 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!645257 () Bool)

(declare-fun res!417961 () Bool)

(declare-fun e!369756 () Bool)

(assert (=> b!645257 (=> (not res!417961) (not e!369756))))

(assert (=> b!645257 (= res!417961 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18430 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!645258 () Bool)

(declare-fun e!369754 () Bool)

(assert (=> b!645258 (= e!369756 e!369754)))

(declare-fun res!417957 () Bool)

(assert (=> b!645258 (=> (not res!417957) (not e!369754))))

(assert (=> b!645258 (= res!417957 (= (select (store (arr!18430 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!645258 (= lt!299119 (array!38443 (store (arr!18430 a!2986) i!1108 k0!1786) (size!18794 a!2986)))))

(declare-fun b!645259 () Bool)

(assert (=> b!645259 (= e!369754 e!369761)))

(declare-fun res!417949 () Bool)

(assert (=> b!645259 (=> (not res!417949) (not e!369761))))

(assert (=> b!645259 (= res!417949 (and (= lt!299128 (Found!6826 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18430 a!2986) index!984) (select (arr!18430 a!2986) j!136))) (not (= (select (arr!18430 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!645259 (= lt!299128 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18430 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!645260 () Bool)

(declare-fun res!417962 () Bool)

(assert (=> b!645260 (=> (not res!417962) (not e!369757))))

(assert (=> b!645260 (= res!417962 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!645261 () Bool)

(declare-fun e!369765 () Bool)

(assert (=> b!645261 (= e!369765 e!369764)))

(declare-fun res!417967 () Bool)

(assert (=> b!645261 (=> (not res!417967) (not e!369764))))

(assert (=> b!645261 (= res!417967 (arrayContainsKey!0 lt!299119 (select (arr!18430 a!2986) j!136) j!136))))

(declare-fun b!645262 () Bool)

(declare-fun res!417964 () Bool)

(assert (=> b!645262 (=> (not res!417964) (not e!369756))))

(assert (=> b!645262 (= res!417964 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12375))))

(declare-fun b!645263 () Bool)

(declare-fun res!417959 () Bool)

(assert (=> b!645263 (=> (not res!417959) (not e!369757))))

(assert (=> b!645263 (= res!417959 (validKeyInArray!0 (select (arr!18430 a!2986) j!136)))))

(declare-fun b!645264 () Bool)

(assert (=> b!645264 (= e!369757 e!369756)))

(declare-fun res!417953 () Bool)

(assert (=> b!645264 (=> (not res!417953) (not e!369756))))

(declare-fun lt!299114 () SeekEntryResult!6826)

(assert (=> b!645264 (= res!417953 (or (= lt!299114 (MissingZero!6826 i!1108)) (= lt!299114 (MissingVacant!6826 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38442 (_ BitVec 32)) SeekEntryResult!6826)

(assert (=> b!645264 (= lt!299114 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!645265 () Bool)

(declare-fun Unit!21860 () Unit!21855)

(assert (=> b!645265 (= e!369762 Unit!21860)))

(declare-fun b!645266 () Bool)

(declare-fun res!417952 () Bool)

(assert (=> b!645266 (=> (not res!417952) (not e!369756))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38442 (_ BitVec 32)) Bool)

(assert (=> b!645266 (= res!417952 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!645267 () Bool)

(assert (=> b!645267 (= e!369755 e!369765)))

(declare-fun res!417960 () Bool)

(assert (=> b!645267 (=> res!417960 e!369765)))

(assert (=> b!645267 (= res!417960 (or (not (= (select (arr!18430 a!2986) j!136) lt!299125)) (not (= (select (arr!18430 a!2986) j!136) lt!299124)) (bvsge j!136 index!984)))))

(declare-fun b!645268 () Bool)

(assert (=> b!645268 (= e!369758 true)))

(assert (=> b!645268 e!369766))

(declare-fun res!417958 () Bool)

(assert (=> b!645268 (=> (not res!417958) (not e!369766))))

(assert (=> b!645268 (= res!417958 (arrayContainsKey!0 lt!299119 (select (arr!18430 a!2986) j!136) j!136))))

(assert (= (and start!58488 res!417950) b!645251))

(assert (= (and b!645251 res!417963) b!645263))

(assert (= (and b!645263 res!417959) b!645247))

(assert (= (and b!645247 res!417956) b!645260))

(assert (= (and b!645260 res!417962) b!645264))

(assert (= (and b!645264 res!417953) b!645266))

(assert (= (and b!645266 res!417952) b!645262))

(assert (= (and b!645262 res!417964) b!645257))

(assert (= (and b!645257 res!417961) b!645258))

(assert (= (and b!645258 res!417957) b!645259))

(assert (= (and b!645259 res!417949) b!645256))

(assert (= (and b!645256 res!417965) b!645246))

(assert (= (and b!645256 c!74017) b!645252))

(assert (= (and b!645256 (not c!74017)) b!645249))

(assert (= (and b!645256 (not res!417954)) b!645250))

(assert (= (and b!645250 res!417951) b!645267))

(assert (= (and b!645267 (not res!417960)) b!645261))

(assert (= (and b!645261 res!417967) b!645248))

(assert (= (and b!645250 (not res!417955)) b!645254))

(assert (= (and b!645254 c!74018) b!645253))

(assert (= (and b!645254 (not c!74018)) b!645265))

(assert (= (and b!645254 (not res!417966)) b!645268))

(assert (= (and b!645268 res!417958) b!645255))

(declare-fun m!619213 () Bool)

(assert (=> b!645253 m!619213))

(declare-fun m!619215 () Bool)

(assert (=> b!645253 m!619215))

(assert (=> b!645253 m!619213))

(assert (=> b!645253 m!619213))

(declare-fun m!619217 () Bool)

(assert (=> b!645253 m!619217))

(declare-fun m!619219 () Bool)

(assert (=> b!645253 m!619219))

(declare-fun m!619221 () Bool)

(assert (=> b!645253 m!619221))

(assert (=> b!645253 m!619213))

(declare-fun m!619223 () Bool)

(assert (=> b!645253 m!619223))

(declare-fun m!619225 () Bool)

(assert (=> b!645253 m!619225))

(declare-fun m!619227 () Bool)

(assert (=> b!645253 m!619227))

(declare-fun m!619229 () Bool)

(assert (=> start!58488 m!619229))

(declare-fun m!619231 () Bool)

(assert (=> start!58488 m!619231))

(assert (=> b!645267 m!619213))

(declare-fun m!619233 () Bool)

(assert (=> b!645247 m!619233))

(declare-fun m!619235 () Bool)

(assert (=> b!645264 m!619235))

(declare-fun m!619237 () Bool)

(assert (=> b!645262 m!619237))

(declare-fun m!619239 () Bool)

(assert (=> b!645256 m!619239))

(declare-fun m!619241 () Bool)

(assert (=> b!645256 m!619241))

(assert (=> b!645256 m!619213))

(declare-fun m!619243 () Bool)

(assert (=> b!645256 m!619243))

(assert (=> b!645256 m!619213))

(declare-fun m!619245 () Bool)

(assert (=> b!645256 m!619245))

(declare-fun m!619247 () Bool)

(assert (=> b!645256 m!619247))

(declare-fun m!619249 () Bool)

(assert (=> b!645256 m!619249))

(declare-fun m!619251 () Bool)

(assert (=> b!645256 m!619251))

(assert (=> b!645258 m!619247))

(declare-fun m!619253 () Bool)

(assert (=> b!645258 m!619253))

(declare-fun m!619255 () Bool)

(assert (=> b!645259 m!619255))

(assert (=> b!645259 m!619213))

(assert (=> b!645259 m!619213))

(declare-fun m!619257 () Bool)

(assert (=> b!645259 m!619257))

(assert (=> b!645248 m!619213))

(assert (=> b!645248 m!619213))

(declare-fun m!619259 () Bool)

(assert (=> b!645248 m!619259))

(assert (=> b!645268 m!619213))

(assert (=> b!645268 m!619213))

(declare-fun m!619261 () Bool)

(assert (=> b!645268 m!619261))

(assert (=> b!645255 m!619213))

(assert (=> b!645255 m!619213))

(assert (=> b!645255 m!619259))

(assert (=> b!645261 m!619213))

(assert (=> b!645261 m!619213))

(assert (=> b!645261 m!619261))

(declare-fun m!619263 () Bool)

(assert (=> b!645257 m!619263))

(assert (=> b!645250 m!619213))

(assert (=> b!645250 m!619247))

(declare-fun m!619265 () Bool)

(assert (=> b!645250 m!619265))

(declare-fun m!619267 () Bool)

(assert (=> b!645266 m!619267))

(declare-fun m!619269 () Bool)

(assert (=> b!645260 m!619269))

(assert (=> b!645263 m!619213))

(assert (=> b!645263 m!619213))

(declare-fun m!619271 () Bool)

(assert (=> b!645263 m!619271))

(check-sat (not b!645253) (not b!645261) (not b!645255) (not start!58488) (not b!645264) (not b!645256) (not b!645259) (not b!645263) (not b!645247) (not b!645262) (not b!645268) (not b!645248) (not b!645260) (not b!645266))
(check-sat)
