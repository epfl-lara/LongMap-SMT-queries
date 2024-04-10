; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116880 () Bool)

(assert start!116880)

(declare-fun b!1377284 () Bool)

(declare-fun e!780169 () Bool)

(declare-fun e!780171 () Bool)

(assert (=> b!1377284 (= e!780169 e!780171)))

(declare-fun res!920046 () Bool)

(assert (=> b!1377284 (=> (not res!920046) (not e!780171))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93549 0))(
  ( (array!93550 (arr!45178 (Array (_ BitVec 32) (_ BitVec 64))) (size!45728 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93549)

(assert (=> b!1377284 (= res!920046 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45728 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-datatypes ((Unit!45673 0))(
  ( (Unit!45674) )
))
(declare-fun lt!605896 () Unit!45673)

(declare-fun e!780170 () Unit!45673)

(assert (=> b!1377284 (= lt!605896 e!780170)))

(declare-fun c!128060 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377284 (= c!128060 (validKeyInArray!0 (select (arr!45178 a!4032) to!206)))))

(declare-fun bm!65974 () Bool)

(declare-fun call!65978 () (_ BitVec 32))

(declare-fun lt!605891 () array!93549)

(declare-fun arrayCountValidKeys!0 (array!93549 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!65974 (= call!65978 (arrayCountValidKeys!0 lt!605891 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1377285 () Bool)

(declare-fun e!780172 () Bool)

(assert (=> b!1377285 (= e!780172 e!780169)))

(declare-fun res!920049 () Bool)

(assert (=> b!1377285 (=> (not res!920049) (not e!780169))))

(declare-fun lt!605889 () (_ BitVec 32))

(declare-fun lt!605890 () (_ BitVec 32))

(assert (=> b!1377285 (= res!920049 (and (= lt!605890 lt!605889) (not (= to!206 (size!45728 a!4032)))))))

(assert (=> b!1377285 (= lt!605889 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377285 (= lt!605890 (arrayCountValidKeys!0 lt!605891 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k!2947 () (_ BitVec 64))

(assert (=> b!1377285 (= lt!605891 (array!93550 (store (arr!45178 a!4032) i!1445 k!2947) (size!45728 a!4032)))))

(declare-fun b!1377286 () Bool)

(declare-fun res!920045 () Bool)

(assert (=> b!1377286 (=> (not res!920045) (not e!780172))))

(assert (=> b!1377286 (= res!920045 (not (validKeyInArray!0 k!2947)))))

(declare-fun b!1377287 () Bool)

(declare-fun res!920050 () Bool)

(assert (=> b!1377287 (=> (not res!920050) (not e!780171))))

(assert (=> b!1377287 (= res!920050 (= (arrayCountValidKeys!0 lt!605891 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206))))))

(declare-fun b!1377288 () Bool)

(declare-fun res!920044 () Bool)

(assert (=> b!1377288 (=> (not res!920044) (not e!780172))))

(assert (=> b!1377288 (= res!920044 (and (bvslt (size!45728 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45728 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun res!920047 () Bool)

(assert (=> start!116880 (=> (not res!920047) (not e!780172))))

(assert (=> start!116880 (= res!920047 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45728 a!4032))))))

(assert (=> start!116880 e!780172))

(assert (=> start!116880 true))

(declare-fun array_inv!34206 (array!93549) Bool)

(assert (=> start!116880 (array_inv!34206 a!4032)))

(declare-fun b!1377289 () Bool)

(declare-fun lt!605893 () Unit!45673)

(assert (=> b!1377289 (= e!780170 lt!605893)))

(declare-fun lt!605895 () Unit!45673)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93549 (_ BitVec 32) (_ BitVec 32)) Unit!45673)

(assert (=> b!1377289 (= lt!605895 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65977 () (_ BitVec 32))

(assert (=> b!1377289 (= call!65977 lt!605889)))

(assert (=> b!1377289 (= lt!605893 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!605891 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377289 (= call!65978 lt!605890)))

(declare-fun b!1377290 () Bool)

(declare-fun lt!605894 () Unit!45673)

(assert (=> b!1377290 (= e!780170 lt!605894)))

(declare-fun lt!605892 () Unit!45673)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93549 (_ BitVec 32) (_ BitVec 32)) Unit!45673)

(assert (=> b!1377290 (= lt!605892 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377290 (= call!65977 (bvadd #b00000000000000000000000000000001 lt!605889))))

(assert (=> b!1377290 (= lt!605894 (lemmaValidKeyIncreasesNumOfKeys!0 lt!605891 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377290 (= call!65978 (bvadd #b00000000000000000000000000000001 lt!605890))))

(declare-fun b!1377291 () Bool)

(declare-fun res!920048 () Bool)

(assert (=> b!1377291 (=> (not res!920048) (not e!780172))))

(assert (=> b!1377291 (= res!920048 (validKeyInArray!0 (select (arr!45178 a!4032) i!1445)))))

(declare-fun b!1377292 () Bool)

(assert (=> b!1377292 (= e!780171 (bvsge (bvsub (size!45728 a!4032) to!206) (bvsub (bvadd #b00000000000000000000000000000001 (size!45728 a!4032)) to!206)))))

(declare-fun bm!65975 () Bool)

(assert (=> bm!65975 (= call!65977 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(assert (= (and start!116880 res!920047) b!1377291))

(assert (= (and b!1377291 res!920048) b!1377286))

(assert (= (and b!1377286 res!920045) b!1377288))

(assert (= (and b!1377288 res!920044) b!1377285))

(assert (= (and b!1377285 res!920049) b!1377284))

(assert (= (and b!1377284 c!128060) b!1377290))

(assert (= (and b!1377284 (not c!128060)) b!1377289))

(assert (= (or b!1377290 b!1377289) bm!65974))

(assert (= (or b!1377290 b!1377289) bm!65975))

(assert (= (and b!1377284 res!920046) b!1377287))

(assert (= (and b!1377287 res!920050) b!1377292))

(declare-fun m!1261531 () Bool)

(assert (=> b!1377285 m!1261531))

(declare-fun m!1261533 () Bool)

(assert (=> b!1377285 m!1261533))

(declare-fun m!1261535 () Bool)

(assert (=> b!1377285 m!1261535))

(declare-fun m!1261537 () Bool)

(assert (=> b!1377286 m!1261537))

(declare-fun m!1261539 () Bool)

(assert (=> bm!65975 m!1261539))

(declare-fun m!1261541 () Bool)

(assert (=> b!1377291 m!1261541))

(assert (=> b!1377291 m!1261541))

(declare-fun m!1261543 () Bool)

(assert (=> b!1377291 m!1261543))

(declare-fun m!1261545 () Bool)

(assert (=> start!116880 m!1261545))

(declare-fun m!1261547 () Bool)

(assert (=> b!1377289 m!1261547))

(declare-fun m!1261549 () Bool)

(assert (=> b!1377289 m!1261549))

(declare-fun m!1261551 () Bool)

(assert (=> b!1377287 m!1261551))

(assert (=> b!1377287 m!1261539))

(assert (=> bm!65974 m!1261551))

(declare-fun m!1261553 () Bool)

(assert (=> b!1377290 m!1261553))

(declare-fun m!1261555 () Bool)

(assert (=> b!1377290 m!1261555))

(declare-fun m!1261557 () Bool)

(assert (=> b!1377284 m!1261557))

(assert (=> b!1377284 m!1261557))

(declare-fun m!1261559 () Bool)

(assert (=> b!1377284 m!1261559))

(push 1)

(assert (not b!1377284))

(assert (not b!1377286))

(assert (not b!1377291))

(assert (not b!1377285))

(assert (not bm!65975))

(assert (not start!116880))

(assert (not b!1377290))

(assert (not b!1377287))

(assert (not b!1377289))

(assert (not bm!65974))

(check-sat)

(pop 1)

(push 1)

(check-sat)

