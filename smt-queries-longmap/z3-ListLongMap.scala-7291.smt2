; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93402 () Bool)

(assert start!93402)

(declare-fun b!1057885 () Bool)

(declare-fun e!601540 () Bool)

(declare-fun e!601542 () Bool)

(assert (=> b!1057885 (= e!601540 e!601542)))

(declare-fun res!705829 () Bool)

(assert (=> b!1057885 (=> res!705829 e!601542)))

(declare-fun lt!466651 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1057885 (= res!705829 (or (bvsgt lt!466651 i!1381) (bvsle i!1381 lt!466651)))))

(declare-fun b!1057886 () Bool)

(declare-fun res!705823 () Bool)

(declare-fun e!601538 () Bool)

(assert (=> b!1057886 (=> (not res!705823) (not e!601538))))

(declare-datatypes ((array!66688 0))(
  ( (array!66689 (arr!32062 (Array (_ BitVec 32) (_ BitVec 64))) (size!32599 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66688)

(declare-datatypes ((List!22344 0))(
  ( (Nil!22341) (Cons!22340 (h!23558 (_ BitVec 64)) (t!31643 List!22344)) )
))
(declare-fun arrayNoDuplicates!0 (array!66688 (_ BitVec 32) List!22344) Bool)

(assert (=> b!1057886 (= res!705823 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22341))))

(declare-fun b!1057887 () Bool)

(declare-fun e!601537 () Bool)

(assert (=> b!1057887 (= e!601538 e!601537)))

(declare-fun res!705830 () Bool)

(assert (=> b!1057887 (=> (not res!705830) (not e!601537))))

(declare-fun lt!466650 () array!66688)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66688 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1057887 (= res!705830 (arrayContainsKey!0 lt!466650 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1057887 (= lt!466650 (array!66689 (store (arr!32062 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32599 a!3488)))))

(declare-fun b!1057888 () Bool)

(assert (=> b!1057888 (= e!601542 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1057889 () Bool)

(declare-fun res!705827 () Bool)

(assert (=> b!1057889 (=> (not res!705827) (not e!601538))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1057889 (= res!705827 (validKeyInArray!0 k0!2747))))

(declare-fun b!1057890 () Bool)

(declare-fun e!601539 () Bool)

(declare-fun e!601541 () Bool)

(assert (=> b!1057890 (= e!601539 (not e!601541))))

(declare-fun res!705822 () Bool)

(assert (=> b!1057890 (=> res!705822 e!601541)))

(assert (=> b!1057890 (= res!705822 (or (bvsgt lt!466651 i!1381) (bvsle i!1381 lt!466651)))))

(assert (=> b!1057890 e!601540))

(declare-fun res!705824 () Bool)

(assert (=> b!1057890 (=> (not res!705824) (not e!601540))))

(assert (=> b!1057890 (= res!705824 (= (select (store (arr!32062 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466651) k0!2747))))

(declare-fun res!705825 () Bool)

(assert (=> start!93402 (=> (not res!705825) (not e!601538))))

(assert (=> start!93402 (= res!705825 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32599 a!3488)) (bvslt (size!32599 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93402 e!601538))

(assert (=> start!93402 true))

(declare-fun array_inv!24844 (array!66688) Bool)

(assert (=> start!93402 (array_inv!24844 a!3488)))

(declare-fun b!1057891 () Bool)

(assert (=> b!1057891 (= e!601537 e!601539)))

(declare-fun res!705828 () Bool)

(assert (=> b!1057891 (=> (not res!705828) (not e!601539))))

(assert (=> b!1057891 (= res!705828 (not (= lt!466651 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66688 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1057891 (= lt!466651 (arrayScanForKey!0 lt!466650 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1057892 () Bool)

(assert (=> b!1057892 (= e!601541 true)))

(assert (=> b!1057892 (arrayNoDuplicates!0 a!3488 lt!466651 Nil!22341)))

(declare-datatypes ((Unit!34615 0))(
  ( (Unit!34616) )
))
(declare-fun lt!466652 () Unit!34615)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66688 (_ BitVec 32) (_ BitVec 32)) Unit!34615)

(assert (=> b!1057892 (= lt!466652 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466651))))

(declare-fun b!1057893 () Bool)

(declare-fun res!705826 () Bool)

(assert (=> b!1057893 (=> (not res!705826) (not e!601538))))

(assert (=> b!1057893 (= res!705826 (= (select (arr!32062 a!3488) i!1381) k0!2747))))

(assert (= (and start!93402 res!705825) b!1057886))

(assert (= (and b!1057886 res!705823) b!1057889))

(assert (= (and b!1057889 res!705827) b!1057893))

(assert (= (and b!1057893 res!705826) b!1057887))

(assert (= (and b!1057887 res!705830) b!1057891))

(assert (= (and b!1057891 res!705828) b!1057890))

(assert (= (and b!1057890 res!705824) b!1057885))

(assert (= (and b!1057885 (not res!705829)) b!1057888))

(assert (= (and b!1057890 (not res!705822)) b!1057892))

(declare-fun m!978053 () Bool)

(assert (=> b!1057888 m!978053))

(declare-fun m!978055 () Bool)

(assert (=> start!93402 m!978055))

(declare-fun m!978057 () Bool)

(assert (=> b!1057891 m!978057))

(declare-fun m!978059 () Bool)

(assert (=> b!1057886 m!978059))

(declare-fun m!978061 () Bool)

(assert (=> b!1057890 m!978061))

(declare-fun m!978063 () Bool)

(assert (=> b!1057890 m!978063))

(declare-fun m!978065 () Bool)

(assert (=> b!1057893 m!978065))

(declare-fun m!978067 () Bool)

(assert (=> b!1057892 m!978067))

(declare-fun m!978069 () Bool)

(assert (=> b!1057892 m!978069))

(declare-fun m!978071 () Bool)

(assert (=> b!1057887 m!978071))

(assert (=> b!1057887 m!978061))

(declare-fun m!978073 () Bool)

(assert (=> b!1057889 m!978073))

(check-sat (not b!1057887) (not b!1057888) (not start!93402) (not b!1057892) (not b!1057886) (not b!1057891) (not b!1057889))
(check-sat)
