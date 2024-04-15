; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93302 () Bool)

(assert start!93302)

(declare-fun b!1057412 () Bool)

(declare-fun e!601380 () Bool)

(declare-fun e!601381 () Bool)

(assert (=> b!1057412 (= e!601380 e!601381)))

(declare-fun res!706154 () Bool)

(assert (=> b!1057412 (=> (not res!706154) (not e!601381))))

(declare-fun lt!466314 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1057412 (= res!706154 (not (= lt!466314 i!1381)))))

(declare-datatypes ((array!66642 0))(
  ( (array!66643 (arr!32042 (Array (_ BitVec 32) (_ BitVec 64))) (size!32580 (_ BitVec 32))) )
))
(declare-fun lt!466315 () array!66642)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66642 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1057412 (= lt!466314 (arrayScanForKey!0 lt!466315 k!2747 #b00000000000000000000000000000000))))

(declare-fun e!601382 () Bool)

(declare-fun a!3488 () array!66642)

(declare-fun lt!466312 () (_ BitVec 32))

(declare-fun b!1057413 () Bool)

(assert (=> b!1057413 (= e!601382 (or (bvslt lt!466314 #b00000000000000000000000000000000) (bvslt lt!466312 (size!32580 a!3488))))))

(declare-fun arrayContainsKey!0 (array!66642 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1057413 (arrayContainsKey!0 a!3488 k!2747 lt!466312)))

(declare-datatypes ((Unit!34539 0))(
  ( (Unit!34540) )
))
(declare-fun lt!466311 () Unit!34539)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66642 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34539)

(assert (=> b!1057413 (= lt!466311 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 i!1381 lt!466312))))

(assert (=> b!1057413 (= lt!466312 (bvadd #b00000000000000000000000000000001 lt!466314))))

(declare-datatypes ((List!22413 0))(
  ( (Nil!22410) (Cons!22409 (h!23618 (_ BitVec 64)) (t!31711 List!22413)) )
))
(declare-fun arrayNoDuplicates!0 (array!66642 (_ BitVec 32) List!22413) Bool)

(assert (=> b!1057413 (arrayNoDuplicates!0 a!3488 lt!466314 Nil!22410)))

(declare-fun lt!466313 () Unit!34539)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66642 (_ BitVec 32) (_ BitVec 32)) Unit!34539)

(assert (=> b!1057413 (= lt!466313 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466314))))

(declare-fun b!1057414 () Bool)

(assert (=> b!1057414 (= e!601381 (not e!601382))))

(declare-fun res!706162 () Bool)

(assert (=> b!1057414 (=> res!706162 e!601382)))

(assert (=> b!1057414 (= res!706162 (or (bvsgt lt!466314 i!1381) (bvsle i!1381 lt!466314)))))

(declare-fun e!601385 () Bool)

(assert (=> b!1057414 e!601385))

(declare-fun res!706158 () Bool)

(assert (=> b!1057414 (=> (not res!706158) (not e!601385))))

(assert (=> b!1057414 (= res!706158 (= (select (store (arr!32042 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466314) k!2747))))

(declare-fun b!1057415 () Bool)

(declare-fun res!706156 () Bool)

(declare-fun e!601386 () Bool)

(assert (=> b!1057415 (=> (not res!706156) (not e!601386))))

(assert (=> b!1057415 (= res!706156 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22410))))

(declare-fun res!706161 () Bool)

(assert (=> start!93302 (=> (not res!706161) (not e!601386))))

(assert (=> start!93302 (= res!706161 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32580 a!3488)) (bvslt (size!32580 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93302 e!601386))

(assert (=> start!93302 true))

(declare-fun array_inv!24825 (array!66642) Bool)

(assert (=> start!93302 (array_inv!24825 a!3488)))

(declare-fun b!1057416 () Bool)

(declare-fun res!706160 () Bool)

(assert (=> b!1057416 (=> (not res!706160) (not e!601386))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1057416 (= res!706160 (validKeyInArray!0 k!2747))))

(declare-fun b!1057417 () Bool)

(declare-fun e!601383 () Bool)

(assert (=> b!1057417 (= e!601385 e!601383)))

(declare-fun res!706155 () Bool)

(assert (=> b!1057417 (=> res!706155 e!601383)))

(assert (=> b!1057417 (= res!706155 (or (bvsgt lt!466314 i!1381) (bvsle i!1381 lt!466314)))))

(declare-fun b!1057418 () Bool)

(declare-fun res!706157 () Bool)

(assert (=> b!1057418 (=> (not res!706157) (not e!601386))))

(assert (=> b!1057418 (= res!706157 (= (select (arr!32042 a!3488) i!1381) k!2747))))

(declare-fun b!1057419 () Bool)

(assert (=> b!1057419 (= e!601386 e!601380)))

(declare-fun res!706159 () Bool)

(assert (=> b!1057419 (=> (not res!706159) (not e!601380))))

(assert (=> b!1057419 (= res!706159 (arrayContainsKey!0 lt!466315 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1057419 (= lt!466315 (array!66643 (store (arr!32042 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32580 a!3488)))))

(declare-fun b!1057420 () Bool)

(assert (=> b!1057420 (= e!601383 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(assert (= (and start!93302 res!706161) b!1057415))

(assert (= (and b!1057415 res!706156) b!1057416))

(assert (= (and b!1057416 res!706160) b!1057418))

(assert (= (and b!1057418 res!706157) b!1057419))

(assert (= (and b!1057419 res!706159) b!1057412))

(assert (= (and b!1057412 res!706154) b!1057414))

(assert (= (and b!1057414 res!706158) b!1057417))

(assert (= (and b!1057417 (not res!706155)) b!1057420))

(assert (= (and b!1057414 (not res!706162)) b!1057413))

(declare-fun m!976629 () Bool)

(assert (=> b!1057413 m!976629))

(declare-fun m!976631 () Bool)

(assert (=> b!1057413 m!976631))

(declare-fun m!976633 () Bool)

(assert (=> b!1057413 m!976633))

(declare-fun m!976635 () Bool)

(assert (=> b!1057413 m!976635))

(declare-fun m!976637 () Bool)

(assert (=> start!93302 m!976637))

(declare-fun m!976639 () Bool)

(assert (=> b!1057420 m!976639))

(declare-fun m!976641 () Bool)

(assert (=> b!1057414 m!976641))

(declare-fun m!976643 () Bool)

(assert (=> b!1057414 m!976643))

(declare-fun m!976645 () Bool)

(assert (=> b!1057416 m!976645))

(declare-fun m!976647 () Bool)

(assert (=> b!1057412 m!976647))

(declare-fun m!976649 () Bool)

(assert (=> b!1057415 m!976649))

(declare-fun m!976651 () Bool)

(assert (=> b!1057418 m!976651))

(declare-fun m!976653 () Bool)

(assert (=> b!1057419 m!976653))

(assert (=> b!1057419 m!976641))

(push 1)

(assert (not b!1057420))

(assert (not b!1057416))

(assert (not b!1057415))

(assert (not b!1057419))

(assert (not b!1057412))

(assert (not b!1057413))

(assert (not start!93302))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

