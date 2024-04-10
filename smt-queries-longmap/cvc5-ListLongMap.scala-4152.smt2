; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56600 () Bool)

(assert start!56600)

(declare-fun b!627052 () Bool)

(declare-fun res!404752 () Bool)

(declare-fun e!359150 () Bool)

(assert (=> b!627052 (=> (not res!404752) (not e!359150))))

(declare-datatypes ((array!37892 0))(
  ( (array!37893 (arr!18186 (Array (_ BitVec 32) (_ BitVec 64))) (size!18550 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37892)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!627052 (= res!404752 (validKeyInArray!0 (select (arr!18186 a!2986) j!136)))))

(declare-fun res!404759 () Bool)

(assert (=> start!56600 (=> (not res!404759) (not e!359150))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56600 (= res!404759 (validMask!0 mask!3053))))

(assert (=> start!56600 e!359150))

(assert (=> start!56600 true))

(declare-fun array_inv!13982 (array!37892) Bool)

(assert (=> start!56600 (array_inv!13982 a!2986)))

(declare-fun b!627053 () Bool)

(declare-fun res!404756 () Bool)

(assert (=> b!627053 (=> (not res!404756) (not e!359150))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!627053 (= res!404756 (and (= (size!18550 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18550 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18550 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!627054 () Bool)

(declare-fun e!359149 () Bool)

(assert (=> b!627054 (= e!359150 e!359149)))

(declare-fun res!404755 () Bool)

(assert (=> b!627054 (=> (not res!404755) (not e!359149))))

(declare-datatypes ((SeekEntryResult!6626 0))(
  ( (MissingZero!6626 (index!28788 (_ BitVec 32))) (Found!6626 (index!28789 (_ BitVec 32))) (Intermediate!6626 (undefined!7438 Bool) (index!28790 (_ BitVec 32)) (x!57534 (_ BitVec 32))) (Undefined!6626) (MissingVacant!6626 (index!28791 (_ BitVec 32))) )
))
(declare-fun lt!290208 () SeekEntryResult!6626)

(assert (=> b!627054 (= res!404755 (or (= lt!290208 (MissingZero!6626 i!1108)) (= lt!290208 (MissingVacant!6626 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37892 (_ BitVec 32)) SeekEntryResult!6626)

(assert (=> b!627054 (= lt!290208 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!627055 () Bool)

(declare-fun res!404757 () Bool)

(assert (=> b!627055 (=> (not res!404757) (not e!359149))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37892 (_ BitVec 32)) Bool)

(assert (=> b!627055 (= res!404757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!627056 () Bool)

(declare-fun res!404754 () Bool)

(assert (=> b!627056 (=> (not res!404754) (not e!359149))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!627056 (= res!404754 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18186 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18186 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!627057 () Bool)

(declare-fun res!404760 () Bool)

(assert (=> b!627057 (=> (not res!404760) (not e!359149))))

(declare-datatypes ((List!12227 0))(
  ( (Nil!12224) (Cons!12223 (h!13268 (_ BitVec 64)) (t!18455 List!12227)) )
))
(declare-fun arrayNoDuplicates!0 (array!37892 (_ BitVec 32) List!12227) Bool)

(assert (=> b!627057 (= res!404760 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12224))))

(declare-fun b!627058 () Bool)

(declare-fun res!404761 () Bool)

(assert (=> b!627058 (=> (not res!404761) (not e!359150))))

(declare-fun arrayContainsKey!0 (array!37892 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!627058 (= res!404761 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!627059 () Bool)

(declare-fun res!404753 () Bool)

(assert (=> b!627059 (=> (not res!404753) (not e!359149))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37892 (_ BitVec 32)) SeekEntryResult!6626)

(assert (=> b!627059 (= res!404753 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18186 a!2986) j!136) a!2986 mask!3053) (Found!6626 j!136)))))

(declare-fun b!627060 () Bool)

(declare-fun res!404762 () Bool)

(assert (=> b!627060 (=> (not res!404762) (not e!359150))))

(assert (=> b!627060 (= res!404762 (validKeyInArray!0 k!1786))))

(declare-fun b!627061 () Bool)

(assert (=> b!627061 (= e!359149 false)))

(declare-fun lt!290209 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!627061 (= lt!290209 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!627062 () Bool)

(declare-fun res!404758 () Bool)

(assert (=> b!627062 (=> (not res!404758) (not e!359149))))

(assert (=> b!627062 (= res!404758 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18186 a!2986) index!984) (select (arr!18186 a!2986) j!136))) (not (= (select (arr!18186 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (= (and start!56600 res!404759) b!627053))

(assert (= (and b!627053 res!404756) b!627052))

(assert (= (and b!627052 res!404752) b!627060))

(assert (= (and b!627060 res!404762) b!627058))

(assert (= (and b!627058 res!404761) b!627054))

(assert (= (and b!627054 res!404755) b!627055))

(assert (= (and b!627055 res!404757) b!627057))

(assert (= (and b!627057 res!404760) b!627056))

(assert (= (and b!627056 res!404754) b!627059))

(assert (= (and b!627059 res!404753) b!627062))

(assert (= (and b!627062 res!404758) b!627061))

(declare-fun m!602397 () Bool)

(assert (=> b!627055 m!602397))

(declare-fun m!602399 () Bool)

(assert (=> b!627058 m!602399))

(declare-fun m!602401 () Bool)

(assert (=> b!627060 m!602401))

(declare-fun m!602403 () Bool)

(assert (=> b!627054 m!602403))

(declare-fun m!602405 () Bool)

(assert (=> b!627062 m!602405))

(declare-fun m!602407 () Bool)

(assert (=> b!627062 m!602407))

(declare-fun m!602409 () Bool)

(assert (=> b!627057 m!602409))

(declare-fun m!602411 () Bool)

(assert (=> start!56600 m!602411))

(declare-fun m!602413 () Bool)

(assert (=> start!56600 m!602413))

(assert (=> b!627052 m!602407))

(assert (=> b!627052 m!602407))

(declare-fun m!602415 () Bool)

(assert (=> b!627052 m!602415))

(declare-fun m!602417 () Bool)

(assert (=> b!627061 m!602417))

(assert (=> b!627059 m!602407))

(assert (=> b!627059 m!602407))

(declare-fun m!602419 () Bool)

(assert (=> b!627059 m!602419))

(declare-fun m!602421 () Bool)

(assert (=> b!627056 m!602421))

(declare-fun m!602423 () Bool)

(assert (=> b!627056 m!602423))

(declare-fun m!602425 () Bool)

(assert (=> b!627056 m!602425))

(push 1)

