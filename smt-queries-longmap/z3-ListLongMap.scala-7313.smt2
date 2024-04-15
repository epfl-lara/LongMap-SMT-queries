; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93478 () Bool)

(assert start!93478)

(declare-fun res!707223 () Bool)

(declare-fun e!602282 () Bool)

(assert (=> start!93478 (=> (not res!707223) (not e!602282))))

(declare-fun from!2850 () (_ BitVec 32))

(declare-datatypes ((array!66722 0))(
  ( (array!66723 (arr!32079 (Array (_ BitVec 32) (_ BitVec 64))) (size!32617 (_ BitVec 32))) )
))
(declare-fun a!3475 () array!66722)

(assert (=> start!93478 (= res!707223 (and (bvsge from!2850 #b00000000000000000000000000000000) (bvslt from!2850 (size!32617 a!3475)) (bvslt (size!32617 a!3475) #b01111111111111111111111111111111)))))

(assert (=> start!93478 e!602282))

(assert (=> start!93478 true))

(declare-fun array_inv!24862 (array!66722) Bool)

(assert (=> start!93478 (array_inv!24862 a!3475)))

(declare-fun b!1058565 () Bool)

(declare-fun res!707224 () Bool)

(assert (=> b!1058565 (=> (not res!707224) (not e!602282))))

(declare-fun k0!2741 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66722 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058565 (= res!707224 (arrayContainsKey!0 a!3475 k0!2741 from!2850))))

(declare-fun b!1058566 () Bool)

(assert (=> b!1058566 (= e!602282 (and (not (= (select (arr!32079 a!3475) from!2850) k0!2741)) (or (bvslt (bvadd #b00000000000000000000000000000001 from!2850) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!2850) (size!32617 a!3475)))))))

(assert (= (and start!93478 res!707223) b!1058565))

(assert (= (and b!1058565 res!707224) b!1058566))

(declare-fun m!977753 () Bool)

(assert (=> start!93478 m!977753))

(declare-fun m!977755 () Bool)

(assert (=> b!1058565 m!977755))

(declare-fun m!977757 () Bool)

(assert (=> b!1058566 m!977757))

(check-sat (not b!1058565) (not start!93478))
(check-sat)
(get-model)

(declare-fun d!128469 () Bool)

(declare-fun res!707241 () Bool)

(declare-fun e!602300 () Bool)

(assert (=> d!128469 (=> res!707241 e!602300)))

(assert (=> d!128469 (= res!707241 (= (select (arr!32079 a!3475) from!2850) k0!2741))))

(assert (=> d!128469 (= (arrayContainsKey!0 a!3475 k0!2741 from!2850) e!602300)))

(declare-fun b!1058583 () Bool)

(declare-fun e!602301 () Bool)

(assert (=> b!1058583 (= e!602300 e!602301)))

(declare-fun res!707242 () Bool)

(assert (=> b!1058583 (=> (not res!707242) (not e!602301))))

(assert (=> b!1058583 (= res!707242 (bvslt (bvadd from!2850 #b00000000000000000000000000000001) (size!32617 a!3475)))))

(declare-fun b!1058584 () Bool)

(assert (=> b!1058584 (= e!602301 (arrayContainsKey!0 a!3475 k0!2741 (bvadd from!2850 #b00000000000000000000000000000001)))))

(assert (= (and d!128469 (not res!707241)) b!1058583))

(assert (= (and b!1058583 res!707242) b!1058584))

(assert (=> d!128469 m!977757))

(declare-fun m!977771 () Bool)

(assert (=> b!1058584 m!977771))

(assert (=> b!1058565 d!128469))

(declare-fun d!128471 () Bool)

(assert (=> d!128471 (= (array_inv!24862 a!3475) (bvsge (size!32617 a!3475) #b00000000000000000000000000000000))))

(assert (=> start!93478 d!128471))

(check-sat (not b!1058584))
(check-sat)
