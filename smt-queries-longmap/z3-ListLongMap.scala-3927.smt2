; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53622 () Bool)

(assert start!53622)

(declare-fun b!583474 () Bool)

(declare-fun res!371194 () Bool)

(declare-fun e!334393 () Bool)

(assert (=> b!583474 (=> (not res!371194) (not e!334393))))

(declare-datatypes ((array!36468 0))(
  ( (array!36469 (arr!17506 (Array (_ BitVec 32) (_ BitVec 64))) (size!17870 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36468)

(declare-datatypes ((List!11454 0))(
  ( (Nil!11451) (Cons!11450 (h!12498 (_ BitVec 64)) (t!17674 List!11454)) )
))
(declare-fun arrayNoDuplicates!0 (array!36468 (_ BitVec 32) List!11454) Bool)

(assert (=> b!583474 (= res!371194 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11451))))

(declare-fun b!583475 () Bool)

(declare-fun res!371193 () Bool)

(declare-fun e!334395 () Bool)

(assert (=> b!583475 (=> (not res!371193) (not e!334395))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!583475 (= res!371193 (validKeyInArray!0 (select (arr!17506 a!2986) j!136)))))

(declare-fun b!583476 () Bool)

(assert (=> b!583476 (= e!334395 e!334393)))

(declare-fun res!371187 () Bool)

(assert (=> b!583476 (=> (not res!371187) (not e!334393))))

(declare-datatypes ((SeekEntryResult!5902 0))(
  ( (MissingZero!5902 (index!25835 (_ BitVec 32))) (Found!5902 (index!25836 (_ BitVec 32))) (Intermediate!5902 (undefined!6714 Bool) (index!25837 (_ BitVec 32)) (x!54830 (_ BitVec 32))) (Undefined!5902) (MissingVacant!5902 (index!25838 (_ BitVec 32))) )
))
(declare-fun lt!265408 () SeekEntryResult!5902)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!583476 (= res!371187 (or (= lt!265408 (MissingZero!5902 i!1108)) (= lt!265408 (MissingVacant!5902 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36468 (_ BitVec 32)) SeekEntryResult!5902)

(assert (=> b!583476 (= lt!265408 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!583477 () Bool)

(declare-fun res!371185 () Bool)

(assert (=> b!583477 (=> (not res!371185) (not e!334395))))

(assert (=> b!583477 (= res!371185 (and (= (size!17870 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17870 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17870 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!583478 () Bool)

(declare-fun res!371191 () Bool)

(assert (=> b!583478 (=> (not res!371191) (not e!334393))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36468 (_ BitVec 32)) SeekEntryResult!5902)

(assert (=> b!583478 (= res!371191 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17506 a!2986) j!136) a!2986 mask!3053) (Found!5902 j!136)))))

(declare-fun b!583479 () Bool)

(declare-fun res!371186 () Bool)

(assert (=> b!583479 (=> (not res!371186) (not e!334393))))

(assert (=> b!583479 (= res!371186 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17506 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17506 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!583481 () Bool)

(declare-fun res!371190 () Bool)

(assert (=> b!583481 (=> (not res!371190) (not e!334393))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36468 (_ BitVec 32)) Bool)

(assert (=> b!583481 (= res!371190 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!583482 () Bool)

(declare-fun res!371192 () Bool)

(assert (=> b!583482 (=> (not res!371192) (not e!334395))))

(assert (=> b!583482 (= res!371192 (validKeyInArray!0 k0!1786))))

(declare-fun b!583483 () Bool)

(declare-fun res!371189 () Bool)

(assert (=> b!583483 (=> (not res!371189) (not e!334395))))

(declare-fun arrayContainsKey!0 (array!36468 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!583483 (= res!371189 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!583480 () Bool)

(assert (=> b!583480 (= e!334393 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17506 a!2986) index!984) (select (arr!17506 a!2986) j!136))) (not (= (select (arr!17506 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136)) (bvslt mask!3053 #b00000000000000000000000000000000)))))

(declare-fun res!371188 () Bool)

(assert (=> start!53622 (=> (not res!371188) (not e!334395))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53622 (= res!371188 (validMask!0 mask!3053))))

(assert (=> start!53622 e!334395))

(assert (=> start!53622 true))

(declare-fun array_inv!13365 (array!36468) Bool)

(assert (=> start!53622 (array_inv!13365 a!2986)))

(assert (= (and start!53622 res!371188) b!583477))

(assert (= (and b!583477 res!371185) b!583475))

(assert (= (and b!583475 res!371193) b!583482))

(assert (= (and b!583482 res!371192) b!583483))

(assert (= (and b!583483 res!371189) b!583476))

(assert (= (and b!583476 res!371187) b!583481))

(assert (= (and b!583481 res!371190) b!583474))

(assert (= (and b!583474 res!371194) b!583479))

(assert (= (and b!583479 res!371186) b!583478))

(assert (= (and b!583478 res!371191) b!583480))

(declare-fun m!562097 () Bool)

(assert (=> b!583475 m!562097))

(assert (=> b!583475 m!562097))

(declare-fun m!562099 () Bool)

(assert (=> b!583475 m!562099))

(declare-fun m!562101 () Bool)

(assert (=> start!53622 m!562101))

(declare-fun m!562103 () Bool)

(assert (=> start!53622 m!562103))

(declare-fun m!562105 () Bool)

(assert (=> b!583480 m!562105))

(assert (=> b!583480 m!562097))

(declare-fun m!562107 () Bool)

(assert (=> b!583481 m!562107))

(declare-fun m!562109 () Bool)

(assert (=> b!583483 m!562109))

(assert (=> b!583478 m!562097))

(assert (=> b!583478 m!562097))

(declare-fun m!562111 () Bool)

(assert (=> b!583478 m!562111))

(declare-fun m!562113 () Bool)

(assert (=> b!583474 m!562113))

(declare-fun m!562115 () Bool)

(assert (=> b!583479 m!562115))

(declare-fun m!562117 () Bool)

(assert (=> b!583479 m!562117))

(declare-fun m!562119 () Bool)

(assert (=> b!583479 m!562119))

(declare-fun m!562121 () Bool)

(assert (=> b!583476 m!562121))

(declare-fun m!562123 () Bool)

(assert (=> b!583482 m!562123))

(check-sat (not b!583475) (not start!53622) (not b!583482) (not b!583478) (not b!583481) (not b!583474) (not b!583483) (not b!583476))
(check-sat)
