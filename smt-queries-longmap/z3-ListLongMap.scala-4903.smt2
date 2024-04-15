; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67640 () Bool)

(assert start!67640)

(declare-fun b!783308 () Bool)

(declare-fun res!530008 () Bool)

(declare-fun e!435522 () Bool)

(assert (=> b!783308 (=> (not res!530008) (not e!435522))))

(declare-datatypes ((array!42699 0))(
  ( (array!42700 (arr!20438 (Array (_ BitVec 32) (_ BitVec 64))) (size!20859 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42699)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42699 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!783308 (= res!530008 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!783309 () Bool)

(declare-fun e!435520 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8035 0))(
  ( (MissingZero!8035 (index!34508 (_ BitVec 32))) (Found!8035 (index!34509 (_ BitVec 32))) (Intermediate!8035 (undefined!8847 Bool) (index!34510 (_ BitVec 32)) (x!65474 (_ BitVec 32))) (Undefined!8035) (MissingVacant!8035 (index!34511 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42699 (_ BitVec 32)) SeekEntryResult!8035)

(assert (=> b!783309 (= e!435520 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20438 a!3186) j!159) a!3186 mask!3328) (Found!8035 j!159)))))

(declare-fun b!783310 () Bool)

(declare-fun res!530011 () Bool)

(declare-fun e!435518 () Bool)

(assert (=> b!783310 (=> (not res!530011) (not e!435518))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!783310 (= res!530011 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20438 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!783311 () Bool)

(declare-fun res!530000 () Bool)

(assert (=> b!783311 (=> (not res!530000) (not e!435522))))

(assert (=> b!783311 (= res!530000 (and (= (size!20859 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20859 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20859 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!530002 () Bool)

(assert (=> start!67640 (=> (not res!530002) (not e!435522))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67640 (= res!530002 (validMask!0 mask!3328))))

(assert (=> start!67640 e!435522))

(assert (=> start!67640 true))

(declare-fun array_inv!16321 (array!42699) Bool)

(assert (=> start!67640 (array_inv!16321 a!3186)))

(declare-fun b!783312 () Bool)

(declare-fun e!435521 () Bool)

(assert (=> b!783312 (= e!435518 e!435521)))

(declare-fun res!530007 () Bool)

(assert (=> b!783312 (=> (not res!530007) (not e!435521))))

(declare-fun lt!348981 () SeekEntryResult!8035)

(declare-fun lt!348989 () SeekEntryResult!8035)

(assert (=> b!783312 (= res!530007 (= lt!348981 lt!348989))))

(declare-fun lt!348982 () (_ BitVec 64))

(declare-fun lt!348986 () array!42699)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42699 (_ BitVec 32)) SeekEntryResult!8035)

(assert (=> b!783312 (= lt!348989 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!348982 lt!348986 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!783312 (= lt!348981 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!348982 mask!3328) lt!348982 lt!348986 mask!3328))))

(assert (=> b!783312 (= lt!348982 (select (store (arr!20438 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!783312 (= lt!348986 (array!42700 (store (arr!20438 a!3186) i!1173 k0!2102) (size!20859 a!3186)))))

(declare-fun b!783313 () Bool)

(declare-fun res!530003 () Bool)

(assert (=> b!783313 (=> (not res!530003) (not e!435522))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!783313 (= res!530003 (validKeyInArray!0 k0!2102))))

(declare-fun b!783314 () Bool)

(declare-fun res!530014 () Bool)

(assert (=> b!783314 (=> (not res!530014) (not e!435522))))

(assert (=> b!783314 (= res!530014 (validKeyInArray!0 (select (arr!20438 a!3186) j!159)))))

(declare-fun b!783315 () Bool)

(declare-datatypes ((Unit!27008 0))(
  ( (Unit!27009) )
))
(declare-fun e!435517 () Unit!27008)

(declare-fun Unit!27010 () Unit!27008)

(assert (=> b!783315 (= e!435517 Unit!27010)))

(declare-fun b!783316 () Bool)

(declare-fun e!435523 () Bool)

(assert (=> b!783316 (= e!435522 e!435523)))

(declare-fun res!530006 () Bool)

(assert (=> b!783316 (=> (not res!530006) (not e!435523))))

(declare-fun lt!348990 () SeekEntryResult!8035)

(assert (=> b!783316 (= res!530006 (or (= lt!348990 (MissingZero!8035 i!1173)) (= lt!348990 (MissingVacant!8035 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42699 (_ BitVec 32)) SeekEntryResult!8035)

(assert (=> b!783316 (= lt!348990 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!783317 () Bool)

(declare-fun res!530004 () Bool)

(assert (=> b!783317 (=> (not res!530004) (not e!435523))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!783317 (= res!530004 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20859 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20859 a!3186))))))

(declare-fun b!783318 () Bool)

(declare-fun e!435516 () Bool)

(declare-fun lt!348992 () SeekEntryResult!8035)

(declare-fun lt!348983 () SeekEntryResult!8035)

(assert (=> b!783318 (= e!435516 (= lt!348992 lt!348983))))

(declare-fun e!435515 () Bool)

(assert (=> b!783318 e!435515))

(declare-fun res!530010 () Bool)

(assert (=> b!783318 (=> (not res!530010) (not e!435515))))

(declare-fun lt!348991 () (_ BitVec 64))

(assert (=> b!783318 (= res!530010 (= lt!348991 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!348984 () Unit!27008)

(assert (=> b!783318 (= lt!348984 e!435517)))

(declare-fun c!87062 () Bool)

(assert (=> b!783318 (= c!87062 (= lt!348991 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!783319 () Bool)

(declare-fun e!435519 () Bool)

(assert (=> b!783319 (= e!435521 (not e!435519))))

(declare-fun res!530016 () Bool)

(assert (=> b!783319 (=> res!530016 e!435519)))

(get-info :version)

(assert (=> b!783319 (= res!530016 (or (not ((_ is Intermediate!8035) lt!348989)) (bvslt x!1131 (x!65474 lt!348989)) (not (= x!1131 (x!65474 lt!348989))) (not (= index!1321 (index!34510 lt!348989)))))))

(declare-fun e!435526 () Bool)

(assert (=> b!783319 e!435526))

(declare-fun res!529999 () Bool)

(assert (=> b!783319 (=> (not res!529999) (not e!435526))))

(declare-fun lt!348988 () SeekEntryResult!8035)

(assert (=> b!783319 (= res!529999 (= lt!348992 lt!348988))))

(assert (=> b!783319 (= lt!348988 (Found!8035 j!159))))

(assert (=> b!783319 (= lt!348992 (seekEntryOrOpen!0 (select (arr!20438 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42699 (_ BitVec 32)) Bool)

(assert (=> b!783319 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!348987 () Unit!27008)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42699 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27008)

(assert (=> b!783319 (= lt!348987 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!783320 () Bool)

(declare-fun lt!348985 () SeekEntryResult!8035)

(assert (=> b!783320 (= e!435520 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20438 a!3186) j!159) a!3186 mask!3328) lt!348985))))

(declare-fun b!783321 () Bool)

(declare-fun e!435525 () Bool)

(assert (=> b!783321 (= e!435525 e!435516)))

(declare-fun res!530015 () Bool)

(assert (=> b!783321 (=> res!530015 e!435516)))

(assert (=> b!783321 (= res!530015 (= lt!348991 lt!348982))))

(assert (=> b!783321 (= lt!348991 (select (store (arr!20438 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!783322 () Bool)

(assert (=> b!783322 (= e!435519 e!435525)))

(declare-fun res!530012 () Bool)

(assert (=> b!783322 (=> res!530012 e!435525)))

(assert (=> b!783322 (= res!530012 (not (= lt!348983 lt!348988)))))

(assert (=> b!783322 (= lt!348983 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20438 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!783323 () Bool)

(assert (=> b!783323 (= e!435515 (= (seekEntryOrOpen!0 lt!348982 lt!348986 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!348982 lt!348986 mask!3328)))))

(declare-fun b!783324 () Bool)

(assert (=> b!783324 (= e!435526 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20438 a!3186) j!159) a!3186 mask!3328) lt!348988))))

(declare-fun b!783325 () Bool)

(declare-fun Unit!27011 () Unit!27008)

(assert (=> b!783325 (= e!435517 Unit!27011)))

(assert (=> b!783325 false))

(declare-fun b!783326 () Bool)

(declare-fun res!530013 () Bool)

(assert (=> b!783326 (=> (not res!530013) (not e!435518))))

(assert (=> b!783326 (= res!530013 e!435520)))

(declare-fun c!87063 () Bool)

(assert (=> b!783326 (= c!87063 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!783327 () Bool)

(assert (=> b!783327 (= e!435523 e!435518)))

(declare-fun res!530009 () Bool)

(assert (=> b!783327 (=> (not res!530009) (not e!435518))))

(assert (=> b!783327 (= res!530009 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20438 a!3186) j!159) mask!3328) (select (arr!20438 a!3186) j!159) a!3186 mask!3328) lt!348985))))

(assert (=> b!783327 (= lt!348985 (Intermediate!8035 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!783328 () Bool)

(declare-fun res!530001 () Bool)

(assert (=> b!783328 (=> (not res!530001) (not e!435523))))

(assert (=> b!783328 (= res!530001 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!783329 () Bool)

(declare-fun res!530005 () Bool)

(assert (=> b!783329 (=> (not res!530005) (not e!435523))))

(declare-datatypes ((List!14479 0))(
  ( (Nil!14476) (Cons!14475 (h!15598 (_ BitVec 64)) (t!20785 List!14479)) )
))
(declare-fun arrayNoDuplicates!0 (array!42699 (_ BitVec 32) List!14479) Bool)

(assert (=> b!783329 (= res!530005 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14476))))

(assert (= (and start!67640 res!530002) b!783311))

(assert (= (and b!783311 res!530000) b!783314))

(assert (= (and b!783314 res!530014) b!783313))

(assert (= (and b!783313 res!530003) b!783308))

(assert (= (and b!783308 res!530008) b!783316))

(assert (= (and b!783316 res!530006) b!783328))

(assert (= (and b!783328 res!530001) b!783329))

(assert (= (and b!783329 res!530005) b!783317))

(assert (= (and b!783317 res!530004) b!783327))

(assert (= (and b!783327 res!530009) b!783310))

(assert (= (and b!783310 res!530011) b!783326))

(assert (= (and b!783326 c!87063) b!783320))

(assert (= (and b!783326 (not c!87063)) b!783309))

(assert (= (and b!783326 res!530013) b!783312))

(assert (= (and b!783312 res!530007) b!783319))

(assert (= (and b!783319 res!529999) b!783324))

(assert (= (and b!783319 (not res!530016)) b!783322))

(assert (= (and b!783322 (not res!530012)) b!783321))

(assert (= (and b!783321 (not res!530015)) b!783318))

(assert (= (and b!783318 c!87062) b!783325))

(assert (= (and b!783318 (not c!87062)) b!783315))

(assert (= (and b!783318 res!530010) b!783323))

(declare-fun m!725331 () Bool)

(assert (=> b!783308 m!725331))

(declare-fun m!725333 () Bool)

(assert (=> b!783328 m!725333))

(declare-fun m!725335 () Bool)

(assert (=> b!783321 m!725335))

(declare-fun m!725337 () Bool)

(assert (=> b!783321 m!725337))

(declare-fun m!725339 () Bool)

(assert (=> b!783319 m!725339))

(assert (=> b!783319 m!725339))

(declare-fun m!725341 () Bool)

(assert (=> b!783319 m!725341))

(declare-fun m!725343 () Bool)

(assert (=> b!783319 m!725343))

(declare-fun m!725345 () Bool)

(assert (=> b!783319 m!725345))

(assert (=> b!783327 m!725339))

(assert (=> b!783327 m!725339))

(declare-fun m!725347 () Bool)

(assert (=> b!783327 m!725347))

(assert (=> b!783327 m!725347))

(assert (=> b!783327 m!725339))

(declare-fun m!725349 () Bool)

(assert (=> b!783327 m!725349))

(declare-fun m!725351 () Bool)

(assert (=> b!783323 m!725351))

(declare-fun m!725353 () Bool)

(assert (=> b!783323 m!725353))

(assert (=> b!783320 m!725339))

(assert (=> b!783320 m!725339))

(declare-fun m!725355 () Bool)

(assert (=> b!783320 m!725355))

(assert (=> b!783314 m!725339))

(assert (=> b!783314 m!725339))

(declare-fun m!725357 () Bool)

(assert (=> b!783314 m!725357))

(assert (=> b!783324 m!725339))

(assert (=> b!783324 m!725339))

(declare-fun m!725359 () Bool)

(assert (=> b!783324 m!725359))

(declare-fun m!725361 () Bool)

(assert (=> b!783310 m!725361))

(declare-fun m!725363 () Bool)

(assert (=> b!783312 m!725363))

(assert (=> b!783312 m!725335))

(declare-fun m!725365 () Bool)

(assert (=> b!783312 m!725365))

(declare-fun m!725367 () Bool)

(assert (=> b!783312 m!725367))

(assert (=> b!783312 m!725363))

(declare-fun m!725369 () Bool)

(assert (=> b!783312 m!725369))

(declare-fun m!725371 () Bool)

(assert (=> b!783313 m!725371))

(declare-fun m!725373 () Bool)

(assert (=> start!67640 m!725373))

(declare-fun m!725375 () Bool)

(assert (=> start!67640 m!725375))

(assert (=> b!783309 m!725339))

(assert (=> b!783309 m!725339))

(declare-fun m!725377 () Bool)

(assert (=> b!783309 m!725377))

(assert (=> b!783322 m!725339))

(assert (=> b!783322 m!725339))

(assert (=> b!783322 m!725377))

(declare-fun m!725379 () Bool)

(assert (=> b!783316 m!725379))

(declare-fun m!725381 () Bool)

(assert (=> b!783329 m!725381))

(check-sat (not b!783312) (not b!783324) (not b!783322) (not b!783320) (not b!783323) (not b!783319) (not b!783328) (not b!783309) (not b!783308) (not b!783329) (not b!783327) (not b!783316) (not b!783314) (not b!783313) (not start!67640))
(check-sat)
