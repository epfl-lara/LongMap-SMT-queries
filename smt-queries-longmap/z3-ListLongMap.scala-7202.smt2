; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92508 () Bool)

(assert start!92508)

(declare-fun res!698325 () Bool)

(declare-fun e!595689 () Bool)

(assert (=> start!92508 (=> (not res!698325) (not e!595689))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66124 0))(
  ( (array!66125 (arr!31795 (Array (_ BitVec 32) (_ BitVec 64))) (size!32332 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66124)

(assert (=> start!92508 (= res!698325 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32332 a!3488)) (bvslt (size!32332 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92508 e!595689))

(assert (=> start!92508 true))

(declare-fun array_inv!24577 (array!66124) Bool)

(assert (=> start!92508 (array_inv!24577 a!3488)))

(declare-fun b!1049999 () Bool)

(declare-fun e!595691 () Bool)

(declare-fun e!595693 () Bool)

(assert (=> b!1049999 (= e!595691 e!595693)))

(declare-fun res!698322 () Bool)

(assert (=> b!1049999 (=> (not res!698322) (not e!595693))))

(declare-fun lt!463774 () (_ BitVec 32))

(assert (=> b!1049999 (= res!698322 (not (= lt!463774 i!1381)))))

(declare-fun lt!463775 () array!66124)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66124 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1049999 (= lt!463774 (arrayScanForKey!0 lt!463775 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1050000 () Bool)

(declare-fun res!698327 () Bool)

(assert (=> b!1050000 (=> (not res!698327) (not e!595689))))

(declare-datatypes ((List!22077 0))(
  ( (Nil!22074) (Cons!22073 (h!23291 (_ BitVec 64)) (t!31376 List!22077)) )
))
(declare-fun arrayNoDuplicates!0 (array!66124 (_ BitVec 32) List!22077) Bool)

(assert (=> b!1050000 (= res!698327 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22074))))

(declare-fun b!1050001 () Bool)

(declare-fun res!698326 () Bool)

(assert (=> b!1050001 (=> (not res!698326) (not e!595689))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050001 (= res!698326 (validKeyInArray!0 k0!2747))))

(declare-fun e!595688 () Bool)

(declare-fun b!1050002 () Bool)

(declare-fun arrayContainsKey!0 (array!66124 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050002 (= e!595688 (arrayContainsKey!0 a!3488 k0!2747 lt!463774))))

(declare-fun b!1050003 () Bool)

(declare-fun e!595692 () Bool)

(assert (=> b!1050003 (= e!595692 e!595688)))

(declare-fun res!698324 () Bool)

(assert (=> b!1050003 (=> res!698324 e!595688)))

(assert (=> b!1050003 (= res!698324 (bvsle lt!463774 i!1381))))

(declare-fun b!1050004 () Bool)

(declare-fun res!698320 () Bool)

(assert (=> b!1050004 (=> (not res!698320) (not e!595689))))

(assert (=> b!1050004 (= res!698320 (= (select (arr!31795 a!3488) i!1381) k0!2747))))

(declare-fun b!1050005 () Bool)

(assert (=> b!1050005 (= e!595689 e!595691)))

(declare-fun res!698323 () Bool)

(assert (=> b!1050005 (=> (not res!698323) (not e!595691))))

(assert (=> b!1050005 (= res!698323 (arrayContainsKey!0 lt!463775 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1050005 (= lt!463775 (array!66125 (store (arr!31795 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32332 a!3488)))))

(declare-fun b!1050006 () Bool)

(assert (=> b!1050006 (= e!595693 (not true))))

(assert (=> b!1050006 e!595692))

(declare-fun res!698321 () Bool)

(assert (=> b!1050006 (=> (not res!698321) (not e!595692))))

(assert (=> b!1050006 (= res!698321 (= (select (store (arr!31795 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463774) k0!2747))))

(assert (= (and start!92508 res!698325) b!1050000))

(assert (= (and b!1050000 res!698327) b!1050001))

(assert (= (and b!1050001 res!698326) b!1050004))

(assert (= (and b!1050004 res!698320) b!1050005))

(assert (= (and b!1050005 res!698323) b!1049999))

(assert (= (and b!1049999 res!698322) b!1050006))

(assert (= (and b!1050006 res!698321) b!1050003))

(assert (= (and b!1050003 (not res!698324)) b!1050002))

(declare-fun m!971261 () Bool)

(assert (=> b!1049999 m!971261))

(declare-fun m!971263 () Bool)

(assert (=> b!1050004 m!971263))

(declare-fun m!971265 () Bool)

(assert (=> start!92508 m!971265))

(declare-fun m!971267 () Bool)

(assert (=> b!1050005 m!971267))

(declare-fun m!971269 () Bool)

(assert (=> b!1050005 m!971269))

(declare-fun m!971271 () Bool)

(assert (=> b!1050001 m!971271))

(assert (=> b!1050006 m!971269))

(declare-fun m!971273 () Bool)

(assert (=> b!1050006 m!971273))

(declare-fun m!971275 () Bool)

(assert (=> b!1050002 m!971275))

(declare-fun m!971277 () Bool)

(assert (=> b!1050000 m!971277))

(check-sat (not b!1050000) (not b!1050002) (not b!1050005) (not b!1049999) (not start!92508) (not b!1050001))
(check-sat)
