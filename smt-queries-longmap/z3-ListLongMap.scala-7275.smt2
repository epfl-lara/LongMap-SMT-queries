; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92866 () Bool)

(assert start!92866)

(declare-fun b!1054538 () Bool)

(declare-fun res!703563 () Bool)

(declare-fun e!599154 () Bool)

(assert (=> b!1054538 (=> (not res!703563) (not e!599154))))

(declare-datatypes ((array!66467 0))(
  ( (array!66468 (arr!31965 (Array (_ BitVec 32) (_ BitVec 64))) (size!32503 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66467)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1054538 (= res!703563 (= (select (arr!31965 a!3488) i!1381) k0!2747))))

(declare-fun res!703566 () Bool)

(assert (=> start!92866 (=> (not res!703566) (not e!599154))))

(assert (=> start!92866 (= res!703566 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32503 a!3488)) (bvslt (size!32503 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92866 e!599154))

(assert (=> start!92866 true))

(declare-fun array_inv!24748 (array!66467) Bool)

(assert (=> start!92866 (array_inv!24748 a!3488)))

(declare-fun b!1054539 () Bool)

(declare-fun e!599155 () Bool)

(declare-fun e!599158 () Bool)

(assert (=> b!1054539 (= e!599155 e!599158)))

(declare-fun res!703562 () Bool)

(assert (=> b!1054539 (=> (not res!703562) (not e!599158))))

(declare-fun lt!465313 () (_ BitVec 32))

(assert (=> b!1054539 (= res!703562 (not (= lt!465313 i!1381)))))

(declare-fun lt!465316 () array!66467)

(declare-fun arrayScanForKey!0 (array!66467 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1054539 (= lt!465313 (arrayScanForKey!0 lt!465316 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1054540 () Bool)

(assert (=> b!1054540 (= e!599154 e!599155)))

(declare-fun res!703564 () Bool)

(assert (=> b!1054540 (=> (not res!703564) (not e!599155))))

(declare-fun arrayContainsKey!0 (array!66467 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1054540 (= res!703564 (arrayContainsKey!0 lt!465316 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1054540 (= lt!465316 (array!66468 (store (arr!31965 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32503 a!3488)))))

(declare-fun b!1054541 () Bool)

(declare-fun e!599159 () Bool)

(assert (=> b!1054541 (= e!599159 true)))

(assert (=> b!1054541 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34421 0))(
  ( (Unit!34422) )
))
(declare-fun lt!465315 () Unit!34421)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66467 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34421)

(assert (=> b!1054541 (= lt!465315 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!465313 (bvadd #b00000000000000000000000000000001 i!1381)))))

(declare-datatypes ((List!22336 0))(
  ( (Nil!22333) (Cons!22332 (h!23541 (_ BitVec 64)) (t!31634 List!22336)) )
))
(declare-fun arrayNoDuplicates!0 (array!66467 (_ BitVec 32) List!22336) Bool)

(assert (=> b!1054541 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22333)))

(declare-fun lt!465314 () Unit!34421)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66467 (_ BitVec 32) (_ BitVec 32)) Unit!34421)

(assert (=> b!1054541 (= lt!465314 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1054542 () Bool)

(declare-fun res!703569 () Bool)

(assert (=> b!1054542 (=> (not res!703569) (not e!599154))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1054542 (= res!703569 (validKeyInArray!0 k0!2747))))

(declare-fun b!1054543 () Bool)

(assert (=> b!1054543 (= e!599158 (not e!599159))))

(declare-fun res!703565 () Bool)

(assert (=> b!1054543 (=> res!703565 e!599159)))

(assert (=> b!1054543 (= res!703565 (bvsle lt!465313 i!1381))))

(declare-fun e!599156 () Bool)

(assert (=> b!1054543 e!599156))

(declare-fun res!703570 () Bool)

(assert (=> b!1054543 (=> (not res!703570) (not e!599156))))

(assert (=> b!1054543 (= res!703570 (= (select (store (arr!31965 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465313) k0!2747))))

(declare-fun b!1054544 () Bool)

(declare-fun res!703568 () Bool)

(assert (=> b!1054544 (=> (not res!703568) (not e!599154))))

(assert (=> b!1054544 (= res!703568 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22333))))

(declare-fun b!1054545 () Bool)

(declare-fun e!599160 () Bool)

(assert (=> b!1054545 (= e!599160 (arrayContainsKey!0 a!3488 k0!2747 lt!465313))))

(declare-fun b!1054546 () Bool)

(assert (=> b!1054546 (= e!599156 e!599160)))

(declare-fun res!703567 () Bool)

(assert (=> b!1054546 (=> res!703567 e!599160)))

(assert (=> b!1054546 (= res!703567 (bvsle lt!465313 i!1381))))

(assert (= (and start!92866 res!703566) b!1054544))

(assert (= (and b!1054544 res!703568) b!1054542))

(assert (= (and b!1054542 res!703569) b!1054538))

(assert (= (and b!1054538 res!703563) b!1054540))

(assert (= (and b!1054540 res!703564) b!1054539))

(assert (= (and b!1054539 res!703562) b!1054543))

(assert (= (and b!1054543 res!703570) b!1054546))

(assert (= (and b!1054546 (not res!703567)) b!1054545))

(assert (= (and b!1054543 (not res!703565)) b!1054541))

(declare-fun m!974119 () Bool)

(assert (=> b!1054545 m!974119))

(declare-fun m!974121 () Bool)

(assert (=> b!1054544 m!974121))

(declare-fun m!974123 () Bool)

(assert (=> b!1054538 m!974123))

(declare-fun m!974125 () Bool)

(assert (=> b!1054543 m!974125))

(declare-fun m!974127 () Bool)

(assert (=> b!1054543 m!974127))

(declare-fun m!974129 () Bool)

(assert (=> b!1054540 m!974129))

(assert (=> b!1054540 m!974125))

(declare-fun m!974131 () Bool)

(assert (=> b!1054541 m!974131))

(declare-fun m!974133 () Bool)

(assert (=> b!1054541 m!974133))

(declare-fun m!974135 () Bool)

(assert (=> b!1054541 m!974135))

(declare-fun m!974137 () Bool)

(assert (=> b!1054541 m!974137))

(declare-fun m!974139 () Bool)

(assert (=> b!1054539 m!974139))

(declare-fun m!974141 () Bool)

(assert (=> b!1054542 m!974141))

(declare-fun m!974143 () Bool)

(assert (=> start!92866 m!974143))

(check-sat (not b!1054545) (not start!92866) (not b!1054542) (not b!1054541) (not b!1054544) (not b!1054539) (not b!1054540))
(check-sat)
