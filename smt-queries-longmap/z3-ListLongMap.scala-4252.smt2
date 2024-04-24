; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59040 () Bool)

(assert start!59040)

(declare-fun b!650790 () Bool)

(declare-fun e!373390 () Bool)

(declare-fun e!373384 () Bool)

(assert (=> b!650790 (= e!373390 e!373384)))

(declare-fun res!421832 () Bool)

(assert (=> b!650790 (=> (not res!421832) (not e!373384))))

(declare-datatypes ((SeekEntryResult!6877 0))(
  ( (MissingZero!6877 (index!29858 (_ BitVec 32))) (Found!6877 (index!29859 (_ BitVec 32))) (Intermediate!6877 (undefined!7689 Bool) (index!29860 (_ BitVec 32)) (x!58798 (_ BitVec 32))) (Undefined!6877) (MissingVacant!6877 (index!29861 (_ BitVec 32))) )
))
(declare-fun lt!302397 () SeekEntryResult!6877)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38559 0))(
  ( (array!38560 (arr!18481 (Array (_ BitVec 32) (_ BitVec 64))) (size!18845 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38559)

(assert (=> b!650790 (= res!421832 (and (= lt!302397 (Found!6877 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18481 a!2986) index!984) (select (arr!18481 a!2986) j!136))) (not (= (select (arr!18481 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38559 (_ BitVec 32)) SeekEntryResult!6877)

(assert (=> b!650790 (= lt!302397 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18481 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!650791 () Bool)

(declare-fun e!373385 () Bool)

(declare-fun e!373379 () Bool)

(assert (=> b!650791 (= e!373385 e!373379)))

(declare-fun res!421844 () Bool)

(assert (=> b!650791 (=> res!421844 e!373379)))

(declare-fun lt!302393 () (_ BitVec 64))

(declare-fun lt!302400 () (_ BitVec 64))

(assert (=> b!650791 (= res!421844 (or (not (= (select (arr!18481 a!2986) j!136) lt!302400)) (not (= (select (arr!18481 a!2986) j!136) lt!302393))))))

(declare-fun e!373382 () Bool)

(assert (=> b!650791 e!373382))

(declare-fun res!421838 () Bool)

(assert (=> b!650791 (=> (not res!421838) (not e!373382))))

(assert (=> b!650791 (= res!421838 (= lt!302393 (select (arr!18481 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!650791 (= lt!302393 (select (store (arr!18481 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!650792 () Bool)

(declare-fun res!421839 () Bool)

(declare-fun e!373381 () Bool)

(assert (=> b!650792 (=> (not res!421839) (not e!373381))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!650792 (= res!421839 (validKeyInArray!0 (select (arr!18481 a!2986) j!136)))))

(declare-fun b!650793 () Bool)

(declare-fun res!421835 () Bool)

(assert (=> b!650793 (=> (not res!421835) (not e!373381))))

(assert (=> b!650793 (= res!421835 (validKeyInArray!0 k0!1786))))

(declare-fun b!650794 () Bool)

(declare-fun res!421848 () Bool)

(declare-fun e!373392 () Bool)

(assert (=> b!650794 (=> (not res!421848) (not e!373392))))

(assert (=> b!650794 (= res!421848 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18481 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!650795 () Bool)

(declare-fun res!421847 () Bool)

(assert (=> b!650795 (=> (not res!421847) (not e!373381))))

(assert (=> b!650795 (= res!421847 (and (= (size!18845 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18845 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18845 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!650796 () Bool)

(declare-datatypes ((Unit!22161 0))(
  ( (Unit!22162) )
))
(declare-fun e!373383 () Unit!22161)

(declare-fun Unit!22163 () Unit!22161)

(assert (=> b!650796 (= e!373383 Unit!22163)))

(declare-fun lt!302404 () array!38559)

(declare-fun lt!302394 () Unit!22161)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38559 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22161)

(assert (=> b!650796 (= lt!302394 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!302404 (select (arr!18481 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun arrayContainsKey!0 (array!38559 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!650796 (arrayContainsKey!0 lt!302404 (select (arr!18481 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!302406 () Unit!22161)

(declare-datatypes ((List!12429 0))(
  ( (Nil!12426) (Cons!12425 (h!13473 (_ BitVec 64)) (t!18649 List!12429)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38559 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12429) Unit!22161)

(assert (=> b!650796 (= lt!302406 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12426))))

(declare-fun arrayNoDuplicates!0 (array!38559 (_ BitVec 32) List!12429) Bool)

(assert (=> b!650796 (arrayNoDuplicates!0 lt!302404 #b00000000000000000000000000000000 Nil!12426)))

(declare-fun lt!302401 () Unit!22161)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38559 (_ BitVec 32) (_ BitVec 32)) Unit!22161)

(assert (=> b!650796 (= lt!302401 (lemmaNoDuplicateFromThenFromBigger!0 lt!302404 #b00000000000000000000000000000000 j!136))))

(assert (=> b!650796 (arrayNoDuplicates!0 lt!302404 j!136 Nil!12426)))

(declare-fun lt!302399 () Unit!22161)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38559 (_ BitVec 64) (_ BitVec 32) List!12429) Unit!22161)

(assert (=> b!650796 (= lt!302399 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!302404 (select (arr!18481 a!2986) j!136) j!136 Nil!12426))))

(assert (=> b!650796 false))

(declare-fun b!650797 () Bool)

(declare-fun e!373391 () Bool)

(declare-fun e!373389 () Bool)

(assert (=> b!650797 (= e!373391 e!373389)))

(declare-fun res!421837 () Bool)

(assert (=> b!650797 (=> (not res!421837) (not e!373389))))

(assert (=> b!650797 (= res!421837 (arrayContainsKey!0 lt!302404 (select (arr!18481 a!2986) j!136) j!136))))

(declare-fun b!650798 () Bool)

(assert (=> b!650798 (= e!373384 (not e!373385))))

(declare-fun res!421833 () Bool)

(assert (=> b!650798 (=> res!421833 e!373385)))

(declare-fun lt!302391 () SeekEntryResult!6877)

(assert (=> b!650798 (= res!421833 (not (= lt!302391 (Found!6877 index!984))))))

(declare-fun lt!302403 () Unit!22161)

(declare-fun e!373380 () Unit!22161)

(assert (=> b!650798 (= lt!302403 e!373380)))

(declare-fun c!74849 () Bool)

(assert (=> b!650798 (= c!74849 (= lt!302391 Undefined!6877))))

(assert (=> b!650798 (= lt!302391 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!302400 lt!302404 mask!3053))))

(declare-fun e!373387 () Bool)

(assert (=> b!650798 e!373387))

(declare-fun res!421841 () Bool)

(assert (=> b!650798 (=> (not res!421841) (not e!373387))))

(declare-fun lt!302402 () (_ BitVec 32))

(declare-fun lt!302392 () SeekEntryResult!6877)

(assert (=> b!650798 (= res!421841 (= lt!302392 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302402 vacantSpotIndex!68 lt!302400 lt!302404 mask!3053)))))

(assert (=> b!650798 (= lt!302392 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302402 vacantSpotIndex!68 (select (arr!18481 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!650798 (= lt!302400 (select (store (arr!18481 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!302407 () Unit!22161)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38559 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22161)

(assert (=> b!650798 (= lt!302407 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!302402 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!650798 (= lt!302402 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!650800 () Bool)

(declare-fun Unit!22164 () Unit!22161)

(assert (=> b!650800 (= e!373380 Unit!22164)))

(assert (=> b!650800 false))

(declare-fun b!650801 () Bool)

(declare-fun e!373386 () Bool)

(assert (=> b!650801 (= e!373386 (or (bvsge (size!18845 a!2986) #b01111111111111111111111111111111) (bvsle #b00000000000000000000000000000000 (size!18845 a!2986))))))

(assert (=> b!650801 (arrayNoDuplicates!0 lt!302404 #b00000000000000000000000000000000 Nil!12426)))

(declare-fun lt!302395 () Unit!22161)

(assert (=> b!650801 (= lt!302395 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12426))))

(assert (=> b!650801 (arrayContainsKey!0 lt!302404 (select (arr!18481 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!302405 () Unit!22161)

(assert (=> b!650801 (= lt!302405 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!302404 (select (arr!18481 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!373378 () Bool)

(assert (=> b!650801 e!373378))

(declare-fun res!421845 () Bool)

(assert (=> b!650801 (=> (not res!421845) (not e!373378))))

(assert (=> b!650801 (= res!421845 (arrayContainsKey!0 lt!302404 (select (arr!18481 a!2986) j!136) j!136))))

(declare-fun b!650802 () Bool)

(declare-fun Unit!22165 () Unit!22161)

(assert (=> b!650802 (= e!373383 Unit!22165)))

(declare-fun b!650803 () Bool)

(assert (=> b!650803 (= e!373381 e!373392)))

(declare-fun res!421834 () Bool)

(assert (=> b!650803 (=> (not res!421834) (not e!373392))))

(declare-fun lt!302396 () SeekEntryResult!6877)

(assert (=> b!650803 (= res!421834 (or (= lt!302396 (MissingZero!6877 i!1108)) (= lt!302396 (MissingVacant!6877 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38559 (_ BitVec 32)) SeekEntryResult!6877)

(assert (=> b!650803 (= lt!302396 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!650804 () Bool)

(assert (=> b!650804 (= e!373378 (arrayContainsKey!0 lt!302404 (select (arr!18481 a!2986) j!136) index!984))))

(declare-fun b!650805 () Bool)

(declare-fun res!421846 () Bool)

(assert (=> b!650805 (=> (not res!421846) (not e!373381))))

(assert (=> b!650805 (= res!421846 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!650806 () Bool)

(assert (=> b!650806 (= e!373387 (= lt!302397 lt!302392))))

(declare-fun b!650807 () Bool)

(assert (=> b!650807 (= e!373392 e!373390)))

(declare-fun res!421831 () Bool)

(assert (=> b!650807 (=> (not res!421831) (not e!373390))))

(assert (=> b!650807 (= res!421831 (= (select (store (arr!18481 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!650807 (= lt!302404 (array!38560 (store (arr!18481 a!2986) i!1108 k0!1786) (size!18845 a!2986)))))

(declare-fun b!650808 () Bool)

(assert (=> b!650808 (= e!373389 (arrayContainsKey!0 lt!302404 (select (arr!18481 a!2986) j!136) index!984))))

(declare-fun b!650809 () Bool)

(declare-fun Unit!22166 () Unit!22161)

(assert (=> b!650809 (= e!373380 Unit!22166)))

(declare-fun b!650810 () Bool)

(declare-fun res!421836 () Bool)

(assert (=> b!650810 (=> (not res!421836) (not e!373392))))

(assert (=> b!650810 (= res!421836 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12426))))

(declare-fun b!650799 () Bool)

(declare-fun res!421843 () Bool)

(assert (=> b!650799 (=> (not res!421843) (not e!373392))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38559 (_ BitVec 32)) Bool)

(assert (=> b!650799 (= res!421843 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!421840 () Bool)

(assert (=> start!59040 (=> (not res!421840) (not e!373381))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59040 (= res!421840 (validMask!0 mask!3053))))

(assert (=> start!59040 e!373381))

(assert (=> start!59040 true))

(declare-fun array_inv!14340 (array!38559) Bool)

(assert (=> start!59040 (array_inv!14340 a!2986)))

(declare-fun b!650811 () Bool)

(assert (=> b!650811 (= e!373382 e!373391)))

(declare-fun res!421842 () Bool)

(assert (=> b!650811 (=> res!421842 e!373391)))

(assert (=> b!650811 (= res!421842 (or (not (= (select (arr!18481 a!2986) j!136) lt!302400)) (not (= (select (arr!18481 a!2986) j!136) lt!302393)) (bvsge j!136 index!984)))))

(declare-fun b!650812 () Bool)

(assert (=> b!650812 (= e!373379 e!373386)))

(declare-fun res!421849 () Bool)

(assert (=> b!650812 (=> res!421849 e!373386)))

(assert (=> b!650812 (= res!421849 (bvsge index!984 j!136))))

(declare-fun lt!302398 () Unit!22161)

(assert (=> b!650812 (= lt!302398 e!373383)))

(declare-fun c!74848 () Bool)

(assert (=> b!650812 (= c!74848 (bvslt j!136 index!984))))

(assert (= (and start!59040 res!421840) b!650795))

(assert (= (and b!650795 res!421847) b!650792))

(assert (= (and b!650792 res!421839) b!650793))

(assert (= (and b!650793 res!421835) b!650805))

(assert (= (and b!650805 res!421846) b!650803))

(assert (= (and b!650803 res!421834) b!650799))

(assert (= (and b!650799 res!421843) b!650810))

(assert (= (and b!650810 res!421836) b!650794))

(assert (= (and b!650794 res!421848) b!650807))

(assert (= (and b!650807 res!421831) b!650790))

(assert (= (and b!650790 res!421832) b!650798))

(assert (= (and b!650798 res!421841) b!650806))

(assert (= (and b!650798 c!74849) b!650800))

(assert (= (and b!650798 (not c!74849)) b!650809))

(assert (= (and b!650798 (not res!421833)) b!650791))

(assert (= (and b!650791 res!421838) b!650811))

(assert (= (and b!650811 (not res!421842)) b!650797))

(assert (= (and b!650797 res!421837) b!650808))

(assert (= (and b!650791 (not res!421844)) b!650812))

(assert (= (and b!650812 c!74848) b!650796))

(assert (= (and b!650812 (not c!74848)) b!650802))

(assert (= (and b!650812 (not res!421849)) b!650801))

(assert (= (and b!650801 res!421845) b!650804))

(declare-fun m!624421 () Bool)

(assert (=> b!650804 m!624421))

(assert (=> b!650804 m!624421))

(declare-fun m!624423 () Bool)

(assert (=> b!650804 m!624423))

(assert (=> b!650797 m!624421))

(assert (=> b!650797 m!624421))

(declare-fun m!624425 () Bool)

(assert (=> b!650797 m!624425))

(declare-fun m!624427 () Bool)

(assert (=> b!650799 m!624427))

(assert (=> b!650791 m!624421))

(declare-fun m!624429 () Bool)

(assert (=> b!650791 m!624429))

(declare-fun m!624431 () Bool)

(assert (=> b!650791 m!624431))

(assert (=> b!650796 m!624421))

(assert (=> b!650796 m!624421))

(declare-fun m!624433 () Bool)

(assert (=> b!650796 m!624433))

(declare-fun m!624435 () Bool)

(assert (=> b!650796 m!624435))

(declare-fun m!624437 () Bool)

(assert (=> b!650796 m!624437))

(assert (=> b!650796 m!624421))

(declare-fun m!624439 () Bool)

(assert (=> b!650796 m!624439))

(assert (=> b!650796 m!624421))

(declare-fun m!624441 () Bool)

(assert (=> b!650796 m!624441))

(declare-fun m!624443 () Bool)

(assert (=> b!650796 m!624443))

(declare-fun m!624445 () Bool)

(assert (=> b!650796 m!624445))

(assert (=> b!650811 m!624421))

(declare-fun m!624447 () Bool)

(assert (=> b!650810 m!624447))

(assert (=> b!650801 m!624421))

(declare-fun m!624449 () Bool)

(assert (=> b!650801 m!624449))

(assert (=> b!650801 m!624421))

(assert (=> b!650801 m!624437))

(assert (=> b!650801 m!624421))

(assert (=> b!650801 m!624425))

(assert (=> b!650801 m!624421))

(declare-fun m!624451 () Bool)

(assert (=> b!650801 m!624451))

(assert (=> b!650801 m!624443))

(declare-fun m!624453 () Bool)

(assert (=> b!650794 m!624453))

(declare-fun m!624455 () Bool)

(assert (=> b!650805 m!624455))

(declare-fun m!624457 () Bool)

(assert (=> b!650790 m!624457))

(assert (=> b!650790 m!624421))

(assert (=> b!650790 m!624421))

(declare-fun m!624459 () Bool)

(assert (=> b!650790 m!624459))

(assert (=> b!650808 m!624421))

(assert (=> b!650808 m!624421))

(assert (=> b!650808 m!624423))

(declare-fun m!624461 () Bool)

(assert (=> start!59040 m!624461))

(declare-fun m!624463 () Bool)

(assert (=> start!59040 m!624463))

(assert (=> b!650807 m!624429))

(declare-fun m!624465 () Bool)

(assert (=> b!650807 m!624465))

(assert (=> b!650792 m!624421))

(assert (=> b!650792 m!624421))

(declare-fun m!624467 () Bool)

(assert (=> b!650792 m!624467))

(declare-fun m!624469 () Bool)

(assert (=> b!650798 m!624469))

(assert (=> b!650798 m!624421))

(declare-fun m!624471 () Bool)

(assert (=> b!650798 m!624471))

(assert (=> b!650798 m!624429))

(assert (=> b!650798 m!624421))

(declare-fun m!624473 () Bool)

(assert (=> b!650798 m!624473))

(declare-fun m!624475 () Bool)

(assert (=> b!650798 m!624475))

(declare-fun m!624477 () Bool)

(assert (=> b!650798 m!624477))

(declare-fun m!624479 () Bool)

(assert (=> b!650798 m!624479))

(declare-fun m!624481 () Bool)

(assert (=> b!650803 m!624481))

(declare-fun m!624483 () Bool)

(assert (=> b!650793 m!624483))

(check-sat (not b!650803) (not b!650796) (not b!650797) (not b!650798) (not b!650799) (not b!650790) (not b!650792) (not b!650793) (not start!59040) (not b!650808) (not b!650801) (not b!650804) (not b!650810) (not b!650805))
(check-sat)
