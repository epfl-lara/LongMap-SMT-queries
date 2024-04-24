; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56964 () Bool)

(assert start!56964)

(declare-fun b!630339 () Bool)

(declare-fun res!407456 () Bool)

(declare-fun e!360456 () Bool)

(assert (=> b!630339 (=> (not res!407456) (not e!360456))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!38040 0))(
  ( (array!38041 (arr!18253 (Array (_ BitVec 32) (_ BitVec 64))) (size!18617 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38040)

(assert (=> b!630339 (= res!407456 (and (= (size!18617 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18617 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18617 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!630340 () Bool)

(declare-fun e!360455 () Bool)

(assert (=> b!630340 (= e!360455 (not true))))

(declare-fun e!360453 () Bool)

(assert (=> b!630340 e!360453))

(declare-fun res!407458 () Bool)

(assert (=> b!630340 (=> (not res!407458) (not e!360453))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6649 0))(
  ( (MissingZero!6649 (index!28883 (_ BitVec 32))) (Found!6649 (index!28884 (_ BitVec 32))) (Intermediate!6649 (undefined!7461 Bool) (index!28885 (_ BitVec 32)) (x!57773 (_ BitVec 32))) (Undefined!6649) (MissingVacant!6649 (index!28886 (_ BitVec 32))) )
))
(declare-fun lt!291139 () SeekEntryResult!6649)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!291137 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38040 (_ BitVec 32)) SeekEntryResult!6649)

(assert (=> b!630340 (= res!407458 (= lt!291139 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291137 vacantSpotIndex!68 (select (store (arr!18253 a!2986) i!1108 k0!1786) j!136) (array!38041 (store (arr!18253 a!2986) i!1108 k0!1786) (size!18617 a!2986)) mask!3053)))))

(assert (=> b!630340 (= lt!291139 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291137 vacantSpotIndex!68 (select (arr!18253 a!2986) j!136) a!2986 mask!3053))))

(declare-datatypes ((Unit!21117 0))(
  ( (Unit!21118) )
))
(declare-fun lt!291136 () Unit!21117)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38040 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21117)

(assert (=> b!630340 (= lt!291136 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291137 vacantSpotIndex!68 mask!3053))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!630340 (= lt!291137 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!630341 () Bool)

(declare-fun res!407451 () Bool)

(assert (=> b!630341 (=> (not res!407451) (not e!360456))))

(declare-fun arrayContainsKey!0 (array!38040 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!630341 (= res!407451 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!630342 () Bool)

(declare-fun res!407449 () Bool)

(declare-fun e!360452 () Bool)

(assert (=> b!630342 (=> (not res!407449) (not e!360452))))

(declare-datatypes ((List!12201 0))(
  ( (Nil!12198) (Cons!12197 (h!13245 (_ BitVec 64)) (t!18421 List!12201)) )
))
(declare-fun arrayNoDuplicates!0 (array!38040 (_ BitVec 32) List!12201) Bool)

(assert (=> b!630342 (= res!407449 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12198))))

(declare-fun b!630343 () Bool)

(assert (=> b!630343 (= e!360456 e!360452)))

(declare-fun res!407455 () Bool)

(assert (=> b!630343 (=> (not res!407455) (not e!360452))))

(declare-fun lt!291135 () SeekEntryResult!6649)

(assert (=> b!630343 (= res!407455 (or (= lt!291135 (MissingZero!6649 i!1108)) (= lt!291135 (MissingVacant!6649 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38040 (_ BitVec 32)) SeekEntryResult!6649)

(assert (=> b!630343 (= lt!291135 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!630344 () Bool)

(declare-fun res!407450 () Bool)

(assert (=> b!630344 (=> (not res!407450) (not e!360452))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38040 (_ BitVec 32)) Bool)

(assert (=> b!630344 (= res!407450 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!407453 () Bool)

(assert (=> start!56964 (=> (not res!407453) (not e!360456))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56964 (= res!407453 (validMask!0 mask!3053))))

(assert (=> start!56964 e!360456))

(assert (=> start!56964 true))

(declare-fun array_inv!14112 (array!38040) Bool)

(assert (=> start!56964 (array_inv!14112 a!2986)))

(declare-fun b!630345 () Bool)

(assert (=> b!630345 (= e!360452 e!360455)))

(declare-fun res!407448 () Bool)

(assert (=> b!630345 (=> (not res!407448) (not e!360455))))

(declare-fun lt!291138 () SeekEntryResult!6649)

(assert (=> b!630345 (= res!407448 (and (= lt!291138 (Found!6649 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18253 a!2986) index!984) (select (arr!18253 a!2986) j!136))) (not (= (select (arr!18253 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!630345 (= lt!291138 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18253 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!630346 () Bool)

(declare-fun res!407457 () Bool)

(assert (=> b!630346 (=> (not res!407457) (not e!360452))))

(assert (=> b!630346 (= res!407457 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18253 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18253 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!630347 () Bool)

(declare-fun res!407454 () Bool)

(assert (=> b!630347 (=> (not res!407454) (not e!360456))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!630347 (= res!407454 (validKeyInArray!0 (select (arr!18253 a!2986) j!136)))))

(declare-fun b!630348 () Bool)

(assert (=> b!630348 (= e!360453 (= lt!291138 lt!291139))))

(declare-fun b!630349 () Bool)

(declare-fun res!407452 () Bool)

(assert (=> b!630349 (=> (not res!407452) (not e!360456))))

(assert (=> b!630349 (= res!407452 (validKeyInArray!0 k0!1786))))

(assert (= (and start!56964 res!407453) b!630339))

(assert (= (and b!630339 res!407456) b!630347))

(assert (= (and b!630347 res!407454) b!630349))

(assert (= (and b!630349 res!407452) b!630341))

(assert (= (and b!630341 res!407451) b!630343))

(assert (= (and b!630343 res!407455) b!630344))

(assert (= (and b!630344 res!407450) b!630342))

(assert (= (and b!630342 res!407449) b!630346))

(assert (= (and b!630346 res!407457) b!630345))

(assert (= (and b!630345 res!407448) b!630340))

(assert (= (and b!630340 res!407458) b!630348))

(declare-fun m!605647 () Bool)

(assert (=> b!630340 m!605647))

(declare-fun m!605649 () Bool)

(assert (=> b!630340 m!605649))

(declare-fun m!605651 () Bool)

(assert (=> b!630340 m!605651))

(declare-fun m!605653 () Bool)

(assert (=> b!630340 m!605653))

(assert (=> b!630340 m!605649))

(declare-fun m!605655 () Bool)

(assert (=> b!630340 m!605655))

(declare-fun m!605657 () Bool)

(assert (=> b!630340 m!605657))

(assert (=> b!630340 m!605647))

(declare-fun m!605659 () Bool)

(assert (=> b!630340 m!605659))

(declare-fun m!605661 () Bool)

(assert (=> b!630345 m!605661))

(assert (=> b!630345 m!605649))

(assert (=> b!630345 m!605649))

(declare-fun m!605663 () Bool)

(assert (=> b!630345 m!605663))

(declare-fun m!605665 () Bool)

(assert (=> start!56964 m!605665))

(declare-fun m!605667 () Bool)

(assert (=> start!56964 m!605667))

(declare-fun m!605669 () Bool)

(assert (=> b!630344 m!605669))

(declare-fun m!605671 () Bool)

(assert (=> b!630341 m!605671))

(declare-fun m!605673 () Bool)

(assert (=> b!630342 m!605673))

(declare-fun m!605675 () Bool)

(assert (=> b!630343 m!605675))

(declare-fun m!605677 () Bool)

(assert (=> b!630346 m!605677))

(assert (=> b!630346 m!605651))

(declare-fun m!605679 () Bool)

(assert (=> b!630346 m!605679))

(assert (=> b!630347 m!605649))

(assert (=> b!630347 m!605649))

(declare-fun m!605681 () Bool)

(assert (=> b!630347 m!605681))

(declare-fun m!605683 () Bool)

(assert (=> b!630349 m!605683))

(check-sat (not b!630340) (not b!630344) (not b!630342) (not b!630345) (not start!56964) (not b!630349) (not b!630343) (not b!630347) (not b!630341))
(check-sat)
