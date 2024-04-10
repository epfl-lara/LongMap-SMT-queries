; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71914 () Bool)

(assert start!71914)

(declare-datatypes ((array!46824 0))(
  ( (array!46825 (arr!22446 (Array (_ BitVec 32) (_ BitVec 64))) (size!22867 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46824)

(declare-fun bm!36688 () Bool)

(declare-fun call!36692 () (_ BitVec 32))

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46824 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!36688 (= call!36692 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835634 () Bool)

(declare-fun res!568483 () Bool)

(declare-fun e!466162 () Bool)

(assert (=> b!835634 (=> (not res!568483) (not e!466162))))

(declare-fun k!2968 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835634 (= res!568483 (validKeyInArray!0 k!2968))))

(declare-fun b!835635 () Bool)

(declare-fun e!466163 () Bool)

(assert (=> b!835635 (= e!466162 e!466163)))

(declare-fun res!568484 () Bool)

(assert (=> b!835635 (=> (not res!568484) (not e!466163))))

(declare-fun lt!379861 () (_ BitVec 32))

(declare-fun lt!379858 () (_ BitVec 32))

(assert (=> b!835635 (= res!568484 (and (= lt!379861 lt!379858) (not (= to!390 (size!22867 a!4227)))))))

(assert (=> b!835635 (= lt!379858 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!379864 () array!46824)

(assert (=> b!835635 (= lt!379861 (arrayCountValidKeys!0 lt!379864 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835635 (= lt!379864 (array!46825 (store (arr!22446 a!4227) i!1466 k!2968) (size!22867 a!4227)))))

(declare-fun b!835636 () Bool)

(declare-datatypes ((Unit!28737 0))(
  ( (Unit!28738) )
))
(declare-fun e!466161 () Unit!28737)

(declare-fun lt!379863 () Unit!28737)

(assert (=> b!835636 (= e!466161 lt!379863)))

(declare-fun lt!379859 () Unit!28737)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46824 (_ BitVec 32) (_ BitVec 32)) Unit!28737)

(assert (=> b!835636 (= lt!379859 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835636 (= call!36692 (bvadd #b00000000000000000000000000000001 lt!379858))))

(assert (=> b!835636 (= lt!379863 (lemmaValidKeyIncreasesNumOfKeys!0 lt!379864 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36691 () (_ BitVec 32))

(assert (=> b!835636 (= call!36691 (bvadd #b00000000000000000000000000000001 lt!379861))))

(declare-fun b!835637 () Bool)

(declare-fun res!568486 () Bool)

(assert (=> b!835637 (=> (not res!568486) (not e!466162))))

(assert (=> b!835637 (= res!568486 (and (bvslt (size!22867 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22867 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun res!568485 () Bool)

(assert (=> start!71914 (=> (not res!568485) (not e!466162))))

(assert (=> start!71914 (= res!568485 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22867 a!4227))))))

(assert (=> start!71914 e!466162))

(assert (=> start!71914 true))

(declare-fun array_inv!17893 (array!46824) Bool)

(assert (=> start!71914 (array_inv!17893 a!4227)))

(declare-fun b!835638 () Bool)

(assert (=> b!835638 (= e!466163 false)))

(declare-fun lt!379862 () Unit!28737)

(assert (=> b!835638 (= lt!379862 e!466161)))

(declare-fun c!90971 () Bool)

(assert (=> b!835638 (= c!90971 (validKeyInArray!0 (select (arr!22446 a!4227) to!390)))))

(declare-fun b!835639 () Bool)

(declare-fun lt!379860 () Unit!28737)

(assert (=> b!835639 (= e!466161 lt!379860)))

(declare-fun lt!379857 () Unit!28737)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46824 (_ BitVec 32) (_ BitVec 32)) Unit!28737)

(assert (=> b!835639 (= lt!379857 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835639 (= call!36692 lt!379858)))

(assert (=> b!835639 (= lt!379860 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!379864 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835639 (= call!36691 lt!379861)))

(declare-fun bm!36689 () Bool)

(assert (=> bm!36689 (= call!36691 (arrayCountValidKeys!0 lt!379864 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835640 () Bool)

(declare-fun res!568487 () Bool)

(assert (=> b!835640 (=> (not res!568487) (not e!466162))))

(assert (=> b!835640 (= res!568487 (not (validKeyInArray!0 (select (arr!22446 a!4227) i!1466))))))

(assert (= (and start!71914 res!568485) b!835640))

(assert (= (and b!835640 res!568487) b!835634))

(assert (= (and b!835634 res!568483) b!835637))

(assert (= (and b!835637 res!568486) b!835635))

(assert (= (and b!835635 res!568484) b!835638))

(assert (= (and b!835638 c!90971) b!835636))

(assert (= (and b!835638 (not c!90971)) b!835639))

(assert (= (or b!835636 b!835639) bm!36689))

(assert (= (or b!835636 b!835639) bm!36688))

(declare-fun m!780855 () Bool)

(assert (=> b!835640 m!780855))

(assert (=> b!835640 m!780855))

(declare-fun m!780857 () Bool)

(assert (=> b!835640 m!780857))

(declare-fun m!780859 () Bool)

(assert (=> b!835636 m!780859))

(declare-fun m!780861 () Bool)

(assert (=> b!835636 m!780861))

(declare-fun m!780863 () Bool)

(assert (=> b!835639 m!780863))

(declare-fun m!780865 () Bool)

(assert (=> b!835639 m!780865))

(declare-fun m!780867 () Bool)

(assert (=> b!835634 m!780867))

(declare-fun m!780869 () Bool)

(assert (=> b!835638 m!780869))

(assert (=> b!835638 m!780869))

(declare-fun m!780871 () Bool)

(assert (=> b!835638 m!780871))

(declare-fun m!780873 () Bool)

(assert (=> b!835635 m!780873))

(declare-fun m!780875 () Bool)

(assert (=> b!835635 m!780875))

(declare-fun m!780877 () Bool)

(assert (=> b!835635 m!780877))

(declare-fun m!780879 () Bool)

(assert (=> bm!36688 m!780879))

(declare-fun m!780881 () Bool)

(assert (=> start!71914 m!780881))

(declare-fun m!780883 () Bool)

(assert (=> bm!36689 m!780883))

(push 1)

