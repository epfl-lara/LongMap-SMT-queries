; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53940 () Bool)

(assert start!53940)

(declare-fun b!588120 () Bool)

(declare-fun res!375652 () Bool)

(declare-fun e!335909 () Bool)

(assert (=> b!588120 (=> (not res!375652) (not e!335909))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36729 0))(
  ( (array!36730 (arr!17635 (Array (_ BitVec 32) (_ BitVec 64))) (size!17999 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36729)

(assert (=> b!588120 (= res!375652 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17635 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17635 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!588121 () Bool)

(declare-fun res!375661 () Bool)

(declare-fun e!335910 () Bool)

(assert (=> b!588121 (=> (not res!375661) (not e!335910))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!588121 (= res!375661 (and (= (size!17999 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17999 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17999 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!588123 () Bool)

(declare-fun res!375653 () Bool)

(assert (=> b!588123 (=> (not res!375653) (not e!335910))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!588123 (= res!375653 (validKeyInArray!0 k0!1786))))

(declare-fun b!588124 () Bool)

(declare-fun e!335913 () Bool)

(assert (=> b!588124 (= e!335909 e!335913)))

(declare-fun res!375660 () Bool)

(assert (=> b!588124 (=> (not res!375660) (not e!335913))))

(declare-datatypes ((SeekEntryResult!6031 0))(
  ( (MissingZero!6031 (index!26354 (_ BitVec 32))) (Found!6031 (index!26355 (_ BitVec 32))) (Intermediate!6031 (undefined!6843 Bool) (index!26356 (_ BitVec 32)) (x!55312 (_ BitVec 32))) (Undefined!6031) (MissingVacant!6031 (index!26357 (_ BitVec 32))) )
))
(declare-fun lt!266656 () SeekEntryResult!6031)

(assert (=> b!588124 (= res!375660 (and (= lt!266656 (Found!6031 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17635 a!2986) index!984) (select (arr!17635 a!2986) j!136))) (not (= (select (arr!17635 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36729 (_ BitVec 32)) SeekEntryResult!6031)

(assert (=> b!588124 (= lt!266656 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17635 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!588125 () Bool)

(declare-fun res!375658 () Bool)

(assert (=> b!588125 (=> (not res!375658) (not e!335909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36729 (_ BitVec 32)) Bool)

(assert (=> b!588125 (= res!375658 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!588126 () Bool)

(declare-fun res!375659 () Bool)

(assert (=> b!588126 (=> (not res!375659) (not e!335910))))

(declare-fun arrayContainsKey!0 (array!36729 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!588126 (= res!375659 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!588127 () Bool)

(declare-fun res!375655 () Bool)

(assert (=> b!588127 (=> (not res!375655) (not e!335909))))

(declare-datatypes ((List!11583 0))(
  ( (Nil!11580) (Cons!11579 (h!12627 (_ BitVec 64)) (t!17803 List!11583)) )
))
(declare-fun arrayNoDuplicates!0 (array!36729 (_ BitVec 32) List!11583) Bool)

(assert (=> b!588127 (= res!375655 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11580))))

(declare-fun b!588128 () Bool)

(declare-fun e!335912 () Bool)

(declare-fun lt!266653 () SeekEntryResult!6031)

(assert (=> b!588128 (= e!335912 (= lt!266656 lt!266653))))

(declare-fun res!375657 () Bool)

(assert (=> start!53940 (=> (not res!375657) (not e!335910))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53940 (= res!375657 (validMask!0 mask!3053))))

(assert (=> start!53940 e!335910))

(assert (=> start!53940 true))

(declare-fun array_inv!13494 (array!36729) Bool)

(assert (=> start!53940 (array_inv!13494 a!2986)))

(declare-fun b!588122 () Bool)

(assert (=> b!588122 (= e!335910 e!335909)))

(declare-fun res!375654 () Bool)

(assert (=> b!588122 (=> (not res!375654) (not e!335909))))

(declare-fun lt!266654 () SeekEntryResult!6031)

(assert (=> b!588122 (= res!375654 (or (= lt!266654 (MissingZero!6031 i!1108)) (= lt!266654 (MissingVacant!6031 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36729 (_ BitVec 32)) SeekEntryResult!6031)

(assert (=> b!588122 (= lt!266654 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!588129 () Bool)

(assert (=> b!588129 (= e!335913 (not (bvsge mask!3053 #b00000000000000000000000000000000)))))

(assert (=> b!588129 e!335912))

(declare-fun res!375651 () Bool)

(assert (=> b!588129 (=> (not res!375651) (not e!335912))))

(declare-fun lt!266655 () (_ BitVec 32))

(assert (=> b!588129 (= res!375651 (= lt!266653 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266655 vacantSpotIndex!68 (select (store (arr!17635 a!2986) i!1108 k0!1786) j!136) (array!36730 (store (arr!17635 a!2986) i!1108 k0!1786) (size!17999 a!2986)) mask!3053)))))

(assert (=> b!588129 (= lt!266653 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266655 vacantSpotIndex!68 (select (arr!17635 a!2986) j!136) a!2986 mask!3053))))

(declare-datatypes ((Unit!18259 0))(
  ( (Unit!18260) )
))
(declare-fun lt!266652 () Unit!18259)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36729 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18259)

(assert (=> b!588129 (= lt!266652 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266655 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!588129 (= lt!266655 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!588130 () Bool)

(declare-fun res!375656 () Bool)

(assert (=> b!588130 (=> (not res!375656) (not e!335910))))

(assert (=> b!588130 (= res!375656 (validKeyInArray!0 (select (arr!17635 a!2986) j!136)))))

(assert (= (and start!53940 res!375657) b!588121))

(assert (= (and b!588121 res!375661) b!588130))

(assert (= (and b!588130 res!375656) b!588123))

(assert (= (and b!588123 res!375653) b!588126))

(assert (= (and b!588126 res!375659) b!588122))

(assert (= (and b!588122 res!375654) b!588125))

(assert (= (and b!588125 res!375658) b!588127))

(assert (= (and b!588127 res!375655) b!588120))

(assert (= (and b!588120 res!375652) b!588124))

(assert (= (and b!588124 res!375660) b!588129))

(assert (= (and b!588129 res!375651) b!588128))

(declare-fun m!566747 () Bool)

(assert (=> start!53940 m!566747))

(declare-fun m!566749 () Bool)

(assert (=> start!53940 m!566749))

(declare-fun m!566751 () Bool)

(assert (=> b!588129 m!566751))

(declare-fun m!566753 () Bool)

(assert (=> b!588129 m!566753))

(declare-fun m!566755 () Bool)

(assert (=> b!588129 m!566755))

(declare-fun m!566757 () Bool)

(assert (=> b!588129 m!566757))

(assert (=> b!588129 m!566753))

(declare-fun m!566759 () Bool)

(assert (=> b!588129 m!566759))

(declare-fun m!566761 () Bool)

(assert (=> b!588129 m!566761))

(assert (=> b!588129 m!566761))

(declare-fun m!566763 () Bool)

(assert (=> b!588129 m!566763))

(declare-fun m!566765 () Bool)

(assert (=> b!588123 m!566765))

(declare-fun m!566767 () Bool)

(assert (=> b!588126 m!566767))

(declare-fun m!566769 () Bool)

(assert (=> b!588125 m!566769))

(declare-fun m!566771 () Bool)

(assert (=> b!588127 m!566771))

(declare-fun m!566773 () Bool)

(assert (=> b!588122 m!566773))

(declare-fun m!566775 () Bool)

(assert (=> b!588120 m!566775))

(assert (=> b!588120 m!566757))

(declare-fun m!566777 () Bool)

(assert (=> b!588120 m!566777))

(declare-fun m!566779 () Bool)

(assert (=> b!588124 m!566779))

(assert (=> b!588124 m!566761))

(assert (=> b!588124 m!566761))

(declare-fun m!566781 () Bool)

(assert (=> b!588124 m!566781))

(assert (=> b!588130 m!566761))

(assert (=> b!588130 m!566761))

(declare-fun m!566783 () Bool)

(assert (=> b!588130 m!566783))

(check-sat (not b!588127) (not b!588123) (not b!588125) (not b!588130) (not b!588122) (not b!588126) (not b!588124) (not b!588129) (not start!53940))
(check-sat)
