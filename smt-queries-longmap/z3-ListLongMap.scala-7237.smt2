; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92718 () Bool)

(assert start!92718)

(declare-fun res!701290 () Bool)

(declare-fun e!597844 () Bool)

(assert (=> start!92718 (=> (not res!701290) (not e!597844))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66334 0))(
  ( (array!66335 (arr!31900 (Array (_ BitVec 32) (_ BitVec 64))) (size!32437 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66334)

(assert (=> start!92718 (= res!701290 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32437 a!3488)) (bvslt (size!32437 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92718 e!597844))

(assert (=> start!92718 true))

(declare-fun array_inv!24682 (array!66334) Bool)

(assert (=> start!92718 (array_inv!24682 a!3488)))

(declare-fun b!1052968 () Bool)

(declare-fun res!701293 () Bool)

(declare-fun e!597843 () Bool)

(assert (=> b!1052968 (=> res!701293 e!597843)))

(declare-datatypes ((List!22182 0))(
  ( (Nil!22179) (Cons!22178 (h!23396 (_ BitVec 64)) (t!31481 List!22182)) )
))
(declare-fun contains!6161 (List!22182 (_ BitVec 64)) Bool)

(assert (=> b!1052968 (= res!701293 (contains!6161 Nil!22179 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!597845 () Bool)

(declare-fun b!1052969 () Bool)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66334 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1052969 (= e!597845 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1052970 () Bool)

(declare-fun res!701297 () Bool)

(assert (=> b!1052970 (=> (not res!701297) (not e!597844))))

(assert (=> b!1052970 (= res!701297 (= (select (arr!31900 a!3488) i!1381) k0!2747))))

(declare-fun b!1052971 () Bool)

(assert (=> b!1052971 (= e!597843 true)))

(declare-fun lt!464885 () Bool)

(assert (=> b!1052971 (= lt!464885 (contains!6161 Nil!22179 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1052972 () Bool)

(declare-fun e!597849 () Bool)

(assert (=> b!1052972 (= e!597849 e!597843)))

(declare-fun res!701296 () Bool)

(assert (=> b!1052972 (=> res!701296 e!597843)))

(declare-fun lt!464884 () (_ BitVec 32))

(declare-fun lt!464882 () (_ BitVec 32))

(assert (=> b!1052972 (= res!701296 (or (bvslt lt!464882 #b00000000000000000000000000000000) (bvsge lt!464884 (size!32437 a!3488)) (bvsge lt!464882 (size!32437 a!3488))))))

(assert (=> b!1052972 (arrayContainsKey!0 a!3488 k0!2747 lt!464884)))

(declare-datatypes ((Unit!34441 0))(
  ( (Unit!34442) )
))
(declare-fun lt!464883 () Unit!34441)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66334 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34441)

(assert (=> b!1052972 (= lt!464883 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!464884))))

(assert (=> b!1052972 (= lt!464884 (bvadd #b00000000000000000000000000000001 lt!464882))))

(declare-fun arrayNoDuplicates!0 (array!66334 (_ BitVec 32) List!22182) Bool)

(assert (=> b!1052972 (arrayNoDuplicates!0 a!3488 lt!464882 Nil!22179)))

(declare-fun lt!464881 () Unit!34441)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66334 (_ BitVec 32) (_ BitVec 32)) Unit!34441)

(assert (=> b!1052972 (= lt!464881 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464882))))

(declare-fun b!1052973 () Bool)

(declare-fun e!597847 () Bool)

(assert (=> b!1052973 (= e!597844 e!597847)))

(declare-fun res!701299 () Bool)

(assert (=> b!1052973 (=> (not res!701299) (not e!597847))))

(declare-fun lt!464880 () array!66334)

(assert (=> b!1052973 (= res!701299 (arrayContainsKey!0 lt!464880 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1052973 (= lt!464880 (array!66335 (store (arr!31900 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32437 a!3488)))))

(declare-fun b!1052974 () Bool)

(declare-fun e!597850 () Bool)

(assert (=> b!1052974 (= e!597850 e!597845)))

(declare-fun res!701292 () Bool)

(assert (=> b!1052974 (=> res!701292 e!597845)))

(assert (=> b!1052974 (= res!701292 (or (bvsgt lt!464882 i!1381) (bvsle i!1381 lt!464882)))))

(declare-fun b!1052975 () Bool)

(declare-fun res!701298 () Bool)

(assert (=> b!1052975 (=> (not res!701298) (not e!597844))))

(assert (=> b!1052975 (= res!701298 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22179))))

(declare-fun b!1052976 () Bool)

(declare-fun res!701294 () Bool)

(assert (=> b!1052976 (=> res!701294 e!597843)))

(declare-fun noDuplicate!1537 (List!22182) Bool)

(assert (=> b!1052976 (= res!701294 (not (noDuplicate!1537 Nil!22179)))))

(declare-fun b!1052977 () Bool)

(declare-fun e!597846 () Bool)

(assert (=> b!1052977 (= e!597846 (not e!597849))))

(declare-fun res!701291 () Bool)

(assert (=> b!1052977 (=> res!701291 e!597849)))

(assert (=> b!1052977 (= res!701291 (or (bvsgt lt!464882 i!1381) (bvsle i!1381 lt!464882)))))

(assert (=> b!1052977 e!597850))

(declare-fun res!701289 () Bool)

(assert (=> b!1052977 (=> (not res!701289) (not e!597850))))

(assert (=> b!1052977 (= res!701289 (= (select (store (arr!31900 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464882) k0!2747))))

(declare-fun b!1052978 () Bool)

(declare-fun res!701300 () Bool)

(assert (=> b!1052978 (=> (not res!701300) (not e!597844))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1052978 (= res!701300 (validKeyInArray!0 k0!2747))))

(declare-fun b!1052979 () Bool)

(assert (=> b!1052979 (= e!597847 e!597846)))

(declare-fun res!701295 () Bool)

(assert (=> b!1052979 (=> (not res!701295) (not e!597846))))

(assert (=> b!1052979 (= res!701295 (not (= lt!464882 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66334 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1052979 (= lt!464882 (arrayScanForKey!0 lt!464880 k0!2747 #b00000000000000000000000000000000))))

(assert (= (and start!92718 res!701290) b!1052975))

(assert (= (and b!1052975 res!701298) b!1052978))

(assert (= (and b!1052978 res!701300) b!1052970))

(assert (= (and b!1052970 res!701297) b!1052973))

(assert (= (and b!1052973 res!701299) b!1052979))

(assert (= (and b!1052979 res!701295) b!1052977))

(assert (= (and b!1052977 res!701289) b!1052974))

(assert (= (and b!1052974 (not res!701292)) b!1052969))

(assert (= (and b!1052977 (not res!701291)) b!1052972))

(assert (= (and b!1052972 (not res!701296)) b!1052976))

(assert (= (and b!1052976 (not res!701294)) b!1052968))

(assert (= (and b!1052968 (not res!701293)) b!1052971))

(declare-fun m!973787 () Bool)

(assert (=> b!1052972 m!973787))

(declare-fun m!973789 () Bool)

(assert (=> b!1052972 m!973789))

(declare-fun m!973791 () Bool)

(assert (=> b!1052972 m!973791))

(declare-fun m!973793 () Bool)

(assert (=> b!1052972 m!973793))

(declare-fun m!973795 () Bool)

(assert (=> b!1052973 m!973795))

(declare-fun m!973797 () Bool)

(assert (=> b!1052973 m!973797))

(declare-fun m!973799 () Bool)

(assert (=> b!1052971 m!973799))

(declare-fun m!973801 () Bool)

(assert (=> b!1052968 m!973801))

(declare-fun m!973803 () Bool)

(assert (=> b!1052978 m!973803))

(declare-fun m!973805 () Bool)

(assert (=> b!1052970 m!973805))

(declare-fun m!973807 () Bool)

(assert (=> b!1052969 m!973807))

(declare-fun m!973809 () Bool)

(assert (=> b!1052975 m!973809))

(declare-fun m!973811 () Bool)

(assert (=> b!1052976 m!973811))

(assert (=> b!1052977 m!973797))

(declare-fun m!973813 () Bool)

(assert (=> b!1052977 m!973813))

(declare-fun m!973815 () Bool)

(assert (=> start!92718 m!973815))

(declare-fun m!973817 () Bool)

(assert (=> b!1052979 m!973817))

(check-sat (not b!1052979) (not b!1052976) (not b!1052973) (not b!1052968) (not start!92718) (not b!1052978) (not b!1052972) (not b!1052971) (not b!1052975) (not b!1052969))
(check-sat)
