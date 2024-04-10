; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136754 () Bool)

(assert start!136754)

(declare-fun b!1578540 () Bool)

(declare-fun res!1078480 () Bool)

(declare-fun e!880463 () Bool)

(assert (=> b!1578540 (=> (not res!1078480) (not e!880463))))

(declare-fun k!2792 () (_ BitVec 64))

(declare-fun from!2937 () (_ BitVec 32))

(declare-datatypes ((array!105752 0))(
  ( (array!105753 (arr!50986 (Array (_ BitVec 32) (_ BitVec 64))) (size!51536 (_ BitVec 32))) )
))
(declare-fun a!3559 () array!105752)

(declare-fun arrayContainsKey!0 (array!105752 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1578540 (= res!1078480 (arrayContainsKey!0 a!3559 k!2792 from!2937))))

(declare-fun b!1578543 () Bool)

(assert (=> b!1578543 (= e!880463 (not true))))

(assert (=> b!1578543 (arrayContainsKey!0 a!3559 k!2792 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!52174 0))(
  ( (Unit!52175) )
))
(declare-fun lt!676297 () Unit!52174)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105752 (_ BitVec 64) (_ BitVec 32)) Unit!52174)

(assert (=> b!1578543 (= lt!676297 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3559 k!2792 (bvsub from!2937 #b00000000000000000000000000000001)))))

(declare-fun b!1578541 () Bool)

(declare-fun res!1078479 () Bool)

(assert (=> b!1578541 (=> (not res!1078479) (not e!880463))))

(assert (=> b!1578541 (= res!1078479 (and (bvsgt from!2937 #b00000000000000000000000000000000) (bvslt (bvsub from!2937 #b00000000000000000000000000000001) (size!51536 a!3559))))))

(declare-fun res!1078481 () Bool)

(assert (=> start!136754 (=> (not res!1078481) (not e!880463))))

(assert (=> start!136754 (= res!1078481 (and (bvsge from!2937 #b00000000000000000000000000000000) (bvslt from!2937 (size!51536 a!3559)) (bvslt (size!51536 a!3559) #b01111111111111111111111111111111)))))

(assert (=> start!136754 e!880463))

(assert (=> start!136754 true))

(declare-fun array_inv!39713 (array!105752) Bool)

(assert (=> start!136754 (array_inv!39713 a!3559)))

(declare-fun b!1578542 () Bool)

(declare-fun res!1078482 () Bool)

(assert (=> b!1578542 (=> (not res!1078482) (not e!880463))))

(assert (=> b!1578542 (= res!1078482 (arrayContainsKey!0 a!3559 k!2792 (bvsub from!2937 #b00000000000000000000000000000001)))))

(assert (= (and start!136754 res!1078481) b!1578540))

(assert (= (and b!1578540 res!1078480) b!1578541))

(assert (= (and b!1578541 res!1078479) b!1578542))

(assert (= (and b!1578542 res!1078482) b!1578543))

(declare-fun m!1450621 () Bool)

(assert (=> b!1578540 m!1450621))

(declare-fun m!1450623 () Bool)

(assert (=> b!1578543 m!1450623))

(declare-fun m!1450625 () Bool)

(assert (=> b!1578543 m!1450625))

(declare-fun m!1450627 () Bool)

(assert (=> start!136754 m!1450627))

(declare-fun m!1450629 () Bool)

(assert (=> b!1578542 m!1450629))

(push 1)

(assert (not b!1578543))

(assert (not b!1578540))

(assert (not start!136754))

(assert (not b!1578542))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

