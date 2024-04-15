; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53334 () Bool)

(assert start!53334)

(declare-fun b!579968 () Bool)

(declare-fun res!367928 () Bool)

(declare-fun e!333091 () Bool)

(assert (=> b!579968 (=> (not res!367928) (not e!333091))))

(declare-datatypes ((array!36249 0))(
  ( (array!36250 (arr!17399 (Array (_ BitVec 32) (_ BitVec 64))) (size!17764 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36249)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36249 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!579968 (= res!367928 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!579969 () Bool)

(declare-fun e!333092 () Bool)

(assert (=> b!579969 (= e!333092 false)))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5836 0))(
  ( (MissingZero!5836 (index!25571 (_ BitVec 32))) (Found!5836 (index!25572 (_ BitVec 32))) (Intermediate!5836 (undefined!6648 Bool) (index!25573 (_ BitVec 32)) (x!54460 (_ BitVec 32))) (Undefined!5836) (MissingVacant!5836 (index!25574 (_ BitVec 32))) )
))
(declare-fun lt!264427 () SeekEntryResult!5836)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36249 (_ BitVec 32)) SeekEntryResult!5836)

(assert (=> b!579969 (= lt!264427 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17399 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!579970 () Bool)

(declare-fun res!367932 () Bool)

(assert (=> b!579970 (=> (not res!367932) (not e!333092))))

(declare-datatypes ((List!11479 0))(
  ( (Nil!11476) (Cons!11475 (h!12520 (_ BitVec 64)) (t!17698 List!11479)) )
))
(declare-fun arrayNoDuplicates!0 (array!36249 (_ BitVec 32) List!11479) Bool)

(assert (=> b!579970 (= res!367932 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11476))))

(declare-fun b!579971 () Bool)

(declare-fun res!367930 () Bool)

(assert (=> b!579971 (=> (not res!367930) (not e!333091))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579971 (= res!367930 (validKeyInArray!0 (select (arr!17399 a!2986) j!136)))))

(declare-fun b!579972 () Bool)

(declare-fun res!367934 () Bool)

(assert (=> b!579972 (=> (not res!367934) (not e!333091))))

(assert (=> b!579972 (= res!367934 (validKeyInArray!0 k0!1786))))

(declare-fun b!579973 () Bool)

(declare-fun res!367931 () Bool)

(assert (=> b!579973 (=> (not res!367931) (not e!333091))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!579973 (= res!367931 (and (= (size!17764 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17764 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17764 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!367933 () Bool)

(assert (=> start!53334 (=> (not res!367933) (not e!333091))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53334 (= res!367933 (validMask!0 mask!3053))))

(assert (=> start!53334 e!333091))

(assert (=> start!53334 true))

(declare-fun array_inv!13282 (array!36249) Bool)

(assert (=> start!53334 (array_inv!13282 a!2986)))

(declare-fun b!579974 () Bool)

(declare-fun res!367929 () Bool)

(assert (=> b!579974 (=> (not res!367929) (not e!333092))))

(assert (=> b!579974 (= res!367929 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17399 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17399 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!579975 () Bool)

(assert (=> b!579975 (= e!333091 e!333092)))

(declare-fun res!367927 () Bool)

(assert (=> b!579975 (=> (not res!367927) (not e!333092))))

(declare-fun lt!264426 () SeekEntryResult!5836)

(assert (=> b!579975 (= res!367927 (or (= lt!264426 (MissingZero!5836 i!1108)) (= lt!264426 (MissingVacant!5836 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36249 (_ BitVec 32)) SeekEntryResult!5836)

(assert (=> b!579975 (= lt!264426 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!579976 () Bool)

(declare-fun res!367926 () Bool)

(assert (=> b!579976 (=> (not res!367926) (not e!333092))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36249 (_ BitVec 32)) Bool)

(assert (=> b!579976 (= res!367926 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!53334 res!367933) b!579973))

(assert (= (and b!579973 res!367931) b!579971))

(assert (= (and b!579971 res!367930) b!579972))

(assert (= (and b!579972 res!367934) b!579968))

(assert (= (and b!579968 res!367928) b!579975))

(assert (= (and b!579975 res!367927) b!579976))

(assert (= (and b!579976 res!367926) b!579970))

(assert (= (and b!579970 res!367932) b!579974))

(assert (= (and b!579974 res!367929) b!579969))

(declare-fun m!558043 () Bool)

(assert (=> b!579972 m!558043))

(declare-fun m!558045 () Bool)

(assert (=> b!579969 m!558045))

(assert (=> b!579969 m!558045))

(declare-fun m!558047 () Bool)

(assert (=> b!579969 m!558047))

(assert (=> b!579971 m!558045))

(assert (=> b!579971 m!558045))

(declare-fun m!558049 () Bool)

(assert (=> b!579971 m!558049))

(declare-fun m!558051 () Bool)

(assert (=> start!53334 m!558051))

(declare-fun m!558053 () Bool)

(assert (=> start!53334 m!558053))

(declare-fun m!558055 () Bool)

(assert (=> b!579968 m!558055))

(declare-fun m!558057 () Bool)

(assert (=> b!579974 m!558057))

(declare-fun m!558059 () Bool)

(assert (=> b!579974 m!558059))

(declare-fun m!558061 () Bool)

(assert (=> b!579974 m!558061))

(declare-fun m!558063 () Bool)

(assert (=> b!579976 m!558063))

(declare-fun m!558065 () Bool)

(assert (=> b!579975 m!558065))

(declare-fun m!558067 () Bool)

(assert (=> b!579970 m!558067))

(check-sat (not start!53334) (not b!579971) (not b!579976) (not b!579969) (not b!579972) (not b!579970) (not b!579968) (not b!579975))
(check-sat)
