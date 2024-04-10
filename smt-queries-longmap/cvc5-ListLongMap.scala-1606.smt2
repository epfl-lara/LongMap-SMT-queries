; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30308 () Bool)

(assert start!30308)

(declare-fun b!303432 () Bool)

(declare-fun res!160923 () Bool)

(declare-fun e!190956 () Bool)

(assert (=> b!303432 (=> (not res!160923) (not e!190956))))

(declare-datatypes ((array!15414 0))(
  ( (array!15415 (arr!7295 (Array (_ BitVec 32) (_ BitVec 64))) (size!7647 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15414)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2435 0))(
  ( (MissingZero!2435 (index!11916 (_ BitVec 32))) (Found!2435 (index!11917 (_ BitVec 32))) (Intermediate!2435 (undefined!3247 Bool) (index!11918 (_ BitVec 32)) (x!30180 (_ BitVec 32))) (Undefined!2435) (MissingVacant!2435 (index!11919 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15414 (_ BitVec 32)) SeekEntryResult!2435)

(assert (=> b!303432 (= res!160923 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2435 i!1240)))))

(declare-fun res!160919 () Bool)

(assert (=> start!30308 (=> (not res!160919) (not e!190956))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30308 (= res!160919 (validMask!0 mask!3709))))

(assert (=> start!30308 e!190956))

(declare-fun array_inv!5258 (array!15414) Bool)

(assert (=> start!30308 (array_inv!5258 a!3293)))

(assert (=> start!30308 true))

(declare-fun b!303433 () Bool)

(declare-fun e!190957 () Bool)

(assert (=> b!303433 (= e!190956 e!190957)))

(declare-fun res!160921 () Bool)

(assert (=> b!303433 (=> (not res!160921) (not e!190957))))

(declare-fun lt!150207 () SeekEntryResult!2435)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15414 (_ BitVec 32)) SeekEntryResult!2435)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303433 (= res!160921 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150207))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!303433 (= lt!150207 (Intermediate!2435 false resIndex!52 resX!52))))

(declare-fun b!303434 () Bool)

(declare-fun res!160920 () Bool)

(assert (=> b!303434 (=> (not res!160920) (not e!190957))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!303434 (= res!160920 (and (= (select (arr!7295 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7647 a!3293))))))

(declare-fun b!303435 () Bool)

(declare-fun res!160918 () Bool)

(assert (=> b!303435 (=> (not res!160918) (not e!190956))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15414 (_ BitVec 32)) Bool)

(assert (=> b!303435 (= res!160918 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!303436 () Bool)

(assert (=> b!303436 (= e!190957 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7295 a!3293) index!1781) k!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7295 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7295 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3709 #b00000000000000000000000000000000)))))

(declare-fun b!303437 () Bool)

(declare-fun res!160924 () Bool)

(assert (=> b!303437 (=> (not res!160924) (not e!190956))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!303437 (= res!160924 (validKeyInArray!0 k!2441))))

(declare-fun b!303438 () Bool)

(declare-fun res!160926 () Bool)

(assert (=> b!303438 (=> (not res!160926) (not e!190956))))

(assert (=> b!303438 (= res!160926 (and (= (size!7647 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7647 a!3293))))))

(declare-fun b!303439 () Bool)

(declare-fun res!160922 () Bool)

(assert (=> b!303439 (=> (not res!160922) (not e!190956))))

(declare-fun arrayContainsKey!0 (array!15414 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!303439 (= res!160922 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!303440 () Bool)

(declare-fun res!160925 () Bool)

(assert (=> b!303440 (=> (not res!160925) (not e!190957))))

(assert (=> b!303440 (= res!160925 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!150207))))

(assert (= (and start!30308 res!160919) b!303438))

(assert (= (and b!303438 res!160926) b!303437))

(assert (= (and b!303437 res!160924) b!303439))

(assert (= (and b!303439 res!160922) b!303432))

(assert (= (and b!303432 res!160923) b!303435))

(assert (= (and b!303435 res!160918) b!303433))

(assert (= (and b!303433 res!160921) b!303434))

(assert (= (and b!303434 res!160920) b!303440))

(assert (= (and b!303440 res!160925) b!303436))

(declare-fun m!314783 () Bool)

(assert (=> b!303436 m!314783))

(declare-fun m!314785 () Bool)

(assert (=> start!30308 m!314785))

(declare-fun m!314787 () Bool)

(assert (=> start!30308 m!314787))

(declare-fun m!314789 () Bool)

(assert (=> b!303435 m!314789))

(declare-fun m!314791 () Bool)

(assert (=> b!303433 m!314791))

(assert (=> b!303433 m!314791))

(declare-fun m!314793 () Bool)

(assert (=> b!303433 m!314793))

(declare-fun m!314795 () Bool)

(assert (=> b!303439 m!314795))

(declare-fun m!314797 () Bool)

(assert (=> b!303434 m!314797))

(declare-fun m!314799 () Bool)

(assert (=> b!303440 m!314799))

(declare-fun m!314801 () Bool)

(assert (=> b!303432 m!314801))

(declare-fun m!314803 () Bool)

(assert (=> b!303437 m!314803))

(push 1)

(assert (not b!303437))

