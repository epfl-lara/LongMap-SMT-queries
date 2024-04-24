; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92742 () Bool)

(assert start!92742)

(declare-fun b!1053400 () Bool)

(declare-fun e!598137 () Bool)

(declare-fun e!598133 () Bool)

(assert (=> b!1053400 (= e!598137 (not e!598133))))

(declare-fun res!701721 () Bool)

(assert (=> b!1053400 (=> res!701721 e!598133)))

(declare-fun lt!465099 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1053400 (= res!701721 (or (bvsgt lt!465099 i!1381) (bvsle i!1381 lt!465099)))))

(declare-fun e!598135 () Bool)

(assert (=> b!1053400 e!598135))

(declare-fun res!701727 () Bool)

(assert (=> b!1053400 (=> (not res!701727) (not e!598135))))

(declare-datatypes ((array!66358 0))(
  ( (array!66359 (arr!31912 (Array (_ BitVec 32) (_ BitVec 64))) (size!32449 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66358)

(declare-fun k0!2747 () (_ BitVec 64))

(assert (=> b!1053400 (= res!701727 (= (select (store (arr!31912 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465099) k0!2747))))

(declare-fun b!1053401 () Bool)

(declare-fun e!598136 () Bool)

(assert (=> b!1053401 (= e!598133 e!598136)))

(declare-fun res!701731 () Bool)

(assert (=> b!1053401 (=> res!701731 e!598136)))

(declare-fun lt!465096 () (_ BitVec 32))

(assert (=> b!1053401 (= res!701731 (or (bvslt lt!465099 #b00000000000000000000000000000000) (bvsge lt!465096 (size!32449 a!3488)) (bvsge lt!465099 (size!32449 a!3488))))))

(declare-fun arrayContainsKey!0 (array!66358 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1053401 (arrayContainsKey!0 a!3488 k0!2747 lt!465096)))

(declare-datatypes ((Unit!34465 0))(
  ( (Unit!34466) )
))
(declare-fun lt!465098 () Unit!34465)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66358 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34465)

(assert (=> b!1053401 (= lt!465098 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!465096))))

(assert (=> b!1053401 (= lt!465096 (bvadd #b00000000000000000000000000000001 lt!465099))))

(declare-datatypes ((List!22194 0))(
  ( (Nil!22191) (Cons!22190 (h!23408 (_ BitVec 64)) (t!31493 List!22194)) )
))
(declare-fun arrayNoDuplicates!0 (array!66358 (_ BitVec 32) List!22194) Bool)

(assert (=> b!1053401 (arrayNoDuplicates!0 a!3488 lt!465099 Nil!22191)))

(declare-fun lt!465097 () Unit!34465)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66358 (_ BitVec 32) (_ BitVec 32)) Unit!34465)

(assert (=> b!1053401 (= lt!465097 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!465099))))

(declare-fun e!598131 () Bool)

(declare-fun b!1053402 () Bool)

(assert (=> b!1053402 (= e!598131 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1053403 () Bool)

(declare-fun res!701732 () Bool)

(declare-fun e!598134 () Bool)

(assert (=> b!1053403 (=> (not res!701732) (not e!598134))))

(assert (=> b!1053403 (= res!701732 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22191))))

(declare-fun b!1053404 () Bool)

(declare-fun res!701725 () Bool)

(assert (=> b!1053404 (=> res!701725 e!598136)))

(declare-fun contains!6173 (List!22194 (_ BitVec 64)) Bool)

(assert (=> b!1053404 (= res!701725 (contains!6173 Nil!22191 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1053405 () Bool)

(declare-fun res!701730 () Bool)

(assert (=> b!1053405 (=> (not res!701730) (not e!598134))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1053405 (= res!701730 (validKeyInArray!0 k0!2747))))

(declare-fun res!701729 () Bool)

(assert (=> start!92742 (=> (not res!701729) (not e!598134))))

(assert (=> start!92742 (= res!701729 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32449 a!3488)) (bvslt (size!32449 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92742 e!598134))

(assert (=> start!92742 true))

(declare-fun array_inv!24694 (array!66358) Bool)

(assert (=> start!92742 (array_inv!24694 a!3488)))

(declare-fun b!1053406 () Bool)

(declare-fun e!598132 () Bool)

(assert (=> b!1053406 (= e!598132 e!598137)))

(declare-fun res!701723 () Bool)

(assert (=> b!1053406 (=> (not res!701723) (not e!598137))))

(assert (=> b!1053406 (= res!701723 (not (= lt!465099 i!1381)))))

(declare-fun lt!465100 () array!66358)

(declare-fun arrayScanForKey!0 (array!66358 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1053406 (= lt!465099 (arrayScanForKey!0 lt!465100 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1053407 () Bool)

(declare-fun res!701726 () Bool)

(assert (=> b!1053407 (=> res!701726 e!598136)))

(declare-fun noDuplicate!1549 (List!22194) Bool)

(assert (=> b!1053407 (= res!701726 (not (noDuplicate!1549 Nil!22191)))))

(declare-fun b!1053408 () Bool)

(assert (=> b!1053408 (= e!598135 e!598131)))

(declare-fun res!701728 () Bool)

(assert (=> b!1053408 (=> res!701728 e!598131)))

(assert (=> b!1053408 (= res!701728 (or (bvsgt lt!465099 i!1381) (bvsle i!1381 lt!465099)))))

(declare-fun b!1053409 () Bool)

(assert (=> b!1053409 (= e!598134 e!598132)))

(declare-fun res!701722 () Bool)

(assert (=> b!1053409 (=> (not res!701722) (not e!598132))))

(assert (=> b!1053409 (= res!701722 (arrayContainsKey!0 lt!465100 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1053409 (= lt!465100 (array!66359 (store (arr!31912 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32449 a!3488)))))

(declare-fun b!1053410 () Bool)

(assert (=> b!1053410 (= e!598136 true)))

(declare-fun lt!465101 () Bool)

(assert (=> b!1053410 (= lt!465101 (contains!6173 Nil!22191 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1053411 () Bool)

(declare-fun res!701724 () Bool)

(assert (=> b!1053411 (=> (not res!701724) (not e!598134))))

(assert (=> b!1053411 (= res!701724 (= (select (arr!31912 a!3488) i!1381) k0!2747))))

(assert (= (and start!92742 res!701729) b!1053403))

(assert (= (and b!1053403 res!701732) b!1053405))

(assert (= (and b!1053405 res!701730) b!1053411))

(assert (= (and b!1053411 res!701724) b!1053409))

(assert (= (and b!1053409 res!701722) b!1053406))

(assert (= (and b!1053406 res!701723) b!1053400))

(assert (= (and b!1053400 res!701727) b!1053408))

(assert (= (and b!1053408 (not res!701728)) b!1053402))

(assert (= (and b!1053400 (not res!701721)) b!1053401))

(assert (= (and b!1053401 (not res!701731)) b!1053407))

(assert (= (and b!1053407 (not res!701726)) b!1053404))

(assert (= (and b!1053404 (not res!701725)) b!1053410))

(declare-fun m!974171 () Bool)

(assert (=> b!1053404 m!974171))

(declare-fun m!974173 () Bool)

(assert (=> b!1053403 m!974173))

(declare-fun m!974175 () Bool)

(assert (=> b!1053411 m!974175))

(declare-fun m!974177 () Bool)

(assert (=> b!1053405 m!974177))

(declare-fun m!974179 () Bool)

(assert (=> b!1053406 m!974179))

(declare-fun m!974181 () Bool)

(assert (=> b!1053401 m!974181))

(declare-fun m!974183 () Bool)

(assert (=> b!1053401 m!974183))

(declare-fun m!974185 () Bool)

(assert (=> b!1053401 m!974185))

(declare-fun m!974187 () Bool)

(assert (=> b!1053401 m!974187))

(declare-fun m!974189 () Bool)

(assert (=> b!1053409 m!974189))

(declare-fun m!974191 () Bool)

(assert (=> b!1053409 m!974191))

(declare-fun m!974193 () Bool)

(assert (=> start!92742 m!974193))

(declare-fun m!974195 () Bool)

(assert (=> b!1053407 m!974195))

(declare-fun m!974197 () Bool)

(assert (=> b!1053402 m!974197))

(declare-fun m!974199 () Bool)

(assert (=> b!1053410 m!974199))

(assert (=> b!1053400 m!974191))

(declare-fun m!974201 () Bool)

(assert (=> b!1053400 m!974201))

(check-sat (not start!92742) (not b!1053404) (not b!1053405) (not b!1053410) (not b!1053409) (not b!1053402) (not b!1053403) (not b!1053407) (not b!1053401) (not b!1053406))
(check-sat)
