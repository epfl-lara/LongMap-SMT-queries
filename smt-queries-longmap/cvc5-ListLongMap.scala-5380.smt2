; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71878 () Bool)

(assert start!71878)

(declare-fun b!835272 () Bool)

(declare-fun e!465980 () Bool)

(declare-fun e!465979 () Bool)

(assert (=> b!835272 (= e!465980 e!465979)))

(declare-fun res!568144 () Bool)

(assert (=> b!835272 (=> (not res!568144) (not e!465979))))

(declare-datatypes ((array!46788 0))(
  ( (array!46789 (arr!22428 (Array (_ BitVec 32) (_ BitVec 64))) (size!22849 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46788)

(declare-fun lt!379669 () (_ BitVec 32))

(declare-fun lt!379668 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!835272 (= res!568144 (and (= lt!379668 lt!379669) (not (= to!390 (size!22849 a!4227)))))))

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46788 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!835272 (= lt!379669 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun k!2968 () (_ BitVec 64))

(assert (=> b!835272 (= lt!379668 (arrayCountValidKeys!0 (array!46789 (store (arr!22428 a!4227) i!1466 k!2968) (size!22849 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun res!568148 () Bool)

(assert (=> start!71878 (=> (not res!568148) (not e!465980))))

(assert (=> start!71878 (= res!568148 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22849 a!4227))))))

(assert (=> start!71878 e!465980))

(assert (=> start!71878 true))

(declare-fun array_inv!17875 (array!46788) Bool)

(assert (=> start!71878 (array_inv!17875 a!4227)))

(declare-fun b!835273 () Bool)

(declare-fun res!568143 () Bool)

(assert (=> b!835273 (=> (not res!568143) (not e!465979))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835273 (= res!568143 (validKeyInArray!0 (select (arr!22428 a!4227) to!390)))))

(declare-fun b!835274 () Bool)

(assert (=> b!835274 (= e!465979 (not true))))

(assert (=> b!835274 (= (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) (bvadd #b00000000000000000000000000000001 lt!379669))))

(declare-datatypes ((Unit!28707 0))(
  ( (Unit!28708) )
))
(declare-fun lt!379667 () Unit!28707)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46788 (_ BitVec 32) (_ BitVec 32)) Unit!28707)

(assert (=> b!835274 (= lt!379667 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun b!835275 () Bool)

(declare-fun res!568146 () Bool)

(assert (=> b!835275 (=> (not res!568146) (not e!465980))))

(assert (=> b!835275 (= res!568146 (not (validKeyInArray!0 (select (arr!22428 a!4227) i!1466))))))

(declare-fun b!835276 () Bool)

(declare-fun res!568147 () Bool)

(assert (=> b!835276 (=> (not res!568147) (not e!465980))))

(assert (=> b!835276 (= res!568147 (and (bvslt (size!22849 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22849 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!835277 () Bool)

(declare-fun res!568145 () Bool)

(assert (=> b!835277 (=> (not res!568145) (not e!465980))))

(assert (=> b!835277 (= res!568145 (validKeyInArray!0 k!2968))))

(assert (= (and start!71878 res!568148) b!835275))

(assert (= (and b!835275 res!568146) b!835277))

(assert (= (and b!835277 res!568145) b!835276))

(assert (= (and b!835276 res!568147) b!835272))

(assert (= (and b!835272 res!568144) b!835273))

(assert (= (and b!835273 res!568143) b!835274))

(declare-fun m!780423 () Bool)

(assert (=> b!835275 m!780423))

(assert (=> b!835275 m!780423))

(declare-fun m!780425 () Bool)

(assert (=> b!835275 m!780425))

(declare-fun m!780427 () Bool)

(assert (=> start!71878 m!780427))

(declare-fun m!780429 () Bool)

(assert (=> b!835273 m!780429))

(assert (=> b!835273 m!780429))

(declare-fun m!780431 () Bool)

(assert (=> b!835273 m!780431))

(declare-fun m!780433 () Bool)

(assert (=> b!835272 m!780433))

(declare-fun m!780435 () Bool)

(assert (=> b!835272 m!780435))

(declare-fun m!780437 () Bool)

(assert (=> b!835272 m!780437))

(declare-fun m!780439 () Bool)

(assert (=> b!835277 m!780439))

(declare-fun m!780441 () Bool)

(assert (=> b!835274 m!780441))

(declare-fun m!780443 () Bool)

(assert (=> b!835274 m!780443))

(push 1)

(assert (not b!835273))

