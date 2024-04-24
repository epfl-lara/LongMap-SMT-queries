; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92736 () Bool)

(assert start!92736)

(declare-fun b!1053292 () Bool)

(declare-fun e!598061 () Bool)

(declare-datatypes ((array!66352 0))(
  ( (array!66353 (arr!31909 (Array (_ BitVec 32) (_ BitVec 64))) (size!32446 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66352)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!66352 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1053292 (= e!598061 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1053293 () Bool)

(declare-fun res!701621 () Bool)

(declare-fun e!598062 () Bool)

(assert (=> b!1053293 (=> (not res!701621) (not e!598062))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1053293 (= res!701621 (validKeyInArray!0 k0!2747))))

(declare-fun b!1053295 () Bool)

(declare-fun e!598066 () Bool)

(assert (=> b!1053295 (= e!598066 true)))

(declare-fun lt!465045 () Bool)

(declare-datatypes ((List!22191 0))(
  ( (Nil!22188) (Cons!22187 (h!23405 (_ BitVec 64)) (t!31490 List!22191)) )
))
(declare-fun contains!6170 (List!22191 (_ BitVec 64)) Bool)

(assert (=> b!1053295 (= lt!465045 (contains!6170 Nil!22188 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1053296 () Bool)

(declare-fun e!598064 () Bool)

(assert (=> b!1053296 (= e!598064 e!598066)))

(declare-fun res!701620 () Bool)

(assert (=> b!1053296 (=> res!701620 e!598066)))

(declare-fun lt!465043 () (_ BitVec 32))

(declare-fun lt!465046 () (_ BitVec 32))

(assert (=> b!1053296 (= res!701620 (or (bvslt lt!465046 #b00000000000000000000000000000000) (bvsge lt!465043 (size!32446 a!3488)) (bvsge lt!465046 (size!32446 a!3488))))))

(assert (=> b!1053296 (arrayContainsKey!0 a!3488 k0!2747 lt!465043)))

(declare-datatypes ((Unit!34459 0))(
  ( (Unit!34460) )
))
(declare-fun lt!465047 () Unit!34459)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66352 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34459)

(assert (=> b!1053296 (= lt!465047 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!465043))))

(assert (=> b!1053296 (= lt!465043 (bvadd #b00000000000000000000000000000001 lt!465046))))

(declare-fun arrayNoDuplicates!0 (array!66352 (_ BitVec 32) List!22191) Bool)

(assert (=> b!1053296 (arrayNoDuplicates!0 a!3488 lt!465046 Nil!22188)))

(declare-fun lt!465044 () Unit!34459)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66352 (_ BitVec 32) (_ BitVec 32)) Unit!34459)

(assert (=> b!1053296 (= lt!465044 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!465046))))

(declare-fun b!1053297 () Bool)

(declare-fun res!701615 () Bool)

(assert (=> b!1053297 (=> res!701615 e!598066)))

(assert (=> b!1053297 (= res!701615 (contains!6170 Nil!22188 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1053298 () Bool)

(declare-fun res!701619 () Bool)

(assert (=> b!1053298 (=> (not res!701619) (not e!598062))))

(assert (=> b!1053298 (= res!701619 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22188))))

(declare-fun b!1053299 () Bool)

(declare-fun e!598060 () Bool)

(assert (=> b!1053299 (= e!598062 e!598060)))

(declare-fun res!701618 () Bool)

(assert (=> b!1053299 (=> (not res!701618) (not e!598060))))

(declare-fun lt!465042 () array!66352)

(assert (=> b!1053299 (= res!701618 (arrayContainsKey!0 lt!465042 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1053299 (= lt!465042 (array!66353 (store (arr!31909 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32446 a!3488)))))

(declare-fun b!1053300 () Bool)

(declare-fun res!701624 () Bool)

(assert (=> b!1053300 (=> res!701624 e!598066)))

(declare-fun noDuplicate!1546 (List!22191) Bool)

(assert (=> b!1053300 (= res!701624 (not (noDuplicate!1546 Nil!22188)))))

(declare-fun b!1053301 () Bool)

(declare-fun e!598059 () Bool)

(assert (=> b!1053301 (= e!598059 (not e!598064))))

(declare-fun res!701623 () Bool)

(assert (=> b!1053301 (=> res!701623 e!598064)))

(assert (=> b!1053301 (= res!701623 (or (bvsgt lt!465046 i!1381) (bvsle i!1381 lt!465046)))))

(declare-fun e!598063 () Bool)

(assert (=> b!1053301 e!598063))

(declare-fun res!701617 () Bool)

(assert (=> b!1053301 (=> (not res!701617) (not e!598063))))

(assert (=> b!1053301 (= res!701617 (= (select (store (arr!31909 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465046) k0!2747))))

(declare-fun b!1053294 () Bool)

(declare-fun res!701613 () Bool)

(assert (=> b!1053294 (=> (not res!701613) (not e!598062))))

(assert (=> b!1053294 (= res!701613 (= (select (arr!31909 a!3488) i!1381) k0!2747))))

(declare-fun res!701622 () Bool)

(assert (=> start!92736 (=> (not res!701622) (not e!598062))))

(assert (=> start!92736 (= res!701622 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32446 a!3488)) (bvslt (size!32446 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92736 e!598062))

(assert (=> start!92736 true))

(declare-fun array_inv!24691 (array!66352) Bool)

(assert (=> start!92736 (array_inv!24691 a!3488)))

(declare-fun b!1053302 () Bool)

(assert (=> b!1053302 (= e!598063 e!598061)))

(declare-fun res!701614 () Bool)

(assert (=> b!1053302 (=> res!701614 e!598061)))

(assert (=> b!1053302 (= res!701614 (or (bvsgt lt!465046 i!1381) (bvsle i!1381 lt!465046)))))

(declare-fun b!1053303 () Bool)

(assert (=> b!1053303 (= e!598060 e!598059)))

(declare-fun res!701616 () Bool)

(assert (=> b!1053303 (=> (not res!701616) (not e!598059))))

(assert (=> b!1053303 (= res!701616 (not (= lt!465046 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66352 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1053303 (= lt!465046 (arrayScanForKey!0 lt!465042 k0!2747 #b00000000000000000000000000000000))))

(assert (= (and start!92736 res!701622) b!1053298))

(assert (= (and b!1053298 res!701619) b!1053293))

(assert (= (and b!1053293 res!701621) b!1053294))

(assert (= (and b!1053294 res!701613) b!1053299))

(assert (= (and b!1053299 res!701618) b!1053303))

(assert (= (and b!1053303 res!701616) b!1053301))

(assert (= (and b!1053301 res!701617) b!1053302))

(assert (= (and b!1053302 (not res!701614)) b!1053292))

(assert (= (and b!1053301 (not res!701623)) b!1053296))

(assert (= (and b!1053296 (not res!701620)) b!1053300))

(assert (= (and b!1053300 (not res!701624)) b!1053297))

(assert (= (and b!1053297 (not res!701615)) b!1053295))

(declare-fun m!974075 () Bool)

(assert (=> b!1053303 m!974075))

(declare-fun m!974077 () Bool)

(assert (=> b!1053295 m!974077))

(declare-fun m!974079 () Bool)

(assert (=> b!1053298 m!974079))

(declare-fun m!974081 () Bool)

(assert (=> b!1053292 m!974081))

(declare-fun m!974083 () Bool)

(assert (=> b!1053296 m!974083))

(declare-fun m!974085 () Bool)

(assert (=> b!1053296 m!974085))

(declare-fun m!974087 () Bool)

(assert (=> b!1053296 m!974087))

(declare-fun m!974089 () Bool)

(assert (=> b!1053296 m!974089))

(declare-fun m!974091 () Bool)

(assert (=> b!1053294 m!974091))

(declare-fun m!974093 () Bool)

(assert (=> b!1053293 m!974093))

(declare-fun m!974095 () Bool)

(assert (=> b!1053297 m!974095))

(declare-fun m!974097 () Bool)

(assert (=> b!1053301 m!974097))

(declare-fun m!974099 () Bool)

(assert (=> b!1053301 m!974099))

(declare-fun m!974101 () Bool)

(assert (=> b!1053299 m!974101))

(assert (=> b!1053299 m!974097))

(declare-fun m!974103 () Bool)

(assert (=> b!1053300 m!974103))

(declare-fun m!974105 () Bool)

(assert (=> start!92736 m!974105))

(check-sat (not b!1053295) (not b!1053297) (not start!92736) (not b!1053303) (not b!1053293) (not b!1053298) (not b!1053299) (not b!1053300) (not b!1053292) (not b!1053296))
(check-sat)
