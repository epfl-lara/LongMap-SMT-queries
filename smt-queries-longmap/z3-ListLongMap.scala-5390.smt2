; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72104 () Bool)

(assert start!72104)

(declare-fun b!836797 () Bool)

(declare-fun e!466899 () Bool)

(declare-datatypes ((array!46851 0))(
  ( (array!46852 (arr!22455 (Array (_ BitVec 32) (_ BitVec 64))) (size!22875 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46851)

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!836797 (= e!466899 (bvsge (bvsub (size!22875 a!4227) to!390) (bvsub (bvadd #b00000000000000000000000000000001 (size!22875 a!4227)) to!390)))))

(declare-fun b!836798 () Bool)

(declare-fun e!466898 () Bool)

(assert (=> b!836798 (= e!466898 e!466899)))

(declare-fun res!569027 () Bool)

(assert (=> b!836798 (=> (not res!569027) (not e!466899))))

(declare-fun i!1466 () (_ BitVec 32))

(assert (=> b!836798 (= res!569027 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22875 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-datatypes ((Unit!28774 0))(
  ( (Unit!28775) )
))
(declare-fun lt!380506 () Unit!28774)

(declare-fun e!466896 () Unit!28774)

(assert (=> b!836798 (= lt!380506 e!466896)))

(declare-fun c!91286 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!836798 (= c!91286 (validKeyInArray!0 (select (arr!22455 a!4227) to!390)))))

(declare-fun res!569026 () Bool)

(declare-fun e!466900 () Bool)

(assert (=> start!72104 (=> (not res!569026) (not e!466900))))

(assert (=> start!72104 (= res!569026 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22875 a!4227))))))

(assert (=> start!72104 e!466900))

(assert (=> start!72104 true))

(declare-fun array_inv!17941 (array!46851) Bool)

(assert (=> start!72104 (array_inv!17941 a!4227)))

(declare-fun b!836799 () Bool)

(declare-fun res!569025 () Bool)

(assert (=> b!836799 (=> (not res!569025) (not e!466900))))

(assert (=> b!836799 (= res!569025 (not (validKeyInArray!0 (select (arr!22455 a!4227) i!1466))))))

(declare-fun b!836800 () Bool)

(declare-fun res!569023 () Bool)

(assert (=> b!836800 (=> (not res!569023) (not e!466900))))

(assert (=> b!836800 (= res!569023 (and (bvslt (size!22875 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22875 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun bm!36805 () Bool)

(declare-fun lt!380508 () array!46851)

(declare-fun call!36808 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46851 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!36805 (= call!36808 (arrayCountValidKeys!0 lt!380508 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!836801 () Bool)

(assert (=> b!836801 (= e!466900 e!466898)))

(declare-fun res!569022 () Bool)

(assert (=> b!836801 (=> (not res!569022) (not e!466898))))

(declare-fun lt!380510 () (_ BitVec 32))

(declare-fun lt!380507 () (_ BitVec 32))

(assert (=> b!836801 (= res!569022 (and (= lt!380510 lt!380507) (not (= to!390 (size!22875 a!4227)))))))

(assert (=> b!836801 (= lt!380507 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!836801 (= lt!380510 (arrayCountValidKeys!0 lt!380508 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun k0!2968 () (_ BitVec 64))

(assert (=> b!836801 (= lt!380508 (array!46852 (store (arr!22455 a!4227) i!1466 k0!2968) (size!22875 a!4227)))))

(declare-fun b!836802 () Bool)

(declare-fun res!569024 () Bool)

(assert (=> b!836802 (=> (not res!569024) (not e!466900))))

(assert (=> b!836802 (= res!569024 (validKeyInArray!0 k0!2968))))

(declare-fun bm!36806 () Bool)

(declare-fun call!36809 () (_ BitVec 32))

(assert (=> bm!36806 (= call!36809 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!836803 () Bool)

(declare-fun res!569028 () Bool)

(assert (=> b!836803 (=> (not res!569028) (not e!466899))))

(assert (=> b!836803 (= res!569028 (= (arrayCountValidKeys!0 lt!380508 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390))))))

(declare-fun b!836804 () Bool)

(declare-fun lt!380503 () Unit!28774)

(assert (=> b!836804 (= e!466896 lt!380503)))

(declare-fun lt!380504 () Unit!28774)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46851 (_ BitVec 32) (_ BitVec 32)) Unit!28774)

(assert (=> b!836804 (= lt!380504 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!836804 (= call!36809 lt!380507)))

(assert (=> b!836804 (= lt!380503 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!380508 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!836804 (= call!36808 lt!380510)))

(declare-fun b!836805 () Bool)

(declare-fun lt!380509 () Unit!28774)

(assert (=> b!836805 (= e!466896 lt!380509)))

(declare-fun lt!380505 () Unit!28774)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46851 (_ BitVec 32) (_ BitVec 32)) Unit!28774)

(assert (=> b!836805 (= lt!380505 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!836805 (= call!36809 (bvadd #b00000000000000000000000000000001 lt!380507))))

(assert (=> b!836805 (= lt!380509 (lemmaValidKeyIncreasesNumOfKeys!0 lt!380508 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!836805 (= call!36808 (bvadd #b00000000000000000000000000000001 lt!380510))))

(assert (= (and start!72104 res!569026) b!836799))

(assert (= (and b!836799 res!569025) b!836802))

(assert (= (and b!836802 res!569024) b!836800))

(assert (= (and b!836800 res!569023) b!836801))

(assert (= (and b!836801 res!569022) b!836798))

(assert (= (and b!836798 c!91286) b!836805))

(assert (= (and b!836798 (not c!91286)) b!836804))

(assert (= (or b!836805 b!836804) bm!36805))

(assert (= (or b!836805 b!836804) bm!36806))

(assert (= (and b!836798 res!569027) b!836803))

(assert (= (and b!836803 res!569028) b!836797))

(declare-fun m!782509 () Bool)

(assert (=> bm!36806 m!782509))

(declare-fun m!782511 () Bool)

(assert (=> b!836798 m!782511))

(assert (=> b!836798 m!782511))

(declare-fun m!782513 () Bool)

(assert (=> b!836798 m!782513))

(declare-fun m!782515 () Bool)

(assert (=> b!836802 m!782515))

(declare-fun m!782517 () Bool)

(assert (=> b!836804 m!782517))

(declare-fun m!782519 () Bool)

(assert (=> b!836804 m!782519))

(declare-fun m!782521 () Bool)

(assert (=> bm!36805 m!782521))

(declare-fun m!782523 () Bool)

(assert (=> start!72104 m!782523))

(assert (=> b!836803 m!782521))

(assert (=> b!836803 m!782509))

(declare-fun m!782525 () Bool)

(assert (=> b!836799 m!782525))

(assert (=> b!836799 m!782525))

(declare-fun m!782527 () Bool)

(assert (=> b!836799 m!782527))

(declare-fun m!782529 () Bool)

(assert (=> b!836801 m!782529))

(declare-fun m!782531 () Bool)

(assert (=> b!836801 m!782531))

(declare-fun m!782533 () Bool)

(assert (=> b!836801 m!782533))

(declare-fun m!782535 () Bool)

(assert (=> b!836805 m!782535))

(declare-fun m!782537 () Bool)

(assert (=> b!836805 m!782537))

(check-sat (not start!72104) (not b!836804) (not bm!36805) (not b!836801) (not b!836799) (not b!836802) (not b!836798) (not b!836803) (not bm!36806) (not b!836805))
(check-sat)
