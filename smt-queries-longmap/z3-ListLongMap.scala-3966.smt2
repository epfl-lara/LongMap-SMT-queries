; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53916 () Bool)

(assert start!53916)

(declare-fun res!375262 () Bool)

(declare-fun e!335780 () Bool)

(assert (=> start!53916 (=> (not res!375262) (not e!335780))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53916 (= res!375262 (validMask!0 mask!3053))))

(assert (=> start!53916 e!335780))

(assert (=> start!53916 true))

(declare-datatypes ((array!36705 0))(
  ( (array!36706 (arr!17623 (Array (_ BitVec 32) (_ BitVec 64))) (size!17987 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36705)

(declare-fun array_inv!13482 (array!36705) Bool)

(assert (=> start!53916 (array_inv!13482 a!2986)))

(declare-fun b!587724 () Bool)

(declare-fun res!375263 () Bool)

(declare-fun e!335779 () Bool)

(assert (=> b!587724 (=> (not res!375263) (not e!335779))))

(declare-datatypes ((List!11571 0))(
  ( (Nil!11568) (Cons!11567 (h!12615 (_ BitVec 64)) (t!17791 List!11571)) )
))
(declare-fun arrayNoDuplicates!0 (array!36705 (_ BitVec 32) List!11571) Bool)

(assert (=> b!587724 (= res!375263 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11568))))

(declare-fun b!587725 () Bool)

(declare-fun res!375257 () Bool)

(assert (=> b!587725 (=> (not res!375257) (not e!335780))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36705 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!587725 (= res!375257 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!587726 () Bool)

(declare-fun res!375261 () Bool)

(assert (=> b!587726 (=> (not res!375261) (not e!335779))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!587726 (= res!375261 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17623 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17623 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!587727 () Bool)

(declare-fun res!375264 () Bool)

(assert (=> b!587727 (=> (not res!375264) (not e!335780))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!587727 (= res!375264 (and (= (size!17987 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17987 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17987 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!587728 () Bool)

(declare-fun res!375259 () Bool)

(assert (=> b!587728 (=> (not res!375259) (not e!335779))))

(declare-datatypes ((SeekEntryResult!6019 0))(
  ( (MissingZero!6019 (index!26306 (_ BitVec 32))) (Found!6019 (index!26307 (_ BitVec 32))) (Intermediate!6019 (undefined!6831 Bool) (index!26308 (_ BitVec 32)) (x!55268 (_ BitVec 32))) (Undefined!6019) (MissingVacant!6019 (index!26309 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36705 (_ BitVec 32)) SeekEntryResult!6019)

(assert (=> b!587728 (= res!375259 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17623 a!2986) j!136) a!2986 mask!3053) (Found!6019 j!136)))))

(declare-fun b!587729 () Bool)

(declare-fun res!375260 () Bool)

(assert (=> b!587729 (=> (not res!375260) (not e!335779))))

(assert (=> b!587729 (= res!375260 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17623 a!2986) index!984) (select (arr!17623 a!2986) j!136))) (not (= (select (arr!17623 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!587730 () Bool)

(assert (=> b!587730 (= e!335779 (not true))))

(declare-fun lt!266522 () (_ BitVec 32))

(assert (=> b!587730 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266522 vacantSpotIndex!68 (select (arr!17623 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266522 vacantSpotIndex!68 (select (store (arr!17623 a!2986) i!1108 k0!1786) j!136) (array!36706 (store (arr!17623 a!2986) i!1108 k0!1786) (size!17987 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18235 0))(
  ( (Unit!18236) )
))
(declare-fun lt!266524 () Unit!18235)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36705 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18235)

(assert (=> b!587730 (= lt!266524 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266522 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!587730 (= lt!266522 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!587731 () Bool)

(assert (=> b!587731 (= e!335780 e!335779)))

(declare-fun res!375256 () Bool)

(assert (=> b!587731 (=> (not res!375256) (not e!335779))))

(declare-fun lt!266523 () SeekEntryResult!6019)

(assert (=> b!587731 (= res!375256 (or (= lt!266523 (MissingZero!6019 i!1108)) (= lt!266523 (MissingVacant!6019 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36705 (_ BitVec 32)) SeekEntryResult!6019)

(assert (=> b!587731 (= lt!266523 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!587732 () Bool)

(declare-fun res!375258 () Bool)

(assert (=> b!587732 (=> (not res!375258) (not e!335780))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!587732 (= res!375258 (validKeyInArray!0 (select (arr!17623 a!2986) j!136)))))

(declare-fun b!587733 () Bool)

(declare-fun res!375255 () Bool)

(assert (=> b!587733 (=> (not res!375255) (not e!335780))))

(assert (=> b!587733 (= res!375255 (validKeyInArray!0 k0!1786))))

(declare-fun b!587734 () Bool)

(declare-fun res!375265 () Bool)

(assert (=> b!587734 (=> (not res!375265) (not e!335779))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36705 (_ BitVec 32)) Bool)

(assert (=> b!587734 (= res!375265 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!53916 res!375262) b!587727))

(assert (= (and b!587727 res!375264) b!587732))

(assert (= (and b!587732 res!375258) b!587733))

(assert (= (and b!587733 res!375255) b!587725))

(assert (= (and b!587725 res!375257) b!587731))

(assert (= (and b!587731 res!375256) b!587734))

(assert (= (and b!587734 res!375265) b!587724))

(assert (= (and b!587724 res!375263) b!587726))

(assert (= (and b!587726 res!375261) b!587728))

(assert (= (and b!587728 res!375259) b!587729))

(assert (= (and b!587729 res!375260) b!587730))

(declare-fun m!566291 () Bool)

(assert (=> b!587724 m!566291))

(declare-fun m!566293 () Bool)

(assert (=> b!587729 m!566293))

(declare-fun m!566295 () Bool)

(assert (=> b!587729 m!566295))

(declare-fun m!566297 () Bool)

(assert (=> b!587726 m!566297))

(declare-fun m!566299 () Bool)

(assert (=> b!587726 m!566299))

(declare-fun m!566301 () Bool)

(assert (=> b!587726 m!566301))

(declare-fun m!566303 () Bool)

(assert (=> b!587734 m!566303))

(declare-fun m!566305 () Bool)

(assert (=> b!587731 m!566305))

(declare-fun m!566307 () Bool)

(assert (=> b!587733 m!566307))

(declare-fun m!566309 () Bool)

(assert (=> start!53916 m!566309))

(declare-fun m!566311 () Bool)

(assert (=> start!53916 m!566311))

(declare-fun m!566313 () Bool)

(assert (=> b!587725 m!566313))

(assert (=> b!587728 m!566295))

(assert (=> b!587728 m!566295))

(declare-fun m!566315 () Bool)

(assert (=> b!587728 m!566315))

(assert (=> b!587732 m!566295))

(assert (=> b!587732 m!566295))

(declare-fun m!566317 () Bool)

(assert (=> b!587732 m!566317))

(declare-fun m!566319 () Bool)

(assert (=> b!587730 m!566319))

(declare-fun m!566321 () Bool)

(assert (=> b!587730 m!566321))

(assert (=> b!587730 m!566295))

(assert (=> b!587730 m!566299))

(declare-fun m!566323 () Bool)

(assert (=> b!587730 m!566323))

(assert (=> b!587730 m!566295))

(declare-fun m!566325 () Bool)

(assert (=> b!587730 m!566325))

(assert (=> b!587730 m!566321))

(declare-fun m!566327 () Bool)

(assert (=> b!587730 m!566327))

(check-sat (not start!53916) (not b!587728) (not b!587731) (not b!587733) (not b!587734) (not b!587732) (not b!587724) (not b!587730) (not b!587725))
(check-sat)
