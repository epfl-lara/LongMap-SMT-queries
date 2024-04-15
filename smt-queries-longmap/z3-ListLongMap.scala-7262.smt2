; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92752 () Bool)

(assert start!92752)

(declare-fun b!1053426 () Bool)

(declare-fun res!702493 () Bool)

(declare-fun e!598298 () Bool)

(assert (=> b!1053426 (=> (not res!702493) (not e!598298))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1053426 (= res!702493 (validKeyInArray!0 k0!2747))))

(declare-fun b!1053427 () Bool)

(declare-fun res!702495 () Bool)

(assert (=> b!1053427 (=> (not res!702495) (not e!598298))))

(declare-datatypes ((array!66386 0))(
  ( (array!66387 (arr!31926 (Array (_ BitVec 32) (_ BitVec 64))) (size!32464 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66386)

(declare-datatypes ((List!22297 0))(
  ( (Nil!22294) (Cons!22293 (h!23502 (_ BitVec 64)) (t!31595 List!22297)) )
))
(declare-fun arrayNoDuplicates!0 (array!66386 (_ BitVec 32) List!22297) Bool)

(assert (=> b!1053427 (= res!702495 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22294))))

(declare-fun b!1053428 () Bool)

(declare-fun e!598302 () Bool)

(assert (=> b!1053428 (= e!598302 (not true))))

(declare-fun e!598297 () Bool)

(assert (=> b!1053428 e!598297))

(declare-fun res!702494 () Bool)

(assert (=> b!1053428 (=> (not res!702494) (not e!598297))))

(declare-fun lt!464968 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1053428 (= res!702494 (= (select (store (arr!31926 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464968) k0!2747))))

(declare-fun b!1053429 () Bool)

(declare-fun e!598300 () Bool)

(declare-fun arrayContainsKey!0 (array!66386 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1053429 (= e!598300 (arrayContainsKey!0 a!3488 k0!2747 lt!464968))))

(declare-fun b!1053430 () Bool)

(declare-fun e!598299 () Bool)

(assert (=> b!1053430 (= e!598298 e!598299)))

(declare-fun res!702498 () Bool)

(assert (=> b!1053430 (=> (not res!702498) (not e!598299))))

(declare-fun lt!464967 () array!66386)

(assert (=> b!1053430 (= res!702498 (arrayContainsKey!0 lt!464967 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1053430 (= lt!464967 (array!66387 (store (arr!31926 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32464 a!3488)))))

(declare-fun res!702499 () Bool)

(assert (=> start!92752 (=> (not res!702499) (not e!598298))))

(assert (=> start!92752 (= res!702499 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32464 a!3488)) (bvslt (size!32464 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92752 e!598298))

(assert (=> start!92752 true))

(declare-fun array_inv!24709 (array!66386) Bool)

(assert (=> start!92752 (array_inv!24709 a!3488)))

(declare-fun b!1053431 () Bool)

(declare-fun res!702492 () Bool)

(assert (=> b!1053431 (=> (not res!702492) (not e!598298))))

(assert (=> b!1053431 (= res!702492 (= (select (arr!31926 a!3488) i!1381) k0!2747))))

(declare-fun b!1053432 () Bool)

(assert (=> b!1053432 (= e!598297 e!598300)))

(declare-fun res!702497 () Bool)

(assert (=> b!1053432 (=> res!702497 e!598300)))

(assert (=> b!1053432 (= res!702497 (bvsle lt!464968 i!1381))))

(declare-fun b!1053433 () Bool)

(assert (=> b!1053433 (= e!598299 e!598302)))

(declare-fun res!702496 () Bool)

(assert (=> b!1053433 (=> (not res!702496) (not e!598302))))

(assert (=> b!1053433 (= res!702496 (not (= lt!464968 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66386 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1053433 (= lt!464968 (arrayScanForKey!0 lt!464967 k0!2747 #b00000000000000000000000000000000))))

(assert (= (and start!92752 res!702499) b!1053427))

(assert (= (and b!1053427 res!702495) b!1053426))

(assert (= (and b!1053426 res!702493) b!1053431))

(assert (= (and b!1053431 res!702492) b!1053430))

(assert (= (and b!1053430 res!702498) b!1053433))

(assert (= (and b!1053433 res!702496) b!1053428))

(assert (= (and b!1053428 res!702494) b!1053432))

(assert (= (and b!1053432 (not res!702497)) b!1053429))

(declare-fun m!973213 () Bool)

(assert (=> b!1053427 m!973213))

(declare-fun m!973215 () Bool)

(assert (=> b!1053431 m!973215))

(declare-fun m!973217 () Bool)

(assert (=> b!1053433 m!973217))

(declare-fun m!973219 () Bool)

(assert (=> start!92752 m!973219))

(declare-fun m!973221 () Bool)

(assert (=> b!1053428 m!973221))

(declare-fun m!973223 () Bool)

(assert (=> b!1053428 m!973223))

(declare-fun m!973225 () Bool)

(assert (=> b!1053429 m!973225))

(declare-fun m!973227 () Bool)

(assert (=> b!1053426 m!973227))

(declare-fun m!973229 () Bool)

(assert (=> b!1053430 m!973229))

(assert (=> b!1053430 m!973221))

(check-sat (not b!1053426) (not b!1053429) (not b!1053430) (not b!1053433) (not b!1053427) (not start!92752))
(check-sat)
