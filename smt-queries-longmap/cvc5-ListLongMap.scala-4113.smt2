; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56176 () Bool)

(assert start!56176)

(declare-fun b!621849 () Bool)

(declare-fun res!400749 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!621849 (= res!400749 (bvsge j!136 index!984))))

(declare-fun e!356675 () Bool)

(assert (=> b!621849 (=> res!400749 e!356675)))

(declare-fun e!356673 () Bool)

(assert (=> b!621849 (= e!356673 e!356675)))

(declare-fun b!621850 () Bool)

(declare-fun res!400745 () Bool)

(declare-fun e!356679 () Bool)

(assert (=> b!621850 (=> (not res!400745) (not e!356679))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!37646 0))(
  ( (array!37647 (arr!18069 (Array (_ BitVec 32) (_ BitVec 64))) (size!18433 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37646)

(assert (=> b!621850 (= res!400745 (and (= (size!18433 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18433 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18433 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!621851 () Bool)

(declare-fun res!400747 () Bool)

(assert (=> b!621851 (=> (not res!400747) (not e!356679))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!621851 (= res!400747 (validKeyInArray!0 (select (arr!18069 a!2986) j!136)))))

(declare-fun b!621852 () Bool)

(declare-fun e!356682 () Bool)

(declare-fun e!356674 () Bool)

(assert (=> b!621852 (= e!356682 e!356674)))

(declare-fun res!400748 () Bool)

(assert (=> b!621852 (=> (not res!400748) (not e!356674))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!621852 (= res!400748 (= (select (store (arr!18069 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!287911 () array!37646)

(assert (=> b!621852 (= lt!287911 (array!37647 (store (arr!18069 a!2986) i!1108 k!1786) (size!18433 a!2986)))))

(declare-fun b!621853 () Bool)

(declare-fun res!400740 () Bool)

(assert (=> b!621853 (=> (not res!400740) (not e!356679))))

(assert (=> b!621853 (= res!400740 (validKeyInArray!0 k!1786))))

(declare-fun res!400751 () Bool)

(assert (=> start!56176 (=> (not res!400751) (not e!356679))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56176 (= res!400751 (validMask!0 mask!3053))))

(assert (=> start!56176 e!356679))

(assert (=> start!56176 true))

(declare-fun array_inv!13865 (array!37646) Bool)

(assert (=> start!56176 (array_inv!13865 a!2986)))

(declare-fun b!621854 () Bool)

(declare-datatypes ((Unit!20818 0))(
  ( (Unit!20819) )
))
(declare-fun e!356670 () Unit!20818)

(declare-fun Unit!20820 () Unit!20818)

(assert (=> b!621854 (= e!356670 Unit!20820)))

(assert (=> b!621854 false))

(declare-fun b!621855 () Bool)

(assert (=> b!621855 (= e!356679 e!356682)))

(declare-fun res!400741 () Bool)

(assert (=> b!621855 (=> (not res!400741) (not e!356682))))

(declare-datatypes ((SeekEntryResult!6509 0))(
  ( (MissingZero!6509 (index!28320 (_ BitVec 32))) (Found!6509 (index!28321 (_ BitVec 32))) (Intermediate!6509 (undefined!7321 Bool) (index!28322 (_ BitVec 32)) (x!57093 (_ BitVec 32))) (Undefined!6509) (MissingVacant!6509 (index!28323 (_ BitVec 32))) )
))
(declare-fun lt!287903 () SeekEntryResult!6509)

(assert (=> b!621855 (= res!400741 (or (= lt!287903 (MissingZero!6509 i!1108)) (= lt!287903 (MissingVacant!6509 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37646 (_ BitVec 32)) SeekEntryResult!6509)

(assert (=> b!621855 (= lt!287903 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!621856 () Bool)

(declare-fun Unit!20821 () Unit!20818)

(assert (=> b!621856 (= e!356670 Unit!20821)))

(declare-fun b!621857 () Bool)

(declare-fun e!356669 () Bool)

(declare-fun lt!287914 () SeekEntryResult!6509)

(declare-fun lt!287898 () SeekEntryResult!6509)

(assert (=> b!621857 (= e!356669 (= lt!287914 lt!287898))))

(declare-fun b!621858 () Bool)

(declare-fun e!356672 () Bool)

(assert (=> b!621858 (= e!356672 (not true))))

(declare-fun lt!287902 () Unit!20818)

(declare-fun e!356676 () Unit!20818)

(assert (=> b!621858 (= lt!287902 e!356676)))

(declare-fun c!70922 () Bool)

(declare-fun lt!287915 () SeekEntryResult!6509)

(assert (=> b!621858 (= c!70922 (= lt!287915 (Found!6509 index!984)))))

(declare-fun lt!287907 () Unit!20818)

(assert (=> b!621858 (= lt!287907 e!356670)))

(declare-fun c!70925 () Bool)

(assert (=> b!621858 (= c!70925 (= lt!287915 Undefined!6509))))

(declare-fun lt!287900 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37646 (_ BitVec 32)) SeekEntryResult!6509)

(assert (=> b!621858 (= lt!287915 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!287900 lt!287911 mask!3053))))

(assert (=> b!621858 e!356669))

(declare-fun res!400744 () Bool)

(assert (=> b!621858 (=> (not res!400744) (not e!356669))))

(declare-fun lt!287905 () (_ BitVec 32))

(assert (=> b!621858 (= res!400744 (= lt!287898 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!287905 vacantSpotIndex!68 lt!287900 lt!287911 mask!3053)))))

(assert (=> b!621858 (= lt!287898 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!287905 vacantSpotIndex!68 (select (arr!18069 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!621858 (= lt!287900 (select (store (arr!18069 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!287899 () Unit!20818)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37646 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20818)

(assert (=> b!621858 (= lt!287899 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!287905 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!621858 (= lt!287905 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!621859 () Bool)

(declare-fun res!400739 () Bool)

(assert (=> b!621859 (=> (not res!400739) (not e!356682))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37646 (_ BitVec 32)) Bool)

(assert (=> b!621859 (= res!400739 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!621860 () Bool)

(declare-fun Unit!20822 () Unit!20818)

(assert (=> b!621860 (= e!356676 Unit!20822)))

(declare-fun b!621861 () Bool)

(assert (=> b!621861 (= e!356674 e!356672)))

(declare-fun res!400742 () Bool)

(assert (=> b!621861 (=> (not res!400742) (not e!356672))))

(assert (=> b!621861 (= res!400742 (and (= lt!287914 (Found!6509 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18069 a!2986) index!984) (select (arr!18069 a!2986) j!136))) (not (= (select (arr!18069 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!621861 (= lt!287914 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18069 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!621862 () Bool)

(declare-fun e!356681 () Unit!20818)

(declare-fun Unit!20823 () Unit!20818)

(assert (=> b!621862 (= e!356681 Unit!20823)))

(declare-fun b!621863 () Bool)

(declare-fun e!356680 () Bool)

(declare-fun arrayContainsKey!0 (array!37646 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!621863 (= e!356680 (arrayContainsKey!0 lt!287911 (select (arr!18069 a!2986) j!136) index!984))))

(declare-fun b!621864 () Bool)

(declare-fun res!400743 () Bool)

(assert (=> b!621864 (=> (not res!400743) (not e!356682))))

(assert (=> b!621864 (= res!400743 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18069 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!621865 () Bool)

(declare-fun res!400754 () Bool)

(assert (=> b!621865 (=> (not res!400754) (not e!356682))))

(declare-datatypes ((List!12110 0))(
  ( (Nil!12107) (Cons!12106 (h!13151 (_ BitVec 64)) (t!18338 List!12110)) )
))
(declare-fun arrayNoDuplicates!0 (array!37646 (_ BitVec 32) List!12110) Bool)

(assert (=> b!621865 (= res!400754 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12107))))

(declare-fun b!621866 () Bool)

(declare-fun Unit!20824 () Unit!20818)

(assert (=> b!621866 (= e!356676 Unit!20824)))

(declare-fun res!400750 () Bool)

(assert (=> b!621866 (= res!400750 (= (select (store (arr!18069 a!2986) i!1108 k!1786) index!984) (select (arr!18069 a!2986) j!136)))))

(assert (=> b!621866 (=> (not res!400750) (not e!356673))))

(assert (=> b!621866 e!356673))

(declare-fun c!70924 () Bool)

(assert (=> b!621866 (= c!70924 (bvslt j!136 index!984))))

(declare-fun lt!287906 () Unit!20818)

(assert (=> b!621866 (= lt!287906 e!356681)))

(declare-fun c!70923 () Bool)

(assert (=> b!621866 (= c!70923 (bvslt index!984 j!136))))

(declare-fun lt!287908 () Unit!20818)

(declare-fun e!356678 () Unit!20818)

(assert (=> b!621866 (= lt!287908 e!356678)))

(assert (=> b!621866 false))

(declare-fun e!356677 () Bool)

(declare-fun b!621867 () Bool)

(assert (=> b!621867 (= e!356677 (arrayContainsKey!0 lt!287911 (select (arr!18069 a!2986) j!136) index!984))))

(declare-fun b!621868 () Bool)

(declare-fun Unit!20825 () Unit!20818)

(assert (=> b!621868 (= e!356678 Unit!20825)))

(declare-fun b!621869 () Bool)

(assert (=> b!621869 false))

(declare-fun lt!287910 () Unit!20818)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37646 (_ BitVec 64) (_ BitVec 32) List!12110) Unit!20818)

(assert (=> b!621869 (= lt!287910 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!287911 (select (arr!18069 a!2986) j!136) j!136 Nil!12107))))

(assert (=> b!621869 (arrayNoDuplicates!0 lt!287911 j!136 Nil!12107)))

(declare-fun lt!287901 () Unit!20818)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37646 (_ BitVec 32) (_ BitVec 32)) Unit!20818)

(assert (=> b!621869 (= lt!287901 (lemmaNoDuplicateFromThenFromBigger!0 lt!287911 #b00000000000000000000000000000000 j!136))))

(assert (=> b!621869 (arrayNoDuplicates!0 lt!287911 #b00000000000000000000000000000000 Nil!12107)))

(declare-fun lt!287913 () Unit!20818)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37646 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12110) Unit!20818)

(assert (=> b!621869 (= lt!287913 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12107))))

(assert (=> b!621869 (arrayContainsKey!0 lt!287911 (select (arr!18069 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!287912 () Unit!20818)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37646 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20818)

(assert (=> b!621869 (= lt!287912 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!287911 (select (arr!18069 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20826 () Unit!20818)

(assert (=> b!621869 (= e!356681 Unit!20826)))

(declare-fun b!621870 () Bool)

(assert (=> b!621870 false))

(declare-fun lt!287916 () Unit!20818)

(assert (=> b!621870 (= lt!287916 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!287911 (select (arr!18069 a!2986) j!136) index!984 Nil!12107))))

(assert (=> b!621870 (arrayNoDuplicates!0 lt!287911 index!984 Nil!12107)))

(declare-fun lt!287904 () Unit!20818)

(assert (=> b!621870 (= lt!287904 (lemmaNoDuplicateFromThenFromBigger!0 lt!287911 #b00000000000000000000000000000000 index!984))))

(assert (=> b!621870 (arrayNoDuplicates!0 lt!287911 #b00000000000000000000000000000000 Nil!12107)))

(declare-fun lt!287917 () Unit!20818)

(assert (=> b!621870 (= lt!287917 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12107))))

(assert (=> b!621870 (arrayContainsKey!0 lt!287911 (select (arr!18069 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!287909 () Unit!20818)

(assert (=> b!621870 (= lt!287909 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!287911 (select (arr!18069 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!621870 e!356680))

(declare-fun res!400752 () Bool)

(assert (=> b!621870 (=> (not res!400752) (not e!356680))))

(assert (=> b!621870 (= res!400752 (arrayContainsKey!0 lt!287911 (select (arr!18069 a!2986) j!136) j!136))))

(declare-fun Unit!20827 () Unit!20818)

(assert (=> b!621870 (= e!356678 Unit!20827)))

(declare-fun b!621871 () Bool)

(declare-fun res!400746 () Bool)

(assert (=> b!621871 (= res!400746 (arrayContainsKey!0 lt!287911 (select (arr!18069 a!2986) j!136) j!136))))

(assert (=> b!621871 (=> (not res!400746) (not e!356677))))

(assert (=> b!621871 (= e!356675 e!356677)))

(declare-fun b!621872 () Bool)

(declare-fun res!400753 () Bool)

(assert (=> b!621872 (=> (not res!400753) (not e!356679))))

(assert (=> b!621872 (= res!400753 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!56176 res!400751) b!621850))

(assert (= (and b!621850 res!400745) b!621851))

(assert (= (and b!621851 res!400747) b!621853))

(assert (= (and b!621853 res!400740) b!621872))

(assert (= (and b!621872 res!400753) b!621855))

(assert (= (and b!621855 res!400741) b!621859))

(assert (= (and b!621859 res!400739) b!621865))

(assert (= (and b!621865 res!400754) b!621864))

(assert (= (and b!621864 res!400743) b!621852))

(assert (= (and b!621852 res!400748) b!621861))

(assert (= (and b!621861 res!400742) b!621858))

(assert (= (and b!621858 res!400744) b!621857))

(assert (= (and b!621858 c!70925) b!621854))

(assert (= (and b!621858 (not c!70925)) b!621856))

(assert (= (and b!621858 c!70922) b!621866))

(assert (= (and b!621858 (not c!70922)) b!621860))

(assert (= (and b!621866 res!400750) b!621849))

(assert (= (and b!621849 (not res!400749)) b!621871))

(assert (= (and b!621871 res!400746) b!621867))

(assert (= (and b!621866 c!70924) b!621869))

(assert (= (and b!621866 (not c!70924)) b!621862))

(assert (= (and b!621866 c!70923) b!621870))

(assert (= (and b!621866 (not c!70923)) b!621868))

(assert (= (and b!621870 res!400752) b!621863))

(declare-fun m!597731 () Bool)

(assert (=> b!621853 m!597731))

(declare-fun m!597733 () Bool)

(assert (=> b!621870 m!597733))

(declare-fun m!597735 () Bool)

(assert (=> b!621870 m!597735))

(assert (=> b!621870 m!597733))

(declare-fun m!597737 () Bool)

(assert (=> b!621870 m!597737))

(assert (=> b!621870 m!597733))

(declare-fun m!597739 () Bool)

(assert (=> b!621870 m!597739))

(assert (=> b!621870 m!597733))

(declare-fun m!597741 () Bool)

(assert (=> b!621870 m!597741))

(declare-fun m!597743 () Bool)

(assert (=> b!621870 m!597743))

(assert (=> b!621870 m!597733))

(declare-fun m!597745 () Bool)

(assert (=> b!621870 m!597745))

(declare-fun m!597747 () Bool)

(assert (=> b!621870 m!597747))

(declare-fun m!597749 () Bool)

(assert (=> b!621870 m!597749))

(declare-fun m!597751 () Bool)

(assert (=> start!56176 m!597751))

(declare-fun m!597753 () Bool)

(assert (=> start!56176 m!597753))

(assert (=> b!621863 m!597733))

(assert (=> b!621863 m!597733))

(declare-fun m!597755 () Bool)

(assert (=> b!621863 m!597755))

(assert (=> b!621851 m!597733))

(assert (=> b!621851 m!597733))

(declare-fun m!597757 () Bool)

(assert (=> b!621851 m!597757))

(declare-fun m!597759 () Bool)

(assert (=> b!621864 m!597759))

(assert (=> b!621867 m!597733))

(assert (=> b!621867 m!597733))

(assert (=> b!621867 m!597755))

(declare-fun m!597761 () Bool)

(assert (=> b!621866 m!597761))

(declare-fun m!597763 () Bool)

(assert (=> b!621866 m!597763))

(assert (=> b!621866 m!597733))

(assert (=> b!621869 m!597733))

(assert (=> b!621869 m!597733))

(declare-fun m!597765 () Bool)

(assert (=> b!621869 m!597765))

(declare-fun m!597767 () Bool)

(assert (=> b!621869 m!597767))

(declare-fun m!597769 () Bool)

(assert (=> b!621869 m!597769))

(assert (=> b!621869 m!597733))

(declare-fun m!597771 () Bool)

(assert (=> b!621869 m!597771))

(assert (=> b!621869 m!597733))

(declare-fun m!597773 () Bool)

(assert (=> b!621869 m!597773))

(assert (=> b!621869 m!597747))

(assert (=> b!621869 m!597749))

(assert (=> b!621852 m!597761))

(declare-fun m!597775 () Bool)

(assert (=> b!621852 m!597775))

(declare-fun m!597777 () Bool)

(assert (=> b!621865 m!597777))

(declare-fun m!597779 () Bool)

(assert (=> b!621861 m!597779))

(assert (=> b!621861 m!597733))

(assert (=> b!621861 m!597733))

(declare-fun m!597781 () Bool)

(assert (=> b!621861 m!597781))

(assert (=> b!621871 m!597733))

(assert (=> b!621871 m!597733))

(assert (=> b!621871 m!597737))

(declare-fun m!597783 () Bool)

(assert (=> b!621872 m!597783))

(declare-fun m!597785 () Bool)

(assert (=> b!621855 m!597785))

(declare-fun m!597787 () Bool)

(assert (=> b!621858 m!597787))

(declare-fun m!597789 () Bool)

(assert (=> b!621858 m!597789))

(assert (=> b!621858 m!597733))

(declare-fun m!597791 () Bool)

(assert (=> b!621858 m!597791))

(assert (=> b!621858 m!597761))

(declare-fun m!597793 () Bool)

(assert (=> b!621858 m!597793))

(assert (=> b!621858 m!597733))

(declare-fun m!597795 () Bool)

(assert (=> b!621858 m!597795))

(declare-fun m!597797 () Bool)

(assert (=> b!621858 m!597797))

(declare-fun m!597799 () Bool)

(assert (=> b!621859 m!597799))

(push 1)

