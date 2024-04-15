; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30604 () Bool)

(assert start!30604)

(declare-fun b!306920 () Bool)

(declare-fun res!163822 () Bool)

(declare-fun e!192256 () Bool)

(assert (=> b!306920 (=> (not res!163822) (not e!192256))))

(declare-datatypes ((array!15612 0))(
  ( (array!15613 (arr!7391 (Array (_ BitVec 32) (_ BitVec 64))) (size!7744 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15612)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!306920 (= res!163822 (and (= (select (arr!7391 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7744 a!3293))))))

(declare-fun b!306921 () Bool)

(declare-fun res!163826 () Bool)

(assert (=> b!306921 (=> (not res!163826) (not e!192256))))

(declare-fun mask!3709 () (_ BitVec 32))

(assert (=> b!306921 (= res!163826 (and (= (size!7744 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7744 a!3293))))))

(declare-fun b!306922 () Bool)

(declare-fun res!163820 () Bool)

(assert (=> b!306922 (=> (not res!163820) (not e!192256))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15612 (_ BitVec 32)) Bool)

(assert (=> b!306922 (= res!163820 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!306923 () Bool)

(declare-fun res!163825 () Bool)

(assert (=> b!306923 (=> (not res!163825) (not e!192256))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!306923 (= res!163825 (validKeyInArray!0 k!2441))))

(declare-fun res!163827 () Bool)

(assert (=> start!30604 (=> (not res!163827) (not e!192256))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30604 (= res!163827 (validMask!0 mask!3709))))

(assert (=> start!30604 e!192256))

(declare-fun array_inv!5363 (array!15612) Bool)

(assert (=> start!30604 (array_inv!5363 a!3293)))

(assert (=> start!30604 true))

(declare-fun b!306924 () Bool)

(declare-fun res!163823 () Bool)

(assert (=> b!306924 (=> (not res!163823) (not e!192256))))

(declare-datatypes ((SeekEntryResult!2530 0))(
  ( (MissingZero!2530 (index!12296 (_ BitVec 32))) (Found!2530 (index!12297 (_ BitVec 32))) (Intermediate!2530 (undefined!3342 Bool) (index!12298 (_ BitVec 32)) (x!30552 (_ BitVec 32))) (Undefined!2530) (MissingVacant!2530 (index!12299 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15612 (_ BitVec 32)) SeekEntryResult!2530)

(assert (=> b!306924 (= res!163823 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2530 i!1240)))))

(declare-fun b!306925 () Bool)

(declare-fun res!163821 () Bool)

(assert (=> b!306925 (=> (not res!163821) (not e!192256))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15612 (_ BitVec 32)) SeekEntryResult!2530)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306925 (= res!163821 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) (Intermediate!2530 false resIndex!52 resX!52)))))

(declare-fun b!306926 () Bool)

(assert (=> b!306926 (= e!192256 false)))

(declare-fun lt!150869 () SeekEntryResult!2530)

(assert (=> b!306926 (= lt!150869 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!306927 () Bool)

(declare-fun res!163824 () Bool)

(assert (=> b!306927 (=> (not res!163824) (not e!192256))))

(declare-fun arrayContainsKey!0 (array!15612 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!306927 (= res!163824 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!30604 res!163827) b!306921))

(assert (= (and b!306921 res!163826) b!306923))

(assert (= (and b!306923 res!163825) b!306927))

(assert (= (and b!306927 res!163824) b!306924))

(assert (= (and b!306924 res!163823) b!306922))

(assert (= (and b!306922 res!163820) b!306925))

(assert (= (and b!306925 res!163821) b!306920))

(assert (= (and b!306920 res!163822) b!306926))

(declare-fun m!316817 () Bool)

(assert (=> b!306922 m!316817))

(declare-fun m!316819 () Bool)

(assert (=> start!30604 m!316819))

(declare-fun m!316821 () Bool)

(assert (=> start!30604 m!316821))

(declare-fun m!316823 () Bool)

(assert (=> b!306927 m!316823))

(declare-fun m!316825 () Bool)

(assert (=> b!306926 m!316825))

(declare-fun m!316827 () Bool)

(assert (=> b!306925 m!316827))

(assert (=> b!306925 m!316827))

(declare-fun m!316829 () Bool)

(assert (=> b!306925 m!316829))

(declare-fun m!316831 () Bool)

(assert (=> b!306923 m!316831))

(declare-fun m!316833 () Bool)

(assert (=> b!306920 m!316833))

(declare-fun m!316835 () Bool)

(assert (=> b!306924 m!316835))

(push 1)

(assert (not b!306925))

(assert (not b!306926))

(assert (not start!30604))

(assert (not b!306923))

(assert (not b!306924))

(assert (not b!306927))

(assert (not b!306922))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

