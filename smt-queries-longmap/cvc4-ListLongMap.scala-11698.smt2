; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136812 () Bool)

(assert start!136812)

(declare-fun res!1078734 () Bool)

(declare-fun e!880625 () Bool)

(assert (=> start!136812 (=> (not res!1078734) (not e!880625))))

(declare-fun from!2937 () (_ BitVec 32))

(declare-datatypes ((array!105801 0))(
  ( (array!105802 (arr!51009 (Array (_ BitVec 32) (_ BitVec 64))) (size!51559 (_ BitVec 32))) )
))
(declare-fun a!3559 () array!105801)

(assert (=> start!136812 (= res!1078734 (and (bvsge from!2937 #b00000000000000000000000000000000) (bvslt from!2937 (size!51559 a!3559)) (bvslt (size!51559 a!3559) #b01111111111111111111111111111111)))))

(assert (=> start!136812 e!880625))

(assert (=> start!136812 true))

(declare-fun array_inv!39736 (array!105801) Bool)

(assert (=> start!136812 (array_inv!39736 a!3559)))

(declare-fun b!1578798 () Bool)

(assert (=> b!1578798 (= e!880625 (not true))))

(declare-fun k!2792 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!105801 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1578798 (arrayContainsKey!0 a!3559 k!2792 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!52196 0))(
  ( (Unit!52197) )
))
(declare-fun lt!676330 () Unit!52196)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105801 (_ BitVec 64) (_ BitVec 32)) Unit!52196)

(assert (=> b!1578798 (= lt!676330 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3559 k!2792 (bvsub from!2937 #b00000000000000000000000000000001)))))

(declare-fun b!1578797 () Bool)

(declare-fun res!1078736 () Bool)

(assert (=> b!1578797 (=> (not res!1078736) (not e!880625))))

(assert (=> b!1578797 (= res!1078736 (arrayContainsKey!0 a!3559 k!2792 (bvsub from!2937 #b00000000000000000000000000000001)))))

(declare-fun b!1578796 () Bool)

(declare-fun res!1078735 () Bool)

(assert (=> b!1578796 (=> (not res!1078735) (not e!880625))))

(assert (=> b!1578796 (= res!1078735 (and (bvsgt from!2937 #b00000000000000000000000000000000) (bvslt (bvsub from!2937 #b00000000000000000000000000000001) (size!51559 a!3559))))))

(declare-fun b!1578795 () Bool)

(declare-fun res!1078737 () Bool)

(assert (=> b!1578795 (=> (not res!1078737) (not e!880625))))

(assert (=> b!1578795 (= res!1078737 (arrayContainsKey!0 a!3559 k!2792 from!2937))))

(assert (= (and start!136812 res!1078734) b!1578795))

(assert (= (and b!1578795 res!1078737) b!1578796))

(assert (= (and b!1578796 res!1078735) b!1578797))

(assert (= (and b!1578797 res!1078736) b!1578798))

(declare-fun m!1450815 () Bool)

(assert (=> start!136812 m!1450815))

(declare-fun m!1450817 () Bool)

(assert (=> b!1578798 m!1450817))

(declare-fun m!1450819 () Bool)

(assert (=> b!1578798 m!1450819))

(declare-fun m!1450821 () Bool)

(assert (=> b!1578797 m!1450821))

(declare-fun m!1450823 () Bool)

(assert (=> b!1578795 m!1450823))

(push 1)

(assert (not b!1578795))

(assert (not start!136812))

(assert (not b!1578797))

(assert (not b!1578798))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

