; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53700 () Bool)

(assert start!53700)

(declare-fun b!584819 () Bool)

(declare-fun e!334837 () Bool)

(assert (=> b!584819 (= e!334837 false)))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((array!36546 0))(
  ( (array!36547 (arr!17545 (Array (_ BitVec 32) (_ BitVec 64))) (size!17909 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36546)

(declare-datatypes ((SeekEntryResult!5941 0))(
  ( (MissingZero!5941 (index!25991 (_ BitVec 32))) (Found!5941 (index!25992 (_ BitVec 32))) (Intermediate!5941 (undefined!6753 Bool) (index!25993 (_ BitVec 32)) (x!54973 (_ BitVec 32))) (Undefined!5941) (MissingVacant!5941 (index!25994 (_ BitVec 32))) )
))
(declare-fun lt!265719 () SeekEntryResult!5941)

(declare-fun lt!265718 () (_ BitVec 32))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36546 (_ BitVec 32)) SeekEntryResult!5941)

(assert (=> b!584819 (= lt!265719 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265718 vacantSpotIndex!68 (select (arr!17545 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!584820 () Bool)

(declare-fun res!372539 () Bool)

(declare-fun e!334838 () Bool)

(assert (=> b!584820 (=> (not res!372539) (not e!334838))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!584820 (= res!372539 (validKeyInArray!0 k0!1786))))

(declare-fun b!584821 () Bool)

(declare-fun res!372533 () Bool)

(assert (=> b!584821 (=> (not res!372533) (not e!334838))))

(assert (=> b!584821 (= res!372533 (validKeyInArray!0 (select (arr!17545 a!2986) j!136)))))

(declare-fun b!584822 () Bool)

(declare-fun res!372531 () Bool)

(declare-fun e!334836 () Bool)

(assert (=> b!584822 (=> (not res!372531) (not e!334836))))

(declare-datatypes ((List!11493 0))(
  ( (Nil!11490) (Cons!11489 (h!12537 (_ BitVec 64)) (t!17713 List!11493)) )
))
(declare-fun arrayNoDuplicates!0 (array!36546 (_ BitVec 32) List!11493) Bool)

(assert (=> b!584822 (= res!372531 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11490))))

(declare-fun b!584823 () Bool)

(declare-fun res!372534 () Bool)

(assert (=> b!584823 (=> (not res!372534) (not e!334838))))

(declare-fun arrayContainsKey!0 (array!36546 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!584823 (= res!372534 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!584824 () Bool)

(declare-fun res!372538 () Bool)

(assert (=> b!584824 (=> (not res!372538) (not e!334836))))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!584824 (= res!372538 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17545 a!2986) j!136) a!2986 mask!3053) (Found!5941 j!136)))))

(declare-fun b!584825 () Bool)

(assert (=> b!584825 (= e!334836 e!334837)))

(declare-fun res!372530 () Bool)

(assert (=> b!584825 (=> (not res!372530) (not e!334837))))

(assert (=> b!584825 (= res!372530 (and (bvsge lt!265718 #b00000000000000000000000000000000) (bvslt lt!265718 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!584825 (= lt!265718 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!584826 () Bool)

(declare-fun res!372532 () Bool)

(assert (=> b!584826 (=> (not res!372532) (not e!334836))))

(assert (=> b!584826 (= res!372532 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17545 a!2986) index!984) (select (arr!17545 a!2986) j!136))) (not (= (select (arr!17545 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!584827 () Bool)

(declare-fun res!372535 () Bool)

(assert (=> b!584827 (=> (not res!372535) (not e!334836))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!584827 (= res!372535 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17545 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17545 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!584828 () Bool)

(declare-fun res!372536 () Bool)

(assert (=> b!584828 (=> (not res!372536) (not e!334836))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36546 (_ BitVec 32)) Bool)

(assert (=> b!584828 (= res!372536 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!584829 () Bool)

(declare-fun res!372541 () Bool)

(assert (=> b!584829 (=> (not res!372541) (not e!334838))))

(assert (=> b!584829 (= res!372541 (and (= (size!17909 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17909 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17909 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!372537 () Bool)

(assert (=> start!53700 (=> (not res!372537) (not e!334838))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53700 (= res!372537 (validMask!0 mask!3053))))

(assert (=> start!53700 e!334838))

(assert (=> start!53700 true))

(declare-fun array_inv!13404 (array!36546) Bool)

(assert (=> start!53700 (array_inv!13404 a!2986)))

(declare-fun b!584830 () Bool)

(assert (=> b!584830 (= e!334838 e!334836)))

(declare-fun res!372540 () Bool)

(assert (=> b!584830 (=> (not res!372540) (not e!334836))))

(declare-fun lt!265720 () SeekEntryResult!5941)

(assert (=> b!584830 (= res!372540 (or (= lt!265720 (MissingZero!5941 i!1108)) (= lt!265720 (MissingVacant!5941 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36546 (_ BitVec 32)) SeekEntryResult!5941)

(assert (=> b!584830 (= lt!265720 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!53700 res!372537) b!584829))

(assert (= (and b!584829 res!372541) b!584821))

(assert (= (and b!584821 res!372533) b!584820))

(assert (= (and b!584820 res!372539) b!584823))

(assert (= (and b!584823 res!372534) b!584830))

(assert (= (and b!584830 res!372540) b!584828))

(assert (= (and b!584828 res!372536) b!584822))

(assert (= (and b!584822 res!372531) b!584827))

(assert (= (and b!584827 res!372535) b!584824))

(assert (= (and b!584824 res!372538) b!584826))

(assert (= (and b!584826 res!372532) b!584825))

(assert (= (and b!584825 res!372530) b!584819))

(declare-fun m!563303 () Bool)

(assert (=> b!584830 m!563303))

(declare-fun m!563305 () Bool)

(assert (=> b!584821 m!563305))

(assert (=> b!584821 m!563305))

(declare-fun m!563307 () Bool)

(assert (=> b!584821 m!563307))

(assert (=> b!584824 m!563305))

(assert (=> b!584824 m!563305))

(declare-fun m!563309 () Bool)

(assert (=> b!584824 m!563309))

(declare-fun m!563311 () Bool)

(assert (=> b!584822 m!563311))

(declare-fun m!563313 () Bool)

(assert (=> b!584827 m!563313))

(declare-fun m!563315 () Bool)

(assert (=> b!584827 m!563315))

(declare-fun m!563317 () Bool)

(assert (=> b!584827 m!563317))

(declare-fun m!563319 () Bool)

(assert (=> b!584828 m!563319))

(declare-fun m!563321 () Bool)

(assert (=> b!584825 m!563321))

(declare-fun m!563323 () Bool)

(assert (=> b!584820 m!563323))

(declare-fun m!563325 () Bool)

(assert (=> b!584826 m!563325))

(assert (=> b!584826 m!563305))

(declare-fun m!563327 () Bool)

(assert (=> b!584823 m!563327))

(assert (=> b!584819 m!563305))

(assert (=> b!584819 m!563305))

(declare-fun m!563329 () Bool)

(assert (=> b!584819 m!563329))

(declare-fun m!563331 () Bool)

(assert (=> start!53700 m!563331))

(declare-fun m!563333 () Bool)

(assert (=> start!53700 m!563333))

(check-sat (not b!584822) (not b!584824) (not start!53700) (not b!584823) (not b!584819) (not b!584825) (not b!584821) (not b!584820) (not b!584830) (not b!584828))
(check-sat)
