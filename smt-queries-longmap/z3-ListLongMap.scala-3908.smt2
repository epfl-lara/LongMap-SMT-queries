; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53442 () Bool)

(assert start!53442)

(declare-fun b!581444 () Bool)

(declare-fun e!333577 () Bool)

(declare-fun e!333578 () Bool)

(assert (=> b!581444 (= e!333577 e!333578)))

(declare-fun res!369406 () Bool)

(assert (=> b!581444 (=> (not res!369406) (not e!333578))))

(declare-datatypes ((SeekEntryResult!5890 0))(
  ( (MissingZero!5890 (index!25787 (_ BitVec 32))) (Found!5890 (index!25788 (_ BitVec 32))) (Intermediate!5890 (undefined!6702 Bool) (index!25789 (_ BitVec 32)) (x!54658 (_ BitVec 32))) (Undefined!5890) (MissingVacant!5890 (index!25790 (_ BitVec 32))) )
))
(declare-fun lt!264732 () SeekEntryResult!5890)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!581444 (= res!369406 (or (= lt!264732 (MissingZero!5890 i!1108)) (= lt!264732 (MissingVacant!5890 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!36357 0))(
  ( (array!36358 (arr!17453 (Array (_ BitVec 32) (_ BitVec 64))) (size!17818 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36357)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36357 (_ BitVec 32)) SeekEntryResult!5890)

(assert (=> b!581444 (= lt!264732 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!581445 () Bool)

(declare-fun res!369407 () Bool)

(assert (=> b!581445 (=> (not res!369407) (not e!333577))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!581445 (= res!369407 (validKeyInArray!0 (select (arr!17453 a!2986) j!136)))))

(declare-fun b!581446 () Bool)

(assert (=> b!581446 (= e!333578 false)))

(declare-fun lt!264733 () SeekEntryResult!5890)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36357 (_ BitVec 32)) SeekEntryResult!5890)

(assert (=> b!581446 (= lt!264733 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17453 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!581447 () Bool)

(declare-fun res!369402 () Bool)

(assert (=> b!581447 (=> (not res!369402) (not e!333577))))

(assert (=> b!581447 (= res!369402 (validKeyInArray!0 k0!1786))))

(declare-fun res!369410 () Bool)

(assert (=> start!53442 (=> (not res!369410) (not e!333577))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53442 (= res!369410 (validMask!0 mask!3053))))

(assert (=> start!53442 e!333577))

(assert (=> start!53442 true))

(declare-fun array_inv!13336 (array!36357) Bool)

(assert (=> start!53442 (array_inv!13336 a!2986)))

(declare-fun b!581448 () Bool)

(declare-fun res!369403 () Bool)

(assert (=> b!581448 (=> (not res!369403) (not e!333578))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36357 (_ BitVec 32)) Bool)

(assert (=> b!581448 (= res!369403 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!581449 () Bool)

(declare-fun res!369404 () Bool)

(assert (=> b!581449 (=> (not res!369404) (not e!333578))))

(declare-datatypes ((List!11533 0))(
  ( (Nil!11530) (Cons!11529 (h!12574 (_ BitVec 64)) (t!17752 List!11533)) )
))
(declare-fun arrayNoDuplicates!0 (array!36357 (_ BitVec 32) List!11533) Bool)

(assert (=> b!581449 (= res!369404 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11530))))

(declare-fun b!581450 () Bool)

(declare-fun res!369408 () Bool)

(assert (=> b!581450 (=> (not res!369408) (not e!333577))))

(declare-fun arrayContainsKey!0 (array!36357 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!581450 (= res!369408 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!581451 () Bool)

(declare-fun res!369409 () Bool)

(assert (=> b!581451 (=> (not res!369409) (not e!333577))))

(assert (=> b!581451 (= res!369409 (and (= (size!17818 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17818 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17818 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!581452 () Bool)

(declare-fun res!369405 () Bool)

(assert (=> b!581452 (=> (not res!369405) (not e!333578))))

(assert (=> b!581452 (= res!369405 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17453 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17453 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!53442 res!369410) b!581451))

(assert (= (and b!581451 res!369409) b!581445))

(assert (= (and b!581445 res!369407) b!581447))

(assert (= (and b!581447 res!369402) b!581450))

(assert (= (and b!581450 res!369408) b!581444))

(assert (= (and b!581444 res!369406) b!581448))

(assert (= (and b!581448 res!369403) b!581449))

(assert (= (and b!581449 res!369404) b!581452))

(assert (= (and b!581452 res!369405) b!581446))

(declare-fun m!559459 () Bool)

(assert (=> b!581444 m!559459))

(declare-fun m!559461 () Bool)

(assert (=> b!581447 m!559461))

(declare-fun m!559463 () Bool)

(assert (=> b!581448 m!559463))

(declare-fun m!559465 () Bool)

(assert (=> b!581449 m!559465))

(declare-fun m!559467 () Bool)

(assert (=> b!581450 m!559467))

(declare-fun m!559469 () Bool)

(assert (=> start!53442 m!559469))

(declare-fun m!559471 () Bool)

(assert (=> start!53442 m!559471))

(declare-fun m!559473 () Bool)

(assert (=> b!581445 m!559473))

(assert (=> b!581445 m!559473))

(declare-fun m!559475 () Bool)

(assert (=> b!581445 m!559475))

(assert (=> b!581446 m!559473))

(assert (=> b!581446 m!559473))

(declare-fun m!559477 () Bool)

(assert (=> b!581446 m!559477))

(declare-fun m!559479 () Bool)

(assert (=> b!581452 m!559479))

(declare-fun m!559481 () Bool)

(assert (=> b!581452 m!559481))

(declare-fun m!559483 () Bool)

(assert (=> b!581452 m!559483))

(check-sat (not b!581448) (not b!581446) (not start!53442) (not b!581447) (not b!581449) (not b!581444) (not b!581450) (not b!581445))
(check-sat)
