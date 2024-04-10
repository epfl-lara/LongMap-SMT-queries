; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71806 () Bool)

(assert start!71806)

(declare-fun b!834565 () Bool)

(declare-fun e!465632 () Bool)

(declare-fun e!465636 () Bool)

(assert (=> b!834565 (= e!465632 e!465636)))

(declare-fun res!567523 () Bool)

(assert (=> b!834565 (=> (not res!567523) (not e!465636))))

(declare-datatypes ((array!46716 0))(
  ( (array!46717 (arr!22392 (Array (_ BitVec 32) (_ BitVec 64))) (size!22813 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46716)

(declare-fun lt!379232 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun lt!379235 () (_ BitVec 32))

(assert (=> b!834565 (= res!567523 (and (= lt!379235 lt!379232) (not (= to!390 (size!22813 a!4227)))))))

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46716 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!834565 (= lt!379232 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!379231 () array!46716)

(assert (=> b!834565 (= lt!379235 (arrayCountValidKeys!0 lt!379231 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun k!2968 () (_ BitVec 64))

(assert (=> b!834565 (= lt!379231 (array!46717 (store (arr!22392 a!4227) i!1466 k!2968) (size!22813 a!4227)))))

(declare-fun bm!36580 () Bool)

(declare-fun call!36584 () (_ BitVec 32))

(assert (=> bm!36580 (= call!36584 (arrayCountValidKeys!0 lt!379231 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun call!36583 () (_ BitVec 32))

(declare-fun bm!36581 () Bool)

(assert (=> bm!36581 (= call!36583 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun res!567527 () Bool)

(assert (=> start!71806 (=> (not res!567527) (not e!465632))))

(assert (=> start!71806 (= res!567527 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22813 a!4227))))))

(assert (=> start!71806 e!465632))

(assert (=> start!71806 true))

(declare-fun array_inv!17839 (array!46716) Bool)

(assert (=> start!71806 (array_inv!17839 a!4227)))

(declare-fun b!834566 () Bool)

(declare-fun res!567526 () Bool)

(assert (=> b!834566 (=> (not res!567526) (not e!465632))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834566 (= res!567526 (not (validKeyInArray!0 (select (arr!22392 a!4227) i!1466))))))

(declare-fun b!834567 () Bool)

(declare-datatypes ((Unit!28677 0))(
  ( (Unit!28678) )
))
(declare-fun e!465635 () Unit!28677)

(declare-fun lt!379239 () Unit!28677)

(assert (=> b!834567 (= e!465635 lt!379239)))

(declare-fun lt!379238 () Unit!28677)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46716 (_ BitVec 32) (_ BitVec 32)) Unit!28677)

(assert (=> b!834567 (= lt!379238 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834567 (= call!36583 lt!379232)))

(assert (=> b!834567 (= lt!379239 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!379231 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834567 (= call!36584 lt!379235)))

(declare-fun b!834568 () Bool)

(declare-fun e!465633 () Bool)

(assert (=> b!834568 (= e!465636 e!465633)))

(declare-fun res!567524 () Bool)

(assert (=> b!834568 (=> (not res!567524) (not e!465633))))

(assert (=> b!834568 (= res!567524 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22813 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-fun lt!379234 () Unit!28677)

(assert (=> b!834568 (= lt!379234 e!465635)))

(declare-fun c!90917 () Bool)

(assert (=> b!834568 (= c!90917 (validKeyInArray!0 (select (arr!22392 a!4227) to!390)))))

(declare-fun b!834569 () Bool)

(assert (=> b!834569 (= e!465633 false)))

(declare-fun lt!379237 () (_ BitVec 32))

(assert (=> b!834569 (= lt!379237 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun lt!379240 () (_ BitVec 32))

(assert (=> b!834569 (= lt!379240 (arrayCountValidKeys!0 lt!379231 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834570 () Bool)

(declare-fun res!567522 () Bool)

(assert (=> b!834570 (=> (not res!567522) (not e!465632))))

(assert (=> b!834570 (= res!567522 (and (bvslt (size!22813 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22813 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!834571 () Bool)

(declare-fun res!567525 () Bool)

(assert (=> b!834571 (=> (not res!567525) (not e!465632))))

(assert (=> b!834571 (= res!567525 (validKeyInArray!0 k!2968))))

(declare-fun b!834572 () Bool)

(declare-fun lt!379236 () Unit!28677)

(assert (=> b!834572 (= e!465635 lt!379236)))

(declare-fun lt!379233 () Unit!28677)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46716 (_ BitVec 32) (_ BitVec 32)) Unit!28677)

(assert (=> b!834572 (= lt!379233 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834572 (= call!36583 (bvadd #b00000000000000000000000000000001 lt!379232))))

(assert (=> b!834572 (= lt!379236 (lemmaValidKeyIncreasesNumOfKeys!0 lt!379231 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834572 (= call!36584 (bvadd #b00000000000000000000000000000001 lt!379235))))

(assert (= (and start!71806 res!567527) b!834566))

(assert (= (and b!834566 res!567526) b!834571))

(assert (= (and b!834571 res!567525) b!834570))

(assert (= (and b!834570 res!567522) b!834565))

(assert (= (and b!834565 res!567523) b!834568))

(assert (= (and b!834568 c!90917) b!834572))

(assert (= (and b!834568 (not c!90917)) b!834567))

(assert (= (or b!834572 b!834567) bm!36580))

(assert (= (or b!834572 b!834567) bm!36581))

(assert (= (and b!834568 res!567524) b!834569))

(declare-fun m!779587 () Bool)

(assert (=> b!834567 m!779587))

(declare-fun m!779589 () Bool)

(assert (=> b!834567 m!779589))

(declare-fun m!779591 () Bool)

(assert (=> b!834566 m!779591))

(assert (=> b!834566 m!779591))

(declare-fun m!779593 () Bool)

(assert (=> b!834566 m!779593))

(declare-fun m!779595 () Bool)

(assert (=> b!834571 m!779595))

(declare-fun m!779597 () Bool)

(assert (=> bm!36581 m!779597))

(declare-fun m!779599 () Bool)

(assert (=> b!834568 m!779599))

(assert (=> b!834568 m!779599))

(declare-fun m!779601 () Bool)

(assert (=> b!834568 m!779601))

(declare-fun m!779603 () Bool)

(assert (=> b!834565 m!779603))

(declare-fun m!779605 () Bool)

(assert (=> b!834565 m!779605))

(declare-fun m!779607 () Bool)

(assert (=> b!834565 m!779607))

(declare-fun m!779609 () Bool)

(assert (=> bm!36580 m!779609))

(assert (=> b!834569 m!779597))

(assert (=> b!834569 m!779609))

(declare-fun m!779611 () Bool)

(assert (=> start!71806 m!779611))

(declare-fun m!779613 () Bool)

(assert (=> b!834572 m!779613))

(declare-fun m!779615 () Bool)

(assert (=> b!834572 m!779615))

(push 1)

