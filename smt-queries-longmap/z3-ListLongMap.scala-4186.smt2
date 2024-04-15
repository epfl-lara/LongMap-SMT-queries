; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57078 () Bool)

(assert start!57078)

(declare-fun b!631631 () Bool)

(declare-fun e!361112 () Bool)

(assert (=> b!631631 (= e!361112 true)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38109 0))(
  ( (array!38110 (arr!18287 (Array (_ BitVec 32) (_ BitVec 64))) (size!18652 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38109)

(assert (=> b!631631 (= (select (store (arr!18287 a!2986) i!1108 k0!1786) index!984) (select (arr!18287 a!2986) j!136))))

(declare-fun b!631632 () Bool)

(declare-fun res!408455 () Bool)

(declare-fun e!361113 () Bool)

(assert (=> b!631632 (=> (not res!408455) (not e!361113))))

(declare-fun arrayContainsKey!0 (array!38109 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!631632 (= res!408455 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!631633 () Bool)

(declare-fun e!361111 () Bool)

(declare-datatypes ((SeekEntryResult!6724 0))(
  ( (MissingZero!6724 (index!29189 (_ BitVec 32))) (Found!6724 (index!29190 (_ BitVec 32))) (Intermediate!6724 (undefined!7536 Bool) (index!29191 (_ BitVec 32)) (x!57938 (_ BitVec 32))) (Undefined!6724) (MissingVacant!6724 (index!29192 (_ BitVec 32))) )
))
(declare-fun lt!291742 () SeekEntryResult!6724)

(declare-fun lt!291734 () SeekEntryResult!6724)

(assert (=> b!631633 (= e!361111 (= lt!291742 lt!291734))))

(declare-fun b!631634 () Bool)

(declare-fun res!408443 () Bool)

(assert (=> b!631634 (=> (not res!408443) (not e!361113))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!631634 (= res!408443 (validKeyInArray!0 (select (arr!18287 a!2986) j!136)))))

(declare-fun b!631635 () Bool)

(declare-datatypes ((Unit!21224 0))(
  ( (Unit!21225) )
))
(declare-fun e!361114 () Unit!21224)

(declare-fun Unit!21226 () Unit!21224)

(assert (=> b!631635 (= e!361114 Unit!21226)))

(declare-fun b!631636 () Bool)

(declare-fun res!408451 () Bool)

(declare-fun e!361110 () Bool)

(assert (=> b!631636 (=> (not res!408451) (not e!361110))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38109 (_ BitVec 32)) Bool)

(assert (=> b!631636 (= res!408451 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!631637 () Bool)

(declare-fun res!408448 () Bool)

(assert (=> b!631637 (=> (not res!408448) (not e!361113))))

(assert (=> b!631637 (= res!408448 (and (= (size!18652 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18652 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18652 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!408450 () Bool)

(assert (=> start!57078 (=> (not res!408450) (not e!361113))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57078 (= res!408450 (validMask!0 mask!3053))))

(assert (=> start!57078 e!361113))

(assert (=> start!57078 true))

(declare-fun array_inv!14170 (array!38109) Bool)

(assert (=> start!57078 (array_inv!14170 a!2986)))

(declare-fun b!631638 () Bool)

(declare-fun Unit!21227 () Unit!21224)

(assert (=> b!631638 (= e!361114 Unit!21227)))

(assert (=> b!631638 false))

(declare-fun b!631639 () Bool)

(declare-fun e!361116 () Bool)

(declare-fun e!361109 () Bool)

(assert (=> b!631639 (= e!361116 e!361109)))

(declare-fun res!408444 () Bool)

(assert (=> b!631639 (=> (not res!408444) (not e!361109))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!631639 (= res!408444 (and (= lt!291742 (Found!6724 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18287 a!2986) index!984) (select (arr!18287 a!2986) j!136))) (not (= (select (arr!18287 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38109 (_ BitVec 32)) SeekEntryResult!6724)

(assert (=> b!631639 (= lt!291742 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18287 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!631640 () Bool)

(assert (=> b!631640 (= e!361110 e!361116)))

(declare-fun res!408454 () Bool)

(assert (=> b!631640 (=> (not res!408454) (not e!361116))))

(assert (=> b!631640 (= res!408454 (= (select (store (arr!18287 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!291738 () array!38109)

(assert (=> b!631640 (= lt!291738 (array!38110 (store (arr!18287 a!2986) i!1108 k0!1786) (size!18652 a!2986)))))

(declare-fun b!631641 () Bool)

(declare-fun res!408446 () Bool)

(assert (=> b!631641 (=> (not res!408446) (not e!361110))))

(assert (=> b!631641 (= res!408446 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18287 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!631642 () Bool)

(assert (=> b!631642 (= e!361113 e!361110)))

(declare-fun res!408449 () Bool)

(assert (=> b!631642 (=> (not res!408449) (not e!361110))))

(declare-fun lt!291735 () SeekEntryResult!6724)

(assert (=> b!631642 (= res!408449 (or (= lt!291735 (MissingZero!6724 i!1108)) (= lt!291735 (MissingVacant!6724 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38109 (_ BitVec 32)) SeekEntryResult!6724)

(assert (=> b!631642 (= lt!291735 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!631643 () Bool)

(assert (=> b!631643 (= e!361109 (not e!361112))))

(declare-fun res!408445 () Bool)

(assert (=> b!631643 (=> res!408445 e!361112)))

(declare-fun lt!291739 () SeekEntryResult!6724)

(assert (=> b!631643 (= res!408445 (not (= lt!291739 (Found!6724 index!984))))))

(declare-fun lt!291741 () Unit!21224)

(assert (=> b!631643 (= lt!291741 e!361114)))

(declare-fun c!71961 () Bool)

(assert (=> b!631643 (= c!71961 (= lt!291739 Undefined!6724))))

(declare-fun lt!291737 () (_ BitVec 64))

(assert (=> b!631643 (= lt!291739 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!291737 lt!291738 mask!3053))))

(assert (=> b!631643 e!361111))

(declare-fun res!408453 () Bool)

(assert (=> b!631643 (=> (not res!408453) (not e!361111))))

(declare-fun lt!291736 () (_ BitVec 32))

(assert (=> b!631643 (= res!408453 (= lt!291734 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291736 vacantSpotIndex!68 lt!291737 lt!291738 mask!3053)))))

(assert (=> b!631643 (= lt!291734 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291736 vacantSpotIndex!68 (select (arr!18287 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!631643 (= lt!291737 (select (store (arr!18287 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!291740 () Unit!21224)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38109 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21224)

(assert (=> b!631643 (= lt!291740 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291736 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!631643 (= lt!291736 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!631644 () Bool)

(declare-fun res!408447 () Bool)

(assert (=> b!631644 (=> (not res!408447) (not e!361113))))

(assert (=> b!631644 (= res!408447 (validKeyInArray!0 k0!1786))))

(declare-fun b!631645 () Bool)

(declare-fun res!408452 () Bool)

(assert (=> b!631645 (=> (not res!408452) (not e!361110))))

(declare-datatypes ((List!12367 0))(
  ( (Nil!12364) (Cons!12363 (h!13408 (_ BitVec 64)) (t!18586 List!12367)) )
))
(declare-fun arrayNoDuplicates!0 (array!38109 (_ BitVec 32) List!12367) Bool)

(assert (=> b!631645 (= res!408452 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12364))))

(assert (= (and start!57078 res!408450) b!631637))

(assert (= (and b!631637 res!408448) b!631634))

(assert (= (and b!631634 res!408443) b!631644))

(assert (= (and b!631644 res!408447) b!631632))

(assert (= (and b!631632 res!408455) b!631642))

(assert (= (and b!631642 res!408449) b!631636))

(assert (= (and b!631636 res!408451) b!631645))

(assert (= (and b!631645 res!408452) b!631641))

(assert (= (and b!631641 res!408446) b!631640))

(assert (= (and b!631640 res!408454) b!631639))

(assert (= (and b!631639 res!408444) b!631643))

(assert (= (and b!631643 res!408453) b!631633))

(assert (= (and b!631643 c!71961) b!631638))

(assert (= (and b!631643 (not c!71961)) b!631635))

(assert (= (and b!631643 (not res!408445)) b!631631))

(declare-fun m!606001 () Bool)

(assert (=> b!631643 m!606001))

(declare-fun m!606003 () Bool)

(assert (=> b!631643 m!606003))

(declare-fun m!606005 () Bool)

(assert (=> b!631643 m!606005))

(declare-fun m!606007 () Bool)

(assert (=> b!631643 m!606007))

(declare-fun m!606009 () Bool)

(assert (=> b!631643 m!606009))

(assert (=> b!631643 m!606001))

(declare-fun m!606011 () Bool)

(assert (=> b!631643 m!606011))

(declare-fun m!606013 () Bool)

(assert (=> b!631643 m!606013))

(declare-fun m!606015 () Bool)

(assert (=> b!631643 m!606015))

(assert (=> b!631631 m!606011))

(declare-fun m!606017 () Bool)

(assert (=> b!631631 m!606017))

(assert (=> b!631631 m!606001))

(declare-fun m!606019 () Bool)

(assert (=> b!631641 m!606019))

(declare-fun m!606021 () Bool)

(assert (=> start!57078 m!606021))

(declare-fun m!606023 () Bool)

(assert (=> start!57078 m!606023))

(declare-fun m!606025 () Bool)

(assert (=> b!631632 m!606025))

(declare-fun m!606027 () Bool)

(assert (=> b!631645 m!606027))

(declare-fun m!606029 () Bool)

(assert (=> b!631644 m!606029))

(declare-fun m!606031 () Bool)

(assert (=> b!631639 m!606031))

(assert (=> b!631639 m!606001))

(assert (=> b!631639 m!606001))

(declare-fun m!606033 () Bool)

(assert (=> b!631639 m!606033))

(declare-fun m!606035 () Bool)

(assert (=> b!631642 m!606035))

(declare-fun m!606037 () Bool)

(assert (=> b!631636 m!606037))

(assert (=> b!631640 m!606011))

(declare-fun m!606039 () Bool)

(assert (=> b!631640 m!606039))

(assert (=> b!631634 m!606001))

(assert (=> b!631634 m!606001))

(declare-fun m!606041 () Bool)

(assert (=> b!631634 m!606041))

(check-sat (not b!631645) (not b!631639) (not b!631636) (not start!57078) (not b!631642) (not b!631632) (not b!631644) (not b!631643) (not b!631634))
(check-sat)
