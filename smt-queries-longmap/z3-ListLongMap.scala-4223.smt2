; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57934 () Bool)

(assert start!57934)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!366967 () Bool)

(declare-datatypes ((array!38361 0))(
  ( (array!38362 (arr!18400 (Array (_ BitVec 32) (_ BitVec 64))) (size!18764 (_ BitVec 32))) )
))
(declare-fun lt!296780 () array!38361)

(declare-fun b!641005 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!38361)

(declare-fun arrayContainsKey!0 (array!38361 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!641005 (= e!366967 (arrayContainsKey!0 lt!296780 (select (arr!18400 a!2986) j!136) index!984))))

(declare-fun b!641006 () Bool)

(declare-fun e!366972 () Bool)

(declare-fun e!366971 () Bool)

(assert (=> b!641006 (= e!366972 e!366971)))

(declare-fun res!415211 () Bool)

(assert (=> b!641006 (=> (not res!415211) (not e!366971))))

(declare-datatypes ((SeekEntryResult!6840 0))(
  ( (MissingZero!6840 (index!29680 (_ BitVec 32))) (Found!6840 (index!29681 (_ BitVec 32))) (Intermediate!6840 (undefined!7652 Bool) (index!29682 (_ BitVec 32)) (x!58436 (_ BitVec 32))) (Undefined!6840) (MissingVacant!6840 (index!29683 (_ BitVec 32))) )
))
(declare-fun lt!296787 () SeekEntryResult!6840)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!641006 (= res!415211 (or (= lt!296787 (MissingZero!6840 i!1108)) (= lt!296787 (MissingVacant!6840 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38361 (_ BitVec 32)) SeekEntryResult!6840)

(assert (=> b!641006 (= lt!296787 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!641007 () Bool)

(declare-fun res!415224 () Bool)

(assert (=> b!641007 (=> (not res!415224) (not e!366971))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38361 (_ BitVec 32)) Bool)

(assert (=> b!641007 (= res!415224 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!641008 () Bool)

(declare-fun e!366970 () Bool)

(declare-fun lt!296781 () SeekEntryResult!6840)

(declare-fun lt!296778 () SeekEntryResult!6840)

(assert (=> b!641008 (= e!366970 (= lt!296781 lt!296778))))

(declare-fun b!641009 () Bool)

(declare-fun res!415213 () Bool)

(assert (=> b!641009 (=> (not res!415213) (not e!366972))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!641009 (= res!415213 (validKeyInArray!0 (select (arr!18400 a!2986) j!136)))))

(declare-fun b!641010 () Bool)

(declare-fun res!415209 () Bool)

(assert (=> b!641010 (=> (not res!415209) (not e!366972))))

(assert (=> b!641010 (= res!415209 (and (= (size!18764 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18764 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18764 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!641011 () Bool)

(declare-fun res!415219 () Bool)

(assert (=> b!641011 (=> (not res!415219) (not e!366971))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!641011 (= res!415219 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18400 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!415216 () Bool)

(assert (=> start!57934 (=> (not res!415216) (not e!366972))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57934 (= res!415216 (validMask!0 mask!3053))))

(assert (=> start!57934 e!366972))

(assert (=> start!57934 true))

(declare-fun array_inv!14196 (array!38361) Bool)

(assert (=> start!57934 (array_inv!14196 a!2986)))

(declare-fun b!641012 () Bool)

(declare-datatypes ((Unit!21694 0))(
  ( (Unit!21695) )
))
(declare-fun e!366969 () Unit!21694)

(declare-fun Unit!21696 () Unit!21694)

(assert (=> b!641012 (= e!366969 Unit!21696)))

(declare-fun b!641013 () Bool)

(declare-fun res!415215 () Bool)

(assert (=> b!641013 (=> (not res!415215) (not e!366972))))

(assert (=> b!641013 (= res!415215 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!641014 () Bool)

(declare-fun e!366968 () Bool)

(declare-fun e!366966 () Bool)

(assert (=> b!641014 (= e!366968 e!366966)))

(declare-fun res!415212 () Bool)

(assert (=> b!641014 (=> res!415212 e!366966)))

(declare-fun lt!296784 () (_ BitVec 64))

(declare-fun lt!296785 () (_ BitVec 64))

(assert (=> b!641014 (= res!415212 (or (not (= (select (arr!18400 a!2986) j!136) lt!296784)) (not (= (select (arr!18400 a!2986) j!136) lt!296785)) (bvsge j!136 index!984)))))

(declare-fun e!366975 () Bool)

(assert (=> b!641014 e!366975))

(declare-fun res!415210 () Bool)

(assert (=> b!641014 (=> (not res!415210) (not e!366975))))

(assert (=> b!641014 (= res!415210 (= lt!296785 (select (arr!18400 a!2986) j!136)))))

(assert (=> b!641014 (= lt!296785 (select (store (arr!18400 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!641015 () Bool)

(declare-fun e!366978 () Bool)

(assert (=> b!641015 (= e!366978 (not e!366968))))

(declare-fun res!415221 () Bool)

(assert (=> b!641015 (=> res!415221 e!366968)))

(declare-fun lt!296779 () SeekEntryResult!6840)

(assert (=> b!641015 (= res!415221 (not (= lt!296779 (Found!6840 index!984))))))

(declare-fun lt!296786 () Unit!21694)

(assert (=> b!641015 (= lt!296786 e!366969)))

(declare-fun c!73265 () Bool)

(assert (=> b!641015 (= c!73265 (= lt!296779 Undefined!6840))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38361 (_ BitVec 32)) SeekEntryResult!6840)

(assert (=> b!641015 (= lt!296779 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!296784 lt!296780 mask!3053))))

(assert (=> b!641015 e!366970))

(declare-fun res!415225 () Bool)

(assert (=> b!641015 (=> (not res!415225) (not e!366970))))

(declare-fun lt!296777 () (_ BitVec 32))

(assert (=> b!641015 (= res!415225 (= lt!296778 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296777 vacantSpotIndex!68 lt!296784 lt!296780 mask!3053)))))

(assert (=> b!641015 (= lt!296778 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296777 vacantSpotIndex!68 (select (arr!18400 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!641015 (= lt!296784 (select (store (arr!18400 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!296783 () Unit!21694)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38361 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21694)

(assert (=> b!641015 (= lt!296783 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!296777 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!641015 (= lt!296777 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!641016 () Bool)

(declare-fun e!366973 () Bool)

(assert (=> b!641016 (= e!366971 e!366973)))

(declare-fun res!415218 () Bool)

(assert (=> b!641016 (=> (not res!415218) (not e!366973))))

(assert (=> b!641016 (= res!415218 (= (select (store (arr!18400 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!641016 (= lt!296780 (array!38362 (store (arr!18400 a!2986) i!1108 k0!1786) (size!18764 a!2986)))))

(declare-fun b!641017 () Bool)

(declare-fun e!366977 () Bool)

(declare-datatypes ((List!12441 0))(
  ( (Nil!12438) (Cons!12437 (h!13482 (_ BitVec 64)) (t!18669 List!12441)) )
))
(declare-fun noDuplicate!400 (List!12441) Bool)

(assert (=> b!641017 (= e!366977 (noDuplicate!400 Nil!12438))))

(declare-fun b!641018 () Bool)

(assert (=> b!641018 (= e!366966 e!366977)))

(declare-fun res!415214 () Bool)

(assert (=> b!641018 (=> res!415214 e!366977)))

(assert (=> b!641018 (= res!415214 (or (bvsge (size!18764 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18764 a!2986))))))

(declare-fun arrayNoDuplicates!0 (array!38361 (_ BitVec 32) List!12441) Bool)

(assert (=> b!641018 (arrayNoDuplicates!0 lt!296780 j!136 Nil!12438)))

(declare-fun lt!296782 () Unit!21694)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38361 (_ BitVec 32) (_ BitVec 32)) Unit!21694)

(assert (=> b!641018 (= lt!296782 (lemmaNoDuplicateFromThenFromBigger!0 lt!296780 #b00000000000000000000000000000000 j!136))))

(assert (=> b!641018 (arrayNoDuplicates!0 lt!296780 #b00000000000000000000000000000000 Nil!12438)))

(declare-fun lt!296776 () Unit!21694)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38361 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12441) Unit!21694)

(assert (=> b!641018 (= lt!296776 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12438))))

(assert (=> b!641018 (arrayContainsKey!0 lt!296780 (select (arr!18400 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!296788 () Unit!21694)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38361 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21694)

(assert (=> b!641018 (= lt!296788 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!296780 (select (arr!18400 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!641019 () Bool)

(declare-fun e!366976 () Bool)

(assert (=> b!641019 (= e!366976 e!366967)))

(declare-fun res!415217 () Bool)

(assert (=> b!641019 (=> (not res!415217) (not e!366967))))

(assert (=> b!641019 (= res!415217 (arrayContainsKey!0 lt!296780 (select (arr!18400 a!2986) j!136) j!136))))

(declare-fun b!641020 () Bool)

(declare-fun res!415223 () Bool)

(assert (=> b!641020 (=> (not res!415223) (not e!366972))))

(assert (=> b!641020 (= res!415223 (validKeyInArray!0 k0!1786))))

(declare-fun b!641021 () Bool)

(assert (=> b!641021 (= e!366973 e!366978)))

(declare-fun res!415220 () Bool)

(assert (=> b!641021 (=> (not res!415220) (not e!366978))))

(assert (=> b!641021 (= res!415220 (and (= lt!296781 (Found!6840 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18400 a!2986) index!984) (select (arr!18400 a!2986) j!136))) (not (= (select (arr!18400 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!641021 (= lt!296781 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18400 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!641022 () Bool)

(assert (=> b!641022 (= e!366975 e!366976)))

(declare-fun res!415226 () Bool)

(assert (=> b!641022 (=> res!415226 e!366976)))

(assert (=> b!641022 (= res!415226 (or (not (= (select (arr!18400 a!2986) j!136) lt!296784)) (not (= (select (arr!18400 a!2986) j!136) lt!296785)) (bvsge j!136 index!984)))))

(declare-fun b!641023 () Bool)

(declare-fun res!415222 () Bool)

(assert (=> b!641023 (=> (not res!415222) (not e!366971))))

(assert (=> b!641023 (= res!415222 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12438))))

(declare-fun b!641024 () Bool)

(declare-fun Unit!21697 () Unit!21694)

(assert (=> b!641024 (= e!366969 Unit!21697)))

(assert (=> b!641024 false))

(assert (= (and start!57934 res!415216) b!641010))

(assert (= (and b!641010 res!415209) b!641009))

(assert (= (and b!641009 res!415213) b!641020))

(assert (= (and b!641020 res!415223) b!641013))

(assert (= (and b!641013 res!415215) b!641006))

(assert (= (and b!641006 res!415211) b!641007))

(assert (= (and b!641007 res!415224) b!641023))

(assert (= (and b!641023 res!415222) b!641011))

(assert (= (and b!641011 res!415219) b!641016))

(assert (= (and b!641016 res!415218) b!641021))

(assert (= (and b!641021 res!415220) b!641015))

(assert (= (and b!641015 res!415225) b!641008))

(assert (= (and b!641015 c!73265) b!641024))

(assert (= (and b!641015 (not c!73265)) b!641012))

(assert (= (and b!641015 (not res!415221)) b!641014))

(assert (= (and b!641014 res!415210) b!641022))

(assert (= (and b!641022 (not res!415226)) b!641019))

(assert (= (and b!641019 res!415217) b!641005))

(assert (= (and b!641014 (not res!415212)) b!641018))

(assert (= (and b!641018 (not res!415214)) b!641017))

(declare-fun m!614843 () Bool)

(assert (=> b!641005 m!614843))

(assert (=> b!641005 m!614843))

(declare-fun m!614845 () Bool)

(assert (=> b!641005 m!614845))

(declare-fun m!614847 () Bool)

(assert (=> b!641007 m!614847))

(declare-fun m!614849 () Bool)

(assert (=> b!641021 m!614849))

(assert (=> b!641021 m!614843))

(assert (=> b!641021 m!614843))

(declare-fun m!614851 () Bool)

(assert (=> b!641021 m!614851))

(declare-fun m!614853 () Bool)

(assert (=> b!641017 m!614853))

(declare-fun m!614855 () Bool)

(assert (=> b!641011 m!614855))

(declare-fun m!614857 () Bool)

(assert (=> b!641013 m!614857))

(assert (=> b!641009 m!614843))

(assert (=> b!641009 m!614843))

(declare-fun m!614859 () Bool)

(assert (=> b!641009 m!614859))

(assert (=> b!641018 m!614843))

(assert (=> b!641018 m!614843))

(declare-fun m!614861 () Bool)

(assert (=> b!641018 m!614861))

(declare-fun m!614863 () Bool)

(assert (=> b!641018 m!614863))

(declare-fun m!614865 () Bool)

(assert (=> b!641018 m!614865))

(declare-fun m!614867 () Bool)

(assert (=> b!641018 m!614867))

(assert (=> b!641018 m!614843))

(declare-fun m!614869 () Bool)

(assert (=> b!641018 m!614869))

(declare-fun m!614871 () Bool)

(assert (=> b!641018 m!614871))

(declare-fun m!614873 () Bool)

(assert (=> b!641020 m!614873))

(declare-fun m!614875 () Bool)

(assert (=> b!641023 m!614875))

(declare-fun m!614877 () Bool)

(assert (=> b!641015 m!614877))

(declare-fun m!614879 () Bool)

(assert (=> b!641015 m!614879))

(assert (=> b!641015 m!614843))

(declare-fun m!614881 () Bool)

(assert (=> b!641015 m!614881))

(declare-fun m!614883 () Bool)

(assert (=> b!641015 m!614883))

(assert (=> b!641015 m!614843))

(declare-fun m!614885 () Bool)

(assert (=> b!641015 m!614885))

(declare-fun m!614887 () Bool)

(assert (=> b!641015 m!614887))

(declare-fun m!614889 () Bool)

(assert (=> b!641015 m!614889))

(declare-fun m!614891 () Bool)

(assert (=> start!57934 m!614891))

(declare-fun m!614893 () Bool)

(assert (=> start!57934 m!614893))

(assert (=> b!641022 m!614843))

(assert (=> b!641014 m!614843))

(assert (=> b!641014 m!614883))

(declare-fun m!614895 () Bool)

(assert (=> b!641014 m!614895))

(assert (=> b!641016 m!614883))

(declare-fun m!614897 () Bool)

(assert (=> b!641016 m!614897))

(assert (=> b!641019 m!614843))

(assert (=> b!641019 m!614843))

(declare-fun m!614899 () Bool)

(assert (=> b!641019 m!614899))

(declare-fun m!614901 () Bool)

(assert (=> b!641006 m!614901))

(check-sat (not b!641018) (not b!641005) (not b!641015) (not b!641007) (not b!641017) (not start!57934) (not b!641019) (not b!641006) (not b!641023) (not b!641013) (not b!641009) (not b!641021) (not b!641020))
(check-sat)
(get-model)

(declare-fun d!90485 () Bool)

(declare-fun res!415285 () Bool)

(declare-fun e!367022 () Bool)

(assert (=> d!90485 (=> res!415285 e!367022)))

(assert (=> d!90485 (= res!415285 (= (select (arr!18400 lt!296780) j!136) (select (arr!18400 a!2986) j!136)))))

(assert (=> d!90485 (= (arrayContainsKey!0 lt!296780 (select (arr!18400 a!2986) j!136) j!136) e!367022)))

(declare-fun b!641089 () Bool)

(declare-fun e!367023 () Bool)

(assert (=> b!641089 (= e!367022 e!367023)))

(declare-fun res!415286 () Bool)

(assert (=> b!641089 (=> (not res!415286) (not e!367023))))

(assert (=> b!641089 (= res!415286 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18764 lt!296780)))))

(declare-fun b!641090 () Bool)

(assert (=> b!641090 (= e!367023 (arrayContainsKey!0 lt!296780 (select (arr!18400 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!90485 (not res!415285)) b!641089))

(assert (= (and b!641089 res!415286) b!641090))

(declare-fun m!614963 () Bool)

(assert (=> d!90485 m!614963))

(assert (=> b!641090 m!614843))

(declare-fun m!614965 () Bool)

(assert (=> b!641090 m!614965))

(assert (=> b!641019 d!90485))

(declare-fun b!641099 () Bool)

(declare-fun e!367032 () Bool)

(declare-fun call!33515 () Bool)

(assert (=> b!641099 (= e!367032 call!33515)))

(declare-fun b!641100 () Bool)

(declare-fun e!367030 () Bool)

(assert (=> b!641100 (= e!367030 call!33515)))

(declare-fun d!90487 () Bool)

(declare-fun res!415292 () Bool)

(declare-fun e!367031 () Bool)

(assert (=> d!90487 (=> res!415292 e!367031)))

(assert (=> d!90487 (= res!415292 (bvsge #b00000000000000000000000000000000 (size!18764 a!2986)))))

(assert (=> d!90487 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!367031)))

(declare-fun b!641101 () Bool)

(assert (=> b!641101 (= e!367032 e!367030)))

(declare-fun lt!296836 () (_ BitVec 64))

(assert (=> b!641101 (= lt!296836 (select (arr!18400 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!296834 () Unit!21694)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38361 (_ BitVec 64) (_ BitVec 32)) Unit!21694)

(assert (=> b!641101 (= lt!296834 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!296836 #b00000000000000000000000000000000))))

(assert (=> b!641101 (arrayContainsKey!0 a!2986 lt!296836 #b00000000000000000000000000000000)))

(declare-fun lt!296835 () Unit!21694)

(assert (=> b!641101 (= lt!296835 lt!296834)))

(declare-fun res!415291 () Bool)

(assert (=> b!641101 (= res!415291 (= (seekEntryOrOpen!0 (select (arr!18400 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6840 #b00000000000000000000000000000000)))))

(assert (=> b!641101 (=> (not res!415291) (not e!367030))))

(declare-fun bm!33512 () Bool)

(assert (=> bm!33512 (= call!33515 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!641102 () Bool)

(assert (=> b!641102 (= e!367031 e!367032)))

(declare-fun c!73271 () Bool)

(assert (=> b!641102 (= c!73271 (validKeyInArray!0 (select (arr!18400 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!90487 (not res!415292)) b!641102))

(assert (= (and b!641102 c!73271) b!641101))

(assert (= (and b!641102 (not c!73271)) b!641099))

(assert (= (and b!641101 res!415291) b!641100))

(assert (= (or b!641100 b!641099) bm!33512))

(declare-fun m!614967 () Bool)

(assert (=> b!641101 m!614967))

(declare-fun m!614969 () Bool)

(assert (=> b!641101 m!614969))

(declare-fun m!614971 () Bool)

(assert (=> b!641101 m!614971))

(assert (=> b!641101 m!614967))

(declare-fun m!614973 () Bool)

(assert (=> b!641101 m!614973))

(declare-fun m!614975 () Bool)

(assert (=> bm!33512 m!614975))

(assert (=> b!641102 m!614967))

(assert (=> b!641102 m!614967))

(declare-fun m!614977 () Bool)

(assert (=> b!641102 m!614977))

(assert (=> b!641007 d!90487))

(declare-fun d!90489 () Bool)

(assert (=> d!90489 (arrayContainsKey!0 lt!296780 (select (arr!18400 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!296839 () Unit!21694)

(declare-fun choose!114 (array!38361 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21694)

(assert (=> d!90489 (= lt!296839 (choose!114 lt!296780 (select (arr!18400 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!90489 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!90489 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!296780 (select (arr!18400 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!296839)))

(declare-fun bs!19195 () Bool)

(assert (= bs!19195 d!90489))

(assert (=> bs!19195 m!614843))

(assert (=> bs!19195 m!614861))

(assert (=> bs!19195 m!614843))

(declare-fun m!614979 () Bool)

(assert (=> bs!19195 m!614979))

(assert (=> b!641018 d!90489))

(declare-fun d!90491 () Bool)

(declare-fun res!415293 () Bool)

(declare-fun e!367033 () Bool)

(assert (=> d!90491 (=> res!415293 e!367033)))

(assert (=> d!90491 (= res!415293 (= (select (arr!18400 lt!296780) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18400 a!2986) j!136)))))

(assert (=> d!90491 (= (arrayContainsKey!0 lt!296780 (select (arr!18400 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!367033)))

(declare-fun b!641103 () Bool)

(declare-fun e!367034 () Bool)

(assert (=> b!641103 (= e!367033 e!367034)))

(declare-fun res!415294 () Bool)

(assert (=> b!641103 (=> (not res!415294) (not e!367034))))

(assert (=> b!641103 (= res!415294 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18764 lt!296780)))))

(declare-fun b!641104 () Bool)

(assert (=> b!641104 (= e!367034 (arrayContainsKey!0 lt!296780 (select (arr!18400 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!90491 (not res!415293)) b!641103))

(assert (= (and b!641103 res!415294) b!641104))

(declare-fun m!614981 () Bool)

(assert (=> d!90491 m!614981))

(assert (=> b!641104 m!614843))

(declare-fun m!614983 () Bool)

(assert (=> b!641104 m!614983))

(assert (=> b!641018 d!90491))

(declare-fun d!90493 () Bool)

(assert (=> d!90493 (arrayNoDuplicates!0 lt!296780 j!136 Nil!12438)))

(declare-fun lt!296842 () Unit!21694)

(declare-fun choose!39 (array!38361 (_ BitVec 32) (_ BitVec 32)) Unit!21694)

(assert (=> d!90493 (= lt!296842 (choose!39 lt!296780 #b00000000000000000000000000000000 j!136))))

(assert (=> d!90493 (bvslt (size!18764 lt!296780) #b01111111111111111111111111111111)))

(assert (=> d!90493 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!296780 #b00000000000000000000000000000000 j!136) lt!296842)))

(declare-fun bs!19196 () Bool)

(assert (= bs!19196 d!90493))

(assert (=> bs!19196 m!614863))

(declare-fun m!614985 () Bool)

(assert (=> bs!19196 m!614985))

(assert (=> b!641018 d!90493))

(declare-fun bm!33515 () Bool)

(declare-fun call!33518 () Bool)

(declare-fun c!73274 () Bool)

(assert (=> bm!33515 (= call!33518 (arrayNoDuplicates!0 lt!296780 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!73274 (Cons!12437 (select (arr!18400 lt!296780) #b00000000000000000000000000000000) Nil!12438) Nil!12438)))))

(declare-fun b!641115 () Bool)

(declare-fun e!367043 () Bool)

(assert (=> b!641115 (= e!367043 call!33518)))

(declare-fun d!90495 () Bool)

(declare-fun res!415301 () Bool)

(declare-fun e!367044 () Bool)

(assert (=> d!90495 (=> res!415301 e!367044)))

(assert (=> d!90495 (= res!415301 (bvsge #b00000000000000000000000000000000 (size!18764 lt!296780)))))

(assert (=> d!90495 (= (arrayNoDuplicates!0 lt!296780 #b00000000000000000000000000000000 Nil!12438) e!367044)))

(declare-fun b!641116 () Bool)

(declare-fun e!367046 () Bool)

(assert (=> b!641116 (= e!367046 e!367043)))

(assert (=> b!641116 (= c!73274 (validKeyInArray!0 (select (arr!18400 lt!296780) #b00000000000000000000000000000000)))))

(declare-fun b!641117 () Bool)

(assert (=> b!641117 (= e!367043 call!33518)))

(declare-fun b!641118 () Bool)

(assert (=> b!641118 (= e!367044 e!367046)))

(declare-fun res!415303 () Bool)

(assert (=> b!641118 (=> (not res!415303) (not e!367046))))

(declare-fun e!367045 () Bool)

(assert (=> b!641118 (= res!415303 (not e!367045))))

(declare-fun res!415302 () Bool)

(assert (=> b!641118 (=> (not res!415302) (not e!367045))))

(assert (=> b!641118 (= res!415302 (validKeyInArray!0 (select (arr!18400 lt!296780) #b00000000000000000000000000000000)))))

(declare-fun b!641119 () Bool)

(declare-fun contains!3127 (List!12441 (_ BitVec 64)) Bool)

(assert (=> b!641119 (= e!367045 (contains!3127 Nil!12438 (select (arr!18400 lt!296780) #b00000000000000000000000000000000)))))

(assert (= (and d!90495 (not res!415301)) b!641118))

(assert (= (and b!641118 res!415302) b!641119))

(assert (= (and b!641118 res!415303) b!641116))

(assert (= (and b!641116 c!73274) b!641117))

(assert (= (and b!641116 (not c!73274)) b!641115))

(assert (= (or b!641117 b!641115) bm!33515))

(declare-fun m!614987 () Bool)

(assert (=> bm!33515 m!614987))

(declare-fun m!614989 () Bool)

(assert (=> bm!33515 m!614989))

(assert (=> b!641116 m!614987))

(assert (=> b!641116 m!614987))

(declare-fun m!614991 () Bool)

(assert (=> b!641116 m!614991))

(assert (=> b!641118 m!614987))

(assert (=> b!641118 m!614987))

(assert (=> b!641118 m!614991))

(assert (=> b!641119 m!614987))

(assert (=> b!641119 m!614987))

(declare-fun m!614993 () Bool)

(assert (=> b!641119 m!614993))

(assert (=> b!641018 d!90495))

(declare-fun bm!33516 () Bool)

(declare-fun c!73275 () Bool)

(declare-fun call!33519 () Bool)

(assert (=> bm!33516 (= call!33519 (arrayNoDuplicates!0 lt!296780 (bvadd j!136 #b00000000000000000000000000000001) (ite c!73275 (Cons!12437 (select (arr!18400 lt!296780) j!136) Nil!12438) Nil!12438)))))

(declare-fun b!641120 () Bool)

(declare-fun e!367047 () Bool)

(assert (=> b!641120 (= e!367047 call!33519)))

(declare-fun d!90497 () Bool)

(declare-fun res!415304 () Bool)

(declare-fun e!367048 () Bool)

(assert (=> d!90497 (=> res!415304 e!367048)))

(assert (=> d!90497 (= res!415304 (bvsge j!136 (size!18764 lt!296780)))))

(assert (=> d!90497 (= (arrayNoDuplicates!0 lt!296780 j!136 Nil!12438) e!367048)))

(declare-fun b!641121 () Bool)

(declare-fun e!367050 () Bool)

(assert (=> b!641121 (= e!367050 e!367047)))

(assert (=> b!641121 (= c!73275 (validKeyInArray!0 (select (arr!18400 lt!296780) j!136)))))

(declare-fun b!641122 () Bool)

(assert (=> b!641122 (= e!367047 call!33519)))

(declare-fun b!641123 () Bool)

(assert (=> b!641123 (= e!367048 e!367050)))

(declare-fun res!415306 () Bool)

(assert (=> b!641123 (=> (not res!415306) (not e!367050))))

(declare-fun e!367049 () Bool)

(assert (=> b!641123 (= res!415306 (not e!367049))))

(declare-fun res!415305 () Bool)

(assert (=> b!641123 (=> (not res!415305) (not e!367049))))

(assert (=> b!641123 (= res!415305 (validKeyInArray!0 (select (arr!18400 lt!296780) j!136)))))

(declare-fun b!641124 () Bool)

(assert (=> b!641124 (= e!367049 (contains!3127 Nil!12438 (select (arr!18400 lt!296780) j!136)))))

(assert (= (and d!90497 (not res!415304)) b!641123))

(assert (= (and b!641123 res!415305) b!641124))

(assert (= (and b!641123 res!415306) b!641121))

(assert (= (and b!641121 c!73275) b!641122))

(assert (= (and b!641121 (not c!73275)) b!641120))

(assert (= (or b!641122 b!641120) bm!33516))

(assert (=> bm!33516 m!614963))

(declare-fun m!614995 () Bool)

(assert (=> bm!33516 m!614995))

(assert (=> b!641121 m!614963))

(assert (=> b!641121 m!614963))

(declare-fun m!614997 () Bool)

(assert (=> b!641121 m!614997))

(assert (=> b!641123 m!614963))

(assert (=> b!641123 m!614963))

(assert (=> b!641123 m!614997))

(assert (=> b!641124 m!614963))

(assert (=> b!641124 m!614963))

(declare-fun m!614999 () Bool)

(assert (=> b!641124 m!614999))

(assert (=> b!641018 d!90497))

(declare-fun d!90499 () Bool)

(declare-fun e!367053 () Bool)

(assert (=> d!90499 e!367053))

(declare-fun res!415309 () Bool)

(assert (=> d!90499 (=> (not res!415309) (not e!367053))))

(assert (=> d!90499 (= res!415309 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18764 a!2986))))))

(declare-fun lt!296845 () Unit!21694)

(declare-fun choose!41 (array!38361 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12441) Unit!21694)

(assert (=> d!90499 (= lt!296845 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12438))))

(assert (=> d!90499 (bvslt (size!18764 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!90499 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12438) lt!296845)))

(declare-fun b!641127 () Bool)

(assert (=> b!641127 (= e!367053 (arrayNoDuplicates!0 (array!38362 (store (arr!18400 a!2986) i!1108 k0!1786) (size!18764 a!2986)) #b00000000000000000000000000000000 Nil!12438))))

(assert (= (and d!90499 res!415309) b!641127))

(declare-fun m!615001 () Bool)

(assert (=> d!90499 m!615001))

(assert (=> b!641127 m!614883))

(declare-fun m!615003 () Bool)

(assert (=> b!641127 m!615003))

(assert (=> b!641018 d!90499))

(declare-fun d!90501 () Bool)

(declare-fun res!415314 () Bool)

(declare-fun e!367058 () Bool)

(assert (=> d!90501 (=> res!415314 e!367058)))

(get-info :version)

(assert (=> d!90501 (= res!415314 ((_ is Nil!12438) Nil!12438))))

(assert (=> d!90501 (= (noDuplicate!400 Nil!12438) e!367058)))

(declare-fun b!641132 () Bool)

(declare-fun e!367059 () Bool)

(assert (=> b!641132 (= e!367058 e!367059)))

(declare-fun res!415315 () Bool)

(assert (=> b!641132 (=> (not res!415315) (not e!367059))))

(assert (=> b!641132 (= res!415315 (not (contains!3127 (t!18669 Nil!12438) (h!13482 Nil!12438))))))

(declare-fun b!641133 () Bool)

(assert (=> b!641133 (= e!367059 (noDuplicate!400 (t!18669 Nil!12438)))))

(assert (= (and d!90501 (not res!415314)) b!641132))

(assert (= (and b!641132 res!415315) b!641133))

(declare-fun m!615005 () Bool)

(assert (=> b!641132 m!615005))

(declare-fun m!615007 () Bool)

(assert (=> b!641133 m!615007))

(assert (=> b!641017 d!90501))

(declare-fun lt!296850 () SeekEntryResult!6840)

(declare-fun d!90503 () Bool)

(assert (=> d!90503 (and (or ((_ is Undefined!6840) lt!296850) (not ((_ is Found!6840) lt!296850)) (and (bvsge (index!29681 lt!296850) #b00000000000000000000000000000000) (bvslt (index!29681 lt!296850) (size!18764 a!2986)))) (or ((_ is Undefined!6840) lt!296850) ((_ is Found!6840) lt!296850) (not ((_ is MissingVacant!6840) lt!296850)) (not (= (index!29683 lt!296850) vacantSpotIndex!68)) (and (bvsge (index!29683 lt!296850) #b00000000000000000000000000000000) (bvslt (index!29683 lt!296850) (size!18764 a!2986)))) (or ((_ is Undefined!6840) lt!296850) (ite ((_ is Found!6840) lt!296850) (= (select (arr!18400 a!2986) (index!29681 lt!296850)) (select (arr!18400 a!2986) j!136)) (and ((_ is MissingVacant!6840) lt!296850) (= (index!29683 lt!296850) vacantSpotIndex!68) (= (select (arr!18400 a!2986) (index!29683 lt!296850)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!367080 () SeekEntryResult!6840)

(assert (=> d!90503 (= lt!296850 e!367080)))

(declare-fun c!73286 () Bool)

(assert (=> d!90503 (= c!73286 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!296851 () (_ BitVec 64))

(assert (=> d!90503 (= lt!296851 (select (arr!18400 a!2986) index!984))))

(assert (=> d!90503 (validMask!0 mask!3053)))

(assert (=> d!90503 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18400 a!2986) j!136) a!2986 mask!3053) lt!296850)))

(declare-fun b!641162 () Bool)

(declare-fun e!367082 () SeekEntryResult!6840)

(assert (=> b!641162 (= e!367080 e!367082)))

(declare-fun c!73284 () Bool)

(assert (=> b!641162 (= c!73284 (= lt!296851 (select (arr!18400 a!2986) j!136)))))

(declare-fun b!641163 () Bool)

(declare-fun e!367081 () SeekEntryResult!6840)

(assert (=> b!641163 (= e!367081 (MissingVacant!6840 vacantSpotIndex!68))))

(declare-fun b!641164 () Bool)

(assert (=> b!641164 (= e!367081 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18400 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!641165 () Bool)

(assert (=> b!641165 (= e!367080 Undefined!6840)))

(declare-fun b!641166 () Bool)

(assert (=> b!641166 (= e!367082 (Found!6840 index!984))))

(declare-fun b!641167 () Bool)

(declare-fun c!73285 () Bool)

(assert (=> b!641167 (= c!73285 (= lt!296851 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!641167 (= e!367082 e!367081)))

(assert (= (and d!90503 c!73286) b!641165))

(assert (= (and d!90503 (not c!73286)) b!641162))

(assert (= (and b!641162 c!73284) b!641166))

(assert (= (and b!641162 (not c!73284)) b!641167))

(assert (= (and b!641167 c!73285) b!641163))

(assert (= (and b!641167 (not c!73285)) b!641164))

(declare-fun m!615013 () Bool)

(assert (=> d!90503 m!615013))

(declare-fun m!615015 () Bool)

(assert (=> d!90503 m!615015))

(assert (=> d!90503 m!614849))

(assert (=> d!90503 m!614891))

(assert (=> b!641164 m!614877))

(assert (=> b!641164 m!614877))

(assert (=> b!641164 m!614843))

(declare-fun m!615017 () Bool)

(assert (=> b!641164 m!615017))

(assert (=> b!641021 d!90503))

(declare-fun d!90509 () Bool)

(assert (=> d!90509 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!57934 d!90509))

(declare-fun d!90515 () Bool)

(assert (=> d!90515 (= (array_inv!14196 a!2986) (bvsge (size!18764 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!57934 d!90515))

(declare-fun d!90517 () Bool)

(assert (=> d!90517 (= (validKeyInArray!0 (select (arr!18400 a!2986) j!136)) (and (not (= (select (arr!18400 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18400 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!641009 d!90517))

(declare-fun d!90519 () Bool)

(assert (=> d!90519 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!641020 d!90519))

(declare-fun d!90521 () Bool)

(declare-fun res!415331 () Bool)

(declare-fun e!367087 () Bool)

(assert (=> d!90521 (=> res!415331 e!367087)))

(assert (=> d!90521 (= res!415331 (= (select (arr!18400 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!90521 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!367087)))

(declare-fun b!641173 () Bool)

(declare-fun e!367088 () Bool)

(assert (=> b!641173 (= e!367087 e!367088)))

(declare-fun res!415332 () Bool)

(assert (=> b!641173 (=> (not res!415332) (not e!367088))))

(assert (=> b!641173 (= res!415332 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18764 a!2986)))))

(declare-fun b!641174 () Bool)

(assert (=> b!641174 (= e!367088 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!90521 (not res!415331)) b!641173))

(assert (= (and b!641173 res!415332) b!641174))

(assert (=> d!90521 m!614967))

(declare-fun m!615027 () Bool)

(assert (=> b!641174 m!615027))

(assert (=> b!641013 d!90521))

(declare-fun bm!33520 () Bool)

(declare-fun call!33523 () Bool)

(declare-fun c!73288 () Bool)

(assert (=> bm!33520 (= call!33523 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!73288 (Cons!12437 (select (arr!18400 a!2986) #b00000000000000000000000000000000) Nil!12438) Nil!12438)))))

(declare-fun b!641175 () Bool)

(declare-fun e!367089 () Bool)

(assert (=> b!641175 (= e!367089 call!33523)))

(declare-fun d!90523 () Bool)

(declare-fun res!415333 () Bool)

(declare-fun e!367090 () Bool)

(assert (=> d!90523 (=> res!415333 e!367090)))

(assert (=> d!90523 (= res!415333 (bvsge #b00000000000000000000000000000000 (size!18764 a!2986)))))

(assert (=> d!90523 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12438) e!367090)))

(declare-fun b!641176 () Bool)

(declare-fun e!367092 () Bool)

(assert (=> b!641176 (= e!367092 e!367089)))

(assert (=> b!641176 (= c!73288 (validKeyInArray!0 (select (arr!18400 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!641177 () Bool)

(assert (=> b!641177 (= e!367089 call!33523)))

(declare-fun b!641178 () Bool)

(assert (=> b!641178 (= e!367090 e!367092)))

(declare-fun res!415335 () Bool)

(assert (=> b!641178 (=> (not res!415335) (not e!367092))))

(declare-fun e!367091 () Bool)

(assert (=> b!641178 (= res!415335 (not e!367091))))

(declare-fun res!415334 () Bool)

(assert (=> b!641178 (=> (not res!415334) (not e!367091))))

(assert (=> b!641178 (= res!415334 (validKeyInArray!0 (select (arr!18400 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!641179 () Bool)

(assert (=> b!641179 (= e!367091 (contains!3127 Nil!12438 (select (arr!18400 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!90523 (not res!415333)) b!641178))

(assert (= (and b!641178 res!415334) b!641179))

(assert (= (and b!641178 res!415335) b!641176))

(assert (= (and b!641176 c!73288) b!641177))

(assert (= (and b!641176 (not c!73288)) b!641175))

(assert (= (or b!641177 b!641175) bm!33520))

(assert (=> bm!33520 m!614967))

(declare-fun m!615029 () Bool)

(assert (=> bm!33520 m!615029))

(assert (=> b!641176 m!614967))

(assert (=> b!641176 m!614967))

(assert (=> b!641176 m!614977))

(assert (=> b!641178 m!614967))

(assert (=> b!641178 m!614967))

(assert (=> b!641178 m!614977))

(assert (=> b!641179 m!614967))

(assert (=> b!641179 m!614967))

(declare-fun m!615031 () Bool)

(assert (=> b!641179 m!615031))

(assert (=> b!641023 d!90523))

(declare-fun b!641231 () Bool)

(declare-fun e!367128 () SeekEntryResult!6840)

(declare-fun e!367129 () SeekEntryResult!6840)

(assert (=> b!641231 (= e!367128 e!367129)))

(declare-fun lt!296873 () (_ BitVec 64))

(declare-fun lt!296874 () SeekEntryResult!6840)

(assert (=> b!641231 (= lt!296873 (select (arr!18400 a!2986) (index!29682 lt!296874)))))

(declare-fun c!73308 () Bool)

(assert (=> b!641231 (= c!73308 (= lt!296873 k0!1786))))

(declare-fun b!641232 () Bool)

(declare-fun e!367127 () SeekEntryResult!6840)

(assert (=> b!641232 (= e!367127 (MissingZero!6840 (index!29682 lt!296874)))))

(declare-fun b!641233 () Bool)

(declare-fun c!73307 () Bool)

(assert (=> b!641233 (= c!73307 (= lt!296873 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!641233 (= e!367129 e!367127)))

(declare-fun b!641234 () Bool)

(assert (=> b!641234 (= e!367127 (seekKeyOrZeroReturnVacant!0 (x!58436 lt!296874) (index!29682 lt!296874) (index!29682 lt!296874) k0!1786 a!2986 mask!3053))))

(declare-fun b!641235 () Bool)

(assert (=> b!641235 (= e!367128 Undefined!6840)))

(declare-fun d!90525 () Bool)

(declare-fun lt!296872 () SeekEntryResult!6840)

(assert (=> d!90525 (and (or ((_ is Undefined!6840) lt!296872) (not ((_ is Found!6840) lt!296872)) (and (bvsge (index!29681 lt!296872) #b00000000000000000000000000000000) (bvslt (index!29681 lt!296872) (size!18764 a!2986)))) (or ((_ is Undefined!6840) lt!296872) ((_ is Found!6840) lt!296872) (not ((_ is MissingZero!6840) lt!296872)) (and (bvsge (index!29680 lt!296872) #b00000000000000000000000000000000) (bvslt (index!29680 lt!296872) (size!18764 a!2986)))) (or ((_ is Undefined!6840) lt!296872) ((_ is Found!6840) lt!296872) ((_ is MissingZero!6840) lt!296872) (not ((_ is MissingVacant!6840) lt!296872)) (and (bvsge (index!29683 lt!296872) #b00000000000000000000000000000000) (bvslt (index!29683 lt!296872) (size!18764 a!2986)))) (or ((_ is Undefined!6840) lt!296872) (ite ((_ is Found!6840) lt!296872) (= (select (arr!18400 a!2986) (index!29681 lt!296872)) k0!1786) (ite ((_ is MissingZero!6840) lt!296872) (= (select (arr!18400 a!2986) (index!29680 lt!296872)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6840) lt!296872) (= (select (arr!18400 a!2986) (index!29683 lt!296872)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!90525 (= lt!296872 e!367128)))

(declare-fun c!73306 () Bool)

(assert (=> d!90525 (= c!73306 (and ((_ is Intermediate!6840) lt!296874) (undefined!7652 lt!296874)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38361 (_ BitVec 32)) SeekEntryResult!6840)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!90525 (= lt!296874 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!90525 (validMask!0 mask!3053)))

(assert (=> d!90525 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!296872)))

(declare-fun b!641236 () Bool)

(assert (=> b!641236 (= e!367129 (Found!6840 (index!29682 lt!296874)))))

(assert (= (and d!90525 c!73306) b!641235))

(assert (= (and d!90525 (not c!73306)) b!641231))

(assert (= (and b!641231 c!73308) b!641236))

(assert (= (and b!641231 (not c!73308)) b!641233))

(assert (= (and b!641233 c!73307) b!641232))

(assert (= (and b!641233 (not c!73307)) b!641234))

(declare-fun m!615069 () Bool)

(assert (=> b!641231 m!615069))

(declare-fun m!615071 () Bool)

(assert (=> b!641234 m!615071))

(declare-fun m!615073 () Bool)

(assert (=> d!90525 m!615073))

(declare-fun m!615075 () Bool)

(assert (=> d!90525 m!615075))

(declare-fun m!615077 () Bool)

(assert (=> d!90525 m!615077))

(declare-fun m!615079 () Bool)

(assert (=> d!90525 m!615079))

(assert (=> d!90525 m!615073))

(declare-fun m!615081 () Bool)

(assert (=> d!90525 m!615081))

(assert (=> d!90525 m!614891))

(assert (=> b!641006 d!90525))

(declare-fun d!90545 () Bool)

(declare-fun res!415355 () Bool)

(declare-fun e!367132 () Bool)

(assert (=> d!90545 (=> res!415355 e!367132)))

(assert (=> d!90545 (= res!415355 (= (select (arr!18400 lt!296780) index!984) (select (arr!18400 a!2986) j!136)))))

(assert (=> d!90545 (= (arrayContainsKey!0 lt!296780 (select (arr!18400 a!2986) j!136) index!984) e!367132)))

(declare-fun b!641239 () Bool)

(declare-fun e!367133 () Bool)

(assert (=> b!641239 (= e!367132 e!367133)))

(declare-fun res!415356 () Bool)

(assert (=> b!641239 (=> (not res!415356) (not e!367133))))

(assert (=> b!641239 (= res!415356 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18764 lt!296780)))))

(declare-fun b!641240 () Bool)

(assert (=> b!641240 (= e!367133 (arrayContainsKey!0 lt!296780 (select (arr!18400 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!90545 (not res!415355)) b!641239))

(assert (= (and b!641239 res!415356) b!641240))

(declare-fun m!615085 () Bool)

(assert (=> d!90545 m!615085))

(assert (=> b!641240 m!614843))

(declare-fun m!615087 () Bool)

(assert (=> b!641240 m!615087))

(assert (=> b!641005 d!90545))

(declare-fun d!90549 () Bool)

(declare-fun e!367145 () Bool)

(assert (=> d!90549 e!367145))

(declare-fun res!415362 () Bool)

(assert (=> d!90549 (=> (not res!415362) (not e!367145))))

(assert (=> d!90549 (= res!415362 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18764 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18764 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18764 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18764 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18764 a!2986))))))

(declare-fun lt!296887 () Unit!21694)

(declare-fun choose!9 (array!38361 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21694)

(assert (=> d!90549 (= lt!296887 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!296777 vacantSpotIndex!68 mask!3053))))

(assert (=> d!90549 (validMask!0 mask!3053)))

(assert (=> d!90549 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!296777 vacantSpotIndex!68 mask!3053) lt!296887)))

(declare-fun b!641258 () Bool)

(assert (=> b!641258 (= e!367145 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296777 vacantSpotIndex!68 (select (arr!18400 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296777 vacantSpotIndex!68 (select (store (arr!18400 a!2986) i!1108 k0!1786) j!136) (array!38362 (store (arr!18400 a!2986) i!1108 k0!1786) (size!18764 a!2986)) mask!3053)))))

(assert (= (and d!90549 res!415362) b!641258))

(declare-fun m!615090 () Bool)

(assert (=> d!90549 m!615090))

(assert (=> d!90549 m!614891))

(assert (=> b!641258 m!614879))

(assert (=> b!641258 m!614843))

(assert (=> b!641258 m!614885))

(assert (=> b!641258 m!614879))

(declare-fun m!615095 () Bool)

(assert (=> b!641258 m!615095))

(assert (=> b!641258 m!614883))

(assert (=> b!641258 m!614843))

(assert (=> b!641015 d!90549))

(declare-fun d!90553 () Bool)

(declare-fun lt!296888 () SeekEntryResult!6840)

(assert (=> d!90553 (and (or ((_ is Undefined!6840) lt!296888) (not ((_ is Found!6840) lt!296888)) (and (bvsge (index!29681 lt!296888) #b00000000000000000000000000000000) (bvslt (index!29681 lt!296888) (size!18764 lt!296780)))) (or ((_ is Undefined!6840) lt!296888) ((_ is Found!6840) lt!296888) (not ((_ is MissingVacant!6840) lt!296888)) (not (= (index!29683 lt!296888) vacantSpotIndex!68)) (and (bvsge (index!29683 lt!296888) #b00000000000000000000000000000000) (bvslt (index!29683 lt!296888) (size!18764 lt!296780)))) (or ((_ is Undefined!6840) lt!296888) (ite ((_ is Found!6840) lt!296888) (= (select (arr!18400 lt!296780) (index!29681 lt!296888)) lt!296784) (and ((_ is MissingVacant!6840) lt!296888) (= (index!29683 lt!296888) vacantSpotIndex!68) (= (select (arr!18400 lt!296780) (index!29683 lt!296888)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!367146 () SeekEntryResult!6840)

(assert (=> d!90553 (= lt!296888 e!367146)))

(declare-fun c!73317 () Bool)

(assert (=> d!90553 (= c!73317 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!296889 () (_ BitVec 64))

(assert (=> d!90553 (= lt!296889 (select (arr!18400 lt!296780) lt!296777))))

(assert (=> d!90553 (validMask!0 mask!3053)))

(assert (=> d!90553 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296777 vacantSpotIndex!68 lt!296784 lt!296780 mask!3053) lt!296888)))

(declare-fun b!641259 () Bool)

(declare-fun e!367148 () SeekEntryResult!6840)

(assert (=> b!641259 (= e!367146 e!367148)))

(declare-fun c!73315 () Bool)

(assert (=> b!641259 (= c!73315 (= lt!296889 lt!296784))))

(declare-fun b!641260 () Bool)

(declare-fun e!367147 () SeekEntryResult!6840)

(assert (=> b!641260 (= e!367147 (MissingVacant!6840 vacantSpotIndex!68))))

(declare-fun b!641261 () Bool)

(assert (=> b!641261 (= e!367147 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!296777 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!296784 lt!296780 mask!3053))))

(declare-fun b!641262 () Bool)

(assert (=> b!641262 (= e!367146 Undefined!6840)))

(declare-fun b!641263 () Bool)

(assert (=> b!641263 (= e!367148 (Found!6840 lt!296777))))

(declare-fun b!641264 () Bool)

(declare-fun c!73316 () Bool)

(assert (=> b!641264 (= c!73316 (= lt!296889 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!641264 (= e!367148 e!367147)))

(assert (= (and d!90553 c!73317) b!641262))

(assert (= (and d!90553 (not c!73317)) b!641259))

(assert (= (and b!641259 c!73315) b!641263))

(assert (= (and b!641259 (not c!73315)) b!641264))

(assert (= (and b!641264 c!73316) b!641260))

(assert (= (and b!641264 (not c!73316)) b!641261))

(declare-fun m!615097 () Bool)

(assert (=> d!90553 m!615097))

(declare-fun m!615099 () Bool)

(assert (=> d!90553 m!615099))

(declare-fun m!615101 () Bool)

(assert (=> d!90553 m!615101))

(assert (=> d!90553 m!614891))

(declare-fun m!615103 () Bool)

(assert (=> b!641261 m!615103))

(assert (=> b!641261 m!615103))

(declare-fun m!615105 () Bool)

(assert (=> b!641261 m!615105))

(assert (=> b!641015 d!90553))

(declare-fun d!90555 () Bool)

(declare-fun lt!296900 () (_ BitVec 32))

(assert (=> d!90555 (and (bvsge lt!296900 #b00000000000000000000000000000000) (bvslt lt!296900 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!90555 (= lt!296900 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!90555 (validMask!0 mask!3053)))

(assert (=> d!90555 (= (nextIndex!0 index!984 x!910 mask!3053) lt!296900)))

(declare-fun bs!19200 () Bool)

(assert (= bs!19200 d!90555))

(declare-fun m!615123 () Bool)

(assert (=> bs!19200 m!615123))

(assert (=> bs!19200 m!614891))

(assert (=> b!641015 d!90555))

(declare-fun d!90561 () Bool)

(declare-fun lt!296901 () SeekEntryResult!6840)

(assert (=> d!90561 (and (or ((_ is Undefined!6840) lt!296901) (not ((_ is Found!6840) lt!296901)) (and (bvsge (index!29681 lt!296901) #b00000000000000000000000000000000) (bvslt (index!29681 lt!296901) (size!18764 lt!296780)))) (or ((_ is Undefined!6840) lt!296901) ((_ is Found!6840) lt!296901) (not ((_ is MissingVacant!6840) lt!296901)) (not (= (index!29683 lt!296901) vacantSpotIndex!68)) (and (bvsge (index!29683 lt!296901) #b00000000000000000000000000000000) (bvslt (index!29683 lt!296901) (size!18764 lt!296780)))) (or ((_ is Undefined!6840) lt!296901) (ite ((_ is Found!6840) lt!296901) (= (select (arr!18400 lt!296780) (index!29681 lt!296901)) lt!296784) (and ((_ is MissingVacant!6840) lt!296901) (= (index!29683 lt!296901) vacantSpotIndex!68) (= (select (arr!18400 lt!296780) (index!29683 lt!296901)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!367155 () SeekEntryResult!6840)

(assert (=> d!90561 (= lt!296901 e!367155)))

(declare-fun c!73326 () Bool)

(assert (=> d!90561 (= c!73326 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!296902 () (_ BitVec 64))

(assert (=> d!90561 (= lt!296902 (select (arr!18400 lt!296780) index!984))))

(assert (=> d!90561 (validMask!0 mask!3053)))

(assert (=> d!90561 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!296784 lt!296780 mask!3053) lt!296901)))

(declare-fun b!641277 () Bool)

(declare-fun e!367157 () SeekEntryResult!6840)

(assert (=> b!641277 (= e!367155 e!367157)))

(declare-fun c!73324 () Bool)

(assert (=> b!641277 (= c!73324 (= lt!296902 lt!296784))))

(declare-fun b!641278 () Bool)

(declare-fun e!367156 () SeekEntryResult!6840)

(assert (=> b!641278 (= e!367156 (MissingVacant!6840 vacantSpotIndex!68))))

(declare-fun b!641279 () Bool)

(assert (=> b!641279 (= e!367156 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!296784 lt!296780 mask!3053))))

(declare-fun b!641280 () Bool)

(assert (=> b!641280 (= e!367155 Undefined!6840)))

(declare-fun b!641281 () Bool)

(assert (=> b!641281 (= e!367157 (Found!6840 index!984))))

(declare-fun b!641282 () Bool)

(declare-fun c!73325 () Bool)

(assert (=> b!641282 (= c!73325 (= lt!296902 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!641282 (= e!367157 e!367156)))

(assert (= (and d!90561 c!73326) b!641280))

(assert (= (and d!90561 (not c!73326)) b!641277))

(assert (= (and b!641277 c!73324) b!641281))

(assert (= (and b!641277 (not c!73324)) b!641282))

(assert (= (and b!641282 c!73325) b!641278))

(assert (= (and b!641282 (not c!73325)) b!641279))

(declare-fun m!615135 () Bool)

(assert (=> d!90561 m!615135))

(declare-fun m!615137 () Bool)

(assert (=> d!90561 m!615137))

(assert (=> d!90561 m!615085))

(assert (=> d!90561 m!614891))

(assert (=> b!641279 m!614877))

(assert (=> b!641279 m!614877))

(declare-fun m!615139 () Bool)

(assert (=> b!641279 m!615139))

(assert (=> b!641015 d!90561))

(declare-fun lt!296905 () SeekEntryResult!6840)

(declare-fun d!90565 () Bool)

(assert (=> d!90565 (and (or ((_ is Undefined!6840) lt!296905) (not ((_ is Found!6840) lt!296905)) (and (bvsge (index!29681 lt!296905) #b00000000000000000000000000000000) (bvslt (index!29681 lt!296905) (size!18764 a!2986)))) (or ((_ is Undefined!6840) lt!296905) ((_ is Found!6840) lt!296905) (not ((_ is MissingVacant!6840) lt!296905)) (not (= (index!29683 lt!296905) vacantSpotIndex!68)) (and (bvsge (index!29683 lt!296905) #b00000000000000000000000000000000) (bvslt (index!29683 lt!296905) (size!18764 a!2986)))) (or ((_ is Undefined!6840) lt!296905) (ite ((_ is Found!6840) lt!296905) (= (select (arr!18400 a!2986) (index!29681 lt!296905)) (select (arr!18400 a!2986) j!136)) (and ((_ is MissingVacant!6840) lt!296905) (= (index!29683 lt!296905) vacantSpotIndex!68) (= (select (arr!18400 a!2986) (index!29683 lt!296905)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!367161 () SeekEntryResult!6840)

(assert (=> d!90565 (= lt!296905 e!367161)))

(declare-fun c!73332 () Bool)

(assert (=> d!90565 (= c!73332 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!296906 () (_ BitVec 64))

(assert (=> d!90565 (= lt!296906 (select (arr!18400 a!2986) lt!296777))))

(assert (=> d!90565 (validMask!0 mask!3053)))

(assert (=> d!90565 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296777 vacantSpotIndex!68 (select (arr!18400 a!2986) j!136) a!2986 mask!3053) lt!296905)))

(declare-fun b!641289 () Bool)

(declare-fun e!367163 () SeekEntryResult!6840)

(assert (=> b!641289 (= e!367161 e!367163)))

(declare-fun c!73330 () Bool)

(assert (=> b!641289 (= c!73330 (= lt!296906 (select (arr!18400 a!2986) j!136)))))

(declare-fun b!641290 () Bool)

(declare-fun e!367162 () SeekEntryResult!6840)

(assert (=> b!641290 (= e!367162 (MissingVacant!6840 vacantSpotIndex!68))))

(declare-fun b!641291 () Bool)

(assert (=> b!641291 (= e!367162 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!296777 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18400 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!641292 () Bool)

(assert (=> b!641292 (= e!367161 Undefined!6840)))

(declare-fun b!641293 () Bool)

(assert (=> b!641293 (= e!367163 (Found!6840 lt!296777))))

(declare-fun b!641294 () Bool)

(declare-fun c!73331 () Bool)

(assert (=> b!641294 (= c!73331 (= lt!296906 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!641294 (= e!367163 e!367162)))

(assert (= (and d!90565 c!73332) b!641292))

(assert (= (and d!90565 (not c!73332)) b!641289))

(assert (= (and b!641289 c!73330) b!641293))

(assert (= (and b!641289 (not c!73330)) b!641294))

(assert (= (and b!641294 c!73331) b!641290))

(assert (= (and b!641294 (not c!73331)) b!641291))

(declare-fun m!615149 () Bool)

(assert (=> d!90565 m!615149))

(declare-fun m!615151 () Bool)

(assert (=> d!90565 m!615151))

(declare-fun m!615153 () Bool)

(assert (=> d!90565 m!615153))

(assert (=> d!90565 m!614891))

(assert (=> b!641291 m!615103))

(assert (=> b!641291 m!615103))

(assert (=> b!641291 m!614843))

(declare-fun m!615155 () Bool)

(assert (=> b!641291 m!615155))

(assert (=> b!641015 d!90565))

(check-sat (not d!90565) (not b!641118) (not b!641164) (not b!641133) (not d!90493) (not b!641119) (not d!90525) (not d!90549) (not b!641127) (not b!641176) (not b!641090) (not b!641104) (not b!641291) (not b!641101) (not b!641258) (not b!641234) (not bm!33516) (not b!641240) (not bm!33512) (not b!641261) (not bm!33515) (not d!90561) (not b!641121) (not d!90555) (not b!641132) (not b!641178) (not d!90553) (not b!641116) (not b!641123) (not b!641279) (not bm!33520) (not b!641102) (not d!90489) (not b!641124) (not b!641179) (not d!90503) (not d!90499) (not b!641174))
(check-sat)
