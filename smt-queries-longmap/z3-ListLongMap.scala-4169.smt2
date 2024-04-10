; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56758 () Bool)

(assert start!56758)

(declare-fun b!628980 () Bool)

(declare-fun e!359765 () Bool)

(declare-fun e!359762 () Bool)

(assert (=> b!628980 (= e!359765 e!359762)))

(declare-fun res!406543 () Bool)

(assert (=> b!628980 (=> (not res!406543) (not e!359762))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6678 0))(
  ( (MissingZero!6678 (index!28996 (_ BitVec 32))) (Found!6678 (index!28997 (_ BitVec 32))) (Intermediate!6678 (undefined!7490 Bool) (index!28998 (_ BitVec 32)) (x!57728 (_ BitVec 32))) (Undefined!6678) (MissingVacant!6678 (index!28999 (_ BitVec 32))) )
))
(declare-fun lt!290608 () SeekEntryResult!6678)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37999 0))(
  ( (array!38000 (arr!18238 (Array (_ BitVec 32) (_ BitVec 64))) (size!18602 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37999)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37999 (_ BitVec 32)) SeekEntryResult!6678)

(assert (=> b!628980 (= res!406543 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18238 a!2986) j!136) a!2986 mask!3053) lt!290608))))

(assert (=> b!628980 (= lt!290608 (Found!6678 j!136))))

(declare-fun b!628981 () Bool)

(declare-fun res!406545 () Bool)

(assert (=> b!628981 (=> (not res!406545) (not e!359765))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37999 (_ BitVec 32)) Bool)

(assert (=> b!628981 (= res!406545 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun e!359763 () Bool)

(declare-fun lt!290606 () (_ BitVec 32))

(declare-fun b!628982 () Bool)

(assert (=> b!628982 (= e!359763 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290606 vacantSpotIndex!68 (select (arr!18238 a!2986) j!136) a!2986 mask!3053) lt!290608)))))

(declare-fun b!628983 () Bool)

(declare-fun res!406537 () Bool)

(assert (=> b!628983 (=> (not res!406537) (not e!359765))))

(declare-datatypes ((List!12279 0))(
  ( (Nil!12276) (Cons!12275 (h!13320 (_ BitVec 64)) (t!18507 List!12279)) )
))
(declare-fun arrayNoDuplicates!0 (array!37999 (_ BitVec 32) List!12279) Bool)

(assert (=> b!628983 (= res!406537 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12276))))

(declare-fun b!628984 () Bool)

(declare-fun res!406539 () Bool)

(declare-fun e!359764 () Bool)

(assert (=> b!628984 (=> (not res!406539) (not e!359764))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37999 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!628984 (= res!406539 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!628985 () Bool)

(assert (=> b!628985 (= e!359762 e!359763)))

(declare-fun res!406540 () Bool)

(assert (=> b!628985 (=> (not res!406540) (not e!359763))))

(assert (=> b!628985 (= res!406540 (and (bvsge lt!290606 #b00000000000000000000000000000000) (bvslt lt!290606 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!628985 (= lt!290606 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!406538 () Bool)

(assert (=> start!56758 (=> (not res!406538) (not e!359764))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56758 (= res!406538 (validMask!0 mask!3053))))

(assert (=> start!56758 e!359764))

(assert (=> start!56758 true))

(declare-fun array_inv!14034 (array!37999) Bool)

(assert (=> start!56758 (array_inv!14034 a!2986)))

(declare-fun b!628986 () Bool)

(declare-fun res!406546 () Bool)

(assert (=> b!628986 (=> (not res!406546) (not e!359762))))

(assert (=> b!628986 (= res!406546 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18238 a!2986) index!984) (select (arr!18238 a!2986) j!136))) (not (= (select (arr!18238 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!628987 () Bool)

(declare-fun res!406542 () Bool)

(assert (=> b!628987 (=> (not res!406542) (not e!359764))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!628987 (= res!406542 (validKeyInArray!0 (select (arr!18238 a!2986) j!136)))))

(declare-fun b!628988 () Bool)

(declare-fun res!406536 () Bool)

(assert (=> b!628988 (=> (not res!406536) (not e!359764))))

(assert (=> b!628988 (= res!406536 (validKeyInArray!0 k0!1786))))

(declare-fun b!628989 () Bool)

(assert (=> b!628989 (= e!359764 e!359765)))

(declare-fun res!406541 () Bool)

(assert (=> b!628989 (=> (not res!406541) (not e!359765))))

(declare-fun lt!290607 () SeekEntryResult!6678)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!628989 (= res!406541 (or (= lt!290607 (MissingZero!6678 i!1108)) (= lt!290607 (MissingVacant!6678 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37999 (_ BitVec 32)) SeekEntryResult!6678)

(assert (=> b!628989 (= lt!290607 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!628990 () Bool)

(declare-fun res!406544 () Bool)

(assert (=> b!628990 (=> (not res!406544) (not e!359765))))

(assert (=> b!628990 (= res!406544 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18238 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18238 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!628991 () Bool)

(declare-fun res!406547 () Bool)

(assert (=> b!628991 (=> (not res!406547) (not e!359764))))

(assert (=> b!628991 (= res!406547 (and (= (size!18602 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18602 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18602 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!56758 res!406538) b!628991))

(assert (= (and b!628991 res!406547) b!628987))

(assert (= (and b!628987 res!406542) b!628988))

(assert (= (and b!628988 res!406536) b!628984))

(assert (= (and b!628984 res!406539) b!628989))

(assert (= (and b!628989 res!406541) b!628981))

(assert (= (and b!628981 res!406545) b!628983))

(assert (= (and b!628983 res!406537) b!628990))

(assert (= (and b!628990 res!406544) b!628980))

(assert (= (and b!628980 res!406543) b!628986))

(assert (= (and b!628986 res!406546) b!628985))

(assert (= (and b!628985 res!406540) b!628982))

(declare-fun m!604079 () Bool)

(assert (=> b!628987 m!604079))

(assert (=> b!628987 m!604079))

(declare-fun m!604081 () Bool)

(assert (=> b!628987 m!604081))

(declare-fun m!604083 () Bool)

(assert (=> b!628989 m!604083))

(declare-fun m!604085 () Bool)

(assert (=> start!56758 m!604085))

(declare-fun m!604087 () Bool)

(assert (=> start!56758 m!604087))

(assert (=> b!628980 m!604079))

(assert (=> b!628980 m!604079))

(declare-fun m!604089 () Bool)

(assert (=> b!628980 m!604089))

(assert (=> b!628982 m!604079))

(assert (=> b!628982 m!604079))

(declare-fun m!604091 () Bool)

(assert (=> b!628982 m!604091))

(declare-fun m!604093 () Bool)

(assert (=> b!628988 m!604093))

(declare-fun m!604095 () Bool)

(assert (=> b!628986 m!604095))

(assert (=> b!628986 m!604079))

(declare-fun m!604097 () Bool)

(assert (=> b!628990 m!604097))

(declare-fun m!604099 () Bool)

(assert (=> b!628990 m!604099))

(declare-fun m!604101 () Bool)

(assert (=> b!628990 m!604101))

(declare-fun m!604103 () Bool)

(assert (=> b!628981 m!604103))

(declare-fun m!604105 () Bool)

(assert (=> b!628985 m!604105))

(declare-fun m!604107 () Bool)

(assert (=> b!628983 m!604107))

(declare-fun m!604109 () Bool)

(assert (=> b!628984 m!604109))

(check-sat (not b!628981) (not b!628984) (not b!628985) (not b!628980) (not b!628989) (not b!628987) (not b!628982) (not b!628988) (not start!56758) (not b!628983))
(check-sat)
(get-model)

(declare-fun d!89057 () Bool)

(assert (=> d!89057 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!56758 d!89057))

(declare-fun d!89059 () Bool)

(assert (=> d!89059 (= (array_inv!14034 a!2986) (bvsge (size!18602 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!56758 d!89059))

(declare-fun b!629036 () Bool)

(declare-fun e!359788 () Bool)

(declare-fun call!33275 () Bool)

(assert (=> b!629036 (= e!359788 call!33275)))

(declare-fun b!629037 () Bool)

(declare-fun e!359790 () Bool)

(assert (=> b!629037 (= e!359788 e!359790)))

(declare-fun lt!290625 () (_ BitVec 64))

(assert (=> b!629037 (= lt!290625 (select (arr!18238 a!2986) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!21104 0))(
  ( (Unit!21105) )
))
(declare-fun lt!290624 () Unit!21104)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37999 (_ BitVec 64) (_ BitVec 32)) Unit!21104)

(assert (=> b!629037 (= lt!290624 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!290625 #b00000000000000000000000000000000))))

(assert (=> b!629037 (arrayContainsKey!0 a!2986 lt!290625 #b00000000000000000000000000000000)))

(declare-fun lt!290626 () Unit!21104)

(assert (=> b!629037 (= lt!290626 lt!290624)))

(declare-fun res!406589 () Bool)

(assert (=> b!629037 (= res!406589 (= (seekEntryOrOpen!0 (select (arr!18238 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6678 #b00000000000000000000000000000000)))))

(assert (=> b!629037 (=> (not res!406589) (not e!359790))))

(declare-fun bm!33272 () Bool)

(assert (=> bm!33272 (= call!33275 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun d!89061 () Bool)

(declare-fun res!406588 () Bool)

(declare-fun e!359789 () Bool)

(assert (=> d!89061 (=> res!406588 e!359789)))

(assert (=> d!89061 (= res!406588 (bvsge #b00000000000000000000000000000000 (size!18602 a!2986)))))

(assert (=> d!89061 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!359789)))

(declare-fun b!629038 () Bool)

(assert (=> b!629038 (= e!359790 call!33275)))

(declare-fun b!629039 () Bool)

(assert (=> b!629039 (= e!359789 e!359788)))

(declare-fun c!71591 () Bool)

(assert (=> b!629039 (= c!71591 (validKeyInArray!0 (select (arr!18238 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!89061 (not res!406588)) b!629039))

(assert (= (and b!629039 c!71591) b!629037))

(assert (= (and b!629039 (not c!71591)) b!629036))

(assert (= (and b!629037 res!406589) b!629038))

(assert (= (or b!629038 b!629036) bm!33272))

(declare-fun m!604143 () Bool)

(assert (=> b!629037 m!604143))

(declare-fun m!604145 () Bool)

(assert (=> b!629037 m!604145))

(declare-fun m!604147 () Bool)

(assert (=> b!629037 m!604147))

(assert (=> b!629037 m!604143))

(declare-fun m!604149 () Bool)

(assert (=> b!629037 m!604149))

(declare-fun m!604151 () Bool)

(assert (=> bm!33272 m!604151))

(assert (=> b!629039 m!604143))

(assert (=> b!629039 m!604143))

(declare-fun m!604153 () Bool)

(assert (=> b!629039 m!604153))

(assert (=> b!628981 d!89061))

(declare-fun d!89067 () Bool)

(declare-fun lt!290643 () SeekEntryResult!6678)

(get-info :version)

(assert (=> d!89067 (and (or ((_ is Undefined!6678) lt!290643) (not ((_ is Found!6678) lt!290643)) (and (bvsge (index!28997 lt!290643) #b00000000000000000000000000000000) (bvslt (index!28997 lt!290643) (size!18602 a!2986)))) (or ((_ is Undefined!6678) lt!290643) ((_ is Found!6678) lt!290643) (not ((_ is MissingVacant!6678) lt!290643)) (not (= (index!28999 lt!290643) vacantSpotIndex!68)) (and (bvsge (index!28999 lt!290643) #b00000000000000000000000000000000) (bvslt (index!28999 lt!290643) (size!18602 a!2986)))) (or ((_ is Undefined!6678) lt!290643) (ite ((_ is Found!6678) lt!290643) (= (select (arr!18238 a!2986) (index!28997 lt!290643)) (select (arr!18238 a!2986) j!136)) (and ((_ is MissingVacant!6678) lt!290643) (= (index!28999 lt!290643) vacantSpotIndex!68) (= (select (arr!18238 a!2986) (index!28999 lt!290643)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!359810 () SeekEntryResult!6678)

(assert (=> d!89067 (= lt!290643 e!359810)))

(declare-fun c!71612 () Bool)

(assert (=> d!89067 (= c!71612 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!290642 () (_ BitVec 64))

(assert (=> d!89067 (= lt!290642 (select (arr!18238 a!2986) lt!290606))))

(assert (=> d!89067 (validMask!0 mask!3053)))

(assert (=> d!89067 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290606 vacantSpotIndex!68 (select (arr!18238 a!2986) j!136) a!2986 mask!3053) lt!290643)))

(declare-fun b!629076 () Bool)

(declare-fun e!359809 () SeekEntryResult!6678)

(assert (=> b!629076 (= e!359809 (MissingVacant!6678 vacantSpotIndex!68))))

(declare-fun b!629077 () Bool)

(declare-fun e!359811 () SeekEntryResult!6678)

(assert (=> b!629077 (= e!359810 e!359811)))

(declare-fun c!71610 () Bool)

(assert (=> b!629077 (= c!71610 (= lt!290642 (select (arr!18238 a!2986) j!136)))))

(declare-fun b!629078 () Bool)

(assert (=> b!629078 (= e!359810 Undefined!6678)))

(declare-fun b!629079 () Bool)

(assert (=> b!629079 (= e!359811 (Found!6678 lt!290606))))

(declare-fun b!629080 () Bool)

(assert (=> b!629080 (= e!359809 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!290606 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18238 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!629081 () Bool)

(declare-fun c!71611 () Bool)

(assert (=> b!629081 (= c!71611 (= lt!290642 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!629081 (= e!359811 e!359809)))

(assert (= (and d!89067 c!71612) b!629078))

(assert (= (and d!89067 (not c!71612)) b!629077))

(assert (= (and b!629077 c!71610) b!629079))

(assert (= (and b!629077 (not c!71610)) b!629081))

(assert (= (and b!629081 c!71611) b!629076))

(assert (= (and b!629081 (not c!71611)) b!629080))

(declare-fun m!604173 () Bool)

(assert (=> d!89067 m!604173))

(declare-fun m!604175 () Bool)

(assert (=> d!89067 m!604175))

(declare-fun m!604177 () Bool)

(assert (=> d!89067 m!604177))

(assert (=> d!89067 m!604085))

(declare-fun m!604179 () Bool)

(assert (=> b!629080 m!604179))

(assert (=> b!629080 m!604179))

(assert (=> b!629080 m!604079))

(declare-fun m!604181 () Bool)

(assert (=> b!629080 m!604181))

(assert (=> b!628982 d!89067))

(declare-fun d!89079 () Bool)

(assert (=> d!89079 (= (validKeyInArray!0 (select (arr!18238 a!2986) j!136)) (and (not (= (select (arr!18238 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18238 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!628987 d!89079))

(declare-fun d!89081 () Bool)

(assert (=> d!89081 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!628988 d!89081))

(declare-fun bm!33278 () Bool)

(declare-fun call!33281 () Bool)

(declare-fun c!71624 () Bool)

(assert (=> bm!33278 (= call!33281 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!71624 (Cons!12275 (select (arr!18238 a!2986) #b00000000000000000000000000000000) Nil!12276) Nil!12276)))))

(declare-fun b!629117 () Bool)

(declare-fun e!359836 () Bool)

(assert (=> b!629117 (= e!359836 call!33281)))

(declare-fun b!629118 () Bool)

(declare-fun e!359837 () Bool)

(declare-fun e!359838 () Bool)

(assert (=> b!629118 (= e!359837 e!359838)))

(declare-fun res!406604 () Bool)

(assert (=> b!629118 (=> (not res!406604) (not e!359838))))

(declare-fun e!359835 () Bool)

(assert (=> b!629118 (= res!406604 (not e!359835))))

(declare-fun res!406602 () Bool)

(assert (=> b!629118 (=> (not res!406602) (not e!359835))))

(assert (=> b!629118 (= res!406602 (validKeyInArray!0 (select (arr!18238 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!89083 () Bool)

(declare-fun res!406603 () Bool)

(assert (=> d!89083 (=> res!406603 e!359837)))

(assert (=> d!89083 (= res!406603 (bvsge #b00000000000000000000000000000000 (size!18602 a!2986)))))

(assert (=> d!89083 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12276) e!359837)))

(declare-fun b!629116 () Bool)

(assert (=> b!629116 (= e!359836 call!33281)))

(declare-fun b!629119 () Bool)

(assert (=> b!629119 (= e!359838 e!359836)))

(assert (=> b!629119 (= c!71624 (validKeyInArray!0 (select (arr!18238 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!629120 () Bool)

(declare-fun contains!3082 (List!12279 (_ BitVec 64)) Bool)

(assert (=> b!629120 (= e!359835 (contains!3082 Nil!12276 (select (arr!18238 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!89083 (not res!406603)) b!629118))

(assert (= (and b!629118 res!406602) b!629120))

(assert (= (and b!629118 res!406604) b!629119))

(assert (= (and b!629119 c!71624) b!629117))

(assert (= (and b!629119 (not c!71624)) b!629116))

(assert (= (or b!629117 b!629116) bm!33278))

(assert (=> bm!33278 m!604143))

(declare-fun m!604195 () Bool)

(assert (=> bm!33278 m!604195))

(assert (=> b!629118 m!604143))

(assert (=> b!629118 m!604143))

(assert (=> b!629118 m!604153))

(assert (=> b!629119 m!604143))

(assert (=> b!629119 m!604143))

(assert (=> b!629119 m!604153))

(assert (=> b!629120 m!604143))

(assert (=> b!629120 m!604143))

(declare-fun m!604197 () Bool)

(assert (=> b!629120 m!604197))

(assert (=> b!628983 d!89083))

(declare-fun d!89087 () Bool)

(declare-fun res!406609 () Bool)

(declare-fun e!359846 () Bool)

(assert (=> d!89087 (=> res!406609 e!359846)))

(assert (=> d!89087 (= res!406609 (= (select (arr!18238 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!89087 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!359846)))

(declare-fun b!629131 () Bool)

(declare-fun e!359847 () Bool)

(assert (=> b!629131 (= e!359846 e!359847)))

(declare-fun res!406610 () Bool)

(assert (=> b!629131 (=> (not res!406610) (not e!359847))))

(assert (=> b!629131 (= res!406610 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18602 a!2986)))))

(declare-fun b!629132 () Bool)

(assert (=> b!629132 (= e!359847 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!89087 (not res!406609)) b!629131))

(assert (= (and b!629131 res!406610) b!629132))

(assert (=> d!89087 m!604143))

(declare-fun m!604205 () Bool)

(assert (=> b!629132 m!604205))

(assert (=> b!628984 d!89087))

(declare-fun b!629169 () Bool)

(declare-fun e!359874 () SeekEntryResult!6678)

(assert (=> b!629169 (= e!359874 Undefined!6678)))

(declare-fun b!629170 () Bool)

(declare-fun c!71640 () Bool)

(declare-fun lt!290678 () (_ BitVec 64))

(assert (=> b!629170 (= c!71640 (= lt!290678 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!359873 () SeekEntryResult!6678)

(declare-fun e!359872 () SeekEntryResult!6678)

(assert (=> b!629170 (= e!359873 e!359872)))

(declare-fun lt!290677 () SeekEntryResult!6678)

(declare-fun b!629171 () Bool)

(assert (=> b!629171 (= e!359872 (seekKeyOrZeroReturnVacant!0 (x!57728 lt!290677) (index!28998 lt!290677) (index!28998 lt!290677) k0!1786 a!2986 mask!3053))))

(declare-fun d!89091 () Bool)

(declare-fun lt!290676 () SeekEntryResult!6678)

(assert (=> d!89091 (and (or ((_ is Undefined!6678) lt!290676) (not ((_ is Found!6678) lt!290676)) (and (bvsge (index!28997 lt!290676) #b00000000000000000000000000000000) (bvslt (index!28997 lt!290676) (size!18602 a!2986)))) (or ((_ is Undefined!6678) lt!290676) ((_ is Found!6678) lt!290676) (not ((_ is MissingZero!6678) lt!290676)) (and (bvsge (index!28996 lt!290676) #b00000000000000000000000000000000) (bvslt (index!28996 lt!290676) (size!18602 a!2986)))) (or ((_ is Undefined!6678) lt!290676) ((_ is Found!6678) lt!290676) ((_ is MissingZero!6678) lt!290676) (not ((_ is MissingVacant!6678) lt!290676)) (and (bvsge (index!28999 lt!290676) #b00000000000000000000000000000000) (bvslt (index!28999 lt!290676) (size!18602 a!2986)))) (or ((_ is Undefined!6678) lt!290676) (ite ((_ is Found!6678) lt!290676) (= (select (arr!18238 a!2986) (index!28997 lt!290676)) k0!1786) (ite ((_ is MissingZero!6678) lt!290676) (= (select (arr!18238 a!2986) (index!28996 lt!290676)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6678) lt!290676) (= (select (arr!18238 a!2986) (index!28999 lt!290676)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!89091 (= lt!290676 e!359874)))

(declare-fun c!71642 () Bool)

(assert (=> d!89091 (= c!71642 (and ((_ is Intermediate!6678) lt!290677) (undefined!7490 lt!290677)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37999 (_ BitVec 32)) SeekEntryResult!6678)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89091 (= lt!290677 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!89091 (validMask!0 mask!3053)))

(assert (=> d!89091 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!290676)))

(declare-fun b!629172 () Bool)

(assert (=> b!629172 (= e!359874 e!359873)))

(assert (=> b!629172 (= lt!290678 (select (arr!18238 a!2986) (index!28998 lt!290677)))))

(declare-fun c!71641 () Bool)

(assert (=> b!629172 (= c!71641 (= lt!290678 k0!1786))))

(declare-fun b!629173 () Bool)

(assert (=> b!629173 (= e!359872 (MissingZero!6678 (index!28998 lt!290677)))))

(declare-fun b!629174 () Bool)

(assert (=> b!629174 (= e!359873 (Found!6678 (index!28998 lt!290677)))))

(assert (= (and d!89091 c!71642) b!629169))

(assert (= (and d!89091 (not c!71642)) b!629172))

(assert (= (and b!629172 c!71641) b!629174))

(assert (= (and b!629172 (not c!71641)) b!629170))

(assert (= (and b!629170 c!71640) b!629173))

(assert (= (and b!629170 (not c!71640)) b!629171))

(declare-fun m!604231 () Bool)

(assert (=> b!629171 m!604231))

(declare-fun m!604233 () Bool)

(assert (=> d!89091 m!604233))

(declare-fun m!604235 () Bool)

(assert (=> d!89091 m!604235))

(declare-fun m!604237 () Bool)

(assert (=> d!89091 m!604237))

(assert (=> d!89091 m!604235))

(declare-fun m!604239 () Bool)

(assert (=> d!89091 m!604239))

(declare-fun m!604241 () Bool)

(assert (=> d!89091 m!604241))

(assert (=> d!89091 m!604085))

(declare-fun m!604243 () Bool)

(assert (=> b!629172 m!604243))

(assert (=> b!628989 d!89091))

(declare-fun d!89105 () Bool)

(declare-fun lt!290680 () SeekEntryResult!6678)

(assert (=> d!89105 (and (or ((_ is Undefined!6678) lt!290680) (not ((_ is Found!6678) lt!290680)) (and (bvsge (index!28997 lt!290680) #b00000000000000000000000000000000) (bvslt (index!28997 lt!290680) (size!18602 a!2986)))) (or ((_ is Undefined!6678) lt!290680) ((_ is Found!6678) lt!290680) (not ((_ is MissingVacant!6678) lt!290680)) (not (= (index!28999 lt!290680) vacantSpotIndex!68)) (and (bvsge (index!28999 lt!290680) #b00000000000000000000000000000000) (bvslt (index!28999 lt!290680) (size!18602 a!2986)))) (or ((_ is Undefined!6678) lt!290680) (ite ((_ is Found!6678) lt!290680) (= (select (arr!18238 a!2986) (index!28997 lt!290680)) (select (arr!18238 a!2986) j!136)) (and ((_ is MissingVacant!6678) lt!290680) (= (index!28999 lt!290680) vacantSpotIndex!68) (= (select (arr!18238 a!2986) (index!28999 lt!290680)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!359876 () SeekEntryResult!6678)

(assert (=> d!89105 (= lt!290680 e!359876)))

(declare-fun c!71645 () Bool)

(assert (=> d!89105 (= c!71645 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!290679 () (_ BitVec 64))

(assert (=> d!89105 (= lt!290679 (select (arr!18238 a!2986) index!984))))

(assert (=> d!89105 (validMask!0 mask!3053)))

(assert (=> d!89105 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18238 a!2986) j!136) a!2986 mask!3053) lt!290680)))

(declare-fun b!629175 () Bool)

(declare-fun e!359875 () SeekEntryResult!6678)

(assert (=> b!629175 (= e!359875 (MissingVacant!6678 vacantSpotIndex!68))))

(declare-fun b!629176 () Bool)

(declare-fun e!359877 () SeekEntryResult!6678)

(assert (=> b!629176 (= e!359876 e!359877)))

(declare-fun c!71643 () Bool)

(assert (=> b!629176 (= c!71643 (= lt!290679 (select (arr!18238 a!2986) j!136)))))

(declare-fun b!629177 () Bool)

(assert (=> b!629177 (= e!359876 Undefined!6678)))

(declare-fun b!629178 () Bool)

(assert (=> b!629178 (= e!359877 (Found!6678 index!984))))

(declare-fun b!629179 () Bool)

(assert (=> b!629179 (= e!359875 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18238 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!629180 () Bool)

(declare-fun c!71644 () Bool)

(assert (=> b!629180 (= c!71644 (= lt!290679 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!629180 (= e!359877 e!359875)))

(assert (= (and d!89105 c!71645) b!629177))

(assert (= (and d!89105 (not c!71645)) b!629176))

(assert (= (and b!629176 c!71643) b!629178))

(assert (= (and b!629176 (not c!71643)) b!629180))

(assert (= (and b!629180 c!71644) b!629175))

(assert (= (and b!629180 (not c!71644)) b!629179))

(declare-fun m!604245 () Bool)

(assert (=> d!89105 m!604245))

(declare-fun m!604247 () Bool)

(assert (=> d!89105 m!604247))

(assert (=> d!89105 m!604095))

(assert (=> d!89105 m!604085))

(assert (=> b!629179 m!604105))

(assert (=> b!629179 m!604105))

(assert (=> b!629179 m!604079))

(declare-fun m!604249 () Bool)

(assert (=> b!629179 m!604249))

(assert (=> b!628980 d!89105))

(declare-fun d!89107 () Bool)

(declare-fun lt!290689 () (_ BitVec 32))

(assert (=> d!89107 (and (bvsge lt!290689 #b00000000000000000000000000000000) (bvslt lt!290689 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89107 (= lt!290689 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!89107 (validMask!0 mask!3053)))

(assert (=> d!89107 (= (nextIndex!0 index!984 x!910 mask!3053) lt!290689)))

(declare-fun bs!18974 () Bool)

(assert (= bs!18974 d!89107))

(declare-fun m!604251 () Bool)

(assert (=> bs!18974 m!604251))

(assert (=> bs!18974 m!604085))

(assert (=> b!628985 d!89107))

(check-sat (not b!629179) (not b!629039) (not b!629120) (not b!629118) (not b!629119) (not b!629037) (not bm!33278) (not b!629171) (not bm!33272) (not b!629132) (not d!89105) (not d!89067) (not d!89091) (not b!629080) (not d!89107))
(check-sat)
