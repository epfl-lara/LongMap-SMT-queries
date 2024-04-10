; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44780 () Bool)

(assert start!44780)

(declare-fun b!491631 () Bool)

(declare-fun res!294567 () Bool)

(declare-fun e!288840 () Bool)

(assert (=> b!491631 (=> (not res!294567) (not e!288840))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((array!31839 0))(
  ( (array!31840 (arr!15307 (Array (_ BitVec 32) (_ BitVec 64))) (size!15671 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31839)

(assert (=> b!491631 (= res!294567 (and (= (size!15671 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15671 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15671 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!491632 () Bool)

(declare-fun res!294568 () Bool)

(declare-fun e!288843 () Bool)

(assert (=> b!491632 (=> (not res!294568) (not e!288843))))

(declare-datatypes ((List!9465 0))(
  ( (Nil!9462) (Cons!9461 (h!10323 (_ BitVec 64)) (t!15693 List!9465)) )
))
(declare-fun arrayNoDuplicates!0 (array!31839 (_ BitVec 32) List!9465) Bool)

(assert (=> b!491632 (= res!294568 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9462))))

(declare-fun res!294572 () Bool)

(assert (=> start!44780 (=> (not res!294572) (not e!288840))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44780 (= res!294572 (validMask!0 mask!3524))))

(assert (=> start!44780 e!288840))

(assert (=> start!44780 true))

(declare-fun array_inv!11103 (array!31839) Bool)

(assert (=> start!44780 (array_inv!11103 a!3235)))

(declare-fun b!491633 () Bool)

(declare-fun res!294574 () Bool)

(assert (=> b!491633 (=> (not res!294574) (not e!288840))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!491633 (= res!294574 (validKeyInArray!0 k0!2280))))

(declare-fun b!491634 () Bool)

(declare-fun e!288842 () Bool)

(assert (=> b!491634 (= e!288842 true)))

(declare-datatypes ((SeekEntryResult!3774 0))(
  ( (MissingZero!3774 (index!17275 (_ BitVec 32))) (Found!3774 (index!17276 (_ BitVec 32))) (Intermediate!3774 (undefined!4586 Bool) (index!17277 (_ BitVec 32)) (x!46360 (_ BitVec 32))) (Undefined!3774) (MissingVacant!3774 (index!17278 (_ BitVec 32))) )
))
(declare-fun lt!222281 () SeekEntryResult!3774)

(declare-fun lt!222286 () array!31839)

(declare-fun lt!222283 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31839 (_ BitVec 32)) SeekEntryResult!3774)

(assert (=> b!491634 (= lt!222281 (seekEntryOrOpen!0 lt!222283 lt!222286 mask!3524))))

(declare-datatypes ((Unit!14494 0))(
  ( (Unit!14495) )
))
(declare-fun lt!222284 () Unit!14494)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31839 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14494)

(assert (=> b!491634 (= lt!222284 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(declare-fun b!491635 () Bool)

(declare-fun res!294575 () Bool)

(assert (=> b!491635 (=> (not res!294575) (not e!288840))))

(assert (=> b!491635 (= res!294575 (validKeyInArray!0 (select (arr!15307 a!3235) j!176)))))

(declare-fun b!491636 () Bool)

(declare-fun res!294571 () Bool)

(assert (=> b!491636 (=> (not res!294571) (not e!288843))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31839 (_ BitVec 32)) Bool)

(assert (=> b!491636 (= res!294571 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!491637 () Bool)

(assert (=> b!491637 (= e!288840 e!288843)))

(declare-fun res!294570 () Bool)

(assert (=> b!491637 (=> (not res!294570) (not e!288843))))

(declare-fun lt!222285 () SeekEntryResult!3774)

(assert (=> b!491637 (= res!294570 (or (= lt!222285 (MissingZero!3774 i!1204)) (= lt!222285 (MissingVacant!3774 i!1204))))))

(assert (=> b!491637 (= lt!222285 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!491638 () Bool)

(declare-fun res!294569 () Bool)

(assert (=> b!491638 (=> (not res!294569) (not e!288840))))

(declare-fun arrayContainsKey!0 (array!31839 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!491638 (= res!294569 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!491639 () Bool)

(assert (=> b!491639 (= e!288843 (not e!288842))))

(declare-fun res!294573 () Bool)

(assert (=> b!491639 (=> res!294573 e!288842)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31839 (_ BitVec 32)) SeekEntryResult!3774)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!491639 (= res!294573 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15307 a!3235) j!176) mask!3524) (select (arr!15307 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!222283 mask!3524) lt!222283 lt!222286 mask!3524))))))

(assert (=> b!491639 (= lt!222283 (select (store (arr!15307 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!491639 (= lt!222286 (array!31840 (store (arr!15307 a!3235) i!1204 k0!2280) (size!15671 a!3235)))))

(assert (=> b!491639 (= lt!222281 (Found!3774 j!176))))

(assert (=> b!491639 (= lt!222281 (seekEntryOrOpen!0 (select (arr!15307 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!491639 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!222282 () Unit!14494)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31839 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14494)

(assert (=> b!491639 (= lt!222282 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!44780 res!294572) b!491631))

(assert (= (and b!491631 res!294567) b!491635))

(assert (= (and b!491635 res!294575) b!491633))

(assert (= (and b!491633 res!294574) b!491638))

(assert (= (and b!491638 res!294569) b!491637))

(assert (= (and b!491637 res!294570) b!491636))

(assert (= (and b!491636 res!294571) b!491632))

(assert (= (and b!491632 res!294568) b!491639))

(assert (= (and b!491639 (not res!294573)) b!491634))

(declare-fun m!472303 () Bool)

(assert (=> b!491636 m!472303))

(declare-fun m!472305 () Bool)

(assert (=> b!491635 m!472305))

(assert (=> b!491635 m!472305))

(declare-fun m!472307 () Bool)

(assert (=> b!491635 m!472307))

(declare-fun m!472309 () Bool)

(assert (=> start!44780 m!472309))

(declare-fun m!472311 () Bool)

(assert (=> start!44780 m!472311))

(declare-fun m!472313 () Bool)

(assert (=> b!491639 m!472313))

(declare-fun m!472315 () Bool)

(assert (=> b!491639 m!472315))

(declare-fun m!472317 () Bool)

(assert (=> b!491639 m!472317))

(declare-fun m!472319 () Bool)

(assert (=> b!491639 m!472319))

(declare-fun m!472321 () Bool)

(assert (=> b!491639 m!472321))

(assert (=> b!491639 m!472305))

(declare-fun m!472323 () Bool)

(assert (=> b!491639 m!472323))

(assert (=> b!491639 m!472315))

(declare-fun m!472325 () Bool)

(assert (=> b!491639 m!472325))

(assert (=> b!491639 m!472305))

(assert (=> b!491639 m!472321))

(assert (=> b!491639 m!472305))

(declare-fun m!472327 () Bool)

(assert (=> b!491639 m!472327))

(assert (=> b!491639 m!472305))

(declare-fun m!472329 () Bool)

(assert (=> b!491639 m!472329))

(declare-fun m!472331 () Bool)

(assert (=> b!491633 m!472331))

(declare-fun m!472333 () Bool)

(assert (=> b!491632 m!472333))

(declare-fun m!472335 () Bool)

(assert (=> b!491638 m!472335))

(declare-fun m!472337 () Bool)

(assert (=> b!491634 m!472337))

(declare-fun m!472339 () Bool)

(assert (=> b!491634 m!472339))

(declare-fun m!472341 () Bool)

(assert (=> b!491637 m!472341))

(check-sat (not b!491635) (not b!491637) (not b!491634) (not b!491633) (not start!44780) (not b!491638) (not b!491636) (not b!491639) (not b!491632))
(check-sat)
