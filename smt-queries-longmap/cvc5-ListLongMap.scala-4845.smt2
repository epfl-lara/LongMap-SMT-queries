; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66768 () Bool)

(assert start!66768)

(declare-fun b!769436 () Bool)

(declare-fun res!520360 () Bool)

(declare-fun e!428459 () Bool)

(assert (=> b!769436 (=> (not res!520360) (not e!428459))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!769436 (= res!520360 (validKeyInArray!0 k!2102))))

(declare-fun b!769437 () Bool)

(declare-fun res!520354 () Bool)

(declare-fun e!428450 () Bool)

(assert (=> b!769437 (=> (not res!520354) (not e!428450))))

(declare-fun e!428456 () Bool)

(assert (=> b!769437 (= res!520354 e!428456)))

(declare-fun c!84939 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!769437 (= c!84939 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!769438 () Bool)

(declare-fun e!428452 () Bool)

(assert (=> b!769438 (= e!428452 e!428450)))

(declare-fun res!520361 () Bool)

(assert (=> b!769438 (=> (not res!520361) (not e!428450))))

(declare-datatypes ((array!42330 0))(
  ( (array!42331 (arr!20265 (Array (_ BitVec 32) (_ BitVec 64))) (size!20686 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42330)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7865 0))(
  ( (MissingZero!7865 (index!33828 (_ BitVec 32))) (Found!7865 (index!33829 (_ BitVec 32))) (Intermediate!7865 (undefined!8677 Bool) (index!33830 (_ BitVec 32)) (x!64764 (_ BitVec 32))) (Undefined!7865) (MissingVacant!7865 (index!33831 (_ BitVec 32))) )
))
(declare-fun lt!342343 () SeekEntryResult!7865)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42330 (_ BitVec 32)) SeekEntryResult!7865)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!769438 (= res!520361 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20265 a!3186) j!159) mask!3328) (select (arr!20265 a!3186) j!159) a!3186 mask!3328) lt!342343))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!769438 (= lt!342343 (Intermediate!7865 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!769439 () Bool)

(declare-fun e!428451 () Bool)

(declare-fun e!428458 () Bool)

(assert (=> b!769439 (= e!428451 (not e!428458))))

(declare-fun res!520355 () Bool)

(assert (=> b!769439 (=> res!520355 e!428458)))

(declare-fun lt!342346 () SeekEntryResult!7865)

(assert (=> b!769439 (= res!520355 (or (not (is-Intermediate!7865 lt!342346)) (bvsge x!1131 (x!64764 lt!342346))))))

(declare-fun e!428457 () Bool)

(assert (=> b!769439 e!428457))

(declare-fun res!520358 () Bool)

(assert (=> b!769439 (=> (not res!520358) (not e!428457))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42330 (_ BitVec 32)) Bool)

(assert (=> b!769439 (= res!520358 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26474 0))(
  ( (Unit!26475) )
))
(declare-fun lt!342348 () Unit!26474)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42330 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26474)

(assert (=> b!769439 (= lt!342348 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!520363 () Bool)

(assert (=> start!66768 (=> (not res!520363) (not e!428459))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66768 (= res!520363 (validMask!0 mask!3328))))

(assert (=> start!66768 e!428459))

(assert (=> start!66768 true))

(declare-fun array_inv!16061 (array!42330) Bool)

(assert (=> start!66768 (array_inv!16061 a!3186)))

(declare-fun lt!342344 () SeekEntryResult!7865)

(declare-fun e!428454 () Bool)

(declare-fun b!769440 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42330 (_ BitVec 32)) SeekEntryResult!7865)

(assert (=> b!769440 (= e!428454 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20265 a!3186) j!159) a!3186 mask!3328) lt!342344))))

(declare-fun b!769441 () Bool)

(declare-fun res!520353 () Bool)

(assert (=> b!769441 (=> (not res!520353) (not e!428459))))

(declare-fun arrayContainsKey!0 (array!42330 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!769441 (= res!520353 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!769442 () Bool)

(assert (=> b!769442 (= e!428459 e!428452)))

(declare-fun res!520352 () Bool)

(assert (=> b!769442 (=> (not res!520352) (not e!428452))))

(declare-fun lt!342349 () SeekEntryResult!7865)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!769442 (= res!520352 (or (= lt!342349 (MissingZero!7865 i!1173)) (= lt!342349 (MissingVacant!7865 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42330 (_ BitVec 32)) SeekEntryResult!7865)

(assert (=> b!769442 (= lt!342349 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!769443 () Bool)

(declare-fun e!428455 () Unit!26474)

(declare-fun Unit!26476 () Unit!26474)

(assert (=> b!769443 (= e!428455 Unit!26476)))

(declare-fun lt!342345 () (_ BitVec 32))

(assert (=> b!769443 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342345 (select (arr!20265 a!3186) j!159) a!3186 mask!3328) lt!342343)))

(declare-fun b!769444 () Bool)

(assert (=> b!769444 (= e!428458 true)))

(declare-fun lt!342353 () Unit!26474)

(assert (=> b!769444 (= lt!342353 e!428455)))

(declare-fun c!84940 () Bool)

(assert (=> b!769444 (= c!84940 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!769444 (= lt!342345 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!769445 () Bool)

(declare-fun res!520356 () Bool)

(assert (=> b!769445 (=> (not res!520356) (not e!428459))))

(assert (=> b!769445 (= res!520356 (validKeyInArray!0 (select (arr!20265 a!3186) j!159)))))

(declare-fun b!769446 () Bool)

(declare-fun res!520350 () Bool)

(assert (=> b!769446 (=> (not res!520350) (not e!428452))))

(assert (=> b!769446 (= res!520350 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!769447 () Bool)

(declare-fun res!520349 () Bool)

(assert (=> b!769447 (=> (not res!520349) (not e!428459))))

(assert (=> b!769447 (= res!520349 (and (= (size!20686 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20686 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20686 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!769448 () Bool)

(declare-fun Unit!26477 () Unit!26474)

(assert (=> b!769448 (= e!428455 Unit!26477)))

(declare-fun lt!342351 () SeekEntryResult!7865)

(assert (=> b!769448 (= lt!342351 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20265 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!769448 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342345 resIntermediateIndex!5 (select (arr!20265 a!3186) j!159) a!3186 mask!3328) (Found!7865 j!159))))

(declare-fun b!769449 () Bool)

(assert (=> b!769449 (= e!428457 e!428454)))

(declare-fun res!520351 () Bool)

(assert (=> b!769449 (=> (not res!520351) (not e!428454))))

(assert (=> b!769449 (= res!520351 (= (seekEntryOrOpen!0 (select (arr!20265 a!3186) j!159) a!3186 mask!3328) lt!342344))))

(assert (=> b!769449 (= lt!342344 (Found!7865 j!159))))

(declare-fun b!769450 () Bool)

(declare-fun res!520362 () Bool)

(assert (=> b!769450 (=> (not res!520362) (not e!428452))))

(assert (=> b!769450 (= res!520362 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20686 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20686 a!3186))))))

(declare-fun b!769451 () Bool)

(declare-fun res!520359 () Bool)

(assert (=> b!769451 (=> (not res!520359) (not e!428450))))

(assert (=> b!769451 (= res!520359 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20265 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!769452 () Bool)

(assert (=> b!769452 (= e!428456 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20265 a!3186) j!159) a!3186 mask!3328) lt!342343))))

(declare-fun b!769453 () Bool)

(assert (=> b!769453 (= e!428450 e!428451)))

(declare-fun res!520364 () Bool)

(assert (=> b!769453 (=> (not res!520364) (not e!428451))))

(declare-fun lt!342347 () SeekEntryResult!7865)

(assert (=> b!769453 (= res!520364 (= lt!342347 lt!342346))))

(declare-fun lt!342350 () array!42330)

(declare-fun lt!342352 () (_ BitVec 64))

(assert (=> b!769453 (= lt!342346 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!342352 lt!342350 mask!3328))))

(assert (=> b!769453 (= lt!342347 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!342352 mask!3328) lt!342352 lt!342350 mask!3328))))

(assert (=> b!769453 (= lt!342352 (select (store (arr!20265 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!769453 (= lt!342350 (array!42331 (store (arr!20265 a!3186) i!1173 k!2102) (size!20686 a!3186)))))

(declare-fun b!769454 () Bool)

(assert (=> b!769454 (= e!428456 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20265 a!3186) j!159) a!3186 mask!3328) (Found!7865 j!159)))))

(declare-fun b!769455 () Bool)

(declare-fun res!520357 () Bool)

(assert (=> b!769455 (=> (not res!520357) (not e!428452))))

(declare-datatypes ((List!14267 0))(
  ( (Nil!14264) (Cons!14263 (h!15362 (_ BitVec 64)) (t!20582 List!14267)) )
))
(declare-fun arrayNoDuplicates!0 (array!42330 (_ BitVec 32) List!14267) Bool)

(assert (=> b!769455 (= res!520357 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14264))))

(assert (= (and start!66768 res!520363) b!769447))

(assert (= (and b!769447 res!520349) b!769445))

(assert (= (and b!769445 res!520356) b!769436))

(assert (= (and b!769436 res!520360) b!769441))

(assert (= (and b!769441 res!520353) b!769442))

(assert (= (and b!769442 res!520352) b!769446))

(assert (= (and b!769446 res!520350) b!769455))

(assert (= (and b!769455 res!520357) b!769450))

(assert (= (and b!769450 res!520362) b!769438))

(assert (= (and b!769438 res!520361) b!769451))

(assert (= (and b!769451 res!520359) b!769437))

(assert (= (and b!769437 c!84939) b!769452))

(assert (= (and b!769437 (not c!84939)) b!769454))

(assert (= (and b!769437 res!520354) b!769453))

(assert (= (and b!769453 res!520364) b!769439))

(assert (= (and b!769439 res!520358) b!769449))

(assert (= (and b!769449 res!520351) b!769440))

(assert (= (and b!769439 (not res!520355)) b!769444))

(assert (= (and b!769444 c!84940) b!769443))

(assert (= (and b!769444 (not c!84940)) b!769448))

(declare-fun m!714851 () Bool)

(assert (=> b!769441 m!714851))

(declare-fun m!714853 () Bool)

(assert (=> b!769446 m!714853))

(declare-fun m!714855 () Bool)

(assert (=> b!769445 m!714855))

(assert (=> b!769445 m!714855))

(declare-fun m!714857 () Bool)

(assert (=> b!769445 m!714857))

(declare-fun m!714859 () Bool)

(assert (=> b!769442 m!714859))

(declare-fun m!714861 () Bool)

(assert (=> b!769444 m!714861))

(declare-fun m!714863 () Bool)

(assert (=> b!769451 m!714863))

(assert (=> b!769448 m!714855))

(assert (=> b!769448 m!714855))

(declare-fun m!714865 () Bool)

(assert (=> b!769448 m!714865))

(assert (=> b!769448 m!714855))

(declare-fun m!714867 () Bool)

(assert (=> b!769448 m!714867))

(assert (=> b!769452 m!714855))

(assert (=> b!769452 m!714855))

(declare-fun m!714869 () Bool)

(assert (=> b!769452 m!714869))

(declare-fun m!714871 () Bool)

(assert (=> b!769439 m!714871))

(declare-fun m!714873 () Bool)

(assert (=> b!769439 m!714873))

(assert (=> b!769449 m!714855))

(assert (=> b!769449 m!714855))

(declare-fun m!714875 () Bool)

(assert (=> b!769449 m!714875))

(assert (=> b!769440 m!714855))

(assert (=> b!769440 m!714855))

(declare-fun m!714877 () Bool)

(assert (=> b!769440 m!714877))

(assert (=> b!769454 m!714855))

(assert (=> b!769454 m!714855))

(assert (=> b!769454 m!714865))

(declare-fun m!714879 () Bool)

(assert (=> b!769453 m!714879))

(declare-fun m!714881 () Bool)

(assert (=> b!769453 m!714881))

(declare-fun m!714883 () Bool)

(assert (=> b!769453 m!714883))

(declare-fun m!714885 () Bool)

(assert (=> b!769453 m!714885))

(assert (=> b!769453 m!714879))

(declare-fun m!714887 () Bool)

(assert (=> b!769453 m!714887))

(declare-fun m!714889 () Bool)

(assert (=> b!769436 m!714889))

(declare-fun m!714891 () Bool)

(assert (=> start!66768 m!714891))

(declare-fun m!714893 () Bool)

(assert (=> start!66768 m!714893))

(declare-fun m!714895 () Bool)

(assert (=> b!769455 m!714895))

(assert (=> b!769443 m!714855))

(assert (=> b!769443 m!714855))

(declare-fun m!714897 () Bool)

(assert (=> b!769443 m!714897))

(assert (=> b!769438 m!714855))

(assert (=> b!769438 m!714855))

(declare-fun m!714899 () Bool)

(assert (=> b!769438 m!714899))

(assert (=> b!769438 m!714899))

(assert (=> b!769438 m!714855))

(declare-fun m!714901 () Bool)

(assert (=> b!769438 m!714901))

(push 1)

