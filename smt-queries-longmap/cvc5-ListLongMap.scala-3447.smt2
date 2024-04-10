; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47802 () Bool)

(assert start!47802)

(declare-fun b!526642 () Bool)

(declare-fun e!306964 () Bool)

(declare-fun e!306965 () Bool)

(assert (=> b!526642 (= e!306964 (not e!306965))))

(declare-fun res!323240 () Bool)

(assert (=> b!526642 (=> res!323240 e!306965)))

(declare-datatypes ((array!33439 0))(
  ( (array!33440 (arr!16071 (Array (_ BitVec 32) (_ BitVec 64))) (size!16435 (_ BitVec 32))) )
))
(declare-fun lt!242263 () array!33439)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!242258 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4538 0))(
  ( (MissingZero!4538 (index!20364 (_ BitVec 32))) (Found!4538 (index!20365 (_ BitVec 32))) (Intermediate!4538 (undefined!5350 Bool) (index!20366 (_ BitVec 32)) (x!49335 (_ BitVec 32))) (Undefined!4538) (MissingVacant!4538 (index!20367 (_ BitVec 32))) )
))
(declare-fun lt!242255 () SeekEntryResult!4538)

(declare-fun lt!242260 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33439 (_ BitVec 32)) SeekEntryResult!4538)

(assert (=> b!526642 (= res!323240 (= lt!242255 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242258 lt!242260 lt!242263 mask!3524)))))

(declare-fun a!3235 () array!33439)

(declare-fun lt!242259 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!526642 (= lt!242255 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242259 (select (arr!16071 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!526642 (= lt!242258 (toIndex!0 lt!242260 mask!3524))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!526642 (= lt!242260 (select (store (arr!16071 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!526642 (= lt!242259 (toIndex!0 (select (arr!16071 a!3235) j!176) mask!3524))))

(assert (=> b!526642 (= lt!242263 (array!33440 (store (arr!16071 a!3235) i!1204 k!2280) (size!16435 a!3235)))))

(declare-fun e!306963 () Bool)

(assert (=> b!526642 e!306963))

(declare-fun res!323243 () Bool)

(assert (=> b!526642 (=> (not res!323243) (not e!306963))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33439 (_ BitVec 32)) Bool)

(assert (=> b!526642 (= res!323243 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16604 0))(
  ( (Unit!16605) )
))
(declare-fun lt!242254 () Unit!16604)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33439 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16604)

(assert (=> b!526642 (= lt!242254 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!526643 () Bool)

(declare-fun res!323238 () Bool)

(assert (=> b!526643 (=> res!323238 e!306965)))

(assert (=> b!526643 (= res!323238 (or (undefined!5350 lt!242255) (not (is-Intermediate!4538 lt!242255))))))

(declare-fun b!526644 () Bool)

(declare-fun e!306961 () Bool)

(assert (=> b!526644 (= e!306961 false)))

(declare-fun b!526645 () Bool)

(declare-fun res!323239 () Bool)

(assert (=> b!526645 (=> (not res!323239) (not e!306964))))

(assert (=> b!526645 (= res!323239 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!323244 () Bool)

(declare-fun e!306966 () Bool)

(assert (=> start!47802 (=> (not res!323244) (not e!306966))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47802 (= res!323244 (validMask!0 mask!3524))))

(assert (=> start!47802 e!306966))

(assert (=> start!47802 true))

(declare-fun array_inv!11867 (array!33439) Bool)

(assert (=> start!47802 (array_inv!11867 a!3235)))

(declare-fun b!526646 () Bool)

(declare-fun res!323241 () Bool)

(assert (=> b!526646 (=> (not res!323241) (not e!306964))))

(declare-datatypes ((List!10229 0))(
  ( (Nil!10226) (Cons!10225 (h!11156 (_ BitVec 64)) (t!16457 List!10229)) )
))
(declare-fun arrayNoDuplicates!0 (array!33439 (_ BitVec 32) List!10229) Bool)

(assert (=> b!526646 (= res!323241 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10226))))

(declare-fun b!526647 () Bool)

(assert (=> b!526647 (= e!306966 e!306964)))

(declare-fun res!323237 () Bool)

(assert (=> b!526647 (=> (not res!323237) (not e!306964))))

(declare-fun lt!242257 () SeekEntryResult!4538)

(assert (=> b!526647 (= res!323237 (or (= lt!242257 (MissingZero!4538 i!1204)) (= lt!242257 (MissingVacant!4538 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33439 (_ BitVec 32)) SeekEntryResult!4538)

(assert (=> b!526647 (= lt!242257 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!526648 () Bool)

(declare-fun res!323236 () Bool)

(assert (=> b!526648 (=> (not res!323236) (not e!306966))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!526648 (= res!323236 (validKeyInArray!0 (select (arr!16071 a!3235) j!176)))))

(declare-fun b!526649 () Bool)

(assert (=> b!526649 (= e!306965 true)))

(assert (=> b!526649 (= (index!20366 lt!242255) i!1204)))

(declare-fun lt!242256 () Unit!16604)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33439 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16604)

(assert (=> b!526649 (= lt!242256 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!242259 #b00000000000000000000000000000000 (index!20366 lt!242255) (x!49335 lt!242255) mask!3524))))

(assert (=> b!526649 (and (or (= (select (arr!16071 a!3235) (index!20366 lt!242255)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16071 a!3235) (index!20366 lt!242255)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16071 a!3235) (index!20366 lt!242255)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16071 a!3235) (index!20366 lt!242255)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!242262 () Unit!16604)

(declare-fun e!306960 () Unit!16604)

(assert (=> b!526649 (= lt!242262 e!306960)))

(declare-fun c!62009 () Bool)

(assert (=> b!526649 (= c!62009 (= (select (arr!16071 a!3235) (index!20366 lt!242255)) (select (arr!16071 a!3235) j!176)))))

(assert (=> b!526649 (and (bvslt (x!49335 lt!242255) #b01111111111111111111111111111110) (or (= (select (arr!16071 a!3235) (index!20366 lt!242255)) (select (arr!16071 a!3235) j!176)) (= (select (arr!16071 a!3235) (index!20366 lt!242255)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16071 a!3235) (index!20366 lt!242255)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!526650 () Bool)

(declare-fun Unit!16606 () Unit!16604)

(assert (=> b!526650 (= e!306960 Unit!16606)))

(declare-fun lt!242261 () Unit!16604)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33439 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16604)

(assert (=> b!526650 (= lt!242261 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!242259 #b00000000000000000000000000000000 (index!20366 lt!242255) (x!49335 lt!242255) mask!3524))))

(declare-fun res!323242 () Bool)

(assert (=> b!526650 (= res!323242 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242259 lt!242260 lt!242263 mask!3524) (Intermediate!4538 false (index!20366 lt!242255) (x!49335 lt!242255))))))

(assert (=> b!526650 (=> (not res!323242) (not e!306961))))

(assert (=> b!526650 e!306961))

(declare-fun b!526651 () Bool)

(assert (=> b!526651 (= e!306963 (= (seekEntryOrOpen!0 (select (arr!16071 a!3235) j!176) a!3235 mask!3524) (Found!4538 j!176)))))

(declare-fun b!526652 () Bool)

(declare-fun res!323245 () Bool)

(assert (=> b!526652 (=> (not res!323245) (not e!306966))))

(assert (=> b!526652 (= res!323245 (validKeyInArray!0 k!2280))))

(declare-fun b!526653 () Bool)

(declare-fun Unit!16607 () Unit!16604)

(assert (=> b!526653 (= e!306960 Unit!16607)))

(declare-fun b!526654 () Bool)

(declare-fun res!323235 () Bool)

(assert (=> b!526654 (=> (not res!323235) (not e!306966))))

(declare-fun arrayContainsKey!0 (array!33439 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!526654 (= res!323235 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!526655 () Bool)

(declare-fun res!323246 () Bool)

(assert (=> b!526655 (=> (not res!323246) (not e!306966))))

(assert (=> b!526655 (= res!323246 (and (= (size!16435 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16435 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16435 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!47802 res!323244) b!526655))

(assert (= (and b!526655 res!323246) b!526648))

(assert (= (and b!526648 res!323236) b!526652))

(assert (= (and b!526652 res!323245) b!526654))

(assert (= (and b!526654 res!323235) b!526647))

(assert (= (and b!526647 res!323237) b!526645))

(assert (= (and b!526645 res!323239) b!526646))

(assert (= (and b!526646 res!323241) b!526642))

(assert (= (and b!526642 res!323243) b!526651))

(assert (= (and b!526642 (not res!323240)) b!526643))

(assert (= (and b!526643 (not res!323238)) b!526649))

(assert (= (and b!526649 c!62009) b!526650))

(assert (= (and b!526649 (not c!62009)) b!526653))

(assert (= (and b!526650 res!323242) b!526644))

(declare-fun m!507357 () Bool)

(assert (=> b!526648 m!507357))

(assert (=> b!526648 m!507357))

(declare-fun m!507359 () Bool)

(assert (=> b!526648 m!507359))

(declare-fun m!507361 () Bool)

(assert (=> start!47802 m!507361))

(declare-fun m!507363 () Bool)

(assert (=> start!47802 m!507363))

(declare-fun m!507365 () Bool)

(assert (=> b!526647 m!507365))

(declare-fun m!507367 () Bool)

(assert (=> b!526646 m!507367))

(declare-fun m!507369 () Bool)

(assert (=> b!526654 m!507369))

(declare-fun m!507371 () Bool)

(assert (=> b!526650 m!507371))

(declare-fun m!507373 () Bool)

(assert (=> b!526650 m!507373))

(declare-fun m!507375 () Bool)

(assert (=> b!526649 m!507375))

(declare-fun m!507377 () Bool)

(assert (=> b!526649 m!507377))

(assert (=> b!526649 m!507357))

(declare-fun m!507379 () Bool)

(assert (=> b!526642 m!507379))

(declare-fun m!507381 () Bool)

(assert (=> b!526642 m!507381))

(declare-fun m!507383 () Bool)

(assert (=> b!526642 m!507383))

(declare-fun m!507385 () Bool)

(assert (=> b!526642 m!507385))

(declare-fun m!507387 () Bool)

(assert (=> b!526642 m!507387))

(assert (=> b!526642 m!507357))

(declare-fun m!507389 () Bool)

(assert (=> b!526642 m!507389))

(assert (=> b!526642 m!507357))

(declare-fun m!507391 () Bool)

(assert (=> b!526642 m!507391))

(assert (=> b!526642 m!507357))

(declare-fun m!507393 () Bool)

(assert (=> b!526642 m!507393))

(assert (=> b!526651 m!507357))

(assert (=> b!526651 m!507357))

(declare-fun m!507395 () Bool)

(assert (=> b!526651 m!507395))

(declare-fun m!507397 () Bool)

(assert (=> b!526645 m!507397))

(declare-fun m!507399 () Bool)

(assert (=> b!526652 m!507399))

(push 1)

