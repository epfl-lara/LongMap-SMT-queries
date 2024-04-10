; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93434 () Bool)

(assert start!93434)

(declare-fun res!706869 () Bool)

(declare-fun e!602040 () Bool)

(assert (=> start!93434 (=> (not res!706869) (not e!602040))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66737 0))(
  ( (array!66738 (arr!32087 (Array (_ BitVec 32) (_ BitVec 64))) (size!32623 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66737)

(assert (=> start!93434 (= res!706869 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32623 a!3488)) (bvslt (size!32623 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93434 e!602040))

(assert (=> start!93434 true))

(declare-fun array_inv!24867 (array!66737) Bool)

(assert (=> start!93434 (array_inv!24867 a!3488)))

(declare-fun b!1058295 () Bool)

(declare-fun res!706871 () Bool)

(declare-fun e!602046 () Bool)

(assert (=> b!1058295 (=> res!706871 e!602046)))

(declare-datatypes ((List!22399 0))(
  ( (Nil!22396) (Cons!22395 (h!23604 (_ BitVec 64)) (t!31706 List!22399)) )
))
(declare-fun contains!6211 (List!22399 (_ BitVec 64)) Bool)

(assert (=> b!1058295 (= res!706871 (contains!6211 Nil!22396 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1058296 () Bool)

(declare-fun res!706877 () Bool)

(assert (=> b!1058296 (=> (not res!706877) (not e!602040))))

(declare-fun k0!2747 () (_ BitVec 64))

(assert (=> b!1058296 (= res!706877 (= (select (arr!32087 a!3488) i!1381) k0!2747))))

(declare-fun b!1058297 () Bool)

(declare-fun e!602044 () Bool)

(declare-fun arrayContainsKey!0 (array!66737 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058297 (= e!602044 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1058298 () Bool)

(declare-fun e!602042 () Bool)

(declare-fun e!602045 () Bool)

(assert (=> b!1058298 (= e!602042 e!602045)))

(declare-fun res!706870 () Bool)

(assert (=> b!1058298 (=> (not res!706870) (not e!602045))))

(declare-fun lt!466806 () (_ BitVec 32))

(assert (=> b!1058298 (= res!706870 (not (= lt!466806 i!1381)))))

(declare-fun lt!466805 () array!66737)

(declare-fun arrayScanForKey!0 (array!66737 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1058298 (= lt!466806 (arrayScanForKey!0 lt!466805 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1058299 () Bool)

(declare-fun e!602043 () Bool)

(assert (=> b!1058299 (= e!602043 e!602046)))

(declare-fun res!706874 () Bool)

(assert (=> b!1058299 (=> res!706874 e!602046)))

(declare-fun lt!466804 () (_ BitVec 32))

(assert (=> b!1058299 (= res!706874 (or (bvslt lt!466806 #b00000000000000000000000000000000) (bvsge lt!466804 (size!32623 a!3488)) (bvsge lt!466806 (size!32623 a!3488))))))

(assert (=> b!1058299 (arrayContainsKey!0 a!3488 k0!2747 lt!466804)))

(declare-datatypes ((Unit!34696 0))(
  ( (Unit!34697) )
))
(declare-fun lt!466803 () Unit!34696)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66737 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34696)

(assert (=> b!1058299 (= lt!466803 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!466804))))

(assert (=> b!1058299 (= lt!466804 (bvadd #b00000000000000000000000000000001 lt!466806))))

(declare-fun arrayNoDuplicates!0 (array!66737 (_ BitVec 32) List!22399) Bool)

(assert (=> b!1058299 (arrayNoDuplicates!0 a!3488 lt!466806 Nil!22396)))

(declare-fun lt!466801 () Unit!34696)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66737 (_ BitVec 32) (_ BitVec 32)) Unit!34696)

(assert (=> b!1058299 (= lt!466801 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466806))))

(declare-fun b!1058300 () Bool)

(assert (=> b!1058300 (= e!602045 (not e!602043))))

(declare-fun res!706872 () Bool)

(assert (=> b!1058300 (=> res!706872 e!602043)))

(assert (=> b!1058300 (= res!706872 (or (bvsgt lt!466806 i!1381) (bvsle i!1381 lt!466806)))))

(declare-fun e!602041 () Bool)

(assert (=> b!1058300 e!602041))

(declare-fun res!706879 () Bool)

(assert (=> b!1058300 (=> (not res!706879) (not e!602041))))

(assert (=> b!1058300 (= res!706879 (= (select (store (arr!32087 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466806) k0!2747))))

(declare-fun b!1058301 () Bool)

(declare-fun res!706876 () Bool)

(assert (=> b!1058301 (=> res!706876 e!602046)))

(declare-fun noDuplicate!1567 (List!22399) Bool)

(assert (=> b!1058301 (= res!706876 (not (noDuplicate!1567 Nil!22396)))))

(declare-fun b!1058302 () Bool)

(assert (=> b!1058302 (= e!602046 true)))

(declare-fun lt!466802 () Bool)

(assert (=> b!1058302 (= lt!466802 (contains!6211 Nil!22396 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1058303 () Bool)

(assert (=> b!1058303 (= e!602041 e!602044)))

(declare-fun res!706880 () Bool)

(assert (=> b!1058303 (=> res!706880 e!602044)))

(assert (=> b!1058303 (= res!706880 (or (bvsgt lt!466806 i!1381) (bvsle i!1381 lt!466806)))))

(declare-fun b!1058304 () Bool)

(assert (=> b!1058304 (= e!602040 e!602042)))

(declare-fun res!706878 () Bool)

(assert (=> b!1058304 (=> (not res!706878) (not e!602042))))

(assert (=> b!1058304 (= res!706878 (arrayContainsKey!0 lt!466805 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1058304 (= lt!466805 (array!66738 (store (arr!32087 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32623 a!3488)))))

(declare-fun b!1058305 () Bool)

(declare-fun res!706873 () Bool)

(assert (=> b!1058305 (=> (not res!706873) (not e!602040))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1058305 (= res!706873 (validKeyInArray!0 k0!2747))))

(declare-fun b!1058306 () Bool)

(declare-fun res!706875 () Bool)

(assert (=> b!1058306 (=> (not res!706875) (not e!602040))))

(assert (=> b!1058306 (= res!706875 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22396))))

(assert (= (and start!93434 res!706869) b!1058306))

(assert (= (and b!1058306 res!706875) b!1058305))

(assert (= (and b!1058305 res!706873) b!1058296))

(assert (= (and b!1058296 res!706877) b!1058304))

(assert (= (and b!1058304 res!706878) b!1058298))

(assert (= (and b!1058298 res!706870) b!1058300))

(assert (= (and b!1058300 res!706879) b!1058303))

(assert (= (and b!1058303 (not res!706880)) b!1058297))

(assert (= (and b!1058300 (not res!706872)) b!1058299))

(assert (= (and b!1058299 (not res!706874)) b!1058301))

(assert (= (and b!1058301 (not res!706876)) b!1058295))

(assert (= (and b!1058295 (not res!706871)) b!1058302))

(declare-fun m!977923 () Bool)

(assert (=> b!1058304 m!977923))

(declare-fun m!977925 () Bool)

(assert (=> b!1058304 m!977925))

(declare-fun m!977927 () Bool)

(assert (=> b!1058297 m!977927))

(declare-fun m!977929 () Bool)

(assert (=> b!1058298 m!977929))

(declare-fun m!977931 () Bool)

(assert (=> b!1058305 m!977931))

(declare-fun m!977933 () Bool)

(assert (=> b!1058306 m!977933))

(declare-fun m!977935 () Bool)

(assert (=> b!1058301 m!977935))

(declare-fun m!977937 () Bool)

(assert (=> b!1058295 m!977937))

(assert (=> b!1058300 m!977925))

(declare-fun m!977939 () Bool)

(assert (=> b!1058300 m!977939))

(declare-fun m!977941 () Bool)

(assert (=> b!1058299 m!977941))

(declare-fun m!977943 () Bool)

(assert (=> b!1058299 m!977943))

(declare-fun m!977945 () Bool)

(assert (=> b!1058299 m!977945))

(declare-fun m!977947 () Bool)

(assert (=> b!1058299 m!977947))

(declare-fun m!977949 () Bool)

(assert (=> start!93434 m!977949))

(declare-fun m!977951 () Bool)

(assert (=> b!1058296 m!977951))

(declare-fun m!977953 () Bool)

(assert (=> b!1058302 m!977953))

(check-sat (not b!1058306) (not start!93434) (not b!1058295) (not b!1058298) (not b!1058304) (not b!1058297) (not b!1058302) (not b!1058301) (not b!1058305) (not b!1058299))
(check-sat)
