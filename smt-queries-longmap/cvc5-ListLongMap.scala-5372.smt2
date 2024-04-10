; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71830 () Bool)

(assert start!71830)

(declare-fun b!834882 () Bool)

(declare-fun res!567767 () Bool)

(declare-fun e!465812 () Bool)

(assert (=> b!834882 (=> (not res!567767) (not e!465812))))

(declare-datatypes ((array!46740 0))(
  ( (array!46741 (arr!22404 (Array (_ BitVec 32) (_ BitVec 64))) (size!22825 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46740)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834882 (= res!567767 (not (validKeyInArray!0 (select (arr!22404 a!4227) i!1466))))))

(declare-fun b!834883 () Bool)

(declare-fun res!567771 () Bool)

(declare-fun e!465816 () Bool)

(assert (=> b!834883 (=> (not res!567771) (not e!465816))))

(declare-fun lt!379568 () array!46740)

(declare-fun to!390 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46740 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!834883 (= res!567771 (= (arrayCountValidKeys!0 lt!379568 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390))))))

(declare-fun b!834884 () Bool)

(declare-fun res!567773 () Bool)

(assert (=> b!834884 (=> (not res!567773) (not e!465812))))

(assert (=> b!834884 (= res!567773 (and (bvslt (size!22825 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22825 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!834885 () Bool)

(declare-fun e!465813 () Bool)

(assert (=> b!834885 (= e!465813 e!465816)))

(declare-fun res!567768 () Bool)

(assert (=> b!834885 (=> (not res!567768) (not e!465816))))

(assert (=> b!834885 (= res!567768 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22825 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-datatypes ((Unit!28701 0))(
  ( (Unit!28702) )
))
(declare-fun lt!379563 () Unit!28701)

(declare-fun e!465815 () Unit!28701)

(assert (=> b!834885 (= lt!379563 e!465815)))

(declare-fun c!90953 () Bool)

(assert (=> b!834885 (= c!90953 (validKeyInArray!0 (select (arr!22404 a!4227) to!390)))))

(declare-fun bm!36652 () Bool)

(declare-fun call!36656 () (_ BitVec 32))

(assert (=> bm!36652 (= call!36656 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun bm!36653 () Bool)

(declare-fun call!36655 () (_ BitVec 32))

(assert (=> bm!36653 (= call!36655 (arrayCountValidKeys!0 lt!379568 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834886 () Bool)

(assert (=> b!834886 (= e!465816 (not true))))

(assert (=> b!834886 (= (arrayCountValidKeys!0 lt!379568 (bvadd #b00000000000000000000000000000001 i!1466) (size!22825 a!4227)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (size!22825 a!4227)))))

(declare-fun lt!379566 () Unit!28701)

(declare-fun k!2968 () (_ BitVec 64))

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!46740 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!28701)

(assert (=> b!834886 (= lt!379566 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4227 i!1466 k!2968 (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834887 () Bool)

(declare-fun lt!379569 () Unit!28701)

(assert (=> b!834887 (= e!465815 lt!379569)))

(declare-fun lt!379570 () Unit!28701)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46740 (_ BitVec 32) (_ BitVec 32)) Unit!28701)

(assert (=> b!834887 (= lt!379570 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!379565 () (_ BitVec 32))

(assert (=> b!834887 (= call!36656 (bvadd #b00000000000000000000000000000001 lt!379565))))

(assert (=> b!834887 (= lt!379569 (lemmaValidKeyIncreasesNumOfKeys!0 lt!379568 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!379567 () (_ BitVec 32))

(assert (=> b!834887 (= call!36655 (bvadd #b00000000000000000000000000000001 lt!379567))))

(declare-fun b!834888 () Bool)

(assert (=> b!834888 (= e!465812 e!465813)))

(declare-fun res!567772 () Bool)

(assert (=> b!834888 (=> (not res!567772) (not e!465813))))

(assert (=> b!834888 (= res!567772 (and (= lt!379567 lt!379565) (not (= to!390 (size!22825 a!4227)))))))

(assert (=> b!834888 (= lt!379565 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834888 (= lt!379567 (arrayCountValidKeys!0 lt!379568 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834888 (= lt!379568 (array!46741 (store (arr!22404 a!4227) i!1466 k!2968) (size!22825 a!4227)))))

(declare-fun res!567770 () Bool)

(assert (=> start!71830 (=> (not res!567770) (not e!465812))))

(assert (=> start!71830 (= res!567770 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22825 a!4227))))))

(assert (=> start!71830 e!465812))

(assert (=> start!71830 true))

(declare-fun array_inv!17851 (array!46740) Bool)

(assert (=> start!71830 (array_inv!17851 a!4227)))

(declare-fun b!834889 () Bool)

(declare-fun res!567769 () Bool)

(assert (=> b!834889 (=> (not res!567769) (not e!465812))))

(assert (=> b!834889 (= res!567769 (validKeyInArray!0 k!2968))))

(declare-fun b!834890 () Bool)

(declare-fun lt!379562 () Unit!28701)

(assert (=> b!834890 (= e!465815 lt!379562)))

(declare-fun lt!379564 () Unit!28701)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46740 (_ BitVec 32) (_ BitVec 32)) Unit!28701)

(assert (=> b!834890 (= lt!379564 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834890 (= call!36656 lt!379565)))

(assert (=> b!834890 (= lt!379562 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!379568 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834890 (= call!36655 lt!379567)))

(assert (= (and start!71830 res!567770) b!834882))

(assert (= (and b!834882 res!567767) b!834889))

(assert (= (and b!834889 res!567769) b!834884))

(assert (= (and b!834884 res!567773) b!834888))

(assert (= (and b!834888 res!567772) b!834885))

(assert (= (and b!834885 c!90953) b!834887))

(assert (= (and b!834885 (not c!90953)) b!834890))

(assert (= (or b!834887 b!834890) bm!36653))

(assert (= (or b!834887 b!834890) bm!36652))

(assert (= (and b!834885 res!567768) b!834883))

(assert (= (and b!834883 res!567771) b!834886))

(declare-fun m!780005 () Bool)

(assert (=> bm!36653 m!780005))

(declare-fun m!780007 () Bool)

(assert (=> b!834887 m!780007))

(declare-fun m!780009 () Bool)

(assert (=> b!834887 m!780009))

(assert (=> b!834883 m!780005))

(declare-fun m!780011 () Bool)

(assert (=> b!834883 m!780011))

(declare-fun m!780013 () Bool)

(assert (=> start!71830 m!780013))

(declare-fun m!780015 () Bool)

(assert (=> b!834886 m!780015))

(declare-fun m!780017 () Bool)

(assert (=> b!834886 m!780017))

(declare-fun m!780019 () Bool)

(assert (=> b!834886 m!780019))

(declare-fun m!780021 () Bool)

(assert (=> b!834885 m!780021))

(assert (=> b!834885 m!780021))

(declare-fun m!780023 () Bool)

(assert (=> b!834885 m!780023))

(declare-fun m!780025 () Bool)

(assert (=> b!834882 m!780025))

(assert (=> b!834882 m!780025))

(declare-fun m!780027 () Bool)

(assert (=> b!834882 m!780027))

(declare-fun m!780029 () Bool)

(assert (=> b!834890 m!780029))

(declare-fun m!780031 () Bool)

(assert (=> b!834890 m!780031))

(declare-fun m!780033 () Bool)

(assert (=> b!834889 m!780033))

(declare-fun m!780035 () Bool)

(assert (=> b!834888 m!780035))

(declare-fun m!780037 () Bool)

(assert (=> b!834888 m!780037))

(declare-fun m!780039 () Bool)

(assert (=> b!834888 m!780039))

(assert (=> bm!36652 m!780011))

(push 1)

