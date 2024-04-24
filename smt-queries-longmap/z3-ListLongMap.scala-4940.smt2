; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68134 () Bool)

(assert start!68134)

(declare-fun b!792211 () Bool)

(declare-fun res!536573 () Bool)

(declare-fun e!440313 () Bool)

(assert (=> b!792211 (=> (not res!536573) (not e!440313))))

(declare-datatypes ((array!42928 0))(
  ( (array!42929 (arr!20545 (Array (_ BitVec 32) (_ BitVec 64))) (size!20965 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42928)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!792211 (= res!536573 (validKeyInArray!0 (select (arr!20545 a!3170) j!153)))))

(declare-fun res!536574 () Bool)

(assert (=> start!68134 (=> (not res!536574) (not e!440313))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68134 (= res!536574 (validMask!0 mask!3266))))

(assert (=> start!68134 e!440313))

(assert (=> start!68134 true))

(declare-fun array_inv!16404 (array!42928) Bool)

(assert (=> start!68134 (array_inv!16404 a!3170)))

(declare-fun b!792213 () Bool)

(assert (=> b!792213 (= e!440313 (and (bvslt #b00000000000000000000000000000000 (size!20965 a!3170)) (bvsge (size!20965 a!3170) #b01111111111111111111111111111111)))))

(declare-fun b!792210 () Bool)

(declare-fun res!536572 () Bool)

(assert (=> b!792210 (=> (not res!536572) (not e!440313))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!792210 (= res!536572 (and (= (size!20965 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!20965 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!20965 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!792212 () Bool)

(declare-fun res!536571 () Bool)

(assert (=> b!792212 (=> (not res!536571) (not e!440313))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!792212 (= res!536571 (validKeyInArray!0 k0!2044))))

(assert (= (and start!68134 res!536574) b!792210))

(assert (= (and b!792210 res!536572) b!792211))

(assert (= (and b!792211 res!536573) b!792212))

(assert (= (and b!792212 res!536571) b!792213))

(declare-fun m!733373 () Bool)

(assert (=> b!792211 m!733373))

(assert (=> b!792211 m!733373))

(declare-fun m!733375 () Bool)

(assert (=> b!792211 m!733375))

(declare-fun m!733377 () Bool)

(assert (=> start!68134 m!733377))

(declare-fun m!733379 () Bool)

(assert (=> start!68134 m!733379))

(declare-fun m!733381 () Bool)

(assert (=> b!792212 m!733381))

(check-sat (not b!792212) (not b!792211) (not start!68134))
(check-sat)
(get-model)

(declare-fun d!103351 () Bool)

(assert (=> d!103351 (= (validKeyInArray!0 k0!2044) (and (not (= k0!2044 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2044 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!792212 d!103351))

(declare-fun d!103353 () Bool)

(assert (=> d!103353 (= (validKeyInArray!0 (select (arr!20545 a!3170) j!153)) (and (not (= (select (arr!20545 a!3170) j!153) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20545 a!3170) j!153) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!792211 d!103353))

(declare-fun d!103355 () Bool)

(assert (=> d!103355 (= (validMask!0 mask!3266) (and (or (= mask!3266 #b00000000000000000000000000000111) (= mask!3266 #b00000000000000000000000000001111) (= mask!3266 #b00000000000000000000000000011111) (= mask!3266 #b00000000000000000000000000111111) (= mask!3266 #b00000000000000000000000001111111) (= mask!3266 #b00000000000000000000000011111111) (= mask!3266 #b00000000000000000000000111111111) (= mask!3266 #b00000000000000000000001111111111) (= mask!3266 #b00000000000000000000011111111111) (= mask!3266 #b00000000000000000000111111111111) (= mask!3266 #b00000000000000000001111111111111) (= mask!3266 #b00000000000000000011111111111111) (= mask!3266 #b00000000000000000111111111111111) (= mask!3266 #b00000000000000001111111111111111) (= mask!3266 #b00000000000000011111111111111111) (= mask!3266 #b00000000000000111111111111111111) (= mask!3266 #b00000000000001111111111111111111) (= mask!3266 #b00000000000011111111111111111111) (= mask!3266 #b00000000000111111111111111111111) (= mask!3266 #b00000000001111111111111111111111) (= mask!3266 #b00000000011111111111111111111111) (= mask!3266 #b00000000111111111111111111111111) (= mask!3266 #b00000001111111111111111111111111) (= mask!3266 #b00000011111111111111111111111111) (= mask!3266 #b00000111111111111111111111111111) (= mask!3266 #b00001111111111111111111111111111) (= mask!3266 #b00011111111111111111111111111111) (= mask!3266 #b00111111111111111111111111111111)) (bvsle mask!3266 #b00111111111111111111111111111111)))))

(assert (=> start!68134 d!103355))

(declare-fun d!103369 () Bool)

(assert (=> d!103369 (= (array_inv!16404 a!3170) (bvsge (size!20965 a!3170) #b00000000000000000000000000000000))))

(assert (=> start!68134 d!103369))

(check-sat)
