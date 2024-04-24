; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92664 () Bool)

(assert start!92664)

(declare-fun b!1052222 () Bool)

(declare-fun res!700549 () Bool)

(declare-fun e!597281 () Bool)

(assert (=> b!1052222 (=> (not res!700549) (not e!597281))))

(declare-datatypes ((array!66280 0))(
  ( (array!66281 (arr!31873 (Array (_ BitVec 32) (_ BitVec 64))) (size!32410 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66280)

(declare-fun i!1381 () (_ BitVec 32))

(declare-fun k0!2747 () (_ BitVec 64))

(assert (=> b!1052222 (= res!700549 (= (select (arr!31873 a!3488) i!1381) k0!2747))))

(declare-fun b!1052223 () Bool)

(declare-fun res!700545 () Bool)

(assert (=> b!1052223 (=> (not res!700545) (not e!597281))))

(declare-datatypes ((List!22155 0))(
  ( (Nil!22152) (Cons!22151 (h!23369 (_ BitVec 64)) (t!31454 List!22155)) )
))
(declare-fun arrayNoDuplicates!0 (array!66280 (_ BitVec 32) List!22155) Bool)

(assert (=> b!1052223 (= res!700545 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22152))))

(declare-fun res!700543 () Bool)

(assert (=> start!92664 (=> (not res!700543) (not e!597281))))

(assert (=> start!92664 (= res!700543 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32410 a!3488)) (bvslt (size!32410 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92664 e!597281))

(assert (=> start!92664 true))

(declare-fun array_inv!24655 (array!66280) Bool)

(assert (=> start!92664 (array_inv!24655 a!3488)))

(declare-fun b!1052224 () Bool)

(declare-fun e!597286 () Bool)

(declare-fun e!597285 () Bool)

(assert (=> b!1052224 (= e!597286 e!597285)))

(declare-fun res!700544 () Bool)

(assert (=> b!1052224 (=> res!700544 e!597285)))

(declare-fun lt!464620 () (_ BitVec 32))

(assert (=> b!1052224 (= res!700544 (or (bvsgt lt!464620 i!1381) (bvsle i!1381 lt!464620)))))

(declare-fun b!1052225 () Bool)

(declare-fun e!597283 () Bool)

(assert (=> b!1052225 (= e!597283 (not true))))

(assert (=> b!1052225 e!597286))

(declare-fun res!700547 () Bool)

(assert (=> b!1052225 (=> (not res!700547) (not e!597286))))

(assert (=> b!1052225 (= res!700547 (= (select (store (arr!31873 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464620) k0!2747))))

(declare-fun b!1052226 () Bool)

(declare-fun res!700546 () Bool)

(assert (=> b!1052226 (=> (not res!700546) (not e!597281))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1052226 (= res!700546 (validKeyInArray!0 k0!2747))))

(declare-fun b!1052227 () Bool)

(declare-fun arrayContainsKey!0 (array!66280 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1052227 (= e!597285 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1052228 () Bool)

(declare-fun e!597284 () Bool)

(assert (=> b!1052228 (= e!597284 e!597283)))

(declare-fun res!700548 () Bool)

(assert (=> b!1052228 (=> (not res!700548) (not e!597283))))

(assert (=> b!1052228 (= res!700548 (not (= lt!464620 i!1381)))))

(declare-fun lt!464621 () array!66280)

(declare-fun arrayScanForKey!0 (array!66280 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1052228 (= lt!464620 (arrayScanForKey!0 lt!464621 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1052229 () Bool)

(assert (=> b!1052229 (= e!597281 e!597284)))

(declare-fun res!700550 () Bool)

(assert (=> b!1052229 (=> (not res!700550) (not e!597284))))

(assert (=> b!1052229 (= res!700550 (arrayContainsKey!0 lt!464621 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1052229 (= lt!464621 (array!66281 (store (arr!31873 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32410 a!3488)))))

(assert (= (and start!92664 res!700543) b!1052223))

(assert (= (and b!1052223 res!700545) b!1052226))

(assert (= (and b!1052226 res!700546) b!1052222))

(assert (= (and b!1052222 res!700549) b!1052229))

(assert (= (and b!1052229 res!700550) b!1052228))

(assert (= (and b!1052228 res!700548) b!1052225))

(assert (= (and b!1052225 res!700547) b!1052224))

(assert (= (and b!1052224 (not res!700544)) b!1052227))

(declare-fun m!973187 () Bool)

(assert (=> b!1052227 m!973187))

(declare-fun m!973189 () Bool)

(assert (=> b!1052225 m!973189))

(declare-fun m!973191 () Bool)

(assert (=> b!1052225 m!973191))

(declare-fun m!973193 () Bool)

(assert (=> b!1052229 m!973193))

(assert (=> b!1052229 m!973189))

(declare-fun m!973195 () Bool)

(assert (=> b!1052226 m!973195))

(declare-fun m!973197 () Bool)

(assert (=> b!1052228 m!973197))

(declare-fun m!973199 () Bool)

(assert (=> b!1052223 m!973199))

(declare-fun m!973201 () Bool)

(assert (=> start!92664 m!973201))

(declare-fun m!973203 () Bool)

(assert (=> b!1052222 m!973203))

(check-sat (not b!1052229) (not start!92664) (not b!1052228) (not b!1052227) (not b!1052226) (not b!1052223))
(check-sat)
