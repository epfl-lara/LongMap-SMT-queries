; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44094 () Bool)

(assert start!44094)

(declare-fun b!485917 () Bool)

(declare-fun e!286047 () Bool)

(assert (=> b!485917 (= e!286047 false)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31462 0))(
  ( (array!31463 (arr!15129 (Array (_ BitVec 32) (_ BitVec 64))) (size!15493 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31462)

(declare-datatypes ((SeekEntryResult!3596 0))(
  ( (MissingZero!3596 (index!16563 (_ BitVec 32))) (Found!3596 (index!16564 (_ BitVec 32))) (Intermediate!3596 (undefined!4408 Bool) (index!16565 (_ BitVec 32)) (x!45704 (_ BitVec 32))) (Undefined!3596) (MissingVacant!3596 (index!16566 (_ BitVec 32))) )
))
(declare-fun lt!219595 () SeekEntryResult!3596)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31462 (_ BitVec 32)) SeekEntryResult!3596)

(assert (=> b!485917 (= lt!219595 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!485918 () Bool)

(declare-fun res!289519 () Bool)

(assert (=> b!485918 (=> (not res!289519) (not e!286047))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!485918 (= res!289519 (validKeyInArray!0 (select (arr!15129 a!3235) j!176)))))

(declare-fun b!485919 () Bool)

(declare-fun res!289522 () Bool)

(assert (=> b!485919 (=> (not res!289522) (not e!286047))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!485919 (= res!289522 (and (= (size!15493 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15493 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15493 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!485920 () Bool)

(declare-fun res!289523 () Bool)

(assert (=> b!485920 (=> (not res!289523) (not e!286047))))

(declare-fun arrayContainsKey!0 (array!31462 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!485920 (= res!289523 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!289521 () Bool)

(assert (=> start!44094 (=> (not res!289521) (not e!286047))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44094 (= res!289521 (validMask!0 mask!3524))))

(assert (=> start!44094 e!286047))

(assert (=> start!44094 true))

(declare-fun array_inv!10925 (array!31462) Bool)

(assert (=> start!44094 (array_inv!10925 a!3235)))

(declare-fun b!485921 () Bool)

(declare-fun res!289520 () Bool)

(assert (=> b!485921 (=> (not res!289520) (not e!286047))))

(assert (=> b!485921 (= res!289520 (validKeyInArray!0 k!2280))))

(assert (= (and start!44094 res!289521) b!485919))

(assert (= (and b!485919 res!289522) b!485918))

(assert (= (and b!485918 res!289519) b!485921))

(assert (= (and b!485921 res!289520) b!485920))

(assert (= (and b!485920 res!289523) b!485917))

(declare-fun m!465981 () Bool)

(assert (=> start!44094 m!465981))

(declare-fun m!465983 () Bool)

(assert (=> start!44094 m!465983))

(declare-fun m!465985 () Bool)

(assert (=> b!485917 m!465985))

(declare-fun m!465987 () Bool)

(assert (=> b!485918 m!465987))

(assert (=> b!485918 m!465987))

(declare-fun m!465989 () Bool)

(assert (=> b!485918 m!465989))

(declare-fun m!465991 () Bool)

(assert (=> b!485920 m!465991))

(declare-fun m!465993 () Bool)

(assert (=> b!485921 m!465993))

(push 1)

(assert (not b!485921))

(assert (not b!485918))

(assert (not start!44094))

(assert (not b!485920))

(assert (not b!485917))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

