; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56068 () Bool)

(assert start!56068)

(declare-fun b!617873 () Bool)

(declare-fun e!354317 () Bool)

(declare-datatypes ((SeekEntryResult!6455 0))(
  ( (MissingZero!6455 (index!28104 (_ BitVec 32))) (Found!6455 (index!28105 (_ BitVec 32))) (Intermediate!6455 (undefined!7267 Bool) (index!28106 (_ BitVec 32)) (x!56895 (_ BitVec 32))) (Undefined!6455) (MissingVacant!6455 (index!28107 (_ BitVec 32))) )
))
(declare-fun lt!284661 () SeekEntryResult!6455)

(declare-fun lt!284674 () SeekEntryResult!6455)

(assert (=> b!617873 (= e!354317 (= lt!284661 lt!284674))))

(declare-fun b!617874 () Bool)

(declare-datatypes ((Unit!20278 0))(
  ( (Unit!20279) )
))
(declare-fun e!354319 () Unit!20278)

(declare-fun Unit!20280 () Unit!20278)

(assert (=> b!617874 (= e!354319 Unit!20280)))

(declare-fun b!617875 () Bool)

(declare-fun res!398059 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!617875 (= res!398059 (bvsge j!136 index!984))))

(declare-fun e!354322 () Bool)

(assert (=> b!617875 (=> res!398059 e!354322)))

(declare-fun e!354318 () Bool)

(assert (=> b!617875 (= e!354318 e!354322)))

(declare-fun b!617876 () Bool)

(declare-fun res!398075 () Bool)

(declare-fun e!354320 () Bool)

(assert (=> b!617876 (=> (not res!398075) (not e!354320))))

(declare-datatypes ((array!37538 0))(
  ( (array!37539 (arr!18015 (Array (_ BitVec 32) (_ BitVec 64))) (size!18379 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37538)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!617876 (= res!398075 (validKeyInArray!0 (select (arr!18015 a!2986) j!136)))))

(declare-fun b!617877 () Bool)

(assert (=> b!617877 false))

(declare-fun lt!284671 () array!37538)

(declare-fun lt!284665 () Unit!20278)

(declare-datatypes ((List!12056 0))(
  ( (Nil!12053) (Cons!12052 (h!13097 (_ BitVec 64)) (t!18284 List!12056)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37538 (_ BitVec 64) (_ BitVec 32) List!12056) Unit!20278)

(assert (=> b!617877 (= lt!284665 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!284671 (select (arr!18015 a!2986) j!136) j!136 Nil!12053))))

(declare-fun arrayNoDuplicates!0 (array!37538 (_ BitVec 32) List!12056) Bool)

(assert (=> b!617877 (arrayNoDuplicates!0 lt!284671 j!136 Nil!12053)))

(declare-fun lt!284672 () Unit!20278)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37538 (_ BitVec 32) (_ BitVec 32)) Unit!20278)

(assert (=> b!617877 (= lt!284672 (lemmaNoDuplicateFromThenFromBigger!0 lt!284671 #b00000000000000000000000000000000 j!136))))

(assert (=> b!617877 (arrayNoDuplicates!0 lt!284671 #b00000000000000000000000000000000 Nil!12053)))

(declare-fun lt!284660 () Unit!20278)

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37538 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12056) Unit!20278)

(assert (=> b!617877 (= lt!284660 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12053))))

(declare-fun arrayContainsKey!0 (array!37538 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!617877 (arrayContainsKey!0 lt!284671 (select (arr!18015 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!284668 () Unit!20278)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37538 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20278)

(assert (=> b!617877 (= lt!284668 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!284671 (select (arr!18015 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20281 () Unit!20278)

(assert (=> b!617877 (= e!354319 Unit!20281)))

(declare-fun b!617878 () Bool)

(declare-fun e!354327 () Bool)

(declare-fun e!354313 () Bool)

(assert (=> b!617878 (= e!354327 e!354313)))

(declare-fun res!398072 () Bool)

(assert (=> b!617878 (=> (not res!398072) (not e!354313))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!617878 (= res!398072 (= (select (store (arr!18015 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!617878 (= lt!284671 (array!37539 (store (arr!18015 a!2986) i!1108 k!1786) (size!18379 a!2986)))))

(declare-fun b!617879 () Bool)

(declare-fun res!398065 () Bool)

(assert (=> b!617879 (=> (not res!398065) (not e!354327))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!617879 (= res!398065 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18015 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!617880 () Bool)

(assert (=> b!617880 (= e!354320 e!354327)))

(declare-fun res!398074 () Bool)

(assert (=> b!617880 (=> (not res!398074) (not e!354327))))

(declare-fun lt!284677 () SeekEntryResult!6455)

(assert (=> b!617880 (= res!398074 (or (= lt!284677 (MissingZero!6455 i!1108)) (= lt!284677 (MissingVacant!6455 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37538 (_ BitVec 32)) SeekEntryResult!6455)

(assert (=> b!617880 (= lt!284677 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!617881 () Bool)

(declare-fun e!354314 () Unit!20278)

(declare-fun Unit!20282 () Unit!20278)

(assert (=> b!617881 (= e!354314 Unit!20282)))

(assert (=> b!617881 false))

(declare-fun res!398066 () Bool)

(assert (=> start!56068 (=> (not res!398066) (not e!354320))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56068 (= res!398066 (validMask!0 mask!3053))))

(assert (=> start!56068 e!354320))

(assert (=> start!56068 true))

(declare-fun array_inv!13811 (array!37538) Bool)

(assert (=> start!56068 (array_inv!13811 a!2986)))

(declare-fun b!617882 () Bool)

(declare-fun e!354323 () Bool)

(assert (=> b!617882 (= e!354323 true)))

(assert (=> b!617882 (= (select (store (arr!18015 a!2986) i!1108 k!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!617883 () Bool)

(declare-fun res!398067 () Bool)

(assert (=> b!617883 (=> (not res!398067) (not e!354327))))

(assert (=> b!617883 (= res!398067 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12053))))

(declare-fun b!617884 () Bool)

(declare-fun Unit!20283 () Unit!20278)

(assert (=> b!617884 (= e!354314 Unit!20283)))

(declare-fun b!617885 () Bool)

(declare-fun e!354326 () Unit!20278)

(declare-fun Unit!20284 () Unit!20278)

(assert (=> b!617885 (= e!354326 Unit!20284)))

(declare-fun b!617886 () Bool)

(declare-fun e!354315 () Bool)

(assert (=> b!617886 (= e!354315 (arrayContainsKey!0 lt!284671 (select (arr!18015 a!2986) j!136) index!984))))

(declare-fun b!617887 () Bool)

(declare-fun e!354321 () Unit!20278)

(declare-fun Unit!20285 () Unit!20278)

(assert (=> b!617887 (= e!354321 Unit!20285)))

(declare-fun b!617888 () Bool)

(declare-fun res!398073 () Bool)

(assert (=> b!617888 (=> (not res!398073) (not e!354327))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37538 (_ BitVec 32)) Bool)

(assert (=> b!617888 (= res!398073 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!617889 () Bool)

(declare-fun res!398064 () Bool)

(assert (=> b!617889 (=> (not res!398064) (not e!354320))))

(assert (=> b!617889 (= res!398064 (and (= (size!18379 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18379 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18379 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!617890 () Bool)

(declare-fun e!354324 () Bool)

(assert (=> b!617890 (= e!354313 e!354324)))

(declare-fun res!398060 () Bool)

(assert (=> b!617890 (=> (not res!398060) (not e!354324))))

(assert (=> b!617890 (= res!398060 (and (= lt!284661 (Found!6455 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18015 a!2986) index!984) (select (arr!18015 a!2986) j!136))) (not (= (select (arr!18015 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37538 (_ BitVec 32)) SeekEntryResult!6455)

(assert (=> b!617890 (= lt!284661 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18015 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!617891 () Bool)

(declare-fun res!398071 () Bool)

(assert (=> b!617891 (=> (not res!398071) (not e!354320))))

(assert (=> b!617891 (= res!398071 (validKeyInArray!0 k!1786))))

(declare-fun b!617892 () Bool)

(declare-fun Unit!20286 () Unit!20278)

(assert (=> b!617892 (= e!354326 Unit!20286)))

(declare-fun res!398063 () Bool)

(assert (=> b!617892 (= res!398063 (= (select (store (arr!18015 a!2986) i!1108 k!1786) index!984) (select (arr!18015 a!2986) j!136)))))

(assert (=> b!617892 (=> (not res!398063) (not e!354318))))

(assert (=> b!617892 e!354318))

(declare-fun c!70276 () Bool)

(assert (=> b!617892 (= c!70276 (bvslt j!136 index!984))))

(declare-fun lt!284664 () Unit!20278)

(assert (=> b!617892 (= lt!284664 e!354319)))

(declare-fun c!70274 () Bool)

(assert (=> b!617892 (= c!70274 (bvslt index!984 j!136))))

(declare-fun lt!284659 () Unit!20278)

(assert (=> b!617892 (= lt!284659 e!354321)))

(assert (=> b!617892 false))

(declare-fun b!617893 () Bool)

(assert (=> b!617893 false))

(declare-fun lt!284662 () Unit!20278)

(assert (=> b!617893 (= lt!284662 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!284671 (select (arr!18015 a!2986) j!136) index!984 Nil!12053))))

(assert (=> b!617893 (arrayNoDuplicates!0 lt!284671 index!984 Nil!12053)))

(declare-fun lt!284676 () Unit!20278)

(assert (=> b!617893 (= lt!284676 (lemmaNoDuplicateFromThenFromBigger!0 lt!284671 #b00000000000000000000000000000000 index!984))))

(assert (=> b!617893 (arrayNoDuplicates!0 lt!284671 #b00000000000000000000000000000000 Nil!12053)))

(declare-fun lt!284663 () Unit!20278)

(assert (=> b!617893 (= lt!284663 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12053))))

(assert (=> b!617893 (arrayContainsKey!0 lt!284671 (select (arr!18015 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!284669 () Unit!20278)

(assert (=> b!617893 (= lt!284669 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!284671 (select (arr!18015 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!354316 () Bool)

(assert (=> b!617893 e!354316))

(declare-fun res!398068 () Bool)

(assert (=> b!617893 (=> (not res!398068) (not e!354316))))

(assert (=> b!617893 (= res!398068 (arrayContainsKey!0 lt!284671 (select (arr!18015 a!2986) j!136) j!136))))

(declare-fun Unit!20287 () Unit!20278)

(assert (=> b!617893 (= e!354321 Unit!20287)))

(declare-fun b!617894 () Bool)

(declare-fun res!398061 () Bool)

(assert (=> b!617894 (=> (not res!398061) (not e!354320))))

(assert (=> b!617894 (= res!398061 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!617895 () Bool)

(assert (=> b!617895 (= e!354324 (not e!354323))))

(declare-fun res!398069 () Bool)

(assert (=> b!617895 (=> res!398069 e!354323)))

(declare-fun lt!284667 () SeekEntryResult!6455)

(assert (=> b!617895 (= res!398069 (not (= lt!284667 (MissingVacant!6455 vacantSpotIndex!68))))))

(declare-fun lt!284670 () Unit!20278)

(assert (=> b!617895 (= lt!284670 e!354326)))

(declare-fun c!70275 () Bool)

(assert (=> b!617895 (= c!70275 (= lt!284667 (Found!6455 index!984)))))

(declare-fun lt!284658 () Unit!20278)

(assert (=> b!617895 (= lt!284658 e!354314)))

(declare-fun c!70277 () Bool)

(assert (=> b!617895 (= c!70277 (= lt!284667 Undefined!6455))))

(declare-fun lt!284675 () (_ BitVec 64))

(assert (=> b!617895 (= lt!284667 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!284675 lt!284671 mask!3053))))

(assert (=> b!617895 e!354317))

(declare-fun res!398070 () Bool)

(assert (=> b!617895 (=> (not res!398070) (not e!354317))))

(declare-fun lt!284666 () (_ BitVec 32))

(assert (=> b!617895 (= res!398070 (= lt!284674 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!284666 vacantSpotIndex!68 lt!284675 lt!284671 mask!3053)))))

(assert (=> b!617895 (= lt!284674 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!284666 vacantSpotIndex!68 (select (arr!18015 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!617895 (= lt!284675 (select (store (arr!18015 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!284673 () Unit!20278)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37538 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20278)

(assert (=> b!617895 (= lt!284673 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!284666 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!617895 (= lt!284666 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!617896 () Bool)

(assert (=> b!617896 (= e!354316 (arrayContainsKey!0 lt!284671 (select (arr!18015 a!2986) j!136) index!984))))

(declare-fun res!398062 () Bool)

(declare-fun b!617897 () Bool)

(assert (=> b!617897 (= res!398062 (arrayContainsKey!0 lt!284671 (select (arr!18015 a!2986) j!136) j!136))))

(assert (=> b!617897 (=> (not res!398062) (not e!354315))))

(assert (=> b!617897 (= e!354322 e!354315)))

(assert (= (and start!56068 res!398066) b!617889))

(assert (= (and b!617889 res!398064) b!617876))

(assert (= (and b!617876 res!398075) b!617891))

(assert (= (and b!617891 res!398071) b!617894))

(assert (= (and b!617894 res!398061) b!617880))

(assert (= (and b!617880 res!398074) b!617888))

(assert (= (and b!617888 res!398073) b!617883))

(assert (= (and b!617883 res!398067) b!617879))

(assert (= (and b!617879 res!398065) b!617878))

(assert (= (and b!617878 res!398072) b!617890))

(assert (= (and b!617890 res!398060) b!617895))

(assert (= (and b!617895 res!398070) b!617873))

(assert (= (and b!617895 c!70277) b!617881))

(assert (= (and b!617895 (not c!70277)) b!617884))

(assert (= (and b!617895 c!70275) b!617892))

(assert (= (and b!617895 (not c!70275)) b!617885))

(assert (= (and b!617892 res!398063) b!617875))

(assert (= (and b!617875 (not res!398059)) b!617897))

(assert (= (and b!617897 res!398062) b!617886))

(assert (= (and b!617892 c!70276) b!617877))

(assert (= (and b!617892 (not c!70276)) b!617874))

(assert (= (and b!617892 c!70274) b!617893))

(assert (= (and b!617892 (not c!70274)) b!617887))

(assert (= (and b!617893 res!398068) b!617896))

(assert (= (and b!617895 (not res!398069)) b!617882))

(declare-fun m!593951 () Bool)

(assert (=> b!617878 m!593951))

(declare-fun m!593953 () Bool)

(assert (=> b!617878 m!593953))

(declare-fun m!593955 () Bool)

(assert (=> b!617891 m!593955))

(declare-fun m!593957 () Bool)

(assert (=> b!617894 m!593957))

(declare-fun m!593959 () Bool)

(assert (=> b!617883 m!593959))

(declare-fun m!593961 () Bool)

(assert (=> b!617890 m!593961))

(declare-fun m!593963 () Bool)

(assert (=> b!617890 m!593963))

(assert (=> b!617890 m!593963))

(declare-fun m!593965 () Bool)

(assert (=> b!617890 m!593965))

(declare-fun m!593967 () Bool)

(assert (=> start!56068 m!593967))

(declare-fun m!593969 () Bool)

(assert (=> start!56068 m!593969))

(declare-fun m!593971 () Bool)

(assert (=> b!617879 m!593971))

(assert (=> b!617876 m!593963))

(assert (=> b!617876 m!593963))

(declare-fun m!593973 () Bool)

(assert (=> b!617876 m!593973))

(assert (=> b!617886 m!593963))

(assert (=> b!617886 m!593963))

(declare-fun m!593975 () Bool)

(assert (=> b!617886 m!593975))

(declare-fun m!593977 () Bool)

(assert (=> b!617888 m!593977))

(assert (=> b!617892 m!593951))

(declare-fun m!593979 () Bool)

(assert (=> b!617892 m!593979))

(assert (=> b!617892 m!593963))

(assert (=> b!617877 m!593963))

(declare-fun m!593981 () Bool)

(assert (=> b!617877 m!593981))

(declare-fun m!593983 () Bool)

(assert (=> b!617877 m!593983))

(assert (=> b!617877 m!593963))

(assert (=> b!617877 m!593963))

(declare-fun m!593985 () Bool)

(assert (=> b!617877 m!593985))

(declare-fun m!593987 () Bool)

(assert (=> b!617877 m!593987))

(assert (=> b!617877 m!593963))

(declare-fun m!593989 () Bool)

(assert (=> b!617877 m!593989))

(declare-fun m!593991 () Bool)

(assert (=> b!617877 m!593991))

(declare-fun m!593993 () Bool)

(assert (=> b!617877 m!593993))

(declare-fun m!593995 () Bool)

(assert (=> b!617880 m!593995))

(assert (=> b!617893 m!593963))

(declare-fun m!593997 () Bool)

(assert (=> b!617893 m!593997))

(assert (=> b!617893 m!593963))

(declare-fun m!593999 () Bool)

(assert (=> b!617893 m!593999))

(declare-fun m!594001 () Bool)

(assert (=> b!617893 m!594001))

(assert (=> b!617893 m!593963))

(declare-fun m!594003 () Bool)

(assert (=> b!617893 m!594003))

(assert (=> b!617893 m!593993))

(assert (=> b!617893 m!593963))

(declare-fun m!594005 () Bool)

(assert (=> b!617893 m!594005))

(assert (=> b!617893 m!593963))

(assert (=> b!617893 m!593991))

(declare-fun m!594007 () Bool)

(assert (=> b!617893 m!594007))

(assert (=> b!617882 m!593951))

(assert (=> b!617882 m!593979))

(declare-fun m!594009 () Bool)

(assert (=> b!617895 m!594009))

(declare-fun m!594011 () Bool)

(assert (=> b!617895 m!594011))

(declare-fun m!594013 () Bool)

(assert (=> b!617895 m!594013))

(assert (=> b!617895 m!593963))

(assert (=> b!617895 m!593951))

(declare-fun m!594015 () Bool)

(assert (=> b!617895 m!594015))

(assert (=> b!617895 m!593963))

(declare-fun m!594017 () Bool)

(assert (=> b!617895 m!594017))

(declare-fun m!594019 () Bool)

(assert (=> b!617895 m!594019))

(assert (=> b!617897 m!593963))

(assert (=> b!617897 m!593963))

(assert (=> b!617897 m!593999))

(assert (=> b!617896 m!593963))

(assert (=> b!617896 m!593963))

(assert (=> b!617896 m!593975))

(push 1)

