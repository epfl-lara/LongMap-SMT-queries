; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57674 () Bool)

(assert start!57674)

(declare-fun b!637100 () Bool)

(declare-datatypes ((Unit!21476 0))(
  ( (Unit!21477) )
))
(declare-fun e!364544 () Unit!21476)

(declare-fun Unit!21478 () Unit!21476)

(assert (=> b!637100 (= e!364544 Unit!21478)))

(declare-fun b!637101 () Bool)

(declare-fun e!364542 () Bool)

(declare-datatypes ((SeekEntryResult!6787 0))(
  ( (MissingZero!6787 (index!29462 (_ BitVec 32))) (Found!6787 (index!29463 (_ BitVec 32))) (Intermediate!6787 (undefined!7599 Bool) (index!29464 (_ BitVec 32)) (x!58232 (_ BitVec 32))) (Undefined!6787) (MissingVacant!6787 (index!29465 (_ BitVec 32))) )
))
(declare-fun lt!294453 () SeekEntryResult!6787)

(declare-fun lt!294447 () SeekEntryResult!6787)

(assert (=> b!637101 (= e!364542 (= lt!294453 lt!294447))))

(declare-fun b!637102 () Bool)

(declare-fun res!412176 () Bool)

(declare-fun e!364539 () Bool)

(assert (=> b!637102 (=> res!412176 e!364539)))

(declare-datatypes ((List!12430 0))(
  ( (Nil!12427) (Cons!12426 (h!13471 (_ BitVec 64)) (t!18649 List!12430)) )
))
(declare-fun contains!3090 (List!12430 (_ BitVec 64)) Bool)

(assert (=> b!637102 (= res!412176 (contains!3090 Nil!12427 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!637103 () Bool)

(declare-fun e!364536 () Bool)

(declare-fun e!364534 () Bool)

(assert (=> b!637103 (= e!364536 e!364534)))

(declare-fun res!412191 () Bool)

(assert (=> b!637103 (=> (not res!412191) (not e!364534))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!38256 0))(
  ( (array!38257 (arr!18350 (Array (_ BitVec 32) (_ BitVec 64))) (size!18715 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38256)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!637103 (= res!412191 (= (select (store (arr!18350 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!294451 () array!38256)

(assert (=> b!637103 (= lt!294451 (array!38257 (store (arr!18350 a!2986) i!1108 k0!1786) (size!18715 a!2986)))))

(declare-fun b!637104 () Bool)

(declare-fun e!364532 () Bool)

(declare-fun e!364541 () Bool)

(assert (=> b!637104 (= e!364532 e!364541)))

(declare-fun res!412186 () Bool)

(assert (=> b!637104 (=> (not res!412186) (not e!364541))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!38256 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!637104 (= res!412186 (arrayContainsKey!0 lt!294451 (select (arr!18350 a!2986) j!136) j!136))))

(declare-fun b!637105 () Bool)

(declare-fun e!364537 () Bool)

(assert (=> b!637105 (= e!364534 e!364537)))

(declare-fun res!412177 () Bool)

(assert (=> b!637105 (=> (not res!412177) (not e!364537))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!637105 (= res!412177 (and (= lt!294453 (Found!6787 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18350 a!2986) index!984) (select (arr!18350 a!2986) j!136))) (not (= (select (arr!18350 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38256 (_ BitVec 32)) SeekEntryResult!6787)

(assert (=> b!637105 (= lt!294453 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18350 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!412175 () Bool)

(declare-fun e!364533 () Bool)

(assert (=> start!57674 (=> (not res!412175) (not e!364533))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57674 (= res!412175 (validMask!0 mask!3053))))

(assert (=> start!57674 e!364533))

(assert (=> start!57674 true))

(declare-fun array_inv!14233 (array!38256) Bool)

(assert (=> start!57674 (array_inv!14233 a!2986)))

(declare-fun b!637106 () Bool)

(declare-fun res!412188 () Bool)

(assert (=> b!637106 (=> (not res!412188) (not e!364536))))

(declare-fun arrayNoDuplicates!0 (array!38256 (_ BitVec 32) List!12430) Bool)

(assert (=> b!637106 (= res!412188 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12427))))

(declare-fun b!637107 () Bool)

(declare-fun res!412189 () Bool)

(assert (=> b!637107 (=> (not res!412189) (not e!364533))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!637107 (= res!412189 (validKeyInArray!0 k0!1786))))

(declare-fun b!637108 () Bool)

(declare-fun e!364540 () Bool)

(assert (=> b!637108 (= e!364540 e!364532)))

(declare-fun res!412172 () Bool)

(assert (=> b!637108 (=> res!412172 e!364532)))

(declare-fun lt!294455 () (_ BitVec 64))

(declare-fun lt!294456 () (_ BitVec 64))

(assert (=> b!637108 (= res!412172 (or (not (= (select (arr!18350 a!2986) j!136) lt!294456)) (not (= (select (arr!18350 a!2986) j!136) lt!294455)) (bvsge j!136 index!984)))))

(declare-fun b!637109 () Bool)

(declare-fun e!364543 () Bool)

(assert (=> b!637109 (= e!364543 e!364539)))

(declare-fun res!412179 () Bool)

(assert (=> b!637109 (=> res!412179 e!364539)))

(assert (=> b!637109 (= res!412179 (or (bvsge (size!18715 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18715 a!2986))))))

(assert (=> b!637109 (arrayContainsKey!0 lt!294451 (select (arr!18350 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!294445 () Unit!21476)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38256 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21476)

(assert (=> b!637109 (= lt!294445 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!294451 (select (arr!18350 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!637110 () Bool)

(declare-fun res!412173 () Bool)

(assert (=> b!637110 (=> res!412173 e!364539)))

(assert (=> b!637110 (= res!412173 (contains!3090 Nil!12427 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!637111 () Bool)

(declare-fun e!364535 () Bool)

(assert (=> b!637111 (= e!364535 e!364543)))

(declare-fun res!412187 () Bool)

(assert (=> b!637111 (=> res!412187 e!364543)))

(assert (=> b!637111 (= res!412187 (or (not (= (select (arr!18350 a!2986) j!136) lt!294456)) (not (= (select (arr!18350 a!2986) j!136) lt!294455)) (bvsge j!136 index!984)))))

(assert (=> b!637111 e!364540))

(declare-fun res!412174 () Bool)

(assert (=> b!637111 (=> (not res!412174) (not e!364540))))

(assert (=> b!637111 (= res!412174 (= lt!294455 (select (arr!18350 a!2986) j!136)))))

(assert (=> b!637111 (= lt!294455 (select (store (arr!18350 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!637112 () Bool)

(assert (=> b!637112 (= e!364537 (not e!364535))))

(declare-fun res!412181 () Bool)

(assert (=> b!637112 (=> res!412181 e!364535)))

(declare-fun lt!294450 () SeekEntryResult!6787)

(assert (=> b!637112 (= res!412181 (not (= lt!294450 (Found!6787 index!984))))))

(declare-fun lt!294454 () Unit!21476)

(assert (=> b!637112 (= lt!294454 e!364544)))

(declare-fun c!72831 () Bool)

(assert (=> b!637112 (= c!72831 (= lt!294450 Undefined!6787))))

(assert (=> b!637112 (= lt!294450 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!294456 lt!294451 mask!3053))))

(assert (=> b!637112 e!364542))

(declare-fun res!412184 () Bool)

(assert (=> b!637112 (=> (not res!412184) (not e!364542))))

(declare-fun lt!294446 () (_ BitVec 32))

(assert (=> b!637112 (= res!412184 (= lt!294447 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294446 vacantSpotIndex!68 lt!294456 lt!294451 mask!3053)))))

(assert (=> b!637112 (= lt!294447 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294446 vacantSpotIndex!68 (select (arr!18350 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!637112 (= lt!294456 (select (store (arr!18350 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!294449 () Unit!21476)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38256 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21476)

(assert (=> b!637112 (= lt!294449 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!294446 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!637112 (= lt!294446 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!637113 () Bool)

(assert (=> b!637113 (= e!364539 true)))

(declare-fun lt!294452 () Bool)

(assert (=> b!637113 (= lt!294452 (contains!3090 Nil!12427 k0!1786))))

(declare-fun b!637114 () Bool)

(assert (=> b!637114 (= e!364533 e!364536)))

(declare-fun res!412190 () Bool)

(assert (=> b!637114 (=> (not res!412190) (not e!364536))))

(declare-fun lt!294448 () SeekEntryResult!6787)

(assert (=> b!637114 (= res!412190 (or (= lt!294448 (MissingZero!6787 i!1108)) (= lt!294448 (MissingVacant!6787 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38256 (_ BitVec 32)) SeekEntryResult!6787)

(assert (=> b!637114 (= lt!294448 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!637115 () Bool)

(declare-fun res!412192 () Bool)

(assert (=> b!637115 (=> (not res!412192) (not e!364533))))

(assert (=> b!637115 (= res!412192 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!637116 () Bool)

(declare-fun res!412183 () Bool)

(assert (=> b!637116 (=> res!412183 e!364539)))

(declare-fun noDuplicate!389 (List!12430) Bool)

(assert (=> b!637116 (= res!412183 (not (noDuplicate!389 Nil!12427)))))

(declare-fun b!637117 () Bool)

(declare-fun res!412180 () Bool)

(assert (=> b!637117 (=> (not res!412180) (not e!364533))))

(assert (=> b!637117 (= res!412180 (validKeyInArray!0 (select (arr!18350 a!2986) j!136)))))

(declare-fun b!637118 () Bool)

(declare-fun res!412178 () Bool)

(assert (=> b!637118 (=> (not res!412178) (not e!364533))))

(assert (=> b!637118 (= res!412178 (and (= (size!18715 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18715 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18715 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!637119 () Bool)

(declare-fun res!412185 () Bool)

(assert (=> b!637119 (=> (not res!412185) (not e!364536))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38256 (_ BitVec 32)) Bool)

(assert (=> b!637119 (= res!412185 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!637120 () Bool)

(declare-fun Unit!21479 () Unit!21476)

(assert (=> b!637120 (= e!364544 Unit!21479)))

(assert (=> b!637120 false))

(declare-fun b!637121 () Bool)

(declare-fun res!412182 () Bool)

(assert (=> b!637121 (=> (not res!412182) (not e!364536))))

(assert (=> b!637121 (= res!412182 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18350 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!637122 () Bool)

(assert (=> b!637122 (= e!364541 (arrayContainsKey!0 lt!294451 (select (arr!18350 a!2986) j!136) index!984))))

(assert (= (and start!57674 res!412175) b!637118))

(assert (= (and b!637118 res!412178) b!637117))

(assert (= (and b!637117 res!412180) b!637107))

(assert (= (and b!637107 res!412189) b!637115))

(assert (= (and b!637115 res!412192) b!637114))

(assert (= (and b!637114 res!412190) b!637119))

(assert (= (and b!637119 res!412185) b!637106))

(assert (= (and b!637106 res!412188) b!637121))

(assert (= (and b!637121 res!412182) b!637103))

(assert (= (and b!637103 res!412191) b!637105))

(assert (= (and b!637105 res!412177) b!637112))

(assert (= (and b!637112 res!412184) b!637101))

(assert (= (and b!637112 c!72831) b!637120))

(assert (= (and b!637112 (not c!72831)) b!637100))

(assert (= (and b!637112 (not res!412181)) b!637111))

(assert (= (and b!637111 res!412174) b!637108))

(assert (= (and b!637108 (not res!412172)) b!637104))

(assert (= (and b!637104 res!412186) b!637122))

(assert (= (and b!637111 (not res!412187)) b!637109))

(assert (= (and b!637109 (not res!412179)) b!637116))

(assert (= (and b!637116 (not res!412183)) b!637110))

(assert (= (and b!637110 (not res!412173)) b!637102))

(assert (= (and b!637102 (not res!412176)) b!637113))

(declare-fun m!610701 () Bool)

(assert (=> b!637102 m!610701))

(declare-fun m!610703 () Bool)

(assert (=> b!637113 m!610703))

(declare-fun m!610705 () Bool)

(assert (=> b!637117 m!610705))

(assert (=> b!637117 m!610705))

(declare-fun m!610707 () Bool)

(assert (=> b!637117 m!610707))

(declare-fun m!610709 () Bool)

(assert (=> b!637115 m!610709))

(assert (=> b!637111 m!610705))

(declare-fun m!610711 () Bool)

(assert (=> b!637111 m!610711))

(declare-fun m!610713 () Bool)

(assert (=> b!637111 m!610713))

(assert (=> b!637108 m!610705))

(declare-fun m!610715 () Bool)

(assert (=> b!637106 m!610715))

(assert (=> b!637104 m!610705))

(assert (=> b!637104 m!610705))

(declare-fun m!610717 () Bool)

(assert (=> b!637104 m!610717))

(declare-fun m!610719 () Bool)

(assert (=> b!637112 m!610719))

(declare-fun m!610721 () Bool)

(assert (=> b!637112 m!610721))

(declare-fun m!610723 () Bool)

(assert (=> b!637112 m!610723))

(assert (=> b!637112 m!610705))

(assert (=> b!637112 m!610711))

(declare-fun m!610725 () Bool)

(assert (=> b!637112 m!610725))

(assert (=> b!637112 m!610705))

(declare-fun m!610727 () Bool)

(assert (=> b!637112 m!610727))

(declare-fun m!610729 () Bool)

(assert (=> b!637112 m!610729))

(declare-fun m!610731 () Bool)

(assert (=> b!637107 m!610731))

(assert (=> b!637109 m!610705))

(assert (=> b!637109 m!610705))

(declare-fun m!610733 () Bool)

(assert (=> b!637109 m!610733))

(assert (=> b!637109 m!610705))

(declare-fun m!610735 () Bool)

(assert (=> b!637109 m!610735))

(declare-fun m!610737 () Bool)

(assert (=> b!637116 m!610737))

(declare-fun m!610739 () Bool)

(assert (=> b!637121 m!610739))

(declare-fun m!610741 () Bool)

(assert (=> b!637119 m!610741))

(assert (=> b!637122 m!610705))

(assert (=> b!637122 m!610705))

(declare-fun m!610743 () Bool)

(assert (=> b!637122 m!610743))

(declare-fun m!610745 () Bool)

(assert (=> start!57674 m!610745))

(declare-fun m!610747 () Bool)

(assert (=> start!57674 m!610747))

(declare-fun m!610749 () Bool)

(assert (=> b!637114 m!610749))

(declare-fun m!610751 () Bool)

(assert (=> b!637105 m!610751))

(assert (=> b!637105 m!610705))

(assert (=> b!637105 m!610705))

(declare-fun m!610753 () Bool)

(assert (=> b!637105 m!610753))

(assert (=> b!637103 m!610711))

(declare-fun m!610755 () Bool)

(assert (=> b!637103 m!610755))

(declare-fun m!610757 () Bool)

(assert (=> b!637110 m!610757))

(check-sat (not b!637122) (not b!637102) (not b!637107) (not b!637116) (not b!637119) (not b!637110) (not b!637114) (not b!637113) (not start!57674) (not b!637115) (not b!637117) (not b!637112) (not b!637104) (not b!637105) (not b!637106) (not b!637109))
(check-sat)
