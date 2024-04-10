; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55920 () Bool)

(assert start!55920)

(declare-fun b!612331 () Bool)

(declare-datatypes ((Unit!19666 0))(
  ( (Unit!19667) )
))
(declare-fun e!350966 () Unit!19666)

(declare-fun Unit!19668 () Unit!19666)

(assert (=> b!612331 (= e!350966 Unit!19668)))

(assert (=> b!612331 false))

(declare-fun b!612332 () Bool)

(declare-fun res!393925 () Bool)

(declare-fun e!350972 () Bool)

(assert (=> b!612332 (=> (not res!393925) (not e!350972))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!37390 0))(
  ( (array!37391 (arr!17941 (Array (_ BitVec 32) (_ BitVec 64))) (size!18305 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37390)

(assert (=> b!612332 (= res!393925 (and (= (size!18305 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18305 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18305 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!612333 () Bool)

(declare-fun e!350974 () Bool)

(declare-fun e!350978 () Bool)

(assert (=> b!612333 (= e!350974 e!350978)))

(declare-fun res!393917 () Bool)

(assert (=> b!612333 (=> (not res!393917) (not e!350978))))

(declare-datatypes ((SeekEntryResult!6381 0))(
  ( (MissingZero!6381 (index!27808 (_ BitVec 32))) (Found!6381 (index!27809 (_ BitVec 32))) (Intermediate!6381 (undefined!7193 Bool) (index!27810 (_ BitVec 32)) (x!56621 (_ BitVec 32))) (Undefined!6381) (MissingVacant!6381 (index!27811 (_ BitVec 32))) )
))
(declare-fun lt!280338 () SeekEntryResult!6381)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!612333 (= res!393917 (and (= lt!280338 (Found!6381 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17941 a!2986) index!984) (select (arr!17941 a!2986) j!136))) (not (= (select (arr!17941 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37390 (_ BitVec 32)) SeekEntryResult!6381)

(assert (=> b!612333 (= lt!280338 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17941 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!612334 () Bool)

(declare-fun e!350975 () Bool)

(declare-fun e!350969 () Bool)

(assert (=> b!612334 (= e!350975 e!350969)))

(declare-fun res!393934 () Bool)

(assert (=> b!612334 (=> res!393934 e!350969)))

(declare-fun lt!280339 () (_ BitVec 64))

(declare-fun lt!280343 () (_ BitVec 64))

(assert (=> b!612334 (= res!393934 (or (not (= (select (arr!17941 a!2986) j!136) lt!280343)) (not (= (select (arr!17941 a!2986) j!136) lt!280339))))))

(declare-fun e!350967 () Bool)

(assert (=> b!612334 e!350967))

(declare-fun res!393932 () Bool)

(assert (=> b!612334 (=> (not res!393932) (not e!350967))))

(assert (=> b!612334 (= res!393932 (= lt!280339 (select (arr!17941 a!2986) j!136)))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!612334 (= lt!280339 (select (store (arr!17941 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!612335 () Bool)

(declare-fun res!393935 () Bool)

(declare-fun e!350968 () Bool)

(assert (=> b!612335 (=> (not res!393935) (not e!350968))))

(declare-datatypes ((List!11982 0))(
  ( (Nil!11979) (Cons!11978 (h!13023 (_ BitVec 64)) (t!18210 List!11982)) )
))
(declare-fun arrayNoDuplicates!0 (array!37390 (_ BitVec 32) List!11982) Bool)

(assert (=> b!612335 (= res!393935 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11979))))

(declare-fun b!612336 () Bool)

(declare-fun e!350970 () Bool)

(assert (=> b!612336 (= e!350969 e!350970)))

(declare-fun res!393933 () Bool)

(assert (=> b!612336 (=> res!393933 e!350970)))

(assert (=> b!612336 (= res!393933 (bvsge index!984 j!136))))

(declare-fun lt!280349 () Unit!19666)

(declare-fun e!350965 () Unit!19666)

(assert (=> b!612336 (= lt!280349 e!350965)))

(declare-fun c!69575 () Bool)

(assert (=> b!612336 (= c!69575 (bvslt j!136 index!984))))

(declare-fun b!612337 () Bool)

(declare-fun res!393930 () Bool)

(assert (=> b!612337 (=> (not res!393930) (not e!350968))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37390 (_ BitVec 32)) Bool)

(assert (=> b!612337 (= res!393930 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!612338 () Bool)

(declare-fun Unit!19669 () Unit!19666)

(assert (=> b!612338 (= e!350965 Unit!19669)))

(declare-fun lt!280347 () Unit!19666)

(declare-fun lt!280348 () array!37390)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37390 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19666)

(assert (=> b!612338 (= lt!280347 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!280348 (select (arr!17941 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun arrayContainsKey!0 (array!37390 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!612338 (arrayContainsKey!0 lt!280348 (select (arr!17941 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!280353 () Unit!19666)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37390 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11982) Unit!19666)

(assert (=> b!612338 (= lt!280353 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11979))))

(assert (=> b!612338 (arrayNoDuplicates!0 lt!280348 #b00000000000000000000000000000000 Nil!11979)))

(declare-fun lt!280342 () Unit!19666)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37390 (_ BitVec 32) (_ BitVec 32)) Unit!19666)

(assert (=> b!612338 (= lt!280342 (lemmaNoDuplicateFromThenFromBigger!0 lt!280348 #b00000000000000000000000000000000 j!136))))

(assert (=> b!612338 (arrayNoDuplicates!0 lt!280348 j!136 Nil!11979)))

(declare-fun lt!280350 () Unit!19666)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37390 (_ BitVec 64) (_ BitVec 32) List!11982) Unit!19666)

(assert (=> b!612338 (= lt!280350 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!280348 (select (arr!17941 a!2986) j!136) j!136 Nil!11979))))

(assert (=> b!612338 false))

(declare-fun b!612339 () Bool)

(assert (=> b!612339 (= e!350972 e!350968)))

(declare-fun res!393927 () Bool)

(assert (=> b!612339 (=> (not res!393927) (not e!350968))))

(declare-fun lt!280346 () SeekEntryResult!6381)

(assert (=> b!612339 (= res!393927 (or (= lt!280346 (MissingZero!6381 i!1108)) (= lt!280346 (MissingVacant!6381 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37390 (_ BitVec 32)) SeekEntryResult!6381)

(assert (=> b!612339 (= lt!280346 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!612340 () Bool)

(declare-fun res!393921 () Bool)

(assert (=> b!612340 (=> (not res!393921) (not e!350972))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!612340 (= res!393921 (validKeyInArray!0 k0!1786))))

(declare-fun b!612341 () Bool)

(declare-fun res!393926 () Bool)

(assert (=> b!612341 (=> (not res!393926) (not e!350972))))

(assert (=> b!612341 (= res!393926 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!612342 () Bool)

(declare-fun Unit!19670 () Unit!19666)

(assert (=> b!612342 (= e!350966 Unit!19670)))

(declare-fun b!612344 () Bool)

(declare-fun res!393923 () Bool)

(assert (=> b!612344 (=> (not res!393923) (not e!350972))))

(assert (=> b!612344 (= res!393923 (validKeyInArray!0 (select (arr!17941 a!2986) j!136)))))

(declare-fun e!350976 () Bool)

(declare-fun b!612345 () Bool)

(assert (=> b!612345 (= e!350976 (arrayContainsKey!0 lt!280348 (select (arr!17941 a!2986) j!136) index!984))))

(declare-fun b!612346 () Bool)

(declare-fun e!350973 () Bool)

(declare-fun e!350979 () Bool)

(assert (=> b!612346 (= e!350973 e!350979)))

(declare-fun res!393922 () Bool)

(assert (=> b!612346 (=> (not res!393922) (not e!350979))))

(assert (=> b!612346 (= res!393922 (arrayContainsKey!0 lt!280348 (select (arr!17941 a!2986) j!136) j!136))))

(declare-fun b!612347 () Bool)

(declare-fun Unit!19671 () Unit!19666)

(assert (=> b!612347 (= e!350965 Unit!19671)))

(declare-fun b!612348 () Bool)

(assert (=> b!612348 (= e!350979 (arrayContainsKey!0 lt!280348 (select (arr!17941 a!2986) j!136) index!984))))

(declare-fun res!393919 () Bool)

(assert (=> start!55920 (=> (not res!393919) (not e!350972))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55920 (= res!393919 (validMask!0 mask!3053))))

(assert (=> start!55920 e!350972))

(assert (=> start!55920 true))

(declare-fun array_inv!13737 (array!37390) Bool)

(assert (=> start!55920 (array_inv!13737 a!2986)))

(declare-fun b!612343 () Bool)

(assert (=> b!612343 (= e!350967 e!350973)))

(declare-fun res!393931 () Bool)

(assert (=> b!612343 (=> res!393931 e!350973)))

(assert (=> b!612343 (= res!393931 (or (not (= (select (arr!17941 a!2986) j!136) lt!280343)) (not (= (select (arr!17941 a!2986) j!136) lt!280339)) (bvsge j!136 index!984)))))

(declare-fun b!612349 () Bool)

(declare-fun e!350977 () Bool)

(declare-fun lt!280344 () SeekEntryResult!6381)

(assert (=> b!612349 (= e!350977 (= lt!280338 lt!280344))))

(declare-fun b!612350 () Bool)

(assert (=> b!612350 (= e!350968 e!350974)))

(declare-fun res!393924 () Bool)

(assert (=> b!612350 (=> (not res!393924) (not e!350974))))

(assert (=> b!612350 (= res!393924 (= (select (store (arr!17941 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!612350 (= lt!280348 (array!37391 (store (arr!17941 a!2986) i!1108 k0!1786) (size!18305 a!2986)))))

(declare-fun b!612351 () Bool)

(assert (=> b!612351 (= e!350978 (not e!350975))))

(declare-fun res!393918 () Bool)

(assert (=> b!612351 (=> res!393918 e!350975)))

(declare-fun lt!280341 () SeekEntryResult!6381)

(assert (=> b!612351 (= res!393918 (not (= lt!280341 (Found!6381 index!984))))))

(declare-fun lt!280340 () Unit!19666)

(assert (=> b!612351 (= lt!280340 e!350966)))

(declare-fun c!69574 () Bool)

(assert (=> b!612351 (= c!69574 (= lt!280341 Undefined!6381))))

(assert (=> b!612351 (= lt!280341 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!280343 lt!280348 mask!3053))))

(assert (=> b!612351 e!350977))

(declare-fun res!393928 () Bool)

(assert (=> b!612351 (=> (not res!393928) (not e!350977))))

(declare-fun lt!280351 () (_ BitVec 32))

(assert (=> b!612351 (= res!393928 (= lt!280344 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!280351 vacantSpotIndex!68 lt!280343 lt!280348 mask!3053)))))

(assert (=> b!612351 (= lt!280344 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!280351 vacantSpotIndex!68 (select (arr!17941 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!612351 (= lt!280343 (select (store (arr!17941 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!280354 () Unit!19666)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37390 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19666)

(assert (=> b!612351 (= lt!280354 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!280351 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!612351 (= lt!280351 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!612352 () Bool)

(assert (=> b!612352 (= e!350970 true)))

(assert (=> b!612352 (arrayNoDuplicates!0 lt!280348 #b00000000000000000000000000000000 Nil!11979)))

(declare-fun lt!280352 () Unit!19666)

(assert (=> b!612352 (= lt!280352 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11979))))

(assert (=> b!612352 (arrayContainsKey!0 lt!280348 (select (arr!17941 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!280345 () Unit!19666)

(assert (=> b!612352 (= lt!280345 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!280348 (select (arr!17941 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!612352 e!350976))

(declare-fun res!393920 () Bool)

(assert (=> b!612352 (=> (not res!393920) (not e!350976))))

(assert (=> b!612352 (= res!393920 (arrayContainsKey!0 lt!280348 (select (arr!17941 a!2986) j!136) j!136))))

(declare-fun b!612353 () Bool)

(declare-fun res!393929 () Bool)

(assert (=> b!612353 (=> (not res!393929) (not e!350968))))

(assert (=> b!612353 (= res!393929 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17941 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!55920 res!393919) b!612332))

(assert (= (and b!612332 res!393925) b!612344))

(assert (= (and b!612344 res!393923) b!612340))

(assert (= (and b!612340 res!393921) b!612341))

(assert (= (and b!612341 res!393926) b!612339))

(assert (= (and b!612339 res!393927) b!612337))

(assert (= (and b!612337 res!393930) b!612335))

(assert (= (and b!612335 res!393935) b!612353))

(assert (= (and b!612353 res!393929) b!612350))

(assert (= (and b!612350 res!393924) b!612333))

(assert (= (and b!612333 res!393917) b!612351))

(assert (= (and b!612351 res!393928) b!612349))

(assert (= (and b!612351 c!69574) b!612331))

(assert (= (and b!612351 (not c!69574)) b!612342))

(assert (= (and b!612351 (not res!393918)) b!612334))

(assert (= (and b!612334 res!393932) b!612343))

(assert (= (and b!612343 (not res!393931)) b!612346))

(assert (= (and b!612346 res!393922) b!612348))

(assert (= (and b!612334 (not res!393934)) b!612336))

(assert (= (and b!612336 c!69575) b!612338))

(assert (= (and b!612336 (not c!69575)) b!612347))

(assert (= (and b!612336 (not res!393933)) b!612352))

(assert (= (and b!612352 res!393920) b!612345))

(declare-fun m!588687 () Bool)

(assert (=> b!612335 m!588687))

(declare-fun m!588689 () Bool)

(assert (=> b!612348 m!588689))

(assert (=> b!612348 m!588689))

(declare-fun m!588691 () Bool)

(assert (=> b!612348 m!588691))

(declare-fun m!588693 () Bool)

(assert (=> b!612339 m!588693))

(assert (=> b!612346 m!588689))

(assert (=> b!612346 m!588689))

(declare-fun m!588695 () Bool)

(assert (=> b!612346 m!588695))

(assert (=> b!612345 m!588689))

(assert (=> b!612345 m!588689))

(assert (=> b!612345 m!588691))

(assert (=> b!612343 m!588689))

(declare-fun m!588697 () Bool)

(assert (=> b!612351 m!588697))

(declare-fun m!588699 () Bool)

(assert (=> b!612351 m!588699))

(assert (=> b!612351 m!588689))

(declare-fun m!588701 () Bool)

(assert (=> b!612351 m!588701))

(assert (=> b!612351 m!588689))

(declare-fun m!588703 () Bool)

(assert (=> b!612351 m!588703))

(declare-fun m!588705 () Bool)

(assert (=> b!612351 m!588705))

(declare-fun m!588707 () Bool)

(assert (=> b!612351 m!588707))

(declare-fun m!588709 () Bool)

(assert (=> b!612351 m!588709))

(declare-fun m!588711 () Bool)

(assert (=> b!612352 m!588711))

(assert (=> b!612352 m!588689))

(assert (=> b!612352 m!588689))

(declare-fun m!588713 () Bool)

(assert (=> b!612352 m!588713))

(assert (=> b!612352 m!588689))

(assert (=> b!612352 m!588695))

(assert (=> b!612352 m!588689))

(declare-fun m!588715 () Bool)

(assert (=> b!612352 m!588715))

(declare-fun m!588717 () Bool)

(assert (=> b!612352 m!588717))

(assert (=> b!612350 m!588705))

(declare-fun m!588719 () Bool)

(assert (=> b!612350 m!588719))

(declare-fun m!588721 () Bool)

(assert (=> b!612333 m!588721))

(assert (=> b!612333 m!588689))

(assert (=> b!612333 m!588689))

(declare-fun m!588723 () Bool)

(assert (=> b!612333 m!588723))

(declare-fun m!588725 () Bool)

(assert (=> b!612341 m!588725))

(declare-fun m!588727 () Bool)

(assert (=> b!612353 m!588727))

(declare-fun m!588729 () Bool)

(assert (=> b!612340 m!588729))

(declare-fun m!588731 () Bool)

(assert (=> b!612337 m!588731))

(assert (=> b!612334 m!588689))

(assert (=> b!612334 m!588705))

(declare-fun m!588733 () Bool)

(assert (=> b!612334 m!588733))

(declare-fun m!588735 () Bool)

(assert (=> start!55920 m!588735))

(declare-fun m!588737 () Bool)

(assert (=> start!55920 m!588737))

(assert (=> b!612344 m!588689))

(assert (=> b!612344 m!588689))

(declare-fun m!588739 () Bool)

(assert (=> b!612344 m!588739))

(assert (=> b!612338 m!588711))

(assert (=> b!612338 m!588689))

(declare-fun m!588741 () Bool)

(assert (=> b!612338 m!588741))

(assert (=> b!612338 m!588689))

(declare-fun m!588743 () Bool)

(assert (=> b!612338 m!588743))

(assert (=> b!612338 m!588689))

(declare-fun m!588745 () Bool)

(assert (=> b!612338 m!588745))

(assert (=> b!612338 m!588689))

(declare-fun m!588747 () Bool)

(assert (=> b!612338 m!588747))

(declare-fun m!588749 () Bool)

(assert (=> b!612338 m!588749))

(assert (=> b!612338 m!588717))

(check-sat (not b!612340) (not b!612341) (not b!612344) (not b!612352) (not b!612339) (not b!612348) (not b!612335) (not b!612345) (not b!612338) (not b!612351) (not b!612337) (not b!612333) (not start!55920) (not b!612346))
(check-sat)
