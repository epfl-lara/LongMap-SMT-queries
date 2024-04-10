; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116834 () Bool)

(assert start!116834)

(declare-fun b!1376776 () Bool)

(declare-fun res!919664 () Bool)

(declare-fun e!779878 () Bool)

(assert (=> b!1376776 (=> (not res!919664) (not e!779878))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93503 0))(
  ( (array!93504 (arr!45155 (Array (_ BitVec 32) (_ BitVec 64))) (size!45705 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93503)

(assert (=> b!1376776 (= res!919664 (and (bvslt (size!45705 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45705 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1376777 () Bool)

(declare-fun res!919660 () Bool)

(assert (=> b!1376777 (=> (not res!919660) (not e!779878))))

(declare-fun k!2947 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376777 (= res!919660 (not (validKeyInArray!0 k!2947)))))

(declare-fun b!1376778 () Bool)

(declare-fun e!779876 () Bool)

(assert (=> b!1376778 (= e!779878 e!779876)))

(declare-fun res!919663 () Bool)

(assert (=> b!1376778 (=> (not res!919663) (not e!779876))))

(declare-fun lt!605372 () (_ BitVec 32))

(declare-fun lt!605374 () (_ BitVec 32))

(assert (=> b!1376778 (= res!919663 (and (= lt!605372 lt!605374) (not (= to!206 (size!45705 a!4032)))))))

(declare-fun arrayCountValidKeys!0 (array!93503 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376778 (= lt!605374 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376778 (= lt!605372 (arrayCountValidKeys!0 (array!93504 (store (arr!45155 a!4032) i!1445 k!2947) (size!45705 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1376779 () Bool)

(declare-fun e!779877 () Bool)

(assert (=> b!1376779 (= e!779876 (not e!779877))))

(declare-fun res!919661 () Bool)

(assert (=> b!1376779 (=> (not res!919661) (not e!779877))))

(assert (=> b!1376779 (= res!919661 (and (bvsge (bvadd #b00000000000000000000000000000001 i!1445) #b00000000000000000000000000000000) (bvslt to!206 (size!45705 a!4032))))))

(assert (=> b!1376779 (= (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) lt!605374)))

(declare-datatypes ((Unit!45627 0))(
  ( (Unit!45628) )
))
(declare-fun lt!605373 () Unit!45627)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93503 (_ BitVec 32) (_ BitVec 32)) Unit!45627)

(assert (=> b!1376779 (= lt!605373 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun res!919666 () Bool)

(assert (=> start!116834 (=> (not res!919666) (not e!779878))))

(assert (=> start!116834 (= res!919666 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45705 a!4032))))))

(assert (=> start!116834 e!779878))

(assert (=> start!116834 true))

(declare-fun array_inv!34183 (array!93503) Bool)

(assert (=> start!116834 (array_inv!34183 a!4032)))

(declare-fun b!1376780 () Bool)

(declare-fun res!919662 () Bool)

(assert (=> b!1376780 (=> (not res!919662) (not e!779876))))

(assert (=> b!1376780 (= res!919662 (not (validKeyInArray!0 (select (arr!45155 a!4032) to!206))))))

(declare-fun b!1376781 () Bool)

(declare-fun res!919665 () Bool)

(assert (=> b!1376781 (=> (not res!919665) (not e!779878))))

(assert (=> b!1376781 (= res!919665 (validKeyInArray!0 (select (arr!45155 a!4032) i!1445)))))

(declare-fun b!1376782 () Bool)

(assert (=> b!1376782 (= e!779877 (not (validKeyInArray!0 (select (store (arr!45155 a!4032) i!1445 k!2947) to!206))))))

(assert (= (and start!116834 res!919666) b!1376781))

(assert (= (and b!1376781 res!919665) b!1376777))

(assert (= (and b!1376777 res!919660) b!1376776))

(assert (= (and b!1376776 res!919664) b!1376778))

(assert (= (and b!1376778 res!919663) b!1376780))

(assert (= (and b!1376780 res!919662) b!1376779))

(assert (= (and b!1376779 res!919661) b!1376782))

(declare-fun m!1260853 () Bool)

(assert (=> b!1376777 m!1260853))

(declare-fun m!1260855 () Bool)

(assert (=> b!1376779 m!1260855))

(declare-fun m!1260857 () Bool)

(assert (=> b!1376779 m!1260857))

(declare-fun m!1260859 () Bool)

(assert (=> b!1376781 m!1260859))

(assert (=> b!1376781 m!1260859))

(declare-fun m!1260861 () Bool)

(assert (=> b!1376781 m!1260861))

(declare-fun m!1260863 () Bool)

(assert (=> b!1376778 m!1260863))

(declare-fun m!1260865 () Bool)

(assert (=> b!1376778 m!1260865))

(declare-fun m!1260867 () Bool)

(assert (=> b!1376778 m!1260867))

(declare-fun m!1260869 () Bool)

(assert (=> start!116834 m!1260869))

(declare-fun m!1260871 () Bool)

(assert (=> b!1376780 m!1260871))

(assert (=> b!1376780 m!1260871))

(declare-fun m!1260873 () Bool)

(assert (=> b!1376780 m!1260873))

(assert (=> b!1376782 m!1260865))

(declare-fun m!1260875 () Bool)

(assert (=> b!1376782 m!1260875))

(assert (=> b!1376782 m!1260875))

(declare-fun m!1260877 () Bool)

(assert (=> b!1376782 m!1260877))

(push 1)

(assert (not b!1376781))

(assert (not b!1376778))

(assert (not b!1376782))

(assert (not b!1376779))

(assert (not b!1376780))

(assert (not b!1376777))

(assert (not start!116834))

(check-sat)

(pop 1)

(push 1)

(check-sat)

