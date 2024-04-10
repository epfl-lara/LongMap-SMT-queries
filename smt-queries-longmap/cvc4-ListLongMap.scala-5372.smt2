; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71834 () Bool)

(assert start!71834)

(declare-fun b!834936 () Bool)

(declare-fun res!567814 () Bool)

(declare-fun e!465842 () Bool)

(assert (=> b!834936 (=> (not res!567814) (not e!465842))))

(declare-datatypes ((array!46744 0))(
  ( (array!46745 (arr!22406 (Array (_ BitVec 32) (_ BitVec 64))) (size!22827 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46744)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!834936 (= res!567814 (and (bvslt (size!22827 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22827 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!834937 () Bool)

(declare-fun res!567809 () Bool)

(declare-fun e!465846 () Bool)

(assert (=> b!834937 (=> (not res!567809) (not e!465846))))

(declare-fun lt!379621 () array!46744)

(declare-fun arrayCountValidKeys!0 (array!46744 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!834937 (= res!567809 (= (arrayCountValidKeys!0 lt!379621 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390))))))

(declare-fun b!834938 () Bool)

(declare-fun res!567813 () Bool)

(assert (=> b!834938 (=> (not res!567813) (not e!465842))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834938 (= res!567813 (not (validKeyInArray!0 (select (arr!22406 a!4227) i!1466))))))

(declare-fun res!567810 () Bool)

(assert (=> start!71834 (=> (not res!567810) (not e!465842))))

(assert (=> start!71834 (= res!567810 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22827 a!4227))))))

(assert (=> start!71834 e!465842))

(assert (=> start!71834 true))

(declare-fun array_inv!17853 (array!46744) Bool)

(assert (=> start!71834 (array_inv!17853 a!4227)))

(declare-fun call!36668 () (_ BitVec 32))

(declare-fun bm!36664 () Bool)

(assert (=> bm!36664 (= call!36668 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834939 () Bool)

(declare-fun e!465844 () Bool)

(assert (=> b!834939 (= e!465844 e!465846)))

(declare-fun res!567815 () Bool)

(assert (=> b!834939 (=> (not res!567815) (not e!465846))))

(assert (=> b!834939 (= res!567815 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22827 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-datatypes ((Unit!28705 0))(
  ( (Unit!28706) )
))
(declare-fun lt!379618 () Unit!28705)

(declare-fun e!465843 () Unit!28705)

(assert (=> b!834939 (= lt!379618 e!465843)))

(declare-fun c!90959 () Bool)

(assert (=> b!834939 (= c!90959 (validKeyInArray!0 (select (arr!22406 a!4227) to!390)))))

(declare-fun call!36667 () (_ BitVec 32))

(declare-fun bm!36665 () Bool)

(assert (=> bm!36665 (= call!36667 (arrayCountValidKeys!0 lt!379621 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834940 () Bool)

(assert (=> b!834940 (= e!465842 e!465844)))

(declare-fun res!567812 () Bool)

(assert (=> b!834940 (=> (not res!567812) (not e!465844))))

(declare-fun lt!379619 () (_ BitVec 32))

(declare-fun lt!379624 () (_ BitVec 32))

(assert (=> b!834940 (= res!567812 (and (= lt!379624 lt!379619) (not (= to!390 (size!22827 a!4227)))))))

(assert (=> b!834940 (= lt!379619 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834940 (= lt!379624 (arrayCountValidKeys!0 lt!379621 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun k!2968 () (_ BitVec 64))

(assert (=> b!834940 (= lt!379621 (array!46745 (store (arr!22406 a!4227) i!1466 k!2968) (size!22827 a!4227)))))

(declare-fun b!834941 () Bool)

(assert (=> b!834941 (= e!465846 (not true))))

(assert (=> b!834941 (= (arrayCountValidKeys!0 lt!379621 (bvadd #b00000000000000000000000000000001 i!1466) (size!22827 a!4227)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (size!22827 a!4227)))))

(declare-fun lt!379623 () Unit!28705)

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!46744 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!28705)

(assert (=> b!834941 (= lt!379623 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4227 i!1466 k!2968 (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834942 () Bool)

(declare-fun lt!379616 () Unit!28705)

(assert (=> b!834942 (= e!465843 lt!379616)))

(declare-fun lt!379620 () Unit!28705)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46744 (_ BitVec 32) (_ BitVec 32)) Unit!28705)

(assert (=> b!834942 (= lt!379620 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834942 (= call!36668 (bvadd #b00000000000000000000000000000001 lt!379619))))

(assert (=> b!834942 (= lt!379616 (lemmaValidKeyIncreasesNumOfKeys!0 lt!379621 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834942 (= call!36667 (bvadd #b00000000000000000000000000000001 lt!379624))))

(declare-fun b!834943 () Bool)

(declare-fun res!567811 () Bool)

(assert (=> b!834943 (=> (not res!567811) (not e!465842))))

(assert (=> b!834943 (= res!567811 (validKeyInArray!0 k!2968))))

(declare-fun b!834944 () Bool)

(declare-fun lt!379617 () Unit!28705)

(assert (=> b!834944 (= e!465843 lt!379617)))

(declare-fun lt!379622 () Unit!28705)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46744 (_ BitVec 32) (_ BitVec 32)) Unit!28705)

(assert (=> b!834944 (= lt!379622 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834944 (= call!36668 lt!379619)))

(assert (=> b!834944 (= lt!379617 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!379621 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834944 (= call!36667 lt!379624)))

(assert (= (and start!71834 res!567810) b!834938))

(assert (= (and b!834938 res!567813) b!834943))

(assert (= (and b!834943 res!567811) b!834936))

(assert (= (and b!834936 res!567814) b!834940))

(assert (= (and b!834940 res!567812) b!834939))

(assert (= (and b!834939 c!90959) b!834942))

(assert (= (and b!834939 (not c!90959)) b!834944))

(assert (= (or b!834942 b!834944) bm!36665))

(assert (= (or b!834942 b!834944) bm!36664))

(assert (= (and b!834939 res!567815) b!834937))

(assert (= (and b!834937 res!567809) b!834941))

(declare-fun m!780081 () Bool)

(assert (=> b!834944 m!780081))

(declare-fun m!780083 () Bool)

(assert (=> b!834944 m!780083))

(declare-fun m!780085 () Bool)

(assert (=> b!834942 m!780085))

(declare-fun m!780087 () Bool)

(assert (=> b!834942 m!780087))

(declare-fun m!780089 () Bool)

(assert (=> start!71834 m!780089))

(declare-fun m!780091 () Bool)

(assert (=> b!834940 m!780091))

(declare-fun m!780093 () Bool)

(assert (=> b!834940 m!780093))

(declare-fun m!780095 () Bool)

(assert (=> b!834940 m!780095))

(declare-fun m!780097 () Bool)

(assert (=> b!834937 m!780097))

(declare-fun m!780099 () Bool)

(assert (=> b!834937 m!780099))

(declare-fun m!780101 () Bool)

(assert (=> b!834941 m!780101))

(declare-fun m!780103 () Bool)

(assert (=> b!834941 m!780103))

(declare-fun m!780105 () Bool)

(assert (=> b!834941 m!780105))

(declare-fun m!780107 () Bool)

(assert (=> b!834939 m!780107))

(assert (=> b!834939 m!780107))

(declare-fun m!780109 () Bool)

(assert (=> b!834939 m!780109))

(declare-fun m!780111 () Bool)

(assert (=> b!834943 m!780111))

(assert (=> bm!36665 m!780097))

(declare-fun m!780113 () Bool)

(assert (=> b!834938 m!780113))

(assert (=> b!834938 m!780113))

(declare-fun m!780115 () Bool)

(assert (=> b!834938 m!780115))

(assert (=> bm!36664 m!780099))

(push 1)

(assert (not bm!36665))

(assert (not b!834937))

(assert (not b!834943))

(assert (not b!834939))

