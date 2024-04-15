; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56806 () Bool)

(assert start!56806)

(declare-fun b!629086 () Bool)

(declare-fun res!406631 () Bool)

(declare-fun e!359792 () Bool)

(assert (=> b!629086 (=> (not res!406631) (not e!359792))))

(declare-datatypes ((array!38008 0))(
  ( (array!38009 (arr!18241 (Array (_ BitVec 32) (_ BitVec 64))) (size!18606 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38008)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38008 (_ BitVec 32)) Bool)

(assert (=> b!629086 (= res!406631 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!629087 () Bool)

(declare-fun e!359795 () Bool)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!629087 (= e!359795 (bvsge (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!910)) (bvsub #b01111111111111111111111111111110 x!910)))))

(declare-fun b!629088 () Bool)

(declare-fun res!406625 () Bool)

(declare-fun e!359796 () Bool)

(assert (=> b!629088 (=> (not res!406625) (not e!359796))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!629088 (= res!406625 (validKeyInArray!0 (select (arr!18241 a!2986) j!136)))))

(declare-fun res!406632 () Bool)

(assert (=> start!56806 (=> (not res!406632) (not e!359796))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56806 (= res!406632 (validMask!0 mask!3053))))

(assert (=> start!56806 e!359796))

(assert (=> start!56806 true))

(declare-fun array_inv!14124 (array!38008) Bool)

(assert (=> start!56806 (array_inv!14124 a!2986)))

(declare-fun b!629089 () Bool)

(declare-fun res!406634 () Bool)

(assert (=> b!629089 (=> (not res!406634) (not e!359792))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!629089 (= res!406634 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18241 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18241 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!629090 () Bool)

(declare-fun res!406627 () Bool)

(assert (=> b!629090 (=> (not res!406627) (not e!359796))))

(assert (=> b!629090 (= res!406627 (and (= (size!18606 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18606 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18606 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!629091 () Bool)

(declare-fun res!406626 () Bool)

(declare-fun e!359793 () Bool)

(assert (=> b!629091 (=> (not res!406626) (not e!359793))))

(assert (=> b!629091 (= res!406626 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18241 a!2986) index!984) (select (arr!18241 a!2986) j!136))) (not (= (select (arr!18241 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!629092 () Bool)

(declare-fun res!406630 () Bool)

(assert (=> b!629092 (=> (not res!406630) (not e!359795))))

(declare-datatypes ((SeekEntryResult!6678 0))(
  ( (MissingZero!6678 (index!28996 (_ BitVec 32))) (Found!6678 (index!28997 (_ BitVec 32))) (Intermediate!6678 (undefined!7490 Bool) (index!28998 (_ BitVec 32)) (x!57737 (_ BitVec 32))) (Undefined!6678) (MissingVacant!6678 (index!28999 (_ BitVec 32))) )
))
(declare-fun lt!290497 () SeekEntryResult!6678)

(declare-fun lt!290495 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38008 (_ BitVec 32)) SeekEntryResult!6678)

(assert (=> b!629092 (= res!406630 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290495 vacantSpotIndex!68 (select (arr!18241 a!2986) j!136) a!2986 mask!3053) lt!290497))))

(declare-fun b!629093 () Bool)

(assert (=> b!629093 (= e!359796 e!359792)))

(declare-fun res!406624 () Bool)

(assert (=> b!629093 (=> (not res!406624) (not e!359792))))

(declare-fun lt!290496 () SeekEntryResult!6678)

(assert (=> b!629093 (= res!406624 (or (= lt!290496 (MissingZero!6678 i!1108)) (= lt!290496 (MissingVacant!6678 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38008 (_ BitVec 32)) SeekEntryResult!6678)

(assert (=> b!629093 (= lt!290496 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!629094 () Bool)

(assert (=> b!629094 (= e!359793 e!359795)))

(declare-fun res!406622 () Bool)

(assert (=> b!629094 (=> (not res!406622) (not e!359795))))

(assert (=> b!629094 (= res!406622 (and (bvsge lt!290495 #b00000000000000000000000000000000) (bvslt lt!290495 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!629094 (= lt!290495 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!629095 () Bool)

(assert (=> b!629095 (= e!359792 e!359793)))

(declare-fun res!406629 () Bool)

(assert (=> b!629095 (=> (not res!406629) (not e!359793))))

(assert (=> b!629095 (= res!406629 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18241 a!2986) j!136) a!2986 mask!3053) lt!290497))))

(assert (=> b!629095 (= lt!290497 (Found!6678 j!136))))

(declare-fun b!629096 () Bool)

(declare-fun res!406623 () Bool)

(assert (=> b!629096 (=> (not res!406623) (not e!359796))))

(assert (=> b!629096 (= res!406623 (validKeyInArray!0 k!1786))))

(declare-fun b!629097 () Bool)

(declare-fun res!406633 () Bool)

(assert (=> b!629097 (=> (not res!406633) (not e!359792))))

(declare-datatypes ((List!12321 0))(
  ( (Nil!12318) (Cons!12317 (h!13362 (_ BitVec 64)) (t!18540 List!12321)) )
))
(declare-fun arrayNoDuplicates!0 (array!38008 (_ BitVec 32) List!12321) Bool)

(assert (=> b!629097 (= res!406633 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12318))))

(declare-fun b!629098 () Bool)

(declare-fun res!406628 () Bool)

(assert (=> b!629098 (=> (not res!406628) (not e!359796))))

(declare-fun arrayContainsKey!0 (array!38008 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!629098 (= res!406628 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!56806 res!406632) b!629090))

(assert (= (and b!629090 res!406627) b!629088))

(assert (= (and b!629088 res!406625) b!629096))

(assert (= (and b!629096 res!406623) b!629098))

(assert (= (and b!629098 res!406628) b!629093))

(assert (= (and b!629093 res!406624) b!629086))

(assert (= (and b!629086 res!406631) b!629097))

(assert (= (and b!629097 res!406633) b!629089))

(assert (= (and b!629089 res!406634) b!629095))

(assert (= (and b!629095 res!406629) b!629091))

(assert (= (and b!629091 res!406626) b!629094))

(assert (= (and b!629094 res!406622) b!629092))

(assert (= (and b!629092 res!406630) b!629087))

(declare-fun m!603593 () Bool)

(assert (=> b!629094 m!603593))

(declare-fun m!603595 () Bool)

(assert (=> b!629098 m!603595))

(declare-fun m!603597 () Bool)

(assert (=> b!629097 m!603597))

(declare-fun m!603599 () Bool)

(assert (=> start!56806 m!603599))

(declare-fun m!603601 () Bool)

(assert (=> start!56806 m!603601))

(declare-fun m!603603 () Bool)

(assert (=> b!629091 m!603603))

(declare-fun m!603605 () Bool)

(assert (=> b!629091 m!603605))

(declare-fun m!603607 () Bool)

(assert (=> b!629089 m!603607))

(declare-fun m!603609 () Bool)

(assert (=> b!629089 m!603609))

(declare-fun m!603611 () Bool)

(assert (=> b!629089 m!603611))

(assert (=> b!629095 m!603605))

(assert (=> b!629095 m!603605))

(declare-fun m!603613 () Bool)

(assert (=> b!629095 m!603613))

(declare-fun m!603615 () Bool)

(assert (=> b!629096 m!603615))

(declare-fun m!603617 () Bool)

(assert (=> b!629086 m!603617))

(declare-fun m!603619 () Bool)

(assert (=> b!629093 m!603619))

(assert (=> b!629088 m!603605))

(assert (=> b!629088 m!603605))

(declare-fun m!603621 () Bool)

(assert (=> b!629088 m!603621))

(assert (=> b!629092 m!603605))

(assert (=> b!629092 m!603605))

(declare-fun m!603623 () Bool)

(assert (=> b!629092 m!603623))

(push 1)

(assert (not b!629094))

(assert (not b!629086))

(assert (not b!629097))

(assert (not start!56806))

(assert (not b!629088))

(assert (not b!629098))

(assert (not b!629096))

(assert (not b!629095))

(assert (not b!629093))

(assert (not b!629092))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

