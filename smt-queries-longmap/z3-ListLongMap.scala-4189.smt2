; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57162 () Bool)

(assert start!57162)

(declare-fun b!632516 () Bool)

(declare-fun res!409030 () Bool)

(declare-fun e!361631 () Bool)

(assert (=> b!632516 (=> (not res!409030) (not e!361631))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!38124 0))(
  ( (array!38125 (arr!18292 (Array (_ BitVec 32) (_ BitVec 64))) (size!18656 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38124)

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!632516 (= res!409030 (and (= (size!18656 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18656 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18656 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!632517 () Bool)

(declare-fun e!361630 () Bool)

(assert (=> b!632517 (= e!361631 e!361630)))

(declare-fun res!409032 () Bool)

(assert (=> b!632517 (=> (not res!409032) (not e!361630))))

(declare-datatypes ((SeekEntryResult!6688 0))(
  ( (MissingZero!6688 (index!29045 (_ BitVec 32))) (Found!6688 (index!29046 (_ BitVec 32))) (Intermediate!6688 (undefined!7500 Bool) (index!29047 (_ BitVec 32)) (x!57934 (_ BitVec 32))) (Undefined!6688) (MissingVacant!6688 (index!29048 (_ BitVec 32))) )
))
(declare-fun lt!292319 () SeekEntryResult!6688)

(assert (=> b!632517 (= res!409032 (or (= lt!292319 (MissingZero!6688 i!1108)) (= lt!292319 (MissingVacant!6688 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38124 (_ BitVec 32)) SeekEntryResult!6688)

(assert (=> b!632517 (= lt!292319 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!632518 () Bool)

(declare-fun res!409035 () Bool)

(assert (=> b!632518 (=> (not res!409035) (not e!361630))))

(declare-datatypes ((List!12240 0))(
  ( (Nil!12237) (Cons!12236 (h!13284 (_ BitVec 64)) (t!18460 List!12240)) )
))
(declare-fun arrayNoDuplicates!0 (array!38124 (_ BitVec 32) List!12240) Bool)

(assert (=> b!632518 (= res!409035 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12237))))

(declare-fun b!632519 () Bool)

(declare-datatypes ((Unit!21261 0))(
  ( (Unit!21262) )
))
(declare-fun e!361632 () Unit!21261)

(declare-fun Unit!21263 () Unit!21261)

(assert (=> b!632519 (= e!361632 Unit!21263)))

(assert (=> b!632519 false))

(declare-fun b!632520 () Bool)

(declare-fun e!361628 () Bool)

(assert (=> b!632520 (= e!361628 true)))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!632520 (= (select (store (arr!18292 a!2986) i!1108 k0!1786) index!984) (select (arr!18292 a!2986) j!136))))

(declare-fun res!409027 () Bool)

(assert (=> start!57162 (=> (not res!409027) (not e!361631))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57162 (= res!409027 (validMask!0 mask!3053))))

(assert (=> start!57162 e!361631))

(assert (=> start!57162 true))

(declare-fun array_inv!14151 (array!38124) Bool)

(assert (=> start!57162 (array_inv!14151 a!2986)))

(declare-fun b!632521 () Bool)

(declare-fun e!361633 () Bool)

(declare-fun lt!292313 () SeekEntryResult!6688)

(declare-fun lt!292314 () SeekEntryResult!6688)

(assert (=> b!632521 (= e!361633 (= lt!292313 lt!292314))))

(declare-fun b!632522 () Bool)

(declare-fun res!409028 () Bool)

(assert (=> b!632522 (=> (not res!409028) (not e!361631))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!632522 (= res!409028 (validKeyInArray!0 (select (arr!18292 a!2986) j!136)))))

(declare-fun b!632523 () Bool)

(declare-fun Unit!21264 () Unit!21261)

(assert (=> b!632523 (= e!361632 Unit!21264)))

(declare-fun b!632524 () Bool)

(declare-fun e!361629 () Bool)

(declare-fun e!361635 () Bool)

(assert (=> b!632524 (= e!361629 e!361635)))

(declare-fun res!409039 () Bool)

(assert (=> b!632524 (=> (not res!409039) (not e!361635))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!632524 (= res!409039 (and (= lt!292313 (Found!6688 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18292 a!2986) index!984) (select (arr!18292 a!2986) j!136))) (not (= (select (arr!18292 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38124 (_ BitVec 32)) SeekEntryResult!6688)

(assert (=> b!632524 (= lt!292313 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18292 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!632525 () Bool)

(assert (=> b!632525 (= e!361630 e!361629)))

(declare-fun res!409036 () Bool)

(assert (=> b!632525 (=> (not res!409036) (not e!361629))))

(assert (=> b!632525 (= res!409036 (= (select (store (arr!18292 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!292316 () array!38124)

(assert (=> b!632525 (= lt!292316 (array!38125 (store (arr!18292 a!2986) i!1108 k0!1786) (size!18656 a!2986)))))

(declare-fun b!632526 () Bool)

(declare-fun res!409034 () Bool)

(assert (=> b!632526 (=> (not res!409034) (not e!361630))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38124 (_ BitVec 32)) Bool)

(assert (=> b!632526 (= res!409034 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!632527 () Bool)

(declare-fun res!409029 () Bool)

(assert (=> b!632527 (=> (not res!409029) (not e!361630))))

(assert (=> b!632527 (= res!409029 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18292 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!632528 () Bool)

(assert (=> b!632528 (= e!361635 (not e!361628))))

(declare-fun res!409033 () Bool)

(assert (=> b!632528 (=> res!409033 e!361628)))

(declare-fun lt!292315 () SeekEntryResult!6688)

(assert (=> b!632528 (= res!409033 (not (= lt!292315 (Found!6688 index!984))))))

(declare-fun lt!292320 () Unit!21261)

(assert (=> b!632528 (= lt!292320 e!361632)))

(declare-fun c!72113 () Bool)

(assert (=> b!632528 (= c!72113 (= lt!292315 Undefined!6688))))

(declare-fun lt!292318 () (_ BitVec 64))

(assert (=> b!632528 (= lt!292315 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!292318 lt!292316 mask!3053))))

(assert (=> b!632528 e!361633))

(declare-fun res!409038 () Bool)

(assert (=> b!632528 (=> (not res!409038) (not e!361633))))

(declare-fun lt!292317 () (_ BitVec 32))

(assert (=> b!632528 (= res!409038 (= lt!292314 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292317 vacantSpotIndex!68 lt!292318 lt!292316 mask!3053)))))

(assert (=> b!632528 (= lt!292314 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292317 vacantSpotIndex!68 (select (arr!18292 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!632528 (= lt!292318 (select (store (arr!18292 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!292321 () Unit!21261)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38124 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21261)

(assert (=> b!632528 (= lt!292321 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292317 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!632528 (= lt!292317 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!632529 () Bool)

(declare-fun res!409031 () Bool)

(assert (=> b!632529 (=> (not res!409031) (not e!361631))))

(declare-fun arrayContainsKey!0 (array!38124 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!632529 (= res!409031 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!632530 () Bool)

(declare-fun res!409037 () Bool)

(assert (=> b!632530 (=> (not res!409037) (not e!361631))))

(assert (=> b!632530 (= res!409037 (validKeyInArray!0 k0!1786))))

(assert (= (and start!57162 res!409027) b!632516))

(assert (= (and b!632516 res!409030) b!632522))

(assert (= (and b!632522 res!409028) b!632530))

(assert (= (and b!632530 res!409037) b!632529))

(assert (= (and b!632529 res!409031) b!632517))

(assert (= (and b!632517 res!409032) b!632526))

(assert (= (and b!632526 res!409034) b!632518))

(assert (= (and b!632518 res!409035) b!632527))

(assert (= (and b!632527 res!409029) b!632525))

(assert (= (and b!632525 res!409036) b!632524))

(assert (= (and b!632524 res!409039) b!632528))

(assert (= (and b!632528 res!409038) b!632521))

(assert (= (and b!632528 c!72113) b!632519))

(assert (= (and b!632528 (not c!72113)) b!632523))

(assert (= (and b!632528 (not res!409033)) b!632520))

(declare-fun m!607663 () Bool)

(assert (=> b!632518 m!607663))

(declare-fun m!607665 () Bool)

(assert (=> b!632517 m!607665))

(declare-fun m!607667 () Bool)

(assert (=> b!632524 m!607667))

(declare-fun m!607669 () Bool)

(assert (=> b!632524 m!607669))

(assert (=> b!632524 m!607669))

(declare-fun m!607671 () Bool)

(assert (=> b!632524 m!607671))

(declare-fun m!607673 () Bool)

(assert (=> b!632530 m!607673))

(declare-fun m!607675 () Bool)

(assert (=> b!632529 m!607675))

(declare-fun m!607677 () Bool)

(assert (=> b!632525 m!607677))

(declare-fun m!607679 () Bool)

(assert (=> b!632525 m!607679))

(declare-fun m!607681 () Bool)

(assert (=> start!57162 m!607681))

(declare-fun m!607683 () Bool)

(assert (=> start!57162 m!607683))

(assert (=> b!632522 m!607669))

(assert (=> b!632522 m!607669))

(declare-fun m!607685 () Bool)

(assert (=> b!632522 m!607685))

(declare-fun m!607687 () Bool)

(assert (=> b!632528 m!607687))

(declare-fun m!607689 () Bool)

(assert (=> b!632528 m!607689))

(assert (=> b!632528 m!607669))

(assert (=> b!632528 m!607677))

(assert (=> b!632528 m!607669))

(declare-fun m!607691 () Bool)

(assert (=> b!632528 m!607691))

(declare-fun m!607693 () Bool)

(assert (=> b!632528 m!607693))

(declare-fun m!607695 () Bool)

(assert (=> b!632528 m!607695))

(declare-fun m!607697 () Bool)

(assert (=> b!632528 m!607697))

(declare-fun m!607699 () Bool)

(assert (=> b!632527 m!607699))

(assert (=> b!632520 m!607677))

(declare-fun m!607701 () Bool)

(assert (=> b!632520 m!607701))

(assert (=> b!632520 m!607669))

(declare-fun m!607703 () Bool)

(assert (=> b!632526 m!607703))

(check-sat (not b!632530) (not b!632526) (not b!632524) (not b!632517) (not b!632529) (not b!632528) (not b!632522) (not b!632518) (not start!57162))
(check-sat)
