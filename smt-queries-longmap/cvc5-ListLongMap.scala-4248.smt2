; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58874 () Bool)

(assert start!58874)

(declare-fun b!649377 () Bool)

(declare-fun res!420901 () Bool)

(declare-fun e!372476 () Bool)

(assert (=> b!649377 (=> res!420901 e!372476)))

(declare-datatypes ((List!12515 0))(
  ( (Nil!12512) (Cons!12511 (h!13556 (_ BitVec 64)) (t!18743 List!12515)) )
))
(declare-fun noDuplicate!432 (List!12515) Bool)

(assert (=> b!649377 (= res!420901 (not (noDuplicate!432 Nil!12512)))))

(declare-fun b!649378 () Bool)

(declare-fun res!420900 () Bool)

(declare-fun e!372477 () Bool)

(assert (=> b!649378 (=> (not res!420900) (not e!372477))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38536 0))(
  ( (array!38537 (arr!18474 (Array (_ BitVec 32) (_ BitVec 64))) (size!18838 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38536)

(assert (=> b!649378 (= res!420900 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18474 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!649379 () Bool)

(declare-datatypes ((Unit!22110 0))(
  ( (Unit!22111) )
))
(declare-fun e!372462 () Unit!22110)

(declare-fun Unit!22112 () Unit!22110)

(assert (=> b!649379 (= e!372462 Unit!22112)))

(assert (=> b!649379 false))

(declare-fun b!649380 () Bool)

(declare-fun e!372474 () Bool)

(assert (=> b!649380 (= e!372477 e!372474)))

(declare-fun res!420892 () Bool)

(assert (=> b!649380 (=> (not res!420892) (not e!372474))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!649380 (= res!420892 (= (select (store (arr!18474 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!301537 () array!38536)

(assert (=> b!649380 (= lt!301537 (array!38537 (store (arr!18474 a!2986) i!1108 k!1786) (size!18838 a!2986)))))

(declare-fun b!649381 () Bool)

(declare-fun e!372472 () Bool)

(declare-fun e!372475 () Bool)

(assert (=> b!649381 (= e!372472 e!372475)))

(declare-fun res!420898 () Bool)

(assert (=> b!649381 (=> res!420898 e!372475)))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!649381 (= res!420898 (bvsge index!984 j!136))))

(declare-fun lt!301539 () Unit!22110)

(declare-fun e!372463 () Unit!22110)

(assert (=> b!649381 (= lt!301539 e!372463)))

(declare-fun c!74614 () Bool)

(assert (=> b!649381 (= c!74614 (bvslt j!136 index!984))))

(declare-fun b!649382 () Bool)

(declare-fun Unit!22113 () Unit!22110)

(assert (=> b!649382 (= e!372463 Unit!22113)))

(declare-fun b!649383 () Bool)

(declare-fun res!420902 () Bool)

(declare-fun e!372471 () Bool)

(assert (=> b!649383 (=> (not res!420902) (not e!372471))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!649383 (= res!420902 (validKeyInArray!0 (select (arr!18474 a!2986) j!136)))))

(declare-fun b!649384 () Bool)

(declare-fun e!372466 () Bool)

(declare-fun e!372465 () Bool)

(assert (=> b!649384 (= e!372466 e!372465)))

(declare-fun res!420884 () Bool)

(assert (=> b!649384 (=> res!420884 e!372465)))

(declare-fun lt!301538 () (_ BitVec 64))

(declare-fun lt!301536 () (_ BitVec 64))

(assert (=> b!649384 (= res!420884 (or (not (= (select (arr!18474 a!2986) j!136) lt!301536)) (not (= (select (arr!18474 a!2986) j!136) lt!301538)) (bvsge j!136 index!984)))))

(declare-fun b!649385 () Bool)

(assert (=> b!649385 (= e!372475 e!372476)))

(declare-fun res!420903 () Bool)

(assert (=> b!649385 (=> res!420903 e!372476)))

(assert (=> b!649385 (= res!420903 (or (bvsge (size!18838 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18838 a!2986))))))

(declare-fun arrayContainsKey!0 (array!38536 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!649385 (arrayContainsKey!0 lt!301537 (select (arr!18474 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!301532 () Unit!22110)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38536 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22110)

(assert (=> b!649385 (= lt!301532 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301537 (select (arr!18474 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!372473 () Bool)

(assert (=> b!649385 e!372473))

(declare-fun res!420885 () Bool)

(assert (=> b!649385 (=> (not res!420885) (not e!372473))))

(assert (=> b!649385 (= res!420885 (arrayContainsKey!0 lt!301537 (select (arr!18474 a!2986) j!136) j!136))))

(declare-fun res!420897 () Bool)

(assert (=> start!58874 (=> (not res!420897) (not e!372471))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58874 (= res!420897 (validMask!0 mask!3053))))

(assert (=> start!58874 e!372471))

(assert (=> start!58874 true))

(declare-fun array_inv!14270 (array!38536) Bool)

(assert (=> start!58874 (array_inv!14270 a!2986)))

(declare-fun b!649386 () Bool)

(declare-fun e!372464 () Bool)

(declare-datatypes ((SeekEntryResult!6914 0))(
  ( (MissingZero!6914 (index!30003 (_ BitVec 32))) (Found!6914 (index!30004 (_ BitVec 32))) (Intermediate!6914 (undefined!7726 Bool) (index!30005 (_ BitVec 32)) (x!58791 (_ BitVec 32))) (Undefined!6914) (MissingVacant!6914 (index!30006 (_ BitVec 32))) )
))
(declare-fun lt!301544 () SeekEntryResult!6914)

(declare-fun lt!301533 () SeekEntryResult!6914)

(assert (=> b!649386 (= e!372464 (= lt!301544 lt!301533))))

(declare-fun b!649387 () Bool)

(declare-fun res!420887 () Bool)

(assert (=> b!649387 (=> res!420887 e!372476)))

(declare-fun contains!3170 (List!12515 (_ BitVec 64)) Bool)

(assert (=> b!649387 (= res!420887 (contains!3170 Nil!12512 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!649388 () Bool)

(declare-fun Unit!22114 () Unit!22110)

(assert (=> b!649388 (= e!372462 Unit!22114)))

(declare-fun b!649389 () Bool)

(declare-fun e!372468 () Bool)

(assert (=> b!649389 (= e!372468 (arrayContainsKey!0 lt!301537 (select (arr!18474 a!2986) j!136) index!984))))

(declare-fun b!649390 () Bool)

(declare-fun res!420893 () Bool)

(assert (=> b!649390 (=> (not res!420893) (not e!372477))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38536 (_ BitVec 32)) Bool)

(assert (=> b!649390 (= res!420893 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!649391 () Bool)

(declare-fun e!372469 () Bool)

(assert (=> b!649391 (= e!372474 e!372469)))

(declare-fun res!420905 () Bool)

(assert (=> b!649391 (=> (not res!420905) (not e!372469))))

(assert (=> b!649391 (= res!420905 (and (= lt!301544 (Found!6914 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18474 a!2986) index!984) (select (arr!18474 a!2986) j!136))) (not (= (select (arr!18474 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38536 (_ BitVec 32)) SeekEntryResult!6914)

(assert (=> b!649391 (= lt!301544 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18474 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!649392 () Bool)

(declare-fun res!420886 () Bool)

(assert (=> b!649392 (=> (not res!420886) (not e!372471))))

(assert (=> b!649392 (= res!420886 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!649393 () Bool)

(declare-fun res!420883 () Bool)

(assert (=> b!649393 (=> (not res!420883) (not e!372471))))

(assert (=> b!649393 (= res!420883 (validKeyInArray!0 k!1786))))

(declare-fun b!649394 () Bool)

(assert (=> b!649394 (= e!372471 e!372477)))

(declare-fun res!420891 () Bool)

(assert (=> b!649394 (=> (not res!420891) (not e!372477))))

(declare-fun lt!301540 () SeekEntryResult!6914)

(assert (=> b!649394 (= res!420891 (or (= lt!301540 (MissingZero!6914 i!1108)) (= lt!301540 (MissingVacant!6914 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38536 (_ BitVec 32)) SeekEntryResult!6914)

(assert (=> b!649394 (= lt!301540 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!649395 () Bool)

(declare-fun res!420894 () Bool)

(assert (=> b!649395 (=> (not res!420894) (not e!372471))))

(assert (=> b!649395 (= res!420894 (and (= (size!18838 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18838 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18838 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!649396 () Bool)

(declare-fun e!372470 () Bool)

(assert (=> b!649396 (= e!372470 e!372472)))

(declare-fun res!420895 () Bool)

(assert (=> b!649396 (=> res!420895 e!372472)))

(assert (=> b!649396 (= res!420895 (or (not (= (select (arr!18474 a!2986) j!136) lt!301536)) (not (= (select (arr!18474 a!2986) j!136) lt!301538))))))

(assert (=> b!649396 e!372466))

(declare-fun res!420899 () Bool)

(assert (=> b!649396 (=> (not res!420899) (not e!372466))))

(assert (=> b!649396 (= res!420899 (= lt!301538 (select (arr!18474 a!2986) j!136)))))

(assert (=> b!649396 (= lt!301538 (select (store (arr!18474 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!649397 () Bool)

(assert (=> b!649397 (= e!372473 (arrayContainsKey!0 lt!301537 (select (arr!18474 a!2986) j!136) index!984))))

(declare-fun b!649398 () Bool)

(assert (=> b!649398 (= e!372465 e!372468)))

(declare-fun res!420890 () Bool)

(assert (=> b!649398 (=> (not res!420890) (not e!372468))))

(assert (=> b!649398 (= res!420890 (arrayContainsKey!0 lt!301537 (select (arr!18474 a!2986) j!136) j!136))))

(declare-fun b!649399 () Bool)

(assert (=> b!649399 (= e!372469 (not e!372470))))

(declare-fun res!420904 () Bool)

(assert (=> b!649399 (=> res!420904 e!372470)))

(declare-fun lt!301543 () SeekEntryResult!6914)

(assert (=> b!649399 (= res!420904 (not (= lt!301543 (Found!6914 index!984))))))

(declare-fun lt!301542 () Unit!22110)

(assert (=> b!649399 (= lt!301542 e!372462)))

(declare-fun c!74615 () Bool)

(assert (=> b!649399 (= c!74615 (= lt!301543 Undefined!6914))))

(assert (=> b!649399 (= lt!301543 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!301536 lt!301537 mask!3053))))

(assert (=> b!649399 e!372464))

(declare-fun res!420889 () Bool)

(assert (=> b!649399 (=> (not res!420889) (not e!372464))))

(declare-fun lt!301531 () (_ BitVec 32))

(assert (=> b!649399 (= res!420889 (= lt!301533 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301531 vacantSpotIndex!68 lt!301536 lt!301537 mask!3053)))))

(assert (=> b!649399 (= lt!301533 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301531 vacantSpotIndex!68 (select (arr!18474 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!649399 (= lt!301536 (select (store (arr!18474 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!301545 () Unit!22110)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38536 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22110)

(assert (=> b!649399 (= lt!301545 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!301531 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!649399 (= lt!301531 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!649400 () Bool)

(declare-fun res!420888 () Bool)

(assert (=> b!649400 (=> res!420888 e!372476)))

(assert (=> b!649400 (= res!420888 (contains!3170 Nil!12512 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!649401 () Bool)

(declare-fun res!420896 () Bool)

(assert (=> b!649401 (=> (not res!420896) (not e!372477))))

(declare-fun arrayNoDuplicates!0 (array!38536 (_ BitVec 32) List!12515) Bool)

(assert (=> b!649401 (= res!420896 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12512))))

(declare-fun b!649402 () Bool)

(assert (=> b!649402 (= e!372476 true)))

(declare-fun lt!301541 () Bool)

(assert (=> b!649402 (= lt!301541 (contains!3170 Nil!12512 k!1786))))

(declare-fun b!649403 () Bool)

(declare-fun Unit!22115 () Unit!22110)

(assert (=> b!649403 (= e!372463 Unit!22115)))

(declare-fun lt!301535 () Unit!22110)

(assert (=> b!649403 (= lt!301535 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301537 (select (arr!18474 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!649403 (arrayContainsKey!0 lt!301537 (select (arr!18474 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!301530 () Unit!22110)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38536 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12515) Unit!22110)

(assert (=> b!649403 (= lt!301530 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12512))))

(assert (=> b!649403 (arrayNoDuplicates!0 lt!301537 #b00000000000000000000000000000000 Nil!12512)))

(declare-fun lt!301546 () Unit!22110)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38536 (_ BitVec 32) (_ BitVec 32)) Unit!22110)

(assert (=> b!649403 (= lt!301546 (lemmaNoDuplicateFromThenFromBigger!0 lt!301537 #b00000000000000000000000000000000 j!136))))

(assert (=> b!649403 (arrayNoDuplicates!0 lt!301537 j!136 Nil!12512)))

(declare-fun lt!301534 () Unit!22110)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38536 (_ BitVec 64) (_ BitVec 32) List!12515) Unit!22110)

(assert (=> b!649403 (= lt!301534 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!301537 (select (arr!18474 a!2986) j!136) j!136 Nil!12512))))

(assert (=> b!649403 false))

(assert (= (and start!58874 res!420897) b!649395))

(assert (= (and b!649395 res!420894) b!649383))

(assert (= (and b!649383 res!420902) b!649393))

(assert (= (and b!649393 res!420883) b!649392))

(assert (= (and b!649392 res!420886) b!649394))

(assert (= (and b!649394 res!420891) b!649390))

(assert (= (and b!649390 res!420893) b!649401))

(assert (= (and b!649401 res!420896) b!649378))

(assert (= (and b!649378 res!420900) b!649380))

(assert (= (and b!649380 res!420892) b!649391))

(assert (= (and b!649391 res!420905) b!649399))

(assert (= (and b!649399 res!420889) b!649386))

(assert (= (and b!649399 c!74615) b!649379))

(assert (= (and b!649399 (not c!74615)) b!649388))

(assert (= (and b!649399 (not res!420904)) b!649396))

(assert (= (and b!649396 res!420899) b!649384))

(assert (= (and b!649384 (not res!420884)) b!649398))

(assert (= (and b!649398 res!420890) b!649389))

(assert (= (and b!649396 (not res!420895)) b!649381))

(assert (= (and b!649381 c!74614) b!649403))

(assert (= (and b!649381 (not c!74614)) b!649382))

(assert (= (and b!649381 (not res!420898)) b!649385))

(assert (= (and b!649385 res!420885) b!649397))

(assert (= (and b!649385 (not res!420903)) b!649377))

(assert (= (and b!649377 (not res!420901)) b!649387))

(assert (= (and b!649387 (not res!420887)) b!649400))

(assert (= (and b!649400 (not res!420888)) b!649402))

(declare-fun m!622637 () Bool)

(assert (=> b!649391 m!622637))

(declare-fun m!622639 () Bool)

(assert (=> b!649391 m!622639))

(assert (=> b!649391 m!622639))

(declare-fun m!622641 () Bool)

(assert (=> b!649391 m!622641))

(declare-fun m!622643 () Bool)

(assert (=> b!649387 m!622643))

(assert (=> b!649396 m!622639))

(declare-fun m!622645 () Bool)

(assert (=> b!649396 m!622645))

(declare-fun m!622647 () Bool)

(assert (=> b!649396 m!622647))

(declare-fun m!622649 () Bool)

(assert (=> b!649390 m!622649))

(declare-fun m!622651 () Bool)

(assert (=> b!649378 m!622651))

(assert (=> b!649384 m!622639))

(declare-fun m!622653 () Bool)

(assert (=> start!58874 m!622653))

(declare-fun m!622655 () Bool)

(assert (=> start!58874 m!622655))

(assert (=> b!649380 m!622645))

(declare-fun m!622657 () Bool)

(assert (=> b!649380 m!622657))

(declare-fun m!622659 () Bool)

(assert (=> b!649392 m!622659))

(declare-fun m!622661 () Bool)

(assert (=> b!649399 m!622661))

(declare-fun m!622663 () Bool)

(assert (=> b!649399 m!622663))

(declare-fun m!622665 () Bool)

(assert (=> b!649399 m!622665))

(assert (=> b!649399 m!622639))

(assert (=> b!649399 m!622645))

(assert (=> b!649399 m!622639))

(declare-fun m!622667 () Bool)

(assert (=> b!649399 m!622667))

(declare-fun m!622669 () Bool)

(assert (=> b!649399 m!622669))

(declare-fun m!622671 () Bool)

(assert (=> b!649399 m!622671))

(assert (=> b!649383 m!622639))

(assert (=> b!649383 m!622639))

(declare-fun m!622673 () Bool)

(assert (=> b!649383 m!622673))

(declare-fun m!622675 () Bool)

(assert (=> b!649377 m!622675))

(assert (=> b!649403 m!622639))

(declare-fun m!622677 () Bool)

(assert (=> b!649403 m!622677))

(assert (=> b!649403 m!622639))

(assert (=> b!649403 m!622639))

(declare-fun m!622679 () Bool)

(assert (=> b!649403 m!622679))

(declare-fun m!622681 () Bool)

(assert (=> b!649403 m!622681))

(declare-fun m!622683 () Bool)

(assert (=> b!649403 m!622683))

(declare-fun m!622685 () Bool)

(assert (=> b!649403 m!622685))

(assert (=> b!649403 m!622639))

(declare-fun m!622687 () Bool)

(assert (=> b!649403 m!622687))

(declare-fun m!622689 () Bool)

(assert (=> b!649403 m!622689))

(assert (=> b!649397 m!622639))

(assert (=> b!649397 m!622639))

(declare-fun m!622691 () Bool)

(assert (=> b!649397 m!622691))

(declare-fun m!622693 () Bool)

(assert (=> b!649402 m!622693))

(declare-fun m!622695 () Bool)

(assert (=> b!649401 m!622695))

(declare-fun m!622697 () Bool)

(assert (=> b!649400 m!622697))

(assert (=> b!649389 m!622639))

(assert (=> b!649389 m!622639))

(assert (=> b!649389 m!622691))

(assert (=> b!649398 m!622639))

(assert (=> b!649398 m!622639))

(declare-fun m!622699 () Bool)

(assert (=> b!649398 m!622699))

(declare-fun m!622701 () Bool)

(assert (=> b!649394 m!622701))

(assert (=> b!649385 m!622639))

(assert (=> b!649385 m!622639))

(declare-fun m!622703 () Bool)

(assert (=> b!649385 m!622703))

(assert (=> b!649385 m!622639))

(declare-fun m!622705 () Bool)

(assert (=> b!649385 m!622705))

(assert (=> b!649385 m!622639))

(assert (=> b!649385 m!622699))

(declare-fun m!622707 () Bool)

(assert (=> b!649393 m!622707))

(push 1)

