; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93494 () Bool)

(assert start!93494)

(declare-fun res!707327 () Bool)

(declare-fun e!602404 () Bool)

(assert (=> start!93494 (=> (not res!707327) (not e!602404))))

(declare-fun from!2850 () (_ BitVec 32))

(declare-datatypes ((array!66793 0))(
  ( (array!66794 (arr!32114 (Array (_ BitVec 32) (_ BitVec 64))) (size!32650 (_ BitVec 32))) )
))
(declare-fun a!3475 () array!66793)

(assert (=> start!93494 (= res!707327 (and (bvsge from!2850 #b00000000000000000000000000000000) (bvslt from!2850 (size!32650 a!3475)) (bvslt (size!32650 a!3475) #b01111111111111111111111111111111)))))

(assert (=> start!93494 e!602404))

(assert (=> start!93494 true))

(declare-fun array_inv!24894 (array!66793) Bool)

(assert (=> start!93494 (array_inv!24894 a!3475)))

(declare-fun b!1058751 () Bool)

(declare-fun res!707326 () Bool)

(assert (=> b!1058751 (=> (not res!707326) (not e!602404))))

(declare-fun k0!2741 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66793 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058751 (= res!707326 (arrayContainsKey!0 a!3475 k0!2741 from!2850))))

(declare-fun b!1058752 () Bool)

(declare-fun res!707325 () Bool)

(assert (=> b!1058752 (=> (not res!707325) (not e!602404))))

(assert (=> b!1058752 (= res!707325 (and (not (= (select (arr!32114 a!3475) from!2850) k0!2741)) (bvsge (bvadd #b00000000000000000000000000000001 from!2850) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2850) (size!32650 a!3475))))))

(declare-fun b!1058753 () Bool)

(assert (=> b!1058753 (= e!602404 (not (arrayContainsKey!0 a!3475 k0!2741 (bvadd #b00000000000000000000000000000001 from!2850))))))

(assert (= (and start!93494 res!707327) b!1058751))

(assert (= (and b!1058751 res!707326) b!1058752))

(assert (= (and b!1058752 res!707325) b!1058753))

(declare-fun m!978405 () Bool)

(assert (=> start!93494 m!978405))

(declare-fun m!978407 () Bool)

(assert (=> b!1058751 m!978407))

(declare-fun m!978409 () Bool)

(assert (=> b!1058752 m!978409))

(declare-fun m!978411 () Bool)

(assert (=> b!1058753 m!978411))

(check-sat (not b!1058753) (not b!1058751) (not start!93494))
(check-sat)
(get-model)

(declare-fun d!128627 () Bool)

(declare-fun res!707341 () Bool)

(declare-fun e!602415 () Bool)

(assert (=> d!128627 (=> res!707341 e!602415)))

(assert (=> d!128627 (= res!707341 (= (select (arr!32114 a!3475) (bvadd #b00000000000000000000000000000001 from!2850)) k0!2741))))

(assert (=> d!128627 (= (arrayContainsKey!0 a!3475 k0!2741 (bvadd #b00000000000000000000000000000001 from!2850)) e!602415)))

(declare-fun b!1058767 () Bool)

(declare-fun e!602416 () Bool)

(assert (=> b!1058767 (= e!602415 e!602416)))

(declare-fun res!707342 () Bool)

(assert (=> b!1058767 (=> (not res!707342) (not e!602416))))

(assert (=> b!1058767 (= res!707342 (bvslt (bvadd #b00000000000000000000000000000001 from!2850 #b00000000000000000000000000000001) (size!32650 a!3475)))))

(declare-fun b!1058768 () Bool)

(assert (=> b!1058768 (= e!602416 (arrayContainsKey!0 a!3475 k0!2741 (bvadd #b00000000000000000000000000000001 from!2850 #b00000000000000000000000000000001)))))

(assert (= (and d!128627 (not res!707341)) b!1058767))

(assert (= (and b!1058767 res!707342) b!1058768))

(declare-fun m!978421 () Bool)

(assert (=> d!128627 m!978421))

(declare-fun m!978423 () Bool)

(assert (=> b!1058768 m!978423))

(assert (=> b!1058753 d!128627))

(declare-fun d!128629 () Bool)

(declare-fun res!707343 () Bool)

(declare-fun e!602417 () Bool)

(assert (=> d!128629 (=> res!707343 e!602417)))

(assert (=> d!128629 (= res!707343 (= (select (arr!32114 a!3475) from!2850) k0!2741))))

(assert (=> d!128629 (= (arrayContainsKey!0 a!3475 k0!2741 from!2850) e!602417)))

(declare-fun b!1058769 () Bool)

(declare-fun e!602418 () Bool)

(assert (=> b!1058769 (= e!602417 e!602418)))

(declare-fun res!707344 () Bool)

(assert (=> b!1058769 (=> (not res!707344) (not e!602418))))

(assert (=> b!1058769 (= res!707344 (bvslt (bvadd from!2850 #b00000000000000000000000000000001) (size!32650 a!3475)))))

(declare-fun b!1058770 () Bool)

(assert (=> b!1058770 (= e!602418 (arrayContainsKey!0 a!3475 k0!2741 (bvadd from!2850 #b00000000000000000000000000000001)))))

(assert (= (and d!128629 (not res!707343)) b!1058769))

(assert (= (and b!1058769 res!707344) b!1058770))

(assert (=> d!128629 m!978409))

(declare-fun m!978425 () Bool)

(assert (=> b!1058770 m!978425))

(assert (=> b!1058751 d!128629))

(declare-fun d!128631 () Bool)

(assert (=> d!128631 (= (array_inv!24894 a!3475) (bvsge (size!32650 a!3475) #b00000000000000000000000000000000))))

(assert (=> start!93494 d!128631))

(check-sat (not b!1058770) (not b!1058768))
(check-sat)
