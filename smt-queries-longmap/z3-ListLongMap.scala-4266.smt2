; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59338 () Bool)

(assert start!59338)

(declare-fun b!654741 () Bool)

(declare-fun e!376001 () Bool)

(declare-fun e!376005 () Bool)

(assert (=> b!654741 (= e!376001 (not e!376005))))

(declare-fun res!424702 () Bool)

(assert (=> b!654741 (=> res!424702 e!376005)))

(declare-datatypes ((SeekEntryResult!6969 0))(
  ( (MissingZero!6969 (index!30235 (_ BitVec 32))) (Found!6969 (index!30236 (_ BitVec 32))) (Intermediate!6969 (undefined!7781 Bool) (index!30237 (_ BitVec 32)) (x!59026 (_ BitVec 32))) (Undefined!6969) (MissingVacant!6969 (index!30238 (_ BitVec 32))) )
))
(declare-fun lt!305113 () SeekEntryResult!6969)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!654741 (= res!424702 (not (= lt!305113 (Found!6969 index!984))))))

(declare-datatypes ((Unit!22448 0))(
  ( (Unit!22449) )
))
(declare-fun lt!305104 () Unit!22448)

(declare-fun e!375998 () Unit!22448)

(assert (=> b!654741 (= lt!305104 e!375998)))

(declare-fun c!75388 () Bool)

(assert (=> b!654741 (= c!75388 (= lt!305113 Undefined!6969))))

(declare-fun lt!305106 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!38658 0))(
  ( (array!38659 (arr!18529 (Array (_ BitVec 32) (_ BitVec 64))) (size!18893 (_ BitVec 32))) )
))
(declare-fun lt!305110 () array!38658)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38658 (_ BitVec 32)) SeekEntryResult!6969)

(assert (=> b!654741 (= lt!305113 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!305106 lt!305110 mask!3053))))

(declare-fun e!376011 () Bool)

(assert (=> b!654741 e!376011))

(declare-fun res!424708 () Bool)

(assert (=> b!654741 (=> (not res!424708) (not e!376011))))

(declare-fun lt!305114 () SeekEntryResult!6969)

(declare-fun lt!305121 () (_ BitVec 32))

(assert (=> b!654741 (= res!424708 (= lt!305114 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!305121 vacantSpotIndex!68 lt!305106 lt!305110 mask!3053)))))

(declare-fun a!2986 () array!38658)

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!654741 (= lt!305114 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!305121 vacantSpotIndex!68 (select (arr!18529 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!654741 (= lt!305106 (select (store (arr!18529 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!305119 () Unit!22448)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38658 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22448)

(assert (=> b!654741 (= lt!305119 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!305121 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!654741 (= lt!305121 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!654742 () Bool)

(declare-fun res!424701 () Bool)

(declare-fun e!376002 () Bool)

(assert (=> b!654742 (=> (not res!424701) (not e!376002))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38658 (_ BitVec 32)) Bool)

(assert (=> b!654742 (= res!424701 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!654743 () Bool)

(declare-fun e!376010 () Bool)

(declare-fun e!376009 () Bool)

(assert (=> b!654743 (= e!376010 e!376009)))

(declare-fun res!424712 () Bool)

(assert (=> b!654743 (=> res!424712 e!376009)))

(declare-fun lt!305120 () (_ BitVec 64))

(assert (=> b!654743 (= res!424712 (or (not (= (select (arr!18529 a!2986) j!136) lt!305106)) (not (= (select (arr!18529 a!2986) j!136) lt!305120)) (bvsge j!136 index!984)))))

(declare-fun b!654744 () Bool)

(declare-fun e!376006 () Unit!22448)

(declare-fun Unit!22450 () Unit!22448)

(assert (=> b!654744 (= e!376006 Unit!22450)))

(declare-fun res!424714 () Bool)

(declare-fun e!376003 () Bool)

(assert (=> start!59338 (=> (not res!424714) (not e!376003))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59338 (= res!424714 (validMask!0 mask!3053))))

(assert (=> start!59338 e!376003))

(assert (=> start!59338 true))

(declare-fun array_inv!14325 (array!38658) Bool)

(assert (=> start!59338 (array_inv!14325 a!2986)))

(declare-fun b!654745 () Bool)

(declare-fun lt!305108 () SeekEntryResult!6969)

(assert (=> b!654745 (= e!376011 (= lt!305108 lt!305114))))

(declare-fun b!654746 () Bool)

(declare-fun e!376004 () Bool)

(assert (=> b!654746 (= e!376009 e!376004)))

(declare-fun res!424703 () Bool)

(assert (=> b!654746 (=> (not res!424703) (not e!376004))))

(declare-fun arrayContainsKey!0 (array!38658 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!654746 (= res!424703 (arrayContainsKey!0 lt!305110 (select (arr!18529 a!2986) j!136) j!136))))

(declare-fun b!654747 () Bool)

(declare-fun e!376000 () Unit!22448)

(declare-fun Unit!22451 () Unit!22448)

(assert (=> b!654747 (= e!376000 Unit!22451)))

(declare-fun lt!305116 () Unit!22448)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38658 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22448)

(assert (=> b!654747 (= lt!305116 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!305110 (select (arr!18529 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!654747 (arrayContainsKey!0 lt!305110 (select (arr!18529 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!305103 () Unit!22448)

(declare-datatypes ((List!12570 0))(
  ( (Nil!12567) (Cons!12566 (h!13611 (_ BitVec 64)) (t!18798 List!12570)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38658 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12570) Unit!22448)

(assert (=> b!654747 (= lt!305103 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12567))))

(declare-fun arrayNoDuplicates!0 (array!38658 (_ BitVec 32) List!12570) Bool)

(assert (=> b!654747 (arrayNoDuplicates!0 lt!305110 #b00000000000000000000000000000000 Nil!12567)))

(declare-fun lt!305109 () Unit!22448)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38658 (_ BitVec 32) (_ BitVec 32)) Unit!22448)

(assert (=> b!654747 (= lt!305109 (lemmaNoDuplicateFromThenFromBigger!0 lt!305110 #b00000000000000000000000000000000 j!136))))

(assert (=> b!654747 (arrayNoDuplicates!0 lt!305110 j!136 Nil!12567)))

(declare-fun lt!305117 () Unit!22448)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38658 (_ BitVec 64) (_ BitVec 32) List!12570) Unit!22448)

(assert (=> b!654747 (= lt!305117 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!305110 (select (arr!18529 a!2986) j!136) j!136 Nil!12567))))

(assert (=> b!654747 false))

(declare-fun b!654748 () Bool)

(declare-fun Unit!22452 () Unit!22448)

(assert (=> b!654748 (= e!376000 Unit!22452)))

(declare-fun b!654749 () Bool)

(assert (=> b!654749 (= e!376003 e!376002)))

(declare-fun res!424711 () Bool)

(assert (=> b!654749 (=> (not res!424711) (not e!376002))))

(declare-fun lt!305122 () SeekEntryResult!6969)

(assert (=> b!654749 (= res!424711 (or (= lt!305122 (MissingZero!6969 i!1108)) (= lt!305122 (MissingVacant!6969 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38658 (_ BitVec 32)) SeekEntryResult!6969)

(assert (=> b!654749 (= lt!305122 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!654750 () Bool)

(declare-fun res!424715 () Bool)

(assert (=> b!654750 (=> (not res!424715) (not e!376002))))

(assert (=> b!654750 (= res!424715 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18529 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!654751 () Bool)

(declare-fun res!424706 () Bool)

(assert (=> b!654751 (=> (not res!424706) (not e!376003))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!654751 (= res!424706 (validKeyInArray!0 k0!1786))))

(declare-fun b!654752 () Bool)

(declare-fun e!376007 () Bool)

(assert (=> b!654752 (= e!376007 (arrayContainsKey!0 lt!305110 (select (arr!18529 a!2986) j!136) index!984))))

(declare-fun b!654753 () Bool)

(declare-fun e!375997 () Bool)

(assert (=> b!654753 (= e!375997 e!376001)))

(declare-fun res!424713 () Bool)

(assert (=> b!654753 (=> (not res!424713) (not e!376001))))

(assert (=> b!654753 (= res!424713 (and (= lt!305108 (Found!6969 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18529 a!2986) index!984) (select (arr!18529 a!2986) j!136))) (not (= (select (arr!18529 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!654753 (= lt!305108 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18529 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!654754 () Bool)

(declare-fun res!424716 () Bool)

(assert (=> b!654754 (=> (not res!424716) (not e!376002))))

(assert (=> b!654754 (= res!424716 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12567))))

(declare-fun b!654755 () Bool)

(declare-fun res!424707 () Bool)

(assert (=> b!654755 (=> (not res!424707) (not e!376003))))

(assert (=> b!654755 (= res!424707 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!654756 () Bool)

(assert (=> b!654756 (= e!376002 e!375997)))

(declare-fun res!424704 () Bool)

(assert (=> b!654756 (=> (not res!424704) (not e!375997))))

(assert (=> b!654756 (= res!424704 (= (select (store (arr!18529 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!654756 (= lt!305110 (array!38659 (store (arr!18529 a!2986) i!1108 k0!1786) (size!18893 a!2986)))))

(declare-fun b!654757 () Bool)

(declare-fun res!424710 () Bool)

(assert (=> b!654757 (=> (not res!424710) (not e!376003))))

(assert (=> b!654757 (= res!424710 (and (= (size!18893 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18893 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18893 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!654758 () Bool)

(declare-fun e!376008 () Bool)

(assert (=> b!654758 (= e!376005 e!376008)))

(declare-fun res!424718 () Bool)

(assert (=> b!654758 (=> res!424718 e!376008)))

(assert (=> b!654758 (= res!424718 (or (not (= (select (arr!18529 a!2986) j!136) lt!305106)) (not (= (select (arr!18529 a!2986) j!136) lt!305120))))))

(assert (=> b!654758 e!376010))

(declare-fun res!424709 () Bool)

(assert (=> b!654758 (=> (not res!424709) (not e!376010))))

(assert (=> b!654758 (= res!424709 (= lt!305120 (select (arr!18529 a!2986) j!136)))))

(assert (=> b!654758 (= lt!305120 (select (store (arr!18529 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!654759 () Bool)

(assert (=> b!654759 (= e!376004 (arrayContainsKey!0 lt!305110 (select (arr!18529 a!2986) j!136) index!984))))

(declare-fun b!654760 () Bool)

(declare-fun Unit!22453 () Unit!22448)

(assert (=> b!654760 (= e!375998 Unit!22453)))

(assert (=> b!654760 false))

(declare-fun b!654761 () Bool)

(declare-fun Unit!22454 () Unit!22448)

(assert (=> b!654761 (= e!376006 Unit!22454)))

(declare-fun res!424717 () Bool)

(assert (=> b!654761 (= res!424717 (arrayContainsKey!0 lt!305110 (select (arr!18529 a!2986) j!136) j!136))))

(assert (=> b!654761 (=> (not res!424717) (not e!376007))))

(assert (=> b!654761 e!376007))

(declare-fun lt!305118 () Unit!22448)

(assert (=> b!654761 (= lt!305118 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!305110 (select (arr!18529 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!654761 (arrayContainsKey!0 lt!305110 (select (arr!18529 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!305115 () Unit!22448)

(assert (=> b!654761 (= lt!305115 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12567))))

(assert (=> b!654761 (arrayNoDuplicates!0 lt!305110 #b00000000000000000000000000000000 Nil!12567)))

(declare-fun lt!305107 () Unit!22448)

(assert (=> b!654761 (= lt!305107 (lemmaNoDuplicateFromThenFromBigger!0 lt!305110 #b00000000000000000000000000000000 index!984))))

(assert (=> b!654761 (arrayNoDuplicates!0 lt!305110 index!984 Nil!12567)))

(declare-fun lt!305112 () Unit!22448)

(assert (=> b!654761 (= lt!305112 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!305110 (select (arr!18529 a!2986) j!136) index!984 Nil!12567))))

(assert (=> b!654761 false))

(declare-fun b!654762 () Bool)

(declare-fun res!424705 () Bool)

(assert (=> b!654762 (=> (not res!424705) (not e!376003))))

(assert (=> b!654762 (= res!424705 (validKeyInArray!0 (select (arr!18529 a!2986) j!136)))))

(declare-fun b!654763 () Bool)

(declare-fun Unit!22455 () Unit!22448)

(assert (=> b!654763 (= e!375998 Unit!22455)))

(declare-fun b!654764 () Bool)

(assert (=> b!654764 (= e!376008 true)))

(assert (=> b!654764 false))

(declare-fun lt!305105 () Unit!22448)

(assert (=> b!654764 (= lt!305105 e!376006)))

(declare-fun c!75387 () Bool)

(assert (=> b!654764 (= c!75387 (bvslt index!984 j!136))))

(declare-fun lt!305111 () Unit!22448)

(assert (=> b!654764 (= lt!305111 e!376000)))

(declare-fun c!75389 () Bool)

(assert (=> b!654764 (= c!75389 (bvslt j!136 index!984))))

(assert (= (and start!59338 res!424714) b!654757))

(assert (= (and b!654757 res!424710) b!654762))

(assert (= (and b!654762 res!424705) b!654751))

(assert (= (and b!654751 res!424706) b!654755))

(assert (= (and b!654755 res!424707) b!654749))

(assert (= (and b!654749 res!424711) b!654742))

(assert (= (and b!654742 res!424701) b!654754))

(assert (= (and b!654754 res!424716) b!654750))

(assert (= (and b!654750 res!424715) b!654756))

(assert (= (and b!654756 res!424704) b!654753))

(assert (= (and b!654753 res!424713) b!654741))

(assert (= (and b!654741 res!424708) b!654745))

(assert (= (and b!654741 c!75388) b!654760))

(assert (= (and b!654741 (not c!75388)) b!654763))

(assert (= (and b!654741 (not res!424702)) b!654758))

(assert (= (and b!654758 res!424709) b!654743))

(assert (= (and b!654743 (not res!424712)) b!654746))

(assert (= (and b!654746 res!424703) b!654759))

(assert (= (and b!654758 (not res!424718)) b!654764))

(assert (= (and b!654764 c!75389) b!654747))

(assert (= (and b!654764 (not c!75389)) b!654748))

(assert (= (and b!654764 c!75387) b!654761))

(assert (= (and b!654764 (not c!75387)) b!654744))

(assert (= (and b!654761 res!424717) b!654752))

(declare-fun m!627837 () Bool)

(assert (=> b!654753 m!627837))

(declare-fun m!627839 () Bool)

(assert (=> b!654753 m!627839))

(assert (=> b!654753 m!627839))

(declare-fun m!627841 () Bool)

(assert (=> b!654753 m!627841))

(declare-fun m!627843 () Bool)

(assert (=> b!654742 m!627843))

(assert (=> b!654761 m!627839))

(declare-fun m!627845 () Bool)

(assert (=> b!654761 m!627845))

(assert (=> b!654761 m!627839))

(assert (=> b!654761 m!627839))

(declare-fun m!627847 () Bool)

(assert (=> b!654761 m!627847))

(declare-fun m!627849 () Bool)

(assert (=> b!654761 m!627849))

(declare-fun m!627851 () Bool)

(assert (=> b!654761 m!627851))

(declare-fun m!627853 () Bool)

(assert (=> b!654761 m!627853))

(declare-fun m!627855 () Bool)

(assert (=> b!654761 m!627855))

(assert (=> b!654761 m!627839))

(declare-fun m!627857 () Bool)

(assert (=> b!654761 m!627857))

(assert (=> b!654761 m!627839))

(declare-fun m!627859 () Bool)

(assert (=> b!654761 m!627859))

(assert (=> b!654759 m!627839))

(assert (=> b!654759 m!627839))

(declare-fun m!627861 () Bool)

(assert (=> b!654759 m!627861))

(declare-fun m!627863 () Bool)

(assert (=> b!654756 m!627863))

(declare-fun m!627865 () Bool)

(assert (=> b!654756 m!627865))

(declare-fun m!627867 () Bool)

(assert (=> b!654755 m!627867))

(declare-fun m!627869 () Bool)

(assert (=> b!654750 m!627869))

(declare-fun m!627871 () Bool)

(assert (=> b!654751 m!627871))

(assert (=> b!654746 m!627839))

(assert (=> b!654746 m!627839))

(assert (=> b!654746 m!627857))

(assert (=> b!654743 m!627839))

(assert (=> b!654752 m!627839))

(assert (=> b!654752 m!627839))

(assert (=> b!654752 m!627861))

(assert (=> b!654747 m!627839))

(assert (=> b!654747 m!627839))

(declare-fun m!627873 () Bool)

(assert (=> b!654747 m!627873))

(assert (=> b!654747 m!627851))

(assert (=> b!654747 m!627839))

(declare-fun m!627875 () Bool)

(assert (=> b!654747 m!627875))

(declare-fun m!627877 () Bool)

(assert (=> b!654747 m!627877))

(declare-fun m!627879 () Bool)

(assert (=> b!654747 m!627879))

(assert (=> b!654747 m!627839))

(declare-fun m!627881 () Bool)

(assert (=> b!654747 m!627881))

(assert (=> b!654747 m!627853))

(declare-fun m!627883 () Bool)

(assert (=> b!654754 m!627883))

(assert (=> b!654762 m!627839))

(assert (=> b!654762 m!627839))

(declare-fun m!627885 () Bool)

(assert (=> b!654762 m!627885))

(declare-fun m!627887 () Bool)

(assert (=> b!654741 m!627887))

(declare-fun m!627889 () Bool)

(assert (=> b!654741 m!627889))

(assert (=> b!654741 m!627839))

(declare-fun m!627891 () Bool)

(assert (=> b!654741 m!627891))

(assert (=> b!654741 m!627839))

(declare-fun m!627893 () Bool)

(assert (=> b!654741 m!627893))

(assert (=> b!654741 m!627863))

(declare-fun m!627895 () Bool)

(assert (=> b!654741 m!627895))

(declare-fun m!627897 () Bool)

(assert (=> b!654741 m!627897))

(declare-fun m!627899 () Bool)

(assert (=> b!654749 m!627899))

(declare-fun m!627901 () Bool)

(assert (=> start!59338 m!627901))

(declare-fun m!627903 () Bool)

(assert (=> start!59338 m!627903))

(assert (=> b!654758 m!627839))

(assert (=> b!654758 m!627863))

(declare-fun m!627905 () Bool)

(assert (=> b!654758 m!627905))

(check-sat (not b!654753) (not b!654754) (not start!59338) (not b!654746) (not b!654755) (not b!654749) (not b!654747) (not b!654742) (not b!654762) (not b!654741) (not b!654759) (not b!654752) (not b!654761) (not b!654751))
(check-sat)
