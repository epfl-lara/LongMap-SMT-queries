; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53902 () Bool)

(assert start!53902)

(declare-fun b!588109 () Bool)

(declare-fun e!335871 () Bool)

(assert (=> b!588109 (= e!335871 (not true))))

(declare-fun e!335870 () Bool)

(assert (=> b!588109 e!335870))

(declare-fun res!375750 () Bool)

(assert (=> b!588109 (=> (not res!375750) (not e!335870))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6086 0))(
  ( (MissingZero!6086 (index!26574 (_ BitVec 32))) (Found!6086 (index!26575 (_ BitVec 32))) (Intermediate!6086 (undefined!6898 Bool) (index!26576 (_ BitVec 32)) (x!55380 (_ BitVec 32))) (Undefined!6086) (MissingVacant!6086 (index!26577 (_ BitVec 32))) )
))
(declare-fun lt!266644 () SeekEntryResult!6086)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((array!36746 0))(
  ( (array!36747 (arr!17646 (Array (_ BitVec 32) (_ BitVec 64))) (size!18010 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36746)

(declare-fun lt!266642 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36746 (_ BitVec 32)) SeekEntryResult!6086)

(assert (=> b!588109 (= res!375750 (= lt!266644 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266642 vacantSpotIndex!68 (select (store (arr!17646 a!2986) i!1108 k!1786) j!136) (array!36747 (store (arr!17646 a!2986) i!1108 k!1786) (size!18010 a!2986)) mask!3053)))))

(assert (=> b!588109 (= lt!266644 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266642 vacantSpotIndex!68 (select (arr!17646 a!2986) j!136) a!2986 mask!3053))))

(declare-datatypes ((Unit!18292 0))(
  ( (Unit!18293) )
))
(declare-fun lt!266643 () Unit!18292)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36746 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18292)

(assert (=> b!588109 (= lt!266643 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266642 vacantSpotIndex!68 mask!3053))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!588109 (= lt!266642 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!588110 () Bool)

(declare-fun res!375745 () Bool)

(declare-fun e!335873 () Bool)

(assert (=> b!588110 (=> (not res!375745) (not e!335873))))

(declare-datatypes ((List!11687 0))(
  ( (Nil!11684) (Cons!11683 (h!12728 (_ BitVec 64)) (t!17915 List!11687)) )
))
(declare-fun arrayNoDuplicates!0 (array!36746 (_ BitVec 32) List!11687) Bool)

(assert (=> b!588110 (= res!375745 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11684))))

(declare-fun res!375746 () Bool)

(declare-fun e!335874 () Bool)

(assert (=> start!53902 (=> (not res!375746) (not e!335874))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53902 (= res!375746 (validMask!0 mask!3053))))

(assert (=> start!53902 e!335874))

(assert (=> start!53902 true))

(declare-fun array_inv!13442 (array!36746) Bool)

(assert (=> start!53902 (array_inv!13442 a!2986)))

(declare-fun b!588111 () Bool)

(declare-fun res!375752 () Bool)

(assert (=> b!588111 (=> (not res!375752) (not e!335873))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36746 (_ BitVec 32)) Bool)

(assert (=> b!588111 (= res!375752 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!588112 () Bool)

(declare-fun res!375748 () Bool)

(assert (=> b!588112 (=> (not res!375748) (not e!335874))))

(assert (=> b!588112 (= res!375748 (and (= (size!18010 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18010 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18010 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!588113 () Bool)

(declare-fun res!375751 () Bool)

(assert (=> b!588113 (=> (not res!375751) (not e!335874))))

(declare-fun arrayContainsKey!0 (array!36746 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!588113 (= res!375751 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!588114 () Bool)

(declare-fun res!375749 () Bool)

(assert (=> b!588114 (=> (not res!375749) (not e!335874))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!588114 (= res!375749 (validKeyInArray!0 (select (arr!17646 a!2986) j!136)))))

(declare-fun b!588115 () Bool)

(assert (=> b!588115 (= e!335873 e!335871)))

(declare-fun res!375755 () Bool)

(assert (=> b!588115 (=> (not res!375755) (not e!335871))))

(declare-fun lt!266640 () SeekEntryResult!6086)

(assert (=> b!588115 (= res!375755 (and (= lt!266640 (Found!6086 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17646 a!2986) index!984) (select (arr!17646 a!2986) j!136))) (not (= (select (arr!17646 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!588115 (= lt!266640 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17646 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!588116 () Bool)

(assert (=> b!588116 (= e!335870 (= lt!266640 lt!266644))))

(declare-fun b!588117 () Bool)

(declare-fun res!375754 () Bool)

(assert (=> b!588117 (=> (not res!375754) (not e!335873))))

(assert (=> b!588117 (= res!375754 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17646 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17646 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!588118 () Bool)

(assert (=> b!588118 (= e!335874 e!335873)))

(declare-fun res!375753 () Bool)

(assert (=> b!588118 (=> (not res!375753) (not e!335873))))

(declare-fun lt!266641 () SeekEntryResult!6086)

(assert (=> b!588118 (= res!375753 (or (= lt!266641 (MissingZero!6086 i!1108)) (= lt!266641 (MissingVacant!6086 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36746 (_ BitVec 32)) SeekEntryResult!6086)

(assert (=> b!588118 (= lt!266641 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!588119 () Bool)

(declare-fun res!375747 () Bool)

(assert (=> b!588119 (=> (not res!375747) (not e!335874))))

(assert (=> b!588119 (= res!375747 (validKeyInArray!0 k!1786))))

(assert (= (and start!53902 res!375746) b!588112))

(assert (= (and b!588112 res!375748) b!588114))

(assert (= (and b!588114 res!375749) b!588119))

(assert (= (and b!588119 res!375747) b!588113))

(assert (= (and b!588113 res!375751) b!588118))

(assert (= (and b!588118 res!375753) b!588111))

(assert (= (and b!588111 res!375752) b!588110))

(assert (= (and b!588110 res!375745) b!588117))

(assert (= (and b!588117 res!375754) b!588115))

(assert (= (and b!588115 res!375755) b!588109))

(assert (= (and b!588109 res!375750) b!588116))

(declare-fun m!566611 () Bool)

(assert (=> b!588110 m!566611))

(declare-fun m!566613 () Bool)

(assert (=> b!588117 m!566613))

(declare-fun m!566615 () Bool)

(assert (=> b!588117 m!566615))

(declare-fun m!566617 () Bool)

(assert (=> b!588117 m!566617))

(declare-fun m!566619 () Bool)

(assert (=> b!588113 m!566619))

(declare-fun m!566621 () Bool)

(assert (=> b!588111 m!566621))

(declare-fun m!566623 () Bool)

(assert (=> b!588115 m!566623))

(declare-fun m!566625 () Bool)

(assert (=> b!588115 m!566625))

(assert (=> b!588115 m!566625))

(declare-fun m!566627 () Bool)

(assert (=> b!588115 m!566627))

(declare-fun m!566629 () Bool)

(assert (=> b!588119 m!566629))

(declare-fun m!566631 () Bool)

(assert (=> b!588118 m!566631))

(declare-fun m!566633 () Bool)

(assert (=> b!588109 m!566633))

(declare-fun m!566635 () Bool)

(assert (=> b!588109 m!566635))

(assert (=> b!588109 m!566625))

(declare-fun m!566637 () Bool)

(assert (=> b!588109 m!566637))

(assert (=> b!588109 m!566615))

(assert (=> b!588109 m!566625))

(declare-fun m!566639 () Bool)

(assert (=> b!588109 m!566639))

(assert (=> b!588109 m!566635))

(declare-fun m!566641 () Bool)

(assert (=> b!588109 m!566641))

(assert (=> b!588114 m!566625))

(assert (=> b!588114 m!566625))

(declare-fun m!566643 () Bool)

(assert (=> b!588114 m!566643))

(declare-fun m!566645 () Bool)

(assert (=> start!53902 m!566645))

(declare-fun m!566647 () Bool)

(assert (=> start!53902 m!566647))

(push 1)

