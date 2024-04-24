; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44080 () Bool)

(assert start!44080)

(declare-fun b!485826 () Bool)

(declare-fun res!289484 () Bool)

(declare-fun e!285995 () Bool)

(assert (=> b!485826 (=> (not res!289484) (not e!285995))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31449 0))(
  ( (array!31450 (arr!15122 (Array (_ BitVec 32) (_ BitVec 64))) (size!15486 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31449)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!485826 (= res!289484 (and (= (size!15486 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15486 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15486 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!485827 () Bool)

(declare-fun res!289485 () Bool)

(assert (=> b!485827 (=> (not res!289485) (not e!285995))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!485827 (= res!289485 (validKeyInArray!0 (select (arr!15122 a!3235) j!176)))))

(declare-fun res!289486 () Bool)

(assert (=> start!44080 (=> (not res!289486) (not e!285995))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44080 (= res!289486 (validMask!0 mask!3524))))

(assert (=> start!44080 e!285995))

(assert (=> start!44080 true))

(declare-fun array_inv!10981 (array!31449) Bool)

(assert (=> start!44080 (array_inv!10981 a!3235)))

(declare-fun b!485828 () Bool)

(declare-fun res!289482 () Bool)

(assert (=> b!485828 (=> (not res!289482) (not e!285995))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31449 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!485828 (= res!289482 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!485829 () Bool)

(declare-fun res!289483 () Bool)

(assert (=> b!485829 (=> (not res!289483) (not e!285995))))

(assert (=> b!485829 (= res!289483 (validKeyInArray!0 k!2280))))

(declare-fun b!485830 () Bool)

(assert (=> b!485830 (= e!285995 false)))

(declare-datatypes ((SeekEntryResult!3545 0))(
  ( (MissingZero!3545 (index!16359 (_ BitVec 32))) (Found!3545 (index!16360 (_ BitVec 32))) (Intermediate!3545 (undefined!4357 Bool) (index!16361 (_ BitVec 32)) (x!45642 (_ BitVec 32))) (Undefined!3545) (MissingVacant!3545 (index!16362 (_ BitVec 32))) )
))
(declare-fun lt!219601 () SeekEntryResult!3545)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31449 (_ BitVec 32)) SeekEntryResult!3545)

(assert (=> b!485830 (= lt!219601 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(assert (= (and start!44080 res!289486) b!485826))

(assert (= (and b!485826 res!289484) b!485827))

(assert (= (and b!485827 res!289485) b!485829))

(assert (= (and b!485829 res!289483) b!485828))

(assert (= (and b!485828 res!289482) b!485830))

(declare-fun m!466137 () Bool)

(assert (=> b!485828 m!466137))

(declare-fun m!466139 () Bool)

(assert (=> b!485827 m!466139))

(assert (=> b!485827 m!466139))

(declare-fun m!466141 () Bool)

(assert (=> b!485827 m!466141))

(declare-fun m!466143 () Bool)

(assert (=> b!485829 m!466143))

(declare-fun m!466145 () Bool)

(assert (=> b!485830 m!466145))

(declare-fun m!466147 () Bool)

(assert (=> start!44080 m!466147))

(declare-fun m!466149 () Bool)

(assert (=> start!44080 m!466149))

(push 1)

(assert (not b!485827))

(assert (not start!44080))

(assert (not b!485830))

(assert (not b!485828))

(assert (not b!485829))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

