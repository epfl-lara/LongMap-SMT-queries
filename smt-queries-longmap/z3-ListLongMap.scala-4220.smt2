; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57902 () Bool)

(assert start!57902)

(declare-fun b!640134 () Bool)

(declare-fun res!414570 () Bool)

(declare-fun e!366417 () Bool)

(assert (=> b!640134 (=> (not res!414570) (not e!366417))))

(declare-datatypes ((array!38340 0))(
  ( (array!38341 (arr!18389 (Array (_ BitVec 32) (_ BitVec 64))) (size!18754 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38340)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38340 (_ BitVec 32)) Bool)

(assert (=> b!640134 (= res!414570 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!640135 () Bool)

(declare-fun res!414561 () Bool)

(assert (=> b!640135 (=> (not res!414561) (not e!366417))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!640135 (= res!414561 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18389 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!640136 () Bool)

(declare-fun res!414559 () Bool)

(declare-fun e!366411 () Bool)

(assert (=> b!640136 (=> (not res!414559) (not e!366411))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!640136 (= res!414559 (validKeyInArray!0 (select (arr!18389 a!2986) j!136)))))

(declare-fun b!640137 () Bool)

(declare-fun e!366414 () Bool)

(declare-fun e!366420 () Bool)

(assert (=> b!640137 (= e!366414 (not e!366420))))

(declare-fun res!414574 () Bool)

(assert (=> b!640137 (=> res!414574 e!366420)))

(declare-datatypes ((SeekEntryResult!6826 0))(
  ( (MissingZero!6826 (index!29624 (_ BitVec 32))) (Found!6826 (index!29625 (_ BitVec 32))) (Intermediate!6826 (undefined!7638 Bool) (index!29626 (_ BitVec 32)) (x!58393 (_ BitVec 32))) (Undefined!6826) (MissingVacant!6826 (index!29627 (_ BitVec 32))) )
))
(declare-fun lt!296141 () SeekEntryResult!6826)

(assert (=> b!640137 (= res!414574 (not (= lt!296141 (Found!6826 index!984))))))

(declare-datatypes ((Unit!21632 0))(
  ( (Unit!21633) )
))
(declare-fun lt!296142 () Unit!21632)

(declare-fun e!366415 () Unit!21632)

(assert (=> b!640137 (= lt!296142 e!366415)))

(declare-fun c!73155 () Bool)

(assert (=> b!640137 (= c!73155 (= lt!296141 Undefined!6826))))

(declare-fun lt!296137 () (_ BitVec 64))

(declare-fun lt!296140 () array!38340)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38340 (_ BitVec 32)) SeekEntryResult!6826)

(assert (=> b!640137 (= lt!296141 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!296137 lt!296140 mask!3053))))

(declare-fun e!366422 () Bool)

(assert (=> b!640137 e!366422))

(declare-fun res!414565 () Bool)

(assert (=> b!640137 (=> (not res!414565) (not e!366422))))

(declare-fun lt!296135 () (_ BitVec 32))

(declare-fun lt!296138 () SeekEntryResult!6826)

(assert (=> b!640137 (= res!414565 (= lt!296138 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296135 vacantSpotIndex!68 lt!296137 lt!296140 mask!3053)))))

(assert (=> b!640137 (= lt!296138 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296135 vacantSpotIndex!68 (select (arr!18389 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!640137 (= lt!296137 (select (store (arr!18389 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!296133 () Unit!21632)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38340 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21632)

(assert (=> b!640137 (= lt!296133 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!296135 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!640137 (= lt!296135 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!640138 () Bool)

(declare-fun e!366412 () Bool)

(assert (=> b!640138 (= e!366412 true)))

(declare-datatypes ((List!12469 0))(
  ( (Nil!12466) (Cons!12465 (h!13510 (_ BitVec 64)) (t!18688 List!12469)) )
))
(declare-fun arrayNoDuplicates!0 (array!38340 (_ BitVec 32) List!12469) Bool)

(assert (=> b!640138 (arrayNoDuplicates!0 lt!296140 j!136 Nil!12466)))

(declare-fun lt!296132 () Unit!21632)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38340 (_ BitVec 32) (_ BitVec 32)) Unit!21632)

(assert (=> b!640138 (= lt!296132 (lemmaNoDuplicateFromThenFromBigger!0 lt!296140 #b00000000000000000000000000000000 j!136))))

(assert (=> b!640138 (arrayNoDuplicates!0 lt!296140 #b00000000000000000000000000000000 Nil!12466)))

(declare-fun lt!296134 () Unit!21632)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38340 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12469) Unit!21632)

(assert (=> b!640138 (= lt!296134 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12466))))

(declare-fun arrayContainsKey!0 (array!38340 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!640138 (arrayContainsKey!0 lt!296140 (select (arr!18389 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!296130 () Unit!21632)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38340 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21632)

(assert (=> b!640138 (= lt!296130 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!296140 (select (arr!18389 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!640139 () Bool)

(declare-fun e!366413 () Bool)

(assert (=> b!640139 (= e!366417 e!366413)))

(declare-fun res!414566 () Bool)

(assert (=> b!640139 (=> (not res!414566) (not e!366413))))

(assert (=> b!640139 (= res!414566 (= (select (store (arr!18389 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!640139 (= lt!296140 (array!38341 (store (arr!18389 a!2986) i!1108 k0!1786) (size!18754 a!2986)))))

(declare-fun b!640140 () Bool)

(assert (=> b!640140 (= e!366413 e!366414)))

(declare-fun res!414562 () Bool)

(assert (=> b!640140 (=> (not res!414562) (not e!366414))))

(declare-fun lt!296136 () SeekEntryResult!6826)

(assert (=> b!640140 (= res!414562 (and (= lt!296136 (Found!6826 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18389 a!2986) index!984) (select (arr!18389 a!2986) j!136))) (not (= (select (arr!18389 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!640140 (= lt!296136 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18389 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!640142 () Bool)

(declare-fun res!414569 () Bool)

(assert (=> b!640142 (=> (not res!414569) (not e!366411))))

(assert (=> b!640142 (= res!414569 (validKeyInArray!0 k0!1786))))

(declare-fun b!640143 () Bool)

(declare-fun e!366418 () Bool)

(declare-fun e!366419 () Bool)

(assert (=> b!640143 (= e!366418 e!366419)))

(declare-fun res!414563 () Bool)

(assert (=> b!640143 (=> (not res!414563) (not e!366419))))

(assert (=> b!640143 (= res!414563 (arrayContainsKey!0 lt!296140 (select (arr!18389 a!2986) j!136) j!136))))

(declare-fun b!640144 () Bool)

(assert (=> b!640144 (= e!366422 (= lt!296136 lt!296138))))

(declare-fun b!640145 () Bool)

(declare-fun res!414567 () Bool)

(assert (=> b!640145 (=> (not res!414567) (not e!366411))))

(assert (=> b!640145 (= res!414567 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!640146 () Bool)

(declare-fun res!414560 () Bool)

(assert (=> b!640146 (=> (not res!414560) (not e!366411))))

(assert (=> b!640146 (= res!414560 (and (= (size!18754 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18754 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18754 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!640147 () Bool)

(assert (=> b!640147 (= e!366419 (arrayContainsKey!0 lt!296140 (select (arr!18389 a!2986) j!136) index!984))))

(declare-fun b!640148 () Bool)

(assert (=> b!640148 (= e!366420 e!366412)))

(declare-fun res!414571 () Bool)

(assert (=> b!640148 (=> res!414571 e!366412)))

(declare-fun lt!296139 () (_ BitVec 64))

(assert (=> b!640148 (= res!414571 (or (not (= (select (arr!18389 a!2986) j!136) lt!296137)) (not (= (select (arr!18389 a!2986) j!136) lt!296139)) (bvsge j!136 index!984)))))

(declare-fun e!366421 () Bool)

(assert (=> b!640148 e!366421))

(declare-fun res!414572 () Bool)

(assert (=> b!640148 (=> (not res!414572) (not e!366421))))

(assert (=> b!640148 (= res!414572 (= lt!296139 (select (arr!18389 a!2986) j!136)))))

(assert (=> b!640148 (= lt!296139 (select (store (arr!18389 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!640149 () Bool)

(assert (=> b!640149 (= e!366411 e!366417)))

(declare-fun res!414558 () Bool)

(assert (=> b!640149 (=> (not res!414558) (not e!366417))))

(declare-fun lt!296131 () SeekEntryResult!6826)

(assert (=> b!640149 (= res!414558 (or (= lt!296131 (MissingZero!6826 i!1108)) (= lt!296131 (MissingVacant!6826 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38340 (_ BitVec 32)) SeekEntryResult!6826)

(assert (=> b!640149 (= lt!296131 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!640150 () Bool)

(assert (=> b!640150 (= e!366421 e!366418)))

(declare-fun res!414568 () Bool)

(assert (=> b!640150 (=> res!414568 e!366418)))

(assert (=> b!640150 (= res!414568 (or (not (= (select (arr!18389 a!2986) j!136) lt!296137)) (not (= (select (arr!18389 a!2986) j!136) lt!296139)) (bvsge j!136 index!984)))))

(declare-fun b!640151 () Bool)

(declare-fun res!414573 () Bool)

(assert (=> b!640151 (=> (not res!414573) (not e!366417))))

(assert (=> b!640151 (= res!414573 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12466))))

(declare-fun b!640152 () Bool)

(declare-fun Unit!21634 () Unit!21632)

(assert (=> b!640152 (= e!366415 Unit!21634)))

(assert (=> b!640152 false))

(declare-fun b!640141 () Bool)

(declare-fun Unit!21635 () Unit!21632)

(assert (=> b!640141 (= e!366415 Unit!21635)))

(declare-fun res!414564 () Bool)

(assert (=> start!57902 (=> (not res!414564) (not e!366411))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57902 (= res!414564 (validMask!0 mask!3053))))

(assert (=> start!57902 e!366411))

(assert (=> start!57902 true))

(declare-fun array_inv!14272 (array!38340) Bool)

(assert (=> start!57902 (array_inv!14272 a!2986)))

(assert (= (and start!57902 res!414564) b!640146))

(assert (= (and b!640146 res!414560) b!640136))

(assert (= (and b!640136 res!414559) b!640142))

(assert (= (and b!640142 res!414569) b!640145))

(assert (= (and b!640145 res!414567) b!640149))

(assert (= (and b!640149 res!414558) b!640134))

(assert (= (and b!640134 res!414570) b!640151))

(assert (= (and b!640151 res!414573) b!640135))

(assert (= (and b!640135 res!414561) b!640139))

(assert (= (and b!640139 res!414566) b!640140))

(assert (= (and b!640140 res!414562) b!640137))

(assert (= (and b!640137 res!414565) b!640144))

(assert (= (and b!640137 c!73155) b!640152))

(assert (= (and b!640137 (not c!73155)) b!640141))

(assert (= (and b!640137 (not res!414574)) b!640148))

(assert (= (and b!640148 res!414572) b!640150))

(assert (= (and b!640150 (not res!414568)) b!640143))

(assert (= (and b!640143 res!414563) b!640147))

(assert (= (and b!640148 (not res!414571)) b!640138))

(declare-fun m!613479 () Bool)

(assert (=> b!640143 m!613479))

(assert (=> b!640143 m!613479))

(declare-fun m!613481 () Bool)

(assert (=> b!640143 m!613481))

(declare-fun m!613483 () Bool)

(assert (=> b!640140 m!613483))

(assert (=> b!640140 m!613479))

(assert (=> b!640140 m!613479))

(declare-fun m!613485 () Bool)

(assert (=> b!640140 m!613485))

(declare-fun m!613487 () Bool)

(assert (=> b!640139 m!613487))

(declare-fun m!613489 () Bool)

(assert (=> b!640139 m!613489))

(declare-fun m!613491 () Bool)

(assert (=> b!640135 m!613491))

(assert (=> b!640138 m!613479))

(declare-fun m!613493 () Bool)

(assert (=> b!640138 m!613493))

(declare-fun m!613495 () Bool)

(assert (=> b!640138 m!613495))

(declare-fun m!613497 () Bool)

(assert (=> b!640138 m!613497))

(declare-fun m!613499 () Bool)

(assert (=> b!640138 m!613499))

(assert (=> b!640138 m!613479))

(declare-fun m!613501 () Bool)

(assert (=> b!640138 m!613501))

(assert (=> b!640138 m!613479))

(declare-fun m!613503 () Bool)

(assert (=> b!640138 m!613503))

(declare-fun m!613505 () Bool)

(assert (=> b!640151 m!613505))

(assert (=> b!640147 m!613479))

(assert (=> b!640147 m!613479))

(declare-fun m!613507 () Bool)

(assert (=> b!640147 m!613507))

(declare-fun m!613509 () Bool)

(assert (=> b!640149 m!613509))

(declare-fun m!613511 () Bool)

(assert (=> start!57902 m!613511))

(declare-fun m!613513 () Bool)

(assert (=> start!57902 m!613513))

(declare-fun m!613515 () Bool)

(assert (=> b!640145 m!613515))

(assert (=> b!640148 m!613479))

(assert (=> b!640148 m!613487))

(declare-fun m!613517 () Bool)

(assert (=> b!640148 m!613517))

(assert (=> b!640136 m!613479))

(assert (=> b!640136 m!613479))

(declare-fun m!613519 () Bool)

(assert (=> b!640136 m!613519))

(declare-fun m!613521 () Bool)

(assert (=> b!640134 m!613521))

(assert (=> b!640150 m!613479))

(declare-fun m!613523 () Bool)

(assert (=> b!640142 m!613523))

(declare-fun m!613525 () Bool)

(assert (=> b!640137 m!613525))

(declare-fun m!613527 () Bool)

(assert (=> b!640137 m!613527))

(assert (=> b!640137 m!613487))

(declare-fun m!613529 () Bool)

(assert (=> b!640137 m!613529))

(declare-fun m!613531 () Bool)

(assert (=> b!640137 m!613531))

(declare-fun m!613533 () Bool)

(assert (=> b!640137 m!613533))

(assert (=> b!640137 m!613479))

(declare-fun m!613535 () Bool)

(assert (=> b!640137 m!613535))

(assert (=> b!640137 m!613479))

(check-sat (not b!640138) (not start!57902) (not b!640134) (not b!640136) (not b!640140) (not b!640147) (not b!640143) (not b!640137) (not b!640145) (not b!640151) (not b!640149) (not b!640142))
(check-sat)
