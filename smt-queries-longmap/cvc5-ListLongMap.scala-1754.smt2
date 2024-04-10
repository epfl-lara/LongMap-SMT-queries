; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32122 () Bool)

(assert start!32122)

(declare-fun b!320148 () Bool)

(declare-fun e!198723 () Bool)

(assert (=> b!320148 (= e!198723 false)))

(declare-fun lt!155988 () (_ BitVec 32))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!320148 (= lt!155988 (toIndex!0 k!2497 mask!3777))))

(declare-fun b!320149 () Bool)

(declare-fun res!174391 () Bool)

(assert (=> b!320149 (=> (not res!174391) (not e!198723))))

(declare-datatypes ((array!16357 0))(
  ( (array!16358 (arr!7739 (Array (_ BitVec 32) (_ BitVec 64))) (size!8091 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16357)

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!320149 (= res!174391 (and (= (size!8091 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8091 a!3305))))))

(declare-fun b!320150 () Bool)

(declare-fun res!174395 () Bool)

(assert (=> b!320150 (=> (not res!174395) (not e!198723))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!320150 (= res!174395 (validKeyInArray!0 k!2497))))

(declare-fun b!320151 () Bool)

(declare-fun res!174393 () Bool)

(assert (=> b!320151 (=> (not res!174393) (not e!198723))))

(declare-datatypes ((SeekEntryResult!2870 0))(
  ( (MissingZero!2870 (index!13656 (_ BitVec 32))) (Found!2870 (index!13657 (_ BitVec 32))) (Intermediate!2870 (undefined!3682 Bool) (index!13658 (_ BitVec 32)) (x!31931 (_ BitVec 32))) (Undefined!2870) (MissingVacant!2870 (index!13659 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16357 (_ BitVec 32)) SeekEntryResult!2870)

(assert (=> b!320151 (= res!174393 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2870 i!1250)))))

(declare-fun res!174396 () Bool)

(assert (=> start!32122 (=> (not res!174396) (not e!198723))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32122 (= res!174396 (validMask!0 mask!3777))))

(assert (=> start!32122 e!198723))

(assert (=> start!32122 true))

(declare-fun array_inv!5702 (array!16357) Bool)

(assert (=> start!32122 (array_inv!5702 a!3305)))

(declare-fun b!320152 () Bool)

(declare-fun res!174394 () Bool)

(assert (=> b!320152 (=> (not res!174394) (not e!198723))))

(declare-fun arrayContainsKey!0 (array!16357 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!320152 (= res!174394 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!320153 () Bool)

(declare-fun res!174392 () Bool)

(assert (=> b!320153 (=> (not res!174392) (not e!198723))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16357 (_ BitVec 32)) Bool)

(assert (=> b!320153 (= res!174392 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(assert (= (and start!32122 res!174396) b!320149))

(assert (= (and b!320149 res!174391) b!320150))

(assert (= (and b!320150 res!174395) b!320152))

(assert (= (and b!320152 res!174394) b!320151))

(assert (= (and b!320151 res!174393) b!320153))

(assert (= (and b!320153 res!174392) b!320148))

(declare-fun m!328571 () Bool)

(assert (=> b!320148 m!328571))

(declare-fun m!328573 () Bool)

(assert (=> start!32122 m!328573))

(declare-fun m!328575 () Bool)

(assert (=> start!32122 m!328575))

(declare-fun m!328577 () Bool)

(assert (=> b!320153 m!328577))

(declare-fun m!328579 () Bool)

(assert (=> b!320152 m!328579))

(declare-fun m!328581 () Bool)

(assert (=> b!320151 m!328581))

(declare-fun m!328583 () Bool)

(assert (=> b!320150 m!328583))

(push 1)

(assert (not b!320151))

(assert (not b!320153))

(assert (not b!320150))

(assert (not b!320148))

(assert (not b!320152))

(assert (not start!32122))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

