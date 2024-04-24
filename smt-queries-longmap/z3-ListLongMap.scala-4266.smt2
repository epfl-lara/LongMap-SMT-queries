; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59394 () Bool)

(assert start!59394)

(declare-fun b!654893 () Bool)

(declare-datatypes ((Unit!22419 0))(
  ( (Unit!22420) )
))
(declare-fun e!376103 () Unit!22419)

(declare-fun Unit!22421 () Unit!22419)

(assert (=> b!654893 (= e!376103 Unit!22421)))

(declare-fun b!654894 () Bool)

(declare-fun e!376102 () Bool)

(declare-fun e!376100 () Bool)

(assert (=> b!654894 (= e!376102 (not e!376100))))

(declare-fun res!424762 () Bool)

(assert (=> b!654894 (=> res!424762 e!376100)))

(declare-datatypes ((SeekEntryResult!6919 0))(
  ( (MissingZero!6919 (index!30035 (_ BitVec 32))) (Found!6919 (index!30036 (_ BitVec 32))) (Intermediate!6919 (undefined!7731 Bool) (index!30037 (_ BitVec 32)) (x!58979 (_ BitVec 32))) (Undefined!6919) (MissingVacant!6919 (index!30038 (_ BitVec 32))) )
))
(declare-fun lt!305152 () SeekEntryResult!6919)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!654894 (= res!424762 (not (= lt!305152 (Found!6919 index!984))))))

(declare-fun lt!305149 () Unit!22419)

(declare-fun e!376099 () Unit!22419)

(assert (=> b!654894 (= lt!305149 e!376099)))

(declare-fun c!75435 () Bool)

(assert (=> b!654894 (= c!75435 (= lt!305152 Undefined!6919))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun lt!305157 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!38652 0))(
  ( (array!38653 (arr!18523 (Array (_ BitVec 32) (_ BitVec 64))) (size!18887 (_ BitVec 32))) )
))
(declare-fun lt!305164 () array!38652)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38652 (_ BitVec 32)) SeekEntryResult!6919)

(assert (=> b!654894 (= lt!305152 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!305157 lt!305164 mask!3053))))

(declare-fun e!376106 () Bool)

(assert (=> b!654894 e!376106))

(declare-fun res!424774 () Bool)

(assert (=> b!654894 (=> (not res!424774) (not e!376106))))

(declare-fun lt!305163 () (_ BitVec 32))

(declare-fun lt!305155 () SeekEntryResult!6919)

(assert (=> b!654894 (= res!424774 (= lt!305155 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!305163 vacantSpotIndex!68 lt!305157 lt!305164 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!38652)

(assert (=> b!654894 (= lt!305155 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!305163 vacantSpotIndex!68 (select (arr!18523 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!654894 (= lt!305157 (select (store (arr!18523 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!305153 () Unit!22419)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38652 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22419)

(assert (=> b!654894 (= lt!305153 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!305163 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!654894 (= lt!305163 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!654895 () Bool)

(declare-fun lt!305162 () SeekEntryResult!6919)

(assert (=> b!654895 (= e!376106 (= lt!305162 lt!305155))))

(declare-fun e!376098 () Bool)

(declare-fun b!654896 () Bool)

(declare-fun arrayContainsKey!0 (array!38652 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!654896 (= e!376098 (arrayContainsKey!0 lt!305164 (select (arr!18523 a!2986) j!136) index!984))))

(declare-fun res!424770 () Bool)

(declare-fun e!376104 () Bool)

(assert (=> start!59394 (=> (not res!424770) (not e!376104))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59394 (= res!424770 (validMask!0 mask!3053))))

(assert (=> start!59394 e!376104))

(assert (=> start!59394 true))

(declare-fun array_inv!14382 (array!38652) Bool)

(assert (=> start!59394 (array_inv!14382 a!2986)))

(declare-fun b!654897 () Bool)

(declare-fun Unit!22422 () Unit!22419)

(assert (=> b!654897 (= e!376103 Unit!22422)))

(declare-fun lt!305161 () Unit!22419)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38652 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22419)

(assert (=> b!654897 (= lt!305161 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!305164 (select (arr!18523 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!654897 (arrayContainsKey!0 lt!305164 (select (arr!18523 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!305146 () Unit!22419)

(declare-datatypes ((List!12471 0))(
  ( (Nil!12468) (Cons!12467 (h!13515 (_ BitVec 64)) (t!18691 List!12471)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38652 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12471) Unit!22419)

(assert (=> b!654897 (= lt!305146 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12468))))

(declare-fun arrayNoDuplicates!0 (array!38652 (_ BitVec 32) List!12471) Bool)

(assert (=> b!654897 (arrayNoDuplicates!0 lt!305164 #b00000000000000000000000000000000 Nil!12468)))

(declare-fun lt!305150 () Unit!22419)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38652 (_ BitVec 32) (_ BitVec 32)) Unit!22419)

(assert (=> b!654897 (= lt!305150 (lemmaNoDuplicateFromThenFromBigger!0 lt!305164 #b00000000000000000000000000000000 j!136))))

(assert (=> b!654897 (arrayNoDuplicates!0 lt!305164 j!136 Nil!12468)))

(declare-fun lt!305160 () Unit!22419)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38652 (_ BitVec 64) (_ BitVec 32) List!12471) Unit!22419)

(assert (=> b!654897 (= lt!305160 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!305164 (select (arr!18523 a!2986) j!136) j!136 Nil!12468))))

(assert (=> b!654897 false))

(declare-fun b!654898 () Bool)

(declare-fun e!376094 () Bool)

(assert (=> b!654898 (= e!376104 e!376094)))

(declare-fun res!424765 () Bool)

(assert (=> b!654898 (=> (not res!424765) (not e!376094))))

(declare-fun lt!305147 () SeekEntryResult!6919)

(assert (=> b!654898 (= res!424765 (or (= lt!305147 (MissingZero!6919 i!1108)) (= lt!305147 (MissingVacant!6919 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38652 (_ BitVec 32)) SeekEntryResult!6919)

(assert (=> b!654898 (= lt!305147 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!654899 () Bool)

(declare-fun Unit!22423 () Unit!22419)

(assert (=> b!654899 (= e!376099 Unit!22423)))

(declare-fun b!654900 () Bool)

(declare-fun res!424777 () Bool)

(assert (=> b!654900 (=> (not res!424777) (not e!376104))))

(assert (=> b!654900 (= res!424777 (and (= (size!18887 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18887 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18887 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!654901 () Bool)

(declare-fun e!376097 () Bool)

(assert (=> b!654901 (= e!376097 true)))

(assert (=> b!654901 false))

(declare-fun lt!305148 () Unit!22419)

(declare-fun e!376093 () Unit!22419)

(assert (=> b!654901 (= lt!305148 e!376093)))

(declare-fun c!75437 () Bool)

(assert (=> b!654901 (= c!75437 (bvslt index!984 j!136))))

(declare-fun lt!305145 () Unit!22419)

(assert (=> b!654901 (= lt!305145 e!376103)))

(declare-fun c!75436 () Bool)

(assert (=> b!654901 (= c!75436 (bvslt j!136 index!984))))

(declare-fun b!654902 () Bool)

(declare-fun e!376101 () Bool)

(assert (=> b!654902 (= e!376094 e!376101)))

(declare-fun res!424771 () Bool)

(assert (=> b!654902 (=> (not res!424771) (not e!376101))))

(assert (=> b!654902 (= res!424771 (= (select (store (arr!18523 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!654902 (= lt!305164 (array!38653 (store (arr!18523 a!2986) i!1108 k0!1786) (size!18887 a!2986)))))

(declare-fun b!654903 () Bool)

(assert (=> b!654903 (= e!376100 e!376097)))

(declare-fun res!424760 () Bool)

(assert (=> b!654903 (=> res!424760 e!376097)))

(declare-fun lt!305154 () (_ BitVec 64))

(assert (=> b!654903 (= res!424760 (or (not (= (select (arr!18523 a!2986) j!136) lt!305157)) (not (= (select (arr!18523 a!2986) j!136) lt!305154))))))

(declare-fun e!376096 () Bool)

(assert (=> b!654903 e!376096))

(declare-fun res!424768 () Bool)

(assert (=> b!654903 (=> (not res!424768) (not e!376096))))

(assert (=> b!654903 (= res!424768 (= lt!305154 (select (arr!18523 a!2986) j!136)))))

(assert (=> b!654903 (= lt!305154 (select (store (arr!18523 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!654904 () Bool)

(declare-fun e!376107 () Bool)

(assert (=> b!654904 (= e!376107 e!376098)))

(declare-fun res!424761 () Bool)

(assert (=> b!654904 (=> (not res!424761) (not e!376098))))

(assert (=> b!654904 (= res!424761 (arrayContainsKey!0 lt!305164 (select (arr!18523 a!2986) j!136) j!136))))

(declare-fun b!654905 () Bool)

(declare-fun res!424767 () Bool)

(assert (=> b!654905 (=> (not res!424767) (not e!376104))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!654905 (= res!424767 (validKeyInArray!0 k0!1786))))

(declare-fun b!654906 () Bool)

(declare-fun res!424766 () Bool)

(assert (=> b!654906 (=> (not res!424766) (not e!376094))))

(assert (=> b!654906 (= res!424766 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12468))))

(declare-fun b!654907 () Bool)

(declare-fun Unit!22424 () Unit!22419)

(assert (=> b!654907 (= e!376093 Unit!22424)))

(declare-fun res!424764 () Bool)

(assert (=> b!654907 (= res!424764 (arrayContainsKey!0 lt!305164 (select (arr!18523 a!2986) j!136) j!136))))

(declare-fun e!376095 () Bool)

(assert (=> b!654907 (=> (not res!424764) (not e!376095))))

(assert (=> b!654907 e!376095))

(declare-fun lt!305158 () Unit!22419)

(assert (=> b!654907 (= lt!305158 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!305164 (select (arr!18523 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!654907 (arrayContainsKey!0 lt!305164 (select (arr!18523 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!305151 () Unit!22419)

(assert (=> b!654907 (= lt!305151 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12468))))

(assert (=> b!654907 (arrayNoDuplicates!0 lt!305164 #b00000000000000000000000000000000 Nil!12468)))

(declare-fun lt!305156 () Unit!22419)

(assert (=> b!654907 (= lt!305156 (lemmaNoDuplicateFromThenFromBigger!0 lt!305164 #b00000000000000000000000000000000 index!984))))

(assert (=> b!654907 (arrayNoDuplicates!0 lt!305164 index!984 Nil!12468)))

(declare-fun lt!305159 () Unit!22419)

(assert (=> b!654907 (= lt!305159 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!305164 (select (arr!18523 a!2986) j!136) index!984 Nil!12468))))

(assert (=> b!654907 false))

(declare-fun b!654908 () Bool)

(assert (=> b!654908 (= e!376095 (arrayContainsKey!0 lt!305164 (select (arr!18523 a!2986) j!136) index!984))))

(declare-fun b!654909 () Bool)

(declare-fun res!424773 () Bool)

(assert (=> b!654909 (=> (not res!424773) (not e!376104))))

(assert (=> b!654909 (= res!424773 (validKeyInArray!0 (select (arr!18523 a!2986) j!136)))))

(declare-fun b!654910 () Bool)

(assert (=> b!654910 (= e!376096 e!376107)))

(declare-fun res!424769 () Bool)

(assert (=> b!654910 (=> res!424769 e!376107)))

(assert (=> b!654910 (= res!424769 (or (not (= (select (arr!18523 a!2986) j!136) lt!305157)) (not (= (select (arr!18523 a!2986) j!136) lt!305154)) (bvsge j!136 index!984)))))

(declare-fun b!654911 () Bool)

(declare-fun Unit!22425 () Unit!22419)

(assert (=> b!654911 (= e!376099 Unit!22425)))

(assert (=> b!654911 false))

(declare-fun b!654912 () Bool)

(declare-fun res!424763 () Bool)

(assert (=> b!654912 (=> (not res!424763) (not e!376104))))

(assert (=> b!654912 (= res!424763 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!654913 () Bool)

(assert (=> b!654913 (= e!376101 e!376102)))

(declare-fun res!424775 () Bool)

(assert (=> b!654913 (=> (not res!424775) (not e!376102))))

(assert (=> b!654913 (= res!424775 (and (= lt!305162 (Found!6919 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18523 a!2986) index!984) (select (arr!18523 a!2986) j!136))) (not (= (select (arr!18523 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!654913 (= lt!305162 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18523 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!654914 () Bool)

(declare-fun res!424772 () Bool)

(assert (=> b!654914 (=> (not res!424772) (not e!376094))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38652 (_ BitVec 32)) Bool)

(assert (=> b!654914 (= res!424772 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!654915 () Bool)

(declare-fun res!424776 () Bool)

(assert (=> b!654915 (=> (not res!424776) (not e!376094))))

(assert (=> b!654915 (= res!424776 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18523 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!654916 () Bool)

(declare-fun Unit!22426 () Unit!22419)

(assert (=> b!654916 (= e!376093 Unit!22426)))

(assert (= (and start!59394 res!424770) b!654900))

(assert (= (and b!654900 res!424777) b!654909))

(assert (= (and b!654909 res!424773) b!654905))

(assert (= (and b!654905 res!424767) b!654912))

(assert (= (and b!654912 res!424763) b!654898))

(assert (= (and b!654898 res!424765) b!654914))

(assert (= (and b!654914 res!424772) b!654906))

(assert (= (and b!654906 res!424766) b!654915))

(assert (= (and b!654915 res!424776) b!654902))

(assert (= (and b!654902 res!424771) b!654913))

(assert (= (and b!654913 res!424775) b!654894))

(assert (= (and b!654894 res!424774) b!654895))

(assert (= (and b!654894 c!75435) b!654911))

(assert (= (and b!654894 (not c!75435)) b!654899))

(assert (= (and b!654894 (not res!424762)) b!654903))

(assert (= (and b!654903 res!424768) b!654910))

(assert (= (and b!654910 (not res!424769)) b!654904))

(assert (= (and b!654904 res!424761) b!654896))

(assert (= (and b!654903 (not res!424760)) b!654901))

(assert (= (and b!654901 c!75436) b!654897))

(assert (= (and b!654901 (not c!75436)) b!654893))

(assert (= (and b!654901 c!75437) b!654907))

(assert (= (and b!654901 (not c!75437)) b!654916))

(assert (= (and b!654907 res!424764) b!654908))

(declare-fun m!628447 () Bool)

(assert (=> b!654894 m!628447))

(declare-fun m!628449 () Bool)

(assert (=> b!654894 m!628449))

(declare-fun m!628451 () Bool)

(assert (=> b!654894 m!628451))

(declare-fun m!628453 () Bool)

(assert (=> b!654894 m!628453))

(assert (=> b!654894 m!628451))

(declare-fun m!628455 () Bool)

(assert (=> b!654894 m!628455))

(declare-fun m!628457 () Bool)

(assert (=> b!654894 m!628457))

(declare-fun m!628459 () Bool)

(assert (=> b!654894 m!628459))

(declare-fun m!628461 () Bool)

(assert (=> b!654894 m!628461))

(declare-fun m!628463 () Bool)

(assert (=> b!654906 m!628463))

(declare-fun m!628465 () Bool)

(assert (=> start!59394 m!628465))

(declare-fun m!628467 () Bool)

(assert (=> start!59394 m!628467))

(assert (=> b!654907 m!628451))

(declare-fun m!628469 () Bool)

(assert (=> b!654907 m!628469))

(assert (=> b!654907 m!628451))

(declare-fun m!628471 () Bool)

(assert (=> b!654907 m!628471))

(declare-fun m!628473 () Bool)

(assert (=> b!654907 m!628473))

(declare-fun m!628475 () Bool)

(assert (=> b!654907 m!628475))

(assert (=> b!654907 m!628451))

(declare-fun m!628477 () Bool)

(assert (=> b!654907 m!628477))

(assert (=> b!654907 m!628451))

(declare-fun m!628479 () Bool)

(assert (=> b!654907 m!628479))

(declare-fun m!628481 () Bool)

(assert (=> b!654907 m!628481))

(declare-fun m!628483 () Bool)

(assert (=> b!654907 m!628483))

(assert (=> b!654907 m!628451))

(declare-fun m!628485 () Bool)

(assert (=> b!654905 m!628485))

(assert (=> b!654909 m!628451))

(assert (=> b!654909 m!628451))

(declare-fun m!628487 () Bool)

(assert (=> b!654909 m!628487))

(declare-fun m!628489 () Bool)

(assert (=> b!654898 m!628489))

(assert (=> b!654897 m!628451))

(assert (=> b!654897 m!628451))

(declare-fun m!628491 () Bool)

(assert (=> b!654897 m!628491))

(declare-fun m!628493 () Bool)

(assert (=> b!654897 m!628493))

(assert (=> b!654897 m!628475))

(assert (=> b!654897 m!628451))

(declare-fun m!628495 () Bool)

(assert (=> b!654897 m!628495))

(assert (=> b!654897 m!628451))

(declare-fun m!628497 () Bool)

(assert (=> b!654897 m!628497))

(declare-fun m!628499 () Bool)

(assert (=> b!654897 m!628499))

(assert (=> b!654897 m!628481))

(declare-fun m!628501 () Bool)

(assert (=> b!654912 m!628501))

(assert (=> b!654910 m!628451))

(declare-fun m!628503 () Bool)

(assert (=> b!654913 m!628503))

(assert (=> b!654913 m!628451))

(assert (=> b!654913 m!628451))

(declare-fun m!628505 () Bool)

(assert (=> b!654913 m!628505))

(assert (=> b!654908 m!628451))

(assert (=> b!654908 m!628451))

(declare-fun m!628507 () Bool)

(assert (=> b!654908 m!628507))

(assert (=> b!654903 m!628451))

(assert (=> b!654903 m!628457))

(declare-fun m!628509 () Bool)

(assert (=> b!654903 m!628509))

(assert (=> b!654902 m!628457))

(declare-fun m!628511 () Bool)

(assert (=> b!654902 m!628511))

(assert (=> b!654904 m!628451))

(assert (=> b!654904 m!628451))

(assert (=> b!654904 m!628471))

(assert (=> b!654896 m!628451))

(assert (=> b!654896 m!628451))

(assert (=> b!654896 m!628507))

(declare-fun m!628513 () Bool)

(assert (=> b!654914 m!628513))

(declare-fun m!628515 () Bool)

(assert (=> b!654915 m!628515))

(check-sat (not b!654912) (not b!654913) (not b!654908) (not b!654906) (not b!654897) (not b!654898) (not b!654905) (not start!59394) (not b!654907) (not b!654909) (not b!654904) (not b!654894) (not b!654896) (not b!654914))
(check-sat)
