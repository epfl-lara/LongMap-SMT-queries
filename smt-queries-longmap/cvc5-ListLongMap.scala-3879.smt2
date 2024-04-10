; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53284 () Bool)

(assert start!53284)

(declare-fun b!579348 () Bool)

(declare-fun e!332970 () Bool)

(assert (=> b!579348 (= e!332970 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5807 0))(
  ( (MissingZero!5807 (index!25455 (_ BitVec 32))) (Found!5807 (index!25456 (_ BitVec 32))) (Intermediate!5807 (undefined!6619 Bool) (index!25457 (_ BitVec 32)) (x!54348 (_ BitVec 32))) (Undefined!5807) (MissingVacant!5807 (index!25458 (_ BitVec 32))) )
))
(declare-fun lt!264463 () SeekEntryResult!5807)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36185 0))(
  ( (array!36186 (arr!17367 (Array (_ BitVec 32) (_ BitVec 64))) (size!17731 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36185)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36185 (_ BitVec 32)) SeekEntryResult!5807)

(assert (=> b!579348 (= lt!264463 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17367 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!579349 () Bool)

(declare-fun res!367169 () Bool)

(declare-fun e!332969 () Bool)

(assert (=> b!579349 (=> (not res!367169) (not e!332969))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579349 (= res!367169 (validKeyInArray!0 (select (arr!17367 a!2986) j!136)))))

(declare-fun b!579350 () Bool)

(assert (=> b!579350 (= e!332969 e!332970)))

(declare-fun res!367164 () Bool)

(assert (=> b!579350 (=> (not res!367164) (not e!332970))))

(declare-fun lt!264462 () SeekEntryResult!5807)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!579350 (= res!367164 (or (= lt!264462 (MissingZero!5807 i!1108)) (= lt!264462 (MissingVacant!5807 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36185 (_ BitVec 32)) SeekEntryResult!5807)

(assert (=> b!579350 (= lt!264462 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!579351 () Bool)

(declare-fun res!367172 () Bool)

(assert (=> b!579351 (=> (not res!367172) (not e!332970))))

(assert (=> b!579351 (= res!367172 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17367 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17367 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!579352 () Bool)

(declare-fun res!367168 () Bool)

(assert (=> b!579352 (=> (not res!367168) (not e!332969))))

(assert (=> b!579352 (= res!367168 (and (= (size!17731 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17731 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17731 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!579353 () Bool)

(declare-fun res!367171 () Bool)

(assert (=> b!579353 (=> (not res!367171) (not e!332969))))

(declare-fun arrayContainsKey!0 (array!36185 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!579353 (= res!367171 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!579354 () Bool)

(declare-fun res!367166 () Bool)

(assert (=> b!579354 (=> (not res!367166) (not e!332970))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36185 (_ BitVec 32)) Bool)

(assert (=> b!579354 (= res!367166 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!579355 () Bool)

(declare-fun res!367167 () Bool)

(assert (=> b!579355 (=> (not res!367167) (not e!332970))))

(declare-datatypes ((List!11408 0))(
  ( (Nil!11405) (Cons!11404 (h!12449 (_ BitVec 64)) (t!17636 List!11408)) )
))
(declare-fun arrayNoDuplicates!0 (array!36185 (_ BitVec 32) List!11408) Bool)

(assert (=> b!579355 (= res!367167 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11405))))

(declare-fun res!367165 () Bool)

(assert (=> start!53284 (=> (not res!367165) (not e!332969))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53284 (= res!367165 (validMask!0 mask!3053))))

(assert (=> start!53284 e!332969))

(assert (=> start!53284 true))

(declare-fun array_inv!13163 (array!36185) Bool)

(assert (=> start!53284 (array_inv!13163 a!2986)))

(declare-fun b!579356 () Bool)

(declare-fun res!367170 () Bool)

(assert (=> b!579356 (=> (not res!367170) (not e!332969))))

(assert (=> b!579356 (= res!367170 (validKeyInArray!0 k!1786))))

(assert (= (and start!53284 res!367165) b!579352))

(assert (= (and b!579352 res!367168) b!579349))

(assert (= (and b!579349 res!367169) b!579356))

(assert (= (and b!579356 res!367170) b!579353))

(assert (= (and b!579353 res!367171) b!579350))

(assert (= (and b!579350 res!367164) b!579354))

(assert (= (and b!579354 res!367166) b!579355))

(assert (= (and b!579355 res!367167) b!579351))

(assert (= (and b!579351 res!367172) b!579348))

(declare-fun m!557971 () Bool)

(assert (=> b!579351 m!557971))

(declare-fun m!557973 () Bool)

(assert (=> b!579351 m!557973))

(declare-fun m!557975 () Bool)

(assert (=> b!579351 m!557975))

(declare-fun m!557977 () Bool)

(assert (=> b!579349 m!557977))

(assert (=> b!579349 m!557977))

(declare-fun m!557979 () Bool)

(assert (=> b!579349 m!557979))

(declare-fun m!557981 () Bool)

(assert (=> b!579356 m!557981))

(assert (=> b!579348 m!557977))

(assert (=> b!579348 m!557977))

(declare-fun m!557983 () Bool)

(assert (=> b!579348 m!557983))

(declare-fun m!557985 () Bool)

(assert (=> b!579355 m!557985))

(declare-fun m!557987 () Bool)

(assert (=> b!579350 m!557987))

(declare-fun m!557989 () Bool)

(assert (=> b!579353 m!557989))

(declare-fun m!557991 () Bool)

(assert (=> start!53284 m!557991))

(declare-fun m!557993 () Bool)

(assert (=> start!53284 m!557993))

(declare-fun m!557995 () Bool)

(assert (=> b!579354 m!557995))

(push 1)

