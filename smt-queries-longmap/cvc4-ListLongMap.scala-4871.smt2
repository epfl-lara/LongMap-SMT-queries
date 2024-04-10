; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67144 () Bool)

(assert start!67144)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42499 0))(
  ( (array!42500 (arr!20345 (Array (_ BitVec 32) (_ BitVec 64))) (size!20766 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42499)

(declare-fun e!431794 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!775894 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7945 0))(
  ( (MissingZero!7945 (index!34148 (_ BitVec 32))) (Found!7945 (index!34149 (_ BitVec 32))) (Intermediate!7945 (undefined!8757 Bool) (index!34150 (_ BitVec 32)) (x!65088 (_ BitVec 32))) (Undefined!7945) (MissingVacant!7945 (index!34151 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42499 (_ BitVec 32)) SeekEntryResult!7945)

(assert (=> b!775894 (= e!431794 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20345 a!3186) j!159) a!3186 mask!3328) (Found!7945 j!159)))))

(declare-fun b!775895 () Bool)

(declare-fun res!524767 () Bool)

(declare-fun e!431799 () Bool)

(assert (=> b!775895 (=> (not res!524767) (not e!431799))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!775895 (= res!524767 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20345 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!524758 () Bool)

(declare-fun e!431800 () Bool)

(assert (=> start!67144 (=> (not res!524758) (not e!431800))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67144 (= res!524758 (validMask!0 mask!3328))))

(assert (=> start!67144 e!431800))

(assert (=> start!67144 true))

(declare-fun array_inv!16141 (array!42499) Bool)

(assert (=> start!67144 (array_inv!16141 a!3186)))

(declare-fun b!775896 () Bool)

(declare-fun res!524762 () Bool)

(assert (=> b!775896 (=> (not res!524762) (not e!431800))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!775896 (= res!524762 (validKeyInArray!0 (select (arr!20345 a!3186) j!159)))))

(declare-fun b!775897 () Bool)

(declare-fun res!524770 () Bool)

(declare-fun e!431797 () Bool)

(assert (=> b!775897 (=> (not res!524770) (not e!431797))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42499 (_ BitVec 32)) Bool)

(assert (=> b!775897 (= res!524770 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!775898 () Bool)

(declare-fun res!524756 () Bool)

(assert (=> b!775898 (=> (not res!524756) (not e!431797))))

(declare-datatypes ((List!14347 0))(
  ( (Nil!14344) (Cons!14343 (h!15451 (_ BitVec 64)) (t!20662 List!14347)) )
))
(declare-fun arrayNoDuplicates!0 (array!42499 (_ BitVec 32) List!14347) Bool)

(assert (=> b!775898 (= res!524756 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14344))))

(declare-fun b!775899 () Bool)

(declare-fun e!431795 () Bool)

(assert (=> b!775899 (= e!431795 true)))

(declare-fun lt!345655 () SeekEntryResult!7945)

(assert (=> b!775899 (= lt!345655 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20345 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!775900 () Bool)

(declare-fun e!431798 () Bool)

(declare-fun e!431801 () Bool)

(assert (=> b!775900 (= e!431798 e!431801)))

(declare-fun res!524764 () Bool)

(assert (=> b!775900 (=> (not res!524764) (not e!431801))))

(declare-fun lt!345654 () SeekEntryResult!7945)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42499 (_ BitVec 32)) SeekEntryResult!7945)

(assert (=> b!775900 (= res!524764 (= (seekEntryOrOpen!0 (select (arr!20345 a!3186) j!159) a!3186 mask!3328) lt!345654))))

(assert (=> b!775900 (= lt!345654 (Found!7945 j!159))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!775901 () Bool)

(assert (=> b!775901 (= e!431801 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20345 a!3186) j!159) a!3186 mask!3328) lt!345654))))

(declare-fun b!775902 () Bool)

(declare-fun res!524768 () Bool)

(assert (=> b!775902 (=> (not res!524768) (not e!431800))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!775902 (= res!524768 (validKeyInArray!0 k!2102))))

(declare-fun lt!345648 () SeekEntryResult!7945)

(declare-fun b!775903 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42499 (_ BitVec 32)) SeekEntryResult!7945)

(assert (=> b!775903 (= e!431794 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20345 a!3186) j!159) a!3186 mask!3328) lt!345648))))

(declare-fun b!775904 () Bool)

(declare-fun res!524760 () Bool)

(assert (=> b!775904 (=> (not res!524760) (not e!431797))))

(assert (=> b!775904 (= res!524760 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20766 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20766 a!3186))))))

(declare-fun b!775905 () Bool)

(declare-fun e!431796 () Bool)

(assert (=> b!775905 (= e!431796 (not e!431795))))

(declare-fun res!524757 () Bool)

(assert (=> b!775905 (=> res!524757 e!431795)))

(declare-fun lt!345653 () SeekEntryResult!7945)

(assert (=> b!775905 (= res!524757 (or (not (is-Intermediate!7945 lt!345653)) (bvslt x!1131 (x!65088 lt!345653)) (not (= x!1131 (x!65088 lt!345653))) (not (= index!1321 (index!34150 lt!345653)))))))

(assert (=> b!775905 e!431798))

(declare-fun res!524765 () Bool)

(assert (=> b!775905 (=> (not res!524765) (not e!431798))))

(assert (=> b!775905 (= res!524765 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26784 0))(
  ( (Unit!26785) )
))
(declare-fun lt!345651 () Unit!26784)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42499 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26784)

(assert (=> b!775905 (= lt!345651 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!775906 () Bool)

(assert (=> b!775906 (= e!431797 e!431799)))

(declare-fun res!524763 () Bool)

(assert (=> b!775906 (=> (not res!524763) (not e!431799))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!775906 (= res!524763 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20345 a!3186) j!159) mask!3328) (select (arr!20345 a!3186) j!159) a!3186 mask!3328) lt!345648))))

(assert (=> b!775906 (= lt!345648 (Intermediate!7945 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!775907 () Bool)

(assert (=> b!775907 (= e!431800 e!431797)))

(declare-fun res!524761 () Bool)

(assert (=> b!775907 (=> (not res!524761) (not e!431797))))

(declare-fun lt!345652 () SeekEntryResult!7945)

(assert (=> b!775907 (= res!524761 (or (= lt!345652 (MissingZero!7945 i!1173)) (= lt!345652 (MissingVacant!7945 i!1173))))))

(assert (=> b!775907 (= lt!345652 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!775908 () Bool)

(declare-fun res!524759 () Bool)

(assert (=> b!775908 (=> (not res!524759) (not e!431800))))

(assert (=> b!775908 (= res!524759 (and (= (size!20766 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20766 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20766 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!775909 () Bool)

(declare-fun res!524766 () Bool)

(assert (=> b!775909 (=> (not res!524766) (not e!431800))))

(declare-fun arrayContainsKey!0 (array!42499 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!775909 (= res!524766 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!775910 () Bool)

(declare-fun res!524769 () Bool)

(assert (=> b!775910 (=> (not res!524769) (not e!431799))))

(assert (=> b!775910 (= res!524769 e!431794)))

(declare-fun c!85969 () Bool)

(assert (=> b!775910 (= c!85969 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!775911 () Bool)

(assert (=> b!775911 (= e!431799 e!431796)))

(declare-fun res!524771 () Bool)

(assert (=> b!775911 (=> (not res!524771) (not e!431796))))

(declare-fun lt!345650 () SeekEntryResult!7945)

(assert (=> b!775911 (= res!524771 (= lt!345650 lt!345653))))

(declare-fun lt!345649 () array!42499)

(declare-fun lt!345656 () (_ BitVec 64))

(assert (=> b!775911 (= lt!345653 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!345656 lt!345649 mask!3328))))

(assert (=> b!775911 (= lt!345650 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!345656 mask!3328) lt!345656 lt!345649 mask!3328))))

(assert (=> b!775911 (= lt!345656 (select (store (arr!20345 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!775911 (= lt!345649 (array!42500 (store (arr!20345 a!3186) i!1173 k!2102) (size!20766 a!3186)))))

(assert (= (and start!67144 res!524758) b!775908))

(assert (= (and b!775908 res!524759) b!775896))

(assert (= (and b!775896 res!524762) b!775902))

(assert (= (and b!775902 res!524768) b!775909))

(assert (= (and b!775909 res!524766) b!775907))

(assert (= (and b!775907 res!524761) b!775897))

(assert (= (and b!775897 res!524770) b!775898))

(assert (= (and b!775898 res!524756) b!775904))

(assert (= (and b!775904 res!524760) b!775906))

(assert (= (and b!775906 res!524763) b!775895))

(assert (= (and b!775895 res!524767) b!775910))

(assert (= (and b!775910 c!85969) b!775903))

(assert (= (and b!775910 (not c!85969)) b!775894))

(assert (= (and b!775910 res!524769) b!775911))

(assert (= (and b!775911 res!524771) b!775905))

(assert (= (and b!775905 res!524765) b!775900))

(assert (= (and b!775900 res!524764) b!775901))

(assert (= (and b!775905 (not res!524757)) b!775899))

(declare-fun m!720055 () Bool)

(assert (=> b!775905 m!720055))

(declare-fun m!720057 () Bool)

(assert (=> b!775905 m!720057))

(declare-fun m!720059 () Bool)

(assert (=> b!775911 m!720059))

(declare-fun m!720061 () Bool)

(assert (=> b!775911 m!720061))

(declare-fun m!720063 () Bool)

(assert (=> b!775911 m!720063))

(declare-fun m!720065 () Bool)

(assert (=> b!775911 m!720065))

(assert (=> b!775911 m!720061))

(declare-fun m!720067 () Bool)

(assert (=> b!775911 m!720067))

(declare-fun m!720069 () Bool)

(assert (=> b!775906 m!720069))

(assert (=> b!775906 m!720069))

(declare-fun m!720071 () Bool)

(assert (=> b!775906 m!720071))

(assert (=> b!775906 m!720071))

(assert (=> b!775906 m!720069))

(declare-fun m!720073 () Bool)

(assert (=> b!775906 m!720073))

(declare-fun m!720075 () Bool)

(assert (=> start!67144 m!720075))

(declare-fun m!720077 () Bool)

(assert (=> start!67144 m!720077))

(assert (=> b!775903 m!720069))

(assert (=> b!775903 m!720069))

(declare-fun m!720079 () Bool)

(assert (=> b!775903 m!720079))

(declare-fun m!720081 () Bool)

(assert (=> b!775895 m!720081))

(assert (=> b!775896 m!720069))

(assert (=> b!775896 m!720069))

(declare-fun m!720083 () Bool)

(assert (=> b!775896 m!720083))

(declare-fun m!720085 () Bool)

(assert (=> b!775907 m!720085))

(declare-fun m!720087 () Bool)

(assert (=> b!775898 m!720087))

(declare-fun m!720089 () Bool)

(assert (=> b!775902 m!720089))

(assert (=> b!775900 m!720069))

(assert (=> b!775900 m!720069))

(declare-fun m!720091 () Bool)

(assert (=> b!775900 m!720091))

(declare-fun m!720093 () Bool)

(assert (=> b!775897 m!720093))

(declare-fun m!720095 () Bool)

(assert (=> b!775909 m!720095))

(assert (=> b!775901 m!720069))

(assert (=> b!775901 m!720069))

(declare-fun m!720097 () Bool)

(assert (=> b!775901 m!720097))

(assert (=> b!775899 m!720069))

(assert (=> b!775899 m!720069))

(declare-fun m!720099 () Bool)

(assert (=> b!775899 m!720099))

(assert (=> b!775894 m!720069))

(assert (=> b!775894 m!720069))

(assert (=> b!775894 m!720099))

(push 1)

