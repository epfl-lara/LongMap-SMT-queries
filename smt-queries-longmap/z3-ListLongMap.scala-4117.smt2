; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56250 () Bool)

(assert start!56250)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!357302 () Bool)

(declare-fun b!622922 () Bool)

(declare-datatypes ((array!37665 0))(
  ( (array!37666 (arr!18076 (Array (_ BitVec 32) (_ BitVec 64))) (size!18440 (_ BitVec 32))) )
))
(declare-fun lt!288735 () array!37665)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37665)

(declare-fun arrayContainsKey!0 (array!37665 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!622922 (= e!357302 (arrayContainsKey!0 lt!288735 (select (arr!18076 a!2986) j!136) index!984))))

(declare-fun b!622923 () Bool)

(assert (=> b!622923 false))

(declare-datatypes ((Unit!20917 0))(
  ( (Unit!20918) )
))
(declare-fun lt!288731 () Unit!20917)

(declare-datatypes ((List!12024 0))(
  ( (Nil!12021) (Cons!12020 (h!13068 (_ BitVec 64)) (t!18244 List!12024)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37665 (_ BitVec 64) (_ BitVec 32) List!12024) Unit!20917)

(assert (=> b!622923 (= lt!288731 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!288735 (select (arr!18076 a!2986) j!136) index!984 Nil!12021))))

(declare-fun arrayNoDuplicates!0 (array!37665 (_ BitVec 32) List!12024) Bool)

(assert (=> b!622923 (arrayNoDuplicates!0 lt!288735 index!984 Nil!12021)))

(declare-fun lt!288721 () Unit!20917)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37665 (_ BitVec 32) (_ BitVec 32)) Unit!20917)

(assert (=> b!622923 (= lt!288721 (lemmaNoDuplicateFromThenFromBigger!0 lt!288735 #b00000000000000000000000000000000 index!984))))

(assert (=> b!622923 (arrayNoDuplicates!0 lt!288735 #b00000000000000000000000000000000 Nil!12021)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!288726 () Unit!20917)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37665 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12024) Unit!20917)

(assert (=> b!622923 (= lt!288726 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12021))))

(assert (=> b!622923 (arrayContainsKey!0 lt!288735 (select (arr!18076 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!288728 () Unit!20917)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37665 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20917)

(assert (=> b!622923 (= lt!288728 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!288735 (select (arr!18076 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!357311 () Bool)

(assert (=> b!622923 e!357311))

(declare-fun res!401424 () Bool)

(assert (=> b!622923 (=> (not res!401424) (not e!357311))))

(assert (=> b!622923 (= res!401424 (arrayContainsKey!0 lt!288735 (select (arr!18076 a!2986) j!136) j!136))))

(declare-fun e!357309 () Unit!20917)

(declare-fun Unit!20919 () Unit!20917)

(assert (=> b!622923 (= e!357309 Unit!20919)))

(declare-fun res!401429 () Bool)

(declare-fun b!622924 () Bool)

(assert (=> b!622924 (= res!401429 (arrayContainsKey!0 lt!288735 (select (arr!18076 a!2986) j!136) j!136))))

(assert (=> b!622924 (=> (not res!401429) (not e!357302))))

(declare-fun e!357312 () Bool)

(assert (=> b!622924 (= e!357312 e!357302)))

(declare-fun b!622925 () Bool)

(declare-fun e!357308 () Unit!20917)

(declare-fun Unit!20920 () Unit!20917)

(assert (=> b!622925 (= e!357308 Unit!20920)))

(declare-fun b!622926 () Bool)

(declare-fun res!401423 () Bool)

(assert (=> b!622926 (= res!401423 (bvsge j!136 index!984))))

(assert (=> b!622926 (=> res!401423 e!357312)))

(declare-fun e!357307 () Bool)

(assert (=> b!622926 (= e!357307 e!357312)))

(declare-fun b!622927 () Bool)

(declare-fun res!401422 () Bool)

(declare-fun e!357313 () Bool)

(assert (=> b!622927 (=> (not res!401422) (not e!357313))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!622927 (= res!401422 (validKeyInArray!0 k0!1786))))

(declare-fun b!622928 () Bool)

(declare-fun e!357303 () Bool)

(declare-fun e!357315 () Bool)

(assert (=> b!622928 (= e!357303 e!357315)))

(declare-fun res!401419 () Bool)

(assert (=> b!622928 (=> (not res!401419) (not e!357315))))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6472 0))(
  ( (MissingZero!6472 (index!28172 (_ BitVec 32))) (Found!6472 (index!28173 (_ BitVec 32))) (Intermediate!6472 (undefined!7284 Bool) (index!28174 (_ BitVec 32)) (x!57091 (_ BitVec 32))) (Undefined!6472) (MissingVacant!6472 (index!28175 (_ BitVec 32))) )
))
(declare-fun lt!288736 () SeekEntryResult!6472)

(assert (=> b!622928 (= res!401419 (and (= lt!288736 (Found!6472 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18076 a!2986) index!984) (select (arr!18076 a!2986) j!136))) (not (= (select (arr!18076 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37665 (_ BitVec 32)) SeekEntryResult!6472)

(assert (=> b!622928 (= lt!288736 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18076 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!622929 () Bool)

(assert (=> b!622929 false))

(declare-fun lt!288720 () Unit!20917)

(assert (=> b!622929 (= lt!288720 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!288735 (select (arr!18076 a!2986) j!136) j!136 Nil!12021))))

(assert (=> b!622929 (arrayNoDuplicates!0 lt!288735 j!136 Nil!12021)))

(declare-fun lt!288724 () Unit!20917)

(assert (=> b!622929 (= lt!288724 (lemmaNoDuplicateFromThenFromBigger!0 lt!288735 #b00000000000000000000000000000000 j!136))))

(assert (=> b!622929 (arrayNoDuplicates!0 lt!288735 #b00000000000000000000000000000000 Nil!12021)))

(declare-fun lt!288739 () Unit!20917)

(assert (=> b!622929 (= lt!288739 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12021))))

(assert (=> b!622929 (arrayContainsKey!0 lt!288735 (select (arr!18076 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!288722 () Unit!20917)

(assert (=> b!622929 (= lt!288722 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!288735 (select (arr!18076 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20921 () Unit!20917)

(assert (=> b!622929 (= e!357308 Unit!20921)))

(declare-fun b!622931 () Bool)

(declare-fun e!357306 () Unit!20917)

(declare-fun Unit!20922 () Unit!20917)

(assert (=> b!622931 (= e!357306 Unit!20922)))

(declare-fun b!622932 () Bool)

(assert (=> b!622932 (= e!357315 (not true))))

(declare-fun lt!288730 () Unit!20917)

(assert (=> b!622932 (= lt!288730 e!357306)))

(declare-fun c!71120 () Bool)

(declare-fun lt!288725 () SeekEntryResult!6472)

(assert (=> b!622932 (= c!71120 (= lt!288725 (Found!6472 index!984)))))

(declare-fun lt!288727 () Unit!20917)

(declare-fun e!357310 () Unit!20917)

(assert (=> b!622932 (= lt!288727 e!357310)))

(declare-fun c!71122 () Bool)

(assert (=> b!622932 (= c!71122 (= lt!288725 Undefined!6472))))

(declare-fun lt!288737 () (_ BitVec 64))

(assert (=> b!622932 (= lt!288725 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!288737 lt!288735 mask!3053))))

(declare-fun e!357314 () Bool)

(assert (=> b!622932 e!357314))

(declare-fun res!401432 () Bool)

(assert (=> b!622932 (=> (not res!401432) (not e!357314))))

(declare-fun lt!288729 () SeekEntryResult!6472)

(declare-fun lt!288734 () (_ BitVec 32))

(assert (=> b!622932 (= res!401432 (= lt!288729 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!288734 vacantSpotIndex!68 lt!288737 lt!288735 mask!3053)))))

(assert (=> b!622932 (= lt!288729 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!288734 vacantSpotIndex!68 (select (arr!18076 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!622932 (= lt!288737 (select (store (arr!18076 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!288738 () Unit!20917)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37665 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20917)

(assert (=> b!622932 (= lt!288738 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!288734 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!622932 (= lt!288734 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!622933 () Bool)

(declare-fun Unit!20923 () Unit!20917)

(assert (=> b!622933 (= e!357306 Unit!20923)))

(declare-fun res!401434 () Bool)

(assert (=> b!622933 (= res!401434 (= (select (store (arr!18076 a!2986) i!1108 k0!1786) index!984) (select (arr!18076 a!2986) j!136)))))

(assert (=> b!622933 (=> (not res!401434) (not e!357307))))

(assert (=> b!622933 e!357307))

(declare-fun c!71123 () Bool)

(assert (=> b!622933 (= c!71123 (bvslt j!136 index!984))))

(declare-fun lt!288732 () Unit!20917)

(assert (=> b!622933 (= lt!288732 e!357308)))

(declare-fun c!71121 () Bool)

(assert (=> b!622933 (= c!71121 (bvslt index!984 j!136))))

(declare-fun lt!288723 () Unit!20917)

(assert (=> b!622933 (= lt!288723 e!357309)))

(assert (=> b!622933 false))

(declare-fun b!622934 () Bool)

(declare-fun res!401420 () Bool)

(declare-fun e!357305 () Bool)

(assert (=> b!622934 (=> (not res!401420) (not e!357305))))

(assert (=> b!622934 (= res!401420 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18076 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!622935 () Bool)

(declare-fun Unit!20924 () Unit!20917)

(assert (=> b!622935 (= e!357309 Unit!20924)))

(declare-fun b!622936 () Bool)

(declare-fun res!401426 () Bool)

(assert (=> b!622936 (=> (not res!401426) (not e!357313))))

(assert (=> b!622936 (= res!401426 (validKeyInArray!0 (select (arr!18076 a!2986) j!136)))))

(declare-fun b!622937 () Bool)

(declare-fun res!401421 () Bool)

(assert (=> b!622937 (=> (not res!401421) (not e!357305))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37665 (_ BitVec 32)) Bool)

(assert (=> b!622937 (= res!401421 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!622938 () Bool)

(declare-fun res!401431 () Bool)

(assert (=> b!622938 (=> (not res!401431) (not e!357313))))

(assert (=> b!622938 (= res!401431 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!622939 () Bool)

(declare-fun Unit!20925 () Unit!20917)

(assert (=> b!622939 (= e!357310 Unit!20925)))

(assert (=> b!622939 false))

(declare-fun b!622940 () Bool)

(assert (=> b!622940 (= e!357311 (arrayContainsKey!0 lt!288735 (select (arr!18076 a!2986) j!136) index!984))))

(declare-fun res!401433 () Bool)

(assert (=> start!56250 (=> (not res!401433) (not e!357313))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56250 (= res!401433 (validMask!0 mask!3053))))

(assert (=> start!56250 e!357313))

(assert (=> start!56250 true))

(declare-fun array_inv!13935 (array!37665) Bool)

(assert (=> start!56250 (array_inv!13935 a!2986)))

(declare-fun b!622930 () Bool)

(assert (=> b!622930 (= e!357313 e!357305)))

(declare-fun res!401427 () Bool)

(assert (=> b!622930 (=> (not res!401427) (not e!357305))))

(declare-fun lt!288733 () SeekEntryResult!6472)

(assert (=> b!622930 (= res!401427 (or (= lt!288733 (MissingZero!6472 i!1108)) (= lt!288733 (MissingVacant!6472 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37665 (_ BitVec 32)) SeekEntryResult!6472)

(assert (=> b!622930 (= lt!288733 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!622941 () Bool)

(declare-fun res!401430 () Bool)

(assert (=> b!622941 (=> (not res!401430) (not e!357305))))

(assert (=> b!622941 (= res!401430 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12021))))

(declare-fun b!622942 () Bool)

(assert (=> b!622942 (= e!357314 (= lt!288736 lt!288729))))

(declare-fun b!622943 () Bool)

(declare-fun Unit!20926 () Unit!20917)

(assert (=> b!622943 (= e!357310 Unit!20926)))

(declare-fun b!622944 () Bool)

(assert (=> b!622944 (= e!357305 e!357303)))

(declare-fun res!401425 () Bool)

(assert (=> b!622944 (=> (not res!401425) (not e!357303))))

(assert (=> b!622944 (= res!401425 (= (select (store (arr!18076 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!622944 (= lt!288735 (array!37666 (store (arr!18076 a!2986) i!1108 k0!1786) (size!18440 a!2986)))))

(declare-fun b!622945 () Bool)

(declare-fun res!401428 () Bool)

(assert (=> b!622945 (=> (not res!401428) (not e!357313))))

(assert (=> b!622945 (= res!401428 (and (= (size!18440 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18440 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18440 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!56250 res!401433) b!622945))

(assert (= (and b!622945 res!401428) b!622936))

(assert (= (and b!622936 res!401426) b!622927))

(assert (= (and b!622927 res!401422) b!622938))

(assert (= (and b!622938 res!401431) b!622930))

(assert (= (and b!622930 res!401427) b!622937))

(assert (= (and b!622937 res!401421) b!622941))

(assert (= (and b!622941 res!401430) b!622934))

(assert (= (and b!622934 res!401420) b!622944))

(assert (= (and b!622944 res!401425) b!622928))

(assert (= (and b!622928 res!401419) b!622932))

(assert (= (and b!622932 res!401432) b!622942))

(assert (= (and b!622932 c!71122) b!622939))

(assert (= (and b!622932 (not c!71122)) b!622943))

(assert (= (and b!622932 c!71120) b!622933))

(assert (= (and b!622932 (not c!71120)) b!622931))

(assert (= (and b!622933 res!401434) b!622926))

(assert (= (and b!622926 (not res!401423)) b!622924))

(assert (= (and b!622924 res!401429) b!622922))

(assert (= (and b!622933 c!71123) b!622929))

(assert (= (and b!622933 (not c!71123)) b!622925))

(assert (= (and b!622933 c!71121) b!622923))

(assert (= (and b!622933 (not c!71121)) b!622935))

(assert (= (and b!622923 res!401424) b!622940))

(declare-fun m!599057 () Bool)

(assert (=> b!622924 m!599057))

(assert (=> b!622924 m!599057))

(declare-fun m!599059 () Bool)

(assert (=> b!622924 m!599059))

(declare-fun m!599061 () Bool)

(assert (=> b!622928 m!599061))

(assert (=> b!622928 m!599057))

(assert (=> b!622928 m!599057))

(declare-fun m!599063 () Bool)

(assert (=> b!622928 m!599063))

(declare-fun m!599065 () Bool)

(assert (=> start!56250 m!599065))

(declare-fun m!599067 () Bool)

(assert (=> start!56250 m!599067))

(declare-fun m!599069 () Bool)

(assert (=> b!622934 m!599069))

(declare-fun m!599071 () Bool)

(assert (=> b!622932 m!599071))

(declare-fun m!599073 () Bool)

(assert (=> b!622932 m!599073))

(assert (=> b!622932 m!599057))

(declare-fun m!599075 () Bool)

(assert (=> b!622932 m!599075))

(declare-fun m!599077 () Bool)

(assert (=> b!622932 m!599077))

(declare-fun m!599079 () Bool)

(assert (=> b!622932 m!599079))

(declare-fun m!599081 () Bool)

(assert (=> b!622932 m!599081))

(assert (=> b!622932 m!599057))

(declare-fun m!599083 () Bool)

(assert (=> b!622932 m!599083))

(assert (=> b!622944 m!599075))

(declare-fun m!599085 () Bool)

(assert (=> b!622944 m!599085))

(assert (=> b!622936 m!599057))

(assert (=> b!622936 m!599057))

(declare-fun m!599087 () Bool)

(assert (=> b!622936 m!599087))

(declare-fun m!599089 () Bool)

(assert (=> b!622930 m!599089))

(declare-fun m!599091 () Bool)

(assert (=> b!622929 m!599091))

(assert (=> b!622929 m!599057))

(assert (=> b!622929 m!599057))

(declare-fun m!599093 () Bool)

(assert (=> b!622929 m!599093))

(declare-fun m!599095 () Bool)

(assert (=> b!622929 m!599095))

(assert (=> b!622929 m!599057))

(declare-fun m!599097 () Bool)

(assert (=> b!622929 m!599097))

(declare-fun m!599099 () Bool)

(assert (=> b!622929 m!599099))

(declare-fun m!599101 () Bool)

(assert (=> b!622929 m!599101))

(assert (=> b!622929 m!599057))

(declare-fun m!599103 () Bool)

(assert (=> b!622929 m!599103))

(declare-fun m!599105 () Bool)

(assert (=> b!622927 m!599105))

(assert (=> b!622940 m!599057))

(assert (=> b!622940 m!599057))

(declare-fun m!599107 () Bool)

(assert (=> b!622940 m!599107))

(assert (=> b!622922 m!599057))

(assert (=> b!622922 m!599057))

(assert (=> b!622922 m!599107))

(declare-fun m!599109 () Bool)

(assert (=> b!622938 m!599109))

(declare-fun m!599111 () Bool)

(assert (=> b!622937 m!599111))

(assert (=> b!622923 m!599091))

(assert (=> b!622923 m!599057))

(declare-fun m!599113 () Bool)

(assert (=> b!622923 m!599113))

(assert (=> b!622923 m!599057))

(declare-fun m!599115 () Bool)

(assert (=> b!622923 m!599115))

(assert (=> b!622923 m!599057))

(assert (=> b!622923 m!599059))

(assert (=> b!622923 m!599057))

(declare-fun m!599117 () Bool)

(assert (=> b!622923 m!599117))

(assert (=> b!622923 m!599101))

(assert (=> b!622923 m!599057))

(declare-fun m!599119 () Bool)

(assert (=> b!622923 m!599119))

(declare-fun m!599121 () Bool)

(assert (=> b!622923 m!599121))

(assert (=> b!622933 m!599075))

(declare-fun m!599123 () Bool)

(assert (=> b!622933 m!599123))

(assert (=> b!622933 m!599057))

(declare-fun m!599125 () Bool)

(assert (=> b!622941 m!599125))

(check-sat (not b!622928) (not b!622927) (not b!622930) (not b!622932) (not b!622924) (not b!622936) (not b!622929) (not b!622941) (not b!622937) (not b!622940) (not b!622922) (not start!56250) (not b!622923) (not b!622938))
(check-sat)
