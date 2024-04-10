; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92438 () Bool)

(assert start!92438)

(declare-fun b!1051003 () Bool)

(declare-fun res!700134 () Bool)

(declare-fun e!596512 () Bool)

(assert (=> b!1051003 (=> (not res!700134) (not e!596512))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66239 0))(
  ( (array!66240 (arr!31859 (Array (_ BitVec 32) (_ BitVec 64))) (size!32395 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66239)

(assert (=> b!1051003 (= res!700134 (= (select (arr!31859 a!3488) i!1381) k0!2747))))

(declare-fun b!1051004 () Bool)

(declare-fun e!596515 () Bool)

(declare-fun e!596510 () Bool)

(assert (=> b!1051004 (= e!596515 e!596510)))

(declare-fun res!700133 () Bool)

(assert (=> b!1051004 (=> res!700133 e!596510)))

(declare-fun lt!464129 () (_ BitVec 32))

(assert (=> b!1051004 (= res!700133 (or (bvsgt lt!464129 i!1381) (bvsle i!1381 lt!464129)))))

(declare-fun res!700135 () Bool)

(assert (=> start!92438 (=> (not res!700135) (not e!596512))))

(assert (=> start!92438 (= res!700135 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32395 a!3488)) (bvslt (size!32395 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92438 e!596512))

(assert (=> start!92438 true))

(declare-fun array_inv!24639 (array!66239) Bool)

(assert (=> start!92438 (array_inv!24639 a!3488)))

(declare-fun b!1051005 () Bool)

(declare-fun e!596511 () Bool)

(assert (=> b!1051005 (= e!596512 e!596511)))

(declare-fun res!700132 () Bool)

(assert (=> b!1051005 (=> (not res!700132) (not e!596511))))

(declare-fun lt!464130 () array!66239)

(declare-fun arrayContainsKey!0 (array!66239 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1051005 (= res!700132 (arrayContainsKey!0 lt!464130 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1051005 (= lt!464130 (array!66240 (store (arr!31859 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32395 a!3488)))))

(declare-fun b!1051006 () Bool)

(declare-fun e!596513 () Bool)

(assert (=> b!1051006 (= e!596513 (not true))))

(assert (=> b!1051006 e!596515))

(declare-fun res!700131 () Bool)

(assert (=> b!1051006 (=> (not res!700131) (not e!596515))))

(assert (=> b!1051006 (= res!700131 (= (select (store (arr!31859 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464129) k0!2747))))

(declare-fun b!1051007 () Bool)

(declare-fun res!700130 () Bool)

(assert (=> b!1051007 (=> (not res!700130) (not e!596512))))

(declare-datatypes ((List!22171 0))(
  ( (Nil!22168) (Cons!22167 (h!23376 (_ BitVec 64)) (t!31478 List!22171)) )
))
(declare-fun arrayNoDuplicates!0 (array!66239 (_ BitVec 32) List!22171) Bool)

(assert (=> b!1051007 (= res!700130 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22168))))

(declare-fun b!1051008 () Bool)

(assert (=> b!1051008 (= e!596511 e!596513)))

(declare-fun res!700129 () Bool)

(assert (=> b!1051008 (=> (not res!700129) (not e!596513))))

(assert (=> b!1051008 (= res!700129 (not (= lt!464129 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66239 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1051008 (= lt!464129 (arrayScanForKey!0 lt!464130 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1051009 () Bool)

(declare-fun res!700136 () Bool)

(assert (=> b!1051009 (=> (not res!700136) (not e!596512))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1051009 (= res!700136 (validKeyInArray!0 k0!2747))))

(declare-fun b!1051010 () Bool)

(assert (=> b!1051010 (= e!596510 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(assert (= (and start!92438 res!700135) b!1051007))

(assert (= (and b!1051007 res!700130) b!1051009))

(assert (= (and b!1051009 res!700136) b!1051003))

(assert (= (and b!1051003 res!700134) b!1051005))

(assert (= (and b!1051005 res!700132) b!1051008))

(assert (= (and b!1051008 res!700129) b!1051006))

(assert (= (and b!1051006 res!700131) b!1051004))

(assert (= (and b!1051004 (not res!700133)) b!1051010))

(declare-fun m!971591 () Bool)

(assert (=> b!1051008 m!971591))

(declare-fun m!971593 () Bool)

(assert (=> b!1051005 m!971593))

(declare-fun m!971595 () Bool)

(assert (=> b!1051005 m!971595))

(declare-fun m!971597 () Bool)

(assert (=> b!1051003 m!971597))

(assert (=> b!1051006 m!971595))

(declare-fun m!971599 () Bool)

(assert (=> b!1051006 m!971599))

(declare-fun m!971601 () Bool)

(assert (=> b!1051009 m!971601))

(declare-fun m!971603 () Bool)

(assert (=> start!92438 m!971603))

(declare-fun m!971605 () Bool)

(assert (=> b!1051010 m!971605))

(declare-fun m!971607 () Bool)

(assert (=> b!1051007 m!971607))

(check-sat (not b!1051005) (not b!1051007) (not b!1051008) (not b!1051010) (not b!1051009) (not start!92438))
