; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93442 () Bool)

(assert start!93442)

(declare-fun b!1058291 () Bool)

(declare-fun e!602060 () Bool)

(declare-fun e!602058 () Bool)

(assert (=> b!1058291 (= e!602060 e!602058)))

(declare-fun res!706955 () Bool)

(assert (=> b!1058291 (=> res!706955 e!602058)))

(declare-fun lt!466694 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1058291 (= res!706955 (or (bvsgt lt!466694 i!1381) (bvsle i!1381 lt!466694)))))

(declare-fun b!1058292 () Bool)

(declare-fun res!706950 () Bool)

(declare-fun e!602062 () Bool)

(assert (=> b!1058292 (=> (not res!706950) (not e!602062))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1058292 (= res!706950 (validKeyInArray!0 k0!2747))))

(declare-datatypes ((array!66686 0))(
  ( (array!66687 (arr!32061 (Array (_ BitVec 32) (_ BitVec 64))) (size!32599 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66686)

(declare-fun b!1058293 () Bool)

(declare-fun arrayContainsKey!0 (array!66686 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058293 (= e!602058 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1058294 () Bool)

(declare-fun e!602061 () Bool)

(declare-fun e!602063 () Bool)

(assert (=> b!1058294 (= e!602061 e!602063)))

(declare-fun res!706954 () Bool)

(assert (=> b!1058294 (=> (not res!706954) (not e!602063))))

(assert (=> b!1058294 (= res!706954 (not (= lt!466694 i!1381)))))

(declare-fun lt!466696 () array!66686)

(declare-fun arrayScanForKey!0 (array!66686 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1058294 (= lt!466694 (arrayScanForKey!0 lt!466696 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1058295 () Bool)

(declare-fun e!602064 () Bool)

(assert (=> b!1058295 (= e!602063 (not e!602064))))

(declare-fun res!706956 () Bool)

(assert (=> b!1058295 (=> res!706956 e!602064)))

(assert (=> b!1058295 (= res!706956 (or (bvsgt lt!466694 i!1381) (bvsle i!1381 lt!466694)))))

(assert (=> b!1058295 e!602060))

(declare-fun res!706957 () Bool)

(assert (=> b!1058295 (=> (not res!706957) (not e!602060))))

(assert (=> b!1058295 (= res!706957 (= (select (store (arr!32061 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466694) k0!2747))))

(declare-fun res!706951 () Bool)

(assert (=> start!93442 (=> (not res!706951) (not e!602062))))

(assert (=> start!93442 (= res!706951 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32599 a!3488)) (bvslt (size!32599 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93442 e!602062))

(assert (=> start!93442 true))

(declare-fun array_inv!24844 (array!66686) Bool)

(assert (=> start!93442 (array_inv!24844 a!3488)))

(declare-fun b!1058296 () Bool)

(assert (=> b!1058296 (= e!602064 true)))

(assert (=> b!1058296 (not (= (select (arr!32061 a!3488) lt!466694) k0!2747))))

(declare-datatypes ((Unit!34577 0))(
  ( (Unit!34578) )
))
(declare-fun lt!466691 () Unit!34577)

(declare-datatypes ((List!22432 0))(
  ( (Nil!22429) (Cons!22428 (h!23637 (_ BitVec 64)) (t!31730 List!22432)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!66686 (_ BitVec 64) (_ BitVec 32) List!22432) Unit!34577)

(assert (=> b!1058296 (= lt!466691 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 a!3488 k0!2747 lt!466694 Nil!22429))))

(declare-fun lt!466692 () (_ BitVec 32))

(assert (=> b!1058296 (arrayContainsKey!0 a!3488 k0!2747 lt!466692)))

(declare-fun lt!466693 () Unit!34577)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66686 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34577)

(assert (=> b!1058296 (= lt!466693 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!466692))))

(assert (=> b!1058296 (= lt!466692 (bvadd #b00000000000000000000000000000001 lt!466694))))

(declare-fun arrayNoDuplicates!0 (array!66686 (_ BitVec 32) List!22432) Bool)

(assert (=> b!1058296 (arrayNoDuplicates!0 a!3488 lt!466694 Nil!22429)))

(declare-fun lt!466695 () Unit!34577)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66686 (_ BitVec 32) (_ BitVec 32)) Unit!34577)

(assert (=> b!1058296 (= lt!466695 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466694))))

(declare-fun b!1058297 () Bool)

(declare-fun res!706952 () Bool)

(assert (=> b!1058297 (=> (not res!706952) (not e!602062))))

(assert (=> b!1058297 (= res!706952 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22429))))

(declare-fun b!1058298 () Bool)

(assert (=> b!1058298 (= e!602062 e!602061)))

(declare-fun res!706953 () Bool)

(assert (=> b!1058298 (=> (not res!706953) (not e!602061))))

(assert (=> b!1058298 (= res!706953 (arrayContainsKey!0 lt!466696 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1058298 (= lt!466696 (array!66687 (store (arr!32061 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32599 a!3488)))))

(declare-fun b!1058299 () Bool)

(declare-fun res!706949 () Bool)

(assert (=> b!1058299 (=> (not res!706949) (not e!602062))))

(assert (=> b!1058299 (= res!706949 (= (select (arr!32061 a!3488) i!1381) k0!2747))))

(assert (= (and start!93442 res!706951) b!1058297))

(assert (= (and b!1058297 res!706952) b!1058292))

(assert (= (and b!1058292 res!706950) b!1058299))

(assert (= (and b!1058299 res!706949) b!1058298))

(assert (= (and b!1058298 res!706953) b!1058294))

(assert (= (and b!1058294 res!706954) b!1058295))

(assert (= (and b!1058295 res!706957) b!1058291))

(assert (= (and b!1058291 (not res!706955)) b!1058293))

(assert (= (and b!1058295 (not res!706956)) b!1058296))

(declare-fun m!977453 () Bool)

(assert (=> start!93442 m!977453))

(declare-fun m!977455 () Bool)

(assert (=> b!1058294 m!977455))

(declare-fun m!977457 () Bool)

(assert (=> b!1058299 m!977457))

(declare-fun m!977459 () Bool)

(assert (=> b!1058297 m!977459))

(declare-fun m!977461 () Bool)

(assert (=> b!1058295 m!977461))

(declare-fun m!977463 () Bool)

(assert (=> b!1058295 m!977463))

(declare-fun m!977465 () Bool)

(assert (=> b!1058292 m!977465))

(declare-fun m!977467 () Bool)

(assert (=> b!1058296 m!977467))

(declare-fun m!977469 () Bool)

(assert (=> b!1058296 m!977469))

(declare-fun m!977471 () Bool)

(assert (=> b!1058296 m!977471))

(declare-fun m!977473 () Bool)

(assert (=> b!1058296 m!977473))

(declare-fun m!977475 () Bool)

(assert (=> b!1058296 m!977475))

(declare-fun m!977477 () Bool)

(assert (=> b!1058296 m!977477))

(declare-fun m!977479 () Bool)

(assert (=> b!1058293 m!977479))

(declare-fun m!977481 () Bool)

(assert (=> b!1058298 m!977481))

(assert (=> b!1058298 m!977461))

(check-sat (not b!1058294) (not b!1058293) (not start!93442) (not b!1058297) (not b!1058292) (not b!1058298) (not b!1058296))
(check-sat)
