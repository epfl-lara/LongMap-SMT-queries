; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93522 () Bool)

(assert start!93522)

(declare-fun res!707363 () Bool)

(declare-fun e!602400 () Bool)

(assert (=> start!93522 (=> (not res!707363) (not e!602400))))

(declare-fun from!2850 () (_ BitVec 32))

(declare-datatypes ((array!66755 0))(
  ( (array!66756 (arr!32094 (Array (_ BitVec 32) (_ BitVec 64))) (size!32632 (_ BitVec 32))) )
))
(declare-fun a!3475 () array!66755)

(assert (=> start!93522 (= res!707363 (and (bvsge from!2850 #b00000000000000000000000000000000) (bvslt from!2850 (size!32632 a!3475)) (bvslt (size!32632 a!3475) #b01111111111111111111111111111111)))))

(assert (=> start!93522 e!602400))

(assert (=> start!93522 true))

(declare-fun array_inv!24877 (array!66755) Bool)

(assert (=> start!93522 (array_inv!24877 a!3475)))

(declare-fun b!1058703 () Bool)

(declare-fun res!707361 () Bool)

(assert (=> b!1058703 (=> (not res!707361) (not e!602400))))

(declare-fun k0!2741 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66755 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058703 (= res!707361 (arrayContainsKey!0 a!3475 k0!2741 from!2850))))

(declare-fun b!1058704 () Bool)

(declare-fun res!707362 () Bool)

(assert (=> b!1058704 (=> (not res!707362) (not e!602400))))

(assert (=> b!1058704 (= res!707362 (not (= (select (arr!32094 a!3475) from!2850) k0!2741)))))

(declare-fun b!1058705 () Bool)

(declare-fun lt!466852 () (_ BitVec 32))

(assert (=> b!1058705 (= e!602400 (or (bvslt lt!466852 #b00000000000000000000000000000000) (bvsge lt!466852 (size!32632 a!3475)) (not (= (select (arr!32094 a!3475) lt!466852) k0!2741))))))

(declare-fun arrayScanForKey!0 (array!66755 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1058705 (= lt!466852 (arrayScanForKey!0 a!3475 k0!2741 (bvadd #b00000000000000000000000000000001 from!2850)))))

(assert (= (and start!93522 res!707363) b!1058703))

(assert (= (and b!1058703 res!707361) b!1058704))

(assert (= (and b!1058704 res!707362) b!1058705))

(declare-fun m!977863 () Bool)

(assert (=> start!93522 m!977863))

(declare-fun m!977865 () Bool)

(assert (=> b!1058703 m!977865))

(declare-fun m!977867 () Bool)

(assert (=> b!1058704 m!977867))

(declare-fun m!977869 () Bool)

(assert (=> b!1058705 m!977869))

(declare-fun m!977871 () Bool)

(assert (=> b!1058705 m!977871))

(check-sat (not start!93522) (not b!1058705) (not b!1058703))
(check-sat)
(get-model)

(declare-fun d!128497 () Bool)

(assert (=> d!128497 (= (array_inv!24877 a!3475) (bvsge (size!32632 a!3475) #b00000000000000000000000000000000))))

(assert (=> start!93522 d!128497))

(declare-fun d!128499 () Bool)

(declare-fun lt!466861 () (_ BitVec 32))

(assert (=> d!128499 (and (or (bvslt lt!466861 #b00000000000000000000000000000000) (bvsge lt!466861 (size!32632 a!3475)) (and (bvsge lt!466861 #b00000000000000000000000000000000) (bvslt lt!466861 (size!32632 a!3475)))) (bvsge lt!466861 #b00000000000000000000000000000000) (bvslt lt!466861 (size!32632 a!3475)) (= (select (arr!32094 a!3475) lt!466861) k0!2741))))

(declare-fun e!602416 () (_ BitVec 32))

(assert (=> d!128499 (= lt!466861 e!602416)))

(declare-fun c!107136 () Bool)

(assert (=> d!128499 (= c!107136 (= (select (arr!32094 a!3475) (bvadd #b00000000000000000000000000000001 from!2850)) k0!2741))))

(assert (=> d!128499 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2850) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2850) (size!32632 a!3475)) (bvslt (size!32632 a!3475) #b01111111111111111111111111111111))))

(assert (=> d!128499 (= (arrayScanForKey!0 a!3475 k0!2741 (bvadd #b00000000000000000000000000000001 from!2850)) lt!466861)))

(declare-fun b!1058728 () Bool)

(assert (=> b!1058728 (= e!602416 (bvadd #b00000000000000000000000000000001 from!2850))))

(declare-fun b!1058729 () Bool)

(assert (=> b!1058729 (= e!602416 (arrayScanForKey!0 a!3475 k0!2741 (bvadd #b00000000000000000000000000000001 from!2850 #b00000000000000000000000000000001)))))

(assert (= (and d!128499 c!107136) b!1058728))

(assert (= (and d!128499 (not c!107136)) b!1058729))

(declare-fun m!977893 () Bool)

(assert (=> d!128499 m!977893))

(declare-fun m!977895 () Bool)

(assert (=> d!128499 m!977895))

(declare-fun m!977897 () Bool)

(assert (=> b!1058729 m!977897))

(assert (=> b!1058705 d!128499))

(declare-fun d!128505 () Bool)

(declare-fun res!707386 () Bool)

(declare-fun e!602421 () Bool)

(assert (=> d!128505 (=> res!707386 e!602421)))

(assert (=> d!128505 (= res!707386 (= (select (arr!32094 a!3475) from!2850) k0!2741))))

(assert (=> d!128505 (= (arrayContainsKey!0 a!3475 k0!2741 from!2850) e!602421)))

(declare-fun b!1058734 () Bool)

(declare-fun e!602422 () Bool)

(assert (=> b!1058734 (= e!602421 e!602422)))

(declare-fun res!707387 () Bool)

(assert (=> b!1058734 (=> (not res!707387) (not e!602422))))

(assert (=> b!1058734 (= res!707387 (bvslt (bvadd from!2850 #b00000000000000000000000000000001) (size!32632 a!3475)))))

(declare-fun b!1058735 () Bool)

(assert (=> b!1058735 (= e!602422 (arrayContainsKey!0 a!3475 k0!2741 (bvadd from!2850 #b00000000000000000000000000000001)))))

(assert (= (and d!128505 (not res!707386)) b!1058734))

(assert (= (and b!1058734 res!707387) b!1058735))

(assert (=> d!128505 m!977867))

(declare-fun m!977899 () Bool)

(assert (=> b!1058735 m!977899))

(assert (=> b!1058703 d!128505))

(check-sat (not b!1058729) (not b!1058735))
(check-sat)
