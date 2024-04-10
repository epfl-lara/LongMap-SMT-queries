; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53668 () Bool)

(assert start!53668)

(declare-fun b!584934 () Bool)

(declare-fun res!372750 () Bool)

(declare-fun e!334815 () Bool)

(assert (=> b!584934 (=> (not res!372750) (not e!334815))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36569 0))(
  ( (array!36570 (arr!17559 (Array (_ BitVec 32) (_ BitVec 64))) (size!17923 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36569)

(declare-datatypes ((SeekEntryResult!5999 0))(
  ( (MissingZero!5999 (index!26223 (_ BitVec 32))) (Found!5999 (index!26224 (_ BitVec 32))) (Intermediate!5999 (undefined!6811 Bool) (index!26225 (_ BitVec 32)) (x!55052 (_ BitVec 32))) (Undefined!5999) (MissingVacant!5999 (index!26226 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36569 (_ BitVec 32)) SeekEntryResult!5999)

(assert (=> b!584934 (= res!372750 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17559 a!2986) j!136) a!2986 mask!3053) (Found!5999 j!136)))))

(declare-fun b!584935 () Bool)

(declare-fun e!334817 () Bool)

(assert (=> b!584935 (= e!334815 e!334817)))

(declare-fun res!372756 () Bool)

(assert (=> b!584935 (=> (not res!372756) (not e!334817))))

(declare-fun lt!265698 () (_ BitVec 32))

(assert (=> b!584935 (= res!372756 (and (bvsge lt!265698 #b00000000000000000000000000000000) (bvslt lt!265698 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!584935 (= lt!265698 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!372752 () Bool)

(declare-fun e!334816 () Bool)

(assert (=> start!53668 (=> (not res!372752) (not e!334816))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53668 (= res!372752 (validMask!0 mask!3053))))

(assert (=> start!53668 e!334816))

(assert (=> start!53668 true))

(declare-fun array_inv!13355 (array!36569) Bool)

(assert (=> start!53668 (array_inv!13355 a!2986)))

(declare-fun b!584936 () Bool)

(declare-fun res!372757 () Bool)

(assert (=> b!584936 (=> (not res!372757) (not e!334816))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36569 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!584936 (= res!372757 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!584937 () Bool)

(declare-fun res!372760 () Bool)

(assert (=> b!584937 (=> (not res!372760) (not e!334815))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36569 (_ BitVec 32)) Bool)

(assert (=> b!584937 (= res!372760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!584938 () Bool)

(declare-fun res!372753 () Bool)

(assert (=> b!584938 (=> (not res!372753) (not e!334815))))

(declare-datatypes ((List!11600 0))(
  ( (Nil!11597) (Cons!11596 (h!12641 (_ BitVec 64)) (t!17828 List!11600)) )
))
(declare-fun arrayNoDuplicates!0 (array!36569 (_ BitVec 32) List!11600) Bool)

(assert (=> b!584938 (= res!372753 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11597))))

(declare-fun b!584939 () Bool)

(assert (=> b!584939 (= e!334816 e!334815)))

(declare-fun res!372755 () Bool)

(assert (=> b!584939 (=> (not res!372755) (not e!334815))))

(declare-fun lt!265699 () SeekEntryResult!5999)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!584939 (= res!372755 (or (= lt!265699 (MissingZero!5999 i!1108)) (= lt!265699 (MissingVacant!5999 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36569 (_ BitVec 32)) SeekEntryResult!5999)

(assert (=> b!584939 (= lt!265699 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!584940 () Bool)

(declare-fun res!372758 () Bool)

(assert (=> b!584940 (=> (not res!372758) (not e!334816))))

(assert (=> b!584940 (= res!372758 (and (= (size!17923 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17923 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17923 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!584941 () Bool)

(declare-fun res!372761 () Bool)

(assert (=> b!584941 (=> (not res!372761) (not e!334816))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!584941 (= res!372761 (validKeyInArray!0 (select (arr!17559 a!2986) j!136)))))

(declare-fun b!584942 () Bool)

(declare-fun res!372751 () Bool)

(assert (=> b!584942 (=> (not res!372751) (not e!334815))))

(assert (=> b!584942 (= res!372751 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17559 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17559 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!584943 () Bool)

(declare-fun res!372754 () Bool)

(assert (=> b!584943 (=> (not res!372754) (not e!334816))))

(assert (=> b!584943 (= res!372754 (validKeyInArray!0 k!1786))))

(declare-fun b!584944 () Bool)

(assert (=> b!584944 (= e!334817 false)))

(declare-fun lt!265697 () SeekEntryResult!5999)

(assert (=> b!584944 (= lt!265697 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265698 vacantSpotIndex!68 (select (arr!17559 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!584945 () Bool)

(declare-fun res!372759 () Bool)

(assert (=> b!584945 (=> (not res!372759) (not e!334815))))

(assert (=> b!584945 (= res!372759 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17559 a!2986) index!984) (select (arr!17559 a!2986) j!136))) (not (= (select (arr!17559 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (= (and start!53668 res!372752) b!584940))

(assert (= (and b!584940 res!372758) b!584941))

(assert (= (and b!584941 res!372761) b!584943))

(assert (= (and b!584943 res!372754) b!584936))

(assert (= (and b!584936 res!372757) b!584939))

(assert (= (and b!584939 res!372755) b!584937))

(assert (= (and b!584937 res!372760) b!584938))

(assert (= (and b!584938 res!372753) b!584942))

(assert (= (and b!584942 res!372751) b!584934))

(assert (= (and b!584934 res!372750) b!584945))

(assert (= (and b!584945 res!372759) b!584935))

(assert (= (and b!584935 res!372756) b!584944))

(declare-fun m!563233 () Bool)

(assert (=> b!584934 m!563233))

(assert (=> b!584934 m!563233))

(declare-fun m!563235 () Bool)

(assert (=> b!584934 m!563235))

(declare-fun m!563237 () Bool)

(assert (=> start!53668 m!563237))

(declare-fun m!563239 () Bool)

(assert (=> start!53668 m!563239))

(assert (=> b!584944 m!563233))

(assert (=> b!584944 m!563233))

(declare-fun m!563241 () Bool)

(assert (=> b!584944 m!563241))

(assert (=> b!584941 m!563233))

(assert (=> b!584941 m!563233))

(declare-fun m!563243 () Bool)

(assert (=> b!584941 m!563243))

(declare-fun m!563245 () Bool)

(assert (=> b!584945 m!563245))

(assert (=> b!584945 m!563233))

(declare-fun m!563247 () Bool)

(assert (=> b!584936 m!563247))

(declare-fun m!563249 () Bool)

(assert (=> b!584942 m!563249))

(declare-fun m!563251 () Bool)

(assert (=> b!584942 m!563251))

(declare-fun m!563253 () Bool)

(assert (=> b!584942 m!563253))

(declare-fun m!563255 () Bool)

(assert (=> b!584938 m!563255))

(declare-fun m!563257 () Bool)

(assert (=> b!584943 m!563257))

(declare-fun m!563259 () Bool)

(assert (=> b!584939 m!563259))

(declare-fun m!563261 () Bool)

(assert (=> b!584935 m!563261))

(declare-fun m!563263 () Bool)

(assert (=> b!584937 m!563263))

(push 1)

(assert (not b!584938))

(assert (not b!584941))

(assert (not b!584944))

(assert (not b!584936))

(assert (not b!584939))

(assert (not b!584937))

(assert (not b!584934))

(assert (not b!584935))

(assert (not start!53668))

(assert (not b!584943))

(check-sat)

(pop 1)

