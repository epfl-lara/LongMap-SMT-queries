; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59370 () Bool)

(assert start!59370)

(declare-fun b!655893 () Bool)

(declare-fun res!425489 () Bool)

(declare-fun e!376676 () Bool)

(assert (=> b!655893 (=> (not res!425489) (not e!376676))))

(declare-datatypes ((array!38690 0))(
  ( (array!38691 (arr!18545 (Array (_ BitVec 32) (_ BitVec 64))) (size!18909 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38690)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38690 (_ BitVec 32)) Bool)

(assert (=> b!655893 (= res!425489 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!655894 () Bool)

(declare-datatypes ((Unit!22604 0))(
  ( (Unit!22605) )
))
(declare-fun e!376683 () Unit!22604)

(declare-fun Unit!22606 () Unit!22604)

(assert (=> b!655894 (= e!376683 Unit!22606)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun res!425479 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!655894 (= res!425479 (= (select (store (arr!18545 a!2986) i!1108 k!1786) index!984) (select (arr!18545 a!2986) j!136)))))

(declare-fun e!376685 () Bool)

(assert (=> b!655894 (=> (not res!425479) (not e!376685))))

(assert (=> b!655894 e!376685))

(declare-fun c!75576 () Bool)

(assert (=> b!655894 (= c!75576 (bvslt j!136 index!984))))

(declare-fun lt!306080 () Unit!22604)

(declare-fun e!376674 () Unit!22604)

(assert (=> b!655894 (= lt!306080 e!376674)))

(declare-fun c!75578 () Bool)

(assert (=> b!655894 (= c!75578 (bvslt index!984 j!136))))

(declare-fun lt!306070 () Unit!22604)

(declare-fun e!376677 () Unit!22604)

(assert (=> b!655894 (= lt!306070 e!376677)))

(assert (=> b!655894 false))

(declare-fun b!655895 () Bool)

(declare-fun res!425488 () Bool)

(declare-fun e!376675 () Bool)

(assert (=> b!655895 (=> (not res!425488) (not e!376675))))

(assert (=> b!655895 (= res!425488 (and (= (size!18909 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18909 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18909 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!655896 () Bool)

(declare-fun res!425477 () Bool)

(assert (=> b!655896 (=> (not res!425477) (not e!376675))))

(declare-fun arrayContainsKey!0 (array!38690 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!655896 (= res!425477 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!655897 () Bool)

(declare-fun e!376673 () Bool)

(declare-datatypes ((SeekEntryResult!6985 0))(
  ( (MissingZero!6985 (index!30299 (_ BitVec 32))) (Found!6985 (index!30300 (_ BitVec 32))) (Intermediate!6985 (undefined!7797 Bool) (index!30301 (_ BitVec 32)) (x!59082 (_ BitVec 32))) (Undefined!6985) (MissingVacant!6985 (index!30302 (_ BitVec 32))) )
))
(declare-fun lt!306082 () SeekEntryResult!6985)

(declare-fun lt!306076 () SeekEntryResult!6985)

(assert (=> b!655897 (= e!376673 (= lt!306082 lt!306076))))

(declare-fun b!655898 () Bool)

(declare-fun res!425480 () Bool)

(assert (=> b!655898 (=> (not res!425480) (not e!376675))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!655898 (= res!425480 (validKeyInArray!0 (select (arr!18545 a!2986) j!136)))))

(declare-fun b!655899 () Bool)

(declare-fun Unit!22607 () Unit!22604)

(assert (=> b!655899 (= e!376683 Unit!22607)))

(declare-fun b!655900 () Bool)

(assert (=> b!655900 false))

(declare-fun lt!306063 () Unit!22604)

(declare-fun lt!306064 () array!38690)

(declare-datatypes ((List!12586 0))(
  ( (Nil!12583) (Cons!12582 (h!13627 (_ BitVec 64)) (t!18814 List!12586)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38690 (_ BitVec 64) (_ BitVec 32) List!12586) Unit!22604)

(assert (=> b!655900 (= lt!306063 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!306064 (select (arr!18545 a!2986) j!136) index!984 Nil!12583))))

(declare-fun arrayNoDuplicates!0 (array!38690 (_ BitVec 32) List!12586) Bool)

(assert (=> b!655900 (arrayNoDuplicates!0 lt!306064 index!984 Nil!12583)))

(declare-fun lt!306066 () Unit!22604)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38690 (_ BitVec 32) (_ BitVec 32)) Unit!22604)

(assert (=> b!655900 (= lt!306066 (lemmaNoDuplicateFromThenFromBigger!0 lt!306064 #b00000000000000000000000000000000 index!984))))

(assert (=> b!655900 (arrayNoDuplicates!0 lt!306064 #b00000000000000000000000000000000 Nil!12583)))

(declare-fun lt!306072 () Unit!22604)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38690 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12586) Unit!22604)

(assert (=> b!655900 (= lt!306072 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12583))))

(assert (=> b!655900 (arrayContainsKey!0 lt!306064 (select (arr!18545 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!306065 () Unit!22604)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38690 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22604)

(assert (=> b!655900 (= lt!306065 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!306064 (select (arr!18545 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!376680 () Bool)

(assert (=> b!655900 e!376680))

(declare-fun res!425491 () Bool)

(assert (=> b!655900 (=> (not res!425491) (not e!376680))))

(assert (=> b!655900 (= res!425491 (arrayContainsKey!0 lt!306064 (select (arr!18545 a!2986) j!136) j!136))))

(declare-fun Unit!22608 () Unit!22604)

(assert (=> b!655900 (= e!376677 Unit!22608)))

(declare-fun res!425487 () Bool)

(assert (=> start!59370 (=> (not res!425487) (not e!376675))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59370 (= res!425487 (validMask!0 mask!3053))))

(assert (=> start!59370 e!376675))

(assert (=> start!59370 true))

(declare-fun array_inv!14341 (array!38690) Bool)

(assert (=> start!59370 (array_inv!14341 a!2986)))

(declare-fun b!655901 () Bool)

(declare-fun res!425482 () Bool)

(assert (=> b!655901 (= res!425482 (bvsge j!136 index!984))))

(declare-fun e!376679 () Bool)

(assert (=> b!655901 (=> res!425482 e!376679)))

(assert (=> b!655901 (= e!376685 e!376679)))

(declare-fun b!655902 () Bool)

(declare-fun Unit!22609 () Unit!22604)

(assert (=> b!655902 (= e!376677 Unit!22609)))

(declare-fun b!655903 () Bool)

(declare-fun e!376682 () Bool)

(declare-fun e!376686 () Bool)

(assert (=> b!655903 (= e!376682 e!376686)))

(declare-fun res!425483 () Bool)

(assert (=> b!655903 (=> (not res!425483) (not e!376686))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!655903 (= res!425483 (and (= lt!306082 (Found!6985 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18545 a!2986) index!984) (select (arr!18545 a!2986) j!136))) (not (= (select (arr!18545 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38690 (_ BitVec 32)) SeekEntryResult!6985)

(assert (=> b!655903 (= lt!306082 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18545 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!655904 () Bool)

(assert (=> b!655904 (= e!376680 (arrayContainsKey!0 lt!306064 (select (arr!18545 a!2986) j!136) index!984))))

(declare-fun b!655905 () Bool)

(declare-fun res!425485 () Bool)

(assert (=> b!655905 (=> (not res!425485) (not e!376675))))

(assert (=> b!655905 (= res!425485 (validKeyInArray!0 k!1786))))

(declare-fun b!655906 () Bool)

(declare-fun lt!306067 () SeekEntryResult!6985)

(assert (=> b!655906 (= e!376686 (not (or (not (= lt!306067 (MissingVacant!6985 vacantSpotIndex!68))) (bvslt index!984 (size!18909 a!2986)))))))

(declare-fun lt!306071 () Unit!22604)

(assert (=> b!655906 (= lt!306071 e!376683)))

(declare-fun c!75577 () Bool)

(assert (=> b!655906 (= c!75577 (= lt!306067 (Found!6985 index!984)))))

(declare-fun lt!306079 () Unit!22604)

(declare-fun e!376681 () Unit!22604)

(assert (=> b!655906 (= lt!306079 e!376681)))

(declare-fun c!75575 () Bool)

(assert (=> b!655906 (= c!75575 (= lt!306067 Undefined!6985))))

(declare-fun lt!306074 () (_ BitVec 64))

(assert (=> b!655906 (= lt!306067 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!306074 lt!306064 mask!3053))))

(assert (=> b!655906 e!376673))

(declare-fun res!425481 () Bool)

(assert (=> b!655906 (=> (not res!425481) (not e!376673))))

(declare-fun lt!306077 () (_ BitVec 32))

(assert (=> b!655906 (= res!425481 (= lt!306076 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306077 vacantSpotIndex!68 lt!306074 lt!306064 mask!3053)))))

(assert (=> b!655906 (= lt!306076 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306077 vacantSpotIndex!68 (select (arr!18545 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!655906 (= lt!306074 (select (store (arr!18545 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!306081 () Unit!22604)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38690 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22604)

(assert (=> b!655906 (= lt!306081 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!306077 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!655906 (= lt!306077 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!655907 () Bool)

(declare-fun e!376678 () Bool)

(assert (=> b!655907 (= e!376678 (arrayContainsKey!0 lt!306064 (select (arr!18545 a!2986) j!136) index!984))))

(declare-fun b!655908 () Bool)

(declare-fun Unit!22610 () Unit!22604)

(assert (=> b!655908 (= e!376681 Unit!22610)))

(assert (=> b!655908 false))

(declare-fun b!655909 () Bool)

(declare-fun res!425486 () Bool)

(assert (=> b!655909 (=> (not res!425486) (not e!376676))))

(assert (=> b!655909 (= res!425486 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12583))))

(declare-fun res!425492 () Bool)

(declare-fun b!655910 () Bool)

(assert (=> b!655910 (= res!425492 (arrayContainsKey!0 lt!306064 (select (arr!18545 a!2986) j!136) j!136))))

(assert (=> b!655910 (=> (not res!425492) (not e!376678))))

(assert (=> b!655910 (= e!376679 e!376678)))

(declare-fun b!655911 () Bool)

(declare-fun Unit!22611 () Unit!22604)

(assert (=> b!655911 (= e!376681 Unit!22611)))

(declare-fun b!655912 () Bool)

(declare-fun Unit!22612 () Unit!22604)

(assert (=> b!655912 (= e!376674 Unit!22612)))

(declare-fun b!655913 () Bool)

(assert (=> b!655913 (= e!376676 e!376682)))

(declare-fun res!425478 () Bool)

(assert (=> b!655913 (=> (not res!425478) (not e!376682))))

(assert (=> b!655913 (= res!425478 (= (select (store (arr!18545 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!655913 (= lt!306064 (array!38691 (store (arr!18545 a!2986) i!1108 k!1786) (size!18909 a!2986)))))

(declare-fun b!655914 () Bool)

(assert (=> b!655914 false))

(declare-fun lt!306068 () Unit!22604)

(assert (=> b!655914 (= lt!306068 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!306064 (select (arr!18545 a!2986) j!136) j!136 Nil!12583))))

(assert (=> b!655914 (arrayNoDuplicates!0 lt!306064 j!136 Nil!12583)))

(declare-fun lt!306069 () Unit!22604)

(assert (=> b!655914 (= lt!306069 (lemmaNoDuplicateFromThenFromBigger!0 lt!306064 #b00000000000000000000000000000000 j!136))))

(assert (=> b!655914 (arrayNoDuplicates!0 lt!306064 #b00000000000000000000000000000000 Nil!12583)))

(declare-fun lt!306078 () Unit!22604)

(assert (=> b!655914 (= lt!306078 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12583))))

(assert (=> b!655914 (arrayContainsKey!0 lt!306064 (select (arr!18545 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!306075 () Unit!22604)

(assert (=> b!655914 (= lt!306075 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!306064 (select (arr!18545 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!22613 () Unit!22604)

(assert (=> b!655914 (= e!376674 Unit!22613)))

(declare-fun b!655915 () Bool)

(assert (=> b!655915 (= e!376675 e!376676)))

(declare-fun res!425484 () Bool)

(assert (=> b!655915 (=> (not res!425484) (not e!376676))))

(declare-fun lt!306073 () SeekEntryResult!6985)

(assert (=> b!655915 (= res!425484 (or (= lt!306073 (MissingZero!6985 i!1108)) (= lt!306073 (MissingVacant!6985 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38690 (_ BitVec 32)) SeekEntryResult!6985)

(assert (=> b!655915 (= lt!306073 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!655916 () Bool)

(declare-fun res!425490 () Bool)

(assert (=> b!655916 (=> (not res!425490) (not e!376676))))

(assert (=> b!655916 (= res!425490 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18545 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!59370 res!425487) b!655895))

(assert (= (and b!655895 res!425488) b!655898))

(assert (= (and b!655898 res!425480) b!655905))

(assert (= (and b!655905 res!425485) b!655896))

(assert (= (and b!655896 res!425477) b!655915))

(assert (= (and b!655915 res!425484) b!655893))

(assert (= (and b!655893 res!425489) b!655909))

(assert (= (and b!655909 res!425486) b!655916))

(assert (= (and b!655916 res!425490) b!655913))

(assert (= (and b!655913 res!425478) b!655903))

(assert (= (and b!655903 res!425483) b!655906))

(assert (= (and b!655906 res!425481) b!655897))

(assert (= (and b!655906 c!75575) b!655908))

(assert (= (and b!655906 (not c!75575)) b!655911))

(assert (= (and b!655906 c!75577) b!655894))

(assert (= (and b!655906 (not c!75577)) b!655899))

(assert (= (and b!655894 res!425479) b!655901))

(assert (= (and b!655901 (not res!425482)) b!655910))

(assert (= (and b!655910 res!425492) b!655907))

(assert (= (and b!655894 c!75576) b!655914))

(assert (= (and b!655894 (not c!75576)) b!655912))

(assert (= (and b!655894 c!75578) b!655900))

(assert (= (and b!655894 (not c!75578)) b!655902))

(assert (= (and b!655900 res!425491) b!655904))

(declare-fun m!628957 () Bool)

(assert (=> b!655907 m!628957))

(assert (=> b!655907 m!628957))

(declare-fun m!628959 () Bool)

(assert (=> b!655907 m!628959))

(declare-fun m!628961 () Bool)

(assert (=> b!655893 m!628961))

(declare-fun m!628963 () Bool)

(assert (=> b!655916 m!628963))

(declare-fun m!628965 () Bool)

(assert (=> b!655905 m!628965))

(declare-fun m!628967 () Bool)

(assert (=> b!655903 m!628967))

(assert (=> b!655903 m!628957))

(assert (=> b!655903 m!628957))

(declare-fun m!628969 () Bool)

(assert (=> b!655903 m!628969))

(declare-fun m!628971 () Bool)

(assert (=> b!655913 m!628971))

(declare-fun m!628973 () Bool)

(assert (=> b!655913 m!628973))

(assert (=> b!655910 m!628957))

(assert (=> b!655910 m!628957))

(declare-fun m!628975 () Bool)

(assert (=> b!655910 m!628975))

(declare-fun m!628977 () Bool)

(assert (=> b!655906 m!628977))

(declare-fun m!628979 () Bool)

(assert (=> b!655906 m!628979))

(assert (=> b!655906 m!628957))

(declare-fun m!628981 () Bool)

(assert (=> b!655906 m!628981))

(assert (=> b!655906 m!628957))

(declare-fun m!628983 () Bool)

(assert (=> b!655906 m!628983))

(assert (=> b!655906 m!628971))

(declare-fun m!628985 () Bool)

(assert (=> b!655906 m!628985))

(declare-fun m!628987 () Bool)

(assert (=> b!655906 m!628987))

(declare-fun m!628989 () Bool)

(assert (=> b!655900 m!628989))

(assert (=> b!655900 m!628957))

(declare-fun m!628991 () Bool)

(assert (=> b!655900 m!628991))

(assert (=> b!655900 m!628957))

(assert (=> b!655900 m!628957))

(assert (=> b!655900 m!628975))

(assert (=> b!655900 m!628957))

(declare-fun m!628993 () Bool)

(assert (=> b!655900 m!628993))

(declare-fun m!628995 () Bool)

(assert (=> b!655900 m!628995))

(declare-fun m!628997 () Bool)

(assert (=> b!655900 m!628997))

(assert (=> b!655900 m!628957))

(declare-fun m!628999 () Bool)

(assert (=> b!655900 m!628999))

(declare-fun m!629001 () Bool)

(assert (=> b!655900 m!629001))

(assert (=> b!655894 m!628971))

(declare-fun m!629003 () Bool)

(assert (=> b!655894 m!629003))

(assert (=> b!655894 m!628957))

(assert (=> b!655898 m!628957))

(assert (=> b!655898 m!628957))

(declare-fun m!629005 () Bool)

(assert (=> b!655898 m!629005))

(assert (=> b!655904 m!628957))

(assert (=> b!655904 m!628957))

(assert (=> b!655904 m!628959))

(declare-fun m!629007 () Bool)

(assert (=> b!655915 m!629007))

(declare-fun m!629009 () Bool)

(assert (=> b!655909 m!629009))

(declare-fun m!629011 () Bool)

(assert (=> b!655896 m!629011))

(assert (=> b!655914 m!628989))

(declare-fun m!629013 () Bool)

(assert (=> b!655914 m!629013))

(assert (=> b!655914 m!628957))

(declare-fun m!629015 () Bool)

(assert (=> b!655914 m!629015))

(assert (=> b!655914 m!628957))

(assert (=> b!655914 m!628957))

(declare-fun m!629017 () Bool)

(assert (=> b!655914 m!629017))

(declare-fun m!629019 () Bool)

(assert (=> b!655914 m!629019))

(assert (=> b!655914 m!628957))

(declare-fun m!629021 () Bool)

(assert (=> b!655914 m!629021))

(assert (=> b!655914 m!628997))

(declare-fun m!629023 () Bool)

(assert (=> start!59370 m!629023))

(declare-fun m!629025 () Bool)

(assert (=> start!59370 m!629025))

(push 1)

(assert (not b!655907))

(assert (not b!655915))

(assert (not b!655909))

(assert (not b!655903))

(assert (not b!655896))

(assert (not b!655900))

(assert (not b!655906))

(assert (not start!59370))

(assert (not b!655905))

(assert (not b!655914))

(assert (not b!655910))

(assert (not b!655904))

(assert (not b!655893))

(assert (not b!655898))

(check-sat)

(pop 1)

(push 1)

(check-sat)

