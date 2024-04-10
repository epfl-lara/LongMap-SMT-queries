; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67158 () Bool)

(assert start!67158)

(declare-datatypes ((array!42513 0))(
  ( (array!42514 (arr!20352 (Array (_ BitVec 32) (_ BitVec 64))) (size!20773 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42513)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7952 0))(
  ( (MissingZero!7952 (index!34176 (_ BitVec 32))) (Found!7952 (index!34177 (_ BitVec 32))) (Intermediate!7952 (undefined!8764 Bool) (index!34178 (_ BitVec 32)) (x!65119 (_ BitVec 32))) (Undefined!7952) (MissingVacant!7952 (index!34179 (_ BitVec 32))) )
))
(declare-fun lt!345837 () SeekEntryResult!7952)

(declare-fun b!776273 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!431984 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42513 (_ BitVec 32)) SeekEntryResult!7952)

(assert (=> b!776273 (= e!431984 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20352 a!3186) j!159) a!3186 mask!3328) lt!345837))))

(declare-fun b!776274 () Bool)

(declare-fun e!431988 () Bool)

(declare-fun e!431989 () Bool)

(assert (=> b!776274 (= e!431988 (not e!431989))))

(declare-fun res!525100 () Bool)

(assert (=> b!776274 (=> res!525100 e!431989)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!345838 () SeekEntryResult!7952)

(assert (=> b!776274 (= res!525100 (or (not (is-Intermediate!7952 lt!345838)) (bvslt x!1131 (x!65119 lt!345838)) (not (= x!1131 (x!65119 lt!345838))) (not (= index!1321 (index!34178 lt!345838)))))))

(declare-fun e!431986 () Bool)

(assert (=> b!776274 e!431986))

(declare-fun res!525097 () Bool)

(assert (=> b!776274 (=> (not res!525097) (not e!431986))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42513 (_ BitVec 32)) Bool)

(assert (=> b!776274 (= res!525097 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26798 0))(
  ( (Unit!26799) )
))
(declare-fun lt!345845 () Unit!26798)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42513 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26798)

(assert (=> b!776274 (= lt!345845 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!776275 () Bool)

(declare-fun e!431987 () Bool)

(declare-fun e!431985 () Bool)

(assert (=> b!776275 (= e!431987 e!431985)))

(declare-fun res!525105 () Bool)

(assert (=> b!776275 (=> (not res!525105) (not e!431985))))

(declare-fun lt!345843 () SeekEntryResult!7952)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!776275 (= res!525105 (or (= lt!345843 (MissingZero!7952 i!1173)) (= lt!345843 (MissingVacant!7952 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42513 (_ BitVec 32)) SeekEntryResult!7952)

(assert (=> b!776275 (= lt!345843 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!776276 () Bool)

(declare-fun res!525103 () Bool)

(assert (=> b!776276 (=> (not res!525103) (not e!431985))))

(declare-datatypes ((List!14354 0))(
  ( (Nil!14351) (Cons!14350 (h!15458 (_ BitVec 64)) (t!20669 List!14354)) )
))
(declare-fun arrayNoDuplicates!0 (array!42513 (_ BitVec 32) List!14354) Bool)

(assert (=> b!776276 (= res!525103 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14351))))

(declare-fun b!776277 () Bool)

(declare-fun res!525092 () Bool)

(assert (=> b!776277 (=> (not res!525092) (not e!431987))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!776277 (= res!525092 (validKeyInArray!0 k!2102))))

(declare-fun b!776278 () Bool)

(declare-fun res!525104 () Bool)

(assert (=> b!776278 (=> (not res!525104) (not e!431987))))

(declare-fun arrayContainsKey!0 (array!42513 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!776278 (= res!525104 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!776279 () Bool)

(declare-fun e!431982 () Bool)

(assert (=> b!776279 (= e!431982 e!431988)))

(declare-fun res!525107 () Bool)

(assert (=> b!776279 (=> (not res!525107) (not e!431988))))

(declare-fun lt!345841 () SeekEntryResult!7952)

(assert (=> b!776279 (= res!525107 (= lt!345841 lt!345838))))

(declare-fun lt!345839 () array!42513)

(declare-fun lt!345840 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42513 (_ BitVec 32)) SeekEntryResult!7952)

(assert (=> b!776279 (= lt!345838 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!345840 lt!345839 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!776279 (= lt!345841 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!345840 mask!3328) lt!345840 lt!345839 mask!3328))))

(assert (=> b!776279 (= lt!345840 (select (store (arr!20352 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!776279 (= lt!345839 (array!42514 (store (arr!20352 a!3186) i!1173 k!2102) (size!20773 a!3186)))))

(declare-fun b!776280 () Bool)

(declare-fun res!525099 () Bool)

(assert (=> b!776280 (=> (not res!525099) (not e!431982))))

(assert (=> b!776280 (= res!525099 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20352 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!776281 () Bool)

(assert (=> b!776281 (= e!431989 true)))

(declare-fun lt!345842 () SeekEntryResult!7952)

(assert (=> b!776281 (= lt!345842 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20352 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!776282 () Bool)

(declare-fun res!525106 () Bool)

(assert (=> b!776282 (=> (not res!525106) (not e!431985))))

(assert (=> b!776282 (= res!525106 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20773 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20773 a!3186))))))

(declare-fun b!776283 () Bool)

(declare-fun res!525093 () Bool)

(assert (=> b!776283 (=> (not res!525093) (not e!431987))))

(assert (=> b!776283 (= res!525093 (and (= (size!20773 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20773 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20773 a!3186)) (not (= i!1173 j!159))))))

(declare-fun e!431983 () Bool)

(declare-fun b!776272 () Bool)

(assert (=> b!776272 (= e!431983 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20352 a!3186) j!159) a!3186 mask!3328) (Found!7952 j!159)))))

(declare-fun res!525102 () Bool)

(assert (=> start!67158 (=> (not res!525102) (not e!431987))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67158 (= res!525102 (validMask!0 mask!3328))))

(assert (=> start!67158 e!431987))

(assert (=> start!67158 true))

(declare-fun array_inv!16148 (array!42513) Bool)

(assert (=> start!67158 (array_inv!16148 a!3186)))

(declare-fun b!776284 () Bool)

(declare-fun res!525096 () Bool)

(assert (=> b!776284 (=> (not res!525096) (not e!431987))))

(assert (=> b!776284 (= res!525096 (validKeyInArray!0 (select (arr!20352 a!3186) j!159)))))

(declare-fun b!776285 () Bool)

(assert (=> b!776285 (= e!431986 e!431984)))

(declare-fun res!525094 () Bool)

(assert (=> b!776285 (=> (not res!525094) (not e!431984))))

(assert (=> b!776285 (= res!525094 (= (seekEntryOrOpen!0 (select (arr!20352 a!3186) j!159) a!3186 mask!3328) lt!345837))))

(assert (=> b!776285 (= lt!345837 (Found!7952 j!159))))

(declare-fun b!776286 () Bool)

(declare-fun res!525101 () Bool)

(assert (=> b!776286 (=> (not res!525101) (not e!431985))))

(assert (=> b!776286 (= res!525101 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!776287 () Bool)

(declare-fun res!525098 () Bool)

(assert (=> b!776287 (=> (not res!525098) (not e!431982))))

(assert (=> b!776287 (= res!525098 e!431983)))

(declare-fun c!85990 () Bool)

(assert (=> b!776287 (= c!85990 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!776288 () Bool)

(declare-fun lt!345844 () SeekEntryResult!7952)

(assert (=> b!776288 (= e!431983 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20352 a!3186) j!159) a!3186 mask!3328) lt!345844))))

(declare-fun b!776289 () Bool)

(assert (=> b!776289 (= e!431985 e!431982)))

(declare-fun res!525095 () Bool)

(assert (=> b!776289 (=> (not res!525095) (not e!431982))))

(assert (=> b!776289 (= res!525095 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20352 a!3186) j!159) mask!3328) (select (arr!20352 a!3186) j!159) a!3186 mask!3328) lt!345844))))

(assert (=> b!776289 (= lt!345844 (Intermediate!7952 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!67158 res!525102) b!776283))

(assert (= (and b!776283 res!525093) b!776284))

(assert (= (and b!776284 res!525096) b!776277))

(assert (= (and b!776277 res!525092) b!776278))

(assert (= (and b!776278 res!525104) b!776275))

(assert (= (and b!776275 res!525105) b!776286))

(assert (= (and b!776286 res!525101) b!776276))

(assert (= (and b!776276 res!525103) b!776282))

(assert (= (and b!776282 res!525106) b!776289))

(assert (= (and b!776289 res!525095) b!776280))

(assert (= (and b!776280 res!525099) b!776287))

(assert (= (and b!776287 c!85990) b!776288))

(assert (= (and b!776287 (not c!85990)) b!776272))

(assert (= (and b!776287 res!525098) b!776279))

(assert (= (and b!776279 res!525107) b!776274))

(assert (= (and b!776274 res!525097) b!776285))

(assert (= (and b!776285 res!525094) b!776273))

(assert (= (and b!776274 (not res!525100)) b!776281))

(declare-fun m!720377 () Bool)

(assert (=> b!776280 m!720377))

(declare-fun m!720379 () Bool)

(assert (=> b!776285 m!720379))

(assert (=> b!776285 m!720379))

(declare-fun m!720381 () Bool)

(assert (=> b!776285 m!720381))

(declare-fun m!720383 () Bool)

(assert (=> b!776286 m!720383))

(assert (=> b!776281 m!720379))

(assert (=> b!776281 m!720379))

(declare-fun m!720385 () Bool)

(assert (=> b!776281 m!720385))

(assert (=> b!776272 m!720379))

(assert (=> b!776272 m!720379))

(assert (=> b!776272 m!720385))

(assert (=> b!776289 m!720379))

(assert (=> b!776289 m!720379))

(declare-fun m!720387 () Bool)

(assert (=> b!776289 m!720387))

(assert (=> b!776289 m!720387))

(assert (=> b!776289 m!720379))

(declare-fun m!720389 () Bool)

(assert (=> b!776289 m!720389))

(assert (=> b!776273 m!720379))

(assert (=> b!776273 m!720379))

(declare-fun m!720391 () Bool)

(assert (=> b!776273 m!720391))

(declare-fun m!720393 () Bool)

(assert (=> b!776278 m!720393))

(declare-fun m!720395 () Bool)

(assert (=> start!67158 m!720395))

(declare-fun m!720397 () Bool)

(assert (=> start!67158 m!720397))

(declare-fun m!720399 () Bool)

(assert (=> b!776277 m!720399))

(declare-fun m!720401 () Bool)

(assert (=> b!776276 m!720401))

(declare-fun m!720403 () Bool)

(assert (=> b!776279 m!720403))

(declare-fun m!720405 () Bool)

(assert (=> b!776279 m!720405))

(declare-fun m!720407 () Bool)

(assert (=> b!776279 m!720407))

(assert (=> b!776279 m!720405))

(declare-fun m!720409 () Bool)

(assert (=> b!776279 m!720409))

(declare-fun m!720411 () Bool)

(assert (=> b!776279 m!720411))

(assert (=> b!776288 m!720379))

(assert (=> b!776288 m!720379))

(declare-fun m!720413 () Bool)

(assert (=> b!776288 m!720413))

(assert (=> b!776284 m!720379))

(assert (=> b!776284 m!720379))

(declare-fun m!720415 () Bool)

(assert (=> b!776284 m!720415))

(declare-fun m!720417 () Bool)

(assert (=> b!776275 m!720417))

(declare-fun m!720419 () Bool)

(assert (=> b!776274 m!720419))

(declare-fun m!720421 () Bool)

(assert (=> b!776274 m!720421))

(push 1)

