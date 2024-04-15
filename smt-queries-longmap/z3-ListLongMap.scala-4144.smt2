; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56490 () Bool)

(assert start!56490)

(declare-fun b!625888 () Bool)

(declare-fun res!403875 () Bool)

(declare-fun e!358624 () Bool)

(assert (=> b!625888 (=> (not res!403875) (not e!358624))))

(declare-datatypes ((array!37839 0))(
  ( (array!37840 (arr!18161 (Array (_ BitVec 32) (_ BitVec 64))) (size!18526 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37839)

(declare-datatypes ((List!12241 0))(
  ( (Nil!12238) (Cons!12237 (h!13282 (_ BitVec 64)) (t!18460 List!12241)) )
))
(declare-fun arrayNoDuplicates!0 (array!37839 (_ BitVec 32) List!12241) Bool)

(assert (=> b!625888 (= res!403875 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12238))))

(declare-fun res!403876 () Bool)

(declare-fun e!358625 () Bool)

(assert (=> start!56490 (=> (not res!403876) (not e!358625))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56490 (= res!403876 (validMask!0 mask!3053))))

(assert (=> start!56490 e!358625))

(assert (=> start!56490 true))

(declare-fun array_inv!14044 (array!37839) Bool)

(assert (=> start!56490 (array_inv!14044 a!2986)))

(declare-fun b!625889 () Bool)

(declare-fun res!403879 () Bool)

(assert (=> b!625889 (=> (not res!403879) (not e!358624))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37839 (_ BitVec 32)) Bool)

(assert (=> b!625889 (= res!403879 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!625890 () Bool)

(declare-fun res!403880 () Bool)

(assert (=> b!625890 (=> (not res!403880) (not e!358625))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!625890 (= res!403880 (validKeyInArray!0 (select (arr!18161 a!2986) j!136)))))

(declare-fun b!625891 () Bool)

(assert (=> b!625891 (= e!358625 e!358624)))

(declare-fun res!403882 () Bool)

(assert (=> b!625891 (=> (not res!403882) (not e!358624))))

(declare-datatypes ((SeekEntryResult!6598 0))(
  ( (MissingZero!6598 (index!28676 (_ BitVec 32))) (Found!6598 (index!28677 (_ BitVec 32))) (Intermediate!6598 (undefined!7410 Bool) (index!28678 (_ BitVec 32)) (x!57434 (_ BitVec 32))) (Undefined!6598) (MissingVacant!6598 (index!28679 (_ BitVec 32))) )
))
(declare-fun lt!289774 () SeekEntryResult!6598)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!625891 (= res!403882 (or (= lt!289774 (MissingZero!6598 i!1108)) (= lt!289774 (MissingVacant!6598 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37839 (_ BitVec 32)) SeekEntryResult!6598)

(assert (=> b!625891 (= lt!289774 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!625892 () Bool)

(declare-fun res!403874 () Bool)

(assert (=> b!625892 (=> (not res!403874) (not e!358625))))

(declare-fun arrayContainsKey!0 (array!37839 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!625892 (= res!403874 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!625893 () Bool)

(declare-fun res!403883 () Bool)

(assert (=> b!625893 (=> (not res!403883) (not e!358624))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!625893 (= res!403883 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18161 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18161 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!625894 () Bool)

(declare-fun res!403878 () Bool)

(assert (=> b!625894 (=> (not res!403878) (not e!358624))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37839 (_ BitVec 32)) SeekEntryResult!6598)

(assert (=> b!625894 (= res!403878 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18161 a!2986) j!136) a!2986 mask!3053) (Found!6598 j!136)))))

(declare-fun b!625895 () Bool)

(declare-fun res!403877 () Bool)

(assert (=> b!625895 (=> (not res!403877) (not e!358625))))

(assert (=> b!625895 (= res!403877 (and (= (size!18526 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18526 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18526 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!625896 () Bool)

(assert (=> b!625896 (= e!358624 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18161 a!2986) index!984) (select (arr!18161 a!2986) j!136))) (bvsge index!984 (size!18526 a!2986))))))

(declare-fun b!625897 () Bool)

(declare-fun res!403881 () Bool)

(assert (=> b!625897 (=> (not res!403881) (not e!358625))))

(assert (=> b!625897 (= res!403881 (validKeyInArray!0 k0!1786))))

(assert (= (and start!56490 res!403876) b!625895))

(assert (= (and b!625895 res!403877) b!625890))

(assert (= (and b!625890 res!403880) b!625897))

(assert (= (and b!625897 res!403881) b!625892))

(assert (= (and b!625892 res!403874) b!625891))

(assert (= (and b!625891 res!403882) b!625889))

(assert (= (and b!625889 res!403879) b!625888))

(assert (= (and b!625888 res!403875) b!625893))

(assert (= (and b!625893 res!403883) b!625894))

(assert (= (and b!625894 res!403878) b!625896))

(declare-fun m!600865 () Bool)

(assert (=> b!625894 m!600865))

(assert (=> b!625894 m!600865))

(declare-fun m!600867 () Bool)

(assert (=> b!625894 m!600867))

(assert (=> b!625890 m!600865))

(assert (=> b!625890 m!600865))

(declare-fun m!600869 () Bool)

(assert (=> b!625890 m!600869))

(declare-fun m!600871 () Bool)

(assert (=> b!625896 m!600871))

(assert (=> b!625896 m!600865))

(declare-fun m!600873 () Bool)

(assert (=> start!56490 m!600873))

(declare-fun m!600875 () Bool)

(assert (=> start!56490 m!600875))

(declare-fun m!600877 () Bool)

(assert (=> b!625888 m!600877))

(declare-fun m!600879 () Bool)

(assert (=> b!625889 m!600879))

(declare-fun m!600881 () Bool)

(assert (=> b!625893 m!600881))

(declare-fun m!600883 () Bool)

(assert (=> b!625893 m!600883))

(declare-fun m!600885 () Bool)

(assert (=> b!625893 m!600885))

(declare-fun m!600887 () Bool)

(assert (=> b!625892 m!600887))

(declare-fun m!600889 () Bool)

(assert (=> b!625897 m!600889))

(declare-fun m!600891 () Bool)

(assert (=> b!625891 m!600891))

(check-sat (not b!625897) (not b!625892) (not b!625894) (not b!625888) (not start!56490) (not b!625891) (not b!625890) (not b!625889))
(check-sat)
