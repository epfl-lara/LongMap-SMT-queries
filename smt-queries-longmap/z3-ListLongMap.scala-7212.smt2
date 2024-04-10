; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92336 () Bool)

(assert start!92336)

(declare-datatypes ((array!66137 0))(
  ( (array!66138 (arr!31808 (Array (_ BitVec 32) (_ BitVec 64))) (size!32344 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66137)

(declare-fun e!595506 () Bool)

(declare-fun b!1049574 () Bool)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun lt!463571 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!66137 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1049574 (= e!595506 (arrayContainsKey!0 a!3488 k0!2747 lt!463571))))

(declare-fun b!1049575 () Bool)

(declare-fun res!698702 () Bool)

(declare-fun e!595507 () Bool)

(assert (=> b!1049575 (=> (not res!698702) (not e!595507))))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1049575 (= res!698702 (= (select (arr!31808 a!3488) i!1381) k0!2747))))

(declare-fun res!698709 () Bool)

(assert (=> start!92336 (=> (not res!698709) (not e!595507))))

(assert (=> start!92336 (= res!698709 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32344 a!3488)) (bvslt (size!32344 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92336 e!595507))

(assert (=> start!92336 true))

(declare-fun array_inv!24588 (array!66137) Bool)

(assert (=> start!92336 (array_inv!24588 a!3488)))

(declare-fun b!1049576 () Bool)

(declare-fun e!595503 () Bool)

(assert (=> b!1049576 (= e!595503 true)))

(declare-fun lt!463569 () Bool)

(declare-datatypes ((List!22120 0))(
  ( (Nil!22117) (Cons!22116 (h!23325 (_ BitVec 64)) (t!31427 List!22120)) )
))
(declare-fun contains!6113 (List!22120 (_ BitVec 64)) Bool)

(assert (=> b!1049576 (= lt!463569 (contains!6113 Nil!22117 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1049577 () Bool)

(declare-fun e!595505 () Bool)

(assert (=> b!1049577 (= e!595505 e!595503)))

(declare-fun res!698703 () Bool)

(assert (=> b!1049577 (=> res!698703 e!595503)))

(assert (=> b!1049577 (= res!698703 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32344 a!3488)))))

(assert (=> b!1049577 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34336 0))(
  ( (Unit!34337) )
))
(declare-fun lt!463568 () Unit!34336)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66137 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34336)

(assert (=> b!1049577 (= lt!463568 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!463571 (bvadd #b00000000000000000000000000000001 i!1381)))))

(declare-fun arrayNoDuplicates!0 (array!66137 (_ BitVec 32) List!22120) Bool)

(assert (=> b!1049577 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22117)))

(declare-fun lt!463570 () Unit!34336)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66137 (_ BitVec 32) (_ BitVec 32)) Unit!34336)

(assert (=> b!1049577 (= lt!463570 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1049578 () Bool)

(declare-fun e!595504 () Bool)

(assert (=> b!1049578 (= e!595504 e!595506)))

(declare-fun res!698701 () Bool)

(assert (=> b!1049578 (=> res!698701 e!595506)))

(assert (=> b!1049578 (= res!698701 (bvsle lt!463571 i!1381))))

(declare-fun b!1049579 () Bool)

(declare-fun e!595508 () Bool)

(declare-fun e!595510 () Bool)

(assert (=> b!1049579 (= e!595508 e!595510)))

(declare-fun res!698705 () Bool)

(assert (=> b!1049579 (=> (not res!698705) (not e!595510))))

(assert (=> b!1049579 (= res!698705 (not (= lt!463571 i!1381)))))

(declare-fun lt!463572 () array!66137)

(declare-fun arrayScanForKey!0 (array!66137 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1049579 (= lt!463571 (arrayScanForKey!0 lt!463572 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1049580 () Bool)

(declare-fun res!698706 () Bool)

(assert (=> b!1049580 (=> res!698706 e!595503)))

(assert (=> b!1049580 (= res!698706 (contains!6113 Nil!22117 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1049581 () Bool)

(declare-fun res!698704 () Bool)

(assert (=> b!1049581 (=> (not res!698704) (not e!595507))))

(assert (=> b!1049581 (= res!698704 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22117))))

(declare-fun b!1049582 () Bool)

(declare-fun res!698711 () Bool)

(assert (=> b!1049582 (=> res!698711 e!595503)))

(declare-fun noDuplicate!1498 (List!22120) Bool)

(assert (=> b!1049582 (= res!698711 (not (noDuplicate!1498 Nil!22117)))))

(declare-fun b!1049583 () Bool)

(assert (=> b!1049583 (= e!595507 e!595508)))

(declare-fun res!698710 () Bool)

(assert (=> b!1049583 (=> (not res!698710) (not e!595508))))

(assert (=> b!1049583 (= res!698710 (arrayContainsKey!0 lt!463572 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1049583 (= lt!463572 (array!66138 (store (arr!31808 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32344 a!3488)))))

(declare-fun b!1049584 () Bool)

(assert (=> b!1049584 (= e!595510 (not e!595505))))

(declare-fun res!698708 () Bool)

(assert (=> b!1049584 (=> res!698708 e!595505)))

(assert (=> b!1049584 (= res!698708 (bvsle lt!463571 i!1381))))

(assert (=> b!1049584 e!595504))

(declare-fun res!698707 () Bool)

(assert (=> b!1049584 (=> (not res!698707) (not e!595504))))

(assert (=> b!1049584 (= res!698707 (= (select (store (arr!31808 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463571) k0!2747))))

(declare-fun b!1049585 () Bool)

(declare-fun res!698700 () Bool)

(assert (=> b!1049585 (=> (not res!698700) (not e!595507))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1049585 (= res!698700 (validKeyInArray!0 k0!2747))))

(assert (= (and start!92336 res!698709) b!1049581))

(assert (= (and b!1049581 res!698704) b!1049585))

(assert (= (and b!1049585 res!698700) b!1049575))

(assert (= (and b!1049575 res!698702) b!1049583))

(assert (= (and b!1049583 res!698710) b!1049579))

(assert (= (and b!1049579 res!698705) b!1049584))

(assert (= (and b!1049584 res!698707) b!1049578))

(assert (= (and b!1049578 (not res!698701)) b!1049574))

(assert (= (and b!1049584 (not res!698708)) b!1049577))

(assert (= (and b!1049577 (not res!698703)) b!1049582))

(assert (= (and b!1049582 (not res!698711)) b!1049580))

(assert (= (and b!1049580 (not res!698706)) b!1049576))

(declare-fun m!970321 () Bool)

(assert (=> b!1049580 m!970321))

(declare-fun m!970323 () Bool)

(assert (=> b!1049585 m!970323))

(declare-fun m!970325 () Bool)

(assert (=> start!92336 m!970325))

(declare-fun m!970327 () Bool)

(assert (=> b!1049574 m!970327))

(declare-fun m!970329 () Bool)

(assert (=> b!1049577 m!970329))

(declare-fun m!970331 () Bool)

(assert (=> b!1049577 m!970331))

(declare-fun m!970333 () Bool)

(assert (=> b!1049577 m!970333))

(declare-fun m!970335 () Bool)

(assert (=> b!1049577 m!970335))

(declare-fun m!970337 () Bool)

(assert (=> b!1049582 m!970337))

(declare-fun m!970339 () Bool)

(assert (=> b!1049583 m!970339))

(declare-fun m!970341 () Bool)

(assert (=> b!1049583 m!970341))

(assert (=> b!1049584 m!970341))

(declare-fun m!970343 () Bool)

(assert (=> b!1049584 m!970343))

(declare-fun m!970345 () Bool)

(assert (=> b!1049579 m!970345))

(declare-fun m!970347 () Bool)

(assert (=> b!1049581 m!970347))

(declare-fun m!970349 () Bool)

(assert (=> b!1049576 m!970349))

(declare-fun m!970351 () Bool)

(assert (=> b!1049575 m!970351))

(check-sat (not b!1049583) (not b!1049576) (not b!1049577) (not b!1049585) (not b!1049579) (not b!1049581) (not b!1049582) (not start!92336) (not b!1049580) (not b!1049574))
