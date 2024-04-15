; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44022 () Bool)

(assert start!44022)

(declare-fun b!485285 () Bool)

(declare-fun res!289031 () Bool)

(declare-fun e!285729 () Bool)

(assert (=> b!485285 (=> (not res!289031) (not e!285729))))

(declare-datatypes ((array!31411 0))(
  ( (array!31412 (arr!15104 (Array (_ BitVec 32) (_ BitVec 64))) (size!15469 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31411)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!485285 (= res!289031 (validKeyInArray!0 (select (arr!15104 a!3235) j!176)))))

(declare-fun b!485286 () Bool)

(declare-fun res!289030 () Bool)

(assert (=> b!485286 (=> (not res!289030) (not e!285729))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!485286 (= res!289030 (validKeyInArray!0 k0!2280))))

(declare-fun b!485284 () Bool)

(declare-fun res!289028 () Bool)

(assert (=> b!485284 (=> (not res!289028) (not e!285729))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!485284 (= res!289028 (and (= (size!15469 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15469 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15469 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!485287 () Bool)

(assert (=> b!485287 (= e!285729 (and (bvslt #b00000000000000000000000000000000 (size!15469 a!3235)) (bvsge (size!15469 a!3235) #b01111111111111111111111111111111)))))

(declare-fun res!289029 () Bool)

(assert (=> start!44022 (=> (not res!289029) (not e!285729))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44022 (= res!289029 (validMask!0 mask!3524))))

(assert (=> start!44022 e!285729))

(assert (=> start!44022 true))

(declare-fun array_inv!10987 (array!31411) Bool)

(assert (=> start!44022 (array_inv!10987 a!3235)))

(assert (= (and start!44022 res!289029) b!485284))

(assert (= (and b!485284 res!289028) b!485285))

(assert (= (and b!485285 res!289031) b!485286))

(assert (= (and b!485286 res!289030) b!485287))

(declare-fun m!464931 () Bool)

(assert (=> b!485285 m!464931))

(assert (=> b!485285 m!464931))

(declare-fun m!464933 () Bool)

(assert (=> b!485285 m!464933))

(declare-fun m!464935 () Bool)

(assert (=> b!485286 m!464935))

(declare-fun m!464937 () Bool)

(assert (=> start!44022 m!464937))

(declare-fun m!464939 () Bool)

(assert (=> start!44022 m!464939))

(check-sat (not b!485286) (not b!485285) (not start!44022))
(check-sat)
(get-model)

(declare-fun d!77219 () Bool)

(assert (=> d!77219 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!485286 d!77219))

(declare-fun d!77221 () Bool)

(assert (=> d!77221 (= (validKeyInArray!0 (select (arr!15104 a!3235) j!176)) (and (not (= (select (arr!15104 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15104 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!485285 d!77221))

(declare-fun d!77223 () Bool)

(assert (=> d!77223 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!44022 d!77223))

(declare-fun d!77231 () Bool)

(assert (=> d!77231 (= (array_inv!10987 a!3235) (bvsge (size!15469 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!44022 d!77231))

(check-sat)
