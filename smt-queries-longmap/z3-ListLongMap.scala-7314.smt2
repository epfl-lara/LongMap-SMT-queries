; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93490 () Bool)

(assert start!93490)

(declare-fun res!707256 () Bool)

(declare-fun e!602312 () Bool)

(assert (=> start!93490 (=> (not res!707256) (not e!602312))))

(declare-fun from!2850 () (_ BitVec 32))

(declare-datatypes ((array!66729 0))(
  ( (array!66730 (arr!32082 (Array (_ BitVec 32) (_ BitVec 64))) (size!32620 (_ BitVec 32))) )
))
(declare-fun a!3475 () array!66729)

(assert (=> start!93490 (= res!707256 (and (bvsge from!2850 #b00000000000000000000000000000000) (bvslt from!2850 (size!32620 a!3475)) (bvslt (size!32620 a!3475) #b01111111111111111111111111111111)))))

(assert (=> start!93490 e!602312))

(assert (=> start!93490 true))

(declare-fun array_inv!24865 (array!66729) Bool)

(assert (=> start!93490 (array_inv!24865 a!3475)))

(declare-fun b!1058597 () Bool)

(declare-fun res!707255 () Bool)

(assert (=> b!1058597 (=> (not res!707255) (not e!602312))))

(declare-fun k0!2741 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66729 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058597 (= res!707255 (arrayContainsKey!0 a!3475 k0!2741 from!2850))))

(declare-fun b!1058598 () Bool)

(declare-fun res!707257 () Bool)

(assert (=> b!1058598 (=> (not res!707257) (not e!602312))))

(assert (=> b!1058598 (= res!707257 (and (not (= (select (arr!32082 a!3475) from!2850) k0!2741)) (bvsge (bvadd #b00000000000000000000000000000001 from!2850) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2850) (size!32620 a!3475))))))

(declare-fun b!1058599 () Bool)

(assert (=> b!1058599 (= e!602312 (not (arrayContainsKey!0 a!3475 k0!2741 (bvadd #b00000000000000000000000000000001 from!2850))))))

(assert (= (and start!93490 res!707256) b!1058597))

(assert (= (and b!1058597 res!707255) b!1058598))

(assert (= (and b!1058598 res!707257) b!1058599))

(declare-fun m!977773 () Bool)

(assert (=> start!93490 m!977773))

(declare-fun m!977775 () Bool)

(assert (=> b!1058597 m!977775))

(declare-fun m!977777 () Bool)

(assert (=> b!1058598 m!977777))

(declare-fun m!977779 () Bool)

(assert (=> b!1058599 m!977779))

(check-sat (not b!1058597) (not start!93490) (not b!1058599))
(check-sat)
(get-model)

(declare-fun d!128477 () Bool)

(declare-fun res!707280 () Bool)

(declare-fun e!602330 () Bool)

(assert (=> d!128477 (=> res!707280 e!602330)))

(assert (=> d!128477 (= res!707280 (= (select (arr!32082 a!3475) from!2850) k0!2741))))

(assert (=> d!128477 (= (arrayContainsKey!0 a!3475 k0!2741 from!2850) e!602330)))

(declare-fun b!1058622 () Bool)

(declare-fun e!602331 () Bool)

(assert (=> b!1058622 (= e!602330 e!602331)))

(declare-fun res!707281 () Bool)

(assert (=> b!1058622 (=> (not res!707281) (not e!602331))))

(assert (=> b!1058622 (= res!707281 (bvslt (bvadd from!2850 #b00000000000000000000000000000001) (size!32620 a!3475)))))

(declare-fun b!1058623 () Bool)

(assert (=> b!1058623 (= e!602331 (arrayContainsKey!0 a!3475 k0!2741 (bvadd from!2850 #b00000000000000000000000000000001)))))

(assert (= (and d!128477 (not res!707280)) b!1058622))

(assert (= (and b!1058622 res!707281) b!1058623))

(assert (=> d!128477 m!977777))

(declare-fun m!977797 () Bool)

(assert (=> b!1058623 m!977797))

(assert (=> b!1058597 d!128477))

(declare-fun d!128479 () Bool)

(assert (=> d!128479 (= (array_inv!24865 a!3475) (bvsge (size!32620 a!3475) #b00000000000000000000000000000000))))

(assert (=> start!93490 d!128479))

(declare-fun d!128481 () Bool)

(declare-fun res!707282 () Bool)

(declare-fun e!602332 () Bool)

(assert (=> d!128481 (=> res!707282 e!602332)))

(assert (=> d!128481 (= res!707282 (= (select (arr!32082 a!3475) (bvadd #b00000000000000000000000000000001 from!2850)) k0!2741))))

(assert (=> d!128481 (= (arrayContainsKey!0 a!3475 k0!2741 (bvadd #b00000000000000000000000000000001 from!2850)) e!602332)))

(declare-fun b!1058624 () Bool)

(declare-fun e!602333 () Bool)

(assert (=> b!1058624 (= e!602332 e!602333)))

(declare-fun res!707283 () Bool)

(assert (=> b!1058624 (=> (not res!707283) (not e!602333))))

(assert (=> b!1058624 (= res!707283 (bvslt (bvadd #b00000000000000000000000000000001 from!2850 #b00000000000000000000000000000001) (size!32620 a!3475)))))

(declare-fun b!1058625 () Bool)

(assert (=> b!1058625 (= e!602333 (arrayContainsKey!0 a!3475 k0!2741 (bvadd #b00000000000000000000000000000001 from!2850 #b00000000000000000000000000000001)))))

(assert (= (and d!128481 (not res!707282)) b!1058624))

(assert (= (and b!1058624 res!707283) b!1058625))

(declare-fun m!977799 () Bool)

(assert (=> d!128481 m!977799))

(declare-fun m!977801 () Bool)

(assert (=> b!1058625 m!977801))

(assert (=> b!1058599 d!128481))

(check-sat (not b!1058623) (not b!1058625))
(check-sat)
