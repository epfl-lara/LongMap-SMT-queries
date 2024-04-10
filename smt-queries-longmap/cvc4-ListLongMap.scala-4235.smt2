; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58434 () Bool)

(assert start!58434)

(declare-fun b!645160 () Bool)

(declare-datatypes ((Unit!21888 0))(
  ( (Unit!21889) )
))
(declare-fun e!369706 () Unit!21888)

(declare-fun Unit!21890 () Unit!21888)

(assert (=> b!645160 (= e!369706 Unit!21890)))

(assert (=> b!645160 false))

(declare-fun b!645161 () Bool)

(declare-fun Unit!21891 () Unit!21888)

(assert (=> b!645161 (= e!369706 Unit!21891)))

(declare-fun b!645162 () Bool)

(declare-fun res!417957 () Bool)

(declare-fun e!369717 () Bool)

(assert (=> b!645162 (=> (not res!417957) (not e!369717))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38450 0))(
  ( (array!38451 (arr!18437 (Array (_ BitVec 32) (_ BitVec 64))) (size!18801 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38450)

(assert (=> b!645162 (= res!417957 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18437 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!645164 () Bool)

(declare-fun res!417966 () Bool)

(declare-fun e!369710 () Bool)

(assert (=> b!645164 (=> (not res!417966) (not e!369710))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!645164 (= res!417966 (and (= (size!18801 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18801 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18801 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!645165 () Bool)

(declare-fun e!369715 () Bool)

(declare-fun e!369711 () Bool)

(assert (=> b!645165 (= e!369715 e!369711)))

(declare-fun res!417965 () Bool)

(assert (=> b!645165 (=> res!417965 e!369711)))

(assert (=> b!645165 (= res!417965 (bvsge index!984 j!136))))

(declare-fun lt!299106 () Unit!21888)

(declare-fun e!369712 () Unit!21888)

(assert (=> b!645165 (= lt!299106 e!369712)))

(declare-fun c!73972 () Bool)

(assert (=> b!645165 (= c!73972 (bvslt j!136 index!984))))

(declare-fun b!645166 () Bool)

(declare-fun e!369708 () Bool)

(assert (=> b!645166 (= e!369708 e!369715)))

(declare-fun res!417951 () Bool)

(assert (=> b!645166 (=> res!417951 e!369715)))

(declare-fun lt!299115 () (_ BitVec 64))

(declare-fun lt!299109 () (_ BitVec 64))

(assert (=> b!645166 (= res!417951 (or (not (= (select (arr!18437 a!2986) j!136) lt!299115)) (not (= (select (arr!18437 a!2986) j!136) lt!299109))))))

(declare-fun e!369704 () Bool)

(assert (=> b!645166 e!369704))

(declare-fun res!417958 () Bool)

(assert (=> b!645166 (=> (not res!417958) (not e!369704))))

(assert (=> b!645166 (= res!417958 (= lt!299109 (select (arr!18437 a!2986) j!136)))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!645166 (= lt!299109 (select (store (arr!18437 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!645167 () Bool)

(declare-fun e!369703 () Bool)

(assert (=> b!645167 (= e!369703 (not e!369708))))

(declare-fun res!417954 () Bool)

(assert (=> b!645167 (=> res!417954 e!369708)))

(declare-datatypes ((SeekEntryResult!6877 0))(
  ( (MissingZero!6877 (index!29843 (_ BitVec 32))) (Found!6877 (index!29844 (_ BitVec 32))) (Intermediate!6877 (undefined!7689 Bool) (index!29845 (_ BitVec 32)) (x!58614 (_ BitVec 32))) (Undefined!6877) (MissingVacant!6877 (index!29846 (_ BitVec 32))) )
))
(declare-fun lt!299104 () SeekEntryResult!6877)

(assert (=> b!645167 (= res!417954 (not (= lt!299104 (Found!6877 index!984))))))

(declare-fun lt!299110 () Unit!21888)

(assert (=> b!645167 (= lt!299110 e!369706)))

(declare-fun c!73973 () Bool)

(assert (=> b!645167 (= c!73973 (= lt!299104 Undefined!6877))))

(declare-fun lt!299102 () array!38450)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38450 (_ BitVec 32)) SeekEntryResult!6877)

(assert (=> b!645167 (= lt!299104 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!299115 lt!299102 mask!3053))))

(declare-fun e!369713 () Bool)

(assert (=> b!645167 e!369713))

(declare-fun res!417956 () Bool)

(assert (=> b!645167 (=> (not res!417956) (not e!369713))))

(declare-fun lt!299103 () SeekEntryResult!6877)

(declare-fun lt!299111 () (_ BitVec 32))

(assert (=> b!645167 (= res!417956 (= lt!299103 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299111 vacantSpotIndex!68 lt!299115 lt!299102 mask!3053)))))

(assert (=> b!645167 (= lt!299103 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299111 vacantSpotIndex!68 (select (arr!18437 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!645167 (= lt!299115 (select (store (arr!18437 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!299105 () Unit!21888)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38450 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21888)

(assert (=> b!645167 (= lt!299105 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!299111 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!645167 (= lt!299111 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!645168 () Bool)

(declare-fun Unit!21892 () Unit!21888)

(assert (=> b!645168 (= e!369712 Unit!21892)))

(declare-fun b!645169 () Bool)

(declare-fun e!369709 () Bool)

(assert (=> b!645169 (= e!369709 e!369703)))

(declare-fun res!417968 () Bool)

(assert (=> b!645169 (=> (not res!417968) (not e!369703))))

(declare-fun lt!299114 () SeekEntryResult!6877)

(assert (=> b!645169 (= res!417968 (and (= lt!299114 (Found!6877 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18437 a!2986) index!984) (select (arr!18437 a!2986) j!136))) (not (= (select (arr!18437 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!645169 (= lt!299114 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18437 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!645170 () Bool)

(assert (=> b!645170 (= e!369710 e!369717)))

(declare-fun res!417960 () Bool)

(assert (=> b!645170 (=> (not res!417960) (not e!369717))))

(declare-fun lt!299113 () SeekEntryResult!6877)

(assert (=> b!645170 (= res!417960 (or (= lt!299113 (MissingZero!6877 i!1108)) (= lt!299113 (MissingVacant!6877 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38450 (_ BitVec 32)) SeekEntryResult!6877)

(assert (=> b!645170 (= lt!299113 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!645171 () Bool)

(declare-fun res!417953 () Bool)

(assert (=> b!645171 (=> (not res!417953) (not e!369710))))

(declare-fun arrayContainsKey!0 (array!38450 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!645171 (= res!417953 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!645172 () Bool)

(declare-fun res!417955 () Bool)

(assert (=> b!645172 (=> (not res!417955) (not e!369710))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!645172 (= res!417955 (validKeyInArray!0 (select (arr!18437 a!2986) j!136)))))

(declare-fun b!645173 () Bool)

(assert (=> b!645173 (= e!369717 e!369709)))

(declare-fun res!417964 () Bool)

(assert (=> b!645173 (=> (not res!417964) (not e!369709))))

(assert (=> b!645173 (= res!417964 (= (select (store (arr!18437 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!645173 (= lt!299102 (array!38451 (store (arr!18437 a!2986) i!1108 k!1786) (size!18801 a!2986)))))

(declare-fun b!645174 () Bool)

(declare-fun e!369716 () Bool)

(assert (=> b!645174 (= e!369716 (arrayContainsKey!0 lt!299102 (select (arr!18437 a!2986) j!136) index!984))))

(declare-fun b!645175 () Bool)

(declare-fun e!369707 () Bool)

(declare-fun e!369705 () Bool)

(assert (=> b!645175 (= e!369707 e!369705)))

(declare-fun res!417962 () Bool)

(assert (=> b!645175 (=> (not res!417962) (not e!369705))))

(assert (=> b!645175 (= res!417962 (arrayContainsKey!0 lt!299102 (select (arr!18437 a!2986) j!136) j!136))))

(declare-fun b!645176 () Bool)

(assert (=> b!645176 (= e!369713 (= lt!299114 lt!299103))))

(declare-fun b!645177 () Bool)

(declare-fun res!417952 () Bool)

(assert (=> b!645177 (=> (not res!417952) (not e!369710))))

(assert (=> b!645177 (= res!417952 (validKeyInArray!0 k!1786))))

(declare-fun b!645178 () Bool)

(assert (=> b!645178 (= e!369705 (arrayContainsKey!0 lt!299102 (select (arr!18437 a!2986) j!136) index!984))))

(declare-fun b!645163 () Bool)

(declare-fun res!417961 () Bool)

(assert (=> b!645163 (=> (not res!417961) (not e!369717))))

(declare-datatypes ((List!12478 0))(
  ( (Nil!12475) (Cons!12474 (h!13519 (_ BitVec 64)) (t!18706 List!12478)) )
))
(declare-fun arrayNoDuplicates!0 (array!38450 (_ BitVec 32) List!12478) Bool)

(assert (=> b!645163 (= res!417961 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12475))))

(declare-fun res!417967 () Bool)

(assert (=> start!58434 (=> (not res!417967) (not e!369710))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58434 (= res!417967 (validMask!0 mask!3053))))

(assert (=> start!58434 e!369710))

(assert (=> start!58434 true))

(declare-fun array_inv!14233 (array!38450) Bool)

(assert (=> start!58434 (array_inv!14233 a!2986)))

(declare-fun b!645179 () Bool)

(declare-fun Unit!21893 () Unit!21888)

(assert (=> b!645179 (= e!369712 Unit!21893)))

(declare-fun lt!299112 () Unit!21888)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38450 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21888)

(assert (=> b!645179 (= lt!299112 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299102 (select (arr!18437 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!645179 (arrayContainsKey!0 lt!299102 (select (arr!18437 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!299116 () Unit!21888)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38450 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12478) Unit!21888)

(assert (=> b!645179 (= lt!299116 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12475))))

(assert (=> b!645179 (arrayNoDuplicates!0 lt!299102 #b00000000000000000000000000000000 Nil!12475)))

(declare-fun lt!299107 () Unit!21888)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38450 (_ BitVec 32) (_ BitVec 32)) Unit!21888)

(assert (=> b!645179 (= lt!299107 (lemmaNoDuplicateFromThenFromBigger!0 lt!299102 #b00000000000000000000000000000000 j!136))))

(assert (=> b!645179 (arrayNoDuplicates!0 lt!299102 j!136 Nil!12475)))

(declare-fun lt!299108 () Unit!21888)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38450 (_ BitVec 64) (_ BitVec 32) List!12478) Unit!21888)

(assert (=> b!645179 (= lt!299108 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!299102 (select (arr!18437 a!2986) j!136) j!136 Nil!12475))))

(assert (=> b!645179 false))

(declare-fun b!645180 () Bool)

(assert (=> b!645180 (= e!369704 e!369707)))

(declare-fun res!417950 () Bool)

(assert (=> b!645180 (=> res!417950 e!369707)))

(assert (=> b!645180 (= res!417950 (or (not (= (select (arr!18437 a!2986) j!136) lt!299115)) (not (= (select (arr!18437 a!2986) j!136) lt!299109)) (bvsge j!136 index!984)))))

(declare-fun b!645181 () Bool)

(declare-fun res!417963 () Bool)

(assert (=> b!645181 (=> (not res!417963) (not e!369717))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38450 (_ BitVec 32)) Bool)

(assert (=> b!645181 (= res!417963 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!645182 () Bool)

(assert (=> b!645182 (= e!369711 true)))

(assert (=> b!645182 e!369716))

(declare-fun res!417959 () Bool)

(assert (=> b!645182 (=> (not res!417959) (not e!369716))))

(assert (=> b!645182 (= res!417959 (arrayContainsKey!0 lt!299102 (select (arr!18437 a!2986) j!136) j!136))))

(assert (= (and start!58434 res!417967) b!645164))

(assert (= (and b!645164 res!417966) b!645172))

(assert (= (and b!645172 res!417955) b!645177))

(assert (= (and b!645177 res!417952) b!645171))

(assert (= (and b!645171 res!417953) b!645170))

(assert (= (and b!645170 res!417960) b!645181))

(assert (= (and b!645181 res!417963) b!645163))

(assert (= (and b!645163 res!417961) b!645162))

(assert (= (and b!645162 res!417957) b!645173))

(assert (= (and b!645173 res!417964) b!645169))

(assert (= (and b!645169 res!417968) b!645167))

(assert (= (and b!645167 res!417956) b!645176))

(assert (= (and b!645167 c!73973) b!645160))

(assert (= (and b!645167 (not c!73973)) b!645161))

(assert (= (and b!645167 (not res!417954)) b!645166))

(assert (= (and b!645166 res!417958) b!645180))

(assert (= (and b!645180 (not res!417950)) b!645175))

(assert (= (and b!645175 res!417962) b!645178))

(assert (= (and b!645166 (not res!417951)) b!645165))

(assert (= (and b!645165 c!73972) b!645179))

(assert (= (and b!645165 (not c!73972)) b!645168))

(assert (= (and b!645165 (not res!417965)) b!645182))

(assert (= (and b!645182 res!417959) b!645174))

(declare-fun m!618701 () Bool)

(assert (=> b!645177 m!618701))

(declare-fun m!618703 () Bool)

(assert (=> b!645167 m!618703))

(declare-fun m!618705 () Bool)

(assert (=> b!645167 m!618705))

(declare-fun m!618707 () Bool)

(assert (=> b!645167 m!618707))

(declare-fun m!618709 () Bool)

(assert (=> b!645167 m!618709))

(assert (=> b!645167 m!618707))

(declare-fun m!618711 () Bool)

(assert (=> b!645167 m!618711))

(declare-fun m!618713 () Bool)

(assert (=> b!645167 m!618713))

(declare-fun m!618715 () Bool)

(assert (=> b!645167 m!618715))

(declare-fun m!618717 () Bool)

(assert (=> b!645167 m!618717))

(assert (=> b!645166 m!618707))

(assert (=> b!645166 m!618709))

(declare-fun m!618719 () Bool)

(assert (=> b!645166 m!618719))

(assert (=> b!645180 m!618707))

(declare-fun m!618721 () Bool)

(assert (=> b!645169 m!618721))

(assert (=> b!645169 m!618707))

(assert (=> b!645169 m!618707))

(declare-fun m!618723 () Bool)

(assert (=> b!645169 m!618723))

(assert (=> b!645175 m!618707))

(assert (=> b!645175 m!618707))

(declare-fun m!618725 () Bool)

(assert (=> b!645175 m!618725))

(assert (=> b!645182 m!618707))

(assert (=> b!645182 m!618707))

(assert (=> b!645182 m!618725))

(assert (=> b!645174 m!618707))

(assert (=> b!645174 m!618707))

(declare-fun m!618727 () Bool)

(assert (=> b!645174 m!618727))

(declare-fun m!618729 () Bool)

(assert (=> b!645163 m!618729))

(declare-fun m!618731 () Bool)

(assert (=> b!645179 m!618731))

(assert (=> b!645179 m!618707))

(declare-fun m!618733 () Bool)

(assert (=> b!645179 m!618733))

(assert (=> b!645179 m!618707))

(declare-fun m!618735 () Bool)

(assert (=> b!645179 m!618735))

(declare-fun m!618737 () Bool)

(assert (=> b!645179 m!618737))

(declare-fun m!618739 () Bool)

(assert (=> b!645179 m!618739))

(declare-fun m!618741 () Bool)

(assert (=> b!645179 m!618741))

(assert (=> b!645179 m!618707))

(declare-fun m!618743 () Bool)

(assert (=> b!645179 m!618743))

(assert (=> b!645179 m!618707))

(declare-fun m!618745 () Bool)

(assert (=> b!645181 m!618745))

(declare-fun m!618747 () Bool)

(assert (=> b!645170 m!618747))

(declare-fun m!618749 () Bool)

(assert (=> b!645162 m!618749))

(assert (=> b!645178 m!618707))

(assert (=> b!645178 m!618707))

(assert (=> b!645178 m!618727))

(assert (=> b!645173 m!618709))

(declare-fun m!618751 () Bool)

(assert (=> b!645173 m!618751))

(declare-fun m!618753 () Bool)

(assert (=> start!58434 m!618753))

(declare-fun m!618755 () Bool)

(assert (=> start!58434 m!618755))

(assert (=> b!645172 m!618707))

(assert (=> b!645172 m!618707))

(declare-fun m!618757 () Bool)

(assert (=> b!645172 m!618757))

(declare-fun m!618759 () Bool)

(assert (=> b!645171 m!618759))

(push 1)

