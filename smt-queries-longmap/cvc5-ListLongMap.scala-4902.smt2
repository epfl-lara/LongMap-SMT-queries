; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67656 () Bool)

(assert start!67656)

(declare-fun b!783360 () Bool)

(declare-datatypes ((Unit!27032 0))(
  ( (Unit!27033) )
))
(declare-fun e!435576 () Unit!27032)

(declare-fun Unit!27034 () Unit!27032)

(assert (=> b!783360 (= e!435576 Unit!27034)))

(assert (=> b!783360 false))

(declare-fun b!783361 () Bool)

(declare-fun res!529949 () Bool)

(declare-fun e!435570 () Bool)

(assert (=> b!783361 (=> (not res!529949) (not e!435570))))

(declare-datatypes ((array!42696 0))(
  ( (array!42697 (arr!20436 (Array (_ BitVec 32) (_ BitVec 64))) (size!20857 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42696)

(declare-datatypes ((List!14438 0))(
  ( (Nil!14435) (Cons!14434 (h!15557 (_ BitVec 64)) (t!20753 List!14438)) )
))
(declare-fun arrayNoDuplicates!0 (array!42696 (_ BitVec 32) List!14438) Bool)

(assert (=> b!783361 (= res!529949 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14435))))

(declare-fun b!783362 () Bool)

(declare-fun e!435574 () Bool)

(declare-fun e!435568 () Bool)

(assert (=> b!783362 (= e!435574 e!435568)))

(declare-fun res!529959 () Bool)

(assert (=> b!783362 (=> (not res!529959) (not e!435568))))

(declare-datatypes ((SeekEntryResult!8036 0))(
  ( (MissingZero!8036 (index!34512 (_ BitVec 32))) (Found!8036 (index!34513 (_ BitVec 32))) (Intermediate!8036 (undefined!8848 Bool) (index!34514 (_ BitVec 32)) (x!65472 (_ BitVec 32))) (Undefined!8036) (MissingVacant!8036 (index!34515 (_ BitVec 32))) )
))
(declare-fun lt!349121 () SeekEntryResult!8036)

(declare-fun lt!349123 () SeekEntryResult!8036)

(assert (=> b!783362 (= res!529959 (= lt!349121 lt!349123))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!349130 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!349125 () array!42696)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42696 (_ BitVec 32)) SeekEntryResult!8036)

(assert (=> b!783362 (= lt!349123 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!349130 lt!349125 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!783362 (= lt!349121 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!349130 mask!3328) lt!349130 lt!349125 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!783362 (= lt!349130 (select (store (arr!20436 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!783362 (= lt!349125 (array!42697 (store (arr!20436 a!3186) i!1173 k!2102) (size!20857 a!3186)))))

(declare-fun b!783363 () Bool)

(declare-fun res!529963 () Bool)

(declare-fun e!435577 () Bool)

(assert (=> b!783363 (=> (not res!529963) (not e!435577))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!783363 (= res!529963 (validKeyInArray!0 (select (arr!20436 a!3186) j!159)))))

(declare-fun b!783364 () Bool)

(declare-fun res!529961 () Bool)

(declare-fun e!435572 () Bool)

(assert (=> b!783364 (=> res!529961 e!435572)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun lt!349127 () SeekEntryResult!8036)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42696 (_ BitVec 32)) SeekEntryResult!8036)

(assert (=> b!783364 (= res!529961 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20436 a!3186) j!159) a!3186 mask!3328) lt!349127)))))

(declare-fun b!783365 () Bool)

(assert (=> b!783365 (= e!435568 (not e!435572))))

(declare-fun res!529956 () Bool)

(assert (=> b!783365 (=> res!529956 e!435572)))

(assert (=> b!783365 (= res!529956 (or (not (is-Intermediate!8036 lt!349123)) (bvslt x!1131 (x!65472 lt!349123)) (not (= x!1131 (x!65472 lt!349123))) (not (= index!1321 (index!34514 lt!349123)))))))

(declare-fun e!435578 () Bool)

(assert (=> b!783365 e!435578))

(declare-fun res!529953 () Bool)

(assert (=> b!783365 (=> (not res!529953) (not e!435578))))

(declare-fun lt!349124 () SeekEntryResult!8036)

(assert (=> b!783365 (= res!529953 (= lt!349124 lt!349127))))

(assert (=> b!783365 (= lt!349127 (Found!8036 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42696 (_ BitVec 32)) SeekEntryResult!8036)

(assert (=> b!783365 (= lt!349124 (seekEntryOrOpen!0 (select (arr!20436 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42696 (_ BitVec 32)) Bool)

(assert (=> b!783365 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!349129 () Unit!27032)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42696 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27032)

(assert (=> b!783365 (= lt!349129 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!783366 () Bool)

(declare-fun res!529952 () Bool)

(assert (=> b!783366 (=> (not res!529952) (not e!435577))))

(assert (=> b!783366 (= res!529952 (and (= (size!20857 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20857 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20857 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!529955 () Bool)

(assert (=> start!67656 (=> (not res!529955) (not e!435577))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67656 (= res!529955 (validMask!0 mask!3328))))

(assert (=> start!67656 e!435577))

(assert (=> start!67656 true))

(declare-fun array_inv!16232 (array!42696) Bool)

(assert (=> start!67656 (array_inv!16232 a!3186)))

(declare-fun b!783367 () Bool)

(declare-fun res!529950 () Bool)

(assert (=> b!783367 (=> (not res!529950) (not e!435577))))

(declare-fun arrayContainsKey!0 (array!42696 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!783367 (= res!529950 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!783368 () Bool)

(assert (=> b!783368 (= e!435577 e!435570)))

(declare-fun res!529948 () Bool)

(assert (=> b!783368 (=> (not res!529948) (not e!435570))))

(declare-fun lt!349122 () SeekEntryResult!8036)

(assert (=> b!783368 (= res!529948 (or (= lt!349122 (MissingZero!8036 i!1173)) (= lt!349122 (MissingVacant!8036 i!1173))))))

(assert (=> b!783368 (= lt!349122 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!783369 () Bool)

(declare-fun res!529957 () Bool)

(assert (=> b!783369 (=> (not res!529957) (not e!435570))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!783369 (= res!529957 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20857 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20857 a!3186))))))

(declare-fun b!783370 () Bool)

(declare-fun res!529947 () Bool)

(assert (=> b!783370 (=> (not res!529947) (not e!435577))))

(assert (=> b!783370 (= res!529947 (validKeyInArray!0 k!2102))))

(declare-fun b!783371 () Bool)

(assert (=> b!783371 (= e!435570 e!435574)))

(declare-fun res!529964 () Bool)

(assert (=> b!783371 (=> (not res!529964) (not e!435574))))

(declare-fun lt!349128 () SeekEntryResult!8036)

(assert (=> b!783371 (= res!529964 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20436 a!3186) j!159) mask!3328) (select (arr!20436 a!3186) j!159) a!3186 mask!3328) lt!349128))))

(assert (=> b!783371 (= lt!349128 (Intermediate!8036 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!783372 () Bool)

(declare-fun e!435571 () Bool)

(assert (=> b!783372 (= e!435571 true)))

(declare-fun e!435575 () Bool)

(assert (=> b!783372 e!435575))

(declare-fun res!529954 () Bool)

(assert (=> b!783372 (=> (not res!529954) (not e!435575))))

(declare-fun lt!349120 () (_ BitVec 64))

(assert (=> b!783372 (= res!529954 (= lt!349120 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!349126 () Unit!27032)

(assert (=> b!783372 (= lt!349126 e!435576)))

(declare-fun c!87115 () Bool)

(assert (=> b!783372 (= c!87115 (= lt!349120 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!783373 () Bool)

(assert (=> b!783373 (= e!435578 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20436 a!3186) j!159) a!3186 mask!3328) lt!349127))))

(declare-fun b!783374 () Bool)

(assert (=> b!783374 (= e!435575 (= (seekEntryOrOpen!0 lt!349130 lt!349125 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!349130 lt!349125 mask!3328)))))

(declare-fun e!435573 () Bool)

(declare-fun b!783375 () Bool)

(assert (=> b!783375 (= e!435573 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20436 a!3186) j!159) a!3186 mask!3328) lt!349128))))

(declare-fun b!783376 () Bool)

(assert (=> b!783376 (= e!435573 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20436 a!3186) j!159) a!3186 mask!3328) (Found!8036 j!159)))))

(declare-fun b!783377 () Bool)

(assert (=> b!783377 (= e!435572 e!435571)))

(declare-fun res!529962 () Bool)

(assert (=> b!783377 (=> res!529962 e!435571)))

(assert (=> b!783377 (= res!529962 (= lt!349120 lt!349130))))

(assert (=> b!783377 (= lt!349120 (select (store (arr!20436 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!783378 () Bool)

(declare-fun res!529951 () Bool)

(assert (=> b!783378 (=> (not res!529951) (not e!435574))))

(assert (=> b!783378 (= res!529951 e!435573)))

(declare-fun c!87114 () Bool)

(assert (=> b!783378 (= c!87114 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!783379 () Bool)

(declare-fun res!529958 () Bool)

(assert (=> b!783379 (=> (not res!529958) (not e!435570))))

(assert (=> b!783379 (= res!529958 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!783380 () Bool)

(declare-fun Unit!27035 () Unit!27032)

(assert (=> b!783380 (= e!435576 Unit!27035)))

(declare-fun b!783381 () Bool)

(declare-fun res!529960 () Bool)

(assert (=> b!783381 (=> (not res!529960) (not e!435574))))

(assert (=> b!783381 (= res!529960 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20436 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!67656 res!529955) b!783366))

(assert (= (and b!783366 res!529952) b!783363))

(assert (= (and b!783363 res!529963) b!783370))

(assert (= (and b!783370 res!529947) b!783367))

(assert (= (and b!783367 res!529950) b!783368))

(assert (= (and b!783368 res!529948) b!783379))

(assert (= (and b!783379 res!529958) b!783361))

(assert (= (and b!783361 res!529949) b!783369))

(assert (= (and b!783369 res!529957) b!783371))

(assert (= (and b!783371 res!529964) b!783381))

(assert (= (and b!783381 res!529960) b!783378))

(assert (= (and b!783378 c!87114) b!783375))

(assert (= (and b!783378 (not c!87114)) b!783376))

(assert (= (and b!783378 res!529951) b!783362))

(assert (= (and b!783362 res!529959) b!783365))

(assert (= (and b!783365 res!529953) b!783373))

(assert (= (and b!783365 (not res!529956)) b!783364))

(assert (= (and b!783364 (not res!529961)) b!783377))

(assert (= (and b!783377 (not res!529962)) b!783372))

(assert (= (and b!783372 c!87115) b!783360))

(assert (= (and b!783372 (not c!87115)) b!783380))

(assert (= (and b!783372 res!529954) b!783374))

(declare-fun m!725933 () Bool)

(assert (=> b!783363 m!725933))

(assert (=> b!783363 m!725933))

(declare-fun m!725935 () Bool)

(assert (=> b!783363 m!725935))

(declare-fun m!725937 () Bool)

(assert (=> b!783361 m!725937))

(assert (=> b!783364 m!725933))

(assert (=> b!783364 m!725933))

(declare-fun m!725939 () Bool)

(assert (=> b!783364 m!725939))

(declare-fun m!725941 () Bool)

(assert (=> b!783377 m!725941))

(declare-fun m!725943 () Bool)

(assert (=> b!783377 m!725943))

(declare-fun m!725945 () Bool)

(assert (=> b!783368 m!725945))

(declare-fun m!725947 () Bool)

(assert (=> b!783367 m!725947))

(assert (=> b!783373 m!725933))

(assert (=> b!783373 m!725933))

(declare-fun m!725949 () Bool)

(assert (=> b!783373 m!725949))

(declare-fun m!725951 () Bool)

(assert (=> b!783379 m!725951))

(assert (=> b!783365 m!725933))

(assert (=> b!783365 m!725933))

(declare-fun m!725953 () Bool)

(assert (=> b!783365 m!725953))

(declare-fun m!725955 () Bool)

(assert (=> b!783365 m!725955))

(declare-fun m!725957 () Bool)

(assert (=> b!783365 m!725957))

(declare-fun m!725959 () Bool)

(assert (=> start!67656 m!725959))

(declare-fun m!725961 () Bool)

(assert (=> start!67656 m!725961))

(assert (=> b!783376 m!725933))

(assert (=> b!783376 m!725933))

(assert (=> b!783376 m!725939))

(declare-fun m!725963 () Bool)

(assert (=> b!783381 m!725963))

(assert (=> b!783371 m!725933))

(assert (=> b!783371 m!725933))

(declare-fun m!725965 () Bool)

(assert (=> b!783371 m!725965))

(assert (=> b!783371 m!725965))

(assert (=> b!783371 m!725933))

(declare-fun m!725967 () Bool)

(assert (=> b!783371 m!725967))

(declare-fun m!725969 () Bool)

(assert (=> b!783362 m!725969))

(assert (=> b!783362 m!725941))

(assert (=> b!783362 m!725969))

(declare-fun m!725971 () Bool)

(assert (=> b!783362 m!725971))

(declare-fun m!725973 () Bool)

(assert (=> b!783362 m!725973))

(declare-fun m!725975 () Bool)

(assert (=> b!783362 m!725975))

(assert (=> b!783375 m!725933))

(assert (=> b!783375 m!725933))

(declare-fun m!725977 () Bool)

(assert (=> b!783375 m!725977))

(declare-fun m!725979 () Bool)

(assert (=> b!783370 m!725979))

(declare-fun m!725981 () Bool)

(assert (=> b!783374 m!725981))

(declare-fun m!725983 () Bool)

(assert (=> b!783374 m!725983))

(push 1)

