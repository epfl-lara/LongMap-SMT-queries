; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117454 () Bool)

(assert start!117454)

(declare-fun b!1380165 () Bool)

(declare-fun e!782018 () Bool)

(assert (=> b!1380165 (= e!782018 true)))

(declare-fun pivot!40 () (_ BitVec 32))

(declare-datatypes ((array!94005 0))(
  ( (array!94006 (arr!45397 (Array (_ BitVec 32) (_ BitVec 64))) (size!45947 (_ BitVec 32))) )
))
(declare-fun a!3985 () array!94005)

(declare-fun from!3363 () (_ BitVec 32))

(declare-fun to!159 () (_ BitVec 32))

(declare-fun isPivot!0 (array!94005 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1380165 (isPivot!0 a!3985 from!3363 to!159 pivot!40)))

(declare-fun knownPivot!5 () (_ BitVec 32))

(declare-datatypes ((Unit!45949 0))(
  ( (Unit!45950) )
))
(declare-fun lt!607884 () Unit!45949)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 (array!94005 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45949)

(assert (=> b!1380165 (= lt!607884 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 a!3985 from!3363 to!159 pivot!40 (bvadd #b00000000000000000000000000000001 knownPivot!5)))))

(declare-fun res!922435 () Bool)

(declare-fun e!782017 () Bool)

(assert (=> start!117454 (=> (not res!922435) (not e!782017))))

(assert (=> start!117454 (= res!922435 (and (bvslt (size!45947 a!3985) #b01111111111111111111111111111111) (bvsge from!3363 #b00000000000000000000000000000000) (bvsge to!159 from!3363) (bvsle to!159 (size!45947 a!3985)) (bvsge pivot!40 from!3363) (bvslt pivot!40 to!159) (bvsle knownPivot!5 pivot!40) (bvsge knownPivot!5 from!3363)))))

(assert (=> start!117454 e!782017))

(assert (=> start!117454 true))

(declare-fun array_inv!34425 (array!94005) Bool)

(assert (=> start!117454 (array_inv!34425 a!3985)))

(declare-fun b!1380164 () Bool)

(assert (=> b!1380164 (= e!782017 (not e!782018))))

(declare-fun res!922432 () Bool)

(assert (=> b!1380164 (=> res!922432 e!782018)))

(assert (=> b!1380164 (= res!922432 (or (bvsgt (bvadd #b00000000000000000000000000000001 knownPivot!5) pivot!40) (bvslt (bvadd #b00000000000000000000000000000001 knownPivot!5) from!3363)))))

(assert (=> b!1380164 (isPivot!0 a!3985 from!3363 to!159 (bvadd #b00000000000000000000000000000001 knownPivot!5))))

(declare-fun lt!607883 () Unit!45949)

(declare-fun lemmaKnownPivotPlusOneIsPivot!0 (array!94005 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45949)

(assert (=> b!1380164 (= lt!607883 (lemmaKnownPivotPlusOneIsPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(declare-fun b!1380162 () Bool)

(declare-fun res!922434 () Bool)

(assert (=> b!1380162 (=> (not res!922434) (not e!782017))))

(assert (=> b!1380162 (= res!922434 (isPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(declare-fun b!1380163 () Bool)

(declare-fun res!922433 () Bool)

(assert (=> b!1380163 (=> (not res!922433) (not e!782017))))

(assert (=> b!1380163 (= res!922433 (not (= knownPivot!5 pivot!40)))))

(assert (= (and start!117454 res!922435) b!1380162))

(assert (= (and b!1380162 res!922434) b!1380163))

(assert (= (and b!1380163 res!922433) b!1380164))

(assert (= (and b!1380164 (not res!922432)) b!1380165))

(declare-fun m!1265361 () Bool)

(assert (=> b!1380165 m!1265361))

(declare-fun m!1265363 () Bool)

(assert (=> b!1380165 m!1265363))

(declare-fun m!1265365 () Bool)

(assert (=> start!117454 m!1265365))

(declare-fun m!1265367 () Bool)

(assert (=> b!1380164 m!1265367))

(declare-fun m!1265369 () Bool)

(assert (=> b!1380164 m!1265369))

(declare-fun m!1265371 () Bool)

(assert (=> b!1380162 m!1265371))

(push 1)

(assert (not b!1380162))

(assert (not b!1380164))

(assert (not start!117454))

(assert (not b!1380165))

(check-sat)

(pop 1)

