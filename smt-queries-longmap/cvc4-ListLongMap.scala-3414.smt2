; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47410 () Bool)

(assert start!47410)

(declare-fun b!521578 () Bool)

(declare-fun res!319361 () Bool)

(declare-fun e!304290 () Bool)

(assert (=> b!521578 (=> res!319361 e!304290)))

(declare-datatypes ((SeekEntryResult!4441 0))(
  ( (MissingZero!4441 (index!19967 (_ BitVec 32))) (Found!4441 (index!19968 (_ BitVec 32))) (Intermediate!4441 (undefined!5253 Bool) (index!19969 (_ BitVec 32)) (x!48947 (_ BitVec 32))) (Undefined!4441) (MissingVacant!4441 (index!19970 (_ BitVec 32))) )
))
(declare-fun lt!239048 () SeekEntryResult!4441)

(assert (=> b!521578 (= res!319361 (or (undefined!5253 lt!239048) (not (is-Intermediate!4441 lt!239048))))))

(declare-fun b!521579 () Bool)

(declare-fun res!319366 () Bool)

(declare-fun e!304285 () Bool)

(assert (=> b!521579 (=> (not res!319366) (not e!304285))))

(declare-datatypes ((array!33236 0))(
  ( (array!33237 (arr!15974 (Array (_ BitVec 32) (_ BitVec 64))) (size!16338 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33236)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33236 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!521579 (= res!319366 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!521580 () Bool)

(declare-fun e!304289 () Bool)

(assert (=> b!521580 (= e!304285 e!304289)))

(declare-fun res!319364 () Bool)

(assert (=> b!521580 (=> (not res!319364) (not e!304289))))

(declare-fun lt!239051 () SeekEntryResult!4441)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!521580 (= res!319364 (or (= lt!239051 (MissingZero!4441 i!1204)) (= lt!239051 (MissingVacant!4441 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33236 (_ BitVec 32)) SeekEntryResult!4441)

(assert (=> b!521580 (= lt!239051 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!521581 () Bool)

(declare-datatypes ((Unit!16216 0))(
  ( (Unit!16217) )
))
(declare-fun e!304286 () Unit!16216)

(declare-fun Unit!16218 () Unit!16216)

(assert (=> b!521581 (= e!304286 Unit!16218)))

(declare-fun lt!239054 () Unit!16216)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!239049 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33236 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16216)

(assert (=> b!521581 (= lt!239054 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!239049 #b00000000000000000000000000000000 (index!19969 lt!239048) (x!48947 lt!239048) mask!3524))))

(declare-fun lt!239056 () (_ BitVec 64))

(declare-fun lt!239053 () array!33236)

(declare-fun res!319360 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33236 (_ BitVec 32)) SeekEntryResult!4441)

(assert (=> b!521581 (= res!319360 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239049 lt!239056 lt!239053 mask!3524) (Intermediate!4441 false (index!19969 lt!239048) (x!48947 lt!239048))))))

(declare-fun e!304287 () Bool)

(assert (=> b!521581 (=> (not res!319360) (not e!304287))))

(assert (=> b!521581 e!304287))

(declare-fun b!521582 () Bool)

(assert (=> b!521582 (= e!304287 false)))

(declare-fun res!319359 () Bool)

(assert (=> start!47410 (=> (not res!319359) (not e!304285))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47410 (= res!319359 (validMask!0 mask!3524))))

(assert (=> start!47410 e!304285))

(assert (=> start!47410 true))

(declare-fun array_inv!11770 (array!33236) Bool)

(assert (=> start!47410 (array_inv!11770 a!3235)))

(declare-fun b!521583 () Bool)

(declare-fun res!319357 () Bool)

(assert (=> b!521583 (=> (not res!319357) (not e!304285))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!521583 (= res!319357 (validKeyInArray!0 (select (arr!15974 a!3235) j!176)))))

(declare-fun b!521584 () Bool)

(assert (=> b!521584 (= e!304290 true)))

(assert (=> b!521584 (and (or (= (select (arr!15974 a!3235) (index!19969 lt!239048)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15974 a!3235) (index!19969 lt!239048)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15974 a!3235) (index!19969 lt!239048)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15974 a!3235) (index!19969 lt!239048)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!239052 () Unit!16216)

(assert (=> b!521584 (= lt!239052 e!304286)))

(declare-fun c!61412 () Bool)

(assert (=> b!521584 (= c!61412 (= (select (arr!15974 a!3235) (index!19969 lt!239048)) (select (arr!15974 a!3235) j!176)))))

(assert (=> b!521584 (and (bvslt (x!48947 lt!239048) #b01111111111111111111111111111110) (or (= (select (arr!15974 a!3235) (index!19969 lt!239048)) (select (arr!15974 a!3235) j!176)) (= (select (arr!15974 a!3235) (index!19969 lt!239048)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15974 a!3235) (index!19969 lt!239048)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!521585 () Bool)

(declare-fun res!319358 () Bool)

(assert (=> b!521585 (=> (not res!319358) (not e!304285))))

(assert (=> b!521585 (= res!319358 (and (= (size!16338 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16338 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16338 a!3235)) (not (= i!1204 j!176))))))

(declare-fun e!304288 () Bool)

(declare-fun b!521586 () Bool)

(assert (=> b!521586 (= e!304288 (= (seekEntryOrOpen!0 (select (arr!15974 a!3235) j!176) a!3235 mask!3524) (Found!4441 j!176)))))

(declare-fun b!521587 () Bool)

(declare-fun Unit!16219 () Unit!16216)

(assert (=> b!521587 (= e!304286 Unit!16219)))

(declare-fun b!521588 () Bool)

(declare-fun res!319356 () Bool)

(assert (=> b!521588 (=> (not res!319356) (not e!304289))))

(declare-datatypes ((List!10132 0))(
  ( (Nil!10129) (Cons!10128 (h!11050 (_ BitVec 64)) (t!16360 List!10132)) )
))
(declare-fun arrayNoDuplicates!0 (array!33236 (_ BitVec 32) List!10132) Bool)

(assert (=> b!521588 (= res!319356 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10129))))

(declare-fun b!521589 () Bool)

(assert (=> b!521589 (= e!304289 (not e!304290))))

(declare-fun res!319365 () Bool)

(assert (=> b!521589 (=> res!319365 e!304290)))

(declare-fun lt!239055 () (_ BitVec 32))

(assert (=> b!521589 (= res!319365 (= lt!239048 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239055 lt!239056 lt!239053 mask!3524)))))

(assert (=> b!521589 (= lt!239048 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239049 (select (arr!15974 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!521589 (= lt!239055 (toIndex!0 lt!239056 mask!3524))))

(assert (=> b!521589 (= lt!239056 (select (store (arr!15974 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!521589 (= lt!239049 (toIndex!0 (select (arr!15974 a!3235) j!176) mask!3524))))

(assert (=> b!521589 (= lt!239053 (array!33237 (store (arr!15974 a!3235) i!1204 k!2280) (size!16338 a!3235)))))

(assert (=> b!521589 e!304288))

(declare-fun res!319367 () Bool)

(assert (=> b!521589 (=> (not res!319367) (not e!304288))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33236 (_ BitVec 32)) Bool)

(assert (=> b!521589 (= res!319367 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!239050 () Unit!16216)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33236 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16216)

(assert (=> b!521589 (= lt!239050 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!521590 () Bool)

(declare-fun res!319363 () Bool)

(assert (=> b!521590 (=> (not res!319363) (not e!304285))))

(assert (=> b!521590 (= res!319363 (validKeyInArray!0 k!2280))))

(declare-fun b!521591 () Bool)

(declare-fun res!319362 () Bool)

(assert (=> b!521591 (=> (not res!319362) (not e!304289))))

(assert (=> b!521591 (= res!319362 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!47410 res!319359) b!521585))

(assert (= (and b!521585 res!319358) b!521583))

(assert (= (and b!521583 res!319357) b!521590))

(assert (= (and b!521590 res!319363) b!521579))

(assert (= (and b!521579 res!319366) b!521580))

(assert (= (and b!521580 res!319364) b!521591))

(assert (= (and b!521591 res!319362) b!521588))

(assert (= (and b!521588 res!319356) b!521589))

(assert (= (and b!521589 res!319367) b!521586))

(assert (= (and b!521589 (not res!319365)) b!521578))

(assert (= (and b!521578 (not res!319361)) b!521584))

(assert (= (and b!521584 c!61412) b!521581))

(assert (= (and b!521584 (not c!61412)) b!521587))

(assert (= (and b!521581 res!319360) b!521582))

(declare-fun m!502491 () Bool)

(assert (=> b!521583 m!502491))

(assert (=> b!521583 m!502491))

(declare-fun m!502493 () Bool)

(assert (=> b!521583 m!502493))

(declare-fun m!502495 () Bool)

(assert (=> b!521588 m!502495))

(declare-fun m!502497 () Bool)

(assert (=> b!521581 m!502497))

(declare-fun m!502499 () Bool)

(assert (=> b!521581 m!502499))

(declare-fun m!502501 () Bool)

(assert (=> b!521580 m!502501))

(declare-fun m!502503 () Bool)

(assert (=> b!521584 m!502503))

(assert (=> b!521584 m!502491))

(declare-fun m!502505 () Bool)

(assert (=> b!521591 m!502505))

(assert (=> b!521586 m!502491))

(assert (=> b!521586 m!502491))

(declare-fun m!502507 () Bool)

(assert (=> b!521586 m!502507))

(declare-fun m!502509 () Bool)

(assert (=> start!47410 m!502509))

(declare-fun m!502511 () Bool)

(assert (=> start!47410 m!502511))

(declare-fun m!502513 () Bool)

(assert (=> b!521589 m!502513))

(declare-fun m!502515 () Bool)

(assert (=> b!521589 m!502515))

(declare-fun m!502517 () Bool)

(assert (=> b!521589 m!502517))

(declare-fun m!502519 () Bool)

(assert (=> b!521589 m!502519))

(assert (=> b!521589 m!502491))

(declare-fun m!502521 () Bool)

(assert (=> b!521589 m!502521))

(assert (=> b!521589 m!502491))

(declare-fun m!502523 () Bool)

(assert (=> b!521589 m!502523))

(assert (=> b!521589 m!502491))

(declare-fun m!502525 () Bool)

(assert (=> b!521589 m!502525))

(declare-fun m!502527 () Bool)

(assert (=> b!521589 m!502527))

(declare-fun m!502529 () Bool)

(assert (=> b!521590 m!502529))

(declare-fun m!502531 () Bool)

(assert (=> b!521579 m!502531))

(push 1)

