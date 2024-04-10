; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53386 () Bool)

(assert start!53386)

(declare-fun b!580734 () Bool)

(declare-fun e!333428 () Bool)

(declare-fun e!333429 () Bool)

(assert (=> b!580734 (= e!333428 e!333429)))

(declare-fun res!368551 () Bool)

(assert (=> b!580734 (=> (not res!368551) (not e!333429))))

(declare-datatypes ((SeekEntryResult!5858 0))(
  ( (MissingZero!5858 (index!25659 (_ BitVec 32))) (Found!5858 (index!25660 (_ BitVec 32))) (Intermediate!5858 (undefined!6670 Bool) (index!25661 (_ BitVec 32)) (x!54535 (_ BitVec 32))) (Undefined!5858) (MissingVacant!5858 (index!25662 (_ BitVec 32))) )
))
(declare-fun lt!264760 () SeekEntryResult!5858)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!580734 (= res!368551 (or (= lt!264760 (MissingZero!5858 i!1108)) (= lt!264760 (MissingVacant!5858 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!36287 0))(
  ( (array!36288 (arr!17418 (Array (_ BitVec 32) (_ BitVec 64))) (size!17782 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36287)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36287 (_ BitVec 32)) SeekEntryResult!5858)

(assert (=> b!580734 (= lt!264760 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!580735 () Bool)

(declare-fun res!368556 () Bool)

(assert (=> b!580735 (=> (not res!368556) (not e!333428))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!580735 (= res!368556 (validKeyInArray!0 k!1786))))

(declare-fun b!580736 () Bool)

(declare-fun res!368552 () Bool)

(assert (=> b!580736 (=> (not res!368552) (not e!333428))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!580736 (= res!368552 (and (= (size!17782 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17782 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17782 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!580737 () Bool)

(declare-fun res!368555 () Bool)

(assert (=> b!580737 (=> (not res!368555) (not e!333429))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!580737 (= res!368555 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17418 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17418 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!580739 () Bool)

(assert (=> b!580739 (= e!333429 false)))

(declare-fun lt!264759 () SeekEntryResult!5858)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36287 (_ BitVec 32)) SeekEntryResult!5858)

(assert (=> b!580739 (= lt!264759 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17418 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!580740 () Bool)

(declare-fun res!368553 () Bool)

(assert (=> b!580740 (=> (not res!368553) (not e!333428))))

(assert (=> b!580740 (= res!368553 (validKeyInArray!0 (select (arr!17418 a!2986) j!136)))))

(declare-fun b!580741 () Bool)

(declare-fun res!368554 () Bool)

(assert (=> b!580741 (=> (not res!368554) (not e!333429))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36287 (_ BitVec 32)) Bool)

(assert (=> b!580741 (= res!368554 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!580742 () Bool)

(declare-fun res!368550 () Bool)

(assert (=> b!580742 (=> (not res!368550) (not e!333428))))

(declare-fun arrayContainsKey!0 (array!36287 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!580742 (= res!368550 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!368557 () Bool)

(assert (=> start!53386 (=> (not res!368557) (not e!333428))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53386 (= res!368557 (validMask!0 mask!3053))))

(assert (=> start!53386 e!333428))

(assert (=> start!53386 true))

(declare-fun array_inv!13214 (array!36287) Bool)

(assert (=> start!53386 (array_inv!13214 a!2986)))

(declare-fun b!580738 () Bool)

(declare-fun res!368558 () Bool)

(assert (=> b!580738 (=> (not res!368558) (not e!333429))))

(declare-datatypes ((List!11459 0))(
  ( (Nil!11456) (Cons!11455 (h!12500 (_ BitVec 64)) (t!17687 List!11459)) )
))
(declare-fun arrayNoDuplicates!0 (array!36287 (_ BitVec 32) List!11459) Bool)

(assert (=> b!580738 (= res!368558 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11456))))

(assert (= (and start!53386 res!368557) b!580736))

(assert (= (and b!580736 res!368552) b!580740))

(assert (= (and b!580740 res!368553) b!580735))

(assert (= (and b!580735 res!368556) b!580742))

(assert (= (and b!580742 res!368550) b!580734))

(assert (= (and b!580734 res!368551) b!580741))

(assert (= (and b!580741 res!368554) b!580738))

(assert (= (and b!580738 res!368558) b!580737))

(assert (= (and b!580737 res!368555) b!580739))

(declare-fun m!559303 () Bool)

(assert (=> b!580740 m!559303))

(assert (=> b!580740 m!559303))

(declare-fun m!559305 () Bool)

(assert (=> b!580740 m!559305))

(declare-fun m!559307 () Bool)

(assert (=> b!580741 m!559307))

(declare-fun m!559309 () Bool)

(assert (=> start!53386 m!559309))

(declare-fun m!559311 () Bool)

(assert (=> start!53386 m!559311))

(declare-fun m!559313 () Bool)

(assert (=> b!580734 m!559313))

(declare-fun m!559315 () Bool)

(assert (=> b!580735 m!559315))

(assert (=> b!580739 m!559303))

(assert (=> b!580739 m!559303))

(declare-fun m!559317 () Bool)

(assert (=> b!580739 m!559317))

(declare-fun m!559319 () Bool)

(assert (=> b!580738 m!559319))

(declare-fun m!559321 () Bool)

(assert (=> b!580742 m!559321))

(declare-fun m!559323 () Bool)

(assert (=> b!580737 m!559323))

(declare-fun m!559325 () Bool)

(assert (=> b!580737 m!559325))

(declare-fun m!559327 () Bool)

(assert (=> b!580737 m!559327))

(push 1)

(assert (not b!580741))

(assert (not b!580739))

(assert (not b!580734))

(assert (not b!580740))

(assert (not b!580738))

(assert (not b!580742))

(assert (not b!580735))

(assert (not start!53386))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

