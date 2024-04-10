; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56618 () Bool)

(assert start!56618)

(declare-fun b!627349 () Bool)

(declare-fun e!359231 () Bool)

(assert (=> b!627349 (= e!359231 false)))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!290263 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!627349 (= lt!290263 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!627350 () Bool)

(declare-fun res!405052 () Bool)

(assert (=> b!627350 (=> (not res!405052) (not e!359231))))

(declare-datatypes ((array!37910 0))(
  ( (array!37911 (arr!18195 (Array (_ BitVec 32) (_ BitVec 64))) (size!18559 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37910)

(declare-datatypes ((List!12236 0))(
  ( (Nil!12233) (Cons!12232 (h!13277 (_ BitVec 64)) (t!18464 List!12236)) )
))
(declare-fun arrayNoDuplicates!0 (array!37910 (_ BitVec 32) List!12236) Bool)

(assert (=> b!627350 (= res!405052 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12233))))

(declare-fun b!627352 () Bool)

(declare-fun res!405055 () Bool)

(declare-fun e!359232 () Bool)

(assert (=> b!627352 (=> (not res!405055) (not e!359232))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!627352 (= res!405055 (validKeyInArray!0 (select (arr!18195 a!2986) j!136)))))

(declare-fun b!627353 () Bool)

(declare-fun res!405058 () Bool)

(assert (=> b!627353 (=> (not res!405058) (not e!359232))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!627353 (= res!405058 (and (= (size!18559 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18559 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18559 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!627354 () Bool)

(declare-fun res!405049 () Bool)

(assert (=> b!627354 (=> (not res!405049) (not e!359232))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37910 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!627354 (= res!405049 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!627355 () Bool)

(declare-fun res!405056 () Bool)

(assert (=> b!627355 (=> (not res!405056) (not e!359231))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6635 0))(
  ( (MissingZero!6635 (index!28824 (_ BitVec 32))) (Found!6635 (index!28825 (_ BitVec 32))) (Intermediate!6635 (undefined!7447 Bool) (index!28826 (_ BitVec 32)) (x!57567 (_ BitVec 32))) (Undefined!6635) (MissingVacant!6635 (index!28827 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37910 (_ BitVec 32)) SeekEntryResult!6635)

(assert (=> b!627355 (= res!405056 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18195 a!2986) j!136) a!2986 mask!3053) (Found!6635 j!136)))))

(declare-fun b!627356 () Bool)

(declare-fun res!405053 () Bool)

(assert (=> b!627356 (=> (not res!405053) (not e!359231))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37910 (_ BitVec 32)) Bool)

(assert (=> b!627356 (= res!405053 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!627357 () Bool)

(declare-fun res!405059 () Bool)

(assert (=> b!627357 (=> (not res!405059) (not e!359232))))

(assert (=> b!627357 (= res!405059 (validKeyInArray!0 k!1786))))

(declare-fun res!405051 () Bool)

(assert (=> start!56618 (=> (not res!405051) (not e!359232))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56618 (= res!405051 (validMask!0 mask!3053))))

(assert (=> start!56618 e!359232))

(assert (=> start!56618 true))

(declare-fun array_inv!13991 (array!37910) Bool)

(assert (=> start!56618 (array_inv!13991 a!2986)))

(declare-fun b!627351 () Bool)

(assert (=> b!627351 (= e!359232 e!359231)))

(declare-fun res!405054 () Bool)

(assert (=> b!627351 (=> (not res!405054) (not e!359231))))

(declare-fun lt!290262 () SeekEntryResult!6635)

(assert (=> b!627351 (= res!405054 (or (= lt!290262 (MissingZero!6635 i!1108)) (= lt!290262 (MissingVacant!6635 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37910 (_ BitVec 32)) SeekEntryResult!6635)

(assert (=> b!627351 (= lt!290262 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!627358 () Bool)

(declare-fun res!405057 () Bool)

(assert (=> b!627358 (=> (not res!405057) (not e!359231))))

(assert (=> b!627358 (= res!405057 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18195 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18195 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!627359 () Bool)

(declare-fun res!405050 () Bool)

(assert (=> b!627359 (=> (not res!405050) (not e!359231))))

(assert (=> b!627359 (= res!405050 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18195 a!2986) index!984) (select (arr!18195 a!2986) j!136))) (not (= (select (arr!18195 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (= (and start!56618 res!405051) b!627353))

(assert (= (and b!627353 res!405058) b!627352))

(assert (= (and b!627352 res!405055) b!627357))

(assert (= (and b!627357 res!405059) b!627354))

(assert (= (and b!627354 res!405049) b!627351))

(assert (= (and b!627351 res!405054) b!627356))

(assert (= (and b!627356 res!405053) b!627350))

(assert (= (and b!627350 res!405052) b!627358))

(assert (= (and b!627358 res!405057) b!627355))

(assert (= (and b!627355 res!405056) b!627359))

(assert (= (and b!627359 res!405050) b!627349))

(declare-fun m!602667 () Bool)

(assert (=> start!56618 m!602667))

(declare-fun m!602669 () Bool)

(assert (=> start!56618 m!602669))

(declare-fun m!602671 () Bool)

(assert (=> b!627355 m!602671))

(assert (=> b!627355 m!602671))

(declare-fun m!602673 () Bool)

(assert (=> b!627355 m!602673))

(declare-fun m!602675 () Bool)

(assert (=> b!627358 m!602675))

(declare-fun m!602677 () Bool)

(assert (=> b!627358 m!602677))

(declare-fun m!602679 () Bool)

(assert (=> b!627358 m!602679))

(assert (=> b!627352 m!602671))

(assert (=> b!627352 m!602671))

(declare-fun m!602681 () Bool)

(assert (=> b!627352 m!602681))

(declare-fun m!602683 () Bool)

(assert (=> b!627349 m!602683))

(declare-fun m!602685 () Bool)

(assert (=> b!627359 m!602685))

(assert (=> b!627359 m!602671))

(declare-fun m!602687 () Bool)

(assert (=> b!627351 m!602687))

(declare-fun m!602689 () Bool)

(assert (=> b!627350 m!602689))

(declare-fun m!602691 () Bool)

(assert (=> b!627357 m!602691))

(declare-fun m!602693 () Bool)

(assert (=> b!627356 m!602693))

(declare-fun m!602695 () Bool)

(assert (=> b!627354 m!602695))

(push 1)

