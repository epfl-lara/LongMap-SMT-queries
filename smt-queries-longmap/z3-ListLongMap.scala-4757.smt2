; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65730 () Bool)

(assert start!65730)

(declare-fun b!750988 () Bool)

(declare-datatypes ((Unit!25765 0))(
  ( (Unit!25766) )
))
(declare-fun e!419075 () Unit!25765)

(declare-fun Unit!25767 () Unit!25765)

(assert (=> b!750988 (= e!419075 Unit!25767)))

(declare-fun b!750989 () Bool)

(declare-fun e!419072 () Bool)

(declare-fun e!419078 () Bool)

(assert (=> b!750989 (= e!419072 e!419078)))

(declare-fun res!506654 () Bool)

(assert (=> b!750989 (=> (not res!506654) (not e!419078))))

(declare-datatypes ((SeekEntryResult!7552 0))(
  ( (MissingZero!7552 (index!32576 (_ BitVec 32))) (Found!7552 (index!32577 (_ BitVec 32))) (Intermediate!7552 (undefined!8364 Bool) (index!32578 (_ BitVec 32)) (x!63666 (_ BitVec 32))) (Undefined!7552) (MissingVacant!7552 (index!32579 (_ BitVec 32))) )
))
(declare-fun lt!333898 () SeekEntryResult!7552)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!750989 (= res!506654 (or (= lt!333898 (MissingZero!7552 i!1173)) (= lt!333898 (MissingVacant!7552 i!1173))))))

(declare-datatypes ((array!41773 0))(
  ( (array!41774 (arr!19996 (Array (_ BitVec 32) (_ BitVec 64))) (size!20416 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41773)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41773 (_ BitVec 32)) SeekEntryResult!7552)

(assert (=> b!750989 (= lt!333898 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!750990 () Bool)

(declare-fun res!506653 () Bool)

(assert (=> b!750990 (=> (not res!506653) (not e!419072))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!750990 (= res!506653 (validKeyInArray!0 k0!2102))))

(declare-fun b!750991 () Bool)

(declare-fun res!506647 () Bool)

(assert (=> b!750991 (=> (not res!506647) (not e!419072))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!750991 (= res!506647 (and (= (size!20416 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20416 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20416 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!750992 () Bool)

(declare-fun res!506646 () Bool)

(assert (=> b!750992 (=> (not res!506646) (not e!419078))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!750992 (= res!506646 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20416 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20416 a!3186))))))

(declare-fun b!750993 () Bool)

(declare-fun res!506648 () Bool)

(assert (=> b!750993 (=> (not res!506648) (not e!419072))))

(assert (=> b!750993 (= res!506648 (validKeyInArray!0 (select (arr!19996 a!3186) j!159)))))

(declare-fun e!419074 () Bool)

(declare-fun b!750994 () Bool)

(declare-fun lt!333897 () SeekEntryResult!7552)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41773 (_ BitVec 32)) SeekEntryResult!7552)

(assert (=> b!750994 (= e!419074 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19996 a!3186) j!159) a!3186 mask!3328) lt!333897))))

(declare-fun b!750995 () Bool)

(declare-fun res!506645 () Bool)

(declare-fun e!419076 () Bool)

(assert (=> b!750995 (=> (not res!506645) (not e!419076))))

(assert (=> b!750995 (= res!506645 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19996 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!750996 () Bool)

(declare-fun res!506642 () Bool)

(assert (=> b!750996 (=> (not res!506642) (not e!419076))))

(declare-fun e!419071 () Bool)

(assert (=> b!750996 (= res!506642 e!419071)))

(declare-fun c!82559 () Bool)

(assert (=> b!750996 (= c!82559 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!750997 () Bool)

(declare-fun res!506644 () Bool)

(assert (=> b!750997 (=> (not res!506644) (not e!419072))))

(declare-fun arrayContainsKey!0 (array!41773 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!750997 (= res!506644 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!750998 () Bool)

(assert (=> b!750998 (= e!419071 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19996 a!3186) j!159) a!3186 mask!3328) (Found!7552 j!159)))))

(declare-fun b!751000 () Bool)

(declare-fun e!419073 () Bool)

(assert (=> b!751000 (= e!419073 (bvsge mask!3328 #b00000000000000000000000000000000))))

(declare-fun e!419077 () Bool)

(assert (=> b!751000 e!419077))

(declare-fun res!506651 () Bool)

(assert (=> b!751000 (=> (not res!506651) (not e!419077))))

(declare-fun lt!333899 () (_ BitVec 64))

(assert (=> b!751000 (= res!506651 (= lt!333899 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!333902 () Unit!25765)

(assert (=> b!751000 (= lt!333902 e!419075)))

(declare-fun c!82558 () Bool)

(assert (=> b!751000 (= c!82558 (= lt!333899 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!751001 () Bool)

(declare-fun e!419070 () Bool)

(assert (=> b!751001 (= e!419070 e!419073)))

(declare-fun res!506656 () Bool)

(assert (=> b!751001 (=> res!506656 e!419073)))

(declare-fun lt!333903 () (_ BitVec 64))

(assert (=> b!751001 (= res!506656 (= lt!333899 lt!333903))))

(assert (=> b!751001 (= lt!333899 (select (store (arr!19996 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!751002 () Bool)

(declare-fun res!506655 () Bool)

(assert (=> b!751002 (=> (not res!506655) (not e!419078))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41773 (_ BitVec 32)) Bool)

(assert (=> b!751002 (= res!506655 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!751003 () Bool)

(declare-fun res!506649 () Bool)

(assert (=> b!751003 (=> (not res!506649) (not e!419078))))

(declare-datatypes ((List!13905 0))(
  ( (Nil!13902) (Cons!13901 (h!14979 (_ BitVec 64)) (t!20212 List!13905)) )
))
(declare-fun arrayNoDuplicates!0 (array!41773 (_ BitVec 32) List!13905) Bool)

(assert (=> b!751003 (= res!506649 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13902))))

(declare-fun b!751004 () Bool)

(declare-fun Unit!25768 () Unit!25765)

(assert (=> b!751004 (= e!419075 Unit!25768)))

(assert (=> b!751004 false))

(declare-fun b!751005 () Bool)

(declare-fun res!506640 () Bool)

(assert (=> b!751005 (=> res!506640 e!419070)))

(assert (=> b!751005 (= res!506640 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19996 a!3186) j!159) a!3186 mask!3328) lt!333897)))))

(declare-fun b!751006 () Bool)

(declare-fun e!419079 () Bool)

(assert (=> b!751006 (= e!419076 e!419079)))

(declare-fun res!506643 () Bool)

(assert (=> b!751006 (=> (not res!506643) (not e!419079))))

(declare-fun lt!333905 () SeekEntryResult!7552)

(declare-fun lt!333904 () SeekEntryResult!7552)

(assert (=> b!751006 (= res!506643 (= lt!333905 lt!333904))))

(declare-fun lt!333901 () array!41773)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41773 (_ BitVec 32)) SeekEntryResult!7552)

(assert (=> b!751006 (= lt!333904 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!333903 lt!333901 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!751006 (= lt!333905 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!333903 mask!3328) lt!333903 lt!333901 mask!3328))))

(assert (=> b!751006 (= lt!333903 (select (store (arr!19996 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!751006 (= lt!333901 (array!41774 (store (arr!19996 a!3186) i!1173 k0!2102) (size!20416 a!3186)))))

(declare-fun b!751007 () Bool)

(assert (=> b!751007 (= e!419078 e!419076)))

(declare-fun res!506639 () Bool)

(assert (=> b!751007 (=> (not res!506639) (not e!419076))))

(declare-fun lt!333906 () SeekEntryResult!7552)

(assert (=> b!751007 (= res!506639 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19996 a!3186) j!159) mask!3328) (select (arr!19996 a!3186) j!159) a!3186 mask!3328) lt!333906))))

(assert (=> b!751007 (= lt!333906 (Intermediate!7552 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!751008 () Bool)

(assert (=> b!751008 (= e!419079 (not e!419070))))

(declare-fun res!506650 () Bool)

(assert (=> b!751008 (=> res!506650 e!419070)))

(get-info :version)

(assert (=> b!751008 (= res!506650 (or (not ((_ is Intermediate!7552) lt!333904)) (bvslt x!1131 (x!63666 lt!333904)) (not (= x!1131 (x!63666 lt!333904))) (not (= index!1321 (index!32578 lt!333904)))))))

(assert (=> b!751008 e!419074))

(declare-fun res!506652 () Bool)

(assert (=> b!751008 (=> (not res!506652) (not e!419074))))

(declare-fun lt!333896 () SeekEntryResult!7552)

(assert (=> b!751008 (= res!506652 (= lt!333896 lt!333897))))

(assert (=> b!751008 (= lt!333897 (Found!7552 j!159))))

(assert (=> b!751008 (= lt!333896 (seekEntryOrOpen!0 (select (arr!19996 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!751008 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!333900 () Unit!25765)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41773 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25765)

(assert (=> b!751008 (= lt!333900 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!751009 () Bool)

(assert (=> b!751009 (= e!419077 (= (seekEntryOrOpen!0 lt!333903 lt!333901 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!333903 lt!333901 mask!3328)))))

(declare-fun res!506641 () Bool)

(assert (=> start!65730 (=> (not res!506641) (not e!419072))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65730 (= res!506641 (validMask!0 mask!3328))))

(assert (=> start!65730 e!419072))

(assert (=> start!65730 true))

(declare-fun array_inv!15855 (array!41773) Bool)

(assert (=> start!65730 (array_inv!15855 a!3186)))

(declare-fun b!750999 () Bool)

(assert (=> b!750999 (= e!419071 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19996 a!3186) j!159) a!3186 mask!3328) lt!333906))))

(assert (= (and start!65730 res!506641) b!750991))

(assert (= (and b!750991 res!506647) b!750993))

(assert (= (and b!750993 res!506648) b!750990))

(assert (= (and b!750990 res!506653) b!750997))

(assert (= (and b!750997 res!506644) b!750989))

(assert (= (and b!750989 res!506654) b!751002))

(assert (= (and b!751002 res!506655) b!751003))

(assert (= (and b!751003 res!506649) b!750992))

(assert (= (and b!750992 res!506646) b!751007))

(assert (= (and b!751007 res!506639) b!750995))

(assert (= (and b!750995 res!506645) b!750996))

(assert (= (and b!750996 c!82559) b!750999))

(assert (= (and b!750996 (not c!82559)) b!750998))

(assert (= (and b!750996 res!506642) b!751006))

(assert (= (and b!751006 res!506643) b!751008))

(assert (= (and b!751008 res!506652) b!750994))

(assert (= (and b!751008 (not res!506650)) b!751005))

(assert (= (and b!751005 (not res!506640)) b!751001))

(assert (= (and b!751001 (not res!506656)) b!751000))

(assert (= (and b!751000 c!82558) b!751004))

(assert (= (and b!751000 (not c!82558)) b!750988))

(assert (= (and b!751000 res!506651) b!751009))

(declare-fun m!700839 () Bool)

(assert (=> b!750995 m!700839))

(declare-fun m!700841 () Bool)

(assert (=> b!750997 m!700841))

(declare-fun m!700843 () Bool)

(assert (=> b!751003 m!700843))

(declare-fun m!700845 () Bool)

(assert (=> b!751002 m!700845))

(declare-fun m!700847 () Bool)

(assert (=> start!65730 m!700847))

(declare-fun m!700849 () Bool)

(assert (=> start!65730 m!700849))

(declare-fun m!700851 () Bool)

(assert (=> b!750998 m!700851))

(assert (=> b!750998 m!700851))

(declare-fun m!700853 () Bool)

(assert (=> b!750998 m!700853))

(declare-fun m!700855 () Bool)

(assert (=> b!750990 m!700855))

(assert (=> b!750994 m!700851))

(assert (=> b!750994 m!700851))

(declare-fun m!700857 () Bool)

(assert (=> b!750994 m!700857))

(assert (=> b!751008 m!700851))

(assert (=> b!751008 m!700851))

(declare-fun m!700859 () Bool)

(assert (=> b!751008 m!700859))

(declare-fun m!700861 () Bool)

(assert (=> b!751008 m!700861))

(declare-fun m!700863 () Bool)

(assert (=> b!751008 m!700863))

(assert (=> b!750993 m!700851))

(assert (=> b!750993 m!700851))

(declare-fun m!700865 () Bool)

(assert (=> b!750993 m!700865))

(declare-fun m!700867 () Bool)

(assert (=> b!750989 m!700867))

(declare-fun m!700869 () Bool)

(assert (=> b!751001 m!700869))

(declare-fun m!700871 () Bool)

(assert (=> b!751001 m!700871))

(declare-fun m!700873 () Bool)

(assert (=> b!751006 m!700873))

(assert (=> b!751006 m!700873))

(declare-fun m!700875 () Bool)

(assert (=> b!751006 m!700875))

(assert (=> b!751006 m!700869))

(declare-fun m!700877 () Bool)

(assert (=> b!751006 m!700877))

(declare-fun m!700879 () Bool)

(assert (=> b!751006 m!700879))

(assert (=> b!751007 m!700851))

(assert (=> b!751007 m!700851))

(declare-fun m!700881 () Bool)

(assert (=> b!751007 m!700881))

(assert (=> b!751007 m!700881))

(assert (=> b!751007 m!700851))

(declare-fun m!700883 () Bool)

(assert (=> b!751007 m!700883))

(assert (=> b!750999 m!700851))

(assert (=> b!750999 m!700851))

(declare-fun m!700885 () Bool)

(assert (=> b!750999 m!700885))

(declare-fun m!700887 () Bool)

(assert (=> b!751009 m!700887))

(declare-fun m!700889 () Bool)

(assert (=> b!751009 m!700889))

(assert (=> b!751005 m!700851))

(assert (=> b!751005 m!700851))

(assert (=> b!751005 m!700853))

(check-sat (not start!65730) (not b!750994) (not b!750993) (not b!750998) (not b!751003) (not b!751005) (not b!751002) (not b!751006) (not b!750999) (not b!751009) (not b!750990) (not b!751008) (not b!750989) (not b!750997) (not b!751007))
(check-sat)
