; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72062 () Bool)

(assert start!72062)

(declare-fun b!836350 () Bool)

(declare-fun res!568673 () Bool)

(declare-fun e!466640 () Bool)

(assert (=> b!836350 (=> (not res!568673) (not e!466640))))

(declare-datatypes ((array!46809 0))(
  ( (array!46810 (arr!22434 (Array (_ BitVec 32) (_ BitVec 64))) (size!22854 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46809)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!836350 (= res!568673 (and (bvslt (size!22854 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22854 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!836351 () Bool)

(declare-fun res!568670 () Bool)

(declare-fun e!466642 () Bool)

(assert (=> b!836351 (=> (not res!568670) (not e!466642))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!836351 (= res!568670 (not (validKeyInArray!0 (select (arr!22434 a!4227) to!390))))))

(declare-fun b!836352 () Bool)

(assert (=> b!836352 (= e!466642 (not true))))

(declare-fun lt!380080 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46809 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!836352 (= (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) lt!380080)))

(declare-datatypes ((Unit!28732 0))(
  ( (Unit!28733) )
))
(declare-fun lt!380079 () Unit!28732)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46809 (_ BitVec 32) (_ BitVec 32)) Unit!28732)

(assert (=> b!836352 (= lt!380079 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun res!568674 () Bool)

(assert (=> start!72062 (=> (not res!568674) (not e!466640))))

(assert (=> start!72062 (= res!568674 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22854 a!4227))))))

(assert (=> start!72062 e!466640))

(assert (=> start!72062 true))

(declare-fun array_inv!17920 (array!46809) Bool)

(assert (=> start!72062 (array_inv!17920 a!4227)))

(declare-fun b!836353 () Bool)

(declare-fun res!568669 () Bool)

(assert (=> b!836353 (=> (not res!568669) (not e!466640))))

(declare-fun k0!2968 () (_ BitVec 64))

(assert (=> b!836353 (= res!568669 (validKeyInArray!0 k0!2968))))

(declare-fun b!836354 () Bool)

(declare-fun res!568672 () Bool)

(assert (=> b!836354 (=> (not res!568672) (not e!466640))))

(assert (=> b!836354 (= res!568672 (not (validKeyInArray!0 (select (arr!22434 a!4227) i!1466))))))

(declare-fun b!836355 () Bool)

(assert (=> b!836355 (= e!466640 e!466642)))

(declare-fun res!568671 () Bool)

(assert (=> b!836355 (=> (not res!568671) (not e!466642))))

(declare-fun lt!380081 () (_ BitVec 32))

(assert (=> b!836355 (= res!568671 (and (= lt!380081 lt!380080) (not (= to!390 (size!22854 a!4227)))))))

(assert (=> b!836355 (= lt!380080 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!836355 (= lt!380081 (arrayCountValidKeys!0 (array!46810 (store (arr!22434 a!4227) i!1466 k0!2968) (size!22854 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (= (and start!72062 res!568674) b!836354))

(assert (= (and b!836354 res!568672) b!836353))

(assert (= (and b!836353 res!568669) b!836350))

(assert (= (and b!836350 res!568673) b!836355))

(assert (= (and b!836355 res!568671) b!836351))

(assert (= (and b!836351 res!568670) b!836352))

(declare-fun m!781915 () Bool)

(assert (=> start!72062 m!781915))

(declare-fun m!781917 () Bool)

(assert (=> b!836352 m!781917))

(declare-fun m!781919 () Bool)

(assert (=> b!836352 m!781919))

(declare-fun m!781921 () Bool)

(assert (=> b!836353 m!781921))

(declare-fun m!781923 () Bool)

(assert (=> b!836354 m!781923))

(assert (=> b!836354 m!781923))

(declare-fun m!781925 () Bool)

(assert (=> b!836354 m!781925))

(declare-fun m!781927 () Bool)

(assert (=> b!836351 m!781927))

(assert (=> b!836351 m!781927))

(declare-fun m!781929 () Bool)

(assert (=> b!836351 m!781929))

(declare-fun m!781931 () Bool)

(assert (=> b!836355 m!781931))

(declare-fun m!781933 () Bool)

(assert (=> b!836355 m!781933))

(declare-fun m!781935 () Bool)

(assert (=> b!836355 m!781935))

(check-sat (not b!836351) (not b!836353) (not b!836354) (not b!836352) (not start!72062) (not b!836355))
(check-sat)
