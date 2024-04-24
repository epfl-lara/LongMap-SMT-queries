; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117068 () Bool)

(assert start!117068)

(declare-fun res!920229 () Bool)

(declare-fun e!780752 () Bool)

(assert (=> start!117068 (=> (not res!920229) (not e!780752))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93623 0))(
  ( (array!93624 (arr!45210 (Array (_ BitVec 32) (_ BitVec 64))) (size!45761 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93623)

(assert (=> start!117068 (= res!920229 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45761 a!4032))))))

(assert (=> start!117068 e!780752))

(assert (=> start!117068 true))

(declare-fun array_inv!34491 (array!93623) Bool)

(assert (=> start!117068 (array_inv!34491 a!4032)))

(declare-fun b!1378132 () Bool)

(declare-fun e!780751 () Bool)

(declare-fun e!780753 () Bool)

(assert (=> b!1378132 (= e!780751 (not e!780753))))

(declare-fun res!920227 () Bool)

(assert (=> b!1378132 (=> (not res!920227) (not e!780753))))

(declare-fun to!206 () (_ BitVec 32))

(assert (=> b!1378132 (= res!920227 (and (bvsge (bvadd #b00000000000000000000000000000001 i!1445) #b00000000000000000000000000000000) (bvslt to!206 (size!45761 a!4032))))))

(declare-fun lt!605873 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93623 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378132 (= (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) lt!605873)))

(declare-datatypes ((Unit!45570 0))(
  ( (Unit!45571) )
))
(declare-fun lt!605872 () Unit!45570)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93623 (_ BitVec 32) (_ BitVec 32)) Unit!45570)

(assert (=> b!1378132 (= lt!605872 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1378133 () Bool)

(declare-fun res!920228 () Bool)

(assert (=> b!1378133 (=> (not res!920228) (not e!780752))))

(assert (=> b!1378133 (= res!920228 (and (bvslt (size!45761 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45761 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun k!2947 () (_ BitVec 64))

(declare-fun b!1378134 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378134 (= e!780753 (not (validKeyInArray!0 (select (store (arr!45210 a!4032) i!1445 k!2947) to!206))))))

(declare-fun b!1378135 () Bool)

(assert (=> b!1378135 (= e!780752 e!780751)))

(declare-fun res!920224 () Bool)

(assert (=> b!1378135 (=> (not res!920224) (not e!780751))))

(declare-fun lt!605874 () (_ BitVec 32))

(assert (=> b!1378135 (= res!920224 (and (= lt!605874 lt!605873) (not (= to!206 (size!45761 a!4032)))))))

(assert (=> b!1378135 (= lt!605873 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1378135 (= lt!605874 (arrayCountValidKeys!0 (array!93624 (store (arr!45210 a!4032) i!1445 k!2947) (size!45761 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1378136 () Bool)

(declare-fun res!920225 () Bool)

(assert (=> b!1378136 (=> (not res!920225) (not e!780752))))

(assert (=> b!1378136 (= res!920225 (validKeyInArray!0 (select (arr!45210 a!4032) i!1445)))))

(declare-fun b!1378137 () Bool)

(declare-fun res!920226 () Bool)

(assert (=> b!1378137 (=> (not res!920226) (not e!780752))))

(assert (=> b!1378137 (= res!920226 (not (validKeyInArray!0 k!2947)))))

(declare-fun b!1378138 () Bool)

(declare-fun res!920223 () Bool)

(assert (=> b!1378138 (=> (not res!920223) (not e!780751))))

(assert (=> b!1378138 (= res!920223 (not (validKeyInArray!0 (select (arr!45210 a!4032) to!206))))))

(assert (= (and start!117068 res!920229) b!1378136))

(assert (= (and b!1378136 res!920225) b!1378137))

(assert (= (and b!1378137 res!920226) b!1378133))

(assert (= (and b!1378133 res!920228) b!1378135))

(assert (= (and b!1378135 res!920224) b!1378138))

(assert (= (and b!1378138 res!920223) b!1378132))

(assert (= (and b!1378132 res!920227) b!1378134))

(declare-fun m!1262545 () Bool)

(assert (=> b!1378135 m!1262545))

(declare-fun m!1262547 () Bool)

(assert (=> b!1378135 m!1262547))

(declare-fun m!1262549 () Bool)

(assert (=> b!1378135 m!1262549))

(declare-fun m!1262551 () Bool)

(assert (=> start!117068 m!1262551))

(declare-fun m!1262553 () Bool)

(assert (=> b!1378132 m!1262553))

(declare-fun m!1262555 () Bool)

(assert (=> b!1378132 m!1262555))

(declare-fun m!1262557 () Bool)

(assert (=> b!1378137 m!1262557))

(declare-fun m!1262559 () Bool)

(assert (=> b!1378138 m!1262559))

(assert (=> b!1378138 m!1262559))

(declare-fun m!1262561 () Bool)

(assert (=> b!1378138 m!1262561))

(assert (=> b!1378134 m!1262547))

(declare-fun m!1262563 () Bool)

(assert (=> b!1378134 m!1262563))

(assert (=> b!1378134 m!1262563))

(declare-fun m!1262565 () Bool)

(assert (=> b!1378134 m!1262565))

(declare-fun m!1262567 () Bool)

(assert (=> b!1378136 m!1262567))

(assert (=> b!1378136 m!1262567))

(declare-fun m!1262569 () Bool)

(assert (=> b!1378136 m!1262569))

(push 1)

(assert (not b!1378132))

(assert (not b!1378137))

(assert (not b!1378136))

(assert (not b!1378138))

(assert (not b!1378134))

(assert (not start!117068))

(assert (not b!1378135))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

