; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53994 () Bool)

(assert start!53994)

(declare-fun b!589953 () Bool)

(declare-fun res!377407 () Bool)

(declare-fun e!336796 () Bool)

(assert (=> b!589953 (=> (not res!377407) (not e!336796))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!589953 (= res!377407 (validKeyInArray!0 k0!1786))))

(declare-fun res!377399 () Bool)

(assert (=> start!53994 (=> (not res!377399) (not e!336796))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53994 (= res!377399 (validMask!0 mask!3053))))

(assert (=> start!53994 e!336796))

(assert (=> start!53994 true))

(declare-datatypes ((array!36838 0))(
  ( (array!36839 (arr!17692 (Array (_ BitVec 32) (_ BitVec 64))) (size!18056 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36838)

(declare-fun array_inv!13488 (array!36838) Bool)

(assert (=> start!53994 (array_inv!13488 a!2986)))

(declare-fun b!589954 () Bool)

(declare-fun e!336797 () Bool)

(declare-fun e!336798 () Bool)

(assert (=> b!589954 (= e!336797 e!336798)))

(declare-fun res!377408 () Bool)

(assert (=> b!589954 (=> (not res!377408) (not e!336798))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!589954 (= res!377408 (= (select (store (arr!17692 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!267646 () array!36838)

(assert (=> b!589954 (= lt!267646 (array!36839 (store (arr!17692 a!2986) i!1108 k0!1786) (size!18056 a!2986)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!336791 () Bool)

(declare-fun b!589955 () Bool)

(declare-fun lt!267645 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!589955 (= e!336791 (or (not (= (select (arr!17692 a!2986) j!136) lt!267645)) (not (= (select (arr!17692 a!2986) j!136) (select (store (arr!17692 a!2986) i!1108 k0!1786) index!984))) (bvsge j!136 index!984) (bvslt (size!18056 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!589955 (= (select (store (arr!17692 a!2986) i!1108 k0!1786) index!984) (select (arr!17692 a!2986) j!136))))

(declare-fun b!589956 () Bool)

(declare-fun e!336793 () Bool)

(declare-datatypes ((SeekEntryResult!6132 0))(
  ( (MissingZero!6132 (index!26758 (_ BitVec 32))) (Found!6132 (index!26759 (_ BitVec 32))) (Intermediate!6132 (undefined!6944 Bool) (index!26760 (_ BitVec 32)) (x!55546 (_ BitVec 32))) (Undefined!6132) (MissingVacant!6132 (index!26761 (_ BitVec 32))) )
))
(declare-fun lt!267644 () SeekEntryResult!6132)

(declare-fun lt!267640 () SeekEntryResult!6132)

(assert (=> b!589956 (= e!336793 (= lt!267644 lt!267640))))

(declare-fun b!589957 () Bool)

(declare-fun res!377401 () Bool)

(assert (=> b!589957 (=> (not res!377401) (not e!336796))))

(declare-fun arrayContainsKey!0 (array!36838 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!589957 (= res!377401 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!589958 () Bool)

(declare-fun res!377400 () Bool)

(assert (=> b!589958 (=> (not res!377400) (not e!336796))))

(assert (=> b!589958 (= res!377400 (validKeyInArray!0 (select (arr!17692 a!2986) j!136)))))

(declare-fun b!589959 () Bool)

(declare-fun res!377402 () Bool)

(assert (=> b!589959 (=> (not res!377402) (not e!336797))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36838 (_ BitVec 32)) Bool)

(assert (=> b!589959 (= res!377402 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!589960 () Bool)

(declare-fun res!377410 () Bool)

(assert (=> b!589960 (=> (not res!377410) (not e!336796))))

(assert (=> b!589960 (= res!377410 (and (= (size!18056 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18056 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18056 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!589961 () Bool)

(assert (=> b!589961 (= e!336796 e!336797)))

(declare-fun res!377406 () Bool)

(assert (=> b!589961 (=> (not res!377406) (not e!336797))))

(declare-fun lt!267643 () SeekEntryResult!6132)

(assert (=> b!589961 (= res!377406 (or (= lt!267643 (MissingZero!6132 i!1108)) (= lt!267643 (MissingVacant!6132 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36838 (_ BitVec 32)) SeekEntryResult!6132)

(assert (=> b!589961 (= lt!267643 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!589962 () Bool)

(declare-fun e!336794 () Bool)

(assert (=> b!589962 (= e!336798 e!336794)))

(declare-fun res!377411 () Bool)

(assert (=> b!589962 (=> (not res!377411) (not e!336794))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!589962 (= res!377411 (and (= lt!267644 (Found!6132 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17692 a!2986) index!984) (select (arr!17692 a!2986) j!136))) (not (= (select (arr!17692 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36838 (_ BitVec 32)) SeekEntryResult!6132)

(assert (=> b!589962 (= lt!267644 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17692 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!589963 () Bool)

(declare-datatypes ((Unit!18446 0))(
  ( (Unit!18447) )
))
(declare-fun e!336795 () Unit!18446)

(declare-fun Unit!18448 () Unit!18446)

(assert (=> b!589963 (= e!336795 Unit!18448)))

(assert (=> b!589963 false))

(declare-fun b!589964 () Bool)

(assert (=> b!589964 (= e!336794 (not e!336791))))

(declare-fun res!377409 () Bool)

(assert (=> b!589964 (=> res!377409 e!336791)))

(declare-fun lt!267641 () SeekEntryResult!6132)

(assert (=> b!589964 (= res!377409 (not (= lt!267641 (Found!6132 index!984))))))

(declare-fun lt!267639 () Unit!18446)

(assert (=> b!589964 (= lt!267639 e!336795)))

(declare-fun c!66644 () Bool)

(assert (=> b!589964 (= c!66644 (= lt!267641 Undefined!6132))))

(assert (=> b!589964 (= lt!267641 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267645 lt!267646 mask!3053))))

(assert (=> b!589964 e!336793))

(declare-fun res!377405 () Bool)

(assert (=> b!589964 (=> (not res!377405) (not e!336793))))

(declare-fun lt!267642 () (_ BitVec 32))

(assert (=> b!589964 (= res!377405 (= lt!267640 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267642 vacantSpotIndex!68 lt!267645 lt!267646 mask!3053)))))

(assert (=> b!589964 (= lt!267640 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267642 vacantSpotIndex!68 (select (arr!17692 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!589964 (= lt!267645 (select (store (arr!17692 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!267638 () Unit!18446)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36838 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18446)

(assert (=> b!589964 (= lt!267638 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267642 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!589964 (= lt!267642 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!589965 () Bool)

(declare-fun res!377404 () Bool)

(assert (=> b!589965 (=> (not res!377404) (not e!336797))))

(declare-datatypes ((List!11733 0))(
  ( (Nil!11730) (Cons!11729 (h!12774 (_ BitVec 64)) (t!17961 List!11733)) )
))
(declare-fun arrayNoDuplicates!0 (array!36838 (_ BitVec 32) List!11733) Bool)

(assert (=> b!589965 (= res!377404 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11730))))

(declare-fun b!589966 () Bool)

(declare-fun Unit!18449 () Unit!18446)

(assert (=> b!589966 (= e!336795 Unit!18449)))

(declare-fun b!589967 () Bool)

(declare-fun res!377403 () Bool)

(assert (=> b!589967 (=> (not res!377403) (not e!336797))))

(assert (=> b!589967 (= res!377403 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17692 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!53994 res!377399) b!589960))

(assert (= (and b!589960 res!377410) b!589958))

(assert (= (and b!589958 res!377400) b!589953))

(assert (= (and b!589953 res!377407) b!589957))

(assert (= (and b!589957 res!377401) b!589961))

(assert (= (and b!589961 res!377406) b!589959))

(assert (= (and b!589959 res!377402) b!589965))

(assert (= (and b!589965 res!377404) b!589967))

(assert (= (and b!589967 res!377403) b!589954))

(assert (= (and b!589954 res!377408) b!589962))

(assert (= (and b!589962 res!377411) b!589964))

(assert (= (and b!589964 res!377405) b!589956))

(assert (= (and b!589964 c!66644) b!589963))

(assert (= (and b!589964 (not c!66644)) b!589966))

(assert (= (and b!589964 (not res!377409)) b!589955))

(declare-fun m!568447 () Bool)

(assert (=> b!589958 m!568447))

(assert (=> b!589958 m!568447))

(declare-fun m!568449 () Bool)

(assert (=> b!589958 m!568449))

(assert (=> b!589955 m!568447))

(declare-fun m!568451 () Bool)

(assert (=> b!589955 m!568451))

(declare-fun m!568453 () Bool)

(assert (=> b!589955 m!568453))

(declare-fun m!568455 () Bool)

(assert (=> b!589962 m!568455))

(assert (=> b!589962 m!568447))

(assert (=> b!589962 m!568447))

(declare-fun m!568457 () Bool)

(assert (=> b!589962 m!568457))

(declare-fun m!568459 () Bool)

(assert (=> b!589959 m!568459))

(declare-fun m!568461 () Bool)

(assert (=> b!589967 m!568461))

(declare-fun m!568463 () Bool)

(assert (=> b!589953 m!568463))

(declare-fun m!568465 () Bool)

(assert (=> start!53994 m!568465))

(declare-fun m!568467 () Bool)

(assert (=> start!53994 m!568467))

(declare-fun m!568469 () Bool)

(assert (=> b!589961 m!568469))

(assert (=> b!589954 m!568451))

(declare-fun m!568471 () Bool)

(assert (=> b!589954 m!568471))

(declare-fun m!568473 () Bool)

(assert (=> b!589957 m!568473))

(declare-fun m!568475 () Bool)

(assert (=> b!589965 m!568475))

(declare-fun m!568477 () Bool)

(assert (=> b!589964 m!568477))

(declare-fun m!568479 () Bool)

(assert (=> b!589964 m!568479))

(assert (=> b!589964 m!568447))

(assert (=> b!589964 m!568447))

(declare-fun m!568481 () Bool)

(assert (=> b!589964 m!568481))

(declare-fun m!568483 () Bool)

(assert (=> b!589964 m!568483))

(declare-fun m!568485 () Bool)

(assert (=> b!589964 m!568485))

(declare-fun m!568487 () Bool)

(assert (=> b!589964 m!568487))

(assert (=> b!589964 m!568451))

(check-sat (not b!589953) (not b!589958) (not b!589961) (not start!53994) (not b!589964) (not b!589959) (not b!589965) (not b!589957) (not b!589962))
(check-sat)
(get-model)

(declare-fun d!86027 () Bool)

(assert (=> d!86027 (= (validKeyInArray!0 (select (arr!17692 a!2986) j!136)) (and (not (= (select (arr!17692 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17692 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!589958 d!86027))

(declare-fun b!590025 () Bool)

(declare-fun e!336829 () SeekEntryResult!6132)

(declare-fun e!336831 () SeekEntryResult!6132)

(assert (=> b!590025 (= e!336829 e!336831)))

(declare-fun c!66655 () Bool)

(declare-fun lt!267679 () (_ BitVec 64))

(assert (=> b!590025 (= c!66655 (= lt!267679 lt!267645))))

(declare-fun e!336830 () SeekEntryResult!6132)

(declare-fun b!590026 () Bool)

(assert (=> b!590026 (= e!336830 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!267642 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!267645 lt!267646 mask!3053))))

(declare-fun b!590027 () Bool)

(assert (=> b!590027 (= e!336829 Undefined!6132)))

(declare-fun b!590028 () Bool)

(assert (=> b!590028 (= e!336831 (Found!6132 lt!267642))))

(declare-fun b!590029 () Bool)

(assert (=> b!590029 (= e!336830 (MissingVacant!6132 vacantSpotIndex!68))))

(declare-fun b!590030 () Bool)

(declare-fun c!66656 () Bool)

(assert (=> b!590030 (= c!66656 (= lt!267679 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!590030 (= e!336831 e!336830)))

(declare-fun lt!267678 () SeekEntryResult!6132)

(declare-fun d!86029 () Bool)

(get-info :version)

(assert (=> d!86029 (and (or ((_ is Undefined!6132) lt!267678) (not ((_ is Found!6132) lt!267678)) (and (bvsge (index!26759 lt!267678) #b00000000000000000000000000000000) (bvslt (index!26759 lt!267678) (size!18056 lt!267646)))) (or ((_ is Undefined!6132) lt!267678) ((_ is Found!6132) lt!267678) (not ((_ is MissingVacant!6132) lt!267678)) (not (= (index!26761 lt!267678) vacantSpotIndex!68)) (and (bvsge (index!26761 lt!267678) #b00000000000000000000000000000000) (bvslt (index!26761 lt!267678) (size!18056 lt!267646)))) (or ((_ is Undefined!6132) lt!267678) (ite ((_ is Found!6132) lt!267678) (= (select (arr!17692 lt!267646) (index!26759 lt!267678)) lt!267645) (and ((_ is MissingVacant!6132) lt!267678) (= (index!26761 lt!267678) vacantSpotIndex!68) (= (select (arr!17692 lt!267646) (index!26761 lt!267678)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86029 (= lt!267678 e!336829)))

(declare-fun c!66654 () Bool)

(assert (=> d!86029 (= c!66654 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!86029 (= lt!267679 (select (arr!17692 lt!267646) lt!267642))))

(assert (=> d!86029 (validMask!0 mask!3053)))

(assert (=> d!86029 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267642 vacantSpotIndex!68 lt!267645 lt!267646 mask!3053) lt!267678)))

(assert (= (and d!86029 c!66654) b!590027))

(assert (= (and d!86029 (not c!66654)) b!590025))

(assert (= (and b!590025 c!66655) b!590028))

(assert (= (and b!590025 (not c!66655)) b!590030))

(assert (= (and b!590030 c!66656) b!590029))

(assert (= (and b!590030 (not c!66656)) b!590026))

(declare-fun m!568531 () Bool)

(assert (=> b!590026 m!568531))

(assert (=> b!590026 m!568531))

(declare-fun m!568533 () Bool)

(assert (=> b!590026 m!568533))

(declare-fun m!568535 () Bool)

(assert (=> d!86029 m!568535))

(declare-fun m!568537 () Bool)

(assert (=> d!86029 m!568537))

(declare-fun m!568539 () Bool)

(assert (=> d!86029 m!568539))

(assert (=> d!86029 m!568465))

(assert (=> b!589964 d!86029))

(declare-fun b!590031 () Bool)

(declare-fun e!336832 () SeekEntryResult!6132)

(declare-fun e!336834 () SeekEntryResult!6132)

(assert (=> b!590031 (= e!336832 e!336834)))

(declare-fun c!66658 () Bool)

(declare-fun lt!267681 () (_ BitVec 64))

(assert (=> b!590031 (= c!66658 (= lt!267681 lt!267645))))

(declare-fun b!590032 () Bool)

(declare-fun e!336833 () SeekEntryResult!6132)

(assert (=> b!590032 (= e!336833 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!267645 lt!267646 mask!3053))))

(declare-fun b!590033 () Bool)

(assert (=> b!590033 (= e!336832 Undefined!6132)))

(declare-fun b!590034 () Bool)

(assert (=> b!590034 (= e!336834 (Found!6132 index!984))))

(declare-fun b!590035 () Bool)

(assert (=> b!590035 (= e!336833 (MissingVacant!6132 vacantSpotIndex!68))))

(declare-fun b!590036 () Bool)

(declare-fun c!66659 () Bool)

(assert (=> b!590036 (= c!66659 (= lt!267681 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!590036 (= e!336834 e!336833)))

(declare-fun lt!267680 () SeekEntryResult!6132)

(declare-fun d!86031 () Bool)

(assert (=> d!86031 (and (or ((_ is Undefined!6132) lt!267680) (not ((_ is Found!6132) lt!267680)) (and (bvsge (index!26759 lt!267680) #b00000000000000000000000000000000) (bvslt (index!26759 lt!267680) (size!18056 lt!267646)))) (or ((_ is Undefined!6132) lt!267680) ((_ is Found!6132) lt!267680) (not ((_ is MissingVacant!6132) lt!267680)) (not (= (index!26761 lt!267680) vacantSpotIndex!68)) (and (bvsge (index!26761 lt!267680) #b00000000000000000000000000000000) (bvslt (index!26761 lt!267680) (size!18056 lt!267646)))) (or ((_ is Undefined!6132) lt!267680) (ite ((_ is Found!6132) lt!267680) (= (select (arr!17692 lt!267646) (index!26759 lt!267680)) lt!267645) (and ((_ is MissingVacant!6132) lt!267680) (= (index!26761 lt!267680) vacantSpotIndex!68) (= (select (arr!17692 lt!267646) (index!26761 lt!267680)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86031 (= lt!267680 e!336832)))

(declare-fun c!66657 () Bool)

(assert (=> d!86031 (= c!66657 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!86031 (= lt!267681 (select (arr!17692 lt!267646) index!984))))

(assert (=> d!86031 (validMask!0 mask!3053)))

(assert (=> d!86031 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267645 lt!267646 mask!3053) lt!267680)))

(assert (= (and d!86031 c!66657) b!590033))

(assert (= (and d!86031 (not c!66657)) b!590031))

(assert (= (and b!590031 c!66658) b!590034))

(assert (= (and b!590031 (not c!66658)) b!590036))

(assert (= (and b!590036 c!66659) b!590035))

(assert (= (and b!590036 (not c!66659)) b!590032))

(assert (=> b!590032 m!568477))

(assert (=> b!590032 m!568477))

(declare-fun m!568541 () Bool)

(assert (=> b!590032 m!568541))

(declare-fun m!568543 () Bool)

(assert (=> d!86031 m!568543))

(declare-fun m!568545 () Bool)

(assert (=> d!86031 m!568545))

(declare-fun m!568547 () Bool)

(assert (=> d!86031 m!568547))

(assert (=> d!86031 m!568465))

(assert (=> b!589964 d!86031))

(declare-fun d!86033 () Bool)

(declare-fun e!336837 () Bool)

(assert (=> d!86033 e!336837))

(declare-fun res!377453 () Bool)

(assert (=> d!86033 (=> (not res!377453) (not e!336837))))

(assert (=> d!86033 (= res!377453 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18056 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18056 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18056 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18056 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18056 a!2986))))))

(declare-fun lt!267684 () Unit!18446)

(declare-fun choose!9 (array!36838 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18446)

(assert (=> d!86033 (= lt!267684 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267642 vacantSpotIndex!68 mask!3053))))

(assert (=> d!86033 (validMask!0 mask!3053)))

(assert (=> d!86033 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267642 vacantSpotIndex!68 mask!3053) lt!267684)))

(declare-fun b!590039 () Bool)

(assert (=> b!590039 (= e!336837 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267642 vacantSpotIndex!68 (select (arr!17692 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267642 vacantSpotIndex!68 (select (store (arr!17692 a!2986) i!1108 k0!1786) j!136) (array!36839 (store (arr!17692 a!2986) i!1108 k0!1786) (size!18056 a!2986)) mask!3053)))))

(assert (= (and d!86033 res!377453) b!590039))

(declare-fun m!568549 () Bool)

(assert (=> d!86033 m!568549))

(assert (=> d!86033 m!568465))

(assert (=> b!590039 m!568447))

(assert (=> b!590039 m!568479))

(assert (=> b!590039 m!568447))

(assert (=> b!590039 m!568481))

(assert (=> b!590039 m!568451))

(assert (=> b!590039 m!568479))

(declare-fun m!568551 () Bool)

(assert (=> b!590039 m!568551))

(assert (=> b!589964 d!86033))

(declare-fun d!86037 () Bool)

(declare-fun lt!267687 () (_ BitVec 32))

(assert (=> d!86037 (and (bvsge lt!267687 #b00000000000000000000000000000000) (bvslt lt!267687 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86037 (= lt!267687 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!86037 (validMask!0 mask!3053)))

(assert (=> d!86037 (= (nextIndex!0 index!984 x!910 mask!3053) lt!267687)))

(declare-fun bs!18247 () Bool)

(assert (= bs!18247 d!86037))

(declare-fun m!568553 () Bool)

(assert (=> bs!18247 m!568553))

(assert (=> bs!18247 m!568465))

(assert (=> b!589964 d!86037))

(declare-fun b!590040 () Bool)

(declare-fun e!336838 () SeekEntryResult!6132)

(declare-fun e!336840 () SeekEntryResult!6132)

(assert (=> b!590040 (= e!336838 e!336840)))

(declare-fun c!66661 () Bool)

(declare-fun lt!267689 () (_ BitVec 64))

(assert (=> b!590040 (= c!66661 (= lt!267689 (select (arr!17692 a!2986) j!136)))))

(declare-fun b!590041 () Bool)

(declare-fun e!336839 () SeekEntryResult!6132)

(assert (=> b!590041 (= e!336839 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!267642 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!17692 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!590042 () Bool)

(assert (=> b!590042 (= e!336838 Undefined!6132)))

(declare-fun b!590043 () Bool)

(assert (=> b!590043 (= e!336840 (Found!6132 lt!267642))))

(declare-fun b!590044 () Bool)

(assert (=> b!590044 (= e!336839 (MissingVacant!6132 vacantSpotIndex!68))))

(declare-fun b!590045 () Bool)

(declare-fun c!66662 () Bool)

(assert (=> b!590045 (= c!66662 (= lt!267689 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!590045 (= e!336840 e!336839)))

(declare-fun d!86041 () Bool)

(declare-fun lt!267688 () SeekEntryResult!6132)

(assert (=> d!86041 (and (or ((_ is Undefined!6132) lt!267688) (not ((_ is Found!6132) lt!267688)) (and (bvsge (index!26759 lt!267688) #b00000000000000000000000000000000) (bvslt (index!26759 lt!267688) (size!18056 a!2986)))) (or ((_ is Undefined!6132) lt!267688) ((_ is Found!6132) lt!267688) (not ((_ is MissingVacant!6132) lt!267688)) (not (= (index!26761 lt!267688) vacantSpotIndex!68)) (and (bvsge (index!26761 lt!267688) #b00000000000000000000000000000000) (bvslt (index!26761 lt!267688) (size!18056 a!2986)))) (or ((_ is Undefined!6132) lt!267688) (ite ((_ is Found!6132) lt!267688) (= (select (arr!17692 a!2986) (index!26759 lt!267688)) (select (arr!17692 a!2986) j!136)) (and ((_ is MissingVacant!6132) lt!267688) (= (index!26761 lt!267688) vacantSpotIndex!68) (= (select (arr!17692 a!2986) (index!26761 lt!267688)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86041 (= lt!267688 e!336838)))

(declare-fun c!66660 () Bool)

(assert (=> d!86041 (= c!66660 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!86041 (= lt!267689 (select (arr!17692 a!2986) lt!267642))))

(assert (=> d!86041 (validMask!0 mask!3053)))

(assert (=> d!86041 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267642 vacantSpotIndex!68 (select (arr!17692 a!2986) j!136) a!2986 mask!3053) lt!267688)))

(assert (= (and d!86041 c!66660) b!590042))

(assert (= (and d!86041 (not c!66660)) b!590040))

(assert (= (and b!590040 c!66661) b!590043))

(assert (= (and b!590040 (not c!66661)) b!590045))

(assert (= (and b!590045 c!66662) b!590044))

(assert (= (and b!590045 (not c!66662)) b!590041))

(assert (=> b!590041 m!568531))

(assert (=> b!590041 m!568531))

(assert (=> b!590041 m!568447))

(declare-fun m!568555 () Bool)

(assert (=> b!590041 m!568555))

(declare-fun m!568557 () Bool)

(assert (=> d!86041 m!568557))

(declare-fun m!568559 () Bool)

(assert (=> d!86041 m!568559))

(declare-fun m!568561 () Bool)

(assert (=> d!86041 m!568561))

(assert (=> d!86041 m!568465))

(assert (=> b!589964 d!86041))

(declare-fun d!86043 () Bool)

(assert (=> d!86043 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!589953 d!86043))

(declare-fun b!590072 () Bool)

(declare-fun e!336858 () Bool)

(declare-fun call!32798 () Bool)

(assert (=> b!590072 (= e!336858 call!32798)))

(declare-fun bm!32795 () Bool)

(assert (=> bm!32795 (= call!32798 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!590073 () Bool)

(declare-fun e!336856 () Bool)

(assert (=> b!590073 (= e!336856 call!32798)))

(declare-fun b!590074 () Bool)

(declare-fun e!336857 () Bool)

(assert (=> b!590074 (= e!336857 e!336856)))

(declare-fun c!66674 () Bool)

(assert (=> b!590074 (= c!66674 (validKeyInArray!0 (select (arr!17692 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!590075 () Bool)

(assert (=> b!590075 (= e!336856 e!336858)))

(declare-fun lt!267702 () (_ BitVec 64))

(assert (=> b!590075 (= lt!267702 (select (arr!17692 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!267704 () Unit!18446)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!36838 (_ BitVec 64) (_ BitVec 32)) Unit!18446)

(assert (=> b!590075 (= lt!267704 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!267702 #b00000000000000000000000000000000))))

(assert (=> b!590075 (arrayContainsKey!0 a!2986 lt!267702 #b00000000000000000000000000000000)))

(declare-fun lt!267703 () Unit!18446)

(assert (=> b!590075 (= lt!267703 lt!267704)))

(declare-fun res!377458 () Bool)

(assert (=> b!590075 (= res!377458 (= (seekEntryOrOpen!0 (select (arr!17692 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6132 #b00000000000000000000000000000000)))))

(assert (=> b!590075 (=> (not res!377458) (not e!336858))))

(declare-fun d!86045 () Bool)

(declare-fun res!377459 () Bool)

(assert (=> d!86045 (=> res!377459 e!336857)))

(assert (=> d!86045 (= res!377459 (bvsge #b00000000000000000000000000000000 (size!18056 a!2986)))))

(assert (=> d!86045 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!336857)))

(assert (= (and d!86045 (not res!377459)) b!590074))

(assert (= (and b!590074 c!66674) b!590075))

(assert (= (and b!590074 (not c!66674)) b!590073))

(assert (= (and b!590075 res!377458) b!590072))

(assert (= (or b!590072 b!590073) bm!32795))

(declare-fun m!568569 () Bool)

(assert (=> bm!32795 m!568569))

(declare-fun m!568571 () Bool)

(assert (=> b!590074 m!568571))

(assert (=> b!590074 m!568571))

(declare-fun m!568573 () Bool)

(assert (=> b!590074 m!568573))

(assert (=> b!590075 m!568571))

(declare-fun m!568575 () Bool)

(assert (=> b!590075 m!568575))

(declare-fun m!568577 () Bool)

(assert (=> b!590075 m!568577))

(assert (=> b!590075 m!568571))

(declare-fun m!568579 () Bool)

(assert (=> b!590075 m!568579))

(assert (=> b!589959 d!86045))

(declare-fun b!590086 () Bool)

(declare-fun e!336869 () Bool)

(declare-fun e!336868 () Bool)

(assert (=> b!590086 (= e!336869 e!336868)))

(declare-fun c!66677 () Bool)

(assert (=> b!590086 (= c!66677 (validKeyInArray!0 (select (arr!17692 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!32798 () Bool)

(declare-fun call!32801 () Bool)

(assert (=> bm!32798 (= call!32801 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!66677 (Cons!11729 (select (arr!17692 a!2986) #b00000000000000000000000000000000) Nil!11730) Nil!11730)))))

(declare-fun b!590087 () Bool)

(declare-fun e!336870 () Bool)

(declare-fun contains!2907 (List!11733 (_ BitVec 64)) Bool)

(assert (=> b!590087 (= e!336870 (contains!2907 Nil!11730 (select (arr!17692 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!590088 () Bool)

(declare-fun e!336867 () Bool)

(assert (=> b!590088 (= e!336867 e!336869)))

(declare-fun res!377466 () Bool)

(assert (=> b!590088 (=> (not res!377466) (not e!336869))))

(assert (=> b!590088 (= res!377466 (not e!336870))))

(declare-fun res!377468 () Bool)

(assert (=> b!590088 (=> (not res!377468) (not e!336870))))

(assert (=> b!590088 (= res!377468 (validKeyInArray!0 (select (arr!17692 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!590089 () Bool)

(assert (=> b!590089 (= e!336868 call!32801)))

(declare-fun d!86049 () Bool)

(declare-fun res!377467 () Bool)

(assert (=> d!86049 (=> res!377467 e!336867)))

(assert (=> d!86049 (= res!377467 (bvsge #b00000000000000000000000000000000 (size!18056 a!2986)))))

(assert (=> d!86049 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11730) e!336867)))

(declare-fun b!590090 () Bool)

(assert (=> b!590090 (= e!336868 call!32801)))

(assert (= (and d!86049 (not res!377467)) b!590088))

(assert (= (and b!590088 res!377468) b!590087))

(assert (= (and b!590088 res!377466) b!590086))

(assert (= (and b!590086 c!66677) b!590089))

(assert (= (and b!590086 (not c!66677)) b!590090))

(assert (= (or b!590089 b!590090) bm!32798))

(assert (=> b!590086 m!568571))

(assert (=> b!590086 m!568571))

(assert (=> b!590086 m!568573))

(assert (=> bm!32798 m!568571))

(declare-fun m!568581 () Bool)

(assert (=> bm!32798 m!568581))

(assert (=> b!590087 m!568571))

(assert (=> b!590087 m!568571))

(declare-fun m!568583 () Bool)

(assert (=> b!590087 m!568583))

(assert (=> b!590088 m!568571))

(assert (=> b!590088 m!568571))

(assert (=> b!590088 m!568573))

(assert (=> b!589965 d!86049))

(declare-fun b!590147 () Bool)

(declare-fun e!336901 () SeekEntryResult!6132)

(declare-fun lt!267733 () SeekEntryResult!6132)

(assert (=> b!590147 (= e!336901 (Found!6132 (index!26760 lt!267733)))))

(declare-fun b!590148 () Bool)

(declare-fun e!336902 () SeekEntryResult!6132)

(assert (=> b!590148 (= e!336902 (MissingZero!6132 (index!26760 lt!267733)))))

(declare-fun b!590149 () Bool)

(declare-fun e!336903 () SeekEntryResult!6132)

(assert (=> b!590149 (= e!336903 e!336901)))

(declare-fun lt!267732 () (_ BitVec 64))

(assert (=> b!590149 (= lt!267732 (select (arr!17692 a!2986) (index!26760 lt!267733)))))

(declare-fun c!66704 () Bool)

(assert (=> b!590149 (= c!66704 (= lt!267732 k0!1786))))

(declare-fun b!590150 () Bool)

(assert (=> b!590150 (= e!336903 Undefined!6132)))

(declare-fun d!86051 () Bool)

(declare-fun lt!267734 () SeekEntryResult!6132)

(assert (=> d!86051 (and (or ((_ is Undefined!6132) lt!267734) (not ((_ is Found!6132) lt!267734)) (and (bvsge (index!26759 lt!267734) #b00000000000000000000000000000000) (bvslt (index!26759 lt!267734) (size!18056 a!2986)))) (or ((_ is Undefined!6132) lt!267734) ((_ is Found!6132) lt!267734) (not ((_ is MissingZero!6132) lt!267734)) (and (bvsge (index!26758 lt!267734) #b00000000000000000000000000000000) (bvslt (index!26758 lt!267734) (size!18056 a!2986)))) (or ((_ is Undefined!6132) lt!267734) ((_ is Found!6132) lt!267734) ((_ is MissingZero!6132) lt!267734) (not ((_ is MissingVacant!6132) lt!267734)) (and (bvsge (index!26761 lt!267734) #b00000000000000000000000000000000) (bvslt (index!26761 lt!267734) (size!18056 a!2986)))) (or ((_ is Undefined!6132) lt!267734) (ite ((_ is Found!6132) lt!267734) (= (select (arr!17692 a!2986) (index!26759 lt!267734)) k0!1786) (ite ((_ is MissingZero!6132) lt!267734) (= (select (arr!17692 a!2986) (index!26758 lt!267734)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6132) lt!267734) (= (select (arr!17692 a!2986) (index!26761 lt!267734)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!86051 (= lt!267734 e!336903)))

(declare-fun c!66706 () Bool)

(assert (=> d!86051 (= c!66706 (and ((_ is Intermediate!6132) lt!267733) (undefined!6944 lt!267733)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36838 (_ BitVec 32)) SeekEntryResult!6132)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86051 (= lt!267733 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!86051 (validMask!0 mask!3053)))

(assert (=> d!86051 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!267734)))

(declare-fun b!590151 () Bool)

(declare-fun c!66705 () Bool)

(assert (=> b!590151 (= c!66705 (= lt!267732 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!590151 (= e!336901 e!336902)))

(declare-fun b!590152 () Bool)

(assert (=> b!590152 (= e!336902 (seekKeyOrZeroReturnVacant!0 (x!55546 lt!267733) (index!26760 lt!267733) (index!26760 lt!267733) k0!1786 a!2986 mask!3053))))

(assert (= (and d!86051 c!66706) b!590150))

(assert (= (and d!86051 (not c!66706)) b!590149))

(assert (= (and b!590149 c!66704) b!590147))

(assert (= (and b!590149 (not c!66704)) b!590151))

(assert (= (and b!590151 c!66705) b!590148))

(assert (= (and b!590151 (not c!66705)) b!590152))

(declare-fun m!568605 () Bool)

(assert (=> b!590149 m!568605))

(declare-fun m!568607 () Bool)

(assert (=> d!86051 m!568607))

(assert (=> d!86051 m!568465))

(declare-fun m!568609 () Bool)

(assert (=> d!86051 m!568609))

(declare-fun m!568611 () Bool)

(assert (=> d!86051 m!568611))

(declare-fun m!568613 () Bool)

(assert (=> d!86051 m!568613))

(assert (=> d!86051 m!568607))

(declare-fun m!568615 () Bool)

(assert (=> d!86051 m!568615))

(declare-fun m!568617 () Bool)

(assert (=> b!590152 m!568617))

(assert (=> b!589961 d!86051))

(declare-fun b!590153 () Bool)

(declare-fun e!336904 () SeekEntryResult!6132)

(declare-fun e!336906 () SeekEntryResult!6132)

(assert (=> b!590153 (= e!336904 e!336906)))

(declare-fun c!66708 () Bool)

(declare-fun lt!267740 () (_ BitVec 64))

(assert (=> b!590153 (= c!66708 (= lt!267740 (select (arr!17692 a!2986) j!136)))))

(declare-fun e!336905 () SeekEntryResult!6132)

(declare-fun b!590154 () Bool)

(assert (=> b!590154 (= e!336905 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!17692 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!590155 () Bool)

(assert (=> b!590155 (= e!336904 Undefined!6132)))

(declare-fun b!590156 () Bool)

(assert (=> b!590156 (= e!336906 (Found!6132 index!984))))

(declare-fun b!590157 () Bool)

(assert (=> b!590157 (= e!336905 (MissingVacant!6132 vacantSpotIndex!68))))

(declare-fun b!590158 () Bool)

(declare-fun c!66709 () Bool)

(assert (=> b!590158 (= c!66709 (= lt!267740 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!590158 (= e!336906 e!336905)))

(declare-fun lt!267739 () SeekEntryResult!6132)

(declare-fun d!86057 () Bool)

(assert (=> d!86057 (and (or ((_ is Undefined!6132) lt!267739) (not ((_ is Found!6132) lt!267739)) (and (bvsge (index!26759 lt!267739) #b00000000000000000000000000000000) (bvslt (index!26759 lt!267739) (size!18056 a!2986)))) (or ((_ is Undefined!6132) lt!267739) ((_ is Found!6132) lt!267739) (not ((_ is MissingVacant!6132) lt!267739)) (not (= (index!26761 lt!267739) vacantSpotIndex!68)) (and (bvsge (index!26761 lt!267739) #b00000000000000000000000000000000) (bvslt (index!26761 lt!267739) (size!18056 a!2986)))) (or ((_ is Undefined!6132) lt!267739) (ite ((_ is Found!6132) lt!267739) (= (select (arr!17692 a!2986) (index!26759 lt!267739)) (select (arr!17692 a!2986) j!136)) (and ((_ is MissingVacant!6132) lt!267739) (= (index!26761 lt!267739) vacantSpotIndex!68) (= (select (arr!17692 a!2986) (index!26761 lt!267739)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86057 (= lt!267739 e!336904)))

(declare-fun c!66707 () Bool)

(assert (=> d!86057 (= c!66707 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!86057 (= lt!267740 (select (arr!17692 a!2986) index!984))))

(assert (=> d!86057 (validMask!0 mask!3053)))

(assert (=> d!86057 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17692 a!2986) j!136) a!2986 mask!3053) lt!267739)))

(assert (= (and d!86057 c!66707) b!590155))

(assert (= (and d!86057 (not c!66707)) b!590153))

(assert (= (and b!590153 c!66708) b!590156))

(assert (= (and b!590153 (not c!66708)) b!590158))

(assert (= (and b!590158 c!66709) b!590157))

(assert (= (and b!590158 (not c!66709)) b!590154))

(assert (=> b!590154 m!568477))

(assert (=> b!590154 m!568477))

(assert (=> b!590154 m!568447))

(declare-fun m!568619 () Bool)

(assert (=> b!590154 m!568619))

(declare-fun m!568621 () Bool)

(assert (=> d!86057 m!568621))

(declare-fun m!568623 () Bool)

(assert (=> d!86057 m!568623))

(assert (=> d!86057 m!568455))

(assert (=> d!86057 m!568465))

(assert (=> b!589962 d!86057))

(declare-fun d!86059 () Bool)

(declare-fun res!377479 () Bool)

(declare-fun e!336920 () Bool)

(assert (=> d!86059 (=> res!377479 e!336920)))

(assert (=> d!86059 (= res!377479 (= (select (arr!17692 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!86059 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!336920)))

(declare-fun b!590179 () Bool)

(declare-fun e!336921 () Bool)

(assert (=> b!590179 (= e!336920 e!336921)))

(declare-fun res!377480 () Bool)

(assert (=> b!590179 (=> (not res!377480) (not e!336921))))

(assert (=> b!590179 (= res!377480 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18056 a!2986)))))

(declare-fun b!590180 () Bool)

(assert (=> b!590180 (= e!336921 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!86059 (not res!377479)) b!590179))

(assert (= (and b!590179 res!377480) b!590180))

(assert (=> d!86059 m!568571))

(declare-fun m!568637 () Bool)

(assert (=> b!590180 m!568637))

(assert (=> b!589957 d!86059))

(declare-fun d!86065 () Bool)

(assert (=> d!86065 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!53994 d!86065))

(declare-fun d!86077 () Bool)

(assert (=> d!86077 (= (array_inv!13488 a!2986) (bvsge (size!18056 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!53994 d!86077))

(check-sat (not d!86051) (not b!590074) (not b!590075) (not b!590086) (not d!86031) (not b!590087) (not b!590180) (not d!86057) (not bm!32798) (not b!590041) (not d!86029) (not b!590032) (not b!590026) (not b!590152) (not d!86033) (not d!86041) (not bm!32795) (not b!590154) (not b!590088) (not d!86037) (not b!590039))
(check-sat)
