; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53502 () Bool)

(assert start!53502)

(declare-fun b!582327 () Bool)

(declare-fun res!370145 () Bool)

(declare-fun e!333949 () Bool)

(assert (=> b!582327 (=> (not res!370145) (not e!333949))))

(declare-datatypes ((array!36403 0))(
  ( (array!36404 (arr!17476 (Array (_ BitVec 32) (_ BitVec 64))) (size!17840 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36403)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!582327 (= res!370145 (validKeyInArray!0 (select (arr!17476 a!2986) j!136)))))

(declare-fun b!582328 () Bool)

(declare-fun res!370147 () Bool)

(declare-fun e!333951 () Bool)

(assert (=> b!582328 (=> (not res!370147) (not e!333951))))

(declare-datatypes ((List!11517 0))(
  ( (Nil!11514) (Cons!11513 (h!12558 (_ BitVec 64)) (t!17745 List!11517)) )
))
(declare-fun arrayNoDuplicates!0 (array!36403 (_ BitVec 32) List!11517) Bool)

(assert (=> b!582328 (= res!370147 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11514))))

(declare-fun b!582329 () Bool)

(declare-fun res!370149 () Bool)

(assert (=> b!582329 (=> (not res!370149) (not e!333949))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36403 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!582329 (= res!370149 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!582330 () Bool)

(declare-fun res!370143 () Bool)

(assert (=> b!582330 (=> (not res!370143) (not e!333949))))

(assert (=> b!582330 (= res!370143 (validKeyInArray!0 k0!1786))))

(declare-fun b!582331 () Bool)

(declare-fun res!370151 () Bool)

(assert (=> b!582331 (=> (not res!370151) (not e!333949))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!582331 (= res!370151 (and (= (size!17840 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17840 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17840 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!582332 () Bool)

(declare-fun res!370146 () Bool)

(assert (=> b!582332 (=> (not res!370146) (not e!333951))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!582332 (= res!370146 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17476 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17476 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!370148 () Bool)

(assert (=> start!53502 (=> (not res!370148) (not e!333949))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53502 (= res!370148 (validMask!0 mask!3053))))

(assert (=> start!53502 e!333949))

(assert (=> start!53502 true))

(declare-fun array_inv!13272 (array!36403) Bool)

(assert (=> start!53502 (array_inv!13272 a!2986)))

(declare-fun b!582333 () Bool)

(assert (=> b!582333 (= e!333949 e!333951)))

(declare-fun res!370150 () Bool)

(assert (=> b!582333 (=> (not res!370150) (not e!333951))))

(declare-datatypes ((SeekEntryResult!5916 0))(
  ( (MissingZero!5916 (index!25891 (_ BitVec 32))) (Found!5916 (index!25892 (_ BitVec 32))) (Intermediate!5916 (undefined!6728 Bool) (index!25893 (_ BitVec 32)) (x!54745 (_ BitVec 32))) (Undefined!5916) (MissingVacant!5916 (index!25894 (_ BitVec 32))) )
))
(declare-fun lt!265089 () SeekEntryResult!5916)

(assert (=> b!582333 (= res!370150 (or (= lt!265089 (MissingZero!5916 i!1108)) (= lt!265089 (MissingVacant!5916 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36403 (_ BitVec 32)) SeekEntryResult!5916)

(assert (=> b!582333 (= lt!265089 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!582334 () Bool)

(declare-fun res!370144 () Bool)

(assert (=> b!582334 (=> (not res!370144) (not e!333951))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36403 (_ BitVec 32)) Bool)

(assert (=> b!582334 (= res!370144 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!582335 () Bool)

(assert (=> b!582335 (= e!333951 false)))

(declare-fun lt!265090 () SeekEntryResult!5916)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36403 (_ BitVec 32)) SeekEntryResult!5916)

(assert (=> b!582335 (= lt!265090 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17476 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!53502 res!370148) b!582331))

(assert (= (and b!582331 res!370151) b!582327))

(assert (= (and b!582327 res!370145) b!582330))

(assert (= (and b!582330 res!370143) b!582329))

(assert (= (and b!582329 res!370149) b!582333))

(assert (= (and b!582333 res!370150) b!582334))

(assert (= (and b!582334 res!370144) b!582328))

(assert (= (and b!582328 res!370147) b!582332))

(assert (= (and b!582332 res!370146) b!582335))

(declare-fun m!560835 () Bool)

(assert (=> b!582333 m!560835))

(declare-fun m!560837 () Bool)

(assert (=> b!582330 m!560837))

(declare-fun m!560839 () Bool)

(assert (=> b!582329 m!560839))

(declare-fun m!560841 () Bool)

(assert (=> b!582334 m!560841))

(declare-fun m!560843 () Bool)

(assert (=> start!53502 m!560843))

(declare-fun m!560845 () Bool)

(assert (=> start!53502 m!560845))

(declare-fun m!560847 () Bool)

(assert (=> b!582327 m!560847))

(assert (=> b!582327 m!560847))

(declare-fun m!560849 () Bool)

(assert (=> b!582327 m!560849))

(declare-fun m!560851 () Bool)

(assert (=> b!582332 m!560851))

(declare-fun m!560853 () Bool)

(assert (=> b!582332 m!560853))

(declare-fun m!560855 () Bool)

(assert (=> b!582332 m!560855))

(declare-fun m!560857 () Bool)

(assert (=> b!582328 m!560857))

(assert (=> b!582335 m!560847))

(assert (=> b!582335 m!560847))

(declare-fun m!560859 () Bool)

(assert (=> b!582335 m!560859))

(check-sat (not b!582334) (not b!582327) (not b!582330) (not b!582329) (not b!582335) (not start!53502) (not b!582333) (not b!582328))
