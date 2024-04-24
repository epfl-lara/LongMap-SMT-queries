; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104164 () Bool)

(assert start!104164)

(declare-fun b!1245364 () Bool)

(declare-datatypes ((Unit!41288 0))(
  ( (Unit!41289) )
))
(declare-fun e!705968 () Unit!41288)

(declare-fun lt!563040 () Unit!41288)

(assert (=> b!1245364 (= e!705968 lt!563040)))

(declare-datatypes ((array!80055 0))(
  ( (array!80056 (arr!38615 (Array (_ BitVec 32) (_ BitVec 64))) (size!39152 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80055)

(declare-fun from!3270 () (_ BitVec 32))

(declare-datatypes ((List!27431 0))(
  ( (Nil!27428) (Cons!27427 (h!28645 (_ BitVec 64)) (t!40892 List!27431)) )
))
(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80055 List!27431 List!27431 (_ BitVec 32)) Unit!41288)

(assert (=> b!1245364 (= lt!563040 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27427 (select (arr!38615 a!3892) from!3270) Nil!27428) Nil!27428 (bvadd #b00000000000000000000000000000001 from!3270)))))

(declare-fun arrayNoDuplicates!0 (array!80055 (_ BitVec 32) List!27431) Bool)

(assert (=> b!1245364 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27428)))

(declare-fun b!1245365 () Bool)

(declare-fun res!830349 () Bool)

(declare-fun e!705967 () Bool)

(assert (=> b!1245365 (=> (not res!830349) (not e!705967))))

(assert (=> b!1245365 (= res!830349 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27428))))

(declare-fun b!1245366 () Bool)

(declare-fun res!830346 () Bool)

(assert (=> b!1245366 (=> (not res!830346) (not e!705967))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1245366 (= res!830346 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39152 a!3892)) (not (= newFrom!287 (size!39152 a!3892)))))))

(declare-fun b!1245368 () Bool)

(declare-fun Unit!41290 () Unit!41288)

(assert (=> b!1245368 (= e!705968 Unit!41290)))

(declare-fun b!1245369 () Bool)

(declare-fun e!705965 () Bool)

(assert (=> b!1245369 (= e!705965 false)))

(declare-fun lt!563041 () Bool)

(assert (=> b!1245369 (= lt!563041 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27428))))

(declare-fun res!830348 () Bool)

(assert (=> start!104164 (=> (not res!830348) (not e!705967))))

(assert (=> start!104164 (= res!830348 (and (bvslt (size!39152 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39152 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39152 a!3892))))))

(assert (=> start!104164 e!705967))

(declare-fun array_inv!29553 (array!80055) Bool)

(assert (=> start!104164 (array_inv!29553 a!3892)))

(assert (=> start!104164 true))

(declare-fun b!1245367 () Bool)

(assert (=> b!1245367 (= e!705967 e!705965)))

(declare-fun res!830347 () Bool)

(assert (=> b!1245367 (=> (not res!830347) (not e!705965))))

(assert (=> b!1245367 (= res!830347 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvsge newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun lt!563042 () Unit!41288)

(assert (=> b!1245367 (= lt!563042 e!705968)))

(declare-fun c!122201 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1245367 (= c!122201 (validKeyInArray!0 (select (arr!38615 a!3892) from!3270)))))

(assert (= (and start!104164 res!830348) b!1245365))

(assert (= (and b!1245365 res!830349) b!1245366))

(assert (= (and b!1245366 res!830346) b!1245367))

(assert (= (and b!1245367 c!122201) b!1245364))

(assert (= (and b!1245367 (not c!122201)) b!1245368))

(assert (= (and b!1245367 res!830347) b!1245369))

(declare-fun m!1148083 () Bool)

(assert (=> b!1245365 m!1148083))

(declare-fun m!1148085 () Bool)

(assert (=> b!1245364 m!1148085))

(declare-fun m!1148087 () Bool)

(assert (=> b!1245364 m!1148087))

(declare-fun m!1148089 () Bool)

(assert (=> b!1245364 m!1148089))

(declare-fun m!1148091 () Bool)

(assert (=> start!104164 m!1148091))

(assert (=> b!1245367 m!1148085))

(assert (=> b!1245367 m!1148085))

(declare-fun m!1148093 () Bool)

(assert (=> b!1245367 m!1148093))

(assert (=> b!1245369 m!1148089))

(check-sat (not b!1245369) (not b!1245364) (not start!104164) (not b!1245365) (not b!1245367))
(check-sat)
