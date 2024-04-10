; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63698 () Bool)

(assert start!63698)

(declare-fun b!717005 () Bool)

(declare-fun res!479794 () Bool)

(declare-fun e!402592 () Bool)

(assert (=> b!717005 (=> (not res!479794) (not e!402592))))

(declare-datatypes ((array!40594 0))(
  ( (array!40595 (arr!19430 (Array (_ BitVec 32) (_ BitVec 64))) (size!19851 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40594)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40594 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!717005 (= res!479794 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun res!479791 () Bool)

(assert (=> start!63698 (=> (not res!479791) (not e!402592))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63698 (= res!479791 (validMask!0 mask!3328))))

(assert (=> start!63698 e!402592))

(declare-fun array_inv!15226 (array!40594) Bool)

(assert (=> start!63698 (array_inv!15226 a!3186)))

(assert (=> start!63698 true))

(declare-fun b!717006 () Bool)

(declare-fun res!479793 () Bool)

(assert (=> b!717006 (=> (not res!479793) (not e!402592))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!717006 (= res!479793 (and (= (size!19851 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19851 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19851 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!717007 () Bool)

(declare-fun res!479795 () Bool)

(assert (=> b!717007 (=> (not res!479795) (not e!402592))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!717007 (= res!479795 (validKeyInArray!0 k!2102))))

(declare-fun b!717008 () Bool)

(assert (=> b!717008 (= e!402592 false)))

(declare-datatypes ((SeekEntryResult!7030 0))(
  ( (MissingZero!7030 (index!30488 (_ BitVec 32))) (Found!7030 (index!30489 (_ BitVec 32))) (Intermediate!7030 (undefined!7842 Bool) (index!30490 (_ BitVec 32)) (x!61514 (_ BitVec 32))) (Undefined!7030) (MissingVacant!7030 (index!30491 (_ BitVec 32))) )
))
(declare-fun lt!318983 () SeekEntryResult!7030)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40594 (_ BitVec 32)) SeekEntryResult!7030)

(assert (=> b!717008 (= lt!318983 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!717009 () Bool)

(declare-fun res!479792 () Bool)

(assert (=> b!717009 (=> (not res!479792) (not e!402592))))

(assert (=> b!717009 (= res!479792 (validKeyInArray!0 (select (arr!19430 a!3186) j!159)))))

(assert (= (and start!63698 res!479791) b!717006))

(assert (= (and b!717006 res!479793) b!717009))

(assert (= (and b!717009 res!479792) b!717007))

(assert (= (and b!717007 res!479795) b!717005))

(assert (= (and b!717005 res!479794) b!717008))

(declare-fun m!672971 () Bool)

(assert (=> start!63698 m!672971))

(declare-fun m!672973 () Bool)

(assert (=> start!63698 m!672973))

(declare-fun m!672975 () Bool)

(assert (=> b!717009 m!672975))

(assert (=> b!717009 m!672975))

(declare-fun m!672977 () Bool)

(assert (=> b!717009 m!672977))

(declare-fun m!672979 () Bool)

(assert (=> b!717008 m!672979))

(declare-fun m!672981 () Bool)

(assert (=> b!717005 m!672981))

(declare-fun m!672983 () Bool)

(assert (=> b!717007 m!672983))

(push 1)

(assert (not start!63698))

(assert (not b!717008))

(assert (not b!717005))

(assert (not b!717007))

(assert (not b!717009))

(check-sat)

(pop 1)

