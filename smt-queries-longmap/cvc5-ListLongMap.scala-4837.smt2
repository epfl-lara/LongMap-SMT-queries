; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66566 () Bool)

(assert start!66566)

(declare-fun b!767052 () Bool)

(declare-fun e!427151 () Bool)

(assert (=> b!767052 (= e!427151 true)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!341207 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!767052 (= lt!341207 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!767053 () Bool)

(declare-fun e!427150 () Bool)

(assert (=> b!767053 (= e!427150 (not e!427151))))

(declare-fun res!518864 () Bool)

(assert (=> b!767053 (=> res!518864 e!427151)))

(declare-datatypes ((SeekEntryResult!7841 0))(
  ( (MissingZero!7841 (index!33732 (_ BitVec 32))) (Found!7841 (index!33733 (_ BitVec 32))) (Intermediate!7841 (undefined!8653 Bool) (index!33734 (_ BitVec 32)) (x!64651 (_ BitVec 32))) (Undefined!7841) (MissingVacant!7841 (index!33735 (_ BitVec 32))) )
))
(declare-fun lt!341204 () SeekEntryResult!7841)

(assert (=> b!767053 (= res!518864 (or (not (is-Intermediate!7841 lt!341204)) (bvsge x!1131 (x!64651 lt!341204))))))

(declare-fun e!427156 () Bool)

(assert (=> b!767053 e!427156))

(declare-fun res!518861 () Bool)

(assert (=> b!767053 (=> (not res!518861) (not e!427156))))

(declare-datatypes ((array!42276 0))(
  ( (array!42277 (arr!20241 (Array (_ BitVec 32) (_ BitVec 64))) (size!20662 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42276)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42276 (_ BitVec 32)) Bool)

(assert (=> b!767053 (= res!518861 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26408 0))(
  ( (Unit!26409) )
))
(declare-fun lt!341202 () Unit!26408)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42276 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26408)

(assert (=> b!767053 (= lt!341202 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!767054 () Bool)

(declare-fun res!518869 () Bool)

(declare-fun e!427154 () Bool)

(assert (=> b!767054 (=> (not res!518869) (not e!427154))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!767054 (= res!518869 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20662 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20662 a!3186))))))

(declare-fun b!767055 () Bool)

(declare-fun e!427152 () Bool)

(assert (=> b!767055 (= e!427154 e!427152)))

(declare-fun res!518862 () Bool)

(assert (=> b!767055 (=> (not res!518862) (not e!427152))))

(declare-fun lt!341206 () SeekEntryResult!7841)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42276 (_ BitVec 32)) SeekEntryResult!7841)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!767055 (= res!518862 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20241 a!3186) j!159) mask!3328) (select (arr!20241 a!3186) j!159) a!3186 mask!3328) lt!341206))))

(assert (=> b!767055 (= lt!341206 (Intermediate!7841 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!767056 () Bool)

(declare-fun res!518863 () Bool)

(declare-fun e!427155 () Bool)

(assert (=> b!767056 (=> (not res!518863) (not e!427155))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!767056 (= res!518863 (and (= (size!20662 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20662 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20662 a!3186)) (not (= i!1173 j!159))))))

(declare-fun lt!341205 () SeekEntryResult!7841)

(declare-fun b!767057 () Bool)

(declare-fun e!427158 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42276 (_ BitVec 32)) SeekEntryResult!7841)

(assert (=> b!767057 (= e!427158 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20241 a!3186) j!159) a!3186 mask!3328) lt!341205))))

(declare-fun res!518866 () Bool)

(assert (=> start!66566 (=> (not res!518866) (not e!427155))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66566 (= res!518866 (validMask!0 mask!3328))))

(assert (=> start!66566 e!427155))

(assert (=> start!66566 true))

(declare-fun array_inv!16037 (array!42276) Bool)

(assert (=> start!66566 (array_inv!16037 a!3186)))

(declare-fun b!767058 () Bool)

(declare-fun res!518858 () Bool)

(assert (=> b!767058 (=> (not res!518858) (not e!427152))))

(assert (=> b!767058 (= res!518858 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20241 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!767059 () Bool)

(assert (=> b!767059 (= e!427152 e!427150)))

(declare-fun res!518856 () Bool)

(assert (=> b!767059 (=> (not res!518856) (not e!427150))))

(declare-fun lt!341200 () SeekEntryResult!7841)

(assert (=> b!767059 (= res!518856 (= lt!341200 lt!341204))))

(declare-fun lt!341201 () array!42276)

(declare-fun lt!341199 () (_ BitVec 64))

(assert (=> b!767059 (= lt!341204 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!341199 lt!341201 mask!3328))))

(assert (=> b!767059 (= lt!341200 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!341199 mask!3328) lt!341199 lt!341201 mask!3328))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!767059 (= lt!341199 (select (store (arr!20241 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!767059 (= lt!341201 (array!42277 (store (arr!20241 a!3186) i!1173 k!2102) (size!20662 a!3186)))))

(declare-fun e!427153 () Bool)

(declare-fun b!767060 () Bool)

(assert (=> b!767060 (= e!427153 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20241 a!3186) j!159) a!3186 mask!3328) lt!341206))))

(declare-fun b!767061 () Bool)

(declare-fun res!518857 () Bool)

(assert (=> b!767061 (=> (not res!518857) (not e!427154))))

(assert (=> b!767061 (= res!518857 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!767062 () Bool)

(declare-fun res!518855 () Bool)

(assert (=> b!767062 (=> (not res!518855) (not e!427154))))

(declare-datatypes ((List!14243 0))(
  ( (Nil!14240) (Cons!14239 (h!15332 (_ BitVec 64)) (t!20558 List!14243)) )
))
(declare-fun arrayNoDuplicates!0 (array!42276 (_ BitVec 32) List!14243) Bool)

(assert (=> b!767062 (= res!518855 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14240))))

(declare-fun b!767063 () Bool)

(declare-fun res!518860 () Bool)

(assert (=> b!767063 (=> (not res!518860) (not e!427155))))

(declare-fun arrayContainsKey!0 (array!42276 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!767063 (= res!518860 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!767064 () Bool)

(declare-fun res!518854 () Bool)

(assert (=> b!767064 (=> (not res!518854) (not e!427155))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!767064 (= res!518854 (validKeyInArray!0 k!2102))))

(declare-fun b!767065 () Bool)

(declare-fun res!518868 () Bool)

(assert (=> b!767065 (=> (not res!518868) (not e!427155))))

(assert (=> b!767065 (= res!518868 (validKeyInArray!0 (select (arr!20241 a!3186) j!159)))))

(declare-fun b!767066 () Bool)

(assert (=> b!767066 (= e!427155 e!427154)))

(declare-fun res!518865 () Bool)

(assert (=> b!767066 (=> (not res!518865) (not e!427154))))

(declare-fun lt!341203 () SeekEntryResult!7841)

(assert (=> b!767066 (= res!518865 (or (= lt!341203 (MissingZero!7841 i!1173)) (= lt!341203 (MissingVacant!7841 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42276 (_ BitVec 32)) SeekEntryResult!7841)

(assert (=> b!767066 (= lt!341203 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!767067 () Bool)

(declare-fun res!518859 () Bool)

(assert (=> b!767067 (=> (not res!518859) (not e!427152))))

(assert (=> b!767067 (= res!518859 e!427153)))

(declare-fun c!84490 () Bool)

(assert (=> b!767067 (= c!84490 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!767068 () Bool)

(assert (=> b!767068 (= e!427156 e!427158)))

(declare-fun res!518867 () Bool)

(assert (=> b!767068 (=> (not res!518867) (not e!427158))))

(assert (=> b!767068 (= res!518867 (= (seekEntryOrOpen!0 (select (arr!20241 a!3186) j!159) a!3186 mask!3328) lt!341205))))

(assert (=> b!767068 (= lt!341205 (Found!7841 j!159))))

(declare-fun b!767069 () Bool)

(assert (=> b!767069 (= e!427153 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20241 a!3186) j!159) a!3186 mask!3328) (Found!7841 j!159)))))

(assert (= (and start!66566 res!518866) b!767056))

(assert (= (and b!767056 res!518863) b!767065))

(assert (= (and b!767065 res!518868) b!767064))

(assert (= (and b!767064 res!518854) b!767063))

(assert (= (and b!767063 res!518860) b!767066))

(assert (= (and b!767066 res!518865) b!767061))

(assert (= (and b!767061 res!518857) b!767062))

(assert (= (and b!767062 res!518855) b!767054))

(assert (= (and b!767054 res!518869) b!767055))

(assert (= (and b!767055 res!518862) b!767058))

(assert (= (and b!767058 res!518858) b!767067))

(assert (= (and b!767067 c!84490) b!767060))

(assert (= (and b!767067 (not c!84490)) b!767069))

(assert (= (and b!767067 res!518859) b!767059))

(assert (= (and b!767059 res!518856) b!767053))

(assert (= (and b!767053 res!518861) b!767068))

(assert (= (and b!767068 res!518867) b!767057))

(assert (= (and b!767053 (not res!518864)) b!767052))

(declare-fun m!712881 () Bool)

(assert (=> b!767065 m!712881))

(assert (=> b!767065 m!712881))

(declare-fun m!712883 () Bool)

(assert (=> b!767065 m!712883))

(declare-fun m!712885 () Bool)

(assert (=> b!767064 m!712885))

(declare-fun m!712887 () Bool)

(assert (=> b!767061 m!712887))

(declare-fun m!712889 () Bool)

(assert (=> b!767059 m!712889))

(declare-fun m!712891 () Bool)

(assert (=> b!767059 m!712891))

(declare-fun m!712893 () Bool)

(assert (=> b!767059 m!712893))

(assert (=> b!767059 m!712893))

(declare-fun m!712895 () Bool)

(assert (=> b!767059 m!712895))

(declare-fun m!712897 () Bool)

(assert (=> b!767059 m!712897))

(assert (=> b!767060 m!712881))

(assert (=> b!767060 m!712881))

(declare-fun m!712899 () Bool)

(assert (=> b!767060 m!712899))

(declare-fun m!712901 () Bool)

(assert (=> b!767063 m!712901))

(assert (=> b!767069 m!712881))

(assert (=> b!767069 m!712881))

(declare-fun m!712903 () Bool)

(assert (=> b!767069 m!712903))

(declare-fun m!712905 () Bool)

(assert (=> b!767066 m!712905))

(assert (=> b!767057 m!712881))

(assert (=> b!767057 m!712881))

(declare-fun m!712907 () Bool)

(assert (=> b!767057 m!712907))

(declare-fun m!712909 () Bool)

(assert (=> b!767053 m!712909))

(declare-fun m!712911 () Bool)

(assert (=> b!767053 m!712911))

(declare-fun m!712913 () Bool)

(assert (=> b!767052 m!712913))

(declare-fun m!712915 () Bool)

(assert (=> b!767062 m!712915))

(assert (=> b!767068 m!712881))

(assert (=> b!767068 m!712881))

(declare-fun m!712917 () Bool)

(assert (=> b!767068 m!712917))

(declare-fun m!712919 () Bool)

(assert (=> start!66566 m!712919))

(declare-fun m!712921 () Bool)

(assert (=> start!66566 m!712921))

(assert (=> b!767055 m!712881))

(assert (=> b!767055 m!712881))

(declare-fun m!712923 () Bool)

(assert (=> b!767055 m!712923))

(assert (=> b!767055 m!712923))

(assert (=> b!767055 m!712881))

(declare-fun m!712925 () Bool)

(assert (=> b!767055 m!712925))

(declare-fun m!712927 () Bool)

(assert (=> b!767058 m!712927))

(push 1)

