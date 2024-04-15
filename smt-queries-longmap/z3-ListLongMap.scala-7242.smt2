; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92512 () Bool)

(assert start!92512)

(declare-fun b!1052042 () Bool)

(declare-fun e!597276 () Bool)

(declare-fun e!597275 () Bool)

(assert (=> b!1052042 (= e!597276 e!597275)))

(declare-fun res!701263 () Bool)

(assert (=> b!1052042 (=> res!701263 e!597275)))

(declare-fun lt!464438 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1052042 (= res!701263 (or (bvsgt lt!464438 i!1381) (bvsle i!1381 lt!464438)))))

(declare-fun b!1052043 () Bool)

(declare-fun res!701261 () Bool)

(declare-fun e!597270 () Bool)

(assert (=> b!1052043 (=> res!701261 e!597270)))

(declare-datatypes ((List!22237 0))(
  ( (Nil!22234) (Cons!22233 (h!23442 (_ BitVec 64)) (t!31535 List!22237)) )
))
(declare-fun contains!6124 (List!22237 (_ BitVec 64)) Bool)

(assert (=> b!1052043 (= res!701261 (contains!6124 Nil!22234 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1052044 () Bool)

(declare-fun e!597273 () Bool)

(declare-fun e!597274 () Bool)

(assert (=> b!1052044 (= e!597273 e!597274)))

(declare-fun res!701257 () Bool)

(assert (=> b!1052044 (=> (not res!701257) (not e!597274))))

(declare-datatypes ((array!66254 0))(
  ( (array!66255 (arr!31866 (Array (_ BitVec 32) (_ BitVec 64))) (size!32404 (_ BitVec 32))) )
))
(declare-fun lt!464437 () array!66254)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66254 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1052044 (= res!701257 (arrayContainsKey!0 lt!464437 k0!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66254)

(assert (=> b!1052044 (= lt!464437 (array!66255 (store (arr!31866 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32404 a!3488)))))

(declare-fun b!1052045 () Bool)

(declare-fun res!701259 () Bool)

(assert (=> b!1052045 (=> res!701259 e!597270)))

(declare-fun noDuplicate!1549 (List!22237) Bool)

(assert (=> b!1052045 (= res!701259 (not (noDuplicate!1549 Nil!22234)))))

(declare-fun b!1052046 () Bool)

(declare-fun e!597271 () Bool)

(assert (=> b!1052046 (= e!597271 e!597270)))

(declare-fun res!701258 () Bool)

(assert (=> b!1052046 (=> res!701258 e!597270)))

(declare-fun lt!464439 () (_ BitVec 32))

(assert (=> b!1052046 (= res!701258 (or (bvslt lt!464438 #b00000000000000000000000000000000) (bvsge lt!464439 (size!32404 a!3488)) (bvsge lt!464438 (size!32404 a!3488))))))

(assert (=> b!1052046 (arrayContainsKey!0 a!3488 k0!2747 lt!464439)))

(declare-datatypes ((Unit!34337 0))(
  ( (Unit!34338) )
))
(declare-fun lt!464440 () Unit!34337)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66254 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34337)

(assert (=> b!1052046 (= lt!464440 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!464439))))

(assert (=> b!1052046 (= lt!464439 (bvadd #b00000000000000000000000000000001 lt!464438))))

(declare-fun arrayNoDuplicates!0 (array!66254 (_ BitVec 32) List!22237) Bool)

(assert (=> b!1052046 (arrayNoDuplicates!0 a!3488 lt!464438 Nil!22234)))

(declare-fun lt!464436 () Unit!34337)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66254 (_ BitVec 32) (_ BitVec 32)) Unit!34337)

(assert (=> b!1052046 (= lt!464436 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464438))))

(declare-fun b!1052047 () Bool)

(assert (=> b!1052047 (= e!597275 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1052048 () Bool)

(declare-fun e!597272 () Bool)

(assert (=> b!1052048 (= e!597274 e!597272)))

(declare-fun res!701252 () Bool)

(assert (=> b!1052048 (=> (not res!701252) (not e!597272))))

(assert (=> b!1052048 (= res!701252 (not (= lt!464438 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66254 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1052048 (= lt!464438 (arrayScanForKey!0 lt!464437 k0!2747 #b00000000000000000000000000000000))))

(declare-fun res!701260 () Bool)

(assert (=> start!92512 (=> (not res!701260) (not e!597273))))

(assert (=> start!92512 (= res!701260 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32404 a!3488)) (bvslt (size!32404 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92512 e!597273))

(assert (=> start!92512 true))

(declare-fun array_inv!24649 (array!66254) Bool)

(assert (=> start!92512 (array_inv!24649 a!3488)))

(declare-fun b!1052049 () Bool)

(declare-fun res!701253 () Bool)

(assert (=> b!1052049 (=> (not res!701253) (not e!597273))))

(assert (=> b!1052049 (= res!701253 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22234))))

(declare-fun b!1052050 () Bool)

(assert (=> b!1052050 (= e!597270 true)))

(declare-fun lt!464435 () Bool)

(assert (=> b!1052050 (= lt!464435 (contains!6124 Nil!22234 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1052051 () Bool)

(declare-fun res!701255 () Bool)

(assert (=> b!1052051 (=> (not res!701255) (not e!597273))))

(assert (=> b!1052051 (= res!701255 (= (select (arr!31866 a!3488) i!1381) k0!2747))))

(declare-fun b!1052052 () Bool)

(assert (=> b!1052052 (= e!597272 (not e!597271))))

(declare-fun res!701256 () Bool)

(assert (=> b!1052052 (=> res!701256 e!597271)))

(assert (=> b!1052052 (= res!701256 (or (bvsgt lt!464438 i!1381) (bvsle i!1381 lt!464438)))))

(assert (=> b!1052052 e!597276))

(declare-fun res!701254 () Bool)

(assert (=> b!1052052 (=> (not res!701254) (not e!597276))))

(assert (=> b!1052052 (= res!701254 (= (select (store (arr!31866 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464438) k0!2747))))

(declare-fun b!1052053 () Bool)

(declare-fun res!701262 () Bool)

(assert (=> b!1052053 (=> (not res!701262) (not e!597273))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1052053 (= res!701262 (validKeyInArray!0 k0!2747))))

(assert (= (and start!92512 res!701260) b!1052049))

(assert (= (and b!1052049 res!701253) b!1052053))

(assert (= (and b!1052053 res!701262) b!1052051))

(assert (= (and b!1052051 res!701255) b!1052044))

(assert (= (and b!1052044 res!701257) b!1052048))

(assert (= (and b!1052048 res!701252) b!1052052))

(assert (= (and b!1052052 res!701254) b!1052042))

(assert (= (and b!1052042 (not res!701263)) b!1052047))

(assert (= (and b!1052052 (not res!701256)) b!1052046))

(assert (= (and b!1052046 (not res!701258)) b!1052045))

(assert (= (and b!1052045 (not res!701259)) b!1052043))

(assert (= (and b!1052043 (not res!701261)) b!1052050))

(declare-fun m!971983 () Bool)

(assert (=> b!1052050 m!971983))

(declare-fun m!971985 () Bool)

(assert (=> b!1052046 m!971985))

(declare-fun m!971987 () Bool)

(assert (=> b!1052046 m!971987))

(declare-fun m!971989 () Bool)

(assert (=> b!1052046 m!971989))

(declare-fun m!971991 () Bool)

(assert (=> b!1052046 m!971991))

(declare-fun m!971993 () Bool)

(assert (=> b!1052044 m!971993))

(declare-fun m!971995 () Bool)

(assert (=> b!1052044 m!971995))

(assert (=> b!1052052 m!971995))

(declare-fun m!971997 () Bool)

(assert (=> b!1052052 m!971997))

(declare-fun m!971999 () Bool)

(assert (=> b!1052049 m!971999))

(declare-fun m!972001 () Bool)

(assert (=> b!1052048 m!972001))

(declare-fun m!972003 () Bool)

(assert (=> b!1052047 m!972003))

(declare-fun m!972005 () Bool)

(assert (=> b!1052043 m!972005))

(declare-fun m!972007 () Bool)

(assert (=> start!92512 m!972007))

(declare-fun m!972009 () Bool)

(assert (=> b!1052053 m!972009))

(declare-fun m!972011 () Bool)

(assert (=> b!1052051 m!972011))

(declare-fun m!972013 () Bool)

(assert (=> b!1052045 m!972013))

(check-sat (not b!1052045) (not b!1052044) (not b!1052048) (not b!1052049) (not b!1052043) (not start!92512) (not b!1052053) (not b!1052050) (not b!1052046) (not b!1052047))
(check-sat)
