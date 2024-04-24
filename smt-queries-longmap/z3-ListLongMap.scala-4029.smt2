; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54930 () Bool)

(assert start!54930)

(declare-fun b!600526 () Bool)

(declare-fun e!343352 () Bool)

(declare-fun e!343358 () Bool)

(assert (=> b!600526 (= e!343352 (not e!343358))))

(declare-fun res!385319 () Bool)

(assert (=> b!600526 (=> res!385319 e!343358)))

(declare-datatypes ((SeekEntryResult!6208 0))(
  ( (MissingZero!6208 (index!27089 (_ BitVec 32))) (Found!6208 (index!27090 (_ BitVec 32))) (Intermediate!6208 (undefined!7020 Bool) (index!27091 (_ BitVec 32)) (x!56042 (_ BitVec 32))) (Undefined!6208) (MissingVacant!6208 (index!27092 (_ BitVec 32))) )
))
(declare-fun lt!273166 () SeekEntryResult!6208)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!600526 (= res!385319 (not (= lt!273166 (Found!6208 index!984))))))

(declare-datatypes ((Unit!18925 0))(
  ( (Unit!18926) )
))
(declare-fun lt!273169 () Unit!18925)

(declare-fun e!343361 () Unit!18925)

(assert (=> b!600526 (= lt!273169 e!343361)))

(declare-fun c!67973 () Bool)

(assert (=> b!600526 (= c!67973 (= lt!273166 Undefined!6208))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!273168 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((array!37110 0))(
  ( (array!37111 (arr!17812 (Array (_ BitVec 32) (_ BitVec 64))) (size!18176 (_ BitVec 32))) )
))
(declare-fun lt!273163 () array!37110)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37110 (_ BitVec 32)) SeekEntryResult!6208)

(assert (=> b!600526 (= lt!273166 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!273168 lt!273163 mask!3053))))

(declare-fun e!343360 () Bool)

(assert (=> b!600526 e!343360))

(declare-fun res!385333 () Bool)

(assert (=> b!600526 (=> (not res!385333) (not e!343360))))

(declare-fun lt!273165 () SeekEntryResult!6208)

(declare-fun lt!273159 () (_ BitVec 32))

(assert (=> b!600526 (= res!385333 (= lt!273165 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273159 vacantSpotIndex!68 lt!273168 lt!273163 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!37110)

(assert (=> b!600526 (= lt!273165 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273159 vacantSpotIndex!68 (select (arr!17812 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!600526 (= lt!273168 (select (store (arr!17812 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!273161 () Unit!18925)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37110 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18925)

(assert (=> b!600526 (= lt!273161 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!273159 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!600526 (= lt!273159 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!600527 () Bool)

(declare-fun e!343357 () Bool)

(assert (=> b!600527 (= e!343358 e!343357)))

(declare-fun res!385328 () Bool)

(assert (=> b!600527 (=> res!385328 e!343357)))

(declare-fun lt!273164 () (_ BitVec 64))

(assert (=> b!600527 (= res!385328 (or (not (= (select (arr!17812 a!2986) j!136) lt!273168)) (not (= (select (arr!17812 a!2986) j!136) lt!273164)) (bvsge j!136 index!984)))))

(declare-fun e!343351 () Bool)

(assert (=> b!600527 e!343351))

(declare-fun res!385318 () Bool)

(assert (=> b!600527 (=> (not res!385318) (not e!343351))))

(assert (=> b!600527 (= res!385318 (= lt!273164 (select (arr!17812 a!2986) j!136)))))

(assert (=> b!600527 (= lt!273164 (select (store (arr!17812 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!600528 () Bool)

(declare-fun e!343350 () Bool)

(assert (=> b!600528 (= e!343350 true)))

(declare-fun lt!273162 () Bool)

(declare-datatypes ((List!11760 0))(
  ( (Nil!11757) (Cons!11756 (h!12804 (_ BitVec 64)) (t!17980 List!11760)) )
))
(declare-fun contains!2950 (List!11760 (_ BitVec 64)) Bool)

(assert (=> b!600528 (= lt!273162 (contains!2950 Nil!11757 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!600530 () Bool)

(declare-fun e!343356 () Bool)

(assert (=> b!600530 (= e!343356 e!343352)))

(declare-fun res!385323 () Bool)

(assert (=> b!600530 (=> (not res!385323) (not e!343352))))

(declare-fun lt!273157 () SeekEntryResult!6208)

(assert (=> b!600530 (= res!385323 (and (= lt!273157 (Found!6208 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17812 a!2986) index!984) (select (arr!17812 a!2986) j!136))) (not (= (select (arr!17812 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!600530 (= lt!273157 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17812 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!600531 () Bool)

(declare-fun res!385331 () Bool)

(declare-fun e!343353 () Bool)

(assert (=> b!600531 (=> (not res!385331) (not e!343353))))

(declare-fun arrayNoDuplicates!0 (array!37110 (_ BitVec 32) List!11760) Bool)

(assert (=> b!600531 (= res!385331 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11757))))

(declare-fun b!600532 () Bool)

(declare-fun res!385324 () Bool)

(declare-fun e!343362 () Bool)

(assert (=> b!600532 (=> (not res!385324) (not e!343362))))

(assert (=> b!600532 (= res!385324 (and (= (size!18176 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18176 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18176 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!600533 () Bool)

(assert (=> b!600533 (= e!343362 e!343353)))

(declare-fun res!385334 () Bool)

(assert (=> b!600533 (=> (not res!385334) (not e!343353))))

(declare-fun lt!273156 () SeekEntryResult!6208)

(assert (=> b!600533 (= res!385334 (or (= lt!273156 (MissingZero!6208 i!1108)) (= lt!273156 (MissingVacant!6208 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37110 (_ BitVec 32)) SeekEntryResult!6208)

(assert (=> b!600533 (= lt!273156 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!600534 () Bool)

(declare-fun e!343359 () Bool)

(declare-fun e!343354 () Bool)

(assert (=> b!600534 (= e!343359 e!343354)))

(declare-fun res!385330 () Bool)

(assert (=> b!600534 (=> (not res!385330) (not e!343354))))

(declare-fun arrayContainsKey!0 (array!37110 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!600534 (= res!385330 (arrayContainsKey!0 lt!273163 (select (arr!17812 a!2986) j!136) j!136))))

(declare-fun b!600535 () Bool)

(assert (=> b!600535 (= e!343354 (arrayContainsKey!0 lt!273163 (select (arr!17812 a!2986) j!136) index!984))))

(declare-fun b!600536 () Bool)

(assert (=> b!600536 (= e!343360 (= lt!273157 lt!273165))))

(declare-fun b!600537 () Bool)

(assert (=> b!600537 (= e!343357 e!343350)))

(declare-fun res!385322 () Bool)

(assert (=> b!600537 (=> res!385322 e!343350)))

(assert (=> b!600537 (= res!385322 (or (bvsge (size!18176 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18176 a!2986))))))

(assert (=> b!600537 (arrayNoDuplicates!0 lt!273163 j!136 Nil!11757)))

(declare-fun lt!273158 () Unit!18925)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37110 (_ BitVec 32) (_ BitVec 32)) Unit!18925)

(assert (=> b!600537 (= lt!273158 (lemmaNoDuplicateFromThenFromBigger!0 lt!273163 #b00000000000000000000000000000000 j!136))))

(assert (=> b!600537 (arrayNoDuplicates!0 lt!273163 #b00000000000000000000000000000000 Nil!11757)))

(declare-fun lt!273160 () Unit!18925)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37110 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11760) Unit!18925)

(assert (=> b!600537 (= lt!273160 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11757))))

(assert (=> b!600537 (arrayContainsKey!0 lt!273163 (select (arr!17812 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!273167 () Unit!18925)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37110 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18925)

(assert (=> b!600537 (= lt!273167 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!273163 (select (arr!17812 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!600538 () Bool)

(declare-fun res!385335 () Bool)

(assert (=> b!600538 (=> (not res!385335) (not e!343353))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37110 (_ BitVec 32)) Bool)

(assert (=> b!600538 (= res!385335 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!600539 () Bool)

(declare-fun res!385326 () Bool)

(assert (=> b!600539 (=> (not res!385326) (not e!343362))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!600539 (= res!385326 (validKeyInArray!0 k0!1786))))

(declare-fun b!600540 () Bool)

(declare-fun res!385325 () Bool)

(assert (=> b!600540 (=> res!385325 e!343350)))

(declare-fun noDuplicate!295 (List!11760) Bool)

(assert (=> b!600540 (= res!385325 (not (noDuplicate!295 Nil!11757)))))

(declare-fun b!600541 () Bool)

(declare-fun Unit!18927 () Unit!18925)

(assert (=> b!600541 (= e!343361 Unit!18927)))

(declare-fun b!600542 () Bool)

(declare-fun Unit!18928 () Unit!18925)

(assert (=> b!600542 (= e!343361 Unit!18928)))

(assert (=> b!600542 false))

(declare-fun res!385336 () Bool)

(assert (=> start!54930 (=> (not res!385336) (not e!343362))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54930 (= res!385336 (validMask!0 mask!3053))))

(assert (=> start!54930 e!343362))

(assert (=> start!54930 true))

(declare-fun array_inv!13671 (array!37110) Bool)

(assert (=> start!54930 (array_inv!13671 a!2986)))

(declare-fun b!600529 () Bool)

(declare-fun res!385321 () Bool)

(assert (=> b!600529 (=> (not res!385321) (not e!343362))))

(assert (=> b!600529 (= res!385321 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!600543 () Bool)

(declare-fun res!385327 () Bool)

(assert (=> b!600543 (=> (not res!385327) (not e!343362))))

(assert (=> b!600543 (= res!385327 (validKeyInArray!0 (select (arr!17812 a!2986) j!136)))))

(declare-fun b!600544 () Bool)

(declare-fun res!385329 () Bool)

(assert (=> b!600544 (=> (not res!385329) (not e!343353))))

(assert (=> b!600544 (= res!385329 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17812 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!600545 () Bool)

(declare-fun res!385332 () Bool)

(assert (=> b!600545 (=> res!385332 e!343350)))

(assert (=> b!600545 (= res!385332 (contains!2950 Nil!11757 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!600546 () Bool)

(assert (=> b!600546 (= e!343353 e!343356)))

(declare-fun res!385320 () Bool)

(assert (=> b!600546 (=> (not res!385320) (not e!343356))))

(assert (=> b!600546 (= res!385320 (= (select (store (arr!17812 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!600546 (= lt!273163 (array!37111 (store (arr!17812 a!2986) i!1108 k0!1786) (size!18176 a!2986)))))

(declare-fun b!600547 () Bool)

(assert (=> b!600547 (= e!343351 e!343359)))

(declare-fun res!385317 () Bool)

(assert (=> b!600547 (=> res!385317 e!343359)))

(assert (=> b!600547 (= res!385317 (or (not (= (select (arr!17812 a!2986) j!136) lt!273168)) (not (= (select (arr!17812 a!2986) j!136) lt!273164)) (bvsge j!136 index!984)))))

(assert (= (and start!54930 res!385336) b!600532))

(assert (= (and b!600532 res!385324) b!600543))

(assert (= (and b!600543 res!385327) b!600539))

(assert (= (and b!600539 res!385326) b!600529))

(assert (= (and b!600529 res!385321) b!600533))

(assert (= (and b!600533 res!385334) b!600538))

(assert (= (and b!600538 res!385335) b!600531))

(assert (= (and b!600531 res!385331) b!600544))

(assert (= (and b!600544 res!385329) b!600546))

(assert (= (and b!600546 res!385320) b!600530))

(assert (= (and b!600530 res!385323) b!600526))

(assert (= (and b!600526 res!385333) b!600536))

(assert (= (and b!600526 c!67973) b!600542))

(assert (= (and b!600526 (not c!67973)) b!600541))

(assert (= (and b!600526 (not res!385319)) b!600527))

(assert (= (and b!600527 res!385318) b!600547))

(assert (= (and b!600547 (not res!385317)) b!600534))

(assert (= (and b!600534 res!385330) b!600535))

(assert (= (and b!600527 (not res!385328)) b!600537))

(assert (= (and b!600537 (not res!385322)) b!600540))

(assert (= (and b!600540 (not res!385325)) b!600545))

(assert (= (and b!600545 (not res!385332)) b!600528))

(declare-fun m!577973 () Bool)

(assert (=> b!600543 m!577973))

(assert (=> b!600543 m!577973))

(declare-fun m!577975 () Bool)

(assert (=> b!600543 m!577975))

(declare-fun m!577977 () Bool)

(assert (=> b!600531 m!577977))

(assert (=> b!600534 m!577973))

(assert (=> b!600534 m!577973))

(declare-fun m!577979 () Bool)

(assert (=> b!600534 m!577979))

(declare-fun m!577981 () Bool)

(assert (=> b!600539 m!577981))

(declare-fun m!577983 () Bool)

(assert (=> b!600546 m!577983))

(declare-fun m!577985 () Bool)

(assert (=> b!600546 m!577985))

(declare-fun m!577987 () Bool)

(assert (=> b!600540 m!577987))

(declare-fun m!577989 () Bool)

(assert (=> b!600528 m!577989))

(declare-fun m!577991 () Bool)

(assert (=> b!600544 m!577991))

(assert (=> b!600547 m!577973))

(assert (=> b!600527 m!577973))

(assert (=> b!600527 m!577983))

(declare-fun m!577993 () Bool)

(assert (=> b!600527 m!577993))

(declare-fun m!577995 () Bool)

(assert (=> b!600545 m!577995))

(declare-fun m!577997 () Bool)

(assert (=> b!600538 m!577997))

(declare-fun m!577999 () Bool)

(assert (=> b!600530 m!577999))

(assert (=> b!600530 m!577973))

(assert (=> b!600530 m!577973))

(declare-fun m!578001 () Bool)

(assert (=> b!600530 m!578001))

(declare-fun m!578003 () Bool)

(assert (=> b!600529 m!578003))

(declare-fun m!578005 () Bool)

(assert (=> b!600537 m!578005))

(assert (=> b!600537 m!577973))

(declare-fun m!578007 () Bool)

(assert (=> b!600537 m!578007))

(assert (=> b!600537 m!577973))

(declare-fun m!578009 () Bool)

(assert (=> b!600537 m!578009))

(declare-fun m!578011 () Bool)

(assert (=> b!600537 m!578011))

(assert (=> b!600537 m!577973))

(declare-fun m!578013 () Bool)

(assert (=> b!600537 m!578013))

(declare-fun m!578015 () Bool)

(assert (=> b!600537 m!578015))

(declare-fun m!578017 () Bool)

(assert (=> b!600526 m!578017))

(declare-fun m!578019 () Bool)

(assert (=> b!600526 m!578019))

(declare-fun m!578021 () Bool)

(assert (=> b!600526 m!578021))

(assert (=> b!600526 m!577973))

(assert (=> b!600526 m!577983))

(assert (=> b!600526 m!577973))

(declare-fun m!578023 () Bool)

(assert (=> b!600526 m!578023))

(declare-fun m!578025 () Bool)

(assert (=> b!600526 m!578025))

(declare-fun m!578027 () Bool)

(assert (=> b!600526 m!578027))

(declare-fun m!578029 () Bool)

(assert (=> start!54930 m!578029))

(declare-fun m!578031 () Bool)

(assert (=> start!54930 m!578031))

(declare-fun m!578033 () Bool)

(assert (=> b!600533 m!578033))

(assert (=> b!600535 m!577973))

(assert (=> b!600535 m!577973))

(declare-fun m!578035 () Bool)

(assert (=> b!600535 m!578035))

(check-sat (not b!600537) (not b!600543) (not b!600540) (not b!600530) (not b!600529) (not start!54930) (not b!600534) (not b!600535) (not b!600539) (not b!600528) (not b!600533) (not b!600526) (not b!600538) (not b!600531) (not b!600545))
(check-sat)
