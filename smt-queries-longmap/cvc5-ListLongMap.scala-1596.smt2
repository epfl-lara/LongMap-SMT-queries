; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30238 () Bool)

(assert start!30238)

(declare-fun b!302668 () Bool)

(declare-fun res!160205 () Bool)

(declare-fun e!190716 () Bool)

(assert (=> b!302668 (=> (not res!160205) (not e!190716))))

(declare-datatypes ((array!15357 0))(
  ( (array!15358 (arr!7266 (Array (_ BitVec 32) (_ BitVec 64))) (size!7618 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15357)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2371 0))(
  ( (MissingZero!2371 (index!11660 (_ BitVec 32))) (Found!2371 (index!11661 (_ BitVec 32))) (Intermediate!2371 (undefined!3183 Bool) (index!11662 (_ BitVec 32)) (x!30033 (_ BitVec 32))) (Undefined!2371) (MissingVacant!2371 (index!11663 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15357 (_ BitVec 32)) SeekEntryResult!2371)

(assert (=> b!302668 (= res!160205 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2371 i!1240)))))

(declare-fun b!302669 () Bool)

(declare-fun e!190715 () Bool)

(assert (=> b!302669 (= e!190716 e!190715)))

(declare-fun res!160208 () Bool)

(assert (=> b!302669 (=> (not res!160208) (not e!190715))))

(declare-fun lt!150141 () SeekEntryResult!2371)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15357 (_ BitVec 32)) SeekEntryResult!2371)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!302669 (= res!160208 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150141))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!302669 (= lt!150141 (Intermediate!2371 false resIndex!52 resX!52))))

(declare-fun b!302670 () Bool)

(declare-fun res!160207 () Bool)

(assert (=> b!302670 (=> (not res!160207) (not e!190716))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15357 (_ BitVec 32)) Bool)

(assert (=> b!302670 (= res!160207 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!302671 () Bool)

(declare-fun res!160206 () Bool)

(assert (=> b!302671 (=> (not res!160206) (not e!190716))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!302671 (= res!160206 (validKeyInArray!0 k!2441))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun b!302672 () Bool)

(assert (=> b!302672 (= e!190715 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7266 a!3293) index!1781) k!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (or (= (select (arr!7266 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7266 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709))))))

(declare-fun b!302673 () Bool)

(declare-fun res!160210 () Bool)

(assert (=> b!302673 (=> (not res!160210) (not e!190716))))

(assert (=> b!302673 (= res!160210 (and (= (size!7618 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7618 a!3293))))))

(declare-fun b!302674 () Bool)

(declare-fun res!160209 () Bool)

(assert (=> b!302674 (=> (not res!160209) (not e!190715))))

(assert (=> b!302674 (= res!160209 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!150141))))

(declare-fun b!302675 () Bool)

(declare-fun res!160211 () Bool)

(assert (=> b!302675 (=> (not res!160211) (not e!190715))))

(assert (=> b!302675 (= res!160211 (and (= (select (arr!7266 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7618 a!3293))))))

(declare-fun res!160212 () Bool)

(assert (=> start!30238 (=> (not res!160212) (not e!190716))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30238 (= res!160212 (validMask!0 mask!3709))))

(assert (=> start!30238 e!190716))

(declare-fun array_inv!5216 (array!15357) Bool)

(assert (=> start!30238 (array_inv!5216 a!3293)))

(assert (=> start!30238 true))

(declare-fun b!302676 () Bool)

(declare-fun res!160204 () Bool)

(assert (=> b!302676 (=> (not res!160204) (not e!190716))))

(declare-fun arrayContainsKey!0 (array!15357 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!302676 (= res!160204 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!30238 res!160212) b!302673))

(assert (= (and b!302673 res!160210) b!302671))

(assert (= (and b!302671 res!160206) b!302676))

(assert (= (and b!302676 res!160204) b!302668))

(assert (= (and b!302668 res!160205) b!302670))

(assert (= (and b!302670 res!160207) b!302669))

(assert (= (and b!302669 res!160208) b!302675))

(assert (= (and b!302675 res!160211) b!302674))

(assert (= (and b!302674 res!160209) b!302672))

(declare-fun m!314307 () Bool)

(assert (=> b!302669 m!314307))

(assert (=> b!302669 m!314307))

(declare-fun m!314309 () Bool)

(assert (=> b!302669 m!314309))

(declare-fun m!314311 () Bool)

(assert (=> b!302671 m!314311))

(declare-fun m!314313 () Bool)

(assert (=> start!30238 m!314313))

(declare-fun m!314315 () Bool)

(assert (=> start!30238 m!314315))

(declare-fun m!314317 () Bool)

(assert (=> b!302675 m!314317))

(declare-fun m!314319 () Bool)

(assert (=> b!302676 m!314319))

(declare-fun m!314321 () Bool)

(assert (=> b!302674 m!314321))

(declare-fun m!314323 () Bool)

(assert (=> b!302670 m!314323))

(declare-fun m!314325 () Bool)

(assert (=> b!302668 m!314325))

(declare-fun m!314327 () Bool)

(assert (=> b!302672 m!314327))

(push 1)

(assert (not start!30238))

(assert (not b!302670))

(assert (not b!302674))

(assert (not b!302671))

(assert (not b!302668))

(assert (not b!302669))

(assert (not b!302676))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

