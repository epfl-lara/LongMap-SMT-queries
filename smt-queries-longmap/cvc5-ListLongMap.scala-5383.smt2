; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71896 () Bool)

(assert start!71896)

(declare-fun b!835452 () Bool)

(declare-fun res!568323 () Bool)

(declare-fun e!466061 () Bool)

(assert (=> b!835452 (=> (not res!568323) (not e!466061))))

(declare-datatypes ((array!46806 0))(
  ( (array!46807 (arr!22437 (Array (_ BitVec 32) (_ BitVec 64))) (size!22858 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46806)

(declare-fun to!390 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835452 (= res!568323 (not (validKeyInArray!0 (select (arr!22437 a!4227) to!390))))))

(declare-fun b!835453 () Bool)

(declare-fun res!568327 () Bool)

(declare-fun e!466062 () Bool)

(assert (=> b!835453 (=> (not res!568327) (not e!466062))))

(declare-fun k!2968 () (_ BitVec 64))

(assert (=> b!835453 (= res!568327 (validKeyInArray!0 k!2968))))

(declare-fun b!835454 () Bool)

(declare-fun res!568324 () Bool)

(assert (=> b!835454 (=> (not res!568324) (not e!466062))))

(declare-fun i!1466 () (_ BitVec 32))

(assert (=> b!835454 (= res!568324 (not (validKeyInArray!0 (select (arr!22437 a!4227) i!1466))))))

(declare-fun b!835455 () Bool)

(assert (=> b!835455 (= e!466061 (not true))))

(declare-fun lt!379723 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46806 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!835455 (= (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) lt!379723)))

(declare-datatypes ((Unit!28719 0))(
  ( (Unit!28720) )
))
(declare-fun lt!379722 () Unit!28719)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46806 (_ BitVec 32) (_ BitVec 32)) Unit!28719)

(assert (=> b!835455 (= lt!379722 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun b!835457 () Bool)

(declare-fun res!568326 () Bool)

(assert (=> b!835457 (=> (not res!568326) (not e!466062))))

(assert (=> b!835457 (= res!568326 (and (bvslt (size!22858 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22858 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun res!568328 () Bool)

(assert (=> start!71896 (=> (not res!568328) (not e!466062))))

(assert (=> start!71896 (= res!568328 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22858 a!4227))))))

(assert (=> start!71896 e!466062))

(assert (=> start!71896 true))

(declare-fun array_inv!17884 (array!46806) Bool)

(assert (=> start!71896 (array_inv!17884 a!4227)))

(declare-fun b!835456 () Bool)

(assert (=> b!835456 (= e!466062 e!466061)))

(declare-fun res!568325 () Bool)

(assert (=> b!835456 (=> (not res!568325) (not e!466061))))

(declare-fun lt!379721 () (_ BitVec 32))

(assert (=> b!835456 (= res!568325 (and (= lt!379721 lt!379723) (not (= to!390 (size!22858 a!4227)))))))

(assert (=> b!835456 (= lt!379723 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835456 (= lt!379721 (arrayCountValidKeys!0 (array!46807 (store (arr!22437 a!4227) i!1466 k!2968) (size!22858 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (= (and start!71896 res!568328) b!835454))

(assert (= (and b!835454 res!568324) b!835453))

(assert (= (and b!835453 res!568327) b!835457))

(assert (= (and b!835457 res!568326) b!835456))

(assert (= (and b!835456 res!568325) b!835452))

(assert (= (and b!835452 res!568323) b!835455))

(declare-fun m!780621 () Bool)

(assert (=> b!835453 m!780621))

(declare-fun m!780623 () Bool)

(assert (=> b!835456 m!780623))

(declare-fun m!780625 () Bool)

(assert (=> b!835456 m!780625))

(declare-fun m!780627 () Bool)

(assert (=> b!835456 m!780627))

(declare-fun m!780629 () Bool)

(assert (=> b!835454 m!780629))

(assert (=> b!835454 m!780629))

(declare-fun m!780631 () Bool)

(assert (=> b!835454 m!780631))

(declare-fun m!780633 () Bool)

(assert (=> start!71896 m!780633))

(declare-fun m!780635 () Bool)

(assert (=> b!835455 m!780635))

(declare-fun m!780637 () Bool)

(assert (=> b!835455 m!780637))

(declare-fun m!780639 () Bool)

(assert (=> b!835452 m!780639))

(assert (=> b!835452 m!780639))

(declare-fun m!780641 () Bool)

(assert (=> b!835452 m!780641))

(push 1)

