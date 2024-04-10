; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53378 () Bool)

(assert start!53378)

(declare-fun b!580618 () Bool)

(declare-fun res!368436 () Bool)

(declare-fun e!333391 () Bool)

(assert (=> b!580618 (=> (not res!368436) (not e!333391))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36279 0))(
  ( (array!36280 (arr!17414 (Array (_ BitVec 32) (_ BitVec 64))) (size!17778 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36279)

(assert (=> b!580618 (= res!368436 (and (= (size!17778 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17778 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17778 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!580619 () Bool)

(declare-fun res!368434 () Bool)

(declare-fun e!333392 () Bool)

(assert (=> b!580619 (=> (not res!368434) (not e!333392))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36279 (_ BitVec 32)) Bool)

(assert (=> b!580619 (= res!368434 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!580620 () Bool)

(declare-fun res!368435 () Bool)

(assert (=> b!580620 (=> (not res!368435) (not e!333392))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!580620 (= res!368435 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17414 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17414 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!580621 () Bool)

(declare-fun res!368433 () Bool)

(assert (=> b!580621 (=> (not res!368433) (not e!333391))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!580621 (= res!368433 (validKeyInArray!0 (select (arr!17414 a!2986) j!136)))))

(declare-fun b!580622 () Bool)

(declare-fun res!368441 () Bool)

(assert (=> b!580622 (=> (not res!368441) (not e!333391))))

(declare-fun arrayContainsKey!0 (array!36279 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!580622 (= res!368441 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!580623 () Bool)

(assert (=> b!580623 (= e!333391 e!333392)))

(declare-fun res!368440 () Bool)

(assert (=> b!580623 (=> (not res!368440) (not e!333392))))

(declare-datatypes ((SeekEntryResult!5854 0))(
  ( (MissingZero!5854 (index!25643 (_ BitVec 32))) (Found!5854 (index!25644 (_ BitVec 32))) (Intermediate!5854 (undefined!6666 Bool) (index!25645 (_ BitVec 32)) (x!54515 (_ BitVec 32))) (Undefined!5854) (MissingVacant!5854 (index!25646 (_ BitVec 32))) )
))
(declare-fun lt!264745 () SeekEntryResult!5854)

(assert (=> b!580623 (= res!368440 (or (= lt!264745 (MissingZero!5854 i!1108)) (= lt!264745 (MissingVacant!5854 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36279 (_ BitVec 32)) SeekEntryResult!5854)

(assert (=> b!580623 (= lt!264745 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!580624 () Bool)

(assert (=> b!580624 (= e!333392 false)))

(declare-fun lt!264744 () SeekEntryResult!5854)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36279 (_ BitVec 32)) SeekEntryResult!5854)

(assert (=> b!580624 (= lt!264744 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17414 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!580625 () Bool)

(declare-fun res!368438 () Bool)

(assert (=> b!580625 (=> (not res!368438) (not e!333391))))

(assert (=> b!580625 (= res!368438 (validKeyInArray!0 k!1786))))

(declare-fun b!580617 () Bool)

(declare-fun res!368439 () Bool)

(assert (=> b!580617 (=> (not res!368439) (not e!333392))))

(declare-datatypes ((List!11455 0))(
  ( (Nil!11452) (Cons!11451 (h!12496 (_ BitVec 64)) (t!17683 List!11455)) )
))
(declare-fun arrayNoDuplicates!0 (array!36279 (_ BitVec 32) List!11455) Bool)

(assert (=> b!580617 (= res!368439 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11452))))

(declare-fun res!368437 () Bool)

(assert (=> start!53378 (=> (not res!368437) (not e!333391))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53378 (= res!368437 (validMask!0 mask!3053))))

(assert (=> start!53378 e!333391))

(assert (=> start!53378 true))

(declare-fun array_inv!13210 (array!36279) Bool)

(assert (=> start!53378 (array_inv!13210 a!2986)))

(assert (= (and start!53378 res!368437) b!580618))

(assert (= (and b!580618 res!368436) b!580621))

(assert (= (and b!580621 res!368433) b!580625))

(assert (= (and b!580625 res!368438) b!580622))

(assert (= (and b!580622 res!368441) b!580623))

(assert (= (and b!580623 res!368440) b!580619))

(assert (= (and b!580619 res!368434) b!580617))

(assert (= (and b!580617 res!368439) b!580620))

(assert (= (and b!580620 res!368435) b!580624))

(declare-fun m!559193 () Bool)

(assert (=> b!580621 m!559193))

(assert (=> b!580621 m!559193))

(declare-fun m!559195 () Bool)

(assert (=> b!580621 m!559195))

(declare-fun m!559197 () Bool)

(assert (=> b!580623 m!559197))

(declare-fun m!559199 () Bool)

(assert (=> start!53378 m!559199))

(declare-fun m!559201 () Bool)

(assert (=> start!53378 m!559201))

(assert (=> b!580624 m!559193))

(assert (=> b!580624 m!559193))

(declare-fun m!559203 () Bool)

(assert (=> b!580624 m!559203))

(declare-fun m!559205 () Bool)

(assert (=> b!580622 m!559205))

(declare-fun m!559207 () Bool)

(assert (=> b!580619 m!559207))

(declare-fun m!559209 () Bool)

(assert (=> b!580617 m!559209))

(declare-fun m!559211 () Bool)

(assert (=> b!580620 m!559211))

(declare-fun m!559213 () Bool)

(assert (=> b!580620 m!559213))

(declare-fun m!559215 () Bool)

(assert (=> b!580620 m!559215))

(declare-fun m!559217 () Bool)

(assert (=> b!580625 m!559217))

(push 1)

(assert (not b!580619))

(assert (not b!580617))

(assert (not b!580622))

(assert (not b!580624))

(assert (not b!580623))

(assert (not b!580621))

(assert (not start!53378))

(assert (not b!580625))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

