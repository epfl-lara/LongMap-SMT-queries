; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56744 () Bool)

(assert start!56744)

(declare-fun b!628744 () Bool)

(declare-fun res!406306 () Bool)

(declare-fun e!359690 () Bool)

(assert (=> b!628744 (=> (not res!406306) (not e!359690))))

(declare-datatypes ((array!37985 0))(
  ( (array!37986 (arr!18231 (Array (_ BitVec 32) (_ BitVec 64))) (size!18595 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37985)

(declare-datatypes ((List!12272 0))(
  ( (Nil!12269) (Cons!12268 (h!13313 (_ BitVec 64)) (t!18500 List!12272)) )
))
(declare-fun arrayNoDuplicates!0 (array!37985 (_ BitVec 32) List!12272) Bool)

(assert (=> b!628744 (= res!406306 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12269))))

(declare-fun b!628745 () Bool)

(declare-fun res!406309 () Bool)

(assert (=> b!628745 (=> (not res!406309) (not e!359690))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!628745 (= res!406309 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18231 a!2986) index!984) (select (arr!18231 a!2986) j!136))) (not (= (select (arr!18231 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!628746 () Bool)

(declare-fun e!359691 () Bool)

(assert (=> b!628746 (= e!359691 e!359690)))

(declare-fun res!406302 () Bool)

(assert (=> b!628746 (=> (not res!406302) (not e!359690))))

(declare-datatypes ((SeekEntryResult!6671 0))(
  ( (MissingZero!6671 (index!28968 (_ BitVec 32))) (Found!6671 (index!28969 (_ BitVec 32))) (Intermediate!6671 (undefined!7483 Bool) (index!28970 (_ BitVec 32)) (x!57705 (_ BitVec 32))) (Undefined!6671) (MissingVacant!6671 (index!28971 (_ BitVec 32))) )
))
(declare-fun lt!290560 () SeekEntryResult!6671)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!628746 (= res!406302 (or (= lt!290560 (MissingZero!6671 i!1108)) (= lt!290560 (MissingVacant!6671 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37985 (_ BitVec 32)) SeekEntryResult!6671)

(assert (=> b!628746 (= lt!290560 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!628747 () Bool)

(declare-fun res!406304 () Bool)

(assert (=> b!628747 (=> (not res!406304) (not e!359690))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37985 (_ BitVec 32)) Bool)

(assert (=> b!628747 (= res!406304 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!628748 () Bool)

(assert (=> b!628748 (= e!359690 false)))

(declare-fun lt!290559 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!628748 (= lt!290559 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!628749 () Bool)

(declare-fun res!406300 () Bool)

(assert (=> b!628749 (=> (not res!406300) (not e!359690))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37985 (_ BitVec 32)) SeekEntryResult!6671)

(assert (=> b!628749 (= res!406300 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18231 a!2986) j!136) a!2986 mask!3053) (Found!6671 j!136)))))

(declare-fun b!628750 () Bool)

(declare-fun res!406301 () Bool)

(assert (=> b!628750 (=> (not res!406301) (not e!359691))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!628750 (= res!406301 (validKeyInArray!0 (select (arr!18231 a!2986) j!136)))))

(declare-fun b!628751 () Bool)

(declare-fun res!406307 () Bool)

(assert (=> b!628751 (=> (not res!406307) (not e!359691))))

(assert (=> b!628751 (= res!406307 (and (= (size!18595 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18595 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18595 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!628752 () Bool)

(declare-fun res!406308 () Bool)

(assert (=> b!628752 (=> (not res!406308) (not e!359691))))

(declare-fun arrayContainsKey!0 (array!37985 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!628752 (= res!406308 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!628753 () Bool)

(declare-fun res!406303 () Bool)

(assert (=> b!628753 (=> (not res!406303) (not e!359691))))

(assert (=> b!628753 (= res!406303 (validKeyInArray!0 k!1786))))

(declare-fun res!406310 () Bool)

(assert (=> start!56744 (=> (not res!406310) (not e!359691))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56744 (= res!406310 (validMask!0 mask!3053))))

(assert (=> start!56744 e!359691))

(assert (=> start!56744 true))

(declare-fun array_inv!14027 (array!37985) Bool)

(assert (=> start!56744 (array_inv!14027 a!2986)))

(declare-fun b!628754 () Bool)

(declare-fun res!406305 () Bool)

(assert (=> b!628754 (=> (not res!406305) (not e!359690))))

(assert (=> b!628754 (= res!406305 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18231 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18231 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!56744 res!406310) b!628751))

(assert (= (and b!628751 res!406307) b!628750))

(assert (= (and b!628750 res!406301) b!628753))

(assert (= (and b!628753 res!406303) b!628752))

(assert (= (and b!628752 res!406308) b!628746))

(assert (= (and b!628746 res!406302) b!628747))

(assert (= (and b!628747 res!406304) b!628744))

(assert (= (and b!628744 res!406306) b!628754))

(assert (= (and b!628754 res!406305) b!628749))

(assert (= (and b!628749 res!406300) b!628745))

(assert (= (and b!628745 res!406309) b!628748))

(declare-fun m!603867 () Bool)

(assert (=> b!628744 m!603867))

(declare-fun m!603869 () Bool)

(assert (=> b!628746 m!603869))

(declare-fun m!603871 () Bool)

(assert (=> b!628747 m!603871))

(declare-fun m!603873 () Bool)

(assert (=> start!56744 m!603873))

(declare-fun m!603875 () Bool)

(assert (=> start!56744 m!603875))

(declare-fun m!603877 () Bool)

(assert (=> b!628745 m!603877))

(declare-fun m!603879 () Bool)

(assert (=> b!628745 m!603879))

(assert (=> b!628749 m!603879))

(assert (=> b!628749 m!603879))

(declare-fun m!603881 () Bool)

(assert (=> b!628749 m!603881))

(declare-fun m!603883 () Bool)

(assert (=> b!628754 m!603883))

(declare-fun m!603885 () Bool)

(assert (=> b!628754 m!603885))

(declare-fun m!603887 () Bool)

(assert (=> b!628754 m!603887))

(declare-fun m!603889 () Bool)

(assert (=> b!628752 m!603889))

(declare-fun m!603891 () Bool)

(assert (=> b!628753 m!603891))

(assert (=> b!628750 m!603879))

(assert (=> b!628750 m!603879))

(declare-fun m!603893 () Bool)

(assert (=> b!628750 m!603893))

(declare-fun m!603895 () Bool)

(assert (=> b!628748 m!603895))

(push 1)

