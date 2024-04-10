; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56608 () Bool)

(assert start!56608)

(declare-fun b!627184 () Bool)

(declare-fun res!404888 () Bool)

(declare-fun e!359185 () Bool)

(assert (=> b!627184 (=> (not res!404888) (not e!359185))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37900 0))(
  ( (array!37901 (arr!18190 (Array (_ BitVec 32) (_ BitVec 64))) (size!18554 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37900)

(assert (=> b!627184 (= res!404888 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18190 a!2986) index!984) (select (arr!18190 a!2986) j!136))) (not (= (select (arr!18190 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!627185 () Bool)

(declare-fun res!404886 () Bool)

(assert (=> b!627185 (=> (not res!404886) (not e!359185))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37900 (_ BitVec 32)) Bool)

(assert (=> b!627185 (= res!404886 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!627186 () Bool)

(declare-fun res!404890 () Bool)

(declare-fun e!359186 () Bool)

(assert (=> b!627186 (=> (not res!404890) (not e!359186))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!627186 (= res!404890 (and (= (size!18554 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18554 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18554 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!627187 () Bool)

(assert (=> b!627187 (= e!359186 e!359185)))

(declare-fun res!404884 () Bool)

(assert (=> b!627187 (=> (not res!404884) (not e!359185))))

(declare-datatypes ((SeekEntryResult!6630 0))(
  ( (MissingZero!6630 (index!28804 (_ BitVec 32))) (Found!6630 (index!28805 (_ BitVec 32))) (Intermediate!6630 (undefined!7442 Bool) (index!28806 (_ BitVec 32)) (x!57546 (_ BitVec 32))) (Undefined!6630) (MissingVacant!6630 (index!28807 (_ BitVec 32))) )
))
(declare-fun lt!290233 () SeekEntryResult!6630)

(assert (=> b!627187 (= res!404884 (or (= lt!290233 (MissingZero!6630 i!1108)) (= lt!290233 (MissingVacant!6630 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37900 (_ BitVec 32)) SeekEntryResult!6630)

(assert (=> b!627187 (= lt!290233 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!627188 () Bool)

(declare-fun res!404889 () Bool)

(assert (=> b!627188 (=> (not res!404889) (not e!359186))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!627188 (= res!404889 (validKeyInArray!0 k0!1786))))

(declare-fun b!627189 () Bool)

(declare-fun res!404893 () Bool)

(assert (=> b!627189 (=> (not res!404893) (not e!359186))))

(declare-fun arrayContainsKey!0 (array!37900 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!627189 (= res!404893 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!404892 () Bool)

(assert (=> start!56608 (=> (not res!404892) (not e!359186))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56608 (= res!404892 (validMask!0 mask!3053))))

(assert (=> start!56608 e!359186))

(assert (=> start!56608 true))

(declare-fun array_inv!13986 (array!37900) Bool)

(assert (=> start!56608 (array_inv!13986 a!2986)))

(declare-fun b!627190 () Bool)

(declare-fun res!404887 () Bool)

(assert (=> b!627190 (=> (not res!404887) (not e!359185))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!627190 (= res!404887 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18190 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18190 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!627191 () Bool)

(declare-fun res!404894 () Bool)

(assert (=> b!627191 (=> (not res!404894) (not e!359185))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37900 (_ BitVec 32)) SeekEntryResult!6630)

(assert (=> b!627191 (= res!404894 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18190 a!2986) j!136) a!2986 mask!3053) (Found!6630 j!136)))))

(declare-fun b!627192 () Bool)

(assert (=> b!627192 (= e!359185 false)))

(declare-fun lt!290232 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!627192 (= lt!290232 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!627193 () Bool)

(declare-fun res!404885 () Bool)

(assert (=> b!627193 (=> (not res!404885) (not e!359186))))

(assert (=> b!627193 (= res!404885 (validKeyInArray!0 (select (arr!18190 a!2986) j!136)))))

(declare-fun b!627194 () Bool)

(declare-fun res!404891 () Bool)

(assert (=> b!627194 (=> (not res!404891) (not e!359185))))

(declare-datatypes ((List!12231 0))(
  ( (Nil!12228) (Cons!12227 (h!13272 (_ BitVec 64)) (t!18459 List!12231)) )
))
(declare-fun arrayNoDuplicates!0 (array!37900 (_ BitVec 32) List!12231) Bool)

(assert (=> b!627194 (= res!404891 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12228))))

(assert (= (and start!56608 res!404892) b!627186))

(assert (= (and b!627186 res!404890) b!627193))

(assert (= (and b!627193 res!404885) b!627188))

(assert (= (and b!627188 res!404889) b!627189))

(assert (= (and b!627189 res!404893) b!627187))

(assert (= (and b!627187 res!404884) b!627185))

(assert (= (and b!627185 res!404886) b!627194))

(assert (= (and b!627194 res!404891) b!627190))

(assert (= (and b!627190 res!404887) b!627191))

(assert (= (and b!627191 res!404894) b!627184))

(assert (= (and b!627184 res!404888) b!627192))

(declare-fun m!602517 () Bool)

(assert (=> b!627191 m!602517))

(assert (=> b!627191 m!602517))

(declare-fun m!602519 () Bool)

(assert (=> b!627191 m!602519))

(declare-fun m!602521 () Bool)

(assert (=> b!627184 m!602521))

(assert (=> b!627184 m!602517))

(declare-fun m!602523 () Bool)

(assert (=> b!627188 m!602523))

(declare-fun m!602525 () Bool)

(assert (=> b!627185 m!602525))

(declare-fun m!602527 () Bool)

(assert (=> b!627194 m!602527))

(declare-fun m!602529 () Bool)

(assert (=> b!627192 m!602529))

(assert (=> b!627193 m!602517))

(assert (=> b!627193 m!602517))

(declare-fun m!602531 () Bool)

(assert (=> b!627193 m!602531))

(declare-fun m!602533 () Bool)

(assert (=> start!56608 m!602533))

(declare-fun m!602535 () Bool)

(assert (=> start!56608 m!602535))

(declare-fun m!602537 () Bool)

(assert (=> b!627190 m!602537))

(declare-fun m!602539 () Bool)

(assert (=> b!627190 m!602539))

(declare-fun m!602541 () Bool)

(assert (=> b!627190 m!602541))

(declare-fun m!602543 () Bool)

(assert (=> b!627189 m!602543))

(declare-fun m!602545 () Bool)

(assert (=> b!627187 m!602545))

(check-sat (not b!627188) (not start!56608) (not b!627189) (not b!627193) (not b!627194) (not b!627191) (not b!627185) (not b!627187) (not b!627192))
(check-sat)
