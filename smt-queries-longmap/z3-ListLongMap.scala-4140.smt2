; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56418 () Bool)

(assert start!56418)

(declare-fun b!625328 () Bool)

(declare-fun e!358363 () Bool)

(assert (=> b!625328 (= e!358363 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6586 0))(
  ( (MissingZero!6586 (index!28628 (_ BitVec 32))) (Found!6586 (index!28629 (_ BitVec 32))) (Intermediate!6586 (undefined!7398 Bool) (index!28630 (_ BitVec 32)) (x!57387 (_ BitVec 32))) (Undefined!6586) (MissingVacant!6586 (index!28631 (_ BitVec 32))) )
))
(declare-fun lt!289626 () SeekEntryResult!6586)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37812 0))(
  ( (array!37813 (arr!18149 (Array (_ BitVec 32) (_ BitVec 64))) (size!18514 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37812)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37812 (_ BitVec 32)) SeekEntryResult!6586)

(assert (=> b!625328 (= lt!289626 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18149 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!625329 () Bool)

(declare-fun res!403477 () Bool)

(declare-fun e!358365 () Bool)

(assert (=> b!625329 (=> (not res!403477) (not e!358365))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37812 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!625329 (= res!403477 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!625330 () Bool)

(declare-fun res!403480 () Bool)

(assert (=> b!625330 (=> (not res!403480) (not e!358365))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!625330 (= res!403480 (validKeyInArray!0 (select (arr!18149 a!2986) j!136)))))

(declare-fun b!625331 () Bool)

(declare-fun res!403483 () Bool)

(assert (=> b!625331 (=> (not res!403483) (not e!358363))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37812 (_ BitVec 32)) Bool)

(assert (=> b!625331 (= res!403483 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!625332 () Bool)

(declare-fun res!403479 () Bool)

(assert (=> b!625332 (=> (not res!403479) (not e!358365))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!625332 (= res!403479 (and (= (size!18514 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18514 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18514 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!625333 () Bool)

(declare-fun res!403478 () Bool)

(assert (=> b!625333 (=> (not res!403478) (not e!358363))))

(declare-datatypes ((List!12229 0))(
  ( (Nil!12226) (Cons!12225 (h!13270 (_ BitVec 64)) (t!18448 List!12229)) )
))
(declare-fun arrayNoDuplicates!0 (array!37812 (_ BitVec 32) List!12229) Bool)

(assert (=> b!625333 (= res!403478 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12226))))

(declare-fun b!625334 () Bool)

(declare-fun res!403482 () Bool)

(assert (=> b!625334 (=> (not res!403482) (not e!358363))))

(assert (=> b!625334 (= res!403482 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18149 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18149 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!403484 () Bool)

(assert (=> start!56418 (=> (not res!403484) (not e!358365))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56418 (= res!403484 (validMask!0 mask!3053))))

(assert (=> start!56418 e!358365))

(assert (=> start!56418 true))

(declare-fun array_inv!14032 (array!37812) Bool)

(assert (=> start!56418 (array_inv!14032 a!2986)))

(declare-fun b!625335 () Bool)

(assert (=> b!625335 (= e!358365 e!358363)))

(declare-fun res!403481 () Bool)

(assert (=> b!625335 (=> (not res!403481) (not e!358363))))

(declare-fun lt!289627 () SeekEntryResult!6586)

(assert (=> b!625335 (= res!403481 (or (= lt!289627 (MissingZero!6586 i!1108)) (= lt!289627 (MissingVacant!6586 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37812 (_ BitVec 32)) SeekEntryResult!6586)

(assert (=> b!625335 (= lt!289627 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!625336 () Bool)

(declare-fun res!403476 () Bool)

(assert (=> b!625336 (=> (not res!403476) (not e!358365))))

(assert (=> b!625336 (= res!403476 (validKeyInArray!0 k0!1786))))

(assert (= (and start!56418 res!403484) b!625332))

(assert (= (and b!625332 res!403479) b!625330))

(assert (= (and b!625330 res!403480) b!625336))

(assert (= (and b!625336 res!403476) b!625329))

(assert (= (and b!625329 res!403477) b!625335))

(assert (= (and b!625335 res!403481) b!625331))

(assert (= (and b!625331 res!403483) b!625333))

(assert (= (and b!625333 res!403478) b!625334))

(assert (= (and b!625334 res!403482) b!625328))

(declare-fun m!600391 () Bool)

(assert (=> b!625335 m!600391))

(declare-fun m!600393 () Bool)

(assert (=> b!625329 m!600393))

(declare-fun m!600395 () Bool)

(assert (=> b!625328 m!600395))

(assert (=> b!625328 m!600395))

(declare-fun m!600397 () Bool)

(assert (=> b!625328 m!600397))

(declare-fun m!600399 () Bool)

(assert (=> b!625336 m!600399))

(declare-fun m!600401 () Bool)

(assert (=> b!625333 m!600401))

(declare-fun m!600403 () Bool)

(assert (=> b!625331 m!600403))

(assert (=> b!625330 m!600395))

(assert (=> b!625330 m!600395))

(declare-fun m!600405 () Bool)

(assert (=> b!625330 m!600405))

(declare-fun m!600407 () Bool)

(assert (=> b!625334 m!600407))

(declare-fun m!600409 () Bool)

(assert (=> b!625334 m!600409))

(declare-fun m!600411 () Bool)

(assert (=> b!625334 m!600411))

(declare-fun m!600413 () Bool)

(assert (=> start!56418 m!600413))

(declare-fun m!600415 () Bool)

(assert (=> start!56418 m!600415))

(check-sat (not b!625335) (not b!625330) (not b!625328) (not start!56418) (not b!625333) (not b!625331) (not b!625336) (not b!625329))
(check-sat)
