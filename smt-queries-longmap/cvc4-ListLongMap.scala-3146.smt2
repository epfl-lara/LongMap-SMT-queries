; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44302 () Bool)

(assert start!44302)

(declare-fun b!487192 () Bool)

(declare-fun res!290582 () Bool)

(declare-fun e!286686 () Bool)

(assert (=> b!487192 (=> (not res!290582) (not e!286686))))

(declare-datatypes ((array!31553 0))(
  ( (array!31554 (arr!15170 (Array (_ BitVec 32) (_ BitVec 64))) (size!15534 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31553)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31553 (_ BitVec 32)) Bool)

(assert (=> b!487192 (= res!290582 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!487193 () Bool)

(declare-fun res!290581 () Bool)

(declare-fun e!286684 () Bool)

(assert (=> b!487193 (=> (not res!290581) (not e!286684))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31553 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!487193 (= res!290581 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!487194 () Bool)

(declare-fun res!290585 () Bool)

(assert (=> b!487194 (=> (not res!290585) (not e!286684))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!487194 (= res!290585 (validKeyInArray!0 k!2280))))

(declare-fun b!487195 () Bool)

(declare-fun res!290584 () Bool)

(assert (=> b!487195 (=> (not res!290584) (not e!286684))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!487195 (= res!290584 (and (= (size!15534 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15534 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15534 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!487196 () Bool)

(assert (=> b!487196 (= e!286686 (not true))))

(assert (=> b!487196 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14220 0))(
  ( (Unit!14221) )
))
(declare-fun lt!219963 () Unit!14220)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31553 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14220)

(assert (=> b!487196 (= lt!219963 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!487197 () Bool)

(assert (=> b!487197 (= e!286684 e!286686)))

(declare-fun res!290583 () Bool)

(assert (=> b!487197 (=> (not res!290583) (not e!286686))))

(declare-datatypes ((SeekEntryResult!3637 0))(
  ( (MissingZero!3637 (index!16727 (_ BitVec 32))) (Found!3637 (index!16728 (_ BitVec 32))) (Intermediate!3637 (undefined!4449 Bool) (index!16729 (_ BitVec 32)) (x!45849 (_ BitVec 32))) (Undefined!3637) (MissingVacant!3637 (index!16730 (_ BitVec 32))) )
))
(declare-fun lt!219964 () SeekEntryResult!3637)

(assert (=> b!487197 (= res!290583 (or (= lt!219964 (MissingZero!3637 i!1204)) (= lt!219964 (MissingVacant!3637 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31553 (_ BitVec 32)) SeekEntryResult!3637)

(assert (=> b!487197 (= lt!219964 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!290579 () Bool)

(assert (=> start!44302 (=> (not res!290579) (not e!286684))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44302 (= res!290579 (validMask!0 mask!3524))))

(assert (=> start!44302 e!286684))

(assert (=> start!44302 true))

(declare-fun array_inv!10966 (array!31553) Bool)

(assert (=> start!44302 (array_inv!10966 a!3235)))

(declare-fun b!487198 () Bool)

(declare-fun res!290578 () Bool)

(assert (=> b!487198 (=> (not res!290578) (not e!286686))))

(declare-datatypes ((List!9328 0))(
  ( (Nil!9325) (Cons!9324 (h!10180 (_ BitVec 64)) (t!15556 List!9328)) )
))
(declare-fun arrayNoDuplicates!0 (array!31553 (_ BitVec 32) List!9328) Bool)

(assert (=> b!487198 (= res!290578 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9325))))

(declare-fun b!487199 () Bool)

(declare-fun res!290580 () Bool)

(assert (=> b!487199 (=> (not res!290580) (not e!286684))))

(assert (=> b!487199 (= res!290580 (validKeyInArray!0 (select (arr!15170 a!3235) j!176)))))

(assert (= (and start!44302 res!290579) b!487195))

(assert (= (and b!487195 res!290584) b!487199))

(assert (= (and b!487199 res!290580) b!487194))

(assert (= (and b!487194 res!290585) b!487193))

(assert (= (and b!487193 res!290581) b!487197))

(assert (= (and b!487197 res!290583) b!487192))

(assert (= (and b!487192 res!290582) b!487198))

(assert (= (and b!487198 res!290578) b!487196))

(declare-fun m!467033 () Bool)

(assert (=> b!487197 m!467033))

(declare-fun m!467035 () Bool)

(assert (=> b!487199 m!467035))

(assert (=> b!487199 m!467035))

(declare-fun m!467037 () Bool)

(assert (=> b!487199 m!467037))

(declare-fun m!467039 () Bool)

(assert (=> b!487192 m!467039))

(declare-fun m!467041 () Bool)

(assert (=> b!487194 m!467041))

(declare-fun m!467043 () Bool)

(assert (=> b!487196 m!467043))

(declare-fun m!467045 () Bool)

(assert (=> b!487196 m!467045))

(declare-fun m!467047 () Bool)

(assert (=> b!487193 m!467047))

(declare-fun m!467049 () Bool)

(assert (=> start!44302 m!467049))

(declare-fun m!467051 () Bool)

(assert (=> start!44302 m!467051))

(declare-fun m!467053 () Bool)

(assert (=> b!487198 m!467053))

(push 1)

(assert (not b!487196))

(assert (not start!44302))

(assert (not b!487197))

(assert (not b!487198))

