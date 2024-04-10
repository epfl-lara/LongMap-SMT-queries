; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56646 () Bool)

(assert start!56646)

(declare-fun b!627811 () Bool)

(declare-fun res!405521 () Bool)

(declare-fun e!359358 () Bool)

(assert (=> b!627811 (=> (not res!405521) (not e!359358))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!627811 (= res!405521 (validKeyInArray!0 k!1786))))

(declare-fun b!627812 () Bool)

(declare-fun res!405513 () Bool)

(assert (=> b!627812 (=> (not res!405513) (not e!359358))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!37938 0))(
  ( (array!37939 (arr!18209 (Array (_ BitVec 32) (_ BitVec 64))) (size!18573 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37938)

(assert (=> b!627812 (= res!405513 (and (= (size!18573 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18573 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18573 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!627813 () Bool)

(declare-fun res!405519 () Bool)

(declare-fun e!359356 () Bool)

(assert (=> b!627813 (=> (not res!405519) (not e!359356))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6649 0))(
  ( (MissingZero!6649 (index!28880 (_ BitVec 32))) (Found!6649 (index!28881 (_ BitVec 32))) (Intermediate!6649 (undefined!7461 Bool) (index!28882 (_ BitVec 32)) (x!57613 (_ BitVec 32))) (Undefined!6649) (MissingVacant!6649 (index!28883 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37938 (_ BitVec 32)) SeekEntryResult!6649)

(assert (=> b!627813 (= res!405519 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18209 a!2986) j!136) a!2986 mask!3053) (Found!6649 j!136)))))

(declare-fun res!405518 () Bool)

(assert (=> start!56646 (=> (not res!405518) (not e!359358))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56646 (= res!405518 (validMask!0 mask!3053))))

(assert (=> start!56646 e!359358))

(assert (=> start!56646 true))

(declare-fun array_inv!14005 (array!37938) Bool)

(assert (=> start!56646 (array_inv!14005 a!2986)))

(declare-fun b!627814 () Bool)

(declare-fun res!405520 () Bool)

(assert (=> b!627814 (=> (not res!405520) (not e!359356))))

(assert (=> b!627814 (= res!405520 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18209 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18209 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!627815 () Bool)

(declare-fun res!405516 () Bool)

(assert (=> b!627815 (=> (not res!405516) (not e!359358))))

(declare-fun arrayContainsKey!0 (array!37938 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!627815 (= res!405516 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!627816 () Bool)

(assert (=> b!627816 (= e!359356 false)))

(declare-fun lt!290346 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!627816 (= lt!290346 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!627817 () Bool)

(declare-fun res!405511 () Bool)

(assert (=> b!627817 (=> (not res!405511) (not e!359356))))

(assert (=> b!627817 (= res!405511 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18209 a!2986) index!984) (select (arr!18209 a!2986) j!136))) (not (= (select (arr!18209 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!627818 () Bool)

(declare-fun res!405514 () Bool)

(assert (=> b!627818 (=> (not res!405514) (not e!359356))))

(declare-datatypes ((List!12250 0))(
  ( (Nil!12247) (Cons!12246 (h!13291 (_ BitVec 64)) (t!18478 List!12250)) )
))
(declare-fun arrayNoDuplicates!0 (array!37938 (_ BitVec 32) List!12250) Bool)

(assert (=> b!627818 (= res!405514 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12247))))

(declare-fun b!627819 () Bool)

(declare-fun res!405517 () Bool)

(assert (=> b!627819 (=> (not res!405517) (not e!359358))))

(assert (=> b!627819 (= res!405517 (validKeyInArray!0 (select (arr!18209 a!2986) j!136)))))

(declare-fun b!627820 () Bool)

(assert (=> b!627820 (= e!359358 e!359356)))

(declare-fun res!405515 () Bool)

(assert (=> b!627820 (=> (not res!405515) (not e!359356))))

(declare-fun lt!290347 () SeekEntryResult!6649)

(assert (=> b!627820 (= res!405515 (or (= lt!290347 (MissingZero!6649 i!1108)) (= lt!290347 (MissingVacant!6649 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37938 (_ BitVec 32)) SeekEntryResult!6649)

(assert (=> b!627820 (= lt!290347 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!627821 () Bool)

(declare-fun res!405512 () Bool)

(assert (=> b!627821 (=> (not res!405512) (not e!359356))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37938 (_ BitVec 32)) Bool)

(assert (=> b!627821 (= res!405512 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!56646 res!405518) b!627812))

(assert (= (and b!627812 res!405513) b!627819))

(assert (= (and b!627819 res!405517) b!627811))

(assert (= (and b!627811 res!405521) b!627815))

(assert (= (and b!627815 res!405516) b!627820))

(assert (= (and b!627820 res!405515) b!627821))

(assert (= (and b!627821 res!405512) b!627818))

(assert (= (and b!627818 res!405514) b!627814))

(assert (= (and b!627814 res!405520) b!627813))

(assert (= (and b!627813 res!405519) b!627817))

(assert (= (and b!627817 res!405511) b!627816))

(declare-fun m!603087 () Bool)

(assert (=> b!627818 m!603087))

(declare-fun m!603089 () Bool)

(assert (=> b!627820 m!603089))

(declare-fun m!603091 () Bool)

(assert (=> b!627816 m!603091))

(declare-fun m!603093 () Bool)

(assert (=> b!627813 m!603093))

(assert (=> b!627813 m!603093))

(declare-fun m!603095 () Bool)

(assert (=> b!627813 m!603095))

(assert (=> b!627819 m!603093))

(assert (=> b!627819 m!603093))

(declare-fun m!603097 () Bool)

(assert (=> b!627819 m!603097))

(declare-fun m!603099 () Bool)

(assert (=> start!56646 m!603099))

(declare-fun m!603101 () Bool)

(assert (=> start!56646 m!603101))

(declare-fun m!603103 () Bool)

(assert (=> b!627815 m!603103))

(declare-fun m!603105 () Bool)

(assert (=> b!627814 m!603105))

(declare-fun m!603107 () Bool)

(assert (=> b!627814 m!603107))

(declare-fun m!603109 () Bool)

(assert (=> b!627814 m!603109))

(declare-fun m!603111 () Bool)

(assert (=> b!627817 m!603111))

(assert (=> b!627817 m!603093))

(declare-fun m!603113 () Bool)

(assert (=> b!627821 m!603113))

(declare-fun m!603115 () Bool)

(assert (=> b!627811 m!603115))

(push 1)

(assert (not b!627813))

