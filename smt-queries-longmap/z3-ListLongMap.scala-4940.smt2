; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67994 () Bool)

(assert start!67994)

(declare-fun b!791315 () Bool)

(declare-fun res!536190 () Bool)

(declare-fun e!439744 () Bool)

(assert (=> b!791315 (=> (not res!536190) (not e!439744))))

(declare-datatypes ((array!42927 0))(
  ( (array!42928 (arr!20549 (Array (_ BitVec 32) (_ BitVec 64))) (size!20970 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42927)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!791315 (= res!536190 (and (= (size!20970 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!20970 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!20970 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!791316 () Bool)

(declare-fun res!536193 () Bool)

(assert (=> b!791316 (=> (not res!536193) (not e!439744))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!791316 (= res!536193 (validKeyInArray!0 (select (arr!20549 a!3170) j!153)))))

(declare-fun res!536192 () Bool)

(assert (=> start!67994 (=> (not res!536192) (not e!439744))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67994 (= res!536192 (validMask!0 mask!3266))))

(assert (=> start!67994 e!439744))

(assert (=> start!67994 true))

(declare-fun array_inv!16432 (array!42927) Bool)

(assert (=> start!67994 (array_inv!16432 a!3170)))

(declare-fun b!791317 () Bool)

(declare-fun res!536191 () Bool)

(assert (=> b!791317 (=> (not res!536191) (not e!439744))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!791317 (= res!536191 (validKeyInArray!0 k0!2044))))

(declare-fun b!791318 () Bool)

(assert (=> b!791318 (= e!439744 (and (bvslt #b00000000000000000000000000000000 (size!20970 a!3170)) (bvsge (size!20970 a!3170) #b01111111111111111111111111111111)))))

(assert (= (and start!67994 res!536192) b!791315))

(assert (= (and b!791315 res!536190) b!791316))

(assert (= (and b!791316 res!536193) b!791317))

(assert (= (and b!791317 res!536191) b!791318))

(declare-fun m!731553 () Bool)

(assert (=> b!791316 m!731553))

(assert (=> b!791316 m!731553))

(declare-fun m!731555 () Bool)

(assert (=> b!791316 m!731555))

(declare-fun m!731557 () Bool)

(assert (=> start!67994 m!731557))

(declare-fun m!731559 () Bool)

(assert (=> start!67994 m!731559))

(declare-fun m!731561 () Bool)

(assert (=> b!791317 m!731561))

(check-sat (not start!67994) (not b!791316) (not b!791317))
(check-sat)
(get-model)

(declare-fun d!102901 () Bool)

(assert (=> d!102901 (= (validMask!0 mask!3266) (and (or (= mask!3266 #b00000000000000000000000000000111) (= mask!3266 #b00000000000000000000000000001111) (= mask!3266 #b00000000000000000000000000011111) (= mask!3266 #b00000000000000000000000000111111) (= mask!3266 #b00000000000000000000000001111111) (= mask!3266 #b00000000000000000000000011111111) (= mask!3266 #b00000000000000000000000111111111) (= mask!3266 #b00000000000000000000001111111111) (= mask!3266 #b00000000000000000000011111111111) (= mask!3266 #b00000000000000000000111111111111) (= mask!3266 #b00000000000000000001111111111111) (= mask!3266 #b00000000000000000011111111111111) (= mask!3266 #b00000000000000000111111111111111) (= mask!3266 #b00000000000000001111111111111111) (= mask!3266 #b00000000000000011111111111111111) (= mask!3266 #b00000000000000111111111111111111) (= mask!3266 #b00000000000001111111111111111111) (= mask!3266 #b00000000000011111111111111111111) (= mask!3266 #b00000000000111111111111111111111) (= mask!3266 #b00000000001111111111111111111111) (= mask!3266 #b00000000011111111111111111111111) (= mask!3266 #b00000000111111111111111111111111) (= mask!3266 #b00000001111111111111111111111111) (= mask!3266 #b00000011111111111111111111111111) (= mask!3266 #b00000111111111111111111111111111) (= mask!3266 #b00001111111111111111111111111111) (= mask!3266 #b00011111111111111111111111111111) (= mask!3266 #b00111111111111111111111111111111)) (bvsle mask!3266 #b00111111111111111111111111111111)))))

(assert (=> start!67994 d!102901))

(declare-fun d!102903 () Bool)

(assert (=> d!102903 (= (array_inv!16432 a!3170) (bvsge (size!20970 a!3170) #b00000000000000000000000000000000))))

(assert (=> start!67994 d!102903))

(declare-fun d!102905 () Bool)

(assert (=> d!102905 (= (validKeyInArray!0 (select (arr!20549 a!3170) j!153)) (and (not (= (select (arr!20549 a!3170) j!153) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20549 a!3170) j!153) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!791316 d!102905))

(declare-fun d!102907 () Bool)

(assert (=> d!102907 (= (validKeyInArray!0 k0!2044) (and (not (= k0!2044 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2044 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!791317 d!102907))

(check-sat)
