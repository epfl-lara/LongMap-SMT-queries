; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56706 () Bool)

(assert start!56706)

(declare-fun b!628152 () Bool)

(declare-fun res!405750 () Bool)

(declare-fun e!359523 () Bool)

(assert (=> b!628152 (=> (not res!405750) (not e!359523))))

(declare-datatypes ((array!37941 0))(
  ( (array!37942 (arr!18208 (Array (_ BitVec 32) (_ BitVec 64))) (size!18572 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37941)

(declare-datatypes ((List!12156 0))(
  ( (Nil!12153) (Cons!12152 (h!13200 (_ BitVec 64)) (t!18376 List!12156)) )
))
(declare-fun arrayNoDuplicates!0 (array!37941 (_ BitVec 32) List!12156) Bool)

(assert (=> b!628152 (= res!405750 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12153))))

(declare-fun b!628153 () Bool)

(declare-fun res!405755 () Bool)

(assert (=> b!628153 (=> (not res!405755) (not e!359523))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!628153 (= res!405755 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18208 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18208 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!628154 () Bool)

(assert (=> b!628154 (= e!359523 false)))

(declare-fun lt!290473 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!628154 (= lt!290473 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!628155 () Bool)

(declare-fun res!405752 () Bool)

(assert (=> b!628155 (=> (not res!405752) (not e!359523))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37941 (_ BitVec 32)) Bool)

(assert (=> b!628155 (= res!405752 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!628156 () Bool)

(declare-fun res!405749 () Bool)

(declare-fun e!359521 () Bool)

(assert (=> b!628156 (=> (not res!405749) (not e!359521))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!628156 (= res!405749 (validKeyInArray!0 k0!1786))))

(declare-fun b!628157 () Bool)

(declare-fun res!405751 () Bool)

(assert (=> b!628157 (=> (not res!405751) (not e!359521))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!628157 (= res!405751 (validKeyInArray!0 (select (arr!18208 a!2986) j!136)))))

(declare-fun b!628158 () Bool)

(assert (=> b!628158 (= e!359521 e!359523)))

(declare-fun res!405753 () Bool)

(assert (=> b!628158 (=> (not res!405753) (not e!359523))))

(declare-datatypes ((SeekEntryResult!6604 0))(
  ( (MissingZero!6604 (index!28700 (_ BitVec 32))) (Found!6604 (index!28701 (_ BitVec 32))) (Intermediate!6604 (undefined!7416 Bool) (index!28702 (_ BitVec 32)) (x!57587 (_ BitVec 32))) (Undefined!6604) (MissingVacant!6604 (index!28703 (_ BitVec 32))) )
))
(declare-fun lt!290472 () SeekEntryResult!6604)

(assert (=> b!628158 (= res!405753 (or (= lt!290472 (MissingZero!6604 i!1108)) (= lt!290472 (MissingVacant!6604 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37941 (_ BitVec 32)) SeekEntryResult!6604)

(assert (=> b!628158 (= lt!290472 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!628159 () Bool)

(declare-fun res!405754 () Bool)

(assert (=> b!628159 (=> (not res!405754) (not e!359523))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37941 (_ BitVec 32)) SeekEntryResult!6604)

(assert (=> b!628159 (= res!405754 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18208 a!2986) j!136) a!2986 mask!3053) (Found!6604 j!136)))))

(declare-fun b!628160 () Bool)

(declare-fun res!405748 () Bool)

(assert (=> b!628160 (=> (not res!405748) (not e!359521))))

(assert (=> b!628160 (= res!405748 (and (= (size!18572 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18572 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18572 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!405757 () Bool)

(assert (=> start!56706 (=> (not res!405757) (not e!359521))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56706 (= res!405757 (validMask!0 mask!3053))))

(assert (=> start!56706 e!359521))

(assert (=> start!56706 true))

(declare-fun array_inv!14067 (array!37941) Bool)

(assert (=> start!56706 (array_inv!14067 a!2986)))

(declare-fun b!628161 () Bool)

(declare-fun res!405756 () Bool)

(assert (=> b!628161 (=> (not res!405756) (not e!359523))))

(assert (=> b!628161 (= res!405756 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18208 a!2986) index!984) (select (arr!18208 a!2986) j!136))) (not (= (select (arr!18208 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!628162 () Bool)

(declare-fun res!405747 () Bool)

(assert (=> b!628162 (=> (not res!405747) (not e!359521))))

(declare-fun arrayContainsKey!0 (array!37941 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!628162 (= res!405747 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!56706 res!405757) b!628160))

(assert (= (and b!628160 res!405748) b!628157))

(assert (= (and b!628157 res!405751) b!628156))

(assert (= (and b!628156 res!405749) b!628162))

(assert (= (and b!628162 res!405747) b!628158))

(assert (= (and b!628158 res!405753) b!628155))

(assert (= (and b!628155 res!405752) b!628152))

(assert (= (and b!628152 res!405750) b!628153))

(assert (= (and b!628153 res!405755) b!628159))

(assert (= (and b!628159 res!405754) b!628161))

(assert (= (and b!628161 res!405756) b!628154))

(declare-fun m!603697 () Bool)

(assert (=> b!628157 m!603697))

(assert (=> b!628157 m!603697))

(declare-fun m!603699 () Bool)

(assert (=> b!628157 m!603699))

(declare-fun m!603701 () Bool)

(assert (=> b!628152 m!603701))

(declare-fun m!603703 () Bool)

(assert (=> b!628158 m!603703))

(declare-fun m!603705 () Bool)

(assert (=> start!56706 m!603705))

(declare-fun m!603707 () Bool)

(assert (=> start!56706 m!603707))

(declare-fun m!603709 () Bool)

(assert (=> b!628153 m!603709))

(declare-fun m!603711 () Bool)

(assert (=> b!628153 m!603711))

(declare-fun m!603713 () Bool)

(assert (=> b!628153 m!603713))

(declare-fun m!603715 () Bool)

(assert (=> b!628156 m!603715))

(declare-fun m!603717 () Bool)

(assert (=> b!628155 m!603717))

(declare-fun m!603719 () Bool)

(assert (=> b!628154 m!603719))

(declare-fun m!603721 () Bool)

(assert (=> b!628161 m!603721))

(assert (=> b!628161 m!603697))

(declare-fun m!603723 () Bool)

(assert (=> b!628162 m!603723))

(assert (=> b!628159 m!603697))

(assert (=> b!628159 m!603697))

(declare-fun m!603725 () Bool)

(assert (=> b!628159 m!603725))

(check-sat (not start!56706) (not b!628152) (not b!628155) (not b!628162) (not b!628154) (not b!628157) (not b!628159) (not b!628156) (not b!628158))
(check-sat)
