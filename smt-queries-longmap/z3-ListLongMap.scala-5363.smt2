; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71756 () Bool)

(assert start!71756)

(declare-fun b!833977 () Bool)

(declare-fun res!567148 () Bool)

(declare-fun e!465274 () Bool)

(assert (=> b!833977 (=> (not res!567148) (not e!465274))))

(declare-datatypes ((array!46655 0))(
  ( (array!46656 (arr!22362 (Array (_ BitVec 32) (_ BitVec 64))) (size!22783 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46655)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!833977 (= res!567148 (not (validKeyInArray!0 (select (arr!22362 a!4227) i!1466))))))

(declare-fun b!833978 () Bool)

(declare-fun res!567150 () Bool)

(assert (=> b!833978 (=> (not res!567150) (not e!465274))))

(declare-fun k0!2968 () (_ BitVec 64))

(assert (=> b!833978 (= res!567150 (validKeyInArray!0 k0!2968))))

(declare-fun res!567146 () Bool)

(assert (=> start!71756 (=> (not res!567146) (not e!465274))))

(assert (=> start!71756 (= res!567146 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22783 a!4227))))))

(assert (=> start!71756 e!465274))

(assert (=> start!71756 true))

(declare-fun array_inv!17874 (array!46655) Bool)

(assert (=> start!71756 (array_inv!17874 a!4227)))

(declare-fun b!833979 () Bool)

(declare-fun res!567147 () Bool)

(assert (=> b!833979 (=> (not res!567147) (not e!465274))))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!833979 (= res!567147 (and (bvslt (size!22783 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22783 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!833980 () Bool)

(declare-fun res!567151 () Bool)

(declare-fun e!465275 () Bool)

(assert (=> b!833980 (=> (not res!567151) (not e!465275))))

(assert (=> b!833980 (= res!567151 (not (validKeyInArray!0 (select (arr!22362 a!4227) to!390))))))

(declare-fun b!833981 () Bool)

(assert (=> b!833981 (= e!465275 (not true))))

(declare-fun lt!378591 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46655 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!833981 (= (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) lt!378591)))

(declare-datatypes ((Unit!28595 0))(
  ( (Unit!28596) )
))
(declare-fun lt!378593 () Unit!28595)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46655 (_ BitVec 32) (_ BitVec 32)) Unit!28595)

(assert (=> b!833981 (= lt!378593 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun b!833982 () Bool)

(assert (=> b!833982 (= e!465274 e!465275)))

(declare-fun res!567149 () Bool)

(assert (=> b!833982 (=> (not res!567149) (not e!465275))))

(declare-fun lt!378592 () (_ BitVec 32))

(assert (=> b!833982 (= res!567149 (and (= lt!378592 lt!378591) (not (= to!390 (size!22783 a!4227)))))))

(assert (=> b!833982 (= lt!378591 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!833982 (= lt!378592 (arrayCountValidKeys!0 (array!46656 (store (arr!22362 a!4227) i!1466 k0!2968) (size!22783 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (= (and start!71756 res!567146) b!833977))

(assert (= (and b!833977 res!567148) b!833978))

(assert (= (and b!833978 res!567150) b!833979))

(assert (= (and b!833979 res!567147) b!833982))

(assert (= (and b!833982 res!567149) b!833980))

(assert (= (and b!833980 res!567151) b!833981))

(declare-fun m!778413 () Bool)

(assert (=> b!833977 m!778413))

(assert (=> b!833977 m!778413))

(declare-fun m!778415 () Bool)

(assert (=> b!833977 m!778415))

(declare-fun m!778417 () Bool)

(assert (=> b!833980 m!778417))

(assert (=> b!833980 m!778417))

(declare-fun m!778419 () Bool)

(assert (=> b!833980 m!778419))

(declare-fun m!778421 () Bool)

(assert (=> b!833981 m!778421))

(declare-fun m!778423 () Bool)

(assert (=> b!833981 m!778423))

(declare-fun m!778425 () Bool)

(assert (=> b!833982 m!778425))

(declare-fun m!778427 () Bool)

(assert (=> b!833982 m!778427))

(declare-fun m!778429 () Bool)

(assert (=> b!833982 m!778429))

(declare-fun m!778431 () Bool)

(assert (=> b!833978 m!778431))

(declare-fun m!778433 () Bool)

(assert (=> start!71756 m!778433))

(check-sat (not b!833981) (not b!833982) (not start!71756) (not b!833980) (not b!833978) (not b!833977))
(check-sat)
