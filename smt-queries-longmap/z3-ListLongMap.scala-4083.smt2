; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55980 () Bool)

(assert start!55980)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!352562 () Bool)

(declare-datatypes ((array!37464 0))(
  ( (array!37465 (arr!17978 (Array (_ BitVec 32) (_ BitVec 64))) (size!18343 (_ BitVec 32))) )
))
(declare-fun lt!282269 () array!37464)

(declare-fun b!614945 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37464)

(declare-fun arrayContainsKey!0 (array!37464 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!614945 (= e!352562 (arrayContainsKey!0 lt!282269 (select (arr!17978 a!2986) j!136) index!984))))

(declare-fun b!614946 () Bool)

(assert (=> b!614946 false))

(declare-datatypes ((Unit!19896 0))(
  ( (Unit!19897) )
))
(declare-fun lt!282265 () Unit!19896)

(declare-datatypes ((List!12058 0))(
  ( (Nil!12055) (Cons!12054 (h!13099 (_ BitVec 64)) (t!18277 List!12058)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37464 (_ BitVec 64) (_ BitVec 32) List!12058) Unit!19896)

(assert (=> b!614946 (= lt!282265 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!282269 (select (arr!17978 a!2986) j!136) index!984 Nil!12055))))

(declare-fun arrayNoDuplicates!0 (array!37464 (_ BitVec 32) List!12058) Bool)

(assert (=> b!614946 (arrayNoDuplicates!0 lt!282269 index!984 Nil!12055)))

(declare-fun lt!282280 () Unit!19896)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37464 (_ BitVec 32) (_ BitVec 32)) Unit!19896)

(assert (=> b!614946 (= lt!282280 (lemmaNoDuplicateFromThenFromBigger!0 lt!282269 #b00000000000000000000000000000000 index!984))))

(assert (=> b!614946 (arrayNoDuplicates!0 lt!282269 #b00000000000000000000000000000000 Nil!12055)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lt!282271 () Unit!19896)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37464 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12058) Unit!19896)

(assert (=> b!614946 (= lt!282271 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12055))))

(assert (=> b!614946 (arrayContainsKey!0 lt!282269 (select (arr!17978 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!282267 () Unit!19896)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37464 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19896)

(assert (=> b!614946 (= lt!282267 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!282269 (select (arr!17978 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!352573 () Bool)

(assert (=> b!614946 e!352573))

(declare-fun res!396142 () Bool)

(assert (=> b!614946 (=> (not res!396142) (not e!352573))))

(assert (=> b!614946 (= res!396142 (arrayContainsKey!0 lt!282269 (select (arr!17978 a!2986) j!136) j!136))))

(declare-fun e!352566 () Unit!19896)

(declare-fun Unit!19898 () Unit!19896)

(assert (=> b!614946 (= e!352566 Unit!19898)))

(declare-fun b!614947 () Bool)

(declare-fun e!352568 () Unit!19896)

(declare-fun Unit!19899 () Unit!19896)

(assert (=> b!614947 (= e!352568 Unit!19899)))

(declare-fun b!614948 () Bool)

(declare-fun res!396149 () Bool)

(declare-fun e!352574 () Bool)

(assert (=> b!614948 (=> (not res!396149) (not e!352574))))

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!614948 (= res!396149 (and (= (size!18343 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18343 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18343 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!614949 () Bool)

(declare-fun res!396150 () Bool)

(assert (=> b!614949 (=> (not res!396150) (not e!352574))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!614949 (= res!396150 (validKeyInArray!0 (select (arr!17978 a!2986) j!136)))))

(declare-fun res!396145 () Bool)

(assert (=> start!55980 (=> (not res!396145) (not e!352574))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55980 (= res!396145 (validMask!0 mask!3053))))

(assert (=> start!55980 e!352574))

(assert (=> start!55980 true))

(declare-fun array_inv!13861 (array!37464) Bool)

(assert (=> start!55980 (array_inv!13861 a!2986)))

(declare-fun b!614950 () Bool)

(declare-fun e!352567 () Bool)

(assert (=> b!614950 (= e!352574 e!352567)))

(declare-fun res!396152 () Bool)

(assert (=> b!614950 (=> (not res!396152) (not e!352567))))

(declare-datatypes ((SeekEntryResult!6415 0))(
  ( (MissingZero!6415 (index!27944 (_ BitVec 32))) (Found!6415 (index!27945 (_ BitVec 32))) (Intermediate!6415 (undefined!7227 Bool) (index!27946 (_ BitVec 32)) (x!56754 (_ BitVec 32))) (Undefined!6415) (MissingVacant!6415 (index!27947 (_ BitVec 32))) )
))
(declare-fun lt!282275 () SeekEntryResult!6415)

(assert (=> b!614950 (= res!396152 (or (= lt!282275 (MissingZero!6415 i!1108)) (= lt!282275 (MissingVacant!6415 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37464 (_ BitVec 32)) SeekEntryResult!6415)

(assert (=> b!614950 (= lt!282275 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!614951 () Bool)

(declare-fun res!396146 () Bool)

(assert (=> b!614951 (=> (not res!396146) (not e!352567))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37464 (_ BitVec 32)) Bool)

(assert (=> b!614951 (= res!396146 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!396147 () Bool)

(declare-fun b!614952 () Bool)

(assert (=> b!614952 (= res!396147 (arrayContainsKey!0 lt!282269 (select (arr!17978 a!2986) j!136) j!136))))

(assert (=> b!614952 (=> (not res!396147) (not e!352562))))

(declare-fun e!352575 () Bool)

(assert (=> b!614952 (= e!352575 e!352562)))

(declare-fun b!614953 () Bool)

(declare-fun e!352565 () Bool)

(assert (=> b!614953 (= e!352565 (not true))))

(declare-fun lt!282273 () Unit!19896)

(assert (=> b!614953 (= lt!282273 e!352568)))

(declare-fun c!69773 () Bool)

(declare-fun lt!282281 () SeekEntryResult!6415)

(assert (=> b!614953 (= c!69773 (= lt!282281 (Found!6415 index!984)))))

(declare-fun lt!282276 () Unit!19896)

(declare-fun e!352572 () Unit!19896)

(assert (=> b!614953 (= lt!282276 e!352572)))

(declare-fun c!69774 () Bool)

(assert (=> b!614953 (= c!69774 (= lt!282281 Undefined!6415))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!282283 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37464 (_ BitVec 32)) SeekEntryResult!6415)

(assert (=> b!614953 (= lt!282281 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!282283 lt!282269 mask!3053))))

(declare-fun e!352563 () Bool)

(assert (=> b!614953 e!352563))

(declare-fun res!396144 () Bool)

(assert (=> b!614953 (=> (not res!396144) (not e!352563))))

(declare-fun lt!282272 () (_ BitVec 32))

(declare-fun lt!282277 () SeekEntryResult!6415)

(assert (=> b!614953 (= res!396144 (= lt!282277 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!282272 vacantSpotIndex!68 lt!282283 lt!282269 mask!3053)))))

(assert (=> b!614953 (= lt!282277 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!282272 vacantSpotIndex!68 (select (arr!17978 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!614953 (= lt!282283 (select (store (arr!17978 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!282279 () Unit!19896)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37464 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19896)

(assert (=> b!614953 (= lt!282279 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!282272 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!614953 (= lt!282272 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!614954 () Bool)

(assert (=> b!614954 (= e!352573 (arrayContainsKey!0 lt!282269 (select (arr!17978 a!2986) j!136) index!984))))

(declare-fun b!614955 () Bool)

(declare-fun e!352564 () Bool)

(assert (=> b!614955 (= e!352564 e!352565)))

(declare-fun res!396151 () Bool)

(assert (=> b!614955 (=> (not res!396151) (not e!352565))))

(declare-fun lt!282274 () SeekEntryResult!6415)

(assert (=> b!614955 (= res!396151 (and (= lt!282274 (Found!6415 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17978 a!2986) index!984) (select (arr!17978 a!2986) j!136))) (not (= (select (arr!17978 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!614955 (= lt!282274 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17978 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!614956 () Bool)

(declare-fun e!352570 () Unit!19896)

(declare-fun Unit!19900 () Unit!19896)

(assert (=> b!614956 (= e!352570 Unit!19900)))

(declare-fun b!614957 () Bool)

(assert (=> b!614957 (= e!352567 e!352564)))

(declare-fun res!396143 () Bool)

(assert (=> b!614957 (=> (not res!396143) (not e!352564))))

(assert (=> b!614957 (= res!396143 (= (select (store (arr!17978 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!614957 (= lt!282269 (array!37465 (store (arr!17978 a!2986) i!1108 k0!1786) (size!18343 a!2986)))))

(declare-fun b!614958 () Bool)

(declare-fun res!396138 () Bool)

(assert (=> b!614958 (=> (not res!396138) (not e!352574))))

(assert (=> b!614958 (= res!396138 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!614959 () Bool)

(declare-fun res!396140 () Bool)

(assert (=> b!614959 (= res!396140 (bvsge j!136 index!984))))

(assert (=> b!614959 (=> res!396140 e!352575)))

(declare-fun e!352569 () Bool)

(assert (=> b!614959 (= e!352569 e!352575)))

(declare-fun b!614960 () Bool)

(declare-fun res!396148 () Bool)

(assert (=> b!614960 (=> (not res!396148) (not e!352567))))

(assert (=> b!614960 (= res!396148 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17978 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!614961 () Bool)

(declare-fun Unit!19901 () Unit!19896)

(assert (=> b!614961 (= e!352572 Unit!19901)))

(declare-fun b!614962 () Bool)

(assert (=> b!614962 (= e!352563 (= lt!282274 lt!282277))))

(declare-fun b!614963 () Bool)

(declare-fun Unit!19902 () Unit!19896)

(assert (=> b!614963 (= e!352568 Unit!19902)))

(declare-fun res!396139 () Bool)

(assert (=> b!614963 (= res!396139 (= (select (store (arr!17978 a!2986) i!1108 k0!1786) index!984) (select (arr!17978 a!2986) j!136)))))

(assert (=> b!614963 (=> (not res!396139) (not e!352569))))

(assert (=> b!614963 e!352569))

(declare-fun c!69772 () Bool)

(assert (=> b!614963 (= c!69772 (bvslt j!136 index!984))))

(declare-fun lt!282282 () Unit!19896)

(assert (=> b!614963 (= lt!282282 e!352570)))

(declare-fun c!69771 () Bool)

(assert (=> b!614963 (= c!69771 (bvslt index!984 j!136))))

(declare-fun lt!282266 () Unit!19896)

(assert (=> b!614963 (= lt!282266 e!352566)))

(assert (=> b!614963 false))

(declare-fun b!614964 () Bool)

(assert (=> b!614964 false))

(declare-fun lt!282278 () Unit!19896)

(assert (=> b!614964 (= lt!282278 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!282269 (select (arr!17978 a!2986) j!136) j!136 Nil!12055))))

(assert (=> b!614964 (arrayNoDuplicates!0 lt!282269 j!136 Nil!12055)))

(declare-fun lt!282264 () Unit!19896)

(assert (=> b!614964 (= lt!282264 (lemmaNoDuplicateFromThenFromBigger!0 lt!282269 #b00000000000000000000000000000000 j!136))))

(assert (=> b!614964 (arrayNoDuplicates!0 lt!282269 #b00000000000000000000000000000000 Nil!12055)))

(declare-fun lt!282268 () Unit!19896)

(assert (=> b!614964 (= lt!282268 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12055))))

(assert (=> b!614964 (arrayContainsKey!0 lt!282269 (select (arr!17978 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!282270 () Unit!19896)

(assert (=> b!614964 (= lt!282270 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!282269 (select (arr!17978 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!19903 () Unit!19896)

(assert (=> b!614964 (= e!352570 Unit!19903)))

(declare-fun b!614965 () Bool)

(declare-fun res!396141 () Bool)

(assert (=> b!614965 (=> (not res!396141) (not e!352574))))

(assert (=> b!614965 (= res!396141 (validKeyInArray!0 k0!1786))))

(declare-fun b!614966 () Bool)

(declare-fun Unit!19904 () Unit!19896)

(assert (=> b!614966 (= e!352566 Unit!19904)))

(declare-fun b!614967 () Bool)

(declare-fun Unit!19905 () Unit!19896)

(assert (=> b!614967 (= e!352572 Unit!19905)))

(assert (=> b!614967 false))

(declare-fun b!614968 () Bool)

(declare-fun res!396137 () Bool)

(assert (=> b!614968 (=> (not res!396137) (not e!352567))))

(assert (=> b!614968 (= res!396137 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12055))))

(assert (= (and start!55980 res!396145) b!614948))

(assert (= (and b!614948 res!396149) b!614949))

(assert (= (and b!614949 res!396150) b!614965))

(assert (= (and b!614965 res!396141) b!614958))

(assert (= (and b!614958 res!396138) b!614950))

(assert (= (and b!614950 res!396152) b!614951))

(assert (= (and b!614951 res!396146) b!614968))

(assert (= (and b!614968 res!396137) b!614960))

(assert (= (and b!614960 res!396148) b!614957))

(assert (= (and b!614957 res!396143) b!614955))

(assert (= (and b!614955 res!396151) b!614953))

(assert (= (and b!614953 res!396144) b!614962))

(assert (= (and b!614953 c!69774) b!614967))

(assert (= (and b!614953 (not c!69774)) b!614961))

(assert (= (and b!614953 c!69773) b!614963))

(assert (= (and b!614953 (not c!69773)) b!614947))

(assert (= (and b!614963 res!396139) b!614959))

(assert (= (and b!614959 (not res!396140)) b!614952))

(assert (= (and b!614952 res!396147) b!614945))

(assert (= (and b!614963 c!69772) b!614964))

(assert (= (and b!614963 (not c!69772)) b!614956))

(assert (= (and b!614963 c!69771) b!614946))

(assert (= (and b!614963 (not c!69771)) b!614966))

(assert (= (and b!614946 res!396142) b!614954))

(declare-fun m!590653 () Bool)

(assert (=> start!55980 m!590653))

(declare-fun m!590655 () Bool)

(assert (=> start!55980 m!590655))

(declare-fun m!590657 () Bool)

(assert (=> b!614946 m!590657))

(declare-fun m!590659 () Bool)

(assert (=> b!614946 m!590659))

(declare-fun m!590661 () Bool)

(assert (=> b!614946 m!590661))

(assert (=> b!614946 m!590659))

(declare-fun m!590663 () Bool)

(assert (=> b!614946 m!590663))

(assert (=> b!614946 m!590659))

(declare-fun m!590665 () Bool)

(assert (=> b!614946 m!590665))

(declare-fun m!590667 () Bool)

(assert (=> b!614946 m!590667))

(declare-fun m!590669 () Bool)

(assert (=> b!614946 m!590669))

(assert (=> b!614946 m!590659))

(declare-fun m!590671 () Bool)

(assert (=> b!614946 m!590671))

(assert (=> b!614946 m!590659))

(declare-fun m!590673 () Bool)

(assert (=> b!614946 m!590673))

(declare-fun m!590675 () Bool)

(assert (=> b!614957 m!590675))

(declare-fun m!590677 () Bool)

(assert (=> b!614957 m!590677))

(assert (=> b!614952 m!590659))

(assert (=> b!614952 m!590659))

(assert (=> b!614952 m!590663))

(declare-fun m!590679 () Bool)

(assert (=> b!614968 m!590679))

(declare-fun m!590681 () Bool)

(assert (=> b!614953 m!590681))

(declare-fun m!590683 () Bool)

(assert (=> b!614953 m!590683))

(declare-fun m!590685 () Bool)

(assert (=> b!614953 m!590685))

(assert (=> b!614953 m!590659))

(assert (=> b!614953 m!590675))

(declare-fun m!590687 () Bool)

(assert (=> b!614953 m!590687))

(assert (=> b!614953 m!590659))

(declare-fun m!590689 () Bool)

(assert (=> b!614953 m!590689))

(declare-fun m!590691 () Bool)

(assert (=> b!614953 m!590691))

(declare-fun m!590693 () Bool)

(assert (=> b!614951 m!590693))

(declare-fun m!590695 () Bool)

(assert (=> b!614960 m!590695))

(declare-fun m!590697 () Bool)

(assert (=> b!614965 m!590697))

(declare-fun m!590699 () Bool)

(assert (=> b!614955 m!590699))

(assert (=> b!614955 m!590659))

(assert (=> b!614955 m!590659))

(declare-fun m!590701 () Bool)

(assert (=> b!614955 m!590701))

(assert (=> b!614963 m!590675))

(declare-fun m!590703 () Bool)

(assert (=> b!614963 m!590703))

(assert (=> b!614963 m!590659))

(declare-fun m!590705 () Bool)

(assert (=> b!614950 m!590705))

(assert (=> b!614949 m!590659))

(assert (=> b!614949 m!590659))

(declare-fun m!590707 () Bool)

(assert (=> b!614949 m!590707))

(assert (=> b!614945 m!590659))

(assert (=> b!614945 m!590659))

(declare-fun m!590709 () Bool)

(assert (=> b!614945 m!590709))

(declare-fun m!590711 () Bool)

(assert (=> b!614958 m!590711))

(assert (=> b!614964 m!590659))

(declare-fun m!590713 () Bool)

(assert (=> b!614964 m!590713))

(declare-fun m!590715 () Bool)

(assert (=> b!614964 m!590715))

(assert (=> b!614964 m!590659))

(declare-fun m!590717 () Bool)

(assert (=> b!614964 m!590717))

(assert (=> b!614964 m!590659))

(declare-fun m!590719 () Bool)

(assert (=> b!614964 m!590719))

(assert (=> b!614964 m!590669))

(assert (=> b!614964 m!590659))

(declare-fun m!590721 () Bool)

(assert (=> b!614964 m!590721))

(assert (=> b!614964 m!590657))

(assert (=> b!614954 m!590659))

(assert (=> b!614954 m!590659))

(assert (=> b!614954 m!590709))

(check-sat (not b!614951) (not b!614953) (not b!614958) (not b!614945) (not b!614964) (not b!614955) (not b!614946) (not b!614965) (not b!614952) (not b!614968) (not b!614949) (not b!614950) (not b!614954) (not start!55980))
(check-sat)
