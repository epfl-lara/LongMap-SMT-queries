; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65360 () Bool)

(assert start!65360)

(declare-fun b!743060 () Bool)

(declare-fun res!500201 () Bool)

(declare-fun e!415217 () Bool)

(assert (=> b!743060 (=> (not res!500201) (not e!415217))))

(declare-datatypes ((array!41533 0))(
  ( (array!41534 (arr!19880 (Array (_ BitVec 32) (_ BitVec 64))) (size!20301 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41533)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!743060 (= res!500201 (validKeyInArray!0 (select (arr!19880 a!3186) j!159)))))

(declare-fun res!500200 () Bool)

(assert (=> start!65360 (=> (not res!500200) (not e!415217))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65360 (= res!500200 (validMask!0 mask!3328))))

(assert (=> start!65360 e!415217))

(assert (=> start!65360 true))

(declare-fun array_inv!15676 (array!41533) Bool)

(assert (=> start!65360 (array_inv!15676 a!3186)))

(declare-fun b!743061 () Bool)

(declare-fun res!500189 () Bool)

(assert (=> b!743061 (=> (not res!500189) (not e!415217))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!743061 (= res!500189 (validKeyInArray!0 k!2102))))

(declare-fun b!743062 () Bool)

(declare-fun e!415219 () Bool)

(declare-fun e!415220 () Bool)

(assert (=> b!743062 (= e!415219 e!415220)))

(declare-fun res!500195 () Bool)

(assert (=> b!743062 (=> (not res!500195) (not e!415220))))

(declare-datatypes ((SeekEntryResult!7480 0))(
  ( (MissingZero!7480 (index!32288 (_ BitVec 32))) (Found!7480 (index!32289 (_ BitVec 32))) (Intermediate!7480 (undefined!8292 Bool) (index!32290 (_ BitVec 32)) (x!63254 (_ BitVec 32))) (Undefined!7480) (MissingVacant!7480 (index!32291 (_ BitVec 32))) )
))
(declare-fun lt!330100 () SeekEntryResult!7480)

(declare-fun lt!330099 () SeekEntryResult!7480)

(assert (=> b!743062 (= res!500195 (= lt!330100 lt!330099))))

(declare-fun lt!330097 () array!41533)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!330096 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41533 (_ BitVec 32)) SeekEntryResult!7480)

(assert (=> b!743062 (= lt!330099 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330096 lt!330097 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!743062 (= lt!330100 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330096 mask!3328) lt!330096 lt!330097 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!743062 (= lt!330096 (select (store (arr!19880 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!743062 (= lt!330097 (array!41534 (store (arr!19880 a!3186) i!1173 k!2102) (size!20301 a!3186)))))

(declare-fun lt!330103 () SeekEntryResult!7480)

(declare-fun e!415214 () Bool)

(declare-fun b!743063 () Bool)

(assert (=> b!743063 (= e!415214 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19880 a!3186) j!159) a!3186 mask!3328) lt!330103))))

(declare-fun b!743064 () Bool)

(declare-fun e!415218 () Bool)

(assert (=> b!743064 (= e!415217 e!415218)))

(declare-fun res!500191 () Bool)

(assert (=> b!743064 (=> (not res!500191) (not e!415218))))

(declare-fun lt!330102 () SeekEntryResult!7480)

(assert (=> b!743064 (= res!500191 (or (= lt!330102 (MissingZero!7480 i!1173)) (= lt!330102 (MissingVacant!7480 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41533 (_ BitVec 32)) SeekEntryResult!7480)

(assert (=> b!743064 (= lt!330102 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!743065 () Bool)

(declare-fun res!500192 () Bool)

(declare-fun e!415216 () Bool)

(assert (=> b!743065 (=> res!500192 e!415216)))

(assert (=> b!743065 (= res!500192 (or (not (= (select (store (arr!19880 a!3186) i!1173 k!2102) index!1321) lt!330096)) (undefined!8292 lt!330099)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!743066 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41533 (_ BitVec 32)) SeekEntryResult!7480)

(assert (=> b!743066 (= e!415214 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19880 a!3186) j!159) a!3186 mask!3328) (Found!7480 j!159)))))

(declare-fun b!743067 () Bool)

(declare-fun res!500196 () Bool)

(assert (=> b!743067 (=> (not res!500196) (not e!415219))))

(assert (=> b!743067 (= res!500196 e!415214)))

(declare-fun c!81817 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!743067 (= c!81817 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!743068 () Bool)

(declare-fun res!500197 () Bool)

(assert (=> b!743068 (=> (not res!500197) (not e!415218))))

(declare-datatypes ((List!13882 0))(
  ( (Nil!13879) (Cons!13878 (h!14950 (_ BitVec 64)) (t!20197 List!13882)) )
))
(declare-fun arrayNoDuplicates!0 (array!41533 (_ BitVec 32) List!13882) Bool)

(assert (=> b!743068 (= res!500197 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13879))))

(declare-fun b!743069 () Bool)

(declare-fun e!415213 () Bool)

(declare-fun lt!330101 () SeekEntryResult!7480)

(assert (=> b!743069 (= e!415213 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19880 a!3186) j!159) a!3186 mask!3328) lt!330101))))

(declare-fun b!743070 () Bool)

(assert (=> b!743070 (= e!415218 e!415219)))

(declare-fun res!500202 () Bool)

(assert (=> b!743070 (=> (not res!500202) (not e!415219))))

(assert (=> b!743070 (= res!500202 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19880 a!3186) j!159) mask!3328) (select (arr!19880 a!3186) j!159) a!3186 mask!3328) lt!330103))))

(assert (=> b!743070 (= lt!330103 (Intermediate!7480 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!743071 () Bool)

(declare-fun res!500194 () Bool)

(assert (=> b!743071 (=> (not res!500194) (not e!415219))))

(assert (=> b!743071 (= res!500194 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19880 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!743072 () Bool)

(assert (=> b!743072 (= e!415220 (not e!415216))))

(declare-fun res!500203 () Bool)

(assert (=> b!743072 (=> res!500203 e!415216)))

(assert (=> b!743072 (= res!500203 (or (not (is-Intermediate!7480 lt!330099)) (bvslt x!1131 (x!63254 lt!330099)) (not (= x!1131 (x!63254 lt!330099))) (not (= index!1321 (index!32290 lt!330099)))))))

(declare-fun e!415212 () Bool)

(assert (=> b!743072 e!415212))

(declare-fun res!500187 () Bool)

(assert (=> b!743072 (=> (not res!500187) (not e!415212))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41533 (_ BitVec 32)) Bool)

(assert (=> b!743072 (= res!500187 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25440 0))(
  ( (Unit!25441) )
))
(declare-fun lt!330104 () Unit!25440)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41533 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25440)

(assert (=> b!743072 (= lt!330104 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!743073 () Bool)

(assert (=> b!743073 (= e!415212 e!415213)))

(declare-fun res!500198 () Bool)

(assert (=> b!743073 (=> (not res!500198) (not e!415213))))

(assert (=> b!743073 (= res!500198 (= (seekEntryOrOpen!0 (select (arr!19880 a!3186) j!159) a!3186 mask!3328) lt!330101))))

(assert (=> b!743073 (= lt!330101 (Found!7480 j!159))))

(declare-fun b!743074 () Bool)

(declare-fun res!500199 () Bool)

(assert (=> b!743074 (=> (not res!500199) (not e!415217))))

(declare-fun arrayContainsKey!0 (array!41533 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!743074 (= res!500199 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!743075 () Bool)

(declare-fun res!500193 () Bool)

(assert (=> b!743075 (=> res!500193 e!415216)))

(assert (=> b!743075 (= res!500193 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19880 a!3186) j!159) a!3186 mask!3328) (Found!7480 j!159))))))

(declare-fun b!743076 () Bool)

(declare-fun res!500204 () Bool)

(assert (=> b!743076 (=> (not res!500204) (not e!415218))))

(assert (=> b!743076 (= res!500204 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!743077 () Bool)

(assert (=> b!743077 (= e!415216 true)))

(declare-fun lt!330098 () SeekEntryResult!7480)

(assert (=> b!743077 (= lt!330098 (seekEntryOrOpen!0 lt!330096 lt!330097 mask!3328))))

(declare-fun b!743078 () Bool)

(declare-fun res!500190 () Bool)

(assert (=> b!743078 (=> (not res!500190) (not e!415218))))

(assert (=> b!743078 (= res!500190 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20301 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20301 a!3186))))))

(declare-fun b!743079 () Bool)

(declare-fun res!500188 () Bool)

(assert (=> b!743079 (=> (not res!500188) (not e!415217))))

(assert (=> b!743079 (= res!500188 (and (= (size!20301 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20301 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20301 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!65360 res!500200) b!743079))

(assert (= (and b!743079 res!500188) b!743060))

(assert (= (and b!743060 res!500201) b!743061))

(assert (= (and b!743061 res!500189) b!743074))

(assert (= (and b!743074 res!500199) b!743064))

(assert (= (and b!743064 res!500191) b!743076))

(assert (= (and b!743076 res!500204) b!743068))

(assert (= (and b!743068 res!500197) b!743078))

(assert (= (and b!743078 res!500190) b!743070))

(assert (= (and b!743070 res!500202) b!743071))

(assert (= (and b!743071 res!500194) b!743067))

(assert (= (and b!743067 c!81817) b!743063))

(assert (= (and b!743067 (not c!81817)) b!743066))

(assert (= (and b!743067 res!500196) b!743062))

(assert (= (and b!743062 res!500195) b!743072))

(assert (= (and b!743072 res!500187) b!743073))

(assert (= (and b!743073 res!500198) b!743069))

(assert (= (and b!743072 (not res!500203)) b!743075))

(assert (= (and b!743075 (not res!500193)) b!743065))

(assert (= (and b!743065 (not res!500192)) b!743077))

(declare-fun m!693821 () Bool)

(assert (=> b!743061 m!693821))

(declare-fun m!693823 () Bool)

(assert (=> b!743063 m!693823))

(assert (=> b!743063 m!693823))

(declare-fun m!693825 () Bool)

(assert (=> b!743063 m!693825))

(assert (=> b!743070 m!693823))

(assert (=> b!743070 m!693823))

(declare-fun m!693827 () Bool)

(assert (=> b!743070 m!693827))

(assert (=> b!743070 m!693827))

(assert (=> b!743070 m!693823))

(declare-fun m!693829 () Bool)

(assert (=> b!743070 m!693829))

(declare-fun m!693831 () Bool)

(assert (=> b!743062 m!693831))

(assert (=> b!743062 m!693831))

(declare-fun m!693833 () Bool)

(assert (=> b!743062 m!693833))

(declare-fun m!693835 () Bool)

(assert (=> b!743062 m!693835))

(declare-fun m!693837 () Bool)

(assert (=> b!743062 m!693837))

(declare-fun m!693839 () Bool)

(assert (=> b!743062 m!693839))

(assert (=> b!743075 m!693823))

(assert (=> b!743075 m!693823))

(declare-fun m!693841 () Bool)

(assert (=> b!743075 m!693841))

(declare-fun m!693843 () Bool)

(assert (=> b!743068 m!693843))

(assert (=> b!743066 m!693823))

(assert (=> b!743066 m!693823))

(assert (=> b!743066 m!693841))

(declare-fun m!693845 () Bool)

(assert (=> b!743076 m!693845))

(assert (=> b!743073 m!693823))

(assert (=> b!743073 m!693823))

(declare-fun m!693847 () Bool)

(assert (=> b!743073 m!693847))

(assert (=> b!743065 m!693835))

(declare-fun m!693849 () Bool)

(assert (=> b!743065 m!693849))

(declare-fun m!693851 () Bool)

(assert (=> b!743064 m!693851))

(declare-fun m!693853 () Bool)

(assert (=> b!743077 m!693853))

(assert (=> b!743069 m!693823))

(assert (=> b!743069 m!693823))

(declare-fun m!693855 () Bool)

(assert (=> b!743069 m!693855))

(declare-fun m!693857 () Bool)

(assert (=> b!743074 m!693857))

(assert (=> b!743060 m!693823))

(assert (=> b!743060 m!693823))

(declare-fun m!693859 () Bool)

(assert (=> b!743060 m!693859))

(declare-fun m!693861 () Bool)

(assert (=> b!743071 m!693861))

(declare-fun m!693863 () Bool)

(assert (=> b!743072 m!693863))

(declare-fun m!693865 () Bool)

(assert (=> b!743072 m!693865))

(declare-fun m!693867 () Bool)

(assert (=> start!65360 m!693867))

(declare-fun m!693869 () Bool)

(assert (=> start!65360 m!693869))

(push 1)

