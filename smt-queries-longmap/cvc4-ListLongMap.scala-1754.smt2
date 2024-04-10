; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32126 () Bool)

(assert start!32126)

(declare-fun b!320184 () Bool)

(declare-fun res!174428 () Bool)

(declare-fun e!198736 () Bool)

(assert (=> b!320184 (=> (not res!174428) (not e!198736))))

(declare-datatypes ((array!16361 0))(
  ( (array!16362 (arr!7741 (Array (_ BitVec 32) (_ BitVec 64))) (size!8093 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16361)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2872 0))(
  ( (MissingZero!2872 (index!13664 (_ BitVec 32))) (Found!2872 (index!13665 (_ BitVec 32))) (Intermediate!2872 (undefined!3684 Bool) (index!13666 (_ BitVec 32)) (x!31933 (_ BitVec 32))) (Undefined!2872) (MissingVacant!2872 (index!13667 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16361 (_ BitVec 32)) SeekEntryResult!2872)

(assert (=> b!320184 (= res!174428 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2872 i!1250)))))

(declare-fun b!320185 () Bool)

(declare-fun res!174432 () Bool)

(assert (=> b!320185 (=> (not res!174432) (not e!198736))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!320185 (= res!174432 (validKeyInArray!0 k!2497))))

(declare-fun b!320186 () Bool)

(declare-fun res!174431 () Bool)

(assert (=> b!320186 (=> (not res!174431) (not e!198736))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16361 (_ BitVec 32)) Bool)

(assert (=> b!320186 (= res!174431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!320187 () Bool)

(assert (=> b!320187 (= e!198736 false)))

(declare-fun lt!155994 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!320187 (= lt!155994 (toIndex!0 k!2497 mask!3777))))

(declare-fun b!320188 () Bool)

(declare-fun res!174430 () Bool)

(assert (=> b!320188 (=> (not res!174430) (not e!198736))))

(assert (=> b!320188 (= res!174430 (and (= (size!8093 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8093 a!3305))))))

(declare-fun b!320189 () Bool)

(declare-fun res!174429 () Bool)

(assert (=> b!320189 (=> (not res!174429) (not e!198736))))

(declare-fun arrayContainsKey!0 (array!16361 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!320189 (= res!174429 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun res!174427 () Bool)

(assert (=> start!32126 (=> (not res!174427) (not e!198736))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32126 (= res!174427 (validMask!0 mask!3777))))

(assert (=> start!32126 e!198736))

(assert (=> start!32126 true))

(declare-fun array_inv!5704 (array!16361) Bool)

(assert (=> start!32126 (array_inv!5704 a!3305)))

(assert (= (and start!32126 res!174427) b!320188))

(assert (= (and b!320188 res!174430) b!320185))

(assert (= (and b!320185 res!174432) b!320189))

(assert (= (and b!320189 res!174429) b!320184))

(assert (= (and b!320184 res!174428) b!320186))

(assert (= (and b!320186 res!174431) b!320187))

(declare-fun m!328599 () Bool)

(assert (=> b!320189 m!328599))

(declare-fun m!328601 () Bool)

(assert (=> b!320186 m!328601))

(declare-fun m!328603 () Bool)

(assert (=> b!320185 m!328603))

(declare-fun m!328605 () Bool)

(assert (=> start!32126 m!328605))

(declare-fun m!328607 () Bool)

(assert (=> start!32126 m!328607))

(declare-fun m!328609 () Bool)

(assert (=> b!320187 m!328609))

(declare-fun m!328611 () Bool)

(assert (=> b!320184 m!328611))

(push 1)

(assert (not b!320186))

(assert (not start!32126))

(assert (not b!320185))

(assert (not b!320189))

