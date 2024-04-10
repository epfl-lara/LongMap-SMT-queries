; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136814 () Bool)

(assert start!136814)

(declare-fun res!1078746 () Bool)

(declare-fun e!880630 () Bool)

(assert (=> start!136814 (=> (not res!1078746) (not e!880630))))

(declare-fun from!2937 () (_ BitVec 32))

(declare-datatypes ((array!105803 0))(
  ( (array!105804 (arr!51010 (Array (_ BitVec 32) (_ BitVec 64))) (size!51560 (_ BitVec 32))) )
))
(declare-fun a!3559 () array!105803)

(assert (=> start!136814 (= res!1078746 (and (bvsge from!2937 #b00000000000000000000000000000000) (bvslt from!2937 (size!51560 a!3559)) (bvslt (size!51560 a!3559) #b01111111111111111111111111111111)))))

(assert (=> start!136814 e!880630))

(assert (=> start!136814 true))

(declare-fun array_inv!39737 (array!105803) Bool)

(assert (=> start!136814 (array_inv!39737 a!3559)))

(declare-fun b!1578805 () Bool)

(declare-fun res!1078744 () Bool)

(assert (=> b!1578805 (=> (not res!1078744) (not e!880630))))

(declare-fun k!2792 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!105803 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1578805 (= res!1078744 (arrayContainsKey!0 a!3559 k!2792 from!2937))))

(declare-fun b!1578806 () Bool)

(declare-fun res!1078745 () Bool)

(assert (=> b!1578806 (=> (not res!1078745) (not e!880630))))

(assert (=> b!1578806 (= res!1078745 (bvsle from!2937 #b00000000000000000000000000000000))))

(declare-fun b!1578807 () Bool)

(assert (=> b!1578807 (= e!880630 (not (arrayContainsKey!0 a!3559 k!2792 #b00000000000000000000000000000000)))))

(assert (= (and start!136814 res!1078746) b!1578805))

(assert (= (and b!1578805 res!1078744) b!1578806))

(assert (= (and b!1578806 res!1078745) b!1578807))

(declare-fun m!1450825 () Bool)

(assert (=> start!136814 m!1450825))

(declare-fun m!1450827 () Bool)

(assert (=> b!1578805 m!1450827))

(declare-fun m!1450829 () Bool)

(assert (=> b!1578807 m!1450829))

(push 1)

(assert (not start!136814))

(assert (not b!1578805))

(assert (not b!1578807))

(check-sat)

(pop 1)

