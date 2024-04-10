; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59570 () Bool)

(assert start!59570)

(declare-fun b!657779 () Bool)

(declare-datatypes ((Unit!22764 0))(
  ( (Unit!22765) )
))
(declare-fun e!377870 () Unit!22764)

(declare-fun Unit!22766 () Unit!22764)

(assert (=> b!657779 (= e!377870 Unit!22766)))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!38728 0))(
  ( (array!38729 (arr!18561 (Array (_ BitVec 32) (_ BitVec 64))) (size!18925 (_ BitVec 32))) )
))
(declare-fun lt!307335 () array!38728)

(declare-fun e!377875 () Bool)

(declare-fun b!657780 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!38728)

(declare-fun arrayContainsKey!0 (array!38728 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!657780 (= e!377875 (arrayContainsKey!0 lt!307335 (select (arr!18561 a!2986) j!136) index!984))))

(declare-fun b!657781 () Bool)

(declare-fun res!426554 () Bool)

(declare-fun e!377871 () Bool)

(assert (=> b!657781 (=> (not res!426554) (not e!377871))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!657781 (= res!426554 (and (= (size!18925 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18925 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18925 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!657782 () Bool)

(declare-fun e!377864 () Bool)

(assert (=> b!657782 (= e!377864 true)))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!657782 (= (select (store (arr!18561 a!2986) i!1108 k!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun res!426555 () Bool)

(assert (=> start!59570 (=> (not res!426555) (not e!377871))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59570 (= res!426555 (validMask!0 mask!3053))))

(assert (=> start!59570 e!377871))

(assert (=> start!59570 true))

(declare-fun array_inv!14357 (array!38728) Bool)

(assert (=> start!59570 (array_inv!14357 a!2986)))

(declare-fun b!657783 () Bool)

(declare-fun e!377865 () Bool)

(declare-datatypes ((SeekEntryResult!7001 0))(
  ( (MissingZero!7001 (index!30369 (_ BitVec 32))) (Found!7001 (index!30370 (_ BitVec 32))) (Intermediate!7001 (undefined!7813 Bool) (index!30371 (_ BitVec 32)) (x!59164 (_ BitVec 32))) (Undefined!7001) (MissingVacant!7001 (index!30372 (_ BitVec 32))) )
))
(declare-fun lt!307338 () SeekEntryResult!7001)

(declare-fun lt!307341 () SeekEntryResult!7001)

(assert (=> b!657783 (= e!377865 (= lt!307338 lt!307341))))

(declare-fun b!657784 () Bool)

(declare-fun e!377872 () Unit!22764)

(declare-fun Unit!22767 () Unit!22764)

(assert (=> b!657784 (= e!377872 Unit!22767)))

(assert (=> b!657784 false))

(declare-fun b!657785 () Bool)

(declare-fun res!426556 () Bool)

(assert (=> b!657785 (= res!426556 (bvsge j!136 index!984))))

(declare-fun e!377874 () Bool)

(assert (=> b!657785 (=> res!426556 e!377874)))

(declare-fun e!377867 () Bool)

(assert (=> b!657785 (= e!377867 e!377874)))

(declare-fun b!657786 () Bool)

(assert (=> b!657786 false))

(declare-fun lt!307337 () Unit!22764)

(declare-datatypes ((List!12602 0))(
  ( (Nil!12599) (Cons!12598 (h!13643 (_ BitVec 64)) (t!18830 List!12602)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38728 (_ BitVec 64) (_ BitVec 32) List!12602) Unit!22764)

(assert (=> b!657786 (= lt!307337 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!307335 (select (arr!18561 a!2986) j!136) index!984 Nil!12599))))

(declare-fun arrayNoDuplicates!0 (array!38728 (_ BitVec 32) List!12602) Bool)

(assert (=> b!657786 (arrayNoDuplicates!0 lt!307335 index!984 Nil!12599)))

(declare-fun lt!307336 () Unit!22764)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38728 (_ BitVec 32) (_ BitVec 32)) Unit!22764)

(assert (=> b!657786 (= lt!307336 (lemmaNoDuplicateFromThenFromBigger!0 lt!307335 #b00000000000000000000000000000000 index!984))))

(assert (=> b!657786 (arrayNoDuplicates!0 lt!307335 #b00000000000000000000000000000000 Nil!12599)))

(declare-fun lt!307345 () Unit!22764)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38728 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12602) Unit!22764)

(assert (=> b!657786 (= lt!307345 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12599))))

(assert (=> b!657786 (arrayContainsKey!0 lt!307335 (select (arr!18561 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!307340 () Unit!22764)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38728 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22764)

(assert (=> b!657786 (= lt!307340 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!307335 (select (arr!18561 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!657786 e!377875))

(declare-fun res!426563 () Bool)

(assert (=> b!657786 (=> (not res!426563) (not e!377875))))

(assert (=> b!657786 (= res!426563 (arrayContainsKey!0 lt!307335 (select (arr!18561 a!2986) j!136) j!136))))

(declare-fun e!377866 () Unit!22764)

(declare-fun Unit!22768 () Unit!22764)

(assert (=> b!657786 (= e!377866 Unit!22768)))

(declare-fun b!657787 () Bool)

(declare-fun Unit!22769 () Unit!22764)

(assert (=> b!657787 (= e!377866 Unit!22769)))

(declare-fun b!657788 () Bool)

(declare-fun res!426553 () Bool)

(declare-fun e!377868 () Bool)

(assert (=> b!657788 (=> (not res!426553) (not e!377868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38728 (_ BitVec 32)) Bool)

(assert (=> b!657788 (= res!426553 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!657789 () Bool)

(assert (=> b!657789 (= e!377871 e!377868)))

(declare-fun res!426562 () Bool)

(assert (=> b!657789 (=> (not res!426562) (not e!377868))))

(declare-fun lt!307329 () SeekEntryResult!7001)

(assert (=> b!657789 (= res!426562 (or (= lt!307329 (MissingZero!7001 i!1108)) (= lt!307329 (MissingVacant!7001 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38728 (_ BitVec 32)) SeekEntryResult!7001)

(assert (=> b!657789 (= lt!307329 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!657790 () Bool)

(declare-fun res!426547 () Bool)

(assert (=> b!657790 (=> (not res!426547) (not e!377871))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!657790 (= res!426547 (validKeyInArray!0 k!1786))))

(declare-fun b!657791 () Bool)

(declare-fun res!426557 () Bool)

(assert (=> b!657791 (=> (not res!426557) (not e!377868))))

(assert (=> b!657791 (= res!426557 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12599))))

(declare-fun b!657792 () Bool)

(declare-fun res!426550 () Bool)

(assert (=> b!657792 (=> (not res!426550) (not e!377871))))

(assert (=> b!657792 (= res!426550 (validKeyInArray!0 (select (arr!18561 a!2986) j!136)))))

(declare-fun b!657793 () Bool)

(declare-fun e!377876 () Bool)

(assert (=> b!657793 (= e!377876 (not e!377864))))

(declare-fun res!426548 () Bool)

(assert (=> b!657793 (=> res!426548 e!377864)))

(declare-fun lt!307333 () SeekEntryResult!7001)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!657793 (= res!426548 (not (= lt!307333 (MissingVacant!7001 vacantSpotIndex!68))))))

(declare-fun lt!307346 () Unit!22764)

(assert (=> b!657793 (= lt!307346 e!377870)))

(declare-fun c!75985 () Bool)

(assert (=> b!657793 (= c!75985 (= lt!307333 (Found!7001 index!984)))))

(declare-fun lt!307334 () Unit!22764)

(assert (=> b!657793 (= lt!307334 e!377872)))

(declare-fun c!75983 () Bool)

(assert (=> b!657793 (= c!75983 (= lt!307333 Undefined!7001))))

(declare-fun lt!307342 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38728 (_ BitVec 32)) SeekEntryResult!7001)

(assert (=> b!657793 (= lt!307333 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!307342 lt!307335 mask!3053))))

(assert (=> b!657793 e!377865))

(declare-fun res!426558 () Bool)

(assert (=> b!657793 (=> (not res!426558) (not e!377865))))

(declare-fun lt!307347 () (_ BitVec 32))

(assert (=> b!657793 (= res!426558 (= lt!307341 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!307347 vacantSpotIndex!68 lt!307342 lt!307335 mask!3053)))))

(assert (=> b!657793 (= lt!307341 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!307347 vacantSpotIndex!68 (select (arr!18561 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!657793 (= lt!307342 (select (store (arr!18561 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!307344 () Unit!22764)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38728 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22764)

(assert (=> b!657793 (= lt!307344 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!307347 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!657793 (= lt!307347 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!657794 () Bool)

(declare-fun res!426552 () Bool)

(assert (=> b!657794 (=> (not res!426552) (not e!377868))))

(assert (=> b!657794 (= res!426552 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18561 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!657795 () Bool)

(declare-fun e!377873 () Bool)

(assert (=> b!657795 (= e!377868 e!377873)))

(declare-fun res!426559 () Bool)

(assert (=> b!657795 (=> (not res!426559) (not e!377873))))

(assert (=> b!657795 (= res!426559 (= (select (store (arr!18561 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!657795 (= lt!307335 (array!38729 (store (arr!18561 a!2986) i!1108 k!1786) (size!18925 a!2986)))))

(declare-fun b!657796 () Bool)

(declare-fun res!426561 () Bool)

(assert (=> b!657796 (=> (not res!426561) (not e!377871))))

(assert (=> b!657796 (= res!426561 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!657797 () Bool)

(assert (=> b!657797 (= e!377873 e!377876)))

(declare-fun res!426549 () Bool)

(assert (=> b!657797 (=> (not res!426549) (not e!377876))))

(assert (=> b!657797 (= res!426549 (and (= lt!307338 (Found!7001 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18561 a!2986) index!984) (select (arr!18561 a!2986) j!136))) (not (= (select (arr!18561 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!657797 (= lt!307338 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18561 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!657798 () Bool)

(declare-fun e!377863 () Bool)

(assert (=> b!657798 (= e!377863 (arrayContainsKey!0 lt!307335 (select (arr!18561 a!2986) j!136) index!984))))

(declare-fun b!657799 () Bool)

(declare-fun Unit!22770 () Unit!22764)

(assert (=> b!657799 (= e!377870 Unit!22770)))

(declare-fun res!426551 () Bool)

(assert (=> b!657799 (= res!426551 (= (select (store (arr!18561 a!2986) i!1108 k!1786) index!984) (select (arr!18561 a!2986) j!136)))))

(assert (=> b!657799 (=> (not res!426551) (not e!377867))))

(assert (=> b!657799 e!377867))

(declare-fun c!75986 () Bool)

(assert (=> b!657799 (= c!75986 (bvslt j!136 index!984))))

(declare-fun lt!307332 () Unit!22764)

(declare-fun e!377869 () Unit!22764)

(assert (=> b!657799 (= lt!307332 e!377869)))

(declare-fun c!75984 () Bool)

(assert (=> b!657799 (= c!75984 (bvslt index!984 j!136))))

(declare-fun lt!307331 () Unit!22764)

(assert (=> b!657799 (= lt!307331 e!377866)))

(assert (=> b!657799 false))

(declare-fun b!657800 () Bool)

(declare-fun Unit!22771 () Unit!22764)

(assert (=> b!657800 (= e!377869 Unit!22771)))

(declare-fun b!657801 () Bool)

(assert (=> b!657801 false))

(declare-fun lt!307343 () Unit!22764)

(assert (=> b!657801 (= lt!307343 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!307335 (select (arr!18561 a!2986) j!136) j!136 Nil!12599))))

(assert (=> b!657801 (arrayNoDuplicates!0 lt!307335 j!136 Nil!12599)))

(declare-fun lt!307339 () Unit!22764)

(assert (=> b!657801 (= lt!307339 (lemmaNoDuplicateFromThenFromBigger!0 lt!307335 #b00000000000000000000000000000000 j!136))))

(assert (=> b!657801 (arrayNoDuplicates!0 lt!307335 #b00000000000000000000000000000000 Nil!12599)))

(declare-fun lt!307348 () Unit!22764)

(assert (=> b!657801 (= lt!307348 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12599))))

(assert (=> b!657801 (arrayContainsKey!0 lt!307335 (select (arr!18561 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!307330 () Unit!22764)

(assert (=> b!657801 (= lt!307330 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!307335 (select (arr!18561 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!22772 () Unit!22764)

(assert (=> b!657801 (= e!377869 Unit!22772)))

(declare-fun b!657802 () Bool)

(declare-fun Unit!22773 () Unit!22764)

(assert (=> b!657802 (= e!377872 Unit!22773)))

(declare-fun res!426560 () Bool)

(declare-fun b!657803 () Bool)

(assert (=> b!657803 (= res!426560 (arrayContainsKey!0 lt!307335 (select (arr!18561 a!2986) j!136) j!136))))

(assert (=> b!657803 (=> (not res!426560) (not e!377863))))

(assert (=> b!657803 (= e!377874 e!377863)))

(assert (= (and start!59570 res!426555) b!657781))

(assert (= (and b!657781 res!426554) b!657792))

(assert (= (and b!657792 res!426550) b!657790))

(assert (= (and b!657790 res!426547) b!657796))

(assert (= (and b!657796 res!426561) b!657789))

(assert (= (and b!657789 res!426562) b!657788))

(assert (= (and b!657788 res!426553) b!657791))

(assert (= (and b!657791 res!426557) b!657794))

(assert (= (and b!657794 res!426552) b!657795))

(assert (= (and b!657795 res!426559) b!657797))

(assert (= (and b!657797 res!426549) b!657793))

(assert (= (and b!657793 res!426558) b!657783))

(assert (= (and b!657793 c!75983) b!657784))

(assert (= (and b!657793 (not c!75983)) b!657802))

(assert (= (and b!657793 c!75985) b!657799))

(assert (= (and b!657793 (not c!75985)) b!657779))

(assert (= (and b!657799 res!426551) b!657785))

(assert (= (and b!657785 (not res!426556)) b!657803))

(assert (= (and b!657803 res!426560) b!657798))

(assert (= (and b!657799 c!75986) b!657801))

(assert (= (and b!657799 (not c!75986)) b!657800))

(assert (= (and b!657799 c!75984) b!657786))

(assert (= (and b!657799 (not c!75984)) b!657787))

(assert (= (and b!657786 res!426563) b!657780))

(assert (= (and b!657793 (not res!426548)) b!657782))

(declare-fun m!630797 () Bool)

(assert (=> b!657780 m!630797))

(assert (=> b!657780 m!630797))

(declare-fun m!630799 () Bool)

(assert (=> b!657780 m!630799))

(assert (=> b!657803 m!630797))

(assert (=> b!657803 m!630797))

(declare-fun m!630801 () Bool)

(assert (=> b!657803 m!630801))

(declare-fun m!630803 () Bool)

(assert (=> b!657789 m!630803))

(declare-fun m!630805 () Bool)

(assert (=> b!657795 m!630805))

(declare-fun m!630807 () Bool)

(assert (=> b!657795 m!630807))

(declare-fun m!630809 () Bool)

(assert (=> b!657786 m!630809))

(assert (=> b!657786 m!630797))

(assert (=> b!657786 m!630801))

(assert (=> b!657786 m!630797))

(assert (=> b!657786 m!630797))

(declare-fun m!630811 () Bool)

(assert (=> b!657786 m!630811))

(declare-fun m!630813 () Bool)

(assert (=> b!657786 m!630813))

(declare-fun m!630815 () Bool)

(assert (=> b!657786 m!630815))

(assert (=> b!657786 m!630797))

(declare-fun m!630817 () Bool)

(assert (=> b!657786 m!630817))

(assert (=> b!657786 m!630797))

(declare-fun m!630819 () Bool)

(assert (=> b!657786 m!630819))

(declare-fun m!630821 () Bool)

(assert (=> b!657786 m!630821))

(declare-fun m!630823 () Bool)

(assert (=> b!657791 m!630823))

(assert (=> b!657801 m!630797))

(declare-fun m!630825 () Bool)

(assert (=> b!657801 m!630825))

(assert (=> b!657801 m!630815))

(declare-fun m!630827 () Bool)

(assert (=> b!657801 m!630827))

(assert (=> b!657801 m!630821))

(assert (=> b!657801 m!630797))

(declare-fun m!630829 () Bool)

(assert (=> b!657801 m!630829))

(assert (=> b!657801 m!630797))

(declare-fun m!630831 () Bool)

(assert (=> b!657801 m!630831))

(assert (=> b!657801 m!630797))

(declare-fun m!630833 () Bool)

(assert (=> b!657801 m!630833))

(declare-fun m!630835 () Bool)

(assert (=> b!657790 m!630835))

(declare-fun m!630837 () Bool)

(assert (=> start!59570 m!630837))

(declare-fun m!630839 () Bool)

(assert (=> start!59570 m!630839))

(assert (=> b!657799 m!630805))

(declare-fun m!630841 () Bool)

(assert (=> b!657799 m!630841))

(assert (=> b!657799 m!630797))

(declare-fun m!630843 () Bool)

(assert (=> b!657797 m!630843))

(assert (=> b!657797 m!630797))

(assert (=> b!657797 m!630797))

(declare-fun m!630845 () Bool)

(assert (=> b!657797 m!630845))

(assert (=> b!657792 m!630797))

(assert (=> b!657792 m!630797))

(declare-fun m!630847 () Bool)

(assert (=> b!657792 m!630847))

(declare-fun m!630849 () Bool)

(assert (=> b!657794 m!630849))

(declare-fun m!630851 () Bool)

(assert (=> b!657793 m!630851))

(declare-fun m!630853 () Bool)

(assert (=> b!657793 m!630853))

(assert (=> b!657793 m!630797))

(assert (=> b!657793 m!630797))

(declare-fun m!630855 () Bool)

(assert (=> b!657793 m!630855))

(assert (=> b!657793 m!630805))

(declare-fun m!630857 () Bool)

(assert (=> b!657793 m!630857))

(declare-fun m!630859 () Bool)

(assert (=> b!657793 m!630859))

(declare-fun m!630861 () Bool)

(assert (=> b!657793 m!630861))

(assert (=> b!657782 m!630805))

(assert (=> b!657782 m!630841))

(declare-fun m!630863 () Bool)

(assert (=> b!657796 m!630863))

(declare-fun m!630865 () Bool)

(assert (=> b!657788 m!630865))

(assert (=> b!657798 m!630797))

(assert (=> b!657798 m!630797))

(assert (=> b!657798 m!630799))

(push 1)

