; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44100 () Bool)

(assert start!44100)

(declare-fun b!485962 () Bool)

(declare-fun res!289565 () Bool)

(declare-fun e!286064 () Bool)

(assert (=> b!485962 (=> (not res!289565) (not e!286064))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31468 0))(
  ( (array!31469 (arr!15132 (Array (_ BitVec 32) (_ BitVec 64))) (size!15496 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31468)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!485962 (= res!289565 (and (= (size!15496 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15496 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15496 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!485963 () Bool)

(declare-fun res!289568 () Bool)

(assert (=> b!485963 (=> (not res!289568) (not e!286064))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!485963 (= res!289568 (validKeyInArray!0 (select (arr!15132 a!3235) j!176)))))

(declare-fun b!485964 () Bool)

(declare-fun res!289564 () Bool)

(assert (=> b!485964 (=> (not res!289564) (not e!286064))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31468 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!485964 (= res!289564 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!485965 () Bool)

(declare-datatypes ((SeekEntryResult!3599 0))(
  ( (MissingZero!3599 (index!16575 (_ BitVec 32))) (Found!3599 (index!16576 (_ BitVec 32))) (Intermediate!3599 (undefined!4411 Bool) (index!16577 (_ BitVec 32)) (x!45715 (_ BitVec 32))) (Undefined!3599) (MissingVacant!3599 (index!16578 (_ BitVec 32))) )
))
(declare-fun lt!219604 () SeekEntryResult!3599)

(assert (=> b!485965 (= e!286064 (and (or (= lt!219604 (MissingZero!3599 i!1204)) (= lt!219604 (MissingVacant!3599 i!1204))) (bvsgt #b00000000000000000000000000000000 (size!15496 a!3235))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31468 (_ BitVec 32)) SeekEntryResult!3599)

(assert (=> b!485965 (= lt!219604 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!289566 () Bool)

(assert (=> start!44100 (=> (not res!289566) (not e!286064))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44100 (= res!289566 (validMask!0 mask!3524))))

(assert (=> start!44100 e!286064))

(assert (=> start!44100 true))

(declare-fun array_inv!10928 (array!31468) Bool)

(assert (=> start!44100 (array_inv!10928 a!3235)))

(declare-fun b!485966 () Bool)

(declare-fun res!289567 () Bool)

(assert (=> b!485966 (=> (not res!289567) (not e!286064))))

(assert (=> b!485966 (= res!289567 (validKeyInArray!0 k!2280))))

(assert (= (and start!44100 res!289566) b!485962))

(assert (= (and b!485962 res!289565) b!485963))

(assert (= (and b!485963 res!289568) b!485966))

(assert (= (and b!485966 res!289567) b!485964))

(assert (= (and b!485964 res!289564) b!485965))

(declare-fun m!466023 () Bool)

(assert (=> b!485964 m!466023))

(declare-fun m!466025 () Bool)

(assert (=> b!485965 m!466025))

(declare-fun m!466027 () Bool)

(assert (=> b!485966 m!466027))

(declare-fun m!466029 () Bool)

(assert (=> b!485963 m!466029))

(assert (=> b!485963 m!466029))

(declare-fun m!466031 () Bool)

(assert (=> b!485963 m!466031))

(declare-fun m!466033 () Bool)

(assert (=> start!44100 m!466033))

(declare-fun m!466035 () Bool)

(assert (=> start!44100 m!466035))

(push 1)

(assert (not b!485965))

(assert (not b!485964))

(assert (not b!485963))

(assert (not start!44100))

(assert (not b!485966))

(check-sat)

(pop 1)

(push 1)

(check-sat)

