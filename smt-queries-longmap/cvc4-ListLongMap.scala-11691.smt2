; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136758 () Bool)

(assert start!136758)

(declare-fun b!1578564 () Bool)

(declare-fun res!1078504 () Bool)

(declare-fun e!880474 () Bool)

(assert (=> b!1578564 (=> (not res!1078504) (not e!880474))))

(declare-fun k!2792 () (_ BitVec 64))

(declare-fun from!2937 () (_ BitVec 32))

(declare-datatypes ((array!105756 0))(
  ( (array!105757 (arr!50988 (Array (_ BitVec 32) (_ BitVec 64))) (size!51538 (_ BitVec 32))) )
))
(declare-fun a!3559 () array!105756)

(declare-fun arrayContainsKey!0 (array!105756 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1578564 (= res!1078504 (arrayContainsKey!0 a!3559 k!2792 from!2937))))

(declare-fun res!1078506 () Bool)

(assert (=> start!136758 (=> (not res!1078506) (not e!880474))))

(assert (=> start!136758 (= res!1078506 (and (bvsge from!2937 #b00000000000000000000000000000000) (bvslt from!2937 (size!51538 a!3559)) (bvslt (size!51538 a!3559) #b01111111111111111111111111111111)))))

(assert (=> start!136758 e!880474))

(assert (=> start!136758 true))

(declare-fun array_inv!39715 (array!105756) Bool)

(assert (=> start!136758 (array_inv!39715 a!3559)))

(declare-fun b!1578566 () Bool)

(declare-fun res!1078505 () Bool)

(assert (=> b!1578566 (=> (not res!1078505) (not e!880474))))

(assert (=> b!1578566 (= res!1078505 (arrayContainsKey!0 a!3559 k!2792 (bvsub from!2937 #b00000000000000000000000000000001)))))

(declare-fun b!1578567 () Bool)

(assert (=> b!1578567 (= e!880474 (not true))))

(assert (=> b!1578567 (arrayContainsKey!0 a!3559 k!2792 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!52178 0))(
  ( (Unit!52179) )
))
(declare-fun lt!676303 () Unit!52178)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105756 (_ BitVec 64) (_ BitVec 32)) Unit!52178)

(assert (=> b!1578567 (= lt!676303 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3559 k!2792 (bvsub from!2937 #b00000000000000000000000000000001)))))

(declare-fun b!1578565 () Bool)

(declare-fun res!1078503 () Bool)

(assert (=> b!1578565 (=> (not res!1078503) (not e!880474))))

(assert (=> b!1578565 (= res!1078503 (and (bvsgt from!2937 #b00000000000000000000000000000000) (bvslt (bvsub from!2937 #b00000000000000000000000000000001) (size!51538 a!3559))))))

(assert (= (and start!136758 res!1078506) b!1578564))

(assert (= (and b!1578564 res!1078504) b!1578565))

(assert (= (and b!1578565 res!1078503) b!1578566))

(assert (= (and b!1578566 res!1078505) b!1578567))

(declare-fun m!1450641 () Bool)

(assert (=> b!1578564 m!1450641))

(declare-fun m!1450643 () Bool)

(assert (=> start!136758 m!1450643))

(declare-fun m!1450645 () Bool)

(assert (=> b!1578566 m!1450645))

(declare-fun m!1450647 () Bool)

(assert (=> b!1578567 m!1450647))

(declare-fun m!1450649 () Bool)

(assert (=> b!1578567 m!1450649))

(push 1)

(assert (not b!1578564))

(assert (not b!1578566))

(assert (not start!136758))

(assert (not b!1578567))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

