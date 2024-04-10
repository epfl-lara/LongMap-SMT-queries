; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71808 () Bool)

(assert start!71808)

(declare-datatypes ((array!46718 0))(
  ( (array!46719 (arr!22393 (Array (_ BitVec 32) (_ BitVec 64))) (size!22814 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46718)

(declare-fun bm!36586 () Bool)

(declare-fun call!36589 () (_ BitVec 32))

(declare-fun lt!379261 () array!46718)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun c!90920 () Bool)

(declare-fun arrayCountValidKeys!0 (array!46718 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!36586 (= call!36589 (arrayCountValidKeys!0 (ite c!90920 a!4227 lt!379261) (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun res!567542 () Bool)

(declare-fun e!465648 () Bool)

(assert (=> start!71808 (=> (not res!567542) (not e!465648))))

(assert (=> start!71808 (= res!567542 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22814 a!4227))))))

(assert (=> start!71808 e!465648))

(assert (=> start!71808 true))

(declare-fun array_inv!17840 (array!46718) Bool)

(assert (=> start!71808 (array_inv!17840 a!4227)))

(declare-fun b!834589 () Bool)

(declare-fun res!567544 () Bool)

(assert (=> b!834589 (=> (not res!567544) (not e!465648))))

(assert (=> b!834589 (= res!567544 (and (bvslt (size!22814 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22814 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!834590 () Bool)

(declare-datatypes ((Unit!28679 0))(
  ( (Unit!28680) )
))
(declare-fun e!465649 () Unit!28679)

(declare-fun lt!379265 () Unit!28679)

(assert (=> b!834590 (= e!465649 lt!379265)))

(declare-fun lt!379267 () Unit!28679)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46718 (_ BitVec 32) (_ BitVec 32)) Unit!28679)

(assert (=> b!834590 (= lt!379267 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!379263 () (_ BitVec 32))

(assert (=> b!834590 (= call!36589 (bvadd #b00000000000000000000000000000001 lt!379263))))

(assert (=> b!834590 (= lt!379265 (lemmaValidKeyIncreasesNumOfKeys!0 lt!379261 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36590 () (_ BitVec 32))

(declare-fun lt!379268 () (_ BitVec 32))

(assert (=> b!834590 (= call!36590 (bvadd #b00000000000000000000000000000001 lt!379268))))

(declare-fun b!834591 () Bool)

(declare-fun e!465651 () Bool)

(assert (=> b!834591 (= e!465648 e!465651)))

(declare-fun res!567543 () Bool)

(assert (=> b!834591 (=> (not res!567543) (not e!465651))))

(assert (=> b!834591 (= res!567543 (and (= lt!379268 lt!379263) (not (= to!390 (size!22814 a!4227)))))))

(assert (=> b!834591 (= lt!379263 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834591 (= lt!379268 (arrayCountValidKeys!0 lt!379261 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun k0!2968 () (_ BitVec 64))

(assert (=> b!834591 (= lt!379261 (array!46719 (store (arr!22393 a!4227) i!1466 k0!2968) (size!22814 a!4227)))))

(declare-fun b!834592 () Bool)

(declare-fun e!465647 () Bool)

(assert (=> b!834592 (= e!465651 e!465647)))

(declare-fun res!567541 () Bool)

(assert (=> b!834592 (=> (not res!567541) (not e!465647))))

(assert (=> b!834592 (= res!567541 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22814 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-fun lt!379269 () Unit!28679)

(assert (=> b!834592 (= lt!379269 e!465649)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834592 (= c!90920 (validKeyInArray!0 (select (arr!22393 a!4227) to!390)))))

(declare-fun b!834593 () Bool)

(declare-fun res!567540 () Bool)

(assert (=> b!834593 (=> (not res!567540) (not e!465648))))

(assert (=> b!834593 (= res!567540 (validKeyInArray!0 k0!2968))))

(declare-fun b!834594 () Bool)

(assert (=> b!834594 (= e!465647 false)))

(declare-fun lt!379270 () (_ BitVec 32))

(assert (=> b!834594 (= lt!379270 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun lt!379266 () (_ BitVec 32))

(assert (=> b!834594 (= lt!379266 (arrayCountValidKeys!0 lt!379261 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834595 () Bool)

(declare-fun res!567545 () Bool)

(assert (=> b!834595 (=> (not res!567545) (not e!465648))))

(assert (=> b!834595 (= res!567545 (not (validKeyInArray!0 (select (arr!22393 a!4227) i!1466))))))

(declare-fun bm!36587 () Bool)

(assert (=> bm!36587 (= call!36590 (arrayCountValidKeys!0 (ite c!90920 lt!379261 a!4227) (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834596 () Bool)

(declare-fun lt!379264 () Unit!28679)

(assert (=> b!834596 (= e!465649 lt!379264)))

(declare-fun lt!379262 () Unit!28679)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46718 (_ BitVec 32) (_ BitVec 32)) Unit!28679)

(assert (=> b!834596 (= lt!379262 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834596 (= call!36590 lt!379263)))

(assert (=> b!834596 (= lt!379264 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!379261 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834596 (= call!36589 lt!379268)))

(assert (= (and start!71808 res!567542) b!834595))

(assert (= (and b!834595 res!567545) b!834593))

(assert (= (and b!834593 res!567540) b!834589))

(assert (= (and b!834589 res!567544) b!834591))

(assert (= (and b!834591 res!567543) b!834592))

(assert (= (and b!834592 c!90920) b!834590))

(assert (= (and b!834592 (not c!90920)) b!834596))

(assert (= (or b!834590 b!834596) bm!36587))

(assert (= (or b!834590 b!834596) bm!36586))

(assert (= (and b!834592 res!567541) b!834594))

(declare-fun m!779617 () Bool)

(assert (=> b!834594 m!779617))

(declare-fun m!779619 () Bool)

(assert (=> b!834594 m!779619))

(declare-fun m!779621 () Bool)

(assert (=> b!834591 m!779621))

(declare-fun m!779623 () Bool)

(assert (=> b!834591 m!779623))

(declare-fun m!779625 () Bool)

(assert (=> b!834591 m!779625))

(declare-fun m!779627 () Bool)

(assert (=> b!834590 m!779627))

(declare-fun m!779629 () Bool)

(assert (=> b!834590 m!779629))

(declare-fun m!779631 () Bool)

(assert (=> b!834595 m!779631))

(assert (=> b!834595 m!779631))

(declare-fun m!779633 () Bool)

(assert (=> b!834595 m!779633))

(declare-fun m!779635 () Bool)

(assert (=> b!834596 m!779635))

(declare-fun m!779637 () Bool)

(assert (=> b!834596 m!779637))

(declare-fun m!779639 () Bool)

(assert (=> b!834592 m!779639))

(assert (=> b!834592 m!779639))

(declare-fun m!779641 () Bool)

(assert (=> b!834592 m!779641))

(declare-fun m!779643 () Bool)

(assert (=> b!834593 m!779643))

(declare-fun m!779645 () Bool)

(assert (=> bm!36586 m!779645))

(declare-fun m!779647 () Bool)

(assert (=> start!71808 m!779647))

(declare-fun m!779649 () Bool)

(assert (=> bm!36587 m!779649))

(check-sat (not b!834596) (not b!834595) (not b!834593) (not b!834592) (not bm!36587) (not start!71808) (not b!834590) (not bm!36586) (not b!834591) (not b!834594))
(check-sat)
