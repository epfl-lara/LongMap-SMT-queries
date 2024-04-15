; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55326 () Bool)

(assert start!55326)

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!37251 0))(
  ( (array!37252 (arr!17879 (Array (_ BitVec 32) (_ BitVec 64))) (size!18244 (_ BitVec 32))) )
))
(declare-fun lt!276265 () array!37251)

(declare-fun e!346639 () Bool)

(declare-fun b!605600 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37251)

(declare-fun arrayContainsKey!0 (array!37251 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!605600 (= e!346639 (arrayContainsKey!0 lt!276265 (select (arr!17879 a!2986) j!136) index!984))))

(declare-fun b!605601 () Bool)

(declare-datatypes ((Unit!19278 0))(
  ( (Unit!19279) )
))
(declare-fun e!346642 () Unit!19278)

(declare-fun Unit!19280 () Unit!19278)

(assert (=> b!605601 (= e!346642 Unit!19280)))

(declare-fun res!389111 () Bool)

(declare-fun e!346636 () Bool)

(assert (=> start!55326 (=> (not res!389111) (not e!346636))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55326 (= res!389111 (validMask!0 mask!3053))))

(assert (=> start!55326 e!346636))

(assert (=> start!55326 true))

(declare-fun array_inv!13762 (array!37251) Bool)

(assert (=> start!55326 (array_inv!13762 a!2986)))

(declare-fun b!605602 () Bool)

(declare-fun e!346641 () Bool)

(assert (=> b!605602 (= e!346641 (arrayContainsKey!0 lt!276265 (select (arr!17879 a!2986) j!136) index!984))))

(declare-fun b!605603 () Bool)

(declare-fun e!346650 () Bool)

(declare-fun e!346645 () Bool)

(assert (=> b!605603 (= e!346650 (not e!346645))))

(declare-fun res!389122 () Bool)

(assert (=> b!605603 (=> res!389122 e!346645)))

(declare-datatypes ((SeekEntryResult!6316 0))(
  ( (MissingZero!6316 (index!27533 (_ BitVec 32))) (Found!6316 (index!27534 (_ BitVec 32))) (Intermediate!6316 (undefined!7128 Bool) (index!27535 (_ BitVec 32)) (x!56346 (_ BitVec 32))) (Undefined!6316) (MissingVacant!6316 (index!27536 (_ BitVec 32))) )
))
(declare-fun lt!276261 () SeekEntryResult!6316)

(assert (=> b!605603 (= res!389122 (not (= lt!276261 (Found!6316 index!984))))))

(declare-fun lt!276256 () Unit!19278)

(assert (=> b!605603 (= lt!276256 e!346642)))

(declare-fun c!68613 () Bool)

(assert (=> b!605603 (= c!68613 (= lt!276261 Undefined!6316))))

(declare-fun lt!276251 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37251 (_ BitVec 32)) SeekEntryResult!6316)

(assert (=> b!605603 (= lt!276261 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!276251 lt!276265 mask!3053))))

(declare-fun e!346638 () Bool)

(assert (=> b!605603 e!346638))

(declare-fun res!389126 () Bool)

(assert (=> b!605603 (=> (not res!389126) (not e!346638))))

(declare-fun lt!276264 () (_ BitVec 32))

(declare-fun lt!276250 () SeekEntryResult!6316)

(assert (=> b!605603 (= res!389126 (= lt!276250 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276264 vacantSpotIndex!68 lt!276251 lt!276265 mask!3053)))))

(assert (=> b!605603 (= lt!276250 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276264 vacantSpotIndex!68 (select (arr!17879 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!605603 (= lt!276251 (select (store (arr!17879 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!276253 () Unit!19278)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37251 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19278)

(assert (=> b!605603 (= lt!276253 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!276264 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!605603 (= lt!276264 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!605604 () Bool)

(declare-fun e!346647 () Bool)

(declare-fun e!346649 () Bool)

(assert (=> b!605604 (= e!346647 e!346649)))

(declare-fun res!389128 () Bool)

(assert (=> b!605604 (=> (not res!389128) (not e!346649))))

(assert (=> b!605604 (= res!389128 (= (select (store (arr!17879 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!605604 (= lt!276265 (array!37252 (store (arr!17879 a!2986) i!1108 k0!1786) (size!18244 a!2986)))))

(declare-fun b!605605 () Bool)

(declare-fun e!346643 () Bool)

(assert (=> b!605605 (= e!346645 e!346643)))

(declare-fun res!389117 () Bool)

(assert (=> b!605605 (=> res!389117 e!346643)))

(declare-fun lt!276252 () (_ BitVec 64))

(assert (=> b!605605 (= res!389117 (or (not (= (select (arr!17879 a!2986) j!136) lt!276251)) (not (= (select (arr!17879 a!2986) j!136) lt!276252))))))

(declare-fun e!346644 () Bool)

(assert (=> b!605605 e!346644))

(declare-fun res!389118 () Bool)

(assert (=> b!605605 (=> (not res!389118) (not e!346644))))

(assert (=> b!605605 (= res!389118 (= lt!276252 (select (arr!17879 a!2986) j!136)))))

(assert (=> b!605605 (= lt!276252 (select (store (arr!17879 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!605606 () Bool)

(declare-fun e!346646 () Unit!19278)

(declare-fun Unit!19281 () Unit!19278)

(assert (=> b!605606 (= e!346646 Unit!19281)))

(declare-fun lt!276263 () Unit!19278)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37251 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19278)

(assert (=> b!605606 (= lt!276263 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!276265 (select (arr!17879 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!605606 (arrayContainsKey!0 lt!276265 (select (arr!17879 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!276259 () Unit!19278)

(declare-datatypes ((List!11959 0))(
  ( (Nil!11956) (Cons!11955 (h!13000 (_ BitVec 64)) (t!18178 List!11959)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37251 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11959) Unit!19278)

(assert (=> b!605606 (= lt!276259 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11956))))

(declare-fun arrayNoDuplicates!0 (array!37251 (_ BitVec 32) List!11959) Bool)

(assert (=> b!605606 (arrayNoDuplicates!0 lt!276265 #b00000000000000000000000000000000 Nil!11956)))

(declare-fun lt!276254 () Unit!19278)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37251 (_ BitVec 32) (_ BitVec 32)) Unit!19278)

(assert (=> b!605606 (= lt!276254 (lemmaNoDuplicateFromThenFromBigger!0 lt!276265 #b00000000000000000000000000000000 j!136))))

(assert (=> b!605606 (arrayNoDuplicates!0 lt!276265 j!136 Nil!11956)))

(declare-fun lt!276260 () Unit!19278)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37251 (_ BitVec 64) (_ BitVec 32) List!11959) Unit!19278)

(assert (=> b!605606 (= lt!276260 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!276265 (select (arr!17879 a!2986) j!136) j!136 Nil!11956))))

(assert (=> b!605606 false))

(declare-fun b!605607 () Bool)

(declare-fun lt!276262 () SeekEntryResult!6316)

(assert (=> b!605607 (= e!346638 (= lt!276262 lt!276250))))

(declare-fun b!605608 () Bool)

(declare-fun res!389114 () Bool)

(assert (=> b!605608 (=> (not res!389114) (not e!346636))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!605608 (= res!389114 (validKeyInArray!0 k0!1786))))

(declare-fun b!605609 () Bool)

(declare-fun Unit!19282 () Unit!19278)

(assert (=> b!605609 (= e!346646 Unit!19282)))

(declare-fun b!605610 () Bool)

(declare-fun e!346635 () Bool)

(assert (=> b!605610 (= e!346644 e!346635)))

(declare-fun res!389129 () Bool)

(assert (=> b!605610 (=> res!389129 e!346635)))

(assert (=> b!605610 (= res!389129 (or (not (= (select (arr!17879 a!2986) j!136) lt!276251)) (not (= (select (arr!17879 a!2986) j!136) lt!276252)) (bvsge j!136 index!984)))))

(declare-fun b!605611 () Bool)

(assert (=> b!605611 (= e!346636 e!346647)))

(declare-fun res!389123 () Bool)

(assert (=> b!605611 (=> (not res!389123) (not e!346647))))

(declare-fun lt!276258 () SeekEntryResult!6316)

(assert (=> b!605611 (= res!389123 (or (= lt!276258 (MissingZero!6316 i!1108)) (= lt!276258 (MissingVacant!6316 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37251 (_ BitVec 32)) SeekEntryResult!6316)

(assert (=> b!605611 (= lt!276258 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!605612 () Bool)

(assert (=> b!605612 (= e!346635 e!346639)))

(declare-fun res!389115 () Bool)

(assert (=> b!605612 (=> (not res!389115) (not e!346639))))

(assert (=> b!605612 (= res!389115 (arrayContainsKey!0 lt!276265 (select (arr!17879 a!2986) j!136) j!136))))

(declare-fun b!605613 () Bool)

(declare-fun e!346640 () Bool)

(assert (=> b!605613 (= e!346643 e!346640)))

(declare-fun res!389113 () Bool)

(assert (=> b!605613 (=> res!389113 e!346640)))

(assert (=> b!605613 (= res!389113 (bvsge index!984 j!136))))

(declare-fun lt!276255 () Unit!19278)

(assert (=> b!605613 (= lt!276255 e!346646)))

(declare-fun c!68612 () Bool)

(assert (=> b!605613 (= c!68612 (bvslt j!136 index!984))))

(declare-fun b!605614 () Bool)

(declare-fun res!389127 () Bool)

(assert (=> b!605614 (=> (not res!389127) (not e!346636))))

(assert (=> b!605614 (= res!389127 (validKeyInArray!0 (select (arr!17879 a!2986) j!136)))))

(declare-fun b!605615 () Bool)

(declare-fun res!389116 () Bool)

(assert (=> b!605615 (=> (not res!389116) (not e!346647))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37251 (_ BitVec 32)) Bool)

(assert (=> b!605615 (= res!389116 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!605616 () Bool)

(declare-fun e!346648 () Bool)

(declare-fun noDuplicate!308 (List!11959) Bool)

(assert (=> b!605616 (= e!346648 (noDuplicate!308 Nil!11956))))

(declare-fun b!605617 () Bool)

(assert (=> b!605617 (= e!346640 e!346648)))

(declare-fun res!389124 () Bool)

(assert (=> b!605617 (=> res!389124 e!346648)))

(assert (=> b!605617 (= res!389124 (or (bvsgt #b00000000000000000000000000000000 (size!18244 a!2986)) (bvsge (size!18244 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!605617 (arrayContainsKey!0 lt!276265 (select (arr!17879 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!276257 () Unit!19278)

(assert (=> b!605617 (= lt!276257 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!276265 (select (arr!17879 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!605617 e!346641))

(declare-fun res!389120 () Bool)

(assert (=> b!605617 (=> (not res!389120) (not e!346641))))

(assert (=> b!605617 (= res!389120 (arrayContainsKey!0 lt!276265 (select (arr!17879 a!2986) j!136) j!136))))

(declare-fun b!605618 () Bool)

(declare-fun res!389119 () Bool)

(assert (=> b!605618 (=> (not res!389119) (not e!346636))))

(assert (=> b!605618 (= res!389119 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!605619 () Bool)

(declare-fun Unit!19283 () Unit!19278)

(assert (=> b!605619 (= e!346642 Unit!19283)))

(assert (=> b!605619 false))

(declare-fun b!605620 () Bool)

(declare-fun res!389112 () Bool)

(assert (=> b!605620 (=> (not res!389112) (not e!346647))))

(assert (=> b!605620 (= res!389112 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17879 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!605621 () Bool)

(assert (=> b!605621 (= e!346649 e!346650)))

(declare-fun res!389121 () Bool)

(assert (=> b!605621 (=> (not res!389121) (not e!346650))))

(assert (=> b!605621 (= res!389121 (and (= lt!276262 (Found!6316 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17879 a!2986) index!984) (select (arr!17879 a!2986) j!136))) (not (= (select (arr!17879 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!605621 (= lt!276262 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17879 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!605622 () Bool)

(declare-fun res!389110 () Bool)

(assert (=> b!605622 (=> (not res!389110) (not e!346647))))

(assert (=> b!605622 (= res!389110 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11956))))

(declare-fun b!605623 () Bool)

(declare-fun res!389125 () Bool)

(assert (=> b!605623 (=> (not res!389125) (not e!346636))))

(assert (=> b!605623 (= res!389125 (and (= (size!18244 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18244 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18244 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!55326 res!389111) b!605623))

(assert (= (and b!605623 res!389125) b!605614))

(assert (= (and b!605614 res!389127) b!605608))

(assert (= (and b!605608 res!389114) b!605618))

(assert (= (and b!605618 res!389119) b!605611))

(assert (= (and b!605611 res!389123) b!605615))

(assert (= (and b!605615 res!389116) b!605622))

(assert (= (and b!605622 res!389110) b!605620))

(assert (= (and b!605620 res!389112) b!605604))

(assert (= (and b!605604 res!389128) b!605621))

(assert (= (and b!605621 res!389121) b!605603))

(assert (= (and b!605603 res!389126) b!605607))

(assert (= (and b!605603 c!68613) b!605619))

(assert (= (and b!605603 (not c!68613)) b!605601))

(assert (= (and b!605603 (not res!389122)) b!605605))

(assert (= (and b!605605 res!389118) b!605610))

(assert (= (and b!605610 (not res!389129)) b!605612))

(assert (= (and b!605612 res!389115) b!605600))

(assert (= (and b!605605 (not res!389117)) b!605613))

(assert (= (and b!605613 c!68612) b!605606))

(assert (= (and b!605613 (not c!68612)) b!605609))

(assert (= (and b!605613 (not res!389113)) b!605617))

(assert (= (and b!605617 res!389120) b!605602))

(assert (= (and b!605617 (not res!389124)) b!605616))

(declare-fun m!581941 () Bool)

(assert (=> b!605608 m!581941))

(declare-fun m!581943 () Bool)

(assert (=> b!605615 m!581943))

(declare-fun m!581945 () Bool)

(assert (=> b!605621 m!581945))

(declare-fun m!581947 () Bool)

(assert (=> b!605621 m!581947))

(assert (=> b!605621 m!581947))

(declare-fun m!581949 () Bool)

(assert (=> b!605621 m!581949))

(declare-fun m!581951 () Bool)

(assert (=> b!605622 m!581951))

(declare-fun m!581953 () Bool)

(assert (=> b!605603 m!581953))

(assert (=> b!605603 m!581947))

(declare-fun m!581955 () Bool)

(assert (=> b!605603 m!581955))

(assert (=> b!605603 m!581947))

(declare-fun m!581957 () Bool)

(assert (=> b!605603 m!581957))

(declare-fun m!581959 () Bool)

(assert (=> b!605603 m!581959))

(declare-fun m!581961 () Bool)

(assert (=> b!605603 m!581961))

(declare-fun m!581963 () Bool)

(assert (=> b!605603 m!581963))

(declare-fun m!581965 () Bool)

(assert (=> b!605603 m!581965))

(declare-fun m!581967 () Bool)

(assert (=> start!55326 m!581967))

(declare-fun m!581969 () Bool)

(assert (=> start!55326 m!581969))

(declare-fun m!581971 () Bool)

(assert (=> b!605618 m!581971))

(assert (=> b!605605 m!581947))

(assert (=> b!605605 m!581955))

(declare-fun m!581973 () Bool)

(assert (=> b!605605 m!581973))

(assert (=> b!605600 m!581947))

(assert (=> b!605600 m!581947))

(declare-fun m!581975 () Bool)

(assert (=> b!605600 m!581975))

(assert (=> b!605606 m!581947))

(declare-fun m!581977 () Bool)

(assert (=> b!605606 m!581977))

(assert (=> b!605606 m!581947))

(declare-fun m!581979 () Bool)

(assert (=> b!605606 m!581979))

(assert (=> b!605606 m!581947))

(declare-fun m!581981 () Bool)

(assert (=> b!605606 m!581981))

(assert (=> b!605606 m!581947))

(declare-fun m!581983 () Bool)

(assert (=> b!605606 m!581983))

(declare-fun m!581985 () Bool)

(assert (=> b!605606 m!581985))

(declare-fun m!581987 () Bool)

(assert (=> b!605606 m!581987))

(declare-fun m!581989 () Bool)

(assert (=> b!605606 m!581989))

(declare-fun m!581991 () Bool)

(assert (=> b!605616 m!581991))

(declare-fun m!581993 () Bool)

(assert (=> b!605620 m!581993))

(assert (=> b!605612 m!581947))

(assert (=> b!605612 m!581947))

(declare-fun m!581995 () Bool)

(assert (=> b!605612 m!581995))

(assert (=> b!605610 m!581947))

(assert (=> b!605602 m!581947))

(assert (=> b!605602 m!581947))

(assert (=> b!605602 m!581975))

(assert (=> b!605604 m!581955))

(declare-fun m!581997 () Bool)

(assert (=> b!605604 m!581997))

(assert (=> b!605617 m!581947))

(assert (=> b!605617 m!581947))

(declare-fun m!581999 () Bool)

(assert (=> b!605617 m!581999))

(assert (=> b!605617 m!581947))

(declare-fun m!582001 () Bool)

(assert (=> b!605617 m!582001))

(assert (=> b!605617 m!581947))

(assert (=> b!605617 m!581995))

(assert (=> b!605614 m!581947))

(assert (=> b!605614 m!581947))

(declare-fun m!582003 () Bool)

(assert (=> b!605614 m!582003))

(declare-fun m!582005 () Bool)

(assert (=> b!605611 m!582005))

(check-sat (not b!605615) (not b!605622) (not b!605603) (not b!605600) (not b!605606) (not b!605617) (not b!605608) (not start!55326) (not b!605614) (not b!605612) (not b!605621) (not b!605602) (not b!605618) (not b!605616) (not b!605611))
(check-sat)
(get-model)

(declare-fun b!605776 () Bool)

(declare-fun e!346753 () Bool)

(declare-fun call!33040 () Bool)

(assert (=> b!605776 (= e!346753 call!33040)))

(declare-fun b!605777 () Bool)

(declare-fun e!346754 () Bool)

(assert (=> b!605777 (= e!346753 e!346754)))

(declare-fun lt!276369 () (_ BitVec 64))

(assert (=> b!605777 (= lt!276369 (select (arr!17879 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!276370 () Unit!19278)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37251 (_ BitVec 64) (_ BitVec 32)) Unit!19278)

(assert (=> b!605777 (= lt!276370 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!276369 #b00000000000000000000000000000000))))

(assert (=> b!605777 (arrayContainsKey!0 a!2986 lt!276369 #b00000000000000000000000000000000)))

(declare-fun lt!276368 () Unit!19278)

(assert (=> b!605777 (= lt!276368 lt!276370)))

(declare-fun res!389255 () Bool)

(assert (=> b!605777 (= res!389255 (= (seekEntryOrOpen!0 (select (arr!17879 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6316 #b00000000000000000000000000000000)))))

(assert (=> b!605777 (=> (not res!389255) (not e!346754))))

(declare-fun b!605778 () Bool)

(assert (=> b!605778 (= e!346754 call!33040)))

(declare-fun b!605779 () Bool)

(declare-fun e!346755 () Bool)

(assert (=> b!605779 (= e!346755 e!346753)))

(declare-fun c!68628 () Bool)

(assert (=> b!605779 (= c!68628 (validKeyInArray!0 (select (arr!17879 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!87529 () Bool)

(declare-fun res!389254 () Bool)

(assert (=> d!87529 (=> res!389254 e!346755)))

(assert (=> d!87529 (= res!389254 (bvsge #b00000000000000000000000000000000 (size!18244 a!2986)))))

(assert (=> d!87529 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!346755)))

(declare-fun bm!33037 () Bool)

(assert (=> bm!33037 (= call!33040 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(assert (= (and d!87529 (not res!389254)) b!605779))

(assert (= (and b!605779 c!68628) b!605777))

(assert (= (and b!605779 (not c!68628)) b!605776))

(assert (= (and b!605777 res!389255) b!605778))

(assert (= (or b!605778 b!605776) bm!33037))

(declare-fun m!582139 () Bool)

(assert (=> b!605777 m!582139))

(declare-fun m!582141 () Bool)

(assert (=> b!605777 m!582141))

(declare-fun m!582143 () Bool)

(assert (=> b!605777 m!582143))

(assert (=> b!605777 m!582139))

(declare-fun m!582145 () Bool)

(assert (=> b!605777 m!582145))

(assert (=> b!605779 m!582139))

(assert (=> b!605779 m!582139))

(declare-fun m!582147 () Bool)

(assert (=> b!605779 m!582147))

(declare-fun m!582149 () Bool)

(assert (=> bm!33037 m!582149))

(assert (=> b!605615 d!87529))

(declare-fun b!605792 () Bool)

(declare-fun e!346763 () SeekEntryResult!6316)

(assert (=> b!605792 (= e!346763 Undefined!6316)))

(declare-fun b!605793 () Bool)

(declare-fun c!68635 () Bool)

(declare-fun lt!276376 () (_ BitVec 64))

(assert (=> b!605793 (= c!68635 (= lt!276376 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!346764 () SeekEntryResult!6316)

(declare-fun e!346762 () SeekEntryResult!6316)

(assert (=> b!605793 (= e!346764 e!346762)))

(declare-fun b!605794 () Bool)

(assert (=> b!605794 (= e!346762 (MissingVacant!6316 vacantSpotIndex!68))))

(declare-fun lt!276375 () SeekEntryResult!6316)

(declare-fun d!87531 () Bool)

(get-info :version)

(assert (=> d!87531 (and (or ((_ is Undefined!6316) lt!276375) (not ((_ is Found!6316) lt!276375)) (and (bvsge (index!27534 lt!276375) #b00000000000000000000000000000000) (bvslt (index!27534 lt!276375) (size!18244 lt!276265)))) (or ((_ is Undefined!6316) lt!276375) ((_ is Found!6316) lt!276375) (not ((_ is MissingVacant!6316) lt!276375)) (not (= (index!27536 lt!276375) vacantSpotIndex!68)) (and (bvsge (index!27536 lt!276375) #b00000000000000000000000000000000) (bvslt (index!27536 lt!276375) (size!18244 lt!276265)))) (or ((_ is Undefined!6316) lt!276375) (ite ((_ is Found!6316) lt!276375) (= (select (arr!17879 lt!276265) (index!27534 lt!276375)) lt!276251) (and ((_ is MissingVacant!6316) lt!276375) (= (index!27536 lt!276375) vacantSpotIndex!68) (= (select (arr!17879 lt!276265) (index!27536 lt!276375)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87531 (= lt!276375 e!346763)))

(declare-fun c!68636 () Bool)

(assert (=> d!87531 (= c!68636 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!87531 (= lt!276376 (select (arr!17879 lt!276265) lt!276264))))

(assert (=> d!87531 (validMask!0 mask!3053)))

(assert (=> d!87531 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276264 vacantSpotIndex!68 lt!276251 lt!276265 mask!3053) lt!276375)))

(declare-fun b!605795 () Bool)

(assert (=> b!605795 (= e!346762 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!276264 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!276251 lt!276265 mask!3053))))

(declare-fun b!605796 () Bool)

(assert (=> b!605796 (= e!346763 e!346764)))

(declare-fun c!68637 () Bool)

(assert (=> b!605796 (= c!68637 (= lt!276376 lt!276251))))

(declare-fun b!605797 () Bool)

(assert (=> b!605797 (= e!346764 (Found!6316 lt!276264))))

(assert (= (and d!87531 c!68636) b!605792))

(assert (= (and d!87531 (not c!68636)) b!605796))

(assert (= (and b!605796 c!68637) b!605797))

(assert (= (and b!605796 (not c!68637)) b!605793))

(assert (= (and b!605793 c!68635) b!605794))

(assert (= (and b!605793 (not c!68635)) b!605795))

(declare-fun m!582151 () Bool)

(assert (=> d!87531 m!582151))

(declare-fun m!582153 () Bool)

(assert (=> d!87531 m!582153))

(declare-fun m!582155 () Bool)

(assert (=> d!87531 m!582155))

(assert (=> d!87531 m!581967))

(declare-fun m!582157 () Bool)

(assert (=> b!605795 m!582157))

(assert (=> b!605795 m!582157))

(declare-fun m!582159 () Bool)

(assert (=> b!605795 m!582159))

(assert (=> b!605603 d!87531))

(declare-fun b!605798 () Bool)

(declare-fun e!346766 () SeekEntryResult!6316)

(assert (=> b!605798 (= e!346766 Undefined!6316)))

(declare-fun b!605799 () Bool)

(declare-fun c!68638 () Bool)

(declare-fun lt!276378 () (_ BitVec 64))

(assert (=> b!605799 (= c!68638 (= lt!276378 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!346767 () SeekEntryResult!6316)

(declare-fun e!346765 () SeekEntryResult!6316)

(assert (=> b!605799 (= e!346767 e!346765)))

(declare-fun b!605800 () Bool)

(assert (=> b!605800 (= e!346765 (MissingVacant!6316 vacantSpotIndex!68))))

(declare-fun d!87533 () Bool)

(declare-fun lt!276377 () SeekEntryResult!6316)

(assert (=> d!87533 (and (or ((_ is Undefined!6316) lt!276377) (not ((_ is Found!6316) lt!276377)) (and (bvsge (index!27534 lt!276377) #b00000000000000000000000000000000) (bvslt (index!27534 lt!276377) (size!18244 a!2986)))) (or ((_ is Undefined!6316) lt!276377) ((_ is Found!6316) lt!276377) (not ((_ is MissingVacant!6316) lt!276377)) (not (= (index!27536 lt!276377) vacantSpotIndex!68)) (and (bvsge (index!27536 lt!276377) #b00000000000000000000000000000000) (bvslt (index!27536 lt!276377) (size!18244 a!2986)))) (or ((_ is Undefined!6316) lt!276377) (ite ((_ is Found!6316) lt!276377) (= (select (arr!17879 a!2986) (index!27534 lt!276377)) (select (arr!17879 a!2986) j!136)) (and ((_ is MissingVacant!6316) lt!276377) (= (index!27536 lt!276377) vacantSpotIndex!68) (= (select (arr!17879 a!2986) (index!27536 lt!276377)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87533 (= lt!276377 e!346766)))

(declare-fun c!68639 () Bool)

(assert (=> d!87533 (= c!68639 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!87533 (= lt!276378 (select (arr!17879 a!2986) lt!276264))))

(assert (=> d!87533 (validMask!0 mask!3053)))

(assert (=> d!87533 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276264 vacantSpotIndex!68 (select (arr!17879 a!2986) j!136) a!2986 mask!3053) lt!276377)))

(declare-fun b!605801 () Bool)

(assert (=> b!605801 (= e!346765 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!276264 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!17879 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!605802 () Bool)

(assert (=> b!605802 (= e!346766 e!346767)))

(declare-fun c!68640 () Bool)

(assert (=> b!605802 (= c!68640 (= lt!276378 (select (arr!17879 a!2986) j!136)))))

(declare-fun b!605803 () Bool)

(assert (=> b!605803 (= e!346767 (Found!6316 lt!276264))))

(assert (= (and d!87533 c!68639) b!605798))

(assert (= (and d!87533 (not c!68639)) b!605802))

(assert (= (and b!605802 c!68640) b!605803))

(assert (= (and b!605802 (not c!68640)) b!605799))

(assert (= (and b!605799 c!68638) b!605800))

(assert (= (and b!605799 (not c!68638)) b!605801))

(declare-fun m!582161 () Bool)

(assert (=> d!87533 m!582161))

(declare-fun m!582163 () Bool)

(assert (=> d!87533 m!582163))

(declare-fun m!582165 () Bool)

(assert (=> d!87533 m!582165))

(assert (=> d!87533 m!581967))

(assert (=> b!605801 m!582157))

(assert (=> b!605801 m!582157))

(assert (=> b!605801 m!581947))

(declare-fun m!582167 () Bool)

(assert (=> b!605801 m!582167))

(assert (=> b!605603 d!87533))

(declare-fun d!87535 () Bool)

(declare-fun lt!276381 () (_ BitVec 32))

(assert (=> d!87535 (and (bvsge lt!276381 #b00000000000000000000000000000000) (bvslt lt!276381 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!87535 (= lt!276381 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!87535 (validMask!0 mask!3053)))

(assert (=> d!87535 (= (nextIndex!0 index!984 x!910 mask!3053) lt!276381)))

(declare-fun bs!18508 () Bool)

(assert (= bs!18508 d!87535))

(declare-fun m!582169 () Bool)

(assert (=> bs!18508 m!582169))

(assert (=> bs!18508 m!581967))

(assert (=> b!605603 d!87535))

(declare-fun d!87537 () Bool)

(declare-fun e!346770 () Bool)

(assert (=> d!87537 e!346770))

(declare-fun res!389258 () Bool)

(assert (=> d!87537 (=> (not res!389258) (not e!346770))))

(assert (=> d!87537 (= res!389258 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18244 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18244 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18244 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18244 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18244 a!2986))))))

(declare-fun lt!276384 () Unit!19278)

(declare-fun choose!9 (array!37251 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19278)

(assert (=> d!87537 (= lt!276384 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!276264 vacantSpotIndex!68 mask!3053))))

(assert (=> d!87537 (validMask!0 mask!3053)))

(assert (=> d!87537 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!276264 vacantSpotIndex!68 mask!3053) lt!276384)))

(declare-fun b!605806 () Bool)

(assert (=> b!605806 (= e!346770 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276264 vacantSpotIndex!68 (select (arr!17879 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276264 vacantSpotIndex!68 (select (store (arr!17879 a!2986) i!1108 k0!1786) j!136) (array!37252 (store (arr!17879 a!2986) i!1108 k0!1786) (size!18244 a!2986)) mask!3053)))))

(assert (= (and d!87537 res!389258) b!605806))

(declare-fun m!582171 () Bool)

(assert (=> d!87537 m!582171))

(assert (=> d!87537 m!581967))

(assert (=> b!605806 m!581965))

(declare-fun m!582173 () Bool)

(assert (=> b!605806 m!582173))

(assert (=> b!605806 m!581947))

(assert (=> b!605806 m!581955))

(assert (=> b!605806 m!581965))

(assert (=> b!605806 m!581947))

(assert (=> b!605806 m!581957))

(assert (=> b!605603 d!87537))

(declare-fun b!605807 () Bool)

(declare-fun e!346772 () SeekEntryResult!6316)

(assert (=> b!605807 (= e!346772 Undefined!6316)))

(declare-fun b!605808 () Bool)

(declare-fun c!68641 () Bool)

(declare-fun lt!276386 () (_ BitVec 64))

(assert (=> b!605808 (= c!68641 (= lt!276386 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!346773 () SeekEntryResult!6316)

(declare-fun e!346771 () SeekEntryResult!6316)

(assert (=> b!605808 (= e!346773 e!346771)))

(declare-fun b!605809 () Bool)

(assert (=> b!605809 (= e!346771 (MissingVacant!6316 vacantSpotIndex!68))))

(declare-fun d!87539 () Bool)

(declare-fun lt!276385 () SeekEntryResult!6316)

(assert (=> d!87539 (and (or ((_ is Undefined!6316) lt!276385) (not ((_ is Found!6316) lt!276385)) (and (bvsge (index!27534 lt!276385) #b00000000000000000000000000000000) (bvslt (index!27534 lt!276385) (size!18244 lt!276265)))) (or ((_ is Undefined!6316) lt!276385) ((_ is Found!6316) lt!276385) (not ((_ is MissingVacant!6316) lt!276385)) (not (= (index!27536 lt!276385) vacantSpotIndex!68)) (and (bvsge (index!27536 lt!276385) #b00000000000000000000000000000000) (bvslt (index!27536 lt!276385) (size!18244 lt!276265)))) (or ((_ is Undefined!6316) lt!276385) (ite ((_ is Found!6316) lt!276385) (= (select (arr!17879 lt!276265) (index!27534 lt!276385)) lt!276251) (and ((_ is MissingVacant!6316) lt!276385) (= (index!27536 lt!276385) vacantSpotIndex!68) (= (select (arr!17879 lt!276265) (index!27536 lt!276385)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87539 (= lt!276385 e!346772)))

(declare-fun c!68642 () Bool)

(assert (=> d!87539 (= c!68642 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!87539 (= lt!276386 (select (arr!17879 lt!276265) index!984))))

(assert (=> d!87539 (validMask!0 mask!3053)))

(assert (=> d!87539 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!276251 lt!276265 mask!3053) lt!276385)))

(declare-fun b!605810 () Bool)

(assert (=> b!605810 (= e!346771 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!276251 lt!276265 mask!3053))))

(declare-fun b!605811 () Bool)

(assert (=> b!605811 (= e!346772 e!346773)))

(declare-fun c!68643 () Bool)

(assert (=> b!605811 (= c!68643 (= lt!276386 lt!276251))))

(declare-fun b!605812 () Bool)

(assert (=> b!605812 (= e!346773 (Found!6316 index!984))))

(assert (= (and d!87539 c!68642) b!605807))

(assert (= (and d!87539 (not c!68642)) b!605811))

(assert (= (and b!605811 c!68643) b!605812))

(assert (= (and b!605811 (not c!68643)) b!605808))

(assert (= (and b!605808 c!68641) b!605809))

(assert (= (and b!605808 (not c!68641)) b!605810))

(declare-fun m!582175 () Bool)

(assert (=> d!87539 m!582175))

(declare-fun m!582177 () Bool)

(assert (=> d!87539 m!582177))

(declare-fun m!582179 () Bool)

(assert (=> d!87539 m!582179))

(assert (=> d!87539 m!581967))

(assert (=> b!605810 m!581953))

(assert (=> b!605810 m!581953))

(declare-fun m!582181 () Bool)

(assert (=> b!605810 m!582181))

(assert (=> b!605603 d!87539))

(declare-fun d!87541 () Bool)

(assert (=> d!87541 (= (validKeyInArray!0 (select (arr!17879 a!2986) j!136)) (and (not (= (select (arr!17879 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17879 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!605614 d!87541))

(declare-fun d!87543 () Bool)

(declare-fun res!389263 () Bool)

(declare-fun e!346778 () Bool)

(assert (=> d!87543 (=> res!389263 e!346778)))

(assert (=> d!87543 (= res!389263 (= (select (arr!17879 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!87543 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!346778)))

(declare-fun b!605817 () Bool)

(declare-fun e!346779 () Bool)

(assert (=> b!605817 (= e!346778 e!346779)))

(declare-fun res!389264 () Bool)

(assert (=> b!605817 (=> (not res!389264) (not e!346779))))

(assert (=> b!605817 (= res!389264 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18244 a!2986)))))

(declare-fun b!605818 () Bool)

(assert (=> b!605818 (= e!346779 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!87543 (not res!389263)) b!605817))

(assert (= (and b!605817 res!389264) b!605818))

(assert (=> d!87543 m!582139))

(declare-fun m!582183 () Bool)

(assert (=> b!605818 m!582183))

(assert (=> b!605618 d!87543))

(declare-fun d!87545 () Bool)

(declare-fun res!389269 () Bool)

(declare-fun e!346784 () Bool)

(assert (=> d!87545 (=> res!389269 e!346784)))

(assert (=> d!87545 (= res!389269 ((_ is Nil!11956) Nil!11956))))

(assert (=> d!87545 (= (noDuplicate!308 Nil!11956) e!346784)))

(declare-fun b!605823 () Bool)

(declare-fun e!346785 () Bool)

(assert (=> b!605823 (= e!346784 e!346785)))

(declare-fun res!389270 () Bool)

(assert (=> b!605823 (=> (not res!389270) (not e!346785))))

(declare-fun contains!2981 (List!11959 (_ BitVec 64)) Bool)

(assert (=> b!605823 (= res!389270 (not (contains!2981 (t!18178 Nil!11956) (h!13000 Nil!11956))))))

(declare-fun b!605824 () Bool)

(assert (=> b!605824 (= e!346785 (noDuplicate!308 (t!18178 Nil!11956)))))

(assert (= (and d!87545 (not res!389269)) b!605823))

(assert (= (and b!605823 res!389270) b!605824))

(declare-fun m!582185 () Bool)

(assert (=> b!605823 m!582185))

(declare-fun m!582187 () Bool)

(assert (=> b!605824 m!582187))

(assert (=> b!605616 d!87545))

(declare-fun d!87547 () Bool)

(declare-fun res!389271 () Bool)

(declare-fun e!346786 () Bool)

(assert (=> d!87547 (=> res!389271 e!346786)))

(assert (=> d!87547 (= res!389271 (= (select (arr!17879 lt!276265) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!17879 a!2986) j!136)))))

(assert (=> d!87547 (= (arrayContainsKey!0 lt!276265 (select (arr!17879 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!346786)))

(declare-fun b!605825 () Bool)

(declare-fun e!346787 () Bool)

(assert (=> b!605825 (= e!346786 e!346787)))

(declare-fun res!389272 () Bool)

(assert (=> b!605825 (=> (not res!389272) (not e!346787))))

(assert (=> b!605825 (= res!389272 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18244 lt!276265)))))

(declare-fun b!605826 () Bool)

(assert (=> b!605826 (= e!346787 (arrayContainsKey!0 lt!276265 (select (arr!17879 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!87547 (not res!389271)) b!605825))

(assert (= (and b!605825 res!389272) b!605826))

(declare-fun m!582189 () Bool)

(assert (=> d!87547 m!582189))

(assert (=> b!605826 m!581947))

(declare-fun m!582191 () Bool)

(assert (=> b!605826 m!582191))

(assert (=> b!605617 d!87547))

(declare-fun d!87549 () Bool)

(assert (=> d!87549 (arrayContainsKey!0 lt!276265 (select (arr!17879 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!276389 () Unit!19278)

(declare-fun choose!114 (array!37251 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19278)

(assert (=> d!87549 (= lt!276389 (choose!114 lt!276265 (select (arr!17879 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!87549 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!87549 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!276265 (select (arr!17879 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!276389)))

(declare-fun bs!18509 () Bool)

(assert (= bs!18509 d!87549))

(assert (=> bs!18509 m!581947))

(assert (=> bs!18509 m!581999))

(assert (=> bs!18509 m!581947))

(declare-fun m!582193 () Bool)

(assert (=> bs!18509 m!582193))

(assert (=> b!605617 d!87549))

(declare-fun d!87551 () Bool)

(declare-fun res!389273 () Bool)

(declare-fun e!346788 () Bool)

(assert (=> d!87551 (=> res!389273 e!346788)))

(assert (=> d!87551 (= res!389273 (= (select (arr!17879 lt!276265) j!136) (select (arr!17879 a!2986) j!136)))))

(assert (=> d!87551 (= (arrayContainsKey!0 lt!276265 (select (arr!17879 a!2986) j!136) j!136) e!346788)))

(declare-fun b!605827 () Bool)

(declare-fun e!346789 () Bool)

(assert (=> b!605827 (= e!346788 e!346789)))

(declare-fun res!389274 () Bool)

(assert (=> b!605827 (=> (not res!389274) (not e!346789))))

(assert (=> b!605827 (= res!389274 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18244 lt!276265)))))

(declare-fun b!605828 () Bool)

(assert (=> b!605828 (= e!346789 (arrayContainsKey!0 lt!276265 (select (arr!17879 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!87551 (not res!389273)) b!605827))

(assert (= (and b!605827 res!389274) b!605828))

(declare-fun m!582195 () Bool)

(assert (=> d!87551 m!582195))

(assert (=> b!605828 m!581947))

(declare-fun m!582197 () Bool)

(assert (=> b!605828 m!582197))

(assert (=> b!605617 d!87551))

(declare-fun d!87553 () Bool)

(assert (=> d!87553 (arrayNoDuplicates!0 lt!276265 j!136 Nil!11956)))

(declare-fun lt!276392 () Unit!19278)

(declare-fun choose!39 (array!37251 (_ BitVec 32) (_ BitVec 32)) Unit!19278)

(assert (=> d!87553 (= lt!276392 (choose!39 lt!276265 #b00000000000000000000000000000000 j!136))))

(assert (=> d!87553 (bvslt (size!18244 lt!276265) #b01111111111111111111111111111111)))

(assert (=> d!87553 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!276265 #b00000000000000000000000000000000 j!136) lt!276392)))

(declare-fun bs!18510 () Bool)

(assert (= bs!18510 d!87553))

(assert (=> bs!18510 m!581989))

(declare-fun m!582199 () Bool)

(assert (=> bs!18510 m!582199))

(assert (=> b!605606 d!87553))

(declare-fun d!87555 () Bool)

(declare-fun res!389275 () Bool)

(declare-fun e!346790 () Bool)

(assert (=> d!87555 (=> res!389275 e!346790)))

(assert (=> d!87555 (= res!389275 (= (select (arr!17879 lt!276265) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17879 a!2986) j!136)))))

(assert (=> d!87555 (= (arrayContainsKey!0 lt!276265 (select (arr!17879 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!346790)))

(declare-fun b!605829 () Bool)

(declare-fun e!346791 () Bool)

(assert (=> b!605829 (= e!346790 e!346791)))

(declare-fun res!389276 () Bool)

(assert (=> b!605829 (=> (not res!389276) (not e!346791))))

(assert (=> b!605829 (= res!389276 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18244 lt!276265)))))

(declare-fun b!605830 () Bool)

(assert (=> b!605830 (= e!346791 (arrayContainsKey!0 lt!276265 (select (arr!17879 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!87555 (not res!389275)) b!605829))

(assert (= (and b!605829 res!389276) b!605830))

(declare-fun m!582201 () Bool)

(assert (=> d!87555 m!582201))

(assert (=> b!605830 m!581947))

(declare-fun m!582203 () Bool)

(assert (=> b!605830 m!582203))

(assert (=> b!605606 d!87555))

(declare-fun d!87557 () Bool)

(assert (=> d!87557 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18244 lt!276265)) (not (= (select (arr!17879 lt!276265) j!136) (select (arr!17879 a!2986) j!136))))))

(declare-fun lt!276395 () Unit!19278)

(declare-fun choose!21 (array!37251 (_ BitVec 64) (_ BitVec 32) List!11959) Unit!19278)

(assert (=> d!87557 (= lt!276395 (choose!21 lt!276265 (select (arr!17879 a!2986) j!136) j!136 Nil!11956))))

(assert (=> d!87557 (bvslt (size!18244 lt!276265) #b01111111111111111111111111111111)))

(assert (=> d!87557 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!276265 (select (arr!17879 a!2986) j!136) j!136 Nil!11956) lt!276395)))

(declare-fun bs!18511 () Bool)

(assert (= bs!18511 d!87557))

(assert (=> bs!18511 m!582195))

(assert (=> bs!18511 m!581947))

(declare-fun m!582205 () Bool)

(assert (=> bs!18511 m!582205))

(assert (=> b!605606 d!87557))

(declare-fun d!87559 () Bool)

(assert (=> d!87559 (arrayContainsKey!0 lt!276265 (select (arr!17879 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!276396 () Unit!19278)

(assert (=> d!87559 (= lt!276396 (choose!114 lt!276265 (select (arr!17879 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!87559 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!87559 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!276265 (select (arr!17879 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!276396)))

(declare-fun bs!18512 () Bool)

(assert (= bs!18512 d!87559))

(assert (=> bs!18512 m!581947))

(assert (=> bs!18512 m!581983))

(assert (=> bs!18512 m!581947))

(declare-fun m!582207 () Bool)

(assert (=> bs!18512 m!582207))

(assert (=> b!605606 d!87559))

(declare-fun d!87561 () Bool)

(declare-fun e!346794 () Bool)

(assert (=> d!87561 e!346794))

(declare-fun res!389279 () Bool)

(assert (=> d!87561 (=> (not res!389279) (not e!346794))))

(assert (=> d!87561 (= res!389279 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18244 a!2986))))))

(declare-fun lt!276399 () Unit!19278)

(declare-fun choose!41 (array!37251 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11959) Unit!19278)

(assert (=> d!87561 (= lt!276399 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11956))))

(assert (=> d!87561 (bvslt (size!18244 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!87561 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11956) lt!276399)))

(declare-fun b!605833 () Bool)

(assert (=> b!605833 (= e!346794 (arrayNoDuplicates!0 (array!37252 (store (arr!17879 a!2986) i!1108 k0!1786) (size!18244 a!2986)) #b00000000000000000000000000000000 Nil!11956))))

(assert (= (and d!87561 res!389279) b!605833))

(declare-fun m!582209 () Bool)

(assert (=> d!87561 m!582209))

(assert (=> b!605833 m!581955))

(declare-fun m!582211 () Bool)

(assert (=> b!605833 m!582211))

(assert (=> b!605606 d!87561))

(declare-fun b!605844 () Bool)

(declare-fun e!346804 () Bool)

(declare-fun e!346803 () Bool)

(assert (=> b!605844 (= e!346804 e!346803)))

(declare-fun res!389288 () Bool)

(assert (=> b!605844 (=> (not res!389288) (not e!346803))))

(declare-fun e!346806 () Bool)

(assert (=> b!605844 (= res!389288 (not e!346806))))

(declare-fun res!389286 () Bool)

(assert (=> b!605844 (=> (not res!389286) (not e!346806))))

(assert (=> b!605844 (= res!389286 (validKeyInArray!0 (select (arr!17879 lt!276265) #b00000000000000000000000000000000)))))

(declare-fun b!605845 () Bool)

(declare-fun e!346805 () Bool)

(declare-fun call!33043 () Bool)

(assert (=> b!605845 (= e!346805 call!33043)))

(declare-fun b!605846 () Bool)

(assert (=> b!605846 (= e!346803 e!346805)))

(declare-fun c!68646 () Bool)

(assert (=> b!605846 (= c!68646 (validKeyInArray!0 (select (arr!17879 lt!276265) #b00000000000000000000000000000000)))))

(declare-fun b!605847 () Bool)

(assert (=> b!605847 (= e!346805 call!33043)))

(declare-fun b!605848 () Bool)

(assert (=> b!605848 (= e!346806 (contains!2981 Nil!11956 (select (arr!17879 lt!276265) #b00000000000000000000000000000000)))))

(declare-fun d!87563 () Bool)

(declare-fun res!389287 () Bool)

(assert (=> d!87563 (=> res!389287 e!346804)))

(assert (=> d!87563 (= res!389287 (bvsge #b00000000000000000000000000000000 (size!18244 lt!276265)))))

(assert (=> d!87563 (= (arrayNoDuplicates!0 lt!276265 #b00000000000000000000000000000000 Nil!11956) e!346804)))

(declare-fun bm!33040 () Bool)

(assert (=> bm!33040 (= call!33043 (arrayNoDuplicates!0 lt!276265 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!68646 (Cons!11955 (select (arr!17879 lt!276265) #b00000000000000000000000000000000) Nil!11956) Nil!11956)))))

(assert (= (and d!87563 (not res!389287)) b!605844))

(assert (= (and b!605844 res!389286) b!605848))

(assert (= (and b!605844 res!389288) b!605846))

(assert (= (and b!605846 c!68646) b!605847))

(assert (= (and b!605846 (not c!68646)) b!605845))

(assert (= (or b!605847 b!605845) bm!33040))

(declare-fun m!582213 () Bool)

(assert (=> b!605844 m!582213))

(assert (=> b!605844 m!582213))

(declare-fun m!582215 () Bool)

(assert (=> b!605844 m!582215))

(assert (=> b!605846 m!582213))

(assert (=> b!605846 m!582213))

(assert (=> b!605846 m!582215))

(assert (=> b!605848 m!582213))

(assert (=> b!605848 m!582213))

(declare-fun m!582217 () Bool)

(assert (=> b!605848 m!582217))

(assert (=> bm!33040 m!582213))

(declare-fun m!582219 () Bool)

(assert (=> bm!33040 m!582219))

(assert (=> b!605606 d!87563))

(declare-fun b!605849 () Bool)

(declare-fun e!346808 () Bool)

(declare-fun e!346807 () Bool)

(assert (=> b!605849 (= e!346808 e!346807)))

(declare-fun res!389291 () Bool)

(assert (=> b!605849 (=> (not res!389291) (not e!346807))))

(declare-fun e!346810 () Bool)

(assert (=> b!605849 (= res!389291 (not e!346810))))

(declare-fun res!389289 () Bool)

(assert (=> b!605849 (=> (not res!389289) (not e!346810))))

(assert (=> b!605849 (= res!389289 (validKeyInArray!0 (select (arr!17879 lt!276265) j!136)))))

(declare-fun b!605850 () Bool)

(declare-fun e!346809 () Bool)

(declare-fun call!33044 () Bool)

(assert (=> b!605850 (= e!346809 call!33044)))

(declare-fun b!605851 () Bool)

(assert (=> b!605851 (= e!346807 e!346809)))

(declare-fun c!68647 () Bool)

(assert (=> b!605851 (= c!68647 (validKeyInArray!0 (select (arr!17879 lt!276265) j!136)))))

(declare-fun b!605852 () Bool)

(assert (=> b!605852 (= e!346809 call!33044)))

(declare-fun b!605853 () Bool)

(assert (=> b!605853 (= e!346810 (contains!2981 Nil!11956 (select (arr!17879 lt!276265) j!136)))))

(declare-fun d!87565 () Bool)

(declare-fun res!389290 () Bool)

(assert (=> d!87565 (=> res!389290 e!346808)))

(assert (=> d!87565 (= res!389290 (bvsge j!136 (size!18244 lt!276265)))))

(assert (=> d!87565 (= (arrayNoDuplicates!0 lt!276265 j!136 Nil!11956) e!346808)))

(declare-fun bm!33041 () Bool)

(assert (=> bm!33041 (= call!33044 (arrayNoDuplicates!0 lt!276265 (bvadd j!136 #b00000000000000000000000000000001) (ite c!68647 (Cons!11955 (select (arr!17879 lt!276265) j!136) Nil!11956) Nil!11956)))))

(assert (= (and d!87565 (not res!389290)) b!605849))

(assert (= (and b!605849 res!389289) b!605853))

(assert (= (and b!605849 res!389291) b!605851))

(assert (= (and b!605851 c!68647) b!605852))

(assert (= (and b!605851 (not c!68647)) b!605850))

(assert (= (or b!605852 b!605850) bm!33041))

(assert (=> b!605849 m!582195))

(assert (=> b!605849 m!582195))

(declare-fun m!582221 () Bool)

(assert (=> b!605849 m!582221))

(assert (=> b!605851 m!582195))

(assert (=> b!605851 m!582195))

(assert (=> b!605851 m!582221))

(assert (=> b!605853 m!582195))

(assert (=> b!605853 m!582195))

(declare-fun m!582223 () Bool)

(assert (=> b!605853 m!582223))

(assert (=> bm!33041 m!582195))

(declare-fun m!582225 () Bool)

(assert (=> bm!33041 m!582225))

(assert (=> b!605606 d!87565))

(declare-fun b!605854 () Bool)

(declare-fun e!346812 () SeekEntryResult!6316)

(assert (=> b!605854 (= e!346812 Undefined!6316)))

(declare-fun b!605855 () Bool)

(declare-fun c!68648 () Bool)

(declare-fun lt!276401 () (_ BitVec 64))

(assert (=> b!605855 (= c!68648 (= lt!276401 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!346813 () SeekEntryResult!6316)

(declare-fun e!346811 () SeekEntryResult!6316)

(assert (=> b!605855 (= e!346813 e!346811)))

(declare-fun b!605856 () Bool)

(assert (=> b!605856 (= e!346811 (MissingVacant!6316 vacantSpotIndex!68))))

(declare-fun lt!276400 () SeekEntryResult!6316)

(declare-fun d!87567 () Bool)

(assert (=> d!87567 (and (or ((_ is Undefined!6316) lt!276400) (not ((_ is Found!6316) lt!276400)) (and (bvsge (index!27534 lt!276400) #b00000000000000000000000000000000) (bvslt (index!27534 lt!276400) (size!18244 a!2986)))) (or ((_ is Undefined!6316) lt!276400) ((_ is Found!6316) lt!276400) (not ((_ is MissingVacant!6316) lt!276400)) (not (= (index!27536 lt!276400) vacantSpotIndex!68)) (and (bvsge (index!27536 lt!276400) #b00000000000000000000000000000000) (bvslt (index!27536 lt!276400) (size!18244 a!2986)))) (or ((_ is Undefined!6316) lt!276400) (ite ((_ is Found!6316) lt!276400) (= (select (arr!17879 a!2986) (index!27534 lt!276400)) (select (arr!17879 a!2986) j!136)) (and ((_ is MissingVacant!6316) lt!276400) (= (index!27536 lt!276400) vacantSpotIndex!68) (= (select (arr!17879 a!2986) (index!27536 lt!276400)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87567 (= lt!276400 e!346812)))

(declare-fun c!68649 () Bool)

(assert (=> d!87567 (= c!68649 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!87567 (= lt!276401 (select (arr!17879 a!2986) index!984))))

(assert (=> d!87567 (validMask!0 mask!3053)))

(assert (=> d!87567 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17879 a!2986) j!136) a!2986 mask!3053) lt!276400)))

(declare-fun b!605857 () Bool)

(assert (=> b!605857 (= e!346811 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!17879 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!605858 () Bool)

(assert (=> b!605858 (= e!346812 e!346813)))

(declare-fun c!68650 () Bool)

(assert (=> b!605858 (= c!68650 (= lt!276401 (select (arr!17879 a!2986) j!136)))))

(declare-fun b!605859 () Bool)

(assert (=> b!605859 (= e!346813 (Found!6316 index!984))))

(assert (= (and d!87567 c!68649) b!605854))

(assert (= (and d!87567 (not c!68649)) b!605858))

(assert (= (and b!605858 c!68650) b!605859))

(assert (= (and b!605858 (not c!68650)) b!605855))

(assert (= (and b!605855 c!68648) b!605856))

(assert (= (and b!605855 (not c!68648)) b!605857))

(declare-fun m!582227 () Bool)

(assert (=> d!87567 m!582227))

(declare-fun m!582229 () Bool)

(assert (=> d!87567 m!582229))

(assert (=> d!87567 m!581945))

(assert (=> d!87567 m!581967))

(assert (=> b!605857 m!581953))

(assert (=> b!605857 m!581953))

(assert (=> b!605857 m!581947))

(declare-fun m!582231 () Bool)

(assert (=> b!605857 m!582231))

(assert (=> b!605621 d!87567))

(declare-fun d!87569 () Bool)

(assert (=> d!87569 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!605608 d!87569))

(declare-fun d!87571 () Bool)

(assert (=> d!87571 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!55326 d!87571))

(declare-fun d!87583 () Bool)

(assert (=> d!87583 (= (array_inv!13762 a!2986) (bvsge (size!18244 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!55326 d!87583))

(assert (=> b!605612 d!87551))

(declare-fun d!87585 () Bool)

(declare-fun res!389313 () Bool)

(declare-fun e!346838 () Bool)

(assert (=> d!87585 (=> res!389313 e!346838)))

(assert (=> d!87585 (= res!389313 (= (select (arr!17879 lt!276265) index!984) (select (arr!17879 a!2986) j!136)))))

(assert (=> d!87585 (= (arrayContainsKey!0 lt!276265 (select (arr!17879 a!2986) j!136) index!984) e!346838)))

(declare-fun b!605887 () Bool)

(declare-fun e!346839 () Bool)

(assert (=> b!605887 (= e!346838 e!346839)))

(declare-fun res!389314 () Bool)

(assert (=> b!605887 (=> (not res!389314) (not e!346839))))

(assert (=> b!605887 (= res!389314 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18244 lt!276265)))))

(declare-fun b!605888 () Bool)

(assert (=> b!605888 (= e!346839 (arrayContainsKey!0 lt!276265 (select (arr!17879 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!87585 (not res!389313)) b!605887))

(assert (= (and b!605887 res!389314) b!605888))

(assert (=> d!87585 m!582179))

(assert (=> b!605888 m!581947))

(declare-fun m!582241 () Bool)

(assert (=> b!605888 m!582241))

(assert (=> b!605602 d!87585))

(declare-fun b!605950 () Bool)

(declare-fun c!68670 () Bool)

(declare-fun lt!276439 () (_ BitVec 64))

(assert (=> b!605950 (= c!68670 (= lt!276439 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!346886 () SeekEntryResult!6316)

(declare-fun e!346885 () SeekEntryResult!6316)

(assert (=> b!605950 (= e!346886 e!346885)))

(declare-fun b!605951 () Bool)

(declare-fun e!346887 () SeekEntryResult!6316)

(assert (=> b!605951 (= e!346887 Undefined!6316)))

(declare-fun d!87587 () Bool)

(declare-fun lt!276440 () SeekEntryResult!6316)

(assert (=> d!87587 (and (or ((_ is Undefined!6316) lt!276440) (not ((_ is Found!6316) lt!276440)) (and (bvsge (index!27534 lt!276440) #b00000000000000000000000000000000) (bvslt (index!27534 lt!276440) (size!18244 a!2986)))) (or ((_ is Undefined!6316) lt!276440) ((_ is Found!6316) lt!276440) (not ((_ is MissingZero!6316) lt!276440)) (and (bvsge (index!27533 lt!276440) #b00000000000000000000000000000000) (bvslt (index!27533 lt!276440) (size!18244 a!2986)))) (or ((_ is Undefined!6316) lt!276440) ((_ is Found!6316) lt!276440) ((_ is MissingZero!6316) lt!276440) (not ((_ is MissingVacant!6316) lt!276440)) (and (bvsge (index!27536 lt!276440) #b00000000000000000000000000000000) (bvslt (index!27536 lt!276440) (size!18244 a!2986)))) (or ((_ is Undefined!6316) lt!276440) (ite ((_ is Found!6316) lt!276440) (= (select (arr!17879 a!2986) (index!27534 lt!276440)) k0!1786) (ite ((_ is MissingZero!6316) lt!276440) (= (select (arr!17879 a!2986) (index!27533 lt!276440)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6316) lt!276440) (= (select (arr!17879 a!2986) (index!27536 lt!276440)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!87587 (= lt!276440 e!346887)))

(declare-fun c!68671 () Bool)

(declare-fun lt!276438 () SeekEntryResult!6316)

(assert (=> d!87587 (= c!68671 (and ((_ is Intermediate!6316) lt!276438) (undefined!7128 lt!276438)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37251 (_ BitVec 32)) SeekEntryResult!6316)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!87587 (= lt!276438 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!87587 (validMask!0 mask!3053)))

(assert (=> d!87587 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!276440)))

(declare-fun b!605952 () Bool)

(assert (=> b!605952 (= e!346885 (seekKeyOrZeroReturnVacant!0 (x!56346 lt!276438) (index!27535 lt!276438) (index!27535 lt!276438) k0!1786 a!2986 mask!3053))))

(declare-fun b!605953 () Bool)

(assert (=> b!605953 (= e!346886 (Found!6316 (index!27535 lt!276438)))))

(declare-fun b!605954 () Bool)

(assert (=> b!605954 (= e!346885 (MissingZero!6316 (index!27535 lt!276438)))))

(declare-fun b!605955 () Bool)

(assert (=> b!605955 (= e!346887 e!346886)))

(assert (=> b!605955 (= lt!276439 (select (arr!17879 a!2986) (index!27535 lt!276438)))))

(declare-fun c!68672 () Bool)

(assert (=> b!605955 (= c!68672 (= lt!276439 k0!1786))))

(assert (= (and d!87587 c!68671) b!605951))

(assert (= (and d!87587 (not c!68671)) b!605955))

(assert (= (and b!605955 c!68672) b!605953))

(assert (= (and b!605955 (not c!68672)) b!605950))

(assert (= (and b!605950 c!68670) b!605954))

(assert (= (and b!605950 (not c!68670)) b!605952))

(declare-fun m!582301 () Bool)

(assert (=> d!87587 m!582301))

(declare-fun m!582303 () Bool)

(assert (=> d!87587 m!582303))

(assert (=> d!87587 m!581967))

(declare-fun m!582305 () Bool)

(assert (=> d!87587 m!582305))

(declare-fun m!582307 () Bool)

(assert (=> d!87587 m!582307))

(assert (=> d!87587 m!582307))

(declare-fun m!582309 () Bool)

(assert (=> d!87587 m!582309))

(declare-fun m!582311 () Bool)

(assert (=> b!605952 m!582311))

(declare-fun m!582313 () Bool)

(assert (=> b!605955 m!582313))

(assert (=> b!605611 d!87587))

(assert (=> b!605600 d!87585))

(declare-fun b!605956 () Bool)

(declare-fun e!346889 () Bool)

(declare-fun e!346888 () Bool)

(assert (=> b!605956 (= e!346889 e!346888)))

(declare-fun res!389346 () Bool)

(assert (=> b!605956 (=> (not res!389346) (not e!346888))))

(declare-fun e!346891 () Bool)

(assert (=> b!605956 (= res!389346 (not e!346891))))

(declare-fun res!389344 () Bool)

(assert (=> b!605956 (=> (not res!389344) (not e!346891))))

(assert (=> b!605956 (= res!389344 (validKeyInArray!0 (select (arr!17879 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!605957 () Bool)

(declare-fun e!346890 () Bool)

(declare-fun call!33058 () Bool)

(assert (=> b!605957 (= e!346890 call!33058)))

(declare-fun b!605958 () Bool)

(assert (=> b!605958 (= e!346888 e!346890)))

(declare-fun c!68673 () Bool)

(assert (=> b!605958 (= c!68673 (validKeyInArray!0 (select (arr!17879 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!605959 () Bool)

(assert (=> b!605959 (= e!346890 call!33058)))

(declare-fun b!605960 () Bool)

(assert (=> b!605960 (= e!346891 (contains!2981 Nil!11956 (select (arr!17879 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!87613 () Bool)

(declare-fun res!389345 () Bool)

(assert (=> d!87613 (=> res!389345 e!346889)))

(assert (=> d!87613 (= res!389345 (bvsge #b00000000000000000000000000000000 (size!18244 a!2986)))))

(assert (=> d!87613 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11956) e!346889)))

(declare-fun bm!33055 () Bool)

(assert (=> bm!33055 (= call!33058 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!68673 (Cons!11955 (select (arr!17879 a!2986) #b00000000000000000000000000000000) Nil!11956) Nil!11956)))))

(assert (= (and d!87613 (not res!389345)) b!605956))

(assert (= (and b!605956 res!389344) b!605960))

(assert (= (and b!605956 res!389346) b!605958))

(assert (= (and b!605958 c!68673) b!605959))

(assert (= (and b!605958 (not c!68673)) b!605957))

(assert (= (or b!605959 b!605957) bm!33055))

(assert (=> b!605956 m!582139))

(assert (=> b!605956 m!582139))

(assert (=> b!605956 m!582147))

(assert (=> b!605958 m!582139))

(assert (=> b!605958 m!582139))

(assert (=> b!605958 m!582147))

(assert (=> b!605960 m!582139))

(assert (=> b!605960 m!582139))

(declare-fun m!582315 () Bool)

(assert (=> b!605960 m!582315))

(assert (=> bm!33055 m!582139))

(declare-fun m!582317 () Bool)

(assert (=> bm!33055 m!582317))

(assert (=> b!605622 d!87613))

(check-sat (not b!605851) (not b!605956) (not b!605826) (not b!605830) (not b!605888) (not b!605844) (not bm!33055) (not b!605833) (not b!605853) (not d!87539) (not d!87549) (not b!605952) (not d!87535) (not d!87587) (not d!87533) (not d!87537) (not b!605848) (not b!605818) (not bm!33037) (not b!605795) (not b!605824) (not d!87561) (not b!605810) (not b!605777) (not d!87557) (not b!605958) (not b!605857) (not d!87553) (not b!605823) (not d!87531) (not b!605801) (not d!87559) (not b!605779) (not b!605849) (not bm!33041) (not bm!33040) (not d!87567) (not b!605960) (not b!605846) (not b!605828) (not b!605806))
(check-sat)
