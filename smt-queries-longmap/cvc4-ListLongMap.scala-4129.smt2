; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56324 () Bool)

(assert start!56324)

(declare-fun b!624537 () Bool)

(declare-fun res!402687 () Bool)

(declare-fun e!358123 () Bool)

(assert (=> b!624537 (=> (not res!402687) (not e!358123))))

(declare-datatypes ((array!37749 0))(
  ( (array!37750 (arr!18119 (Array (_ BitVec 32) (_ BitVec 64))) (size!18483 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37749)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37749 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!624537 (= res!402687 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!624538 () Bool)

(declare-fun res!402695 () Bool)

(declare-fun e!358125 () Bool)

(assert (=> b!624538 (=> (not res!402695) (not e!358125))))

(declare-datatypes ((List!12160 0))(
  ( (Nil!12157) (Cons!12156 (h!13201 (_ BitVec 64)) (t!18388 List!12160)) )
))
(declare-fun arrayNoDuplicates!0 (array!37749 (_ BitVec 32) List!12160) Bool)

(assert (=> b!624538 (= res!402695 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12157))))

(declare-fun b!624539 () Bool)

(declare-fun res!402692 () Bool)

(assert (=> b!624539 (=> (not res!402692) (not e!358125))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!624539 (= res!402692 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18119 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18119 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!624540 () Bool)

(assert (=> b!624540 (= e!358125 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6559 0))(
  ( (MissingZero!6559 (index!28520 (_ BitVec 32))) (Found!6559 (index!28521 (_ BitVec 32))) (Intermediate!6559 (undefined!7371 Bool) (index!28522 (_ BitVec 32)) (x!57274 (_ BitVec 32))) (Undefined!6559) (MissingVacant!6559 (index!28523 (_ BitVec 32))) )
))
(declare-fun lt!289620 () SeekEntryResult!6559)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37749 (_ BitVec 32)) SeekEntryResult!6559)

(assert (=> b!624540 (= lt!289620 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18119 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!402694 () Bool)

(assert (=> start!56324 (=> (not res!402694) (not e!358123))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56324 (= res!402694 (validMask!0 mask!3053))))

(assert (=> start!56324 e!358123))

(assert (=> start!56324 true))

(declare-fun array_inv!13915 (array!37749) Bool)

(assert (=> start!56324 (array_inv!13915 a!2986)))

(declare-fun b!624541 () Bool)

(declare-fun res!402690 () Bool)

(assert (=> b!624541 (=> (not res!402690) (not e!358123))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!624541 (= res!402690 (validKeyInArray!0 (select (arr!18119 a!2986) j!136)))))

(declare-fun b!624542 () Bool)

(declare-fun res!402689 () Bool)

(assert (=> b!624542 (=> (not res!402689) (not e!358123))))

(assert (=> b!624542 (= res!402689 (and (= (size!18483 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18483 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18483 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!624543 () Bool)

(declare-fun res!402693 () Bool)

(assert (=> b!624543 (=> (not res!402693) (not e!358125))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37749 (_ BitVec 32)) Bool)

(assert (=> b!624543 (= res!402693 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!624544 () Bool)

(assert (=> b!624544 (= e!358123 e!358125)))

(declare-fun res!402688 () Bool)

(assert (=> b!624544 (=> (not res!402688) (not e!358125))))

(declare-fun lt!289621 () SeekEntryResult!6559)

(assert (=> b!624544 (= res!402688 (or (= lt!289621 (MissingZero!6559 i!1108)) (= lt!289621 (MissingVacant!6559 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37749 (_ BitVec 32)) SeekEntryResult!6559)

(assert (=> b!624544 (= lt!289621 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!624545 () Bool)

(declare-fun res!402691 () Bool)

(assert (=> b!624545 (=> (not res!402691) (not e!358123))))

(assert (=> b!624545 (= res!402691 (validKeyInArray!0 k!1786))))

(assert (= (and start!56324 res!402694) b!624542))

(assert (= (and b!624542 res!402689) b!624541))

(assert (= (and b!624541 res!402690) b!624545))

(assert (= (and b!624545 res!402691) b!624537))

(assert (= (and b!624537 res!402687) b!624544))

(assert (= (and b!624544 res!402688) b!624543))

(assert (= (and b!624543 res!402693) b!624538))

(assert (= (and b!624538 res!402695) b!624539))

(assert (= (and b!624539 res!402692) b!624540))

(declare-fun m!600231 () Bool)

(assert (=> b!624540 m!600231))

(assert (=> b!624540 m!600231))

(declare-fun m!600233 () Bool)

(assert (=> b!624540 m!600233))

(declare-fun m!600235 () Bool)

(assert (=> b!624539 m!600235))

(declare-fun m!600237 () Bool)

(assert (=> b!624539 m!600237))

(declare-fun m!600239 () Bool)

(assert (=> b!624539 m!600239))

(assert (=> b!624541 m!600231))

(assert (=> b!624541 m!600231))

(declare-fun m!600241 () Bool)

(assert (=> b!624541 m!600241))

(declare-fun m!600243 () Bool)

(assert (=> start!56324 m!600243))

(declare-fun m!600245 () Bool)

(assert (=> start!56324 m!600245))

(declare-fun m!600247 () Bool)

(assert (=> b!624537 m!600247))

(declare-fun m!600249 () Bool)

(assert (=> b!624545 m!600249))

(declare-fun m!600251 () Bool)

(assert (=> b!624538 m!600251))

(declare-fun m!600253 () Bool)

(assert (=> b!624543 m!600253))

(declare-fun m!600255 () Bool)

(assert (=> b!624544 m!600255))

(push 1)

(assert (not b!624541))

(assert (not b!624540))

(assert (not b!624537))

(assert (not b!624543))

(assert (not start!56324))

(assert (not b!624538))

