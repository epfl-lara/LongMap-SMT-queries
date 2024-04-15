; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53724 () Bool)

(assert start!53724)

(declare-fun b!585903 () Bool)

(declare-fun res!373862 () Bool)

(declare-fun e!335017 () Bool)

(assert (=> b!585903 (=> (not res!373862) (not e!335017))))

(declare-datatypes ((array!36639 0))(
  ( (array!36640 (arr!17594 (Array (_ BitVec 32) (_ BitVec 64))) (size!17959 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36639)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!585903 (= res!373862 (validKeyInArray!0 (select (arr!17594 a!2986) j!136)))))

(declare-fun b!585904 () Bool)

(declare-fun res!373867 () Bool)

(declare-fun e!335018 () Bool)

(assert (=> b!585904 (=> (not res!373867) (not e!335018))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6031 0))(
  ( (MissingZero!6031 (index!26351 (_ BitVec 32))) (Found!6031 (index!26352 (_ BitVec 32))) (Intermediate!6031 (undefined!6843 Bool) (index!26353 (_ BitVec 32)) (x!55175 (_ BitVec 32))) (Undefined!6031) (MissingVacant!6031 (index!26354 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36639 (_ BitVec 32)) SeekEntryResult!6031)

(assert (=> b!585904 (= res!373867 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17594 a!2986) j!136) a!2986 mask!3053) (Found!6031 j!136)))))

(declare-fun b!585906 () Bool)

(declare-fun res!373864 () Bool)

(assert (=> b!585906 (=> (not res!373864) (not e!335018))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!585906 (= res!373864 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17594 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17594 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!585907 () Bool)

(declare-fun res!373868 () Bool)

(assert (=> b!585907 (=> (not res!373868) (not e!335017))))

(assert (=> b!585907 (= res!373868 (validKeyInArray!0 k0!1786))))

(declare-fun b!585908 () Bool)

(declare-fun res!373863 () Bool)

(assert (=> b!585908 (=> (not res!373863) (not e!335018))))

(declare-datatypes ((List!11674 0))(
  ( (Nil!11671) (Cons!11670 (h!12715 (_ BitVec 64)) (t!17893 List!11674)) )
))
(declare-fun arrayNoDuplicates!0 (array!36639 (_ BitVec 32) List!11674) Bool)

(assert (=> b!585908 (= res!373863 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11671))))

(declare-fun b!585909 () Bool)

(declare-fun res!373866 () Bool)

(assert (=> b!585909 (=> (not res!373866) (not e!335018))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36639 (_ BitVec 32)) Bool)

(assert (=> b!585909 (= res!373866 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!585910 () Bool)

(declare-fun res!373861 () Bool)

(assert (=> b!585910 (=> (not res!373861) (not e!335018))))

(assert (=> b!585910 (= res!373861 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17594 a!2986) index!984) (select (arr!17594 a!2986) j!136))) (not (= (select (arr!17594 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!585911 () Bool)

(assert (=> b!585911 (= e!335018 (not true))))

(declare-fun lt!265789 () (_ BitVec 32))

(assert (=> b!585911 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265789 vacantSpotIndex!68 (select (arr!17594 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265789 vacantSpotIndex!68 (select (store (arr!17594 a!2986) i!1108 k0!1786) j!136) (array!36640 (store (arr!17594 a!2986) i!1108 k0!1786) (size!17959 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18168 0))(
  ( (Unit!18169) )
))
(declare-fun lt!265788 () Unit!18168)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36639 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18168)

(assert (=> b!585911 (= lt!265788 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!265789 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!585911 (= lt!265789 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!585912 () Bool)

(declare-fun res!373869 () Bool)

(assert (=> b!585912 (=> (not res!373869) (not e!335017))))

(declare-fun arrayContainsKey!0 (array!36639 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!585912 (= res!373869 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!585913 () Bool)

(assert (=> b!585913 (= e!335017 e!335018)))

(declare-fun res!373871 () Bool)

(assert (=> b!585913 (=> (not res!373871) (not e!335018))))

(declare-fun lt!265787 () SeekEntryResult!6031)

(assert (=> b!585913 (= res!373871 (or (= lt!265787 (MissingZero!6031 i!1108)) (= lt!265787 (MissingVacant!6031 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36639 (_ BitVec 32)) SeekEntryResult!6031)

(assert (=> b!585913 (= lt!265787 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!373865 () Bool)

(assert (=> start!53724 (=> (not res!373865) (not e!335017))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53724 (= res!373865 (validMask!0 mask!3053))))

(assert (=> start!53724 e!335017))

(assert (=> start!53724 true))

(declare-fun array_inv!13477 (array!36639) Bool)

(assert (=> start!53724 (array_inv!13477 a!2986)))

(declare-fun b!585905 () Bool)

(declare-fun res!373870 () Bool)

(assert (=> b!585905 (=> (not res!373870) (not e!335017))))

(assert (=> b!585905 (= res!373870 (and (= (size!17959 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17959 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17959 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53724 res!373865) b!585905))

(assert (= (and b!585905 res!373870) b!585903))

(assert (= (and b!585903 res!373862) b!585907))

(assert (= (and b!585907 res!373868) b!585912))

(assert (= (and b!585912 res!373869) b!585913))

(assert (= (and b!585913 res!373871) b!585909))

(assert (= (and b!585909 res!373866) b!585908))

(assert (= (and b!585908 res!373863) b!585906))

(assert (= (and b!585906 res!373864) b!585904))

(assert (= (and b!585904 res!373867) b!585910))

(assert (= (and b!585910 res!373861) b!585911))

(declare-fun m!563707 () Bool)

(assert (=> b!585908 m!563707))

(declare-fun m!563709 () Bool)

(assert (=> b!585907 m!563709))

(declare-fun m!563711 () Bool)

(assert (=> b!585904 m!563711))

(assert (=> b!585904 m!563711))

(declare-fun m!563713 () Bool)

(assert (=> b!585904 m!563713))

(declare-fun m!563715 () Bool)

(assert (=> start!53724 m!563715))

(declare-fun m!563717 () Bool)

(assert (=> start!53724 m!563717))

(declare-fun m!563719 () Bool)

(assert (=> b!585909 m!563719))

(declare-fun m!563721 () Bool)

(assert (=> b!585910 m!563721))

(assert (=> b!585910 m!563711))

(declare-fun m!563723 () Bool)

(assert (=> b!585913 m!563723))

(declare-fun m!563725 () Bool)

(assert (=> b!585911 m!563725))

(declare-fun m!563727 () Bool)

(assert (=> b!585911 m!563727))

(declare-fun m!563729 () Bool)

(assert (=> b!585911 m!563729))

(assert (=> b!585911 m!563711))

(declare-fun m!563731 () Bool)

(assert (=> b!585911 m!563731))

(assert (=> b!585911 m!563711))

(declare-fun m!563733 () Bool)

(assert (=> b!585911 m!563733))

(assert (=> b!585911 m!563727))

(declare-fun m!563735 () Bool)

(assert (=> b!585911 m!563735))

(declare-fun m!563737 () Bool)

(assert (=> b!585912 m!563737))

(assert (=> b!585903 m!563711))

(assert (=> b!585903 m!563711))

(declare-fun m!563739 () Bool)

(assert (=> b!585903 m!563739))

(declare-fun m!563741 () Bool)

(assert (=> b!585906 m!563741))

(assert (=> b!585906 m!563731))

(declare-fun m!563743 () Bool)

(assert (=> b!585906 m!563743))

(check-sat (not b!585912) (not b!585909) (not start!53724) (not b!585907) (not b!585908) (not b!585913) (not b!585904) (not b!585903) (not b!585911))
(check-sat)
