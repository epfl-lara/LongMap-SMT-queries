; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58442 () Bool)

(assert start!58442)

(declare-fun b!645436 () Bool)

(declare-fun res!418183 () Bool)

(declare-fun e!369896 () Bool)

(assert (=> b!645436 (=> (not res!418183) (not e!369896))))

(declare-datatypes ((array!38458 0))(
  ( (array!38459 (arr!18441 (Array (_ BitVec 32) (_ BitVec 64))) (size!18805 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38458)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38458 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!645436 (= res!418183 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!645437 () Bool)

(declare-fun e!369885 () Bool)

(assert (=> b!645437 (= e!369885 true)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!299298 () array!38458)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!645437 (arrayContainsKey!0 lt!299298 (select (arr!18441 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-datatypes ((Unit!21912 0))(
  ( (Unit!21913) )
))
(declare-fun lt!299305 () Unit!21912)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38458 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21912)

(assert (=> b!645437 (= lt!299305 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299298 (select (arr!18441 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!369887 () Bool)

(assert (=> b!645437 e!369887))

(declare-fun res!418187 () Bool)

(assert (=> b!645437 (=> (not res!418187) (not e!369887))))

(assert (=> b!645437 (= res!418187 (arrayContainsKey!0 lt!299298 (select (arr!18441 a!2986) j!136) j!136))))

(declare-fun b!645438 () Bool)

(declare-fun e!369893 () Bool)

(declare-fun e!369891 () Bool)

(assert (=> b!645438 (= e!369893 e!369891)))

(declare-fun res!418185 () Bool)

(assert (=> b!645438 (=> (not res!418185) (not e!369891))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!645438 (= res!418185 (= (select (store (arr!18441 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!645438 (= lt!299298 (array!38459 (store (arr!18441 a!2986) i!1108 k!1786) (size!18805 a!2986)))))

(declare-fun b!645439 () Bool)

(declare-fun e!369886 () Bool)

(declare-datatypes ((SeekEntryResult!6881 0))(
  ( (MissingZero!6881 (index!29859 (_ BitVec 32))) (Found!6881 (index!29860 (_ BitVec 32))) (Intermediate!6881 (undefined!7693 Bool) (index!29861 (_ BitVec 32)) (x!58634 (_ BitVec 32))) (Undefined!6881) (MissingVacant!6881 (index!29862 (_ BitVec 32))) )
))
(declare-fun lt!299299 () SeekEntryResult!6881)

(declare-fun lt!299296 () SeekEntryResult!6881)

(assert (=> b!645439 (= e!369886 (= lt!299299 lt!299296))))

(declare-fun b!645440 () Bool)

(declare-fun e!369897 () Unit!21912)

(declare-fun Unit!21914 () Unit!21912)

(assert (=> b!645440 (= e!369897 Unit!21914)))

(assert (=> b!645440 false))

(declare-fun b!645442 () Bool)

(declare-fun res!418189 () Bool)

(assert (=> b!645442 (=> (not res!418189) (not e!369893))))

(declare-datatypes ((List!12482 0))(
  ( (Nil!12479) (Cons!12478 (h!13523 (_ BitVec 64)) (t!18710 List!12482)) )
))
(declare-fun arrayNoDuplicates!0 (array!38458 (_ BitVec 32) List!12482) Bool)

(assert (=> b!645442 (= res!418189 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12479))))

(declare-fun b!645443 () Bool)

(declare-fun e!369892 () Bool)

(assert (=> b!645443 (= e!369892 e!369885)))

(declare-fun res!418181 () Bool)

(assert (=> b!645443 (=> res!418181 e!369885)))

(assert (=> b!645443 (= res!418181 (bvsge index!984 j!136))))

(declare-fun lt!299297 () Unit!21912)

(declare-fun e!369894 () Unit!21912)

(assert (=> b!645443 (= lt!299297 e!369894)))

(declare-fun c!73997 () Bool)

(assert (=> b!645443 (= c!73997 (bvslt j!136 index!984))))

(declare-fun b!645444 () Bool)

(declare-fun e!369889 () Bool)

(assert (=> b!645444 (= e!369891 e!369889)))

(declare-fun res!418193 () Bool)

(assert (=> b!645444 (=> (not res!418193) (not e!369889))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!645444 (= res!418193 (and (= lt!299299 (Found!6881 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18441 a!2986) index!984) (select (arr!18441 a!2986) j!136))) (not (= (select (arr!18441 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38458 (_ BitVec 32)) SeekEntryResult!6881)

(assert (=> b!645444 (= lt!299299 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18441 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!645445 () Bool)

(declare-fun res!418184 () Bool)

(assert (=> b!645445 (=> (not res!418184) (not e!369896))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!645445 (= res!418184 (validKeyInArray!0 k!1786))))

(declare-fun b!645446 () Bool)

(declare-fun res!418179 () Bool)

(assert (=> b!645446 (=> (not res!418179) (not e!369893))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38458 (_ BitVec 32)) Bool)

(assert (=> b!645446 (= res!418179 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun e!369883 () Bool)

(declare-fun b!645447 () Bool)

(assert (=> b!645447 (= e!369883 (arrayContainsKey!0 lt!299298 (select (arr!18441 a!2986) j!136) index!984))))

(declare-fun b!645448 () Bool)

(declare-fun Unit!21915 () Unit!21912)

(assert (=> b!645448 (= e!369894 Unit!21915)))

(declare-fun lt!299293 () Unit!21912)

(assert (=> b!645448 (= lt!299293 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299298 (select (arr!18441 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!645448 (arrayContainsKey!0 lt!299298 (select (arr!18441 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!299303 () Unit!21912)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38458 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12482) Unit!21912)

(assert (=> b!645448 (= lt!299303 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12479))))

(assert (=> b!645448 (arrayNoDuplicates!0 lt!299298 #b00000000000000000000000000000000 Nil!12479)))

(declare-fun lt!299302 () Unit!21912)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38458 (_ BitVec 32) (_ BitVec 32)) Unit!21912)

(assert (=> b!645448 (= lt!299302 (lemmaNoDuplicateFromThenFromBigger!0 lt!299298 #b00000000000000000000000000000000 j!136))))

(assert (=> b!645448 (arrayNoDuplicates!0 lt!299298 j!136 Nil!12479)))

(declare-fun lt!299307 () Unit!21912)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38458 (_ BitVec 64) (_ BitVec 32) List!12482) Unit!21912)

(assert (=> b!645448 (= lt!299307 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!299298 (select (arr!18441 a!2986) j!136) j!136 Nil!12479))))

(assert (=> b!645448 false))

(declare-fun b!645449 () Bool)

(declare-fun res!418192 () Bool)

(assert (=> b!645449 (=> (not res!418192) (not e!369896))))

(assert (=> b!645449 (= res!418192 (and (= (size!18805 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18805 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18805 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!645450 () Bool)

(declare-fun res!418180 () Bool)

(assert (=> b!645450 (=> (not res!418180) (not e!369893))))

(assert (=> b!645450 (= res!418180 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18441 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!418182 () Bool)

(assert (=> start!58442 (=> (not res!418182) (not e!369896))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58442 (= res!418182 (validMask!0 mask!3053))))

(assert (=> start!58442 e!369896))

(assert (=> start!58442 true))

(declare-fun array_inv!14237 (array!38458) Bool)

(assert (=> start!58442 (array_inv!14237 a!2986)))

(declare-fun b!645441 () Bool)

(assert (=> b!645441 (= e!369887 (arrayContainsKey!0 lt!299298 (select (arr!18441 a!2986) j!136) index!984))))

(declare-fun b!645451 () Bool)

(declare-fun res!418194 () Bool)

(assert (=> b!645451 (=> (not res!418194) (not e!369896))))

(assert (=> b!645451 (= res!418194 (validKeyInArray!0 (select (arr!18441 a!2986) j!136)))))

(declare-fun b!645452 () Bool)

(declare-fun Unit!21916 () Unit!21912)

(assert (=> b!645452 (= e!369894 Unit!21916)))

(declare-fun b!645453 () Bool)

(declare-fun e!369888 () Bool)

(assert (=> b!645453 (= e!369889 (not e!369888))))

(declare-fun res!418196 () Bool)

(assert (=> b!645453 (=> res!418196 e!369888)))

(declare-fun lt!299300 () SeekEntryResult!6881)

(assert (=> b!645453 (= res!418196 (not (= lt!299300 (Found!6881 index!984))))))

(declare-fun lt!299301 () Unit!21912)

(assert (=> b!645453 (= lt!299301 e!369897)))

(declare-fun c!73996 () Bool)

(assert (=> b!645453 (= c!73996 (= lt!299300 Undefined!6881))))

(declare-fun lt!299304 () (_ BitVec 64))

(assert (=> b!645453 (= lt!299300 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!299304 lt!299298 mask!3053))))

(assert (=> b!645453 e!369886))

(declare-fun res!418191 () Bool)

(assert (=> b!645453 (=> (not res!418191) (not e!369886))))

(declare-fun lt!299294 () (_ BitVec 32))

(assert (=> b!645453 (= res!418191 (= lt!299296 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299294 vacantSpotIndex!68 lt!299304 lt!299298 mask!3053)))))

(assert (=> b!645453 (= lt!299296 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299294 vacantSpotIndex!68 (select (arr!18441 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!645453 (= lt!299304 (select (store (arr!18441 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!299295 () Unit!21912)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38458 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21912)

(assert (=> b!645453 (= lt!299295 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!299294 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!645453 (= lt!299294 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!645454 () Bool)

(assert (=> b!645454 (= e!369888 e!369892)))

(declare-fun res!418195 () Bool)

(assert (=> b!645454 (=> res!418195 e!369892)))

(declare-fun lt!299306 () (_ BitVec 64))

(assert (=> b!645454 (= res!418195 (or (not (= (select (arr!18441 a!2986) j!136) lt!299304)) (not (= (select (arr!18441 a!2986) j!136) lt!299306))))))

(declare-fun e!369890 () Bool)

(assert (=> b!645454 e!369890))

(declare-fun res!418178 () Bool)

(assert (=> b!645454 (=> (not res!418178) (not e!369890))))

(assert (=> b!645454 (= res!418178 (= lt!299306 (select (arr!18441 a!2986) j!136)))))

(assert (=> b!645454 (= lt!299306 (select (store (arr!18441 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!645455 () Bool)

(assert (=> b!645455 (= e!369896 e!369893)))

(declare-fun res!418186 () Bool)

(assert (=> b!645455 (=> (not res!418186) (not e!369893))))

(declare-fun lt!299308 () SeekEntryResult!6881)

(assert (=> b!645455 (= res!418186 (or (= lt!299308 (MissingZero!6881 i!1108)) (= lt!299308 (MissingVacant!6881 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38458 (_ BitVec 32)) SeekEntryResult!6881)

(assert (=> b!645455 (= lt!299308 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!645456 () Bool)

(declare-fun e!369895 () Bool)

(assert (=> b!645456 (= e!369890 e!369895)))

(declare-fun res!418190 () Bool)

(assert (=> b!645456 (=> res!418190 e!369895)))

(assert (=> b!645456 (= res!418190 (or (not (= (select (arr!18441 a!2986) j!136) lt!299304)) (not (= (select (arr!18441 a!2986) j!136) lt!299306)) (bvsge j!136 index!984)))))

(declare-fun b!645457 () Bool)

(assert (=> b!645457 (= e!369895 e!369883)))

(declare-fun res!418188 () Bool)

(assert (=> b!645457 (=> (not res!418188) (not e!369883))))

(assert (=> b!645457 (= res!418188 (arrayContainsKey!0 lt!299298 (select (arr!18441 a!2986) j!136) j!136))))

(declare-fun b!645458 () Bool)

(declare-fun Unit!21917 () Unit!21912)

(assert (=> b!645458 (= e!369897 Unit!21917)))

(assert (= (and start!58442 res!418182) b!645449))

(assert (= (and b!645449 res!418192) b!645451))

(assert (= (and b!645451 res!418194) b!645445))

(assert (= (and b!645445 res!418184) b!645436))

(assert (= (and b!645436 res!418183) b!645455))

(assert (= (and b!645455 res!418186) b!645446))

(assert (= (and b!645446 res!418179) b!645442))

(assert (= (and b!645442 res!418189) b!645450))

(assert (= (and b!645450 res!418180) b!645438))

(assert (= (and b!645438 res!418185) b!645444))

(assert (= (and b!645444 res!418193) b!645453))

(assert (= (and b!645453 res!418191) b!645439))

(assert (= (and b!645453 c!73996) b!645440))

(assert (= (and b!645453 (not c!73996)) b!645458))

(assert (= (and b!645453 (not res!418196)) b!645454))

(assert (= (and b!645454 res!418178) b!645456))

(assert (= (and b!645456 (not res!418190)) b!645457))

(assert (= (and b!645457 res!418188) b!645447))

(assert (= (and b!645454 (not res!418195)) b!645443))

(assert (= (and b!645443 c!73997) b!645448))

(assert (= (and b!645443 (not c!73997)) b!645452))

(assert (= (and b!645443 (not res!418181)) b!645437))

(assert (= (and b!645437 res!418187) b!645441))

(declare-fun m!618953 () Bool)

(assert (=> b!645446 m!618953))

(declare-fun m!618955 () Bool)

(assert (=> b!645445 m!618955))

(declare-fun m!618957 () Bool)

(assert (=> b!645437 m!618957))

(assert (=> b!645437 m!618957))

(declare-fun m!618959 () Bool)

(assert (=> b!645437 m!618959))

(assert (=> b!645437 m!618957))

(declare-fun m!618961 () Bool)

(assert (=> b!645437 m!618961))

(assert (=> b!645437 m!618957))

(declare-fun m!618963 () Bool)

(assert (=> b!645437 m!618963))

(declare-fun m!618965 () Bool)

(assert (=> b!645455 m!618965))

(declare-fun m!618967 () Bool)

(assert (=> b!645450 m!618967))

(assert (=> b!645456 m!618957))

(declare-fun m!618969 () Bool)

(assert (=> b!645438 m!618969))

(declare-fun m!618971 () Bool)

(assert (=> b!645438 m!618971))

(declare-fun m!618973 () Bool)

(assert (=> b!645436 m!618973))

(assert (=> b!645451 m!618957))

(assert (=> b!645451 m!618957))

(declare-fun m!618975 () Bool)

(assert (=> b!645451 m!618975))

(assert (=> b!645447 m!618957))

(assert (=> b!645447 m!618957))

(declare-fun m!618977 () Bool)

(assert (=> b!645447 m!618977))

(assert (=> b!645454 m!618957))

(assert (=> b!645454 m!618969))

(declare-fun m!618979 () Bool)

(assert (=> b!645454 m!618979))

(declare-fun m!618981 () Bool)

(assert (=> start!58442 m!618981))

(declare-fun m!618983 () Bool)

(assert (=> start!58442 m!618983))

(declare-fun m!618985 () Bool)

(assert (=> b!645444 m!618985))

(assert (=> b!645444 m!618957))

(assert (=> b!645444 m!618957))

(declare-fun m!618987 () Bool)

(assert (=> b!645444 m!618987))

(declare-fun m!618989 () Bool)

(assert (=> b!645453 m!618989))

(declare-fun m!618991 () Bool)

(assert (=> b!645453 m!618991))

(declare-fun m!618993 () Bool)

(assert (=> b!645453 m!618993))

(assert (=> b!645453 m!618957))

(assert (=> b!645453 m!618969))

(assert (=> b!645453 m!618957))

(declare-fun m!618995 () Bool)

(assert (=> b!645453 m!618995))

(declare-fun m!618997 () Bool)

(assert (=> b!645453 m!618997))

(declare-fun m!618999 () Bool)

(assert (=> b!645453 m!618999))

(declare-fun m!619001 () Bool)

(assert (=> b!645442 m!619001))

(assert (=> b!645441 m!618957))

(assert (=> b!645441 m!618957))

(assert (=> b!645441 m!618977))

(assert (=> b!645457 m!618957))

(assert (=> b!645457 m!618957))

(assert (=> b!645457 m!618963))

(assert (=> b!645448 m!618957))

(declare-fun m!619003 () Bool)

(assert (=> b!645448 m!619003))

(assert (=> b!645448 m!618957))

(declare-fun m!619005 () Bool)

(assert (=> b!645448 m!619005))

(declare-fun m!619007 () Bool)

(assert (=> b!645448 m!619007))

(assert (=> b!645448 m!618957))

(assert (=> b!645448 m!618957))

(declare-fun m!619009 () Bool)

(assert (=> b!645448 m!619009))

(declare-fun m!619011 () Bool)

(assert (=> b!645448 m!619011))

(declare-fun m!619013 () Bool)

(assert (=> b!645448 m!619013))

(declare-fun m!619015 () Bool)

(assert (=> b!645448 m!619015))

(push 1)

