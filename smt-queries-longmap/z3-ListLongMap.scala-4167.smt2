; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56730 () Bool)

(assert start!56730)

(declare-fun b!628473 () Bool)

(declare-fun e!359517 () Bool)

(assert (=> b!628473 (= e!359517 false)))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun lt!290326 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!628473 (= lt!290326 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!628474 () Bool)

(declare-fun res!406175 () Bool)

(assert (=> b!628474 (=> (not res!406175) (not e!359517))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!37983 0))(
  ( (array!37984 (arr!18230 (Array (_ BitVec 32) (_ BitVec 64))) (size!18595 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37983)

(declare-datatypes ((SeekEntryResult!6667 0))(
  ( (MissingZero!6667 (index!28952 (_ BitVec 32))) (Found!6667 (index!28953 (_ BitVec 32))) (Intermediate!6667 (undefined!7479 Bool) (index!28954 (_ BitVec 32)) (x!57696 (_ BitVec 32))) (Undefined!6667) (MissingVacant!6667 (index!28955 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37983 (_ BitVec 32)) SeekEntryResult!6667)

(assert (=> b!628474 (= res!406175 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18230 a!2986) j!136) a!2986 mask!3053) (Found!6667 j!136)))))

(declare-fun b!628475 () Bool)

(declare-fun res!406181 () Bool)

(declare-fun e!359515 () Bool)

(assert (=> b!628475 (=> (not res!406181) (not e!359515))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!628475 (= res!406181 (validKeyInArray!0 k0!1786))))

(declare-fun b!628476 () Bool)

(assert (=> b!628476 (= e!359515 e!359517)))

(declare-fun res!406176 () Bool)

(assert (=> b!628476 (=> (not res!406176) (not e!359517))))

(declare-fun lt!290325 () SeekEntryResult!6667)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!628476 (= res!406176 (or (= lt!290325 (MissingZero!6667 i!1108)) (= lt!290325 (MissingVacant!6667 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37983 (_ BitVec 32)) SeekEntryResult!6667)

(assert (=> b!628476 (= lt!290325 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!628477 () Bool)

(declare-fun res!406177 () Bool)

(assert (=> b!628477 (=> (not res!406177) (not e!359515))))

(assert (=> b!628477 (= res!406177 (validKeyInArray!0 (select (arr!18230 a!2986) j!136)))))

(declare-fun b!628478 () Bool)

(declare-fun res!406173 () Bool)

(assert (=> b!628478 (=> (not res!406173) (not e!359517))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37983 (_ BitVec 32)) Bool)

(assert (=> b!628478 (= res!406173 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!406180 () Bool)

(assert (=> start!56730 (=> (not res!406180) (not e!359515))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56730 (= res!406180 (validMask!0 mask!3053))))

(assert (=> start!56730 e!359515))

(assert (=> start!56730 true))

(declare-fun array_inv!14113 (array!37983) Bool)

(assert (=> start!56730 (array_inv!14113 a!2986)))

(declare-fun b!628479 () Bool)

(declare-fun res!406179 () Bool)

(assert (=> b!628479 (=> (not res!406179) (not e!359515))))

(declare-fun arrayContainsKey!0 (array!37983 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!628479 (= res!406179 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!628480 () Bool)

(declare-fun res!406178 () Bool)

(assert (=> b!628480 (=> (not res!406178) (not e!359517))))

(assert (=> b!628480 (= res!406178 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18230 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18230 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!628481 () Bool)

(declare-fun res!406174 () Bool)

(assert (=> b!628481 (=> (not res!406174) (not e!359515))))

(assert (=> b!628481 (= res!406174 (and (= (size!18595 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18595 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18595 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!628482 () Bool)

(declare-fun res!406171 () Bool)

(assert (=> b!628482 (=> (not res!406171) (not e!359517))))

(assert (=> b!628482 (= res!406171 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18230 a!2986) index!984) (select (arr!18230 a!2986) j!136))) (not (= (select (arr!18230 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!628483 () Bool)

(declare-fun res!406172 () Bool)

(assert (=> b!628483 (=> (not res!406172) (not e!359517))))

(declare-datatypes ((List!12310 0))(
  ( (Nil!12307) (Cons!12306 (h!13351 (_ BitVec 64)) (t!18529 List!12310)) )
))
(declare-fun arrayNoDuplicates!0 (array!37983 (_ BitVec 32) List!12310) Bool)

(assert (=> b!628483 (= res!406172 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12307))))

(assert (= (and start!56730 res!406180) b!628481))

(assert (= (and b!628481 res!406174) b!628477))

(assert (= (and b!628477 res!406177) b!628475))

(assert (= (and b!628475 res!406181) b!628479))

(assert (= (and b!628479 res!406179) b!628476))

(assert (= (and b!628476 res!406176) b!628478))

(assert (= (and b!628478 res!406173) b!628483))

(assert (= (and b!628483 res!406172) b!628480))

(assert (= (and b!628480 res!406178) b!628474))

(assert (= (and b!628474 res!406175) b!628482))

(assert (= (and b!628482 res!406171) b!628473))

(declare-fun m!603103 () Bool)

(assert (=> b!628483 m!603103))

(declare-fun m!603105 () Bool)

(assert (=> b!628480 m!603105))

(declare-fun m!603107 () Bool)

(assert (=> b!628480 m!603107))

(declare-fun m!603109 () Bool)

(assert (=> b!628480 m!603109))

(declare-fun m!603111 () Bool)

(assert (=> b!628475 m!603111))

(declare-fun m!603113 () Bool)

(assert (=> b!628478 m!603113))

(declare-fun m!603115 () Bool)

(assert (=> start!56730 m!603115))

(declare-fun m!603117 () Bool)

(assert (=> start!56730 m!603117))

(declare-fun m!603119 () Bool)

(assert (=> b!628473 m!603119))

(declare-fun m!603121 () Bool)

(assert (=> b!628476 m!603121))

(declare-fun m!603123 () Bool)

(assert (=> b!628479 m!603123))

(declare-fun m!603125 () Bool)

(assert (=> b!628482 m!603125))

(declare-fun m!603127 () Bool)

(assert (=> b!628482 m!603127))

(assert (=> b!628477 m!603127))

(assert (=> b!628477 m!603127))

(declare-fun m!603129 () Bool)

(assert (=> b!628477 m!603129))

(assert (=> b!628474 m!603127))

(assert (=> b!628474 m!603127))

(declare-fun m!603131 () Bool)

(assert (=> b!628474 m!603131))

(check-sat (not b!628474) (not b!628478) (not b!628477) (not b!628476) (not b!628479) (not b!628475) (not b!628483) (not b!628473) (not start!56730))
(check-sat)
