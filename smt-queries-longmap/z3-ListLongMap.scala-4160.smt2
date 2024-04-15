; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56634 () Bool)

(assert start!56634)

(declare-fun b!627573 () Bool)

(declare-fun res!405421 () Bool)

(declare-fun e!359191 () Bool)

(assert (=> b!627573 (=> (not res!405421) (not e!359191))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37938 0))(
  ( (array!37939 (arr!18209 (Array (_ BitVec 32) (_ BitVec 64))) (size!18574 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37938)

(declare-datatypes ((SeekEntryResult!6646 0))(
  ( (MissingZero!6646 (index!28868 (_ BitVec 32))) (Found!6646 (index!28869 (_ BitVec 32))) (Intermediate!6646 (undefined!7458 Bool) (index!28870 (_ BitVec 32)) (x!57613 (_ BitVec 32))) (Undefined!6646) (MissingVacant!6646 (index!28871 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37938 (_ BitVec 32)) SeekEntryResult!6646)

(assert (=> b!627573 (= res!405421 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18209 a!2986) j!136) a!2986 mask!3053) (Found!6646 j!136)))))

(declare-fun b!627574 () Bool)

(declare-fun res!405423 () Bool)

(declare-fun e!359192 () Bool)

(assert (=> b!627574 (=> (not res!405423) (not e!359192))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!627574 (= res!405423 (validKeyInArray!0 (select (arr!18209 a!2986) j!136)))))

(declare-fun res!405416 () Bool)

(assert (=> start!56634 (=> (not res!405416) (not e!359192))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56634 (= res!405416 (validMask!0 mask!3053))))

(assert (=> start!56634 e!359192))

(assert (=> start!56634 true))

(declare-fun array_inv!14092 (array!37938) Bool)

(assert (=> start!56634 (array_inv!14092 a!2986)))

(declare-fun b!627575 () Bool)

(declare-fun res!405417 () Bool)

(assert (=> b!627575 (=> (not res!405417) (not e!359191))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37938 (_ BitVec 32)) Bool)

(assert (=> b!627575 (= res!405417 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!627576 () Bool)

(assert (=> b!627576 (= e!359191 false)))

(declare-fun lt!290118 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!627576 (= lt!290118 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!627577 () Bool)

(declare-fun res!405424 () Bool)

(assert (=> b!627577 (=> (not res!405424) (not e!359192))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37938 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!627577 (= res!405424 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!627578 () Bool)

(assert (=> b!627578 (= e!359192 e!359191)))

(declare-fun res!405418 () Bool)

(assert (=> b!627578 (=> (not res!405418) (not e!359191))))

(declare-fun lt!290119 () SeekEntryResult!6646)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!627578 (= res!405418 (or (= lt!290119 (MissingZero!6646 i!1108)) (= lt!290119 (MissingVacant!6646 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37938 (_ BitVec 32)) SeekEntryResult!6646)

(assert (=> b!627578 (= lt!290119 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!627579 () Bool)

(declare-fun res!405420 () Bool)

(assert (=> b!627579 (=> (not res!405420) (not e!359191))))

(declare-datatypes ((List!12289 0))(
  ( (Nil!12286) (Cons!12285 (h!13330 (_ BitVec 64)) (t!18508 List!12289)) )
))
(declare-fun arrayNoDuplicates!0 (array!37938 (_ BitVec 32) List!12289) Bool)

(assert (=> b!627579 (= res!405420 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12286))))

(declare-fun b!627580 () Bool)

(declare-fun res!405422 () Bool)

(assert (=> b!627580 (=> (not res!405422) (not e!359192))))

(assert (=> b!627580 (= res!405422 (and (= (size!18574 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18574 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18574 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!627581 () Bool)

(declare-fun res!405419 () Bool)

(assert (=> b!627581 (=> (not res!405419) (not e!359191))))

(assert (=> b!627581 (= res!405419 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18209 a!2986) index!984) (select (arr!18209 a!2986) j!136))) (not (= (select (arr!18209 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!627582 () Bool)

(declare-fun res!405415 () Bool)

(assert (=> b!627582 (=> (not res!405415) (not e!359192))))

(assert (=> b!627582 (= res!405415 (validKeyInArray!0 k0!1786))))

(declare-fun b!627583 () Bool)

(declare-fun res!405425 () Bool)

(assert (=> b!627583 (=> (not res!405425) (not e!359191))))

(assert (=> b!627583 (= res!405425 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18209 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18209 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!56634 res!405416) b!627580))

(assert (= (and b!627580 res!405422) b!627574))

(assert (= (and b!627574 res!405423) b!627582))

(assert (= (and b!627582 res!405415) b!627577))

(assert (= (and b!627577 res!405424) b!627578))

(assert (= (and b!627578 res!405418) b!627575))

(assert (= (and b!627575 res!405417) b!627579))

(assert (= (and b!627579 res!405420) b!627583))

(assert (= (and b!627583 res!405425) b!627573))

(assert (= (and b!627573 res!405421) b!627581))

(assert (= (and b!627581 res!405419) b!627576))

(declare-fun m!602353 () Bool)

(assert (=> b!627578 m!602353))

(declare-fun m!602355 () Bool)

(assert (=> b!627576 m!602355))

(declare-fun m!602357 () Bool)

(assert (=> b!627574 m!602357))

(assert (=> b!627574 m!602357))

(declare-fun m!602359 () Bool)

(assert (=> b!627574 m!602359))

(declare-fun m!602361 () Bool)

(assert (=> b!627575 m!602361))

(declare-fun m!602363 () Bool)

(assert (=> start!56634 m!602363))

(declare-fun m!602365 () Bool)

(assert (=> start!56634 m!602365))

(declare-fun m!602367 () Bool)

(assert (=> b!627583 m!602367))

(declare-fun m!602369 () Bool)

(assert (=> b!627583 m!602369))

(declare-fun m!602371 () Bool)

(assert (=> b!627583 m!602371))

(declare-fun m!602373 () Bool)

(assert (=> b!627582 m!602373))

(assert (=> b!627573 m!602357))

(assert (=> b!627573 m!602357))

(declare-fun m!602375 () Bool)

(assert (=> b!627573 m!602375))

(declare-fun m!602377 () Bool)

(assert (=> b!627581 m!602377))

(assert (=> b!627581 m!602357))

(declare-fun m!602379 () Bool)

(assert (=> b!627577 m!602379))

(declare-fun m!602381 () Bool)

(assert (=> b!627579 m!602381))

(check-sat (not b!627578) (not start!56634) (not b!627576) (not b!627579) (not b!627582) (not b!627574) (not b!627573) (not b!627577) (not b!627575))
(check-sat)
