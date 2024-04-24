; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104712 () Bool)

(assert start!104712)

(declare-fun b!1248012 () Bool)

(declare-fun e!707937 () Bool)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> b!1248012 (= e!707937 (bvsge (bvsub newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270)) (bvsub newFrom!287 from!3270)))))

(declare-fun b!1248013 () Bool)

(declare-datatypes ((Unit!41420 0))(
  ( (Unit!41421) )
))
(declare-fun e!707938 () Unit!41420)

(declare-fun Unit!41422 () Unit!41420)

(assert (=> b!1248013 (= e!707938 Unit!41422)))

(declare-fun res!832474 () Bool)

(declare-fun e!707940 () Bool)

(assert (=> start!104712 (=> (not res!832474) (not e!707940))))

(declare-datatypes ((array!80292 0))(
  ( (array!80293 (arr!38717 (Array (_ BitVec 32) (_ BitVec 64))) (size!39254 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80292)

(assert (=> start!104712 (= res!832474 (and (bvslt (size!39254 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39254 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39254 a!3892))))))

(assert (=> start!104712 e!707940))

(declare-fun array_inv!29655 (array!80292) Bool)

(assert (=> start!104712 (array_inv!29655 a!3892)))

(assert (=> start!104712 true))

(declare-fun b!1248014 () Bool)

(assert (=> b!1248014 (= e!707940 e!707937)))

(declare-fun res!832477 () Bool)

(assert (=> b!1248014 (=> (not res!832477) (not e!707937))))

(assert (=> b!1248014 (= res!832477 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvsge newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun lt!563652 () Unit!41420)

(assert (=> b!1248014 (= lt!563652 e!707938)))

(declare-fun c!122461 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1248014 (= c!122461 (validKeyInArray!0 (select (arr!38717 a!3892) from!3270)))))

(declare-fun b!1248015 () Bool)

(declare-fun res!832475 () Bool)

(assert (=> b!1248015 (=> (not res!832475) (not e!707937))))

(declare-datatypes ((List!27533 0))(
  ( (Nil!27530) (Cons!27529 (h!28747 (_ BitVec 64)) (t!40994 List!27533)) )
))
(declare-fun arrayNoDuplicates!0 (array!80292 (_ BitVec 32) List!27533) Bool)

(assert (=> b!1248015 (= res!832475 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27530))))

(declare-fun b!1248016 () Bool)

(declare-fun res!832478 () Bool)

(assert (=> b!1248016 (=> (not res!832478) (not e!707940))))

(assert (=> b!1248016 (= res!832478 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27530))))

(declare-fun b!1248017 () Bool)

(declare-fun lt!563653 () Unit!41420)

(assert (=> b!1248017 (= e!707938 lt!563653)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80292 List!27533 List!27533 (_ BitVec 32)) Unit!41420)

(assert (=> b!1248017 (= lt!563653 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27529 (select (arr!38717 a!3892) from!3270) Nil!27530) Nil!27530 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> b!1248017 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27530)))

(declare-fun b!1248018 () Bool)

(declare-fun res!832476 () Bool)

(assert (=> b!1248018 (=> (not res!832476) (not e!707940))))

(assert (=> b!1248018 (= res!832476 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39254 a!3892)) (not (= newFrom!287 (size!39254 a!3892)))))))

(assert (= (and start!104712 res!832474) b!1248016))

(assert (= (and b!1248016 res!832478) b!1248018))

(assert (= (and b!1248018 res!832476) b!1248014))

(assert (= (and b!1248014 c!122461) b!1248017))

(assert (= (and b!1248014 (not c!122461)) b!1248013))

(assert (= (and b!1248014 res!832477) b!1248015))

(assert (= (and b!1248015 res!832475) b!1248012))

(declare-fun m!1150083 () Bool)

(assert (=> b!1248017 m!1150083))

(declare-fun m!1150085 () Bool)

(assert (=> b!1248017 m!1150085))

(declare-fun m!1150087 () Bool)

(assert (=> b!1248017 m!1150087))

(declare-fun m!1150089 () Bool)

(assert (=> start!104712 m!1150089))

(assert (=> b!1248014 m!1150083))

(assert (=> b!1248014 m!1150083))

(declare-fun m!1150091 () Bool)

(assert (=> b!1248014 m!1150091))

(declare-fun m!1150093 () Bool)

(assert (=> b!1248016 m!1150093))

(assert (=> b!1248015 m!1150087))

(check-sat (not start!104712) (not b!1248014) (not b!1248016) (not b!1248017) (not b!1248015))
(check-sat)
