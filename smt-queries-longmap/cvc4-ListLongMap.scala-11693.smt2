; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136770 () Bool)

(assert start!136770)

(declare-fun b!1578637 () Bool)

(declare-fun res!1078578 () Bool)

(declare-fun e!880511 () Bool)

(assert (=> b!1578637 (=> (not res!1078578) (not e!880511))))

(declare-fun from!2937 () (_ BitVec 32))

(declare-datatypes ((array!105768 0))(
  ( (array!105769 (arr!50994 (Array (_ BitVec 32) (_ BitVec 64))) (size!51544 (_ BitVec 32))) )
))
(declare-fun a!3559 () array!105768)

(assert (=> b!1578637 (= res!1078578 (and (bvsgt from!2937 #b00000000000000000000000000000000) (bvslt (bvsub from!2937 #b00000000000000000000000000000001) (size!51544 a!3559))))))

(declare-fun b!1578639 () Bool)

(assert (=> b!1578639 (= e!880511 (not true))))

(declare-fun k!2792 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!105768 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1578639 (arrayContainsKey!0 a!3559 k!2792 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!52190 0))(
  ( (Unit!52191) )
))
(declare-fun lt!676321 () Unit!52190)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105768 (_ BitVec 64) (_ BitVec 32)) Unit!52190)

(assert (=> b!1578639 (= lt!676321 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3559 k!2792 (bvsub from!2937 #b00000000000000000000000000000001)))))

(declare-fun b!1578638 () Bool)

(declare-fun res!1078575 () Bool)

(assert (=> b!1578638 (=> (not res!1078575) (not e!880511))))

(assert (=> b!1578638 (= res!1078575 (arrayContainsKey!0 a!3559 k!2792 (bvsub from!2937 #b00000000000000000000000000000001)))))

(declare-fun res!1078576 () Bool)

(assert (=> start!136770 (=> (not res!1078576) (not e!880511))))

(assert (=> start!136770 (= res!1078576 (and (bvsge from!2937 #b00000000000000000000000000000000) (bvslt from!2937 (size!51544 a!3559)) (bvslt (size!51544 a!3559) #b01111111111111111111111111111111)))))

(assert (=> start!136770 e!880511))

(assert (=> start!136770 true))

(declare-fun array_inv!39721 (array!105768) Bool)

(assert (=> start!136770 (array_inv!39721 a!3559)))

(declare-fun b!1578636 () Bool)

(declare-fun res!1078577 () Bool)

(assert (=> b!1578636 (=> (not res!1078577) (not e!880511))))

(assert (=> b!1578636 (= res!1078577 (arrayContainsKey!0 a!3559 k!2792 from!2937))))

(assert (= (and start!136770 res!1078576) b!1578636))

(assert (= (and b!1578636 res!1078577) b!1578637))

(assert (= (and b!1578637 res!1078578) b!1578638))

(assert (= (and b!1578638 res!1078575) b!1578639))

(declare-fun m!1450701 () Bool)

(assert (=> b!1578639 m!1450701))

(declare-fun m!1450703 () Bool)

(assert (=> b!1578639 m!1450703))

(declare-fun m!1450705 () Bool)

(assert (=> b!1578638 m!1450705))

(declare-fun m!1450707 () Bool)

(assert (=> start!136770 m!1450707))

(declare-fun m!1450709 () Bool)

(assert (=> b!1578636 m!1450709))

(push 1)

(assert (not start!136770))

(assert (not b!1578638))

(assert (not b!1578639))

(assert (not b!1578636))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

