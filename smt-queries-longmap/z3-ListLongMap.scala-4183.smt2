; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57066 () Bool)

(assert start!57066)

(declare-fun b!631452 () Bool)

(declare-datatypes ((Unit!21189 0))(
  ( (Unit!21190) )
))
(declare-fun e!361047 () Unit!21189)

(declare-fun Unit!21191 () Unit!21189)

(assert (=> b!631452 (= e!361047 Unit!21191)))

(assert (=> b!631452 false))

(declare-fun b!631454 () Bool)

(declare-fun Unit!21192 () Unit!21189)

(assert (=> b!631454 (= e!361047 Unit!21192)))

(declare-fun b!631455 () Bool)

(declare-fun e!361043 () Bool)

(assert (=> b!631455 (= e!361043 (not true))))

(declare-fun lt!291726 () Unit!21189)

(assert (=> b!631455 (= lt!291726 e!361047)))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((array!38085 0))(
  ( (array!38086 (arr!18274 (Array (_ BitVec 32) (_ BitVec 64))) (size!18638 (_ BitVec 32))) )
))
(declare-fun lt!291732 () array!38085)

(declare-fun lt!291728 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun c!71960 () Bool)

(declare-datatypes ((SeekEntryResult!6670 0))(
  ( (MissingZero!6670 (index!28970 (_ BitVec 32))) (Found!6670 (index!28971 (_ BitVec 32))) (Intermediate!6670 (undefined!7482 Bool) (index!28972 (_ BitVec 32)) (x!57859 (_ BitVec 32))) (Undefined!6670) (MissingVacant!6670 (index!28973 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38085 (_ BitVec 32)) SeekEntryResult!6670)

(assert (=> b!631455 (= c!71960 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!291728 lt!291732 mask!3053) Undefined!6670))))

(declare-fun e!361041 () Bool)

(assert (=> b!631455 e!361041))

(declare-fun res!408277 () Bool)

(assert (=> b!631455 (=> (not res!408277) (not e!361041))))

(declare-fun lt!291733 () (_ BitVec 32))

(declare-fun lt!291731 () SeekEntryResult!6670)

(assert (=> b!631455 (= res!408277 (= lt!291731 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291733 vacantSpotIndex!68 lt!291728 lt!291732 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!38085)

(assert (=> b!631455 (= lt!291731 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291733 vacantSpotIndex!68 (select (arr!18274 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!631455 (= lt!291728 (select (store (arr!18274 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!291727 () Unit!21189)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38085 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21189)

(assert (=> b!631455 (= lt!291727 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291733 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!631455 (= lt!291733 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!631456 () Bool)

(declare-fun res!408271 () Bool)

(declare-fun e!361044 () Bool)

(assert (=> b!631456 (=> (not res!408271) (not e!361044))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!631456 (= res!408271 (validKeyInArray!0 (select (arr!18274 a!2986) j!136)))))

(declare-fun b!631457 () Bool)

(declare-fun e!361045 () Bool)

(declare-fun e!361046 () Bool)

(assert (=> b!631457 (= e!361045 e!361046)))

(declare-fun res!408273 () Bool)

(assert (=> b!631457 (=> (not res!408273) (not e!361046))))

(assert (=> b!631457 (= res!408273 (= (select (store (arr!18274 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!631457 (= lt!291732 (array!38086 (store (arr!18274 a!2986) i!1108 k0!1786) (size!18638 a!2986)))))

(declare-fun b!631458 () Bool)

(declare-fun res!408275 () Bool)

(assert (=> b!631458 (=> (not res!408275) (not e!361045))))

(declare-datatypes ((List!12222 0))(
  ( (Nil!12219) (Cons!12218 (h!13266 (_ BitVec 64)) (t!18442 List!12222)) )
))
(declare-fun arrayNoDuplicates!0 (array!38085 (_ BitVec 32) List!12222) Bool)

(assert (=> b!631458 (= res!408275 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12219))))

(declare-fun b!631459 () Bool)

(declare-fun lt!291729 () SeekEntryResult!6670)

(assert (=> b!631459 (= e!361041 (= lt!291729 lt!291731))))

(declare-fun b!631460 () Bool)

(declare-fun res!408274 () Bool)

(assert (=> b!631460 (=> (not res!408274) (not e!361044))))

(declare-fun arrayContainsKey!0 (array!38085 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!631460 (= res!408274 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!631461 () Bool)

(declare-fun res!408272 () Bool)

(assert (=> b!631461 (=> (not res!408272) (not e!361045))))

(assert (=> b!631461 (= res!408272 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18274 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!408270 () Bool)

(assert (=> start!57066 (=> (not res!408270) (not e!361044))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57066 (= res!408270 (validMask!0 mask!3053))))

(assert (=> start!57066 e!361044))

(assert (=> start!57066 true))

(declare-fun array_inv!14133 (array!38085) Bool)

(assert (=> start!57066 (array_inv!14133 a!2986)))

(declare-fun b!631453 () Bool)

(declare-fun res!408280 () Bool)

(assert (=> b!631453 (=> (not res!408280) (not e!361045))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38085 (_ BitVec 32)) Bool)

(assert (=> b!631453 (= res!408280 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!631462 () Bool)

(declare-fun res!408279 () Bool)

(assert (=> b!631462 (=> (not res!408279) (not e!361044))))

(assert (=> b!631462 (= res!408279 (validKeyInArray!0 k0!1786))))

(declare-fun b!631463 () Bool)

(assert (=> b!631463 (= e!361046 e!361043)))

(declare-fun res!408278 () Bool)

(assert (=> b!631463 (=> (not res!408278) (not e!361043))))

(assert (=> b!631463 (= res!408278 (and (= lt!291729 (Found!6670 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18274 a!2986) index!984) (select (arr!18274 a!2986) j!136))) (not (= (select (arr!18274 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!631463 (= lt!291729 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18274 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!631464 () Bool)

(declare-fun res!408276 () Bool)

(assert (=> b!631464 (=> (not res!408276) (not e!361044))))

(assert (=> b!631464 (= res!408276 (and (= (size!18638 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18638 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18638 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!631465 () Bool)

(assert (=> b!631465 (= e!361044 e!361045)))

(declare-fun res!408269 () Bool)

(assert (=> b!631465 (=> (not res!408269) (not e!361045))))

(declare-fun lt!291730 () SeekEntryResult!6670)

(assert (=> b!631465 (= res!408269 (or (= lt!291730 (MissingZero!6670 i!1108)) (= lt!291730 (MissingVacant!6670 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38085 (_ BitVec 32)) SeekEntryResult!6670)

(assert (=> b!631465 (= lt!291730 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!57066 res!408270) b!631464))

(assert (= (and b!631464 res!408276) b!631456))

(assert (= (and b!631456 res!408271) b!631462))

(assert (= (and b!631462 res!408279) b!631460))

(assert (= (and b!631460 res!408274) b!631465))

(assert (= (and b!631465 res!408269) b!631453))

(assert (= (and b!631453 res!408280) b!631458))

(assert (= (and b!631458 res!408275) b!631461))

(assert (= (and b!631461 res!408272) b!631457))

(assert (= (and b!631457 res!408273) b!631463))

(assert (= (and b!631463 res!408278) b!631455))

(assert (= (and b!631455 res!408277) b!631459))

(assert (= (and b!631455 c!71960) b!631452))

(assert (= (and b!631455 (not c!71960)) b!631454))

(declare-fun m!606697 () Bool)

(assert (=> b!631465 m!606697))

(declare-fun m!606699 () Bool)

(assert (=> b!631463 m!606699))

(declare-fun m!606701 () Bool)

(assert (=> b!631463 m!606701))

(assert (=> b!631463 m!606701))

(declare-fun m!606703 () Bool)

(assert (=> b!631463 m!606703))

(declare-fun m!606705 () Bool)

(assert (=> b!631455 m!606705))

(declare-fun m!606707 () Bool)

(assert (=> b!631455 m!606707))

(assert (=> b!631455 m!606701))

(declare-fun m!606709 () Bool)

(assert (=> b!631455 m!606709))

(assert (=> b!631455 m!606701))

(declare-fun m!606711 () Bool)

(assert (=> b!631455 m!606711))

(declare-fun m!606713 () Bool)

(assert (=> b!631455 m!606713))

(declare-fun m!606715 () Bool)

(assert (=> b!631455 m!606715))

(declare-fun m!606717 () Bool)

(assert (=> b!631455 m!606717))

(declare-fun m!606719 () Bool)

(assert (=> b!631462 m!606719))

(declare-fun m!606721 () Bool)

(assert (=> b!631458 m!606721))

(declare-fun m!606723 () Bool)

(assert (=> b!631460 m!606723))

(assert (=> b!631457 m!606709))

(declare-fun m!606725 () Bool)

(assert (=> b!631457 m!606725))

(declare-fun m!606727 () Bool)

(assert (=> b!631461 m!606727))

(assert (=> b!631456 m!606701))

(assert (=> b!631456 m!606701))

(declare-fun m!606729 () Bool)

(assert (=> b!631456 m!606729))

(declare-fun m!606731 () Bool)

(assert (=> b!631453 m!606731))

(declare-fun m!606733 () Bool)

(assert (=> start!57066 m!606733))

(declare-fun m!606735 () Bool)

(assert (=> start!57066 m!606735))

(check-sat (not start!57066) (not b!631458) (not b!631462) (not b!631465) (not b!631455) (not b!631463) (not b!631453) (not b!631456) (not b!631460))
(check-sat)
