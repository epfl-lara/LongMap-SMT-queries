; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32052 () Bool)

(assert start!32052)

(declare-fun b!319861 () Bool)

(declare-fun res!174227 () Bool)

(declare-fun e!198576 () Bool)

(assert (=> b!319861 (=> (not res!174227) (not e!198576))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319861 (= res!174227 (validKeyInArray!0 k!2497))))

(declare-fun b!319862 () Bool)

(assert (=> b!319862 (= e!198576 false)))

(declare-fun lt!155913 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!319862 (= lt!155913 (toIndex!0 k!2497 mask!3777))))

(declare-fun b!319863 () Bool)

(declare-fun res!174228 () Bool)

(assert (=> b!319863 (=> (not res!174228) (not e!198576))))

(declare-datatypes ((array!16339 0))(
  ( (array!16340 (arr!7731 (Array (_ BitVec 32) (_ BitVec 64))) (size!8083 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16339)

(declare-fun arrayContainsKey!0 (array!16339 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319863 (= res!174228 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun res!174224 () Bool)

(assert (=> start!32052 (=> (not res!174224) (not e!198576))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32052 (= res!174224 (validMask!0 mask!3777))))

(assert (=> start!32052 e!198576))

(assert (=> start!32052 true))

(declare-fun array_inv!5681 (array!16339) Bool)

(assert (=> start!32052 (array_inv!5681 a!3305)))

(declare-fun b!319864 () Bool)

(declare-fun res!174223 () Bool)

(assert (=> b!319864 (=> (not res!174223) (not e!198576))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2827 0))(
  ( (MissingZero!2827 (index!13484 (_ BitVec 32))) (Found!2827 (index!13485 (_ BitVec 32))) (Intermediate!2827 (undefined!3639 Bool) (index!13486 (_ BitVec 32)) (x!31858 (_ BitVec 32))) (Undefined!2827) (MissingVacant!2827 (index!13487 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16339 (_ BitVec 32)) SeekEntryResult!2827)

(assert (=> b!319864 (= res!174223 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2827 i!1250)))))

(declare-fun b!319865 () Bool)

(declare-fun res!174226 () Bool)

(assert (=> b!319865 (=> (not res!174226) (not e!198576))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16339 (_ BitVec 32)) Bool)

(assert (=> b!319865 (= res!174226 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!319866 () Bool)

(declare-fun res!174225 () Bool)

(assert (=> b!319866 (=> (not res!174225) (not e!198576))))

(assert (=> b!319866 (= res!174225 (and (= (size!8083 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8083 a!3305))))))

(assert (= (and start!32052 res!174224) b!319866))

(assert (= (and b!319866 res!174225) b!319861))

(assert (= (and b!319861 res!174227) b!319863))

(assert (= (and b!319863 res!174228) b!319864))

(assert (= (and b!319864 res!174223) b!319865))

(assert (= (and b!319865 res!174226) b!319862))

(declare-fun m!328571 () Bool)

(assert (=> b!319862 m!328571))

(declare-fun m!328573 () Bool)

(assert (=> start!32052 m!328573))

(declare-fun m!328575 () Bool)

(assert (=> start!32052 m!328575))

(declare-fun m!328577 () Bool)

(assert (=> b!319863 m!328577))

(declare-fun m!328579 () Bool)

(assert (=> b!319864 m!328579))

(declare-fun m!328581 () Bool)

(assert (=> b!319865 m!328581))

(declare-fun m!328583 () Bool)

(assert (=> b!319861 m!328583))

(push 1)

(assert (not b!319861))

(assert (not b!319864))

(assert (not b!319865))

(assert (not b!319863))

(assert (not start!32052))

(assert (not b!319862))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

