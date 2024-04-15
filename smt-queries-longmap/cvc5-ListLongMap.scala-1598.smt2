; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30250 () Bool)

(assert start!30250)

(declare-fun b!302600 () Bool)

(declare-fun res!160235 () Bool)

(declare-fun e!190619 () Bool)

(assert (=> b!302600 (=> (not res!160235) (not e!190619))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!302600 (= res!160235 (validKeyInArray!0 k!2441))))

(declare-fun b!302601 () Bool)

(declare-fun res!160232 () Bool)

(assert (=> b!302601 (=> (not res!160232) (not e!190619))))

(declare-datatypes ((array!15360 0))(
  ( (array!15361 (arr!7268 (Array (_ BitVec 32) (_ BitVec 64))) (size!7621 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15360)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15360 (_ BitVec 32)) Bool)

(assert (=> b!302601 (= res!160232 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!302602 () Bool)

(declare-fun res!160233 () Bool)

(assert (=> b!302602 (=> (not res!160233) (not e!190619))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2407 0))(
  ( (MissingZero!2407 (index!11804 (_ BitVec 32))) (Found!2407 (index!11805 (_ BitVec 32))) (Intermediate!2407 (undefined!3219 Bool) (index!11806 (_ BitVec 32)) (x!30083 (_ BitVec 32))) (Undefined!2407) (MissingVacant!2407 (index!11807 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15360 (_ BitVec 32)) SeekEntryResult!2407)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!302602 (= res!160233 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) (Intermediate!2407 false resIndex!52 resX!52)))))

(declare-fun b!302603 () Bool)

(assert (=> b!302603 (= e!190619 false)))

(declare-fun lt!149906 () SeekEntryResult!2407)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!302603 (= lt!149906 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun res!160238 () Bool)

(assert (=> start!30250 (=> (not res!160238) (not e!190619))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30250 (= res!160238 (validMask!0 mask!3709))))

(assert (=> start!30250 e!190619))

(declare-fun array_inv!5240 (array!15360) Bool)

(assert (=> start!30250 (array_inv!5240 a!3293)))

(assert (=> start!30250 true))

(declare-fun b!302604 () Bool)

(declare-fun res!160239 () Bool)

(assert (=> b!302604 (=> (not res!160239) (not e!190619))))

(declare-fun arrayContainsKey!0 (array!15360 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!302604 (= res!160239 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!302605 () Bool)

(declare-fun res!160234 () Bool)

(assert (=> b!302605 (=> (not res!160234) (not e!190619))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!302605 (= res!160234 (and (= (select (arr!7268 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7621 a!3293))))))

(declare-fun b!302606 () Bool)

(declare-fun res!160237 () Bool)

(assert (=> b!302606 (=> (not res!160237) (not e!190619))))

(assert (=> b!302606 (= res!160237 (and (= (size!7621 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7621 a!3293))))))

(declare-fun b!302607 () Bool)

(declare-fun res!160236 () Bool)

(assert (=> b!302607 (=> (not res!160236) (not e!190619))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15360 (_ BitVec 32)) SeekEntryResult!2407)

(assert (=> b!302607 (= res!160236 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2407 i!1240)))))

(assert (= (and start!30250 res!160238) b!302606))

(assert (= (and b!302606 res!160237) b!302600))

(assert (= (and b!302600 res!160235) b!302604))

(assert (= (and b!302604 res!160239) b!302607))

(assert (= (and b!302607 res!160236) b!302601))

(assert (= (and b!302601 res!160232) b!302602))

(assert (= (and b!302602 res!160233) b!302605))

(assert (= (and b!302605 res!160234) b!302603))

(declare-fun m!313595 () Bool)

(assert (=> b!302605 m!313595))

(declare-fun m!313597 () Bool)

(assert (=> b!302602 m!313597))

(assert (=> b!302602 m!313597))

(declare-fun m!313599 () Bool)

(assert (=> b!302602 m!313599))

(declare-fun m!313601 () Bool)

(assert (=> b!302603 m!313601))

(declare-fun m!313603 () Bool)

(assert (=> b!302600 m!313603))

(declare-fun m!313605 () Bool)

(assert (=> start!30250 m!313605))

(declare-fun m!313607 () Bool)

(assert (=> start!30250 m!313607))

(declare-fun m!313609 () Bool)

(assert (=> b!302604 m!313609))

(declare-fun m!313611 () Bool)

(assert (=> b!302601 m!313611))

(declare-fun m!313613 () Bool)

(assert (=> b!302607 m!313613))

(push 1)

(assert (not b!302604))

(assert (not b!302600))

(assert (not b!302603))

(assert (not b!302601))

(assert (not start!30250))

(assert (not b!302607))

(assert (not b!302602))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

