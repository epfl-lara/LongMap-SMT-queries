; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54522 () Bool)

(assert start!54522)

(declare-fun b!595659 () Bool)

(declare-fun res!381644 () Bool)

(declare-fun e!340308 () Bool)

(assert (=> b!595659 (=> res!381644 e!340308)))

(declare-datatypes ((List!11842 0))(
  ( (Nil!11839) (Cons!11838 (h!12883 (_ BitVec 64)) (t!18061 List!11842)) )
))
(declare-fun contains!2926 (List!11842 (_ BitVec 64)) Bool)

(assert (=> b!595659 (= res!381644 (contains!2926 Nil!11839 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!595660 () Bool)

(declare-fun res!381646 () Bool)

(assert (=> b!595660 (=> res!381646 e!340308)))

(declare-fun noDuplicate!263 (List!11842) Bool)

(assert (=> b!595660 (= res!381646 (not (noDuplicate!263 Nil!11839)))))

(declare-fun b!595661 () Bool)

(declare-fun res!381643 () Bool)

(declare-fun e!340305 () Bool)

(assert (=> b!595661 (=> (not res!381643) (not e!340305))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36996 0))(
  ( (array!36997 (arr!17762 (Array (_ BitVec 32) (_ BitVec 64))) (size!18127 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36996)

(assert (=> b!595661 (= res!381643 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17762 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!595662 () Bool)

(declare-fun res!381642 () Bool)

(declare-fun e!340312 () Bool)

(assert (=> b!595662 (=> (not res!381642) (not e!340312))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!595662 (= res!381642 (validKeyInArray!0 k0!1786))))

(declare-fun res!381645 () Bool)

(assert (=> start!54522 (=> (not res!381645) (not e!340312))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54522 (= res!381645 (validMask!0 mask!3053))))

(assert (=> start!54522 e!340312))

(assert (=> start!54522 true))

(declare-fun array_inv!13645 (array!36996) Bool)

(assert (=> start!54522 (array_inv!13645 a!2986)))

(declare-fun b!595663 () Bool)

(declare-fun e!340309 () Bool)

(declare-fun e!340311 () Bool)

(assert (=> b!595663 (= e!340309 e!340311)))

(declare-fun res!381647 () Bool)

(assert (=> b!595663 (=> (not res!381647) (not e!340311))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6199 0))(
  ( (MissingZero!6199 (index!27044 (_ BitVec 32))) (Found!6199 (index!27045 (_ BitVec 32))) (Intermediate!6199 (undefined!7011 Bool) (index!27046 (_ BitVec 32)) (x!55854 (_ BitVec 32))) (Undefined!6199) (MissingVacant!6199 (index!27047 (_ BitVec 32))) )
))
(declare-fun lt!270396 () SeekEntryResult!6199)

(assert (=> b!595663 (= res!381647 (and (= lt!270396 (Found!6199 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17762 a!2986) index!984) (select (arr!17762 a!2986) j!136))) (not (= (select (arr!17762 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36996 (_ BitVec 32)) SeekEntryResult!6199)

(assert (=> b!595663 (= lt!270396 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17762 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!595664 () Bool)

(assert (=> b!595664 (= e!340312 e!340305)))

(declare-fun res!381637 () Bool)

(assert (=> b!595664 (=> (not res!381637) (not e!340305))))

(declare-fun lt!270400 () SeekEntryResult!6199)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!595664 (= res!381637 (or (= lt!270400 (MissingZero!6199 i!1108)) (= lt!270400 (MissingVacant!6199 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36996 (_ BitVec 32)) SeekEntryResult!6199)

(assert (=> b!595664 (= lt!270400 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!595665 () Bool)

(declare-fun e!340317 () Bool)

(declare-fun lt!270395 () SeekEntryResult!6199)

(assert (=> b!595665 (= e!340317 (= lt!270396 lt!270395))))

(declare-fun b!595666 () Bool)

(declare-fun e!340310 () Bool)

(declare-fun lt!270393 () array!36996)

(declare-fun arrayContainsKey!0 (array!36996 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!595666 (= e!340310 (arrayContainsKey!0 lt!270393 (select (arr!17762 a!2986) j!136) index!984))))

(declare-fun b!595667 () Bool)

(declare-datatypes ((Unit!18708 0))(
  ( (Unit!18709) )
))
(declare-fun e!340306 () Unit!18708)

(declare-fun Unit!18710 () Unit!18708)

(assert (=> b!595667 (= e!340306 Unit!18710)))

(assert (=> b!595667 false))

(declare-fun b!595668 () Bool)

(assert (=> b!595668 (= e!340308 true)))

(declare-fun lt!270397 () Bool)

(assert (=> b!595668 (= lt!270397 (contains!2926 Nil!11839 k0!1786))))

(declare-fun b!595669 () Bool)

(declare-fun e!340315 () Bool)

(assert (=> b!595669 (= e!340315 e!340310)))

(declare-fun res!381640 () Bool)

(assert (=> b!595669 (=> (not res!381640) (not e!340310))))

(assert (=> b!595669 (= res!381640 (arrayContainsKey!0 lt!270393 (select (arr!17762 a!2986) j!136) j!136))))

(declare-fun b!595670 () Bool)

(declare-fun res!381648 () Bool)

(assert (=> b!595670 (=> (not res!381648) (not e!340312))))

(assert (=> b!595670 (= res!381648 (validKeyInArray!0 (select (arr!17762 a!2986) j!136)))))

(declare-fun b!595671 () Bool)

(declare-fun res!381639 () Bool)

(assert (=> b!595671 (=> (not res!381639) (not e!340312))))

(assert (=> b!595671 (= res!381639 (and (= (size!18127 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18127 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18127 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!595672 () Bool)

(declare-fun e!340316 () Bool)

(assert (=> b!595672 (= e!340316 e!340315)))

(declare-fun res!381633 () Bool)

(assert (=> b!595672 (=> res!381633 e!340315)))

(declare-fun lt!270399 () (_ BitVec 64))

(declare-fun lt!270398 () (_ BitVec 64))

(assert (=> b!595672 (= res!381633 (or (not (= (select (arr!17762 a!2986) j!136) lt!270399)) (not (= (select (arr!17762 a!2986) j!136) lt!270398)) (bvsge j!136 index!984)))))

(declare-fun b!595673 () Bool)

(assert (=> b!595673 (= e!340305 e!340309)))

(declare-fun res!381650 () Bool)

(assert (=> b!595673 (=> (not res!381650) (not e!340309))))

(assert (=> b!595673 (= res!381650 (= (select (store (arr!17762 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!595673 (= lt!270393 (array!36997 (store (arr!17762 a!2986) i!1108 k0!1786) (size!18127 a!2986)))))

(declare-fun b!595674 () Bool)

(declare-fun res!381652 () Bool)

(assert (=> b!595674 (=> (not res!381652) (not e!340312))))

(assert (=> b!595674 (= res!381652 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!595675 () Bool)

(declare-fun e!340314 () Bool)

(assert (=> b!595675 (= e!340311 (not e!340314))))

(declare-fun res!381634 () Bool)

(assert (=> b!595675 (=> res!381634 e!340314)))

(declare-fun lt!270401 () SeekEntryResult!6199)

(assert (=> b!595675 (= res!381634 (not (= lt!270401 (Found!6199 index!984))))))

(declare-fun lt!270392 () Unit!18708)

(assert (=> b!595675 (= lt!270392 e!340306)))

(declare-fun c!67380 () Bool)

(assert (=> b!595675 (= c!67380 (= lt!270401 Undefined!6199))))

(assert (=> b!595675 (= lt!270401 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!270399 lt!270393 mask!3053))))

(assert (=> b!595675 e!340317))

(declare-fun res!381651 () Bool)

(assert (=> b!595675 (=> (not res!381651) (not e!340317))))

(declare-fun lt!270402 () (_ BitVec 32))

(assert (=> b!595675 (= res!381651 (= lt!270395 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270402 vacantSpotIndex!68 lt!270399 lt!270393 mask!3053)))))

(assert (=> b!595675 (= lt!270395 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270402 vacantSpotIndex!68 (select (arr!17762 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!595675 (= lt!270399 (select (store (arr!17762 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!270403 () Unit!18708)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36996 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18708)

(assert (=> b!595675 (= lt!270403 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!270402 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!595675 (= lt!270402 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!595676 () Bool)

(declare-fun e!340307 () Bool)

(assert (=> b!595676 (= e!340314 e!340307)))

(declare-fun res!381636 () Bool)

(assert (=> b!595676 (=> res!381636 e!340307)))

(assert (=> b!595676 (= res!381636 (or (not (= (select (arr!17762 a!2986) j!136) lt!270399)) (not (= (select (arr!17762 a!2986) j!136) lt!270398)) (bvsge j!136 index!984)))))

(assert (=> b!595676 e!340316))

(declare-fun res!381649 () Bool)

(assert (=> b!595676 (=> (not res!381649) (not e!340316))))

(assert (=> b!595676 (= res!381649 (= lt!270398 (select (arr!17762 a!2986) j!136)))))

(assert (=> b!595676 (= lt!270398 (select (store (arr!17762 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!595677 () Bool)

(declare-fun res!381638 () Bool)

(assert (=> b!595677 (=> (not res!381638) (not e!340305))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36996 (_ BitVec 32)) Bool)

(assert (=> b!595677 (= res!381638 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!595678 () Bool)

(declare-fun res!381653 () Bool)

(assert (=> b!595678 (=> (not res!381653) (not e!340305))))

(declare-fun arrayNoDuplicates!0 (array!36996 (_ BitVec 32) List!11842) Bool)

(assert (=> b!595678 (= res!381653 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11839))))

(declare-fun b!595679 () Bool)

(assert (=> b!595679 (= e!340307 e!340308)))

(declare-fun res!381641 () Bool)

(assert (=> b!595679 (=> res!381641 e!340308)))

(assert (=> b!595679 (= res!381641 (or (bvsge (size!18127 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18127 a!2986))))))

(assert (=> b!595679 (arrayContainsKey!0 lt!270393 (select (arr!17762 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!270394 () Unit!18708)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36996 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18708)

(assert (=> b!595679 (= lt!270394 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!270393 (select (arr!17762 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!595680 () Bool)

(declare-fun res!381635 () Bool)

(assert (=> b!595680 (=> res!381635 e!340308)))

(assert (=> b!595680 (= res!381635 (contains!2926 Nil!11839 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!595681 () Bool)

(declare-fun Unit!18711 () Unit!18708)

(assert (=> b!595681 (= e!340306 Unit!18711)))

(assert (= (and start!54522 res!381645) b!595671))

(assert (= (and b!595671 res!381639) b!595670))

(assert (= (and b!595670 res!381648) b!595662))

(assert (= (and b!595662 res!381642) b!595674))

(assert (= (and b!595674 res!381652) b!595664))

(assert (= (and b!595664 res!381637) b!595677))

(assert (= (and b!595677 res!381638) b!595678))

(assert (= (and b!595678 res!381653) b!595661))

(assert (= (and b!595661 res!381643) b!595673))

(assert (= (and b!595673 res!381650) b!595663))

(assert (= (and b!595663 res!381647) b!595675))

(assert (= (and b!595675 res!381651) b!595665))

(assert (= (and b!595675 c!67380) b!595667))

(assert (= (and b!595675 (not c!67380)) b!595681))

(assert (= (and b!595675 (not res!381634)) b!595676))

(assert (= (and b!595676 res!381649) b!595672))

(assert (= (and b!595672 (not res!381633)) b!595669))

(assert (= (and b!595669 res!381640) b!595666))

(assert (= (and b!595676 (not res!381636)) b!595679))

(assert (= (and b!595679 (not res!381641)) b!595660))

(assert (= (and b!595660 (not res!381646)) b!595680))

(assert (= (and b!595680 (not res!381635)) b!595659))

(assert (= (and b!595659 (not res!381644)) b!595668))

(declare-fun m!572731 () Bool)

(assert (=> b!595680 m!572731))

(declare-fun m!572733 () Bool)

(assert (=> b!595678 m!572733))

(declare-fun m!572735 () Bool)

(assert (=> b!595660 m!572735))

(declare-fun m!572737 () Bool)

(assert (=> start!54522 m!572737))

(declare-fun m!572739 () Bool)

(assert (=> start!54522 m!572739))

(declare-fun m!572741 () Bool)

(assert (=> b!595664 m!572741))

(declare-fun m!572743 () Bool)

(assert (=> b!595662 m!572743))

(declare-fun m!572745 () Bool)

(assert (=> b!595659 m!572745))

(declare-fun m!572747 () Bool)

(assert (=> b!595663 m!572747))

(declare-fun m!572749 () Bool)

(assert (=> b!595663 m!572749))

(assert (=> b!595663 m!572749))

(declare-fun m!572751 () Bool)

(assert (=> b!595663 m!572751))

(declare-fun m!572753 () Bool)

(assert (=> b!595674 m!572753))

(declare-fun m!572755 () Bool)

(assert (=> b!595673 m!572755))

(declare-fun m!572757 () Bool)

(assert (=> b!595673 m!572757))

(assert (=> b!595672 m!572749))

(declare-fun m!572759 () Bool)

(assert (=> b!595675 m!572759))

(declare-fun m!572761 () Bool)

(assert (=> b!595675 m!572761))

(declare-fun m!572763 () Bool)

(assert (=> b!595675 m!572763))

(assert (=> b!595675 m!572749))

(declare-fun m!572765 () Bool)

(assert (=> b!595675 m!572765))

(assert (=> b!595675 m!572749))

(assert (=> b!595675 m!572755))

(declare-fun m!572767 () Bool)

(assert (=> b!595675 m!572767))

(declare-fun m!572769 () Bool)

(assert (=> b!595675 m!572769))

(declare-fun m!572771 () Bool)

(assert (=> b!595668 m!572771))

(assert (=> b!595679 m!572749))

(assert (=> b!595679 m!572749))

(declare-fun m!572773 () Bool)

(assert (=> b!595679 m!572773))

(assert (=> b!595679 m!572749))

(declare-fun m!572775 () Bool)

(assert (=> b!595679 m!572775))

(assert (=> b!595676 m!572749))

(assert (=> b!595676 m!572755))

(declare-fun m!572777 () Bool)

(assert (=> b!595676 m!572777))

(assert (=> b!595666 m!572749))

(assert (=> b!595666 m!572749))

(declare-fun m!572779 () Bool)

(assert (=> b!595666 m!572779))

(declare-fun m!572781 () Bool)

(assert (=> b!595677 m!572781))

(assert (=> b!595670 m!572749))

(assert (=> b!595670 m!572749))

(declare-fun m!572783 () Bool)

(assert (=> b!595670 m!572783))

(declare-fun m!572785 () Bool)

(assert (=> b!595661 m!572785))

(assert (=> b!595669 m!572749))

(assert (=> b!595669 m!572749))

(declare-fun m!572787 () Bool)

(assert (=> b!595669 m!572787))

(check-sat (not b!595662) (not b!595680) (not b!595677) (not b!595660) (not start!54522) (not b!595666) (not b!595675) (not b!595678) (not b!595668) (not b!595679) (not b!595674) (not b!595659) (not b!595664) (not b!595663) (not b!595670) (not b!595669))
(check-sat)
