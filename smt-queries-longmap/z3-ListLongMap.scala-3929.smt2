; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53586 () Bool)

(assert start!53586)

(declare-fun b!583470 () Bool)

(declare-fun res!371293 () Bool)

(declare-fun e!334327 () Bool)

(assert (=> b!583470 (=> (not res!371293) (not e!334327))))

(declare-datatypes ((array!36487 0))(
  ( (array!36488 (arr!17518 (Array (_ BitVec 32) (_ BitVec 64))) (size!17882 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36487)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36487 (_ BitVec 32)) Bool)

(assert (=> b!583470 (= res!371293 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!583471 () Bool)

(declare-fun res!371292 () Bool)

(declare-fun e!334328 () Bool)

(assert (=> b!583471 (=> (not res!371292) (not e!334328))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!583471 (= res!371292 (validKeyInArray!0 (select (arr!17518 a!2986) j!136)))))

(declare-fun b!583472 () Bool)

(declare-fun res!371290 () Bool)

(assert (=> b!583472 (=> (not res!371290) (not e!334327))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!583472 (= res!371290 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17518 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17518 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!583473 () Bool)

(declare-fun res!371289 () Bool)

(assert (=> b!583473 (=> (not res!371289) (not e!334328))))

(declare-fun arrayContainsKey!0 (array!36487 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!583473 (= res!371289 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!583475 () Bool)

(declare-fun res!371288 () Bool)

(assert (=> b!583475 (=> (not res!371288) (not e!334328))))

(assert (=> b!583475 (= res!371288 (and (= (size!17882 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17882 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17882 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!583476 () Bool)

(declare-fun res!371291 () Bool)

(assert (=> b!583476 (=> (not res!371291) (not e!334327))))

(declare-datatypes ((List!11559 0))(
  ( (Nil!11556) (Cons!11555 (h!12600 (_ BitVec 64)) (t!17787 List!11559)) )
))
(declare-fun arrayNoDuplicates!0 (array!36487 (_ BitVec 32) List!11559) Bool)

(assert (=> b!583476 (= res!371291 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11556))))

(declare-fun b!583477 () Bool)

(assert (=> b!583477 (= e!334327 false)))

(declare-datatypes ((SeekEntryResult!5958 0))(
  ( (MissingZero!5958 (index!26059 (_ BitVec 32))) (Found!5958 (index!26060 (_ BitVec 32))) (Intermediate!5958 (undefined!6770 Bool) (index!26061 (_ BitVec 32)) (x!54899 (_ BitVec 32))) (Undefined!5958) (MissingVacant!5958 (index!26062 (_ BitVec 32))) )
))
(declare-fun lt!265332 () SeekEntryResult!5958)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36487 (_ BitVec 32)) SeekEntryResult!5958)

(assert (=> b!583477 (= lt!265332 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17518 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!583478 () Bool)

(assert (=> b!583478 (= e!334328 e!334327)))

(declare-fun res!371287 () Bool)

(assert (=> b!583478 (=> (not res!371287) (not e!334327))))

(declare-fun lt!265333 () SeekEntryResult!5958)

(assert (=> b!583478 (= res!371287 (or (= lt!265333 (MissingZero!5958 i!1108)) (= lt!265333 (MissingVacant!5958 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36487 (_ BitVec 32)) SeekEntryResult!5958)

(assert (=> b!583478 (= lt!265333 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!371294 () Bool)

(assert (=> start!53586 (=> (not res!371294) (not e!334328))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53586 (= res!371294 (validMask!0 mask!3053))))

(assert (=> start!53586 e!334328))

(assert (=> start!53586 true))

(declare-fun array_inv!13314 (array!36487) Bool)

(assert (=> start!53586 (array_inv!13314 a!2986)))

(declare-fun b!583474 () Bool)

(declare-fun res!371286 () Bool)

(assert (=> b!583474 (=> (not res!371286) (not e!334328))))

(assert (=> b!583474 (= res!371286 (validKeyInArray!0 k0!1786))))

(assert (= (and start!53586 res!371294) b!583475))

(assert (= (and b!583475 res!371288) b!583471))

(assert (= (and b!583471 res!371292) b!583474))

(assert (= (and b!583474 res!371286) b!583473))

(assert (= (and b!583473 res!371289) b!583478))

(assert (= (and b!583478 res!371287) b!583470))

(assert (= (and b!583470 res!371293) b!583476))

(assert (= (and b!583476 res!371291) b!583472))

(assert (= (and b!583472 res!371290) b!583477))

(declare-fun m!561933 () Bool)

(assert (=> b!583473 m!561933))

(declare-fun m!561935 () Bool)

(assert (=> b!583472 m!561935))

(declare-fun m!561937 () Bool)

(assert (=> b!583472 m!561937))

(declare-fun m!561939 () Bool)

(assert (=> b!583472 m!561939))

(declare-fun m!561941 () Bool)

(assert (=> b!583478 m!561941))

(declare-fun m!561943 () Bool)

(assert (=> b!583471 m!561943))

(assert (=> b!583471 m!561943))

(declare-fun m!561945 () Bool)

(assert (=> b!583471 m!561945))

(assert (=> b!583477 m!561943))

(assert (=> b!583477 m!561943))

(declare-fun m!561947 () Bool)

(assert (=> b!583477 m!561947))

(declare-fun m!561949 () Bool)

(assert (=> b!583474 m!561949))

(declare-fun m!561951 () Bool)

(assert (=> b!583476 m!561951))

(declare-fun m!561953 () Bool)

(assert (=> b!583470 m!561953))

(declare-fun m!561955 () Bool)

(assert (=> start!53586 m!561955))

(declare-fun m!561957 () Bool)

(assert (=> start!53586 m!561957))

(check-sat (not b!583478) (not b!583476) (not b!583470) (not start!53586) (not b!583477) (not b!583471) (not b!583473) (not b!583474))
(check-sat)
