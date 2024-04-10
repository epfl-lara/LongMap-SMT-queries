; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57918 () Bool)

(assert start!57918)

(declare-fun b!640544 () Bool)

(declare-fun res!414801 () Bool)

(declare-fun e!366683 () Bool)

(assert (=> b!640544 (=> (not res!414801) (not e!366683))))

(declare-datatypes ((array!38345 0))(
  ( (array!38346 (arr!18392 (Array (_ BitVec 32) (_ BitVec 64))) (size!18756 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38345)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38345 (_ BitVec 32)) Bool)

(assert (=> b!640544 (= res!414801 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!640545 () Bool)

(declare-fun e!366676 () Bool)

(declare-fun e!366673 () Bool)

(assert (=> b!640545 (= e!366676 (not e!366673))))

(declare-fun res!414804 () Bool)

(assert (=> b!640545 (=> res!414804 e!366673)))

(declare-datatypes ((SeekEntryResult!6832 0))(
  ( (MissingZero!6832 (index!29648 (_ BitVec 32))) (Found!6832 (index!29649 (_ BitVec 32))) (Intermediate!6832 (undefined!7644 Bool) (index!29650 (_ BitVec 32)) (x!58404 (_ BitVec 32))) (Undefined!6832) (MissingVacant!6832 (index!29651 (_ BitVec 32))) )
))
(declare-fun lt!296465 () SeekEntryResult!6832)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!640545 (= res!414804 (not (= lt!296465 (Found!6832 index!984))))))

(declare-datatypes ((Unit!21662 0))(
  ( (Unit!21663) )
))
(declare-fun lt!296468 () Unit!21662)

(declare-fun e!366680 () Unit!21662)

(assert (=> b!640545 (= lt!296468 e!366680)))

(declare-fun c!73241 () Bool)

(assert (=> b!640545 (= c!73241 (= lt!296465 Undefined!6832))))

(declare-fun lt!296471 () array!38345)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!296472 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38345 (_ BitVec 32)) SeekEntryResult!6832)

(assert (=> b!640545 (= lt!296465 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!296472 lt!296471 mask!3053))))

(declare-fun e!366678 () Bool)

(assert (=> b!640545 e!366678))

(declare-fun res!414808 () Bool)

(assert (=> b!640545 (=> (not res!414808) (not e!366678))))

(declare-fun lt!296476 () SeekEntryResult!6832)

(declare-fun lt!296466 () (_ BitVec 32))

(assert (=> b!640545 (= res!414808 (= lt!296476 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296466 vacantSpotIndex!68 lt!296472 lt!296471 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!640545 (= lt!296476 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296466 vacantSpotIndex!68 (select (arr!18392 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!640545 (= lt!296472 (select (store (arr!18392 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!296464 () Unit!21662)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38345 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21662)

(assert (=> b!640545 (= lt!296464 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!296466 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!640545 (= lt!296466 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!640546 () Bool)

(declare-fun e!366682 () Bool)

(assert (=> b!640546 (= e!366673 e!366682)))

(declare-fun res!414796 () Bool)

(assert (=> b!640546 (=> res!414796 e!366682)))

(declare-fun lt!296470 () (_ BitVec 64))

(assert (=> b!640546 (= res!414796 (or (not (= (select (arr!18392 a!2986) j!136) lt!296472)) (not (= (select (arr!18392 a!2986) j!136) lt!296470)) (bvsge j!136 index!984)))))

(declare-fun e!366675 () Bool)

(assert (=> b!640546 e!366675))

(declare-fun res!414803 () Bool)

(assert (=> b!640546 (=> (not res!414803) (not e!366675))))

(assert (=> b!640546 (= res!414803 (= lt!296470 (select (arr!18392 a!2986) j!136)))))

(assert (=> b!640546 (= lt!296470 (select (store (arr!18392 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!640547 () Bool)

(declare-fun e!366684 () Bool)

(assert (=> b!640547 (= e!366684 e!366676)))

(declare-fun res!414807 () Bool)

(assert (=> b!640547 (=> (not res!414807) (not e!366676))))

(declare-fun lt!296473 () SeekEntryResult!6832)

(assert (=> b!640547 (= res!414807 (and (= lt!296473 (Found!6832 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18392 a!2986) index!984) (select (arr!18392 a!2986) j!136))) (not (= (select (arr!18392 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!640547 (= lt!296473 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18392 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!640548 () Bool)

(assert (=> b!640548 (= e!366683 e!366684)))

(declare-fun res!414809 () Bool)

(assert (=> b!640548 (=> (not res!414809) (not e!366684))))

(assert (=> b!640548 (= res!414809 (= (select (store (arr!18392 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!640548 (= lt!296471 (array!38346 (store (arr!18392 a!2986) i!1108 k!1786) (size!18756 a!2986)))))

(declare-fun b!640549 () Bool)

(declare-fun res!414805 () Bool)

(assert (=> b!640549 (=> (not res!414805) (not e!366683))))

(assert (=> b!640549 (= res!414805 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18392 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!640550 () Bool)

(declare-fun res!414802 () Bool)

(declare-fun e!366681 () Bool)

(assert (=> b!640550 (=> (not res!414802) (not e!366681))))

(declare-fun arrayContainsKey!0 (array!38345 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!640550 (= res!414802 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!640551 () Bool)

(declare-fun res!414798 () Bool)

(assert (=> b!640551 (=> (not res!414798) (not e!366683))))

(declare-datatypes ((List!12433 0))(
  ( (Nil!12430) (Cons!12429 (h!13474 (_ BitVec 64)) (t!18661 List!12433)) )
))
(declare-fun arrayNoDuplicates!0 (array!38345 (_ BitVec 32) List!12433) Bool)

(assert (=> b!640551 (= res!414798 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12430))))

(declare-fun b!640552 () Bool)

(declare-fun Unit!21664 () Unit!21662)

(assert (=> b!640552 (= e!366680 Unit!21664)))

(declare-fun b!640554 () Bool)

(declare-fun res!414811 () Bool)

(assert (=> b!640554 (=> (not res!414811) (not e!366681))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!640554 (= res!414811 (validKeyInArray!0 k!1786))))

(declare-fun b!640555 () Bool)

(assert (=> b!640555 (= e!366681 e!366683)))

(declare-fun res!414797 () Bool)

(assert (=> b!640555 (=> (not res!414797) (not e!366683))))

(declare-fun lt!296474 () SeekEntryResult!6832)

(assert (=> b!640555 (= res!414797 (or (= lt!296474 (MissingZero!6832 i!1108)) (= lt!296474 (MissingVacant!6832 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38345 (_ BitVec 32)) SeekEntryResult!6832)

(assert (=> b!640555 (= lt!296474 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!640556 () Bool)

(declare-fun res!414806 () Bool)

(assert (=> b!640556 (=> (not res!414806) (not e!366681))))

(assert (=> b!640556 (= res!414806 (and (= (size!18756 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18756 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18756 a!2986)) (not (= i!1108 j!136))))))

(declare-fun e!366674 () Bool)

(declare-fun b!640557 () Bool)

(assert (=> b!640557 (= e!366674 (arrayContainsKey!0 lt!296471 (select (arr!18392 a!2986) j!136) index!984))))

(declare-fun b!640558 () Bool)

(declare-fun res!414812 () Bool)

(assert (=> b!640558 (=> (not res!414812) (not e!366681))))

(assert (=> b!640558 (= res!414812 (validKeyInArray!0 (select (arr!18392 a!2986) j!136)))))

(declare-fun b!640559 () Bool)

(assert (=> b!640559 (= e!366682 true)))

(assert (=> b!640559 (arrayNoDuplicates!0 lt!296471 j!136 Nil!12430)))

(declare-fun lt!296469 () Unit!21662)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38345 (_ BitVec 32) (_ BitVec 32)) Unit!21662)

(assert (=> b!640559 (= lt!296469 (lemmaNoDuplicateFromThenFromBigger!0 lt!296471 #b00000000000000000000000000000000 j!136))))

(assert (=> b!640559 (arrayNoDuplicates!0 lt!296471 #b00000000000000000000000000000000 Nil!12430)))

(declare-fun lt!296467 () Unit!21662)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38345 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12433) Unit!21662)

(assert (=> b!640559 (= lt!296467 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12430))))

(assert (=> b!640559 (arrayContainsKey!0 lt!296471 (select (arr!18392 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!296475 () Unit!21662)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38345 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21662)

(assert (=> b!640559 (= lt!296475 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!296471 (select (arr!18392 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!640560 () Bool)

(assert (=> b!640560 (= e!366678 (= lt!296473 lt!296476))))

(declare-fun b!640561 () Bool)

(declare-fun e!366679 () Bool)

(assert (=> b!640561 (= e!366675 e!366679)))

(declare-fun res!414810 () Bool)

(assert (=> b!640561 (=> res!414810 e!366679)))

(assert (=> b!640561 (= res!414810 (or (not (= (select (arr!18392 a!2986) j!136) lt!296472)) (not (= (select (arr!18392 a!2986) j!136) lt!296470)) (bvsge j!136 index!984)))))

(declare-fun b!640562 () Bool)

(assert (=> b!640562 (= e!366679 e!366674)))

(declare-fun res!414799 () Bool)

(assert (=> b!640562 (=> (not res!414799) (not e!366674))))

(assert (=> b!640562 (= res!414799 (arrayContainsKey!0 lt!296471 (select (arr!18392 a!2986) j!136) j!136))))

(declare-fun res!414800 () Bool)

(assert (=> start!57918 (=> (not res!414800) (not e!366681))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57918 (= res!414800 (validMask!0 mask!3053))))

(assert (=> start!57918 e!366681))

(assert (=> start!57918 true))

(declare-fun array_inv!14188 (array!38345) Bool)

(assert (=> start!57918 (array_inv!14188 a!2986)))

(declare-fun b!640553 () Bool)

(declare-fun Unit!21665 () Unit!21662)

(assert (=> b!640553 (= e!366680 Unit!21665)))

(assert (=> b!640553 false))

(assert (= (and start!57918 res!414800) b!640556))

(assert (= (and b!640556 res!414806) b!640558))

(assert (= (and b!640558 res!414812) b!640554))

(assert (= (and b!640554 res!414811) b!640550))

(assert (= (and b!640550 res!414802) b!640555))

(assert (= (and b!640555 res!414797) b!640544))

(assert (= (and b!640544 res!414801) b!640551))

(assert (= (and b!640551 res!414798) b!640549))

(assert (= (and b!640549 res!414805) b!640548))

(assert (= (and b!640548 res!414809) b!640547))

(assert (= (and b!640547 res!414807) b!640545))

(assert (= (and b!640545 res!414808) b!640560))

(assert (= (and b!640545 c!73241) b!640553))

(assert (= (and b!640545 (not c!73241)) b!640552))

(assert (= (and b!640545 (not res!414804)) b!640546))

(assert (= (and b!640546 res!414803) b!640561))

(assert (= (and b!640561 (not res!414810)) b!640562))

(assert (= (and b!640562 res!414799) b!640557))

(assert (= (and b!640546 (not res!414796)) b!640559))

(declare-fun m!614377 () Bool)

(assert (=> b!640544 m!614377))

(declare-fun m!614379 () Bool)

(assert (=> b!640558 m!614379))

(assert (=> b!640558 m!614379))

(declare-fun m!614381 () Bool)

(assert (=> b!640558 m!614381))

(declare-fun m!614383 () Bool)

(assert (=> b!640554 m!614383))

(declare-fun m!614385 () Bool)

(assert (=> b!640548 m!614385))

(declare-fun m!614387 () Bool)

(assert (=> b!640548 m!614387))

(assert (=> b!640562 m!614379))

(assert (=> b!640562 m!614379))

(declare-fun m!614389 () Bool)

(assert (=> b!640562 m!614389))

(declare-fun m!614391 () Bool)

(assert (=> b!640547 m!614391))

(assert (=> b!640547 m!614379))

(assert (=> b!640547 m!614379))

(declare-fun m!614393 () Bool)

(assert (=> b!640547 m!614393))

(declare-fun m!614395 () Bool)

(assert (=> b!640545 m!614395))

(declare-fun m!614397 () Bool)

(assert (=> b!640545 m!614397))

(declare-fun m!614399 () Bool)

(assert (=> b!640545 m!614399))

(declare-fun m!614401 () Bool)

(assert (=> b!640545 m!614401))

(assert (=> b!640545 m!614379))

(assert (=> b!640545 m!614385))

(declare-fun m!614403 () Bool)

(assert (=> b!640545 m!614403))

(assert (=> b!640545 m!614379))

(declare-fun m!614405 () Bool)

(assert (=> b!640545 m!614405))

(assert (=> b!640546 m!614379))

(assert (=> b!640546 m!614385))

(declare-fun m!614407 () Bool)

(assert (=> b!640546 m!614407))

(declare-fun m!614409 () Bool)

(assert (=> b!640551 m!614409))

(declare-fun m!614411 () Bool)

(assert (=> b!640555 m!614411))

(assert (=> b!640557 m!614379))

(assert (=> b!640557 m!614379))

(declare-fun m!614413 () Bool)

(assert (=> b!640557 m!614413))

(assert (=> b!640561 m!614379))

(assert (=> b!640559 m!614379))

(declare-fun m!614415 () Bool)

(assert (=> b!640559 m!614415))

(declare-fun m!614417 () Bool)

(assert (=> b!640559 m!614417))

(declare-fun m!614419 () Bool)

(assert (=> b!640559 m!614419))

(assert (=> b!640559 m!614379))

(declare-fun m!614421 () Bool)

(assert (=> b!640559 m!614421))

(assert (=> b!640559 m!614379))

(declare-fun m!614423 () Bool)

(assert (=> b!640559 m!614423))

(declare-fun m!614425 () Bool)

(assert (=> b!640559 m!614425))

(declare-fun m!614427 () Bool)

(assert (=> start!57918 m!614427))

(declare-fun m!614429 () Bool)

(assert (=> start!57918 m!614429))

(declare-fun m!614431 () Bool)

(assert (=> b!640550 m!614431))

(declare-fun m!614433 () Bool)

(assert (=> b!640549 m!614433))

(push 1)

