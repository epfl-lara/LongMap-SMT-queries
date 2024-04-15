; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53388 () Bool)

(assert start!53388)

(declare-fun b!580706 () Bool)

(declare-fun res!368669 () Bool)

(declare-fun e!333334 () Bool)

(assert (=> b!580706 (=> (not res!368669) (not e!333334))))

(declare-datatypes ((array!36303 0))(
  ( (array!36304 (arr!17426 (Array (_ BitVec 32) (_ BitVec 64))) (size!17791 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36303)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36303 (_ BitVec 32)) Bool)

(assert (=> b!580706 (= res!368669 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!580707 () Bool)

(assert (=> b!580707 (= e!333334 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5863 0))(
  ( (MissingZero!5863 (index!25679 (_ BitVec 32))) (Found!5863 (index!25680 (_ BitVec 32))) (Intermediate!5863 (undefined!6675 Bool) (index!25681 (_ BitVec 32)) (x!54559 (_ BitVec 32))) (Undefined!5863) (MissingVacant!5863 (index!25682 (_ BitVec 32))) )
))
(declare-fun lt!264580 () SeekEntryResult!5863)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36303 (_ BitVec 32)) SeekEntryResult!5863)

(assert (=> b!580707 (= lt!264580 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17426 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!580708 () Bool)

(declare-fun res!368670 () Bool)

(assert (=> b!580708 (=> (not res!368670) (not e!333334))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!580708 (= res!368670 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17426 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17426 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!580709 () Bool)

(declare-fun res!368672 () Bool)

(declare-fun e!333335 () Bool)

(assert (=> b!580709 (=> (not res!368672) (not e!333335))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!580709 (= res!368672 (validKeyInArray!0 k0!1786))))

(declare-fun b!580710 () Bool)

(declare-fun res!368667 () Bool)

(assert (=> b!580710 (=> (not res!368667) (not e!333335))))

(assert (=> b!580710 (= res!368667 (and (= (size!17791 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17791 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17791 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!580712 () Bool)

(assert (=> b!580712 (= e!333335 e!333334)))

(declare-fun res!368668 () Bool)

(assert (=> b!580712 (=> (not res!368668) (not e!333334))))

(declare-fun lt!264579 () SeekEntryResult!5863)

(assert (=> b!580712 (= res!368668 (or (= lt!264579 (MissingZero!5863 i!1108)) (= lt!264579 (MissingVacant!5863 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36303 (_ BitVec 32)) SeekEntryResult!5863)

(assert (=> b!580712 (= lt!264579 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!580711 () Bool)

(declare-fun res!368671 () Bool)

(assert (=> b!580711 (=> (not res!368671) (not e!333335))))

(declare-fun arrayContainsKey!0 (array!36303 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!580711 (= res!368671 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!368665 () Bool)

(assert (=> start!53388 (=> (not res!368665) (not e!333335))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53388 (= res!368665 (validMask!0 mask!3053))))

(assert (=> start!53388 e!333335))

(assert (=> start!53388 true))

(declare-fun array_inv!13309 (array!36303) Bool)

(assert (=> start!53388 (array_inv!13309 a!2986)))

(declare-fun b!580713 () Bool)

(declare-fun res!368664 () Bool)

(assert (=> b!580713 (=> (not res!368664) (not e!333334))))

(declare-datatypes ((List!11506 0))(
  ( (Nil!11503) (Cons!11502 (h!12547 (_ BitVec 64)) (t!17725 List!11506)) )
))
(declare-fun arrayNoDuplicates!0 (array!36303 (_ BitVec 32) List!11506) Bool)

(assert (=> b!580713 (= res!368664 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11503))))

(declare-fun b!580714 () Bool)

(declare-fun res!368666 () Bool)

(assert (=> b!580714 (=> (not res!368666) (not e!333335))))

(assert (=> b!580714 (= res!368666 (validKeyInArray!0 (select (arr!17426 a!2986) j!136)))))

(assert (= (and start!53388 res!368665) b!580710))

(assert (= (and b!580710 res!368667) b!580714))

(assert (= (and b!580714 res!368666) b!580709))

(assert (= (and b!580709 res!368672) b!580711))

(assert (= (and b!580711 res!368671) b!580712))

(assert (= (and b!580712 res!368668) b!580706))

(assert (= (and b!580706 res!368669) b!580713))

(assert (= (and b!580713 res!368664) b!580708))

(assert (= (and b!580708 res!368670) b!580707))

(declare-fun m!558751 () Bool)

(assert (=> b!580708 m!558751))

(declare-fun m!558753 () Bool)

(assert (=> b!580708 m!558753))

(declare-fun m!558755 () Bool)

(assert (=> b!580708 m!558755))

(declare-fun m!558757 () Bool)

(assert (=> start!53388 m!558757))

(declare-fun m!558759 () Bool)

(assert (=> start!53388 m!558759))

(declare-fun m!558761 () Bool)

(assert (=> b!580714 m!558761))

(assert (=> b!580714 m!558761))

(declare-fun m!558763 () Bool)

(assert (=> b!580714 m!558763))

(declare-fun m!558765 () Bool)

(assert (=> b!580713 m!558765))

(declare-fun m!558767 () Bool)

(assert (=> b!580709 m!558767))

(declare-fun m!558769 () Bool)

(assert (=> b!580706 m!558769))

(assert (=> b!580707 m!558761))

(assert (=> b!580707 m!558761))

(declare-fun m!558771 () Bool)

(assert (=> b!580707 m!558771))

(declare-fun m!558773 () Bool)

(assert (=> b!580712 m!558773))

(declare-fun m!558775 () Bool)

(assert (=> b!580711 m!558775))

(check-sat (not b!580706) (not b!580713) (not b!580712) (not b!580711) (not b!580707) (not b!580714) (not b!580709) (not start!53388))
(check-sat)
