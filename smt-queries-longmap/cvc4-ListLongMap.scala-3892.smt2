; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53366 () Bool)

(assert start!53366)

(declare-fun b!580455 () Bool)

(declare-fun res!368271 () Bool)

(declare-fun e!333337 () Bool)

(assert (=> b!580455 (=> (not res!368271) (not e!333337))))

(declare-datatypes ((array!36267 0))(
  ( (array!36268 (arr!17408 (Array (_ BitVec 32) (_ BitVec 64))) (size!17772 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36267)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!580455 (= res!368271 (validKeyInArray!0 (select (arr!17408 a!2986) j!136)))))

(declare-fun b!580456 () Bool)

(declare-fun res!368279 () Bool)

(assert (=> b!580456 (=> (not res!368279) (not e!333337))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!580456 (= res!368279 (validKeyInArray!0 k!1786))))

(declare-fun b!580457 () Bool)

(declare-fun res!368272 () Bool)

(declare-fun e!333339 () Bool)

(assert (=> b!580457 (=> (not res!368272) (not e!333339))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36267 (_ BitVec 32)) Bool)

(assert (=> b!580457 (= res!368272 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!580458 () Bool)

(declare-fun res!368274 () Bool)

(assert (=> b!580458 (=> (not res!368274) (not e!333339))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!580458 (= res!368274 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17408 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17408 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!580459 () Bool)

(assert (=> b!580459 (= e!333337 e!333339)))

(declare-fun res!368273 () Bool)

(assert (=> b!580459 (=> (not res!368273) (not e!333339))))

(declare-datatypes ((SeekEntryResult!5848 0))(
  ( (MissingZero!5848 (index!25619 (_ BitVec 32))) (Found!5848 (index!25620 (_ BitVec 32))) (Intermediate!5848 (undefined!6660 Bool) (index!25621 (_ BitVec 32)) (x!54493 (_ BitVec 32))) (Undefined!5848) (MissingVacant!5848 (index!25622 (_ BitVec 32))) )
))
(declare-fun lt!264709 () SeekEntryResult!5848)

(assert (=> b!580459 (= res!368273 (or (= lt!264709 (MissingZero!5848 i!1108)) (= lt!264709 (MissingVacant!5848 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36267 (_ BitVec 32)) SeekEntryResult!5848)

(assert (=> b!580459 (= lt!264709 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!580460 () Bool)

(declare-fun res!368277 () Bool)

(assert (=> b!580460 (=> (not res!368277) (not e!333337))))

(assert (=> b!580460 (= res!368277 (and (= (size!17772 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17772 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17772 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!368276 () Bool)

(assert (=> start!53366 (=> (not res!368276) (not e!333337))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53366 (= res!368276 (validMask!0 mask!3053))))

(assert (=> start!53366 e!333337))

(assert (=> start!53366 true))

(declare-fun array_inv!13204 (array!36267) Bool)

(assert (=> start!53366 (array_inv!13204 a!2986)))

(declare-fun b!580461 () Bool)

(declare-fun res!368278 () Bool)

(assert (=> b!580461 (=> (not res!368278) (not e!333339))))

(declare-datatypes ((List!11449 0))(
  ( (Nil!11446) (Cons!11445 (h!12490 (_ BitVec 64)) (t!17677 List!11449)) )
))
(declare-fun arrayNoDuplicates!0 (array!36267 (_ BitVec 32) List!11449) Bool)

(assert (=> b!580461 (= res!368278 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11446))))

(declare-fun b!580462 () Bool)

(declare-fun res!368275 () Bool)

(assert (=> b!580462 (=> (not res!368275) (not e!333337))))

(declare-fun arrayContainsKey!0 (array!36267 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!580462 (= res!368275 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!580463 () Bool)

(assert (=> b!580463 (= e!333339 false)))

(declare-fun lt!264708 () SeekEntryResult!5848)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36267 (_ BitVec 32)) SeekEntryResult!5848)

(assert (=> b!580463 (= lt!264708 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17408 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!53366 res!368276) b!580460))

(assert (= (and b!580460 res!368277) b!580455))

(assert (= (and b!580455 res!368271) b!580456))

(assert (= (and b!580456 res!368279) b!580462))

(assert (= (and b!580462 res!368275) b!580459))

(assert (= (and b!580459 res!368273) b!580457))

(assert (= (and b!580457 res!368272) b!580461))

(assert (= (and b!580461 res!368278) b!580458))

(assert (= (and b!580458 res!368274) b!580463))

(declare-fun m!559037 () Bool)

(assert (=> b!580457 m!559037))

(declare-fun m!559039 () Bool)

(assert (=> b!580456 m!559039))

(declare-fun m!559041 () Bool)

(assert (=> b!580458 m!559041))

(declare-fun m!559043 () Bool)

(assert (=> b!580458 m!559043))

(declare-fun m!559045 () Bool)

(assert (=> b!580458 m!559045))

(declare-fun m!559047 () Bool)

(assert (=> b!580455 m!559047))

(assert (=> b!580455 m!559047))

(declare-fun m!559049 () Bool)

(assert (=> b!580455 m!559049))

(declare-fun m!559051 () Bool)

(assert (=> start!53366 m!559051))

(declare-fun m!559053 () Bool)

(assert (=> start!53366 m!559053))

(declare-fun m!559055 () Bool)

(assert (=> b!580459 m!559055))

(declare-fun m!559057 () Bool)

(assert (=> b!580462 m!559057))

(declare-fun m!559059 () Bool)

(assert (=> b!580461 m!559059))

(assert (=> b!580463 m!559047))

(assert (=> b!580463 m!559047))

(declare-fun m!559061 () Bool)

(assert (=> b!580463 m!559061))

(push 1)

