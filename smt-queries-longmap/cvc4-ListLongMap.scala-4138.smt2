; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56426 () Bool)

(assert start!56426)

(declare-fun b!625491 () Bool)

(declare-fun e!358501 () Bool)

(assert (=> b!625491 (= e!358501 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6586 0))(
  ( (MissingZero!6586 (index!28628 (_ BitVec 32))) (Found!6586 (index!28629 (_ BitVec 32))) (Intermediate!6586 (undefined!7398 Bool) (index!28630 (_ BitVec 32)) (x!57376 (_ BitVec 32))) (Undefined!6586) (MissingVacant!6586 (index!28631 (_ BitVec 32))) )
))
(declare-fun lt!289837 () SeekEntryResult!6586)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37806 0))(
  ( (array!37807 (arr!18146 (Array (_ BitVec 32) (_ BitVec 64))) (size!18510 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37806)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37806 (_ BitVec 32)) SeekEntryResult!6586)

(assert (=> b!625491 (= lt!289837 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18146 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!625492 () Bool)

(declare-fun res!403497 () Bool)

(declare-fun e!358503 () Bool)

(assert (=> b!625492 (=> (not res!403497) (not e!358503))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37806 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!625492 (= res!403497 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!403502 () Bool)

(assert (=> start!56426 (=> (not res!403502) (not e!358503))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56426 (= res!403502 (validMask!0 mask!3053))))

(assert (=> start!56426 e!358503))

(assert (=> start!56426 true))

(declare-fun array_inv!13942 (array!37806) Bool)

(assert (=> start!56426 (array_inv!13942 a!2986)))

(declare-fun b!625493 () Bool)

(declare-fun res!403500 () Bool)

(assert (=> b!625493 (=> (not res!403500) (not e!358503))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!625493 (= res!403500 (validKeyInArray!0 (select (arr!18146 a!2986) j!136)))))

(declare-fun b!625494 () Bool)

(declare-fun res!403498 () Bool)

(assert (=> b!625494 (=> (not res!403498) (not e!358501))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37806 (_ BitVec 32)) Bool)

(assert (=> b!625494 (= res!403498 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!625495 () Bool)

(declare-fun res!403504 () Bool)

(assert (=> b!625495 (=> (not res!403504) (not e!358503))))

(assert (=> b!625495 (= res!403504 (validKeyInArray!0 k!1786))))

(declare-fun b!625496 () Bool)

(declare-fun res!403505 () Bool)

(assert (=> b!625496 (=> (not res!403505) (not e!358501))))

(declare-datatypes ((List!12187 0))(
  ( (Nil!12184) (Cons!12183 (h!13228 (_ BitVec 64)) (t!18415 List!12187)) )
))
(declare-fun arrayNoDuplicates!0 (array!37806 (_ BitVec 32) List!12187) Bool)

(assert (=> b!625496 (= res!403505 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12184))))

(declare-fun b!625497 () Bool)

(declare-fun res!403499 () Bool)

(assert (=> b!625497 (=> (not res!403499) (not e!358503))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!625497 (= res!403499 (and (= (size!18510 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18510 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18510 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!625498 () Bool)

(declare-fun res!403501 () Bool)

(assert (=> b!625498 (=> (not res!403501) (not e!358501))))

(assert (=> b!625498 (= res!403501 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18146 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18146 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!625499 () Bool)

(assert (=> b!625499 (= e!358503 e!358501)))

(declare-fun res!403503 () Bool)

(assert (=> b!625499 (=> (not res!403503) (not e!358501))))

(declare-fun lt!289836 () SeekEntryResult!6586)

(assert (=> b!625499 (= res!403503 (or (= lt!289836 (MissingZero!6586 i!1108)) (= lt!289836 (MissingVacant!6586 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37806 (_ BitVec 32)) SeekEntryResult!6586)

(assert (=> b!625499 (= lt!289836 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(assert (= (and start!56426 res!403502) b!625497))

(assert (= (and b!625497 res!403499) b!625493))

(assert (= (and b!625493 res!403500) b!625495))

(assert (= (and b!625495 res!403504) b!625492))

(assert (= (and b!625492 res!403497) b!625499))

(assert (= (and b!625499 res!403503) b!625494))

(assert (= (and b!625494 res!403498) b!625496))

(assert (= (and b!625496 res!403505) b!625498))

(assert (= (and b!625498 res!403501) b!625491))

(declare-fun m!601059 () Bool)

(assert (=> start!56426 m!601059))

(declare-fun m!601061 () Bool)

(assert (=> start!56426 m!601061))

(declare-fun m!601063 () Bool)

(assert (=> b!625493 m!601063))

(assert (=> b!625493 m!601063))

(declare-fun m!601065 () Bool)

(assert (=> b!625493 m!601065))

(declare-fun m!601067 () Bool)

(assert (=> b!625499 m!601067))

(declare-fun m!601069 () Bool)

(assert (=> b!625492 m!601069))

(declare-fun m!601071 () Bool)

(assert (=> b!625496 m!601071))

(assert (=> b!625491 m!601063))

(assert (=> b!625491 m!601063))

(declare-fun m!601073 () Bool)

(assert (=> b!625491 m!601073))

(declare-fun m!601075 () Bool)

(assert (=> b!625498 m!601075))

(declare-fun m!601077 () Bool)

(assert (=> b!625498 m!601077))

(declare-fun m!601079 () Bool)

(assert (=> b!625498 m!601079))

(declare-fun m!601081 () Bool)

(assert (=> b!625494 m!601081))

(declare-fun m!601083 () Bool)

(assert (=> b!625495 m!601083))

(push 1)

(assert (not b!625494))

(assert (not b!625499))

(assert (not b!625495))

(assert (not b!625491))

(assert (not b!625492))

(assert (not b!625493))

(assert (not b!625496))

