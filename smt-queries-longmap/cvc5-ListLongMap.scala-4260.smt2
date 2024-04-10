; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59114 () Bool)

(assert start!59114)

(declare-fun b!652572 () Bool)

(declare-fun e!374568 () Bool)

(declare-datatypes ((List!12551 0))(
  ( (Nil!12548) (Cons!12547 (h!13592 (_ BitVec 64)) (t!18779 List!12551)) )
))
(declare-fun noDuplicate!435 (List!12551) Bool)

(assert (=> b!652572 (= e!374568 (noDuplicate!435 Nil!12548))))

(declare-fun b!652573 () Bool)

(declare-fun e!374566 () Bool)

(assert (=> b!652573 (= e!374566 e!374568)))

(declare-fun res!423223 () Bool)

(assert (=> b!652573 (=> res!423223 e!374568)))

(declare-datatypes ((array!38614 0))(
  ( (array!38615 (arr!18510 (Array (_ BitVec 32) (_ BitVec 64))) (size!18874 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38614)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!652573 (= res!423223 (or (bvsge (size!18874 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 index!984) (size!18874 a!2986)) (bvsge index!984 (size!18874 a!2986))))))

(declare-fun lt!303724 () array!38614)

(declare-fun arrayNoDuplicates!0 (array!38614 (_ BitVec 32) List!12551) Bool)

(assert (=> b!652573 (arrayNoDuplicates!0 lt!303724 index!984 Nil!12548)))

(declare-datatypes ((Unit!22326 0))(
  ( (Unit!22327) )
))
(declare-fun lt!303712 () Unit!22326)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38614 (_ BitVec 32) (_ BitVec 32)) Unit!22326)

(assert (=> b!652573 (= lt!303712 (lemmaNoDuplicateFromThenFromBigger!0 lt!303724 #b00000000000000000000000000000000 index!984))))

(assert (=> b!652573 (arrayNoDuplicates!0 lt!303724 #b00000000000000000000000000000000 Nil!12548)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun lt!303714 () Unit!22326)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38614 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12551) Unit!22326)

(assert (=> b!652573 (= lt!303714 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12548))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!38614 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!652573 (arrayContainsKey!0 lt!303724 (select (arr!18510 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!303725 () Unit!22326)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38614 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22326)

(assert (=> b!652573 (= lt!303725 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!303724 (select (arr!18510 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!374570 () Bool)

(assert (=> b!652573 e!374570))

(declare-fun res!423221 () Bool)

(assert (=> b!652573 (=> (not res!423221) (not e!374570))))

(assert (=> b!652573 (= res!423221 (arrayContainsKey!0 lt!303724 (select (arr!18510 a!2986) j!136) j!136))))

(declare-fun b!652574 () Bool)

(declare-fun res!423239 () Bool)

(declare-fun e!374571 () Bool)

(assert (=> b!652574 (=> (not res!423239) (not e!374571))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!652574 (= res!423239 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18510 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!423236 () Bool)

(declare-fun e!374565 () Bool)

(assert (=> start!59114 (=> (not res!423236) (not e!374565))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59114 (= res!423236 (validMask!0 mask!3053))))

(assert (=> start!59114 e!374565))

(assert (=> start!59114 true))

(declare-fun array_inv!14306 (array!38614) Bool)

(assert (=> start!59114 (array_inv!14306 a!2986)))

(declare-fun b!652575 () Bool)

(declare-fun e!374564 () Bool)

(declare-fun e!374567 () Bool)

(assert (=> b!652575 (= e!374564 e!374567)))

(declare-fun res!423227 () Bool)

(assert (=> b!652575 (=> res!423227 e!374567)))

(declare-fun lt!303719 () (_ BitVec 64))

(declare-fun lt!303711 () (_ BitVec 64))

(assert (=> b!652575 (= res!423227 (or (not (= (select (arr!18510 a!2986) j!136) lt!303719)) (not (= (select (arr!18510 a!2986) j!136) lt!303711)) (bvsge j!136 index!984)))))

(declare-fun b!652576 () Bool)

(declare-fun e!374562 () Bool)

(declare-fun e!374574 () Bool)

(assert (=> b!652576 (= e!374562 (not e!374574))))

(declare-fun res!423229 () Bool)

(assert (=> b!652576 (=> res!423229 e!374574)))

(declare-datatypes ((SeekEntryResult!6950 0))(
  ( (MissingZero!6950 (index!30153 (_ BitVec 32))) (Found!6950 (index!30154 (_ BitVec 32))) (Intermediate!6950 (undefined!7762 Bool) (index!30155 (_ BitVec 32)) (x!58941 (_ BitVec 32))) (Undefined!6950) (MissingVacant!6950 (index!30156 (_ BitVec 32))) )
))
(declare-fun lt!303717 () SeekEntryResult!6950)

(assert (=> b!652576 (= res!423229 (not (= lt!303717 (Found!6950 index!984))))))

(declare-fun lt!303720 () Unit!22326)

(declare-fun e!374559 () Unit!22326)

(assert (=> b!652576 (= lt!303720 e!374559)))

(declare-fun c!75044 () Bool)

(assert (=> b!652576 (= c!75044 (= lt!303717 Undefined!6950))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38614 (_ BitVec 32)) SeekEntryResult!6950)

(assert (=> b!652576 (= lt!303717 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!303719 lt!303724 mask!3053))))

(declare-fun e!374561 () Bool)

(assert (=> b!652576 e!374561))

(declare-fun res!423233 () Bool)

(assert (=> b!652576 (=> (not res!423233) (not e!374561))))

(declare-fun lt!303721 () (_ BitVec 32))

(declare-fun lt!303713 () SeekEntryResult!6950)

(assert (=> b!652576 (= res!423233 (= lt!303713 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303721 vacantSpotIndex!68 lt!303719 lt!303724 mask!3053)))))

(assert (=> b!652576 (= lt!303713 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303721 vacantSpotIndex!68 (select (arr!18510 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!652576 (= lt!303719 (select (store (arr!18510 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!303722 () Unit!22326)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38614 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22326)

(assert (=> b!652576 (= lt!303722 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!303721 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!652576 (= lt!303721 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!652577 () Bool)

(declare-fun e!374560 () Bool)

(assert (=> b!652577 (= e!374574 e!374560)))

(declare-fun res!423232 () Bool)

(assert (=> b!652577 (=> res!423232 e!374560)))

(assert (=> b!652577 (= res!423232 (or (not (= (select (arr!18510 a!2986) j!136) lt!303719)) (not (= (select (arr!18510 a!2986) j!136) lt!303711))))))

(assert (=> b!652577 e!374564))

(declare-fun res!423231 () Bool)

(assert (=> b!652577 (=> (not res!423231) (not e!374564))))

(assert (=> b!652577 (= res!423231 (= lt!303711 (select (arr!18510 a!2986) j!136)))))

(assert (=> b!652577 (= lt!303711 (select (store (arr!18510 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!652578 () Bool)

(declare-fun res!423222 () Bool)

(assert (=> b!652578 (=> (not res!423222) (not e!374571))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38614 (_ BitVec 32)) Bool)

(assert (=> b!652578 (= res!423222 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!652579 () Bool)

(declare-fun res!423228 () Bool)

(assert (=> b!652579 (=> (not res!423228) (not e!374565))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!652579 (= res!423228 (validKeyInArray!0 (select (arr!18510 a!2986) j!136)))))

(declare-fun b!652580 () Bool)

(declare-fun e!374563 () Unit!22326)

(declare-fun Unit!22328 () Unit!22326)

(assert (=> b!652580 (= e!374563 Unit!22328)))

(declare-fun lt!303723 () Unit!22326)

(assert (=> b!652580 (= lt!303723 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!303724 (select (arr!18510 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!652580 (arrayContainsKey!0 lt!303724 (select (arr!18510 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!303718 () Unit!22326)

(assert (=> b!652580 (= lt!303718 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12548))))

(assert (=> b!652580 (arrayNoDuplicates!0 lt!303724 #b00000000000000000000000000000000 Nil!12548)))

(declare-fun lt!303727 () Unit!22326)

(assert (=> b!652580 (= lt!303727 (lemmaNoDuplicateFromThenFromBigger!0 lt!303724 #b00000000000000000000000000000000 j!136))))

(assert (=> b!652580 (arrayNoDuplicates!0 lt!303724 j!136 Nil!12548)))

(declare-fun lt!303710 () Unit!22326)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38614 (_ BitVec 64) (_ BitVec 32) List!12551) Unit!22326)

(assert (=> b!652580 (= lt!303710 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!303724 (select (arr!18510 a!2986) j!136) j!136 Nil!12548))))

(assert (=> b!652580 false))

(declare-fun b!652581 () Bool)

(declare-fun e!374573 () Bool)

(assert (=> b!652581 (= e!374571 e!374573)))

(declare-fun res!423235 () Bool)

(assert (=> b!652581 (=> (not res!423235) (not e!374573))))

(assert (=> b!652581 (= res!423235 (= (select (store (arr!18510 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!652581 (= lt!303724 (array!38615 (store (arr!18510 a!2986) i!1108 k!1786) (size!18874 a!2986)))))

(declare-fun b!652582 () Bool)

(declare-fun res!423220 () Bool)

(assert (=> b!652582 (=> (not res!423220) (not e!374565))))

(assert (=> b!652582 (= res!423220 (validKeyInArray!0 k!1786))))

(declare-fun b!652583 () Bool)

(assert (=> b!652583 (= e!374573 e!374562)))

(declare-fun res!423230 () Bool)

(assert (=> b!652583 (=> (not res!423230) (not e!374562))))

(declare-fun lt!303716 () SeekEntryResult!6950)

(assert (=> b!652583 (= res!423230 (and (= lt!303716 (Found!6950 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18510 a!2986) index!984) (select (arr!18510 a!2986) j!136))) (not (= (select (arr!18510 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!652583 (= lt!303716 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18510 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!652584 () Bool)

(declare-fun res!423225 () Bool)

(assert (=> b!652584 (=> (not res!423225) (not e!374565))))

(assert (=> b!652584 (= res!423225 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!652585 () Bool)

(declare-fun res!423237 () Bool)

(assert (=> b!652585 (=> (not res!423237) (not e!374571))))

(assert (=> b!652585 (= res!423237 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12548))))

(declare-fun b!652586 () Bool)

(declare-fun Unit!22329 () Unit!22326)

(assert (=> b!652586 (= e!374559 Unit!22329)))

(assert (=> b!652586 false))

(declare-fun b!652587 () Bool)

(declare-fun Unit!22330 () Unit!22326)

(assert (=> b!652587 (= e!374563 Unit!22330)))

(declare-fun b!652588 () Bool)

(declare-fun Unit!22331 () Unit!22326)

(assert (=> b!652588 (= e!374559 Unit!22331)))

(declare-fun b!652589 () Bool)

(assert (=> b!652589 (= e!374565 e!374571)))

(declare-fun res!423226 () Bool)

(assert (=> b!652589 (=> (not res!423226) (not e!374571))))

(declare-fun lt!303715 () SeekEntryResult!6950)

(assert (=> b!652589 (= res!423226 (or (= lt!303715 (MissingZero!6950 i!1108)) (= lt!303715 (MissingVacant!6950 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38614 (_ BitVec 32)) SeekEntryResult!6950)

(assert (=> b!652589 (= lt!303715 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!652590 () Bool)

(assert (=> b!652590 (= e!374560 e!374566)))

(declare-fun res!423238 () Bool)

(assert (=> b!652590 (=> res!423238 e!374566)))

(assert (=> b!652590 (= res!423238 (bvsge index!984 j!136))))

(declare-fun lt!303726 () Unit!22326)

(assert (=> b!652590 (= lt!303726 e!374563)))

(declare-fun c!75043 () Bool)

(assert (=> b!652590 (= c!75043 (bvslt j!136 index!984))))

(declare-fun b!652591 () Bool)

(assert (=> b!652591 (= e!374561 (= lt!303716 lt!303713))))

(declare-fun b!652592 () Bool)

(declare-fun e!374572 () Bool)

(assert (=> b!652592 (= e!374567 e!374572)))

(declare-fun res!423224 () Bool)

(assert (=> b!652592 (=> (not res!423224) (not e!374572))))

(assert (=> b!652592 (= res!423224 (arrayContainsKey!0 lt!303724 (select (arr!18510 a!2986) j!136) j!136))))

(declare-fun b!652593 () Bool)

(assert (=> b!652593 (= e!374572 (arrayContainsKey!0 lt!303724 (select (arr!18510 a!2986) j!136) index!984))))

(declare-fun b!652594 () Bool)

(declare-fun res!423234 () Bool)

(assert (=> b!652594 (=> (not res!423234) (not e!374565))))

(assert (=> b!652594 (= res!423234 (and (= (size!18874 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18874 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18874 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!652595 () Bool)

(assert (=> b!652595 (= e!374570 (arrayContainsKey!0 lt!303724 (select (arr!18510 a!2986) j!136) index!984))))

(assert (= (and start!59114 res!423236) b!652594))

(assert (= (and b!652594 res!423234) b!652579))

(assert (= (and b!652579 res!423228) b!652582))

(assert (= (and b!652582 res!423220) b!652584))

(assert (= (and b!652584 res!423225) b!652589))

(assert (= (and b!652589 res!423226) b!652578))

(assert (= (and b!652578 res!423222) b!652585))

(assert (= (and b!652585 res!423237) b!652574))

(assert (= (and b!652574 res!423239) b!652581))

(assert (= (and b!652581 res!423235) b!652583))

(assert (= (and b!652583 res!423230) b!652576))

(assert (= (and b!652576 res!423233) b!652591))

(assert (= (and b!652576 c!75044) b!652586))

(assert (= (and b!652576 (not c!75044)) b!652588))

(assert (= (and b!652576 (not res!423229)) b!652577))

(assert (= (and b!652577 res!423231) b!652575))

(assert (= (and b!652575 (not res!423227)) b!652592))

(assert (= (and b!652592 res!423224) b!652593))

(assert (= (and b!652577 (not res!423232)) b!652590))

(assert (= (and b!652590 c!75043) b!652580))

(assert (= (and b!652590 (not c!75043)) b!652587))

(assert (= (and b!652590 (not res!423238)) b!652573))

(assert (= (and b!652573 res!423221) b!652595))

(assert (= (and b!652573 (not res!423223)) b!652572))

(declare-fun m!625709 () Bool)

(assert (=> b!652589 m!625709))

(declare-fun m!625711 () Bool)

(assert (=> b!652573 m!625711))

(declare-fun m!625713 () Bool)

(assert (=> b!652573 m!625713))

(assert (=> b!652573 m!625711))

(declare-fun m!625715 () Bool)

(assert (=> b!652573 m!625715))

(declare-fun m!625717 () Bool)

(assert (=> b!652573 m!625717))

(assert (=> b!652573 m!625711))

(declare-fun m!625719 () Bool)

(assert (=> b!652573 m!625719))

(declare-fun m!625721 () Bool)

(assert (=> b!652573 m!625721))

(assert (=> b!652573 m!625711))

(declare-fun m!625723 () Bool)

(assert (=> b!652573 m!625723))

(declare-fun m!625725 () Bool)

(assert (=> b!652573 m!625725))

(declare-fun m!625727 () Bool)

(assert (=> b!652580 m!625727))

(assert (=> b!652580 m!625711))

(declare-fun m!625729 () Bool)

(assert (=> b!652580 m!625729))

(assert (=> b!652580 m!625711))

(declare-fun m!625731 () Bool)

(assert (=> b!652580 m!625731))

(assert (=> b!652580 m!625711))

(assert (=> b!652580 m!625721))

(assert (=> b!652580 m!625711))

(declare-fun m!625733 () Bool)

(assert (=> b!652580 m!625733))

(declare-fun m!625735 () Bool)

(assert (=> b!652580 m!625735))

(assert (=> b!652580 m!625725))

(declare-fun m!625737 () Bool)

(assert (=> b!652581 m!625737))

(declare-fun m!625739 () Bool)

(assert (=> b!652581 m!625739))

(assert (=> b!652576 m!625711))

(assert (=> b!652576 m!625737))

(assert (=> b!652576 m!625711))

(declare-fun m!625741 () Bool)

(assert (=> b!652576 m!625741))

(declare-fun m!625743 () Bool)

(assert (=> b!652576 m!625743))

(declare-fun m!625745 () Bool)

(assert (=> b!652576 m!625745))

(declare-fun m!625747 () Bool)

(assert (=> b!652576 m!625747))

(declare-fun m!625749 () Bool)

(assert (=> b!652576 m!625749))

(declare-fun m!625751 () Bool)

(assert (=> b!652576 m!625751))

(assert (=> b!652579 m!625711))

(assert (=> b!652579 m!625711))

(declare-fun m!625753 () Bool)

(assert (=> b!652579 m!625753))

(declare-fun m!625755 () Bool)

(assert (=> b!652584 m!625755))

(assert (=> b!652592 m!625711))

(assert (=> b!652592 m!625711))

(assert (=> b!652592 m!625723))

(declare-fun m!625757 () Bool)

(assert (=> b!652578 m!625757))

(declare-fun m!625759 () Bool)

(assert (=> b!652574 m!625759))

(assert (=> b!652575 m!625711))

(declare-fun m!625761 () Bool)

(assert (=> b!652583 m!625761))

(assert (=> b!652583 m!625711))

(assert (=> b!652583 m!625711))

(declare-fun m!625763 () Bool)

(assert (=> b!652583 m!625763))

(declare-fun m!625765 () Bool)

(assert (=> b!652585 m!625765))

(assert (=> b!652577 m!625711))

(assert (=> b!652577 m!625737))

(declare-fun m!625767 () Bool)

(assert (=> b!652577 m!625767))

(assert (=> b!652595 m!625711))

(assert (=> b!652595 m!625711))

(declare-fun m!625769 () Bool)

(assert (=> b!652595 m!625769))

(declare-fun m!625771 () Bool)

(assert (=> b!652582 m!625771))

(assert (=> b!652593 m!625711))

(assert (=> b!652593 m!625711))

(assert (=> b!652593 m!625769))

(declare-fun m!625773 () Bool)

(assert (=> start!59114 m!625773))

(declare-fun m!625775 () Bool)

(assert (=> start!59114 m!625775))

(declare-fun m!625777 () Bool)

(assert (=> b!652572 m!625777))

(push 1)

(assert (not b!652578))

(assert (not b!652572))

(assert (not b!652580))

(assert (not b!652595))

(assert (not b!652583))

(assert (not b!652584))

(assert (not b!652579))

(assert (not b!652593))

(assert (not b!652592))

(assert (not b!652573))

(assert (not start!59114))

(assert (not b!652585))

(assert (not b!652582))

(assert (not b!652589))

(assert (not b!652576))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!92231 () Bool)

(declare-fun res!423370 () Bool)

(declare-fun e!374690 () Bool)

(assert (=> d!92231 (=> res!423370 e!374690)))

(assert (=> d!92231 (= res!423370 (= (select (arr!18510 lt!303724) j!136) (select (arr!18510 a!2986) j!136)))))

(assert (=> d!92231 (= (arrayContainsKey!0 lt!303724 (select (arr!18510 a!2986) j!136) j!136) e!374690)))

(declare-fun b!652768 () Bool)

(declare-fun e!374691 () Bool)

(assert (=> b!652768 (= e!374690 e!374691)))

(declare-fun res!423371 () Bool)

(assert (=> b!652768 (=> (not res!423371) (not e!374691))))

(assert (=> b!652768 (= res!423371 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18874 lt!303724)))))

(declare-fun b!652769 () Bool)

(assert (=> b!652769 (= e!374691 (arrayContainsKey!0 lt!303724 (select (arr!18510 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!92231 (not res!423370)) b!652768))

(assert (= (and b!652768 res!423371) b!652769))

(declare-fun m!625933 () Bool)

(assert (=> d!92231 m!625933))

(assert (=> b!652769 m!625711))

(declare-fun m!625935 () Bool)

(assert (=> b!652769 m!625935))

(assert (=> b!652592 d!92231))

(declare-fun d!92237 () Bool)

(assert (=> d!92237 (= (validKeyInArray!0 (select (arr!18510 a!2986) j!136)) (and (not (= (select (arr!18510 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18510 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!652579 d!92237))

(declare-fun d!92239 () Bool)

(assert (=> d!92239 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!59114 d!92239))

(declare-fun d!92247 () Bool)

(assert (=> d!92247 (= (array_inv!14306 a!2986) (bvsge (size!18874 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!59114 d!92247))

(declare-fun d!92249 () Bool)

(declare-fun res!423387 () Bool)

(declare-fun e!374717 () Bool)

(assert (=> d!92249 (=> res!423387 e!374717)))

(assert (=> d!92249 (= res!423387 (= (select (arr!18510 lt!303724) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18510 a!2986) j!136)))))

(assert (=> d!92249 (= (arrayContainsKey!0 lt!303724 (select (arr!18510 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!374717)))

(declare-fun b!652805 () Bool)

(declare-fun e!374718 () Bool)

(assert (=> b!652805 (= e!374717 e!374718)))

(declare-fun res!423388 () Bool)

(assert (=> b!652805 (=> (not res!423388) (not e!374718))))

(assert (=> b!652805 (= res!423388 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18874 lt!303724)))))

(declare-fun b!652806 () Bool)

(assert (=> b!652806 (= e!374718 (arrayContainsKey!0 lt!303724 (select (arr!18510 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!92249 (not res!423387)) b!652805))

(assert (= (and b!652805 res!423388) b!652806))

(declare-fun m!625957 () Bool)

(assert (=> d!92249 m!625957))

(assert (=> b!652806 m!625711))

(declare-fun m!625959 () Bool)

(assert (=> b!652806 m!625959))

(assert (=> b!652580 d!92249))

(declare-fun d!92251 () Bool)

(assert (=> d!92251 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18874 lt!303724)) (not (= (select (arr!18510 lt!303724) j!136) (select (arr!18510 a!2986) j!136))))))

(declare-fun lt!303864 () Unit!22326)

(declare-fun choose!21 (array!38614 (_ BitVec 64) (_ BitVec 32) List!12551) Unit!22326)

(assert (=> d!92251 (= lt!303864 (choose!21 lt!303724 (select (arr!18510 a!2986) j!136) j!136 Nil!12548))))

(assert (=> d!92251 (bvslt (size!18874 lt!303724) #b01111111111111111111111111111111)))

(assert (=> d!92251 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!303724 (select (arr!18510 a!2986) j!136) j!136 Nil!12548) lt!303864)))

(declare-fun bs!19456 () Bool)

(assert (= bs!19456 d!92251))

(assert (=> bs!19456 m!625933))

(assert (=> bs!19456 m!625711))

(declare-fun m!625981 () Bool)

(assert (=> bs!19456 m!625981))

(assert (=> b!652580 d!92251))

(declare-fun d!92261 () Bool)

(assert (=> d!92261 (arrayContainsKey!0 lt!303724 (select (arr!18510 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!303872 () Unit!22326)

(declare-fun choose!114 (array!38614 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22326)

(assert (=> d!92261 (= lt!303872 (choose!114 lt!303724 (select (arr!18510 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!92261 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!92261 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!303724 (select (arr!18510 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!303872)))

(declare-fun bs!19458 () Bool)

(assert (= bs!19458 d!92261))

(assert (=> bs!19458 m!625711))

(assert (=> bs!19458 m!625733))

(assert (=> bs!19458 m!625711))

(declare-fun m!625997 () Bool)

(assert (=> bs!19458 m!625997))

(assert (=> b!652580 d!92261))

(declare-fun d!92269 () Bool)

(assert (=> d!92269 (arrayNoDuplicates!0 lt!303724 j!136 Nil!12548)))

(declare-fun lt!303875 () Unit!22326)

(declare-fun choose!39 (array!38614 (_ BitVec 32) (_ BitVec 32)) Unit!22326)

(assert (=> d!92269 (= lt!303875 (choose!39 lt!303724 #b00000000000000000000000000000000 j!136))))

(assert (=> d!92269 (bvslt (size!18874 lt!303724) #b01111111111111111111111111111111)))

(assert (=> d!92269 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!303724 #b00000000000000000000000000000000 j!136) lt!303875)))

(declare-fun bs!19459 () Bool)

(assert (= bs!19459 d!92269))

(assert (=> bs!19459 m!625735))

(declare-fun m!625999 () Bool)

(assert (=> bs!19459 m!625999))

(assert (=> b!652580 d!92269))

(declare-fun b!652849 () Bool)

(declare-fun e!374748 () Bool)

(declare-fun call!33789 () Bool)

(assert (=> b!652849 (= e!374748 call!33789)))

(declare-fun b!652850 () Bool)

(declare-fun e!374749 () Bool)

(declare-fun e!374750 () Bool)

(assert (=> b!652850 (= e!374749 e!374750)))

(declare-fun res!423403 () Bool)

(assert (=> b!652850 (=> (not res!423403) (not e!374750))))

(declare-fun e!374747 () Bool)

(assert (=> b!652850 (= res!423403 (not e!374747))))

(declare-fun res!423405 () Bool)

(assert (=> b!652850 (=> (not res!423405) (not e!374747))))

(assert (=> b!652850 (= res!423405 (validKeyInArray!0 (select (arr!18510 lt!303724) j!136)))))

(declare-fun b!652852 () Bool)

(assert (=> b!652852 (= e!374748 call!33789)))

(declare-fun b!652853 () Bool)

(declare-fun contains!3180 (List!12551 (_ BitVec 64)) Bool)

(assert (=> b!652853 (= e!374747 (contains!3180 Nil!12548 (select (arr!18510 lt!303724) j!136)))))

(declare-fun c!75090 () Bool)

(declare-fun bm!33786 () Bool)

(assert (=> bm!33786 (= call!33789 (arrayNoDuplicates!0 lt!303724 (bvadd j!136 #b00000000000000000000000000000001) (ite c!75090 (Cons!12547 (select (arr!18510 lt!303724) j!136) Nil!12548) Nil!12548)))))

(declare-fun d!92271 () Bool)

(declare-fun res!423404 () Bool)

(assert (=> d!92271 (=> res!423404 e!374749)))

(assert (=> d!92271 (= res!423404 (bvsge j!136 (size!18874 lt!303724)))))

(assert (=> d!92271 (= (arrayNoDuplicates!0 lt!303724 j!136 Nil!12548) e!374749)))

(declare-fun b!652851 () Bool)

(assert (=> b!652851 (= e!374750 e!374748)))

(assert (=> b!652851 (= c!75090 (validKeyInArray!0 (select (arr!18510 lt!303724) j!136)))))

(assert (= (and d!92271 (not res!423404)) b!652850))

(assert (= (and b!652850 res!423405) b!652853))

(assert (= (and b!652850 res!423403) b!652851))

(assert (= (and b!652851 c!75090) b!652852))

(assert (= (and b!652851 (not c!75090)) b!652849))

(assert (= (or b!652852 b!652849) bm!33786))

(assert (=> b!652850 m!625933))

(assert (=> b!652850 m!625933))

(declare-fun m!626005 () Bool)

(assert (=> b!652850 m!626005))

(assert (=> b!652853 m!625933))

(assert (=> b!652853 m!625933))

(declare-fun m!626009 () Bool)

(assert (=> b!652853 m!626009))

(assert (=> bm!33786 m!625933))

(declare-fun m!626013 () Bool)

(assert (=> bm!33786 m!626013))

(assert (=> b!652851 m!625933))

(assert (=> b!652851 m!625933))

(assert (=> b!652851 m!626005))

(assert (=> b!652580 d!92271))

(declare-fun b!652854 () Bool)

(declare-fun e!374752 () Bool)

(declare-fun call!33790 () Bool)

(assert (=> b!652854 (= e!374752 call!33790)))

(declare-fun b!652855 () Bool)

(declare-fun e!374753 () Bool)

(declare-fun e!374754 () Bool)

(assert (=> b!652855 (= e!374753 e!374754)))

(declare-fun res!423406 () Bool)

(assert (=> b!652855 (=> (not res!423406) (not e!374754))))

(declare-fun e!374751 () Bool)

(assert (=> b!652855 (= res!423406 (not e!374751))))

(declare-fun res!423408 () Bool)

(assert (=> b!652855 (=> (not res!423408) (not e!374751))))

(assert (=> b!652855 (= res!423408 (validKeyInArray!0 (select (arr!18510 lt!303724) #b00000000000000000000000000000000)))))

(declare-fun b!652857 () Bool)

(assert (=> b!652857 (= e!374752 call!33790)))

(declare-fun b!652858 () Bool)

(assert (=> b!652858 (= e!374751 (contains!3180 Nil!12548 (select (arr!18510 lt!303724) #b00000000000000000000000000000000)))))

(declare-fun bm!33787 () Bool)

(declare-fun c!75091 () Bool)

(assert (=> bm!33787 (= call!33790 (arrayNoDuplicates!0 lt!303724 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!75091 (Cons!12547 (select (arr!18510 lt!303724) #b00000000000000000000000000000000) Nil!12548) Nil!12548)))))

(declare-fun d!92275 () Bool)

(declare-fun res!423407 () Bool)

(assert (=> d!92275 (=> res!423407 e!374753)))

(assert (=> d!92275 (= res!423407 (bvsge #b00000000000000000000000000000000 (size!18874 lt!303724)))))

(assert (=> d!92275 (= (arrayNoDuplicates!0 lt!303724 #b00000000000000000000000000000000 Nil!12548) e!374753)))

(declare-fun b!652856 () Bool)

(assert (=> b!652856 (= e!374754 e!374752)))

(assert (=> b!652856 (= c!75091 (validKeyInArray!0 (select (arr!18510 lt!303724) #b00000000000000000000000000000000)))))

(assert (= (and d!92275 (not res!423407)) b!652855))

(assert (= (and b!652855 res!423408) b!652858))

(assert (= (and b!652855 res!423406) b!652856))

(assert (= (and b!652856 c!75091) b!652857))

(assert (= (and b!652856 (not c!75091)) b!652854))

(assert (= (or b!652857 b!652854) bm!33787))

(declare-fun m!626017 () Bool)

(assert (=> b!652855 m!626017))

(assert (=> b!652855 m!626017))

(declare-fun m!626019 () Bool)

(assert (=> b!652855 m!626019))

(assert (=> b!652858 m!626017))

(assert (=> b!652858 m!626017))

(declare-fun m!626021 () Bool)

(assert (=> b!652858 m!626021))

(assert (=> bm!33787 m!626017))

(declare-fun m!626023 () Bool)

(assert (=> bm!33787 m!626023))

(assert (=> b!652856 m!626017))

(assert (=> b!652856 m!626017))

(assert (=> b!652856 m!626019))

(assert (=> b!652580 d!92275))

(declare-fun d!92277 () Bool)

(declare-fun e!374760 () Bool)

(assert (=> d!92277 e!374760))

(declare-fun res!423414 () Bool)

(assert (=> d!92277 (=> (not res!423414) (not e!374760))))

(assert (=> d!92277 (= res!423414 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18874 a!2986))))))

(declare-fun lt!303890 () Unit!22326)

(declare-fun choose!41 (array!38614 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12551) Unit!22326)

(assert (=> d!92277 (= lt!303890 (choose!41 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12548))))

(assert (=> d!92277 (bvslt (size!18874 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!92277 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12548) lt!303890)))

(declare-fun b!652864 () Bool)

(assert (=> b!652864 (= e!374760 (arrayNoDuplicates!0 (array!38615 (store (arr!18510 a!2986) i!1108 k!1786) (size!18874 a!2986)) #b00000000000000000000000000000000 Nil!12548))))

(assert (= (and d!92277 res!423414) b!652864))

(declare-fun m!626029 () Bool)

(assert (=> d!92277 m!626029))

(assert (=> b!652864 m!625737))

(declare-fun m!626031 () Bool)

(assert (=> b!652864 m!626031))

(assert (=> b!652580 d!92277))

(declare-fun bm!33790 () Bool)

(declare-fun call!33793 () Bool)

(assert (=> bm!33790 (= call!33793 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!652875 () Bool)

(declare-fun e!374769 () Bool)

(assert (=> b!652875 (= e!374769 call!33793)))

(declare-fun b!652876 () Bool)

(declare-fun e!374771 () Bool)

(assert (=> b!652876 (= e!374771 e!374769)))

(declare-fun c!75094 () Bool)

(assert (=> b!652876 (= c!75094 (validKeyInArray!0 (select (arr!18510 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!652877 () Bool)

(declare-fun e!374770 () Bool)

(assert (=> b!652877 (= e!374770 call!33793)))

(declare-fun d!92281 () Bool)

(declare-fun res!423421 () Bool)

(assert (=> d!92281 (=> res!423421 e!374771)))

(assert (=> d!92281 (= res!423421 (bvsge #b00000000000000000000000000000000 (size!18874 a!2986)))))

(assert (=> d!92281 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!374771)))

(declare-fun b!652878 () Bool)

(assert (=> b!652878 (= e!374769 e!374770)))

(declare-fun lt!303901 () (_ BitVec 64))

(assert (=> b!652878 (= lt!303901 (select (arr!18510 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!303900 () Unit!22326)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38614 (_ BitVec 64) (_ BitVec 32)) Unit!22326)

(assert (=> b!652878 (= lt!303900 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!303901 #b00000000000000000000000000000000))))

(assert (=> b!652878 (arrayContainsKey!0 a!2986 lt!303901 #b00000000000000000000000000000000)))

(declare-fun lt!303899 () Unit!22326)

(assert (=> b!652878 (= lt!303899 lt!303900)))

(declare-fun res!423422 () Bool)

(assert (=> b!652878 (= res!423422 (= (seekEntryOrOpen!0 (select (arr!18510 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6950 #b00000000000000000000000000000000)))))

(assert (=> b!652878 (=> (not res!423422) (not e!374770))))

(assert (= (and d!92281 (not res!423421)) b!652876))

(assert (= (and b!652876 c!75094) b!652878))

(assert (= (and b!652876 (not c!75094)) b!652875))

(assert (= (and b!652878 res!423422) b!652877))

(assert (= (or b!652877 b!652875) bm!33790))

(declare-fun m!626033 () Bool)

(assert (=> bm!33790 m!626033))

(declare-fun m!626035 () Bool)

(assert (=> b!652876 m!626035))

(assert (=> b!652876 m!626035))

(declare-fun m!626037 () Bool)

(assert (=> b!652876 m!626037))

(assert (=> b!652878 m!626035))

(declare-fun m!626039 () Bool)

(assert (=> b!652878 m!626039))

(declare-fun m!626041 () Bool)

(assert (=> b!652878 m!626041))

(assert (=> b!652878 m!626035))

(declare-fun m!626043 () Bool)

(assert (=> b!652878 m!626043))

(assert (=> b!652578 d!92281))

(declare-fun b!652935 () Bool)

(declare-fun e!374805 () SeekEntryResult!6950)

(declare-fun lt!303927 () SeekEntryResult!6950)

(assert (=> b!652935 (= e!374805 (MissingZero!6950 (index!30155 lt!303927)))))

(declare-fun b!652934 () Bool)

(declare-fun e!374803 () SeekEntryResult!6950)

(declare-fun e!374804 () SeekEntryResult!6950)

(assert (=> b!652934 (= e!374803 e!374804)))

(declare-fun lt!303929 () (_ BitVec 64))

(assert (=> b!652934 (= lt!303929 (select (arr!18510 a!2986) (index!30155 lt!303927)))))

(declare-fun c!75121 () Bool)

(assert (=> b!652934 (= c!75121 (= lt!303929 k!1786))))

(declare-fun d!92283 () Bool)

(declare-fun lt!303928 () SeekEntryResult!6950)

(assert (=> d!92283 (and (or (is-Undefined!6950 lt!303928) (not (is-Found!6950 lt!303928)) (and (bvsge (index!30154 lt!303928) #b00000000000000000000000000000000) (bvslt (index!30154 lt!303928) (size!18874 a!2986)))) (or (is-Undefined!6950 lt!303928) (is-Found!6950 lt!303928) (not (is-MissingZero!6950 lt!303928)) (and (bvsge (index!30153 lt!303928) #b00000000000000000000000000000000) (bvslt (index!30153 lt!303928) (size!18874 a!2986)))) (or (is-Undefined!6950 lt!303928) (is-Found!6950 lt!303928) (is-MissingZero!6950 lt!303928) (not (is-MissingVacant!6950 lt!303928)) (and (bvsge (index!30156 lt!303928) #b00000000000000000000000000000000) (bvslt (index!30156 lt!303928) (size!18874 a!2986)))) (or (is-Undefined!6950 lt!303928) (ite (is-Found!6950 lt!303928) (= (select (arr!18510 a!2986) (index!30154 lt!303928)) k!1786) (ite (is-MissingZero!6950 lt!303928) (= (select (arr!18510 a!2986) (index!30153 lt!303928)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!6950 lt!303928) (= (select (arr!18510 a!2986) (index!30156 lt!303928)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!92283 (= lt!303928 e!374803)))

(declare-fun c!75120 () Bool)

(assert (=> d!92283 (= c!75120 (and (is-Intermediate!6950 lt!303927) (undefined!7762 lt!303927)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38614 (_ BitVec 32)) SeekEntryResult!6950)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!92283 (= lt!303927 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!92283 (validMask!0 mask!3053)))

(assert (=> d!92283 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!303928)))

(declare-fun b!652936 () Bool)

(assert (=> b!652936 (= e!374803 Undefined!6950)))

(declare-fun b!652937 () Bool)

(assert (=> b!652937 (= e!374805 (seekKeyOrZeroReturnVacant!0 (x!58941 lt!303927) (index!30155 lt!303927) (index!30155 lt!303927) k!1786 a!2986 mask!3053))))

(declare-fun b!652938 () Bool)

(assert (=> b!652938 (= e!374804 (Found!6950 (index!30155 lt!303927)))))

(declare-fun b!652939 () Bool)

(declare-fun c!75119 () Bool)

(assert (=> b!652939 (= c!75119 (= lt!303929 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!652939 (= e!374804 e!374805)))

(assert (= (and d!92283 c!75120) b!652936))

(assert (= (and d!92283 (not c!75120)) b!652934))

(assert (= (and b!652934 c!75121) b!652938))

(assert (= (and b!652934 (not c!75121)) b!652939))

(assert (= (and b!652939 c!75119) b!652935))

(assert (= (and b!652939 (not c!75119)) b!652937))

(declare-fun m!626095 () Bool)

(assert (=> b!652934 m!626095))

(declare-fun m!626097 () Bool)

(assert (=> d!92283 m!626097))

(declare-fun m!626099 () Bool)

(assert (=> d!92283 m!626099))

(assert (=> d!92283 m!625773))

(assert (=> d!92283 m!626097))

(declare-fun m!626101 () Bool)

(assert (=> d!92283 m!626101))

(declare-fun m!626103 () Bool)

(assert (=> d!92283 m!626103))

(declare-fun m!626105 () Bool)

(assert (=> d!92283 m!626105))

(declare-fun m!626107 () Bool)

(assert (=> b!652937 m!626107))

(assert (=> b!652589 d!92283))

(declare-fun b!652980 () Bool)

(declare-fun e!374833 () SeekEntryResult!6950)

(assert (=> b!652980 (= e!374833 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!303719 lt!303724 mask!3053))))

(declare-fun b!652981 () Bool)

(declare-fun e!374834 () SeekEntryResult!6950)

(assert (=> b!652981 (= e!374834 (Found!6950 index!984))))

(declare-fun b!652982 () Bool)

(declare-fun c!75135 () Bool)

(declare-fun lt!303938 () (_ BitVec 64))

(assert (=> b!652982 (= c!75135 (= lt!303938 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!652982 (= e!374834 e!374833)))

(declare-fun b!652979 () Bool)

(assert (=> b!652979 (= e!374833 (MissingVacant!6950 vacantSpotIndex!68))))

(declare-fun lt!303939 () SeekEntryResult!6950)

(declare-fun d!92301 () Bool)

(assert (=> d!92301 (and (or (is-Undefined!6950 lt!303939) (not (is-Found!6950 lt!303939)) (and (bvsge (index!30154 lt!303939) #b00000000000000000000000000000000) (bvslt (index!30154 lt!303939) (size!18874 lt!303724)))) (or (is-Undefined!6950 lt!303939) (is-Found!6950 lt!303939) (not (is-MissingVacant!6950 lt!303939)) (not (= (index!30156 lt!303939) vacantSpotIndex!68)) (and (bvsge (index!30156 lt!303939) #b00000000000000000000000000000000) (bvslt (index!30156 lt!303939) (size!18874 lt!303724)))) (or (is-Undefined!6950 lt!303939) (ite (is-Found!6950 lt!303939) (= (select (arr!18510 lt!303724) (index!30154 lt!303939)) lt!303719) (and (is-MissingVacant!6950 lt!303939) (= (index!30156 lt!303939) vacantSpotIndex!68) (= (select (arr!18510 lt!303724) (index!30156 lt!303939)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!374835 () SeekEntryResult!6950)

(assert (=> d!92301 (= lt!303939 e!374835)))

(declare-fun c!75136 () Bool)

(assert (=> d!92301 (= c!75136 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!92301 (= lt!303938 (select (arr!18510 lt!303724) index!984))))

(assert (=> d!92301 (validMask!0 mask!3053)))

(assert (=> d!92301 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!303719 lt!303724 mask!3053) lt!303939)))

(declare-fun b!652983 () Bool)

(assert (=> b!652983 (= e!374835 Undefined!6950)))

(declare-fun b!652984 () Bool)

(assert (=> b!652984 (= e!374835 e!374834)))

(declare-fun c!75134 () Bool)

(assert (=> b!652984 (= c!75134 (= lt!303938 lt!303719))))

(assert (= (and d!92301 c!75136) b!652983))

(assert (= (and d!92301 (not c!75136)) b!652984))

(assert (= (and b!652984 c!75134) b!652981))

(assert (= (and b!652984 (not c!75134)) b!652982))

(assert (= (and b!652982 c!75135) b!652979))

(assert (= (and b!652982 (not c!75135)) b!652980))

(assert (=> b!652980 m!625745))

(assert (=> b!652980 m!625745))

(declare-fun m!626127 () Bool)

(assert (=> b!652980 m!626127))

(declare-fun m!626129 () Bool)

(assert (=> d!92301 m!626129))

(declare-fun m!626131 () Bool)

(assert (=> d!92301 m!626131))

(declare-fun m!626135 () Bool)

(assert (=> d!92301 m!626135))

(assert (=> d!92301 m!625773))

(assert (=> b!652576 d!92301))

(declare-fun d!92317 () Bool)

(declare-fun e!374874 () Bool)

(assert (=> d!92317 e!374874))

(declare-fun res!423470 () Bool)

(assert (=> d!92317 (=> (not res!423470) (not e!374874))))

(assert (=> d!92317 (= res!423470 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18874 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18874 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18874 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18874 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18874 a!2986))))))

(declare-fun lt!303963 () Unit!22326)

(declare-fun choose!9 (array!38614 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22326)

(assert (=> d!92317 (= lt!303963 (choose!9 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!303721 vacantSpotIndex!68 mask!3053))))

(assert (=> d!92317 (validMask!0 mask!3053)))

(assert (=> d!92317 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!303721 vacantSpotIndex!68 mask!3053) lt!303963)))

(declare-fun b!653036 () Bool)

(assert (=> b!653036 (= e!374874 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303721 vacantSpotIndex!68 (select (arr!18510 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303721 vacantSpotIndex!68 (select (store (arr!18510 a!2986) i!1108 k!1786) j!136) (array!38615 (store (arr!18510 a!2986) i!1108 k!1786) (size!18874 a!2986)) mask!3053)))))

(assert (= (and d!92317 res!423470) b!653036))

(declare-fun m!626189 () Bool)

(assert (=> d!92317 m!626189))

(assert (=> d!92317 m!625773))

(assert (=> b!653036 m!625711))

(assert (=> b!653036 m!625741))

(assert (=> b!653036 m!625737))

(assert (=> b!653036 m!625751))

(declare-fun m!626195 () Bool)

(assert (=> b!653036 m!626195))

(assert (=> b!653036 m!625711))

(assert (=> b!653036 m!625751))

(assert (=> b!652576 d!92317))

(declare-fun d!92343 () Bool)

(declare-fun lt!303966 () (_ BitVec 32))

(assert (=> d!92343 (and (bvsge lt!303966 #b00000000000000000000000000000000) (bvslt lt!303966 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!92343 (= lt!303966 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!92343 (validMask!0 mask!3053)))

(assert (=> d!92343 (= (nextIndex!0 index!984 x!910 mask!3053) lt!303966)))

(declare-fun bs!19466 () Bool)

(assert (= bs!19466 d!92343))

(declare-fun m!626213 () Bool)

(assert (=> bs!19466 m!626213))

(assert (=> bs!19466 m!625773))

(assert (=> b!652576 d!92343))

(declare-fun e!374885 () SeekEntryResult!6950)

(declare-fun b!653048 () Bool)

(assert (=> b!653048 (= e!374885 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!303721 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18510 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!653049 () Bool)

(declare-fun e!374886 () SeekEntryResult!6950)

(assert (=> b!653049 (= e!374886 (Found!6950 lt!303721))))

(declare-fun b!653050 () Bool)

(declare-fun c!75151 () Bool)

(declare-fun lt!303968 () (_ BitVec 64))

(assert (=> b!653050 (= c!75151 (= lt!303968 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!653050 (= e!374886 e!374885)))

(declare-fun b!653047 () Bool)

(assert (=> b!653047 (= e!374885 (MissingVacant!6950 vacantSpotIndex!68))))

(declare-fun d!92359 () Bool)

(declare-fun lt!303969 () SeekEntryResult!6950)

(assert (=> d!92359 (and (or (is-Undefined!6950 lt!303969) (not (is-Found!6950 lt!303969)) (and (bvsge (index!30154 lt!303969) #b00000000000000000000000000000000) (bvslt (index!30154 lt!303969) (size!18874 a!2986)))) (or (is-Undefined!6950 lt!303969) (is-Found!6950 lt!303969) (not (is-MissingVacant!6950 lt!303969)) (not (= (index!30156 lt!303969) vacantSpotIndex!68)) (and (bvsge (index!30156 lt!303969) #b00000000000000000000000000000000) (bvslt (index!30156 lt!303969) (size!18874 a!2986)))) (or (is-Undefined!6950 lt!303969) (ite (is-Found!6950 lt!303969) (= (select (arr!18510 a!2986) (index!30154 lt!303969)) (select (arr!18510 a!2986) j!136)) (and (is-MissingVacant!6950 lt!303969) (= (index!30156 lt!303969) vacantSpotIndex!68) (= (select (arr!18510 a!2986) (index!30156 lt!303969)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!374887 () SeekEntryResult!6950)

(assert (=> d!92359 (= lt!303969 e!374887)))

(declare-fun c!75152 () Bool)

(assert (=> d!92359 (= c!75152 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!92359 (= lt!303968 (select (arr!18510 a!2986) lt!303721))))

(assert (=> d!92359 (validMask!0 mask!3053)))

(assert (=> d!92359 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303721 vacantSpotIndex!68 (select (arr!18510 a!2986) j!136) a!2986 mask!3053) lt!303969)))

(declare-fun b!653051 () Bool)

(assert (=> b!653051 (= e!374887 Undefined!6950)))

(declare-fun b!653052 () Bool)

(assert (=> b!653052 (= e!374887 e!374886)))

(declare-fun c!75150 () Bool)

(assert (=> b!653052 (= c!75150 (= lt!303968 (select (arr!18510 a!2986) j!136)))))

(assert (= (and d!92359 c!75152) b!653051))

(assert (= (and d!92359 (not c!75152)) b!653052))

(assert (= (and b!653052 c!75150) b!653049))

(assert (= (and b!653052 (not c!75150)) b!653050))

(assert (= (and b!653050 c!75151) b!653047))

(assert (= (and b!653050 (not c!75151)) b!653048))

(declare-fun m!626219 () Bool)

(assert (=> b!653048 m!626219))

(assert (=> b!653048 m!626219))

(assert (=> b!653048 m!625711))

(declare-fun m!626221 () Bool)

(assert (=> b!653048 m!626221))

(declare-fun m!626223 () Bool)

(assert (=> d!92359 m!626223))

(declare-fun m!626225 () Bool)

(assert (=> d!92359 m!626225))

(declare-fun m!626227 () Bool)

(assert (=> d!92359 m!626227))

(assert (=> d!92359 m!625773))

(assert (=> b!652576 d!92359))

(declare-fun b!653059 () Bool)

(declare-fun e!374892 () SeekEntryResult!6950)

(assert (=> b!653059 (= e!374892 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!303721 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!303719 lt!303724 mask!3053))))

(declare-fun b!653060 () Bool)

(declare-fun e!374893 () SeekEntryResult!6950)

(assert (=> b!653060 (= e!374893 (Found!6950 lt!303721))))

(declare-fun b!653061 () Bool)

(declare-fun c!75155 () Bool)

(declare-fun lt!303971 () (_ BitVec 64))

(assert (=> b!653061 (= c!75155 (= lt!303971 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!653061 (= e!374893 e!374892)))

(declare-fun b!653058 () Bool)

(assert (=> b!653058 (= e!374892 (MissingVacant!6950 vacantSpotIndex!68))))

(declare-fun d!92365 () Bool)

(declare-fun lt!303972 () SeekEntryResult!6950)

(assert (=> d!92365 (and (or (is-Undefined!6950 lt!303972) (not (is-Found!6950 lt!303972)) (and (bvsge (index!30154 lt!303972) #b00000000000000000000000000000000) (bvslt (index!30154 lt!303972) (size!18874 lt!303724)))) (or (is-Undefined!6950 lt!303972) (is-Found!6950 lt!303972) (not (is-MissingVacant!6950 lt!303972)) (not (= (index!30156 lt!303972) vacantSpotIndex!68)) (and (bvsge (index!30156 lt!303972) #b00000000000000000000000000000000) (bvslt (index!30156 lt!303972) (size!18874 lt!303724)))) (or (is-Undefined!6950 lt!303972) (ite (is-Found!6950 lt!303972) (= (select (arr!18510 lt!303724) (index!30154 lt!303972)) lt!303719) (and (is-MissingVacant!6950 lt!303972) (= (index!30156 lt!303972) vacantSpotIndex!68) (= (select (arr!18510 lt!303724) (index!30156 lt!303972)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!374894 () SeekEntryResult!6950)

(assert (=> d!92365 (= lt!303972 e!374894)))

(declare-fun c!75156 () Bool)

(assert (=> d!92365 (= c!75156 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!92365 (= lt!303971 (select (arr!18510 lt!303724) lt!303721))))

(assert (=> d!92365 (validMask!0 mask!3053)))

(assert (=> d!92365 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303721 vacantSpotIndex!68 lt!303719 lt!303724 mask!3053) lt!303972)))

(declare-fun b!653062 () Bool)

(assert (=> b!653062 (= e!374894 Undefined!6950)))

(declare-fun b!653063 () Bool)

(assert (=> b!653063 (= e!374894 e!374893)))

(declare-fun c!75154 () Bool)

(assert (=> b!653063 (= c!75154 (= lt!303971 lt!303719))))

(assert (= (and d!92365 c!75156) b!653062))

(assert (= (and d!92365 (not c!75156)) b!653063))

(assert (= (and b!653063 c!75154) b!653060))

(assert (= (and b!653063 (not c!75154)) b!653061))

(assert (= (and b!653061 c!75155) b!653058))

(assert (= (and b!653061 (not c!75155)) b!653059))

(assert (=> b!653059 m!626219))

(assert (=> b!653059 m!626219))

(declare-fun m!626235 () Bool)

(assert (=> b!653059 m!626235))

(declare-fun m!626237 () Bool)

(assert (=> d!92365 m!626237))

(declare-fun m!626239 () Bool)

(assert (=> d!92365 m!626239))

(declare-fun m!626241 () Bool)

(assert (=> d!92365 m!626241))

(assert (=> d!92365 m!625773))

(assert (=> b!652576 d!92365))

(declare-fun d!92367 () Bool)

(declare-fun res!423484 () Bool)

(declare-fun e!374895 () Bool)

(assert (=> d!92367 (=> res!423484 e!374895)))

(assert (=> d!92367 (= res!423484 (= (select (arr!18510 lt!303724) index!984) (select (arr!18510 a!2986) j!136)))))

(assert (=> d!92367 (= (arrayContainsKey!0 lt!303724 (select (arr!18510 a!2986) j!136) index!984) e!374895)))

(declare-fun b!653064 () Bool)

(declare-fun e!374896 () Bool)

(assert (=> b!653064 (= e!374895 e!374896)))

(declare-fun res!423485 () Bool)

(assert (=> b!653064 (=> (not res!423485) (not e!374896))))

(assert (=> b!653064 (= res!423485 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18874 lt!303724)))))

(declare-fun b!653065 () Bool)

(assert (=> b!653065 (= e!374896 (arrayContainsKey!0 lt!303724 (select (arr!18510 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!92367 (not res!423484)) b!653064))

(assert (= (and b!653064 res!423485) b!653065))

(assert (=> d!92367 m!626135))

(assert (=> b!653065 m!625711))

(declare-fun m!626243 () Bool)

(assert (=> b!653065 m!626243))

(assert (=> b!652595 d!92367))

(declare-fun b!653066 () Bool)

(declare-fun e!374898 () Bool)

(declare-fun call!33802 () Bool)

(assert (=> b!653066 (= e!374898 call!33802)))

(declare-fun b!653067 () Bool)

(declare-fun e!374899 () Bool)

(declare-fun e!374900 () Bool)

(assert (=> b!653067 (= e!374899 e!374900)))

(declare-fun res!423486 () Bool)

(assert (=> b!653067 (=> (not res!423486) (not e!374900))))

(declare-fun e!374897 () Bool)

(assert (=> b!653067 (= res!423486 (not e!374897))))

(declare-fun res!423488 () Bool)

(assert (=> b!653067 (=> (not res!423488) (not e!374897))))

(assert (=> b!653067 (= res!423488 (validKeyInArray!0 (select (arr!18510 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!653069 () Bool)

(assert (=> b!653069 (= e!374898 call!33802)))

(declare-fun b!653070 () Bool)

(assert (=> b!653070 (= e!374897 (contains!3180 Nil!12548 (select (arr!18510 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33799 () Bool)

(declare-fun c!75157 () Bool)

(assert (=> bm!33799 (= call!33802 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!75157 (Cons!12547 (select (arr!18510 a!2986) #b00000000000000000000000000000000) Nil!12548) Nil!12548)))))

(declare-fun d!92369 () Bool)

(declare-fun res!423487 () Bool)

(assert (=> d!92369 (=> res!423487 e!374899)))

(assert (=> d!92369 (= res!423487 (bvsge #b00000000000000000000000000000000 (size!18874 a!2986)))))

(assert (=> d!92369 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12548) e!374899)))

(declare-fun b!653068 () Bool)

(assert (=> b!653068 (= e!374900 e!374898)))

(assert (=> b!653068 (= c!75157 (validKeyInArray!0 (select (arr!18510 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!92369 (not res!423487)) b!653067))

(assert (= (and b!653067 res!423488) b!653070))

(assert (= (and b!653067 res!423486) b!653068))

(assert (= (and b!653068 c!75157) b!653069))

(assert (= (and b!653068 (not c!75157)) b!653066))

(assert (= (or b!653069 b!653066) bm!33799))

(assert (=> b!653067 m!626035))

(assert (=> b!653067 m!626035))

(assert (=> b!653067 m!626037))

(assert (=> b!653070 m!626035))

(assert (=> b!653070 m!626035))

(declare-fun m!626245 () Bool)

(assert (=> b!653070 m!626245))

(assert (=> bm!33799 m!626035))

(declare-fun m!626247 () Bool)

(assert (=> bm!33799 m!626247))

(assert (=> b!653068 m!626035))

(assert (=> b!653068 m!626035))

(assert (=> b!653068 m!626037))

(assert (=> b!652585 d!92369))

(declare-fun b!653072 () Bool)

(declare-fun e!374901 () SeekEntryResult!6950)

(assert (=> b!653072 (= e!374901 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18510 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!653073 () Bool)

(declare-fun e!374902 () SeekEntryResult!6950)

(assert (=> b!653073 (= e!374902 (Found!6950 index!984))))

(declare-fun b!653074 () Bool)

(declare-fun c!75159 () Bool)

(declare-fun lt!303973 () (_ BitVec 64))

(assert (=> b!653074 (= c!75159 (= lt!303973 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!653074 (= e!374902 e!374901)))

(declare-fun b!653071 () Bool)

(assert (=> b!653071 (= e!374901 (MissingVacant!6950 vacantSpotIndex!68))))

(declare-fun d!92371 () Bool)

(declare-fun lt!303974 () SeekEntryResult!6950)

(assert (=> d!92371 (and (or (is-Undefined!6950 lt!303974) (not (is-Found!6950 lt!303974)) (and (bvsge (index!30154 lt!303974) #b00000000000000000000000000000000) (bvslt (index!30154 lt!303974) (size!18874 a!2986)))) (or (is-Undefined!6950 lt!303974) (is-Found!6950 lt!303974) (not (is-MissingVacant!6950 lt!303974)) (not (= (index!30156 lt!303974) vacantSpotIndex!68)) (and (bvsge (index!30156 lt!303974) #b00000000000000000000000000000000) (bvslt (index!30156 lt!303974) (size!18874 a!2986)))) (or (is-Undefined!6950 lt!303974) (ite (is-Found!6950 lt!303974) (= (select (arr!18510 a!2986) (index!30154 lt!303974)) (select (arr!18510 a!2986) j!136)) (and (is-MissingVacant!6950 lt!303974) (= (index!30156 lt!303974) vacantSpotIndex!68) (= (select (arr!18510 a!2986) (index!30156 lt!303974)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!374903 () SeekEntryResult!6950)

(assert (=> d!92371 (= lt!303974 e!374903)))

(declare-fun c!75160 () Bool)

(assert (=> d!92371 (= c!75160 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!92371 (= lt!303973 (select (arr!18510 a!2986) index!984))))

(assert (=> d!92371 (validMask!0 mask!3053)))

(assert (=> d!92371 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18510 a!2986) j!136) a!2986 mask!3053) lt!303974)))

(declare-fun b!653075 () Bool)

(assert (=> b!653075 (= e!374903 Undefined!6950)))

(declare-fun b!653076 () Bool)

(assert (=> b!653076 (= e!374903 e!374902)))

(declare-fun c!75158 () Bool)

(assert (=> b!653076 (= c!75158 (= lt!303973 (select (arr!18510 a!2986) j!136)))))

(assert (= (and d!92371 c!75160) b!653075))

(assert (= (and d!92371 (not c!75160)) b!653076))

(assert (= (and b!653076 c!75158) b!653073))

(assert (= (and b!653076 (not c!75158)) b!653074))

(assert (= (and b!653074 c!75159) b!653071))

(assert (= (and b!653074 (not c!75159)) b!653072))

(assert (=> b!653072 m!625745))

(assert (=> b!653072 m!625745))

(assert (=> b!653072 m!625711))

(declare-fun m!626249 () Bool)

(assert (=> b!653072 m!626249))

(declare-fun m!626251 () Bool)

(assert (=> d!92371 m!626251))

(declare-fun m!626253 () Bool)

(assert (=> d!92371 m!626253))

(assert (=> d!92371 m!625761))

(assert (=> d!92371 m!625773))

(assert (=> b!652583 d!92371))

(declare-fun d!92373 () Bool)

(declare-fun res!423489 () Bool)

(declare-fun e!374904 () Bool)

(assert (=> d!92373 (=> res!423489 e!374904)))

(assert (=> d!92373 (= res!423489 (= (select (arr!18510 a!2986) #b00000000000000000000000000000000) k!1786))))

(assert (=> d!92373 (= (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000) e!374904)))

(declare-fun b!653077 () Bool)

(declare-fun e!374905 () Bool)

(assert (=> b!653077 (= e!374904 e!374905)))

(declare-fun res!423490 () Bool)

(assert (=> b!653077 (=> (not res!423490) (not e!374905))))

(assert (=> b!653077 (= res!423490 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18874 a!2986)))))

(declare-fun b!653078 () Bool)

(assert (=> b!653078 (= e!374905 (arrayContainsKey!0 a!2986 k!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!92373 (not res!423489)) b!653077))

(assert (= (and b!653077 res!423490) b!653078))

(assert (=> d!92373 m!626035))

(declare-fun m!626255 () Bool)

(assert (=> b!653078 m!626255))

(assert (=> b!652584 d!92373))

(declare-fun d!92375 () Bool)

(assert (=> d!92375 (arrayContainsKey!0 lt!303724 (select (arr!18510 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!303979 () Unit!22326)

(assert (=> d!92375 (= lt!303979 (choose!114 lt!303724 (select (arr!18510 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!92375 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!92375 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!303724 (select (arr!18510 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!303979)))

(declare-fun bs!19469 () Bool)

(assert (= bs!19469 d!92375))

(assert (=> bs!19469 m!625711))

(assert (=> bs!19469 m!625713))

(assert (=> bs!19469 m!625711))

(declare-fun m!626257 () Bool)

(assert (=> bs!19469 m!626257))

(assert (=> b!652573 d!92375))

(declare-fun b!653087 () Bool)

(declare-fun e!374913 () Bool)

(declare-fun call!33803 () Bool)

(assert (=> b!653087 (= e!374913 call!33803)))

(declare-fun b!653088 () Bool)

(declare-fun e!374914 () Bool)

(declare-fun e!374915 () Bool)

(assert (=> b!653088 (= e!374914 e!374915)))

(declare-fun res!423495 () Bool)

(assert (=> b!653088 (=> (not res!423495) (not e!374915))))

(declare-fun e!374912 () Bool)

(assert (=> b!653088 (= res!423495 (not e!374912))))

(declare-fun res!423497 () Bool)

(assert (=> b!653088 (=> (not res!423497) (not e!374912))))

(assert (=> b!653088 (= res!423497 (validKeyInArray!0 (select (arr!18510 lt!303724) index!984)))))

(declare-fun b!653090 () Bool)

(assert (=> b!653090 (= e!374913 call!33803)))

(declare-fun b!653091 () Bool)

(assert (=> b!653091 (= e!374912 (contains!3180 Nil!12548 (select (arr!18510 lt!303724) index!984)))))

(declare-fun bm!33800 () Bool)

(declare-fun c!75163 () Bool)

(assert (=> bm!33800 (= call!33803 (arrayNoDuplicates!0 lt!303724 (bvadd index!984 #b00000000000000000000000000000001) (ite c!75163 (Cons!12547 (select (arr!18510 lt!303724) index!984) Nil!12548) Nil!12548)))))

(declare-fun d!92377 () Bool)

(declare-fun res!423496 () Bool)

(assert (=> d!92377 (=> res!423496 e!374914)))

(assert (=> d!92377 (= res!423496 (bvsge index!984 (size!18874 lt!303724)))))

(assert (=> d!92377 (= (arrayNoDuplicates!0 lt!303724 index!984 Nil!12548) e!374914)))

(declare-fun b!653089 () Bool)

(assert (=> b!653089 (= e!374915 e!374913)))

(assert (=> b!653089 (= c!75163 (validKeyInArray!0 (select (arr!18510 lt!303724) index!984)))))

(assert (= (and d!92377 (not res!423496)) b!653088))

(assert (= (and b!653088 res!423497) b!653091))

(assert (= (and b!653088 res!423495) b!653089))

(assert (= (and b!653089 c!75163) b!653090))

(assert (= (and b!653089 (not c!75163)) b!653087))

(assert (= (or b!653090 b!653087) bm!33800))

(assert (=> b!653088 m!626135))

(assert (=> b!653088 m!626135))

(declare-fun m!626259 () Bool)

(assert (=> b!653088 m!626259))

(assert (=> b!653091 m!626135))

(assert (=> b!653091 m!626135))

(declare-fun m!626261 () Bool)

(assert (=> b!653091 m!626261))

(assert (=> bm!33800 m!626135))

(declare-fun m!626263 () Bool)

(assert (=> bm!33800 m!626263))

(assert (=> b!653089 m!626135))

(assert (=> b!653089 m!626135))

(assert (=> b!653089 m!626259))

(assert (=> b!652573 d!92377))

(declare-fun d!92379 () Bool)

(declare-fun res!423498 () Bool)

(declare-fun e!374916 () Bool)

(assert (=> d!92379 (=> res!423498 e!374916)))

(assert (=> d!92379 (= res!423498 (= (select (arr!18510 lt!303724) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!18510 a!2986) j!136)))))

(assert (=> d!92379 (= (arrayContainsKey!0 lt!303724 (select (arr!18510 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!374916)))

(declare-fun b!653092 () Bool)

(declare-fun e!374917 () Bool)

(assert (=> b!653092 (= e!374916 e!374917)))

(declare-fun res!423499 () Bool)

(assert (=> b!653092 (=> (not res!423499) (not e!374917))))

(assert (=> b!653092 (= res!423499 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18874 lt!303724)))))

(declare-fun b!653093 () Bool)

(assert (=> b!653093 (= e!374917 (arrayContainsKey!0 lt!303724 (select (arr!18510 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!92379 (not res!423498)) b!653092))

(assert (= (and b!653092 res!423499) b!653093))

(declare-fun m!626265 () Bool)

(assert (=> d!92379 m!626265))

(assert (=> b!653093 m!625711))

(declare-fun m!626267 () Bool)

(assert (=> b!653093 m!626267))

(assert (=> b!652573 d!92379))

(assert (=> b!652573 d!92231))

(assert (=> b!652573 d!92275))

(assert (=> b!652573 d!92277))

(declare-fun d!92381 () Bool)

(assert (=> d!92381 (arrayNoDuplicates!0 lt!303724 index!984 Nil!12548)))

(declare-fun lt!303982 () Unit!22326)

(assert (=> d!92381 (= lt!303982 (choose!39 lt!303724 #b00000000000000000000000000000000 index!984))))

(assert (=> d!92381 (bvslt (size!18874 lt!303724) #b01111111111111111111111111111111)))

(assert (=> d!92381 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!303724 #b00000000000000000000000000000000 index!984) lt!303982)))

(declare-fun bs!19470 () Bool)

(assert (= bs!19470 d!92381))

(assert (=> bs!19470 m!625715))

(declare-fun m!626269 () Bool)

(assert (=> bs!19470 m!626269))

(assert (=> b!652573 d!92381))

(declare-fun d!92383 () Bool)

(assert (=> d!92383 (= (validKeyInArray!0 k!1786) (and (not (= k!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!652582 d!92383))

(declare-fun d!92385 () Bool)

(declare-fun res!423508 () Bool)

(declare-fun e!374927 () Bool)

(assert (=> d!92385 (=> res!423508 e!374927)))

(assert (=> d!92385 (= res!423508 (is-Nil!12548 Nil!12548))))

(assert (=> d!92385 (= (noDuplicate!435 Nil!12548) e!374927)))

(declare-fun b!653104 () Bool)

(declare-fun e!374928 () Bool)

(assert (=> b!653104 (= e!374927 e!374928)))

(declare-fun res!423509 () Bool)

(assert (=> b!653104 (=> (not res!423509) (not e!374928))))

(assert (=> b!653104 (= res!423509 (not (contains!3180 (t!18779 Nil!12548) (h!13592 Nil!12548))))))

(declare-fun b!653105 () Bool)

(assert (=> b!653105 (= e!374928 (noDuplicate!435 (t!18779 Nil!12548)))))

(assert (= (and d!92385 (not res!423508)) b!653104))

(assert (= (and b!653104 res!423509) b!653105))

(declare-fun m!626281 () Bool)

(assert (=> b!653104 m!626281))

(declare-fun m!626283 () Bool)

(assert (=> b!653105 m!626283))

(assert (=> b!652572 d!92385))

(assert (=> b!652593 d!92367))

(push 1)

