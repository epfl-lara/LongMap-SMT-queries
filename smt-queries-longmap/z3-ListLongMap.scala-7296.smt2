; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93236 () Bool)

(assert start!93236)

(declare-fun b!1057104 () Bool)

(declare-fun res!705805 () Bool)

(declare-fun e!601113 () Bool)

(assert (=> b!1057104 (=> (not res!705805) (not e!601113))))

(declare-datatypes ((array!66674 0))(
  ( (array!66675 (arr!32060 (Array (_ BitVec 32) (_ BitVec 64))) (size!32596 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66674)

(declare-datatypes ((List!22372 0))(
  ( (Nil!22369) (Cons!22368 (h!23577 (_ BitVec 64)) (t!31679 List!22372)) )
))
(declare-fun arrayNoDuplicates!0 (array!66674 (_ BitVec 32) List!22372) Bool)

(assert (=> b!1057104 (= res!705805 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22369))))

(declare-fun b!1057105 () Bool)

(declare-fun e!601115 () Bool)

(assert (=> b!1057105 (= e!601115 true)))

(declare-fun lt!466297 () (_ BitVec 32))

(assert (=> b!1057105 (arrayNoDuplicates!0 a!3488 lt!466297 Nil!22369)))

(declare-datatypes ((Unit!34642 0))(
  ( (Unit!34643) )
))
(declare-fun lt!466298 () Unit!34642)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66674 (_ BitVec 32) (_ BitVec 32)) Unit!34642)

(assert (=> b!1057105 (= lt!466298 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466297))))

(declare-fun b!1057106 () Bool)

(declare-fun res!705811 () Bool)

(assert (=> b!1057106 (=> (not res!705811) (not e!601113))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1057106 (= res!705811 (validKeyInArray!0 k0!2747))))

(declare-fun b!1057107 () Bool)

(declare-fun e!601116 () Bool)

(declare-fun i!1381 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!66674 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1057107 (= e!601116 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1057108 () Bool)

(declare-fun e!601111 () Bool)

(declare-fun e!601114 () Bool)

(assert (=> b!1057108 (= e!601111 e!601114)))

(declare-fun res!705809 () Bool)

(assert (=> b!1057108 (=> (not res!705809) (not e!601114))))

(assert (=> b!1057108 (= res!705809 (not (= lt!466297 i!1381)))))

(declare-fun lt!466299 () array!66674)

(declare-fun arrayScanForKey!0 (array!66674 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1057108 (= lt!466297 (arrayScanForKey!0 lt!466299 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1057109 () Bool)

(assert (=> b!1057109 (= e!601113 e!601111)))

(declare-fun res!705808 () Bool)

(assert (=> b!1057109 (=> (not res!705808) (not e!601111))))

(assert (=> b!1057109 (= res!705808 (arrayContainsKey!0 lt!466299 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1057109 (= lt!466299 (array!66675 (store (arr!32060 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32596 a!3488)))))

(declare-fun b!1057110 () Bool)

(declare-fun res!705812 () Bool)

(assert (=> b!1057110 (=> (not res!705812) (not e!601113))))

(assert (=> b!1057110 (= res!705812 (= (select (arr!32060 a!3488) i!1381) k0!2747))))

(declare-fun b!1057111 () Bool)

(assert (=> b!1057111 (= e!601114 (not e!601115))))

(declare-fun res!705807 () Bool)

(assert (=> b!1057111 (=> res!705807 e!601115)))

(assert (=> b!1057111 (= res!705807 (or (bvsgt lt!466297 i!1381) (bvsle i!1381 lt!466297)))))

(declare-fun e!601117 () Bool)

(assert (=> b!1057111 e!601117))

(declare-fun res!705806 () Bool)

(assert (=> b!1057111 (=> (not res!705806) (not e!601117))))

(assert (=> b!1057111 (= res!705806 (= (select (store (arr!32060 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466297) k0!2747))))

(declare-fun b!1057112 () Bool)

(assert (=> b!1057112 (= e!601117 e!601116)))

(declare-fun res!705810 () Bool)

(assert (=> b!1057112 (=> res!705810 e!601116)))

(assert (=> b!1057112 (= res!705810 (or (bvsgt lt!466297 i!1381) (bvsle i!1381 lt!466297)))))

(declare-fun res!705804 () Bool)

(assert (=> start!93236 (=> (not res!705804) (not e!601113))))

(assert (=> start!93236 (= res!705804 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32596 a!3488)) (bvslt (size!32596 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93236 e!601113))

(assert (=> start!93236 true))

(declare-fun array_inv!24840 (array!66674) Bool)

(assert (=> start!93236 (array_inv!24840 a!3488)))

(assert (= (and start!93236 res!705804) b!1057104))

(assert (= (and b!1057104 res!705805) b!1057106))

(assert (= (and b!1057106 res!705811) b!1057110))

(assert (= (and b!1057110 res!705812) b!1057109))

(assert (= (and b!1057109 res!705808) b!1057108))

(assert (= (and b!1057108 res!705809) b!1057111))

(assert (= (and b!1057111 res!705806) b!1057112))

(assert (= (and b!1057112 (not res!705810)) b!1057107))

(assert (= (and b!1057111 (not res!705807)) b!1057105))

(declare-fun m!976821 () Bool)

(assert (=> b!1057106 m!976821))

(declare-fun m!976823 () Bool)

(assert (=> b!1057104 m!976823))

(declare-fun m!976825 () Bool)

(assert (=> b!1057107 m!976825))

(declare-fun m!976827 () Bool)

(assert (=> b!1057109 m!976827))

(declare-fun m!976829 () Bool)

(assert (=> b!1057109 m!976829))

(declare-fun m!976831 () Bool)

(assert (=> b!1057110 m!976831))

(declare-fun m!976833 () Bool)

(assert (=> b!1057105 m!976833))

(declare-fun m!976835 () Bool)

(assert (=> b!1057105 m!976835))

(declare-fun m!976837 () Bool)

(assert (=> start!93236 m!976837))

(assert (=> b!1057111 m!976829))

(declare-fun m!976839 () Bool)

(assert (=> b!1057111 m!976839))

(declare-fun m!976841 () Bool)

(assert (=> b!1057108 m!976841))

(check-sat (not b!1057105) (not b!1057107) (not start!93236) (not b!1057108) (not b!1057106) (not b!1057109) (not b!1057104))
(check-sat)
