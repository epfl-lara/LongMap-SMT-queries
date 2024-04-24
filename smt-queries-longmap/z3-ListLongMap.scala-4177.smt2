; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56970 () Bool)

(assert start!56970)

(declare-fun res!407550 () Bool)

(declare-fun e!360503 () Bool)

(assert (=> start!56970 (=> (not res!407550) (not e!360503))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56970 (= res!407550 (validMask!0 mask!3053))))

(assert (=> start!56970 e!360503))

(assert (=> start!56970 true))

(declare-datatypes ((array!38046 0))(
  ( (array!38047 (arr!18256 (Array (_ BitVec 32) (_ BitVec 64))) (size!18620 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38046)

(declare-fun array_inv!14115 (array!38046) Bool)

(assert (=> start!56970 (array_inv!14115 a!2986)))

(declare-fun b!630440 () Bool)

(declare-fun e!360504 () Bool)

(declare-fun e!360501 () Bool)

(assert (=> b!630440 (= e!360504 e!360501)))

(declare-fun res!407554 () Bool)

(assert (=> b!630440 (=> (not res!407554) (not e!360501))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!630440 (= res!407554 (= (select (store (arr!18256 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!291187 () array!38046)

(assert (=> b!630440 (= lt!291187 (array!38047 (store (arr!18256 a!2986) i!1108 k0!1786) (size!18620 a!2986)))))

(declare-fun b!630441 () Bool)

(declare-fun res!407558 () Bool)

(assert (=> b!630441 (=> (not res!407558) (not e!360503))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!630441 (= res!407558 (validKeyInArray!0 (select (arr!18256 a!2986) j!136)))))

(declare-fun b!630442 () Bool)

(declare-fun res!407549 () Bool)

(assert (=> b!630442 (=> (not res!407549) (not e!360503))))

(assert (=> b!630442 (= res!407549 (validKeyInArray!0 k0!1786))))

(declare-fun b!630443 () Bool)

(declare-fun res!407555 () Bool)

(assert (=> b!630443 (=> (not res!407555) (not e!360504))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!630443 (= res!407555 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18256 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!630444 () Bool)

(declare-fun res!407559 () Bool)

(assert (=> b!630444 (=> (not res!407559) (not e!360504))))

(declare-datatypes ((List!12204 0))(
  ( (Nil!12201) (Cons!12200 (h!13248 (_ BitVec 64)) (t!18424 List!12204)) )
))
(declare-fun arrayNoDuplicates!0 (array!38046 (_ BitVec 32) List!12204) Bool)

(assert (=> b!630444 (= res!407559 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12201))))

(declare-fun b!630445 () Bool)

(declare-fun res!407560 () Bool)

(assert (=> b!630445 (=> (not res!407560) (not e!360503))))

(declare-fun arrayContainsKey!0 (array!38046 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!630445 (= res!407560 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!630446 () Bool)

(assert (=> b!630446 (= e!360503 e!360504)))

(declare-fun res!407557 () Bool)

(assert (=> b!630446 (=> (not res!407557) (not e!360504))))

(declare-datatypes ((SeekEntryResult!6652 0))(
  ( (MissingZero!6652 (index!28895 (_ BitVec 32))) (Found!6652 (index!28896 (_ BitVec 32))) (Intermediate!6652 (undefined!7464 Bool) (index!28897 (_ BitVec 32)) (x!57784 (_ BitVec 32))) (Undefined!6652) (MissingVacant!6652 (index!28898 (_ BitVec 32))) )
))
(declare-fun lt!291185 () SeekEntryResult!6652)

(assert (=> b!630446 (= res!407557 (or (= lt!291185 (MissingZero!6652 i!1108)) (= lt!291185 (MissingVacant!6652 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38046 (_ BitVec 32)) SeekEntryResult!6652)

(assert (=> b!630446 (= lt!291185 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!630447 () Bool)

(declare-fun res!407553 () Bool)

(assert (=> b!630447 (=> (not res!407553) (not e!360503))))

(assert (=> b!630447 (= res!407553 (and (= (size!18620 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18620 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18620 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!630448 () Bool)

(declare-fun e!360499 () Bool)

(declare-fun lt!291190 () SeekEntryResult!6652)

(declare-fun lt!291188 () SeekEntryResult!6652)

(assert (=> b!630448 (= e!360499 (= lt!291190 lt!291188))))

(declare-fun b!630449 () Bool)

(declare-fun e!360502 () Bool)

(assert (=> b!630449 (= e!360501 e!360502)))

(declare-fun res!407551 () Bool)

(assert (=> b!630449 (=> (not res!407551) (not e!360502))))

(assert (=> b!630449 (= res!407551 (and (= lt!291190 (Found!6652 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18256 a!2986) index!984) (select (arr!18256 a!2986) j!136))) (not (= (select (arr!18256 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38046 (_ BitVec 32)) SeekEntryResult!6652)

(assert (=> b!630449 (= lt!291190 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18256 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!630450 () Bool)

(declare-fun lt!291189 () (_ BitVec 64))

(assert (=> b!630450 (= e!360502 (not (not (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!291189 lt!291187 mask!3053) Undefined!6652))))))

(assert (=> b!630450 e!360499))

(declare-fun res!407556 () Bool)

(assert (=> b!630450 (=> (not res!407556) (not e!360499))))

(declare-fun lt!291186 () (_ BitVec 32))

(assert (=> b!630450 (= res!407556 (= lt!291188 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291186 vacantSpotIndex!68 lt!291189 lt!291187 mask!3053)))))

(assert (=> b!630450 (= lt!291188 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291186 vacantSpotIndex!68 (select (arr!18256 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!630450 (= lt!291189 (select (store (arr!18256 a!2986) i!1108 k0!1786) j!136))))

(declare-datatypes ((Unit!21123 0))(
  ( (Unit!21124) )
))
(declare-fun lt!291184 () Unit!21123)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38046 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21123)

(assert (=> b!630450 (= lt!291184 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291186 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!630450 (= lt!291186 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!630451 () Bool)

(declare-fun res!407552 () Bool)

(assert (=> b!630451 (=> (not res!407552) (not e!360504))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38046 (_ BitVec 32)) Bool)

(assert (=> b!630451 (= res!407552 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!56970 res!407550) b!630447))

(assert (= (and b!630447 res!407553) b!630441))

(assert (= (and b!630441 res!407558) b!630442))

(assert (= (and b!630442 res!407549) b!630445))

(assert (= (and b!630445 res!407560) b!630446))

(assert (= (and b!630446 res!407557) b!630451))

(assert (= (and b!630451 res!407552) b!630444))

(assert (= (and b!630444 res!407559) b!630443))

(assert (= (and b!630443 res!407555) b!630440))

(assert (= (and b!630440 res!407554) b!630449))

(assert (= (and b!630449 res!407551) b!630450))

(assert (= (and b!630450 res!407556) b!630448))

(declare-fun m!605761 () Bool)

(assert (=> start!56970 m!605761))

(declare-fun m!605763 () Bool)

(assert (=> start!56970 m!605763))

(declare-fun m!605765 () Bool)

(assert (=> b!630443 m!605765))

(declare-fun m!605767 () Bool)

(assert (=> b!630445 m!605767))

(declare-fun m!605769 () Bool)

(assert (=> b!630441 m!605769))

(assert (=> b!630441 m!605769))

(declare-fun m!605771 () Bool)

(assert (=> b!630441 m!605771))

(declare-fun m!605773 () Bool)

(assert (=> b!630449 m!605773))

(assert (=> b!630449 m!605769))

(assert (=> b!630449 m!605769))

(declare-fun m!605775 () Bool)

(assert (=> b!630449 m!605775))

(declare-fun m!605777 () Bool)

(assert (=> b!630444 m!605777))

(declare-fun m!605779 () Bool)

(assert (=> b!630446 m!605779))

(declare-fun m!605781 () Bool)

(assert (=> b!630451 m!605781))

(declare-fun m!605783 () Bool)

(assert (=> b!630440 m!605783))

(declare-fun m!605785 () Bool)

(assert (=> b!630440 m!605785))

(declare-fun m!605787 () Bool)

(assert (=> b!630450 m!605787))

(declare-fun m!605789 () Bool)

(assert (=> b!630450 m!605789))

(assert (=> b!630450 m!605769))

(assert (=> b!630450 m!605783))

(declare-fun m!605791 () Bool)

(assert (=> b!630450 m!605791))

(declare-fun m!605793 () Bool)

(assert (=> b!630450 m!605793))

(assert (=> b!630450 m!605769))

(declare-fun m!605795 () Bool)

(assert (=> b!630450 m!605795))

(declare-fun m!605797 () Bool)

(assert (=> b!630450 m!605797))

(declare-fun m!605799 () Bool)

(assert (=> b!630442 m!605799))

(check-sat (not b!630442) (not b!630451) (not b!630444) (not b!630449) (not b!630446) (not start!56970) (not b!630450) (not b!630445) (not b!630441))
(check-sat)
(get-model)

(declare-fun b!630536 () Bool)

(declare-fun c!71822 () Bool)

(declare-fun lt!291241 () (_ BitVec 64))

(assert (=> b!630536 (= c!71822 (= lt!291241 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!360547 () SeekEntryResult!6652)

(declare-fun e!360548 () SeekEntryResult!6652)

(assert (=> b!630536 (= e!360547 e!360548)))

(declare-fun b!630537 () Bool)

(declare-fun e!360549 () SeekEntryResult!6652)

(assert (=> b!630537 (= e!360549 Undefined!6652)))

(declare-fun b!630538 () Bool)

(declare-fun lt!291239 () SeekEntryResult!6652)

(assert (=> b!630538 (= e!360547 (Found!6652 (index!28897 lt!291239)))))

(declare-fun b!630539 () Bool)

(assert (=> b!630539 (= e!360548 (MissingZero!6652 (index!28897 lt!291239)))))

(declare-fun d!89333 () Bool)

(declare-fun lt!291240 () SeekEntryResult!6652)

(get-info :version)

(assert (=> d!89333 (and (or ((_ is Undefined!6652) lt!291240) (not ((_ is Found!6652) lt!291240)) (and (bvsge (index!28896 lt!291240) #b00000000000000000000000000000000) (bvslt (index!28896 lt!291240) (size!18620 a!2986)))) (or ((_ is Undefined!6652) lt!291240) ((_ is Found!6652) lt!291240) (not ((_ is MissingZero!6652) lt!291240)) (and (bvsge (index!28895 lt!291240) #b00000000000000000000000000000000) (bvslt (index!28895 lt!291240) (size!18620 a!2986)))) (or ((_ is Undefined!6652) lt!291240) ((_ is Found!6652) lt!291240) ((_ is MissingZero!6652) lt!291240) (not ((_ is MissingVacant!6652) lt!291240)) (and (bvsge (index!28898 lt!291240) #b00000000000000000000000000000000) (bvslt (index!28898 lt!291240) (size!18620 a!2986)))) (or ((_ is Undefined!6652) lt!291240) (ite ((_ is Found!6652) lt!291240) (= (select (arr!18256 a!2986) (index!28896 lt!291240)) k0!1786) (ite ((_ is MissingZero!6652) lt!291240) (= (select (arr!18256 a!2986) (index!28895 lt!291240)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6652) lt!291240) (= (select (arr!18256 a!2986) (index!28898 lt!291240)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!89333 (= lt!291240 e!360549)))

(declare-fun c!71821 () Bool)

(assert (=> d!89333 (= c!71821 (and ((_ is Intermediate!6652) lt!291239) (undefined!7464 lt!291239)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38046 (_ BitVec 32)) SeekEntryResult!6652)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89333 (= lt!291239 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!89333 (validMask!0 mask!3053)))

(assert (=> d!89333 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!291240)))

(declare-fun b!630540 () Bool)

(assert (=> b!630540 (= e!360549 e!360547)))

(assert (=> b!630540 (= lt!291241 (select (arr!18256 a!2986) (index!28897 lt!291239)))))

(declare-fun c!71820 () Bool)

(assert (=> b!630540 (= c!71820 (= lt!291241 k0!1786))))

(declare-fun b!630541 () Bool)

(assert (=> b!630541 (= e!360548 (seekKeyOrZeroReturnVacant!0 (x!57784 lt!291239) (index!28897 lt!291239) (index!28897 lt!291239) k0!1786 a!2986 mask!3053))))

(assert (= (and d!89333 c!71821) b!630537))

(assert (= (and d!89333 (not c!71821)) b!630540))

(assert (= (and b!630540 c!71820) b!630538))

(assert (= (and b!630540 (not c!71820)) b!630536))

(assert (= (and b!630536 c!71822) b!630539))

(assert (= (and b!630536 (not c!71822)) b!630541))

(declare-fun m!605881 () Bool)

(assert (=> d!89333 m!605881))

(assert (=> d!89333 m!605761))

(declare-fun m!605883 () Bool)

(assert (=> d!89333 m!605883))

(assert (=> d!89333 m!605881))

(declare-fun m!605885 () Bool)

(assert (=> d!89333 m!605885))

(declare-fun m!605887 () Bool)

(assert (=> d!89333 m!605887))

(declare-fun m!605889 () Bool)

(assert (=> d!89333 m!605889))

(declare-fun m!605891 () Bool)

(assert (=> b!630540 m!605891))

(declare-fun m!605893 () Bool)

(assert (=> b!630541 m!605893))

(assert (=> b!630446 d!89333))

(declare-fun d!89335 () Bool)

(assert (=> d!89335 (= (validKeyInArray!0 (select (arr!18256 a!2986) j!136)) (and (not (= (select (arr!18256 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18256 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!630441 d!89335))

(declare-fun b!630550 () Bool)

(declare-fun e!360556 () Bool)

(declare-fun e!360557 () Bool)

(assert (=> b!630550 (= e!360556 e!360557)))

(declare-fun lt!291250 () (_ BitVec 64))

(assert (=> b!630550 (= lt!291250 (select (arr!18256 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!291249 () Unit!21123)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38046 (_ BitVec 64) (_ BitVec 32)) Unit!21123)

(assert (=> b!630550 (= lt!291249 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!291250 #b00000000000000000000000000000000))))

(assert (=> b!630550 (arrayContainsKey!0 a!2986 lt!291250 #b00000000000000000000000000000000)))

(declare-fun lt!291248 () Unit!21123)

(assert (=> b!630550 (= lt!291248 lt!291249)))

(declare-fun res!407637 () Bool)

(assert (=> b!630550 (= res!407637 (= (seekEntryOrOpen!0 (select (arr!18256 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6652 #b00000000000000000000000000000000)))))

(assert (=> b!630550 (=> (not res!407637) (not e!360557))))

(declare-fun b!630551 () Bool)

(declare-fun e!360558 () Bool)

(assert (=> b!630551 (= e!360558 e!360556)))

(declare-fun c!71825 () Bool)

(assert (=> b!630551 (= c!71825 (validKeyInArray!0 (select (arr!18256 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!630552 () Bool)

(declare-fun call!33315 () Bool)

(assert (=> b!630552 (= e!360557 call!33315)))

(declare-fun bm!33312 () Bool)

(assert (=> bm!33312 (= call!33315 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun d!89337 () Bool)

(declare-fun res!407638 () Bool)

(assert (=> d!89337 (=> res!407638 e!360558)))

(assert (=> d!89337 (= res!407638 (bvsge #b00000000000000000000000000000000 (size!18620 a!2986)))))

(assert (=> d!89337 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!360558)))

(declare-fun b!630553 () Bool)

(assert (=> b!630553 (= e!360556 call!33315)))

(assert (= (and d!89337 (not res!407638)) b!630551))

(assert (= (and b!630551 c!71825) b!630550))

(assert (= (and b!630551 (not c!71825)) b!630553))

(assert (= (and b!630550 res!407637) b!630552))

(assert (= (or b!630552 b!630553) bm!33312))

(declare-fun m!605895 () Bool)

(assert (=> b!630550 m!605895))

(declare-fun m!605897 () Bool)

(assert (=> b!630550 m!605897))

(declare-fun m!605899 () Bool)

(assert (=> b!630550 m!605899))

(assert (=> b!630550 m!605895))

(declare-fun m!605901 () Bool)

(assert (=> b!630550 m!605901))

(assert (=> b!630551 m!605895))

(assert (=> b!630551 m!605895))

(declare-fun m!605903 () Bool)

(assert (=> b!630551 m!605903))

(declare-fun m!605905 () Bool)

(assert (=> bm!33312 m!605905))

(assert (=> b!630451 d!89337))

(declare-fun d!89339 () Bool)

(assert (=> d!89339 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!630442 d!89339))

(declare-fun d!89341 () Bool)

(assert (=> d!89341 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!56970 d!89341))

(declare-fun d!89351 () Bool)

(assert (=> d!89351 (= (array_inv!14115 a!2986) (bvsge (size!18620 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!56970 d!89351))

(declare-fun b!630596 () Bool)

(declare-fun e!360591 () SeekEntryResult!6652)

(assert (=> b!630596 (= e!360591 (Found!6652 index!984))))

(declare-fun b!630597 () Bool)

(declare-fun c!71840 () Bool)

(declare-fun lt!291274 () (_ BitVec 64))

(assert (=> b!630597 (= c!71840 (= lt!291274 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!360590 () SeekEntryResult!6652)

(assert (=> b!630597 (= e!360591 e!360590)))

(declare-fun d!89353 () Bool)

(declare-fun lt!291273 () SeekEntryResult!6652)

(assert (=> d!89353 (and (or ((_ is Undefined!6652) lt!291273) (not ((_ is Found!6652) lt!291273)) (and (bvsge (index!28896 lt!291273) #b00000000000000000000000000000000) (bvslt (index!28896 lt!291273) (size!18620 a!2986)))) (or ((_ is Undefined!6652) lt!291273) ((_ is Found!6652) lt!291273) (not ((_ is MissingVacant!6652) lt!291273)) (not (= (index!28898 lt!291273) vacantSpotIndex!68)) (and (bvsge (index!28898 lt!291273) #b00000000000000000000000000000000) (bvslt (index!28898 lt!291273) (size!18620 a!2986)))) (or ((_ is Undefined!6652) lt!291273) (ite ((_ is Found!6652) lt!291273) (= (select (arr!18256 a!2986) (index!28896 lt!291273)) (select (arr!18256 a!2986) j!136)) (and ((_ is MissingVacant!6652) lt!291273) (= (index!28898 lt!291273) vacantSpotIndex!68) (= (select (arr!18256 a!2986) (index!28898 lt!291273)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!360589 () SeekEntryResult!6652)

(assert (=> d!89353 (= lt!291273 e!360589)))

(declare-fun c!71839 () Bool)

(assert (=> d!89353 (= c!71839 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!89353 (= lt!291274 (select (arr!18256 a!2986) index!984))))

(assert (=> d!89353 (validMask!0 mask!3053)))

(assert (=> d!89353 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18256 a!2986) j!136) a!2986 mask!3053) lt!291273)))

(declare-fun b!630598 () Bool)

(assert (=> b!630598 (= e!360589 e!360591)))

(declare-fun c!71838 () Bool)

(assert (=> b!630598 (= c!71838 (= lt!291274 (select (arr!18256 a!2986) j!136)))))

(declare-fun b!630599 () Bool)

(assert (=> b!630599 (= e!360589 Undefined!6652)))

(declare-fun b!630600 () Bool)

(assert (=> b!630600 (= e!360590 (MissingVacant!6652 vacantSpotIndex!68))))

(declare-fun b!630601 () Bool)

(assert (=> b!630601 (= e!360590 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18256 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and d!89353 c!71839) b!630599))

(assert (= (and d!89353 (not c!71839)) b!630598))

(assert (= (and b!630598 c!71838) b!630596))

(assert (= (and b!630598 (not c!71838)) b!630597))

(assert (= (and b!630597 c!71840) b!630600))

(assert (= (and b!630597 (not c!71840)) b!630601))

(declare-fun m!605933 () Bool)

(assert (=> d!89353 m!605933))

(declare-fun m!605935 () Bool)

(assert (=> d!89353 m!605935))

(assert (=> d!89353 m!605773))

(assert (=> d!89353 m!605761))

(declare-fun m!605937 () Bool)

(assert (=> b!630601 m!605937))

(assert (=> b!630601 m!605937))

(assert (=> b!630601 m!605769))

(declare-fun m!605939 () Bool)

(assert (=> b!630601 m!605939))

(assert (=> b!630449 d!89353))

(declare-fun d!89363 () Bool)

(declare-fun e!360615 () Bool)

(assert (=> d!89363 e!360615))

(declare-fun res!407668 () Bool)

(assert (=> d!89363 (=> (not res!407668) (not e!360615))))

(assert (=> d!89363 (= res!407668 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18620 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18620 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18620 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18620 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18620 a!2986))))))

(declare-fun lt!291283 () Unit!21123)

(declare-fun choose!9 (array!38046 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21123)

(assert (=> d!89363 (= lt!291283 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291186 vacantSpotIndex!68 mask!3053))))

(assert (=> d!89363 (validMask!0 mask!3053)))

(assert (=> d!89363 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291186 vacantSpotIndex!68 mask!3053) lt!291283)))

(declare-fun b!630637 () Bool)

(assert (=> b!630637 (= e!360615 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291186 vacantSpotIndex!68 (select (arr!18256 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291186 vacantSpotIndex!68 (select (store (arr!18256 a!2986) i!1108 k0!1786) j!136) (array!38047 (store (arr!18256 a!2986) i!1108 k0!1786) (size!18620 a!2986)) mask!3053)))))

(assert (= (and d!89363 res!407668) b!630637))

(declare-fun m!605953 () Bool)

(assert (=> d!89363 m!605953))

(assert (=> d!89363 m!605761))

(assert (=> b!630637 m!605769))

(assert (=> b!630637 m!605783))

(assert (=> b!630637 m!605769))

(assert (=> b!630637 m!605795))

(assert (=> b!630637 m!605789))

(assert (=> b!630637 m!605789))

(declare-fun m!605955 () Bool)

(assert (=> b!630637 m!605955))

(assert (=> b!630450 d!89363))

(declare-fun b!630638 () Bool)

(declare-fun e!360618 () SeekEntryResult!6652)

(assert (=> b!630638 (= e!360618 (Found!6652 lt!291186))))

(declare-fun b!630639 () Bool)

(declare-fun c!71855 () Bool)

(declare-fun lt!291285 () (_ BitVec 64))

(assert (=> b!630639 (= c!71855 (= lt!291285 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!360617 () SeekEntryResult!6652)

(assert (=> b!630639 (= e!360618 e!360617)))

(declare-fun d!89373 () Bool)

(declare-fun lt!291284 () SeekEntryResult!6652)

(assert (=> d!89373 (and (or ((_ is Undefined!6652) lt!291284) (not ((_ is Found!6652) lt!291284)) (and (bvsge (index!28896 lt!291284) #b00000000000000000000000000000000) (bvslt (index!28896 lt!291284) (size!18620 a!2986)))) (or ((_ is Undefined!6652) lt!291284) ((_ is Found!6652) lt!291284) (not ((_ is MissingVacant!6652) lt!291284)) (not (= (index!28898 lt!291284) vacantSpotIndex!68)) (and (bvsge (index!28898 lt!291284) #b00000000000000000000000000000000) (bvslt (index!28898 lt!291284) (size!18620 a!2986)))) (or ((_ is Undefined!6652) lt!291284) (ite ((_ is Found!6652) lt!291284) (= (select (arr!18256 a!2986) (index!28896 lt!291284)) (select (arr!18256 a!2986) j!136)) (and ((_ is MissingVacant!6652) lt!291284) (= (index!28898 lt!291284) vacantSpotIndex!68) (= (select (arr!18256 a!2986) (index!28898 lt!291284)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!360616 () SeekEntryResult!6652)

(assert (=> d!89373 (= lt!291284 e!360616)))

(declare-fun c!71854 () Bool)

(assert (=> d!89373 (= c!71854 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!89373 (= lt!291285 (select (arr!18256 a!2986) lt!291186))))

(assert (=> d!89373 (validMask!0 mask!3053)))

(assert (=> d!89373 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291186 vacantSpotIndex!68 (select (arr!18256 a!2986) j!136) a!2986 mask!3053) lt!291284)))

(declare-fun b!630640 () Bool)

(assert (=> b!630640 (= e!360616 e!360618)))

(declare-fun c!71853 () Bool)

(assert (=> b!630640 (= c!71853 (= lt!291285 (select (arr!18256 a!2986) j!136)))))

(declare-fun b!630641 () Bool)

(assert (=> b!630641 (= e!360616 Undefined!6652)))

(declare-fun b!630642 () Bool)

(assert (=> b!630642 (= e!360617 (MissingVacant!6652 vacantSpotIndex!68))))

(declare-fun b!630643 () Bool)

(assert (=> b!630643 (= e!360617 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!291186 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18256 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and d!89373 c!71854) b!630641))

(assert (= (and d!89373 (not c!71854)) b!630640))

(assert (= (and b!630640 c!71853) b!630638))

(assert (= (and b!630640 (not c!71853)) b!630639))

(assert (= (and b!630639 c!71855) b!630642))

(assert (= (and b!630639 (not c!71855)) b!630643))

(declare-fun m!605957 () Bool)

(assert (=> d!89373 m!605957))

(declare-fun m!605959 () Bool)

(assert (=> d!89373 m!605959))

(declare-fun m!605961 () Bool)

(assert (=> d!89373 m!605961))

(assert (=> d!89373 m!605761))

(declare-fun m!605963 () Bool)

(assert (=> b!630643 m!605963))

(assert (=> b!630643 m!605963))

(assert (=> b!630643 m!605769))

(declare-fun m!605965 () Bool)

(assert (=> b!630643 m!605965))

(assert (=> b!630450 d!89373))

(declare-fun b!630644 () Bool)

(declare-fun e!360621 () SeekEntryResult!6652)

(assert (=> b!630644 (= e!360621 (Found!6652 index!984))))

(declare-fun b!630645 () Bool)

(declare-fun c!71858 () Bool)

(declare-fun lt!291287 () (_ BitVec 64))

(assert (=> b!630645 (= c!71858 (= lt!291287 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!360620 () SeekEntryResult!6652)

(assert (=> b!630645 (= e!360621 e!360620)))

(declare-fun lt!291286 () SeekEntryResult!6652)

(declare-fun d!89375 () Bool)

(assert (=> d!89375 (and (or ((_ is Undefined!6652) lt!291286) (not ((_ is Found!6652) lt!291286)) (and (bvsge (index!28896 lt!291286) #b00000000000000000000000000000000) (bvslt (index!28896 lt!291286) (size!18620 lt!291187)))) (or ((_ is Undefined!6652) lt!291286) ((_ is Found!6652) lt!291286) (not ((_ is MissingVacant!6652) lt!291286)) (not (= (index!28898 lt!291286) vacantSpotIndex!68)) (and (bvsge (index!28898 lt!291286) #b00000000000000000000000000000000) (bvslt (index!28898 lt!291286) (size!18620 lt!291187)))) (or ((_ is Undefined!6652) lt!291286) (ite ((_ is Found!6652) lt!291286) (= (select (arr!18256 lt!291187) (index!28896 lt!291286)) lt!291189) (and ((_ is MissingVacant!6652) lt!291286) (= (index!28898 lt!291286) vacantSpotIndex!68) (= (select (arr!18256 lt!291187) (index!28898 lt!291286)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!360619 () SeekEntryResult!6652)

(assert (=> d!89375 (= lt!291286 e!360619)))

(declare-fun c!71857 () Bool)

(assert (=> d!89375 (= c!71857 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!89375 (= lt!291287 (select (arr!18256 lt!291187) index!984))))

(assert (=> d!89375 (validMask!0 mask!3053)))

(assert (=> d!89375 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!291189 lt!291187 mask!3053) lt!291286)))

(declare-fun b!630646 () Bool)

(assert (=> b!630646 (= e!360619 e!360621)))

(declare-fun c!71856 () Bool)

(assert (=> b!630646 (= c!71856 (= lt!291287 lt!291189))))

(declare-fun b!630647 () Bool)

(assert (=> b!630647 (= e!360619 Undefined!6652)))

(declare-fun b!630648 () Bool)

(assert (=> b!630648 (= e!360620 (MissingVacant!6652 vacantSpotIndex!68))))

(declare-fun b!630649 () Bool)

(assert (=> b!630649 (= e!360620 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!291189 lt!291187 mask!3053))))

(assert (= (and d!89375 c!71857) b!630647))

(assert (= (and d!89375 (not c!71857)) b!630646))

(assert (= (and b!630646 c!71856) b!630644))

(assert (= (and b!630646 (not c!71856)) b!630645))

(assert (= (and b!630645 c!71858) b!630648))

(assert (= (and b!630645 (not c!71858)) b!630649))

(declare-fun m!605967 () Bool)

(assert (=> d!89375 m!605967))

(declare-fun m!605969 () Bool)

(assert (=> d!89375 m!605969))

(declare-fun m!605971 () Bool)

(assert (=> d!89375 m!605971))

(assert (=> d!89375 m!605761))

(assert (=> b!630649 m!605937))

(assert (=> b!630649 m!605937))

(declare-fun m!605973 () Bool)

(assert (=> b!630649 m!605973))

(assert (=> b!630450 d!89375))

(declare-fun d!89377 () Bool)

(declare-fun lt!291290 () (_ BitVec 32))

(assert (=> d!89377 (and (bvsge lt!291290 #b00000000000000000000000000000000) (bvslt lt!291290 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89377 (= lt!291290 (choose!52 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(assert (=> d!89377 (validMask!0 mask!3053)))

(assert (=> d!89377 (= (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) lt!291290)))

(declare-fun bs!19022 () Bool)

(assert (= bs!19022 d!89377))

(declare-fun m!605975 () Bool)

(assert (=> bs!19022 m!605975))

(assert (=> bs!19022 m!605761))

(assert (=> b!630450 d!89377))

(declare-fun b!630650 () Bool)

(declare-fun e!360624 () SeekEntryResult!6652)

(assert (=> b!630650 (= e!360624 (Found!6652 lt!291186))))

(declare-fun b!630651 () Bool)

(declare-fun c!71861 () Bool)

(declare-fun lt!291292 () (_ BitVec 64))

(assert (=> b!630651 (= c!71861 (= lt!291292 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!360623 () SeekEntryResult!6652)

(assert (=> b!630651 (= e!360624 e!360623)))

(declare-fun d!89379 () Bool)

(declare-fun lt!291291 () SeekEntryResult!6652)

(assert (=> d!89379 (and (or ((_ is Undefined!6652) lt!291291) (not ((_ is Found!6652) lt!291291)) (and (bvsge (index!28896 lt!291291) #b00000000000000000000000000000000) (bvslt (index!28896 lt!291291) (size!18620 lt!291187)))) (or ((_ is Undefined!6652) lt!291291) ((_ is Found!6652) lt!291291) (not ((_ is MissingVacant!6652) lt!291291)) (not (= (index!28898 lt!291291) vacantSpotIndex!68)) (and (bvsge (index!28898 lt!291291) #b00000000000000000000000000000000) (bvslt (index!28898 lt!291291) (size!18620 lt!291187)))) (or ((_ is Undefined!6652) lt!291291) (ite ((_ is Found!6652) lt!291291) (= (select (arr!18256 lt!291187) (index!28896 lt!291291)) lt!291189) (and ((_ is MissingVacant!6652) lt!291291) (= (index!28898 lt!291291) vacantSpotIndex!68) (= (select (arr!18256 lt!291187) (index!28898 lt!291291)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!360622 () SeekEntryResult!6652)

(assert (=> d!89379 (= lt!291291 e!360622)))

(declare-fun c!71860 () Bool)

(assert (=> d!89379 (= c!71860 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!89379 (= lt!291292 (select (arr!18256 lt!291187) lt!291186))))

(assert (=> d!89379 (validMask!0 mask!3053)))

(assert (=> d!89379 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291186 vacantSpotIndex!68 lt!291189 lt!291187 mask!3053) lt!291291)))

(declare-fun b!630652 () Bool)

(assert (=> b!630652 (= e!360622 e!360624)))

(declare-fun c!71859 () Bool)

(assert (=> b!630652 (= c!71859 (= lt!291292 lt!291189))))

(declare-fun b!630653 () Bool)

(assert (=> b!630653 (= e!360622 Undefined!6652)))

(declare-fun b!630654 () Bool)

(assert (=> b!630654 (= e!360623 (MissingVacant!6652 vacantSpotIndex!68))))

(declare-fun b!630655 () Bool)

(assert (=> b!630655 (= e!360623 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!291186 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!291189 lt!291187 mask!3053))))

(assert (= (and d!89379 c!71860) b!630653))

(assert (= (and d!89379 (not c!71860)) b!630652))

(assert (= (and b!630652 c!71859) b!630650))

(assert (= (and b!630652 (not c!71859)) b!630651))

(assert (= (and b!630651 c!71861) b!630654))

(assert (= (and b!630651 (not c!71861)) b!630655))

(declare-fun m!605977 () Bool)

(assert (=> d!89379 m!605977))

(declare-fun m!605979 () Bool)

(assert (=> d!89379 m!605979))

(declare-fun m!605981 () Bool)

(assert (=> d!89379 m!605981))

(assert (=> d!89379 m!605761))

(assert (=> b!630655 m!605963))

(assert (=> b!630655 m!605963))

(declare-fun m!605983 () Bool)

(assert (=> b!630655 m!605983))

(assert (=> b!630450 d!89379))

(declare-fun d!89383 () Bool)

(declare-fun res!407673 () Bool)

(declare-fun e!360629 () Bool)

(assert (=> d!89383 (=> res!407673 e!360629)))

(assert (=> d!89383 (= res!407673 (= (select (arr!18256 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!89383 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!360629)))

(declare-fun b!630660 () Bool)

(declare-fun e!360630 () Bool)

(assert (=> b!630660 (= e!360629 e!360630)))

(declare-fun res!407674 () Bool)

(assert (=> b!630660 (=> (not res!407674) (not e!360630))))

(assert (=> b!630660 (= res!407674 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18620 a!2986)))))

(declare-fun b!630661 () Bool)

(assert (=> b!630661 (= e!360630 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!89383 (not res!407673)) b!630660))

(assert (= (and b!630660 res!407674) b!630661))

(assert (=> d!89383 m!605895))

(declare-fun m!605985 () Bool)

(assert (=> b!630661 m!605985))

(assert (=> b!630445 d!89383))

(declare-fun bm!33327 () Bool)

(declare-fun call!33330 () Bool)

(declare-fun c!71873 () Bool)

(assert (=> bm!33327 (= call!33330 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!71873 (Cons!12200 (select (arr!18256 a!2986) #b00000000000000000000000000000000) Nil!12201) Nil!12201)))))

(declare-fun b!630699 () Bool)

(declare-fun e!360658 () Bool)

(declare-fun e!360660 () Bool)

(assert (=> b!630699 (= e!360658 e!360660)))

(declare-fun res!407692 () Bool)

(assert (=> b!630699 (=> (not res!407692) (not e!360660))))

(declare-fun e!360659 () Bool)

(assert (=> b!630699 (= res!407692 (not e!360659))))

(declare-fun res!407690 () Bool)

(assert (=> b!630699 (=> (not res!407690) (not e!360659))))

(assert (=> b!630699 (= res!407690 (validKeyInArray!0 (select (arr!18256 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!630700 () Bool)

(declare-fun e!360657 () Bool)

(assert (=> b!630700 (= e!360657 call!33330)))

(declare-fun b!630701 () Bool)

(declare-fun contains!3062 (List!12204 (_ BitVec 64)) Bool)

(assert (=> b!630701 (= e!360659 (contains!3062 Nil!12201 (select (arr!18256 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!630702 () Bool)

(assert (=> b!630702 (= e!360657 call!33330)))

(declare-fun d!89387 () Bool)

(declare-fun res!407691 () Bool)

(assert (=> d!89387 (=> res!407691 e!360658)))

(assert (=> d!89387 (= res!407691 (bvsge #b00000000000000000000000000000000 (size!18620 a!2986)))))

(assert (=> d!89387 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12201) e!360658)))

(declare-fun b!630703 () Bool)

(assert (=> b!630703 (= e!360660 e!360657)))

(assert (=> b!630703 (= c!71873 (validKeyInArray!0 (select (arr!18256 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!89387 (not res!407691)) b!630699))

(assert (= (and b!630699 res!407690) b!630701))

(assert (= (and b!630699 res!407692) b!630703))

(assert (= (and b!630703 c!71873) b!630702))

(assert (= (and b!630703 (not c!71873)) b!630700))

(assert (= (or b!630702 b!630700) bm!33327))

(assert (=> bm!33327 m!605895))

(declare-fun m!605991 () Bool)

(assert (=> bm!33327 m!605991))

(assert (=> b!630699 m!605895))

(assert (=> b!630699 m!605895))

(assert (=> b!630699 m!605903))

(assert (=> b!630701 m!605895))

(assert (=> b!630701 m!605895))

(declare-fun m!605993 () Bool)

(assert (=> b!630701 m!605993))

(assert (=> b!630703 m!605895))

(assert (=> b!630703 m!605895))

(assert (=> b!630703 m!605903))

(assert (=> b!630444 d!89387))

(check-sat (not b!630699) (not d!89333) (not b!630550) (not bm!33327) (not bm!33312) (not d!89373) (not d!89353) (not d!89377) (not b!630661) (not b!630541) (not b!630655) (not b!630643) (not b!630637) (not b!630601) (not b!630703) (not d!89379) (not b!630649) (not b!630701) (not d!89375) (not d!89363) (not b!630551))
(check-sat)
