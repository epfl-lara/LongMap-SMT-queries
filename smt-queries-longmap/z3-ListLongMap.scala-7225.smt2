; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92410 () Bool)

(assert start!92410)

(declare-fun b!1050540 () Bool)

(declare-fun res!699750 () Bool)

(declare-fun e!596185 () Bool)

(assert (=> b!1050540 (=> (not res!699750) (not e!596185))))

(declare-datatypes ((array!66152 0))(
  ( (array!66153 (arr!31815 (Array (_ BitVec 32) (_ BitVec 64))) (size!32353 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66152)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1050540 (= res!699750 (= (select (arr!31815 a!3488) i!1381) k0!2747))))

(declare-fun b!1050541 () Bool)

(declare-fun e!596190 () Bool)

(declare-fun arrayContainsKey!0 (array!66152 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050541 (= e!596190 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1050542 () Bool)

(declare-fun e!596187 () Bool)

(assert (=> b!1050542 (= e!596187 e!596190)))

(declare-fun res!699752 () Bool)

(assert (=> b!1050542 (=> res!699752 e!596190)))

(declare-fun lt!463852 () (_ BitVec 32))

(assert (=> b!1050542 (= res!699752 (or (bvsgt lt!463852 i!1381) (bvsle i!1381 lt!463852)))))

(declare-fun b!1050543 () Bool)

(declare-fun res!699757 () Bool)

(assert (=> b!1050543 (=> (not res!699757) (not e!596185))))

(declare-datatypes ((List!22186 0))(
  ( (Nil!22183) (Cons!22182 (h!23391 (_ BitVec 64)) (t!31484 List!22186)) )
))
(declare-fun arrayNoDuplicates!0 (array!66152 (_ BitVec 32) List!22186) Bool)

(assert (=> b!1050543 (= res!699757 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22183))))

(declare-fun b!1050544 () Bool)

(declare-fun e!596188 () Bool)

(declare-fun e!596189 () Bool)

(assert (=> b!1050544 (= e!596188 e!596189)))

(declare-fun res!699756 () Bool)

(assert (=> b!1050544 (=> (not res!699756) (not e!596189))))

(assert (=> b!1050544 (= res!699756 (not (= lt!463852 i!1381)))))

(declare-fun lt!463851 () array!66152)

(declare-fun arrayScanForKey!0 (array!66152 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050544 (= lt!463852 (arrayScanForKey!0 lt!463851 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1050545 () Bool)

(assert (=> b!1050545 (= e!596185 e!596188)))

(declare-fun res!699754 () Bool)

(assert (=> b!1050545 (=> (not res!699754) (not e!596188))))

(assert (=> b!1050545 (= res!699754 (arrayContainsKey!0 lt!463851 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1050545 (= lt!463851 (array!66153 (store (arr!31815 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32353 a!3488)))))

(declare-fun b!1050546 () Bool)

(declare-fun res!699751 () Bool)

(assert (=> b!1050546 (=> (not res!699751) (not e!596185))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050546 (= res!699751 (validKeyInArray!0 k0!2747))))

(declare-fun res!699755 () Bool)

(assert (=> start!92410 (=> (not res!699755) (not e!596185))))

(assert (=> start!92410 (= res!699755 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32353 a!3488)) (bvslt (size!32353 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92410 e!596185))

(assert (=> start!92410 true))

(declare-fun array_inv!24598 (array!66152) Bool)

(assert (=> start!92410 (array_inv!24598 a!3488)))

(declare-fun b!1050547 () Bool)

(assert (=> b!1050547 (= e!596189 (not true))))

(assert (=> b!1050547 e!596187))

(declare-fun res!699753 () Bool)

(assert (=> b!1050547 (=> (not res!699753) (not e!596187))))

(assert (=> b!1050547 (= res!699753 (= (select (store (arr!31815 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463852) k0!2747))))

(assert (= (and start!92410 res!699755) b!1050543))

(assert (= (and b!1050543 res!699757) b!1050546))

(assert (= (and b!1050546 res!699751) b!1050540))

(assert (= (and b!1050540 res!699750) b!1050545))

(assert (= (and b!1050545 res!699754) b!1050544))

(assert (= (and b!1050544 res!699756) b!1050547))

(assert (= (and b!1050547 res!699753) b!1050542))

(assert (= (and b!1050542 (not res!699752)) b!1050541))

(declare-fun m!970741 () Bool)

(assert (=> start!92410 m!970741))

(declare-fun m!970743 () Bool)

(assert (=> b!1050540 m!970743))

(declare-fun m!970745 () Bool)

(assert (=> b!1050543 m!970745))

(declare-fun m!970747 () Bool)

(assert (=> b!1050547 m!970747))

(declare-fun m!970749 () Bool)

(assert (=> b!1050547 m!970749))

(declare-fun m!970751 () Bool)

(assert (=> b!1050545 m!970751))

(assert (=> b!1050545 m!970747))

(declare-fun m!970753 () Bool)

(assert (=> b!1050541 m!970753))

(declare-fun m!970755 () Bool)

(assert (=> b!1050546 m!970755))

(declare-fun m!970757 () Bool)

(assert (=> b!1050544 m!970757))

(check-sat (not b!1050546) (not b!1050543) (not b!1050541) (not start!92410) (not b!1050545) (not b!1050544))
(check-sat)
