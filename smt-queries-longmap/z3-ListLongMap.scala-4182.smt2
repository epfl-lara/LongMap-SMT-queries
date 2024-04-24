; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57060 () Bool)

(assert start!57060)

(declare-fun b!631326 () Bool)

(declare-fun e!360979 () Bool)

(declare-fun e!360981 () Bool)

(assert (=> b!631326 (= e!360979 e!360981)))

(declare-fun res!408161 () Bool)

(assert (=> b!631326 (=> (not res!408161) (not e!360981))))

(declare-datatypes ((SeekEntryResult!6667 0))(
  ( (MissingZero!6667 (index!28958 (_ BitVec 32))) (Found!6667 (index!28959 (_ BitVec 32))) (Intermediate!6667 (undefined!7479 Bool) (index!28960 (_ BitVec 32)) (x!57848 (_ BitVec 32))) (Undefined!6667) (MissingVacant!6667 (index!28961 (_ BitVec 32))) )
))
(declare-fun lt!291649 () SeekEntryResult!6667)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!631326 (= res!408161 (or (= lt!291649 (MissingZero!6667 i!1108)) (= lt!291649 (MissingVacant!6667 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!38079 0))(
  ( (array!38080 (arr!18271 (Array (_ BitVec 32) (_ BitVec 64))) (size!18635 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38079)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38079 (_ BitVec 32)) SeekEntryResult!6667)

(assert (=> b!631326 (= lt!291649 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!631327 () Bool)

(declare-fun lt!291652 () SeekEntryResult!6667)

(declare-fun e!360983 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!631327 (= e!360983 (not (or (not (= lt!291652 (Found!6667 index!984))) (bvslt index!984 (size!18635 a!2986)))))))

(declare-datatypes ((Unit!21177 0))(
  ( (Unit!21178) )
))
(declare-fun lt!291653 () Unit!21177)

(declare-fun e!360984 () Unit!21177)

(assert (=> b!631327 (= lt!291653 e!360984)))

(declare-fun c!71951 () Bool)

(assert (=> b!631327 (= c!71951 (= lt!291652 Undefined!6667))))

(declare-fun lt!291650 () array!38079)

(declare-fun lt!291655 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38079 (_ BitVec 32)) SeekEntryResult!6667)

(assert (=> b!631327 (= lt!291652 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!291655 lt!291650 mask!3053))))

(declare-fun e!360980 () Bool)

(assert (=> b!631327 e!360980))

(declare-fun res!408170 () Bool)

(assert (=> b!631327 (=> (not res!408170) (not e!360980))))

(declare-fun lt!291651 () SeekEntryResult!6667)

(declare-fun lt!291647 () (_ BitVec 32))

(assert (=> b!631327 (= res!408170 (= lt!291651 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291647 vacantSpotIndex!68 lt!291655 lt!291650 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!631327 (= lt!291651 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291647 vacantSpotIndex!68 (select (arr!18271 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!631327 (= lt!291655 (select (store (arr!18271 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!291654 () Unit!21177)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38079 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21177)

(assert (=> b!631327 (= lt!291654 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291647 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!631327 (= lt!291647 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!631328 () Bool)

(declare-fun res!408162 () Bool)

(assert (=> b!631328 (=> (not res!408162) (not e!360981))))

(assert (=> b!631328 (= res!408162 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18271 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!631329 () Bool)

(declare-fun Unit!21179 () Unit!21177)

(assert (=> b!631329 (= e!360984 Unit!21179)))

(assert (=> b!631329 false))

(declare-fun b!631330 () Bool)

(declare-fun res!408168 () Bool)

(assert (=> b!631330 (=> (not res!408168) (not e!360979))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!631330 (= res!408168 (validKeyInArray!0 (select (arr!18271 a!2986) j!136)))))

(declare-fun b!631331 () Bool)

(declare-fun e!360982 () Bool)

(assert (=> b!631331 (= e!360981 e!360982)))

(declare-fun res!408169 () Bool)

(assert (=> b!631331 (=> (not res!408169) (not e!360982))))

(assert (=> b!631331 (= res!408169 (= (select (store (arr!18271 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!631331 (= lt!291650 (array!38080 (store (arr!18271 a!2986) i!1108 k0!1786) (size!18635 a!2986)))))

(declare-fun b!631332 () Bool)

(declare-fun res!408166 () Bool)

(assert (=> b!631332 (=> (not res!408166) (not e!360981))))

(declare-datatypes ((List!12219 0))(
  ( (Nil!12216) (Cons!12215 (h!13263 (_ BitVec 64)) (t!18439 List!12219)) )
))
(declare-fun arrayNoDuplicates!0 (array!38079 (_ BitVec 32) List!12219) Bool)

(assert (=> b!631332 (= res!408166 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12216))))

(declare-fun b!631333 () Bool)

(declare-fun Unit!21180 () Unit!21177)

(assert (=> b!631333 (= e!360984 Unit!21180)))

(declare-fun b!631335 () Bool)

(assert (=> b!631335 (= e!360982 e!360983)))

(declare-fun res!408172 () Bool)

(assert (=> b!631335 (=> (not res!408172) (not e!360983))))

(declare-fun lt!291648 () SeekEntryResult!6667)

(assert (=> b!631335 (= res!408172 (and (= lt!291648 (Found!6667 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18271 a!2986) index!984) (select (arr!18271 a!2986) j!136))) (not (= (select (arr!18271 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!631335 (= lt!291648 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18271 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!631336 () Bool)

(declare-fun res!408163 () Bool)

(assert (=> b!631336 (=> (not res!408163) (not e!360979))))

(assert (=> b!631336 (= res!408163 (and (= (size!18635 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18635 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18635 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!631337 () Bool)

(declare-fun res!408171 () Bool)

(assert (=> b!631337 (=> (not res!408171) (not e!360979))))

(declare-fun arrayContainsKey!0 (array!38079 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!631337 (= res!408171 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!631338 () Bool)

(declare-fun res!408165 () Bool)

(assert (=> b!631338 (=> (not res!408165) (not e!360981))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38079 (_ BitVec 32)) Bool)

(assert (=> b!631338 (= res!408165 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!631339 () Bool)

(assert (=> b!631339 (= e!360980 (= lt!291648 lt!291651))))

(declare-fun b!631334 () Bool)

(declare-fun res!408164 () Bool)

(assert (=> b!631334 (=> (not res!408164) (not e!360979))))

(assert (=> b!631334 (= res!408164 (validKeyInArray!0 k0!1786))))

(declare-fun res!408167 () Bool)

(assert (=> start!57060 (=> (not res!408167) (not e!360979))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57060 (= res!408167 (validMask!0 mask!3053))))

(assert (=> start!57060 e!360979))

(assert (=> start!57060 true))

(declare-fun array_inv!14130 (array!38079) Bool)

(assert (=> start!57060 (array_inv!14130 a!2986)))

(assert (= (and start!57060 res!408167) b!631336))

(assert (= (and b!631336 res!408163) b!631330))

(assert (= (and b!631330 res!408168) b!631334))

(assert (= (and b!631334 res!408164) b!631337))

(assert (= (and b!631337 res!408171) b!631326))

(assert (= (and b!631326 res!408161) b!631338))

(assert (= (and b!631338 res!408165) b!631332))

(assert (= (and b!631332 res!408166) b!631328))

(assert (= (and b!631328 res!408162) b!631331))

(assert (= (and b!631331 res!408169) b!631335))

(assert (= (and b!631335 res!408172) b!631327))

(assert (= (and b!631327 res!408170) b!631339))

(assert (= (and b!631327 c!71951) b!631329))

(assert (= (and b!631327 (not c!71951)) b!631333))

(declare-fun m!606577 () Bool)

(assert (=> b!631327 m!606577))

(declare-fun m!606579 () Bool)

(assert (=> b!631327 m!606579))

(declare-fun m!606581 () Bool)

(assert (=> b!631327 m!606581))

(declare-fun m!606583 () Bool)

(assert (=> b!631327 m!606583))

(declare-fun m!606585 () Bool)

(assert (=> b!631327 m!606585))

(declare-fun m!606587 () Bool)

(assert (=> b!631327 m!606587))

(assert (=> b!631327 m!606581))

(declare-fun m!606589 () Bool)

(assert (=> b!631327 m!606589))

(declare-fun m!606591 () Bool)

(assert (=> b!631327 m!606591))

(declare-fun m!606593 () Bool)

(assert (=> b!631338 m!606593))

(declare-fun m!606595 () Bool)

(assert (=> b!631337 m!606595))

(assert (=> b!631330 m!606581))

(assert (=> b!631330 m!606581))

(declare-fun m!606597 () Bool)

(assert (=> b!631330 m!606597))

(assert (=> b!631331 m!606583))

(declare-fun m!606599 () Bool)

(assert (=> b!631331 m!606599))

(declare-fun m!606601 () Bool)

(assert (=> b!631332 m!606601))

(declare-fun m!606603 () Bool)

(assert (=> b!631335 m!606603))

(assert (=> b!631335 m!606581))

(assert (=> b!631335 m!606581))

(declare-fun m!606605 () Bool)

(assert (=> b!631335 m!606605))

(declare-fun m!606607 () Bool)

(assert (=> b!631334 m!606607))

(declare-fun m!606609 () Bool)

(assert (=> b!631328 m!606609))

(declare-fun m!606611 () Bool)

(assert (=> start!57060 m!606611))

(declare-fun m!606613 () Bool)

(assert (=> start!57060 m!606613))

(declare-fun m!606615 () Bool)

(assert (=> b!631326 m!606615))

(check-sat (not start!57060) (not b!631327) (not b!631338) (not b!631335) (not b!631334) (not b!631330) (not b!631326) (not b!631332) (not b!631337))
(check-sat)
