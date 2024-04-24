; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72054 () Bool)

(assert start!72054)

(declare-datatypes ((array!46801 0))(
  ( (array!46802 (arr!22430 (Array (_ BitVec 32) (_ BitVec 64))) (size!22850 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46801)

(declare-fun b!836268 () Bool)

(declare-fun e!466612 () Bool)

(declare-fun k!2968 () (_ BitVec 64))

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!836268 (= e!466612 (validKeyInArray!0 (select (store (arr!22430 a!4227) i!1466 k!2968) to!390)))))

(declare-fun b!836269 () Bool)

(declare-fun res!568589 () Bool)

(declare-fun e!466613 () Bool)

(assert (=> b!836269 (=> (not res!568589) (not e!466613))))

(assert (=> b!836269 (= res!568589 (validKeyInArray!0 (select (arr!22430 a!4227) to!390)))))

(declare-fun b!836270 () Bool)

(assert (=> b!836270 (= e!466613 (not e!466612))))

(declare-fun res!568587 () Bool)

(assert (=> b!836270 (=> (not res!568587) (not e!466612))))

(assert (=> b!836270 (= res!568587 (and (bvsge (bvadd #b00000000000000000000000000000001 i!1466) #b00000000000000000000000000000000) (bvslt to!390 (size!22850 a!4227))))))

(declare-fun lt!380072 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46801 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!836270 (= (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) (bvadd #b00000000000000000000000000000001 lt!380072))))

(declare-datatypes ((Unit!28730 0))(
  ( (Unit!28731) )
))
(declare-fun lt!380071 () Unit!28730)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46801 (_ BitVec 32) (_ BitVec 32)) Unit!28730)

(assert (=> b!836270 (= lt!380071 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun b!836271 () Bool)

(declare-fun res!568591 () Bool)

(declare-fun e!466614 () Bool)

(assert (=> b!836271 (=> (not res!568591) (not e!466614))))

(assert (=> b!836271 (= res!568591 (validKeyInArray!0 k!2968))))

(declare-fun b!836272 () Bool)

(assert (=> b!836272 (= e!466614 e!466613)))

(declare-fun res!568590 () Bool)

(assert (=> b!836272 (=> (not res!568590) (not e!466613))))

(declare-fun lt!380070 () (_ BitVec 32))

(assert (=> b!836272 (= res!568590 (and (= lt!380070 lt!380072) (not (= to!390 (size!22850 a!4227)))))))

(assert (=> b!836272 (= lt!380072 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!836272 (= lt!380070 (arrayCountValidKeys!0 (array!46802 (store (arr!22430 a!4227) i!1466 k!2968) (size!22850 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun b!836273 () Bool)

(declare-fun res!568592 () Bool)

(assert (=> b!836273 (=> (not res!568592) (not e!466614))))

(assert (=> b!836273 (= res!568592 (and (bvslt (size!22850 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22850 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun res!568593 () Bool)

(assert (=> start!72054 (=> (not res!568593) (not e!466614))))

(assert (=> start!72054 (= res!568593 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22850 a!4227))))))

(assert (=> start!72054 e!466614))

(assert (=> start!72054 true))

(declare-fun array_inv!17916 (array!46801) Bool)

(assert (=> start!72054 (array_inv!17916 a!4227)))

(declare-fun b!836274 () Bool)

(declare-fun res!568588 () Bool)

(assert (=> b!836274 (=> (not res!568588) (not e!466614))))

(assert (=> b!836274 (= res!568588 (not (validKeyInArray!0 (select (arr!22430 a!4227) i!1466))))))

(assert (= (and start!72054 res!568593) b!836274))

(assert (= (and b!836274 res!568588) b!836271))

(assert (= (and b!836271 res!568591) b!836273))

(assert (= (and b!836273 res!568592) b!836272))

(assert (= (and b!836272 res!568590) b!836269))

(assert (= (and b!836269 res!568589) b!836270))

(assert (= (and b!836270 res!568587) b!836268))

(declare-fun m!781835 () Bool)

(assert (=> start!72054 m!781835))

(declare-fun m!781837 () Bool)

(assert (=> b!836268 m!781837))

(declare-fun m!781839 () Bool)

(assert (=> b!836268 m!781839))

(assert (=> b!836268 m!781839))

(declare-fun m!781841 () Bool)

(assert (=> b!836268 m!781841))

(declare-fun m!781843 () Bool)

(assert (=> b!836270 m!781843))

(declare-fun m!781845 () Bool)

(assert (=> b!836270 m!781845))

(declare-fun m!781847 () Bool)

(assert (=> b!836274 m!781847))

(assert (=> b!836274 m!781847))

(declare-fun m!781849 () Bool)

(assert (=> b!836274 m!781849))

(declare-fun m!781851 () Bool)

(assert (=> b!836271 m!781851))

(declare-fun m!781853 () Bool)

(assert (=> b!836272 m!781853))

(assert (=> b!836272 m!781837))

(declare-fun m!781855 () Bool)

(assert (=> b!836272 m!781855))

(declare-fun m!781857 () Bool)

(assert (=> b!836269 m!781857))

(assert (=> b!836269 m!781857))

(declare-fun m!781859 () Bool)

(assert (=> b!836269 m!781859))

(push 1)

(assert (not b!836274))

(assert (not b!836270))

(assert (not b!836268))

(assert (not b!836271))

(assert (not b!836269))

(assert (not b!836272))

(assert (not start!72054))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

