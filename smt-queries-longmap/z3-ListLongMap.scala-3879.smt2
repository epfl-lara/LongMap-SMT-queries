; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53334 () Bool)

(assert start!53334)

(declare-fun b!579548 () Bool)

(declare-fun res!367260 () Bool)

(declare-fun e!333099 () Bool)

(assert (=> b!579548 (=> (not res!367260) (not e!333099))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579548 (= res!367260 (validKeyInArray!0 k0!1786))))

(declare-fun b!579549 () Bool)

(declare-fun res!367266 () Bool)

(assert (=> b!579549 (=> (not res!367266) (not e!333099))))

(declare-datatypes ((array!36180 0))(
  ( (array!36181 (arr!17362 (Array (_ BitVec 32) (_ BitVec 64))) (size!17726 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36180)

(declare-fun arrayContainsKey!0 (array!36180 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!579549 (= res!367266 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!579550 () Bool)

(declare-fun res!367267 () Bool)

(assert (=> b!579550 (=> (not res!367267) (not e!333099))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!579550 (= res!367267 (and (= (size!17726 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17726 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17726 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!579551 () Bool)

(declare-fun res!367265 () Bool)

(declare-fun e!333098 () Bool)

(assert (=> b!579551 (=> (not res!367265) (not e!333098))))

(declare-datatypes ((List!11310 0))(
  ( (Nil!11307) (Cons!11306 (h!12354 (_ BitVec 64)) (t!17530 List!11310)) )
))
(declare-fun arrayNoDuplicates!0 (array!36180 (_ BitVec 32) List!11310) Bool)

(assert (=> b!579551 (= res!367265 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11307))))

(declare-fun res!367263 () Bool)

(assert (=> start!53334 (=> (not res!367263) (not e!333099))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53334 (= res!367263 (validMask!0 mask!3053))))

(assert (=> start!53334 e!333099))

(assert (=> start!53334 true))

(declare-fun array_inv!13221 (array!36180) Bool)

(assert (=> start!53334 (array_inv!13221 a!2986)))

(declare-fun b!579552 () Bool)

(declare-fun res!367262 () Bool)

(assert (=> b!579552 (=> (not res!367262) (not e!333099))))

(assert (=> b!579552 (= res!367262 (validKeyInArray!0 (select (arr!17362 a!2986) j!136)))))

(declare-fun b!579553 () Bool)

(declare-fun res!367264 () Bool)

(assert (=> b!579553 (=> (not res!367264) (not e!333098))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36180 (_ BitVec 32)) Bool)

(assert (=> b!579553 (= res!367264 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!579554 () Bool)

(declare-fun res!367261 () Bool)

(assert (=> b!579554 (=> (not res!367261) (not e!333098))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!579554 (= res!367261 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17362 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17362 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!579555 () Bool)

(assert (=> b!579555 (= e!333098 false)))

(declare-datatypes ((SeekEntryResult!5758 0))(
  ( (MissingZero!5758 (index!25259 (_ BitVec 32))) (Found!5758 (index!25260 (_ BitVec 32))) (Intermediate!5758 (undefined!6570 Bool) (index!25261 (_ BitVec 32)) (x!54302 (_ BitVec 32))) (Undefined!5758) (MissingVacant!5758 (index!25262 (_ BitVec 32))) )
))
(declare-fun lt!264574 () SeekEntryResult!5758)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36180 (_ BitVec 32)) SeekEntryResult!5758)

(assert (=> b!579555 (= lt!264574 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17362 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!579556 () Bool)

(assert (=> b!579556 (= e!333099 e!333098)))

(declare-fun res!367259 () Bool)

(assert (=> b!579556 (=> (not res!367259) (not e!333098))))

(declare-fun lt!264573 () SeekEntryResult!5758)

(assert (=> b!579556 (= res!367259 (or (= lt!264573 (MissingZero!5758 i!1108)) (= lt!264573 (MissingVacant!5758 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36180 (_ BitVec 32)) SeekEntryResult!5758)

(assert (=> b!579556 (= lt!264573 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!53334 res!367263) b!579550))

(assert (= (and b!579550 res!367267) b!579552))

(assert (= (and b!579552 res!367262) b!579548))

(assert (= (and b!579548 res!367260) b!579549))

(assert (= (and b!579549 res!367266) b!579556))

(assert (= (and b!579556 res!367259) b!579553))

(assert (= (and b!579553 res!367264) b!579551))

(assert (= (and b!579551 res!367265) b!579554))

(assert (= (and b!579554 res!367261) b!579555))

(declare-fun m!558323 () Bool)

(assert (=> b!579553 m!558323))

(declare-fun m!558325 () Bool)

(assert (=> b!579555 m!558325))

(assert (=> b!579555 m!558325))

(declare-fun m!558327 () Bool)

(assert (=> b!579555 m!558327))

(declare-fun m!558329 () Bool)

(assert (=> b!579554 m!558329))

(declare-fun m!558331 () Bool)

(assert (=> b!579554 m!558331))

(declare-fun m!558333 () Bool)

(assert (=> b!579554 m!558333))

(declare-fun m!558335 () Bool)

(assert (=> b!579556 m!558335))

(declare-fun m!558337 () Bool)

(assert (=> b!579548 m!558337))

(declare-fun m!558339 () Bool)

(assert (=> b!579549 m!558339))

(declare-fun m!558341 () Bool)

(assert (=> start!53334 m!558341))

(declare-fun m!558343 () Bool)

(assert (=> start!53334 m!558343))

(assert (=> b!579552 m!558325))

(assert (=> b!579552 m!558325))

(declare-fun m!558345 () Bool)

(assert (=> b!579552 m!558345))

(declare-fun m!558347 () Bool)

(assert (=> b!579551 m!558347))

(check-sat (not b!579553) (not b!579556) (not b!579551) (not b!579555) (not start!53334) (not b!579549) (not b!579548) (not b!579552))
(check-sat)
