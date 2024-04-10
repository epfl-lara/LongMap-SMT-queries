; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104436 () Bool)

(assert start!104436)

(declare-fun b!1246424 () Bool)

(declare-fun res!831780 () Bool)

(declare-fun e!706905 () Bool)

(assert (=> b!1246424 (=> (not res!831780) (not e!706905))))

(declare-datatypes ((array!80228 0))(
  ( (array!80229 (arr!38691 (Array (_ BitVec 32) (_ BitVec 64))) (size!39227 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80228)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> b!1246424 (= res!831780 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39227 a!3892)) (not (= newFrom!287 (size!39227 a!3892)))))))

(declare-fun b!1246425 () Bool)

(declare-fun res!831779 () Bool)

(assert (=> b!1246425 (=> (not res!831779) (not e!706905))))

(declare-datatypes ((List!27494 0))(
  ( (Nil!27491) (Cons!27490 (h!28699 (_ BitVec 64)) (t!40963 List!27494)) )
))
(declare-fun arrayNoDuplicates!0 (array!80228 (_ BitVec 32) List!27494) Bool)

(assert (=> b!1246425 (= res!831779 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27491))))

(declare-fun res!831781 () Bool)

(assert (=> start!104436 (=> (not res!831781) (not e!706905))))

(assert (=> start!104436 (= res!831781 (and (bvslt (size!39227 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39227 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39227 a!3892))))))

(assert (=> start!104436 e!706905))

(declare-fun array_inv!29539 (array!80228) Bool)

(assert (=> start!104436 (array_inv!29539 a!3892)))

(assert (=> start!104436 true))

(declare-fun b!1246426 () Bool)

(declare-datatypes ((Unit!41405 0))(
  ( (Unit!41406) )
))
(declare-fun e!706906 () Unit!41405)

(declare-fun Unit!41407 () Unit!41405)

(assert (=> b!1246426 (= e!706906 Unit!41407)))

(declare-fun b!1246427 () Bool)

(declare-fun lt!563076 () Unit!41405)

(assert (=> b!1246427 (= e!706906 lt!563076)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80228 List!27494 List!27494 (_ BitVec 32)) Unit!41405)

(assert (=> b!1246427 (= lt!563076 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27490 (select (arr!38691 a!3892) from!3270) Nil!27491) Nil!27491 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> b!1246427 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27491)))

(declare-fun b!1246428 () Bool)

(assert (=> b!1246428 (= e!706905 false)))

(declare-fun lt!563075 () Unit!41405)

(assert (=> b!1246428 (= lt!563075 e!706906)))

(declare-fun c!122007 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1246428 (= c!122007 (validKeyInArray!0 (select (arr!38691 a!3892) from!3270)))))

(assert (= (and start!104436 res!831781) b!1246425))

(assert (= (and b!1246425 res!831779) b!1246424))

(assert (= (and b!1246424 res!831780) b!1246428))

(assert (= (and b!1246428 c!122007) b!1246427))

(assert (= (and b!1246428 (not c!122007)) b!1246426))

(declare-fun m!1148261 () Bool)

(assert (=> b!1246425 m!1148261))

(declare-fun m!1148263 () Bool)

(assert (=> start!104436 m!1148263))

(declare-fun m!1148265 () Bool)

(assert (=> b!1246427 m!1148265))

(declare-fun m!1148267 () Bool)

(assert (=> b!1246427 m!1148267))

(declare-fun m!1148269 () Bool)

(assert (=> b!1246427 m!1148269))

(assert (=> b!1246428 m!1148265))

(assert (=> b!1246428 m!1148265))

(declare-fun m!1148271 () Bool)

(assert (=> b!1246428 m!1148271))

(check-sat (not start!104436) (not b!1246425) (not b!1246427) (not b!1246428))
