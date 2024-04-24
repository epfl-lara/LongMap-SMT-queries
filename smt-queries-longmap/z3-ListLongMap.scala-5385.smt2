; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72074 () Bool)

(assert start!72074)

(declare-fun b!836469 () Bool)

(declare-fun res!568786 () Bool)

(declare-fun e!466707 () Bool)

(assert (=> b!836469 (=> (not res!568786) (not e!466707))))

(declare-datatypes ((array!46821 0))(
  ( (array!46822 (arr!22440 (Array (_ BitVec 32) (_ BitVec 64))) (size!22860 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46821)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!836469 (= res!568786 (and (bvslt (size!22860 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22860 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!836470 () Bool)

(declare-fun res!568784 () Bool)

(assert (=> b!836470 (=> (not res!568784) (not e!466707))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!836470 (= res!568784 (not (validKeyInArray!0 (select (arr!22440 a!4227) i!1466))))))

(declare-fun b!836471 () Bool)

(declare-fun e!466706 () Bool)

(assert (=> b!836471 (= e!466706 false)))

(declare-datatypes ((Unit!28744 0))(
  ( (Unit!28745) )
))
(declare-fun lt!380146 () Unit!28744)

(declare-fun e!466705 () Unit!28744)

(assert (=> b!836471 (= lt!380146 e!466705)))

(declare-fun c!91241 () Bool)

(assert (=> b!836471 (= c!91241 (validKeyInArray!0 (select (arr!22440 a!4227) to!390)))))

(declare-fun b!836472 () Bool)

(declare-fun lt!380147 () Unit!28744)

(assert (=> b!836472 (= e!466705 lt!380147)))

(declare-fun lt!380145 () Unit!28744)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46821 (_ BitVec 32) (_ BitVec 32)) Unit!28744)

(assert (=> b!836472 (= lt!380145 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36718 () (_ BitVec 32))

(declare-fun lt!380148 () (_ BitVec 32))

(assert (=> b!836472 (= call!36718 (bvadd #b00000000000000000000000000000001 lt!380148))))

(declare-fun lt!380150 () array!46821)

(assert (=> b!836472 (= lt!380147 (lemmaValidKeyIncreasesNumOfKeys!0 lt!380150 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36719 () (_ BitVec 32))

(declare-fun lt!380143 () (_ BitVec 32))

(assert (=> b!836472 (= call!36719 (bvadd #b00000000000000000000000000000001 lt!380143))))

(declare-fun b!836473 () Bool)

(assert (=> b!836473 (= e!466707 e!466706)))

(declare-fun res!568788 () Bool)

(assert (=> b!836473 (=> (not res!568788) (not e!466706))))

(assert (=> b!836473 (= res!568788 (and (= lt!380143 lt!380148) (not (= to!390 (size!22860 a!4227)))))))

(declare-fun arrayCountValidKeys!0 (array!46821 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!836473 (= lt!380148 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!836473 (= lt!380143 (arrayCountValidKeys!0 lt!380150 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun k0!2968 () (_ BitVec 64))

(assert (=> b!836473 (= lt!380150 (array!46822 (store (arr!22440 a!4227) i!1466 k0!2968) (size!22860 a!4227)))))

(declare-fun bm!36715 () Bool)

(assert (=> bm!36715 (= call!36718 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!836474 () Bool)

(declare-fun lt!380144 () Unit!28744)

(assert (=> b!836474 (= e!466705 lt!380144)))

(declare-fun lt!380149 () Unit!28744)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46821 (_ BitVec 32) (_ BitVec 32)) Unit!28744)

(assert (=> b!836474 (= lt!380149 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!836474 (= call!36718 lt!380148)))

(assert (=> b!836474 (= lt!380144 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!380150 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!836474 (= call!36719 lt!380143)))

(declare-fun bm!36716 () Bool)

(assert (=> bm!36716 (= call!36719 (arrayCountValidKeys!0 lt!380150 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!836475 () Bool)

(declare-fun res!568785 () Bool)

(assert (=> b!836475 (=> (not res!568785) (not e!466707))))

(assert (=> b!836475 (= res!568785 (validKeyInArray!0 k0!2968))))

(declare-fun res!568787 () Bool)

(assert (=> start!72074 (=> (not res!568787) (not e!466707))))

(assert (=> start!72074 (= res!568787 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22860 a!4227))))))

(assert (=> start!72074 e!466707))

(assert (=> start!72074 true))

(declare-fun array_inv!17926 (array!46821) Bool)

(assert (=> start!72074 (array_inv!17926 a!4227)))

(assert (= (and start!72074 res!568787) b!836470))

(assert (= (and b!836470 res!568784) b!836475))

(assert (= (and b!836475 res!568785) b!836469))

(assert (= (and b!836469 res!568786) b!836473))

(assert (= (and b!836473 res!568788) b!836471))

(assert (= (and b!836471 c!91241) b!836472))

(assert (= (and b!836471 (not c!91241)) b!836474))

(assert (= (or b!836472 b!836474) bm!36716))

(assert (= (or b!836472 b!836474) bm!36715))

(declare-fun m!782059 () Bool)

(assert (=> b!836472 m!782059))

(declare-fun m!782061 () Bool)

(assert (=> b!836472 m!782061))

(declare-fun m!782063 () Bool)

(assert (=> b!836474 m!782063))

(declare-fun m!782065 () Bool)

(assert (=> b!836474 m!782065))

(declare-fun m!782067 () Bool)

(assert (=> b!836475 m!782067))

(declare-fun m!782069 () Bool)

(assert (=> b!836473 m!782069))

(declare-fun m!782071 () Bool)

(assert (=> b!836473 m!782071))

(declare-fun m!782073 () Bool)

(assert (=> b!836473 m!782073))

(declare-fun m!782075 () Bool)

(assert (=> start!72074 m!782075))

(declare-fun m!782077 () Bool)

(assert (=> b!836470 m!782077))

(assert (=> b!836470 m!782077))

(declare-fun m!782079 () Bool)

(assert (=> b!836470 m!782079))

(declare-fun m!782081 () Bool)

(assert (=> bm!36716 m!782081))

(declare-fun m!782083 () Bool)

(assert (=> bm!36715 m!782083))

(declare-fun m!782085 () Bool)

(assert (=> b!836471 m!782085))

(assert (=> b!836471 m!782085))

(declare-fun m!782087 () Bool)

(assert (=> b!836471 m!782087))

(check-sat (not b!836471) (not b!836470) (not start!72074) (not b!836475) (not b!836474) (not b!836472) (not bm!36716) (not b!836473) (not bm!36715))
(check-sat)
