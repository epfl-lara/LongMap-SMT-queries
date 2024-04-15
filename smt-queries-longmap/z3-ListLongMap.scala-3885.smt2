; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53304 () Bool)

(assert start!53304)

(declare-fun b!579563 () Bool)

(declare-fun e!332957 () Bool)

(assert (=> b!579563 (= e!332957 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5821 0))(
  ( (MissingZero!5821 (index!25511 (_ BitVec 32))) (Found!5821 (index!25512 (_ BitVec 32))) (Intermediate!5821 (undefined!6633 Bool) (index!25513 (_ BitVec 32)) (x!54405 (_ BitVec 32))) (Undefined!5821) (MissingVacant!5821 (index!25514 (_ BitVec 32))) )
))
(declare-fun lt!264336 () SeekEntryResult!5821)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36219 0))(
  ( (array!36220 (arr!17384 (Array (_ BitVec 32) (_ BitVec 64))) (size!17749 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36219)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36219 (_ BitVec 32)) SeekEntryResult!5821)

(assert (=> b!579563 (= lt!264336 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17384 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!579564 () Bool)

(declare-fun res!367526 () Bool)

(declare-fun e!332958 () Bool)

(assert (=> b!579564 (=> (not res!367526) (not e!332958))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36219 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!579564 (= res!367526 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!579565 () Bool)

(declare-fun res!367523 () Bool)

(assert (=> b!579565 (=> (not res!367523) (not e!332957))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!579565 (= res!367523 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17384 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17384 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!579566 () Bool)

(declare-fun res!367528 () Bool)

(assert (=> b!579566 (=> (not res!367528) (not e!332957))))

(declare-datatypes ((List!11464 0))(
  ( (Nil!11461) (Cons!11460 (h!12505 (_ BitVec 64)) (t!17683 List!11464)) )
))
(declare-fun arrayNoDuplicates!0 (array!36219 (_ BitVec 32) List!11464) Bool)

(assert (=> b!579566 (= res!367528 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11461))))

(declare-fun b!579567 () Bool)

(declare-fun res!367521 () Bool)

(assert (=> b!579567 (=> (not res!367521) (not e!332957))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36219 (_ BitVec 32)) Bool)

(assert (=> b!579567 (= res!367521 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!579568 () Bool)

(assert (=> b!579568 (= e!332958 e!332957)))

(declare-fun res!367522 () Bool)

(assert (=> b!579568 (=> (not res!367522) (not e!332957))))

(declare-fun lt!264337 () SeekEntryResult!5821)

(assert (=> b!579568 (= res!367522 (or (= lt!264337 (MissingZero!5821 i!1108)) (= lt!264337 (MissingVacant!5821 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36219 (_ BitVec 32)) SeekEntryResult!5821)

(assert (=> b!579568 (= lt!264337 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!579569 () Bool)

(declare-fun res!367529 () Bool)

(assert (=> b!579569 (=> (not res!367529) (not e!332958))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579569 (= res!367529 (validKeyInArray!0 (select (arr!17384 a!2986) j!136)))))

(declare-fun res!367524 () Bool)

(assert (=> start!53304 (=> (not res!367524) (not e!332958))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53304 (= res!367524 (validMask!0 mask!3053))))

(assert (=> start!53304 e!332958))

(assert (=> start!53304 true))

(declare-fun array_inv!13267 (array!36219) Bool)

(assert (=> start!53304 (array_inv!13267 a!2986)))

(declare-fun b!579570 () Bool)

(declare-fun res!367527 () Bool)

(assert (=> b!579570 (=> (not res!367527) (not e!332958))))

(assert (=> b!579570 (= res!367527 (validKeyInArray!0 k0!1786))))

(declare-fun b!579571 () Bool)

(declare-fun res!367525 () Bool)

(assert (=> b!579571 (=> (not res!367525) (not e!332958))))

(assert (=> b!579571 (= res!367525 (and (= (size!17749 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17749 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17749 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53304 res!367524) b!579571))

(assert (= (and b!579571 res!367525) b!579569))

(assert (= (and b!579569 res!367529) b!579570))

(assert (= (and b!579570 res!367527) b!579564))

(assert (= (and b!579564 res!367526) b!579568))

(assert (= (and b!579568 res!367522) b!579567))

(assert (= (and b!579567 res!367521) b!579566))

(assert (= (and b!579566 res!367528) b!579565))

(assert (= (and b!579565 res!367523) b!579563))

(declare-fun m!557653 () Bool)

(assert (=> b!579565 m!557653))

(declare-fun m!557655 () Bool)

(assert (=> b!579565 m!557655))

(declare-fun m!557657 () Bool)

(assert (=> b!579565 m!557657))

(declare-fun m!557659 () Bool)

(assert (=> b!579566 m!557659))

(declare-fun m!557661 () Bool)

(assert (=> b!579563 m!557661))

(assert (=> b!579563 m!557661))

(declare-fun m!557663 () Bool)

(assert (=> b!579563 m!557663))

(declare-fun m!557665 () Bool)

(assert (=> b!579564 m!557665))

(declare-fun m!557667 () Bool)

(assert (=> b!579568 m!557667))

(declare-fun m!557669 () Bool)

(assert (=> b!579567 m!557669))

(declare-fun m!557671 () Bool)

(assert (=> start!53304 m!557671))

(declare-fun m!557673 () Bool)

(assert (=> start!53304 m!557673))

(declare-fun m!557675 () Bool)

(assert (=> b!579570 m!557675))

(assert (=> b!579569 m!557661))

(assert (=> b!579569 m!557661))

(declare-fun m!557677 () Bool)

(assert (=> b!579569 m!557677))

(check-sat (not b!579563) (not start!53304) (not b!579567) (not b!579566) (not b!579568) (not b!579569) (not b!579564) (not b!579570))
(check-sat)
