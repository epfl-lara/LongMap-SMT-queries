; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53562 () Bool)

(assert start!53562)

(declare-fun b!582663 () Bool)

(declare-fun e!334124 () Bool)

(declare-fun e!334123 () Bool)

(assert (=> b!582663 (= e!334124 e!334123)))

(declare-fun res!370378 () Bool)

(assert (=> b!582663 (=> (not res!370378) (not e!334123))))

(declare-datatypes ((SeekEntryResult!5872 0))(
  ( (MissingZero!5872 (index!25715 (_ BitVec 32))) (Found!5872 (index!25716 (_ BitVec 32))) (Intermediate!5872 (undefined!6684 Bool) (index!25717 (_ BitVec 32)) (x!54720 (_ BitVec 32))) (Undefined!5872) (MissingVacant!5872 (index!25718 (_ BitVec 32))) )
))
(declare-fun lt!265231 () SeekEntryResult!5872)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!582663 (= res!370378 (or (= lt!265231 (MissingZero!5872 i!1108)) (= lt!265231 (MissingVacant!5872 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!36408 0))(
  ( (array!36409 (arr!17476 (Array (_ BitVec 32) (_ BitVec 64))) (size!17840 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36408)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36408 (_ BitVec 32)) SeekEntryResult!5872)

(assert (=> b!582663 (= lt!265231 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!582664 () Bool)

(declare-fun res!370379 () Bool)

(assert (=> b!582664 (=> (not res!370379) (not e!334124))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!582664 (= res!370379 (validKeyInArray!0 (select (arr!17476 a!2986) j!136)))))

(declare-fun b!582665 () Bool)

(assert (=> b!582665 (= e!334123 false)))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!265230 () SeekEntryResult!5872)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36408 (_ BitVec 32)) SeekEntryResult!5872)

(assert (=> b!582665 (= lt!265230 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17476 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!582666 () Bool)

(declare-fun res!370374 () Bool)

(assert (=> b!582666 (=> (not res!370374) (not e!334123))))

(declare-datatypes ((List!11424 0))(
  ( (Nil!11421) (Cons!11420 (h!12468 (_ BitVec 64)) (t!17644 List!11424)) )
))
(declare-fun arrayNoDuplicates!0 (array!36408 (_ BitVec 32) List!11424) Bool)

(assert (=> b!582666 (= res!370374 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11421))))

(declare-fun b!582667 () Bool)

(declare-fun res!370380 () Bool)

(assert (=> b!582667 (=> (not res!370380) (not e!334124))))

(assert (=> b!582667 (= res!370380 (validKeyInArray!0 k0!1786))))

(declare-fun res!370377 () Bool)

(assert (=> start!53562 (=> (not res!370377) (not e!334124))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53562 (= res!370377 (validMask!0 mask!3053))))

(assert (=> start!53562 e!334124))

(assert (=> start!53562 true))

(declare-fun array_inv!13335 (array!36408) Bool)

(assert (=> start!53562 (array_inv!13335 a!2986)))

(declare-fun b!582662 () Bool)

(declare-fun res!370376 () Bool)

(assert (=> b!582662 (=> (not res!370376) (not e!334123))))

(assert (=> b!582662 (= res!370376 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17476 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17476 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!582668 () Bool)

(declare-fun res!370373 () Bool)

(assert (=> b!582668 (=> (not res!370373) (not e!334124))))

(declare-fun arrayContainsKey!0 (array!36408 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!582668 (= res!370373 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!582669 () Bool)

(declare-fun res!370381 () Bool)

(assert (=> b!582669 (=> (not res!370381) (not e!334123))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36408 (_ BitVec 32)) Bool)

(assert (=> b!582669 (= res!370381 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!582670 () Bool)

(declare-fun res!370375 () Bool)

(assert (=> b!582670 (=> (not res!370375) (not e!334124))))

(assert (=> b!582670 (= res!370375 (and (= (size!17840 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17840 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17840 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53562 res!370377) b!582670))

(assert (= (and b!582670 res!370375) b!582664))

(assert (= (and b!582664 res!370379) b!582667))

(assert (= (and b!582667 res!370380) b!582668))

(assert (= (and b!582668 res!370373) b!582663))

(assert (= (and b!582663 res!370378) b!582669))

(assert (= (and b!582669 res!370381) b!582666))

(assert (= (and b!582666 res!370374) b!582662))

(assert (= (and b!582662 res!370376) b!582665))

(declare-fun m!561317 () Bool)

(assert (=> b!582665 m!561317))

(assert (=> b!582665 m!561317))

(declare-fun m!561319 () Bool)

(assert (=> b!582665 m!561319))

(declare-fun m!561321 () Bool)

(assert (=> b!582667 m!561321))

(declare-fun m!561323 () Bool)

(assert (=> b!582669 m!561323))

(declare-fun m!561325 () Bool)

(assert (=> b!582668 m!561325))

(declare-fun m!561327 () Bool)

(assert (=> b!582666 m!561327))

(declare-fun m!561329 () Bool)

(assert (=> b!582662 m!561329))

(declare-fun m!561331 () Bool)

(assert (=> b!582662 m!561331))

(declare-fun m!561333 () Bool)

(assert (=> b!582662 m!561333))

(declare-fun m!561335 () Bool)

(assert (=> b!582663 m!561335))

(declare-fun m!561337 () Bool)

(assert (=> start!53562 m!561337))

(declare-fun m!561339 () Bool)

(assert (=> start!53562 m!561339))

(assert (=> b!582664 m!561317))

(assert (=> b!582664 m!561317))

(declare-fun m!561341 () Bool)

(assert (=> b!582664 m!561341))

(check-sat (not b!582663) (not b!582669) (not b!582668) (not start!53562) (not b!582664) (not b!582667) (not b!582665) (not b!582666))
(check-sat)
