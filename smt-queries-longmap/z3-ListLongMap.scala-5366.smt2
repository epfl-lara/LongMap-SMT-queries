; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71774 () Bool)

(assert start!71774)

(declare-fun b!834179 () Bool)

(declare-datatypes ((Unit!28613 0))(
  ( (Unit!28614) )
))
(declare-fun e!465395 () Unit!28613)

(declare-fun lt!378820 () Unit!28613)

(assert (=> b!834179 (= e!465395 lt!378820)))

(declare-datatypes ((array!46673 0))(
  ( (array!46674 (arr!22371 (Array (_ BitVec 32) (_ BitVec 64))) (size!22792 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46673)

(declare-fun lt!378814 () Unit!28613)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46673 (_ BitVec 32) (_ BitVec 32)) Unit!28613)

(assert (=> b!834179 (= lt!378814 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36522 () (_ BitVec 32))

(declare-fun lt!378813 () (_ BitVec 32))

(assert (=> b!834179 (= call!36522 lt!378813)))

(declare-fun lt!378815 () array!46673)

(assert (=> b!834179 (= lt!378820 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!378815 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36521 () (_ BitVec 32))

(declare-fun lt!378819 () (_ BitVec 32))

(assert (=> b!834179 (= call!36521 lt!378819)))

(declare-fun b!834180 () Bool)

(declare-fun res!567311 () Bool)

(declare-fun e!465397 () Bool)

(assert (=> b!834180 (=> (not res!567311) (not e!465397))))

(declare-fun k0!2968 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834180 (= res!567311 (validKeyInArray!0 k0!2968))))

(declare-fun bm!36518 () Bool)

(declare-fun arrayCountValidKeys!0 (array!46673 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!36518 (= call!36521 (arrayCountValidKeys!0 lt!378815 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834181 () Bool)

(declare-fun e!465394 () Bool)

(assert (=> b!834181 (= e!465397 e!465394)))

(declare-fun res!567313 () Bool)

(assert (=> b!834181 (=> (not res!567313) (not e!465394))))

(assert (=> b!834181 (= res!567313 (and (= lt!378819 lt!378813) (not (= to!390 (size!22792 a!4227)))))))

(assert (=> b!834181 (= lt!378813 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834181 (= lt!378819 (arrayCountValidKeys!0 lt!378815 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834181 (= lt!378815 (array!46674 (store (arr!22371 a!4227) i!1466 k0!2968) (size!22792 a!4227)))))

(declare-fun b!834182 () Bool)

(declare-fun res!567310 () Bool)

(assert (=> b!834182 (=> (not res!567310) (not e!465397))))

(assert (=> b!834182 (= res!567310 (and (bvslt (size!22792 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22792 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!834183 () Bool)

(declare-fun lt!378812 () Unit!28613)

(assert (=> b!834183 (= e!465395 lt!378812)))

(declare-fun lt!378817 () Unit!28613)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46673 (_ BitVec 32) (_ BitVec 32)) Unit!28613)

(assert (=> b!834183 (= lt!378817 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834183 (= call!36522 (bvadd #b00000000000000000000000000000001 lt!378813))))

(assert (=> b!834183 (= lt!378812 (lemmaValidKeyIncreasesNumOfKeys!0 lt!378815 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834183 (= call!36521 (bvadd #b00000000000000000000000000000001 lt!378819))))

(declare-fun res!567308 () Bool)

(assert (=> start!71774 (=> (not res!567308) (not e!465397))))

(assert (=> start!71774 (= res!567308 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22792 a!4227))))))

(assert (=> start!71774 e!465397))

(assert (=> start!71774 true))

(declare-fun array_inv!17883 (array!46673) Bool)

(assert (=> start!71774 (array_inv!17883 a!4227)))

(declare-fun bm!36519 () Bool)

(assert (=> bm!36519 (= call!36522 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834184 () Bool)

(declare-fun res!567312 () Bool)

(assert (=> b!834184 (=> (not res!567312) (not e!465397))))

(assert (=> b!834184 (= res!567312 (not (validKeyInArray!0 (select (arr!22371 a!4227) i!1466))))))

(declare-fun b!834185 () Bool)

(declare-fun e!465396 () Bool)

(assert (=> b!834185 (= e!465396 false)))

(declare-fun lt!378816 () (_ BitVec 32))

(assert (=> b!834185 (= lt!378816 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun lt!378821 () (_ BitVec 32))

(assert (=> b!834185 (= lt!378821 (arrayCountValidKeys!0 lt!378815 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834186 () Bool)

(assert (=> b!834186 (= e!465394 e!465396)))

(declare-fun res!567309 () Bool)

(assert (=> b!834186 (=> (not res!567309) (not e!465396))))

(assert (=> b!834186 (= res!567309 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22792 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-fun lt!378818 () Unit!28613)

(assert (=> b!834186 (= lt!378818 e!465395)))

(declare-fun c!90831 () Bool)

(assert (=> b!834186 (= c!90831 (validKeyInArray!0 (select (arr!22371 a!4227) to!390)))))

(assert (= (and start!71774 res!567308) b!834184))

(assert (= (and b!834184 res!567312) b!834180))

(assert (= (and b!834180 res!567311) b!834182))

(assert (= (and b!834182 res!567310) b!834181))

(assert (= (and b!834181 res!567313) b!834186))

(assert (= (and b!834186 c!90831) b!834183))

(assert (= (and b!834186 (not c!90831)) b!834179))

(assert (= (or b!834183 b!834179) bm!36518))

(assert (= (or b!834183 b!834179) bm!36519))

(assert (= (and b!834186 res!567309) b!834185))

(declare-fun m!778659 () Bool)

(assert (=> b!834180 m!778659))

(declare-fun m!778661 () Bool)

(assert (=> b!834179 m!778661))

(declare-fun m!778663 () Bool)

(assert (=> b!834179 m!778663))

(declare-fun m!778665 () Bool)

(assert (=> b!834184 m!778665))

(assert (=> b!834184 m!778665))

(declare-fun m!778667 () Bool)

(assert (=> b!834184 m!778667))

(declare-fun m!778669 () Bool)

(assert (=> bm!36518 m!778669))

(declare-fun m!778671 () Bool)

(assert (=> b!834183 m!778671))

(declare-fun m!778673 () Bool)

(assert (=> b!834183 m!778673))

(declare-fun m!778675 () Bool)

(assert (=> bm!36519 m!778675))

(declare-fun m!778677 () Bool)

(assert (=> b!834181 m!778677))

(declare-fun m!778679 () Bool)

(assert (=> b!834181 m!778679))

(declare-fun m!778681 () Bool)

(assert (=> b!834181 m!778681))

(declare-fun m!778683 () Bool)

(assert (=> start!71774 m!778683))

(declare-fun m!778685 () Bool)

(assert (=> b!834186 m!778685))

(assert (=> b!834186 m!778685))

(declare-fun m!778687 () Bool)

(assert (=> b!834186 m!778687))

(assert (=> b!834185 m!778675))

(assert (=> b!834185 m!778669))

(check-sat (not b!834180) (not start!71774) (not b!834181) (not bm!36519) (not b!834184) (not b!834183) (not b!834186) (not b!834179) (not b!834185) (not bm!36518))
(check-sat)
