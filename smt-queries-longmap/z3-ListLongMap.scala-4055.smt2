; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55542 () Bool)

(assert start!55542)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun b!607511 () Bool)

(declare-datatypes ((array!37287 0))(
  ( (array!37288 (arr!17894 (Array (_ BitVec 32) (_ BitVec 64))) (size!18259 (_ BitVec 32))) )
))
(declare-fun lt!277305 () array!37287)

(declare-fun e!347883 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37287)

(declare-fun arrayContainsKey!0 (array!37287 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!607511 (= e!347883 (arrayContainsKey!0 lt!277305 (select (arr!17894 a!2986) j!136) index!984))))

(declare-fun b!607512 () Bool)

(declare-fun e!347895 () Bool)

(assert (=> b!607512 (= e!347895 (arrayContainsKey!0 lt!277305 (select (arr!17894 a!2986) j!136) index!984))))

(declare-fun b!607513 () Bool)

(declare-fun res!390431 () Bool)

(declare-fun e!347882 () Bool)

(assert (=> b!607513 (=> (not res!390431) (not e!347882))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!607513 (= res!390431 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17894 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!607514 () Bool)

(declare-datatypes ((Unit!19368 0))(
  ( (Unit!19369) )
))
(declare-fun e!347880 () Unit!19368)

(declare-fun Unit!19370 () Unit!19368)

(assert (=> b!607514 (= e!347880 Unit!19370)))

(declare-fun b!607515 () Bool)

(declare-fun e!347890 () Bool)

(declare-fun e!347892 () Bool)

(assert (=> b!607515 (= e!347890 e!347892)))

(declare-fun res!390426 () Bool)

(assert (=> b!607515 (=> (not res!390426) (not e!347892))))

(declare-datatypes ((SeekEntryResult!6331 0))(
  ( (MissingZero!6331 (index!27599 (_ BitVec 32))) (Found!6331 (index!27600 (_ BitVec 32))) (Intermediate!6331 (undefined!7143 Bool) (index!27601 (_ BitVec 32)) (x!56419 (_ BitVec 32))) (Undefined!6331) (MissingVacant!6331 (index!27602 (_ BitVec 32))) )
))
(declare-fun lt!277314 () SeekEntryResult!6331)

(assert (=> b!607515 (= res!390426 (and (= lt!277314 (Found!6331 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17894 a!2986) index!984) (select (arr!17894 a!2986) j!136))) (not (= (select (arr!17894 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37287 (_ BitVec 32)) SeekEntryResult!6331)

(assert (=> b!607515 (= lt!277314 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17894 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!607516 () Bool)

(declare-fun Unit!19371 () Unit!19368)

(assert (=> b!607516 (= e!347880 Unit!19371)))

(assert (=> b!607516 false))

(declare-fun b!607517 () Bool)

(declare-fun e!347885 () Bool)

(declare-fun e!347888 () Bool)

(assert (=> b!607517 (= e!347885 e!347888)))

(declare-fun res!390424 () Bool)

(assert (=> b!607517 (=> res!390424 e!347888)))

(declare-fun lt!277308 () (_ BitVec 64))

(declare-fun lt!277313 () (_ BitVec 64))

(assert (=> b!607517 (= res!390424 (or (not (= (select (arr!17894 a!2986) j!136) lt!277313)) (not (= (select (arr!17894 a!2986) j!136) lt!277308)) (bvsge j!136 index!984)))))

(declare-fun b!607518 () Bool)

(declare-fun e!347893 () Bool)

(declare-fun e!347881 () Bool)

(assert (=> b!607518 (= e!347893 e!347881)))

(declare-fun res!390421 () Bool)

(assert (=> b!607518 (=> res!390421 e!347881)))

(assert (=> b!607518 (= res!390421 (bvsge index!984 j!136))))

(declare-fun lt!277310 () Unit!19368)

(declare-fun e!347886 () Unit!19368)

(assert (=> b!607518 (= lt!277310 e!347886)))

(declare-fun c!68913 () Bool)

(assert (=> b!607518 (= c!68913 (bvslt j!136 index!984))))

(declare-fun b!607519 () Bool)

(declare-fun e!347894 () Bool)

(declare-fun lt!277315 () SeekEntryResult!6331)

(assert (=> b!607519 (= e!347894 (= lt!277314 lt!277315))))

(declare-fun res!390439 () Bool)

(declare-fun e!347887 () Bool)

(assert (=> start!55542 (=> (not res!390439) (not e!347887))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55542 (= res!390439 (validMask!0 mask!3053))))

(assert (=> start!55542 e!347887))

(assert (=> start!55542 true))

(declare-fun array_inv!13777 (array!37287) Bool)

(assert (=> start!55542 (array_inv!13777 a!2986)))

(declare-fun b!607520 () Bool)

(declare-fun res!390428 () Bool)

(declare-fun e!347884 () Bool)

(assert (=> b!607520 (=> res!390428 e!347884)))

(declare-datatypes ((List!11974 0))(
  ( (Nil!11971) (Cons!11970 (h!13015 (_ BitVec 64)) (t!18193 List!11974)) )
))
(declare-fun noDuplicate!323 (List!11974) Bool)

(assert (=> b!607520 (= res!390428 (not (noDuplicate!323 Nil!11971)))))

(declare-fun b!607521 () Bool)

(declare-fun res!390436 () Bool)

(assert (=> b!607521 (=> (not res!390436) (not e!347882))))

(declare-fun arrayNoDuplicates!0 (array!37287 (_ BitVec 32) List!11974) Bool)

(assert (=> b!607521 (= res!390436 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11971))))

(declare-fun b!607522 () Bool)

(declare-fun e!347889 () Bool)

(assert (=> b!607522 (= e!347892 (not e!347889))))

(declare-fun res!390435 () Bool)

(assert (=> b!607522 (=> res!390435 e!347889)))

(declare-fun lt!277318 () SeekEntryResult!6331)

(assert (=> b!607522 (= res!390435 (not (= lt!277318 (Found!6331 index!984))))))

(declare-fun lt!277307 () Unit!19368)

(assert (=> b!607522 (= lt!277307 e!347880)))

(declare-fun c!68912 () Bool)

(assert (=> b!607522 (= c!68912 (= lt!277318 Undefined!6331))))

(assert (=> b!607522 (= lt!277318 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!277313 lt!277305 mask!3053))))

(assert (=> b!607522 e!347894))

(declare-fun res!390425 () Bool)

(assert (=> b!607522 (=> (not res!390425) (not e!347894))))

(declare-fun lt!277306 () (_ BitVec 32))

(assert (=> b!607522 (= res!390425 (= lt!277315 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!277306 vacantSpotIndex!68 lt!277313 lt!277305 mask!3053)))))

(assert (=> b!607522 (= lt!277315 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!277306 vacantSpotIndex!68 (select (arr!17894 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!607522 (= lt!277313 (select (store (arr!17894 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!277316 () Unit!19368)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37287 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19368)

(assert (=> b!607522 (= lt!277316 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!277306 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!607522 (= lt!277306 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!607523 () Bool)

(declare-fun res!390440 () Bool)

(assert (=> b!607523 (=> (not res!390440) (not e!347887))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!607523 (= res!390440 (validKeyInArray!0 k0!1786))))

(declare-fun b!607524 () Bool)

(assert (=> b!607524 (= e!347887 e!347882)))

(declare-fun res!390442 () Bool)

(assert (=> b!607524 (=> (not res!390442) (not e!347882))))

(declare-fun lt!277311 () SeekEntryResult!6331)

(assert (=> b!607524 (= res!390442 (or (= lt!277311 (MissingZero!6331 i!1108)) (= lt!277311 (MissingVacant!6331 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37287 (_ BitVec 32)) SeekEntryResult!6331)

(assert (=> b!607524 (= lt!277311 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!607525 () Bool)

(assert (=> b!607525 (= e!347889 e!347893)))

(declare-fun res!390427 () Bool)

(assert (=> b!607525 (=> res!390427 e!347893)))

(assert (=> b!607525 (= res!390427 (or (not (= (select (arr!17894 a!2986) j!136) lt!277313)) (not (= (select (arr!17894 a!2986) j!136) lt!277308))))))

(assert (=> b!607525 e!347885))

(declare-fun res!390430 () Bool)

(assert (=> b!607525 (=> (not res!390430) (not e!347885))))

(assert (=> b!607525 (= res!390430 (= lt!277308 (select (arr!17894 a!2986) j!136)))))

(assert (=> b!607525 (= lt!277308 (select (store (arr!17894 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!607526 () Bool)

(declare-fun res!390433 () Bool)

(assert (=> b!607526 (=> res!390433 e!347884)))

(declare-fun contains!2996 (List!11974 (_ BitVec 64)) Bool)

(assert (=> b!607526 (= res!390433 (contains!2996 Nil!11971 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!607527 () Bool)

(assert (=> b!607527 (= e!347882 e!347890)))

(declare-fun res!390434 () Bool)

(assert (=> b!607527 (=> (not res!390434) (not e!347890))))

(assert (=> b!607527 (= res!390434 (= (select (store (arr!17894 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!607527 (= lt!277305 (array!37288 (store (arr!17894 a!2986) i!1108 k0!1786) (size!18259 a!2986)))))

(declare-fun b!607528 () Bool)

(declare-fun res!390438 () Bool)

(assert (=> b!607528 (=> res!390438 e!347884)))

(assert (=> b!607528 (= res!390438 (contains!2996 Nil!11971 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!607529 () Bool)

(declare-fun res!390443 () Bool)

(assert (=> b!607529 (=> (not res!390443) (not e!347887))))

(assert (=> b!607529 (= res!390443 (validKeyInArray!0 (select (arr!17894 a!2986) j!136)))))

(declare-fun b!607530 () Bool)

(declare-fun res!390422 () Bool)

(assert (=> b!607530 (=> (not res!390422) (not e!347882))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37287 (_ BitVec 32)) Bool)

(assert (=> b!607530 (= res!390422 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!607531 () Bool)

(declare-fun res!390423 () Bool)

(assert (=> b!607531 (=> (not res!390423) (not e!347887))))

(assert (=> b!607531 (= res!390423 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!607532 () Bool)

(declare-fun Unit!19372 () Unit!19368)

(assert (=> b!607532 (= e!347886 Unit!19372)))

(declare-fun lt!277309 () Unit!19368)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37287 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19368)

(assert (=> b!607532 (= lt!277309 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!277305 (select (arr!17894 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!607532 (arrayContainsKey!0 lt!277305 (select (arr!17894 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!277319 () Unit!19368)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37287 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11974) Unit!19368)

(assert (=> b!607532 (= lt!277319 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11971))))

(assert (=> b!607532 (arrayNoDuplicates!0 lt!277305 #b00000000000000000000000000000000 Nil!11971)))

(declare-fun lt!277317 () Unit!19368)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37287 (_ BitVec 32) (_ BitVec 32)) Unit!19368)

(assert (=> b!607532 (= lt!277317 (lemmaNoDuplicateFromThenFromBigger!0 lt!277305 #b00000000000000000000000000000000 j!136))))

(assert (=> b!607532 (arrayNoDuplicates!0 lt!277305 j!136 Nil!11971)))

(declare-fun lt!277312 () Unit!19368)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37287 (_ BitVec 64) (_ BitVec 32) List!11974) Unit!19368)

(assert (=> b!607532 (= lt!277312 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!277305 (select (arr!17894 a!2986) j!136) j!136 Nil!11971))))

(assert (=> b!607532 false))

(declare-fun b!607533 () Bool)

(assert (=> b!607533 (= e!347888 e!347895)))

(declare-fun res!390429 () Bool)

(assert (=> b!607533 (=> (not res!390429) (not e!347895))))

(assert (=> b!607533 (= res!390429 (arrayContainsKey!0 lt!277305 (select (arr!17894 a!2986) j!136) j!136))))

(declare-fun b!607534 () Bool)

(assert (=> b!607534 (= e!347884 true)))

(declare-fun lt!277320 () Bool)

(assert (=> b!607534 (= lt!277320 (contains!2996 Nil!11971 k0!1786))))

(declare-fun b!607535 () Bool)

(declare-fun res!390437 () Bool)

(assert (=> b!607535 (=> (not res!390437) (not e!347887))))

(assert (=> b!607535 (= res!390437 (and (= (size!18259 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18259 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18259 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!607536 () Bool)

(declare-fun Unit!19373 () Unit!19368)

(assert (=> b!607536 (= e!347886 Unit!19373)))

(declare-fun b!607537 () Bool)

(assert (=> b!607537 (= e!347881 e!347884)))

(declare-fun res!390432 () Bool)

(assert (=> b!607537 (=> res!390432 e!347884)))

(assert (=> b!607537 (= res!390432 (or (bvsge (size!18259 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18259 a!2986))))))

(assert (=> b!607537 (arrayContainsKey!0 lt!277305 (select (arr!17894 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!277321 () Unit!19368)

(assert (=> b!607537 (= lt!277321 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!277305 (select (arr!17894 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!607537 e!347883))

(declare-fun res!390441 () Bool)

(assert (=> b!607537 (=> (not res!390441) (not e!347883))))

(assert (=> b!607537 (= res!390441 (arrayContainsKey!0 lt!277305 (select (arr!17894 a!2986) j!136) j!136))))

(assert (= (and start!55542 res!390439) b!607535))

(assert (= (and b!607535 res!390437) b!607529))

(assert (= (and b!607529 res!390443) b!607523))

(assert (= (and b!607523 res!390440) b!607531))

(assert (= (and b!607531 res!390423) b!607524))

(assert (= (and b!607524 res!390442) b!607530))

(assert (= (and b!607530 res!390422) b!607521))

(assert (= (and b!607521 res!390436) b!607513))

(assert (= (and b!607513 res!390431) b!607527))

(assert (= (and b!607527 res!390434) b!607515))

(assert (= (and b!607515 res!390426) b!607522))

(assert (= (and b!607522 res!390425) b!607519))

(assert (= (and b!607522 c!68912) b!607516))

(assert (= (and b!607522 (not c!68912)) b!607514))

(assert (= (and b!607522 (not res!390435)) b!607525))

(assert (= (and b!607525 res!390430) b!607517))

(assert (= (and b!607517 (not res!390424)) b!607533))

(assert (= (and b!607533 res!390429) b!607512))

(assert (= (and b!607525 (not res!390427)) b!607518))

(assert (= (and b!607518 c!68913) b!607532))

(assert (= (and b!607518 (not c!68913)) b!607536))

(assert (= (and b!607518 (not res!390421)) b!607537))

(assert (= (and b!607537 res!390441) b!607511))

(assert (= (and b!607537 (not res!390432)) b!607520))

(assert (= (and b!607520 (not res!390428)) b!607528))

(assert (= (and b!607528 (not res!390438)) b!607526))

(assert (= (and b!607526 (not res!390433)) b!607534))

(declare-fun m!583711 () Bool)

(assert (=> b!607530 m!583711))

(declare-fun m!583713 () Bool)

(assert (=> b!607526 m!583713))

(declare-fun m!583715 () Bool)

(assert (=> b!607529 m!583715))

(assert (=> b!607529 m!583715))

(declare-fun m!583717 () Bool)

(assert (=> b!607529 m!583717))

(declare-fun m!583719 () Bool)

(assert (=> b!607515 m!583719))

(assert (=> b!607515 m!583715))

(assert (=> b!607515 m!583715))

(declare-fun m!583721 () Bool)

(assert (=> b!607515 m!583721))

(declare-fun m!583723 () Bool)

(assert (=> b!607531 m!583723))

(declare-fun m!583725 () Bool)

(assert (=> b!607520 m!583725))

(assert (=> b!607517 m!583715))

(declare-fun m!583727 () Bool)

(assert (=> b!607523 m!583727))

(assert (=> b!607511 m!583715))

(assert (=> b!607511 m!583715))

(declare-fun m!583729 () Bool)

(assert (=> b!607511 m!583729))

(declare-fun m!583731 () Bool)

(assert (=> b!607513 m!583731))

(assert (=> b!607532 m!583715))

(declare-fun m!583733 () Bool)

(assert (=> b!607532 m!583733))

(declare-fun m!583735 () Bool)

(assert (=> b!607532 m!583735))

(assert (=> b!607532 m!583715))

(declare-fun m!583737 () Bool)

(assert (=> b!607532 m!583737))

(assert (=> b!607532 m!583715))

(declare-fun m!583739 () Bool)

(assert (=> b!607532 m!583739))

(declare-fun m!583741 () Bool)

(assert (=> b!607532 m!583741))

(assert (=> b!607532 m!583715))

(declare-fun m!583743 () Bool)

(assert (=> b!607532 m!583743))

(declare-fun m!583745 () Bool)

(assert (=> b!607532 m!583745))

(declare-fun m!583747 () Bool)

(assert (=> b!607524 m!583747))

(declare-fun m!583749 () Bool)

(assert (=> b!607534 m!583749))

(declare-fun m!583751 () Bool)

(assert (=> start!55542 m!583751))

(declare-fun m!583753 () Bool)

(assert (=> start!55542 m!583753))

(declare-fun m!583755 () Bool)

(assert (=> b!607521 m!583755))

(assert (=> b!607537 m!583715))

(assert (=> b!607537 m!583715))

(declare-fun m!583757 () Bool)

(assert (=> b!607537 m!583757))

(assert (=> b!607537 m!583715))

(declare-fun m!583759 () Bool)

(assert (=> b!607537 m!583759))

(assert (=> b!607537 m!583715))

(declare-fun m!583761 () Bool)

(assert (=> b!607537 m!583761))

(declare-fun m!583763 () Bool)

(assert (=> b!607528 m!583763))

(assert (=> b!607525 m!583715))

(declare-fun m!583765 () Bool)

(assert (=> b!607525 m!583765))

(declare-fun m!583767 () Bool)

(assert (=> b!607525 m!583767))

(assert (=> b!607512 m!583715))

(assert (=> b!607512 m!583715))

(assert (=> b!607512 m!583729))

(assert (=> b!607533 m!583715))

(assert (=> b!607533 m!583715))

(assert (=> b!607533 m!583761))

(declare-fun m!583769 () Bool)

(assert (=> b!607522 m!583769))

(declare-fun m!583771 () Bool)

(assert (=> b!607522 m!583771))

(assert (=> b!607522 m!583715))

(assert (=> b!607522 m!583765))

(declare-fun m!583773 () Bool)

(assert (=> b!607522 m!583773))

(assert (=> b!607522 m!583715))

(declare-fun m!583775 () Bool)

(assert (=> b!607522 m!583775))

(declare-fun m!583777 () Bool)

(assert (=> b!607522 m!583777))

(declare-fun m!583779 () Bool)

(assert (=> b!607522 m!583779))

(assert (=> b!607527 m!583765))

(declare-fun m!583781 () Bool)

(assert (=> b!607527 m!583781))

(check-sat (not b!607533) (not b!607529) (not b!607531) (not b!607511) (not b!607528) (not b!607522) (not b!607515) (not b!607532) (not start!55542) (not b!607520) (not b!607530) (not b!607521) (not b!607534) (not b!607512) (not b!607526) (not b!607523) (not b!607524) (not b!607537))
(check-sat)
