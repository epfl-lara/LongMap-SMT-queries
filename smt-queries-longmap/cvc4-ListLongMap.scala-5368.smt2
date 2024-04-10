; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71810 () Bool)

(assert start!71810)

(declare-fun b!834613 () Bool)

(declare-fun res!567558 () Bool)

(declare-fun e!465666 () Bool)

(assert (=> b!834613 (=> (not res!567558) (not e!465666))))

(declare-datatypes ((array!46720 0))(
  ( (array!46721 (arr!22394 (Array (_ BitVec 32) (_ BitVec 64))) (size!22815 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46720)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!834613 (= res!567558 (and (bvslt (size!22815 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22815 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!834614 () Bool)

(declare-fun e!465662 () Bool)

(declare-fun e!465664 () Bool)

(assert (=> b!834614 (= e!465662 e!465664)))

(declare-fun res!567562 () Bool)

(assert (=> b!834614 (=> (not res!567562) (not e!465664))))

(assert (=> b!834614 (= res!567562 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22815 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-datatypes ((Unit!28681 0))(
  ( (Unit!28682) )
))
(declare-fun lt!379297 () Unit!28681)

(declare-fun e!465663 () Unit!28681)

(assert (=> b!834614 (= lt!379297 e!465663)))

(declare-fun c!90923 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834614 (= c!90923 (validKeyInArray!0 (select (arr!22394 a!4227) to!390)))))

(declare-fun b!834615 () Bool)

(assert (=> b!834615 (= e!465664 false)))

(declare-fun lt!379296 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46720 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!834615 (= lt!379296 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun lt!379300 () (_ BitVec 32))

(declare-fun lt!379292 () array!46720)

(assert (=> b!834615 (= lt!379300 (arrayCountValidKeys!0 lt!379292 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun call!36595 () (_ BitVec 32))

(declare-fun bm!36592 () Bool)

(assert (=> bm!36592 (= call!36595 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834617 () Bool)

(declare-fun lt!379298 () Unit!28681)

(assert (=> b!834617 (= e!465663 lt!379298)))

(declare-fun lt!379293 () Unit!28681)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46720 (_ BitVec 32) (_ BitVec 32)) Unit!28681)

(assert (=> b!834617 (= lt!379293 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!379291 () (_ BitVec 32))

(assert (=> b!834617 (= call!36595 lt!379291)))

(assert (=> b!834617 (= lt!379298 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!379292 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36596 () (_ BitVec 32))

(declare-fun lt!379294 () (_ BitVec 32))

(assert (=> b!834617 (= call!36596 lt!379294)))

(declare-fun bm!36593 () Bool)

(assert (=> bm!36593 (= call!36596 (arrayCountValidKeys!0 lt!379292 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834618 () Bool)

(declare-fun lt!379299 () Unit!28681)

(assert (=> b!834618 (= e!465663 lt!379299)))

(declare-fun lt!379295 () Unit!28681)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46720 (_ BitVec 32) (_ BitVec 32)) Unit!28681)

(assert (=> b!834618 (= lt!379295 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834618 (= call!36595 (bvadd #b00000000000000000000000000000001 lt!379291))))

(assert (=> b!834618 (= lt!379299 (lemmaValidKeyIncreasesNumOfKeys!0 lt!379292 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834618 (= call!36596 (bvadd #b00000000000000000000000000000001 lt!379294))))

(declare-fun b!834616 () Bool)

(declare-fun res!567563 () Bool)

(assert (=> b!834616 (=> (not res!567563) (not e!465666))))

(assert (=> b!834616 (= res!567563 (not (validKeyInArray!0 (select (arr!22394 a!4227) i!1466))))))

(declare-fun res!567559 () Bool)

(assert (=> start!71810 (=> (not res!567559) (not e!465666))))

(assert (=> start!71810 (= res!567559 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22815 a!4227))))))

(assert (=> start!71810 e!465666))

(assert (=> start!71810 true))

(declare-fun array_inv!17841 (array!46720) Bool)

(assert (=> start!71810 (array_inv!17841 a!4227)))

(declare-fun b!834619 () Bool)

(assert (=> b!834619 (= e!465666 e!465662)))

(declare-fun res!567561 () Bool)

(assert (=> b!834619 (=> (not res!567561) (not e!465662))))

(assert (=> b!834619 (= res!567561 (and (= lt!379294 lt!379291) (not (= to!390 (size!22815 a!4227)))))))

(assert (=> b!834619 (= lt!379291 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834619 (= lt!379294 (arrayCountValidKeys!0 lt!379292 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun k!2968 () (_ BitVec 64))

(assert (=> b!834619 (= lt!379292 (array!46721 (store (arr!22394 a!4227) i!1466 k!2968) (size!22815 a!4227)))))

(declare-fun b!834620 () Bool)

(declare-fun res!567560 () Bool)

(assert (=> b!834620 (=> (not res!567560) (not e!465666))))

(assert (=> b!834620 (= res!567560 (validKeyInArray!0 k!2968))))

(assert (= (and start!71810 res!567559) b!834616))

(assert (= (and b!834616 res!567563) b!834620))

(assert (= (and b!834620 res!567560) b!834613))

(assert (= (and b!834613 res!567558) b!834619))

(assert (= (and b!834619 res!567561) b!834614))

(assert (= (and b!834614 c!90923) b!834618))

(assert (= (and b!834614 (not c!90923)) b!834617))

(assert (= (or b!834618 b!834617) bm!36593))

(assert (= (or b!834618 b!834617) bm!36592))

(assert (= (and b!834614 res!567562) b!834615))

(declare-fun m!779651 () Bool)

(assert (=> b!834617 m!779651))

(declare-fun m!779653 () Bool)

(assert (=> b!834617 m!779653))

(declare-fun m!779655 () Bool)

(assert (=> b!834619 m!779655))

(declare-fun m!779657 () Bool)

(assert (=> b!834619 m!779657))

(declare-fun m!779659 () Bool)

(assert (=> b!834619 m!779659))

(declare-fun m!779661 () Bool)

(assert (=> b!834618 m!779661))

(declare-fun m!779663 () Bool)

(assert (=> b!834618 m!779663))

(declare-fun m!779665 () Bool)

(assert (=> bm!36593 m!779665))

(declare-fun m!779667 () Bool)

(assert (=> b!834614 m!779667))

(assert (=> b!834614 m!779667))

(declare-fun m!779669 () Bool)

(assert (=> b!834614 m!779669))

(declare-fun m!779671 () Bool)

(assert (=> start!71810 m!779671))

(declare-fun m!779673 () Bool)

(assert (=> b!834615 m!779673))

(assert (=> b!834615 m!779665))

(declare-fun m!779675 () Bool)

(assert (=> b!834616 m!779675))

(assert (=> b!834616 m!779675))

(declare-fun m!779677 () Bool)

(assert (=> b!834616 m!779677))

(assert (=> bm!36592 m!779673))

(declare-fun m!779679 () Bool)

(assert (=> b!834620 m!779679))

(push 1)

(assert (not b!834615))

(assert (not start!71810))

(assert (not b!834617))

(assert (not b!834620))

(assert (not b!834614))

(assert (not b!834616))

(assert (not bm!36592))

(assert (not b!834619))

