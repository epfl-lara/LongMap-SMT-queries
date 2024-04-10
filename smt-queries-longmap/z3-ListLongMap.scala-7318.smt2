; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93530 () Bool)

(assert start!93530)

(declare-fun res!707441 () Bool)

(declare-fun e!602500 () Bool)

(assert (=> start!93530 (=> (not res!707441) (not e!602500))))

(declare-fun from!2850 () (_ BitVec 32))

(declare-datatypes ((array!66820 0))(
  ( (array!66821 (arr!32126 (Array (_ BitVec 32) (_ BitVec 64))) (size!32662 (_ BitVec 32))) )
))
(declare-fun a!3475 () array!66820)

(assert (=> start!93530 (= res!707441 (and (bvsge from!2850 #b00000000000000000000000000000000) (bvslt from!2850 (size!32662 a!3475)) (bvslt (size!32662 a!3475) #b01111111111111111111111111111111)))))

(assert (=> start!93530 e!602500))

(assert (=> start!93530 true))

(declare-fun array_inv!24906 (array!66820) Bool)

(assert (=> start!93530 (array_inv!24906 a!3475)))

(declare-fun b!1058865 () Bool)

(declare-fun res!707439 () Bool)

(assert (=> b!1058865 (=> (not res!707439) (not e!602500))))

(declare-fun k0!2741 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66820 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058865 (= res!707439 (arrayContainsKey!0 a!3475 k0!2741 from!2850))))

(declare-fun b!1058866 () Bool)

(declare-fun res!707440 () Bool)

(assert (=> b!1058866 (=> (not res!707440) (not e!602500))))

(assert (=> b!1058866 (= res!707440 (not (= (select (arr!32126 a!3475) from!2850) k0!2741)))))

(declare-fun b!1058867 () Bool)

(declare-fun lt!467055 () (_ BitVec 32))

(assert (=> b!1058867 (= e!602500 (or (bvslt lt!467055 #b00000000000000000000000000000000) (bvsge lt!467055 (size!32662 a!3475)) (not (= (select (arr!32126 a!3475) lt!467055) k0!2741))))))

(declare-fun arrayScanForKey!0 (array!66820 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1058867 (= lt!467055 (arrayScanForKey!0 a!3475 k0!2741 (bvadd #b00000000000000000000000000000001 from!2850)))))

(assert (= (and start!93530 res!707441) b!1058865))

(assert (= (and b!1058865 res!707439) b!1058866))

(assert (= (and b!1058866 res!707440) b!1058867))

(declare-fun m!978499 () Bool)

(assert (=> start!93530 m!978499))

(declare-fun m!978501 () Bool)

(assert (=> b!1058865 m!978501))

(declare-fun m!978503 () Bool)

(assert (=> b!1058866 m!978503))

(declare-fun m!978505 () Bool)

(assert (=> b!1058867 m!978505))

(declare-fun m!978507 () Bool)

(assert (=> b!1058867 m!978507))

(check-sat (not start!93530) (not b!1058867) (not b!1058865))
(check-sat)
(get-model)

(declare-fun d!128653 () Bool)

(assert (=> d!128653 (= (array_inv!24906 a!3475) (bvsge (size!32662 a!3475) #b00000000000000000000000000000000))))

(assert (=> start!93530 d!128653))

(declare-fun d!128655 () Bool)

(declare-fun lt!467061 () (_ BitVec 32))

(assert (=> d!128655 (and (or (bvslt lt!467061 #b00000000000000000000000000000000) (bvsge lt!467061 (size!32662 a!3475)) (and (bvsge lt!467061 #b00000000000000000000000000000000) (bvslt lt!467061 (size!32662 a!3475)))) (bvsge lt!467061 #b00000000000000000000000000000000) (bvslt lt!467061 (size!32662 a!3475)) (= (select (arr!32126 a!3475) lt!467061) k0!2741))))

(declare-fun e!602509 () (_ BitVec 32))

(assert (=> d!128655 (= lt!467061 e!602509)))

(declare-fun c!107175 () Bool)

(assert (=> d!128655 (= c!107175 (= (select (arr!32126 a!3475) (bvadd #b00000000000000000000000000000001 from!2850)) k0!2741))))

(assert (=> d!128655 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2850) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2850) (size!32662 a!3475)) (bvslt (size!32662 a!3475) #b01111111111111111111111111111111))))

(assert (=> d!128655 (= (arrayScanForKey!0 a!3475 k0!2741 (bvadd #b00000000000000000000000000000001 from!2850)) lt!467061)))

(declare-fun b!1058881 () Bool)

(assert (=> b!1058881 (= e!602509 (bvadd #b00000000000000000000000000000001 from!2850))))

(declare-fun b!1058882 () Bool)

(assert (=> b!1058882 (= e!602509 (arrayScanForKey!0 a!3475 k0!2741 (bvadd #b00000000000000000000000000000001 from!2850 #b00000000000000000000000000000001)))))

(assert (= (and d!128655 c!107175) b!1058881))

(assert (= (and d!128655 (not c!107175)) b!1058882))

(declare-fun m!978519 () Bool)

(assert (=> d!128655 m!978519))

(declare-fun m!978521 () Bool)

(assert (=> d!128655 m!978521))

(declare-fun m!978523 () Bool)

(assert (=> b!1058882 m!978523))

(assert (=> b!1058867 d!128655))

(declare-fun d!128665 () Bool)

(declare-fun res!707455 () Bool)

(declare-fun e!602514 () Bool)

(assert (=> d!128665 (=> res!707455 e!602514)))

(assert (=> d!128665 (= res!707455 (= (select (arr!32126 a!3475) from!2850) k0!2741))))

(assert (=> d!128665 (= (arrayContainsKey!0 a!3475 k0!2741 from!2850) e!602514)))

(declare-fun b!1058887 () Bool)

(declare-fun e!602515 () Bool)

(assert (=> b!1058887 (= e!602514 e!602515)))

(declare-fun res!707456 () Bool)

(assert (=> b!1058887 (=> (not res!707456) (not e!602515))))

(assert (=> b!1058887 (= res!707456 (bvslt (bvadd from!2850 #b00000000000000000000000000000001) (size!32662 a!3475)))))

(declare-fun b!1058888 () Bool)

(assert (=> b!1058888 (= e!602515 (arrayContainsKey!0 a!3475 k0!2741 (bvadd from!2850 #b00000000000000000000000000000001)))))

(assert (= (and d!128665 (not res!707455)) b!1058887))

(assert (= (and b!1058887 res!707456) b!1058888))

(assert (=> d!128665 m!978503))

(declare-fun m!978525 () Bool)

(assert (=> b!1058888 m!978525))

(assert (=> b!1058865 d!128665))

(check-sat (not b!1058882) (not b!1058888))
(check-sat)
