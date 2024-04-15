; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93308 () Bool)

(assert start!93308)

(declare-fun b!1057493 () Bool)

(declare-fun e!601443 () Bool)

(declare-fun e!601449 () Bool)

(assert (=> b!1057493 (= e!601443 e!601449)))

(declare-fun res!706237 () Bool)

(assert (=> b!1057493 (=> (not res!706237) (not e!601449))))

(declare-datatypes ((array!66648 0))(
  ( (array!66649 (arr!32045 (Array (_ BitVec 32) (_ BitVec 64))) (size!32583 (_ BitVec 32))) )
))
(declare-fun lt!466356 () array!66648)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66648 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1057493 (= res!706237 (arrayContainsKey!0 lt!466356 k!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66648)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1057493 (= lt!466356 (array!66649 (store (arr!32045 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32583 a!3488)))))

(declare-fun b!1057494 () Bool)

(declare-fun e!601445 () Bool)

(assert (=> b!1057494 (= e!601445 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1057495 () Bool)

(declare-fun e!601447 () Bool)

(assert (=> b!1057495 (= e!601449 e!601447)))

(declare-fun res!706236 () Bool)

(assert (=> b!1057495 (=> (not res!706236) (not e!601447))))

(declare-fun lt!466357 () (_ BitVec 32))

(assert (=> b!1057495 (= res!706236 (not (= lt!466357 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66648 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1057495 (= lt!466357 (arrayScanForKey!0 lt!466356 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1057496 () Bool)

(declare-fun res!706239 () Bool)

(assert (=> b!1057496 (=> (not res!706239) (not e!601443))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1057496 (= res!706239 (validKeyInArray!0 k!2747))))

(declare-fun res!706240 () Bool)

(assert (=> start!93308 (=> (not res!706240) (not e!601443))))

(assert (=> start!93308 (= res!706240 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32583 a!3488)) (bvslt (size!32583 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93308 e!601443))

(assert (=> start!93308 true))

(declare-fun array_inv!24828 (array!66648) Bool)

(assert (=> start!93308 (array_inv!24828 a!3488)))

(declare-fun b!1057497 () Bool)

(declare-fun e!601444 () Bool)

(assert (=> b!1057497 (= e!601447 (not e!601444))))

(declare-fun res!706238 () Bool)

(assert (=> b!1057497 (=> res!706238 e!601444)))

(assert (=> b!1057497 (= res!706238 (or (bvsgt lt!466357 i!1381) (bvsle i!1381 lt!466357)))))

(declare-fun e!601448 () Bool)

(assert (=> b!1057497 e!601448))

(declare-fun res!706242 () Bool)

(assert (=> b!1057497 (=> (not res!706242) (not e!601448))))

(assert (=> b!1057497 (= res!706242 (= (select (store (arr!32045 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466357) k!2747))))

(declare-fun b!1057498 () Bool)

(declare-fun res!706243 () Bool)

(assert (=> b!1057498 (=> (not res!706243) (not e!601443))))

(declare-datatypes ((List!22416 0))(
  ( (Nil!22413) (Cons!22412 (h!23621 (_ BitVec 64)) (t!31714 List!22416)) )
))
(declare-fun arrayNoDuplicates!0 (array!66648 (_ BitVec 32) List!22416) Bool)

(assert (=> b!1057498 (= res!706243 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22413))))

(declare-fun lt!466360 () (_ BitVec 32))

(declare-fun b!1057499 () Bool)

(assert (=> b!1057499 (= e!601444 (or (bvslt lt!466357 #b00000000000000000000000000000000) (bvsge lt!466360 (size!32583 a!3488)) (bvslt lt!466357 (size!32583 a!3488))))))

(assert (=> b!1057499 (arrayContainsKey!0 a!3488 k!2747 lt!466360)))

(declare-datatypes ((Unit!34545 0))(
  ( (Unit!34546) )
))
(declare-fun lt!466359 () Unit!34545)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66648 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34545)

(assert (=> b!1057499 (= lt!466359 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 i!1381 lt!466360))))

(assert (=> b!1057499 (= lt!466360 (bvadd #b00000000000000000000000000000001 lt!466357))))

(assert (=> b!1057499 (arrayNoDuplicates!0 a!3488 lt!466357 Nil!22413)))

(declare-fun lt!466358 () Unit!34545)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66648 (_ BitVec 32) (_ BitVec 32)) Unit!34545)

(assert (=> b!1057499 (= lt!466358 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466357))))

(declare-fun b!1057500 () Bool)

(assert (=> b!1057500 (= e!601448 e!601445)))

(declare-fun res!706241 () Bool)

(assert (=> b!1057500 (=> res!706241 e!601445)))

(assert (=> b!1057500 (= res!706241 (or (bvsgt lt!466357 i!1381) (bvsle i!1381 lt!466357)))))

(declare-fun b!1057501 () Bool)

(declare-fun res!706235 () Bool)

(assert (=> b!1057501 (=> (not res!706235) (not e!601443))))

(assert (=> b!1057501 (= res!706235 (= (select (arr!32045 a!3488) i!1381) k!2747))))

(assert (= (and start!93308 res!706240) b!1057498))

(assert (= (and b!1057498 res!706243) b!1057496))

(assert (= (and b!1057496 res!706239) b!1057501))

(assert (= (and b!1057501 res!706235) b!1057493))

(assert (= (and b!1057493 res!706237) b!1057495))

(assert (= (and b!1057495 res!706236) b!1057497))

(assert (= (and b!1057497 res!706242) b!1057500))

(assert (= (and b!1057500 (not res!706241)) b!1057494))

(assert (= (and b!1057497 (not res!706238)) b!1057499))

(declare-fun m!976707 () Bool)

(assert (=> b!1057496 m!976707))

(declare-fun m!976709 () Bool)

(assert (=> b!1057499 m!976709))

(declare-fun m!976711 () Bool)

(assert (=> b!1057499 m!976711))

(declare-fun m!976713 () Bool)

(assert (=> b!1057499 m!976713))

(declare-fun m!976715 () Bool)

(assert (=> b!1057499 m!976715))

(declare-fun m!976717 () Bool)

(assert (=> b!1057493 m!976717))

(declare-fun m!976719 () Bool)

(assert (=> b!1057493 m!976719))

(declare-fun m!976721 () Bool)

(assert (=> b!1057498 m!976721))

(declare-fun m!976723 () Bool)

(assert (=> b!1057494 m!976723))

(declare-fun m!976725 () Bool)

(assert (=> b!1057501 m!976725))

(assert (=> b!1057497 m!976719))

(declare-fun m!976727 () Bool)

(assert (=> b!1057497 m!976727))

(declare-fun m!976729 () Bool)

(assert (=> b!1057495 m!976729))

(declare-fun m!976731 () Bool)

(assert (=> start!93308 m!976731))

(push 1)

(assert (not b!1057494))

(assert (not b!1057493))

(assert (not b!1057496))

(assert (not b!1057495))

(assert (not start!93308))

(assert (not b!1057499))

(assert (not b!1057498))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

