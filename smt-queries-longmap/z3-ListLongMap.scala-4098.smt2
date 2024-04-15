; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56070 () Bool)

(assert start!56070)

(declare-fun b!618277 () Bool)

(declare-fun res!398399 () Bool)

(declare-fun e!354558 () Bool)

(assert (=> b!618277 (=> (not res!398399) (not e!354558))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!618277 (= res!398399 (validKeyInArray!0 k0!1786))))

(declare-fun b!618278 () Bool)

(declare-datatypes ((Unit!20346 0))(
  ( (Unit!20347) )
))
(declare-fun e!354552 () Unit!20346)

(declare-fun Unit!20348 () Unit!20346)

(assert (=> b!618278 (= e!354552 Unit!20348)))

(declare-fun b!618280 () Bool)

(declare-fun e!354555 () Bool)

(assert (=> b!618280 (= e!354558 e!354555)))

(declare-fun res!398404 () Bool)

(assert (=> b!618280 (=> (not res!398404) (not e!354555))))

(declare-datatypes ((SeekEntryResult!6460 0))(
  ( (MissingZero!6460 (index!28124 (_ BitVec 32))) (Found!6460 (index!28125 (_ BitVec 32))) (Intermediate!6460 (undefined!7272 Bool) (index!28126 (_ BitVec 32)) (x!56919 (_ BitVec 32))) (Undefined!6460) (MissingVacant!6460 (index!28127 (_ BitVec 32))) )
))
(declare-fun lt!284965 () SeekEntryResult!6460)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!618280 (= res!398404 (or (= lt!284965 (MissingZero!6460 i!1108)) (= lt!284965 (MissingVacant!6460 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((array!37554 0))(
  ( (array!37555 (arr!18023 (Array (_ BitVec 32) (_ BitVec 64))) (size!18388 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37554)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37554 (_ BitVec 32)) SeekEntryResult!6460)

(assert (=> b!618280 (= lt!284965 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!618281 () Bool)

(declare-fun res!398398 () Bool)

(assert (=> b!618281 (=> (not res!398398) (not e!354555))))

(declare-datatypes ((List!12103 0))(
  ( (Nil!12100) (Cons!12099 (h!13144 (_ BitVec 64)) (t!18322 List!12103)) )
))
(declare-fun arrayNoDuplicates!0 (array!37554 (_ BitVec 32) List!12103) Bool)

(assert (=> b!618281 (= res!398398 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12100))))

(declare-fun b!618282 () Bool)

(declare-fun res!398402 () Bool)

(assert (=> b!618282 (=> (not res!398402) (not e!354555))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37554 (_ BitVec 32)) Bool)

(assert (=> b!618282 (= res!398402 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!618283 () Bool)

(declare-fun res!398392 () Bool)

(assert (=> b!618283 (=> (not res!398392) (not e!354558))))

(declare-fun arrayContainsKey!0 (array!37554 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!618283 (= res!398392 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!618284 () Bool)

(declare-fun e!354544 () Unit!20346)

(declare-fun Unit!20349 () Unit!20346)

(assert (=> b!618284 (= e!354544 Unit!20349)))

(declare-fun b!618285 () Bool)

(declare-fun e!354550 () Unit!20346)

(declare-fun Unit!20350 () Unit!20346)

(assert (=> b!618285 (= e!354550 Unit!20350)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!284972 () array!37554)

(declare-fun b!618286 () Bool)

(declare-fun e!354545 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!618286 (= e!354545 (arrayContainsKey!0 lt!284972 (select (arr!18023 a!2986) j!136) index!984))))

(declare-fun b!618287 () Bool)

(declare-fun e!354546 () Bool)

(declare-fun lt!284964 () SeekEntryResult!6460)

(declare-fun lt!284967 () SeekEntryResult!6460)

(assert (=> b!618287 (= e!354546 (= lt!284964 lt!284967))))

(declare-fun b!618288 () Bool)

(declare-fun e!354551 () Bool)

(declare-fun e!354557 () Bool)

(assert (=> b!618288 (= e!354551 (not e!354557))))

(declare-fun res!398405 () Bool)

(assert (=> b!618288 (=> res!398405 e!354557)))

(declare-fun lt!284968 () SeekEntryResult!6460)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!618288 (= res!398405 (not (= lt!284968 (MissingVacant!6460 vacantSpotIndex!68))))))

(declare-fun lt!284966 () Unit!20346)

(assert (=> b!618288 (= lt!284966 e!354550)))

(declare-fun c!70311 () Bool)

(assert (=> b!618288 (= c!70311 (= lt!284968 (Found!6460 index!984)))))

(declare-fun lt!284983 () Unit!20346)

(assert (=> b!618288 (= lt!284983 e!354552)))

(declare-fun c!70314 () Bool)

(assert (=> b!618288 (= c!70314 (= lt!284968 Undefined!6460))))

(declare-fun lt!284969 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37554 (_ BitVec 32)) SeekEntryResult!6460)

(assert (=> b!618288 (= lt!284968 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!284969 lt!284972 mask!3053))))

(assert (=> b!618288 e!354546))

(declare-fun res!398393 () Bool)

(assert (=> b!618288 (=> (not res!398393) (not e!354546))))

(declare-fun lt!284975 () (_ BitVec 32))

(assert (=> b!618288 (= res!398393 (= lt!284967 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!284975 vacantSpotIndex!68 lt!284969 lt!284972 mask!3053)))))

(assert (=> b!618288 (= lt!284967 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!284975 vacantSpotIndex!68 (select (arr!18023 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!618288 (= lt!284969 (select (store (arr!18023 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!284973 () Unit!20346)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37554 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20346)

(assert (=> b!618288 (= lt!284973 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!284975 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!618288 (= lt!284975 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!618289 () Bool)

(assert (=> b!618289 false))

(declare-fun lt!284981 () Unit!20346)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37554 (_ BitVec 64) (_ BitVec 32) List!12103) Unit!20346)

(assert (=> b!618289 (= lt!284981 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!284972 (select (arr!18023 a!2986) j!136) index!984 Nil!12100))))

(assert (=> b!618289 (arrayNoDuplicates!0 lt!284972 index!984 Nil!12100)))

(declare-fun lt!284970 () Unit!20346)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37554 (_ BitVec 32) (_ BitVec 32)) Unit!20346)

(assert (=> b!618289 (= lt!284970 (lemmaNoDuplicateFromThenFromBigger!0 lt!284972 #b00000000000000000000000000000000 index!984))))

(assert (=> b!618289 (arrayNoDuplicates!0 lt!284972 #b00000000000000000000000000000000 Nil!12100)))

(declare-fun lt!284976 () Unit!20346)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37554 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12103) Unit!20346)

(assert (=> b!618289 (= lt!284976 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12100))))

(assert (=> b!618289 (arrayContainsKey!0 lt!284972 (select (arr!18023 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!284977 () Unit!20346)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37554 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20346)

(assert (=> b!618289 (= lt!284977 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!284972 (select (arr!18023 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!618289 e!354545))

(declare-fun res!398396 () Bool)

(assert (=> b!618289 (=> (not res!398396) (not e!354545))))

(assert (=> b!618289 (= res!398396 (arrayContainsKey!0 lt!284972 (select (arr!18023 a!2986) j!136) j!136))))

(declare-fun e!354554 () Unit!20346)

(declare-fun Unit!20351 () Unit!20346)

(assert (=> b!618289 (= e!354554 Unit!20351)))

(declare-fun b!618290 () Bool)

(declare-fun res!398397 () Bool)

(assert (=> b!618290 (= res!398397 (bvsge j!136 index!984))))

(declare-fun e!354556 () Bool)

(assert (=> b!618290 (=> res!398397 e!354556)))

(declare-fun e!354548 () Bool)

(assert (=> b!618290 (= e!354548 e!354556)))

(declare-fun b!618291 () Bool)

(declare-fun res!398391 () Bool)

(assert (=> b!618291 (=> (not res!398391) (not e!354558))))

(assert (=> b!618291 (= res!398391 (and (= (size!18388 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18388 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18388 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!398390 () Bool)

(declare-fun b!618279 () Bool)

(assert (=> b!618279 (= res!398390 (arrayContainsKey!0 lt!284972 (select (arr!18023 a!2986) j!136) j!136))))

(declare-fun e!354549 () Bool)

(assert (=> b!618279 (=> (not res!398390) (not e!354549))))

(assert (=> b!618279 (= e!354556 e!354549)))

(declare-fun res!398403 () Bool)

(assert (=> start!56070 (=> (not res!398403) (not e!354558))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56070 (= res!398403 (validMask!0 mask!3053))))

(assert (=> start!56070 e!354558))

(assert (=> start!56070 true))

(declare-fun array_inv!13906 (array!37554) Bool)

(assert (=> start!56070 (array_inv!13906 a!2986)))

(declare-fun b!618292 () Bool)

(assert (=> b!618292 false))

(declare-fun lt!284980 () Unit!20346)

(assert (=> b!618292 (= lt!284980 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!284972 (select (arr!18023 a!2986) j!136) j!136 Nil!12100))))

(assert (=> b!618292 (arrayNoDuplicates!0 lt!284972 j!136 Nil!12100)))

(declare-fun lt!284974 () Unit!20346)

(assert (=> b!618292 (= lt!284974 (lemmaNoDuplicateFromThenFromBigger!0 lt!284972 #b00000000000000000000000000000000 j!136))))

(assert (=> b!618292 (arrayNoDuplicates!0 lt!284972 #b00000000000000000000000000000000 Nil!12100)))

(declare-fun lt!284978 () Unit!20346)

(assert (=> b!618292 (= lt!284978 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12100))))

(assert (=> b!618292 (arrayContainsKey!0 lt!284972 (select (arr!18023 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!284982 () Unit!20346)

(assert (=> b!618292 (= lt!284982 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!284972 (select (arr!18023 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20352 () Unit!20346)

(assert (=> b!618292 (= e!354544 Unit!20352)))

(declare-fun b!618293 () Bool)

(declare-fun e!354547 () Bool)

(assert (=> b!618293 (= e!354555 e!354547)))

(declare-fun res!398394 () Bool)

(assert (=> b!618293 (=> (not res!398394) (not e!354547))))

(assert (=> b!618293 (= res!398394 (= (select (store (arr!18023 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!618293 (= lt!284972 (array!37555 (store (arr!18023 a!2986) i!1108 k0!1786) (size!18388 a!2986)))))

(declare-fun b!618294 () Bool)

(declare-fun Unit!20353 () Unit!20346)

(assert (=> b!618294 (= e!354550 Unit!20353)))

(declare-fun res!398389 () Bool)

(assert (=> b!618294 (= res!398389 (= (select (store (arr!18023 a!2986) i!1108 k0!1786) index!984) (select (arr!18023 a!2986) j!136)))))

(assert (=> b!618294 (=> (not res!398389) (not e!354548))))

(assert (=> b!618294 e!354548))

(declare-fun c!70313 () Bool)

(assert (=> b!618294 (= c!70313 (bvslt j!136 index!984))))

(declare-fun lt!284979 () Unit!20346)

(assert (=> b!618294 (= lt!284979 e!354544)))

(declare-fun c!70312 () Bool)

(assert (=> b!618294 (= c!70312 (bvslt index!984 j!136))))

(declare-fun lt!284971 () Unit!20346)

(assert (=> b!618294 (= lt!284971 e!354554)))

(assert (=> b!618294 false))

(declare-fun b!618295 () Bool)

(declare-fun Unit!20354 () Unit!20346)

(assert (=> b!618295 (= e!354554 Unit!20354)))

(declare-fun b!618296 () Bool)

(assert (=> b!618296 (= e!354549 (arrayContainsKey!0 lt!284972 (select (arr!18023 a!2986) j!136) index!984))))

(declare-fun b!618297 () Bool)

(assert (=> b!618297 (= e!354557 true)))

(assert (=> b!618297 (= (select (store (arr!18023 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!618298 () Bool)

(declare-fun Unit!20355 () Unit!20346)

(assert (=> b!618298 (= e!354552 Unit!20355)))

(assert (=> b!618298 false))

(declare-fun b!618299 () Bool)

(declare-fun res!398401 () Bool)

(assert (=> b!618299 (=> (not res!398401) (not e!354558))))

(assert (=> b!618299 (= res!398401 (validKeyInArray!0 (select (arr!18023 a!2986) j!136)))))

(declare-fun b!618300 () Bool)

(declare-fun res!398400 () Bool)

(assert (=> b!618300 (=> (not res!398400) (not e!354555))))

(assert (=> b!618300 (= res!398400 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18023 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!618301 () Bool)

(assert (=> b!618301 (= e!354547 e!354551)))

(declare-fun res!398395 () Bool)

(assert (=> b!618301 (=> (not res!398395) (not e!354551))))

(assert (=> b!618301 (= res!398395 (and (= lt!284964 (Found!6460 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18023 a!2986) index!984) (select (arr!18023 a!2986) j!136))) (not (= (select (arr!18023 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!618301 (= lt!284964 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18023 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!56070 res!398403) b!618291))

(assert (= (and b!618291 res!398391) b!618299))

(assert (= (and b!618299 res!398401) b!618277))

(assert (= (and b!618277 res!398399) b!618283))

(assert (= (and b!618283 res!398392) b!618280))

(assert (= (and b!618280 res!398404) b!618282))

(assert (= (and b!618282 res!398402) b!618281))

(assert (= (and b!618281 res!398398) b!618300))

(assert (= (and b!618300 res!398400) b!618293))

(assert (= (and b!618293 res!398394) b!618301))

(assert (= (and b!618301 res!398395) b!618288))

(assert (= (and b!618288 res!398393) b!618287))

(assert (= (and b!618288 c!70314) b!618298))

(assert (= (and b!618288 (not c!70314)) b!618278))

(assert (= (and b!618288 c!70311) b!618294))

(assert (= (and b!618288 (not c!70311)) b!618285))

(assert (= (and b!618294 res!398389) b!618290))

(assert (= (and b!618290 (not res!398397)) b!618279))

(assert (= (and b!618279 res!398390) b!618296))

(assert (= (and b!618294 c!70313) b!618292))

(assert (= (and b!618294 (not c!70313)) b!618284))

(assert (= (and b!618294 c!70312) b!618289))

(assert (= (and b!618294 (not c!70312)) b!618295))

(assert (= (and b!618289 res!398396) b!618286))

(assert (= (and b!618288 (not res!398405)) b!618297))

(declare-fun m!593809 () Bool)

(assert (=> b!618299 m!593809))

(assert (=> b!618299 m!593809))

(declare-fun m!593811 () Bool)

(assert (=> b!618299 m!593811))

(declare-fun m!593813 () Bool)

(assert (=> b!618281 m!593813))

(declare-fun m!593815 () Bool)

(assert (=> b!618297 m!593815))

(declare-fun m!593817 () Bool)

(assert (=> b!618297 m!593817))

(assert (=> b!618294 m!593815))

(assert (=> b!618294 m!593817))

(assert (=> b!618294 m!593809))

(declare-fun m!593819 () Bool)

(assert (=> b!618292 m!593819))

(assert (=> b!618292 m!593809))

(assert (=> b!618292 m!593809))

(declare-fun m!593821 () Bool)

(assert (=> b!618292 m!593821))

(declare-fun m!593823 () Bool)

(assert (=> b!618292 m!593823))

(assert (=> b!618292 m!593809))

(declare-fun m!593825 () Bool)

(assert (=> b!618292 m!593825))

(declare-fun m!593827 () Bool)

(assert (=> b!618292 m!593827))

(assert (=> b!618292 m!593809))

(declare-fun m!593829 () Bool)

(assert (=> b!618292 m!593829))

(declare-fun m!593831 () Bool)

(assert (=> b!618292 m!593831))

(declare-fun m!593833 () Bool)

(assert (=> b!618283 m!593833))

(declare-fun m!593835 () Bool)

(assert (=> b!618300 m!593835))

(declare-fun m!593837 () Bool)

(assert (=> b!618280 m!593837))

(declare-fun m!593839 () Bool)

(assert (=> b!618301 m!593839))

(assert (=> b!618301 m!593809))

(assert (=> b!618301 m!593809))

(declare-fun m!593841 () Bool)

(assert (=> b!618301 m!593841))

(declare-fun m!593843 () Bool)

(assert (=> b!618288 m!593843))

(declare-fun m!593845 () Bool)

(assert (=> b!618288 m!593845))

(declare-fun m!593847 () Bool)

(assert (=> b!618288 m!593847))

(assert (=> b!618288 m!593809))

(declare-fun m!593849 () Bool)

(assert (=> b!618288 m!593849))

(assert (=> b!618288 m!593809))

(assert (=> b!618288 m!593815))

(declare-fun m!593851 () Bool)

(assert (=> b!618288 m!593851))

(declare-fun m!593853 () Bool)

(assert (=> b!618288 m!593853))

(declare-fun m!593855 () Bool)

(assert (=> b!618282 m!593855))

(declare-fun m!593857 () Bool)

(assert (=> start!56070 m!593857))

(declare-fun m!593859 () Bool)

(assert (=> start!56070 m!593859))

(assert (=> b!618296 m!593809))

(assert (=> b!618296 m!593809))

(declare-fun m!593861 () Bool)

(assert (=> b!618296 m!593861))

(assert (=> b!618293 m!593815))

(declare-fun m!593863 () Bool)

(assert (=> b!618293 m!593863))

(assert (=> b!618279 m!593809))

(assert (=> b!618279 m!593809))

(declare-fun m!593865 () Bool)

(assert (=> b!618279 m!593865))

(assert (=> b!618286 m!593809))

(assert (=> b!618286 m!593809))

(assert (=> b!618286 m!593861))

(assert (=> b!618289 m!593809))

(assert (=> b!618289 m!593865))

(assert (=> b!618289 m!593819))

(assert (=> b!618289 m!593809))

(declare-fun m!593867 () Bool)

(assert (=> b!618289 m!593867))

(assert (=> b!618289 m!593809))

(declare-fun m!593869 () Bool)

(assert (=> b!618289 m!593869))

(assert (=> b!618289 m!593809))

(assert (=> b!618289 m!593809))

(declare-fun m!593871 () Bool)

(assert (=> b!618289 m!593871))

(declare-fun m!593873 () Bool)

(assert (=> b!618289 m!593873))

(declare-fun m!593875 () Bool)

(assert (=> b!618289 m!593875))

(assert (=> b!618289 m!593831))

(declare-fun m!593877 () Bool)

(assert (=> b!618277 m!593877))

(check-sat (not b!618283) (not b!618299) (not b!618286) (not b!618288) (not b!618281) (not b!618279) (not start!56070) (not b!618280) (not b!618282) (not b!618292) (not b!618301) (not b!618296) (not b!618277) (not b!618289))
(check-sat)
