; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93684 () Bool)

(assert start!93684)

(declare-fun b!1059838 () Bool)

(declare-fun e!603057 () Bool)

(assert (=> b!1059838 (= e!603057 true)))

(declare-datatypes ((array!66802 0))(
  ( (array!66803 (arr!32113 (Array (_ BitVec 32) (_ BitVec 64))) (size!32650 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66802)

(declare-fun lt!467461 () (_ BitVec 32))

(declare-fun k0!2747 () (_ BitVec 64))

(assert (=> b!1059838 (not (= (select (arr!32113 a!3488) lt!467461) k0!2747))))

(declare-datatypes ((Unit!34717 0))(
  ( (Unit!34718) )
))
(declare-fun lt!467463 () Unit!34717)

(declare-datatypes ((List!22395 0))(
  ( (Nil!22392) (Cons!22391 (h!23609 (_ BitVec 64)) (t!31694 List!22395)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!66802 (_ BitVec 64) (_ BitVec 32) List!22395) Unit!34717)

(assert (=> b!1059838 (= lt!467463 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 a!3488 k0!2747 lt!467461 Nil!22392))))

(declare-fun lt!467464 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!66802 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1059838 (arrayContainsKey!0 a!3488 k0!2747 lt!467464)))

(declare-fun i!1381 () (_ BitVec 32))

(declare-fun lt!467462 () Unit!34717)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66802 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34717)

(assert (=> b!1059838 (= lt!467462 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!467464))))

(assert (=> b!1059838 (= lt!467464 (bvadd #b00000000000000000000000000000001 lt!467461))))

(declare-fun arrayNoDuplicates!0 (array!66802 (_ BitVec 32) List!22395) Bool)

(assert (=> b!1059838 (arrayNoDuplicates!0 a!3488 lt!467461 Nil!22392)))

(declare-fun lt!467465 () Unit!34717)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66802 (_ BitVec 32) (_ BitVec 32)) Unit!34717)

(assert (=> b!1059838 (= lt!467465 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!467461))))

(declare-fun b!1059839 () Bool)

(declare-fun res!707613 () Bool)

(declare-fun e!603056 () Bool)

(assert (=> b!1059839 (=> (not res!707613) (not e!603056))))

(assert (=> b!1059839 (= res!707613 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22392))))

(declare-fun b!1059840 () Bool)

(declare-fun e!603059 () Bool)

(declare-fun e!603061 () Bool)

(assert (=> b!1059840 (= e!603059 e!603061)))

(declare-fun res!707608 () Bool)

(assert (=> b!1059840 (=> (not res!707608) (not e!603061))))

(assert (=> b!1059840 (= res!707608 (not (= lt!467461 i!1381)))))

(declare-fun lt!467460 () array!66802)

(declare-fun arrayScanForKey!0 (array!66802 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1059840 (= lt!467461 (arrayScanForKey!0 lt!467460 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1059841 () Bool)

(assert (=> b!1059841 (= e!603061 (not e!603057))))

(declare-fun res!707607 () Bool)

(assert (=> b!1059841 (=> res!707607 e!603057)))

(assert (=> b!1059841 (= res!707607 (or (bvsgt lt!467461 i!1381) (bvsle i!1381 lt!467461)))))

(declare-fun e!603055 () Bool)

(assert (=> b!1059841 e!603055))

(declare-fun res!707611 () Bool)

(assert (=> b!1059841 (=> (not res!707611) (not e!603055))))

(assert (=> b!1059841 (= res!707611 (= (select (store (arr!32113 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!467461) k0!2747))))

(declare-fun e!603058 () Bool)

(declare-fun b!1059842 () Bool)

(assert (=> b!1059842 (= e!603058 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1059843 () Bool)

(declare-fun res!707612 () Bool)

(assert (=> b!1059843 (=> (not res!707612) (not e!603056))))

(assert (=> b!1059843 (= res!707612 (= (select (arr!32113 a!3488) i!1381) k0!2747))))

(declare-fun b!1059844 () Bool)

(declare-fun res!707614 () Bool)

(assert (=> b!1059844 (=> (not res!707614) (not e!603056))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1059844 (= res!707614 (validKeyInArray!0 k0!2747))))

(declare-fun res!707609 () Bool)

(assert (=> start!93684 (=> (not res!707609) (not e!603056))))

(assert (=> start!93684 (= res!707609 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32650 a!3488)) (bvslt (size!32650 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93684 e!603056))

(assert (=> start!93684 true))

(declare-fun array_inv!24895 (array!66802) Bool)

(assert (=> start!93684 (array_inv!24895 a!3488)))

(declare-fun b!1059845 () Bool)

(assert (=> b!1059845 (= e!603055 e!603058)))

(declare-fun res!707615 () Bool)

(assert (=> b!1059845 (=> res!707615 e!603058)))

(assert (=> b!1059845 (= res!707615 (or (bvsgt lt!467461 i!1381) (bvsle i!1381 lt!467461)))))

(declare-fun b!1059846 () Bool)

(assert (=> b!1059846 (= e!603056 e!603059)))

(declare-fun res!707610 () Bool)

(assert (=> b!1059846 (=> (not res!707610) (not e!603059))))

(assert (=> b!1059846 (= res!707610 (arrayContainsKey!0 lt!467460 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1059846 (= lt!467460 (array!66803 (store (arr!32113 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32650 a!3488)))))

(assert (= (and start!93684 res!707609) b!1059839))

(assert (= (and b!1059839 res!707613) b!1059844))

(assert (= (and b!1059844 res!707614) b!1059843))

(assert (= (and b!1059843 res!707612) b!1059846))

(assert (= (and b!1059846 res!707610) b!1059840))

(assert (= (and b!1059840 res!707608) b!1059841))

(assert (= (and b!1059841 res!707611) b!1059845))

(assert (= (and b!1059845 (not res!707615)) b!1059842))

(assert (= (and b!1059841 (not res!707607)) b!1059838))

(declare-fun m!979835 () Bool)

(assert (=> b!1059841 m!979835))

(declare-fun m!979837 () Bool)

(assert (=> b!1059841 m!979837))

(declare-fun m!979839 () Bool)

(assert (=> b!1059846 m!979839))

(assert (=> b!1059846 m!979835))

(declare-fun m!979841 () Bool)

(assert (=> b!1059839 m!979841))

(declare-fun m!979843 () Bool)

(assert (=> b!1059838 m!979843))

(declare-fun m!979845 () Bool)

(assert (=> b!1059838 m!979845))

(declare-fun m!979847 () Bool)

(assert (=> b!1059838 m!979847))

(declare-fun m!979849 () Bool)

(assert (=> b!1059838 m!979849))

(declare-fun m!979851 () Bool)

(assert (=> b!1059838 m!979851))

(declare-fun m!979853 () Bool)

(assert (=> b!1059838 m!979853))

(declare-fun m!979855 () Bool)

(assert (=> b!1059844 m!979855))

(declare-fun m!979857 () Bool)

(assert (=> b!1059840 m!979857))

(declare-fun m!979859 () Bool)

(assert (=> b!1059843 m!979859))

(declare-fun m!979861 () Bool)

(assert (=> b!1059842 m!979861))

(declare-fun m!979863 () Bool)

(assert (=> start!93684 m!979863))

(check-sat (not b!1059842) (not b!1059838) (not start!93684) (not b!1059839) (not b!1059846) (not b!1059840) (not b!1059844))
(check-sat)
