; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53262 () Bool)

(assert start!53262)

(declare-fun b!578996 () Bool)

(declare-fun res!366956 () Bool)

(declare-fun e!332767 () Bool)

(assert (=> b!578996 (=> (not res!366956) (not e!332767))))

(declare-datatypes ((array!36177 0))(
  ( (array!36178 (arr!17363 (Array (_ BitVec 32) (_ BitVec 64))) (size!17728 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36177)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36177 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578996 (= res!366956 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!578997 () Bool)

(declare-fun res!366960 () Bool)

(declare-fun e!332768 () Bool)

(assert (=> b!578997 (=> (not res!366960) (not e!332768))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!578997 (= res!366960 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17363 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17363 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!578998 () Bool)

(assert (=> b!578998 (= e!332768 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5800 0))(
  ( (MissingZero!5800 (index!25427 (_ BitVec 32))) (Found!5800 (index!25428 (_ BitVec 32))) (Intermediate!5800 (undefined!6612 Bool) (index!25429 (_ BitVec 32)) (x!54328 (_ BitVec 32))) (Undefined!5800) (MissingVacant!5800 (index!25430 (_ BitVec 32))) )
))
(declare-fun lt!264210 () SeekEntryResult!5800)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36177 (_ BitVec 32)) SeekEntryResult!5800)

(assert (=> b!578998 (= lt!264210 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17363 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!578999 () Bool)

(declare-fun res!366962 () Bool)

(assert (=> b!578999 (=> (not res!366962) (not e!332768))))

(declare-datatypes ((List!11443 0))(
  ( (Nil!11440) (Cons!11439 (h!12484 (_ BitVec 64)) (t!17662 List!11443)) )
))
(declare-fun arrayNoDuplicates!0 (array!36177 (_ BitVec 32) List!11443) Bool)

(assert (=> b!578999 (= res!366962 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11440))))

(declare-fun b!579000 () Bool)

(declare-fun res!366955 () Bool)

(assert (=> b!579000 (=> (not res!366955) (not e!332768))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36177 (_ BitVec 32)) Bool)

(assert (=> b!579000 (= res!366955 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!366961 () Bool)

(assert (=> start!53262 (=> (not res!366961) (not e!332767))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53262 (= res!366961 (validMask!0 mask!3053))))

(assert (=> start!53262 e!332767))

(assert (=> start!53262 true))

(declare-fun array_inv!13246 (array!36177) Bool)

(assert (=> start!53262 (array_inv!13246 a!2986)))

(declare-fun b!579001 () Bool)

(declare-fun res!366957 () Bool)

(assert (=> b!579001 (=> (not res!366957) (not e!332767))))

(assert (=> b!579001 (= res!366957 (and (= (size!17728 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17728 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17728 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!579002 () Bool)

(assert (=> b!579002 (= e!332767 e!332768)))

(declare-fun res!366958 () Bool)

(assert (=> b!579002 (=> (not res!366958) (not e!332768))))

(declare-fun lt!264211 () SeekEntryResult!5800)

(assert (=> b!579002 (= res!366958 (or (= lt!264211 (MissingZero!5800 i!1108)) (= lt!264211 (MissingVacant!5800 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36177 (_ BitVec 32)) SeekEntryResult!5800)

(assert (=> b!579002 (= lt!264211 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!579003 () Bool)

(declare-fun res!366959 () Bool)

(assert (=> b!579003 (=> (not res!366959) (not e!332767))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579003 (= res!366959 (validKeyInArray!0 k0!1786))))

(declare-fun b!579004 () Bool)

(declare-fun res!366954 () Bool)

(assert (=> b!579004 (=> (not res!366954) (not e!332767))))

(assert (=> b!579004 (= res!366954 (validKeyInArray!0 (select (arr!17363 a!2986) j!136)))))

(assert (= (and start!53262 res!366961) b!579001))

(assert (= (and b!579001 res!366957) b!579004))

(assert (= (and b!579004 res!366954) b!579003))

(assert (= (and b!579003 res!366959) b!578996))

(assert (= (and b!578996 res!366956) b!579002))

(assert (= (and b!579002 res!366958) b!579000))

(assert (= (and b!579000 res!366955) b!578999))

(assert (= (and b!578999 res!366962) b!578997))

(assert (= (and b!578997 res!366960) b!578998))

(declare-fun m!557107 () Bool)

(assert (=> start!53262 m!557107))

(declare-fun m!557109 () Bool)

(assert (=> start!53262 m!557109))

(declare-fun m!557111 () Bool)

(assert (=> b!579004 m!557111))

(assert (=> b!579004 m!557111))

(declare-fun m!557113 () Bool)

(assert (=> b!579004 m!557113))

(declare-fun m!557115 () Bool)

(assert (=> b!579003 m!557115))

(assert (=> b!578998 m!557111))

(assert (=> b!578998 m!557111))

(declare-fun m!557117 () Bool)

(assert (=> b!578998 m!557117))

(declare-fun m!557119 () Bool)

(assert (=> b!579000 m!557119))

(declare-fun m!557121 () Bool)

(assert (=> b!578999 m!557121))

(declare-fun m!557123 () Bool)

(assert (=> b!578996 m!557123))

(declare-fun m!557125 () Bool)

(assert (=> b!579002 m!557125))

(declare-fun m!557127 () Bool)

(assert (=> b!578997 m!557127))

(declare-fun m!557129 () Bool)

(assert (=> b!578997 m!557129))

(declare-fun m!557131 () Bool)

(assert (=> b!578997 m!557131))

(check-sat (not b!578996) (not b!579002) (not b!578999) (not b!579004) (not b!579000) (not b!578998) (not start!53262) (not b!579003))
(check-sat)
