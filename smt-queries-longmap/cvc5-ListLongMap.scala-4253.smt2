; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58988 () Bool)

(assert start!58988)

(declare-fun b!650773 () Bool)

(declare-fun e!373375 () Bool)

(declare-fun e!373377 () Bool)

(assert (=> b!650773 (= e!373375 e!373377)))

(declare-fun res!421898 () Bool)

(assert (=> b!650773 (=> (not res!421898) (not e!373377))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!38569 0))(
  ( (array!38570 (arr!18489 (Array (_ BitVec 32) (_ BitVec 64))) (size!18853 (_ BitVec 32))) )
))
(declare-fun lt!302446 () array!38569)

(declare-fun a!2986 () array!38569)

(declare-fun arrayContainsKey!0 (array!38569 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!650773 (= res!421898 (arrayContainsKey!0 lt!302446 (select (arr!18489 a!2986) j!136) j!136))))

(declare-fun b!650774 () Bool)

(declare-fun res!421893 () Bool)

(declare-fun e!373372 () Bool)

(assert (=> b!650774 (=> (not res!421893) (not e!373372))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!650774 (= res!421893 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!650775 () Bool)

(declare-datatypes ((Unit!22200 0))(
  ( (Unit!22201) )
))
(declare-fun e!373382 () Unit!22200)

(declare-fun Unit!22202 () Unit!22200)

(assert (=> b!650775 (= e!373382 Unit!22202)))

(declare-fun lt!302443 () Unit!22200)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38569 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22200)

(assert (=> b!650775 (= lt!302443 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!302446 (select (arr!18489 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!650775 (arrayContainsKey!0 lt!302446 (select (arr!18489 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lt!302458 () Unit!22200)

(declare-datatypes ((List!12530 0))(
  ( (Nil!12527) (Cons!12526 (h!13571 (_ BitVec 64)) (t!18758 List!12530)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38569 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12530) Unit!22200)

(assert (=> b!650775 (= lt!302458 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12527))))

(declare-fun arrayNoDuplicates!0 (array!38569 (_ BitVec 32) List!12530) Bool)

(assert (=> b!650775 (arrayNoDuplicates!0 lt!302446 #b00000000000000000000000000000000 Nil!12527)))

(declare-fun lt!302452 () Unit!22200)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38569 (_ BitVec 32) (_ BitVec 32)) Unit!22200)

(assert (=> b!650775 (= lt!302452 (lemmaNoDuplicateFromThenFromBigger!0 lt!302446 #b00000000000000000000000000000000 j!136))))

(assert (=> b!650775 (arrayNoDuplicates!0 lt!302446 j!136 Nil!12527)))

(declare-fun lt!302449 () Unit!22200)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38569 (_ BitVec 64) (_ BitVec 32) List!12530) Unit!22200)

(assert (=> b!650775 (= lt!302449 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!302446 (select (arr!18489 a!2986) j!136) j!136 Nil!12527))))

(assert (=> b!650775 false))

(declare-fun b!650776 () Bool)

(declare-fun res!421901 () Bool)

(declare-fun e!373386 () Bool)

(assert (=> b!650776 (=> (not res!421901) (not e!373386))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38569 (_ BitVec 32)) Bool)

(assert (=> b!650776 (= res!421901 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!421894 () Bool)

(assert (=> start!58988 (=> (not res!421894) (not e!373372))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58988 (= res!421894 (validMask!0 mask!3053))))

(assert (=> start!58988 e!373372))

(assert (=> start!58988 true))

(declare-fun array_inv!14285 (array!38569) Bool)

(assert (=> start!58988 (array_inv!14285 a!2986)))

(declare-fun b!650777 () Bool)

(declare-fun e!373385 () Bool)

(assert (=> b!650777 (= e!373385 (or (bvsge (size!18853 a!2986) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (size!18853 a!2986)) (bvsle index!984 (size!18853 a!2986))))))

(assert (=> b!650777 (arrayNoDuplicates!0 lt!302446 #b00000000000000000000000000000000 Nil!12527)))

(declare-fun lt!302450 () Unit!22200)

(assert (=> b!650777 (= lt!302450 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12527))))

(assert (=> b!650777 (arrayContainsKey!0 lt!302446 (select (arr!18489 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!302447 () Unit!22200)

(assert (=> b!650777 (= lt!302447 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!302446 (select (arr!18489 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!373376 () Bool)

(assert (=> b!650777 e!373376))

(declare-fun res!421891 () Bool)

(assert (=> b!650777 (=> (not res!421891) (not e!373376))))

(assert (=> b!650777 (= res!421891 (arrayContainsKey!0 lt!302446 (select (arr!18489 a!2986) j!136) j!136))))

(declare-fun b!650778 () Bool)

(declare-fun e!373379 () Bool)

(declare-fun e!373383 () Bool)

(assert (=> b!650778 (= e!373379 e!373383)))

(declare-fun res!421899 () Bool)

(assert (=> b!650778 (=> res!421899 e!373383)))

(declare-fun lt!302448 () (_ BitVec 64))

(declare-fun lt!302442 () (_ BitVec 64))

(assert (=> b!650778 (= res!421899 (or (not (= (select (arr!18489 a!2986) j!136) lt!302448)) (not (= (select (arr!18489 a!2986) j!136) lt!302442))))))

(declare-fun e!373380 () Bool)

(assert (=> b!650778 e!373380))

(declare-fun res!421889 () Bool)

(assert (=> b!650778 (=> (not res!421889) (not e!373380))))

(assert (=> b!650778 (= res!421889 (= lt!302442 (select (arr!18489 a!2986) j!136)))))

(assert (=> b!650778 (= lt!302442 (select (store (arr!18489 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!650779 () Bool)

(declare-fun Unit!22203 () Unit!22200)

(assert (=> b!650779 (= e!373382 Unit!22203)))

(declare-fun b!650780 () Bool)

(assert (=> b!650780 (= e!373377 (arrayContainsKey!0 lt!302446 (select (arr!18489 a!2986) j!136) index!984))))

(declare-fun b!650781 () Bool)

(assert (=> b!650781 (= e!373383 e!373385)))

(declare-fun res!421904 () Bool)

(assert (=> b!650781 (=> res!421904 e!373385)))

(assert (=> b!650781 (= res!421904 (bvsge index!984 j!136))))

(declare-fun lt!302455 () Unit!22200)

(assert (=> b!650781 (= lt!302455 e!373382)))

(declare-fun c!74810 () Bool)

(assert (=> b!650781 (= c!74810 (bvslt j!136 index!984))))

(declare-fun b!650782 () Bool)

(assert (=> b!650782 (= e!373376 (arrayContainsKey!0 lt!302446 (select (arr!18489 a!2986) j!136) index!984))))

(declare-fun b!650783 () Bool)

(declare-fun res!421892 () Bool)

(assert (=> b!650783 (=> (not res!421892) (not e!373372))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!650783 (= res!421892 (validKeyInArray!0 (select (arr!18489 a!2986) j!136)))))

(declare-fun b!650784 () Bool)

(declare-fun res!421906 () Bool)

(assert (=> b!650784 (=> (not res!421906) (not e!373386))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!650784 (= res!421906 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18489 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!650785 () Bool)

(declare-fun e!373381 () Bool)

(assert (=> b!650785 (= e!373381 (not e!373379))))

(declare-fun res!421895 () Bool)

(assert (=> b!650785 (=> res!421895 e!373379)))

(declare-datatypes ((SeekEntryResult!6929 0))(
  ( (MissingZero!6929 (index!30066 (_ BitVec 32))) (Found!6929 (index!30067 (_ BitVec 32))) (Intermediate!6929 (undefined!7741 Bool) (index!30068 (_ BitVec 32)) (x!58855 (_ BitVec 32))) (Undefined!6929) (MissingVacant!6929 (index!30069 (_ BitVec 32))) )
))
(declare-fun lt!302453 () SeekEntryResult!6929)

(assert (=> b!650785 (= res!421895 (not (= lt!302453 (Found!6929 index!984))))))

(declare-fun lt!302444 () Unit!22200)

(declare-fun e!373378 () Unit!22200)

(assert (=> b!650785 (= lt!302444 e!373378)))

(declare-fun c!74809 () Bool)

(assert (=> b!650785 (= c!74809 (= lt!302453 Undefined!6929))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38569 (_ BitVec 32)) SeekEntryResult!6929)

(assert (=> b!650785 (= lt!302453 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!302448 lt!302446 mask!3053))))

(declare-fun e!373373 () Bool)

(assert (=> b!650785 e!373373))

(declare-fun res!421890 () Bool)

(assert (=> b!650785 (=> (not res!421890) (not e!373373))))

(declare-fun lt!302457 () SeekEntryResult!6929)

(declare-fun lt!302445 () (_ BitVec 32))

(assert (=> b!650785 (= res!421890 (= lt!302457 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302445 vacantSpotIndex!68 lt!302448 lt!302446 mask!3053)))))

(assert (=> b!650785 (= lt!302457 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302445 vacantSpotIndex!68 (select (arr!18489 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!650785 (= lt!302448 (select (store (arr!18489 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!302456 () Unit!22200)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38569 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22200)

(assert (=> b!650785 (= lt!302456 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!302445 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!650785 (= lt!302445 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!650786 () Bool)

(declare-fun res!421903 () Bool)

(assert (=> b!650786 (=> (not res!421903) (not e!373372))))

(assert (=> b!650786 (= res!421903 (and (= (size!18853 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18853 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18853 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!650787 () Bool)

(assert (=> b!650787 (= e!373372 e!373386)))

(declare-fun res!421896 () Bool)

(assert (=> b!650787 (=> (not res!421896) (not e!373386))))

(declare-fun lt!302454 () SeekEntryResult!6929)

(assert (=> b!650787 (= res!421896 (or (= lt!302454 (MissingZero!6929 i!1108)) (= lt!302454 (MissingVacant!6929 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38569 (_ BitVec 32)) SeekEntryResult!6929)

(assert (=> b!650787 (= lt!302454 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!650788 () Bool)

(declare-fun Unit!22204 () Unit!22200)

(assert (=> b!650788 (= e!373378 Unit!22204)))

(declare-fun b!650789 () Bool)

(declare-fun e!373384 () Bool)

(assert (=> b!650789 (= e!373386 e!373384)))

(declare-fun res!421902 () Bool)

(assert (=> b!650789 (=> (not res!421902) (not e!373384))))

(assert (=> b!650789 (= res!421902 (= (select (store (arr!18489 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!650789 (= lt!302446 (array!38570 (store (arr!18489 a!2986) i!1108 k!1786) (size!18853 a!2986)))))

(declare-fun b!650790 () Bool)

(assert (=> b!650790 (= e!373380 e!373375)))

(declare-fun res!421897 () Bool)

(assert (=> b!650790 (=> res!421897 e!373375)))

(assert (=> b!650790 (= res!421897 (or (not (= (select (arr!18489 a!2986) j!136) lt!302448)) (not (= (select (arr!18489 a!2986) j!136) lt!302442)) (bvsge j!136 index!984)))))

(declare-fun b!650791 () Bool)

(assert (=> b!650791 (= e!373384 e!373381)))

(declare-fun res!421900 () Bool)

(assert (=> b!650791 (=> (not res!421900) (not e!373381))))

(declare-fun lt!302451 () SeekEntryResult!6929)

(assert (=> b!650791 (= res!421900 (and (= lt!302451 (Found!6929 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18489 a!2986) index!984) (select (arr!18489 a!2986) j!136))) (not (= (select (arr!18489 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!650791 (= lt!302451 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18489 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!650792 () Bool)

(declare-fun Unit!22205 () Unit!22200)

(assert (=> b!650792 (= e!373378 Unit!22205)))

(assert (=> b!650792 false))

(declare-fun b!650793 () Bool)

(assert (=> b!650793 (= e!373373 (= lt!302451 lt!302457))))

(declare-fun b!650794 () Bool)

(declare-fun res!421905 () Bool)

(assert (=> b!650794 (=> (not res!421905) (not e!373372))))

(assert (=> b!650794 (= res!421905 (validKeyInArray!0 k!1786))))

(declare-fun b!650795 () Bool)

(declare-fun res!421907 () Bool)

(assert (=> b!650795 (=> (not res!421907) (not e!373386))))

(assert (=> b!650795 (= res!421907 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12527))))

(assert (= (and start!58988 res!421894) b!650786))

(assert (= (and b!650786 res!421903) b!650783))

(assert (= (and b!650783 res!421892) b!650794))

(assert (= (and b!650794 res!421905) b!650774))

(assert (= (and b!650774 res!421893) b!650787))

(assert (= (and b!650787 res!421896) b!650776))

(assert (= (and b!650776 res!421901) b!650795))

(assert (= (and b!650795 res!421907) b!650784))

(assert (= (and b!650784 res!421906) b!650789))

(assert (= (and b!650789 res!421902) b!650791))

(assert (= (and b!650791 res!421900) b!650785))

(assert (= (and b!650785 res!421890) b!650793))

(assert (= (and b!650785 c!74809) b!650792))

(assert (= (and b!650785 (not c!74809)) b!650788))

(assert (= (and b!650785 (not res!421895)) b!650778))

(assert (= (and b!650778 res!421889) b!650790))

(assert (= (and b!650790 (not res!421897)) b!650773))

(assert (= (and b!650773 res!421898) b!650780))

(assert (= (and b!650778 (not res!421899)) b!650781))

(assert (= (and b!650781 c!74810) b!650775))

(assert (= (and b!650781 (not c!74810)) b!650779))

(assert (= (and b!650781 (not res!421904)) b!650777))

(assert (= (and b!650777 res!421891) b!650782))

(declare-fun m!623951 () Bool)

(assert (=> b!650774 m!623951))

(declare-fun m!623953 () Bool)

(assert (=> b!650787 m!623953))

(declare-fun m!623955 () Bool)

(assert (=> b!650784 m!623955))

(declare-fun m!623957 () Bool)

(assert (=> b!650795 m!623957))

(declare-fun m!623959 () Bool)

(assert (=> b!650782 m!623959))

(assert (=> b!650782 m!623959))

(declare-fun m!623961 () Bool)

(assert (=> b!650782 m!623961))

(assert (=> b!650785 m!623959))

(declare-fun m!623963 () Bool)

(assert (=> b!650785 m!623963))

(declare-fun m!623965 () Bool)

(assert (=> b!650785 m!623965))

(declare-fun m!623967 () Bool)

(assert (=> b!650785 m!623967))

(declare-fun m!623969 () Bool)

(assert (=> b!650785 m!623969))

(declare-fun m!623971 () Bool)

(assert (=> b!650785 m!623971))

(assert (=> b!650785 m!623959))

(declare-fun m!623973 () Bool)

(assert (=> b!650785 m!623973))

(declare-fun m!623975 () Bool)

(assert (=> b!650785 m!623975))

(assert (=> b!650790 m!623959))

(assert (=> b!650778 m!623959))

(assert (=> b!650778 m!623973))

(declare-fun m!623977 () Bool)

(assert (=> b!650778 m!623977))

(declare-fun m!623979 () Bool)

(assert (=> b!650776 m!623979))

(declare-fun m!623981 () Bool)

(assert (=> start!58988 m!623981))

(declare-fun m!623983 () Bool)

(assert (=> start!58988 m!623983))

(assert (=> b!650780 m!623959))

(assert (=> b!650780 m!623959))

(assert (=> b!650780 m!623961))

(declare-fun m!623985 () Bool)

(assert (=> b!650794 m!623985))

(assert (=> b!650773 m!623959))

(assert (=> b!650773 m!623959))

(declare-fun m!623987 () Bool)

(assert (=> b!650773 m!623987))

(assert (=> b!650789 m!623973))

(declare-fun m!623989 () Bool)

(assert (=> b!650789 m!623989))

(assert (=> b!650777 m!623959))

(assert (=> b!650777 m!623959))

(declare-fun m!623991 () Bool)

(assert (=> b!650777 m!623991))

(declare-fun m!623993 () Bool)

(assert (=> b!650777 m!623993))

(assert (=> b!650777 m!623959))

(declare-fun m!623995 () Bool)

(assert (=> b!650777 m!623995))

(assert (=> b!650777 m!623959))

(assert (=> b!650777 m!623987))

(declare-fun m!623997 () Bool)

(assert (=> b!650777 m!623997))

(declare-fun m!623999 () Bool)

(assert (=> b!650791 m!623999))

(assert (=> b!650791 m!623959))

(assert (=> b!650791 m!623959))

(declare-fun m!624001 () Bool)

(assert (=> b!650791 m!624001))

(assert (=> b!650783 m!623959))

(assert (=> b!650783 m!623959))

(declare-fun m!624003 () Bool)

(assert (=> b!650783 m!624003))

(assert (=> b!650775 m!623959))

(assert (=> b!650775 m!623959))

(declare-fun m!624005 () Bool)

(assert (=> b!650775 m!624005))

(declare-fun m!624007 () Bool)

(assert (=> b!650775 m!624007))

(assert (=> b!650775 m!623993))

(declare-fun m!624009 () Bool)

(assert (=> b!650775 m!624009))

(assert (=> b!650775 m!623997))

(assert (=> b!650775 m!623959))

(declare-fun m!624011 () Bool)

(assert (=> b!650775 m!624011))

(assert (=> b!650775 m!623959))

(declare-fun m!624013 () Bool)

(assert (=> b!650775 m!624013))

(push 1)

(assert (not b!650795))

(assert (not b!650774))

(assert (not b!650794))

(assert (not b!650776))

(assert (not b!650773))

(assert (not b!650782))

(assert (not b!650785))

(assert (not b!650775))

(assert (not b!650777))

(assert (not b!650791))

(assert (not b!650783))

(assert (not start!58988))

(assert (not b!650780))

(assert (not b!650787))

(check-sat)

(pop 1)

(push 1)

(check-sat)

