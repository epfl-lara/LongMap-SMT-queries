; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59084 () Bool)

(assert start!59084)

(declare-fun b!651653 () Bool)

(declare-fun e!373967 () Bool)

(declare-fun e!373968 () Bool)

(assert (=> b!651653 (= e!373967 e!373968)))

(declare-fun res!422570 () Bool)

(assert (=> b!651653 (=> res!422570 e!373968)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!302984 () (_ BitVec 64))

(declare-fun lt!302978 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38595 0))(
  ( (array!38596 (arr!18500 (Array (_ BitVec 32) (_ BitVec 64))) (size!18865 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38595)

(assert (=> b!651653 (= res!422570 (or (not (= (select (arr!18500 a!2986) j!136) lt!302978)) (not (= (select (arr!18500 a!2986) j!136) lt!302984)) (bvsge j!136 index!984)))))

(declare-fun b!651654 () Bool)

(declare-datatypes ((Unit!22250 0))(
  ( (Unit!22251) )
))
(declare-fun e!373964 () Unit!22250)

(declare-fun Unit!22252 () Unit!22250)

(assert (=> b!651654 (= e!373964 Unit!22252)))

(declare-fun b!651655 () Bool)

(declare-fun res!422577 () Bool)

(declare-fun e!373971 () Bool)

(assert (=> b!651655 (=> (not res!422577) (not e!373971))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38595 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!651655 (= res!422577 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!651656 () Bool)

(declare-fun e!373972 () Bool)

(assert (=> b!651656 (= e!373971 e!373972)))

(declare-fun res!422575 () Bool)

(assert (=> b!651656 (=> (not res!422575) (not e!373972))))

(declare-datatypes ((SeekEntryResult!6937 0))(
  ( (MissingZero!6937 (index!30101 (_ BitVec 32))) (Found!6937 (index!30102 (_ BitVec 32))) (Intermediate!6937 (undefined!7749 Bool) (index!30103 (_ BitVec 32)) (x!58899 (_ BitVec 32))) (Undefined!6937) (MissingVacant!6937 (index!30104 (_ BitVec 32))) )
))
(declare-fun lt!302980 () SeekEntryResult!6937)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!651656 (= res!422575 (or (= lt!302980 (MissingZero!6937 i!1108)) (= lt!302980 (MissingVacant!6937 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38595 (_ BitVec 32)) SeekEntryResult!6937)

(assert (=> b!651656 (= lt!302980 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!651657 () Bool)

(declare-fun e!373969 () Unit!22250)

(declare-fun Unit!22253 () Unit!22250)

(assert (=> b!651657 (= e!373969 Unit!22253)))

(declare-fun b!651658 () Bool)

(declare-fun Unit!22254 () Unit!22250)

(assert (=> b!651658 (= e!373969 Unit!22254)))

(assert (=> b!651658 false))

(declare-fun b!651659 () Bool)

(declare-fun e!373965 () Bool)

(declare-fun lt!302972 () SeekEntryResult!6937)

(declare-fun lt!302975 () SeekEntryResult!6937)

(assert (=> b!651659 (= e!373965 (= lt!302972 lt!302975))))

(declare-fun b!651660 () Bool)

(declare-fun res!422571 () Bool)

(assert (=> b!651660 (=> (not res!422571) (not e!373971))))

(assert (=> b!651660 (= res!422571 (and (= (size!18865 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18865 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18865 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!651661 () Bool)

(declare-fun e!373973 () Bool)

(assert (=> b!651661 (= e!373968 e!373973)))

(declare-fun res!422583 () Bool)

(assert (=> b!651661 (=> (not res!422583) (not e!373973))))

(declare-fun lt!302981 () array!38595)

(assert (=> b!651661 (= res!422583 (arrayContainsKey!0 lt!302981 (select (arr!18500 a!2986) j!136) j!136))))

(declare-fun b!651662 () Bool)

(declare-fun e!373970 () Bool)

(assert (=> b!651662 (= e!373970 true)))

(declare-datatypes ((List!12580 0))(
  ( (Nil!12577) (Cons!12576 (h!13621 (_ BitVec 64)) (t!18799 List!12580)) )
))
(declare-fun arrayNoDuplicates!0 (array!38595 (_ BitVec 32) List!12580) Bool)

(assert (=> b!651662 (arrayNoDuplicates!0 lt!302981 index!984 Nil!12577)))

(declare-fun lt!302973 () Unit!22250)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38595 (_ BitVec 32) (_ BitVec 32)) Unit!22250)

(assert (=> b!651662 (= lt!302973 (lemmaNoDuplicateFromThenFromBigger!0 lt!302981 #b00000000000000000000000000000000 index!984))))

(assert (=> b!651662 (arrayNoDuplicates!0 lt!302981 #b00000000000000000000000000000000 Nil!12577)))

(declare-fun lt!302968 () Unit!22250)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38595 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12580) Unit!22250)

(assert (=> b!651662 (= lt!302968 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12577))))

(assert (=> b!651662 (arrayContainsKey!0 lt!302981 (select (arr!18500 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!302970 () Unit!22250)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38595 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22250)

(assert (=> b!651662 (= lt!302970 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!302981 (select (arr!18500 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!373966 () Bool)

(assert (=> b!651662 e!373966))

(declare-fun res!422586 () Bool)

(assert (=> b!651662 (=> (not res!422586) (not e!373966))))

(assert (=> b!651662 (= res!422586 (arrayContainsKey!0 lt!302981 (select (arr!18500 a!2986) j!136) j!136))))

(declare-fun b!651663 () Bool)

(declare-fun res!422573 () Bool)

(assert (=> b!651663 (=> (not res!422573) (not e!373971))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!651663 (= res!422573 (validKeyInArray!0 k0!1786))))

(declare-fun b!651664 () Bool)

(assert (=> b!651664 (= e!373966 (arrayContainsKey!0 lt!302981 (select (arr!18500 a!2986) j!136) index!984))))

(declare-fun b!651665 () Bool)

(declare-fun e!373975 () Bool)

(declare-fun e!373963 () Bool)

(assert (=> b!651665 (= e!373975 e!373963)))

(declare-fun res!422581 () Bool)

(assert (=> b!651665 (=> res!422581 e!373963)))

(assert (=> b!651665 (= res!422581 (or (not (= (select (arr!18500 a!2986) j!136) lt!302978)) (not (= (select (arr!18500 a!2986) j!136) lt!302984))))))

(assert (=> b!651665 e!373967))

(declare-fun res!422585 () Bool)

(assert (=> b!651665 (=> (not res!422585) (not e!373967))))

(assert (=> b!651665 (= res!422585 (= lt!302984 (select (arr!18500 a!2986) j!136)))))

(assert (=> b!651665 (= lt!302984 (select (store (arr!18500 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!651666 () Bool)

(declare-fun e!373962 () Bool)

(assert (=> b!651666 (= e!373962 (not e!373975))))

(declare-fun res!422587 () Bool)

(assert (=> b!651666 (=> res!422587 e!373975)))

(declare-fun lt!302971 () SeekEntryResult!6937)

(assert (=> b!651666 (= res!422587 (not (= lt!302971 (Found!6937 index!984))))))

(declare-fun lt!302976 () Unit!22250)

(assert (=> b!651666 (= lt!302976 e!373969)))

(declare-fun c!74909 () Bool)

(assert (=> b!651666 (= c!74909 (= lt!302971 Undefined!6937))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38595 (_ BitVec 32)) SeekEntryResult!6937)

(assert (=> b!651666 (= lt!302971 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!302978 lt!302981 mask!3053))))

(assert (=> b!651666 e!373965))

(declare-fun res!422569 () Bool)

(assert (=> b!651666 (=> (not res!422569) (not e!373965))))

(declare-fun lt!302969 () (_ BitVec 32))

(assert (=> b!651666 (= res!422569 (= lt!302975 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302969 vacantSpotIndex!68 lt!302978 lt!302981 mask!3053)))))

(assert (=> b!651666 (= lt!302975 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302969 vacantSpotIndex!68 (select (arr!18500 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!651666 (= lt!302978 (select (store (arr!18500 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!302983 () Unit!22250)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38595 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22250)

(assert (=> b!651666 (= lt!302983 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!302969 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!651666 (= lt!302969 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!651667 () Bool)

(assert (=> b!651667 (= e!373963 e!373970)))

(declare-fun res!422576 () Bool)

(assert (=> b!651667 (=> res!422576 e!373970)))

(assert (=> b!651667 (= res!422576 (bvsge index!984 j!136))))

(declare-fun lt!302974 () Unit!22250)

(assert (=> b!651667 (= lt!302974 e!373964)))

(declare-fun c!74910 () Bool)

(assert (=> b!651667 (= c!74910 (bvslt j!136 index!984))))

(declare-fun b!651668 () Bool)

(declare-fun res!422572 () Bool)

(assert (=> b!651668 (=> (not res!422572) (not e!373972))))

(assert (=> b!651668 (= res!422572 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18500 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!651669 () Bool)

(declare-fun e!373976 () Bool)

(assert (=> b!651669 (= e!373976 e!373962)))

(declare-fun res!422574 () Bool)

(assert (=> b!651669 (=> (not res!422574) (not e!373962))))

(assert (=> b!651669 (= res!422574 (and (= lt!302972 (Found!6937 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18500 a!2986) index!984) (select (arr!18500 a!2986) j!136))) (not (= (select (arr!18500 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!651669 (= lt!302972 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18500 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!651670 () Bool)

(assert (=> b!651670 (= e!373973 (arrayContainsKey!0 lt!302981 (select (arr!18500 a!2986) j!136) index!984))))

(declare-fun b!651671 () Bool)

(declare-fun res!422582 () Bool)

(assert (=> b!651671 (=> (not res!422582) (not e!373972))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38595 (_ BitVec 32)) Bool)

(assert (=> b!651671 (= res!422582 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!422579 () Bool)

(assert (=> start!59084 (=> (not res!422579) (not e!373971))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59084 (= res!422579 (validMask!0 mask!3053))))

(assert (=> start!59084 e!373971))

(assert (=> start!59084 true))

(declare-fun array_inv!14383 (array!38595) Bool)

(assert (=> start!59084 (array_inv!14383 a!2986)))

(declare-fun b!651672 () Bool)

(assert (=> b!651672 (= e!373972 e!373976)))

(declare-fun res!422584 () Bool)

(assert (=> b!651672 (=> (not res!422584) (not e!373976))))

(assert (=> b!651672 (= res!422584 (= (select (store (arr!18500 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!651672 (= lt!302981 (array!38596 (store (arr!18500 a!2986) i!1108 k0!1786) (size!18865 a!2986)))))

(declare-fun b!651673 () Bool)

(declare-fun res!422578 () Bool)

(assert (=> b!651673 (=> (not res!422578) (not e!373971))))

(assert (=> b!651673 (= res!422578 (validKeyInArray!0 (select (arr!18500 a!2986) j!136)))))

(declare-fun b!651674 () Bool)

(declare-fun res!422580 () Bool)

(assert (=> b!651674 (=> (not res!422580) (not e!373972))))

(assert (=> b!651674 (= res!422580 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12577))))

(declare-fun b!651675 () Bool)

(declare-fun Unit!22255 () Unit!22250)

(assert (=> b!651675 (= e!373964 Unit!22255)))

(declare-fun lt!302982 () Unit!22250)

(assert (=> b!651675 (= lt!302982 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!302981 (select (arr!18500 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!651675 (arrayContainsKey!0 lt!302981 (select (arr!18500 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!302985 () Unit!22250)

(assert (=> b!651675 (= lt!302985 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12577))))

(assert (=> b!651675 (arrayNoDuplicates!0 lt!302981 #b00000000000000000000000000000000 Nil!12577)))

(declare-fun lt!302979 () Unit!22250)

(assert (=> b!651675 (= lt!302979 (lemmaNoDuplicateFromThenFromBigger!0 lt!302981 #b00000000000000000000000000000000 j!136))))

(assert (=> b!651675 (arrayNoDuplicates!0 lt!302981 j!136 Nil!12577)))

(declare-fun lt!302977 () Unit!22250)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38595 (_ BitVec 64) (_ BitVec 32) List!12580) Unit!22250)

(assert (=> b!651675 (= lt!302977 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!302981 (select (arr!18500 a!2986) j!136) j!136 Nil!12577))))

(assert (=> b!651675 false))

(assert (= (and start!59084 res!422579) b!651660))

(assert (= (and b!651660 res!422571) b!651673))

(assert (= (and b!651673 res!422578) b!651663))

(assert (= (and b!651663 res!422573) b!651655))

(assert (= (and b!651655 res!422577) b!651656))

(assert (= (and b!651656 res!422575) b!651671))

(assert (= (and b!651671 res!422582) b!651674))

(assert (= (and b!651674 res!422580) b!651668))

(assert (= (and b!651668 res!422572) b!651672))

(assert (= (and b!651672 res!422584) b!651669))

(assert (= (and b!651669 res!422574) b!651666))

(assert (= (and b!651666 res!422569) b!651659))

(assert (= (and b!651666 c!74909) b!651658))

(assert (= (and b!651666 (not c!74909)) b!651657))

(assert (= (and b!651666 (not res!422587)) b!651665))

(assert (= (and b!651665 res!422585) b!651653))

(assert (= (and b!651653 (not res!422570)) b!651661))

(assert (= (and b!651661 res!422583) b!651670))

(assert (= (and b!651665 (not res!422581)) b!651667))

(assert (= (and b!651667 c!74910) b!651675))

(assert (= (and b!651667 (not c!74910)) b!651654))

(assert (= (and b!651667 (not res!422576)) b!651662))

(assert (= (and b!651662 res!422586) b!651664))

(declare-fun m!624315 () Bool)

(assert (=> b!651668 m!624315))

(declare-fun m!624317 () Bool)

(assert (=> b!651655 m!624317))

(declare-fun m!624319 () Bool)

(assert (=> b!651672 m!624319))

(declare-fun m!624321 () Bool)

(assert (=> b!651672 m!624321))

(declare-fun m!624323 () Bool)

(assert (=> b!651664 m!624323))

(assert (=> b!651664 m!624323))

(declare-fun m!624325 () Bool)

(assert (=> b!651664 m!624325))

(declare-fun m!624327 () Bool)

(assert (=> start!59084 m!624327))

(declare-fun m!624329 () Bool)

(assert (=> start!59084 m!624329))

(declare-fun m!624331 () Bool)

(assert (=> b!651674 m!624331))

(declare-fun m!624333 () Bool)

(assert (=> b!651666 m!624333))

(assert (=> b!651666 m!624323))

(assert (=> b!651666 m!624319))

(declare-fun m!624335 () Bool)

(assert (=> b!651666 m!624335))

(declare-fun m!624337 () Bool)

(assert (=> b!651666 m!624337))

(declare-fun m!624339 () Bool)

(assert (=> b!651666 m!624339))

(declare-fun m!624341 () Bool)

(assert (=> b!651666 m!624341))

(assert (=> b!651666 m!624323))

(declare-fun m!624343 () Bool)

(assert (=> b!651666 m!624343))

(declare-fun m!624345 () Bool)

(assert (=> b!651663 m!624345))

(assert (=> b!651661 m!624323))

(assert (=> b!651661 m!624323))

(declare-fun m!624347 () Bool)

(assert (=> b!651661 m!624347))

(declare-fun m!624349 () Bool)

(assert (=> b!651662 m!624349))

(assert (=> b!651662 m!624323))

(assert (=> b!651662 m!624323))

(declare-fun m!624351 () Bool)

(assert (=> b!651662 m!624351))

(assert (=> b!651662 m!624323))

(declare-fun m!624353 () Bool)

(assert (=> b!651662 m!624353))

(assert (=> b!651662 m!624323))

(assert (=> b!651662 m!624347))

(declare-fun m!624355 () Bool)

(assert (=> b!651662 m!624355))

(declare-fun m!624357 () Bool)

(assert (=> b!651662 m!624357))

(declare-fun m!624359 () Bool)

(assert (=> b!651662 m!624359))

(assert (=> b!651675 m!624323))

(assert (=> b!651675 m!624323))

(declare-fun m!624361 () Bool)

(assert (=> b!651675 m!624361))

(declare-fun m!624363 () Bool)

(assert (=> b!651675 m!624363))

(assert (=> b!651675 m!624323))

(declare-fun m!624365 () Bool)

(assert (=> b!651675 m!624365))

(assert (=> b!651675 m!624355))

(assert (=> b!651675 m!624323))

(declare-fun m!624367 () Bool)

(assert (=> b!651675 m!624367))

(declare-fun m!624369 () Bool)

(assert (=> b!651675 m!624369))

(assert (=> b!651675 m!624359))

(assert (=> b!651670 m!624323))

(assert (=> b!651670 m!624323))

(assert (=> b!651670 m!624325))

(assert (=> b!651673 m!624323))

(assert (=> b!651673 m!624323))

(declare-fun m!624371 () Bool)

(assert (=> b!651673 m!624371))

(assert (=> b!651653 m!624323))

(assert (=> b!651665 m!624323))

(assert (=> b!651665 m!624319))

(declare-fun m!624373 () Bool)

(assert (=> b!651665 m!624373))

(declare-fun m!624375 () Bool)

(assert (=> b!651671 m!624375))

(declare-fun m!624377 () Bool)

(assert (=> b!651669 m!624377))

(assert (=> b!651669 m!624323))

(assert (=> b!651669 m!624323))

(declare-fun m!624379 () Bool)

(assert (=> b!651669 m!624379))

(declare-fun m!624381 () Bool)

(assert (=> b!651656 m!624381))

(check-sat (not b!651673) (not b!651663) (not start!59084) (not b!651674) (not b!651671) (not b!651662) (not b!651669) (not b!651664) (not b!651655) (not b!651656) (not b!651670) (not b!651666) (not b!651661) (not b!651675))
(check-sat)
