; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93058 () Bool)

(assert start!93058)

(declare-fun b!1055660 () Bool)

(declare-fun res!704558 () Bool)

(declare-fun e!600029 () Bool)

(assert (=> b!1055660 (=> (not res!704558) (not e!600029))))

(declare-datatypes ((array!66524 0))(
  ( (array!66525 (arr!31989 (Array (_ BitVec 32) (_ BitVec 64))) (size!32527 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66524)

(declare-datatypes ((List!22360 0))(
  ( (Nil!22357) (Cons!22356 (h!23565 (_ BitVec 64)) (t!31658 List!22360)) )
))
(declare-fun arrayNoDuplicates!0 (array!66524 (_ BitVec 32) List!22360) Bool)

(assert (=> b!1055660 (= res!704558 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22357))))

(declare-fun b!1055661 () Bool)

(declare-fun e!600024 () Bool)

(declare-fun e!600027 () Bool)

(assert (=> b!1055661 (= e!600024 e!600027)))

(declare-fun res!704560 () Bool)

(assert (=> b!1055661 (=> (not res!704560) (not e!600027))))

(declare-fun lt!465726 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1055661 (= res!704560 (not (= lt!465726 i!1381)))))

(declare-fun lt!465727 () array!66524)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66524 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1055661 (= lt!465726 (arrayScanForKey!0 lt!465727 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1055662 () Bool)

(declare-fun e!600026 () Bool)

(declare-fun e!600030 () Bool)

(assert (=> b!1055662 (= e!600026 e!600030)))

(declare-fun res!704562 () Bool)

(assert (=> b!1055662 (=> res!704562 e!600030)))

(assert (=> b!1055662 (= res!704562 (bvsle lt!465726 i!1381))))

(declare-fun b!1055663 () Bool)

(declare-fun e!600028 () Bool)

(assert (=> b!1055663 (= e!600028 true)))

(assert (=> b!1055663 false))

(declare-datatypes ((Unit!34469 0))(
  ( (Unit!34470) )
))
(declare-fun lt!465725 () Unit!34469)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!66524 (_ BitVec 64) (_ BitVec 32) List!22360) Unit!34469)

(assert (=> b!1055663 (= lt!465725 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 a!3488 k0!2747 i!1381 Nil!22357))))

(declare-fun arrayContainsKey!0 (array!66524 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1055663 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-fun lt!465723 () Unit!34469)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66524 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34469)

(assert (=> b!1055663 (= lt!465723 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!465726 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1055663 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22357)))

(declare-fun lt!465724 () Unit!34469)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66524 (_ BitVec 32) (_ BitVec 32)) Unit!34469)

(assert (=> b!1055663 (= lt!465724 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun res!704561 () Bool)

(assert (=> start!93058 (=> (not res!704561) (not e!600029))))

(assert (=> start!93058 (= res!704561 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32527 a!3488)) (bvslt (size!32527 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93058 e!600029))

(assert (=> start!93058 true))

(declare-fun array_inv!24772 (array!66524) Bool)

(assert (=> start!93058 (array_inv!24772 a!3488)))

(declare-fun b!1055664 () Bool)

(declare-fun res!704566 () Bool)

(assert (=> b!1055664 (=> (not res!704566) (not e!600029))))

(assert (=> b!1055664 (= res!704566 (= (select (arr!31989 a!3488) i!1381) k0!2747))))

(declare-fun b!1055665 () Bool)

(assert (=> b!1055665 (= e!600030 (arrayContainsKey!0 a!3488 k0!2747 lt!465726))))

(declare-fun b!1055666 () Bool)

(declare-fun res!704559 () Bool)

(assert (=> b!1055666 (=> (not res!704559) (not e!600029))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1055666 (= res!704559 (validKeyInArray!0 k0!2747))))

(declare-fun b!1055667 () Bool)

(assert (=> b!1055667 (= e!600029 e!600024)))

(declare-fun res!704564 () Bool)

(assert (=> b!1055667 (=> (not res!704564) (not e!600024))))

(assert (=> b!1055667 (= res!704564 (arrayContainsKey!0 lt!465727 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1055667 (= lt!465727 (array!66525 (store (arr!31989 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32527 a!3488)))))

(declare-fun b!1055668 () Bool)

(assert (=> b!1055668 (= e!600027 (not e!600028))))

(declare-fun res!704565 () Bool)

(assert (=> b!1055668 (=> res!704565 e!600028)))

(assert (=> b!1055668 (= res!704565 (bvsle lt!465726 i!1381))))

(assert (=> b!1055668 e!600026))

(declare-fun res!704563 () Bool)

(assert (=> b!1055668 (=> (not res!704563) (not e!600026))))

(assert (=> b!1055668 (= res!704563 (= (select (store (arr!31989 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465726) k0!2747))))

(assert (= (and start!93058 res!704561) b!1055660))

(assert (= (and b!1055660 res!704558) b!1055666))

(assert (= (and b!1055666 res!704559) b!1055664))

(assert (= (and b!1055664 res!704566) b!1055667))

(assert (= (and b!1055667 res!704564) b!1055661))

(assert (= (and b!1055661 res!704560) b!1055668))

(assert (= (and b!1055668 res!704563) b!1055662))

(assert (= (and b!1055662 (not res!704562)) b!1055665))

(assert (= (and b!1055668 (not res!704565)) b!1055663))

(declare-fun m!975169 () Bool)

(assert (=> b!1055665 m!975169))

(declare-fun m!975171 () Bool)

(assert (=> b!1055660 m!975171))

(declare-fun m!975173 () Bool)

(assert (=> b!1055666 m!975173))

(declare-fun m!975175 () Bool)

(assert (=> b!1055661 m!975175))

(declare-fun m!975177 () Bool)

(assert (=> b!1055667 m!975177))

(declare-fun m!975179 () Bool)

(assert (=> b!1055667 m!975179))

(declare-fun m!975181 () Bool)

(assert (=> start!93058 m!975181))

(declare-fun m!975183 () Bool)

(assert (=> b!1055664 m!975183))

(assert (=> b!1055668 m!975179))

(declare-fun m!975185 () Bool)

(assert (=> b!1055668 m!975185))

(declare-fun m!975187 () Bool)

(assert (=> b!1055663 m!975187))

(declare-fun m!975189 () Bool)

(assert (=> b!1055663 m!975189))

(declare-fun m!975191 () Bool)

(assert (=> b!1055663 m!975191))

(declare-fun m!975193 () Bool)

(assert (=> b!1055663 m!975193))

(declare-fun m!975195 () Bool)

(assert (=> b!1055663 m!975195))

(check-sat (not b!1055666) (not b!1055661) (not b!1055665) (not b!1055667) (not b!1055663) (not b!1055660) (not start!93058))
(check-sat)
