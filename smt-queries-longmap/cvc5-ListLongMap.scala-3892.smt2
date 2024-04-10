; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53362 () Bool)

(assert start!53362)

(declare-fun b!580401 () Bool)

(declare-fun res!368222 () Bool)

(declare-fun e!333320 () Bool)

(assert (=> b!580401 (=> (not res!368222) (not e!333320))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36263 0))(
  ( (array!36264 (arr!17406 (Array (_ BitVec 32) (_ BitVec 64))) (size!17770 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36263)

(assert (=> b!580401 (= res!368222 (and (= (size!17770 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17770 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17770 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!368224 () Bool)

(assert (=> start!53362 (=> (not res!368224) (not e!333320))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53362 (= res!368224 (validMask!0 mask!3053))))

(assert (=> start!53362 e!333320))

(assert (=> start!53362 true))

(declare-fun array_inv!13202 (array!36263) Bool)

(assert (=> start!53362 (array_inv!13202 a!2986)))

(declare-fun b!580402 () Bool)

(declare-fun res!368225 () Bool)

(declare-fun e!333321 () Bool)

(assert (=> b!580402 (=> (not res!368225) (not e!333321))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36263 (_ BitVec 32)) Bool)

(assert (=> b!580402 (= res!368225 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!580403 () Bool)

(declare-fun res!368221 () Bool)

(assert (=> b!580403 (=> (not res!368221) (not e!333321))))

(declare-datatypes ((List!11447 0))(
  ( (Nil!11444) (Cons!11443 (h!12488 (_ BitVec 64)) (t!17675 List!11447)) )
))
(declare-fun arrayNoDuplicates!0 (array!36263 (_ BitVec 32) List!11447) Bool)

(assert (=> b!580403 (= res!368221 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11444))))

(declare-fun b!580404 () Bool)

(declare-fun res!368223 () Bool)

(assert (=> b!580404 (=> (not res!368223) (not e!333320))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36263 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!580404 (= res!368223 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!580405 () Bool)

(declare-fun res!368217 () Bool)

(assert (=> b!580405 (=> (not res!368217) (not e!333320))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!580405 (= res!368217 (validKeyInArray!0 k!1786))))

(declare-fun b!580406 () Bool)

(declare-fun res!368220 () Bool)

(assert (=> b!580406 (=> (not res!368220) (not e!333321))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!580406 (= res!368220 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17406 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17406 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!580407 () Bool)

(assert (=> b!580407 (= e!333321 false)))

(declare-datatypes ((SeekEntryResult!5846 0))(
  ( (MissingZero!5846 (index!25611 (_ BitVec 32))) (Found!5846 (index!25612 (_ BitVec 32))) (Intermediate!5846 (undefined!6658 Bool) (index!25613 (_ BitVec 32)) (x!54491 (_ BitVec 32))) (Undefined!5846) (MissingVacant!5846 (index!25614 (_ BitVec 32))) )
))
(declare-fun lt!264697 () SeekEntryResult!5846)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36263 (_ BitVec 32)) SeekEntryResult!5846)

(assert (=> b!580407 (= lt!264697 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17406 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!580408 () Bool)

(assert (=> b!580408 (= e!333320 e!333321)))

(declare-fun res!368218 () Bool)

(assert (=> b!580408 (=> (not res!368218) (not e!333321))))

(declare-fun lt!264696 () SeekEntryResult!5846)

(assert (=> b!580408 (= res!368218 (or (= lt!264696 (MissingZero!5846 i!1108)) (= lt!264696 (MissingVacant!5846 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36263 (_ BitVec 32)) SeekEntryResult!5846)

(assert (=> b!580408 (= lt!264696 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!580409 () Bool)

(declare-fun res!368219 () Bool)

(assert (=> b!580409 (=> (not res!368219) (not e!333320))))

(assert (=> b!580409 (= res!368219 (validKeyInArray!0 (select (arr!17406 a!2986) j!136)))))

(assert (= (and start!53362 res!368224) b!580401))

(assert (= (and b!580401 res!368222) b!580409))

(assert (= (and b!580409 res!368219) b!580405))

(assert (= (and b!580405 res!368217) b!580404))

(assert (= (and b!580404 res!368223) b!580408))

(assert (= (and b!580408 res!368218) b!580402))

(assert (= (and b!580402 res!368225) b!580403))

(assert (= (and b!580403 res!368221) b!580406))

(assert (= (and b!580406 res!368220) b!580407))

(declare-fun m!558985 () Bool)

(assert (=> start!53362 m!558985))

(declare-fun m!558987 () Bool)

(assert (=> start!53362 m!558987))

(declare-fun m!558989 () Bool)

(assert (=> b!580409 m!558989))

(assert (=> b!580409 m!558989))

(declare-fun m!558991 () Bool)

(assert (=> b!580409 m!558991))

(declare-fun m!558993 () Bool)

(assert (=> b!580408 m!558993))

(assert (=> b!580407 m!558989))

(assert (=> b!580407 m!558989))

(declare-fun m!558995 () Bool)

(assert (=> b!580407 m!558995))

(declare-fun m!558997 () Bool)

(assert (=> b!580402 m!558997))

(declare-fun m!558999 () Bool)

(assert (=> b!580405 m!558999))

(declare-fun m!559001 () Bool)

(assert (=> b!580404 m!559001))

(declare-fun m!559003 () Bool)

(assert (=> b!580406 m!559003))

(declare-fun m!559005 () Bool)

(assert (=> b!580406 m!559005))

(declare-fun m!559007 () Bool)

(assert (=> b!580406 m!559007))

(declare-fun m!559009 () Bool)

(assert (=> b!580403 m!559009))

(push 1)

