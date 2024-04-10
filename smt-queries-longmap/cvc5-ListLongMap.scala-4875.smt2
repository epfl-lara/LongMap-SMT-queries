; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67164 () Bool)

(assert start!67164)

(declare-fun res!525251 () Bool)

(declare-fun e!432071 () Bool)

(assert (=> start!67164 (=> (not res!525251) (not e!432071))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67164 (= res!525251 (validMask!0 mask!3328))))

(assert (=> start!67164 e!432071))

(assert (=> start!67164 true))

(declare-datatypes ((array!42519 0))(
  ( (array!42520 (arr!20355 (Array (_ BitVec 32) (_ BitVec 64))) (size!20776 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42519)

(declare-fun array_inv!16151 (array!42519) Bool)

(assert (=> start!67164 (array_inv!16151 a!3186)))

(declare-fun b!776434 () Bool)

(declare-fun res!525243 () Bool)

(declare-fun e!432064 () Bool)

(assert (=> b!776434 (=> (not res!525243) (not e!432064))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!776434 (= res!525243 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20355 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!776435 () Bool)

(declare-fun e!432069 () Bool)

(declare-fun e!432063 () Bool)

(assert (=> b!776435 (= e!432069 e!432063)))

(declare-fun res!525248 () Bool)

(assert (=> b!776435 (=> (not res!525248) (not e!432063))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7955 0))(
  ( (MissingZero!7955 (index!34188 (_ BitVec 32))) (Found!7955 (index!34189 (_ BitVec 32))) (Intermediate!7955 (undefined!8767 Bool) (index!34190 (_ BitVec 32)) (x!65130 (_ BitVec 32))) (Undefined!7955) (MissingVacant!7955 (index!34191 (_ BitVec 32))) )
))
(declare-fun lt!345919 () SeekEntryResult!7955)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42519 (_ BitVec 32)) SeekEntryResult!7955)

(assert (=> b!776435 (= res!525248 (= (seekEntryOrOpen!0 (select (arr!20355 a!3186) j!159) a!3186 mask!3328) lt!345919))))

(assert (=> b!776435 (= lt!345919 (Found!7955 j!159))))

(declare-fun b!776436 () Bool)

(declare-fun res!525236 () Bool)

(assert (=> b!776436 (=> (not res!525236) (not e!432071))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42519 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!776436 (= res!525236 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!776437 () Bool)

(declare-fun e!432067 () Bool)

(assert (=> b!776437 (= e!432071 e!432067)))

(declare-fun res!525247 () Bool)

(assert (=> b!776437 (=> (not res!525247) (not e!432067))))

(declare-fun lt!345922 () SeekEntryResult!7955)

(assert (=> b!776437 (= res!525247 (or (= lt!345922 (MissingZero!7955 i!1173)) (= lt!345922 (MissingVacant!7955 i!1173))))))

(assert (=> b!776437 (= lt!345922 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!776438 () Bool)

(declare-fun e!432066 () Bool)

(declare-fun e!432065 () Bool)

(assert (=> b!776438 (= e!432066 (not e!432065))))

(declare-fun res!525242 () Bool)

(assert (=> b!776438 (=> res!525242 e!432065)))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!345923 () SeekEntryResult!7955)

(assert (=> b!776438 (= res!525242 (or (not (is-Intermediate!7955 lt!345923)) (bvslt x!1131 (x!65130 lt!345923)) (not (= x!1131 (x!65130 lt!345923))) (not (= index!1321 (index!34190 lt!345923)))))))

(assert (=> b!776438 e!432069))

(declare-fun res!525241 () Bool)

(assert (=> b!776438 (=> (not res!525241) (not e!432069))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42519 (_ BitVec 32)) Bool)

(assert (=> b!776438 (= res!525241 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26804 0))(
  ( (Unit!26805) )
))
(declare-fun lt!345926 () Unit!26804)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42519 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26804)

(assert (=> b!776438 (= lt!345926 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!776439 () Bool)

(declare-fun res!525246 () Bool)

(assert (=> b!776439 (=> (not res!525246) (not e!432064))))

(declare-fun e!432070 () Bool)

(assert (=> b!776439 (= res!525246 e!432070)))

(declare-fun c!85999 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!776439 (= c!85999 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!776440 () Bool)

(declare-fun res!525238 () Bool)

(assert (=> b!776440 (=> (not res!525238) (not e!432071))))

(assert (=> b!776440 (= res!525238 (and (= (size!20776 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20776 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20776 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!776441 () Bool)

(assert (=> b!776441 (= e!432065 true)))

(declare-fun lt!345920 () SeekEntryResult!7955)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42519 (_ BitVec 32)) SeekEntryResult!7955)

(assert (=> b!776441 (= lt!345920 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20355 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!776442 () Bool)

(declare-fun res!525245 () Bool)

(assert (=> b!776442 (=> (not res!525245) (not e!432067))))

(assert (=> b!776442 (= res!525245 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20776 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20776 a!3186))))))

(declare-fun b!776443 () Bool)

(declare-fun res!525250 () Bool)

(assert (=> b!776443 (=> (not res!525250) (not e!432067))))

(assert (=> b!776443 (= res!525250 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!776444 () Bool)

(declare-fun lt!345924 () SeekEntryResult!7955)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42519 (_ BitVec 32)) SeekEntryResult!7955)

(assert (=> b!776444 (= e!432070 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20355 a!3186) j!159) a!3186 mask!3328) lt!345924))))

(declare-fun b!776445 () Bool)

(assert (=> b!776445 (= e!432063 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20355 a!3186) j!159) a!3186 mask!3328) lt!345919))))

(declare-fun b!776446 () Bool)

(assert (=> b!776446 (= e!432064 e!432066)))

(declare-fun res!525240 () Bool)

(assert (=> b!776446 (=> (not res!525240) (not e!432066))))

(declare-fun lt!345918 () SeekEntryResult!7955)

(assert (=> b!776446 (= res!525240 (= lt!345918 lt!345923))))

(declare-fun lt!345921 () array!42519)

(declare-fun lt!345925 () (_ BitVec 64))

(assert (=> b!776446 (= lt!345923 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!345925 lt!345921 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!776446 (= lt!345918 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!345925 mask!3328) lt!345925 lt!345921 mask!3328))))

(assert (=> b!776446 (= lt!345925 (select (store (arr!20355 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!776446 (= lt!345921 (array!42520 (store (arr!20355 a!3186) i!1173 k!2102) (size!20776 a!3186)))))

(declare-fun b!776447 () Bool)

(declare-fun res!525244 () Bool)

(assert (=> b!776447 (=> (not res!525244) (not e!432067))))

(declare-datatypes ((List!14357 0))(
  ( (Nil!14354) (Cons!14353 (h!15461 (_ BitVec 64)) (t!20672 List!14357)) )
))
(declare-fun arrayNoDuplicates!0 (array!42519 (_ BitVec 32) List!14357) Bool)

(assert (=> b!776447 (= res!525244 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14354))))

(declare-fun b!776448 () Bool)

(assert (=> b!776448 (= e!432070 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20355 a!3186) j!159) a!3186 mask!3328) (Found!7955 j!159)))))

(declare-fun b!776449 () Bool)

(declare-fun res!525249 () Bool)

(assert (=> b!776449 (=> (not res!525249) (not e!432071))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!776449 (= res!525249 (validKeyInArray!0 k!2102))))

(declare-fun b!776450 () Bool)

(assert (=> b!776450 (= e!432067 e!432064)))

(declare-fun res!525239 () Bool)

(assert (=> b!776450 (=> (not res!525239) (not e!432064))))

(assert (=> b!776450 (= res!525239 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20355 a!3186) j!159) mask!3328) (select (arr!20355 a!3186) j!159) a!3186 mask!3328) lt!345924))))

(assert (=> b!776450 (= lt!345924 (Intermediate!7955 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!776451 () Bool)

(declare-fun res!525237 () Bool)

(assert (=> b!776451 (=> (not res!525237) (not e!432071))))

(assert (=> b!776451 (= res!525237 (validKeyInArray!0 (select (arr!20355 a!3186) j!159)))))

(assert (= (and start!67164 res!525251) b!776440))

(assert (= (and b!776440 res!525238) b!776451))

(assert (= (and b!776451 res!525237) b!776449))

(assert (= (and b!776449 res!525249) b!776436))

(assert (= (and b!776436 res!525236) b!776437))

(assert (= (and b!776437 res!525247) b!776443))

(assert (= (and b!776443 res!525250) b!776447))

(assert (= (and b!776447 res!525244) b!776442))

(assert (= (and b!776442 res!525245) b!776450))

(assert (= (and b!776450 res!525239) b!776434))

(assert (= (and b!776434 res!525243) b!776439))

(assert (= (and b!776439 c!85999) b!776444))

(assert (= (and b!776439 (not c!85999)) b!776448))

(assert (= (and b!776439 res!525246) b!776446))

(assert (= (and b!776446 res!525240) b!776438))

(assert (= (and b!776438 res!525241) b!776435))

(assert (= (and b!776435 res!525248) b!776445))

(assert (= (and b!776438 (not res!525242)) b!776441))

(declare-fun m!720515 () Bool)

(assert (=> b!776448 m!720515))

(assert (=> b!776448 m!720515))

(declare-fun m!720517 () Bool)

(assert (=> b!776448 m!720517))

(declare-fun m!720519 () Bool)

(assert (=> b!776449 m!720519))

(assert (=> b!776451 m!720515))

(assert (=> b!776451 m!720515))

(declare-fun m!720521 () Bool)

(assert (=> b!776451 m!720521))

(assert (=> b!776444 m!720515))

(assert (=> b!776444 m!720515))

(declare-fun m!720523 () Bool)

(assert (=> b!776444 m!720523))

(declare-fun m!720525 () Bool)

(assert (=> b!776443 m!720525))

(assert (=> b!776435 m!720515))

(assert (=> b!776435 m!720515))

(declare-fun m!720527 () Bool)

(assert (=> b!776435 m!720527))

(declare-fun m!720529 () Bool)

(assert (=> b!776434 m!720529))

(declare-fun m!720531 () Bool)

(assert (=> b!776447 m!720531))

(assert (=> b!776445 m!720515))

(assert (=> b!776445 m!720515))

(declare-fun m!720533 () Bool)

(assert (=> b!776445 m!720533))

(declare-fun m!720535 () Bool)

(assert (=> b!776436 m!720535))

(assert (=> b!776450 m!720515))

(assert (=> b!776450 m!720515))

(declare-fun m!720537 () Bool)

(assert (=> b!776450 m!720537))

(assert (=> b!776450 m!720537))

(assert (=> b!776450 m!720515))

(declare-fun m!720539 () Bool)

(assert (=> b!776450 m!720539))

(declare-fun m!720541 () Bool)

(assert (=> b!776446 m!720541))

(declare-fun m!720543 () Bool)

(assert (=> b!776446 m!720543))

(declare-fun m!720545 () Bool)

(assert (=> b!776446 m!720545))

(declare-fun m!720547 () Bool)

(assert (=> b!776446 m!720547))

(assert (=> b!776446 m!720543))

(declare-fun m!720549 () Bool)

(assert (=> b!776446 m!720549))

(declare-fun m!720551 () Bool)

(assert (=> b!776437 m!720551))

(assert (=> b!776441 m!720515))

(assert (=> b!776441 m!720515))

(assert (=> b!776441 m!720517))

(declare-fun m!720553 () Bool)

(assert (=> start!67164 m!720553))

(declare-fun m!720555 () Bool)

(assert (=> start!67164 m!720555))

(declare-fun m!720557 () Bool)

(assert (=> b!776438 m!720557))

(declare-fun m!720559 () Bool)

(assert (=> b!776438 m!720559))

(push 1)

