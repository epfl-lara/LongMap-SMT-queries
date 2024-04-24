; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53628 () Bool)

(assert start!53628)

(declare-fun b!583562 () Bool)

(declare-fun res!371273 () Bool)

(declare-fun e!334422 () Bool)

(assert (=> b!583562 (=> (not res!371273) (not e!334422))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36474 0))(
  ( (array!36475 (arr!17509 (Array (_ BitVec 32) (_ BitVec 64))) (size!17873 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36474)

(assert (=> b!583562 (= res!371273 (and (= (size!17873 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17873 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17873 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!583563 () Bool)

(declare-fun res!371275 () Bool)

(declare-fun e!334421 () Bool)

(assert (=> b!583563 (=> (not res!371275) (not e!334421))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36474 (_ BitVec 32)) Bool)

(assert (=> b!583563 (= res!371275 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!583564 () Bool)

(assert (=> b!583564 (= e!334422 e!334421)))

(declare-fun res!371277 () Bool)

(assert (=> b!583564 (=> (not res!371277) (not e!334421))))

(declare-datatypes ((SeekEntryResult!5905 0))(
  ( (MissingZero!5905 (index!25847 (_ BitVec 32))) (Found!5905 (index!25848 (_ BitVec 32))) (Intermediate!5905 (undefined!6717 Bool) (index!25849 (_ BitVec 32)) (x!54841 (_ BitVec 32))) (Undefined!5905) (MissingVacant!5905 (index!25850 (_ BitVec 32))) )
))
(declare-fun lt!265420 () SeekEntryResult!5905)

(assert (=> b!583564 (= res!371277 (or (= lt!265420 (MissingZero!5905 i!1108)) (= lt!265420 (MissingVacant!5905 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36474 (_ BitVec 32)) SeekEntryResult!5905)

(assert (=> b!583564 (= lt!265420 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!371280 () Bool)

(assert (=> start!53628 (=> (not res!371280) (not e!334422))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53628 (= res!371280 (validMask!0 mask!3053))))

(assert (=> start!53628 e!334422))

(assert (=> start!53628 true))

(declare-fun array_inv!13368 (array!36474) Bool)

(assert (=> start!53628 (array_inv!13368 a!2986)))

(declare-fun b!583565 () Bool)

(assert (=> b!583565 (= e!334421 false)))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!265419 () SeekEntryResult!5905)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36474 (_ BitVec 32)) SeekEntryResult!5905)

(assert (=> b!583565 (= lt!265419 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17509 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!583566 () Bool)

(declare-fun res!371274 () Bool)

(assert (=> b!583566 (=> (not res!371274) (not e!334422))))

(declare-fun arrayContainsKey!0 (array!36474 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!583566 (= res!371274 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!583567 () Bool)

(declare-fun res!371281 () Bool)

(assert (=> b!583567 (=> (not res!371281) (not e!334422))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!583567 (= res!371281 (validKeyInArray!0 (select (arr!17509 a!2986) j!136)))))

(declare-fun b!583568 () Bool)

(declare-fun res!371276 () Bool)

(assert (=> b!583568 (=> (not res!371276) (not e!334421))))

(assert (=> b!583568 (= res!371276 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17509 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17509 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!583569 () Bool)

(declare-fun res!371279 () Bool)

(assert (=> b!583569 (=> (not res!371279) (not e!334422))))

(assert (=> b!583569 (= res!371279 (validKeyInArray!0 k0!1786))))

(declare-fun b!583570 () Bool)

(declare-fun res!371278 () Bool)

(assert (=> b!583570 (=> (not res!371278) (not e!334421))))

(declare-datatypes ((List!11457 0))(
  ( (Nil!11454) (Cons!11453 (h!12501 (_ BitVec 64)) (t!17677 List!11457)) )
))
(declare-fun arrayNoDuplicates!0 (array!36474 (_ BitVec 32) List!11457) Bool)

(assert (=> b!583570 (= res!371278 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11454))))

(assert (= (and start!53628 res!371280) b!583562))

(assert (= (and b!583562 res!371273) b!583567))

(assert (= (and b!583567 res!371281) b!583569))

(assert (= (and b!583569 res!371279) b!583566))

(assert (= (and b!583566 res!371274) b!583564))

(assert (= (and b!583564 res!371277) b!583563))

(assert (= (and b!583563 res!371275) b!583570))

(assert (= (and b!583570 res!371278) b!583568))

(assert (= (and b!583568 res!371276) b!583565))

(declare-fun m!562181 () Bool)

(assert (=> b!583568 m!562181))

(declare-fun m!562183 () Bool)

(assert (=> b!583568 m!562183))

(declare-fun m!562185 () Bool)

(assert (=> b!583568 m!562185))

(declare-fun m!562187 () Bool)

(assert (=> b!583569 m!562187))

(declare-fun m!562189 () Bool)

(assert (=> b!583564 m!562189))

(declare-fun m!562191 () Bool)

(assert (=> start!53628 m!562191))

(declare-fun m!562193 () Bool)

(assert (=> start!53628 m!562193))

(declare-fun m!562195 () Bool)

(assert (=> b!583566 m!562195))

(declare-fun m!562197 () Bool)

(assert (=> b!583567 m!562197))

(assert (=> b!583567 m!562197))

(declare-fun m!562199 () Bool)

(assert (=> b!583567 m!562199))

(declare-fun m!562201 () Bool)

(assert (=> b!583570 m!562201))

(declare-fun m!562203 () Bool)

(assert (=> b!583563 m!562203))

(assert (=> b!583565 m!562197))

(assert (=> b!583565 m!562197))

(declare-fun m!562205 () Bool)

(assert (=> b!583565 m!562205))

(check-sat (not b!583566) (not b!583570) (not start!53628) (not b!583569) (not b!583563) (not b!583567) (not b!583564) (not b!583565))
(check-sat)
