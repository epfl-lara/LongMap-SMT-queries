; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56740 () Bool)

(assert start!56740)

(declare-fun b!628678 () Bool)

(declare-fun e!359673 () Bool)

(declare-fun e!359672 () Bool)

(assert (=> b!628678 (= e!359673 e!359672)))

(declare-fun res!406234 () Bool)

(assert (=> b!628678 (=> (not res!406234) (not e!359672))))

(declare-datatypes ((SeekEntryResult!6669 0))(
  ( (MissingZero!6669 (index!28960 (_ BitVec 32))) (Found!6669 (index!28961 (_ BitVec 32))) (Intermediate!6669 (undefined!7481 Bool) (index!28962 (_ BitVec 32)) (x!57695 (_ BitVec 32))) (Undefined!6669) (MissingVacant!6669 (index!28963 (_ BitVec 32))) )
))
(declare-fun lt!290548 () SeekEntryResult!6669)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!628678 (= res!406234 (or (= lt!290548 (MissingZero!6669 i!1108)) (= lt!290548 (MissingVacant!6669 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((array!37981 0))(
  ( (array!37982 (arr!18229 (Array (_ BitVec 32) (_ BitVec 64))) (size!18593 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37981)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37981 (_ BitVec 32)) SeekEntryResult!6669)

(assert (=> b!628678 (= lt!290548 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!628679 () Bool)

(assert (=> b!628679 (= e!359672 false)))

(declare-fun lt!290547 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!628679 (= lt!290547 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!628680 () Bool)

(declare-fun res!406244 () Bool)

(assert (=> b!628680 (=> (not res!406244) (not e!359673))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!628680 (= res!406244 (and (= (size!18593 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18593 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18593 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!628681 () Bool)

(declare-fun res!406239 () Bool)

(assert (=> b!628681 (=> (not res!406239) (not e!359673))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!628681 (= res!406239 (validKeyInArray!0 k0!1786))))

(declare-fun b!628682 () Bool)

(declare-fun res!406238 () Bool)

(assert (=> b!628682 (=> (not res!406238) (not e!359672))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37981 (_ BitVec 32)) SeekEntryResult!6669)

(assert (=> b!628682 (= res!406238 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18229 a!2986) j!136) a!2986 mask!3053) (Found!6669 j!136)))))

(declare-fun b!628684 () Bool)

(declare-fun res!406236 () Bool)

(assert (=> b!628684 (=> (not res!406236) (not e!359672))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37981 (_ BitVec 32)) Bool)

(assert (=> b!628684 (= res!406236 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!628685 () Bool)

(declare-fun res!406242 () Bool)

(assert (=> b!628685 (=> (not res!406242) (not e!359672))))

(assert (=> b!628685 (= res!406242 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18229 a!2986) index!984) (select (arr!18229 a!2986) j!136))) (not (= (select (arr!18229 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!628686 () Bool)

(declare-fun res!406240 () Bool)

(assert (=> b!628686 (=> (not res!406240) (not e!359673))))

(assert (=> b!628686 (= res!406240 (validKeyInArray!0 (select (arr!18229 a!2986) j!136)))))

(declare-fun res!406235 () Bool)

(assert (=> start!56740 (=> (not res!406235) (not e!359673))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56740 (= res!406235 (validMask!0 mask!3053))))

(assert (=> start!56740 e!359673))

(assert (=> start!56740 true))

(declare-fun array_inv!14025 (array!37981) Bool)

(assert (=> start!56740 (array_inv!14025 a!2986)))

(declare-fun b!628683 () Bool)

(declare-fun res!406243 () Bool)

(assert (=> b!628683 (=> (not res!406243) (not e!359673))))

(declare-fun arrayContainsKey!0 (array!37981 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!628683 (= res!406243 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!628687 () Bool)

(declare-fun res!406241 () Bool)

(assert (=> b!628687 (=> (not res!406241) (not e!359672))))

(assert (=> b!628687 (= res!406241 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18229 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18229 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!628688 () Bool)

(declare-fun res!406237 () Bool)

(assert (=> b!628688 (=> (not res!406237) (not e!359672))))

(declare-datatypes ((List!12270 0))(
  ( (Nil!12267) (Cons!12266 (h!13311 (_ BitVec 64)) (t!18498 List!12270)) )
))
(declare-fun arrayNoDuplicates!0 (array!37981 (_ BitVec 32) List!12270) Bool)

(assert (=> b!628688 (= res!406237 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12267))))

(assert (= (and start!56740 res!406235) b!628680))

(assert (= (and b!628680 res!406244) b!628686))

(assert (= (and b!628686 res!406240) b!628681))

(assert (= (and b!628681 res!406239) b!628683))

(assert (= (and b!628683 res!406243) b!628678))

(assert (= (and b!628678 res!406234) b!628684))

(assert (= (and b!628684 res!406236) b!628688))

(assert (= (and b!628688 res!406237) b!628687))

(assert (= (and b!628687 res!406241) b!628682))

(assert (= (and b!628682 res!406238) b!628685))

(assert (= (and b!628685 res!406242) b!628679))

(declare-fun m!603807 () Bool)

(assert (=> b!628687 m!603807))

(declare-fun m!603809 () Bool)

(assert (=> b!628687 m!603809))

(declare-fun m!603811 () Bool)

(assert (=> b!628687 m!603811))

(declare-fun m!603813 () Bool)

(assert (=> b!628685 m!603813))

(declare-fun m!603815 () Bool)

(assert (=> b!628685 m!603815))

(declare-fun m!603817 () Bool)

(assert (=> b!628688 m!603817))

(assert (=> b!628686 m!603815))

(assert (=> b!628686 m!603815))

(declare-fun m!603819 () Bool)

(assert (=> b!628686 m!603819))

(declare-fun m!603821 () Bool)

(assert (=> b!628681 m!603821))

(declare-fun m!603823 () Bool)

(assert (=> b!628679 m!603823))

(declare-fun m!603825 () Bool)

(assert (=> b!628683 m!603825))

(assert (=> b!628682 m!603815))

(assert (=> b!628682 m!603815))

(declare-fun m!603827 () Bool)

(assert (=> b!628682 m!603827))

(declare-fun m!603829 () Bool)

(assert (=> b!628684 m!603829))

(declare-fun m!603831 () Bool)

(assert (=> b!628678 m!603831))

(declare-fun m!603833 () Bool)

(assert (=> start!56740 m!603833))

(declare-fun m!603835 () Bool)

(assert (=> start!56740 m!603835))

(check-sat (not b!628678) (not b!628683) (not b!628688) (not b!628684) (not start!56740) (not b!628682) (not b!628686) (not b!628681) (not b!628679))
(check-sat)
