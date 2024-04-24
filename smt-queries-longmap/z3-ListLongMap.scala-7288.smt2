; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93354 () Bool)

(assert start!93354)

(declare-fun res!705556 () Bool)

(declare-fun e!601307 () Bool)

(assert (=> start!93354 (=> (not res!705556) (not e!601307))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66667 0))(
  ( (array!66668 (arr!32053 (Array (_ BitVec 32) (_ BitVec 64))) (size!32590 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66667)

(assert (=> start!93354 (= res!705556 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32590 a!3488)) (bvslt (size!32590 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93354 e!601307))

(assert (=> start!93354 true))

(declare-fun array_inv!24835 (array!66667) Bool)

(assert (=> start!93354 (array_inv!24835 a!3488)))

(declare-fun b!1057580 () Bool)

(declare-fun res!705553 () Bool)

(assert (=> b!1057580 (=> (not res!705553) (not e!601307))))

(declare-datatypes ((List!22335 0))(
  ( (Nil!22332) (Cons!22331 (h!23549 (_ BitVec 64)) (t!31634 List!22335)) )
))
(declare-fun arrayNoDuplicates!0 (array!66667 (_ BitVec 32) List!22335) Bool)

(assert (=> b!1057580 (= res!705553 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22332))))

(declare-fun e!601306 () Bool)

(declare-fun b!1057581 () Bool)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66667 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1057581 (= e!601306 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1057582 () Bool)

(declare-fun e!601304 () Bool)

(assert (=> b!1057582 (= e!601307 e!601304)))

(declare-fun res!705557 () Bool)

(assert (=> b!1057582 (=> (not res!705557) (not e!601304))))

(declare-fun lt!466586 () array!66667)

(assert (=> b!1057582 (= res!705557 (arrayContainsKey!0 lt!466586 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1057582 (= lt!466586 (array!66668 (store (arr!32053 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32590 a!3488)))))

(declare-fun b!1057583 () Bool)

(declare-fun e!601305 () Bool)

(assert (=> b!1057583 (= e!601304 e!601305)))

(declare-fun res!705558 () Bool)

(assert (=> b!1057583 (=> (not res!705558) (not e!601305))))

(declare-fun lt!466585 () (_ BitVec 32))

(assert (=> b!1057583 (= res!705558 (not (= lt!466585 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66667 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1057583 (= lt!466585 (arrayScanForKey!0 lt!466586 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1057584 () Bool)

(declare-fun res!705560 () Bool)

(assert (=> b!1057584 (=> (not res!705560) (not e!601307))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1057584 (= res!705560 (validKeyInArray!0 k0!2747))))

(declare-fun b!1057585 () Bool)

(declare-fun e!601309 () Bool)

(assert (=> b!1057585 (= e!601309 e!601306)))

(declare-fun res!705555 () Bool)

(assert (=> b!1057585 (=> res!705555 e!601306)))

(assert (=> b!1057585 (= res!705555 (or (bvsgt lt!466585 i!1381) (bvsle i!1381 lt!466585)))))

(declare-fun b!1057586 () Bool)

(assert (=> b!1057586 (= e!601305 (not (or (bvsgt lt!466585 i!1381) (bvsle i!1381 lt!466585) (bvsle #b00000000000000000000000000000000 (size!32590 a!3488)))))))

(assert (=> b!1057586 e!601309))

(declare-fun res!705554 () Bool)

(assert (=> b!1057586 (=> (not res!705554) (not e!601309))))

(assert (=> b!1057586 (= res!705554 (= (select (store (arr!32053 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466585) k0!2747))))

(declare-fun b!1057587 () Bool)

(declare-fun res!705559 () Bool)

(assert (=> b!1057587 (=> (not res!705559) (not e!601307))))

(assert (=> b!1057587 (= res!705559 (= (select (arr!32053 a!3488) i!1381) k0!2747))))

(assert (= (and start!93354 res!705556) b!1057580))

(assert (= (and b!1057580 res!705553) b!1057584))

(assert (= (and b!1057584 res!705560) b!1057587))

(assert (= (and b!1057587 res!705559) b!1057582))

(assert (= (and b!1057582 res!705557) b!1057583))

(assert (= (and b!1057583 res!705558) b!1057586))

(assert (= (and b!1057586 res!705554) b!1057585))

(assert (= (and b!1057585 (not res!705555)) b!1057581))

(declare-fun m!977837 () Bool)

(assert (=> start!93354 m!977837))

(declare-fun m!977839 () Bool)

(assert (=> b!1057586 m!977839))

(declare-fun m!977841 () Bool)

(assert (=> b!1057586 m!977841))

(declare-fun m!977843 () Bool)

(assert (=> b!1057582 m!977843))

(assert (=> b!1057582 m!977839))

(declare-fun m!977845 () Bool)

(assert (=> b!1057587 m!977845))

(declare-fun m!977847 () Bool)

(assert (=> b!1057583 m!977847))

(declare-fun m!977849 () Bool)

(assert (=> b!1057581 m!977849))

(declare-fun m!977851 () Bool)

(assert (=> b!1057580 m!977851))

(declare-fun m!977853 () Bool)

(assert (=> b!1057584 m!977853))

(check-sat (not b!1057583) (not b!1057581) (not b!1057580) (not start!93354) (not b!1057582) (not b!1057584))
(check-sat)
