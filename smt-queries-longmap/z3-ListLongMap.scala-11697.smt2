; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136804 () Bool)

(assert start!136804)

(declare-fun b!1578748 () Bool)

(declare-fun res!1078686 () Bool)

(declare-fun e!880600 () Bool)

(assert (=> b!1578748 (=> (not res!1078686) (not e!880600))))

(declare-fun from!2937 () (_ BitVec 32))

(declare-datatypes ((array!105793 0))(
  ( (array!105794 (arr!51005 (Array (_ BitVec 32) (_ BitVec 64))) (size!51555 (_ BitVec 32))) )
))
(declare-fun a!3559 () array!105793)

(assert (=> b!1578748 (= res!1078686 (and (bvsgt from!2937 #b00000000000000000000000000000000) (bvslt (bvsub from!2937 #b00000000000000000000000000000001) (size!51555 a!3559))))))

(declare-fun b!1578750 () Bool)

(assert (=> b!1578750 (= e!880600 (bvsge (bvsub from!2937 #b00000000000000000000000000000001) from!2937))))

(declare-fun b!1578749 () Bool)

(declare-fun res!1078687 () Bool)

(assert (=> b!1578749 (=> (not res!1078687) (not e!880600))))

(declare-fun k0!2792 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!105793 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1578749 (= res!1078687 (arrayContainsKey!0 a!3559 k0!2792 (bvsub from!2937 #b00000000000000000000000000000001)))))

(declare-fun b!1578747 () Bool)

(declare-fun res!1078689 () Bool)

(assert (=> b!1578747 (=> (not res!1078689) (not e!880600))))

(assert (=> b!1578747 (= res!1078689 (arrayContainsKey!0 a!3559 k0!2792 from!2937))))

(declare-fun res!1078688 () Bool)

(assert (=> start!136804 (=> (not res!1078688) (not e!880600))))

(assert (=> start!136804 (= res!1078688 (and (bvsge from!2937 #b00000000000000000000000000000000) (bvslt from!2937 (size!51555 a!3559)) (bvslt (size!51555 a!3559) #b01111111111111111111111111111111)))))

(assert (=> start!136804 e!880600))

(assert (=> start!136804 true))

(declare-fun array_inv!39732 (array!105793) Bool)

(assert (=> start!136804 (array_inv!39732 a!3559)))

(assert (= (and start!136804 res!1078688) b!1578747))

(assert (= (and b!1578747 res!1078689) b!1578748))

(assert (= (and b!1578748 res!1078686) b!1578749))

(assert (= (and b!1578749 res!1078687) b!1578750))

(declare-fun m!1450783 () Bool)

(assert (=> b!1578749 m!1450783))

(declare-fun m!1450785 () Bool)

(assert (=> b!1578747 m!1450785))

(declare-fun m!1450787 () Bool)

(assert (=> start!136804 m!1450787))

(check-sat (not b!1578749) (not start!136804) (not b!1578747))
(check-sat)
