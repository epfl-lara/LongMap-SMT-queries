; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71812 () Bool)

(assert start!71812)

(declare-fun b!834639 () Bool)

(declare-fun res!567579 () Bool)

(declare-fun e!465677 () Bool)

(assert (=> b!834639 (=> (not res!567579) (not e!465677))))

(declare-datatypes ((array!46722 0))(
  ( (array!46723 (arr!22395 (Array (_ BitVec 32) (_ BitVec 64))) (size!22816 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46722)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!834639 (= res!567579 (and (bvslt (size!22816 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22816 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!834640 () Bool)

(declare-fun res!567582 () Bool)

(assert (=> b!834640 (=> (not res!567582) (not e!465677))))

(declare-fun k!2968 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834640 (= res!567582 (validKeyInArray!0 k!2968))))

(declare-fun b!834641 () Bool)

(declare-fun e!465679 () Bool)

(assert (=> b!834641 (= e!465679 (not (bvsge (bvadd #b00000000000000000000000000000001 i!1466) #b00000000000000000000000000000000)))))

(declare-fun lt!379320 () array!46722)

(declare-fun arrayCountValidKeys!0 (array!46722 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!834641 (= (arrayCountValidKeys!0 lt!379320 (bvadd #b00000000000000000000000000000001 i!1466) (size!22816 a!4227)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (size!22816 a!4227)))))

(declare-datatypes ((Unit!28683 0))(
  ( (Unit!28684) )
))
(declare-fun lt!379327 () Unit!28683)

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!46722 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!28683)

(assert (=> b!834641 (= lt!379327 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4227 i!1466 k!2968 (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun res!567578 () Bool)

(assert (=> start!71812 (=> (not res!567578) (not e!465677))))

(assert (=> start!71812 (= res!567578 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22816 a!4227))))))

(assert (=> start!71812 e!465677))

(assert (=> start!71812 true))

(declare-fun array_inv!17842 (array!46722) Bool)

(assert (=> start!71812 (array_inv!17842 a!4227)))

(declare-fun b!834642 () Bool)

(declare-fun e!465678 () Bool)

(assert (=> b!834642 (= e!465677 e!465678)))

(declare-fun res!567583 () Bool)

(assert (=> b!834642 (=> (not res!567583) (not e!465678))))

(declare-fun lt!379326 () (_ BitVec 32))

(declare-fun lt!379319 () (_ BitVec 32))

(assert (=> b!834642 (= res!567583 (and (= lt!379326 lt!379319) (not (= to!390 (size!22816 a!4227)))))))

(assert (=> b!834642 (= lt!379319 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834642 (= lt!379326 (arrayCountValidKeys!0 lt!379320 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834642 (= lt!379320 (array!46723 (store (arr!22395 a!4227) i!1466 k!2968) (size!22816 a!4227)))))

(declare-fun b!834643 () Bool)

(declare-fun e!465681 () Unit!28683)

(declare-fun lt!379322 () Unit!28683)

(assert (=> b!834643 (= e!465681 lt!379322)))

(declare-fun lt!379324 () Unit!28683)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46722 (_ BitVec 32) (_ BitVec 32)) Unit!28683)

(assert (=> b!834643 (= lt!379324 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36602 () (_ BitVec 32))

(assert (=> b!834643 (= call!36602 lt!379319)))

(assert (=> b!834643 (= lt!379322 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!379320 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36601 () (_ BitVec 32))

(assert (=> b!834643 (= call!36601 lt!379326)))

(declare-fun bm!36598 () Bool)

(assert (=> bm!36598 (= call!36601 (arrayCountValidKeys!0 lt!379320 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun bm!36599 () Bool)

(assert (=> bm!36599 (= call!36602 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834644 () Bool)

(assert (=> b!834644 (= e!465678 e!465679)))

(declare-fun res!567584 () Bool)

(assert (=> b!834644 (=> (not res!567584) (not e!465679))))

(assert (=> b!834644 (= res!567584 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22816 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-fun lt!379323 () Unit!28683)

(assert (=> b!834644 (= lt!379323 e!465681)))

(declare-fun c!90926 () Bool)

(assert (=> b!834644 (= c!90926 (validKeyInArray!0 (select (arr!22395 a!4227) to!390)))))

(declare-fun b!834645 () Bool)

(declare-fun res!567581 () Bool)

(assert (=> b!834645 (=> (not res!567581) (not e!465677))))

(assert (=> b!834645 (= res!567581 (not (validKeyInArray!0 (select (arr!22395 a!4227) i!1466))))))

(declare-fun b!834646 () Bool)

(declare-fun res!567580 () Bool)

(assert (=> b!834646 (=> (not res!567580) (not e!465679))))

(assert (=> b!834646 (= res!567580 (= (arrayCountValidKeys!0 lt!379320 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390))))))

(declare-fun b!834647 () Bool)

(declare-fun lt!379325 () Unit!28683)

(assert (=> b!834647 (= e!465681 lt!379325)))

(declare-fun lt!379321 () Unit!28683)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46722 (_ BitVec 32) (_ BitVec 32)) Unit!28683)

(assert (=> b!834647 (= lt!379321 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834647 (= call!36602 (bvadd #b00000000000000000000000000000001 lt!379319))))

(assert (=> b!834647 (= lt!379325 (lemmaValidKeyIncreasesNumOfKeys!0 lt!379320 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834647 (= call!36601 (bvadd #b00000000000000000000000000000001 lt!379326))))

(assert (= (and start!71812 res!567578) b!834645))

(assert (= (and b!834645 res!567581) b!834640))

(assert (= (and b!834640 res!567582) b!834639))

(assert (= (and b!834639 res!567579) b!834642))

(assert (= (and b!834642 res!567583) b!834644))

(assert (= (and b!834644 c!90926) b!834647))

(assert (= (and b!834644 (not c!90926)) b!834643))

(assert (= (or b!834647 b!834643) bm!36598))

(assert (= (or b!834647 b!834643) bm!36599))

(assert (= (and b!834644 res!567584) b!834646))

(assert (= (and b!834646 res!567580) b!834641))

(declare-fun m!779681 () Bool)

(assert (=> b!834641 m!779681))

(declare-fun m!779683 () Bool)

(assert (=> b!834641 m!779683))

(declare-fun m!779685 () Bool)

(assert (=> b!834641 m!779685))

(declare-fun m!779687 () Bool)

(assert (=> bm!36598 m!779687))

(declare-fun m!779689 () Bool)

(assert (=> b!834642 m!779689))

(declare-fun m!779691 () Bool)

(assert (=> b!834642 m!779691))

(declare-fun m!779693 () Bool)

(assert (=> b!834642 m!779693))

(declare-fun m!779695 () Bool)

(assert (=> b!834647 m!779695))

(declare-fun m!779697 () Bool)

(assert (=> b!834647 m!779697))

(declare-fun m!779699 () Bool)

(assert (=> b!834644 m!779699))

(assert (=> b!834644 m!779699))

(declare-fun m!779701 () Bool)

(assert (=> b!834644 m!779701))

(declare-fun m!779703 () Bool)

(assert (=> b!834643 m!779703))

(declare-fun m!779705 () Bool)

(assert (=> b!834643 m!779705))

(declare-fun m!779707 () Bool)

(assert (=> start!71812 m!779707))

(declare-fun m!779709 () Bool)

(assert (=> b!834645 m!779709))

(assert (=> b!834645 m!779709))

(declare-fun m!779711 () Bool)

(assert (=> b!834645 m!779711))

(assert (=> b!834646 m!779687))

(declare-fun m!779713 () Bool)

(assert (=> b!834646 m!779713))

(declare-fun m!779715 () Bool)

(assert (=> b!834640 m!779715))

(assert (=> bm!36599 m!779713))

(push 1)

