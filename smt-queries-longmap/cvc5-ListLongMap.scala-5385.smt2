; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71908 () Bool)

(assert start!71908)

(declare-fun b!835571 () Bool)

(declare-datatypes ((Unit!28731 0))(
  ( (Unit!28732) )
))
(declare-fun e!466127 () Unit!28731)

(declare-fun lt!379790 () Unit!28731)

(assert (=> b!835571 (= e!466127 lt!379790)))

(declare-datatypes ((array!46818 0))(
  ( (array!46819 (arr!22443 (Array (_ BitVec 32) (_ BitVec 64))) (size!22864 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46818)

(declare-fun lt!379789 () Unit!28731)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46818 (_ BitVec 32) (_ BitVec 32)) Unit!28731)

(assert (=> b!835571 (= lt!379789 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36673 () (_ BitVec 32))

(declare-fun lt!379791 () (_ BitVec 32))

(assert (=> b!835571 (= call!36673 lt!379791)))

(declare-fun lt!379786 () array!46818)

(assert (=> b!835571 (= lt!379790 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!379786 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36674 () (_ BitVec 32))

(declare-fun lt!379785 () (_ BitVec 32))

(assert (=> b!835571 (= call!36674 lt!379785)))

(declare-fun res!568439 () Bool)

(declare-fun e!466128 () Bool)

(assert (=> start!71908 (=> (not res!568439) (not e!466128))))

(assert (=> start!71908 (= res!568439 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22864 a!4227))))))

(assert (=> start!71908 e!466128))

(assert (=> start!71908 true))

(declare-fun array_inv!17890 (array!46818) Bool)

(assert (=> start!71908 (array_inv!17890 a!4227)))

(declare-fun b!835572 () Bool)

(declare-fun lt!379788 () Unit!28731)

(assert (=> b!835572 (= e!466127 lt!379788)))

(declare-fun lt!379787 () Unit!28731)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46818 (_ BitVec 32) (_ BitVec 32)) Unit!28731)

(assert (=> b!835572 (= lt!379787 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835572 (= call!36673 (bvadd #b00000000000000000000000000000001 lt!379791))))

(assert (=> b!835572 (= lt!379788 (lemmaValidKeyIncreasesNumOfKeys!0 lt!379786 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835572 (= call!36674 (bvadd #b00000000000000000000000000000001 lt!379785))))

(declare-fun b!835573 () Bool)

(declare-fun res!568438 () Bool)

(assert (=> b!835573 (=> (not res!568438) (not e!466128))))

(assert (=> b!835573 (= res!568438 (and (bvslt (size!22864 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22864 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!835574 () Bool)

(declare-fun res!568441 () Bool)

(assert (=> b!835574 (=> (not res!568441) (not e!466128))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835574 (= res!568441 (not (validKeyInArray!0 (select (arr!22443 a!4227) i!1466))))))

(declare-fun b!835575 () Bool)

(declare-fun e!466125 () Bool)

(assert (=> b!835575 (= e!466125 false)))

(declare-fun lt!379792 () Unit!28731)

(assert (=> b!835575 (= lt!379792 e!466127)))

(declare-fun c!90962 () Bool)

(assert (=> b!835575 (= c!90962 (validKeyInArray!0 (select (arr!22443 a!4227) to!390)))))

(declare-fun bm!36670 () Bool)

(declare-fun arrayCountValidKeys!0 (array!46818 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!36670 (= call!36674 (arrayCountValidKeys!0 lt!379786 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun bm!36671 () Bool)

(assert (=> bm!36671 (= call!36673 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835576 () Bool)

(assert (=> b!835576 (= e!466128 e!466125)))

(declare-fun res!568440 () Bool)

(assert (=> b!835576 (=> (not res!568440) (not e!466125))))

(assert (=> b!835576 (= res!568440 (and (= lt!379785 lt!379791) (not (= to!390 (size!22864 a!4227)))))))

(assert (=> b!835576 (= lt!379791 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835576 (= lt!379785 (arrayCountValidKeys!0 lt!379786 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun k!2968 () (_ BitVec 64))

(assert (=> b!835576 (= lt!379786 (array!46819 (store (arr!22443 a!4227) i!1466 k!2968) (size!22864 a!4227)))))

(declare-fun b!835577 () Bool)

(declare-fun res!568442 () Bool)

(assert (=> b!835577 (=> (not res!568442) (not e!466128))))

(assert (=> b!835577 (= res!568442 (validKeyInArray!0 k!2968))))

(assert (= (and start!71908 res!568439) b!835574))

(assert (= (and b!835574 res!568441) b!835577))

(assert (= (and b!835577 res!568442) b!835573))

(assert (= (and b!835573 res!568438) b!835576))

(assert (= (and b!835576 res!568440) b!835575))

(assert (= (and b!835575 c!90962) b!835572))

(assert (= (and b!835575 (not c!90962)) b!835571))

(assert (= (or b!835572 b!835571) bm!36670))

(assert (= (or b!835572 b!835571) bm!36671))

(declare-fun m!780765 () Bool)

(assert (=> b!835576 m!780765))

(declare-fun m!780767 () Bool)

(assert (=> b!835576 m!780767))

(declare-fun m!780769 () Bool)

(assert (=> b!835576 m!780769))

(declare-fun m!780771 () Bool)

(assert (=> b!835574 m!780771))

(assert (=> b!835574 m!780771))

(declare-fun m!780773 () Bool)

(assert (=> b!835574 m!780773))

(declare-fun m!780775 () Bool)

(assert (=> b!835577 m!780775))

(declare-fun m!780777 () Bool)

(assert (=> b!835572 m!780777))

(declare-fun m!780779 () Bool)

(assert (=> b!835572 m!780779))

(declare-fun m!780781 () Bool)

(assert (=> b!835575 m!780781))

(assert (=> b!835575 m!780781))

(declare-fun m!780783 () Bool)

(assert (=> b!835575 m!780783))

(declare-fun m!780785 () Bool)

(assert (=> bm!36671 m!780785))

(declare-fun m!780787 () Bool)

(assert (=> b!835571 m!780787))

(declare-fun m!780789 () Bool)

(assert (=> b!835571 m!780789))

(declare-fun m!780791 () Bool)

(assert (=> start!71908 m!780791))

(declare-fun m!780793 () Bool)

(assert (=> bm!36670 m!780793))

(push 1)

