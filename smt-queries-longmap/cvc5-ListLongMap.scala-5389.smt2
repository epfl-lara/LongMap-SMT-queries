; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72102 () Bool)

(assert start!72102)

(declare-fun res!569003 () Bool)

(declare-fun e!466883 () Bool)

(assert (=> start!72102 (=> (not res!569003) (not e!466883))))

(declare-fun i!1466 () (_ BitVec 32))

(declare-datatypes ((array!46849 0))(
  ( (array!46850 (arr!22454 (Array (_ BitVec 32) (_ BitVec 64))) (size!22874 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46849)

(assert (=> start!72102 (= res!569003 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22874 a!4227))))))

(assert (=> start!72102 e!466883))

(assert (=> start!72102 true))

(declare-fun array_inv!17940 (array!46849) Bool)

(assert (=> start!72102 (array_inv!17940 a!4227)))

(declare-fun bm!36799 () Bool)

(declare-fun lt!380482 () array!46849)

(declare-fun call!36803 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46849 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!36799 (= call!36803 (arrayCountValidKeys!0 lt!380482 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!836771 () Bool)

(declare-fun e!466884 () Bool)

(assert (=> b!836771 (= e!466884 (not (= (arrayCountValidKeys!0 lt!380482 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))))

(declare-fun b!836772 () Bool)

(declare-datatypes ((Unit!28772 0))(
  ( (Unit!28773) )
))
(declare-fun e!466885 () Unit!28772)

(declare-fun lt!380485 () Unit!28772)

(assert (=> b!836772 (= e!466885 lt!380485)))

(declare-fun lt!380480 () Unit!28772)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46849 (_ BitVec 32) (_ BitVec 32)) Unit!28772)

(assert (=> b!836772 (= lt!380480 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36802 () (_ BitVec 32))

(declare-fun lt!380484 () (_ BitVec 32))

(assert (=> b!836772 (= call!36802 (bvadd #b00000000000000000000000000000001 lt!380484))))

(assert (=> b!836772 (= lt!380485 (lemmaValidKeyIncreasesNumOfKeys!0 lt!380482 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!380483 () (_ BitVec 32))

(assert (=> b!836772 (= call!36803 (bvadd #b00000000000000000000000000000001 lt!380483))))

(declare-fun b!836773 () Bool)

(declare-fun res!569005 () Bool)

(assert (=> b!836773 (=> (not res!569005) (not e!466883))))

(declare-fun k!2968 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!836773 (= res!569005 (validKeyInArray!0 k!2968))))

(declare-fun b!836774 () Bool)

(declare-fun res!569002 () Bool)

(assert (=> b!836774 (=> (not res!569002) (not e!466883))))

(assert (=> b!836774 (= res!569002 (not (validKeyInArray!0 (select (arr!22454 a!4227) i!1466))))))

(declare-fun bm!36800 () Bool)

(assert (=> bm!36800 (= call!36802 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!836775 () Bool)

(declare-fun res!569004 () Bool)

(assert (=> b!836775 (=> (not res!569004) (not e!466883))))

(assert (=> b!836775 (= res!569004 (and (bvslt (size!22874 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22874 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!836776 () Bool)

(declare-fun e!466881 () Bool)

(assert (=> b!836776 (= e!466881 e!466884)))

(declare-fun res!569007 () Bool)

(assert (=> b!836776 (=> (not res!569007) (not e!466884))))

(assert (=> b!836776 (= res!569007 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22874 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-fun lt!380486 () Unit!28772)

(assert (=> b!836776 (= lt!380486 e!466885)))

(declare-fun c!91283 () Bool)

(assert (=> b!836776 (= c!91283 (validKeyInArray!0 (select (arr!22454 a!4227) to!390)))))

(declare-fun b!836777 () Bool)

(assert (=> b!836777 (= e!466883 e!466881)))

(declare-fun res!569006 () Bool)

(assert (=> b!836777 (=> (not res!569006) (not e!466881))))

(assert (=> b!836777 (= res!569006 (and (= lt!380483 lt!380484) (not (= to!390 (size!22874 a!4227)))))))

(assert (=> b!836777 (= lt!380484 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!836777 (= lt!380483 (arrayCountValidKeys!0 lt!380482 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!836777 (= lt!380482 (array!46850 (store (arr!22454 a!4227) i!1466 k!2968) (size!22874 a!4227)))))

(declare-fun b!836778 () Bool)

(declare-fun lt!380481 () Unit!28772)

(assert (=> b!836778 (= e!466885 lt!380481)))

(declare-fun lt!380479 () Unit!28772)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46849 (_ BitVec 32) (_ BitVec 32)) Unit!28772)

(assert (=> b!836778 (= lt!380479 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!836778 (= call!36802 lt!380484)))

(assert (=> b!836778 (= lt!380481 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!380482 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!836778 (= call!36803 lt!380483)))

(assert (= (and start!72102 res!569003) b!836774))

(assert (= (and b!836774 res!569002) b!836773))

(assert (= (and b!836773 res!569005) b!836775))

(assert (= (and b!836775 res!569004) b!836777))

(assert (= (and b!836777 res!569006) b!836776))

(assert (= (and b!836776 c!91283) b!836772))

(assert (= (and b!836776 (not c!91283)) b!836778))

(assert (= (or b!836772 b!836778) bm!36799))

(assert (= (or b!836772 b!836778) bm!36800))

(assert (= (and b!836776 res!569007) b!836771))

(declare-fun m!782479 () Bool)

(assert (=> b!836776 m!782479))

(assert (=> b!836776 m!782479))

(declare-fun m!782481 () Bool)

(assert (=> b!836776 m!782481))

(declare-fun m!782483 () Bool)

(assert (=> start!72102 m!782483))

(declare-fun m!782485 () Bool)

(assert (=> bm!36799 m!782485))

(declare-fun m!782487 () Bool)

(assert (=> b!836773 m!782487))

(declare-fun m!782489 () Bool)

(assert (=> bm!36800 m!782489))

(declare-fun m!782491 () Bool)

(assert (=> b!836777 m!782491))

(declare-fun m!782493 () Bool)

(assert (=> b!836777 m!782493))

(declare-fun m!782495 () Bool)

(assert (=> b!836777 m!782495))

(declare-fun m!782497 () Bool)

(assert (=> b!836772 m!782497))

(declare-fun m!782499 () Bool)

(assert (=> b!836772 m!782499))

(declare-fun m!782501 () Bool)

(assert (=> b!836778 m!782501))

(declare-fun m!782503 () Bool)

(assert (=> b!836778 m!782503))

(declare-fun m!782505 () Bool)

(assert (=> b!836774 m!782505))

(assert (=> b!836774 m!782505))

(declare-fun m!782507 () Bool)

(assert (=> b!836774 m!782507))

(assert (=> b!836771 m!782485))

(assert (=> b!836771 m!782489))

(push 1)

(assert (not b!836777))

(assert (not bm!36799))

(assert (not start!72102))

(assert (not b!836772))

(assert (not b!836774))

(assert (not b!836773))

(assert (not bm!36800))

(assert (not b!836778))

(assert (not b!836771))

(assert (not b!836776))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

