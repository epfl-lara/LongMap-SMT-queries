; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55944 () Bool)

(assert start!55944)

(declare-fun b!613581 () Bool)

(declare-fun res!395071 () Bool)

(declare-fun e!351747 () Bool)

(assert (=> b!613581 (=> (not res!395071) (not e!351747))))

(declare-datatypes ((array!37428 0))(
  ( (array!37429 (arr!17960 (Array (_ BitVec 32) (_ BitVec 64))) (size!18325 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37428)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!613581 (= res!395071 (validKeyInArray!0 (select (arr!17960 a!2986) j!136)))))

(declare-fun b!613582 () Bool)

(declare-datatypes ((Unit!19764 0))(
  ( (Unit!19765) )
))
(declare-fun e!351749 () Unit!19764)

(declare-fun Unit!19766 () Unit!19764)

(assert (=> b!613582 (= e!351749 Unit!19766)))

(declare-fun b!613583 () Bool)

(declare-fun lt!281231 () array!37428)

(declare-fun e!351753 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!37428 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!613583 (= e!351753 (arrayContainsKey!0 lt!281231 (select (arr!17960 a!2986) j!136) index!984))))

(declare-fun b!613584 () Bool)

(declare-fun e!351751 () Bool)

(assert (=> b!613584 (= e!351751 true)))

(declare-fun lt!281229 () Bool)

(declare-datatypes ((List!12040 0))(
  ( (Nil!12037) (Cons!12036 (h!13081 (_ BitVec 64)) (t!18259 List!12040)) )
))
(declare-fun contains!3044 (List!12040 (_ BitVec 64)) Bool)

(assert (=> b!613584 (= lt!281229 (contains!3044 Nil!12037 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!613585 () Bool)

(declare-fun e!351738 () Bool)

(declare-fun e!351748 () Bool)

(assert (=> b!613585 (= e!351738 e!351748)))

(declare-fun res!395070 () Bool)

(assert (=> b!613585 (=> res!395070 e!351748)))

(declare-fun lt!281235 () (_ BitVec 64))

(declare-fun lt!281223 () (_ BitVec 64))

(assert (=> b!613585 (= res!395070 (or (not (= (select (arr!17960 a!2986) j!136) lt!281235)) (not (= (select (arr!17960 a!2986) j!136) lt!281223))))))

(declare-fun e!351741 () Bool)

(assert (=> b!613585 e!351741))

(declare-fun res!395080 () Bool)

(assert (=> b!613585 (=> (not res!395080) (not e!351741))))

(assert (=> b!613585 (= res!395080 (= lt!281223 (select (arr!17960 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!613585 (= lt!281223 (select (store (arr!17960 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!613586 () Bool)

(declare-fun res!395081 () Bool)

(declare-fun e!351746 () Bool)

(assert (=> b!613586 (=> (not res!395081) (not e!351746))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!613586 (= res!395081 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17960 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!613587 () Bool)

(declare-fun e!351739 () Bool)

(declare-fun e!351743 () Bool)

(assert (=> b!613587 (= e!351739 e!351743)))

(declare-fun res!395069 () Bool)

(assert (=> b!613587 (=> (not res!395069) (not e!351743))))

(declare-datatypes ((SeekEntryResult!6397 0))(
  ( (MissingZero!6397 (index!27872 (_ BitVec 32))) (Found!6397 (index!27873 (_ BitVec 32))) (Intermediate!6397 (undefined!7209 Bool) (index!27874 (_ BitVec 32)) (x!56688 (_ BitVec 32))) (Undefined!6397) (MissingVacant!6397 (index!27875 (_ BitVec 32))) )
))
(declare-fun lt!281220 () SeekEntryResult!6397)

(assert (=> b!613587 (= res!395069 (and (= lt!281220 (Found!6397 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17960 a!2986) index!984) (select (arr!17960 a!2986) j!136))) (not (= (select (arr!17960 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37428 (_ BitVec 32)) SeekEntryResult!6397)

(assert (=> b!613587 (= lt!281220 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17960 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!613588 () Bool)

(declare-fun res!395076 () Bool)

(assert (=> b!613588 (=> res!395076 e!351751)))

(declare-fun noDuplicate!368 (List!12040) Bool)

(assert (=> b!613588 (= res!395076 (not (noDuplicate!368 Nil!12037)))))

(declare-fun b!613589 () Bool)

(declare-fun e!351744 () Bool)

(declare-fun e!351750 () Bool)

(assert (=> b!613589 (= e!351744 e!351750)))

(declare-fun res!395086 () Bool)

(assert (=> b!613589 (=> (not res!395086) (not e!351750))))

(assert (=> b!613589 (= res!395086 (arrayContainsKey!0 lt!281231 (select (arr!17960 a!2986) j!136) j!136))))

(declare-fun b!613590 () Bool)

(declare-fun e!351740 () Bool)

(declare-fun lt!281228 () SeekEntryResult!6397)

(assert (=> b!613590 (= e!351740 (= lt!281220 lt!281228))))

(declare-fun b!613591 () Bool)

(declare-fun e!351752 () Bool)

(assert (=> b!613591 (= e!351748 e!351752)))

(declare-fun res!395077 () Bool)

(assert (=> b!613591 (=> res!395077 e!351752)))

(assert (=> b!613591 (= res!395077 (bvsge index!984 j!136))))

(declare-fun lt!281233 () Unit!19764)

(declare-fun e!351742 () Unit!19764)

(assert (=> b!613591 (= lt!281233 e!351742)))

(declare-fun c!69623 () Bool)

(assert (=> b!613591 (= c!69623 (bvslt j!136 index!984))))

(declare-fun b!613592 () Bool)

(declare-fun res!395090 () Bool)

(assert (=> b!613592 (=> (not res!395090) (not e!351747))))

(assert (=> b!613592 (= res!395090 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!613593 () Bool)

(declare-fun Unit!19767 () Unit!19764)

(assert (=> b!613593 (= e!351742 Unit!19767)))

(declare-fun lt!281222 () Unit!19764)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37428 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19764)

(assert (=> b!613593 (= lt!281222 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!281231 (select (arr!17960 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!613593 (arrayContainsKey!0 lt!281231 (select (arr!17960 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!281227 () Unit!19764)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37428 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12040) Unit!19764)

(assert (=> b!613593 (= lt!281227 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12037))))

(declare-fun arrayNoDuplicates!0 (array!37428 (_ BitVec 32) List!12040) Bool)

(assert (=> b!613593 (arrayNoDuplicates!0 lt!281231 #b00000000000000000000000000000000 Nil!12037)))

(declare-fun lt!281230 () Unit!19764)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37428 (_ BitVec 32) (_ BitVec 32)) Unit!19764)

(assert (=> b!613593 (= lt!281230 (lemmaNoDuplicateFromThenFromBigger!0 lt!281231 #b00000000000000000000000000000000 j!136))))

(assert (=> b!613593 (arrayNoDuplicates!0 lt!281231 j!136 Nil!12037)))

(declare-fun lt!281224 () Unit!19764)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37428 (_ BitVec 64) (_ BitVec 32) List!12040) Unit!19764)

(assert (=> b!613593 (= lt!281224 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!281231 (select (arr!17960 a!2986) j!136) j!136 Nil!12037))))

(assert (=> b!613593 false))

(declare-fun b!613594 () Bool)

(declare-fun res!395075 () Bool)

(assert (=> b!613594 (=> res!395075 e!351751)))

(assert (=> b!613594 (= res!395075 (contains!3044 Nil!12037 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!613595 () Bool)

(declare-fun res!395073 () Bool)

(assert (=> b!613595 (=> (not res!395073) (not e!351746))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37428 (_ BitVec 32)) Bool)

(assert (=> b!613595 (= res!395073 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!613596 () Bool)

(declare-fun res!395082 () Bool)

(assert (=> b!613596 (=> (not res!395082) (not e!351747))))

(assert (=> b!613596 (= res!395082 (validKeyInArray!0 k0!1786))))

(declare-fun b!613597 () Bool)

(assert (=> b!613597 (= e!351747 e!351746)))

(declare-fun res!395083 () Bool)

(assert (=> b!613597 (=> (not res!395083) (not e!351746))))

(declare-fun lt!281226 () SeekEntryResult!6397)

(assert (=> b!613597 (= res!395083 (or (= lt!281226 (MissingZero!6397 i!1108)) (= lt!281226 (MissingVacant!6397 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37428 (_ BitVec 32)) SeekEntryResult!6397)

(assert (=> b!613597 (= lt!281226 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!613598 () Bool)

(assert (=> b!613598 (= e!351743 (not e!351738))))

(declare-fun res!395085 () Bool)

(assert (=> b!613598 (=> res!395085 e!351738)))

(declare-fun lt!281219 () SeekEntryResult!6397)

(assert (=> b!613598 (= res!395085 (not (= lt!281219 (Found!6397 index!984))))))

(declare-fun lt!281221 () Unit!19764)

(assert (=> b!613598 (= lt!281221 e!351749)))

(declare-fun c!69624 () Bool)

(assert (=> b!613598 (= c!69624 (= lt!281219 Undefined!6397))))

(assert (=> b!613598 (= lt!281219 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!281235 lt!281231 mask!3053))))

(assert (=> b!613598 e!351740))

(declare-fun res!395078 () Bool)

(assert (=> b!613598 (=> (not res!395078) (not e!351740))))

(declare-fun lt!281236 () (_ BitVec 32))

(assert (=> b!613598 (= res!395078 (= lt!281228 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!281236 vacantSpotIndex!68 lt!281235 lt!281231 mask!3053)))))

(assert (=> b!613598 (= lt!281228 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!281236 vacantSpotIndex!68 (select (arr!17960 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!613598 (= lt!281235 (select (store (arr!17960 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!281225 () Unit!19764)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37428 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19764)

(assert (=> b!613598 (= lt!281225 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!281236 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!613598 (= lt!281236 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!395084 () Bool)

(assert (=> start!55944 (=> (not res!395084) (not e!351747))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55944 (= res!395084 (validMask!0 mask!3053))))

(assert (=> start!55944 e!351747))

(assert (=> start!55944 true))

(declare-fun array_inv!13843 (array!37428) Bool)

(assert (=> start!55944 (array_inv!13843 a!2986)))

(declare-fun b!613599 () Bool)

(declare-fun Unit!19768 () Unit!19764)

(assert (=> b!613599 (= e!351742 Unit!19768)))

(declare-fun b!613600 () Bool)

(assert (=> b!613600 (= e!351741 e!351744)))

(declare-fun res!395079 () Bool)

(assert (=> b!613600 (=> res!395079 e!351744)))

(assert (=> b!613600 (= res!395079 (or (not (= (select (arr!17960 a!2986) j!136) lt!281235)) (not (= (select (arr!17960 a!2986) j!136) lt!281223)) (bvsge j!136 index!984)))))

(declare-fun b!613601 () Bool)

(assert (=> b!613601 (= e!351750 (arrayContainsKey!0 lt!281231 (select (arr!17960 a!2986) j!136) index!984))))

(declare-fun b!613602 () Bool)

(declare-fun res!395074 () Bool)

(assert (=> b!613602 (=> (not res!395074) (not e!351747))))

(assert (=> b!613602 (= res!395074 (and (= (size!18325 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18325 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18325 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!613603 () Bool)

(declare-fun Unit!19769 () Unit!19764)

(assert (=> b!613603 (= e!351749 Unit!19769)))

(assert (=> b!613603 false))

(declare-fun b!613604 () Bool)

(assert (=> b!613604 (= e!351746 e!351739)))

(declare-fun res!395088 () Bool)

(assert (=> b!613604 (=> (not res!395088) (not e!351739))))

(assert (=> b!613604 (= res!395088 (= (select (store (arr!17960 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!613604 (= lt!281231 (array!37429 (store (arr!17960 a!2986) i!1108 k0!1786) (size!18325 a!2986)))))

(declare-fun b!613605 () Bool)

(declare-fun res!395087 () Bool)

(assert (=> b!613605 (=> (not res!395087) (not e!351746))))

(assert (=> b!613605 (= res!395087 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12037))))

(declare-fun b!613606 () Bool)

(assert (=> b!613606 (= e!351752 e!351751)))

(declare-fun res!395089 () Bool)

(assert (=> b!613606 (=> res!395089 e!351751)))

(assert (=> b!613606 (= res!395089 (or (bvsge (size!18325 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 index!984) (size!18325 a!2986)) (bvsge index!984 (size!18325 a!2986))))))

(assert (=> b!613606 (arrayNoDuplicates!0 lt!281231 index!984 Nil!12037)))

(declare-fun lt!281232 () Unit!19764)

(assert (=> b!613606 (= lt!281232 (lemmaNoDuplicateFromThenFromBigger!0 lt!281231 #b00000000000000000000000000000000 index!984))))

(assert (=> b!613606 (arrayNoDuplicates!0 lt!281231 #b00000000000000000000000000000000 Nil!12037)))

(declare-fun lt!281234 () Unit!19764)

(assert (=> b!613606 (= lt!281234 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12037))))

(assert (=> b!613606 (arrayContainsKey!0 lt!281231 (select (arr!17960 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!281218 () Unit!19764)

(assert (=> b!613606 (= lt!281218 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!281231 (select (arr!17960 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!613606 e!351753))

(declare-fun res!395072 () Bool)

(assert (=> b!613606 (=> (not res!395072) (not e!351753))))

(assert (=> b!613606 (= res!395072 (arrayContainsKey!0 lt!281231 (select (arr!17960 a!2986) j!136) j!136))))

(assert (= (and start!55944 res!395084) b!613602))

(assert (= (and b!613602 res!395074) b!613581))

(assert (= (and b!613581 res!395071) b!613596))

(assert (= (and b!613596 res!395082) b!613592))

(assert (= (and b!613592 res!395090) b!613597))

(assert (= (and b!613597 res!395083) b!613595))

(assert (= (and b!613595 res!395073) b!613605))

(assert (= (and b!613605 res!395087) b!613586))

(assert (= (and b!613586 res!395081) b!613604))

(assert (= (and b!613604 res!395088) b!613587))

(assert (= (and b!613587 res!395069) b!613598))

(assert (= (and b!613598 res!395078) b!613590))

(assert (= (and b!613598 c!69624) b!613603))

(assert (= (and b!613598 (not c!69624)) b!613582))

(assert (= (and b!613598 (not res!395085)) b!613585))

(assert (= (and b!613585 res!395080) b!613600))

(assert (= (and b!613600 (not res!395079)) b!613589))

(assert (= (and b!613589 res!395086) b!613601))

(assert (= (and b!613585 (not res!395070)) b!613591))

(assert (= (and b!613591 c!69623) b!613593))

(assert (= (and b!613591 (not c!69623)) b!613599))

(assert (= (and b!613591 (not res!395077)) b!613606))

(assert (= (and b!613606 res!395072) b!613583))

(assert (= (and b!613606 (not res!395089)) b!613588))

(assert (= (and b!613588 (not res!395076)) b!613594))

(assert (= (and b!613594 (not res!395075)) b!613584))

(declare-fun m!589345 () Bool)

(assert (=> b!613594 m!589345))

(declare-fun m!589347 () Bool)

(assert (=> b!613605 m!589347))

(declare-fun m!589349 () Bool)

(assert (=> b!613584 m!589349))

(declare-fun m!589351 () Bool)

(assert (=> b!613604 m!589351))

(declare-fun m!589353 () Bool)

(assert (=> b!613604 m!589353))

(declare-fun m!589355 () Bool)

(assert (=> b!613597 m!589355))

(declare-fun m!589357 () Bool)

(assert (=> b!613606 m!589357))

(assert (=> b!613606 m!589357))

(declare-fun m!589359 () Bool)

(assert (=> b!613606 m!589359))

(declare-fun m!589361 () Bool)

(assert (=> b!613606 m!589361))

(declare-fun m!589363 () Bool)

(assert (=> b!613606 m!589363))

(declare-fun m!589365 () Bool)

(assert (=> b!613606 m!589365))

(assert (=> b!613606 m!589357))

(declare-fun m!589367 () Bool)

(assert (=> b!613606 m!589367))

(assert (=> b!613606 m!589357))

(declare-fun m!589369 () Bool)

(assert (=> b!613606 m!589369))

(declare-fun m!589371 () Bool)

(assert (=> b!613606 m!589371))

(declare-fun m!589373 () Bool)

(assert (=> b!613588 m!589373))

(assert (=> b!613600 m!589357))

(declare-fun m!589375 () Bool)

(assert (=> b!613586 m!589375))

(assert (=> b!613589 m!589357))

(assert (=> b!613589 m!589357))

(assert (=> b!613589 m!589367))

(declare-fun m!589377 () Bool)

(assert (=> b!613593 m!589377))

(assert (=> b!613593 m!589365))

(assert (=> b!613593 m!589357))

(declare-fun m!589379 () Bool)

(assert (=> b!613593 m!589379))

(assert (=> b!613593 m!589357))

(declare-fun m!589381 () Bool)

(assert (=> b!613593 m!589381))

(assert (=> b!613593 m!589357))

(declare-fun m!589383 () Bool)

(assert (=> b!613593 m!589383))

(assert (=> b!613593 m!589371))

(declare-fun m!589385 () Bool)

(assert (=> b!613593 m!589385))

(assert (=> b!613593 m!589357))

(declare-fun m!589387 () Bool)

(assert (=> start!55944 m!589387))

(declare-fun m!589389 () Bool)

(assert (=> start!55944 m!589389))

(declare-fun m!589391 () Bool)

(assert (=> b!613595 m!589391))

(assert (=> b!613585 m!589357))

(assert (=> b!613585 m!589351))

(declare-fun m!589393 () Bool)

(assert (=> b!613585 m!589393))

(assert (=> b!613601 m!589357))

(assert (=> b!613601 m!589357))

(declare-fun m!589395 () Bool)

(assert (=> b!613601 m!589395))

(assert (=> b!613581 m!589357))

(assert (=> b!613581 m!589357))

(declare-fun m!589397 () Bool)

(assert (=> b!613581 m!589397))

(declare-fun m!589399 () Bool)

(assert (=> b!613596 m!589399))

(declare-fun m!589401 () Bool)

(assert (=> b!613587 m!589401))

(assert (=> b!613587 m!589357))

(assert (=> b!613587 m!589357))

(declare-fun m!589403 () Bool)

(assert (=> b!613587 m!589403))

(assert (=> b!613583 m!589357))

(assert (=> b!613583 m!589357))

(assert (=> b!613583 m!589395))

(declare-fun m!589405 () Bool)

(assert (=> b!613598 m!589405))

(declare-fun m!589407 () Bool)

(assert (=> b!613598 m!589407))

(assert (=> b!613598 m!589357))

(declare-fun m!589409 () Bool)

(assert (=> b!613598 m!589409))

(assert (=> b!613598 m!589357))

(declare-fun m!589411 () Bool)

(assert (=> b!613598 m!589411))

(assert (=> b!613598 m!589351))

(declare-fun m!589413 () Bool)

(assert (=> b!613598 m!589413))

(declare-fun m!589415 () Bool)

(assert (=> b!613598 m!589415))

(declare-fun m!589417 () Bool)

(assert (=> b!613592 m!589417))

(check-sat (not b!613592) (not b!613595) (not b!613597) (not b!613588) (not b!613606) (not b!613589) (not b!613581) (not b!613596) (not b!613583) (not start!55944) (not b!613594) (not b!613601) (not b!613605) (not b!613598) (not b!613593) (not b!613584) (not b!613587))
(check-sat)
