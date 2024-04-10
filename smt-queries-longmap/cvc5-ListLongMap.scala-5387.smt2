; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71920 () Bool)

(assert start!71920)

(declare-fun b!835697 () Bool)

(declare-fun res!568528 () Bool)

(declare-fun e!466200 () Bool)

(assert (=> b!835697 (=> (not res!568528) (not e!466200))))

(declare-fun k!2968 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835697 (= res!568528 (validKeyInArray!0 k!2968))))

(declare-fun b!835698 () Bool)

(declare-fun res!568529 () Bool)

(assert (=> b!835698 (=> (not res!568529) (not e!466200))))

(declare-datatypes ((array!46830 0))(
  ( (array!46831 (arr!22449 (Array (_ BitVec 32) (_ BitVec 64))) (size!22870 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46830)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!835698 (= res!568529 (and (bvslt (size!22870 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22870 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!835699 () Bool)

(declare-datatypes ((Unit!28743 0))(
  ( (Unit!28744) )
))
(declare-fun e!466199 () Unit!28743)

(declare-fun lt!379932 () Unit!28743)

(assert (=> b!835699 (= e!466199 lt!379932)))

(declare-fun lt!379936 () Unit!28743)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46830 (_ BitVec 32) (_ BitVec 32)) Unit!28743)

(assert (=> b!835699 (= lt!379936 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36709 () (_ BitVec 32))

(declare-fun lt!379933 () (_ BitVec 32))

(assert (=> b!835699 (= call!36709 (bvadd #b00000000000000000000000000000001 lt!379933))))

(declare-fun lt!379935 () array!46830)

(assert (=> b!835699 (= lt!379932 (lemmaValidKeyIncreasesNumOfKeys!0 lt!379935 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36710 () (_ BitVec 32))

(declare-fun lt!379930 () (_ BitVec 32))

(assert (=> b!835699 (= call!36710 (bvadd #b00000000000000000000000000000001 lt!379930))))

(declare-fun bm!36706 () Bool)

(declare-fun arrayCountValidKeys!0 (array!46830 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!36706 (= call!36710 (arrayCountValidKeys!0 lt!379935 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835701 () Bool)

(declare-fun res!568532 () Bool)

(assert (=> b!835701 (=> (not res!568532) (not e!466200))))

(assert (=> b!835701 (= res!568532 (not (validKeyInArray!0 (select (arr!22449 a!4227) i!1466))))))

(declare-fun bm!36707 () Bool)

(assert (=> bm!36707 (= call!36709 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835702 () Bool)

(declare-fun e!466198 () Bool)

(assert (=> b!835702 (= e!466198 false)))

(declare-fun lt!379934 () Unit!28743)

(assert (=> b!835702 (= lt!379934 e!466199)))

(declare-fun c!90980 () Bool)

(assert (=> b!835702 (= c!90980 (validKeyInArray!0 (select (arr!22449 a!4227) to!390)))))

(declare-fun b!835703 () Bool)

(assert (=> b!835703 (= e!466200 e!466198)))

(declare-fun res!568530 () Bool)

(assert (=> b!835703 (=> (not res!568530) (not e!466198))))

(assert (=> b!835703 (= res!568530 (and (= lt!379930 lt!379933) (not (= to!390 (size!22870 a!4227)))))))

(assert (=> b!835703 (= lt!379933 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835703 (= lt!379930 (arrayCountValidKeys!0 lt!379935 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835703 (= lt!379935 (array!46831 (store (arr!22449 a!4227) i!1466 k!2968) (size!22870 a!4227)))))

(declare-fun b!835700 () Bool)

(declare-fun lt!379931 () Unit!28743)

(assert (=> b!835700 (= e!466199 lt!379931)))

(declare-fun lt!379929 () Unit!28743)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46830 (_ BitVec 32) (_ BitVec 32)) Unit!28743)

(assert (=> b!835700 (= lt!379929 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835700 (= call!36709 lt!379933)))

(assert (=> b!835700 (= lt!379931 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!379935 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835700 (= call!36710 lt!379930)))

(declare-fun res!568531 () Bool)

(assert (=> start!71920 (=> (not res!568531) (not e!466200))))

(assert (=> start!71920 (= res!568531 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22870 a!4227))))))

(assert (=> start!71920 e!466200))

(assert (=> start!71920 true))

(declare-fun array_inv!17896 (array!46830) Bool)

(assert (=> start!71920 (array_inv!17896 a!4227)))

(assert (= (and start!71920 res!568531) b!835701))

(assert (= (and b!835701 res!568532) b!835697))

(assert (= (and b!835697 res!568528) b!835698))

(assert (= (and b!835698 res!568529) b!835703))

(assert (= (and b!835703 res!568530) b!835702))

(assert (= (and b!835702 c!90980) b!835699))

(assert (= (and b!835702 (not c!90980)) b!835700))

(assert (= (or b!835699 b!835700) bm!36706))

(assert (= (or b!835699 b!835700) bm!36707))

(declare-fun m!780945 () Bool)

(assert (=> b!835699 m!780945))

(declare-fun m!780947 () Bool)

(assert (=> b!835699 m!780947))

(declare-fun m!780949 () Bool)

(assert (=> bm!36706 m!780949))

(declare-fun m!780951 () Bool)

(assert (=> b!835701 m!780951))

(assert (=> b!835701 m!780951))

(declare-fun m!780953 () Bool)

(assert (=> b!835701 m!780953))

(declare-fun m!780955 () Bool)

(assert (=> bm!36707 m!780955))

(declare-fun m!780957 () Bool)

(assert (=> start!71920 m!780957))

(declare-fun m!780959 () Bool)

(assert (=> b!835700 m!780959))

(declare-fun m!780961 () Bool)

(assert (=> b!835700 m!780961))

(declare-fun m!780963 () Bool)

(assert (=> b!835703 m!780963))

(declare-fun m!780965 () Bool)

(assert (=> b!835703 m!780965))

(declare-fun m!780967 () Bool)

(assert (=> b!835703 m!780967))

(declare-fun m!780969 () Bool)

(assert (=> b!835697 m!780969))

(declare-fun m!780971 () Bool)

(assert (=> b!835702 m!780971))

(assert (=> b!835702 m!780971))

(declare-fun m!780973 () Bool)

(assert (=> b!835702 m!780973))

(push 1)

