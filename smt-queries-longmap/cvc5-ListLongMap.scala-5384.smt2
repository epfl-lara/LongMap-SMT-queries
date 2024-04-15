; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71886 () Bool)

(assert start!71886)

(declare-fun b!835308 () Bool)

(declare-fun res!568315 () Bool)

(declare-fun e!465968 () Bool)

(assert (=> b!835308 (=> (not res!568315) (not e!465968))))

(declare-datatypes ((array!46785 0))(
  ( (array!46786 (arr!22427 (Array (_ BitVec 32) (_ BitVec 64))) (size!22848 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46785)

(declare-fun to!390 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835308 (= res!568315 (not (validKeyInArray!0 (select (arr!22427 a!4227) to!390))))))

(declare-fun e!465966 () Bool)

(declare-fun b!835309 () Bool)

(declare-fun k!2968 () (_ BitVec 64))

(declare-fun i!1466 () (_ BitVec 32))

(assert (=> b!835309 (= e!465966 (not (validKeyInArray!0 (select (store (arr!22427 a!4227) i!1466 k!2968) to!390))))))

(declare-fun res!568320 () Bool)

(declare-fun e!465965 () Bool)

(assert (=> start!71886 (=> (not res!568320) (not e!465965))))

(assert (=> start!71886 (= res!568320 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22848 a!4227))))))

(assert (=> start!71886 e!465965))

(assert (=> start!71886 true))

(declare-fun array_inv!17939 (array!46785) Bool)

(assert (=> start!71886 (array_inv!17939 a!4227)))

(declare-fun b!835310 () Bool)

(assert (=> b!835310 (= e!465965 e!465968)))

(declare-fun res!568319 () Bool)

(assert (=> b!835310 (=> (not res!568319) (not e!465968))))

(declare-fun lt!379528 () (_ BitVec 32))

(declare-fun lt!379529 () (_ BitVec 32))

(assert (=> b!835310 (= res!568319 (and (= lt!379528 lt!379529) (not (= to!390 (size!22848 a!4227)))))))

(declare-fun arrayCountValidKeys!0 (array!46785 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!835310 (= lt!379529 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835310 (= lt!379528 (arrayCountValidKeys!0 (array!46786 (store (arr!22427 a!4227) i!1466 k!2968) (size!22848 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun b!835311 () Bool)

(declare-fun res!568321 () Bool)

(assert (=> b!835311 (=> (not res!568321) (not e!465965))))

(assert (=> b!835311 (= res!568321 (and (bvslt (size!22848 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22848 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!835312 () Bool)

(assert (=> b!835312 (= e!465968 (not e!465966))))

(declare-fun res!568317 () Bool)

(assert (=> b!835312 (=> (not res!568317) (not e!465966))))

(assert (=> b!835312 (= res!568317 (and (bvsge (bvadd #b00000000000000000000000000000001 i!1466) #b00000000000000000000000000000000) (bvslt to!390 (size!22848 a!4227))))))

(assert (=> b!835312 (= (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) lt!379529)))

(declare-datatypes ((Unit!28677 0))(
  ( (Unit!28678) )
))
(declare-fun lt!379527 () Unit!28677)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46785 (_ BitVec 32) (_ BitVec 32)) Unit!28677)

(assert (=> b!835312 (= lt!379527 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun b!835313 () Bool)

(declare-fun res!568318 () Bool)

(assert (=> b!835313 (=> (not res!568318) (not e!465965))))

(assert (=> b!835313 (= res!568318 (validKeyInArray!0 k!2968))))

(declare-fun b!835314 () Bool)

(declare-fun res!568316 () Bool)

(assert (=> b!835314 (=> (not res!568316) (not e!465965))))

(assert (=> b!835314 (= res!568316 (not (validKeyInArray!0 (select (arr!22427 a!4227) i!1466))))))

(assert (= (and start!71886 res!568320) b!835314))

(assert (= (and b!835314 res!568316) b!835313))

(assert (= (and b!835313 res!568318) b!835311))

(assert (= (and b!835311 res!568321) b!835310))

(assert (= (and b!835310 res!568319) b!835308))

(assert (= (and b!835308 res!568315) b!835312))

(assert (= (and b!835312 res!568317) b!835309))

(declare-fun m!779987 () Bool)

(assert (=> start!71886 m!779987))

(declare-fun m!779989 () Bool)

(assert (=> b!835312 m!779989))

(declare-fun m!779991 () Bool)

(assert (=> b!835312 m!779991))

(declare-fun m!779993 () Bool)

(assert (=> b!835308 m!779993))

(assert (=> b!835308 m!779993))

(declare-fun m!779995 () Bool)

(assert (=> b!835308 m!779995))

(declare-fun m!779997 () Bool)

(assert (=> b!835309 m!779997))

(declare-fun m!779999 () Bool)

(assert (=> b!835309 m!779999))

(assert (=> b!835309 m!779999))

(declare-fun m!780001 () Bool)

(assert (=> b!835309 m!780001))

(declare-fun m!780003 () Bool)

(assert (=> b!835310 m!780003))

(assert (=> b!835310 m!779997))

(declare-fun m!780005 () Bool)

(assert (=> b!835310 m!780005))

(declare-fun m!780007 () Bool)

(assert (=> b!835313 m!780007))

(declare-fun m!780009 () Bool)

(assert (=> b!835314 m!780009))

(assert (=> b!835314 m!780009))

(declare-fun m!780011 () Bool)

(assert (=> b!835314 m!780011))

(push 1)

(assert (not b!835314))

(assert (not b!835313))

(assert (not b!835309))

(assert (not b!835310))

(assert (not b!835312))

(assert (not start!71886))

(assert (not b!835308))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

