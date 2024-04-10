; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54912 () Bool)

(assert start!54912)

(declare-fun b!601359 () Bool)

(declare-fun res!386136 () Bool)

(declare-fun e!343849 () Bool)

(assert (=> b!601359 (=> (not res!386136) (not e!343849))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37147 0))(
  ( (array!37148 (arr!17833 (Array (_ BitVec 32) (_ BitVec 64))) (size!18197 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37147)

(assert (=> b!601359 (= res!386136 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17833 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!601360 () Bool)

(declare-fun e!343850 () Bool)

(declare-fun e!343856 () Bool)

(assert (=> b!601360 (= e!343850 (not e!343856))))

(declare-fun res!386145 () Bool)

(assert (=> b!601360 (=> res!386145 e!343856)))

(declare-datatypes ((SeekEntryResult!6273 0))(
  ( (MissingZero!6273 (index!27349 (_ BitVec 32))) (Found!6273 (index!27350 (_ BitVec 32))) (Intermediate!6273 (undefined!7085 Bool) (index!27351 (_ BitVec 32)) (x!56144 (_ BitVec 32))) (Undefined!6273) (MissingVacant!6273 (index!27352 (_ BitVec 32))) )
))
(declare-fun lt!273745 () SeekEntryResult!6273)

(assert (=> b!601360 (= res!386145 (not (= lt!273745 (Found!6273 index!984))))))

(declare-datatypes ((Unit!19018 0))(
  ( (Unit!19019) )
))
(declare-fun lt!273747 () Unit!19018)

(declare-fun e!343845 () Unit!19018)

(assert (=> b!601360 (= lt!273747 e!343845)))

(declare-fun c!67982 () Bool)

(assert (=> b!601360 (= c!67982 (= lt!273745 Undefined!6273))))

(declare-fun lt!273754 () array!37147)

(declare-fun lt!273746 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37147 (_ BitVec 32)) SeekEntryResult!6273)

(assert (=> b!601360 (= lt!273745 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!273746 lt!273754 mask!3053))))

(declare-fun e!343857 () Bool)

(assert (=> b!601360 e!343857))

(declare-fun res!386135 () Bool)

(assert (=> b!601360 (=> (not res!386135) (not e!343857))))

(declare-fun lt!273750 () (_ BitVec 32))

(declare-fun lt!273743 () SeekEntryResult!6273)

(assert (=> b!601360 (= res!386135 (= lt!273743 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273750 vacantSpotIndex!68 lt!273746 lt!273754 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!601360 (= lt!273743 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273750 vacantSpotIndex!68 (select (arr!17833 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!601360 (= lt!273746 (select (store (arr!17833 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!273740 () Unit!19018)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37147 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19018)

(assert (=> b!601360 (= lt!273740 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!273750 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!601360 (= lt!273750 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!601361 () Bool)

(declare-fun res!386142 () Bool)

(assert (=> b!601361 (=> (not res!386142) (not e!343849))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37147 (_ BitVec 32)) Bool)

(assert (=> b!601361 (= res!386142 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!601362 () Bool)

(declare-fun res!386138 () Bool)

(declare-fun e!343847 () Bool)

(assert (=> b!601362 (=> (not res!386138) (not e!343847))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!601362 (= res!386138 (validKeyInArray!0 (select (arr!17833 a!2986) j!136)))))

(declare-fun b!601363 () Bool)

(declare-fun e!343855 () Bool)

(assert (=> b!601363 (= e!343849 e!343855)))

(declare-fun res!386141 () Bool)

(assert (=> b!601363 (=> (not res!386141) (not e!343855))))

(assert (=> b!601363 (= res!386141 (= (select (store (arr!17833 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!601363 (= lt!273754 (array!37148 (store (arr!17833 a!2986) i!1108 k0!1786) (size!18197 a!2986)))))

(declare-fun b!601364 () Bool)

(assert (=> b!601364 (= e!343855 e!343850)))

(declare-fun res!386147 () Bool)

(assert (=> b!601364 (=> (not res!386147) (not e!343850))))

(declare-fun lt!273749 () SeekEntryResult!6273)

(assert (=> b!601364 (= res!386147 (and (= lt!273749 (Found!6273 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17833 a!2986) index!984) (select (arr!17833 a!2986) j!136))) (not (= (select (arr!17833 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!601364 (= lt!273749 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17833 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!601365 () Bool)

(assert (=> b!601365 (= e!343857 (= lt!273749 lt!273743))))

(declare-fun b!601366 () Bool)

(declare-fun res!386143 () Bool)

(assert (=> b!601366 (=> (not res!386143) (not e!343847))))

(assert (=> b!601366 (= res!386143 (and (= (size!18197 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18197 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18197 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!601367 () Bool)

(declare-fun e!343852 () Unit!19018)

(declare-fun Unit!19020 () Unit!19018)

(assert (=> b!601367 (= e!343852 Unit!19020)))

(declare-fun b!601368 () Bool)

(declare-fun res!386131 () Bool)

(assert (=> b!601368 (=> (not res!386131) (not e!343847))))

(declare-fun arrayContainsKey!0 (array!37147 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!601368 (= res!386131 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun e!343846 () Bool)

(declare-fun b!601369 () Bool)

(assert (=> b!601369 (= e!343846 (arrayContainsKey!0 lt!273754 (select (arr!17833 a!2986) j!136) index!984))))

(declare-fun b!601370 () Bool)

(declare-fun e!343854 () Bool)

(assert (=> b!601370 (= e!343856 e!343854)))

(declare-fun res!386140 () Bool)

(assert (=> b!601370 (=> res!386140 e!343854)))

(declare-fun lt!273748 () (_ BitVec 64))

(assert (=> b!601370 (= res!386140 (or (not (= (select (arr!17833 a!2986) j!136) lt!273746)) (not (= (select (arr!17833 a!2986) j!136) lt!273748))))))

(declare-fun e!343853 () Bool)

(assert (=> b!601370 e!343853))

(declare-fun res!386144 () Bool)

(assert (=> b!601370 (=> (not res!386144) (not e!343853))))

(assert (=> b!601370 (= res!386144 (= lt!273748 (select (arr!17833 a!2986) j!136)))))

(assert (=> b!601370 (= lt!273748 (select (store (arr!17833 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!601371 () Bool)

(declare-fun e!343848 () Bool)

(assert (=> b!601371 (= e!343853 e!343848)))

(declare-fun res!386137 () Bool)

(assert (=> b!601371 (=> res!386137 e!343848)))

(assert (=> b!601371 (= res!386137 (or (not (= (select (arr!17833 a!2986) j!136) lt!273746)) (not (= (select (arr!17833 a!2986) j!136) lt!273748)) (bvsge j!136 index!984)))))

(declare-fun b!601372 () Bool)

(declare-fun Unit!19021 () Unit!19018)

(assert (=> b!601372 (= e!343845 Unit!19021)))

(declare-fun b!601373 () Bool)

(declare-fun res!386134 () Bool)

(assert (=> b!601373 (=> (not res!386134) (not e!343849))))

(declare-datatypes ((List!11874 0))(
  ( (Nil!11871) (Cons!11870 (h!12915 (_ BitVec 64)) (t!18102 List!11874)) )
))
(declare-fun arrayNoDuplicates!0 (array!37147 (_ BitVec 32) List!11874) Bool)

(assert (=> b!601373 (= res!386134 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11871))))

(declare-fun b!601374 () Bool)

(assert (=> b!601374 (= e!343847 e!343849)))

(declare-fun res!386132 () Bool)

(assert (=> b!601374 (=> (not res!386132) (not e!343849))))

(declare-fun lt!273744 () SeekEntryResult!6273)

(assert (=> b!601374 (= res!386132 (or (= lt!273744 (MissingZero!6273 i!1108)) (= lt!273744 (MissingVacant!6273 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37147 (_ BitVec 32)) SeekEntryResult!6273)

(assert (=> b!601374 (= lt!273744 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!601375 () Bool)

(assert (=> b!601375 (= e!343848 e!343846)))

(declare-fun res!386133 () Bool)

(assert (=> b!601375 (=> (not res!386133) (not e!343846))))

(assert (=> b!601375 (= res!386133 (arrayContainsKey!0 lt!273754 (select (arr!17833 a!2986) j!136) j!136))))

(declare-fun b!601376 () Bool)

(assert (=> b!601376 (= e!343854 true)))

(declare-fun lt!273742 () Unit!19018)

(assert (=> b!601376 (= lt!273742 e!343852)))

(declare-fun c!67981 () Bool)

(assert (=> b!601376 (= c!67981 (bvslt j!136 index!984))))

(declare-fun res!386139 () Bool)

(assert (=> start!54912 (=> (not res!386139) (not e!343847))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54912 (= res!386139 (validMask!0 mask!3053))))

(assert (=> start!54912 e!343847))

(assert (=> start!54912 true))

(declare-fun array_inv!13629 (array!37147) Bool)

(assert (=> start!54912 (array_inv!13629 a!2986)))

(declare-fun b!601377 () Bool)

(declare-fun Unit!19022 () Unit!19018)

(assert (=> b!601377 (= e!343852 Unit!19022)))

(declare-fun lt!273752 () Unit!19018)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37147 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19018)

(assert (=> b!601377 (= lt!273752 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!273754 (select (arr!17833 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!601377 (arrayContainsKey!0 lt!273754 (select (arr!17833 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!273751 () Unit!19018)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37147 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11874) Unit!19018)

(assert (=> b!601377 (= lt!273751 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11871))))

(assert (=> b!601377 (arrayNoDuplicates!0 lt!273754 #b00000000000000000000000000000000 Nil!11871)))

(declare-fun lt!273741 () Unit!19018)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37147 (_ BitVec 32) (_ BitVec 32)) Unit!19018)

(assert (=> b!601377 (= lt!273741 (lemmaNoDuplicateFromThenFromBigger!0 lt!273754 #b00000000000000000000000000000000 j!136))))

(assert (=> b!601377 (arrayNoDuplicates!0 lt!273754 j!136 Nil!11871)))

(declare-fun lt!273753 () Unit!19018)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37147 (_ BitVec 64) (_ BitVec 32) List!11874) Unit!19018)

(assert (=> b!601377 (= lt!273753 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!273754 (select (arr!17833 a!2986) j!136) j!136 Nil!11871))))

(assert (=> b!601377 false))

(declare-fun b!601378 () Bool)

(declare-fun Unit!19023 () Unit!19018)

(assert (=> b!601378 (= e!343845 Unit!19023)))

(assert (=> b!601378 false))

(declare-fun b!601379 () Bool)

(declare-fun res!386146 () Bool)

(assert (=> b!601379 (=> (not res!386146) (not e!343847))))

(assert (=> b!601379 (= res!386146 (validKeyInArray!0 k0!1786))))

(assert (= (and start!54912 res!386139) b!601366))

(assert (= (and b!601366 res!386143) b!601362))

(assert (= (and b!601362 res!386138) b!601379))

(assert (= (and b!601379 res!386146) b!601368))

(assert (= (and b!601368 res!386131) b!601374))

(assert (= (and b!601374 res!386132) b!601361))

(assert (= (and b!601361 res!386142) b!601373))

(assert (= (and b!601373 res!386134) b!601359))

(assert (= (and b!601359 res!386136) b!601363))

(assert (= (and b!601363 res!386141) b!601364))

(assert (= (and b!601364 res!386147) b!601360))

(assert (= (and b!601360 res!386135) b!601365))

(assert (= (and b!601360 c!67982) b!601378))

(assert (= (and b!601360 (not c!67982)) b!601372))

(assert (= (and b!601360 (not res!386145)) b!601370))

(assert (= (and b!601370 res!386144) b!601371))

(assert (= (and b!601371 (not res!386137)) b!601375))

(assert (= (and b!601375 res!386133) b!601369))

(assert (= (and b!601370 (not res!386140)) b!601376))

(assert (= (and b!601376 c!67981) b!601377))

(assert (= (and b!601376 (not c!67981)) b!601367))

(declare-fun m!578549 () Bool)

(assert (=> b!601371 m!578549))

(declare-fun m!578551 () Bool)

(assert (=> b!601364 m!578551))

(assert (=> b!601364 m!578549))

(assert (=> b!601364 m!578549))

(declare-fun m!578553 () Bool)

(assert (=> b!601364 m!578553))

(declare-fun m!578555 () Bool)

(assert (=> b!601361 m!578555))

(declare-fun m!578557 () Bool)

(assert (=> start!54912 m!578557))

(declare-fun m!578559 () Bool)

(assert (=> start!54912 m!578559))

(declare-fun m!578561 () Bool)

(assert (=> b!601374 m!578561))

(declare-fun m!578563 () Bool)

(assert (=> b!601373 m!578563))

(declare-fun m!578565 () Bool)

(assert (=> b!601359 m!578565))

(declare-fun m!578567 () Bool)

(assert (=> b!601360 m!578567))

(declare-fun m!578569 () Bool)

(assert (=> b!601360 m!578569))

(declare-fun m!578571 () Bool)

(assert (=> b!601360 m!578571))

(assert (=> b!601360 m!578549))

(declare-fun m!578573 () Bool)

(assert (=> b!601360 m!578573))

(declare-fun m!578575 () Bool)

(assert (=> b!601360 m!578575))

(assert (=> b!601360 m!578549))

(declare-fun m!578577 () Bool)

(assert (=> b!601360 m!578577))

(declare-fun m!578579 () Bool)

(assert (=> b!601360 m!578579))

(assert (=> b!601369 m!578549))

(assert (=> b!601369 m!578549))

(declare-fun m!578581 () Bool)

(assert (=> b!601369 m!578581))

(assert (=> b!601375 m!578549))

(assert (=> b!601375 m!578549))

(declare-fun m!578583 () Bool)

(assert (=> b!601375 m!578583))

(assert (=> b!601377 m!578549))

(declare-fun m!578585 () Bool)

(assert (=> b!601377 m!578585))

(assert (=> b!601377 m!578549))

(assert (=> b!601377 m!578549))

(declare-fun m!578587 () Bool)

(assert (=> b!601377 m!578587))

(declare-fun m!578589 () Bool)

(assert (=> b!601377 m!578589))

(assert (=> b!601377 m!578549))

(declare-fun m!578591 () Bool)

(assert (=> b!601377 m!578591))

(declare-fun m!578593 () Bool)

(assert (=> b!601377 m!578593))

(declare-fun m!578595 () Bool)

(assert (=> b!601377 m!578595))

(declare-fun m!578597 () Bool)

(assert (=> b!601377 m!578597))

(declare-fun m!578599 () Bool)

(assert (=> b!601368 m!578599))

(declare-fun m!578601 () Bool)

(assert (=> b!601379 m!578601))

(assert (=> b!601362 m!578549))

(assert (=> b!601362 m!578549))

(declare-fun m!578603 () Bool)

(assert (=> b!601362 m!578603))

(assert (=> b!601370 m!578549))

(assert (=> b!601370 m!578573))

(declare-fun m!578605 () Bool)

(assert (=> b!601370 m!578605))

(assert (=> b!601363 m!578573))

(declare-fun m!578607 () Bool)

(assert (=> b!601363 m!578607))

(check-sat (not b!601362) (not b!601379) (not b!601360) (not b!601375) (not b!601361) (not start!54912) (not b!601374) (not b!601369) (not b!601373) (not b!601377) (not b!601364) (not b!601368))
(check-sat)
