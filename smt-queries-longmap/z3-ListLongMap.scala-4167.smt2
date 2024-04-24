; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56796 () Bool)

(assert start!56796)

(declare-fun b!628953 () Bool)

(declare-fun res!406407 () Bool)

(declare-fun e!359820 () Bool)

(assert (=> b!628953 (=> (not res!406407) (not e!359820))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!628953 (= res!406407 (validKeyInArray!0 k0!1786))))

(declare-fun b!628954 () Bool)

(declare-fun res!406408 () Bool)

(declare-fun e!359819 () Bool)

(assert (=> b!628954 (=> (not res!406408) (not e!359819))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37980 0))(
  ( (array!37981 (arr!18226 (Array (_ BitVec 32) (_ BitVec 64))) (size!18590 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37980)

(assert (=> b!628954 (= res!406408 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18226 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18226 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!628955 () Bool)

(declare-fun res!406413 () Bool)

(assert (=> b!628955 (=> (not res!406413) (not e!359819))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!628955 (= res!406413 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18226 a!2986) index!984) (select (arr!18226 a!2986) j!136))) (not (= (select (arr!18226 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!628956 () Bool)

(assert (=> b!628956 (= e!359819 false)))

(declare-fun lt!290662 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!628956 (= lt!290662 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!628957 () Bool)

(declare-fun res!406406 () Bool)

(assert (=> b!628957 (=> (not res!406406) (not e!359819))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37980 (_ BitVec 32)) Bool)

(assert (=> b!628957 (= res!406406 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!628958 () Bool)

(assert (=> b!628958 (= e!359820 e!359819)))

(declare-fun res!406404 () Bool)

(assert (=> b!628958 (=> (not res!406404) (not e!359819))))

(declare-datatypes ((SeekEntryResult!6622 0))(
  ( (MissingZero!6622 (index!28772 (_ BitVec 32))) (Found!6622 (index!28773 (_ BitVec 32))) (Intermediate!6622 (undefined!7434 Bool) (index!28774 (_ BitVec 32)) (x!57659 (_ BitVec 32))) (Undefined!6622) (MissingVacant!6622 (index!28775 (_ BitVec 32))) )
))
(declare-fun lt!290661 () SeekEntryResult!6622)

(assert (=> b!628958 (= res!406404 (or (= lt!290661 (MissingZero!6622 i!1108)) (= lt!290661 (MissingVacant!6622 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37980 (_ BitVec 32)) SeekEntryResult!6622)

(assert (=> b!628958 (= lt!290661 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!628959 () Bool)

(declare-fun res!406412 () Bool)

(assert (=> b!628959 (=> (not res!406412) (not e!359819))))

(declare-datatypes ((List!12174 0))(
  ( (Nil!12171) (Cons!12170 (h!13218 (_ BitVec 64)) (t!18394 List!12174)) )
))
(declare-fun arrayNoDuplicates!0 (array!37980 (_ BitVec 32) List!12174) Bool)

(assert (=> b!628959 (= res!406412 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12171))))

(declare-fun res!406405 () Bool)

(assert (=> start!56796 (=> (not res!406405) (not e!359820))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56796 (= res!406405 (validMask!0 mask!3053))))

(assert (=> start!56796 e!359820))

(assert (=> start!56796 true))

(declare-fun array_inv!14085 (array!37980) Bool)

(assert (=> start!56796 (array_inv!14085 a!2986)))

(declare-fun b!628960 () Bool)

(declare-fun res!406414 () Bool)

(assert (=> b!628960 (=> (not res!406414) (not e!359819))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37980 (_ BitVec 32)) SeekEntryResult!6622)

(assert (=> b!628960 (= res!406414 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18226 a!2986) j!136) a!2986 mask!3053) (Found!6622 j!136)))))

(declare-fun b!628961 () Bool)

(declare-fun res!406411 () Bool)

(assert (=> b!628961 (=> (not res!406411) (not e!359820))))

(assert (=> b!628961 (= res!406411 (validKeyInArray!0 (select (arr!18226 a!2986) j!136)))))

(declare-fun b!628962 () Bool)

(declare-fun res!406409 () Bool)

(assert (=> b!628962 (=> (not res!406409) (not e!359820))))

(assert (=> b!628962 (= res!406409 (and (= (size!18590 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18590 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18590 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!628963 () Bool)

(declare-fun res!406410 () Bool)

(assert (=> b!628963 (=> (not res!406410) (not e!359820))))

(declare-fun arrayContainsKey!0 (array!37980 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!628963 (= res!406410 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!56796 res!406405) b!628962))

(assert (= (and b!628962 res!406409) b!628961))

(assert (= (and b!628961 res!406411) b!628953))

(assert (= (and b!628953 res!406407) b!628963))

(assert (= (and b!628963 res!406410) b!628958))

(assert (= (and b!628958 res!406404) b!628957))

(assert (= (and b!628957 res!406406) b!628959))

(assert (= (and b!628959 res!406412) b!628954))

(assert (= (and b!628954 res!406408) b!628960))

(assert (= (and b!628960 res!406414) b!628955))

(assert (= (and b!628955 res!406413) b!628956))

(declare-fun m!604363 () Bool)

(assert (=> b!628961 m!604363))

(assert (=> b!628961 m!604363))

(declare-fun m!604365 () Bool)

(assert (=> b!628961 m!604365))

(declare-fun m!604367 () Bool)

(assert (=> b!628958 m!604367))

(declare-fun m!604369 () Bool)

(assert (=> start!56796 m!604369))

(declare-fun m!604371 () Bool)

(assert (=> start!56796 m!604371))

(declare-fun m!604373 () Bool)

(assert (=> b!628953 m!604373))

(declare-fun m!604375 () Bool)

(assert (=> b!628956 m!604375))

(declare-fun m!604377 () Bool)

(assert (=> b!628959 m!604377))

(declare-fun m!604379 () Bool)

(assert (=> b!628955 m!604379))

(assert (=> b!628955 m!604363))

(declare-fun m!604381 () Bool)

(assert (=> b!628957 m!604381))

(declare-fun m!604383 () Bool)

(assert (=> b!628963 m!604383))

(declare-fun m!604385 () Bool)

(assert (=> b!628954 m!604385))

(declare-fun m!604387 () Bool)

(assert (=> b!628954 m!604387))

(declare-fun m!604389 () Bool)

(assert (=> b!628954 m!604389))

(assert (=> b!628960 m!604363))

(assert (=> b!628960 m!604363))

(declare-fun m!604391 () Bool)

(assert (=> b!628960 m!604391))

(check-sat (not b!628958) (not b!628956) (not start!56796) (not b!628963) (not b!628961) (not b!628957) (not b!628960) (not b!628953) (not b!628959))
(check-sat)
