; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53310 () Bool)

(assert start!53310)

(declare-fun b!579699 () Bool)

(declare-fun res!367520 () Bool)

(declare-fun e!333087 () Bool)

(assert (=> b!579699 (=> (not res!367520) (not e!333087))))

(declare-datatypes ((array!36211 0))(
  ( (array!36212 (arr!17380 (Array (_ BitVec 32) (_ BitVec 64))) (size!17744 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36211)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36211 (_ BitVec 32)) Bool)

(assert (=> b!579699 (= res!367520 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!579700 () Bool)

(declare-fun res!367521 () Bool)

(declare-fun e!333086 () Bool)

(assert (=> b!579700 (=> (not res!367521) (not e!333086))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579700 (= res!367521 (validKeyInArray!0 k0!1786))))

(declare-fun b!579701 () Bool)

(declare-fun res!367517 () Bool)

(assert (=> b!579701 (=> (not res!367517) (not e!333086))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!579701 (= res!367517 (and (= (size!17744 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17744 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17744 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!579702 () Bool)

(declare-fun res!367522 () Bool)

(assert (=> b!579702 (=> (not res!367522) (not e!333086))))

(assert (=> b!579702 (= res!367522 (validKeyInArray!0 (select (arr!17380 a!2986) j!136)))))

(declare-fun b!579703 () Bool)

(assert (=> b!579703 (= e!333086 e!333087)))

(declare-fun res!367518 () Bool)

(assert (=> b!579703 (=> (not res!367518) (not e!333087))))

(declare-datatypes ((SeekEntryResult!5820 0))(
  ( (MissingZero!5820 (index!25507 (_ BitVec 32))) (Found!5820 (index!25508 (_ BitVec 32))) (Intermediate!5820 (undefined!6632 Bool) (index!25509 (_ BitVec 32)) (x!54393 (_ BitVec 32))) (Undefined!5820) (MissingVacant!5820 (index!25510 (_ BitVec 32))) )
))
(declare-fun lt!264541 () SeekEntryResult!5820)

(assert (=> b!579703 (= res!367518 (or (= lt!264541 (MissingZero!5820 i!1108)) (= lt!264541 (MissingVacant!5820 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36211 (_ BitVec 32)) SeekEntryResult!5820)

(assert (=> b!579703 (= lt!264541 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!579704 () Bool)

(assert (=> b!579704 (= e!333087 false)))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!264540 () SeekEntryResult!5820)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36211 (_ BitVec 32)) SeekEntryResult!5820)

(assert (=> b!579704 (= lt!264540 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17380 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!579705 () Bool)

(declare-fun res!367516 () Bool)

(assert (=> b!579705 (=> (not res!367516) (not e!333087))))

(declare-datatypes ((List!11421 0))(
  ( (Nil!11418) (Cons!11417 (h!12462 (_ BitVec 64)) (t!17649 List!11421)) )
))
(declare-fun arrayNoDuplicates!0 (array!36211 (_ BitVec 32) List!11421) Bool)

(assert (=> b!579705 (= res!367516 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11418))))

(declare-fun res!367523 () Bool)

(assert (=> start!53310 (=> (not res!367523) (not e!333086))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53310 (= res!367523 (validMask!0 mask!3053))))

(assert (=> start!53310 e!333086))

(assert (=> start!53310 true))

(declare-fun array_inv!13176 (array!36211) Bool)

(assert (=> start!53310 (array_inv!13176 a!2986)))

(declare-fun b!579706 () Bool)

(declare-fun res!367515 () Bool)

(assert (=> b!579706 (=> (not res!367515) (not e!333087))))

(assert (=> b!579706 (= res!367515 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17380 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17380 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!579707 () Bool)

(declare-fun res!367519 () Bool)

(assert (=> b!579707 (=> (not res!367519) (not e!333086))))

(declare-fun arrayContainsKey!0 (array!36211 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!579707 (= res!367519 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!53310 res!367523) b!579701))

(assert (= (and b!579701 res!367517) b!579702))

(assert (= (and b!579702 res!367522) b!579700))

(assert (= (and b!579700 res!367521) b!579707))

(assert (= (and b!579707 res!367519) b!579703))

(assert (= (and b!579703 res!367518) b!579699))

(assert (= (and b!579699 res!367520) b!579705))

(assert (= (and b!579705 res!367516) b!579706))

(assert (= (and b!579706 res!367515) b!579704))

(declare-fun m!558309 () Bool)

(assert (=> start!53310 m!558309))

(declare-fun m!558311 () Bool)

(assert (=> start!53310 m!558311))

(declare-fun m!558313 () Bool)

(assert (=> b!579705 m!558313))

(declare-fun m!558315 () Bool)

(assert (=> b!579702 m!558315))

(assert (=> b!579702 m!558315))

(declare-fun m!558317 () Bool)

(assert (=> b!579702 m!558317))

(declare-fun m!558319 () Bool)

(assert (=> b!579699 m!558319))

(declare-fun m!558321 () Bool)

(assert (=> b!579707 m!558321))

(declare-fun m!558323 () Bool)

(assert (=> b!579706 m!558323))

(declare-fun m!558325 () Bool)

(assert (=> b!579706 m!558325))

(declare-fun m!558327 () Bool)

(assert (=> b!579706 m!558327))

(declare-fun m!558329 () Bool)

(assert (=> b!579703 m!558329))

(declare-fun m!558331 () Bool)

(assert (=> b!579700 m!558331))

(assert (=> b!579704 m!558315))

(assert (=> b!579704 m!558315))

(declare-fun m!558333 () Bool)

(assert (=> b!579704 m!558333))

(check-sat (not b!579700) (not b!579707) (not b!579705) (not start!53310) (not b!579702) (not b!579699) (not b!579703) (not b!579704))
