; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92840 () Bool)

(assert start!92840)

(declare-fun b!1054311 () Bool)

(declare-fun res!703257 () Bool)

(declare-fun e!598953 () Bool)

(assert (=> b!1054311 (=> (not res!703257) (not e!598953))))

(declare-datatypes ((array!66500 0))(
  ( (array!66501 (arr!31982 (Array (_ BitVec 32) (_ BitVec 64))) (size!32518 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66500)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1054311 (= res!703257 (= (select (arr!31982 a!3488) i!1381) k0!2747))))

(declare-fun b!1054312 () Bool)

(declare-fun res!703253 () Bool)

(assert (=> b!1054312 (=> (not res!703253) (not e!598953))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1054312 (= res!703253 (validKeyInArray!0 k0!2747))))

(declare-fun b!1054313 () Bool)

(declare-fun e!598957 () Bool)

(assert (=> b!1054313 (= e!598957 true)))

(declare-datatypes ((List!22294 0))(
  ( (Nil!22291) (Cons!22290 (h!23499 (_ BitVec 64)) (t!31601 List!22294)) )
))
(declare-fun arrayNoDuplicates!0 (array!66500 (_ BitVec 32) List!22294) Bool)

(assert (=> b!1054313 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22291)))

(declare-datatypes ((Unit!34522 0))(
  ( (Unit!34523) )
))
(declare-fun lt!465367 () Unit!34522)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66500 (_ BitVec 32) (_ BitVec 32)) Unit!34522)

(assert (=> b!1054313 (= lt!465367 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1054314 () Bool)

(declare-fun e!598951 () Bool)

(declare-fun e!598956 () Bool)

(assert (=> b!1054314 (= e!598951 e!598956)))

(declare-fun res!703254 () Bool)

(assert (=> b!1054314 (=> (not res!703254) (not e!598956))))

(declare-fun lt!465369 () (_ BitVec 32))

(assert (=> b!1054314 (= res!703254 (not (= lt!465369 i!1381)))))

(declare-fun lt!465368 () array!66500)

(declare-fun arrayScanForKey!0 (array!66500 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1054314 (= lt!465369 (arrayScanForKey!0 lt!465368 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1054315 () Bool)

(declare-fun e!598952 () Bool)

(declare-fun e!598955 () Bool)

(assert (=> b!1054315 (= e!598952 e!598955)))

(declare-fun res!703258 () Bool)

(assert (=> b!1054315 (=> res!703258 e!598955)))

(assert (=> b!1054315 (= res!703258 (bvsle lt!465369 i!1381))))

(declare-fun b!1054316 () Bool)

(assert (=> b!1054316 (= e!598953 e!598951)))

(declare-fun res!703256 () Bool)

(assert (=> b!1054316 (=> (not res!703256) (not e!598951))))

(declare-fun arrayContainsKey!0 (array!66500 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1054316 (= res!703256 (arrayContainsKey!0 lt!465368 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1054316 (= lt!465368 (array!66501 (store (arr!31982 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32518 a!3488)))))

(declare-fun res!703252 () Bool)

(assert (=> start!92840 (=> (not res!703252) (not e!598953))))

(assert (=> start!92840 (= res!703252 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32518 a!3488)) (bvslt (size!32518 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92840 e!598953))

(assert (=> start!92840 true))

(declare-fun array_inv!24762 (array!66500) Bool)

(assert (=> start!92840 (array_inv!24762 a!3488)))

(declare-fun b!1054317 () Bool)

(assert (=> b!1054317 (= e!598956 (not e!598957))))

(declare-fun res!703259 () Bool)

(assert (=> b!1054317 (=> res!703259 e!598957)))

(assert (=> b!1054317 (= res!703259 (bvsle lt!465369 i!1381))))

(assert (=> b!1054317 e!598952))

(declare-fun res!703251 () Bool)

(assert (=> b!1054317 (=> (not res!703251) (not e!598952))))

(assert (=> b!1054317 (= res!703251 (= (select (store (arr!31982 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465369) k0!2747))))

(declare-fun b!1054318 () Bool)

(assert (=> b!1054318 (= e!598955 (arrayContainsKey!0 a!3488 k0!2747 lt!465369))))

(declare-fun b!1054319 () Bool)

(declare-fun res!703255 () Bool)

(assert (=> b!1054319 (=> (not res!703255) (not e!598953))))

(assert (=> b!1054319 (= res!703255 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22291))))

(assert (= (and start!92840 res!703252) b!1054319))

(assert (= (and b!1054319 res!703255) b!1054312))

(assert (= (and b!1054312 res!703253) b!1054311))

(assert (= (and b!1054311 res!703257) b!1054316))

(assert (= (and b!1054316 res!703256) b!1054314))

(assert (= (and b!1054314 res!703254) b!1054317))

(assert (= (and b!1054317 res!703251) b!1054315))

(assert (= (and b!1054315 (not res!703258)) b!1054318))

(assert (= (and b!1054317 (not res!703259)) b!1054313))

(declare-fun m!974403 () Bool)

(assert (=> b!1054313 m!974403))

(declare-fun m!974405 () Bool)

(assert (=> b!1054313 m!974405))

(declare-fun m!974407 () Bool)

(assert (=> b!1054312 m!974407))

(declare-fun m!974409 () Bool)

(assert (=> b!1054317 m!974409))

(declare-fun m!974411 () Bool)

(assert (=> b!1054317 m!974411))

(declare-fun m!974413 () Bool)

(assert (=> start!92840 m!974413))

(declare-fun m!974415 () Bool)

(assert (=> b!1054318 m!974415))

(declare-fun m!974417 () Bool)

(assert (=> b!1054311 m!974417))

(declare-fun m!974419 () Bool)

(assert (=> b!1054314 m!974419))

(declare-fun m!974421 () Bool)

(assert (=> b!1054316 m!974421))

(assert (=> b!1054316 m!974409))

(declare-fun m!974423 () Bool)

(assert (=> b!1054319 m!974423))

(check-sat (not b!1054318) (not b!1054312) (not start!92840) (not b!1054319) (not b!1054314) (not b!1054313) (not b!1054316))
(check-sat)
