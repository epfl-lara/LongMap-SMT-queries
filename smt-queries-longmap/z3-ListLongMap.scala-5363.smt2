; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71778 () Bool)

(assert start!71778)

(declare-fun b!834237 () Bool)

(declare-fun res!567275 () Bool)

(declare-fun e!465430 () Bool)

(assert (=> b!834237 (=> (not res!567275) (not e!465430))))

(declare-fun k0!2968 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834237 (= res!567275 (validKeyInArray!0 k0!2968))))

(declare-fun b!834238 () Bool)

(declare-fun res!567271 () Bool)

(declare-fun e!465431 () Bool)

(assert (=> b!834238 (=> (not res!567271) (not e!465431))))

(declare-datatypes ((array!46688 0))(
  ( (array!46689 (arr!22378 (Array (_ BitVec 32) (_ BitVec 64))) (size!22799 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46688)

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!834238 (= res!567271 (not (validKeyInArray!0 (select (arr!22378 a!4227) to!390))))))

(declare-fun b!834239 () Bool)

(assert (=> b!834239 (= e!465431 (not true))))

(declare-fun lt!378841 () (_ BitVec 32))

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46688 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!834239 (= (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) lt!378841)))

(declare-datatypes ((Unit!28649 0))(
  ( (Unit!28650) )
))
(declare-fun lt!378839 () Unit!28649)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46688 (_ BitVec 32) (_ BitVec 32)) Unit!28649)

(assert (=> b!834239 (= lt!378839 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun b!834241 () Bool)

(assert (=> b!834241 (= e!465430 e!465431)))

(declare-fun res!567272 () Bool)

(assert (=> b!834241 (=> (not res!567272) (not e!465431))))

(declare-fun lt!378840 () (_ BitVec 32))

(assert (=> b!834241 (= res!567272 (and (= lt!378840 lt!378841) (not (= to!390 (size!22799 a!4227)))))))

(assert (=> b!834241 (= lt!378841 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834241 (= lt!378840 (arrayCountValidKeys!0 (array!46689 (store (arr!22378 a!4227) i!1466 k0!2968) (size!22799 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun b!834242 () Bool)

(declare-fun res!567273 () Bool)

(assert (=> b!834242 (=> (not res!567273) (not e!465430))))

(assert (=> b!834242 (= res!567273 (not (validKeyInArray!0 (select (arr!22378 a!4227) i!1466))))))

(declare-fun b!834240 () Bool)

(declare-fun res!567270 () Bool)

(assert (=> b!834240 (=> (not res!567270) (not e!465430))))

(assert (=> b!834240 (= res!567270 (and (bvslt (size!22799 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22799 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun res!567274 () Bool)

(assert (=> start!71778 (=> (not res!567274) (not e!465430))))

(assert (=> start!71778 (= res!567274 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22799 a!4227))))))

(assert (=> start!71778 e!465430))

(assert (=> start!71778 true))

(declare-fun array_inv!17825 (array!46688) Bool)

(assert (=> start!71778 (array_inv!17825 a!4227)))

(assert (= (and start!71778 res!567274) b!834242))

(assert (= (and b!834242 res!567273) b!834237))

(assert (= (and b!834237 res!567275) b!834240))

(assert (= (and b!834240 res!567270) b!834241))

(assert (= (and b!834241 res!567272) b!834238))

(assert (= (and b!834238 res!567271) b!834239))

(declare-fun m!779183 () Bool)

(assert (=> b!834239 m!779183))

(declare-fun m!779185 () Bool)

(assert (=> b!834239 m!779185))

(declare-fun m!779187 () Bool)

(assert (=> b!834241 m!779187))

(declare-fun m!779189 () Bool)

(assert (=> b!834241 m!779189))

(declare-fun m!779191 () Bool)

(assert (=> b!834241 m!779191))

(declare-fun m!779193 () Bool)

(assert (=> b!834242 m!779193))

(assert (=> b!834242 m!779193))

(declare-fun m!779195 () Bool)

(assert (=> b!834242 m!779195))

(declare-fun m!779197 () Bool)

(assert (=> b!834237 m!779197))

(declare-fun m!779199 () Bool)

(assert (=> b!834238 m!779199))

(assert (=> b!834238 m!779199))

(declare-fun m!779201 () Bool)

(assert (=> b!834238 m!779201))

(declare-fun m!779203 () Bool)

(assert (=> start!71778 m!779203))

(check-sat (not b!834237) (not b!834242) (not b!834238) (not b!834239) (not start!71778) (not b!834241))
(check-sat)
