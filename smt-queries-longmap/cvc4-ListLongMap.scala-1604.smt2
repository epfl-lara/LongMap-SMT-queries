; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30284 () Bool)

(assert start!30284)

(declare-fun b!303257 () Bool)

(declare-fun e!190890 () Bool)

(assert (=> b!303257 (= e!190890 false)))

(declare-datatypes ((array!15403 0))(
  ( (array!15404 (arr!7289 (Array (_ BitVec 32) (_ BitVec 64))) (size!7641 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15403)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2394 0))(
  ( (MissingZero!2394 (index!11752 (_ BitVec 32))) (Found!2394 (index!11753 (_ BitVec 32))) (Intermediate!2394 (undefined!3206 Bool) (index!11754 (_ BitVec 32)) (x!30120 (_ BitVec 32))) (Undefined!2394) (MissingVacant!2394 (index!11755 (_ BitVec 32))) )
))
(declare-fun lt!150210 () SeekEntryResult!2394)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15403 (_ BitVec 32)) SeekEntryResult!2394)

(assert (=> b!303257 (= lt!150210 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun res!160793 () Bool)

(assert (=> start!30284 (=> (not res!160793) (not e!190890))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30284 (= res!160793 (validMask!0 mask!3709))))

(assert (=> start!30284 e!190890))

(declare-fun array_inv!5239 (array!15403) Bool)

(assert (=> start!30284 (array_inv!5239 a!3293)))

(assert (=> start!30284 true))

(declare-fun b!303258 () Bool)

(declare-fun res!160800 () Bool)

(assert (=> b!303258 (=> (not res!160800) (not e!190890))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!303258 (= res!160800 (validKeyInArray!0 k!2441))))

(declare-fun b!303259 () Bool)

(declare-fun res!160799 () Bool)

(assert (=> b!303259 (=> (not res!160799) (not e!190890))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15403 (_ BitVec 32)) SeekEntryResult!2394)

(assert (=> b!303259 (= res!160799 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2394 i!1240)))))

(declare-fun b!303260 () Bool)

(declare-fun res!160796 () Bool)

(assert (=> b!303260 (=> (not res!160796) (not e!190890))))

(assert (=> b!303260 (= res!160796 (and (= (size!7641 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7641 a!3293))))))

(declare-fun b!303261 () Bool)

(declare-fun res!160797 () Bool)

(assert (=> b!303261 (=> (not res!160797) (not e!190890))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303261 (= res!160797 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) (Intermediate!2394 false resIndex!52 resX!52)))))

(declare-fun b!303262 () Bool)

(declare-fun res!160795 () Bool)

(assert (=> b!303262 (=> (not res!160795) (not e!190890))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15403 (_ BitVec 32)) Bool)

(assert (=> b!303262 (= res!160795 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!303263 () Bool)

(declare-fun res!160798 () Bool)

(assert (=> b!303263 (=> (not res!160798) (not e!190890))))

(declare-fun arrayContainsKey!0 (array!15403 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!303263 (= res!160798 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!303264 () Bool)

(declare-fun res!160794 () Bool)

(assert (=> b!303264 (=> (not res!160794) (not e!190890))))

(assert (=> b!303264 (= res!160794 (and (= (select (arr!7289 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7641 a!3293))))))

(assert (= (and start!30284 res!160793) b!303260))

(assert (= (and b!303260 res!160796) b!303258))

(assert (= (and b!303258 res!160800) b!303263))

(assert (= (and b!303263 res!160798) b!303259))

(assert (= (and b!303259 res!160799) b!303262))

(assert (= (and b!303262 res!160795) b!303261))

(assert (= (and b!303261 res!160797) b!303264))

(assert (= (and b!303264 res!160794) b!303257))

(declare-fun m!314793 () Bool)

(assert (=> b!303261 m!314793))

(assert (=> b!303261 m!314793))

(declare-fun m!314795 () Bool)

(assert (=> b!303261 m!314795))

(declare-fun m!314797 () Bool)

(assert (=> b!303263 m!314797))

(declare-fun m!314799 () Bool)

(assert (=> start!30284 m!314799))

(declare-fun m!314801 () Bool)

(assert (=> start!30284 m!314801))

(declare-fun m!314803 () Bool)

(assert (=> b!303262 m!314803))

(declare-fun m!314805 () Bool)

(assert (=> b!303257 m!314805))

(declare-fun m!314807 () Bool)

(assert (=> b!303264 m!314807))

(declare-fun m!314809 () Bool)

(assert (=> b!303259 m!314809))

(declare-fun m!314811 () Bool)

(assert (=> b!303258 m!314811))

(push 1)

(assert (not b!303261))

(assert (not b!303259))

(assert (not b!303262))

(assert (not start!30284))

(assert (not b!303258))

(assert (not b!303257))

(assert (not b!303263))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

