; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56308 () Bool)

(assert start!56308)

(declare-fun b!624346 () Bool)

(declare-fun res!402496 () Bool)

(declare-fun e!358053 () Bool)

(assert (=> b!624346 (=> (not res!402496) (not e!358053))))

(declare-datatypes ((array!37733 0))(
  ( (array!37734 (arr!18111 (Array (_ BitVec 32) (_ BitVec 64))) (size!18475 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37733)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!624346 (= res!402496 (validKeyInArray!0 (select (arr!18111 a!2986) j!136)))))

(declare-fun b!624347 () Bool)

(declare-fun res!402498 () Bool)

(assert (=> b!624347 (=> (not res!402498) (not e!358053))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!624347 (= res!402498 (validKeyInArray!0 k!1786))))

(declare-fun res!402501 () Bool)

(assert (=> start!56308 (=> (not res!402501) (not e!358053))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56308 (= res!402501 (validMask!0 mask!3053))))

(assert (=> start!56308 e!358053))

(assert (=> start!56308 true))

(declare-fun array_inv!13907 (array!37733) Bool)

(assert (=> start!56308 (array_inv!13907 a!2986)))

(declare-fun b!624348 () Bool)

(declare-fun res!402503 () Bool)

(declare-fun e!358051 () Bool)

(assert (=> b!624348 (=> (not res!402503) (not e!358051))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37733 (_ BitVec 32)) Bool)

(assert (=> b!624348 (= res!402503 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!624349 () Bool)

(assert (=> b!624349 (= e!358053 e!358051)))

(declare-fun res!402499 () Bool)

(assert (=> b!624349 (=> (not res!402499) (not e!358051))))

(declare-datatypes ((SeekEntryResult!6551 0))(
  ( (MissingZero!6551 (index!28488 (_ BitVec 32))) (Found!6551 (index!28489 (_ BitVec 32))) (Intermediate!6551 (undefined!7363 Bool) (index!28490 (_ BitVec 32)) (x!57250 (_ BitVec 32))) (Undefined!6551) (MissingVacant!6551 (index!28491 (_ BitVec 32))) )
))
(declare-fun lt!289579 () SeekEntryResult!6551)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!624349 (= res!402499 (or (= lt!289579 (MissingZero!6551 i!1108)) (= lt!289579 (MissingVacant!6551 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37733 (_ BitVec 32)) SeekEntryResult!6551)

(assert (=> b!624349 (= lt!289579 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!624350 () Bool)

(declare-fun res!402497 () Bool)

(assert (=> b!624350 (=> (not res!402497) (not e!358053))))

(declare-fun arrayContainsKey!0 (array!37733 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!624350 (= res!402497 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!624351 () Bool)

(declare-fun res!402500 () Bool)

(assert (=> b!624351 (=> (not res!402500) (not e!358053))))

(assert (=> b!624351 (= res!402500 (and (= (size!18475 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18475 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18475 a!2986)) (not (= i!1108 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun b!624352 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!624352 (= e!358051 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18111 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantSpotIndex!68 (size!18475 a!2986))))))

(declare-fun b!624353 () Bool)

(declare-fun res!402502 () Bool)

(assert (=> b!624353 (=> (not res!402502) (not e!358051))))

(declare-datatypes ((List!12152 0))(
  ( (Nil!12149) (Cons!12148 (h!13193 (_ BitVec 64)) (t!18380 List!12152)) )
))
(declare-fun arrayNoDuplicates!0 (array!37733 (_ BitVec 32) List!12152) Bool)

(assert (=> b!624353 (= res!402502 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12149))))

(assert (= (and start!56308 res!402501) b!624351))

(assert (= (and b!624351 res!402500) b!624346))

(assert (= (and b!624346 res!402496) b!624347))

(assert (= (and b!624347 res!402498) b!624350))

(assert (= (and b!624350 res!402497) b!624349))

(assert (= (and b!624349 res!402499) b!624348))

(assert (= (and b!624348 res!402503) b!624353))

(assert (= (and b!624353 res!402502) b!624352))

(declare-fun m!600065 () Bool)

(assert (=> b!624347 m!600065))

(declare-fun m!600067 () Bool)

(assert (=> b!624346 m!600067))

(assert (=> b!624346 m!600067))

(declare-fun m!600069 () Bool)

(assert (=> b!624346 m!600069))

(declare-fun m!600071 () Bool)

(assert (=> b!624352 m!600071))

(declare-fun m!600073 () Bool)

(assert (=> b!624350 m!600073))

(declare-fun m!600075 () Bool)

(assert (=> b!624348 m!600075))

(declare-fun m!600077 () Bool)

(assert (=> b!624353 m!600077))

(declare-fun m!600079 () Bool)

(assert (=> start!56308 m!600079))

(declare-fun m!600081 () Bool)

(assert (=> start!56308 m!600081))

(declare-fun m!600083 () Bool)

(assert (=> b!624349 m!600083))

(push 1)

(assert (not b!624348))

(assert (not b!624346))

(assert (not b!624350))

(assert (not b!624349))

(assert (not start!56308))

(assert (not b!624347))

(assert (not b!624353))

(check-sat)

(pop 1)

(push 1)

(check-sat)

