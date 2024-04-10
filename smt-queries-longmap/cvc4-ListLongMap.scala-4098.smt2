; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56090 () Bool)

(assert start!56090)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun b!618698 () Bool)

(declare-fun e!354817 () Bool)

(declare-datatypes ((array!37560 0))(
  ( (array!37561 (arr!18026 (Array (_ BitVec 32) (_ BitVec 64))) (size!18390 (_ BitVec 32))) )
))
(declare-fun lt!285335 () array!37560)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37560)

(declare-fun arrayContainsKey!0 (array!37560 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!618698 (= e!354817 (arrayContainsKey!0 lt!285335 (select (arr!18026 a!2986) j!136) index!984))))

(declare-fun b!618699 () Bool)

(declare-fun e!354812 () Bool)

(declare-fun e!354821 () Bool)

(assert (=> b!618699 (= e!354812 e!354821)))

(declare-fun res!398635 () Bool)

(assert (=> b!618699 (=> (not res!398635) (not e!354821))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!618699 (= res!398635 (= (select (store (arr!18026 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!618699 (= lt!285335 (array!37561 (store (arr!18026 a!2986) i!1108 k!1786) (size!18390 a!2986)))))

(declare-fun b!618701 () Bool)

(declare-fun res!398625 () Bool)

(assert (=> b!618701 (=> (not res!398625) (not e!354812))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37560 (_ BitVec 32)) Bool)

(assert (=> b!618701 (= res!398625 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!618702 () Bool)

(declare-datatypes ((Unit!20388 0))(
  ( (Unit!20389) )
))
(declare-fun e!354816 () Unit!20388)

(declare-fun Unit!20390 () Unit!20388)

(assert (=> b!618702 (= e!354816 Unit!20390)))

(declare-fun b!618703 () Bool)

(declare-fun res!398620 () Bool)

(declare-fun e!354813 () Bool)

(assert (=> b!618703 (=> (not res!398620) (not e!354813))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!618703 (= res!398620 (validKeyInArray!0 (select (arr!18026 a!2986) j!136)))))

(declare-fun b!618704 () Bool)

(declare-fun e!354815 () Bool)

(assert (=> b!618704 (= e!354821 e!354815)))

(declare-fun res!398634 () Bool)

(assert (=> b!618704 (=> (not res!398634) (not e!354815))))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6466 0))(
  ( (MissingZero!6466 (index!28148 (_ BitVec 32))) (Found!6466 (index!28149 (_ BitVec 32))) (Intermediate!6466 (undefined!7278 Bool) (index!28150 (_ BitVec 32)) (x!56930 (_ BitVec 32))) (Undefined!6466) (MissingVacant!6466 (index!28151 (_ BitVec 32))) )
))
(declare-fun lt!285319 () SeekEntryResult!6466)

(assert (=> b!618704 (= res!398634 (and (= lt!285319 (Found!6466 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18026 a!2986) index!984) (select (arr!18026 a!2986) j!136))) (not (= (select (arr!18026 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37560 (_ BitVec 32)) SeekEntryResult!6466)

(assert (=> b!618704 (= lt!285319 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18026 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!618705 () Bool)

(declare-fun e!354808 () Unit!20388)

(declare-fun Unit!20391 () Unit!20388)

(assert (=> b!618705 (= e!354808 Unit!20391)))

(declare-fun b!618706 () Bool)

(declare-fun e!354819 () Unit!20388)

(declare-fun Unit!20392 () Unit!20388)

(assert (=> b!618706 (= e!354819 Unit!20392)))

(declare-fun res!398624 () Bool)

(assert (=> b!618706 (= res!398624 (= (select (store (arr!18026 a!2986) i!1108 k!1786) index!984) (select (arr!18026 a!2986) j!136)))))

(declare-fun e!354822 () Bool)

(assert (=> b!618706 (=> (not res!398624) (not e!354822))))

(assert (=> b!618706 e!354822))

(declare-fun c!70408 () Bool)

(assert (=> b!618706 (= c!70408 (bvslt j!136 index!984))))

(declare-fun lt!285334 () Unit!20388)

(declare-fun e!354818 () Unit!20388)

(assert (=> b!618706 (= lt!285334 e!354818)))

(declare-fun c!70406 () Bool)

(assert (=> b!618706 (= c!70406 (bvslt index!984 j!136))))

(declare-fun lt!285326 () Unit!20388)

(assert (=> b!618706 (= lt!285326 e!354816)))

(assert (=> b!618706 false))

(declare-fun b!618707 () Bool)

(assert (=> b!618707 false))

(declare-fun lt!285323 () Unit!20388)

(declare-datatypes ((List!12067 0))(
  ( (Nil!12064) (Cons!12063 (h!13108 (_ BitVec 64)) (t!18295 List!12067)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37560 (_ BitVec 64) (_ BitVec 32) List!12067) Unit!20388)

(assert (=> b!618707 (= lt!285323 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!285335 (select (arr!18026 a!2986) j!136) j!136 Nil!12064))))

(declare-fun arrayNoDuplicates!0 (array!37560 (_ BitVec 32) List!12067) Bool)

(assert (=> b!618707 (arrayNoDuplicates!0 lt!285335 j!136 Nil!12064)))

(declare-fun lt!285329 () Unit!20388)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37560 (_ BitVec 32) (_ BitVec 32)) Unit!20388)

(assert (=> b!618707 (= lt!285329 (lemmaNoDuplicateFromThenFromBigger!0 lt!285335 #b00000000000000000000000000000000 j!136))))

(assert (=> b!618707 (arrayNoDuplicates!0 lt!285335 #b00000000000000000000000000000000 Nil!12064)))

(declare-fun lt!285332 () Unit!20388)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37560 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12067) Unit!20388)

(assert (=> b!618707 (= lt!285332 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12064))))

(assert (=> b!618707 (arrayContainsKey!0 lt!285335 (select (arr!18026 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!285331 () Unit!20388)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37560 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20388)

(assert (=> b!618707 (= lt!285331 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!285335 (select (arr!18026 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20393 () Unit!20388)

(assert (=> b!618707 (= e!354818 Unit!20393)))

(declare-fun b!618708 () Bool)

(assert (=> b!618708 (= e!354813 e!354812)))

(declare-fun res!398627 () Bool)

(assert (=> b!618708 (=> (not res!398627) (not e!354812))))

(declare-fun lt!285318 () SeekEntryResult!6466)

(assert (=> b!618708 (= res!398627 (or (= lt!285318 (MissingZero!6466 i!1108)) (= lt!285318 (MissingVacant!6466 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37560 (_ BitVec 32)) SeekEntryResult!6466)

(assert (=> b!618708 (= lt!285318 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!618709 () Bool)

(declare-fun res!398622 () Bool)

(assert (=> b!618709 (= res!398622 (bvsge j!136 index!984))))

(declare-fun e!354814 () Bool)

(assert (=> b!618709 (=> res!398622 e!354814)))

(assert (=> b!618709 (= e!354822 e!354814)))

(declare-fun b!618710 () Bool)

(declare-fun e!354809 () Bool)

(assert (=> b!618710 (= e!354809 true)))

(assert (=> b!618710 (= (select (store (arr!18026 a!2986) i!1108 k!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!618711 () Bool)

(assert (=> b!618711 (= e!354815 (not e!354809))))

(declare-fun res!398628 () Bool)

(assert (=> b!618711 (=> res!398628 e!354809)))

(declare-fun lt!285321 () SeekEntryResult!6466)

(assert (=> b!618711 (= res!398628 (not (= lt!285321 (MissingVacant!6466 vacantSpotIndex!68))))))

(declare-fun lt!285337 () Unit!20388)

(assert (=> b!618711 (= lt!285337 e!354819)))

(declare-fun c!70407 () Bool)

(assert (=> b!618711 (= c!70407 (= lt!285321 (Found!6466 index!984)))))

(declare-fun lt!285325 () Unit!20388)

(assert (=> b!618711 (= lt!285325 e!354808)))

(declare-fun c!70409 () Bool)

(assert (=> b!618711 (= c!70409 (= lt!285321 Undefined!6466))))

(declare-fun lt!285324 () (_ BitVec 64))

(assert (=> b!618711 (= lt!285321 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!285324 lt!285335 mask!3053))))

(declare-fun e!354820 () Bool)

(assert (=> b!618711 e!354820))

(declare-fun res!398626 () Bool)

(assert (=> b!618711 (=> (not res!398626) (not e!354820))))

(declare-fun lt!285320 () (_ BitVec 32))

(declare-fun lt!285328 () SeekEntryResult!6466)

(assert (=> b!618711 (= res!398626 (= lt!285328 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!285320 vacantSpotIndex!68 lt!285324 lt!285335 mask!3053)))))

(assert (=> b!618711 (= lt!285328 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!285320 vacantSpotIndex!68 (select (arr!18026 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!618711 (= lt!285324 (select (store (arr!18026 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!285327 () Unit!20388)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37560 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20388)

(assert (=> b!618711 (= lt!285327 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!285320 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!618711 (= lt!285320 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!618712 () Bool)

(declare-fun res!398631 () Bool)

(assert (=> b!618712 (=> (not res!398631) (not e!354813))))

(assert (=> b!618712 (= res!398631 (and (= (size!18390 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18390 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18390 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!618700 () Bool)

(declare-fun res!398630 () Bool)

(assert (=> b!618700 (=> (not res!398630) (not e!354812))))

(assert (=> b!618700 (= res!398630 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12064))))

(declare-fun res!398632 () Bool)

(assert (=> start!56090 (=> (not res!398632) (not e!354813))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56090 (= res!398632 (validMask!0 mask!3053))))

(assert (=> start!56090 e!354813))

(assert (=> start!56090 true))

(declare-fun array_inv!13822 (array!37560) Bool)

(assert (=> start!56090 (array_inv!13822 a!2986)))

(declare-fun b!618713 () Bool)

(assert (=> b!618713 false))

(declare-fun lt!285322 () Unit!20388)

(assert (=> b!618713 (= lt!285322 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!285335 (select (arr!18026 a!2986) j!136) index!984 Nil!12064))))

(assert (=> b!618713 (arrayNoDuplicates!0 lt!285335 index!984 Nil!12064)))

(declare-fun lt!285336 () Unit!20388)

(assert (=> b!618713 (= lt!285336 (lemmaNoDuplicateFromThenFromBigger!0 lt!285335 #b00000000000000000000000000000000 index!984))))

(assert (=> b!618713 (arrayNoDuplicates!0 lt!285335 #b00000000000000000000000000000000 Nil!12064)))

(declare-fun lt!285330 () Unit!20388)

(assert (=> b!618713 (= lt!285330 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12064))))

(assert (=> b!618713 (arrayContainsKey!0 lt!285335 (select (arr!18026 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!285333 () Unit!20388)

(assert (=> b!618713 (= lt!285333 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!285335 (select (arr!18026 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!618713 e!354817))

(declare-fun res!398621 () Bool)

(assert (=> b!618713 (=> (not res!398621) (not e!354817))))

(assert (=> b!618713 (= res!398621 (arrayContainsKey!0 lt!285335 (select (arr!18026 a!2986) j!136) j!136))))

(declare-fun Unit!20394 () Unit!20388)

(assert (=> b!618713 (= e!354816 Unit!20394)))

(declare-fun b!618714 () Bool)

(declare-fun e!354811 () Bool)

(assert (=> b!618714 (= e!354811 (arrayContainsKey!0 lt!285335 (select (arr!18026 a!2986) j!136) index!984))))

(declare-fun b!618715 () Bool)

(declare-fun Unit!20395 () Unit!20388)

(assert (=> b!618715 (= e!354819 Unit!20395)))

(declare-fun b!618716 () Bool)

(assert (=> b!618716 (= e!354820 (= lt!285319 lt!285328))))

(declare-fun b!618717 () Bool)

(declare-fun res!398633 () Bool)

(assert (=> b!618717 (=> (not res!398633) (not e!354813))))

(assert (=> b!618717 (= res!398633 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!618718 () Bool)

(declare-fun res!398623 () Bool)

(assert (=> b!618718 (=> (not res!398623) (not e!354812))))

(assert (=> b!618718 (= res!398623 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18026 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!398629 () Bool)

(declare-fun b!618719 () Bool)

(assert (=> b!618719 (= res!398629 (arrayContainsKey!0 lt!285335 (select (arr!18026 a!2986) j!136) j!136))))

(assert (=> b!618719 (=> (not res!398629) (not e!354811))))

(assert (=> b!618719 (= e!354814 e!354811)))

(declare-fun b!618720 () Bool)

(declare-fun res!398636 () Bool)

(assert (=> b!618720 (=> (not res!398636) (not e!354813))))

(assert (=> b!618720 (= res!398636 (validKeyInArray!0 k!1786))))

(declare-fun b!618721 () Bool)

(declare-fun Unit!20396 () Unit!20388)

(assert (=> b!618721 (= e!354818 Unit!20396)))

(declare-fun b!618722 () Bool)

(declare-fun Unit!20397 () Unit!20388)

(assert (=> b!618722 (= e!354808 Unit!20397)))

(assert (=> b!618722 false))

(assert (= (and start!56090 res!398632) b!618712))

(assert (= (and b!618712 res!398631) b!618703))

(assert (= (and b!618703 res!398620) b!618720))

(assert (= (and b!618720 res!398636) b!618717))

(assert (= (and b!618717 res!398633) b!618708))

(assert (= (and b!618708 res!398627) b!618701))

(assert (= (and b!618701 res!398625) b!618700))

(assert (= (and b!618700 res!398630) b!618718))

(assert (= (and b!618718 res!398623) b!618699))

(assert (= (and b!618699 res!398635) b!618704))

(assert (= (and b!618704 res!398634) b!618711))

(assert (= (and b!618711 res!398626) b!618716))

(assert (= (and b!618711 c!70409) b!618722))

(assert (= (and b!618711 (not c!70409)) b!618705))

(assert (= (and b!618711 c!70407) b!618706))

(assert (= (and b!618711 (not c!70407)) b!618715))

(assert (= (and b!618706 res!398624) b!618709))

(assert (= (and b!618709 (not res!398622)) b!618719))

(assert (= (and b!618719 res!398629) b!618714))

(assert (= (and b!618706 c!70408) b!618707))

(assert (= (and b!618706 (not c!70408)) b!618721))

(assert (= (and b!618706 c!70406) b!618713))

(assert (= (and b!618706 (not c!70406)) b!618702))

(assert (= (and b!618713 res!398621) b!618698))

(assert (= (and b!618711 (not res!398628)) b!618710))

(declare-fun m!594721 () Bool)

(assert (=> b!618700 m!594721))

(declare-fun m!594723 () Bool)

(assert (=> b!618703 m!594723))

(assert (=> b!618703 m!594723))

(declare-fun m!594725 () Bool)

(assert (=> b!618703 m!594725))

(declare-fun m!594727 () Bool)

(assert (=> b!618718 m!594727))

(declare-fun m!594729 () Bool)

(assert (=> b!618720 m!594729))

(declare-fun m!594731 () Bool)

(assert (=> b!618704 m!594731))

(assert (=> b!618704 m!594723))

(assert (=> b!618704 m!594723))

(declare-fun m!594733 () Bool)

(assert (=> b!618704 m!594733))

(declare-fun m!594735 () Bool)

(assert (=> b!618710 m!594735))

(declare-fun m!594737 () Bool)

(assert (=> b!618710 m!594737))

(declare-fun m!594739 () Bool)

(assert (=> b!618711 m!594739))

(assert (=> b!618711 m!594723))

(assert (=> b!618711 m!594735))

(declare-fun m!594741 () Bool)

(assert (=> b!618711 m!594741))

(declare-fun m!594743 () Bool)

(assert (=> b!618711 m!594743))

(declare-fun m!594745 () Bool)

(assert (=> b!618711 m!594745))

(declare-fun m!594747 () Bool)

(assert (=> b!618711 m!594747))

(assert (=> b!618711 m!594723))

(declare-fun m!594749 () Bool)

(assert (=> b!618711 m!594749))

(assert (=> b!618698 m!594723))

(assert (=> b!618698 m!594723))

(declare-fun m!594751 () Bool)

(assert (=> b!618698 m!594751))

(declare-fun m!594753 () Bool)

(assert (=> b!618717 m!594753))

(declare-fun m!594755 () Bool)

(assert (=> start!56090 m!594755))

(declare-fun m!594757 () Bool)

(assert (=> start!56090 m!594757))

(assert (=> b!618699 m!594735))

(declare-fun m!594759 () Bool)

(assert (=> b!618699 m!594759))

(declare-fun m!594761 () Bool)

(assert (=> b!618701 m!594761))

(assert (=> b!618707 m!594723))

(declare-fun m!594763 () Bool)

(assert (=> b!618707 m!594763))

(assert (=> b!618707 m!594723))

(declare-fun m!594765 () Bool)

(assert (=> b!618707 m!594765))

(declare-fun m!594767 () Bool)

(assert (=> b!618707 m!594767))

(declare-fun m!594769 () Bool)

(assert (=> b!618707 m!594769))

(assert (=> b!618707 m!594723))

(declare-fun m!594771 () Bool)

(assert (=> b!618707 m!594771))

(assert (=> b!618707 m!594723))

(declare-fun m!594773 () Bool)

(assert (=> b!618707 m!594773))

(declare-fun m!594775 () Bool)

(assert (=> b!618707 m!594775))

(assert (=> b!618719 m!594723))

(assert (=> b!618719 m!594723))

(declare-fun m!594777 () Bool)

(assert (=> b!618719 m!594777))

(assert (=> b!618706 m!594735))

(assert (=> b!618706 m!594737))

(assert (=> b!618706 m!594723))

(declare-fun m!594779 () Bool)

(assert (=> b!618708 m!594779))

(assert (=> b!618713 m!594723))

(declare-fun m!594781 () Bool)

(assert (=> b!618713 m!594781))

(assert (=> b!618713 m!594767))

(declare-fun m!594783 () Bool)

(assert (=> b!618713 m!594783))

(assert (=> b!618713 m!594723))

(assert (=> b!618713 m!594777))

(assert (=> b!618713 m!594723))

(declare-fun m!594785 () Bool)

(assert (=> b!618713 m!594785))

(assert (=> b!618713 m!594723))

(declare-fun m!594787 () Bool)

(assert (=> b!618713 m!594787))

(assert (=> b!618713 m!594775))

(assert (=> b!618713 m!594723))

(declare-fun m!594789 () Bool)

(assert (=> b!618713 m!594789))

(assert (=> b!618714 m!594723))

(assert (=> b!618714 m!594723))

(assert (=> b!618714 m!594751))

(push 1)

