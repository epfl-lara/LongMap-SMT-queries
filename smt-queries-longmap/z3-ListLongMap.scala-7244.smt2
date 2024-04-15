; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92524 () Bool)

(assert start!92524)

(declare-fun res!701476 () Bool)

(declare-fun e!597415 () Bool)

(assert (=> start!92524 (=> (not res!701476) (not e!597415))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66266 0))(
  ( (array!66267 (arr!31872 (Array (_ BitVec 32) (_ BitVec 64))) (size!32410 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66266)

(assert (=> start!92524 (= res!701476 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32410 a!3488)) (bvslt (size!32410 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92524 e!597415))

(assert (=> start!92524 true))

(declare-fun array_inv!24655 (array!66266) Bool)

(assert (=> start!92524 (array_inv!24655 a!3488)))

(declare-fun b!1052258 () Bool)

(declare-fun e!597414 () Bool)

(assert (=> b!1052258 (= e!597415 e!597414)))

(declare-fun res!701474 () Bool)

(assert (=> b!1052258 (=> (not res!701474) (not e!597414))))

(declare-fun lt!464548 () array!66266)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66266 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1052258 (= res!701474 (arrayContainsKey!0 lt!464548 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1052258 (= lt!464548 (array!66267 (store (arr!31872 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32410 a!3488)))))

(declare-fun b!1052259 () Bool)

(declare-fun res!701477 () Bool)

(assert (=> b!1052259 (=> (not res!701477) (not e!597415))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1052259 (= res!701477 (validKeyInArray!0 k0!2747))))

(declare-fun b!1052260 () Bool)

(declare-fun res!701468 () Bool)

(assert (=> b!1052260 (=> (not res!701468) (not e!597415))))

(declare-datatypes ((List!22243 0))(
  ( (Nil!22240) (Cons!22239 (h!23448 (_ BitVec 64)) (t!31541 List!22243)) )
))
(declare-fun arrayNoDuplicates!0 (array!66266 (_ BitVec 32) List!22243) Bool)

(assert (=> b!1052260 (= res!701468 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22240))))

(declare-fun b!1052261 () Bool)

(declare-fun e!597417 () Bool)

(declare-fun e!597418 () Bool)

(assert (=> b!1052261 (= e!597417 e!597418)))

(declare-fun res!701469 () Bool)

(assert (=> b!1052261 (=> res!701469 e!597418)))

(declare-fun lt!464545 () (_ BitVec 32))

(declare-fun lt!464546 () (_ BitVec 32))

(assert (=> b!1052261 (= res!701469 (or (bvslt lt!464545 #b00000000000000000000000000000000) (bvsge lt!464546 (size!32410 a!3488)) (bvsge lt!464545 (size!32410 a!3488))))))

(assert (=> b!1052261 (arrayContainsKey!0 a!3488 k0!2747 lt!464546)))

(declare-datatypes ((Unit!34349 0))(
  ( (Unit!34350) )
))
(declare-fun lt!464544 () Unit!34349)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66266 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34349)

(assert (=> b!1052261 (= lt!464544 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!464546))))

(assert (=> b!1052261 (= lt!464546 (bvadd #b00000000000000000000000000000001 lt!464545))))

(assert (=> b!1052261 (arrayNoDuplicates!0 a!3488 lt!464545 Nil!22240)))

(declare-fun lt!464547 () Unit!34349)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66266 (_ BitVec 32) (_ BitVec 32)) Unit!34349)

(assert (=> b!1052261 (= lt!464547 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464545))))

(declare-fun b!1052262 () Bool)

(declare-fun e!597413 () Bool)

(assert (=> b!1052262 (= e!597414 e!597413)))

(declare-fun res!701472 () Bool)

(assert (=> b!1052262 (=> (not res!701472) (not e!597413))))

(assert (=> b!1052262 (= res!701472 (not (= lt!464545 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66266 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1052262 (= lt!464545 (arrayScanForKey!0 lt!464548 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1052263 () Bool)

(declare-fun res!701473 () Bool)

(assert (=> b!1052263 (=> res!701473 e!597418)))

(declare-fun contains!6130 (List!22243 (_ BitVec 64)) Bool)

(assert (=> b!1052263 (= res!701473 (contains!6130 Nil!22240 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1052264 () Bool)

(assert (=> b!1052264 (= e!597413 (not e!597417))))

(declare-fun res!701478 () Bool)

(assert (=> b!1052264 (=> res!701478 e!597417)))

(assert (=> b!1052264 (= res!701478 (or (bvsgt lt!464545 i!1381) (bvsle i!1381 lt!464545)))))

(declare-fun e!597416 () Bool)

(assert (=> b!1052264 e!597416))

(declare-fun res!701471 () Bool)

(assert (=> b!1052264 (=> (not res!701471) (not e!597416))))

(assert (=> b!1052264 (= res!701471 (= (select (store (arr!31872 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464545) k0!2747))))

(declare-fun b!1052265 () Bool)

(declare-fun e!597419 () Bool)

(assert (=> b!1052265 (= e!597416 e!597419)))

(declare-fun res!701475 () Bool)

(assert (=> b!1052265 (=> res!701475 e!597419)))

(assert (=> b!1052265 (= res!701475 (or (bvsgt lt!464545 i!1381) (bvsle i!1381 lt!464545)))))

(declare-fun b!1052266 () Bool)

(declare-fun res!701479 () Bool)

(assert (=> b!1052266 (=> res!701479 e!597418)))

(declare-fun noDuplicate!1555 (List!22243) Bool)

(assert (=> b!1052266 (= res!701479 (not (noDuplicate!1555 Nil!22240)))))

(declare-fun b!1052267 () Bool)

(assert (=> b!1052267 (= e!597419 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1052268 () Bool)

(assert (=> b!1052268 (= e!597418 true)))

(declare-fun lt!464543 () Bool)

(assert (=> b!1052268 (= lt!464543 (contains!6130 Nil!22240 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1052269 () Bool)

(declare-fun res!701470 () Bool)

(assert (=> b!1052269 (=> (not res!701470) (not e!597415))))

(assert (=> b!1052269 (= res!701470 (= (select (arr!31872 a!3488) i!1381) k0!2747))))

(assert (= (and start!92524 res!701476) b!1052260))

(assert (= (and b!1052260 res!701468) b!1052259))

(assert (= (and b!1052259 res!701477) b!1052269))

(assert (= (and b!1052269 res!701470) b!1052258))

(assert (= (and b!1052258 res!701474) b!1052262))

(assert (= (and b!1052262 res!701472) b!1052264))

(assert (= (and b!1052264 res!701471) b!1052265))

(assert (= (and b!1052265 (not res!701475)) b!1052267))

(assert (= (and b!1052264 (not res!701478)) b!1052261))

(assert (= (and b!1052261 (not res!701469)) b!1052266))

(assert (= (and b!1052266 (not res!701479)) b!1052263))

(assert (= (and b!1052263 (not res!701473)) b!1052268))

(declare-fun m!972175 () Bool)

(assert (=> b!1052260 m!972175))

(declare-fun m!972177 () Bool)

(assert (=> start!92524 m!972177))

(declare-fun m!972179 () Bool)

(assert (=> b!1052258 m!972179))

(declare-fun m!972181 () Bool)

(assert (=> b!1052258 m!972181))

(declare-fun m!972183 () Bool)

(assert (=> b!1052263 m!972183))

(declare-fun m!972185 () Bool)

(assert (=> b!1052266 m!972185))

(assert (=> b!1052264 m!972181))

(declare-fun m!972187 () Bool)

(assert (=> b!1052264 m!972187))

(declare-fun m!972189 () Bool)

(assert (=> b!1052269 m!972189))

(declare-fun m!972191 () Bool)

(assert (=> b!1052267 m!972191))

(declare-fun m!972193 () Bool)

(assert (=> b!1052261 m!972193))

(declare-fun m!972195 () Bool)

(assert (=> b!1052261 m!972195))

(declare-fun m!972197 () Bool)

(assert (=> b!1052261 m!972197))

(declare-fun m!972199 () Bool)

(assert (=> b!1052261 m!972199))

(declare-fun m!972201 () Bool)

(assert (=> b!1052259 m!972201))

(declare-fun m!972203 () Bool)

(assert (=> b!1052262 m!972203))

(declare-fun m!972205 () Bool)

(assert (=> b!1052268 m!972205))

(check-sat (not b!1052260) (not b!1052266) (not b!1052261) (not b!1052262) (not b!1052263) (not b!1052259) (not b!1052268) (not start!92524) (not b!1052258) (not b!1052267))
(check-sat)
