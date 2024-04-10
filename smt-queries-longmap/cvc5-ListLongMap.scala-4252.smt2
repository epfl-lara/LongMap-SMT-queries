; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58982 () Bool)

(assert start!58982)

(declare-fun b!650566 () Bool)

(declare-fun res!421733 () Bool)

(declare-fun e!373237 () Bool)

(assert (=> b!650566 (=> (not res!421733) (not e!373237))))

(declare-datatypes ((array!38563 0))(
  ( (array!38564 (arr!18486 (Array (_ BitVec 32) (_ BitVec 64))) (size!18850 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38563)

(declare-datatypes ((List!12527 0))(
  ( (Nil!12524) (Cons!12523 (h!13568 (_ BitVec 64)) (t!18755 List!12527)) )
))
(declare-fun arrayNoDuplicates!0 (array!38563 (_ BitVec 32) List!12527) Bool)

(assert (=> b!650566 (= res!421733 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12524))))

(declare-fun b!650567 () Bool)

(declare-fun res!421718 () Bool)

(assert (=> b!650567 (=> (not res!421718) (not e!373237))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38563 (_ BitVec 32)) Bool)

(assert (=> b!650567 (= res!421718 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!650568 () Bool)

(declare-datatypes ((Unit!22182 0))(
  ( (Unit!22183) )
))
(declare-fun e!373240 () Unit!22182)

(declare-fun Unit!22184 () Unit!22182)

(assert (=> b!650568 (= e!373240 Unit!22184)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!302302 () array!38563)

(declare-fun lt!302305 () Unit!22182)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38563 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22182)

(assert (=> b!650568 (= lt!302305 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!302302 (select (arr!18486 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun arrayContainsKey!0 (array!38563 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!650568 (arrayContainsKey!0 lt!302302 (select (arr!18486 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun lt!302295 () Unit!22182)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38563 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12527) Unit!22182)

(assert (=> b!650568 (= lt!302295 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12524))))

(assert (=> b!650568 (arrayNoDuplicates!0 lt!302302 #b00000000000000000000000000000000 Nil!12524)))

(declare-fun lt!302300 () Unit!22182)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38563 (_ BitVec 32) (_ BitVec 32)) Unit!22182)

(assert (=> b!650568 (= lt!302300 (lemmaNoDuplicateFromThenFromBigger!0 lt!302302 #b00000000000000000000000000000000 j!136))))

(assert (=> b!650568 (arrayNoDuplicates!0 lt!302302 j!136 Nil!12524)))

(declare-fun lt!302299 () Unit!22182)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38563 (_ BitVec 64) (_ BitVec 32) List!12527) Unit!22182)

(assert (=> b!650568 (= lt!302299 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!302302 (select (arr!18486 a!2986) j!136) j!136 Nil!12524))))

(assert (=> b!650568 false))

(declare-fun b!650569 () Bool)

(declare-fun res!421722 () Bool)

(declare-fun e!373244 () Bool)

(assert (=> b!650569 (=> (not res!421722) (not e!373244))))

(assert (=> b!650569 (= res!421722 (and (= (size!18850 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18850 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18850 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!421732 () Bool)

(assert (=> start!58982 (=> (not res!421732) (not e!373244))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58982 (= res!421732 (validMask!0 mask!3053))))

(assert (=> start!58982 e!373244))

(assert (=> start!58982 true))

(declare-fun array_inv!14282 (array!38563) Bool)

(assert (=> start!58982 (array_inv!14282 a!2986)))

(declare-fun b!650570 () Bool)

(declare-fun e!373239 () Bool)

(declare-fun e!373246 () Bool)

(assert (=> b!650570 (= e!373239 e!373246)))

(declare-fun res!421729 () Bool)

(assert (=> b!650570 (=> res!421729 e!373246)))

(declare-fun lt!302303 () (_ BitVec 64))

(declare-fun lt!302304 () (_ BitVec 64))

(assert (=> b!650570 (= res!421729 (or (not (= (select (arr!18486 a!2986) j!136) lt!302303)) (not (= (select (arr!18486 a!2986) j!136) lt!302304)) (bvsge j!136 index!984)))))

(declare-fun b!650571 () Bool)

(assert (=> b!650571 (= e!373244 e!373237)))

(declare-fun res!421731 () Bool)

(assert (=> b!650571 (=> (not res!421731) (not e!373237))))

(declare-datatypes ((SeekEntryResult!6926 0))(
  ( (MissingZero!6926 (index!30054 (_ BitVec 32))) (Found!6926 (index!30055 (_ BitVec 32))) (Intermediate!6926 (undefined!7738 Bool) (index!30056 (_ BitVec 32)) (x!58844 (_ BitVec 32))) (Undefined!6926) (MissingVacant!6926 (index!30057 (_ BitVec 32))) )
))
(declare-fun lt!302297 () SeekEntryResult!6926)

(assert (=> b!650571 (= res!421731 (or (= lt!302297 (MissingZero!6926 i!1108)) (= lt!302297 (MissingVacant!6926 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38563 (_ BitVec 32)) SeekEntryResult!6926)

(assert (=> b!650571 (= lt!302297 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!650572 () Bool)

(declare-fun res!421728 () Bool)

(assert (=> b!650572 (=> (not res!421728) (not e!373237))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!650572 (= res!421728 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18486 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!650573 () Bool)

(declare-fun e!373245 () Bool)

(declare-fun e!373243 () Bool)

(assert (=> b!650573 (= e!373245 e!373243)))

(declare-fun res!421727 () Bool)

(assert (=> b!650573 (=> res!421727 e!373243)))

(assert (=> b!650573 (= res!421727 (or (not (= (select (arr!18486 a!2986) j!136) lt!302303)) (not (= (select (arr!18486 a!2986) j!136) lt!302304))))))

(assert (=> b!650573 e!373239))

(declare-fun res!421721 () Bool)

(assert (=> b!650573 (=> (not res!421721) (not e!373239))))

(assert (=> b!650573 (= res!421721 (= lt!302304 (select (arr!18486 a!2986) j!136)))))

(assert (=> b!650573 (= lt!302304 (select (store (arr!18486 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!650574 () Bool)

(declare-fun Unit!22185 () Unit!22182)

(assert (=> b!650574 (= e!373240 Unit!22185)))

(declare-fun b!650575 () Bool)

(declare-fun e!373241 () Bool)

(assert (=> b!650575 (= e!373241 (arrayContainsKey!0 lt!302302 (select (arr!18486 a!2986) j!136) index!984))))

(declare-fun b!650576 () Bool)

(declare-fun e!373242 () Bool)

(assert (=> b!650576 (= e!373243 e!373242)))

(declare-fun res!421720 () Bool)

(assert (=> b!650576 (=> res!421720 e!373242)))

(assert (=> b!650576 (= res!421720 (bvsge index!984 j!136))))

(declare-fun lt!302301 () Unit!22182)

(assert (=> b!650576 (= lt!302301 e!373240)))

(declare-fun c!74791 () Bool)

(assert (=> b!650576 (= c!74791 (bvslt j!136 index!984))))

(declare-fun b!650577 () Bool)

(declare-fun e!373248 () Unit!22182)

(declare-fun Unit!22186 () Unit!22182)

(assert (=> b!650577 (= e!373248 Unit!22186)))

(declare-fun b!650578 () Bool)

(declare-fun res!421725 () Bool)

(assert (=> b!650578 (=> (not res!421725) (not e!373244))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!650578 (= res!421725 (validKeyInArray!0 k!1786))))

(declare-fun b!650579 () Bool)

(declare-fun res!421734 () Bool)

(assert (=> b!650579 (=> (not res!421734) (not e!373244))))

(assert (=> b!650579 (= res!421734 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!650580 () Bool)

(declare-fun e!373249 () Bool)

(assert (=> b!650580 (= e!373246 e!373249)))

(declare-fun res!421719 () Bool)

(assert (=> b!650580 (=> (not res!421719) (not e!373249))))

(assert (=> b!650580 (= res!421719 (arrayContainsKey!0 lt!302302 (select (arr!18486 a!2986) j!136) j!136))))

(declare-fun b!650581 () Bool)

(declare-fun e!373247 () Bool)

(declare-fun e!373238 () Bool)

(assert (=> b!650581 (= e!373247 e!373238)))

(declare-fun res!421724 () Bool)

(assert (=> b!650581 (=> (not res!421724) (not e!373238))))

(declare-fun lt!302289 () SeekEntryResult!6926)

(assert (=> b!650581 (= res!421724 (and (= lt!302289 (Found!6926 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18486 a!2986) index!984) (select (arr!18486 a!2986) j!136))) (not (= (select (arr!18486 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38563 (_ BitVec 32)) SeekEntryResult!6926)

(assert (=> b!650581 (= lt!302289 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18486 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!650582 () Bool)

(declare-fun e!373251 () Bool)

(declare-fun lt!302298 () SeekEntryResult!6926)

(assert (=> b!650582 (= e!373251 (= lt!302289 lt!302298))))

(declare-fun b!650583 () Bool)

(assert (=> b!650583 (= e!373238 (not e!373245))))

(declare-fun res!421723 () Bool)

(assert (=> b!650583 (=> res!421723 e!373245)))

(declare-fun lt!302296 () SeekEntryResult!6926)

(assert (=> b!650583 (= res!421723 (not (= lt!302296 (Found!6926 index!984))))))

(declare-fun lt!302294 () Unit!22182)

(assert (=> b!650583 (= lt!302294 e!373248)))

(declare-fun c!74792 () Bool)

(assert (=> b!650583 (= c!74792 (= lt!302296 Undefined!6926))))

(assert (=> b!650583 (= lt!302296 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!302303 lt!302302 mask!3053))))

(assert (=> b!650583 e!373251))

(declare-fun res!421736 () Bool)

(assert (=> b!650583 (=> (not res!421736) (not e!373251))))

(declare-fun lt!302291 () (_ BitVec 32))

(assert (=> b!650583 (= res!421736 (= lt!302298 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302291 vacantSpotIndex!68 lt!302303 lt!302302 mask!3053)))))

(assert (=> b!650583 (= lt!302298 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302291 vacantSpotIndex!68 (select (arr!18486 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!650583 (= lt!302303 (select (store (arr!18486 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!302292 () Unit!22182)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38563 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22182)

(assert (=> b!650583 (= lt!302292 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!302291 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!650583 (= lt!302291 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!650584 () Bool)

(assert (=> b!650584 (= e!373249 (arrayContainsKey!0 lt!302302 (select (arr!18486 a!2986) j!136) index!984))))

(declare-fun b!650585 () Bool)

(declare-fun res!421730 () Bool)

(assert (=> b!650585 (=> (not res!421730) (not e!373244))))

(assert (=> b!650585 (= res!421730 (validKeyInArray!0 (select (arr!18486 a!2986) j!136)))))

(declare-fun b!650586 () Bool)

(assert (=> b!650586 (= e!373242 (or (bvsge (size!18850 a!2986) #b01111111111111111111111111111111) (bvsle #b00000000000000000000000000000000 (size!18850 a!2986))))))

(assert (=> b!650586 (arrayNoDuplicates!0 lt!302302 #b00000000000000000000000000000000 Nil!12524)))

(declare-fun lt!302290 () Unit!22182)

(assert (=> b!650586 (= lt!302290 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12524))))

(assert (=> b!650586 (arrayContainsKey!0 lt!302302 (select (arr!18486 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!302293 () Unit!22182)

(assert (=> b!650586 (= lt!302293 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!302302 (select (arr!18486 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!650586 e!373241))

(declare-fun res!421735 () Bool)

(assert (=> b!650586 (=> (not res!421735) (not e!373241))))

(assert (=> b!650586 (= res!421735 (arrayContainsKey!0 lt!302302 (select (arr!18486 a!2986) j!136) j!136))))

(declare-fun b!650587 () Bool)

(assert (=> b!650587 (= e!373237 e!373247)))

(declare-fun res!421726 () Bool)

(assert (=> b!650587 (=> (not res!421726) (not e!373247))))

(assert (=> b!650587 (= res!421726 (= (select (store (arr!18486 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!650587 (= lt!302302 (array!38564 (store (arr!18486 a!2986) i!1108 k!1786) (size!18850 a!2986)))))

(declare-fun b!650588 () Bool)

(declare-fun Unit!22187 () Unit!22182)

(assert (=> b!650588 (= e!373248 Unit!22187)))

(assert (=> b!650588 false))

(assert (= (and start!58982 res!421732) b!650569))

(assert (= (and b!650569 res!421722) b!650585))

(assert (= (and b!650585 res!421730) b!650578))

(assert (= (and b!650578 res!421725) b!650579))

(assert (= (and b!650579 res!421734) b!650571))

(assert (= (and b!650571 res!421731) b!650567))

(assert (= (and b!650567 res!421718) b!650566))

(assert (= (and b!650566 res!421733) b!650572))

(assert (= (and b!650572 res!421728) b!650587))

(assert (= (and b!650587 res!421726) b!650581))

(assert (= (and b!650581 res!421724) b!650583))

(assert (= (and b!650583 res!421736) b!650582))

(assert (= (and b!650583 c!74792) b!650588))

(assert (= (and b!650583 (not c!74792)) b!650577))

(assert (= (and b!650583 (not res!421723)) b!650573))

(assert (= (and b!650573 res!421721) b!650570))

(assert (= (and b!650570 (not res!421729)) b!650580))

(assert (= (and b!650580 res!421719) b!650584))

(assert (= (and b!650573 (not res!421727)) b!650576))

(assert (= (and b!650576 c!74791) b!650568))

(assert (= (and b!650576 (not c!74791)) b!650574))

(assert (= (and b!650576 (not res!421720)) b!650586))

(assert (= (and b!650586 res!421735) b!650575))

(declare-fun m!623759 () Bool)

(assert (=> b!650585 m!623759))

(assert (=> b!650585 m!623759))

(declare-fun m!623761 () Bool)

(assert (=> b!650585 m!623761))

(declare-fun m!623763 () Bool)

(assert (=> b!650586 m!623763))

(assert (=> b!650586 m!623759))

(declare-fun m!623765 () Bool)

(assert (=> b!650586 m!623765))

(assert (=> b!650586 m!623759))

(assert (=> b!650586 m!623759))

(declare-fun m!623767 () Bool)

(assert (=> b!650586 m!623767))

(assert (=> b!650586 m!623759))

(declare-fun m!623769 () Bool)

(assert (=> b!650586 m!623769))

(declare-fun m!623771 () Bool)

(assert (=> b!650586 m!623771))

(assert (=> b!650573 m!623759))

(declare-fun m!623773 () Bool)

(assert (=> b!650573 m!623773))

(declare-fun m!623775 () Bool)

(assert (=> b!650573 m!623775))

(declare-fun m!623777 () Bool)

(assert (=> b!650572 m!623777))

(declare-fun m!623779 () Bool)

(assert (=> b!650583 m!623779))

(declare-fun m!623781 () Bool)

(assert (=> b!650583 m!623781))

(assert (=> b!650583 m!623759))

(assert (=> b!650583 m!623773))

(declare-fun m!623783 () Bool)

(assert (=> b!650583 m!623783))

(declare-fun m!623785 () Bool)

(assert (=> b!650583 m!623785))

(declare-fun m!623787 () Bool)

(assert (=> b!650583 m!623787))

(assert (=> b!650583 m!623759))

(declare-fun m!623789 () Bool)

(assert (=> b!650583 m!623789))

(assert (=> b!650580 m!623759))

(assert (=> b!650580 m!623759))

(assert (=> b!650580 m!623769))

(assert (=> b!650575 m!623759))

(assert (=> b!650575 m!623759))

(declare-fun m!623791 () Bool)

(assert (=> b!650575 m!623791))

(assert (=> b!650568 m!623763))

(assert (=> b!650568 m!623759))

(declare-fun m!623793 () Bool)

(assert (=> b!650568 m!623793))

(assert (=> b!650568 m!623759))

(assert (=> b!650568 m!623759))

(declare-fun m!623795 () Bool)

(assert (=> b!650568 m!623795))

(declare-fun m!623797 () Bool)

(assert (=> b!650568 m!623797))

(assert (=> b!650568 m!623759))

(declare-fun m!623799 () Bool)

(assert (=> b!650568 m!623799))

(declare-fun m!623801 () Bool)

(assert (=> b!650568 m!623801))

(assert (=> b!650568 m!623771))

(declare-fun m!623803 () Bool)

(assert (=> b!650571 m!623803))

(declare-fun m!623805 () Bool)

(assert (=> b!650579 m!623805))

(declare-fun m!623807 () Bool)

(assert (=> b!650567 m!623807))

(declare-fun m!623809 () Bool)

(assert (=> b!650566 m!623809))

(assert (=> b!650570 m!623759))

(assert (=> b!650587 m!623773))

(declare-fun m!623811 () Bool)

(assert (=> b!650587 m!623811))

(declare-fun m!623813 () Bool)

(assert (=> b!650578 m!623813))

(assert (=> b!650584 m!623759))

(assert (=> b!650584 m!623759))

(assert (=> b!650584 m!623791))

(declare-fun m!623815 () Bool)

(assert (=> b!650581 m!623815))

(assert (=> b!650581 m!623759))

(assert (=> b!650581 m!623759))

(declare-fun m!623817 () Bool)

(assert (=> b!650581 m!623817))

(declare-fun m!623819 () Bool)

(assert (=> start!58982 m!623819))

(declare-fun m!623821 () Bool)

(assert (=> start!58982 m!623821))

(push 1)

