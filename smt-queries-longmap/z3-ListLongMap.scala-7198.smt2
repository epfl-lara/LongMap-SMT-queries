; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92484 () Bool)

(assert start!92484)

(declare-fun b!1049725 () Bool)

(declare-fun e!595487 () Bool)

(declare-fun e!595486 () Bool)

(assert (=> b!1049725 (= e!595487 e!595486)))

(declare-fun res!698047 () Bool)

(assert (=> b!1049725 (=> (not res!698047) (not e!595486))))

(declare-fun lt!463702 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1049725 (= res!698047 (not (= lt!463702 i!1381)))))

(declare-datatypes ((array!66100 0))(
  ( (array!66101 (arr!31783 (Array (_ BitVec 32) (_ BitVec 64))) (size!32320 (_ BitVec 32))) )
))
(declare-fun lt!463703 () array!66100)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66100 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1049725 (= lt!463702 (arrayScanForKey!0 lt!463703 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1049726 () Bool)

(declare-fun res!698051 () Bool)

(declare-fun e!595488 () Bool)

(assert (=> b!1049726 (=> (not res!698051) (not e!595488))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1049726 (= res!698051 (validKeyInArray!0 k0!2747))))

(declare-fun b!1049727 () Bool)

(declare-fun res!698049 () Bool)

(assert (=> b!1049727 (=> (not res!698049) (not e!595488))))

(declare-fun a!3488 () array!66100)

(declare-datatypes ((List!22065 0))(
  ( (Nil!22062) (Cons!22061 (h!23279 (_ BitVec 64)) (t!31364 List!22065)) )
))
(declare-fun arrayNoDuplicates!0 (array!66100 (_ BitVec 32) List!22065) Bool)

(assert (=> b!1049727 (= res!698049 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22062))))

(declare-fun b!1049728 () Bool)

(declare-fun res!698050 () Bool)

(assert (=> b!1049728 (=> (not res!698050) (not e!595488))))

(assert (=> b!1049728 (= res!698050 (= (select (arr!31783 a!3488) i!1381) k0!2747))))

(declare-fun res!698048 () Bool)

(assert (=> start!92484 (=> (not res!698048) (not e!595488))))

(assert (=> start!92484 (= res!698048 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32320 a!3488)) (bvslt (size!32320 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92484 e!595488))

(assert (=> start!92484 true))

(declare-fun array_inv!24565 (array!66100) Bool)

(assert (=> start!92484 (array_inv!24565 a!3488)))

(declare-fun b!1049729 () Bool)

(assert (=> b!1049729 (= e!595486 (not true))))

(assert (=> b!1049729 (= (select (store (arr!31783 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463702) k0!2747)))

(declare-fun b!1049730 () Bool)

(assert (=> b!1049730 (= e!595488 e!595487)))

(declare-fun res!698046 () Bool)

(assert (=> b!1049730 (=> (not res!698046) (not e!595487))))

(declare-fun arrayContainsKey!0 (array!66100 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1049730 (= res!698046 (arrayContainsKey!0 lt!463703 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1049730 (= lt!463703 (array!66101 (store (arr!31783 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32320 a!3488)))))

(assert (= (and start!92484 res!698048) b!1049727))

(assert (= (and b!1049727 res!698049) b!1049726))

(assert (= (and b!1049726 res!698051) b!1049728))

(assert (= (and b!1049728 res!698050) b!1049730))

(assert (= (and b!1049730 res!698046) b!1049725))

(assert (= (and b!1049725 res!698047) b!1049729))

(declare-fun m!971051 () Bool)

(assert (=> b!1049725 m!971051))

(declare-fun m!971053 () Bool)

(assert (=> b!1049730 m!971053))

(declare-fun m!971055 () Bool)

(assert (=> b!1049730 m!971055))

(declare-fun m!971057 () Bool)

(assert (=> b!1049728 m!971057))

(declare-fun m!971059 () Bool)

(assert (=> start!92484 m!971059))

(declare-fun m!971061 () Bool)

(assert (=> b!1049727 m!971061))

(assert (=> b!1049729 m!971055))

(declare-fun m!971063 () Bool)

(assert (=> b!1049729 m!971063))

(declare-fun m!971065 () Bool)

(assert (=> b!1049726 m!971065))

(check-sat (not b!1049727) (not b!1049726) (not b!1049725) (not b!1049730) (not start!92484))
(check-sat)
