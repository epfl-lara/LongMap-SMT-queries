; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65400 () Bool)

(assert start!65400)

(declare-fun b!741338 () Bool)

(declare-fun res!498358 () Bool)

(declare-fun e!414517 () Bool)

(assert (=> b!741338 (=> (not res!498358) (not e!414517))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!741338 (= res!498358 (validKeyInArray!0 k0!2102))))

(declare-fun b!741339 () Bool)

(declare-fun e!414527 () Bool)

(declare-fun e!414522 () Bool)

(assert (=> b!741339 (= e!414527 e!414522)))

(declare-fun res!498355 () Bool)

(assert (=> b!741339 (=> (not res!498355) (not e!414522))))

(declare-datatypes ((array!41443 0))(
  ( (array!41444 (arr!19831 (Array (_ BitVec 32) (_ BitVec 64))) (size!20251 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41443)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7387 0))(
  ( (MissingZero!7387 (index!31916 (_ BitVec 32))) (Found!7387 (index!31917 (_ BitVec 32))) (Intermediate!7387 (undefined!8199 Bool) (index!31918 (_ BitVec 32)) (x!63061 (_ BitVec 32))) (Undefined!7387) (MissingVacant!7387 (index!31919 (_ BitVec 32))) )
))
(declare-fun lt!329323 () SeekEntryResult!7387)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41443 (_ BitVec 32)) SeekEntryResult!7387)

(assert (=> b!741339 (= res!498355 (= (seekEntryOrOpen!0 (select (arr!19831 a!3186) j!159) a!3186 mask!3328) lt!329323))))

(assert (=> b!741339 (= lt!329323 (Found!7387 j!159))))

(declare-fun b!741340 () Bool)

(declare-fun e!414528 () Bool)

(assert (=> b!741340 (= e!414517 e!414528)))

(declare-fun res!498362 () Bool)

(assert (=> b!741340 (=> (not res!498362) (not e!414528))))

(declare-fun lt!329330 () SeekEntryResult!7387)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!741340 (= res!498362 (or (= lt!329330 (MissingZero!7387 i!1173)) (= lt!329330 (MissingVacant!7387 i!1173))))))

(assert (=> b!741340 (= lt!329330 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!741341 () Bool)

(declare-fun e!414521 () Bool)

(declare-fun e!414519 () Bool)

(assert (=> b!741341 (= e!414521 e!414519)))

(declare-fun res!498367 () Bool)

(assert (=> b!741341 (=> (not res!498367) (not e!414519))))

(declare-fun lt!329325 () SeekEntryResult!7387)

(declare-fun lt!329326 () SeekEntryResult!7387)

(assert (=> b!741341 (= res!498367 (= lt!329325 lt!329326))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!329328 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!329324 () array!41443)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41443 (_ BitVec 32)) SeekEntryResult!7387)

(assert (=> b!741341 (= lt!329326 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329328 lt!329324 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!741341 (= lt!329325 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329328 mask!3328) lt!329328 lt!329324 mask!3328))))

(assert (=> b!741341 (= lt!329328 (select (store (arr!19831 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!741341 (= lt!329324 (array!41444 (store (arr!19831 a!3186) i!1173 k0!2102) (size!20251 a!3186)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!741342 () Bool)

(declare-fun e!414520 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41443 (_ BitVec 32)) SeekEntryResult!7387)

(assert (=> b!741342 (= e!414520 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19831 a!3186) j!159) a!3186 mask!3328) (Found!7387 j!159)))))

(declare-fun b!741343 () Bool)

(declare-fun res!498352 () Bool)

(assert (=> b!741343 (=> (not res!498352) (not e!414517))))

(declare-fun arrayContainsKey!0 (array!41443 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!741343 (= res!498352 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun e!414525 () Bool)

(declare-fun lt!329331 () SeekEntryResult!7387)

(declare-fun lt!329322 () (_ BitVec 32))

(declare-fun b!741344 () Bool)

(assert (=> b!741344 (= e!414525 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!329322 resIntermediateIndex!5 (select (arr!19831 a!3186) j!159) a!3186 mask!3328) lt!329331)))))

(declare-fun b!741337 () Bool)

(declare-fun e!414523 () Bool)

(assert (=> b!741337 (= e!414519 (not e!414523))))

(declare-fun res!498356 () Bool)

(assert (=> b!741337 (=> res!498356 e!414523)))

(get-info :version)

(assert (=> b!741337 (= res!498356 (or (not ((_ is Intermediate!7387) lt!329326)) (bvsge x!1131 (x!63061 lt!329326))))))

(assert (=> b!741337 (= lt!329331 (Found!7387 j!159))))

(assert (=> b!741337 e!414527))

(declare-fun res!498361 () Bool)

(assert (=> b!741337 (=> (not res!498361) (not e!414527))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41443 (_ BitVec 32)) Bool)

(assert (=> b!741337 (= res!498361 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25321 0))(
  ( (Unit!25322) )
))
(declare-fun lt!329329 () Unit!25321)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41443 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25321)

(assert (=> b!741337 (= lt!329329 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!498369 () Bool)

(assert (=> start!65400 (=> (not res!498369) (not e!414517))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65400 (= res!498369 (validMask!0 mask!3328))))

(assert (=> start!65400 e!414517))

(assert (=> start!65400 true))

(declare-fun array_inv!15690 (array!41443) Bool)

(assert (=> start!65400 (array_inv!15690 a!3186)))

(declare-fun b!741345 () Bool)

(declare-fun e!414518 () Unit!25321)

(declare-fun Unit!25323 () Unit!25321)

(assert (=> b!741345 (= e!414518 Unit!25323)))

(declare-fun lt!329327 () SeekEntryResult!7387)

(assert (=> b!741345 (= lt!329327 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19831 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!741345 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!329322 resIntermediateIndex!5 (select (arr!19831 a!3186) j!159) a!3186 mask!3328) lt!329331)))

(declare-fun b!741346 () Bool)

(declare-fun res!498357 () Bool)

(assert (=> b!741346 (=> (not res!498357) (not e!414528))))

(assert (=> b!741346 (= res!498357 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!741347 () Bool)

(declare-fun Unit!25324 () Unit!25321)

(assert (=> b!741347 (= e!414518 Unit!25324)))

(declare-fun lt!329321 () SeekEntryResult!7387)

(assert (=> b!741347 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!329322 (select (arr!19831 a!3186) j!159) a!3186 mask!3328) lt!329321)))

(declare-fun b!741348 () Bool)

(declare-fun e!414526 () Bool)

(assert (=> b!741348 (= e!414523 e!414526)))

(declare-fun res!498353 () Bool)

(assert (=> b!741348 (=> res!498353 e!414526)))

(assert (=> b!741348 (= res!498353 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!329322 #b00000000000000000000000000000000) (bvsge lt!329322 (size!20251 a!3186))))))

(declare-fun lt!329332 () Unit!25321)

(assert (=> b!741348 (= lt!329332 e!414518)))

(declare-fun c!81876 () Bool)

(declare-fun lt!329333 () Bool)

(assert (=> b!741348 (= c!81876 lt!329333)))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!741348 (= lt!329333 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!741348 (= lt!329322 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!741349 () Bool)

(assert (=> b!741349 (= e!414526 true)))

(assert (=> b!741349 (= (seekEntryOrOpen!0 lt!329328 lt!329324 mask!3328) lt!329331)))

(declare-fun lt!329334 () Unit!25321)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!41443 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25321)

(assert (=> b!741349 (= lt!329334 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3186 i!1173 k0!2102 j!159 lt!329322 (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateIndex!5 resIntermediateX!5 mask!3328))))

(declare-fun b!741350 () Bool)

(declare-fun res!498363 () Bool)

(assert (=> b!741350 (=> (not res!498363) (not e!414517))))

(assert (=> b!741350 (= res!498363 (validKeyInArray!0 (select (arr!19831 a!3186) j!159)))))

(declare-fun b!741351 () Bool)

(declare-fun res!498354 () Bool)

(assert (=> b!741351 (=> (not res!498354) (not e!414528))))

(assert (=> b!741351 (= res!498354 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20251 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20251 a!3186))))))

(declare-fun b!741352 () Bool)

(declare-fun res!498370 () Bool)

(assert (=> b!741352 (=> (not res!498370) (not e!414528))))

(declare-datatypes ((List!13740 0))(
  ( (Nil!13737) (Cons!13736 (h!14814 (_ BitVec 64)) (t!20047 List!13740)) )
))
(declare-fun arrayNoDuplicates!0 (array!41443 (_ BitVec 32) List!13740) Bool)

(assert (=> b!741352 (= res!498370 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13737))))

(declare-fun b!741353 () Bool)

(declare-fun res!498359 () Bool)

(assert (=> b!741353 (=> res!498359 e!414526)))

(assert (=> b!741353 (= res!498359 (not (= lt!329325 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!329322 lt!329328 lt!329324 mask!3328))))))

(declare-fun b!741354 () Bool)

(declare-fun res!498365 () Bool)

(assert (=> b!741354 (=> (not res!498365) (not e!414517))))

(assert (=> b!741354 (= res!498365 (and (= (size!20251 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20251 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20251 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!741355 () Bool)

(assert (=> b!741355 (= e!414525 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!329322 (select (arr!19831 a!3186) j!159) a!3186 mask!3328) lt!329321)))))

(declare-fun b!741356 () Bool)

(declare-fun res!498360 () Bool)

(assert (=> b!741356 (=> res!498360 e!414526)))

(assert (=> b!741356 (= res!498360 e!414525)))

(declare-fun c!81877 () Bool)

(assert (=> b!741356 (= c!81877 lt!329333)))

(declare-fun b!741357 () Bool)

(assert (=> b!741357 (= e!414520 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19831 a!3186) j!159) a!3186 mask!3328) lt!329321))))

(declare-fun b!741358 () Bool)

(assert (=> b!741358 (= e!414522 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19831 a!3186) j!159) a!3186 mask!3328) lt!329323))))

(declare-fun b!741359 () Bool)

(declare-fun res!498366 () Bool)

(assert (=> b!741359 (=> (not res!498366) (not e!414521))))

(assert (=> b!741359 (= res!498366 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19831 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!741360 () Bool)

(assert (=> b!741360 (= e!414528 e!414521)))

(declare-fun res!498368 () Bool)

(assert (=> b!741360 (=> (not res!498368) (not e!414521))))

(assert (=> b!741360 (= res!498368 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19831 a!3186) j!159) mask!3328) (select (arr!19831 a!3186) j!159) a!3186 mask!3328) lt!329321))))

(assert (=> b!741360 (= lt!329321 (Intermediate!7387 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!741361 () Bool)

(declare-fun res!498364 () Bool)

(assert (=> b!741361 (=> (not res!498364) (not e!414521))))

(assert (=> b!741361 (= res!498364 e!414520)))

(declare-fun c!81878 () Bool)

(assert (=> b!741361 (= c!81878 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!65400 res!498369) b!741354))

(assert (= (and b!741354 res!498365) b!741350))

(assert (= (and b!741350 res!498363) b!741338))

(assert (= (and b!741338 res!498358) b!741343))

(assert (= (and b!741343 res!498352) b!741340))

(assert (= (and b!741340 res!498362) b!741346))

(assert (= (and b!741346 res!498357) b!741352))

(assert (= (and b!741352 res!498370) b!741351))

(assert (= (and b!741351 res!498354) b!741360))

(assert (= (and b!741360 res!498368) b!741359))

(assert (= (and b!741359 res!498366) b!741361))

(assert (= (and b!741361 c!81878) b!741357))

(assert (= (and b!741361 (not c!81878)) b!741342))

(assert (= (and b!741361 res!498364) b!741341))

(assert (= (and b!741341 res!498367) b!741337))

(assert (= (and b!741337 res!498361) b!741339))

(assert (= (and b!741339 res!498355) b!741358))

(assert (= (and b!741337 (not res!498356)) b!741348))

(assert (= (and b!741348 c!81876) b!741347))

(assert (= (and b!741348 (not c!81876)) b!741345))

(assert (= (and b!741348 (not res!498353)) b!741356))

(assert (= (and b!741356 c!81877) b!741355))

(assert (= (and b!741356 (not c!81877)) b!741344))

(assert (= (and b!741356 (not res!498360)) b!741353))

(assert (= (and b!741353 (not res!498359)) b!741349))

(declare-fun m!692853 () Bool)

(assert (=> b!741337 m!692853))

(declare-fun m!692855 () Bool)

(assert (=> b!741337 m!692855))

(declare-fun m!692857 () Bool)

(assert (=> b!741338 m!692857))

(declare-fun m!692859 () Bool)

(assert (=> b!741344 m!692859))

(assert (=> b!741344 m!692859))

(declare-fun m!692861 () Bool)

(assert (=> b!741344 m!692861))

(declare-fun m!692863 () Bool)

(assert (=> b!741348 m!692863))

(declare-fun m!692865 () Bool)

(assert (=> b!741343 m!692865))

(assert (=> b!741347 m!692859))

(assert (=> b!741347 m!692859))

(declare-fun m!692867 () Bool)

(assert (=> b!741347 m!692867))

(assert (=> b!741345 m!692859))

(assert (=> b!741345 m!692859))

(declare-fun m!692869 () Bool)

(assert (=> b!741345 m!692869))

(assert (=> b!741345 m!692859))

(assert (=> b!741345 m!692861))

(assert (=> b!741357 m!692859))

(assert (=> b!741357 m!692859))

(declare-fun m!692871 () Bool)

(assert (=> b!741357 m!692871))

(declare-fun m!692873 () Bool)

(assert (=> b!741353 m!692873))

(declare-fun m!692875 () Bool)

(assert (=> start!65400 m!692875))

(declare-fun m!692877 () Bool)

(assert (=> start!65400 m!692877))

(assert (=> b!741339 m!692859))

(assert (=> b!741339 m!692859))

(declare-fun m!692879 () Bool)

(assert (=> b!741339 m!692879))

(assert (=> b!741350 m!692859))

(assert (=> b!741350 m!692859))

(declare-fun m!692881 () Bool)

(assert (=> b!741350 m!692881))

(declare-fun m!692883 () Bool)

(assert (=> b!741352 m!692883))

(declare-fun m!692885 () Bool)

(assert (=> b!741346 m!692885))

(assert (=> b!741360 m!692859))

(assert (=> b!741360 m!692859))

(declare-fun m!692887 () Bool)

(assert (=> b!741360 m!692887))

(assert (=> b!741360 m!692887))

(assert (=> b!741360 m!692859))

(declare-fun m!692889 () Bool)

(assert (=> b!741360 m!692889))

(assert (=> b!741342 m!692859))

(assert (=> b!741342 m!692859))

(assert (=> b!741342 m!692869))

(declare-fun m!692891 () Bool)

(assert (=> b!741341 m!692891))

(declare-fun m!692893 () Bool)

(assert (=> b!741341 m!692893))

(declare-fun m!692895 () Bool)

(assert (=> b!741341 m!692895))

(declare-fun m!692897 () Bool)

(assert (=> b!741341 m!692897))

(assert (=> b!741341 m!692895))

(declare-fun m!692899 () Bool)

(assert (=> b!741341 m!692899))

(declare-fun m!692901 () Bool)

(assert (=> b!741340 m!692901))

(declare-fun m!692903 () Bool)

(assert (=> b!741359 m!692903))

(assert (=> b!741358 m!692859))

(assert (=> b!741358 m!692859))

(declare-fun m!692905 () Bool)

(assert (=> b!741358 m!692905))

(declare-fun m!692907 () Bool)

(assert (=> b!741349 m!692907))

(declare-fun m!692909 () Bool)

(assert (=> b!741349 m!692909))

(assert (=> b!741355 m!692859))

(assert (=> b!741355 m!692859))

(assert (=> b!741355 m!692867))

(check-sat (not b!741349) (not b!741341) (not start!65400) (not b!741355) (not b!741344) (not b!741339) (not b!741352) (not b!741340) (not b!741338) (not b!741343) (not b!741345) (not b!741360) (not b!741337) (not b!741357) (not b!741348) (not b!741350) (not b!741342) (not b!741347) (not b!741353) (not b!741346) (not b!741358))
(check-sat)
