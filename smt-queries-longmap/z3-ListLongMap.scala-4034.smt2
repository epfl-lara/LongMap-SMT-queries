; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54894 () Bool)

(assert start!54894)

(declare-fun b!601025 () Bool)

(declare-fun e!343635 () Bool)

(declare-fun e!343644 () Bool)

(assert (=> b!601025 (= e!343635 e!343644)))

(declare-fun res!385951 () Bool)

(assert (=> b!601025 (=> res!385951 e!343644)))

(declare-fun lt!273466 () (_ BitVec 64))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!273474 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37143 0))(
  ( (array!37144 (arr!17831 (Array (_ BitVec 32) (_ BitVec 64))) (size!18196 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37143)

(assert (=> b!601025 (= res!385951 (or (not (= (select (arr!17831 a!2986) j!136) lt!273466)) (not (= (select (arr!17831 a!2986) j!136) lt!273474)) (bvsge j!136 index!984)))))

(declare-fun b!601026 () Bool)

(declare-fun res!385964 () Bool)

(declare-fun e!343639 () Bool)

(assert (=> b!601026 (=> (not res!385964) (not e!343639))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!601026 (= res!385964 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17831 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!601027 () Bool)

(declare-fun e!343634 () Bool)

(declare-fun e!343638 () Bool)

(assert (=> b!601027 (= e!343634 e!343638)))

(declare-fun res!385961 () Bool)

(assert (=> b!601027 (=> res!385961 e!343638)))

(assert (=> b!601027 (= res!385961 (or (not (= (select (arr!17831 a!2986) j!136) lt!273466)) (not (= (select (arr!17831 a!2986) j!136) lt!273474))))))

(assert (=> b!601027 e!343635))

(declare-fun res!385952 () Bool)

(assert (=> b!601027 (=> (not res!385952) (not e!343635))))

(assert (=> b!601027 (= res!385952 (= lt!273474 (select (arr!17831 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!601027 (= lt!273474 (select (store (arr!17831 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!601028 () Bool)

(declare-fun res!385953 () Bool)

(assert (=> b!601028 (=> (not res!385953) (not e!343639))))

(declare-datatypes ((List!11911 0))(
  ( (Nil!11908) (Cons!11907 (h!12952 (_ BitVec 64)) (t!18130 List!11911)) )
))
(declare-fun arrayNoDuplicates!0 (array!37143 (_ BitVec 32) List!11911) Bool)

(assert (=> b!601028 (= res!385953 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11908))))

(declare-fun b!601029 () Bool)

(declare-fun e!343640 () Bool)

(declare-fun e!343632 () Bool)

(assert (=> b!601029 (= e!343640 e!343632)))

(declare-fun res!385959 () Bool)

(assert (=> b!601029 (=> (not res!385959) (not e!343632))))

(declare-datatypes ((SeekEntryResult!6268 0))(
  ( (MissingZero!6268 (index!27329 (_ BitVec 32))) (Found!6268 (index!27330 (_ BitVec 32))) (Intermediate!6268 (undefined!7080 Bool) (index!27331 (_ BitVec 32)) (x!56134 (_ BitVec 32))) (Undefined!6268) (MissingVacant!6268 (index!27332 (_ BitVec 32))) )
))
(declare-fun lt!273463 () SeekEntryResult!6268)

(assert (=> b!601029 (= res!385959 (and (= lt!273463 (Found!6268 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17831 a!2986) index!984) (select (arr!17831 a!2986) j!136))) (not (= (select (arr!17831 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37143 (_ BitVec 32)) SeekEntryResult!6268)

(assert (=> b!601029 (= lt!273463 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17831 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!601030 () Bool)

(declare-fun res!385965 () Bool)

(declare-fun e!343642 () Bool)

(assert (=> b!601030 (=> (not res!385965) (not e!343642))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!601030 (= res!385965 (validKeyInArray!0 (select (arr!17831 a!2986) j!136)))))

(declare-fun b!601031 () Bool)

(assert (=> b!601031 (= e!343642 e!343639)))

(declare-fun res!385954 () Bool)

(assert (=> b!601031 (=> (not res!385954) (not e!343639))))

(declare-fun lt!273473 () SeekEntryResult!6268)

(assert (=> b!601031 (= res!385954 (or (= lt!273473 (MissingZero!6268 i!1108)) (= lt!273473 (MissingVacant!6268 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37143 (_ BitVec 32)) SeekEntryResult!6268)

(assert (=> b!601031 (= lt!273473 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!601032 () Bool)

(declare-fun res!385957 () Bool)

(assert (=> b!601032 (=> (not res!385957) (not e!343639))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37143 (_ BitVec 32)) Bool)

(assert (=> b!601032 (= res!385957 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!601033 () Bool)

(declare-fun res!385960 () Bool)

(assert (=> b!601033 (=> (not res!385960) (not e!343642))))

(assert (=> b!601033 (= res!385960 (validKeyInArray!0 k0!1786))))

(declare-fun b!601034 () Bool)

(declare-datatypes ((Unit!18990 0))(
  ( (Unit!18991) )
))
(declare-fun e!343637 () Unit!18990)

(declare-fun Unit!18992 () Unit!18990)

(assert (=> b!601034 (= e!343637 Unit!18992)))

(declare-fun b!601035 () Bool)

(assert (=> b!601035 (= e!343638 true)))

(declare-fun lt!273475 () Unit!18990)

(declare-fun e!343643 () Unit!18990)

(assert (=> b!601035 (= lt!273475 e!343643)))

(declare-fun c!67905 () Bool)

(assert (=> b!601035 (= c!67905 (bvslt j!136 index!984))))

(declare-fun b!601036 () Bool)

(declare-fun Unit!18993 () Unit!18990)

(assert (=> b!601036 (= e!343637 Unit!18993)))

(assert (=> b!601036 false))

(declare-fun b!601038 () Bool)

(declare-fun Unit!18994 () Unit!18990)

(assert (=> b!601038 (= e!343643 Unit!18994)))

(declare-fun b!601039 () Bool)

(declare-fun res!385958 () Bool)

(assert (=> b!601039 (=> (not res!385958) (not e!343642))))

(assert (=> b!601039 (= res!385958 (and (= (size!18196 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18196 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18196 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!601040 () Bool)

(declare-fun e!343633 () Bool)

(assert (=> b!601040 (= e!343644 e!343633)))

(declare-fun res!385966 () Bool)

(assert (=> b!601040 (=> (not res!385966) (not e!343633))))

(declare-fun lt!273468 () array!37143)

(declare-fun arrayContainsKey!0 (array!37143 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!601040 (= res!385966 (arrayContainsKey!0 lt!273468 (select (arr!17831 a!2986) j!136) j!136))))

(declare-fun b!601041 () Bool)

(declare-fun e!343636 () Bool)

(declare-fun lt!273462 () SeekEntryResult!6268)

(assert (=> b!601041 (= e!343636 (= lt!273463 lt!273462))))

(declare-fun b!601042 () Bool)

(assert (=> b!601042 (= e!343639 e!343640)))

(declare-fun res!385963 () Bool)

(assert (=> b!601042 (=> (not res!385963) (not e!343640))))

(assert (=> b!601042 (= res!385963 (= (select (store (arr!17831 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!601042 (= lt!273468 (array!37144 (store (arr!17831 a!2986) i!1108 k0!1786) (size!18196 a!2986)))))

(declare-fun b!601043 () Bool)

(assert (=> b!601043 (= e!343632 (not e!343634))))

(declare-fun res!385967 () Bool)

(assert (=> b!601043 (=> res!385967 e!343634)))

(declare-fun lt!273467 () SeekEntryResult!6268)

(assert (=> b!601043 (= res!385967 (not (= lt!273467 (Found!6268 index!984))))))

(declare-fun lt!273472 () Unit!18990)

(assert (=> b!601043 (= lt!273472 e!343637)))

(declare-fun c!67904 () Bool)

(assert (=> b!601043 (= c!67904 (= lt!273467 Undefined!6268))))

(assert (=> b!601043 (= lt!273467 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!273466 lt!273468 mask!3053))))

(assert (=> b!601043 e!343636))

(declare-fun res!385962 () Bool)

(assert (=> b!601043 (=> (not res!385962) (not e!343636))))

(declare-fun lt!273464 () (_ BitVec 32))

(assert (=> b!601043 (= res!385962 (= lt!273462 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273464 vacantSpotIndex!68 lt!273466 lt!273468 mask!3053)))))

(assert (=> b!601043 (= lt!273462 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273464 vacantSpotIndex!68 (select (arr!17831 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!601043 (= lt!273466 (select (store (arr!17831 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!273471 () Unit!18990)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37143 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18990)

(assert (=> b!601043 (= lt!273471 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!273464 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!601043 (= lt!273464 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!601044 () Bool)

(declare-fun Unit!18995 () Unit!18990)

(assert (=> b!601044 (= e!343643 Unit!18995)))

(declare-fun lt!273461 () Unit!18990)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37143 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18990)

(assert (=> b!601044 (= lt!273461 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!273468 (select (arr!17831 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!601044 (arrayContainsKey!0 lt!273468 (select (arr!17831 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!273470 () Unit!18990)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37143 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11911) Unit!18990)

(assert (=> b!601044 (= lt!273470 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11908))))

(assert (=> b!601044 (arrayNoDuplicates!0 lt!273468 #b00000000000000000000000000000000 Nil!11908)))

(declare-fun lt!273469 () Unit!18990)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37143 (_ BitVec 32) (_ BitVec 32)) Unit!18990)

(assert (=> b!601044 (= lt!273469 (lemmaNoDuplicateFromThenFromBigger!0 lt!273468 #b00000000000000000000000000000000 j!136))))

(assert (=> b!601044 (arrayNoDuplicates!0 lt!273468 j!136 Nil!11908)))

(declare-fun lt!273465 () Unit!18990)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37143 (_ BitVec 64) (_ BitVec 32) List!11911) Unit!18990)

(assert (=> b!601044 (= lt!273465 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!273468 (select (arr!17831 a!2986) j!136) j!136 Nil!11908))))

(assert (=> b!601044 false))

(declare-fun b!601045 () Bool)

(declare-fun res!385956 () Bool)

(assert (=> b!601045 (=> (not res!385956) (not e!343642))))

(assert (=> b!601045 (= res!385956 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!601037 () Bool)

(assert (=> b!601037 (= e!343633 (arrayContainsKey!0 lt!273468 (select (arr!17831 a!2986) j!136) index!984))))

(declare-fun res!385955 () Bool)

(assert (=> start!54894 (=> (not res!385955) (not e!343642))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54894 (= res!385955 (validMask!0 mask!3053))))

(assert (=> start!54894 e!343642))

(assert (=> start!54894 true))

(declare-fun array_inv!13714 (array!37143) Bool)

(assert (=> start!54894 (array_inv!13714 a!2986)))

(assert (= (and start!54894 res!385955) b!601039))

(assert (= (and b!601039 res!385958) b!601030))

(assert (= (and b!601030 res!385965) b!601033))

(assert (= (and b!601033 res!385960) b!601045))

(assert (= (and b!601045 res!385956) b!601031))

(assert (= (and b!601031 res!385954) b!601032))

(assert (= (and b!601032 res!385957) b!601028))

(assert (= (and b!601028 res!385953) b!601026))

(assert (= (and b!601026 res!385964) b!601042))

(assert (= (and b!601042 res!385963) b!601029))

(assert (= (and b!601029 res!385959) b!601043))

(assert (= (and b!601043 res!385962) b!601041))

(assert (= (and b!601043 c!67904) b!601036))

(assert (= (and b!601043 (not c!67904)) b!601034))

(assert (= (and b!601043 (not res!385967)) b!601027))

(assert (= (and b!601027 res!385952) b!601025))

(assert (= (and b!601025 (not res!385951)) b!601040))

(assert (= (and b!601040 res!385966) b!601037))

(assert (= (and b!601027 (not res!385961)) b!601035))

(assert (= (and b!601035 c!67905) b!601044))

(assert (= (and b!601035 (not c!67905)) b!601038))

(declare-fun m!577717 () Bool)

(assert (=> start!54894 m!577717))

(declare-fun m!577719 () Bool)

(assert (=> start!54894 m!577719))

(declare-fun m!577721 () Bool)

(assert (=> b!601044 m!577721))

(declare-fun m!577723 () Bool)

(assert (=> b!601044 m!577723))

(assert (=> b!601044 m!577723))

(declare-fun m!577725 () Bool)

(assert (=> b!601044 m!577725))

(declare-fun m!577727 () Bool)

(assert (=> b!601044 m!577727))

(declare-fun m!577729 () Bool)

(assert (=> b!601044 m!577729))

(assert (=> b!601044 m!577723))

(declare-fun m!577731 () Bool)

(assert (=> b!601044 m!577731))

(assert (=> b!601044 m!577723))

(declare-fun m!577733 () Bool)

(assert (=> b!601044 m!577733))

(declare-fun m!577735 () Bool)

(assert (=> b!601044 m!577735))

(declare-fun m!577737 () Bool)

(assert (=> b!601031 m!577737))

(declare-fun m!577739 () Bool)

(assert (=> b!601042 m!577739))

(declare-fun m!577741 () Bool)

(assert (=> b!601042 m!577741))

(assert (=> b!601027 m!577723))

(assert (=> b!601027 m!577739))

(declare-fun m!577743 () Bool)

(assert (=> b!601027 m!577743))

(declare-fun m!577745 () Bool)

(assert (=> b!601026 m!577745))

(declare-fun m!577747 () Bool)

(assert (=> b!601033 m!577747))

(assert (=> b!601040 m!577723))

(assert (=> b!601040 m!577723))

(declare-fun m!577749 () Bool)

(assert (=> b!601040 m!577749))

(declare-fun m!577751 () Bool)

(assert (=> b!601032 m!577751))

(assert (=> b!601030 m!577723))

(assert (=> b!601030 m!577723))

(declare-fun m!577753 () Bool)

(assert (=> b!601030 m!577753))

(declare-fun m!577755 () Bool)

(assert (=> b!601029 m!577755))

(assert (=> b!601029 m!577723))

(assert (=> b!601029 m!577723))

(declare-fun m!577757 () Bool)

(assert (=> b!601029 m!577757))

(declare-fun m!577759 () Bool)

(assert (=> b!601045 m!577759))

(assert (=> b!601043 m!577723))

(declare-fun m!577761 () Bool)

(assert (=> b!601043 m!577761))

(declare-fun m!577763 () Bool)

(assert (=> b!601043 m!577763))

(declare-fun m!577765 () Bool)

(assert (=> b!601043 m!577765))

(declare-fun m!577767 () Bool)

(assert (=> b!601043 m!577767))

(declare-fun m!577769 () Bool)

(assert (=> b!601043 m!577769))

(assert (=> b!601043 m!577739))

(assert (=> b!601043 m!577723))

(declare-fun m!577771 () Bool)

(assert (=> b!601043 m!577771))

(declare-fun m!577773 () Bool)

(assert (=> b!601028 m!577773))

(assert (=> b!601037 m!577723))

(assert (=> b!601037 m!577723))

(declare-fun m!577775 () Bool)

(assert (=> b!601037 m!577775))

(assert (=> b!601025 m!577723))

(check-sat (not b!601030) (not b!601029) (not b!601040) (not b!601032) (not start!54894) (not b!601045) (not b!601033) (not b!601037) (not b!601043) (not b!601044) (not b!601031) (not b!601028))
(check-sat)
