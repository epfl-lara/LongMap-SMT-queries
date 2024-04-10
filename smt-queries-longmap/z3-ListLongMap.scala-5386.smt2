; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71916 () Bool)

(assert start!71916)

(declare-fun b!835655 () Bool)

(declare-fun e!466176 () Bool)

(declare-fun e!466173 () Bool)

(assert (=> b!835655 (= e!466176 e!466173)))

(declare-fun res!568501 () Bool)

(assert (=> b!835655 (=> (not res!568501) (not e!466173))))

(declare-datatypes ((array!46826 0))(
  ( (array!46827 (arr!22447 (Array (_ BitVec 32) (_ BitVec 64))) (size!22868 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46826)

(declare-fun lt!379887 () (_ BitVec 32))

(declare-fun lt!379881 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!835655 (= res!568501 (and (= lt!379881 lt!379887) (not (= to!390 (size!22868 a!4227)))))))

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46826 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!835655 (= lt!379887 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!379888 () array!46826)

(assert (=> b!835655 (= lt!379881 (arrayCountValidKeys!0 lt!379888 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun k0!2968 () (_ BitVec 64))

(assert (=> b!835655 (= lt!379888 (array!46827 (store (arr!22447 a!4227) i!1466 k0!2968) (size!22868 a!4227)))))

(declare-fun b!835656 () Bool)

(declare-datatypes ((Unit!28739 0))(
  ( (Unit!28740) )
))
(declare-fun e!466175 () Unit!28739)

(declare-fun lt!379885 () Unit!28739)

(assert (=> b!835656 (= e!466175 lt!379885)))

(declare-fun lt!379886 () Unit!28739)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46826 (_ BitVec 32) (_ BitVec 32)) Unit!28739)

(assert (=> b!835656 (= lt!379886 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36697 () (_ BitVec 32))

(assert (=> b!835656 (= call!36697 (bvadd #b00000000000000000000000000000001 lt!379887))))

(assert (=> b!835656 (= lt!379885 (lemmaValidKeyIncreasesNumOfKeys!0 lt!379888 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36698 () (_ BitVec 32))

(assert (=> b!835656 (= call!36698 (bvadd #b00000000000000000000000000000001 lt!379881))))

(declare-fun b!835657 () Bool)

(declare-fun res!568499 () Bool)

(assert (=> b!835657 (=> (not res!568499) (not e!466176))))

(assert (=> b!835657 (= res!568499 (and (bvslt (size!22868 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22868 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!835658 () Bool)

(declare-fun res!568502 () Bool)

(assert (=> b!835658 (=> (not res!568502) (not e!466176))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835658 (= res!568502 (validKeyInArray!0 k0!2968))))

(declare-fun b!835659 () Bool)

(declare-fun res!568498 () Bool)

(assert (=> b!835659 (=> (not res!568498) (not e!466176))))

(assert (=> b!835659 (= res!568498 (not (validKeyInArray!0 (select (arr!22447 a!4227) i!1466))))))

(declare-fun res!568500 () Bool)

(assert (=> start!71916 (=> (not res!568500) (not e!466176))))

(assert (=> start!71916 (= res!568500 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22868 a!4227))))))

(assert (=> start!71916 e!466176))

(assert (=> start!71916 true))

(declare-fun array_inv!17894 (array!46826) Bool)

(assert (=> start!71916 (array_inv!17894 a!4227)))

(declare-fun bm!36694 () Bool)

(assert (=> bm!36694 (= call!36698 (arrayCountValidKeys!0 lt!379888 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun bm!36695 () Bool)

(assert (=> bm!36695 (= call!36697 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835660 () Bool)

(assert (=> b!835660 (= e!466173 false)))

(declare-fun lt!379883 () Unit!28739)

(assert (=> b!835660 (= lt!379883 e!466175)))

(declare-fun c!90974 () Bool)

(assert (=> b!835660 (= c!90974 (validKeyInArray!0 (select (arr!22447 a!4227) to!390)))))

(declare-fun b!835661 () Bool)

(declare-fun lt!379884 () Unit!28739)

(assert (=> b!835661 (= e!466175 lt!379884)))

(declare-fun lt!379882 () Unit!28739)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46826 (_ BitVec 32) (_ BitVec 32)) Unit!28739)

(assert (=> b!835661 (= lt!379882 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835661 (= call!36697 lt!379887)))

(assert (=> b!835661 (= lt!379884 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!379888 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835661 (= call!36698 lt!379881)))

(assert (= (and start!71916 res!568500) b!835659))

(assert (= (and b!835659 res!568498) b!835658))

(assert (= (and b!835658 res!568502) b!835657))

(assert (= (and b!835657 res!568499) b!835655))

(assert (= (and b!835655 res!568501) b!835660))

(assert (= (and b!835660 c!90974) b!835656))

(assert (= (and b!835660 (not c!90974)) b!835661))

(assert (= (or b!835656 b!835661) bm!36694))

(assert (= (or b!835656 b!835661) bm!36695))

(declare-fun m!780885 () Bool)

(assert (=> b!835658 m!780885))

(declare-fun m!780887 () Bool)

(assert (=> b!835659 m!780887))

(assert (=> b!835659 m!780887))

(declare-fun m!780889 () Bool)

(assert (=> b!835659 m!780889))

(declare-fun m!780891 () Bool)

(assert (=> bm!36695 m!780891))

(declare-fun m!780893 () Bool)

(assert (=> b!835656 m!780893))

(declare-fun m!780895 () Bool)

(assert (=> b!835656 m!780895))

(declare-fun m!780897 () Bool)

(assert (=> bm!36694 m!780897))

(declare-fun m!780899 () Bool)

(assert (=> b!835660 m!780899))

(assert (=> b!835660 m!780899))

(declare-fun m!780901 () Bool)

(assert (=> b!835660 m!780901))

(declare-fun m!780903 () Bool)

(assert (=> b!835661 m!780903))

(declare-fun m!780905 () Bool)

(assert (=> b!835661 m!780905))

(declare-fun m!780907 () Bool)

(assert (=> b!835655 m!780907))

(declare-fun m!780909 () Bool)

(assert (=> b!835655 m!780909))

(declare-fun m!780911 () Bool)

(assert (=> b!835655 m!780911))

(declare-fun m!780913 () Bool)

(assert (=> start!71916 m!780913))

(check-sat (not b!835661) (not b!835655) (not bm!36695) (not bm!36694) (not b!835660) (not b!835659) (not b!835656) (not start!71916) (not b!835658))
(check-sat)
