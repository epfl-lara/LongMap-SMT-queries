; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57820 () Bool)

(assert start!57820)

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!38322 0))(
  ( (array!38323 (arr!18382 (Array (_ BitVec 32) (_ BitVec 64))) (size!18746 (_ BitVec 32))) )
))
(declare-fun lt!295945 () array!38322)

(declare-fun b!639647 () Bool)

(declare-fun e!366093 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!38322)

(declare-fun arrayContainsKey!0 (array!38322 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!639647 (= e!366093 (arrayContainsKey!0 lt!295945 (select (arr!18382 a!2986) j!136) index!984))))

(declare-fun b!639648 () Bool)

(declare-fun e!366091 () Bool)

(declare-fun e!366098 () Bool)

(assert (=> b!639648 (= e!366091 (not e!366098))))

(declare-fun res!414177 () Bool)

(assert (=> b!639648 (=> res!414177 e!366098)))

(declare-datatypes ((SeekEntryResult!6822 0))(
  ( (MissingZero!6822 (index!29605 (_ BitVec 32))) (Found!6822 (index!29606 (_ BitVec 32))) (Intermediate!6822 (undefined!7634 Bool) (index!29607 (_ BitVec 32)) (x!58361 (_ BitVec 32))) (Undefined!6822) (MissingVacant!6822 (index!29608 (_ BitVec 32))) )
))
(declare-fun lt!295954 () SeekEntryResult!6822)

(assert (=> b!639648 (= res!414177 (not (= lt!295954 (Found!6822 index!984))))))

(declare-datatypes ((Unit!21622 0))(
  ( (Unit!21623) )
))
(declare-fun lt!295949 () Unit!21622)

(declare-fun e!366096 () Unit!21622)

(assert (=> b!639648 (= lt!295949 e!366096)))

(declare-fun c!73106 () Bool)

(assert (=> b!639648 (= c!73106 (= lt!295954 Undefined!6822))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun lt!295947 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38322 (_ BitVec 32)) SeekEntryResult!6822)

(assert (=> b!639648 (= lt!295954 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!295947 lt!295945 mask!3053))))

(declare-fun e!366100 () Bool)

(assert (=> b!639648 e!366100))

(declare-fun res!414169 () Bool)

(assert (=> b!639648 (=> (not res!414169) (not e!366100))))

(declare-fun lt!295944 () (_ BitVec 32))

(declare-fun lt!295948 () SeekEntryResult!6822)

(assert (=> b!639648 (= res!414169 (= lt!295948 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295944 vacantSpotIndex!68 lt!295947 lt!295945 mask!3053)))))

(assert (=> b!639648 (= lt!295948 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295944 vacantSpotIndex!68 (select (arr!18382 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!639648 (= lt!295947 (select (store (arr!18382 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!295946 () Unit!21622)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38322 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21622)

(assert (=> b!639648 (= lt!295946 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!295944 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!639648 (= lt!295944 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!639649 () Bool)

(declare-fun res!414179 () Bool)

(declare-fun e!366099 () Bool)

(assert (=> b!639649 (=> (not res!414179) (not e!366099))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38322 (_ BitVec 32)) Bool)

(assert (=> b!639649 (= res!414179 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!639650 () Bool)

(declare-fun res!414181 () Bool)

(assert (=> b!639650 (=> (not res!414181) (not e!366099))))

(assert (=> b!639650 (= res!414181 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18382 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!639651 () Bool)

(declare-fun res!414170 () Bool)

(declare-fun e!366102 () Bool)

(assert (=> b!639651 (=> (not res!414170) (not e!366102))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!639651 (= res!414170 (validKeyInArray!0 (select (arr!18382 a!2986) j!136)))))

(declare-fun b!639652 () Bool)

(declare-fun e!366101 () Bool)

(assert (=> b!639652 (= e!366099 e!366101)))

(declare-fun res!414172 () Bool)

(assert (=> b!639652 (=> (not res!414172) (not e!366101))))

(assert (=> b!639652 (= res!414172 (= (select (store (arr!18382 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!639652 (= lt!295945 (array!38323 (store (arr!18382 a!2986) i!1108 k0!1786) (size!18746 a!2986)))))

(declare-fun b!639653 () Bool)

(assert (=> b!639653 (= e!366101 e!366091)))

(declare-fun res!414183 () Bool)

(assert (=> b!639653 (=> (not res!414183) (not e!366091))))

(declare-fun lt!295943 () SeekEntryResult!6822)

(assert (=> b!639653 (= res!414183 (and (= lt!295943 (Found!6822 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18382 a!2986) index!984) (select (arr!18382 a!2986) j!136))) (not (= (select (arr!18382 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!639653 (= lt!295943 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18382 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!639654 () Bool)

(declare-fun res!414182 () Bool)

(assert (=> b!639654 (=> (not res!414182) (not e!366099))))

(declare-datatypes ((List!12423 0))(
  ( (Nil!12420) (Cons!12419 (h!13464 (_ BitVec 64)) (t!18651 List!12423)) )
))
(declare-fun arrayNoDuplicates!0 (array!38322 (_ BitVec 32) List!12423) Bool)

(assert (=> b!639654 (= res!414182 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12420))))

(declare-fun b!639655 () Bool)

(assert (=> b!639655 (= e!366100 (= lt!295943 lt!295948))))

(declare-fun b!639656 () Bool)

(declare-fun e!366092 () Bool)

(assert (=> b!639656 (= e!366092 e!366093)))

(declare-fun res!414180 () Bool)

(assert (=> b!639656 (=> (not res!414180) (not e!366093))))

(assert (=> b!639656 (= res!414180 (arrayContainsKey!0 lt!295945 (select (arr!18382 a!2986) j!136) j!136))))

(declare-fun b!639657 () Bool)

(declare-fun e!366097 () Bool)

(assert (=> b!639657 (= e!366097 true)))

(assert (=> b!639657 (arrayNoDuplicates!0 lt!295945 #b00000000000000000000000000000000 Nil!12420)))

(declare-fun lt!295950 () Unit!21622)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38322 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12423) Unit!21622)

(assert (=> b!639657 (= lt!295950 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12420))))

(assert (=> b!639657 (arrayContainsKey!0 lt!295945 (select (arr!18382 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!295953 () Unit!21622)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38322 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21622)

(assert (=> b!639657 (= lt!295953 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!295945 (select (arr!18382 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!639658 () Bool)

(declare-fun res!414173 () Bool)

(assert (=> b!639658 (=> (not res!414173) (not e!366102))))

(assert (=> b!639658 (= res!414173 (validKeyInArray!0 k0!1786))))

(declare-fun b!639659 () Bool)

(declare-fun Unit!21624 () Unit!21622)

(assert (=> b!639659 (= e!366096 Unit!21624)))

(declare-fun b!639660 () Bool)

(declare-fun e!366095 () Bool)

(assert (=> b!639660 (= e!366095 e!366092)))

(declare-fun res!414171 () Bool)

(assert (=> b!639660 (=> res!414171 e!366092)))

(declare-fun lt!295951 () (_ BitVec 64))

(assert (=> b!639660 (= res!414171 (or (not (= (select (arr!18382 a!2986) j!136) lt!295947)) (not (= (select (arr!18382 a!2986) j!136) lt!295951)) (bvsge j!136 index!984)))))

(declare-fun b!639661 () Bool)

(declare-fun Unit!21625 () Unit!21622)

(assert (=> b!639661 (= e!366096 Unit!21625)))

(assert (=> b!639661 false))

(declare-fun res!414178 () Bool)

(assert (=> start!57820 (=> (not res!414178) (not e!366102))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57820 (= res!414178 (validMask!0 mask!3053))))

(assert (=> start!57820 e!366102))

(assert (=> start!57820 true))

(declare-fun array_inv!14178 (array!38322) Bool)

(assert (=> start!57820 (array_inv!14178 a!2986)))

(declare-fun b!639662 () Bool)

(declare-fun res!414176 () Bool)

(assert (=> b!639662 (=> (not res!414176) (not e!366102))))

(assert (=> b!639662 (= res!414176 (and (= (size!18746 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18746 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18746 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!639663 () Bool)

(assert (=> b!639663 (= e!366102 e!366099)))

(declare-fun res!414184 () Bool)

(assert (=> b!639663 (=> (not res!414184) (not e!366099))))

(declare-fun lt!295952 () SeekEntryResult!6822)

(assert (=> b!639663 (= res!414184 (or (= lt!295952 (MissingZero!6822 i!1108)) (= lt!295952 (MissingVacant!6822 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38322 (_ BitVec 32)) SeekEntryResult!6822)

(assert (=> b!639663 (= lt!295952 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!639664 () Bool)

(assert (=> b!639664 (= e!366098 e!366097)))

(declare-fun res!414175 () Bool)

(assert (=> b!639664 (=> res!414175 e!366097)))

(assert (=> b!639664 (= res!414175 (or (not (= (select (arr!18382 a!2986) j!136) lt!295947)) (not (= (select (arr!18382 a!2986) j!136) lt!295951)) (bvsge j!136 index!984)))))

(assert (=> b!639664 e!366095))

(declare-fun res!414185 () Bool)

(assert (=> b!639664 (=> (not res!414185) (not e!366095))))

(assert (=> b!639664 (= res!414185 (= lt!295951 (select (arr!18382 a!2986) j!136)))))

(assert (=> b!639664 (= lt!295951 (select (store (arr!18382 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!639665 () Bool)

(declare-fun res!414174 () Bool)

(assert (=> b!639665 (=> (not res!414174) (not e!366102))))

(assert (=> b!639665 (= res!414174 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!57820 res!414178) b!639662))

(assert (= (and b!639662 res!414176) b!639651))

(assert (= (and b!639651 res!414170) b!639658))

(assert (= (and b!639658 res!414173) b!639665))

(assert (= (and b!639665 res!414174) b!639663))

(assert (= (and b!639663 res!414184) b!639649))

(assert (= (and b!639649 res!414179) b!639654))

(assert (= (and b!639654 res!414182) b!639650))

(assert (= (and b!639650 res!414181) b!639652))

(assert (= (and b!639652 res!414172) b!639653))

(assert (= (and b!639653 res!414183) b!639648))

(assert (= (and b!639648 res!414169) b!639655))

(assert (= (and b!639648 c!73106) b!639661))

(assert (= (and b!639648 (not c!73106)) b!639659))

(assert (= (and b!639648 (not res!414177)) b!639664))

(assert (= (and b!639664 res!414185) b!639660))

(assert (= (and b!639660 (not res!414171)) b!639656))

(assert (= (and b!639656 res!414180) b!639647))

(assert (= (and b!639664 (not res!414175)) b!639657))

(declare-fun m!613499 () Bool)

(assert (=> b!639649 m!613499))

(declare-fun m!613501 () Bool)

(assert (=> b!639647 m!613501))

(assert (=> b!639647 m!613501))

(declare-fun m!613503 () Bool)

(assert (=> b!639647 m!613503))

(assert (=> b!639660 m!613501))

(declare-fun m!613505 () Bool)

(assert (=> b!639665 m!613505))

(declare-fun m!613507 () Bool)

(assert (=> b!639654 m!613507))

(declare-fun m!613509 () Bool)

(assert (=> b!639652 m!613509))

(declare-fun m!613511 () Bool)

(assert (=> b!639652 m!613511))

(assert (=> b!639651 m!613501))

(assert (=> b!639651 m!613501))

(declare-fun m!613513 () Bool)

(assert (=> b!639651 m!613513))

(declare-fun m!613515 () Bool)

(assert (=> b!639657 m!613515))

(assert (=> b!639657 m!613501))

(assert (=> b!639657 m!613501))

(declare-fun m!613517 () Bool)

(assert (=> b!639657 m!613517))

(assert (=> b!639657 m!613501))

(declare-fun m!613519 () Bool)

(assert (=> b!639657 m!613519))

(declare-fun m!613521 () Bool)

(assert (=> b!639657 m!613521))

(declare-fun m!613523 () Bool)

(assert (=> b!639648 m!613523))

(assert (=> b!639648 m!613501))

(assert (=> b!639648 m!613509))

(declare-fun m!613525 () Bool)

(assert (=> b!639648 m!613525))

(assert (=> b!639648 m!613501))

(declare-fun m!613527 () Bool)

(assert (=> b!639648 m!613527))

(declare-fun m!613529 () Bool)

(assert (=> b!639648 m!613529))

(declare-fun m!613531 () Bool)

(assert (=> b!639648 m!613531))

(declare-fun m!613533 () Bool)

(assert (=> b!639648 m!613533))

(declare-fun m!613535 () Bool)

(assert (=> b!639658 m!613535))

(assert (=> b!639656 m!613501))

(assert (=> b!639656 m!613501))

(declare-fun m!613537 () Bool)

(assert (=> b!639656 m!613537))

(declare-fun m!613539 () Bool)

(assert (=> start!57820 m!613539))

(declare-fun m!613541 () Bool)

(assert (=> start!57820 m!613541))

(declare-fun m!613543 () Bool)

(assert (=> b!639663 m!613543))

(declare-fun m!613545 () Bool)

(assert (=> b!639653 m!613545))

(assert (=> b!639653 m!613501))

(assert (=> b!639653 m!613501))

(declare-fun m!613547 () Bool)

(assert (=> b!639653 m!613547))

(assert (=> b!639664 m!613501))

(assert (=> b!639664 m!613509))

(declare-fun m!613549 () Bool)

(assert (=> b!639664 m!613549))

(declare-fun m!613551 () Bool)

(assert (=> b!639650 m!613551))

(check-sat (not b!639657) (not b!639665) (not b!639658) (not b!639654) (not start!57820) (not b!639653) (not b!639651) (not b!639663) (not b!639656) (not b!639647) (not b!639648) (not b!639649))
(check-sat)
