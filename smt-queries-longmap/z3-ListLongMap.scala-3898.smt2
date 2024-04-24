; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53448 () Bool)

(assert start!53448)

(declare-fun b!581096 () Bool)

(declare-fun res!368808 () Bool)

(declare-fun e!333612 () Bool)

(assert (=> b!581096 (=> (not res!368808) (not e!333612))))

(declare-datatypes ((array!36294 0))(
  ( (array!36295 (arr!17419 (Array (_ BitVec 32) (_ BitVec 64))) (size!17783 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36294)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!581096 (= res!368808 (validKeyInArray!0 (select (arr!17419 a!2986) j!136)))))

(declare-fun b!581097 () Bool)

(declare-fun res!368809 () Bool)

(assert (=> b!581097 (=> (not res!368809) (not e!333612))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!581097 (= res!368809 (validKeyInArray!0 k0!1786))))

(declare-fun b!581098 () Bool)

(declare-fun res!368811 () Bool)

(declare-fun e!333611 () Bool)

(assert (=> b!581098 (=> (not res!368811) (not e!333611))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36294 (_ BitVec 32)) Bool)

(assert (=> b!581098 (= res!368811 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!581099 () Bool)

(assert (=> b!581099 (= e!333611 false)))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5815 0))(
  ( (MissingZero!5815 (index!25487 (_ BitVec 32))) (Found!5815 (index!25488 (_ BitVec 32))) (Intermediate!5815 (undefined!6627 Bool) (index!25489 (_ BitVec 32)) (x!54511 (_ BitVec 32))) (Undefined!5815) (MissingVacant!5815 (index!25490 (_ BitVec 32))) )
))
(declare-fun lt!264907 () SeekEntryResult!5815)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36294 (_ BitVec 32)) SeekEntryResult!5815)

(assert (=> b!581099 (= lt!264907 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17419 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!581100 () Bool)

(assert (=> b!581100 (= e!333612 e!333611)))

(declare-fun res!368810 () Bool)

(assert (=> b!581100 (=> (not res!368810) (not e!333611))))

(declare-fun lt!264906 () SeekEntryResult!5815)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!581100 (= res!368810 (or (= lt!264906 (MissingZero!5815 i!1108)) (= lt!264906 (MissingVacant!5815 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36294 (_ BitVec 32)) SeekEntryResult!5815)

(assert (=> b!581100 (= lt!264906 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!581101 () Bool)

(declare-fun res!368815 () Bool)

(assert (=> b!581101 (=> (not res!368815) (not e!333611))))

(declare-datatypes ((List!11367 0))(
  ( (Nil!11364) (Cons!11363 (h!12411 (_ BitVec 64)) (t!17587 List!11367)) )
))
(declare-fun arrayNoDuplicates!0 (array!36294 (_ BitVec 32) List!11367) Bool)

(assert (=> b!581101 (= res!368815 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11364))))

(declare-fun res!368813 () Bool)

(assert (=> start!53448 (=> (not res!368813) (not e!333612))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53448 (= res!368813 (validMask!0 mask!3053))))

(assert (=> start!53448 e!333612))

(assert (=> start!53448 true))

(declare-fun array_inv!13278 (array!36294) Bool)

(assert (=> start!53448 (array_inv!13278 a!2986)))

(declare-fun b!581102 () Bool)

(declare-fun res!368807 () Bool)

(assert (=> b!581102 (=> (not res!368807) (not e!333611))))

(assert (=> b!581102 (= res!368807 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17419 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17419 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!581103 () Bool)

(declare-fun res!368814 () Bool)

(assert (=> b!581103 (=> (not res!368814) (not e!333612))))

(assert (=> b!581103 (= res!368814 (and (= (size!17783 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17783 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17783 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!581104 () Bool)

(declare-fun res!368812 () Bool)

(assert (=> b!581104 (=> (not res!368812) (not e!333612))))

(declare-fun arrayContainsKey!0 (array!36294 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!581104 (= res!368812 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!53448 res!368813) b!581103))

(assert (= (and b!581103 res!368814) b!581096))

(assert (= (and b!581096 res!368808) b!581097))

(assert (= (and b!581097 res!368809) b!581104))

(assert (= (and b!581104 res!368812) b!581100))

(assert (= (and b!581100 res!368810) b!581098))

(assert (= (and b!581098 res!368811) b!581101))

(assert (= (and b!581101 res!368815) b!581102))

(assert (= (and b!581102 res!368807) b!581099))

(declare-fun m!559811 () Bool)

(assert (=> b!581101 m!559811))

(declare-fun m!559813 () Bool)

(assert (=> b!581099 m!559813))

(assert (=> b!581099 m!559813))

(declare-fun m!559815 () Bool)

(assert (=> b!581099 m!559815))

(declare-fun m!559817 () Bool)

(assert (=> b!581098 m!559817))

(assert (=> b!581096 m!559813))

(assert (=> b!581096 m!559813))

(declare-fun m!559819 () Bool)

(assert (=> b!581096 m!559819))

(declare-fun m!559821 () Bool)

(assert (=> b!581097 m!559821))

(declare-fun m!559823 () Bool)

(assert (=> b!581104 m!559823))

(declare-fun m!559825 () Bool)

(assert (=> start!53448 m!559825))

(declare-fun m!559827 () Bool)

(assert (=> start!53448 m!559827))

(declare-fun m!559829 () Bool)

(assert (=> b!581102 m!559829))

(declare-fun m!559831 () Bool)

(assert (=> b!581102 m!559831))

(declare-fun m!559833 () Bool)

(assert (=> b!581102 m!559833))

(declare-fun m!559835 () Bool)

(assert (=> b!581100 m!559835))

(check-sat (not b!581099) (not b!581104) (not b!581096) (not b!581098) (not b!581100) (not start!53448) (not b!581101) (not b!581097))
(check-sat)
