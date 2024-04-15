; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44050 () Bool)

(assert start!44050)

(declare-fun res!289144 () Bool)

(declare-fun e!285777 () Bool)

(assert (=> start!44050 (=> (not res!289144) (not e!285777))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44050 (= res!289144 (validMask!0 mask!3524))))

(assert (=> start!44050 e!285777))

(assert (=> start!44050 true))

(declare-datatypes ((array!31428 0))(
  ( (array!31429 (arr!15112 (Array (_ BitVec 32) (_ BitVec 64))) (size!15477 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31428)

(declare-fun array_inv!10995 (array!31428) Bool)

(assert (=> start!44050 (array_inv!10995 a!3235)))

(declare-fun b!485397 () Bool)

(declare-fun res!289145 () Bool)

(assert (=> b!485397 (=> (not res!289145) (not e!285777))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31428 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!485397 (= res!289145 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!485398 () Bool)

(declare-fun res!289142 () Bool)

(assert (=> b!485398 (=> (not res!289142) (not e!285777))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!485398 (= res!289142 (validKeyInArray!0 k!2280))))

(declare-fun b!485399 () Bool)

(assert (=> b!485399 (= e!285777 false)))

(declare-datatypes ((SeekEntryResult!3576 0))(
  ( (MissingZero!3576 (index!16483 (_ BitVec 32))) (Found!3576 (index!16484 (_ BitVec 32))) (Intermediate!3576 (undefined!4388 Bool) (index!16485 (_ BitVec 32)) (x!45631 (_ BitVec 32))) (Undefined!3576) (MissingVacant!3576 (index!16486 (_ BitVec 32))) )
))
(declare-fun lt!219322 () SeekEntryResult!3576)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31428 (_ BitVec 32)) SeekEntryResult!3576)

(assert (=> b!485399 (= lt!219322 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!485400 () Bool)

(declare-fun res!289143 () Bool)

(assert (=> b!485400 (=> (not res!289143) (not e!285777))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!485400 (= res!289143 (validKeyInArray!0 (select (arr!15112 a!3235) j!176)))))

(declare-fun b!485401 () Bool)

(declare-fun res!289141 () Bool)

(assert (=> b!485401 (=> (not res!289141) (not e!285777))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!485401 (= res!289141 (and (= (size!15477 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15477 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15477 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!44050 res!289144) b!485401))

(assert (= (and b!485401 res!289141) b!485400))

(assert (= (and b!485400 res!289143) b!485398))

(assert (= (and b!485398 res!289142) b!485397))

(assert (= (and b!485397 res!289145) b!485399))

(declare-fun m!465025 () Bool)

(assert (=> b!485399 m!465025))

(declare-fun m!465027 () Bool)

(assert (=> b!485398 m!465027))

(declare-fun m!465029 () Bool)

(assert (=> b!485397 m!465029))

(declare-fun m!465031 () Bool)

(assert (=> b!485400 m!465031))

(assert (=> b!485400 m!465031))

(declare-fun m!465033 () Bool)

(assert (=> b!485400 m!465033))

(declare-fun m!465035 () Bool)

(assert (=> start!44050 m!465035))

(declare-fun m!465037 () Bool)

(assert (=> start!44050 m!465037))

(push 1)

(assert (not b!485399))

(assert (not b!485400))

(assert (not b!485398))

(assert (not b!485397))

(assert (not start!44050))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

