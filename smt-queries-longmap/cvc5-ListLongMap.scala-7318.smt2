; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93528 () Bool)

(assert start!93528)

(declare-fun res!707430 () Bool)

(declare-fun e!602493 () Bool)

(assert (=> start!93528 (=> (not res!707430) (not e!602493))))

(declare-fun from!2850 () (_ BitVec 32))

(declare-datatypes ((array!66818 0))(
  ( (array!66819 (arr!32125 (Array (_ BitVec 32) (_ BitVec 64))) (size!32661 (_ BitVec 32))) )
))
(declare-fun a!3475 () array!66818)

(assert (=> start!93528 (= res!707430 (and (bvsge from!2850 #b00000000000000000000000000000000) (bvslt from!2850 (size!32661 a!3475)) (bvslt (size!32661 a!3475) #b01111111111111111111111111111111)))))

(assert (=> start!93528 e!602493))

(assert (=> start!93528 true))

(declare-fun array_inv!24905 (array!66818) Bool)

(assert (=> start!93528 (array_inv!24905 a!3475)))

(declare-fun b!1058856 () Bool)

(declare-fun res!707431 () Bool)

(assert (=> b!1058856 (=> (not res!707431) (not e!602493))))

(declare-fun k!2741 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66818 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058856 (= res!707431 (arrayContainsKey!0 a!3475 k!2741 from!2850))))

(declare-fun b!1058857 () Bool)

(declare-fun res!707432 () Bool)

(assert (=> b!1058857 (=> (not res!707432) (not e!602493))))

(assert (=> b!1058857 (= res!707432 (not (= (select (arr!32125 a!3475) from!2850) k!2741)))))

(declare-fun b!1058858 () Bool)

(declare-fun lt!467052 () (_ BitVec 32))

(assert (=> b!1058858 (= e!602493 (or (bvslt lt!467052 #b00000000000000000000000000000000) (bvsge lt!467052 (size!32661 a!3475)) (not (= (select (arr!32125 a!3475) lt!467052) k!2741))))))

(declare-fun arrayScanForKey!0 (array!66818 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1058858 (= lt!467052 (arrayScanForKey!0 a!3475 k!2741 (bvadd #b00000000000000000000000000000001 from!2850)))))

(assert (= (and start!93528 res!707430) b!1058856))

(assert (= (and b!1058856 res!707431) b!1058857))

(assert (= (and b!1058857 res!707432) b!1058858))

(declare-fun m!978489 () Bool)

(assert (=> start!93528 m!978489))

(declare-fun m!978491 () Bool)

(assert (=> b!1058856 m!978491))

(declare-fun m!978493 () Bool)

(assert (=> b!1058857 m!978493))

(declare-fun m!978495 () Bool)

(assert (=> b!1058858 m!978495))

(declare-fun m!978497 () Bool)

(assert (=> b!1058858 m!978497))

(push 1)

(assert (not start!93528))

(assert (not b!1058858))

(assert (not b!1058856))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!128657 () Bool)

(assert (=> d!128657 (= (array_inv!24905 a!3475) (bvsge (size!32661 a!3475) #b00000000000000000000000000000000))))

(assert (=> start!93528 d!128657))

(declare-fun d!128659 () Bool)

(declare-fun lt!467066 () (_ BitVec 32))

(assert (=> d!128659 (and (or (bvslt lt!467066 #b00000000000000000000000000000000) (bvsge lt!467066 (size!32661 a!3475)) (and (bvsge lt!467066 #b00000000000000000000000000000000) (bvslt lt!467066 (size!32661 a!3475)))) (bvsge lt!467066 #b00000000000000000000000000000000) (bvslt lt!467066 (size!32661 a!3475)) (= (select (arr!32125 a!3475) lt!467066) k!2741))))

(declare-fun e!602520 () (_ BitVec 32))

(assert (=> d!128659 (= lt!467066 e!602520)))

(declare-fun c!107180 () Bool)

(assert (=> d!128659 (= c!107180 (= (select (arr!32125 a!3475) (bvadd #b00000000000000000000000000000001 from!2850)) k!2741))))

(assert (=> d!128659 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2850) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2850) (size!32661 a!3475)) (bvslt (size!32661 a!3475) #b01111111111111111111111111111111))))

(assert (=> d!128659 (= (arrayScanForKey!0 a!3475 k!2741 (bvadd #b00000000000000000000000000000001 from!2850)) lt!467066)))

(declare-fun b!1058897 () Bool)

(assert (=> b!1058897 (= e!602520 (bvadd #b00000000000000000000000000000001 from!2850))))

(declare-fun b!1058898 () Bool)

(assert (=> b!1058898 (= e!602520 (arrayScanForKey!0 a!3475 k!2741 (bvadd #b00000000000000000000000000000001 from!2850 #b00000000000000000000000000000001)))))

(assert (= (and d!128659 c!107180) b!1058897))

(assert (= (and d!128659 (not c!107180)) b!1058898))

(declare-fun m!978527 () Bool)

(assert (=> d!128659 m!978527))

(declare-fun m!978529 () Bool)

(assert (=> d!128659 m!978529))

(declare-fun m!978531 () Bool)

(assert (=> b!1058898 m!978531))

(assert (=> b!1058858 d!128659))

(declare-fun d!128667 () Bool)

(declare-fun res!707461 () Bool)

(declare-fun e!602526 () Bool)

(assert (=> d!128667 (=> res!707461 e!602526)))

(assert (=> d!128667 (= res!707461 (= (select (arr!32125 a!3475) from!2850) k!2741))))

(assert (=> d!128667 (= (arrayContainsKey!0 a!3475 k!2741 from!2850) e!602526)))

(declare-fun b!1058905 () Bool)

(declare-fun e!602527 () Bool)

(assert (=> b!1058905 (= e!602526 e!602527)))

(declare-fun res!707462 () Bool)

(assert (=> b!1058905 (=> (not res!707462) (not e!602527))))

(assert (=> b!1058905 (= res!707462 (bvslt (bvadd from!2850 #b00000000000000000000000000000001) (size!32661 a!3475)))))

(declare-fun b!1058906 () Bool)

(assert (=> b!1058906 (= e!602527 (arrayContainsKey!0 a!3475 k!2741 (bvadd from!2850 #b00000000000000000000000000000001)))))

(assert (= (and d!128667 (not res!707461)) b!1058905))

(assert (= (and b!1058905 res!707462) b!1058906))

(assert (=> d!128667 m!978493))

(declare-fun m!978539 () Bool)

(assert (=> b!1058906 m!978539))

(assert (=> b!1058856 d!128667))

(push 1)

(assert (not b!1058906))

(assert (not b!1058898))

(check-sat)

(pop 1)

(push 1)

(check-sat)

