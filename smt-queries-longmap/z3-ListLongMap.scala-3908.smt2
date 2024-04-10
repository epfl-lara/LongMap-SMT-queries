; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53460 () Bool)

(assert start!53460)

(declare-fun b!581742 () Bool)

(declare-fun res!369562 () Bool)

(declare-fun e!333762 () Bool)

(assert (=> b!581742 (=> (not res!369562) (not e!333762))))

(declare-datatypes ((array!36361 0))(
  ( (array!36362 (arr!17455 (Array (_ BitVec 32) (_ BitVec 64))) (size!17819 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36361)

(declare-datatypes ((List!11496 0))(
  ( (Nil!11493) (Cons!11492 (h!12537 (_ BitVec 64)) (t!17724 List!11496)) )
))
(declare-fun arrayNoDuplicates!0 (array!36361 (_ BitVec 32) List!11496) Bool)

(assert (=> b!581742 (= res!369562 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11493))))

(declare-fun b!581743 () Bool)

(assert (=> b!581743 (= e!333762 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5895 0))(
  ( (MissingZero!5895 (index!25807 (_ BitVec 32))) (Found!5895 (index!25808 (_ BitVec 32))) (Intermediate!5895 (undefined!6707 Bool) (index!25809 (_ BitVec 32)) (x!54668 (_ BitVec 32))) (Undefined!5895) (MissingVacant!5895 (index!25810 (_ BitVec 32))) )
))
(declare-fun lt!264973 () SeekEntryResult!5895)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36361 (_ BitVec 32)) SeekEntryResult!5895)

(assert (=> b!581743 (= lt!264973 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17455 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!369563 () Bool)

(declare-fun e!333760 () Bool)

(assert (=> start!53460 (=> (not res!369563) (not e!333760))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53460 (= res!369563 (validMask!0 mask!3053))))

(assert (=> start!53460 e!333760))

(assert (=> start!53460 true))

(declare-fun array_inv!13251 (array!36361) Bool)

(assert (=> start!53460 (array_inv!13251 a!2986)))

(declare-fun b!581744 () Bool)

(declare-fun res!369565 () Bool)

(assert (=> b!581744 (=> (not res!369565) (not e!333760))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!581744 (= res!369565 (validKeyInArray!0 k0!1786))))

(declare-fun b!581745 () Bool)

(declare-fun res!369566 () Bool)

(assert (=> b!581745 (=> (not res!369566) (not e!333762))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!581745 (= res!369566 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17455 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17455 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!581746 () Bool)

(declare-fun res!369558 () Bool)

(assert (=> b!581746 (=> (not res!369558) (not e!333760))))

(assert (=> b!581746 (= res!369558 (and (= (size!17819 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17819 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17819 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!581747 () Bool)

(declare-fun res!369564 () Bool)

(assert (=> b!581747 (=> (not res!369564) (not e!333760))))

(assert (=> b!581747 (= res!369564 (validKeyInArray!0 (select (arr!17455 a!2986) j!136)))))

(declare-fun b!581748 () Bool)

(declare-fun res!369560 () Bool)

(assert (=> b!581748 (=> (not res!369560) (not e!333760))))

(declare-fun arrayContainsKey!0 (array!36361 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!581748 (= res!369560 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!581749 () Bool)

(declare-fun res!369561 () Bool)

(assert (=> b!581749 (=> (not res!369561) (not e!333762))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36361 (_ BitVec 32)) Bool)

(assert (=> b!581749 (= res!369561 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!581750 () Bool)

(assert (=> b!581750 (= e!333760 e!333762)))

(declare-fun res!369559 () Bool)

(assert (=> b!581750 (=> (not res!369559) (not e!333762))))

(declare-fun lt!264972 () SeekEntryResult!5895)

(assert (=> b!581750 (= res!369559 (or (= lt!264972 (MissingZero!5895 i!1108)) (= lt!264972 (MissingVacant!5895 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36361 (_ BitVec 32)) SeekEntryResult!5895)

(assert (=> b!581750 (= lt!264972 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!53460 res!369563) b!581746))

(assert (= (and b!581746 res!369558) b!581747))

(assert (= (and b!581747 res!369564) b!581744))

(assert (= (and b!581744 res!369565) b!581748))

(assert (= (and b!581748 res!369560) b!581750))

(assert (= (and b!581750 res!369559) b!581749))

(assert (= (and b!581749 res!369561) b!581742))

(assert (= (and b!581742 res!369562) b!581745))

(assert (= (and b!581745 res!369566) b!581743))

(declare-fun m!560271 () Bool)

(assert (=> b!581749 m!560271))

(declare-fun m!560273 () Bool)

(assert (=> b!581745 m!560273))

(declare-fun m!560275 () Bool)

(assert (=> b!581745 m!560275))

(declare-fun m!560277 () Bool)

(assert (=> b!581745 m!560277))

(declare-fun m!560279 () Bool)

(assert (=> b!581744 m!560279))

(declare-fun m!560281 () Bool)

(assert (=> start!53460 m!560281))

(declare-fun m!560283 () Bool)

(assert (=> start!53460 m!560283))

(declare-fun m!560285 () Bool)

(assert (=> b!581747 m!560285))

(assert (=> b!581747 m!560285))

(declare-fun m!560287 () Bool)

(assert (=> b!581747 m!560287))

(assert (=> b!581743 m!560285))

(assert (=> b!581743 m!560285))

(declare-fun m!560289 () Bool)

(assert (=> b!581743 m!560289))

(declare-fun m!560291 () Bool)

(assert (=> b!581748 m!560291))

(declare-fun m!560293 () Bool)

(assert (=> b!581750 m!560293))

(declare-fun m!560295 () Bool)

(assert (=> b!581742 m!560295))

(check-sat (not b!581742) (not b!581748) (not start!53460) (not b!581750) (not b!581749) (not b!581744) (not b!581743) (not b!581747))
(check-sat)
