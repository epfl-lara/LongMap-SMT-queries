; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53232 () Bool)

(assert start!53232)

(declare-fun b!578637 () Bool)

(declare-fun res!366457 () Bool)

(declare-fun e!332736 () Bool)

(assert (=> b!578637 (=> (not res!366457) (not e!332736))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36133 0))(
  ( (array!36134 (arr!17341 (Array (_ BitVec 32) (_ BitVec 64))) (size!17705 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36133)

(assert (=> b!578637 (= res!366457 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17341 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17341 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!578638 () Bool)

(declare-fun res!366459 () Bool)

(declare-fun e!332735 () Bool)

(assert (=> b!578638 (=> (not res!366459) (not e!332735))))

(declare-fun arrayContainsKey!0 (array!36133 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578638 (= res!366459 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!578639 () Bool)

(declare-fun res!366454 () Bool)

(assert (=> b!578639 (=> (not res!366454) (not e!332736))))

(declare-datatypes ((List!11382 0))(
  ( (Nil!11379) (Cons!11378 (h!12423 (_ BitVec 64)) (t!17610 List!11382)) )
))
(declare-fun arrayNoDuplicates!0 (array!36133 (_ BitVec 32) List!11382) Bool)

(assert (=> b!578639 (= res!366454 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11379))))

(declare-fun b!578640 () Bool)

(declare-fun res!366453 () Bool)

(assert (=> b!578640 (=> (not res!366453) (not e!332735))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!578640 (= res!366453 (and (= (size!17705 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17705 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17705 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!366455 () Bool)

(assert (=> start!53232 (=> (not res!366455) (not e!332735))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53232 (= res!366455 (validMask!0 mask!3053))))

(assert (=> start!53232 e!332735))

(assert (=> start!53232 true))

(declare-fun array_inv!13137 (array!36133) Bool)

(assert (=> start!53232 (array_inv!13137 a!2986)))

(declare-fun b!578641 () Bool)

(assert (=> b!578641 (= e!332736 false)))

(declare-datatypes ((SeekEntryResult!5781 0))(
  ( (MissingZero!5781 (index!25351 (_ BitVec 32))) (Found!5781 (index!25352 (_ BitVec 32))) (Intermediate!5781 (undefined!6593 Bool) (index!25353 (_ BitVec 32)) (x!54250 (_ BitVec 32))) (Undefined!5781) (MissingVacant!5781 (index!25354 (_ BitVec 32))) )
))
(declare-fun lt!264316 () SeekEntryResult!5781)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36133 (_ BitVec 32)) SeekEntryResult!5781)

(assert (=> b!578641 (= lt!264316 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17341 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!578642 () Bool)

(declare-fun res!366456 () Bool)

(assert (=> b!578642 (=> (not res!366456) (not e!332735))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!578642 (= res!366456 (validKeyInArray!0 (select (arr!17341 a!2986) j!136)))))

(declare-fun b!578643 () Bool)

(declare-fun res!366460 () Bool)

(assert (=> b!578643 (=> (not res!366460) (not e!332735))))

(assert (=> b!578643 (= res!366460 (validKeyInArray!0 k0!1786))))

(declare-fun b!578644 () Bool)

(declare-fun res!366458 () Bool)

(assert (=> b!578644 (=> (not res!366458) (not e!332736))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36133 (_ BitVec 32)) Bool)

(assert (=> b!578644 (= res!366458 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!578645 () Bool)

(assert (=> b!578645 (= e!332735 e!332736)))

(declare-fun res!366461 () Bool)

(assert (=> b!578645 (=> (not res!366461) (not e!332736))))

(declare-fun lt!264315 () SeekEntryResult!5781)

(assert (=> b!578645 (= res!366461 (or (= lt!264315 (MissingZero!5781 i!1108)) (= lt!264315 (MissingVacant!5781 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36133 (_ BitVec 32)) SeekEntryResult!5781)

(assert (=> b!578645 (= lt!264315 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!53232 res!366455) b!578640))

(assert (= (and b!578640 res!366453) b!578642))

(assert (= (and b!578642 res!366456) b!578643))

(assert (= (and b!578643 res!366460) b!578638))

(assert (= (and b!578638 res!366459) b!578645))

(assert (= (and b!578645 res!366461) b!578644))

(assert (= (and b!578644 res!366458) b!578639))

(assert (= (and b!578639 res!366454) b!578637))

(assert (= (and b!578637 res!366457) b!578641))

(declare-fun m!557295 () Bool)

(assert (=> b!578638 m!557295))

(declare-fun m!557297 () Bool)

(assert (=> b!578643 m!557297))

(declare-fun m!557299 () Bool)

(assert (=> b!578637 m!557299))

(declare-fun m!557301 () Bool)

(assert (=> b!578637 m!557301))

(declare-fun m!557303 () Bool)

(assert (=> b!578637 m!557303))

(declare-fun m!557305 () Bool)

(assert (=> b!578641 m!557305))

(assert (=> b!578641 m!557305))

(declare-fun m!557307 () Bool)

(assert (=> b!578641 m!557307))

(declare-fun m!557309 () Bool)

(assert (=> b!578644 m!557309))

(declare-fun m!557311 () Bool)

(assert (=> b!578639 m!557311))

(declare-fun m!557313 () Bool)

(assert (=> start!53232 m!557313))

(declare-fun m!557315 () Bool)

(assert (=> start!53232 m!557315))

(declare-fun m!557317 () Bool)

(assert (=> b!578645 m!557317))

(assert (=> b!578642 m!557305))

(assert (=> b!578642 m!557305))

(declare-fun m!557319 () Bool)

(assert (=> b!578642 m!557319))

(check-sat (not b!578645) (not start!53232) (not b!578643) (not b!578644) (not b!578642) (not b!578639) (not b!578641) (not b!578638))
(check-sat)
