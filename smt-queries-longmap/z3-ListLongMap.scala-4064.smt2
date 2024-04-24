; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55662 () Bool)

(assert start!55662)

(declare-fun b!610134 () Bool)

(declare-fun e!349479 () Bool)

(declare-fun e!349471 () Bool)

(assert (=> b!610134 (= e!349479 e!349471)))

(declare-fun res!392482 () Bool)

(assert (=> b!610134 (=> (not res!392482) (not e!349471))))

(declare-datatypes ((SeekEntryResult!6313 0))(
  ( (MissingZero!6313 (index!27527 (_ BitVec 32))) (Found!6313 (index!27528 (_ BitVec 32))) (Intermediate!6313 (undefined!7125 Bool) (index!27529 (_ BitVec 32)) (x!56481 (_ BitVec 32))) (Undefined!6313) (MissingVacant!6313 (index!27530 (_ BitVec 32))) )
))
(declare-fun lt!279024 () SeekEntryResult!6313)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!610134 (= res!392482 (or (= lt!279024 (MissingZero!6313 i!1108)) (= lt!279024 (MissingVacant!6313 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!37338 0))(
  ( (array!37339 (arr!17917 (Array (_ BitVec 32) (_ BitVec 64))) (size!18281 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37338)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37338 (_ BitVec 32)) SeekEntryResult!6313)

(assert (=> b!610134 (= lt!279024 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!610135 () Bool)

(declare-fun e!349470 () Bool)

(declare-fun e!349475 () Bool)

(assert (=> b!610135 (= e!349470 e!349475)))

(declare-fun res!392479 () Bool)

(assert (=> b!610135 (=> (not res!392479) (not e!349475))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!279025 () array!37338)

(declare-fun arrayContainsKey!0 (array!37338 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!610135 (= res!392479 (arrayContainsKey!0 lt!279025 (select (arr!17917 a!2986) j!136) j!136))))

(declare-fun b!610136 () Bool)

(declare-fun res!392473 () Bool)

(assert (=> b!610136 (=> (not res!392473) (not e!349471))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37338 (_ BitVec 32)) Bool)

(assert (=> b!610136 (= res!392473 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!392478 () Bool)

(assert (=> start!55662 (=> (not res!392478) (not e!349479))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55662 (= res!392478 (validMask!0 mask!3053))))

(assert (=> start!55662 e!349479))

(assert (=> start!55662 true))

(declare-fun array_inv!13776 (array!37338) Bool)

(assert (=> start!55662 (array_inv!13776 a!2986)))

(declare-fun b!610137 () Bool)

(declare-fun res!392474 () Bool)

(assert (=> b!610137 (=> (not res!392474) (not e!349479))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!610137 (= res!392474 (validKeyInArray!0 (select (arr!17917 a!2986) j!136)))))

(declare-fun b!610138 () Bool)

(declare-fun e!349469 () Bool)

(declare-fun e!349468 () Bool)

(assert (=> b!610138 (= e!349469 e!349468)))

(declare-fun res!392488 () Bool)

(assert (=> b!610138 (=> (not res!392488) (not e!349468))))

(declare-fun lt!279026 () SeekEntryResult!6313)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!610138 (= res!392488 (and (= lt!279026 (Found!6313 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17917 a!2986) index!984) (select (arr!17917 a!2986) j!136))) (not (= (select (arr!17917 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37338 (_ BitVec 32)) SeekEntryResult!6313)

(assert (=> b!610138 (= lt!279026 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17917 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!610139 () Bool)

(declare-fun res!392477 () Bool)

(assert (=> b!610139 (=> (not res!392477) (not e!349479))))

(assert (=> b!610139 (= res!392477 (validKeyInArray!0 k0!1786))))

(declare-fun b!610140 () Bool)

(declare-datatypes ((Unit!19531 0))(
  ( (Unit!19532) )
))
(declare-fun e!349473 () Unit!19531)

(declare-fun Unit!19533 () Unit!19531)

(assert (=> b!610140 (= e!349473 Unit!19533)))

(declare-fun b!610141 () Bool)

(assert (=> b!610141 (= e!349475 (arrayContainsKey!0 lt!279025 (select (arr!17917 a!2986) j!136) index!984))))

(declare-fun b!610142 () Bool)

(declare-fun e!349476 () Bool)

(assert (=> b!610142 (= e!349468 (not e!349476))))

(declare-fun res!392491 () Bool)

(assert (=> b!610142 (=> res!392491 e!349476)))

(declare-fun lt!279020 () SeekEntryResult!6313)

(assert (=> b!610142 (= res!392491 (not (= lt!279020 (Found!6313 index!984))))))

(declare-fun lt!279030 () Unit!19531)

(assert (=> b!610142 (= lt!279030 e!349473)))

(declare-fun c!69200 () Bool)

(assert (=> b!610142 (= c!69200 (= lt!279020 Undefined!6313))))

(declare-fun lt!279032 () (_ BitVec 64))

(assert (=> b!610142 (= lt!279020 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!279032 lt!279025 mask!3053))))

(declare-fun e!349482 () Bool)

(assert (=> b!610142 e!349482))

(declare-fun res!392483 () Bool)

(assert (=> b!610142 (=> (not res!392483) (not e!349482))))

(declare-fun lt!279034 () SeekEntryResult!6313)

(declare-fun lt!279033 () (_ BitVec 32))

(assert (=> b!610142 (= res!392483 (= lt!279034 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279033 vacantSpotIndex!68 lt!279032 lt!279025 mask!3053)))))

(assert (=> b!610142 (= lt!279034 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279033 vacantSpotIndex!68 (select (arr!17917 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!610142 (= lt!279032 (select (store (arr!17917 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!279019 () Unit!19531)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37338 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19531)

(assert (=> b!610142 (= lt!279019 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!279033 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!610142 (= lt!279033 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!610143 () Bool)

(declare-fun res!392485 () Bool)

(assert (=> b!610143 (=> (not res!392485) (not e!349471))))

(assert (=> b!610143 (= res!392485 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17917 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!610144 () Bool)

(declare-fun e!349481 () Bool)

(assert (=> b!610144 (= e!349481 e!349470)))

(declare-fun res!392480 () Bool)

(assert (=> b!610144 (=> res!392480 e!349470)))

(declare-fun lt!279029 () (_ BitVec 64))

(assert (=> b!610144 (= res!392480 (or (not (= (select (arr!17917 a!2986) j!136) lt!279032)) (not (= (select (arr!17917 a!2986) j!136) lt!279029)) (bvsge j!136 index!984)))))

(declare-fun b!610145 () Bool)

(declare-fun Unit!19534 () Unit!19531)

(assert (=> b!610145 (= e!349473 Unit!19534)))

(assert (=> b!610145 false))

(declare-fun b!610146 () Bool)

(declare-fun e!349478 () Bool)

(assert (=> b!610146 (= e!349478 (or (bvsgt #b00000000000000000000000000000000 (size!18281 a!2986)) (bvslt (size!18281 a!2986) #b01111111111111111111111111111111)))))

(declare-datatypes ((List!11865 0))(
  ( (Nil!11862) (Cons!11861 (h!12909 (_ BitVec 64)) (t!18085 List!11865)) )
))
(declare-fun arrayNoDuplicates!0 (array!37338 (_ BitVec 32) List!11865) Bool)

(assert (=> b!610146 (arrayNoDuplicates!0 lt!279025 #b00000000000000000000000000000000 Nil!11862)))

(declare-fun lt!279023 () Unit!19531)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37338 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11865) Unit!19531)

(assert (=> b!610146 (= lt!279023 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11862))))

(assert (=> b!610146 (arrayContainsKey!0 lt!279025 (select (arr!17917 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!279028 () Unit!19531)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37338 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19531)

(assert (=> b!610146 (= lt!279028 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!279025 (select (arr!17917 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!349474 () Bool)

(assert (=> b!610146 e!349474))

(declare-fun res!392475 () Bool)

(assert (=> b!610146 (=> (not res!392475) (not e!349474))))

(assert (=> b!610146 (= res!392475 (arrayContainsKey!0 lt!279025 (select (arr!17917 a!2986) j!136) j!136))))

(declare-fun b!610147 () Bool)

(assert (=> b!610147 (= e!349471 e!349469)))

(declare-fun res!392486 () Bool)

(assert (=> b!610147 (=> (not res!392486) (not e!349469))))

(assert (=> b!610147 (= res!392486 (= (select (store (arr!17917 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!610147 (= lt!279025 (array!37339 (store (arr!17917 a!2986) i!1108 k0!1786) (size!18281 a!2986)))))

(declare-fun b!610148 () Bool)

(declare-fun res!392489 () Bool)

(assert (=> b!610148 (=> (not res!392489) (not e!349479))))

(assert (=> b!610148 (= res!392489 (and (= (size!18281 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18281 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18281 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!610149 () Bool)

(declare-fun res!392487 () Bool)

(assert (=> b!610149 (=> (not res!392487) (not e!349479))))

(assert (=> b!610149 (= res!392487 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!610150 () Bool)

(assert (=> b!610150 (= e!349482 (= lt!279026 lt!279034))))

(declare-fun b!610151 () Bool)

(assert (=> b!610151 (= e!349474 (arrayContainsKey!0 lt!279025 (select (arr!17917 a!2986) j!136) index!984))))

(declare-fun b!610152 () Bool)

(declare-fun res!392484 () Bool)

(assert (=> b!610152 (=> (not res!392484) (not e!349471))))

(assert (=> b!610152 (= res!392484 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11862))))

(declare-fun b!610153 () Bool)

(declare-fun e!349480 () Bool)

(assert (=> b!610153 (= e!349476 e!349480)))

(declare-fun res!392490 () Bool)

(assert (=> b!610153 (=> res!392490 e!349480)))

(assert (=> b!610153 (= res!392490 (or (not (= (select (arr!17917 a!2986) j!136) lt!279032)) (not (= (select (arr!17917 a!2986) j!136) lt!279029))))))

(assert (=> b!610153 e!349481))

(declare-fun res!392476 () Bool)

(assert (=> b!610153 (=> (not res!392476) (not e!349481))))

(assert (=> b!610153 (= res!392476 (= lt!279029 (select (arr!17917 a!2986) j!136)))))

(assert (=> b!610153 (= lt!279029 (select (store (arr!17917 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!610154 () Bool)

(assert (=> b!610154 (= e!349480 e!349478)))

(declare-fun res!392481 () Bool)

(assert (=> b!610154 (=> res!392481 e!349478)))

(assert (=> b!610154 (= res!392481 (bvsge index!984 j!136))))

(declare-fun lt!279022 () Unit!19531)

(declare-fun e!349472 () Unit!19531)

(assert (=> b!610154 (= lt!279022 e!349472)))

(declare-fun c!69199 () Bool)

(assert (=> b!610154 (= c!69199 (bvslt j!136 index!984))))

(declare-fun b!610155 () Bool)

(declare-fun Unit!19535 () Unit!19531)

(assert (=> b!610155 (= e!349472 Unit!19535)))

(declare-fun lt!279027 () Unit!19531)

(assert (=> b!610155 (= lt!279027 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!279025 (select (arr!17917 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!610155 (arrayContainsKey!0 lt!279025 (select (arr!17917 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!279021 () Unit!19531)

(assert (=> b!610155 (= lt!279021 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11862))))

(assert (=> b!610155 (arrayNoDuplicates!0 lt!279025 #b00000000000000000000000000000000 Nil!11862)))

(declare-fun lt!279031 () Unit!19531)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37338 (_ BitVec 32) (_ BitVec 32)) Unit!19531)

(assert (=> b!610155 (= lt!279031 (lemmaNoDuplicateFromThenFromBigger!0 lt!279025 #b00000000000000000000000000000000 j!136))))

(assert (=> b!610155 (arrayNoDuplicates!0 lt!279025 j!136 Nil!11862)))

(declare-fun lt!279018 () Unit!19531)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37338 (_ BitVec 64) (_ BitVec 32) List!11865) Unit!19531)

(assert (=> b!610155 (= lt!279018 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!279025 (select (arr!17917 a!2986) j!136) j!136 Nil!11862))))

(assert (=> b!610155 false))

(declare-fun b!610156 () Bool)

(declare-fun Unit!19536 () Unit!19531)

(assert (=> b!610156 (= e!349472 Unit!19536)))

(assert (= (and start!55662 res!392478) b!610148))

(assert (= (and b!610148 res!392489) b!610137))

(assert (= (and b!610137 res!392474) b!610139))

(assert (= (and b!610139 res!392477) b!610149))

(assert (= (and b!610149 res!392487) b!610134))

(assert (= (and b!610134 res!392482) b!610136))

(assert (= (and b!610136 res!392473) b!610152))

(assert (= (and b!610152 res!392484) b!610143))

(assert (= (and b!610143 res!392485) b!610147))

(assert (= (and b!610147 res!392486) b!610138))

(assert (= (and b!610138 res!392488) b!610142))

(assert (= (and b!610142 res!392483) b!610150))

(assert (= (and b!610142 c!69200) b!610145))

(assert (= (and b!610142 (not c!69200)) b!610140))

(assert (= (and b!610142 (not res!392491)) b!610153))

(assert (= (and b!610153 res!392476) b!610144))

(assert (= (and b!610144 (not res!392480)) b!610135))

(assert (= (and b!610135 res!392479) b!610141))

(assert (= (and b!610153 (not res!392490)) b!610154))

(assert (= (and b!610154 c!69199) b!610155))

(assert (= (and b!610154 (not c!69199)) b!610156))

(assert (= (and b!610154 (not res!392481)) b!610146))

(assert (= (and b!610146 res!392475) b!610151))

(declare-fun m!586871 () Bool)

(assert (=> start!55662 m!586871))

(declare-fun m!586873 () Bool)

(assert (=> start!55662 m!586873))

(declare-fun m!586875 () Bool)

(assert (=> b!610151 m!586875))

(assert (=> b!610151 m!586875))

(declare-fun m!586877 () Bool)

(assert (=> b!610151 m!586877))

(assert (=> b!610135 m!586875))

(assert (=> b!610135 m!586875))

(declare-fun m!586879 () Bool)

(assert (=> b!610135 m!586879))

(declare-fun m!586881 () Bool)

(assert (=> b!610136 m!586881))

(declare-fun m!586883 () Bool)

(assert (=> b!610142 m!586883))

(assert (=> b!610142 m!586875))

(declare-fun m!586885 () Bool)

(assert (=> b!610142 m!586885))

(declare-fun m!586887 () Bool)

(assert (=> b!610142 m!586887))

(declare-fun m!586889 () Bool)

(assert (=> b!610142 m!586889))

(assert (=> b!610142 m!586875))

(declare-fun m!586891 () Bool)

(assert (=> b!610142 m!586891))

(declare-fun m!586893 () Bool)

(assert (=> b!610142 m!586893))

(declare-fun m!586895 () Bool)

(assert (=> b!610142 m!586895))

(assert (=> b!610144 m!586875))

(declare-fun m!586897 () Bool)

(assert (=> b!610152 m!586897))

(assert (=> b!610147 m!586895))

(declare-fun m!586899 () Bool)

(assert (=> b!610147 m!586899))

(assert (=> b!610146 m!586875))

(assert (=> b!610146 m!586875))

(assert (=> b!610146 m!586879))

(assert (=> b!610146 m!586875))

(declare-fun m!586901 () Bool)

(assert (=> b!610146 m!586901))

(declare-fun m!586903 () Bool)

(assert (=> b!610146 m!586903))

(assert (=> b!610146 m!586875))

(declare-fun m!586905 () Bool)

(assert (=> b!610146 m!586905))

(declare-fun m!586907 () Bool)

(assert (=> b!610146 m!586907))

(assert (=> b!610137 m!586875))

(assert (=> b!610137 m!586875))

(declare-fun m!586909 () Bool)

(assert (=> b!610137 m!586909))

(declare-fun m!586911 () Bool)

(assert (=> b!610155 m!586911))

(assert (=> b!610155 m!586875))

(assert (=> b!610155 m!586907))

(assert (=> b!610155 m!586875))

(declare-fun m!586913 () Bool)

(assert (=> b!610155 m!586913))

(declare-fun m!586915 () Bool)

(assert (=> b!610155 m!586915))

(assert (=> b!610155 m!586875))

(declare-fun m!586917 () Bool)

(assert (=> b!610155 m!586917))

(assert (=> b!610155 m!586875))

(declare-fun m!586919 () Bool)

(assert (=> b!610155 m!586919))

(assert (=> b!610155 m!586903))

(declare-fun m!586921 () Bool)

(assert (=> b!610134 m!586921))

(declare-fun m!586923 () Bool)

(assert (=> b!610143 m!586923))

(declare-fun m!586925 () Bool)

(assert (=> b!610138 m!586925))

(assert (=> b!610138 m!586875))

(assert (=> b!610138 m!586875))

(declare-fun m!586927 () Bool)

(assert (=> b!610138 m!586927))

(declare-fun m!586929 () Bool)

(assert (=> b!610139 m!586929))

(assert (=> b!610153 m!586875))

(assert (=> b!610153 m!586895))

(declare-fun m!586931 () Bool)

(assert (=> b!610153 m!586931))

(declare-fun m!586933 () Bool)

(assert (=> b!610149 m!586933))

(assert (=> b!610141 m!586875))

(assert (=> b!610141 m!586875))

(assert (=> b!610141 m!586877))

(check-sat (not b!610152) (not b!610146) (not b!610134) (not b!610137) (not b!610135) (not b!610136) (not b!610138) (not b!610139) (not b!610151) (not b!610155) (not start!55662) (not b!610141) (not b!610149) (not b!610142))
(check-sat)
(get-model)

(declare-fun d!88207 () Bool)

(declare-fun lt!279143 () SeekEntryResult!6313)

(get-info :version)

(assert (=> d!88207 (and (or ((_ is Undefined!6313) lt!279143) (not ((_ is Found!6313) lt!279143)) (and (bvsge (index!27528 lt!279143) #b00000000000000000000000000000000) (bvslt (index!27528 lt!279143) (size!18281 a!2986)))) (or ((_ is Undefined!6313) lt!279143) ((_ is Found!6313) lt!279143) (not ((_ is MissingZero!6313) lt!279143)) (and (bvsge (index!27527 lt!279143) #b00000000000000000000000000000000) (bvslt (index!27527 lt!279143) (size!18281 a!2986)))) (or ((_ is Undefined!6313) lt!279143) ((_ is Found!6313) lt!279143) ((_ is MissingZero!6313) lt!279143) (not ((_ is MissingVacant!6313) lt!279143)) (and (bvsge (index!27530 lt!279143) #b00000000000000000000000000000000) (bvslt (index!27530 lt!279143) (size!18281 a!2986)))) (or ((_ is Undefined!6313) lt!279143) (ite ((_ is Found!6313) lt!279143) (= (select (arr!17917 a!2986) (index!27528 lt!279143)) k0!1786) (ite ((_ is MissingZero!6313) lt!279143) (= (select (arr!17917 a!2986) (index!27527 lt!279143)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6313) lt!279143) (= (select (arr!17917 a!2986) (index!27530 lt!279143)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!349580 () SeekEntryResult!6313)

(assert (=> d!88207 (= lt!279143 e!349580)))

(declare-fun c!69219 () Bool)

(declare-fun lt!279145 () SeekEntryResult!6313)

(assert (=> d!88207 (= c!69219 (and ((_ is Intermediate!6313) lt!279145) (undefined!7125 lt!279145)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37338 (_ BitVec 32)) SeekEntryResult!6313)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!88207 (= lt!279145 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!88207 (validMask!0 mask!3053)))

(assert (=> d!88207 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!279143)))

(declare-fun b!610307 () Bool)

(assert (=> b!610307 (= e!349580 Undefined!6313)))

(declare-fun b!610308 () Bool)

(declare-fun e!349579 () SeekEntryResult!6313)

(assert (=> b!610308 (= e!349579 (MissingZero!6313 (index!27529 lt!279145)))))

(declare-fun b!610309 () Bool)

(assert (=> b!610309 (= e!349579 (seekKeyOrZeroReturnVacant!0 (x!56481 lt!279145) (index!27529 lt!279145) (index!27529 lt!279145) k0!1786 a!2986 mask!3053))))

(declare-fun b!610310 () Bool)

(declare-fun c!69220 () Bool)

(declare-fun lt!279144 () (_ BitVec 64))

(assert (=> b!610310 (= c!69220 (= lt!279144 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!349581 () SeekEntryResult!6313)

(assert (=> b!610310 (= e!349581 e!349579)))

(declare-fun b!610311 () Bool)

(assert (=> b!610311 (= e!349581 (Found!6313 (index!27529 lt!279145)))))

(declare-fun b!610312 () Bool)

(assert (=> b!610312 (= e!349580 e!349581)))

(assert (=> b!610312 (= lt!279144 (select (arr!17917 a!2986) (index!27529 lt!279145)))))

(declare-fun c!69221 () Bool)

(assert (=> b!610312 (= c!69221 (= lt!279144 k0!1786))))

(assert (= (and d!88207 c!69219) b!610307))

(assert (= (and d!88207 (not c!69219)) b!610312))

(assert (= (and b!610312 c!69221) b!610311))

(assert (= (and b!610312 (not c!69221)) b!610310))

(assert (= (and b!610310 c!69220) b!610308))

(assert (= (and b!610310 (not c!69220)) b!610309))

(declare-fun m!587063 () Bool)

(assert (=> d!88207 m!587063))

(declare-fun m!587065 () Bool)

(assert (=> d!88207 m!587065))

(assert (=> d!88207 m!587065))

(declare-fun m!587067 () Bool)

(assert (=> d!88207 m!587067))

(declare-fun m!587069 () Bool)

(assert (=> d!88207 m!587069))

(declare-fun m!587071 () Bool)

(assert (=> d!88207 m!587071))

(assert (=> d!88207 m!586871))

(declare-fun m!587073 () Bool)

(assert (=> b!610309 m!587073))

(declare-fun m!587075 () Bool)

(assert (=> b!610312 m!587075))

(assert (=> b!610134 d!88207))

(declare-fun b!610324 () Bool)

(declare-fun e!349590 () Bool)

(declare-fun e!349592 () Bool)

(assert (=> b!610324 (= e!349590 e!349592)))

(declare-fun c!69224 () Bool)

(assert (=> b!610324 (= c!69224 (validKeyInArray!0 (select (arr!17917 lt!279025) j!136)))))

(declare-fun bm!33114 () Bool)

(declare-fun call!33117 () Bool)

(assert (=> bm!33114 (= call!33117 (arrayNoDuplicates!0 lt!279025 (bvadd j!136 #b00000000000000000000000000000001) (ite c!69224 (Cons!11861 (select (arr!17917 lt!279025) j!136) Nil!11862) Nil!11862)))))

(declare-fun b!610325 () Bool)

(declare-fun e!349593 () Bool)

(assert (=> b!610325 (= e!349593 e!349590)))

(declare-fun res!392613 () Bool)

(assert (=> b!610325 (=> (not res!392613) (not e!349590))))

(declare-fun e!349591 () Bool)

(assert (=> b!610325 (= res!392613 (not e!349591))))

(declare-fun res!392614 () Bool)

(assert (=> b!610325 (=> (not res!392614) (not e!349591))))

(assert (=> b!610325 (= res!392614 (validKeyInArray!0 (select (arr!17917 lt!279025) j!136)))))

(declare-fun d!88209 () Bool)

(declare-fun res!392612 () Bool)

(assert (=> d!88209 (=> res!392612 e!349593)))

(assert (=> d!88209 (= res!392612 (bvsge j!136 (size!18281 lt!279025)))))

(assert (=> d!88209 (= (arrayNoDuplicates!0 lt!279025 j!136 Nil!11862) e!349593)))

(declare-fun b!610323 () Bool)

(declare-fun contains!3012 (List!11865 (_ BitVec 64)) Bool)

(assert (=> b!610323 (= e!349591 (contains!3012 Nil!11862 (select (arr!17917 lt!279025) j!136)))))

(declare-fun b!610326 () Bool)

(assert (=> b!610326 (= e!349592 call!33117)))

(declare-fun b!610327 () Bool)

(assert (=> b!610327 (= e!349592 call!33117)))

(assert (= (and d!88209 (not res!392612)) b!610325))

(assert (= (and b!610325 res!392614) b!610323))

(assert (= (and b!610325 res!392613) b!610324))

(assert (= (and b!610324 c!69224) b!610327))

(assert (= (and b!610324 (not c!69224)) b!610326))

(assert (= (or b!610327 b!610326) bm!33114))

(declare-fun m!587077 () Bool)

(assert (=> b!610324 m!587077))

(assert (=> b!610324 m!587077))

(declare-fun m!587079 () Bool)

(assert (=> b!610324 m!587079))

(assert (=> bm!33114 m!587077))

(declare-fun m!587081 () Bool)

(assert (=> bm!33114 m!587081))

(assert (=> b!610325 m!587077))

(assert (=> b!610325 m!587077))

(assert (=> b!610325 m!587079))

(assert (=> b!610323 m!587077))

(assert (=> b!610323 m!587077))

(declare-fun m!587083 () Bool)

(assert (=> b!610323 m!587083))

(assert (=> b!610155 d!88209))

(declare-fun d!88211 () Bool)

(declare-fun res!392619 () Bool)

(declare-fun e!349598 () Bool)

(assert (=> d!88211 (=> res!392619 e!349598)))

(assert (=> d!88211 (= res!392619 (= (select (arr!17917 lt!279025) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17917 a!2986) j!136)))))

(assert (=> d!88211 (= (arrayContainsKey!0 lt!279025 (select (arr!17917 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!349598)))

(declare-fun b!610332 () Bool)

(declare-fun e!349599 () Bool)

(assert (=> b!610332 (= e!349598 e!349599)))

(declare-fun res!392620 () Bool)

(assert (=> b!610332 (=> (not res!392620) (not e!349599))))

(assert (=> b!610332 (= res!392620 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18281 lt!279025)))))

(declare-fun b!610333 () Bool)

(assert (=> b!610333 (= e!349599 (arrayContainsKey!0 lt!279025 (select (arr!17917 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!88211 (not res!392619)) b!610332))

(assert (= (and b!610332 res!392620) b!610333))

(declare-fun m!587085 () Bool)

(assert (=> d!88211 m!587085))

(assert (=> b!610333 m!586875))

(declare-fun m!587087 () Bool)

(assert (=> b!610333 m!587087))

(assert (=> b!610155 d!88211))

(declare-fun d!88213 () Bool)

(assert (=> d!88213 (arrayNoDuplicates!0 lt!279025 j!136 Nil!11862)))

(declare-fun lt!279148 () Unit!19531)

(declare-fun choose!39 (array!37338 (_ BitVec 32) (_ BitVec 32)) Unit!19531)

(assert (=> d!88213 (= lt!279148 (choose!39 lt!279025 #b00000000000000000000000000000000 j!136))))

(assert (=> d!88213 (bvslt (size!18281 lt!279025) #b01111111111111111111111111111111)))

(assert (=> d!88213 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!279025 #b00000000000000000000000000000000 j!136) lt!279148)))

(declare-fun bs!18629 () Bool)

(assert (= bs!18629 d!88213))

(assert (=> bs!18629 m!586915))

(declare-fun m!587089 () Bool)

(assert (=> bs!18629 m!587089))

(assert (=> b!610155 d!88213))

(declare-fun d!88215 () Bool)

(assert (=> d!88215 (arrayContainsKey!0 lt!279025 (select (arr!17917 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!279151 () Unit!19531)

(declare-fun choose!114 (array!37338 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19531)

(assert (=> d!88215 (= lt!279151 (choose!114 lt!279025 (select (arr!17917 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!88215 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!88215 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!279025 (select (arr!17917 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!279151)))

(declare-fun bs!18630 () Bool)

(assert (= bs!18630 d!88215))

(assert (=> bs!18630 m!586875))

(assert (=> bs!18630 m!586913))

(assert (=> bs!18630 m!586875))

(declare-fun m!587091 () Bool)

(assert (=> bs!18630 m!587091))

(assert (=> b!610155 d!88215))

(declare-fun d!88217 () Bool)

(declare-fun e!349602 () Bool)

(assert (=> d!88217 e!349602))

(declare-fun res!392623 () Bool)

(assert (=> d!88217 (=> (not res!392623) (not e!349602))))

(assert (=> d!88217 (= res!392623 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18281 a!2986))))))

(declare-fun lt!279154 () Unit!19531)

(declare-fun choose!41 (array!37338 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11865) Unit!19531)

(assert (=> d!88217 (= lt!279154 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11862))))

(assert (=> d!88217 (bvslt (size!18281 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!88217 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11862) lt!279154)))

(declare-fun b!610336 () Bool)

(assert (=> b!610336 (= e!349602 (arrayNoDuplicates!0 (array!37339 (store (arr!17917 a!2986) i!1108 k0!1786) (size!18281 a!2986)) #b00000000000000000000000000000000 Nil!11862))))

(assert (= (and d!88217 res!392623) b!610336))

(declare-fun m!587093 () Bool)

(assert (=> d!88217 m!587093))

(assert (=> b!610336 m!586895))

(declare-fun m!587095 () Bool)

(assert (=> b!610336 m!587095))

(assert (=> b!610155 d!88217))

(declare-fun d!88219 () Bool)

(assert (=> d!88219 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18281 lt!279025)) (not (= (select (arr!17917 lt!279025) j!136) (select (arr!17917 a!2986) j!136))))))

(declare-fun lt!279157 () Unit!19531)

(declare-fun choose!21 (array!37338 (_ BitVec 64) (_ BitVec 32) List!11865) Unit!19531)

(assert (=> d!88219 (= lt!279157 (choose!21 lt!279025 (select (arr!17917 a!2986) j!136) j!136 Nil!11862))))

(assert (=> d!88219 (bvslt (size!18281 lt!279025) #b01111111111111111111111111111111)))

(assert (=> d!88219 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!279025 (select (arr!17917 a!2986) j!136) j!136 Nil!11862) lt!279157)))

(declare-fun bs!18631 () Bool)

(assert (= bs!18631 d!88219))

(assert (=> bs!18631 m!587077))

(assert (=> bs!18631 m!586875))

(declare-fun m!587097 () Bool)

(assert (=> bs!18631 m!587097))

(assert (=> b!610155 d!88219))

(declare-fun b!610338 () Bool)

(declare-fun e!349603 () Bool)

(declare-fun e!349605 () Bool)

(assert (=> b!610338 (= e!349603 e!349605)))

(declare-fun c!69225 () Bool)

(assert (=> b!610338 (= c!69225 (validKeyInArray!0 (select (arr!17917 lt!279025) #b00000000000000000000000000000000)))))

(declare-fun bm!33115 () Bool)

(declare-fun call!33118 () Bool)

(assert (=> bm!33115 (= call!33118 (arrayNoDuplicates!0 lt!279025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!69225 (Cons!11861 (select (arr!17917 lt!279025) #b00000000000000000000000000000000) Nil!11862) Nil!11862)))))

(declare-fun b!610339 () Bool)

(declare-fun e!349606 () Bool)

(assert (=> b!610339 (= e!349606 e!349603)))

(declare-fun res!392625 () Bool)

(assert (=> b!610339 (=> (not res!392625) (not e!349603))))

(declare-fun e!349604 () Bool)

(assert (=> b!610339 (= res!392625 (not e!349604))))

(declare-fun res!392626 () Bool)

(assert (=> b!610339 (=> (not res!392626) (not e!349604))))

(assert (=> b!610339 (= res!392626 (validKeyInArray!0 (select (arr!17917 lt!279025) #b00000000000000000000000000000000)))))

(declare-fun d!88221 () Bool)

(declare-fun res!392624 () Bool)

(assert (=> d!88221 (=> res!392624 e!349606)))

(assert (=> d!88221 (= res!392624 (bvsge #b00000000000000000000000000000000 (size!18281 lt!279025)))))

(assert (=> d!88221 (= (arrayNoDuplicates!0 lt!279025 #b00000000000000000000000000000000 Nil!11862) e!349606)))

(declare-fun b!610337 () Bool)

(assert (=> b!610337 (= e!349604 (contains!3012 Nil!11862 (select (arr!17917 lt!279025) #b00000000000000000000000000000000)))))

(declare-fun b!610340 () Bool)

(assert (=> b!610340 (= e!349605 call!33118)))

(declare-fun b!610341 () Bool)

(assert (=> b!610341 (= e!349605 call!33118)))

(assert (= (and d!88221 (not res!392624)) b!610339))

(assert (= (and b!610339 res!392626) b!610337))

(assert (= (and b!610339 res!392625) b!610338))

(assert (= (and b!610338 c!69225) b!610341))

(assert (= (and b!610338 (not c!69225)) b!610340))

(assert (= (or b!610341 b!610340) bm!33115))

(declare-fun m!587099 () Bool)

(assert (=> b!610338 m!587099))

(assert (=> b!610338 m!587099))

(declare-fun m!587101 () Bool)

(assert (=> b!610338 m!587101))

(assert (=> bm!33115 m!587099))

(declare-fun m!587103 () Bool)

(assert (=> bm!33115 m!587103))

(assert (=> b!610339 m!587099))

(assert (=> b!610339 m!587099))

(assert (=> b!610339 m!587101))

(assert (=> b!610337 m!587099))

(assert (=> b!610337 m!587099))

(declare-fun m!587105 () Bool)

(assert (=> b!610337 m!587105))

(assert (=> b!610155 d!88221))

(declare-fun d!88223 () Bool)

(declare-fun res!392627 () Bool)

(declare-fun e!349607 () Bool)

(assert (=> d!88223 (=> res!392627 e!349607)))

(assert (=> d!88223 (= res!392627 (= (select (arr!17917 lt!279025) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!17917 a!2986) j!136)))))

(assert (=> d!88223 (= (arrayContainsKey!0 lt!279025 (select (arr!17917 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!349607)))

(declare-fun b!610342 () Bool)

(declare-fun e!349608 () Bool)

(assert (=> b!610342 (= e!349607 e!349608)))

(declare-fun res!392628 () Bool)

(assert (=> b!610342 (=> (not res!392628) (not e!349608))))

(assert (=> b!610342 (= res!392628 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18281 lt!279025)))))

(declare-fun b!610343 () Bool)

(assert (=> b!610343 (= e!349608 (arrayContainsKey!0 lt!279025 (select (arr!17917 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!88223 (not res!392627)) b!610342))

(assert (= (and b!610342 res!392628) b!610343))

(declare-fun m!587107 () Bool)

(assert (=> d!88223 m!587107))

(assert (=> b!610343 m!586875))

(declare-fun m!587109 () Bool)

(assert (=> b!610343 m!587109))

(assert (=> b!610146 d!88223))

(assert (=> b!610146 d!88221))

(assert (=> b!610146 d!88217))

(declare-fun d!88225 () Bool)

(assert (=> d!88225 (arrayContainsKey!0 lt!279025 (select (arr!17917 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!279158 () Unit!19531)

(assert (=> d!88225 (= lt!279158 (choose!114 lt!279025 (select (arr!17917 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!88225 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!88225 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!279025 (select (arr!17917 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!279158)))

(declare-fun bs!18632 () Bool)

(assert (= bs!18632 d!88225))

(assert (=> bs!18632 m!586875))

(assert (=> bs!18632 m!586905))

(assert (=> bs!18632 m!586875))

(declare-fun m!587111 () Bool)

(assert (=> bs!18632 m!587111))

(assert (=> b!610146 d!88225))

(declare-fun d!88227 () Bool)

(declare-fun res!392629 () Bool)

(declare-fun e!349609 () Bool)

(assert (=> d!88227 (=> res!392629 e!349609)))

(assert (=> d!88227 (= res!392629 (= (select (arr!17917 lt!279025) j!136) (select (arr!17917 a!2986) j!136)))))

(assert (=> d!88227 (= (arrayContainsKey!0 lt!279025 (select (arr!17917 a!2986) j!136) j!136) e!349609)))

(declare-fun b!610344 () Bool)

(declare-fun e!349610 () Bool)

(assert (=> b!610344 (= e!349609 e!349610)))

(declare-fun res!392630 () Bool)

(assert (=> b!610344 (=> (not res!392630) (not e!349610))))

(assert (=> b!610344 (= res!392630 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18281 lt!279025)))))

(declare-fun b!610345 () Bool)

(assert (=> b!610345 (= e!349610 (arrayContainsKey!0 lt!279025 (select (arr!17917 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!88227 (not res!392629)) b!610344))

(assert (= (and b!610344 res!392630) b!610345))

(assert (=> d!88227 m!587077))

(assert (=> b!610345 m!586875))

(declare-fun m!587113 () Bool)

(assert (=> b!610345 m!587113))

(assert (=> b!610146 d!88227))

(assert (=> b!610135 d!88227))

(declare-fun b!610368 () Bool)

(declare-fun e!349629 () Bool)

(declare-fun call!33121 () Bool)

(assert (=> b!610368 (= e!349629 call!33121)))

(declare-fun d!88229 () Bool)

(declare-fun res!392646 () Bool)

(declare-fun e!349630 () Bool)

(assert (=> d!88229 (=> res!392646 e!349630)))

(assert (=> d!88229 (= res!392646 (bvsge #b00000000000000000000000000000000 (size!18281 a!2986)))))

(assert (=> d!88229 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!349630)))

(declare-fun b!610369 () Bool)

(declare-fun e!349631 () Bool)

(assert (=> b!610369 (= e!349631 call!33121)))

(declare-fun b!610370 () Bool)

(assert (=> b!610370 (= e!349630 e!349631)))

(declare-fun c!69230 () Bool)

(assert (=> b!610370 (= c!69230 (validKeyInArray!0 (select (arr!17917 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33118 () Bool)

(assert (=> bm!33118 (= call!33121 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!610371 () Bool)

(assert (=> b!610371 (= e!349631 e!349629)))

(declare-fun lt!279173 () (_ BitVec 64))

(assert (=> b!610371 (= lt!279173 (select (arr!17917 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!279172 () Unit!19531)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37338 (_ BitVec 64) (_ BitVec 32)) Unit!19531)

(assert (=> b!610371 (= lt!279172 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!279173 #b00000000000000000000000000000000))))

(assert (=> b!610371 (arrayContainsKey!0 a!2986 lt!279173 #b00000000000000000000000000000000)))

(declare-fun lt!279171 () Unit!19531)

(assert (=> b!610371 (= lt!279171 lt!279172)))

(declare-fun res!392645 () Bool)

(assert (=> b!610371 (= res!392645 (= (seekEntryOrOpen!0 (select (arr!17917 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6313 #b00000000000000000000000000000000)))))

(assert (=> b!610371 (=> (not res!392645) (not e!349629))))

(assert (= (and d!88229 (not res!392646)) b!610370))

(assert (= (and b!610370 c!69230) b!610371))

(assert (= (and b!610370 (not c!69230)) b!610369))

(assert (= (and b!610371 res!392645) b!610368))

(assert (= (or b!610368 b!610369) bm!33118))

(declare-fun m!587119 () Bool)

(assert (=> b!610370 m!587119))

(assert (=> b!610370 m!587119))

(declare-fun m!587121 () Bool)

(assert (=> b!610370 m!587121))

(declare-fun m!587123 () Bool)

(assert (=> bm!33118 m!587123))

(assert (=> b!610371 m!587119))

(declare-fun m!587125 () Bool)

(assert (=> b!610371 m!587125))

(declare-fun m!587127 () Bool)

(assert (=> b!610371 m!587127))

(assert (=> b!610371 m!587119))

(declare-fun m!587129 () Bool)

(assert (=> b!610371 m!587129))

(assert (=> b!610136 d!88229))

(declare-fun d!88239 () Bool)

(assert (=> d!88239 (= (validKeyInArray!0 (select (arr!17917 a!2986) j!136)) (and (not (= (select (arr!17917 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17917 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!610137 d!88239))

(declare-fun b!610429 () Bool)

(declare-fun e!349677 () SeekEntryResult!6313)

(assert (=> b!610429 (= e!349677 Undefined!6313)))

(declare-fun b!610430 () Bool)

(declare-fun e!349678 () SeekEntryResult!6313)

(assert (=> b!610430 (= e!349677 e!349678)))

(declare-fun lt!279197 () (_ BitVec 64))

(declare-fun c!69244 () Bool)

(assert (=> b!610430 (= c!69244 (= lt!279197 (select (arr!17917 a!2986) j!136)))))

(declare-fun lt!279196 () SeekEntryResult!6313)

(declare-fun d!88241 () Bool)

(assert (=> d!88241 (and (or ((_ is Undefined!6313) lt!279196) (not ((_ is Found!6313) lt!279196)) (and (bvsge (index!27528 lt!279196) #b00000000000000000000000000000000) (bvslt (index!27528 lt!279196) (size!18281 a!2986)))) (or ((_ is Undefined!6313) lt!279196) ((_ is Found!6313) lt!279196) (not ((_ is MissingVacant!6313) lt!279196)) (not (= (index!27530 lt!279196) vacantSpotIndex!68)) (and (bvsge (index!27530 lt!279196) #b00000000000000000000000000000000) (bvslt (index!27530 lt!279196) (size!18281 a!2986)))) (or ((_ is Undefined!6313) lt!279196) (ite ((_ is Found!6313) lt!279196) (= (select (arr!17917 a!2986) (index!27528 lt!279196)) (select (arr!17917 a!2986) j!136)) (and ((_ is MissingVacant!6313) lt!279196) (= (index!27530 lt!279196) vacantSpotIndex!68) (= (select (arr!17917 a!2986) (index!27530 lt!279196)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!88241 (= lt!279196 e!349677)))

(declare-fun c!69242 () Bool)

(assert (=> d!88241 (= c!69242 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!88241 (= lt!279197 (select (arr!17917 a!2986) index!984))))

(assert (=> d!88241 (validMask!0 mask!3053)))

(assert (=> d!88241 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17917 a!2986) j!136) a!2986 mask!3053) lt!279196)))

(declare-fun b!610431 () Bool)

(declare-fun e!349676 () SeekEntryResult!6313)

(assert (=> b!610431 (= e!349676 (MissingVacant!6313 vacantSpotIndex!68))))

(declare-fun b!610432 () Bool)

(assert (=> b!610432 (= e!349676 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!17917 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!610433 () Bool)

(declare-fun c!69243 () Bool)

(assert (=> b!610433 (= c!69243 (= lt!279197 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!610433 (= e!349678 e!349676)))

(declare-fun b!610434 () Bool)

(assert (=> b!610434 (= e!349678 (Found!6313 index!984))))

(assert (= (and d!88241 c!69242) b!610429))

(assert (= (and d!88241 (not c!69242)) b!610430))

(assert (= (and b!610430 c!69244) b!610434))

(assert (= (and b!610430 (not c!69244)) b!610433))

(assert (= (and b!610433 c!69243) b!610431))

(assert (= (and b!610433 (not c!69243)) b!610432))

(declare-fun m!587183 () Bool)

(assert (=> d!88241 m!587183))

(declare-fun m!587185 () Bool)

(assert (=> d!88241 m!587185))

(assert (=> d!88241 m!586925))

(assert (=> d!88241 m!586871))

(declare-fun m!587187 () Bool)

(assert (=> b!610432 m!587187))

(assert (=> b!610432 m!587187))

(assert (=> b!610432 m!586875))

(declare-fun m!587189 () Bool)

(assert (=> b!610432 m!587189))

(assert (=> b!610138 d!88241))

(declare-fun d!88265 () Bool)

(declare-fun res!392680 () Bool)

(declare-fun e!349681 () Bool)

(assert (=> d!88265 (=> res!392680 e!349681)))

(assert (=> d!88265 (= res!392680 (= (select (arr!17917 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!88265 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!349681)))

(declare-fun b!610437 () Bool)

(declare-fun e!349682 () Bool)

(assert (=> b!610437 (= e!349681 e!349682)))

(declare-fun res!392681 () Bool)

(assert (=> b!610437 (=> (not res!392681) (not e!349682))))

(assert (=> b!610437 (= res!392681 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18281 a!2986)))))

(declare-fun b!610438 () Bool)

(assert (=> b!610438 (= e!349682 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!88265 (not res!392680)) b!610437))

(assert (= (and b!610437 res!392681) b!610438))

(assert (=> d!88265 m!587119))

(declare-fun m!587191 () Bool)

(assert (=> b!610438 m!587191))

(assert (=> b!610149 d!88265))

(declare-fun d!88267 () Bool)

(assert (=> d!88267 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!610139 d!88267))

(declare-fun d!88269 () Bool)

(declare-fun res!392682 () Bool)

(declare-fun e!349683 () Bool)

(assert (=> d!88269 (=> res!392682 e!349683)))

(assert (=> d!88269 (= res!392682 (= (select (arr!17917 lt!279025) index!984) (select (arr!17917 a!2986) j!136)))))

(assert (=> d!88269 (= (arrayContainsKey!0 lt!279025 (select (arr!17917 a!2986) j!136) index!984) e!349683)))

(declare-fun b!610439 () Bool)

(declare-fun e!349684 () Bool)

(assert (=> b!610439 (= e!349683 e!349684)))

(declare-fun res!392683 () Bool)

(assert (=> b!610439 (=> (not res!392683) (not e!349684))))

(assert (=> b!610439 (= res!392683 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18281 lt!279025)))))

(declare-fun b!610440 () Bool)

(assert (=> b!610440 (= e!349684 (arrayContainsKey!0 lt!279025 (select (arr!17917 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!88269 (not res!392682)) b!610439))

(assert (= (and b!610439 res!392683) b!610440))

(declare-fun m!587193 () Bool)

(assert (=> d!88269 m!587193))

(assert (=> b!610440 m!586875))

(declare-fun m!587195 () Bool)

(assert (=> b!610440 m!587195))

(assert (=> b!610151 d!88269))

(declare-fun b!610442 () Bool)

(declare-fun e!349685 () Bool)

(declare-fun e!349687 () Bool)

(assert (=> b!610442 (= e!349685 e!349687)))

(declare-fun c!69247 () Bool)

(assert (=> b!610442 (= c!69247 (validKeyInArray!0 (select (arr!17917 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33128 () Bool)

(declare-fun call!33131 () Bool)

(assert (=> bm!33128 (= call!33131 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!69247 (Cons!11861 (select (arr!17917 a!2986) #b00000000000000000000000000000000) Nil!11862) Nil!11862)))))

(declare-fun b!610443 () Bool)

(declare-fun e!349688 () Bool)

(assert (=> b!610443 (= e!349688 e!349685)))

(declare-fun res!392685 () Bool)

(assert (=> b!610443 (=> (not res!392685) (not e!349685))))

(declare-fun e!349686 () Bool)

(assert (=> b!610443 (= res!392685 (not e!349686))))

(declare-fun res!392686 () Bool)

(assert (=> b!610443 (=> (not res!392686) (not e!349686))))

(assert (=> b!610443 (= res!392686 (validKeyInArray!0 (select (arr!17917 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!88271 () Bool)

(declare-fun res!392684 () Bool)

(assert (=> d!88271 (=> res!392684 e!349688)))

(assert (=> d!88271 (= res!392684 (bvsge #b00000000000000000000000000000000 (size!18281 a!2986)))))

(assert (=> d!88271 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11862) e!349688)))

(declare-fun b!610441 () Bool)

(assert (=> b!610441 (= e!349686 (contains!3012 Nil!11862 (select (arr!17917 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!610444 () Bool)

(assert (=> b!610444 (= e!349687 call!33131)))

(declare-fun b!610445 () Bool)

(assert (=> b!610445 (= e!349687 call!33131)))

(assert (= (and d!88271 (not res!392684)) b!610443))

(assert (= (and b!610443 res!392686) b!610441))

(assert (= (and b!610443 res!392685) b!610442))

(assert (= (and b!610442 c!69247) b!610445))

(assert (= (and b!610442 (not c!69247)) b!610444))

(assert (= (or b!610445 b!610444) bm!33128))

(assert (=> b!610442 m!587119))

(assert (=> b!610442 m!587119))

(assert (=> b!610442 m!587121))

(assert (=> bm!33128 m!587119))

(declare-fun m!587197 () Bool)

(assert (=> bm!33128 m!587197))

(assert (=> b!610443 m!587119))

(assert (=> b!610443 m!587119))

(assert (=> b!610443 m!587121))

(assert (=> b!610441 m!587119))

(assert (=> b!610441 m!587119))

(declare-fun m!587199 () Bool)

(assert (=> b!610441 m!587199))

(assert (=> b!610152 d!88271))

(declare-fun d!88273 () Bool)

(assert (=> d!88273 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!55662 d!88273))

(declare-fun d!88281 () Bool)

(assert (=> d!88281 (= (array_inv!13776 a!2986) (bvsge (size!18281 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!55662 d!88281))

(assert (=> b!610141 d!88269))

(declare-fun d!88283 () Bool)

(declare-fun e!349708 () Bool)

(assert (=> d!88283 e!349708))

(declare-fun res!392702 () Bool)

(assert (=> d!88283 (=> (not res!392702) (not e!349708))))

(assert (=> d!88283 (= res!392702 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18281 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18281 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18281 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18281 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18281 a!2986))))))

(declare-fun lt!279207 () Unit!19531)

(declare-fun choose!9 (array!37338 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19531)

(assert (=> d!88283 (= lt!279207 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!279033 vacantSpotIndex!68 mask!3053))))

(assert (=> d!88283 (validMask!0 mask!3053)))

(assert (=> d!88283 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!279033 vacantSpotIndex!68 mask!3053) lt!279207)))

(declare-fun b!610469 () Bool)

(assert (=> b!610469 (= e!349708 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279033 vacantSpotIndex!68 (select (arr!17917 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279033 vacantSpotIndex!68 (select (store (arr!17917 a!2986) i!1108 k0!1786) j!136) (array!37339 (store (arr!17917 a!2986) i!1108 k0!1786) (size!18281 a!2986)) mask!3053)))))

(assert (= (and d!88283 res!392702) b!610469))

(declare-fun m!587225 () Bool)

(assert (=> d!88283 m!587225))

(assert (=> d!88283 m!586871))

(assert (=> b!610469 m!586895))

(assert (=> b!610469 m!586875))

(assert (=> b!610469 m!586891))

(assert (=> b!610469 m!586889))

(declare-fun m!587227 () Bool)

(assert (=> b!610469 m!587227))

(assert (=> b!610469 m!586875))

(assert (=> b!610469 m!586889))

(assert (=> b!610142 d!88283))

(declare-fun b!610478 () Bool)

(declare-fun e!349714 () SeekEntryResult!6313)

(assert (=> b!610478 (= e!349714 Undefined!6313)))

(declare-fun b!610479 () Bool)

(declare-fun e!349715 () SeekEntryResult!6313)

(assert (=> b!610479 (= e!349714 e!349715)))

(declare-fun lt!279209 () (_ BitVec 64))

(declare-fun c!69258 () Bool)

(assert (=> b!610479 (= c!69258 (= lt!279209 (select (arr!17917 a!2986) j!136)))))

(declare-fun lt!279208 () SeekEntryResult!6313)

(declare-fun d!88299 () Bool)

(assert (=> d!88299 (and (or ((_ is Undefined!6313) lt!279208) (not ((_ is Found!6313) lt!279208)) (and (bvsge (index!27528 lt!279208) #b00000000000000000000000000000000) (bvslt (index!27528 lt!279208) (size!18281 a!2986)))) (or ((_ is Undefined!6313) lt!279208) ((_ is Found!6313) lt!279208) (not ((_ is MissingVacant!6313) lt!279208)) (not (= (index!27530 lt!279208) vacantSpotIndex!68)) (and (bvsge (index!27530 lt!279208) #b00000000000000000000000000000000) (bvslt (index!27530 lt!279208) (size!18281 a!2986)))) (or ((_ is Undefined!6313) lt!279208) (ite ((_ is Found!6313) lt!279208) (= (select (arr!17917 a!2986) (index!27528 lt!279208)) (select (arr!17917 a!2986) j!136)) (and ((_ is MissingVacant!6313) lt!279208) (= (index!27530 lt!279208) vacantSpotIndex!68) (= (select (arr!17917 a!2986) (index!27530 lt!279208)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!88299 (= lt!279208 e!349714)))

(declare-fun c!69256 () Bool)

(assert (=> d!88299 (= c!69256 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!88299 (= lt!279209 (select (arr!17917 a!2986) lt!279033))))

(assert (=> d!88299 (validMask!0 mask!3053)))

(assert (=> d!88299 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279033 vacantSpotIndex!68 (select (arr!17917 a!2986) j!136) a!2986 mask!3053) lt!279208)))

(declare-fun b!610480 () Bool)

(declare-fun e!349713 () SeekEntryResult!6313)

(assert (=> b!610480 (= e!349713 (MissingVacant!6313 vacantSpotIndex!68))))

(declare-fun b!610481 () Bool)

(assert (=> b!610481 (= e!349713 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!279033 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!17917 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!610482 () Bool)

(declare-fun c!69257 () Bool)

(assert (=> b!610482 (= c!69257 (= lt!279209 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!610482 (= e!349715 e!349713)))

(declare-fun b!610483 () Bool)

(assert (=> b!610483 (= e!349715 (Found!6313 lt!279033))))

(assert (= (and d!88299 c!69256) b!610478))

(assert (= (and d!88299 (not c!69256)) b!610479))

(assert (= (and b!610479 c!69258) b!610483))

(assert (= (and b!610479 (not c!69258)) b!610482))

(assert (= (and b!610482 c!69257) b!610480))

(assert (= (and b!610482 (not c!69257)) b!610481))

(declare-fun m!587229 () Bool)

(assert (=> d!88299 m!587229))

(declare-fun m!587231 () Bool)

(assert (=> d!88299 m!587231))

(declare-fun m!587233 () Bool)

(assert (=> d!88299 m!587233))

(assert (=> d!88299 m!586871))

(declare-fun m!587235 () Bool)

(assert (=> b!610481 m!587235))

(assert (=> b!610481 m!587235))

(assert (=> b!610481 m!586875))

(declare-fun m!587237 () Bool)

(assert (=> b!610481 m!587237))

(assert (=> b!610142 d!88299))

(declare-fun b!610486 () Bool)

(declare-fun e!349717 () SeekEntryResult!6313)

(assert (=> b!610486 (= e!349717 Undefined!6313)))

(declare-fun b!610487 () Bool)

(declare-fun e!349718 () SeekEntryResult!6313)

(assert (=> b!610487 (= e!349717 e!349718)))

(declare-fun c!69261 () Bool)

(declare-fun lt!279215 () (_ BitVec 64))

(assert (=> b!610487 (= c!69261 (= lt!279215 lt!279032))))

(declare-fun lt!279214 () SeekEntryResult!6313)

(declare-fun d!88301 () Bool)

(assert (=> d!88301 (and (or ((_ is Undefined!6313) lt!279214) (not ((_ is Found!6313) lt!279214)) (and (bvsge (index!27528 lt!279214) #b00000000000000000000000000000000) (bvslt (index!27528 lt!279214) (size!18281 lt!279025)))) (or ((_ is Undefined!6313) lt!279214) ((_ is Found!6313) lt!279214) (not ((_ is MissingVacant!6313) lt!279214)) (not (= (index!27530 lt!279214) vacantSpotIndex!68)) (and (bvsge (index!27530 lt!279214) #b00000000000000000000000000000000) (bvslt (index!27530 lt!279214) (size!18281 lt!279025)))) (or ((_ is Undefined!6313) lt!279214) (ite ((_ is Found!6313) lt!279214) (= (select (arr!17917 lt!279025) (index!27528 lt!279214)) lt!279032) (and ((_ is MissingVacant!6313) lt!279214) (= (index!27530 lt!279214) vacantSpotIndex!68) (= (select (arr!17917 lt!279025) (index!27530 lt!279214)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!88301 (= lt!279214 e!349717)))

(declare-fun c!69259 () Bool)

(assert (=> d!88301 (= c!69259 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!88301 (= lt!279215 (select (arr!17917 lt!279025) lt!279033))))

(assert (=> d!88301 (validMask!0 mask!3053)))

(assert (=> d!88301 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279033 vacantSpotIndex!68 lt!279032 lt!279025 mask!3053) lt!279214)))

(declare-fun b!610488 () Bool)

(declare-fun e!349716 () SeekEntryResult!6313)

(assert (=> b!610488 (= e!349716 (MissingVacant!6313 vacantSpotIndex!68))))

(declare-fun b!610489 () Bool)

(assert (=> b!610489 (= e!349716 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!279033 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!279032 lt!279025 mask!3053))))

(declare-fun b!610490 () Bool)

(declare-fun c!69260 () Bool)

(assert (=> b!610490 (= c!69260 (= lt!279215 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!610490 (= e!349718 e!349716)))

(declare-fun b!610491 () Bool)

(assert (=> b!610491 (= e!349718 (Found!6313 lt!279033))))

(assert (= (and d!88301 c!69259) b!610486))

(assert (= (and d!88301 (not c!69259)) b!610487))

(assert (= (and b!610487 c!69261) b!610491))

(assert (= (and b!610487 (not c!69261)) b!610490))

(assert (= (and b!610490 c!69260) b!610488))

(assert (= (and b!610490 (not c!69260)) b!610489))

(declare-fun m!587239 () Bool)

(assert (=> d!88301 m!587239))

(declare-fun m!587241 () Bool)

(assert (=> d!88301 m!587241))

(declare-fun m!587243 () Bool)

(assert (=> d!88301 m!587243))

(assert (=> d!88301 m!586871))

(assert (=> b!610489 m!587235))

(assert (=> b!610489 m!587235))

(declare-fun m!587245 () Bool)

(assert (=> b!610489 m!587245))

(assert (=> b!610142 d!88301))

(declare-fun d!88303 () Bool)

(declare-fun lt!279220 () (_ BitVec 32))

(assert (=> d!88303 (and (bvsge lt!279220 #b00000000000000000000000000000000) (bvslt lt!279220 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!88303 (= lt!279220 (choose!52 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(assert (=> d!88303 (validMask!0 mask!3053)))

(assert (=> d!88303 (= (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) lt!279220)))

(declare-fun bs!18637 () Bool)

(assert (= bs!18637 d!88303))

(declare-fun m!587255 () Bool)

(assert (=> bs!18637 m!587255))

(assert (=> bs!18637 m!586871))

(assert (=> b!610142 d!88303))

(declare-fun b!610508 () Bool)

(declare-fun e!349729 () SeekEntryResult!6313)

(assert (=> b!610508 (= e!349729 Undefined!6313)))

(declare-fun b!610509 () Bool)

(declare-fun e!349730 () SeekEntryResult!6313)

(assert (=> b!610509 (= e!349729 e!349730)))

(declare-fun c!69273 () Bool)

(declare-fun lt!279222 () (_ BitVec 64))

(assert (=> b!610509 (= c!69273 (= lt!279222 lt!279032))))

(declare-fun d!88307 () Bool)

(declare-fun lt!279221 () SeekEntryResult!6313)

(assert (=> d!88307 (and (or ((_ is Undefined!6313) lt!279221) (not ((_ is Found!6313) lt!279221)) (and (bvsge (index!27528 lt!279221) #b00000000000000000000000000000000) (bvslt (index!27528 lt!279221) (size!18281 lt!279025)))) (or ((_ is Undefined!6313) lt!279221) ((_ is Found!6313) lt!279221) (not ((_ is MissingVacant!6313) lt!279221)) (not (= (index!27530 lt!279221) vacantSpotIndex!68)) (and (bvsge (index!27530 lt!279221) #b00000000000000000000000000000000) (bvslt (index!27530 lt!279221) (size!18281 lt!279025)))) (or ((_ is Undefined!6313) lt!279221) (ite ((_ is Found!6313) lt!279221) (= (select (arr!17917 lt!279025) (index!27528 lt!279221)) lt!279032) (and ((_ is MissingVacant!6313) lt!279221) (= (index!27530 lt!279221) vacantSpotIndex!68) (= (select (arr!17917 lt!279025) (index!27530 lt!279221)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!88307 (= lt!279221 e!349729)))

(declare-fun c!69271 () Bool)

(assert (=> d!88307 (= c!69271 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!88307 (= lt!279222 (select (arr!17917 lt!279025) index!984))))

(assert (=> d!88307 (validMask!0 mask!3053)))

(assert (=> d!88307 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!279032 lt!279025 mask!3053) lt!279221)))

(declare-fun b!610510 () Bool)

(declare-fun e!349728 () SeekEntryResult!6313)

(assert (=> b!610510 (= e!349728 (MissingVacant!6313 vacantSpotIndex!68))))

(declare-fun b!610511 () Bool)

(assert (=> b!610511 (= e!349728 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!279032 lt!279025 mask!3053))))

(declare-fun b!610512 () Bool)

(declare-fun c!69272 () Bool)

(assert (=> b!610512 (= c!69272 (= lt!279222 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!610512 (= e!349730 e!349728)))

(declare-fun b!610513 () Bool)

(assert (=> b!610513 (= e!349730 (Found!6313 index!984))))

(assert (= (and d!88307 c!69271) b!610508))

(assert (= (and d!88307 (not c!69271)) b!610509))

(assert (= (and b!610509 c!69273) b!610513))

(assert (= (and b!610509 (not c!69273)) b!610512))

(assert (= (and b!610512 c!69272) b!610510))

(assert (= (and b!610512 (not c!69272)) b!610511))

(declare-fun m!587257 () Bool)

(assert (=> d!88307 m!587257))

(declare-fun m!587261 () Bool)

(assert (=> d!88307 m!587261))

(assert (=> d!88307 m!587193))

(assert (=> d!88307 m!586871))

(assert (=> b!610511 m!587187))

(assert (=> b!610511 m!587187))

(declare-fun m!587263 () Bool)

(assert (=> b!610511 m!587263))

(assert (=> b!610142 d!88307))

(check-sat (not b!610323) (not d!88301) (not b!610345) (not d!88225) (not b!610309) (not d!88283) (not d!88219) (not b!610440) (not b!610441) (not d!88303) (not b!610438) (not bm!33128) (not d!88217) (not d!88215) (not b!610481) (not d!88207) (not b!610370) (not bm!33114) (not b!610511) (not b!610339) (not b!610324) (not b!610333) (not d!88307) (not bm!33118) (not d!88299) (not b!610442) (not b!610432) (not b!610489) (not b!610336) (not b!610371) (not b!610325) (not d!88213) (not b!610443) (not b!610337) (not b!610469) (not bm!33115) (not d!88241) (not b!610343) (not b!610338))
(check-sat)
