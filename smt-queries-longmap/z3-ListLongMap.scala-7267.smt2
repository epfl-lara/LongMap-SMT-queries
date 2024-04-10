; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92786 () Bool)

(assert start!92786)

(declare-fun b!1053966 () Bool)

(declare-fun e!598682 () Bool)

(declare-fun e!598685 () Bool)

(assert (=> b!1053966 (= e!598682 e!598685)))

(declare-fun res!702950 () Bool)

(assert (=> b!1053966 (=> (not res!702950) (not e!598685))))

(declare-fun lt!465268 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1053966 (= res!702950 (not (= lt!465268 i!1381)))))

(declare-datatypes ((array!66479 0))(
  ( (array!66480 (arr!31973 (Array (_ BitVec 32) (_ BitVec 64))) (size!32509 (_ BitVec 32))) )
))
(declare-fun lt!465270 () array!66479)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66479 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1053966 (= lt!465268 (arrayScanForKey!0 lt!465270 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1053967 () Bool)

(declare-fun e!598683 () Bool)

(assert (=> b!1053967 (= e!598683 (bvsge lt!465268 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66479)

(declare-datatypes ((List!22285 0))(
  ( (Nil!22282) (Cons!22281 (h!23490 (_ BitVec 64)) (t!31592 List!22285)) )
))
(declare-fun arrayNoDuplicates!0 (array!66479 (_ BitVec 32) List!22285) Bool)

(assert (=> b!1053967 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22282)))

(declare-datatypes ((Unit!34504 0))(
  ( (Unit!34505) )
))
(declare-fun lt!465269 () Unit!34504)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66479 (_ BitVec 32) (_ BitVec 32)) Unit!34504)

(assert (=> b!1053967 (= lt!465269 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1053968 () Bool)

(assert (=> b!1053968 (= e!598685 (not e!598683))))

(declare-fun res!702949 () Bool)

(assert (=> b!1053968 (=> res!702949 e!598683)))

(assert (=> b!1053968 (= res!702949 (bvsle lt!465268 i!1381))))

(declare-fun e!598684 () Bool)

(assert (=> b!1053968 e!598684))

(declare-fun res!702948 () Bool)

(assert (=> b!1053968 (=> (not res!702948) (not e!598684))))

(assert (=> b!1053968 (= res!702948 (= (select (store (arr!31973 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465268) k0!2747))))

(declare-fun b!1053969 () Bool)

(declare-fun res!702956 () Bool)

(declare-fun e!598687 () Bool)

(assert (=> b!1053969 (=> (not res!702956) (not e!598687))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1053969 (= res!702956 (validKeyInArray!0 k0!2747))))

(declare-fun res!702954 () Bool)

(assert (=> start!92786 (=> (not res!702954) (not e!598687))))

(assert (=> start!92786 (= res!702954 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32509 a!3488)) (bvslt (size!32509 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92786 e!598687))

(assert (=> start!92786 true))

(declare-fun array_inv!24753 (array!66479) Bool)

(assert (=> start!92786 (array_inv!24753 a!3488)))

(declare-fun b!1053970 () Bool)

(declare-fun res!702955 () Bool)

(assert (=> b!1053970 (=> (not res!702955) (not e!598687))))

(assert (=> b!1053970 (= res!702955 (= (select (arr!31973 a!3488) i!1381) k0!2747))))

(declare-fun b!1053971 () Bool)

(declare-fun e!598681 () Bool)

(assert (=> b!1053971 (= e!598684 e!598681)))

(declare-fun res!702951 () Bool)

(assert (=> b!1053971 (=> res!702951 e!598681)))

(assert (=> b!1053971 (= res!702951 (bvsle lt!465268 i!1381))))

(declare-fun b!1053972 () Bool)

(declare-fun arrayContainsKey!0 (array!66479 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1053972 (= e!598681 (arrayContainsKey!0 a!3488 k0!2747 lt!465268))))

(declare-fun b!1053973 () Bool)

(declare-fun res!702952 () Bool)

(assert (=> b!1053973 (=> (not res!702952) (not e!598687))))

(assert (=> b!1053973 (= res!702952 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22282))))

(declare-fun b!1053974 () Bool)

(assert (=> b!1053974 (= e!598687 e!598682)))

(declare-fun res!702953 () Bool)

(assert (=> b!1053974 (=> (not res!702953) (not e!598682))))

(assert (=> b!1053974 (= res!702953 (arrayContainsKey!0 lt!465270 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1053974 (= lt!465270 (array!66480 (store (arr!31973 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32509 a!3488)))))

(assert (= (and start!92786 res!702954) b!1053973))

(assert (= (and b!1053973 res!702952) b!1053969))

(assert (= (and b!1053969 res!702956) b!1053970))

(assert (= (and b!1053970 res!702955) b!1053974))

(assert (= (and b!1053974 res!702953) b!1053966))

(assert (= (and b!1053966 res!702950) b!1053968))

(assert (= (and b!1053968 res!702948) b!1053971))

(assert (= (and b!1053971 (not res!702951)) b!1053972))

(assert (= (and b!1053968 (not res!702949)) b!1053967))

(declare-fun m!974121 () Bool)

(assert (=> b!1053968 m!974121))

(declare-fun m!974123 () Bool)

(assert (=> b!1053968 m!974123))

(declare-fun m!974125 () Bool)

(assert (=> b!1053969 m!974125))

(declare-fun m!974127 () Bool)

(assert (=> start!92786 m!974127))

(declare-fun m!974129 () Bool)

(assert (=> b!1053974 m!974129))

(assert (=> b!1053974 m!974121))

(declare-fun m!974131 () Bool)

(assert (=> b!1053966 m!974131))

(declare-fun m!974133 () Bool)

(assert (=> b!1053970 m!974133))

(declare-fun m!974135 () Bool)

(assert (=> b!1053972 m!974135))

(declare-fun m!974137 () Bool)

(assert (=> b!1053973 m!974137))

(declare-fun m!974139 () Bool)

(assert (=> b!1053967 m!974139))

(declare-fun m!974141 () Bool)

(assert (=> b!1053967 m!974141))

(check-sat (not start!92786) (not b!1053972) (not b!1053969) (not b!1053967) (not b!1053974) (not b!1053966) (not b!1053973))
(check-sat)
