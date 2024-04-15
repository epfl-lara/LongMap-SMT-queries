; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55230 () Bool)

(assert start!55230)

(declare-fun b!604851 () Bool)

(declare-datatypes ((Unit!19242 0))(
  ( (Unit!19243) )
))
(declare-fun e!346144 () Unit!19242)

(declare-fun Unit!19244 () Unit!19242)

(assert (=> b!604851 (= e!346144 Unit!19244)))

(declare-fun lt!275829 () Unit!19242)

(declare-datatypes ((array!37236 0))(
  ( (array!37237 (arr!17873 (Array (_ BitVec 32) (_ BitVec 64))) (size!18238 (_ BitVec 32))) )
))
(declare-fun lt!275816 () array!37236)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37236)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37236 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19242)

(assert (=> b!604851 (= lt!275829 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!275816 (select (arr!17873 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun arrayContainsKey!0 (array!37236 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!604851 (arrayContainsKey!0 lt!275816 (select (arr!17873 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!275818 () Unit!19242)

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((List!11953 0))(
  ( (Nil!11950) (Cons!11949 (h!12994 (_ BitVec 64)) (t!18172 List!11953)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37236 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11953) Unit!19242)

(assert (=> b!604851 (= lt!275818 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11950))))

(declare-fun arrayNoDuplicates!0 (array!37236 (_ BitVec 32) List!11953) Bool)

(assert (=> b!604851 (arrayNoDuplicates!0 lt!275816 #b00000000000000000000000000000000 Nil!11950)))

(declare-fun lt!275826 () Unit!19242)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37236 (_ BitVec 32) (_ BitVec 32)) Unit!19242)

(assert (=> b!604851 (= lt!275826 (lemmaNoDuplicateFromThenFromBigger!0 lt!275816 #b00000000000000000000000000000000 j!136))))

(assert (=> b!604851 (arrayNoDuplicates!0 lt!275816 j!136 Nil!11950)))

(declare-fun lt!275823 () Unit!19242)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37236 (_ BitVec 64) (_ BitVec 32) List!11953) Unit!19242)

(assert (=> b!604851 (= lt!275823 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!275816 (select (arr!17873 a!2986) j!136) j!136 Nil!11950))))

(assert (=> b!604851 false))

(declare-fun b!604852 () Bool)

(declare-fun e!346140 () Unit!19242)

(declare-fun Unit!19245 () Unit!19242)

(assert (=> b!604852 (= e!346140 Unit!19245)))

(assert (=> b!604852 false))

(declare-fun b!604853 () Bool)

(declare-fun e!346148 () Bool)

(declare-datatypes ((SeekEntryResult!6310 0))(
  ( (MissingZero!6310 (index!27506 (_ BitVec 32))) (Found!6310 (index!27507 (_ BitVec 32))) (Intermediate!6310 (undefined!7122 Bool) (index!27508 (_ BitVec 32)) (x!56315 (_ BitVec 32))) (Undefined!6310) (MissingVacant!6310 (index!27509 (_ BitVec 32))) )
))
(declare-fun lt!275824 () SeekEntryResult!6310)

(declare-fun lt!275821 () SeekEntryResult!6310)

(assert (=> b!604853 (= e!346148 (= lt!275824 lt!275821))))

(declare-fun b!604854 () Bool)

(declare-fun e!346136 () Bool)

(declare-fun e!346138 () Bool)

(assert (=> b!604854 (= e!346136 e!346138)))

(declare-fun res!388661 () Bool)

(assert (=> b!604854 (=> res!388661 e!346138)))

(assert (=> b!604854 (= res!388661 (bvsge index!984 j!136))))

(declare-fun lt!275822 () Unit!19242)

(assert (=> b!604854 (= lt!275822 e!346144)))

(declare-fun c!68472 () Bool)

(assert (=> b!604854 (= c!68472 (bvslt j!136 index!984))))

(declare-fun b!604855 () Bool)

(declare-fun res!388655 () Bool)

(declare-fun e!346142 () Bool)

(assert (=> b!604855 (=> (not res!388655) (not e!346142))))

(assert (=> b!604855 (= res!388655 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11950))))

(declare-fun b!604856 () Bool)

(declare-fun e!346141 () Bool)

(assert (=> b!604856 (= e!346142 e!346141)))

(declare-fun res!388651 () Bool)

(assert (=> b!604856 (=> (not res!388651) (not e!346141))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!604856 (= res!388651 (= (select (store (arr!17873 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!604856 (= lt!275816 (array!37237 (store (arr!17873 a!2986) i!1108 k0!1786) (size!18238 a!2986)))))

(declare-fun b!604857 () Bool)

(declare-fun res!388659 () Bool)

(declare-fun e!346139 () Bool)

(assert (=> b!604857 (=> (not res!388659) (not e!346139))))

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!604857 (= res!388659 (and (= (size!18238 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18238 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18238 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!604858 () Bool)

(declare-fun res!388643 () Bool)

(assert (=> b!604858 (=> (not res!388643) (not e!346139))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!604858 (= res!388643 (validKeyInArray!0 (select (arr!17873 a!2986) j!136)))))

(declare-fun res!388654 () Bool)

(assert (=> start!55230 (=> (not res!388654) (not e!346139))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55230 (= res!388654 (validMask!0 mask!3053))))

(assert (=> start!55230 e!346139))

(assert (=> start!55230 true))

(declare-fun array_inv!13756 (array!37236) Bool)

(assert (=> start!55230 (array_inv!13756 a!2986)))

(declare-fun b!604859 () Bool)

(declare-fun res!388653 () Bool)

(assert (=> b!604859 (=> (not res!388653) (not e!346139))))

(assert (=> b!604859 (= res!388653 (validKeyInArray!0 k0!1786))))

(declare-fun b!604860 () Bool)

(declare-fun res!388652 () Bool)

(assert (=> b!604860 (=> (not res!388652) (not e!346139))))

(assert (=> b!604860 (= res!388652 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!604861 () Bool)

(declare-fun e!346145 () Bool)

(assert (=> b!604861 (= e!346145 e!346136)))

(declare-fun res!388658 () Bool)

(assert (=> b!604861 (=> res!388658 e!346136)))

(declare-fun lt!275819 () (_ BitVec 64))

(declare-fun lt!275828 () (_ BitVec 64))

(assert (=> b!604861 (= res!388658 (or (not (= (select (arr!17873 a!2986) j!136) lt!275828)) (not (= (select (arr!17873 a!2986) j!136) lt!275819))))))

(declare-fun e!346147 () Bool)

(assert (=> b!604861 e!346147))

(declare-fun res!388646 () Bool)

(assert (=> b!604861 (=> (not res!388646) (not e!346147))))

(assert (=> b!604861 (= res!388646 (= lt!275819 (select (arr!17873 a!2986) j!136)))))

(assert (=> b!604861 (= lt!275819 (select (store (arr!17873 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!604862 () Bool)

(declare-fun res!388650 () Bool)

(assert (=> b!604862 (=> (not res!388650) (not e!346142))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!604862 (= res!388650 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17873 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!604863 () Bool)

(declare-fun Unit!19246 () Unit!19242)

(assert (=> b!604863 (= e!346140 Unit!19246)))

(declare-fun b!604864 () Bool)

(declare-fun e!346135 () Bool)

(declare-fun e!346137 () Bool)

(assert (=> b!604864 (= e!346135 e!346137)))

(declare-fun res!388645 () Bool)

(assert (=> b!604864 (=> (not res!388645) (not e!346137))))

(assert (=> b!604864 (= res!388645 (arrayContainsKey!0 lt!275816 (select (arr!17873 a!2986) j!136) j!136))))

(declare-fun b!604865 () Bool)

(assert (=> b!604865 (= e!346138 (bvsle #b00000000000000000000000000000000 (size!18238 a!2986)))))

(assert (=> b!604865 (arrayContainsKey!0 lt!275816 (select (arr!17873 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!275825 () Unit!19242)

(assert (=> b!604865 (= lt!275825 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!275816 (select (arr!17873 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!346143 () Bool)

(assert (=> b!604865 e!346143))

(declare-fun res!388656 () Bool)

(assert (=> b!604865 (=> (not res!388656) (not e!346143))))

(assert (=> b!604865 (= res!388656 (arrayContainsKey!0 lt!275816 (select (arr!17873 a!2986) j!136) j!136))))

(declare-fun b!604866 () Bool)

(declare-fun e!346146 () Bool)

(assert (=> b!604866 (= e!346146 (not e!346145))))

(declare-fun res!388644 () Bool)

(assert (=> b!604866 (=> res!388644 e!346145)))

(declare-fun lt!275817 () SeekEntryResult!6310)

(assert (=> b!604866 (= res!388644 (not (= lt!275817 (Found!6310 index!984))))))

(declare-fun lt!275820 () Unit!19242)

(assert (=> b!604866 (= lt!275820 e!346140)))

(declare-fun c!68471 () Bool)

(assert (=> b!604866 (= c!68471 (= lt!275817 Undefined!6310))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37236 (_ BitVec 32)) SeekEntryResult!6310)

(assert (=> b!604866 (= lt!275817 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!275828 lt!275816 mask!3053))))

(assert (=> b!604866 e!346148))

(declare-fun res!388648 () Bool)

(assert (=> b!604866 (=> (not res!388648) (not e!346148))))

(declare-fun lt!275815 () (_ BitVec 32))

(assert (=> b!604866 (= res!388648 (= lt!275821 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275815 vacantSpotIndex!68 lt!275828 lt!275816 mask!3053)))))

(assert (=> b!604866 (= lt!275821 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275815 vacantSpotIndex!68 (select (arr!17873 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!604866 (= lt!275828 (select (store (arr!17873 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!275827 () Unit!19242)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37236 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19242)

(assert (=> b!604866 (= lt!275827 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!275815 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!604866 (= lt!275815 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!604867 () Bool)

(assert (=> b!604867 (= e!346137 (arrayContainsKey!0 lt!275816 (select (arr!17873 a!2986) j!136) index!984))))

(declare-fun b!604868 () Bool)

(declare-fun Unit!19247 () Unit!19242)

(assert (=> b!604868 (= e!346144 Unit!19247)))

(declare-fun b!604869 () Bool)

(assert (=> b!604869 (= e!346141 e!346146)))

(declare-fun res!388647 () Bool)

(assert (=> b!604869 (=> (not res!388647) (not e!346146))))

(assert (=> b!604869 (= res!388647 (and (= lt!275824 (Found!6310 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17873 a!2986) index!984) (select (arr!17873 a!2986) j!136))) (not (= (select (arr!17873 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!604869 (= lt!275824 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17873 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!604870 () Bool)

(assert (=> b!604870 (= e!346143 (arrayContainsKey!0 lt!275816 (select (arr!17873 a!2986) j!136) index!984))))

(declare-fun b!604871 () Bool)

(assert (=> b!604871 (= e!346139 e!346142)))

(declare-fun res!388657 () Bool)

(assert (=> b!604871 (=> (not res!388657) (not e!346142))))

(declare-fun lt!275830 () SeekEntryResult!6310)

(assert (=> b!604871 (= res!388657 (or (= lt!275830 (MissingZero!6310 i!1108)) (= lt!275830 (MissingVacant!6310 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37236 (_ BitVec 32)) SeekEntryResult!6310)

(assert (=> b!604871 (= lt!275830 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!604872 () Bool)

(assert (=> b!604872 (= e!346147 e!346135)))

(declare-fun res!388660 () Bool)

(assert (=> b!604872 (=> res!388660 e!346135)))

(assert (=> b!604872 (= res!388660 (or (not (= (select (arr!17873 a!2986) j!136) lt!275828)) (not (= (select (arr!17873 a!2986) j!136) lt!275819)) (bvsge j!136 index!984)))))

(declare-fun b!604873 () Bool)

(declare-fun res!388649 () Bool)

(assert (=> b!604873 (=> (not res!388649) (not e!346142))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37236 (_ BitVec 32)) Bool)

(assert (=> b!604873 (= res!388649 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!55230 res!388654) b!604857))

(assert (= (and b!604857 res!388659) b!604858))

(assert (= (and b!604858 res!388643) b!604859))

(assert (= (and b!604859 res!388653) b!604860))

(assert (= (and b!604860 res!388652) b!604871))

(assert (= (and b!604871 res!388657) b!604873))

(assert (= (and b!604873 res!388649) b!604855))

(assert (= (and b!604855 res!388655) b!604862))

(assert (= (and b!604862 res!388650) b!604856))

(assert (= (and b!604856 res!388651) b!604869))

(assert (= (and b!604869 res!388647) b!604866))

(assert (= (and b!604866 res!388648) b!604853))

(assert (= (and b!604866 c!68471) b!604852))

(assert (= (and b!604866 (not c!68471)) b!604863))

(assert (= (and b!604866 (not res!388644)) b!604861))

(assert (= (and b!604861 res!388646) b!604872))

(assert (= (and b!604872 (not res!388660)) b!604864))

(assert (= (and b!604864 res!388645) b!604867))

(assert (= (and b!604861 (not res!388658)) b!604854))

(assert (= (and b!604854 c!68472) b!604851))

(assert (= (and b!604854 (not c!68472)) b!604868))

(assert (= (and b!604854 (not res!388661)) b!604865))

(assert (= (and b!604865 res!388656) b!604870))

(declare-fun m!581227 () Bool)

(assert (=> b!604869 m!581227))

(declare-fun m!581229 () Bool)

(assert (=> b!604869 m!581229))

(assert (=> b!604869 m!581229))

(declare-fun m!581231 () Bool)

(assert (=> b!604869 m!581231))

(declare-fun m!581233 () Bool)

(assert (=> b!604860 m!581233))

(declare-fun m!581235 () Bool)

(assert (=> start!55230 m!581235))

(declare-fun m!581237 () Bool)

(assert (=> start!55230 m!581237))

(declare-fun m!581239 () Bool)

(assert (=> b!604859 m!581239))

(declare-fun m!581241 () Bool)

(assert (=> b!604873 m!581241))

(declare-fun m!581243 () Bool)

(assert (=> b!604855 m!581243))

(assert (=> b!604861 m!581229))

(declare-fun m!581245 () Bool)

(assert (=> b!604861 m!581245))

(declare-fun m!581247 () Bool)

(assert (=> b!604861 m!581247))

(assert (=> b!604856 m!581245))

(declare-fun m!581249 () Bool)

(assert (=> b!604856 m!581249))

(declare-fun m!581251 () Bool)

(assert (=> b!604862 m!581251))

(assert (=> b!604858 m!581229))

(assert (=> b!604858 m!581229))

(declare-fun m!581253 () Bool)

(assert (=> b!604858 m!581253))

(assert (=> b!604867 m!581229))

(assert (=> b!604867 m!581229))

(declare-fun m!581255 () Bool)

(assert (=> b!604867 m!581255))

(declare-fun m!581257 () Bool)

(assert (=> b!604866 m!581257))

(declare-fun m!581259 () Bool)

(assert (=> b!604866 m!581259))

(assert (=> b!604866 m!581229))

(assert (=> b!604866 m!581245))

(declare-fun m!581261 () Bool)

(assert (=> b!604866 m!581261))

(declare-fun m!581263 () Bool)

(assert (=> b!604866 m!581263))

(assert (=> b!604866 m!581229))

(declare-fun m!581265 () Bool)

(assert (=> b!604866 m!581265))

(declare-fun m!581267 () Bool)

(assert (=> b!604866 m!581267))

(declare-fun m!581269 () Bool)

(assert (=> b!604871 m!581269))

(assert (=> b!604872 m!581229))

(assert (=> b!604851 m!581229))

(declare-fun m!581271 () Bool)

(assert (=> b!604851 m!581271))

(declare-fun m!581273 () Bool)

(assert (=> b!604851 m!581273))

(assert (=> b!604851 m!581229))

(assert (=> b!604851 m!581229))

(declare-fun m!581275 () Bool)

(assert (=> b!604851 m!581275))

(declare-fun m!581277 () Bool)

(assert (=> b!604851 m!581277))

(declare-fun m!581279 () Bool)

(assert (=> b!604851 m!581279))

(assert (=> b!604851 m!581229))

(declare-fun m!581281 () Bool)

(assert (=> b!604851 m!581281))

(declare-fun m!581283 () Bool)

(assert (=> b!604851 m!581283))

(assert (=> b!604865 m!581229))

(assert (=> b!604865 m!581229))

(declare-fun m!581285 () Bool)

(assert (=> b!604865 m!581285))

(assert (=> b!604865 m!581229))

(declare-fun m!581287 () Bool)

(assert (=> b!604865 m!581287))

(assert (=> b!604865 m!581229))

(declare-fun m!581289 () Bool)

(assert (=> b!604865 m!581289))

(assert (=> b!604864 m!581229))

(assert (=> b!604864 m!581229))

(assert (=> b!604864 m!581289))

(assert (=> b!604870 m!581229))

(assert (=> b!604870 m!581229))

(assert (=> b!604870 m!581255))

(check-sat (not b!604851) (not b!604869) (not b!604858) (not b!604860) (not b!604873) (not b!604866) (not b!604855) (not b!604870) (not b!604865) (not b!604871) (not b!604859) (not b!604867) (not b!604864) (not start!55230))
(check-sat)
