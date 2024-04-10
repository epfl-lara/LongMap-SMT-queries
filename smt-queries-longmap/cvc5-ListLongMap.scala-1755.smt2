; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32128 () Bool)

(assert start!32128)

(declare-fun b!320202 () Bool)

(declare-fun e!198742 () Bool)

(assert (=> b!320202 (= e!198742 false)))

(declare-datatypes ((array!16363 0))(
  ( (array!16364 (arr!7742 (Array (_ BitVec 32) (_ BitVec 64))) (size!8094 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16363)

(declare-fun k!2497 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2873 0))(
  ( (MissingZero!2873 (index!13668 (_ BitVec 32))) (Found!2873 (index!13669 (_ BitVec 32))) (Intermediate!2873 (undefined!3685 Bool) (index!13670 (_ BitVec 32)) (x!31942 (_ BitVec 32))) (Undefined!2873) (MissingVacant!2873 (index!13671 (_ BitVec 32))) )
))
(declare-fun lt!155997 () SeekEntryResult!2873)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16363 (_ BitVec 32)) SeekEntryResult!2873)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!320202 (= lt!155997 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777))))

(declare-fun b!320203 () Bool)

(declare-fun res!174449 () Bool)

(assert (=> b!320203 (=> (not res!174449) (not e!198742))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!320203 (= res!174449 (validKeyInArray!0 k!2497))))

(declare-fun b!320204 () Bool)

(declare-fun res!174450 () Bool)

(assert (=> b!320204 (=> (not res!174450) (not e!198742))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16363 (_ BitVec 32)) SeekEntryResult!2873)

(assert (=> b!320204 (= res!174450 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2873 i!1250)))))

(declare-fun b!320205 () Bool)

(declare-fun res!174447 () Bool)

(assert (=> b!320205 (=> (not res!174447) (not e!198742))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16363 (_ BitVec 32)) Bool)

(assert (=> b!320205 (= res!174447 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun res!174445 () Bool)

(assert (=> start!32128 (=> (not res!174445) (not e!198742))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32128 (= res!174445 (validMask!0 mask!3777))))

(assert (=> start!32128 e!198742))

(assert (=> start!32128 true))

(declare-fun array_inv!5705 (array!16363) Bool)

(assert (=> start!32128 (array_inv!5705 a!3305)))

(declare-fun b!320206 () Bool)

(declare-fun res!174446 () Bool)

(assert (=> b!320206 (=> (not res!174446) (not e!198742))))

(declare-fun arrayContainsKey!0 (array!16363 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!320206 (= res!174446 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!320207 () Bool)

(declare-fun res!174448 () Bool)

(assert (=> b!320207 (=> (not res!174448) (not e!198742))))

(assert (=> b!320207 (= res!174448 (and (= (size!8094 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8094 a!3305))))))

(assert (= (and start!32128 res!174445) b!320207))

(assert (= (and b!320207 res!174448) b!320203))

(assert (= (and b!320203 res!174449) b!320206))

(assert (= (and b!320206 res!174446) b!320204))

(assert (= (and b!320204 res!174450) b!320205))

(assert (= (and b!320205 res!174447) b!320202))

(declare-fun m!328613 () Bool)

(assert (=> start!32128 m!328613))

(declare-fun m!328615 () Bool)

(assert (=> start!32128 m!328615))

(declare-fun m!328617 () Bool)

(assert (=> b!320204 m!328617))

(declare-fun m!328619 () Bool)

(assert (=> b!320202 m!328619))

(assert (=> b!320202 m!328619))

(declare-fun m!328621 () Bool)

(assert (=> b!320202 m!328621))

(declare-fun m!328623 () Bool)

(assert (=> b!320203 m!328623))

(declare-fun m!328625 () Bool)

(assert (=> b!320206 m!328625))

(declare-fun m!328627 () Bool)

(assert (=> b!320205 m!328627))

(push 1)

(assert (not b!320204))

(assert (not b!320205))

(assert (not start!32128))

(assert (not b!320206))

(assert (not b!320203))

(assert (not b!320202))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

