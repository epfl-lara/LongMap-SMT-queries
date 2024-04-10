; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56124 () Bool)

(assert start!56124)

(declare-fun b!619973 () Bool)

(declare-fun res!399489 () Bool)

(declare-fun e!355576 () Bool)

(assert (=> b!619973 (=> (not res!399489) (not e!355576))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37594 0))(
  ( (array!37595 (arr!18043 (Array (_ BitVec 32) (_ BitVec 64))) (size!18407 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37594)

(assert (=> b!619973 (= res!399489 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18043 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!619974 () Bool)

(declare-fun res!399495 () Bool)

(assert (=> b!619974 (=> (not res!399495) (not e!355576))))

(declare-datatypes ((List!12084 0))(
  ( (Nil!12081) (Cons!12080 (h!13125 (_ BitVec 64)) (t!18312 List!12084)) )
))
(declare-fun arrayNoDuplicates!0 (array!37594 (_ BitVec 32) List!12084) Bool)

(assert (=> b!619974 (= res!399495 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12081))))

(declare-fun b!619975 () Bool)

(declare-datatypes ((Unit!20558 0))(
  ( (Unit!20559) )
))
(declare-fun e!355587 () Unit!20558)

(declare-fun Unit!20560 () Unit!20558)

(assert (=> b!619975 (= e!355587 Unit!20560)))

(declare-fun b!619976 () Bool)

(declare-fun res!399498 () Bool)

(declare-fun e!355582 () Bool)

(assert (=> b!619976 (=> (not res!399498) (not e!355582))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37594 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!619976 (= res!399498 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!619977 () Bool)

(declare-fun e!355585 () Unit!20558)

(declare-fun Unit!20561 () Unit!20558)

(assert (=> b!619977 (= e!355585 Unit!20561)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun res!399493 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!619977 (= res!399493 (= (select (store (arr!18043 a!2986) i!1108 k0!1786) index!984) (select (arr!18043 a!2986) j!136)))))

(declare-fun e!355586 () Bool)

(assert (=> b!619977 (=> (not res!399493) (not e!355586))))

(assert (=> b!619977 e!355586))

(declare-fun c!70613 () Bool)

(assert (=> b!619977 (= c!70613 (bvslt j!136 index!984))))

(declare-fun lt!286349 () Unit!20558)

(declare-fun e!355577 () Unit!20558)

(assert (=> b!619977 (= lt!286349 e!355577)))

(declare-fun c!70611 () Bool)

(assert (=> b!619977 (= c!70611 (bvslt index!984 j!136))))

(declare-fun lt!286353 () Unit!20558)

(declare-fun e!355581 () Unit!20558)

(assert (=> b!619977 (= lt!286353 e!355581)))

(assert (=> b!619977 false))

(declare-fun b!619978 () Bool)

(declare-fun e!355579 () Bool)

(assert (=> b!619978 (= e!355579 true)))

(assert (=> b!619978 (= (select (store (arr!18043 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!619979 () Bool)

(assert (=> b!619979 false))

(declare-fun lt!286342 () array!37594)

(declare-fun lt!286339 () Unit!20558)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37594 (_ BitVec 64) (_ BitVec 32) List!12084) Unit!20558)

(assert (=> b!619979 (= lt!286339 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!286342 (select (arr!18043 a!2986) j!136) j!136 Nil!12081))))

(assert (=> b!619979 (arrayNoDuplicates!0 lt!286342 j!136 Nil!12081)))

(declare-fun lt!286338 () Unit!20558)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37594 (_ BitVec 32) (_ BitVec 32)) Unit!20558)

(assert (=> b!619979 (= lt!286338 (lemmaNoDuplicateFromThenFromBigger!0 lt!286342 #b00000000000000000000000000000000 j!136))))

(assert (=> b!619979 (arrayNoDuplicates!0 lt!286342 #b00000000000000000000000000000000 Nil!12081)))

(declare-fun lt!286356 () Unit!20558)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37594 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12084) Unit!20558)

(assert (=> b!619979 (= lt!286356 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12081))))

(assert (=> b!619979 (arrayContainsKey!0 lt!286342 (select (arr!18043 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!286351 () Unit!20558)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37594 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20558)

(assert (=> b!619979 (= lt!286351 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!286342 (select (arr!18043 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20562 () Unit!20558)

(assert (=> b!619979 (= e!355577 Unit!20562)))

(declare-fun b!619980 () Bool)

(declare-fun e!355580 () Bool)

(assert (=> b!619980 (= e!355580 (not e!355579))))

(declare-fun res!399502 () Bool)

(assert (=> b!619980 (=> res!399502 e!355579)))

(declare-datatypes ((SeekEntryResult!6483 0))(
  ( (MissingZero!6483 (index!28216 (_ BitVec 32))) (Found!6483 (index!28217 (_ BitVec 32))) (Intermediate!6483 (undefined!7295 Bool) (index!28218 (_ BitVec 32)) (x!56995 (_ BitVec 32))) (Undefined!6483) (MissingVacant!6483 (index!28219 (_ BitVec 32))) )
))
(declare-fun lt!286355 () SeekEntryResult!6483)

(assert (=> b!619980 (= res!399502 (not (= lt!286355 (MissingVacant!6483 vacantSpotIndex!68))))))

(declare-fun lt!286344 () Unit!20558)

(assert (=> b!619980 (= lt!286344 e!355585)))

(declare-fun c!70610 () Bool)

(assert (=> b!619980 (= c!70610 (= lt!286355 (Found!6483 index!984)))))

(declare-fun lt!286357 () Unit!20558)

(assert (=> b!619980 (= lt!286357 e!355587)))

(declare-fun c!70612 () Bool)

(assert (=> b!619980 (= c!70612 (= lt!286355 Undefined!6483))))

(declare-fun lt!286348 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37594 (_ BitVec 32)) SeekEntryResult!6483)

(assert (=> b!619980 (= lt!286355 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!286348 lt!286342 mask!3053))))

(declare-fun e!355578 () Bool)

(assert (=> b!619980 e!355578))

(declare-fun res!399491 () Bool)

(assert (=> b!619980 (=> (not res!399491) (not e!355578))))

(declare-fun lt!286350 () (_ BitVec 32))

(declare-fun lt!286354 () SeekEntryResult!6483)

(assert (=> b!619980 (= res!399491 (= lt!286354 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!286350 vacantSpotIndex!68 lt!286348 lt!286342 mask!3053)))))

(assert (=> b!619980 (= lt!286354 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!286350 vacantSpotIndex!68 (select (arr!18043 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!619980 (= lt!286348 (select (store (arr!18043 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!286340 () Unit!20558)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37594 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20558)

(assert (=> b!619980 (= lt!286340 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!286350 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!619980 (= lt!286350 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!619981 () Bool)

(declare-fun e!355575 () Bool)

(assert (=> b!619981 (= e!355575 (arrayContainsKey!0 lt!286342 (select (arr!18043 a!2986) j!136) index!984))))

(declare-fun b!619982 () Bool)

(declare-fun res!399488 () Bool)

(assert (=> b!619982 (=> (not res!399488) (not e!355576))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37594 (_ BitVec 32)) Bool)

(assert (=> b!619982 (= res!399488 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!399496 () Bool)

(declare-fun b!619983 () Bool)

(assert (=> b!619983 (= res!399496 (arrayContainsKey!0 lt!286342 (select (arr!18043 a!2986) j!136) j!136))))

(assert (=> b!619983 (=> (not res!399496) (not e!355575))))

(declare-fun e!355584 () Bool)

(assert (=> b!619983 (= e!355584 e!355575)))

(declare-fun b!619984 () Bool)

(assert (=> b!619984 false))

(declare-fun lt!286346 () Unit!20558)

(assert (=> b!619984 (= lt!286346 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!286342 (select (arr!18043 a!2986) j!136) index!984 Nil!12081))))

(assert (=> b!619984 (arrayNoDuplicates!0 lt!286342 index!984 Nil!12081)))

(declare-fun lt!286343 () Unit!20558)

(assert (=> b!619984 (= lt!286343 (lemmaNoDuplicateFromThenFromBigger!0 lt!286342 #b00000000000000000000000000000000 index!984))))

(assert (=> b!619984 (arrayNoDuplicates!0 lt!286342 #b00000000000000000000000000000000 Nil!12081)))

(declare-fun lt!286347 () Unit!20558)

(assert (=> b!619984 (= lt!286347 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12081))))

(assert (=> b!619984 (arrayContainsKey!0 lt!286342 (select (arr!18043 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!286345 () Unit!20558)

(assert (=> b!619984 (= lt!286345 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!286342 (select (arr!18043 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!355573 () Bool)

(assert (=> b!619984 e!355573))

(declare-fun res!399492 () Bool)

(assert (=> b!619984 (=> (not res!399492) (not e!355573))))

(assert (=> b!619984 (= res!399492 (arrayContainsKey!0 lt!286342 (select (arr!18043 a!2986) j!136) j!136))))

(declare-fun Unit!20563 () Unit!20558)

(assert (=> b!619984 (= e!355581 Unit!20563)))

(declare-fun b!619985 () Bool)

(declare-fun Unit!20564 () Unit!20558)

(assert (=> b!619985 (= e!355587 Unit!20564)))

(assert (=> b!619985 false))

(declare-fun b!619986 () Bool)

(declare-fun res!399503 () Bool)

(assert (=> b!619986 (=> (not res!399503) (not e!355582))))

(assert (=> b!619986 (= res!399503 (and (= (size!18407 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18407 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18407 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!619987 () Bool)

(assert (=> b!619987 (= e!355582 e!355576)))

(declare-fun res!399500 () Bool)

(assert (=> b!619987 (=> (not res!399500) (not e!355576))))

(declare-fun lt!286352 () SeekEntryResult!6483)

(assert (=> b!619987 (= res!399500 (or (= lt!286352 (MissingZero!6483 i!1108)) (= lt!286352 (MissingVacant!6483 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37594 (_ BitVec 32)) SeekEntryResult!6483)

(assert (=> b!619987 (= lt!286352 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!619988 () Bool)

(declare-fun res!399499 () Bool)

(assert (=> b!619988 (=> (not res!399499) (not e!355582))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!619988 (= res!399499 (validKeyInArray!0 k0!1786))))

(declare-fun b!619989 () Bool)

(declare-fun e!355574 () Bool)

(assert (=> b!619989 (= e!355576 e!355574)))

(declare-fun res!399501 () Bool)

(assert (=> b!619989 (=> (not res!399501) (not e!355574))))

(assert (=> b!619989 (= res!399501 (= (select (store (arr!18043 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!619989 (= lt!286342 (array!37595 (store (arr!18043 a!2986) i!1108 k0!1786) (size!18407 a!2986)))))

(declare-fun b!619990 () Bool)

(declare-fun lt!286341 () SeekEntryResult!6483)

(assert (=> b!619990 (= e!355578 (= lt!286341 lt!286354))))

(declare-fun b!619991 () Bool)

(declare-fun Unit!20565 () Unit!20558)

(assert (=> b!619991 (= e!355581 Unit!20565)))

(declare-fun b!619992 () Bool)

(assert (=> b!619992 (= e!355573 (arrayContainsKey!0 lt!286342 (select (arr!18043 a!2986) j!136) index!984))))

(declare-fun b!619993 () Bool)

(declare-fun Unit!20566 () Unit!20558)

(assert (=> b!619993 (= e!355577 Unit!20566)))

(declare-fun b!619994 () Bool)

(assert (=> b!619994 (= e!355574 e!355580)))

(declare-fun res!399497 () Bool)

(assert (=> b!619994 (=> (not res!399497) (not e!355580))))

(assert (=> b!619994 (= res!399497 (and (= lt!286341 (Found!6483 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18043 a!2986) index!984) (select (arr!18043 a!2986) j!136))) (not (= (select (arr!18043 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!619994 (= lt!286341 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18043 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!619995 () Bool)

(declare-fun Unit!20567 () Unit!20558)

(assert (=> b!619995 (= e!355585 Unit!20567)))

(declare-fun res!399494 () Bool)

(assert (=> start!56124 (=> (not res!399494) (not e!355582))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56124 (= res!399494 (validMask!0 mask!3053))))

(assert (=> start!56124 e!355582))

(assert (=> start!56124 true))

(declare-fun array_inv!13839 (array!37594) Bool)

(assert (=> start!56124 (array_inv!13839 a!2986)))

(declare-fun b!619996 () Bool)

(declare-fun res!399487 () Bool)

(assert (=> b!619996 (= res!399487 (bvsge j!136 index!984))))

(assert (=> b!619996 (=> res!399487 e!355584)))

(assert (=> b!619996 (= e!355586 e!355584)))

(declare-fun b!619997 () Bool)

(declare-fun res!399490 () Bool)

(assert (=> b!619997 (=> (not res!399490) (not e!355582))))

(assert (=> b!619997 (= res!399490 (validKeyInArray!0 (select (arr!18043 a!2986) j!136)))))

(assert (= (and start!56124 res!399494) b!619986))

(assert (= (and b!619986 res!399503) b!619997))

(assert (= (and b!619997 res!399490) b!619988))

(assert (= (and b!619988 res!399499) b!619976))

(assert (= (and b!619976 res!399498) b!619987))

(assert (= (and b!619987 res!399500) b!619982))

(assert (= (and b!619982 res!399488) b!619974))

(assert (= (and b!619974 res!399495) b!619973))

(assert (= (and b!619973 res!399489) b!619989))

(assert (= (and b!619989 res!399501) b!619994))

(assert (= (and b!619994 res!399497) b!619980))

(assert (= (and b!619980 res!399491) b!619990))

(assert (= (and b!619980 c!70612) b!619985))

(assert (= (and b!619980 (not c!70612)) b!619975))

(assert (= (and b!619980 c!70610) b!619977))

(assert (= (and b!619980 (not c!70610)) b!619995))

(assert (= (and b!619977 res!399493) b!619996))

(assert (= (and b!619996 (not res!399487)) b!619983))

(assert (= (and b!619983 res!399496) b!619981))

(assert (= (and b!619977 c!70613) b!619979))

(assert (= (and b!619977 (not c!70613)) b!619993))

(assert (= (and b!619977 c!70611) b!619984))

(assert (= (and b!619977 (not c!70611)) b!619991))

(assert (= (and b!619984 res!399492) b!619992))

(assert (= (and b!619980 (not res!399502)) b!619978))

(declare-fun m!595911 () Bool)

(assert (=> b!619976 m!595911))

(declare-fun m!595913 () Bool)

(assert (=> b!619974 m!595913))

(declare-fun m!595915 () Bool)

(assert (=> b!619984 m!595915))

(declare-fun m!595917 () Bool)

(assert (=> b!619984 m!595917))

(assert (=> b!619984 m!595917))

(declare-fun m!595919 () Bool)

(assert (=> b!619984 m!595919))

(assert (=> b!619984 m!595917))

(declare-fun m!595921 () Bool)

(assert (=> b!619984 m!595921))

(declare-fun m!595923 () Bool)

(assert (=> b!619984 m!595923))

(declare-fun m!595925 () Bool)

(assert (=> b!619984 m!595925))

(assert (=> b!619984 m!595917))

(declare-fun m!595927 () Bool)

(assert (=> b!619984 m!595927))

(assert (=> b!619984 m!595917))

(declare-fun m!595929 () Bool)

(assert (=> b!619984 m!595929))

(declare-fun m!595931 () Bool)

(assert (=> b!619984 m!595931))

(declare-fun m!595933 () Bool)

(assert (=> b!619988 m!595933))

(assert (=> b!619992 m!595917))

(assert (=> b!619992 m!595917))

(declare-fun m!595935 () Bool)

(assert (=> b!619992 m!595935))

(declare-fun m!595937 () Bool)

(assert (=> b!619994 m!595937))

(assert (=> b!619994 m!595917))

(assert (=> b!619994 m!595917))

(declare-fun m!595939 () Bool)

(assert (=> b!619994 m!595939))

(assert (=> b!619997 m!595917))

(assert (=> b!619997 m!595917))

(declare-fun m!595941 () Bool)

(assert (=> b!619997 m!595941))

(assert (=> b!619979 m!595917))

(declare-fun m!595943 () Bool)

(assert (=> b!619979 m!595943))

(declare-fun m!595945 () Bool)

(assert (=> b!619979 m!595945))

(assert (=> b!619979 m!595917))

(assert (=> b!619979 m!595923))

(declare-fun m!595947 () Bool)

(assert (=> b!619979 m!595947))

(assert (=> b!619979 m!595917))

(declare-fun m!595949 () Bool)

(assert (=> b!619979 m!595949))

(assert (=> b!619979 m!595917))

(declare-fun m!595951 () Bool)

(assert (=> b!619979 m!595951))

(assert (=> b!619979 m!595931))

(declare-fun m!595953 () Bool)

(assert (=> b!619978 m!595953))

(declare-fun m!595955 () Bool)

(assert (=> b!619978 m!595955))

(declare-fun m!595957 () Bool)

(assert (=> start!56124 m!595957))

(declare-fun m!595959 () Bool)

(assert (=> start!56124 m!595959))

(assert (=> b!619989 m!595953))

(declare-fun m!595961 () Bool)

(assert (=> b!619989 m!595961))

(assert (=> b!619977 m!595953))

(assert (=> b!619977 m!595955))

(assert (=> b!619977 m!595917))

(declare-fun m!595963 () Bool)

(assert (=> b!619980 m!595963))

(declare-fun m!595965 () Bool)

(assert (=> b!619980 m!595965))

(declare-fun m!595967 () Bool)

(assert (=> b!619980 m!595967))

(assert (=> b!619980 m!595917))

(assert (=> b!619980 m!595917))

(declare-fun m!595969 () Bool)

(assert (=> b!619980 m!595969))

(declare-fun m!595971 () Bool)

(assert (=> b!619980 m!595971))

(declare-fun m!595973 () Bool)

(assert (=> b!619980 m!595973))

(assert (=> b!619980 m!595953))

(assert (=> b!619983 m!595917))

(assert (=> b!619983 m!595917))

(assert (=> b!619983 m!595921))

(declare-fun m!595975 () Bool)

(assert (=> b!619987 m!595975))

(assert (=> b!619981 m!595917))

(assert (=> b!619981 m!595917))

(assert (=> b!619981 m!595935))

(declare-fun m!595977 () Bool)

(assert (=> b!619982 m!595977))

(declare-fun m!595979 () Bool)

(assert (=> b!619973 m!595979))

(check-sat (not b!619976) (not b!619997) (not b!619994) (not b!619983) (not b!619984) (not b!619980) (not b!619992) (not b!619988) (not b!619981) (not b!619982) (not b!619974) (not start!56124) (not b!619979) (not b!619987))
(check-sat)
