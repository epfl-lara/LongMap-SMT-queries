; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92670 () Bool)

(assert start!92670)

(declare-fun b!1052294 () Bool)

(declare-fun res!700617 () Bool)

(declare-fun e!597338 () Bool)

(assert (=> b!1052294 (=> (not res!700617) (not e!597338))))

(declare-datatypes ((array!66286 0))(
  ( (array!66287 (arr!31876 (Array (_ BitVec 32) (_ BitVec 64))) (size!32413 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66286)

(declare-datatypes ((List!22158 0))(
  ( (Nil!22155) (Cons!22154 (h!23372 (_ BitVec 64)) (t!31457 List!22158)) )
))
(declare-fun arrayNoDuplicates!0 (array!66286 (_ BitVec 32) List!22158) Bool)

(assert (=> b!1052294 (= res!700617 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22155))))

(declare-fun e!597339 () Bool)

(declare-fun b!1052295 () Bool)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!66286 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1052295 (= e!597339 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1052296 () Bool)

(declare-fun res!700622 () Bool)

(assert (=> b!1052296 (=> (not res!700622) (not e!597338))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1052296 (= res!700622 (validKeyInArray!0 k0!2747))))

(declare-fun res!700620 () Bool)

(assert (=> start!92670 (=> (not res!700620) (not e!597338))))

(assert (=> start!92670 (= res!700620 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32413 a!3488)) (bvslt (size!32413 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92670 e!597338))

(assert (=> start!92670 true))

(declare-fun array_inv!24658 (array!66286) Bool)

(assert (=> start!92670 (array_inv!24658 a!3488)))

(declare-fun b!1052297 () Bool)

(declare-fun e!597337 () Bool)

(assert (=> b!1052297 (= e!597338 e!597337)))

(declare-fun res!700615 () Bool)

(assert (=> b!1052297 (=> (not res!700615) (not e!597337))))

(declare-fun lt!464639 () array!66286)

(assert (=> b!1052297 (= res!700615 (arrayContainsKey!0 lt!464639 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1052297 (= lt!464639 (array!66287 (store (arr!31876 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32413 a!3488)))))

(declare-fun b!1052298 () Bool)

(declare-fun e!597335 () Bool)

(assert (=> b!1052298 (= e!597337 e!597335)))

(declare-fun res!700619 () Bool)

(assert (=> b!1052298 (=> (not res!700619) (not e!597335))))

(declare-fun lt!464638 () (_ BitVec 32))

(assert (=> b!1052298 (= res!700619 (not (= lt!464638 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66286 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1052298 (= lt!464638 (arrayScanForKey!0 lt!464639 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1052299 () Bool)

(assert (=> b!1052299 (= e!597335 (not true))))

(declare-fun e!597336 () Bool)

(assert (=> b!1052299 e!597336))

(declare-fun res!700618 () Bool)

(assert (=> b!1052299 (=> (not res!700618) (not e!597336))))

(assert (=> b!1052299 (= res!700618 (= (select (store (arr!31876 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464638) k0!2747))))

(declare-fun b!1052300 () Bool)

(assert (=> b!1052300 (= e!597336 e!597339)))

(declare-fun res!700621 () Bool)

(assert (=> b!1052300 (=> res!700621 e!597339)))

(assert (=> b!1052300 (= res!700621 (or (bvsgt lt!464638 i!1381) (bvsle i!1381 lt!464638)))))

(declare-fun b!1052301 () Bool)

(declare-fun res!700616 () Bool)

(assert (=> b!1052301 (=> (not res!700616) (not e!597338))))

(assert (=> b!1052301 (= res!700616 (= (select (arr!31876 a!3488) i!1381) k0!2747))))

(assert (= (and start!92670 res!700620) b!1052294))

(assert (= (and b!1052294 res!700617) b!1052296))

(assert (= (and b!1052296 res!700622) b!1052301))

(assert (= (and b!1052301 res!700616) b!1052297))

(assert (= (and b!1052297 res!700615) b!1052298))

(assert (= (and b!1052298 res!700619) b!1052299))

(assert (= (and b!1052299 res!700618) b!1052300))

(assert (= (and b!1052300 (not res!700621)) b!1052295))

(declare-fun m!973241 () Bool)

(assert (=> b!1052299 m!973241))

(declare-fun m!973243 () Bool)

(assert (=> b!1052299 m!973243))

(declare-fun m!973245 () Bool)

(assert (=> b!1052296 m!973245))

(declare-fun m!973247 () Bool)

(assert (=> b!1052297 m!973247))

(assert (=> b!1052297 m!973241))

(declare-fun m!973249 () Bool)

(assert (=> b!1052294 m!973249))

(declare-fun m!973251 () Bool)

(assert (=> b!1052301 m!973251))

(declare-fun m!973253 () Bool)

(assert (=> start!92670 m!973253))

(declare-fun m!973255 () Bool)

(assert (=> b!1052295 m!973255))

(declare-fun m!973257 () Bool)

(assert (=> b!1052298 m!973257))

(check-sat (not b!1052297) (not start!92670) (not b!1052295) (not b!1052296) (not b!1052298) (not b!1052294))
(check-sat)
