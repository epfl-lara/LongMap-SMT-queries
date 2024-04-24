; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55200 () Bool)

(assert start!55200)

(declare-fun b!604584 () Bool)

(declare-datatypes ((Unit!19207 0))(
  ( (Unit!19208) )
))
(declare-fun e!345944 () Unit!19207)

(declare-fun Unit!19209 () Unit!19207)

(assert (=> b!604584 (= e!345944 Unit!19209)))

(assert (=> b!604584 false))

(declare-fun b!604585 () Bool)

(declare-fun res!388426 () Bool)

(declare-fun e!345952 () Bool)

(assert (=> b!604585 (=> (not res!388426) (not e!345952))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!37218 0))(
  ( (array!37219 (arr!17863 (Array (_ BitVec 32) (_ BitVec 64))) (size!18227 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37218)

(assert (=> b!604585 (= res!388426 (and (= (size!18227 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18227 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18227 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!604586 () Bool)

(declare-fun res!388429 () Bool)

(declare-fun e!345949 () Bool)

(assert (=> b!604586 (=> (not res!388429) (not e!345949))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!604586 (= res!388429 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17863 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!604587 () Bool)

(declare-fun e!345948 () Bool)

(declare-fun e!345941 () Bool)

(assert (=> b!604587 (= e!345948 e!345941)))

(declare-fun res!388427 () Bool)

(assert (=> b!604587 (=> (not res!388427) (not e!345941))))

(declare-fun lt!275717 () array!37218)

(declare-fun arrayContainsKey!0 (array!37218 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!604587 (= res!388427 (arrayContainsKey!0 lt!275717 (select (arr!17863 a!2986) j!136) j!136))))

(declare-fun b!604588 () Bool)

(declare-fun e!345947 () Unit!19207)

(declare-fun Unit!19210 () Unit!19207)

(assert (=> b!604588 (= e!345947 Unit!19210)))

(declare-fun lt!275721 () Unit!19207)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37218 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19207)

(assert (=> b!604588 (= lt!275721 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!275717 (select (arr!17863 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!604588 (arrayContainsKey!0 lt!275717 (select (arr!17863 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!275728 () Unit!19207)

(declare-datatypes ((List!11811 0))(
  ( (Nil!11808) (Cons!11807 (h!12855 (_ BitVec 64)) (t!18031 List!11811)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37218 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11811) Unit!19207)

(assert (=> b!604588 (= lt!275728 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11808))))

(declare-fun arrayNoDuplicates!0 (array!37218 (_ BitVec 32) List!11811) Bool)

(assert (=> b!604588 (arrayNoDuplicates!0 lt!275717 #b00000000000000000000000000000000 Nil!11808)))

(declare-fun lt!275718 () Unit!19207)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37218 (_ BitVec 32) (_ BitVec 32)) Unit!19207)

(assert (=> b!604588 (= lt!275718 (lemmaNoDuplicateFromThenFromBigger!0 lt!275717 #b00000000000000000000000000000000 j!136))))

(assert (=> b!604588 (arrayNoDuplicates!0 lt!275717 j!136 Nil!11808)))

(declare-fun lt!275723 () Unit!19207)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37218 (_ BitVec 64) (_ BitVec 32) List!11811) Unit!19207)

(assert (=> b!604588 (= lt!275723 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!275717 (select (arr!17863 a!2986) j!136) j!136 Nil!11808))))

(assert (=> b!604588 false))

(declare-fun b!604589 () Bool)

(declare-fun res!388418 () Bool)

(assert (=> b!604589 (=> (not res!388418) (not e!345949))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37218 (_ BitVec 32)) Bool)

(assert (=> b!604589 (= res!388418 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!604590 () Bool)

(assert (=> b!604590 (= e!345952 e!345949)))

(declare-fun res!388413 () Bool)

(assert (=> b!604590 (=> (not res!388413) (not e!345949))))

(declare-datatypes ((SeekEntryResult!6259 0))(
  ( (MissingZero!6259 (index!27299 (_ BitVec 32))) (Found!6259 (index!27300 (_ BitVec 32))) (Intermediate!6259 (undefined!7071 Bool) (index!27301 (_ BitVec 32)) (x!56247 (_ BitVec 32))) (Undefined!6259) (MissingVacant!6259 (index!27302 (_ BitVec 32))) )
))
(declare-fun lt!275726 () SeekEntryResult!6259)

(assert (=> b!604590 (= res!388413 (or (= lt!275726 (MissingZero!6259 i!1108)) (= lt!275726 (MissingVacant!6259 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37218 (_ BitVec 32)) SeekEntryResult!6259)

(assert (=> b!604590 (= lt!275726 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!604591 () Bool)

(declare-fun e!345942 () Bool)

(declare-fun e!345951 () Bool)

(assert (=> b!604591 (= e!345942 e!345951)))

(declare-fun res!388423 () Bool)

(assert (=> b!604591 (=> (not res!388423) (not e!345951))))

(declare-fun lt!275719 () SeekEntryResult!6259)

(assert (=> b!604591 (= res!388423 (and (= lt!275719 (Found!6259 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17863 a!2986) index!984) (select (arr!17863 a!2986) j!136))) (not (= (select (arr!17863 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37218 (_ BitVec 32)) SeekEntryResult!6259)

(assert (=> b!604591 (= lt!275719 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17863 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!604592 () Bool)

(declare-fun res!388428 () Bool)

(assert (=> b!604592 (=> (not res!388428) (not e!345952))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!604592 (= res!388428 (validKeyInArray!0 (select (arr!17863 a!2986) j!136)))))

(declare-fun b!604593 () Bool)

(declare-fun e!345945 () Bool)

(declare-fun lt!275722 () SeekEntryResult!6259)

(assert (=> b!604593 (= e!345945 (= lt!275719 lt!275722))))

(declare-fun b!604594 () Bool)

(assert (=> b!604594 (= e!345949 e!345942)))

(declare-fun res!388415 () Bool)

(assert (=> b!604594 (=> (not res!388415) (not e!345942))))

(assert (=> b!604594 (= res!388415 (= (select (store (arr!17863 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!604594 (= lt!275717 (array!37219 (store (arr!17863 a!2986) i!1108 k0!1786) (size!18227 a!2986)))))

(declare-fun b!604595 () Bool)

(declare-fun e!345954 () Bool)

(declare-fun e!345950 () Bool)

(assert (=> b!604595 (= e!345954 e!345950)))

(declare-fun res!388425 () Bool)

(assert (=> b!604595 (=> res!388425 e!345950)))

(declare-fun lt!275716 () (_ BitVec 64))

(declare-fun lt!275724 () (_ BitVec 64))

(assert (=> b!604595 (= res!388425 (or (not (= (select (arr!17863 a!2986) j!136) lt!275716)) (not (= (select (arr!17863 a!2986) j!136) lt!275724))))))

(declare-fun e!345940 () Bool)

(assert (=> b!604595 e!345940))

(declare-fun res!388411 () Bool)

(assert (=> b!604595 (=> (not res!388411) (not e!345940))))

(assert (=> b!604595 (= res!388411 (= lt!275724 (select (arr!17863 a!2986) j!136)))))

(assert (=> b!604595 (= lt!275724 (select (store (arr!17863 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!604596 () Bool)

(assert (=> b!604596 (= e!345941 (arrayContainsKey!0 lt!275717 (select (arr!17863 a!2986) j!136) index!984))))

(declare-fun res!388421 () Bool)

(assert (=> start!55200 (=> (not res!388421) (not e!345952))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55200 (= res!388421 (validMask!0 mask!3053))))

(assert (=> start!55200 e!345952))

(assert (=> start!55200 true))

(declare-fun array_inv!13722 (array!37218) Bool)

(assert (=> start!55200 (array_inv!13722 a!2986)))

(declare-fun e!345953 () Bool)

(declare-fun b!604597 () Bool)

(assert (=> b!604597 (= e!345953 (arrayContainsKey!0 lt!275717 (select (arr!17863 a!2986) j!136) index!984))))

(declare-fun b!604598 () Bool)

(declare-fun res!388419 () Bool)

(assert (=> b!604598 (=> (not res!388419) (not e!345949))))

(assert (=> b!604598 (= res!388419 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11808))))

(declare-fun b!604599 () Bool)

(assert (=> b!604599 (= e!345940 e!345948)))

(declare-fun res!388417 () Bool)

(assert (=> b!604599 (=> res!388417 e!345948)))

(assert (=> b!604599 (= res!388417 (or (not (= (select (arr!17863 a!2986) j!136) lt!275716)) (not (= (select (arr!17863 a!2986) j!136) lt!275724)) (bvsge j!136 index!984)))))

(declare-fun b!604600 () Bool)

(declare-fun Unit!19211 () Unit!19207)

(assert (=> b!604600 (= e!345947 Unit!19211)))

(declare-fun b!604601 () Bool)

(declare-fun e!345946 () Bool)

(assert (=> b!604601 (= e!345950 e!345946)))

(declare-fun res!388424 () Bool)

(assert (=> b!604601 (=> res!388424 e!345946)))

(assert (=> b!604601 (= res!388424 (bvsge index!984 j!136))))

(declare-fun lt!275725 () Unit!19207)

(assert (=> b!604601 (= lt!275725 e!345947)))

(declare-fun c!68456 () Bool)

(assert (=> b!604601 (= c!68456 (bvslt j!136 index!984))))

(declare-fun b!604602 () Bool)

(declare-fun res!388414 () Bool)

(assert (=> b!604602 (=> (not res!388414) (not e!345952))))

(assert (=> b!604602 (= res!388414 (validKeyInArray!0 k0!1786))))

(declare-fun b!604603 () Bool)

(declare-fun Unit!19212 () Unit!19207)

(assert (=> b!604603 (= e!345944 Unit!19212)))

(declare-fun b!604604 () Bool)

(declare-fun res!388422 () Bool)

(assert (=> b!604604 (=> (not res!388422) (not e!345952))))

(assert (=> b!604604 (= res!388422 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!604605 () Bool)

(assert (=> b!604605 (= e!345951 (not e!345954))))

(declare-fun res!388420 () Bool)

(assert (=> b!604605 (=> res!388420 e!345954)))

(declare-fun lt!275720 () SeekEntryResult!6259)

(assert (=> b!604605 (= res!388420 (not (= lt!275720 (Found!6259 index!984))))))

(declare-fun lt!275730 () Unit!19207)

(assert (=> b!604605 (= lt!275730 e!345944)))

(declare-fun c!68455 () Bool)

(assert (=> b!604605 (= c!68455 (= lt!275720 Undefined!6259))))

(assert (=> b!604605 (= lt!275720 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!275716 lt!275717 mask!3053))))

(assert (=> b!604605 e!345945))

(declare-fun res!388412 () Bool)

(assert (=> b!604605 (=> (not res!388412) (not e!345945))))

(declare-fun lt!275731 () (_ BitVec 32))

(assert (=> b!604605 (= res!388412 (= lt!275722 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275731 vacantSpotIndex!68 lt!275716 lt!275717 mask!3053)))))

(assert (=> b!604605 (= lt!275722 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275731 vacantSpotIndex!68 (select (arr!17863 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!604605 (= lt!275716 (select (store (arr!17863 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!275727 () Unit!19207)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37218 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19207)

(assert (=> b!604605 (= lt!275727 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!275731 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!604605 (= lt!275731 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!604606 () Bool)

(assert (=> b!604606 (= e!345946 (or (bvslt (bvadd #b00000000000000000000000000000001 index!984) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 index!984) (size!18227 a!2986))))))

(assert (=> b!604606 (arrayContainsKey!0 lt!275717 (select (arr!17863 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!275729 () Unit!19207)

(assert (=> b!604606 (= lt!275729 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!275717 (select (arr!17863 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!604606 e!345953))

(declare-fun res!388416 () Bool)

(assert (=> b!604606 (=> (not res!388416) (not e!345953))))

(assert (=> b!604606 (= res!388416 (arrayContainsKey!0 lt!275717 (select (arr!17863 a!2986) j!136) j!136))))

(assert (= (and start!55200 res!388421) b!604585))

(assert (= (and b!604585 res!388426) b!604592))

(assert (= (and b!604592 res!388428) b!604602))

(assert (= (and b!604602 res!388414) b!604604))

(assert (= (and b!604604 res!388422) b!604590))

(assert (= (and b!604590 res!388413) b!604589))

(assert (= (and b!604589 res!388418) b!604598))

(assert (= (and b!604598 res!388419) b!604586))

(assert (= (and b!604586 res!388429) b!604594))

(assert (= (and b!604594 res!388415) b!604591))

(assert (= (and b!604591 res!388423) b!604605))

(assert (= (and b!604605 res!388412) b!604593))

(assert (= (and b!604605 c!68455) b!604584))

(assert (= (and b!604605 (not c!68455)) b!604603))

(assert (= (and b!604605 (not res!388420)) b!604595))

(assert (= (and b!604595 res!388411) b!604599))

(assert (= (and b!604599 (not res!388417)) b!604587))

(assert (= (and b!604587 res!388427) b!604596))

(assert (= (and b!604595 (not res!388425)) b!604601))

(assert (= (and b!604601 c!68456) b!604588))

(assert (= (and b!604601 (not c!68456)) b!604600))

(assert (= (and b!604601 (not res!388424)) b!604606))

(assert (= (and b!604606 res!388416) b!604597))

(declare-fun m!581729 () Bool)

(assert (=> b!604597 m!581729))

(assert (=> b!604597 m!581729))

(declare-fun m!581731 () Bool)

(assert (=> b!604597 m!581731))

(declare-fun m!581733 () Bool)

(assert (=> b!604604 m!581733))

(declare-fun m!581735 () Bool)

(assert (=> b!604598 m!581735))

(assert (=> b!604595 m!581729))

(declare-fun m!581737 () Bool)

(assert (=> b!604595 m!581737))

(declare-fun m!581739 () Bool)

(assert (=> b!604595 m!581739))

(declare-fun m!581741 () Bool)

(assert (=> b!604605 m!581741))

(assert (=> b!604605 m!581729))

(assert (=> b!604605 m!581737))

(declare-fun m!581743 () Bool)

(assert (=> b!604605 m!581743))

(assert (=> b!604605 m!581729))

(declare-fun m!581745 () Bool)

(assert (=> b!604605 m!581745))

(declare-fun m!581747 () Bool)

(assert (=> b!604605 m!581747))

(declare-fun m!581749 () Bool)

(assert (=> b!604605 m!581749))

(declare-fun m!581751 () Bool)

(assert (=> b!604605 m!581751))

(declare-fun m!581753 () Bool)

(assert (=> b!604591 m!581753))

(assert (=> b!604591 m!581729))

(assert (=> b!604591 m!581729))

(declare-fun m!581755 () Bool)

(assert (=> b!604591 m!581755))

(assert (=> b!604596 m!581729))

(assert (=> b!604596 m!581729))

(assert (=> b!604596 m!581731))

(declare-fun m!581757 () Bool)

(assert (=> b!604602 m!581757))

(declare-fun m!581759 () Bool)

(assert (=> b!604590 m!581759))

(declare-fun m!581761 () Bool)

(assert (=> b!604588 m!581761))

(assert (=> b!604588 m!581729))

(assert (=> b!604588 m!581729))

(declare-fun m!581763 () Bool)

(assert (=> b!604588 m!581763))

(assert (=> b!604588 m!581729))

(declare-fun m!581765 () Bool)

(assert (=> b!604588 m!581765))

(declare-fun m!581767 () Bool)

(assert (=> b!604588 m!581767))

(assert (=> b!604588 m!581729))

(declare-fun m!581769 () Bool)

(assert (=> b!604588 m!581769))

(declare-fun m!581771 () Bool)

(assert (=> b!604588 m!581771))

(declare-fun m!581773 () Bool)

(assert (=> b!604588 m!581773))

(assert (=> b!604592 m!581729))

(assert (=> b!604592 m!581729))

(declare-fun m!581775 () Bool)

(assert (=> b!604592 m!581775))

(assert (=> b!604587 m!581729))

(assert (=> b!604587 m!581729))

(declare-fun m!581777 () Bool)

(assert (=> b!604587 m!581777))

(declare-fun m!581779 () Bool)

(assert (=> start!55200 m!581779))

(declare-fun m!581781 () Bool)

(assert (=> start!55200 m!581781))

(declare-fun m!581783 () Bool)

(assert (=> b!604589 m!581783))

(assert (=> b!604599 m!581729))

(declare-fun m!581785 () Bool)

(assert (=> b!604586 m!581785))

(assert (=> b!604606 m!581729))

(assert (=> b!604606 m!581729))

(declare-fun m!581787 () Bool)

(assert (=> b!604606 m!581787))

(assert (=> b!604606 m!581729))

(declare-fun m!581789 () Bool)

(assert (=> b!604606 m!581789))

(assert (=> b!604606 m!581729))

(assert (=> b!604606 m!581777))

(assert (=> b!604594 m!581737))

(declare-fun m!581791 () Bool)

(assert (=> b!604594 m!581791))

(check-sat (not b!604605) (not start!55200) (not b!604604) (not b!604592) (not b!604587) (not b!604589) (not b!604590) (not b!604588) (not b!604591) (not b!604597) (not b!604602) (not b!604598) (not b!604596) (not b!604606))
(check-sat)
