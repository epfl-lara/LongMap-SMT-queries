; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92470 () Bool)

(assert start!92470)

(declare-fun b!1051431 () Bool)

(declare-fun e!596842 () Bool)

(assert (=> b!1051431 (= e!596842 true)))

(declare-datatypes ((array!66271 0))(
  ( (array!66272 (arr!31875 (Array (_ BitVec 32) (_ BitVec 64))) (size!32411 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66271)

(declare-fun lt!464271 () (_ BitVec 32))

(declare-datatypes ((List!22187 0))(
  ( (Nil!22184) (Cons!22183 (h!23392 (_ BitVec 64)) (t!31494 List!22187)) )
))
(declare-fun arrayNoDuplicates!0 (array!66271 (_ BitVec 32) List!22187) Bool)

(assert (=> b!1051431 (arrayNoDuplicates!0 a!3488 lt!464271 Nil!22184)))

(declare-datatypes ((Unit!34422 0))(
  ( (Unit!34423) )
))
(declare-fun lt!464269 () Unit!34422)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66271 (_ BitVec 32) (_ BitVec 32)) Unit!34422)

(assert (=> b!1051431 (= lt!464269 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464271))))

(declare-fun b!1051432 () Bool)

(declare-fun res!700564 () Bool)

(declare-fun e!596843 () Bool)

(assert (=> b!1051432 (=> (not res!700564) (not e!596843))))

(assert (=> b!1051432 (= res!700564 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22184))))

(declare-fun b!1051433 () Bool)

(declare-fun res!700557 () Bool)

(assert (=> b!1051433 (=> (not res!700557) (not e!596843))))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1051433 (= res!700557 (= (select (arr!31875 a!3488) i!1381) k!2747))))

(declare-fun b!1051434 () Bool)

(declare-fun e!596847 () Bool)

(assert (=> b!1051434 (= e!596843 e!596847)))

(declare-fun res!700560 () Bool)

(assert (=> b!1051434 (=> (not res!700560) (not e!596847))))

(declare-fun lt!464270 () array!66271)

(declare-fun arrayContainsKey!0 (array!66271 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1051434 (= res!700560 (arrayContainsKey!0 lt!464270 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1051434 (= lt!464270 (array!66272 (store (arr!31875 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32411 a!3488)))))

(declare-fun e!596845 () Bool)

(declare-fun b!1051435 () Bool)

(assert (=> b!1051435 (= e!596845 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1051436 () Bool)

(declare-fun res!700562 () Bool)

(assert (=> b!1051436 (=> (not res!700562) (not e!596843))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1051436 (= res!700562 (validKeyInArray!0 k!2747))))

(declare-fun b!1051437 () Bool)

(declare-fun e!596844 () Bool)

(assert (=> b!1051437 (= e!596847 e!596844)))

(declare-fun res!700565 () Bool)

(assert (=> b!1051437 (=> (not res!700565) (not e!596844))))

(assert (=> b!1051437 (= res!700565 (not (= lt!464271 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66271 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1051437 (= lt!464271 (arrayScanForKey!0 lt!464270 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1051438 () Bool)

(declare-fun e!596848 () Bool)

(assert (=> b!1051438 (= e!596848 e!596845)))

(declare-fun res!700559 () Bool)

(assert (=> b!1051438 (=> res!700559 e!596845)))

(assert (=> b!1051438 (= res!700559 (or (bvsgt lt!464271 i!1381) (bvsle i!1381 lt!464271)))))

(declare-fun b!1051439 () Bool)

(assert (=> b!1051439 (= e!596844 (not e!596842))))

(declare-fun res!700563 () Bool)

(assert (=> b!1051439 (=> res!700563 e!596842)))

(assert (=> b!1051439 (= res!700563 (or (bvsgt lt!464271 i!1381) (bvsle i!1381 lt!464271)))))

(assert (=> b!1051439 e!596848))

(declare-fun res!700558 () Bool)

(assert (=> b!1051439 (=> (not res!700558) (not e!596848))))

(assert (=> b!1051439 (= res!700558 (= (select (store (arr!31875 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464271) k!2747))))

(declare-fun res!700561 () Bool)

(assert (=> start!92470 (=> (not res!700561) (not e!596843))))

(assert (=> start!92470 (= res!700561 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32411 a!3488)) (bvslt (size!32411 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92470 e!596843))

(assert (=> start!92470 true))

(declare-fun array_inv!24655 (array!66271) Bool)

(assert (=> start!92470 (array_inv!24655 a!3488)))

(assert (= (and start!92470 res!700561) b!1051432))

(assert (= (and b!1051432 res!700564) b!1051436))

(assert (= (and b!1051436 res!700562) b!1051433))

(assert (= (and b!1051433 res!700557) b!1051434))

(assert (= (and b!1051434 res!700560) b!1051437))

(assert (= (and b!1051437 res!700565) b!1051439))

(assert (= (and b!1051439 res!700558) b!1051438))

(assert (= (and b!1051438 (not res!700559)) b!1051435))

(assert (= (and b!1051439 (not res!700563)) b!1051431))

(declare-fun m!971935 () Bool)

(assert (=> b!1051437 m!971935))

(declare-fun m!971937 () Bool)

(assert (=> b!1051436 m!971937))

(declare-fun m!971939 () Bool)

(assert (=> b!1051434 m!971939))

(declare-fun m!971941 () Bool)

(assert (=> b!1051434 m!971941))

(assert (=> b!1051439 m!971941))

(declare-fun m!971943 () Bool)

(assert (=> b!1051439 m!971943))

(declare-fun m!971945 () Bool)

(assert (=> b!1051435 m!971945))

(declare-fun m!971947 () Bool)

(assert (=> start!92470 m!971947))

(declare-fun m!971949 () Bool)

(assert (=> b!1051431 m!971949))

(declare-fun m!971951 () Bool)

(assert (=> b!1051431 m!971951))

(declare-fun m!971953 () Bool)

(assert (=> b!1051433 m!971953))

(declare-fun m!971955 () Bool)

(assert (=> b!1051432 m!971955))

(push 1)

