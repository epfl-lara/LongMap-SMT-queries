; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54696 () Bool)

(assert start!54696)

(declare-fun b!597615 () Bool)

(declare-fun res!383031 () Bool)

(declare-fun e!341508 () Bool)

(assert (=> b!597615 (=> (not res!383031) (not e!341508))))

(declare-datatypes ((array!37032 0))(
  ( (array!37033 (arr!17776 (Array (_ BitVec 32) (_ BitVec 64))) (size!18140 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37032)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37032 (_ BitVec 32)) Bool)

(assert (=> b!597615 (= res!383031 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!597616 () Bool)

(declare-fun e!341514 () Bool)

(declare-fun e!341506 () Bool)

(assert (=> b!597616 (= e!341514 e!341506)))

(declare-fun res!383038 () Bool)

(assert (=> b!597616 (=> (not res!383038) (not e!341506))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6172 0))(
  ( (MissingZero!6172 (index!26939 (_ BitVec 32))) (Found!6172 (index!26940 (_ BitVec 32))) (Intermediate!6172 (undefined!6984 Bool) (index!26941 (_ BitVec 32)) (x!55892 (_ BitVec 32))) (Undefined!6172) (MissingVacant!6172 (index!26942 (_ BitVec 32))) )
))
(declare-fun lt!271511 () SeekEntryResult!6172)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!597616 (= res!383038 (and (= lt!271511 (Found!6172 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17776 a!2986) index!984) (select (arr!17776 a!2986) j!136))) (not (= (select (arr!17776 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37032 (_ BitVec 32)) SeekEntryResult!6172)

(assert (=> b!597616 (= lt!271511 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17776 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!597617 () Bool)

(declare-fun res!383032 () Bool)

(assert (=> b!597617 (=> (not res!383032) (not e!341508))))

(declare-datatypes ((List!11724 0))(
  ( (Nil!11721) (Cons!11720 (h!12768 (_ BitVec 64)) (t!17944 List!11724)) )
))
(declare-fun arrayNoDuplicates!0 (array!37032 (_ BitVec 32) List!11724) Bool)

(assert (=> b!597617 (= res!383032 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11721))))

(declare-fun b!597618 () Bool)

(declare-fun e!341505 () Bool)

(assert (=> b!597618 (= e!341505 e!341508)))

(declare-fun res!383044 () Bool)

(assert (=> b!597618 (=> (not res!383044) (not e!341508))))

(declare-fun lt!271513 () SeekEntryResult!6172)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!597618 (= res!383044 (or (= lt!271513 (MissingZero!6172 i!1108)) (= lt!271513 (MissingVacant!6172 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37032 (_ BitVec 32)) SeekEntryResult!6172)

(assert (=> b!597618 (= lt!271513 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!597619 () Bool)

(declare-fun e!341510 () Bool)

(assert (=> b!597619 (= e!341506 (not e!341510))))

(declare-fun res!383040 () Bool)

(assert (=> b!597619 (=> res!383040 e!341510)))

(declare-fun lt!271509 () SeekEntryResult!6172)

(assert (=> b!597619 (= res!383040 (not (= lt!271509 (Found!6172 index!984))))))

(declare-datatypes ((Unit!18781 0))(
  ( (Unit!18782) )
))
(declare-fun lt!271510 () Unit!18781)

(declare-fun e!341504 () Unit!18781)

(assert (=> b!597619 (= lt!271510 e!341504)))

(declare-fun c!67661 () Bool)

(assert (=> b!597619 (= c!67661 (= lt!271509 Undefined!6172))))

(declare-fun lt!271502 () array!37032)

(declare-fun lt!271505 () (_ BitVec 64))

(assert (=> b!597619 (= lt!271509 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!271505 lt!271502 mask!3053))))

(declare-fun e!341513 () Bool)

(assert (=> b!597619 e!341513))

(declare-fun res!383034 () Bool)

(assert (=> b!597619 (=> (not res!383034) (not e!341513))))

(declare-fun lt!271506 () SeekEntryResult!6172)

(declare-fun lt!271504 () (_ BitVec 32))

(assert (=> b!597619 (= res!383034 (= lt!271506 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271504 vacantSpotIndex!68 lt!271505 lt!271502 mask!3053)))))

(assert (=> b!597619 (= lt!271506 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271504 vacantSpotIndex!68 (select (arr!17776 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!597619 (= lt!271505 (select (store (arr!17776 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!271507 () Unit!18781)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37032 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18781)

(assert (=> b!597619 (= lt!271507 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!271504 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!597619 (= lt!271504 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!597620 () Bool)

(declare-fun res!383030 () Bool)

(assert (=> b!597620 (=> (not res!383030) (not e!341505))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!597620 (= res!383030 (validKeyInArray!0 (select (arr!17776 a!2986) j!136)))))

(declare-fun b!597621 () Bool)

(declare-fun e!341502 () Bool)

(declare-fun e!341512 () Bool)

(assert (=> b!597621 (= e!341502 e!341512)))

(declare-fun res!383036 () Bool)

(assert (=> b!597621 (=> res!383036 e!341512)))

(assert (=> b!597621 (= res!383036 (or (bvsgt #b00000000000000000000000000000000 (size!18140 a!2986)) (bvsge (size!18140 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!597621 (arrayNoDuplicates!0 lt!271502 #b00000000000000000000000000000000 Nil!11721)))

(declare-fun lt!271503 () Unit!18781)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37032 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11724) Unit!18781)

(assert (=> b!597621 (= lt!271503 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11721))))

(declare-fun arrayContainsKey!0 (array!37032 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!597621 (arrayContainsKey!0 lt!271502 (select (arr!17776 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!271512 () Unit!18781)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37032 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18781)

(assert (=> b!597621 (= lt!271512 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!271502 (select (arr!17776 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!597622 () Bool)

(declare-fun res!383039 () Bool)

(assert (=> b!597622 (=> (not res!383039) (not e!341505))))

(assert (=> b!597622 (= res!383039 (validKeyInArray!0 k0!1786))))

(declare-fun b!597623 () Bool)

(assert (=> b!597623 (= e!341513 (= lt!271511 lt!271506))))

(declare-fun b!597624 () Bool)

(declare-fun Unit!18783 () Unit!18781)

(assert (=> b!597624 (= e!341504 Unit!18783)))

(assert (=> b!597624 false))

(declare-fun b!597625 () Bool)

(declare-fun res!383041 () Bool)

(assert (=> b!597625 (=> (not res!383041) (not e!341505))))

(assert (=> b!597625 (= res!383041 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!597626 () Bool)

(declare-fun res!383046 () Bool)

(assert (=> b!597626 (=> (not res!383046) (not e!341505))))

(assert (=> b!597626 (= res!383046 (and (= (size!18140 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18140 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18140 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!383047 () Bool)

(assert (=> start!54696 (=> (not res!383047) (not e!341505))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54696 (= res!383047 (validMask!0 mask!3053))))

(assert (=> start!54696 e!341505))

(assert (=> start!54696 true))

(declare-fun array_inv!13635 (array!37032) Bool)

(assert (=> start!54696 (array_inv!13635 a!2986)))

(declare-fun b!597627 () Bool)

(assert (=> b!597627 (= e!341510 e!341502)))

(declare-fun res!383042 () Bool)

(assert (=> b!597627 (=> res!383042 e!341502)))

(declare-fun lt!271508 () (_ BitVec 64))

(assert (=> b!597627 (= res!383042 (or (not (= (select (arr!17776 a!2986) j!136) lt!271505)) (not (= (select (arr!17776 a!2986) j!136) lt!271508)) (bvsge j!136 index!984)))))

(declare-fun e!341511 () Bool)

(assert (=> b!597627 e!341511))

(declare-fun res!383037 () Bool)

(assert (=> b!597627 (=> (not res!383037) (not e!341511))))

(assert (=> b!597627 (= res!383037 (= lt!271508 (select (arr!17776 a!2986) j!136)))))

(assert (=> b!597627 (= lt!271508 (select (store (arr!17776 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!597628 () Bool)

(assert (=> b!597628 (= e!341508 e!341514)))

(declare-fun res!383043 () Bool)

(assert (=> b!597628 (=> (not res!383043) (not e!341514))))

(assert (=> b!597628 (= res!383043 (= (select (store (arr!17776 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!597628 (= lt!271502 (array!37033 (store (arr!17776 a!2986) i!1108 k0!1786) (size!18140 a!2986)))))

(declare-fun e!341503 () Bool)

(declare-fun b!597629 () Bool)

(assert (=> b!597629 (= e!341503 (arrayContainsKey!0 lt!271502 (select (arr!17776 a!2986) j!136) index!984))))

(declare-fun b!597630 () Bool)

(declare-fun e!341509 () Bool)

(assert (=> b!597630 (= e!341509 e!341503)))

(declare-fun res!383033 () Bool)

(assert (=> b!597630 (=> (not res!383033) (not e!341503))))

(assert (=> b!597630 (= res!383033 (arrayContainsKey!0 lt!271502 (select (arr!17776 a!2986) j!136) j!136))))

(declare-fun b!597631 () Bool)

(declare-fun res!383045 () Bool)

(assert (=> b!597631 (=> (not res!383045) (not e!341508))))

(assert (=> b!597631 (= res!383045 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17776 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!597632 () Bool)

(declare-fun noDuplicate!274 (List!11724) Bool)

(assert (=> b!597632 (= e!341512 (noDuplicate!274 Nil!11721))))

(declare-fun b!597633 () Bool)

(declare-fun Unit!18784 () Unit!18781)

(assert (=> b!597633 (= e!341504 Unit!18784)))

(declare-fun b!597634 () Bool)

(assert (=> b!597634 (= e!341511 e!341509)))

(declare-fun res!383035 () Bool)

(assert (=> b!597634 (=> res!383035 e!341509)))

(assert (=> b!597634 (= res!383035 (or (not (= (select (arr!17776 a!2986) j!136) lt!271505)) (not (= (select (arr!17776 a!2986) j!136) lt!271508)) (bvsge j!136 index!984)))))

(assert (= (and start!54696 res!383047) b!597626))

(assert (= (and b!597626 res!383046) b!597620))

(assert (= (and b!597620 res!383030) b!597622))

(assert (= (and b!597622 res!383039) b!597625))

(assert (= (and b!597625 res!383041) b!597618))

(assert (= (and b!597618 res!383044) b!597615))

(assert (= (and b!597615 res!383031) b!597617))

(assert (= (and b!597617 res!383032) b!597631))

(assert (= (and b!597631 res!383045) b!597628))

(assert (= (and b!597628 res!383043) b!597616))

(assert (= (and b!597616 res!383038) b!597619))

(assert (= (and b!597619 res!383034) b!597623))

(assert (= (and b!597619 c!67661) b!597624))

(assert (= (and b!597619 (not c!67661)) b!597633))

(assert (= (and b!597619 (not res!383040)) b!597627))

(assert (= (and b!597627 res!383037) b!597634))

(assert (= (and b!597634 (not res!383035)) b!597630))

(assert (= (and b!597630 res!383033) b!597629))

(assert (= (and b!597627 (not res!383042)) b!597621))

(assert (= (and b!597621 (not res!383036)) b!597632))

(declare-fun m!575225 () Bool)

(assert (=> b!597631 m!575225))

(declare-fun m!575227 () Bool)

(assert (=> b!597618 m!575227))

(declare-fun m!575229 () Bool)

(assert (=> start!54696 m!575229))

(declare-fun m!575231 () Bool)

(assert (=> start!54696 m!575231))

(declare-fun m!575233 () Bool)

(assert (=> b!597617 m!575233))

(declare-fun m!575235 () Bool)

(assert (=> b!597616 m!575235))

(declare-fun m!575237 () Bool)

(assert (=> b!597616 m!575237))

(assert (=> b!597616 m!575237))

(declare-fun m!575239 () Bool)

(assert (=> b!597616 m!575239))

(assert (=> b!597620 m!575237))

(assert (=> b!597620 m!575237))

(declare-fun m!575241 () Bool)

(assert (=> b!597620 m!575241))

(declare-fun m!575243 () Bool)

(assert (=> b!597622 m!575243))

(declare-fun m!575245 () Bool)

(assert (=> b!597615 m!575245))

(assert (=> b!597630 m!575237))

(assert (=> b!597630 m!575237))

(declare-fun m!575247 () Bool)

(assert (=> b!597630 m!575247))

(declare-fun m!575249 () Bool)

(assert (=> b!597632 m!575249))

(assert (=> b!597629 m!575237))

(assert (=> b!597629 m!575237))

(declare-fun m!575251 () Bool)

(assert (=> b!597629 m!575251))

(assert (=> b!597634 m!575237))

(assert (=> b!597621 m!575237))

(declare-fun m!575253 () Bool)

(assert (=> b!597621 m!575253))

(assert (=> b!597621 m!575237))

(declare-fun m!575255 () Bool)

(assert (=> b!597621 m!575255))

(assert (=> b!597621 m!575237))

(declare-fun m!575257 () Bool)

(assert (=> b!597621 m!575257))

(declare-fun m!575259 () Bool)

(assert (=> b!597621 m!575259))

(declare-fun m!575261 () Bool)

(assert (=> b!597628 m!575261))

(declare-fun m!575263 () Bool)

(assert (=> b!597628 m!575263))

(declare-fun m!575265 () Bool)

(assert (=> b!597625 m!575265))

(assert (=> b!597627 m!575237))

(assert (=> b!597627 m!575261))

(declare-fun m!575267 () Bool)

(assert (=> b!597627 m!575267))

(declare-fun m!575269 () Bool)

(assert (=> b!597619 m!575269))

(declare-fun m!575271 () Bool)

(assert (=> b!597619 m!575271))

(declare-fun m!575273 () Bool)

(assert (=> b!597619 m!575273))

(assert (=> b!597619 m!575237))

(assert (=> b!597619 m!575261))

(assert (=> b!597619 m!575237))

(declare-fun m!575275 () Bool)

(assert (=> b!597619 m!575275))

(declare-fun m!575277 () Bool)

(assert (=> b!597619 m!575277))

(declare-fun m!575279 () Bool)

(assert (=> b!597619 m!575279))

(check-sat (not b!597621) (not b!597632) (not b!597630) (not b!597619) (not b!597618) (not b!597615) (not b!597622) (not b!597617) (not b!597616) (not b!597620) (not b!597629) (not b!597625) (not start!54696))
(check-sat)
(get-model)

(declare-fun d!86949 () Bool)

(assert (=> d!86949 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!54696 d!86949))

(declare-fun d!86951 () Bool)

(assert (=> d!86951 (= (array_inv!13635 a!2986) (bvsge (size!18140 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!54696 d!86951))

(declare-fun d!86953 () Bool)

(assert (=> d!86953 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!597622 d!86953))

(declare-fun b!597765 () Bool)

(declare-fun e!341603 () Bool)

(declare-fun call!32931 () Bool)

(assert (=> b!597765 (= e!341603 call!32931)))

(declare-fun b!597766 () Bool)

(declare-fun e!341601 () Bool)

(assert (=> b!597766 (= e!341601 e!341603)))

(declare-fun c!67670 () Bool)

(assert (=> b!597766 (= c!67670 (validKeyInArray!0 (select (arr!17776 lt!271502) #b00000000000000000000000000000000)))))

(declare-fun b!597767 () Bool)

(assert (=> b!597767 (= e!341603 call!32931)))

(declare-fun b!597768 () Bool)

(declare-fun e!341604 () Bool)

(assert (=> b!597768 (= e!341604 e!341601)))

(declare-fun res!383163 () Bool)

(assert (=> b!597768 (=> (not res!383163) (not e!341601))))

(declare-fun e!341602 () Bool)

(assert (=> b!597768 (= res!383163 (not e!341602))))

(declare-fun res!383162 () Bool)

(assert (=> b!597768 (=> (not res!383162) (not e!341602))))

(assert (=> b!597768 (= res!383162 (validKeyInArray!0 (select (arr!17776 lt!271502) #b00000000000000000000000000000000)))))

(declare-fun d!86955 () Bool)

(declare-fun res!383164 () Bool)

(assert (=> d!86955 (=> res!383164 e!341604)))

(assert (=> d!86955 (= res!383164 (bvsge #b00000000000000000000000000000000 (size!18140 lt!271502)))))

(assert (=> d!86955 (= (arrayNoDuplicates!0 lt!271502 #b00000000000000000000000000000000 Nil!11721) e!341604)))

(declare-fun b!597769 () Bool)

(declare-fun contains!2929 (List!11724 (_ BitVec 64)) Bool)

(assert (=> b!597769 (= e!341602 (contains!2929 Nil!11721 (select (arr!17776 lt!271502) #b00000000000000000000000000000000)))))

(declare-fun bm!32928 () Bool)

(assert (=> bm!32928 (= call!32931 (arrayNoDuplicates!0 lt!271502 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!67670 (Cons!11720 (select (arr!17776 lt!271502) #b00000000000000000000000000000000) Nil!11721) Nil!11721)))))

(assert (= (and d!86955 (not res!383164)) b!597768))

(assert (= (and b!597768 res!383162) b!597769))

(assert (= (and b!597768 res!383163) b!597766))

(assert (= (and b!597766 c!67670) b!597765))

(assert (= (and b!597766 (not c!67670)) b!597767))

(assert (= (or b!597765 b!597767) bm!32928))

(declare-fun m!575393 () Bool)

(assert (=> b!597766 m!575393))

(assert (=> b!597766 m!575393))

(declare-fun m!575395 () Bool)

(assert (=> b!597766 m!575395))

(assert (=> b!597768 m!575393))

(assert (=> b!597768 m!575393))

(assert (=> b!597768 m!575395))

(assert (=> b!597769 m!575393))

(assert (=> b!597769 m!575393))

(declare-fun m!575397 () Bool)

(assert (=> b!597769 m!575397))

(assert (=> bm!32928 m!575393))

(declare-fun m!575399 () Bool)

(assert (=> bm!32928 m!575399))

(assert (=> b!597621 d!86955))

(declare-fun d!86957 () Bool)

(declare-fun e!341607 () Bool)

(assert (=> d!86957 e!341607))

(declare-fun res!383167 () Bool)

(assert (=> d!86957 (=> (not res!383167) (not e!341607))))

(assert (=> d!86957 (= res!383167 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18140 a!2986))))))

(declare-fun lt!271588 () Unit!18781)

(declare-fun choose!41 (array!37032 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11724) Unit!18781)

(assert (=> d!86957 (= lt!271588 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11721))))

(assert (=> d!86957 (bvslt (size!18140 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!86957 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11721) lt!271588)))

(declare-fun b!597772 () Bool)

(assert (=> b!597772 (= e!341607 (arrayNoDuplicates!0 (array!37033 (store (arr!17776 a!2986) i!1108 k0!1786) (size!18140 a!2986)) #b00000000000000000000000000000000 Nil!11721))))

(assert (= (and d!86957 res!383167) b!597772))

(declare-fun m!575401 () Bool)

(assert (=> d!86957 m!575401))

(assert (=> b!597772 m!575261))

(declare-fun m!575403 () Bool)

(assert (=> b!597772 m!575403))

(assert (=> b!597621 d!86957))

(declare-fun d!86959 () Bool)

(declare-fun res!383172 () Bool)

(declare-fun e!341612 () Bool)

(assert (=> d!86959 (=> res!383172 e!341612)))

(assert (=> d!86959 (= res!383172 (= (select (arr!17776 lt!271502) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17776 a!2986) j!136)))))

(assert (=> d!86959 (= (arrayContainsKey!0 lt!271502 (select (arr!17776 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!341612)))

(declare-fun b!597777 () Bool)

(declare-fun e!341613 () Bool)

(assert (=> b!597777 (= e!341612 e!341613)))

(declare-fun res!383173 () Bool)

(assert (=> b!597777 (=> (not res!383173) (not e!341613))))

(assert (=> b!597777 (= res!383173 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18140 lt!271502)))))

(declare-fun b!597778 () Bool)

(assert (=> b!597778 (= e!341613 (arrayContainsKey!0 lt!271502 (select (arr!17776 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!86959 (not res!383172)) b!597777))

(assert (= (and b!597777 res!383173) b!597778))

(declare-fun m!575405 () Bool)

(assert (=> d!86959 m!575405))

(assert (=> b!597778 m!575237))

(declare-fun m!575407 () Bool)

(assert (=> b!597778 m!575407))

(assert (=> b!597621 d!86959))

(declare-fun d!86961 () Bool)

(assert (=> d!86961 (arrayContainsKey!0 lt!271502 (select (arr!17776 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!271591 () Unit!18781)

(declare-fun choose!114 (array!37032 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18781)

(assert (=> d!86961 (= lt!271591 (choose!114 lt!271502 (select (arr!17776 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!86961 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!86961 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!271502 (select (arr!17776 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!271591)))

(declare-fun bs!18392 () Bool)

(assert (= bs!18392 d!86961))

(assert (=> bs!18392 m!575237))

(assert (=> bs!18392 m!575255))

(assert (=> bs!18392 m!575237))

(declare-fun m!575409 () Bool)

(assert (=> bs!18392 m!575409))

(assert (=> b!597621 d!86961))

(declare-fun d!86963 () Bool)

(declare-fun res!383178 () Bool)

(declare-fun e!341618 () Bool)

(assert (=> d!86963 (=> res!383178 e!341618)))

(get-info :version)

(assert (=> d!86963 (= res!383178 ((_ is Nil!11721) Nil!11721))))

(assert (=> d!86963 (= (noDuplicate!274 Nil!11721) e!341618)))

(declare-fun b!597783 () Bool)

(declare-fun e!341619 () Bool)

(assert (=> b!597783 (= e!341618 e!341619)))

(declare-fun res!383179 () Bool)

(assert (=> b!597783 (=> (not res!383179) (not e!341619))))

(assert (=> b!597783 (= res!383179 (not (contains!2929 (t!17944 Nil!11721) (h!12768 Nil!11721))))))

(declare-fun b!597784 () Bool)

(assert (=> b!597784 (= e!341619 (noDuplicate!274 (t!17944 Nil!11721)))))

(assert (= (and d!86963 (not res!383178)) b!597783))

(assert (= (and b!597783 res!383179) b!597784))

(declare-fun m!575411 () Bool)

(assert (=> b!597783 m!575411))

(declare-fun m!575413 () Bool)

(assert (=> b!597784 m!575413))

(assert (=> b!597632 d!86963))

(declare-fun d!86965 () Bool)

(assert (=> d!86965 (= (validKeyInArray!0 (select (arr!17776 a!2986) j!136)) (and (not (= (select (arr!17776 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17776 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!597620 d!86965))

(declare-fun d!86967 () Bool)

(declare-fun e!341622 () Bool)

(assert (=> d!86967 e!341622))

(declare-fun res!383182 () Bool)

(assert (=> d!86967 (=> (not res!383182) (not e!341622))))

(assert (=> d!86967 (= res!383182 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18140 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18140 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18140 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18140 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18140 a!2986))))))

(declare-fun lt!271594 () Unit!18781)

(declare-fun choose!9 (array!37032 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18781)

(assert (=> d!86967 (= lt!271594 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!271504 vacantSpotIndex!68 mask!3053))))

(assert (=> d!86967 (validMask!0 mask!3053)))

(assert (=> d!86967 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!271504 vacantSpotIndex!68 mask!3053) lt!271594)))

(declare-fun b!597787 () Bool)

(assert (=> b!597787 (= e!341622 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271504 vacantSpotIndex!68 (select (arr!17776 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271504 vacantSpotIndex!68 (select (store (arr!17776 a!2986) i!1108 k0!1786) j!136) (array!37033 (store (arr!17776 a!2986) i!1108 k0!1786) (size!18140 a!2986)) mask!3053)))))

(assert (= (and d!86967 res!383182) b!597787))

(declare-fun m!575415 () Bool)

(assert (=> d!86967 m!575415))

(assert (=> d!86967 m!575229))

(assert (=> b!597787 m!575237))

(assert (=> b!597787 m!575275))

(assert (=> b!597787 m!575271))

(declare-fun m!575417 () Bool)

(assert (=> b!597787 m!575417))

(assert (=> b!597787 m!575271))

(assert (=> b!597787 m!575261))

(assert (=> b!597787 m!575237))

(assert (=> b!597619 d!86967))

(declare-fun b!597814 () Bool)

(declare-fun e!341639 () SeekEntryResult!6172)

(declare-fun e!341637 () SeekEntryResult!6172)

(assert (=> b!597814 (= e!341639 e!341637)))

(declare-fun c!67683 () Bool)

(declare-fun lt!271603 () (_ BitVec 64))

(assert (=> b!597814 (= c!67683 (= lt!271603 lt!271505))))

(declare-fun b!597815 () Bool)

(declare-fun c!67685 () Bool)

(assert (=> b!597815 (= c!67685 (= lt!271603 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!341638 () SeekEntryResult!6172)

(assert (=> b!597815 (= e!341637 e!341638)))

(declare-fun b!597816 () Bool)

(assert (=> b!597816 (= e!341638 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!271504 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!271505 lt!271502 mask!3053))))

(declare-fun d!86969 () Bool)

(declare-fun lt!271604 () SeekEntryResult!6172)

(assert (=> d!86969 (and (or ((_ is Undefined!6172) lt!271604) (not ((_ is Found!6172) lt!271604)) (and (bvsge (index!26940 lt!271604) #b00000000000000000000000000000000) (bvslt (index!26940 lt!271604) (size!18140 lt!271502)))) (or ((_ is Undefined!6172) lt!271604) ((_ is Found!6172) lt!271604) (not ((_ is MissingVacant!6172) lt!271604)) (not (= (index!26942 lt!271604) vacantSpotIndex!68)) (and (bvsge (index!26942 lt!271604) #b00000000000000000000000000000000) (bvslt (index!26942 lt!271604) (size!18140 lt!271502)))) (or ((_ is Undefined!6172) lt!271604) (ite ((_ is Found!6172) lt!271604) (= (select (arr!17776 lt!271502) (index!26940 lt!271604)) lt!271505) (and ((_ is MissingVacant!6172) lt!271604) (= (index!26942 lt!271604) vacantSpotIndex!68) (= (select (arr!17776 lt!271502) (index!26942 lt!271604)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86969 (= lt!271604 e!341639)))

(declare-fun c!67684 () Bool)

(assert (=> d!86969 (= c!67684 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!86969 (= lt!271603 (select (arr!17776 lt!271502) lt!271504))))

(assert (=> d!86969 (validMask!0 mask!3053)))

(assert (=> d!86969 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271504 vacantSpotIndex!68 lt!271505 lt!271502 mask!3053) lt!271604)))

(declare-fun b!597817 () Bool)

(assert (=> b!597817 (= e!341639 Undefined!6172)))

(declare-fun b!597818 () Bool)

(assert (=> b!597818 (= e!341638 (MissingVacant!6172 vacantSpotIndex!68))))

(declare-fun b!597819 () Bool)

(assert (=> b!597819 (= e!341637 (Found!6172 lt!271504))))

(assert (= (and d!86969 c!67684) b!597817))

(assert (= (and d!86969 (not c!67684)) b!597814))

(assert (= (and b!597814 c!67683) b!597819))

(assert (= (and b!597814 (not c!67683)) b!597815))

(assert (= (and b!597815 c!67685) b!597818))

(assert (= (and b!597815 (not c!67685)) b!597816))

(declare-fun m!575419 () Bool)

(assert (=> b!597816 m!575419))

(assert (=> b!597816 m!575419))

(declare-fun m!575421 () Bool)

(assert (=> b!597816 m!575421))

(declare-fun m!575423 () Bool)

(assert (=> d!86969 m!575423))

(declare-fun m!575425 () Bool)

(assert (=> d!86969 m!575425))

(declare-fun m!575427 () Bool)

(assert (=> d!86969 m!575427))

(assert (=> d!86969 m!575229))

(assert (=> b!597619 d!86969))

(declare-fun b!597828 () Bool)

(declare-fun e!341648 () SeekEntryResult!6172)

(declare-fun e!341646 () SeekEntryResult!6172)

(assert (=> b!597828 (= e!341648 e!341646)))

(declare-fun c!67688 () Bool)

(declare-fun lt!271605 () (_ BitVec 64))

(assert (=> b!597828 (= c!67688 (= lt!271605 (select (arr!17776 a!2986) j!136)))))

(declare-fun b!597829 () Bool)

(declare-fun c!67690 () Bool)

(assert (=> b!597829 (= c!67690 (= lt!271605 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!341647 () SeekEntryResult!6172)

(assert (=> b!597829 (= e!341646 e!341647)))

(declare-fun b!597830 () Bool)

(assert (=> b!597830 (= e!341647 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!271504 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!17776 a!2986) j!136) a!2986 mask!3053))))

(declare-fun d!86979 () Bool)

(declare-fun lt!271606 () SeekEntryResult!6172)

(assert (=> d!86979 (and (or ((_ is Undefined!6172) lt!271606) (not ((_ is Found!6172) lt!271606)) (and (bvsge (index!26940 lt!271606) #b00000000000000000000000000000000) (bvslt (index!26940 lt!271606) (size!18140 a!2986)))) (or ((_ is Undefined!6172) lt!271606) ((_ is Found!6172) lt!271606) (not ((_ is MissingVacant!6172) lt!271606)) (not (= (index!26942 lt!271606) vacantSpotIndex!68)) (and (bvsge (index!26942 lt!271606) #b00000000000000000000000000000000) (bvslt (index!26942 lt!271606) (size!18140 a!2986)))) (or ((_ is Undefined!6172) lt!271606) (ite ((_ is Found!6172) lt!271606) (= (select (arr!17776 a!2986) (index!26940 lt!271606)) (select (arr!17776 a!2986) j!136)) (and ((_ is MissingVacant!6172) lt!271606) (= (index!26942 lt!271606) vacantSpotIndex!68) (= (select (arr!17776 a!2986) (index!26942 lt!271606)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86979 (= lt!271606 e!341648)))

(declare-fun c!67689 () Bool)

(assert (=> d!86979 (= c!67689 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!86979 (= lt!271605 (select (arr!17776 a!2986) lt!271504))))

(assert (=> d!86979 (validMask!0 mask!3053)))

(assert (=> d!86979 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271504 vacantSpotIndex!68 (select (arr!17776 a!2986) j!136) a!2986 mask!3053) lt!271606)))

(declare-fun b!597831 () Bool)

(assert (=> b!597831 (= e!341648 Undefined!6172)))

(declare-fun b!597832 () Bool)

(assert (=> b!597832 (= e!341647 (MissingVacant!6172 vacantSpotIndex!68))))

(declare-fun b!597833 () Bool)

(assert (=> b!597833 (= e!341646 (Found!6172 lt!271504))))

(assert (= (and d!86979 c!67689) b!597831))

(assert (= (and d!86979 (not c!67689)) b!597828))

(assert (= (and b!597828 c!67688) b!597833))

(assert (= (and b!597828 (not c!67688)) b!597829))

(assert (= (and b!597829 c!67690) b!597832))

(assert (= (and b!597829 (not c!67690)) b!597830))

(assert (=> b!597830 m!575419))

(assert (=> b!597830 m!575419))

(assert (=> b!597830 m!575237))

(declare-fun m!575429 () Bool)

(assert (=> b!597830 m!575429))

(declare-fun m!575431 () Bool)

(assert (=> d!86979 m!575431))

(declare-fun m!575433 () Bool)

(assert (=> d!86979 m!575433))

(declare-fun m!575435 () Bool)

(assert (=> d!86979 m!575435))

(assert (=> d!86979 m!575229))

(assert (=> b!597619 d!86979))

(declare-fun b!597834 () Bool)

(declare-fun e!341651 () SeekEntryResult!6172)

(declare-fun e!341649 () SeekEntryResult!6172)

(assert (=> b!597834 (= e!341651 e!341649)))

(declare-fun c!67691 () Bool)

(declare-fun lt!271607 () (_ BitVec 64))

(assert (=> b!597834 (= c!67691 (= lt!271607 lt!271505))))

(declare-fun b!597835 () Bool)

(declare-fun c!67693 () Bool)

(assert (=> b!597835 (= c!67693 (= lt!271607 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!341650 () SeekEntryResult!6172)

(assert (=> b!597835 (= e!341649 e!341650)))

(declare-fun b!597836 () Bool)

(assert (=> b!597836 (= e!341650 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!271505 lt!271502 mask!3053))))

(declare-fun d!86981 () Bool)

(declare-fun lt!271608 () SeekEntryResult!6172)

(assert (=> d!86981 (and (or ((_ is Undefined!6172) lt!271608) (not ((_ is Found!6172) lt!271608)) (and (bvsge (index!26940 lt!271608) #b00000000000000000000000000000000) (bvslt (index!26940 lt!271608) (size!18140 lt!271502)))) (or ((_ is Undefined!6172) lt!271608) ((_ is Found!6172) lt!271608) (not ((_ is MissingVacant!6172) lt!271608)) (not (= (index!26942 lt!271608) vacantSpotIndex!68)) (and (bvsge (index!26942 lt!271608) #b00000000000000000000000000000000) (bvslt (index!26942 lt!271608) (size!18140 lt!271502)))) (or ((_ is Undefined!6172) lt!271608) (ite ((_ is Found!6172) lt!271608) (= (select (arr!17776 lt!271502) (index!26940 lt!271608)) lt!271505) (and ((_ is MissingVacant!6172) lt!271608) (= (index!26942 lt!271608) vacantSpotIndex!68) (= (select (arr!17776 lt!271502) (index!26942 lt!271608)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86981 (= lt!271608 e!341651)))

(declare-fun c!67692 () Bool)

(assert (=> d!86981 (= c!67692 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!86981 (= lt!271607 (select (arr!17776 lt!271502) index!984))))

(assert (=> d!86981 (validMask!0 mask!3053)))

(assert (=> d!86981 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!271505 lt!271502 mask!3053) lt!271608)))

(declare-fun b!597837 () Bool)

(assert (=> b!597837 (= e!341651 Undefined!6172)))

(declare-fun b!597838 () Bool)

(assert (=> b!597838 (= e!341650 (MissingVacant!6172 vacantSpotIndex!68))))

(declare-fun b!597839 () Bool)

(assert (=> b!597839 (= e!341649 (Found!6172 index!984))))

(assert (= (and d!86981 c!67692) b!597837))

(assert (= (and d!86981 (not c!67692)) b!597834))

(assert (= (and b!597834 c!67691) b!597839))

(assert (= (and b!597834 (not c!67691)) b!597835))

(assert (= (and b!597835 c!67693) b!597838))

(assert (= (and b!597835 (not c!67693)) b!597836))

(declare-fun m!575437 () Bool)

(assert (=> b!597836 m!575437))

(assert (=> b!597836 m!575437))

(declare-fun m!575439 () Bool)

(assert (=> b!597836 m!575439))

(declare-fun m!575441 () Bool)

(assert (=> d!86981 m!575441))

(declare-fun m!575443 () Bool)

(assert (=> d!86981 m!575443))

(declare-fun m!575445 () Bool)

(assert (=> d!86981 m!575445))

(assert (=> d!86981 m!575229))

(assert (=> b!597619 d!86981))

(declare-fun d!86983 () Bool)

(declare-fun lt!271613 () (_ BitVec 32))

(assert (=> d!86983 (and (bvsge lt!271613 #b00000000000000000000000000000000) (bvslt lt!271613 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86983 (= lt!271613 (choose!52 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(assert (=> d!86983 (validMask!0 mask!3053)))

(assert (=> d!86983 (= (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) lt!271613)))

(declare-fun bs!18393 () Bool)

(assert (= bs!18393 d!86983))

(declare-fun m!575473 () Bool)

(assert (=> bs!18393 m!575473))

(assert (=> bs!18393 m!575229))

(assert (=> b!597619 d!86983))

(declare-fun d!86991 () Bool)

(declare-fun res!383195 () Bool)

(declare-fun e!341663 () Bool)

(assert (=> d!86991 (=> res!383195 e!341663)))

(assert (=> d!86991 (= res!383195 (= (select (arr!17776 lt!271502) j!136) (select (arr!17776 a!2986) j!136)))))

(assert (=> d!86991 (= (arrayContainsKey!0 lt!271502 (select (arr!17776 a!2986) j!136) j!136) e!341663)))

(declare-fun b!597856 () Bool)

(declare-fun e!341664 () Bool)

(assert (=> b!597856 (= e!341663 e!341664)))

(declare-fun res!383196 () Bool)

(assert (=> b!597856 (=> (not res!383196) (not e!341664))))

(assert (=> b!597856 (= res!383196 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18140 lt!271502)))))

(declare-fun b!597857 () Bool)

(assert (=> b!597857 (= e!341664 (arrayContainsKey!0 lt!271502 (select (arr!17776 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!86991 (not res!383195)) b!597856))

(assert (= (and b!597856 res!383196) b!597857))

(declare-fun m!575475 () Bool)

(assert (=> d!86991 m!575475))

(assert (=> b!597857 m!575237))

(declare-fun m!575477 () Bool)

(assert (=> b!597857 m!575477))

(assert (=> b!597630 d!86991))

(declare-fun d!86993 () Bool)

(declare-fun res!383197 () Bool)

(declare-fun e!341665 () Bool)

(assert (=> d!86993 (=> res!383197 e!341665)))

(assert (=> d!86993 (= res!383197 (= (select (arr!17776 lt!271502) index!984) (select (arr!17776 a!2986) j!136)))))

(assert (=> d!86993 (= (arrayContainsKey!0 lt!271502 (select (arr!17776 a!2986) j!136) index!984) e!341665)))

(declare-fun b!597858 () Bool)

(declare-fun e!341666 () Bool)

(assert (=> b!597858 (= e!341665 e!341666)))

(declare-fun res!383198 () Bool)

(assert (=> b!597858 (=> (not res!383198) (not e!341666))))

(assert (=> b!597858 (= res!383198 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18140 lt!271502)))))

(declare-fun b!597859 () Bool)

(assert (=> b!597859 (= e!341666 (arrayContainsKey!0 lt!271502 (select (arr!17776 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!86993 (not res!383197)) b!597858))

(assert (= (and b!597858 res!383198) b!597859))

(assert (=> d!86993 m!575445))

(assert (=> b!597859 m!575237))

(declare-fun m!575479 () Bool)

(assert (=> b!597859 m!575479))

(assert (=> b!597629 d!86993))

(declare-fun b!597896 () Bool)

(declare-fun e!341691 () SeekEntryResult!6172)

(assert (=> b!597896 (= e!341691 Undefined!6172)))

(declare-fun b!597897 () Bool)

(declare-fun e!341693 () SeekEntryResult!6172)

(assert (=> b!597897 (= e!341691 e!341693)))

(declare-fun lt!271638 () (_ BitVec 64))

(declare-fun lt!271636 () SeekEntryResult!6172)

(assert (=> b!597897 (= lt!271638 (select (arr!17776 a!2986) (index!26941 lt!271636)))))

(declare-fun c!67711 () Bool)

(assert (=> b!597897 (= c!67711 (= lt!271638 k0!1786))))

(declare-fun b!597898 () Bool)

(assert (=> b!597898 (= e!341693 (Found!6172 (index!26941 lt!271636)))))

(declare-fun b!597899 () Bool)

(declare-fun e!341692 () SeekEntryResult!6172)

(assert (=> b!597899 (= e!341692 (MissingZero!6172 (index!26941 lt!271636)))))

(declare-fun b!597900 () Bool)

(declare-fun c!67712 () Bool)

(assert (=> b!597900 (= c!67712 (= lt!271638 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!597900 (= e!341693 e!341692)))

(declare-fun d!86995 () Bool)

(declare-fun lt!271637 () SeekEntryResult!6172)

(assert (=> d!86995 (and (or ((_ is Undefined!6172) lt!271637) (not ((_ is Found!6172) lt!271637)) (and (bvsge (index!26940 lt!271637) #b00000000000000000000000000000000) (bvslt (index!26940 lt!271637) (size!18140 a!2986)))) (or ((_ is Undefined!6172) lt!271637) ((_ is Found!6172) lt!271637) (not ((_ is MissingZero!6172) lt!271637)) (and (bvsge (index!26939 lt!271637) #b00000000000000000000000000000000) (bvslt (index!26939 lt!271637) (size!18140 a!2986)))) (or ((_ is Undefined!6172) lt!271637) ((_ is Found!6172) lt!271637) ((_ is MissingZero!6172) lt!271637) (not ((_ is MissingVacant!6172) lt!271637)) (and (bvsge (index!26942 lt!271637) #b00000000000000000000000000000000) (bvslt (index!26942 lt!271637) (size!18140 a!2986)))) (or ((_ is Undefined!6172) lt!271637) (ite ((_ is Found!6172) lt!271637) (= (select (arr!17776 a!2986) (index!26940 lt!271637)) k0!1786) (ite ((_ is MissingZero!6172) lt!271637) (= (select (arr!17776 a!2986) (index!26939 lt!271637)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6172) lt!271637) (= (select (arr!17776 a!2986) (index!26942 lt!271637)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!86995 (= lt!271637 e!341691)))

(declare-fun c!67713 () Bool)

(assert (=> d!86995 (= c!67713 (and ((_ is Intermediate!6172) lt!271636) (undefined!6984 lt!271636)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37032 (_ BitVec 32)) SeekEntryResult!6172)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86995 (= lt!271636 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!86995 (validMask!0 mask!3053)))

(assert (=> d!86995 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!271637)))

(declare-fun b!597901 () Bool)

(assert (=> b!597901 (= e!341692 (seekKeyOrZeroReturnVacant!0 (x!55892 lt!271636) (index!26941 lt!271636) (index!26941 lt!271636) k0!1786 a!2986 mask!3053))))

(assert (= (and d!86995 c!67713) b!597896))

(assert (= (and d!86995 (not c!67713)) b!597897))

(assert (= (and b!597897 c!67711) b!597898))

(assert (= (and b!597897 (not c!67711)) b!597900))

(assert (= (and b!597900 c!67712) b!597899))

(assert (= (and b!597900 (not c!67712)) b!597901))

(declare-fun m!575515 () Bool)

(assert (=> b!597897 m!575515))

(assert (=> d!86995 m!575229))

(declare-fun m!575517 () Bool)

(assert (=> d!86995 m!575517))

(declare-fun m!575519 () Bool)

(assert (=> d!86995 m!575519))

(declare-fun m!575521 () Bool)

(assert (=> d!86995 m!575521))

(declare-fun m!575523 () Bool)

(assert (=> d!86995 m!575523))

(declare-fun m!575525 () Bool)

(assert (=> d!86995 m!575525))

(assert (=> d!86995 m!575517))

(declare-fun m!575527 () Bool)

(assert (=> b!597901 m!575527))

(assert (=> b!597618 d!86995))

(declare-fun b!597902 () Bool)

(declare-fun e!341696 () Bool)

(declare-fun call!32936 () Bool)

(assert (=> b!597902 (= e!341696 call!32936)))

(declare-fun b!597903 () Bool)

(declare-fun e!341694 () Bool)

(assert (=> b!597903 (= e!341694 e!341696)))

(declare-fun c!67714 () Bool)

(assert (=> b!597903 (= c!67714 (validKeyInArray!0 (select (arr!17776 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!597904 () Bool)

(assert (=> b!597904 (= e!341696 call!32936)))

(declare-fun b!597905 () Bool)

(declare-fun e!341697 () Bool)

(assert (=> b!597905 (= e!341697 e!341694)))

(declare-fun res!383212 () Bool)

(assert (=> b!597905 (=> (not res!383212) (not e!341694))))

(declare-fun e!341695 () Bool)

(assert (=> b!597905 (= res!383212 (not e!341695))))

(declare-fun res!383211 () Bool)

(assert (=> b!597905 (=> (not res!383211) (not e!341695))))

(assert (=> b!597905 (= res!383211 (validKeyInArray!0 (select (arr!17776 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!87011 () Bool)

(declare-fun res!383213 () Bool)

(assert (=> d!87011 (=> res!383213 e!341697)))

(assert (=> d!87011 (= res!383213 (bvsge #b00000000000000000000000000000000 (size!18140 a!2986)))))

(assert (=> d!87011 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11721) e!341697)))

(declare-fun b!597906 () Bool)

(assert (=> b!597906 (= e!341695 (contains!2929 Nil!11721 (select (arr!17776 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!32933 () Bool)

(assert (=> bm!32933 (= call!32936 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!67714 (Cons!11720 (select (arr!17776 a!2986) #b00000000000000000000000000000000) Nil!11721) Nil!11721)))))

(assert (= (and d!87011 (not res!383213)) b!597905))

(assert (= (and b!597905 res!383211) b!597906))

(assert (= (and b!597905 res!383212) b!597903))

(assert (= (and b!597903 c!67714) b!597902))

(assert (= (and b!597903 (not c!67714)) b!597904))

(assert (= (or b!597902 b!597904) bm!32933))

(declare-fun m!575529 () Bool)

(assert (=> b!597903 m!575529))

(assert (=> b!597903 m!575529))

(declare-fun m!575531 () Bool)

(assert (=> b!597903 m!575531))

(assert (=> b!597905 m!575529))

(assert (=> b!597905 m!575529))

(assert (=> b!597905 m!575531))

(assert (=> b!597906 m!575529))

(assert (=> b!597906 m!575529))

(declare-fun m!575533 () Bool)

(assert (=> b!597906 m!575533))

(assert (=> bm!32933 m!575529))

(declare-fun m!575535 () Bool)

(assert (=> bm!32933 m!575535))

(assert (=> b!597617 d!87011))

(declare-fun b!597907 () Bool)

(declare-fun e!341700 () SeekEntryResult!6172)

(declare-fun e!341698 () SeekEntryResult!6172)

(assert (=> b!597907 (= e!341700 e!341698)))

(declare-fun lt!271639 () (_ BitVec 64))

(declare-fun c!67715 () Bool)

(assert (=> b!597907 (= c!67715 (= lt!271639 (select (arr!17776 a!2986) j!136)))))

(declare-fun b!597908 () Bool)

(declare-fun c!67717 () Bool)

(assert (=> b!597908 (= c!67717 (= lt!271639 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!341699 () SeekEntryResult!6172)

(assert (=> b!597908 (= e!341698 e!341699)))

(declare-fun b!597909 () Bool)

(assert (=> b!597909 (= e!341699 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!17776 a!2986) j!136) a!2986 mask!3053))))

(declare-fun lt!271640 () SeekEntryResult!6172)

(declare-fun d!87013 () Bool)

(assert (=> d!87013 (and (or ((_ is Undefined!6172) lt!271640) (not ((_ is Found!6172) lt!271640)) (and (bvsge (index!26940 lt!271640) #b00000000000000000000000000000000) (bvslt (index!26940 lt!271640) (size!18140 a!2986)))) (or ((_ is Undefined!6172) lt!271640) ((_ is Found!6172) lt!271640) (not ((_ is MissingVacant!6172) lt!271640)) (not (= (index!26942 lt!271640) vacantSpotIndex!68)) (and (bvsge (index!26942 lt!271640) #b00000000000000000000000000000000) (bvslt (index!26942 lt!271640) (size!18140 a!2986)))) (or ((_ is Undefined!6172) lt!271640) (ite ((_ is Found!6172) lt!271640) (= (select (arr!17776 a!2986) (index!26940 lt!271640)) (select (arr!17776 a!2986) j!136)) (and ((_ is MissingVacant!6172) lt!271640) (= (index!26942 lt!271640) vacantSpotIndex!68) (= (select (arr!17776 a!2986) (index!26942 lt!271640)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87013 (= lt!271640 e!341700)))

(declare-fun c!67716 () Bool)

(assert (=> d!87013 (= c!67716 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!87013 (= lt!271639 (select (arr!17776 a!2986) index!984))))

(assert (=> d!87013 (validMask!0 mask!3053)))

(assert (=> d!87013 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17776 a!2986) j!136) a!2986 mask!3053) lt!271640)))

(declare-fun b!597910 () Bool)

(assert (=> b!597910 (= e!341700 Undefined!6172)))

(declare-fun b!597911 () Bool)

(assert (=> b!597911 (= e!341699 (MissingVacant!6172 vacantSpotIndex!68))))

(declare-fun b!597912 () Bool)

(assert (=> b!597912 (= e!341698 (Found!6172 index!984))))

(assert (= (and d!87013 c!67716) b!597910))

(assert (= (and d!87013 (not c!67716)) b!597907))

(assert (= (and b!597907 c!67715) b!597912))

(assert (= (and b!597907 (not c!67715)) b!597908))

(assert (= (and b!597908 c!67717) b!597911))

(assert (= (and b!597908 (not c!67717)) b!597909))

(assert (=> b!597909 m!575437))

(assert (=> b!597909 m!575437))

(assert (=> b!597909 m!575237))

(declare-fun m!575537 () Bool)

(assert (=> b!597909 m!575537))

(declare-fun m!575539 () Bool)

(assert (=> d!87013 m!575539))

(declare-fun m!575541 () Bool)

(assert (=> d!87013 m!575541))

(assert (=> d!87013 m!575235))

(assert (=> d!87013 m!575229))

(assert (=> b!597616 d!87013))

(declare-fun d!87015 () Bool)

(declare-fun res!383220 () Bool)

(declare-fun e!341718 () Bool)

(assert (=> d!87015 (=> res!383220 e!341718)))

(assert (=> d!87015 (= res!383220 (bvsge #b00000000000000000000000000000000 (size!18140 a!2986)))))

(assert (=> d!87015 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!341718)))

(declare-fun b!597941 () Bool)

(declare-fun e!341720 () Bool)

(declare-fun call!32939 () Bool)

(assert (=> b!597941 (= e!341720 call!32939)))

(declare-fun b!597942 () Bool)

(assert (=> b!597942 (= e!341718 e!341720)))

(declare-fun c!67729 () Bool)

(assert (=> b!597942 (= c!67729 (validKeyInArray!0 (select (arr!17776 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!597943 () Bool)

(declare-fun e!341719 () Bool)

(assert (=> b!597943 (= e!341719 call!32939)))

(declare-fun bm!32936 () Bool)

(assert (=> bm!32936 (= call!32939 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!597944 () Bool)

(assert (=> b!597944 (= e!341720 e!341719)))

(declare-fun lt!271657 () (_ BitVec 64))

(assert (=> b!597944 (= lt!271657 (select (arr!17776 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!271656 () Unit!18781)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37032 (_ BitVec 64) (_ BitVec 32)) Unit!18781)

(assert (=> b!597944 (= lt!271656 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!271657 #b00000000000000000000000000000000))))

(assert (=> b!597944 (arrayContainsKey!0 a!2986 lt!271657 #b00000000000000000000000000000000)))

(declare-fun lt!271658 () Unit!18781)

(assert (=> b!597944 (= lt!271658 lt!271656)))

(declare-fun res!383221 () Bool)

(assert (=> b!597944 (= res!383221 (= (seekEntryOrOpen!0 (select (arr!17776 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6172 #b00000000000000000000000000000000)))))

(assert (=> b!597944 (=> (not res!383221) (not e!341719))))

(assert (= (and d!87015 (not res!383220)) b!597942))

(assert (= (and b!597942 c!67729) b!597944))

(assert (= (and b!597942 (not c!67729)) b!597941))

(assert (= (and b!597944 res!383221) b!597943))

(assert (= (or b!597943 b!597941) bm!32936))

(assert (=> b!597942 m!575529))

(assert (=> b!597942 m!575529))

(assert (=> b!597942 m!575531))

(declare-fun m!575561 () Bool)

(assert (=> bm!32936 m!575561))

(assert (=> b!597944 m!575529))

(declare-fun m!575563 () Bool)

(assert (=> b!597944 m!575563))

(declare-fun m!575565 () Bool)

(assert (=> b!597944 m!575565))

(assert (=> b!597944 m!575529))

(declare-fun m!575567 () Bool)

(assert (=> b!597944 m!575567))

(assert (=> b!597615 d!87015))

(declare-fun d!87025 () Bool)

(declare-fun res!383224 () Bool)

(declare-fun e!341725 () Bool)

(assert (=> d!87025 (=> res!383224 e!341725)))

(assert (=> d!87025 (= res!383224 (= (select (arr!17776 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!87025 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!341725)))

(declare-fun b!597951 () Bool)

(declare-fun e!341726 () Bool)

(assert (=> b!597951 (= e!341725 e!341726)))

(declare-fun res!383225 () Bool)

(assert (=> b!597951 (=> (not res!383225) (not e!341726))))

(assert (=> b!597951 (= res!383225 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18140 a!2986)))))

(declare-fun b!597952 () Bool)

(assert (=> b!597952 (= e!341726 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!87025 (not res!383224)) b!597951))

(assert (= (and b!597951 res!383225) b!597952))

(assert (=> d!87025 m!575529))

(declare-fun m!575569 () Bool)

(assert (=> b!597952 m!575569))

(assert (=> b!597625 d!87025))

(check-sat (not b!597857) (not b!597816) (not d!86957) (not b!597772) (not b!597769) (not d!86981) (not b!597784) (not d!86969) (not b!597830) (not d!86961) (not d!86995) (not b!597766) (not b!597905) (not bm!32928) (not b!597944) (not b!597859) (not b!597942) (not bm!32936) (not d!86979) (not b!597768) (not b!597909) (not b!597906) (not b!597952) (not b!597778) (not b!597783) (not b!597903) (not b!597787) (not d!86983) (not bm!32933) (not b!597901) (not b!597836) (not d!87013) (not d!86967))
(check-sat)
