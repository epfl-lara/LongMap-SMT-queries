; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65862 () Bool)

(assert start!65862)

(declare-fun b!759095 () Bool)

(declare-fun res!513641 () Bool)

(declare-fun e!423202 () Bool)

(assert (=> b!759095 (=> (not res!513641) (not e!423202))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42035 0))(
  ( (array!42036 (arr!20131 (Array (_ BitVec 32) (_ BitVec 64))) (size!20552 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42035)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!759095 (= res!513641 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20552 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20552 a!3186))))))

(declare-fun b!759096 () Bool)

(declare-fun res!513646 () Bool)

(assert (=> b!759096 (=> (not res!513646) (not e!423202))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42035 (_ BitVec 32)) Bool)

(assert (=> b!759096 (= res!513646 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!513642 () Bool)

(declare-fun e!423200 () Bool)

(assert (=> start!65862 (=> (not res!513642) (not e!423200))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65862 (= res!513642 (validMask!0 mask!3328))))

(assert (=> start!65862 e!423200))

(assert (=> start!65862 true))

(declare-fun array_inv!15927 (array!42035) Bool)

(assert (=> start!65862 (array_inv!15927 a!3186)))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7731 0))(
  ( (MissingZero!7731 (index!33292 (_ BitVec 32))) (Found!7731 (index!33293 (_ BitVec 32))) (Intermediate!7731 (undefined!8543 Bool) (index!33294 (_ BitVec 32)) (x!64177 (_ BitVec 32))) (Undefined!7731) (MissingVacant!7731 (index!33295 (_ BitVec 32))) )
))
(declare-fun lt!338285 () SeekEntryResult!7731)

(declare-fun b!759097 () Bool)

(declare-fun e!423204 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42035 (_ BitVec 32)) SeekEntryResult!7731)

(assert (=> b!759097 (= e!423204 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20131 a!3186) j!159) a!3186 mask!3328) lt!338285))))

(declare-fun b!759098 () Bool)

(declare-fun res!513643 () Bool)

(assert (=> b!759098 (=> (not res!513643) (not e!423202))))

(declare-datatypes ((List!14133 0))(
  ( (Nil!14130) (Cons!14129 (h!15201 (_ BitVec 64)) (t!20448 List!14133)) )
))
(declare-fun arrayNoDuplicates!0 (array!42035 (_ BitVec 32) List!14133) Bool)

(assert (=> b!759098 (= res!513643 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14130))))

(declare-fun e!423201 () Bool)

(declare-fun lt!338283 () SeekEntryResult!7731)

(declare-fun b!759099 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42035 (_ BitVec 32)) SeekEntryResult!7731)

(assert (=> b!759099 (= e!423201 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20131 a!3186) j!159) a!3186 mask!3328) lt!338283))))

(declare-fun b!759100 () Bool)

(assert (=> b!759100 (= e!423200 e!423202)))

(declare-fun res!513636 () Bool)

(assert (=> b!759100 (=> (not res!513636) (not e!423202))))

(declare-fun lt!338280 () SeekEntryResult!7731)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!759100 (= res!513636 (or (= lt!338280 (MissingZero!7731 i!1173)) (= lt!338280 (MissingVacant!7731 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42035 (_ BitVec 32)) SeekEntryResult!7731)

(assert (=> b!759100 (= lt!338280 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!759101 () Bool)

(declare-fun res!513645 () Bool)

(assert (=> b!759101 (=> (not res!513645) (not e!423200))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!759101 (= res!513645 (validKeyInArray!0 (select (arr!20131 a!3186) j!159)))))

(declare-fun b!759102 () Bool)

(declare-fun e!423205 () Bool)

(assert (=> b!759102 (= e!423202 e!423205)))

(declare-fun res!513637 () Bool)

(assert (=> b!759102 (=> (not res!513637) (not e!423205))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!759102 (= res!513637 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20131 a!3186) j!159) mask!3328) (select (arr!20131 a!3186) j!159) a!3186 mask!3328) lt!338283))))

(assert (=> b!759102 (= lt!338283 (Intermediate!7731 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!759103 () Bool)

(declare-fun res!513648 () Bool)

(assert (=> b!759103 (=> (not res!513648) (not e!423205))))

(assert (=> b!759103 (= res!513648 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20131 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!759104 () Bool)

(assert (=> b!759104 (= e!423201 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20131 a!3186) j!159) a!3186 mask!3328) (Found!7731 j!159)))))

(declare-fun b!759105 () Bool)

(declare-fun e!423206 () Bool)

(assert (=> b!759105 (= e!423206 e!423204)))

(declare-fun res!513639 () Bool)

(assert (=> b!759105 (=> (not res!513639) (not e!423204))))

(assert (=> b!759105 (= res!513639 (= (seekEntryOrOpen!0 (select (arr!20131 a!3186) j!159) a!3186 mask!3328) lt!338285))))

(assert (=> b!759105 (= lt!338285 (Found!7731 j!159))))

(declare-fun b!759106 () Bool)

(declare-fun res!513644 () Bool)

(assert (=> b!759106 (=> (not res!513644) (not e!423200))))

(assert (=> b!759106 (= res!513644 (and (= (size!20552 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20552 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20552 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!759107 () Bool)

(declare-fun res!513649 () Bool)

(assert (=> b!759107 (=> (not res!513649) (not e!423205))))

(assert (=> b!759107 (= res!513649 e!423201)))

(declare-fun c!83110 () Bool)

(assert (=> b!759107 (= c!83110 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!759108 () Bool)

(declare-fun res!513647 () Bool)

(assert (=> b!759108 (=> (not res!513647) (not e!423200))))

(assert (=> b!759108 (= res!513647 (validKeyInArray!0 k0!2102))))

(declare-fun b!759109 () Bool)

(declare-fun res!513638 () Bool)

(assert (=> b!759109 (=> (not res!513638) (not e!423200))))

(declare-fun arrayContainsKey!0 (array!42035 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!759109 (= res!513638 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!759110 () Bool)

(declare-fun e!423199 () Bool)

(assert (=> b!759110 (= e!423199 (not true))))

(assert (=> b!759110 e!423206))

(declare-fun res!513640 () Bool)

(assert (=> b!759110 (=> (not res!513640) (not e!423206))))

(assert (=> b!759110 (= res!513640 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26302 0))(
  ( (Unit!26303) )
))
(declare-fun lt!338281 () Unit!26302)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42035 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26302)

(assert (=> b!759110 (= lt!338281 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!759111 () Bool)

(assert (=> b!759111 (= e!423205 e!423199)))

(declare-fun res!513650 () Bool)

(assert (=> b!759111 (=> (not res!513650) (not e!423199))))

(declare-fun lt!338282 () array!42035)

(declare-fun lt!338284 () (_ BitVec 64))

(assert (=> b!759111 (= res!513650 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!338284 mask!3328) lt!338284 lt!338282 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!338284 lt!338282 mask!3328)))))

(assert (=> b!759111 (= lt!338284 (select (store (arr!20131 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!759111 (= lt!338282 (array!42036 (store (arr!20131 a!3186) i!1173 k0!2102) (size!20552 a!3186)))))

(assert (= (and start!65862 res!513642) b!759106))

(assert (= (and b!759106 res!513644) b!759101))

(assert (= (and b!759101 res!513645) b!759108))

(assert (= (and b!759108 res!513647) b!759109))

(assert (= (and b!759109 res!513638) b!759100))

(assert (= (and b!759100 res!513636) b!759096))

(assert (= (and b!759096 res!513646) b!759098))

(assert (= (and b!759098 res!513643) b!759095))

(assert (= (and b!759095 res!513641) b!759102))

(assert (= (and b!759102 res!513637) b!759103))

(assert (= (and b!759103 res!513648) b!759107))

(assert (= (and b!759107 c!83110) b!759099))

(assert (= (and b!759107 (not c!83110)) b!759104))

(assert (= (and b!759107 res!513649) b!759111))

(assert (= (and b!759111 res!513650) b!759110))

(assert (= (and b!759110 res!513640) b!759105))

(assert (= (and b!759105 res!513639) b!759097))

(declare-fun m!706487 () Bool)

(assert (=> b!759098 m!706487))

(declare-fun m!706489 () Bool)

(assert (=> b!759110 m!706489))

(declare-fun m!706491 () Bool)

(assert (=> b!759110 m!706491))

(declare-fun m!706493 () Bool)

(assert (=> b!759104 m!706493))

(assert (=> b!759104 m!706493))

(declare-fun m!706495 () Bool)

(assert (=> b!759104 m!706495))

(declare-fun m!706497 () Bool)

(assert (=> b!759096 m!706497))

(declare-fun m!706499 () Bool)

(assert (=> b!759103 m!706499))

(assert (=> b!759099 m!706493))

(assert (=> b!759099 m!706493))

(declare-fun m!706501 () Bool)

(assert (=> b!759099 m!706501))

(declare-fun m!706503 () Bool)

(assert (=> b!759111 m!706503))

(declare-fun m!706505 () Bool)

(assert (=> b!759111 m!706505))

(declare-fun m!706507 () Bool)

(assert (=> b!759111 m!706507))

(declare-fun m!706509 () Bool)

(assert (=> b!759111 m!706509))

(assert (=> b!759111 m!706503))

(declare-fun m!706511 () Bool)

(assert (=> b!759111 m!706511))

(assert (=> b!759097 m!706493))

(assert (=> b!759097 m!706493))

(declare-fun m!706513 () Bool)

(assert (=> b!759097 m!706513))

(assert (=> b!759101 m!706493))

(assert (=> b!759101 m!706493))

(declare-fun m!706515 () Bool)

(assert (=> b!759101 m!706515))

(declare-fun m!706517 () Bool)

(assert (=> start!65862 m!706517))

(declare-fun m!706519 () Bool)

(assert (=> start!65862 m!706519))

(declare-fun m!706521 () Bool)

(assert (=> b!759100 m!706521))

(assert (=> b!759102 m!706493))

(assert (=> b!759102 m!706493))

(declare-fun m!706523 () Bool)

(assert (=> b!759102 m!706523))

(assert (=> b!759102 m!706523))

(assert (=> b!759102 m!706493))

(declare-fun m!706525 () Bool)

(assert (=> b!759102 m!706525))

(declare-fun m!706527 () Bool)

(assert (=> b!759109 m!706527))

(assert (=> b!759105 m!706493))

(assert (=> b!759105 m!706493))

(declare-fun m!706529 () Bool)

(assert (=> b!759105 m!706529))

(declare-fun m!706531 () Bool)

(assert (=> b!759108 m!706531))

(check-sat (not b!759102) (not b!759099) (not b!759104) (not b!759111) (not b!759109) (not b!759105) (not b!759097) (not start!65862) (not b!759108) (not b!759100) (not b!759096) (not b!759101) (not b!759098) (not b!759110))
(check-sat)
