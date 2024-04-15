; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32196 () Bool)

(assert start!32196)

(declare-fun res!174718 () Bool)

(declare-fun e!198785 () Bool)

(assert (=> start!32196 (=> (not res!174718) (not e!198785))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32196 (= res!174718 (validMask!0 mask!3777))))

(assert (=> start!32196 e!198785))

(assert (=> start!32196 true))

(declare-datatypes ((array!16390 0))(
  ( (array!16391 (arr!7754 (Array (_ BitVec 32) (_ BitVec 64))) (size!8107 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16390)

(declare-fun array_inv!5726 (array!16390) Bool)

(assert (=> start!32196 (array_inv!5726 a!3305)))

(declare-fun b!320449 () Bool)

(declare-fun res!174720 () Bool)

(assert (=> b!320449 (=> (not res!174720) (not e!198785))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!320449 (= res!174720 (and (= (size!8107 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8107 a!3305))))))

(declare-fun b!320450 () Bool)

(declare-fun res!174717 () Bool)

(assert (=> b!320450 (=> (not res!174717) (not e!198785))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!320450 (= res!174717 (validKeyInArray!0 k!2497))))

(declare-fun b!320451 () Bool)

(declare-fun res!174715 () Bool)

(assert (=> b!320451 (=> (not res!174715) (not e!198785))))

(declare-datatypes ((SeekEntryResult!2884 0))(
  ( (MissingZero!2884 (index!13712 (_ BitVec 32))) (Found!2884 (index!13713 (_ BitVec 32))) (Intermediate!2884 (undefined!3696 Bool) (index!13714 (_ BitVec 32)) (x!31994 (_ BitVec 32))) (Undefined!2884) (MissingVacant!2884 (index!13715 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16390 (_ BitVec 32)) SeekEntryResult!2884)

(assert (=> b!320451 (= res!174715 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2884 i!1250)))))

(declare-fun b!320452 () Bool)

(declare-fun res!174719 () Bool)

(assert (=> b!320452 (=> (not res!174719) (not e!198785))))

(declare-fun arrayContainsKey!0 (array!16390 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!320452 (= res!174719 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!320453 () Bool)

(assert (=> b!320453 (= e!198785 false)))

(declare-fun lt!155876 () SeekEntryResult!2884)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16390 (_ BitVec 32)) SeekEntryResult!2884)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!320453 (= lt!155876 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777))))

(declare-fun b!320454 () Bool)

(declare-fun res!174716 () Bool)

(assert (=> b!320454 (=> (not res!174716) (not e!198785))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16390 (_ BitVec 32)) Bool)

(assert (=> b!320454 (= res!174716 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(assert (= (and start!32196 res!174718) b!320449))

(assert (= (and b!320449 res!174720) b!320450))

(assert (= (and b!320450 res!174717) b!320452))

(assert (= (and b!320452 res!174719) b!320451))

(assert (= (and b!320451 res!174715) b!320454))

(assert (= (and b!320454 res!174716) b!320453))

(declare-fun m!328269 () Bool)

(assert (=> b!320454 m!328269))

(declare-fun m!328271 () Bool)

(assert (=> b!320451 m!328271))

(declare-fun m!328273 () Bool)

(assert (=> b!320450 m!328273))

(declare-fun m!328275 () Bool)

(assert (=> start!32196 m!328275))

(declare-fun m!328277 () Bool)

(assert (=> start!32196 m!328277))

(declare-fun m!328279 () Bool)

(assert (=> b!320452 m!328279))

(declare-fun m!328281 () Bool)

(assert (=> b!320453 m!328281))

(assert (=> b!320453 m!328281))

(declare-fun m!328283 () Bool)

(assert (=> b!320453 m!328283))

(push 1)

(assert (not b!320453))

(assert (not b!320450))

(assert (not b!320451))

(assert (not start!32196))

(assert (not b!320452))

(assert (not b!320454))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

