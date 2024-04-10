; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56746 () Bool)

(assert start!56746)

(declare-fun b!628777 () Bool)

(declare-fun res!406335 () Bool)

(declare-fun e!359700 () Bool)

(assert (=> b!628777 (=> (not res!406335) (not e!359700))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!37987 0))(
  ( (array!37988 (arr!18232 (Array (_ BitVec 32) (_ BitVec 64))) (size!18596 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37987)

(assert (=> b!628777 (= res!406335 (and (= (size!18596 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18596 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18596 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!628778 () Bool)

(declare-fun e!359698 () Bool)

(assert (=> b!628778 (= e!359698 false)))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lt!290566 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!628778 (= lt!290566 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!628779 () Bool)

(declare-fun res!406342 () Bool)

(assert (=> b!628779 (=> (not res!406342) (not e!359698))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37987 (_ BitVec 32)) Bool)

(assert (=> b!628779 (= res!406342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!628780 () Bool)

(declare-fun res!406337 () Bool)

(assert (=> b!628780 (=> (not res!406337) (not e!359698))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6672 0))(
  ( (MissingZero!6672 (index!28972 (_ BitVec 32))) (Found!6672 (index!28973 (_ BitVec 32))) (Intermediate!6672 (undefined!7484 Bool) (index!28974 (_ BitVec 32)) (x!57706 (_ BitVec 32))) (Undefined!6672) (MissingVacant!6672 (index!28975 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37987 (_ BitVec 32)) SeekEntryResult!6672)

(assert (=> b!628780 (= res!406337 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18232 a!2986) j!136) a!2986 mask!3053) (Found!6672 j!136)))))

(declare-fun b!628781 () Bool)

(declare-fun res!406336 () Bool)

(assert (=> b!628781 (=> (not res!406336) (not e!359698))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!628781 (= res!406336 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18232 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18232 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!628782 () Bool)

(assert (=> b!628782 (= e!359700 e!359698)))

(declare-fun res!406343 () Bool)

(assert (=> b!628782 (=> (not res!406343) (not e!359698))))

(declare-fun lt!290565 () SeekEntryResult!6672)

(assert (=> b!628782 (= res!406343 (or (= lt!290565 (MissingZero!6672 i!1108)) (= lt!290565 (MissingVacant!6672 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37987 (_ BitVec 32)) SeekEntryResult!6672)

(assert (=> b!628782 (= lt!290565 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!628783 () Bool)

(declare-fun res!406341 () Bool)

(assert (=> b!628783 (=> (not res!406341) (not e!359700))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!628783 (= res!406341 (validKeyInArray!0 k0!1786))))

(declare-fun b!628784 () Bool)

(declare-fun res!406333 () Bool)

(assert (=> b!628784 (=> (not res!406333) (not e!359698))))

(assert (=> b!628784 (= res!406333 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18232 a!2986) index!984) (select (arr!18232 a!2986) j!136))) (not (= (select (arr!18232 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun res!406334 () Bool)

(assert (=> start!56746 (=> (not res!406334) (not e!359700))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56746 (= res!406334 (validMask!0 mask!3053))))

(assert (=> start!56746 e!359700))

(assert (=> start!56746 true))

(declare-fun array_inv!14028 (array!37987) Bool)

(assert (=> start!56746 (array_inv!14028 a!2986)))

(declare-fun b!628785 () Bool)

(declare-fun res!406340 () Bool)

(assert (=> b!628785 (=> (not res!406340) (not e!359700))))

(declare-fun arrayContainsKey!0 (array!37987 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!628785 (= res!406340 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!628786 () Bool)

(declare-fun res!406339 () Bool)

(assert (=> b!628786 (=> (not res!406339) (not e!359698))))

(declare-datatypes ((List!12273 0))(
  ( (Nil!12270) (Cons!12269 (h!13314 (_ BitVec 64)) (t!18501 List!12273)) )
))
(declare-fun arrayNoDuplicates!0 (array!37987 (_ BitVec 32) List!12273) Bool)

(assert (=> b!628786 (= res!406339 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12270))))

(declare-fun b!628787 () Bool)

(declare-fun res!406338 () Bool)

(assert (=> b!628787 (=> (not res!406338) (not e!359700))))

(assert (=> b!628787 (= res!406338 (validKeyInArray!0 (select (arr!18232 a!2986) j!136)))))

(assert (= (and start!56746 res!406334) b!628777))

(assert (= (and b!628777 res!406335) b!628787))

(assert (= (and b!628787 res!406338) b!628783))

(assert (= (and b!628783 res!406341) b!628785))

(assert (= (and b!628785 res!406340) b!628782))

(assert (= (and b!628782 res!406343) b!628779))

(assert (= (and b!628779 res!406342) b!628786))

(assert (= (and b!628786 res!406339) b!628781))

(assert (= (and b!628781 res!406336) b!628780))

(assert (= (and b!628780 res!406337) b!628784))

(assert (= (and b!628784 res!406333) b!628778))

(declare-fun m!603897 () Bool)

(assert (=> b!628778 m!603897))

(declare-fun m!603899 () Bool)

(assert (=> start!56746 m!603899))

(declare-fun m!603901 () Bool)

(assert (=> start!56746 m!603901))

(declare-fun m!603903 () Bool)

(assert (=> b!628782 m!603903))

(declare-fun m!603905 () Bool)

(assert (=> b!628784 m!603905))

(declare-fun m!603907 () Bool)

(assert (=> b!628784 m!603907))

(assert (=> b!628787 m!603907))

(assert (=> b!628787 m!603907))

(declare-fun m!603909 () Bool)

(assert (=> b!628787 m!603909))

(declare-fun m!603911 () Bool)

(assert (=> b!628785 m!603911))

(declare-fun m!603913 () Bool)

(assert (=> b!628779 m!603913))

(declare-fun m!603915 () Bool)

(assert (=> b!628781 m!603915))

(declare-fun m!603917 () Bool)

(assert (=> b!628781 m!603917))

(declare-fun m!603919 () Bool)

(assert (=> b!628781 m!603919))

(declare-fun m!603921 () Bool)

(assert (=> b!628783 m!603921))

(declare-fun m!603923 () Bool)

(assert (=> b!628786 m!603923))

(assert (=> b!628780 m!603907))

(assert (=> b!628780 m!603907))

(declare-fun m!603925 () Bool)

(assert (=> b!628780 m!603925))

(check-sat (not b!628782) (not start!56746) (not b!628783) (not b!628778) (not b!628780) (not b!628786) (not b!628785) (not b!628787) (not b!628779))
(check-sat)
