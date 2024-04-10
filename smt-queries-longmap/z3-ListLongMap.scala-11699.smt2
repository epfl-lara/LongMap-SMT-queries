; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136816 () Bool)

(assert start!136816)

(declare-fun res!1078753 () Bool)

(declare-fun e!880636 () Bool)

(assert (=> start!136816 (=> (not res!1078753) (not e!880636))))

(declare-fun from!2937 () (_ BitVec 32))

(declare-datatypes ((array!105805 0))(
  ( (array!105806 (arr!51011 (Array (_ BitVec 32) (_ BitVec 64))) (size!51561 (_ BitVec 32))) )
))
(declare-fun a!3559 () array!105805)

(assert (=> start!136816 (= res!1078753 (and (bvsge from!2937 #b00000000000000000000000000000000) (bvslt from!2937 (size!51561 a!3559)) (bvslt (size!51561 a!3559) #b01111111111111111111111111111111)))))

(assert (=> start!136816 e!880636))

(assert (=> start!136816 true))

(declare-fun array_inv!39738 (array!105805) Bool)

(assert (=> start!136816 (array_inv!39738 a!3559)))

(declare-fun b!1578814 () Bool)

(declare-fun res!1078754 () Bool)

(assert (=> b!1578814 (=> (not res!1078754) (not e!880636))))

(declare-fun k0!2792 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!105805 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1578814 (= res!1078754 (arrayContainsKey!0 a!3559 k0!2792 from!2937))))

(declare-fun b!1578815 () Bool)

(declare-fun res!1078755 () Bool)

(assert (=> b!1578815 (=> (not res!1078755) (not e!880636))))

(assert (=> b!1578815 (= res!1078755 (bvsle from!2937 #b00000000000000000000000000000000))))

(declare-fun b!1578816 () Bool)

(assert (=> b!1578816 (= e!880636 (not (arrayContainsKey!0 a!3559 k0!2792 #b00000000000000000000000000000000)))))

(assert (= (and start!136816 res!1078753) b!1578814))

(assert (= (and b!1578814 res!1078754) b!1578815))

(assert (= (and b!1578815 res!1078755) b!1578816))

(declare-fun m!1450831 () Bool)

(assert (=> start!136816 m!1450831))

(declare-fun m!1450833 () Bool)

(assert (=> b!1578814 m!1450833))

(declare-fun m!1450835 () Bool)

(assert (=> b!1578816 m!1450835))

(check-sat (not b!1578814) (not b!1578816) (not start!136816))
(check-sat)
