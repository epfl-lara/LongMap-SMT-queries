; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53460 () Bool)

(assert start!53460)

(declare-fun b!581258 () Bool)

(declare-fun res!368975 () Bool)

(declare-fun e!333665 () Bool)

(assert (=> b!581258 (=> (not res!368975) (not e!333665))))

(declare-datatypes ((array!36306 0))(
  ( (array!36307 (arr!17425 (Array (_ BitVec 32) (_ BitVec 64))) (size!17789 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36306)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36306 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!581258 (= res!368975 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!581259 () Bool)

(declare-fun res!368970 () Bool)

(declare-fun e!333664 () Bool)

(assert (=> b!581259 (=> (not res!368970) (not e!333664))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!581259 (= res!368970 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17425 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17425 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!581260 () Bool)

(declare-fun res!368974 () Bool)

(assert (=> b!581260 (=> (not res!368974) (not e!333665))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!581260 (= res!368974 (validKeyInArray!0 k0!1786))))

(declare-fun b!581261 () Bool)

(declare-fun res!368977 () Bool)

(assert (=> b!581261 (=> (not res!368977) (not e!333665))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!581261 (= res!368977 (and (= (size!17789 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17789 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17789 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!581262 () Bool)

(declare-fun res!368971 () Bool)

(assert (=> b!581262 (=> (not res!368971) (not e!333665))))

(assert (=> b!581262 (= res!368971 (validKeyInArray!0 (select (arr!17425 a!2986) j!136)))))

(declare-fun b!581264 () Bool)

(declare-fun res!368969 () Bool)

(assert (=> b!581264 (=> (not res!368969) (not e!333664))))

(declare-datatypes ((List!11373 0))(
  ( (Nil!11370) (Cons!11369 (h!12417 (_ BitVec 64)) (t!17593 List!11373)) )
))
(declare-fun arrayNoDuplicates!0 (array!36306 (_ BitVec 32) List!11373) Bool)

(assert (=> b!581264 (= res!368969 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11370))))

(declare-fun b!581265 () Bool)

(assert (=> b!581265 (= e!333664 false)))

(declare-datatypes ((SeekEntryResult!5821 0))(
  ( (MissingZero!5821 (index!25511 (_ BitVec 32))) (Found!5821 (index!25512 (_ BitVec 32))) (Intermediate!5821 (undefined!6633 Bool) (index!25513 (_ BitVec 32)) (x!54533 (_ BitVec 32))) (Undefined!5821) (MissingVacant!5821 (index!25514 (_ BitVec 32))) )
))
(declare-fun lt!264943 () SeekEntryResult!5821)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36306 (_ BitVec 32)) SeekEntryResult!5821)

(assert (=> b!581265 (= lt!264943 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17425 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!581266 () Bool)

(assert (=> b!581266 (= e!333665 e!333664)))

(declare-fun res!368976 () Bool)

(assert (=> b!581266 (=> (not res!368976) (not e!333664))))

(declare-fun lt!264942 () SeekEntryResult!5821)

(assert (=> b!581266 (= res!368976 (or (= lt!264942 (MissingZero!5821 i!1108)) (= lt!264942 (MissingVacant!5821 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36306 (_ BitVec 32)) SeekEntryResult!5821)

(assert (=> b!581266 (= lt!264942 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!581263 () Bool)

(declare-fun res!368972 () Bool)

(assert (=> b!581263 (=> (not res!368972) (not e!333664))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36306 (_ BitVec 32)) Bool)

(assert (=> b!581263 (= res!368972 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!368973 () Bool)

(assert (=> start!53460 (=> (not res!368973) (not e!333665))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53460 (= res!368973 (validMask!0 mask!3053))))

(assert (=> start!53460 e!333665))

(assert (=> start!53460 true))

(declare-fun array_inv!13284 (array!36306) Bool)

(assert (=> start!53460 (array_inv!13284 a!2986)))

(assert (= (and start!53460 res!368973) b!581261))

(assert (= (and b!581261 res!368977) b!581262))

(assert (= (and b!581262 res!368971) b!581260))

(assert (= (and b!581260 res!368974) b!581258))

(assert (= (and b!581258 res!368975) b!581266))

(assert (= (and b!581266 res!368976) b!581263))

(assert (= (and b!581263 res!368972) b!581264))

(assert (= (and b!581264 res!368969) b!581259))

(assert (= (and b!581259 res!368970) b!581265))

(declare-fun m!559967 () Bool)

(assert (=> b!581263 m!559967))

(declare-fun m!559969 () Bool)

(assert (=> b!581266 m!559969))

(declare-fun m!559971 () Bool)

(assert (=> b!581258 m!559971))

(declare-fun m!559973 () Bool)

(assert (=> b!581259 m!559973))

(declare-fun m!559975 () Bool)

(assert (=> b!581259 m!559975))

(declare-fun m!559977 () Bool)

(assert (=> b!581259 m!559977))

(declare-fun m!559979 () Bool)

(assert (=> start!53460 m!559979))

(declare-fun m!559981 () Bool)

(assert (=> start!53460 m!559981))

(declare-fun m!559983 () Bool)

(assert (=> b!581262 m!559983))

(assert (=> b!581262 m!559983))

(declare-fun m!559985 () Bool)

(assert (=> b!581262 m!559985))

(declare-fun m!559987 () Bool)

(assert (=> b!581260 m!559987))

(assert (=> b!581265 m!559983))

(assert (=> b!581265 m!559983))

(declare-fun m!559989 () Bool)

(assert (=> b!581265 m!559989))

(declare-fun m!559991 () Bool)

(assert (=> b!581264 m!559991))

(check-sat (not b!581265) (not b!581262) (not start!53460) (not b!581258) (not b!581263) (not b!581266) (not b!581260) (not b!581264))
(check-sat)
