; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56586 () Bool)

(assert start!56586)

(declare-fun b!626781 () Bool)

(declare-fun res!404627 () Bool)

(declare-fun e!358975 () Bool)

(assert (=> b!626781 (=> (not res!404627) (not e!358975))))

(declare-datatypes ((array!37890 0))(
  ( (array!37891 (arr!18185 (Array (_ BitVec 32) (_ BitVec 64))) (size!18550 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37890)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37890 (_ BitVec 32)) Bool)

(assert (=> b!626781 (= res!404627 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!626782 () Bool)

(declare-fun res!404626 () Bool)

(assert (=> b!626782 (=> (not res!404626) (not e!358975))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!626782 (= res!404626 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18185 a!2986) index!984) (select (arr!18185 a!2986) j!136))) (not (= (select (arr!18185 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!626783 () Bool)

(declare-fun res!404632 () Bool)

(declare-fun e!358976 () Bool)

(assert (=> b!626783 (=> (not res!404632) (not e!358976))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37890 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!626783 (= res!404632 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!626784 () Bool)

(declare-fun res!404630 () Bool)

(assert (=> b!626784 (=> (not res!404630) (not e!358975))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!626784 (= res!404630 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18185 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18185 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!626785 () Bool)

(declare-fun res!404623 () Bool)

(assert (=> b!626785 (=> (not res!404623) (not e!358976))))

(assert (=> b!626785 (= res!404623 (and (= (size!18550 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18550 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18550 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!626787 () Bool)

(declare-fun res!404624 () Bool)

(assert (=> b!626787 (=> (not res!404624) (not e!358976))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!626787 (= res!404624 (validKeyInArray!0 (select (arr!18185 a!2986) j!136)))))

(declare-fun b!626788 () Bool)

(assert (=> b!626788 (= e!358975 false)))

(declare-fun lt!289975 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!626788 (= lt!289975 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!626789 () Bool)

(declare-fun res!404625 () Bool)

(assert (=> b!626789 (=> (not res!404625) (not e!358975))))

(declare-datatypes ((List!12265 0))(
  ( (Nil!12262) (Cons!12261 (h!13306 (_ BitVec 64)) (t!18484 List!12265)) )
))
(declare-fun arrayNoDuplicates!0 (array!37890 (_ BitVec 32) List!12265) Bool)

(assert (=> b!626789 (= res!404625 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12262))))

(declare-fun res!404629 () Bool)

(assert (=> start!56586 (=> (not res!404629) (not e!358976))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56586 (= res!404629 (validMask!0 mask!3053))))

(assert (=> start!56586 e!358976))

(assert (=> start!56586 true))

(declare-fun array_inv!14068 (array!37890) Bool)

(assert (=> start!56586 (array_inv!14068 a!2986)))

(declare-fun b!626786 () Bool)

(assert (=> b!626786 (= e!358976 e!358975)))

(declare-fun res!404631 () Bool)

(assert (=> b!626786 (=> (not res!404631) (not e!358975))))

(declare-datatypes ((SeekEntryResult!6622 0))(
  ( (MissingZero!6622 (index!28772 (_ BitVec 32))) (Found!6622 (index!28773 (_ BitVec 32))) (Intermediate!6622 (undefined!7434 Bool) (index!28774 (_ BitVec 32)) (x!57525 (_ BitVec 32))) (Undefined!6622) (MissingVacant!6622 (index!28775 (_ BitVec 32))) )
))
(declare-fun lt!289974 () SeekEntryResult!6622)

(assert (=> b!626786 (= res!404631 (or (= lt!289974 (MissingZero!6622 i!1108)) (= lt!289974 (MissingVacant!6622 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37890 (_ BitVec 32)) SeekEntryResult!6622)

(assert (=> b!626786 (= lt!289974 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!626790 () Bool)

(declare-fun res!404633 () Bool)

(assert (=> b!626790 (=> (not res!404633) (not e!358975))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37890 (_ BitVec 32)) SeekEntryResult!6622)

(assert (=> b!626790 (= res!404633 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18185 a!2986) j!136) a!2986 mask!3053) (Found!6622 j!136)))))

(declare-fun b!626791 () Bool)

(declare-fun res!404628 () Bool)

(assert (=> b!626791 (=> (not res!404628) (not e!358976))))

(assert (=> b!626791 (= res!404628 (validKeyInArray!0 k0!1786))))

(assert (= (and start!56586 res!404629) b!626785))

(assert (= (and b!626785 res!404623) b!626787))

(assert (= (and b!626787 res!404624) b!626791))

(assert (= (and b!626791 res!404628) b!626783))

(assert (= (and b!626783 res!404632) b!626786))

(assert (= (and b!626786 res!404631) b!626781))

(assert (= (and b!626781 res!404627) b!626789))

(assert (= (and b!626789 res!404625) b!626784))

(assert (= (and b!626784 res!404630) b!626790))

(assert (= (and b!626790 res!404633) b!626782))

(assert (= (and b!626782 res!404626) b!626788))

(declare-fun m!601633 () Bool)

(assert (=> b!626789 m!601633))

(declare-fun m!601635 () Bool)

(assert (=> b!626790 m!601635))

(assert (=> b!626790 m!601635))

(declare-fun m!601637 () Bool)

(assert (=> b!626790 m!601637))

(assert (=> b!626787 m!601635))

(assert (=> b!626787 m!601635))

(declare-fun m!601639 () Bool)

(assert (=> b!626787 m!601639))

(declare-fun m!601641 () Bool)

(assert (=> b!626791 m!601641))

(declare-fun m!601643 () Bool)

(assert (=> start!56586 m!601643))

(declare-fun m!601645 () Bool)

(assert (=> start!56586 m!601645))

(declare-fun m!601647 () Bool)

(assert (=> b!626781 m!601647))

(declare-fun m!601649 () Bool)

(assert (=> b!626784 m!601649))

(declare-fun m!601651 () Bool)

(assert (=> b!626784 m!601651))

(declare-fun m!601653 () Bool)

(assert (=> b!626784 m!601653))

(declare-fun m!601655 () Bool)

(assert (=> b!626786 m!601655))

(declare-fun m!601657 () Bool)

(assert (=> b!626788 m!601657))

(declare-fun m!601659 () Bool)

(assert (=> b!626783 m!601659))

(declare-fun m!601661 () Bool)

(assert (=> b!626782 m!601661))

(assert (=> b!626782 m!601635))

(check-sat (not b!626790) (not b!626788) (not b!626791) (not b!626781) (not b!626783) (not b!626789) (not start!56586) (not b!626787) (not b!626786))
(check-sat)
