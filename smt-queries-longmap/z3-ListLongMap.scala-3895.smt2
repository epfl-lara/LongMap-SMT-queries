; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53430 () Bool)

(assert start!53430)

(declare-fun res!368563 () Bool)

(declare-fun e!333530 () Bool)

(assert (=> start!53430 (=> (not res!368563) (not e!333530))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53430 (= res!368563 (validMask!0 mask!3053))))

(assert (=> start!53430 e!333530))

(assert (=> start!53430 true))

(declare-datatypes ((array!36276 0))(
  ( (array!36277 (arr!17410 (Array (_ BitVec 32) (_ BitVec 64))) (size!17774 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36276)

(declare-fun array_inv!13269 (array!36276) Bool)

(assert (=> start!53430 (array_inv!13269 a!2986)))

(declare-fun b!580846 () Bool)

(declare-fun res!368562 () Bool)

(declare-fun e!333529 () Bool)

(assert (=> b!580846 (=> (not res!368562) (not e!333529))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5806 0))(
  ( (MissingZero!5806 (index!25451 (_ BitVec 32))) (Found!5806 (index!25452 (_ BitVec 32))) (Intermediate!5806 (undefined!6618 Bool) (index!25453 (_ BitVec 32)) (x!54478 (_ BitVec 32))) (Undefined!5806) (MissingVacant!5806 (index!25454 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36276 (_ BitVec 32)) SeekEntryResult!5806)

(assert (=> b!580846 (= res!368562 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17410 a!2986) j!136) a!2986 mask!3053) (Found!5806 j!136)))))

(declare-fun b!580847 () Bool)

(declare-fun res!368564 () Bool)

(assert (=> b!580847 (=> (not res!368564) (not e!333529))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36276 (_ BitVec 32)) Bool)

(assert (=> b!580847 (= res!368564 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!580848 () Bool)

(declare-fun res!368559 () Bool)

(assert (=> b!580848 (=> (not res!368559) (not e!333530))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!580848 (= res!368559 (validKeyInArray!0 (select (arr!17410 a!2986) j!136)))))

(declare-fun b!580849 () Bool)

(declare-fun res!368565 () Bool)

(assert (=> b!580849 (=> (not res!368565) (not e!333530))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!580849 (= res!368565 (validKeyInArray!0 k0!1786))))

(declare-fun b!580850 () Bool)

(declare-fun res!368560 () Bool)

(assert (=> b!580850 (=> (not res!368560) (not e!333529))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!580850 (= res!368560 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17410 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17410 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!580851 () Bool)

(declare-fun res!368557 () Bool)

(assert (=> b!580851 (=> (not res!368557) (not e!333529))))

(declare-datatypes ((List!11358 0))(
  ( (Nil!11355) (Cons!11354 (h!12402 (_ BitVec 64)) (t!17578 List!11358)) )
))
(declare-fun arrayNoDuplicates!0 (array!36276 (_ BitVec 32) List!11358) Bool)

(assert (=> b!580851 (= res!368557 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11355))))

(declare-fun b!580852 () Bool)

(declare-fun res!368561 () Bool)

(assert (=> b!580852 (=> (not res!368561) (not e!333530))))

(assert (=> b!580852 (= res!368561 (and (= (size!17774 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17774 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17774 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!580853 () Bool)

(assert (=> b!580853 (= e!333530 e!333529)))

(declare-fun res!368558 () Bool)

(assert (=> b!580853 (=> (not res!368558) (not e!333529))))

(declare-fun lt!264859 () SeekEntryResult!5806)

(assert (=> b!580853 (= res!368558 (or (= lt!264859 (MissingZero!5806 i!1108)) (= lt!264859 (MissingVacant!5806 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36276 (_ BitVec 32)) SeekEntryResult!5806)

(assert (=> b!580853 (= lt!264859 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!580854 () Bool)

(assert (=> b!580854 (= e!333529 (and (bvslt x!910 #b01111111111111111111111111111110) (= (select (arr!17410 a!2986) index!984) (select (arr!17410 a!2986) j!136)) (= index!984 j!136) (bvslt mask!3053 #b00000000000000000000000000000000)))))

(declare-fun b!580855 () Bool)

(declare-fun res!368566 () Bool)

(assert (=> b!580855 (=> (not res!368566) (not e!333530))))

(declare-fun arrayContainsKey!0 (array!36276 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!580855 (= res!368566 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!53430 res!368563) b!580852))

(assert (= (and b!580852 res!368561) b!580848))

(assert (= (and b!580848 res!368559) b!580849))

(assert (= (and b!580849 res!368565) b!580855))

(assert (= (and b!580855 res!368566) b!580853))

(assert (= (and b!580853 res!368558) b!580847))

(assert (= (and b!580847 res!368564) b!580851))

(assert (= (and b!580851 res!368557) b!580850))

(assert (= (and b!580850 res!368560) b!580846))

(assert (= (and b!580846 res!368562) b!580854))

(declare-fun m!559571 () Bool)

(assert (=> b!580855 m!559571))

(declare-fun m!559573 () Bool)

(assert (=> b!580847 m!559573))

(declare-fun m!559575 () Bool)

(assert (=> b!580848 m!559575))

(assert (=> b!580848 m!559575))

(declare-fun m!559577 () Bool)

(assert (=> b!580848 m!559577))

(declare-fun m!559579 () Bool)

(assert (=> b!580850 m!559579))

(declare-fun m!559581 () Bool)

(assert (=> b!580850 m!559581))

(declare-fun m!559583 () Bool)

(assert (=> b!580850 m!559583))

(declare-fun m!559585 () Bool)

(assert (=> b!580853 m!559585))

(declare-fun m!559587 () Bool)

(assert (=> b!580854 m!559587))

(assert (=> b!580854 m!559575))

(declare-fun m!559589 () Bool)

(assert (=> start!53430 m!559589))

(declare-fun m!559591 () Bool)

(assert (=> start!53430 m!559591))

(declare-fun m!559593 () Bool)

(assert (=> b!580851 m!559593))

(assert (=> b!580846 m!559575))

(assert (=> b!580846 m!559575))

(declare-fun m!559595 () Bool)

(assert (=> b!580846 m!559595))

(declare-fun m!559597 () Bool)

(assert (=> b!580849 m!559597))

(check-sat (not b!580849) (not start!53430) (not b!580846) (not b!580848) (not b!580851) (not b!580847) (not b!580855) (not b!580853))
(check-sat)
