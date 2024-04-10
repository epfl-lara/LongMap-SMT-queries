; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44104 () Bool)

(assert start!44104)

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31472 0))(
  ( (array!31473 (arr!15134 (Array (_ BitVec 32) (_ BitVec 64))) (size!15498 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31472)

(declare-fun b!485992 () Bool)

(declare-fun e!286076 () Bool)

(declare-datatypes ((SeekEntryResult!3601 0))(
  ( (MissingZero!3601 (index!16583 (_ BitVec 32))) (Found!3601 (index!16584 (_ BitVec 32))) (Intermediate!3601 (undefined!4413 Bool) (index!16585 (_ BitVec 32)) (x!45717 (_ BitVec 32))) (Undefined!3601) (MissingVacant!3601 (index!16586 (_ BitVec 32))) )
))
(declare-fun lt!219610 () SeekEntryResult!3601)

(assert (=> b!485992 (= e!286076 (and (or (= lt!219610 (MissingZero!3601 i!1204)) (= lt!219610 (MissingVacant!3601 i!1204))) (bvsgt #b00000000000000000000000000000000 (size!15498 a!3235))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31472 (_ BitVec 32)) SeekEntryResult!3601)

(assert (=> b!485992 (= lt!219610 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!485993 () Bool)

(declare-fun res!289597 () Bool)

(assert (=> b!485993 (=> (not res!289597) (not e!286076))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!485993 (= res!289597 (validKeyInArray!0 (select (arr!15134 a!3235) j!176)))))

(declare-fun b!485994 () Bool)

(declare-fun res!289595 () Bool)

(assert (=> b!485994 (=> (not res!289595) (not e!286076))))

(assert (=> b!485994 (= res!289595 (validKeyInArray!0 k!2280))))

(declare-fun b!485995 () Bool)

(declare-fun res!289594 () Bool)

(assert (=> b!485995 (=> (not res!289594) (not e!286076))))

(declare-fun arrayContainsKey!0 (array!31472 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!485995 (= res!289594 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!485996 () Bool)

(declare-fun res!289598 () Bool)

(assert (=> b!485996 (=> (not res!289598) (not e!286076))))

(assert (=> b!485996 (= res!289598 (and (= (size!15498 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15498 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15498 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!289596 () Bool)

(assert (=> start!44104 (=> (not res!289596) (not e!286076))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44104 (= res!289596 (validMask!0 mask!3524))))

(assert (=> start!44104 e!286076))

(assert (=> start!44104 true))

(declare-fun array_inv!10930 (array!31472) Bool)

(assert (=> start!44104 (array_inv!10930 a!3235)))

(assert (= (and start!44104 res!289596) b!485996))

(assert (= (and b!485996 res!289598) b!485993))

(assert (= (and b!485993 res!289597) b!485994))

(assert (= (and b!485994 res!289595) b!485995))

(assert (= (and b!485995 res!289594) b!485992))

(declare-fun m!466051 () Bool)

(assert (=> start!44104 m!466051))

(declare-fun m!466053 () Bool)

(assert (=> start!44104 m!466053))

(declare-fun m!466055 () Bool)

(assert (=> b!485993 m!466055))

(assert (=> b!485993 m!466055))

(declare-fun m!466057 () Bool)

(assert (=> b!485993 m!466057))

(declare-fun m!466059 () Bool)

(assert (=> b!485992 m!466059))

(declare-fun m!466061 () Bool)

(assert (=> b!485994 m!466061))

(declare-fun m!466063 () Bool)

(assert (=> b!485995 m!466063))

(push 1)

(assert (not b!485995))

(assert (not b!485994))

(assert (not b!485993))

(assert (not b!485992))

(assert (not start!44104))

(check-sat)

