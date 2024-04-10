; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65446 () Bool)

(assert start!65446)

(declare-fun b!745501 () Bool)

(declare-fun res!502375 () Bool)

(declare-fun e!416379 () Bool)

(assert (=> b!745501 (=> (not res!502375) (not e!416379))))

(declare-datatypes ((array!41619 0))(
  ( (array!41620 (arr!19923 (Array (_ BitVec 32) (_ BitVec 64))) (size!20344 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41619)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!745501 (= res!502375 (and (= (size!20344 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20344 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20344 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!745502 () Bool)

(declare-fun e!416378 () Bool)

(declare-fun e!416380 () Bool)

(assert (=> b!745502 (= e!416378 e!416380)))

(declare-fun res!502380 () Bool)

(assert (=> b!745502 (=> (not res!502380) (not e!416380))))

(declare-datatypes ((SeekEntryResult!7523 0))(
  ( (MissingZero!7523 (index!32460 (_ BitVec 32))) (Found!7523 (index!32461 (_ BitVec 32))) (Intermediate!7523 (undefined!8335 Bool) (index!32462 (_ BitVec 32)) (x!63417 (_ BitVec 32))) (Undefined!7523) (MissingVacant!7523 (index!32463 (_ BitVec 32))) )
))
(declare-fun lt!331211 () SeekEntryResult!7523)

(declare-fun lt!331205 () SeekEntryResult!7523)

(assert (=> b!745502 (= res!502380 (= lt!331211 lt!331205))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!331209 () array!41619)

(declare-fun lt!331206 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41619 (_ BitVec 32)) SeekEntryResult!7523)

(assert (=> b!745502 (= lt!331205 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!331206 lt!331209 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!745502 (= lt!331211 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!331206 mask!3328) lt!331206 lt!331209 mask!3328))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!745502 (= lt!331206 (select (store (arr!19923 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!745502 (= lt!331209 (array!41620 (store (arr!19923 a!3186) i!1173 k!2102) (size!20344 a!3186)))))

(declare-fun b!745503 () Bool)

(declare-fun res!502385 () Bool)

(declare-fun e!416375 () Bool)

(assert (=> b!745503 (=> (not res!502385) (not e!416375))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41619 (_ BitVec 32)) Bool)

(assert (=> b!745503 (= res!502385 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!745504 () Bool)

(declare-fun res!502373 () Bool)

(assert (=> b!745504 (=> (not res!502373) (not e!416375))))

(declare-datatypes ((List!13925 0))(
  ( (Nil!13922) (Cons!13921 (h!14993 (_ BitVec 64)) (t!20240 List!13925)) )
))
(declare-fun arrayNoDuplicates!0 (array!41619 (_ BitVec 32) List!13925) Bool)

(assert (=> b!745504 (= res!502373 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13922))))

(declare-fun b!745505 () Bool)

(declare-fun res!502377 () Bool)

(assert (=> b!745505 (=> (not res!502377) (not e!416378))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!745505 (= res!502377 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19923 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!745506 () Bool)

(declare-fun res!502382 () Bool)

(assert (=> b!745506 (=> (not res!502382) (not e!416375))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!745506 (= res!502382 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20344 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20344 a!3186))))))

(declare-fun b!745507 () Bool)

(assert (=> b!745507 (= e!416375 e!416378)))

(declare-fun res!502370 () Bool)

(assert (=> b!745507 (=> (not res!502370) (not e!416378))))

(declare-fun lt!331207 () SeekEntryResult!7523)

(assert (=> b!745507 (= res!502370 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19923 a!3186) j!159) mask!3328) (select (arr!19923 a!3186) j!159) a!3186 mask!3328) lt!331207))))

(assert (=> b!745507 (= lt!331207 (Intermediate!7523 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!745508 () Bool)

(declare-fun res!502372 () Bool)

(assert (=> b!745508 (=> (not res!502372) (not e!416379))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!745508 (= res!502372 (validKeyInArray!0 (select (arr!19923 a!3186) j!159)))))

(declare-fun b!745509 () Bool)

(declare-fun res!502383 () Bool)

(assert (=> b!745509 (=> (not res!502383) (not e!416379))))

(assert (=> b!745509 (= res!502383 (validKeyInArray!0 k!2102))))

(declare-fun b!745510 () Bool)

(declare-fun e!416377 () Bool)

(assert (=> b!745510 (= e!416380 (not e!416377))))

(declare-fun res!502378 () Bool)

(assert (=> b!745510 (=> res!502378 e!416377)))

(assert (=> b!745510 (= res!502378 (or (not (is-Intermediate!7523 lt!331205)) (bvslt x!1131 (x!63417 lt!331205)) (not (= x!1131 (x!63417 lt!331205))) (not (= index!1321 (index!32462 lt!331205)))))))

(declare-fun e!416381 () Bool)

(assert (=> b!745510 e!416381))

(declare-fun res!502371 () Bool)

(assert (=> b!745510 (=> (not res!502371) (not e!416381))))

(assert (=> b!745510 (= res!502371 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25526 0))(
  ( (Unit!25527) )
))
(declare-fun lt!331208 () Unit!25526)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41619 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25526)

(assert (=> b!745510 (= lt!331208 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!745511 () Bool)

(declare-fun res!502376 () Bool)

(assert (=> b!745511 (=> (not res!502376) (not e!416379))))

(declare-fun arrayContainsKey!0 (array!41619 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!745511 (= res!502376 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun res!502374 () Bool)

(assert (=> start!65446 (=> (not res!502374) (not e!416379))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65446 (= res!502374 (validMask!0 mask!3328))))

(assert (=> start!65446 e!416379))

(assert (=> start!65446 true))

(declare-fun array_inv!15719 (array!41619) Bool)

(assert (=> start!65446 (array_inv!15719 a!3186)))

(declare-fun b!745512 () Bool)

(assert (=> b!745512 (= e!416379 e!416375)))

(declare-fun res!502379 () Bool)

(assert (=> b!745512 (=> (not res!502379) (not e!416375))))

(declare-fun lt!331210 () SeekEntryResult!7523)

(assert (=> b!745512 (= res!502379 (or (= lt!331210 (MissingZero!7523 i!1173)) (= lt!331210 (MissingVacant!7523 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41619 (_ BitVec 32)) SeekEntryResult!7523)

(assert (=> b!745512 (= lt!331210 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!745513 () Bool)

(declare-fun res!502381 () Bool)

(assert (=> b!745513 (=> (not res!502381) (not e!416378))))

(declare-fun e!416374 () Bool)

(assert (=> b!745513 (= res!502381 e!416374)))

(declare-fun c!81946 () Bool)

(assert (=> b!745513 (= c!81946 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!745514 () Bool)

(declare-fun lt!331203 () SeekEntryResult!7523)

(declare-fun e!416376 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41619 (_ BitVec 32)) SeekEntryResult!7523)

(assert (=> b!745514 (= e!416376 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19923 a!3186) j!159) a!3186 mask!3328) lt!331203))))

(declare-fun b!745515 () Bool)

(assert (=> b!745515 (= e!416374 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19923 a!3186) j!159) a!3186 mask!3328) (Found!7523 j!159)))))

(declare-fun b!745516 () Bool)

(assert (=> b!745516 (= e!416377 true)))

(declare-fun lt!331204 () SeekEntryResult!7523)

(assert (=> b!745516 (= lt!331204 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19923 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!745517 () Bool)

(assert (=> b!745517 (= e!416374 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19923 a!3186) j!159) a!3186 mask!3328) lt!331207))))

(declare-fun b!745518 () Bool)

(assert (=> b!745518 (= e!416381 e!416376)))

(declare-fun res!502384 () Bool)

(assert (=> b!745518 (=> (not res!502384) (not e!416376))))

(assert (=> b!745518 (= res!502384 (= (seekEntryOrOpen!0 (select (arr!19923 a!3186) j!159) a!3186 mask!3328) lt!331203))))

(assert (=> b!745518 (= lt!331203 (Found!7523 j!159))))

(assert (= (and start!65446 res!502374) b!745501))

(assert (= (and b!745501 res!502375) b!745508))

(assert (= (and b!745508 res!502372) b!745509))

(assert (= (and b!745509 res!502383) b!745511))

(assert (= (and b!745511 res!502376) b!745512))

(assert (= (and b!745512 res!502379) b!745503))

(assert (= (and b!745503 res!502385) b!745504))

(assert (= (and b!745504 res!502373) b!745506))

(assert (= (and b!745506 res!502382) b!745507))

(assert (= (and b!745507 res!502370) b!745505))

(assert (= (and b!745505 res!502377) b!745513))

(assert (= (and b!745513 c!81946) b!745517))

(assert (= (and b!745513 (not c!81946)) b!745515))

(assert (= (and b!745513 res!502381) b!745502))

(assert (= (and b!745502 res!502380) b!745510))

(assert (= (and b!745510 res!502371) b!745518))

(assert (= (and b!745518 res!502384) b!745514))

(assert (= (and b!745510 (not res!502378)) b!745516))

(declare-fun m!695869 () Bool)

(assert (=> b!745509 m!695869))

(declare-fun m!695871 () Bool)

(assert (=> b!745502 m!695871))

(assert (=> b!745502 m!695871))

(declare-fun m!695873 () Bool)

(assert (=> b!745502 m!695873))

(declare-fun m!695875 () Bool)

(assert (=> b!745502 m!695875))

(declare-fun m!695877 () Bool)

(assert (=> b!745502 m!695877))

(declare-fun m!695879 () Bool)

(assert (=> b!745502 m!695879))

(declare-fun m!695881 () Bool)

(assert (=> b!745510 m!695881))

(declare-fun m!695883 () Bool)

(assert (=> b!745510 m!695883))

(declare-fun m!695885 () Bool)

(assert (=> b!745503 m!695885))

(declare-fun m!695887 () Bool)

(assert (=> b!745515 m!695887))

(assert (=> b!745515 m!695887))

(declare-fun m!695889 () Bool)

(assert (=> b!745515 m!695889))

(assert (=> b!745517 m!695887))

(assert (=> b!745517 m!695887))

(declare-fun m!695891 () Bool)

(assert (=> b!745517 m!695891))

(declare-fun m!695893 () Bool)

(assert (=> b!745504 m!695893))

(assert (=> b!745516 m!695887))

(assert (=> b!745516 m!695887))

(assert (=> b!745516 m!695889))

(assert (=> b!745514 m!695887))

(assert (=> b!745514 m!695887))

(declare-fun m!695895 () Bool)

(assert (=> b!745514 m!695895))

(assert (=> b!745518 m!695887))

(assert (=> b!745518 m!695887))

(declare-fun m!695897 () Bool)

(assert (=> b!745518 m!695897))

(assert (=> b!745508 m!695887))

(assert (=> b!745508 m!695887))

(declare-fun m!695899 () Bool)

(assert (=> b!745508 m!695899))

(declare-fun m!695901 () Bool)

(assert (=> b!745505 m!695901))

(assert (=> b!745507 m!695887))

(assert (=> b!745507 m!695887))

(declare-fun m!695903 () Bool)

(assert (=> b!745507 m!695903))

(assert (=> b!745507 m!695903))

(assert (=> b!745507 m!695887))

(declare-fun m!695905 () Bool)

(assert (=> b!745507 m!695905))

(declare-fun m!695907 () Bool)

(assert (=> start!65446 m!695907))

(declare-fun m!695909 () Bool)

(assert (=> start!65446 m!695909))

(declare-fun m!695911 () Bool)

(assert (=> b!745511 m!695911))

(declare-fun m!695913 () Bool)

(assert (=> b!745512 m!695913))

(push 1)

