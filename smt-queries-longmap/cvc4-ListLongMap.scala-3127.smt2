; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44062 () Bool)

(assert start!44062)

(declare-fun res!289272 () Bool)

(declare-fun e!285951 () Bool)

(assert (=> start!44062 (=> (not res!289272) (not e!285951))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44062 (= res!289272 (validMask!0 mask!3524))))

(assert (=> start!44062 e!285951))

(assert (=> start!44062 true))

(declare-datatypes ((array!31430 0))(
  ( (array!31431 (arr!15113 (Array (_ BitVec 32) (_ BitVec 64))) (size!15477 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31430)

(declare-fun array_inv!10909 (array!31430) Bool)

(assert (=> start!44062 (array_inv!10909 a!3235)))

(declare-fun b!485668 () Bool)

(declare-fun res!289274 () Bool)

(assert (=> b!485668 (=> (not res!289274) (not e!285951))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!485668 (= res!289274 (validKeyInArray!0 (select (arr!15113 a!3235) j!176)))))

(declare-fun b!485669 () Bool)

(assert (=> b!485669 (= e!285951 false)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3580 0))(
  ( (MissingZero!3580 (index!16499 (_ BitVec 32))) (Found!3580 (index!16500 (_ BitVec 32))) (Intermediate!3580 (undefined!4392 Bool) (index!16501 (_ BitVec 32)) (x!45640 (_ BitVec 32))) (Undefined!3580) (MissingVacant!3580 (index!16502 (_ BitVec 32))) )
))
(declare-fun lt!219556 () SeekEntryResult!3580)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31430 (_ BitVec 32)) SeekEntryResult!3580)

(assert (=> b!485669 (= lt!219556 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!485670 () Bool)

(declare-fun res!289273 () Bool)

(assert (=> b!485670 (=> (not res!289273) (not e!285951))))

(declare-fun arrayContainsKey!0 (array!31430 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!485670 (= res!289273 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!485671 () Bool)

(declare-fun res!289270 () Bool)

(assert (=> b!485671 (=> (not res!289270) (not e!285951))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!485671 (= res!289270 (and (= (size!15477 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15477 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15477 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!485672 () Bool)

(declare-fun res!289271 () Bool)

(assert (=> b!485672 (=> (not res!289271) (not e!285951))))

(assert (=> b!485672 (= res!289271 (validKeyInArray!0 k!2280))))

(assert (= (and start!44062 res!289272) b!485671))

(assert (= (and b!485671 res!289270) b!485668))

(assert (= (and b!485668 res!289274) b!485672))

(assert (= (and b!485672 res!289271) b!485670))

(assert (= (and b!485670 res!289273) b!485669))

(declare-fun m!465757 () Bool)

(assert (=> b!485669 m!465757))

(declare-fun m!465759 () Bool)

(assert (=> b!485672 m!465759))

(declare-fun m!465761 () Bool)

(assert (=> b!485668 m!465761))

(assert (=> b!485668 m!465761))

(declare-fun m!465763 () Bool)

(assert (=> b!485668 m!465763))

(declare-fun m!465765 () Bool)

(assert (=> b!485670 m!465765))

(declare-fun m!465767 () Bool)

(assert (=> start!44062 m!465767))

(declare-fun m!465769 () Bool)

(assert (=> start!44062 m!465769))

(push 1)

(assert (not b!485670))

(assert (not start!44062))

(assert (not b!485668))

(assert (not b!485672))

(assert (not b!485669))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

