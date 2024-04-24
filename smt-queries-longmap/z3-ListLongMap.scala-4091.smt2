; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56094 () Bool)

(assert start!56094)

(declare-fun b!617182 () Bool)

(declare-datatypes ((Unit!20137 0))(
  ( (Unit!20138) )
))
(declare-fun e!353915 () Unit!20137)

(declare-fun Unit!20139 () Unit!20137)

(assert (=> b!617182 (= e!353915 Unit!20139)))

(declare-fun b!617183 () Bool)

(declare-fun res!397565 () Bool)

(declare-fun e!353904 () Bool)

(assert (=> b!617183 (=> (not res!397565) (not e!353904))))

(declare-datatypes ((array!37509 0))(
  ( (array!37510 (arr!17998 (Array (_ BitVec 32) (_ BitVec 64))) (size!18362 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37509)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37509 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!617183 (= res!397565 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!353910 () Bool)

(declare-fun b!617184 () Bool)

(declare-fun lt!284045 () array!37509)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!617184 (= e!353910 (arrayContainsKey!0 lt!284045 (select (arr!17998 a!2986) j!136) index!984))))

(declare-fun b!617185 () Bool)

(assert (=> b!617185 false))

(declare-fun lt!284058 () Unit!20137)

(declare-datatypes ((List!11946 0))(
  ( (Nil!11943) (Cons!11942 (h!12990 (_ BitVec 64)) (t!18166 List!11946)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37509 (_ BitVec 64) (_ BitVec 32) List!11946) Unit!20137)

(assert (=> b!617185 (= lt!284058 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!284045 (select (arr!17998 a!2986) j!136) j!136 Nil!11943))))

(declare-fun arrayNoDuplicates!0 (array!37509 (_ BitVec 32) List!11946) Bool)

(assert (=> b!617185 (arrayNoDuplicates!0 lt!284045 j!136 Nil!11943)))

(declare-fun lt!284043 () Unit!20137)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37509 (_ BitVec 32) (_ BitVec 32)) Unit!20137)

(assert (=> b!617185 (= lt!284043 (lemmaNoDuplicateFromThenFromBigger!0 lt!284045 #b00000000000000000000000000000000 j!136))))

(assert (=> b!617185 (arrayNoDuplicates!0 lt!284045 #b00000000000000000000000000000000 Nil!11943)))

(declare-fun lt!284040 () Unit!20137)

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37509 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11946) Unit!20137)

(assert (=> b!617185 (= lt!284040 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11943))))

(assert (=> b!617185 (arrayContainsKey!0 lt!284045 (select (arr!17998 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!284044 () Unit!20137)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37509 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20137)

(assert (=> b!617185 (= lt!284044 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!284045 (select (arr!17998 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!353907 () Unit!20137)

(declare-fun Unit!20140 () Unit!20137)

(assert (=> b!617185 (= e!353907 Unit!20140)))

(declare-fun b!617186 () Bool)

(declare-fun res!397564 () Bool)

(declare-fun e!353916 () Bool)

(assert (=> b!617186 (=> (not res!397564) (not e!353916))))

(assert (=> b!617186 (= res!397564 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11943))))

(declare-fun b!617187 () Bool)

(assert (=> b!617187 false))

(declare-fun lt!284056 () Unit!20137)

(assert (=> b!617187 (= lt!284056 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!284045 (select (arr!17998 a!2986) j!136) index!984 Nil!11943))))

(assert (=> b!617187 (arrayNoDuplicates!0 lt!284045 index!984 Nil!11943)))

(declare-fun lt!284053 () Unit!20137)

(assert (=> b!617187 (= lt!284053 (lemmaNoDuplicateFromThenFromBigger!0 lt!284045 #b00000000000000000000000000000000 index!984))))

(assert (=> b!617187 (arrayNoDuplicates!0 lt!284045 #b00000000000000000000000000000000 Nil!11943)))

(declare-fun lt!284048 () Unit!20137)

(assert (=> b!617187 (= lt!284048 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11943))))

(assert (=> b!617187 (arrayContainsKey!0 lt!284045 (select (arr!17998 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!284052 () Unit!20137)

(assert (=> b!617187 (= lt!284052 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!284045 (select (arr!17998 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!353909 () Bool)

(assert (=> b!617187 e!353909))

(declare-fun res!397553 () Bool)

(assert (=> b!617187 (=> (not res!397553) (not e!353909))))

(assert (=> b!617187 (= res!397553 (arrayContainsKey!0 lt!284045 (select (arr!17998 a!2986) j!136) j!136))))

(declare-fun e!353911 () Unit!20137)

(declare-fun Unit!20141 () Unit!20137)

(assert (=> b!617187 (= e!353911 Unit!20141)))

(declare-fun res!397562 () Bool)

(assert (=> start!56094 (=> (not res!397562) (not e!353904))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56094 (= res!397562 (validMask!0 mask!3053))))

(assert (=> start!56094 e!353904))

(assert (=> start!56094 true))

(declare-fun array_inv!13857 (array!37509) Bool)

(assert (=> start!56094 (array_inv!13857 a!2986)))

(declare-fun b!617188 () Bool)

(declare-fun e!353908 () Bool)

(declare-fun e!353905 () Bool)

(assert (=> b!617188 (= e!353908 (not e!353905))))

(declare-fun res!397558 () Bool)

(assert (=> b!617188 (=> res!397558 e!353905)))

(declare-datatypes ((SeekEntryResult!6394 0))(
  ( (MissingZero!6394 (index!27860 (_ BitVec 32))) (Found!6394 (index!27861 (_ BitVec 32))) (Intermediate!6394 (undefined!7206 Bool) (index!27862 (_ BitVec 32)) (x!56805 (_ BitVec 32))) (Undefined!6394) (MissingVacant!6394 (index!27863 (_ BitVec 32))) )
))
(declare-fun lt!284049 () SeekEntryResult!6394)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!617188 (= res!397558 (not (= lt!284049 (MissingVacant!6394 vacantSpotIndex!68))))))

(declare-fun lt!284047 () Unit!20137)

(assert (=> b!617188 (= lt!284047 e!353915)))

(declare-fun c!70187 () Bool)

(assert (=> b!617188 (= c!70187 (= lt!284049 (Found!6394 index!984)))))

(declare-fun lt!284041 () Unit!20137)

(declare-fun e!353902 () Unit!20137)

(assert (=> b!617188 (= lt!284041 e!353902)))

(declare-fun c!70186 () Bool)

(assert (=> b!617188 (= c!70186 (= lt!284049 Undefined!6394))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!284055 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37509 (_ BitVec 32)) SeekEntryResult!6394)

(assert (=> b!617188 (= lt!284049 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!284055 lt!284045 mask!3053))))

(declare-fun e!353906 () Bool)

(assert (=> b!617188 e!353906))

(declare-fun res!397567 () Bool)

(assert (=> b!617188 (=> (not res!397567) (not e!353906))))

(declare-fun lt!284059 () (_ BitVec 32))

(declare-fun lt!284046 () SeekEntryResult!6394)

(assert (=> b!617188 (= res!397567 (= lt!284046 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!284059 vacantSpotIndex!68 lt!284055 lt!284045 mask!3053)))))

(assert (=> b!617188 (= lt!284046 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!284059 vacantSpotIndex!68 (select (arr!17998 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!617188 (= lt!284055 (select (store (arr!17998 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!284042 () Unit!20137)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37509 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20137)

(assert (=> b!617188 (= lt!284042 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!284059 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!617188 (= lt!284059 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!617189 () Bool)

(declare-fun res!397555 () Bool)

(assert (=> b!617189 (= res!397555 (bvsge j!136 index!984))))

(declare-fun e!353912 () Bool)

(assert (=> b!617189 (=> res!397555 e!353912)))

(declare-fun e!353903 () Bool)

(assert (=> b!617189 (= e!353903 e!353912)))

(declare-fun b!617190 () Bool)

(assert (=> b!617190 (= e!353909 (arrayContainsKey!0 lt!284045 (select (arr!17998 a!2986) j!136) index!984))))

(declare-fun b!617191 () Bool)

(declare-fun res!397563 () Bool)

(assert (=> b!617191 (=> (not res!397563) (not e!353916))))

(assert (=> b!617191 (= res!397563 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17998 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!617192 () Bool)

(declare-fun Unit!20142 () Unit!20137)

(assert (=> b!617192 (= e!353902 Unit!20142)))

(assert (=> b!617192 false))

(declare-fun b!617193 () Bool)

(declare-fun res!397556 () Bool)

(assert (=> b!617193 (=> (not res!397556) (not e!353904))))

(assert (=> b!617193 (= res!397556 (and (= (size!18362 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18362 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18362 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!617194 () Bool)

(declare-fun lt!284057 () SeekEntryResult!6394)

(assert (=> b!617194 (= e!353906 (= lt!284057 lt!284046))))

(declare-fun b!617195 () Bool)

(declare-fun Unit!20143 () Unit!20137)

(assert (=> b!617195 (= e!353907 Unit!20143)))

(declare-fun b!617196 () Bool)

(declare-fun e!353913 () Bool)

(assert (=> b!617196 (= e!353913 e!353908)))

(declare-fun res!397559 () Bool)

(assert (=> b!617196 (=> (not res!397559) (not e!353908))))

(assert (=> b!617196 (= res!397559 (and (= lt!284057 (Found!6394 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17998 a!2986) index!984) (select (arr!17998 a!2986) j!136))) (not (= (select (arr!17998 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!617196 (= lt!284057 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17998 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!617197 () Bool)

(declare-fun Unit!20144 () Unit!20137)

(assert (=> b!617197 (= e!353902 Unit!20144)))

(declare-fun b!617198 () Bool)

(declare-fun Unit!20145 () Unit!20137)

(assert (=> b!617198 (= e!353915 Unit!20145)))

(declare-fun res!397557 () Bool)

(assert (=> b!617198 (= res!397557 (= (select (store (arr!17998 a!2986) i!1108 k0!1786) index!984) (select (arr!17998 a!2986) j!136)))))

(assert (=> b!617198 (=> (not res!397557) (not e!353903))))

(assert (=> b!617198 e!353903))

(declare-fun c!70185 () Bool)

(assert (=> b!617198 (= c!70185 (bvslt j!136 index!984))))

(declare-fun lt!284051 () Unit!20137)

(assert (=> b!617198 (= lt!284051 e!353907)))

(declare-fun c!70184 () Bool)

(assert (=> b!617198 (= c!70184 (bvslt index!984 j!136))))

(declare-fun lt!284054 () Unit!20137)

(assert (=> b!617198 (= lt!284054 e!353911)))

(assert (=> b!617198 false))

(declare-fun b!617199 () Bool)

(declare-fun res!397561 () Bool)

(assert (=> b!617199 (=> (not res!397561) (not e!353916))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37509 (_ BitVec 32)) Bool)

(assert (=> b!617199 (= res!397561 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!617200 () Bool)

(declare-fun res!397554 () Bool)

(assert (=> b!617200 (=> (not res!397554) (not e!353904))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!617200 (= res!397554 (validKeyInArray!0 k0!1786))))

(declare-fun b!617201 () Bool)

(assert (=> b!617201 (= e!353916 e!353913)))

(declare-fun res!397552 () Bool)

(assert (=> b!617201 (=> (not res!397552) (not e!353913))))

(assert (=> b!617201 (= res!397552 (= (select (store (arr!17998 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!617201 (= lt!284045 (array!37510 (store (arr!17998 a!2986) i!1108 k0!1786) (size!18362 a!2986)))))

(declare-fun b!617202 () Bool)

(assert (=> b!617202 (= e!353904 e!353916)))

(declare-fun res!397560 () Bool)

(assert (=> b!617202 (=> (not res!397560) (not e!353916))))

(declare-fun lt!284050 () SeekEntryResult!6394)

(assert (=> b!617202 (= res!397560 (or (= lt!284050 (MissingZero!6394 i!1108)) (= lt!284050 (MissingVacant!6394 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37509 (_ BitVec 32)) SeekEntryResult!6394)

(assert (=> b!617202 (= lt!284050 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!617203 () Bool)

(assert (=> b!617203 (= e!353905 true)))

(assert (=> b!617203 (= (select (store (arr!17998 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!617204 () Bool)

(declare-fun res!397566 () Bool)

(assert (=> b!617204 (=> (not res!397566) (not e!353904))))

(assert (=> b!617204 (= res!397566 (validKeyInArray!0 (select (arr!17998 a!2986) j!136)))))

(declare-fun b!617205 () Bool)

(declare-fun Unit!20146 () Unit!20137)

(assert (=> b!617205 (= e!353911 Unit!20146)))

(declare-fun b!617206 () Bool)

(declare-fun res!397551 () Bool)

(assert (=> b!617206 (= res!397551 (arrayContainsKey!0 lt!284045 (select (arr!17998 a!2986) j!136) j!136))))

(assert (=> b!617206 (=> (not res!397551) (not e!353910))))

(assert (=> b!617206 (= e!353912 e!353910)))

(assert (= (and start!56094 res!397562) b!617193))

(assert (= (and b!617193 res!397556) b!617204))

(assert (= (and b!617204 res!397566) b!617200))

(assert (= (and b!617200 res!397554) b!617183))

(assert (= (and b!617183 res!397565) b!617202))

(assert (= (and b!617202 res!397560) b!617199))

(assert (= (and b!617199 res!397561) b!617186))

(assert (= (and b!617186 res!397564) b!617191))

(assert (= (and b!617191 res!397563) b!617201))

(assert (= (and b!617201 res!397552) b!617196))

(assert (= (and b!617196 res!397559) b!617188))

(assert (= (and b!617188 res!397567) b!617194))

(assert (= (and b!617188 c!70186) b!617192))

(assert (= (and b!617188 (not c!70186)) b!617197))

(assert (= (and b!617188 c!70187) b!617198))

(assert (= (and b!617188 (not c!70187)) b!617182))

(assert (= (and b!617198 res!397557) b!617189))

(assert (= (and b!617189 (not res!397555)) b!617206))

(assert (= (and b!617206 res!397551) b!617184))

(assert (= (and b!617198 c!70185) b!617185))

(assert (= (and b!617198 (not c!70185)) b!617195))

(assert (= (and b!617198 c!70184) b!617187))

(assert (= (and b!617198 (not c!70184)) b!617205))

(assert (= (and b!617187 res!397553) b!617190))

(assert (= (and b!617188 (not res!397558)) b!617203))

(declare-fun m!593597 () Bool)

(assert (=> b!617184 m!593597))

(assert (=> b!617184 m!593597))

(declare-fun m!593599 () Bool)

(assert (=> b!617184 m!593599))

(declare-fun m!593601 () Bool)

(assert (=> b!617188 m!593601))

(declare-fun m!593603 () Bool)

(assert (=> b!617188 m!593603))

(declare-fun m!593605 () Bool)

(assert (=> b!617188 m!593605))

(assert (=> b!617188 m!593597))

(assert (=> b!617188 m!593597))

(declare-fun m!593607 () Bool)

(assert (=> b!617188 m!593607))

(declare-fun m!593609 () Bool)

(assert (=> b!617188 m!593609))

(declare-fun m!593611 () Bool)

(assert (=> b!617188 m!593611))

(declare-fun m!593613 () Bool)

(assert (=> b!617188 m!593613))

(assert (=> b!617198 m!593613))

(declare-fun m!593615 () Bool)

(assert (=> b!617198 m!593615))

(assert (=> b!617198 m!593597))

(declare-fun m!593617 () Bool)

(assert (=> b!617202 m!593617))

(declare-fun m!593619 () Bool)

(assert (=> b!617186 m!593619))

(assert (=> b!617187 m!593597))

(assert (=> b!617187 m!593597))

(declare-fun m!593621 () Bool)

(assert (=> b!617187 m!593621))

(assert (=> b!617187 m!593597))

(declare-fun m!593623 () Bool)

(assert (=> b!617187 m!593623))

(declare-fun m!593625 () Bool)

(assert (=> b!617187 m!593625))

(assert (=> b!617187 m!593597))

(declare-fun m!593627 () Bool)

(assert (=> b!617187 m!593627))

(declare-fun m!593629 () Bool)

(assert (=> b!617187 m!593629))

(declare-fun m!593631 () Bool)

(assert (=> b!617187 m!593631))

(assert (=> b!617187 m!593597))

(declare-fun m!593633 () Bool)

(assert (=> b!617187 m!593633))

(declare-fun m!593635 () Bool)

(assert (=> b!617187 m!593635))

(declare-fun m!593637 () Bool)

(assert (=> b!617199 m!593637))

(assert (=> b!617185 m!593597))

(declare-fun m!593639 () Bool)

(assert (=> b!617185 m!593639))

(assert (=> b!617185 m!593597))

(assert (=> b!617185 m!593597))

(declare-fun m!593641 () Bool)

(assert (=> b!617185 m!593641))

(declare-fun m!593643 () Bool)

(assert (=> b!617185 m!593643))

(assert (=> b!617185 m!593629))

(assert (=> b!617185 m!593597))

(declare-fun m!593645 () Bool)

(assert (=> b!617185 m!593645))

(declare-fun m!593647 () Bool)

(assert (=> b!617185 m!593647))

(assert (=> b!617185 m!593625))

(assert (=> b!617201 m!593613))

(declare-fun m!593649 () Bool)

(assert (=> b!617201 m!593649))

(declare-fun m!593651 () Bool)

(assert (=> start!56094 m!593651))

(declare-fun m!593653 () Bool)

(assert (=> start!56094 m!593653))

(declare-fun m!593655 () Bool)

(assert (=> b!617196 m!593655))

(assert (=> b!617196 m!593597))

(assert (=> b!617196 m!593597))

(declare-fun m!593657 () Bool)

(assert (=> b!617196 m!593657))

(assert (=> b!617206 m!593597))

(assert (=> b!617206 m!593597))

(assert (=> b!617206 m!593627))

(assert (=> b!617190 m!593597))

(assert (=> b!617190 m!593597))

(assert (=> b!617190 m!593599))

(declare-fun m!593659 () Bool)

(assert (=> b!617183 m!593659))

(assert (=> b!617204 m!593597))

(assert (=> b!617204 m!593597))

(declare-fun m!593661 () Bool)

(assert (=> b!617204 m!593661))

(declare-fun m!593663 () Bool)

(assert (=> b!617200 m!593663))

(assert (=> b!617203 m!593613))

(assert (=> b!617203 m!593615))

(declare-fun m!593665 () Bool)

(assert (=> b!617191 m!593665))

(check-sat (not b!617202) (not b!617196) (not b!617206) (not start!56094) (not b!617199) (not b!617188) (not b!617186) (not b!617185) (not b!617184) (not b!617183) (not b!617187) (not b!617204) (not b!617190) (not b!617200))
(check-sat)
