; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44066 () Bool)

(assert start!44066)

(declare-fun b!485703 () Bool)

(declare-fun res!289306 () Bool)

(declare-fun e!285962 () Bool)

(assert (=> b!485703 (=> (not res!289306) (not e!285962))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31434 0))(
  ( (array!31435 (arr!15115 (Array (_ BitVec 32) (_ BitVec 64))) (size!15479 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31434)

(declare-datatypes ((SeekEntryResult!3582 0))(
  ( (MissingZero!3582 (index!16507 (_ BitVec 32))) (Found!3582 (index!16508 (_ BitVec 32))) (Intermediate!3582 (undefined!4394 Bool) (index!16509 (_ BitVec 32)) (x!45650 (_ BitVec 32))) (Undefined!3582) (MissingVacant!3582 (index!16510 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31434 (_ BitVec 32)) SeekEntryResult!3582)

(assert (=> b!485703 (= res!289306 (not (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) (MissingZero!3582 i!1204))))))

(declare-fun b!485704 () Bool)

(declare-fun res!289307 () Bool)

(assert (=> b!485704 (=> (not res!289307) (not e!285962))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!485704 (= res!289307 (validKeyInArray!0 k0!2280))))

(declare-fun b!485705 () Bool)

(declare-fun res!289305 () Bool)

(assert (=> b!485705 (=> (not res!289305) (not e!285962))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!485705 (= res!289305 (validKeyInArray!0 (select (arr!15115 a!3235) j!176)))))

(declare-fun b!485706 () Bool)

(assert (=> b!485706 (= e!285962 (bvslt mask!3524 #b00000000000000000000000000000000))))

(declare-fun b!485707 () Bool)

(declare-fun res!289309 () Bool)

(assert (=> b!485707 (=> (not res!289309) (not e!285962))))

(declare-fun arrayContainsKey!0 (array!31434 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!485707 (= res!289309 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!289308 () Bool)

(assert (=> start!44066 (=> (not res!289308) (not e!285962))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44066 (= res!289308 (validMask!0 mask!3524))))

(assert (=> start!44066 e!285962))

(assert (=> start!44066 true))

(declare-fun array_inv!10911 (array!31434) Bool)

(assert (=> start!44066 (array_inv!10911 a!3235)))

(declare-fun b!485708 () Bool)

(declare-fun res!289310 () Bool)

(assert (=> b!485708 (=> (not res!289310) (not e!285962))))

(assert (=> b!485708 (= res!289310 (and (= (size!15479 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15479 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15479 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!44066 res!289308) b!485708))

(assert (= (and b!485708 res!289310) b!485705))

(assert (= (and b!485705 res!289305) b!485704))

(assert (= (and b!485704 res!289307) b!485707))

(assert (= (and b!485707 res!289309) b!485703))

(assert (= (and b!485703 res!289306) b!485706))

(declare-fun m!465785 () Bool)

(assert (=> b!485704 m!465785))

(declare-fun m!465787 () Bool)

(assert (=> b!485703 m!465787))

(declare-fun m!465789 () Bool)

(assert (=> b!485707 m!465789))

(declare-fun m!465791 () Bool)

(assert (=> b!485705 m!465791))

(assert (=> b!485705 m!465791))

(declare-fun m!465793 () Bool)

(assert (=> b!485705 m!465793))

(declare-fun m!465795 () Bool)

(assert (=> start!44066 m!465795))

(declare-fun m!465797 () Bool)

(assert (=> start!44066 m!465797))

(check-sat (not b!485707) (not start!44066) (not b!485704) (not b!485703) (not b!485705))
(check-sat)
