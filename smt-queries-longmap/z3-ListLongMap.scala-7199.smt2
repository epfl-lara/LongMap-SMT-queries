; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92254 () Bool)

(assert start!92254)

(declare-fun b!1048317 () Bool)

(declare-fun res!697528 () Bool)

(declare-fun e!594594 () Bool)

(assert (=> b!1048317 (=> (not res!697528) (not e!594594))))

(declare-datatypes ((array!65996 0))(
  ( (array!65997 (arr!31737 (Array (_ BitVec 32) (_ BitVec 64))) (size!32275 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!65996)

(declare-datatypes ((List!22108 0))(
  ( (Nil!22105) (Cons!22104 (h!23313 (_ BitVec 64)) (t!31406 List!22108)) )
))
(declare-fun arrayNoDuplicates!0 (array!65996 (_ BitVec 32) List!22108) Bool)

(assert (=> b!1048317 (= res!697528 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22105))))

(declare-fun b!1048318 () Bool)

(declare-fun e!594593 () Bool)

(declare-fun e!594592 () Bool)

(assert (=> b!1048318 (= e!594593 e!594592)))

(declare-fun res!697533 () Bool)

(assert (=> b!1048318 (=> (not res!697533) (not e!594592))))

(declare-fun lt!463006 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1048318 (= res!697533 (not (= lt!463006 i!1381)))))

(declare-fun lt!463005 () array!65996)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!65996 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1048318 (= lt!463006 (arrayScanForKey!0 lt!463005 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1048319 () Bool)

(declare-fun res!697530 () Bool)

(assert (=> b!1048319 (=> (not res!697530) (not e!594594))))

(assert (=> b!1048319 (= res!697530 (= (select (arr!31737 a!3488) i!1381) k0!2747))))

(declare-fun b!1048320 () Bool)

(declare-fun res!697532 () Bool)

(assert (=> b!1048320 (=> (not res!697532) (not e!594594))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1048320 (= res!697532 (validKeyInArray!0 k0!2747))))

(declare-fun b!1048321 () Bool)

(assert (=> b!1048321 (= e!594592 (not true))))

(declare-fun e!594595 () Bool)

(assert (=> b!1048321 e!594595))

(declare-fun res!697529 () Bool)

(assert (=> b!1048321 (=> (not res!697529) (not e!594595))))

(assert (=> b!1048321 (= res!697529 (= (select (store (arr!31737 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463006) k0!2747))))

(declare-fun res!697531 () Bool)

(assert (=> start!92254 (=> (not res!697531) (not e!594594))))

(assert (=> start!92254 (= res!697531 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32275 a!3488)) (bvslt (size!32275 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92254 e!594594))

(assert (=> start!92254 true))

(declare-fun array_inv!24520 (array!65996) Bool)

(assert (=> start!92254 (array_inv!24520 a!3488)))

(declare-fun b!1048322 () Bool)

(declare-fun e!594597 () Bool)

(declare-fun arrayContainsKey!0 (array!65996 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1048322 (= e!594597 (arrayContainsKey!0 a!3488 k0!2747 lt!463006))))

(declare-fun b!1048323 () Bool)

(assert (=> b!1048323 (= e!594594 e!594593)))

(declare-fun res!697527 () Bool)

(assert (=> b!1048323 (=> (not res!697527) (not e!594593))))

(assert (=> b!1048323 (= res!697527 (arrayContainsKey!0 lt!463005 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1048323 (= lt!463005 (array!65997 (store (arr!31737 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32275 a!3488)))))

(declare-fun b!1048324 () Bool)

(assert (=> b!1048324 (= e!594595 e!594597)))

(declare-fun res!697534 () Bool)

(assert (=> b!1048324 (=> res!697534 e!594597)))

(assert (=> b!1048324 (= res!697534 (bvsle lt!463006 i!1381))))

(assert (= (and start!92254 res!697531) b!1048317))

(assert (= (and b!1048317 res!697528) b!1048320))

(assert (= (and b!1048320 res!697532) b!1048319))

(assert (= (and b!1048319 res!697530) b!1048323))

(assert (= (and b!1048323 res!697527) b!1048318))

(assert (= (and b!1048318 res!697533) b!1048321))

(assert (= (and b!1048321 res!697529) b!1048324))

(assert (= (and b!1048324 (not res!697534)) b!1048322))

(declare-fun m!968815 () Bool)

(assert (=> b!1048317 m!968815))

(declare-fun m!968817 () Bool)

(assert (=> b!1048322 m!968817))

(declare-fun m!968819 () Bool)

(assert (=> b!1048320 m!968819))

(declare-fun m!968821 () Bool)

(assert (=> b!1048321 m!968821))

(declare-fun m!968823 () Bool)

(assert (=> b!1048321 m!968823))

(declare-fun m!968825 () Bool)

(assert (=> b!1048323 m!968825))

(assert (=> b!1048323 m!968821))

(declare-fun m!968827 () Bool)

(assert (=> start!92254 m!968827))

(declare-fun m!968829 () Bool)

(assert (=> b!1048319 m!968829))

(declare-fun m!968831 () Bool)

(assert (=> b!1048318 m!968831))

(check-sat (not b!1048317) (not b!1048322) (not start!92254) (not b!1048320) (not b!1048318) (not b!1048323))
(check-sat)
