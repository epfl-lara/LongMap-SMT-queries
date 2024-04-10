; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44464 () Bool)

(assert start!44464)

(declare-fun b!488358 () Bool)

(declare-fun e!287288 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(assert (=> b!488358 (= e!287288 (not (bvsge mask!3524 #b00000000000000000000000000000000)))))

(declare-fun e!287287 () Bool)

(assert (=> b!488358 e!287287))

(declare-fun res!291524 () Bool)

(assert (=> b!488358 (=> (not res!291524) (not e!287287))))

(declare-datatypes ((array!31619 0))(
  ( (array!31620 (arr!15200 (Array (_ BitVec 32) (_ BitVec 64))) (size!15564 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31619)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31619 (_ BitVec 32)) Bool)

(assert (=> b!488358 (= res!291524 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14280 0))(
  ( (Unit!14281) )
))
(declare-fun lt!220378 () Unit!14280)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31619 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14280)

(assert (=> b!488358 (= lt!220378 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!488359 () Bool)

(declare-fun res!291527 () Bool)

(declare-fun e!287289 () Bool)

(assert (=> b!488359 (=> (not res!291527) (not e!287289))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!488359 (= res!291527 (validKeyInArray!0 (select (arr!15200 a!3235) j!176)))))

(declare-fun b!488360 () Bool)

(declare-fun res!291526 () Bool)

(assert (=> b!488360 (=> (not res!291526) (not e!287289))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!488360 (= res!291526 (validKeyInArray!0 k!2280))))

(declare-fun b!488361 () Bool)

(declare-fun res!291525 () Bool)

(assert (=> b!488361 (=> (not res!291525) (not e!287288))))

(assert (=> b!488361 (= res!291525 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!488362 () Bool)

(assert (=> b!488362 (= e!287289 e!287288)))

(declare-fun res!291523 () Bool)

(assert (=> b!488362 (=> (not res!291523) (not e!287288))))

(declare-datatypes ((SeekEntryResult!3667 0))(
  ( (MissingZero!3667 (index!16847 (_ BitVec 32))) (Found!3667 (index!16848 (_ BitVec 32))) (Intermediate!3667 (undefined!4479 Bool) (index!16849 (_ BitVec 32)) (x!45962 (_ BitVec 32))) (Undefined!3667) (MissingVacant!3667 (index!16850 (_ BitVec 32))) )
))
(declare-fun lt!220377 () SeekEntryResult!3667)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!488362 (= res!291523 (or (= lt!220377 (MissingZero!3667 i!1204)) (= lt!220377 (MissingVacant!3667 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31619 (_ BitVec 32)) SeekEntryResult!3667)

(assert (=> b!488362 (= lt!220377 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!291520 () Bool)

(assert (=> start!44464 (=> (not res!291520) (not e!287289))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44464 (= res!291520 (validMask!0 mask!3524))))

(assert (=> start!44464 e!287289))

(assert (=> start!44464 true))

(declare-fun array_inv!10996 (array!31619) Bool)

(assert (=> start!44464 (array_inv!10996 a!3235)))

(declare-fun b!488363 () Bool)

(assert (=> b!488363 (= e!287287 (= (seekEntryOrOpen!0 (select (arr!15200 a!3235) j!176) a!3235 mask!3524) (Found!3667 j!176)))))

(declare-fun b!488364 () Bool)

(declare-fun res!291519 () Bool)

(assert (=> b!488364 (=> (not res!291519) (not e!287288))))

(declare-datatypes ((List!9358 0))(
  ( (Nil!9355) (Cons!9354 (h!10213 (_ BitVec 64)) (t!15586 List!9358)) )
))
(declare-fun arrayNoDuplicates!0 (array!31619 (_ BitVec 32) List!9358) Bool)

(assert (=> b!488364 (= res!291519 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9355))))

(declare-fun b!488365 () Bool)

(declare-fun res!291521 () Bool)

(assert (=> b!488365 (=> (not res!291521) (not e!287289))))

(declare-fun arrayContainsKey!0 (array!31619 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!488365 (= res!291521 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!488366 () Bool)

(declare-fun res!291522 () Bool)

(assert (=> b!488366 (=> (not res!291522) (not e!287289))))

(assert (=> b!488366 (= res!291522 (and (= (size!15564 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15564 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15564 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!44464 res!291520) b!488366))

(assert (= (and b!488366 res!291522) b!488359))

(assert (= (and b!488359 res!291527) b!488360))

(assert (= (and b!488360 res!291526) b!488365))

(assert (= (and b!488365 res!291521) b!488362))

(assert (= (and b!488362 res!291523) b!488361))

(assert (= (and b!488361 res!291525) b!488364))

(assert (= (and b!488364 res!291519) b!488358))

(assert (= (and b!488358 res!291524) b!488363))

(declare-fun m!468099 () Bool)

(assert (=> b!488358 m!468099))

(declare-fun m!468101 () Bool)

(assert (=> b!488358 m!468101))

(declare-fun m!468103 () Bool)

(assert (=> b!488360 m!468103))

(declare-fun m!468105 () Bool)

(assert (=> b!488361 m!468105))

(declare-fun m!468107 () Bool)

(assert (=> b!488359 m!468107))

(assert (=> b!488359 m!468107))

(declare-fun m!468109 () Bool)

(assert (=> b!488359 m!468109))

(declare-fun m!468111 () Bool)

(assert (=> b!488365 m!468111))

(declare-fun m!468113 () Bool)

(assert (=> b!488362 m!468113))

(declare-fun m!468115 () Bool)

(assert (=> start!44464 m!468115))

(declare-fun m!468117 () Bool)

(assert (=> start!44464 m!468117))

(assert (=> b!488363 m!468107))

(assert (=> b!488363 m!468107))

(declare-fun m!468119 () Bool)

(assert (=> b!488363 m!468119))

(declare-fun m!468121 () Bool)

(assert (=> b!488364 m!468121))

(push 1)

(assert (not start!44464))

(assert (not b!488359))

(assert (not b!488361))

(assert (not b!488358))

(assert (not b!488364))

(assert (not b!488363))

(assert (not b!488362))

(assert (not b!488365))

(assert (not b!488360))

(check-sat)

(pop 1)

(push 1)

(check-sat)

