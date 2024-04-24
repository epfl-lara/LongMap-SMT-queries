; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93456 () Bool)

(assert start!93456)

(declare-fun b!1058230 () Bool)

(declare-fun res!706129 () Bool)

(declare-fun e!601807 () Bool)

(assert (=> b!1058230 (=> (not res!706129) (not e!601807))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1058230 (= res!706129 (validKeyInArray!0 k0!2747))))

(declare-fun b!1058231 () Bool)

(declare-fun res!706128 () Bool)

(assert (=> b!1058231 (=> (not res!706128) (not e!601807))))

(declare-datatypes ((array!66709 0))(
  ( (array!66710 (arr!32071 (Array (_ BitVec 32) (_ BitVec 64))) (size!32608 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66709)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1058231 (= res!706128 (= (select (arr!32071 a!3488) i!1381) k0!2747))))

(declare-fun b!1058232 () Bool)

(declare-fun e!601810 () Bool)

(assert (=> b!1058232 (= e!601807 e!601810)))

(declare-fun res!706132 () Bool)

(assert (=> b!1058232 (=> (not res!706132) (not e!601810))))

(declare-fun lt!466750 () array!66709)

(declare-fun arrayContainsKey!0 (array!66709 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058232 (= res!706132 (arrayContainsKey!0 lt!466750 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1058232 (= lt!466750 (array!66710 (store (arr!32071 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32608 a!3488)))))

(declare-fun b!1058234 () Bool)

(declare-fun e!601813 () Bool)

(assert (=> b!1058234 (= e!601810 e!601813)))

(declare-fun res!706133 () Bool)

(assert (=> b!1058234 (=> (not res!706133) (not e!601813))))

(declare-fun lt!466749 () (_ BitVec 32))

(assert (=> b!1058234 (= res!706133 (not (= lt!466749 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66709 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1058234 (= lt!466749 (arrayScanForKey!0 lt!466750 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1058235 () Bool)

(declare-fun e!601811 () Bool)

(assert (=> b!1058235 (= e!601811 true)))

(declare-datatypes ((List!22353 0))(
  ( (Nil!22350) (Cons!22349 (h!23567 (_ BitVec 64)) (t!31652 List!22353)) )
))
(declare-fun arrayNoDuplicates!0 (array!66709 (_ BitVec 32) List!22353) Bool)

(assert (=> b!1058235 (arrayNoDuplicates!0 a!3488 lt!466749 Nil!22350)))

(declare-datatypes ((Unit!34633 0))(
  ( (Unit!34634) )
))
(declare-fun lt!466751 () Unit!34633)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66709 (_ BitVec 32) (_ BitVec 32)) Unit!34633)

(assert (=> b!1058235 (= lt!466751 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466749))))

(declare-fun b!1058236 () Bool)

(declare-fun res!706125 () Bool)

(assert (=> b!1058236 (=> (not res!706125) (not e!601807))))

(assert (=> b!1058236 (= res!706125 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22350))))

(declare-fun b!1058237 () Bool)

(assert (=> b!1058237 (= e!601813 (not e!601811))))

(declare-fun res!706130 () Bool)

(assert (=> b!1058237 (=> res!706130 e!601811)))

(assert (=> b!1058237 (= res!706130 (or (bvsgt lt!466749 i!1381) (bvsle i!1381 lt!466749)))))

(declare-fun e!601809 () Bool)

(assert (=> b!1058237 e!601809))

(declare-fun res!706131 () Bool)

(assert (=> b!1058237 (=> (not res!706131) (not e!601809))))

(assert (=> b!1058237 (= res!706131 (= (select (store (arr!32071 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466749) k0!2747))))

(declare-fun b!1058238 () Bool)

(declare-fun e!601812 () Bool)

(assert (=> b!1058238 (= e!601809 e!601812)))

(declare-fun res!706127 () Bool)

(assert (=> b!1058238 (=> res!706127 e!601812)))

(assert (=> b!1058238 (= res!706127 (or (bvsgt lt!466749 i!1381) (bvsle i!1381 lt!466749)))))

(declare-fun res!706126 () Bool)

(assert (=> start!93456 (=> (not res!706126) (not e!601807))))

(assert (=> start!93456 (= res!706126 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32608 a!3488)) (bvslt (size!32608 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93456 e!601807))

(assert (=> start!93456 true))

(declare-fun array_inv!24853 (array!66709) Bool)

(assert (=> start!93456 (array_inv!24853 a!3488)))

(declare-fun b!1058233 () Bool)

(assert (=> b!1058233 (= e!601812 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(assert (= (and start!93456 res!706126) b!1058236))

(assert (= (and b!1058236 res!706125) b!1058230))

(assert (= (and b!1058230 res!706129) b!1058231))

(assert (= (and b!1058231 res!706128) b!1058232))

(assert (= (and b!1058232 res!706132) b!1058234))

(assert (= (and b!1058234 res!706133) b!1058237))

(assert (= (and b!1058237 res!706131) b!1058238))

(assert (= (and b!1058238 (not res!706127)) b!1058233))

(assert (= (and b!1058237 (not res!706130)) b!1058235))

(declare-fun m!978335 () Bool)

(assert (=> b!1058233 m!978335))

(declare-fun m!978337 () Bool)

(assert (=> b!1058236 m!978337))

(declare-fun m!978339 () Bool)

(assert (=> start!93456 m!978339))

(declare-fun m!978341 () Bool)

(assert (=> b!1058232 m!978341))

(declare-fun m!978343 () Bool)

(assert (=> b!1058232 m!978343))

(declare-fun m!978345 () Bool)

(assert (=> b!1058235 m!978345))

(declare-fun m!978347 () Bool)

(assert (=> b!1058235 m!978347))

(declare-fun m!978349 () Bool)

(assert (=> b!1058234 m!978349))

(declare-fun m!978351 () Bool)

(assert (=> b!1058230 m!978351))

(declare-fun m!978353 () Bool)

(assert (=> b!1058231 m!978353))

(assert (=> b!1058237 m!978343))

(declare-fun m!978355 () Bool)

(assert (=> b!1058237 m!978355))

(check-sat (not b!1058232) (not b!1058234) (not b!1058235) (not b!1058230) (not start!93456) (not b!1058233) (not b!1058236))
(check-sat)
