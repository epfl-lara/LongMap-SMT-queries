; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59092 () Bool)

(assert start!59092)

(declare-fun b!651811 () Bool)

(declare-datatypes ((Unit!22260 0))(
  ( (Unit!22261) )
))
(declare-fun e!374067 () Unit!22260)

(declare-fun Unit!22262 () Unit!22260)

(assert (=> b!651811 (= e!374067 Unit!22262)))

(declare-datatypes ((array!38592 0))(
  ( (array!38593 (arr!18499 (Array (_ BitVec 32) (_ BitVec 64))) (size!18863 (_ BitVec 32))) )
))
(declare-fun lt!303126 () array!38592)

(declare-fun lt!303128 () Unit!22260)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!38592)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38592 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22260)

(assert (=> b!651811 (= lt!303128 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!303126 (select (arr!18499 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun arrayContainsKey!0 (array!38592 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!651811 (arrayContainsKey!0 lt!303126 (select (arr!18499 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!303123 () Unit!22260)

(declare-datatypes ((List!12540 0))(
  ( (Nil!12537) (Cons!12536 (h!13581 (_ BitVec 64)) (t!18768 List!12540)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38592 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12540) Unit!22260)

(assert (=> b!651811 (= lt!303123 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12537))))

(declare-fun arrayNoDuplicates!0 (array!38592 (_ BitVec 32) List!12540) Bool)

(assert (=> b!651811 (arrayNoDuplicates!0 lt!303126 #b00000000000000000000000000000000 Nil!12537)))

(declare-fun lt!303125 () Unit!22260)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38592 (_ BitVec 32) (_ BitVec 32)) Unit!22260)

(assert (=> b!651811 (= lt!303125 (lemmaNoDuplicateFromThenFromBigger!0 lt!303126 #b00000000000000000000000000000000 j!136))))

(assert (=> b!651811 (arrayNoDuplicates!0 lt!303126 j!136 Nil!12537)))

(declare-fun lt!303116 () Unit!22260)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38592 (_ BitVec 64) (_ BitVec 32) List!12540) Unit!22260)

(assert (=> b!651811 (= lt!303116 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!303126 (select (arr!18499 a!2986) j!136) j!136 Nil!12537))))

(assert (=> b!651811 false))

(declare-fun b!651812 () Bool)

(declare-fun e!374064 () Unit!22260)

(declare-fun Unit!22263 () Unit!22260)

(assert (=> b!651812 (= e!374064 Unit!22263)))

(declare-fun b!651813 () Bool)

(declare-fun res!422592 () Bool)

(declare-fun e!374072 () Bool)

(assert (=> b!651813 (=> (not res!422592) (not e!374072))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!651813 (= res!422592 (validKeyInArray!0 k0!1786))))

(declare-fun b!651815 () Bool)

(declare-fun res!422599 () Bool)

(declare-fun e!374074 () Bool)

(assert (=> b!651815 (=> (not res!422599) (not e!374074))))

(assert (=> b!651815 (= res!422599 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12537))))

(declare-fun b!651816 () Bool)

(declare-fun Unit!22264 () Unit!22260)

(assert (=> b!651816 (= e!374064 Unit!22264)))

(assert (=> b!651816 false))

(declare-fun b!651817 () Bool)

(declare-fun e!374071 () Bool)

(declare-fun e!374063 () Bool)

(assert (=> b!651817 (= e!374071 e!374063)))

(declare-fun res!422608 () Bool)

(assert (=> b!651817 (=> (not res!422608) (not e!374063))))

(assert (=> b!651817 (= res!422608 (arrayContainsKey!0 lt!303126 (select (arr!18499 a!2986) j!136) j!136))))

(declare-fun b!651818 () Bool)

(declare-fun e!374075 () Bool)

(declare-datatypes ((SeekEntryResult!6939 0))(
  ( (MissingZero!6939 (index!30109 (_ BitVec 32))) (Found!6939 (index!30110 (_ BitVec 32))) (Intermediate!6939 (undefined!7751 Bool) (index!30111 (_ BitVec 32)) (x!58898 (_ BitVec 32))) (Undefined!6939) (MissingVacant!6939 (index!30112 (_ BitVec 32))) )
))
(declare-fun lt!303119 () SeekEntryResult!6939)

(declare-fun lt!303122 () SeekEntryResult!6939)

(assert (=> b!651818 (= e!374075 (= lt!303119 lt!303122))))

(declare-fun b!651819 () Bool)

(assert (=> b!651819 (= e!374072 e!374074)))

(declare-fun res!422603 () Bool)

(assert (=> b!651819 (=> (not res!422603) (not e!374074))))

(declare-fun lt!303117 () SeekEntryResult!6939)

(assert (=> b!651819 (= res!422603 (or (= lt!303117 (MissingZero!6939 i!1108)) (= lt!303117 (MissingVacant!6939 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38592 (_ BitVec 32)) SeekEntryResult!6939)

(assert (=> b!651819 (= lt!303117 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!651820 () Bool)

(declare-fun res!422606 () Bool)

(assert (=> b!651820 (=> (not res!422606) (not e!374072))))

(assert (=> b!651820 (= res!422606 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!651821 () Bool)

(declare-fun e!374068 () Bool)

(declare-fun e!374073 () Bool)

(assert (=> b!651821 (= e!374068 e!374073)))

(declare-fun res!422605 () Bool)

(assert (=> b!651821 (=> res!422605 e!374073)))

(declare-fun lt!303118 () (_ BitVec 64))

(declare-fun lt!303124 () (_ BitVec 64))

(assert (=> b!651821 (= res!422605 (or (not (= (select (arr!18499 a!2986) j!136) lt!303118)) (not (= (select (arr!18499 a!2986) j!136) lt!303124))))))

(declare-fun e!374065 () Bool)

(assert (=> b!651821 e!374065))

(declare-fun res!422602 () Bool)

(assert (=> b!651821 (=> (not res!422602) (not e!374065))))

(assert (=> b!651821 (= res!422602 (= lt!303124 (select (arr!18499 a!2986) j!136)))))

(assert (=> b!651821 (= lt!303124 (select (store (arr!18499 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!651822 () Bool)

(declare-fun e!374062 () Bool)

(assert (=> b!651822 (= e!374074 e!374062)))

(declare-fun res!422597 () Bool)

(assert (=> b!651822 (=> (not res!422597) (not e!374062))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!651822 (= res!422597 (= (select (store (arr!18499 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!651822 (= lt!303126 (array!38593 (store (arr!18499 a!2986) i!1108 k0!1786) (size!18863 a!2986)))))

(declare-fun b!651823 () Bool)

(declare-fun e!374076 () Bool)

(assert (=> b!651823 (= e!374073 e!374076)))

(declare-fun res!422601 () Bool)

(assert (=> b!651823 (=> res!422601 e!374076)))

(assert (=> b!651823 (= res!422601 (bvsge index!984 j!136))))

(declare-fun lt!303132 () Unit!22260)

(assert (=> b!651823 (= lt!303132 e!374067)))

(declare-fun c!74977 () Bool)

(assert (=> b!651823 (= c!74977 (bvslt j!136 index!984))))

(declare-fun b!651824 () Bool)

(declare-fun res!422604 () Bool)

(assert (=> b!651824 (=> (not res!422604) (not e!374072))))

(assert (=> b!651824 (= res!422604 (validKeyInArray!0 (select (arr!18499 a!2986) j!136)))))

(declare-fun b!651825 () Bool)

(declare-fun res!422596 () Bool)

(assert (=> b!651825 (=> (not res!422596) (not e!374074))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!651825 (= res!422596 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18499 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!422595 () Bool)

(assert (=> start!59092 (=> (not res!422595) (not e!374072))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59092 (= res!422595 (validMask!0 mask!3053))))

(assert (=> start!59092 e!374072))

(assert (=> start!59092 true))

(declare-fun array_inv!14295 (array!38592) Bool)

(assert (=> start!59092 (array_inv!14295 a!2986)))

(declare-fun b!651814 () Bool)

(declare-fun e!374070 () Bool)

(assert (=> b!651814 (= e!374062 e!374070)))

(declare-fun res!422609 () Bool)

(assert (=> b!651814 (=> (not res!422609) (not e!374070))))

(assert (=> b!651814 (= res!422609 (and (= lt!303119 (Found!6939 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18499 a!2986) index!984) (select (arr!18499 a!2986) j!136))) (not (= (select (arr!18499 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38592 (_ BitVec 32)) SeekEntryResult!6939)

(assert (=> b!651814 (= lt!303119 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18499 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!651826 () Bool)

(assert (=> b!651826 (= e!374063 (arrayContainsKey!0 lt!303126 (select (arr!18499 a!2986) j!136) index!984))))

(declare-fun b!651827 () Bool)

(declare-fun res!422593 () Bool)

(assert (=> b!651827 (=> (not res!422593) (not e!374074))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38592 (_ BitVec 32)) Bool)

(assert (=> b!651827 (= res!422593 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!651828 () Bool)

(assert (=> b!651828 (= e!374070 (not e!374068))))

(declare-fun res!422600 () Bool)

(assert (=> b!651828 (=> res!422600 e!374068)))

(declare-fun lt!303120 () SeekEntryResult!6939)

(assert (=> b!651828 (= res!422600 (not (= lt!303120 (Found!6939 index!984))))))

(declare-fun lt!303133 () Unit!22260)

(assert (=> b!651828 (= lt!303133 e!374064)))

(declare-fun c!74978 () Bool)

(assert (=> b!651828 (= c!74978 (= lt!303120 Undefined!6939))))

(assert (=> b!651828 (= lt!303120 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!303118 lt!303126 mask!3053))))

(assert (=> b!651828 e!374075))

(declare-fun res!422594 () Bool)

(assert (=> b!651828 (=> (not res!422594) (not e!374075))))

(declare-fun lt!303131 () (_ BitVec 32))

(assert (=> b!651828 (= res!422594 (= lt!303122 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303131 vacantSpotIndex!68 lt!303118 lt!303126 mask!3053)))))

(assert (=> b!651828 (= lt!303122 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303131 vacantSpotIndex!68 (select (arr!18499 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!651828 (= lt!303118 (select (store (arr!18499 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!303130 () Unit!22260)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38592 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22260)

(assert (=> b!651828 (= lt!303130 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!303131 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!651828 (= lt!303131 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!651829 () Bool)

(declare-fun res!422598 () Bool)

(assert (=> b!651829 (=> (not res!422598) (not e!374072))))

(assert (=> b!651829 (= res!422598 (and (= (size!18863 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18863 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18863 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!651830 () Bool)

(assert (=> b!651830 (= e!374065 e!374071)))

(declare-fun res!422591 () Bool)

(assert (=> b!651830 (=> res!422591 e!374071)))

(assert (=> b!651830 (= res!422591 (or (not (= (select (arr!18499 a!2986) j!136) lt!303118)) (not (= (select (arr!18499 a!2986) j!136) lt!303124)) (bvsge j!136 index!984)))))

(declare-fun e!374069 () Bool)

(declare-fun b!651831 () Bool)

(assert (=> b!651831 (= e!374069 (arrayContainsKey!0 lt!303126 (select (arr!18499 a!2986) j!136) index!984))))

(declare-fun b!651832 () Bool)

(declare-fun Unit!22265 () Unit!22260)

(assert (=> b!651832 (= e!374067 Unit!22265)))

(declare-fun b!651833 () Bool)

(assert (=> b!651833 (= e!374076 true)))

(assert (=> b!651833 (arrayNoDuplicates!0 lt!303126 index!984 Nil!12537)))

(declare-fun lt!303129 () Unit!22260)

(assert (=> b!651833 (= lt!303129 (lemmaNoDuplicateFromThenFromBigger!0 lt!303126 #b00000000000000000000000000000000 index!984))))

(assert (=> b!651833 (arrayNoDuplicates!0 lt!303126 #b00000000000000000000000000000000 Nil!12537)))

(declare-fun lt!303127 () Unit!22260)

(assert (=> b!651833 (= lt!303127 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12537))))

(assert (=> b!651833 (arrayContainsKey!0 lt!303126 (select (arr!18499 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!303121 () Unit!22260)

(assert (=> b!651833 (= lt!303121 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!303126 (select (arr!18499 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!651833 e!374069))

(declare-fun res!422607 () Bool)

(assert (=> b!651833 (=> (not res!422607) (not e!374069))))

(assert (=> b!651833 (= res!422607 (arrayContainsKey!0 lt!303126 (select (arr!18499 a!2986) j!136) j!136))))

(assert (= (and start!59092 res!422595) b!651829))

(assert (= (and b!651829 res!422598) b!651824))

(assert (= (and b!651824 res!422604) b!651813))

(assert (= (and b!651813 res!422592) b!651820))

(assert (= (and b!651820 res!422606) b!651819))

(assert (= (and b!651819 res!422603) b!651827))

(assert (= (and b!651827 res!422593) b!651815))

(assert (= (and b!651815 res!422599) b!651825))

(assert (= (and b!651825 res!422596) b!651822))

(assert (= (and b!651822 res!422597) b!651814))

(assert (= (and b!651814 res!422609) b!651828))

(assert (= (and b!651828 res!422594) b!651818))

(assert (= (and b!651828 c!74978) b!651816))

(assert (= (and b!651828 (not c!74978)) b!651812))

(assert (= (and b!651828 (not res!422600)) b!651821))

(assert (= (and b!651821 res!422602) b!651830))

(assert (= (and b!651830 (not res!422591)) b!651817))

(assert (= (and b!651817 res!422608) b!651826))

(assert (= (and b!651821 (not res!422605)) b!651823))

(assert (= (and b!651823 c!74977) b!651811))

(assert (= (and b!651823 (not c!74977)) b!651832))

(assert (= (and b!651823 (not res!422601)) b!651833))

(assert (= (and b!651833 res!422607) b!651831))

(declare-fun m!624961 () Bool)

(assert (=> b!651819 m!624961))

(declare-fun m!624963 () Bool)

(assert (=> b!651828 m!624963))

(declare-fun m!624965 () Bool)

(assert (=> b!651828 m!624965))

(declare-fun m!624967 () Bool)

(assert (=> b!651828 m!624967))

(declare-fun m!624969 () Bool)

(assert (=> b!651828 m!624969))

(declare-fun m!624971 () Bool)

(assert (=> b!651828 m!624971))

(declare-fun m!624973 () Bool)

(assert (=> b!651828 m!624973))

(declare-fun m!624975 () Bool)

(assert (=> b!651828 m!624975))

(assert (=> b!651828 m!624969))

(declare-fun m!624977 () Bool)

(assert (=> b!651828 m!624977))

(declare-fun m!624979 () Bool)

(assert (=> b!651825 m!624979))

(assert (=> b!651822 m!624973))

(declare-fun m!624981 () Bool)

(assert (=> b!651822 m!624981))

(declare-fun m!624983 () Bool)

(assert (=> start!59092 m!624983))

(declare-fun m!624985 () Bool)

(assert (=> start!59092 m!624985))

(assert (=> b!651824 m!624969))

(assert (=> b!651824 m!624969))

(declare-fun m!624987 () Bool)

(assert (=> b!651824 m!624987))

(declare-fun m!624989 () Bool)

(assert (=> b!651827 m!624989))

(assert (=> b!651811 m!624969))

(declare-fun m!624991 () Bool)

(assert (=> b!651811 m!624991))

(assert (=> b!651811 m!624969))

(assert (=> b!651811 m!624969))

(declare-fun m!624993 () Bool)

(assert (=> b!651811 m!624993))

(declare-fun m!624995 () Bool)

(assert (=> b!651811 m!624995))

(declare-fun m!624997 () Bool)

(assert (=> b!651811 m!624997))

(declare-fun m!624999 () Bool)

(assert (=> b!651811 m!624999))

(assert (=> b!651811 m!624969))

(declare-fun m!625001 () Bool)

(assert (=> b!651811 m!625001))

(declare-fun m!625003 () Bool)

(assert (=> b!651811 m!625003))

(assert (=> b!651817 m!624969))

(assert (=> b!651817 m!624969))

(declare-fun m!625005 () Bool)

(assert (=> b!651817 m!625005))

(declare-fun m!625007 () Bool)

(assert (=> b!651820 m!625007))

(declare-fun m!625009 () Bool)

(assert (=> b!651815 m!625009))

(assert (=> b!651831 m!624969))

(assert (=> b!651831 m!624969))

(declare-fun m!625011 () Bool)

(assert (=> b!651831 m!625011))

(assert (=> b!651826 m!624969))

(assert (=> b!651826 m!624969))

(assert (=> b!651826 m!625011))

(assert (=> b!651830 m!624969))

(declare-fun m!625013 () Bool)

(assert (=> b!651813 m!625013))

(declare-fun m!625015 () Bool)

(assert (=> b!651833 m!625015))

(assert (=> b!651833 m!624969))

(assert (=> b!651833 m!624969))

(assert (=> b!651833 m!625005))

(assert (=> b!651833 m!624969))

(declare-fun m!625017 () Bool)

(assert (=> b!651833 m!625017))

(assert (=> b!651833 m!624995))

(declare-fun m!625019 () Bool)

(assert (=> b!651833 m!625019))

(assert (=> b!651833 m!624969))

(declare-fun m!625021 () Bool)

(assert (=> b!651833 m!625021))

(assert (=> b!651833 m!625003))

(declare-fun m!625023 () Bool)

(assert (=> b!651814 m!625023))

(assert (=> b!651814 m!624969))

(assert (=> b!651814 m!624969))

(declare-fun m!625025 () Bool)

(assert (=> b!651814 m!625025))

(assert (=> b!651821 m!624969))

(assert (=> b!651821 m!624973))

(declare-fun m!625027 () Bool)

(assert (=> b!651821 m!625027))

(check-sat (not b!651828) (not b!651819) (not b!651824) (not b!651831) (not b!651817) (not b!651833) (not b!651815) (not b!651811) (not start!59092) (not b!651827) (not b!651813) (not b!651820) (not b!651826) (not b!651814))
(check-sat)
