; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54924 () Bool)

(assert start!54924)

(declare-fun b!600328 () Bool)

(declare-fun e!343237 () Bool)

(declare-datatypes ((SeekEntryResult!6205 0))(
  ( (MissingZero!6205 (index!27077 (_ BitVec 32))) (Found!6205 (index!27078 (_ BitVec 32))) (Intermediate!6205 (undefined!7017 Bool) (index!27079 (_ BitVec 32)) (x!56031 (_ BitVec 32))) (Undefined!6205) (MissingVacant!6205 (index!27080 (_ BitVec 32))) )
))
(declare-fun lt!273039 () SeekEntryResult!6205)

(declare-fun lt!273032 () SeekEntryResult!6205)

(assert (=> b!600328 (= e!343237 (= lt!273039 lt!273032))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!343235 () Bool)

(declare-datatypes ((array!37104 0))(
  ( (array!37105 (arr!17809 (Array (_ BitVec 32) (_ BitVec 64))) (size!18173 (_ BitVec 32))) )
))
(declare-fun lt!273036 () array!37104)

(declare-fun b!600329 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37104)

(declare-fun arrayContainsKey!0 (array!37104 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!600329 (= e!343235 (arrayContainsKey!0 lt!273036 (select (arr!17809 a!2986) j!136) index!984))))

(declare-fun b!600330 () Bool)

(declare-fun e!343245 () Bool)

(assert (=> b!600330 (= e!343245 e!343235)))

(declare-fun res!385153 () Bool)

(assert (=> b!600330 (=> (not res!385153) (not e!343235))))

(assert (=> b!600330 (= res!385153 (arrayContainsKey!0 lt!273036 (select (arr!17809 a!2986) j!136) j!136))))

(declare-fun res!385143 () Bool)

(declare-fun e!343236 () Bool)

(assert (=> start!54924 (=> (not res!385143) (not e!343236))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54924 (= res!385143 (validMask!0 mask!3053))))

(assert (=> start!54924 e!343236))

(assert (=> start!54924 true))

(declare-fun array_inv!13668 (array!37104) Bool)

(assert (=> start!54924 (array_inv!13668 a!2986)))

(declare-fun b!600331 () Bool)

(declare-fun res!385142 () Bool)

(declare-fun e!343241 () Bool)

(assert (=> b!600331 (=> res!385142 e!343241)))

(declare-datatypes ((List!11757 0))(
  ( (Nil!11754) (Cons!11753 (h!12801 (_ BitVec 64)) (t!17977 List!11757)) )
))
(declare-fun noDuplicate!292 (List!11757) Bool)

(assert (=> b!600331 (= res!385142 (not (noDuplicate!292 Nil!11754)))))

(declare-fun b!600332 () Bool)

(declare-fun e!343233 () Bool)

(declare-fun e!343244 () Bool)

(assert (=> b!600332 (= e!343233 e!343244)))

(declare-fun res!385137 () Bool)

(assert (=> b!600332 (=> res!385137 e!343244)))

(declare-fun lt!273040 () (_ BitVec 64))

(declare-fun lt!273035 () (_ BitVec 64))

(assert (=> b!600332 (= res!385137 (or (not (= (select (arr!17809 a!2986) j!136) lt!273035)) (not (= (select (arr!17809 a!2986) j!136) lt!273040)) (bvsge j!136 index!984)))))

(declare-fun e!343240 () Bool)

(assert (=> b!600332 e!343240))

(declare-fun res!385155 () Bool)

(assert (=> b!600332 (=> (not res!385155) (not e!343240))))

(assert (=> b!600332 (= res!385155 (= lt!273040 (select (arr!17809 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!600332 (= lt!273040 (select (store (arr!17809 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!600333 () Bool)

(declare-fun res!385150 () Bool)

(declare-fun e!343243 () Bool)

(assert (=> b!600333 (=> (not res!385150) (not e!343243))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37104 (_ BitVec 32)) Bool)

(assert (=> b!600333 (= res!385150 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!600334 () Bool)

(declare-fun res!385156 () Bool)

(assert (=> b!600334 (=> res!385156 e!343241)))

(declare-fun contains!2947 (List!11757 (_ BitVec 64)) Bool)

(assert (=> b!600334 (= res!385156 (contains!2947 Nil!11754 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!600335 () Bool)

(declare-fun e!343238 () Bool)

(assert (=> b!600335 (= e!343238 (not e!343233))))

(declare-fun res!385146 () Bool)

(assert (=> b!600335 (=> res!385146 e!343233)))

(declare-fun lt!273037 () SeekEntryResult!6205)

(assert (=> b!600335 (= res!385146 (not (= lt!273037 (Found!6205 index!984))))))

(declare-datatypes ((Unit!18913 0))(
  ( (Unit!18914) )
))
(declare-fun lt!273041 () Unit!18913)

(declare-fun e!343242 () Unit!18913)

(assert (=> b!600335 (= lt!273041 e!343242)))

(declare-fun c!67964 () Bool)

(assert (=> b!600335 (= c!67964 (= lt!273037 Undefined!6205))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37104 (_ BitVec 32)) SeekEntryResult!6205)

(assert (=> b!600335 (= lt!273037 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!273035 lt!273036 mask!3053))))

(assert (=> b!600335 e!343237))

(declare-fun res!385144 () Bool)

(assert (=> b!600335 (=> (not res!385144) (not e!343237))))

(declare-fun lt!273030 () (_ BitVec 32))

(assert (=> b!600335 (= res!385144 (= lt!273032 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273030 vacantSpotIndex!68 lt!273035 lt!273036 mask!3053)))))

(assert (=> b!600335 (= lt!273032 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273030 vacantSpotIndex!68 (select (arr!17809 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!600335 (= lt!273035 (select (store (arr!17809 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!273042 () Unit!18913)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37104 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18913)

(assert (=> b!600335 (= lt!273042 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!273030 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!600335 (= lt!273030 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!600336 () Bool)

(declare-fun res!385140 () Bool)

(assert (=> b!600336 (=> (not res!385140) (not e!343236))))

(assert (=> b!600336 (= res!385140 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!600337 () Bool)

(assert (=> b!600337 (= e!343240 e!343245)))

(declare-fun res!385141 () Bool)

(assert (=> b!600337 (=> res!385141 e!343245)))

(assert (=> b!600337 (= res!385141 (or (not (= (select (arr!17809 a!2986) j!136) lt!273035)) (not (= (select (arr!17809 a!2986) j!136) lt!273040)) (bvsge j!136 index!984)))))

(declare-fun b!600338 () Bool)

(declare-fun res!385139 () Bool)

(assert (=> b!600338 (=> (not res!385139) (not e!343236))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!600338 (= res!385139 (validKeyInArray!0 k0!1786))))

(declare-fun b!600339 () Bool)

(declare-fun e!343239 () Bool)

(assert (=> b!600339 (= e!343239 e!343238)))

(declare-fun res!385145 () Bool)

(assert (=> b!600339 (=> (not res!385145) (not e!343238))))

(assert (=> b!600339 (= res!385145 (and (= lt!273039 (Found!6205 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17809 a!2986) index!984) (select (arr!17809 a!2986) j!136))) (not (= (select (arr!17809 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!600339 (= lt!273039 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17809 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!600340 () Bool)

(declare-fun Unit!18915 () Unit!18913)

(assert (=> b!600340 (= e!343242 Unit!18915)))

(declare-fun b!600341 () Bool)

(declare-fun Unit!18916 () Unit!18913)

(assert (=> b!600341 (= e!343242 Unit!18916)))

(assert (=> b!600341 false))

(declare-fun b!600342 () Bool)

(assert (=> b!600342 (= e!343244 e!343241)))

(declare-fun res!385148 () Bool)

(assert (=> b!600342 (=> res!385148 e!343241)))

(assert (=> b!600342 (= res!385148 (or (bvsge (size!18173 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18173 a!2986))))))

(declare-fun arrayNoDuplicates!0 (array!37104 (_ BitVec 32) List!11757) Bool)

(assert (=> b!600342 (arrayNoDuplicates!0 lt!273036 j!136 Nil!11754)))

(declare-fun lt!273034 () Unit!18913)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37104 (_ BitVec 32) (_ BitVec 32)) Unit!18913)

(assert (=> b!600342 (= lt!273034 (lemmaNoDuplicateFromThenFromBigger!0 lt!273036 #b00000000000000000000000000000000 j!136))))

(assert (=> b!600342 (arrayNoDuplicates!0 lt!273036 #b00000000000000000000000000000000 Nil!11754)))

(declare-fun lt!273033 () Unit!18913)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37104 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11757) Unit!18913)

(assert (=> b!600342 (= lt!273033 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11754))))

(assert (=> b!600342 (arrayContainsKey!0 lt!273036 (select (arr!17809 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!273043 () Unit!18913)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37104 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18913)

(assert (=> b!600342 (= lt!273043 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!273036 (select (arr!17809 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!600343 () Bool)

(assert (=> b!600343 (= e!343236 e!343243)))

(declare-fun res!385152 () Bool)

(assert (=> b!600343 (=> (not res!385152) (not e!343243))))

(declare-fun lt!273031 () SeekEntryResult!6205)

(assert (=> b!600343 (= res!385152 (or (= lt!273031 (MissingZero!6205 i!1108)) (= lt!273031 (MissingVacant!6205 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37104 (_ BitVec 32)) SeekEntryResult!6205)

(assert (=> b!600343 (= lt!273031 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!600344 () Bool)

(declare-fun res!385154 () Bool)

(assert (=> b!600344 (=> (not res!385154) (not e!343243))))

(assert (=> b!600344 (= res!385154 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11754))))

(declare-fun b!600345 () Bool)

(declare-fun res!385151 () Bool)

(assert (=> b!600345 (=> (not res!385151) (not e!343236))))

(assert (=> b!600345 (= res!385151 (validKeyInArray!0 (select (arr!17809 a!2986) j!136)))))

(declare-fun b!600346 () Bool)

(declare-fun res!385149 () Bool)

(assert (=> b!600346 (=> (not res!385149) (not e!343243))))

(assert (=> b!600346 (= res!385149 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17809 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!600347 () Bool)

(declare-fun res!385138 () Bool)

(assert (=> b!600347 (=> (not res!385138) (not e!343236))))

(assert (=> b!600347 (= res!385138 (and (= (size!18173 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18173 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18173 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!600348 () Bool)

(assert (=> b!600348 (= e!343241 true)))

(declare-fun lt!273038 () Bool)

(assert (=> b!600348 (= lt!273038 (contains!2947 Nil!11754 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!600349 () Bool)

(assert (=> b!600349 (= e!343243 e!343239)))

(declare-fun res!385147 () Bool)

(assert (=> b!600349 (=> (not res!385147) (not e!343239))))

(assert (=> b!600349 (= res!385147 (= (select (store (arr!17809 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!600349 (= lt!273036 (array!37105 (store (arr!17809 a!2986) i!1108 k0!1786) (size!18173 a!2986)))))

(assert (= (and start!54924 res!385143) b!600347))

(assert (= (and b!600347 res!385138) b!600345))

(assert (= (and b!600345 res!385151) b!600338))

(assert (= (and b!600338 res!385139) b!600336))

(assert (= (and b!600336 res!385140) b!600343))

(assert (= (and b!600343 res!385152) b!600333))

(assert (= (and b!600333 res!385150) b!600344))

(assert (= (and b!600344 res!385154) b!600346))

(assert (= (and b!600346 res!385149) b!600349))

(assert (= (and b!600349 res!385147) b!600339))

(assert (= (and b!600339 res!385145) b!600335))

(assert (= (and b!600335 res!385144) b!600328))

(assert (= (and b!600335 c!67964) b!600341))

(assert (= (and b!600335 (not c!67964)) b!600340))

(assert (= (and b!600335 (not res!385146)) b!600332))

(assert (= (and b!600332 res!385155) b!600337))

(assert (= (and b!600337 (not res!385141)) b!600330))

(assert (= (and b!600330 res!385153) b!600329))

(assert (= (and b!600332 (not res!385137)) b!600342))

(assert (= (and b!600342 (not res!385148)) b!600331))

(assert (= (and b!600331 (not res!385142)) b!600334))

(assert (= (and b!600334 (not res!385156)) b!600348))

(declare-fun m!577781 () Bool)

(assert (=> b!600335 m!577781))

(declare-fun m!577783 () Bool)

(assert (=> b!600335 m!577783))

(declare-fun m!577785 () Bool)

(assert (=> b!600335 m!577785))

(declare-fun m!577787 () Bool)

(assert (=> b!600335 m!577787))

(assert (=> b!600335 m!577785))

(declare-fun m!577789 () Bool)

(assert (=> b!600335 m!577789))

(declare-fun m!577791 () Bool)

(assert (=> b!600335 m!577791))

(declare-fun m!577793 () Bool)

(assert (=> b!600335 m!577793))

(declare-fun m!577795 () Bool)

(assert (=> b!600335 m!577795))

(assert (=> b!600345 m!577785))

(assert (=> b!600345 m!577785))

(declare-fun m!577797 () Bool)

(assert (=> b!600345 m!577797))

(declare-fun m!577799 () Bool)

(assert (=> b!600342 m!577799))

(assert (=> b!600342 m!577785))

(declare-fun m!577801 () Bool)

(assert (=> b!600342 m!577801))

(assert (=> b!600342 m!577785))

(declare-fun m!577803 () Bool)

(assert (=> b!600342 m!577803))

(declare-fun m!577805 () Bool)

(assert (=> b!600342 m!577805))

(assert (=> b!600342 m!577785))

(declare-fun m!577807 () Bool)

(assert (=> b!600342 m!577807))

(declare-fun m!577809 () Bool)

(assert (=> b!600342 m!577809))

(declare-fun m!577811 () Bool)

(assert (=> b!600343 m!577811))

(assert (=> b!600329 m!577785))

(assert (=> b!600329 m!577785))

(declare-fun m!577813 () Bool)

(assert (=> b!600329 m!577813))

(declare-fun m!577815 () Bool)

(assert (=> b!600336 m!577815))

(declare-fun m!577817 () Bool)

(assert (=> b!600338 m!577817))

(declare-fun m!577819 () Bool)

(assert (=> start!54924 m!577819))

(declare-fun m!577821 () Bool)

(assert (=> start!54924 m!577821))

(assert (=> b!600337 m!577785))

(declare-fun m!577823 () Bool)

(assert (=> b!600334 m!577823))

(assert (=> b!600330 m!577785))

(assert (=> b!600330 m!577785))

(declare-fun m!577825 () Bool)

(assert (=> b!600330 m!577825))

(declare-fun m!577827 () Bool)

(assert (=> b!600333 m!577827))

(declare-fun m!577829 () Bool)

(assert (=> b!600339 m!577829))

(assert (=> b!600339 m!577785))

(assert (=> b!600339 m!577785))

(declare-fun m!577831 () Bool)

(assert (=> b!600339 m!577831))

(assert (=> b!600349 m!577787))

(declare-fun m!577833 () Bool)

(assert (=> b!600349 m!577833))

(declare-fun m!577835 () Bool)

(assert (=> b!600346 m!577835))

(declare-fun m!577837 () Bool)

(assert (=> b!600331 m!577837))

(declare-fun m!577839 () Bool)

(assert (=> b!600344 m!577839))

(assert (=> b!600332 m!577785))

(assert (=> b!600332 m!577787))

(declare-fun m!577841 () Bool)

(assert (=> b!600332 m!577841))

(declare-fun m!577843 () Bool)

(assert (=> b!600348 m!577843))

(check-sat (not b!600338) (not b!600344) (not b!600342) (not b!600330) (not b!600336) (not b!600334) (not start!54924) (not b!600331) (not b!600345) (not b!600339) (not b!600329) (not b!600343) (not b!600335) (not b!600348) (not b!600333))
(check-sat)
