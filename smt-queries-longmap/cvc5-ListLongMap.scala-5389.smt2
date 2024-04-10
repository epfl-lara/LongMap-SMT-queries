; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71932 () Bool)

(assert start!71932)

(declare-fun b!835825 () Bool)

(declare-fun res!568623 () Bool)

(declare-fun e!466271 () Bool)

(assert (=> b!835825 (=> (not res!568623) (not e!466271))))

(declare-datatypes ((array!46842 0))(
  ( (array!46843 (arr!22455 (Array (_ BitVec 32) (_ BitVec 64))) (size!22876 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46842)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!835825 (= res!568623 (and (bvslt (size!22876 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22876 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!835826 () Bool)

(declare-datatypes ((Unit!28755 0))(
  ( (Unit!28756) )
))
(declare-fun e!466272 () Unit!28755)

(declare-fun lt!380074 () Unit!28755)

(assert (=> b!835826 (= e!466272 lt!380074)))

(declare-fun lt!380077 () Unit!28755)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46842 (_ BitVec 32) (_ BitVec 32)) Unit!28755)

(assert (=> b!835826 (= lt!380077 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36746 () (_ BitVec 32))

(declare-fun lt!380073 () (_ BitVec 32))

(assert (=> b!835826 (= call!36746 lt!380073)))

(declare-fun lt!380075 () array!46842)

(assert (=> b!835826 (= lt!380074 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!380075 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36745 () (_ BitVec 32))

(declare-fun lt!380078 () (_ BitVec 32))

(assert (=> b!835826 (= call!36745 lt!380078)))

(declare-fun b!835827 () Bool)

(declare-fun e!466275 () Bool)

(declare-fun e!466274 () Bool)

(assert (=> b!835827 (= e!466275 e!466274)))

(declare-fun res!568625 () Bool)

(assert (=> b!835827 (=> (not res!568625) (not e!466274))))

(assert (=> b!835827 (= res!568625 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22876 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-fun lt!380079 () Unit!28755)

(assert (=> b!835827 (= lt!380079 e!466272)))

(declare-fun c!90998 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835827 (= c!90998 (validKeyInArray!0 (select (arr!22455 a!4227) to!390)))))

(declare-fun res!568620 () Bool)

(assert (=> start!71932 (=> (not res!568620) (not e!466271))))

(assert (=> start!71932 (= res!568620 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22876 a!4227))))))

(assert (=> start!71932 e!466271))

(assert (=> start!71932 true))

(declare-fun array_inv!17902 (array!46842) Bool)

(assert (=> start!71932 (array_inv!17902 a!4227)))

(declare-fun b!835828 () Bool)

(declare-fun arrayCountValidKeys!0 (array!46842 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!835828 (= e!466274 (not (= (arrayCountValidKeys!0 lt!380075 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))))

(declare-fun b!835829 () Bool)

(declare-fun res!568621 () Bool)

(assert (=> b!835829 (=> (not res!568621) (not e!466271))))

(declare-fun k!2968 () (_ BitVec 64))

(assert (=> b!835829 (= res!568621 (validKeyInArray!0 k!2968))))

(declare-fun b!835830 () Bool)

(declare-fun lt!380076 () Unit!28755)

(assert (=> b!835830 (= e!466272 lt!380076)))

(declare-fun lt!380080 () Unit!28755)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46842 (_ BitVec 32) (_ BitVec 32)) Unit!28755)

(assert (=> b!835830 (= lt!380080 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835830 (= call!36746 (bvadd #b00000000000000000000000000000001 lt!380073))))

(assert (=> b!835830 (= lt!380076 (lemmaValidKeyIncreasesNumOfKeys!0 lt!380075 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835830 (= call!36745 (bvadd #b00000000000000000000000000000001 lt!380078))))

(declare-fun bm!36742 () Bool)

(assert (=> bm!36742 (= call!36745 (arrayCountValidKeys!0 lt!380075 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835831 () Bool)

(declare-fun res!568622 () Bool)

(assert (=> b!835831 (=> (not res!568622) (not e!466271))))

(assert (=> b!835831 (= res!568622 (not (validKeyInArray!0 (select (arr!22455 a!4227) i!1466))))))

(declare-fun bm!36743 () Bool)

(assert (=> bm!36743 (= call!36746 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835832 () Bool)

(assert (=> b!835832 (= e!466271 e!466275)))

(declare-fun res!568624 () Bool)

(assert (=> b!835832 (=> (not res!568624) (not e!466275))))

(assert (=> b!835832 (= res!568624 (and (= lt!380078 lt!380073) (not (= to!390 (size!22876 a!4227)))))))

(assert (=> b!835832 (= lt!380073 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835832 (= lt!380078 (arrayCountValidKeys!0 lt!380075 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835832 (= lt!380075 (array!46843 (store (arr!22455 a!4227) i!1466 k!2968) (size!22876 a!4227)))))

(assert (= (and start!71932 res!568620) b!835831))

(assert (= (and b!835831 res!568622) b!835829))

(assert (= (and b!835829 res!568621) b!835825))

(assert (= (and b!835825 res!568623) b!835832))

(assert (= (and b!835832 res!568624) b!835827))

(assert (= (and b!835827 c!90998) b!835830))

(assert (= (and b!835827 (not c!90998)) b!835826))

(assert (= (or b!835830 b!835826) bm!36742))

(assert (= (or b!835830 b!835826) bm!36743))

(assert (= (and b!835827 res!568625) b!835828))

(declare-fun m!781125 () Bool)

(assert (=> b!835826 m!781125))

(declare-fun m!781127 () Bool)

(assert (=> b!835826 m!781127))

(declare-fun m!781129 () Bool)

(assert (=> b!835831 m!781129))

(assert (=> b!835831 m!781129))

(declare-fun m!781131 () Bool)

(assert (=> b!835831 m!781131))

(declare-fun m!781133 () Bool)

(assert (=> start!71932 m!781133))

(declare-fun m!781135 () Bool)

(assert (=> b!835830 m!781135))

(declare-fun m!781137 () Bool)

(assert (=> b!835830 m!781137))

(declare-fun m!781139 () Bool)

(assert (=> bm!36743 m!781139))

(declare-fun m!781141 () Bool)

(assert (=> b!835827 m!781141))

(assert (=> b!835827 m!781141))

(declare-fun m!781143 () Bool)

(assert (=> b!835827 m!781143))

(declare-fun m!781145 () Bool)

(assert (=> b!835829 m!781145))

(declare-fun m!781147 () Bool)

(assert (=> b!835828 m!781147))

(assert (=> b!835828 m!781139))

(declare-fun m!781149 () Bool)

(assert (=> b!835832 m!781149))

(declare-fun m!781151 () Bool)

(assert (=> b!835832 m!781151))

(declare-fun m!781153 () Bool)

(assert (=> b!835832 m!781153))

(assert (=> bm!36742 m!781147))

(push 1)

(assert (not b!835830))

(assert (not b!835828))

(assert (not bm!36742))

(assert (not b!835826))

(assert (not b!835832))

(assert (not start!71932))

(assert (not b!835831))

(assert (not b!835829))

(assert (not b!835827))

(assert (not bm!36743))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

