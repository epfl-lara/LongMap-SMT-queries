; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45466 () Bool)

(assert start!45466)

(declare-fun b!500448 () Bool)

(declare-fun e!293212 () Bool)

(declare-fun e!293209 () Bool)

(assert (=> b!500448 (= e!293212 (not e!293209))))

(declare-fun res!302283 () Bool)

(assert (=> b!500448 (=> res!302283 e!293209)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3994 0))(
  ( (MissingZero!3994 (index!18158 (_ BitVec 32))) (Found!3994 (index!18159 (_ BitVec 32))) (Intermediate!3994 (undefined!4806 Bool) (index!18160 (_ BitVec 32)) (x!47191 (_ BitVec 32))) (Undefined!3994) (MissingVacant!3994 (index!18161 (_ BitVec 32))) )
))
(declare-fun lt!227124 () SeekEntryResult!3994)

(declare-datatypes ((array!32291 0))(
  ( (array!32292 (arr!15527 (Array (_ BitVec 32) (_ BitVec 64))) (size!15891 (_ BitVec 32))) )
))
(declare-fun lt!227119 () array!32291)

(declare-fun lt!227128 () (_ BitVec 32))

(declare-fun lt!227122 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32291 (_ BitVec 32)) SeekEntryResult!3994)

(assert (=> b!500448 (= res!302283 (= lt!227124 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227128 lt!227122 lt!227119 mask!3524)))))

(declare-fun a!3235 () array!32291)

(declare-fun lt!227127 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!500448 (= lt!227124 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227127 (select (arr!15527 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!500448 (= lt!227128 (toIndex!0 lt!227122 mask!3524))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!500448 (= lt!227122 (select (store (arr!15527 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!500448 (= lt!227127 (toIndex!0 (select (arr!15527 a!3235) j!176) mask!3524))))

(assert (=> b!500448 (= lt!227119 (array!32292 (store (arr!15527 a!3235) i!1204 k!2280) (size!15891 a!3235)))))

(declare-fun e!293210 () Bool)

(assert (=> b!500448 e!293210))

(declare-fun res!302280 () Bool)

(assert (=> b!500448 (=> (not res!302280) (not e!293210))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32291 (_ BitVec 32)) Bool)

(assert (=> b!500448 (= res!302280 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15052 0))(
  ( (Unit!15053) )
))
(declare-fun lt!227126 () Unit!15052)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32291 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15052)

(assert (=> b!500448 (= lt!227126 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!500449 () Bool)

(declare-fun res!302276 () Bool)

(declare-fun e!293211 () Bool)

(assert (=> b!500449 (=> (not res!302276) (not e!293211))))

(declare-fun arrayContainsKey!0 (array!32291 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!500449 (= res!302276 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!302279 () Bool)

(assert (=> start!45466 (=> (not res!302279) (not e!293211))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45466 (= res!302279 (validMask!0 mask!3524))))

(assert (=> start!45466 e!293211))

(assert (=> start!45466 true))

(declare-fun array_inv!11323 (array!32291) Bool)

(assert (=> start!45466 (array_inv!11323 a!3235)))

(declare-fun b!500450 () Bool)

(declare-fun e!293213 () Bool)

(assert (=> b!500450 (= e!293213 true)))

(declare-fun lt!227123 () SeekEntryResult!3994)

(assert (=> b!500450 (= lt!227123 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227127 lt!227122 lt!227119 mask!3524))))

(declare-fun b!500451 () Bool)

(declare-fun res!302278 () Bool)

(assert (=> b!500451 (=> (not res!302278) (not e!293211))))

(assert (=> b!500451 (= res!302278 (and (= (size!15891 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15891 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15891 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!500452 () Bool)

(declare-fun res!302284 () Bool)

(assert (=> b!500452 (=> (not res!302284) (not e!293212))))

(assert (=> b!500452 (= res!302284 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!500453 () Bool)

(declare-fun res!302282 () Bool)

(assert (=> b!500453 (=> (not res!302282) (not e!293211))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!500453 (= res!302282 (validKeyInArray!0 (select (arr!15527 a!3235) j!176)))))

(declare-fun b!500454 () Bool)

(declare-fun res!302287 () Bool)

(assert (=> b!500454 (=> res!302287 e!293209)))

(assert (=> b!500454 (= res!302287 (or (undefined!4806 lt!227124) (not (is-Intermediate!3994 lt!227124))))))

(declare-fun b!500455 () Bool)

(assert (=> b!500455 (= e!293209 e!293213)))

(declare-fun res!302288 () Bool)

(assert (=> b!500455 (=> res!302288 e!293213)))

(assert (=> b!500455 (= res!302288 (or (bvsgt #b00000000000000000000000000000000 (x!47191 lt!227124)) (bvsgt (x!47191 lt!227124) #b01111111111111111111111111111110) (bvslt lt!227127 #b00000000000000000000000000000000) (bvsge lt!227127 (size!15891 a!3235)) (bvslt (index!18160 lt!227124) #b00000000000000000000000000000000) (bvsge (index!18160 lt!227124) (size!15891 a!3235)) (not (= lt!227124 (Intermediate!3994 false (index!18160 lt!227124) (x!47191 lt!227124))))))))

(assert (=> b!500455 (and (or (= (select (arr!15527 a!3235) (index!18160 lt!227124)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15527 a!3235) (index!18160 lt!227124)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15527 a!3235) (index!18160 lt!227124)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15527 a!3235) (index!18160 lt!227124)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!227121 () Unit!15052)

(declare-fun e!293214 () Unit!15052)

(assert (=> b!500455 (= lt!227121 e!293214)))

(declare-fun c!59363 () Bool)

(assert (=> b!500455 (= c!59363 (= (select (arr!15527 a!3235) (index!18160 lt!227124)) (select (arr!15527 a!3235) j!176)))))

(assert (=> b!500455 (and (bvslt (x!47191 lt!227124) #b01111111111111111111111111111110) (or (= (select (arr!15527 a!3235) (index!18160 lt!227124)) (select (arr!15527 a!3235) j!176)) (= (select (arr!15527 a!3235) (index!18160 lt!227124)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15527 a!3235) (index!18160 lt!227124)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!500456 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32291 (_ BitVec 32)) SeekEntryResult!3994)

(assert (=> b!500456 (= e!293210 (= (seekEntryOrOpen!0 (select (arr!15527 a!3235) j!176) a!3235 mask!3524) (Found!3994 j!176)))))

(declare-fun b!500457 () Bool)

(declare-fun e!293208 () Bool)

(assert (=> b!500457 (= e!293208 false)))

(declare-fun b!500458 () Bool)

(declare-fun Unit!15054 () Unit!15052)

(assert (=> b!500458 (= e!293214 Unit!15054)))

(declare-fun lt!227125 () Unit!15052)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32291 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15052)

(assert (=> b!500458 (= lt!227125 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!227127 #b00000000000000000000000000000000 (index!18160 lt!227124) (x!47191 lt!227124) mask!3524))))

(declare-fun res!302281 () Bool)

(assert (=> b!500458 (= res!302281 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227127 lt!227122 lt!227119 mask!3524) (Intermediate!3994 false (index!18160 lt!227124) (x!47191 lt!227124))))))

(assert (=> b!500458 (=> (not res!302281) (not e!293208))))

(assert (=> b!500458 e!293208))

(declare-fun b!500459 () Bool)

(declare-fun res!302285 () Bool)

(assert (=> b!500459 (=> (not res!302285) (not e!293211))))

(assert (=> b!500459 (= res!302285 (validKeyInArray!0 k!2280))))

(declare-fun b!500460 () Bool)

(declare-fun res!302286 () Bool)

(assert (=> b!500460 (=> (not res!302286) (not e!293212))))

(declare-datatypes ((List!9685 0))(
  ( (Nil!9682) (Cons!9681 (h!10555 (_ BitVec 64)) (t!15913 List!9685)) )
))
(declare-fun arrayNoDuplicates!0 (array!32291 (_ BitVec 32) List!9685) Bool)

(assert (=> b!500460 (= res!302286 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9682))))

(declare-fun b!500461 () Bool)

(declare-fun Unit!15055 () Unit!15052)

(assert (=> b!500461 (= e!293214 Unit!15055)))

(declare-fun b!500462 () Bool)

(assert (=> b!500462 (= e!293211 e!293212)))

(declare-fun res!302277 () Bool)

(assert (=> b!500462 (=> (not res!302277) (not e!293212))))

(declare-fun lt!227120 () SeekEntryResult!3994)

(assert (=> b!500462 (= res!302277 (or (= lt!227120 (MissingZero!3994 i!1204)) (= lt!227120 (MissingVacant!3994 i!1204))))))

(assert (=> b!500462 (= lt!227120 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(assert (= (and start!45466 res!302279) b!500451))

(assert (= (and b!500451 res!302278) b!500453))

(assert (= (and b!500453 res!302282) b!500459))

(assert (= (and b!500459 res!302285) b!500449))

(assert (= (and b!500449 res!302276) b!500462))

(assert (= (and b!500462 res!302277) b!500452))

(assert (= (and b!500452 res!302284) b!500460))

(assert (= (and b!500460 res!302286) b!500448))

(assert (= (and b!500448 res!302280) b!500456))

(assert (= (and b!500448 (not res!302283)) b!500454))

(assert (= (and b!500454 (not res!302287)) b!500455))

(assert (= (and b!500455 c!59363) b!500458))

(assert (= (and b!500455 (not c!59363)) b!500461))

(assert (= (and b!500458 res!302281) b!500457))

(assert (= (and b!500455 (not res!302288)) b!500450))

(declare-fun m!481581 () Bool)

(assert (=> start!45466 m!481581))

(declare-fun m!481583 () Bool)

(assert (=> start!45466 m!481583))

(declare-fun m!481585 () Bool)

(assert (=> b!500453 m!481585))

(assert (=> b!500453 m!481585))

(declare-fun m!481587 () Bool)

(assert (=> b!500453 m!481587))

(declare-fun m!481589 () Bool)

(assert (=> b!500462 m!481589))

(declare-fun m!481591 () Bool)

(assert (=> b!500450 m!481591))

(declare-fun m!481593 () Bool)

(assert (=> b!500449 m!481593))

(declare-fun m!481595 () Bool)

(assert (=> b!500448 m!481595))

(declare-fun m!481597 () Bool)

(assert (=> b!500448 m!481597))

(declare-fun m!481599 () Bool)

(assert (=> b!500448 m!481599))

(declare-fun m!481601 () Bool)

(assert (=> b!500448 m!481601))

(assert (=> b!500448 m!481585))

(declare-fun m!481603 () Bool)

(assert (=> b!500448 m!481603))

(assert (=> b!500448 m!481585))

(declare-fun m!481605 () Bool)

(assert (=> b!500448 m!481605))

(declare-fun m!481607 () Bool)

(assert (=> b!500448 m!481607))

(assert (=> b!500448 m!481585))

(declare-fun m!481609 () Bool)

(assert (=> b!500448 m!481609))

(declare-fun m!481611 () Bool)

(assert (=> b!500452 m!481611))

(assert (=> b!500456 m!481585))

(assert (=> b!500456 m!481585))

(declare-fun m!481613 () Bool)

(assert (=> b!500456 m!481613))

(declare-fun m!481615 () Bool)

(assert (=> b!500459 m!481615))

(declare-fun m!481617 () Bool)

(assert (=> b!500458 m!481617))

(assert (=> b!500458 m!481591))

(declare-fun m!481619 () Bool)

(assert (=> b!500455 m!481619))

(assert (=> b!500455 m!481585))

(declare-fun m!481621 () Bool)

(assert (=> b!500460 m!481621))

(push 1)

