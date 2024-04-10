; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71888 () Bool)

(assert start!71888)

(declare-fun b!835370 () Bool)

(declare-fun res!568247 () Bool)

(declare-fun e!466033 () Bool)

(assert (=> b!835370 (=> (not res!568247) (not e!466033))))

(declare-fun k!2968 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835370 (= res!568247 (validKeyInArray!0 k!2968))))

(declare-fun b!835371 () Bool)

(declare-fun res!568245 () Bool)

(assert (=> b!835371 (=> (not res!568245) (not e!466033))))

(declare-datatypes ((array!46798 0))(
  ( (array!46799 (arr!22433 (Array (_ BitVec 32) (_ BitVec 64))) (size!22854 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46798)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!835371 (= res!568245 (and (bvslt (size!22854 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22854 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun e!466034 () Bool)

(declare-fun b!835372 () Bool)

(assert (=> b!835372 (= e!466034 (validKeyInArray!0 (select (store (arr!22433 a!4227) i!1466 k!2968) to!390)))))

(declare-fun b!835374 () Bool)

(declare-fun res!568242 () Bool)

(declare-fun e!466035 () Bool)

(assert (=> b!835374 (=> (not res!568242) (not e!466035))))

(assert (=> b!835374 (= res!568242 (validKeyInArray!0 (select (arr!22433 a!4227) to!390)))))

(declare-fun b!835375 () Bool)

(assert (=> b!835375 (= e!466035 (not e!466034))))

(declare-fun res!568244 () Bool)

(assert (=> b!835375 (=> (not res!568244) (not e!466034))))

(assert (=> b!835375 (= res!568244 (and (bvsge (bvadd #b00000000000000000000000000000001 i!1466) #b00000000000000000000000000000000) (bvslt to!390 (size!22854 a!4227))))))

(declare-fun lt!379714 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46798 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!835375 (= (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) (bvadd #b00000000000000000000000000000001 lt!379714))))

(declare-datatypes ((Unit!28717 0))(
  ( (Unit!28718) )
))
(declare-fun lt!379712 () Unit!28717)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46798 (_ BitVec 32) (_ BitVec 32)) Unit!28717)

(assert (=> b!835375 (= lt!379712 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun b!835376 () Bool)

(declare-fun res!568241 () Bool)

(assert (=> b!835376 (=> (not res!568241) (not e!466033))))

(assert (=> b!835376 (= res!568241 (not (validKeyInArray!0 (select (arr!22433 a!4227) i!1466))))))

(declare-fun b!835373 () Bool)

(assert (=> b!835373 (= e!466033 e!466035)))

(declare-fun res!568246 () Bool)

(assert (=> b!835373 (=> (not res!568246) (not e!466035))))

(declare-fun lt!379713 () (_ BitVec 32))

(assert (=> b!835373 (= res!568246 (and (= lt!379713 lt!379714) (not (= to!390 (size!22854 a!4227)))))))

(assert (=> b!835373 (= lt!379714 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835373 (= lt!379713 (arrayCountValidKeys!0 (array!46799 (store (arr!22433 a!4227) i!1466 k!2968) (size!22854 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun res!568243 () Bool)

(assert (=> start!71888 (=> (not res!568243) (not e!466033))))

(assert (=> start!71888 (= res!568243 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22854 a!4227))))))

(assert (=> start!71888 e!466033))

(assert (=> start!71888 true))

(declare-fun array_inv!17880 (array!46798) Bool)

(assert (=> start!71888 (array_inv!17880 a!4227)))

(assert (= (and start!71888 res!568243) b!835376))

(assert (= (and b!835376 res!568241) b!835370))

(assert (= (and b!835370 res!568247) b!835371))

(assert (= (and b!835371 res!568245) b!835373))

(assert (= (and b!835373 res!568246) b!835374))

(assert (= (and b!835374 res!568242) b!835375))

(assert (= (and b!835375 res!568244) b!835372))

(declare-fun m!780541 () Bool)

(assert (=> b!835376 m!780541))

(assert (=> b!835376 m!780541))

(declare-fun m!780543 () Bool)

(assert (=> b!835376 m!780543))

(declare-fun m!780545 () Bool)

(assert (=> b!835370 m!780545))

(declare-fun m!780547 () Bool)

(assert (=> b!835372 m!780547))

(declare-fun m!780549 () Bool)

(assert (=> b!835372 m!780549))

(assert (=> b!835372 m!780549))

(declare-fun m!780551 () Bool)

(assert (=> b!835372 m!780551))

(declare-fun m!780553 () Bool)

(assert (=> b!835375 m!780553))

(declare-fun m!780555 () Bool)

(assert (=> b!835375 m!780555))

(declare-fun m!780557 () Bool)

(assert (=> start!71888 m!780557))

(declare-fun m!780559 () Bool)

(assert (=> b!835374 m!780559))

(assert (=> b!835374 m!780559))

(declare-fun m!780561 () Bool)

(assert (=> b!835374 m!780561))

(declare-fun m!780563 () Bool)

(assert (=> b!835373 m!780563))

(assert (=> b!835373 m!780547))

(declare-fun m!780565 () Bool)

(assert (=> b!835373 m!780565))

(push 1)

(assert (not b!835370))

(assert (not b!835372))

(assert (not b!835376))

(assert (not start!71888))

(assert (not b!835373))

(assert (not b!835374))

(assert (not b!835375))

(check-sat)

(pop 1)

(push 1)

(check-sat)

