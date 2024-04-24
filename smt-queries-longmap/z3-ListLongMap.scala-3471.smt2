; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48146 () Bool)

(assert start!48146)

(declare-fun res!326157 () Bool)

(declare-fun e!309030 () Bool)

(assert (=> start!48146 (=> (not res!326157) (not e!309030))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48146 (= res!326157 (validMask!0 mask!3216))))

(assert (=> start!48146 e!309030))

(assert (=> start!48146 true))

(declare-datatypes ((array!33583 0))(
  ( (array!33584 (arr!16138 (Array (_ BitVec 32) (_ BitVec 64))) (size!16502 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33583)

(declare-fun array_inv!11997 (array!33583) Bool)

(assert (=> start!48146 (array_inv!11997 a!3154)))

(declare-fun b!530397 () Bool)

(declare-fun res!326156 () Bool)

(assert (=> b!530397 (=> (not res!326156) (not e!309030))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530397 (= res!326156 (validKeyInArray!0 k0!1998))))

(declare-fun b!530395 () Bool)

(declare-fun res!326155 () Bool)

(assert (=> b!530395 (=> (not res!326155) (not e!309030))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!530395 (= res!326155 (and (= (size!16502 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16502 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16502 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!530398 () Bool)

(assert (=> b!530398 (= e!309030 (and (bvslt #b00000000000000000000000000000000 (size!16502 a!3154)) (bvsge (size!16502 a!3154) #b01111111111111111111111111111111)))))

(declare-fun b!530396 () Bool)

(declare-fun res!326158 () Bool)

(assert (=> b!530396 (=> (not res!326158) (not e!309030))))

(assert (=> b!530396 (= res!326158 (validKeyInArray!0 (select (arr!16138 a!3154) j!147)))))

(assert (= (and start!48146 res!326157) b!530395))

(assert (= (and b!530395 res!326155) b!530396))

(assert (= (and b!530396 res!326158) b!530397))

(assert (= (and b!530397 res!326156) b!530398))

(declare-fun m!511231 () Bool)

(assert (=> start!48146 m!511231))

(declare-fun m!511233 () Bool)

(assert (=> start!48146 m!511233))

(declare-fun m!511235 () Bool)

(assert (=> b!530397 m!511235))

(declare-fun m!511237 () Bool)

(assert (=> b!530396 m!511237))

(assert (=> b!530396 m!511237))

(declare-fun m!511239 () Bool)

(assert (=> b!530396 m!511239))

(check-sat (not start!48146) (not b!530397) (not b!530396))
(check-sat)
(get-model)

(declare-fun d!81161 () Bool)

(assert (=> d!81161 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!48146 d!81161))

(declare-fun d!81173 () Bool)

(assert (=> d!81173 (= (array_inv!11997 a!3154) (bvsge (size!16502 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!48146 d!81173))

(declare-fun d!81175 () Bool)

(assert (=> d!81175 (= (validKeyInArray!0 k0!1998) (and (not (= k0!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!530397 d!81175))

(declare-fun d!81177 () Bool)

(assert (=> d!81177 (= (validKeyInArray!0 (select (arr!16138 a!3154) j!147)) (and (not (= (select (arr!16138 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16138 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!530396 d!81177))

(check-sat)
