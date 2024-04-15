; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93454 () Bool)

(assert start!93454)

(declare-fun b!1058447 () Bool)

(declare-fun res!707108 () Bool)

(declare-fun e!602181 () Bool)

(assert (=> b!1058447 (=> (not res!707108) (not e!602181))))

(declare-datatypes ((array!66698 0))(
  ( (array!66699 (arr!32067 (Array (_ BitVec 32) (_ BitVec 64))) (size!32605 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66698)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1058447 (= res!707108 (= (select (arr!32067 a!3488) i!1381) k0!2747))))

(declare-fun b!1058448 () Bool)

(declare-fun e!602178 () Bool)

(assert (=> b!1058448 (= e!602181 e!602178)))

(declare-fun res!707109 () Bool)

(assert (=> b!1058448 (=> (not res!707109) (not e!602178))))

(declare-fun lt!466792 () array!66698)

(declare-fun arrayContainsKey!0 (array!66698 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058448 (= res!707109 (arrayContainsKey!0 lt!466792 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1058448 (= lt!466792 (array!66699 (store (arr!32067 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32605 a!3488)))))

(declare-fun b!1058449 () Bool)

(declare-fun res!707110 () Bool)

(assert (=> b!1058449 (=> (not res!707110) (not e!602181))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1058449 (= res!707110 (validKeyInArray!0 k0!2747))))

(declare-fun b!1058450 () Bool)

(declare-fun e!602180 () Bool)

(assert (=> b!1058450 (= e!602180 (not true))))

(declare-fun lt!466791 () (_ BitVec 32))

(assert (=> b!1058450 (= (select (store (arr!32067 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466791) k0!2747)))

(declare-fun res!707105 () Bool)

(assert (=> start!93454 (=> (not res!707105) (not e!602181))))

(assert (=> start!93454 (= res!707105 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32605 a!3488)) (bvslt (size!32605 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93454 e!602181))

(assert (=> start!93454 true))

(declare-fun array_inv!24850 (array!66698) Bool)

(assert (=> start!93454 (array_inv!24850 a!3488)))

(declare-fun b!1058451 () Bool)

(assert (=> b!1058451 (= e!602178 e!602180)))

(declare-fun res!707106 () Bool)

(assert (=> b!1058451 (=> (not res!707106) (not e!602180))))

(assert (=> b!1058451 (= res!707106 (not (= lt!466791 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66698 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1058451 (= lt!466791 (arrayScanForKey!0 lt!466792 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1058452 () Bool)

(declare-fun res!707107 () Bool)

(assert (=> b!1058452 (=> (not res!707107) (not e!602181))))

(declare-datatypes ((List!22438 0))(
  ( (Nil!22435) (Cons!22434 (h!23643 (_ BitVec 64)) (t!31736 List!22438)) )
))
(declare-fun arrayNoDuplicates!0 (array!66698 (_ BitVec 32) List!22438) Bool)

(assert (=> b!1058452 (= res!707107 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22435))))

(assert (= (and start!93454 res!707105) b!1058452))

(assert (= (and b!1058452 res!707107) b!1058449))

(assert (= (and b!1058449 res!707110) b!1058447))

(assert (= (and b!1058447 res!707108) b!1058448))

(assert (= (and b!1058448 res!707109) b!1058451))

(assert (= (and b!1058451 res!707106) b!1058450))

(declare-fun m!977633 () Bool)

(assert (=> b!1058448 m!977633))

(declare-fun m!977635 () Bool)

(assert (=> b!1058448 m!977635))

(assert (=> b!1058450 m!977635))

(declare-fun m!977637 () Bool)

(assert (=> b!1058450 m!977637))

(declare-fun m!977639 () Bool)

(assert (=> b!1058451 m!977639))

(declare-fun m!977641 () Bool)

(assert (=> b!1058452 m!977641))

(declare-fun m!977643 () Bool)

(assert (=> start!93454 m!977643))

(declare-fun m!977645 () Bool)

(assert (=> b!1058449 m!977645))

(declare-fun m!977647 () Bool)

(assert (=> b!1058447 m!977647))

(check-sat (not start!93454) (not b!1058448) (not b!1058449) (not b!1058452) (not b!1058451))
(check-sat)
