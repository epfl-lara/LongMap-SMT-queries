; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92314 () Bool)

(assert start!92314)

(declare-fun b!1049084 () Bool)

(declare-fun e!595182 () Bool)

(assert (=> b!1049084 (= e!595182 true)))

(declare-datatypes ((array!66056 0))(
  ( (array!66057 (arr!31767 (Array (_ BitVec 32) (_ BitVec 64))) (size!32305 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66056)

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((List!22138 0))(
  ( (Nil!22135) (Cons!22134 (h!23343 (_ BitVec 64)) (t!31436 List!22138)) )
))
(declare-fun arrayNoDuplicates!0 (array!66056 (_ BitVec 32) List!22138) Bool)

(assert (=> b!1049084 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22135)))

(declare-datatypes ((Unit!34187 0))(
  ( (Unit!34188) )
))
(declare-fun lt!463233 () Unit!34187)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66056 (_ BitVec 32) (_ BitVec 32)) Unit!34187)

(assert (=> b!1049084 (= lt!463233 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun res!698294 () Bool)

(declare-fun e!595183 () Bool)

(assert (=> start!92314 (=> (not res!698294) (not e!595183))))

(assert (=> start!92314 (= res!698294 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32305 a!3488)) (bvslt (size!32305 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92314 e!595183))

(assert (=> start!92314 true))

(declare-fun array_inv!24550 (array!66056) Bool)

(assert (=> start!92314 (array_inv!24550 a!3488)))

(declare-fun b!1049085 () Bool)

(declare-fun res!698295 () Bool)

(assert (=> b!1049085 (=> (not res!698295) (not e!595183))))

(assert (=> b!1049085 (= res!698295 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22135))))

(declare-fun b!1049086 () Bool)

(declare-fun e!595181 () Bool)

(declare-fun e!595184 () Bool)

(assert (=> b!1049086 (= e!595181 e!595184)))

(declare-fun res!698300 () Bool)

(assert (=> b!1049086 (=> res!698300 e!595184)))

(declare-fun lt!463232 () (_ BitVec 32))

(assert (=> b!1049086 (= res!698300 (bvsle lt!463232 i!1381))))

(declare-fun b!1049087 () Bool)

(declare-fun res!698299 () Bool)

(assert (=> b!1049087 (=> (not res!698299) (not e!595183))))

(declare-fun k0!2747 () (_ BitVec 64))

(assert (=> b!1049087 (= res!698299 (= (select (arr!31767 a!3488) i!1381) k0!2747))))

(declare-fun b!1049088 () Bool)

(declare-fun e!595180 () Bool)

(declare-fun e!595179 () Bool)

(assert (=> b!1049088 (= e!595180 e!595179)))

(declare-fun res!698298 () Bool)

(assert (=> b!1049088 (=> (not res!698298) (not e!595179))))

(assert (=> b!1049088 (= res!698298 (not (= lt!463232 i!1381)))))

(declare-fun lt!463234 () array!66056)

(declare-fun arrayScanForKey!0 (array!66056 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1049088 (= lt!463232 (arrayScanForKey!0 lt!463234 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1049089 () Bool)

(declare-fun arrayContainsKey!0 (array!66056 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1049089 (= e!595184 (arrayContainsKey!0 a!3488 k0!2747 lt!463232))))

(declare-fun b!1049090 () Bool)

(declare-fun res!698302 () Bool)

(assert (=> b!1049090 (=> (not res!698302) (not e!595183))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1049090 (= res!698302 (validKeyInArray!0 k0!2747))))

(declare-fun b!1049091 () Bool)

(assert (=> b!1049091 (= e!595183 e!595180)))

(declare-fun res!698296 () Bool)

(assert (=> b!1049091 (=> (not res!698296) (not e!595180))))

(assert (=> b!1049091 (= res!698296 (arrayContainsKey!0 lt!463234 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1049091 (= lt!463234 (array!66057 (store (arr!31767 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32305 a!3488)))))

(declare-fun b!1049092 () Bool)

(assert (=> b!1049092 (= e!595179 (not e!595182))))

(declare-fun res!698301 () Bool)

(assert (=> b!1049092 (=> res!698301 e!595182)))

(assert (=> b!1049092 (= res!698301 (bvsle lt!463232 i!1381))))

(assert (=> b!1049092 e!595181))

(declare-fun res!698297 () Bool)

(assert (=> b!1049092 (=> (not res!698297) (not e!595181))))

(assert (=> b!1049092 (= res!698297 (= (select (store (arr!31767 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463232) k0!2747))))

(assert (= (and start!92314 res!698294) b!1049085))

(assert (= (and b!1049085 res!698295) b!1049090))

(assert (= (and b!1049090 res!698302) b!1049087))

(assert (= (and b!1049087 res!698299) b!1049091))

(assert (= (and b!1049091 res!698296) b!1049088))

(assert (= (and b!1049088 res!698298) b!1049092))

(assert (= (and b!1049092 res!698297) b!1049086))

(assert (= (and b!1049086 (not res!698300)) b!1049089))

(assert (= (and b!1049092 (not res!698301)) b!1049084))

(declare-fun m!969415 () Bool)

(assert (=> b!1049092 m!969415))

(declare-fun m!969417 () Bool)

(assert (=> b!1049092 m!969417))

(declare-fun m!969419 () Bool)

(assert (=> b!1049085 m!969419))

(declare-fun m!969421 () Bool)

(assert (=> start!92314 m!969421))

(declare-fun m!969423 () Bool)

(assert (=> b!1049091 m!969423))

(assert (=> b!1049091 m!969415))

(declare-fun m!969425 () Bool)

(assert (=> b!1049088 m!969425))

(declare-fun m!969427 () Bool)

(assert (=> b!1049087 m!969427))

(declare-fun m!969429 () Bool)

(assert (=> b!1049090 m!969429))

(declare-fun m!969431 () Bool)

(assert (=> b!1049089 m!969431))

(declare-fun m!969433 () Bool)

(assert (=> b!1049084 m!969433))

(declare-fun m!969435 () Bool)

(assert (=> b!1049084 m!969435))

(check-sat (not b!1049089) (not b!1049090) (not b!1049088) (not start!92314) (not b!1049084) (not b!1049085) (not b!1049091))
(check-sat)
