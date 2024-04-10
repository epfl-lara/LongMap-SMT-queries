; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53364 () Bool)

(assert start!53364)

(declare-fun b!580428 () Bool)

(declare-fun e!333330 () Bool)

(declare-fun e!333329 () Bool)

(assert (=> b!580428 (= e!333330 e!333329)))

(declare-fun res!368247 () Bool)

(assert (=> b!580428 (=> (not res!368247) (not e!333329))))

(declare-datatypes ((SeekEntryResult!5847 0))(
  ( (MissingZero!5847 (index!25615 (_ BitVec 32))) (Found!5847 (index!25616 (_ BitVec 32))) (Intermediate!5847 (undefined!6659 Bool) (index!25617 (_ BitVec 32)) (x!54492 (_ BitVec 32))) (Undefined!5847) (MissingVacant!5847 (index!25618 (_ BitVec 32))) )
))
(declare-fun lt!264702 () SeekEntryResult!5847)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!580428 (= res!368247 (or (= lt!264702 (MissingZero!5847 i!1108)) (= lt!264702 (MissingVacant!5847 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((array!36265 0))(
  ( (array!36266 (arr!17407 (Array (_ BitVec 32) (_ BitVec 64))) (size!17771 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36265)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36265 (_ BitVec 32)) SeekEntryResult!5847)

(assert (=> b!580428 (= lt!264702 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!580429 () Bool)

(declare-fun res!368248 () Bool)

(assert (=> b!580429 (=> (not res!368248) (not e!333330))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!580429 (= res!368248 (validKeyInArray!0 k0!1786))))

(declare-fun b!580430 () Bool)

(assert (=> b!580430 (= e!333329 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!264703 () SeekEntryResult!5847)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36265 (_ BitVec 32)) SeekEntryResult!5847)

(assert (=> b!580430 (= lt!264703 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17407 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!580431 () Bool)

(declare-fun res!368251 () Bool)

(assert (=> b!580431 (=> (not res!368251) (not e!333329))))

(assert (=> b!580431 (= res!368251 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17407 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17407 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!580432 () Bool)

(declare-fun res!368245 () Bool)

(assert (=> b!580432 (=> (not res!368245) (not e!333329))))

(declare-datatypes ((List!11448 0))(
  ( (Nil!11445) (Cons!11444 (h!12489 (_ BitVec 64)) (t!17676 List!11448)) )
))
(declare-fun arrayNoDuplicates!0 (array!36265 (_ BitVec 32) List!11448) Bool)

(assert (=> b!580432 (= res!368245 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11445))))

(declare-fun b!580433 () Bool)

(declare-fun res!368246 () Bool)

(assert (=> b!580433 (=> (not res!368246) (not e!333330))))

(declare-fun arrayContainsKey!0 (array!36265 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!580433 (= res!368246 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!580434 () Bool)

(declare-fun res!368252 () Bool)

(assert (=> b!580434 (=> (not res!368252) (not e!333330))))

(assert (=> b!580434 (= res!368252 (and (= (size!17771 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17771 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17771 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!580435 () Bool)

(declare-fun res!368244 () Bool)

(assert (=> b!580435 (=> (not res!368244) (not e!333330))))

(assert (=> b!580435 (= res!368244 (validKeyInArray!0 (select (arr!17407 a!2986) j!136)))))

(declare-fun res!368250 () Bool)

(assert (=> start!53364 (=> (not res!368250) (not e!333330))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53364 (= res!368250 (validMask!0 mask!3053))))

(assert (=> start!53364 e!333330))

(assert (=> start!53364 true))

(declare-fun array_inv!13203 (array!36265) Bool)

(assert (=> start!53364 (array_inv!13203 a!2986)))

(declare-fun b!580436 () Bool)

(declare-fun res!368249 () Bool)

(assert (=> b!580436 (=> (not res!368249) (not e!333329))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36265 (_ BitVec 32)) Bool)

(assert (=> b!580436 (= res!368249 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!53364 res!368250) b!580434))

(assert (= (and b!580434 res!368252) b!580435))

(assert (= (and b!580435 res!368244) b!580429))

(assert (= (and b!580429 res!368248) b!580433))

(assert (= (and b!580433 res!368246) b!580428))

(assert (= (and b!580428 res!368247) b!580436))

(assert (= (and b!580436 res!368249) b!580432))

(assert (= (and b!580432 res!368245) b!580431))

(assert (= (and b!580431 res!368251) b!580430))

(declare-fun m!559011 () Bool)

(assert (=> b!580432 m!559011))

(declare-fun m!559013 () Bool)

(assert (=> b!580430 m!559013))

(assert (=> b!580430 m!559013))

(declare-fun m!559015 () Bool)

(assert (=> b!580430 m!559015))

(declare-fun m!559017 () Bool)

(assert (=> b!580429 m!559017))

(assert (=> b!580435 m!559013))

(assert (=> b!580435 m!559013))

(declare-fun m!559019 () Bool)

(assert (=> b!580435 m!559019))

(declare-fun m!559021 () Bool)

(assert (=> b!580431 m!559021))

(declare-fun m!559023 () Bool)

(assert (=> b!580431 m!559023))

(declare-fun m!559025 () Bool)

(assert (=> b!580431 m!559025))

(declare-fun m!559027 () Bool)

(assert (=> b!580436 m!559027))

(declare-fun m!559029 () Bool)

(assert (=> b!580433 m!559029))

(declare-fun m!559031 () Bool)

(assert (=> start!53364 m!559031))

(declare-fun m!559033 () Bool)

(assert (=> start!53364 m!559033))

(declare-fun m!559035 () Bool)

(assert (=> b!580428 m!559035))

(check-sat (not b!580433) (not b!580429) (not b!580430) (not b!580436) (not start!53364) (not b!580435) (not b!580432) (not b!580428))
(check-sat)
