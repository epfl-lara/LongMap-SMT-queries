; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93396 () Bool)

(assert start!93396)

(declare-fun b!1057811 () Bool)

(declare-fun e!601483 () Bool)

(declare-fun e!601485 () Bool)

(assert (=> b!1057811 (= e!601483 e!601485)))

(declare-fun res!705750 () Bool)

(assert (=> b!1057811 (=> (not res!705750) (not e!601485))))

(declare-datatypes ((array!66682 0))(
  ( (array!66683 (arr!32059 (Array (_ BitVec 32) (_ BitVec 64))) (size!32596 (_ BitVec 32))) )
))
(declare-fun lt!466630 () array!66682)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66682 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1057811 (= res!705750 (arrayContainsKey!0 lt!466630 k0!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66682)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1057811 (= lt!466630 (array!66683 (store (arr!32059 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32596 a!3488)))))

(declare-fun b!1057812 () Bool)

(declare-fun res!705753 () Bool)

(assert (=> b!1057812 (=> (not res!705753) (not e!601483))))

(assert (=> b!1057812 (= res!705753 (= (select (arr!32059 a!3488) i!1381) k0!2747))))

(declare-fun res!705748 () Bool)

(assert (=> start!93396 (=> (not res!705748) (not e!601483))))

(assert (=> start!93396 (= res!705748 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32596 a!3488)) (bvslt (size!32596 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93396 e!601483))

(assert (=> start!93396 true))

(declare-fun array_inv!24841 (array!66682) Bool)

(assert (=> start!93396 (array_inv!24841 a!3488)))

(declare-fun b!1057813 () Bool)

(declare-fun e!601484 () Bool)

(assert (=> b!1057813 (= e!601484 (not true))))

(declare-fun e!601482 () Bool)

(assert (=> b!1057813 e!601482))

(declare-fun res!705749 () Bool)

(assert (=> b!1057813 (=> (not res!705749) (not e!601482))))

(declare-fun lt!466631 () (_ BitVec 32))

(assert (=> b!1057813 (= res!705749 (= (select (store (arr!32059 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466631) k0!2747))))

(declare-fun b!1057814 () Bool)

(assert (=> b!1057814 (= e!601485 e!601484)))

(declare-fun res!705752 () Bool)

(assert (=> b!1057814 (=> (not res!705752) (not e!601484))))

(assert (=> b!1057814 (= res!705752 (not (= lt!466631 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66682 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1057814 (= lt!466631 (arrayScanForKey!0 lt!466630 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1057815 () Bool)

(declare-fun e!601486 () Bool)

(assert (=> b!1057815 (= e!601482 e!601486)))

(declare-fun res!705751 () Bool)

(assert (=> b!1057815 (=> res!705751 e!601486)))

(assert (=> b!1057815 (= res!705751 (or (bvsgt lt!466631 i!1381) (bvsle i!1381 lt!466631)))))

(declare-fun b!1057816 () Bool)

(declare-fun res!705755 () Bool)

(assert (=> b!1057816 (=> (not res!705755) (not e!601483))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1057816 (= res!705755 (validKeyInArray!0 k0!2747))))

(declare-fun b!1057817 () Bool)

(assert (=> b!1057817 (= e!601486 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1057818 () Bool)

(declare-fun res!705754 () Bool)

(assert (=> b!1057818 (=> (not res!705754) (not e!601483))))

(declare-datatypes ((List!22341 0))(
  ( (Nil!22338) (Cons!22337 (h!23555 (_ BitVec 64)) (t!31640 List!22341)) )
))
(declare-fun arrayNoDuplicates!0 (array!66682 (_ BitVec 32) List!22341) Bool)

(assert (=> b!1057818 (= res!705754 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22338))))

(assert (= (and start!93396 res!705748) b!1057818))

(assert (= (and b!1057818 res!705754) b!1057816))

(assert (= (and b!1057816 res!705755) b!1057812))

(assert (= (and b!1057812 res!705753) b!1057811))

(assert (= (and b!1057811 res!705750) b!1057814))

(assert (= (and b!1057814 res!705752) b!1057813))

(assert (= (and b!1057813 res!705749) b!1057815))

(assert (= (and b!1057815 (not res!705751)) b!1057817))

(declare-fun m!977999 () Bool)

(assert (=> b!1057812 m!977999))

(declare-fun m!978001 () Bool)

(assert (=> b!1057811 m!978001))

(declare-fun m!978003 () Bool)

(assert (=> b!1057811 m!978003))

(declare-fun m!978005 () Bool)

(assert (=> b!1057816 m!978005))

(declare-fun m!978007 () Bool)

(assert (=> start!93396 m!978007))

(declare-fun m!978009 () Bool)

(assert (=> b!1057818 m!978009))

(declare-fun m!978011 () Bool)

(assert (=> b!1057814 m!978011))

(assert (=> b!1057813 m!978003))

(declare-fun m!978013 () Bool)

(assert (=> b!1057813 m!978013))

(declare-fun m!978015 () Bool)

(assert (=> b!1057817 m!978015))

(check-sat (not b!1057818) (not b!1057817) (not start!93396) (not b!1057814) (not b!1057816) (not b!1057811))
(check-sat)
