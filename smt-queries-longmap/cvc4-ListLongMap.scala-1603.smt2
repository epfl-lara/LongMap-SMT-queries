; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30294 () Bool)

(assert start!30294)

(declare-datatypes ((array!15400 0))(
  ( (array!15401 (arr!7288 (Array (_ BitVec 32) (_ BitVec 64))) (size!7640 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15400)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun b!303261 () Bool)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun e!190910 () Bool)

(assert (=> b!303261 (= e!190910 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7288 a!3293) index!1781) k!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7288 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7288 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsgt x!1427 #b01111111111111111111111111111110)))))

(declare-fun b!303262 () Bool)

(declare-fun res!160750 () Bool)

(declare-fun e!190911 () Bool)

(assert (=> b!303262 (=> (not res!160750) (not e!190911))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2428 0))(
  ( (MissingZero!2428 (index!11888 (_ BitVec 32))) (Found!2428 (index!11889 (_ BitVec 32))) (Intermediate!2428 (undefined!3240 Bool) (index!11890 (_ BitVec 32)) (x!30149 (_ BitVec 32))) (Undefined!2428) (MissingVacant!2428 (index!11891 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15400 (_ BitVec 32)) SeekEntryResult!2428)

(assert (=> b!303262 (= res!160750 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2428 i!1240)))))

(declare-fun b!303263 () Bool)

(declare-fun res!160754 () Bool)

(assert (=> b!303263 (=> (not res!160754) (not e!190911))))

(assert (=> b!303263 (= res!160754 (and (= (size!7640 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7640 a!3293))))))

(declare-fun b!303264 () Bool)

(assert (=> b!303264 (= e!190911 e!190910)))

(declare-fun res!160747 () Bool)

(assert (=> b!303264 (=> (not res!160747) (not e!190910))))

(declare-fun lt!150186 () SeekEntryResult!2428)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15400 (_ BitVec 32)) SeekEntryResult!2428)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303264 (= res!160747 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150186))))

(assert (=> b!303264 (= lt!150186 (Intermediate!2428 false resIndex!52 resX!52))))

(declare-fun res!160752 () Bool)

(assert (=> start!30294 (=> (not res!160752) (not e!190911))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30294 (= res!160752 (validMask!0 mask!3709))))

(assert (=> start!30294 e!190911))

(declare-fun array_inv!5251 (array!15400) Bool)

(assert (=> start!30294 (array_inv!5251 a!3293)))

(assert (=> start!30294 true))

(declare-fun b!303265 () Bool)

(declare-fun res!160748 () Bool)

(assert (=> b!303265 (=> (not res!160748) (not e!190911))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!303265 (= res!160748 (validKeyInArray!0 k!2441))))

(declare-fun b!303266 () Bool)

(declare-fun res!160751 () Bool)

(assert (=> b!303266 (=> (not res!160751) (not e!190911))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15400 (_ BitVec 32)) Bool)

(assert (=> b!303266 (= res!160751 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!303267 () Bool)

(declare-fun res!160753 () Bool)

(assert (=> b!303267 (=> (not res!160753) (not e!190910))))

(assert (=> b!303267 (= res!160753 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!150186))))

(declare-fun b!303268 () Bool)

(declare-fun res!160755 () Bool)

(assert (=> b!303268 (=> (not res!160755) (not e!190911))))

(declare-fun arrayContainsKey!0 (array!15400 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!303268 (= res!160755 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!303269 () Bool)

(declare-fun res!160749 () Bool)

(assert (=> b!303269 (=> (not res!160749) (not e!190910))))

(assert (=> b!303269 (= res!160749 (and (= (select (arr!7288 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7640 a!3293))))))

(assert (= (and start!30294 res!160752) b!303263))

(assert (= (and b!303263 res!160754) b!303265))

(assert (= (and b!303265 res!160748) b!303268))

(assert (= (and b!303268 res!160755) b!303262))

(assert (= (and b!303262 res!160750) b!303266))

(assert (= (and b!303266 res!160751) b!303264))

(assert (= (and b!303264 res!160747) b!303269))

(assert (= (and b!303269 res!160749) b!303267))

(assert (= (and b!303267 res!160753) b!303261))

(declare-fun m!314641 () Bool)

(assert (=> b!303261 m!314641))

(declare-fun m!314643 () Bool)

(assert (=> b!303264 m!314643))

(assert (=> b!303264 m!314643))

(declare-fun m!314645 () Bool)

(assert (=> b!303264 m!314645))

(declare-fun m!314647 () Bool)

(assert (=> b!303265 m!314647))

(declare-fun m!314649 () Bool)

(assert (=> b!303268 m!314649))

(declare-fun m!314651 () Bool)

(assert (=> b!303267 m!314651))

(declare-fun m!314653 () Bool)

(assert (=> start!30294 m!314653))

(declare-fun m!314655 () Bool)

(assert (=> start!30294 m!314655))

(declare-fun m!314657 () Bool)

(assert (=> b!303262 m!314657))

(declare-fun m!314659 () Bool)

(assert (=> b!303266 m!314659))

(declare-fun m!314661 () Bool)

(assert (=> b!303269 m!314661))

(push 1)

(assert (not b!303264))

(assert (not start!30294))

(assert (not b!303266))

(assert (not b!303267))

(assert (not b!303268))

(assert (not b!303265))

(assert (not b!303262))

(check-sat)

