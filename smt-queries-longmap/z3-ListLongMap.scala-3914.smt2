; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53478 () Bool)

(assert start!53478)

(declare-fun b!581949 () Bool)

(declare-fun res!369907 () Bool)

(declare-fun e!333741 () Bool)

(assert (=> b!581949 (=> (not res!369907) (not e!333741))))

(declare-datatypes ((array!36393 0))(
  ( (array!36394 (arr!17471 (Array (_ BitVec 32) (_ BitVec 64))) (size!17836 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36393)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!581949 (= res!369907 (validKeyInArray!0 (select (arr!17471 a!2986) j!136)))))

(declare-fun b!581950 () Bool)

(declare-fun res!369912 () Bool)

(declare-fun e!333740 () Bool)

(assert (=> b!581950 (=> (not res!369912) (not e!333740))))

(declare-datatypes ((List!11551 0))(
  ( (Nil!11548) (Cons!11547 (h!12592 (_ BitVec 64)) (t!17770 List!11551)) )
))
(declare-fun arrayNoDuplicates!0 (array!36393 (_ BitVec 32) List!11551) Bool)

(assert (=> b!581950 (= res!369912 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11548))))

(declare-fun b!581951 () Bool)

(declare-fun res!369911 () Bool)

(assert (=> b!581951 (=> (not res!369911) (not e!333740))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!581951 (= res!369911 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17471 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17471 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!581952 () Bool)

(assert (=> b!581952 (= e!333740 false)))

(declare-datatypes ((SeekEntryResult!5908 0))(
  ( (MissingZero!5908 (index!25859 (_ BitVec 32))) (Found!5908 (index!25860 (_ BitVec 32))) (Intermediate!5908 (undefined!6720 Bool) (index!25861 (_ BitVec 32)) (x!54724 (_ BitVec 32))) (Undefined!5908) (MissingVacant!5908 (index!25862 (_ BitVec 32))) )
))
(declare-fun lt!264832 () SeekEntryResult!5908)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36393 (_ BitVec 32)) SeekEntryResult!5908)

(assert (=> b!581952 (= lt!264832 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17471 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!581953 () Bool)

(declare-fun res!369908 () Bool)

(assert (=> b!581953 (=> (not res!369908) (not e!333741))))

(assert (=> b!581953 (= res!369908 (validKeyInArray!0 k0!1786))))

(declare-fun b!581954 () Bool)

(assert (=> b!581954 (= e!333741 e!333740)))

(declare-fun res!369910 () Bool)

(assert (=> b!581954 (=> (not res!369910) (not e!333740))))

(declare-fun lt!264831 () SeekEntryResult!5908)

(assert (=> b!581954 (= res!369910 (or (= lt!264831 (MissingZero!5908 i!1108)) (= lt!264831 (MissingVacant!5908 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36393 (_ BitVec 32)) SeekEntryResult!5908)

(assert (=> b!581954 (= lt!264831 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!581955 () Bool)

(declare-fun res!369909 () Bool)

(assert (=> b!581955 (=> (not res!369909) (not e!333741))))

(assert (=> b!581955 (= res!369909 (and (= (size!17836 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17836 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17836 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!581956 () Bool)

(declare-fun res!369914 () Bool)

(assert (=> b!581956 (=> (not res!369914) (not e!333740))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36393 (_ BitVec 32)) Bool)

(assert (=> b!581956 (= res!369914 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!581948 () Bool)

(declare-fun res!369913 () Bool)

(assert (=> b!581948 (=> (not res!369913) (not e!333741))))

(declare-fun arrayContainsKey!0 (array!36393 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!581948 (= res!369913 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!369906 () Bool)

(assert (=> start!53478 (=> (not res!369906) (not e!333741))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53478 (= res!369906 (validMask!0 mask!3053))))

(assert (=> start!53478 e!333741))

(assert (=> start!53478 true))

(declare-fun array_inv!13354 (array!36393) Bool)

(assert (=> start!53478 (array_inv!13354 a!2986)))

(assert (= (and start!53478 res!369906) b!581955))

(assert (= (and b!581955 res!369909) b!581949))

(assert (= (and b!581949 res!369907) b!581953))

(assert (= (and b!581953 res!369908) b!581948))

(assert (= (and b!581948 res!369913) b!581954))

(assert (= (and b!581954 res!369910) b!581956))

(assert (= (and b!581956 res!369914) b!581950))

(assert (= (and b!581950 res!369912) b!581951))

(assert (= (and b!581951 res!369911) b!581952))

(declare-fun m!559945 () Bool)

(assert (=> b!581952 m!559945))

(assert (=> b!581952 m!559945))

(declare-fun m!559947 () Bool)

(assert (=> b!581952 m!559947))

(assert (=> b!581949 m!559945))

(assert (=> b!581949 m!559945))

(declare-fun m!559949 () Bool)

(assert (=> b!581949 m!559949))

(declare-fun m!559951 () Bool)

(assert (=> b!581948 m!559951))

(declare-fun m!559953 () Bool)

(assert (=> b!581953 m!559953))

(declare-fun m!559955 () Bool)

(assert (=> b!581951 m!559955))

(declare-fun m!559957 () Bool)

(assert (=> b!581951 m!559957))

(declare-fun m!559959 () Bool)

(assert (=> b!581951 m!559959))

(declare-fun m!559961 () Bool)

(assert (=> b!581954 m!559961))

(declare-fun m!559963 () Bool)

(assert (=> start!53478 m!559963))

(declare-fun m!559965 () Bool)

(assert (=> start!53478 m!559965))

(declare-fun m!559967 () Bool)

(assert (=> b!581950 m!559967))

(declare-fun m!559969 () Bool)

(assert (=> b!581956 m!559969))

(check-sat (not b!581953) (not b!581956) (not b!581949) (not b!581952) (not b!581948) (not start!53478) (not b!581954) (not b!581950))
(check-sat)
