; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93056 () Bool)

(assert start!93056)

(declare-fun b!1055757 () Bool)

(declare-fun e!600074 () Bool)

(declare-fun e!600076 () Bool)

(assert (=> b!1055757 (= e!600074 (not e!600076))))

(declare-fun res!704576 () Bool)

(assert (=> b!1055757 (=> res!704576 e!600076)))

(declare-fun lt!465895 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1055757 (= res!704576 (bvsle lt!465895 i!1381))))

(declare-fun e!600079 () Bool)

(assert (=> b!1055757 e!600079))

(declare-fun res!704575 () Bool)

(assert (=> b!1055757 (=> (not res!704575) (not e!600079))))

(declare-datatypes ((array!66581 0))(
  ( (array!66582 (arr!32018 (Array (_ BitVec 32) (_ BitVec 64))) (size!32554 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66581)

(declare-fun k0!2747 () (_ BitVec 64))

(assert (=> b!1055757 (= res!704575 (= (select (store (arr!32018 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465895) k0!2747))))

(declare-fun b!1055759 () Bool)

(declare-fun res!704573 () Bool)

(declare-fun e!600077 () Bool)

(assert (=> b!1055759 (=> (not res!704573) (not e!600077))))

(assert (=> b!1055759 (= res!704573 (= (select (arr!32018 a!3488) i!1381) k0!2747))))

(declare-fun b!1055760 () Bool)

(declare-fun e!600073 () Bool)

(assert (=> b!1055760 (= e!600079 e!600073)))

(declare-fun res!704577 () Bool)

(assert (=> b!1055760 (=> res!704577 e!600073)))

(assert (=> b!1055760 (= res!704577 (bvsle lt!465895 i!1381))))

(declare-fun b!1055761 () Bool)

(assert (=> b!1055761 (= e!600076 true)))

(assert (=> b!1055761 false))

(declare-datatypes ((Unit!34594 0))(
  ( (Unit!34595) )
))
(declare-fun lt!465893 () Unit!34594)

(declare-datatypes ((List!22330 0))(
  ( (Nil!22327) (Cons!22326 (h!23535 (_ BitVec 64)) (t!31637 List!22330)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!66581 (_ BitVec 64) (_ BitVec 32) List!22330) Unit!34594)

(assert (=> b!1055761 (= lt!465893 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 a!3488 k0!2747 i!1381 Nil!22327))))

(declare-fun arrayContainsKey!0 (array!66581 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1055761 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-fun lt!465896 () Unit!34594)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66581 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34594)

(assert (=> b!1055761 (= lt!465896 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!465895 (bvadd #b00000000000000000000000000000001 i!1381)))))

(declare-fun arrayNoDuplicates!0 (array!66581 (_ BitVec 32) List!22330) Bool)

(assert (=> b!1055761 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22327)))

(declare-fun lt!465894 () Unit!34594)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66581 (_ BitVec 32) (_ BitVec 32)) Unit!34594)

(assert (=> b!1055761 (= lt!465894 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1055762 () Bool)

(declare-fun e!600075 () Bool)

(assert (=> b!1055762 (= e!600075 e!600074)))

(declare-fun res!704574 () Bool)

(assert (=> b!1055762 (=> (not res!704574) (not e!600074))))

(assert (=> b!1055762 (= res!704574 (not (= lt!465895 i!1381)))))

(declare-fun lt!465897 () array!66581)

(declare-fun arrayScanForKey!0 (array!66581 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1055762 (= lt!465895 (arrayScanForKey!0 lt!465897 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1055763 () Bool)

(declare-fun res!704572 () Bool)

(assert (=> b!1055763 (=> (not res!704572) (not e!600077))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1055763 (= res!704572 (validKeyInArray!0 k0!2747))))

(declare-fun b!1055764 () Bool)

(assert (=> b!1055764 (= e!600077 e!600075)))

(declare-fun res!704571 () Bool)

(assert (=> b!1055764 (=> (not res!704571) (not e!600075))))

(assert (=> b!1055764 (= res!704571 (arrayContainsKey!0 lt!465897 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1055764 (= lt!465897 (array!66582 (store (arr!32018 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32554 a!3488)))))

(declare-fun b!1055765 () Bool)

(declare-fun res!704578 () Bool)

(assert (=> b!1055765 (=> (not res!704578) (not e!600077))))

(assert (=> b!1055765 (= res!704578 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22327))))

(declare-fun b!1055758 () Bool)

(assert (=> b!1055758 (= e!600073 (arrayContainsKey!0 a!3488 k0!2747 lt!465895))))

(declare-fun res!704579 () Bool)

(assert (=> start!93056 (=> (not res!704579) (not e!600077))))

(assert (=> start!93056 (= res!704579 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32554 a!3488)) (bvslt (size!32554 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93056 e!600077))

(assert (=> start!93056 true))

(declare-fun array_inv!24798 (array!66581) Bool)

(assert (=> start!93056 (array_inv!24798 a!3488)))

(assert (= (and start!93056 res!704579) b!1055765))

(assert (= (and b!1055765 res!704578) b!1055763))

(assert (= (and b!1055763 res!704572) b!1055759))

(assert (= (and b!1055759 res!704573) b!1055764))

(assert (= (and b!1055764 res!704571) b!1055762))

(assert (= (and b!1055762 res!704574) b!1055757))

(assert (= (and b!1055757 res!704575) b!1055760))

(assert (= (and b!1055760 (not res!704577)) b!1055758))

(assert (= (and b!1055757 (not res!704576)) b!1055761))

(declare-fun m!975729 () Bool)

(assert (=> b!1055759 m!975729))

(declare-fun m!975731 () Bool)

(assert (=> b!1055761 m!975731))

(declare-fun m!975733 () Bool)

(assert (=> b!1055761 m!975733))

(declare-fun m!975735 () Bool)

(assert (=> b!1055761 m!975735))

(declare-fun m!975737 () Bool)

(assert (=> b!1055761 m!975737))

(declare-fun m!975739 () Bool)

(assert (=> b!1055761 m!975739))

(declare-fun m!975741 () Bool)

(assert (=> b!1055764 m!975741))

(declare-fun m!975743 () Bool)

(assert (=> b!1055764 m!975743))

(declare-fun m!975745 () Bool)

(assert (=> b!1055758 m!975745))

(declare-fun m!975747 () Bool)

(assert (=> start!93056 m!975747))

(declare-fun m!975749 () Bool)

(assert (=> b!1055765 m!975749))

(assert (=> b!1055757 m!975743))

(declare-fun m!975751 () Bool)

(assert (=> b!1055757 m!975751))

(declare-fun m!975753 () Bool)

(assert (=> b!1055762 m!975753))

(declare-fun m!975755 () Bool)

(assert (=> b!1055763 m!975755))

(check-sat (not b!1055761) (not start!93056) (not b!1055765) (not b!1055764) (not b!1055762) (not b!1055758) (not b!1055763))
(check-sat)
