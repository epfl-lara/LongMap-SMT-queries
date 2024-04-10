; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56072 () Bool)

(assert start!56072)

(declare-fun b!618023 () Bool)

(declare-fun e!354407 () Bool)

(assert (=> b!618023 (= e!354407 true)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37542 0))(
  ( (array!37543 (arr!18017 (Array (_ BitVec 32) (_ BitVec 64))) (size!18381 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37542)

(assert (=> b!618023 (= (select (store (arr!18017 a!2986) i!1108 k!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!618024 () Bool)

(declare-fun res!398162 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!618024 (= res!398162 (bvsge j!136 index!984))))

(declare-fun e!354416 () Bool)

(assert (=> b!618024 (=> res!398162 e!354416)))

(declare-fun e!354411 () Bool)

(assert (=> b!618024 (= e!354411 e!354416)))

(declare-fun res!398165 () Bool)

(declare-fun e!354409 () Bool)

(assert (=> start!56072 (=> (not res!398165) (not e!354409))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56072 (= res!398165 (validMask!0 mask!3053))))

(assert (=> start!56072 e!354409))

(assert (=> start!56072 true))

(declare-fun array_inv!13813 (array!37542) Bool)

(assert (=> start!56072 (array_inv!13813 a!2986)))

(declare-fun b!618025 () Bool)

(declare-datatypes ((Unit!20298 0))(
  ( (Unit!20299) )
))
(declare-fun e!354405 () Unit!20298)

(declare-fun Unit!20300 () Unit!20298)

(assert (=> b!618025 (= e!354405 Unit!20300)))

(declare-fun b!618026 () Bool)

(declare-fun e!354413 () Bool)

(assert (=> b!618026 (= e!354409 e!354413)))

(declare-fun res!398173 () Bool)

(assert (=> b!618026 (=> (not res!398173) (not e!354413))))

(declare-datatypes ((SeekEntryResult!6457 0))(
  ( (MissingZero!6457 (index!28112 (_ BitVec 32))) (Found!6457 (index!28113 (_ BitVec 32))) (Intermediate!6457 (undefined!7269 Bool) (index!28114 (_ BitVec 32)) (x!56897 (_ BitVec 32))) (Undefined!6457) (MissingVacant!6457 (index!28115 (_ BitVec 32))) )
))
(declare-fun lt!284795 () SeekEntryResult!6457)

(assert (=> b!618026 (= res!398173 (or (= lt!284795 (MissingZero!6457 i!1108)) (= lt!284795 (MissingVacant!6457 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37542 (_ BitVec 32)) SeekEntryResult!6457)

(assert (=> b!618026 (= lt!284795 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!618027 () Bool)

(assert (=> b!618027 false))

(declare-fun lt!284782 () Unit!20298)

(declare-fun lt!284796 () array!37542)

(declare-datatypes ((List!12058 0))(
  ( (Nil!12055) (Cons!12054 (h!13099 (_ BitVec 64)) (t!18286 List!12058)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37542 (_ BitVec 64) (_ BitVec 32) List!12058) Unit!20298)

(assert (=> b!618027 (= lt!284782 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!284796 (select (arr!18017 a!2986) j!136) j!136 Nil!12055))))

(declare-fun arrayNoDuplicates!0 (array!37542 (_ BitVec 32) List!12058) Bool)

(assert (=> b!618027 (arrayNoDuplicates!0 lt!284796 j!136 Nil!12055)))

(declare-fun lt!284781 () Unit!20298)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37542 (_ BitVec 32) (_ BitVec 32)) Unit!20298)

(assert (=> b!618027 (= lt!284781 (lemmaNoDuplicateFromThenFromBigger!0 lt!284796 #b00000000000000000000000000000000 j!136))))

(assert (=> b!618027 (arrayNoDuplicates!0 lt!284796 #b00000000000000000000000000000000 Nil!12055)))

(declare-fun lt!284783 () Unit!20298)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37542 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12058) Unit!20298)

(assert (=> b!618027 (= lt!284783 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12055))))

(declare-fun arrayContainsKey!0 (array!37542 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!618027 (arrayContainsKey!0 lt!284796 (select (arr!18017 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!284780 () Unit!20298)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37542 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20298)

(assert (=> b!618027 (= lt!284780 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!284796 (select (arr!18017 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20301 () Unit!20298)

(assert (=> b!618027 (= e!354405 Unit!20301)))

(declare-fun b!618028 () Bool)

(assert (=> b!618028 false))

(declare-fun lt!284786 () Unit!20298)

(assert (=> b!618028 (= lt!284786 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!284796 (select (arr!18017 a!2986) j!136) index!984 Nil!12055))))

(assert (=> b!618028 (arrayNoDuplicates!0 lt!284796 index!984 Nil!12055)))

(declare-fun lt!284790 () Unit!20298)

(assert (=> b!618028 (= lt!284790 (lemmaNoDuplicateFromThenFromBigger!0 lt!284796 #b00000000000000000000000000000000 index!984))))

(assert (=> b!618028 (arrayNoDuplicates!0 lt!284796 #b00000000000000000000000000000000 Nil!12055)))

(declare-fun lt!284794 () Unit!20298)

(assert (=> b!618028 (= lt!284794 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12055))))

(assert (=> b!618028 (arrayContainsKey!0 lt!284796 (select (arr!18017 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!284787 () Unit!20298)

(assert (=> b!618028 (= lt!284787 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!284796 (select (arr!18017 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!354415 () Bool)

(assert (=> b!618028 e!354415))

(declare-fun res!398164 () Bool)

(assert (=> b!618028 (=> (not res!398164) (not e!354415))))

(assert (=> b!618028 (= res!398164 (arrayContainsKey!0 lt!284796 (select (arr!18017 a!2986) j!136) j!136))))

(declare-fun e!354417 () Unit!20298)

(declare-fun Unit!20302 () Unit!20298)

(assert (=> b!618028 (= e!354417 Unit!20302)))

(declare-fun b!618029 () Bool)

(declare-fun e!354408 () Unit!20298)

(declare-fun Unit!20303 () Unit!20298)

(assert (=> b!618029 (= e!354408 Unit!20303)))

(declare-fun b!618030 () Bool)

(declare-fun e!354404 () Bool)

(declare-fun lt!284792 () SeekEntryResult!6457)

(declare-fun lt!284785 () SeekEntryResult!6457)

(assert (=> b!618030 (= e!354404 (= lt!284792 lt!284785))))

(declare-fun b!618031 () Bool)

(declare-fun res!398171 () Bool)

(assert (=> b!618031 (=> (not res!398171) (not e!354413))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37542 (_ BitVec 32)) Bool)

(assert (=> b!618031 (= res!398171 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!618032 () Bool)

(declare-fun Unit!20304 () Unit!20298)

(assert (=> b!618032 (= e!354417 Unit!20304)))

(declare-fun b!618033 () Bool)

(declare-fun e!354403 () Bool)

(assert (=> b!618033 (= e!354413 e!354403)))

(declare-fun res!398177 () Bool)

(assert (=> b!618033 (=> (not res!398177) (not e!354403))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!618033 (= res!398177 (= (select (store (arr!18017 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!618033 (= lt!284796 (array!37543 (store (arr!18017 a!2986) i!1108 k!1786) (size!18381 a!2986)))))

(declare-fun b!618034 () Bool)

(declare-fun res!398161 () Bool)

(assert (=> b!618034 (=> (not res!398161) (not e!354409))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!618034 (= res!398161 (validKeyInArray!0 (select (arr!18017 a!2986) j!136)))))

(declare-fun b!618035 () Bool)

(declare-fun res!398168 () Bool)

(assert (=> b!618035 (=> (not res!398168) (not e!354409))))

(assert (=> b!618035 (= res!398168 (validKeyInArray!0 k!1786))))

(declare-fun b!618036 () Bool)

(declare-fun Unit!20305 () Unit!20298)

(assert (=> b!618036 (= e!354408 Unit!20305)))

(assert (=> b!618036 false))

(declare-fun b!618037 () Bool)

(declare-fun res!398167 () Bool)

(assert (=> b!618037 (= res!398167 (arrayContainsKey!0 lt!284796 (select (arr!18017 a!2986) j!136) j!136))))

(declare-fun e!354410 () Bool)

(assert (=> b!618037 (=> (not res!398167) (not e!354410))))

(assert (=> b!618037 (= e!354416 e!354410)))

(declare-fun b!618038 () Bool)

(declare-fun e!354412 () Bool)

(assert (=> b!618038 (= e!354412 (not e!354407))))

(declare-fun res!398175 () Bool)

(assert (=> b!618038 (=> res!398175 e!354407)))

(declare-fun lt!284789 () SeekEntryResult!6457)

(assert (=> b!618038 (= res!398175 (not (= lt!284789 (MissingVacant!6457 vacantSpotIndex!68))))))

(declare-fun lt!284784 () Unit!20298)

(declare-fun e!354406 () Unit!20298)

(assert (=> b!618038 (= lt!284784 e!354406)))

(declare-fun c!70300 () Bool)

(assert (=> b!618038 (= c!70300 (= lt!284789 (Found!6457 index!984)))))

(declare-fun lt!284793 () Unit!20298)

(assert (=> b!618038 (= lt!284793 e!354408)))

(declare-fun c!70299 () Bool)

(assert (=> b!618038 (= c!70299 (= lt!284789 Undefined!6457))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!284791 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37542 (_ BitVec 32)) SeekEntryResult!6457)

(assert (=> b!618038 (= lt!284789 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!284791 lt!284796 mask!3053))))

(assert (=> b!618038 e!354404))

(declare-fun res!398169 () Bool)

(assert (=> b!618038 (=> (not res!398169) (not e!354404))))

(declare-fun lt!284779 () (_ BitVec 32))

(assert (=> b!618038 (= res!398169 (= lt!284785 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!284779 vacantSpotIndex!68 lt!284791 lt!284796 mask!3053)))))

(assert (=> b!618038 (= lt!284785 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!284779 vacantSpotIndex!68 (select (arr!18017 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!618038 (= lt!284791 (select (store (arr!18017 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!284797 () Unit!20298)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37542 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20298)

(assert (=> b!618038 (= lt!284797 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!284779 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!618038 (= lt!284779 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!618039 () Bool)

(declare-fun res!398172 () Bool)

(assert (=> b!618039 (=> (not res!398172) (not e!354413))))

(assert (=> b!618039 (= res!398172 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12055))))

(declare-fun b!618040 () Bool)

(declare-fun Unit!20306 () Unit!20298)

(assert (=> b!618040 (= e!354406 Unit!20306)))

(declare-fun b!618041 () Bool)

(declare-fun res!398163 () Bool)

(assert (=> b!618041 (=> (not res!398163) (not e!354409))))

(assert (=> b!618041 (= res!398163 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!618042 () Bool)

(declare-fun res!398176 () Bool)

(assert (=> b!618042 (=> (not res!398176) (not e!354409))))

(assert (=> b!618042 (= res!398176 (and (= (size!18381 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18381 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18381 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!618043 () Bool)

(assert (=> b!618043 (= e!354410 (arrayContainsKey!0 lt!284796 (select (arr!18017 a!2986) j!136) index!984))))

(declare-fun b!618044 () Bool)

(declare-fun Unit!20307 () Unit!20298)

(assert (=> b!618044 (= e!354406 Unit!20307)))

(declare-fun res!398166 () Bool)

(assert (=> b!618044 (= res!398166 (= (select (store (arr!18017 a!2986) i!1108 k!1786) index!984) (select (arr!18017 a!2986) j!136)))))

(assert (=> b!618044 (=> (not res!398166) (not e!354411))))

(assert (=> b!618044 e!354411))

(declare-fun c!70298 () Bool)

(assert (=> b!618044 (= c!70298 (bvslt j!136 index!984))))

(declare-fun lt!284788 () Unit!20298)

(assert (=> b!618044 (= lt!284788 e!354405)))

(declare-fun c!70301 () Bool)

(assert (=> b!618044 (= c!70301 (bvslt index!984 j!136))))

(declare-fun lt!284778 () Unit!20298)

(assert (=> b!618044 (= lt!284778 e!354417)))

(assert (=> b!618044 false))

(declare-fun b!618045 () Bool)

(assert (=> b!618045 (= e!354403 e!354412)))

(declare-fun res!398174 () Bool)

(assert (=> b!618045 (=> (not res!398174) (not e!354412))))

(assert (=> b!618045 (= res!398174 (and (= lt!284792 (Found!6457 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18017 a!2986) index!984) (select (arr!18017 a!2986) j!136))) (not (= (select (arr!18017 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!618045 (= lt!284792 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18017 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!618046 () Bool)

(declare-fun res!398170 () Bool)

(assert (=> b!618046 (=> (not res!398170) (not e!354413))))

(assert (=> b!618046 (= res!398170 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18017 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!618047 () Bool)

(assert (=> b!618047 (= e!354415 (arrayContainsKey!0 lt!284796 (select (arr!18017 a!2986) j!136) index!984))))

(assert (= (and start!56072 res!398165) b!618042))

(assert (= (and b!618042 res!398176) b!618034))

(assert (= (and b!618034 res!398161) b!618035))

(assert (= (and b!618035 res!398168) b!618041))

(assert (= (and b!618041 res!398163) b!618026))

(assert (= (and b!618026 res!398173) b!618031))

(assert (= (and b!618031 res!398171) b!618039))

(assert (= (and b!618039 res!398172) b!618046))

(assert (= (and b!618046 res!398170) b!618033))

(assert (= (and b!618033 res!398177) b!618045))

(assert (= (and b!618045 res!398174) b!618038))

(assert (= (and b!618038 res!398169) b!618030))

(assert (= (and b!618038 c!70299) b!618036))

(assert (= (and b!618038 (not c!70299)) b!618029))

(assert (= (and b!618038 c!70300) b!618044))

(assert (= (and b!618038 (not c!70300)) b!618040))

(assert (= (and b!618044 res!398166) b!618024))

(assert (= (and b!618024 (not res!398162)) b!618037))

(assert (= (and b!618037 res!398167) b!618043))

(assert (= (and b!618044 c!70298) b!618027))

(assert (= (and b!618044 (not c!70298)) b!618025))

(assert (= (and b!618044 c!70301) b!618028))

(assert (= (and b!618044 (not c!70301)) b!618032))

(assert (= (and b!618028 res!398164) b!618047))

(assert (= (and b!618038 (not res!398175)) b!618023))

(declare-fun m!594091 () Bool)

(assert (=> b!618037 m!594091))

(assert (=> b!618037 m!594091))

(declare-fun m!594093 () Bool)

(assert (=> b!618037 m!594093))

(declare-fun m!594095 () Bool)

(assert (=> b!618039 m!594095))

(assert (=> b!618028 m!594091))

(declare-fun m!594097 () Bool)

(assert (=> b!618028 m!594097))

(declare-fun m!594099 () Bool)

(assert (=> b!618028 m!594099))

(declare-fun m!594101 () Bool)

(assert (=> b!618028 m!594101))

(declare-fun m!594103 () Bool)

(assert (=> b!618028 m!594103))

(assert (=> b!618028 m!594091))

(declare-fun m!594105 () Bool)

(assert (=> b!618028 m!594105))

(assert (=> b!618028 m!594091))

(declare-fun m!594107 () Bool)

(assert (=> b!618028 m!594107))

(declare-fun m!594109 () Bool)

(assert (=> b!618028 m!594109))

(assert (=> b!618028 m!594091))

(assert (=> b!618028 m!594091))

(assert (=> b!618028 m!594093))

(declare-fun m!594111 () Bool)

(assert (=> b!618035 m!594111))

(declare-fun m!594113 () Bool)

(assert (=> b!618038 m!594113))

(declare-fun m!594115 () Bool)

(assert (=> b!618038 m!594115))

(declare-fun m!594117 () Bool)

(assert (=> b!618038 m!594117))

(declare-fun m!594119 () Bool)

(assert (=> b!618038 m!594119))

(declare-fun m!594121 () Bool)

(assert (=> b!618038 m!594121))

(assert (=> b!618038 m!594091))

(declare-fun m!594123 () Bool)

(assert (=> b!618038 m!594123))

(declare-fun m!594125 () Bool)

(assert (=> b!618038 m!594125))

(assert (=> b!618038 m!594091))

(assert (=> b!618033 m!594117))

(declare-fun m!594127 () Bool)

(assert (=> b!618033 m!594127))

(assert (=> b!618043 m!594091))

(assert (=> b!618043 m!594091))

(declare-fun m!594129 () Bool)

(assert (=> b!618043 m!594129))

(declare-fun m!594131 () Bool)

(assert (=> b!618031 m!594131))

(declare-fun m!594133 () Bool)

(assert (=> b!618046 m!594133))

(declare-fun m!594135 () Bool)

(assert (=> b!618026 m!594135))

(declare-fun m!594137 () Bool)

(assert (=> b!618045 m!594137))

(assert (=> b!618045 m!594091))

(assert (=> b!618045 m!594091))

(declare-fun m!594139 () Bool)

(assert (=> b!618045 m!594139))

(assert (=> b!618023 m!594117))

(declare-fun m!594141 () Bool)

(assert (=> b!618023 m!594141))

(declare-fun m!594143 () Bool)

(assert (=> b!618027 m!594143))

(assert (=> b!618027 m!594099))

(assert (=> b!618027 m!594091))

(declare-fun m!594145 () Bool)

(assert (=> b!618027 m!594145))

(declare-fun m!594147 () Bool)

(assert (=> b!618027 m!594147))

(assert (=> b!618027 m!594091))

(assert (=> b!618027 m!594091))

(declare-fun m!594149 () Bool)

(assert (=> b!618027 m!594149))

(assert (=> b!618027 m!594091))

(declare-fun m!594151 () Bool)

(assert (=> b!618027 m!594151))

(assert (=> b!618027 m!594109))

(declare-fun m!594153 () Bool)

(assert (=> b!618041 m!594153))

(assert (=> b!618047 m!594091))

(assert (=> b!618047 m!594091))

(assert (=> b!618047 m!594129))

(assert (=> b!618034 m!594091))

(assert (=> b!618034 m!594091))

(declare-fun m!594155 () Bool)

(assert (=> b!618034 m!594155))

(declare-fun m!594157 () Bool)

(assert (=> start!56072 m!594157))

(declare-fun m!594159 () Bool)

(assert (=> start!56072 m!594159))

(assert (=> b!618044 m!594117))

(assert (=> b!618044 m!594141))

(assert (=> b!618044 m!594091))

(push 1)

