; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60176 () Bool)

(assert start!60176)

(declare-fun b!672496 () Bool)

(declare-fun res!439121 () Bool)

(declare-fun e!384171 () Bool)

(assert (=> b!672496 (=> (not res!439121) (not e!384171))))

(declare-datatypes ((List!12845 0))(
  ( (Nil!12842) (Cons!12841 (h!13886 (_ BitVec 64)) (t!19073 List!12845)) )
))
(declare-fun acc!681 () List!12845)

(declare-fun contains!3422 (List!12845 (_ BitVec 64)) Bool)

(assert (=> b!672496 (= res!439121 (not (contains!3422 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672497 () Bool)

(declare-fun e!384167 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!672497 (= e!384167 (not (contains!3422 acc!681 k!2843)))))

(declare-fun b!672498 () Bool)

(declare-fun res!439132 () Bool)

(declare-fun e!384164 () Bool)

(assert (=> b!672498 (=> (not res!439132) (not e!384164))))

(declare-fun lt!312320 () List!12845)

(assert (=> b!672498 (= res!439132 (not (contains!3422 lt!312320 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672499 () Bool)

(declare-fun e!384166 () Bool)

(assert (=> b!672499 (= e!384166 e!384167)))

(declare-fun res!439135 () Bool)

(assert (=> b!672499 (=> (not res!439135) (not e!384167))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!672499 (= res!439135 (bvsle from!3004 i!1382))))

(declare-fun b!672500 () Bool)

(declare-fun res!439117 () Bool)

(assert (=> b!672500 (=> (not res!439117) (not e!384164))))

(assert (=> b!672500 (= res!439117 (not (contains!3422 lt!312320 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672502 () Bool)

(declare-fun res!439120 () Bool)

(assert (=> b!672502 (=> (not res!439120) (not e!384171))))

(assert (=> b!672502 (= res!439120 (not (contains!3422 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672503 () Bool)

(declare-datatypes ((Unit!23628 0))(
  ( (Unit!23629) )
))
(declare-fun e!384170 () Unit!23628)

(declare-fun Unit!23630 () Unit!23628)

(assert (=> b!672503 (= e!384170 Unit!23630)))

(declare-datatypes ((array!39223 0))(
  ( (array!39224 (arr!18804 (Array (_ BitVec 32) (_ BitVec 64))) (size!19168 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39223)

(declare-fun arrayContainsKey!0 (array!39223 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!672503 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!312322 () Unit!23628)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39223 (_ BitVec 64) (_ BitVec 32)) Unit!23628)

(assert (=> b!672503 (= lt!312322 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!672503 false))

(declare-fun b!672504 () Bool)

(declare-fun res!439138 () Bool)

(assert (=> b!672504 (=> (not res!439138) (not e!384171))))

(assert (=> b!672504 (= res!439138 e!384166)))

(declare-fun res!439130 () Bool)

(assert (=> b!672504 (=> res!439130 e!384166)))

(declare-fun e!384165 () Bool)

(assert (=> b!672504 (= res!439130 e!384165)))

(declare-fun res!439127 () Bool)

(assert (=> b!672504 (=> (not res!439127) (not e!384165))))

(assert (=> b!672504 (= res!439127 (bvsgt from!3004 i!1382))))

(declare-fun b!672505 () Bool)

(declare-fun e!384169 () Bool)

(declare-fun e!384174 () Bool)

(assert (=> b!672505 (= e!384169 e!384174)))

(declare-fun res!439119 () Bool)

(assert (=> b!672505 (=> (not res!439119) (not e!384174))))

(assert (=> b!672505 (= res!439119 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!672506 () Bool)

(assert (=> b!672506 (= e!384164 false)))

(declare-fun lt!312321 () Bool)

(declare-fun arrayNoDuplicates!0 (array!39223 (_ BitVec 32) List!12845) Bool)

(assert (=> b!672506 (= lt!312321 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312320))))

(declare-fun b!672507 () Bool)

(declare-fun res!439118 () Bool)

(assert (=> b!672507 (=> (not res!439118) (not e!384171))))

(assert (=> b!672507 (= res!439118 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19168 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!672508 () Bool)

(declare-fun res!439126 () Bool)

(assert (=> b!672508 (=> (not res!439126) (not e!384171))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!672508 (= res!439126 (validKeyInArray!0 k!2843))))

(declare-fun b!672509 () Bool)

(declare-fun e!384173 () Bool)

(assert (=> b!672509 (= e!384173 (contains!3422 lt!312320 k!2843))))

(declare-fun b!672510 () Bool)

(declare-fun res!439133 () Bool)

(assert (=> b!672510 (=> (not res!439133) (not e!384171))))

(assert (=> b!672510 (= res!439133 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12842))))

(declare-fun b!672511 () Bool)

(declare-fun e!384168 () Bool)

(assert (=> b!672511 (= e!384168 e!384164)))

(declare-fun res!439116 () Bool)

(assert (=> b!672511 (=> (not res!439116) (not e!384164))))

(assert (=> b!672511 (= res!439116 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!272 (List!12845 (_ BitVec 64)) List!12845)

(assert (=> b!672511 (= lt!312320 ($colon$colon!272 acc!681 (select (arr!18804 a!3626) from!3004)))))

(declare-fun b!672512 () Bool)

(declare-fun res!439137 () Bool)

(assert (=> b!672512 (=> (not res!439137) (not e!384171))))

(assert (=> b!672512 (= res!439137 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!672513 () Bool)

(declare-fun res!439136 () Bool)

(assert (=> b!672513 (=> (not res!439136) (not e!384164))))

(declare-fun noDuplicate!669 (List!12845) Bool)

(assert (=> b!672513 (= res!439136 (noDuplicate!669 lt!312320))))

(declare-fun b!672514 () Bool)

(declare-fun res!439139 () Bool)

(assert (=> b!672514 (=> (not res!439139) (not e!384171))))

(assert (=> b!672514 (= res!439139 (noDuplicate!669 acc!681))))

(declare-fun b!672515 () Bool)

(assert (=> b!672515 (= e!384165 (contains!3422 acc!681 k!2843))))

(declare-fun b!672516 () Bool)

(assert (=> b!672516 (= e!384174 (not (contains!3422 lt!312320 k!2843)))))

(declare-fun b!672517 () Bool)

(assert (=> b!672517 (= e!384171 e!384168)))

(declare-fun res!439124 () Bool)

(assert (=> b!672517 (=> (not res!439124) (not e!384168))))

(assert (=> b!672517 (= res!439124 (not (= (select (arr!18804 a!3626) from!3004) k!2843)))))

(declare-fun lt!312319 () Unit!23628)

(assert (=> b!672517 (= lt!312319 e!384170)))

(declare-fun c!77057 () Bool)

(assert (=> b!672517 (= c!77057 (= (select (arr!18804 a!3626) from!3004) k!2843))))

(declare-fun b!672501 () Bool)

(declare-fun res!439131 () Bool)

(assert (=> b!672501 (=> (not res!439131) (not e!384171))))

(assert (=> b!672501 (= res!439131 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19168 a!3626))))))

(declare-fun res!439134 () Bool)

(assert (=> start!60176 (=> (not res!439134) (not e!384171))))

(assert (=> start!60176 (= res!439134 (and (bvslt (size!19168 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19168 a!3626))))))

(assert (=> start!60176 e!384171))

(assert (=> start!60176 true))

(declare-fun array_inv!14600 (array!39223) Bool)

(assert (=> start!60176 (array_inv!14600 a!3626)))

(declare-fun b!672518 () Bool)

(declare-fun res!439123 () Bool)

(assert (=> b!672518 (=> (not res!439123) (not e!384171))))

(assert (=> b!672518 (= res!439123 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!672519 () Bool)

(declare-fun Unit!23631 () Unit!23628)

(assert (=> b!672519 (= e!384170 Unit!23631)))

(declare-fun b!672520 () Bool)

(declare-fun res!439128 () Bool)

(assert (=> b!672520 (=> (not res!439128) (not e!384171))))

(assert (=> b!672520 (= res!439128 (validKeyInArray!0 (select (arr!18804 a!3626) from!3004)))))

(declare-fun b!672521 () Bool)

(declare-fun res!439122 () Bool)

(assert (=> b!672521 (=> (not res!439122) (not e!384164))))

(assert (=> b!672521 (= res!439122 e!384169)))

(declare-fun res!439129 () Bool)

(assert (=> b!672521 (=> res!439129 e!384169)))

(assert (=> b!672521 (= res!439129 e!384173)))

(declare-fun res!439125 () Bool)

(assert (=> b!672521 (=> (not res!439125) (not e!384173))))

(assert (=> b!672521 (= res!439125 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(assert (= (and start!60176 res!439134) b!672514))

(assert (= (and b!672514 res!439139) b!672496))

(assert (= (and b!672496 res!439121) b!672502))

(assert (= (and b!672502 res!439120) b!672504))

(assert (= (and b!672504 res!439127) b!672515))

(assert (= (and b!672504 (not res!439130)) b!672499))

(assert (= (and b!672499 res!439135) b!672497))

(assert (= (and b!672504 res!439138) b!672510))

(assert (= (and b!672510 res!439133) b!672512))

(assert (= (and b!672512 res!439137) b!672501))

(assert (= (and b!672501 res!439131) b!672508))

(assert (= (and b!672508 res!439126) b!672518))

(assert (= (and b!672518 res!439123) b!672507))

(assert (= (and b!672507 res!439118) b!672520))

(assert (= (and b!672520 res!439128) b!672517))

(assert (= (and b!672517 c!77057) b!672503))

(assert (= (and b!672517 (not c!77057)) b!672519))

(assert (= (and b!672517 res!439124) b!672511))

(assert (= (and b!672511 res!439116) b!672513))

(assert (= (and b!672513 res!439136) b!672500))

(assert (= (and b!672500 res!439117) b!672498))

(assert (= (and b!672498 res!439132) b!672521))

(assert (= (and b!672521 res!439125) b!672509))

(assert (= (and b!672521 (not res!439129)) b!672505))

(assert (= (and b!672505 res!439119) b!672516))

(assert (= (and b!672521 res!439122) b!672506))

(declare-fun m!641429 () Bool)

(assert (=> b!672497 m!641429))

(declare-fun m!641431 () Bool)

(assert (=> b!672510 m!641431))

(declare-fun m!641433 () Bool)

(assert (=> b!672511 m!641433))

(assert (=> b!672511 m!641433))

(declare-fun m!641435 () Bool)

(assert (=> b!672511 m!641435))

(declare-fun m!641437 () Bool)

(assert (=> b!672514 m!641437))

(declare-fun m!641439 () Bool)

(assert (=> b!672508 m!641439))

(declare-fun m!641441 () Bool)

(assert (=> b!672513 m!641441))

(declare-fun m!641443 () Bool)

(assert (=> b!672500 m!641443))

(assert (=> b!672520 m!641433))

(assert (=> b!672520 m!641433))

(declare-fun m!641445 () Bool)

(assert (=> b!672520 m!641445))

(declare-fun m!641447 () Bool)

(assert (=> b!672498 m!641447))

(declare-fun m!641449 () Bool)

(assert (=> b!672506 m!641449))

(declare-fun m!641451 () Bool)

(assert (=> b!672518 m!641451))

(declare-fun m!641453 () Bool)

(assert (=> b!672509 m!641453))

(declare-fun m!641455 () Bool)

(assert (=> b!672512 m!641455))

(declare-fun m!641457 () Bool)

(assert (=> b!672502 m!641457))

(declare-fun m!641459 () Bool)

(assert (=> b!672496 m!641459))

(assert (=> b!672515 m!641429))

(declare-fun m!641461 () Bool)

(assert (=> b!672503 m!641461))

(declare-fun m!641463 () Bool)

(assert (=> b!672503 m!641463))

(assert (=> b!672516 m!641453))

(assert (=> b!672517 m!641433))

(declare-fun m!641465 () Bool)

(assert (=> start!60176 m!641465))

(push 1)

