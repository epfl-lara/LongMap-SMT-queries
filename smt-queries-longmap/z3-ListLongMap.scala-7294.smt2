; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93220 () Bool)

(assert start!93220)

(declare-fun b!1056764 () Bool)

(declare-fun e!600875 () Bool)

(assert (=> b!1056764 (= e!600875 true)))

(declare-datatypes ((array!66599 0))(
  ( (array!66600 (arr!32022 (Array (_ BitVec 32) (_ BitVec 64))) (size!32560 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66599)

(declare-fun lt!466034 () (_ BitVec 32))

(declare-datatypes ((List!22393 0))(
  ( (Nil!22390) (Cons!22389 (h!23598 (_ BitVec 64)) (t!31691 List!22393)) )
))
(declare-fun arrayNoDuplicates!0 (array!66599 (_ BitVec 32) List!22393) Bool)

(assert (=> b!1056764 (arrayNoDuplicates!0 a!3488 lt!466034 Nil!22390)))

(declare-datatypes ((Unit!34499 0))(
  ( (Unit!34500) )
))
(declare-fun lt!466036 () Unit!34499)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66599 (_ BitVec 32) (_ BitVec 32)) Unit!34499)

(assert (=> b!1056764 (= lt!466036 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466034))))

(declare-fun res!705555 () Bool)

(declare-fun e!600874 () Bool)

(assert (=> start!93220 (=> (not res!705555) (not e!600874))))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> start!93220 (= res!705555 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32560 a!3488)) (bvslt (size!32560 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93220 e!600874))

(assert (=> start!93220 true))

(declare-fun array_inv!24805 (array!66599) Bool)

(assert (=> start!93220 (array_inv!24805 a!3488)))

(declare-fun b!1056765 () Bool)

(declare-fun res!705554 () Bool)

(assert (=> b!1056765 (=> (not res!705554) (not e!600874))))

(declare-fun k0!2747 () (_ BitVec 64))

(assert (=> b!1056765 (= res!705554 (= (select (arr!32022 a!3488) i!1381) k0!2747))))

(declare-fun e!600876 () Bool)

(declare-fun b!1056766 () Bool)

(declare-fun arrayContainsKey!0 (array!66599 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1056766 (= e!600876 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1056767 () Bool)

(declare-fun e!600879 () Bool)

(declare-fun e!600878 () Bool)

(assert (=> b!1056767 (= e!600879 e!600878)))

(declare-fun res!705549 () Bool)

(assert (=> b!1056767 (=> (not res!705549) (not e!600878))))

(assert (=> b!1056767 (= res!705549 (not (= lt!466034 i!1381)))))

(declare-fun lt!466035 () array!66599)

(declare-fun arrayScanForKey!0 (array!66599 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1056767 (= lt!466034 (arrayScanForKey!0 lt!466035 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1056768 () Bool)

(declare-fun res!705548 () Bool)

(assert (=> b!1056768 (=> (not res!705548) (not e!600874))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1056768 (= res!705548 (validKeyInArray!0 k0!2747))))

(declare-fun b!1056769 () Bool)

(assert (=> b!1056769 (= e!600878 (not e!600875))))

(declare-fun res!705552 () Bool)

(assert (=> b!1056769 (=> res!705552 e!600875)))

(assert (=> b!1056769 (= res!705552 (or (bvsgt lt!466034 i!1381) (bvsle i!1381 lt!466034)))))

(declare-fun e!600873 () Bool)

(assert (=> b!1056769 e!600873))

(declare-fun res!705551 () Bool)

(assert (=> b!1056769 (=> (not res!705551) (not e!600873))))

(assert (=> b!1056769 (= res!705551 (= (select (store (arr!32022 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466034) k0!2747))))

(declare-fun b!1056770 () Bool)

(declare-fun res!705553 () Bool)

(assert (=> b!1056770 (=> (not res!705553) (not e!600874))))

(assert (=> b!1056770 (= res!705553 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22390))))

(declare-fun b!1056771 () Bool)

(assert (=> b!1056771 (= e!600874 e!600879)))

(declare-fun res!705556 () Bool)

(assert (=> b!1056771 (=> (not res!705556) (not e!600879))))

(assert (=> b!1056771 (= res!705556 (arrayContainsKey!0 lt!466035 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1056771 (= lt!466035 (array!66600 (store (arr!32022 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32560 a!3488)))))

(declare-fun b!1056772 () Bool)

(assert (=> b!1056772 (= e!600873 e!600876)))

(declare-fun res!705550 () Bool)

(assert (=> b!1056772 (=> res!705550 e!600876)))

(assert (=> b!1056772 (= res!705550 (or (bvsgt lt!466034 i!1381) (bvsle i!1381 lt!466034)))))

(assert (= (and start!93220 res!705555) b!1056770))

(assert (= (and b!1056770 res!705553) b!1056768))

(assert (= (and b!1056768 res!705548) b!1056765))

(assert (= (and b!1056765 res!705554) b!1056771))

(assert (= (and b!1056771 res!705556) b!1056767))

(assert (= (and b!1056767 res!705549) b!1056769))

(assert (= (and b!1056769 res!705551) b!1056772))

(assert (= (and b!1056772 (not res!705550)) b!1056766))

(assert (= (and b!1056769 (not res!705552)) b!1056764))

(declare-fun m!976043 () Bool)

(assert (=> start!93220 m!976043))

(declare-fun m!976045 () Bool)

(assert (=> b!1056770 m!976045))

(declare-fun m!976047 () Bool)

(assert (=> b!1056766 m!976047))

(declare-fun m!976049 () Bool)

(assert (=> b!1056771 m!976049))

(declare-fun m!976051 () Bool)

(assert (=> b!1056771 m!976051))

(declare-fun m!976053 () Bool)

(assert (=> b!1056767 m!976053))

(declare-fun m!976055 () Bool)

(assert (=> b!1056765 m!976055))

(declare-fun m!976057 () Bool)

(assert (=> b!1056768 m!976057))

(assert (=> b!1056769 m!976051))

(declare-fun m!976059 () Bool)

(assert (=> b!1056769 m!976059))

(declare-fun m!976061 () Bool)

(assert (=> b!1056764 m!976061))

(declare-fun m!976063 () Bool)

(assert (=> b!1056764 m!976063))

(check-sat (not b!1056770) (not b!1056767) (not b!1056766) (not start!93220) (not b!1056768) (not b!1056764) (not b!1056771))
(check-sat)
