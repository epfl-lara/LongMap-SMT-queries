; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71966 () Bool)

(assert start!71966)

(declare-fun b!835391 () Bool)

(declare-fun e!466168 () Bool)

(declare-fun e!466170 () Bool)

(assert (=> b!835391 (= e!466168 e!466170)))

(declare-fun res!567818 () Bool)

(assert (=> b!835391 (=> (not res!567818) (not e!466170))))

(declare-datatypes ((array!46713 0))(
  ( (array!46714 (arr!22386 (Array (_ BitVec 32) (_ BitVec 64))) (size!22806 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46713)

(declare-fun lt!379503 () (_ BitVec 32))

(declare-fun lt!379506 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!835391 (= res!567818 (and (= lt!379506 lt!379503) (not (= to!390 (size!22806 a!4227)))))))

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46713 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!835391 (= lt!379503 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!379502 () array!46713)

(assert (=> b!835391 (= lt!379506 (arrayCountValidKeys!0 lt!379502 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun k0!2968 () (_ BitVec 64))

(assert (=> b!835391 (= lt!379502 (array!46714 (store (arr!22386 a!4227) i!1466 k0!2968) (size!22806 a!4227)))))

(declare-fun b!835392 () Bool)

(declare-datatypes ((Unit!28684 0))(
  ( (Unit!28685) )
))
(declare-fun e!466167 () Unit!28684)

(declare-fun lt!379501 () Unit!28684)

(assert (=> b!835392 (= e!466167 lt!379501)))

(declare-fun lt!379508 () Unit!28684)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46713 (_ BitVec 32) (_ BitVec 32)) Unit!28684)

(assert (=> b!835392 (= lt!379508 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36610 () (_ BitVec 32))

(assert (=> b!835392 (= call!36610 lt!379503)))

(assert (=> b!835392 (= lt!379501 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!379502 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36611 () (_ BitVec 32))

(assert (=> b!835392 (= call!36611 lt!379506)))

(declare-fun b!835393 () Bool)

(declare-fun lt!379500 () Unit!28684)

(assert (=> b!835393 (= e!466167 lt!379500)))

(declare-fun lt!379499 () Unit!28684)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46713 (_ BitVec 32) (_ BitVec 32)) Unit!28684)

(assert (=> b!835393 (= lt!379499 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835393 (= call!36610 (bvadd #b00000000000000000000000000000001 lt!379503))))

(assert (=> b!835393 (= lt!379500 (lemmaValidKeyIncreasesNumOfKeys!0 lt!379502 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835393 (= call!36611 (bvadd #b00000000000000000000000000000001 lt!379506))))

(declare-fun b!835394 () Bool)

(declare-fun res!567815 () Bool)

(assert (=> b!835394 (=> (not res!567815) (not e!466168))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835394 (= res!567815 (not (validKeyInArray!0 (select (arr!22386 a!4227) i!1466))))))

(declare-fun b!835395 () Bool)

(declare-fun e!466171 () Bool)

(assert (=> b!835395 (= e!466171 false)))

(declare-fun lt!379504 () (_ BitVec 32))

(assert (=> b!835395 (= lt!379504 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun lt!379507 () (_ BitVec 32))

(assert (=> b!835395 (= lt!379507 (arrayCountValidKeys!0 lt!379502 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun bm!36607 () Bool)

(assert (=> bm!36607 (= call!36610 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun res!567817 () Bool)

(assert (=> start!71966 (=> (not res!567817) (not e!466168))))

(assert (=> start!71966 (= res!567817 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22806 a!4227))))))

(assert (=> start!71966 e!466168))

(assert (=> start!71966 true))

(declare-fun array_inv!17872 (array!46713) Bool)

(assert (=> start!71966 (array_inv!17872 a!4227)))

(declare-fun b!835396 () Bool)

(declare-fun res!567814 () Bool)

(assert (=> b!835396 (=> (not res!567814) (not e!466168))))

(assert (=> b!835396 (= res!567814 (and (bvslt (size!22806 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22806 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!835397 () Bool)

(assert (=> b!835397 (= e!466170 e!466171)))

(declare-fun res!567819 () Bool)

(assert (=> b!835397 (=> (not res!567819) (not e!466171))))

(assert (=> b!835397 (= res!567819 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22806 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-fun lt!379505 () Unit!28684)

(assert (=> b!835397 (= lt!379505 e!466167)))

(declare-fun c!91187 () Bool)

(assert (=> b!835397 (= c!91187 (validKeyInArray!0 (select (arr!22386 a!4227) to!390)))))

(declare-fun b!835398 () Bool)

(declare-fun res!567816 () Bool)

(assert (=> b!835398 (=> (not res!567816) (not e!466168))))

(assert (=> b!835398 (= res!567816 (validKeyInArray!0 k0!2968))))

(declare-fun bm!36608 () Bool)

(assert (=> bm!36608 (= call!36611 (arrayCountValidKeys!0 lt!379502 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(assert (= (and start!71966 res!567817) b!835394))

(assert (= (and b!835394 res!567815) b!835398))

(assert (= (and b!835398 res!567816) b!835396))

(assert (= (and b!835396 res!567814) b!835391))

(assert (= (and b!835391 res!567818) b!835397))

(assert (= (and b!835397 c!91187) b!835393))

(assert (= (and b!835397 (not c!91187)) b!835392))

(assert (= (or b!835393 b!835392) bm!36608))

(assert (= (or b!835393 b!835392) bm!36607))

(assert (= (and b!835397 res!567819) b!835395))

(declare-fun m!780799 () Bool)

(assert (=> bm!36608 m!780799))

(declare-fun m!780801 () Bool)

(assert (=> start!71966 m!780801))

(declare-fun m!780803 () Bool)

(assert (=> b!835397 m!780803))

(assert (=> b!835397 m!780803))

(declare-fun m!780805 () Bool)

(assert (=> b!835397 m!780805))

(declare-fun m!780807 () Bool)

(assert (=> bm!36607 m!780807))

(declare-fun m!780809 () Bool)

(assert (=> b!835391 m!780809))

(declare-fun m!780811 () Bool)

(assert (=> b!835391 m!780811))

(declare-fun m!780813 () Bool)

(assert (=> b!835391 m!780813))

(declare-fun m!780815 () Bool)

(assert (=> b!835392 m!780815))

(declare-fun m!780817 () Bool)

(assert (=> b!835392 m!780817))

(assert (=> b!835395 m!780807))

(assert (=> b!835395 m!780799))

(declare-fun m!780819 () Bool)

(assert (=> b!835393 m!780819))

(declare-fun m!780821 () Bool)

(assert (=> b!835393 m!780821))

(declare-fun m!780823 () Bool)

(assert (=> b!835394 m!780823))

(assert (=> b!835394 m!780823))

(declare-fun m!780825 () Bool)

(assert (=> b!835394 m!780825))

(declare-fun m!780827 () Bool)

(assert (=> b!835398 m!780827))

(check-sat (not b!835393) (not start!71966) (not b!835397) (not b!835395) (not b!835392) (not b!835391) (not b!835394) (not bm!36607) (not b!835398) (not bm!36608))
(check-sat)
