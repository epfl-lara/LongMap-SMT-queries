; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71780 () Bool)

(assert start!71780)

(declare-fun b!834251 () Bool)

(declare-fun res!567366 () Bool)

(declare-fun e!465440 () Bool)

(assert (=> b!834251 (=> (not res!567366) (not e!465440))))

(declare-fun k0!2968 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834251 (= res!567366 (validKeyInArray!0 k0!2968))))

(declare-fun b!834252 () Bool)

(declare-datatypes ((Unit!28619 0))(
  ( (Unit!28620) )
))
(declare-fun e!465439 () Unit!28619)

(declare-fun lt!378905 () Unit!28619)

(assert (=> b!834252 (= e!465439 lt!378905)))

(declare-datatypes ((array!46679 0))(
  ( (array!46680 (arr!22374 (Array (_ BitVec 32) (_ BitVec 64))) (size!22795 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46679)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun lt!378909 () Unit!28619)

(declare-fun to!390 () (_ BitVec 32))

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46679 (_ BitVec 32) (_ BitVec 32)) Unit!28619)

(assert (=> b!834252 (= lt!378909 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36540 () (_ BitVec 32))

(declare-fun lt!378906 () (_ BitVec 32))

(assert (=> b!834252 (= call!36540 lt!378906)))

(declare-fun lt!378908 () array!46679)

(assert (=> b!834252 (= lt!378905 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!378908 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36539 () (_ BitVec 32))

(declare-fun lt!378902 () (_ BitVec 32))

(assert (=> b!834252 (= call!36539 lt!378902)))

(declare-fun b!834253 () Bool)

(declare-fun e!465443 () Bool)

(declare-fun e!465441 () Bool)

(assert (=> b!834253 (= e!465443 e!465441)))

(declare-fun res!567367 () Bool)

(assert (=> b!834253 (=> (not res!567367) (not e!465441))))

(assert (=> b!834253 (= res!567367 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22795 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-fun lt!378904 () Unit!28619)

(assert (=> b!834253 (= lt!378904 e!465439)))

(declare-fun c!90840 () Bool)

(assert (=> b!834253 (= c!90840 (validKeyInArray!0 (select (arr!22374 a!4227) to!390)))))

(declare-fun res!567362 () Bool)

(assert (=> start!71780 (=> (not res!567362) (not e!465440))))

(assert (=> start!71780 (= res!567362 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22795 a!4227))))))

(assert (=> start!71780 e!465440))

(assert (=> start!71780 true))

(declare-fun array_inv!17886 (array!46679) Bool)

(assert (=> start!71780 (array_inv!17886 a!4227)))

(declare-fun b!834254 () Bool)

(declare-fun res!567364 () Bool)

(assert (=> b!834254 (=> (not res!567364) (not e!465440))))

(assert (=> b!834254 (= res!567364 (not (validKeyInArray!0 (select (arr!22374 a!4227) i!1466))))))

(declare-fun b!834255 () Bool)

(assert (=> b!834255 (= e!465441 false)))

(declare-fun lt!378911 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46679 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!834255 (= lt!378911 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun lt!378907 () (_ BitVec 32))

(assert (=> b!834255 (= lt!378907 (arrayCountValidKeys!0 lt!378908 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834256 () Bool)

(declare-fun lt!378903 () Unit!28619)

(assert (=> b!834256 (= e!465439 lt!378903)))

(declare-fun lt!378910 () Unit!28619)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46679 (_ BitVec 32) (_ BitVec 32)) Unit!28619)

(assert (=> b!834256 (= lt!378910 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834256 (= call!36540 (bvadd #b00000000000000000000000000000001 lt!378906))))

(assert (=> b!834256 (= lt!378903 (lemmaValidKeyIncreasesNumOfKeys!0 lt!378908 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834256 (= call!36539 (bvadd #b00000000000000000000000000000001 lt!378902))))

(declare-fun bm!36536 () Bool)

(assert (=> bm!36536 (= call!36540 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834257 () Bool)

(assert (=> b!834257 (= e!465440 e!465443)))

(declare-fun res!567365 () Bool)

(assert (=> b!834257 (=> (not res!567365) (not e!465443))))

(assert (=> b!834257 (= res!567365 (and (= lt!378902 lt!378906) (not (= to!390 (size!22795 a!4227)))))))

(assert (=> b!834257 (= lt!378906 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834257 (= lt!378902 (arrayCountValidKeys!0 lt!378908 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834257 (= lt!378908 (array!46680 (store (arr!22374 a!4227) i!1466 k0!2968) (size!22795 a!4227)))))

(declare-fun b!834258 () Bool)

(declare-fun res!567363 () Bool)

(assert (=> b!834258 (=> (not res!567363) (not e!465440))))

(assert (=> b!834258 (= res!567363 (and (bvslt (size!22795 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22795 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun bm!36537 () Bool)

(assert (=> bm!36537 (= call!36539 (arrayCountValidKeys!0 lt!378908 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(assert (= (and start!71780 res!567362) b!834254))

(assert (= (and b!834254 res!567364) b!834251))

(assert (= (and b!834251 res!567366) b!834258))

(assert (= (and b!834258 res!567363) b!834257))

(assert (= (and b!834257 res!567365) b!834253))

(assert (= (and b!834253 c!90840) b!834256))

(assert (= (and b!834253 (not c!90840)) b!834252))

(assert (= (or b!834256 b!834252) bm!36537))

(assert (= (or b!834256 b!834252) bm!36536))

(assert (= (and b!834253 res!567367) b!834255))

(declare-fun m!778749 () Bool)

(assert (=> b!834256 m!778749))

(declare-fun m!778751 () Bool)

(assert (=> b!834256 m!778751))

(declare-fun m!778753 () Bool)

(assert (=> b!834255 m!778753))

(declare-fun m!778755 () Bool)

(assert (=> b!834255 m!778755))

(declare-fun m!778757 () Bool)

(assert (=> start!71780 m!778757))

(declare-fun m!778759 () Bool)

(assert (=> b!834257 m!778759))

(declare-fun m!778761 () Bool)

(assert (=> b!834257 m!778761))

(declare-fun m!778763 () Bool)

(assert (=> b!834257 m!778763))

(declare-fun m!778765 () Bool)

(assert (=> b!834253 m!778765))

(assert (=> b!834253 m!778765))

(declare-fun m!778767 () Bool)

(assert (=> b!834253 m!778767))

(declare-fun m!778769 () Bool)

(assert (=> b!834251 m!778769))

(declare-fun m!778771 () Bool)

(assert (=> b!834252 m!778771))

(declare-fun m!778773 () Bool)

(assert (=> b!834252 m!778773))

(declare-fun m!778775 () Bool)

(assert (=> b!834254 m!778775))

(assert (=> b!834254 m!778775))

(declare-fun m!778777 () Bool)

(assert (=> b!834254 m!778777))

(assert (=> bm!36537 m!778755))

(assert (=> bm!36536 m!778753))

(check-sat (not b!834255) (not bm!36537) (not b!834256) (not b!834254) (not b!834251) (not b!834252) (not start!71780) (not b!834257) (not b!834253) (not bm!36536))
(check-sat)
