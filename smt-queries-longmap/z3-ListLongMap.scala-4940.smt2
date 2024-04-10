; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68018 () Bool)

(assert start!68018)

(declare-fun b!791577 () Bool)

(declare-fun res!536312 () Bool)

(declare-fun e!439904 () Bool)

(assert (=> b!791577 (=> (not res!536312) (not e!439904))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!42932 0))(
  ( (array!42933 (arr!20551 (Array (_ BitVec 32) (_ BitVec 64))) (size!20972 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42932)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!791577 (= res!536312 (and (= (size!20972 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!20972 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!20972 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!536315 () Bool)

(assert (=> start!68018 (=> (not res!536315) (not e!439904))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68018 (= res!536315 (validMask!0 mask!3266))))

(assert (=> start!68018 e!439904))

(assert (=> start!68018 true))

(declare-fun array_inv!16347 (array!42932) Bool)

(assert (=> start!68018 (array_inv!16347 a!3170)))

(declare-fun b!791578 () Bool)

(declare-fun res!536314 () Bool)

(assert (=> b!791578 (=> (not res!536314) (not e!439904))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!791578 (= res!536314 (validKeyInArray!0 (select (arr!20551 a!3170) j!153)))))

(declare-fun b!791580 () Bool)

(assert (=> b!791580 (= e!439904 (and (bvslt #b00000000000000000000000000000000 (size!20972 a!3170)) (bvsge (size!20972 a!3170) #b01111111111111111111111111111111)))))

(declare-fun b!791579 () Bool)

(declare-fun res!536313 () Bool)

(assert (=> b!791579 (=> (not res!536313) (not e!439904))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!791579 (= res!536313 (validKeyInArray!0 k0!2044))))

(assert (= (and start!68018 res!536315) b!791577))

(assert (= (and b!791577 res!536312) b!791578))

(assert (= (and b!791578 res!536314) b!791579))

(assert (= (and b!791579 res!536313) b!791580))

(declare-fun m!732321 () Bool)

(assert (=> start!68018 m!732321))

(declare-fun m!732323 () Bool)

(assert (=> start!68018 m!732323))

(declare-fun m!732325 () Bool)

(assert (=> b!791578 m!732325))

(assert (=> b!791578 m!732325))

(declare-fun m!732327 () Bool)

(assert (=> b!791578 m!732327))

(declare-fun m!732329 () Bool)

(assert (=> b!791579 m!732329))

(check-sat (not b!791579) (not start!68018) (not b!791578))
(check-sat)
(get-model)

(declare-fun d!103097 () Bool)

(assert (=> d!103097 (= (validKeyInArray!0 k0!2044) (and (not (= k0!2044 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2044 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!791579 d!103097))

(declare-fun d!103099 () Bool)

(assert (=> d!103099 (= (validMask!0 mask!3266) (and (or (= mask!3266 #b00000000000000000000000000000111) (= mask!3266 #b00000000000000000000000000001111) (= mask!3266 #b00000000000000000000000000011111) (= mask!3266 #b00000000000000000000000000111111) (= mask!3266 #b00000000000000000000000001111111) (= mask!3266 #b00000000000000000000000011111111) (= mask!3266 #b00000000000000000000000111111111) (= mask!3266 #b00000000000000000000001111111111) (= mask!3266 #b00000000000000000000011111111111) (= mask!3266 #b00000000000000000000111111111111) (= mask!3266 #b00000000000000000001111111111111) (= mask!3266 #b00000000000000000011111111111111) (= mask!3266 #b00000000000000000111111111111111) (= mask!3266 #b00000000000000001111111111111111) (= mask!3266 #b00000000000000011111111111111111) (= mask!3266 #b00000000000000111111111111111111) (= mask!3266 #b00000000000001111111111111111111) (= mask!3266 #b00000000000011111111111111111111) (= mask!3266 #b00000000000111111111111111111111) (= mask!3266 #b00000000001111111111111111111111) (= mask!3266 #b00000000011111111111111111111111) (= mask!3266 #b00000000111111111111111111111111) (= mask!3266 #b00000001111111111111111111111111) (= mask!3266 #b00000011111111111111111111111111) (= mask!3266 #b00000111111111111111111111111111) (= mask!3266 #b00001111111111111111111111111111) (= mask!3266 #b00011111111111111111111111111111) (= mask!3266 #b00111111111111111111111111111111)) (bvsle mask!3266 #b00111111111111111111111111111111)))))

(assert (=> start!68018 d!103099))

(declare-fun d!103109 () Bool)

(assert (=> d!103109 (= (array_inv!16347 a!3170) (bvsge (size!20972 a!3170) #b00000000000000000000000000000000))))

(assert (=> start!68018 d!103109))

(declare-fun d!103111 () Bool)

(assert (=> d!103111 (= (validKeyInArray!0 (select (arr!20551 a!3170) j!153)) (and (not (= (select (arr!20551 a!3170) j!153) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20551 a!3170) j!153) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!791578 d!103111))

(check-sat)
