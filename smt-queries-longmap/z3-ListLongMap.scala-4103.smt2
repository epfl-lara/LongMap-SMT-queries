; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56166 () Bool)

(assert start!56166)

(declare-fun b!619882 () Bool)

(declare-datatypes ((Unit!20497 0))(
  ( (Unit!20498) )
))
(declare-fun e!355531 () Unit!20497)

(declare-fun Unit!20499 () Unit!20497)

(assert (=> b!619882 (= e!355531 Unit!20499)))

(declare-fun b!619883 () Bool)

(declare-fun e!355534 () Unit!20497)

(declare-fun Unit!20500 () Unit!20497)

(assert (=> b!619883 (= e!355534 Unit!20500)))

(declare-fun b!619884 () Bool)

(declare-fun e!355530 () Bool)

(declare-fun e!355525 () Bool)

(assert (=> b!619884 (= e!355530 e!355525)))

(declare-fun res!399392 () Bool)

(assert (=> b!619884 (=> (not res!399392) (not e!355525))))

(declare-datatypes ((SeekEntryResult!6430 0))(
  ( (MissingZero!6430 (index!28004 (_ BitVec 32))) (Found!6430 (index!28005 (_ BitVec 32))) (Intermediate!6430 (undefined!7242 Bool) (index!28006 (_ BitVec 32)) (x!56937 (_ BitVec 32))) (Undefined!6430) (MissingVacant!6430 (index!28007 (_ BitVec 32))) )
))
(declare-fun lt!286214 () SeekEntryResult!6430)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!619884 (= res!399392 (or (= lt!286214 (MissingZero!6430 i!1108)) (= lt!286214 (MissingVacant!6430 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!37581 0))(
  ( (array!37582 (arr!18034 (Array (_ BitVec 32) (_ BitVec 64))) (size!18398 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37581)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37581 (_ BitVec 32)) SeekEntryResult!6430)

(assert (=> b!619884 (= lt!286214 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!619885 () Bool)

(assert (=> b!619885 false))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!286210 () array!37581)

(declare-fun lt!286217 () Unit!20497)

(declare-datatypes ((List!11982 0))(
  ( (Nil!11979) (Cons!11978 (h!13026 (_ BitVec 64)) (t!18202 List!11982)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37581 (_ BitVec 64) (_ BitVec 32) List!11982) Unit!20497)

(assert (=> b!619885 (= lt!286217 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!286210 (select (arr!18034 a!2986) j!136) j!136 Nil!11979))))

(declare-fun arrayNoDuplicates!0 (array!37581 (_ BitVec 32) List!11982) Bool)

(assert (=> b!619885 (arrayNoDuplicates!0 lt!286210 j!136 Nil!11979)))

(declare-fun lt!286205 () Unit!20497)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37581 (_ BitVec 32) (_ BitVec 32)) Unit!20497)

(assert (=> b!619885 (= lt!286205 (lemmaNoDuplicateFromThenFromBigger!0 lt!286210 #b00000000000000000000000000000000 j!136))))

(assert (=> b!619885 (arrayNoDuplicates!0 lt!286210 #b00000000000000000000000000000000 Nil!11979)))

(declare-fun lt!286208 () Unit!20497)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37581 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11982) Unit!20497)

(assert (=> b!619885 (= lt!286208 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11979))))

(declare-fun arrayContainsKey!0 (array!37581 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!619885 (arrayContainsKey!0 lt!286210 (select (arr!18034 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!286215 () Unit!20497)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37581 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20497)

(assert (=> b!619885 (= lt!286215 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!286210 (select (arr!18034 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!355527 () Unit!20497)

(declare-fun Unit!20501 () Unit!20497)

(assert (=> b!619885 (= e!355527 Unit!20501)))

(declare-fun b!619886 () Bool)

(declare-fun res!399393 () Bool)

(assert (=> b!619886 (=> (not res!399393) (not e!355530))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!619886 (= res!399393 (validKeyInArray!0 k0!1786))))

(declare-fun b!619887 () Bool)

(declare-fun e!355529 () Unit!20497)

(declare-fun Unit!20502 () Unit!20497)

(assert (=> b!619887 (= e!355529 Unit!20502)))

(declare-fun b!619888 () Bool)

(declare-fun res!399399 () Bool)

(assert (=> b!619888 (=> (not res!399399) (not e!355525))))

(assert (=> b!619888 (= res!399399 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11979))))

(declare-fun b!619889 () Bool)

(declare-fun res!399402 () Bool)

(assert (=> b!619889 (=> (not res!399402) (not e!355530))))

(assert (=> b!619889 (= res!399402 (validKeyInArray!0 (select (arr!18034 a!2986) j!136)))))

(declare-fun b!619890 () Bool)

(declare-fun e!355536 () Bool)

(declare-fun lt!286202 () SeekEntryResult!6430)

(declare-fun lt!286209 () SeekEntryResult!6430)

(assert (=> b!619890 (= e!355536 (= lt!286202 lt!286209))))

(declare-fun b!619891 () Bool)

(declare-fun e!355535 () Bool)

(assert (=> b!619891 (= e!355535 (arrayContainsKey!0 lt!286210 (select (arr!18034 a!2986) j!136) index!984))))

(declare-fun b!619892 () Bool)

(declare-fun e!355528 () Bool)

(declare-fun e!355524 () Bool)

(assert (=> b!619892 (= e!355528 e!355524)))

(declare-fun res!399394 () Bool)

(assert (=> b!619892 (=> (not res!399394) (not e!355524))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!619892 (= res!399394 (and (= lt!286202 (Found!6430 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18034 a!2986) index!984) (select (arr!18034 a!2986) j!136))) (not (= (select (arr!18034 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37581 (_ BitVec 32)) SeekEntryResult!6430)

(assert (=> b!619892 (= lt!286202 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18034 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!619894 () Bool)

(declare-fun res!399391 () Bool)

(assert (=> b!619894 (=> (not res!399391) (not e!355530))))

(assert (=> b!619894 (= res!399391 (and (= (size!18398 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18398 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18398 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!619895 () Bool)

(declare-fun Unit!20503 () Unit!20497)

(assert (=> b!619895 (= e!355531 Unit!20503)))

(declare-fun res!399403 () Bool)

(assert (=> b!619895 (= res!399403 (= (select (store (arr!18034 a!2986) i!1108 k0!1786) index!984) (select (arr!18034 a!2986) j!136)))))

(declare-fun e!355522 () Bool)

(assert (=> b!619895 (=> (not res!399403) (not e!355522))))

(assert (=> b!619895 e!355522))

(declare-fun c!70616 () Bool)

(assert (=> b!619895 (= c!70616 (bvslt j!136 index!984))))

(declare-fun lt!286213 () Unit!20497)

(assert (=> b!619895 (= lt!286213 e!355527)))

(declare-fun c!70618 () Bool)

(assert (=> b!619895 (= c!70618 (bvslt index!984 j!136))))

(declare-fun lt!286206 () Unit!20497)

(assert (=> b!619895 (= lt!286206 e!355529)))

(assert (=> b!619895 false))

(declare-fun b!619896 () Bool)

(assert (=> b!619896 false))

(declare-fun lt!286212 () Unit!20497)

(assert (=> b!619896 (= lt!286212 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!286210 (select (arr!18034 a!2986) j!136) index!984 Nil!11979))))

(assert (=> b!619896 (arrayNoDuplicates!0 lt!286210 index!984 Nil!11979)))

(declare-fun lt!286201 () Unit!20497)

(assert (=> b!619896 (= lt!286201 (lemmaNoDuplicateFromThenFromBigger!0 lt!286210 #b00000000000000000000000000000000 index!984))))

(assert (=> b!619896 (arrayNoDuplicates!0 lt!286210 #b00000000000000000000000000000000 Nil!11979)))

(declare-fun lt!286216 () Unit!20497)

(assert (=> b!619896 (= lt!286216 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11979))))

(assert (=> b!619896 (arrayContainsKey!0 lt!286210 (select (arr!18034 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!286207 () Unit!20497)

(assert (=> b!619896 (= lt!286207 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!286210 (select (arr!18034 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!355533 () Bool)

(assert (=> b!619896 e!355533))

(declare-fun res!399389 () Bool)

(assert (=> b!619896 (=> (not res!399389) (not e!355533))))

(assert (=> b!619896 (= res!399389 (arrayContainsKey!0 lt!286210 (select (arr!18034 a!2986) j!136) j!136))))

(declare-fun Unit!20504 () Unit!20497)

(assert (=> b!619896 (= e!355529 Unit!20504)))

(declare-fun b!619897 () Bool)

(assert (=> b!619897 (= e!355525 e!355528)))

(declare-fun res!399388 () Bool)

(assert (=> b!619897 (=> (not res!399388) (not e!355528))))

(assert (=> b!619897 (= res!399388 (= (select (store (arr!18034 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!619897 (= lt!286210 (array!37582 (store (arr!18034 a!2986) i!1108 k0!1786) (size!18398 a!2986)))))

(declare-fun b!619898 () Bool)

(declare-fun e!355532 () Bool)

(assert (=> b!619898 (= e!355524 (not e!355532))))

(declare-fun res!399397 () Bool)

(assert (=> b!619898 (=> res!399397 e!355532)))

(declare-fun lt!286200 () SeekEntryResult!6430)

(assert (=> b!619898 (= res!399397 (not (= lt!286200 (MissingVacant!6430 vacantSpotIndex!68))))))

(declare-fun lt!286211 () Unit!20497)

(assert (=> b!619898 (= lt!286211 e!355531)))

(declare-fun c!70619 () Bool)

(assert (=> b!619898 (= c!70619 (= lt!286200 (Found!6430 index!984)))))

(declare-fun lt!286218 () Unit!20497)

(assert (=> b!619898 (= lt!286218 e!355534)))

(declare-fun c!70617 () Bool)

(assert (=> b!619898 (= c!70617 (= lt!286200 Undefined!6430))))

(declare-fun lt!286203 () (_ BitVec 64))

(assert (=> b!619898 (= lt!286200 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!286203 lt!286210 mask!3053))))

(assert (=> b!619898 e!355536))

(declare-fun res!399395 () Bool)

(assert (=> b!619898 (=> (not res!399395) (not e!355536))))

(declare-fun lt!286204 () (_ BitVec 32))

(assert (=> b!619898 (= res!399395 (= lt!286209 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!286204 vacantSpotIndex!68 lt!286203 lt!286210 mask!3053)))))

(assert (=> b!619898 (= lt!286209 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!286204 vacantSpotIndex!68 (select (arr!18034 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!619898 (= lt!286203 (select (store (arr!18034 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!286219 () Unit!20497)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37581 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20497)

(assert (=> b!619898 (= lt!286219 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!286204 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!619898 (= lt!286204 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!619899 () Bool)

(declare-fun res!399400 () Bool)

(assert (=> b!619899 (= res!399400 (arrayContainsKey!0 lt!286210 (select (arr!18034 a!2986) j!136) j!136))))

(assert (=> b!619899 (=> (not res!399400) (not e!355535))))

(declare-fun e!355526 () Bool)

(assert (=> b!619899 (= e!355526 e!355535)))

(declare-fun b!619900 () Bool)

(assert (=> b!619900 (= e!355532 true)))

(assert (=> b!619900 (= (select (store (arr!18034 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!619901 () Bool)

(declare-fun Unit!20505 () Unit!20497)

(assert (=> b!619901 (= e!355534 Unit!20505)))

(assert (=> b!619901 false))

(declare-fun b!619902 () Bool)

(declare-fun res!399396 () Bool)

(assert (=> b!619902 (= res!399396 (bvsge j!136 index!984))))

(assert (=> b!619902 (=> res!399396 e!355526)))

(assert (=> b!619902 (= e!355522 e!355526)))

(declare-fun b!619903 () Bool)

(declare-fun res!399401 () Bool)

(assert (=> b!619903 (=> (not res!399401) (not e!355525))))

(assert (=> b!619903 (= res!399401 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18034 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!619904 () Bool)

(declare-fun res!399398 () Bool)

(assert (=> b!619904 (=> (not res!399398) (not e!355530))))

(assert (=> b!619904 (= res!399398 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!399390 () Bool)

(assert (=> start!56166 (=> (not res!399390) (not e!355530))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56166 (= res!399390 (validMask!0 mask!3053))))

(assert (=> start!56166 e!355530))

(assert (=> start!56166 true))

(declare-fun array_inv!13893 (array!37581) Bool)

(assert (=> start!56166 (array_inv!13893 a!2986)))

(declare-fun b!619893 () Bool)

(assert (=> b!619893 (= e!355533 (arrayContainsKey!0 lt!286210 (select (arr!18034 a!2986) j!136) index!984))))

(declare-fun b!619905 () Bool)

(declare-fun res!399387 () Bool)

(assert (=> b!619905 (=> (not res!399387) (not e!355525))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37581 (_ BitVec 32)) Bool)

(assert (=> b!619905 (= res!399387 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!619906 () Bool)

(declare-fun Unit!20506 () Unit!20497)

(assert (=> b!619906 (= e!355527 Unit!20506)))

(assert (= (and start!56166 res!399390) b!619894))

(assert (= (and b!619894 res!399391) b!619889))

(assert (= (and b!619889 res!399402) b!619886))

(assert (= (and b!619886 res!399393) b!619904))

(assert (= (and b!619904 res!399398) b!619884))

(assert (= (and b!619884 res!399392) b!619905))

(assert (= (and b!619905 res!399387) b!619888))

(assert (= (and b!619888 res!399399) b!619903))

(assert (= (and b!619903 res!399401) b!619897))

(assert (= (and b!619897 res!399388) b!619892))

(assert (= (and b!619892 res!399394) b!619898))

(assert (= (and b!619898 res!399395) b!619890))

(assert (= (and b!619898 c!70617) b!619901))

(assert (= (and b!619898 (not c!70617)) b!619883))

(assert (= (and b!619898 c!70619) b!619895))

(assert (= (and b!619898 (not c!70619)) b!619882))

(assert (= (and b!619895 res!399403) b!619902))

(assert (= (and b!619902 (not res!399396)) b!619899))

(assert (= (and b!619899 res!399400) b!619891))

(assert (= (and b!619895 c!70616) b!619885))

(assert (= (and b!619895 (not c!70616)) b!619906))

(assert (= (and b!619895 c!70618) b!619896))

(assert (= (and b!619895 (not c!70618)) b!619887))

(assert (= (and b!619896 res!399389) b!619893))

(assert (= (and b!619898 (not res!399397)) b!619900))

(declare-fun m!596117 () Bool)

(assert (=> b!619896 m!596117))

(assert (=> b!619896 m!596117))

(declare-fun m!596119 () Bool)

(assert (=> b!619896 m!596119))

(assert (=> b!619896 m!596117))

(declare-fun m!596121 () Bool)

(assert (=> b!619896 m!596121))

(declare-fun m!596123 () Bool)

(assert (=> b!619896 m!596123))

(assert (=> b!619896 m!596117))

(declare-fun m!596125 () Bool)

(assert (=> b!619896 m!596125))

(declare-fun m!596127 () Bool)

(assert (=> b!619896 m!596127))

(assert (=> b!619896 m!596117))

(declare-fun m!596129 () Bool)

(assert (=> b!619896 m!596129))

(declare-fun m!596131 () Bool)

(assert (=> b!619896 m!596131))

(declare-fun m!596133 () Bool)

(assert (=> b!619896 m!596133))

(assert (=> b!619899 m!596117))

(assert (=> b!619899 m!596117))

(assert (=> b!619899 m!596121))

(declare-fun m!596135 () Bool)

(assert (=> b!619884 m!596135))

(assert (=> b!619891 m!596117))

(assert (=> b!619891 m!596117))

(declare-fun m!596137 () Bool)

(assert (=> b!619891 m!596137))

(declare-fun m!596139 () Bool)

(assert (=> b!619898 m!596139))

(declare-fun m!596141 () Bool)

(assert (=> b!619898 m!596141))

(assert (=> b!619898 m!596117))

(declare-fun m!596143 () Bool)

(assert (=> b!619898 m!596143))

(declare-fun m!596145 () Bool)

(assert (=> b!619898 m!596145))

(declare-fun m!596147 () Bool)

(assert (=> b!619898 m!596147))

(assert (=> b!619898 m!596117))

(declare-fun m!596149 () Bool)

(assert (=> b!619898 m!596149))

(declare-fun m!596151 () Bool)

(assert (=> b!619898 m!596151))

(assert (=> b!619885 m!596117))

(declare-fun m!596153 () Bool)

(assert (=> b!619885 m!596153))

(assert (=> b!619885 m!596117))

(declare-fun m!596155 () Bool)

(assert (=> b!619885 m!596155))

(assert (=> b!619885 m!596117))

(declare-fun m!596157 () Bool)

(assert (=> b!619885 m!596157))

(declare-fun m!596159 () Bool)

(assert (=> b!619885 m!596159))

(assert (=> b!619885 m!596117))

(declare-fun m!596161 () Bool)

(assert (=> b!619885 m!596161))

(assert (=> b!619885 m!596131))

(assert (=> b!619885 m!596133))

(assert (=> b!619893 m!596117))

(assert (=> b!619893 m!596117))

(assert (=> b!619893 m!596137))

(declare-fun m!596163 () Bool)

(assert (=> b!619892 m!596163))

(assert (=> b!619892 m!596117))

(assert (=> b!619892 m!596117))

(declare-fun m!596165 () Bool)

(assert (=> b!619892 m!596165))

(assert (=> b!619897 m!596143))

(declare-fun m!596167 () Bool)

(assert (=> b!619897 m!596167))

(declare-fun m!596169 () Bool)

(assert (=> b!619888 m!596169))

(declare-fun m!596171 () Bool)

(assert (=> start!56166 m!596171))

(declare-fun m!596173 () Bool)

(assert (=> start!56166 m!596173))

(declare-fun m!596175 () Bool)

(assert (=> b!619903 m!596175))

(declare-fun m!596177 () Bool)

(assert (=> b!619905 m!596177))

(declare-fun m!596179 () Bool)

(assert (=> b!619904 m!596179))

(declare-fun m!596181 () Bool)

(assert (=> b!619886 m!596181))

(assert (=> b!619900 m!596143))

(declare-fun m!596183 () Bool)

(assert (=> b!619900 m!596183))

(assert (=> b!619889 m!596117))

(assert (=> b!619889 m!596117))

(declare-fun m!596185 () Bool)

(assert (=> b!619889 m!596185))

(assert (=> b!619895 m!596143))

(assert (=> b!619895 m!596183))

(assert (=> b!619895 m!596117))

(check-sat (not b!619886) (not b!619904) (not b!619884) (not b!619896) (not b!619899) (not b!619892) (not b!619889) (not b!619885) (not start!56166) (not b!619898) (not b!619888) (not b!619893) (not b!619905) (not b!619891))
(check-sat)
