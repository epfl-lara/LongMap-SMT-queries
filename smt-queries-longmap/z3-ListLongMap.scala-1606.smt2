; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30294 () Bool)

(assert start!30294)

(declare-fun res!160795 () Bool)

(declare-fun e!190779 () Bool)

(assert (=> start!30294 (=> (not res!160795) (not e!190779))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30294 (= res!160795 (validMask!0 mask!3709))))

(assert (=> start!30294 e!190779))

(declare-datatypes ((array!15404 0))(
  ( (array!15405 (arr!7290 (Array (_ BitVec 32) (_ BitVec 64))) (size!7643 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15404)

(declare-fun array_inv!5262 (array!15404) Bool)

(assert (=> start!30294 (array_inv!5262 a!3293)))

(assert (=> start!30294 true))

(declare-fun b!303157 () Bool)

(declare-fun res!160794 () Bool)

(assert (=> b!303157 (=> (not res!160794) (not e!190779))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!303157 (= res!160794 (validKeyInArray!0 k0!2441))))

(declare-fun b!303158 () Bool)

(declare-fun res!160790 () Bool)

(assert (=> b!303158 (=> (not res!160790) (not e!190779))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2429 0))(
  ( (MissingZero!2429 (index!11892 (_ BitVec 32))) (Found!2429 (index!11893 (_ BitVec 32))) (Intermediate!2429 (undefined!3241 Bool) (index!11894 (_ BitVec 32)) (x!30169 (_ BitVec 32))) (Undefined!2429) (MissingVacant!2429 (index!11895 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15404 (_ BitVec 32)) SeekEntryResult!2429)

(assert (=> b!303158 (= res!160790 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2429 i!1240)))))

(declare-fun b!303159 () Bool)

(declare-fun res!160789 () Bool)

(assert (=> b!303159 (=> (not res!160789) (not e!190779))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15404 (_ BitVec 32)) Bool)

(assert (=> b!303159 (= res!160789 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!303160 () Bool)

(declare-fun e!190780 () Bool)

(assert (=> b!303160 (= e!190779 e!190780)))

(declare-fun res!160792 () Bool)

(assert (=> b!303160 (=> (not res!160792) (not e!190780))))

(declare-fun lt!149972 () SeekEntryResult!2429)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15404 (_ BitVec 32)) SeekEntryResult!2429)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303160 (= res!160792 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!149972))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!303160 (= lt!149972 (Intermediate!2429 false resIndex!52 resX!52))))

(declare-fun b!303161 () Bool)

(declare-fun res!160797 () Bool)

(assert (=> b!303161 (=> (not res!160797) (not e!190779))))

(declare-fun arrayContainsKey!0 (array!15404 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!303161 (= res!160797 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!303162 () Bool)

(declare-fun res!160791 () Bool)

(assert (=> b!303162 (=> (not res!160791) (not e!190780))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!303162 (= res!160791 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!149972))))

(declare-fun b!303163 () Bool)

(declare-fun res!160796 () Bool)

(assert (=> b!303163 (=> (not res!160796) (not e!190779))))

(assert (=> b!303163 (= res!160796 (and (= (size!7643 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7643 a!3293))))))

(declare-fun b!303164 () Bool)

(declare-fun res!160793 () Bool)

(assert (=> b!303164 (=> (not res!160793) (not e!190780))))

(assert (=> b!303164 (= res!160793 (and (= (select (arr!7290 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7643 a!3293))))))

(declare-fun b!303165 () Bool)

(assert (=> b!303165 (= e!190780 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7290 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7290 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7290 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3709 #b00000000000000000000000000000000)))))

(assert (= (and start!30294 res!160795) b!303163))

(assert (= (and b!303163 res!160796) b!303157))

(assert (= (and b!303157 res!160794) b!303161))

(assert (= (and b!303161 res!160797) b!303158))

(assert (= (and b!303158 res!160790) b!303159))

(assert (= (and b!303159 res!160789) b!303160))

(assert (= (and b!303160 res!160792) b!303164))

(assert (= (and b!303164 res!160793) b!303162))

(assert (= (and b!303162 res!160791) b!303165))

(declare-fun m!314053 () Bool)

(assert (=> b!303158 m!314053))

(declare-fun m!314055 () Bool)

(assert (=> b!303160 m!314055))

(assert (=> b!303160 m!314055))

(declare-fun m!314057 () Bool)

(assert (=> b!303160 m!314057))

(declare-fun m!314059 () Bool)

(assert (=> b!303159 m!314059))

(declare-fun m!314061 () Bool)

(assert (=> b!303157 m!314061))

(declare-fun m!314063 () Bool)

(assert (=> b!303165 m!314063))

(declare-fun m!314065 () Bool)

(assert (=> b!303164 m!314065))

(declare-fun m!314067 () Bool)

(assert (=> b!303162 m!314067))

(declare-fun m!314069 () Bool)

(assert (=> start!30294 m!314069))

(declare-fun m!314071 () Bool)

(assert (=> start!30294 m!314071))

(declare-fun m!314073 () Bool)

(assert (=> b!303161 m!314073))

(check-sat (not b!303158) (not b!303157) (not start!30294) (not b!303162) (not b!303159) (not b!303160) (not b!303161))
(check-sat)
