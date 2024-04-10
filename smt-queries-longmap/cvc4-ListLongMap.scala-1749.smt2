; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32054 () Bool)

(assert start!32054)

(declare-fun b!319806 () Bool)

(declare-fun res!174119 () Bool)

(declare-fun e!198573 () Bool)

(assert (=> b!319806 (=> (not res!174119) (not e!198573))))

(declare-datatypes ((array!16328 0))(
  ( (array!16329 (arr!7726 (Array (_ BitVec 32) (_ BitVec 64))) (size!8078 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16328)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16328 (_ BitVec 32)) Bool)

(assert (=> b!319806 (= res!174119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!319807 () Bool)

(declare-fun res!174123 () Bool)

(assert (=> b!319807 (=> (not res!174123) (not e!198573))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!319807 (= res!174123 (and (= (size!8078 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8078 a!3305))))))

(declare-fun b!319808 () Bool)

(declare-fun res!174118 () Bool)

(assert (=> b!319808 (=> (not res!174118) (not e!198573))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2857 0))(
  ( (MissingZero!2857 (index!13604 (_ BitVec 32))) (Found!2857 (index!13605 (_ BitVec 32))) (Intermediate!2857 (undefined!3669 Bool) (index!13606 (_ BitVec 32)) (x!31875 (_ BitVec 32))) (Undefined!2857) (MissingVacant!2857 (index!13607 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16328 (_ BitVec 32)) SeekEntryResult!2857)

(assert (=> b!319808 (= res!174118 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2857 i!1250)))))

(declare-fun b!319809 () Bool)

(declare-fun res!174120 () Bool)

(assert (=> b!319809 (=> (not res!174120) (not e!198573))))

(declare-fun arrayContainsKey!0 (array!16328 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319809 (= res!174120 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!319810 () Bool)

(assert (=> b!319810 (= e!198573 false)))

(declare-fun lt!155877 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!319810 (= lt!155877 (toIndex!0 k!2497 mask!3777))))

(declare-fun b!319811 () Bool)

(declare-fun res!174121 () Bool)

(assert (=> b!319811 (=> (not res!174121) (not e!198573))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319811 (= res!174121 (validKeyInArray!0 k!2497))))

(declare-fun res!174122 () Bool)

(assert (=> start!32054 (=> (not res!174122) (not e!198573))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32054 (= res!174122 (validMask!0 mask!3777))))

(assert (=> start!32054 e!198573))

(assert (=> start!32054 true))

(declare-fun array_inv!5689 (array!16328) Bool)

(assert (=> start!32054 (array_inv!5689 a!3305)))

(assert (= (and start!32054 res!174122) b!319807))

(assert (= (and b!319807 res!174123) b!319811))

(assert (= (and b!319811 res!174121) b!319809))

(assert (= (and b!319809 res!174120) b!319808))

(assert (= (and b!319808 res!174118) b!319806))

(assert (= (and b!319806 res!174119) b!319810))

(declare-fun m!328311 () Bool)

(assert (=> b!319809 m!328311))

(declare-fun m!328313 () Bool)

(assert (=> start!32054 m!328313))

(declare-fun m!328315 () Bool)

(assert (=> start!32054 m!328315))

(declare-fun m!328317 () Bool)

(assert (=> b!319810 m!328317))

(declare-fun m!328319 () Bool)

(assert (=> b!319806 m!328319))

(declare-fun m!328321 () Bool)

(assert (=> b!319808 m!328321))

(declare-fun m!328323 () Bool)

(assert (=> b!319811 m!328323))

(push 1)

(assert (not b!319811))

(assert (not b!319809))

(assert (not b!319808))

(assert (not b!319810))

(assert (not b!319806))

(assert (not start!32054))

(check-sat)

