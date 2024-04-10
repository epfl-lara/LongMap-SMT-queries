; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57100 () Bool)

(assert start!57100)

(declare-fun b!632082 () Bool)

(declare-fun res!408728 () Bool)

(declare-fun e!361384 () Bool)

(assert (=> b!632082 (=> (not res!408728) (not e!361384))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!38119 0))(
  ( (array!38120 (arr!18292 (Array (_ BitVec 32) (_ BitVec 64))) (size!18656 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38119)

(assert (=> b!632082 (= res!408728 (and (= (size!18656 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18656 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18656 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!632083 () Bool)

(declare-datatypes ((Unit!21262 0))(
  ( (Unit!21263) )
))
(declare-fun e!361380 () Unit!21262)

(declare-fun Unit!21264 () Unit!21262)

(assert (=> b!632083 (= e!361380 Unit!21264)))

(assert (=> b!632083 false))

(declare-fun b!632084 () Bool)

(declare-fun res!408735 () Bool)

(declare-fun e!361386 () Bool)

(assert (=> b!632084 (=> (not res!408735) (not e!361386))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!632084 (= res!408735 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18292 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!632085 () Bool)

(declare-fun e!361382 () Bool)

(declare-datatypes ((SeekEntryResult!6732 0))(
  ( (MissingZero!6732 (index!29221 (_ BitVec 32))) (Found!6732 (index!29222 (_ BitVec 32))) (Intermediate!6732 (undefined!7544 Bool) (index!29223 (_ BitVec 32)) (x!57959 (_ BitVec 32))) (Undefined!6732) (MissingVacant!6732 (index!29224 (_ BitVec 32))) )
))
(declare-fun lt!292083 () SeekEntryResult!6732)

(declare-fun lt!292080 () SeekEntryResult!6732)

(assert (=> b!632085 (= e!361382 (= lt!292083 lt!292080))))

(declare-fun b!632086 () Bool)

(declare-fun e!361383 () Bool)

(declare-fun e!361379 () Bool)

(assert (=> b!632086 (= e!361383 e!361379)))

(declare-fun res!408729 () Bool)

(assert (=> b!632086 (=> (not res!408729) (not e!361379))))

(assert (=> b!632086 (= res!408729 (and (= lt!292083 (Found!6732 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18292 a!2986) index!984) (select (arr!18292 a!2986) j!136))) (not (= (select (arr!18292 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38119 (_ BitVec 32)) SeekEntryResult!6732)

(assert (=> b!632086 (= lt!292083 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18292 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!632087 () Bool)

(declare-fun res!408731 () Bool)

(assert (=> b!632087 (=> (not res!408731) (not e!361384))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38119 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!632087 (= res!408731 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!632088 () Bool)

(declare-fun res!408740 () Bool)

(assert (=> b!632088 (=> (not res!408740) (not e!361384))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!632088 (= res!408740 (validKeyInArray!0 (select (arr!18292 a!2986) j!136)))))

(declare-fun res!408736 () Bool)

(assert (=> start!57100 (=> (not res!408736) (not e!361384))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57100 (= res!408736 (validMask!0 mask!3053))))

(assert (=> start!57100 e!361384))

(assert (=> start!57100 true))

(declare-fun array_inv!14088 (array!38119) Bool)

(assert (=> start!57100 (array_inv!14088 a!2986)))

(declare-fun b!632089 () Bool)

(declare-fun res!408732 () Bool)

(assert (=> b!632089 (=> (not res!408732) (not e!361384))))

(assert (=> b!632089 (= res!408732 (validKeyInArray!0 k0!1786))))

(declare-fun b!632090 () Bool)

(declare-fun e!361385 () Bool)

(assert (=> b!632090 (= e!361379 (not e!361385))))

(declare-fun res!408734 () Bool)

(assert (=> b!632090 (=> res!408734 e!361385)))

(declare-fun lt!292077 () SeekEntryResult!6732)

(assert (=> b!632090 (= res!408734 (not (= lt!292077 (Found!6732 index!984))))))

(declare-fun lt!292079 () Unit!21262)

(assert (=> b!632090 (= lt!292079 e!361380)))

(declare-fun c!72044 () Bool)

(assert (=> b!632090 (= c!72044 (= lt!292077 Undefined!6732))))

(declare-fun lt!292078 () array!38119)

(declare-fun lt!292076 () (_ BitVec 64))

(assert (=> b!632090 (= lt!292077 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!292076 lt!292078 mask!3053))))

(assert (=> b!632090 e!361382))

(declare-fun res!408733 () Bool)

(assert (=> b!632090 (=> (not res!408733) (not e!361382))))

(declare-fun lt!292082 () (_ BitVec 32))

(assert (=> b!632090 (= res!408733 (= lt!292080 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292082 vacantSpotIndex!68 lt!292076 lt!292078 mask!3053)))))

(assert (=> b!632090 (= lt!292080 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292082 vacantSpotIndex!68 (select (arr!18292 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!632090 (= lt!292076 (select (store (arr!18292 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!292084 () Unit!21262)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38119 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21262)

(assert (=> b!632090 (= lt!292084 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292082 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!632090 (= lt!292082 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!632091 () Bool)

(declare-fun res!408737 () Bool)

(assert (=> b!632091 (=> (not res!408737) (not e!361386))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38119 (_ BitVec 32)) Bool)

(assert (=> b!632091 (= res!408737 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!632092 () Bool)

(declare-fun Unit!21265 () Unit!21262)

(assert (=> b!632092 (= e!361380 Unit!21265)))

(declare-fun b!632093 () Bool)

(assert (=> b!632093 (= e!361386 e!361383)))

(declare-fun res!408739 () Bool)

(assert (=> b!632093 (=> (not res!408739) (not e!361383))))

(assert (=> b!632093 (= res!408739 (= (select (store (arr!18292 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!632093 (= lt!292078 (array!38120 (store (arr!18292 a!2986) i!1108 k0!1786) (size!18656 a!2986)))))

(declare-fun b!632094 () Bool)

(assert (=> b!632094 (= e!361384 e!361386)))

(declare-fun res!408730 () Bool)

(assert (=> b!632094 (=> (not res!408730) (not e!361386))))

(declare-fun lt!292081 () SeekEntryResult!6732)

(assert (=> b!632094 (= res!408730 (or (= lt!292081 (MissingZero!6732 i!1108)) (= lt!292081 (MissingVacant!6732 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38119 (_ BitVec 32)) SeekEntryResult!6732)

(assert (=> b!632094 (= lt!292081 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!632095 () Bool)

(assert (=> b!632095 (= e!361385 true)))

(assert (=> b!632095 (= (select (store (arr!18292 a!2986) i!1108 k0!1786) index!984) (select (arr!18292 a!2986) j!136))))

(declare-fun b!632096 () Bool)

(declare-fun res!408738 () Bool)

(assert (=> b!632096 (=> (not res!408738) (not e!361386))))

(declare-datatypes ((List!12333 0))(
  ( (Nil!12330) (Cons!12329 (h!13374 (_ BitVec 64)) (t!18561 List!12333)) )
))
(declare-fun arrayNoDuplicates!0 (array!38119 (_ BitVec 32) List!12333) Bool)

(assert (=> b!632096 (= res!408738 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12330))))

(assert (= (and start!57100 res!408736) b!632082))

(assert (= (and b!632082 res!408728) b!632088))

(assert (= (and b!632088 res!408740) b!632089))

(assert (= (and b!632089 res!408732) b!632087))

(assert (= (and b!632087 res!408731) b!632094))

(assert (= (and b!632094 res!408730) b!632091))

(assert (= (and b!632091 res!408737) b!632096))

(assert (= (and b!632096 res!408738) b!632084))

(assert (= (and b!632084 res!408735) b!632093))

(assert (= (and b!632093 res!408739) b!632086))

(assert (= (and b!632086 res!408729) b!632090))

(assert (= (and b!632090 res!408733) b!632085))

(assert (= (and b!632090 c!72044) b!632083))

(assert (= (and b!632090 (not c!72044)) b!632092))

(assert (= (and b!632090 (not res!408734)) b!632095))

(declare-fun m!606933 () Bool)

(assert (=> b!632089 m!606933))

(declare-fun m!606935 () Bool)

(assert (=> b!632088 m!606935))

(assert (=> b!632088 m!606935))

(declare-fun m!606937 () Bool)

(assert (=> b!632088 m!606937))

(declare-fun m!606939 () Bool)

(assert (=> b!632094 m!606939))

(declare-fun m!606941 () Bool)

(assert (=> b!632090 m!606941))

(assert (=> b!632090 m!606935))

(declare-fun m!606943 () Bool)

(assert (=> b!632090 m!606943))

(declare-fun m!606945 () Bool)

(assert (=> b!632090 m!606945))

(declare-fun m!606947 () Bool)

(assert (=> b!632090 m!606947))

(declare-fun m!606949 () Bool)

(assert (=> b!632090 m!606949))

(assert (=> b!632090 m!606935))

(declare-fun m!606951 () Bool)

(assert (=> b!632090 m!606951))

(declare-fun m!606953 () Bool)

(assert (=> b!632090 m!606953))

(declare-fun m!606955 () Bool)

(assert (=> b!632087 m!606955))

(declare-fun m!606957 () Bool)

(assert (=> b!632084 m!606957))

(declare-fun m!606959 () Bool)

(assert (=> start!57100 m!606959))

(declare-fun m!606961 () Bool)

(assert (=> start!57100 m!606961))

(declare-fun m!606963 () Bool)

(assert (=> b!632086 m!606963))

(assert (=> b!632086 m!606935))

(assert (=> b!632086 m!606935))

(declare-fun m!606965 () Bool)

(assert (=> b!632086 m!606965))

(declare-fun m!606967 () Bool)

(assert (=> b!632091 m!606967))

(assert (=> b!632093 m!606943))

(declare-fun m!606969 () Bool)

(assert (=> b!632093 m!606969))

(declare-fun m!606971 () Bool)

(assert (=> b!632096 m!606971))

(assert (=> b!632095 m!606943))

(declare-fun m!606973 () Bool)

(assert (=> b!632095 m!606973))

(assert (=> b!632095 m!606935))

(check-sat (not b!632086) (not b!632090) (not b!632096) (not b!632094) (not start!57100) (not b!632089) (not b!632088) (not b!632087) (not b!632091))
(check-sat)
