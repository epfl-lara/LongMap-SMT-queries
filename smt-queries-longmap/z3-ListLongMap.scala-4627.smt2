; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64464 () Bool)

(assert start!64464)

(declare-fun b!724920 () Bool)

(declare-fun res!486093 () Bool)

(declare-fun e!406018 () Bool)

(assert (=> b!724920 (=> (not res!486093) (not e!406018))))

(declare-datatypes ((array!40982 0))(
  ( (array!40983 (arr!19612 (Array (_ BitVec 32) (_ BitVec 64))) (size!20033 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40982)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40982 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!724920 (= res!486093 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!724921 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!406014 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7212 0))(
  ( (MissingZero!7212 (index!31216 (_ BitVec 32))) (Found!7212 (index!31217 (_ BitVec 32))) (Intermediate!7212 (undefined!8024 Bool) (index!31218 (_ BitVec 32)) (x!62214 (_ BitVec 32))) (Undefined!7212) (MissingVacant!7212 (index!31219 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40982 (_ BitVec 32)) SeekEntryResult!7212)

(assert (=> b!724921 (= e!406014 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19612 a!3186) j!159) a!3186 mask!3328) (Found!7212 j!159)))))

(declare-fun b!724922 () Bool)

(declare-fun res!486088 () Bool)

(assert (=> b!724922 (=> (not res!486088) (not e!406018))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!724922 (= res!486088 (validKeyInArray!0 (select (arr!19612 a!3186) j!159)))))

(declare-fun b!724923 () Bool)

(declare-fun e!406017 () Bool)

(declare-fun e!406016 () Bool)

(assert (=> b!724923 (= e!406017 e!406016)))

(declare-fun res!486089 () Bool)

(assert (=> b!724923 (=> (not res!486089) (not e!406016))))

(declare-fun lt!321173 () SeekEntryResult!7212)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40982 (_ BitVec 32)) SeekEntryResult!7212)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!724923 (= res!486089 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19612 a!3186) j!159) mask!3328) (select (arr!19612 a!3186) j!159) a!3186 mask!3328) lt!321173))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!724923 (= lt!321173 (Intermediate!7212 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!724924 () Bool)

(declare-fun res!486094 () Bool)

(assert (=> b!724924 (=> (not res!486094) (not e!406017))))

(assert (=> b!724924 (= res!486094 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20033 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20033 a!3186))))))

(declare-fun b!724925 () Bool)

(declare-fun res!486092 () Bool)

(assert (=> b!724925 (=> (not res!486092) (not e!406016))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!724925 (= res!486092 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19612 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!724926 () Bool)

(assert (=> b!724926 (= e!406014 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19612 a!3186) j!159) a!3186 mask!3328) lt!321173))))

(declare-fun res!486090 () Bool)

(assert (=> start!64464 (=> (not res!486090) (not e!406018))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64464 (= res!486090 (validMask!0 mask!3328))))

(assert (=> start!64464 e!406018))

(assert (=> start!64464 true))

(declare-fun array_inv!15408 (array!40982) Bool)

(assert (=> start!64464 (array_inv!15408 a!3186)))

(declare-fun b!724927 () Bool)

(declare-fun res!486083 () Bool)

(assert (=> b!724927 (=> (not res!486083) (not e!406017))))

(declare-datatypes ((List!13614 0))(
  ( (Nil!13611) (Cons!13610 (h!14667 (_ BitVec 64)) (t!19929 List!13614)) )
))
(declare-fun arrayNoDuplicates!0 (array!40982 (_ BitVec 32) List!13614) Bool)

(assert (=> b!724927 (= res!486083 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13611))))

(declare-fun b!724928 () Bool)

(declare-fun e!406019 () Bool)

(assert (=> b!724928 (= e!406019 (not true))))

(declare-fun e!406013 () Bool)

(assert (=> b!724928 e!406013))

(declare-fun res!486082 () Bool)

(assert (=> b!724928 (=> (not res!486082) (not e!406013))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40982 (_ BitVec 32)) Bool)

(assert (=> b!724928 (= res!486082 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24742 0))(
  ( (Unit!24743) )
))
(declare-fun lt!321170 () Unit!24742)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40982 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24742)

(assert (=> b!724928 (= lt!321170 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!724929 () Bool)

(declare-fun res!486085 () Bool)

(assert (=> b!724929 (=> (not res!486085) (not e!406016))))

(assert (=> b!724929 (= res!486085 e!406014)))

(declare-fun c!79792 () Bool)

(assert (=> b!724929 (= c!79792 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!724930 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40982 (_ BitVec 32)) SeekEntryResult!7212)

(assert (=> b!724930 (= e!406013 (= (seekEntryOrOpen!0 (select (arr!19612 a!3186) j!159) a!3186 mask!3328) (Found!7212 j!159)))))

(declare-fun b!724931 () Bool)

(assert (=> b!724931 (= e!406018 e!406017)))

(declare-fun res!486087 () Bool)

(assert (=> b!724931 (=> (not res!486087) (not e!406017))))

(declare-fun lt!321171 () SeekEntryResult!7212)

(assert (=> b!724931 (= res!486087 (or (= lt!321171 (MissingZero!7212 i!1173)) (= lt!321171 (MissingVacant!7212 i!1173))))))

(assert (=> b!724931 (= lt!321171 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!724932 () Bool)

(declare-fun res!486091 () Bool)

(assert (=> b!724932 (=> (not res!486091) (not e!406018))))

(assert (=> b!724932 (= res!486091 (and (= (size!20033 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20033 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20033 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!724933 () Bool)

(declare-fun res!486084 () Bool)

(assert (=> b!724933 (=> (not res!486084) (not e!406018))))

(assert (=> b!724933 (= res!486084 (validKeyInArray!0 k0!2102))))

(declare-fun b!724934 () Bool)

(declare-fun res!486095 () Bool)

(assert (=> b!724934 (=> (not res!486095) (not e!406017))))

(assert (=> b!724934 (= res!486095 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!724935 () Bool)

(assert (=> b!724935 (= e!406016 e!406019)))

(declare-fun res!486086 () Bool)

(assert (=> b!724935 (=> (not res!486086) (not e!406019))))

(declare-fun lt!321172 () (_ BitVec 64))

(declare-fun lt!321169 () array!40982)

(assert (=> b!724935 (= res!486086 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321172 mask!3328) lt!321172 lt!321169 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321172 lt!321169 mask!3328)))))

(assert (=> b!724935 (= lt!321172 (select (store (arr!19612 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!724935 (= lt!321169 (array!40983 (store (arr!19612 a!3186) i!1173 k0!2102) (size!20033 a!3186)))))

(assert (= (and start!64464 res!486090) b!724932))

(assert (= (and b!724932 res!486091) b!724922))

(assert (= (and b!724922 res!486088) b!724933))

(assert (= (and b!724933 res!486084) b!724920))

(assert (= (and b!724920 res!486093) b!724931))

(assert (= (and b!724931 res!486087) b!724934))

(assert (= (and b!724934 res!486095) b!724927))

(assert (= (and b!724927 res!486083) b!724924))

(assert (= (and b!724924 res!486094) b!724923))

(assert (= (and b!724923 res!486089) b!724925))

(assert (= (and b!724925 res!486092) b!724929))

(assert (= (and b!724929 c!79792) b!724926))

(assert (= (and b!724929 (not c!79792)) b!724921))

(assert (= (and b!724929 res!486085) b!724935))

(assert (= (and b!724935 res!486086) b!724928))

(assert (= (and b!724928 res!486082) b!724930))

(declare-fun m!679131 () Bool)

(assert (=> b!724923 m!679131))

(assert (=> b!724923 m!679131))

(declare-fun m!679133 () Bool)

(assert (=> b!724923 m!679133))

(assert (=> b!724923 m!679133))

(assert (=> b!724923 m!679131))

(declare-fun m!679135 () Bool)

(assert (=> b!724923 m!679135))

(assert (=> b!724921 m!679131))

(assert (=> b!724921 m!679131))

(declare-fun m!679137 () Bool)

(assert (=> b!724921 m!679137))

(declare-fun m!679139 () Bool)

(assert (=> b!724925 m!679139))

(declare-fun m!679141 () Bool)

(assert (=> start!64464 m!679141))

(declare-fun m!679143 () Bool)

(assert (=> start!64464 m!679143))

(declare-fun m!679145 () Bool)

(assert (=> b!724933 m!679145))

(declare-fun m!679147 () Bool)

(assert (=> b!724931 m!679147))

(declare-fun m!679149 () Bool)

(assert (=> b!724927 m!679149))

(declare-fun m!679151 () Bool)

(assert (=> b!724928 m!679151))

(declare-fun m!679153 () Bool)

(assert (=> b!724928 m!679153))

(assert (=> b!724930 m!679131))

(assert (=> b!724930 m!679131))

(declare-fun m!679155 () Bool)

(assert (=> b!724930 m!679155))

(declare-fun m!679157 () Bool)

(assert (=> b!724920 m!679157))

(assert (=> b!724926 m!679131))

(assert (=> b!724926 m!679131))

(declare-fun m!679159 () Bool)

(assert (=> b!724926 m!679159))

(declare-fun m!679161 () Bool)

(assert (=> b!724935 m!679161))

(declare-fun m!679163 () Bool)

(assert (=> b!724935 m!679163))

(declare-fun m!679165 () Bool)

(assert (=> b!724935 m!679165))

(declare-fun m!679167 () Bool)

(assert (=> b!724935 m!679167))

(assert (=> b!724935 m!679161))

(declare-fun m!679169 () Bool)

(assert (=> b!724935 m!679169))

(declare-fun m!679171 () Bool)

(assert (=> b!724934 m!679171))

(assert (=> b!724922 m!679131))

(assert (=> b!724922 m!679131))

(declare-fun m!679173 () Bool)

(assert (=> b!724922 m!679173))

(check-sat (not b!724928) (not b!724933) (not b!724935) (not b!724927) (not b!724930) (not b!724934) (not b!724926) (not b!724931) (not b!724923) (not b!724922) (not b!724921) (not b!724920) (not start!64464))
(check-sat)
