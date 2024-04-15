; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56430 () Bool)

(assert start!56430)

(declare-fun b!625490 () Bool)

(declare-fun e!358419 () Bool)

(declare-fun e!358418 () Bool)

(assert (=> b!625490 (= e!358419 e!358418)))

(declare-fun res!403645 () Bool)

(assert (=> b!625490 (=> (not res!403645) (not e!358418))))

(declare-datatypes ((SeekEntryResult!6592 0))(
  ( (MissingZero!6592 (index!28652 (_ BitVec 32))) (Found!6592 (index!28653 (_ BitVec 32))) (Intermediate!6592 (undefined!7404 Bool) (index!28654 (_ BitVec 32)) (x!57409 (_ BitVec 32))) (Undefined!6592) (MissingVacant!6592 (index!28655 (_ BitVec 32))) )
))
(declare-fun lt!289662 () SeekEntryResult!6592)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!625490 (= res!403645 (or (= lt!289662 (MissingZero!6592 i!1108)) (= lt!289662 (MissingVacant!6592 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!37824 0))(
  ( (array!37825 (arr!18155 (Array (_ BitVec 32) (_ BitVec 64))) (size!18520 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37824)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37824 (_ BitVec 32)) SeekEntryResult!6592)

(assert (=> b!625490 (= lt!289662 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!625491 () Bool)

(declare-fun res!403646 () Bool)

(assert (=> b!625491 (=> (not res!403646) (not e!358419))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!625491 (= res!403646 (validKeyInArray!0 (select (arr!18155 a!2986) j!136)))))

(declare-fun b!625492 () Bool)

(declare-fun res!403641 () Bool)

(assert (=> b!625492 (=> (not res!403641) (not e!358418))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37824 (_ BitVec 32)) Bool)

(assert (=> b!625492 (= res!403641 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!625493 () Bool)

(declare-fun res!403643 () Bool)

(assert (=> b!625493 (=> (not res!403643) (not e!358418))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!625493 (= res!403643 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18155 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18155 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!625494 () Bool)

(declare-fun res!403642 () Bool)

(assert (=> b!625494 (=> (not res!403642) (not e!358419))))

(assert (=> b!625494 (= res!403642 (validKeyInArray!0 k0!1786))))

(declare-fun b!625495 () Bool)

(assert (=> b!625495 (= e!358418 false)))

(declare-fun lt!289663 () SeekEntryResult!6592)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37824 (_ BitVec 32)) SeekEntryResult!6592)

(assert (=> b!625495 (= lt!289663 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18155 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!625496 () Bool)

(declare-fun res!403638 () Bool)

(assert (=> b!625496 (=> (not res!403638) (not e!358418))))

(declare-datatypes ((List!12235 0))(
  ( (Nil!12232) (Cons!12231 (h!13276 (_ BitVec 64)) (t!18454 List!12235)) )
))
(declare-fun arrayNoDuplicates!0 (array!37824 (_ BitVec 32) List!12235) Bool)

(assert (=> b!625496 (= res!403638 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12232))))

(declare-fun b!625497 () Bool)

(declare-fun res!403640 () Bool)

(assert (=> b!625497 (=> (not res!403640) (not e!358419))))

(assert (=> b!625497 (= res!403640 (and (= (size!18520 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18520 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18520 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!403644 () Bool)

(assert (=> start!56430 (=> (not res!403644) (not e!358419))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56430 (= res!403644 (validMask!0 mask!3053))))

(assert (=> start!56430 e!358419))

(assert (=> start!56430 true))

(declare-fun array_inv!14038 (array!37824) Bool)

(assert (=> start!56430 (array_inv!14038 a!2986)))

(declare-fun b!625498 () Bool)

(declare-fun res!403639 () Bool)

(assert (=> b!625498 (=> (not res!403639) (not e!358419))))

(declare-fun arrayContainsKey!0 (array!37824 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!625498 (= res!403639 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!56430 res!403644) b!625497))

(assert (= (and b!625497 res!403640) b!625491))

(assert (= (and b!625491 res!403646) b!625494))

(assert (= (and b!625494 res!403642) b!625498))

(assert (= (and b!625498 res!403639) b!625490))

(assert (= (and b!625490 res!403645) b!625492))

(assert (= (and b!625492 res!403641) b!625496))

(assert (= (and b!625496 res!403638) b!625493))

(assert (= (and b!625493 res!403643) b!625495))

(declare-fun m!600547 () Bool)

(assert (=> b!625496 m!600547))

(declare-fun m!600549 () Bool)

(assert (=> b!625490 m!600549))

(declare-fun m!600551 () Bool)

(assert (=> b!625493 m!600551))

(declare-fun m!600553 () Bool)

(assert (=> b!625493 m!600553))

(declare-fun m!600555 () Bool)

(assert (=> b!625493 m!600555))

(declare-fun m!600557 () Bool)

(assert (=> b!625491 m!600557))

(assert (=> b!625491 m!600557))

(declare-fun m!600559 () Bool)

(assert (=> b!625491 m!600559))

(declare-fun m!600561 () Bool)

(assert (=> b!625494 m!600561))

(declare-fun m!600563 () Bool)

(assert (=> start!56430 m!600563))

(declare-fun m!600565 () Bool)

(assert (=> start!56430 m!600565))

(declare-fun m!600567 () Bool)

(assert (=> b!625498 m!600567))

(assert (=> b!625495 m!600557))

(assert (=> b!625495 m!600557))

(declare-fun m!600569 () Bool)

(assert (=> b!625495 m!600569))

(declare-fun m!600571 () Bool)

(assert (=> b!625492 m!600571))

(check-sat (not b!625491) (not b!625492) (not b!625490) (not b!625495) (not b!625496) (not start!56430) (not b!625498) (not b!625494))
(check-sat)
