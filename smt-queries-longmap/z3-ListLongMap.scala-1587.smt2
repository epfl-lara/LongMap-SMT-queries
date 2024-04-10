; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30148 () Bool)

(assert start!30148)

(declare-fun b!301914 () Bool)

(declare-fun res!159528 () Bool)

(declare-fun e!190447 () Bool)

(assert (=> b!301914 (=> (not res!159528) (not e!190447))))

(declare-datatypes ((array!15299 0))(
  ( (array!15300 (arr!7239 (Array (_ BitVec 32) (_ BitVec 64))) (size!7591 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15299)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15299 (_ BitVec 32)) Bool)

(assert (=> b!301914 (= res!159528 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!301915 () Bool)

(declare-fun res!159524 () Bool)

(assert (=> b!301915 (=> (not res!159524) (not e!190447))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2379 0))(
  ( (MissingZero!2379 (index!11692 (_ BitVec 32))) (Found!2379 (index!11693 (_ BitVec 32))) (Intermediate!2379 (undefined!3191 Bool) (index!11694 (_ BitVec 32)) (x!29966 (_ BitVec 32))) (Undefined!2379) (MissingVacant!2379 (index!11695 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15299 (_ BitVec 32)) SeekEntryResult!2379)

(assert (=> b!301915 (= res!159524 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2379 i!1240)))))

(declare-fun b!301916 () Bool)

(declare-fun res!159527 () Bool)

(assert (=> b!301916 (=> (not res!159527) (not e!190447))))

(declare-fun arrayContainsKey!0 (array!15299 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301916 (= res!159527 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun res!159526 () Bool)

(assert (=> start!30148 (=> (not res!159526) (not e!190447))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30148 (= res!159526 (validMask!0 mask!3709))))

(assert (=> start!30148 e!190447))

(assert (=> start!30148 true))

(declare-fun array_inv!5202 (array!15299) Bool)

(assert (=> start!30148 (array_inv!5202 a!3293)))

(declare-fun b!301917 () Bool)

(declare-fun res!159525 () Bool)

(assert (=> b!301917 (=> (not res!159525) (not e!190447))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301917 (= res!159525 (validKeyInArray!0 k0!2441))))

(declare-fun b!301918 () Bool)

(assert (=> b!301918 (= e!190447 false)))

(declare-fun lt!149976 () SeekEntryResult!2379)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15299 (_ BitVec 32)) SeekEntryResult!2379)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!301918 (= lt!149976 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!301919 () Bool)

(declare-fun res!159523 () Bool)

(assert (=> b!301919 (=> (not res!159523) (not e!190447))))

(assert (=> b!301919 (= res!159523 (and (= (size!7591 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7591 a!3293))))))

(assert (= (and start!30148 res!159526) b!301919))

(assert (= (and b!301919 res!159523) b!301917))

(assert (= (and b!301917 res!159525) b!301916))

(assert (= (and b!301916 res!159527) b!301915))

(assert (= (and b!301915 res!159524) b!301914))

(assert (= (and b!301914 res!159528) b!301918))

(declare-fun m!313581 () Bool)

(assert (=> b!301918 m!313581))

(assert (=> b!301918 m!313581))

(declare-fun m!313583 () Bool)

(assert (=> b!301918 m!313583))

(declare-fun m!313585 () Bool)

(assert (=> start!30148 m!313585))

(declare-fun m!313587 () Bool)

(assert (=> start!30148 m!313587))

(declare-fun m!313589 () Bool)

(assert (=> b!301915 m!313589))

(declare-fun m!313591 () Bool)

(assert (=> b!301914 m!313591))

(declare-fun m!313593 () Bool)

(assert (=> b!301917 m!313593))

(declare-fun m!313595 () Bool)

(assert (=> b!301916 m!313595))

(check-sat (not b!301916) (not b!301915) (not start!30148) (not b!301918) (not b!301917) (not b!301914))
