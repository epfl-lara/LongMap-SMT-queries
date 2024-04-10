; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65732 () Bool)

(assert start!65732)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41905 0))(
  ( (array!41906 (arr!20066 (Array (_ BitVec 32) (_ BitVec 64))) (size!20487 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41905)

(declare-fun e!420875 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!754667 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7666 0))(
  ( (MissingZero!7666 (index!33032 (_ BitVec 32))) (Found!7666 (index!33033 (_ BitVec 32))) (Intermediate!7666 (undefined!8478 Bool) (index!33034 (_ BitVec 32)) (x!63936 (_ BitVec 32))) (Undefined!7666) (MissingVacant!7666 (index!33035 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41905 (_ BitVec 32)) SeekEntryResult!7666)

(assert (=> b!754667 (= e!420875 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20066 a!3186) j!159) a!3186 mask!3328) (Found!7666 j!159)))))

(declare-fun b!754668 () Bool)

(declare-fun res!509996 () Bool)

(declare-fun e!420873 () Bool)

(assert (=> b!754668 (=> (not res!509996) (not e!420873))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41905 (_ BitVec 32)) Bool)

(assert (=> b!754668 (= res!509996 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!754669 () Bool)

(declare-datatypes ((Unit!26044 0))(
  ( (Unit!26045) )
))
(declare-fun e!420872 () Unit!26044)

(declare-fun Unit!26046 () Unit!26044)

(assert (=> b!754669 (= e!420872 Unit!26046)))

(declare-fun b!754670 () Bool)

(declare-fun res!509987 () Bool)

(declare-fun e!420874 () Bool)

(assert (=> b!754670 (=> (not res!509987) (not e!420874))))

(declare-fun lt!335863 () (_ BitVec 64))

(declare-fun lt!335866 () array!41905)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41905 (_ BitVec 32)) SeekEntryResult!7666)

(assert (=> b!754670 (= res!509987 (= (seekEntryOrOpen!0 lt!335863 lt!335866 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!335863 lt!335866 mask!3328)))))

(declare-fun b!754671 () Bool)

(declare-fun e!420871 () Bool)

(assert (=> b!754671 (= e!420873 e!420871)))

(declare-fun res!509983 () Bool)

(assert (=> b!754671 (=> (not res!509983) (not e!420871))))

(declare-fun lt!335864 () SeekEntryResult!7666)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41905 (_ BitVec 32)) SeekEntryResult!7666)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!754671 (= res!509983 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20066 a!3186) j!159) mask!3328) (select (arr!20066 a!3186) j!159) a!3186 mask!3328) lt!335864))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!754671 (= lt!335864 (Intermediate!7666 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!754672 () Bool)

(declare-fun res!509981 () Bool)

(assert (=> b!754672 (=> (not res!509981) (not e!420871))))

(assert (=> b!754672 (= res!509981 e!420875)))

(declare-fun c!82726 () Bool)

(assert (=> b!754672 (= c!82726 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!754673 () Bool)

(declare-fun e!420876 () Bool)

(declare-fun e!420881 () Bool)

(assert (=> b!754673 (= e!420876 e!420881)))

(declare-fun res!509995 () Bool)

(assert (=> b!754673 (=> res!509995 e!420881)))

(declare-fun lt!335870 () (_ BitVec 64))

(assert (=> b!754673 (= res!509995 (= lt!335870 lt!335863))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!754673 (= lt!335870 (select (store (arr!20066 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!754674 () Bool)

(assert (=> b!754674 (= e!420875 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20066 a!3186) j!159) a!3186 mask!3328) lt!335864))))

(declare-fun b!754675 () Bool)

(declare-fun res!509992 () Bool)

(declare-fun e!420880 () Bool)

(assert (=> b!754675 (=> (not res!509992) (not e!420880))))

(declare-fun arrayContainsKey!0 (array!41905 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!754675 (= res!509992 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!754676 () Bool)

(declare-fun lt!335862 () SeekEntryResult!7666)

(declare-fun lt!335868 () SeekEntryResult!7666)

(assert (=> b!754676 (= e!420874 (= lt!335862 lt!335868))))

(declare-fun b!754677 () Bool)

(assert (=> b!754677 (= e!420881 true)))

(assert (=> b!754677 e!420874))

(declare-fun res!509986 () Bool)

(assert (=> b!754677 (=> (not res!509986) (not e!420874))))

(assert (=> b!754677 (= res!509986 (= lt!335870 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!335873 () Unit!26044)

(assert (=> b!754677 (= lt!335873 e!420872)))

(declare-fun c!82725 () Bool)

(assert (=> b!754677 (= c!82725 (= lt!335870 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!754678 () Bool)

(declare-fun res!509990 () Bool)

(assert (=> b!754678 (=> (not res!509990) (not e!420880))))

(assert (=> b!754678 (= res!509990 (and (= (size!20487 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20487 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20487 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!754679 () Bool)

(declare-fun res!509988 () Bool)

(assert (=> b!754679 (=> (not res!509988) (not e!420880))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!754679 (= res!509988 (validKeyInArray!0 k!2102))))

(declare-fun b!754680 () Bool)

(declare-fun e!420878 () Bool)

(declare-fun e!420870 () Bool)

(assert (=> b!754680 (= e!420878 (not e!420870))))

(declare-fun res!509979 () Bool)

(assert (=> b!754680 (=> res!509979 e!420870)))

(declare-fun lt!335869 () SeekEntryResult!7666)

(assert (=> b!754680 (= res!509979 (or (not (is-Intermediate!7666 lt!335869)) (bvslt x!1131 (x!63936 lt!335869)) (not (= x!1131 (x!63936 lt!335869))) (not (= index!1321 (index!33034 lt!335869)))))))

(declare-fun e!420877 () Bool)

(assert (=> b!754680 e!420877))

(declare-fun res!509985 () Bool)

(assert (=> b!754680 (=> (not res!509985) (not e!420877))))

(declare-fun lt!335867 () SeekEntryResult!7666)

(assert (=> b!754680 (= res!509985 (= lt!335862 lt!335867))))

(assert (=> b!754680 (= lt!335867 (Found!7666 j!159))))

(assert (=> b!754680 (= lt!335862 (seekEntryOrOpen!0 (select (arr!20066 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!754680 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!335871 () Unit!26044)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41905 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26044)

(assert (=> b!754680 (= lt!335871 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!754681 () Bool)

(assert (=> b!754681 (= e!420877 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20066 a!3186) j!159) a!3186 mask!3328) lt!335867))))

(declare-fun res!509991 () Bool)

(assert (=> start!65732 (=> (not res!509991) (not e!420880))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65732 (= res!509991 (validMask!0 mask!3328))))

(assert (=> start!65732 e!420880))

(assert (=> start!65732 true))

(declare-fun array_inv!15862 (array!41905) Bool)

(assert (=> start!65732 (array_inv!15862 a!3186)))

(declare-fun b!754682 () Bool)

(declare-fun res!509989 () Bool)

(assert (=> b!754682 (=> (not res!509989) (not e!420871))))

(assert (=> b!754682 (= res!509989 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20066 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!754683 () Bool)

(assert (=> b!754683 (= e!420870 e!420876)))

(declare-fun res!509994 () Bool)

(assert (=> b!754683 (=> res!509994 e!420876)))

(assert (=> b!754683 (= res!509994 (not (= lt!335868 lt!335867)))))

(assert (=> b!754683 (= lt!335868 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20066 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!754684 () Bool)

(declare-fun res!509980 () Bool)

(assert (=> b!754684 (=> (not res!509980) (not e!420880))))

(assert (=> b!754684 (= res!509980 (validKeyInArray!0 (select (arr!20066 a!3186) j!159)))))

(declare-fun b!754685 () Bool)

(declare-fun res!509978 () Bool)

(assert (=> b!754685 (=> (not res!509978) (not e!420873))))

(declare-datatypes ((List!14068 0))(
  ( (Nil!14065) (Cons!14064 (h!15136 (_ BitVec 64)) (t!20383 List!14068)) )
))
(declare-fun arrayNoDuplicates!0 (array!41905 (_ BitVec 32) List!14068) Bool)

(assert (=> b!754685 (= res!509978 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14065))))

(declare-fun b!754686 () Bool)

(assert (=> b!754686 (= e!420880 e!420873)))

(declare-fun res!509982 () Bool)

(assert (=> b!754686 (=> (not res!509982) (not e!420873))))

(declare-fun lt!335865 () SeekEntryResult!7666)

(assert (=> b!754686 (= res!509982 (or (= lt!335865 (MissingZero!7666 i!1173)) (= lt!335865 (MissingVacant!7666 i!1173))))))

(assert (=> b!754686 (= lt!335865 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!754687 () Bool)

(assert (=> b!754687 (= e!420871 e!420878)))

(declare-fun res!509984 () Bool)

(assert (=> b!754687 (=> (not res!509984) (not e!420878))))

(declare-fun lt!335872 () SeekEntryResult!7666)

(assert (=> b!754687 (= res!509984 (= lt!335872 lt!335869))))

(assert (=> b!754687 (= lt!335869 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!335863 lt!335866 mask!3328))))

(assert (=> b!754687 (= lt!335872 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!335863 mask!3328) lt!335863 lt!335866 mask!3328))))

(assert (=> b!754687 (= lt!335863 (select (store (arr!20066 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!754687 (= lt!335866 (array!41906 (store (arr!20066 a!3186) i!1173 k!2102) (size!20487 a!3186)))))

(declare-fun b!754688 () Bool)

(declare-fun Unit!26047 () Unit!26044)

(assert (=> b!754688 (= e!420872 Unit!26047)))

(assert (=> b!754688 false))

(declare-fun b!754689 () Bool)

(declare-fun res!509993 () Bool)

(assert (=> b!754689 (=> (not res!509993) (not e!420873))))

(assert (=> b!754689 (= res!509993 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20487 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20487 a!3186))))))

(assert (= (and start!65732 res!509991) b!754678))

(assert (= (and b!754678 res!509990) b!754684))

(assert (= (and b!754684 res!509980) b!754679))

(assert (= (and b!754679 res!509988) b!754675))

(assert (= (and b!754675 res!509992) b!754686))

(assert (= (and b!754686 res!509982) b!754668))

(assert (= (and b!754668 res!509996) b!754685))

(assert (= (and b!754685 res!509978) b!754689))

(assert (= (and b!754689 res!509993) b!754671))

(assert (= (and b!754671 res!509983) b!754682))

(assert (= (and b!754682 res!509989) b!754672))

(assert (= (and b!754672 c!82726) b!754674))

(assert (= (and b!754672 (not c!82726)) b!754667))

(assert (= (and b!754672 res!509981) b!754687))

(assert (= (and b!754687 res!509984) b!754680))

(assert (= (and b!754680 res!509985) b!754681))

(assert (= (and b!754680 (not res!509979)) b!754683))

(assert (= (and b!754683 (not res!509994)) b!754673))

(assert (= (and b!754673 (not res!509995)) b!754677))

(assert (= (and b!754677 c!82725) b!754688))

(assert (= (and b!754677 (not c!82725)) b!754669))

(assert (= (and b!754677 res!509986) b!754670))

(assert (= (and b!754670 res!509987) b!754676))

(declare-fun m!703059 () Bool)

(assert (=> b!754680 m!703059))

(assert (=> b!754680 m!703059))

(declare-fun m!703061 () Bool)

(assert (=> b!754680 m!703061))

(declare-fun m!703063 () Bool)

(assert (=> b!754680 m!703063))

(declare-fun m!703065 () Bool)

(assert (=> b!754680 m!703065))

(declare-fun m!703067 () Bool)

(assert (=> b!754687 m!703067))

(declare-fun m!703069 () Bool)

(assert (=> b!754687 m!703069))

(declare-fun m!703071 () Bool)

(assert (=> b!754687 m!703071))

(declare-fun m!703073 () Bool)

(assert (=> b!754687 m!703073))

(assert (=> b!754687 m!703067))

(declare-fun m!703075 () Bool)

(assert (=> b!754687 m!703075))

(declare-fun m!703077 () Bool)

(assert (=> b!754685 m!703077))

(declare-fun m!703079 () Bool)

(assert (=> b!754679 m!703079))

(assert (=> b!754671 m!703059))

(assert (=> b!754671 m!703059))

(declare-fun m!703081 () Bool)

(assert (=> b!754671 m!703081))

(assert (=> b!754671 m!703081))

(assert (=> b!754671 m!703059))

(declare-fun m!703083 () Bool)

(assert (=> b!754671 m!703083))

(assert (=> b!754683 m!703059))

(assert (=> b!754683 m!703059))

(declare-fun m!703085 () Bool)

(assert (=> b!754683 m!703085))

(assert (=> b!754681 m!703059))

(assert (=> b!754681 m!703059))

(declare-fun m!703087 () Bool)

(assert (=> b!754681 m!703087))

(assert (=> b!754674 m!703059))

(assert (=> b!754674 m!703059))

(declare-fun m!703089 () Bool)

(assert (=> b!754674 m!703089))

(declare-fun m!703091 () Bool)

(assert (=> start!65732 m!703091))

(declare-fun m!703093 () Bool)

(assert (=> start!65732 m!703093))

(declare-fun m!703095 () Bool)

(assert (=> b!754670 m!703095))

(declare-fun m!703097 () Bool)

(assert (=> b!754670 m!703097))

(declare-fun m!703099 () Bool)

(assert (=> b!754668 m!703099))

(declare-fun m!703101 () Bool)

(assert (=> b!754686 m!703101))

(declare-fun m!703103 () Bool)

(assert (=> b!754682 m!703103))

(assert (=> b!754667 m!703059))

(assert (=> b!754667 m!703059))

(assert (=> b!754667 m!703085))

(declare-fun m!703105 () Bool)

(assert (=> b!754675 m!703105))

(assert (=> b!754673 m!703071))

(declare-fun m!703107 () Bool)

(assert (=> b!754673 m!703107))

(assert (=> b!754684 m!703059))

(assert (=> b!754684 m!703059))

(declare-fun m!703109 () Bool)

(assert (=> b!754684 m!703109))

(push 1)

