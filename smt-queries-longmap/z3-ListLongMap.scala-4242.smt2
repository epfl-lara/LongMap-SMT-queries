; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58634 () Bool)

(assert start!58634)

(declare-fun b!646874 () Bool)

(declare-fun e!370860 () Bool)

(declare-fun e!370855 () Bool)

(assert (=> b!646874 (= e!370860 e!370855)))

(declare-fun res!419183 () Bool)

(assert (=> b!646874 (=> res!419183 e!370855)))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!646874 (= res!419183 (bvsge index!984 j!136))))

(declare-datatypes ((Unit!21980 0))(
  ( (Unit!21981) )
))
(declare-fun lt!300057 () Unit!21980)

(declare-fun e!370858 () Unit!21980)

(assert (=> b!646874 (= lt!300057 e!370858)))

(declare-fun c!74217 () Bool)

(assert (=> b!646874 (= c!74217 (bvslt j!136 index!984))))

(declare-fun b!646875 () Bool)

(declare-fun res!419192 () Bool)

(declare-fun e!370869 () Bool)

(assert (=> b!646875 (=> (not res!419192) (not e!370869))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!38493 0))(
  ( (array!38494 (arr!18455 (Array (_ BitVec 32) (_ BitVec 64))) (size!18820 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38493)

(assert (=> b!646875 (= res!419192 (and (= (size!18820 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18820 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18820 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!646876 () Bool)

(declare-fun e!370866 () Bool)

(assert (=> b!646876 (= e!370855 e!370866)))

(declare-fun res!419188 () Bool)

(assert (=> b!646876 (=> res!419188 e!370866)))

(assert (=> b!646876 (= res!419188 (or (bvsge (size!18820 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18820 a!2986))))))

(declare-fun lt!300064 () array!38493)

(declare-fun arrayContainsKey!0 (array!38493 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!646876 (arrayContainsKey!0 lt!300064 (select (arr!18455 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!300055 () Unit!21980)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38493 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21980)

(assert (=> b!646876 (= lt!300055 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!300064 (select (arr!18455 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!370868 () Bool)

(assert (=> b!646876 e!370868))

(declare-fun res!419177 () Bool)

(assert (=> b!646876 (=> (not res!419177) (not e!370868))))

(assert (=> b!646876 (= res!419177 (arrayContainsKey!0 lt!300064 (select (arr!18455 a!2986) j!136) j!136))))

(declare-fun b!646877 () Bool)

(declare-fun e!370857 () Bool)

(assert (=> b!646877 (= e!370857 e!370860)))

(declare-fun res!419194 () Bool)

(assert (=> b!646877 (=> res!419194 e!370860)))

(declare-fun lt!300052 () (_ BitVec 64))

(declare-fun lt!300062 () (_ BitVec 64))

(assert (=> b!646877 (= res!419194 (or (not (= (select (arr!18455 a!2986) j!136) lt!300052)) (not (= (select (arr!18455 a!2986) j!136) lt!300062))))))

(declare-fun e!370861 () Bool)

(assert (=> b!646877 e!370861))

(declare-fun res!419182 () Bool)

(assert (=> b!646877 (=> (not res!419182) (not e!370861))))

(assert (=> b!646877 (= res!419182 (= lt!300062 (select (arr!18455 a!2986) j!136)))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!646877 (= lt!300062 (select (store (arr!18455 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!646878 () Bool)

(declare-fun e!370862 () Bool)

(declare-datatypes ((SeekEntryResult!6892 0))(
  ( (MissingZero!6892 (index!29909 (_ BitVec 32))) (Found!6892 (index!29910 (_ BitVec 32))) (Intermediate!6892 (undefined!7704 Bool) (index!29911 (_ BitVec 32)) (x!58698 (_ BitVec 32))) (Undefined!6892) (MissingVacant!6892 (index!29912 (_ BitVec 32))) )
))
(declare-fun lt!300065 () SeekEntryResult!6892)

(declare-fun lt!300061 () SeekEntryResult!6892)

(assert (=> b!646878 (= e!370862 (= lt!300065 lt!300061))))

(declare-fun b!646879 () Bool)

(assert (=> b!646879 (= e!370868 (arrayContainsKey!0 lt!300064 (select (arr!18455 a!2986) j!136) index!984))))

(declare-fun b!646880 () Bool)

(declare-fun Unit!21982 () Unit!21980)

(assert (=> b!646880 (= e!370858 Unit!21982)))

(declare-fun e!370867 () Bool)

(declare-fun b!646881 () Bool)

(assert (=> b!646881 (= e!370867 (arrayContainsKey!0 lt!300064 (select (arr!18455 a!2986) j!136) index!984))))

(declare-fun b!646882 () Bool)

(declare-fun e!370863 () Bool)

(assert (=> b!646882 (= e!370861 e!370863)))

(declare-fun res!419191 () Bool)

(assert (=> b!646882 (=> res!419191 e!370863)))

(assert (=> b!646882 (= res!419191 (or (not (= (select (arr!18455 a!2986) j!136) lt!300052)) (not (= (select (arr!18455 a!2986) j!136) lt!300062)) (bvsge j!136 index!984)))))

(declare-fun b!646883 () Bool)

(declare-fun e!370859 () Unit!21980)

(declare-fun Unit!21983 () Unit!21980)

(assert (=> b!646883 (= e!370859 Unit!21983)))

(declare-fun b!646884 () Bool)

(declare-fun e!370871 () Bool)

(declare-datatypes ((List!12535 0))(
  ( (Nil!12532) (Cons!12531 (h!13576 (_ BitVec 64)) (t!18754 List!12535)) )
))
(declare-fun contains!3136 (List!12535 (_ BitVec 64)) Bool)

(assert (=> b!646884 (= e!370871 (not (contains!3136 Nil!12532 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!646885 () Bool)

(declare-fun res!419195 () Bool)

(assert (=> b!646885 (=> (not res!419195) (not e!370869))))

(assert (=> b!646885 (= res!419195 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!646886 () Bool)

(declare-fun res!419197 () Bool)

(declare-fun e!370864 () Bool)

(assert (=> b!646886 (=> (not res!419197) (not e!370864))))

(declare-fun arrayNoDuplicates!0 (array!38493 (_ BitVec 32) List!12535) Bool)

(assert (=> b!646886 (= res!419197 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12532))))

(declare-fun b!646887 () Bool)

(declare-fun e!370870 () Bool)

(assert (=> b!646887 (= e!370870 (not e!370857))))

(declare-fun res!419185 () Bool)

(assert (=> b!646887 (=> res!419185 e!370857)))

(declare-fun lt!300058 () SeekEntryResult!6892)

(assert (=> b!646887 (= res!419185 (not (= lt!300058 (Found!6892 index!984))))))

(declare-fun lt!300060 () Unit!21980)

(assert (=> b!646887 (= lt!300060 e!370859)))

(declare-fun c!74216 () Bool)

(assert (=> b!646887 (= c!74216 (= lt!300058 Undefined!6892))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38493 (_ BitVec 32)) SeekEntryResult!6892)

(assert (=> b!646887 (= lt!300058 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!300052 lt!300064 mask!3053))))

(assert (=> b!646887 e!370862))

(declare-fun res!419184 () Bool)

(assert (=> b!646887 (=> (not res!419184) (not e!370862))))

(declare-fun lt!300056 () (_ BitVec 32))

(assert (=> b!646887 (= res!419184 (= lt!300061 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300056 vacantSpotIndex!68 lt!300052 lt!300064 mask!3053)))))

(assert (=> b!646887 (= lt!300061 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300056 vacantSpotIndex!68 (select (arr!18455 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!646887 (= lt!300052 (select (store (arr!18455 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!300066 () Unit!21980)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38493 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21980)

(assert (=> b!646887 (= lt!300066 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!300056 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!646887 (= lt!300056 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!646888 () Bool)

(assert (=> b!646888 (= e!370866 e!370871)))

(declare-fun res!419178 () Bool)

(assert (=> b!646888 (=> (not res!419178) (not e!370871))))

(assert (=> b!646888 (= res!419178 (not (contains!3136 Nil!12532 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!419196 () Bool)

(assert (=> start!58634 (=> (not res!419196) (not e!370869))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58634 (= res!419196 (validMask!0 mask!3053))))

(assert (=> start!58634 e!370869))

(assert (=> start!58634 true))

(declare-fun array_inv!14338 (array!38493) Bool)

(assert (=> start!58634 (array_inv!14338 a!2986)))

(declare-fun b!646889 () Bool)

(declare-fun res!419187 () Bool)

(assert (=> b!646889 (=> (not res!419187) (not e!370864))))

(assert (=> b!646889 (= res!419187 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18455 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!646890 () Bool)

(declare-fun res!419179 () Bool)

(assert (=> b!646890 (=> (not res!419179) (not e!370869))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!646890 (= res!419179 (validKeyInArray!0 k0!1786))))

(declare-fun b!646891 () Bool)

(declare-fun e!370856 () Bool)

(assert (=> b!646891 (= e!370856 e!370870)))

(declare-fun res!419193 () Bool)

(assert (=> b!646891 (=> (not res!419193) (not e!370870))))

(assert (=> b!646891 (= res!419193 (and (= lt!300065 (Found!6892 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18455 a!2986) index!984) (select (arr!18455 a!2986) j!136))) (not (= (select (arr!18455 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!646891 (= lt!300065 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18455 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!646892 () Bool)

(declare-fun res!419180 () Bool)

(assert (=> b!646892 (=> (not res!419180) (not e!370869))))

(assert (=> b!646892 (= res!419180 (validKeyInArray!0 (select (arr!18455 a!2986) j!136)))))

(declare-fun b!646893 () Bool)

(declare-fun Unit!21984 () Unit!21980)

(assert (=> b!646893 (= e!370859 Unit!21984)))

(assert (=> b!646893 false))

(declare-fun b!646894 () Bool)

(declare-fun Unit!21985 () Unit!21980)

(assert (=> b!646894 (= e!370858 Unit!21985)))

(declare-fun lt!300054 () Unit!21980)

(assert (=> b!646894 (= lt!300054 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!300064 (select (arr!18455 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!646894 (arrayContainsKey!0 lt!300064 (select (arr!18455 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!300053 () Unit!21980)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38493 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12535) Unit!21980)

(assert (=> b!646894 (= lt!300053 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12532))))

(assert (=> b!646894 (arrayNoDuplicates!0 lt!300064 #b00000000000000000000000000000000 Nil!12532)))

(declare-fun lt!300051 () Unit!21980)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38493 (_ BitVec 32) (_ BitVec 32)) Unit!21980)

(assert (=> b!646894 (= lt!300051 (lemmaNoDuplicateFromThenFromBigger!0 lt!300064 #b00000000000000000000000000000000 j!136))))

(assert (=> b!646894 (arrayNoDuplicates!0 lt!300064 j!136 Nil!12532)))

(declare-fun lt!300063 () Unit!21980)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38493 (_ BitVec 64) (_ BitVec 32) List!12535) Unit!21980)

(assert (=> b!646894 (= lt!300063 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!300064 (select (arr!18455 a!2986) j!136) j!136 Nil!12532))))

(assert (=> b!646894 false))

(declare-fun b!646895 () Bool)

(declare-fun res!419189 () Bool)

(assert (=> b!646895 (=> res!419189 e!370866)))

(declare-fun noDuplicate!419 (List!12535) Bool)

(assert (=> b!646895 (= res!419189 (not (noDuplicate!419 Nil!12532)))))

(declare-fun b!646896 () Bool)

(assert (=> b!646896 (= e!370863 e!370867)))

(declare-fun res!419176 () Bool)

(assert (=> b!646896 (=> (not res!419176) (not e!370867))))

(assert (=> b!646896 (= res!419176 (arrayContainsKey!0 lt!300064 (select (arr!18455 a!2986) j!136) j!136))))

(declare-fun b!646897 () Bool)

(assert (=> b!646897 (= e!370864 e!370856)))

(declare-fun res!419186 () Bool)

(assert (=> b!646897 (=> (not res!419186) (not e!370856))))

(assert (=> b!646897 (= res!419186 (= (select (store (arr!18455 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!646897 (= lt!300064 (array!38494 (store (arr!18455 a!2986) i!1108 k0!1786) (size!18820 a!2986)))))

(declare-fun b!646898 () Bool)

(assert (=> b!646898 (= e!370869 e!370864)))

(declare-fun res!419181 () Bool)

(assert (=> b!646898 (=> (not res!419181) (not e!370864))))

(declare-fun lt!300059 () SeekEntryResult!6892)

(assert (=> b!646898 (= res!419181 (or (= lt!300059 (MissingZero!6892 i!1108)) (= lt!300059 (MissingVacant!6892 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38493 (_ BitVec 32)) SeekEntryResult!6892)

(assert (=> b!646898 (= lt!300059 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!646899 () Bool)

(declare-fun res!419190 () Bool)

(assert (=> b!646899 (=> (not res!419190) (not e!370864))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38493 (_ BitVec 32)) Bool)

(assert (=> b!646899 (= res!419190 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!58634 res!419196) b!646875))

(assert (= (and b!646875 res!419192) b!646892))

(assert (= (and b!646892 res!419180) b!646890))

(assert (= (and b!646890 res!419179) b!646885))

(assert (= (and b!646885 res!419195) b!646898))

(assert (= (and b!646898 res!419181) b!646899))

(assert (= (and b!646899 res!419190) b!646886))

(assert (= (and b!646886 res!419197) b!646889))

(assert (= (and b!646889 res!419187) b!646897))

(assert (= (and b!646897 res!419186) b!646891))

(assert (= (and b!646891 res!419193) b!646887))

(assert (= (and b!646887 res!419184) b!646878))

(assert (= (and b!646887 c!74216) b!646893))

(assert (= (and b!646887 (not c!74216)) b!646883))

(assert (= (and b!646887 (not res!419185)) b!646877))

(assert (= (and b!646877 res!419182) b!646882))

(assert (= (and b!646882 (not res!419191)) b!646896))

(assert (= (and b!646896 res!419176) b!646881))

(assert (= (and b!646877 (not res!419194)) b!646874))

(assert (= (and b!646874 c!74217) b!646894))

(assert (= (and b!646874 (not c!74217)) b!646880))

(assert (= (and b!646874 (not res!419183)) b!646876))

(assert (= (and b!646876 res!419177) b!646879))

(assert (= (and b!646876 (not res!419188)) b!646895))

(assert (= (and b!646895 (not res!419189)) b!646888))

(assert (= (and b!646888 res!419178) b!646884))

(declare-fun m!619809 () Bool)

(assert (=> b!646892 m!619809))

(assert (=> b!646892 m!619809))

(declare-fun m!619811 () Bool)

(assert (=> b!646892 m!619811))

(assert (=> b!646881 m!619809))

(assert (=> b!646881 m!619809))

(declare-fun m!619813 () Bool)

(assert (=> b!646881 m!619813))

(assert (=> b!646876 m!619809))

(assert (=> b!646876 m!619809))

(declare-fun m!619815 () Bool)

(assert (=> b!646876 m!619815))

(assert (=> b!646876 m!619809))

(declare-fun m!619817 () Bool)

(assert (=> b!646876 m!619817))

(assert (=> b!646876 m!619809))

(declare-fun m!619819 () Bool)

(assert (=> b!646876 m!619819))

(declare-fun m!619821 () Bool)

(assert (=> b!646895 m!619821))

(declare-fun m!619823 () Bool)

(assert (=> b!646884 m!619823))

(declare-fun m!619825 () Bool)

(assert (=> b!646886 m!619825))

(assert (=> b!646877 m!619809))

(declare-fun m!619827 () Bool)

(assert (=> b!646877 m!619827))

(declare-fun m!619829 () Bool)

(assert (=> b!646877 m!619829))

(assert (=> b!646882 m!619809))

(declare-fun m!619831 () Bool)

(assert (=> b!646888 m!619831))

(declare-fun m!619833 () Bool)

(assert (=> b!646899 m!619833))

(declare-fun m!619835 () Bool)

(assert (=> b!646885 m!619835))

(declare-fun m!619837 () Bool)

(assert (=> b!646891 m!619837))

(assert (=> b!646891 m!619809))

(assert (=> b!646891 m!619809))

(declare-fun m!619839 () Bool)

(assert (=> b!646891 m!619839))

(assert (=> b!646897 m!619827))

(declare-fun m!619841 () Bool)

(assert (=> b!646897 m!619841))

(declare-fun m!619843 () Bool)

(assert (=> b!646889 m!619843))

(assert (=> b!646879 m!619809))

(assert (=> b!646879 m!619809))

(assert (=> b!646879 m!619813))

(declare-fun m!619845 () Bool)

(assert (=> b!646887 m!619845))

(assert (=> b!646887 m!619809))

(declare-fun m!619847 () Bool)

(assert (=> b!646887 m!619847))

(assert (=> b!646887 m!619827))

(assert (=> b!646887 m!619809))

(declare-fun m!619849 () Bool)

(assert (=> b!646887 m!619849))

(declare-fun m!619851 () Bool)

(assert (=> b!646887 m!619851))

(declare-fun m!619853 () Bool)

(assert (=> b!646887 m!619853))

(declare-fun m!619855 () Bool)

(assert (=> b!646887 m!619855))

(declare-fun m!619857 () Bool)

(assert (=> b!646890 m!619857))

(declare-fun m!619859 () Bool)

(assert (=> b!646898 m!619859))

(assert (=> b!646896 m!619809))

(assert (=> b!646896 m!619809))

(assert (=> b!646896 m!619819))

(declare-fun m!619861 () Bool)

(assert (=> start!58634 m!619861))

(declare-fun m!619863 () Bool)

(assert (=> start!58634 m!619863))

(assert (=> b!646894 m!619809))

(assert (=> b!646894 m!619809))

(declare-fun m!619865 () Bool)

(assert (=> b!646894 m!619865))

(declare-fun m!619867 () Bool)

(assert (=> b!646894 m!619867))

(assert (=> b!646894 m!619809))

(declare-fun m!619869 () Bool)

(assert (=> b!646894 m!619869))

(declare-fun m!619871 () Bool)

(assert (=> b!646894 m!619871))

(assert (=> b!646894 m!619809))

(declare-fun m!619873 () Bool)

(assert (=> b!646894 m!619873))

(declare-fun m!619875 () Bool)

(assert (=> b!646894 m!619875))

(declare-fun m!619877 () Bool)

(assert (=> b!646894 m!619877))

(check-sat (not b!646899) (not b!646876) (not b!646884) (not b!646891) (not b!646894) (not b!646890) (not b!646892) (not b!646881) (not b!646886) (not b!646879) (not b!646896) (not b!646895) (not start!58634) (not b!646888) (not b!646887) (not b!646898) (not b!646885))
(check-sat)
(get-model)

(declare-fun d!91315 () Bool)

(declare-fun res!419334 () Bool)

(declare-fun e!370978 () Bool)

(assert (=> d!91315 (=> res!419334 e!370978)))

(get-info :version)

(assert (=> d!91315 (= res!419334 ((_ is Nil!12532) Nil!12532))))

(assert (=> d!91315 (= (noDuplicate!419 Nil!12532) e!370978)))

(declare-fun b!647060 () Bool)

(declare-fun e!370979 () Bool)

(assert (=> b!647060 (= e!370978 e!370979)))

(declare-fun res!419335 () Bool)

(assert (=> b!647060 (=> (not res!419335) (not e!370979))))

(assert (=> b!647060 (= res!419335 (not (contains!3136 (t!18754 Nil!12532) (h!13576 Nil!12532))))))

(declare-fun b!647061 () Bool)

(assert (=> b!647061 (= e!370979 (noDuplicate!419 (t!18754 Nil!12532)))))

(assert (= (and d!91315 (not res!419334)) b!647060))

(assert (= (and b!647060 res!419335) b!647061))

(declare-fun m!620019 () Bool)

(assert (=> b!647060 m!620019))

(declare-fun m!620021 () Bool)

(assert (=> b!647061 m!620021))

(assert (=> b!646895 d!91315))

(declare-fun d!91317 () Bool)

(declare-fun lt!300165 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!247 (List!12535) (InoxSet (_ BitVec 64)))

(assert (=> d!91317 (= lt!300165 (select (content!247 Nil!12532) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!370984 () Bool)

(assert (=> d!91317 (= lt!300165 e!370984)))

(declare-fun res!419341 () Bool)

(assert (=> d!91317 (=> (not res!419341) (not e!370984))))

(assert (=> d!91317 (= res!419341 ((_ is Cons!12531) Nil!12532))))

(assert (=> d!91317 (= (contains!3136 Nil!12532 #b1000000000000000000000000000000000000000000000000000000000000000) lt!300165)))

(declare-fun b!647066 () Bool)

(declare-fun e!370985 () Bool)

(assert (=> b!647066 (= e!370984 e!370985)))

(declare-fun res!419340 () Bool)

(assert (=> b!647066 (=> res!419340 e!370985)))

(assert (=> b!647066 (= res!419340 (= (h!13576 Nil!12532) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!647067 () Bool)

(assert (=> b!647067 (= e!370985 (contains!3136 (t!18754 Nil!12532) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!91317 res!419341) b!647066))

(assert (= (and b!647066 (not res!419340)) b!647067))

(declare-fun m!620023 () Bool)

(assert (=> d!91317 m!620023))

(declare-fun m!620025 () Bool)

(assert (=> d!91317 m!620025))

(declare-fun m!620027 () Bool)

(assert (=> b!647067 m!620027))

(assert (=> b!646884 d!91317))

(declare-fun d!91319 () Bool)

(declare-fun res!419346 () Bool)

(declare-fun e!370990 () Bool)

(assert (=> d!91319 (=> res!419346 e!370990)))

(assert (=> d!91319 (= res!419346 (= (select (arr!18455 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!91319 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!370990)))

(declare-fun b!647072 () Bool)

(declare-fun e!370991 () Bool)

(assert (=> b!647072 (= e!370990 e!370991)))

(declare-fun res!419347 () Bool)

(assert (=> b!647072 (=> (not res!419347) (not e!370991))))

(assert (=> b!647072 (= res!419347 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18820 a!2986)))))

(declare-fun b!647073 () Bool)

(assert (=> b!647073 (= e!370991 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!91319 (not res!419346)) b!647072))

(assert (= (and b!647072 res!419347) b!647073))

(declare-fun m!620029 () Bool)

(assert (=> d!91319 m!620029))

(declare-fun m!620031 () Bool)

(assert (=> b!647073 m!620031))

(assert (=> b!646885 d!91319))

(declare-fun d!91321 () Bool)

(assert (=> d!91321 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!58634 d!91321))

(declare-fun d!91323 () Bool)

(assert (=> d!91323 (= (array_inv!14338 a!2986) (bvsge (size!18820 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!58634 d!91323))

(declare-fun d!91325 () Bool)

(declare-fun res!419348 () Bool)

(declare-fun e!370992 () Bool)

(assert (=> d!91325 (=> res!419348 e!370992)))

(assert (=> d!91325 (= res!419348 (= (select (arr!18455 lt!300064) j!136) (select (arr!18455 a!2986) j!136)))))

(assert (=> d!91325 (= (arrayContainsKey!0 lt!300064 (select (arr!18455 a!2986) j!136) j!136) e!370992)))

(declare-fun b!647074 () Bool)

(declare-fun e!370993 () Bool)

(assert (=> b!647074 (= e!370992 e!370993)))

(declare-fun res!419349 () Bool)

(assert (=> b!647074 (=> (not res!419349) (not e!370993))))

(assert (=> b!647074 (= res!419349 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18820 lt!300064)))))

(declare-fun b!647075 () Bool)

(assert (=> b!647075 (= e!370993 (arrayContainsKey!0 lt!300064 (select (arr!18455 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!91325 (not res!419348)) b!647074))

(assert (= (and b!647074 res!419349) b!647075))

(declare-fun m!620033 () Bool)

(assert (=> d!91325 m!620033))

(assert (=> b!647075 m!619809))

(declare-fun m!620035 () Bool)

(assert (=> b!647075 m!620035))

(assert (=> b!646896 d!91325))

(declare-fun d!91327 () Bool)

(declare-fun res!419358 () Bool)

(declare-fun e!371005 () Bool)

(assert (=> d!91327 (=> res!419358 e!371005)))

(assert (=> d!91327 (= res!419358 (bvsge #b00000000000000000000000000000000 (size!18820 a!2986)))))

(assert (=> d!91327 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12532) e!371005)))

(declare-fun b!647086 () Bool)

(declare-fun e!371003 () Bool)

(assert (=> b!647086 (= e!371005 e!371003)))

(declare-fun res!419357 () Bool)

(assert (=> b!647086 (=> (not res!419357) (not e!371003))))

(declare-fun e!371002 () Bool)

(assert (=> b!647086 (= res!419357 (not e!371002))))

(declare-fun res!419356 () Bool)

(assert (=> b!647086 (=> (not res!419356) (not e!371002))))

(assert (=> b!647086 (= res!419356 (validKeyInArray!0 (select (arr!18455 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!647087 () Bool)

(declare-fun e!371004 () Bool)

(assert (=> b!647087 (= e!371003 e!371004)))

(declare-fun c!74232 () Bool)

(assert (=> b!647087 (= c!74232 (validKeyInArray!0 (select (arr!18455 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!647088 () Bool)

(declare-fun call!33655 () Bool)

(assert (=> b!647088 (= e!371004 call!33655)))

(declare-fun b!647089 () Bool)

(assert (=> b!647089 (= e!371002 (contains!3136 Nil!12532 (select (arr!18455 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33652 () Bool)

(assert (=> bm!33652 (= call!33655 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!74232 (Cons!12531 (select (arr!18455 a!2986) #b00000000000000000000000000000000) Nil!12532) Nil!12532)))))

(declare-fun b!647090 () Bool)

(assert (=> b!647090 (= e!371004 call!33655)))

(assert (= (and d!91327 (not res!419358)) b!647086))

(assert (= (and b!647086 res!419356) b!647089))

(assert (= (and b!647086 res!419357) b!647087))

(assert (= (and b!647087 c!74232) b!647090))

(assert (= (and b!647087 (not c!74232)) b!647088))

(assert (= (or b!647090 b!647088) bm!33652))

(assert (=> b!647086 m!620029))

(assert (=> b!647086 m!620029))

(declare-fun m!620037 () Bool)

(assert (=> b!647086 m!620037))

(assert (=> b!647087 m!620029))

(assert (=> b!647087 m!620029))

(assert (=> b!647087 m!620037))

(assert (=> b!647089 m!620029))

(assert (=> b!647089 m!620029))

(declare-fun m!620039 () Bool)

(assert (=> b!647089 m!620039))

(assert (=> bm!33652 m!620029))

(declare-fun m!620041 () Bool)

(assert (=> bm!33652 m!620041))

(assert (=> b!646886 d!91327))

(declare-fun d!91329 () Bool)

(assert (=> d!91329 (= (validKeyInArray!0 (select (arr!18455 a!2986) j!136)) (and (not (= (select (arr!18455 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18455 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!646892 d!91329))

(declare-fun d!91331 () Bool)

(assert (=> d!91331 (arrayContainsKey!0 lt!300064 (select (arr!18455 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!300168 () Unit!21980)

(declare-fun choose!114 (array!38493 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21980)

(assert (=> d!91331 (= lt!300168 (choose!114 lt!300064 (select (arr!18455 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!91331 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!91331 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!300064 (select (arr!18455 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!300168)))

(declare-fun bs!19305 () Bool)

(assert (= bs!19305 d!91331))

(assert (=> bs!19305 m!619809))

(assert (=> bs!19305 m!619873))

(assert (=> bs!19305 m!619809))

(declare-fun m!620043 () Bool)

(assert (=> bs!19305 m!620043))

(assert (=> b!646894 d!91331))

(declare-fun d!91333 () Bool)

(declare-fun res!419361 () Bool)

(declare-fun e!371009 () Bool)

(assert (=> d!91333 (=> res!419361 e!371009)))

(assert (=> d!91333 (= res!419361 (bvsge #b00000000000000000000000000000000 (size!18820 lt!300064)))))

(assert (=> d!91333 (= (arrayNoDuplicates!0 lt!300064 #b00000000000000000000000000000000 Nil!12532) e!371009)))

(declare-fun b!647091 () Bool)

(declare-fun e!371007 () Bool)

(assert (=> b!647091 (= e!371009 e!371007)))

(declare-fun res!419360 () Bool)

(assert (=> b!647091 (=> (not res!419360) (not e!371007))))

(declare-fun e!371006 () Bool)

(assert (=> b!647091 (= res!419360 (not e!371006))))

(declare-fun res!419359 () Bool)

(assert (=> b!647091 (=> (not res!419359) (not e!371006))))

(assert (=> b!647091 (= res!419359 (validKeyInArray!0 (select (arr!18455 lt!300064) #b00000000000000000000000000000000)))))

(declare-fun b!647092 () Bool)

(declare-fun e!371008 () Bool)

(assert (=> b!647092 (= e!371007 e!371008)))

(declare-fun c!74233 () Bool)

(assert (=> b!647092 (= c!74233 (validKeyInArray!0 (select (arr!18455 lt!300064) #b00000000000000000000000000000000)))))

(declare-fun b!647093 () Bool)

(declare-fun call!33656 () Bool)

(assert (=> b!647093 (= e!371008 call!33656)))

(declare-fun b!647094 () Bool)

(assert (=> b!647094 (= e!371006 (contains!3136 Nil!12532 (select (arr!18455 lt!300064) #b00000000000000000000000000000000)))))

(declare-fun bm!33653 () Bool)

(assert (=> bm!33653 (= call!33656 (arrayNoDuplicates!0 lt!300064 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!74233 (Cons!12531 (select (arr!18455 lt!300064) #b00000000000000000000000000000000) Nil!12532) Nil!12532)))))

(declare-fun b!647095 () Bool)

(assert (=> b!647095 (= e!371008 call!33656)))

(assert (= (and d!91333 (not res!419361)) b!647091))

(assert (= (and b!647091 res!419359) b!647094))

(assert (= (and b!647091 res!419360) b!647092))

(assert (= (and b!647092 c!74233) b!647095))

(assert (= (and b!647092 (not c!74233)) b!647093))

(assert (= (or b!647095 b!647093) bm!33653))

(declare-fun m!620045 () Bool)

(assert (=> b!647091 m!620045))

(assert (=> b!647091 m!620045))

(declare-fun m!620047 () Bool)

(assert (=> b!647091 m!620047))

(assert (=> b!647092 m!620045))

(assert (=> b!647092 m!620045))

(assert (=> b!647092 m!620047))

(assert (=> b!647094 m!620045))

(assert (=> b!647094 m!620045))

(declare-fun m!620049 () Bool)

(assert (=> b!647094 m!620049))

(assert (=> bm!33653 m!620045))

(declare-fun m!620051 () Bool)

(assert (=> bm!33653 m!620051))

(assert (=> b!646894 d!91333))

(declare-fun d!91337 () Bool)

(declare-fun res!419366 () Bool)

(declare-fun e!371014 () Bool)

(assert (=> d!91337 (=> res!419366 e!371014)))

(assert (=> d!91337 (= res!419366 (= (select (arr!18455 lt!300064) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18455 a!2986) j!136)))))

(assert (=> d!91337 (= (arrayContainsKey!0 lt!300064 (select (arr!18455 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!371014)))

(declare-fun b!647100 () Bool)

(declare-fun e!371015 () Bool)

(assert (=> b!647100 (= e!371014 e!371015)))

(declare-fun res!419367 () Bool)

(assert (=> b!647100 (=> (not res!419367) (not e!371015))))

(assert (=> b!647100 (= res!419367 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18820 lt!300064)))))

(declare-fun b!647101 () Bool)

(assert (=> b!647101 (= e!371015 (arrayContainsKey!0 lt!300064 (select (arr!18455 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!91337 (not res!419366)) b!647100))

(assert (= (and b!647100 res!419367) b!647101))

(declare-fun m!620053 () Bool)

(assert (=> d!91337 m!620053))

(assert (=> b!647101 m!619809))

(declare-fun m!620055 () Bool)

(assert (=> b!647101 m!620055))

(assert (=> b!646894 d!91337))

(declare-fun d!91339 () Bool)

(assert (=> d!91339 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18820 lt!300064)) (not (= (select (arr!18455 lt!300064) j!136) (select (arr!18455 a!2986) j!136))))))

(declare-fun lt!300171 () Unit!21980)

(declare-fun choose!21 (array!38493 (_ BitVec 64) (_ BitVec 32) List!12535) Unit!21980)

(assert (=> d!91339 (= lt!300171 (choose!21 lt!300064 (select (arr!18455 a!2986) j!136) j!136 Nil!12532))))

(assert (=> d!91339 (bvslt (size!18820 lt!300064) #b01111111111111111111111111111111)))

(assert (=> d!91339 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!300064 (select (arr!18455 a!2986) j!136) j!136 Nil!12532) lt!300171)))

(declare-fun bs!19306 () Bool)

(assert (= bs!19306 d!91339))

(assert (=> bs!19306 m!620033))

(assert (=> bs!19306 m!619809))

(declare-fun m!620061 () Bool)

(assert (=> bs!19306 m!620061))

(assert (=> b!646894 d!91339))

(declare-fun d!91343 () Bool)

(declare-fun res!419372 () Bool)

(declare-fun e!371021 () Bool)

(assert (=> d!91343 (=> res!419372 e!371021)))

(assert (=> d!91343 (= res!419372 (bvsge j!136 (size!18820 lt!300064)))))

(assert (=> d!91343 (= (arrayNoDuplicates!0 lt!300064 j!136 Nil!12532) e!371021)))

(declare-fun b!647104 () Bool)

(declare-fun e!371019 () Bool)

(assert (=> b!647104 (= e!371021 e!371019)))

(declare-fun res!419371 () Bool)

(assert (=> b!647104 (=> (not res!419371) (not e!371019))))

(declare-fun e!371018 () Bool)

(assert (=> b!647104 (= res!419371 (not e!371018))))

(declare-fun res!419370 () Bool)

(assert (=> b!647104 (=> (not res!419370) (not e!371018))))

(assert (=> b!647104 (= res!419370 (validKeyInArray!0 (select (arr!18455 lt!300064) j!136)))))

(declare-fun b!647105 () Bool)

(declare-fun e!371020 () Bool)

(assert (=> b!647105 (= e!371019 e!371020)))

(declare-fun c!74234 () Bool)

(assert (=> b!647105 (= c!74234 (validKeyInArray!0 (select (arr!18455 lt!300064) j!136)))))

(declare-fun b!647106 () Bool)

(declare-fun call!33657 () Bool)

(assert (=> b!647106 (= e!371020 call!33657)))

(declare-fun b!647107 () Bool)

(assert (=> b!647107 (= e!371018 (contains!3136 Nil!12532 (select (arr!18455 lt!300064) j!136)))))

(declare-fun bm!33654 () Bool)

(assert (=> bm!33654 (= call!33657 (arrayNoDuplicates!0 lt!300064 (bvadd j!136 #b00000000000000000000000000000001) (ite c!74234 (Cons!12531 (select (arr!18455 lt!300064) j!136) Nil!12532) Nil!12532)))))

(declare-fun b!647108 () Bool)

(assert (=> b!647108 (= e!371020 call!33657)))

(assert (= (and d!91343 (not res!419372)) b!647104))

(assert (= (and b!647104 res!419370) b!647107))

(assert (= (and b!647104 res!419371) b!647105))

(assert (= (and b!647105 c!74234) b!647108))

(assert (= (and b!647105 (not c!74234)) b!647106))

(assert (= (or b!647108 b!647106) bm!33654))

(assert (=> b!647104 m!620033))

(assert (=> b!647104 m!620033))

(declare-fun m!620063 () Bool)

(assert (=> b!647104 m!620063))

(assert (=> b!647105 m!620033))

(assert (=> b!647105 m!620033))

(assert (=> b!647105 m!620063))

(assert (=> b!647107 m!620033))

(assert (=> b!647107 m!620033))

(declare-fun m!620065 () Bool)

(assert (=> b!647107 m!620065))

(assert (=> bm!33654 m!620033))

(declare-fun m!620067 () Bool)

(assert (=> bm!33654 m!620067))

(assert (=> b!646894 d!91343))

(declare-fun d!91345 () Bool)

(assert (=> d!91345 (arrayNoDuplicates!0 lt!300064 j!136 Nil!12532)))

(declare-fun lt!300174 () Unit!21980)

(declare-fun choose!39 (array!38493 (_ BitVec 32) (_ BitVec 32)) Unit!21980)

(assert (=> d!91345 (= lt!300174 (choose!39 lt!300064 #b00000000000000000000000000000000 j!136))))

(assert (=> d!91345 (bvslt (size!18820 lt!300064) #b01111111111111111111111111111111)))

(assert (=> d!91345 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!300064 #b00000000000000000000000000000000 j!136) lt!300174)))

(declare-fun bs!19307 () Bool)

(assert (= bs!19307 d!91345))

(assert (=> bs!19307 m!619875))

(declare-fun m!620069 () Bool)

(assert (=> bs!19307 m!620069))

(assert (=> b!646894 d!91345))

(declare-fun d!91347 () Bool)

(declare-fun e!371030 () Bool)

(assert (=> d!91347 e!371030))

(declare-fun res!419375 () Bool)

(assert (=> d!91347 (=> (not res!419375) (not e!371030))))

(assert (=> d!91347 (= res!419375 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18820 a!2986))))))

(declare-fun lt!300183 () Unit!21980)

(declare-fun choose!41 (array!38493 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12535) Unit!21980)

(assert (=> d!91347 (= lt!300183 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12532))))

(assert (=> d!91347 (bvslt (size!18820 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!91347 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12532) lt!300183)))

(declare-fun b!647123 () Bool)

(assert (=> b!647123 (= e!371030 (arrayNoDuplicates!0 (array!38494 (store (arr!18455 a!2986) i!1108 k0!1786) (size!18820 a!2986)) #b00000000000000000000000000000000 Nil!12532))))

(assert (= (and d!91347 res!419375) b!647123))

(declare-fun m!620071 () Bool)

(assert (=> d!91347 m!620071))

(assert (=> b!647123 m!619827))

(declare-fun m!620073 () Bool)

(assert (=> b!647123 m!620073))

(assert (=> b!646894 d!91347))

(declare-fun d!91349 () Bool)

(declare-fun res!419376 () Bool)

(declare-fun e!371031 () Bool)

(assert (=> d!91349 (=> res!419376 e!371031)))

(assert (=> d!91349 (= res!419376 (= (select (arr!18455 lt!300064) index!984) (select (arr!18455 a!2986) j!136)))))

(assert (=> d!91349 (= (arrayContainsKey!0 lt!300064 (select (arr!18455 a!2986) j!136) index!984) e!371031)))

(declare-fun b!647124 () Bool)

(declare-fun e!371032 () Bool)

(assert (=> b!647124 (= e!371031 e!371032)))

(declare-fun res!419377 () Bool)

(assert (=> b!647124 (=> (not res!419377) (not e!371032))))

(assert (=> b!647124 (= res!419377 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18820 lt!300064)))))

(declare-fun b!647125 () Bool)

(assert (=> b!647125 (= e!371032 (arrayContainsKey!0 lt!300064 (select (arr!18455 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!91349 (not res!419376)) b!647124))

(assert (= (and b!647124 res!419377) b!647125))

(declare-fun m!620075 () Bool)

(assert (=> d!91349 m!620075))

(assert (=> b!647125 m!619809))

(declare-fun m!620077 () Bool)

(assert (=> b!647125 m!620077))

(assert (=> b!646879 d!91349))

(declare-fun d!91351 () Bool)

(assert (=> d!91351 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!646890 d!91351))

(declare-fun b!647169 () Bool)

(declare-fun e!371065 () SeekEntryResult!6892)

(assert (=> b!647169 (= e!371065 (MissingVacant!6892 vacantSpotIndex!68))))

(declare-fun b!647170 () Bool)

(declare-fun c!74254 () Bool)

(declare-fun lt!300203 () (_ BitVec 64))

(assert (=> b!647170 (= c!74254 (= lt!300203 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!371064 () SeekEntryResult!6892)

(assert (=> b!647170 (= e!371064 e!371065)))

(declare-fun b!647171 () Bool)

(declare-fun e!371063 () SeekEntryResult!6892)

(assert (=> b!647171 (= e!371063 Undefined!6892)))

(declare-fun b!647172 () Bool)

(assert (=> b!647172 (= e!371063 e!371064)))

(declare-fun c!74255 () Bool)

(assert (=> b!647172 (= c!74255 (= lt!300203 (select (arr!18455 a!2986) j!136)))))

(declare-fun lt!300204 () SeekEntryResult!6892)

(declare-fun d!91353 () Bool)

(assert (=> d!91353 (and (or ((_ is Undefined!6892) lt!300204) (not ((_ is Found!6892) lt!300204)) (and (bvsge (index!29910 lt!300204) #b00000000000000000000000000000000) (bvslt (index!29910 lt!300204) (size!18820 a!2986)))) (or ((_ is Undefined!6892) lt!300204) ((_ is Found!6892) lt!300204) (not ((_ is MissingVacant!6892) lt!300204)) (not (= (index!29912 lt!300204) vacantSpotIndex!68)) (and (bvsge (index!29912 lt!300204) #b00000000000000000000000000000000) (bvslt (index!29912 lt!300204) (size!18820 a!2986)))) (or ((_ is Undefined!6892) lt!300204) (ite ((_ is Found!6892) lt!300204) (= (select (arr!18455 a!2986) (index!29910 lt!300204)) (select (arr!18455 a!2986) j!136)) (and ((_ is MissingVacant!6892) lt!300204) (= (index!29912 lt!300204) vacantSpotIndex!68) (= (select (arr!18455 a!2986) (index!29912 lt!300204)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!91353 (= lt!300204 e!371063)))

(declare-fun c!74256 () Bool)

(assert (=> d!91353 (= c!74256 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!91353 (= lt!300203 (select (arr!18455 a!2986) index!984))))

(assert (=> d!91353 (validMask!0 mask!3053)))

(assert (=> d!91353 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18455 a!2986) j!136) a!2986 mask!3053) lt!300204)))

(declare-fun b!647173 () Bool)

(assert (=> b!647173 (= e!371064 (Found!6892 index!984))))

(declare-fun b!647174 () Bool)

(assert (=> b!647174 (= e!371065 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18455 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and d!91353 c!74256) b!647171))

(assert (= (and d!91353 (not c!74256)) b!647172))

(assert (= (and b!647172 c!74255) b!647173))

(assert (= (and b!647172 (not c!74255)) b!647170))

(assert (= (and b!647170 c!74254) b!647169))

(assert (= (and b!647170 (not c!74254)) b!647174))

(declare-fun m!620123 () Bool)

(assert (=> d!91353 m!620123))

(declare-fun m!620125 () Bool)

(assert (=> d!91353 m!620125))

(assert (=> d!91353 m!619837))

(assert (=> d!91353 m!619861))

(assert (=> b!647174 m!619855))

(assert (=> b!647174 m!619855))

(assert (=> b!647174 m!619809))

(declare-fun m!620127 () Bool)

(assert (=> b!647174 m!620127))

(assert (=> b!646891 d!91353))

(assert (=> b!646881 d!91349))

(declare-fun b!647175 () Bool)

(declare-fun e!371068 () SeekEntryResult!6892)

(assert (=> b!647175 (= e!371068 (MissingVacant!6892 vacantSpotIndex!68))))

(declare-fun b!647176 () Bool)

(declare-fun c!74257 () Bool)

(declare-fun lt!300205 () (_ BitVec 64))

(assert (=> b!647176 (= c!74257 (= lt!300205 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!371067 () SeekEntryResult!6892)

(assert (=> b!647176 (= e!371067 e!371068)))

(declare-fun b!647177 () Bool)

(declare-fun e!371066 () SeekEntryResult!6892)

(assert (=> b!647177 (= e!371066 Undefined!6892)))

(declare-fun b!647178 () Bool)

(assert (=> b!647178 (= e!371066 e!371067)))

(declare-fun c!74258 () Bool)

(assert (=> b!647178 (= c!74258 (= lt!300205 lt!300052))))

(declare-fun lt!300206 () SeekEntryResult!6892)

(declare-fun d!91373 () Bool)

(assert (=> d!91373 (and (or ((_ is Undefined!6892) lt!300206) (not ((_ is Found!6892) lt!300206)) (and (bvsge (index!29910 lt!300206) #b00000000000000000000000000000000) (bvslt (index!29910 lt!300206) (size!18820 lt!300064)))) (or ((_ is Undefined!6892) lt!300206) ((_ is Found!6892) lt!300206) (not ((_ is MissingVacant!6892) lt!300206)) (not (= (index!29912 lt!300206) vacantSpotIndex!68)) (and (bvsge (index!29912 lt!300206) #b00000000000000000000000000000000) (bvslt (index!29912 lt!300206) (size!18820 lt!300064)))) (or ((_ is Undefined!6892) lt!300206) (ite ((_ is Found!6892) lt!300206) (= (select (arr!18455 lt!300064) (index!29910 lt!300206)) lt!300052) (and ((_ is MissingVacant!6892) lt!300206) (= (index!29912 lt!300206) vacantSpotIndex!68) (= (select (arr!18455 lt!300064) (index!29912 lt!300206)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!91373 (= lt!300206 e!371066)))

(declare-fun c!74259 () Bool)

(assert (=> d!91373 (= c!74259 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!91373 (= lt!300205 (select (arr!18455 lt!300064) lt!300056))))

(assert (=> d!91373 (validMask!0 mask!3053)))

(assert (=> d!91373 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300056 vacantSpotIndex!68 lt!300052 lt!300064 mask!3053) lt!300206)))

(declare-fun b!647179 () Bool)

(assert (=> b!647179 (= e!371067 (Found!6892 lt!300056))))

(declare-fun b!647180 () Bool)

(assert (=> b!647180 (= e!371068 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!300056 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!300052 lt!300064 mask!3053))))

(assert (= (and d!91373 c!74259) b!647177))

(assert (= (and d!91373 (not c!74259)) b!647178))

(assert (= (and b!647178 c!74258) b!647179))

(assert (= (and b!647178 (not c!74258)) b!647176))

(assert (= (and b!647176 c!74257) b!647175))

(assert (= (and b!647176 (not c!74257)) b!647180))

(declare-fun m!620129 () Bool)

(assert (=> d!91373 m!620129))

(declare-fun m!620131 () Bool)

(assert (=> d!91373 m!620131))

(declare-fun m!620133 () Bool)

(assert (=> d!91373 m!620133))

(assert (=> d!91373 m!619861))

(declare-fun m!620135 () Bool)

(assert (=> b!647180 m!620135))

(assert (=> b!647180 m!620135))

(declare-fun m!620137 () Bool)

(assert (=> b!647180 m!620137))

(assert (=> b!646887 d!91373))

(declare-fun d!91375 () Bool)

(declare-fun lt!300209 () (_ BitVec 32))

(assert (=> d!91375 (and (bvsge lt!300209 #b00000000000000000000000000000000) (bvslt lt!300209 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!91375 (= lt!300209 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!91375 (validMask!0 mask!3053)))

(assert (=> d!91375 (= (nextIndex!0 index!984 x!910 mask!3053) lt!300209)))

(declare-fun bs!19311 () Bool)

(assert (= bs!19311 d!91375))

(declare-fun m!620147 () Bool)

(assert (=> bs!19311 m!620147))

(assert (=> bs!19311 m!619861))

(assert (=> b!646887 d!91375))

(declare-fun d!91381 () Bool)

(declare-fun e!371102 () Bool)

(assert (=> d!91381 e!371102))

(declare-fun res!419413 () Bool)

(assert (=> d!91381 (=> (not res!419413) (not e!371102))))

(assert (=> d!91381 (= res!419413 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18820 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18820 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18820 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18820 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18820 a!2986))))))

(declare-fun lt!300225 () Unit!21980)

(declare-fun choose!9 (array!38493 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21980)

(assert (=> d!91381 (= lt!300225 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!300056 vacantSpotIndex!68 mask!3053))))

(assert (=> d!91381 (validMask!0 mask!3053)))

(assert (=> d!91381 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!300056 vacantSpotIndex!68 mask!3053) lt!300225)))

(declare-fun b!647229 () Bool)

(assert (=> b!647229 (= e!371102 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300056 vacantSpotIndex!68 (select (arr!18455 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300056 vacantSpotIndex!68 (select (store (arr!18455 a!2986) i!1108 k0!1786) j!136) (array!38494 (store (arr!18455 a!2986) i!1108 k0!1786) (size!18820 a!2986)) mask!3053)))))

(assert (= (and d!91381 res!419413) b!647229))

(declare-fun m!620165 () Bool)

(assert (=> d!91381 m!620165))

(assert (=> d!91381 m!619861))

(assert (=> b!647229 m!619809))

(assert (=> b!647229 m!619827))

(assert (=> b!647229 m!619845))

(assert (=> b!647229 m!619809))

(assert (=> b!647229 m!619849))

(assert (=> b!647229 m!619845))

(declare-fun m!620171 () Bool)

(assert (=> b!647229 m!620171))

(assert (=> b!646887 d!91381))

(declare-fun b!647232 () Bool)

(declare-fun e!371107 () SeekEntryResult!6892)

(assert (=> b!647232 (= e!371107 (MissingVacant!6892 vacantSpotIndex!68))))

(declare-fun b!647233 () Bool)

(declare-fun c!74275 () Bool)

(declare-fun lt!300227 () (_ BitVec 64))

(assert (=> b!647233 (= c!74275 (= lt!300227 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!371106 () SeekEntryResult!6892)

(assert (=> b!647233 (= e!371106 e!371107)))

(declare-fun b!647234 () Bool)

(declare-fun e!371105 () SeekEntryResult!6892)

(assert (=> b!647234 (= e!371105 Undefined!6892)))

(declare-fun b!647235 () Bool)

(assert (=> b!647235 (= e!371105 e!371106)))

(declare-fun c!74276 () Bool)

(assert (=> b!647235 (= c!74276 (= lt!300227 (select (arr!18455 a!2986) j!136)))))

(declare-fun lt!300228 () SeekEntryResult!6892)

(declare-fun d!91393 () Bool)

(assert (=> d!91393 (and (or ((_ is Undefined!6892) lt!300228) (not ((_ is Found!6892) lt!300228)) (and (bvsge (index!29910 lt!300228) #b00000000000000000000000000000000) (bvslt (index!29910 lt!300228) (size!18820 a!2986)))) (or ((_ is Undefined!6892) lt!300228) ((_ is Found!6892) lt!300228) (not ((_ is MissingVacant!6892) lt!300228)) (not (= (index!29912 lt!300228) vacantSpotIndex!68)) (and (bvsge (index!29912 lt!300228) #b00000000000000000000000000000000) (bvslt (index!29912 lt!300228) (size!18820 a!2986)))) (or ((_ is Undefined!6892) lt!300228) (ite ((_ is Found!6892) lt!300228) (= (select (arr!18455 a!2986) (index!29910 lt!300228)) (select (arr!18455 a!2986) j!136)) (and ((_ is MissingVacant!6892) lt!300228) (= (index!29912 lt!300228) vacantSpotIndex!68) (= (select (arr!18455 a!2986) (index!29912 lt!300228)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!91393 (= lt!300228 e!371105)))

(declare-fun c!74277 () Bool)

(assert (=> d!91393 (= c!74277 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!91393 (= lt!300227 (select (arr!18455 a!2986) lt!300056))))

(assert (=> d!91393 (validMask!0 mask!3053)))

(assert (=> d!91393 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300056 vacantSpotIndex!68 (select (arr!18455 a!2986) j!136) a!2986 mask!3053) lt!300228)))

(declare-fun b!647236 () Bool)

(assert (=> b!647236 (= e!371106 (Found!6892 lt!300056))))

(declare-fun b!647237 () Bool)

(assert (=> b!647237 (= e!371107 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!300056 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18455 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and d!91393 c!74277) b!647234))

(assert (= (and d!91393 (not c!74277)) b!647235))

(assert (= (and b!647235 c!74276) b!647236))

(assert (= (and b!647235 (not c!74276)) b!647233))

(assert (= (and b!647233 c!74275) b!647232))

(assert (= (and b!647233 (not c!74275)) b!647237))

(declare-fun m!620177 () Bool)

(assert (=> d!91393 m!620177))

(declare-fun m!620179 () Bool)

(assert (=> d!91393 m!620179))

(declare-fun m!620181 () Bool)

(assert (=> d!91393 m!620181))

(assert (=> d!91393 m!619861))

(assert (=> b!647237 m!620135))

(assert (=> b!647237 m!620135))

(assert (=> b!647237 m!619809))

(declare-fun m!620183 () Bool)

(assert (=> b!647237 m!620183))

(assert (=> b!646887 d!91393))

(declare-fun b!647240 () Bool)

(declare-fun e!371112 () SeekEntryResult!6892)

(assert (=> b!647240 (= e!371112 (MissingVacant!6892 vacantSpotIndex!68))))

(declare-fun b!647241 () Bool)

(declare-fun c!74278 () Bool)

(declare-fun lt!300229 () (_ BitVec 64))

(assert (=> b!647241 (= c!74278 (= lt!300229 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!371111 () SeekEntryResult!6892)

(assert (=> b!647241 (= e!371111 e!371112)))

(declare-fun b!647242 () Bool)

(declare-fun e!371110 () SeekEntryResult!6892)

(assert (=> b!647242 (= e!371110 Undefined!6892)))

(declare-fun b!647243 () Bool)

(assert (=> b!647243 (= e!371110 e!371111)))

(declare-fun c!74279 () Bool)

(assert (=> b!647243 (= c!74279 (= lt!300229 lt!300052))))

(declare-fun lt!300230 () SeekEntryResult!6892)

(declare-fun d!91399 () Bool)

(assert (=> d!91399 (and (or ((_ is Undefined!6892) lt!300230) (not ((_ is Found!6892) lt!300230)) (and (bvsge (index!29910 lt!300230) #b00000000000000000000000000000000) (bvslt (index!29910 lt!300230) (size!18820 lt!300064)))) (or ((_ is Undefined!6892) lt!300230) ((_ is Found!6892) lt!300230) (not ((_ is MissingVacant!6892) lt!300230)) (not (= (index!29912 lt!300230) vacantSpotIndex!68)) (and (bvsge (index!29912 lt!300230) #b00000000000000000000000000000000) (bvslt (index!29912 lt!300230) (size!18820 lt!300064)))) (or ((_ is Undefined!6892) lt!300230) (ite ((_ is Found!6892) lt!300230) (= (select (arr!18455 lt!300064) (index!29910 lt!300230)) lt!300052) (and ((_ is MissingVacant!6892) lt!300230) (= (index!29912 lt!300230) vacantSpotIndex!68) (= (select (arr!18455 lt!300064) (index!29912 lt!300230)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!91399 (= lt!300230 e!371110)))

(declare-fun c!74280 () Bool)

(assert (=> d!91399 (= c!74280 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!91399 (= lt!300229 (select (arr!18455 lt!300064) index!984))))

(assert (=> d!91399 (validMask!0 mask!3053)))

(assert (=> d!91399 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!300052 lt!300064 mask!3053) lt!300230)))

(declare-fun b!647244 () Bool)

(assert (=> b!647244 (= e!371111 (Found!6892 index!984))))

(declare-fun b!647245 () Bool)

(assert (=> b!647245 (= e!371112 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!300052 lt!300064 mask!3053))))

(assert (= (and d!91399 c!74280) b!647242))

(assert (= (and d!91399 (not c!74280)) b!647243))

(assert (= (and b!647243 c!74279) b!647244))

(assert (= (and b!647243 (not c!74279)) b!647241))

(assert (= (and b!647241 c!74278) b!647240))

(assert (= (and b!647241 (not c!74278)) b!647245))

(declare-fun m!620185 () Bool)

(assert (=> d!91399 m!620185))

(declare-fun m!620187 () Bool)

(assert (=> d!91399 m!620187))

(assert (=> d!91399 m!620075))

(assert (=> d!91399 m!619861))

(assert (=> b!647245 m!619855))

(assert (=> b!647245 m!619855))

(declare-fun m!620189 () Bool)

(assert (=> b!647245 m!620189))

(assert (=> b!646887 d!91399))

(declare-fun d!91403 () Bool)

(declare-fun res!419420 () Bool)

(declare-fun e!371115 () Bool)

(assert (=> d!91403 (=> res!419420 e!371115)))

(assert (=> d!91403 (= res!419420 (= (select (arr!18455 lt!300064) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!18455 a!2986) j!136)))))

(assert (=> d!91403 (= (arrayContainsKey!0 lt!300064 (select (arr!18455 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!371115)))

(declare-fun b!647248 () Bool)

(declare-fun e!371116 () Bool)

(assert (=> b!647248 (= e!371115 e!371116)))

(declare-fun res!419421 () Bool)

(assert (=> b!647248 (=> (not res!419421) (not e!371116))))

(assert (=> b!647248 (= res!419421 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18820 lt!300064)))))

(declare-fun b!647249 () Bool)

(assert (=> b!647249 (= e!371116 (arrayContainsKey!0 lt!300064 (select (arr!18455 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!91403 (not res!419420)) b!647248))

(assert (= (and b!647248 res!419421) b!647249))

(declare-fun m!620195 () Bool)

(assert (=> d!91403 m!620195))

(assert (=> b!647249 m!619809))

(declare-fun m!620197 () Bool)

(assert (=> b!647249 m!620197))

(assert (=> b!646876 d!91403))

(declare-fun d!91407 () Bool)

(assert (=> d!91407 (arrayContainsKey!0 lt!300064 (select (arr!18455 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!300231 () Unit!21980)

(assert (=> d!91407 (= lt!300231 (choose!114 lt!300064 (select (arr!18455 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!91407 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!91407 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!300064 (select (arr!18455 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!300231)))

(declare-fun bs!19314 () Bool)

(assert (= bs!19314 d!91407))

(assert (=> bs!19314 m!619809))

(assert (=> bs!19314 m!619815))

(assert (=> bs!19314 m!619809))

(declare-fun m!620199 () Bool)

(assert (=> bs!19314 m!620199))

(assert (=> b!646876 d!91407))

(assert (=> b!646876 d!91325))

(declare-fun b!647296 () Bool)

(declare-fun e!371149 () SeekEntryResult!6892)

(declare-fun lt!300253 () SeekEntryResult!6892)

(assert (=> b!647296 (= e!371149 (MissingZero!6892 (index!29911 lt!300253)))))

(declare-fun b!647297 () Bool)

(declare-fun e!371151 () SeekEntryResult!6892)

(assert (=> b!647297 (= e!371151 Undefined!6892)))

(declare-fun b!647298 () Bool)

(declare-fun e!371150 () SeekEntryResult!6892)

(assert (=> b!647298 (= e!371151 e!371150)))

(declare-fun lt!300254 () (_ BitVec 64))

(assert (=> b!647298 (= lt!300254 (select (arr!18455 a!2986) (index!29911 lt!300253)))))

(declare-fun c!74296 () Bool)

(assert (=> b!647298 (= c!74296 (= lt!300254 k0!1786))))

(declare-fun d!91409 () Bool)

(declare-fun lt!300252 () SeekEntryResult!6892)

(assert (=> d!91409 (and (or ((_ is Undefined!6892) lt!300252) (not ((_ is Found!6892) lt!300252)) (and (bvsge (index!29910 lt!300252) #b00000000000000000000000000000000) (bvslt (index!29910 lt!300252) (size!18820 a!2986)))) (or ((_ is Undefined!6892) lt!300252) ((_ is Found!6892) lt!300252) (not ((_ is MissingZero!6892) lt!300252)) (and (bvsge (index!29909 lt!300252) #b00000000000000000000000000000000) (bvslt (index!29909 lt!300252) (size!18820 a!2986)))) (or ((_ is Undefined!6892) lt!300252) ((_ is Found!6892) lt!300252) ((_ is MissingZero!6892) lt!300252) (not ((_ is MissingVacant!6892) lt!300252)) (and (bvsge (index!29912 lt!300252) #b00000000000000000000000000000000) (bvslt (index!29912 lt!300252) (size!18820 a!2986)))) (or ((_ is Undefined!6892) lt!300252) (ite ((_ is Found!6892) lt!300252) (= (select (arr!18455 a!2986) (index!29910 lt!300252)) k0!1786) (ite ((_ is MissingZero!6892) lt!300252) (= (select (arr!18455 a!2986) (index!29909 lt!300252)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6892) lt!300252) (= (select (arr!18455 a!2986) (index!29912 lt!300252)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!91409 (= lt!300252 e!371151)))

(declare-fun c!74295 () Bool)

(assert (=> d!91409 (= c!74295 (and ((_ is Intermediate!6892) lt!300253) (undefined!7704 lt!300253)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38493 (_ BitVec 32)) SeekEntryResult!6892)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!91409 (= lt!300253 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!91409 (validMask!0 mask!3053)))

(assert (=> d!91409 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!300252)))

(declare-fun b!647299 () Bool)

(assert (=> b!647299 (= e!371149 (seekKeyOrZeroReturnVacant!0 (x!58698 lt!300253) (index!29911 lt!300253) (index!29911 lt!300253) k0!1786 a!2986 mask!3053))))

(declare-fun b!647300 () Bool)

(assert (=> b!647300 (= e!371150 (Found!6892 (index!29911 lt!300253)))))

(declare-fun b!647301 () Bool)

(declare-fun c!74297 () Bool)

(assert (=> b!647301 (= c!74297 (= lt!300254 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!647301 (= e!371150 e!371149)))

(assert (= (and d!91409 c!74295) b!647297))

(assert (= (and d!91409 (not c!74295)) b!647298))

(assert (= (and b!647298 c!74296) b!647300))

(assert (= (and b!647298 (not c!74296)) b!647301))

(assert (= (and b!647301 c!74297) b!647296))

(assert (= (and b!647301 (not c!74297)) b!647299))

(declare-fun m!620223 () Bool)

(assert (=> b!647298 m!620223))

(assert (=> d!91409 m!619861))

(declare-fun m!620225 () Bool)

(assert (=> d!91409 m!620225))

(declare-fun m!620227 () Bool)

(assert (=> d!91409 m!620227))

(declare-fun m!620229 () Bool)

(assert (=> d!91409 m!620229))

(declare-fun m!620231 () Bool)

(assert (=> d!91409 m!620231))

(assert (=> d!91409 m!620227))

(declare-fun m!620233 () Bool)

(assert (=> d!91409 m!620233))

(declare-fun m!620235 () Bool)

(assert (=> b!647299 m!620235))

(assert (=> b!646898 d!91409))

(declare-fun bm!33668 () Bool)

(declare-fun call!33671 () Bool)

(assert (=> bm!33668 (= call!33671 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!647358 () Bool)

(declare-fun e!371190 () Bool)

(declare-fun e!371189 () Bool)

(assert (=> b!647358 (= e!371190 e!371189)))

(declare-fun lt!300281 () (_ BitVec 64))

(assert (=> b!647358 (= lt!300281 (select (arr!18455 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!300283 () Unit!21980)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38493 (_ BitVec 64) (_ BitVec 32)) Unit!21980)

(assert (=> b!647358 (= lt!300283 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!300281 #b00000000000000000000000000000000))))

(assert (=> b!647358 (arrayContainsKey!0 a!2986 lt!300281 #b00000000000000000000000000000000)))

(declare-fun lt!300282 () Unit!21980)

(assert (=> b!647358 (= lt!300282 lt!300283)))

(declare-fun res!419459 () Bool)

(assert (=> b!647358 (= res!419459 (= (seekEntryOrOpen!0 (select (arr!18455 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6892 #b00000000000000000000000000000000)))))

(assert (=> b!647358 (=> (not res!419459) (not e!371189))))

(declare-fun b!647359 () Bool)

(assert (=> b!647359 (= e!371190 call!33671)))

(declare-fun b!647360 () Bool)

(declare-fun e!371191 () Bool)

(assert (=> b!647360 (= e!371191 e!371190)))

(declare-fun c!74317 () Bool)

(assert (=> b!647360 (= c!74317 (validKeyInArray!0 (select (arr!18455 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!647361 () Bool)

(assert (=> b!647361 (= e!371189 call!33671)))

(declare-fun d!91427 () Bool)

(declare-fun res!419458 () Bool)

(assert (=> d!91427 (=> res!419458 e!371191)))

(assert (=> d!91427 (= res!419458 (bvsge #b00000000000000000000000000000000 (size!18820 a!2986)))))

(assert (=> d!91427 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!371191)))

(assert (= (and d!91427 (not res!419458)) b!647360))

(assert (= (and b!647360 c!74317) b!647358))

(assert (= (and b!647360 (not c!74317)) b!647359))

(assert (= (and b!647358 res!419459) b!647361))

(assert (= (or b!647361 b!647359) bm!33668))

(declare-fun m!620305 () Bool)

(assert (=> bm!33668 m!620305))

(assert (=> b!647358 m!620029))

(declare-fun m!620307 () Bool)

(assert (=> b!647358 m!620307))

(declare-fun m!620309 () Bool)

(assert (=> b!647358 m!620309))

(assert (=> b!647358 m!620029))

(declare-fun m!620311 () Bool)

(assert (=> b!647358 m!620311))

(assert (=> b!647360 m!620029))

(assert (=> b!647360 m!620029))

(assert (=> b!647360 m!620037))

(assert (=> b!646899 d!91427))

(declare-fun d!91453 () Bool)

(declare-fun lt!300284 () Bool)

(assert (=> d!91453 (= lt!300284 (select (content!247 Nil!12532) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!371192 () Bool)

(assert (=> d!91453 (= lt!300284 e!371192)))

(declare-fun res!419461 () Bool)

(assert (=> d!91453 (=> (not res!419461) (not e!371192))))

(assert (=> d!91453 (= res!419461 ((_ is Cons!12531) Nil!12532))))

(assert (=> d!91453 (= (contains!3136 Nil!12532 #b0000000000000000000000000000000000000000000000000000000000000000) lt!300284)))

(declare-fun b!647362 () Bool)

(declare-fun e!371193 () Bool)

(assert (=> b!647362 (= e!371192 e!371193)))

(declare-fun res!419460 () Bool)

(assert (=> b!647362 (=> res!419460 e!371193)))

(assert (=> b!647362 (= res!419460 (= (h!13576 Nil!12532) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!647363 () Bool)

(assert (=> b!647363 (= e!371193 (contains!3136 (t!18754 Nil!12532) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!91453 res!419461) b!647362))

(assert (= (and b!647362 (not res!419460)) b!647363))

(assert (=> d!91453 m!620023))

(declare-fun m!620313 () Bool)

(assert (=> d!91453 m!620313))

(declare-fun m!620315 () Bool)

(assert (=> b!647363 m!620315))

(assert (=> b!646888 d!91453))

(check-sat (not b!647299) (not b!647358) (not d!91393) (not b!647363) (not d!91345) (not bm!33654) (not b!647067) (not b!647107) (not d!91331) (not b!647087) (not d!91381) (not d!91453) (not b!647091) (not d!91407) (not d!91375) (not b!647061) (not d!91409) (not b!647104) (not bm!33668) (not b!647089) (not b!647249) (not d!91347) (not b!647174) (not b!647237) (not b!647123) (not b!647094) (not b!647092) (not b!647075) (not b!647073) (not b!647105) (not d!91317) (not bm!33653) (not d!91373) (not b!647060) (not d!91339) (not b!647086) (not b!647245) (not b!647101) (not b!647180) (not d!91353) (not b!647360) (not b!647125) (not d!91399) (not bm!33652) (not b!647229))
(check-sat)
