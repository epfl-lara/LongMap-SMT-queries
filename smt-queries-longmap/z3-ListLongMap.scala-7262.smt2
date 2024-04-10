; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92756 () Bool)

(assert start!92756)

(declare-fun b!1053601 () Bool)

(declare-fun res!702586 () Bool)

(declare-fun e!598406 () Bool)

(assert (=> b!1053601 (=> (not res!702586) (not e!598406))))

(declare-datatypes ((array!66449 0))(
  ( (array!66450 (arr!31958 (Array (_ BitVec 32) (_ BitVec 64))) (size!32494 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66449)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1053601 (= res!702586 (= (select (arr!31958 a!3488) i!1381) k0!2747))))

(declare-fun lt!465173 () (_ BitVec 32))

(declare-fun e!598410 () Bool)

(declare-fun b!1053602 () Bool)

(declare-fun arrayContainsKey!0 (array!66449 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1053602 (= e!598410 (arrayContainsKey!0 a!3488 k0!2747 lt!465173))))

(declare-fun b!1053603 () Bool)

(declare-fun res!702590 () Bool)

(assert (=> b!1053603 (=> (not res!702590) (not e!598406))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1053603 (= res!702590 (validKeyInArray!0 k0!2747))))

(declare-fun b!1053604 () Bool)

(declare-fun e!598408 () Bool)

(assert (=> b!1053604 (= e!598408 (not true))))

(declare-fun e!598411 () Bool)

(assert (=> b!1053604 e!598411))

(declare-fun res!702584 () Bool)

(assert (=> b!1053604 (=> (not res!702584) (not e!598411))))

(assert (=> b!1053604 (= res!702584 (= (select (store (arr!31958 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465173) k0!2747))))

(declare-fun b!1053605 () Bool)

(declare-fun e!598409 () Bool)

(assert (=> b!1053605 (= e!598409 e!598408)))

(declare-fun res!702589 () Bool)

(assert (=> b!1053605 (=> (not res!702589) (not e!598408))))

(assert (=> b!1053605 (= res!702589 (not (= lt!465173 i!1381)))))

(declare-fun lt!465174 () array!66449)

(declare-fun arrayScanForKey!0 (array!66449 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1053605 (= lt!465173 (arrayScanForKey!0 lt!465174 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1053606 () Bool)

(assert (=> b!1053606 (= e!598406 e!598409)))

(declare-fun res!702583 () Bool)

(assert (=> b!1053606 (=> (not res!702583) (not e!598409))))

(assert (=> b!1053606 (= res!702583 (arrayContainsKey!0 lt!465174 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1053606 (= lt!465174 (array!66450 (store (arr!31958 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32494 a!3488)))))

(declare-fun res!702588 () Bool)

(assert (=> start!92756 (=> (not res!702588) (not e!598406))))

(assert (=> start!92756 (= res!702588 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32494 a!3488)) (bvslt (size!32494 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92756 e!598406))

(assert (=> start!92756 true))

(declare-fun array_inv!24738 (array!66449) Bool)

(assert (=> start!92756 (array_inv!24738 a!3488)))

(declare-fun b!1053607 () Bool)

(assert (=> b!1053607 (= e!598411 e!598410)))

(declare-fun res!702587 () Bool)

(assert (=> b!1053607 (=> res!702587 e!598410)))

(assert (=> b!1053607 (= res!702587 (bvsle lt!465173 i!1381))))

(declare-fun b!1053608 () Bool)

(declare-fun res!702585 () Bool)

(assert (=> b!1053608 (=> (not res!702585) (not e!598406))))

(declare-datatypes ((List!22270 0))(
  ( (Nil!22267) (Cons!22266 (h!23475 (_ BitVec 64)) (t!31577 List!22270)) )
))
(declare-fun arrayNoDuplicates!0 (array!66449 (_ BitVec 32) List!22270) Bool)

(assert (=> b!1053608 (= res!702585 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22267))))

(assert (= (and start!92756 res!702588) b!1053608))

(assert (= (and b!1053608 res!702585) b!1053603))

(assert (= (and b!1053603 res!702590) b!1053601))

(assert (= (and b!1053601 res!702586) b!1053606))

(assert (= (and b!1053606 res!702583) b!1053605))

(assert (= (and b!1053605 res!702589) b!1053604))

(assert (= (and b!1053604 res!702584) b!1053607))

(assert (= (and b!1053607 (not res!702587)) b!1053602))

(declare-fun m!973847 () Bool)

(assert (=> b!1053605 m!973847))

(declare-fun m!973849 () Bool)

(assert (=> b!1053604 m!973849))

(declare-fun m!973851 () Bool)

(assert (=> b!1053604 m!973851))

(declare-fun m!973853 () Bool)

(assert (=> b!1053608 m!973853))

(declare-fun m!973855 () Bool)

(assert (=> b!1053606 m!973855))

(assert (=> b!1053606 m!973849))

(declare-fun m!973857 () Bool)

(assert (=> b!1053601 m!973857))

(declare-fun m!973859 () Bool)

(assert (=> b!1053603 m!973859))

(declare-fun m!973861 () Bool)

(assert (=> start!92756 m!973861))

(declare-fun m!973863 () Bool)

(assert (=> b!1053602 m!973863))

(check-sat (not b!1053602) (not b!1053608) (not b!1053603) (not start!92756) (not b!1053606) (not b!1053605))
(check-sat)
