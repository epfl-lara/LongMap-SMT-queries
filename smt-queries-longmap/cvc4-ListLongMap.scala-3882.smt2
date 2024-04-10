; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53306 () Bool)

(assert start!53306)

(declare-fun b!579645 () Bool)

(declare-fun res!367467 () Bool)

(declare-fun e!333069 () Bool)

(assert (=> b!579645 (=> (not res!367467) (not e!333069))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36207 0))(
  ( (array!36208 (arr!17378 (Array (_ BitVec 32) (_ BitVec 64))) (size!17742 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36207)

(assert (=> b!579645 (= res!367467 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17378 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17378 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!579647 () Bool)

(declare-fun res!367461 () Bool)

(declare-fun e!333067 () Bool)

(assert (=> b!579647 (=> (not res!367461) (not e!333067))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579647 (= res!367461 (validKeyInArray!0 (select (arr!17378 a!2986) j!136)))))

(declare-fun b!579648 () Bool)

(assert (=> b!579648 (= e!333069 false)))

(declare-datatypes ((SeekEntryResult!5818 0))(
  ( (MissingZero!5818 (index!25499 (_ BitVec 32))) (Found!5818 (index!25500 (_ BitVec 32))) (Intermediate!5818 (undefined!6630 Bool) (index!25501 (_ BitVec 32)) (x!54383 (_ BitVec 32))) (Undefined!5818) (MissingVacant!5818 (index!25502 (_ BitVec 32))) )
))
(declare-fun lt!264528 () SeekEntryResult!5818)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36207 (_ BitVec 32)) SeekEntryResult!5818)

(assert (=> b!579648 (= lt!264528 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17378 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!579649 () Bool)

(declare-fun res!367468 () Bool)

(assert (=> b!579649 (=> (not res!367468) (not e!333069))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36207 (_ BitVec 32)) Bool)

(assert (=> b!579649 (= res!367468 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!579650 () Bool)

(declare-fun res!367463 () Bool)

(assert (=> b!579650 (=> (not res!367463) (not e!333069))))

(declare-datatypes ((List!11419 0))(
  ( (Nil!11416) (Cons!11415 (h!12460 (_ BitVec 64)) (t!17647 List!11419)) )
))
(declare-fun arrayNoDuplicates!0 (array!36207 (_ BitVec 32) List!11419) Bool)

(assert (=> b!579650 (= res!367463 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11416))))

(declare-fun b!579651 () Bool)

(assert (=> b!579651 (= e!333067 e!333069)))

(declare-fun res!367462 () Bool)

(assert (=> b!579651 (=> (not res!367462) (not e!333069))))

(declare-fun lt!264529 () SeekEntryResult!5818)

(assert (=> b!579651 (= res!367462 (or (= lt!264529 (MissingZero!5818 i!1108)) (= lt!264529 (MissingVacant!5818 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36207 (_ BitVec 32)) SeekEntryResult!5818)

(assert (=> b!579651 (= lt!264529 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!579646 () Bool)

(declare-fun res!367469 () Bool)

(assert (=> b!579646 (=> (not res!367469) (not e!333067))))

(declare-fun arrayContainsKey!0 (array!36207 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!579646 (= res!367469 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!367464 () Bool)

(assert (=> start!53306 (=> (not res!367464) (not e!333067))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53306 (= res!367464 (validMask!0 mask!3053))))

(assert (=> start!53306 e!333067))

(assert (=> start!53306 true))

(declare-fun array_inv!13174 (array!36207) Bool)

(assert (=> start!53306 (array_inv!13174 a!2986)))

(declare-fun b!579652 () Bool)

(declare-fun res!367466 () Bool)

(assert (=> b!579652 (=> (not res!367466) (not e!333067))))

(assert (=> b!579652 (= res!367466 (and (= (size!17742 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17742 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17742 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!579653 () Bool)

(declare-fun res!367465 () Bool)

(assert (=> b!579653 (=> (not res!367465) (not e!333067))))

(assert (=> b!579653 (= res!367465 (validKeyInArray!0 k!1786))))

(assert (= (and start!53306 res!367464) b!579652))

(assert (= (and b!579652 res!367466) b!579647))

(assert (= (and b!579647 res!367461) b!579653))

(assert (= (and b!579653 res!367465) b!579646))

(assert (= (and b!579646 res!367469) b!579651))

(assert (= (and b!579651 res!367462) b!579649))

(assert (= (and b!579649 res!367468) b!579650))

(assert (= (and b!579650 res!367463) b!579645))

(assert (= (and b!579645 res!367467) b!579648))

(declare-fun m!558257 () Bool)

(assert (=> b!579651 m!558257))

(declare-fun m!558259 () Bool)

(assert (=> start!53306 m!558259))

(declare-fun m!558261 () Bool)

(assert (=> start!53306 m!558261))

(declare-fun m!558263 () Bool)

(assert (=> b!579645 m!558263))

(declare-fun m!558265 () Bool)

(assert (=> b!579645 m!558265))

(declare-fun m!558267 () Bool)

(assert (=> b!579645 m!558267))

(declare-fun m!558269 () Bool)

(assert (=> b!579647 m!558269))

(assert (=> b!579647 m!558269))

(declare-fun m!558271 () Bool)

(assert (=> b!579647 m!558271))

(declare-fun m!558273 () Bool)

(assert (=> b!579650 m!558273))

(declare-fun m!558275 () Bool)

(assert (=> b!579649 m!558275))

(assert (=> b!579648 m!558269))

(assert (=> b!579648 m!558269))

(declare-fun m!558277 () Bool)

(assert (=> b!579648 m!558277))

(declare-fun m!558279 () Bool)

(assert (=> b!579646 m!558279))

(declare-fun m!558281 () Bool)

(assert (=> b!579653 m!558281))

(push 1)

(assert (not b!579648))

(assert (not start!53306))

(assert (not b!579646))

(assert (not b!579647))

(assert (not b!579650))

(assert (not b!579651))

(assert (not b!579649))

(assert (not b!579653))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

