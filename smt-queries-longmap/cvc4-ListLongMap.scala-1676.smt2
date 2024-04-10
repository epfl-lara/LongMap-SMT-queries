; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30948 () Bool)

(assert start!30948)

(declare-fun res!167211 () Bool)

(declare-fun e!193978 () Bool)

(assert (=> start!30948 (=> (not res!167211) (not e!193978))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30948 (= res!167211 (validMask!0 mask!3709))))

(assert (=> start!30948 e!193978))

(declare-datatypes ((array!15850 0))(
  ( (array!15851 (arr!7507 (Array (_ BitVec 32) (_ BitVec 64))) (size!7859 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15850)

(declare-fun array_inv!5470 (array!15850) Bool)

(assert (=> start!30948 (array_inv!5470 a!3293)))

(assert (=> start!30948 true))

(declare-fun e!193979 () Bool)

(declare-fun b!310757 () Bool)

(declare-fun lt!152084 () array!15850)

(declare-fun lt!152085 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2647 0))(
  ( (MissingZero!2647 (index!12764 (_ BitVec 32))) (Found!2647 (index!12765 (_ BitVec 32))) (Intermediate!2647 (undefined!3459 Bool) (index!12766 (_ BitVec 32)) (x!30988 (_ BitVec 32))) (Undefined!2647) (MissingVacant!2647 (index!12767 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15850 (_ BitVec 32)) SeekEntryResult!2647)

(assert (=> b!310757 (= e!193979 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!152084 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152085 k!2441 lt!152084 mask!3709)))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!310757 (= lt!152084 (array!15851 (store (arr!7507 a!3293) i!1240 k!2441) (size!7859 a!3293)))))

(declare-fun b!310758 () Bool)

(declare-fun res!167216 () Bool)

(assert (=> b!310758 (=> (not res!167216) (not e!193978))))

(assert (=> b!310758 (= res!167216 (and (= (size!7859 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7859 a!3293))))))

(declare-fun b!310759 () Bool)

(declare-fun res!167212 () Bool)

(assert (=> b!310759 (=> (not res!167212) (not e!193978))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15850 (_ BitVec 32)) SeekEntryResult!2647)

(assert (=> b!310759 (= res!167212 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2647 i!1240)))))

(declare-fun b!310760 () Bool)

(declare-fun e!193980 () Bool)

(assert (=> b!310760 (= e!193978 e!193980)))

(declare-fun res!167215 () Bool)

(assert (=> b!310760 (=> (not res!167215) (not e!193980))))

(declare-fun lt!152082 () SeekEntryResult!2647)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310760 (= res!167215 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!152082))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!310760 (= lt!152082 (Intermediate!2647 false resIndex!52 resX!52))))

(declare-fun b!310761 () Bool)

(declare-fun res!167213 () Bool)

(assert (=> b!310761 (=> (not res!167213) (not e!193978))))

(declare-fun arrayContainsKey!0 (array!15850 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!310761 (= res!167213 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!310762 () Bool)

(declare-fun e!193981 () Bool)

(assert (=> b!310762 (= e!193981 (not true))))

(assert (=> b!310762 e!193979))

(declare-fun res!167219 () Bool)

(assert (=> b!310762 (=> (not res!167219) (not e!193979))))

(declare-fun lt!152083 () SeekEntryResult!2647)

(assert (=> b!310762 (= res!167219 (= lt!152083 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152085 k!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310762 (= lt!152085 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!310763 () Bool)

(declare-fun res!167214 () Bool)

(assert (=> b!310763 (=> (not res!167214) (not e!193978))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15850 (_ BitVec 32)) Bool)

(assert (=> b!310763 (= res!167214 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!310764 () Bool)

(declare-fun res!167217 () Bool)

(assert (=> b!310764 (=> (not res!167217) (not e!193980))))

(assert (=> b!310764 (= res!167217 (and (= (select (arr!7507 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7859 a!3293))))))

(declare-fun b!310765 () Bool)

(assert (=> b!310765 (= e!193980 e!193981)))

(declare-fun res!167218 () Bool)

(assert (=> b!310765 (=> (not res!167218) (not e!193981))))

(assert (=> b!310765 (= res!167218 (and (= lt!152083 lt!152082) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7507 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!310765 (= lt!152083 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!310766 () Bool)

(declare-fun res!167220 () Bool)

(assert (=> b!310766 (=> (not res!167220) (not e!193978))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!310766 (= res!167220 (validKeyInArray!0 k!2441))))

(assert (= (and start!30948 res!167211) b!310758))

(assert (= (and b!310758 res!167216) b!310766))

(assert (= (and b!310766 res!167220) b!310761))

(assert (= (and b!310761 res!167213) b!310759))

(assert (= (and b!310759 res!167212) b!310763))

(assert (= (and b!310763 res!167214) b!310760))

(assert (= (and b!310760 res!167215) b!310764))

(assert (= (and b!310764 res!167217) b!310765))

(assert (= (and b!310765 res!167218) b!310762))

(assert (= (and b!310762 res!167219) b!310757))

(declare-fun m!320685 () Bool)

(assert (=> b!310764 m!320685))

(declare-fun m!320687 () Bool)

(assert (=> b!310761 m!320687))

(declare-fun m!320689 () Bool)

(assert (=> b!310765 m!320689))

(declare-fun m!320691 () Bool)

(assert (=> b!310765 m!320691))

(declare-fun m!320693 () Bool)

(assert (=> start!30948 m!320693))

(declare-fun m!320695 () Bool)

(assert (=> start!30948 m!320695))

(declare-fun m!320697 () Bool)

(assert (=> b!310759 m!320697))

(declare-fun m!320699 () Bool)

(assert (=> b!310762 m!320699))

(declare-fun m!320701 () Bool)

(assert (=> b!310762 m!320701))

(declare-fun m!320703 () Bool)

(assert (=> b!310763 m!320703))

(declare-fun m!320705 () Bool)

(assert (=> b!310757 m!320705))

(declare-fun m!320707 () Bool)

(assert (=> b!310757 m!320707))

(declare-fun m!320709 () Bool)

(assert (=> b!310757 m!320709))

(declare-fun m!320711 () Bool)

(assert (=> b!310766 m!320711))

(declare-fun m!320713 () Bool)

(assert (=> b!310760 m!320713))

(assert (=> b!310760 m!320713))

(declare-fun m!320715 () Bool)

(assert (=> b!310760 m!320715))

(push 1)

(assert (not start!30948))

(assert (not b!310761))

(assert (not b!310759))

(assert (not b!310766))

