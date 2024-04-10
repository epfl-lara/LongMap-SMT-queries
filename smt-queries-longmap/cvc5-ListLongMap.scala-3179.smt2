; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44700 () Bool)

(assert start!44700)

(declare-fun b!490542 () Bool)

(declare-fun res!293485 () Bool)

(declare-fun e!288354 () Bool)

(assert (=> b!490542 (=> (not res!293485) (not e!288354))))

(declare-datatypes ((array!31759 0))(
  ( (array!31760 (arr!15267 (Array (_ BitVec 32) (_ BitVec 64))) (size!15631 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31759)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31759 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!490542 (= res!293485 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!490543 () Bool)

(declare-fun res!293481 () Bool)

(assert (=> b!490543 (=> (not res!293481) (not e!288354))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!490543 (= res!293481 (validKeyInArray!0 (select (arr!15267 a!3235) j!176)))))

(declare-fun b!490544 () Bool)

(declare-fun e!288351 () Bool)

(assert (=> b!490544 (= e!288354 e!288351)))

(declare-fun res!293479 () Bool)

(assert (=> b!490544 (=> (not res!293479) (not e!288351))))

(declare-datatypes ((SeekEntryResult!3734 0))(
  ( (MissingZero!3734 (index!17115 (_ BitVec 32))) (Found!3734 (index!17116 (_ BitVec 32))) (Intermediate!3734 (undefined!4546 Bool) (index!17117 (_ BitVec 32)) (x!46216 (_ BitVec 32))) (Undefined!3734) (MissingVacant!3734 (index!17118 (_ BitVec 32))) )
))
(declare-fun lt!221562 () SeekEntryResult!3734)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!490544 (= res!293479 (or (= lt!221562 (MissingZero!3734 i!1204)) (= lt!221562 (MissingVacant!3734 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31759 (_ BitVec 32)) SeekEntryResult!3734)

(assert (=> b!490544 (= lt!221562 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!490545 () Bool)

(declare-fun e!288353 () Bool)

(assert (=> b!490545 (= e!288351 (not e!288353))))

(declare-fun res!293483 () Bool)

(assert (=> b!490545 (=> res!293483 e!288353)))

(declare-fun lt!221564 () array!31759)

(declare-fun lt!221566 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31759 (_ BitVec 32)) SeekEntryResult!3734)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!490545 (= res!293483 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15267 a!3235) j!176) mask!3524) (select (arr!15267 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!221566 mask!3524) lt!221566 lt!221564 mask!3524))))))

(assert (=> b!490545 (= lt!221566 (select (store (arr!15267 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!490545 (= lt!221564 (array!31760 (store (arr!15267 a!3235) i!1204 k!2280) (size!15631 a!3235)))))

(declare-fun lt!221563 () SeekEntryResult!3734)

(assert (=> b!490545 (= lt!221563 (Found!3734 j!176))))

(assert (=> b!490545 (= lt!221563 (seekEntryOrOpen!0 (select (arr!15267 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31759 (_ BitVec 32)) Bool)

(assert (=> b!490545 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14414 0))(
  ( (Unit!14415) )
))
(declare-fun lt!221561 () Unit!14414)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31759 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14414)

(assert (=> b!490545 (= lt!221561 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!490546 () Bool)

(declare-fun res!293480 () Bool)

(assert (=> b!490546 (=> (not res!293480) (not e!288354))))

(assert (=> b!490546 (= res!293480 (validKeyInArray!0 k!2280))))

(declare-fun res!293482 () Bool)

(assert (=> start!44700 (=> (not res!293482) (not e!288354))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44700 (= res!293482 (validMask!0 mask!3524))))

(assert (=> start!44700 e!288354))

(assert (=> start!44700 true))

(declare-fun array_inv!11063 (array!31759) Bool)

(assert (=> start!44700 (array_inv!11063 a!3235)))

(declare-fun b!490547 () Bool)

(declare-fun res!293478 () Bool)

(assert (=> b!490547 (=> (not res!293478) (not e!288351))))

(assert (=> b!490547 (= res!293478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!490548 () Bool)

(declare-fun res!293484 () Bool)

(assert (=> b!490548 (=> (not res!293484) (not e!288351))))

(declare-datatypes ((List!9425 0))(
  ( (Nil!9422) (Cons!9421 (h!10283 (_ BitVec 64)) (t!15653 List!9425)) )
))
(declare-fun arrayNoDuplicates!0 (array!31759 (_ BitVec 32) List!9425) Bool)

(assert (=> b!490548 (= res!293484 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9422))))

(declare-fun b!490549 () Bool)

(declare-fun res!293486 () Bool)

(assert (=> b!490549 (=> (not res!293486) (not e!288354))))

(assert (=> b!490549 (= res!293486 (and (= (size!15631 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15631 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15631 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!490550 () Bool)

(assert (=> b!490550 (= e!288353 (bvsge mask!3524 #b00000000000000000000000000000000))))

(assert (=> b!490550 (= lt!221563 (seekEntryOrOpen!0 lt!221566 lt!221564 mask!3524))))

(declare-fun lt!221565 () Unit!14414)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31759 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14414)

(assert (=> b!490550 (= lt!221565 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k!2280 j!176 mask!3524))))

(assert (= (and start!44700 res!293482) b!490549))

(assert (= (and b!490549 res!293486) b!490543))

(assert (= (and b!490543 res!293481) b!490546))

(assert (= (and b!490546 res!293480) b!490542))

(assert (= (and b!490542 res!293485) b!490544))

(assert (= (and b!490544 res!293479) b!490547))

(assert (= (and b!490547 res!293478) b!490548))

(assert (= (and b!490548 res!293484) b!490545))

(assert (= (and b!490545 (not res!293483)) b!490550))

(declare-fun m!470697 () Bool)

(assert (=> b!490545 m!470697))

(declare-fun m!470699 () Bool)

(assert (=> b!490545 m!470699))

(declare-fun m!470701 () Bool)

(assert (=> b!490545 m!470701))

(declare-fun m!470703 () Bool)

(assert (=> b!490545 m!470703))

(declare-fun m!470705 () Bool)

(assert (=> b!490545 m!470705))

(assert (=> b!490545 m!470703))

(assert (=> b!490545 m!470701))

(assert (=> b!490545 m!470703))

(declare-fun m!470707 () Bool)

(assert (=> b!490545 m!470707))

(assert (=> b!490545 m!470703))

(declare-fun m!470709 () Bool)

(assert (=> b!490545 m!470709))

(declare-fun m!470711 () Bool)

(assert (=> b!490545 m!470711))

(declare-fun m!470713 () Bool)

(assert (=> b!490545 m!470713))

(assert (=> b!490545 m!470711))

(declare-fun m!470715 () Bool)

(assert (=> b!490545 m!470715))

(declare-fun m!470717 () Bool)

(assert (=> b!490547 m!470717))

(declare-fun m!470719 () Bool)

(assert (=> b!490550 m!470719))

(declare-fun m!470721 () Bool)

(assert (=> b!490550 m!470721))

(assert (=> b!490543 m!470703))

(assert (=> b!490543 m!470703))

(declare-fun m!470723 () Bool)

(assert (=> b!490543 m!470723))

(declare-fun m!470725 () Bool)

(assert (=> b!490548 m!470725))

(declare-fun m!470727 () Bool)

(assert (=> b!490544 m!470727))

(declare-fun m!470729 () Bool)

(assert (=> start!44700 m!470729))

(declare-fun m!470731 () Bool)

(assert (=> start!44700 m!470731))

(declare-fun m!470733 () Bool)

(assert (=> b!490546 m!470733))

(declare-fun m!470735 () Bool)

(assert (=> b!490542 m!470735))

(push 1)

(assert (not b!490546))

(assert (not b!490550))

(assert (not b!490548))

(assert (not b!490543))

(assert (not start!44700))

(assert (not b!490547))

(assert (not b!490544))

(assert (not b!490545))

(assert (not b!490542))

(check-sat)

(pop 1)

(push 1)

(check-sat)

