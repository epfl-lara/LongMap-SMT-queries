; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71880 () Bool)

(assert start!71880)

(declare-fun b!835290 () Bool)

(declare-fun e!465989 () Bool)

(declare-fun e!465990 () Bool)

(assert (=> b!835290 (= e!465989 e!465990)))

(declare-fun res!568164 () Bool)

(assert (=> b!835290 (=> (not res!568164) (not e!465990))))

(declare-datatypes ((array!46790 0))(
  ( (array!46791 (arr!22429 (Array (_ BitVec 32) (_ BitVec 64))) (size!22850 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46790)

(declare-fun lt!379678 () (_ BitVec 32))

(declare-fun lt!379676 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!835290 (= res!568164 (and (= lt!379678 lt!379676) (not (= to!390 (size!22850 a!4227)))))))

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46790 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!835290 (= lt!379676 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun k0!2968 () (_ BitVec 64))

(assert (=> b!835290 (= lt!379678 (arrayCountValidKeys!0 (array!46791 (store (arr!22429 a!4227) i!1466 k0!2968) (size!22850 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun b!835291 () Bool)

(declare-fun res!568163 () Bool)

(assert (=> b!835291 (=> (not res!568163) (not e!465989))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835291 (= res!568163 (not (validKeyInArray!0 (select (arr!22429 a!4227) i!1466))))))

(declare-fun b!835292 () Bool)

(declare-fun res!568162 () Bool)

(assert (=> b!835292 (=> (not res!568162) (not e!465989))))

(assert (=> b!835292 (= res!568162 (validKeyInArray!0 k0!2968))))

(declare-fun b!835293 () Bool)

(declare-fun res!568161 () Bool)

(assert (=> b!835293 (=> (not res!568161) (not e!465990))))

(assert (=> b!835293 (= res!568161 (validKeyInArray!0 (select (arr!22429 a!4227) to!390)))))

(declare-fun res!568165 () Bool)

(assert (=> start!71880 (=> (not res!568165) (not e!465989))))

(assert (=> start!71880 (= res!568165 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22850 a!4227))))))

(assert (=> start!71880 e!465989))

(assert (=> start!71880 true))

(declare-fun array_inv!17876 (array!46790) Bool)

(assert (=> start!71880 (array_inv!17876 a!4227)))

(declare-fun b!835294 () Bool)

(declare-fun res!568166 () Bool)

(assert (=> b!835294 (=> (not res!568166) (not e!465989))))

(assert (=> b!835294 (= res!568166 (and (bvslt (size!22850 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22850 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!835295 () Bool)

(assert (=> b!835295 (= e!465990 (not true))))

(assert (=> b!835295 (= (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) (bvadd #b00000000000000000000000000000001 lt!379676))))

(declare-datatypes ((Unit!28709 0))(
  ( (Unit!28710) )
))
(declare-fun lt!379677 () Unit!28709)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46790 (_ BitVec 32) (_ BitVec 32)) Unit!28709)

(assert (=> b!835295 (= lt!379677 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (= (and start!71880 res!568165) b!835291))

(assert (= (and b!835291 res!568163) b!835292))

(assert (= (and b!835292 res!568162) b!835294))

(assert (= (and b!835294 res!568166) b!835290))

(assert (= (and b!835290 res!568164) b!835293))

(assert (= (and b!835293 res!568161) b!835295))

(declare-fun m!780445 () Bool)

(assert (=> b!835295 m!780445))

(declare-fun m!780447 () Bool)

(assert (=> b!835295 m!780447))

(declare-fun m!780449 () Bool)

(assert (=> b!835290 m!780449))

(declare-fun m!780451 () Bool)

(assert (=> b!835290 m!780451))

(declare-fun m!780453 () Bool)

(assert (=> b!835290 m!780453))

(declare-fun m!780455 () Bool)

(assert (=> start!71880 m!780455))

(declare-fun m!780457 () Bool)

(assert (=> b!835293 m!780457))

(assert (=> b!835293 m!780457))

(declare-fun m!780459 () Bool)

(assert (=> b!835293 m!780459))

(declare-fun m!780461 () Bool)

(assert (=> b!835292 m!780461))

(declare-fun m!780463 () Bool)

(assert (=> b!835291 m!780463))

(assert (=> b!835291 m!780463))

(declare-fun m!780465 () Bool)

(assert (=> b!835291 m!780465))

(check-sat (not start!71880) (not b!835295) (not b!835290) (not b!835291) (not b!835292) (not b!835293))
(check-sat)
