; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92396 () Bool)

(assert start!92396)

(declare-fun b!1050543 () Bool)

(declare-fun res!699671 () Bool)

(declare-fun e!596177 () Bool)

(assert (=> b!1050543 (=> (not res!699671) (not e!596177))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050543 (= res!699671 (validKeyInArray!0 k0!2747))))

(declare-fun b!1050544 () Bool)

(declare-fun res!699674 () Bool)

(assert (=> b!1050544 (=> (not res!699674) (not e!596177))))

(declare-datatypes ((array!66197 0))(
  ( (array!66198 (arr!31838 (Array (_ BitVec 32) (_ BitVec 64))) (size!32374 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66197)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1050544 (= res!699674 (= (select (arr!31838 a!3488) i!1381) k0!2747))))

(declare-fun b!1050545 () Bool)

(declare-fun e!596176 () Bool)

(declare-fun e!596179 () Bool)

(assert (=> b!1050545 (= e!596176 e!596179)))

(declare-fun res!699672 () Bool)

(assert (=> b!1050545 (=> (not res!699672) (not e!596179))))

(declare-fun lt!464004 () (_ BitVec 32))

(assert (=> b!1050545 (= res!699672 (not (= lt!464004 i!1381)))))

(declare-fun lt!464003 () array!66197)

(declare-fun arrayScanForKey!0 (array!66197 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050545 (= lt!464004 (arrayScanForKey!0 lt!464003 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1050546 () Bool)

(assert (=> b!1050546 (= e!596177 e!596176)))

(declare-fun res!699673 () Bool)

(assert (=> b!1050546 (=> (not res!699673) (not e!596176))))

(declare-fun arrayContainsKey!0 (array!66197 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050546 (= res!699673 (arrayContainsKey!0 lt!464003 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1050546 (= lt!464003 (array!66198 (store (arr!31838 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32374 a!3488)))))

(declare-fun res!699670 () Bool)

(assert (=> start!92396 (=> (not res!699670) (not e!596177))))

(assert (=> start!92396 (= res!699670 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32374 a!3488)) (bvslt (size!32374 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92396 e!596177))

(assert (=> start!92396 true))

(declare-fun array_inv!24618 (array!66197) Bool)

(assert (=> start!92396 (array_inv!24618 a!3488)))

(declare-fun b!1050547 () Bool)

(assert (=> b!1050547 (= e!596179 (not true))))

(assert (=> b!1050547 (= (select (store (arr!31838 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464004) k0!2747)))

(declare-fun b!1050548 () Bool)

(declare-fun res!699669 () Bool)

(assert (=> b!1050548 (=> (not res!699669) (not e!596177))))

(declare-datatypes ((List!22150 0))(
  ( (Nil!22147) (Cons!22146 (h!23355 (_ BitVec 64)) (t!31457 List!22150)) )
))
(declare-fun arrayNoDuplicates!0 (array!66197 (_ BitVec 32) List!22150) Bool)

(assert (=> b!1050548 (= res!699669 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22147))))

(assert (= (and start!92396 res!699670) b!1050548))

(assert (= (and b!1050548 res!699669) b!1050543))

(assert (= (and b!1050543 res!699671) b!1050544))

(assert (= (and b!1050544 res!699674) b!1050546))

(assert (= (and b!1050546 res!699673) b!1050545))

(assert (= (and b!1050545 res!699672) b!1050547))

(declare-fun m!971229 () Bool)

(assert (=> b!1050546 m!971229))

(declare-fun m!971231 () Bool)

(assert (=> b!1050546 m!971231))

(declare-fun m!971233 () Bool)

(assert (=> b!1050548 m!971233))

(assert (=> b!1050547 m!971231))

(declare-fun m!971235 () Bool)

(assert (=> b!1050547 m!971235))

(declare-fun m!971237 () Bool)

(assert (=> start!92396 m!971237))

(declare-fun m!971239 () Bool)

(assert (=> b!1050544 m!971239))

(declare-fun m!971241 () Bool)

(assert (=> b!1050545 m!971241))

(declare-fun m!971243 () Bool)

(assert (=> b!1050543 m!971243))

(check-sat (not b!1050546) (not start!92396) (not b!1050548) (not b!1050543) (not b!1050545))
(check-sat)
