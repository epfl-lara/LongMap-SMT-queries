; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30276 () Bool)

(assert start!30276)

(declare-fun res!160696 () Bool)

(declare-fun e!190858 () Bool)

(assert (=> start!30276 (=> (not res!160696) (not e!190858))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30276 (= res!160696 (validMask!0 mask!3709))))

(assert (=> start!30276 e!190858))

(declare-datatypes ((array!15395 0))(
  ( (array!15396 (arr!7285 (Array (_ BitVec 32) (_ BitVec 64))) (size!7637 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15395)

(declare-fun array_inv!5235 (array!15395) Bool)

(assert (=> start!30276 (array_inv!5235 a!3293)))

(assert (=> start!30276 true))

(declare-fun b!303154 () Bool)

(declare-fun res!160695 () Bool)

(assert (=> b!303154 (=> (not res!160695) (not e!190858))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!303154 (= res!160695 (validKeyInArray!0 k0!2441))))

(declare-fun b!303155 () Bool)

(declare-fun res!160691 () Bool)

(assert (=> b!303155 (=> (not res!160691) (not e!190858))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2390 0))(
  ( (MissingZero!2390 (index!11736 (_ BitVec 32))) (Found!2390 (index!11737 (_ BitVec 32))) (Intermediate!2390 (undefined!3202 Bool) (index!11738 (_ BitVec 32)) (x!30108 (_ BitVec 32))) (Undefined!2390) (MissingVacant!2390 (index!11739 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15395 (_ BitVec 32)) SeekEntryResult!2390)

(assert (=> b!303155 (= res!160691 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2390 i!1240)))))

(declare-fun b!303156 () Bool)

(declare-fun res!160690 () Bool)

(assert (=> b!303156 (=> (not res!160690) (not e!190858))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15395 (_ BitVec 32)) Bool)

(assert (=> b!303156 (= res!160690 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!303157 () Bool)

(declare-fun e!190859 () Bool)

(assert (=> b!303157 (= e!190858 e!190859)))

(declare-fun res!160693 () Bool)

(assert (=> b!303157 (=> (not res!160693) (not e!190859))))

(declare-fun lt!150198 () SeekEntryResult!2390)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15395 (_ BitVec 32)) SeekEntryResult!2390)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303157 (= res!160693 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150198))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!303157 (= lt!150198 (Intermediate!2390 false resIndex!52 resX!52))))

(declare-fun b!303158 () Bool)

(declare-fun res!160698 () Bool)

(assert (=> b!303158 (=> (not res!160698) (not e!190858))))

(declare-fun arrayContainsKey!0 (array!15395 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!303158 (= res!160698 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!303159 () Bool)

(declare-fun res!160692 () Bool)

(assert (=> b!303159 (=> (not res!160692) (not e!190859))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!303159 (= res!160692 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150198))))

(declare-fun b!303160 () Bool)

(declare-fun res!160697 () Bool)

(assert (=> b!303160 (=> (not res!160697) (not e!190858))))

(assert (=> b!303160 (= res!160697 (and (= (size!7637 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7637 a!3293))))))

(declare-fun b!303161 () Bool)

(declare-fun res!160694 () Bool)

(assert (=> b!303161 (=> (not res!160694) (not e!190859))))

(assert (=> b!303161 (= res!160694 (and (= (select (arr!7285 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7637 a!3293))))))

(declare-fun b!303162 () Bool)

(assert (=> b!303162 (= e!190859 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7285 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7285 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7285 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsgt x!1427 #b01111111111111111111111111111110)))))

(assert (= (and start!30276 res!160696) b!303160))

(assert (= (and b!303160 res!160697) b!303154))

(assert (= (and b!303154 res!160695) b!303158))

(assert (= (and b!303158 res!160698) b!303155))

(assert (= (and b!303155 res!160691) b!303156))

(assert (= (and b!303156 res!160690) b!303157))

(assert (= (and b!303157 res!160693) b!303161))

(assert (= (and b!303161 res!160694) b!303159))

(assert (= (and b!303159 res!160692) b!303162))

(declare-fun m!314707 () Bool)

(assert (=> b!303155 m!314707))

(declare-fun m!314709 () Bool)

(assert (=> b!303157 m!314709))

(assert (=> b!303157 m!314709))

(declare-fun m!314711 () Bool)

(assert (=> b!303157 m!314711))

(declare-fun m!314713 () Bool)

(assert (=> b!303156 m!314713))

(declare-fun m!314715 () Bool)

(assert (=> b!303154 m!314715))

(declare-fun m!314717 () Bool)

(assert (=> b!303162 m!314717))

(declare-fun m!314719 () Bool)

(assert (=> b!303161 m!314719))

(declare-fun m!314721 () Bool)

(assert (=> b!303159 m!314721))

(declare-fun m!314723 () Bool)

(assert (=> start!30276 m!314723))

(declare-fun m!314725 () Bool)

(assert (=> start!30276 m!314725))

(declare-fun m!314727 () Bool)

(assert (=> b!303158 m!314727))

(check-sat (not b!303155) (not b!303154) (not start!30276) (not b!303159) (not b!303156) (not b!303157) (not b!303158))
(check-sat)
