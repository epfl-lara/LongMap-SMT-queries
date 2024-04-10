; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93310 () Bool)

(assert start!93310)

(declare-fun b!1057644 () Bool)

(declare-fun e!601537 () Bool)

(declare-fun e!601534 () Bool)

(assert (=> b!1057644 (= e!601537 (not e!601534))))

(declare-fun res!706306 () Bool)

(assert (=> b!1057644 (=> res!706306 e!601534)))

(declare-fun lt!466559 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1057644 (= res!706306 (or (bvsgt lt!466559 i!1381) (bvsle i!1381 lt!466559)))))

(declare-fun e!601540 () Bool)

(assert (=> b!1057644 e!601540))

(declare-fun res!706304 () Bool)

(assert (=> b!1057644 (=> (not res!706304) (not e!601540))))

(declare-datatypes ((array!66709 0))(
  ( (array!66710 (arr!32076 (Array (_ BitVec 32) (_ BitVec 64))) (size!32612 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66709)

(declare-fun k!2747 () (_ BitVec 64))

(assert (=> b!1057644 (= res!706304 (= (select (store (arr!32076 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466559) k!2747))))

(declare-fun b!1057645 () Bool)

(declare-fun e!601535 () Bool)

(assert (=> b!1057645 (= e!601535 e!601537)))

(declare-fun res!706310 () Bool)

(assert (=> b!1057645 (=> (not res!706310) (not e!601537))))

(assert (=> b!1057645 (= res!706310 (not (= lt!466559 i!1381)))))

(declare-fun lt!466557 () array!66709)

(declare-fun arrayScanForKey!0 (array!66709 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1057645 (= lt!466559 (arrayScanForKey!0 lt!466557 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1057646 () Bool)

(declare-fun e!601539 () Bool)

(assert (=> b!1057646 (= e!601539 e!601535)))

(declare-fun res!706303 () Bool)

(assert (=> b!1057646 (=> (not res!706303) (not e!601535))))

(declare-fun arrayContainsKey!0 (array!66709 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1057646 (= res!706303 (arrayContainsKey!0 lt!466557 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1057646 (= lt!466557 (array!66710 (store (arr!32076 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32612 a!3488)))))

(declare-fun b!1057647 () Bool)

(declare-fun res!706305 () Bool)

(assert (=> b!1057647 (=> (not res!706305) (not e!601539))))

(declare-datatypes ((List!22388 0))(
  ( (Nil!22385) (Cons!22384 (h!23593 (_ BitVec 64)) (t!31695 List!22388)) )
))
(declare-fun arrayNoDuplicates!0 (array!66709 (_ BitVec 32) List!22388) Bool)

(assert (=> b!1057647 (= res!706305 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22385))))

(declare-fun b!1057648 () Bool)

(declare-fun res!706307 () Bool)

(assert (=> b!1057648 (=> (not res!706307) (not e!601539))))

(assert (=> b!1057648 (= res!706307 (= (select (arr!32076 a!3488) i!1381) k!2747))))

(declare-fun res!706309 () Bool)

(assert (=> start!93310 (=> (not res!706309) (not e!601539))))

(assert (=> start!93310 (= res!706309 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32612 a!3488)) (bvslt (size!32612 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93310 e!601539))

(assert (=> start!93310 true))

(declare-fun array_inv!24856 (array!66709) Bool)

(assert (=> start!93310 (array_inv!24856 a!3488)))

(declare-fun b!1057649 () Bool)

(declare-fun e!601536 () Bool)

(assert (=> b!1057649 (= e!601536 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun lt!466556 () (_ BitVec 32))

(declare-fun b!1057650 () Bool)

(assert (=> b!1057650 (= e!601534 (or (bvslt lt!466559 #b00000000000000000000000000000000) (bvsge lt!466556 (size!32612 a!3488)) (bvslt lt!466559 (size!32612 a!3488))))))

(assert (=> b!1057650 (arrayContainsKey!0 a!3488 k!2747 lt!466556)))

(declare-datatypes ((Unit!34674 0))(
  ( (Unit!34675) )
))
(declare-fun lt!466558 () Unit!34674)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66709 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34674)

(assert (=> b!1057650 (= lt!466558 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 i!1381 lt!466556))))

(assert (=> b!1057650 (= lt!466556 (bvadd #b00000000000000000000000000000001 lt!466559))))

(assert (=> b!1057650 (arrayNoDuplicates!0 a!3488 lt!466559 Nil!22385)))

(declare-fun lt!466560 () Unit!34674)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66709 (_ BitVec 32) (_ BitVec 32)) Unit!34674)

(assert (=> b!1057650 (= lt!466560 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466559))))

(declare-fun b!1057651 () Bool)

(assert (=> b!1057651 (= e!601540 e!601536)))

(declare-fun res!706302 () Bool)

(assert (=> b!1057651 (=> res!706302 e!601536)))

(assert (=> b!1057651 (= res!706302 (or (bvsgt lt!466559 i!1381) (bvsle i!1381 lt!466559)))))

(declare-fun b!1057652 () Bool)

(declare-fun res!706308 () Bool)

(assert (=> b!1057652 (=> (not res!706308) (not e!601539))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1057652 (= res!706308 (validKeyInArray!0 k!2747))))

(assert (= (and start!93310 res!706309) b!1057647))

(assert (= (and b!1057647 res!706305) b!1057652))

(assert (= (and b!1057652 res!706308) b!1057648))

(assert (= (and b!1057648 res!706307) b!1057646))

(assert (= (and b!1057646 res!706303) b!1057645))

(assert (= (and b!1057645 res!706310) b!1057644))

(assert (= (and b!1057644 res!706304) b!1057651))

(assert (= (and b!1057651 (not res!706302)) b!1057649))

(assert (= (and b!1057644 (not res!706306)) b!1057650))

(declare-fun m!977331 () Bool)

(assert (=> b!1057644 m!977331))

(declare-fun m!977333 () Bool)

(assert (=> b!1057644 m!977333))

(declare-fun m!977335 () Bool)

(assert (=> start!93310 m!977335))

(declare-fun m!977337 () Bool)

(assert (=> b!1057647 m!977337))

(declare-fun m!977339 () Bool)

(assert (=> b!1057646 m!977339))

(assert (=> b!1057646 m!977331))

(declare-fun m!977341 () Bool)

(assert (=> b!1057650 m!977341))

(declare-fun m!977343 () Bool)

(assert (=> b!1057650 m!977343))

(declare-fun m!977345 () Bool)

(assert (=> b!1057650 m!977345))

(declare-fun m!977347 () Bool)

(assert (=> b!1057650 m!977347))

(declare-fun m!977349 () Bool)

(assert (=> b!1057648 m!977349))

(declare-fun m!977351 () Bool)

(assert (=> b!1057649 m!977351))

(declare-fun m!977353 () Bool)

(assert (=> b!1057652 m!977353))

(declare-fun m!977355 () Bool)

(assert (=> b!1057645 m!977355))

(push 1)

(assert (not start!93310))

(assert (not b!1057652))

(assert (not b!1057649))

(assert (not b!1057646))

(assert (not b!1057650))

(assert (not b!1057645))

(assert (not b!1057647))

(check-sat)

(pop 1)

(push 1)

(check-sat)

