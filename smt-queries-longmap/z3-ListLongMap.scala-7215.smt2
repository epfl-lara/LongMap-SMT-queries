; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92586 () Bool)

(assert start!92586)

(declare-fun b!1051177 () Bool)

(declare-fun res!699501 () Bool)

(declare-fun e!596544 () Bool)

(assert (=> b!1051177 (=> (not res!699501) (not e!596544))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1051177 (= res!699501 (validKeyInArray!0 k0!2747))))

(declare-fun b!1051178 () Bool)

(declare-fun res!699504 () Bool)

(assert (=> b!1051178 (=> (not res!699504) (not e!596544))))

(declare-datatypes ((array!66202 0))(
  ( (array!66203 (arr!31834 (Array (_ BitVec 32) (_ BitVec 64))) (size!32371 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66202)

(declare-datatypes ((List!22116 0))(
  ( (Nil!22113) (Cons!22112 (h!23330 (_ BitVec 64)) (t!31415 List!22116)) )
))
(declare-fun arrayNoDuplicates!0 (array!66202 (_ BitVec 32) List!22116) Bool)

(assert (=> b!1051178 (= res!699504 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22113))))

(declare-fun b!1051179 () Bool)

(declare-fun e!596538 () Bool)

(assert (=> b!1051179 (= e!596538 true)))

(declare-fun lt!464207 () Bool)

(declare-fun contains!6146 (List!22116 (_ BitVec 64)) Bool)

(assert (=> b!1051179 (= lt!464207 (contains!6146 Nil!22113 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!699499 () Bool)

(assert (=> start!92586 (=> (not res!699499) (not e!596544))))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> start!92586 (= res!699499 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32371 a!3488)) (bvslt (size!32371 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92586 e!596544))

(assert (=> start!92586 true))

(declare-fun array_inv!24616 (array!66202) Bool)

(assert (=> start!92586 (array_inv!24616 a!3488)))

(declare-fun b!1051180 () Bool)

(declare-fun lt!464206 () (_ BitVec 32))

(declare-fun e!596541 () Bool)

(declare-fun arrayContainsKey!0 (array!66202 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1051180 (= e!596541 (arrayContainsKey!0 a!3488 k0!2747 lt!464206))))

(declare-fun b!1051181 () Bool)

(declare-fun res!699500 () Bool)

(assert (=> b!1051181 (=> (not res!699500) (not e!596544))))

(assert (=> b!1051181 (= res!699500 (= (select (arr!31834 a!3488) i!1381) k0!2747))))

(declare-fun b!1051182 () Bool)

(declare-fun e!596539 () Bool)

(assert (=> b!1051182 (= e!596544 e!596539)))

(declare-fun res!699505 () Bool)

(assert (=> b!1051182 (=> (not res!699505) (not e!596539))))

(declare-fun lt!464205 () array!66202)

(assert (=> b!1051182 (= res!699505 (arrayContainsKey!0 lt!464205 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1051182 (= lt!464205 (array!66203 (store (arr!31834 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32371 a!3488)))))

(declare-fun b!1051183 () Bool)

(declare-fun res!699508 () Bool)

(assert (=> b!1051183 (=> res!699508 e!596538)))

(declare-fun noDuplicate!1522 (List!22116) Bool)

(assert (=> b!1051183 (= res!699508 (not (noDuplicate!1522 Nil!22113)))))

(declare-fun b!1051184 () Bool)

(declare-fun e!596545 () Bool)

(assert (=> b!1051184 (= e!596545 e!596538)))

(declare-fun res!699502 () Bool)

(assert (=> b!1051184 (=> res!699502 e!596538)))

(assert (=> b!1051184 (= res!699502 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32371 a!3488)))))

(assert (=> b!1051184 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34357 0))(
  ( (Unit!34358) )
))
(declare-fun lt!464203 () Unit!34357)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66202 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34357)

(assert (=> b!1051184 (= lt!464203 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!464206 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1051184 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22113)))

(declare-fun lt!464204 () Unit!34357)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66202 (_ BitVec 32) (_ BitVec 32)) Unit!34357)

(assert (=> b!1051184 (= lt!464204 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1051185 () Bool)

(declare-fun e!596540 () Bool)

(assert (=> b!1051185 (= e!596540 e!596541)))

(declare-fun res!699503 () Bool)

(assert (=> b!1051185 (=> res!699503 e!596541)))

(assert (=> b!1051185 (= res!699503 (bvsle lt!464206 i!1381))))

(declare-fun b!1051186 () Bool)

(declare-fun e!596543 () Bool)

(assert (=> b!1051186 (= e!596539 e!596543)))

(declare-fun res!699506 () Bool)

(assert (=> b!1051186 (=> (not res!699506) (not e!596543))))

(assert (=> b!1051186 (= res!699506 (not (= lt!464206 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66202 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1051186 (= lt!464206 (arrayScanForKey!0 lt!464205 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1051187 () Bool)

(assert (=> b!1051187 (= e!596543 (not e!596545))))

(declare-fun res!699498 () Bool)

(assert (=> b!1051187 (=> res!699498 e!596545)))

(assert (=> b!1051187 (= res!699498 (bvsle lt!464206 i!1381))))

(assert (=> b!1051187 e!596540))

(declare-fun res!699509 () Bool)

(assert (=> b!1051187 (=> (not res!699509) (not e!596540))))

(assert (=> b!1051187 (= res!699509 (= (select (store (arr!31834 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464206) k0!2747))))

(declare-fun b!1051188 () Bool)

(declare-fun res!699507 () Bool)

(assert (=> b!1051188 (=> res!699507 e!596538)))

(assert (=> b!1051188 (= res!699507 (contains!6146 Nil!22113 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!92586 res!699499) b!1051178))

(assert (= (and b!1051178 res!699504) b!1051177))

(assert (= (and b!1051177 res!699501) b!1051181))

(assert (= (and b!1051181 res!699500) b!1051182))

(assert (= (and b!1051182 res!699505) b!1051186))

(assert (= (and b!1051186 res!699506) b!1051187))

(assert (= (and b!1051187 res!699509) b!1051185))

(assert (= (and b!1051185 (not res!699503)) b!1051180))

(assert (= (and b!1051187 (not res!699498)) b!1051184))

(assert (= (and b!1051184 (not res!699502)) b!1051183))

(assert (= (and b!1051183 (not res!699508)) b!1051188))

(assert (= (and b!1051188 (not res!699507)) b!1051179))

(declare-fun m!972245 () Bool)

(assert (=> start!92586 m!972245))

(declare-fun m!972247 () Bool)

(assert (=> b!1051188 m!972247))

(declare-fun m!972249 () Bool)

(assert (=> b!1051183 m!972249))

(declare-fun m!972251 () Bool)

(assert (=> b!1051184 m!972251))

(declare-fun m!972253 () Bool)

(assert (=> b!1051184 m!972253))

(declare-fun m!972255 () Bool)

(assert (=> b!1051184 m!972255))

(declare-fun m!972257 () Bool)

(assert (=> b!1051184 m!972257))

(declare-fun m!972259 () Bool)

(assert (=> b!1051180 m!972259))

(declare-fun m!972261 () Bool)

(assert (=> b!1051177 m!972261))

(declare-fun m!972263 () Bool)

(assert (=> b!1051182 m!972263))

(declare-fun m!972265 () Bool)

(assert (=> b!1051182 m!972265))

(declare-fun m!972267 () Bool)

(assert (=> b!1051181 m!972267))

(assert (=> b!1051187 m!972265))

(declare-fun m!972269 () Bool)

(assert (=> b!1051187 m!972269))

(declare-fun m!972271 () Bool)

(assert (=> b!1051186 m!972271))

(declare-fun m!972273 () Bool)

(assert (=> b!1051179 m!972273))

(declare-fun m!972275 () Bool)

(assert (=> b!1051178 m!972275))

(check-sat (not b!1051186) (not b!1051179) (not b!1051188) (not b!1051182) (not b!1051180) (not start!92586) (not b!1051177) (not b!1051184) (not b!1051178) (not b!1051183))
(check-sat)
