; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44508 () Bool)

(assert start!44508)

(declare-fun b!488378 () Bool)

(declare-fun res!291572 () Bool)

(declare-fun e!287288 () Bool)

(assert (=> b!488378 (=> (not res!291572) (not e!287288))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!488378 (= res!291572 (validKeyInArray!0 k0!2280))))

(declare-fun b!488379 () Bool)

(declare-fun e!287286 () Bool)

(assert (=> b!488379 (= e!287286 (not true))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31628 0))(
  ( (array!31629 (arr!15203 (Array (_ BitVec 32) (_ BitVec 64))) (size!15568 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31628)

(declare-fun lt!220250 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!488379 (= lt!220250 (toIndex!0 (select (store (arr!15203 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(declare-fun e!287289 () Bool)

(assert (=> b!488379 e!287289))

(declare-fun res!291568 () Bool)

(assert (=> b!488379 (=> (not res!291568) (not e!287289))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31628 (_ BitVec 32)) Bool)

(assert (=> b!488379 (= res!291568 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14266 0))(
  ( (Unit!14267) )
))
(declare-fun lt!220252 () Unit!14266)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31628 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14266)

(assert (=> b!488379 (= lt!220252 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!291573 () Bool)

(assert (=> start!44508 (=> (not res!291573) (not e!287288))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44508 (= res!291573 (validMask!0 mask!3524))))

(assert (=> start!44508 e!287288))

(assert (=> start!44508 true))

(declare-fun array_inv!11086 (array!31628) Bool)

(assert (=> start!44508 (array_inv!11086 a!3235)))

(declare-fun b!488380 () Bool)

(declare-fun res!291571 () Bool)

(assert (=> b!488380 (=> (not res!291571) (not e!287286))))

(declare-datatypes ((List!9400 0))(
  ( (Nil!9397) (Cons!9396 (h!10255 (_ BitVec 64)) (t!15619 List!9400)) )
))
(declare-fun arrayNoDuplicates!0 (array!31628 (_ BitVec 32) List!9400) Bool)

(assert (=> b!488380 (= res!291571 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9397))))

(declare-fun b!488381 () Bool)

(declare-fun res!291570 () Bool)

(assert (=> b!488381 (=> (not res!291570) (not e!287286))))

(assert (=> b!488381 (= res!291570 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!488382 () Bool)

(declare-fun res!291574 () Bool)

(assert (=> b!488382 (=> (not res!291574) (not e!287288))))

(assert (=> b!488382 (= res!291574 (and (= (size!15568 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15568 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15568 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!488383 () Bool)

(declare-fun res!291567 () Bool)

(assert (=> b!488383 (=> (not res!291567) (not e!287288))))

(assert (=> b!488383 (= res!291567 (validKeyInArray!0 (select (arr!15203 a!3235) j!176)))))

(declare-fun b!488384 () Bool)

(assert (=> b!488384 (= e!287288 e!287286)))

(declare-fun res!291569 () Bool)

(assert (=> b!488384 (=> (not res!291569) (not e!287286))))

(declare-datatypes ((SeekEntryResult!3667 0))(
  ( (MissingZero!3667 (index!16847 (_ BitVec 32))) (Found!3667 (index!16848 (_ BitVec 32))) (Intermediate!3667 (undefined!4479 Bool) (index!16849 (_ BitVec 32)) (x!45973 (_ BitVec 32))) (Undefined!3667) (MissingVacant!3667 (index!16850 (_ BitVec 32))) )
))
(declare-fun lt!220251 () SeekEntryResult!3667)

(assert (=> b!488384 (= res!291569 (or (= lt!220251 (MissingZero!3667 i!1204)) (= lt!220251 (MissingVacant!3667 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31628 (_ BitVec 32)) SeekEntryResult!3667)

(assert (=> b!488384 (= lt!220251 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!488385 () Bool)

(assert (=> b!488385 (= e!287289 (= (seekEntryOrOpen!0 (select (arr!15203 a!3235) j!176) a!3235 mask!3524) (Found!3667 j!176)))))

(declare-fun b!488386 () Bool)

(declare-fun res!291575 () Bool)

(assert (=> b!488386 (=> (not res!291575) (not e!287288))))

(declare-fun arrayContainsKey!0 (array!31628 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!488386 (= res!291575 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!44508 res!291573) b!488382))

(assert (= (and b!488382 res!291574) b!488383))

(assert (= (and b!488383 res!291567) b!488378))

(assert (= (and b!488378 res!291572) b!488386))

(assert (= (and b!488386 res!291575) b!488384))

(assert (= (and b!488384 res!291569) b!488381))

(assert (= (and b!488381 res!291570) b!488380))

(assert (= (and b!488380 res!291571) b!488379))

(assert (= (and b!488379 res!291568) b!488385))

(declare-fun m!467605 () Bool)

(assert (=> b!488385 m!467605))

(assert (=> b!488385 m!467605))

(declare-fun m!467607 () Bool)

(assert (=> b!488385 m!467607))

(declare-fun m!467609 () Bool)

(assert (=> b!488386 m!467609))

(assert (=> b!488383 m!467605))

(assert (=> b!488383 m!467605))

(declare-fun m!467611 () Bool)

(assert (=> b!488383 m!467611))

(declare-fun m!467613 () Bool)

(assert (=> b!488378 m!467613))

(declare-fun m!467615 () Bool)

(assert (=> b!488381 m!467615))

(declare-fun m!467617 () Bool)

(assert (=> start!44508 m!467617))

(declare-fun m!467619 () Bool)

(assert (=> start!44508 m!467619))

(declare-fun m!467621 () Bool)

(assert (=> b!488379 m!467621))

(declare-fun m!467623 () Bool)

(assert (=> b!488379 m!467623))

(declare-fun m!467625 () Bool)

(assert (=> b!488379 m!467625))

(declare-fun m!467627 () Bool)

(assert (=> b!488379 m!467627))

(assert (=> b!488379 m!467625))

(declare-fun m!467629 () Bool)

(assert (=> b!488379 m!467629))

(declare-fun m!467631 () Bool)

(assert (=> b!488384 m!467631))

(declare-fun m!467633 () Bool)

(assert (=> b!488380 m!467633))

(check-sat (not b!488378) (not b!488383) (not b!488379) (not start!44508) (not b!488384) (not b!488386) (not b!488380) (not b!488381) (not b!488385))
(check-sat)
