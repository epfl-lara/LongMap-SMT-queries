; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92326 () Bool)

(assert start!92326)

(declare-fun b!1049279 () Bool)

(declare-fun e!595316 () Bool)

(declare-fun e!595321 () Bool)

(assert (=> b!1049279 (= e!595316 e!595321)))

(declare-fun res!698491 () Bool)

(assert (=> b!1049279 (=> (not res!698491) (not e!595321))))

(declare-fun lt!463311 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1049279 (= res!698491 (not (= lt!463311 i!1381)))))

(declare-datatypes ((array!66068 0))(
  ( (array!66069 (arr!31773 (Array (_ BitVec 32) (_ BitVec 64))) (size!32311 (_ BitVec 32))) )
))
(declare-fun lt!463310 () array!66068)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66068 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1049279 (= lt!463311 (arrayScanForKey!0 lt!463310 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1049280 () Bool)

(declare-fun e!595319 () Bool)

(assert (=> b!1049280 (= e!595321 (not e!595319))))

(declare-fun res!698493 () Bool)

(assert (=> b!1049280 (=> res!698493 e!595319)))

(assert (=> b!1049280 (= res!698493 (bvsle lt!463311 i!1381))))

(declare-fun e!595322 () Bool)

(assert (=> b!1049280 e!595322))

(declare-fun res!698500 () Bool)

(assert (=> b!1049280 (=> (not res!698500) (not e!595322))))

(declare-fun a!3488 () array!66068)

(assert (=> b!1049280 (= res!698500 (= (select (store (arr!31773 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463311) k0!2747))))

(declare-fun res!698490 () Bool)

(declare-fun e!595323 () Bool)

(assert (=> start!92326 (=> (not res!698490) (not e!595323))))

(assert (=> start!92326 (= res!698490 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32311 a!3488)) (bvslt (size!32311 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92326 e!595323))

(assert (=> start!92326 true))

(declare-fun array_inv!24556 (array!66068) Bool)

(assert (=> start!92326 (array_inv!24556 a!3488)))

(declare-fun b!1049281 () Bool)

(declare-fun res!698495 () Bool)

(assert (=> b!1049281 (=> (not res!698495) (not e!595323))))

(assert (=> b!1049281 (= res!698495 (= (select (arr!31773 a!3488) i!1381) k0!2747))))

(declare-fun b!1049282 () Bool)

(assert (=> b!1049282 (= e!595323 e!595316)))

(declare-fun res!698497 () Bool)

(assert (=> b!1049282 (=> (not res!698497) (not e!595316))))

(declare-fun arrayContainsKey!0 (array!66068 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1049282 (= res!698497 (arrayContainsKey!0 lt!463310 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1049282 (= lt!463310 (array!66069 (store (arr!31773 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32311 a!3488)))))

(declare-fun b!1049283 () Bool)

(declare-fun res!698489 () Bool)

(assert (=> b!1049283 (=> (not res!698489) (not e!595323))))

(declare-datatypes ((List!22144 0))(
  ( (Nil!22141) (Cons!22140 (h!23349 (_ BitVec 64)) (t!31442 List!22144)) )
))
(declare-fun arrayNoDuplicates!0 (array!66068 (_ BitVec 32) List!22144) Bool)

(assert (=> b!1049283 (= res!698489 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22141))))

(declare-fun b!1049284 () Bool)

(declare-fun res!698494 () Bool)

(assert (=> b!1049284 (=> (not res!698494) (not e!595323))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1049284 (= res!698494 (validKeyInArray!0 k0!2747))))

(declare-fun b!1049285 () Bool)

(declare-fun res!698492 () Bool)

(declare-fun e!595317 () Bool)

(assert (=> b!1049285 (=> res!698492 e!595317)))

(declare-fun noDuplicate!1507 (List!22144) Bool)

(assert (=> b!1049285 (= res!698492 (not (noDuplicate!1507 Nil!22141)))))

(declare-fun b!1049286 () Bool)

(assert (=> b!1049286 (= e!595317 true)))

(declare-fun lt!463312 () Bool)

(declare-fun contains!6082 (List!22144 (_ BitVec 64)) Bool)

(assert (=> b!1049286 (= lt!463312 (contains!6082 Nil!22141 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1049287 () Bool)

(declare-fun e!595320 () Bool)

(assert (=> b!1049287 (= e!595322 e!595320)))

(declare-fun res!698499 () Bool)

(assert (=> b!1049287 (=> res!698499 e!595320)))

(assert (=> b!1049287 (= res!698499 (bvsle lt!463311 i!1381))))

(declare-fun b!1049288 () Bool)

(declare-fun res!698498 () Bool)

(assert (=> b!1049288 (=> res!698498 e!595317)))

(assert (=> b!1049288 (= res!698498 (contains!6082 Nil!22141 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1049289 () Bool)

(assert (=> b!1049289 (= e!595320 (arrayContainsKey!0 a!3488 k0!2747 lt!463311))))

(declare-fun b!1049290 () Bool)

(assert (=> b!1049290 (= e!595319 e!595317)))

(declare-fun res!698496 () Bool)

(assert (=> b!1049290 (=> res!698496 e!595317)))

(assert (=> b!1049290 (= res!698496 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32311 a!3488)))))

(assert (=> b!1049290 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34199 0))(
  ( (Unit!34200) )
))
(declare-fun lt!463309 () Unit!34199)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66068 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34199)

(assert (=> b!1049290 (= lt!463309 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!463311 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1049290 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22141)))

(declare-fun lt!463308 () Unit!34199)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66068 (_ BitVec 32) (_ BitVec 32)) Unit!34199)

(assert (=> b!1049290 (= lt!463308 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(assert (= (and start!92326 res!698490) b!1049283))

(assert (= (and b!1049283 res!698489) b!1049284))

(assert (= (and b!1049284 res!698494) b!1049281))

(assert (= (and b!1049281 res!698495) b!1049282))

(assert (= (and b!1049282 res!698497) b!1049279))

(assert (= (and b!1049279 res!698491) b!1049280))

(assert (= (and b!1049280 res!698500) b!1049287))

(assert (= (and b!1049287 (not res!698499)) b!1049289))

(assert (= (and b!1049280 (not res!698493)) b!1049290))

(assert (= (and b!1049290 (not res!698496)) b!1049285))

(assert (= (and b!1049285 (not res!698492)) b!1049288))

(assert (= (and b!1049288 (not res!698498)) b!1049286))

(declare-fun m!969577 () Bool)

(assert (=> b!1049288 m!969577))

(declare-fun m!969579 () Bool)

(assert (=> b!1049279 m!969579))

(declare-fun m!969581 () Bool)

(assert (=> b!1049280 m!969581))

(declare-fun m!969583 () Bool)

(assert (=> b!1049280 m!969583))

(declare-fun m!969585 () Bool)

(assert (=> b!1049289 m!969585))

(declare-fun m!969587 () Bool)

(assert (=> b!1049286 m!969587))

(declare-fun m!969589 () Bool)

(assert (=> b!1049282 m!969589))

(assert (=> b!1049282 m!969581))

(declare-fun m!969591 () Bool)

(assert (=> b!1049284 m!969591))

(declare-fun m!969593 () Bool)

(assert (=> b!1049283 m!969593))

(declare-fun m!969595 () Bool)

(assert (=> b!1049281 m!969595))

(declare-fun m!969597 () Bool)

(assert (=> b!1049285 m!969597))

(declare-fun m!969599 () Bool)

(assert (=> start!92326 m!969599))

(declare-fun m!969601 () Bool)

(assert (=> b!1049290 m!969601))

(declare-fun m!969603 () Bool)

(assert (=> b!1049290 m!969603))

(declare-fun m!969605 () Bool)

(assert (=> b!1049290 m!969605))

(declare-fun m!969607 () Bool)

(assert (=> b!1049290 m!969607))

(check-sat (not b!1049279) (not b!1049288) (not b!1049284) (not b!1049283) (not b!1049282) (not b!1049289) (not b!1049286) (not b!1049285) (not start!92326) (not b!1049290))
(check-sat)
