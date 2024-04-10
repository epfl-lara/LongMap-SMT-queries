; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93302 () Bool)

(assert start!93302)

(declare-fun b!1057536 () Bool)

(declare-fun res!706195 () Bool)

(declare-fun e!601451 () Bool)

(assert (=> b!1057536 (=> (not res!706195) (not e!601451))))

(declare-datatypes ((array!66701 0))(
  ( (array!66702 (arr!32072 (Array (_ BitVec 32) (_ BitVec 64))) (size!32608 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66701)

(declare-datatypes ((List!22384 0))(
  ( (Nil!22381) (Cons!22380 (h!23589 (_ BitVec 64)) (t!31691 List!22384)) )
))
(declare-fun arrayNoDuplicates!0 (array!66701 (_ BitVec 32) List!22384) Bool)

(assert (=> b!1057536 (= res!706195 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22381))))

(declare-fun b!1057537 () Bool)

(declare-fun res!706200 () Bool)

(assert (=> b!1057537 (=> (not res!706200) (not e!601451))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1057537 (= res!706200 (= (select (arr!32072 a!3488) i!1381) k0!2747))))

(declare-fun b!1057538 () Bool)

(declare-fun e!601453 () Bool)

(declare-fun e!601456 () Bool)

(assert (=> b!1057538 (= e!601453 (not e!601456))))

(declare-fun res!706202 () Bool)

(assert (=> b!1057538 (=> res!706202 e!601456)))

(declare-fun lt!466498 () (_ BitVec 32))

(assert (=> b!1057538 (= res!706202 (or (bvsgt lt!466498 i!1381) (bvsle i!1381 lt!466498)))))

(declare-fun e!601455 () Bool)

(assert (=> b!1057538 e!601455))

(declare-fun res!706196 () Bool)

(assert (=> b!1057538 (=> (not res!706196) (not e!601455))))

(assert (=> b!1057538 (= res!706196 (= (select (store (arr!32072 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466498) k0!2747))))

(declare-fun res!706199 () Bool)

(assert (=> start!93302 (=> (not res!706199) (not e!601451))))

(assert (=> start!93302 (= res!706199 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32608 a!3488)) (bvslt (size!32608 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93302 e!601451))

(assert (=> start!93302 true))

(declare-fun array_inv!24852 (array!66701) Bool)

(assert (=> start!93302 (array_inv!24852 a!3488)))

(declare-fun b!1057539 () Bool)

(declare-fun e!601454 () Bool)

(assert (=> b!1057539 (= e!601454 e!601453)))

(declare-fun res!706198 () Bool)

(assert (=> b!1057539 (=> (not res!706198) (not e!601453))))

(assert (=> b!1057539 (= res!706198 (not (= lt!466498 i!1381)))))

(declare-fun lt!466499 () array!66701)

(declare-fun arrayScanForKey!0 (array!66701 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1057539 (= lt!466498 (arrayScanForKey!0 lt!466499 k0!2747 #b00000000000000000000000000000000))))

(declare-fun lt!466500 () (_ BitVec 32))

(declare-fun b!1057540 () Bool)

(assert (=> b!1057540 (= e!601456 (or (bvslt lt!466498 #b00000000000000000000000000000000) (bvslt lt!466500 (size!32608 a!3488))))))

(declare-fun arrayContainsKey!0 (array!66701 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1057540 (arrayContainsKey!0 a!3488 k0!2747 lt!466500)))

(declare-datatypes ((Unit!34666 0))(
  ( (Unit!34667) )
))
(declare-fun lt!466496 () Unit!34666)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66701 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34666)

(assert (=> b!1057540 (= lt!466496 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!466500))))

(assert (=> b!1057540 (= lt!466500 (bvadd #b00000000000000000000000000000001 lt!466498))))

(assert (=> b!1057540 (arrayNoDuplicates!0 a!3488 lt!466498 Nil!22381)))

(declare-fun lt!466497 () Unit!34666)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66701 (_ BitVec 32) (_ BitVec 32)) Unit!34666)

(assert (=> b!1057540 (= lt!466497 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466498))))

(declare-fun b!1057541 () Bool)

(declare-fun e!601450 () Bool)

(assert (=> b!1057541 (= e!601450 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1057542 () Bool)

(assert (=> b!1057542 (= e!601451 e!601454)))

(declare-fun res!706197 () Bool)

(assert (=> b!1057542 (=> (not res!706197) (not e!601454))))

(assert (=> b!1057542 (= res!706197 (arrayContainsKey!0 lt!466499 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1057542 (= lt!466499 (array!66702 (store (arr!32072 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32608 a!3488)))))

(declare-fun b!1057543 () Bool)

(assert (=> b!1057543 (= e!601455 e!601450)))

(declare-fun res!706194 () Bool)

(assert (=> b!1057543 (=> res!706194 e!601450)))

(assert (=> b!1057543 (= res!706194 (or (bvsgt lt!466498 i!1381) (bvsle i!1381 lt!466498)))))

(declare-fun b!1057544 () Bool)

(declare-fun res!706201 () Bool)

(assert (=> b!1057544 (=> (not res!706201) (not e!601451))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1057544 (= res!706201 (validKeyInArray!0 k0!2747))))

(assert (= (and start!93302 res!706199) b!1057536))

(assert (= (and b!1057536 res!706195) b!1057544))

(assert (= (and b!1057544 res!706201) b!1057537))

(assert (= (and b!1057537 res!706200) b!1057542))

(assert (= (and b!1057542 res!706197) b!1057539))

(assert (= (and b!1057539 res!706198) b!1057538))

(assert (= (and b!1057538 res!706196) b!1057543))

(assert (= (and b!1057543 (not res!706194)) b!1057541))

(assert (= (and b!1057538 (not res!706202)) b!1057540))

(declare-fun m!977227 () Bool)

(assert (=> b!1057541 m!977227))

(declare-fun m!977229 () Bool)

(assert (=> b!1057540 m!977229))

(declare-fun m!977231 () Bool)

(assert (=> b!1057540 m!977231))

(declare-fun m!977233 () Bool)

(assert (=> b!1057540 m!977233))

(declare-fun m!977235 () Bool)

(assert (=> b!1057540 m!977235))

(declare-fun m!977237 () Bool)

(assert (=> b!1057542 m!977237))

(declare-fun m!977239 () Bool)

(assert (=> b!1057542 m!977239))

(declare-fun m!977241 () Bool)

(assert (=> b!1057536 m!977241))

(declare-fun m!977243 () Bool)

(assert (=> start!93302 m!977243))

(declare-fun m!977245 () Bool)

(assert (=> b!1057544 m!977245))

(assert (=> b!1057538 m!977239))

(declare-fun m!977247 () Bool)

(assert (=> b!1057538 m!977247))

(declare-fun m!977249 () Bool)

(assert (=> b!1057539 m!977249))

(declare-fun m!977251 () Bool)

(assert (=> b!1057537 m!977251))

(check-sat (not b!1057539) (not b!1057544) (not start!93302) (not b!1057536) (not b!1057540) (not b!1057541) (not b!1057542))
(check-sat)
