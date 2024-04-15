; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59330 () Bool)

(assert start!59330)

(declare-fun b!654589 () Bool)

(declare-datatypes ((Unit!22442 0))(
  ( (Unit!22443) )
))
(declare-fun e!375898 () Unit!22442)

(declare-fun Unit!22444 () Unit!22442)

(assert (=> b!654589 (= e!375898 Unit!22444)))

(declare-fun b!654590 () Bool)

(declare-fun e!375895 () Bool)

(declare-datatypes ((SeekEntryResult!6967 0))(
  ( (MissingZero!6967 (index!30227 (_ BitVec 32))) (Found!6967 (index!30228 (_ BitVec 32))) (Intermediate!6967 (undefined!7779 Bool) (index!30229 (_ BitVec 32)) (x!59027 (_ BitVec 32))) (Undefined!6967) (MissingVacant!6967 (index!30230 (_ BitVec 32))) )
))
(declare-fun lt!304973 () SeekEntryResult!6967)

(declare-fun lt!304981 () SeekEntryResult!6967)

(assert (=> b!654590 (= e!375895 (= lt!304973 lt!304981))))

(declare-fun b!654591 () Bool)

(declare-fun res!424672 () Bool)

(declare-fun e!375899 () Bool)

(assert (=> b!654591 (=> (not res!424672) (not e!375899))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!38661 0))(
  ( (array!38662 (arr!18530 (Array (_ BitVec 32) (_ BitVec 64))) (size!18895 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38661)

(assert (=> b!654591 (= res!424672 (and (= (size!18895 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18895 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18895 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!654592 () Bool)

(declare-fun res!424675 () Bool)

(declare-fun e!375905 () Bool)

(assert (=> b!654592 (=> (not res!424675) (not e!375905))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38661 (_ BitVec 32)) Bool)

(assert (=> b!654592 (= res!424675 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!654593 () Bool)

(assert (=> b!654593 false))

(declare-fun lt!304980 () Unit!22442)

(declare-fun lt!304975 () array!38661)

(declare-datatypes ((List!12610 0))(
  ( (Nil!12607) (Cons!12606 (h!13651 (_ BitVec 64)) (t!18829 List!12610)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38661 (_ BitVec 64) (_ BitVec 32) List!12610) Unit!22442)

(assert (=> b!654593 (= lt!304980 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!304975 (select (arr!18530 a!2986) j!136) j!136 Nil!12607))))

(declare-fun arrayNoDuplicates!0 (array!38661 (_ BitVec 32) List!12610) Bool)

(assert (=> b!654593 (arrayNoDuplicates!0 lt!304975 j!136 Nil!12607)))

(declare-fun lt!304967 () Unit!22442)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38661 (_ BitVec 32) (_ BitVec 32)) Unit!22442)

(assert (=> b!654593 (= lt!304967 (lemmaNoDuplicateFromThenFromBigger!0 lt!304975 #b00000000000000000000000000000000 j!136))))

(assert (=> b!654593 (arrayNoDuplicates!0 lt!304975 #b00000000000000000000000000000000 Nil!12607)))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!304968 () Unit!22442)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38661 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12610) Unit!22442)

(assert (=> b!654593 (= lt!304968 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12607))))

(declare-fun arrayContainsKey!0 (array!38661 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!654593 (arrayContainsKey!0 lt!304975 (select (arr!18530 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!304979 () Unit!22442)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38661 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22442)

(assert (=> b!654593 (= lt!304979 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!304975 (select (arr!18530 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!375906 () Unit!22442)

(declare-fun Unit!22445 () Unit!22442)

(assert (=> b!654593 (= e!375906 Unit!22445)))

(declare-fun b!654594 () Bool)

(declare-fun res!424680 () Bool)

(assert (=> b!654594 (=> (not res!424680) (not e!375899))))

(assert (=> b!654594 (= res!424680 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!654595 () Bool)

(declare-fun e!375896 () Bool)

(assert (=> b!654595 (= e!375905 e!375896)))

(declare-fun res!424674 () Bool)

(assert (=> b!654595 (=> (not res!424674) (not e!375896))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!654595 (= res!424674 (= (select (store (arr!18530 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!654595 (= lt!304975 (array!38662 (store (arr!18530 a!2986) i!1108 k0!1786) (size!18895 a!2986)))))

(declare-fun b!654596 () Bool)

(declare-fun e!375903 () Unit!22442)

(declare-fun Unit!22446 () Unit!22442)

(assert (=> b!654596 (= e!375903 Unit!22446)))

(declare-fun b!654597 () Bool)

(declare-fun res!424681 () Bool)

(assert (=> b!654597 (=> (not res!424681) (not e!375905))))

(assert (=> b!654597 (= res!424681 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12607))))

(declare-fun b!654598 () Bool)

(declare-fun res!424684 () Bool)

(assert (=> b!654598 (=> (not res!424684) (not e!375899))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!654598 (= res!424684 (validKeyInArray!0 k0!1786))))

(declare-fun b!654599 () Bool)

(declare-fun e!375904 () Bool)

(assert (=> b!654599 (= e!375896 e!375904)))

(declare-fun res!424682 () Bool)

(assert (=> b!654599 (=> (not res!424682) (not e!375904))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!654599 (= res!424682 (and (= lt!304973 (Found!6967 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18530 a!2986) index!984) (select (arr!18530 a!2986) j!136))) (not (= (select (arr!18530 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38661 (_ BitVec 32)) SeekEntryResult!6967)

(assert (=> b!654599 (= lt!304973 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18530 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!654600 () Bool)

(declare-fun e!375901 () Bool)

(assert (=> b!654600 (= e!375901 (arrayContainsKey!0 lt!304975 (select (arr!18530 a!2986) j!136) index!984))))

(declare-fun b!654602 () Bool)

(declare-fun Unit!22447 () Unit!22442)

(assert (=> b!654602 (= e!375906 Unit!22447)))

(declare-fun b!654603 () Bool)

(declare-fun res!424683 () Bool)

(assert (=> b!654603 (= res!424683 (bvsge j!136 index!984))))

(declare-fun e!375897 () Bool)

(assert (=> b!654603 (=> res!424683 e!375897)))

(declare-fun e!375902 () Bool)

(assert (=> b!654603 (= e!375902 e!375897)))

(declare-fun b!654604 () Bool)

(assert (=> b!654604 false))

(declare-fun lt!304971 () Unit!22442)

(assert (=> b!654604 (= lt!304971 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!304975 (select (arr!18530 a!2986) j!136) index!984 Nil!12607))))

(assert (=> b!654604 (arrayNoDuplicates!0 lt!304975 index!984 Nil!12607)))

(declare-fun lt!304974 () Unit!22442)

(assert (=> b!654604 (= lt!304974 (lemmaNoDuplicateFromThenFromBigger!0 lt!304975 #b00000000000000000000000000000000 index!984))))

(assert (=> b!654604 (arrayNoDuplicates!0 lt!304975 #b00000000000000000000000000000000 Nil!12607)))

(declare-fun lt!304985 () Unit!22442)

(assert (=> b!654604 (= lt!304985 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12607))))

(assert (=> b!654604 (arrayContainsKey!0 lt!304975 (select (arr!18530 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!304972 () Unit!22442)

(assert (=> b!654604 (= lt!304972 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!304975 (select (arr!18530 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!654604 e!375901))

(declare-fun res!424676 () Bool)

(assert (=> b!654604 (=> (not res!424676) (not e!375901))))

(assert (=> b!654604 (= res!424676 (arrayContainsKey!0 lt!304975 (select (arr!18530 a!2986) j!136) j!136))))

(declare-fun Unit!22448 () Unit!22442)

(assert (=> b!654604 (= e!375903 Unit!22448)))

(declare-fun b!654605 () Bool)

(declare-fun e!375900 () Unit!22442)

(declare-fun Unit!22449 () Unit!22442)

(assert (=> b!654605 (= e!375900 Unit!22449)))

(assert (=> b!654605 false))

(declare-fun b!654606 () Bool)

(declare-fun e!375907 () Bool)

(assert (=> b!654606 (= e!375907 (arrayContainsKey!0 lt!304975 (select (arr!18530 a!2986) j!136) index!984))))

(declare-fun b!654607 () Bool)

(declare-fun Unit!22450 () Unit!22442)

(assert (=> b!654607 (= e!375900 Unit!22450)))

(declare-fun b!654608 () Bool)

(declare-fun res!424677 () Bool)

(assert (=> b!654608 (= res!424677 (arrayContainsKey!0 lt!304975 (select (arr!18530 a!2986) j!136) j!136))))

(assert (=> b!654608 (=> (not res!424677) (not e!375907))))

(assert (=> b!654608 (= e!375897 e!375907)))

(declare-fun b!654609 () Bool)

(declare-fun res!424669 () Bool)

(assert (=> b!654609 (=> (not res!424669) (not e!375905))))

(assert (=> b!654609 (= res!424669 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18530 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!654610 () Bool)

(assert (=> b!654610 (= e!375904 (not true))))

(declare-fun lt!304978 () Unit!22442)

(assert (=> b!654610 (= lt!304978 e!375898)))

(declare-fun c!75327 () Bool)

(declare-fun lt!304970 () SeekEntryResult!6967)

(assert (=> b!654610 (= c!75327 (= lt!304970 (Found!6967 index!984)))))

(declare-fun lt!304977 () Unit!22442)

(assert (=> b!654610 (= lt!304977 e!375900)))

(declare-fun c!75328 () Bool)

(assert (=> b!654610 (= c!75328 (= lt!304970 Undefined!6967))))

(declare-fun lt!304986 () (_ BitVec 64))

(assert (=> b!654610 (= lt!304970 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!304986 lt!304975 mask!3053))))

(assert (=> b!654610 e!375895))

(declare-fun res!424670 () Bool)

(assert (=> b!654610 (=> (not res!424670) (not e!375895))))

(declare-fun lt!304982 () (_ BitVec 32))

(assert (=> b!654610 (= res!424670 (= lt!304981 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!304982 vacantSpotIndex!68 lt!304986 lt!304975 mask!3053)))))

(assert (=> b!654610 (= lt!304981 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!304982 vacantSpotIndex!68 (select (arr!18530 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!654610 (= lt!304986 (select (store (arr!18530 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!304983 () Unit!22442)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38661 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22442)

(assert (=> b!654610 (= lt!304983 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!304982 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!654610 (= lt!304982 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!424671 () Bool)

(assert (=> start!59330 (=> (not res!424671) (not e!375899))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59330 (= res!424671 (validMask!0 mask!3053))))

(assert (=> start!59330 e!375899))

(assert (=> start!59330 true))

(declare-fun array_inv!14413 (array!38661) Bool)

(assert (=> start!59330 (array_inv!14413 a!2986)))

(declare-fun b!654601 () Bool)

(declare-fun Unit!22451 () Unit!22442)

(assert (=> b!654601 (= e!375898 Unit!22451)))

(declare-fun res!424679 () Bool)

(assert (=> b!654601 (= res!424679 (= (select (store (arr!18530 a!2986) i!1108 k0!1786) index!984) (select (arr!18530 a!2986) j!136)))))

(assert (=> b!654601 (=> (not res!424679) (not e!375902))))

(assert (=> b!654601 e!375902))

(declare-fun c!75329 () Bool)

(assert (=> b!654601 (= c!75329 (bvslt j!136 index!984))))

(declare-fun lt!304976 () Unit!22442)

(assert (=> b!654601 (= lt!304976 e!375906)))

(declare-fun c!75330 () Bool)

(assert (=> b!654601 (= c!75330 (bvslt index!984 j!136))))

(declare-fun lt!304984 () Unit!22442)

(assert (=> b!654601 (= lt!304984 e!375903)))

(assert (=> b!654601 false))

(declare-fun b!654611 () Bool)

(declare-fun res!424673 () Bool)

(assert (=> b!654611 (=> (not res!424673) (not e!375899))))

(assert (=> b!654611 (= res!424673 (validKeyInArray!0 (select (arr!18530 a!2986) j!136)))))

(declare-fun b!654612 () Bool)

(assert (=> b!654612 (= e!375899 e!375905)))

(declare-fun res!424678 () Bool)

(assert (=> b!654612 (=> (not res!424678) (not e!375905))))

(declare-fun lt!304969 () SeekEntryResult!6967)

(assert (=> b!654612 (= res!424678 (or (= lt!304969 (MissingZero!6967 i!1108)) (= lt!304969 (MissingVacant!6967 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38661 (_ BitVec 32)) SeekEntryResult!6967)

(assert (=> b!654612 (= lt!304969 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!59330 res!424671) b!654591))

(assert (= (and b!654591 res!424672) b!654611))

(assert (= (and b!654611 res!424673) b!654598))

(assert (= (and b!654598 res!424684) b!654594))

(assert (= (and b!654594 res!424680) b!654612))

(assert (= (and b!654612 res!424678) b!654592))

(assert (= (and b!654592 res!424675) b!654597))

(assert (= (and b!654597 res!424681) b!654609))

(assert (= (and b!654609 res!424669) b!654595))

(assert (= (and b!654595 res!424674) b!654599))

(assert (= (and b!654599 res!424682) b!654610))

(assert (= (and b!654610 res!424670) b!654590))

(assert (= (and b!654610 c!75328) b!654605))

(assert (= (and b!654610 (not c!75328)) b!654607))

(assert (= (and b!654610 c!75327) b!654601))

(assert (= (and b!654610 (not c!75327)) b!654589))

(assert (= (and b!654601 res!424679) b!654603))

(assert (= (and b!654603 (not res!424683)) b!654608))

(assert (= (and b!654608 res!424677) b!654606))

(assert (= (and b!654601 c!75329) b!654593))

(assert (= (and b!654601 (not c!75329)) b!654602))

(assert (= (and b!654601 c!75330) b!654604))

(assert (= (and b!654601 (not c!75330)) b!654596))

(assert (= (and b!654604 res!424676) b!654600))

(declare-fun m!627195 () Bool)

(assert (=> b!654612 m!627195))

(declare-fun m!627197 () Bool)

(assert (=> b!654611 m!627197))

(assert (=> b!654611 m!627197))

(declare-fun m!627199 () Bool)

(assert (=> b!654611 m!627199))

(assert (=> b!654608 m!627197))

(assert (=> b!654608 m!627197))

(declare-fun m!627201 () Bool)

(assert (=> b!654608 m!627201))

(declare-fun m!627203 () Bool)

(assert (=> start!59330 m!627203))

(declare-fun m!627205 () Bool)

(assert (=> start!59330 m!627205))

(assert (=> b!654604 m!627197))

(declare-fun m!627207 () Bool)

(assert (=> b!654604 m!627207))

(declare-fun m!627209 () Bool)

(assert (=> b!654604 m!627209))

(assert (=> b!654604 m!627197))

(declare-fun m!627211 () Bool)

(assert (=> b!654604 m!627211))

(assert (=> b!654604 m!627197))

(declare-fun m!627213 () Bool)

(assert (=> b!654604 m!627213))

(assert (=> b!654604 m!627197))

(declare-fun m!627215 () Bool)

(assert (=> b!654604 m!627215))

(assert (=> b!654604 m!627197))

(assert (=> b!654604 m!627201))

(declare-fun m!627217 () Bool)

(assert (=> b!654604 m!627217))

(declare-fun m!627219 () Bool)

(assert (=> b!654604 m!627219))

(declare-fun m!627221 () Bool)

(assert (=> b!654599 m!627221))

(assert (=> b!654599 m!627197))

(assert (=> b!654599 m!627197))

(declare-fun m!627223 () Bool)

(assert (=> b!654599 m!627223))

(declare-fun m!627225 () Bool)

(assert (=> b!654598 m!627225))

(declare-fun m!627227 () Bool)

(assert (=> b!654597 m!627227))

(declare-fun m!627229 () Bool)

(assert (=> b!654592 m!627229))

(assert (=> b!654606 m!627197))

(assert (=> b!654606 m!627197))

(declare-fun m!627231 () Bool)

(assert (=> b!654606 m!627231))

(declare-fun m!627233 () Bool)

(assert (=> b!654595 m!627233))

(declare-fun m!627235 () Bool)

(assert (=> b!654595 m!627235))

(assert (=> b!654601 m!627233))

(declare-fun m!627237 () Bool)

(assert (=> b!654601 m!627237))

(assert (=> b!654601 m!627197))

(declare-fun m!627239 () Bool)

(assert (=> b!654609 m!627239))

(declare-fun m!627241 () Bool)

(assert (=> b!654594 m!627241))

(declare-fun m!627243 () Bool)

(assert (=> b!654610 m!627243))

(declare-fun m!627245 () Bool)

(assert (=> b!654610 m!627245))

(declare-fun m!627247 () Bool)

(assert (=> b!654610 m!627247))

(declare-fun m!627249 () Bool)

(assert (=> b!654610 m!627249))

(assert (=> b!654610 m!627197))

(assert (=> b!654610 m!627233))

(assert (=> b!654610 m!627197))

(declare-fun m!627251 () Bool)

(assert (=> b!654610 m!627251))

(declare-fun m!627253 () Bool)

(assert (=> b!654610 m!627253))

(assert (=> b!654600 m!627197))

(assert (=> b!654600 m!627197))

(assert (=> b!654600 m!627231))

(declare-fun m!627255 () Bool)

(assert (=> b!654593 m!627255))

(assert (=> b!654593 m!627197))

(assert (=> b!654593 m!627197))

(declare-fun m!627257 () Bool)

(assert (=> b!654593 m!627257))

(assert (=> b!654593 m!627197))

(declare-fun m!627259 () Bool)

(assert (=> b!654593 m!627259))

(declare-fun m!627261 () Bool)

(assert (=> b!654593 m!627261))

(assert (=> b!654593 m!627197))

(declare-fun m!627263 () Bool)

(assert (=> b!654593 m!627263))

(assert (=> b!654593 m!627217))

(assert (=> b!654593 m!627219))

(check-sat (not start!59330) (not b!654606) (not b!654599) (not b!654597) (not b!654598) (not b!654592) (not b!654611) (not b!654608) (not b!654604) (not b!654594) (not b!654593) (not b!654600) (not b!654612) (not b!654610))
(check-sat)
