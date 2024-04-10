; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44088 () Bool)

(assert start!44088)

(declare-fun b!485872 () Bool)

(declare-fun res!289478 () Bool)

(declare-fun e!286029 () Bool)

(assert (=> b!485872 (=> (not res!289478) (not e!286029))))

(declare-datatypes ((array!31456 0))(
  ( (array!31457 (arr!15126 (Array (_ BitVec 32) (_ BitVec 64))) (size!15490 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31456)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!485872 (= res!289478 (validKeyInArray!0 (select (arr!15126 a!3235) j!176)))))

(declare-fun b!485873 () Bool)

(assert (=> b!485873 (= e!286029 false)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3593 0))(
  ( (MissingZero!3593 (index!16551 (_ BitVec 32))) (Found!3593 (index!16552 (_ BitVec 32))) (Intermediate!3593 (undefined!4405 Bool) (index!16553 (_ BitVec 32)) (x!45693 (_ BitVec 32))) (Undefined!3593) (MissingVacant!3593 (index!16554 (_ BitVec 32))) )
))
(declare-fun lt!219586 () SeekEntryResult!3593)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31456 (_ BitVec 32)) SeekEntryResult!3593)

(assert (=> b!485873 (= lt!219586 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!485874 () Bool)

(declare-fun res!289477 () Bool)

(assert (=> b!485874 (=> (not res!289477) (not e!286029))))

(declare-fun arrayContainsKey!0 (array!31456 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!485874 (= res!289477 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!289474 () Bool)

(assert (=> start!44088 (=> (not res!289474) (not e!286029))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44088 (= res!289474 (validMask!0 mask!3524))))

(assert (=> start!44088 e!286029))

(assert (=> start!44088 true))

(declare-fun array_inv!10922 (array!31456) Bool)

(assert (=> start!44088 (array_inv!10922 a!3235)))

(declare-fun b!485875 () Bool)

(declare-fun res!289476 () Bool)

(assert (=> b!485875 (=> (not res!289476) (not e!286029))))

(assert (=> b!485875 (= res!289476 (validKeyInArray!0 k!2280))))

(declare-fun b!485876 () Bool)

(declare-fun res!289475 () Bool)

(assert (=> b!485876 (=> (not res!289475) (not e!286029))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!485876 (= res!289475 (and (= (size!15490 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15490 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15490 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!44088 res!289474) b!485876))

(assert (= (and b!485876 res!289475) b!485872))

(assert (= (and b!485872 res!289478) b!485875))

(assert (= (and b!485875 res!289476) b!485874))

(assert (= (and b!485874 res!289477) b!485873))

(declare-fun m!465939 () Bool)

(assert (=> b!485874 m!465939))

(declare-fun m!465941 () Bool)

(assert (=> start!44088 m!465941))

(declare-fun m!465943 () Bool)

(assert (=> start!44088 m!465943))

(declare-fun m!465945 () Bool)

(assert (=> b!485875 m!465945))

(declare-fun m!465947 () Bool)

(assert (=> b!485873 m!465947))

(declare-fun m!465949 () Bool)

(assert (=> b!485872 m!465949))

(assert (=> b!485872 m!465949))

(declare-fun m!465951 () Bool)

(assert (=> b!485872 m!465951))

(push 1)

(assert (not b!485875))

(assert (not b!485872))

(assert (not b!485874))

(assert (not b!485873))

(assert (not start!44088))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

