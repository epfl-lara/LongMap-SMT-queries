; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30214 () Bool)

(assert start!30214)

(declare-fun b!302143 () Bool)

(declare-fun res!159778 () Bool)

(declare-fun e!190484 () Bool)

(assert (=> b!302143 (=> (not res!159778) (not e!190484))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!302143 (= res!159778 (validKeyInArray!0 k!2441))))

(declare-fun b!302144 () Bool)

(declare-fun res!159777 () Bool)

(assert (=> b!302144 (=> (not res!159777) (not e!190484))))

(declare-datatypes ((array!15324 0))(
  ( (array!15325 (arr!7250 (Array (_ BitVec 32) (_ BitVec 64))) (size!7603 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15324)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!302144 (= res!159777 (and (= (size!7603 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7603 a!3293))))))

(declare-fun b!302145 () Bool)

(assert (=> b!302145 (= e!190484 false)))

(declare-datatypes ((SeekEntryResult!2389 0))(
  ( (MissingZero!2389 (index!11732 (_ BitVec 32))) (Found!2389 (index!11733 (_ BitVec 32))) (Intermediate!2389 (undefined!3201 Bool) (index!11734 (_ BitVec 32)) (x!30017 (_ BitVec 32))) (Undefined!2389) (MissingVacant!2389 (index!11735 (_ BitVec 32))) )
))
(declare-fun lt!149852 () SeekEntryResult!2389)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15324 (_ BitVec 32)) SeekEntryResult!2389)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!302145 (= lt!149852 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun res!159780 () Bool)

(assert (=> start!30214 (=> (not res!159780) (not e!190484))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30214 (= res!159780 (validMask!0 mask!3709))))

(assert (=> start!30214 e!190484))

(assert (=> start!30214 true))

(declare-fun array_inv!5222 (array!15324) Bool)

(assert (=> start!30214 (array_inv!5222 a!3293)))

(declare-fun b!302146 () Bool)

(declare-fun res!159775 () Bool)

(assert (=> b!302146 (=> (not res!159775) (not e!190484))))

(declare-fun arrayContainsKey!0 (array!15324 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!302146 (= res!159775 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!302147 () Bool)

(declare-fun res!159779 () Bool)

(assert (=> b!302147 (=> (not res!159779) (not e!190484))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15324 (_ BitVec 32)) SeekEntryResult!2389)

(assert (=> b!302147 (= res!159779 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2389 i!1240)))))

(declare-fun b!302148 () Bool)

(declare-fun res!159776 () Bool)

(assert (=> b!302148 (=> (not res!159776) (not e!190484))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15324 (_ BitVec 32)) Bool)

(assert (=> b!302148 (= res!159776 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!30214 res!159780) b!302144))

(assert (= (and b!302144 res!159777) b!302143))

(assert (= (and b!302143 res!159778) b!302146))

(assert (= (and b!302146 res!159775) b!302147))

(assert (= (and b!302147 res!159779) b!302148))

(assert (= (and b!302148 res!159776) b!302145))

(declare-fun m!313221 () Bool)

(assert (=> b!302146 m!313221))

(declare-fun m!313223 () Bool)

(assert (=> b!302147 m!313223))

(declare-fun m!313225 () Bool)

(assert (=> b!302148 m!313225))

(declare-fun m!313227 () Bool)

(assert (=> b!302145 m!313227))

(assert (=> b!302145 m!313227))

(declare-fun m!313229 () Bool)

(assert (=> b!302145 m!313229))

(declare-fun m!313231 () Bool)

(assert (=> start!30214 m!313231))

(declare-fun m!313233 () Bool)

(assert (=> start!30214 m!313233))

(declare-fun m!313235 () Bool)

(assert (=> b!302143 m!313235))

(push 1)

(assert (not start!30214))

(assert (not b!302148))

(assert (not b!302143))

(assert (not b!302146))

(assert (not b!302147))

(assert (not b!302145))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

