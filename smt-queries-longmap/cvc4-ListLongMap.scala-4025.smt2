; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54860 () Bool)

(assert start!54860)

(declare-fun b!599657 () Bool)

(declare-fun res!384623 () Bool)

(declare-fun e!342837 () Bool)

(assert (=> b!599657 (=> res!384623 e!342837)))

(declare-datatypes ((List!11848 0))(
  ( (Nil!11845) (Cons!11844 (h!12889 (_ BitVec 64)) (t!18076 List!11848)) )
))
(declare-fun contains!2964 (List!11848 (_ BitVec 64)) Bool)

(assert (=> b!599657 (= res!384623 (contains!2964 Nil!11845 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!599658 () Bool)

(declare-fun e!342841 () Bool)

(declare-fun e!342843 () Bool)

(assert (=> b!599658 (= e!342841 e!342843)))

(declare-fun res!384615 () Bool)

(assert (=> b!599658 (=> (not res!384615) (not e!342843))))

(declare-datatypes ((SeekEntryResult!6247 0))(
  ( (MissingZero!6247 (index!27245 (_ BitVec 32))) (Found!6247 (index!27246 (_ BitVec 32))) (Intermediate!6247 (undefined!7059 Bool) (index!27247 (_ BitVec 32)) (x!56046 (_ BitVec 32))) (Undefined!6247) (MissingVacant!6247 (index!27248 (_ BitVec 32))) )
))
(declare-fun lt!272647 () SeekEntryResult!6247)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!599658 (= res!384615 (or (= lt!272647 (MissingZero!6247 i!1108)) (= lt!272647 (MissingVacant!6247 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!37095 0))(
  ( (array!37096 (arr!17807 (Array (_ BitVec 32) (_ BitVec 64))) (size!18171 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37095)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37095 (_ BitVec 32)) SeekEntryResult!6247)

(assert (=> b!599658 (= lt!272647 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!599659 () Bool)

(declare-fun e!342833 () Bool)

(declare-fun e!342835 () Bool)

(assert (=> b!599659 (= e!342833 (not e!342835))))

(declare-fun res!384624 () Bool)

(assert (=> b!599659 (=> res!384624 e!342835)))

(declare-fun lt!272637 () SeekEntryResult!6247)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!599659 (= res!384624 (not (= lt!272637 (Found!6247 index!984))))))

(declare-datatypes ((Unit!18906 0))(
  ( (Unit!18907) )
))
(declare-fun lt!272634 () Unit!18906)

(declare-fun e!342836 () Unit!18906)

(assert (=> b!599659 (= lt!272634 e!342836)))

(declare-fun c!67889 () Bool)

(assert (=> b!599659 (= c!67889 (= lt!272637 Undefined!6247))))

(declare-fun lt!272643 () array!37095)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!272640 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37095 (_ BitVec 32)) SeekEntryResult!6247)

(assert (=> b!599659 (= lt!272637 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!272640 lt!272643 mask!3053))))

(declare-fun e!342834 () Bool)

(assert (=> b!599659 e!342834))

(declare-fun res!384619 () Bool)

(assert (=> b!599659 (=> (not res!384619) (not e!342834))))

(declare-fun lt!272641 () (_ BitVec 32))

(declare-fun lt!272644 () SeekEntryResult!6247)

(assert (=> b!599659 (= res!384619 (= lt!272644 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272641 vacantSpotIndex!68 lt!272640 lt!272643 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!599659 (= lt!272644 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272641 vacantSpotIndex!68 (select (arr!17807 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!599659 (= lt!272640 (select (store (arr!17807 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!272646 () Unit!18906)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37095 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18906)

(assert (=> b!599659 (= lt!272646 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!272641 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!599659 (= lt!272641 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!599660 () Bool)

(declare-fun e!342832 () Bool)

(declare-fun e!342838 () Bool)

(assert (=> b!599660 (= e!342832 e!342838)))

(declare-fun res!384614 () Bool)

(assert (=> b!599660 (=> (not res!384614) (not e!342838))))

(declare-fun arrayContainsKey!0 (array!37095 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!599660 (= res!384614 (arrayContainsKey!0 lt!272643 (select (arr!17807 a!2986) j!136) j!136))))

(declare-fun b!599661 () Bool)

(assert (=> b!599661 (= e!342838 (arrayContainsKey!0 lt!272643 (select (arr!17807 a!2986) j!136) index!984))))

(declare-fun b!599663 () Bool)

(declare-fun res!384613 () Bool)

(assert (=> b!599663 (=> (not res!384613) (not e!342841))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!599663 (= res!384613 (validKeyInArray!0 (select (arr!17807 a!2986) j!136)))))

(declare-fun b!599664 () Bool)

(assert (=> b!599664 (= e!342837 true)))

(declare-fun lt!272639 () Bool)

(assert (=> b!599664 (= lt!272639 (contains!2964 Nil!11845 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!599665 () Bool)

(declare-fun e!342839 () Bool)

(assert (=> b!599665 (= e!342843 e!342839)))

(declare-fun res!384616 () Bool)

(assert (=> b!599665 (=> (not res!384616) (not e!342839))))

(assert (=> b!599665 (= res!384616 (= (select (store (arr!17807 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!599665 (= lt!272643 (array!37096 (store (arr!17807 a!2986) i!1108 k!1786) (size!18171 a!2986)))))

(declare-fun b!599666 () Bool)

(declare-fun e!342840 () Bool)

(assert (=> b!599666 (= e!342840 e!342837)))

(declare-fun res!384627 () Bool)

(assert (=> b!599666 (=> res!384627 e!342837)))

(assert (=> b!599666 (= res!384627 (or (bvsge (size!18171 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18171 a!2986))))))

(declare-fun arrayNoDuplicates!0 (array!37095 (_ BitVec 32) List!11848) Bool)

(assert (=> b!599666 (arrayNoDuplicates!0 lt!272643 j!136 Nil!11845)))

(declare-fun lt!272636 () Unit!18906)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37095 (_ BitVec 32) (_ BitVec 32)) Unit!18906)

(assert (=> b!599666 (= lt!272636 (lemmaNoDuplicateFromThenFromBigger!0 lt!272643 #b00000000000000000000000000000000 j!136))))

(assert (=> b!599666 (arrayNoDuplicates!0 lt!272643 #b00000000000000000000000000000000 Nil!11845)))

(declare-fun lt!272635 () Unit!18906)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37095 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11848) Unit!18906)

(assert (=> b!599666 (= lt!272635 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11845))))

(assert (=> b!599666 (arrayContainsKey!0 lt!272643 (select (arr!17807 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!272642 () Unit!18906)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37095 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18906)

(assert (=> b!599666 (= lt!272642 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!272643 (select (arr!17807 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!599667 () Bool)

(declare-fun res!384625 () Bool)

(assert (=> b!599667 (=> (not res!384625) (not e!342841))))

(assert (=> b!599667 (= res!384625 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!599668 () Bool)

(declare-fun res!384631 () Bool)

(assert (=> b!599668 (=> (not res!384631) (not e!342843))))

(assert (=> b!599668 (= res!384631 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11845))))

(declare-fun b!599669 () Bool)

(declare-fun Unit!18908 () Unit!18906)

(assert (=> b!599669 (= e!342836 Unit!18908)))

(declare-fun b!599670 () Bool)

(declare-fun res!384622 () Bool)

(assert (=> b!599670 (=> (not res!384622) (not e!342843))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37095 (_ BitVec 32)) Bool)

(assert (=> b!599670 (= res!384622 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!599671 () Bool)

(declare-fun res!384630 () Bool)

(assert (=> b!599671 (=> (not res!384630) (not e!342841))))

(assert (=> b!599671 (= res!384630 (and (= (size!18171 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18171 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18171 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!599672 () Bool)

(assert (=> b!599672 (= e!342839 e!342833)))

(declare-fun res!384618 () Bool)

(assert (=> b!599672 (=> (not res!384618) (not e!342833))))

(declare-fun lt!272638 () SeekEntryResult!6247)

(assert (=> b!599672 (= res!384618 (and (= lt!272638 (Found!6247 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17807 a!2986) index!984) (select (arr!17807 a!2986) j!136))) (not (= (select (arr!17807 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!599672 (= lt!272638 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17807 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!599673 () Bool)

(declare-fun Unit!18909 () Unit!18906)

(assert (=> b!599673 (= e!342836 Unit!18909)))

(assert (=> b!599673 false))

(declare-fun b!599662 () Bool)

(assert (=> b!599662 (= e!342835 e!342840)))

(declare-fun res!384621 () Bool)

(assert (=> b!599662 (=> res!384621 e!342840)))

(declare-fun lt!272645 () (_ BitVec 64))

(assert (=> b!599662 (= res!384621 (or (not (= (select (arr!17807 a!2986) j!136) lt!272640)) (not (= (select (arr!17807 a!2986) j!136) lt!272645)) (bvsge j!136 index!984)))))

(declare-fun e!342831 () Bool)

(assert (=> b!599662 e!342831))

(declare-fun res!384620 () Bool)

(assert (=> b!599662 (=> (not res!384620) (not e!342831))))

(assert (=> b!599662 (= res!384620 (= lt!272645 (select (arr!17807 a!2986) j!136)))))

(assert (=> b!599662 (= lt!272645 (select (store (arr!17807 a!2986) i!1108 k!1786) index!984))))

(declare-fun res!384629 () Bool)

(assert (=> start!54860 (=> (not res!384629) (not e!342841))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54860 (= res!384629 (validMask!0 mask!3053))))

(assert (=> start!54860 e!342841))

(assert (=> start!54860 true))

(declare-fun array_inv!13603 (array!37095) Bool)

(assert (=> start!54860 (array_inv!13603 a!2986)))

(declare-fun b!599674 () Bool)

(declare-fun res!384617 () Bool)

(assert (=> b!599674 (=> (not res!384617) (not e!342841))))

(assert (=> b!599674 (= res!384617 (validKeyInArray!0 k!1786))))

(declare-fun b!599675 () Bool)

(declare-fun res!384626 () Bool)

(assert (=> b!599675 (=> res!384626 e!342837)))

(declare-fun noDuplicate!281 (List!11848) Bool)

(assert (=> b!599675 (= res!384626 (not (noDuplicate!281 Nil!11845)))))

(declare-fun b!599676 () Bool)

(declare-fun res!384628 () Bool)

(assert (=> b!599676 (=> (not res!384628) (not e!342843))))

(assert (=> b!599676 (= res!384628 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17807 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!599677 () Bool)

(assert (=> b!599677 (= e!342831 e!342832)))

(declare-fun res!384632 () Bool)

(assert (=> b!599677 (=> res!384632 e!342832)))

(assert (=> b!599677 (= res!384632 (or (not (= (select (arr!17807 a!2986) j!136) lt!272640)) (not (= (select (arr!17807 a!2986) j!136) lt!272645)) (bvsge j!136 index!984)))))

(declare-fun b!599678 () Bool)

(assert (=> b!599678 (= e!342834 (= lt!272638 lt!272644))))

(assert (= (and start!54860 res!384629) b!599671))

(assert (= (and b!599671 res!384630) b!599663))

(assert (= (and b!599663 res!384613) b!599674))

(assert (= (and b!599674 res!384617) b!599667))

(assert (= (and b!599667 res!384625) b!599658))

(assert (= (and b!599658 res!384615) b!599670))

(assert (= (and b!599670 res!384622) b!599668))

(assert (= (and b!599668 res!384631) b!599676))

(assert (= (and b!599676 res!384628) b!599665))

(assert (= (and b!599665 res!384616) b!599672))

(assert (= (and b!599672 res!384618) b!599659))

(assert (= (and b!599659 res!384619) b!599678))

(assert (= (and b!599659 c!67889) b!599673))

(assert (= (and b!599659 (not c!67889)) b!599669))

(assert (= (and b!599659 (not res!384624)) b!599662))

(assert (= (and b!599662 res!384620) b!599677))

(assert (= (and b!599677 (not res!384632)) b!599660))

(assert (= (and b!599660 res!384614) b!599661))

(assert (= (and b!599662 (not res!384621)) b!599666))

(assert (= (and b!599666 (not res!384627)) b!599675))

(assert (= (and b!599675 (not res!384626)) b!599657))

(assert (= (and b!599657 (not res!384623)) b!599664))

(declare-fun m!576901 () Bool)

(assert (=> b!599662 m!576901))

(declare-fun m!576903 () Bool)

(assert (=> b!599662 m!576903))

(declare-fun m!576905 () Bool)

(assert (=> b!599662 m!576905))

(assert (=> b!599661 m!576901))

(assert (=> b!599661 m!576901))

(declare-fun m!576907 () Bool)

(assert (=> b!599661 m!576907))

(declare-fun m!576909 () Bool)

(assert (=> b!599667 m!576909))

(assert (=> b!599677 m!576901))

(declare-fun m!576911 () Bool)

(assert (=> start!54860 m!576911))

(declare-fun m!576913 () Bool)

(assert (=> start!54860 m!576913))

(declare-fun m!576915 () Bool)

(assert (=> b!599657 m!576915))

(declare-fun m!576917 () Bool)

(assert (=> b!599658 m!576917))

(declare-fun m!576919 () Bool)

(assert (=> b!599659 m!576919))

(assert (=> b!599659 m!576901))

(assert (=> b!599659 m!576903))

(declare-fun m!576921 () Bool)

(assert (=> b!599659 m!576921))

(declare-fun m!576923 () Bool)

(assert (=> b!599659 m!576923))

(assert (=> b!599659 m!576901))

(declare-fun m!576925 () Bool)

(assert (=> b!599659 m!576925))

(declare-fun m!576927 () Bool)

(assert (=> b!599659 m!576927))

(declare-fun m!576929 () Bool)

(assert (=> b!599659 m!576929))

(assert (=> b!599665 m!576903))

(declare-fun m!576931 () Bool)

(assert (=> b!599665 m!576931))

(assert (=> b!599660 m!576901))

(assert (=> b!599660 m!576901))

(declare-fun m!576933 () Bool)

(assert (=> b!599660 m!576933))

(declare-fun m!576935 () Bool)

(assert (=> b!599664 m!576935))

(declare-fun m!576937 () Bool)

(assert (=> b!599675 m!576937))

(declare-fun m!576939 () Bool)

(assert (=> b!599672 m!576939))

(assert (=> b!599672 m!576901))

(assert (=> b!599672 m!576901))

(declare-fun m!576941 () Bool)

(assert (=> b!599672 m!576941))

(declare-fun m!576943 () Bool)

(assert (=> b!599668 m!576943))

(assert (=> b!599666 m!576901))

(assert (=> b!599666 m!576901))

(declare-fun m!576945 () Bool)

(assert (=> b!599666 m!576945))

(declare-fun m!576947 () Bool)

(assert (=> b!599666 m!576947))

(assert (=> b!599666 m!576901))

(declare-fun m!576949 () Bool)

(assert (=> b!599666 m!576949))

(declare-fun m!576951 () Bool)

(assert (=> b!599666 m!576951))

(declare-fun m!576953 () Bool)

(assert (=> b!599666 m!576953))

(declare-fun m!576955 () Bool)

(assert (=> b!599666 m!576955))

(declare-fun m!576957 () Bool)

(assert (=> b!599674 m!576957))

(declare-fun m!576959 () Bool)

(assert (=> b!599670 m!576959))

(declare-fun m!576961 () Bool)

(assert (=> b!599676 m!576961))

(assert (=> b!599663 m!576901))

(assert (=> b!599663 m!576901))

(declare-fun m!576963 () Bool)

(assert (=> b!599663 m!576963))

(push 1)

