; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66906 () Bool)

(assert start!66906)

(declare-fun b!771878 () Bool)

(declare-fun res!522077 () Bool)

(declare-fun e!429722 () Bool)

(assert (=> b!771878 (=> (not res!522077) (not e!429722))))

(declare-datatypes ((array!42399 0))(
  ( (array!42400 (arr!20298 (Array (_ BitVec 32) (_ BitVec 64))) (size!20719 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42399)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!771878 (= res!522077 (validKeyInArray!0 (select (arr!20298 a!3186) j!159)))))

(declare-fun b!771879 () Bool)

(declare-fun res!522082 () Bool)

(declare-fun e!429718 () Bool)

(assert (=> b!771879 (=> (not res!522082) (not e!429718))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42399 (_ BitVec 32)) Bool)

(assert (=> b!771879 (= res!522082 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-datatypes ((SeekEntryResult!7898 0))(
  ( (MissingZero!7898 (index!33960 (_ BitVec 32))) (Found!7898 (index!33961 (_ BitVec 32))) (Intermediate!7898 (undefined!8710 Bool) (index!33962 (_ BitVec 32)) (x!64897 (_ BitVec 32))) (Undefined!7898) (MissingVacant!7898 (index!33963 (_ BitVec 32))) )
))
(declare-fun lt!343619 () SeekEntryResult!7898)

(declare-fun b!771880 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!429723 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42399 (_ BitVec 32)) SeekEntryResult!7898)

(assert (=> b!771880 (= e!429723 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20298 a!3186) j!159) a!3186 mask!3328) lt!343619))))

(declare-fun b!771881 () Bool)

(declare-datatypes ((Unit!26606 0))(
  ( (Unit!26607) )
))
(declare-fun e!429720 () Unit!26606)

(declare-fun Unit!26608 () Unit!26606)

(assert (=> b!771881 (= e!429720 Unit!26608)))

(declare-fun lt!343621 () SeekEntryResult!7898)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!771881 (= lt!343621 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20298 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!343625 () (_ BitVec 32))

(assert (=> b!771881 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343625 resIntermediateIndex!5 (select (arr!20298 a!3186) j!159) a!3186 mask!3328) (Found!7898 j!159))))

(declare-fun b!771882 () Bool)

(declare-fun e!429725 () Bool)

(assert (=> b!771882 (= e!429725 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000)))))

(declare-fun lt!343624 () Unit!26606)

(assert (=> b!771882 (= lt!343624 e!429720)))

(declare-fun c!85302 () Bool)

(assert (=> b!771882 (= c!85302 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!771882 (= lt!343625 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!771883 () Bool)

(assert (=> b!771883 (= e!429722 e!429718)))

(declare-fun res!522080 () Bool)

(assert (=> b!771883 (=> (not res!522080) (not e!429718))))

(declare-fun lt!343620 () SeekEntryResult!7898)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!771883 (= res!522080 (or (= lt!343620 (MissingZero!7898 i!1173)) (= lt!343620 (MissingVacant!7898 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42399 (_ BitVec 32)) SeekEntryResult!7898)

(assert (=> b!771883 (= lt!343620 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!771884 () Bool)

(declare-fun e!429716 () Bool)

(assert (=> b!771884 (= e!429716 (not e!429725))))

(declare-fun res!522070 () Bool)

(assert (=> b!771884 (=> res!522070 e!429725)))

(declare-fun lt!343618 () SeekEntryResult!7898)

(assert (=> b!771884 (= res!522070 (or (not (is-Intermediate!7898 lt!343618)) (bvsge x!1131 (x!64897 lt!343618))))))

(declare-fun e!429717 () Bool)

(assert (=> b!771884 e!429717))

(declare-fun res!522076 () Bool)

(assert (=> b!771884 (=> (not res!522076) (not e!429717))))

(assert (=> b!771884 (= res!522076 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!343622 () Unit!26606)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42399 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26606)

(assert (=> b!771884 (= lt!343622 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!771885 () Bool)

(declare-fun res!522071 () Bool)

(assert (=> b!771885 (=> (not res!522071) (not e!429718))))

(assert (=> b!771885 (= res!522071 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20719 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20719 a!3186))))))

(declare-fun b!771886 () Bool)

(declare-fun res!522075 () Bool)

(assert (=> b!771886 (=> (not res!522075) (not e!429718))))

(declare-datatypes ((List!14300 0))(
  ( (Nil!14297) (Cons!14296 (h!15398 (_ BitVec 64)) (t!20615 List!14300)) )
))
(declare-fun arrayNoDuplicates!0 (array!42399 (_ BitVec 32) List!14300) Bool)

(assert (=> b!771886 (= res!522075 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14297))))

(declare-fun lt!343626 () SeekEntryResult!7898)

(declare-fun e!429724 () Bool)

(declare-fun b!771887 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42399 (_ BitVec 32)) SeekEntryResult!7898)

(assert (=> b!771887 (= e!429724 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20298 a!3186) j!159) a!3186 mask!3328) lt!343626))))

(declare-fun b!771888 () Bool)

(assert (=> b!771888 (= e!429717 e!429723)))

(declare-fun res!522079 () Bool)

(assert (=> b!771888 (=> (not res!522079) (not e!429723))))

(assert (=> b!771888 (= res!522079 (= (seekEntryOrOpen!0 (select (arr!20298 a!3186) j!159) a!3186 mask!3328) lt!343619))))

(assert (=> b!771888 (= lt!343619 (Found!7898 j!159))))

(declare-fun res!522083 () Bool)

(assert (=> start!66906 (=> (not res!522083) (not e!429722))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66906 (= res!522083 (validMask!0 mask!3328))))

(assert (=> start!66906 e!429722))

(assert (=> start!66906 true))

(declare-fun array_inv!16094 (array!42399) Bool)

(assert (=> start!66906 (array_inv!16094 a!3186)))

(declare-fun b!771889 () Bool)

(declare-fun res!522078 () Bool)

(assert (=> b!771889 (=> (not res!522078) (not e!429722))))

(assert (=> b!771889 (= res!522078 (and (= (size!20719 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20719 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20719 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!771890 () Bool)

(assert (=> b!771890 (= e!429724 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20298 a!3186) j!159) a!3186 mask!3328) (Found!7898 j!159)))))

(declare-fun b!771891 () Bool)

(declare-fun e!429721 () Bool)

(assert (=> b!771891 (= e!429718 e!429721)))

(declare-fun res!522068 () Bool)

(assert (=> b!771891 (=> (not res!522068) (not e!429721))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!771891 (= res!522068 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20298 a!3186) j!159) mask!3328) (select (arr!20298 a!3186) j!159) a!3186 mask!3328) lt!343626))))

(assert (=> b!771891 (= lt!343626 (Intermediate!7898 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!771892 () Bool)

(declare-fun res!522069 () Bool)

(assert (=> b!771892 (=> (not res!522069) (not e!429722))))

(assert (=> b!771892 (= res!522069 (validKeyInArray!0 k!2102))))

(declare-fun b!771893 () Bool)

(assert (=> b!771893 (= e!429721 e!429716)))

(declare-fun res!522072 () Bool)

(assert (=> b!771893 (=> (not res!522072) (not e!429716))))

(declare-fun lt!343628 () SeekEntryResult!7898)

(assert (=> b!771893 (= res!522072 (= lt!343628 lt!343618))))

(declare-fun lt!343623 () array!42399)

(declare-fun lt!343627 () (_ BitVec 64))

(assert (=> b!771893 (= lt!343618 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!343627 lt!343623 mask!3328))))

(assert (=> b!771893 (= lt!343628 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!343627 mask!3328) lt!343627 lt!343623 mask!3328))))

(assert (=> b!771893 (= lt!343627 (select (store (arr!20298 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!771893 (= lt!343623 (array!42400 (store (arr!20298 a!3186) i!1173 k!2102) (size!20719 a!3186)))))

(declare-fun b!771894 () Bool)

(declare-fun res!522081 () Bool)

(assert (=> b!771894 (=> (not res!522081) (not e!429721))))

(assert (=> b!771894 (= res!522081 e!429724)))

(declare-fun c!85303 () Bool)

(assert (=> b!771894 (= c!85303 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!771895 () Bool)

(declare-fun Unit!26609 () Unit!26606)

(assert (=> b!771895 (= e!429720 Unit!26609)))

(assert (=> b!771895 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343625 (select (arr!20298 a!3186) j!159) a!3186 mask!3328) lt!343626)))

(declare-fun b!771896 () Bool)

(declare-fun res!522073 () Bool)

(assert (=> b!771896 (=> (not res!522073) (not e!429721))))

(assert (=> b!771896 (= res!522073 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20298 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!771897 () Bool)

(declare-fun res!522074 () Bool)

(assert (=> b!771897 (=> (not res!522074) (not e!429722))))

(declare-fun arrayContainsKey!0 (array!42399 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!771897 (= res!522074 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!66906 res!522083) b!771889))

(assert (= (and b!771889 res!522078) b!771878))

(assert (= (and b!771878 res!522077) b!771892))

(assert (= (and b!771892 res!522069) b!771897))

(assert (= (and b!771897 res!522074) b!771883))

(assert (= (and b!771883 res!522080) b!771879))

(assert (= (and b!771879 res!522082) b!771886))

(assert (= (and b!771886 res!522075) b!771885))

(assert (= (and b!771885 res!522071) b!771891))

(assert (= (and b!771891 res!522068) b!771896))

(assert (= (and b!771896 res!522073) b!771894))

(assert (= (and b!771894 c!85303) b!771887))

(assert (= (and b!771894 (not c!85303)) b!771890))

(assert (= (and b!771894 res!522081) b!771893))

(assert (= (and b!771893 res!522072) b!771884))

(assert (= (and b!771884 res!522076) b!771888))

(assert (= (and b!771888 res!522079) b!771880))

(assert (= (and b!771884 (not res!522070)) b!771882))

(assert (= (and b!771882 c!85302) b!771895))

(assert (= (and b!771882 (not c!85302)) b!771881))

(declare-fun m!716891 () Bool)

(assert (=> b!771888 m!716891))

(assert (=> b!771888 m!716891))

(declare-fun m!716893 () Bool)

(assert (=> b!771888 m!716893))

(declare-fun m!716895 () Bool)

(assert (=> start!66906 m!716895))

(declare-fun m!716897 () Bool)

(assert (=> start!66906 m!716897))

(declare-fun m!716899 () Bool)

(assert (=> b!771883 m!716899))

(assert (=> b!771890 m!716891))

(assert (=> b!771890 m!716891))

(declare-fun m!716901 () Bool)

(assert (=> b!771890 m!716901))

(declare-fun m!716903 () Bool)

(assert (=> b!771892 m!716903))

(assert (=> b!771878 m!716891))

(assert (=> b!771878 m!716891))

(declare-fun m!716905 () Bool)

(assert (=> b!771878 m!716905))

(assert (=> b!771881 m!716891))

(assert (=> b!771881 m!716891))

(assert (=> b!771881 m!716901))

(assert (=> b!771881 m!716891))

(declare-fun m!716907 () Bool)

(assert (=> b!771881 m!716907))

(declare-fun m!716909 () Bool)

(assert (=> b!771884 m!716909))

(declare-fun m!716911 () Bool)

(assert (=> b!771884 m!716911))

(assert (=> b!771880 m!716891))

(assert (=> b!771880 m!716891))

(declare-fun m!716913 () Bool)

(assert (=> b!771880 m!716913))

(declare-fun m!716915 () Bool)

(assert (=> b!771897 m!716915))

(declare-fun m!716917 () Bool)

(assert (=> b!771886 m!716917))

(assert (=> b!771895 m!716891))

(assert (=> b!771895 m!716891))

(declare-fun m!716919 () Bool)

(assert (=> b!771895 m!716919))

(assert (=> b!771891 m!716891))

(assert (=> b!771891 m!716891))

(declare-fun m!716921 () Bool)

(assert (=> b!771891 m!716921))

(assert (=> b!771891 m!716921))

(assert (=> b!771891 m!716891))

(declare-fun m!716923 () Bool)

(assert (=> b!771891 m!716923))

(declare-fun m!716925 () Bool)

(assert (=> b!771882 m!716925))

(assert (=> b!771887 m!716891))

(assert (=> b!771887 m!716891))

(declare-fun m!716927 () Bool)

(assert (=> b!771887 m!716927))

(declare-fun m!716929 () Bool)

(assert (=> b!771896 m!716929))

(declare-fun m!716931 () Bool)

(assert (=> b!771879 m!716931))

(declare-fun m!716933 () Bool)

(assert (=> b!771893 m!716933))

(assert (=> b!771893 m!716933))

(declare-fun m!716935 () Bool)

(assert (=> b!771893 m!716935))

(declare-fun m!716937 () Bool)

(assert (=> b!771893 m!716937))

(declare-fun m!716939 () Bool)

(assert (=> b!771893 m!716939))

(declare-fun m!716941 () Bool)

(assert (=> b!771893 m!716941))

(push 1)

