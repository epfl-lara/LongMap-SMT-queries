; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56606 () Bool)

(assert start!56606)

(declare-fun b!627151 () Bool)

(declare-fun res!404859 () Bool)

(declare-fun e!359177 () Bool)

(assert (=> b!627151 (=> (not res!404859) (not e!359177))))

(declare-datatypes ((array!37898 0))(
  ( (array!37899 (arr!18189 (Array (_ BitVec 32) (_ BitVec 64))) (size!18553 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37898)

(declare-datatypes ((List!12230 0))(
  ( (Nil!12227) (Cons!12226 (h!13271 (_ BitVec 64)) (t!18458 List!12230)) )
))
(declare-fun arrayNoDuplicates!0 (array!37898 (_ BitVec 32) List!12230) Bool)

(assert (=> b!627151 (= res!404859 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12227))))

(declare-fun b!627152 () Bool)

(declare-fun res!404857 () Bool)

(declare-fun e!359178 () Bool)

(assert (=> b!627152 (=> (not res!404857) (not e!359178))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37898 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!627152 (= res!404857 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!627153 () Bool)

(declare-fun res!404861 () Bool)

(assert (=> b!627153 (=> (not res!404861) (not e!359178))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!627153 (= res!404861 (validKeyInArray!0 (select (arr!18189 a!2986) j!136)))))

(declare-fun b!627154 () Bool)

(declare-fun res!404851 () Bool)

(assert (=> b!627154 (=> (not res!404851) (not e!359178))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!627154 (= res!404851 (and (= (size!18553 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18553 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18553 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!627155 () Bool)

(declare-fun res!404856 () Bool)

(assert (=> b!627155 (=> (not res!404856) (not e!359177))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!627155 (= res!404856 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18189 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18189 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!627156 () Bool)

(assert (=> b!627156 (= e!359177 false)))

(declare-fun lt!290227 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!627156 (= lt!290227 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!627157 () Bool)

(declare-fun res!404852 () Bool)

(assert (=> b!627157 (=> (not res!404852) (not e!359178))))

(assert (=> b!627157 (= res!404852 (validKeyInArray!0 k!1786))))

(declare-fun res!404860 () Bool)

(assert (=> start!56606 (=> (not res!404860) (not e!359178))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56606 (= res!404860 (validMask!0 mask!3053))))

(assert (=> start!56606 e!359178))

(assert (=> start!56606 true))

(declare-fun array_inv!13985 (array!37898) Bool)

(assert (=> start!56606 (array_inv!13985 a!2986)))

(declare-fun b!627158 () Bool)

(declare-fun res!404858 () Bool)

(assert (=> b!627158 (=> (not res!404858) (not e!359177))))

(declare-datatypes ((SeekEntryResult!6629 0))(
  ( (MissingZero!6629 (index!28800 (_ BitVec 32))) (Found!6629 (index!28801 (_ BitVec 32))) (Intermediate!6629 (undefined!7441 Bool) (index!28802 (_ BitVec 32)) (x!57545 (_ BitVec 32))) (Undefined!6629) (MissingVacant!6629 (index!28803 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37898 (_ BitVec 32)) SeekEntryResult!6629)

(assert (=> b!627158 (= res!404858 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18189 a!2986) j!136) a!2986 mask!3053) (Found!6629 j!136)))))

(declare-fun b!627159 () Bool)

(declare-fun res!404853 () Bool)

(assert (=> b!627159 (=> (not res!404853) (not e!359177))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37898 (_ BitVec 32)) Bool)

(assert (=> b!627159 (= res!404853 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!627160 () Bool)

(assert (=> b!627160 (= e!359178 e!359177)))

(declare-fun res!404855 () Bool)

(assert (=> b!627160 (=> (not res!404855) (not e!359177))))

(declare-fun lt!290226 () SeekEntryResult!6629)

(assert (=> b!627160 (= res!404855 (or (= lt!290226 (MissingZero!6629 i!1108)) (= lt!290226 (MissingVacant!6629 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37898 (_ BitVec 32)) SeekEntryResult!6629)

(assert (=> b!627160 (= lt!290226 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!627161 () Bool)

(declare-fun res!404854 () Bool)

(assert (=> b!627161 (=> (not res!404854) (not e!359177))))

(assert (=> b!627161 (= res!404854 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18189 a!2986) index!984) (select (arr!18189 a!2986) j!136))) (not (= (select (arr!18189 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (= (and start!56606 res!404860) b!627154))

(assert (= (and b!627154 res!404851) b!627153))

(assert (= (and b!627153 res!404861) b!627157))

(assert (= (and b!627157 res!404852) b!627152))

(assert (= (and b!627152 res!404857) b!627160))

(assert (= (and b!627160 res!404855) b!627159))

(assert (= (and b!627159 res!404853) b!627151))

(assert (= (and b!627151 res!404859) b!627155))

(assert (= (and b!627155 res!404856) b!627158))

(assert (= (and b!627158 res!404858) b!627161))

(assert (= (and b!627161 res!404854) b!627156))

(declare-fun m!602487 () Bool)

(assert (=> b!627159 m!602487))

(declare-fun m!602489 () Bool)

(assert (=> b!627157 m!602489))

(declare-fun m!602491 () Bool)

(assert (=> b!627160 m!602491))

(declare-fun m!602493 () Bool)

(assert (=> b!627158 m!602493))

(assert (=> b!627158 m!602493))

(declare-fun m!602495 () Bool)

(assert (=> b!627158 m!602495))

(declare-fun m!602497 () Bool)

(assert (=> b!627161 m!602497))

(assert (=> b!627161 m!602493))

(declare-fun m!602499 () Bool)

(assert (=> b!627155 m!602499))

(declare-fun m!602501 () Bool)

(assert (=> b!627155 m!602501))

(declare-fun m!602503 () Bool)

(assert (=> b!627155 m!602503))

(declare-fun m!602505 () Bool)

(assert (=> start!56606 m!602505))

(declare-fun m!602507 () Bool)

(assert (=> start!56606 m!602507))

(declare-fun m!602509 () Bool)

(assert (=> b!627156 m!602509))

(declare-fun m!602511 () Bool)

(assert (=> b!627152 m!602511))

(declare-fun m!602513 () Bool)

(assert (=> b!627151 m!602513))

(assert (=> b!627153 m!602493))

(assert (=> b!627153 m!602493))

(declare-fun m!602515 () Bool)

(assert (=> b!627153 m!602515))

(push 1)

(assert (not b!627160))

(assert (not b!627151))

(assert (not b!627159))

(assert (not b!627157))

(assert (not b!627152))

