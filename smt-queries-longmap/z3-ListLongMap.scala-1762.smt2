; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32204 () Bool)

(assert start!32204)

(declare-fun b!320545 () Bool)

(declare-fun res!174818 () Bool)

(declare-fun e!198811 () Bool)

(assert (=> b!320545 (=> (not res!174818) (not e!198811))))

(declare-datatypes ((array!16398 0))(
  ( (array!16399 (arr!7758 (Array (_ BitVec 32) (_ BitVec 64))) (size!8111 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16398)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!320545 (= res!174818 (and (= (select (arr!7758 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8111 a!3305))))))

(declare-fun b!320546 () Bool)

(declare-fun res!174813 () Bool)

(declare-fun e!198812 () Bool)

(assert (=> b!320546 (=> (not res!174813) (not e!198812))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!320546 (= res!174813 (validKeyInArray!0 k0!2497))))

(declare-fun b!320547 () Bool)

(declare-fun res!174817 () Bool)

(assert (=> b!320547 (=> (not res!174817) (not e!198812))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16398 (_ BitVec 32)) Bool)

(assert (=> b!320547 (= res!174817 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!320548 () Bool)

(assert (=> b!320548 (= e!198811 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7758 a!3305) index!1840) k0!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (or (= (select (arr!7758 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7758 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3777 #b00000000000000000000000000000000)))))

(declare-fun b!320549 () Bool)

(declare-fun res!174812 () Bool)

(assert (=> b!320549 (=> (not res!174812) (not e!198812))))

(declare-datatypes ((SeekEntryResult!2888 0))(
  ( (MissingZero!2888 (index!13728 (_ BitVec 32))) (Found!2888 (index!13729 (_ BitVec 32))) (Intermediate!2888 (undefined!3700 Bool) (index!13730 (_ BitVec 32)) (x!32014 (_ BitVec 32))) (Undefined!2888) (MissingVacant!2888 (index!13731 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16398 (_ BitVec 32)) SeekEntryResult!2888)

(assert (=> b!320549 (= res!174812 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2888 i!1250)))))

(declare-fun b!320550 () Bool)

(declare-fun res!174819 () Bool)

(assert (=> b!320550 (=> (not res!174819) (not e!198812))))

(assert (=> b!320550 (= res!174819 (and (= (size!8111 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8111 a!3305))))))

(declare-fun b!320551 () Bool)

(declare-fun res!174814 () Bool)

(assert (=> b!320551 (=> (not res!174814) (not e!198811))))

(declare-fun lt!155888 () SeekEntryResult!2888)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16398 (_ BitVec 32)) SeekEntryResult!2888)

(assert (=> b!320551 (= res!174814 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!155888))))

(declare-fun res!174811 () Bool)

(assert (=> start!32204 (=> (not res!174811) (not e!198812))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32204 (= res!174811 (validMask!0 mask!3777))))

(assert (=> start!32204 e!198812))

(declare-fun array_inv!5730 (array!16398) Bool)

(assert (=> start!32204 (array_inv!5730 a!3305)))

(assert (=> start!32204 true))

(declare-fun b!320552 () Bool)

(declare-fun res!174815 () Bool)

(assert (=> b!320552 (=> (not res!174815) (not e!198812))))

(declare-fun arrayContainsKey!0 (array!16398 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!320552 (= res!174815 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!320553 () Bool)

(assert (=> b!320553 (= e!198812 e!198811)))

(declare-fun res!174816 () Bool)

(assert (=> b!320553 (=> (not res!174816) (not e!198811))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!320553 (= res!174816 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!155888))))

(assert (=> b!320553 (= lt!155888 (Intermediate!2888 false resIndex!58 resX!58))))

(assert (= (and start!32204 res!174811) b!320550))

(assert (= (and b!320550 res!174819) b!320546))

(assert (= (and b!320546 res!174813) b!320552))

(assert (= (and b!320552 res!174815) b!320549))

(assert (= (and b!320549 res!174812) b!320547))

(assert (= (and b!320547 res!174817) b!320553))

(assert (= (and b!320553 res!174816) b!320545))

(assert (= (and b!320545 res!174818) b!320551))

(assert (= (and b!320551 res!174814) b!320548))

(declare-fun m!328345 () Bool)

(assert (=> start!32204 m!328345))

(declare-fun m!328347 () Bool)

(assert (=> start!32204 m!328347))

(declare-fun m!328349 () Bool)

(assert (=> b!320553 m!328349))

(assert (=> b!320553 m!328349))

(declare-fun m!328351 () Bool)

(assert (=> b!320553 m!328351))

(declare-fun m!328353 () Bool)

(assert (=> b!320547 m!328353))

(declare-fun m!328355 () Bool)

(assert (=> b!320545 m!328355))

(declare-fun m!328357 () Bool)

(assert (=> b!320551 m!328357))

(declare-fun m!328359 () Bool)

(assert (=> b!320548 m!328359))

(declare-fun m!328361 () Bool)

(assert (=> b!320549 m!328361))

(declare-fun m!328363 () Bool)

(assert (=> b!320552 m!328363))

(declare-fun m!328365 () Bool)

(assert (=> b!320546 m!328365))

(check-sat (not b!320553) (not b!320547) (not start!32204) (not b!320549) (not b!320546) (not b!320551) (not b!320552))
(check-sat)
