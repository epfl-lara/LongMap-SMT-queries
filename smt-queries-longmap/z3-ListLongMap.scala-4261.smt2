; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59198 () Bool)

(assert start!59198)

(declare-fun b!652862 () Bool)

(declare-fun res!423432 () Bool)

(declare-fun e!374786 () Bool)

(assert (=> b!652862 (=> (not res!423432) (not e!374786))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!38622 0))(
  ( (array!38623 (arr!18512 (Array (_ BitVec 32) (_ BitVec 64))) (size!18877 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38622)

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!652862 (= res!423432 (and (= (size!18877 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18877 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18877 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!423437 () Bool)

(assert (=> start!59198 (=> (not res!423437) (not e!374786))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59198 (= res!423437 (validMask!0 mask!3053))))

(assert (=> start!59198 e!374786))

(assert (=> start!59198 true))

(declare-fun array_inv!14395 (array!38622) Bool)

(assert (=> start!59198 (array_inv!14395 a!2986)))

(declare-fun b!652863 () Bool)

(declare-fun e!374774 () Bool)

(declare-fun e!374776 () Bool)

(assert (=> b!652863 (= e!374774 e!374776)))

(declare-fun res!423424 () Bool)

(assert (=> b!652863 (=> res!423424 e!374776)))

(declare-fun lt!303766 () (_ BitVec 64))

(declare-fun lt!303781 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!652863 (= res!423424 (or (not (= (select (arr!18512 a!2986) j!136) lt!303766)) (not (= (select (arr!18512 a!2986) j!136) lt!303781)) (bvsge j!136 index!984)))))

(declare-fun b!652864 () Bool)

(declare-datatypes ((Unit!22322 0))(
  ( (Unit!22323) )
))
(declare-fun e!374787 () Unit!22322)

(declare-fun Unit!22324 () Unit!22322)

(assert (=> b!652864 (= e!374787 Unit!22324)))

(declare-fun b!652865 () Bool)

(declare-fun e!374781 () Bool)

(declare-fun e!374784 () Bool)

(assert (=> b!652865 (= e!374781 e!374784)))

(declare-fun res!423438 () Bool)

(assert (=> b!652865 (=> res!423438 e!374784)))

(assert (=> b!652865 (= res!423438 (or (not (= (select (arr!18512 a!2986) j!136) lt!303766)) (not (= (select (arr!18512 a!2986) j!136) lt!303781))))))

(assert (=> b!652865 e!374774))

(declare-fun res!423425 () Bool)

(assert (=> b!652865 (=> (not res!423425) (not e!374774))))

(assert (=> b!652865 (= res!423425 (= lt!303781 (select (arr!18512 a!2986) j!136)))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!652865 (= lt!303781 (select (store (arr!18512 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!652866 () Bool)

(declare-fun e!374778 () Bool)

(assert (=> b!652866 (= e!374778 (not e!374781))))

(declare-fun res!423422 () Bool)

(assert (=> b!652866 (=> res!423422 e!374781)))

(declare-datatypes ((SeekEntryResult!6949 0))(
  ( (MissingZero!6949 (index!30152 (_ BitVec 32))) (Found!6949 (index!30153 (_ BitVec 32))) (Intermediate!6949 (undefined!7761 Bool) (index!30154 (_ BitVec 32)) (x!58952 (_ BitVec 32))) (Undefined!6949) (MissingVacant!6949 (index!30155 (_ BitVec 32))) )
))
(declare-fun lt!303777 () SeekEntryResult!6949)

(assert (=> b!652866 (= res!423422 (not (= lt!303777 (Found!6949 index!984))))))

(declare-fun lt!303775 () Unit!22322)

(assert (=> b!652866 (= lt!303775 e!374787)))

(declare-fun c!75090 () Bool)

(assert (=> b!652866 (= c!75090 (= lt!303777 Undefined!6949))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!303780 () array!38622)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38622 (_ BitVec 32)) SeekEntryResult!6949)

(assert (=> b!652866 (= lt!303777 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!303766 lt!303780 mask!3053))))

(declare-fun e!374789 () Bool)

(assert (=> b!652866 e!374789))

(declare-fun res!423421 () Bool)

(assert (=> b!652866 (=> (not res!423421) (not e!374789))))

(declare-fun lt!303767 () SeekEntryResult!6949)

(declare-fun lt!303783 () (_ BitVec 32))

(assert (=> b!652866 (= res!423421 (= lt!303767 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303783 vacantSpotIndex!68 lt!303766 lt!303780 mask!3053)))))

(assert (=> b!652866 (= lt!303767 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303783 vacantSpotIndex!68 (select (arr!18512 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!652866 (= lt!303766 (select (store (arr!18512 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!303773 () Unit!22322)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38622 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22322)

(assert (=> b!652866 (= lt!303773 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!303783 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!652866 (= lt!303783 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!652867 () Bool)

(declare-fun res!423423 () Bool)

(assert (=> b!652867 (=> (not res!423423) (not e!374786))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!652867 (= res!423423 (validKeyInArray!0 (select (arr!18512 a!2986) j!136)))))

(declare-fun b!652868 () Bool)

(declare-fun e!374783 () Bool)

(declare-fun e!374780 () Bool)

(assert (=> b!652868 (= e!374783 e!374780)))

(declare-fun res!423439 () Bool)

(assert (=> b!652868 (=> (not res!423439) (not e!374780))))

(assert (=> b!652868 (= res!423439 (= (select (store (arr!18512 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!652868 (= lt!303780 (array!38623 (store (arr!18512 a!2986) i!1108 k0!1786) (size!18877 a!2986)))))

(declare-fun e!374777 () Bool)

(declare-fun b!652869 () Bool)

(declare-fun arrayContainsKey!0 (array!38622 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!652869 (= e!374777 (arrayContainsKey!0 lt!303780 (select (arr!18512 a!2986) j!136) index!984))))

(declare-fun b!652870 () Bool)

(assert (=> b!652870 (= e!374786 e!374783)))

(declare-fun res!423418 () Bool)

(assert (=> b!652870 (=> (not res!423418) (not e!374783))))

(declare-fun lt!303774 () SeekEntryResult!6949)

(assert (=> b!652870 (= res!423418 (or (= lt!303774 (MissingZero!6949 i!1108)) (= lt!303774 (MissingVacant!6949 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38622 (_ BitVec 32)) SeekEntryResult!6949)

(assert (=> b!652870 (= lt!303774 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!652871 () Bool)

(declare-fun res!423436 () Bool)

(assert (=> b!652871 (=> (not res!423436) (not e!374786))))

(assert (=> b!652871 (= res!423436 (validKeyInArray!0 k0!1786))))

(declare-fun b!652872 () Bool)

(declare-fun res!423435 () Bool)

(assert (=> b!652872 (=> (not res!423435) (not e!374786))))

(assert (=> b!652872 (= res!423435 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!652873 () Bool)

(declare-fun e!374782 () Unit!22322)

(declare-fun Unit!22325 () Unit!22322)

(assert (=> b!652873 (= e!374782 Unit!22325)))

(declare-fun lt!303776 () Unit!22322)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38622 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22322)

(assert (=> b!652873 (= lt!303776 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!303780 (select (arr!18512 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!652873 (arrayContainsKey!0 lt!303780 (select (arr!18512 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!303772 () Unit!22322)

(declare-datatypes ((List!12592 0))(
  ( (Nil!12589) (Cons!12588 (h!13633 (_ BitVec 64)) (t!18811 List!12592)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38622 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12592) Unit!22322)

(assert (=> b!652873 (= lt!303772 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12589))))

(declare-fun arrayNoDuplicates!0 (array!38622 (_ BitVec 32) List!12592) Bool)

(assert (=> b!652873 (arrayNoDuplicates!0 lt!303780 #b00000000000000000000000000000000 Nil!12589)))

(declare-fun lt!303771 () Unit!22322)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38622 (_ BitVec 32) (_ BitVec 32)) Unit!22322)

(assert (=> b!652873 (= lt!303771 (lemmaNoDuplicateFromThenFromBigger!0 lt!303780 #b00000000000000000000000000000000 j!136))))

(assert (=> b!652873 (arrayNoDuplicates!0 lt!303780 j!136 Nil!12589)))

(declare-fun lt!303769 () Unit!22322)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38622 (_ BitVec 64) (_ BitVec 32) List!12592) Unit!22322)

(assert (=> b!652873 (= lt!303769 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!303780 (select (arr!18512 a!2986) j!136) j!136 Nil!12589))))

(assert (=> b!652873 false))

(declare-fun b!652874 () Bool)

(declare-fun res!423431 () Bool)

(declare-fun e!374779 () Bool)

(assert (=> b!652874 (=> res!423431 e!374779)))

(declare-fun noDuplicate!443 (List!12592) Bool)

(assert (=> b!652874 (= res!423431 (not (noDuplicate!443 Nil!12589)))))

(declare-fun b!652875 () Bool)

(declare-fun res!423429 () Bool)

(assert (=> b!652875 (=> (not res!423429) (not e!374783))))

(assert (=> b!652875 (= res!423429 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18512 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!652876 () Bool)

(declare-fun Unit!22326 () Unit!22322)

(assert (=> b!652876 (= e!374787 Unit!22326)))

(assert (=> b!652876 false))

(declare-fun b!652877 () Bool)

(declare-fun res!423427 () Bool)

(assert (=> b!652877 (=> (not res!423427) (not e!374783))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38622 (_ BitVec 32)) Bool)

(assert (=> b!652877 (= res!423427 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!652878 () Bool)

(assert (=> b!652878 (= e!374780 e!374778)))

(declare-fun res!423419 () Bool)

(assert (=> b!652878 (=> (not res!423419) (not e!374778))))

(declare-fun lt!303768 () SeekEntryResult!6949)

(assert (=> b!652878 (= res!423419 (and (= lt!303768 (Found!6949 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18512 a!2986) index!984) (select (arr!18512 a!2986) j!136))) (not (= (select (arr!18512 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!652878 (= lt!303768 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18512 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!652879 () Bool)

(declare-fun res!423430 () Bool)

(assert (=> b!652879 (=> (not res!423430) (not e!374783))))

(assert (=> b!652879 (= res!423430 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12589))))

(declare-fun b!652880 () Bool)

(assert (=> b!652880 (= e!374789 (= lt!303768 lt!303767))))

(declare-fun e!374788 () Bool)

(declare-fun b!652881 () Bool)

(assert (=> b!652881 (= e!374788 (arrayContainsKey!0 lt!303780 (select (arr!18512 a!2986) j!136) index!984))))

(declare-fun b!652882 () Bool)

(declare-fun e!374773 () Bool)

(assert (=> b!652882 (= e!374784 e!374773)))

(declare-fun res!423434 () Bool)

(assert (=> b!652882 (=> res!423434 e!374773)))

(assert (=> b!652882 (= res!423434 (bvsge index!984 j!136))))

(declare-fun lt!303778 () Unit!22322)

(assert (=> b!652882 (= lt!303778 e!374782)))

(declare-fun c!75089 () Bool)

(assert (=> b!652882 (= c!75089 (bvslt j!136 index!984))))

(declare-fun b!652883 () Bool)

(declare-fun e!374775 () Bool)

(declare-fun contains!3165 (List!12592 (_ BitVec 64)) Bool)

(assert (=> b!652883 (= e!374775 (not (contains!3165 Nil!12589 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!652884 () Bool)

(declare-fun Unit!22327 () Unit!22322)

(assert (=> b!652884 (= e!374782 Unit!22327)))

(declare-fun b!652885 () Bool)

(assert (=> b!652885 (= e!374776 e!374788)))

(declare-fun res!423428 () Bool)

(assert (=> b!652885 (=> (not res!423428) (not e!374788))))

(assert (=> b!652885 (= res!423428 (arrayContainsKey!0 lt!303780 (select (arr!18512 a!2986) j!136) j!136))))

(declare-fun b!652886 () Bool)

(assert (=> b!652886 (= e!374773 e!374779)))

(declare-fun res!423420 () Bool)

(assert (=> b!652886 (=> res!423420 e!374779)))

(assert (=> b!652886 (= res!423420 (or (bvsge (size!18877 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 index!984) (size!18877 a!2986)) (bvsge index!984 (size!18877 a!2986))))))

(assert (=> b!652886 (arrayNoDuplicates!0 lt!303780 index!984 Nil!12589)))

(declare-fun lt!303779 () Unit!22322)

(assert (=> b!652886 (= lt!303779 (lemmaNoDuplicateFromThenFromBigger!0 lt!303780 #b00000000000000000000000000000000 index!984))))

(assert (=> b!652886 (arrayNoDuplicates!0 lt!303780 #b00000000000000000000000000000000 Nil!12589)))

(declare-fun lt!303770 () Unit!22322)

(assert (=> b!652886 (= lt!303770 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12589))))

(assert (=> b!652886 (arrayContainsKey!0 lt!303780 (select (arr!18512 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!303782 () Unit!22322)

(assert (=> b!652886 (= lt!303782 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!303780 (select (arr!18512 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!652886 e!374777))

(declare-fun res!423433 () Bool)

(assert (=> b!652886 (=> (not res!423433) (not e!374777))))

(assert (=> b!652886 (= res!423433 (arrayContainsKey!0 lt!303780 (select (arr!18512 a!2986) j!136) j!136))))

(declare-fun b!652887 () Bool)

(assert (=> b!652887 (= e!374779 e!374775)))

(declare-fun res!423426 () Bool)

(assert (=> b!652887 (=> (not res!423426) (not e!374775))))

(assert (=> b!652887 (= res!423426 (not (contains!3165 Nil!12589 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!59198 res!423437) b!652862))

(assert (= (and b!652862 res!423432) b!652867))

(assert (= (and b!652867 res!423423) b!652871))

(assert (= (and b!652871 res!423436) b!652872))

(assert (= (and b!652872 res!423435) b!652870))

(assert (= (and b!652870 res!423418) b!652877))

(assert (= (and b!652877 res!423427) b!652879))

(assert (= (and b!652879 res!423430) b!652875))

(assert (= (and b!652875 res!423429) b!652868))

(assert (= (and b!652868 res!423439) b!652878))

(assert (= (and b!652878 res!423419) b!652866))

(assert (= (and b!652866 res!423421) b!652880))

(assert (= (and b!652866 c!75090) b!652876))

(assert (= (and b!652866 (not c!75090)) b!652864))

(assert (= (and b!652866 (not res!423422)) b!652865))

(assert (= (and b!652865 res!423425) b!652863))

(assert (= (and b!652863 (not res!423424)) b!652885))

(assert (= (and b!652885 res!423428) b!652881))

(assert (= (and b!652865 (not res!423438)) b!652882))

(assert (= (and b!652882 c!75089) b!652873))

(assert (= (and b!652882 (not c!75089)) b!652884))

(assert (= (and b!652882 (not res!423434)) b!652886))

(assert (= (and b!652886 res!423433) b!652869))

(assert (= (and b!652886 (not res!423420)) b!652874))

(assert (= (and b!652874 (not res!423431)) b!652887))

(assert (= (and b!652887 res!423426) b!652883))

(declare-fun m!625503 () Bool)

(assert (=> b!652885 m!625503))

(assert (=> b!652885 m!625503))

(declare-fun m!625505 () Bool)

(assert (=> b!652885 m!625505))

(declare-fun m!625507 () Bool)

(assert (=> b!652870 m!625507))

(declare-fun m!625509 () Bool)

(assert (=> b!652873 m!625509))

(assert (=> b!652873 m!625503))

(declare-fun m!625511 () Bool)

(assert (=> b!652873 m!625511))

(assert (=> b!652873 m!625503))

(assert (=> b!652873 m!625503))

(declare-fun m!625513 () Bool)

(assert (=> b!652873 m!625513))

(declare-fun m!625515 () Bool)

(assert (=> b!652873 m!625515))

(assert (=> b!652873 m!625503))

(declare-fun m!625517 () Bool)

(assert (=> b!652873 m!625517))

(declare-fun m!625519 () Bool)

(assert (=> b!652873 m!625519))

(declare-fun m!625521 () Bool)

(assert (=> b!652873 m!625521))

(declare-fun m!625523 () Bool)

(assert (=> b!652878 m!625523))

(assert (=> b!652878 m!625503))

(assert (=> b!652878 m!625503))

(declare-fun m!625525 () Bool)

(assert (=> b!652878 m!625525))

(declare-fun m!625527 () Bool)

(assert (=> b!652879 m!625527))

(assert (=> b!652886 m!625503))

(assert (=> b!652886 m!625503))

(assert (=> b!652886 m!625505))

(assert (=> b!652886 m!625503))

(declare-fun m!625529 () Bool)

(assert (=> b!652886 m!625529))

(declare-fun m!625531 () Bool)

(assert (=> b!652886 m!625531))

(assert (=> b!652886 m!625503))

(declare-fun m!625533 () Bool)

(assert (=> b!652886 m!625533))

(declare-fun m!625535 () Bool)

(assert (=> b!652886 m!625535))

(assert (=> b!652886 m!625519))

(assert (=> b!652886 m!625521))

(assert (=> b!652865 m!625503))

(declare-fun m!625537 () Bool)

(assert (=> b!652865 m!625537))

(declare-fun m!625539 () Bool)

(assert (=> b!652865 m!625539))

(declare-fun m!625541 () Bool)

(assert (=> b!652871 m!625541))

(assert (=> b!652869 m!625503))

(assert (=> b!652869 m!625503))

(declare-fun m!625543 () Bool)

(assert (=> b!652869 m!625543))

(declare-fun m!625545 () Bool)

(assert (=> b!652887 m!625545))

(declare-fun m!625547 () Bool)

(assert (=> b!652875 m!625547))

(assert (=> b!652867 m!625503))

(assert (=> b!652867 m!625503))

(declare-fun m!625549 () Bool)

(assert (=> b!652867 m!625549))

(declare-fun m!625551 () Bool)

(assert (=> b!652866 m!625551))

(assert (=> b!652866 m!625503))

(declare-fun m!625553 () Bool)

(assert (=> b!652866 m!625553))

(declare-fun m!625555 () Bool)

(assert (=> b!652866 m!625555))

(declare-fun m!625557 () Bool)

(assert (=> b!652866 m!625557))

(declare-fun m!625559 () Bool)

(assert (=> b!652866 m!625559))

(assert (=> b!652866 m!625537))

(assert (=> b!652866 m!625503))

(declare-fun m!625561 () Bool)

(assert (=> b!652866 m!625561))

(declare-fun m!625563 () Bool)

(assert (=> b!652872 m!625563))

(declare-fun m!625565 () Bool)

(assert (=> b!652877 m!625565))

(assert (=> b!652868 m!625537))

(declare-fun m!625567 () Bool)

(assert (=> b!652868 m!625567))

(declare-fun m!625569 () Bool)

(assert (=> b!652883 m!625569))

(assert (=> b!652863 m!625503))

(declare-fun m!625571 () Bool)

(assert (=> b!652874 m!625571))

(assert (=> b!652881 m!625503))

(assert (=> b!652881 m!625503))

(assert (=> b!652881 m!625543))

(declare-fun m!625573 () Bool)

(assert (=> start!59198 m!625573))

(declare-fun m!625575 () Bool)

(assert (=> start!59198 m!625575))

(check-sat (not b!652871) (not b!652869) (not b!652877) (not b!652885) (not b!652874) (not start!59198) (not b!652883) (not b!652872) (not b!652879) (not b!652866) (not b!652881) (not b!652873) (not b!652878) (not b!652886) (not b!652870) (not b!652867) (not b!652887))
(check-sat)
(get-model)

(declare-fun d!92175 () Bool)

(declare-fun res!423576 () Bool)

(declare-fun e!374896 () Bool)

(assert (=> d!92175 (=> res!423576 e!374896)))

(assert (=> d!92175 (= res!423576 (= (select (arr!18512 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!92175 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!374896)))

(declare-fun b!653048 () Bool)

(declare-fun e!374897 () Bool)

(assert (=> b!653048 (= e!374896 e!374897)))

(declare-fun res!423577 () Bool)

(assert (=> b!653048 (=> (not res!423577) (not e!374897))))

(assert (=> b!653048 (= res!423577 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18877 a!2986)))))

(declare-fun b!653049 () Bool)

(assert (=> b!653049 (= e!374897 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!92175 (not res!423576)) b!653048))

(assert (= (and b!653048 res!423577) b!653049))

(declare-fun m!625725 () Bool)

(assert (=> d!92175 m!625725))

(declare-fun m!625727 () Bool)

(assert (=> b!653049 m!625727))

(assert (=> b!652872 d!92175))

(declare-fun d!92177 () Bool)

(declare-fun lt!303894 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!253 (List!12592) (InoxSet (_ BitVec 64)))

(assert (=> d!92177 (= lt!303894 (select (content!253 Nil!12589) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!374903 () Bool)

(assert (=> d!92177 (= lt!303894 e!374903)))

(declare-fun res!423583 () Bool)

(assert (=> d!92177 (=> (not res!423583) (not e!374903))))

(get-info :version)

(assert (=> d!92177 (= res!423583 ((_ is Cons!12588) Nil!12589))))

(assert (=> d!92177 (= (contains!3165 Nil!12589 #b1000000000000000000000000000000000000000000000000000000000000000) lt!303894)))

(declare-fun b!653054 () Bool)

(declare-fun e!374902 () Bool)

(assert (=> b!653054 (= e!374903 e!374902)))

(declare-fun res!423582 () Bool)

(assert (=> b!653054 (=> res!423582 e!374902)))

(assert (=> b!653054 (= res!423582 (= (h!13633 Nil!12589) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!653055 () Bool)

(assert (=> b!653055 (= e!374902 (contains!3165 (t!18811 Nil!12589) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!92177 res!423583) b!653054))

(assert (= (and b!653054 (not res!423582)) b!653055))

(declare-fun m!625729 () Bool)

(assert (=> d!92177 m!625729))

(declare-fun m!625731 () Bool)

(assert (=> d!92177 m!625731))

(declare-fun m!625733 () Bool)

(assert (=> b!653055 m!625733))

(assert (=> b!652883 d!92177))

(declare-fun b!653068 () Bool)

(declare-fun c!75109 () Bool)

(declare-fun lt!303903 () (_ BitVec 64))

(assert (=> b!653068 (= c!75109 (= lt!303903 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!374912 () SeekEntryResult!6949)

(declare-fun e!374911 () SeekEntryResult!6949)

(assert (=> b!653068 (= e!374912 e!374911)))

(declare-fun d!92179 () Bool)

(declare-fun lt!303902 () SeekEntryResult!6949)

(assert (=> d!92179 (and (or ((_ is Undefined!6949) lt!303902) (not ((_ is Found!6949) lt!303902)) (and (bvsge (index!30153 lt!303902) #b00000000000000000000000000000000) (bvslt (index!30153 lt!303902) (size!18877 a!2986)))) (or ((_ is Undefined!6949) lt!303902) ((_ is Found!6949) lt!303902) (not ((_ is MissingZero!6949) lt!303902)) (and (bvsge (index!30152 lt!303902) #b00000000000000000000000000000000) (bvslt (index!30152 lt!303902) (size!18877 a!2986)))) (or ((_ is Undefined!6949) lt!303902) ((_ is Found!6949) lt!303902) ((_ is MissingZero!6949) lt!303902) (not ((_ is MissingVacant!6949) lt!303902)) (and (bvsge (index!30155 lt!303902) #b00000000000000000000000000000000) (bvslt (index!30155 lt!303902) (size!18877 a!2986)))) (or ((_ is Undefined!6949) lt!303902) (ite ((_ is Found!6949) lt!303902) (= (select (arr!18512 a!2986) (index!30153 lt!303902)) k0!1786) (ite ((_ is MissingZero!6949) lt!303902) (= (select (arr!18512 a!2986) (index!30152 lt!303902)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6949) lt!303902) (= (select (arr!18512 a!2986) (index!30155 lt!303902)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!374910 () SeekEntryResult!6949)

(assert (=> d!92179 (= lt!303902 e!374910)))

(declare-fun c!75110 () Bool)

(declare-fun lt!303901 () SeekEntryResult!6949)

(assert (=> d!92179 (= c!75110 (and ((_ is Intermediate!6949) lt!303901) (undefined!7761 lt!303901)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38622 (_ BitVec 32)) SeekEntryResult!6949)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!92179 (= lt!303901 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!92179 (validMask!0 mask!3053)))

(assert (=> d!92179 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!303902)))

(declare-fun b!653069 () Bool)

(assert (=> b!653069 (= e!374910 Undefined!6949)))

(declare-fun b!653070 () Bool)

(assert (=> b!653070 (= e!374910 e!374912)))

(assert (=> b!653070 (= lt!303903 (select (arr!18512 a!2986) (index!30154 lt!303901)))))

(declare-fun c!75111 () Bool)

(assert (=> b!653070 (= c!75111 (= lt!303903 k0!1786))))

(declare-fun b!653071 () Bool)

(assert (=> b!653071 (= e!374911 (MissingZero!6949 (index!30154 lt!303901)))))

(declare-fun b!653072 () Bool)

(assert (=> b!653072 (= e!374912 (Found!6949 (index!30154 lt!303901)))))

(declare-fun b!653073 () Bool)

(assert (=> b!653073 (= e!374911 (seekKeyOrZeroReturnVacant!0 (x!58952 lt!303901) (index!30154 lt!303901) (index!30154 lt!303901) k0!1786 a!2986 mask!3053))))

(assert (= (and d!92179 c!75110) b!653069))

(assert (= (and d!92179 (not c!75110)) b!653070))

(assert (= (and b!653070 c!75111) b!653072))

(assert (= (and b!653070 (not c!75111)) b!653068))

(assert (= (and b!653068 c!75109) b!653071))

(assert (= (and b!653068 (not c!75109)) b!653073))

(assert (=> d!92179 m!625573))

(declare-fun m!625735 () Bool)

(assert (=> d!92179 m!625735))

(declare-fun m!625737 () Bool)

(assert (=> d!92179 m!625737))

(declare-fun m!625739 () Bool)

(assert (=> d!92179 m!625739))

(declare-fun m!625741 () Bool)

(assert (=> d!92179 m!625741))

(declare-fun m!625743 () Bool)

(assert (=> d!92179 m!625743))

(assert (=> d!92179 m!625735))

(declare-fun m!625745 () Bool)

(assert (=> b!653070 m!625745))

(declare-fun m!625747 () Bool)

(assert (=> b!653073 m!625747))

(assert (=> b!652870 d!92179))

(declare-fun d!92181 () Bool)

(declare-fun res!423584 () Bool)

(declare-fun e!374913 () Bool)

(assert (=> d!92181 (=> res!423584 e!374913)))

(assert (=> d!92181 (= res!423584 (= (select (arr!18512 lt!303780) index!984) (select (arr!18512 a!2986) j!136)))))

(assert (=> d!92181 (= (arrayContainsKey!0 lt!303780 (select (arr!18512 a!2986) j!136) index!984) e!374913)))

(declare-fun b!653074 () Bool)

(declare-fun e!374914 () Bool)

(assert (=> b!653074 (= e!374913 e!374914)))

(declare-fun res!423585 () Bool)

(assert (=> b!653074 (=> (not res!423585) (not e!374914))))

(assert (=> b!653074 (= res!423585 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18877 lt!303780)))))

(declare-fun b!653075 () Bool)

(assert (=> b!653075 (= e!374914 (arrayContainsKey!0 lt!303780 (select (arr!18512 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!92181 (not res!423584)) b!653074))

(assert (= (and b!653074 res!423585) b!653075))

(declare-fun m!625749 () Bool)

(assert (=> d!92181 m!625749))

(assert (=> b!653075 m!625503))

(declare-fun m!625751 () Bool)

(assert (=> b!653075 m!625751))

(assert (=> b!652881 d!92181))

(declare-fun d!92183 () Bool)

(assert (=> d!92183 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!652871 d!92183))

(assert (=> b!652869 d!92181))

(declare-fun b!653088 () Bool)

(declare-fun e!374921 () SeekEntryResult!6949)

(declare-fun e!374923 () SeekEntryResult!6949)

(assert (=> b!653088 (= e!374921 e!374923)))

(declare-fun c!75120 () Bool)

(declare-fun lt!303909 () (_ BitVec 64))

(assert (=> b!653088 (= c!75120 (= lt!303909 (select (arr!18512 a!2986) j!136)))))

(declare-fun b!653089 () Bool)

(assert (=> b!653089 (= e!374923 (Found!6949 index!984))))

(declare-fun b!653090 () Bool)

(declare-fun c!75118 () Bool)

(assert (=> b!653090 (= c!75118 (= lt!303909 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!374922 () SeekEntryResult!6949)

(assert (=> b!653090 (= e!374923 e!374922)))

(declare-fun lt!303908 () SeekEntryResult!6949)

(declare-fun d!92185 () Bool)

(assert (=> d!92185 (and (or ((_ is Undefined!6949) lt!303908) (not ((_ is Found!6949) lt!303908)) (and (bvsge (index!30153 lt!303908) #b00000000000000000000000000000000) (bvslt (index!30153 lt!303908) (size!18877 a!2986)))) (or ((_ is Undefined!6949) lt!303908) ((_ is Found!6949) lt!303908) (not ((_ is MissingVacant!6949) lt!303908)) (not (= (index!30155 lt!303908) vacantSpotIndex!68)) (and (bvsge (index!30155 lt!303908) #b00000000000000000000000000000000) (bvslt (index!30155 lt!303908) (size!18877 a!2986)))) (or ((_ is Undefined!6949) lt!303908) (ite ((_ is Found!6949) lt!303908) (= (select (arr!18512 a!2986) (index!30153 lt!303908)) (select (arr!18512 a!2986) j!136)) (and ((_ is MissingVacant!6949) lt!303908) (= (index!30155 lt!303908) vacantSpotIndex!68) (= (select (arr!18512 a!2986) (index!30155 lt!303908)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92185 (= lt!303908 e!374921)))

(declare-fun c!75119 () Bool)

(assert (=> d!92185 (= c!75119 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!92185 (= lt!303909 (select (arr!18512 a!2986) index!984))))

(assert (=> d!92185 (validMask!0 mask!3053)))

(assert (=> d!92185 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18512 a!2986) j!136) a!2986 mask!3053) lt!303908)))

(declare-fun b!653091 () Bool)

(assert (=> b!653091 (= e!374922 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18512 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!653092 () Bool)

(assert (=> b!653092 (= e!374922 (MissingVacant!6949 vacantSpotIndex!68))))

(declare-fun b!653093 () Bool)

(assert (=> b!653093 (= e!374921 Undefined!6949)))

(assert (= (and d!92185 c!75119) b!653093))

(assert (= (and d!92185 (not c!75119)) b!653088))

(assert (= (and b!653088 c!75120) b!653089))

(assert (= (and b!653088 (not c!75120)) b!653090))

(assert (= (and b!653090 c!75118) b!653092))

(assert (= (and b!653090 (not c!75118)) b!653091))

(declare-fun m!625753 () Bool)

(assert (=> d!92185 m!625753))

(declare-fun m!625755 () Bool)

(assert (=> d!92185 m!625755))

(assert (=> d!92185 m!625523))

(assert (=> d!92185 m!625573))

(assert (=> b!653091 m!625551))

(assert (=> b!653091 m!625551))

(assert (=> b!653091 m!625503))

(declare-fun m!625757 () Bool)

(assert (=> b!653091 m!625757))

(assert (=> b!652878 d!92185))

(declare-fun b!653104 () Bool)

(declare-fun e!374934 () Bool)

(declare-fun e!374935 () Bool)

(assert (=> b!653104 (= e!374934 e!374935)))

(declare-fun res!423592 () Bool)

(assert (=> b!653104 (=> (not res!423592) (not e!374935))))

(declare-fun e!374933 () Bool)

(assert (=> b!653104 (= res!423592 (not e!374933))))

(declare-fun res!423594 () Bool)

(assert (=> b!653104 (=> (not res!423594) (not e!374933))))

(assert (=> b!653104 (= res!423594 (validKeyInArray!0 (select (arr!18512 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33778 () Bool)

(declare-fun call!33781 () Bool)

(declare-fun c!75123 () Bool)

(assert (=> bm!33778 (= call!33781 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!75123 (Cons!12588 (select (arr!18512 a!2986) #b00000000000000000000000000000000) Nil!12589) Nil!12589)))))

(declare-fun b!653105 () Bool)

(declare-fun e!374932 () Bool)

(assert (=> b!653105 (= e!374932 call!33781)))

(declare-fun b!653106 () Bool)

(assert (=> b!653106 (= e!374932 call!33781)))

(declare-fun b!653107 () Bool)

(assert (=> b!653107 (= e!374935 e!374932)))

(assert (=> b!653107 (= c!75123 (validKeyInArray!0 (select (arr!18512 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!653108 () Bool)

(assert (=> b!653108 (= e!374933 (contains!3165 Nil!12589 (select (arr!18512 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!92187 () Bool)

(declare-fun res!423593 () Bool)

(assert (=> d!92187 (=> res!423593 e!374934)))

(assert (=> d!92187 (= res!423593 (bvsge #b00000000000000000000000000000000 (size!18877 a!2986)))))

(assert (=> d!92187 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12589) e!374934)))

(assert (= (and d!92187 (not res!423593)) b!653104))

(assert (= (and b!653104 res!423594) b!653108))

(assert (= (and b!653104 res!423592) b!653107))

(assert (= (and b!653107 c!75123) b!653105))

(assert (= (and b!653107 (not c!75123)) b!653106))

(assert (= (or b!653105 b!653106) bm!33778))

(assert (=> b!653104 m!625725))

(assert (=> b!653104 m!625725))

(declare-fun m!625759 () Bool)

(assert (=> b!653104 m!625759))

(assert (=> bm!33778 m!625725))

(declare-fun m!625761 () Bool)

(assert (=> bm!33778 m!625761))

(assert (=> b!653107 m!625725))

(assert (=> b!653107 m!625725))

(assert (=> b!653107 m!625759))

(assert (=> b!653108 m!625725))

(assert (=> b!653108 m!625725))

(declare-fun m!625763 () Bool)

(assert (=> b!653108 m!625763))

(assert (=> b!652879 d!92187))

(declare-fun b!653109 () Bool)

(declare-fun e!374936 () SeekEntryResult!6949)

(declare-fun e!374938 () SeekEntryResult!6949)

(assert (=> b!653109 (= e!374936 e!374938)))

(declare-fun c!75126 () Bool)

(declare-fun lt!303911 () (_ BitVec 64))

(assert (=> b!653109 (= c!75126 (= lt!303911 (select (arr!18512 a!2986) j!136)))))

(declare-fun b!653110 () Bool)

(assert (=> b!653110 (= e!374938 (Found!6949 lt!303783))))

(declare-fun b!653111 () Bool)

(declare-fun c!75124 () Bool)

(assert (=> b!653111 (= c!75124 (= lt!303911 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!374937 () SeekEntryResult!6949)

(assert (=> b!653111 (= e!374938 e!374937)))

(declare-fun lt!303910 () SeekEntryResult!6949)

(declare-fun d!92189 () Bool)

(assert (=> d!92189 (and (or ((_ is Undefined!6949) lt!303910) (not ((_ is Found!6949) lt!303910)) (and (bvsge (index!30153 lt!303910) #b00000000000000000000000000000000) (bvslt (index!30153 lt!303910) (size!18877 a!2986)))) (or ((_ is Undefined!6949) lt!303910) ((_ is Found!6949) lt!303910) (not ((_ is MissingVacant!6949) lt!303910)) (not (= (index!30155 lt!303910) vacantSpotIndex!68)) (and (bvsge (index!30155 lt!303910) #b00000000000000000000000000000000) (bvslt (index!30155 lt!303910) (size!18877 a!2986)))) (or ((_ is Undefined!6949) lt!303910) (ite ((_ is Found!6949) lt!303910) (= (select (arr!18512 a!2986) (index!30153 lt!303910)) (select (arr!18512 a!2986) j!136)) (and ((_ is MissingVacant!6949) lt!303910) (= (index!30155 lt!303910) vacantSpotIndex!68) (= (select (arr!18512 a!2986) (index!30155 lt!303910)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92189 (= lt!303910 e!374936)))

(declare-fun c!75125 () Bool)

(assert (=> d!92189 (= c!75125 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!92189 (= lt!303911 (select (arr!18512 a!2986) lt!303783))))

(assert (=> d!92189 (validMask!0 mask!3053)))

(assert (=> d!92189 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303783 vacantSpotIndex!68 (select (arr!18512 a!2986) j!136) a!2986 mask!3053) lt!303910)))

(declare-fun b!653112 () Bool)

(assert (=> b!653112 (= e!374937 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!303783 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18512 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!653113 () Bool)

(assert (=> b!653113 (= e!374937 (MissingVacant!6949 vacantSpotIndex!68))))

(declare-fun b!653114 () Bool)

(assert (=> b!653114 (= e!374936 Undefined!6949)))

(assert (= (and d!92189 c!75125) b!653114))

(assert (= (and d!92189 (not c!75125)) b!653109))

(assert (= (and b!653109 c!75126) b!653110))

(assert (= (and b!653109 (not c!75126)) b!653111))

(assert (= (and b!653111 c!75124) b!653113))

(assert (= (and b!653111 (not c!75124)) b!653112))

(declare-fun m!625765 () Bool)

(assert (=> d!92189 m!625765))

(declare-fun m!625767 () Bool)

(assert (=> d!92189 m!625767))

(declare-fun m!625769 () Bool)

(assert (=> d!92189 m!625769))

(assert (=> d!92189 m!625573))

(declare-fun m!625771 () Bool)

(assert (=> b!653112 m!625771))

(assert (=> b!653112 m!625771))

(assert (=> b!653112 m!625503))

(declare-fun m!625773 () Bool)

(assert (=> b!653112 m!625773))

(assert (=> b!652866 d!92189))

(declare-fun d!92191 () Bool)

(declare-fun e!374959 () Bool)

(assert (=> d!92191 e!374959))

(declare-fun res!423613 () Bool)

(assert (=> d!92191 (=> (not res!423613) (not e!374959))))

(assert (=> d!92191 (= res!423613 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18877 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18877 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18877 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18877 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18877 a!2986))))))

(declare-fun lt!303917 () Unit!22322)

(declare-fun choose!9 (array!38622 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22322)

(assert (=> d!92191 (= lt!303917 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!303783 vacantSpotIndex!68 mask!3053))))

(assert (=> d!92191 (validMask!0 mask!3053)))

(assert (=> d!92191 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!303783 vacantSpotIndex!68 mask!3053) lt!303917)))

(declare-fun b!653137 () Bool)

(assert (=> b!653137 (= e!374959 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303783 vacantSpotIndex!68 (select (arr!18512 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303783 vacantSpotIndex!68 (select (store (arr!18512 a!2986) i!1108 k0!1786) j!136) (array!38623 (store (arr!18512 a!2986) i!1108 k0!1786) (size!18877 a!2986)) mask!3053)))))

(assert (= (and d!92191 res!423613) b!653137))

(declare-fun m!625789 () Bool)

(assert (=> d!92191 m!625789))

(assert (=> d!92191 m!625573))

(assert (=> b!653137 m!625559))

(declare-fun m!625791 () Bool)

(assert (=> b!653137 m!625791))

(assert (=> b!653137 m!625503))

(assert (=> b!653137 m!625559))

(assert (=> b!653137 m!625503))

(assert (=> b!653137 m!625561))

(assert (=> b!653137 m!625537))

(assert (=> b!652866 d!92191))

(declare-fun d!92207 () Bool)

(declare-fun lt!303920 () (_ BitVec 32))

(assert (=> d!92207 (and (bvsge lt!303920 #b00000000000000000000000000000000) (bvslt lt!303920 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!92207 (= lt!303920 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!92207 (validMask!0 mask!3053)))

(assert (=> d!92207 (= (nextIndex!0 index!984 x!910 mask!3053) lt!303920)))

(declare-fun bs!19444 () Bool)

(assert (= bs!19444 d!92207))

(declare-fun m!625801 () Bool)

(assert (=> bs!19444 m!625801))

(assert (=> bs!19444 m!625573))

(assert (=> b!652866 d!92207))

(declare-fun b!653150 () Bool)

(declare-fun e!374972 () SeekEntryResult!6949)

(declare-fun e!374976 () SeekEntryResult!6949)

(assert (=> b!653150 (= e!374972 e!374976)))

(declare-fun c!75133 () Bool)

(declare-fun lt!303922 () (_ BitVec 64))

(assert (=> b!653150 (= c!75133 (= lt!303922 lt!303766))))

(declare-fun b!653152 () Bool)

(assert (=> b!653152 (= e!374976 (Found!6949 lt!303783))))

(declare-fun b!653154 () Bool)

(declare-fun c!75131 () Bool)

(assert (=> b!653154 (= c!75131 (= lt!303922 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!374974 () SeekEntryResult!6949)

(assert (=> b!653154 (= e!374976 e!374974)))

(declare-fun d!92211 () Bool)

(declare-fun lt!303921 () SeekEntryResult!6949)

(assert (=> d!92211 (and (or ((_ is Undefined!6949) lt!303921) (not ((_ is Found!6949) lt!303921)) (and (bvsge (index!30153 lt!303921) #b00000000000000000000000000000000) (bvslt (index!30153 lt!303921) (size!18877 lt!303780)))) (or ((_ is Undefined!6949) lt!303921) ((_ is Found!6949) lt!303921) (not ((_ is MissingVacant!6949) lt!303921)) (not (= (index!30155 lt!303921) vacantSpotIndex!68)) (and (bvsge (index!30155 lt!303921) #b00000000000000000000000000000000) (bvslt (index!30155 lt!303921) (size!18877 lt!303780)))) (or ((_ is Undefined!6949) lt!303921) (ite ((_ is Found!6949) lt!303921) (= (select (arr!18512 lt!303780) (index!30153 lt!303921)) lt!303766) (and ((_ is MissingVacant!6949) lt!303921) (= (index!30155 lt!303921) vacantSpotIndex!68) (= (select (arr!18512 lt!303780) (index!30155 lt!303921)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92211 (= lt!303921 e!374972)))

(declare-fun c!75132 () Bool)

(assert (=> d!92211 (= c!75132 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!92211 (= lt!303922 (select (arr!18512 lt!303780) lt!303783))))

(assert (=> d!92211 (validMask!0 mask!3053)))

(assert (=> d!92211 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303783 vacantSpotIndex!68 lt!303766 lt!303780 mask!3053) lt!303921)))

(declare-fun b!653156 () Bool)

(assert (=> b!653156 (= e!374974 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!303783 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!303766 lt!303780 mask!3053))))

(declare-fun b!653158 () Bool)

(assert (=> b!653158 (= e!374974 (MissingVacant!6949 vacantSpotIndex!68))))

(declare-fun b!653159 () Bool)

(assert (=> b!653159 (= e!374972 Undefined!6949)))

(assert (= (and d!92211 c!75132) b!653159))

(assert (= (and d!92211 (not c!75132)) b!653150))

(assert (= (and b!653150 c!75133) b!653152))

(assert (= (and b!653150 (not c!75133)) b!653154))

(assert (= (and b!653154 c!75131) b!653158))

(assert (= (and b!653154 (not c!75131)) b!653156))

(declare-fun m!625809 () Bool)

(assert (=> d!92211 m!625809))

(declare-fun m!625811 () Bool)

(assert (=> d!92211 m!625811))

(declare-fun m!625813 () Bool)

(assert (=> d!92211 m!625813))

(assert (=> d!92211 m!625573))

(assert (=> b!653156 m!625771))

(assert (=> b!653156 m!625771))

(declare-fun m!625817 () Bool)

(assert (=> b!653156 m!625817))

(assert (=> b!652866 d!92211))

(declare-fun b!653160 () Bool)

(declare-fun e!374977 () SeekEntryResult!6949)

(declare-fun e!374979 () SeekEntryResult!6949)

(assert (=> b!653160 (= e!374977 e!374979)))

(declare-fun c!75136 () Bool)

(declare-fun lt!303924 () (_ BitVec 64))

(assert (=> b!653160 (= c!75136 (= lt!303924 lt!303766))))

(declare-fun b!653161 () Bool)

(assert (=> b!653161 (= e!374979 (Found!6949 index!984))))

(declare-fun b!653162 () Bool)

(declare-fun c!75134 () Bool)

(assert (=> b!653162 (= c!75134 (= lt!303924 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!374978 () SeekEntryResult!6949)

(assert (=> b!653162 (= e!374979 e!374978)))

(declare-fun lt!303923 () SeekEntryResult!6949)

(declare-fun d!92215 () Bool)

(assert (=> d!92215 (and (or ((_ is Undefined!6949) lt!303923) (not ((_ is Found!6949) lt!303923)) (and (bvsge (index!30153 lt!303923) #b00000000000000000000000000000000) (bvslt (index!30153 lt!303923) (size!18877 lt!303780)))) (or ((_ is Undefined!6949) lt!303923) ((_ is Found!6949) lt!303923) (not ((_ is MissingVacant!6949) lt!303923)) (not (= (index!30155 lt!303923) vacantSpotIndex!68)) (and (bvsge (index!30155 lt!303923) #b00000000000000000000000000000000) (bvslt (index!30155 lt!303923) (size!18877 lt!303780)))) (or ((_ is Undefined!6949) lt!303923) (ite ((_ is Found!6949) lt!303923) (= (select (arr!18512 lt!303780) (index!30153 lt!303923)) lt!303766) (and ((_ is MissingVacant!6949) lt!303923) (= (index!30155 lt!303923) vacantSpotIndex!68) (= (select (arr!18512 lt!303780) (index!30155 lt!303923)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92215 (= lt!303923 e!374977)))

(declare-fun c!75135 () Bool)

(assert (=> d!92215 (= c!75135 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!92215 (= lt!303924 (select (arr!18512 lt!303780) index!984))))

(assert (=> d!92215 (validMask!0 mask!3053)))

(assert (=> d!92215 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!303766 lt!303780 mask!3053) lt!303923)))

(declare-fun b!653163 () Bool)

(assert (=> b!653163 (= e!374978 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!303766 lt!303780 mask!3053))))

(declare-fun b!653164 () Bool)

(assert (=> b!653164 (= e!374978 (MissingVacant!6949 vacantSpotIndex!68))))

(declare-fun b!653165 () Bool)

(assert (=> b!653165 (= e!374977 Undefined!6949)))

(assert (= (and d!92215 c!75135) b!653165))

(assert (= (and d!92215 (not c!75135)) b!653160))

(assert (= (and b!653160 c!75136) b!653161))

(assert (= (and b!653160 (not c!75136)) b!653162))

(assert (= (and b!653162 c!75134) b!653164))

(assert (= (and b!653162 (not c!75134)) b!653163))

(declare-fun m!625821 () Bool)

(assert (=> d!92215 m!625821))

(declare-fun m!625823 () Bool)

(assert (=> d!92215 m!625823))

(assert (=> d!92215 m!625749))

(assert (=> d!92215 m!625573))

(assert (=> b!653163 m!625551))

(assert (=> b!653163 m!625551))

(declare-fun m!625825 () Bool)

(assert (=> b!653163 m!625825))

(assert (=> b!652866 d!92215))

(declare-fun b!653191 () Bool)

(declare-fun e!375003 () Bool)

(declare-fun e!375002 () Bool)

(assert (=> b!653191 (= e!375003 e!375002)))

(declare-fun c!75141 () Bool)

(assert (=> b!653191 (= c!75141 (validKeyInArray!0 (select (arr!18512 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33787 () Bool)

(declare-fun call!33790 () Bool)

(assert (=> bm!33787 (= call!33790 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!653192 () Bool)

(declare-fun e!375001 () Bool)

(assert (=> b!653192 (= e!375001 call!33790)))

(declare-fun b!653193 () Bool)

(assert (=> b!653193 (= e!375002 call!33790)))

(declare-fun b!653194 () Bool)

(assert (=> b!653194 (= e!375002 e!375001)))

(declare-fun lt!303937 () (_ BitVec 64))

(assert (=> b!653194 (= lt!303937 (select (arr!18512 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!303939 () Unit!22322)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38622 (_ BitVec 64) (_ BitVec 32)) Unit!22322)

(assert (=> b!653194 (= lt!303939 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!303937 #b00000000000000000000000000000000))))

(assert (=> b!653194 (arrayContainsKey!0 a!2986 lt!303937 #b00000000000000000000000000000000)))

(declare-fun lt!303938 () Unit!22322)

(assert (=> b!653194 (= lt!303938 lt!303939)))

(declare-fun res!423644 () Bool)

(assert (=> b!653194 (= res!423644 (= (seekEntryOrOpen!0 (select (arr!18512 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6949 #b00000000000000000000000000000000)))))

(assert (=> b!653194 (=> (not res!423644) (not e!375001))))

(declare-fun d!92221 () Bool)

(declare-fun res!423643 () Bool)

(assert (=> d!92221 (=> res!423643 e!375003)))

(assert (=> d!92221 (= res!423643 (bvsge #b00000000000000000000000000000000 (size!18877 a!2986)))))

(assert (=> d!92221 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!375003)))

(assert (= (and d!92221 (not res!423643)) b!653191))

(assert (= (and b!653191 c!75141) b!653194))

(assert (= (and b!653191 (not c!75141)) b!653193))

(assert (= (and b!653194 res!423644) b!653192))

(assert (= (or b!653192 b!653193) bm!33787))

(assert (=> b!653191 m!625725))

(assert (=> b!653191 m!625725))

(assert (=> b!653191 m!625759))

(declare-fun m!625841 () Bool)

(assert (=> bm!33787 m!625841))

(assert (=> b!653194 m!625725))

(declare-fun m!625843 () Bool)

(assert (=> b!653194 m!625843))

(declare-fun m!625845 () Bool)

(assert (=> b!653194 m!625845))

(assert (=> b!653194 m!625725))

(declare-fun m!625847 () Bool)

(assert (=> b!653194 m!625847))

(assert (=> b!652877 d!92221))

(declare-fun d!92231 () Bool)

(assert (=> d!92231 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!59198 d!92231))

(declare-fun d!92243 () Bool)

(assert (=> d!92243 (= (array_inv!14395 a!2986) (bvsge (size!18877 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!59198 d!92243))

(declare-fun d!92245 () Bool)

(assert (=> d!92245 (= (validKeyInArray!0 (select (arr!18512 a!2986) j!136)) (and (not (= (select (arr!18512 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18512 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!652867 d!92245))

(declare-fun b!653210 () Bool)

(declare-fun e!375019 () Bool)

(declare-fun e!375020 () Bool)

(assert (=> b!653210 (= e!375019 e!375020)))

(declare-fun res!423656 () Bool)

(assert (=> b!653210 (=> (not res!423656) (not e!375020))))

(declare-fun e!375018 () Bool)

(assert (=> b!653210 (= res!423656 (not e!375018))))

(declare-fun res!423658 () Bool)

(assert (=> b!653210 (=> (not res!423658) (not e!375018))))

(assert (=> b!653210 (= res!423658 (validKeyInArray!0 (select (arr!18512 lt!303780) #b00000000000000000000000000000000)))))

(declare-fun bm!33790 () Bool)

(declare-fun call!33793 () Bool)

(declare-fun c!75144 () Bool)

(assert (=> bm!33790 (= call!33793 (arrayNoDuplicates!0 lt!303780 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!75144 (Cons!12588 (select (arr!18512 lt!303780) #b00000000000000000000000000000000) Nil!12589) Nil!12589)))))

(declare-fun b!653211 () Bool)

(declare-fun e!375017 () Bool)

(assert (=> b!653211 (= e!375017 call!33793)))

(declare-fun b!653212 () Bool)

(assert (=> b!653212 (= e!375017 call!33793)))

(declare-fun b!653213 () Bool)

(assert (=> b!653213 (= e!375020 e!375017)))

(assert (=> b!653213 (= c!75144 (validKeyInArray!0 (select (arr!18512 lt!303780) #b00000000000000000000000000000000)))))

(declare-fun b!653214 () Bool)

(assert (=> b!653214 (= e!375018 (contains!3165 Nil!12589 (select (arr!18512 lt!303780) #b00000000000000000000000000000000)))))

(declare-fun d!92247 () Bool)

(declare-fun res!423657 () Bool)

(assert (=> d!92247 (=> res!423657 e!375019)))

(assert (=> d!92247 (= res!423657 (bvsge #b00000000000000000000000000000000 (size!18877 lt!303780)))))

(assert (=> d!92247 (= (arrayNoDuplicates!0 lt!303780 #b00000000000000000000000000000000 Nil!12589) e!375019)))

(assert (= (and d!92247 (not res!423657)) b!653210))

(assert (= (and b!653210 res!423658) b!653214))

(assert (= (and b!653210 res!423656) b!653213))

(assert (= (and b!653213 c!75144) b!653211))

(assert (= (and b!653213 (not c!75144)) b!653212))

(assert (= (or b!653211 b!653212) bm!33790))

(declare-fun m!625873 () Bool)

(assert (=> b!653210 m!625873))

(assert (=> b!653210 m!625873))

(declare-fun m!625875 () Bool)

(assert (=> b!653210 m!625875))

(assert (=> bm!33790 m!625873))

(declare-fun m!625879 () Bool)

(assert (=> bm!33790 m!625879))

(assert (=> b!653213 m!625873))

(assert (=> b!653213 m!625873))

(assert (=> b!653213 m!625875))

(assert (=> b!653214 m!625873))

(assert (=> b!653214 m!625873))

(declare-fun m!625881 () Bool)

(assert (=> b!653214 m!625881))

(assert (=> b!652886 d!92247))

(declare-fun d!92251 () Bool)

(declare-fun res!423659 () Bool)

(declare-fun e!375021 () Bool)

(assert (=> d!92251 (=> res!423659 e!375021)))

(assert (=> d!92251 (= res!423659 (= (select (arr!18512 lt!303780) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!18512 a!2986) j!136)))))

(assert (=> d!92251 (= (arrayContainsKey!0 lt!303780 (select (arr!18512 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!375021)))

(declare-fun b!653215 () Bool)

(declare-fun e!375022 () Bool)

(assert (=> b!653215 (= e!375021 e!375022)))

(declare-fun res!423660 () Bool)

(assert (=> b!653215 (=> (not res!423660) (not e!375022))))

(assert (=> b!653215 (= res!423660 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18877 lt!303780)))))

(declare-fun b!653216 () Bool)

(assert (=> b!653216 (= e!375022 (arrayContainsKey!0 lt!303780 (select (arr!18512 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!92251 (not res!423659)) b!653215))

(assert (= (and b!653215 res!423660) b!653216))

(declare-fun m!625883 () Bool)

(assert (=> d!92251 m!625883))

(assert (=> b!653216 m!625503))

(declare-fun m!625885 () Bool)

(assert (=> b!653216 m!625885))

(assert (=> b!652886 d!92251))

(declare-fun d!92253 () Bool)

(assert (=> d!92253 (arrayNoDuplicates!0 lt!303780 index!984 Nil!12589)))

(declare-fun lt!303953 () Unit!22322)

(declare-fun choose!39 (array!38622 (_ BitVec 32) (_ BitVec 32)) Unit!22322)

(assert (=> d!92253 (= lt!303953 (choose!39 lt!303780 #b00000000000000000000000000000000 index!984))))

(assert (=> d!92253 (bvslt (size!18877 lt!303780) #b01111111111111111111111111111111)))

(assert (=> d!92253 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!303780 #b00000000000000000000000000000000 index!984) lt!303953)))

(declare-fun bs!19448 () Bool)

(assert (= bs!19448 d!92253))

(assert (=> bs!19448 m!625535))

(declare-fun m!625887 () Bool)

(assert (=> bs!19448 m!625887))

(assert (=> b!652886 d!92253))

(declare-fun d!92255 () Bool)

(assert (=> d!92255 (arrayContainsKey!0 lt!303780 (select (arr!18512 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!303957 () Unit!22322)

(declare-fun choose!114 (array!38622 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22322)

(assert (=> d!92255 (= lt!303957 (choose!114 lt!303780 (select (arr!18512 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!92255 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!92255 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!303780 (select (arr!18512 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!303957)))

(declare-fun bs!19449 () Bool)

(assert (= bs!19449 d!92255))

(assert (=> bs!19449 m!625503))

(assert (=> bs!19449 m!625529))

(assert (=> bs!19449 m!625503))

(declare-fun m!625893 () Bool)

(assert (=> bs!19449 m!625893))

(assert (=> b!652886 d!92255))

(declare-fun d!92259 () Bool)

(declare-fun res!423664 () Bool)

(declare-fun e!375026 () Bool)

(assert (=> d!92259 (=> res!423664 e!375026)))

(assert (=> d!92259 (= res!423664 (= (select (arr!18512 lt!303780) j!136) (select (arr!18512 a!2986) j!136)))))

(assert (=> d!92259 (= (arrayContainsKey!0 lt!303780 (select (arr!18512 a!2986) j!136) j!136) e!375026)))

(declare-fun b!653220 () Bool)

(declare-fun e!375027 () Bool)

(assert (=> b!653220 (= e!375026 e!375027)))

(declare-fun res!423665 () Bool)

(assert (=> b!653220 (=> (not res!423665) (not e!375027))))

(assert (=> b!653220 (= res!423665 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18877 lt!303780)))))

(declare-fun b!653221 () Bool)

(assert (=> b!653221 (= e!375027 (arrayContainsKey!0 lt!303780 (select (arr!18512 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!92259 (not res!423664)) b!653220))

(assert (= (and b!653220 res!423665) b!653221))

(declare-fun m!625895 () Bool)

(assert (=> d!92259 m!625895))

(assert (=> b!653221 m!625503))

(declare-fun m!625897 () Bool)

(assert (=> b!653221 m!625897))

(assert (=> b!652886 d!92259))

(declare-fun d!92261 () Bool)

(declare-fun e!375030 () Bool)

(assert (=> d!92261 e!375030))

(declare-fun res!423668 () Bool)

(assert (=> d!92261 (=> (not res!423668) (not e!375030))))

(assert (=> d!92261 (= res!423668 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18877 a!2986))))))

(declare-fun lt!303960 () Unit!22322)

(declare-fun choose!41 (array!38622 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12592) Unit!22322)

(assert (=> d!92261 (= lt!303960 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12589))))

(assert (=> d!92261 (bvslt (size!18877 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!92261 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12589) lt!303960)))

(declare-fun b!653224 () Bool)

(assert (=> b!653224 (= e!375030 (arrayNoDuplicates!0 (array!38623 (store (arr!18512 a!2986) i!1108 k0!1786) (size!18877 a!2986)) #b00000000000000000000000000000000 Nil!12589))))

(assert (= (and d!92261 res!423668) b!653224))

(declare-fun m!625899 () Bool)

(assert (=> d!92261 m!625899))

(assert (=> b!653224 m!625537))

(declare-fun m!625901 () Bool)

(assert (=> b!653224 m!625901))

(assert (=> b!652886 d!92261))

(declare-fun b!653225 () Bool)

(declare-fun e!375033 () Bool)

(declare-fun e!375034 () Bool)

(assert (=> b!653225 (= e!375033 e!375034)))

(declare-fun res!423669 () Bool)

(assert (=> b!653225 (=> (not res!423669) (not e!375034))))

(declare-fun e!375032 () Bool)

(assert (=> b!653225 (= res!423669 (not e!375032))))

(declare-fun res!423671 () Bool)

(assert (=> b!653225 (=> (not res!423671) (not e!375032))))

(assert (=> b!653225 (= res!423671 (validKeyInArray!0 (select (arr!18512 lt!303780) index!984)))))

(declare-fun call!33794 () Bool)

(declare-fun bm!33791 () Bool)

(declare-fun c!75145 () Bool)

(assert (=> bm!33791 (= call!33794 (arrayNoDuplicates!0 lt!303780 (bvadd index!984 #b00000000000000000000000000000001) (ite c!75145 (Cons!12588 (select (arr!18512 lt!303780) index!984) Nil!12589) Nil!12589)))))

(declare-fun b!653226 () Bool)

(declare-fun e!375031 () Bool)

(assert (=> b!653226 (= e!375031 call!33794)))

(declare-fun b!653227 () Bool)

(assert (=> b!653227 (= e!375031 call!33794)))

(declare-fun b!653228 () Bool)

(assert (=> b!653228 (= e!375034 e!375031)))

(assert (=> b!653228 (= c!75145 (validKeyInArray!0 (select (arr!18512 lt!303780) index!984)))))

(declare-fun b!653229 () Bool)

(assert (=> b!653229 (= e!375032 (contains!3165 Nil!12589 (select (arr!18512 lt!303780) index!984)))))

(declare-fun d!92263 () Bool)

(declare-fun res!423670 () Bool)

(assert (=> d!92263 (=> res!423670 e!375033)))

(assert (=> d!92263 (= res!423670 (bvsge index!984 (size!18877 lt!303780)))))

(assert (=> d!92263 (= (arrayNoDuplicates!0 lt!303780 index!984 Nil!12589) e!375033)))

(assert (= (and d!92263 (not res!423670)) b!653225))

(assert (= (and b!653225 res!423671) b!653229))

(assert (= (and b!653225 res!423669) b!653228))

(assert (= (and b!653228 c!75145) b!653226))

(assert (= (and b!653228 (not c!75145)) b!653227))

(assert (= (or b!653226 b!653227) bm!33791))

(assert (=> b!653225 m!625749))

(assert (=> b!653225 m!625749))

(declare-fun m!625903 () Bool)

(assert (=> b!653225 m!625903))

(assert (=> bm!33791 m!625749))

(declare-fun m!625905 () Bool)

(assert (=> bm!33791 m!625905))

(assert (=> b!653228 m!625749))

(assert (=> b!653228 m!625749))

(assert (=> b!653228 m!625903))

(assert (=> b!653229 m!625749))

(assert (=> b!653229 m!625749))

(declare-fun m!625907 () Bool)

(assert (=> b!653229 m!625907))

(assert (=> b!652886 d!92263))

(declare-fun d!92265 () Bool)

(declare-fun lt!303965 () Bool)

(assert (=> d!92265 (= lt!303965 (select (content!253 Nil!12589) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!375038 () Bool)

(assert (=> d!92265 (= lt!303965 e!375038)))

(declare-fun res!423673 () Bool)

(assert (=> d!92265 (=> (not res!423673) (not e!375038))))

(assert (=> d!92265 (= res!423673 ((_ is Cons!12588) Nil!12589))))

(assert (=> d!92265 (= (contains!3165 Nil!12589 #b0000000000000000000000000000000000000000000000000000000000000000) lt!303965)))

(declare-fun b!653234 () Bool)

(declare-fun e!375037 () Bool)

(assert (=> b!653234 (= e!375038 e!375037)))

(declare-fun res!423672 () Bool)

(assert (=> b!653234 (=> res!423672 e!375037)))

(assert (=> b!653234 (= res!423672 (= (h!13633 Nil!12589) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!653235 () Bool)

(assert (=> b!653235 (= e!375037 (contains!3165 (t!18811 Nil!12589) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!92265 res!423673) b!653234))

(assert (= (and b!653234 (not res!423672)) b!653235))

(assert (=> d!92265 m!625729))

(declare-fun m!625909 () Bool)

(assert (=> d!92265 m!625909))

(declare-fun m!625911 () Bool)

(assert (=> b!653235 m!625911))

(assert (=> b!652887 d!92265))

(declare-fun d!92267 () Bool)

(declare-fun res!423678 () Bool)

(declare-fun e!375047 () Bool)

(assert (=> d!92267 (=> res!423678 e!375047)))

(assert (=> d!92267 (= res!423678 ((_ is Nil!12589) Nil!12589))))

(assert (=> d!92267 (= (noDuplicate!443 Nil!12589) e!375047)))

(declare-fun b!653248 () Bool)

(declare-fun e!375048 () Bool)

(assert (=> b!653248 (= e!375047 e!375048)))

(declare-fun res!423679 () Bool)

(assert (=> b!653248 (=> (not res!423679) (not e!375048))))

(assert (=> b!653248 (= res!423679 (not (contains!3165 (t!18811 Nil!12589) (h!13633 Nil!12589))))))

(declare-fun b!653249 () Bool)

(assert (=> b!653249 (= e!375048 (noDuplicate!443 (t!18811 Nil!12589)))))

(assert (= (and d!92267 (not res!423678)) b!653248))

(assert (= (and b!653248 res!423679) b!653249))

(declare-fun m!625913 () Bool)

(assert (=> b!653248 m!625913))

(declare-fun m!625915 () Bool)

(assert (=> b!653249 m!625915))

(assert (=> b!652874 d!92267))

(assert (=> b!652885 d!92259))

(assert (=> b!652873 d!92247))

(declare-fun d!92269 () Bool)

(assert (=> d!92269 (arrayNoDuplicates!0 lt!303780 j!136 Nil!12589)))

(declare-fun lt!303966 () Unit!22322)

(assert (=> d!92269 (= lt!303966 (choose!39 lt!303780 #b00000000000000000000000000000000 j!136))))

(assert (=> d!92269 (bvslt (size!18877 lt!303780) #b01111111111111111111111111111111)))

(assert (=> d!92269 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!303780 #b00000000000000000000000000000000 j!136) lt!303966)))

(declare-fun bs!19450 () Bool)

(assert (= bs!19450 d!92269))

(assert (=> bs!19450 m!625509))

(declare-fun m!625917 () Bool)

(assert (=> bs!19450 m!625917))

(assert (=> b!652873 d!92269))

(declare-fun d!92271 () Bool)

(assert (=> d!92271 (arrayContainsKey!0 lt!303780 (select (arr!18512 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!303967 () Unit!22322)

(assert (=> d!92271 (= lt!303967 (choose!114 lt!303780 (select (arr!18512 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!92271 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!92271 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!303780 (select (arr!18512 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!303967)))

(declare-fun bs!19451 () Bool)

(assert (= bs!19451 d!92271))

(assert (=> bs!19451 m!625503))

(assert (=> bs!19451 m!625517))

(assert (=> bs!19451 m!625503))

(declare-fun m!625919 () Bool)

(assert (=> bs!19451 m!625919))

(assert (=> b!652873 d!92271))

(declare-fun b!653256 () Bool)

(declare-fun e!375054 () Bool)

(declare-fun e!375055 () Bool)

(assert (=> b!653256 (= e!375054 e!375055)))

(declare-fun res!423680 () Bool)

(assert (=> b!653256 (=> (not res!423680) (not e!375055))))

(declare-fun e!375053 () Bool)

(assert (=> b!653256 (= res!423680 (not e!375053))))

(declare-fun res!423682 () Bool)

(assert (=> b!653256 (=> (not res!423682) (not e!375053))))

(assert (=> b!653256 (= res!423682 (validKeyInArray!0 (select (arr!18512 lt!303780) j!136)))))

(declare-fun bm!33792 () Bool)

(declare-fun call!33795 () Bool)

(declare-fun c!75155 () Bool)

(assert (=> bm!33792 (= call!33795 (arrayNoDuplicates!0 lt!303780 (bvadd j!136 #b00000000000000000000000000000001) (ite c!75155 (Cons!12588 (select (arr!18512 lt!303780) j!136) Nil!12589) Nil!12589)))))

(declare-fun b!653257 () Bool)

(declare-fun e!375052 () Bool)

(assert (=> b!653257 (= e!375052 call!33795)))

(declare-fun b!653258 () Bool)

(assert (=> b!653258 (= e!375052 call!33795)))

(declare-fun b!653259 () Bool)

(assert (=> b!653259 (= e!375055 e!375052)))

(assert (=> b!653259 (= c!75155 (validKeyInArray!0 (select (arr!18512 lt!303780) j!136)))))

(declare-fun b!653260 () Bool)

(assert (=> b!653260 (= e!375053 (contains!3165 Nil!12589 (select (arr!18512 lt!303780) j!136)))))

(declare-fun d!92273 () Bool)

(declare-fun res!423681 () Bool)

(assert (=> d!92273 (=> res!423681 e!375054)))

(assert (=> d!92273 (= res!423681 (bvsge j!136 (size!18877 lt!303780)))))

(assert (=> d!92273 (= (arrayNoDuplicates!0 lt!303780 j!136 Nil!12589) e!375054)))

(assert (= (and d!92273 (not res!423681)) b!653256))

(assert (= (and b!653256 res!423682) b!653260))

(assert (= (and b!653256 res!423680) b!653259))

(assert (= (and b!653259 c!75155) b!653257))

(assert (= (and b!653259 (not c!75155)) b!653258))

(assert (= (or b!653257 b!653258) bm!33792))

(assert (=> b!653256 m!625895))

(assert (=> b!653256 m!625895))

(declare-fun m!625923 () Bool)

(assert (=> b!653256 m!625923))

(assert (=> bm!33792 m!625895))

(declare-fun m!625931 () Bool)

(assert (=> bm!33792 m!625931))

(assert (=> b!653259 m!625895))

(assert (=> b!653259 m!625895))

(assert (=> b!653259 m!625923))

(assert (=> b!653260 m!625895))

(assert (=> b!653260 m!625895))

(declare-fun m!625935 () Bool)

(assert (=> b!653260 m!625935))

(assert (=> b!652873 d!92273))

(assert (=> b!652873 d!92261))

(declare-fun d!92277 () Bool)

(declare-fun res!423683 () Bool)

(declare-fun e!375059 () Bool)

(assert (=> d!92277 (=> res!423683 e!375059)))

(assert (=> d!92277 (= res!423683 (= (select (arr!18512 lt!303780) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18512 a!2986) j!136)))))

(assert (=> d!92277 (= (arrayContainsKey!0 lt!303780 (select (arr!18512 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!375059)))

(declare-fun b!653267 () Bool)

(declare-fun e!375060 () Bool)

(assert (=> b!653267 (= e!375059 e!375060)))

(declare-fun res!423684 () Bool)

(assert (=> b!653267 (=> (not res!423684) (not e!375060))))

(assert (=> b!653267 (= res!423684 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18877 lt!303780)))))

(declare-fun b!653268 () Bool)

(assert (=> b!653268 (= e!375060 (arrayContainsKey!0 lt!303780 (select (arr!18512 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!92277 (not res!423683)) b!653267))

(assert (= (and b!653267 res!423684) b!653268))

(declare-fun m!625937 () Bool)

(assert (=> d!92277 m!625937))

(assert (=> b!653268 m!625503))

(declare-fun m!625939 () Bool)

(assert (=> b!653268 m!625939))

(assert (=> b!652873 d!92277))

(declare-fun d!92279 () Bool)

(assert (=> d!92279 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18877 lt!303780)) (not (= (select (arr!18512 lt!303780) j!136) (select (arr!18512 a!2986) j!136))))))

(declare-fun lt!303979 () Unit!22322)

(declare-fun choose!21 (array!38622 (_ BitVec 64) (_ BitVec 32) List!12592) Unit!22322)

(assert (=> d!92279 (= lt!303979 (choose!21 lt!303780 (select (arr!18512 a!2986) j!136) j!136 Nil!12589))))

(assert (=> d!92279 (bvslt (size!18877 lt!303780) #b01111111111111111111111111111111)))

(assert (=> d!92279 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!303780 (select (arr!18512 a!2986) j!136) j!136 Nil!12589) lt!303979)))

(declare-fun bs!19453 () Bool)

(assert (= bs!19453 d!92279))

(assert (=> bs!19453 m!625895))

(assert (=> bs!19453 m!625503))

(declare-fun m!625951 () Bool)

(assert (=> bs!19453 m!625951))

(assert (=> b!652873 d!92279))

(check-sat (not b!653214) (not b!653112) (not b!653216) (not d!92177) (not b!653259) (not b!653156) (not b!653229) (not b!653091) (not b!653213) (not d!92261) (not b!653107) (not b!653104) (not d!92185) (not d!92179) (not b!653075) (not bm!33787) (not b!653249) (not b!653049) (not d!92279) (not d!92207) (not b!653108) (not d!92271) (not bm!33778) (not d!92269) (not b!653248) (not b!653210) (not bm!33791) (not d!92211) (not b!653268) (not b!653194) (not bm!33790) (not d!92191) (not bm!33792) (not b!653073) (not d!92265) (not b!653260) (not b!653224) (not b!653191) (not b!653055) (not d!92215) (not b!653221) (not d!92253) (not b!653235) (not b!653137) (not b!653256) (not b!653163) (not b!653228) (not d!92189) (not b!653225) (not d!92255))
(check-sat)
