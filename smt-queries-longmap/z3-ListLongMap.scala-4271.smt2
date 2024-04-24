; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59424 () Bool)

(assert start!59424)

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!38682 0))(
  ( (array!38683 (arr!18538 (Array (_ BitVec 32) (_ BitVec 64))) (size!18902 (_ BitVec 32))) )
))
(declare-fun lt!306048 () array!38682)

(declare-fun res!425499 () Bool)

(declare-fun a!2986 () array!38682)

(declare-fun b!655973 () Bool)

(declare-fun arrayContainsKey!0 (array!38682 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!655973 (= res!425499 (arrayContainsKey!0 lt!306048 (select (arr!18538 a!2986) j!136) j!136))))

(declare-fun e!376732 () Bool)

(assert (=> b!655973 (=> (not res!425499) (not e!376732))))

(declare-fun e!376741 () Bool)

(assert (=> b!655973 (= e!376741 e!376732)))

(declare-fun b!655974 () Bool)

(declare-fun res!425507 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!655974 (= res!425507 (bvsge j!136 index!984))))

(assert (=> b!655974 (=> res!425507 e!376741)))

(declare-fun e!376736 () Bool)

(assert (=> b!655974 (= e!376736 e!376741)))

(declare-fun b!655975 () Bool)

(declare-datatypes ((Unit!22563 0))(
  ( (Unit!22564) )
))
(declare-fun e!376734 () Unit!22563)

(declare-fun Unit!22565 () Unit!22563)

(assert (=> b!655975 (= e!376734 Unit!22565)))

(declare-fun b!655976 () Bool)

(declare-fun res!425496 () Bool)

(declare-fun e!376735 () Bool)

(assert (=> b!655976 (=> (not res!425496) (not e!376735))))

(declare-datatypes ((List!12486 0))(
  ( (Nil!12483) (Cons!12482 (h!13530 (_ BitVec 64)) (t!18706 List!12486)) )
))
(declare-fun arrayNoDuplicates!0 (array!38682 (_ BitVec 32) List!12486) Bool)

(assert (=> b!655976 (= res!425496 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12483))))

(declare-fun b!655977 () Bool)

(assert (=> b!655977 false))

(declare-fun lt!306054 () Unit!22563)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38682 (_ BitVec 64) (_ BitVec 32) List!12486) Unit!22563)

(assert (=> b!655977 (= lt!306054 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!306048 (select (arr!18538 a!2986) j!136) index!984 Nil!12483))))

(assert (=> b!655977 (arrayNoDuplicates!0 lt!306048 index!984 Nil!12483)))

(declare-fun lt!306063 () Unit!22563)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38682 (_ BitVec 32) (_ BitVec 32)) Unit!22563)

(assert (=> b!655977 (= lt!306063 (lemmaNoDuplicateFromThenFromBigger!0 lt!306048 #b00000000000000000000000000000000 index!984))))

(assert (=> b!655977 (arrayNoDuplicates!0 lt!306048 #b00000000000000000000000000000000 Nil!12483)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!306049 () Unit!22563)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38682 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12486) Unit!22563)

(assert (=> b!655977 (= lt!306049 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12483))))

(assert (=> b!655977 (arrayContainsKey!0 lt!306048 (select (arr!18538 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!306059 () Unit!22563)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38682 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22563)

(assert (=> b!655977 (= lt!306059 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!306048 (select (arr!18538 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!376742 () Bool)

(assert (=> b!655977 e!376742))

(declare-fun res!425503 () Bool)

(assert (=> b!655977 (=> (not res!425503) (not e!376742))))

(assert (=> b!655977 (= res!425503 (arrayContainsKey!0 lt!306048 (select (arr!18538 a!2986) j!136) j!136))))

(declare-fun e!376743 () Unit!22563)

(declare-fun Unit!22566 () Unit!22563)

(assert (=> b!655977 (= e!376743 Unit!22566)))

(declare-fun e!376738 () Bool)

(declare-datatypes ((SeekEntryResult!6934 0))(
  ( (MissingZero!6934 (index!30095 (_ BitVec 32))) (Found!6934 (index!30096 (_ BitVec 32))) (Intermediate!6934 (undefined!7746 Bool) (index!30097 (_ BitVec 32)) (x!59034 (_ BitVec 32))) (Undefined!6934) (MissingVacant!6934 (index!30098 (_ BitVec 32))) )
))
(declare-fun lt!306064 () SeekEntryResult!6934)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun b!655978 () Bool)

(assert (=> b!655978 (= e!376738 (not (or (not (= lt!306064 (MissingVacant!6934 vacantSpotIndex!68))) (bvslt index!984 (size!18902 a!2986)))))))

(declare-fun lt!306050 () Unit!22563)

(declare-fun e!376739 () Unit!22563)

(assert (=> b!655978 (= lt!306050 e!376739)))

(declare-fun c!75610 () Bool)

(assert (=> b!655978 (= c!75610 (= lt!306064 (Found!6934 index!984)))))

(declare-fun lt!306047 () Unit!22563)

(declare-fun e!376730 () Unit!22563)

(assert (=> b!655978 (= lt!306047 e!376730)))

(declare-fun c!75609 () Bool)

(assert (=> b!655978 (= c!75609 (= lt!306064 Undefined!6934))))

(declare-fun lt!306053 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38682 (_ BitVec 32)) SeekEntryResult!6934)

(assert (=> b!655978 (= lt!306064 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!306053 lt!306048 mask!3053))))

(declare-fun e!376731 () Bool)

(assert (=> b!655978 e!376731))

(declare-fun res!425508 () Bool)

(assert (=> b!655978 (=> (not res!425508) (not e!376731))))

(declare-fun lt!306055 () SeekEntryResult!6934)

(declare-fun lt!306060 () (_ BitVec 32))

(assert (=> b!655978 (= res!425508 (= lt!306055 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306060 vacantSpotIndex!68 lt!306053 lt!306048 mask!3053)))))

(assert (=> b!655978 (= lt!306055 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306060 vacantSpotIndex!68 (select (arr!18538 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!655978 (= lt!306053 (select (store (arr!18538 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!306052 () Unit!22563)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38682 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22563)

(assert (=> b!655978 (= lt!306052 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!306060 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!655978 (= lt!306060 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!655979 () Bool)

(declare-fun res!425498 () Bool)

(declare-fun e!376733 () Bool)

(assert (=> b!655979 (=> (not res!425498) (not e!376733))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!655979 (= res!425498 (validKeyInArray!0 k0!1786))))

(declare-fun b!655980 () Bool)

(declare-fun Unit!22567 () Unit!22563)

(assert (=> b!655980 (= e!376739 Unit!22567)))

(declare-fun b!655981 () Bool)

(declare-fun e!376737 () Bool)

(assert (=> b!655981 (= e!376735 e!376737)))

(declare-fun res!425509 () Bool)

(assert (=> b!655981 (=> (not res!425509) (not e!376737))))

(assert (=> b!655981 (= res!425509 (= (select (store (arr!18538 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!655981 (= lt!306048 (array!38683 (store (arr!18538 a!2986) i!1108 k0!1786) (size!18902 a!2986)))))

(declare-fun b!655982 () Bool)

(declare-fun res!425495 () Bool)

(assert (=> b!655982 (=> (not res!425495) (not e!376735))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38682 (_ BitVec 32)) Bool)

(assert (=> b!655982 (= res!425495 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!425497 () Bool)

(assert (=> start!59424 (=> (not res!425497) (not e!376733))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59424 (= res!425497 (validMask!0 mask!3053))))

(assert (=> start!59424 e!376733))

(assert (=> start!59424 true))

(declare-fun array_inv!14397 (array!38682) Bool)

(assert (=> start!59424 (array_inv!14397 a!2986)))

(declare-fun b!655983 () Bool)

(declare-fun Unit!22568 () Unit!22563)

(assert (=> b!655983 (= e!376743 Unit!22568)))

(declare-fun b!655984 () Bool)

(declare-fun res!425505 () Bool)

(assert (=> b!655984 (=> (not res!425505) (not e!376735))))

(assert (=> b!655984 (= res!425505 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18538 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!655985 () Bool)

(assert (=> b!655985 (= e!376733 e!376735)))

(declare-fun res!425500 () Bool)

(assert (=> b!655985 (=> (not res!425500) (not e!376735))))

(declare-fun lt!306056 () SeekEntryResult!6934)

(assert (=> b!655985 (= res!425500 (or (= lt!306056 (MissingZero!6934 i!1108)) (= lt!306056 (MissingVacant!6934 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38682 (_ BitVec 32)) SeekEntryResult!6934)

(assert (=> b!655985 (= lt!306056 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!655986 () Bool)

(assert (=> b!655986 (= e!376742 (arrayContainsKey!0 lt!306048 (select (arr!18538 a!2986) j!136) index!984))))

(declare-fun b!655987 () Bool)

(declare-fun Unit!22569 () Unit!22563)

(assert (=> b!655987 (= e!376730 Unit!22569)))

(assert (=> b!655987 false))

(declare-fun b!655988 () Bool)

(declare-fun Unit!22570 () Unit!22563)

(assert (=> b!655988 (= e!376730 Unit!22570)))

(declare-fun b!655989 () Bool)

(declare-fun res!425494 () Bool)

(assert (=> b!655989 (=> (not res!425494) (not e!376733))))

(assert (=> b!655989 (= res!425494 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!655990 () Bool)

(assert (=> b!655990 (= e!376732 (arrayContainsKey!0 lt!306048 (select (arr!18538 a!2986) j!136) index!984))))

(declare-fun b!655991 () Bool)

(declare-fun res!425502 () Bool)

(assert (=> b!655991 (=> (not res!425502) (not e!376733))))

(assert (=> b!655991 (= res!425502 (and (= (size!18902 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18902 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18902 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!655992 () Bool)

(declare-fun Unit!22571 () Unit!22563)

(assert (=> b!655992 (= e!376739 Unit!22571)))

(declare-fun res!425506 () Bool)

(assert (=> b!655992 (= res!425506 (= (select (store (arr!18538 a!2986) i!1108 k0!1786) index!984) (select (arr!18538 a!2986) j!136)))))

(assert (=> b!655992 (=> (not res!425506) (not e!376736))))

(assert (=> b!655992 e!376736))

(declare-fun c!75608 () Bool)

(assert (=> b!655992 (= c!75608 (bvslt j!136 index!984))))

(declare-fun lt!306057 () Unit!22563)

(assert (=> b!655992 (= lt!306057 e!376734)))

(declare-fun c!75611 () Bool)

(assert (=> b!655992 (= c!75611 (bvslt index!984 j!136))))

(declare-fun lt!306051 () Unit!22563)

(assert (=> b!655992 (= lt!306051 e!376743)))

(assert (=> b!655992 false))

(declare-fun b!655993 () Bool)

(assert (=> b!655993 (= e!376737 e!376738)))

(declare-fun res!425501 () Bool)

(assert (=> b!655993 (=> (not res!425501) (not e!376738))))

(declare-fun lt!306061 () SeekEntryResult!6934)

(assert (=> b!655993 (= res!425501 (and (= lt!306061 (Found!6934 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18538 a!2986) index!984) (select (arr!18538 a!2986) j!136))) (not (= (select (arr!18538 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!655993 (= lt!306061 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18538 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!655994 () Bool)

(assert (=> b!655994 false))

(declare-fun lt!306062 () Unit!22563)

(assert (=> b!655994 (= lt!306062 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!306048 (select (arr!18538 a!2986) j!136) j!136 Nil!12483))))

(assert (=> b!655994 (arrayNoDuplicates!0 lt!306048 j!136 Nil!12483)))

(declare-fun lt!306045 () Unit!22563)

(assert (=> b!655994 (= lt!306045 (lemmaNoDuplicateFromThenFromBigger!0 lt!306048 #b00000000000000000000000000000000 j!136))))

(assert (=> b!655994 (arrayNoDuplicates!0 lt!306048 #b00000000000000000000000000000000 Nil!12483)))

(declare-fun lt!306046 () Unit!22563)

(assert (=> b!655994 (= lt!306046 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12483))))

(assert (=> b!655994 (arrayContainsKey!0 lt!306048 (select (arr!18538 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!306058 () Unit!22563)

(assert (=> b!655994 (= lt!306058 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!306048 (select (arr!18538 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!22572 () Unit!22563)

(assert (=> b!655994 (= e!376734 Unit!22572)))

(declare-fun b!655995 () Bool)

(declare-fun res!425504 () Bool)

(assert (=> b!655995 (=> (not res!425504) (not e!376733))))

(assert (=> b!655995 (= res!425504 (validKeyInArray!0 (select (arr!18538 a!2986) j!136)))))

(declare-fun b!655996 () Bool)

(assert (=> b!655996 (= e!376731 (= lt!306061 lt!306055))))

(assert (= (and start!59424 res!425497) b!655991))

(assert (= (and b!655991 res!425502) b!655995))

(assert (= (and b!655995 res!425504) b!655979))

(assert (= (and b!655979 res!425498) b!655989))

(assert (= (and b!655989 res!425494) b!655985))

(assert (= (and b!655985 res!425500) b!655982))

(assert (= (and b!655982 res!425495) b!655976))

(assert (= (and b!655976 res!425496) b!655984))

(assert (= (and b!655984 res!425505) b!655981))

(assert (= (and b!655981 res!425509) b!655993))

(assert (= (and b!655993 res!425501) b!655978))

(assert (= (and b!655978 res!425508) b!655996))

(assert (= (and b!655978 c!75609) b!655987))

(assert (= (and b!655978 (not c!75609)) b!655988))

(assert (= (and b!655978 c!75610) b!655992))

(assert (= (and b!655978 (not c!75610)) b!655980))

(assert (= (and b!655992 res!425506) b!655974))

(assert (= (and b!655974 (not res!425507)) b!655973))

(assert (= (and b!655973 res!425499) b!655990))

(assert (= (and b!655992 c!75608) b!655994))

(assert (= (and b!655992 (not c!75608)) b!655975))

(assert (= (and b!655992 c!75611) b!655977))

(assert (= (and b!655992 (not c!75611)) b!655983))

(assert (= (and b!655977 res!425503) b!655986))

(declare-fun m!629497 () Bool)

(assert (=> b!655973 m!629497))

(assert (=> b!655973 m!629497))

(declare-fun m!629499 () Bool)

(assert (=> b!655973 m!629499))

(declare-fun m!629501 () Bool)

(assert (=> b!655994 m!629501))

(assert (=> b!655994 m!629497))

(assert (=> b!655994 m!629497))

(declare-fun m!629503 () Bool)

(assert (=> b!655994 m!629503))

(declare-fun m!629505 () Bool)

(assert (=> b!655994 m!629505))

(declare-fun m!629507 () Bool)

(assert (=> b!655994 m!629507))

(declare-fun m!629509 () Bool)

(assert (=> b!655994 m!629509))

(assert (=> b!655994 m!629497))

(declare-fun m!629511 () Bool)

(assert (=> b!655994 m!629511))

(assert (=> b!655994 m!629497))

(declare-fun m!629513 () Bool)

(assert (=> b!655994 m!629513))

(declare-fun m!629515 () Bool)

(assert (=> b!655993 m!629515))

(assert (=> b!655993 m!629497))

(assert (=> b!655993 m!629497))

(declare-fun m!629517 () Bool)

(assert (=> b!655993 m!629517))

(declare-fun m!629519 () Bool)

(assert (=> b!655982 m!629519))

(declare-fun m!629521 () Bool)

(assert (=> b!655992 m!629521))

(declare-fun m!629523 () Bool)

(assert (=> b!655992 m!629523))

(assert (=> b!655992 m!629497))

(assert (=> b!655981 m!629521))

(declare-fun m!629525 () Bool)

(assert (=> b!655981 m!629525))

(declare-fun m!629527 () Bool)

(assert (=> b!655985 m!629527))

(assert (=> b!655990 m!629497))

(assert (=> b!655990 m!629497))

(declare-fun m!629529 () Bool)

(assert (=> b!655990 m!629529))

(assert (=> b!655995 m!629497))

(assert (=> b!655995 m!629497))

(declare-fun m!629531 () Bool)

(assert (=> b!655995 m!629531))

(declare-fun m!629533 () Bool)

(assert (=> b!655984 m!629533))

(declare-fun m!629535 () Bool)

(assert (=> start!59424 m!629535))

(declare-fun m!629537 () Bool)

(assert (=> start!59424 m!629537))

(declare-fun m!629539 () Bool)

(assert (=> b!655976 m!629539))

(declare-fun m!629541 () Bool)

(assert (=> b!655989 m!629541))

(assert (=> b!655977 m!629497))

(assert (=> b!655977 m!629497))

(declare-fun m!629543 () Bool)

(assert (=> b!655977 m!629543))

(assert (=> b!655977 m!629497))

(declare-fun m!629545 () Bool)

(assert (=> b!655977 m!629545))

(assert (=> b!655977 m!629497))

(assert (=> b!655977 m!629499))

(assert (=> b!655977 m!629497))

(declare-fun m!629547 () Bool)

(assert (=> b!655977 m!629547))

(declare-fun m!629549 () Bool)

(assert (=> b!655977 m!629549))

(assert (=> b!655977 m!629505))

(declare-fun m!629551 () Bool)

(assert (=> b!655977 m!629551))

(assert (=> b!655977 m!629507))

(declare-fun m!629553 () Bool)

(assert (=> b!655979 m!629553))

(declare-fun m!629555 () Bool)

(assert (=> b!655978 m!629555))

(assert (=> b!655978 m!629497))

(assert (=> b!655978 m!629521))

(assert (=> b!655978 m!629497))

(declare-fun m!629557 () Bool)

(assert (=> b!655978 m!629557))

(declare-fun m!629559 () Bool)

(assert (=> b!655978 m!629559))

(declare-fun m!629561 () Bool)

(assert (=> b!655978 m!629561))

(declare-fun m!629563 () Bool)

(assert (=> b!655978 m!629563))

(declare-fun m!629565 () Bool)

(assert (=> b!655978 m!629565))

(assert (=> b!655986 m!629497))

(assert (=> b!655986 m!629497))

(assert (=> b!655986 m!629529))

(check-sat (not b!655989) (not b!655978) (not b!655993) (not b!655977) (not b!655986) (not b!655994) (not b!655982) (not b!655990) (not b!655976) (not b!655995) (not b!655973) (not b!655979) (not b!655985) (not start!59424))
(check-sat)
