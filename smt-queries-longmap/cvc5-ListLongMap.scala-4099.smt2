; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56092 () Bool)

(assert start!56092)

(declare-fun b!618773 () Bool)

(declare-fun res!398681 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!618773 (= res!398681 (bvsge j!136 index!984))))

(declare-fun e!354865 () Bool)

(assert (=> b!618773 (=> res!398681 e!354865)))

(declare-fun e!354857 () Bool)

(assert (=> b!618773 (= e!354857 e!354865)))

(declare-fun b!618774 () Bool)

(declare-datatypes ((Unit!20398 0))(
  ( (Unit!20399) )
))
(declare-fun e!354860 () Unit!20398)

(declare-fun Unit!20400 () Unit!20398)

(assert (=> b!618774 (= e!354860 Unit!20400)))

(declare-datatypes ((array!37562 0))(
  ( (array!37563 (arr!18027 (Array (_ BitVec 32) (_ BitVec 64))) (size!18391 (_ BitVec 32))) )
))
(declare-fun lt!285390 () array!37562)

(declare-fun b!618775 () Bool)

(declare-fun e!354863 () Bool)

(declare-fun a!2986 () array!37562)

(declare-fun arrayContainsKey!0 (array!37562 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!618775 (= e!354863 (arrayContainsKey!0 lt!285390 (select (arr!18027 a!2986) j!136) index!984))))

(declare-fun e!354867 () Bool)

(declare-fun b!618776 () Bool)

(assert (=> b!618776 (= e!354867 (arrayContainsKey!0 lt!285390 (select (arr!18027 a!2986) j!136) index!984))))

(declare-fun b!618777 () Bool)

(declare-fun res!398685 () Bool)

(declare-fun e!354862 () Bool)

(assert (=> b!618777 (=> (not res!398685) (not e!354862))))

(declare-datatypes ((List!12068 0))(
  ( (Nil!12065) (Cons!12064 (h!13109 (_ BitVec 64)) (t!18296 List!12068)) )
))
(declare-fun arrayNoDuplicates!0 (array!37562 (_ BitVec 32) List!12068) Bool)

(assert (=> b!618777 (= res!398685 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12065))))

(declare-fun b!618778 () Bool)

(declare-fun res!398677 () Bool)

(declare-fun e!354864 () Bool)

(assert (=> b!618778 (=> (not res!398677) (not e!354864))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!618778 (= res!398677 (validKeyInArray!0 k!1786))))

(declare-fun b!618779 () Bool)

(declare-fun res!398673 () Bool)

(assert (=> b!618779 (= res!398673 (arrayContainsKey!0 lt!285390 (select (arr!18027 a!2986) j!136) j!136))))

(assert (=> b!618779 (=> (not res!398673) (not e!354867))))

(assert (=> b!618779 (= e!354865 e!354867)))

(declare-fun b!618781 () Bool)

(declare-fun e!354858 () Bool)

(declare-datatypes ((SeekEntryResult!6467 0))(
  ( (MissingZero!6467 (index!28152 (_ BitVec 32))) (Found!6467 (index!28153 (_ BitVec 32))) (Intermediate!6467 (undefined!7279 Bool) (index!28154 (_ BitVec 32)) (x!56939 (_ BitVec 32))) (Undefined!6467) (MissingVacant!6467 (index!28155 (_ BitVec 32))) )
))
(declare-fun lt!285380 () SeekEntryResult!6467)

(declare-fun lt!285388 () SeekEntryResult!6467)

(assert (=> b!618781 (= e!354858 (= lt!285380 lt!285388))))

(declare-fun b!618782 () Bool)

(declare-fun res!398682 () Bool)

(assert (=> b!618782 (=> (not res!398682) (not e!354864))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!618782 (= res!398682 (and (= (size!18391 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18391 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18391 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!618783 () Bool)

(assert (=> b!618783 false))

(declare-fun lt!285392 () Unit!20398)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37562 (_ BitVec 64) (_ BitVec 32) List!12068) Unit!20398)

(assert (=> b!618783 (= lt!285392 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!285390 (select (arr!18027 a!2986) j!136) j!136 Nil!12065))))

(assert (=> b!618783 (arrayNoDuplicates!0 lt!285390 j!136 Nil!12065)))

(declare-fun lt!285385 () Unit!20398)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37562 (_ BitVec 32) (_ BitVec 32)) Unit!20398)

(assert (=> b!618783 (= lt!285385 (lemmaNoDuplicateFromThenFromBigger!0 lt!285390 #b00000000000000000000000000000000 j!136))))

(assert (=> b!618783 (arrayNoDuplicates!0 lt!285390 #b00000000000000000000000000000000 Nil!12065)))

(declare-fun lt!285396 () Unit!20398)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37562 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12068) Unit!20398)

(assert (=> b!618783 (= lt!285396 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12065))))

(assert (=> b!618783 (arrayContainsKey!0 lt!285390 (select (arr!18027 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!285386 () Unit!20398)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37562 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20398)

(assert (=> b!618783 (= lt!285386 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!285390 (select (arr!18027 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20401 () Unit!20398)

(assert (=> b!618783 (= e!354860 Unit!20401)))

(declare-fun b!618784 () Bool)

(declare-fun res!398671 () Bool)

(assert (=> b!618784 (=> (not res!398671) (not e!354864))))

(assert (=> b!618784 (= res!398671 (validKeyInArray!0 (select (arr!18027 a!2986) j!136)))))

(declare-fun b!618785 () Bool)

(declare-fun res!398675 () Bool)

(assert (=> b!618785 (=> (not res!398675) (not e!354862))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37562 (_ BitVec 32)) Bool)

(assert (=> b!618785 (= res!398675 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!618786 () Bool)

(declare-fun e!354861 () Unit!20398)

(declare-fun Unit!20402 () Unit!20398)

(assert (=> b!618786 (= e!354861 Unit!20402)))

(declare-fun b!618787 () Bool)

(assert (=> b!618787 (= e!354864 e!354862)))

(declare-fun res!398674 () Bool)

(assert (=> b!618787 (=> (not res!398674) (not e!354862))))

(declare-fun lt!285379 () SeekEntryResult!6467)

(assert (=> b!618787 (= res!398674 (or (= lt!285379 (MissingZero!6467 i!1108)) (= lt!285379 (MissingVacant!6467 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37562 (_ BitVec 32)) SeekEntryResult!6467)

(assert (=> b!618787 (= lt!285379 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!618788 () Bool)

(declare-fun e!354859 () Unit!20398)

(declare-fun Unit!20403 () Unit!20398)

(assert (=> b!618788 (= e!354859 Unit!20403)))

(declare-fun b!618789 () Bool)

(declare-fun e!354854 () Bool)

(declare-fun e!354856 () Bool)

(assert (=> b!618789 (= e!354854 e!354856)))

(declare-fun res!398678 () Bool)

(assert (=> b!618789 (=> (not res!398678) (not e!354856))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!618789 (= res!398678 (and (= lt!285380 (Found!6467 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18027 a!2986) index!984) (select (arr!18027 a!2986) j!136))) (not (= (select (arr!18027 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37562 (_ BitVec 32)) SeekEntryResult!6467)

(assert (=> b!618789 (= lt!285380 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18027 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!618790 () Bool)

(assert (=> b!618790 false))

(declare-fun lt!285395 () Unit!20398)

(assert (=> b!618790 (= lt!285395 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!285390 (select (arr!18027 a!2986) j!136) index!984 Nil!12065))))

(assert (=> b!618790 (arrayNoDuplicates!0 lt!285390 index!984 Nil!12065)))

(declare-fun lt!285394 () Unit!20398)

(assert (=> b!618790 (= lt!285394 (lemmaNoDuplicateFromThenFromBigger!0 lt!285390 #b00000000000000000000000000000000 index!984))))

(assert (=> b!618790 (arrayNoDuplicates!0 lt!285390 #b00000000000000000000000000000000 Nil!12065)))

(declare-fun lt!285387 () Unit!20398)

(assert (=> b!618790 (= lt!285387 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12065))))

(assert (=> b!618790 (arrayContainsKey!0 lt!285390 (select (arr!18027 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!285393 () Unit!20398)

(assert (=> b!618790 (= lt!285393 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!285390 (select (arr!18027 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!618790 e!354863))

(declare-fun res!398684 () Bool)

(assert (=> b!618790 (=> (not res!398684) (not e!354863))))

(assert (=> b!618790 (= res!398684 (arrayContainsKey!0 lt!285390 (select (arr!18027 a!2986) j!136) j!136))))

(declare-fun Unit!20404 () Unit!20398)

(assert (=> b!618790 (= e!354859 Unit!20404)))

(declare-fun b!618791 () Bool)

(declare-fun Unit!20405 () Unit!20398)

(assert (=> b!618791 (= e!354861 Unit!20405)))

(declare-fun res!398676 () Bool)

(assert (=> b!618791 (= res!398676 (= (select (store (arr!18027 a!2986) i!1108 k!1786) index!984) (select (arr!18027 a!2986) j!136)))))

(assert (=> b!618791 (=> (not res!398676) (not e!354857))))

(assert (=> b!618791 e!354857))

(declare-fun c!70418 () Bool)

(assert (=> b!618791 (= c!70418 (bvslt j!136 index!984))))

(declare-fun lt!285381 () Unit!20398)

(assert (=> b!618791 (= lt!285381 e!354860)))

(declare-fun c!70419 () Bool)

(assert (=> b!618791 (= c!70419 (bvslt index!984 j!136))))

(declare-fun lt!285391 () Unit!20398)

(assert (=> b!618791 (= lt!285391 e!354859)))

(assert (=> b!618791 false))

(declare-fun b!618792 () Bool)

(assert (=> b!618792 (= e!354862 e!354854)))

(declare-fun res!398672 () Bool)

(assert (=> b!618792 (=> (not res!398672) (not e!354854))))

(assert (=> b!618792 (= res!398672 (= (select (store (arr!18027 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!618792 (= lt!285390 (array!37563 (store (arr!18027 a!2986) i!1108 k!1786) (size!18391 a!2986)))))

(declare-fun b!618793 () Bool)

(declare-fun res!398686 () Bool)

(assert (=> b!618793 (=> (not res!398686) (not e!354862))))

(assert (=> b!618793 (= res!398686 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18027 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!618794 () Bool)

(declare-fun e!354853 () Unit!20398)

(declare-fun Unit!20406 () Unit!20398)

(assert (=> b!618794 (= e!354853 Unit!20406)))

(declare-fun b!618795 () Bool)

(declare-fun e!354866 () Bool)

(assert (=> b!618795 (= e!354866 true)))

(assert (=> b!618795 (= (select (store (arr!18027 a!2986) i!1108 k!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!618780 () Bool)

(declare-fun res!398687 () Bool)

(assert (=> b!618780 (=> (not res!398687) (not e!354864))))

(assert (=> b!618780 (= res!398687 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!398683 () Bool)

(assert (=> start!56092 (=> (not res!398683) (not e!354864))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56092 (= res!398683 (validMask!0 mask!3053))))

(assert (=> start!56092 e!354864))

(assert (=> start!56092 true))

(declare-fun array_inv!13823 (array!37562) Bool)

(assert (=> start!56092 (array_inv!13823 a!2986)))

(declare-fun b!618796 () Bool)

(declare-fun Unit!20407 () Unit!20398)

(assert (=> b!618796 (= e!354853 Unit!20407)))

(assert (=> b!618796 false))

(declare-fun b!618797 () Bool)

(assert (=> b!618797 (= e!354856 (not e!354866))))

(declare-fun res!398679 () Bool)

(assert (=> b!618797 (=> res!398679 e!354866)))

(declare-fun lt!285397 () SeekEntryResult!6467)

(assert (=> b!618797 (= res!398679 (not (= lt!285397 (MissingVacant!6467 vacantSpotIndex!68))))))

(declare-fun lt!285384 () Unit!20398)

(assert (=> b!618797 (= lt!285384 e!354861)))

(declare-fun c!70420 () Bool)

(assert (=> b!618797 (= c!70420 (= lt!285397 (Found!6467 index!984)))))

(declare-fun lt!285389 () Unit!20398)

(assert (=> b!618797 (= lt!285389 e!354853)))

(declare-fun c!70421 () Bool)

(assert (=> b!618797 (= c!70421 (= lt!285397 Undefined!6467))))

(declare-fun lt!285378 () (_ BitVec 64))

(assert (=> b!618797 (= lt!285397 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!285378 lt!285390 mask!3053))))

(assert (=> b!618797 e!354858))

(declare-fun res!398680 () Bool)

(assert (=> b!618797 (=> (not res!398680) (not e!354858))))

(declare-fun lt!285382 () (_ BitVec 32))

(assert (=> b!618797 (= res!398680 (= lt!285388 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!285382 vacantSpotIndex!68 lt!285378 lt!285390 mask!3053)))))

(assert (=> b!618797 (= lt!285388 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!285382 vacantSpotIndex!68 (select (arr!18027 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!618797 (= lt!285378 (select (store (arr!18027 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!285383 () Unit!20398)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37562 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20398)

(assert (=> b!618797 (= lt!285383 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!285382 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!618797 (= lt!285382 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!56092 res!398683) b!618782))

(assert (= (and b!618782 res!398682) b!618784))

(assert (= (and b!618784 res!398671) b!618778))

(assert (= (and b!618778 res!398677) b!618780))

(assert (= (and b!618780 res!398687) b!618787))

(assert (= (and b!618787 res!398674) b!618785))

(assert (= (and b!618785 res!398675) b!618777))

(assert (= (and b!618777 res!398685) b!618793))

(assert (= (and b!618793 res!398686) b!618792))

(assert (= (and b!618792 res!398672) b!618789))

(assert (= (and b!618789 res!398678) b!618797))

(assert (= (and b!618797 res!398680) b!618781))

(assert (= (and b!618797 c!70421) b!618796))

(assert (= (and b!618797 (not c!70421)) b!618794))

(assert (= (and b!618797 c!70420) b!618791))

(assert (= (and b!618797 (not c!70420)) b!618786))

(assert (= (and b!618791 res!398676) b!618773))

(assert (= (and b!618773 (not res!398681)) b!618779))

(assert (= (and b!618779 res!398673) b!618776))

(assert (= (and b!618791 c!70418) b!618783))

(assert (= (and b!618791 (not c!70418)) b!618774))

(assert (= (and b!618791 c!70419) b!618790))

(assert (= (and b!618791 (not c!70419)) b!618788))

(assert (= (and b!618790 res!398684) b!618775))

(assert (= (and b!618797 (not res!398679)) b!618795))

(declare-fun m!594791 () Bool)

(assert (=> b!618790 m!594791))

(declare-fun m!594793 () Bool)

(assert (=> b!618790 m!594793))

(declare-fun m!594795 () Bool)

(assert (=> b!618790 m!594795))

(assert (=> b!618790 m!594793))

(assert (=> b!618790 m!594793))

(declare-fun m!594797 () Bool)

(assert (=> b!618790 m!594797))

(declare-fun m!594799 () Bool)

(assert (=> b!618790 m!594799))

(declare-fun m!594801 () Bool)

(assert (=> b!618790 m!594801))

(assert (=> b!618790 m!594793))

(declare-fun m!594803 () Bool)

(assert (=> b!618790 m!594803))

(assert (=> b!618790 m!594793))

(declare-fun m!594805 () Bool)

(assert (=> b!618790 m!594805))

(declare-fun m!594807 () Bool)

(assert (=> b!618790 m!594807))

(assert (=> b!618779 m!594793))

(assert (=> b!618779 m!594793))

(assert (=> b!618779 m!594803))

(declare-fun m!594809 () Bool)

(assert (=> start!56092 m!594809))

(declare-fun m!594811 () Bool)

(assert (=> start!56092 m!594811))

(assert (=> b!618784 m!594793))

(assert (=> b!618784 m!594793))

(declare-fun m!594813 () Bool)

(assert (=> b!618784 m!594813))

(declare-fun m!594815 () Bool)

(assert (=> b!618789 m!594815))

(assert (=> b!618789 m!594793))

(assert (=> b!618789 m!594793))

(declare-fun m!594817 () Bool)

(assert (=> b!618789 m!594817))

(declare-fun m!594819 () Bool)

(assert (=> b!618777 m!594819))

(declare-fun m!594821 () Bool)

(assert (=> b!618797 m!594821))

(declare-fun m!594823 () Bool)

(assert (=> b!618797 m!594823))

(assert (=> b!618797 m!594793))

(declare-fun m!594825 () Bool)

(assert (=> b!618797 m!594825))

(declare-fun m!594827 () Bool)

(assert (=> b!618797 m!594827))

(declare-fun m!594829 () Bool)

(assert (=> b!618797 m!594829))

(assert (=> b!618797 m!594793))

(declare-fun m!594831 () Bool)

(assert (=> b!618797 m!594831))

(declare-fun m!594833 () Bool)

(assert (=> b!618797 m!594833))

(declare-fun m!594835 () Bool)

(assert (=> b!618778 m!594835))

(declare-fun m!594837 () Bool)

(assert (=> b!618793 m!594837))

(declare-fun m!594839 () Bool)

(assert (=> b!618785 m!594839))

(assert (=> b!618791 m!594825))

(declare-fun m!594841 () Bool)

(assert (=> b!618791 m!594841))

(assert (=> b!618791 m!594793))

(assert (=> b!618795 m!594825))

(assert (=> b!618795 m!594841))

(assert (=> b!618783 m!594793))

(declare-fun m!594843 () Bool)

(assert (=> b!618783 m!594843))

(assert (=> b!618783 m!594791))

(assert (=> b!618783 m!594793))

(assert (=> b!618783 m!594793))

(declare-fun m!594845 () Bool)

(assert (=> b!618783 m!594845))

(declare-fun m!594847 () Bool)

(assert (=> b!618783 m!594847))

(declare-fun m!594849 () Bool)

(assert (=> b!618783 m!594849))

(assert (=> b!618783 m!594793))

(declare-fun m!594851 () Bool)

(assert (=> b!618783 m!594851))

(assert (=> b!618783 m!594807))

(declare-fun m!594853 () Bool)

(assert (=> b!618780 m!594853))

(assert (=> b!618776 m!594793))

(assert (=> b!618776 m!594793))

(declare-fun m!594855 () Bool)

(assert (=> b!618776 m!594855))

(declare-fun m!594857 () Bool)

(assert (=> b!618787 m!594857))

(assert (=> b!618775 m!594793))

(assert (=> b!618775 m!594793))

(assert (=> b!618775 m!594855))

(assert (=> b!618792 m!594825))

(declare-fun m!594859 () Bool)

(assert (=> b!618792 m!594859))

(push 1)

