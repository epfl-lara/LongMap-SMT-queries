; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53736 () Bool)

(assert start!53736)

(declare-fun b!586101 () Bool)

(declare-fun res!374069 () Bool)

(declare-fun e!335072 () Bool)

(assert (=> b!586101 (=> (not res!374069) (not e!335072))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36651 0))(
  ( (array!36652 (arr!17600 (Array (_ BitVec 32) (_ BitVec 64))) (size!17965 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36651)

(assert (=> b!586101 (= res!374069 (and (= (size!17965 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17965 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17965 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!586102 () Bool)

(declare-fun res!374066 () Bool)

(declare-fun e!335071 () Bool)

(assert (=> b!586102 (=> (not res!374066) (not e!335071))))

(declare-datatypes ((List!11680 0))(
  ( (Nil!11677) (Cons!11676 (h!12721 (_ BitVec 64)) (t!17899 List!11680)) )
))
(declare-fun arrayNoDuplicates!0 (array!36651 (_ BitVec 32) List!11680) Bool)

(assert (=> b!586102 (= res!374066 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11677))))

(declare-fun b!586103 () Bool)

(assert (=> b!586103 (= e!335071 (not true))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!265842 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6037 0))(
  ( (MissingZero!6037 (index!26375 (_ BitVec 32))) (Found!6037 (index!26376 (_ BitVec 32))) (Intermediate!6037 (undefined!6849 Bool) (index!26377 (_ BitVec 32)) (x!55197 (_ BitVec 32))) (Undefined!6037) (MissingVacant!6037 (index!26378 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36651 (_ BitVec 32)) SeekEntryResult!6037)

(assert (=> b!586103 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265842 vacantSpotIndex!68 (select (arr!17600 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265842 vacantSpotIndex!68 (select (store (arr!17600 a!2986) i!1108 k0!1786) j!136) (array!36652 (store (arr!17600 a!2986) i!1108 k0!1786) (size!17965 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18180 0))(
  ( (Unit!18181) )
))
(declare-fun lt!265843 () Unit!18180)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36651 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18180)

(assert (=> b!586103 (= lt!265843 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!265842 vacantSpotIndex!68 mask!3053))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!586103 (= lt!265842 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!586104 () Bool)

(declare-fun res!374063 () Bool)

(assert (=> b!586104 (=> (not res!374063) (not e!335071))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36651 (_ BitVec 32)) Bool)

(assert (=> b!586104 (= res!374063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!374060 () Bool)

(assert (=> start!53736 (=> (not res!374060) (not e!335072))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53736 (= res!374060 (validMask!0 mask!3053))))

(assert (=> start!53736 e!335072))

(assert (=> start!53736 true))

(declare-fun array_inv!13483 (array!36651) Bool)

(assert (=> start!53736 (array_inv!13483 a!2986)))

(declare-fun b!586105 () Bool)

(declare-fun res!374068 () Bool)

(assert (=> b!586105 (=> (not res!374068) (not e!335072))))

(declare-fun arrayContainsKey!0 (array!36651 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!586105 (= res!374068 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!586106 () Bool)

(declare-fun res!374067 () Bool)

(assert (=> b!586106 (=> (not res!374067) (not e!335071))))

(assert (=> b!586106 (= res!374067 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17600 a!2986) j!136) a!2986 mask!3053) (Found!6037 j!136)))))

(declare-fun b!586107 () Bool)

(declare-fun res!374065 () Bool)

(assert (=> b!586107 (=> (not res!374065) (not e!335071))))

(assert (=> b!586107 (= res!374065 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17600 a!2986) index!984) (select (arr!17600 a!2986) j!136))) (not (= (select (arr!17600 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!586108 () Bool)

(declare-fun res!374059 () Bool)

(assert (=> b!586108 (=> (not res!374059) (not e!335071))))

(assert (=> b!586108 (= res!374059 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17600 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17600 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!586109 () Bool)

(assert (=> b!586109 (= e!335072 e!335071)))

(declare-fun res!374061 () Bool)

(assert (=> b!586109 (=> (not res!374061) (not e!335071))))

(declare-fun lt!265841 () SeekEntryResult!6037)

(assert (=> b!586109 (= res!374061 (or (= lt!265841 (MissingZero!6037 i!1108)) (= lt!265841 (MissingVacant!6037 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36651 (_ BitVec 32)) SeekEntryResult!6037)

(assert (=> b!586109 (= lt!265841 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!586110 () Bool)

(declare-fun res!374062 () Bool)

(assert (=> b!586110 (=> (not res!374062) (not e!335072))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!586110 (= res!374062 (validKeyInArray!0 k0!1786))))

(declare-fun b!586111 () Bool)

(declare-fun res!374064 () Bool)

(assert (=> b!586111 (=> (not res!374064) (not e!335072))))

(assert (=> b!586111 (= res!374064 (validKeyInArray!0 (select (arr!17600 a!2986) j!136)))))

(assert (= (and start!53736 res!374060) b!586101))

(assert (= (and b!586101 res!374069) b!586111))

(assert (= (and b!586111 res!374064) b!586110))

(assert (= (and b!586110 res!374062) b!586105))

(assert (= (and b!586105 res!374068) b!586109))

(assert (= (and b!586109 res!374061) b!586104))

(assert (= (and b!586104 res!374063) b!586102))

(assert (= (and b!586102 res!374066) b!586108))

(assert (= (and b!586108 res!374059) b!586106))

(assert (= (and b!586106 res!374067) b!586107))

(assert (= (and b!586107 res!374065) b!586103))

(declare-fun m!563935 () Bool)

(assert (=> start!53736 m!563935))

(declare-fun m!563937 () Bool)

(assert (=> start!53736 m!563937))

(declare-fun m!563939 () Bool)

(assert (=> b!586102 m!563939))

(declare-fun m!563941 () Bool)

(assert (=> b!586109 m!563941))

(declare-fun m!563943 () Bool)

(assert (=> b!586110 m!563943))

(declare-fun m!563945 () Bool)

(assert (=> b!586106 m!563945))

(assert (=> b!586106 m!563945))

(declare-fun m!563947 () Bool)

(assert (=> b!586106 m!563947))

(declare-fun m!563949 () Bool)

(assert (=> b!586103 m!563949))

(declare-fun m!563951 () Bool)

(assert (=> b!586103 m!563951))

(assert (=> b!586103 m!563945))

(declare-fun m!563953 () Bool)

(assert (=> b!586103 m!563953))

(assert (=> b!586103 m!563951))

(declare-fun m!563955 () Bool)

(assert (=> b!586103 m!563955))

(assert (=> b!586103 m!563945))

(declare-fun m!563957 () Bool)

(assert (=> b!586103 m!563957))

(declare-fun m!563959 () Bool)

(assert (=> b!586103 m!563959))

(declare-fun m!563961 () Bool)

(assert (=> b!586105 m!563961))

(declare-fun m!563963 () Bool)

(assert (=> b!586108 m!563963))

(assert (=> b!586108 m!563953))

(declare-fun m!563965 () Bool)

(assert (=> b!586108 m!563965))

(declare-fun m!563967 () Bool)

(assert (=> b!586107 m!563967))

(assert (=> b!586107 m!563945))

(declare-fun m!563969 () Bool)

(assert (=> b!586104 m!563969))

(assert (=> b!586111 m!563945))

(assert (=> b!586111 m!563945))

(declare-fun m!563971 () Bool)

(assert (=> b!586111 m!563971))

(check-sat (not b!586103) (not b!586106) (not b!586111) (not b!586104) (not b!586110) (not b!586102) (not b!586109) (not b!586105) (not start!53736))
(check-sat)
