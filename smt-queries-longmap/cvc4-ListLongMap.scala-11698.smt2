; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136776 () Bool)

(assert start!136776)

(declare-fun res!1078593 () Bool)

(declare-fun e!880420 () Bool)

(assert (=> start!136776 (=> (not res!1078593) (not e!880420))))

(declare-fun from!2937 () (_ BitVec 32))

(declare-datatypes ((array!105730 0))(
  ( (array!105731 (arr!50973 (Array (_ BitVec 32) (_ BitVec 64))) (size!51525 (_ BitVec 32))) )
))
(declare-fun a!3559 () array!105730)

(assert (=> start!136776 (= res!1078593 (and (bvsge from!2937 #b00000000000000000000000000000000) (bvslt from!2937 (size!51525 a!3559)) (bvslt (size!51525 a!3559) #b01111111111111111111111111111111)))))

(assert (=> start!136776 e!880420))

(assert (=> start!136776 true))

(declare-fun array_inv!39909 (array!105730) Bool)

(assert (=> start!136776 (array_inv!39909 a!3559)))

(declare-fun b!1578471 () Bool)

(declare-fun res!1078595 () Bool)

(assert (=> b!1578471 (=> (not res!1078595) (not e!880420))))

(assert (=> b!1578471 (= res!1078595 (and (bvsgt from!2937 #b00000000000000000000000000000000) (bvslt (bvsub from!2937 #b00000000000000000000000000000001) (size!51525 a!3559))))))

(declare-fun b!1578473 () Bool)

(assert (=> b!1578473 (= e!880420 (not true))))

(declare-fun k!2792 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!105730 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1578473 (arrayContainsKey!0 a!3559 k!2792 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!52003 0))(
  ( (Unit!52004) )
))
(declare-fun lt!676044 () Unit!52003)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105730 (_ BitVec 64) (_ BitVec 32)) Unit!52003)

(assert (=> b!1578473 (= lt!676044 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3559 k!2792 (bvsub from!2937 #b00000000000000000000000000000001)))))

(declare-fun b!1578470 () Bool)

(declare-fun res!1078596 () Bool)

(assert (=> b!1578470 (=> (not res!1078596) (not e!880420))))

(assert (=> b!1578470 (= res!1078596 (arrayContainsKey!0 a!3559 k!2792 from!2937))))

(declare-fun b!1578472 () Bool)

(declare-fun res!1078594 () Bool)

(assert (=> b!1578472 (=> (not res!1078594) (not e!880420))))

(assert (=> b!1578472 (= res!1078594 (arrayContainsKey!0 a!3559 k!2792 (bvsub from!2937 #b00000000000000000000000000000001)))))

(assert (= (and start!136776 res!1078593) b!1578470))

(assert (= (and b!1578470 res!1078596) b!1578471))

(assert (= (and b!1578471 res!1078595) b!1578472))

(assert (= (and b!1578472 res!1078594) b!1578473))

(declare-fun m!1449925 () Bool)

(assert (=> start!136776 m!1449925))

(declare-fun m!1449927 () Bool)

(assert (=> b!1578473 m!1449927))

(declare-fun m!1449929 () Bool)

(assert (=> b!1578473 m!1449929))

(declare-fun m!1449931 () Bool)

(assert (=> b!1578470 m!1449931))

(declare-fun m!1449933 () Bool)

(assert (=> b!1578472 m!1449933))

(push 1)

(assert (not b!1578473))

(assert (not start!136776))

(assert (not b!1578472))

(assert (not b!1578470))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

