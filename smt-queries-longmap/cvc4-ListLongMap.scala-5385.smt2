; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71912 () Bool)

(assert start!71912)

(declare-fun b!835613 () Bool)

(declare-fun res!568471 () Bool)

(declare-fun e!466152 () Bool)

(assert (=> b!835613 (=> (not res!568471) (not e!466152))))

(declare-datatypes ((array!46822 0))(
  ( (array!46823 (arr!22445 (Array (_ BitVec 32) (_ BitVec 64))) (size!22866 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46822)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835613 (= res!568471 (not (validKeyInArray!0 (select (arr!22445 a!4227) i!1466))))))

(declare-fun b!835614 () Bool)

(declare-fun e!466149 () Bool)

(assert (=> b!835614 (= e!466149 false)))

(declare-datatypes ((Unit!28735 0))(
  ( (Unit!28736) )
))
(declare-fun lt!379838 () Unit!28735)

(declare-fun e!466151 () Unit!28735)

(assert (=> b!835614 (= lt!379838 e!466151)))

(declare-fun c!90968 () Bool)

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!835614 (= c!90968 (validKeyInArray!0 (select (arr!22445 a!4227) to!390)))))

(declare-fun call!36686 () (_ BitVec 32))

(declare-fun lt!379839 () array!46822)

(declare-fun bm!36682 () Bool)

(declare-fun arrayCountValidKeys!0 (array!46822 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!36682 (= call!36686 (arrayCountValidKeys!0 lt!379839 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835615 () Bool)

(declare-fun res!568469 () Bool)

(assert (=> b!835615 (=> (not res!568469) (not e!466152))))

(declare-fun k!2968 () (_ BitVec 64))

(assert (=> b!835615 (= res!568469 (validKeyInArray!0 k!2968))))

(declare-fun b!835616 () Bool)

(assert (=> b!835616 (= e!466152 e!466149)))

(declare-fun res!568470 () Bool)

(assert (=> b!835616 (=> (not res!568470) (not e!466149))))

(declare-fun lt!379836 () (_ BitVec 32))

(declare-fun lt!379833 () (_ BitVec 32))

(assert (=> b!835616 (= res!568470 (and (= lt!379836 lt!379833) (not (= to!390 (size!22866 a!4227)))))))

(assert (=> b!835616 (= lt!379833 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835616 (= lt!379836 (arrayCountValidKeys!0 lt!379839 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835616 (= lt!379839 (array!46823 (store (arr!22445 a!4227) i!1466 k!2968) (size!22866 a!4227)))))

(declare-fun res!568468 () Bool)

(assert (=> start!71912 (=> (not res!568468) (not e!466152))))

(assert (=> start!71912 (= res!568468 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22866 a!4227))))))

(assert (=> start!71912 e!466152))

(assert (=> start!71912 true))

(declare-fun array_inv!17892 (array!46822) Bool)

(assert (=> start!71912 (array_inv!17892 a!4227)))

(declare-fun call!36685 () (_ BitVec 32))

(declare-fun bm!36683 () Bool)

(assert (=> bm!36683 (= call!36685 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835617 () Bool)

(declare-fun lt!379834 () Unit!28735)

(assert (=> b!835617 (= e!466151 lt!379834)))

(declare-fun lt!379837 () Unit!28735)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46822 (_ BitVec 32) (_ BitVec 32)) Unit!28735)

(assert (=> b!835617 (= lt!379837 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835617 (= call!36685 (bvadd #b00000000000000000000000000000001 lt!379833))))

(assert (=> b!835617 (= lt!379834 (lemmaValidKeyIncreasesNumOfKeys!0 lt!379839 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835617 (= call!36686 (bvadd #b00000000000000000000000000000001 lt!379836))))

(declare-fun b!835618 () Bool)

(declare-fun res!568472 () Bool)

(assert (=> b!835618 (=> (not res!568472) (not e!466152))))

(assert (=> b!835618 (= res!568472 (and (bvslt (size!22866 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22866 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!835619 () Bool)

(declare-fun lt!379840 () Unit!28735)

(assert (=> b!835619 (= e!466151 lt!379840)))

(declare-fun lt!379835 () Unit!28735)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46822 (_ BitVec 32) (_ BitVec 32)) Unit!28735)

(assert (=> b!835619 (= lt!379835 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835619 (= call!36685 lt!379833)))

(assert (=> b!835619 (= lt!379840 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!379839 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835619 (= call!36686 lt!379836)))

(assert (= (and start!71912 res!568468) b!835613))

(assert (= (and b!835613 res!568471) b!835615))

(assert (= (and b!835615 res!568469) b!835618))

(assert (= (and b!835618 res!568472) b!835616))

(assert (= (and b!835616 res!568470) b!835614))

(assert (= (and b!835614 c!90968) b!835617))

(assert (= (and b!835614 (not c!90968)) b!835619))

(assert (= (or b!835617 b!835619) bm!36682))

(assert (= (or b!835617 b!835619) bm!36683))

(declare-fun m!780825 () Bool)

(assert (=> bm!36683 m!780825))

(declare-fun m!780827 () Bool)

(assert (=> b!835613 m!780827))

(assert (=> b!835613 m!780827))

(declare-fun m!780829 () Bool)

(assert (=> b!835613 m!780829))

(declare-fun m!780831 () Bool)

(assert (=> b!835616 m!780831))

(declare-fun m!780833 () Bool)

(assert (=> b!835616 m!780833))

(declare-fun m!780835 () Bool)

(assert (=> b!835616 m!780835))

(declare-fun m!780837 () Bool)

(assert (=> b!835614 m!780837))

(assert (=> b!835614 m!780837))

(declare-fun m!780839 () Bool)

(assert (=> b!835614 m!780839))

(declare-fun m!780841 () Bool)

(assert (=> b!835619 m!780841))

(declare-fun m!780843 () Bool)

(assert (=> b!835619 m!780843))

(declare-fun m!780845 () Bool)

(assert (=> bm!36682 m!780845))

(declare-fun m!780847 () Bool)

(assert (=> b!835617 m!780847))

(declare-fun m!780849 () Bool)

(assert (=> b!835617 m!780849))

(declare-fun m!780851 () Bool)

(assert (=> start!71912 m!780851))

(declare-fun m!780853 () Bool)

(assert (=> b!835615 m!780853))

(push 1)

(assert (not b!835614))

(assert (not b!835617))

(assert (not b!835619))

(assert (not b!835615))

(assert (not b!835613))

(assert (not bm!36682))

(assert (not b!835616))

