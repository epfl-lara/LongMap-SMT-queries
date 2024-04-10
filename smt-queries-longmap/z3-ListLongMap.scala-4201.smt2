; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57358 () Bool)

(assert start!57358)

(declare-fun b!635087 () Bool)

(declare-fun res!410909 () Bool)

(declare-fun e!363210 () Bool)

(assert (=> b!635087 (=> (not res!410909) (not e!363210))))

(declare-datatypes ((array!38211 0))(
  ( (array!38212 (arr!18334 (Array (_ BitVec 32) (_ BitVec 64))) (size!18698 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38211)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38211 (_ BitVec 32)) Bool)

(assert (=> b!635087 (= res!410909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!635088 () Bool)

(declare-fun res!410902 () Bool)

(declare-fun e!363215 () Bool)

(assert (=> b!635088 (=> (not res!410902) (not e!363215))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38211 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!635088 (= res!410902 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!635089 () Bool)

(declare-fun e!363209 () Bool)

(declare-datatypes ((SeekEntryResult!6774 0))(
  ( (MissingZero!6774 (index!29398 (_ BitVec 32))) (Found!6774 (index!29399 (_ BitVec 32))) (Intermediate!6774 (undefined!7586 Bool) (index!29400 (_ BitVec 32)) (x!58140 (_ BitVec 32))) (Undefined!6774) (MissingVacant!6774 (index!29401 (_ BitVec 32))) )
))
(declare-fun lt!293648 () SeekEntryResult!6774)

(declare-fun lt!293649 () SeekEntryResult!6774)

(assert (=> b!635089 (= e!363209 (= lt!293648 lt!293649))))

(declare-fun b!635090 () Bool)

(declare-fun res!410895 () Bool)

(assert (=> b!635090 (=> (not res!410895) (not e!363210))))

(declare-datatypes ((List!12375 0))(
  ( (Nil!12372) (Cons!12371 (h!13416 (_ BitVec 64)) (t!18603 List!12375)) )
))
(declare-fun arrayNoDuplicates!0 (array!38211 (_ BitVec 32) List!12375) Bool)

(assert (=> b!635090 (= res!410895 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12372))))

(declare-fun b!635091 () Bool)

(declare-datatypes ((Unit!21430 0))(
  ( (Unit!21431) )
))
(declare-fun e!363211 () Unit!21430)

(declare-fun Unit!21432 () Unit!21430)

(assert (=> b!635091 (= e!363211 Unit!21432)))

(declare-fun b!635092 () Bool)

(declare-fun res!410905 () Bool)

(assert (=> b!635092 (=> (not res!410905) (not e!363215))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!635092 (= res!410905 (validKeyInArray!0 k0!1786))))

(declare-fun b!635093 () Bool)

(declare-fun e!363208 () Bool)

(assert (=> b!635093 (= e!363210 e!363208)))

(declare-fun res!410898 () Bool)

(assert (=> b!635093 (=> (not res!410898) (not e!363208))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!635093 (= res!410898 (= (select (store (arr!18334 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!293644 () array!38211)

(assert (=> b!635093 (= lt!293644 (array!38212 (store (arr!18334 a!2986) i!1108 k0!1786) (size!18698 a!2986)))))

(declare-fun b!635094 () Bool)

(declare-fun e!363219 () Bool)

(declare-fun e!363212 () Bool)

(assert (=> b!635094 (= e!363219 e!363212)))

(declare-fun res!410901 () Bool)

(assert (=> b!635094 (=> res!410901 e!363212)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!293643 () (_ BitVec 64))

(declare-fun lt!293650 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!635094 (= res!410901 (or (not (= (select (arr!18334 a!2986) j!136) lt!293650)) (not (= (select (arr!18334 a!2986) j!136) lt!293643)) (bvsge j!136 index!984)))))

(declare-fun b!635095 () Bool)

(declare-fun e!363217 () Bool)

(assert (=> b!635095 (= e!363217 (bvslt (size!18698 a!2986) #b01111111111111111111111111111111))))

(assert (=> b!635095 (arrayContainsKey!0 lt!293644 (select (arr!18334 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!293653 () Unit!21430)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38211 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21430)

(assert (=> b!635095 (= lt!293653 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!293644 (select (arr!18334 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!363216 () Bool)

(declare-fun b!635096 () Bool)

(assert (=> b!635096 (= e!363216 (arrayContainsKey!0 lt!293644 (select (arr!18334 a!2986) j!136) index!984))))

(declare-fun b!635097 () Bool)

(declare-fun e!363214 () Bool)

(assert (=> b!635097 (= e!363214 e!363217)))

(declare-fun res!410897 () Bool)

(assert (=> b!635097 (=> res!410897 e!363217)))

(assert (=> b!635097 (= res!410897 (or (not (= (select (arr!18334 a!2986) j!136) lt!293650)) (not (= (select (arr!18334 a!2986) j!136) lt!293643)) (bvsge j!136 index!984)))))

(assert (=> b!635097 e!363219))

(declare-fun res!410903 () Bool)

(assert (=> b!635097 (=> (not res!410903) (not e!363219))))

(assert (=> b!635097 (= res!410903 (= lt!293643 (select (arr!18334 a!2986) j!136)))))

(assert (=> b!635097 (= lt!293643 (select (store (arr!18334 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!635098 () Bool)

(declare-fun e!363218 () Bool)

(assert (=> b!635098 (= e!363218 (not e!363214))))

(declare-fun res!410907 () Bool)

(assert (=> b!635098 (=> res!410907 e!363214)))

(declare-fun lt!293647 () SeekEntryResult!6774)

(assert (=> b!635098 (= res!410907 (not (= lt!293647 (Found!6774 index!984))))))

(declare-fun lt!293645 () Unit!21430)

(assert (=> b!635098 (= lt!293645 e!363211)))

(declare-fun c!72464 () Bool)

(assert (=> b!635098 (= c!72464 (= lt!293647 Undefined!6774))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38211 (_ BitVec 32)) SeekEntryResult!6774)

(assert (=> b!635098 (= lt!293647 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!293650 lt!293644 mask!3053))))

(assert (=> b!635098 e!363209))

(declare-fun res!410904 () Bool)

(assert (=> b!635098 (=> (not res!410904) (not e!363209))))

(declare-fun lt!293652 () (_ BitVec 32))

(assert (=> b!635098 (= res!410904 (= lt!293649 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293652 vacantSpotIndex!68 lt!293650 lt!293644 mask!3053)))))

(assert (=> b!635098 (= lt!293649 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293652 vacantSpotIndex!68 (select (arr!18334 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!635098 (= lt!293650 (select (store (arr!18334 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!293651 () Unit!21430)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38211 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21430)

(assert (=> b!635098 (= lt!293651 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!293652 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!635098 (= lt!293652 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!410908 () Bool)

(assert (=> start!57358 (=> (not res!410908) (not e!363215))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57358 (= res!410908 (validMask!0 mask!3053))))

(assert (=> start!57358 e!363215))

(assert (=> start!57358 true))

(declare-fun array_inv!14130 (array!38211) Bool)

(assert (=> start!57358 (array_inv!14130 a!2986)))

(declare-fun b!635099 () Bool)

(declare-fun res!410893 () Bool)

(assert (=> b!635099 (=> (not res!410893) (not e!363215))))

(assert (=> b!635099 (= res!410893 (and (= (size!18698 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18698 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18698 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!635100 () Bool)

(declare-fun res!410906 () Bool)

(assert (=> b!635100 (=> (not res!410906) (not e!363215))))

(assert (=> b!635100 (= res!410906 (validKeyInArray!0 (select (arr!18334 a!2986) j!136)))))

(declare-fun b!635101 () Bool)

(assert (=> b!635101 (= e!363212 e!363216)))

(declare-fun res!410894 () Bool)

(assert (=> b!635101 (=> (not res!410894) (not e!363216))))

(assert (=> b!635101 (= res!410894 (arrayContainsKey!0 lt!293644 (select (arr!18334 a!2986) j!136) j!136))))

(declare-fun b!635102 () Bool)

(declare-fun Unit!21433 () Unit!21430)

(assert (=> b!635102 (= e!363211 Unit!21433)))

(assert (=> b!635102 false))

(declare-fun b!635103 () Bool)

(assert (=> b!635103 (= e!363215 e!363210)))

(declare-fun res!410896 () Bool)

(assert (=> b!635103 (=> (not res!410896) (not e!363210))))

(declare-fun lt!293646 () SeekEntryResult!6774)

(assert (=> b!635103 (= res!410896 (or (= lt!293646 (MissingZero!6774 i!1108)) (= lt!293646 (MissingVacant!6774 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38211 (_ BitVec 32)) SeekEntryResult!6774)

(assert (=> b!635103 (= lt!293646 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!635104 () Bool)

(declare-fun res!410899 () Bool)

(assert (=> b!635104 (=> (not res!410899) (not e!363210))))

(assert (=> b!635104 (= res!410899 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18334 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!635105 () Bool)

(assert (=> b!635105 (= e!363208 e!363218)))

(declare-fun res!410900 () Bool)

(assert (=> b!635105 (=> (not res!410900) (not e!363218))))

(assert (=> b!635105 (= res!410900 (and (= lt!293648 (Found!6774 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18334 a!2986) index!984) (select (arr!18334 a!2986) j!136))) (not (= (select (arr!18334 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!635105 (= lt!293648 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18334 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!57358 res!410908) b!635099))

(assert (= (and b!635099 res!410893) b!635100))

(assert (= (and b!635100 res!410906) b!635092))

(assert (= (and b!635092 res!410905) b!635088))

(assert (= (and b!635088 res!410902) b!635103))

(assert (= (and b!635103 res!410896) b!635087))

(assert (= (and b!635087 res!410909) b!635090))

(assert (= (and b!635090 res!410895) b!635104))

(assert (= (and b!635104 res!410899) b!635093))

(assert (= (and b!635093 res!410898) b!635105))

(assert (= (and b!635105 res!410900) b!635098))

(assert (= (and b!635098 res!410904) b!635089))

(assert (= (and b!635098 c!72464) b!635102))

(assert (= (and b!635098 (not c!72464)) b!635091))

(assert (= (and b!635098 (not res!410907)) b!635097))

(assert (= (and b!635097 res!410903) b!635094))

(assert (= (and b!635094 (not res!410901)) b!635101))

(assert (= (and b!635101 res!410894) b!635096))

(assert (= (and b!635097 (not res!410897)) b!635095))

(declare-fun m!609493 () Bool)

(assert (=> b!635095 m!609493))

(assert (=> b!635095 m!609493))

(declare-fun m!609495 () Bool)

(assert (=> b!635095 m!609495))

(assert (=> b!635095 m!609493))

(declare-fun m!609497 () Bool)

(assert (=> b!635095 m!609497))

(declare-fun m!609499 () Bool)

(assert (=> b!635087 m!609499))

(declare-fun m!609501 () Bool)

(assert (=> b!635104 m!609501))

(declare-fun m!609503 () Bool)

(assert (=> start!57358 m!609503))

(declare-fun m!609505 () Bool)

(assert (=> start!57358 m!609505))

(declare-fun m!609507 () Bool)

(assert (=> b!635088 m!609507))

(assert (=> b!635100 m!609493))

(assert (=> b!635100 m!609493))

(declare-fun m!609509 () Bool)

(assert (=> b!635100 m!609509))

(declare-fun m!609511 () Bool)

(assert (=> b!635103 m!609511))

(declare-fun m!609513 () Bool)

(assert (=> b!635098 m!609513))

(declare-fun m!609515 () Bool)

(assert (=> b!635098 m!609515))

(declare-fun m!609517 () Bool)

(assert (=> b!635098 m!609517))

(assert (=> b!635098 m!609493))

(declare-fun m!609519 () Bool)

(assert (=> b!635098 m!609519))

(declare-fun m!609521 () Bool)

(assert (=> b!635098 m!609521))

(declare-fun m!609523 () Bool)

(assert (=> b!635098 m!609523))

(assert (=> b!635098 m!609493))

(declare-fun m!609525 () Bool)

(assert (=> b!635098 m!609525))

(declare-fun m!609527 () Bool)

(assert (=> b!635090 m!609527))

(assert (=> b!635097 m!609493))

(assert (=> b!635097 m!609521))

(declare-fun m!609529 () Bool)

(assert (=> b!635097 m!609529))

(assert (=> b!635096 m!609493))

(assert (=> b!635096 m!609493))

(declare-fun m!609531 () Bool)

(assert (=> b!635096 m!609531))

(assert (=> b!635093 m!609521))

(declare-fun m!609533 () Bool)

(assert (=> b!635093 m!609533))

(assert (=> b!635101 m!609493))

(assert (=> b!635101 m!609493))

(declare-fun m!609535 () Bool)

(assert (=> b!635101 m!609535))

(declare-fun m!609537 () Bool)

(assert (=> b!635105 m!609537))

(assert (=> b!635105 m!609493))

(assert (=> b!635105 m!609493))

(declare-fun m!609539 () Bool)

(assert (=> b!635105 m!609539))

(assert (=> b!635094 m!609493))

(declare-fun m!609541 () Bool)

(assert (=> b!635092 m!609541))

(check-sat (not b!635095) (not b!635103) (not b!635088) (not b!635098) (not b!635100) (not b!635090) (not b!635105) (not b!635092) (not b!635101) (not b!635087) (not b!635096) (not start!57358))
(check-sat)
(get-model)

(declare-fun d!89709 () Bool)

(declare-fun res!410965 () Bool)

(declare-fun e!363260 () Bool)

(assert (=> d!89709 (=> res!410965 e!363260)))

(assert (=> d!89709 (= res!410965 (= (select (arr!18334 lt!293644) index!984) (select (arr!18334 a!2986) j!136)))))

(assert (=> d!89709 (= (arrayContainsKey!0 lt!293644 (select (arr!18334 a!2986) j!136) index!984) e!363260)))

(declare-fun b!635167 () Bool)

(declare-fun e!363261 () Bool)

(assert (=> b!635167 (= e!363260 e!363261)))

(declare-fun res!410966 () Bool)

(assert (=> b!635167 (=> (not res!410966) (not e!363261))))

(assert (=> b!635167 (= res!410966 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18698 lt!293644)))))

(declare-fun b!635168 () Bool)

(assert (=> b!635168 (= e!363261 (arrayContainsKey!0 lt!293644 (select (arr!18334 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!89709 (not res!410965)) b!635167))

(assert (= (and b!635167 res!410966) b!635168))

(declare-fun m!609593 () Bool)

(assert (=> d!89709 m!609593))

(assert (=> b!635168 m!609493))

(declare-fun m!609595 () Bool)

(assert (=> b!635168 m!609595))

(assert (=> b!635096 d!89709))

(declare-fun d!89711 () Bool)

(assert (=> d!89711 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!57358 d!89711))

(declare-fun d!89713 () Bool)

(assert (=> d!89713 (= (array_inv!14130 a!2986) (bvsge (size!18698 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!57358 d!89713))

(declare-fun b!635177 () Bool)

(declare-fun e!363270 () Bool)

(declare-fun e!363268 () Bool)

(assert (=> b!635177 (= e!363270 e!363268)))

(declare-fun c!72470 () Bool)

(assert (=> b!635177 (= c!72470 (validKeyInArray!0 (select (arr!18334 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!89715 () Bool)

(declare-fun res!410972 () Bool)

(assert (=> d!89715 (=> res!410972 e!363270)))

(assert (=> d!89715 (= res!410972 (bvsge #b00000000000000000000000000000000 (size!18698 a!2986)))))

(assert (=> d!89715 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!363270)))

(declare-fun b!635178 () Bool)

(declare-fun e!363269 () Bool)

(declare-fun call!33398 () Bool)

(assert (=> b!635178 (= e!363269 call!33398)))

(declare-fun bm!33395 () Bool)

(assert (=> bm!33395 (= call!33398 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!635179 () Bool)

(assert (=> b!635179 (= e!363268 call!33398)))

(declare-fun b!635180 () Bool)

(assert (=> b!635180 (= e!363268 e!363269)))

(declare-fun lt!293694 () (_ BitVec 64))

(assert (=> b!635180 (= lt!293694 (select (arr!18334 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!293695 () Unit!21430)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38211 (_ BitVec 64) (_ BitVec 32)) Unit!21430)

(assert (=> b!635180 (= lt!293695 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!293694 #b00000000000000000000000000000000))))

(assert (=> b!635180 (arrayContainsKey!0 a!2986 lt!293694 #b00000000000000000000000000000000)))

(declare-fun lt!293693 () Unit!21430)

(assert (=> b!635180 (= lt!293693 lt!293695)))

(declare-fun res!410971 () Bool)

(assert (=> b!635180 (= res!410971 (= (seekEntryOrOpen!0 (select (arr!18334 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6774 #b00000000000000000000000000000000)))))

(assert (=> b!635180 (=> (not res!410971) (not e!363269))))

(assert (= (and d!89715 (not res!410972)) b!635177))

(assert (= (and b!635177 c!72470) b!635180))

(assert (= (and b!635177 (not c!72470)) b!635179))

(assert (= (and b!635180 res!410971) b!635178))

(assert (= (or b!635178 b!635179) bm!33395))

(declare-fun m!609597 () Bool)

(assert (=> b!635177 m!609597))

(assert (=> b!635177 m!609597))

(declare-fun m!609599 () Bool)

(assert (=> b!635177 m!609599))

(declare-fun m!609601 () Bool)

(assert (=> bm!33395 m!609601))

(assert (=> b!635180 m!609597))

(declare-fun m!609603 () Bool)

(assert (=> b!635180 m!609603))

(declare-fun m!609605 () Bool)

(assert (=> b!635180 m!609605))

(assert (=> b!635180 m!609597))

(declare-fun m!609607 () Bool)

(assert (=> b!635180 m!609607))

(assert (=> b!635087 d!89715))

(declare-fun d!89717 () Bool)

(declare-fun res!410973 () Bool)

(declare-fun e!363271 () Bool)

(assert (=> d!89717 (=> res!410973 e!363271)))

(assert (=> d!89717 (= res!410973 (= (select (arr!18334 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!89717 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!363271)))

(declare-fun b!635181 () Bool)

(declare-fun e!363272 () Bool)

(assert (=> b!635181 (= e!363271 e!363272)))

(declare-fun res!410974 () Bool)

(assert (=> b!635181 (=> (not res!410974) (not e!363272))))

(assert (=> b!635181 (= res!410974 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18698 a!2986)))))

(declare-fun b!635182 () Bool)

(assert (=> b!635182 (= e!363272 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!89717 (not res!410973)) b!635181))

(assert (= (and b!635181 res!410974) b!635182))

(assert (=> d!89717 m!609597))

(declare-fun m!609609 () Bool)

(assert (=> b!635182 m!609609))

(assert (=> b!635088 d!89717))

(declare-fun d!89719 () Bool)

(declare-fun e!363275 () Bool)

(assert (=> d!89719 e!363275))

(declare-fun res!410977 () Bool)

(assert (=> d!89719 (=> (not res!410977) (not e!363275))))

(assert (=> d!89719 (= res!410977 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18698 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18698 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18698 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18698 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18698 a!2986))))))

(declare-fun lt!293698 () Unit!21430)

(declare-fun choose!9 (array!38211 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21430)

(assert (=> d!89719 (= lt!293698 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!293652 vacantSpotIndex!68 mask!3053))))

(assert (=> d!89719 (validMask!0 mask!3053)))

(assert (=> d!89719 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!293652 vacantSpotIndex!68 mask!3053) lt!293698)))

(declare-fun b!635185 () Bool)

(assert (=> b!635185 (= e!363275 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293652 vacantSpotIndex!68 (select (arr!18334 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293652 vacantSpotIndex!68 (select (store (arr!18334 a!2986) i!1108 k0!1786) j!136) (array!38212 (store (arr!18334 a!2986) i!1108 k0!1786) (size!18698 a!2986)) mask!3053)))))

(assert (= (and d!89719 res!410977) b!635185))

(declare-fun m!609611 () Bool)

(assert (=> d!89719 m!609611))

(assert (=> d!89719 m!609503))

(assert (=> b!635185 m!609515))

(assert (=> b!635185 m!609493))

(assert (=> b!635185 m!609493))

(assert (=> b!635185 m!609525))

(assert (=> b!635185 m!609515))

(declare-fun m!609613 () Bool)

(assert (=> b!635185 m!609613))

(assert (=> b!635185 m!609521))

(assert (=> b!635098 d!89719))

(declare-fun e!363287 () SeekEntryResult!6774)

(declare-fun b!635202 () Bool)

(assert (=> b!635202 (= e!363287 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!293652 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!293650 lt!293644 mask!3053))))

(declare-fun b!635203 () Bool)

(declare-fun e!363286 () SeekEntryResult!6774)

(declare-fun e!363288 () SeekEntryResult!6774)

(assert (=> b!635203 (= e!363286 e!363288)))

(declare-fun c!72478 () Bool)

(declare-fun lt!293703 () (_ BitVec 64))

(assert (=> b!635203 (= c!72478 (= lt!293703 lt!293650))))

(declare-fun b!635204 () Bool)

(assert (=> b!635204 (= e!363286 Undefined!6774)))

(declare-fun b!635205 () Bool)

(assert (=> b!635205 (= e!363288 (Found!6774 lt!293652))))

(declare-fun b!635206 () Bool)

(declare-fun c!72479 () Bool)

(assert (=> b!635206 (= c!72479 (= lt!293703 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!635206 (= e!363288 e!363287)))

(declare-fun b!635207 () Bool)

(assert (=> b!635207 (= e!363287 (MissingVacant!6774 vacantSpotIndex!68))))

(declare-fun lt!293704 () SeekEntryResult!6774)

(declare-fun d!89721 () Bool)

(get-info :version)

(assert (=> d!89721 (and (or ((_ is Undefined!6774) lt!293704) (not ((_ is Found!6774) lt!293704)) (and (bvsge (index!29399 lt!293704) #b00000000000000000000000000000000) (bvslt (index!29399 lt!293704) (size!18698 lt!293644)))) (or ((_ is Undefined!6774) lt!293704) ((_ is Found!6774) lt!293704) (not ((_ is MissingVacant!6774) lt!293704)) (not (= (index!29401 lt!293704) vacantSpotIndex!68)) (and (bvsge (index!29401 lt!293704) #b00000000000000000000000000000000) (bvslt (index!29401 lt!293704) (size!18698 lt!293644)))) (or ((_ is Undefined!6774) lt!293704) (ite ((_ is Found!6774) lt!293704) (= (select (arr!18334 lt!293644) (index!29399 lt!293704)) lt!293650) (and ((_ is MissingVacant!6774) lt!293704) (= (index!29401 lt!293704) vacantSpotIndex!68) (= (select (arr!18334 lt!293644) (index!29401 lt!293704)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89721 (= lt!293704 e!363286)))

(declare-fun c!72477 () Bool)

(assert (=> d!89721 (= c!72477 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!89721 (= lt!293703 (select (arr!18334 lt!293644) lt!293652))))

(assert (=> d!89721 (validMask!0 mask!3053)))

(assert (=> d!89721 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293652 vacantSpotIndex!68 lt!293650 lt!293644 mask!3053) lt!293704)))

(assert (= (and d!89721 c!72477) b!635204))

(assert (= (and d!89721 (not c!72477)) b!635203))

(assert (= (and b!635203 c!72478) b!635205))

(assert (= (and b!635203 (not c!72478)) b!635206))

(assert (= (and b!635206 c!72479) b!635207))

(assert (= (and b!635206 (not c!72479)) b!635202))

(declare-fun m!609615 () Bool)

(assert (=> b!635202 m!609615))

(assert (=> b!635202 m!609615))

(declare-fun m!609617 () Bool)

(assert (=> b!635202 m!609617))

(declare-fun m!609621 () Bool)

(assert (=> d!89721 m!609621))

(declare-fun m!609625 () Bool)

(assert (=> d!89721 m!609625))

(declare-fun m!609627 () Bool)

(assert (=> d!89721 m!609627))

(assert (=> d!89721 m!609503))

(assert (=> b!635098 d!89721))

(declare-fun b!635210 () Bool)

(declare-fun e!363292 () SeekEntryResult!6774)

(assert (=> b!635210 (= e!363292 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!293650 lt!293644 mask!3053))))

(declare-fun b!635211 () Bool)

(declare-fun e!363291 () SeekEntryResult!6774)

(declare-fun e!363293 () SeekEntryResult!6774)

(assert (=> b!635211 (= e!363291 e!363293)))

(declare-fun c!72481 () Bool)

(declare-fun lt!293705 () (_ BitVec 64))

(assert (=> b!635211 (= c!72481 (= lt!293705 lt!293650))))

(declare-fun b!635212 () Bool)

(assert (=> b!635212 (= e!363291 Undefined!6774)))

(declare-fun b!635213 () Bool)

(assert (=> b!635213 (= e!363293 (Found!6774 index!984))))

(declare-fun b!635214 () Bool)

(declare-fun c!72482 () Bool)

(assert (=> b!635214 (= c!72482 (= lt!293705 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!635214 (= e!363293 e!363292)))

(declare-fun b!635215 () Bool)

(assert (=> b!635215 (= e!363292 (MissingVacant!6774 vacantSpotIndex!68))))

(declare-fun lt!293706 () SeekEntryResult!6774)

(declare-fun d!89733 () Bool)

(assert (=> d!89733 (and (or ((_ is Undefined!6774) lt!293706) (not ((_ is Found!6774) lt!293706)) (and (bvsge (index!29399 lt!293706) #b00000000000000000000000000000000) (bvslt (index!29399 lt!293706) (size!18698 lt!293644)))) (or ((_ is Undefined!6774) lt!293706) ((_ is Found!6774) lt!293706) (not ((_ is MissingVacant!6774) lt!293706)) (not (= (index!29401 lt!293706) vacantSpotIndex!68)) (and (bvsge (index!29401 lt!293706) #b00000000000000000000000000000000) (bvslt (index!29401 lt!293706) (size!18698 lt!293644)))) (or ((_ is Undefined!6774) lt!293706) (ite ((_ is Found!6774) lt!293706) (= (select (arr!18334 lt!293644) (index!29399 lt!293706)) lt!293650) (and ((_ is MissingVacant!6774) lt!293706) (= (index!29401 lt!293706) vacantSpotIndex!68) (= (select (arr!18334 lt!293644) (index!29401 lt!293706)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89733 (= lt!293706 e!363291)))

(declare-fun c!72480 () Bool)

(assert (=> d!89733 (= c!72480 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!89733 (= lt!293705 (select (arr!18334 lt!293644) index!984))))

(assert (=> d!89733 (validMask!0 mask!3053)))

(assert (=> d!89733 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!293650 lt!293644 mask!3053) lt!293706)))

(assert (= (and d!89733 c!72480) b!635212))

(assert (= (and d!89733 (not c!72480)) b!635211))

(assert (= (and b!635211 c!72481) b!635213))

(assert (= (and b!635211 (not c!72481)) b!635214))

(assert (= (and b!635214 c!72482) b!635215))

(assert (= (and b!635214 (not c!72482)) b!635210))

(assert (=> b!635210 m!609513))

(assert (=> b!635210 m!609513))

(declare-fun m!609629 () Bool)

(assert (=> b!635210 m!609629))

(declare-fun m!609631 () Bool)

(assert (=> d!89733 m!609631))

(declare-fun m!609633 () Bool)

(assert (=> d!89733 m!609633))

(assert (=> d!89733 m!609593))

(assert (=> d!89733 m!609503))

(assert (=> b!635098 d!89733))

(declare-fun d!89735 () Bool)

(declare-fun lt!293709 () (_ BitVec 32))

(assert (=> d!89735 (and (bvsge lt!293709 #b00000000000000000000000000000000) (bvslt lt!293709 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89735 (= lt!293709 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!89735 (validMask!0 mask!3053)))

(assert (=> d!89735 (= (nextIndex!0 index!984 x!910 mask!3053) lt!293709)))

(declare-fun bs!19090 () Bool)

(assert (= bs!19090 d!89735))

(declare-fun m!609635 () Bool)

(assert (=> bs!19090 m!609635))

(assert (=> bs!19090 m!609503))

(assert (=> b!635098 d!89735))

(declare-fun b!635216 () Bool)

(declare-fun e!363295 () SeekEntryResult!6774)

(assert (=> b!635216 (= e!363295 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!293652 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18334 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!635217 () Bool)

(declare-fun e!363294 () SeekEntryResult!6774)

(declare-fun e!363296 () SeekEntryResult!6774)

(assert (=> b!635217 (= e!363294 e!363296)))

(declare-fun c!72484 () Bool)

(declare-fun lt!293710 () (_ BitVec 64))

(assert (=> b!635217 (= c!72484 (= lt!293710 (select (arr!18334 a!2986) j!136)))))

(declare-fun b!635218 () Bool)

(assert (=> b!635218 (= e!363294 Undefined!6774)))

(declare-fun b!635219 () Bool)

(assert (=> b!635219 (= e!363296 (Found!6774 lt!293652))))

(declare-fun b!635220 () Bool)

(declare-fun c!72485 () Bool)

(assert (=> b!635220 (= c!72485 (= lt!293710 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!635220 (= e!363296 e!363295)))

(declare-fun b!635221 () Bool)

(assert (=> b!635221 (= e!363295 (MissingVacant!6774 vacantSpotIndex!68))))

(declare-fun d!89737 () Bool)

(declare-fun lt!293711 () SeekEntryResult!6774)

(assert (=> d!89737 (and (or ((_ is Undefined!6774) lt!293711) (not ((_ is Found!6774) lt!293711)) (and (bvsge (index!29399 lt!293711) #b00000000000000000000000000000000) (bvslt (index!29399 lt!293711) (size!18698 a!2986)))) (or ((_ is Undefined!6774) lt!293711) ((_ is Found!6774) lt!293711) (not ((_ is MissingVacant!6774) lt!293711)) (not (= (index!29401 lt!293711) vacantSpotIndex!68)) (and (bvsge (index!29401 lt!293711) #b00000000000000000000000000000000) (bvslt (index!29401 lt!293711) (size!18698 a!2986)))) (or ((_ is Undefined!6774) lt!293711) (ite ((_ is Found!6774) lt!293711) (= (select (arr!18334 a!2986) (index!29399 lt!293711)) (select (arr!18334 a!2986) j!136)) (and ((_ is MissingVacant!6774) lt!293711) (= (index!29401 lt!293711) vacantSpotIndex!68) (= (select (arr!18334 a!2986) (index!29401 lt!293711)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89737 (= lt!293711 e!363294)))

(declare-fun c!72483 () Bool)

(assert (=> d!89737 (= c!72483 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!89737 (= lt!293710 (select (arr!18334 a!2986) lt!293652))))

(assert (=> d!89737 (validMask!0 mask!3053)))

(assert (=> d!89737 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293652 vacantSpotIndex!68 (select (arr!18334 a!2986) j!136) a!2986 mask!3053) lt!293711)))

(assert (= (and d!89737 c!72483) b!635218))

(assert (= (and d!89737 (not c!72483)) b!635217))

(assert (= (and b!635217 c!72484) b!635219))

(assert (= (and b!635217 (not c!72484)) b!635220))

(assert (= (and b!635220 c!72485) b!635221))

(assert (= (and b!635220 (not c!72485)) b!635216))

(assert (=> b!635216 m!609615))

(assert (=> b!635216 m!609615))

(assert (=> b!635216 m!609493))

(declare-fun m!609637 () Bool)

(assert (=> b!635216 m!609637))

(declare-fun m!609639 () Bool)

(assert (=> d!89737 m!609639))

(declare-fun m!609641 () Bool)

(assert (=> d!89737 m!609641))

(declare-fun m!609643 () Bool)

(assert (=> d!89737 m!609643))

(assert (=> d!89737 m!609503))

(assert (=> b!635098 d!89737))

(declare-fun d!89739 () Bool)

(assert (=> d!89739 (= (validKeyInArray!0 (select (arr!18334 a!2986) j!136)) (and (not (= (select (arr!18334 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18334 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!635100 d!89739))

(declare-fun b!635246 () Bool)

(declare-fun e!363313 () Bool)

(declare-fun call!33401 () Bool)

(assert (=> b!635246 (= e!363313 call!33401)))

(declare-fun b!635247 () Bool)

(declare-fun e!363311 () Bool)

(assert (=> b!635247 (= e!363311 e!363313)))

(declare-fun c!72494 () Bool)

(assert (=> b!635247 (= c!72494 (validKeyInArray!0 (select (arr!18334 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!635248 () Bool)

(declare-fun e!363312 () Bool)

(declare-fun contains!3096 (List!12375 (_ BitVec 64)) Bool)

(assert (=> b!635248 (= e!363312 (contains!3096 Nil!12372 (select (arr!18334 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!635249 () Bool)

(assert (=> b!635249 (= e!363313 call!33401)))

(declare-fun bm!33398 () Bool)

(assert (=> bm!33398 (= call!33401 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!72494 (Cons!12371 (select (arr!18334 a!2986) #b00000000000000000000000000000000) Nil!12372) Nil!12372)))))

(declare-fun b!635250 () Bool)

(declare-fun e!363314 () Bool)

(assert (=> b!635250 (= e!363314 e!363311)))

(declare-fun res!410992 () Bool)

(assert (=> b!635250 (=> (not res!410992) (not e!363311))))

(assert (=> b!635250 (= res!410992 (not e!363312))))

(declare-fun res!410990 () Bool)

(assert (=> b!635250 (=> (not res!410990) (not e!363312))))

(assert (=> b!635250 (= res!410990 (validKeyInArray!0 (select (arr!18334 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!89741 () Bool)

(declare-fun res!410991 () Bool)

(assert (=> d!89741 (=> res!410991 e!363314)))

(assert (=> d!89741 (= res!410991 (bvsge #b00000000000000000000000000000000 (size!18698 a!2986)))))

(assert (=> d!89741 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12372) e!363314)))

(assert (= (and d!89741 (not res!410991)) b!635250))

(assert (= (and b!635250 res!410990) b!635248))

(assert (= (and b!635250 res!410992) b!635247))

(assert (= (and b!635247 c!72494) b!635246))

(assert (= (and b!635247 (not c!72494)) b!635249))

(assert (= (or b!635246 b!635249) bm!33398))

(assert (=> b!635247 m!609597))

(assert (=> b!635247 m!609597))

(assert (=> b!635247 m!609599))

(assert (=> b!635248 m!609597))

(assert (=> b!635248 m!609597))

(declare-fun m!609645 () Bool)

(assert (=> b!635248 m!609645))

(assert (=> bm!33398 m!609597))

(declare-fun m!609647 () Bool)

(assert (=> bm!33398 m!609647))

(assert (=> b!635250 m!609597))

(assert (=> b!635250 m!609597))

(assert (=> b!635250 m!609599))

(assert (=> b!635090 d!89741))

(declare-fun d!89743 () Bool)

(declare-fun res!410993 () Bool)

(declare-fun e!363321 () Bool)

(assert (=> d!89743 (=> res!410993 e!363321)))

(assert (=> d!89743 (= res!410993 (= (select (arr!18334 lt!293644) j!136) (select (arr!18334 a!2986) j!136)))))

(assert (=> d!89743 (= (arrayContainsKey!0 lt!293644 (select (arr!18334 a!2986) j!136) j!136) e!363321)))

(declare-fun b!635261 () Bool)

(declare-fun e!363322 () Bool)

(assert (=> b!635261 (= e!363321 e!363322)))

(declare-fun res!410994 () Bool)

(assert (=> b!635261 (=> (not res!410994) (not e!363322))))

(assert (=> b!635261 (= res!410994 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18698 lt!293644)))))

(declare-fun b!635262 () Bool)

(assert (=> b!635262 (= e!363322 (arrayContainsKey!0 lt!293644 (select (arr!18334 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!89743 (not res!410993)) b!635261))

(assert (= (and b!635261 res!410994) b!635262))

(declare-fun m!609649 () Bool)

(assert (=> d!89743 m!609649))

(assert (=> b!635262 m!609493))

(declare-fun m!609651 () Bool)

(assert (=> b!635262 m!609651))

(assert (=> b!635101 d!89743))

(declare-fun d!89745 () Bool)

(assert (=> d!89745 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!635092 d!89745))

(declare-fun b!635296 () Bool)

(declare-fun e!363343 () SeekEntryResult!6774)

(assert (=> b!635296 (= e!363343 Undefined!6774)))

(declare-fun lt!293739 () SeekEntryResult!6774)

(declare-fun b!635297 () Bool)

(declare-fun e!363342 () SeekEntryResult!6774)

(assert (=> b!635297 (= e!363342 (seekKeyOrZeroReturnVacant!0 (x!58140 lt!293739) (index!29400 lt!293739) (index!29400 lt!293739) k0!1786 a!2986 mask!3053))))

(declare-fun b!635298 () Bool)

(declare-fun e!363341 () SeekEntryResult!6774)

(assert (=> b!635298 (= e!363343 e!363341)))

(declare-fun lt!293740 () (_ BitVec 64))

(assert (=> b!635298 (= lt!293740 (select (arr!18334 a!2986) (index!29400 lt!293739)))))

(declare-fun c!72516 () Bool)

(assert (=> b!635298 (= c!72516 (= lt!293740 k0!1786))))

(declare-fun b!635299 () Bool)

(assert (=> b!635299 (= e!363341 (Found!6774 (index!29400 lt!293739)))))

(declare-fun d!89747 () Bool)

(declare-fun lt!293738 () SeekEntryResult!6774)

(assert (=> d!89747 (and (or ((_ is Undefined!6774) lt!293738) (not ((_ is Found!6774) lt!293738)) (and (bvsge (index!29399 lt!293738) #b00000000000000000000000000000000) (bvslt (index!29399 lt!293738) (size!18698 a!2986)))) (or ((_ is Undefined!6774) lt!293738) ((_ is Found!6774) lt!293738) (not ((_ is MissingZero!6774) lt!293738)) (and (bvsge (index!29398 lt!293738) #b00000000000000000000000000000000) (bvslt (index!29398 lt!293738) (size!18698 a!2986)))) (or ((_ is Undefined!6774) lt!293738) ((_ is Found!6774) lt!293738) ((_ is MissingZero!6774) lt!293738) (not ((_ is MissingVacant!6774) lt!293738)) (and (bvsge (index!29401 lt!293738) #b00000000000000000000000000000000) (bvslt (index!29401 lt!293738) (size!18698 a!2986)))) (or ((_ is Undefined!6774) lt!293738) (ite ((_ is Found!6774) lt!293738) (= (select (arr!18334 a!2986) (index!29399 lt!293738)) k0!1786) (ite ((_ is MissingZero!6774) lt!293738) (= (select (arr!18334 a!2986) (index!29398 lt!293738)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6774) lt!293738) (= (select (arr!18334 a!2986) (index!29401 lt!293738)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!89747 (= lt!293738 e!363343)))

(declare-fun c!72518 () Bool)

(assert (=> d!89747 (= c!72518 (and ((_ is Intermediate!6774) lt!293739) (undefined!7586 lt!293739)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38211 (_ BitVec 32)) SeekEntryResult!6774)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89747 (= lt!293739 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!89747 (validMask!0 mask!3053)))

(assert (=> d!89747 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!293738)))

(declare-fun b!635300 () Bool)

(declare-fun c!72517 () Bool)

(assert (=> b!635300 (= c!72517 (= lt!293740 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!635300 (= e!363341 e!363342)))

(declare-fun b!635301 () Bool)

(assert (=> b!635301 (= e!363342 (MissingZero!6774 (index!29400 lt!293739)))))

(assert (= (and d!89747 c!72518) b!635296))

(assert (= (and d!89747 (not c!72518)) b!635298))

(assert (= (and b!635298 c!72516) b!635299))

(assert (= (and b!635298 (not c!72516)) b!635300))

(assert (= (and b!635300 c!72517) b!635301))

(assert (= (and b!635300 (not c!72517)) b!635297))

(declare-fun m!609683 () Bool)

(assert (=> b!635297 m!609683))

(declare-fun m!609685 () Bool)

(assert (=> b!635298 m!609685))

(declare-fun m!609687 () Bool)

(assert (=> d!89747 m!609687))

(declare-fun m!609689 () Bool)

(assert (=> d!89747 m!609689))

(declare-fun m!609691 () Bool)

(assert (=> d!89747 m!609691))

(declare-fun m!609693 () Bool)

(assert (=> d!89747 m!609693))

(assert (=> d!89747 m!609503))

(assert (=> d!89747 m!609693))

(declare-fun m!609695 () Bool)

(assert (=> d!89747 m!609695))

(assert (=> b!635103 d!89747))

(declare-fun d!89763 () Bool)

(declare-fun res!410998 () Bool)

(declare-fun e!363347 () Bool)

(assert (=> d!89763 (=> res!410998 e!363347)))

(assert (=> d!89763 (= res!410998 (= (select (arr!18334 lt!293644) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18334 a!2986) j!136)))))

(assert (=> d!89763 (= (arrayContainsKey!0 lt!293644 (select (arr!18334 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!363347)))

(declare-fun b!635308 () Bool)

(declare-fun e!363348 () Bool)

(assert (=> b!635308 (= e!363347 e!363348)))

(declare-fun res!410999 () Bool)

(assert (=> b!635308 (=> (not res!410999) (not e!363348))))

(assert (=> b!635308 (= res!410999 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18698 lt!293644)))))

(declare-fun b!635309 () Bool)

(assert (=> b!635309 (= e!363348 (arrayContainsKey!0 lt!293644 (select (arr!18334 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!89763 (not res!410998)) b!635308))

(assert (= (and b!635308 res!410999) b!635309))

(declare-fun m!609703 () Bool)

(assert (=> d!89763 m!609703))

(assert (=> b!635309 m!609493))

(declare-fun m!609705 () Bool)

(assert (=> b!635309 m!609705))

(assert (=> b!635095 d!89763))

(declare-fun d!89765 () Bool)

(assert (=> d!89765 (arrayContainsKey!0 lt!293644 (select (arr!18334 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!293745 () Unit!21430)

(declare-fun choose!114 (array!38211 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21430)

(assert (=> d!89765 (= lt!293745 (choose!114 lt!293644 (select (arr!18334 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!89765 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!89765 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!293644 (select (arr!18334 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!293745)))

(declare-fun bs!19092 () Bool)

(assert (= bs!19092 d!89765))

(assert (=> bs!19092 m!609493))

(assert (=> bs!19092 m!609495))

(assert (=> bs!19092 m!609493))

(declare-fun m!609709 () Bool)

(assert (=> bs!19092 m!609709))

(assert (=> b!635095 d!89765))

(declare-fun e!363350 () SeekEntryResult!6774)

(declare-fun b!635310 () Bool)

(assert (=> b!635310 (= e!363350 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18334 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!635311 () Bool)

(declare-fun e!363349 () SeekEntryResult!6774)

(declare-fun e!363351 () SeekEntryResult!6774)

(assert (=> b!635311 (= e!363349 e!363351)))

(declare-fun c!72523 () Bool)

(declare-fun lt!293746 () (_ BitVec 64))

(assert (=> b!635311 (= c!72523 (= lt!293746 (select (arr!18334 a!2986) j!136)))))

(declare-fun b!635312 () Bool)

(assert (=> b!635312 (= e!363349 Undefined!6774)))

(declare-fun b!635313 () Bool)

(assert (=> b!635313 (= e!363351 (Found!6774 index!984))))

(declare-fun b!635314 () Bool)

(declare-fun c!72524 () Bool)

(assert (=> b!635314 (= c!72524 (= lt!293746 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!635314 (= e!363351 e!363350)))

(declare-fun b!635315 () Bool)

(assert (=> b!635315 (= e!363350 (MissingVacant!6774 vacantSpotIndex!68))))

(declare-fun d!89769 () Bool)

(declare-fun lt!293747 () SeekEntryResult!6774)

(assert (=> d!89769 (and (or ((_ is Undefined!6774) lt!293747) (not ((_ is Found!6774) lt!293747)) (and (bvsge (index!29399 lt!293747) #b00000000000000000000000000000000) (bvslt (index!29399 lt!293747) (size!18698 a!2986)))) (or ((_ is Undefined!6774) lt!293747) ((_ is Found!6774) lt!293747) (not ((_ is MissingVacant!6774) lt!293747)) (not (= (index!29401 lt!293747) vacantSpotIndex!68)) (and (bvsge (index!29401 lt!293747) #b00000000000000000000000000000000) (bvslt (index!29401 lt!293747) (size!18698 a!2986)))) (or ((_ is Undefined!6774) lt!293747) (ite ((_ is Found!6774) lt!293747) (= (select (arr!18334 a!2986) (index!29399 lt!293747)) (select (arr!18334 a!2986) j!136)) (and ((_ is MissingVacant!6774) lt!293747) (= (index!29401 lt!293747) vacantSpotIndex!68) (= (select (arr!18334 a!2986) (index!29401 lt!293747)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89769 (= lt!293747 e!363349)))

(declare-fun c!72522 () Bool)

(assert (=> d!89769 (= c!72522 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!89769 (= lt!293746 (select (arr!18334 a!2986) index!984))))

(assert (=> d!89769 (validMask!0 mask!3053)))

(assert (=> d!89769 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18334 a!2986) j!136) a!2986 mask!3053) lt!293747)))

(assert (= (and d!89769 c!72522) b!635312))

(assert (= (and d!89769 (not c!72522)) b!635311))

(assert (= (and b!635311 c!72523) b!635313))

(assert (= (and b!635311 (not c!72523)) b!635314))

(assert (= (and b!635314 c!72524) b!635315))

(assert (= (and b!635314 (not c!72524)) b!635310))

(assert (=> b!635310 m!609513))

(assert (=> b!635310 m!609513))

(assert (=> b!635310 m!609493))

(declare-fun m!609711 () Bool)

(assert (=> b!635310 m!609711))

(declare-fun m!609713 () Bool)

(assert (=> d!89769 m!609713))

(declare-fun m!609715 () Bool)

(assert (=> d!89769 m!609715))

(assert (=> d!89769 m!609537))

(assert (=> d!89769 m!609503))

(assert (=> b!635105 d!89769))

(check-sat (not d!89735) (not d!89733) (not d!89721) (not b!635248) (not b!635182) (not d!89765) (not bm!33395) (not bm!33398) (not b!635180) (not d!89769) (not b!635262) (not b!635216) (not b!635202) (not d!89747) (not d!89737) (not b!635309) (not b!635250) (not b!635168) (not b!635210) (not b!635177) (not b!635185) (not d!89719) (not b!635297) (not b!635247) (not b!635310))
(check-sat)
