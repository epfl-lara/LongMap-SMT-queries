; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92520 () Bool)

(assert start!92520)

(declare-fun e!597435 () Bool)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66321 0))(
  ( (array!66322 (arr!31900 (Array (_ BitVec 32) (_ BitVec 64))) (size!32436 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66321)

(declare-fun b!1052301 () Bool)

(declare-fun arrayContainsKey!0 (array!66321 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1052301 (= e!597435 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1052302 () Bool)

(declare-fun res!701428 () Bool)

(declare-fun e!597433 () Bool)

(assert (=> b!1052302 (=> res!701428 e!597433)))

(declare-datatypes ((List!22212 0))(
  ( (Nil!22209) (Cons!22208 (h!23417 (_ BitVec 64)) (t!31519 List!22212)) )
))
(declare-fun noDuplicate!1539 (List!22212) Bool)

(assert (=> b!1052302 (= res!701428 (not (noDuplicate!1539 Nil!22209)))))

(declare-fun b!1052303 () Bool)

(declare-fun e!597437 () Bool)

(assert (=> b!1052303 (= e!597437 e!597433)))

(declare-fun res!701434 () Bool)

(assert (=> b!1052303 (=> res!701434 e!597433)))

(declare-fun lt!464689 () (_ BitVec 32))

(declare-fun lt!464694 () (_ BitVec 32))

(assert (=> b!1052303 (= res!701434 (or (bvslt lt!464689 #b00000000000000000000000000000000) (bvsge lt!464694 (size!32436 a!3488)) (bvsge lt!464689 (size!32436 a!3488))))))

(assert (=> b!1052303 (arrayContainsKey!0 a!3488 k!2747 lt!464694)))

(declare-datatypes ((Unit!34472 0))(
  ( (Unit!34473) )
))
(declare-fun lt!464690 () Unit!34472)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66321 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34472)

(assert (=> b!1052303 (= lt!464690 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 i!1381 lt!464694))))

(assert (=> b!1052303 (= lt!464694 (bvadd #b00000000000000000000000000000001 lt!464689))))

(declare-fun arrayNoDuplicates!0 (array!66321 (_ BitVec 32) List!22212) Bool)

(assert (=> b!1052303 (arrayNoDuplicates!0 a!3488 lt!464689 Nil!22209)))

(declare-fun lt!464692 () Unit!34472)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66321 (_ BitVec 32) (_ BitVec 32)) Unit!34472)

(assert (=> b!1052303 (= lt!464692 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464689))))

(declare-fun b!1052304 () Bool)

(declare-fun e!597438 () Bool)

(assert (=> b!1052304 (= e!597438 (not e!597437))))

(declare-fun res!701436 () Bool)

(assert (=> b!1052304 (=> res!701436 e!597437)))

(assert (=> b!1052304 (= res!701436 (or (bvsgt lt!464689 i!1381) (bvsle i!1381 lt!464689)))))

(declare-fun e!597439 () Bool)

(assert (=> b!1052304 e!597439))

(declare-fun res!701431 () Bool)

(assert (=> b!1052304 (=> (not res!701431) (not e!597439))))

(assert (=> b!1052304 (= res!701431 (= (select (store (arr!31900 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464689) k!2747))))

(declare-fun b!1052305 () Bool)

(declare-fun res!701433 () Bool)

(assert (=> b!1052305 (=> res!701433 e!597433)))

(declare-fun contains!6154 (List!22212 (_ BitVec 64)) Bool)

(assert (=> b!1052305 (= res!701433 (contains!6154 Nil!22209 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1052306 () Bool)

(declare-fun res!701430 () Bool)

(declare-fun e!597432 () Bool)

(assert (=> b!1052306 (=> (not res!701430) (not e!597432))))

(assert (=> b!1052306 (= res!701430 (= (select (arr!31900 a!3488) i!1381) k!2747))))

(declare-fun res!701438 () Bool)

(assert (=> start!92520 (=> (not res!701438) (not e!597432))))

(assert (=> start!92520 (= res!701438 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32436 a!3488)) (bvslt (size!32436 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92520 e!597432))

(assert (=> start!92520 true))

(declare-fun array_inv!24680 (array!66321) Bool)

(assert (=> start!92520 (array_inv!24680 a!3488)))

(declare-fun b!1052307 () Bool)

(declare-fun res!701427 () Bool)

(assert (=> b!1052307 (=> (not res!701427) (not e!597432))))

(assert (=> b!1052307 (= res!701427 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22209))))

(declare-fun b!1052308 () Bool)

(declare-fun e!597436 () Bool)

(assert (=> b!1052308 (= e!597436 e!597438)))

(declare-fun res!701432 () Bool)

(assert (=> b!1052308 (=> (not res!701432) (not e!597438))))

(assert (=> b!1052308 (= res!701432 (not (= lt!464689 i!1381)))))

(declare-fun lt!464691 () array!66321)

(declare-fun arrayScanForKey!0 (array!66321 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1052308 (= lt!464689 (arrayScanForKey!0 lt!464691 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1052309 () Bool)

(declare-fun res!701429 () Bool)

(assert (=> b!1052309 (=> (not res!701429) (not e!597432))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1052309 (= res!701429 (validKeyInArray!0 k!2747))))

(declare-fun b!1052310 () Bool)

(assert (=> b!1052310 (= e!597433 true)))

(declare-fun lt!464693 () Bool)

(assert (=> b!1052310 (= lt!464693 (contains!6154 Nil!22209 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1052311 () Bool)

(assert (=> b!1052311 (= e!597432 e!597436)))

(declare-fun res!701435 () Bool)

(assert (=> b!1052311 (=> (not res!701435) (not e!597436))))

(assert (=> b!1052311 (= res!701435 (arrayContainsKey!0 lt!464691 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1052311 (= lt!464691 (array!66322 (store (arr!31900 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32436 a!3488)))))

(declare-fun b!1052312 () Bool)

(assert (=> b!1052312 (= e!597439 e!597435)))

(declare-fun res!701437 () Bool)

(assert (=> b!1052312 (=> res!701437 e!597435)))

(assert (=> b!1052312 (= res!701437 (or (bvsgt lt!464689 i!1381) (bvsle i!1381 lt!464689)))))

(assert (= (and start!92520 res!701438) b!1052307))

(assert (= (and b!1052307 res!701427) b!1052309))

(assert (= (and b!1052309 res!701429) b!1052306))

(assert (= (and b!1052306 res!701430) b!1052311))

(assert (= (and b!1052311 res!701435) b!1052308))

(assert (= (and b!1052308 res!701432) b!1052304))

(assert (= (and b!1052304 res!701431) b!1052312))

(assert (= (and b!1052312 (not res!701437)) b!1052301))

(assert (= (and b!1052304 (not res!701436)) b!1052303))

(assert (= (and b!1052303 (not res!701434)) b!1052302))

(assert (= (and b!1052302 (not res!701428)) b!1052305))

(assert (= (and b!1052305 (not res!701433)) b!1052310))

(declare-fun m!972695 () Bool)

(assert (=> b!1052306 m!972695))

(declare-fun m!972697 () Bool)

(assert (=> b!1052303 m!972697))

(declare-fun m!972699 () Bool)

(assert (=> b!1052303 m!972699))

(declare-fun m!972701 () Bool)

(assert (=> b!1052303 m!972701))

(declare-fun m!972703 () Bool)

(assert (=> b!1052303 m!972703))

(declare-fun m!972705 () Bool)

(assert (=> b!1052301 m!972705))

(declare-fun m!972707 () Bool)

(assert (=> b!1052310 m!972707))

(declare-fun m!972709 () Bool)

(assert (=> b!1052305 m!972709))

(declare-fun m!972711 () Bool)

(assert (=> b!1052304 m!972711))

(declare-fun m!972713 () Bool)

(assert (=> b!1052304 m!972713))

(declare-fun m!972715 () Bool)

(assert (=> b!1052302 m!972715))

(declare-fun m!972717 () Bool)

(assert (=> b!1052308 m!972717))

(declare-fun m!972719 () Bool)

(assert (=> b!1052309 m!972719))

(declare-fun m!972721 () Bool)

(assert (=> b!1052311 m!972721))

(assert (=> b!1052311 m!972711))

(declare-fun m!972723 () Bool)

(assert (=> b!1052307 m!972723))

(declare-fun m!972725 () Bool)

(assert (=> start!92520 m!972725))

(push 1)

