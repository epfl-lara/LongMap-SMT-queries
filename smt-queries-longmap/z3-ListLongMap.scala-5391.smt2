; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71946 () Bool)

(assert start!71946)

(declare-datatypes ((array!46856 0))(
  ( (array!46857 (arr!22462 (Array (_ BitVec 32) (_ BitVec 64))) (size!22883 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46856)

(declare-fun call!36787 () (_ BitVec 32))

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun bm!36784 () Bool)

(declare-fun to!390 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46856 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!36784 (= call!36787 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun res!568765 () Bool)

(declare-fun e!466376 () Bool)

(assert (=> start!71946 (=> (not res!568765) (not e!466376))))

(assert (=> start!71946 (= res!568765 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22883 a!4227))))))

(assert (=> start!71946 e!466376))

(assert (=> start!71946 true))

(declare-fun array_inv!17909 (array!46856) Bool)

(assert (=> start!71946 (array_inv!17909 a!4227)))

(declare-fun b!836007 () Bool)

(declare-fun res!568766 () Bool)

(assert (=> b!836007 (=> (not res!568766) (not e!466376))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!836007 (= res!568766 (not (validKeyInArray!0 (select (arr!22462 a!4227) i!1466))))))

(declare-fun b!836008 () Bool)

(declare-fun res!568762 () Bool)

(assert (=> b!836008 (=> (not res!568762) (not e!466376))))

(declare-fun k0!2968 () (_ BitVec 64))

(assert (=> b!836008 (= res!568762 (validKeyInArray!0 k0!2968))))

(declare-fun b!836009 () Bool)

(declare-datatypes ((Unit!28769 0))(
  ( (Unit!28770) )
))
(declare-fun e!466378 () Unit!28769)

(declare-fun lt!380246 () Unit!28769)

(assert (=> b!836009 (= e!466378 lt!380246)))

(declare-fun lt!380254 () Unit!28769)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46856 (_ BitVec 32) (_ BitVec 32)) Unit!28769)

(assert (=> b!836009 (= lt!380254 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!380251 () (_ BitVec 32))

(assert (=> b!836009 (= call!36787 (bvadd #b00000000000000000000000000000001 lt!380251))))

(declare-fun lt!380253 () array!46856)

(assert (=> b!836009 (= lt!380246 (lemmaValidKeyIncreasesNumOfKeys!0 lt!380253 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36788 () (_ BitVec 32))

(declare-fun lt!380249 () (_ BitVec 32))

(assert (=> b!836009 (= call!36788 (bvadd #b00000000000000000000000000000001 lt!380249))))

(declare-fun b!836010 () Bool)

(declare-fun res!568764 () Bool)

(assert (=> b!836010 (=> (not res!568764) (not e!466376))))

(assert (=> b!836010 (= res!568764 (and (bvslt (size!22883 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22883 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!836011 () Bool)

(declare-fun e!466380 () Bool)

(assert (=> b!836011 (= e!466376 e!466380)))

(declare-fun res!568760 () Bool)

(assert (=> b!836011 (=> (not res!568760) (not e!466380))))

(assert (=> b!836011 (= res!568760 (and (= lt!380249 lt!380251) (not (= to!390 (size!22883 a!4227)))))))

(assert (=> b!836011 (= lt!380251 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!836011 (= lt!380249 (arrayCountValidKeys!0 lt!380253 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!836011 (= lt!380253 (array!46857 (store (arr!22462 a!4227) i!1466 k0!2968) (size!22883 a!4227)))))

(declare-fun bm!36785 () Bool)

(assert (=> bm!36785 (= call!36788 (arrayCountValidKeys!0 lt!380253 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!836012 () Bool)

(declare-fun e!466379 () Bool)

(assert (=> b!836012 (= e!466379 (not true))))

(assert (=> b!836012 (= (arrayCountValidKeys!0 lt!380253 (bvadd #b00000000000000000000000000000001 i!1466) (size!22883 a!4227)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (size!22883 a!4227)))))

(declare-fun lt!380252 () Unit!28769)

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!46856 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!28769)

(assert (=> b!836012 (= lt!380252 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4227 i!1466 k0!2968 (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!836013 () Bool)

(declare-fun lt!380248 () Unit!28769)

(assert (=> b!836013 (= e!466378 lt!380248)))

(declare-fun lt!380247 () Unit!28769)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46856 (_ BitVec 32) (_ BitVec 32)) Unit!28769)

(assert (=> b!836013 (= lt!380247 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!836013 (= call!36787 lt!380251)))

(assert (=> b!836013 (= lt!380248 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!380253 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!836013 (= call!36788 lt!380249)))

(declare-fun b!836014 () Bool)

(assert (=> b!836014 (= e!466380 e!466379)))

(declare-fun res!568763 () Bool)

(assert (=> b!836014 (=> (not res!568763) (not e!466379))))

(assert (=> b!836014 (= res!568763 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22883 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-fun lt!380250 () Unit!28769)

(assert (=> b!836014 (= lt!380250 e!466378)))

(declare-fun c!91019 () Bool)

(assert (=> b!836014 (= c!91019 (validKeyInArray!0 (select (arr!22462 a!4227) to!390)))))

(declare-fun b!836015 () Bool)

(declare-fun res!568761 () Bool)

(assert (=> b!836015 (=> (not res!568761) (not e!466379))))

(assert (=> b!836015 (= res!568761 (= (arrayCountValidKeys!0 lt!380253 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390))))))

(assert (= (and start!71946 res!568765) b!836007))

(assert (= (and b!836007 res!568766) b!836008))

(assert (= (and b!836008 res!568762) b!836010))

(assert (= (and b!836010 res!568764) b!836011))

(assert (= (and b!836011 res!568760) b!836014))

(assert (= (and b!836014 c!91019) b!836009))

(assert (= (and b!836014 (not c!91019)) b!836013))

(assert (= (or b!836009 b!836013) bm!36785))

(assert (= (or b!836009 b!836013) bm!36784))

(assert (= (and b!836014 res!568763) b!836015))

(assert (= (and b!836015 res!568761) b!836012))

(declare-fun m!781345 () Bool)

(assert (=> b!836008 m!781345))

(declare-fun m!781347 () Bool)

(assert (=> b!836013 m!781347))

(declare-fun m!781349 () Bool)

(assert (=> b!836013 m!781349))

(declare-fun m!781351 () Bool)

(assert (=> b!836015 m!781351))

(declare-fun m!781353 () Bool)

(assert (=> b!836015 m!781353))

(declare-fun m!781355 () Bool)

(assert (=> b!836014 m!781355))

(assert (=> b!836014 m!781355))

(declare-fun m!781357 () Bool)

(assert (=> b!836014 m!781357))

(assert (=> bm!36785 m!781351))

(declare-fun m!781359 () Bool)

(assert (=> b!836007 m!781359))

(assert (=> b!836007 m!781359))

(declare-fun m!781361 () Bool)

(assert (=> b!836007 m!781361))

(declare-fun m!781363 () Bool)

(assert (=> b!836009 m!781363))

(declare-fun m!781365 () Bool)

(assert (=> b!836009 m!781365))

(declare-fun m!781367 () Bool)

(assert (=> b!836012 m!781367))

(declare-fun m!781369 () Bool)

(assert (=> b!836012 m!781369))

(declare-fun m!781371 () Bool)

(assert (=> b!836012 m!781371))

(declare-fun m!781373 () Bool)

(assert (=> start!71946 m!781373))

(declare-fun m!781375 () Bool)

(assert (=> b!836011 m!781375))

(declare-fun m!781377 () Bool)

(assert (=> b!836011 m!781377))

(declare-fun m!781379 () Bool)

(assert (=> b!836011 m!781379))

(assert (=> bm!36784 m!781353))

(check-sat (not b!836014) (not b!836013) (not b!836011) (not b!836008) (not b!836012) (not bm!36784) (not start!71946) (not b!836015) (not b!836009) (not bm!36785) (not b!836007))
(check-sat)
