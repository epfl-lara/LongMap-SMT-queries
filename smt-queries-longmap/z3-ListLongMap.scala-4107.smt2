; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56190 () Bool)

(assert start!56190)

(declare-fun b!620762 () Bool)

(declare-datatypes ((Unit!20617 0))(
  ( (Unit!20618) )
))
(declare-fun e!356049 () Unit!20617)

(declare-fun Unit!20619 () Unit!20617)

(assert (=> b!620762 (= e!356049 Unit!20619)))

(declare-fun b!620763 () Bool)

(declare-fun e!356045 () Unit!20617)

(declare-fun Unit!20620 () Unit!20617)

(assert (=> b!620763 (= e!356045 Unit!20620)))

(assert (=> b!620763 false))

(declare-fun b!620765 () Bool)

(declare-fun e!356047 () Bool)

(declare-datatypes ((SeekEntryResult!6442 0))(
  ( (MissingZero!6442 (index!28052 (_ BitVec 32))) (Found!6442 (index!28053 (_ BitVec 32))) (Intermediate!6442 (undefined!7254 Bool) (index!28054 (_ BitVec 32)) (x!56981 (_ BitVec 32))) (Undefined!6442) (MissingVacant!6442 (index!28055 (_ BitVec 32))) )
))
(declare-fun lt!286924 () SeekEntryResult!6442)

(declare-fun lt!286936 () SeekEntryResult!6442)

(assert (=> b!620765 (= e!356047 (= lt!286924 lt!286936))))

(declare-fun b!620766 () Bool)

(declare-fun res!399990 () Bool)

(declare-fun e!356055 () Bool)

(assert (=> b!620766 (=> (not res!399990) (not e!356055))))

(declare-datatypes ((array!37605 0))(
  ( (array!37606 (arr!18046 (Array (_ BitVec 32) (_ BitVec 64))) (size!18410 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37605)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37605 (_ BitVec 32)) Bool)

(assert (=> b!620766 (= res!399990 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!620767 () Bool)

(declare-fun res!399992 () Bool)

(assert (=> b!620767 (=> (not res!399992) (not e!356055))))

(declare-datatypes ((List!11994 0))(
  ( (Nil!11991) (Cons!11990 (h!13038 (_ BitVec 64)) (t!18214 List!11994)) )
))
(declare-fun arrayNoDuplicates!0 (array!37605 (_ BitVec 32) List!11994) Bool)

(assert (=> b!620767 (= res!399992 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11991))))

(declare-fun b!620768 () Bool)

(declare-fun res!399984 () Bool)

(assert (=> b!620768 (=> (not res!399984) (not e!356055))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!620768 (= res!399984 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18046 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!286925 () array!37605)

(declare-fun b!620769 () Bool)

(declare-fun e!356048 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!37605 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!620769 (= e!356048 (arrayContainsKey!0 lt!286925 (select (arr!18046 a!2986) j!136) index!984))))

(declare-fun b!620770 () Bool)

(declare-fun e!356051 () Bool)

(assert (=> b!620770 (= e!356051 (not true))))

(declare-fun lt!286934 () Unit!20617)

(declare-fun e!356046 () Unit!20617)

(assert (=> b!620770 (= lt!286934 e!356046)))

(declare-fun c!70761 () Bool)

(declare-fun lt!286935 () SeekEntryResult!6442)

(assert (=> b!620770 (= c!70761 (= lt!286935 (Found!6442 index!984)))))

(declare-fun lt!286932 () Unit!20617)

(assert (=> b!620770 (= lt!286932 e!356045)))

(declare-fun c!70760 () Bool)

(assert (=> b!620770 (= c!70760 (= lt!286935 Undefined!6442))))

(declare-fun lt!286920 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37605 (_ BitVec 32)) SeekEntryResult!6442)

(assert (=> b!620770 (= lt!286935 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!286920 lt!286925 mask!3053))))

(assert (=> b!620770 e!356047))

(declare-fun res!399979 () Bool)

(assert (=> b!620770 (=> (not res!399979) (not e!356047))))

(declare-fun lt!286929 () (_ BitVec 32))

(assert (=> b!620770 (= res!399979 (= lt!286936 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!286929 vacantSpotIndex!68 lt!286920 lt!286925 mask!3053)))))

(assert (=> b!620770 (= lt!286936 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!286929 vacantSpotIndex!68 (select (arr!18046 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!620770 (= lt!286920 (select (store (arr!18046 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!286931 () Unit!20617)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37605 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20617)

(assert (=> b!620770 (= lt!286931 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!286929 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!620770 (= lt!286929 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!620771 () Bool)

(declare-fun res!399985 () Bool)

(declare-fun e!356052 () Bool)

(assert (=> b!620771 (=> (not res!399985) (not e!356052))))

(assert (=> b!620771 (= res!399985 (and (= (size!18410 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18410 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18410 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!620772 () Bool)

(declare-fun res!399994 () Bool)

(assert (=> b!620772 (=> (not res!399994) (not e!356052))))

(assert (=> b!620772 (= res!399994 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!620773 () Bool)

(declare-fun res!399982 () Bool)

(assert (=> b!620773 (=> (not res!399982) (not e!356052))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!620773 (= res!399982 (validKeyInArray!0 (select (arr!18046 a!2986) j!136)))))

(declare-fun b!620774 () Bool)

(declare-fun Unit!20621 () Unit!20617)

(assert (=> b!620774 (= e!356046 Unit!20621)))

(declare-fun res!399993 () Bool)

(assert (=> b!620774 (= res!399993 (= (select (store (arr!18046 a!2986) i!1108 k0!1786) index!984) (select (arr!18046 a!2986) j!136)))))

(declare-fun e!356054 () Bool)

(assert (=> b!620774 (=> (not res!399993) (not e!356054))))

(assert (=> b!620774 e!356054))

(declare-fun c!70763 () Bool)

(assert (=> b!620774 (= c!70763 (bvslt j!136 index!984))))

(declare-fun lt!286922 () Unit!20617)

(declare-fun e!356044 () Unit!20617)

(assert (=> b!620774 (= lt!286922 e!356044)))

(declare-fun c!70762 () Bool)

(assert (=> b!620774 (= c!70762 (bvslt index!984 j!136))))

(declare-fun lt!286927 () Unit!20617)

(assert (=> b!620774 (= lt!286927 e!356049)))

(assert (=> b!620774 false))

(declare-fun e!356053 () Bool)

(declare-fun b!620775 () Bool)

(assert (=> b!620775 (= e!356053 (arrayContainsKey!0 lt!286925 (select (arr!18046 a!2986) j!136) index!984))))

(declare-fun b!620776 () Bool)

(declare-fun Unit!20622 () Unit!20617)

(assert (=> b!620776 (= e!356045 Unit!20622)))

(declare-fun b!620777 () Bool)

(assert (=> b!620777 false))

(declare-fun lt!286933 () Unit!20617)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37605 (_ BitVec 64) (_ BitVec 32) List!11994) Unit!20617)

(assert (=> b!620777 (= lt!286933 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!286925 (select (arr!18046 a!2986) j!136) j!136 Nil!11991))))

(assert (=> b!620777 (arrayNoDuplicates!0 lt!286925 j!136 Nil!11991)))

(declare-fun lt!286930 () Unit!20617)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37605 (_ BitVec 32) (_ BitVec 32)) Unit!20617)

(assert (=> b!620777 (= lt!286930 (lemmaNoDuplicateFromThenFromBigger!0 lt!286925 #b00000000000000000000000000000000 j!136))))

(assert (=> b!620777 (arrayNoDuplicates!0 lt!286925 #b00000000000000000000000000000000 Nil!11991)))

(declare-fun lt!286937 () Unit!20617)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37605 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11994) Unit!20617)

(assert (=> b!620777 (= lt!286937 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11991))))

(assert (=> b!620777 (arrayContainsKey!0 lt!286925 (select (arr!18046 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!286921 () Unit!20617)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37605 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20617)

(assert (=> b!620777 (= lt!286921 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!286925 (select (arr!18046 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20623 () Unit!20617)

(assert (=> b!620777 (= e!356044 Unit!20623)))

(declare-fun b!620764 () Bool)

(assert (=> b!620764 false))

(declare-fun lt!286938 () Unit!20617)

(assert (=> b!620764 (= lt!286938 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!286925 (select (arr!18046 a!2986) j!136) index!984 Nil!11991))))

(assert (=> b!620764 (arrayNoDuplicates!0 lt!286925 index!984 Nil!11991)))

(declare-fun lt!286926 () Unit!20617)

(assert (=> b!620764 (= lt!286926 (lemmaNoDuplicateFromThenFromBigger!0 lt!286925 #b00000000000000000000000000000000 index!984))))

(assert (=> b!620764 (arrayNoDuplicates!0 lt!286925 #b00000000000000000000000000000000 Nil!11991)))

(declare-fun lt!286928 () Unit!20617)

(assert (=> b!620764 (= lt!286928 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11991))))

(assert (=> b!620764 (arrayContainsKey!0 lt!286925 (select (arr!18046 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!286923 () Unit!20617)

(assert (=> b!620764 (= lt!286923 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!286925 (select (arr!18046 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!620764 e!356053))

(declare-fun res!399981 () Bool)

(assert (=> b!620764 (=> (not res!399981) (not e!356053))))

(assert (=> b!620764 (= res!399981 (arrayContainsKey!0 lt!286925 (select (arr!18046 a!2986) j!136) j!136))))

(declare-fun Unit!20624 () Unit!20617)

(assert (=> b!620764 (= e!356049 Unit!20624)))

(declare-fun res!399989 () Bool)

(assert (=> start!56190 (=> (not res!399989) (not e!356052))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56190 (= res!399989 (validMask!0 mask!3053))))

(assert (=> start!56190 e!356052))

(assert (=> start!56190 true))

(declare-fun array_inv!13905 (array!37605) Bool)

(assert (=> start!56190 (array_inv!13905 a!2986)))

(declare-fun b!620778 () Bool)

(declare-fun Unit!20625 () Unit!20617)

(assert (=> b!620778 (= e!356044 Unit!20625)))

(declare-fun res!399987 () Bool)

(declare-fun b!620779 () Bool)

(assert (=> b!620779 (= res!399987 (arrayContainsKey!0 lt!286925 (select (arr!18046 a!2986) j!136) j!136))))

(assert (=> b!620779 (=> (not res!399987) (not e!356048))))

(declare-fun e!356043 () Bool)

(assert (=> b!620779 (= e!356043 e!356048)))

(declare-fun b!620780 () Bool)

(declare-fun e!356050 () Bool)

(assert (=> b!620780 (= e!356055 e!356050)))

(declare-fun res!399991 () Bool)

(assert (=> b!620780 (=> (not res!399991) (not e!356050))))

(assert (=> b!620780 (= res!399991 (= (select (store (arr!18046 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!620780 (= lt!286925 (array!37606 (store (arr!18046 a!2986) i!1108 k0!1786) (size!18410 a!2986)))))

(declare-fun b!620781 () Bool)

(assert (=> b!620781 (= e!356050 e!356051)))

(declare-fun res!399983 () Bool)

(assert (=> b!620781 (=> (not res!399983) (not e!356051))))

(assert (=> b!620781 (= res!399983 (and (= lt!286924 (Found!6442 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18046 a!2986) index!984) (select (arr!18046 a!2986) j!136))) (not (= (select (arr!18046 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!620781 (= lt!286924 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18046 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!620782 () Bool)

(assert (=> b!620782 (= e!356052 e!356055)))

(declare-fun res!399988 () Bool)

(assert (=> b!620782 (=> (not res!399988) (not e!356055))))

(declare-fun lt!286939 () SeekEntryResult!6442)

(assert (=> b!620782 (= res!399988 (or (= lt!286939 (MissingZero!6442 i!1108)) (= lt!286939 (MissingVacant!6442 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37605 (_ BitVec 32)) SeekEntryResult!6442)

(assert (=> b!620782 (= lt!286939 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!620783 () Bool)

(declare-fun res!399980 () Bool)

(assert (=> b!620783 (= res!399980 (bvsge j!136 index!984))))

(assert (=> b!620783 (=> res!399980 e!356043)))

(assert (=> b!620783 (= e!356054 e!356043)))

(declare-fun b!620784 () Bool)

(declare-fun res!399986 () Bool)

(assert (=> b!620784 (=> (not res!399986) (not e!356052))))

(assert (=> b!620784 (= res!399986 (validKeyInArray!0 k0!1786))))

(declare-fun b!620785 () Bool)

(declare-fun Unit!20626 () Unit!20617)

(assert (=> b!620785 (= e!356046 Unit!20626)))

(assert (= (and start!56190 res!399989) b!620771))

(assert (= (and b!620771 res!399985) b!620773))

(assert (= (and b!620773 res!399982) b!620784))

(assert (= (and b!620784 res!399986) b!620772))

(assert (= (and b!620772 res!399994) b!620782))

(assert (= (and b!620782 res!399988) b!620766))

(assert (= (and b!620766 res!399990) b!620767))

(assert (= (and b!620767 res!399992) b!620768))

(assert (= (and b!620768 res!399984) b!620780))

(assert (= (and b!620780 res!399991) b!620781))

(assert (= (and b!620781 res!399983) b!620770))

(assert (= (and b!620770 res!399979) b!620765))

(assert (= (and b!620770 c!70760) b!620763))

(assert (= (and b!620770 (not c!70760)) b!620776))

(assert (= (and b!620770 c!70761) b!620774))

(assert (= (and b!620770 (not c!70761)) b!620785))

(assert (= (and b!620774 res!399993) b!620783))

(assert (= (and b!620783 (not res!399980)) b!620779))

(assert (= (and b!620779 res!399987) b!620769))

(assert (= (and b!620774 c!70763) b!620777))

(assert (= (and b!620774 (not c!70763)) b!620778))

(assert (= (and b!620774 c!70762) b!620764))

(assert (= (and b!620774 (not c!70762)) b!620762))

(assert (= (and b!620764 res!399981) b!620775))

(declare-fun m!596957 () Bool)

(assert (=> b!620768 m!596957))

(declare-fun m!596959 () Bool)

(assert (=> b!620780 m!596959))

(declare-fun m!596961 () Bool)

(assert (=> b!620780 m!596961))

(assert (=> b!620774 m!596959))

(declare-fun m!596963 () Bool)

(assert (=> b!620774 m!596963))

(declare-fun m!596965 () Bool)

(assert (=> b!620774 m!596965))

(declare-fun m!596967 () Bool)

(assert (=> b!620784 m!596967))

(declare-fun m!596969 () Bool)

(assert (=> b!620767 m!596969))

(declare-fun m!596971 () Bool)

(assert (=> b!620770 m!596971))

(declare-fun m!596973 () Bool)

(assert (=> b!620770 m!596973))

(assert (=> b!620770 m!596965))

(assert (=> b!620770 m!596959))

(declare-fun m!596975 () Bool)

(assert (=> b!620770 m!596975))

(declare-fun m!596977 () Bool)

(assert (=> b!620770 m!596977))

(declare-fun m!596979 () Bool)

(assert (=> b!620770 m!596979))

(assert (=> b!620770 m!596965))

(declare-fun m!596981 () Bool)

(assert (=> b!620770 m!596981))

(declare-fun m!596983 () Bool)

(assert (=> b!620782 m!596983))

(declare-fun m!596985 () Bool)

(assert (=> start!56190 m!596985))

(declare-fun m!596987 () Bool)

(assert (=> start!56190 m!596987))

(declare-fun m!596989 () Bool)

(assert (=> b!620766 m!596989))

(assert (=> b!620775 m!596965))

(assert (=> b!620775 m!596965))

(declare-fun m!596991 () Bool)

(assert (=> b!620775 m!596991))

(assert (=> b!620779 m!596965))

(assert (=> b!620779 m!596965))

(declare-fun m!596993 () Bool)

(assert (=> b!620779 m!596993))

(assert (=> b!620769 m!596965))

(assert (=> b!620769 m!596965))

(assert (=> b!620769 m!596991))

(declare-fun m!596995 () Bool)

(assert (=> b!620764 m!596995))

(assert (=> b!620764 m!596965))

(declare-fun m!596997 () Bool)

(assert (=> b!620764 m!596997))

(assert (=> b!620764 m!596965))

(declare-fun m!596999 () Bool)

(assert (=> b!620764 m!596999))

(assert (=> b!620764 m!596965))

(declare-fun m!597001 () Bool)

(assert (=> b!620764 m!597001))

(declare-fun m!597003 () Bool)

(assert (=> b!620764 m!597003))

(declare-fun m!597005 () Bool)

(assert (=> b!620764 m!597005))

(assert (=> b!620764 m!596965))

(declare-fun m!597007 () Bool)

(assert (=> b!620764 m!597007))

(assert (=> b!620764 m!596965))

(assert (=> b!620764 m!596993))

(declare-fun m!597009 () Bool)

(assert (=> b!620781 m!597009))

(assert (=> b!620781 m!596965))

(assert (=> b!620781 m!596965))

(declare-fun m!597011 () Bool)

(assert (=> b!620781 m!597011))

(assert (=> b!620773 m!596965))

(assert (=> b!620773 m!596965))

(declare-fun m!597013 () Bool)

(assert (=> b!620773 m!597013))

(declare-fun m!597015 () Bool)

(assert (=> b!620777 m!597015))

(declare-fun m!597017 () Bool)

(assert (=> b!620777 m!597017))

(assert (=> b!620777 m!596965))

(declare-fun m!597019 () Bool)

(assert (=> b!620777 m!597019))

(assert (=> b!620777 m!597005))

(assert (=> b!620777 m!596965))

(declare-fun m!597021 () Bool)

(assert (=> b!620777 m!597021))

(assert (=> b!620777 m!596965))

(assert (=> b!620777 m!596965))

(declare-fun m!597023 () Bool)

(assert (=> b!620777 m!597023))

(assert (=> b!620777 m!597003))

(declare-fun m!597025 () Bool)

(assert (=> b!620772 m!597025))

(check-sat (not b!620766) (not b!620779) (not b!620781) (not b!620770) (not b!620782) (not b!620764) (not b!620773) (not b!620775) (not start!56190) (not b!620767) (not b!620784) (not b!620777) (not b!620769) (not b!620772))
(check-sat)
