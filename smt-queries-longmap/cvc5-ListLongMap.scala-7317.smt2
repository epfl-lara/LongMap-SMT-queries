; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93522 () Bool)

(assert start!93522)

(declare-fun res!707405 () Bool)

(declare-fun e!602475 () Bool)

(assert (=> start!93522 (=> (not res!707405) (not e!602475))))

(declare-fun from!2850 () (_ BitVec 32))

(declare-datatypes ((array!66812 0))(
  ( (array!66813 (arr!32122 (Array (_ BitVec 32) (_ BitVec 64))) (size!32658 (_ BitVec 32))) )
))
(declare-fun a!3475 () array!66812)

(assert (=> start!93522 (= res!707405 (and (bvsge from!2850 #b00000000000000000000000000000000) (bvslt from!2850 (size!32658 a!3475)) (bvslt (size!32658 a!3475) #b01111111111111111111111111111111)))))

(assert (=> start!93522 e!602475))

(assert (=> start!93522 true))

(declare-fun array_inv!24902 (array!66812) Bool)

(assert (=> start!93522 (array_inv!24902 a!3475)))

(declare-fun b!1058829 () Bool)

(declare-fun res!707403 () Bool)

(assert (=> b!1058829 (=> (not res!707403) (not e!602475))))

(declare-fun k!2741 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66812 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058829 (= res!707403 (arrayContainsKey!0 a!3475 k!2741 from!2850))))

(declare-fun b!1058830 () Bool)

(declare-fun res!707404 () Bool)

(assert (=> b!1058830 (=> (not res!707404) (not e!602475))))

(assert (=> b!1058830 (= res!707404 (not (= (select (arr!32122 a!3475) from!2850) k!2741)))))

(declare-fun b!1058831 () Bool)

(assert (=> b!1058831 (= e!602475 false)))

(declare-fun lt!467043 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!66812 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1058831 (= lt!467043 (arrayScanForKey!0 a!3475 k!2741 (bvadd #b00000000000000000000000000000001 from!2850)))))

(assert (= (and start!93522 res!707405) b!1058829))

(assert (= (and b!1058829 res!707403) b!1058830))

(assert (= (and b!1058830 res!707404) b!1058831))

(declare-fun m!978465 () Bool)

(assert (=> start!93522 m!978465))

(declare-fun m!978467 () Bool)

(assert (=> b!1058829 m!978467))

(declare-fun m!978469 () Bool)

(assert (=> b!1058830 m!978469))

(declare-fun m!978471 () Bool)

(assert (=> b!1058831 m!978471))

(push 1)

(assert (not start!93522))

(assert (not b!1058831))

(assert (not b!1058829))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

