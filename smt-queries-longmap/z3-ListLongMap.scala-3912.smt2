; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53532 () Bool)

(assert start!53532)

(declare-fun b!582257 () Bool)

(declare-fun res!369973 () Bool)

(declare-fun e!333989 () Bool)

(assert (=> b!582257 (=> (not res!369973) (not e!333989))))

(declare-datatypes ((array!36378 0))(
  ( (array!36379 (arr!17461 (Array (_ BitVec 32) (_ BitVec 64))) (size!17825 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36378)

(declare-datatypes ((List!11409 0))(
  ( (Nil!11406) (Cons!11405 (h!12453 (_ BitVec 64)) (t!17629 List!11409)) )
))
(declare-fun arrayNoDuplicates!0 (array!36378 (_ BitVec 32) List!11409) Bool)

(assert (=> b!582257 (= res!369973 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11406))))

(declare-fun b!582258 () Bool)

(declare-fun res!369972 () Bool)

(declare-fun e!333988 () Bool)

(assert (=> b!582258 (=> (not res!369972) (not e!333988))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!582258 (= res!369972 (validKeyInArray!0 k0!1786))))

(declare-fun b!582259 () Bool)

(declare-fun res!369969 () Bool)

(assert (=> b!582259 (=> (not res!369969) (not e!333988))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!582259 (= res!369969 (validKeyInArray!0 (select (arr!17461 a!2986) j!136)))))

(declare-fun b!582260 () Bool)

(declare-fun res!369971 () Bool)

(assert (=> b!582260 (=> (not res!369971) (not e!333988))))

(declare-fun arrayContainsKey!0 (array!36378 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!582260 (= res!369971 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!582261 () Bool)

(declare-fun res!369970 () Bool)

(assert (=> b!582261 (=> (not res!369970) (not e!333989))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36378 (_ BitVec 32)) Bool)

(assert (=> b!582261 (= res!369970 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!582262 () Bool)

(declare-fun res!369975 () Bool)

(assert (=> b!582262 (=> (not res!369975) (not e!333988))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!582262 (= res!369975 (and (= (size!17825 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17825 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17825 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!369974 () Bool)

(assert (=> start!53532 (=> (not res!369974) (not e!333988))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53532 (= res!369974 (validMask!0 mask!3053))))

(assert (=> start!53532 e!333988))

(assert (=> start!53532 true))

(declare-fun array_inv!13320 (array!36378) Bool)

(assert (=> start!53532 (array_inv!13320 a!2986)))

(declare-fun b!582263 () Bool)

(assert (=> b!582263 (= e!333988 e!333989)))

(declare-fun res!369976 () Bool)

(assert (=> b!582263 (=> (not res!369976) (not e!333989))))

(declare-datatypes ((SeekEntryResult!5857 0))(
  ( (MissingZero!5857 (index!25655 (_ BitVec 32))) (Found!5857 (index!25656 (_ BitVec 32))) (Intermediate!5857 (undefined!6669 Bool) (index!25657 (_ BitVec 32)) (x!54665 (_ BitVec 32))) (Undefined!5857) (MissingVacant!5857 (index!25658 (_ BitVec 32))) )
))
(declare-fun lt!265141 () SeekEntryResult!5857)

(assert (=> b!582263 (= res!369976 (or (= lt!265141 (MissingZero!5857 i!1108)) (= lt!265141 (MissingVacant!5857 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36378 (_ BitVec 32)) SeekEntryResult!5857)

(assert (=> b!582263 (= lt!265141 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!582264 () Bool)

(assert (=> b!582264 (= e!333989 false)))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!265140 () SeekEntryResult!5857)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36378 (_ BitVec 32)) SeekEntryResult!5857)

(assert (=> b!582264 (= lt!265140 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17461 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!582265 () Bool)

(declare-fun res!369968 () Bool)

(assert (=> b!582265 (=> (not res!369968) (not e!333989))))

(assert (=> b!582265 (= res!369968 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17461 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17461 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!53532 res!369974) b!582262))

(assert (= (and b!582262 res!369975) b!582259))

(assert (= (and b!582259 res!369969) b!582258))

(assert (= (and b!582258 res!369972) b!582260))

(assert (= (and b!582260 res!369971) b!582263))

(assert (= (and b!582263 res!369976) b!582261))

(assert (= (and b!582261 res!369970) b!582257))

(assert (= (and b!582257 res!369973) b!582265))

(assert (= (and b!582265 res!369968) b!582264))

(declare-fun m!560927 () Bool)

(assert (=> b!582264 m!560927))

(assert (=> b!582264 m!560927))

(declare-fun m!560929 () Bool)

(assert (=> b!582264 m!560929))

(declare-fun m!560931 () Bool)

(assert (=> b!582260 m!560931))

(declare-fun m!560933 () Bool)

(assert (=> b!582258 m!560933))

(declare-fun m!560935 () Bool)

(assert (=> b!582261 m!560935))

(declare-fun m!560937 () Bool)

(assert (=> b!582257 m!560937))

(assert (=> b!582259 m!560927))

(assert (=> b!582259 m!560927))

(declare-fun m!560939 () Bool)

(assert (=> b!582259 m!560939))

(declare-fun m!560941 () Bool)

(assert (=> b!582263 m!560941))

(declare-fun m!560943 () Bool)

(assert (=> b!582265 m!560943))

(declare-fun m!560945 () Bool)

(assert (=> b!582265 m!560945))

(declare-fun m!560947 () Bool)

(assert (=> b!582265 m!560947))

(declare-fun m!560949 () Bool)

(assert (=> start!53532 m!560949))

(declare-fun m!560951 () Bool)

(assert (=> start!53532 m!560951))

(check-sat (not b!582263) (not b!582258) (not b!582257) (not start!53532) (not b!582261) (not b!582264) (not b!582260) (not b!582259))
(check-sat)
