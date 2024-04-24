; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56046 () Bool)

(assert start!56046)

(declare-fun b!615425 () Bool)

(declare-fun e!352869 () Bool)

(declare-fun e!352874 () Bool)

(assert (=> b!615425 (= e!352869 e!352874)))

(declare-fun res!396378 () Bool)

(assert (=> b!615425 (=> (not res!396378) (not e!352874))))

(declare-datatypes ((SeekEntryResult!6370 0))(
  ( (MissingZero!6370 (index!27764 (_ BitVec 32))) (Found!6370 (index!27765 (_ BitVec 32))) (Intermediate!6370 (undefined!7182 Bool) (index!27766 (_ BitVec 32)) (x!56717 (_ BitVec 32))) (Undefined!6370) (MissingVacant!6370 (index!27767 (_ BitVec 32))) )
))
(declare-fun lt!282603 () SeekEntryResult!6370)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!615425 (= res!396378 (or (= lt!282603 (MissingZero!6370 i!1108)) (= lt!282603 (MissingVacant!6370 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!37461 0))(
  ( (array!37462 (arr!17974 (Array (_ BitVec 32) (_ BitVec 64))) (size!18338 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37461)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37461 (_ BitVec 32)) SeekEntryResult!6370)

(assert (=> b!615425 (= lt!282603 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!615426 () Bool)

(declare-fun res!396375 () Bool)

(assert (=> b!615426 (=> (not res!396375) (not e!352869))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!615426 (= res!396375 (validKeyInArray!0 k0!1786))))

(declare-fun b!615427 () Bool)

(declare-datatypes ((Unit!19897 0))(
  ( (Unit!19898) )
))
(declare-fun e!352871 () Unit!19897)

(declare-fun Unit!19899 () Unit!19897)

(assert (=> b!615427 (= e!352871 Unit!19899)))

(declare-fun b!615428 () Bool)

(declare-fun e!352876 () Bool)

(declare-fun e!352866 () Bool)

(assert (=> b!615428 (= e!352876 e!352866)))

(declare-fun res!396385 () Bool)

(assert (=> b!615428 (=> (not res!396385) (not e!352866))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!282609 () SeekEntryResult!6370)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!615428 (= res!396385 (and (= lt!282609 (Found!6370 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17974 a!2986) index!984) (select (arr!17974 a!2986) j!136))) (not (= (select (arr!17974 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37461 (_ BitVec 32)) SeekEntryResult!6370)

(assert (=> b!615428 (= lt!282609 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17974 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!615429 () Bool)

(declare-fun e!352875 () Unit!19897)

(declare-fun Unit!19900 () Unit!19897)

(assert (=> b!615429 (= e!352875 Unit!19900)))

(assert (=> b!615429 false))

(declare-fun b!615430 () Bool)

(declare-fun e!352877 () Unit!19897)

(declare-fun Unit!19901 () Unit!19897)

(assert (=> b!615430 (= e!352877 Unit!19901)))

(declare-fun b!615431 () Bool)

(declare-fun e!352867 () Bool)

(declare-fun lt!282604 () SeekEntryResult!6370)

(assert (=> b!615431 (= e!352867 (= lt!282609 lt!282604))))

(declare-fun b!615432 () Bool)

(declare-fun res!396374 () Bool)

(assert (=> b!615432 (=> (not res!396374) (not e!352869))))

(declare-fun arrayContainsKey!0 (array!37461 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!615432 (= res!396374 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!615433 () Bool)

(declare-fun res!396370 () Bool)

(assert (=> b!615433 (=> (not res!396370) (not e!352869))))

(assert (=> b!615433 (= res!396370 (and (= (size!18338 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18338 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18338 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!615434 () Bool)

(declare-fun res!396384 () Bool)

(assert (=> b!615434 (=> (not res!396384) (not e!352874))))

(declare-datatypes ((List!11922 0))(
  ( (Nil!11919) (Cons!11918 (h!12966 (_ BitVec 64)) (t!18142 List!11922)) )
))
(declare-fun arrayNoDuplicates!0 (array!37461 (_ BitVec 32) List!11922) Bool)

(assert (=> b!615434 (= res!396384 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11919))))

(declare-fun b!615436 () Bool)

(assert (=> b!615436 false))

(declare-fun lt!282608 () Unit!19897)

(declare-fun lt!282606 () array!37461)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37461 (_ BitVec 64) (_ BitVec 32) List!11922) Unit!19897)

(assert (=> b!615436 (= lt!282608 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!282606 (select (arr!17974 a!2986) j!136) index!984 Nil!11919))))

(assert (=> b!615436 (arrayNoDuplicates!0 lt!282606 index!984 Nil!11919)))

(declare-fun lt!282600 () Unit!19897)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37461 (_ BitVec 32) (_ BitVec 32)) Unit!19897)

(assert (=> b!615436 (= lt!282600 (lemmaNoDuplicateFromThenFromBigger!0 lt!282606 #b00000000000000000000000000000000 index!984))))

(assert (=> b!615436 (arrayNoDuplicates!0 lt!282606 #b00000000000000000000000000000000 Nil!11919)))

(declare-fun lt!282605 () Unit!19897)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37461 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11922) Unit!19897)

(assert (=> b!615436 (= lt!282605 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11919))))

(assert (=> b!615436 (arrayContainsKey!0 lt!282606 (select (arr!17974 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!282619 () Unit!19897)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37461 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19897)

(assert (=> b!615436 (= lt!282619 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!282606 (select (arr!17974 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!352873 () Bool)

(assert (=> b!615436 e!352873))

(declare-fun res!396372 () Bool)

(assert (=> b!615436 (=> (not res!396372) (not e!352873))))

(assert (=> b!615436 (= res!396372 (arrayContainsKey!0 lt!282606 (select (arr!17974 a!2986) j!136) j!136))))

(declare-fun Unit!19902 () Unit!19897)

(assert (=> b!615436 (= e!352877 Unit!19902)))

(declare-fun b!615437 () Bool)

(assert (=> b!615437 (= e!352873 (arrayContainsKey!0 lt!282606 (select (arr!17974 a!2986) j!136) index!984))))

(declare-fun b!615438 () Bool)

(declare-fun e!352870 () Bool)

(assert (=> b!615438 (= e!352870 (arrayContainsKey!0 lt!282606 (select (arr!17974 a!2986) j!136) index!984))))

(declare-fun b!615439 () Bool)

(assert (=> b!615439 (= e!352866 (not true))))

(declare-fun lt!282614 () Unit!19897)

(assert (=> b!615439 (= lt!282614 e!352871)))

(declare-fun c!69899 () Bool)

(declare-fun lt!282615 () SeekEntryResult!6370)

(assert (=> b!615439 (= c!69899 (= lt!282615 (Found!6370 index!984)))))

(declare-fun lt!282610 () Unit!19897)

(assert (=> b!615439 (= lt!282610 e!352875)))

(declare-fun c!69898 () Bool)

(assert (=> b!615439 (= c!69898 (= lt!282615 Undefined!6370))))

(declare-fun lt!282617 () (_ BitVec 64))

(assert (=> b!615439 (= lt!282615 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!282617 lt!282606 mask!3053))))

(assert (=> b!615439 e!352867))

(declare-fun res!396371 () Bool)

(assert (=> b!615439 (=> (not res!396371) (not e!352867))))

(declare-fun lt!282601 () (_ BitVec 32))

(assert (=> b!615439 (= res!396371 (= lt!282604 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!282601 vacantSpotIndex!68 lt!282617 lt!282606 mask!3053)))))

(assert (=> b!615439 (= lt!282604 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!282601 vacantSpotIndex!68 (select (arr!17974 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!615439 (= lt!282617 (select (store (arr!17974 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!282602 () Unit!19897)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37461 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19897)

(assert (=> b!615439 (= lt!282602 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!282601 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!615439 (= lt!282601 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!615440 () Bool)

(declare-fun res!396377 () Bool)

(assert (=> b!615440 (= res!396377 (arrayContainsKey!0 lt!282606 (select (arr!17974 a!2986) j!136) j!136))))

(assert (=> b!615440 (=> (not res!396377) (not e!352870))))

(declare-fun e!352878 () Bool)

(assert (=> b!615440 (= e!352878 e!352870)))

(declare-fun b!615441 () Bool)

(declare-fun res!396376 () Bool)

(assert (=> b!615441 (= res!396376 (bvsge j!136 index!984))))

(assert (=> b!615441 (=> res!396376 e!352878)))

(declare-fun e!352872 () Bool)

(assert (=> b!615441 (= e!352872 e!352878)))

(declare-fun b!615442 () Bool)

(assert (=> b!615442 (= e!352874 e!352876)))

(declare-fun res!396373 () Bool)

(assert (=> b!615442 (=> (not res!396373) (not e!352876))))

(assert (=> b!615442 (= res!396373 (= (select (store (arr!17974 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!615442 (= lt!282606 (array!37462 (store (arr!17974 a!2986) i!1108 k0!1786) (size!18338 a!2986)))))

(declare-fun b!615443 () Bool)

(declare-fun res!396381 () Bool)

(assert (=> b!615443 (=> (not res!396381) (not e!352874))))

(assert (=> b!615443 (= res!396381 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17974 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!615444 () Bool)

(assert (=> b!615444 false))

(declare-fun lt!282611 () Unit!19897)

(assert (=> b!615444 (= lt!282611 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!282606 (select (arr!17974 a!2986) j!136) j!136 Nil!11919))))

(assert (=> b!615444 (arrayNoDuplicates!0 lt!282606 j!136 Nil!11919)))

(declare-fun lt!282618 () Unit!19897)

(assert (=> b!615444 (= lt!282618 (lemmaNoDuplicateFromThenFromBigger!0 lt!282606 #b00000000000000000000000000000000 j!136))))

(assert (=> b!615444 (arrayNoDuplicates!0 lt!282606 #b00000000000000000000000000000000 Nil!11919)))

(declare-fun lt!282616 () Unit!19897)

(assert (=> b!615444 (= lt!282616 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11919))))

(assert (=> b!615444 (arrayContainsKey!0 lt!282606 (select (arr!17974 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!282613 () Unit!19897)

(assert (=> b!615444 (= lt!282613 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!282606 (select (arr!17974 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!352865 () Unit!19897)

(declare-fun Unit!19903 () Unit!19897)

(assert (=> b!615444 (= e!352865 Unit!19903)))

(declare-fun b!615445 () Bool)

(declare-fun Unit!19904 () Unit!19897)

(assert (=> b!615445 (= e!352865 Unit!19904)))

(declare-fun b!615446 () Bool)

(declare-fun res!396379 () Bool)

(assert (=> b!615446 (=> (not res!396379) (not e!352874))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37461 (_ BitVec 32)) Bool)

(assert (=> b!615446 (= res!396379 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!615447 () Bool)

(declare-fun res!396382 () Bool)

(assert (=> b!615447 (=> (not res!396382) (not e!352869))))

(assert (=> b!615447 (= res!396382 (validKeyInArray!0 (select (arr!17974 a!2986) j!136)))))

(declare-fun b!615448 () Bool)

(declare-fun Unit!19905 () Unit!19897)

(assert (=> b!615448 (= e!352871 Unit!19905)))

(declare-fun res!396380 () Bool)

(assert (=> b!615448 (= res!396380 (= (select (store (arr!17974 a!2986) i!1108 k0!1786) index!984) (select (arr!17974 a!2986) j!136)))))

(assert (=> b!615448 (=> (not res!396380) (not e!352872))))

(assert (=> b!615448 e!352872))

(declare-fun c!69897 () Bool)

(assert (=> b!615448 (= c!69897 (bvslt j!136 index!984))))

(declare-fun lt!282607 () Unit!19897)

(assert (=> b!615448 (= lt!282607 e!352865)))

(declare-fun c!69896 () Bool)

(assert (=> b!615448 (= c!69896 (bvslt index!984 j!136))))

(declare-fun lt!282612 () Unit!19897)

(assert (=> b!615448 (= lt!282612 e!352877)))

(assert (=> b!615448 false))

(declare-fun b!615435 () Bool)

(declare-fun Unit!19906 () Unit!19897)

(assert (=> b!615435 (= e!352875 Unit!19906)))

(declare-fun res!396383 () Bool)

(assert (=> start!56046 (=> (not res!396383) (not e!352869))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56046 (= res!396383 (validMask!0 mask!3053))))

(assert (=> start!56046 e!352869))

(assert (=> start!56046 true))

(declare-fun array_inv!13833 (array!37461) Bool)

(assert (=> start!56046 (array_inv!13833 a!2986)))

(assert (= (and start!56046 res!396383) b!615433))

(assert (= (and b!615433 res!396370) b!615447))

(assert (= (and b!615447 res!396382) b!615426))

(assert (= (and b!615426 res!396375) b!615432))

(assert (= (and b!615432 res!396374) b!615425))

(assert (= (and b!615425 res!396378) b!615446))

(assert (= (and b!615446 res!396379) b!615434))

(assert (= (and b!615434 res!396384) b!615443))

(assert (= (and b!615443 res!396381) b!615442))

(assert (= (and b!615442 res!396373) b!615428))

(assert (= (and b!615428 res!396385) b!615439))

(assert (= (and b!615439 res!396371) b!615431))

(assert (= (and b!615439 c!69898) b!615429))

(assert (= (and b!615439 (not c!69898)) b!615435))

(assert (= (and b!615439 c!69899) b!615448))

(assert (= (and b!615439 (not c!69899)) b!615427))

(assert (= (and b!615448 res!396380) b!615441))

(assert (= (and b!615441 (not res!396376)) b!615440))

(assert (= (and b!615440 res!396377) b!615438))

(assert (= (and b!615448 c!69897) b!615444))

(assert (= (and b!615448 (not c!69897)) b!615445))

(assert (= (and b!615448 c!69896) b!615436))

(assert (= (and b!615448 (not c!69896)) b!615430))

(assert (= (and b!615436 res!396372) b!615437))

(declare-fun m!591911 () Bool)

(assert (=> b!615444 m!591911))

(declare-fun m!591913 () Bool)

(assert (=> b!615444 m!591913))

(declare-fun m!591915 () Bool)

(assert (=> b!615444 m!591915))

(assert (=> b!615444 m!591911))

(declare-fun m!591917 () Bool)

(assert (=> b!615444 m!591917))

(assert (=> b!615444 m!591911))

(declare-fun m!591919 () Bool)

(assert (=> b!615444 m!591919))

(declare-fun m!591921 () Bool)

(assert (=> b!615444 m!591921))

(declare-fun m!591923 () Bool)

(assert (=> b!615444 m!591923))

(assert (=> b!615444 m!591911))

(declare-fun m!591925 () Bool)

(assert (=> b!615444 m!591925))

(assert (=> b!615440 m!591911))

(assert (=> b!615440 m!591911))

(declare-fun m!591927 () Bool)

(assert (=> b!615440 m!591927))

(declare-fun m!591929 () Bool)

(assert (=> b!615439 m!591929))

(declare-fun m!591931 () Bool)

(assert (=> b!615439 m!591931))

(declare-fun m!591933 () Bool)

(assert (=> b!615439 m!591933))

(declare-fun m!591935 () Bool)

(assert (=> b!615439 m!591935))

(assert (=> b!615439 m!591911))

(assert (=> b!615439 m!591911))

(declare-fun m!591937 () Bool)

(assert (=> b!615439 m!591937))

(declare-fun m!591939 () Bool)

(assert (=> b!615439 m!591939))

(declare-fun m!591941 () Bool)

(assert (=> b!615439 m!591941))

(declare-fun m!591943 () Bool)

(assert (=> b!615428 m!591943))

(assert (=> b!615428 m!591911))

(assert (=> b!615428 m!591911))

(declare-fun m!591945 () Bool)

(assert (=> b!615428 m!591945))

(declare-fun m!591947 () Bool)

(assert (=> b!615434 m!591947))

(declare-fun m!591949 () Bool)

(assert (=> b!615425 m!591949))

(declare-fun m!591951 () Bool)

(assert (=> b!615432 m!591951))

(declare-fun m!591953 () Bool)

(assert (=> b!615443 m!591953))

(declare-fun m!591955 () Bool)

(assert (=> b!615446 m!591955))

(declare-fun m!591957 () Bool)

(assert (=> b!615436 m!591957))

(assert (=> b!615436 m!591911))

(assert (=> b!615436 m!591911))

(declare-fun m!591959 () Bool)

(assert (=> b!615436 m!591959))

(assert (=> b!615436 m!591911))

(declare-fun m!591961 () Bool)

(assert (=> b!615436 m!591961))

(declare-fun m!591963 () Bool)

(assert (=> b!615436 m!591963))

(assert (=> b!615436 m!591911))

(assert (=> b!615436 m!591927))

(assert (=> b!615436 m!591921))

(assert (=> b!615436 m!591917))

(assert (=> b!615436 m!591911))

(declare-fun m!591965 () Bool)

(assert (=> b!615436 m!591965))

(declare-fun m!591967 () Bool)

(assert (=> b!615426 m!591967))

(assert (=> b!615438 m!591911))

(assert (=> b!615438 m!591911))

(declare-fun m!591969 () Bool)

(assert (=> b!615438 m!591969))

(assert (=> b!615447 m!591911))

(assert (=> b!615447 m!591911))

(declare-fun m!591971 () Bool)

(assert (=> b!615447 m!591971))

(assert (=> b!615448 m!591939))

(declare-fun m!591973 () Bool)

(assert (=> b!615448 m!591973))

(assert (=> b!615448 m!591911))

(declare-fun m!591975 () Bool)

(assert (=> start!56046 m!591975))

(declare-fun m!591977 () Bool)

(assert (=> start!56046 m!591977))

(assert (=> b!615437 m!591911))

(assert (=> b!615437 m!591911))

(assert (=> b!615437 m!591969))

(assert (=> b!615442 m!591939))

(declare-fun m!591979 () Bool)

(assert (=> b!615442 m!591979))

(check-sat (not b!615444) (not b!615446) (not b!615440) (not b!615436) (not start!56046) (not b!615432) (not b!615434) (not b!615438) (not b!615447) (not b!615439) (not b!615425) (not b!615437) (not b!615426) (not b!615428))
(check-sat)
