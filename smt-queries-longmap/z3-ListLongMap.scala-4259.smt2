; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59096 () Bool)

(assert start!59096)

(declare-fun b!652067 () Bool)

(declare-fun e!374240 () Bool)

(declare-fun e!374246 () Bool)

(assert (=> b!652067 (= e!374240 (not e!374246))))

(declare-fun res!422927 () Bool)

(assert (=> b!652067 (=> res!422927 e!374246)))

(declare-datatypes ((SeekEntryResult!6943 0))(
  ( (MissingZero!6943 (index!30125 (_ BitVec 32))) (Found!6943 (index!30126 (_ BitVec 32))) (Intermediate!6943 (undefined!7755 Bool) (index!30127 (_ BitVec 32)) (x!58921 (_ BitVec 32))) (Undefined!6943) (MissingVacant!6943 (index!30128 (_ BitVec 32))) )
))
(declare-fun lt!303294 () SeekEntryResult!6943)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!652067 (= res!422927 (not (= lt!303294 (Found!6943 index!984))))))

(declare-datatypes ((Unit!22286 0))(
  ( (Unit!22287) )
))
(declare-fun lt!303309 () Unit!22286)

(declare-fun e!374237 () Unit!22286)

(assert (=> b!652067 (= lt!303309 e!374237)))

(declare-fun c!74945 () Bool)

(assert (=> b!652067 (= c!74945 (= lt!303294 Undefined!6943))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((array!38607 0))(
  ( (array!38608 (arr!18506 (Array (_ BitVec 32) (_ BitVec 64))) (size!18871 (_ BitVec 32))) )
))
(declare-fun lt!303295 () array!38607)

(declare-fun lt!303302 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38607 (_ BitVec 32)) SeekEntryResult!6943)

(assert (=> b!652067 (= lt!303294 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!303302 lt!303295 mask!3053))))

(declare-fun e!374242 () Bool)

(assert (=> b!652067 e!374242))

(declare-fun res!422920 () Bool)

(assert (=> b!652067 (=> (not res!422920) (not e!374242))))

(declare-fun lt!303305 () SeekEntryResult!6943)

(declare-fun lt!303296 () (_ BitVec 32))

(assert (=> b!652067 (= res!422920 (= lt!303305 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303296 vacantSpotIndex!68 lt!303302 lt!303295 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!38607)

(assert (=> b!652067 (= lt!303305 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303296 vacantSpotIndex!68 (select (arr!18506 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!652067 (= lt!303302 (select (store (arr!18506 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!303301 () Unit!22286)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38607 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22286)

(assert (=> b!652067 (= lt!303301 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!303296 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!652067 (= lt!303296 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!652068 () Bool)

(declare-fun res!422911 () Bool)

(declare-fun e!374241 () Bool)

(assert (=> b!652068 (=> (not res!422911) (not e!374241))))

(declare-fun arrayContainsKey!0 (array!38607 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!652068 (= res!422911 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!652070 () Bool)

(declare-fun lt!303298 () SeekEntryResult!6943)

(assert (=> b!652070 (= e!374242 (= lt!303298 lt!303305))))

(declare-fun b!652071 () Bool)

(declare-fun res!422929 () Bool)

(assert (=> b!652071 (=> (not res!422929) (not e!374241))))

(assert (=> b!652071 (= res!422929 (and (= (size!18871 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18871 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18871 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!652072 () Bool)

(declare-fun e!374245 () Bool)

(assert (=> b!652072 (= e!374245 (or (bvsge (size!18871 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 index!984) (size!18871 a!2986)) (bvslt index!984 (size!18871 a!2986))))))

(declare-datatypes ((List!12586 0))(
  ( (Nil!12583) (Cons!12582 (h!13627 (_ BitVec 64)) (t!18805 List!12586)) )
))
(declare-fun arrayNoDuplicates!0 (array!38607 (_ BitVec 32) List!12586) Bool)

(assert (=> b!652072 (arrayNoDuplicates!0 lt!303295 index!984 Nil!12583)))

(declare-fun lt!303292 () Unit!22286)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38607 (_ BitVec 32) (_ BitVec 32)) Unit!22286)

(assert (=> b!652072 (= lt!303292 (lemmaNoDuplicateFromThenFromBigger!0 lt!303295 #b00000000000000000000000000000000 index!984))))

(assert (=> b!652072 (arrayNoDuplicates!0 lt!303295 #b00000000000000000000000000000000 Nil!12583)))

(declare-fun lt!303304 () Unit!22286)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38607 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12586) Unit!22286)

(assert (=> b!652072 (= lt!303304 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12583))))

(assert (=> b!652072 (arrayContainsKey!0 lt!303295 (select (arr!18506 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!303299 () Unit!22286)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38607 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22286)

(assert (=> b!652072 (= lt!303299 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!303295 (select (arr!18506 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!374244 () Bool)

(assert (=> b!652072 e!374244))

(declare-fun res!422918 () Bool)

(assert (=> b!652072 (=> (not res!422918) (not e!374244))))

(assert (=> b!652072 (= res!422918 (arrayContainsKey!0 lt!303295 (select (arr!18506 a!2986) j!136) j!136))))

(declare-fun b!652073 () Bool)

(declare-fun Unit!22288 () Unit!22286)

(assert (=> b!652073 (= e!374237 Unit!22288)))

(assert (=> b!652073 false))

(declare-fun b!652074 () Bool)

(declare-fun e!374238 () Bool)

(declare-fun e!374232 () Bool)

(assert (=> b!652074 (= e!374238 e!374232)))

(declare-fun res!422915 () Bool)

(assert (=> b!652074 (=> (not res!422915) (not e!374232))))

(assert (=> b!652074 (= res!422915 (arrayContainsKey!0 lt!303295 (select (arr!18506 a!2986) j!136) j!136))))

(declare-fun b!652075 () Bool)

(declare-fun res!422921 () Bool)

(declare-fun e!374236 () Bool)

(assert (=> b!652075 (=> (not res!422921) (not e!374236))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38607 (_ BitVec 32)) Bool)

(assert (=> b!652075 (= res!422921 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!652076 () Bool)

(assert (=> b!652076 (= e!374232 (arrayContainsKey!0 lt!303295 (select (arr!18506 a!2986) j!136) index!984))))

(declare-fun b!652077 () Bool)

(declare-fun e!374234 () Unit!22286)

(declare-fun Unit!22289 () Unit!22286)

(assert (=> b!652077 (= e!374234 Unit!22289)))

(declare-fun b!652078 () Bool)

(declare-fun e!374239 () Bool)

(assert (=> b!652078 (= e!374239 e!374245)))

(declare-fun res!422925 () Bool)

(assert (=> b!652078 (=> res!422925 e!374245)))

(assert (=> b!652078 (= res!422925 (bvsge index!984 j!136))))

(declare-fun lt!303306 () Unit!22286)

(assert (=> b!652078 (= lt!303306 e!374234)))

(declare-fun c!74946 () Bool)

(assert (=> b!652078 (= c!74946 (bvslt j!136 index!984))))

(declare-fun b!652079 () Bool)

(declare-fun res!422922 () Bool)

(assert (=> b!652079 (=> (not res!422922) (not e!374236))))

(assert (=> b!652079 (= res!422922 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18506 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!422912 () Bool)

(assert (=> start!59096 (=> (not res!422912) (not e!374241))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59096 (= res!422912 (validMask!0 mask!3053))))

(assert (=> start!59096 e!374241))

(assert (=> start!59096 true))

(declare-fun array_inv!14389 (array!38607) Bool)

(assert (=> start!59096 (array_inv!14389 a!2986)))

(declare-fun b!652069 () Bool)

(declare-fun e!374235 () Bool)

(assert (=> b!652069 (= e!374235 e!374238)))

(declare-fun res!422913 () Bool)

(assert (=> b!652069 (=> res!422913 e!374238)))

(declare-fun lt!303308 () (_ BitVec 64))

(assert (=> b!652069 (= res!422913 (or (not (= (select (arr!18506 a!2986) j!136) lt!303302)) (not (= (select (arr!18506 a!2986) j!136) lt!303308)) (bvsge j!136 index!984)))))

(declare-fun b!652080 () Bool)

(declare-fun res!422917 () Bool)

(assert (=> b!652080 (=> (not res!422917) (not e!374241))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!652080 (= res!422917 (validKeyInArray!0 (select (arr!18506 a!2986) j!136)))))

(declare-fun b!652081 () Bool)

(declare-fun Unit!22290 () Unit!22286)

(assert (=> b!652081 (= e!374237 Unit!22290)))

(declare-fun b!652082 () Bool)

(declare-fun e!374243 () Bool)

(assert (=> b!652082 (= e!374243 e!374240)))

(declare-fun res!422916 () Bool)

(assert (=> b!652082 (=> (not res!422916) (not e!374240))))

(assert (=> b!652082 (= res!422916 (and (= lt!303298 (Found!6943 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18506 a!2986) index!984) (select (arr!18506 a!2986) j!136))) (not (= (select (arr!18506 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!652082 (= lt!303298 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18506 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!652083 () Bool)

(declare-fun res!422924 () Bool)

(assert (=> b!652083 (=> (not res!422924) (not e!374241))))

(assert (=> b!652083 (= res!422924 (validKeyInArray!0 k0!1786))))

(declare-fun b!652084 () Bool)

(assert (=> b!652084 (= e!374241 e!374236)))

(declare-fun res!422923 () Bool)

(assert (=> b!652084 (=> (not res!422923) (not e!374236))))

(declare-fun lt!303307 () SeekEntryResult!6943)

(assert (=> b!652084 (= res!422923 (or (= lt!303307 (MissingZero!6943 i!1108)) (= lt!303307 (MissingVacant!6943 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38607 (_ BitVec 32)) SeekEntryResult!6943)

(assert (=> b!652084 (= lt!303307 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!652085 () Bool)

(declare-fun res!422926 () Bool)

(assert (=> b!652085 (=> (not res!422926) (not e!374236))))

(assert (=> b!652085 (= res!422926 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12583))))

(declare-fun b!652086 () Bool)

(assert (=> b!652086 (= e!374244 (arrayContainsKey!0 lt!303295 (select (arr!18506 a!2986) j!136) index!984))))

(declare-fun b!652087 () Bool)

(declare-fun Unit!22291 () Unit!22286)

(assert (=> b!652087 (= e!374234 Unit!22291)))

(declare-fun lt!303297 () Unit!22286)

(assert (=> b!652087 (= lt!303297 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!303295 (select (arr!18506 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!652087 (arrayContainsKey!0 lt!303295 (select (arr!18506 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!303303 () Unit!22286)

(assert (=> b!652087 (= lt!303303 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12583))))

(assert (=> b!652087 (arrayNoDuplicates!0 lt!303295 #b00000000000000000000000000000000 Nil!12583)))

(declare-fun lt!303293 () Unit!22286)

(assert (=> b!652087 (= lt!303293 (lemmaNoDuplicateFromThenFromBigger!0 lt!303295 #b00000000000000000000000000000000 j!136))))

(assert (=> b!652087 (arrayNoDuplicates!0 lt!303295 j!136 Nil!12583)))

(declare-fun lt!303300 () Unit!22286)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38607 (_ BitVec 64) (_ BitVec 32) List!12586) Unit!22286)

(assert (=> b!652087 (= lt!303300 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!303295 (select (arr!18506 a!2986) j!136) j!136 Nil!12583))))

(assert (=> b!652087 false))

(declare-fun b!652088 () Bool)

(assert (=> b!652088 (= e!374236 e!374243)))

(declare-fun res!422919 () Bool)

(assert (=> b!652088 (=> (not res!422919) (not e!374243))))

(assert (=> b!652088 (= res!422919 (= (select (store (arr!18506 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!652088 (= lt!303295 (array!38608 (store (arr!18506 a!2986) i!1108 k0!1786) (size!18871 a!2986)))))

(declare-fun b!652089 () Bool)

(assert (=> b!652089 (= e!374246 e!374239)))

(declare-fun res!422914 () Bool)

(assert (=> b!652089 (=> res!422914 e!374239)))

(assert (=> b!652089 (= res!422914 (or (not (= (select (arr!18506 a!2986) j!136) lt!303302)) (not (= (select (arr!18506 a!2986) j!136) lt!303308))))))

(assert (=> b!652089 e!374235))

(declare-fun res!422928 () Bool)

(assert (=> b!652089 (=> (not res!422928) (not e!374235))))

(assert (=> b!652089 (= res!422928 (= lt!303308 (select (arr!18506 a!2986) j!136)))))

(assert (=> b!652089 (= lt!303308 (select (store (arr!18506 a!2986) i!1108 k0!1786) index!984))))

(assert (= (and start!59096 res!422912) b!652071))

(assert (= (and b!652071 res!422929) b!652080))

(assert (= (and b!652080 res!422917) b!652083))

(assert (= (and b!652083 res!422924) b!652068))

(assert (= (and b!652068 res!422911) b!652084))

(assert (= (and b!652084 res!422923) b!652075))

(assert (= (and b!652075 res!422921) b!652085))

(assert (= (and b!652085 res!422926) b!652079))

(assert (= (and b!652079 res!422922) b!652088))

(assert (= (and b!652088 res!422919) b!652082))

(assert (= (and b!652082 res!422916) b!652067))

(assert (= (and b!652067 res!422920) b!652070))

(assert (= (and b!652067 c!74945) b!652073))

(assert (= (and b!652067 (not c!74945)) b!652081))

(assert (= (and b!652067 (not res!422927)) b!652089))

(assert (= (and b!652089 res!422928) b!652069))

(assert (= (and b!652069 (not res!422913)) b!652074))

(assert (= (and b!652074 res!422915) b!652076))

(assert (= (and b!652089 (not res!422914)) b!652078))

(assert (= (and b!652078 c!74946) b!652087))

(assert (= (and b!652078 (not c!74946)) b!652077))

(assert (= (and b!652078 (not res!422925)) b!652072))

(assert (= (and b!652072 res!422918) b!652086))

(declare-fun m!624723 () Bool)

(assert (=> b!652089 m!624723))

(declare-fun m!624725 () Bool)

(assert (=> b!652089 m!624725))

(declare-fun m!624727 () Bool)

(assert (=> b!652089 m!624727))

(assert (=> b!652069 m!624723))

(declare-fun m!624729 () Bool)

(assert (=> b!652084 m!624729))

(assert (=> b!652080 m!624723))

(assert (=> b!652080 m!624723))

(declare-fun m!624731 () Bool)

(assert (=> b!652080 m!624731))

(declare-fun m!624733 () Bool)

(assert (=> b!652079 m!624733))

(declare-fun m!624735 () Bool)

(assert (=> b!652072 m!624735))

(assert (=> b!652072 m!624723))

(declare-fun m!624737 () Bool)

(assert (=> b!652072 m!624737))

(declare-fun m!624739 () Bool)

(assert (=> b!652072 m!624739))

(declare-fun m!624741 () Bool)

(assert (=> b!652072 m!624741))

(assert (=> b!652072 m!624723))

(declare-fun m!624743 () Bool)

(assert (=> b!652072 m!624743))

(declare-fun m!624745 () Bool)

(assert (=> b!652072 m!624745))

(assert (=> b!652072 m!624723))

(assert (=> b!652072 m!624723))

(declare-fun m!624747 () Bool)

(assert (=> b!652072 m!624747))

(assert (=> b!652087 m!624723))

(declare-fun m!624749 () Bool)

(assert (=> b!652087 m!624749))

(declare-fun m!624751 () Bool)

(assert (=> b!652087 m!624751))

(assert (=> b!652087 m!624723))

(declare-fun m!624753 () Bool)

(assert (=> b!652087 m!624753))

(assert (=> b!652087 m!624723))

(declare-fun m!624755 () Bool)

(assert (=> b!652087 m!624755))

(assert (=> b!652087 m!624745))

(assert (=> b!652087 m!624723))

(declare-fun m!624757 () Bool)

(assert (=> b!652087 m!624757))

(assert (=> b!652087 m!624735))

(declare-fun m!624759 () Bool)

(assert (=> b!652085 m!624759))

(declare-fun m!624761 () Bool)

(assert (=> start!59096 m!624761))

(declare-fun m!624763 () Bool)

(assert (=> start!59096 m!624763))

(assert (=> b!652076 m!624723))

(assert (=> b!652076 m!624723))

(declare-fun m!624765 () Bool)

(assert (=> b!652076 m!624765))

(assert (=> b!652067 m!624723))

(declare-fun m!624767 () Bool)

(assert (=> b!652067 m!624767))

(declare-fun m!624769 () Bool)

(assert (=> b!652067 m!624769))

(declare-fun m!624771 () Bool)

(assert (=> b!652067 m!624771))

(assert (=> b!652067 m!624723))

(declare-fun m!624773 () Bool)

(assert (=> b!652067 m!624773))

(assert (=> b!652067 m!624725))

(declare-fun m!624775 () Bool)

(assert (=> b!652067 m!624775))

(declare-fun m!624777 () Bool)

(assert (=> b!652067 m!624777))

(declare-fun m!624779 () Bool)

(assert (=> b!652075 m!624779))

(assert (=> b!652074 m!624723))

(assert (=> b!652074 m!624723))

(assert (=> b!652074 m!624743))

(declare-fun m!624781 () Bool)

(assert (=> b!652083 m!624781))

(assert (=> b!652088 m!624725))

(declare-fun m!624783 () Bool)

(assert (=> b!652088 m!624783))

(declare-fun m!624785 () Bool)

(assert (=> b!652082 m!624785))

(assert (=> b!652082 m!624723))

(assert (=> b!652082 m!624723))

(declare-fun m!624787 () Bool)

(assert (=> b!652082 m!624787))

(assert (=> b!652086 m!624723))

(assert (=> b!652086 m!624723))

(assert (=> b!652086 m!624765))

(declare-fun m!624789 () Bool)

(assert (=> b!652068 m!624789))

(check-sat (not b!652083) (not b!652085) (not b!652067) (not b!652086) (not b!652084) (not b!652068) (not b!652080) (not b!652075) (not start!59096) (not b!652074) (not b!652087) (not b!652082) (not b!652076) (not b!652072))
(check-sat)
