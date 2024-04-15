; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71916 () Bool)

(assert start!71916)

(declare-fun b!835631 () Bool)

(declare-datatypes ((Unit!28707 0))(
  ( (Unit!28708) )
))
(declare-fun e!466156 () Unit!28707)

(declare-fun lt!379884 () Unit!28707)

(assert (=> b!835631 (= e!466156 lt!379884)))

(declare-datatypes ((array!46815 0))(
  ( (array!46816 (arr!22442 (Array (_ BitVec 32) (_ BitVec 64))) (size!22863 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46815)

(declare-fun lt!379887 () Unit!28707)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46815 (_ BitVec 32) (_ BitVec 32)) Unit!28707)

(assert (=> b!835631 (= lt!379887 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36731 () (_ BitVec 32))

(declare-fun lt!379886 () (_ BitVec 32))

(assert (=> b!835631 (= call!36731 (bvadd #b00000000000000000000000000000001 lt!379886))))

(declare-fun lt!379883 () array!46815)

(assert (=> b!835631 (= lt!379884 (lemmaValidKeyIncreasesNumOfKeys!0 lt!379883 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36732 () (_ BitVec 32))

(declare-fun lt!379882 () (_ BitVec 32))

(assert (=> b!835631 (= call!36732 (bvadd #b00000000000000000000000000000001 lt!379882))))

(declare-fun res!568552 () Bool)

(declare-fun e!466153 () Bool)

(assert (=> start!71916 (=> (not res!568552) (not e!466153))))

(assert (=> start!71916 (= res!568552 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22863 a!4227))))))

(assert (=> start!71916 e!466153))

(assert (=> start!71916 true))

(declare-fun array_inv!17954 (array!46815) Bool)

(assert (=> start!71916 (array_inv!17954 a!4227)))

(declare-fun bm!36728 () Bool)

(declare-fun arrayCountValidKeys!0 (array!46815 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!36728 (= call!36732 (arrayCountValidKeys!0 lt!379883 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835632 () Bool)

(declare-fun res!568555 () Bool)

(assert (=> b!835632 (=> (not res!568555) (not e!466153))))

(declare-fun k!2968 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835632 (= res!568555 (validKeyInArray!0 k!2968))))

(declare-fun b!835633 () Bool)

(declare-fun res!568553 () Bool)

(assert (=> b!835633 (=> (not res!568553) (not e!466153))))

(assert (=> b!835633 (= res!568553 (and (bvslt (size!22863 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22863 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun e!466157 () Bool)

(declare-fun b!835634 () Bool)

(assert (=> b!835634 (= e!466157 (not (= (arrayCountValidKeys!0 lt!379883 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))))

(declare-fun b!835635 () Bool)

(declare-fun res!568551 () Bool)

(assert (=> b!835635 (=> (not res!568551) (not e!466153))))

(assert (=> b!835635 (= res!568551 (not (validKeyInArray!0 (select (arr!22442 a!4227) i!1466))))))

(declare-fun bm!36729 () Bool)

(assert (=> bm!36729 (= call!36731 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835636 () Bool)

(declare-fun e!466154 () Bool)

(assert (=> b!835636 (= e!466154 e!466157)))

(declare-fun res!568554 () Bool)

(assert (=> b!835636 (=> (not res!568554) (not e!466157))))

(assert (=> b!835636 (= res!568554 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22863 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-fun lt!379888 () Unit!28707)

(assert (=> b!835636 (= lt!379888 e!466156)))

(declare-fun c!90936 () Bool)

(assert (=> b!835636 (= c!90936 (validKeyInArray!0 (select (arr!22442 a!4227) to!390)))))

(declare-fun b!835637 () Bool)

(assert (=> b!835637 (= e!466153 e!466154)))

(declare-fun res!568550 () Bool)

(assert (=> b!835637 (=> (not res!568550) (not e!466154))))

(assert (=> b!835637 (= res!568550 (and (= lt!379882 lt!379886) (not (= to!390 (size!22863 a!4227)))))))

(assert (=> b!835637 (= lt!379886 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835637 (= lt!379882 (arrayCountValidKeys!0 lt!379883 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835637 (= lt!379883 (array!46816 (store (arr!22442 a!4227) i!1466 k!2968) (size!22863 a!4227)))))

(declare-fun b!835638 () Bool)

(declare-fun lt!379889 () Unit!28707)

(assert (=> b!835638 (= e!466156 lt!379889)))

(declare-fun lt!379885 () Unit!28707)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46815 (_ BitVec 32) (_ BitVec 32)) Unit!28707)

(assert (=> b!835638 (= lt!379885 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835638 (= call!36731 lt!379886)))

(assert (=> b!835638 (= lt!379889 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!379883 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835638 (= call!36732 lt!379882)))

(assert (= (and start!71916 res!568552) b!835635))

(assert (= (and b!835635 res!568551) b!835632))

(assert (= (and b!835632 res!568555) b!835633))

(assert (= (and b!835633 res!568553) b!835637))

(assert (= (and b!835637 res!568550) b!835636))

(assert (= (and b!835636 c!90936) b!835631))

(assert (= (and b!835636 (not c!90936)) b!835638))

(assert (= (or b!835631 b!835638) bm!36728))

(assert (= (or b!835631 b!835638) bm!36729))

(assert (= (and b!835636 res!568554) b!835634))

(declare-fun m!780437 () Bool)

(assert (=> b!835634 m!780437))

(declare-fun m!780439 () Bool)

(assert (=> b!835634 m!780439))

(declare-fun m!780441 () Bool)

(assert (=> b!835637 m!780441))

(declare-fun m!780443 () Bool)

(assert (=> b!835637 m!780443))

(declare-fun m!780445 () Bool)

(assert (=> b!835637 m!780445))

(declare-fun m!780447 () Bool)

(assert (=> b!835635 m!780447))

(assert (=> b!835635 m!780447))

(declare-fun m!780449 () Bool)

(assert (=> b!835635 m!780449))

(declare-fun m!780451 () Bool)

(assert (=> b!835638 m!780451))

(declare-fun m!780453 () Bool)

(assert (=> b!835638 m!780453))

(declare-fun m!780455 () Bool)

(assert (=> b!835631 m!780455))

(declare-fun m!780457 () Bool)

(assert (=> b!835631 m!780457))

(assert (=> bm!36728 m!780437))

(assert (=> bm!36729 m!780439))

(declare-fun m!780459 () Bool)

(assert (=> b!835636 m!780459))

(assert (=> b!835636 m!780459))

(declare-fun m!780461 () Bool)

(assert (=> b!835636 m!780461))

(declare-fun m!780463 () Bool)

(assert (=> b!835632 m!780463))

(declare-fun m!780465 () Bool)

(assert (=> start!71916 m!780465))

(push 1)

(assert (not bm!36728))

(assert (not b!835634))

(assert (not b!835636))

(assert (not b!835631))

(assert (not b!835637))

(assert (not bm!36729))

(assert (not b!835635))

(assert (not start!71916))

(assert (not b!835638))

(assert (not b!835632))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

