; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30246 () Bool)

(assert start!30246)

(declare-fun b!302641 () Bool)

(declare-fun res!160131 () Bool)

(declare-fun e!190722 () Bool)

(assert (=> b!302641 (=> (not res!160131) (not e!190722))))

(declare-datatypes ((array!15352 0))(
  ( (array!15353 (arr!7264 (Array (_ BitVec 32) (_ BitVec 64))) (size!7616 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15352)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15352 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!302641 (= res!160131 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!302642 () Bool)

(assert (=> b!302642 (= e!190722 false)))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2404 0))(
  ( (MissingZero!2404 (index!11792 (_ BitVec 32))) (Found!2404 (index!11793 (_ BitVec 32))) (Intermediate!2404 (undefined!3216 Bool) (index!11794 (_ BitVec 32)) (x!30061 (_ BitVec 32))) (Undefined!2404) (MissingVacant!2404 (index!11795 (_ BitVec 32))) )
))
(declare-fun lt!150114 () SeekEntryResult!2404)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15352 (_ BitVec 32)) SeekEntryResult!2404)

(assert (=> b!302642 (= lt!150114 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!302643 () Bool)

(declare-fun res!160133 () Bool)

(assert (=> b!302643 (=> (not res!160133) (not e!190722))))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!302643 (= res!160133 (and (= (select (arr!7264 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7616 a!3293))))))

(declare-fun res!160130 () Bool)

(assert (=> start!30246 (=> (not res!160130) (not e!190722))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30246 (= res!160130 (validMask!0 mask!3709))))

(assert (=> start!30246 e!190722))

(declare-fun array_inv!5227 (array!15352) Bool)

(assert (=> start!30246 (array_inv!5227 a!3293)))

(assert (=> start!30246 true))

(declare-fun b!302644 () Bool)

(declare-fun res!160127 () Bool)

(assert (=> b!302644 (=> (not res!160127) (not e!190722))))

(assert (=> b!302644 (= res!160127 (and (= (size!7616 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7616 a!3293))))))

(declare-fun b!302645 () Bool)

(declare-fun res!160129 () Bool)

(assert (=> b!302645 (=> (not res!160129) (not e!190722))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15352 (_ BitVec 32)) SeekEntryResult!2404)

(assert (=> b!302645 (= res!160129 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2404 i!1240)))))

(declare-fun b!302646 () Bool)

(declare-fun res!160132 () Bool)

(assert (=> b!302646 (=> (not res!160132) (not e!190722))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!302646 (= res!160132 (validKeyInArray!0 k!2441))))

(declare-fun b!302647 () Bool)

(declare-fun res!160134 () Bool)

(assert (=> b!302647 (=> (not res!160134) (not e!190722))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15352 (_ BitVec 32)) Bool)

(assert (=> b!302647 (= res!160134 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!302648 () Bool)

(declare-fun res!160128 () Bool)

(assert (=> b!302648 (=> (not res!160128) (not e!190722))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!302648 (= res!160128 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) (Intermediate!2404 false resIndex!52 resX!52)))))

(assert (= (and start!30246 res!160130) b!302644))

(assert (= (and b!302644 res!160127) b!302646))

(assert (= (and b!302646 res!160132) b!302641))

(assert (= (and b!302641 res!160131) b!302645))

(assert (= (and b!302645 res!160129) b!302647))

(assert (= (and b!302647 res!160134) b!302648))

(assert (= (and b!302648 res!160128) b!302643))

(assert (= (and b!302643 res!160133) b!302642))

(declare-fun m!314133 () Bool)

(assert (=> b!302641 m!314133))

(declare-fun m!314135 () Bool)

(assert (=> b!302645 m!314135))

(declare-fun m!314137 () Bool)

(assert (=> b!302643 m!314137))

(declare-fun m!314139 () Bool)

(assert (=> b!302646 m!314139))

(declare-fun m!314141 () Bool)

(assert (=> start!30246 m!314141))

(declare-fun m!314143 () Bool)

(assert (=> start!30246 m!314143))

(declare-fun m!314145 () Bool)

(assert (=> b!302647 m!314145))

(declare-fun m!314147 () Bool)

(assert (=> b!302648 m!314147))

(assert (=> b!302648 m!314147))

(declare-fun m!314149 () Bool)

(assert (=> b!302648 m!314149))

(declare-fun m!314151 () Bool)

(assert (=> b!302642 m!314151))

(push 1)

(assert (not b!302648))

(assert (not b!302646))

(assert (not b!302645))

