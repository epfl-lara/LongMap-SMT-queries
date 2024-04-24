; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93156 () Bool)

(assert start!93156)

(declare-fun b!1056274 () Bool)

(declare-fun res!704374 () Bool)

(declare-fun e!600303 () Bool)

(assert (=> b!1056274 (=> (not res!704374) (not e!600303))))

(declare-datatypes ((array!66592 0))(
  ( (array!66593 (arr!32020 (Array (_ BitVec 32) (_ BitVec 64))) (size!32557 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66592)

(declare-datatypes ((List!22302 0))(
  ( (Nil!22299) (Cons!22298 (h!23516 (_ BitVec 64)) (t!31601 List!22302)) )
))
(declare-fun arrayNoDuplicates!0 (array!66592 (_ BitVec 32) List!22302) Bool)

(assert (=> b!1056274 (= res!704374 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22299))))

(declare-fun b!1056275 () Bool)

(declare-fun e!600307 () Bool)

(declare-fun e!600304 () Bool)

(assert (=> b!1056275 (= e!600307 (not e!600304))))

(declare-fun res!704369 () Bool)

(assert (=> b!1056275 (=> res!704369 e!600304)))

(declare-fun lt!466130 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1056275 (= res!704369 (bvsle lt!466130 i!1381))))

(declare-fun e!600301 () Bool)

(assert (=> b!1056275 e!600301))

(declare-fun res!704371 () Bool)

(assert (=> b!1056275 (=> (not res!704371) (not e!600301))))

(declare-fun k0!2747 () (_ BitVec 64))

(assert (=> b!1056275 (= res!704371 (= (select (store (arr!32020 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466130) k0!2747))))

(declare-fun b!1056276 () Bool)

(declare-fun e!600302 () Bool)

(assert (=> b!1056276 (= e!600302 e!600307)))

(declare-fun res!704368 () Bool)

(assert (=> b!1056276 (=> (not res!704368) (not e!600307))))

(assert (=> b!1056276 (= res!704368 (not (= lt!466130 i!1381)))))

(declare-fun lt!466129 () array!66592)

(declare-fun arrayScanForKey!0 (array!66592 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1056276 (= lt!466130 (arrayScanForKey!0 lt!466129 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1056277 () Bool)

(assert (=> b!1056277 (= e!600303 e!600302)))

(declare-fun res!704373 () Bool)

(assert (=> b!1056277 (=> (not res!704373) (not e!600302))))

(declare-fun arrayContainsKey!0 (array!66592 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1056277 (= res!704373 (arrayContainsKey!0 lt!466129 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1056277 (= lt!466129 (array!66593 (store (arr!32020 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32557 a!3488)))))

(declare-fun res!704370 () Bool)

(assert (=> start!93156 (=> (not res!704370) (not e!600303))))

(assert (=> start!93156 (= res!704370 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32557 a!3488)) (bvslt (size!32557 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93156 e!600303))

(assert (=> start!93156 true))

(declare-fun array_inv!24802 (array!66592) Bool)

(assert (=> start!93156 (array_inv!24802 a!3488)))

(declare-fun b!1056278 () Bool)

(declare-fun res!704372 () Bool)

(assert (=> b!1056278 (=> (not res!704372) (not e!600303))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1056278 (= res!704372 (validKeyInArray!0 k0!2747))))

(declare-fun b!1056279 () Bool)

(declare-fun res!704375 () Bool)

(assert (=> b!1056279 (=> (not res!704375) (not e!600303))))

(assert (=> b!1056279 (= res!704375 (= (select (arr!32020 a!3488) i!1381) k0!2747))))

(declare-fun b!1056280 () Bool)

(declare-fun e!600306 () Bool)

(assert (=> b!1056280 (= e!600306 (arrayContainsKey!0 a!3488 k0!2747 lt!466130))))

(declare-fun b!1056281 () Bool)

(assert (=> b!1056281 (= e!600304 true)))

(assert (=> b!1056281 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34567 0))(
  ( (Unit!34568) )
))
(declare-fun lt!466127 () Unit!34567)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66592 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34567)

(assert (=> b!1056281 (= lt!466127 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!466130 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1056281 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22299)))

(declare-fun lt!466128 () Unit!34567)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66592 (_ BitVec 32) (_ BitVec 32)) Unit!34567)

(assert (=> b!1056281 (= lt!466128 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1056282 () Bool)

(assert (=> b!1056282 (= e!600301 e!600306)))

(declare-fun res!704367 () Bool)

(assert (=> b!1056282 (=> res!704367 e!600306)))

(assert (=> b!1056282 (= res!704367 (bvsle lt!466130 i!1381))))

(assert (= (and start!93156 res!704370) b!1056274))

(assert (= (and b!1056274 res!704374) b!1056278))

(assert (= (and b!1056278 res!704372) b!1056279))

(assert (= (and b!1056279 res!704375) b!1056277))

(assert (= (and b!1056277 res!704373) b!1056276))

(assert (= (and b!1056276 res!704368) b!1056275))

(assert (= (and b!1056275 res!704371) b!1056282))

(assert (= (and b!1056282 (not res!704367)) b!1056280))

(assert (= (and b!1056275 (not res!704369)) b!1056281))

(declare-fun m!976661 () Bool)

(assert (=> b!1056275 m!976661))

(declare-fun m!976663 () Bool)

(assert (=> b!1056275 m!976663))

(declare-fun m!976665 () Bool)

(assert (=> b!1056278 m!976665))

(declare-fun m!976667 () Bool)

(assert (=> b!1056276 m!976667))

(declare-fun m!976669 () Bool)

(assert (=> start!93156 m!976669))

(declare-fun m!976671 () Bool)

(assert (=> b!1056280 m!976671))

(declare-fun m!976673 () Bool)

(assert (=> b!1056274 m!976673))

(declare-fun m!976675 () Bool)

(assert (=> b!1056281 m!976675))

(declare-fun m!976677 () Bool)

(assert (=> b!1056281 m!976677))

(declare-fun m!976679 () Bool)

(assert (=> b!1056281 m!976679))

(declare-fun m!976681 () Bool)

(assert (=> b!1056281 m!976681))

(declare-fun m!976683 () Bool)

(assert (=> b!1056279 m!976683))

(declare-fun m!976685 () Bool)

(assert (=> b!1056277 m!976685))

(assert (=> b!1056277 m!976661))

(check-sat (not b!1056276) (not b!1056278) (not b!1056277) (not b!1056280) (not start!93156) (not b!1056281) (not b!1056274))
(check-sat)
