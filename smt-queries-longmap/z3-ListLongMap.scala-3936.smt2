; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53610 () Bool)

(assert start!53610)

(declare-fun b!583908 () Bool)

(declare-fun res!371872 () Bool)

(declare-fun e!334390 () Bool)

(assert (=> b!583908 (=> (not res!371872) (not e!334390))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36525 0))(
  ( (array!36526 (arr!17537 (Array (_ BitVec 32) (_ BitVec 64))) (size!17902 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36525)

(assert (=> b!583908 (= res!371872 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17537 a!2986) index!984) (select (arr!17537 a!2986) j!136))) (not (= (select (arr!17537 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!583909 () Bool)

(declare-fun res!371870 () Bool)

(assert (=> b!583909 (=> (not res!371870) (not e!334390))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36525 (_ BitVec 32)) Bool)

(assert (=> b!583909 (= res!371870 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!583910 () Bool)

(declare-fun res!371876 () Bool)

(declare-fun e!334389 () Bool)

(assert (=> b!583910 (=> (not res!371876) (not e!334389))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!583910 (= res!371876 (and (= (size!17902 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17902 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17902 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!583911 () Bool)

(declare-fun res!371865 () Bool)

(assert (=> b!583911 (=> (not res!371865) (not e!334390))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5974 0))(
  ( (MissingZero!5974 (index!26123 (_ BitVec 32))) (Found!5974 (index!26124 (_ BitVec 32))) (Intermediate!5974 (undefined!6786 Bool) (index!26125 (_ BitVec 32)) (x!54966 (_ BitVec 32))) (Undefined!5974) (MissingVacant!5974 (index!26126 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36525 (_ BitVec 32)) SeekEntryResult!5974)

(assert (=> b!583911 (= res!371865 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17537 a!2986) j!136) a!2986 mask!3053) (Found!5974 j!136)))))

(declare-fun res!371874 () Bool)

(assert (=> start!53610 (=> (not res!371874) (not e!334389))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53610 (= res!371874 (validMask!0 mask!3053))))

(assert (=> start!53610 e!334389))

(assert (=> start!53610 true))

(declare-fun array_inv!13420 (array!36525) Bool)

(assert (=> start!53610 (array_inv!13420 a!2986)))

(declare-fun b!583907 () Bool)

(declare-fun res!371871 () Bool)

(assert (=> b!583907 (=> (not res!371871) (not e!334389))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!583907 (= res!371871 (validKeyInArray!0 (select (arr!17537 a!2986) j!136)))))

(declare-fun b!583912 () Bool)

(assert (=> b!583912 (= e!334389 e!334390)))

(declare-fun res!371867 () Bool)

(assert (=> b!583912 (=> (not res!371867) (not e!334390))))

(declare-fun lt!265276 () SeekEntryResult!5974)

(assert (=> b!583912 (= res!371867 (or (= lt!265276 (MissingZero!5974 i!1108)) (= lt!265276 (MissingVacant!5974 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36525 (_ BitVec 32)) SeekEntryResult!5974)

(assert (=> b!583912 (= lt!265276 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!583913 () Bool)

(declare-fun res!371875 () Bool)

(assert (=> b!583913 (=> (not res!371875) (not e!334389))))

(assert (=> b!583913 (= res!371875 (validKeyInArray!0 k0!1786))))

(declare-fun b!583914 () Bool)

(declare-fun res!371868 () Bool)

(assert (=> b!583914 (=> (not res!371868) (not e!334390))))

(assert (=> b!583914 (= res!371868 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17537 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17537 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!583915 () Bool)

(declare-fun e!334391 () Bool)

(assert (=> b!583915 (= e!334391 false)))

(declare-fun lt!265274 () (_ BitVec 32))

(declare-fun lt!265275 () SeekEntryResult!5974)

(assert (=> b!583915 (= lt!265275 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265274 vacantSpotIndex!68 (select (arr!17537 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!583916 () Bool)

(declare-fun res!371869 () Bool)

(assert (=> b!583916 (=> (not res!371869) (not e!334389))))

(declare-fun arrayContainsKey!0 (array!36525 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!583916 (= res!371869 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!583917 () Bool)

(declare-fun res!371873 () Bool)

(assert (=> b!583917 (=> (not res!371873) (not e!334390))))

(declare-datatypes ((List!11617 0))(
  ( (Nil!11614) (Cons!11613 (h!12658 (_ BitVec 64)) (t!17836 List!11617)) )
))
(declare-fun arrayNoDuplicates!0 (array!36525 (_ BitVec 32) List!11617) Bool)

(assert (=> b!583917 (= res!371873 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11614))))

(declare-fun b!583918 () Bool)

(assert (=> b!583918 (= e!334390 e!334391)))

(declare-fun res!371866 () Bool)

(assert (=> b!583918 (=> (not res!371866) (not e!334391))))

(assert (=> b!583918 (= res!371866 (and (bvsge lt!265274 #b00000000000000000000000000000000) (bvslt lt!265274 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!583918 (= lt!265274 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!53610 res!371874) b!583910))

(assert (= (and b!583910 res!371876) b!583907))

(assert (= (and b!583907 res!371871) b!583913))

(assert (= (and b!583913 res!371875) b!583916))

(assert (= (and b!583916 res!371869) b!583912))

(assert (= (and b!583912 res!371867) b!583909))

(assert (= (and b!583909 res!371870) b!583917))

(assert (= (and b!583917 res!371873) b!583914))

(assert (= (and b!583914 res!371868) b!583911))

(assert (= (and b!583911 res!371865) b!583908))

(assert (= (and b!583908 res!371872) b!583918))

(assert (= (and b!583918 res!371866) b!583915))

(declare-fun m!561775 () Bool)

(assert (=> b!583907 m!561775))

(assert (=> b!583907 m!561775))

(declare-fun m!561777 () Bool)

(assert (=> b!583907 m!561777))

(declare-fun m!561779 () Bool)

(assert (=> b!583918 m!561779))

(declare-fun m!561781 () Bool)

(assert (=> start!53610 m!561781))

(declare-fun m!561783 () Bool)

(assert (=> start!53610 m!561783))

(assert (=> b!583911 m!561775))

(assert (=> b!583911 m!561775))

(declare-fun m!561785 () Bool)

(assert (=> b!583911 m!561785))

(declare-fun m!561787 () Bool)

(assert (=> b!583912 m!561787))

(declare-fun m!561789 () Bool)

(assert (=> b!583914 m!561789))

(declare-fun m!561791 () Bool)

(assert (=> b!583914 m!561791))

(declare-fun m!561793 () Bool)

(assert (=> b!583914 m!561793))

(declare-fun m!561795 () Bool)

(assert (=> b!583916 m!561795))

(declare-fun m!561797 () Bool)

(assert (=> b!583917 m!561797))

(declare-fun m!561799 () Bool)

(assert (=> b!583913 m!561799))

(assert (=> b!583915 m!561775))

(assert (=> b!583915 m!561775))

(declare-fun m!561801 () Bool)

(assert (=> b!583915 m!561801))

(declare-fun m!561803 () Bool)

(assert (=> b!583908 m!561803))

(assert (=> b!583908 m!561775))

(declare-fun m!561805 () Bool)

(assert (=> b!583909 m!561805))

(check-sat (not b!583911) (not b!583907) (not b!583916) (not b!583909) (not b!583912) (not b!583913) (not b!583918) (not start!53610) (not b!583917) (not b!583915))
(check-sat)
