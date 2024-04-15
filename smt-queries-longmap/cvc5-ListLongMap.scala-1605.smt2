; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30292 () Bool)

(assert start!30292)

(declare-fun b!303131 () Bool)

(declare-fun res!160768 () Bool)

(declare-fun e!190772 () Bool)

(assert (=> b!303131 (=> (not res!160768) (not e!190772))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!303131 (= res!160768 (validKeyInArray!0 k!2441))))

(declare-fun res!160769 () Bool)

(assert (=> start!30292 (=> (not res!160769) (not e!190772))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30292 (= res!160769 (validMask!0 mask!3709))))

(assert (=> start!30292 e!190772))

(declare-datatypes ((array!15402 0))(
  ( (array!15403 (arr!7289 (Array (_ BitVec 32) (_ BitVec 64))) (size!7642 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15402)

(declare-fun array_inv!5261 (array!15402) Bool)

(assert (=> start!30292 (array_inv!5261 a!3293)))

(assert (=> start!30292 true))

(declare-fun b!303132 () Bool)

(declare-fun res!160763 () Bool)

(assert (=> b!303132 (=> (not res!160763) (not e!190772))))

(declare-fun arrayContainsKey!0 (array!15402 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!303132 (= res!160763 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!303133 () Bool)

(declare-fun res!160766 () Bool)

(assert (=> b!303133 (=> (not res!160766) (not e!190772))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2428 0))(
  ( (MissingZero!2428 (index!11888 (_ BitVec 32))) (Found!2428 (index!11889 (_ BitVec 32))) (Intermediate!2428 (undefined!3240 Bool) (index!11890 (_ BitVec 32)) (x!30160 (_ BitVec 32))) (Undefined!2428) (MissingVacant!2428 (index!11891 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15402 (_ BitVec 32)) SeekEntryResult!2428)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303133 (= res!160766 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) (Intermediate!2428 false resIndex!52 resX!52)))))

(declare-fun b!303134 () Bool)

(assert (=> b!303134 (= e!190772 false)))

(declare-fun lt!149969 () SeekEntryResult!2428)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!303134 (= lt!149969 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!303135 () Bool)

(declare-fun res!160770 () Bool)

(assert (=> b!303135 (=> (not res!160770) (not e!190772))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!303135 (= res!160770 (and (= (select (arr!7289 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7642 a!3293))))))

(declare-fun b!303136 () Bool)

(declare-fun res!160765 () Bool)

(assert (=> b!303136 (=> (not res!160765) (not e!190772))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15402 (_ BitVec 32)) Bool)

(assert (=> b!303136 (= res!160765 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!303137 () Bool)

(declare-fun res!160767 () Bool)

(assert (=> b!303137 (=> (not res!160767) (not e!190772))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15402 (_ BitVec 32)) SeekEntryResult!2428)

(assert (=> b!303137 (= res!160767 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2428 i!1240)))))

(declare-fun b!303138 () Bool)

(declare-fun res!160764 () Bool)

(assert (=> b!303138 (=> (not res!160764) (not e!190772))))

(assert (=> b!303138 (= res!160764 (and (= (size!7642 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7642 a!3293))))))

(assert (= (and start!30292 res!160769) b!303138))

(assert (= (and b!303138 res!160764) b!303131))

(assert (= (and b!303131 res!160768) b!303132))

(assert (= (and b!303132 res!160763) b!303137))

(assert (= (and b!303137 res!160767) b!303136))

(assert (= (and b!303136 res!160765) b!303133))

(assert (= (and b!303133 res!160766) b!303135))

(assert (= (and b!303135 res!160770) b!303134))

(declare-fun m!314033 () Bool)

(assert (=> b!303134 m!314033))

(declare-fun m!314035 () Bool)

(assert (=> start!30292 m!314035))

(declare-fun m!314037 () Bool)

(assert (=> start!30292 m!314037))

(declare-fun m!314039 () Bool)

(assert (=> b!303132 m!314039))

(declare-fun m!314041 () Bool)

(assert (=> b!303133 m!314041))

(assert (=> b!303133 m!314041))

(declare-fun m!314043 () Bool)

(assert (=> b!303133 m!314043))

(declare-fun m!314045 () Bool)

(assert (=> b!303135 m!314045))

(declare-fun m!314047 () Bool)

(assert (=> b!303131 m!314047))

(declare-fun m!314049 () Bool)

(assert (=> b!303136 m!314049))

(declare-fun m!314051 () Bool)

(assert (=> b!303137 m!314051))

(push 1)

(assert (not b!303132))

(assert (not b!303136))

(assert (not b!303137))

(assert (not start!30292))

(assert (not b!303131))

(assert (not b!303134))

(assert (not b!303133))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

