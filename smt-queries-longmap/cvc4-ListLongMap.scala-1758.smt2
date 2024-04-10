; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32150 () Bool)

(assert start!32150)

(declare-fun b!320417 () Bool)

(declare-fun res!174664 () Bool)

(declare-fun e!198807 () Bool)

(assert (=> b!320417 (=> (not res!174664) (not e!198807))))

(declare-datatypes ((array!16385 0))(
  ( (array!16386 (arr!7753 (Array (_ BitVec 32) (_ BitVec 64))) (size!8105 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16385)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2884 0))(
  ( (MissingZero!2884 (index!13712 (_ BitVec 32))) (Found!2884 (index!13713 (_ BitVec 32))) (Intermediate!2884 (undefined!3696 Bool) (index!13714 (_ BitVec 32)) (x!31977 (_ BitVec 32))) (Undefined!2884) (MissingVacant!2884 (index!13715 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16385 (_ BitVec 32)) SeekEntryResult!2884)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!320417 (= res!174664 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) (Intermediate!2884 false resIndex!58 resX!58)))))

(declare-fun b!320418 () Bool)

(declare-fun res!174661 () Bool)

(assert (=> b!320418 (=> (not res!174661) (not e!198807))))

(declare-fun arrayContainsKey!0 (array!16385 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!320418 (= res!174661 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!320419 () Bool)

(declare-fun res!174663 () Bool)

(assert (=> b!320419 (=> (not res!174663) (not e!198807))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16385 (_ BitVec 32)) SeekEntryResult!2884)

(assert (=> b!320419 (= res!174663 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2884 i!1250)))))

(declare-fun res!174662 () Bool)

(assert (=> start!32150 (=> (not res!174662) (not e!198807))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32150 (= res!174662 (validMask!0 mask!3777))))

(assert (=> start!32150 e!198807))

(declare-fun array_inv!5716 (array!16385) Bool)

(assert (=> start!32150 (array_inv!5716 a!3305)))

(assert (=> start!32150 true))

(declare-fun b!320420 () Bool)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!320420 (= e!198807 (and (= (select (arr!7753 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8105 a!3305)) (bvsge mask!3777 #b00000000000000000000000000000000) (bvsge index!1840 (bvadd #b00000000000000000000000000000001 mask!3777))))))

(declare-fun b!320421 () Bool)

(declare-fun res!174666 () Bool)

(assert (=> b!320421 (=> (not res!174666) (not e!198807))))

(assert (=> b!320421 (= res!174666 (and (= (size!8105 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8105 a!3305))))))

(declare-fun b!320422 () Bool)

(declare-fun res!174660 () Bool)

(assert (=> b!320422 (=> (not res!174660) (not e!198807))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!320422 (= res!174660 (validKeyInArray!0 k!2497))))

(declare-fun b!320423 () Bool)

(declare-fun res!174665 () Bool)

(assert (=> b!320423 (=> (not res!174665) (not e!198807))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16385 (_ BitVec 32)) Bool)

(assert (=> b!320423 (= res!174665 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(assert (= (and start!32150 res!174662) b!320421))

(assert (= (and b!320421 res!174666) b!320422))

(assert (= (and b!320422 res!174660) b!320418))

(assert (= (and b!320418 res!174661) b!320419))

(assert (= (and b!320419 res!174663) b!320423))

(assert (= (and b!320423 res!174665) b!320417))

(assert (= (and b!320417 res!174664) b!320420))

(declare-fun m!328799 () Bool)

(assert (=> b!320417 m!328799))

(assert (=> b!320417 m!328799))

(declare-fun m!328801 () Bool)

(assert (=> b!320417 m!328801))

(declare-fun m!328803 () Bool)

(assert (=> start!32150 m!328803))

(declare-fun m!328805 () Bool)

(assert (=> start!32150 m!328805))

(declare-fun m!328807 () Bool)

(assert (=> b!320418 m!328807))

(declare-fun m!328809 () Bool)

(assert (=> b!320420 m!328809))

(declare-fun m!328811 () Bool)

(assert (=> b!320419 m!328811))

(declare-fun m!328813 () Bool)

(assert (=> b!320423 m!328813))

(declare-fun m!328815 () Bool)

(assert (=> b!320422 m!328815))

(push 1)

(assert (not start!32150))

(assert (not b!320417))

(assert (not b!320422))

(assert (not b!320418))

(assert (not b!320419))

(assert (not b!320423))

(check-sat)

(pop 1)

(push 1)

(check-sat)

