; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57432 () Bool)

(assert start!57432)

(declare-fun b!635603 () Bool)

(declare-fun e!363551 () Bool)

(declare-fun e!363541 () Bool)

(assert (=> b!635603 (= e!363551 e!363541)))

(declare-fun res!411197 () Bool)

(assert (=> b!635603 (=> (not res!411197) (not e!363541))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!38222 0))(
  ( (array!38223 (arr!18338 (Array (_ BitVec 32) (_ BitVec 64))) (size!18702 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38222)

(declare-fun lt!293896 () array!38222)

(declare-fun arrayContainsKey!0 (array!38222 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!635603 (= res!411197 (arrayContainsKey!0 lt!293896 (select (arr!18338 a!2986) j!136) j!136))))

(declare-fun b!635604 () Bool)

(declare-fun e!363550 () Bool)

(assert (=> b!635604 (= e!363550 e!363551)))

(declare-fun res!411203 () Bool)

(assert (=> b!635604 (=> res!411203 e!363551)))

(declare-fun lt!293892 () (_ BitVec 64))

(declare-fun lt!293898 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!635604 (= res!411203 (or (not (= (select (arr!18338 a!2986) j!136) lt!293898)) (not (= (select (arr!18338 a!2986) j!136) lt!293892)) (bvsge j!136 index!984)))))

(declare-fun b!635605 () Bool)

(declare-fun e!363548 () Bool)

(declare-fun e!363542 () Bool)

(assert (=> b!635605 (= e!363548 e!363542)))

(declare-fun res!411199 () Bool)

(assert (=> b!635605 (=> (not res!411199) (not e!363542))))

(declare-datatypes ((SeekEntryResult!6778 0))(
  ( (MissingZero!6778 (index!29417 (_ BitVec 32))) (Found!6778 (index!29418 (_ BitVec 32))) (Intermediate!6778 (undefined!7590 Bool) (index!29419 (_ BitVec 32)) (x!58161 (_ BitVec 32))) (Undefined!6778) (MissingVacant!6778 (index!29420 (_ BitVec 32))) )
))
(declare-fun lt!293895 () SeekEntryResult!6778)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!635605 (= res!411199 (or (= lt!293895 (MissingZero!6778 i!1108)) (= lt!293895 (MissingVacant!6778 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38222 (_ BitVec 32)) SeekEntryResult!6778)

(assert (=> b!635605 (= lt!293895 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!635606 () Bool)

(declare-fun e!363546 () Bool)

(declare-fun e!363543 () Bool)

(assert (=> b!635606 (= e!363546 e!363543)))

(declare-fun res!411194 () Bool)

(assert (=> b!635606 (=> res!411194 e!363543)))

(assert (=> b!635606 (= res!411194 (or (not (= (select (arr!18338 a!2986) j!136) lt!293898)) (not (= (select (arr!18338 a!2986) j!136) lt!293892)) (bvsge j!136 index!984)))))

(assert (=> b!635606 e!363550))

(declare-fun res!411193 () Bool)

(assert (=> b!635606 (=> (not res!411193) (not e!363550))))

(assert (=> b!635606 (= res!411193 (= lt!293892 (select (arr!18338 a!2986) j!136)))))

(assert (=> b!635606 (= lt!293892 (select (store (arr!18338 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!635607 () Bool)

(declare-fun res!411188 () Bool)

(assert (=> b!635607 (=> (not res!411188) (not e!363542))))

(declare-datatypes ((List!12379 0))(
  ( (Nil!12376) (Cons!12375 (h!13420 (_ BitVec 64)) (t!18607 List!12379)) )
))
(declare-fun arrayNoDuplicates!0 (array!38222 (_ BitVec 32) List!12379) Bool)

(assert (=> b!635607 (= res!411188 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12376))))

(declare-fun b!635608 () Bool)

(declare-fun res!411195 () Bool)

(assert (=> b!635608 (=> (not res!411195) (not e!363542))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38222 (_ BitVec 32)) Bool)

(assert (=> b!635608 (= res!411195 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!635609 () Bool)

(declare-fun res!411191 () Bool)

(assert (=> b!635609 (=> (not res!411191) (not e!363548))))

(assert (=> b!635609 (= res!411191 (and (= (size!18702 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18702 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18702 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!411201 () Bool)

(assert (=> start!57432 (=> (not res!411201) (not e!363548))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57432 (= res!411201 (validMask!0 mask!3053))))

(assert (=> start!57432 e!363548))

(assert (=> start!57432 true))

(declare-fun array_inv!14134 (array!38222) Bool)

(assert (=> start!57432 (array_inv!14134 a!2986)))

(declare-fun b!635610 () Bool)

(declare-fun e!363544 () Bool)

(declare-fun lt!293894 () SeekEntryResult!6778)

(declare-fun lt!293902 () SeekEntryResult!6778)

(assert (=> b!635610 (= e!363544 (= lt!293894 lt!293902))))

(declare-fun b!635611 () Bool)

(declare-datatypes ((Unit!21446 0))(
  ( (Unit!21447) )
))
(declare-fun e!363545 () Unit!21446)

(declare-fun Unit!21448 () Unit!21446)

(assert (=> b!635611 (= e!363545 Unit!21448)))

(assert (=> b!635611 false))

(declare-fun b!635612 () Bool)

(declare-fun e!363552 () Bool)

(assert (=> b!635612 (= e!363542 e!363552)))

(declare-fun res!411198 () Bool)

(assert (=> b!635612 (=> (not res!411198) (not e!363552))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!635612 (= res!411198 (= (select (store (arr!18338 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!635612 (= lt!293896 (array!38223 (store (arr!18338 a!2986) i!1108 k!1786) (size!18702 a!2986)))))

(declare-fun b!635613 () Bool)

(declare-fun e!363547 () Bool)

(assert (=> b!635613 (= e!363547 (not e!363546))))

(declare-fun res!411189 () Bool)

(assert (=> b!635613 (=> res!411189 e!363546)))

(declare-fun lt!293893 () SeekEntryResult!6778)

(assert (=> b!635613 (= res!411189 (not (= lt!293893 (Found!6778 index!984))))))

(declare-fun lt!293901 () Unit!21446)

(assert (=> b!635613 (= lt!293901 e!363545)))

(declare-fun c!72575 () Bool)

(assert (=> b!635613 (= c!72575 (= lt!293893 Undefined!6778))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38222 (_ BitVec 32)) SeekEntryResult!6778)

(assert (=> b!635613 (= lt!293893 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!293898 lt!293896 mask!3053))))

(assert (=> b!635613 e!363544))

(declare-fun res!411190 () Bool)

(assert (=> b!635613 (=> (not res!411190) (not e!363544))))

(declare-fun lt!293900 () (_ BitVec 32))

(assert (=> b!635613 (= res!411190 (= lt!293902 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293900 vacantSpotIndex!68 lt!293898 lt!293896 mask!3053)))))

(assert (=> b!635613 (= lt!293902 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293900 vacantSpotIndex!68 (select (arr!18338 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!635613 (= lt!293898 (select (store (arr!18338 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!293899 () Unit!21446)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38222 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21446)

(assert (=> b!635613 (= lt!293899 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!293900 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!635613 (= lt!293900 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!635614 () Bool)

(declare-fun res!411200 () Bool)

(assert (=> b!635614 (=> (not res!411200) (not e!363542))))

(assert (=> b!635614 (= res!411200 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18338 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!635615 () Bool)

(declare-fun res!411202 () Bool)

(assert (=> b!635615 (=> (not res!411202) (not e!363548))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!635615 (= res!411202 (validKeyInArray!0 k!1786))))

(declare-fun b!635616 () Bool)

(declare-fun res!411192 () Bool)

(assert (=> b!635616 (=> (not res!411192) (not e!363548))))

(assert (=> b!635616 (= res!411192 (validKeyInArray!0 (select (arr!18338 a!2986) j!136)))))

(declare-fun b!635617 () Bool)

(assert (=> b!635617 (= e!363541 (arrayContainsKey!0 lt!293896 (select (arr!18338 a!2986) j!136) index!984))))

(declare-fun b!635618 () Bool)

(assert (=> b!635618 (= e!363543 true)))

(assert (=> b!635618 (arrayContainsKey!0 lt!293896 (select (arr!18338 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!293897 () Unit!21446)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38222 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21446)

(assert (=> b!635618 (= lt!293897 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!293896 (select (arr!18338 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!635619 () Bool)

(declare-fun Unit!21449 () Unit!21446)

(assert (=> b!635619 (= e!363545 Unit!21449)))

(declare-fun b!635620 () Bool)

(declare-fun res!411196 () Bool)

(assert (=> b!635620 (=> (not res!411196) (not e!363548))))

(assert (=> b!635620 (= res!411196 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!635621 () Bool)

(assert (=> b!635621 (= e!363552 e!363547)))

(declare-fun res!411187 () Bool)

(assert (=> b!635621 (=> (not res!411187) (not e!363547))))

(assert (=> b!635621 (= res!411187 (and (= lt!293894 (Found!6778 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18338 a!2986) index!984) (select (arr!18338 a!2986) j!136))) (not (= (select (arr!18338 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!635621 (= lt!293894 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18338 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!57432 res!411201) b!635609))

(assert (= (and b!635609 res!411191) b!635616))

(assert (= (and b!635616 res!411192) b!635615))

(assert (= (and b!635615 res!411202) b!635620))

(assert (= (and b!635620 res!411196) b!635605))

(assert (= (and b!635605 res!411199) b!635608))

(assert (= (and b!635608 res!411195) b!635607))

(assert (= (and b!635607 res!411188) b!635614))

(assert (= (and b!635614 res!411200) b!635612))

(assert (= (and b!635612 res!411198) b!635621))

(assert (= (and b!635621 res!411187) b!635613))

(assert (= (and b!635613 res!411190) b!635610))

(assert (= (and b!635613 c!72575) b!635611))

(assert (= (and b!635613 (not c!72575)) b!635619))

(assert (= (and b!635613 (not res!411189)) b!635606))

(assert (= (and b!635606 res!411193) b!635604))

(assert (= (and b!635604 (not res!411203)) b!635603))

(assert (= (and b!635603 res!411197) b!635617))

(assert (= (and b!635606 (not res!411194)) b!635618))

(declare-fun m!609939 () Bool)

(assert (=> b!635614 m!609939))

(declare-fun m!609941 () Bool)

(assert (=> b!635606 m!609941))

(declare-fun m!609943 () Bool)

(assert (=> b!635606 m!609943))

(declare-fun m!609945 () Bool)

(assert (=> b!635606 m!609945))

(assert (=> b!635618 m!609941))

(assert (=> b!635618 m!609941))

(declare-fun m!609947 () Bool)

(assert (=> b!635618 m!609947))

(assert (=> b!635618 m!609941))

(declare-fun m!609949 () Bool)

(assert (=> b!635618 m!609949))

(declare-fun m!609951 () Bool)

(assert (=> b!635613 m!609951))

(assert (=> b!635613 m!609941))

(declare-fun m!609953 () Bool)

(assert (=> b!635613 m!609953))

(assert (=> b!635613 m!609943))

(declare-fun m!609955 () Bool)

(assert (=> b!635613 m!609955))

(assert (=> b!635613 m!609941))

(declare-fun m!609957 () Bool)

(assert (=> b!635613 m!609957))

(declare-fun m!609959 () Bool)

(assert (=> b!635613 m!609959))

(declare-fun m!609961 () Bool)

(assert (=> b!635613 m!609961))

(assert (=> b!635616 m!609941))

(assert (=> b!635616 m!609941))

(declare-fun m!609963 () Bool)

(assert (=> b!635616 m!609963))

(declare-fun m!609965 () Bool)

(assert (=> b!635621 m!609965))

(assert (=> b!635621 m!609941))

(assert (=> b!635621 m!609941))

(declare-fun m!609967 () Bool)

(assert (=> b!635621 m!609967))

(declare-fun m!609969 () Bool)

(assert (=> b!635620 m!609969))

(assert (=> b!635603 m!609941))

(assert (=> b!635603 m!609941))

(declare-fun m!609971 () Bool)

(assert (=> b!635603 m!609971))

(assert (=> b!635612 m!609943))

(declare-fun m!609973 () Bool)

(assert (=> b!635612 m!609973))

(assert (=> b!635617 m!609941))

(assert (=> b!635617 m!609941))

(declare-fun m!609975 () Bool)

(assert (=> b!635617 m!609975))

(declare-fun m!609977 () Bool)

(assert (=> b!635605 m!609977))

(declare-fun m!609979 () Bool)

(assert (=> b!635607 m!609979))

(declare-fun m!609981 () Bool)

(assert (=> start!57432 m!609981))

(declare-fun m!609983 () Bool)

(assert (=> start!57432 m!609983))

(declare-fun m!609985 () Bool)

(assert (=> b!635615 m!609985))

(assert (=> b!635604 m!609941))

(declare-fun m!609987 () Bool)

(assert (=> b!635608 m!609987))

(push 1)

