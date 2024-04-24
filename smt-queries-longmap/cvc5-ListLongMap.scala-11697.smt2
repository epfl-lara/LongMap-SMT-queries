; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137220 () Bool)

(assert start!137220)

(declare-fun res!1079527 () Bool)

(declare-fun e!882091 () Bool)

(assert (=> start!137220 (=> (not res!1079527) (not e!882091))))

(declare-fun from!2937 () (_ BitVec 32))

(declare-datatypes ((array!105918 0))(
  ( (array!105919 (arr!51060 (Array (_ BitVec 32) (_ BitVec 64))) (size!51611 (_ BitVec 32))) )
))
(declare-fun a!3559 () array!105918)

(assert (=> start!137220 (= res!1079527 (and (bvsge from!2937 #b00000000000000000000000000000000) (bvslt from!2937 (size!51611 a!3559)) (bvslt (size!51611 a!3559) #b01111111111111111111111111111111)))))

(assert (=> start!137220 e!882091))

(assert (=> start!137220 true))

(declare-fun array_inv!40015 (array!105918) Bool)

(assert (=> start!137220 (array_inv!40015 a!3559)))

(declare-fun b!1581164 () Bool)

(declare-fun res!1079528 () Bool)

(assert (=> b!1581164 (=> (not res!1079528) (not e!882091))))

(declare-fun k!2792 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!105918 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1581164 (= res!1079528 (arrayContainsKey!0 a!3559 k!2792 from!2937))))

(declare-fun b!1581165 () Bool)

(assert (=> b!1581165 (= e!882091 (and (bvsgt from!2937 #b00000000000000000000000000000000) (bvsge (bvsub from!2937 #b00000000000000000000000000000001) (size!51611 a!3559))))))

(assert (= (and start!137220 res!1079527) b!1581164))

(assert (= (and b!1581164 res!1079528) b!1581165))

(declare-fun m!1453043 () Bool)

(assert (=> start!137220 m!1453043))

(declare-fun m!1453045 () Bool)

(assert (=> b!1581164 m!1453045))

(push 1)

(assert (not b!1581164))

(assert (not start!137220))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

