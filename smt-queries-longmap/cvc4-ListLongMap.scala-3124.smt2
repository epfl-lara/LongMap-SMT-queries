; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44032 () Bool)

(assert start!44032)

(declare-fun b!485543 () Bool)

(declare-fun res!289148 () Bool)

(declare-fun e!285896 () Bool)

(assert (=> b!485543 (=> (not res!289148) (not e!285896))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31411 0))(
  ( (array!31412 (arr!15104 (Array (_ BitVec 32) (_ BitVec 64))) (size!15468 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31411)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!485543 (= res!289148 (and (= (size!15468 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15468 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15468 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!485546 () Bool)

(assert (=> b!485546 (= e!285896 (bvsge #b00000000000000000000000000000000 (size!15468 a!3235)))))

(declare-fun res!289146 () Bool)

(assert (=> start!44032 (=> (not res!289146) (not e!285896))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44032 (= res!289146 (validMask!0 mask!3524))))

(assert (=> start!44032 e!285896))

(assert (=> start!44032 true))

(declare-fun array_inv!10900 (array!31411) Bool)

(assert (=> start!44032 (array_inv!10900 a!3235)))

(declare-fun b!485545 () Bool)

(declare-fun res!289145 () Bool)

(assert (=> b!485545 (=> (not res!289145) (not e!285896))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!485545 (= res!289145 (validKeyInArray!0 k!2280))))

(declare-fun b!485544 () Bool)

(declare-fun res!289147 () Bool)

(assert (=> b!485544 (=> (not res!289147) (not e!285896))))

(assert (=> b!485544 (= res!289147 (validKeyInArray!0 (select (arr!15104 a!3235) j!176)))))

(assert (= (and start!44032 res!289146) b!485543))

(assert (= (and b!485543 res!289148) b!485544))

(assert (= (and b!485544 res!289147) b!485545))

(assert (= (and b!485545 res!289145) b!485546))

(declare-fun m!465653 () Bool)

(assert (=> start!44032 m!465653))

(declare-fun m!465655 () Bool)

(assert (=> start!44032 m!465655))

(declare-fun m!465657 () Bool)

(assert (=> b!485545 m!465657))

(declare-fun m!465659 () Bool)

(assert (=> b!485544 m!465659))

(assert (=> b!485544 m!465659))

(declare-fun m!465661 () Bool)

(assert (=> b!485544 m!465661))

(push 1)

(assert (not b!485545))

(assert (not b!485544))

(assert (not start!44032))

(check-sat)

(pop 1)

(push 1)

(check-sat)

