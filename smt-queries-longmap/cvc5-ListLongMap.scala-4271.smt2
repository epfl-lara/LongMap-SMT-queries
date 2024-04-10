; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59366 () Bool)

(assert start!59366)

(declare-fun b!655749 () Bool)

(declare-datatypes ((Unit!22584 0))(
  ( (Unit!22585) )
))
(declare-fun e!376595 () Unit!22584)

(declare-fun Unit!22586 () Unit!22584)

(assert (=> b!655749 (= e!376595 Unit!22586)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun res!425393 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38686 0))(
  ( (array!38687 (arr!18543 (Array (_ BitVec 32) (_ BitVec 64))) (size!18907 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38686)

(assert (=> b!655749 (= res!425393 (= (select (store (arr!18543 a!2986) i!1108 k!1786) index!984) (select (arr!18543 a!2986) j!136)))))

(declare-fun e!376597 () Bool)

(assert (=> b!655749 (=> (not res!425393) (not e!376597))))

(assert (=> b!655749 e!376597))

(declare-fun c!75552 () Bool)

(assert (=> b!655749 (= c!75552 (bvslt j!136 index!984))))

(declare-fun lt!305957 () Unit!22584)

(declare-fun e!376600 () Unit!22584)

(assert (=> b!655749 (= lt!305957 e!376600)))

(declare-fun c!75554 () Bool)

(assert (=> b!655749 (= c!75554 (bvslt index!984 j!136))))

(declare-fun lt!305955 () Unit!22584)

(declare-fun e!376593 () Unit!22584)

(assert (=> b!655749 (= lt!305955 e!376593)))

(assert (=> b!655749 false))

(declare-fun b!655750 () Bool)

(declare-fun res!425385 () Bool)

(declare-fun e!376590 () Bool)

(assert (=> b!655750 (=> (not res!425385) (not e!376590))))

(declare-datatypes ((List!12584 0))(
  ( (Nil!12581) (Cons!12580 (h!13625 (_ BitVec 64)) (t!18812 List!12584)) )
))
(declare-fun arrayNoDuplicates!0 (array!38686 (_ BitVec 32) List!12584) Bool)

(assert (=> b!655750 (= res!425385 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12581))))

(declare-fun b!655751 () Bool)

(declare-fun res!425386 () Bool)

(declare-fun e!376598 () Bool)

(assert (=> b!655751 (=> (not res!425386) (not e!376598))))

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!655751 (= res!425386 (and (= (size!18907 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18907 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18907 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!655752 () Bool)

(declare-fun res!425391 () Bool)

(assert (=> b!655752 (=> (not res!425391) (not e!376598))))

(declare-fun arrayContainsKey!0 (array!38686 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!655752 (= res!425391 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!425387 () Bool)

(assert (=> start!59366 (=> (not res!425387) (not e!376598))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59366 (= res!425387 (validMask!0 mask!3053))))

(assert (=> start!59366 e!376598))

(assert (=> start!59366 true))

(declare-fun array_inv!14339 (array!38686) Bool)

(assert (=> start!59366 (array_inv!14339 a!2986)))

(declare-fun b!655753 () Bool)

(declare-fun Unit!22587 () Unit!22584)

(assert (=> b!655753 (= e!376595 Unit!22587)))

(declare-fun b!655754 () Bool)

(declare-fun res!425392 () Bool)

(assert (=> b!655754 (=> (not res!425392) (not e!376598))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!655754 (= res!425392 (validKeyInArray!0 (select (arr!18543 a!2986) j!136)))))

(declare-fun lt!305953 () array!38686)

(declare-fun b!655755 () Bool)

(declare-fun res!425390 () Bool)

(assert (=> b!655755 (= res!425390 (arrayContainsKey!0 lt!305953 (select (arr!18543 a!2986) j!136) j!136))))

(declare-fun e!376591 () Bool)

(assert (=> b!655755 (=> (not res!425390) (not e!376591))))

(declare-fun e!376594 () Bool)

(assert (=> b!655755 (= e!376594 e!376591)))

(declare-fun b!655756 () Bool)

(declare-fun Unit!22588 () Unit!22584)

(assert (=> b!655756 (= e!376600 Unit!22588)))

(declare-fun b!655757 () Bool)

(declare-fun e!376589 () Bool)

(declare-datatypes ((SeekEntryResult!6983 0))(
  ( (MissingZero!6983 (index!30291 (_ BitVec 32))) (Found!6983 (index!30292 (_ BitVec 32))) (Intermediate!6983 (undefined!7795 Bool) (index!30293 (_ BitVec 32)) (x!59080 (_ BitVec 32))) (Undefined!6983) (MissingVacant!6983 (index!30294 (_ BitVec 32))) )
))
(declare-fun lt!305960 () SeekEntryResult!6983)

(declare-fun lt!305961 () SeekEntryResult!6983)

(assert (=> b!655757 (= e!376589 (= lt!305960 lt!305961))))

(declare-fun b!655758 () Bool)

(assert (=> b!655758 (= e!376591 (arrayContainsKey!0 lt!305953 (select (arr!18543 a!2986) j!136) index!984))))

(declare-fun b!655759 () Bool)

(declare-fun res!425383 () Bool)

(assert (=> b!655759 (= res!425383 (bvsge j!136 index!984))))

(assert (=> b!655759 (=> res!425383 e!376594)))

(assert (=> b!655759 (= e!376597 e!376594)))

(declare-fun b!655760 () Bool)

(declare-fun Unit!22589 () Unit!22584)

(assert (=> b!655760 (= e!376593 Unit!22589)))

(declare-fun b!655761 () Bool)

(declare-fun e!376602 () Unit!22584)

(declare-fun Unit!22590 () Unit!22584)

(assert (=> b!655761 (= e!376602 Unit!22590)))

(assert (=> b!655761 false))

(declare-fun b!655762 () Bool)

(declare-fun res!425388 () Bool)

(assert (=> b!655762 (=> (not res!425388) (not e!376590))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38686 (_ BitVec 32)) Bool)

(assert (=> b!655762 (= res!425388 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!655763 () Bool)

(declare-fun e!376592 () Bool)

(assert (=> b!655763 (= e!376590 e!376592)))

(declare-fun res!425381 () Bool)

(assert (=> b!655763 (=> (not res!425381) (not e!376592))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!655763 (= res!425381 (= (select (store (arr!18543 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!655763 (= lt!305953 (array!38687 (store (arr!18543 a!2986) i!1108 k!1786) (size!18907 a!2986)))))

(declare-fun b!655764 () Bool)

(declare-fun res!425394 () Bool)

(assert (=> b!655764 (=> (not res!425394) (not e!376598))))

(assert (=> b!655764 (= res!425394 (validKeyInArray!0 k!1786))))

(declare-fun b!655765 () Bool)

(assert (=> b!655765 false))

(declare-fun lt!305959 () Unit!22584)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38686 (_ BitVec 64) (_ BitVec 32) List!12584) Unit!22584)

(assert (=> b!655765 (= lt!305959 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!305953 (select (arr!18543 a!2986) j!136) index!984 Nil!12581))))

(assert (=> b!655765 (arrayNoDuplicates!0 lt!305953 index!984 Nil!12581)))

(declare-fun lt!305951 () Unit!22584)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38686 (_ BitVec 32) (_ BitVec 32)) Unit!22584)

(assert (=> b!655765 (= lt!305951 (lemmaNoDuplicateFromThenFromBigger!0 lt!305953 #b00000000000000000000000000000000 index!984))))

(assert (=> b!655765 (arrayNoDuplicates!0 lt!305953 #b00000000000000000000000000000000 Nil!12581)))

(declare-fun lt!305962 () Unit!22584)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38686 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12584) Unit!22584)

(assert (=> b!655765 (= lt!305962 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12581))))

(assert (=> b!655765 (arrayContainsKey!0 lt!305953 (select (arr!18543 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!305956 () Unit!22584)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38686 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22584)

(assert (=> b!655765 (= lt!305956 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!305953 (select (arr!18543 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!376601 () Bool)

(assert (=> b!655765 e!376601))

(declare-fun res!425384 () Bool)

(assert (=> b!655765 (=> (not res!425384) (not e!376601))))

(assert (=> b!655765 (= res!425384 (arrayContainsKey!0 lt!305953 (select (arr!18543 a!2986) j!136) j!136))))

(declare-fun Unit!22591 () Unit!22584)

(assert (=> b!655765 (= e!376593 Unit!22591)))

(declare-fun b!655766 () Bool)

(assert (=> b!655766 false))

(declare-fun lt!305954 () Unit!22584)

(assert (=> b!655766 (= lt!305954 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!305953 (select (arr!18543 a!2986) j!136) j!136 Nil!12581))))

(assert (=> b!655766 (arrayNoDuplicates!0 lt!305953 j!136 Nil!12581)))

(declare-fun lt!305952 () Unit!22584)

(assert (=> b!655766 (= lt!305952 (lemmaNoDuplicateFromThenFromBigger!0 lt!305953 #b00000000000000000000000000000000 j!136))))

(assert (=> b!655766 (arrayNoDuplicates!0 lt!305953 #b00000000000000000000000000000000 Nil!12581)))

(declare-fun lt!305945 () Unit!22584)

(assert (=> b!655766 (= lt!305945 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12581))))

(assert (=> b!655766 (arrayContainsKey!0 lt!305953 (select (arr!18543 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!305948 () Unit!22584)

(assert (=> b!655766 (= lt!305948 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!305953 (select (arr!18543 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!22592 () Unit!22584)

(assert (=> b!655766 (= e!376600 Unit!22592)))

(declare-fun lt!305943 () SeekEntryResult!6983)

(declare-fun e!376599 () Bool)

(declare-fun b!655767 () Bool)

(assert (=> b!655767 (= e!376599 (not (or (not (= lt!305943 (MissingVacant!6983 vacantSpotIndex!68))) (bvslt index!984 (size!18907 a!2986)))))))

(declare-fun lt!305946 () Unit!22584)

(assert (=> b!655767 (= lt!305946 e!376595)))

(declare-fun c!75551 () Bool)

(assert (=> b!655767 (= c!75551 (= lt!305943 (Found!6983 index!984)))))

(declare-fun lt!305958 () Unit!22584)

(assert (=> b!655767 (= lt!305958 e!376602)))

(declare-fun c!75553 () Bool)

(assert (=> b!655767 (= c!75553 (= lt!305943 Undefined!6983))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!305950 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38686 (_ BitVec 32)) SeekEntryResult!6983)

(assert (=> b!655767 (= lt!305943 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!305950 lt!305953 mask!3053))))

(assert (=> b!655767 e!376589))

(declare-fun res!425389 () Bool)

(assert (=> b!655767 (=> (not res!425389) (not e!376589))))

(declare-fun lt!305949 () (_ BitVec 32))

(assert (=> b!655767 (= res!425389 (= lt!305961 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!305949 vacantSpotIndex!68 lt!305950 lt!305953 mask!3053)))))

(assert (=> b!655767 (= lt!305961 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!305949 vacantSpotIndex!68 (select (arr!18543 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!655767 (= lt!305950 (select (store (arr!18543 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!305947 () Unit!22584)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38686 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22584)

(assert (=> b!655767 (= lt!305947 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!305949 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!655767 (= lt!305949 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!655768 () Bool)

(declare-fun Unit!22593 () Unit!22584)

(assert (=> b!655768 (= e!376602 Unit!22593)))

(declare-fun b!655769 () Bool)

(assert (=> b!655769 (= e!376598 e!376590)))

(declare-fun res!425382 () Bool)

(assert (=> b!655769 (=> (not res!425382) (not e!376590))))

(declare-fun lt!305944 () SeekEntryResult!6983)

(assert (=> b!655769 (= res!425382 (or (= lt!305944 (MissingZero!6983 i!1108)) (= lt!305944 (MissingVacant!6983 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38686 (_ BitVec 32)) SeekEntryResult!6983)

(assert (=> b!655769 (= lt!305944 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!655770 () Bool)

(assert (=> b!655770 (= e!376592 e!376599)))

(declare-fun res!425395 () Bool)

(assert (=> b!655770 (=> (not res!425395) (not e!376599))))

(assert (=> b!655770 (= res!425395 (and (= lt!305960 (Found!6983 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18543 a!2986) index!984) (select (arr!18543 a!2986) j!136))) (not (= (select (arr!18543 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!655770 (= lt!305960 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18543 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!655771 () Bool)

(assert (=> b!655771 (= e!376601 (arrayContainsKey!0 lt!305953 (select (arr!18543 a!2986) j!136) index!984))))

(declare-fun b!655772 () Bool)

(declare-fun res!425396 () Bool)

(assert (=> b!655772 (=> (not res!425396) (not e!376590))))

(assert (=> b!655772 (= res!425396 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18543 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!59366 res!425387) b!655751))

(assert (= (and b!655751 res!425386) b!655754))

(assert (= (and b!655754 res!425392) b!655764))

(assert (= (and b!655764 res!425394) b!655752))

(assert (= (and b!655752 res!425391) b!655769))

(assert (= (and b!655769 res!425382) b!655762))

(assert (= (and b!655762 res!425388) b!655750))

(assert (= (and b!655750 res!425385) b!655772))

(assert (= (and b!655772 res!425396) b!655763))

(assert (= (and b!655763 res!425381) b!655770))

(assert (= (and b!655770 res!425395) b!655767))

(assert (= (and b!655767 res!425389) b!655757))

(assert (= (and b!655767 c!75553) b!655761))

(assert (= (and b!655767 (not c!75553)) b!655768))

(assert (= (and b!655767 c!75551) b!655749))

(assert (= (and b!655767 (not c!75551)) b!655753))

(assert (= (and b!655749 res!425393) b!655759))

(assert (= (and b!655759 (not res!425383)) b!655755))

(assert (= (and b!655755 res!425390) b!655758))

(assert (= (and b!655749 c!75552) b!655766))

(assert (= (and b!655749 (not c!75552)) b!655756))

(assert (= (and b!655749 c!75554) b!655765))

(assert (= (and b!655749 (not c!75554)) b!655760))

(assert (= (and b!655765 res!425384) b!655771))

(declare-fun m!628817 () Bool)

(assert (=> b!655749 m!628817))

(declare-fun m!628819 () Bool)

(assert (=> b!655749 m!628819))

(declare-fun m!628821 () Bool)

(assert (=> b!655749 m!628821))

(assert (=> b!655763 m!628817))

(declare-fun m!628823 () Bool)

(assert (=> b!655763 m!628823))

(declare-fun m!628825 () Bool)

(assert (=> b!655762 m!628825))

(declare-fun m!628827 () Bool)

(assert (=> b!655752 m!628827))

(declare-fun m!628829 () Bool)

(assert (=> b!655766 m!628829))

(assert (=> b!655766 m!628821))

(declare-fun m!628831 () Bool)

(assert (=> b!655766 m!628831))

(assert (=> b!655766 m!628821))

(declare-fun m!628833 () Bool)

(assert (=> b!655766 m!628833))

(declare-fun m!628835 () Bool)

(assert (=> b!655766 m!628835))

(assert (=> b!655766 m!628821))

(declare-fun m!628837 () Bool)

(assert (=> b!655766 m!628837))

(assert (=> b!655766 m!628821))

(declare-fun m!628839 () Bool)

(assert (=> b!655766 m!628839))

(declare-fun m!628841 () Bool)

(assert (=> b!655766 m!628841))

(declare-fun m!628843 () Bool)

(assert (=> b!655772 m!628843))

(declare-fun m!628845 () Bool)

(assert (=> b!655769 m!628845))

(declare-fun m!628847 () Bool)

(assert (=> b!655770 m!628847))

(assert (=> b!655770 m!628821))

(assert (=> b!655770 m!628821))

(declare-fun m!628849 () Bool)

(assert (=> b!655770 m!628849))

(declare-fun m!628851 () Bool)

(assert (=> b!655750 m!628851))

(declare-fun m!628853 () Bool)

(assert (=> b!655764 m!628853))

(declare-fun m!628855 () Bool)

(assert (=> start!59366 m!628855))

(declare-fun m!628857 () Bool)

(assert (=> start!59366 m!628857))

(assert (=> b!655754 m!628821))

(assert (=> b!655754 m!628821))

(declare-fun m!628859 () Bool)

(assert (=> b!655754 m!628859))

(assert (=> b!655758 m!628821))

(assert (=> b!655758 m!628821))

(declare-fun m!628861 () Bool)

(assert (=> b!655758 m!628861))

(declare-fun m!628863 () Bool)

(assert (=> b!655767 m!628863))

(declare-fun m!628865 () Bool)

(assert (=> b!655767 m!628865))

(declare-fun m!628867 () Bool)

(assert (=> b!655767 m!628867))

(assert (=> b!655767 m!628821))

(assert (=> b!655767 m!628817))

(assert (=> b!655767 m!628821))

(declare-fun m!628869 () Bool)

(assert (=> b!655767 m!628869))

(declare-fun m!628871 () Bool)

(assert (=> b!655767 m!628871))

(declare-fun m!628873 () Bool)

(assert (=> b!655767 m!628873))

(assert (=> b!655765 m!628821))

(assert (=> b!655765 m!628821))

(declare-fun m!628875 () Bool)

(assert (=> b!655765 m!628875))

(assert (=> b!655765 m!628821))

(declare-fun m!628877 () Bool)

(assert (=> b!655765 m!628877))

(assert (=> b!655765 m!628821))

(declare-fun m!628879 () Bool)

(assert (=> b!655765 m!628879))

(assert (=> b!655765 m!628841))

(assert (=> b!655765 m!628821))

(declare-fun m!628881 () Bool)

(assert (=> b!655765 m!628881))

(assert (=> b!655765 m!628829))

(declare-fun m!628883 () Bool)

(assert (=> b!655765 m!628883))

(declare-fun m!628885 () Bool)

(assert (=> b!655765 m!628885))

(assert (=> b!655755 m!628821))

(assert (=> b!655755 m!628821))

(assert (=> b!655755 m!628875))

(assert (=> b!655771 m!628821))

(assert (=> b!655771 m!628821))

(assert (=> b!655771 m!628861))

(push 1)

(assert (not start!59366))

(assert (not b!655755))

(assert (not b!655769))

(assert (not b!655758))

(assert (not b!655771))

(assert (not b!655764))

(assert (not b!655752))

(assert (not b!655754))

(assert (not b!655766))

(assert (not b!655762))

(assert (not b!655750))

(assert (not b!655770))

(assert (not b!655765))

(assert (not b!655767))

(check-sat)

(pop 1)

(push 1)

(check-sat)

