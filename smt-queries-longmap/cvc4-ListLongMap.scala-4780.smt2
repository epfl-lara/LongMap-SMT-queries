; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65744 () Bool)

(assert start!65744)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41917 0))(
  ( (array!41918 (arr!20072 (Array (_ BitVec 32) (_ BitVec 64))) (size!20493 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41917)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun e!421094 () Bool)

(declare-fun b!755081 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7672 0))(
  ( (MissingZero!7672 (index!33056 (_ BitVec 32))) (Found!7672 (index!33057 (_ BitVec 32))) (Intermediate!7672 (undefined!8484 Bool) (index!33058 (_ BitVec 32)) (x!63958 (_ BitVec 32))) (Undefined!7672) (MissingVacant!7672 (index!33059 (_ BitVec 32))) )
))
(declare-fun lt!336081 () SeekEntryResult!7672)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41917 (_ BitVec 32)) SeekEntryResult!7672)

(assert (=> b!755081 (= e!421094 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20072 a!3186) j!159) a!3186 mask!3328) lt!336081))))

(declare-fun b!755082 () Bool)

(declare-fun res!510327 () Bool)

(declare-fun e!421097 () Bool)

(assert (=> b!755082 (=> (not res!510327) (not e!421097))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!755082 (= res!510327 (validKeyInArray!0 k!2102))))

(declare-fun b!755083 () Bool)

(declare-fun res!510331 () Bool)

(declare-fun e!421093 () Bool)

(assert (=> b!755083 (=> (not res!510331) (not e!421093))))

(declare-fun lt!336078 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!336083 () array!41917)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41917 (_ BitVec 32)) SeekEntryResult!7672)

(assert (=> b!755083 (= res!510331 (= (seekEntryOrOpen!0 lt!336078 lt!336083 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!336078 lt!336083 mask!3328)))))

(declare-fun b!755084 () Bool)

(declare-fun e!421090 () Bool)

(declare-fun e!421089 () Bool)

(assert (=> b!755084 (= e!421090 e!421089)))

(declare-fun res!510336 () Bool)

(assert (=> b!755084 (=> res!510336 e!421089)))

(declare-fun lt!336087 () SeekEntryResult!7672)

(assert (=> b!755084 (= res!510336 (not (= lt!336087 lt!336081)))))

(assert (=> b!755084 (= lt!336087 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20072 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!755085 () Bool)

(declare-fun e!421087 () Bool)

(assert (=> b!755085 (= e!421087 true)))

(assert (=> b!755085 e!421093))

(declare-fun res!510328 () Bool)

(assert (=> b!755085 (=> (not res!510328) (not e!421093))))

(declare-fun lt!336086 () (_ BitVec 64))

(assert (=> b!755085 (= res!510328 (= lt!336086 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!26068 0))(
  ( (Unit!26069) )
))
(declare-fun lt!336089 () Unit!26068)

(declare-fun e!421095 () Unit!26068)

(assert (=> b!755085 (= lt!336089 e!421095)))

(declare-fun c!82761 () Bool)

(assert (=> b!755085 (= c!82761 (= lt!336086 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!755086 () Bool)

(declare-fun res!510338 () Bool)

(declare-fun e!421086 () Bool)

(assert (=> b!755086 (=> (not res!510338) (not e!421086))))

(declare-datatypes ((List!14074 0))(
  ( (Nil!14071) (Cons!14070 (h!15142 (_ BitVec 64)) (t!20389 List!14074)) )
))
(declare-fun arrayNoDuplicates!0 (array!41917 (_ BitVec 32) List!14074) Bool)

(assert (=> b!755086 (= res!510338 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14071))))

(declare-fun b!755087 () Bool)

(declare-fun e!421091 () Bool)

(declare-fun e!421096 () Bool)

(assert (=> b!755087 (= e!421091 e!421096)))

(declare-fun res!510337 () Bool)

(assert (=> b!755087 (=> (not res!510337) (not e!421096))))

(declare-fun lt!336084 () SeekEntryResult!7672)

(declare-fun lt!336079 () SeekEntryResult!7672)

(assert (=> b!755087 (= res!510337 (= lt!336084 lt!336079))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41917 (_ BitVec 32)) SeekEntryResult!7672)

(assert (=> b!755087 (= lt!336079 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!336078 lt!336083 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!755087 (= lt!336084 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!336078 mask!3328) lt!336078 lt!336083 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!755087 (= lt!336078 (select (store (arr!20072 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!755087 (= lt!336083 (array!41918 (store (arr!20072 a!3186) i!1173 k!2102) (size!20493 a!3186)))))

(declare-fun e!421092 () Bool)

(declare-fun b!755088 () Bool)

(assert (=> b!755088 (= e!421092 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20072 a!3186) j!159) a!3186 mask!3328) (Found!7672 j!159)))))

(declare-fun b!755089 () Bool)

(declare-fun res!510325 () Bool)

(assert (=> b!755089 (=> (not res!510325) (not e!421097))))

(declare-fun arrayContainsKey!0 (array!41917 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!755089 (= res!510325 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!755090 () Bool)

(declare-fun res!510334 () Bool)

(assert (=> b!755090 (=> (not res!510334) (not e!421091))))

(assert (=> b!755090 (= res!510334 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20072 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!755091 () Bool)

(assert (=> b!755091 (= e!421096 (not e!421090))))

(declare-fun res!510321 () Bool)

(assert (=> b!755091 (=> res!510321 e!421090)))

(assert (=> b!755091 (= res!510321 (or (not (is-Intermediate!7672 lt!336079)) (bvslt x!1131 (x!63958 lt!336079)) (not (= x!1131 (x!63958 lt!336079))) (not (= index!1321 (index!33058 lt!336079)))))))

(assert (=> b!755091 e!421094))

(declare-fun res!510323 () Bool)

(assert (=> b!755091 (=> (not res!510323) (not e!421094))))

(declare-fun lt!336085 () SeekEntryResult!7672)

(assert (=> b!755091 (= res!510323 (= lt!336085 lt!336081))))

(assert (=> b!755091 (= lt!336081 (Found!7672 j!159))))

(assert (=> b!755091 (= lt!336085 (seekEntryOrOpen!0 (select (arr!20072 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41917 (_ BitVec 32)) Bool)

(assert (=> b!755091 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!336082 () Unit!26068)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41917 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26068)

(assert (=> b!755091 (= lt!336082 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!755092 () Bool)

(declare-fun res!510326 () Bool)

(assert (=> b!755092 (=> (not res!510326) (not e!421097))))

(assert (=> b!755092 (= res!510326 (and (= (size!20493 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20493 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20493 a!3186)) (not (= i!1173 j!159))))))

(declare-fun lt!336088 () SeekEntryResult!7672)

(declare-fun b!755093 () Bool)

(assert (=> b!755093 (= e!421092 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20072 a!3186) j!159) a!3186 mask!3328) lt!336088))))

(declare-fun b!755094 () Bool)

(assert (=> b!755094 (= e!421086 e!421091)))

(declare-fun res!510329 () Bool)

(assert (=> b!755094 (=> (not res!510329) (not e!421091))))

(assert (=> b!755094 (= res!510329 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20072 a!3186) j!159) mask!3328) (select (arr!20072 a!3186) j!159) a!3186 mask!3328) lt!336088))))

(assert (=> b!755094 (= lt!336088 (Intermediate!7672 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!755095 () Bool)

(declare-fun res!510322 () Bool)

(assert (=> b!755095 (=> (not res!510322) (not e!421097))))

(assert (=> b!755095 (= res!510322 (validKeyInArray!0 (select (arr!20072 a!3186) j!159)))))

(declare-fun res!510333 () Bool)

(assert (=> start!65744 (=> (not res!510333) (not e!421097))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65744 (= res!510333 (validMask!0 mask!3328))))

(assert (=> start!65744 e!421097))

(assert (=> start!65744 true))

(declare-fun array_inv!15868 (array!41917) Bool)

(assert (=> start!65744 (array_inv!15868 a!3186)))

(declare-fun b!755096 () Bool)

(declare-fun res!510332 () Bool)

(assert (=> b!755096 (=> (not res!510332) (not e!421086))))

(assert (=> b!755096 (= res!510332 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20493 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20493 a!3186))))))

(declare-fun b!755097 () Bool)

(assert (=> b!755097 (= e!421093 (= lt!336085 lt!336087))))

(declare-fun b!755098 () Bool)

(declare-fun res!510320 () Bool)

(assert (=> b!755098 (=> (not res!510320) (not e!421091))))

(assert (=> b!755098 (= res!510320 e!421092)))

(declare-fun c!82762 () Bool)

(assert (=> b!755098 (= c!82762 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!755099 () Bool)

(declare-fun Unit!26070 () Unit!26068)

(assert (=> b!755099 (= e!421095 Unit!26070)))

(declare-fun b!755100 () Bool)

(declare-fun res!510330 () Bool)

(assert (=> b!755100 (=> (not res!510330) (not e!421086))))

(assert (=> b!755100 (= res!510330 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!755101 () Bool)

(declare-fun Unit!26071 () Unit!26068)

(assert (=> b!755101 (= e!421095 Unit!26071)))

(assert (=> b!755101 false))

(declare-fun b!755102 () Bool)

(assert (=> b!755102 (= e!421089 e!421087)))

(declare-fun res!510335 () Bool)

(assert (=> b!755102 (=> res!510335 e!421087)))

(assert (=> b!755102 (= res!510335 (= lt!336086 lt!336078))))

(assert (=> b!755102 (= lt!336086 (select (store (arr!20072 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!755103 () Bool)

(assert (=> b!755103 (= e!421097 e!421086)))

(declare-fun res!510324 () Bool)

(assert (=> b!755103 (=> (not res!510324) (not e!421086))))

(declare-fun lt!336080 () SeekEntryResult!7672)

(assert (=> b!755103 (= res!510324 (or (= lt!336080 (MissingZero!7672 i!1173)) (= lt!336080 (MissingVacant!7672 i!1173))))))

(assert (=> b!755103 (= lt!336080 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(assert (= (and start!65744 res!510333) b!755092))

(assert (= (and b!755092 res!510326) b!755095))

(assert (= (and b!755095 res!510322) b!755082))

(assert (= (and b!755082 res!510327) b!755089))

(assert (= (and b!755089 res!510325) b!755103))

(assert (= (and b!755103 res!510324) b!755100))

(assert (= (and b!755100 res!510330) b!755086))

(assert (= (and b!755086 res!510338) b!755096))

(assert (= (and b!755096 res!510332) b!755094))

(assert (= (and b!755094 res!510329) b!755090))

(assert (= (and b!755090 res!510334) b!755098))

(assert (= (and b!755098 c!82762) b!755093))

(assert (= (and b!755098 (not c!82762)) b!755088))

(assert (= (and b!755098 res!510320) b!755087))

(assert (= (and b!755087 res!510337) b!755091))

(assert (= (and b!755091 res!510323) b!755081))

(assert (= (and b!755091 (not res!510321)) b!755084))

(assert (= (and b!755084 (not res!510336)) b!755102))

(assert (= (and b!755102 (not res!510335)) b!755085))

(assert (= (and b!755085 c!82761) b!755101))

(assert (= (and b!755085 (not c!82761)) b!755099))

(assert (= (and b!755085 res!510328) b!755083))

(assert (= (and b!755083 res!510331) b!755097))

(declare-fun m!703371 () Bool)

(assert (=> b!755102 m!703371))

(declare-fun m!703373 () Bool)

(assert (=> b!755102 m!703373))

(declare-fun m!703375 () Bool)

(assert (=> b!755091 m!703375))

(assert (=> b!755091 m!703375))

(declare-fun m!703377 () Bool)

(assert (=> b!755091 m!703377))

(declare-fun m!703379 () Bool)

(assert (=> b!755091 m!703379))

(declare-fun m!703381 () Bool)

(assert (=> b!755091 m!703381))

(declare-fun m!703383 () Bool)

(assert (=> b!755082 m!703383))

(declare-fun m!703385 () Bool)

(assert (=> b!755103 m!703385))

(declare-fun m!703387 () Bool)

(assert (=> b!755089 m!703387))

(assert (=> b!755093 m!703375))

(assert (=> b!755093 m!703375))

(declare-fun m!703389 () Bool)

(assert (=> b!755093 m!703389))

(assert (=> b!755081 m!703375))

(assert (=> b!755081 m!703375))

(declare-fun m!703391 () Bool)

(assert (=> b!755081 m!703391))

(declare-fun m!703393 () Bool)

(assert (=> b!755086 m!703393))

(assert (=> b!755084 m!703375))

(assert (=> b!755084 m!703375))

(declare-fun m!703395 () Bool)

(assert (=> b!755084 m!703395))

(declare-fun m!703397 () Bool)

(assert (=> start!65744 m!703397))

(declare-fun m!703399 () Bool)

(assert (=> start!65744 m!703399))

(assert (=> b!755094 m!703375))

(assert (=> b!755094 m!703375))

(declare-fun m!703401 () Bool)

(assert (=> b!755094 m!703401))

(assert (=> b!755094 m!703401))

(assert (=> b!755094 m!703375))

(declare-fun m!703403 () Bool)

(assert (=> b!755094 m!703403))

(declare-fun m!703405 () Bool)

(assert (=> b!755090 m!703405))

(assert (=> b!755088 m!703375))

(assert (=> b!755088 m!703375))

(assert (=> b!755088 m!703395))

(declare-fun m!703407 () Bool)

(assert (=> b!755100 m!703407))

(assert (=> b!755095 m!703375))

(assert (=> b!755095 m!703375))

(declare-fun m!703409 () Bool)

(assert (=> b!755095 m!703409))

(declare-fun m!703411 () Bool)

(assert (=> b!755083 m!703411))

(declare-fun m!703413 () Bool)

(assert (=> b!755083 m!703413))

(declare-fun m!703415 () Bool)

(assert (=> b!755087 m!703415))

(assert (=> b!755087 m!703371))

(declare-fun m!703417 () Bool)

(assert (=> b!755087 m!703417))

(declare-fun m!703419 () Bool)

(assert (=> b!755087 m!703419))

(assert (=> b!755087 m!703419))

(declare-fun m!703421 () Bool)

(assert (=> b!755087 m!703421))

(push 1)

