; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32206 () Bool)

(assert start!32206)

(declare-fun b!320688 () Bool)

(declare-fun res!174808 () Bool)

(declare-fun e!198948 () Bool)

(assert (=> b!320688 (=> (not res!174808) (not e!198948))))

(declare-datatypes ((array!16396 0))(
  ( (array!16397 (arr!7757 (Array (_ BitVec 32) (_ BitVec 64))) (size!8109 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16396)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16396 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!320688 (= res!174808 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun res!174810 () Bool)

(assert (=> start!32206 (=> (not res!174810) (not e!198948))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32206 (= res!174810 (validMask!0 mask!3777))))

(assert (=> start!32206 e!198948))

(assert (=> start!32206 true))

(declare-fun array_inv!5720 (array!16396) Bool)

(assert (=> start!32206 (array_inv!5720 a!3305)))

(declare-fun b!320689 () Bool)

(declare-fun res!174813 () Bool)

(assert (=> b!320689 (=> (not res!174813) (not e!198948))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2888 0))(
  ( (MissingZero!2888 (index!13728 (_ BitVec 32))) (Found!2888 (index!13729 (_ BitVec 32))) (Intermediate!2888 (undefined!3700 Bool) (index!13730 (_ BitVec 32)) (x!32003 (_ BitVec 32))) (Undefined!2888) (MissingVacant!2888 (index!13731 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16396 (_ BitVec 32)) SeekEntryResult!2888)

(assert (=> b!320689 (= res!174813 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2888 i!1250)))))

(declare-fun b!320690 () Bool)

(declare-fun res!174809 () Bool)

(assert (=> b!320690 (=> (not res!174809) (not e!198948))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!320690 (= res!174809 (validKeyInArray!0 k!2497))))

(declare-fun b!320691 () Bool)

(declare-fun res!174812 () Bool)

(assert (=> b!320691 (=> (not res!174812) (not e!198948))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16396 (_ BitVec 32)) Bool)

(assert (=> b!320691 (= res!174812 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!320692 () Bool)

(declare-fun res!174811 () Bool)

(assert (=> b!320692 (=> (not res!174811) (not e!198948))))

(assert (=> b!320692 (= res!174811 (and (= (size!8109 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8109 a!3305))))))

(declare-fun b!320693 () Bool)

(assert (=> b!320693 (= e!198948 false)))

(declare-fun lt!156105 () SeekEntryResult!2888)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16396 (_ BitVec 32)) SeekEntryResult!2888)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!320693 (= lt!156105 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777))))

(assert (= (and start!32206 res!174810) b!320692))

(assert (= (and b!320692 res!174811) b!320690))

(assert (= (and b!320690 res!174809) b!320688))

(assert (= (and b!320688 res!174808) b!320689))

(assert (= (and b!320689 res!174813) b!320691))

(assert (= (and b!320691 res!174812) b!320693))

(declare-fun m!328967 () Bool)

(assert (=> b!320688 m!328967))

(declare-fun m!328969 () Bool)

(assert (=> b!320693 m!328969))

(assert (=> b!320693 m!328969))

(declare-fun m!328971 () Bool)

(assert (=> b!320693 m!328971))

(declare-fun m!328973 () Bool)

(assert (=> start!32206 m!328973))

(declare-fun m!328975 () Bool)

(assert (=> start!32206 m!328975))

(declare-fun m!328977 () Bool)

(assert (=> b!320690 m!328977))

(declare-fun m!328979 () Bool)

(assert (=> b!320691 m!328979))

(declare-fun m!328981 () Bool)

(assert (=> b!320689 m!328981))

(push 1)

(assert (not b!320689))

(assert (not b!320690))

(assert (not b!320688))

(assert (not start!32206))

(assert (not b!320693))

(assert (not b!320691))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

