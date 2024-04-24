; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127946 () Bool)

(assert start!127946)

(declare-fun b!1501459 () Bool)

(declare-fun res!1021353 () Bool)

(declare-fun e!840487 () Bool)

(assert (=> b!1501459 (=> (not res!1021353) (not e!840487))))

(declare-datatypes ((array!100141 0))(
  ( (array!100142 (arr!48325 (Array (_ BitVec 32) (_ BitVec 64))) (size!48876 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100141)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1501459 (= res!1021353 (validKeyInArray!0 (select (arr!48325 a!2850) i!996)))))

(declare-fun b!1501460 () Bool)

(declare-fun e!840489 () Bool)

(assert (=> b!1501460 (= e!840489 false)))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun lt!653439 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12428 0))(
  ( (MissingZero!12428 (index!52104 (_ BitVec 32))) (Found!12428 (index!52105 (_ BitVec 32))) (Intermediate!12428 (undefined!13240 Bool) (index!52106 (_ BitVec 32)) (x!133987 (_ BitVec 32))) (Undefined!12428) (MissingVacant!12428 (index!52107 (_ BitVec 32))) )
))
(declare-fun lt!653438 () SeekEntryResult!12428)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100141 (_ BitVec 32)) SeekEntryResult!12428)

(assert (=> b!1501460 (= lt!653438 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653439 vacantBefore!10 (select (arr!48325 a!2850) j!87) a!2850 mask!2661))))

(declare-fun res!1021360 () Bool)

(assert (=> start!127946 (=> (not res!1021360) (not e!840487))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127946 (= res!1021360 (validMask!0 mask!2661))))

(assert (=> start!127946 e!840487))

(assert (=> start!127946 true))

(declare-fun array_inv!37606 (array!100141) Bool)

(assert (=> start!127946 (array_inv!37606 a!2850)))

(declare-fun b!1501461 () Bool)

(declare-fun res!1021357 () Bool)

(assert (=> b!1501461 (=> (not res!1021357) (not e!840487))))

(declare-fun index!625 () (_ BitVec 32))

(assert (=> b!1501461 (= res!1021357 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48325 a!2850) j!87) a!2850 mask!2661) (Found!12428 j!87)))))

(declare-fun b!1501462 () Bool)

(declare-fun res!1021355 () Bool)

(assert (=> b!1501462 (=> (not res!1021355) (not e!840487))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1501462 (= res!1021355 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48876 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48876 a!2850)) (= (select (arr!48325 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48325 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48876 a!2850))))))

(declare-fun b!1501463 () Bool)

(declare-fun res!1021359 () Bool)

(assert (=> b!1501463 (=> (not res!1021359) (not e!840487))))

(assert (=> b!1501463 (= res!1021359 (and (= (size!48876 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48876 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48876 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1501464 () Bool)

(assert (=> b!1501464 (= e!840487 e!840489)))

(declare-fun res!1021358 () Bool)

(assert (=> b!1501464 (=> (not res!1021358) (not e!840489))))

(assert (=> b!1501464 (= res!1021358 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653439 #b00000000000000000000000000000000) (bvslt lt!653439 (size!48876 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1501464 (= lt!653439 (nextIndex!0 index!625 (bvadd #b00000000000000000000000000000001 x!647) mask!2661))))

(declare-fun b!1501465 () Bool)

(declare-fun res!1021352 () Bool)

(assert (=> b!1501465 (=> (not res!1021352) (not e!840487))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100141 (_ BitVec 32)) Bool)

(assert (=> b!1501465 (= res!1021352 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1501466 () Bool)

(declare-fun res!1021356 () Bool)

(assert (=> b!1501466 (=> (not res!1021356) (not e!840487))))

(assert (=> b!1501466 (= res!1021356 (validKeyInArray!0 (select (arr!48325 a!2850) j!87)))))

(declare-fun b!1501467 () Bool)

(declare-fun res!1021354 () Bool)

(assert (=> b!1501467 (=> (not res!1021354) (not e!840487))))

(assert (=> b!1501467 (= res!1021354 (not (= (select (arr!48325 a!2850) index!625) (select (arr!48325 a!2850) j!87))))))

(declare-fun b!1501468 () Bool)

(declare-fun res!1021361 () Bool)

(assert (=> b!1501468 (=> (not res!1021361) (not e!840487))))

(declare-datatypes ((List!34804 0))(
  ( (Nil!34801) (Cons!34800 (h!36212 (_ BitVec 64)) (t!49490 List!34804)) )
))
(declare-fun arrayNoDuplicates!0 (array!100141 (_ BitVec 32) List!34804) Bool)

(assert (=> b!1501468 (= res!1021361 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34801))))

(assert (= (and start!127946 res!1021360) b!1501463))

(assert (= (and b!1501463 res!1021359) b!1501459))

(assert (= (and b!1501459 res!1021353) b!1501466))

(assert (= (and b!1501466 res!1021356) b!1501465))

(assert (= (and b!1501465 res!1021352) b!1501468))

(assert (= (and b!1501468 res!1021361) b!1501462))

(assert (= (and b!1501462 res!1021355) b!1501461))

(assert (= (and b!1501461 res!1021357) b!1501467))

(assert (= (and b!1501467 res!1021354) b!1501464))

(assert (= (and b!1501464 res!1021358) b!1501460))

(declare-fun m!1384603 () Bool)

(assert (=> b!1501459 m!1384603))

(assert (=> b!1501459 m!1384603))

(declare-fun m!1384605 () Bool)

(assert (=> b!1501459 m!1384605))

(declare-fun m!1384607 () Bool)

(assert (=> b!1501464 m!1384607))

(declare-fun m!1384609 () Bool)

(assert (=> b!1501461 m!1384609))

(assert (=> b!1501461 m!1384609))

(declare-fun m!1384611 () Bool)

(assert (=> b!1501461 m!1384611))

(declare-fun m!1384613 () Bool)

(assert (=> start!127946 m!1384613))

(declare-fun m!1384615 () Bool)

(assert (=> start!127946 m!1384615))

(declare-fun m!1384617 () Bool)

(assert (=> b!1501465 m!1384617))

(assert (=> b!1501466 m!1384609))

(assert (=> b!1501466 m!1384609))

(declare-fun m!1384619 () Bool)

(assert (=> b!1501466 m!1384619))

(declare-fun m!1384621 () Bool)

(assert (=> b!1501467 m!1384621))

(assert (=> b!1501467 m!1384609))

(declare-fun m!1384623 () Bool)

(assert (=> b!1501468 m!1384623))

(declare-fun m!1384625 () Bool)

(assert (=> b!1501462 m!1384625))

(declare-fun m!1384627 () Bool)

(assert (=> b!1501462 m!1384627))

(declare-fun m!1384629 () Bool)

(assert (=> b!1501462 m!1384629))

(assert (=> b!1501460 m!1384609))

(assert (=> b!1501460 m!1384609))

(declare-fun m!1384631 () Bool)

(assert (=> b!1501460 m!1384631))

(check-sat (not b!1501468) (not b!1501460) (not b!1501464) (not b!1501459) (not b!1501465) (not start!127946) (not b!1501466) (not b!1501461))
(check-sat)
