; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71822 () Bool)

(assert start!71822)

(declare-fun call!36631 () (_ BitVec 32))

(declare-datatypes ((array!46732 0))(
  ( (array!46733 (arr!22400 (Array (_ BitVec 32) (_ BitVec 64))) (size!22821 (_ BitVec 32))) )
))
(declare-fun lt!379455 () array!46732)

(declare-fun bm!36628 () Bool)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46732 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!36628 (= call!36631 (arrayCountValidKeys!0 lt!379455 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun res!567687 () Bool)

(declare-fun e!465755 () Bool)

(assert (=> start!71822 (=> (not res!567687) (not e!465755))))

(declare-fun a!4227 () array!46732)

(assert (=> start!71822 (= res!567687 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22821 a!4227))))))

(assert (=> start!71822 e!465755))

(assert (=> start!71822 true))

(declare-fun array_inv!17847 (array!46732) Bool)

(assert (=> start!71822 (array_inv!17847 a!4227)))

(declare-fun b!834774 () Bool)

(declare-fun res!567686 () Bool)

(assert (=> b!834774 (=> (not res!567686) (not e!465755))))

(declare-fun k!2968 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834774 (= res!567686 (validKeyInArray!0 k!2968))))

(declare-fun b!834775 () Bool)

(declare-fun res!567684 () Bool)

(declare-fun e!465754 () Bool)

(assert (=> b!834775 (=> (not res!567684) (not e!465754))))

(assert (=> b!834775 (= res!567684 (= (arrayCountValidKeys!0 lt!379455 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390))))))

(declare-fun b!834776 () Bool)

(declare-fun res!567689 () Bool)

(assert (=> b!834776 (=> (not res!567689) (not e!465755))))

(assert (=> b!834776 (= res!567689 (and (bvslt (size!22821 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22821 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun call!36632 () (_ BitVec 32))

(declare-fun bm!36629 () Bool)

(assert (=> bm!36629 (= call!36632 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834777 () Bool)

(declare-fun e!465756 () Bool)

(assert (=> b!834777 (= e!465756 e!465754)))

(declare-fun res!567688 () Bool)

(assert (=> b!834777 (=> (not res!567688) (not e!465754))))

(assert (=> b!834777 (= res!567688 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22821 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-datatypes ((Unit!28693 0))(
  ( (Unit!28694) )
))
(declare-fun lt!379459 () Unit!28693)

(declare-fun e!465753 () Unit!28693)

(assert (=> b!834777 (= lt!379459 e!465753)))

(declare-fun c!90941 () Bool)

(assert (=> b!834777 (= c!90941 (validKeyInArray!0 (select (arr!22400 a!4227) to!390)))))

(declare-fun b!834778 () Bool)

(assert (=> b!834778 (= e!465755 e!465756)))

(declare-fun res!567685 () Bool)

(assert (=> b!834778 (=> (not res!567685) (not e!465756))))

(declare-fun lt!379454 () (_ BitVec 32))

(declare-fun lt!379458 () (_ BitVec 32))

(assert (=> b!834778 (= res!567685 (and (= lt!379454 lt!379458) (not (= to!390 (size!22821 a!4227)))))))

(assert (=> b!834778 (= lt!379458 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834778 (= lt!379454 (arrayCountValidKeys!0 lt!379455 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834778 (= lt!379455 (array!46733 (store (arr!22400 a!4227) i!1466 k!2968) (size!22821 a!4227)))))

(declare-fun b!834779 () Bool)

(declare-fun lt!379462 () Unit!28693)

(assert (=> b!834779 (= e!465753 lt!379462)))

(declare-fun lt!379457 () Unit!28693)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46732 (_ BitVec 32) (_ BitVec 32)) Unit!28693)

(assert (=> b!834779 (= lt!379457 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834779 (= call!36632 lt!379458)))

(assert (=> b!834779 (= lt!379462 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!379455 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834779 (= call!36631 lt!379454)))

(declare-fun b!834780 () Bool)

(assert (=> b!834780 (= e!465754 (not true))))

(assert (=> b!834780 (= (arrayCountValidKeys!0 lt!379455 (bvadd #b00000000000000000000000000000001 i!1466) (size!22821 a!4227)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (size!22821 a!4227)))))

(declare-fun lt!379461 () Unit!28693)

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!46732 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!28693)

(assert (=> b!834780 (= lt!379461 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4227 i!1466 k!2968 (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834781 () Bool)

(declare-fun res!567683 () Bool)

(assert (=> b!834781 (=> (not res!567683) (not e!465755))))

(assert (=> b!834781 (= res!567683 (not (validKeyInArray!0 (select (arr!22400 a!4227) i!1466))))))

(declare-fun b!834782 () Bool)

(declare-fun lt!379456 () Unit!28693)

(assert (=> b!834782 (= e!465753 lt!379456)))

(declare-fun lt!379460 () Unit!28693)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46732 (_ BitVec 32) (_ BitVec 32)) Unit!28693)

(assert (=> b!834782 (= lt!379460 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834782 (= call!36632 (bvadd #b00000000000000000000000000000001 lt!379458))))

(assert (=> b!834782 (= lt!379456 (lemmaValidKeyIncreasesNumOfKeys!0 lt!379455 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834782 (= call!36631 (bvadd #b00000000000000000000000000000001 lt!379454))))

(assert (= (and start!71822 res!567687) b!834781))

(assert (= (and b!834781 res!567683) b!834774))

(assert (= (and b!834774 res!567686) b!834776))

(assert (= (and b!834776 res!567689) b!834778))

(assert (= (and b!834778 res!567685) b!834777))

(assert (= (and b!834777 c!90941) b!834782))

(assert (= (and b!834777 (not c!90941)) b!834779))

(assert (= (or b!834782 b!834779) bm!36628))

(assert (= (or b!834782 b!834779) bm!36629))

(assert (= (and b!834777 res!567688) b!834775))

(assert (= (and b!834775 res!567684) b!834780))

(declare-fun m!779861 () Bool)

(assert (=> b!834778 m!779861))

(declare-fun m!779863 () Bool)

(assert (=> b!834778 m!779863))

(declare-fun m!779865 () Bool)

(assert (=> b!834778 m!779865))

(declare-fun m!779867 () Bool)

(assert (=> b!834781 m!779867))

(assert (=> b!834781 m!779867))

(declare-fun m!779869 () Bool)

(assert (=> b!834781 m!779869))

(declare-fun m!779871 () Bool)

(assert (=> b!834780 m!779871))

(declare-fun m!779873 () Bool)

(assert (=> b!834780 m!779873))

(declare-fun m!779875 () Bool)

(assert (=> b!834780 m!779875))

(declare-fun m!779877 () Bool)

(assert (=> start!71822 m!779877))

(declare-fun m!779879 () Bool)

(assert (=> b!834777 m!779879))

(assert (=> b!834777 m!779879))

(declare-fun m!779881 () Bool)

(assert (=> b!834777 m!779881))

(declare-fun m!779883 () Bool)

(assert (=> b!834774 m!779883))

(declare-fun m!779885 () Bool)

(assert (=> b!834779 m!779885))

(declare-fun m!779887 () Bool)

(assert (=> b!834779 m!779887))

(declare-fun m!779889 () Bool)

(assert (=> bm!36628 m!779889))

(assert (=> b!834775 m!779889))

(declare-fun m!779891 () Bool)

(assert (=> b!834775 m!779891))

(assert (=> bm!36629 m!779891))

(declare-fun m!779893 () Bool)

(assert (=> b!834782 m!779893))

(declare-fun m!779895 () Bool)

(assert (=> b!834782 m!779895))

(push 1)

(assert (not b!834777))

