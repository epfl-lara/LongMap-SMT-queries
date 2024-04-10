; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116904 () Bool)

(assert start!116904)

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93573 0))(
  ( (array!93574 (arr!45190 (Array (_ BitVec 32) (_ BitVec 64))) (size!45740 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93573)

(declare-fun lt!606085 () array!93573)

(declare-fun b!1377539 () Bool)

(declare-fun e!780305 () Bool)

(declare-fun arrayCountValidKeys!0 (array!93573 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377539 (= e!780305 (not (= (arrayCountValidKeys!0 lt!606085 (bvadd #b00000000000000000000000000000001 i!1445) (size!45740 a!4032)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (size!45740 a!4032)))))))

(declare-fun b!1377540 () Bool)

(declare-fun res!920266 () Bool)

(declare-fun e!780307 () Bool)

(assert (=> b!1377540 (=> (not res!920266) (not e!780307))))

(declare-fun k!2947 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377540 (= res!920266 (not (validKeyInArray!0 k!2947)))))

(declare-fun b!1377541 () Bool)

(declare-fun res!920261 () Bool)

(assert (=> b!1377541 (=> (not res!920261) (not e!780305))))

(declare-fun to!206 () (_ BitVec 32))

(assert (=> b!1377541 (= res!920261 (= to!206 (size!45740 a!4032)))))

(declare-fun b!1377542 () Bool)

(declare-fun res!920263 () Bool)

(assert (=> b!1377542 (=> (not res!920263) (not e!780307))))

(assert (=> b!1377542 (= res!920263 (and (bvslt (size!45740 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45740 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1377543 () Bool)

(declare-fun res!920265 () Bool)

(assert (=> b!1377543 (=> (not res!920265) (not e!780307))))

(assert (=> b!1377543 (= res!920265 (validKeyInArray!0 (select (arr!45190 a!4032) i!1445)))))

(declare-fun b!1377544 () Bool)

(assert (=> b!1377544 (= e!780307 e!780305)))

(declare-fun res!920264 () Bool)

(assert (=> b!1377544 (=> (not res!920264) (not e!780305))))

(assert (=> b!1377544 (= res!920264 (= (arrayCountValidKeys!0 lt!606085 (bvadd #b00000000000000000000000000000001 i!1445) to!206) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206)))))

(assert (=> b!1377544 (= lt!606085 (array!93574 (store (arr!45190 a!4032) i!1445 k!2947) (size!45740 a!4032)))))

(declare-fun res!920262 () Bool)

(assert (=> start!116904 (=> (not res!920262) (not e!780307))))

(assert (=> start!116904 (= res!920262 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45740 a!4032))))))

(assert (=> start!116904 e!780307))

(assert (=> start!116904 true))

(declare-fun array_inv!34218 (array!93573) Bool)

(assert (=> start!116904 (array_inv!34218 a!4032)))

(assert (= (and start!116904 res!920262) b!1377543))

(assert (= (and b!1377543 res!920265) b!1377540))

(assert (= (and b!1377540 res!920266) b!1377542))

(assert (= (and b!1377542 res!920263) b!1377544))

(assert (= (and b!1377544 res!920264) b!1377541))

(assert (= (and b!1377541 res!920261) b!1377539))

(declare-fun m!1261859 () Bool)

(assert (=> b!1377543 m!1261859))

(assert (=> b!1377543 m!1261859))

(declare-fun m!1261861 () Bool)

(assert (=> b!1377543 m!1261861))

(declare-fun m!1261863 () Bool)

(assert (=> b!1377544 m!1261863))

(declare-fun m!1261865 () Bool)

(assert (=> b!1377544 m!1261865))

(declare-fun m!1261867 () Bool)

(assert (=> b!1377544 m!1261867))

(declare-fun m!1261869 () Bool)

(assert (=> b!1377540 m!1261869))

(declare-fun m!1261871 () Bool)

(assert (=> b!1377539 m!1261871))

(declare-fun m!1261873 () Bool)

(assert (=> b!1377539 m!1261873))

(declare-fun m!1261875 () Bool)

(assert (=> start!116904 m!1261875))

(push 1)

(assert (not b!1377540))

(assert (not b!1377543))

(assert (not start!116904))

(assert (not b!1377539))

(assert (not b!1377544))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

