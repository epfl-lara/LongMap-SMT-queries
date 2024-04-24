; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56034 () Bool)

(assert start!56034)

(declare-fun b!614993 () Bool)

(declare-fun e!352619 () Bool)

(declare-fun e!352626 () Bool)

(assert (=> b!614993 (= e!352619 e!352626)))

(declare-fun res!396086 () Bool)

(assert (=> b!614993 (=> (not res!396086) (not e!352626))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6364 0))(
  ( (MissingZero!6364 (index!27740 (_ BitVec 32))) (Found!6364 (index!27741 (_ BitVec 32))) (Intermediate!6364 (undefined!7176 Bool) (index!27742 (_ BitVec 32)) (x!56695 (_ BitVec 32))) (Undefined!6364) (MissingVacant!6364 (index!27743 (_ BitVec 32))) )
))
(declare-fun lt!282254 () SeekEntryResult!6364)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37449 0))(
  ( (array!37450 (arr!17968 (Array (_ BitVec 32) (_ BitVec 64))) (size!18332 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37449)

(assert (=> b!614993 (= res!396086 (and (= lt!282254 (Found!6364 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17968 a!2986) index!984) (select (arr!17968 a!2986) j!136))) (not (= (select (arr!17968 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37449 (_ BitVec 32)) SeekEntryResult!6364)

(assert (=> b!614993 (= lt!282254 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17968 a!2986) j!136) a!2986 mask!3053))))

(declare-fun lt!282245 () array!37449)

(declare-fun e!352617 () Bool)

(declare-fun b!614994 () Bool)

(declare-fun arrayContainsKey!0 (array!37449 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!614994 (= e!352617 (arrayContainsKey!0 lt!282245 (select (arr!17968 a!2986) j!136) index!984))))

(declare-fun b!614995 () Bool)

(declare-fun res!396089 () Bool)

(declare-fun e!352623 () Bool)

(assert (=> b!614995 (=> (not res!396089) (not e!352623))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!614995 (= res!396089 (validKeyInArray!0 (select (arr!17968 a!2986) j!136)))))

(declare-fun b!614996 () Bool)

(declare-datatypes ((Unit!19837 0))(
  ( (Unit!19838) )
))
(declare-fun e!352621 () Unit!19837)

(declare-fun Unit!19839 () Unit!19837)

(assert (=> b!614996 (= e!352621 Unit!19839)))

(assert (=> b!614996 false))

(declare-fun b!614997 () Bool)

(declare-fun res!396094 () Bool)

(assert (=> b!614997 (=> (not res!396094) (not e!352623))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!614997 (= res!396094 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!614998 () Bool)

(declare-fun res!396088 () Bool)

(declare-fun e!352618 () Bool)

(assert (=> b!614998 (=> (not res!396088) (not e!352618))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37449 (_ BitVec 32)) Bool)

(assert (=> b!614998 (= res!396088 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!614999 () Bool)

(declare-fun res!396083 () Bool)

(assert (=> b!614999 (=> (not res!396083) (not e!352618))))

(declare-datatypes ((List!11916 0))(
  ( (Nil!11913) (Cons!11912 (h!12960 (_ BitVec 64)) (t!18136 List!11916)) )
))
(declare-fun arrayNoDuplicates!0 (array!37449 (_ BitVec 32) List!11916) Bool)

(assert (=> b!614999 (= res!396083 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11913))))

(declare-fun b!615000 () Bool)

(assert (=> b!615000 false))

(declare-fun lt!282241 () Unit!19837)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37449 (_ BitVec 64) (_ BitVec 32) List!11916) Unit!19837)

(assert (=> b!615000 (= lt!282241 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!282245 (select (arr!17968 a!2986) j!136) index!984 Nil!11913))))

(assert (=> b!615000 (arrayNoDuplicates!0 lt!282245 index!984 Nil!11913)))

(declare-fun lt!282246 () Unit!19837)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37449 (_ BitVec 32) (_ BitVec 32)) Unit!19837)

(assert (=> b!615000 (= lt!282246 (lemmaNoDuplicateFromThenFromBigger!0 lt!282245 #b00000000000000000000000000000000 index!984))))

(assert (=> b!615000 (arrayNoDuplicates!0 lt!282245 #b00000000000000000000000000000000 Nil!11913)))

(declare-fun lt!282243 () Unit!19837)

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37449 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11916) Unit!19837)

(assert (=> b!615000 (= lt!282243 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11913))))

(assert (=> b!615000 (arrayContainsKey!0 lt!282245 (select (arr!17968 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!282256 () Unit!19837)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37449 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19837)

(assert (=> b!615000 (= lt!282256 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!282245 (select (arr!17968 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!615000 e!352617))

(declare-fun res!396096 () Bool)

(assert (=> b!615000 (=> (not res!396096) (not e!352617))))

(assert (=> b!615000 (= res!396096 (arrayContainsKey!0 lt!282245 (select (arr!17968 a!2986) j!136) j!136))))

(declare-fun e!352624 () Unit!19837)

(declare-fun Unit!19840 () Unit!19837)

(assert (=> b!615000 (= e!352624 Unit!19840)))

(declare-fun b!615001 () Bool)

(declare-fun res!396091 () Bool)

(assert (=> b!615001 (= res!396091 (arrayContainsKey!0 lt!282245 (select (arr!17968 a!2986) j!136) j!136))))

(declare-fun e!352614 () Bool)

(assert (=> b!615001 (=> (not res!396091) (not e!352614))))

(declare-fun e!352613 () Bool)

(assert (=> b!615001 (= e!352613 e!352614)))

(declare-fun b!615002 () Bool)

(assert (=> b!615002 false))

(declare-fun lt!282242 () Unit!19837)

(assert (=> b!615002 (= lt!282242 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!282245 (select (arr!17968 a!2986) j!136) j!136 Nil!11913))))

(assert (=> b!615002 (arrayNoDuplicates!0 lt!282245 j!136 Nil!11913)))

(declare-fun lt!282244 () Unit!19837)

(assert (=> b!615002 (= lt!282244 (lemmaNoDuplicateFromThenFromBigger!0 lt!282245 #b00000000000000000000000000000000 j!136))))

(assert (=> b!615002 (arrayNoDuplicates!0 lt!282245 #b00000000000000000000000000000000 Nil!11913)))

(declare-fun lt!282259 () Unit!19837)

(assert (=> b!615002 (= lt!282259 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11913))))

(assert (=> b!615002 (arrayContainsKey!0 lt!282245 (select (arr!17968 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!282250 () Unit!19837)

(assert (=> b!615002 (= lt!282250 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!282245 (select (arr!17968 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!352620 () Unit!19837)

(declare-fun Unit!19841 () Unit!19837)

(assert (=> b!615002 (= e!352620 Unit!19841)))

(declare-fun b!615003 () Bool)

(declare-fun res!396090 () Bool)

(assert (=> b!615003 (=> (not res!396090) (not e!352618))))

(assert (=> b!615003 (= res!396090 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17968 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!615005 () Bool)

(declare-fun res!396095 () Bool)

(assert (=> b!615005 (= res!396095 (bvsge j!136 index!984))))

(assert (=> b!615005 (=> res!396095 e!352613)))

(declare-fun e!352622 () Bool)

(assert (=> b!615005 (= e!352622 e!352613)))

(declare-fun res!396097 () Bool)

(assert (=> start!56034 (=> (not res!396097) (not e!352623))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56034 (= res!396097 (validMask!0 mask!3053))))

(assert (=> start!56034 e!352623))

(assert (=> start!56034 true))

(declare-fun array_inv!13827 (array!37449) Bool)

(assert (=> start!56034 (array_inv!13827 a!2986)))

(declare-fun b!615004 () Bool)

(declare-fun Unit!19842 () Unit!19837)

(assert (=> b!615004 (= e!352621 Unit!19842)))

(declare-fun b!615006 () Bool)

(assert (=> b!615006 (= e!352623 e!352618)))

(declare-fun res!396084 () Bool)

(assert (=> b!615006 (=> (not res!396084) (not e!352618))))

(declare-fun lt!282257 () SeekEntryResult!6364)

(assert (=> b!615006 (= res!396084 (or (= lt!282257 (MissingZero!6364 i!1108)) (= lt!282257 (MissingVacant!6364 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37449 (_ BitVec 32)) SeekEntryResult!6364)

(assert (=> b!615006 (= lt!282257 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!615007 () Bool)

(declare-fun res!396082 () Bool)

(assert (=> b!615007 (=> (not res!396082) (not e!352623))))

(assert (=> b!615007 (= res!396082 (validKeyInArray!0 k0!1786))))

(declare-fun b!615008 () Bool)

(declare-fun Unit!19843 () Unit!19837)

(assert (=> b!615008 (= e!352624 Unit!19843)))

(declare-fun b!615009 () Bool)

(declare-fun res!396087 () Bool)

(assert (=> b!615009 (=> (not res!396087) (not e!352623))))

(assert (=> b!615009 (= res!396087 (and (= (size!18332 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18332 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18332 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!615010 () Bool)

(assert (=> b!615010 (= e!352614 (arrayContainsKey!0 lt!282245 (select (arr!17968 a!2986) j!136) index!984))))

(declare-fun b!615011 () Bool)

(declare-fun e!352616 () Bool)

(declare-fun lt!282251 () SeekEntryResult!6364)

(assert (=> b!615011 (= e!352616 (= lt!282254 lt!282251))))

(declare-fun b!615012 () Bool)

(declare-fun e!352625 () Unit!19837)

(declare-fun Unit!19844 () Unit!19837)

(assert (=> b!615012 (= e!352625 Unit!19844)))

(declare-fun res!396093 () Bool)

(assert (=> b!615012 (= res!396093 (= (select (store (arr!17968 a!2986) i!1108 k0!1786) index!984) (select (arr!17968 a!2986) j!136)))))

(assert (=> b!615012 (=> (not res!396093) (not e!352622))))

(assert (=> b!615012 e!352622))

(declare-fun c!69824 () Bool)

(assert (=> b!615012 (= c!69824 (bvslt j!136 index!984))))

(declare-fun lt!282253 () Unit!19837)

(assert (=> b!615012 (= lt!282253 e!352620)))

(declare-fun c!69827 () Bool)

(assert (=> b!615012 (= c!69827 (bvslt index!984 j!136))))

(declare-fun lt!282249 () Unit!19837)

(assert (=> b!615012 (= lt!282249 e!352624)))

(assert (=> b!615012 false))

(declare-fun b!615013 () Bool)

(declare-fun Unit!19845 () Unit!19837)

(assert (=> b!615013 (= e!352625 Unit!19845)))

(declare-fun b!615014 () Bool)

(assert (=> b!615014 (= e!352626 (not true))))

(declare-fun lt!282255 () Unit!19837)

(assert (=> b!615014 (= lt!282255 e!352625)))

(declare-fun c!69826 () Bool)

(declare-fun lt!282252 () SeekEntryResult!6364)

(assert (=> b!615014 (= c!69826 (= lt!282252 (Found!6364 index!984)))))

(declare-fun lt!282248 () Unit!19837)

(assert (=> b!615014 (= lt!282248 e!352621)))

(declare-fun c!69825 () Bool)

(assert (=> b!615014 (= c!69825 (= lt!282252 Undefined!6364))))

(declare-fun lt!282247 () (_ BitVec 64))

(assert (=> b!615014 (= lt!282252 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!282247 lt!282245 mask!3053))))

(assert (=> b!615014 e!352616))

(declare-fun res!396085 () Bool)

(assert (=> b!615014 (=> (not res!396085) (not e!352616))))

(declare-fun lt!282240 () (_ BitVec 32))

(assert (=> b!615014 (= res!396085 (= lt!282251 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!282240 vacantSpotIndex!68 lt!282247 lt!282245 mask!3053)))))

(assert (=> b!615014 (= lt!282251 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!282240 vacantSpotIndex!68 (select (arr!17968 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!615014 (= lt!282247 (select (store (arr!17968 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!282258 () Unit!19837)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37449 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19837)

(assert (=> b!615014 (= lt!282258 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!282240 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!615014 (= lt!282240 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!615015 () Bool)

(declare-fun Unit!19846 () Unit!19837)

(assert (=> b!615015 (= e!352620 Unit!19846)))

(declare-fun b!615016 () Bool)

(assert (=> b!615016 (= e!352618 e!352619)))

(declare-fun res!396092 () Bool)

(assert (=> b!615016 (=> (not res!396092) (not e!352619))))

(assert (=> b!615016 (= res!396092 (= (select (store (arr!17968 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!615016 (= lt!282245 (array!37450 (store (arr!17968 a!2986) i!1108 k0!1786) (size!18332 a!2986)))))

(assert (= (and start!56034 res!396097) b!615009))

(assert (= (and b!615009 res!396087) b!614995))

(assert (= (and b!614995 res!396089) b!615007))

(assert (= (and b!615007 res!396082) b!614997))

(assert (= (and b!614997 res!396094) b!615006))

(assert (= (and b!615006 res!396084) b!614998))

(assert (= (and b!614998 res!396088) b!614999))

(assert (= (and b!614999 res!396083) b!615003))

(assert (= (and b!615003 res!396090) b!615016))

(assert (= (and b!615016 res!396092) b!614993))

(assert (= (and b!614993 res!396086) b!615014))

(assert (= (and b!615014 res!396085) b!615011))

(assert (= (and b!615014 c!69825) b!614996))

(assert (= (and b!615014 (not c!69825)) b!615004))

(assert (= (and b!615014 c!69826) b!615012))

(assert (= (and b!615014 (not c!69826)) b!615013))

(assert (= (and b!615012 res!396093) b!615005))

(assert (= (and b!615005 (not res!396095)) b!615001))

(assert (= (and b!615001 res!396091) b!615010))

(assert (= (and b!615012 c!69824) b!615002))

(assert (= (and b!615012 (not c!69824)) b!615015))

(assert (= (and b!615012 c!69827) b!615000))

(assert (= (and b!615012 (not c!69827)) b!615008))

(assert (= (and b!615000 res!396096) b!614994))

(declare-fun m!591491 () Bool)

(assert (=> b!614993 m!591491))

(declare-fun m!591493 () Bool)

(assert (=> b!614993 m!591493))

(assert (=> b!614993 m!591493))

(declare-fun m!591495 () Bool)

(assert (=> b!614993 m!591495))

(declare-fun m!591497 () Bool)

(assert (=> b!614998 m!591497))

(declare-fun m!591499 () Bool)

(assert (=> b!614999 m!591499))

(assert (=> b!615002 m!591493))

(declare-fun m!591501 () Bool)

(assert (=> b!615002 m!591501))

(assert (=> b!615002 m!591493))

(declare-fun m!591503 () Bool)

(assert (=> b!615002 m!591503))

(assert (=> b!615002 m!591493))

(declare-fun m!591505 () Bool)

(assert (=> b!615002 m!591505))

(declare-fun m!591507 () Bool)

(assert (=> b!615002 m!591507))

(assert (=> b!615002 m!591493))

(declare-fun m!591509 () Bool)

(assert (=> b!615002 m!591509))

(declare-fun m!591511 () Bool)

(assert (=> b!615002 m!591511))

(declare-fun m!591513 () Bool)

(assert (=> b!615002 m!591513))

(declare-fun m!591515 () Bool)

(assert (=> b!614997 m!591515))

(declare-fun m!591517 () Bool)

(assert (=> b!615003 m!591517))

(declare-fun m!591519 () Bool)

(assert (=> b!615012 m!591519))

(declare-fun m!591521 () Bool)

(assert (=> b!615012 m!591521))

(assert (=> b!615012 m!591493))

(declare-fun m!591523 () Bool)

(assert (=> b!615014 m!591523))

(assert (=> b!615014 m!591493))

(assert (=> b!615014 m!591519))

(declare-fun m!591525 () Bool)

(assert (=> b!615014 m!591525))

(declare-fun m!591527 () Bool)

(assert (=> b!615014 m!591527))

(assert (=> b!615014 m!591493))

(declare-fun m!591529 () Bool)

(assert (=> b!615014 m!591529))

(declare-fun m!591531 () Bool)

(assert (=> b!615014 m!591531))

(declare-fun m!591533 () Bool)

(assert (=> b!615014 m!591533))

(declare-fun m!591535 () Bool)

(assert (=> start!56034 m!591535))

(declare-fun m!591537 () Bool)

(assert (=> start!56034 m!591537))

(assert (=> b!615010 m!591493))

(assert (=> b!615010 m!591493))

(declare-fun m!591539 () Bool)

(assert (=> b!615010 m!591539))

(assert (=> b!614994 m!591493))

(assert (=> b!614994 m!591493))

(assert (=> b!614994 m!591539))

(declare-fun m!591541 () Bool)

(assert (=> b!615007 m!591541))

(assert (=> b!614995 m!591493))

(assert (=> b!614995 m!591493))

(declare-fun m!591543 () Bool)

(assert (=> b!614995 m!591543))

(assert (=> b!615001 m!591493))

(assert (=> b!615001 m!591493))

(declare-fun m!591545 () Bool)

(assert (=> b!615001 m!591545))

(assert (=> b!615016 m!591519))

(declare-fun m!591547 () Bool)

(assert (=> b!615016 m!591547))

(assert (=> b!615000 m!591493))

(assert (=> b!615000 m!591493))

(declare-fun m!591549 () Bool)

(assert (=> b!615000 m!591549))

(assert (=> b!615000 m!591493))

(assert (=> b!615000 m!591545))

(assert (=> b!615000 m!591493))

(declare-fun m!591551 () Bool)

(assert (=> b!615000 m!591551))

(assert (=> b!615000 m!591513))

(declare-fun m!591553 () Bool)

(assert (=> b!615000 m!591553))

(declare-fun m!591555 () Bool)

(assert (=> b!615000 m!591555))

(assert (=> b!615000 m!591511))

(assert (=> b!615000 m!591493))

(declare-fun m!591557 () Bool)

(assert (=> b!615000 m!591557))

(declare-fun m!591559 () Bool)

(assert (=> b!615006 m!591559))

(check-sat (not b!615001) (not start!56034) (not b!614997) (not b!614998) (not b!615007) (not b!615002) (not b!614993) (not b!615006) (not b!615010) (not b!615014) (not b!614995) (not b!614999) (not b!614994) (not b!615000))
(check-sat)
