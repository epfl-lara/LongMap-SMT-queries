; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53430 () Bool)

(assert start!53430)

(declare-fun b!581282 () Bool)

(declare-fun res!369242 () Bool)

(declare-fun e!333524 () Bool)

(assert (=> b!581282 (=> (not res!369242) (not e!333524))))

(declare-datatypes ((array!36345 0))(
  ( (array!36346 (arr!17447 (Array (_ BitVec 32) (_ BitVec 64))) (size!17812 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36345)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36345 (_ BitVec 32)) Bool)

(assert (=> b!581282 (= res!369242 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!581283 () Bool)

(assert (=> b!581283 (= e!333524 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5884 0))(
  ( (MissingZero!5884 (index!25763 (_ BitVec 32))) (Found!5884 (index!25764 (_ BitVec 32))) (Intermediate!5884 (undefined!6696 Bool) (index!25765 (_ BitVec 32)) (x!54636 (_ BitVec 32))) (Undefined!5884) (MissingVacant!5884 (index!25766 (_ BitVec 32))) )
))
(declare-fun lt!264697 () SeekEntryResult!5884)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36345 (_ BitVec 32)) SeekEntryResult!5884)

(assert (=> b!581283 (= lt!264697 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17447 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!369240 () Bool)

(declare-fun e!333525 () Bool)

(assert (=> start!53430 (=> (not res!369240) (not e!333525))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53430 (= res!369240 (validMask!0 mask!3053))))

(assert (=> start!53430 e!333525))

(assert (=> start!53430 true))

(declare-fun array_inv!13330 (array!36345) Bool)

(assert (=> start!53430 (array_inv!13330 a!2986)))

(declare-fun b!581284 () Bool)

(declare-fun res!369245 () Bool)

(assert (=> b!581284 (=> (not res!369245) (not e!333525))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!581284 (= res!369245 (validKeyInArray!0 k0!1786))))

(declare-fun b!581285 () Bool)

(declare-fun res!369246 () Bool)

(assert (=> b!581285 (=> (not res!369246) (not e!333525))))

(assert (=> b!581285 (= res!369246 (validKeyInArray!0 (select (arr!17447 a!2986) j!136)))))

(declare-fun b!581286 () Bool)

(declare-fun res!369247 () Bool)

(assert (=> b!581286 (=> (not res!369247) (not e!333525))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!581286 (= res!369247 (and (= (size!17812 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17812 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17812 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!581287 () Bool)

(declare-fun res!369241 () Bool)

(assert (=> b!581287 (=> (not res!369241) (not e!333525))))

(declare-fun arrayContainsKey!0 (array!36345 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!581287 (= res!369241 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!581288 () Bool)

(assert (=> b!581288 (= e!333525 e!333524)))

(declare-fun res!369244 () Bool)

(assert (=> b!581288 (=> (not res!369244) (not e!333524))))

(declare-fun lt!264696 () SeekEntryResult!5884)

(assert (=> b!581288 (= res!369244 (or (= lt!264696 (MissingZero!5884 i!1108)) (= lt!264696 (MissingVacant!5884 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36345 (_ BitVec 32)) SeekEntryResult!5884)

(assert (=> b!581288 (= lt!264696 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!581289 () Bool)

(declare-fun res!369248 () Bool)

(assert (=> b!581289 (=> (not res!369248) (not e!333524))))

(assert (=> b!581289 (= res!369248 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17447 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17447 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!581290 () Bool)

(declare-fun res!369243 () Bool)

(assert (=> b!581290 (=> (not res!369243) (not e!333524))))

(declare-datatypes ((List!11527 0))(
  ( (Nil!11524) (Cons!11523 (h!12568 (_ BitVec 64)) (t!17746 List!11527)) )
))
(declare-fun arrayNoDuplicates!0 (array!36345 (_ BitVec 32) List!11527) Bool)

(assert (=> b!581290 (= res!369243 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11524))))

(assert (= (and start!53430 res!369240) b!581286))

(assert (= (and b!581286 res!369247) b!581285))

(assert (= (and b!581285 res!369246) b!581284))

(assert (= (and b!581284 res!369245) b!581287))

(assert (= (and b!581287 res!369241) b!581288))

(assert (= (and b!581288 res!369244) b!581282))

(assert (= (and b!581282 res!369242) b!581290))

(assert (= (and b!581290 res!369243) b!581289))

(assert (= (and b!581289 res!369248) b!581283))

(declare-fun m!559303 () Bool)

(assert (=> b!581288 m!559303))

(declare-fun m!559305 () Bool)

(assert (=> b!581287 m!559305))

(declare-fun m!559307 () Bool)

(assert (=> b!581285 m!559307))

(assert (=> b!581285 m!559307))

(declare-fun m!559309 () Bool)

(assert (=> b!581285 m!559309))

(declare-fun m!559311 () Bool)

(assert (=> b!581289 m!559311))

(declare-fun m!559313 () Bool)

(assert (=> b!581289 m!559313))

(declare-fun m!559315 () Bool)

(assert (=> b!581289 m!559315))

(declare-fun m!559317 () Bool)

(assert (=> start!53430 m!559317))

(declare-fun m!559319 () Bool)

(assert (=> start!53430 m!559319))

(declare-fun m!559321 () Bool)

(assert (=> b!581290 m!559321))

(declare-fun m!559323 () Bool)

(assert (=> b!581282 m!559323))

(declare-fun m!559325 () Bool)

(assert (=> b!581284 m!559325))

(assert (=> b!581283 m!559307))

(assert (=> b!581283 m!559307))

(declare-fun m!559327 () Bool)

(assert (=> b!581283 m!559327))

(check-sat (not b!581285) (not b!581288) (not b!581287) (not b!581283) (not start!53430) (not b!581284) (not b!581290) (not b!581282))
(check-sat)
