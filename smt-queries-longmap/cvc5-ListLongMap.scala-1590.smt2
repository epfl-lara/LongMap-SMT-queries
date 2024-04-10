; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30164 () Bool)

(assert start!30164)

(declare-fun res!159683 () Bool)

(declare-fun e!190495 () Bool)

(assert (=> start!30164 (=> (not res!159683) (not e!190495))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30164 (= res!159683 (validMask!0 mask!3709))))

(assert (=> start!30164 e!190495))

(declare-datatypes ((array!15315 0))(
  ( (array!15316 (arr!7247 (Array (_ BitVec 32) (_ BitVec 64))) (size!7599 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15315)

(declare-fun array_inv!5210 (array!15315) Bool)

(assert (=> start!30164 (array_inv!5210 a!3293)))

(assert (=> start!30164 true))

(declare-fun b!302069 () Bool)

(declare-fun res!159682 () Bool)

(assert (=> b!302069 (=> (not res!159682) (not e!190495))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15315 (_ BitVec 32)) Bool)

(assert (=> b!302069 (= res!159682 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!302070 () Bool)

(declare-fun res!159678 () Bool)

(assert (=> b!302070 (=> (not res!159678) (not e!190495))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!302070 (= res!159678 (and (= (size!7599 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7599 a!3293))))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun b!302071 () Bool)

(assert (=> b!302071 (= e!190495 (and (= (select (arr!7247 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7599 a!3293)) (bvsge mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709))))))

(declare-fun b!302072 () Bool)

(declare-fun res!159679 () Bool)

(assert (=> b!302072 (=> (not res!159679) (not e!190495))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15315 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!302072 (= res!159679 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!302073 () Bool)

(declare-fun res!159684 () Bool)

(assert (=> b!302073 (=> (not res!159684) (not e!190495))))

(declare-datatypes ((SeekEntryResult!2387 0))(
  ( (MissingZero!2387 (index!11724 (_ BitVec 32))) (Found!2387 (index!11725 (_ BitVec 32))) (Intermediate!2387 (undefined!3199 Bool) (index!11726 (_ BitVec 32)) (x!29998 (_ BitVec 32))) (Undefined!2387) (MissingVacant!2387 (index!11727 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15315 (_ BitVec 32)) SeekEntryResult!2387)

(assert (=> b!302073 (= res!159684 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2387 i!1240)))))

(declare-fun b!302074 () Bool)

(declare-fun res!159681 () Bool)

(assert (=> b!302074 (=> (not res!159681) (not e!190495))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!302074 (= res!159681 (validKeyInArray!0 k!2441))))

(declare-fun b!302075 () Bool)

(declare-fun res!159680 () Bool)

(assert (=> b!302075 (=> (not res!159680) (not e!190495))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15315 (_ BitVec 32)) SeekEntryResult!2387)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!302075 (= res!159680 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) (Intermediate!2387 false resIndex!52 resX!52)))))

(assert (= (and start!30164 res!159683) b!302070))

(assert (= (and b!302070 res!159678) b!302074))

(assert (= (and b!302074 res!159681) b!302072))

(assert (= (and b!302072 res!159679) b!302073))

(assert (= (and b!302073 res!159684) b!302069))

(assert (= (and b!302069 res!159682) b!302075))

(assert (= (and b!302075 res!159680) b!302071))

(declare-fun m!313715 () Bool)

(assert (=> b!302073 m!313715))

(declare-fun m!313717 () Bool)

(assert (=> b!302075 m!313717))

(assert (=> b!302075 m!313717))

(declare-fun m!313719 () Bool)

(assert (=> b!302075 m!313719))

(declare-fun m!313721 () Bool)

(assert (=> b!302071 m!313721))

(declare-fun m!313723 () Bool)

(assert (=> b!302072 m!313723))

(declare-fun m!313725 () Bool)

(assert (=> start!30164 m!313725))

(declare-fun m!313727 () Bool)

(assert (=> start!30164 m!313727))

(declare-fun m!313729 () Bool)

(assert (=> b!302074 m!313729))

(declare-fun m!313731 () Bool)

(assert (=> b!302069 m!313731))

(push 1)

(assert (not b!302069))

(assert (not start!30164))

(assert (not b!302074))

(assert (not b!302073))

(assert (not b!302072))

(assert (not b!302075))

(check-sat)

(pop 1)

(push 1)

(check-sat)

