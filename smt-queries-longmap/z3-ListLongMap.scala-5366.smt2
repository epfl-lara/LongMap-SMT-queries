; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71960 () Bool)

(assert start!71960)

(declare-datatypes ((array!46707 0))(
  ( (array!46708 (arr!22383 (Array (_ BitVec 32) (_ BitVec 64))) (size!22803 (_ BitVec 32))) )
))
(declare-fun lt!379418 () array!46707)

(declare-fun bm!36589 () Bool)

(declare-fun call!36592 () (_ BitVec 32))

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46707 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!36589 (= call!36592 (arrayCountValidKeys!0 lt!379418 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835319 () Bool)

(declare-fun res!567765 () Bool)

(declare-fun e!466126 () Bool)

(assert (=> b!835319 (=> (not res!567765) (not e!466126))))

(declare-fun a!4227 () array!46707)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835319 (= res!567765 (not (validKeyInArray!0 (select (arr!22383 a!4227) i!1466))))))

(declare-fun b!835320 () Bool)

(declare-fun e!466124 () Bool)

(assert (=> b!835320 (= e!466124 false)))

(declare-fun lt!379413 () (_ BitVec 32))

(assert (=> b!835320 (= lt!379413 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun lt!379409 () (_ BitVec 32))

(assert (=> b!835320 (= lt!379409 (arrayCountValidKeys!0 lt!379418 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835321 () Bool)

(declare-fun res!567763 () Bool)

(assert (=> b!835321 (=> (not res!567763) (not e!466126))))

(assert (=> b!835321 (= res!567763 (and (bvslt (size!22803 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22803 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun res!567760 () Bool)

(assert (=> start!71960 (=> (not res!567760) (not e!466126))))

(assert (=> start!71960 (= res!567760 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22803 a!4227))))))

(assert (=> start!71960 e!466126))

(assert (=> start!71960 true))

(declare-fun array_inv!17869 (array!46707) Bool)

(assert (=> start!71960 (array_inv!17869 a!4227)))

(declare-fun b!835322 () Bool)

(declare-fun e!466123 () Bool)

(assert (=> b!835322 (= e!466126 e!466123)))

(declare-fun res!567761 () Bool)

(assert (=> b!835322 (=> (not res!567761) (not e!466123))))

(declare-fun lt!379412 () (_ BitVec 32))

(declare-fun lt!379414 () (_ BitVec 32))

(assert (=> b!835322 (= res!567761 (and (= lt!379412 lt!379414) (not (= to!390 (size!22803 a!4227)))))))

(assert (=> b!835322 (= lt!379414 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835322 (= lt!379412 (arrayCountValidKeys!0 lt!379418 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun k0!2968 () (_ BitVec 64))

(assert (=> b!835322 (= lt!379418 (array!46708 (store (arr!22383 a!4227) i!1466 k0!2968) (size!22803 a!4227)))))

(declare-fun b!835323 () Bool)

(assert (=> b!835323 (= e!466123 e!466124)))

(declare-fun res!567764 () Bool)

(assert (=> b!835323 (=> (not res!567764) (not e!466124))))

(assert (=> b!835323 (= res!567764 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22803 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-datatypes ((Unit!28678 0))(
  ( (Unit!28679) )
))
(declare-fun lt!379416 () Unit!28678)

(declare-fun e!466125 () Unit!28678)

(assert (=> b!835323 (= lt!379416 e!466125)))

(declare-fun c!91178 () Bool)

(assert (=> b!835323 (= c!91178 (validKeyInArray!0 (select (arr!22383 a!4227) to!390)))))

(declare-fun b!835324 () Bool)

(declare-fun lt!379411 () Unit!28678)

(assert (=> b!835324 (= e!466125 lt!379411)))

(declare-fun lt!379417 () Unit!28678)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46707 (_ BitVec 32) (_ BitVec 32)) Unit!28678)

(assert (=> b!835324 (= lt!379417 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36593 () (_ BitVec 32))

(assert (=> b!835324 (= call!36593 lt!379414)))

(assert (=> b!835324 (= lt!379411 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!379418 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835324 (= call!36592 lt!379412)))

(declare-fun bm!36590 () Bool)

(assert (=> bm!36590 (= call!36593 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835325 () Bool)

(declare-fun lt!379415 () Unit!28678)

(assert (=> b!835325 (= e!466125 lt!379415)))

(declare-fun lt!379410 () Unit!28678)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46707 (_ BitVec 32) (_ BitVec 32)) Unit!28678)

(assert (=> b!835325 (= lt!379410 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835325 (= call!36593 (bvadd #b00000000000000000000000000000001 lt!379414))))

(assert (=> b!835325 (= lt!379415 (lemmaValidKeyIncreasesNumOfKeys!0 lt!379418 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835325 (= call!36592 (bvadd #b00000000000000000000000000000001 lt!379412))))

(declare-fun b!835326 () Bool)

(declare-fun res!567762 () Bool)

(assert (=> b!835326 (=> (not res!567762) (not e!466126))))

(assert (=> b!835326 (= res!567762 (validKeyInArray!0 k0!2968))))

(assert (= (and start!71960 res!567760) b!835319))

(assert (= (and b!835319 res!567765) b!835326))

(assert (= (and b!835326 res!567762) b!835321))

(assert (= (and b!835321 res!567763) b!835322))

(assert (= (and b!835322 res!567761) b!835323))

(assert (= (and b!835323 c!91178) b!835325))

(assert (= (and b!835323 (not c!91178)) b!835324))

(assert (= (or b!835325 b!835324) bm!36589))

(assert (= (or b!835325 b!835324) bm!36590))

(assert (= (and b!835323 res!567764) b!835320))

(declare-fun m!780705 () Bool)

(assert (=> b!835326 m!780705))

(declare-fun m!780707 () Bool)

(assert (=> b!835324 m!780707))

(declare-fun m!780709 () Bool)

(assert (=> b!835324 m!780709))

(declare-fun m!780711 () Bool)

(assert (=> bm!36589 m!780711))

(declare-fun m!780713 () Bool)

(assert (=> b!835325 m!780713))

(declare-fun m!780715 () Bool)

(assert (=> b!835325 m!780715))

(declare-fun m!780717 () Bool)

(assert (=> b!835323 m!780717))

(assert (=> b!835323 m!780717))

(declare-fun m!780719 () Bool)

(assert (=> b!835323 m!780719))

(declare-fun m!780721 () Bool)

(assert (=> start!71960 m!780721))

(declare-fun m!780723 () Bool)

(assert (=> b!835320 m!780723))

(assert (=> b!835320 m!780711))

(declare-fun m!780725 () Bool)

(assert (=> b!835322 m!780725))

(declare-fun m!780727 () Bool)

(assert (=> b!835322 m!780727))

(declare-fun m!780729 () Bool)

(assert (=> b!835322 m!780729))

(declare-fun m!780731 () Bool)

(assert (=> b!835319 m!780731))

(assert (=> b!835319 m!780731))

(declare-fun m!780733 () Bool)

(assert (=> b!835319 m!780733))

(assert (=> bm!36590 m!780723))

(check-sat (not b!835322) (not b!835323) (not b!835324) (not b!835325) (not start!71960) (not bm!36589) (not b!835319) (not b!835326) (not b!835320) (not bm!36590))
(check-sat)
