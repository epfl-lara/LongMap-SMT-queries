; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67816 () Bool)

(assert start!67816)

(declare-fun b!785438 () Bool)

(declare-fun res!531417 () Bool)

(declare-fun e!436742 () Bool)

(assert (=> b!785438 (=> (not res!531417) (not e!436742))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42736 0))(
  ( (array!42737 (arr!20452 (Array (_ BitVec 32) (_ BitVec 64))) (size!20872 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42736)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!785438 (= res!531417 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20452 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!785439 () Bool)

(declare-fun e!436734 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8008 0))(
  ( (MissingZero!8008 (index!34400 (_ BitVec 32))) (Found!8008 (index!34401 (_ BitVec 32))) (Intermediate!8008 (undefined!8820 Bool) (index!34402 (_ BitVec 32)) (x!65511 (_ BitVec 32))) (Undefined!8008) (MissingVacant!8008 (index!34403 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42736 (_ BitVec 32)) SeekEntryResult!8008)

(assert (=> b!785439 (= e!436734 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20452 a!3186) j!159) a!3186 mask!3328) (Found!8008 j!159)))))

(declare-fun b!785440 () Bool)

(declare-fun res!531405 () Bool)

(declare-fun e!436737 () Bool)

(assert (=> b!785440 (=> (not res!531405) (not e!436737))))

(assert (=> b!785440 (= res!531405 (and (= (size!20872 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20872 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20872 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!785441 () Bool)

(declare-fun e!436741 () Bool)

(declare-fun e!436738 () Bool)

(assert (=> b!785441 (= e!436741 (not e!436738))))

(declare-fun res!531408 () Bool)

(assert (=> b!785441 (=> res!531408 e!436738)))

(declare-fun lt!350143 () SeekEntryResult!8008)

(get-info :version)

(assert (=> b!785441 (= res!531408 (or (not ((_ is Intermediate!8008) lt!350143)) (bvslt x!1131 (x!65511 lt!350143)) (not (= x!1131 (x!65511 lt!350143))) (not (= index!1321 (index!34402 lt!350143)))))))

(declare-fun e!436744 () Bool)

(assert (=> b!785441 e!436744))

(declare-fun res!531399 () Bool)

(assert (=> b!785441 (=> (not res!531399) (not e!436744))))

(declare-fun lt!350146 () SeekEntryResult!8008)

(declare-fun lt!350148 () SeekEntryResult!8008)

(assert (=> b!785441 (= res!531399 (= lt!350146 lt!350148))))

(assert (=> b!785441 (= lt!350148 (Found!8008 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42736 (_ BitVec 32)) SeekEntryResult!8008)

(assert (=> b!785441 (= lt!350146 (seekEntryOrOpen!0 (select (arr!20452 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42736 (_ BitVec 32)) Bool)

(assert (=> b!785441 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!27097 0))(
  ( (Unit!27098) )
))
(declare-fun lt!350149 () Unit!27097)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42736 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27097)

(assert (=> b!785441 (= lt!350149 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!531400 () Bool)

(assert (=> start!67816 (=> (not res!531400) (not e!436737))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67816 (= res!531400 (validMask!0 mask!3328))))

(assert (=> start!67816 e!436737))

(assert (=> start!67816 true))

(declare-fun array_inv!16311 (array!42736) Bool)

(assert (=> start!67816 (array_inv!16311 a!3186)))

(declare-fun b!785442 () Bool)

(declare-fun e!436736 () Bool)

(assert (=> b!785442 (= e!436736 e!436742)))

(declare-fun res!531407 () Bool)

(assert (=> b!785442 (=> (not res!531407) (not e!436742))))

(declare-fun lt!350152 () SeekEntryResult!8008)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42736 (_ BitVec 32)) SeekEntryResult!8008)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!785442 (= res!531407 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20452 a!3186) j!159) mask!3328) (select (arr!20452 a!3186) j!159) a!3186 mask!3328) lt!350152))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!785442 (= lt!350152 (Intermediate!8008 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!785443 () Bool)

(declare-fun res!531406 () Bool)

(assert (=> b!785443 (=> (not res!531406) (not e!436736))))

(assert (=> b!785443 (= res!531406 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!785444 () Bool)

(assert (=> b!785444 (= e!436737 e!436736)))

(declare-fun res!531411 () Bool)

(assert (=> b!785444 (=> (not res!531411) (not e!436736))))

(declare-fun lt!350147 () SeekEntryResult!8008)

(assert (=> b!785444 (= res!531411 (or (= lt!350147 (MissingZero!8008 i!1173)) (= lt!350147 (MissingVacant!8008 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!785444 (= lt!350147 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!785445 () Bool)

(assert (=> b!785445 (= e!436742 e!436741)))

(declare-fun res!531416 () Bool)

(assert (=> b!785445 (=> (not res!531416) (not e!436741))))

(declare-fun lt!350142 () SeekEntryResult!8008)

(assert (=> b!785445 (= res!531416 (= lt!350142 lt!350143))))

(declare-fun lt!350151 () array!42736)

(declare-fun lt!350144 () (_ BitVec 64))

(assert (=> b!785445 (= lt!350143 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!350144 lt!350151 mask!3328))))

(assert (=> b!785445 (= lt!350142 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!350144 mask!3328) lt!350144 lt!350151 mask!3328))))

(assert (=> b!785445 (= lt!350144 (select (store (arr!20452 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!785445 (= lt!350151 (array!42737 (store (arr!20452 a!3186) i!1173 k0!2102) (size!20872 a!3186)))))

(declare-fun b!785446 () Bool)

(declare-fun res!531410 () Bool)

(declare-fun e!436743 () Bool)

(assert (=> b!785446 (=> (not res!531410) (not e!436743))))

(assert (=> b!785446 (= res!531410 (= (seekEntryOrOpen!0 lt!350144 lt!350151 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!350144 lt!350151 mask!3328)))))

(declare-fun b!785447 () Bool)

(declare-fun res!531412 () Bool)

(assert (=> b!785447 (=> (not res!531412) (not e!436736))))

(declare-datatypes ((List!14361 0))(
  ( (Nil!14358) (Cons!14357 (h!15486 (_ BitVec 64)) (t!20668 List!14361)) )
))
(declare-fun arrayNoDuplicates!0 (array!42736 (_ BitVec 32) List!14361) Bool)

(assert (=> b!785447 (= res!531412 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14358))))

(declare-fun b!785448 () Bool)

(declare-fun lt!350150 () SeekEntryResult!8008)

(assert (=> b!785448 (= e!436743 (= lt!350146 lt!350150))))

(declare-fun b!785449 () Bool)

(declare-fun e!436740 () Bool)

(assert (=> b!785449 (= e!436738 e!436740)))

(declare-fun res!531401 () Bool)

(assert (=> b!785449 (=> res!531401 e!436740)))

(assert (=> b!785449 (= res!531401 (not (= lt!350150 lt!350148)))))

(assert (=> b!785449 (= lt!350150 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20452 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!785450 () Bool)

(declare-fun res!531409 () Bool)

(assert (=> b!785450 (=> (not res!531409) (not e!436737))))

(declare-fun arrayContainsKey!0 (array!42736 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!785450 (= res!531409 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!785451 () Bool)

(declare-fun e!436733 () Bool)

(assert (=> b!785451 (= e!436740 e!436733)))

(declare-fun res!531402 () Bool)

(assert (=> b!785451 (=> res!531402 e!436733)))

(declare-fun lt!350141 () (_ BitVec 64))

(assert (=> b!785451 (= res!531402 (= lt!350141 lt!350144))))

(assert (=> b!785451 (= lt!350141 (select (store (arr!20452 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!785452 () Bool)

(declare-fun e!436739 () Unit!27097)

(declare-fun Unit!27099 () Unit!27097)

(assert (=> b!785452 (= e!436739 Unit!27099)))

(declare-fun b!785453 () Bool)

(declare-fun res!531403 () Bool)

(assert (=> b!785453 (=> (not res!531403) (not e!436736))))

(assert (=> b!785453 (= res!531403 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20872 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20872 a!3186))))))

(declare-fun b!785454 () Bool)

(declare-fun Unit!27100 () Unit!27097)

(assert (=> b!785454 (= e!436739 Unit!27100)))

(assert (=> b!785454 false))

(declare-fun b!785455 () Bool)

(declare-fun res!531415 () Bool)

(assert (=> b!785455 (=> (not res!531415) (not e!436737))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!785455 (= res!531415 (validKeyInArray!0 k0!2102))))

(declare-fun b!785456 () Bool)

(assert (=> b!785456 (= e!436733 true)))

(assert (=> b!785456 e!436743))

(declare-fun res!531404 () Bool)

(assert (=> b!785456 (=> (not res!531404) (not e!436743))))

(assert (=> b!785456 (= res!531404 (= lt!350141 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!350145 () Unit!27097)

(assert (=> b!785456 (= lt!350145 e!436739)))

(declare-fun c!87430 () Bool)

(assert (=> b!785456 (= c!87430 (= lt!350141 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!785457 () Bool)

(assert (=> b!785457 (= e!436734 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20452 a!3186) j!159) a!3186 mask!3328) lt!350152))))

(declare-fun b!785458 () Bool)

(declare-fun res!531413 () Bool)

(assert (=> b!785458 (=> (not res!531413) (not e!436742))))

(assert (=> b!785458 (= res!531413 e!436734)))

(declare-fun c!87431 () Bool)

(assert (=> b!785458 (= c!87431 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!785459 () Bool)

(assert (=> b!785459 (= e!436744 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20452 a!3186) j!159) a!3186 mask!3328) lt!350148))))

(declare-fun b!785460 () Bool)

(declare-fun res!531414 () Bool)

(assert (=> b!785460 (=> (not res!531414) (not e!436737))))

(assert (=> b!785460 (= res!531414 (validKeyInArray!0 (select (arr!20452 a!3186) j!159)))))

(assert (= (and start!67816 res!531400) b!785440))

(assert (= (and b!785440 res!531405) b!785460))

(assert (= (and b!785460 res!531414) b!785455))

(assert (= (and b!785455 res!531415) b!785450))

(assert (= (and b!785450 res!531409) b!785444))

(assert (= (and b!785444 res!531411) b!785443))

(assert (= (and b!785443 res!531406) b!785447))

(assert (= (and b!785447 res!531412) b!785453))

(assert (= (and b!785453 res!531403) b!785442))

(assert (= (and b!785442 res!531407) b!785438))

(assert (= (and b!785438 res!531417) b!785458))

(assert (= (and b!785458 c!87431) b!785457))

(assert (= (and b!785458 (not c!87431)) b!785439))

(assert (= (and b!785458 res!531413) b!785445))

(assert (= (and b!785445 res!531416) b!785441))

(assert (= (and b!785441 res!531399) b!785459))

(assert (= (and b!785441 (not res!531408)) b!785449))

(assert (= (and b!785449 (not res!531401)) b!785451))

(assert (= (and b!785451 (not res!531402)) b!785456))

(assert (= (and b!785456 c!87430) b!785454))

(assert (= (and b!785456 (not c!87430)) b!785452))

(assert (= (and b!785456 res!531404) b!785446))

(assert (= (and b!785446 res!531410) b!785448))

(declare-fun m!728087 () Bool)

(assert (=> b!785439 m!728087))

(assert (=> b!785439 m!728087))

(declare-fun m!728089 () Bool)

(assert (=> b!785439 m!728089))

(declare-fun m!728091 () Bool)

(assert (=> b!785443 m!728091))

(assert (=> b!785460 m!728087))

(assert (=> b!785460 m!728087))

(declare-fun m!728093 () Bool)

(assert (=> b!785460 m!728093))

(declare-fun m!728095 () Bool)

(assert (=> b!785447 m!728095))

(declare-fun m!728097 () Bool)

(assert (=> b!785450 m!728097))

(declare-fun m!728099 () Bool)

(assert (=> b!785445 m!728099))

(declare-fun m!728101 () Bool)

(assert (=> b!785445 m!728101))

(declare-fun m!728103 () Bool)

(assert (=> b!785445 m!728103))

(declare-fun m!728105 () Bool)

(assert (=> b!785445 m!728105))

(assert (=> b!785445 m!728099))

(declare-fun m!728107 () Bool)

(assert (=> b!785445 m!728107))

(declare-fun m!728109 () Bool)

(assert (=> b!785455 m!728109))

(assert (=> b!785449 m!728087))

(assert (=> b!785449 m!728087))

(assert (=> b!785449 m!728089))

(assert (=> b!785451 m!728103))

(declare-fun m!728111 () Bool)

(assert (=> b!785451 m!728111))

(declare-fun m!728113 () Bool)

(assert (=> b!785444 m!728113))

(assert (=> b!785459 m!728087))

(assert (=> b!785459 m!728087))

(declare-fun m!728115 () Bool)

(assert (=> b!785459 m!728115))

(declare-fun m!728117 () Bool)

(assert (=> b!785438 m!728117))

(assert (=> b!785441 m!728087))

(assert (=> b!785441 m!728087))

(declare-fun m!728119 () Bool)

(assert (=> b!785441 m!728119))

(declare-fun m!728121 () Bool)

(assert (=> b!785441 m!728121))

(declare-fun m!728123 () Bool)

(assert (=> b!785441 m!728123))

(assert (=> b!785442 m!728087))

(assert (=> b!785442 m!728087))

(declare-fun m!728125 () Bool)

(assert (=> b!785442 m!728125))

(assert (=> b!785442 m!728125))

(assert (=> b!785442 m!728087))

(declare-fun m!728127 () Bool)

(assert (=> b!785442 m!728127))

(declare-fun m!728129 () Bool)

(assert (=> b!785446 m!728129))

(declare-fun m!728131 () Bool)

(assert (=> b!785446 m!728131))

(assert (=> b!785457 m!728087))

(assert (=> b!785457 m!728087))

(declare-fun m!728133 () Bool)

(assert (=> b!785457 m!728133))

(declare-fun m!728135 () Bool)

(assert (=> start!67816 m!728135))

(declare-fun m!728137 () Bool)

(assert (=> start!67816 m!728137))

(check-sat (not b!785460) (not b!785450) (not b!785455) (not b!785447) (not b!785441) (not start!67816) (not b!785439) (not b!785446) (not b!785457) (not b!785445) (not b!785443) (not b!785449) (not b!785444) (not b!785459) (not b!785442))
(check-sat)
