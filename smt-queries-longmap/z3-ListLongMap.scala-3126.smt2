; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44054 () Bool)

(assert start!44054)

(declare-fun b!485608 () Bool)

(declare-fun res!289211 () Bool)

(declare-fun e!285927 () Bool)

(assert (=> b!485608 (=> (not res!289211) (not e!285927))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!485608 (= res!289211 (validKeyInArray!0 k0!2280))))

(declare-fun res!289212 () Bool)

(assert (=> start!44054 (=> (not res!289212) (not e!285927))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44054 (= res!289212 (validMask!0 mask!3524))))

(assert (=> start!44054 e!285927))

(assert (=> start!44054 true))

(declare-datatypes ((array!31422 0))(
  ( (array!31423 (arr!15109 (Array (_ BitVec 32) (_ BitVec 64))) (size!15473 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31422)

(declare-fun array_inv!10905 (array!31422) Bool)

(assert (=> start!44054 (array_inv!10905 a!3235)))

(declare-fun b!485609 () Bool)

(assert (=> b!485609 (= e!285927 (bvslt mask!3524 #b00000000000000000000000000000000))))

(declare-fun b!485610 () Bool)

(declare-fun res!289214 () Bool)

(assert (=> b!485610 (=> (not res!289214) (not e!285927))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!485610 (= res!289214 (validKeyInArray!0 (select (arr!15109 a!3235) j!176)))))

(declare-fun b!485611 () Bool)

(declare-fun res!289213 () Bool)

(assert (=> b!485611 (=> (not res!289213) (not e!285927))))

(declare-fun arrayContainsKey!0 (array!31422 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!485611 (= res!289213 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!485612 () Bool)

(declare-fun res!289210 () Bool)

(assert (=> b!485612 (=> (not res!289210) (not e!285927))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!485612 (= res!289210 (and (= (size!15473 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15473 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15473 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!44054 res!289212) b!485612))

(assert (= (and b!485612 res!289210) b!485610))

(assert (= (and b!485610 res!289214) b!485608))

(assert (= (and b!485608 res!289211) b!485611))

(assert (= (and b!485611 res!289213) b!485609))

(declare-fun m!465705 () Bool)

(assert (=> b!485608 m!465705))

(declare-fun m!465707 () Bool)

(assert (=> start!44054 m!465707))

(declare-fun m!465709 () Bool)

(assert (=> start!44054 m!465709))

(declare-fun m!465711 () Bool)

(assert (=> b!485610 m!465711))

(assert (=> b!485610 m!465711))

(declare-fun m!465713 () Bool)

(assert (=> b!485610 m!465713))

(declare-fun m!465715 () Bool)

(assert (=> b!485611 m!465715))

(check-sat (not b!485610) (not b!485608) (not start!44054) (not b!485611))
(check-sat)
