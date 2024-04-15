; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44718 () Bool)

(assert start!44718)

(declare-fun b!490676 () Bool)

(declare-fun e!288359 () Bool)

(assert (=> b!490676 (= e!288359 true)))

(declare-datatypes ((SeekEntryResult!3745 0))(
  ( (MissingZero!3745 (index!17159 (_ BitVec 32))) (Found!3745 (index!17160 (_ BitVec 32))) (Intermediate!3745 (undefined!4557 Bool) (index!17161 (_ BitVec 32)) (x!46262 (_ BitVec 32))) (Undefined!3745) (MissingVacant!3745 (index!17162 (_ BitVec 32))) )
))
(declare-fun lt!221598 () SeekEntryResult!3745)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!221600 () (_ BitVec 64))

(declare-datatypes ((array!31787 0))(
  ( (array!31788 (arr!15281 (Array (_ BitVec 32) (_ BitVec 64))) (size!15646 (_ BitVec 32))) )
))
(declare-fun lt!221597 () array!31787)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31787 (_ BitVec 32)) SeekEntryResult!3745)

(assert (=> b!490676 (= lt!221598 (seekEntryOrOpen!0 lt!221600 lt!221597 mask!3524))))

(declare-datatypes ((Unit!14422 0))(
  ( (Unit!14423) )
))
(declare-fun lt!221602 () Unit!14422)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun a!3235 () array!31787)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31787 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14422)

(assert (=> b!490676 (= lt!221602 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(declare-fun b!490677 () Bool)

(declare-fun res!293760 () Bool)

(declare-fun e!288358 () Bool)

(assert (=> b!490677 (=> (not res!293760) (not e!288358))))

(assert (=> b!490677 (= res!293760 (and (= (size!15646 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15646 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15646 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!490678 () Bool)

(declare-fun e!288357 () Bool)

(assert (=> b!490678 (= e!288358 e!288357)))

(declare-fun res!293755 () Bool)

(assert (=> b!490678 (=> (not res!293755) (not e!288357))))

(declare-fun lt!221599 () SeekEntryResult!3745)

(assert (=> b!490678 (= res!293755 (or (= lt!221599 (MissingZero!3745 i!1204)) (= lt!221599 (MissingVacant!3745 i!1204))))))

(assert (=> b!490678 (= lt!221599 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!490679 () Bool)

(declare-fun res!293754 () Bool)

(assert (=> b!490679 (=> (not res!293754) (not e!288357))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31787 (_ BitVec 32)) Bool)

(assert (=> b!490679 (= res!293754 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!490680 () Bool)

(declare-fun res!293762 () Bool)

(assert (=> b!490680 (=> (not res!293762) (not e!288358))))

(declare-fun arrayContainsKey!0 (array!31787 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!490680 (= res!293762 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!293759 () Bool)

(assert (=> start!44718 (=> (not res!293759) (not e!288358))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44718 (= res!293759 (validMask!0 mask!3524))))

(assert (=> start!44718 e!288358))

(assert (=> start!44718 true))

(declare-fun array_inv!11164 (array!31787) Bool)

(assert (=> start!44718 (array_inv!11164 a!3235)))

(declare-fun b!490681 () Bool)

(assert (=> b!490681 (= e!288357 (not e!288359))))

(declare-fun res!293758 () Bool)

(assert (=> b!490681 (=> res!293758 e!288359)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31787 (_ BitVec 32)) SeekEntryResult!3745)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!490681 (= res!293758 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15281 a!3235) j!176) mask!3524) (select (arr!15281 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!221600 mask!3524) lt!221600 lt!221597 mask!3524))))))

(assert (=> b!490681 (= lt!221600 (select (store (arr!15281 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!490681 (= lt!221597 (array!31788 (store (arr!15281 a!3235) i!1204 k0!2280) (size!15646 a!3235)))))

(assert (=> b!490681 (= lt!221598 (Found!3745 j!176))))

(assert (=> b!490681 (= lt!221598 (seekEntryOrOpen!0 (select (arr!15281 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!490681 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!221601 () Unit!14422)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31787 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14422)

(assert (=> b!490681 (= lt!221601 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!490682 () Bool)

(declare-fun res!293757 () Bool)

(assert (=> b!490682 (=> (not res!293757) (not e!288357))))

(declare-datatypes ((List!9478 0))(
  ( (Nil!9475) (Cons!9474 (h!10336 (_ BitVec 64)) (t!15697 List!9478)) )
))
(declare-fun arrayNoDuplicates!0 (array!31787 (_ BitVec 32) List!9478) Bool)

(assert (=> b!490682 (= res!293757 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9475))))

(declare-fun b!490683 () Bool)

(declare-fun res!293756 () Bool)

(assert (=> b!490683 (=> (not res!293756) (not e!288358))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!490683 (= res!293756 (validKeyInArray!0 (select (arr!15281 a!3235) j!176)))))

(declare-fun b!490684 () Bool)

(declare-fun res!293761 () Bool)

(assert (=> b!490684 (=> (not res!293761) (not e!288358))))

(assert (=> b!490684 (= res!293761 (validKeyInArray!0 k0!2280))))

(assert (= (and start!44718 res!293759) b!490677))

(assert (= (and b!490677 res!293760) b!490683))

(assert (= (and b!490683 res!293756) b!490684))

(assert (= (and b!490684 res!293761) b!490680))

(assert (= (and b!490680 res!293762) b!490678))

(assert (= (and b!490678 res!293755) b!490679))

(assert (= (and b!490679 res!293754) b!490682))

(assert (= (and b!490682 res!293757) b!490681))

(assert (= (and b!490681 (not res!293758)) b!490676))

(declare-fun m!470545 () Bool)

(assert (=> b!490684 m!470545))

(declare-fun m!470547 () Bool)

(assert (=> b!490683 m!470547))

(assert (=> b!490683 m!470547))

(declare-fun m!470549 () Bool)

(assert (=> b!490683 m!470549))

(declare-fun m!470551 () Bool)

(assert (=> b!490682 m!470551))

(declare-fun m!470553 () Bool)

(assert (=> b!490676 m!470553))

(declare-fun m!470555 () Bool)

(assert (=> b!490676 m!470555))

(declare-fun m!470557 () Bool)

(assert (=> start!44718 m!470557))

(declare-fun m!470559 () Bool)

(assert (=> start!44718 m!470559))

(declare-fun m!470561 () Bool)

(assert (=> b!490679 m!470561))

(declare-fun m!470563 () Bool)

(assert (=> b!490681 m!470563))

(declare-fun m!470565 () Bool)

(assert (=> b!490681 m!470565))

(declare-fun m!470567 () Bool)

(assert (=> b!490681 m!470567))

(declare-fun m!470569 () Bool)

(assert (=> b!490681 m!470569))

(declare-fun m!470571 () Bool)

(assert (=> b!490681 m!470571))

(declare-fun m!470573 () Bool)

(assert (=> b!490681 m!470573))

(assert (=> b!490681 m!470547))

(declare-fun m!470575 () Bool)

(assert (=> b!490681 m!470575))

(assert (=> b!490681 m!470569))

(assert (=> b!490681 m!470547))

(assert (=> b!490681 m!470573))

(assert (=> b!490681 m!470547))

(declare-fun m!470577 () Bool)

(assert (=> b!490681 m!470577))

(assert (=> b!490681 m!470547))

(declare-fun m!470579 () Bool)

(assert (=> b!490681 m!470579))

(declare-fun m!470581 () Bool)

(assert (=> b!490680 m!470581))

(declare-fun m!470583 () Bool)

(assert (=> b!490678 m!470583))

(check-sat (not b!490680) (not start!44718) (not b!490681) (not b!490678) (not b!490679) (not b!490682) (not b!490676) (not b!490684) (not b!490683))
(check-sat)
