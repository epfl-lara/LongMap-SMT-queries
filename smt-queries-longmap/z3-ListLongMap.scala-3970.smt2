; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53874 () Bool)

(assert start!53874)

(declare-fun b!587640 () Bool)

(declare-fun res!375425 () Bool)

(declare-fun e!335606 () Bool)

(assert (=> b!587640 (=> (not res!375425) (not e!335606))))

(declare-datatypes ((array!36732 0))(
  ( (array!36733 (arr!17639 (Array (_ BitVec 32) (_ BitVec 64))) (size!18004 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36732)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!587640 (= res!375425 (validKeyInArray!0 (select (arr!17639 a!2986) j!136)))))

(declare-fun b!587641 () Bool)

(declare-fun res!375418 () Bool)

(declare-fun e!335609 () Bool)

(assert (=> b!587641 (=> (not res!375418) (not e!335609))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!587641 (= res!375418 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17639 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17639 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!587642 () Bool)

(declare-fun e!335610 () Bool)

(assert (=> b!587642 (= e!335610 (not (bvsge mask!3053 #b00000000000000000000000000000000)))))

(declare-fun e!335608 () Bool)

(assert (=> b!587642 e!335608))

(declare-fun res!375422 () Bool)

(assert (=> b!587642 (=> (not res!375422) (not e!335608))))

(declare-datatypes ((SeekEntryResult!6076 0))(
  ( (MissingZero!6076 (index!26534 (_ BitVec 32))) (Found!6076 (index!26535 (_ BitVec 32))) (Intermediate!6076 (undefined!6888 Bool) (index!26536 (_ BitVec 32)) (x!55349 (_ BitVec 32))) (Undefined!6076) (MissingVacant!6076 (index!26537 (_ BitVec 32))) )
))
(declare-fun lt!266318 () SeekEntryResult!6076)

(declare-fun lt!266316 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36732 (_ BitVec 32)) SeekEntryResult!6076)

(assert (=> b!587642 (= res!375422 (= lt!266318 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266316 vacantSpotIndex!68 (select (store (arr!17639 a!2986) i!1108 k0!1786) j!136) (array!36733 (store (arr!17639 a!2986) i!1108 k0!1786) (size!18004 a!2986)) mask!3053)))))

(assert (=> b!587642 (= lt!266318 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266316 vacantSpotIndex!68 (select (arr!17639 a!2986) j!136) a!2986 mask!3053))))

(declare-datatypes ((Unit!18258 0))(
  ( (Unit!18259) )
))
(declare-fun lt!266317 () Unit!18258)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36732 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18258)

(assert (=> b!587642 (= lt!266317 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266316 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!587642 (= lt!266316 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!587643 () Bool)

(declare-fun lt!266320 () SeekEntryResult!6076)

(assert (=> b!587643 (= e!335608 (= lt!266320 lt!266318))))

(declare-fun b!587644 () Bool)

(declare-fun res!375424 () Bool)

(assert (=> b!587644 (=> (not res!375424) (not e!335609))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36732 (_ BitVec 32)) Bool)

(assert (=> b!587644 (= res!375424 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!587646 () Bool)

(declare-fun res!375421 () Bool)

(assert (=> b!587646 (=> (not res!375421) (not e!335606))))

(assert (=> b!587646 (= res!375421 (validKeyInArray!0 k0!1786))))

(declare-fun b!587647 () Bool)

(declare-fun res!375420 () Bool)

(assert (=> b!587647 (=> (not res!375420) (not e!335606))))

(assert (=> b!587647 (= res!375420 (and (= (size!18004 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18004 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18004 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!587648 () Bool)

(assert (=> b!587648 (= e!335606 e!335609)))

(declare-fun res!375428 () Bool)

(assert (=> b!587648 (=> (not res!375428) (not e!335609))))

(declare-fun lt!266319 () SeekEntryResult!6076)

(assert (=> b!587648 (= res!375428 (or (= lt!266319 (MissingZero!6076 i!1108)) (= lt!266319 (MissingVacant!6076 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36732 (_ BitVec 32)) SeekEntryResult!6076)

(assert (=> b!587648 (= lt!266319 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!375419 () Bool)

(assert (=> start!53874 (=> (not res!375419) (not e!335606))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53874 (= res!375419 (validMask!0 mask!3053))))

(assert (=> start!53874 e!335606))

(assert (=> start!53874 true))

(declare-fun array_inv!13522 (array!36732) Bool)

(assert (=> start!53874 (array_inv!13522 a!2986)))

(declare-fun b!587645 () Bool)

(assert (=> b!587645 (= e!335609 e!335610)))

(declare-fun res!375426 () Bool)

(assert (=> b!587645 (=> (not res!375426) (not e!335610))))

(assert (=> b!587645 (= res!375426 (and (= lt!266320 (Found!6076 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17639 a!2986) index!984) (select (arr!17639 a!2986) j!136))) (not (= (select (arr!17639 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!587645 (= lt!266320 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17639 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!587649 () Bool)

(declare-fun res!375423 () Bool)

(assert (=> b!587649 (=> (not res!375423) (not e!335606))))

(declare-fun arrayContainsKey!0 (array!36732 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!587649 (= res!375423 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!587650 () Bool)

(declare-fun res!375427 () Bool)

(assert (=> b!587650 (=> (not res!375427) (not e!335609))))

(declare-datatypes ((List!11719 0))(
  ( (Nil!11716) (Cons!11715 (h!12760 (_ BitVec 64)) (t!17938 List!11719)) )
))
(declare-fun arrayNoDuplicates!0 (array!36732 (_ BitVec 32) List!11719) Bool)

(assert (=> b!587650 (= res!375427 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11716))))

(assert (= (and start!53874 res!375419) b!587647))

(assert (= (and b!587647 res!375420) b!587640))

(assert (= (and b!587640 res!375425) b!587646))

(assert (= (and b!587646 res!375421) b!587649))

(assert (= (and b!587649 res!375423) b!587648))

(assert (= (and b!587648 res!375428) b!587644))

(assert (= (and b!587644 res!375424) b!587650))

(assert (= (and b!587650 res!375427) b!587641))

(assert (= (and b!587641 res!375418) b!587645))

(assert (= (and b!587645 res!375426) b!587642))

(assert (= (and b!587642 res!375422) b!587643))

(declare-fun m!565597 () Bool)

(assert (=> b!587649 m!565597))

(declare-fun m!565599 () Bool)

(assert (=> b!587642 m!565599))

(declare-fun m!565601 () Bool)

(assert (=> b!587642 m!565601))

(declare-fun m!565603 () Bool)

(assert (=> b!587642 m!565603))

(declare-fun m!565605 () Bool)

(assert (=> b!587642 m!565605))

(assert (=> b!587642 m!565599))

(declare-fun m!565607 () Bool)

(assert (=> b!587642 m!565607))

(declare-fun m!565609 () Bool)

(assert (=> b!587642 m!565609))

(assert (=> b!587642 m!565601))

(declare-fun m!565611 () Bool)

(assert (=> b!587642 m!565611))

(declare-fun m!565613 () Bool)

(assert (=> b!587648 m!565613))

(declare-fun m!565615 () Bool)

(assert (=> b!587650 m!565615))

(declare-fun m!565617 () Bool)

(assert (=> b!587644 m!565617))

(declare-fun m!565619 () Bool)

(assert (=> b!587646 m!565619))

(declare-fun m!565621 () Bool)

(assert (=> b!587645 m!565621))

(assert (=> b!587645 m!565601))

(assert (=> b!587645 m!565601))

(declare-fun m!565623 () Bool)

(assert (=> b!587645 m!565623))

(declare-fun m!565625 () Bool)

(assert (=> b!587641 m!565625))

(assert (=> b!587641 m!565603))

(declare-fun m!565627 () Bool)

(assert (=> b!587641 m!565627))

(declare-fun m!565629 () Bool)

(assert (=> start!53874 m!565629))

(declare-fun m!565631 () Bool)

(assert (=> start!53874 m!565631))

(assert (=> b!587640 m!565601))

(assert (=> b!587640 m!565601))

(declare-fun m!565633 () Bool)

(assert (=> b!587640 m!565633))

(check-sat (not b!587642) (not b!587644) (not b!587645) (not b!587646) (not start!53874) (not b!587650) (not b!587648) (not b!587640) (not b!587649))
(check-sat)
