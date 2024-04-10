; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44632 () Bool)

(assert start!44632)

(declare-fun b!489624 () Bool)

(declare-fun e!287945 () Bool)

(declare-fun e!287946 () Bool)

(assert (=> b!489624 (= e!287945 e!287946)))

(declare-fun res!292560 () Bool)

(assert (=> b!489624 (=> (not res!292560) (not e!287946))))

(declare-datatypes ((SeekEntryResult!3700 0))(
  ( (MissingZero!3700 (index!16979 (_ BitVec 32))) (Found!3700 (index!16980 (_ BitVec 32))) (Intermediate!3700 (undefined!4512 Bool) (index!16981 (_ BitVec 32)) (x!46086 (_ BitVec 32))) (Undefined!3700) (MissingVacant!3700 (index!16982 (_ BitVec 32))) )
))
(declare-fun lt!220951 () SeekEntryResult!3700)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!489624 (= res!292560 (or (= lt!220951 (MissingZero!3700 i!1204)) (= lt!220951 (MissingVacant!3700 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31691 0))(
  ( (array!31692 (arr!15233 (Array (_ BitVec 32) (_ BitVec 64))) (size!15597 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31691)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31691 (_ BitVec 32)) SeekEntryResult!3700)

(assert (=> b!489624 (= lt!220951 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!292561 () Bool)

(assert (=> start!44632 (=> (not res!292561) (not e!287945))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44632 (= res!292561 (validMask!0 mask!3524))))

(assert (=> start!44632 e!287945))

(assert (=> start!44632 true))

(declare-fun array_inv!11029 (array!31691) Bool)

(assert (=> start!44632 (array_inv!11029 a!3235)))

(declare-fun b!489625 () Bool)

(declare-fun res!292565 () Bool)

(assert (=> b!489625 (=> (not res!292565) (not e!287946))))

(declare-datatypes ((List!9391 0))(
  ( (Nil!9388) (Cons!9387 (h!10249 (_ BitVec 64)) (t!15619 List!9391)) )
))
(declare-fun arrayNoDuplicates!0 (array!31691 (_ BitVec 32) List!9391) Bool)

(assert (=> b!489625 (= res!292565 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9388))))

(declare-fun b!489626 () Bool)

(declare-fun res!292564 () Bool)

(assert (=> b!489626 (=> (not res!292564) (not e!287945))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!489626 (= res!292564 (and (= (size!15597 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15597 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15597 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!489627 () Bool)

(declare-fun e!287943 () Bool)

(assert (=> b!489627 (= e!287943 (= (seekEntryOrOpen!0 (select (arr!15233 a!3235) j!176) a!3235 mask!3524) (Found!3700 j!176)))))

(declare-fun b!489628 () Bool)

(declare-fun res!292567 () Bool)

(assert (=> b!489628 (=> (not res!292567) (not e!287945))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!489628 (= res!292567 (validKeyInArray!0 k!2280))))

(declare-fun b!489629 () Bool)

(declare-fun res!292566 () Bool)

(assert (=> b!489629 (=> (not res!292566) (not e!287945))))

(assert (=> b!489629 (= res!292566 (validKeyInArray!0 (select (arr!15233 a!3235) j!176)))))

(declare-fun b!489630 () Bool)

(assert (=> b!489630 (= e!287946 (not true))))

(declare-fun lt!220952 () SeekEntryResult!3700)

(declare-fun lt!220954 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31691 (_ BitVec 32)) SeekEntryResult!3700)

(assert (=> b!489630 (= lt!220952 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!220954 (select (store (arr!15233 a!3235) i!1204 k!2280) j!176) (array!31692 (store (arr!15233 a!3235) i!1204 k!2280) (size!15597 a!3235)) mask!3524))))

(declare-fun lt!220950 () (_ BitVec 32))

(declare-fun lt!220949 () SeekEntryResult!3700)

(assert (=> b!489630 (= lt!220949 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!220950 (select (arr!15233 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!489630 (= lt!220954 (toIndex!0 (select (store (arr!15233 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!489630 (= lt!220950 (toIndex!0 (select (arr!15233 a!3235) j!176) mask!3524))))

(assert (=> b!489630 e!287943))

(declare-fun res!292562 () Bool)

(assert (=> b!489630 (=> (not res!292562) (not e!287943))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31691 (_ BitVec 32)) Bool)

(assert (=> b!489630 (= res!292562 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14346 0))(
  ( (Unit!14347) )
))
(declare-fun lt!220953 () Unit!14346)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31691 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14346)

(assert (=> b!489630 (= lt!220953 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!489631 () Bool)

(declare-fun res!292563 () Bool)

(assert (=> b!489631 (=> (not res!292563) (not e!287946))))

(assert (=> b!489631 (= res!292563 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!489632 () Bool)

(declare-fun res!292568 () Bool)

(assert (=> b!489632 (=> (not res!292568) (not e!287945))))

(declare-fun arrayContainsKey!0 (array!31691 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!489632 (= res!292568 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!44632 res!292561) b!489626))

(assert (= (and b!489626 res!292564) b!489629))

(assert (= (and b!489629 res!292566) b!489628))

(assert (= (and b!489628 res!292567) b!489632))

(assert (= (and b!489632 res!292568) b!489624))

(assert (= (and b!489624 res!292560) b!489631))

(assert (= (and b!489631 res!292563) b!489625))

(assert (= (and b!489625 res!292565) b!489630))

(assert (= (and b!489630 res!292562) b!489627))

(declare-fun m!469461 () Bool)

(assert (=> b!489629 m!469461))

(assert (=> b!489629 m!469461))

(declare-fun m!469463 () Bool)

(assert (=> b!489629 m!469463))

(declare-fun m!469465 () Bool)

(assert (=> b!489631 m!469465))

(declare-fun m!469467 () Bool)

(assert (=> start!44632 m!469467))

(declare-fun m!469469 () Bool)

(assert (=> start!44632 m!469469))

(declare-fun m!469471 () Bool)

(assert (=> b!489625 m!469471))

(declare-fun m!469473 () Bool)

(assert (=> b!489624 m!469473))

(declare-fun m!469475 () Bool)

(assert (=> b!489630 m!469475))

(declare-fun m!469477 () Bool)

(assert (=> b!489630 m!469477))

(declare-fun m!469479 () Bool)

(assert (=> b!489630 m!469479))

(assert (=> b!489630 m!469461))

(declare-fun m!469481 () Bool)

(assert (=> b!489630 m!469481))

(assert (=> b!489630 m!469461))

(assert (=> b!489630 m!469479))

(declare-fun m!469483 () Bool)

(assert (=> b!489630 m!469483))

(assert (=> b!489630 m!469461))

(declare-fun m!469485 () Bool)

(assert (=> b!489630 m!469485))

(assert (=> b!489630 m!469479))

(declare-fun m!469487 () Bool)

(assert (=> b!489630 m!469487))

(declare-fun m!469489 () Bool)

(assert (=> b!489630 m!469489))

(declare-fun m!469491 () Bool)

(assert (=> b!489628 m!469491))

(assert (=> b!489627 m!469461))

(assert (=> b!489627 m!469461))

(declare-fun m!469493 () Bool)

(assert (=> b!489627 m!469493))

(declare-fun m!469495 () Bool)

(assert (=> b!489632 m!469495))

(push 1)

