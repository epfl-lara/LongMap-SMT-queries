; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32140 () Bool)

(assert start!32140)

(declare-fun b!320319 () Bool)

(declare-fun res!174567 () Bool)

(declare-fun e!198778 () Bool)

(assert (=> b!320319 (=> (not res!174567) (not e!198778))))

(declare-datatypes ((array!16375 0))(
  ( (array!16376 (arr!7748 (Array (_ BitVec 32) (_ BitVec 64))) (size!8100 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16375)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!320319 (= res!174567 (and (= (size!8100 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8100 a!3305))))))

(declare-fun b!320320 () Bool)

(declare-fun res!174562 () Bool)

(assert (=> b!320320 (=> (not res!174562) (not e!198778))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16375 (_ BitVec 32)) Bool)

(assert (=> b!320320 (= res!174562 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun res!174564 () Bool)

(assert (=> start!32140 (=> (not res!174564) (not e!198778))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32140 (= res!174564 (validMask!0 mask!3777))))

(assert (=> start!32140 e!198778))

(assert (=> start!32140 true))

(declare-fun array_inv!5711 (array!16375) Bool)

(assert (=> start!32140 (array_inv!5711 a!3305)))

(declare-fun b!320321 () Bool)

(declare-fun res!174565 () Bool)

(assert (=> b!320321 (=> (not res!174565) (not e!198778))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2879 0))(
  ( (MissingZero!2879 (index!13692 (_ BitVec 32))) (Found!2879 (index!13693 (_ BitVec 32))) (Intermediate!2879 (undefined!3691 Bool) (index!13694 (_ BitVec 32)) (x!31964 (_ BitVec 32))) (Undefined!2879) (MissingVacant!2879 (index!13695 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16375 (_ BitVec 32)) SeekEntryResult!2879)

(assert (=> b!320321 (= res!174565 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2879 i!1250)))))

(declare-fun b!320322 () Bool)

(assert (=> b!320322 (= e!198778 false)))

(declare-fun lt!156006 () SeekEntryResult!2879)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16375 (_ BitVec 32)) SeekEntryResult!2879)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!320322 (= lt!156006 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777))))

(declare-fun b!320323 () Bool)

(declare-fun res!174566 () Bool)

(assert (=> b!320323 (=> (not res!174566) (not e!198778))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!320323 (= res!174566 (validKeyInArray!0 k!2497))))

(declare-fun b!320324 () Bool)

(declare-fun res!174563 () Bool)

(assert (=> b!320324 (=> (not res!174563) (not e!198778))))

(declare-fun arrayContainsKey!0 (array!16375 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!320324 (= res!174563 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(assert (= (and start!32140 res!174564) b!320319))

(assert (= (and b!320319 res!174567) b!320323))

(assert (= (and b!320323 res!174566) b!320324))

(assert (= (and b!320324 res!174563) b!320321))

(assert (= (and b!320321 res!174565) b!320320))

(assert (= (and b!320320 res!174562) b!320322))

(declare-fun m!328715 () Bool)

(assert (=> b!320323 m!328715))

(declare-fun m!328717 () Bool)

(assert (=> b!320320 m!328717))

(declare-fun m!328719 () Bool)

(assert (=> start!32140 m!328719))

(declare-fun m!328721 () Bool)

(assert (=> start!32140 m!328721))

(declare-fun m!328723 () Bool)

(assert (=> b!320324 m!328723))

(declare-fun m!328725 () Bool)

(assert (=> b!320321 m!328725))

(declare-fun m!328727 () Bool)

(assert (=> b!320322 m!328727))

(assert (=> b!320322 m!328727))

(declare-fun m!328729 () Bool)

(assert (=> b!320322 m!328729))

(push 1)

(assert (not start!32140))

(assert (not b!320320))

(assert (not b!320323))

(assert (not b!320321))

(assert (not b!320324))

(assert (not b!320322))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

