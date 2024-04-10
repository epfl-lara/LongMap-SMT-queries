; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56602 () Bool)

(assert start!56602)

(declare-fun b!627085 () Bool)

(declare-fun res!404790 () Bool)

(declare-fun e!359160 () Bool)

(assert (=> b!627085 (=> (not res!404790) (not e!359160))))

(declare-datatypes ((array!37894 0))(
  ( (array!37895 (arr!18187 (Array (_ BitVec 32) (_ BitVec 64))) (size!18551 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37894)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37894 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!627085 (= res!404790 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!627086 () Bool)

(declare-fun res!404785 () Bool)

(declare-fun e!359158 () Bool)

(assert (=> b!627086 (=> (not res!404785) (not e!359158))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6627 0))(
  ( (MissingZero!6627 (index!28792 (_ BitVec 32))) (Found!6627 (index!28793 (_ BitVec 32))) (Intermediate!6627 (undefined!7439 Bool) (index!28794 (_ BitVec 32)) (x!57535 (_ BitVec 32))) (Undefined!6627) (MissingVacant!6627 (index!28795 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37894 (_ BitVec 32)) SeekEntryResult!6627)

(assert (=> b!627086 (= res!404785 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18187 a!2986) j!136) a!2986 mask!3053) (Found!6627 j!136)))))

(declare-fun b!627087 () Bool)

(declare-fun res!404793 () Bool)

(assert (=> b!627087 (=> (not res!404793) (not e!359158))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!627087 (= res!404793 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18187 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18187 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!404794 () Bool)

(assert (=> start!56602 (=> (not res!404794) (not e!359160))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56602 (= res!404794 (validMask!0 mask!3053))))

(assert (=> start!56602 e!359160))

(assert (=> start!56602 true))

(declare-fun array_inv!13983 (array!37894) Bool)

(assert (=> start!56602 (array_inv!13983 a!2986)))

(declare-fun b!627088 () Bool)

(assert (=> b!627088 (= e!359158 false)))

(declare-fun lt!290214 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!627088 (= lt!290214 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!627089 () Bool)

(declare-fun res!404787 () Bool)

(assert (=> b!627089 (=> (not res!404787) (not e!359160))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!627089 (= res!404787 (validKeyInArray!0 k0!1786))))

(declare-fun b!627090 () Bool)

(declare-fun res!404791 () Bool)

(assert (=> b!627090 (=> (not res!404791) (not e!359160))))

(assert (=> b!627090 (= res!404791 (validKeyInArray!0 (select (arr!18187 a!2986) j!136)))))

(declare-fun b!627091 () Bool)

(declare-fun res!404788 () Bool)

(assert (=> b!627091 (=> (not res!404788) (not e!359160))))

(assert (=> b!627091 (= res!404788 (and (= (size!18551 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18551 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18551 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!627092 () Bool)

(declare-fun res!404786 () Bool)

(assert (=> b!627092 (=> (not res!404786) (not e!359158))))

(declare-datatypes ((List!12228 0))(
  ( (Nil!12225) (Cons!12224 (h!13269 (_ BitVec 64)) (t!18456 List!12228)) )
))
(declare-fun arrayNoDuplicates!0 (array!37894 (_ BitVec 32) List!12228) Bool)

(assert (=> b!627092 (= res!404786 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12225))))

(declare-fun b!627093 () Bool)

(declare-fun res!404789 () Bool)

(assert (=> b!627093 (=> (not res!404789) (not e!359158))))

(assert (=> b!627093 (= res!404789 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18187 a!2986) index!984) (select (arr!18187 a!2986) j!136))) (not (= (select (arr!18187 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!627094 () Bool)

(declare-fun res!404792 () Bool)

(assert (=> b!627094 (=> (not res!404792) (not e!359158))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37894 (_ BitVec 32)) Bool)

(assert (=> b!627094 (= res!404792 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!627095 () Bool)

(assert (=> b!627095 (= e!359160 e!359158)))

(declare-fun res!404795 () Bool)

(assert (=> b!627095 (=> (not res!404795) (not e!359158))))

(declare-fun lt!290215 () SeekEntryResult!6627)

(assert (=> b!627095 (= res!404795 (or (= lt!290215 (MissingZero!6627 i!1108)) (= lt!290215 (MissingVacant!6627 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37894 (_ BitVec 32)) SeekEntryResult!6627)

(assert (=> b!627095 (= lt!290215 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!56602 res!404794) b!627091))

(assert (= (and b!627091 res!404788) b!627090))

(assert (= (and b!627090 res!404791) b!627089))

(assert (= (and b!627089 res!404787) b!627085))

(assert (= (and b!627085 res!404790) b!627095))

(assert (= (and b!627095 res!404795) b!627094))

(assert (= (and b!627094 res!404792) b!627092))

(assert (= (and b!627092 res!404786) b!627087))

(assert (= (and b!627087 res!404793) b!627086))

(assert (= (and b!627086 res!404785) b!627093))

(assert (= (and b!627093 res!404789) b!627088))

(declare-fun m!602427 () Bool)

(assert (=> b!627087 m!602427))

(declare-fun m!602429 () Bool)

(assert (=> b!627087 m!602429))

(declare-fun m!602431 () Bool)

(assert (=> b!627087 m!602431))

(declare-fun m!602433 () Bool)

(assert (=> b!627090 m!602433))

(assert (=> b!627090 m!602433))

(declare-fun m!602435 () Bool)

(assert (=> b!627090 m!602435))

(declare-fun m!602437 () Bool)

(assert (=> b!627095 m!602437))

(declare-fun m!602439 () Bool)

(assert (=> b!627089 m!602439))

(declare-fun m!602441 () Bool)

(assert (=> b!627088 m!602441))

(declare-fun m!602443 () Bool)

(assert (=> start!56602 m!602443))

(declare-fun m!602445 () Bool)

(assert (=> start!56602 m!602445))

(declare-fun m!602447 () Bool)

(assert (=> b!627093 m!602447))

(assert (=> b!627093 m!602433))

(assert (=> b!627086 m!602433))

(assert (=> b!627086 m!602433))

(declare-fun m!602449 () Bool)

(assert (=> b!627086 m!602449))

(declare-fun m!602451 () Bool)

(assert (=> b!627085 m!602451))

(declare-fun m!602453 () Bool)

(assert (=> b!627092 m!602453))

(declare-fun m!602455 () Bool)

(assert (=> b!627094 m!602455))

(check-sat (not b!627090) (not b!627085) (not start!56602) (not b!627094) (not b!627089) (not b!627095) (not b!627092) (not b!627088) (not b!627086))
(check-sat)
