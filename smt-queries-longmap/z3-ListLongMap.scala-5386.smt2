; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72080 () Bool)

(assert start!72080)

(declare-fun b!836532 () Bool)

(declare-fun res!568832 () Bool)

(declare-fun e!466742 () Bool)

(assert (=> b!836532 (=> (not res!568832) (not e!466742))))

(declare-datatypes ((array!46827 0))(
  ( (array!46828 (arr!22443 (Array (_ BitVec 32) (_ BitVec 64))) (size!22863 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46827)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!836532 (= res!568832 (and (bvslt (size!22863 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22863 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!836533 () Bool)

(declare-fun res!568830 () Bool)

(assert (=> b!836533 (=> (not res!568830) (not e!466742))))

(declare-fun k0!2968 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!836533 (= res!568830 (validKeyInArray!0 k0!2968))))

(declare-fun call!36737 () (_ BitVec 32))

(declare-fun bm!36733 () Bool)

(declare-fun arrayCountValidKeys!0 (array!46827 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!36733 (= call!36737 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!836534 () Bool)

(declare-datatypes ((Unit!28750 0))(
  ( (Unit!28751) )
))
(declare-fun e!466741 () Unit!28750)

(declare-fun lt!380221 () Unit!28750)

(assert (=> b!836534 (= e!466741 lt!380221)))

(declare-fun lt!380222 () Unit!28750)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46827 (_ BitVec 32) (_ BitVec 32)) Unit!28750)

(assert (=> b!836534 (= lt!380222 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!380217 () (_ BitVec 32))

(assert (=> b!836534 (= call!36737 lt!380217)))

(declare-fun lt!380218 () array!46827)

(assert (=> b!836534 (= lt!380221 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!380218 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36736 () (_ BitVec 32))

(declare-fun lt!380215 () (_ BitVec 32))

(assert (=> b!836534 (= call!36736 lt!380215)))

(declare-fun b!836535 () Bool)

(declare-fun e!466743 () Bool)

(assert (=> b!836535 (= e!466742 e!466743)))

(declare-fun res!568833 () Bool)

(assert (=> b!836535 (=> (not res!568833) (not e!466743))))

(assert (=> b!836535 (= res!568833 (and (= lt!380215 lt!380217) (not (= to!390 (size!22863 a!4227)))))))

(assert (=> b!836535 (= lt!380217 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!836535 (= lt!380215 (arrayCountValidKeys!0 lt!380218 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!836535 (= lt!380218 (array!46828 (store (arr!22443 a!4227) i!1466 k0!2968) (size!22863 a!4227)))))

(declare-fun b!836536 () Bool)

(declare-fun res!568829 () Bool)

(assert (=> b!836536 (=> (not res!568829) (not e!466742))))

(assert (=> b!836536 (= res!568829 (not (validKeyInArray!0 (select (arr!22443 a!4227) i!1466))))))

(declare-fun b!836537 () Bool)

(assert (=> b!836537 (= e!466743 false)))

(declare-fun lt!380216 () Unit!28750)

(assert (=> b!836537 (= lt!380216 e!466741)))

(declare-fun c!91250 () Bool)

(assert (=> b!836537 (= c!91250 (validKeyInArray!0 (select (arr!22443 a!4227) to!390)))))

(declare-fun b!836538 () Bool)

(declare-fun lt!380220 () Unit!28750)

(assert (=> b!836538 (= e!466741 lt!380220)))

(declare-fun lt!380219 () Unit!28750)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46827 (_ BitVec 32) (_ BitVec 32)) Unit!28750)

(assert (=> b!836538 (= lt!380219 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!836538 (= call!36737 (bvadd #b00000000000000000000000000000001 lt!380217))))

(assert (=> b!836538 (= lt!380220 (lemmaValidKeyIncreasesNumOfKeys!0 lt!380218 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!836538 (= call!36736 (bvadd #b00000000000000000000000000000001 lt!380215))))

(declare-fun res!568831 () Bool)

(assert (=> start!72080 (=> (not res!568831) (not e!466742))))

(assert (=> start!72080 (= res!568831 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22863 a!4227))))))

(assert (=> start!72080 e!466742))

(assert (=> start!72080 true))

(declare-fun array_inv!17929 (array!46827) Bool)

(assert (=> start!72080 (array_inv!17929 a!4227)))

(declare-fun bm!36734 () Bool)

(assert (=> bm!36734 (= call!36736 (arrayCountValidKeys!0 lt!380218 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(assert (= (and start!72080 res!568831) b!836536))

(assert (= (and b!836536 res!568829) b!836533))

(assert (= (and b!836533 res!568830) b!836532))

(assert (= (and b!836532 res!568832) b!836535))

(assert (= (and b!836535 res!568833) b!836537))

(assert (= (and b!836537 c!91250) b!836538))

(assert (= (and b!836537 (not c!91250)) b!836534))

(assert (= (or b!836538 b!836534) bm!36734))

(assert (= (or b!836538 b!836534) bm!36733))

(declare-fun m!782149 () Bool)

(assert (=> bm!36734 m!782149))

(declare-fun m!782151 () Bool)

(assert (=> b!836536 m!782151))

(assert (=> b!836536 m!782151))

(declare-fun m!782153 () Bool)

(assert (=> b!836536 m!782153))

(declare-fun m!782155 () Bool)

(assert (=> b!836534 m!782155))

(declare-fun m!782157 () Bool)

(assert (=> b!836534 m!782157))

(declare-fun m!782159 () Bool)

(assert (=> bm!36733 m!782159))

(declare-fun m!782161 () Bool)

(assert (=> b!836533 m!782161))

(declare-fun m!782163 () Bool)

(assert (=> b!836535 m!782163))

(declare-fun m!782165 () Bool)

(assert (=> b!836535 m!782165))

(declare-fun m!782167 () Bool)

(assert (=> b!836535 m!782167))

(declare-fun m!782169 () Bool)

(assert (=> b!836537 m!782169))

(assert (=> b!836537 m!782169))

(declare-fun m!782171 () Bool)

(assert (=> b!836537 m!782171))

(declare-fun m!782173 () Bool)

(assert (=> b!836538 m!782173))

(declare-fun m!782175 () Bool)

(assert (=> b!836538 m!782175))

(declare-fun m!782177 () Bool)

(assert (=> start!72080 m!782177))

(check-sat (not b!836536) (not start!72080) (not b!836538) (not b!836535) (not bm!36733) (not b!836533) (not bm!36734) (not b!836534) (not b!836537))
(check-sat)
