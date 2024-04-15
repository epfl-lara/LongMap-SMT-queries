; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53550 () Bool)

(assert start!53550)

(declare-fun b!582920 () Bool)

(declare-fun res!370878 () Bool)

(declare-fun e!334064 () Bool)

(assert (=> b!582920 (=> (not res!370878) (not e!334064))))

(declare-datatypes ((array!36465 0))(
  ( (array!36466 (arr!17507 (Array (_ BitVec 32) (_ BitVec 64))) (size!17872 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36465)

(declare-datatypes ((List!11587 0))(
  ( (Nil!11584) (Cons!11583 (h!12628 (_ BitVec 64)) (t!17806 List!11587)) )
))
(declare-fun arrayNoDuplicates!0 (array!36465 (_ BitVec 32) List!11587) Bool)

(assert (=> b!582920 (= res!370878 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11584))))

(declare-fun b!582921 () Bool)

(assert (=> b!582921 (= e!334064 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5944 0))(
  ( (MissingZero!5944 (index!26003 (_ BitVec 32))) (Found!5944 (index!26004 (_ BitVec 32))) (Intermediate!5944 (undefined!6756 Bool) (index!26005 (_ BitVec 32)) (x!54856 (_ BitVec 32))) (Undefined!5944) (MissingVacant!5944 (index!26006 (_ BitVec 32))) )
))
(declare-fun lt!265048 () SeekEntryResult!5944)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36465 (_ BitVec 32)) SeekEntryResult!5944)

(assert (=> b!582921 (= lt!265048 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17507 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!582922 () Bool)

(declare-fun e!334063 () Bool)

(assert (=> b!582922 (= e!334063 e!334064)))

(declare-fun res!370883 () Bool)

(assert (=> b!582922 (=> (not res!370883) (not e!334064))))

(declare-fun lt!265047 () SeekEntryResult!5944)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!582922 (= res!370883 (or (= lt!265047 (MissingZero!5944 i!1108)) (= lt!265047 (MissingVacant!5944 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36465 (_ BitVec 32)) SeekEntryResult!5944)

(assert (=> b!582922 (= lt!265047 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!582923 () Bool)

(declare-fun res!370879 () Bool)

(assert (=> b!582923 (=> (not res!370879) (not e!334063))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!582923 (= res!370879 (validKeyInArray!0 k0!1786))))

(declare-fun b!582924 () Bool)

(declare-fun res!370880 () Bool)

(assert (=> b!582924 (=> (not res!370880) (not e!334063))))

(assert (=> b!582924 (= res!370880 (and (= (size!17872 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17872 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17872 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!582926 () Bool)

(declare-fun res!370884 () Bool)

(assert (=> b!582926 (=> (not res!370884) (not e!334064))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36465 (_ BitVec 32)) Bool)

(assert (=> b!582926 (= res!370884 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!582927 () Bool)

(declare-fun res!370882 () Bool)

(assert (=> b!582927 (=> (not res!370882) (not e!334063))))

(assert (=> b!582927 (= res!370882 (validKeyInArray!0 (select (arr!17507 a!2986) j!136)))))

(declare-fun b!582928 () Bool)

(declare-fun res!370886 () Bool)

(assert (=> b!582928 (=> (not res!370886) (not e!334064))))

(assert (=> b!582928 (= res!370886 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17507 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17507 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!582925 () Bool)

(declare-fun res!370885 () Bool)

(assert (=> b!582925 (=> (not res!370885) (not e!334063))))

(declare-fun arrayContainsKey!0 (array!36465 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!582925 (= res!370885 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!370881 () Bool)

(assert (=> start!53550 (=> (not res!370881) (not e!334063))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53550 (= res!370881 (validMask!0 mask!3053))))

(assert (=> start!53550 e!334063))

(assert (=> start!53550 true))

(declare-fun array_inv!13390 (array!36465) Bool)

(assert (=> start!53550 (array_inv!13390 a!2986)))

(assert (= (and start!53550 res!370881) b!582924))

(assert (= (and b!582924 res!370880) b!582927))

(assert (= (and b!582927 res!370882) b!582923))

(assert (= (and b!582923 res!370879) b!582925))

(assert (= (and b!582925 res!370885) b!582922))

(assert (= (and b!582922 res!370883) b!582926))

(assert (= (and b!582926 res!370884) b!582920))

(assert (= (and b!582920 res!370878) b!582928))

(assert (= (and b!582928 res!370886) b!582921))

(declare-fun m!560881 () Bool)

(assert (=> b!582925 m!560881))

(declare-fun m!560883 () Bool)

(assert (=> b!582926 m!560883))

(declare-fun m!560885 () Bool)

(assert (=> b!582920 m!560885))

(declare-fun m!560887 () Bool)

(assert (=> b!582923 m!560887))

(declare-fun m!560889 () Bool)

(assert (=> start!53550 m!560889))

(declare-fun m!560891 () Bool)

(assert (=> start!53550 m!560891))

(declare-fun m!560893 () Bool)

(assert (=> b!582928 m!560893))

(declare-fun m!560895 () Bool)

(assert (=> b!582928 m!560895))

(declare-fun m!560897 () Bool)

(assert (=> b!582928 m!560897))

(declare-fun m!560899 () Bool)

(assert (=> b!582921 m!560899))

(assert (=> b!582921 m!560899))

(declare-fun m!560901 () Bool)

(assert (=> b!582921 m!560901))

(declare-fun m!560903 () Bool)

(assert (=> b!582922 m!560903))

(assert (=> b!582927 m!560899))

(assert (=> b!582927 m!560899))

(declare-fun m!560905 () Bool)

(assert (=> b!582927 m!560905))

(check-sat (not b!582920) (not start!53550) (not b!582925) (not b!582927) (not b!582923) (not b!582921) (not b!582926) (not b!582922))
(check-sat)
