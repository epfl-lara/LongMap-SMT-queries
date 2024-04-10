; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58862 () Bool)

(assert start!58862)

(declare-fun b!648891 () Bool)

(declare-fun e!372184 () Bool)

(declare-fun e!372182 () Bool)

(assert (=> b!648891 (= e!372184 (not e!372182))))

(declare-fun res!420478 () Bool)

(assert (=> b!648891 (=> res!420478 e!372182)))

(declare-datatypes ((SeekEntryResult!6908 0))(
  ( (MissingZero!6908 (index!29979 (_ BitVec 32))) (Found!6908 (index!29980 (_ BitVec 32))) (Intermediate!6908 (undefined!7720 Bool) (index!29981 (_ BitVec 32)) (x!58769 (_ BitVec 32))) (Undefined!6908) (MissingVacant!6908 (index!29982 (_ BitVec 32))) )
))
(declare-fun lt!301226 () SeekEntryResult!6908)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!648891 (= res!420478 (not (= lt!301226 (Found!6908 index!984))))))

(declare-datatypes ((Unit!22074 0))(
  ( (Unit!22075) )
))
(declare-fun lt!301230 () Unit!22074)

(declare-fun e!372186 () Unit!22074)

(assert (=> b!648891 (= lt!301230 e!372186)))

(declare-fun c!74578 () Bool)

(assert (=> b!648891 (= c!74578 (= lt!301226 Undefined!6908))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun lt!301231 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!38524 0))(
  ( (array!38525 (arr!18468 (Array (_ BitVec 32) (_ BitVec 64))) (size!18832 (_ BitVec 32))) )
))
(declare-fun lt!301227 () array!38524)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38524 (_ BitVec 32)) SeekEntryResult!6908)

(assert (=> b!648891 (= lt!301226 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!301231 lt!301227 mask!3053))))

(declare-fun e!372178 () Bool)

(assert (=> b!648891 e!372178))

(declare-fun res!420483 () Bool)

(assert (=> b!648891 (=> (not res!420483) (not e!372178))))

(declare-fun lt!301237 () (_ BitVec 32))

(declare-fun lt!301229 () SeekEntryResult!6908)

(assert (=> b!648891 (= res!420483 (= lt!301229 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301237 vacantSpotIndex!68 lt!301231 lt!301227 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!38524)

(assert (=> b!648891 (= lt!301229 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301237 vacantSpotIndex!68 (select (arr!18468 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!648891 (= lt!301231 (select (store (arr!18468 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!301238 () Unit!22074)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38524 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22074)

(assert (=> b!648891 (= lt!301238 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!301237 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!648891 (= lt!301237 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!648893 () Bool)

(declare-fun res!420489 () Bool)

(declare-fun e!372187 () Bool)

(assert (=> b!648893 (=> (not res!420489) (not e!372187))))

(declare-datatypes ((List!12509 0))(
  ( (Nil!12506) (Cons!12505 (h!13550 (_ BitVec 64)) (t!18737 List!12509)) )
))
(declare-fun arrayNoDuplicates!0 (array!38524 (_ BitVec 32) List!12509) Bool)

(assert (=> b!648893 (= res!420489 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12506))))

(declare-fun b!648894 () Bool)

(declare-fun Unit!22076 () Unit!22074)

(assert (=> b!648894 (= e!372186 Unit!22076)))

(assert (=> b!648894 false))

(declare-fun e!372185 () Bool)

(declare-fun b!648895 () Bool)

(declare-fun arrayContainsKey!0 (array!38524 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!648895 (= e!372185 (arrayContainsKey!0 lt!301227 (select (arr!18468 a!2986) j!136) index!984))))

(declare-fun b!648896 () Bool)

(declare-fun e!372180 () Bool)

(assert (=> b!648896 (= e!372182 e!372180)))

(declare-fun res!420480 () Bool)

(assert (=> b!648896 (=> res!420480 e!372180)))

(declare-fun lt!301225 () (_ BitVec 64))

(assert (=> b!648896 (= res!420480 (or (not (= (select (arr!18468 a!2986) j!136) lt!301231)) (not (= (select (arr!18468 a!2986) j!136) lt!301225))))))

(declare-fun e!372175 () Bool)

(assert (=> b!648896 e!372175))

(declare-fun res!420487 () Bool)

(assert (=> b!648896 (=> (not res!420487) (not e!372175))))

(assert (=> b!648896 (= res!420487 (= lt!301225 (select (arr!18468 a!2986) j!136)))))

(assert (=> b!648896 (= lt!301225 (select (store (arr!18468 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!648897 () Bool)

(declare-fun e!372181 () Bool)

(assert (=> b!648897 (= e!372181 e!372184)))

(declare-fun res!420479 () Bool)

(assert (=> b!648897 (=> (not res!420479) (not e!372184))))

(declare-fun lt!301224 () SeekEntryResult!6908)

(assert (=> b!648897 (= res!420479 (and (= lt!301224 (Found!6908 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18468 a!2986) index!984) (select (arr!18468 a!2986) j!136))) (not (= (select (arr!18468 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!648897 (= lt!301224 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18468 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!648898 () Bool)

(assert (=> b!648898 (= e!372187 e!372181)))

(declare-fun res!420490 () Bool)

(assert (=> b!648898 (=> (not res!420490) (not e!372181))))

(assert (=> b!648898 (= res!420490 (= (select (store (arr!18468 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!648898 (= lt!301227 (array!38525 (store (arr!18468 a!2986) i!1108 k!1786) (size!18832 a!2986)))))

(declare-fun b!648899 () Bool)

(declare-fun e!372189 () Bool)

(assert (=> b!648899 (= e!372175 e!372189)))

(declare-fun res!420471 () Bool)

(assert (=> b!648899 (=> res!420471 e!372189)))

(assert (=> b!648899 (= res!420471 (or (not (= (select (arr!18468 a!2986) j!136) lt!301231)) (not (= (select (arr!18468 a!2986) j!136) lt!301225)) (bvsge j!136 index!984)))))

(declare-fun b!648900 () Bool)

(declare-fun e!372183 () Unit!22074)

(declare-fun Unit!22077 () Unit!22074)

(assert (=> b!648900 (= e!372183 Unit!22077)))

(declare-fun b!648901 () Bool)

(declare-fun e!372177 () Bool)

(declare-fun e!372176 () Bool)

(assert (=> b!648901 (= e!372177 e!372176)))

(declare-fun res!420475 () Bool)

(assert (=> b!648901 (=> res!420475 e!372176)))

(assert (=> b!648901 (= res!420475 (or (bvsge (size!18832 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18832 a!2986))))))

(assert (=> b!648901 (arrayContainsKey!0 lt!301227 (select (arr!18468 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!301235 () Unit!22074)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38524 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22074)

(assert (=> b!648901 (= lt!301235 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301227 (select (arr!18468 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!372188 () Bool)

(assert (=> b!648901 e!372188))

(declare-fun res!420477 () Bool)

(assert (=> b!648901 (=> (not res!420477) (not e!372188))))

(assert (=> b!648901 (= res!420477 (arrayContainsKey!0 lt!301227 (select (arr!18468 a!2986) j!136) j!136))))

(declare-fun b!648902 () Bool)

(assert (=> b!648902 (= e!372178 (= lt!301224 lt!301229))))

(declare-fun b!648903 () Bool)

(declare-fun res!420469 () Bool)

(assert (=> b!648903 (=> (not res!420469) (not e!372187))))

(assert (=> b!648903 (= res!420469 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18468 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!648904 () Bool)

(declare-fun res!420473 () Bool)

(assert (=> b!648904 (=> res!420473 e!372176)))

(declare-fun contains!3164 (List!12509 (_ BitVec 64)) Bool)

(assert (=> b!648904 (= res!420473 (contains!3164 Nil!12506 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!648905 () Bool)

(declare-fun res!420476 () Bool)

(declare-fun e!372179 () Bool)

(assert (=> b!648905 (=> (not res!420476) (not e!372179))))

(assert (=> b!648905 (= res!420476 (and (= (size!18832 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18832 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18832 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!648892 () Bool)

(assert (=> b!648892 (= e!372189 e!372185)))

(declare-fun res!420474 () Bool)

(assert (=> b!648892 (=> (not res!420474) (not e!372185))))

(assert (=> b!648892 (= res!420474 (arrayContainsKey!0 lt!301227 (select (arr!18468 a!2986) j!136) j!136))))

(declare-fun res!420484 () Bool)

(assert (=> start!58862 (=> (not res!420484) (not e!372179))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58862 (= res!420484 (validMask!0 mask!3053))))

(assert (=> start!58862 e!372179))

(assert (=> start!58862 true))

(declare-fun array_inv!14264 (array!38524) Bool)

(assert (=> start!58862 (array_inv!14264 a!2986)))

(declare-fun b!648906 () Bool)

(assert (=> b!648906 (= e!372180 e!372177)))

(declare-fun res!420488 () Bool)

(assert (=> b!648906 (=> res!420488 e!372177)))

(assert (=> b!648906 (= res!420488 (bvsge index!984 j!136))))

(declare-fun lt!301236 () Unit!22074)

(assert (=> b!648906 (= lt!301236 e!372183)))

(declare-fun c!74579 () Bool)

(assert (=> b!648906 (= c!74579 (bvslt j!136 index!984))))

(declare-fun b!648907 () Bool)

(declare-fun res!420481 () Bool)

(assert (=> b!648907 (=> (not res!420481) (not e!372179))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!648907 (= res!420481 (validKeyInArray!0 (select (arr!18468 a!2986) j!136)))))

(declare-fun b!648908 () Bool)

(declare-fun res!420470 () Bool)

(assert (=> b!648908 (=> (not res!420470) (not e!372179))))

(assert (=> b!648908 (= res!420470 (validKeyInArray!0 k!1786))))

(declare-fun b!648909 () Bool)

(declare-fun res!420491 () Bool)

(assert (=> b!648909 (=> res!420491 e!372176)))

(declare-fun noDuplicate!426 (List!12509) Bool)

(assert (=> b!648909 (= res!420491 (not (noDuplicate!426 Nil!12506)))))

(declare-fun b!648910 () Bool)

(declare-fun res!420472 () Bool)

(assert (=> b!648910 (=> (not res!420472) (not e!372187))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38524 (_ BitVec 32)) Bool)

(assert (=> b!648910 (= res!420472 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!648911 () Bool)

(declare-fun res!420486 () Bool)

(assert (=> b!648911 (=> res!420486 e!372176)))

(assert (=> b!648911 (= res!420486 (contains!3164 Nil!12506 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!648912 () Bool)

(declare-fun Unit!22078 () Unit!22074)

(assert (=> b!648912 (= e!372186 Unit!22078)))

(declare-fun b!648913 () Bool)

(declare-fun Unit!22079 () Unit!22074)

(assert (=> b!648913 (= e!372183 Unit!22079)))

(declare-fun lt!301240 () Unit!22074)

(assert (=> b!648913 (= lt!301240 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301227 (select (arr!18468 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!648913 (arrayContainsKey!0 lt!301227 (select (arr!18468 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!301239 () Unit!22074)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38524 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12509) Unit!22074)

(assert (=> b!648913 (= lt!301239 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12506))))

(assert (=> b!648913 (arrayNoDuplicates!0 lt!301227 #b00000000000000000000000000000000 Nil!12506)))

(declare-fun lt!301234 () Unit!22074)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38524 (_ BitVec 32) (_ BitVec 32)) Unit!22074)

(assert (=> b!648913 (= lt!301234 (lemmaNoDuplicateFromThenFromBigger!0 lt!301227 #b00000000000000000000000000000000 j!136))))

(assert (=> b!648913 (arrayNoDuplicates!0 lt!301227 j!136 Nil!12506)))

(declare-fun lt!301232 () Unit!22074)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38524 (_ BitVec 64) (_ BitVec 32) List!12509) Unit!22074)

(assert (=> b!648913 (= lt!301232 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!301227 (select (arr!18468 a!2986) j!136) j!136 Nil!12506))))

(assert (=> b!648913 false))

(declare-fun b!648914 () Bool)

(assert (=> b!648914 (= e!372188 (arrayContainsKey!0 lt!301227 (select (arr!18468 a!2986) j!136) index!984))))

(declare-fun b!648915 () Bool)

(declare-fun res!420482 () Bool)

(assert (=> b!648915 (=> (not res!420482) (not e!372179))))

(assert (=> b!648915 (= res!420482 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!648916 () Bool)

(assert (=> b!648916 (= e!372176 true)))

(declare-fun lt!301228 () Bool)

(assert (=> b!648916 (= lt!301228 (contains!3164 Nil!12506 k!1786))))

(declare-fun b!648917 () Bool)

(assert (=> b!648917 (= e!372179 e!372187)))

(declare-fun res!420485 () Bool)

(assert (=> b!648917 (=> (not res!420485) (not e!372187))))

(declare-fun lt!301233 () SeekEntryResult!6908)

(assert (=> b!648917 (= res!420485 (or (= lt!301233 (MissingZero!6908 i!1108)) (= lt!301233 (MissingVacant!6908 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38524 (_ BitVec 32)) SeekEntryResult!6908)

(assert (=> b!648917 (= lt!301233 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(assert (= (and start!58862 res!420484) b!648905))

(assert (= (and b!648905 res!420476) b!648907))

(assert (= (and b!648907 res!420481) b!648908))

(assert (= (and b!648908 res!420470) b!648915))

(assert (= (and b!648915 res!420482) b!648917))

(assert (= (and b!648917 res!420485) b!648910))

(assert (= (and b!648910 res!420472) b!648893))

(assert (= (and b!648893 res!420489) b!648903))

(assert (= (and b!648903 res!420469) b!648898))

(assert (= (and b!648898 res!420490) b!648897))

(assert (= (and b!648897 res!420479) b!648891))

(assert (= (and b!648891 res!420483) b!648902))

(assert (= (and b!648891 c!74578) b!648894))

(assert (= (and b!648891 (not c!74578)) b!648912))

(assert (= (and b!648891 (not res!420478)) b!648896))

(assert (= (and b!648896 res!420487) b!648899))

(assert (= (and b!648899 (not res!420471)) b!648892))

(assert (= (and b!648892 res!420474) b!648895))

(assert (= (and b!648896 (not res!420480)) b!648906))

(assert (= (and b!648906 c!74579) b!648913))

(assert (= (and b!648906 (not c!74579)) b!648900))

(assert (= (and b!648906 (not res!420488)) b!648901))

(assert (= (and b!648901 res!420477) b!648914))

(assert (= (and b!648901 (not res!420475)) b!648909))

(assert (= (and b!648909 (not res!420491)) b!648904))

(assert (= (and b!648904 (not res!420473)) b!648911))

(assert (= (and b!648911 (not res!420486)) b!648916))

(declare-fun m!622205 () Bool)

(assert (=> b!648913 m!622205))

(assert (=> b!648913 m!622205))

(declare-fun m!622207 () Bool)

(assert (=> b!648913 m!622207))

(assert (=> b!648913 m!622205))

(declare-fun m!622209 () Bool)

(assert (=> b!648913 m!622209))

(declare-fun m!622211 () Bool)

(assert (=> b!648913 m!622211))

(declare-fun m!622213 () Bool)

(assert (=> b!648913 m!622213))

(assert (=> b!648913 m!622205))

(declare-fun m!622215 () Bool)

(assert (=> b!648913 m!622215))

(declare-fun m!622217 () Bool)

(assert (=> b!648913 m!622217))

(declare-fun m!622219 () Bool)

(assert (=> b!648913 m!622219))

(declare-fun m!622221 () Bool)

(assert (=> b!648893 m!622221))

(declare-fun m!622223 () Bool)

(assert (=> b!648910 m!622223))

(declare-fun m!622225 () Bool)

(assert (=> b!648916 m!622225))

(assert (=> b!648901 m!622205))

(assert (=> b!648901 m!622205))

(declare-fun m!622227 () Bool)

(assert (=> b!648901 m!622227))

(assert (=> b!648901 m!622205))

(declare-fun m!622229 () Bool)

(assert (=> b!648901 m!622229))

(assert (=> b!648901 m!622205))

(declare-fun m!622231 () Bool)

(assert (=> b!648901 m!622231))

(assert (=> b!648892 m!622205))

(assert (=> b!648892 m!622205))

(assert (=> b!648892 m!622231))

(assert (=> b!648895 m!622205))

(assert (=> b!648895 m!622205))

(declare-fun m!622233 () Bool)

(assert (=> b!648895 m!622233))

(declare-fun m!622235 () Bool)

(assert (=> start!58862 m!622235))

(declare-fun m!622237 () Bool)

(assert (=> start!58862 m!622237))

(declare-fun m!622239 () Bool)

(assert (=> b!648904 m!622239))

(assert (=> b!648907 m!622205))

(assert (=> b!648907 m!622205))

(declare-fun m!622241 () Bool)

(assert (=> b!648907 m!622241))

(declare-fun m!622243 () Bool)

(assert (=> b!648891 m!622243))

(assert (=> b!648891 m!622205))

(declare-fun m!622245 () Bool)

(assert (=> b!648891 m!622245))

(declare-fun m!622247 () Bool)

(assert (=> b!648891 m!622247))

(declare-fun m!622249 () Bool)

(assert (=> b!648891 m!622249))

(assert (=> b!648891 m!622205))

(declare-fun m!622251 () Bool)

(assert (=> b!648891 m!622251))

(declare-fun m!622253 () Bool)

(assert (=> b!648891 m!622253))

(declare-fun m!622255 () Bool)

(assert (=> b!648891 m!622255))

(assert (=> b!648896 m!622205))

(assert (=> b!648896 m!622247))

(declare-fun m!622257 () Bool)

(assert (=> b!648896 m!622257))

(declare-fun m!622259 () Bool)

(assert (=> b!648897 m!622259))

(assert (=> b!648897 m!622205))

(assert (=> b!648897 m!622205))

(declare-fun m!622261 () Bool)

(assert (=> b!648897 m!622261))

(declare-fun m!622263 () Bool)

(assert (=> b!648911 m!622263))

(assert (=> b!648898 m!622247))

(declare-fun m!622265 () Bool)

(assert (=> b!648898 m!622265))

(declare-fun m!622267 () Bool)

(assert (=> b!648915 m!622267))

(assert (=> b!648914 m!622205))

(assert (=> b!648914 m!622205))

(assert (=> b!648914 m!622233))

(declare-fun m!622269 () Bool)

(assert (=> b!648909 m!622269))

(assert (=> b!648899 m!622205))

(declare-fun m!622271 () Bool)

(assert (=> b!648917 m!622271))

(declare-fun m!622273 () Bool)

(assert (=> b!648903 m!622273))

(declare-fun m!622275 () Bool)

(assert (=> b!648908 m!622275))

(push 1)

