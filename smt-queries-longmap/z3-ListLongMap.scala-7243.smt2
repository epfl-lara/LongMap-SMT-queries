; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92518 () Bool)

(assert start!92518)

(declare-fun b!1052151 () Bool)

(declare-fun res!701361 () Bool)

(declare-fun e!597342 () Bool)

(assert (=> b!1052151 (=> (not res!701361) (not e!597342))))

(declare-datatypes ((array!66260 0))(
  ( (array!66261 (arr!31869 (Array (_ BitVec 32) (_ BitVec 64))) (size!32407 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66260)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1052151 (= res!701361 (= (select (arr!31869 a!3488) i!1381) k0!2747))))

(declare-fun b!1052152 () Bool)

(declare-fun res!701371 () Bool)

(declare-fun e!597344 () Bool)

(assert (=> b!1052152 (=> res!701371 e!597344)))

(declare-datatypes ((List!22240 0))(
  ( (Nil!22237) (Cons!22236 (h!23445 (_ BitVec 64)) (t!31538 List!22240)) )
))
(declare-fun noDuplicate!1552 (List!22240) Bool)

(assert (=> b!1052152 (= res!701371 (not (noDuplicate!1552 Nil!22237)))))

(declare-fun b!1052153 () Bool)

(declare-fun e!597348 () Bool)

(assert (=> b!1052153 (= e!597342 e!597348)))

(declare-fun res!701364 () Bool)

(assert (=> b!1052153 (=> (not res!701364) (not e!597348))))

(declare-fun lt!464493 () array!66260)

(declare-fun arrayContainsKey!0 (array!66260 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1052153 (= res!701364 (arrayContainsKey!0 lt!464493 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1052153 (= lt!464493 (array!66261 (store (arr!31869 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32407 a!3488)))))

(declare-fun b!1052154 () Bool)

(declare-fun res!701362 () Bool)

(assert (=> b!1052154 (=> (not res!701362) (not e!597342))))

(declare-fun arrayNoDuplicates!0 (array!66260 (_ BitVec 32) List!22240) Bool)

(assert (=> b!1052154 (= res!701362 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22237))))

(declare-fun b!1052155 () Bool)

(assert (=> b!1052155 (= e!597344 true)))

(declare-fun lt!464492 () Bool)

(declare-fun contains!6127 (List!22240 (_ BitVec 64)) Bool)

(assert (=> b!1052155 (= lt!464492 (contains!6127 Nil!22237 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1052156 () Bool)

(declare-fun e!597341 () Bool)

(assert (=> b!1052156 (= e!597341 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1052157 () Bool)

(declare-fun res!701370 () Bool)

(assert (=> b!1052157 (=> res!701370 e!597344)))

(assert (=> b!1052157 (= res!701370 (contains!6127 Nil!22237 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!701369 () Bool)

(assert (=> start!92518 (=> (not res!701369) (not e!597342))))

(assert (=> start!92518 (= res!701369 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32407 a!3488)) (bvslt (size!32407 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92518 e!597342))

(assert (=> start!92518 true))

(declare-fun array_inv!24652 (array!66260) Bool)

(assert (=> start!92518 (array_inv!24652 a!3488)))

(declare-fun b!1052150 () Bool)

(declare-fun res!701367 () Bool)

(assert (=> b!1052150 (=> (not res!701367) (not e!597342))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1052150 (= res!701367 (validKeyInArray!0 k0!2747))))

(declare-fun b!1052158 () Bool)

(declare-fun e!597346 () Bool)

(assert (=> b!1052158 (= e!597346 e!597344)))

(declare-fun res!701365 () Bool)

(assert (=> b!1052158 (=> res!701365 e!597344)))

(declare-fun lt!464494 () (_ BitVec 32))

(declare-fun lt!464491 () (_ BitVec 32))

(assert (=> b!1052158 (= res!701365 (or (bvslt lt!464494 #b00000000000000000000000000000000) (bvsge lt!464491 (size!32407 a!3488)) (bvsge lt!464494 (size!32407 a!3488))))))

(assert (=> b!1052158 (arrayContainsKey!0 a!3488 k0!2747 lt!464491)))

(declare-datatypes ((Unit!34343 0))(
  ( (Unit!34344) )
))
(declare-fun lt!464489 () Unit!34343)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66260 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34343)

(assert (=> b!1052158 (= lt!464489 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!464491))))

(assert (=> b!1052158 (= lt!464491 (bvadd #b00000000000000000000000000000001 lt!464494))))

(assert (=> b!1052158 (arrayNoDuplicates!0 a!3488 lt!464494 Nil!22237)))

(declare-fun lt!464490 () Unit!34343)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66260 (_ BitVec 32) (_ BitVec 32)) Unit!34343)

(assert (=> b!1052158 (= lt!464490 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464494))))

(declare-fun b!1052159 () Bool)

(declare-fun e!597343 () Bool)

(assert (=> b!1052159 (= e!597343 e!597341)))

(declare-fun res!701363 () Bool)

(assert (=> b!1052159 (=> res!701363 e!597341)))

(assert (=> b!1052159 (= res!701363 (or (bvsgt lt!464494 i!1381) (bvsle i!1381 lt!464494)))))

(declare-fun b!1052160 () Bool)

(declare-fun e!597347 () Bool)

(assert (=> b!1052160 (= e!597347 (not e!597346))))

(declare-fun res!701368 () Bool)

(assert (=> b!1052160 (=> res!701368 e!597346)))

(assert (=> b!1052160 (= res!701368 (or (bvsgt lt!464494 i!1381) (bvsle i!1381 lt!464494)))))

(assert (=> b!1052160 e!597343))

(declare-fun res!701366 () Bool)

(assert (=> b!1052160 (=> (not res!701366) (not e!597343))))

(assert (=> b!1052160 (= res!701366 (= (select (store (arr!31869 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464494) k0!2747))))

(declare-fun b!1052161 () Bool)

(assert (=> b!1052161 (= e!597348 e!597347)))

(declare-fun res!701360 () Bool)

(assert (=> b!1052161 (=> (not res!701360) (not e!597347))))

(assert (=> b!1052161 (= res!701360 (not (= lt!464494 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66260 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1052161 (= lt!464494 (arrayScanForKey!0 lt!464493 k0!2747 #b00000000000000000000000000000000))))

(assert (= (and start!92518 res!701369) b!1052154))

(assert (= (and b!1052154 res!701362) b!1052150))

(assert (= (and b!1052150 res!701367) b!1052151))

(assert (= (and b!1052151 res!701361) b!1052153))

(assert (= (and b!1052153 res!701364) b!1052161))

(assert (= (and b!1052161 res!701360) b!1052160))

(assert (= (and b!1052160 res!701366) b!1052159))

(assert (= (and b!1052159 (not res!701363)) b!1052156))

(assert (= (and b!1052160 (not res!701368)) b!1052158))

(assert (= (and b!1052158 (not res!701365)) b!1052152))

(assert (= (and b!1052152 (not res!701371)) b!1052157))

(assert (= (and b!1052157 (not res!701370)) b!1052155))

(declare-fun m!972079 () Bool)

(assert (=> b!1052152 m!972079))

(declare-fun m!972081 () Bool)

(assert (=> start!92518 m!972081))

(declare-fun m!972083 () Bool)

(assert (=> b!1052156 m!972083))

(declare-fun m!972085 () Bool)

(assert (=> b!1052154 m!972085))

(declare-fun m!972087 () Bool)

(assert (=> b!1052155 m!972087))

(declare-fun m!972089 () Bool)

(assert (=> b!1052161 m!972089))

(declare-fun m!972091 () Bool)

(assert (=> b!1052153 m!972091))

(declare-fun m!972093 () Bool)

(assert (=> b!1052153 m!972093))

(declare-fun m!972095 () Bool)

(assert (=> b!1052150 m!972095))

(declare-fun m!972097 () Bool)

(assert (=> b!1052157 m!972097))

(declare-fun m!972099 () Bool)

(assert (=> b!1052151 m!972099))

(assert (=> b!1052160 m!972093))

(declare-fun m!972101 () Bool)

(assert (=> b!1052160 m!972101))

(declare-fun m!972103 () Bool)

(assert (=> b!1052158 m!972103))

(declare-fun m!972105 () Bool)

(assert (=> b!1052158 m!972105))

(declare-fun m!972107 () Bool)

(assert (=> b!1052158 m!972107))

(declare-fun m!972109 () Bool)

(assert (=> b!1052158 m!972109))

(check-sat (not b!1052158) (not b!1052153) (not b!1052152) (not start!92518) (not b!1052161) (not b!1052157) (not b!1052155) (not b!1052156) (not b!1052154) (not b!1052150))
(check-sat)
