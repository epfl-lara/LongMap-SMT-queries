; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136806 () Bool)

(assert start!136806)

(declare-fun b!1578760 () Bool)

(declare-fun res!1078700 () Bool)

(declare-fun e!880607 () Bool)

(assert (=> b!1578760 (=> (not res!1078700) (not e!880607))))

(declare-fun from!2937 () (_ BitVec 32))

(declare-datatypes ((array!105795 0))(
  ( (array!105796 (arr!51006 (Array (_ BitVec 32) (_ BitVec 64))) (size!51556 (_ BitVec 32))) )
))
(declare-fun a!3559 () array!105795)

(assert (=> b!1578760 (= res!1078700 (and (bvsgt from!2937 #b00000000000000000000000000000000) (bvslt (bvsub from!2937 #b00000000000000000000000000000001) (size!51556 a!3559))))))

(declare-fun res!1078701 () Bool)

(assert (=> start!136806 (=> (not res!1078701) (not e!880607))))

(assert (=> start!136806 (= res!1078701 (and (bvsge from!2937 #b00000000000000000000000000000000) (bvslt from!2937 (size!51556 a!3559)) (bvslt (size!51556 a!3559) #b01111111111111111111111111111111)))))

(assert (=> start!136806 e!880607))

(assert (=> start!136806 true))

(declare-fun array_inv!39733 (array!105795) Bool)

(assert (=> start!136806 (array_inv!39733 a!3559)))

(declare-fun b!1578762 () Bool)

(assert (=> b!1578762 (= e!880607 (bvsge (bvsub from!2937 #b00000000000000000000000000000001) from!2937))))

(declare-fun b!1578759 () Bool)

(declare-fun res!1078698 () Bool)

(assert (=> b!1578759 (=> (not res!1078698) (not e!880607))))

(declare-fun k!2792 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!105795 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1578759 (= res!1078698 (arrayContainsKey!0 a!3559 k!2792 from!2937))))

(declare-fun b!1578761 () Bool)

(declare-fun res!1078699 () Bool)

(assert (=> b!1578761 (=> (not res!1078699) (not e!880607))))

(assert (=> b!1578761 (= res!1078699 (arrayContainsKey!0 a!3559 k!2792 (bvsub from!2937 #b00000000000000000000000000000001)))))

(assert (= (and start!136806 res!1078701) b!1578759))

(assert (= (and b!1578759 res!1078698) b!1578760))

(assert (= (and b!1578760 res!1078700) b!1578761))

(assert (= (and b!1578761 res!1078699) b!1578762))

(declare-fun m!1450789 () Bool)

(assert (=> start!136806 m!1450789))

(declare-fun m!1450791 () Bool)

(assert (=> b!1578759 m!1450791))

(declare-fun m!1450793 () Bool)

(assert (=> b!1578761 m!1450793))

(push 1)

(assert (not b!1578761))

(assert (not start!136806))

(assert (not b!1578759))

(check-sat)

(pop 1)

(push 1)

(check-sat)

