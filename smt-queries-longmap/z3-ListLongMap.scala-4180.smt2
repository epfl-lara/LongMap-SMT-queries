; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56998 () Bool)

(assert start!56998)

(declare-fun res!407879 () Bool)

(declare-fun e!360745 () Bool)

(assert (=> start!56998 (=> (not res!407879) (not e!360745))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56998 (= res!407879 (validMask!0 mask!3053))))

(assert (=> start!56998 e!360745))

(assert (=> start!56998 true))

(declare-datatypes ((array!38074 0))(
  ( (array!38075 (arr!18271 (Array (_ BitVec 32) (_ BitVec 64))) (size!18635 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38074)

(declare-fun array_inv!14067 (array!38074) Bool)

(assert (=> start!56998 (array_inv!14067 a!2986)))

(declare-fun b!630907 () Bool)

(declare-fun res!407880 () Bool)

(assert (=> b!630907 (=> (not res!407880) (not e!360745))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!630907 (= res!407880 (and (= (size!18635 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18635 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18635 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!630908 () Bool)

(declare-fun res!407885 () Bool)

(assert (=> b!630908 (=> (not res!407885) (not e!360745))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38074 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!630908 (= res!407885 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!630909 () Bool)

(declare-fun e!360747 () Bool)

(declare-datatypes ((SeekEntryResult!6711 0))(
  ( (MissingZero!6711 (index!29134 (_ BitVec 32))) (Found!6711 (index!29135 (_ BitVec 32))) (Intermediate!6711 (undefined!7523 Bool) (index!29136 (_ BitVec 32)) (x!57873 (_ BitVec 32))) (Undefined!6711) (MissingVacant!6711 (index!29137 (_ BitVec 32))) )
))
(declare-fun lt!291428 () SeekEntryResult!6711)

(declare-fun lt!291430 () SeekEntryResult!6711)

(assert (=> b!630909 (= e!360747 (= lt!291428 lt!291430))))

(declare-fun b!630910 () Bool)

(declare-fun e!360748 () Bool)

(declare-fun e!360744 () Bool)

(assert (=> b!630910 (= e!360748 e!360744)))

(declare-fun res!407881 () Bool)

(assert (=> b!630910 (=> (not res!407881) (not e!360744))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!630910 (= res!407881 (and (= lt!291428 (Found!6711 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18271 a!2986) index!984) (select (arr!18271 a!2986) j!136))) (not (= (select (arr!18271 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38074 (_ BitVec 32)) SeekEntryResult!6711)

(assert (=> b!630910 (= lt!291428 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18271 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!630911 () Bool)

(declare-fun res!407882 () Bool)

(assert (=> b!630911 (=> (not res!407882) (not e!360745))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!630911 (= res!407882 (validKeyInArray!0 k0!1786))))

(declare-fun b!630912 () Bool)

(declare-fun res!407877 () Bool)

(assert (=> b!630912 (=> (not res!407877) (not e!360745))))

(assert (=> b!630912 (= res!407877 (validKeyInArray!0 (select (arr!18271 a!2986) j!136)))))

(declare-fun b!630913 () Bool)

(declare-fun e!360749 () Bool)

(assert (=> b!630913 (= e!360749 e!360748)))

(declare-fun res!407878 () Bool)

(assert (=> b!630913 (=> (not res!407878) (not e!360748))))

(assert (=> b!630913 (= res!407878 (= (select (store (arr!18271 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!291425 () array!38074)

(assert (=> b!630913 (= lt!291425 (array!38075 (store (arr!18271 a!2986) i!1108 k0!1786) (size!18635 a!2986)))))

(declare-fun b!630914 () Bool)

(declare-fun res!407888 () Bool)

(assert (=> b!630914 (=> (not res!407888) (not e!360749))))

(assert (=> b!630914 (= res!407888 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18271 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!630915 () Bool)

(declare-datatypes ((Unit!21178 0))(
  ( (Unit!21179) )
))
(declare-fun e!360750 () Unit!21178)

(declare-fun Unit!21180 () Unit!21178)

(assert (=> b!630915 (= e!360750 Unit!21180)))

(declare-fun b!630916 () Bool)

(declare-fun Unit!21181 () Unit!21178)

(assert (=> b!630916 (= e!360750 Unit!21181)))

(assert (=> b!630916 false))

(declare-fun b!630917 () Bool)

(assert (=> b!630917 (= e!360744 (not true))))

(declare-fun lt!291427 () Unit!21178)

(assert (=> b!630917 (= lt!291427 e!360750)))

(declare-fun lt!291429 () (_ BitVec 64))

(declare-fun c!71882 () Bool)

(assert (=> b!630917 (= c!71882 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!291429 lt!291425 mask!3053) Undefined!6711))))

(assert (=> b!630917 e!360747))

(declare-fun res!407884 () Bool)

(assert (=> b!630917 (=> (not res!407884) (not e!360747))))

(declare-fun lt!291426 () (_ BitVec 32))

(assert (=> b!630917 (= res!407884 (= lt!291430 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291426 vacantSpotIndex!68 lt!291429 lt!291425 mask!3053)))))

(assert (=> b!630917 (= lt!291430 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291426 vacantSpotIndex!68 (select (arr!18271 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!630917 (= lt!291429 (select (store (arr!18271 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!291423 () Unit!21178)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38074 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21178)

(assert (=> b!630917 (= lt!291423 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291426 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!630917 (= lt!291426 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!630918 () Bool)

(assert (=> b!630918 (= e!360745 e!360749)))

(declare-fun res!407886 () Bool)

(assert (=> b!630918 (=> (not res!407886) (not e!360749))))

(declare-fun lt!291424 () SeekEntryResult!6711)

(assert (=> b!630918 (= res!407886 (or (= lt!291424 (MissingZero!6711 i!1108)) (= lt!291424 (MissingVacant!6711 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38074 (_ BitVec 32)) SeekEntryResult!6711)

(assert (=> b!630918 (= lt!291424 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!630919 () Bool)

(declare-fun res!407887 () Bool)

(assert (=> b!630919 (=> (not res!407887) (not e!360749))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38074 (_ BitVec 32)) Bool)

(assert (=> b!630919 (= res!407887 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!630920 () Bool)

(declare-fun res!407883 () Bool)

(assert (=> b!630920 (=> (not res!407883) (not e!360749))))

(declare-datatypes ((List!12312 0))(
  ( (Nil!12309) (Cons!12308 (h!13353 (_ BitVec 64)) (t!18540 List!12312)) )
))
(declare-fun arrayNoDuplicates!0 (array!38074 (_ BitVec 32) List!12312) Bool)

(assert (=> b!630920 (= res!407883 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12309))))

(assert (= (and start!56998 res!407879) b!630907))

(assert (= (and b!630907 res!407880) b!630912))

(assert (= (and b!630912 res!407877) b!630911))

(assert (= (and b!630911 res!407882) b!630908))

(assert (= (and b!630908 res!407885) b!630918))

(assert (= (and b!630918 res!407886) b!630919))

(assert (= (and b!630919 res!407887) b!630920))

(assert (= (and b!630920 res!407883) b!630914))

(assert (= (and b!630914 res!407888) b!630913))

(assert (= (and b!630913 res!407878) b!630910))

(assert (= (and b!630910 res!407881) b!630917))

(assert (= (and b!630917 res!407884) b!630909))

(assert (= (and b!630917 c!71882) b!630916))

(assert (= (and b!630917 (not c!71882)) b!630915))

(declare-fun m!605863 () Bool)

(assert (=> b!630911 m!605863))

(declare-fun m!605865 () Bool)

(assert (=> b!630920 m!605865))

(declare-fun m!605867 () Bool)

(assert (=> b!630918 m!605867))

(declare-fun m!605869 () Bool)

(assert (=> b!630908 m!605869))

(declare-fun m!605871 () Bool)

(assert (=> b!630914 m!605871))

(declare-fun m!605873 () Bool)

(assert (=> b!630913 m!605873))

(declare-fun m!605875 () Bool)

(assert (=> b!630913 m!605875))

(declare-fun m!605877 () Bool)

(assert (=> b!630919 m!605877))

(declare-fun m!605879 () Bool)

(assert (=> b!630912 m!605879))

(assert (=> b!630912 m!605879))

(declare-fun m!605881 () Bool)

(assert (=> b!630912 m!605881))

(declare-fun m!605883 () Bool)

(assert (=> start!56998 m!605883))

(declare-fun m!605885 () Bool)

(assert (=> start!56998 m!605885))

(declare-fun m!605887 () Bool)

(assert (=> b!630917 m!605887))

(assert (=> b!630917 m!605879))

(assert (=> b!630917 m!605879))

(declare-fun m!605889 () Bool)

(assert (=> b!630917 m!605889))

(assert (=> b!630917 m!605873))

(declare-fun m!605891 () Bool)

(assert (=> b!630917 m!605891))

(declare-fun m!605893 () Bool)

(assert (=> b!630917 m!605893))

(declare-fun m!605895 () Bool)

(assert (=> b!630917 m!605895))

(declare-fun m!605897 () Bool)

(assert (=> b!630917 m!605897))

(declare-fun m!605899 () Bool)

(assert (=> b!630910 m!605899))

(assert (=> b!630910 m!605879))

(assert (=> b!630910 m!605879))

(declare-fun m!605901 () Bool)

(assert (=> b!630910 m!605901))

(check-sat (not b!630918) (not b!630919) (not b!630911) (not b!630912) (not start!56998) (not b!630908) (not b!630910) (not b!630920) (not b!630917))
(check-sat)
