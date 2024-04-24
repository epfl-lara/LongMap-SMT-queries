; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56220 () Bool)

(assert start!56220)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun b!621842 () Bool)

(declare-fun e!356684 () Bool)

(declare-datatypes ((array!37635 0))(
  ( (array!37636 (arr!18061 (Array (_ BitVec 32) (_ BitVec 64))) (size!18425 (_ BitVec 32))) )
))
(declare-fun lt!287825 () array!37635)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37635)

(declare-fun arrayContainsKey!0 (array!37635 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!621842 (= e!356684 (arrayContainsKey!0 lt!287825 (select (arr!18061 a!2986) j!136) index!984))))

(declare-fun b!621843 () Bool)

(declare-fun res!400707 () Bool)

(assert (=> b!621843 (= res!400707 (bvsge j!136 index!984))))

(declare-fun e!356679 () Bool)

(assert (=> b!621843 (=> res!400707 e!356679)))

(declare-fun e!356672 () Bool)

(assert (=> b!621843 (= e!356672 e!356679)))

(declare-fun res!400712 () Bool)

(declare-fun e!356673 () Bool)

(assert (=> start!56220 (=> (not res!400712) (not e!356673))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56220 (= res!400712 (validMask!0 mask!3053))))

(assert (=> start!56220 e!356673))

(assert (=> start!56220 true))

(declare-fun array_inv!13920 (array!37635) Bool)

(assert (=> start!56220 (array_inv!13920 a!2986)))

(declare-fun b!621844 () Bool)

(declare-fun e!356674 () Bool)

(declare-datatypes ((SeekEntryResult!6457 0))(
  ( (MissingZero!6457 (index!28112 (_ BitVec 32))) (Found!6457 (index!28113 (_ BitVec 32))) (Intermediate!6457 (undefined!7269 Bool) (index!28114 (_ BitVec 32)) (x!57036 (_ BitVec 32))) (Undefined!6457) (MissingVacant!6457 (index!28115 (_ BitVec 32))) )
))
(declare-fun lt!287832 () SeekEntryResult!6457)

(declare-fun lt!287820 () SeekEntryResult!6457)

(assert (=> b!621844 (= e!356674 (= lt!287832 lt!287820))))

(declare-fun b!621845 () Bool)

(assert (=> b!621845 false))

(declare-datatypes ((Unit!20767 0))(
  ( (Unit!20768) )
))
(declare-fun lt!287824 () Unit!20767)

(declare-datatypes ((List!12009 0))(
  ( (Nil!12006) (Cons!12005 (h!13053 (_ BitVec 64)) (t!18229 List!12009)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37635 (_ BitVec 64) (_ BitVec 32) List!12009) Unit!20767)

(assert (=> b!621845 (= lt!287824 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!287825 (select (arr!18061 a!2986) j!136) j!136 Nil!12006))))

(declare-fun arrayNoDuplicates!0 (array!37635 (_ BitVec 32) List!12009) Bool)

(assert (=> b!621845 (arrayNoDuplicates!0 lt!287825 j!136 Nil!12006)))

(declare-fun lt!287833 () Unit!20767)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37635 (_ BitVec 32) (_ BitVec 32)) Unit!20767)

(assert (=> b!621845 (= lt!287833 (lemmaNoDuplicateFromThenFromBigger!0 lt!287825 #b00000000000000000000000000000000 j!136))))

(assert (=> b!621845 (arrayNoDuplicates!0 lt!287825 #b00000000000000000000000000000000 Nil!12006)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!287834 () Unit!20767)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37635 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12009) Unit!20767)

(assert (=> b!621845 (= lt!287834 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12006))))

(assert (=> b!621845 (arrayContainsKey!0 lt!287825 (select (arr!18061 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!287828 () Unit!20767)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37635 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20767)

(assert (=> b!621845 (= lt!287828 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!287825 (select (arr!18061 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!356685 () Unit!20767)

(declare-fun Unit!20769 () Unit!20767)

(assert (=> b!621845 (= e!356685 Unit!20769)))

(declare-fun b!621846 () Bool)

(declare-fun res!400706 () Bool)

(assert (=> b!621846 (=> (not res!400706) (not e!356673))))

(assert (=> b!621846 (= res!400706 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!621847 () Bool)

(declare-fun e!356676 () Unit!20767)

(declare-fun Unit!20770 () Unit!20767)

(assert (=> b!621847 (= e!356676 Unit!20770)))

(declare-fun b!621848 () Bool)

(declare-fun e!356675 () Bool)

(declare-fun e!356677 () Bool)

(assert (=> b!621848 (= e!356675 e!356677)))

(declare-fun res!400700 () Bool)

(assert (=> b!621848 (=> (not res!400700) (not e!356677))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!621848 (= res!400700 (and (= lt!287832 (Found!6457 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18061 a!2986) index!984) (select (arr!18061 a!2986) j!136))) (not (= (select (arr!18061 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37635 (_ BitVec 32)) SeekEntryResult!6457)

(assert (=> b!621848 (= lt!287832 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18061 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!621849 () Bool)

(declare-fun res!400709 () Bool)

(assert (=> b!621849 (=> (not res!400709) (not e!356673))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!621849 (= res!400709 (validKeyInArray!0 k0!1786))))

(declare-fun b!621850 () Bool)

(declare-fun res!400704 () Bool)

(declare-fun e!356678 () Bool)

(assert (=> b!621850 (=> (not res!400704) (not e!356678))))

(assert (=> b!621850 (= res!400704 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12006))))

(declare-fun b!621851 () Bool)

(declare-fun e!356683 () Unit!20767)

(declare-fun Unit!20771 () Unit!20767)

(assert (=> b!621851 (= e!356683 Unit!20771)))

(assert (=> b!621851 false))

(declare-fun b!621852 () Bool)

(declare-fun Unit!20772 () Unit!20767)

(assert (=> b!621852 (= e!356685 Unit!20772)))

(declare-fun b!621853 () Bool)

(declare-fun res!400702 () Bool)

(assert (=> b!621853 (=> (not res!400702) (not e!356678))))

(assert (=> b!621853 (= res!400702 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18061 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!621854 () Bool)

(declare-fun res!400710 () Bool)

(assert (=> b!621854 (=> (not res!400710) (not e!356678))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37635 (_ BitVec 32)) Bool)

(assert (=> b!621854 (= res!400710 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!621855 () Bool)

(assert (=> b!621855 false))

(declare-fun lt!287826 () Unit!20767)

(assert (=> b!621855 (= lt!287826 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!287825 (select (arr!18061 a!2986) j!136) index!984 Nil!12006))))

(assert (=> b!621855 (arrayNoDuplicates!0 lt!287825 index!984 Nil!12006)))

(declare-fun lt!287822 () Unit!20767)

(assert (=> b!621855 (= lt!287822 (lemmaNoDuplicateFromThenFromBigger!0 lt!287825 #b00000000000000000000000000000000 index!984))))

(assert (=> b!621855 (arrayNoDuplicates!0 lt!287825 #b00000000000000000000000000000000 Nil!12006)))

(declare-fun lt!287838 () Unit!20767)

(assert (=> b!621855 (= lt!287838 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12006))))

(assert (=> b!621855 (arrayContainsKey!0 lt!287825 (select (arr!18061 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!287837 () Unit!20767)

(assert (=> b!621855 (= lt!287837 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!287825 (select (arr!18061 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!621855 e!356684))

(declare-fun res!400711 () Bool)

(assert (=> b!621855 (=> (not res!400711) (not e!356684))))

(assert (=> b!621855 (= res!400711 (arrayContainsKey!0 lt!287825 (select (arr!18061 a!2986) j!136) j!136))))

(declare-fun e!356681 () Unit!20767)

(declare-fun Unit!20773 () Unit!20767)

(assert (=> b!621855 (= e!356681 Unit!20773)))

(declare-fun b!621856 () Bool)

(assert (=> b!621856 (= e!356678 e!356675)))

(declare-fun res!400703 () Bool)

(assert (=> b!621856 (=> (not res!400703) (not e!356675))))

(assert (=> b!621856 (= res!400703 (= (select (store (arr!18061 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!621856 (= lt!287825 (array!37636 (store (arr!18061 a!2986) i!1108 k0!1786) (size!18425 a!2986)))))

(declare-fun b!621857 () Bool)

(declare-fun res!400714 () Bool)

(assert (=> b!621857 (=> (not res!400714) (not e!356673))))

(assert (=> b!621857 (= res!400714 (validKeyInArray!0 (select (arr!18061 a!2986) j!136)))))

(declare-fun b!621858 () Bool)

(declare-fun res!400705 () Bool)

(assert (=> b!621858 (=> (not res!400705) (not e!356673))))

(assert (=> b!621858 (= res!400705 (and (= (size!18425 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18425 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18425 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!621859 () Bool)

(declare-fun res!400713 () Bool)

(assert (=> b!621859 (= res!400713 (arrayContainsKey!0 lt!287825 (select (arr!18061 a!2986) j!136) j!136))))

(declare-fun e!356680 () Bool)

(assert (=> b!621859 (=> (not res!400713) (not e!356680))))

(assert (=> b!621859 (= e!356679 e!356680)))

(declare-fun b!621860 () Bool)

(declare-fun Unit!20774 () Unit!20767)

(assert (=> b!621860 (= e!356676 Unit!20774)))

(declare-fun res!400708 () Bool)

(assert (=> b!621860 (= res!400708 (= (select (store (arr!18061 a!2986) i!1108 k0!1786) index!984) (select (arr!18061 a!2986) j!136)))))

(assert (=> b!621860 (=> (not res!400708) (not e!356672))))

(assert (=> b!621860 e!356672))

(declare-fun c!70943 () Bool)

(assert (=> b!621860 (= c!70943 (bvslt j!136 index!984))))

(declare-fun lt!287829 () Unit!20767)

(assert (=> b!621860 (= lt!287829 e!356685)))

(declare-fun c!70941 () Bool)

(assert (=> b!621860 (= c!70941 (bvslt index!984 j!136))))

(declare-fun lt!287831 () Unit!20767)

(assert (=> b!621860 (= lt!287831 e!356681)))

(assert (=> b!621860 false))

(declare-fun b!621861 () Bool)

(assert (=> b!621861 (= e!356680 (arrayContainsKey!0 lt!287825 (select (arr!18061 a!2986) j!136) index!984))))

(declare-fun b!621862 () Bool)

(assert (=> b!621862 (= e!356677 (not true))))

(declare-fun lt!287821 () Unit!20767)

(assert (=> b!621862 (= lt!287821 e!356676)))

(declare-fun c!70940 () Bool)

(declare-fun lt!287835 () SeekEntryResult!6457)

(assert (=> b!621862 (= c!70940 (= lt!287835 (Found!6457 index!984)))))

(declare-fun lt!287823 () Unit!20767)

(assert (=> b!621862 (= lt!287823 e!356683)))

(declare-fun c!70942 () Bool)

(assert (=> b!621862 (= c!70942 (= lt!287835 Undefined!6457))))

(declare-fun lt!287839 () (_ BitVec 64))

(assert (=> b!621862 (= lt!287835 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!287839 lt!287825 mask!3053))))

(assert (=> b!621862 e!356674))

(declare-fun res!400701 () Bool)

(assert (=> b!621862 (=> (not res!400701) (not e!356674))))

(declare-fun lt!287827 () (_ BitVec 32))

(assert (=> b!621862 (= res!400701 (= lt!287820 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!287827 vacantSpotIndex!68 lt!287839 lt!287825 mask!3053)))))

(assert (=> b!621862 (= lt!287820 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!287827 vacantSpotIndex!68 (select (arr!18061 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!621862 (= lt!287839 (select (store (arr!18061 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!287830 () Unit!20767)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37635 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20767)

(assert (=> b!621862 (= lt!287830 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!287827 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!621862 (= lt!287827 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!621863 () Bool)

(declare-fun Unit!20775 () Unit!20767)

(assert (=> b!621863 (= e!356683 Unit!20775)))

(declare-fun b!621864 () Bool)

(declare-fun Unit!20776 () Unit!20767)

(assert (=> b!621864 (= e!356681 Unit!20776)))

(declare-fun b!621865 () Bool)

(assert (=> b!621865 (= e!356673 e!356678)))

(declare-fun res!400699 () Bool)

(assert (=> b!621865 (=> (not res!400699) (not e!356678))))

(declare-fun lt!287836 () SeekEntryResult!6457)

(assert (=> b!621865 (= res!400699 (or (= lt!287836 (MissingZero!6457 i!1108)) (= lt!287836 (MissingVacant!6457 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37635 (_ BitVec 32)) SeekEntryResult!6457)

(assert (=> b!621865 (= lt!287836 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!56220 res!400712) b!621858))

(assert (= (and b!621858 res!400705) b!621857))

(assert (= (and b!621857 res!400714) b!621849))

(assert (= (and b!621849 res!400709) b!621846))

(assert (= (and b!621846 res!400706) b!621865))

(assert (= (and b!621865 res!400699) b!621854))

(assert (= (and b!621854 res!400710) b!621850))

(assert (= (and b!621850 res!400704) b!621853))

(assert (= (and b!621853 res!400702) b!621856))

(assert (= (and b!621856 res!400703) b!621848))

(assert (= (and b!621848 res!400700) b!621862))

(assert (= (and b!621862 res!400701) b!621844))

(assert (= (and b!621862 c!70942) b!621851))

(assert (= (and b!621862 (not c!70942)) b!621863))

(assert (= (and b!621862 c!70940) b!621860))

(assert (= (and b!621862 (not c!70940)) b!621847))

(assert (= (and b!621860 res!400708) b!621843))

(assert (= (and b!621843 (not res!400707)) b!621859))

(assert (= (and b!621859 res!400713) b!621861))

(assert (= (and b!621860 c!70943) b!621845))

(assert (= (and b!621860 (not c!70943)) b!621852))

(assert (= (and b!621860 c!70941) b!621855))

(assert (= (and b!621860 (not c!70941)) b!621864))

(assert (= (and b!621855 res!400711) b!621842))

(declare-fun m!598007 () Bool)

(assert (=> b!621865 m!598007))

(declare-fun m!598009 () Bool)

(assert (=> start!56220 m!598009))

(declare-fun m!598011 () Bool)

(assert (=> start!56220 m!598011))

(declare-fun m!598013 () Bool)

(assert (=> b!621846 m!598013))

(declare-fun m!598015 () Bool)

(assert (=> b!621842 m!598015))

(assert (=> b!621842 m!598015))

(declare-fun m!598017 () Bool)

(assert (=> b!621842 m!598017))

(declare-fun m!598019 () Bool)

(assert (=> b!621856 m!598019))

(declare-fun m!598021 () Bool)

(assert (=> b!621856 m!598021))

(declare-fun m!598023 () Bool)

(assert (=> b!621850 m!598023))

(declare-fun m!598025 () Bool)

(assert (=> b!621853 m!598025))

(declare-fun m!598027 () Bool)

(assert (=> b!621855 m!598027))

(assert (=> b!621855 m!598015))

(assert (=> b!621855 m!598015))

(declare-fun m!598029 () Bool)

(assert (=> b!621855 m!598029))

(assert (=> b!621855 m!598015))

(declare-fun m!598031 () Bool)

(assert (=> b!621855 m!598031))

(declare-fun m!598033 () Bool)

(assert (=> b!621855 m!598033))

(assert (=> b!621855 m!598015))

(declare-fun m!598035 () Bool)

(assert (=> b!621855 m!598035))

(declare-fun m!598037 () Bool)

(assert (=> b!621855 m!598037))

(assert (=> b!621855 m!598015))

(declare-fun m!598039 () Bool)

(assert (=> b!621855 m!598039))

(declare-fun m!598041 () Bool)

(assert (=> b!621855 m!598041))

(assert (=> b!621860 m!598019))

(declare-fun m!598043 () Bool)

(assert (=> b!621860 m!598043))

(assert (=> b!621860 m!598015))

(declare-fun m!598045 () Bool)

(assert (=> b!621854 m!598045))

(assert (=> b!621857 m!598015))

(assert (=> b!621857 m!598015))

(declare-fun m!598047 () Bool)

(assert (=> b!621857 m!598047))

(assert (=> b!621861 m!598015))

(assert (=> b!621861 m!598015))

(assert (=> b!621861 m!598017))

(assert (=> b!621845 m!598041))

(assert (=> b!621845 m!598015))

(declare-fun m!598049 () Bool)

(assert (=> b!621845 m!598049))

(declare-fun m!598051 () Bool)

(assert (=> b!621845 m!598051))

(assert (=> b!621845 m!598015))

(declare-fun m!598053 () Bool)

(assert (=> b!621845 m!598053))

(assert (=> b!621845 m!598015))

(assert (=> b!621845 m!598015))

(declare-fun m!598055 () Bool)

(assert (=> b!621845 m!598055))

(declare-fun m!598057 () Bool)

(assert (=> b!621845 m!598057))

(assert (=> b!621845 m!598033))

(declare-fun m!598059 () Bool)

(assert (=> b!621862 m!598059))

(declare-fun m!598061 () Bool)

(assert (=> b!621862 m!598061))

(declare-fun m!598063 () Bool)

(assert (=> b!621862 m!598063))

(assert (=> b!621862 m!598015))

(assert (=> b!621862 m!598019))

(declare-fun m!598065 () Bool)

(assert (=> b!621862 m!598065))

(assert (=> b!621862 m!598015))

(declare-fun m!598067 () Bool)

(assert (=> b!621862 m!598067))

(declare-fun m!598069 () Bool)

(assert (=> b!621862 m!598069))

(declare-fun m!598071 () Bool)

(assert (=> b!621848 m!598071))

(assert (=> b!621848 m!598015))

(assert (=> b!621848 m!598015))

(declare-fun m!598073 () Bool)

(assert (=> b!621848 m!598073))

(assert (=> b!621859 m!598015))

(assert (=> b!621859 m!598015))

(assert (=> b!621859 m!598031))

(declare-fun m!598075 () Bool)

(assert (=> b!621849 m!598075))

(check-sat (not b!621846) (not b!621862) (not start!56220) (not b!621849) (not b!621861) (not b!621850) (not b!621842) (not b!621855) (not b!621857) (not b!621848) (not b!621859) (not b!621845) (not b!621865) (not b!621854))
(check-sat)
