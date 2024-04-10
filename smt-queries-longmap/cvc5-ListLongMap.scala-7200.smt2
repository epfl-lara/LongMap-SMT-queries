; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92262 () Bool)

(assert start!92262)

(declare-fun b!1048540 () Bool)

(declare-fun e!594741 () Bool)

(declare-fun e!594742 () Bool)

(assert (=> b!1048540 (= e!594741 e!594742)))

(declare-fun res!697672 () Bool)

(assert (=> b!1048540 (=> (not res!697672) (not e!594742))))

(declare-fun lt!463223 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1048540 (= res!697672 (not (= lt!463223 i!1381)))))

(declare-datatypes ((array!66063 0))(
  ( (array!66064 (arr!31771 (Array (_ BitVec 32) (_ BitVec 64))) (size!32307 (_ BitVec 32))) )
))
(declare-fun lt!463224 () array!66063)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66063 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1048540 (= lt!463223 (arrayScanForKey!0 lt!463224 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1048541 () Bool)

(declare-fun e!594738 () Bool)

(assert (=> b!1048541 (= e!594738 e!594741)))

(declare-fun res!697673 () Bool)

(assert (=> b!1048541 (=> (not res!697673) (not e!594741))))

(declare-fun arrayContainsKey!0 (array!66063 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1048541 (= res!697673 (arrayContainsKey!0 lt!463224 k!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66063)

(assert (=> b!1048541 (= lt!463224 (array!66064 (store (arr!31771 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32307 a!3488)))))

(declare-fun b!1048542 () Bool)

(declare-fun res!697670 () Bool)

(assert (=> b!1048542 (=> (not res!697670) (not e!594738))))

(assert (=> b!1048542 (= res!697670 (= (select (arr!31771 a!3488) i!1381) k!2747))))

(declare-fun b!1048543 () Bool)

(declare-fun res!697671 () Bool)

(assert (=> b!1048543 (=> (not res!697671) (not e!594738))))

(declare-datatypes ((List!22083 0))(
  ( (Nil!22080) (Cons!22079 (h!23288 (_ BitVec 64)) (t!31390 List!22083)) )
))
(declare-fun arrayNoDuplicates!0 (array!66063 (_ BitVec 32) List!22083) Bool)

(assert (=> b!1048543 (= res!697671 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22080))))

(declare-fun res!697666 () Bool)

(assert (=> start!92262 (=> (not res!697666) (not e!594738))))

(assert (=> start!92262 (= res!697666 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32307 a!3488)) (bvslt (size!32307 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92262 e!594738))

(assert (=> start!92262 true))

(declare-fun array_inv!24551 (array!66063) Bool)

(assert (=> start!92262 (array_inv!24551 a!3488)))

(declare-fun b!1048544 () Bool)

(declare-fun e!594737 () Bool)

(declare-fun e!594739 () Bool)

(assert (=> b!1048544 (= e!594737 e!594739)))

(declare-fun res!697668 () Bool)

(assert (=> b!1048544 (=> res!697668 e!594739)))

(assert (=> b!1048544 (= res!697668 (bvsle lt!463223 i!1381))))

(declare-fun b!1048545 () Bool)

(declare-fun res!697667 () Bool)

(assert (=> b!1048545 (=> (not res!697667) (not e!594738))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1048545 (= res!697667 (validKeyInArray!0 k!2747))))

(declare-fun b!1048546 () Bool)

(assert (=> b!1048546 (= e!594739 (arrayContainsKey!0 a!3488 k!2747 lt!463223))))

(declare-fun b!1048547 () Bool)

(assert (=> b!1048547 (= e!594742 (not true))))

(assert (=> b!1048547 e!594737))

(declare-fun res!697669 () Bool)

(assert (=> b!1048547 (=> (not res!697669) (not e!594737))))

(assert (=> b!1048547 (= res!697669 (= (select (store (arr!31771 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463223) k!2747))))

(assert (= (and start!92262 res!697666) b!1048543))

(assert (= (and b!1048543 res!697671) b!1048545))

(assert (= (and b!1048545 res!697667) b!1048542))

(assert (= (and b!1048542 res!697670) b!1048541))

(assert (= (and b!1048541 res!697673) b!1048540))

(assert (= (and b!1048540 res!697672) b!1048547))

(assert (= (and b!1048547 res!697669) b!1048544))

(assert (= (and b!1048544 (not res!697668)) b!1048546))

(declare-fun m!969485 () Bool)

(assert (=> b!1048540 m!969485))

(declare-fun m!969487 () Bool)

(assert (=> b!1048542 m!969487))

(declare-fun m!969489 () Bool)

(assert (=> b!1048545 m!969489))

(declare-fun m!969491 () Bool)

(assert (=> b!1048541 m!969491))

(declare-fun m!969493 () Bool)

(assert (=> b!1048541 m!969493))

(declare-fun m!969495 () Bool)

(assert (=> b!1048546 m!969495))

(declare-fun m!969497 () Bool)

(assert (=> b!1048543 m!969497))

(assert (=> b!1048547 m!969493))

(declare-fun m!969499 () Bool)

(assert (=> b!1048547 m!969499))

(declare-fun m!969501 () Bool)

(assert (=> start!92262 m!969501))

(push 1)

