; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53514 () Bool)

(assert start!53514)

(declare-fun b!582000 () Bool)

(declare-fun res!369714 () Bool)

(declare-fun e!333907 () Bool)

(assert (=> b!582000 (=> (not res!369714) (not e!333907))))

(declare-datatypes ((array!36360 0))(
  ( (array!36361 (arr!17452 (Array (_ BitVec 32) (_ BitVec 64))) (size!17816 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36360)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!582000 (= res!369714 (validKeyInArray!0 (select (arr!17452 a!2986) j!136)))))

(declare-fun res!369711 () Bool)

(assert (=> start!53514 (=> (not res!369711) (not e!333907))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53514 (= res!369711 (validMask!0 mask!3053))))

(assert (=> start!53514 e!333907))

(assert (=> start!53514 true))

(declare-fun array_inv!13311 (array!36360) Bool)

(assert (=> start!53514 (array_inv!13311 a!2986)))

(declare-fun b!582001 () Bool)

(declare-fun res!369718 () Bool)

(declare-fun e!333908 () Bool)

(assert (=> b!582001 (=> (not res!369718) (not e!333908))))

(declare-datatypes ((List!11400 0))(
  ( (Nil!11397) (Cons!11396 (h!12444 (_ BitVec 64)) (t!17620 List!11400)) )
))
(declare-fun arrayNoDuplicates!0 (array!36360 (_ BitVec 32) List!11400) Bool)

(assert (=> b!582001 (= res!369718 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11397))))

(declare-fun b!582002 () Bool)

(declare-fun res!369721 () Bool)

(assert (=> b!582002 (=> (not res!369721) (not e!333908))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36360 (_ BitVec 32)) Bool)

(assert (=> b!582002 (= res!369721 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun b!582003 () Bool)

(assert (=> b!582003 (= e!333908 (not (validKeyInArray!0 (select (store (arr!17452 a!2986) i!1108 k0!1786) j!136))))))

(declare-fun b!582004 () Bool)

(declare-fun res!369713 () Bool)

(assert (=> b!582004 (=> (not res!369713) (not e!333908))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!582004 (= res!369713 (and (bvslt x!910 #b01111111111111111111111111111110) (= (select (arr!17452 a!2986) index!984) (select (arr!17452 a!2986) j!136)) (= index!984 j!136) (bvsge mask!3053 #b00000000000000000000000000000000)))))

(declare-fun b!582005 () Bool)

(declare-fun res!369712 () Bool)

(assert (=> b!582005 (=> (not res!369712) (not e!333908))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!582005 (= res!369712 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17452 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17452 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!582006 () Bool)

(declare-fun res!369716 () Bool)

(assert (=> b!582006 (=> (not res!369716) (not e!333908))))

(declare-datatypes ((SeekEntryResult!5848 0))(
  ( (MissingZero!5848 (index!25619 (_ BitVec 32))) (Found!5848 (index!25620 (_ BitVec 32))) (Intermediate!5848 (undefined!6660 Bool) (index!25621 (_ BitVec 32)) (x!54632 (_ BitVec 32))) (Undefined!5848) (MissingVacant!5848 (index!25622 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36360 (_ BitVec 32)) SeekEntryResult!5848)

(assert (=> b!582006 (= res!369716 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17452 a!2986) j!136) a!2986 mask!3053) (Found!5848 j!136)))))

(declare-fun b!582007 () Bool)

(declare-fun res!369717 () Bool)

(assert (=> b!582007 (=> (not res!369717) (not e!333907))))

(assert (=> b!582007 (= res!369717 (and (= (size!17816 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17816 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17816 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!582008 () Bool)

(declare-fun res!369720 () Bool)

(assert (=> b!582008 (=> (not res!369720) (not e!333907))))

(declare-fun arrayContainsKey!0 (array!36360 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!582008 (= res!369720 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!582009 () Bool)

(assert (=> b!582009 (= e!333907 e!333908)))

(declare-fun res!369719 () Bool)

(assert (=> b!582009 (=> (not res!369719) (not e!333908))))

(declare-fun lt!265093 () SeekEntryResult!5848)

(assert (=> b!582009 (= res!369719 (or (= lt!265093 (MissingZero!5848 i!1108)) (= lt!265093 (MissingVacant!5848 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36360 (_ BitVec 32)) SeekEntryResult!5848)

(assert (=> b!582009 (= lt!265093 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!582010 () Bool)

(declare-fun res!369715 () Bool)

(assert (=> b!582010 (=> (not res!369715) (not e!333907))))

(assert (=> b!582010 (= res!369715 (validKeyInArray!0 k0!1786))))

(assert (= (and start!53514 res!369711) b!582007))

(assert (= (and b!582007 res!369717) b!582000))

(assert (= (and b!582000 res!369714) b!582010))

(assert (= (and b!582010 res!369715) b!582008))

(assert (= (and b!582008 res!369720) b!582009))

(assert (= (and b!582009 res!369719) b!582002))

(assert (= (and b!582002 res!369721) b!582001))

(assert (= (and b!582001 res!369718) b!582005))

(assert (= (and b!582005 res!369712) b!582006))

(assert (= (and b!582006 res!369716) b!582004))

(assert (= (and b!582004 res!369713) b!582003))

(declare-fun m!560675 () Bool)

(assert (=> b!582008 m!560675))

(declare-fun m!560677 () Bool)

(assert (=> b!582005 m!560677))

(declare-fun m!560679 () Bool)

(assert (=> b!582005 m!560679))

(declare-fun m!560681 () Bool)

(assert (=> b!582005 m!560681))

(declare-fun m!560683 () Bool)

(assert (=> b!582010 m!560683))

(declare-fun m!560685 () Bool)

(assert (=> start!53514 m!560685))

(declare-fun m!560687 () Bool)

(assert (=> start!53514 m!560687))

(declare-fun m!560689 () Bool)

(assert (=> b!582004 m!560689))

(declare-fun m!560691 () Bool)

(assert (=> b!582004 m!560691))

(declare-fun m!560693 () Bool)

(assert (=> b!582009 m!560693))

(declare-fun m!560695 () Bool)

(assert (=> b!582001 m!560695))

(assert (=> b!582003 m!560679))

(declare-fun m!560697 () Bool)

(assert (=> b!582003 m!560697))

(assert (=> b!582003 m!560697))

(declare-fun m!560699 () Bool)

(assert (=> b!582003 m!560699))

(assert (=> b!582000 m!560691))

(assert (=> b!582000 m!560691))

(declare-fun m!560701 () Bool)

(assert (=> b!582000 m!560701))

(declare-fun m!560703 () Bool)

(assert (=> b!582002 m!560703))

(assert (=> b!582006 m!560691))

(assert (=> b!582006 m!560691))

(declare-fun m!560705 () Bool)

(assert (=> b!582006 m!560705))

(check-sat (not b!582010) (not b!582006) (not b!582009) (not b!582008) (not b!582002) (not start!53514) (not b!582003) (not b!582001) (not b!582000))
(check-sat)
