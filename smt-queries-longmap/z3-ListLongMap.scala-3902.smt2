; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53406 () Bool)

(assert start!53406)

(declare-fun b!580949 () Bool)

(declare-fun res!368908 () Bool)

(declare-fun e!333416 () Bool)

(assert (=> b!580949 (=> (not res!368908) (not e!333416))))

(declare-datatypes ((array!36321 0))(
  ( (array!36322 (arr!17435 (Array (_ BitVec 32) (_ BitVec 64))) (size!17800 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36321)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36321 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!580949 (= res!368908 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!580950 () Bool)

(declare-fun res!368907 () Bool)

(declare-fun e!333417 () Bool)

(assert (=> b!580950 (=> (not res!368907) (not e!333417))))

(declare-datatypes ((List!11515 0))(
  ( (Nil!11512) (Cons!11511 (h!12556 (_ BitVec 64)) (t!17734 List!11515)) )
))
(declare-fun arrayNoDuplicates!0 (array!36321 (_ BitVec 32) List!11515) Bool)

(assert (=> b!580950 (= res!368907 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11512))))

(declare-fun b!580951 () Bool)

(declare-fun res!368911 () Bool)

(assert (=> b!580951 (=> (not res!368911) (not e!333417))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!580951 (= res!368911 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17435 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17435 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!580952 () Bool)

(declare-fun res!368914 () Bool)

(assert (=> b!580952 (=> (not res!368914) (not e!333417))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36321 (_ BitVec 32)) Bool)

(assert (=> b!580952 (= res!368914 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!580953 () Bool)

(declare-fun res!368910 () Bool)

(assert (=> b!580953 (=> (not res!368910) (not e!333416))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!580953 (= res!368910 (and (= (size!17800 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17800 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17800 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!580954 () Bool)

(assert (=> b!580954 (= e!333416 e!333417)))

(declare-fun res!368915 () Bool)

(assert (=> b!580954 (=> (not res!368915) (not e!333417))))

(declare-datatypes ((SeekEntryResult!5872 0))(
  ( (MissingZero!5872 (index!25715 (_ BitVec 32))) (Found!5872 (index!25716 (_ BitVec 32))) (Intermediate!5872 (undefined!6684 Bool) (index!25717 (_ BitVec 32)) (x!54592 (_ BitVec 32))) (Undefined!5872) (MissingVacant!5872 (index!25718 (_ BitVec 32))) )
))
(declare-fun lt!264633 () SeekEntryResult!5872)

(assert (=> b!580954 (= res!368915 (or (= lt!264633 (MissingZero!5872 i!1108)) (= lt!264633 (MissingVacant!5872 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36321 (_ BitVec 32)) SeekEntryResult!5872)

(assert (=> b!580954 (= lt!264633 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!368912 () Bool)

(assert (=> start!53406 (=> (not res!368912) (not e!333416))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53406 (= res!368912 (validMask!0 mask!3053))))

(assert (=> start!53406 e!333416))

(assert (=> start!53406 true))

(declare-fun array_inv!13318 (array!36321) Bool)

(assert (=> start!53406 (array_inv!13318 a!2986)))

(declare-fun b!580955 () Bool)

(assert (=> b!580955 (= e!333417 false)))

(declare-fun lt!264634 () SeekEntryResult!5872)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36321 (_ BitVec 32)) SeekEntryResult!5872)

(assert (=> b!580955 (= lt!264634 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17435 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!580956 () Bool)

(declare-fun res!368913 () Bool)

(assert (=> b!580956 (=> (not res!368913) (not e!333416))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!580956 (= res!368913 (validKeyInArray!0 (select (arr!17435 a!2986) j!136)))))

(declare-fun b!580957 () Bool)

(declare-fun res!368909 () Bool)

(assert (=> b!580957 (=> (not res!368909) (not e!333416))))

(assert (=> b!580957 (= res!368909 (validKeyInArray!0 k0!1786))))

(assert (= (and start!53406 res!368912) b!580953))

(assert (= (and b!580953 res!368910) b!580956))

(assert (= (and b!580956 res!368913) b!580957))

(assert (= (and b!580957 res!368909) b!580949))

(assert (= (and b!580949 res!368908) b!580954))

(assert (= (and b!580954 res!368915) b!580952))

(assert (= (and b!580952 res!368914) b!580950))

(assert (= (and b!580950 res!368907) b!580951))

(assert (= (and b!580951 res!368911) b!580955))

(declare-fun m!558985 () Bool)

(assert (=> b!580956 m!558985))

(assert (=> b!580956 m!558985))

(declare-fun m!558987 () Bool)

(assert (=> b!580956 m!558987))

(declare-fun m!558989 () Bool)

(assert (=> b!580952 m!558989))

(declare-fun m!558991 () Bool)

(assert (=> start!53406 m!558991))

(declare-fun m!558993 () Bool)

(assert (=> start!53406 m!558993))

(declare-fun m!558995 () Bool)

(assert (=> b!580949 m!558995))

(declare-fun m!558997 () Bool)

(assert (=> b!580957 m!558997))

(declare-fun m!558999 () Bool)

(assert (=> b!580951 m!558999))

(declare-fun m!559001 () Bool)

(assert (=> b!580951 m!559001))

(declare-fun m!559003 () Bool)

(assert (=> b!580951 m!559003))

(declare-fun m!559005 () Bool)

(assert (=> b!580950 m!559005))

(declare-fun m!559007 () Bool)

(assert (=> b!580954 m!559007))

(assert (=> b!580955 m!558985))

(assert (=> b!580955 m!558985))

(declare-fun m!559009 () Bool)

(assert (=> b!580955 m!559009))

(check-sat (not b!580952) (not b!580949) (not b!580956) (not b!580957) (not b!580955) (not start!53406) (not b!580954) (not b!580950))
(check-sat)
