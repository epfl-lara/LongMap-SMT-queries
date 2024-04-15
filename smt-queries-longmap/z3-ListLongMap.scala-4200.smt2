; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57338 () Bool)

(assert start!57338)

(declare-fun b!634563 () Bool)

(declare-fun e!362874 () Bool)

(declare-fun e!362875 () Bool)

(assert (=> b!634563 (= e!362874 e!362875)))

(declare-fun res!410560 () Bool)

(assert (=> b!634563 (=> (not res!410560) (not e!362875))))

(declare-datatypes ((SeekEntryResult!6766 0))(
  ( (MissingZero!6766 (index!29366 (_ BitVec 32))) (Found!6766 (index!29367 (_ BitVec 32))) (Intermediate!6766 (undefined!7578 Bool) (index!29368 (_ BitVec 32)) (x!58119 (_ BitVec 32))) (Undefined!6766) (MissingVacant!6766 (index!29369 (_ BitVec 32))) )
))
(declare-fun lt!293264 () SeekEntryResult!6766)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!634563 (= res!410560 (or (= lt!293264 (MissingZero!6766 i!1108)) (= lt!293264 (MissingVacant!6766 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!38202 0))(
  ( (array!38203 (arr!18329 (Array (_ BitVec 32) (_ BitVec 64))) (size!18694 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38202)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38202 (_ BitVec 32)) SeekEntryResult!6766)

(assert (=> b!634563 (= lt!293264 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!634564 () Bool)

(declare-fun e!362877 () Bool)

(declare-fun e!362883 () Bool)

(assert (=> b!634564 (= e!362877 e!362883)))

(declare-fun res!410559 () Bool)

(assert (=> b!634564 (=> res!410559 e!362883)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!293257 () (_ BitVec 64))

(declare-fun lt!293262 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!634564 (= res!410559 (or (not (= (select (arr!18329 a!2986) j!136) lt!293262)) (not (= (select (arr!18329 a!2986) j!136) lt!293257)) (bvsge j!136 index!984)))))

(declare-fun b!634565 () Bool)

(declare-fun res!410555 () Bool)

(assert (=> b!634565 (=> (not res!410555) (not e!362875))))

(declare-datatypes ((List!12409 0))(
  ( (Nil!12406) (Cons!12405 (h!13450 (_ BitVec 64)) (t!18628 List!12409)) )
))
(declare-fun arrayNoDuplicates!0 (array!38202 (_ BitVec 32) List!12409) Bool)

(assert (=> b!634565 (= res!410555 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12406))))

(declare-fun b!634566 () Bool)

(declare-fun res!410558 () Bool)

(assert (=> b!634566 (=> (not res!410558) (not e!362874))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!634566 (= res!410558 (validKeyInArray!0 (select (arr!18329 a!2986) j!136)))))

(declare-fun b!634567 () Bool)

(declare-fun e!362878 () Bool)

(declare-fun e!362882 () Bool)

(assert (=> b!634567 (= e!362878 (not e!362882))))

(declare-fun res!410553 () Bool)

(assert (=> b!634567 (=> res!410553 e!362882)))

(declare-fun lt!293259 () SeekEntryResult!6766)

(assert (=> b!634567 (= res!410553 (not (= lt!293259 (Found!6766 index!984))))))

(declare-datatypes ((Unit!21392 0))(
  ( (Unit!21393) )
))
(declare-fun lt!293263 () Unit!21392)

(declare-fun e!362884 () Unit!21392)

(assert (=> b!634567 (= lt!293263 e!362884)))

(declare-fun c!72372 () Bool)

(assert (=> b!634567 (= c!72372 (= lt!293259 Undefined!6766))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!293256 () array!38202)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38202 (_ BitVec 32)) SeekEntryResult!6766)

(assert (=> b!634567 (= lt!293259 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!293262 lt!293256 mask!3053))))

(declare-fun e!362880 () Bool)

(assert (=> b!634567 e!362880))

(declare-fun res!410556 () Bool)

(assert (=> b!634567 (=> (not res!410556) (not e!362880))))

(declare-fun lt!293260 () SeekEntryResult!6766)

(declare-fun lt!293265 () (_ BitVec 32))

(assert (=> b!634567 (= res!410556 (= lt!293260 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293265 vacantSpotIndex!68 lt!293262 lt!293256 mask!3053)))))

(assert (=> b!634567 (= lt!293260 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293265 vacantSpotIndex!68 (select (arr!18329 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!634567 (= lt!293262 (select (store (arr!18329 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!293255 () Unit!21392)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38202 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21392)

(assert (=> b!634567 (= lt!293255 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!293265 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!634567 (= lt!293265 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!634568 () Bool)

(declare-fun res!410569 () Bool)

(assert (=> b!634568 (=> (not res!410569) (not e!362874))))

(assert (=> b!634568 (= res!410569 (and (= (size!18694 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18694 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18694 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!634569 () Bool)

(declare-fun e!362876 () Bool)

(assert (=> b!634569 (= e!362875 e!362876)))

(declare-fun res!410563 () Bool)

(assert (=> b!634569 (=> (not res!410563) (not e!362876))))

(assert (=> b!634569 (= res!410563 (= (select (store (arr!18329 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!634569 (= lt!293256 (array!38203 (store (arr!18329 a!2986) i!1108 k0!1786) (size!18694 a!2986)))))

(declare-fun b!634570 () Bool)

(declare-fun e!362879 () Bool)

(assert (=> b!634570 (= e!362879 true)))

(declare-fun arrayContainsKey!0 (array!38202 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!634570 (arrayContainsKey!0 lt!293256 (select (arr!18329 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!293261 () Unit!21392)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38202 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21392)

(assert (=> b!634570 (= lt!293261 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!293256 (select (arr!18329 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!634571 () Bool)

(declare-fun res!410566 () Bool)

(assert (=> b!634571 (=> (not res!410566) (not e!362875))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38202 (_ BitVec 32)) Bool)

(assert (=> b!634571 (= res!410566 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!634572 () Bool)

(declare-fun Unit!21394 () Unit!21392)

(assert (=> b!634572 (= e!362884 Unit!21394)))

(assert (=> b!634572 false))

(declare-fun b!634573 () Bool)

(declare-fun lt!293258 () SeekEntryResult!6766)

(assert (=> b!634573 (= e!362880 (= lt!293258 lt!293260))))

(declare-fun res!410568 () Bool)

(assert (=> start!57338 (=> (not res!410568) (not e!362874))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57338 (= res!410568 (validMask!0 mask!3053))))

(assert (=> start!57338 e!362874))

(assert (=> start!57338 true))

(declare-fun array_inv!14212 (array!38202) Bool)

(assert (=> start!57338 (array_inv!14212 a!2986)))

(declare-fun b!634574 () Bool)

(declare-fun e!362885 () Bool)

(assert (=> b!634574 (= e!362883 e!362885)))

(declare-fun res!410554 () Bool)

(assert (=> b!634574 (=> (not res!410554) (not e!362885))))

(assert (=> b!634574 (= res!410554 (arrayContainsKey!0 lt!293256 (select (arr!18329 a!2986) j!136) j!136))))

(declare-fun b!634575 () Bool)

(declare-fun Unit!21395 () Unit!21392)

(assert (=> b!634575 (= e!362884 Unit!21395)))

(declare-fun b!634576 () Bool)

(assert (=> b!634576 (= e!362882 e!362879)))

(declare-fun res!410561 () Bool)

(assert (=> b!634576 (=> res!410561 e!362879)))

(assert (=> b!634576 (= res!410561 (or (not (= (select (arr!18329 a!2986) j!136) lt!293262)) (not (= (select (arr!18329 a!2986) j!136) lt!293257)) (bvsge j!136 index!984)))))

(assert (=> b!634576 e!362877))

(declare-fun res!410564 () Bool)

(assert (=> b!634576 (=> (not res!410564) (not e!362877))))

(assert (=> b!634576 (= res!410564 (= lt!293257 (select (arr!18329 a!2986) j!136)))))

(assert (=> b!634576 (= lt!293257 (select (store (arr!18329 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!634577 () Bool)

(declare-fun res!410562 () Bool)

(assert (=> b!634577 (=> (not res!410562) (not e!362874))))

(assert (=> b!634577 (= res!410562 (validKeyInArray!0 k0!1786))))

(declare-fun b!634578 () Bool)

(declare-fun res!410567 () Bool)

(assert (=> b!634578 (=> (not res!410567) (not e!362874))))

(assert (=> b!634578 (= res!410567 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!634579 () Bool)

(assert (=> b!634579 (= e!362885 (arrayContainsKey!0 lt!293256 (select (arr!18329 a!2986) j!136) index!984))))

(declare-fun b!634580 () Bool)

(declare-fun res!410565 () Bool)

(assert (=> b!634580 (=> (not res!410565) (not e!362875))))

(assert (=> b!634580 (= res!410565 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18329 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!634581 () Bool)

(assert (=> b!634581 (= e!362876 e!362878)))

(declare-fun res!410557 () Bool)

(assert (=> b!634581 (=> (not res!410557) (not e!362878))))

(assert (=> b!634581 (= res!410557 (and (= lt!293258 (Found!6766 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18329 a!2986) index!984) (select (arr!18329 a!2986) j!136))) (not (= (select (arr!18329 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!634581 (= lt!293258 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18329 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!57338 res!410568) b!634568))

(assert (= (and b!634568 res!410569) b!634566))

(assert (= (and b!634566 res!410558) b!634577))

(assert (= (and b!634577 res!410562) b!634578))

(assert (= (and b!634578 res!410567) b!634563))

(assert (= (and b!634563 res!410560) b!634571))

(assert (= (and b!634571 res!410566) b!634565))

(assert (= (and b!634565 res!410555) b!634580))

(assert (= (and b!634580 res!410565) b!634569))

(assert (= (and b!634569 res!410563) b!634581))

(assert (= (and b!634581 res!410557) b!634567))

(assert (= (and b!634567 res!410556) b!634573))

(assert (= (and b!634567 c!72372) b!634572))

(assert (= (and b!634567 (not c!72372)) b!634575))

(assert (= (and b!634567 (not res!410553)) b!634576))

(assert (= (and b!634576 res!410564) b!634564))

(assert (= (and b!634564 (not res!410559)) b!634574))

(assert (= (and b!634574 res!410554) b!634579))

(assert (= (and b!634576 (not res!410561)) b!634570))

(declare-fun m!608511 () Bool)

(assert (=> b!634570 m!608511))

(assert (=> b!634570 m!608511))

(declare-fun m!608513 () Bool)

(assert (=> b!634570 m!608513))

(assert (=> b!634570 m!608511))

(declare-fun m!608515 () Bool)

(assert (=> b!634570 m!608515))

(declare-fun m!608517 () Bool)

(assert (=> start!57338 m!608517))

(declare-fun m!608519 () Bool)

(assert (=> start!57338 m!608519))

(declare-fun m!608521 () Bool)

(assert (=> b!634569 m!608521))

(declare-fun m!608523 () Bool)

(assert (=> b!634569 m!608523))

(declare-fun m!608525 () Bool)

(assert (=> b!634580 m!608525))

(declare-fun m!608527 () Bool)

(assert (=> b!634565 m!608527))

(declare-fun m!608529 () Bool)

(assert (=> b!634563 m!608529))

(assert (=> b!634576 m!608511))

(assert (=> b!634576 m!608521))

(declare-fun m!608531 () Bool)

(assert (=> b!634576 m!608531))

(assert (=> b!634579 m!608511))

(assert (=> b!634579 m!608511))

(declare-fun m!608533 () Bool)

(assert (=> b!634579 m!608533))

(declare-fun m!608535 () Bool)

(assert (=> b!634571 m!608535))

(declare-fun m!608537 () Bool)

(assert (=> b!634567 m!608537))

(declare-fun m!608539 () Bool)

(assert (=> b!634567 m!608539))

(declare-fun m!608541 () Bool)

(assert (=> b!634567 m!608541))

(assert (=> b!634567 m!608511))

(assert (=> b!634567 m!608521))

(declare-fun m!608543 () Bool)

(assert (=> b!634567 m!608543))

(declare-fun m!608545 () Bool)

(assert (=> b!634567 m!608545))

(assert (=> b!634567 m!608511))

(declare-fun m!608547 () Bool)

(assert (=> b!634567 m!608547))

(assert (=> b!634564 m!608511))

(declare-fun m!608549 () Bool)

(assert (=> b!634581 m!608549))

(assert (=> b!634581 m!608511))

(assert (=> b!634581 m!608511))

(declare-fun m!608551 () Bool)

(assert (=> b!634581 m!608551))

(declare-fun m!608553 () Bool)

(assert (=> b!634578 m!608553))

(assert (=> b!634574 m!608511))

(assert (=> b!634574 m!608511))

(declare-fun m!608555 () Bool)

(assert (=> b!634574 m!608555))

(declare-fun m!608557 () Bool)

(assert (=> b!634577 m!608557))

(assert (=> b!634566 m!608511))

(assert (=> b!634566 m!608511))

(declare-fun m!608559 () Bool)

(assert (=> b!634566 m!608559))

(check-sat (not b!634570) (not b!634578) (not b!634565) (not b!634567) (not start!57338) (not b!634566) (not b!634579) (not b!634571) (not b!634581) (not b!634577) (not b!634563) (not b!634574))
(check-sat)
