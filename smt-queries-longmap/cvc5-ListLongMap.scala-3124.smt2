; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44028 () Bool)

(assert start!44028)

(declare-fun b!485521 () Bool)

(declare-fun res!289122 () Bool)

(declare-fun e!285884 () Bool)

(assert (=> b!485521 (=> (not res!289122) (not e!285884))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!485521 (= res!289122 (validKeyInArray!0 k!2280))))

(declare-fun b!485520 () Bool)

(declare-fun res!289121 () Bool)

(assert (=> b!485520 (=> (not res!289121) (not e!285884))))

(declare-datatypes ((array!31407 0))(
  ( (array!31408 (arr!15102 (Array (_ BitVec 32) (_ BitVec 64))) (size!15466 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31407)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!485520 (= res!289121 (validKeyInArray!0 (select (arr!15102 a!3235) j!176)))))

(declare-fun b!485522 () Bool)

(assert (=> b!485522 (= e!285884 (bvsge #b00000000000000000000000000000000 (size!15466 a!3235)))))

(declare-fun res!289123 () Bool)

(assert (=> start!44028 (=> (not res!289123) (not e!285884))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44028 (= res!289123 (validMask!0 mask!3524))))

(assert (=> start!44028 e!285884))

(assert (=> start!44028 true))

(declare-fun array_inv!10898 (array!31407) Bool)

(assert (=> start!44028 (array_inv!10898 a!3235)))

(declare-fun b!485519 () Bool)

(declare-fun res!289124 () Bool)

(assert (=> b!485519 (=> (not res!289124) (not e!285884))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!485519 (= res!289124 (and (= (size!15466 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15466 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15466 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!44028 res!289123) b!485519))

(assert (= (and b!485519 res!289124) b!485520))

(assert (= (and b!485520 res!289121) b!485521))

(assert (= (and b!485521 res!289122) b!485522))

(declare-fun m!465633 () Bool)

(assert (=> b!485521 m!465633))

(declare-fun m!465635 () Bool)

(assert (=> b!485520 m!465635))

(assert (=> b!485520 m!465635))

(declare-fun m!465637 () Bool)

(assert (=> b!485520 m!465637))

(declare-fun m!465639 () Bool)

(assert (=> start!44028 m!465639))

(declare-fun m!465641 () Bool)

(assert (=> start!44028 m!465641))

(push 1)

(assert (not b!485520))

(assert (not start!44028))

(assert (not b!485521))

(check-sat)

