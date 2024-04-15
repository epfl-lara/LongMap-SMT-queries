; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53928 () Bool)

(assert start!53928)

(declare-fun b!588600 () Bool)

(declare-fun res!376345 () Bool)

(declare-fun e!336061 () Bool)

(assert (=> b!588600 (=> (not res!376345) (not e!336061))))

(declare-datatypes ((array!36786 0))(
  ( (array!36787 (arr!17666 (Array (_ BitVec 32) (_ BitVec 64))) (size!18031 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36786)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!588600 (= res!376345 (validKeyInArray!0 (select (arr!17666 a!2986) j!136)))))

(declare-fun b!588601 () Bool)

(declare-datatypes ((Unit!18324 0))(
  ( (Unit!18325) )
))
(declare-fun e!336063 () Unit!18324)

(declare-fun Unit!18326 () Unit!18324)

(assert (=> b!588601 (= e!336063 Unit!18326)))

(assert (=> b!588601 false))

(declare-fun b!588602 () Bool)

(declare-fun Unit!18327 () Unit!18324)

(assert (=> b!588602 (= e!336063 Unit!18327)))

(declare-fun b!588603 () Bool)

(declare-fun e!336066 () Bool)

(assert (=> b!588603 (= e!336061 e!336066)))

(declare-fun res!376340 () Bool)

(assert (=> b!588603 (=> (not res!376340) (not e!336066))))

(declare-datatypes ((SeekEntryResult!6103 0))(
  ( (MissingZero!6103 (index!26642 (_ BitVec 32))) (Found!6103 (index!26643 (_ BitVec 32))) (Intermediate!6103 (undefined!6915 Bool) (index!26644 (_ BitVec 32)) (x!55448 (_ BitVec 32))) (Undefined!6103) (MissingVacant!6103 (index!26645 (_ BitVec 32))) )
))
(declare-fun lt!266785 () SeekEntryResult!6103)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!588603 (= res!376340 (or (= lt!266785 (MissingZero!6103 i!1108)) (= lt!266785 (MissingVacant!6103 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36786 (_ BitVec 32)) SeekEntryResult!6103)

(assert (=> b!588603 (= lt!266785 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!588604 () Bool)

(declare-fun res!376344 () Bool)

(assert (=> b!588604 (=> (not res!376344) (not e!336066))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!588604 (= res!376344 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17666 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!588605 () Bool)

(declare-fun res!376338 () Bool)

(assert (=> b!588605 (=> (not res!376338) (not e!336066))))

(declare-datatypes ((List!11746 0))(
  ( (Nil!11743) (Cons!11742 (h!12787 (_ BitVec 64)) (t!17965 List!11746)) )
))
(declare-fun arrayNoDuplicates!0 (array!36786 (_ BitVec 32) List!11746) Bool)

(assert (=> b!588605 (= res!376338 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11743))))

(declare-fun b!588606 () Bool)

(declare-fun e!336065 () Bool)

(declare-fun e!336064 () Bool)

(assert (=> b!588606 (= e!336065 e!336064)))

(declare-fun res!376343 () Bool)

(assert (=> b!588606 (=> (not res!376343) (not e!336064))))

(declare-fun lt!266783 () SeekEntryResult!6103)

(assert (=> b!588606 (= res!376343 (and (= lt!266783 (Found!6103 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17666 a!2986) index!984) (select (arr!17666 a!2986) j!136))) (not (= (select (arr!17666 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36786 (_ BitVec 32)) SeekEntryResult!6103)

(assert (=> b!588606 (= lt!266783 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17666 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!588607 () Bool)

(declare-fun res!376339 () Bool)

(assert (=> b!588607 (=> (not res!376339) (not e!336061))))

(assert (=> b!588607 (= res!376339 (validKeyInArray!0 k0!1786))))

(declare-fun b!588608 () Bool)

(declare-fun res!376346 () Bool)

(assert (=> b!588608 (=> (not res!376346) (not e!336061))))

(declare-fun arrayContainsKey!0 (array!36786 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!588608 (= res!376346 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!588609 () Bool)

(declare-fun res!376349 () Bool)

(assert (=> b!588609 (=> (not res!376349) (not e!336066))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36786 (_ BitVec 32)) Bool)

(assert (=> b!588609 (= res!376349 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!588610 () Bool)

(assert (=> b!588610 (= e!336064 (not true))))

(declare-fun lt!266782 () Unit!18324)

(assert (=> b!588610 (= lt!266782 e!336063)))

(declare-fun lt!266781 () (_ BitVec 64))

(declare-fun c!66498 () Bool)

(declare-fun lt!266786 () array!36786)

(assert (=> b!588610 (= c!66498 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!266781 lt!266786 mask!3053) Undefined!6103))))

(declare-fun e!336060 () Bool)

(assert (=> b!588610 e!336060))

(declare-fun res!376341 () Bool)

(assert (=> b!588610 (=> (not res!376341) (not e!336060))))

(declare-fun lt!266784 () SeekEntryResult!6103)

(declare-fun lt!266787 () (_ BitVec 32))

(assert (=> b!588610 (= res!376341 (= lt!266784 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266787 vacantSpotIndex!68 lt!266781 lt!266786 mask!3053)))))

(assert (=> b!588610 (= lt!266784 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266787 vacantSpotIndex!68 (select (arr!17666 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!588610 (= lt!266781 (select (store (arr!17666 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!266788 () Unit!18324)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36786 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18324)

(assert (=> b!588610 (= lt!266788 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266787 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!588610 (= lt!266787 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!376342 () Bool)

(assert (=> start!53928 (=> (not res!376342) (not e!336061))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53928 (= res!376342 (validMask!0 mask!3053))))

(assert (=> start!53928 e!336061))

(assert (=> start!53928 true))

(declare-fun array_inv!13549 (array!36786) Bool)

(assert (=> start!53928 (array_inv!13549 a!2986)))

(declare-fun b!588611 () Bool)

(assert (=> b!588611 (= e!336066 e!336065)))

(declare-fun res!376348 () Bool)

(assert (=> b!588611 (=> (not res!376348) (not e!336065))))

(assert (=> b!588611 (= res!376348 (= (select (store (arr!17666 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!588611 (= lt!266786 (array!36787 (store (arr!17666 a!2986) i!1108 k0!1786) (size!18031 a!2986)))))

(declare-fun b!588612 () Bool)

(assert (=> b!588612 (= e!336060 (= lt!266783 lt!266784))))

(declare-fun b!588613 () Bool)

(declare-fun res!376347 () Bool)

(assert (=> b!588613 (=> (not res!376347) (not e!336061))))

(assert (=> b!588613 (= res!376347 (and (= (size!18031 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18031 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18031 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53928 res!376342) b!588613))

(assert (= (and b!588613 res!376347) b!588600))

(assert (= (and b!588600 res!376345) b!588607))

(assert (= (and b!588607 res!376339) b!588608))

(assert (= (and b!588608 res!376346) b!588603))

(assert (= (and b!588603 res!376340) b!588609))

(assert (= (and b!588609 res!376349) b!588605))

(assert (= (and b!588605 res!376338) b!588604))

(assert (= (and b!588604 res!376344) b!588611))

(assert (= (and b!588611 res!376348) b!588606))

(assert (= (and b!588606 res!376343) b!588610))

(assert (= (and b!588610 res!376341) b!588612))

(assert (= (and b!588610 c!66498) b!588601))

(assert (= (and b!588610 (not c!66498)) b!588602))

(declare-fun m!566641 () Bool)

(assert (=> b!588609 m!566641))

(declare-fun m!566643 () Bool)

(assert (=> b!588604 m!566643))

(declare-fun m!566645 () Bool)

(assert (=> start!53928 m!566645))

(declare-fun m!566647 () Bool)

(assert (=> start!53928 m!566647))

(declare-fun m!566649 () Bool)

(assert (=> b!588607 m!566649))

(declare-fun m!566651 () Bool)

(assert (=> b!588611 m!566651))

(declare-fun m!566653 () Bool)

(assert (=> b!588611 m!566653))

(declare-fun m!566655 () Bool)

(assert (=> b!588600 m!566655))

(assert (=> b!588600 m!566655))

(declare-fun m!566657 () Bool)

(assert (=> b!588600 m!566657))

(declare-fun m!566659 () Bool)

(assert (=> b!588610 m!566659))

(declare-fun m!566661 () Bool)

(assert (=> b!588610 m!566661))

(declare-fun m!566663 () Bool)

(assert (=> b!588610 m!566663))

(assert (=> b!588610 m!566655))

(assert (=> b!588610 m!566655))

(declare-fun m!566665 () Bool)

(assert (=> b!588610 m!566665))

(assert (=> b!588610 m!566651))

(declare-fun m!566667 () Bool)

(assert (=> b!588610 m!566667))

(declare-fun m!566669 () Bool)

(assert (=> b!588610 m!566669))

(declare-fun m!566671 () Bool)

(assert (=> b!588603 m!566671))

(declare-fun m!566673 () Bool)

(assert (=> b!588606 m!566673))

(assert (=> b!588606 m!566655))

(assert (=> b!588606 m!566655))

(declare-fun m!566675 () Bool)

(assert (=> b!588606 m!566675))

(declare-fun m!566677 () Bool)

(assert (=> b!588608 m!566677))

(declare-fun m!566679 () Bool)

(assert (=> b!588605 m!566679))

(check-sat (not b!588603) (not b!588608) (not b!588607) (not b!588609) (not b!588610) (not start!53928) (not b!588605) (not b!588606) (not b!588600))
(check-sat)
