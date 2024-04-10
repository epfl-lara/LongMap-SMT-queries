; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67002 () Bool)

(assert start!67002)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!773060 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!430357 () Bool)

(declare-datatypes ((array!42426 0))(
  ( (array!42427 (arr!20310 (Array (_ BitVec 32) (_ BitVec 64))) (size!20731 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42426)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7910 0))(
  ( (MissingZero!7910 (index!34008 (_ BitVec 32))) (Found!7910 (index!34009 (_ BitVec 32))) (Intermediate!7910 (undefined!8722 Bool) (index!34010 (_ BitVec 32)) (x!64953 (_ BitVec 32))) (Undefined!7910) (MissingVacant!7910 (index!34011 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42426 (_ BitVec 32)) SeekEntryResult!7910)

(assert (=> b!773060 (= e!430357 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20310 a!3186) j!159) a!3186 mask!3328) (Found!7910 j!159)))))

(declare-fun b!773061 () Bool)

(declare-fun res!522792 () Bool)

(declare-fun e!430361 () Bool)

(assert (=> b!773061 (=> (not res!522792) (not e!430361))))

(declare-datatypes ((List!14312 0))(
  ( (Nil!14309) (Cons!14308 (h!15413 (_ BitVec 64)) (t!20627 List!14312)) )
))
(declare-fun arrayNoDuplicates!0 (array!42426 (_ BitVec 32) List!14312) Bool)

(assert (=> b!773061 (= res!522792 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14309))))

(declare-fun b!773062 () Bool)

(declare-fun res!522780 () Bool)

(declare-fun e!430352 () Bool)

(assert (=> b!773062 (=> (not res!522780) (not e!430352))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!773062 (= res!522780 (validKeyInArray!0 (select (arr!20310 a!3186) j!159)))))

(declare-fun b!773063 () Bool)

(declare-fun e!430354 () Bool)

(assert (=> b!773063 (= e!430354 true)))

(declare-datatypes ((Unit!26654 0))(
  ( (Unit!26655) )
))
(declare-fun lt!344206 () Unit!26654)

(declare-fun e!430360 () Unit!26654)

(assert (=> b!773063 (= lt!344206 e!430360)))

(declare-fun c!85539 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!773063 (= c!85539 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!344202 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!773063 (= lt!344202 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!773064 () Bool)

(assert (=> b!773064 (= e!430352 e!430361)))

(declare-fun res!522793 () Bool)

(assert (=> b!773064 (=> (not res!522793) (not e!430361))))

(declare-fun lt!344200 () SeekEntryResult!7910)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!773064 (= res!522793 (or (= lt!344200 (MissingZero!7910 i!1173)) (= lt!344200 (MissingVacant!7910 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42426 (_ BitVec 32)) SeekEntryResult!7910)

(assert (=> b!773064 (= lt!344200 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!773066 () Bool)

(declare-fun res!522779 () Bool)

(assert (=> b!773066 (=> (not res!522779) (not e!430361))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42426 (_ BitVec 32)) Bool)

(assert (=> b!773066 (= res!522779 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!773067 () Bool)

(declare-fun res!522782 () Bool)

(assert (=> b!773067 (=> (not res!522782) (not e!430352))))

(assert (=> b!773067 (= res!522782 (validKeyInArray!0 k!2102))))

(declare-fun b!773068 () Bool)

(declare-fun res!522784 () Bool)

(declare-fun e!430359 () Bool)

(assert (=> b!773068 (=> (not res!522784) (not e!430359))))

(assert (=> b!773068 (= res!522784 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20310 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!773069 () Bool)

(declare-fun lt!344208 () SeekEntryResult!7910)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42426 (_ BitVec 32)) SeekEntryResult!7910)

(assert (=> b!773069 (= e!430357 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20310 a!3186) j!159) a!3186 mask!3328) lt!344208))))

(declare-fun b!773070 () Bool)

(assert (=> b!773070 (= e!430361 e!430359)))

(declare-fun res!522791 () Bool)

(assert (=> b!773070 (=> (not res!522791) (not e!430359))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!773070 (= res!522791 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20310 a!3186) j!159) mask!3328) (select (arr!20310 a!3186) j!159) a!3186 mask!3328) lt!344208))))

(assert (=> b!773070 (= lt!344208 (Intermediate!7910 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!773071 () Bool)

(declare-fun e!430355 () Bool)

(declare-fun e!430358 () Bool)

(assert (=> b!773071 (= e!430355 e!430358)))

(declare-fun res!522786 () Bool)

(assert (=> b!773071 (=> (not res!522786) (not e!430358))))

(declare-fun lt!344210 () SeekEntryResult!7910)

(assert (=> b!773071 (= res!522786 (= (seekEntryOrOpen!0 (select (arr!20310 a!3186) j!159) a!3186 mask!3328) lt!344210))))

(assert (=> b!773071 (= lt!344210 (Found!7910 j!159))))

(declare-fun b!773072 () Bool)

(declare-fun Unit!26656 () Unit!26654)

(assert (=> b!773072 (= e!430360 Unit!26656)))

(assert (=> b!773072 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344202 (select (arr!20310 a!3186) j!159) a!3186 mask!3328) lt!344208)))

(declare-fun b!773073 () Bool)

(declare-fun res!522788 () Bool)

(assert (=> b!773073 (=> (not res!522788) (not e!430352))))

(assert (=> b!773073 (= res!522788 (and (= (size!20731 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20731 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20731 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!773074 () Bool)

(declare-fun e!430356 () Bool)

(assert (=> b!773074 (= e!430359 e!430356)))

(declare-fun res!522789 () Bool)

(assert (=> b!773074 (=> (not res!522789) (not e!430356))))

(declare-fun lt!344205 () SeekEntryResult!7910)

(declare-fun lt!344201 () SeekEntryResult!7910)

(assert (=> b!773074 (= res!522789 (= lt!344205 lt!344201))))

(declare-fun lt!344207 () (_ BitVec 64))

(declare-fun lt!344204 () array!42426)

(assert (=> b!773074 (= lt!344201 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!344207 lt!344204 mask!3328))))

(assert (=> b!773074 (= lt!344205 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!344207 mask!3328) lt!344207 lt!344204 mask!3328))))

(assert (=> b!773074 (= lt!344207 (select (store (arr!20310 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!773074 (= lt!344204 (array!42427 (store (arr!20310 a!3186) i!1173 k!2102) (size!20731 a!3186)))))

(declare-fun b!773075 () Bool)

(declare-fun res!522794 () Bool)

(assert (=> b!773075 (=> (not res!522794) (not e!430352))))

(declare-fun arrayContainsKey!0 (array!42426 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!773075 (= res!522794 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!773076 () Bool)

(declare-fun res!522785 () Bool)

(assert (=> b!773076 (=> (not res!522785) (not e!430361))))

(assert (=> b!773076 (= res!522785 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20731 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20731 a!3186))))))

(declare-fun b!773077 () Bool)

(declare-fun Unit!26657 () Unit!26654)

(assert (=> b!773077 (= e!430360 Unit!26657)))

(declare-fun lt!344209 () SeekEntryResult!7910)

(assert (=> b!773077 (= lt!344209 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20310 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!773077 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344202 resIntermediateIndex!5 (select (arr!20310 a!3186) j!159) a!3186 mask!3328) (Found!7910 j!159))))

(declare-fun b!773065 () Bool)

(assert (=> b!773065 (= e!430358 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20310 a!3186) j!159) a!3186 mask!3328) lt!344210))))

(declare-fun res!522790 () Bool)

(assert (=> start!67002 (=> (not res!522790) (not e!430352))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67002 (= res!522790 (validMask!0 mask!3328))))

(assert (=> start!67002 e!430352))

(assert (=> start!67002 true))

(declare-fun array_inv!16106 (array!42426) Bool)

(assert (=> start!67002 (array_inv!16106 a!3186)))

(declare-fun b!773078 () Bool)

(declare-fun res!522783 () Bool)

(assert (=> b!773078 (=> (not res!522783) (not e!430359))))

(assert (=> b!773078 (= res!522783 e!430357)))

(declare-fun c!85540 () Bool)

(assert (=> b!773078 (= c!85540 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!773079 () Bool)

(assert (=> b!773079 (= e!430356 (not e!430354))))

(declare-fun res!522787 () Bool)

(assert (=> b!773079 (=> res!522787 e!430354)))

(assert (=> b!773079 (= res!522787 (or (not (is-Intermediate!7910 lt!344201)) (bvsge x!1131 (x!64953 lt!344201))))))

(assert (=> b!773079 e!430355))

(declare-fun res!522781 () Bool)

(assert (=> b!773079 (=> (not res!522781) (not e!430355))))

(assert (=> b!773079 (= res!522781 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!344203 () Unit!26654)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42426 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26654)

(assert (=> b!773079 (= lt!344203 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!67002 res!522790) b!773073))

(assert (= (and b!773073 res!522788) b!773062))

(assert (= (and b!773062 res!522780) b!773067))

(assert (= (and b!773067 res!522782) b!773075))

(assert (= (and b!773075 res!522794) b!773064))

(assert (= (and b!773064 res!522793) b!773066))

(assert (= (and b!773066 res!522779) b!773061))

(assert (= (and b!773061 res!522792) b!773076))

(assert (= (and b!773076 res!522785) b!773070))

(assert (= (and b!773070 res!522791) b!773068))

(assert (= (and b!773068 res!522784) b!773078))

(assert (= (and b!773078 c!85540) b!773069))

(assert (= (and b!773078 (not c!85540)) b!773060))

(assert (= (and b!773078 res!522783) b!773074))

(assert (= (and b!773074 res!522789) b!773079))

(assert (= (and b!773079 res!522781) b!773071))

(assert (= (and b!773071 res!522786) b!773065))

(assert (= (and b!773079 (not res!522787)) b!773063))

(assert (= (and b!773063 c!85539) b!773072))

(assert (= (and b!773063 (not c!85539)) b!773077))

(declare-fun m!717839 () Bool)

(assert (=> b!773070 m!717839))

(assert (=> b!773070 m!717839))

(declare-fun m!717841 () Bool)

(assert (=> b!773070 m!717841))

(assert (=> b!773070 m!717841))

(assert (=> b!773070 m!717839))

(declare-fun m!717843 () Bool)

(assert (=> b!773070 m!717843))

(assert (=> b!773071 m!717839))

(assert (=> b!773071 m!717839))

(declare-fun m!717845 () Bool)

(assert (=> b!773071 m!717845))

(declare-fun m!717847 () Bool)

(assert (=> start!67002 m!717847))

(declare-fun m!717849 () Bool)

(assert (=> start!67002 m!717849))

(declare-fun m!717851 () Bool)

(assert (=> b!773074 m!717851))

(declare-fun m!717853 () Bool)

(assert (=> b!773074 m!717853))

(declare-fun m!717855 () Bool)

(assert (=> b!773074 m!717855))

(declare-fun m!717857 () Bool)

(assert (=> b!773074 m!717857))

(assert (=> b!773074 m!717851))

(declare-fun m!717859 () Bool)

(assert (=> b!773074 m!717859))

(declare-fun m!717861 () Bool)

(assert (=> b!773061 m!717861))

(declare-fun m!717863 () Bool)

(assert (=> b!773067 m!717863))

(assert (=> b!773060 m!717839))

(assert (=> b!773060 m!717839))

(declare-fun m!717865 () Bool)

(assert (=> b!773060 m!717865))

(declare-fun m!717867 () Bool)

(assert (=> b!773079 m!717867))

(declare-fun m!717869 () Bool)

(assert (=> b!773079 m!717869))

(assert (=> b!773077 m!717839))

(assert (=> b!773077 m!717839))

(assert (=> b!773077 m!717865))

(assert (=> b!773077 m!717839))

(declare-fun m!717871 () Bool)

(assert (=> b!773077 m!717871))

(declare-fun m!717873 () Bool)

(assert (=> b!773075 m!717873))

(assert (=> b!773069 m!717839))

(assert (=> b!773069 m!717839))

(declare-fun m!717875 () Bool)

(assert (=> b!773069 m!717875))

(assert (=> b!773062 m!717839))

(assert (=> b!773062 m!717839))

(declare-fun m!717877 () Bool)

(assert (=> b!773062 m!717877))

(declare-fun m!717879 () Bool)

(assert (=> b!773063 m!717879))

(assert (=> b!773072 m!717839))

(assert (=> b!773072 m!717839))

(declare-fun m!717881 () Bool)

(assert (=> b!773072 m!717881))

(declare-fun m!717883 () Bool)

(assert (=> b!773068 m!717883))

(declare-fun m!717885 () Bool)

(assert (=> b!773064 m!717885))

(declare-fun m!717887 () Bool)

(assert (=> b!773066 m!717887))

(assert (=> b!773065 m!717839))

(assert (=> b!773065 m!717839))

(declare-fun m!717889 () Bool)

(assert (=> b!773065 m!717889))

(push 1)

