; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103960 () Bool)

(assert start!103960)

(declare-fun b!1244333 () Bool)

(declare-datatypes ((Unit!41363 0))(
  ( (Unit!41364) )
))
(declare-fun e!705295 () Unit!41363)

(declare-fun Unit!41365 () Unit!41363)

(assert (=> b!1244333 (= e!705295 Unit!41365)))

(declare-fun res!830011 () Bool)

(declare-fun e!705296 () Bool)

(assert (=> start!103960 (=> (not res!830011) (not e!705296))))

(declare-datatypes ((array!80052 0))(
  ( (array!80053 (arr!38619 (Array (_ BitVec 32) (_ BitVec 64))) (size!39155 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80052)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!103960 (= res!830011 (and (bvslt (size!39155 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39155 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39155 a!3892))))))

(assert (=> start!103960 e!705296))

(declare-fun array_inv!29467 (array!80052) Bool)

(assert (=> start!103960 (array_inv!29467 a!3892)))

(assert (=> start!103960 true))

(declare-fun b!1244334 () Bool)

(declare-fun e!705297 () Bool)

(assert (=> b!1244334 (= e!705297 (not (bvsge newFrom!287 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!27422 0))(
  ( (Nil!27419) (Cons!27418 (h!28627 (_ BitVec 64)) (t!40891 List!27422)) )
))
(declare-fun arrayNoDuplicates!0 (array!80052 (_ BitVec 32) List!27422) Bool)

(assert (=> b!1244334 (arrayNoDuplicates!0 a!3892 newFrom!287 Nil!27419)))

(declare-fun lt!562698 () Unit!41363)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!80052 (_ BitVec 32) (_ BitVec 32)) Unit!41363)

(assert (=> b!1244334 (= lt!562698 (lemmaNoDuplicateFromThenFromBigger!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) newFrom!287))))

(declare-fun b!1244335 () Bool)

(declare-fun res!830013 () Bool)

(assert (=> b!1244335 (=> (not res!830013) (not e!705296))))

(assert (=> b!1244335 (= res!830013 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27419))))

(declare-fun b!1244336 () Bool)

(declare-fun res!830010 () Bool)

(assert (=> b!1244336 (=> (not res!830010) (not e!705296))))

(assert (=> b!1244336 (= res!830010 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39155 a!3892)) (not (= newFrom!287 (size!39155 a!3892)))))))

(declare-fun b!1244337 () Bool)

(declare-fun res!830014 () Bool)

(assert (=> b!1244337 (=> (not res!830014) (not e!705297))))

(assert (=> b!1244337 (= res!830014 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27419))))

(declare-fun b!1244338 () Bool)

(declare-fun lt!562700 () Unit!41363)

(assert (=> b!1244338 (= e!705295 lt!562700)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80052 List!27422 List!27422 (_ BitVec 32)) Unit!41363)

(assert (=> b!1244338 (= lt!562700 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27418 (select (arr!38619 a!3892) from!3270) Nil!27419) Nil!27419 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> b!1244338 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27419)))

(declare-fun b!1244339 () Bool)

(assert (=> b!1244339 (= e!705296 e!705297)))

(declare-fun res!830012 () Bool)

(assert (=> b!1244339 (=> (not res!830012) (not e!705297))))

(assert (=> b!1244339 (= res!830012 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvsge newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun lt!562699 () Unit!41363)

(assert (=> b!1244339 (= lt!562699 e!705295)))

(declare-fun c!121846 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1244339 (= c!121846 (validKeyInArray!0 (select (arr!38619 a!3892) from!3270)))))

(assert (= (and start!103960 res!830011) b!1244335))

(assert (= (and b!1244335 res!830013) b!1244336))

(assert (= (and b!1244336 res!830010) b!1244339))

(assert (= (and b!1244339 c!121846) b!1244338))

(assert (= (and b!1244339 (not c!121846)) b!1244333))

(assert (= (and b!1244339 res!830012) b!1244337))

(assert (= (and b!1244337 res!830014) b!1244334))

(declare-fun m!1146639 () Bool)

(assert (=> b!1244338 m!1146639))

(declare-fun m!1146641 () Bool)

(assert (=> b!1244338 m!1146641))

(declare-fun m!1146643 () Bool)

(assert (=> b!1244338 m!1146643))

(assert (=> b!1244337 m!1146643))

(declare-fun m!1146645 () Bool)

(assert (=> start!103960 m!1146645))

(declare-fun m!1146647 () Bool)

(assert (=> b!1244334 m!1146647))

(declare-fun m!1146649 () Bool)

(assert (=> b!1244334 m!1146649))

(assert (=> b!1244339 m!1146639))

(assert (=> b!1244339 m!1146639))

(declare-fun m!1146651 () Bool)

(assert (=> b!1244339 m!1146651))

(declare-fun m!1146653 () Bool)

(assert (=> b!1244335 m!1146653))

(check-sat (not b!1244339) (not b!1244337) (not start!103960) (not b!1244334) (not b!1244338) (not b!1244335))
(check-sat)
