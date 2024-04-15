; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53934 () Bool)

(assert start!53934)

(declare-fun res!376455 () Bool)

(declare-fun e!336124 () Bool)

(assert (=> start!53934 (=> (not res!376455) (not e!336124))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53934 (= res!376455 (validMask!0 mask!3053))))

(assert (=> start!53934 e!336124))

(assert (=> start!53934 true))

(declare-datatypes ((array!36792 0))(
  ( (array!36793 (arr!17669 (Array (_ BitVec 32) (_ BitVec 64))) (size!18034 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36792)

(declare-fun array_inv!13552 (array!36792) Bool)

(assert (=> start!53934 (array_inv!13552 a!2986)))

(declare-fun b!588726 () Bool)

(declare-datatypes ((Unit!18336 0))(
  ( (Unit!18337) )
))
(declare-fun e!336123 () Unit!18336)

(declare-fun Unit!18338 () Unit!18336)

(assert (=> b!588726 (= e!336123 Unit!18338)))

(assert (=> b!588726 false))

(declare-fun b!588727 () Bool)

(declare-fun e!336126 () Bool)

(assert (=> b!588727 (= e!336124 e!336126)))

(declare-fun res!376457 () Bool)

(assert (=> b!588727 (=> (not res!376457) (not e!336126))))

(declare-datatypes ((SeekEntryResult!6106 0))(
  ( (MissingZero!6106 (index!26654 (_ BitVec 32))) (Found!6106 (index!26655 (_ BitVec 32))) (Intermediate!6106 (undefined!6918 Bool) (index!26656 (_ BitVec 32)) (x!55459 (_ BitVec 32))) (Undefined!6106) (MissingVacant!6106 (index!26657 (_ BitVec 32))) )
))
(declare-fun lt!266857 () SeekEntryResult!6106)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!588727 (= res!376457 (or (= lt!266857 (MissingZero!6106 i!1108)) (= lt!266857 (MissingVacant!6106 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36792 (_ BitVec 32)) SeekEntryResult!6106)

(assert (=> b!588727 (= lt!266857 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!588728 () Bool)

(declare-fun e!336127 () Bool)

(assert (=> b!588728 (= e!336127 (not true))))

(declare-fun lt!266858 () Unit!18336)

(assert (=> b!588728 (= lt!266858 e!336123)))

(declare-fun lt!266856 () array!36792)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lt!266860 () (_ BitVec 64))

(declare-fun c!66507 () Bool)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36792 (_ BitVec 32)) SeekEntryResult!6106)

(assert (=> b!588728 (= c!66507 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!266860 lt!266856 mask!3053) Undefined!6106))))

(declare-fun e!336129 () Bool)

(assert (=> b!588728 e!336129))

(declare-fun res!376451 () Bool)

(assert (=> b!588728 (=> (not res!376451) (not e!336129))))

(declare-fun lt!266853 () (_ BitVec 32))

(declare-fun lt!266859 () SeekEntryResult!6106)

(assert (=> b!588728 (= res!376451 (= lt!266859 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266853 vacantSpotIndex!68 lt!266860 lt!266856 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!588728 (= lt!266859 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266853 vacantSpotIndex!68 (select (arr!17669 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!588728 (= lt!266860 (select (store (arr!17669 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!266855 () Unit!18336)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36792 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18336)

(assert (=> b!588728 (= lt!266855 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266853 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!588728 (= lt!266853 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!588729 () Bool)

(declare-fun lt!266854 () SeekEntryResult!6106)

(assert (=> b!588729 (= e!336129 (= lt!266854 lt!266859))))

(declare-fun b!588730 () Bool)

(declare-fun res!376456 () Bool)

(assert (=> b!588730 (=> (not res!376456) (not e!336126))))

(assert (=> b!588730 (= res!376456 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17669 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!588731 () Bool)

(declare-fun Unit!18339 () Unit!18336)

(assert (=> b!588731 (= e!336123 Unit!18339)))

(declare-fun b!588732 () Bool)

(declare-fun res!376454 () Bool)

(assert (=> b!588732 (=> (not res!376454) (not e!336124))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!588732 (= res!376454 (validKeyInArray!0 k0!1786))))

(declare-fun b!588733 () Bool)

(declare-fun res!376450 () Bool)

(assert (=> b!588733 (=> (not res!376450) (not e!336124))))

(declare-fun arrayContainsKey!0 (array!36792 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!588733 (= res!376450 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!588734 () Bool)

(declare-fun e!336128 () Bool)

(assert (=> b!588734 (= e!336128 e!336127)))

(declare-fun res!376449 () Bool)

(assert (=> b!588734 (=> (not res!376449) (not e!336127))))

(assert (=> b!588734 (= res!376449 (and (= lt!266854 (Found!6106 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17669 a!2986) index!984) (select (arr!17669 a!2986) j!136))) (not (= (select (arr!17669 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!588734 (= lt!266854 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17669 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!588735 () Bool)

(declare-fun res!376453 () Bool)

(assert (=> b!588735 (=> (not res!376453) (not e!336124))))

(assert (=> b!588735 (= res!376453 (and (= (size!18034 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18034 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18034 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!588736 () Bool)

(declare-fun res!376448 () Bool)

(assert (=> b!588736 (=> (not res!376448) (not e!336126))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36792 (_ BitVec 32)) Bool)

(assert (=> b!588736 (= res!376448 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!588737 () Bool)

(declare-fun res!376447 () Bool)

(assert (=> b!588737 (=> (not res!376447) (not e!336124))))

(assert (=> b!588737 (= res!376447 (validKeyInArray!0 (select (arr!17669 a!2986) j!136)))))

(declare-fun b!588738 () Bool)

(declare-fun res!376452 () Bool)

(assert (=> b!588738 (=> (not res!376452) (not e!336126))))

(declare-datatypes ((List!11749 0))(
  ( (Nil!11746) (Cons!11745 (h!12790 (_ BitVec 64)) (t!17968 List!11749)) )
))
(declare-fun arrayNoDuplicates!0 (array!36792 (_ BitVec 32) List!11749) Bool)

(assert (=> b!588738 (= res!376452 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11746))))

(declare-fun b!588739 () Bool)

(assert (=> b!588739 (= e!336126 e!336128)))

(declare-fun res!376446 () Bool)

(assert (=> b!588739 (=> (not res!376446) (not e!336128))))

(assert (=> b!588739 (= res!376446 (= (select (store (arr!17669 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!588739 (= lt!266856 (array!36793 (store (arr!17669 a!2986) i!1108 k0!1786) (size!18034 a!2986)))))

(assert (= (and start!53934 res!376455) b!588735))

(assert (= (and b!588735 res!376453) b!588737))

(assert (= (and b!588737 res!376447) b!588732))

(assert (= (and b!588732 res!376454) b!588733))

(assert (= (and b!588733 res!376450) b!588727))

(assert (= (and b!588727 res!376457) b!588736))

(assert (= (and b!588736 res!376448) b!588738))

(assert (= (and b!588738 res!376452) b!588730))

(assert (= (and b!588730 res!376456) b!588739))

(assert (= (and b!588739 res!376446) b!588734))

(assert (= (and b!588734 res!376449) b!588728))

(assert (= (and b!588728 res!376451) b!588729))

(assert (= (and b!588728 c!66507) b!588726))

(assert (= (and b!588728 (not c!66507)) b!588731))

(declare-fun m!566761 () Bool)

(assert (=> b!588733 m!566761))

(declare-fun m!566763 () Bool)

(assert (=> b!588728 m!566763))

(declare-fun m!566765 () Bool)

(assert (=> b!588728 m!566765))

(declare-fun m!566767 () Bool)

(assert (=> b!588728 m!566767))

(assert (=> b!588728 m!566767))

(declare-fun m!566769 () Bool)

(assert (=> b!588728 m!566769))

(declare-fun m!566771 () Bool)

(assert (=> b!588728 m!566771))

(declare-fun m!566773 () Bool)

(assert (=> b!588728 m!566773))

(declare-fun m!566775 () Bool)

(assert (=> b!588728 m!566775))

(declare-fun m!566777 () Bool)

(assert (=> b!588728 m!566777))

(assert (=> b!588739 m!566771))

(declare-fun m!566779 () Bool)

(assert (=> b!588739 m!566779))

(assert (=> b!588737 m!566767))

(assert (=> b!588737 m!566767))

(declare-fun m!566781 () Bool)

(assert (=> b!588737 m!566781))

(declare-fun m!566783 () Bool)

(assert (=> b!588736 m!566783))

(declare-fun m!566785 () Bool)

(assert (=> b!588732 m!566785))

(declare-fun m!566787 () Bool)

(assert (=> b!588727 m!566787))

(declare-fun m!566789 () Bool)

(assert (=> b!588734 m!566789))

(assert (=> b!588734 m!566767))

(assert (=> b!588734 m!566767))

(declare-fun m!566791 () Bool)

(assert (=> b!588734 m!566791))

(declare-fun m!566793 () Bool)

(assert (=> start!53934 m!566793))

(declare-fun m!566795 () Bool)

(assert (=> start!53934 m!566795))

(declare-fun m!566797 () Bool)

(assert (=> b!588738 m!566797))

(declare-fun m!566799 () Bool)

(assert (=> b!588730 m!566799))

(check-sat (not b!588733) (not b!588736) (not b!588737) (not start!53934) (not b!588728) (not b!588727) (not b!588738) (not b!588732) (not b!588734))
(check-sat)
