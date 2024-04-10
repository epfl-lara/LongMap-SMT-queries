; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44070 () Bool)

(assert start!44070)

(declare-fun b!485737 () Bool)

(declare-fun res!289340 () Bool)

(declare-fun e!285975 () Bool)

(assert (=> b!485737 (=> (not res!289340) (not e!285975))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!485737 (= res!289340 (validKeyInArray!0 k!2280))))

(declare-fun b!485738 () Bool)

(declare-fun res!289339 () Bool)

(assert (=> b!485738 (=> (not res!289339) (not e!285975))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31438 0))(
  ( (array!31439 (arr!15117 (Array (_ BitVec 32) (_ BitVec 64))) (size!15481 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31438)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!485738 (= res!289339 (and (= (size!15481 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15481 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15481 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!485739 () Bool)

(declare-fun res!289343 () Bool)

(assert (=> b!485739 (=> (not res!289343) (not e!285975))))

(declare-fun arrayContainsKey!0 (array!31438 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!485739 (= res!289343 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!485740 () Bool)

(declare-fun res!289341 () Bool)

(assert (=> b!485740 (=> (not res!289341) (not e!285975))))

(assert (=> b!485740 (= res!289341 (validKeyInArray!0 (select (arr!15117 a!3235) j!176)))))

(declare-fun res!289342 () Bool)

(assert (=> start!44070 (=> (not res!289342) (not e!285975))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44070 (= res!289342 (validMask!0 mask!3524))))

(assert (=> start!44070 e!285975))

(assert (=> start!44070 true))

(declare-fun array_inv!10913 (array!31438) Bool)

(assert (=> start!44070 (array_inv!10913 a!3235)))

(declare-fun b!485741 () Bool)

(assert (=> b!485741 (= e!285975 false)))

(declare-datatypes ((SeekEntryResult!3584 0))(
  ( (MissingZero!3584 (index!16515 (_ BitVec 32))) (Found!3584 (index!16516 (_ BitVec 32))) (Intermediate!3584 (undefined!4396 Bool) (index!16517 (_ BitVec 32)) (x!45660 (_ BitVec 32))) (Undefined!3584) (MissingVacant!3584 (index!16518 (_ BitVec 32))) )
))
(declare-fun lt!219559 () SeekEntryResult!3584)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31438 (_ BitVec 32)) SeekEntryResult!3584)

(assert (=> b!485741 (= lt!219559 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(assert (= (and start!44070 res!289342) b!485738))

(assert (= (and b!485738 res!289339) b!485740))

(assert (= (and b!485740 res!289341) b!485737))

(assert (= (and b!485737 res!289340) b!485739))

(assert (= (and b!485739 res!289343) b!485741))

(declare-fun m!465813 () Bool)

(assert (=> b!485741 m!465813))

(declare-fun m!465815 () Bool)

(assert (=> b!485739 m!465815))

(declare-fun m!465817 () Bool)

(assert (=> b!485737 m!465817))

(declare-fun m!465819 () Bool)

(assert (=> start!44070 m!465819))

(declare-fun m!465821 () Bool)

(assert (=> start!44070 m!465821))

(declare-fun m!465823 () Bool)

(assert (=> b!485740 m!465823))

(assert (=> b!485740 m!465823))

(declare-fun m!465825 () Bool)

(assert (=> b!485740 m!465825))

(push 1)

(assert (not b!485737))

(assert (not b!485739))

(assert (not b!485740))

(assert (not start!44070))

(assert (not b!485741))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

