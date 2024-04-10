; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55908 () Bool)

(assert start!55908)

(declare-fun b!611917 () Bool)

(declare-fun e!350696 () Bool)

(declare-datatypes ((SeekEntryResult!6375 0))(
  ( (MissingZero!6375 (index!27784 (_ BitVec 32))) (Found!6375 (index!27785 (_ BitVec 32))) (Intermediate!6375 (undefined!7187 Bool) (index!27786 (_ BitVec 32)) (x!56599 (_ BitVec 32))) (Undefined!6375) (MissingVacant!6375 (index!27787 (_ BitVec 32))) )
))
(declare-fun lt!280041 () SeekEntryResult!6375)

(declare-fun lt!280048 () SeekEntryResult!6375)

(assert (=> b!611917 (= e!350696 (= lt!280041 lt!280048))))

(declare-fun b!611918 () Bool)

(declare-fun e!350703 () Bool)

(declare-fun e!350700 () Bool)

(assert (=> b!611918 (= e!350703 (not e!350700))))

(declare-fun res!393582 () Bool)

(assert (=> b!611918 (=> res!393582 e!350700)))

(declare-fun lt!280044 () SeekEntryResult!6375)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!611918 (= res!393582 (not (= lt!280044 (Found!6375 index!984))))))

(declare-datatypes ((Unit!19630 0))(
  ( (Unit!19631) )
))
(declare-fun lt!280037 () Unit!19630)

(declare-fun e!350701 () Unit!19630)

(assert (=> b!611918 (= lt!280037 e!350701)))

(declare-fun c!69538 () Bool)

(assert (=> b!611918 (= c!69538 (= lt!280044 Undefined!6375))))

(declare-fun lt!280046 () (_ BitVec 64))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((array!37378 0))(
  ( (array!37379 (arr!17935 (Array (_ BitVec 32) (_ BitVec 64))) (size!18299 (_ BitVec 32))) )
))
(declare-fun lt!280035 () array!37378)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37378 (_ BitVec 32)) SeekEntryResult!6375)

(assert (=> b!611918 (= lt!280044 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!280046 lt!280035 mask!3053))))

(assert (=> b!611918 e!350696))

(declare-fun res!393589 () Bool)

(assert (=> b!611918 (=> (not res!393589) (not e!350696))))

(declare-fun lt!280032 () (_ BitVec 32))

(assert (=> b!611918 (= res!393589 (= lt!280048 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!280032 vacantSpotIndex!68 lt!280046 lt!280035 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!37378)

(assert (=> b!611918 (= lt!280048 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!280032 vacantSpotIndex!68 (select (arr!17935 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!611918 (= lt!280046 (select (store (arr!17935 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!280040 () Unit!19630)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37378 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19630)

(assert (=> b!611918 (= lt!280040 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!280032 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!611918 (= lt!280032 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!393575 () Bool)

(declare-fun e!350699 () Bool)

(assert (=> start!55908 (=> (not res!393575) (not e!350699))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55908 (= res!393575 (validMask!0 mask!3053))))

(assert (=> start!55908 e!350699))

(assert (=> start!55908 true))

(declare-fun array_inv!13731 (array!37378) Bool)

(assert (=> start!55908 (array_inv!13731 a!2986)))

(declare-fun b!611919 () Bool)

(declare-fun e!350704 () Bool)

(declare-fun e!350709 () Bool)

(assert (=> b!611919 (= e!350704 e!350709)))

(declare-fun res!393580 () Bool)

(assert (=> b!611919 (=> (not res!393580) (not e!350709))))

(assert (=> b!611919 (= res!393580 (= (select (store (arr!17935 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!611919 (= lt!280035 (array!37379 (store (arr!17935 a!2986) i!1108 k0!1786) (size!18299 a!2986)))))

(declare-fun b!611920 () Bool)

(declare-fun res!393591 () Bool)

(assert (=> b!611920 (=> (not res!393591) (not e!350699))))

(declare-fun arrayContainsKey!0 (array!37378 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!611920 (= res!393591 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!611921 () Bool)

(declare-fun e!350705 () Bool)

(assert (=> b!611921 (= e!350705 true)))

(declare-datatypes ((List!11976 0))(
  ( (Nil!11973) (Cons!11972 (h!13017 (_ BitVec 64)) (t!18204 List!11976)) )
))
(declare-fun arrayNoDuplicates!0 (array!37378 (_ BitVec 32) List!11976) Bool)

(assert (=> b!611921 (arrayNoDuplicates!0 lt!280035 #b00000000000000000000000000000000 Nil!11973)))

(declare-fun lt!280042 () Unit!19630)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37378 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11976) Unit!19630)

(assert (=> b!611921 (= lt!280042 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11973))))

(assert (=> b!611921 (arrayContainsKey!0 lt!280035 (select (arr!17935 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!280038 () Unit!19630)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37378 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19630)

(assert (=> b!611921 (= lt!280038 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!280035 (select (arr!17935 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!350707 () Bool)

(assert (=> b!611921 e!350707))

(declare-fun res!393579 () Bool)

(assert (=> b!611921 (=> (not res!393579) (not e!350707))))

(assert (=> b!611921 (= res!393579 (arrayContainsKey!0 lt!280035 (select (arr!17935 a!2986) j!136) j!136))))

(declare-fun b!611922 () Bool)

(declare-fun res!393590 () Bool)

(assert (=> b!611922 (=> (not res!393590) (not e!350699))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!611922 (= res!393590 (validKeyInArray!0 k0!1786))))

(declare-fun b!611923 () Bool)

(declare-fun e!350695 () Bool)

(assert (=> b!611923 (= e!350700 e!350695)))

(declare-fun res!393581 () Bool)

(assert (=> b!611923 (=> res!393581 e!350695)))

(declare-fun lt!280033 () (_ BitVec 64))

(assert (=> b!611923 (= res!393581 (or (not (= (select (arr!17935 a!2986) j!136) lt!280046)) (not (= (select (arr!17935 a!2986) j!136) lt!280033))))))

(declare-fun e!350708 () Bool)

(assert (=> b!611923 e!350708))

(declare-fun res!393588 () Bool)

(assert (=> b!611923 (=> (not res!393588) (not e!350708))))

(assert (=> b!611923 (= res!393588 (= lt!280033 (select (arr!17935 a!2986) j!136)))))

(assert (=> b!611923 (= lt!280033 (select (store (arr!17935 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!611924 () Bool)

(declare-fun res!393577 () Bool)

(assert (=> b!611924 (=> (not res!393577) (not e!350704))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37378 (_ BitVec 32)) Bool)

(assert (=> b!611924 (= res!393577 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!611925 () Bool)

(declare-fun Unit!19632 () Unit!19630)

(assert (=> b!611925 (= e!350701 Unit!19632)))

(declare-fun b!611926 () Bool)

(assert (=> b!611926 (= e!350709 e!350703)))

(declare-fun res!393593 () Bool)

(assert (=> b!611926 (=> (not res!393593) (not e!350703))))

(assert (=> b!611926 (= res!393593 (and (= lt!280041 (Found!6375 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17935 a!2986) index!984) (select (arr!17935 a!2986) j!136))) (not (= (select (arr!17935 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!611926 (= lt!280041 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17935 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!611927 () Bool)

(assert (=> b!611927 (= e!350699 e!350704)))

(declare-fun res!393578 () Bool)

(assert (=> b!611927 (=> (not res!393578) (not e!350704))))

(declare-fun lt!280047 () SeekEntryResult!6375)

(assert (=> b!611927 (= res!393578 (or (= lt!280047 (MissingZero!6375 i!1108)) (= lt!280047 (MissingVacant!6375 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37378 (_ BitVec 32)) SeekEntryResult!6375)

(assert (=> b!611927 (= lt!280047 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!611928 () Bool)

(declare-fun res!393583 () Bool)

(assert (=> b!611928 (=> (not res!393583) (not e!350699))))

(assert (=> b!611928 (= res!393583 (validKeyInArray!0 (select (arr!17935 a!2986) j!136)))))

(declare-fun b!611929 () Bool)

(declare-fun e!350706 () Bool)

(assert (=> b!611929 (= e!350708 e!350706)))

(declare-fun res!393587 () Bool)

(assert (=> b!611929 (=> res!393587 e!350706)))

(assert (=> b!611929 (= res!393587 (or (not (= (select (arr!17935 a!2986) j!136) lt!280046)) (not (= (select (arr!17935 a!2986) j!136) lt!280033)) (bvsge j!136 index!984)))))

(declare-fun b!611930 () Bool)

(declare-fun res!393592 () Bool)

(assert (=> b!611930 (=> (not res!393592) (not e!350699))))

(assert (=> b!611930 (= res!393592 (and (= (size!18299 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18299 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18299 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!611931 () Bool)

(declare-fun e!350702 () Unit!19630)

(declare-fun Unit!19633 () Unit!19630)

(assert (=> b!611931 (= e!350702 Unit!19633)))

(declare-fun b!611932 () Bool)

(declare-fun res!393585 () Bool)

(assert (=> b!611932 (=> (not res!393585) (not e!350704))))

(assert (=> b!611932 (= res!393585 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11973))))

(declare-fun b!611933 () Bool)

(declare-fun res!393584 () Bool)

(assert (=> b!611933 (=> (not res!393584) (not e!350704))))

(assert (=> b!611933 (= res!393584 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17935 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!611934 () Bool)

(assert (=> b!611934 (= e!350707 (arrayContainsKey!0 lt!280035 (select (arr!17935 a!2986) j!136) index!984))))

(declare-fun e!350698 () Bool)

(declare-fun b!611935 () Bool)

(assert (=> b!611935 (= e!350698 (arrayContainsKey!0 lt!280035 (select (arr!17935 a!2986) j!136) index!984))))

(declare-fun b!611936 () Bool)

(assert (=> b!611936 (= e!350706 e!350698)))

(declare-fun res!393576 () Bool)

(assert (=> b!611936 (=> (not res!393576) (not e!350698))))

(assert (=> b!611936 (= res!393576 (arrayContainsKey!0 lt!280035 (select (arr!17935 a!2986) j!136) j!136))))

(declare-fun b!611937 () Bool)

(declare-fun Unit!19634 () Unit!19630)

(assert (=> b!611937 (= e!350702 Unit!19634)))

(declare-fun lt!280034 () Unit!19630)

(assert (=> b!611937 (= lt!280034 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!280035 (select (arr!17935 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!611937 (arrayContainsKey!0 lt!280035 (select (arr!17935 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!280036 () Unit!19630)

(assert (=> b!611937 (= lt!280036 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11973))))

(assert (=> b!611937 (arrayNoDuplicates!0 lt!280035 #b00000000000000000000000000000000 Nil!11973)))

(declare-fun lt!280045 () Unit!19630)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37378 (_ BitVec 32) (_ BitVec 32)) Unit!19630)

(assert (=> b!611937 (= lt!280045 (lemmaNoDuplicateFromThenFromBigger!0 lt!280035 #b00000000000000000000000000000000 j!136))))

(assert (=> b!611937 (arrayNoDuplicates!0 lt!280035 j!136 Nil!11973)))

(declare-fun lt!280039 () Unit!19630)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37378 (_ BitVec 64) (_ BitVec 32) List!11976) Unit!19630)

(assert (=> b!611937 (= lt!280039 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!280035 (select (arr!17935 a!2986) j!136) j!136 Nil!11973))))

(assert (=> b!611937 false))

(declare-fun b!611938 () Bool)

(assert (=> b!611938 (= e!350695 e!350705)))

(declare-fun res!393586 () Bool)

(assert (=> b!611938 (=> res!393586 e!350705)))

(assert (=> b!611938 (= res!393586 (bvsge index!984 j!136))))

(declare-fun lt!280043 () Unit!19630)

(assert (=> b!611938 (= lt!280043 e!350702)))

(declare-fun c!69539 () Bool)

(assert (=> b!611938 (= c!69539 (bvslt j!136 index!984))))

(declare-fun b!611939 () Bool)

(declare-fun Unit!19635 () Unit!19630)

(assert (=> b!611939 (= e!350701 Unit!19635)))

(assert (=> b!611939 false))

(assert (= (and start!55908 res!393575) b!611930))

(assert (= (and b!611930 res!393592) b!611928))

(assert (= (and b!611928 res!393583) b!611922))

(assert (= (and b!611922 res!393590) b!611920))

(assert (= (and b!611920 res!393591) b!611927))

(assert (= (and b!611927 res!393578) b!611924))

(assert (= (and b!611924 res!393577) b!611932))

(assert (= (and b!611932 res!393585) b!611933))

(assert (= (and b!611933 res!393584) b!611919))

(assert (= (and b!611919 res!393580) b!611926))

(assert (= (and b!611926 res!393593) b!611918))

(assert (= (and b!611918 res!393589) b!611917))

(assert (= (and b!611918 c!69538) b!611939))

(assert (= (and b!611918 (not c!69538)) b!611925))

(assert (= (and b!611918 (not res!393582)) b!611923))

(assert (= (and b!611923 res!393588) b!611929))

(assert (= (and b!611929 (not res!393587)) b!611936))

(assert (= (and b!611936 res!393576) b!611935))

(assert (= (and b!611923 (not res!393581)) b!611938))

(assert (= (and b!611938 c!69539) b!611937))

(assert (= (and b!611938 (not c!69539)) b!611931))

(assert (= (and b!611938 (not res!393586)) b!611921))

(assert (= (and b!611921 res!393579) b!611934))

(declare-fun m!588303 () Bool)

(assert (=> b!611926 m!588303))

(declare-fun m!588305 () Bool)

(assert (=> b!611926 m!588305))

(assert (=> b!611926 m!588305))

(declare-fun m!588307 () Bool)

(assert (=> b!611926 m!588307))

(declare-fun m!588309 () Bool)

(assert (=> b!611922 m!588309))

(assert (=> b!611929 m!588305))

(declare-fun m!588311 () Bool)

(assert (=> b!611924 m!588311))

(assert (=> b!611934 m!588305))

(assert (=> b!611934 m!588305))

(declare-fun m!588313 () Bool)

(assert (=> b!611934 m!588313))

(assert (=> b!611935 m!588305))

(assert (=> b!611935 m!588305))

(assert (=> b!611935 m!588313))

(declare-fun m!588315 () Bool)

(assert (=> b!611920 m!588315))

(assert (=> b!611936 m!588305))

(assert (=> b!611936 m!588305))

(declare-fun m!588317 () Bool)

(assert (=> b!611936 m!588317))

(assert (=> b!611923 m!588305))

(declare-fun m!588319 () Bool)

(assert (=> b!611923 m!588319))

(declare-fun m!588321 () Bool)

(assert (=> b!611923 m!588321))

(declare-fun m!588323 () Bool)

(assert (=> b!611932 m!588323))

(declare-fun m!588325 () Bool)

(assert (=> start!55908 m!588325))

(declare-fun m!588327 () Bool)

(assert (=> start!55908 m!588327))

(declare-fun m!588329 () Bool)

(assert (=> b!611918 m!588329))

(declare-fun m!588331 () Bool)

(assert (=> b!611918 m!588331))

(assert (=> b!611918 m!588305))

(declare-fun m!588333 () Bool)

(assert (=> b!611918 m!588333))

(assert (=> b!611918 m!588305))

(assert (=> b!611918 m!588319))

(declare-fun m!588335 () Bool)

(assert (=> b!611918 m!588335))

(declare-fun m!588337 () Bool)

(assert (=> b!611918 m!588337))

(declare-fun m!588339 () Bool)

(assert (=> b!611918 m!588339))

(assert (=> b!611919 m!588319))

(declare-fun m!588341 () Bool)

(assert (=> b!611919 m!588341))

(declare-fun m!588343 () Bool)

(assert (=> b!611933 m!588343))

(assert (=> b!611928 m!588305))

(assert (=> b!611928 m!588305))

(declare-fun m!588345 () Bool)

(assert (=> b!611928 m!588345))

(declare-fun m!588347 () Bool)

(assert (=> b!611927 m!588347))

(assert (=> b!611921 m!588305))

(assert (=> b!611921 m!588305))

(assert (=> b!611921 m!588317))

(assert (=> b!611921 m!588305))

(declare-fun m!588349 () Bool)

(assert (=> b!611921 m!588349))

(declare-fun m!588351 () Bool)

(assert (=> b!611921 m!588351))

(assert (=> b!611921 m!588305))

(declare-fun m!588353 () Bool)

(assert (=> b!611921 m!588353))

(declare-fun m!588355 () Bool)

(assert (=> b!611921 m!588355))

(assert (=> b!611937 m!588305))

(assert (=> b!611937 m!588305))

(declare-fun m!588357 () Bool)

(assert (=> b!611937 m!588357))

(declare-fun m!588359 () Bool)

(assert (=> b!611937 m!588359))

(assert (=> b!611937 m!588351))

(assert (=> b!611937 m!588305))

(declare-fun m!588361 () Bool)

(assert (=> b!611937 m!588361))

(declare-fun m!588363 () Bool)

(assert (=> b!611937 m!588363))

(assert (=> b!611937 m!588305))

(declare-fun m!588365 () Bool)

(assert (=> b!611937 m!588365))

(assert (=> b!611937 m!588355))

(check-sat (not b!611918) (not b!611922) (not b!611924) (not start!55908) (not b!611934) (not b!611935) (not b!611932) (not b!611928) (not b!611920) (not b!611921) (not b!611936) (not b!611927) (not b!611937) (not b!611926))
(check-sat)
