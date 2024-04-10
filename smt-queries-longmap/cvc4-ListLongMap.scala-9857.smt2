; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116832 () Bool)

(assert start!116832)

(declare-fun b!1376756 () Bool)

(declare-fun e!779866 () Bool)

(assert (=> b!1376756 (= e!779866 (not true))))

(declare-fun lt!605363 () (_ BitVec 32))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93501 0))(
  ( (array!93502 (arr!45154 (Array (_ BitVec 32) (_ BitVec 64))) (size!45704 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93501)

(declare-fun arrayCountValidKeys!0 (array!93501 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376756 (= (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) lt!605363)))

(declare-datatypes ((Unit!45625 0))(
  ( (Unit!45626) )
))
(declare-fun lt!605364 () Unit!45625)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93501 (_ BitVec 32) (_ BitVec 32)) Unit!45625)

(assert (=> b!1376756 (= lt!605364 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1376757 () Bool)

(declare-fun res!919643 () Bool)

(assert (=> b!1376757 (=> (not res!919643) (not e!779866))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376757 (= res!919643 (not (validKeyInArray!0 (select (arr!45154 a!4032) to!206))))))

(declare-fun b!1376758 () Bool)

(declare-fun e!779864 () Bool)

(assert (=> b!1376758 (= e!779864 e!779866)))

(declare-fun res!919645 () Bool)

(assert (=> b!1376758 (=> (not res!919645) (not e!779866))))

(declare-fun lt!605365 () (_ BitVec 32))

(assert (=> b!1376758 (= res!919645 (and (= lt!605365 lt!605363) (not (= to!206 (size!45704 a!4032)))))))

(assert (=> b!1376758 (= lt!605363 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k!2947 () (_ BitVec 64))

(assert (=> b!1376758 (= lt!605365 (arrayCountValidKeys!0 (array!93502 (store (arr!45154 a!4032) i!1445 k!2947) (size!45704 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1376759 () Bool)

(declare-fun res!919640 () Bool)

(assert (=> b!1376759 (=> (not res!919640) (not e!779864))))

(assert (=> b!1376759 (= res!919640 (validKeyInArray!0 (select (arr!45154 a!4032) i!1445)))))

(declare-fun res!919642 () Bool)

(assert (=> start!116832 (=> (not res!919642) (not e!779864))))

(assert (=> start!116832 (= res!919642 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45704 a!4032))))))

(assert (=> start!116832 e!779864))

(assert (=> start!116832 true))

(declare-fun array_inv!34182 (array!93501) Bool)

(assert (=> start!116832 (array_inv!34182 a!4032)))

(declare-fun b!1376760 () Bool)

(declare-fun res!919644 () Bool)

(assert (=> b!1376760 (=> (not res!919644) (not e!779864))))

(assert (=> b!1376760 (= res!919644 (and (bvslt (size!45704 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45704 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1376761 () Bool)

(declare-fun res!919641 () Bool)

(assert (=> b!1376761 (=> (not res!919641) (not e!779864))))

(assert (=> b!1376761 (= res!919641 (not (validKeyInArray!0 k!2947)))))

(assert (= (and start!116832 res!919642) b!1376759))

(assert (= (and b!1376759 res!919640) b!1376761))

(assert (= (and b!1376761 res!919641) b!1376760))

(assert (= (and b!1376760 res!919644) b!1376758))

(assert (= (and b!1376758 res!919645) b!1376757))

(assert (= (and b!1376757 res!919643) b!1376756))

(declare-fun m!1260831 () Bool)

(assert (=> start!116832 m!1260831))

(declare-fun m!1260833 () Bool)

(assert (=> b!1376756 m!1260833))

(declare-fun m!1260835 () Bool)

(assert (=> b!1376756 m!1260835))

(declare-fun m!1260837 () Bool)

(assert (=> b!1376761 m!1260837))

(declare-fun m!1260839 () Bool)

(assert (=> b!1376759 m!1260839))

(assert (=> b!1376759 m!1260839))

(declare-fun m!1260841 () Bool)

(assert (=> b!1376759 m!1260841))

(declare-fun m!1260843 () Bool)

(assert (=> b!1376758 m!1260843))

(declare-fun m!1260845 () Bool)

(assert (=> b!1376758 m!1260845))

(declare-fun m!1260847 () Bool)

(assert (=> b!1376758 m!1260847))

(declare-fun m!1260849 () Bool)

(assert (=> b!1376757 m!1260849))

(assert (=> b!1376757 m!1260849))

(declare-fun m!1260851 () Bool)

(assert (=> b!1376757 m!1260851))

(push 1)

(assert (not start!116832))

(assert (not b!1376761))

(assert (not b!1376759))

(assert (not b!1376758))

(assert (not b!1376756))

(assert (not b!1376757))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

