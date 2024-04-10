; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57698 () Bool)

(assert start!57698)

(declare-fun b!637810 () Bool)

(declare-fun e!364965 () Bool)

(declare-fun e!364967 () Bool)

(assert (=> b!637810 (= e!364965 e!364967)))

(declare-fun res!412705 () Bool)

(assert (=> b!637810 (=> (not res!412705) (not e!364967))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!38269 0))(
  ( (array!38270 (arr!18357 (Array (_ BitVec 32) (_ BitVec 64))) (size!18721 (_ BitVec 32))) )
))
(declare-fun lt!294924 () array!38269)

(declare-fun a!2986 () array!38269)

(declare-fun arrayContainsKey!0 (array!38269 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!637810 (= res!412705 (arrayContainsKey!0 lt!294924 (select (arr!18357 a!2986) j!136) j!136))))

(declare-fun b!637811 () Bool)

(declare-fun res!412686 () Bool)

(declare-fun e!364958 () Bool)

(assert (=> b!637811 (=> (not res!412686) (not e!364958))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!637811 (= res!412686 (validKeyInArray!0 k!1786))))

(declare-fun b!637812 () Bool)

(declare-fun e!364968 () Bool)

(assert (=> b!637812 (= e!364968 e!364965)))

(declare-fun res!412688 () Bool)

(assert (=> b!637812 (=> res!412688 e!364965)))

(declare-fun lt!294920 () (_ BitVec 64))

(declare-fun lt!294921 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!637812 (= res!412688 (or (not (= (select (arr!18357 a!2986) j!136) lt!294920)) (not (= (select (arr!18357 a!2986) j!136) lt!294921)) (bvsge j!136 index!984)))))

(declare-fun res!412689 () Bool)

(assert (=> start!57698 (=> (not res!412689) (not e!364958))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57698 (= res!412689 (validMask!0 mask!3053))))

(assert (=> start!57698 e!364958))

(assert (=> start!57698 true))

(declare-fun array_inv!14153 (array!38269) Bool)

(assert (=> start!57698 (array_inv!14153 a!2986)))

(declare-fun b!637813 () Bool)

(declare-fun e!364959 () Bool)

(assert (=> b!637813 (= e!364958 e!364959)))

(declare-fun res!412691 () Bool)

(assert (=> b!637813 (=> (not res!412691) (not e!364959))))

(declare-datatypes ((SeekEntryResult!6797 0))(
  ( (MissingZero!6797 (index!29502 (_ BitVec 32))) (Found!6797 (index!29503 (_ BitVec 32))) (Intermediate!6797 (undefined!7609 Bool) (index!29504 (_ BitVec 32)) (x!58263 (_ BitVec 32))) (Undefined!6797) (MissingVacant!6797 (index!29505 (_ BitVec 32))) )
))
(declare-fun lt!294927 () SeekEntryResult!6797)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!637813 (= res!412691 (or (= lt!294927 (MissingZero!6797 i!1108)) (= lt!294927 (MissingVacant!6797 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38269 (_ BitVec 32)) SeekEntryResult!6797)

(assert (=> b!637813 (= lt!294927 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!637814 () Bool)

(assert (=> b!637814 (= e!364967 (arrayContainsKey!0 lt!294924 (select (arr!18357 a!2986) j!136) index!984))))

(declare-fun b!637815 () Bool)

(declare-fun e!364962 () Bool)

(assert (=> b!637815 (= e!364959 e!364962)))

(declare-fun res!412692 () Bool)

(assert (=> b!637815 (=> (not res!412692) (not e!364962))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!637815 (= res!412692 (= (select (store (arr!18357 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!637815 (= lt!294924 (array!38270 (store (arr!18357 a!2986) i!1108 k!1786) (size!18721 a!2986)))))

(declare-fun b!637816 () Bool)

(declare-fun e!364963 () Bool)

(declare-fun e!364957 () Bool)

(assert (=> b!637816 (= e!364963 e!364957)))

(declare-fun res!412694 () Bool)

(assert (=> b!637816 (=> res!412694 e!364957)))

(assert (=> b!637816 (= res!412694 (or (not (= (select (arr!18357 a!2986) j!136) lt!294920)) (not (= (select (arr!18357 a!2986) j!136) lt!294921)) (bvsge j!136 index!984)))))

(assert (=> b!637816 e!364968))

(declare-fun res!412690 () Bool)

(assert (=> b!637816 (=> (not res!412690) (not e!364968))))

(assert (=> b!637816 (= res!412690 (= lt!294921 (select (arr!18357 a!2986) j!136)))))

(assert (=> b!637816 (= lt!294921 (select (store (arr!18357 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!637817 () Bool)

(declare-datatypes ((Unit!21522 0))(
  ( (Unit!21523) )
))
(declare-fun e!364964 () Unit!21522)

(declare-fun Unit!21524 () Unit!21522)

(assert (=> b!637817 (= e!364964 Unit!21524)))

(declare-fun b!637818 () Bool)

(declare-fun Unit!21525 () Unit!21522)

(assert (=> b!637818 (= e!364964 Unit!21525)))

(assert (=> b!637818 false))

(declare-fun b!637819 () Bool)

(declare-fun e!364960 () Bool)

(assert (=> b!637819 (= e!364960 (not e!364963))))

(declare-fun res!412702 () Bool)

(assert (=> b!637819 (=> res!412702 e!364963)))

(declare-fun lt!294923 () SeekEntryResult!6797)

(assert (=> b!637819 (= res!412702 (not (= lt!294923 (Found!6797 index!984))))))

(declare-fun lt!294918 () Unit!21522)

(assert (=> b!637819 (= lt!294918 e!364964)))

(declare-fun c!72929 () Bool)

(assert (=> b!637819 (= c!72929 (= lt!294923 Undefined!6797))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38269 (_ BitVec 32)) SeekEntryResult!6797)

(assert (=> b!637819 (= lt!294923 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!294920 lt!294924 mask!3053))))

(declare-fun e!364961 () Bool)

(assert (=> b!637819 e!364961))

(declare-fun res!412695 () Bool)

(assert (=> b!637819 (=> (not res!412695) (not e!364961))))

(declare-fun lt!294925 () SeekEntryResult!6797)

(declare-fun lt!294917 () (_ BitVec 32))

(assert (=> b!637819 (= res!412695 (= lt!294925 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294917 vacantSpotIndex!68 lt!294920 lt!294924 mask!3053)))))

(assert (=> b!637819 (= lt!294925 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294917 vacantSpotIndex!68 (select (arr!18357 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!637819 (= lt!294920 (select (store (arr!18357 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!294922 () Unit!21522)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38269 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21522)

(assert (=> b!637819 (= lt!294922 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!294917 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!637819 (= lt!294917 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!637820 () Bool)

(declare-fun res!412706 () Bool)

(assert (=> b!637820 (=> (not res!412706) (not e!364959))))

(assert (=> b!637820 (= res!412706 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18357 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!637821 () Bool)

(declare-fun res!412693 () Bool)

(assert (=> b!637821 (=> (not res!412693) (not e!364958))))

(assert (=> b!637821 (= res!412693 (and (= (size!18721 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18721 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18721 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!637822 () Bool)

(declare-fun res!412701 () Bool)

(assert (=> b!637822 (=> (not res!412701) (not e!364958))))

(assert (=> b!637822 (= res!412701 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!637823 () Bool)

(declare-fun res!412700 () Bool)

(assert (=> b!637823 (=> (not res!412700) (not e!364959))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38269 (_ BitVec 32)) Bool)

(assert (=> b!637823 (= res!412700 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!637824 () Bool)

(declare-fun res!412704 () Bool)

(assert (=> b!637824 (=> (not res!412704) (not e!364959))))

(declare-datatypes ((List!12398 0))(
  ( (Nil!12395) (Cons!12394 (h!13439 (_ BitVec 64)) (t!18626 List!12398)) )
))
(declare-fun arrayNoDuplicates!0 (array!38269 (_ BitVec 32) List!12398) Bool)

(assert (=> b!637824 (= res!412704 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12395))))

(declare-fun b!637825 () Bool)

(declare-fun res!412697 () Bool)

(declare-fun e!364966 () Bool)

(assert (=> b!637825 (=> res!412697 e!364966)))

(declare-fun contains!3112 (List!12398 (_ BitVec 64)) Bool)

(assert (=> b!637825 (= res!412697 (contains!3112 Nil!12395 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!637826 () Bool)

(declare-fun res!412699 () Bool)

(assert (=> b!637826 (=> (not res!412699) (not e!364958))))

(assert (=> b!637826 (= res!412699 (validKeyInArray!0 (select (arr!18357 a!2986) j!136)))))

(declare-fun b!637827 () Bool)

(declare-fun res!412696 () Bool)

(assert (=> b!637827 (=> res!412696 e!364966)))

(assert (=> b!637827 (= res!412696 (contains!3112 Nil!12395 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!637828 () Bool)

(declare-fun lt!294926 () SeekEntryResult!6797)

(assert (=> b!637828 (= e!364961 (= lt!294926 lt!294925))))

(declare-fun b!637829 () Bool)

(assert (=> b!637829 (= e!364957 e!364966)))

(declare-fun res!412703 () Bool)

(assert (=> b!637829 (=> res!412703 e!364966)))

(assert (=> b!637829 (= res!412703 (or (bvsge (size!18721 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18721 a!2986))))))

(assert (=> b!637829 (arrayContainsKey!0 lt!294924 (select (arr!18357 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!294919 () Unit!21522)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38269 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21522)

(assert (=> b!637829 (= lt!294919 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!294924 (select (arr!18357 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!637830 () Bool)

(assert (=> b!637830 (= e!364966 true)))

(declare-fun lt!294928 () Bool)

(assert (=> b!637830 (= lt!294928 (contains!3112 Nil!12395 k!1786))))

(declare-fun b!637831 () Bool)

(assert (=> b!637831 (= e!364962 e!364960)))

(declare-fun res!412687 () Bool)

(assert (=> b!637831 (=> (not res!412687) (not e!364960))))

(assert (=> b!637831 (= res!412687 (and (= lt!294926 (Found!6797 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18357 a!2986) index!984) (select (arr!18357 a!2986) j!136))) (not (= (select (arr!18357 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!637831 (= lt!294926 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18357 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!637832 () Bool)

(declare-fun res!412698 () Bool)

(assert (=> b!637832 (=> res!412698 e!364966)))

(declare-fun noDuplicate!390 (List!12398) Bool)

(assert (=> b!637832 (= res!412698 (not (noDuplicate!390 Nil!12395)))))

(assert (= (and start!57698 res!412689) b!637821))

(assert (= (and b!637821 res!412693) b!637826))

(assert (= (and b!637826 res!412699) b!637811))

(assert (= (and b!637811 res!412686) b!637822))

(assert (= (and b!637822 res!412701) b!637813))

(assert (= (and b!637813 res!412691) b!637823))

(assert (= (and b!637823 res!412700) b!637824))

(assert (= (and b!637824 res!412704) b!637820))

(assert (= (and b!637820 res!412706) b!637815))

(assert (= (and b!637815 res!412692) b!637831))

(assert (= (and b!637831 res!412687) b!637819))

(assert (= (and b!637819 res!412695) b!637828))

(assert (= (and b!637819 c!72929) b!637818))

(assert (= (and b!637819 (not c!72929)) b!637817))

(assert (= (and b!637819 (not res!412702)) b!637816))

(assert (= (and b!637816 res!412690) b!637812))

(assert (= (and b!637812 (not res!412688)) b!637810))

(assert (= (and b!637810 res!412705) b!637814))

(assert (= (and b!637816 (not res!412694)) b!637829))

(assert (= (and b!637829 (not res!412703)) b!637832))

(assert (= (and b!637832 (not res!412698)) b!637825))

(assert (= (and b!637825 (not res!412697)) b!637827))

(assert (= (and b!637827 (not res!412696)) b!637830))

(declare-fun m!611831 () Bool)

(assert (=> b!637819 m!611831))

(declare-fun m!611833 () Bool)

(assert (=> b!637819 m!611833))

(declare-fun m!611835 () Bool)

(assert (=> b!637819 m!611835))

(declare-fun m!611837 () Bool)

(assert (=> b!637819 m!611837))

(declare-fun m!611839 () Bool)

(assert (=> b!637819 m!611839))

(declare-fun m!611841 () Bool)

(assert (=> b!637819 m!611841))

(assert (=> b!637819 m!611837))

(declare-fun m!611843 () Bool)

(assert (=> b!637819 m!611843))

(declare-fun m!611845 () Bool)

(assert (=> b!637819 m!611845))

(declare-fun m!611847 () Bool)

(assert (=> b!637824 m!611847))

(declare-fun m!611849 () Bool)

(assert (=> b!637831 m!611849))

(assert (=> b!637831 m!611837))

(assert (=> b!637831 m!611837))

(declare-fun m!611851 () Bool)

(assert (=> b!637831 m!611851))

(assert (=> b!637816 m!611837))

(assert (=> b!637816 m!611839))

(declare-fun m!611853 () Bool)

(assert (=> b!637816 m!611853))

(declare-fun m!611855 () Bool)

(assert (=> b!637820 m!611855))

(declare-fun m!611857 () Bool)

(assert (=> b!637823 m!611857))

(assert (=> b!637812 m!611837))

(declare-fun m!611859 () Bool)

(assert (=> b!637825 m!611859))

(assert (=> b!637826 m!611837))

(assert (=> b!637826 m!611837))

(declare-fun m!611861 () Bool)

(assert (=> b!637826 m!611861))

(assert (=> b!637829 m!611837))

(assert (=> b!637829 m!611837))

(declare-fun m!611863 () Bool)

(assert (=> b!637829 m!611863))

(assert (=> b!637829 m!611837))

(declare-fun m!611865 () Bool)

(assert (=> b!637829 m!611865))

(declare-fun m!611867 () Bool)

(assert (=> b!637830 m!611867))

(assert (=> b!637814 m!611837))

(assert (=> b!637814 m!611837))

(declare-fun m!611869 () Bool)

(assert (=> b!637814 m!611869))

(declare-fun m!611871 () Bool)

(assert (=> b!637832 m!611871))

(declare-fun m!611873 () Bool)

(assert (=> b!637822 m!611873))

(assert (=> b!637815 m!611839))

(declare-fun m!611875 () Bool)

(assert (=> b!637815 m!611875))

(assert (=> b!637810 m!611837))

(assert (=> b!637810 m!611837))

(declare-fun m!611877 () Bool)

(assert (=> b!637810 m!611877))

(declare-fun m!611879 () Bool)

(assert (=> b!637827 m!611879))

(declare-fun m!611881 () Bool)

(assert (=> b!637811 m!611881))

(declare-fun m!611883 () Bool)

(assert (=> b!637813 m!611883))

(declare-fun m!611885 () Bool)

(assert (=> start!57698 m!611885))

(declare-fun m!611887 () Bool)

(assert (=> start!57698 m!611887))

(push 1)

