; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44016 () Bool)

(assert start!44016)

(declare-fun res!288995 () Bool)

(declare-fun e!285710 () Bool)

(assert (=> start!44016 (=> (not res!288995) (not e!285710))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44016 (= res!288995 (validMask!0 mask!3524))))

(assert (=> start!44016 e!285710))

(assert (=> start!44016 true))

(declare-datatypes ((array!31405 0))(
  ( (array!31406 (arr!15101 (Array (_ BitVec 32) (_ BitVec 64))) (size!15466 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31405)

(declare-fun array_inv!10984 (array!31405) Bool)

(assert (=> start!44016 (array_inv!10984 a!3235)))

(declare-fun b!485249 () Bool)

(declare-fun res!288994 () Bool)

(assert (=> b!485249 (=> (not res!288994) (not e!285710))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!485249 (= res!288994 (validKeyInArray!0 (select (arr!15101 a!3235) j!176)))))

(declare-fun b!485250 () Bool)

(declare-fun res!288992 () Bool)

(assert (=> b!485250 (=> (not res!288992) (not e!285710))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!485250 (= res!288992 (validKeyInArray!0 k0!2280))))

(declare-fun b!485251 () Bool)

(assert (=> b!485251 (= e!285710 (bvsge #b00000000000000000000000000000000 (size!15466 a!3235)))))

(declare-fun b!485248 () Bool)

(declare-fun res!288993 () Bool)

(assert (=> b!485248 (=> (not res!288993) (not e!285710))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!485248 (= res!288993 (and (= (size!15466 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15466 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15466 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!44016 res!288995) b!485248))

(assert (= (and b!485248 res!288993) b!485249))

(assert (= (and b!485249 res!288994) b!485250))

(assert (= (and b!485250 res!288992) b!485251))

(declare-fun m!464901 () Bool)

(assert (=> start!44016 m!464901))

(declare-fun m!464903 () Bool)

(assert (=> start!44016 m!464903))

(declare-fun m!464905 () Bool)

(assert (=> b!485249 m!464905))

(assert (=> b!485249 m!464905))

(declare-fun m!464907 () Bool)

(assert (=> b!485249 m!464907))

(declare-fun m!464909 () Bool)

(assert (=> b!485250 m!464909))

(check-sat (not b!485249) (not b!485250) (not start!44016))
(check-sat)
