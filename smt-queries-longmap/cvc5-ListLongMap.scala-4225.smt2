; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58118 () Bool)

(assert start!58118)

(declare-fun res!415813 () Bool)

(declare-fun e!367678 () Bool)

(assert (=> start!58118 (=> (not res!415813) (not e!367678))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58118 (= res!415813 (validMask!0 mask!3053))))

(assert (=> start!58118 e!367678))

(assert (=> start!58118 true))

(declare-datatypes ((array!38377 0))(
  ( (array!38378 (arr!18405 (Array (_ BitVec 32) (_ BitVec 64))) (size!18769 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38377)

(declare-fun array_inv!14201 (array!38377) Bool)

(assert (=> start!58118 (array_inv!14201 a!2986)))

(declare-fun b!642041 () Bool)

(declare-fun res!415800 () Bool)

(assert (=> b!642041 (=> (not res!415800) (not e!367678))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!642041 (= res!415800 (validKeyInArray!0 k!1786))))

(declare-fun b!642042 () Bool)

(declare-fun e!367679 () Bool)

(declare-datatypes ((SeekEntryResult!6845 0))(
  ( (MissingZero!6845 (index!29706 (_ BitVec 32))) (Found!6845 (index!29707 (_ BitVec 32))) (Intermediate!6845 (undefined!7657 Bool) (index!29708 (_ BitVec 32)) (x!58475 (_ BitVec 32))) (Undefined!6845) (MissingVacant!6845 (index!29709 (_ BitVec 32))) )
))
(declare-fun lt!297259 () SeekEntryResult!6845)

(declare-fun lt!297256 () SeekEntryResult!6845)

(assert (=> b!642042 (= e!367679 (= lt!297259 lt!297256))))

(declare-fun b!642043 () Bool)

(declare-fun res!415803 () Bool)

(declare-fun e!367684 () Bool)

(assert (=> b!642043 (=> res!415803 e!367684)))

(declare-datatypes ((List!12446 0))(
  ( (Nil!12443) (Cons!12442 (h!13487 (_ BitVec 64)) (t!18674 List!12446)) )
))
(declare-fun contains!3133 (List!12446 (_ BitVec 64)) Bool)

(assert (=> b!642043 (= res!415803 (contains!3133 Nil!12443 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!642044 () Bool)

(declare-fun res!415809 () Bool)

(declare-fun e!367686 () Bool)

(assert (=> b!642044 (=> (not res!415809) (not e!367686))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38377 (_ BitVec 32)) Bool)

(assert (=> b!642044 (= res!415809 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!642045 () Bool)

(assert (=> b!642045 (= e!367684 true)))

(declare-fun lt!297264 () Bool)

(assert (=> b!642045 (= lt!297264 (contains!3133 Nil!12443 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!642046 () Bool)

(declare-datatypes ((Unit!21714 0))(
  ( (Unit!21715) )
))
(declare-fun e!367677 () Unit!21714)

(declare-fun Unit!21716 () Unit!21714)

(assert (=> b!642046 (= e!367677 Unit!21716)))

(assert (=> b!642046 false))

(declare-fun b!642047 () Bool)

(declare-fun res!415799 () Bool)

(assert (=> b!642047 (=> res!415799 e!367684)))

(declare-fun noDuplicate!405 (List!12446) Bool)

(assert (=> b!642047 (= res!415799 (not (noDuplicate!405 Nil!12443)))))

(declare-fun b!642048 () Bool)

(declare-fun res!415804 () Bool)

(assert (=> b!642048 (=> (not res!415804) (not e!367678))))

(declare-fun arrayContainsKey!0 (array!38377 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!642048 (= res!415804 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!642049 () Bool)

(declare-fun res!415797 () Bool)

(assert (=> b!642049 (=> (not res!415797) (not e!367686))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!642049 (= res!415797 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18405 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!642050 () Bool)

(declare-fun e!367681 () Bool)

(declare-fun e!367680 () Bool)

(assert (=> b!642050 (= e!367681 e!367680)))

(declare-fun res!415795 () Bool)

(assert (=> b!642050 (=> (not res!415795) (not e!367680))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!297267 () array!38377)

(assert (=> b!642050 (= res!415795 (arrayContainsKey!0 lt!297267 (select (arr!18405 a!2986) j!136) j!136))))

(declare-fun b!642051 () Bool)

(declare-fun res!415806 () Bool)

(assert (=> b!642051 (=> (not res!415806) (not e!367678))))

(assert (=> b!642051 (= res!415806 (validKeyInArray!0 (select (arr!18405 a!2986) j!136)))))

(declare-fun b!642052 () Bool)

(declare-fun e!367685 () Bool)

(declare-fun e!367674 () Bool)

(assert (=> b!642052 (= e!367685 (not e!367674))))

(declare-fun res!415798 () Bool)

(assert (=> b!642052 (=> res!415798 e!367674)))

(declare-fun lt!297257 () SeekEntryResult!6845)

(assert (=> b!642052 (= res!415798 (not (= lt!297257 (Found!6845 index!984))))))

(declare-fun lt!297260 () Unit!21714)

(assert (=> b!642052 (= lt!297260 e!367677)))

(declare-fun c!73490 () Bool)

(assert (=> b!642052 (= c!73490 (= lt!297257 Undefined!6845))))

(declare-fun lt!297261 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38377 (_ BitVec 32)) SeekEntryResult!6845)

(assert (=> b!642052 (= lt!297257 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!297261 lt!297267 mask!3053))))

(assert (=> b!642052 e!367679))

(declare-fun res!415807 () Bool)

(assert (=> b!642052 (=> (not res!415807) (not e!367679))))

(declare-fun lt!297255 () (_ BitVec 32))

(assert (=> b!642052 (= res!415807 (= lt!297256 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297255 vacantSpotIndex!68 lt!297261 lt!297267 mask!3053)))))

(assert (=> b!642052 (= lt!297256 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297255 vacantSpotIndex!68 (select (arr!18405 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!642052 (= lt!297261 (select (store (arr!18405 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!297266 () Unit!21714)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38377 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21714)

(assert (=> b!642052 (= lt!297266 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!297255 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!642052 (= lt!297255 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!642053 () Bool)

(declare-fun e!367682 () Bool)

(assert (=> b!642053 (= e!367682 e!367685)))

(declare-fun res!415802 () Bool)

(assert (=> b!642053 (=> (not res!415802) (not e!367685))))

(assert (=> b!642053 (= res!415802 (and (= lt!297259 (Found!6845 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18405 a!2986) index!984) (select (arr!18405 a!2986) j!136))) (not (= (select (arr!18405 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!642053 (= lt!297259 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18405 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!642054 () Bool)

(assert (=> b!642054 (= e!367678 e!367686)))

(declare-fun res!415808 () Bool)

(assert (=> b!642054 (=> (not res!415808) (not e!367686))))

(declare-fun lt!297265 () SeekEntryResult!6845)

(assert (=> b!642054 (= res!415808 (or (= lt!297265 (MissingZero!6845 i!1108)) (= lt!297265 (MissingVacant!6845 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38377 (_ BitVec 32)) SeekEntryResult!6845)

(assert (=> b!642054 (= lt!297265 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!642055 () Bool)

(assert (=> b!642055 (= e!367686 e!367682)))

(declare-fun res!415812 () Bool)

(assert (=> b!642055 (=> (not res!415812) (not e!367682))))

(assert (=> b!642055 (= res!415812 (= (select (store (arr!18405 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!642055 (= lt!297267 (array!38378 (store (arr!18405 a!2986) i!1108 k!1786) (size!18769 a!2986)))))

(declare-fun b!642056 () Bool)

(declare-fun e!367683 () Bool)

(assert (=> b!642056 (= e!367683 e!367681)))

(declare-fun res!415801 () Bool)

(assert (=> b!642056 (=> res!415801 e!367681)))

(declare-fun lt!297258 () (_ BitVec 64))

(assert (=> b!642056 (= res!415801 (or (not (= (select (arr!18405 a!2986) j!136) lt!297261)) (not (= (select (arr!18405 a!2986) j!136) lt!297258)) (bvsge j!136 index!984)))))

(declare-fun b!642057 () Bool)

(declare-fun e!367675 () Bool)

(assert (=> b!642057 (= e!367675 e!367684)))

(declare-fun res!415811 () Bool)

(assert (=> b!642057 (=> res!415811 e!367684)))

(assert (=> b!642057 (= res!415811 (or (bvsge (size!18769 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18769 a!2986))))))

(declare-fun arrayNoDuplicates!0 (array!38377 (_ BitVec 32) List!12446) Bool)

(assert (=> b!642057 (arrayNoDuplicates!0 lt!297267 j!136 Nil!12443)))

(declare-fun lt!297262 () Unit!21714)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38377 (_ BitVec 32) (_ BitVec 32)) Unit!21714)

(assert (=> b!642057 (= lt!297262 (lemmaNoDuplicateFromThenFromBigger!0 lt!297267 #b00000000000000000000000000000000 j!136))))

(assert (=> b!642057 (arrayNoDuplicates!0 lt!297267 #b00000000000000000000000000000000 Nil!12443)))

(declare-fun lt!297268 () Unit!21714)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38377 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12446) Unit!21714)

(assert (=> b!642057 (= lt!297268 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12443))))

(assert (=> b!642057 (arrayContainsKey!0 lt!297267 (select (arr!18405 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!297263 () Unit!21714)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38377 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21714)

(assert (=> b!642057 (= lt!297263 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!297267 (select (arr!18405 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!642058 () Bool)

(assert (=> b!642058 (= e!367680 (arrayContainsKey!0 lt!297267 (select (arr!18405 a!2986) j!136) index!984))))

(declare-fun b!642059 () Bool)

(assert (=> b!642059 (= e!367674 e!367675)))

(declare-fun res!415814 () Bool)

(assert (=> b!642059 (=> res!415814 e!367675)))

(assert (=> b!642059 (= res!415814 (or (not (= (select (arr!18405 a!2986) j!136) lt!297261)) (not (= (select (arr!18405 a!2986) j!136) lt!297258)) (bvsge j!136 index!984)))))

(assert (=> b!642059 e!367683))

(declare-fun res!415805 () Bool)

(assert (=> b!642059 (=> (not res!415805) (not e!367683))))

(assert (=> b!642059 (= res!415805 (= lt!297258 (select (arr!18405 a!2986) j!136)))))

(assert (=> b!642059 (= lt!297258 (select (store (arr!18405 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!642060 () Bool)

(declare-fun res!415796 () Bool)

(assert (=> b!642060 (=> (not res!415796) (not e!367678))))

(assert (=> b!642060 (= res!415796 (and (= (size!18769 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18769 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18769 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!642061 () Bool)

(declare-fun res!415810 () Bool)

(assert (=> b!642061 (=> (not res!415810) (not e!367686))))

(assert (=> b!642061 (= res!415810 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12443))))

(declare-fun b!642062 () Bool)

(declare-fun Unit!21717 () Unit!21714)

(assert (=> b!642062 (= e!367677 Unit!21717)))

(assert (= (and start!58118 res!415813) b!642060))

(assert (= (and b!642060 res!415796) b!642051))

(assert (= (and b!642051 res!415806) b!642041))

(assert (= (and b!642041 res!415800) b!642048))

(assert (= (and b!642048 res!415804) b!642054))

(assert (= (and b!642054 res!415808) b!642044))

(assert (= (and b!642044 res!415809) b!642061))

(assert (= (and b!642061 res!415810) b!642049))

(assert (= (and b!642049 res!415797) b!642055))

(assert (= (and b!642055 res!415812) b!642053))

(assert (= (and b!642053 res!415802) b!642052))

(assert (= (and b!642052 res!415807) b!642042))

(assert (= (and b!642052 c!73490) b!642046))

(assert (= (and b!642052 (not c!73490)) b!642062))

(assert (= (and b!642052 (not res!415798)) b!642059))

(assert (= (and b!642059 res!415805) b!642056))

(assert (= (and b!642056 (not res!415801)) b!642050))

(assert (= (and b!642050 res!415795) b!642058))

(assert (= (and b!642059 (not res!415814)) b!642057))

(assert (= (and b!642057 (not res!415811)) b!642047))

(assert (= (and b!642047 (not res!415799)) b!642043))

(assert (= (and b!642043 (not res!415803)) b!642045))

(declare-fun m!615821 () Bool)

(assert (=> b!642044 m!615821))

(declare-fun m!615823 () Bool)

(assert (=> start!58118 m!615823))

(declare-fun m!615825 () Bool)

(assert (=> start!58118 m!615825))

(declare-fun m!615827 () Bool)

(assert (=> b!642058 m!615827))

(assert (=> b!642058 m!615827))

(declare-fun m!615829 () Bool)

(assert (=> b!642058 m!615829))

(declare-fun m!615831 () Bool)

(assert (=> b!642041 m!615831))

(declare-fun m!615833 () Bool)

(assert (=> b!642045 m!615833))

(assert (=> b!642050 m!615827))

(assert (=> b!642050 m!615827))

(declare-fun m!615835 () Bool)

(assert (=> b!642050 m!615835))

(declare-fun m!615837 () Bool)

(assert (=> b!642048 m!615837))

(assert (=> b!642056 m!615827))

(declare-fun m!615839 () Bool)

(assert (=> b!642043 m!615839))

(declare-fun m!615841 () Bool)

(assert (=> b!642047 m!615841))

(assert (=> b!642059 m!615827))

(declare-fun m!615843 () Bool)

(assert (=> b!642059 m!615843))

(declare-fun m!615845 () Bool)

(assert (=> b!642059 m!615845))

(assert (=> b!642051 m!615827))

(assert (=> b!642051 m!615827))

(declare-fun m!615847 () Bool)

(assert (=> b!642051 m!615847))

(declare-fun m!615849 () Bool)

(assert (=> b!642049 m!615849))

(declare-fun m!615851 () Bool)

(assert (=> b!642052 m!615851))

(declare-fun m!615853 () Bool)

(assert (=> b!642052 m!615853))

(declare-fun m!615855 () Bool)

(assert (=> b!642052 m!615855))

(assert (=> b!642052 m!615827))

(assert (=> b!642052 m!615843))

(declare-fun m!615857 () Bool)

(assert (=> b!642052 m!615857))

(declare-fun m!615859 () Bool)

(assert (=> b!642052 m!615859))

(assert (=> b!642052 m!615827))

(declare-fun m!615861 () Bool)

(assert (=> b!642052 m!615861))

(declare-fun m!615863 () Bool)

(assert (=> b!642061 m!615863))

(declare-fun m!615865 () Bool)

(assert (=> b!642053 m!615865))

(assert (=> b!642053 m!615827))

(assert (=> b!642053 m!615827))

(declare-fun m!615867 () Bool)

(assert (=> b!642053 m!615867))

(declare-fun m!615869 () Bool)

(assert (=> b!642057 m!615869))

(assert (=> b!642057 m!615827))

(assert (=> b!642057 m!615827))

(declare-fun m!615871 () Bool)

(assert (=> b!642057 m!615871))

(declare-fun m!615873 () Bool)

(assert (=> b!642057 m!615873))

(declare-fun m!615875 () Bool)

(assert (=> b!642057 m!615875))

(assert (=> b!642057 m!615827))

(declare-fun m!615877 () Bool)

(assert (=> b!642057 m!615877))

(declare-fun m!615879 () Bool)

(assert (=> b!642057 m!615879))

(assert (=> b!642055 m!615843))

(declare-fun m!615881 () Bool)

(assert (=> b!642055 m!615881))

(declare-fun m!615883 () Bool)

(assert (=> b!642054 m!615883))

(push 1)

