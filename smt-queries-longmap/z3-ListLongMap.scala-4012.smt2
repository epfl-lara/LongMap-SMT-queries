; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54528 () Bool)

(assert start!54528)

(declare-fun b!595866 () Bool)

(declare-fun res!381827 () Bool)

(declare-fun e!340422 () Bool)

(assert (=> b!595866 (=> res!381827 e!340422)))

(declare-datatypes ((List!11845 0))(
  ( (Nil!11842) (Cons!11841 (h!12886 (_ BitVec 64)) (t!18064 List!11845)) )
))
(declare-fun noDuplicate!266 (List!11845) Bool)

(assert (=> b!595866 (= res!381827 (not (noDuplicate!266 Nil!11842)))))

(declare-fun b!595867 () Bool)

(declare-fun e!340431 () Bool)

(declare-fun e!340429 () Bool)

(assert (=> b!595867 (= e!340431 e!340429)))

(declare-fun res!381822 () Bool)

(assert (=> b!595867 (=> (not res!381822) (not e!340429))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!37002 0))(
  ( (array!37003 (arr!17765 (Array (_ BitVec 32) (_ BitVec 64))) (size!18130 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37002)

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!595867 (= res!381822 (= (select (store (arr!17765 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!270510 () array!37002)

(assert (=> b!595867 (= lt!270510 (array!37003 (store (arr!17765 a!2986) i!1108 k0!1786) (size!18130 a!2986)))))

(declare-fun b!595868 () Bool)

(declare-fun res!381840 () Bool)

(assert (=> b!595868 (=> res!381840 e!340422)))

(declare-fun contains!2929 (List!11845 (_ BitVec 64)) Bool)

(assert (=> b!595868 (= res!381840 (contains!2929 Nil!11842 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!595869 () Bool)

(declare-fun e!340427 () Bool)

(assert (=> b!595869 (= e!340427 e!340431)))

(declare-fun res!381828 () Bool)

(assert (=> b!595869 (=> (not res!381828) (not e!340431))))

(declare-datatypes ((SeekEntryResult!6202 0))(
  ( (MissingZero!6202 (index!27056 (_ BitVec 32))) (Found!6202 (index!27057 (_ BitVec 32))) (Intermediate!6202 (undefined!7014 Bool) (index!27058 (_ BitVec 32)) (x!55865 (_ BitVec 32))) (Undefined!6202) (MissingVacant!6202 (index!27059 (_ BitVec 32))) )
))
(declare-fun lt!270501 () SeekEntryResult!6202)

(assert (=> b!595869 (= res!381828 (or (= lt!270501 (MissingZero!6202 i!1108)) (= lt!270501 (MissingVacant!6202 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37002 (_ BitVec 32)) SeekEntryResult!6202)

(assert (=> b!595869 (= lt!270501 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!595870 () Bool)

(declare-fun e!340423 () Bool)

(declare-fun e!340424 () Bool)

(assert (=> b!595870 (= e!340423 (not e!340424))))

(declare-fun res!381839 () Bool)

(assert (=> b!595870 (=> res!381839 e!340424)))

(declare-fun lt!270509 () SeekEntryResult!6202)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!595870 (= res!381839 (not (= lt!270509 (Found!6202 index!984))))))

(declare-datatypes ((Unit!18720 0))(
  ( (Unit!18721) )
))
(declare-fun lt!270507 () Unit!18720)

(declare-fun e!340434 () Unit!18720)

(assert (=> b!595870 (= lt!270507 e!340434)))

(declare-fun c!67389 () Bool)

(assert (=> b!595870 (= c!67389 (= lt!270509 Undefined!6202))))

(declare-fun lt!270503 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37002 (_ BitVec 32)) SeekEntryResult!6202)

(assert (=> b!595870 (= lt!270509 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!270503 lt!270510 mask!3053))))

(declare-fun e!340428 () Bool)

(assert (=> b!595870 e!340428))

(declare-fun res!381823 () Bool)

(assert (=> b!595870 (=> (not res!381823) (not e!340428))))

(declare-fun lt!270508 () (_ BitVec 32))

(declare-fun lt!270506 () SeekEntryResult!6202)

(assert (=> b!595870 (= res!381823 (= lt!270506 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270508 vacantSpotIndex!68 lt!270503 lt!270510 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!595870 (= lt!270506 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270508 vacantSpotIndex!68 (select (arr!17765 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!595870 (= lt!270503 (select (store (arr!17765 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!270500 () Unit!18720)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37002 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18720)

(assert (=> b!595870 (= lt!270500 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!270508 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!595870 (= lt!270508 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!595871 () Bool)

(assert (=> b!595871 (= e!340422 true)))

(declare-fun lt!270505 () Bool)

(assert (=> b!595871 (= lt!270505 (contains!2929 Nil!11842 k0!1786))))

(declare-fun b!595872 () Bool)

(declare-fun res!381842 () Bool)

(assert (=> b!595872 (=> res!381842 e!340422)))

(assert (=> b!595872 (= res!381842 (contains!2929 Nil!11842 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!595873 () Bool)

(declare-fun res!381831 () Bool)

(assert (=> b!595873 (=> (not res!381831) (not e!340431))))

(declare-fun arrayNoDuplicates!0 (array!37002 (_ BitVec 32) List!11845) Bool)

(assert (=> b!595873 (= res!381831 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11842))))

(declare-fun b!595874 () Bool)

(declare-fun res!381838 () Bool)

(assert (=> b!595874 (=> (not res!381838) (not e!340431))))

(assert (=> b!595874 (= res!381838 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17765 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!595875 () Bool)

(assert (=> b!595875 (= e!340429 e!340423)))

(declare-fun res!381826 () Bool)

(assert (=> b!595875 (=> (not res!381826) (not e!340423))))

(declare-fun lt!270502 () SeekEntryResult!6202)

(assert (=> b!595875 (= res!381826 (and (= lt!270502 (Found!6202 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17765 a!2986) index!984) (select (arr!17765 a!2986) j!136))) (not (= (select (arr!17765 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!595875 (= lt!270502 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17765 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!381830 () Bool)

(assert (=> start!54528 (=> (not res!381830) (not e!340427))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54528 (= res!381830 (validMask!0 mask!3053))))

(assert (=> start!54528 e!340427))

(assert (=> start!54528 true))

(declare-fun array_inv!13648 (array!37002) Bool)

(assert (=> start!54528 (array_inv!13648 a!2986)))

(declare-fun b!595876 () Bool)

(declare-fun res!381837 () Bool)

(assert (=> b!595876 (=> (not res!381837) (not e!340427))))

(declare-fun arrayContainsKey!0 (array!37002 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!595876 (= res!381837 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!595877 () Bool)

(declare-fun res!381836 () Bool)

(assert (=> b!595877 (=> (not res!381836) (not e!340427))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!595877 (= res!381836 (validKeyInArray!0 k0!1786))))

(declare-fun b!595878 () Bool)

(declare-fun e!340433 () Bool)

(assert (=> b!595878 (= e!340424 e!340433)))

(declare-fun res!381824 () Bool)

(assert (=> b!595878 (=> res!381824 e!340433)))

(declare-fun lt!270511 () (_ BitVec 64))

(assert (=> b!595878 (= res!381824 (or (not (= (select (arr!17765 a!2986) j!136) lt!270503)) (not (= (select (arr!17765 a!2986) j!136) lt!270511)) (bvsge j!136 index!984)))))

(declare-fun e!340432 () Bool)

(assert (=> b!595878 e!340432))

(declare-fun res!381829 () Bool)

(assert (=> b!595878 (=> (not res!381829) (not e!340432))))

(assert (=> b!595878 (= res!381829 (= lt!270511 (select (arr!17765 a!2986) j!136)))))

(assert (=> b!595878 (= lt!270511 (select (store (arr!17765 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!595879 () Bool)

(declare-fun Unit!18722 () Unit!18720)

(assert (=> b!595879 (= e!340434 Unit!18722)))

(declare-fun b!595880 () Bool)

(assert (=> b!595880 (= e!340428 (= lt!270502 lt!270506))))

(declare-fun b!595881 () Bool)

(declare-fun res!381833 () Bool)

(assert (=> b!595881 (=> (not res!381833) (not e!340431))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37002 (_ BitVec 32)) Bool)

(assert (=> b!595881 (= res!381833 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!595882 () Bool)

(declare-fun res!381835 () Bool)

(assert (=> b!595882 (=> (not res!381835) (not e!340427))))

(assert (=> b!595882 (= res!381835 (validKeyInArray!0 (select (arr!17765 a!2986) j!136)))))

(declare-fun b!595883 () Bool)

(declare-fun Unit!18723 () Unit!18720)

(assert (=> b!595883 (= e!340434 Unit!18723)))

(assert (=> b!595883 false))

(declare-fun b!595884 () Bool)

(declare-fun e!340430 () Bool)

(assert (=> b!595884 (= e!340430 (arrayContainsKey!0 lt!270510 (select (arr!17765 a!2986) j!136) index!984))))

(declare-fun b!595885 () Bool)

(declare-fun e!340425 () Bool)

(assert (=> b!595885 (= e!340432 e!340425)))

(declare-fun res!381841 () Bool)

(assert (=> b!595885 (=> res!381841 e!340425)))

(assert (=> b!595885 (= res!381841 (or (not (= (select (arr!17765 a!2986) j!136) lt!270503)) (not (= (select (arr!17765 a!2986) j!136) lt!270511)) (bvsge j!136 index!984)))))

(declare-fun b!595886 () Bool)

(declare-fun res!381832 () Bool)

(assert (=> b!595886 (=> (not res!381832) (not e!340427))))

(assert (=> b!595886 (= res!381832 (and (= (size!18130 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18130 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18130 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!595887 () Bool)

(assert (=> b!595887 (= e!340425 e!340430)))

(declare-fun res!381834 () Bool)

(assert (=> b!595887 (=> (not res!381834) (not e!340430))))

(assert (=> b!595887 (= res!381834 (arrayContainsKey!0 lt!270510 (select (arr!17765 a!2986) j!136) j!136))))

(declare-fun b!595888 () Bool)

(assert (=> b!595888 (= e!340433 e!340422)))

(declare-fun res!381825 () Bool)

(assert (=> b!595888 (=> res!381825 e!340422)))

(assert (=> b!595888 (= res!381825 (or (bvsge (size!18130 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18130 a!2986))))))

(assert (=> b!595888 (arrayContainsKey!0 lt!270510 (select (arr!17765 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!270504 () Unit!18720)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37002 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18720)

(assert (=> b!595888 (= lt!270504 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!270510 (select (arr!17765 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (= (and start!54528 res!381830) b!595886))

(assert (= (and b!595886 res!381832) b!595882))

(assert (= (and b!595882 res!381835) b!595877))

(assert (= (and b!595877 res!381836) b!595876))

(assert (= (and b!595876 res!381837) b!595869))

(assert (= (and b!595869 res!381828) b!595881))

(assert (= (and b!595881 res!381833) b!595873))

(assert (= (and b!595873 res!381831) b!595874))

(assert (= (and b!595874 res!381838) b!595867))

(assert (= (and b!595867 res!381822) b!595875))

(assert (= (and b!595875 res!381826) b!595870))

(assert (= (and b!595870 res!381823) b!595880))

(assert (= (and b!595870 c!67389) b!595883))

(assert (= (and b!595870 (not c!67389)) b!595879))

(assert (= (and b!595870 (not res!381839)) b!595878))

(assert (= (and b!595878 res!381829) b!595885))

(assert (= (and b!595885 (not res!381841)) b!595887))

(assert (= (and b!595887 res!381834) b!595884))

(assert (= (and b!595878 (not res!381824)) b!595888))

(assert (= (and b!595888 (not res!381825)) b!595866))

(assert (= (and b!595866 (not res!381827)) b!595872))

(assert (= (and b!595872 (not res!381842)) b!595868))

(assert (= (and b!595868 (not res!381840)) b!595871))

(declare-fun m!572905 () Bool)

(assert (=> b!595868 m!572905))

(declare-fun m!572907 () Bool)

(assert (=> b!595887 m!572907))

(assert (=> b!595887 m!572907))

(declare-fun m!572909 () Bool)

(assert (=> b!595887 m!572909))

(declare-fun m!572911 () Bool)

(assert (=> b!595877 m!572911))

(assert (=> b!595882 m!572907))

(assert (=> b!595882 m!572907))

(declare-fun m!572913 () Bool)

(assert (=> b!595882 m!572913))

(declare-fun m!572915 () Bool)

(assert (=> b!595876 m!572915))

(declare-fun m!572917 () Bool)

(assert (=> b!595871 m!572917))

(declare-fun m!572919 () Bool)

(assert (=> b!595866 m!572919))

(declare-fun m!572921 () Bool)

(assert (=> b!595867 m!572921))

(declare-fun m!572923 () Bool)

(assert (=> b!595867 m!572923))

(assert (=> b!595888 m!572907))

(assert (=> b!595888 m!572907))

(declare-fun m!572925 () Bool)

(assert (=> b!595888 m!572925))

(assert (=> b!595888 m!572907))

(declare-fun m!572927 () Bool)

(assert (=> b!595888 m!572927))

(declare-fun m!572929 () Bool)

(assert (=> b!595873 m!572929))

(declare-fun m!572931 () Bool)

(assert (=> b!595872 m!572931))

(declare-fun m!572933 () Bool)

(assert (=> b!595881 m!572933))

(declare-fun m!572935 () Bool)

(assert (=> b!595869 m!572935))

(declare-fun m!572937 () Bool)

(assert (=> start!54528 m!572937))

(declare-fun m!572939 () Bool)

(assert (=> start!54528 m!572939))

(assert (=> b!595878 m!572907))

(assert (=> b!595878 m!572921))

(declare-fun m!572941 () Bool)

(assert (=> b!595878 m!572941))

(declare-fun m!572943 () Bool)

(assert (=> b!595874 m!572943))

(declare-fun m!572945 () Bool)

(assert (=> b!595875 m!572945))

(assert (=> b!595875 m!572907))

(assert (=> b!595875 m!572907))

(declare-fun m!572947 () Bool)

(assert (=> b!595875 m!572947))

(assert (=> b!595885 m!572907))

(assert (=> b!595884 m!572907))

(assert (=> b!595884 m!572907))

(declare-fun m!572949 () Bool)

(assert (=> b!595884 m!572949))

(declare-fun m!572951 () Bool)

(assert (=> b!595870 m!572951))

(declare-fun m!572953 () Bool)

(assert (=> b!595870 m!572953))

(assert (=> b!595870 m!572907))

(declare-fun m!572955 () Bool)

(assert (=> b!595870 m!572955))

(assert (=> b!595870 m!572921))

(declare-fun m!572957 () Bool)

(assert (=> b!595870 m!572957))

(assert (=> b!595870 m!572907))

(declare-fun m!572959 () Bool)

(assert (=> b!595870 m!572959))

(declare-fun m!572961 () Bool)

(assert (=> b!595870 m!572961))

(check-sat (not b!595877) (not b!595887) (not b!595876) (not b!595888) (not b!595866) (not b!595884) (not b!595869) (not b!595868) (not b!595871) (not b!595882) (not b!595873) (not b!595875) (not b!595881) (not start!54528) (not b!595870) (not b!595872))
(check-sat)
