; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71938 () Bool)

(assert start!71938)

(declare-fun res!568680 () Bool)

(declare-fun e!466319 () Bool)

(assert (=> start!71938 (=> (not res!568680) (not e!466319))))

(declare-fun i!1466 () (_ BitVec 32))

(declare-datatypes ((array!46848 0))(
  ( (array!46849 (arr!22458 (Array (_ BitVec 32) (_ BitVec 64))) (size!22879 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46848)

(assert (=> start!71938 (= res!568680 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22879 a!4227))))))

(assert (=> start!71938 e!466319))

(assert (=> start!71938 true))

(declare-fun array_inv!17905 (array!46848) Bool)

(assert (=> start!71938 (array_inv!17905 a!4227)))

(declare-fun b!835899 () Bool)

(declare-fun res!568679 () Bool)

(assert (=> b!835899 (=> (not res!568679) (not e!466319))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835899 (= res!568679 (not (validKeyInArray!0 (select (arr!22458 a!4227) i!1466))))))

(declare-fun call!36763 () (_ BitVec 32))

(declare-fun lt!380146 () array!46848)

(declare-fun bm!36760 () Bool)

(declare-fun to!390 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46848 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!36760 (= call!36763 (arrayCountValidKeys!0 lt!380146 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835900 () Bool)

(declare-fun res!568682 () Bool)

(declare-fun e!466318 () Bool)

(assert (=> b!835900 (=> (not res!568682) (not e!466318))))

(assert (=> b!835900 (= res!568682 (= (arrayCountValidKeys!0 lt!380146 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390))))))

(declare-fun b!835901 () Bool)

(declare-fun e!466317 () Bool)

(assert (=> b!835901 (= e!466319 e!466317)))

(declare-fun res!568681 () Bool)

(assert (=> b!835901 (=> (not res!568681) (not e!466317))))

(declare-fun lt!380152 () (_ BitVec 32))

(declare-fun lt!380151 () (_ BitVec 32))

(assert (=> b!835901 (= res!568681 (and (= lt!380151 lt!380152) (not (= to!390 (size!22879 a!4227)))))))

(assert (=> b!835901 (= lt!380152 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835901 (= lt!380151 (arrayCountValidKeys!0 lt!380146 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun k!2968 () (_ BitVec 64))

(assert (=> b!835901 (= lt!380146 (array!46849 (store (arr!22458 a!4227) i!1466 k!2968) (size!22879 a!4227)))))

(declare-fun bm!36761 () Bool)

(declare-fun call!36764 () (_ BitVec 32))

(assert (=> bm!36761 (= call!36764 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835902 () Bool)

(assert (=> b!835902 (= e!466318 (bvsge (bvsub (size!22879 a!4227) to!390) (bvsub (bvadd #b00000000000000000000000000000001 (size!22879 a!4227)) to!390)))))

(declare-fun b!835903 () Bool)

(declare-datatypes ((Unit!28761 0))(
  ( (Unit!28762) )
))
(declare-fun e!466316 () Unit!28761)

(declare-fun lt!380149 () Unit!28761)

(assert (=> b!835903 (= e!466316 lt!380149)))

(declare-fun lt!380147 () Unit!28761)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46848 (_ BitVec 32) (_ BitVec 32)) Unit!28761)

(assert (=> b!835903 (= lt!380147 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835903 (= call!36764 (bvadd #b00000000000000000000000000000001 lt!380152))))

(assert (=> b!835903 (= lt!380149 (lemmaValidKeyIncreasesNumOfKeys!0 lt!380146 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835903 (= call!36763 (bvadd #b00000000000000000000000000000001 lt!380151))))

(declare-fun b!835904 () Bool)

(declare-fun res!568676 () Bool)

(assert (=> b!835904 (=> (not res!568676) (not e!466319))))

(assert (=> b!835904 (= res!568676 (and (bvslt (size!22879 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22879 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!835905 () Bool)

(assert (=> b!835905 (= e!466317 e!466318)))

(declare-fun res!568677 () Bool)

(assert (=> b!835905 (=> (not res!568677) (not e!466318))))

(assert (=> b!835905 (= res!568677 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22879 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-fun lt!380145 () Unit!28761)

(assert (=> b!835905 (= lt!380145 e!466316)))

(declare-fun c!91007 () Bool)

(assert (=> b!835905 (= c!91007 (validKeyInArray!0 (select (arr!22458 a!4227) to!390)))))

(declare-fun b!835906 () Bool)

(declare-fun lt!380148 () Unit!28761)

(assert (=> b!835906 (= e!466316 lt!380148)))

(declare-fun lt!380150 () Unit!28761)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46848 (_ BitVec 32) (_ BitVec 32)) Unit!28761)

(assert (=> b!835906 (= lt!380150 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835906 (= call!36764 lt!380152)))

(assert (=> b!835906 (= lt!380148 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!380146 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835906 (= call!36763 lt!380151)))

(declare-fun b!835907 () Bool)

(declare-fun res!568678 () Bool)

(assert (=> b!835907 (=> (not res!568678) (not e!466319))))

(assert (=> b!835907 (= res!568678 (validKeyInArray!0 k!2968))))

(assert (= (and start!71938 res!568680) b!835899))

(assert (= (and b!835899 res!568679) b!835907))

(assert (= (and b!835907 res!568678) b!835904))

(assert (= (and b!835904 res!568676) b!835901))

(assert (= (and b!835901 res!568681) b!835905))

(assert (= (and b!835905 c!91007) b!835903))

(assert (= (and b!835905 (not c!91007)) b!835906))

(assert (= (or b!835903 b!835906) bm!36761))

(assert (= (or b!835903 b!835906) bm!36760))

(assert (= (and b!835905 res!568677) b!835900))

(assert (= (and b!835900 res!568682) b!835902))

(declare-fun m!781219 () Bool)

(assert (=> b!835907 m!781219))

(declare-fun m!781221 () Bool)

(assert (=> bm!36760 m!781221))

(declare-fun m!781223 () Bool)

(assert (=> b!835901 m!781223))

(declare-fun m!781225 () Bool)

(assert (=> b!835901 m!781225))

(declare-fun m!781227 () Bool)

(assert (=> b!835901 m!781227))

(declare-fun m!781229 () Bool)

(assert (=> b!835899 m!781229))

(assert (=> b!835899 m!781229))

(declare-fun m!781231 () Bool)

(assert (=> b!835899 m!781231))

(declare-fun m!781233 () Bool)

(assert (=> b!835903 m!781233))

(declare-fun m!781235 () Bool)

(assert (=> b!835903 m!781235))

(declare-fun m!781237 () Bool)

(assert (=> bm!36761 m!781237))

(declare-fun m!781239 () Bool)

(assert (=> b!835906 m!781239))

(declare-fun m!781241 () Bool)

(assert (=> b!835906 m!781241))

(assert (=> b!835900 m!781221))

(assert (=> b!835900 m!781237))

(declare-fun m!781243 () Bool)

(assert (=> start!71938 m!781243))

(declare-fun m!781245 () Bool)

(assert (=> b!835905 m!781245))

(assert (=> b!835905 m!781245))

(declare-fun m!781247 () Bool)

(assert (=> b!835905 m!781247))

(push 1)

(assert (not b!835905))

(assert (not bm!36760))

(assert (not b!835899))

(assert (not b!835906))

(assert (not b!835900))

(assert (not b!835907))

(assert (not bm!36761))

(assert (not start!71938))

(assert (not b!835901))

(assert (not b!835903))

(check-sat)

(pop 1)

(push 1)

(check-sat)

