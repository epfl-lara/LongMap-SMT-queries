; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56952 () Bool)

(assert start!56952)

(declare-fun res!407252 () Bool)

(declare-fun e!360366 () Bool)

(assert (=> start!56952 (=> (not res!407252) (not e!360366))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56952 (= res!407252 (validMask!0 mask!3053))))

(assert (=> start!56952 e!360366))

(assert (=> start!56952 true))

(declare-datatypes ((array!38028 0))(
  ( (array!38029 (arr!18247 (Array (_ BitVec 32) (_ BitVec 64))) (size!18611 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38028)

(declare-fun array_inv!14106 (array!38028) Bool)

(assert (=> start!56952 (array_inv!14106 a!2986)))

(declare-fun b!630141 () Bool)

(declare-fun res!407260 () Bool)

(assert (=> b!630141 (=> (not res!407260) (not e!360366))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!630141 (= res!407260 (validKeyInArray!0 k0!1786))))

(declare-fun b!630142 () Bool)

(declare-fun e!360363 () Bool)

(assert (=> b!630142 (= e!360366 e!360363)))

(declare-fun res!407251 () Bool)

(assert (=> b!630142 (=> (not res!407251) (not e!360363))))

(declare-datatypes ((SeekEntryResult!6643 0))(
  ( (MissingZero!6643 (index!28859 (_ BitVec 32))) (Found!6643 (index!28860 (_ BitVec 32))) (Intermediate!6643 (undefined!7455 Bool) (index!28861 (_ BitVec 32)) (x!57751 (_ BitVec 32))) (Undefined!6643) (MissingVacant!6643 (index!28862 (_ BitVec 32))) )
))
(declare-fun lt!291045 () SeekEntryResult!6643)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!630142 (= res!407251 (or (= lt!291045 (MissingZero!6643 i!1108)) (= lt!291045 (MissingVacant!6643 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38028 (_ BitVec 32)) SeekEntryResult!6643)

(assert (=> b!630142 (= lt!291045 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!630143 () Bool)

(declare-fun e!360362 () Bool)

(assert (=> b!630143 (= e!360363 e!360362)))

(declare-fun res!407255 () Bool)

(assert (=> b!630143 (=> (not res!407255) (not e!360362))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!291047 () SeekEntryResult!6643)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!630143 (= res!407255 (and (= lt!291047 (Found!6643 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18247 a!2986) index!984) (select (arr!18247 a!2986) j!136))) (not (= (select (arr!18247 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38028 (_ BitVec 32)) SeekEntryResult!6643)

(assert (=> b!630143 (= lt!291047 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18247 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!630144 () Bool)

(declare-fun res!407257 () Bool)

(assert (=> b!630144 (=> (not res!407257) (not e!360366))))

(declare-fun arrayContainsKey!0 (array!38028 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!630144 (= res!407257 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!630145 () Bool)

(declare-fun res!407256 () Bool)

(assert (=> b!630145 (=> (not res!407256) (not e!360363))))

(declare-datatypes ((List!12195 0))(
  ( (Nil!12192) (Cons!12191 (h!13239 (_ BitVec 64)) (t!18415 List!12195)) )
))
(declare-fun arrayNoDuplicates!0 (array!38028 (_ BitVec 32) List!12195) Bool)

(assert (=> b!630145 (= res!407256 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12192))))

(declare-fun b!630146 () Bool)

(assert (=> b!630146 (= e!360362 (not true))))

(declare-fun e!360365 () Bool)

(assert (=> b!630146 e!360365))

(declare-fun res!407253 () Bool)

(assert (=> b!630146 (=> (not res!407253) (not e!360365))))

(declare-fun lt!291049 () (_ BitVec 32))

(declare-fun lt!291048 () SeekEntryResult!6643)

(assert (=> b!630146 (= res!407253 (= lt!291048 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291049 vacantSpotIndex!68 (select (store (arr!18247 a!2986) i!1108 k0!1786) j!136) (array!38029 (store (arr!18247 a!2986) i!1108 k0!1786) (size!18611 a!2986)) mask!3053)))))

(assert (=> b!630146 (= lt!291048 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291049 vacantSpotIndex!68 (select (arr!18247 a!2986) j!136) a!2986 mask!3053))))

(declare-datatypes ((Unit!21105 0))(
  ( (Unit!21106) )
))
(declare-fun lt!291046 () Unit!21105)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38028 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21105)

(assert (=> b!630146 (= lt!291046 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291049 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!630146 (= lt!291049 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!630147 () Bool)

(declare-fun res!407254 () Bool)

(assert (=> b!630147 (=> (not res!407254) (not e!360366))))

(assert (=> b!630147 (= res!407254 (validKeyInArray!0 (select (arr!18247 a!2986) j!136)))))

(declare-fun b!630148 () Bool)

(declare-fun res!407259 () Bool)

(assert (=> b!630148 (=> (not res!407259) (not e!360363))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38028 (_ BitVec 32)) Bool)

(assert (=> b!630148 (= res!407259 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!630149 () Bool)

(assert (=> b!630149 (= e!360365 (= lt!291047 lt!291048))))

(declare-fun b!630150 () Bool)

(declare-fun res!407250 () Bool)

(assert (=> b!630150 (=> (not res!407250) (not e!360366))))

(assert (=> b!630150 (= res!407250 (and (= (size!18611 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18611 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18611 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!630151 () Bool)

(declare-fun res!407258 () Bool)

(assert (=> b!630151 (=> (not res!407258) (not e!360363))))

(assert (=> b!630151 (= res!407258 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18247 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18247 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!56952 res!407252) b!630150))

(assert (= (and b!630150 res!407250) b!630147))

(assert (= (and b!630147 res!407254) b!630141))

(assert (= (and b!630141 res!407260) b!630144))

(assert (= (and b!630144 res!407257) b!630142))

(assert (= (and b!630142 res!407251) b!630148))

(assert (= (and b!630148 res!407259) b!630145))

(assert (= (and b!630145 res!407256) b!630151))

(assert (= (and b!630151 res!407258) b!630143))

(assert (= (and b!630143 res!407255) b!630146))

(assert (= (and b!630146 res!407253) b!630149))

(declare-fun m!605419 () Bool)

(assert (=> b!630148 m!605419))

(declare-fun m!605421 () Bool)

(assert (=> b!630147 m!605421))

(assert (=> b!630147 m!605421))

(declare-fun m!605423 () Bool)

(assert (=> b!630147 m!605423))

(declare-fun m!605425 () Bool)

(assert (=> b!630141 m!605425))

(declare-fun m!605427 () Bool)

(assert (=> b!630143 m!605427))

(assert (=> b!630143 m!605421))

(assert (=> b!630143 m!605421))

(declare-fun m!605429 () Bool)

(assert (=> b!630143 m!605429))

(declare-fun m!605431 () Bool)

(assert (=> b!630146 m!605431))

(declare-fun m!605433 () Bool)

(assert (=> b!630146 m!605433))

(assert (=> b!630146 m!605433))

(declare-fun m!605435 () Bool)

(assert (=> b!630146 m!605435))

(declare-fun m!605437 () Bool)

(assert (=> b!630146 m!605437))

(assert (=> b!630146 m!605421))

(declare-fun m!605439 () Bool)

(assert (=> b!630146 m!605439))

(assert (=> b!630146 m!605421))

(declare-fun m!605441 () Bool)

(assert (=> b!630146 m!605441))

(declare-fun m!605443 () Bool)

(assert (=> b!630144 m!605443))

(declare-fun m!605445 () Bool)

(assert (=> b!630142 m!605445))

(declare-fun m!605447 () Bool)

(assert (=> b!630145 m!605447))

(declare-fun m!605449 () Bool)

(assert (=> start!56952 m!605449))

(declare-fun m!605451 () Bool)

(assert (=> start!56952 m!605451))

(declare-fun m!605453 () Bool)

(assert (=> b!630151 m!605453))

(assert (=> b!630151 m!605439))

(declare-fun m!605455 () Bool)

(assert (=> b!630151 m!605455))

(check-sat (not b!630148) (not b!630141) (not b!630142) (not b!630144) (not start!56952) (not b!630145) (not b!630143) (not b!630146) (not b!630147))
(check-sat)
