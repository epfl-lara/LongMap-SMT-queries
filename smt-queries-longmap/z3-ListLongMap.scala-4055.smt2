; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55560 () Bool)

(assert start!55560)

(declare-fun b!607863 () Bool)

(declare-fun e!348108 () Bool)

(declare-fun e!348115 () Bool)

(assert (=> b!607863 (= e!348108 e!348115)))

(declare-fun res!390637 () Bool)

(assert (=> b!607863 (=> res!390637 e!348115)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!277606 () (_ BitVec 64))

(declare-fun lt!277593 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37291 0))(
  ( (array!37292 (arr!17896 (Array (_ BitVec 32) (_ BitVec 64))) (size!18260 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37291)

(assert (=> b!607863 (= res!390637 (or (not (= (select (arr!17896 a!2986) j!136) lt!277593)) (not (= (select (arr!17896 a!2986) j!136) lt!277606)) (bvsge j!136 index!984)))))

(declare-fun b!607864 () Bool)

(declare-fun res!390621 () Bool)

(declare-fun e!348106 () Bool)

(assert (=> b!607864 (=> (not res!390621) (not e!348106))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!607864 (= res!390621 (validKeyInArray!0 k0!1786))))

(declare-fun b!607865 () Bool)

(declare-fun e!348116 () Bool)

(declare-fun e!348111 () Bool)

(assert (=> b!607865 (= e!348116 (not e!348111))))

(declare-fun res!390640 () Bool)

(assert (=> b!607865 (=> res!390640 e!348111)))

(declare-datatypes ((SeekEntryResult!6336 0))(
  ( (MissingZero!6336 (index!27619 (_ BitVec 32))) (Found!6336 (index!27620 (_ BitVec 32))) (Intermediate!6336 (undefined!7148 Bool) (index!27621 (_ BitVec 32)) (x!56429 (_ BitVec 32))) (Undefined!6336) (MissingVacant!6336 (index!27622 (_ BitVec 32))) )
))
(declare-fun lt!277600 () SeekEntryResult!6336)

(assert (=> b!607865 (= res!390640 (not (= lt!277600 (Found!6336 index!984))))))

(declare-datatypes ((Unit!19396 0))(
  ( (Unit!19397) )
))
(declare-fun lt!277592 () Unit!19396)

(declare-fun e!348112 () Unit!19396)

(assert (=> b!607865 (= lt!277592 e!348112)))

(declare-fun c!68989 () Bool)

(assert (=> b!607865 (= c!68989 (= lt!277600 Undefined!6336))))

(declare-fun lt!277603 () array!37291)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37291 (_ BitVec 32)) SeekEntryResult!6336)

(assert (=> b!607865 (= lt!277600 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!277593 lt!277603 mask!3053))))

(declare-fun e!348114 () Bool)

(assert (=> b!607865 e!348114))

(declare-fun res!390626 () Bool)

(assert (=> b!607865 (=> (not res!390626) (not e!348114))))

(declare-fun lt!277605 () SeekEntryResult!6336)

(declare-fun lt!277594 () (_ BitVec 32))

(assert (=> b!607865 (= res!390626 (= lt!277605 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!277594 vacantSpotIndex!68 lt!277593 lt!277603 mask!3053)))))

(assert (=> b!607865 (= lt!277605 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!277594 vacantSpotIndex!68 (select (arr!17896 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!607865 (= lt!277593 (select (store (arr!17896 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!277591 () Unit!19396)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37291 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19396)

(assert (=> b!607865 (= lt!277591 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!277594 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!607865 (= lt!277594 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!607866 () Bool)

(declare-fun e!348109 () Bool)

(assert (=> b!607866 (= e!348115 e!348109)))

(declare-fun res!390624 () Bool)

(assert (=> b!607866 (=> (not res!390624) (not e!348109))))

(declare-fun arrayContainsKey!0 (array!37291 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!607866 (= res!390624 (arrayContainsKey!0 lt!277603 (select (arr!17896 a!2986) j!136) j!136))))

(declare-fun b!607867 () Bool)

(assert (=> b!607867 (= e!348109 (arrayContainsKey!0 lt!277603 (select (arr!17896 a!2986) j!136) index!984))))

(declare-fun b!607868 () Bool)

(declare-fun e!348117 () Bool)

(assert (=> b!607868 (= e!348117 (arrayContainsKey!0 lt!277603 (select (arr!17896 a!2986) j!136) index!984))))

(declare-fun b!607869 () Bool)

(declare-fun Unit!19398 () Unit!19396)

(assert (=> b!607869 (= e!348112 Unit!19398)))

(assert (=> b!607869 false))

(declare-fun res!390629 () Bool)

(assert (=> start!55560 (=> (not res!390629) (not e!348106))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55560 (= res!390629 (validMask!0 mask!3053))))

(assert (=> start!55560 e!348106))

(assert (=> start!55560 true))

(declare-fun array_inv!13692 (array!37291) Bool)

(assert (=> start!55560 (array_inv!13692 a!2986)))

(declare-fun b!607870 () Bool)

(declare-fun res!390632 () Bool)

(assert (=> b!607870 (=> (not res!390632) (not e!348106))))

(assert (=> b!607870 (= res!390632 (and (= (size!18260 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18260 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18260 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!607871 () Bool)

(declare-fun e!348104 () Bool)

(assert (=> b!607871 (= e!348111 e!348104)))

(declare-fun res!390634 () Bool)

(assert (=> b!607871 (=> res!390634 e!348104)))

(assert (=> b!607871 (= res!390634 (or (not (= (select (arr!17896 a!2986) j!136) lt!277593)) (not (= (select (arr!17896 a!2986) j!136) lt!277606))))))

(assert (=> b!607871 e!348108))

(declare-fun res!390633 () Bool)

(assert (=> b!607871 (=> (not res!390633) (not e!348108))))

(assert (=> b!607871 (= res!390633 (= lt!277606 (select (arr!17896 a!2986) j!136)))))

(assert (=> b!607871 (= lt!277606 (select (store (arr!17896 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!607872 () Bool)

(declare-fun e!348103 () Bool)

(assert (=> b!607872 (= e!348104 e!348103)))

(declare-fun res!390628 () Bool)

(assert (=> b!607872 (=> res!390628 e!348103)))

(assert (=> b!607872 (= res!390628 (bvsge index!984 j!136))))

(declare-fun lt!277596 () Unit!19396)

(declare-fun e!348105 () Unit!19396)

(assert (=> b!607872 (= lt!277596 e!348105)))

(declare-fun c!68990 () Bool)

(assert (=> b!607872 (= c!68990 (bvslt j!136 index!984))))

(declare-fun b!607873 () Bool)

(declare-fun res!390622 () Bool)

(declare-fun e!348113 () Bool)

(assert (=> b!607873 (=> res!390622 e!348113)))

(declare-datatypes ((List!11937 0))(
  ( (Nil!11934) (Cons!11933 (h!12978 (_ BitVec 64)) (t!18165 List!11937)) )
))
(declare-fun contains!3013 (List!11937 (_ BitVec 64)) Bool)

(assert (=> b!607873 (= res!390622 (contains!3013 Nil!11934 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!607874 () Bool)

(declare-fun Unit!19399 () Unit!19396)

(assert (=> b!607874 (= e!348105 Unit!19399)))

(declare-fun lt!277590 () Unit!19396)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37291 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19396)

(assert (=> b!607874 (= lt!277590 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!277603 (select (arr!17896 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!607874 (arrayContainsKey!0 lt!277603 (select (arr!17896 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!277601 () Unit!19396)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37291 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11937) Unit!19396)

(assert (=> b!607874 (= lt!277601 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11934))))

(declare-fun arrayNoDuplicates!0 (array!37291 (_ BitVec 32) List!11937) Bool)

(assert (=> b!607874 (arrayNoDuplicates!0 lt!277603 #b00000000000000000000000000000000 Nil!11934)))

(declare-fun lt!277602 () Unit!19396)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37291 (_ BitVec 32) (_ BitVec 32)) Unit!19396)

(assert (=> b!607874 (= lt!277602 (lemmaNoDuplicateFromThenFromBigger!0 lt!277603 #b00000000000000000000000000000000 j!136))))

(assert (=> b!607874 (arrayNoDuplicates!0 lt!277603 j!136 Nil!11934)))

(declare-fun lt!277597 () Unit!19396)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37291 (_ BitVec 64) (_ BitVec 32) List!11937) Unit!19396)

(assert (=> b!607874 (= lt!277597 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!277603 (select (arr!17896 a!2986) j!136) j!136 Nil!11934))))

(assert (=> b!607874 false))

(declare-fun b!607875 () Bool)

(declare-fun res!390630 () Bool)

(assert (=> b!607875 (=> res!390630 e!348113)))

(assert (=> b!607875 (= res!390630 (contains!3013 Nil!11934 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!607876 () Bool)

(declare-fun Unit!19400 () Unit!19396)

(assert (=> b!607876 (= e!348112 Unit!19400)))

(declare-fun b!607877 () Bool)

(declare-fun res!390641 () Bool)

(assert (=> b!607877 (=> (not res!390641) (not e!348106))))

(assert (=> b!607877 (= res!390641 (validKeyInArray!0 (select (arr!17896 a!2986) j!136)))))

(declare-fun b!607878 () Bool)

(declare-fun res!390636 () Bool)

(assert (=> b!607878 (=> res!390636 e!348113)))

(declare-fun noDuplicate!319 (List!11937) Bool)

(assert (=> b!607878 (= res!390636 (not (noDuplicate!319 Nil!11934)))))

(declare-fun b!607879 () Bool)

(declare-fun res!390620 () Bool)

(declare-fun e!348102 () Bool)

(assert (=> b!607879 (=> (not res!390620) (not e!348102))))

(assert (=> b!607879 (= res!390620 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11934))))

(declare-fun b!607880 () Bool)

(declare-fun e!348110 () Bool)

(assert (=> b!607880 (= e!348102 e!348110)))

(declare-fun res!390625 () Bool)

(assert (=> b!607880 (=> (not res!390625) (not e!348110))))

(assert (=> b!607880 (= res!390625 (= (select (store (arr!17896 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!607880 (= lt!277603 (array!37292 (store (arr!17896 a!2986) i!1108 k0!1786) (size!18260 a!2986)))))

(declare-fun b!607881 () Bool)

(declare-fun res!390627 () Bool)

(assert (=> b!607881 (=> (not res!390627) (not e!348102))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37291 (_ BitVec 32)) Bool)

(assert (=> b!607881 (= res!390627 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!607882 () Bool)

(assert (=> b!607882 (= e!348110 e!348116)))

(declare-fun res!390623 () Bool)

(assert (=> b!607882 (=> (not res!390623) (not e!348116))))

(declare-fun lt!277604 () SeekEntryResult!6336)

(assert (=> b!607882 (= res!390623 (and (= lt!277604 (Found!6336 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17896 a!2986) index!984) (select (arr!17896 a!2986) j!136))) (not (= (select (arr!17896 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!607882 (= lt!277604 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17896 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!607883 () Bool)

(declare-fun res!390635 () Bool)

(assert (=> b!607883 (=> (not res!390635) (not e!348106))))

(assert (=> b!607883 (= res!390635 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!607884 () Bool)

(assert (=> b!607884 (= e!348114 (= lt!277604 lt!277605))))

(declare-fun b!607885 () Bool)

(assert (=> b!607885 (= e!348106 e!348102)))

(declare-fun res!390638 () Bool)

(assert (=> b!607885 (=> (not res!390638) (not e!348102))))

(declare-fun lt!277595 () SeekEntryResult!6336)

(assert (=> b!607885 (= res!390638 (or (= lt!277595 (MissingZero!6336 i!1108)) (= lt!277595 (MissingVacant!6336 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37291 (_ BitVec 32)) SeekEntryResult!6336)

(assert (=> b!607885 (= lt!277595 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!607886 () Bool)

(declare-fun Unit!19401 () Unit!19396)

(assert (=> b!607886 (= e!348105 Unit!19401)))

(declare-fun b!607887 () Bool)

(assert (=> b!607887 (= e!348113 true)))

(declare-fun lt!277599 () Bool)

(assert (=> b!607887 (= lt!277599 (contains!3013 Nil!11934 k0!1786))))

(declare-fun b!607888 () Bool)

(declare-fun res!390631 () Bool)

(assert (=> b!607888 (=> (not res!390631) (not e!348102))))

(assert (=> b!607888 (= res!390631 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17896 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!607889 () Bool)

(assert (=> b!607889 (= e!348103 e!348113)))

(declare-fun res!390619 () Bool)

(assert (=> b!607889 (=> res!390619 e!348113)))

(assert (=> b!607889 (= res!390619 (or (bvsge (size!18260 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18260 a!2986))))))

(assert (=> b!607889 (arrayContainsKey!0 lt!277603 (select (arr!17896 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!277598 () Unit!19396)

(assert (=> b!607889 (= lt!277598 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!277603 (select (arr!17896 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!607889 e!348117))

(declare-fun res!390639 () Bool)

(assert (=> b!607889 (=> (not res!390639) (not e!348117))))

(assert (=> b!607889 (= res!390639 (arrayContainsKey!0 lt!277603 (select (arr!17896 a!2986) j!136) j!136))))

(assert (= (and start!55560 res!390629) b!607870))

(assert (= (and b!607870 res!390632) b!607877))

(assert (= (and b!607877 res!390641) b!607864))

(assert (= (and b!607864 res!390621) b!607883))

(assert (= (and b!607883 res!390635) b!607885))

(assert (= (and b!607885 res!390638) b!607881))

(assert (= (and b!607881 res!390627) b!607879))

(assert (= (and b!607879 res!390620) b!607888))

(assert (= (and b!607888 res!390631) b!607880))

(assert (= (and b!607880 res!390625) b!607882))

(assert (= (and b!607882 res!390623) b!607865))

(assert (= (and b!607865 res!390626) b!607884))

(assert (= (and b!607865 c!68989) b!607869))

(assert (= (and b!607865 (not c!68989)) b!607876))

(assert (= (and b!607865 (not res!390640)) b!607871))

(assert (= (and b!607871 res!390633) b!607863))

(assert (= (and b!607863 (not res!390637)) b!607866))

(assert (= (and b!607866 res!390624) b!607867))

(assert (= (and b!607871 (not res!390634)) b!607872))

(assert (= (and b!607872 c!68990) b!607874))

(assert (= (and b!607872 (not c!68990)) b!607886))

(assert (= (and b!607872 (not res!390628)) b!607889))

(assert (= (and b!607889 res!390639) b!607868))

(assert (= (and b!607889 (not res!390619)) b!607878))

(assert (= (and b!607878 (not res!390636)) b!607875))

(assert (= (and b!607875 (not res!390630)) b!607873))

(assert (= (and b!607873 (not res!390622)) b!607887))

(declare-fun m!584555 () Bool)

(assert (=> b!607888 m!584555))

(declare-fun m!584557 () Bool)

(assert (=> b!607889 m!584557))

(assert (=> b!607889 m!584557))

(declare-fun m!584559 () Bool)

(assert (=> b!607889 m!584559))

(assert (=> b!607889 m!584557))

(declare-fun m!584561 () Bool)

(assert (=> b!607889 m!584561))

(assert (=> b!607889 m!584557))

(declare-fun m!584563 () Bool)

(assert (=> b!607889 m!584563))

(declare-fun m!584565 () Bool)

(assert (=> start!55560 m!584565))

(declare-fun m!584567 () Bool)

(assert (=> start!55560 m!584567))

(declare-fun m!584569 () Bool)

(assert (=> b!607880 m!584569))

(declare-fun m!584571 () Bool)

(assert (=> b!607880 m!584571))

(declare-fun m!584573 () Bool)

(assert (=> b!607879 m!584573))

(declare-fun m!584575 () Bool)

(assert (=> b!607887 m!584575))

(declare-fun m!584577 () Bool)

(assert (=> b!607864 m!584577))

(declare-fun m!584579 () Bool)

(assert (=> b!607873 m!584579))

(declare-fun m!584581 () Bool)

(assert (=> b!607883 m!584581))

(declare-fun m!584583 () Bool)

(assert (=> b!607885 m!584583))

(declare-fun m!584585 () Bool)

(assert (=> b!607881 m!584585))

(declare-fun m!584587 () Bool)

(assert (=> b!607875 m!584587))

(assert (=> b!607863 m!584557))

(declare-fun m!584589 () Bool)

(assert (=> b!607865 m!584589))

(declare-fun m!584591 () Bool)

(assert (=> b!607865 m!584591))

(assert (=> b!607865 m!584557))

(assert (=> b!607865 m!584569))

(assert (=> b!607865 m!584557))

(declare-fun m!584593 () Bool)

(assert (=> b!607865 m!584593))

(declare-fun m!584595 () Bool)

(assert (=> b!607865 m!584595))

(declare-fun m!584597 () Bool)

(assert (=> b!607865 m!584597))

(declare-fun m!584599 () Bool)

(assert (=> b!607865 m!584599))

(assert (=> b!607866 m!584557))

(assert (=> b!607866 m!584557))

(assert (=> b!607866 m!584563))

(declare-fun m!584601 () Bool)

(assert (=> b!607874 m!584601))

(assert (=> b!607874 m!584557))

(declare-fun m!584603 () Bool)

(assert (=> b!607874 m!584603))

(assert (=> b!607874 m!584557))

(declare-fun m!584605 () Bool)

(assert (=> b!607874 m!584605))

(assert (=> b!607874 m!584557))

(declare-fun m!584607 () Bool)

(assert (=> b!607874 m!584607))

(declare-fun m!584609 () Bool)

(assert (=> b!607874 m!584609))

(declare-fun m!584611 () Bool)

(assert (=> b!607874 m!584611))

(assert (=> b!607874 m!584557))

(declare-fun m!584613 () Bool)

(assert (=> b!607874 m!584613))

(declare-fun m!584615 () Bool)

(assert (=> b!607882 m!584615))

(assert (=> b!607882 m!584557))

(assert (=> b!607882 m!584557))

(declare-fun m!584617 () Bool)

(assert (=> b!607882 m!584617))

(declare-fun m!584619 () Bool)

(assert (=> b!607878 m!584619))

(assert (=> b!607877 m!584557))

(assert (=> b!607877 m!584557))

(declare-fun m!584621 () Bool)

(assert (=> b!607877 m!584621))

(assert (=> b!607867 m!584557))

(assert (=> b!607867 m!584557))

(declare-fun m!584623 () Bool)

(assert (=> b!607867 m!584623))

(assert (=> b!607868 m!584557))

(assert (=> b!607868 m!584557))

(assert (=> b!607868 m!584623))

(assert (=> b!607871 m!584557))

(assert (=> b!607871 m!584569))

(declare-fun m!584625 () Bool)

(assert (=> b!607871 m!584625))

(check-sat (not b!607878) (not b!607873) (not b!607879) (not b!607881) (not b!607866) (not b!607865) (not b!607875) (not b!607882) (not b!607889) (not b!607864) (not b!607883) (not start!55560) (not b!607874) (not b!607868) (not b!607877) (not b!607885) (not b!607867) (not b!607887))
(check-sat)
