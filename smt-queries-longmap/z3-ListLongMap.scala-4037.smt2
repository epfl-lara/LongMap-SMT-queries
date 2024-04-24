; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55062 () Bool)

(assert start!55062)

(declare-fun b!602410 () Bool)

(declare-fun e!344529 () Bool)

(declare-fun e!344524 () Bool)

(assert (=> b!602410 (= e!344529 e!344524)))

(declare-fun res!386775 () Bool)

(assert (=> b!602410 (=> (not res!386775) (not e!344524))))

(declare-datatypes ((SeekEntryResult!6232 0))(
  ( (MissingZero!6232 (index!27188 (_ BitVec 32))) (Found!6232 (index!27189 (_ BitVec 32))) (Intermediate!6232 (undefined!7044 Bool) (index!27190 (_ BitVec 32)) (x!56139 (_ BitVec 32))) (Undefined!6232) (MissingVacant!6232 (index!27191 (_ BitVec 32))) )
))
(declare-fun lt!274348 () SeekEntryResult!6232)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!602410 (= res!386775 (or (= lt!274348 (MissingZero!6232 i!1108)) (= lt!274348 (MissingVacant!6232 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!37161 0))(
  ( (array!37162 (arr!17836 (Array (_ BitVec 32) (_ BitVec 64))) (size!18200 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37161)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37161 (_ BitVec 32)) SeekEntryResult!6232)

(assert (=> b!602410 (= lt!274348 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!602411 () Bool)

(declare-fun e!344526 () Bool)

(declare-fun e!344523 () Bool)

(assert (=> b!602411 (= e!344526 e!344523)))

(declare-fun res!386773 () Bool)

(assert (=> b!602411 (=> (not res!386773) (not e!344523))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!274346 () SeekEntryResult!6232)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!602411 (= res!386773 (and (= lt!274346 (Found!6232 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17836 a!2986) index!984) (select (arr!17836 a!2986) j!136))) (not (= (select (arr!17836 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37161 (_ BitVec 32)) SeekEntryResult!6232)

(assert (=> b!602411 (= lt!274346 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17836 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!602412 () Bool)

(declare-datatypes ((Unit!19045 0))(
  ( (Unit!19046) )
))
(declare-fun e!344531 () Unit!19045)

(declare-fun Unit!19047 () Unit!19045)

(assert (=> b!602412 (= e!344531 Unit!19047)))

(declare-fun lt!274349 () array!37161)

(declare-fun lt!274353 () Unit!19045)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37161 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19045)

(assert (=> b!602412 (= lt!274353 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!274349 (select (arr!17836 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun arrayContainsKey!0 (array!37161 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!602412 (arrayContainsKey!0 lt!274349 (select (arr!17836 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!274354 () Unit!19045)

(declare-datatypes ((List!11784 0))(
  ( (Nil!11781) (Cons!11780 (h!12828 (_ BitVec 64)) (t!18004 List!11784)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37161 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11784) Unit!19045)

(assert (=> b!602412 (= lt!274354 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11781))))

(declare-fun arrayNoDuplicates!0 (array!37161 (_ BitVec 32) List!11784) Bool)

(assert (=> b!602412 (arrayNoDuplicates!0 lt!274349 #b00000000000000000000000000000000 Nil!11781)))

(declare-fun lt!274359 () Unit!19045)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37161 (_ BitVec 32) (_ BitVec 32)) Unit!19045)

(assert (=> b!602412 (= lt!274359 (lemmaNoDuplicateFromThenFromBigger!0 lt!274349 #b00000000000000000000000000000000 j!136))))

(assert (=> b!602412 (arrayNoDuplicates!0 lt!274349 j!136 Nil!11781)))

(declare-fun lt!274352 () Unit!19045)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37161 (_ BitVec 64) (_ BitVec 32) List!11784) Unit!19045)

(assert (=> b!602412 (= lt!274352 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!274349 (select (arr!17836 a!2986) j!136) j!136 Nil!11781))))

(assert (=> b!602412 false))

(declare-fun b!602413 () Bool)

(declare-fun e!344527 () Bool)

(declare-fun e!344520 () Bool)

(assert (=> b!602413 (= e!344527 e!344520)))

(declare-fun res!386777 () Bool)

(assert (=> b!602413 (=> res!386777 e!344520)))

(assert (=> b!602413 (= res!386777 (bvsge index!984 j!136))))

(declare-fun lt!274356 () Unit!19045)

(assert (=> b!602413 (= lt!274356 e!344531)))

(declare-fun c!68189 () Bool)

(assert (=> b!602413 (= c!68189 (bvslt j!136 index!984))))

(declare-fun b!602414 () Bool)

(declare-fun e!344528 () Unit!19045)

(declare-fun Unit!19048 () Unit!19045)

(assert (=> b!602414 (= e!344528 Unit!19048)))

(declare-fun b!602415 () Bool)

(assert (=> b!602415 (= e!344524 e!344526)))

(declare-fun res!386779 () Bool)

(assert (=> b!602415 (=> (not res!386779) (not e!344526))))

(assert (=> b!602415 (= res!386779 (= (select (store (arr!17836 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!602415 (= lt!274349 (array!37162 (store (arr!17836 a!2986) i!1108 k0!1786) (size!18200 a!2986)))))

(declare-fun b!602416 () Bool)

(declare-fun e!344521 () Bool)

(declare-fun e!344530 () Bool)

(assert (=> b!602416 (= e!344521 e!344530)))

(declare-fun res!386781 () Bool)

(assert (=> b!602416 (=> (not res!386781) (not e!344530))))

(assert (=> b!602416 (= res!386781 (arrayContainsKey!0 lt!274349 (select (arr!17836 a!2986) j!136) j!136))))

(declare-fun b!602417 () Bool)

(declare-fun Unit!19049 () Unit!19045)

(assert (=> b!602417 (= e!344528 Unit!19049)))

(assert (=> b!602417 false))

(declare-fun b!602418 () Bool)

(declare-fun res!386787 () Bool)

(assert (=> b!602418 (=> (not res!386787) (not e!344524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37161 (_ BitVec 32)) Bool)

(assert (=> b!602418 (= res!386787 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!602419 () Bool)

(declare-fun res!386788 () Bool)

(assert (=> b!602419 (=> (not res!386788) (not e!344529))))

(assert (=> b!602419 (= res!386788 (and (= (size!18200 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18200 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18200 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!602420 () Bool)

(declare-fun Unit!19050 () Unit!19045)

(assert (=> b!602420 (= e!344531 Unit!19050)))

(declare-fun res!386786 () Bool)

(assert (=> start!55062 (=> (not res!386786) (not e!344529))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55062 (= res!386786 (validMask!0 mask!3053))))

(assert (=> start!55062 e!344529))

(assert (=> start!55062 true))

(declare-fun array_inv!13695 (array!37161) Bool)

(assert (=> start!55062 (array_inv!13695 a!2986)))

(declare-fun b!602421 () Bool)

(declare-fun res!386784 () Bool)

(assert (=> b!602421 (=> (not res!386784) (not e!344529))))

(assert (=> b!602421 (= res!386784 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!602422 () Bool)

(declare-fun res!386785 () Bool)

(assert (=> b!602422 (=> (not res!386785) (not e!344529))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!602422 (= res!386785 (validKeyInArray!0 (select (arr!17836 a!2986) j!136)))))

(declare-fun b!602423 () Bool)

(declare-fun e!344525 () Bool)

(assert (=> b!602423 (= e!344525 e!344527)))

(declare-fun res!386782 () Bool)

(assert (=> b!602423 (=> res!386782 e!344527)))

(declare-fun lt!274358 () (_ BitVec 64))

(declare-fun lt!274360 () (_ BitVec 64))

(assert (=> b!602423 (= res!386782 (or (not (= (select (arr!17836 a!2986) j!136) lt!274360)) (not (= (select (arr!17836 a!2986) j!136) lt!274358))))))

(declare-fun e!344522 () Bool)

(assert (=> b!602423 e!344522))

(declare-fun res!386772 () Bool)

(assert (=> b!602423 (=> (not res!386772) (not e!344522))))

(assert (=> b!602423 (= res!386772 (= lt!274358 (select (arr!17836 a!2986) j!136)))))

(assert (=> b!602423 (= lt!274358 (select (store (arr!17836 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!602424 () Bool)

(assert (=> b!602424 (= e!344523 (not e!344525))))

(declare-fun res!386774 () Bool)

(assert (=> b!602424 (=> res!386774 e!344525)))

(declare-fun lt!274355 () SeekEntryResult!6232)

(assert (=> b!602424 (= res!386774 (not (= lt!274355 (Found!6232 index!984))))))

(declare-fun lt!274347 () Unit!19045)

(assert (=> b!602424 (= lt!274347 e!344528)))

(declare-fun c!68188 () Bool)

(assert (=> b!602424 (= c!68188 (= lt!274355 Undefined!6232))))

(assert (=> b!602424 (= lt!274355 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!274360 lt!274349 mask!3053))))

(declare-fun e!344519 () Bool)

(assert (=> b!602424 e!344519))

(declare-fun res!386771 () Bool)

(assert (=> b!602424 (=> (not res!386771) (not e!344519))))

(declare-fun lt!274350 () SeekEntryResult!6232)

(declare-fun lt!274351 () (_ BitVec 32))

(assert (=> b!602424 (= res!386771 (= lt!274350 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274351 vacantSpotIndex!68 lt!274360 lt!274349 mask!3053)))))

(assert (=> b!602424 (= lt!274350 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274351 vacantSpotIndex!68 (select (arr!17836 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!602424 (= lt!274360 (select (store (arr!17836 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!274357 () Unit!19045)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37161 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19045)

(assert (=> b!602424 (= lt!274357 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!274351 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!602424 (= lt!274351 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!602425 () Bool)

(declare-fun res!386780 () Bool)

(assert (=> b!602425 (=> (not res!386780) (not e!344529))))

(assert (=> b!602425 (= res!386780 (validKeyInArray!0 k0!1786))))

(declare-fun b!602426 () Bool)

(assert (=> b!602426 (= e!344519 (= lt!274346 lt!274350))))

(declare-fun b!602427 () Bool)

(declare-fun res!386783 () Bool)

(assert (=> b!602427 (=> (not res!386783) (not e!344524))))

(assert (=> b!602427 (= res!386783 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11781))))

(declare-fun b!602428 () Bool)

(declare-fun res!386778 () Bool)

(assert (=> b!602428 (=> (not res!386778) (not e!344524))))

(assert (=> b!602428 (= res!386778 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17836 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!602429 () Bool)

(assert (=> b!602429 (= e!344520 (bvslt index!984 (size!18200 a!2986)))))

(assert (=> b!602429 (arrayContainsKey!0 lt!274349 (select (arr!17836 a!2986) j!136) j!136)))

(declare-fun b!602430 () Bool)

(assert (=> b!602430 (= e!344530 (arrayContainsKey!0 lt!274349 (select (arr!17836 a!2986) j!136) index!984))))

(declare-fun b!602431 () Bool)

(assert (=> b!602431 (= e!344522 e!344521)))

(declare-fun res!386776 () Bool)

(assert (=> b!602431 (=> res!386776 e!344521)))

(assert (=> b!602431 (= res!386776 (or (not (= (select (arr!17836 a!2986) j!136) lt!274360)) (not (= (select (arr!17836 a!2986) j!136) lt!274358)) (bvsge j!136 index!984)))))

(assert (= (and start!55062 res!386786) b!602419))

(assert (= (and b!602419 res!386788) b!602422))

(assert (= (and b!602422 res!386785) b!602425))

(assert (= (and b!602425 res!386780) b!602421))

(assert (= (and b!602421 res!386784) b!602410))

(assert (= (and b!602410 res!386775) b!602418))

(assert (= (and b!602418 res!386787) b!602427))

(assert (= (and b!602427 res!386783) b!602428))

(assert (= (and b!602428 res!386778) b!602415))

(assert (= (and b!602415 res!386779) b!602411))

(assert (= (and b!602411 res!386773) b!602424))

(assert (= (and b!602424 res!386771) b!602426))

(assert (= (and b!602424 c!68188) b!602417))

(assert (= (and b!602424 (not c!68188)) b!602414))

(assert (= (and b!602424 (not res!386774)) b!602423))

(assert (= (and b!602423 res!386772) b!602431))

(assert (= (and b!602431 (not res!386776)) b!602416))

(assert (= (and b!602416 res!386781) b!602430))

(assert (= (and b!602423 (not res!386782)) b!602413))

(assert (= (and b!602413 c!68189) b!602412))

(assert (= (and b!602413 (not c!68189)) b!602420))

(assert (= (and b!602413 (not res!386777)) b!602429))

(declare-fun m!579779 () Bool)

(assert (=> b!602425 m!579779))

(declare-fun m!579781 () Bool)

(assert (=> b!602418 m!579781))

(declare-fun m!579783 () Bool)

(assert (=> b!602416 m!579783))

(assert (=> b!602416 m!579783))

(declare-fun m!579785 () Bool)

(assert (=> b!602416 m!579785))

(declare-fun m!579787 () Bool)

(assert (=> b!602411 m!579787))

(assert (=> b!602411 m!579783))

(assert (=> b!602411 m!579783))

(declare-fun m!579789 () Bool)

(assert (=> b!602411 m!579789))

(declare-fun m!579791 () Bool)

(assert (=> b!602427 m!579791))

(assert (=> b!602423 m!579783))

(declare-fun m!579793 () Bool)

(assert (=> b!602423 m!579793))

(declare-fun m!579795 () Bool)

(assert (=> b!602423 m!579795))

(declare-fun m!579797 () Bool)

(assert (=> b!602428 m!579797))

(assert (=> b!602415 m!579793))

(declare-fun m!579799 () Bool)

(assert (=> b!602415 m!579799))

(assert (=> b!602422 m!579783))

(assert (=> b!602422 m!579783))

(declare-fun m!579801 () Bool)

(assert (=> b!602422 m!579801))

(assert (=> b!602430 m!579783))

(assert (=> b!602430 m!579783))

(declare-fun m!579803 () Bool)

(assert (=> b!602430 m!579803))

(declare-fun m!579805 () Bool)

(assert (=> start!55062 m!579805))

(declare-fun m!579807 () Bool)

(assert (=> start!55062 m!579807))

(declare-fun m!579809 () Bool)

(assert (=> b!602410 m!579809))

(assert (=> b!602429 m!579783))

(assert (=> b!602429 m!579783))

(assert (=> b!602429 m!579785))

(assert (=> b!602431 m!579783))

(assert (=> b!602412 m!579783))

(declare-fun m!579811 () Bool)

(assert (=> b!602412 m!579811))

(assert (=> b!602412 m!579783))

(declare-fun m!579813 () Bool)

(assert (=> b!602412 m!579813))

(assert (=> b!602412 m!579783))

(declare-fun m!579815 () Bool)

(assert (=> b!602412 m!579815))

(declare-fun m!579817 () Bool)

(assert (=> b!602412 m!579817))

(declare-fun m!579819 () Bool)

(assert (=> b!602412 m!579819))

(assert (=> b!602412 m!579783))

(declare-fun m!579821 () Bool)

(assert (=> b!602412 m!579821))

(declare-fun m!579823 () Bool)

(assert (=> b!602412 m!579823))

(declare-fun m!579825 () Bool)

(assert (=> b!602424 m!579825))

(declare-fun m!579827 () Bool)

(assert (=> b!602424 m!579827))

(declare-fun m!579829 () Bool)

(assert (=> b!602424 m!579829))

(declare-fun m!579831 () Bool)

(assert (=> b!602424 m!579831))

(assert (=> b!602424 m!579793))

(declare-fun m!579833 () Bool)

(assert (=> b!602424 m!579833))

(assert (=> b!602424 m!579783))

(assert (=> b!602424 m!579783))

(declare-fun m!579835 () Bool)

(assert (=> b!602424 m!579835))

(declare-fun m!579837 () Bool)

(assert (=> b!602421 m!579837))

(check-sat (not start!55062) (not b!602418) (not b!602422) (not b!602430) (not b!602421) (not b!602410) (not b!602416) (not b!602412) (not b!602424) (not b!602427) (not b!602425) (not b!602429) (not b!602411))
(check-sat)
