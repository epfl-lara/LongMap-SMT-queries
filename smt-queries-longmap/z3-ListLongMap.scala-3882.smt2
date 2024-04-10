; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53304 () Bool)

(assert start!53304)

(declare-fun res!367437 () Bool)

(declare-fun e!333060 () Bool)

(assert (=> start!53304 (=> (not res!367437) (not e!333060))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53304 (= res!367437 (validMask!0 mask!3053))))

(assert (=> start!53304 e!333060))

(assert (=> start!53304 true))

(declare-datatypes ((array!36205 0))(
  ( (array!36206 (arr!17377 (Array (_ BitVec 32) (_ BitVec 64))) (size!17741 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36205)

(declare-fun array_inv!13173 (array!36205) Bool)

(assert (=> start!53304 (array_inv!13173 a!2986)))

(declare-fun b!579618 () Bool)

(declare-fun res!367442 () Bool)

(assert (=> b!579618 (=> (not res!367442) (not e!333060))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36205 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!579618 (= res!367442 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!579619 () Bool)

(declare-fun res!367435 () Bool)

(assert (=> b!579619 (=> (not res!367435) (not e!333060))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579619 (= res!367435 (validKeyInArray!0 (select (arr!17377 a!2986) j!136)))))

(declare-fun b!579620 () Bool)

(declare-fun res!367441 () Bool)

(assert (=> b!579620 (=> (not res!367441) (not e!333060))))

(assert (=> b!579620 (= res!367441 (validKeyInArray!0 k0!1786))))

(declare-fun b!579621 () Bool)

(declare-fun res!367438 () Bool)

(declare-fun e!333059 () Bool)

(assert (=> b!579621 (=> (not res!367438) (not e!333059))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!579621 (= res!367438 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17377 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17377 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!579622 () Bool)

(declare-fun res!367439 () Bool)

(assert (=> b!579622 (=> (not res!367439) (not e!333059))))

(declare-datatypes ((List!11418 0))(
  ( (Nil!11415) (Cons!11414 (h!12459 (_ BitVec 64)) (t!17646 List!11418)) )
))
(declare-fun arrayNoDuplicates!0 (array!36205 (_ BitVec 32) List!11418) Bool)

(assert (=> b!579622 (= res!367439 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11415))))

(declare-fun b!579623 () Bool)

(declare-fun res!367436 () Bool)

(assert (=> b!579623 (=> (not res!367436) (not e!333060))))

(assert (=> b!579623 (= res!367436 (and (= (size!17741 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17741 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17741 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!579624 () Bool)

(declare-fun res!367434 () Bool)

(assert (=> b!579624 (=> (not res!367434) (not e!333059))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36205 (_ BitVec 32)) Bool)

(assert (=> b!579624 (= res!367434 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!579625 () Bool)

(assert (=> b!579625 (= e!333060 e!333059)))

(declare-fun res!367440 () Bool)

(assert (=> b!579625 (=> (not res!367440) (not e!333059))))

(declare-datatypes ((SeekEntryResult!5817 0))(
  ( (MissingZero!5817 (index!25495 (_ BitVec 32))) (Found!5817 (index!25496 (_ BitVec 32))) (Intermediate!5817 (undefined!6629 Bool) (index!25497 (_ BitVec 32)) (x!54382 (_ BitVec 32))) (Undefined!5817) (MissingVacant!5817 (index!25498 (_ BitVec 32))) )
))
(declare-fun lt!264523 () SeekEntryResult!5817)

(assert (=> b!579625 (= res!367440 (or (= lt!264523 (MissingZero!5817 i!1108)) (= lt!264523 (MissingVacant!5817 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36205 (_ BitVec 32)) SeekEntryResult!5817)

(assert (=> b!579625 (= lt!264523 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!579626 () Bool)

(assert (=> b!579626 (= e!333059 false)))

(declare-fun lt!264522 () SeekEntryResult!5817)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36205 (_ BitVec 32)) SeekEntryResult!5817)

(assert (=> b!579626 (= lt!264522 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17377 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!53304 res!367437) b!579623))

(assert (= (and b!579623 res!367436) b!579619))

(assert (= (and b!579619 res!367435) b!579620))

(assert (= (and b!579620 res!367441) b!579618))

(assert (= (and b!579618 res!367442) b!579625))

(assert (= (and b!579625 res!367440) b!579624))

(assert (= (and b!579624 res!367434) b!579622))

(assert (= (and b!579622 res!367439) b!579621))

(assert (= (and b!579621 res!367438) b!579626))

(declare-fun m!558231 () Bool)

(assert (=> b!579621 m!558231))

(declare-fun m!558233 () Bool)

(assert (=> b!579621 m!558233))

(declare-fun m!558235 () Bool)

(assert (=> b!579621 m!558235))

(declare-fun m!558237 () Bool)

(assert (=> b!579619 m!558237))

(assert (=> b!579619 m!558237))

(declare-fun m!558239 () Bool)

(assert (=> b!579619 m!558239))

(declare-fun m!558241 () Bool)

(assert (=> b!579625 m!558241))

(assert (=> b!579626 m!558237))

(assert (=> b!579626 m!558237))

(declare-fun m!558243 () Bool)

(assert (=> b!579626 m!558243))

(declare-fun m!558245 () Bool)

(assert (=> start!53304 m!558245))

(declare-fun m!558247 () Bool)

(assert (=> start!53304 m!558247))

(declare-fun m!558249 () Bool)

(assert (=> b!579618 m!558249))

(declare-fun m!558251 () Bool)

(assert (=> b!579620 m!558251))

(declare-fun m!558253 () Bool)

(assert (=> b!579622 m!558253))

(declare-fun m!558255 () Bool)

(assert (=> b!579624 m!558255))

(check-sat (not b!579618) (not b!579622) (not start!53304) (not b!579626) (not b!579620) (not b!579624) (not b!579625) (not b!579619))
