; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30286 () Bool)

(assert start!30286)

(declare-fun b!303153 () Bool)

(declare-fun res!160646 () Bool)

(declare-fun e!190875 () Bool)

(assert (=> b!303153 (=> (not res!160646) (not e!190875))))

(declare-datatypes ((array!15392 0))(
  ( (array!15393 (arr!7284 (Array (_ BitVec 32) (_ BitVec 64))) (size!7636 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15392)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15392 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!303153 (= res!160646 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!303154 () Bool)

(declare-fun res!160645 () Bool)

(assert (=> b!303154 (=> (not res!160645) (not e!190875))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!303154 (= res!160645 (validKeyInArray!0 k0!2441))))

(declare-fun b!303155 () Bool)

(declare-fun res!160639 () Bool)

(assert (=> b!303155 (=> (not res!160639) (not e!190875))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2424 0))(
  ( (MissingZero!2424 (index!11872 (_ BitVec 32))) (Found!2424 (index!11873 (_ BitVec 32))) (Intermediate!2424 (undefined!3236 Bool) (index!11874 (_ BitVec 32)) (x!30137 (_ BitVec 32))) (Undefined!2424) (MissingVacant!2424 (index!11875 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15392 (_ BitVec 32)) SeekEntryResult!2424)

(assert (=> b!303155 (= res!160639 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2424 i!1240)))))

(declare-fun b!303156 () Bool)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun e!190874 () Bool)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!303156 (= e!190874 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7284 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7284 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7284 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709))))))

(declare-fun b!303157 () Bool)

(assert (=> b!303157 (= e!190875 e!190874)))

(declare-fun res!160643 () Bool)

(assert (=> b!303157 (=> (not res!160643) (not e!190874))))

(declare-fun lt!150174 () SeekEntryResult!2424)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15392 (_ BitVec 32)) SeekEntryResult!2424)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303157 (= res!160643 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150174))))

(assert (=> b!303157 (= lt!150174 (Intermediate!2424 false resIndex!52 resX!52))))

(declare-fun b!303158 () Bool)

(declare-fun res!160642 () Bool)

(assert (=> b!303158 (=> (not res!160642) (not e!190874))))

(assert (=> b!303158 (= res!160642 (and (= (select (arr!7284 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7636 a!3293))))))

(declare-fun res!160641 () Bool)

(assert (=> start!30286 (=> (not res!160641) (not e!190875))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30286 (= res!160641 (validMask!0 mask!3709))))

(assert (=> start!30286 e!190875))

(declare-fun array_inv!5247 (array!15392) Bool)

(assert (=> start!30286 (array_inv!5247 a!3293)))

(assert (=> start!30286 true))

(declare-fun b!303159 () Bool)

(declare-fun res!160647 () Bool)

(assert (=> b!303159 (=> (not res!160647) (not e!190875))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15392 (_ BitVec 32)) Bool)

(assert (=> b!303159 (= res!160647 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!303160 () Bool)

(declare-fun res!160644 () Bool)

(assert (=> b!303160 (=> (not res!160644) (not e!190874))))

(assert (=> b!303160 (= res!160644 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150174))))

(declare-fun b!303161 () Bool)

(declare-fun res!160640 () Bool)

(assert (=> b!303161 (=> (not res!160640) (not e!190875))))

(assert (=> b!303161 (= res!160640 (and (= (size!7636 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7636 a!3293))))))

(assert (= (and start!30286 res!160641) b!303161))

(assert (= (and b!303161 res!160640) b!303154))

(assert (= (and b!303154 res!160645) b!303153))

(assert (= (and b!303153 res!160646) b!303155))

(assert (= (and b!303155 res!160639) b!303159))

(assert (= (and b!303159 res!160647) b!303157))

(assert (= (and b!303157 res!160643) b!303158))

(assert (= (and b!303158 res!160642) b!303160))

(assert (= (and b!303160 res!160644) b!303156))

(declare-fun m!314553 () Bool)

(assert (=> b!303156 m!314553))

(declare-fun m!314555 () Bool)

(assert (=> b!303160 m!314555))

(declare-fun m!314557 () Bool)

(assert (=> b!303154 m!314557))

(declare-fun m!314559 () Bool)

(assert (=> b!303159 m!314559))

(declare-fun m!314561 () Bool)

(assert (=> b!303157 m!314561))

(assert (=> b!303157 m!314561))

(declare-fun m!314563 () Bool)

(assert (=> b!303157 m!314563))

(declare-fun m!314565 () Bool)

(assert (=> b!303153 m!314565))

(declare-fun m!314567 () Bool)

(assert (=> b!303155 m!314567))

(declare-fun m!314569 () Bool)

(assert (=> b!303158 m!314569))

(declare-fun m!314571 () Bool)

(assert (=> start!30286 m!314571))

(declare-fun m!314573 () Bool)

(assert (=> start!30286 m!314573))

(check-sat (not b!303154) (not b!303157) (not b!303159) (not b!303160) (not start!30286) (not b!303155) (not b!303153))
(check-sat)
