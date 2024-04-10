; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30614 () Bool)

(assert start!30614)

(declare-fun b!307147 () Bool)

(declare-fun res!163907 () Bool)

(declare-fun e!192420 () Bool)

(assert (=> b!307147 (=> (not res!163907) (not e!192420))))

(declare-datatypes ((array!15618 0))(
  ( (array!15619 (arr!7394 (Array (_ BitVec 32) (_ BitVec 64))) (size!7746 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15618)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2534 0))(
  ( (MissingZero!2534 (index!12312 (_ BitVec 32))) (Found!2534 (index!12313 (_ BitVec 32))) (Intermediate!2534 (undefined!3346 Bool) (index!12314 (_ BitVec 32)) (x!30561 (_ BitVec 32))) (Undefined!2534) (MissingVacant!2534 (index!12315 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15618 (_ BitVec 32)) SeekEntryResult!2534)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307147 (= res!163907 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) (Intermediate!2534 false resIndex!52 resX!52)))))

(declare-fun b!307148 () Bool)

(declare-fun res!163908 () Bool)

(assert (=> b!307148 (=> (not res!163908) (not e!192420))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15618 (_ BitVec 32)) Bool)

(assert (=> b!307148 (= res!163908 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!307149 () Bool)

(declare-fun res!163902 () Bool)

(assert (=> b!307149 (=> (not res!163902) (not e!192420))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!307149 (= res!163902 (validKeyInArray!0 k!2441))))

(declare-fun b!307150 () Bool)

(declare-fun res!163901 () Bool)

(assert (=> b!307150 (=> (not res!163901) (not e!192420))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!307150 (= res!163901 (and (= (select (arr!7394 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7746 a!3293))))))

(declare-fun b!307151 () Bool)

(declare-fun res!163904 () Bool)

(assert (=> b!307151 (=> (not res!163904) (not e!192420))))

(assert (=> b!307151 (= res!163904 (and (= (size!7746 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7746 a!3293))))))

(declare-fun b!307152 () Bool)

(assert (=> b!307152 (= e!192420 false)))

(declare-fun lt!151098 () SeekEntryResult!2534)

(assert (=> b!307152 (= lt!151098 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!307153 () Bool)

(declare-fun res!163906 () Bool)

(assert (=> b!307153 (=> (not res!163906) (not e!192420))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15618 (_ BitVec 32)) SeekEntryResult!2534)

(assert (=> b!307153 (= res!163906 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2534 i!1240)))))

(declare-fun b!307154 () Bool)

(declare-fun res!163905 () Bool)

(assert (=> b!307154 (=> (not res!163905) (not e!192420))))

(declare-fun arrayContainsKey!0 (array!15618 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!307154 (= res!163905 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun res!163903 () Bool)

(assert (=> start!30614 (=> (not res!163903) (not e!192420))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30614 (= res!163903 (validMask!0 mask!3709))))

(assert (=> start!30614 e!192420))

(declare-fun array_inv!5357 (array!15618) Bool)

(assert (=> start!30614 (array_inv!5357 a!3293)))

(assert (=> start!30614 true))

(assert (= (and start!30614 res!163903) b!307151))

(assert (= (and b!307151 res!163904) b!307149))

(assert (= (and b!307149 res!163902) b!307154))

(assert (= (and b!307154 res!163905) b!307153))

(assert (= (and b!307153 res!163906) b!307148))

(assert (= (and b!307148 res!163908) b!307147))

(assert (= (and b!307147 res!163907) b!307150))

(assert (= (and b!307150 res!163901) b!307152))

(declare-fun m!317507 () Bool)

(assert (=> b!307153 m!317507))

(declare-fun m!317509 () Bool)

(assert (=> b!307152 m!317509))

(declare-fun m!317511 () Bool)

(assert (=> b!307149 m!317511))

(declare-fun m!317513 () Bool)

(assert (=> b!307150 m!317513))

(declare-fun m!317515 () Bool)

(assert (=> b!307148 m!317515))

(declare-fun m!317517 () Bool)

(assert (=> b!307154 m!317517))

(declare-fun m!317519 () Bool)

(assert (=> b!307147 m!317519))

(assert (=> b!307147 m!317519))

(declare-fun m!317521 () Bool)

(assert (=> b!307147 m!317521))

(declare-fun m!317523 () Bool)

(assert (=> start!30614 m!317523))

(declare-fun m!317525 () Bool)

(assert (=> start!30614 m!317525))

(push 1)

(assert (not b!307147))

(assert (not b!307149))

(assert (not b!307152))

(assert (not b!307154))

(assert (not b!307153))

(assert (not start!30614))

(assert (not b!307148))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

