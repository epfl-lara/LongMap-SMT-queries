; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92212 () Bool)

(assert start!92212)

(declare-fun b!1048257 () Bool)

(declare-fun e!594534 () Bool)

(declare-fun lt!463155 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1048257 (= e!594534 (not (or (bvsle lt!463155 i!1381) (bvsge lt!463155 #b00000000000000000000000000000000))))))

(declare-datatypes ((array!66040 0))(
  ( (array!66041 (arr!31761 (Array (_ BitVec 32) (_ BitVec 64))) (size!32297 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66040)

(declare-fun k!2747 () (_ BitVec 64))

(assert (=> b!1048257 (= (select (store (arr!31761 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463155) k!2747)))

(declare-fun b!1048258 () Bool)

(declare-fun res!697422 () Bool)

(declare-fun e!594533 () Bool)

(assert (=> b!1048258 (=> (not res!697422) (not e!594533))))

(declare-datatypes ((List!22073 0))(
  ( (Nil!22070) (Cons!22069 (h!23278 (_ BitVec 64)) (t!31380 List!22073)) )
))
(declare-fun arrayNoDuplicates!0 (array!66040 (_ BitVec 32) List!22073) Bool)

(assert (=> b!1048258 (= res!697422 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22070))))

(declare-fun b!1048259 () Bool)

(declare-fun res!697421 () Bool)

(assert (=> b!1048259 (=> (not res!697421) (not e!594533))))

(assert (=> b!1048259 (= res!697421 (= (select (arr!31761 a!3488) i!1381) k!2747))))

(declare-fun b!1048260 () Bool)

(declare-fun res!697420 () Bool)

(assert (=> b!1048260 (=> (not res!697420) (not e!594533))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1048260 (= res!697420 (validKeyInArray!0 k!2747))))

(declare-fun b!1048261 () Bool)

(declare-fun e!594535 () Bool)

(assert (=> b!1048261 (= e!594533 e!594535)))

(declare-fun res!697423 () Bool)

(assert (=> b!1048261 (=> (not res!697423) (not e!594535))))

(declare-fun lt!463154 () array!66040)

(declare-fun arrayContainsKey!0 (array!66040 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1048261 (= res!697423 (arrayContainsKey!0 lt!463154 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1048261 (= lt!463154 (array!66041 (store (arr!31761 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32297 a!3488)))))

(declare-fun res!697419 () Bool)

(assert (=> start!92212 (=> (not res!697419) (not e!594533))))

(assert (=> start!92212 (= res!697419 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32297 a!3488)) (bvslt (size!32297 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92212 e!594533))

(assert (=> start!92212 true))

(declare-fun array_inv!24541 (array!66040) Bool)

(assert (=> start!92212 (array_inv!24541 a!3488)))

(declare-fun b!1048262 () Bool)

(assert (=> b!1048262 (= e!594535 e!594534)))

(declare-fun res!697424 () Bool)

(assert (=> b!1048262 (=> (not res!697424) (not e!594534))))

(assert (=> b!1048262 (= res!697424 (not (= lt!463155 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66040 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1048262 (= lt!463155 (arrayScanForKey!0 lt!463154 k!2747 #b00000000000000000000000000000000))))

(assert (= (and start!92212 res!697419) b!1048258))

(assert (= (and b!1048258 res!697422) b!1048260))

(assert (= (and b!1048260 res!697420) b!1048259))

(assert (= (and b!1048259 res!697421) b!1048261))

(assert (= (and b!1048261 res!697423) b!1048262))

(assert (= (and b!1048262 res!697424) b!1048257))

(declare-fun m!969271 () Bool)

(assert (=> b!1048257 m!969271))

(declare-fun m!969273 () Bool)

(assert (=> b!1048257 m!969273))

(declare-fun m!969275 () Bool)

(assert (=> b!1048262 m!969275))

(declare-fun m!969277 () Bool)

(assert (=> b!1048260 m!969277))

(declare-fun m!969279 () Bool)

(assert (=> b!1048259 m!969279))

(declare-fun m!969281 () Bool)

(assert (=> b!1048258 m!969281))

(declare-fun m!969283 () Bool)

(assert (=> start!92212 m!969283))

(declare-fun m!969285 () Bool)

(assert (=> b!1048261 m!969285))

(assert (=> b!1048261 m!969271))

(push 1)

