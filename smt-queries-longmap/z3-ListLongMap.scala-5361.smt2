; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71930 () Bool)

(assert start!71930)

(declare-fun b!835027 () Bool)

(declare-fun e!465956 () Bool)

(assert (=> b!835027 (= e!465956 (not true))))

(declare-datatypes ((array!46677 0))(
  ( (array!46678 (arr!22368 (Array (_ BitVec 32) (_ BitVec 64))) (size!22788 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46677)

(declare-fun lt!379144 () (_ BitVec 32))

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46677 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!835027 (= (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) (bvadd #b00000000000000000000000000000001 lt!379144))))

(declare-datatypes ((Unit!28654 0))(
  ( (Unit!28655) )
))
(declare-fun lt!379145 () Unit!28654)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46677 (_ BitVec 32) (_ BitVec 32)) Unit!28654)

(assert (=> b!835027 (= lt!379145 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun res!567509 () Bool)

(declare-fun e!465957 () Bool)

(assert (=> start!71930 (=> (not res!567509) (not e!465957))))

(assert (=> start!71930 (= res!567509 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22788 a!4227))))))

(assert (=> start!71930 e!465957))

(assert (=> start!71930 true))

(declare-fun array_inv!17854 (array!46677) Bool)

(assert (=> start!71930 (array_inv!17854 a!4227)))

(declare-fun b!835028 () Bool)

(declare-fun res!567512 () Bool)

(assert (=> b!835028 (=> (not res!567512) (not e!465957))))

(assert (=> b!835028 (= res!567512 (and (bvslt (size!22788 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22788 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!835029 () Bool)

(assert (=> b!835029 (= e!465957 e!465956)))

(declare-fun res!567510 () Bool)

(assert (=> b!835029 (=> (not res!567510) (not e!465956))))

(declare-fun lt!379143 () (_ BitVec 32))

(assert (=> b!835029 (= res!567510 (and (= lt!379143 lt!379144) (not (= to!390 (size!22788 a!4227)))))))

(assert (=> b!835029 (= lt!379144 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun k0!2968 () (_ BitVec 64))

(assert (=> b!835029 (= lt!379143 (arrayCountValidKeys!0 (array!46678 (store (arr!22368 a!4227) i!1466 k0!2968) (size!22788 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun b!835030 () Bool)

(declare-fun res!567511 () Bool)

(assert (=> b!835030 (=> (not res!567511) (not e!465956))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835030 (= res!567511 (validKeyInArray!0 (select (arr!22368 a!4227) to!390)))))

(declare-fun b!835031 () Bool)

(declare-fun res!567508 () Bool)

(assert (=> b!835031 (=> (not res!567508) (not e!465957))))

(assert (=> b!835031 (= res!567508 (validKeyInArray!0 k0!2968))))

(declare-fun b!835032 () Bool)

(declare-fun res!567513 () Bool)

(assert (=> b!835032 (=> (not res!567513) (not e!465957))))

(assert (=> b!835032 (= res!567513 (not (validKeyInArray!0 (select (arr!22368 a!4227) i!1466))))))

(assert (= (and start!71930 res!567509) b!835032))

(assert (= (and b!835032 res!567513) b!835031))

(assert (= (and b!835031 res!567508) b!835028))

(assert (= (and b!835028 res!567512) b!835029))

(assert (= (and b!835029 res!567510) b!835030))

(assert (= (and b!835030 res!567511) b!835027))

(declare-fun m!780339 () Bool)

(assert (=> b!835027 m!780339))

(declare-fun m!780341 () Bool)

(assert (=> b!835027 m!780341))

(declare-fun m!780343 () Bool)

(assert (=> start!71930 m!780343))

(declare-fun m!780345 () Bool)

(assert (=> b!835032 m!780345))

(assert (=> b!835032 m!780345))

(declare-fun m!780347 () Bool)

(assert (=> b!835032 m!780347))

(declare-fun m!780349 () Bool)

(assert (=> b!835029 m!780349))

(declare-fun m!780351 () Bool)

(assert (=> b!835029 m!780351))

(declare-fun m!780353 () Bool)

(assert (=> b!835029 m!780353))

(declare-fun m!780355 () Bool)

(assert (=> b!835030 m!780355))

(assert (=> b!835030 m!780355))

(declare-fun m!780357 () Bool)

(assert (=> b!835030 m!780357))

(declare-fun m!780359 () Bool)

(assert (=> b!835031 m!780359))

(check-sat (not start!71930) (not b!835032) (not b!835029) (not b!835031) (not b!835030) (not b!835027))
(check-sat)
