; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56216 () Bool)

(assert start!56216)

(declare-fun b!623289 () Bool)

(declare-fun res!401709 () Bool)

(declare-fun e!357515 () Bool)

(assert (=> b!623289 (=> (not res!401709) (not e!357515))))

(declare-datatypes ((array!37686 0))(
  ( (array!37687 (arr!18089 (Array (_ BitVec 32) (_ BitVec 64))) (size!18453 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37686)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37686 (_ BitVec 32)) Bool)

(assert (=> b!623289 (= res!401709 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!623290 () Bool)

(declare-datatypes ((Unit!21018 0))(
  ( (Unit!21019) )
))
(declare-fun e!357521 () Unit!21018)

(declare-fun Unit!21020 () Unit!21018)

(assert (=> b!623290 (= e!357521 Unit!21020)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!289112 () array!37686)

(declare-fun e!357513 () Bool)

(declare-fun b!623291 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!37686 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!623291 (= e!357513 (arrayContainsKey!0 lt!289112 (select (arr!18089 a!2986) j!136) index!984))))

(declare-fun b!623292 () Bool)

(assert (=> b!623292 false))

(declare-fun lt!289117 () Unit!21018)

(declare-datatypes ((List!12130 0))(
  ( (Nil!12127) (Cons!12126 (h!13171 (_ BitVec 64)) (t!18358 List!12130)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37686 (_ BitVec 64) (_ BitVec 32) List!12130) Unit!21018)

(assert (=> b!623292 (= lt!289117 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!289112 (select (arr!18089 a!2986) j!136) j!136 Nil!12127))))

(declare-fun arrayNoDuplicates!0 (array!37686 (_ BitVec 32) List!12130) Bool)

(assert (=> b!623292 (arrayNoDuplicates!0 lt!289112 j!136 Nil!12127)))

(declare-fun lt!289113 () Unit!21018)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37686 (_ BitVec 32) (_ BitVec 32)) Unit!21018)

(assert (=> b!623292 (= lt!289113 (lemmaNoDuplicateFromThenFromBigger!0 lt!289112 #b00000000000000000000000000000000 j!136))))

(assert (=> b!623292 (arrayNoDuplicates!0 lt!289112 #b00000000000000000000000000000000 Nil!12127)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun lt!289116 () Unit!21018)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37686 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12130) Unit!21018)

(assert (=> b!623292 (= lt!289116 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12127))))

(assert (=> b!623292 (arrayContainsKey!0 lt!289112 (select (arr!18089 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!289107 () Unit!21018)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37686 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21018)

(assert (=> b!623292 (= lt!289107 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!289112 (select (arr!18089 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!357512 () Unit!21018)

(declare-fun Unit!21021 () Unit!21018)

(assert (=> b!623292 (= e!357512 Unit!21021)))

(declare-fun b!623293 () Bool)

(declare-fun res!401710 () Bool)

(assert (=> b!623293 (= res!401710 (bvsge j!136 index!984))))

(declare-fun e!357510 () Bool)

(assert (=> b!623293 (=> res!401710 e!357510)))

(declare-fun e!357511 () Bool)

(assert (=> b!623293 (= e!357511 e!357510)))

(declare-fun b!623294 () Bool)

(declare-fun res!401705 () Bool)

(declare-fun e!357517 () Bool)

(assert (=> b!623294 (=> (not res!401705) (not e!357517))))

(assert (=> b!623294 (= res!401705 (and (= (size!18453 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18453 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18453 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!623295 () Bool)

(declare-fun e!357520 () Unit!21018)

(declare-fun Unit!21022 () Unit!21018)

(assert (=> b!623295 (= e!357520 Unit!21022)))

(declare-fun b!623296 () Bool)

(declare-fun e!357518 () Unit!21018)

(declare-fun Unit!21023 () Unit!21018)

(assert (=> b!623296 (= e!357518 Unit!21023)))

(declare-fun b!623297 () Bool)

(assert (=> b!623297 (= e!357517 e!357515)))

(declare-fun res!401702 () Bool)

(assert (=> b!623297 (=> (not res!401702) (not e!357515))))

(declare-datatypes ((SeekEntryResult!6529 0))(
  ( (MissingZero!6529 (index!28400 (_ BitVec 32))) (Found!6529 (index!28401 (_ BitVec 32))) (Intermediate!6529 (undefined!7341 Bool) (index!28402 (_ BitVec 32)) (x!57161 (_ BitVec 32))) (Undefined!6529) (MissingVacant!6529 (index!28403 (_ BitVec 32))) )
))
(declare-fun lt!289109 () SeekEntryResult!6529)

(assert (=> b!623297 (= res!401702 (or (= lt!289109 (MissingZero!6529 i!1108)) (= lt!289109 (MissingVacant!6529 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37686 (_ BitVec 32)) SeekEntryResult!6529)

(assert (=> b!623297 (= lt!289109 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!623298 () Bool)

(declare-fun Unit!21024 () Unit!21018)

(assert (=> b!623298 (= e!357518 Unit!21024)))

(declare-fun res!401714 () Bool)

(assert (=> b!623298 (= res!401714 (= (select (store (arr!18089 a!2986) i!1108 k!1786) index!984) (select (arr!18089 a!2986) j!136)))))

(assert (=> b!623298 (=> (not res!401714) (not e!357511))))

(assert (=> b!623298 e!357511))

(declare-fun c!71165 () Bool)

(assert (=> b!623298 (= c!71165 (bvslt j!136 index!984))))

(declare-fun lt!289114 () Unit!21018)

(assert (=> b!623298 (= lt!289114 e!357512)))

(declare-fun c!71164 () Bool)

(assert (=> b!623298 (= c!71164 (bvslt index!984 j!136))))

(declare-fun lt!289115 () Unit!21018)

(assert (=> b!623298 (= lt!289115 e!357521)))

(assert (=> b!623298 false))

(declare-fun b!623299 () Bool)

(declare-fun res!401703 () Bool)

(assert (=> b!623299 (=> (not res!401703) (not e!357515))))

(assert (=> b!623299 (= res!401703 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12127))))

(declare-fun b!623300 () Bool)

(assert (=> b!623300 false))

(declare-fun lt!289099 () Unit!21018)

(assert (=> b!623300 (= lt!289099 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!289112 (select (arr!18089 a!2986) j!136) index!984 Nil!12127))))

(assert (=> b!623300 (arrayNoDuplicates!0 lt!289112 index!984 Nil!12127)))

(declare-fun lt!289105 () Unit!21018)

(assert (=> b!623300 (= lt!289105 (lemmaNoDuplicateFromThenFromBigger!0 lt!289112 #b00000000000000000000000000000000 index!984))))

(assert (=> b!623300 (arrayNoDuplicates!0 lt!289112 #b00000000000000000000000000000000 Nil!12127)))

(declare-fun lt!289111 () Unit!21018)

(assert (=> b!623300 (= lt!289111 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12127))))

(assert (=> b!623300 (arrayContainsKey!0 lt!289112 (select (arr!18089 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!289110 () Unit!21018)

(assert (=> b!623300 (= lt!289110 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!289112 (select (arr!18089 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!623300 e!357513))

(declare-fun res!401708 () Bool)

(assert (=> b!623300 (=> (not res!401708) (not e!357513))))

(assert (=> b!623300 (= res!401708 (arrayContainsKey!0 lt!289112 (select (arr!18089 a!2986) j!136) j!136))))

(declare-fun Unit!21025 () Unit!21018)

(assert (=> b!623300 (= e!357521 Unit!21025)))

(declare-fun b!623302 () Bool)

(declare-fun Unit!21026 () Unit!21018)

(assert (=> b!623302 (= e!357512 Unit!21026)))

(declare-fun b!623303 () Bool)

(declare-fun res!401711 () Bool)

(assert (=> b!623303 (=> (not res!401711) (not e!357517))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!623303 (= res!401711 (validKeyInArray!0 k!1786))))

(declare-fun b!623304 () Bool)

(declare-fun e!357514 () Bool)

(declare-fun e!357519 () Bool)

(assert (=> b!623304 (= e!357514 e!357519)))

(declare-fun res!401701 () Bool)

(assert (=> b!623304 (=> (not res!401701) (not e!357519))))

(declare-fun lt!289102 () SeekEntryResult!6529)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!623304 (= res!401701 (and (= lt!289102 (Found!6529 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18089 a!2986) index!984) (select (arr!18089 a!2986) j!136))) (not (= (select (arr!18089 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37686 (_ BitVec 32)) SeekEntryResult!6529)

(assert (=> b!623304 (= lt!289102 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18089 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!623305 () Bool)

(declare-fun res!401704 () Bool)

(assert (=> b!623305 (=> (not res!401704) (not e!357517))))

(assert (=> b!623305 (= res!401704 (validKeyInArray!0 (select (arr!18089 a!2986) j!136)))))

(declare-fun b!623306 () Bool)

(declare-fun res!401707 () Bool)

(assert (=> b!623306 (=> (not res!401707) (not e!357515))))

(assert (=> b!623306 (= res!401707 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18089 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!357516 () Bool)

(declare-fun b!623307 () Bool)

(assert (=> b!623307 (= e!357516 (arrayContainsKey!0 lt!289112 (select (arr!18089 a!2986) j!136) index!984))))

(declare-fun b!623308 () Bool)

(declare-fun e!357509 () Bool)

(declare-fun lt!289106 () SeekEntryResult!6529)

(assert (=> b!623308 (= e!357509 (= lt!289102 lt!289106))))

(declare-fun b!623309 () Bool)

(declare-fun res!401700 () Bool)

(assert (=> b!623309 (=> (not res!401700) (not e!357517))))

(assert (=> b!623309 (= res!401700 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!623310 () Bool)

(assert (=> b!623310 (= e!357519 (not true))))

(declare-fun lt!289100 () Unit!21018)

(assert (=> b!623310 (= lt!289100 e!357518)))

(declare-fun c!71163 () Bool)

(declare-fun lt!289103 () SeekEntryResult!6529)

(assert (=> b!623310 (= c!71163 (= lt!289103 (Found!6529 index!984)))))

(declare-fun lt!289108 () Unit!21018)

(assert (=> b!623310 (= lt!289108 e!357520)))

(declare-fun c!71162 () Bool)

(assert (=> b!623310 (= c!71162 (= lt!289103 Undefined!6529))))

(declare-fun lt!289101 () (_ BitVec 64))

(assert (=> b!623310 (= lt!289103 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!289101 lt!289112 mask!3053))))

(assert (=> b!623310 e!357509))

(declare-fun res!401706 () Bool)

(assert (=> b!623310 (=> (not res!401706) (not e!357509))))

(declare-fun lt!289098 () (_ BitVec 32))

(assert (=> b!623310 (= res!401706 (= lt!289106 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!289098 vacantSpotIndex!68 lt!289101 lt!289112 mask!3053)))))

(assert (=> b!623310 (= lt!289106 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!289098 vacantSpotIndex!68 (select (arr!18089 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!623310 (= lt!289101 (select (store (arr!18089 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!289104 () Unit!21018)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37686 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21018)

(assert (=> b!623310 (= lt!289104 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!289098 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!623310 (= lt!289098 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!623301 () Bool)

(declare-fun Unit!21027 () Unit!21018)

(assert (=> b!623301 (= e!357520 Unit!21027)))

(assert (=> b!623301 false))

(declare-fun res!401713 () Bool)

(assert (=> start!56216 (=> (not res!401713) (not e!357517))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56216 (= res!401713 (validMask!0 mask!3053))))

(assert (=> start!56216 e!357517))

(assert (=> start!56216 true))

(declare-fun array_inv!13885 (array!37686) Bool)

(assert (=> start!56216 (array_inv!13885 a!2986)))

(declare-fun b!623311 () Bool)

(assert (=> b!623311 (= e!357515 e!357514)))

(declare-fun res!401699 () Bool)

(assert (=> b!623311 (=> (not res!401699) (not e!357514))))

(assert (=> b!623311 (= res!401699 (= (select (store (arr!18089 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!623311 (= lt!289112 (array!37687 (store (arr!18089 a!2986) i!1108 k!1786) (size!18453 a!2986)))))

(declare-fun b!623312 () Bool)

(declare-fun res!401712 () Bool)

(assert (=> b!623312 (= res!401712 (arrayContainsKey!0 lt!289112 (select (arr!18089 a!2986) j!136) j!136))))

(assert (=> b!623312 (=> (not res!401712) (not e!357516))))

(assert (=> b!623312 (= e!357510 e!357516)))

(assert (= (and start!56216 res!401713) b!623294))

(assert (= (and b!623294 res!401705) b!623305))

(assert (= (and b!623305 res!401704) b!623303))

(assert (= (and b!623303 res!401711) b!623309))

(assert (= (and b!623309 res!401700) b!623297))

(assert (= (and b!623297 res!401702) b!623289))

(assert (= (and b!623289 res!401709) b!623299))

(assert (= (and b!623299 res!401703) b!623306))

(assert (= (and b!623306 res!401707) b!623311))

(assert (= (and b!623311 res!401699) b!623304))

(assert (= (and b!623304 res!401701) b!623310))

(assert (= (and b!623310 res!401706) b!623308))

(assert (= (and b!623310 c!71162) b!623301))

(assert (= (and b!623310 (not c!71162)) b!623295))

(assert (= (and b!623310 c!71163) b!623298))

(assert (= (and b!623310 (not c!71163)) b!623296))

(assert (= (and b!623298 res!401714) b!623293))

(assert (= (and b!623293 (not res!401710)) b!623312))

(assert (= (and b!623312 res!401712) b!623307))

(assert (= (and b!623298 c!71165) b!623292))

(assert (= (and b!623298 (not c!71165)) b!623302))

(assert (= (and b!623298 c!71164) b!623300))

(assert (= (and b!623298 (not c!71164)) b!623290))

(assert (= (and b!623300 res!401708) b!623291))

(declare-fun m!599131 () Bool)

(assert (=> b!623304 m!599131))

(declare-fun m!599133 () Bool)

(assert (=> b!623304 m!599133))

(assert (=> b!623304 m!599133))

(declare-fun m!599135 () Bool)

(assert (=> b!623304 m!599135))

(assert (=> b!623307 m!599133))

(assert (=> b!623307 m!599133))

(declare-fun m!599137 () Bool)

(assert (=> b!623307 m!599137))

(declare-fun m!599139 () Bool)

(assert (=> b!623298 m!599139))

(declare-fun m!599141 () Bool)

(assert (=> b!623298 m!599141))

(assert (=> b!623298 m!599133))

(declare-fun m!599143 () Bool)

(assert (=> b!623299 m!599143))

(declare-fun m!599145 () Bool)

(assert (=> start!56216 m!599145))

(declare-fun m!599147 () Bool)

(assert (=> start!56216 m!599147))

(assert (=> b!623292 m!599133))

(assert (=> b!623292 m!599133))

(declare-fun m!599149 () Bool)

(assert (=> b!623292 m!599149))

(declare-fun m!599151 () Bool)

(assert (=> b!623292 m!599151))

(assert (=> b!623292 m!599133))

(declare-fun m!599153 () Bool)

(assert (=> b!623292 m!599153))

(declare-fun m!599155 () Bool)

(assert (=> b!623292 m!599155))

(declare-fun m!599157 () Bool)

(assert (=> b!623292 m!599157))

(assert (=> b!623292 m!599133))

(declare-fun m!599159 () Bool)

(assert (=> b!623292 m!599159))

(declare-fun m!599161 () Bool)

(assert (=> b!623292 m!599161))

(declare-fun m!599163 () Bool)

(assert (=> b!623303 m!599163))

(assert (=> b!623311 m!599139))

(declare-fun m!599165 () Bool)

(assert (=> b!623311 m!599165))

(declare-fun m!599167 () Bool)

(assert (=> b!623300 m!599167))

(assert (=> b!623300 m!599133))

(declare-fun m!599169 () Bool)

(assert (=> b!623300 m!599169))

(assert (=> b!623300 m!599133))

(declare-fun m!599171 () Bool)

(assert (=> b!623300 m!599171))

(assert (=> b!623300 m!599133))

(assert (=> b!623300 m!599133))

(declare-fun m!599173 () Bool)

(assert (=> b!623300 m!599173))

(declare-fun m!599175 () Bool)

(assert (=> b!623300 m!599175))

(assert (=> b!623300 m!599161))

(assert (=> b!623300 m!599133))

(declare-fun m!599177 () Bool)

(assert (=> b!623300 m!599177))

(assert (=> b!623300 m!599157))

(assert (=> b!623291 m!599133))

(assert (=> b!623291 m!599133))

(assert (=> b!623291 m!599137))

(declare-fun m!599179 () Bool)

(assert (=> b!623297 m!599179))

(declare-fun m!599181 () Bool)

(assert (=> b!623310 m!599181))

(declare-fun m!599183 () Bool)

(assert (=> b!623310 m!599183))

(assert (=> b!623310 m!599139))

(declare-fun m!599185 () Bool)

(assert (=> b!623310 m!599185))

(declare-fun m!599187 () Bool)

(assert (=> b!623310 m!599187))

(declare-fun m!599189 () Bool)

(assert (=> b!623310 m!599189))

(assert (=> b!623310 m!599133))

(assert (=> b!623310 m!599133))

(declare-fun m!599191 () Bool)

(assert (=> b!623310 m!599191))

(declare-fun m!599193 () Bool)

(assert (=> b!623306 m!599193))

(declare-fun m!599195 () Bool)

(assert (=> b!623289 m!599195))

(assert (=> b!623305 m!599133))

(assert (=> b!623305 m!599133))

(declare-fun m!599197 () Bool)

(assert (=> b!623305 m!599197))

(declare-fun m!599199 () Bool)

(assert (=> b!623309 m!599199))

(assert (=> b!623312 m!599133))

(assert (=> b!623312 m!599133))

(assert (=> b!623312 m!599173))

(push 1)

