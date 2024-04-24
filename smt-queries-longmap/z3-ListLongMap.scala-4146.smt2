; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56616 () Bool)

(assert start!56616)

(declare-fun res!404350 () Bool)

(declare-fun e!359117 () Bool)

(assert (=> start!56616 (=> (not res!404350) (not e!359117))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56616 (= res!404350 (validMask!0 mask!3053))))

(assert (=> start!56616 e!359117))

(assert (=> start!56616 true))

(declare-datatypes ((array!37851 0))(
  ( (array!37852 (arr!18163 (Array (_ BitVec 32) (_ BitVec 64))) (size!18527 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37851)

(declare-fun array_inv!14022 (array!37851) Bool)

(assert (=> start!56616 (array_inv!14022 a!2986)))

(declare-fun b!626753 () Bool)

(declare-fun res!404351 () Bool)

(declare-fun e!359116 () Bool)

(assert (=> b!626753 (=> (not res!404351) (not e!359116))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!626753 (= res!404351 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18163 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18163 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!626754 () Bool)

(declare-fun res!404356 () Bool)

(assert (=> b!626754 (=> (not res!404356) (not e!359117))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!626754 (= res!404356 (validKeyInArray!0 k0!1786))))

(declare-fun b!626755 () Bool)

(assert (=> b!626755 (= e!359116 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6559 0))(
  ( (MissingZero!6559 (index!28520 (_ BitVec 32))) (Found!6559 (index!28521 (_ BitVec 32))) (Intermediate!6559 (undefined!7371 Bool) (index!28522 (_ BitVec 32)) (x!57422 (_ BitVec 32))) (Undefined!6559) (MissingVacant!6559 (index!28523 (_ BitVec 32))) )
))
(declare-fun lt!290202 () SeekEntryResult!6559)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37851 (_ BitVec 32)) SeekEntryResult!6559)

(assert (=> b!626755 (= lt!290202 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18163 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!626756 () Bool)

(declare-fun res!404354 () Bool)

(assert (=> b!626756 (=> (not res!404354) (not e!359116))))

(declare-datatypes ((List!12111 0))(
  ( (Nil!12108) (Cons!12107 (h!13155 (_ BitVec 64)) (t!18331 List!12111)) )
))
(declare-fun arrayNoDuplicates!0 (array!37851 (_ BitVec 32) List!12111) Bool)

(assert (=> b!626756 (= res!404354 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12108))))

(declare-fun b!626757 () Bool)

(declare-fun res!404353 () Bool)

(assert (=> b!626757 (=> (not res!404353) (not e!359117))))

(declare-fun arrayContainsKey!0 (array!37851 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!626757 (= res!404353 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!626758 () Bool)

(declare-fun res!404348 () Bool)

(assert (=> b!626758 (=> (not res!404348) (not e!359116))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37851 (_ BitVec 32)) Bool)

(assert (=> b!626758 (= res!404348 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!626759 () Bool)

(assert (=> b!626759 (= e!359117 e!359116)))

(declare-fun res!404355 () Bool)

(assert (=> b!626759 (=> (not res!404355) (not e!359116))))

(declare-fun lt!290203 () SeekEntryResult!6559)

(assert (=> b!626759 (= res!404355 (or (= lt!290203 (MissingZero!6559 i!1108)) (= lt!290203 (MissingVacant!6559 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37851 (_ BitVec 32)) SeekEntryResult!6559)

(assert (=> b!626759 (= lt!290203 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!626760 () Bool)

(declare-fun res!404349 () Bool)

(assert (=> b!626760 (=> (not res!404349) (not e!359117))))

(assert (=> b!626760 (= res!404349 (and (= (size!18527 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18527 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18527 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!626761 () Bool)

(declare-fun res!404352 () Bool)

(assert (=> b!626761 (=> (not res!404352) (not e!359117))))

(assert (=> b!626761 (= res!404352 (validKeyInArray!0 (select (arr!18163 a!2986) j!136)))))

(assert (= (and start!56616 res!404350) b!626760))

(assert (= (and b!626760 res!404349) b!626761))

(assert (= (and b!626761 res!404352) b!626754))

(assert (= (and b!626754 res!404356) b!626757))

(assert (= (and b!626757 res!404353) b!626759))

(assert (= (and b!626759 res!404355) b!626758))

(assert (= (and b!626758 res!404348) b!626756))

(assert (= (and b!626756 res!404354) b!626753))

(assert (= (and b!626753 res!404351) b!626755))

(declare-fun m!602407 () Bool)

(assert (=> b!626758 m!602407))

(declare-fun m!602409 () Bool)

(assert (=> b!626753 m!602409))

(declare-fun m!602411 () Bool)

(assert (=> b!626753 m!602411))

(declare-fun m!602413 () Bool)

(assert (=> b!626753 m!602413))

(declare-fun m!602415 () Bool)

(assert (=> b!626761 m!602415))

(assert (=> b!626761 m!602415))

(declare-fun m!602417 () Bool)

(assert (=> b!626761 m!602417))

(assert (=> b!626755 m!602415))

(assert (=> b!626755 m!602415))

(declare-fun m!602419 () Bool)

(assert (=> b!626755 m!602419))

(declare-fun m!602421 () Bool)

(assert (=> b!626754 m!602421))

(declare-fun m!602423 () Bool)

(assert (=> start!56616 m!602423))

(declare-fun m!602425 () Bool)

(assert (=> start!56616 m!602425))

(declare-fun m!602427 () Bool)

(assert (=> b!626759 m!602427))

(declare-fun m!602429 () Bool)

(assert (=> b!626757 m!602429))

(declare-fun m!602431 () Bool)

(assert (=> b!626756 m!602431))

(check-sat (not b!626758) (not b!626759) (not b!626756) (not start!56616) (not b!626761) (not b!626757) (not b!626755) (not b!626754))
(check-sat)
