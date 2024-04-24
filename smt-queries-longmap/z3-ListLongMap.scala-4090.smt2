; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56088 () Bool)

(assert start!56088)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!353781 () Bool)

(declare-fun b!616958 () Bool)

(declare-datatypes ((array!37503 0))(
  ( (array!37504 (arr!17995 (Array (_ BitVec 32) (_ BitVec 64))) (size!18359 (_ BitVec 32))) )
))
(declare-fun lt!283867 () array!37503)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37503)

(declare-fun arrayContainsKey!0 (array!37503 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!616958 (= e!353781 (arrayContainsKey!0 lt!283867 (select (arr!17995 a!2986) j!136) index!984))))

(declare-fun b!616959 () Bool)

(declare-fun e!353767 () Bool)

(declare-fun e!353776 () Bool)

(assert (=> b!616959 (= e!353767 e!353776)))

(declare-fun res!397413 () Bool)

(assert (=> b!616959 (=> (not res!397413) (not e!353776))))

(declare-datatypes ((SeekEntryResult!6391 0))(
  ( (MissingZero!6391 (index!27848 (_ BitVec 32))) (Found!6391 (index!27849 (_ BitVec 32))) (Intermediate!6391 (undefined!7203 Bool) (index!27850 (_ BitVec 32)) (x!56794 (_ BitVec 32))) (Undefined!6391) (MissingVacant!6391 (index!27851 (_ BitVec 32))) )
))
(declare-fun lt!283869 () SeekEntryResult!6391)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!616959 (= res!397413 (or (= lt!283869 (MissingZero!6391 i!1108)) (= lt!283869 (MissingVacant!6391 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37503 (_ BitVec 32)) SeekEntryResult!6391)

(assert (=> b!616959 (= lt!283869 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!397409 () Bool)

(declare-fun b!616960 () Bool)

(assert (=> b!616960 (= res!397409 (arrayContainsKey!0 lt!283867 (select (arr!17995 a!2986) j!136) j!136))))

(declare-fun e!353772 () Bool)

(assert (=> b!616960 (=> (not res!397409) (not e!353772))))

(declare-fun e!353778 () Bool)

(assert (=> b!616960 (= e!353778 e!353772)))

(declare-fun b!616961 () Bool)

(declare-datatypes ((Unit!20107 0))(
  ( (Unit!20108) )
))
(declare-fun e!353777 () Unit!20107)

(declare-fun Unit!20109 () Unit!20107)

(assert (=> b!616961 (= e!353777 Unit!20109)))

(assert (=> b!616961 false))

(declare-fun b!616962 () Bool)

(declare-fun e!353780 () Bool)

(declare-fun e!353779 () Bool)

(assert (=> b!616962 (= e!353780 e!353779)))

(declare-fun res!397412 () Bool)

(assert (=> b!616962 (=> (not res!397412) (not e!353779))))

(declare-fun lt!283879 () SeekEntryResult!6391)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!616962 (= res!397412 (and (= lt!283879 (Found!6391 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17995 a!2986) index!984) (select (arr!17995 a!2986) j!136))) (not (= (select (arr!17995 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37503 (_ BitVec 32)) SeekEntryResult!6391)

(assert (=> b!616962 (= lt!283879 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17995 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!616963 () Bool)

(declare-fun e!353769 () Unit!20107)

(declare-fun Unit!20110 () Unit!20107)

(assert (=> b!616963 (= e!353769 Unit!20110)))

(declare-fun b!616964 () Bool)

(declare-fun res!397408 () Bool)

(assert (=> b!616964 (=> (not res!397408) (not e!353767))))

(assert (=> b!616964 (= res!397408 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!616965 () Bool)

(declare-fun res!397410 () Bool)

(assert (=> b!616965 (=> (not res!397410) (not e!353767))))

(assert (=> b!616965 (= res!397410 (and (= (size!18359 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18359 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18359 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!616966 () Bool)

(assert (=> b!616966 false))

(declare-fun lt!283872 () Unit!20107)

(declare-datatypes ((List!11943 0))(
  ( (Nil!11940) (Cons!11939 (h!12987 (_ BitVec 64)) (t!18163 List!11943)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37503 (_ BitVec 64) (_ BitVec 32) List!11943) Unit!20107)

(assert (=> b!616966 (= lt!283872 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!283867 (select (arr!17995 a!2986) j!136) index!984 Nil!11940))))

(declare-fun arrayNoDuplicates!0 (array!37503 (_ BitVec 32) List!11943) Bool)

(assert (=> b!616966 (arrayNoDuplicates!0 lt!283867 index!984 Nil!11940)))

(declare-fun lt!283877 () Unit!20107)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37503 (_ BitVec 32) (_ BitVec 32)) Unit!20107)

(assert (=> b!616966 (= lt!283877 (lemmaNoDuplicateFromThenFromBigger!0 lt!283867 #b00000000000000000000000000000000 index!984))))

(assert (=> b!616966 (arrayNoDuplicates!0 lt!283867 #b00000000000000000000000000000000 Nil!11940)))

(declare-fun lt!283870 () Unit!20107)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37503 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11943) Unit!20107)

(assert (=> b!616966 (= lt!283870 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11940))))

(assert (=> b!616966 (arrayContainsKey!0 lt!283867 (select (arr!17995 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!283866 () Unit!20107)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37503 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20107)

(assert (=> b!616966 (= lt!283866 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!283867 (select (arr!17995 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!616966 e!353781))

(declare-fun res!397406 () Bool)

(assert (=> b!616966 (=> (not res!397406) (not e!353781))))

(assert (=> b!616966 (= res!397406 (arrayContainsKey!0 lt!283867 (select (arr!17995 a!2986) j!136) j!136))))

(declare-fun e!353775 () Unit!20107)

(declare-fun Unit!20111 () Unit!20107)

(assert (=> b!616966 (= e!353775 Unit!20111)))

(declare-fun b!616967 () Bool)

(declare-fun Unit!20112 () Unit!20107)

(assert (=> b!616967 (= e!353777 Unit!20112)))

(declare-fun b!616968 () Bool)

(declare-fun res!397411 () Bool)

(assert (=> b!616968 (=> (not res!397411) (not e!353776))))

(assert (=> b!616968 (= res!397411 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17995 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!616969 () Bool)

(declare-fun Unit!20113 () Unit!20107)

(assert (=> b!616969 (= e!353775 Unit!20113)))

(declare-fun res!397399 () Bool)

(assert (=> start!56088 (=> (not res!397399) (not e!353767))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56088 (= res!397399 (validMask!0 mask!3053))))

(assert (=> start!56088 e!353767))

(assert (=> start!56088 true))

(declare-fun array_inv!13854 (array!37503) Bool)

(assert (=> start!56088 (array_inv!13854 a!2986)))

(declare-fun b!616957 () Bool)

(declare-fun e!353771 () Unit!20107)

(declare-fun Unit!20114 () Unit!20107)

(assert (=> b!616957 (= e!353771 Unit!20114)))

(declare-fun b!616970 () Bool)

(declare-fun res!397403 () Bool)

(assert (=> b!616970 (=> (not res!397403) (not e!353776))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37503 (_ BitVec 32)) Bool)

(assert (=> b!616970 (= res!397403 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!616971 () Bool)

(assert (=> b!616971 false))

(declare-fun lt!283860 () Unit!20107)

(assert (=> b!616971 (= lt!283860 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!283867 (select (arr!17995 a!2986) j!136) j!136 Nil!11940))))

(assert (=> b!616971 (arrayNoDuplicates!0 lt!283867 j!136 Nil!11940)))

(declare-fun lt!283864 () Unit!20107)

(assert (=> b!616971 (= lt!283864 (lemmaNoDuplicateFromThenFromBigger!0 lt!283867 #b00000000000000000000000000000000 j!136))))

(assert (=> b!616971 (arrayNoDuplicates!0 lt!283867 #b00000000000000000000000000000000 Nil!11940)))

(declare-fun lt!283875 () Unit!20107)

(assert (=> b!616971 (= lt!283875 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11940))))

(assert (=> b!616971 (arrayContainsKey!0 lt!283867 (select (arr!17995 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!283876 () Unit!20107)

(assert (=> b!616971 (= lt!283876 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!283867 (select (arr!17995 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20115 () Unit!20107)

(assert (=> b!616971 (= e!353771 Unit!20115)))

(declare-fun b!616972 () Bool)

(declare-fun e!353768 () Bool)

(assert (=> b!616972 (= e!353779 (not e!353768))))

(declare-fun res!397402 () Bool)

(assert (=> b!616972 (=> res!397402 e!353768)))

(declare-fun lt!283865 () SeekEntryResult!6391)

(assert (=> b!616972 (= res!397402 (not (= lt!283865 (MissingVacant!6391 vacantSpotIndex!68))))))

(declare-fun lt!283861 () Unit!20107)

(assert (=> b!616972 (= lt!283861 e!353769)))

(declare-fun c!70148 () Bool)

(assert (=> b!616972 (= c!70148 (= lt!283865 (Found!6391 index!984)))))

(declare-fun lt!283871 () Unit!20107)

(assert (=> b!616972 (= lt!283871 e!353777)))

(declare-fun c!70151 () Bool)

(assert (=> b!616972 (= c!70151 (= lt!283865 Undefined!6391))))

(declare-fun lt!283878 () (_ BitVec 64))

(assert (=> b!616972 (= lt!283865 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!283878 lt!283867 mask!3053))))

(declare-fun e!353774 () Bool)

(assert (=> b!616972 e!353774))

(declare-fun res!397404 () Bool)

(assert (=> b!616972 (=> (not res!397404) (not e!353774))))

(declare-fun lt!283862 () SeekEntryResult!6391)

(declare-fun lt!283873 () (_ BitVec 32))

(assert (=> b!616972 (= res!397404 (= lt!283862 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!283873 vacantSpotIndex!68 lt!283878 lt!283867 mask!3053)))))

(assert (=> b!616972 (= lt!283862 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!283873 vacantSpotIndex!68 (select (arr!17995 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!616972 (= lt!283878 (select (store (arr!17995 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!283863 () Unit!20107)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37503 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20107)

(assert (=> b!616972 (= lt!283863 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!283873 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!616972 (= lt!283873 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!616973 () Bool)

(assert (=> b!616973 (= e!353768 true)))

(assert (=> b!616973 (= (select (store (arr!17995 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!616974 () Bool)

(declare-fun Unit!20116 () Unit!20107)

(assert (=> b!616974 (= e!353769 Unit!20116)))

(declare-fun res!397405 () Bool)

(assert (=> b!616974 (= res!397405 (= (select (store (arr!17995 a!2986) i!1108 k0!1786) index!984) (select (arr!17995 a!2986) j!136)))))

(declare-fun e!353770 () Bool)

(assert (=> b!616974 (=> (not res!397405) (not e!353770))))

(assert (=> b!616974 e!353770))

(declare-fun c!70149 () Bool)

(assert (=> b!616974 (= c!70149 (bvslt j!136 index!984))))

(declare-fun lt!283874 () Unit!20107)

(assert (=> b!616974 (= lt!283874 e!353771)))

(declare-fun c!70150 () Bool)

(assert (=> b!616974 (= c!70150 (bvslt index!984 j!136))))

(declare-fun lt!283868 () Unit!20107)

(assert (=> b!616974 (= lt!283868 e!353775)))

(assert (=> b!616974 false))

(declare-fun b!616975 () Bool)

(declare-fun res!397401 () Bool)

(assert (=> b!616975 (=> (not res!397401) (not e!353767))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!616975 (= res!397401 (validKeyInArray!0 (select (arr!17995 a!2986) j!136)))))

(declare-fun b!616976 () Bool)

(declare-fun res!397400 () Bool)

(assert (=> b!616976 (= res!397400 (bvsge j!136 index!984))))

(assert (=> b!616976 (=> res!397400 e!353778)))

(assert (=> b!616976 (= e!353770 e!353778)))

(declare-fun b!616977 () Bool)

(declare-fun res!397407 () Bool)

(assert (=> b!616977 (=> (not res!397407) (not e!353776))))

(assert (=> b!616977 (= res!397407 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11940))))

(declare-fun b!616978 () Bool)

(assert (=> b!616978 (= e!353776 e!353780)))

(declare-fun res!397398 () Bool)

(assert (=> b!616978 (=> (not res!397398) (not e!353780))))

(assert (=> b!616978 (= res!397398 (= (select (store (arr!17995 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!616978 (= lt!283867 (array!37504 (store (arr!17995 a!2986) i!1108 k0!1786) (size!18359 a!2986)))))

(declare-fun b!616979 () Bool)

(assert (=> b!616979 (= e!353772 (arrayContainsKey!0 lt!283867 (select (arr!17995 a!2986) j!136) index!984))))

(declare-fun b!616980 () Bool)

(declare-fun res!397414 () Bool)

(assert (=> b!616980 (=> (not res!397414) (not e!353767))))

(assert (=> b!616980 (= res!397414 (validKeyInArray!0 k0!1786))))

(declare-fun b!616981 () Bool)

(assert (=> b!616981 (= e!353774 (= lt!283879 lt!283862))))

(assert (= (and start!56088 res!397399) b!616965))

(assert (= (and b!616965 res!397410) b!616975))

(assert (= (and b!616975 res!397401) b!616980))

(assert (= (and b!616980 res!397414) b!616964))

(assert (= (and b!616964 res!397408) b!616959))

(assert (= (and b!616959 res!397413) b!616970))

(assert (= (and b!616970 res!397403) b!616977))

(assert (= (and b!616977 res!397407) b!616968))

(assert (= (and b!616968 res!397411) b!616978))

(assert (= (and b!616978 res!397398) b!616962))

(assert (= (and b!616962 res!397412) b!616972))

(assert (= (and b!616972 res!397404) b!616981))

(assert (= (and b!616972 c!70151) b!616961))

(assert (= (and b!616972 (not c!70151)) b!616967))

(assert (= (and b!616972 c!70148) b!616974))

(assert (= (and b!616972 (not c!70148)) b!616963))

(assert (= (and b!616974 res!397405) b!616976))

(assert (= (and b!616976 (not res!397400)) b!616960))

(assert (= (and b!616960 res!397409) b!616979))

(assert (= (and b!616974 c!70149) b!616971))

(assert (= (and b!616974 (not c!70149)) b!616957))

(assert (= (and b!616974 c!70150) b!616966))

(assert (= (and b!616974 (not c!70150)) b!616969))

(assert (= (and b!616966 res!397406) b!616958))

(assert (= (and b!616972 (not res!397402)) b!616973))

(declare-fun m!593387 () Bool)

(assert (=> b!616980 m!593387))

(declare-fun m!593389 () Bool)

(assert (=> b!616973 m!593389))

(declare-fun m!593391 () Bool)

(assert (=> b!616973 m!593391))

(declare-fun m!593393 () Bool)

(assert (=> b!616968 m!593393))

(declare-fun m!593395 () Bool)

(assert (=> b!616972 m!593395))

(declare-fun m!593397 () Bool)

(assert (=> b!616972 m!593397))

(assert (=> b!616972 m!593389))

(declare-fun m!593399 () Bool)

(assert (=> b!616972 m!593399))

(assert (=> b!616972 m!593397))

(declare-fun m!593401 () Bool)

(assert (=> b!616972 m!593401))

(declare-fun m!593403 () Bool)

(assert (=> b!616972 m!593403))

(declare-fun m!593405 () Bool)

(assert (=> b!616972 m!593405))

(declare-fun m!593407 () Bool)

(assert (=> b!616972 m!593407))

(assert (=> b!616960 m!593397))

(assert (=> b!616960 m!593397))

(declare-fun m!593409 () Bool)

(assert (=> b!616960 m!593409))

(declare-fun m!593411 () Bool)

(assert (=> b!616962 m!593411))

(assert (=> b!616962 m!593397))

(assert (=> b!616962 m!593397))

(declare-fun m!593413 () Bool)

(assert (=> b!616962 m!593413))

(declare-fun m!593415 () Bool)

(assert (=> b!616966 m!593415))

(assert (=> b!616966 m!593397))

(declare-fun m!593417 () Bool)

(assert (=> b!616966 m!593417))

(declare-fun m!593419 () Bool)

(assert (=> b!616966 m!593419))

(declare-fun m!593421 () Bool)

(assert (=> b!616966 m!593421))

(assert (=> b!616966 m!593397))

(declare-fun m!593423 () Bool)

(assert (=> b!616966 m!593423))

(assert (=> b!616966 m!593397))

(declare-fun m!593425 () Bool)

(assert (=> b!616966 m!593425))

(assert (=> b!616966 m!593397))

(declare-fun m!593427 () Bool)

(assert (=> b!616966 m!593427))

(assert (=> b!616966 m!593397))

(assert (=> b!616966 m!593409))

(assert (=> b!616978 m!593389))

(declare-fun m!593429 () Bool)

(assert (=> b!616978 m!593429))

(assert (=> b!616975 m!593397))

(assert (=> b!616975 m!593397))

(declare-fun m!593431 () Bool)

(assert (=> b!616975 m!593431))

(declare-fun m!593433 () Bool)

(assert (=> b!616959 m!593433))

(assert (=> b!616979 m!593397))

(assert (=> b!616979 m!593397))

(declare-fun m!593435 () Bool)

(assert (=> b!616979 m!593435))

(declare-fun m!593437 () Bool)

(assert (=> b!616970 m!593437))

(assert (=> b!616958 m!593397))

(assert (=> b!616958 m!593397))

(assert (=> b!616958 m!593435))

(declare-fun m!593439 () Bool)

(assert (=> b!616964 m!593439))

(declare-fun m!593441 () Bool)

(assert (=> b!616971 m!593441))

(assert (=> b!616971 m!593417))

(assert (=> b!616971 m!593397))

(declare-fun m!593443 () Bool)

(assert (=> b!616971 m!593443))

(declare-fun m!593445 () Bool)

(assert (=> b!616971 m!593445))

(assert (=> b!616971 m!593397))

(declare-fun m!593447 () Bool)

(assert (=> b!616971 m!593447))

(assert (=> b!616971 m!593421))

(assert (=> b!616971 m!593397))

(declare-fun m!593449 () Bool)

(assert (=> b!616971 m!593449))

(assert (=> b!616971 m!593397))

(declare-fun m!593451 () Bool)

(assert (=> b!616977 m!593451))

(assert (=> b!616974 m!593389))

(assert (=> b!616974 m!593391))

(assert (=> b!616974 m!593397))

(declare-fun m!593453 () Bool)

(assert (=> start!56088 m!593453))

(declare-fun m!593455 () Bool)

(assert (=> start!56088 m!593455))

(check-sat (not b!616964) (not b!616958) (not b!616975) (not b!616979) (not b!616962) (not b!616960) (not b!616970) (not b!616980) (not b!616971) (not b!616977) (not b!616966) (not b!616959) (not start!56088) (not b!616972))
(check-sat)
