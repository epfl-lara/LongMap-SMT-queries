; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44370 () Bool)

(assert start!44370)

(declare-fun b!487635 () Bool)

(declare-fun res!290911 () Bool)

(declare-fun e!286922 () Bool)

(assert (=> b!487635 (=> (not res!290911) (not e!286922))))

(declare-datatypes ((array!31576 0))(
  ( (array!31577 (arr!15180 (Array (_ BitVec 32) (_ BitVec 64))) (size!15544 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31576)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31576 (_ BitVec 32)) Bool)

(assert (=> b!487635 (= res!290911 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!487636 () Bool)

(declare-fun e!286923 () Bool)

(assert (=> b!487636 (= e!286923 e!286922)))

(declare-fun res!290910 () Bool)

(assert (=> b!487636 (=> (not res!290910) (not e!286922))))

(declare-datatypes ((SeekEntryResult!3647 0))(
  ( (MissingZero!3647 (index!16767 (_ BitVec 32))) (Found!3647 (index!16768 (_ BitVec 32))) (Intermediate!3647 (undefined!4459 Bool) (index!16769 (_ BitVec 32)) (x!45891 (_ BitVec 32))) (Undefined!3647) (MissingVacant!3647 (index!16770 (_ BitVec 32))) )
))
(declare-fun lt!220108 () SeekEntryResult!3647)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!487636 (= res!290910 (or (= lt!220108 (MissingZero!3647 i!1204)) (= lt!220108 (MissingVacant!3647 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31576 (_ BitVec 32)) SeekEntryResult!3647)

(assert (=> b!487636 (= lt!220108 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!290913 () Bool)

(assert (=> start!44370 (=> (not res!290913) (not e!286923))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44370 (= res!290913 (validMask!0 mask!3524))))

(assert (=> start!44370 e!286923))

(assert (=> start!44370 true))

(declare-fun array_inv!10976 (array!31576) Bool)

(assert (=> start!44370 (array_inv!10976 a!3235)))

(declare-fun b!487637 () Bool)

(declare-fun res!290907 () Bool)

(assert (=> b!487637 (=> (not res!290907) (not e!286923))))

(declare-fun arrayContainsKey!0 (array!31576 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!487637 (= res!290907 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!487638 () Bool)

(declare-fun e!286921 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!487638 (= e!286921 (= (seekEntryOrOpen!0 (select (arr!15180 a!3235) j!176) a!3235 mask!3524) (Found!3647 j!176)))))

(declare-fun b!487639 () Bool)

(declare-fun res!290914 () Bool)

(assert (=> b!487639 (=> (not res!290914) (not e!286922))))

(declare-datatypes ((List!9338 0))(
  ( (Nil!9335) (Cons!9334 (h!10190 (_ BitVec 64)) (t!15566 List!9338)) )
))
(declare-fun arrayNoDuplicates!0 (array!31576 (_ BitVec 32) List!9338) Bool)

(assert (=> b!487639 (= res!290914 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9335))))

(declare-fun b!487640 () Bool)

(declare-fun res!290908 () Bool)

(assert (=> b!487640 (=> (not res!290908) (not e!286923))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!487640 (= res!290908 (validKeyInArray!0 (select (arr!15180 a!3235) j!176)))))

(declare-fun b!487641 () Bool)

(declare-fun res!290915 () Bool)

(assert (=> b!487641 (=> (not res!290915) (not e!286923))))

(assert (=> b!487641 (= res!290915 (validKeyInArray!0 k!2280))))

(declare-fun b!487642 () Bool)

(declare-fun res!290909 () Bool)

(assert (=> b!487642 (=> (not res!290909) (not e!286923))))

(assert (=> b!487642 (= res!290909 (and (= (size!15544 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15544 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15544 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!487643 () Bool)

(assert (=> b!487643 (= e!286922 (not true))))

(declare-fun lt!220107 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!487643 (= lt!220107 (toIndex!0 (select (arr!15180 a!3235) j!176) mask!3524))))

(assert (=> b!487643 e!286921))

(declare-fun res!290912 () Bool)

(assert (=> b!487643 (=> (not res!290912) (not e!286921))))

(assert (=> b!487643 (= res!290912 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14240 0))(
  ( (Unit!14241) )
))
(declare-fun lt!220106 () Unit!14240)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31576 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14240)

(assert (=> b!487643 (= lt!220106 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!44370 res!290913) b!487642))

(assert (= (and b!487642 res!290909) b!487640))

(assert (= (and b!487640 res!290908) b!487641))

(assert (= (and b!487641 res!290915) b!487637))

(assert (= (and b!487637 res!290907) b!487636))

(assert (= (and b!487636 res!290910) b!487635))

(assert (= (and b!487635 res!290911) b!487639))

(assert (= (and b!487639 res!290914) b!487643))

(assert (= (and b!487643 res!290912) b!487638))

(declare-fun m!467427 () Bool)

(assert (=> b!487636 m!467427))

(declare-fun m!467429 () Bool)

(assert (=> b!487641 m!467429))

(declare-fun m!467431 () Bool)

(assert (=> b!487639 m!467431))

(declare-fun m!467433 () Bool)

(assert (=> b!487637 m!467433))

(declare-fun m!467435 () Bool)

(assert (=> b!487643 m!467435))

(assert (=> b!487643 m!467435))

(declare-fun m!467437 () Bool)

(assert (=> b!487643 m!467437))

(declare-fun m!467439 () Bool)

(assert (=> b!487643 m!467439))

(declare-fun m!467441 () Bool)

(assert (=> b!487643 m!467441))

(declare-fun m!467443 () Bool)

(assert (=> start!44370 m!467443))

(declare-fun m!467445 () Bool)

(assert (=> start!44370 m!467445))

(assert (=> b!487638 m!467435))

(assert (=> b!487638 m!467435))

(declare-fun m!467447 () Bool)

(assert (=> b!487638 m!467447))

(declare-fun m!467449 () Bool)

(assert (=> b!487635 m!467449))

(assert (=> b!487640 m!467435))

(assert (=> b!487640 m!467435))

(declare-fun m!467451 () Bool)

(assert (=> b!487640 m!467451))

(push 1)

