; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56130 () Bool)

(assert start!56130)

(declare-fun b!620498 () Bool)

(declare-fun e!355871 () Bool)

(declare-fun e!355875 () Bool)

(assert (=> b!620498 (= e!355871 e!355875)))

(declare-fun res!399900 () Bool)

(assert (=> b!620498 (=> (not res!399900) (not e!355875))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6490 0))(
  ( (MissingZero!6490 (index!28244 (_ BitVec 32))) (Found!6490 (index!28245 (_ BitVec 32))) (Intermediate!6490 (undefined!7302 Bool) (index!28246 (_ BitVec 32)) (x!57029 (_ BitVec 32))) (Undefined!6490) (MissingVacant!6490 (index!28247 (_ BitVec 32))) )
))
(declare-fun lt!286764 () SeekEntryResult!6490)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37614 0))(
  ( (array!37615 (arr!18053 (Array (_ BitVec 32) (_ BitVec 64))) (size!18418 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37614)

(assert (=> b!620498 (= res!399900 (and (= lt!286764 (Found!6490 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18053 a!2986) index!984) (select (arr!18053 a!2986) j!136))) (not (= (select (arr!18053 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37614 (_ BitVec 32)) SeekEntryResult!6490)

(assert (=> b!620498 (= lt!286764 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18053 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!620499 () Bool)

(assert (=> b!620499 (= e!355875 (not true))))

(declare-datatypes ((Unit!20646 0))(
  ( (Unit!20647) )
))
(declare-fun lt!286773 () Unit!20646)

(declare-fun e!355877 () Unit!20646)

(assert (=> b!620499 (= lt!286773 e!355877)))

(declare-fun c!70674 () Bool)

(declare-fun lt!286781 () SeekEntryResult!6490)

(assert (=> b!620499 (= c!70674 (= lt!286781 (Found!6490 index!984)))))

(declare-fun lt!286770 () Unit!20646)

(declare-fun e!355866 () Unit!20646)

(assert (=> b!620499 (= lt!286770 e!355866)))

(declare-fun c!70671 () Bool)

(assert (=> b!620499 (= c!70671 (= lt!286781 Undefined!6490))))

(declare-fun lt!286778 () array!37614)

(declare-fun lt!286777 () (_ BitVec 64))

(assert (=> b!620499 (= lt!286781 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!286777 lt!286778 mask!3053))))

(declare-fun e!355868 () Bool)

(assert (=> b!620499 e!355868))

(declare-fun res!399899 () Bool)

(assert (=> b!620499 (=> (not res!399899) (not e!355868))))

(declare-fun lt!286766 () SeekEntryResult!6490)

(declare-fun lt!286771 () (_ BitVec 32))

(assert (=> b!620499 (= res!399899 (= lt!286766 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!286771 vacantSpotIndex!68 lt!286777 lt!286778 mask!3053)))))

(assert (=> b!620499 (= lt!286766 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!286771 vacantSpotIndex!68 (select (arr!18053 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!620499 (= lt!286777 (select (store (arr!18053 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!286765 () Unit!20646)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37614 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20646)

(assert (=> b!620499 (= lt!286765 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!286771 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!620499 (= lt!286771 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!620500 () Bool)

(declare-fun res!399891 () Bool)

(declare-fun e!355865 () Bool)

(assert (=> b!620500 (=> (not res!399891) (not e!355865))))

(declare-datatypes ((List!12133 0))(
  ( (Nil!12130) (Cons!12129 (h!13174 (_ BitVec 64)) (t!18352 List!12133)) )
))
(declare-fun arrayNoDuplicates!0 (array!37614 (_ BitVec 32) List!12133) Bool)

(assert (=> b!620500 (= res!399891 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12130))))

(declare-fun b!620501 () Bool)

(declare-fun Unit!20648 () Unit!20646)

(assert (=> b!620501 (= e!355877 Unit!20648)))

(declare-fun b!620502 () Bool)

(declare-fun e!355870 () Bool)

(assert (=> b!620502 (= e!355870 e!355865)))

(declare-fun res!399893 () Bool)

(assert (=> b!620502 (=> (not res!399893) (not e!355865))))

(declare-fun lt!286767 () SeekEntryResult!6490)

(assert (=> b!620502 (= res!399893 (or (= lt!286767 (MissingZero!6490 i!1108)) (= lt!286767 (MissingVacant!6490 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37614 (_ BitVec 32)) SeekEntryResult!6490)

(assert (=> b!620502 (= lt!286767 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun e!355874 () Bool)

(declare-fun b!620503 () Bool)

(declare-fun arrayContainsKey!0 (array!37614 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!620503 (= e!355874 (arrayContainsKey!0 lt!286778 (select (arr!18053 a!2986) j!136) index!984))))

(declare-fun b!620504 () Bool)

(declare-fun res!399901 () Bool)

(assert (=> b!620504 (=> (not res!399901) (not e!355865))))

(assert (=> b!620504 (= res!399901 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18053 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!620505 () Bool)

(declare-fun res!399890 () Bool)

(assert (=> b!620505 (=> (not res!399890) (not e!355870))))

(assert (=> b!620505 (= res!399890 (and (= (size!18418 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18418 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18418 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!399896 () Bool)

(declare-fun b!620506 () Bool)

(assert (=> b!620506 (= res!399896 (arrayContainsKey!0 lt!286778 (select (arr!18053 a!2986) j!136) j!136))))

(assert (=> b!620506 (=> (not res!399896) (not e!355874))))

(declare-fun e!355869 () Bool)

(assert (=> b!620506 (= e!355869 e!355874)))

(declare-fun b!620507 () Bool)

(declare-fun res!399898 () Bool)

(assert (=> b!620507 (= res!399898 (bvsge j!136 index!984))))

(assert (=> b!620507 (=> res!399898 e!355869)))

(declare-fun e!355878 () Bool)

(assert (=> b!620507 (= e!355878 e!355869)))

(declare-fun b!620508 () Bool)

(declare-fun Unit!20649 () Unit!20646)

(assert (=> b!620508 (= e!355866 Unit!20649)))

(declare-fun b!620509 () Bool)

(declare-fun res!399904 () Bool)

(assert (=> b!620509 (=> (not res!399904) (not e!355865))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37614 (_ BitVec 32)) Bool)

(assert (=> b!620509 (= res!399904 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!620510 () Bool)

(declare-fun res!399905 () Bool)

(assert (=> b!620510 (=> (not res!399905) (not e!355870))))

(assert (=> b!620510 (= res!399905 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!620511 () Bool)

(assert (=> b!620511 false))

(declare-fun lt!286779 () Unit!20646)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37614 (_ BitVec 64) (_ BitVec 32) List!12133) Unit!20646)

(assert (=> b!620511 (= lt!286779 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!286778 (select (arr!18053 a!2986) j!136) index!984 Nil!12130))))

(assert (=> b!620511 (arrayNoDuplicates!0 lt!286778 index!984 Nil!12130)))

(declare-fun lt!286782 () Unit!20646)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37614 (_ BitVec 32) (_ BitVec 32)) Unit!20646)

(assert (=> b!620511 (= lt!286782 (lemmaNoDuplicateFromThenFromBigger!0 lt!286778 #b00000000000000000000000000000000 index!984))))

(assert (=> b!620511 (arrayNoDuplicates!0 lt!286778 #b00000000000000000000000000000000 Nil!12130)))

(declare-fun lt!286775 () Unit!20646)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37614 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12133) Unit!20646)

(assert (=> b!620511 (= lt!286775 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12130))))

(assert (=> b!620511 (arrayContainsKey!0 lt!286778 (select (arr!18053 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!286769 () Unit!20646)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37614 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20646)

(assert (=> b!620511 (= lt!286769 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!286778 (select (arr!18053 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!355873 () Bool)

(assert (=> b!620511 e!355873))

(declare-fun res!399903 () Bool)

(assert (=> b!620511 (=> (not res!399903) (not e!355873))))

(assert (=> b!620511 (= res!399903 (arrayContainsKey!0 lt!286778 (select (arr!18053 a!2986) j!136) j!136))))

(declare-fun e!355876 () Unit!20646)

(declare-fun Unit!20650 () Unit!20646)

(assert (=> b!620511 (= e!355876 Unit!20650)))

(declare-fun b!620512 () Bool)

(declare-fun res!399892 () Bool)

(assert (=> b!620512 (=> (not res!399892) (not e!355870))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!620512 (= res!399892 (validKeyInArray!0 (select (arr!18053 a!2986) j!136)))))

(declare-fun b!620513 () Bool)

(assert (=> b!620513 (= e!355873 (arrayContainsKey!0 lt!286778 (select (arr!18053 a!2986) j!136) index!984))))

(declare-fun b!620514 () Bool)

(assert (=> b!620514 (= e!355868 (= lt!286764 lt!286766))))

(declare-fun b!620515 () Bool)

(declare-fun res!399895 () Bool)

(assert (=> b!620515 (=> (not res!399895) (not e!355870))))

(assert (=> b!620515 (= res!399895 (validKeyInArray!0 k0!1786))))

(declare-fun b!620516 () Bool)

(declare-fun e!355872 () Unit!20646)

(declare-fun Unit!20651 () Unit!20646)

(assert (=> b!620516 (= e!355872 Unit!20651)))

(declare-fun b!620517 () Bool)

(assert (=> b!620517 false))

(declare-fun lt!286774 () Unit!20646)

(assert (=> b!620517 (= lt!286774 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!286778 (select (arr!18053 a!2986) j!136) j!136 Nil!12130))))

(assert (=> b!620517 (arrayNoDuplicates!0 lt!286778 j!136 Nil!12130)))

(declare-fun lt!286776 () Unit!20646)

(assert (=> b!620517 (= lt!286776 (lemmaNoDuplicateFromThenFromBigger!0 lt!286778 #b00000000000000000000000000000000 j!136))))

(assert (=> b!620517 (arrayNoDuplicates!0 lt!286778 #b00000000000000000000000000000000 Nil!12130)))

(declare-fun lt!286780 () Unit!20646)

(assert (=> b!620517 (= lt!286780 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12130))))

(assert (=> b!620517 (arrayContainsKey!0 lt!286778 (select (arr!18053 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!286783 () Unit!20646)

(assert (=> b!620517 (= lt!286783 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!286778 (select (arr!18053 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20652 () Unit!20646)

(assert (=> b!620517 (= e!355872 Unit!20652)))

(declare-fun b!620518 () Bool)

(assert (=> b!620518 (= e!355865 e!355871)))

(declare-fun res!399897 () Bool)

(assert (=> b!620518 (=> (not res!399897) (not e!355871))))

(assert (=> b!620518 (= res!399897 (= (select (store (arr!18053 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!620518 (= lt!286778 (array!37615 (store (arr!18053 a!2986) i!1108 k0!1786) (size!18418 a!2986)))))

(declare-fun b!620519 () Bool)

(declare-fun Unit!20653 () Unit!20646)

(assert (=> b!620519 (= e!355877 Unit!20653)))

(declare-fun res!399902 () Bool)

(assert (=> b!620519 (= res!399902 (= (select (store (arr!18053 a!2986) i!1108 k0!1786) index!984) (select (arr!18053 a!2986) j!136)))))

(assert (=> b!620519 (=> (not res!399902) (not e!355878))))

(assert (=> b!620519 e!355878))

(declare-fun c!70673 () Bool)

(assert (=> b!620519 (= c!70673 (bvslt j!136 index!984))))

(declare-fun lt!286768 () Unit!20646)

(assert (=> b!620519 (= lt!286768 e!355872)))

(declare-fun c!70672 () Bool)

(assert (=> b!620519 (= c!70672 (bvslt index!984 j!136))))

(declare-fun lt!286772 () Unit!20646)

(assert (=> b!620519 (= lt!286772 e!355876)))

(assert (=> b!620519 false))

(declare-fun b!620520 () Bool)

(declare-fun Unit!20654 () Unit!20646)

(assert (=> b!620520 (= e!355866 Unit!20654)))

(assert (=> b!620520 false))

(declare-fun res!399894 () Bool)

(assert (=> start!56130 (=> (not res!399894) (not e!355870))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56130 (= res!399894 (validMask!0 mask!3053))))

(assert (=> start!56130 e!355870))

(assert (=> start!56130 true))

(declare-fun array_inv!13936 (array!37614) Bool)

(assert (=> start!56130 (array_inv!13936 a!2986)))

(declare-fun b!620521 () Bool)

(declare-fun Unit!20655 () Unit!20646)

(assert (=> b!620521 (= e!355876 Unit!20655)))

(assert (= (and start!56130 res!399894) b!620505))

(assert (= (and b!620505 res!399890) b!620512))

(assert (= (and b!620512 res!399892) b!620515))

(assert (= (and b!620515 res!399895) b!620510))

(assert (= (and b!620510 res!399905) b!620502))

(assert (= (and b!620502 res!399893) b!620509))

(assert (= (and b!620509 res!399904) b!620500))

(assert (= (and b!620500 res!399891) b!620504))

(assert (= (and b!620504 res!399901) b!620518))

(assert (= (and b!620518 res!399897) b!620498))

(assert (= (and b!620498 res!399900) b!620499))

(assert (= (and b!620499 res!399899) b!620514))

(assert (= (and b!620499 c!70671) b!620520))

(assert (= (and b!620499 (not c!70671)) b!620508))

(assert (= (and b!620499 c!70674) b!620519))

(assert (= (and b!620499 (not c!70674)) b!620501))

(assert (= (and b!620519 res!399902) b!620507))

(assert (= (and b!620507 (not res!399898)) b!620506))

(assert (= (and b!620506 res!399896) b!620503))

(assert (= (and b!620519 c!70673) b!620517))

(assert (= (and b!620519 (not c!70673)) b!620516))

(assert (= (and b!620519 c!70672) b!620511))

(assert (= (and b!620519 (not c!70672)) b!620521))

(assert (= (and b!620511 res!399903) b!620513))

(declare-fun m!595909 () Bool)

(assert (=> b!620510 m!595909))

(declare-fun m!595911 () Bool)

(assert (=> b!620511 m!595911))

(declare-fun m!595913 () Bool)

(assert (=> b!620511 m!595913))

(assert (=> b!620511 m!595911))

(declare-fun m!595915 () Bool)

(assert (=> b!620511 m!595915))

(assert (=> b!620511 m!595911))

(declare-fun m!595917 () Bool)

(assert (=> b!620511 m!595917))

(declare-fun m!595919 () Bool)

(assert (=> b!620511 m!595919))

(assert (=> b!620511 m!595911))

(declare-fun m!595921 () Bool)

(assert (=> b!620511 m!595921))

(declare-fun m!595923 () Bool)

(assert (=> b!620511 m!595923))

(assert (=> b!620511 m!595911))

(declare-fun m!595925 () Bool)

(assert (=> b!620511 m!595925))

(declare-fun m!595927 () Bool)

(assert (=> b!620511 m!595927))

(declare-fun m!595929 () Bool)

(assert (=> b!620518 m!595929))

(declare-fun m!595931 () Bool)

(assert (=> b!620518 m!595931))

(declare-fun m!595933 () Bool)

(assert (=> start!56130 m!595933))

(declare-fun m!595935 () Bool)

(assert (=> start!56130 m!595935))

(declare-fun m!595937 () Bool)

(assert (=> b!620504 m!595937))

(assert (=> b!620513 m!595911))

(assert (=> b!620513 m!595911))

(declare-fun m!595939 () Bool)

(assert (=> b!620513 m!595939))

(assert (=> b!620503 m!595911))

(assert (=> b!620503 m!595911))

(assert (=> b!620503 m!595939))

(declare-fun m!595941 () Bool)

(assert (=> b!620502 m!595941))

(assert (=> b!620517 m!595911))

(declare-fun m!595943 () Bool)

(assert (=> b!620517 m!595943))

(assert (=> b!620517 m!595911))

(declare-fun m!595945 () Bool)

(assert (=> b!620517 m!595945))

(declare-fun m!595947 () Bool)

(assert (=> b!620517 m!595947))

(assert (=> b!620517 m!595927))

(assert (=> b!620517 m!595911))

(declare-fun m!595949 () Bool)

(assert (=> b!620517 m!595949))

(assert (=> b!620517 m!595911))

(declare-fun m!595951 () Bool)

(assert (=> b!620517 m!595951))

(assert (=> b!620517 m!595923))

(declare-fun m!595953 () Bool)

(assert (=> b!620499 m!595953))

(declare-fun m!595955 () Bool)

(assert (=> b!620499 m!595955))

(assert (=> b!620499 m!595911))

(assert (=> b!620499 m!595929))

(assert (=> b!620499 m!595911))

(declare-fun m!595957 () Bool)

(assert (=> b!620499 m!595957))

(declare-fun m!595959 () Bool)

(assert (=> b!620499 m!595959))

(declare-fun m!595961 () Bool)

(assert (=> b!620499 m!595961))

(declare-fun m!595963 () Bool)

(assert (=> b!620499 m!595963))

(declare-fun m!595965 () Bool)

(assert (=> b!620498 m!595965))

(assert (=> b!620498 m!595911))

(assert (=> b!620498 m!595911))

(declare-fun m!595967 () Bool)

(assert (=> b!620498 m!595967))

(assert (=> b!620512 m!595911))

(assert (=> b!620512 m!595911))

(declare-fun m!595969 () Bool)

(assert (=> b!620512 m!595969))

(assert (=> b!620506 m!595911))

(assert (=> b!620506 m!595911))

(assert (=> b!620506 m!595925))

(assert (=> b!620519 m!595929))

(declare-fun m!595971 () Bool)

(assert (=> b!620519 m!595971))

(assert (=> b!620519 m!595911))

(declare-fun m!595973 () Bool)

(assert (=> b!620509 m!595973))

(declare-fun m!595975 () Bool)

(assert (=> b!620500 m!595975))

(declare-fun m!595977 () Bool)

(assert (=> b!620515 m!595977))

(check-sat (not b!620506) (not b!620513) (not b!620499) (not b!620509) (not b!620498) (not b!620515) (not b!620500) (not b!620503) (not b!620517) (not b!620512) (not b!620511) (not start!56130) (not b!620502) (not b!620510))
(check-sat)
