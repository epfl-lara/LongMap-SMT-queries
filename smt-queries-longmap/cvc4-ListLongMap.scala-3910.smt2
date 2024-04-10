; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53474 () Bool)

(assert start!53474)

(declare-fun b!581949 () Bool)

(declare-fun res!369769 () Bool)

(declare-fun e!333823 () Bool)

(assert (=> b!581949 (=> (not res!369769) (not e!333823))))

(declare-datatypes ((array!36375 0))(
  ( (array!36376 (arr!17462 (Array (_ BitVec 32) (_ BitVec 64))) (size!17826 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36375)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36375 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!581949 (= res!369769 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!581950 () Bool)

(declare-fun res!369765 () Bool)

(assert (=> b!581950 (=> (not res!369765) (not e!333823))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!581950 (= res!369765 (validKeyInArray!0 (select (arr!17462 a!2986) j!136)))))

(declare-fun res!369773 () Bool)

(assert (=> start!53474 (=> (not res!369773) (not e!333823))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53474 (= res!369773 (validMask!0 mask!3053))))

(assert (=> start!53474 e!333823))

(assert (=> start!53474 true))

(declare-fun array_inv!13258 (array!36375) Bool)

(assert (=> start!53474 (array_inv!13258 a!2986)))

(declare-fun b!581951 () Bool)

(declare-fun e!333824 () Bool)

(assert (=> b!581951 (= e!333823 e!333824)))

(declare-fun res!369771 () Bool)

(assert (=> b!581951 (=> (not res!369771) (not e!333824))))

(declare-datatypes ((SeekEntryResult!5902 0))(
  ( (MissingZero!5902 (index!25835 (_ BitVec 32))) (Found!5902 (index!25836 (_ BitVec 32))) (Intermediate!5902 (undefined!6714 Bool) (index!25837 (_ BitVec 32)) (x!54691 (_ BitVec 32))) (Undefined!5902) (MissingVacant!5902 (index!25838 (_ BitVec 32))) )
))
(declare-fun lt!265005 () SeekEntryResult!5902)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!581951 (= res!369771 (or (= lt!265005 (MissingZero!5902 i!1108)) (= lt!265005 (MissingVacant!5902 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36375 (_ BitVec 32)) SeekEntryResult!5902)

(assert (=> b!581951 (= lt!265005 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!581952 () Bool)

(declare-fun res!369770 () Bool)

(assert (=> b!581952 (=> (not res!369770) (not e!333823))))

(assert (=> b!581952 (= res!369770 (validKeyInArray!0 k!1786))))

(declare-fun b!581953 () Bool)

(declare-fun res!369766 () Bool)

(assert (=> b!581953 (=> (not res!369766) (not e!333823))))

(assert (=> b!581953 (= res!369766 (and (= (size!17826 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17826 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17826 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!581954 () Bool)

(assert (=> b!581954 (= e!333824 false)))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!265006 () SeekEntryResult!5902)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36375 (_ BitVec 32)) SeekEntryResult!5902)

(assert (=> b!581954 (= lt!265006 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17462 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!581955 () Bool)

(declare-fun res!369772 () Bool)

(assert (=> b!581955 (=> (not res!369772) (not e!333824))))

(declare-datatypes ((List!11503 0))(
  ( (Nil!11500) (Cons!11499 (h!12544 (_ BitVec 64)) (t!17731 List!11503)) )
))
(declare-fun arrayNoDuplicates!0 (array!36375 (_ BitVec 32) List!11503) Bool)

(assert (=> b!581955 (= res!369772 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11500))))

(declare-fun b!581956 () Bool)

(declare-fun res!369767 () Bool)

(assert (=> b!581956 (=> (not res!369767) (not e!333824))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36375 (_ BitVec 32)) Bool)

(assert (=> b!581956 (= res!369767 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!581957 () Bool)

(declare-fun res!369768 () Bool)

(assert (=> b!581957 (=> (not res!369768) (not e!333824))))

(assert (=> b!581957 (= res!369768 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17462 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17462 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!53474 res!369773) b!581953))

(assert (= (and b!581953 res!369766) b!581950))

(assert (= (and b!581950 res!369765) b!581952))

(assert (= (and b!581952 res!369770) b!581949))

(assert (= (and b!581949 res!369769) b!581951))

(assert (= (and b!581951 res!369771) b!581956))

(assert (= (and b!581956 res!369767) b!581955))

(assert (= (and b!581955 res!369772) b!581957))

(assert (= (and b!581957 res!369768) b!581954))

(declare-fun m!560471 () Bool)

(assert (=> b!581956 m!560471))

(declare-fun m!560473 () Bool)

(assert (=> b!581952 m!560473))

(declare-fun m!560475 () Bool)

(assert (=> b!581955 m!560475))

(declare-fun m!560477 () Bool)

(assert (=> b!581950 m!560477))

(assert (=> b!581950 m!560477))

(declare-fun m!560479 () Bool)

(assert (=> b!581950 m!560479))

(declare-fun m!560481 () Bool)

(assert (=> b!581957 m!560481))

(declare-fun m!560483 () Bool)

(assert (=> b!581957 m!560483))

(declare-fun m!560485 () Bool)

(assert (=> b!581957 m!560485))

(assert (=> b!581954 m!560477))

(assert (=> b!581954 m!560477))

(declare-fun m!560487 () Bool)

(assert (=> b!581954 m!560487))

(declare-fun m!560489 () Bool)

(assert (=> start!53474 m!560489))

(declare-fun m!560491 () Bool)

(assert (=> start!53474 m!560491))

(declare-fun m!560493 () Bool)

(assert (=> b!581951 m!560493))

(declare-fun m!560495 () Bool)

(assert (=> b!581949 m!560495))

(push 1)

(assert (not b!581955))

(assert (not start!53474))

