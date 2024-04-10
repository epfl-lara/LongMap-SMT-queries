; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67912 () Bool)

(assert start!67912)

(declare-fun b!790317 () Bool)

(declare-fun res!535447 () Bool)

(declare-fun e!439253 () Bool)

(assert (=> b!790317 (=> (not res!535447) (not e!439253))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!790317 (= res!535447 (validKeyInArray!0 k!2102))))

(declare-fun b!790318 () Bool)

(declare-datatypes ((Unit!27412 0))(
  ( (Unit!27413) )
))
(declare-fun e!439258 () Unit!27412)

(declare-fun Unit!27414 () Unit!27412)

(assert (=> b!790318 (= e!439258 Unit!27414)))

(declare-fun b!790319 () Bool)

(declare-fun e!439261 () Bool)

(declare-fun e!439251 () Bool)

(assert (=> b!790319 (= e!439261 e!439251)))

(declare-fun res!535437 () Bool)

(assert (=> b!790319 (=> res!535437 e!439251)))

(declare-datatypes ((SeekEntryResult!8131 0))(
  ( (MissingZero!8131 (index!34892 (_ BitVec 32))) (Found!8131 (index!34893 (_ BitVec 32))) (Intermediate!8131 (undefined!8943 Bool) (index!34894 (_ BitVec 32)) (x!65824 (_ BitVec 32))) (Undefined!8131) (MissingVacant!8131 (index!34895 (_ BitVec 32))) )
))
(declare-fun lt!352831 () SeekEntryResult!8131)

(declare-fun lt!352830 () SeekEntryResult!8131)

(assert (=> b!790319 (= res!535437 (not (= lt!352831 lt!352830)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42889 0))(
  ( (array!42890 (arr!20531 (Array (_ BitVec 32) (_ BitVec 64))) (size!20952 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42889)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42889 (_ BitVec 32)) SeekEntryResult!8131)

(assert (=> b!790319 (= lt!352831 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20531 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!790320 () Bool)

(declare-fun res!535438 () Bool)

(assert (=> b!790320 (=> (not res!535438) (not e!439253))))

(declare-fun arrayContainsKey!0 (array!42889 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!790320 (= res!535438 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!790321 () Bool)

(declare-fun res!535449 () Bool)

(declare-fun e!439262 () Bool)

(assert (=> b!790321 (=> (not res!535449) (not e!439262))))

(declare-fun e!439256 () Bool)

(assert (=> b!790321 (= res!535449 e!439256)))

(declare-fun c!87850 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!790321 (= c!87850 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!535446 () Bool)

(assert (=> start!67912 (=> (not res!535446) (not e!439253))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67912 (= res!535446 (validMask!0 mask!3328))))

(assert (=> start!67912 e!439253))

(assert (=> start!67912 true))

(declare-fun array_inv!16327 (array!42889) Bool)

(assert (=> start!67912 (array_inv!16327 a!3186)))

(declare-fun b!790322 () Bool)

(declare-fun e!439252 () Bool)

(assert (=> b!790322 (= e!439253 e!439252)))

(declare-fun res!535450 () Bool)

(assert (=> b!790322 (=> (not res!535450) (not e!439252))))

(declare-fun lt!352822 () SeekEntryResult!8131)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!790322 (= res!535450 (or (= lt!352822 (MissingZero!8131 i!1173)) (= lt!352822 (MissingVacant!8131 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42889 (_ BitVec 32)) SeekEntryResult!8131)

(assert (=> b!790322 (= lt!352822 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!790323 () Bool)

(declare-fun res!535454 () Bool)

(assert (=> b!790323 (=> (not res!535454) (not e!439252))))

(declare-datatypes ((List!14533 0))(
  ( (Nil!14530) (Cons!14529 (h!15655 (_ BitVec 64)) (t!20848 List!14533)) )
))
(declare-fun arrayNoDuplicates!0 (array!42889 (_ BitVec 32) List!14533) Bool)

(assert (=> b!790323 (= res!535454 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14530))))

(declare-fun b!790324 () Bool)

(assert (=> b!790324 (= e!439256 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20531 a!3186) j!159) a!3186 mask!3328) (Found!8131 j!159)))))

(declare-fun b!790325 () Bool)

(declare-fun res!535452 () Bool)

(assert (=> b!790325 (=> (not res!535452) (not e!439262))))

(assert (=> b!790325 (= res!535452 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20531 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!790326 () Bool)

(declare-fun e!439259 () Bool)

(assert (=> b!790326 (= e!439259 (not e!439261))))

(declare-fun res!535442 () Bool)

(assert (=> b!790326 (=> res!535442 e!439261)))

(declare-fun lt!352832 () SeekEntryResult!8131)

(assert (=> b!790326 (= res!535442 (or (not (is-Intermediate!8131 lt!352832)) (bvslt x!1131 (x!65824 lt!352832)) (not (= x!1131 (x!65824 lt!352832))) (not (= index!1321 (index!34894 lt!352832)))))))

(declare-fun e!439260 () Bool)

(assert (=> b!790326 e!439260))

(declare-fun res!535448 () Bool)

(assert (=> b!790326 (=> (not res!535448) (not e!439260))))

(declare-fun lt!352820 () SeekEntryResult!8131)

(assert (=> b!790326 (= res!535448 (= lt!352820 lt!352830))))

(assert (=> b!790326 (= lt!352830 (Found!8131 j!159))))

(assert (=> b!790326 (= lt!352820 (seekEntryOrOpen!0 (select (arr!20531 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42889 (_ BitVec 32)) Bool)

(assert (=> b!790326 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!352824 () Unit!27412)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42889 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27412)

(assert (=> b!790326 (= lt!352824 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!790327 () Bool)

(assert (=> b!790327 (= e!439262 e!439259)))

(declare-fun res!535445 () Bool)

(assert (=> b!790327 (=> (not res!535445) (not e!439259))))

(declare-fun lt!352826 () SeekEntryResult!8131)

(assert (=> b!790327 (= res!535445 (= lt!352826 lt!352832))))

(declare-fun lt!352818 () (_ BitVec 64))

(declare-fun lt!352821 () array!42889)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42889 (_ BitVec 32)) SeekEntryResult!8131)

(assert (=> b!790327 (= lt!352832 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!352818 lt!352821 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!790327 (= lt!352826 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!352818 mask!3328) lt!352818 lt!352821 mask!3328))))

(assert (=> b!790327 (= lt!352818 (select (store (arr!20531 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!790327 (= lt!352821 (array!42890 (store (arr!20531 a!3186) i!1173 k!2102) (size!20952 a!3186)))))

(declare-fun b!790328 () Bool)

(declare-fun res!535439 () Bool)

(assert (=> b!790328 (=> (not res!535439) (not e!439253))))

(assert (=> b!790328 (= res!535439 (validKeyInArray!0 (select (arr!20531 a!3186) j!159)))))

(declare-fun b!790329 () Bool)

(assert (=> b!790329 (= e!439252 e!439262)))

(declare-fun res!535444 () Bool)

(assert (=> b!790329 (=> (not res!535444) (not e!439262))))

(declare-fun lt!352829 () SeekEntryResult!8131)

(assert (=> b!790329 (= res!535444 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20531 a!3186) j!159) mask!3328) (select (arr!20531 a!3186) j!159) a!3186 mask!3328) lt!352829))))

(assert (=> b!790329 (= lt!352829 (Intermediate!8131 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!790330 () Bool)

(declare-fun res!535441 () Bool)

(assert (=> b!790330 (=> (not res!535441) (not e!439252))))

(assert (=> b!790330 (= res!535441 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!790331 () Bool)

(declare-fun e!439254 () Bool)

(assert (=> b!790331 (= e!439251 e!439254)))

(declare-fun res!535443 () Bool)

(assert (=> b!790331 (=> res!535443 e!439254)))

(declare-fun lt!352823 () (_ BitVec 64))

(assert (=> b!790331 (= res!535443 (= lt!352823 lt!352818))))

(assert (=> b!790331 (= lt!352823 (select (store (arr!20531 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!790332 () Bool)

(declare-fun Unit!27415 () Unit!27412)

(assert (=> b!790332 (= e!439258 Unit!27415)))

(assert (=> b!790332 false))

(declare-fun b!790333 () Bool)

(assert (=> b!790333 (= e!439256 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20531 a!3186) j!159) a!3186 mask!3328) lt!352829))))

(declare-fun b!790334 () Bool)

(declare-fun e!439255 () Bool)

(assert (=> b!790334 (= e!439254 e!439255)))

(declare-fun res!535440 () Bool)

(assert (=> b!790334 (=> res!535440 e!439255)))

(assert (=> b!790334 (= res!535440 (or (not (= (select (arr!20531 a!3186) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)) (= index!1321 resIntermediateIndex!5)))))

(declare-fun lt!352825 () SeekEntryResult!8131)

(declare-fun lt!352819 () SeekEntryResult!8131)

(assert (=> b!790334 (and (= lt!352819 lt!352825) (= lt!352820 lt!352831))))

(assert (=> b!790334 (= lt!352825 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!352818 lt!352821 mask!3328))))

(assert (=> b!790334 (= lt!352819 (seekEntryOrOpen!0 lt!352818 lt!352821 mask!3328))))

(assert (=> b!790334 (= lt!352823 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!352828 () Unit!27412)

(assert (=> b!790334 (= lt!352828 e!439258)))

(declare-fun c!87849 () Bool)

(assert (=> b!790334 (= c!87849 (= lt!352823 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!790335 () Bool)

(declare-fun res!535453 () Bool)

(assert (=> b!790335 (=> (not res!535453) (not e!439253))))

(assert (=> b!790335 (= res!535453 (and (= (size!20952 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20952 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20952 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!790336 () Bool)

(declare-fun res!535451 () Bool)

(assert (=> b!790336 (=> (not res!535451) (not e!439252))))

(assert (=> b!790336 (= res!535451 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20952 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20952 a!3186))))))

(declare-fun b!790337 () Bool)

(assert (=> b!790337 (= e!439255 (= lt!352819 lt!352830))))

(assert (=> b!790337 (= lt!352825 lt!352831)))

(declare-fun lt!352827 () Unit!27412)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!42889 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27412)

(assert (=> b!790337 (= lt!352827 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3186 i!1173 k!2102 j!159 index!1321 x!1131 resIntermediateIndex!5 index!1321 mask!3328))))

(declare-fun b!790338 () Bool)

(assert (=> b!790338 (= e!439260 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20531 a!3186) j!159) a!3186 mask!3328) lt!352830))))

(assert (= (and start!67912 res!535446) b!790335))

(assert (= (and b!790335 res!535453) b!790328))

(assert (= (and b!790328 res!535439) b!790317))

(assert (= (and b!790317 res!535447) b!790320))

(assert (= (and b!790320 res!535438) b!790322))

(assert (= (and b!790322 res!535450) b!790330))

(assert (= (and b!790330 res!535441) b!790323))

(assert (= (and b!790323 res!535454) b!790336))

(assert (= (and b!790336 res!535451) b!790329))

(assert (= (and b!790329 res!535444) b!790325))

(assert (= (and b!790325 res!535452) b!790321))

(assert (= (and b!790321 c!87850) b!790333))

(assert (= (and b!790321 (not c!87850)) b!790324))

(assert (= (and b!790321 res!535449) b!790327))

(assert (= (and b!790327 res!535445) b!790326))

(assert (= (and b!790326 res!535448) b!790338))

(assert (= (and b!790326 (not res!535442)) b!790319))

(assert (= (and b!790319 (not res!535437)) b!790331))

(assert (= (and b!790331 (not res!535443)) b!790334))

(assert (= (and b!790334 c!87849) b!790332))

(assert (= (and b!790334 (not c!87849)) b!790318))

(assert (= (and b!790334 (not res!535440)) b!790337))

(declare-fun m!731253 () Bool)

(assert (=> b!790317 m!731253))

(declare-fun m!731255 () Bool)

(assert (=> b!790322 m!731255))

(declare-fun m!731257 () Bool)

(assert (=> b!790338 m!731257))

(assert (=> b!790338 m!731257))

(declare-fun m!731259 () Bool)

(assert (=> b!790338 m!731259))

(declare-fun m!731261 () Bool)

(assert (=> b!790325 m!731261))

(assert (=> b!790319 m!731257))

(assert (=> b!790319 m!731257))

(declare-fun m!731263 () Bool)

(assert (=> b!790319 m!731263))

(declare-fun m!731265 () Bool)

(assert (=> b!790334 m!731265))

(declare-fun m!731267 () Bool)

(assert (=> b!790334 m!731267))

(declare-fun m!731269 () Bool)

(assert (=> b!790334 m!731269))

(declare-fun m!731271 () Bool)

(assert (=> b!790330 m!731271))

(declare-fun m!731273 () Bool)

(assert (=> b!790327 m!731273))

(declare-fun m!731275 () Bool)

(assert (=> b!790327 m!731275))

(declare-fun m!731277 () Bool)

(assert (=> b!790327 m!731277))

(declare-fun m!731279 () Bool)

(assert (=> b!790327 m!731279))

(declare-fun m!731281 () Bool)

(assert (=> b!790327 m!731281))

(assert (=> b!790327 m!731273))

(declare-fun m!731283 () Bool)

(assert (=> b!790337 m!731283))

(declare-fun m!731285 () Bool)

(assert (=> b!790320 m!731285))

(assert (=> b!790326 m!731257))

(assert (=> b!790326 m!731257))

(declare-fun m!731287 () Bool)

(assert (=> b!790326 m!731287))

(declare-fun m!731289 () Bool)

(assert (=> b!790326 m!731289))

(declare-fun m!731291 () Bool)

(assert (=> b!790326 m!731291))

(assert (=> b!790331 m!731277))

(declare-fun m!731293 () Bool)

(assert (=> b!790331 m!731293))

(assert (=> b!790328 m!731257))

(assert (=> b!790328 m!731257))

(declare-fun m!731295 () Bool)

(assert (=> b!790328 m!731295))

(assert (=> b!790324 m!731257))

(assert (=> b!790324 m!731257))

(assert (=> b!790324 m!731263))

(declare-fun m!731297 () Bool)

(assert (=> b!790323 m!731297))

(assert (=> b!790333 m!731257))

(assert (=> b!790333 m!731257))

(declare-fun m!731299 () Bool)

(assert (=> b!790333 m!731299))

(assert (=> b!790329 m!731257))

(assert (=> b!790329 m!731257))

(declare-fun m!731301 () Bool)

(assert (=> b!790329 m!731301))

(assert (=> b!790329 m!731301))

(assert (=> b!790329 m!731257))

(declare-fun m!731303 () Bool)

(assert (=> b!790329 m!731303))

(declare-fun m!731305 () Bool)

(assert (=> start!67912 m!731305))

(declare-fun m!731307 () Bool)

(assert (=> start!67912 m!731307))

(push 1)

